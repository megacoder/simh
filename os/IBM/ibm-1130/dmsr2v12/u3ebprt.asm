                          HDNG    EBCDIC TO PRINTER CODE CONVERSION     U3A00010
                    *************************************************** U3A00020
                    *                                                 * U3A00030
                    *   SUBROUTINE NAME-                              * U3A00040
                    *      FULL NAME- EBCDIC TO PRINTER CODE CON-     * U3A00050
                    *         VERSION SUBROUTINE.                     * U3A00060
                    *      CODE NAME- EBPRT                           * U3A00070
                    *   PURPOSE- THIS SUBROUTINE CONVERTS EBCDIC,     * U3A00080
                    *      PACKED TWO CHARACTERS PER WORD, TO EITHER  * U3A00090
                    *      1053 OR 1443 PRINTER CODE, ALSO PACKED     * U3A00100
                    *      TWO CHARACTERS PER WORD.                   * U3A00110
                    *   METHOD-                                       * U3A00120
                    *      SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.    * U3A00130
                    *   CAPABILITIES AND LIMITATIONS-                 * U3A00140
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U3A00150
                    *   SPECIAL FEATURES. N/A                         * U3A00160
                    *   ADDITIONAL INFORMATION-                       * U3A00170
                    *      ESTIMATED EXECUTION TIME-                  * U3A00180
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL. * U3A00190
                    *************************************************** U3A00200
                          HDNG    EBCDIC TO PRINTER CODE CONVERSION     U3A00210
                          LIBR                                          U3A00220
                          ENT     EBPRT                                 U3A00230
                    EBPRT STX   1 SAV1+1    CALL ENTRY POINT            U3A00240
                    LINK  LDX  I1 *-*       LOADER STORES TV ADDR (+2)  U3A00250
                          STX   2 SAV2+1    SAVE XR2                    U3A00260
                          STS     CHECK     SAVE STATUS                 U3A00270
                          STD     SAVAQ     SAVE ACC AND EXT            U3A00280
                          LD    1 1                                     U3A00290
                          STO     INPUT+1   SAVE INPUT ADDRESS          U3A00300
                          LD    1 2                                     U3A00310
                          STO     OUTPT+1   SAVE OUTPUT ADDRESS         U3A00320
                          LD    1 3                                     U3A00330
                          STO     COUNT     SET OUTPUT CODE INDR        U3A00340
                          LD      CALL1                                 U3A00350
                          BSI     SBRTA     SET UP EBPA TABLE ADDR      U3A00360
                          STO     TLU14+1                               U3A00370
                          LD      CALL2                                 U3A00380
                          BSI     SBRTA     SET UP PRTY TABLE ADDR      U3A00390
                          STO     TLU18+1                               U3A00400
                          LD    1 0         SET OUTPUT CODE INDR        U3A00410
                          STO     CODE      (0 IF 1053, 1 IF 1443)      U3A00420
                          MDX   1 +4        SET EXIT TO SKIP 4 PARAMS   U3A00430
                          STX   1 EXIT+1                                U3A00440
                    INPUT LDX  L1 *-*       XR1= INPUT ADDR             U3A00450
                    OUTPT LDX  L2 *-*       XR2= OUTPUT ADDR            U3A00460
                    *                                                   U3A00470
                    *LOOP TO CALL CONVERSION AND PACK TWO CHARS PER     U3A00480
                    * WORD AND STORE IN OUTPUT AREA.                    U3A00490
                    *                                                   U3A00500
                    LEFT  LD    1 0         GET EBCDIC CHARACTER        U3A00510
                          BSI     TLU       CONVERT EBCDIC CHAR AND PUT U3A00520
                          SRT     24        IN BITS 8-15 OF EXTENSION   U3A00530
                          MDX  L  COUNT,-1  ANY MORE TO CONVERT         U3A00540
                          MDX     RIGHT     YES                         U3A00550
                          LD    2 0         NO,DONT ALTER THE LAST 8    U3A00560
                          SLA     8         BITS OF LAST STG WD         U3A00570
                          MDX     STORE     GO TO STORE LAST WD         U3A00580
                    RIGHT LD    1 0         GET SECOND HALF OF THE WD   U3A00590
                          SLA     8                                     U3A00600
                          BSI     TLU       CONVERT SECOND HALF OF WD   U3A00610
                    STORE RTE     8         PUT BOTH CHARS IN ACC       U3A00620
                          STO   2 0         STORE BOTH CONVERTED CHARS  U3A00630
                          MDX   1 +1        SET FOR NEXT INPUT WORD     U3A00640
                          MDX   2 +1        SET FOR NEXT OUTPUT WORD    U3A00650
                          MDX  L  COUNT,-1  ANY MORE TO CONVERT         U3A00660
                          MDX     LEFT      YES,REPEAT LOOP             U3A00670
                    CHECK LDS     0         NO,RESTORE STATUS           U3A00680
                    SAV1  LDX  L1 *-*       RESTORE XR1                 U3A00690
                    SAV2  LDX  L2 *-*       RESTORE XR2                 U3A00700
                          LDD     SAVAQ     RESTORE ACC AND EXT         U3A00710
                    EXIT  BSC  L  *-*       EXIT                        U3A00720
                    *                                                   U3A00730
                    *CONSTANTS AND BUFFER AREA                          U3A00740
                    *                                                   U3A00750
                    CALL1 LIBF    EBPA      USED TO GET EBPA LD ADDR    U3A00760
                    CALL2 LIBF    PRTY      USED TO GET PRTY ENTRY ADDR U3A00770
                    SAVAQ BSS  E  2         SAVE ACC AND EXTENSION      U3A00780
                    CODE  DC      0         OUTPUT CODE INDR(0=1443)    U3A00790
                    COUNT DC      0         NO. OF CHARS TO CONVERT     U3A00800
                    D0001 DC      +1        ADDR MODIFICATION CONSTANT  U3A00810
                    HFF00 DC      /FF00     8-15 BIT MASK               U3A00820
                    H2001 DC      /2001     OVRFLO CON                  U3A00830
                    TEMP  DC      0         TEMPORARY STORAGE           U3A00840
                    *                                                   U3A00850
                    *CONVERT THE EBCDIC CHAR TO 1053 OR 1443 CODE       U3A00860
                    *                                                   U3A00870
                    TLU   DC      0         RETURN ADDR                 U3A00880
                          STO     TEMP      SAVE EBCDIC CHAR            U3A00890
                          STX   2 TLU26+1   SAVE XR2                    U3A00900
                          LDX   2 +75       XR2= NO. OF CHARS IN TABLE  U3A00910
                    TLU14 EOR  L2 0         EBPA TABLE ENTRY            U3A00920
                          SRA     8         RIGHT JUSTIFY RSLT TO TEST  U3A00930
                          BSC  L  TLU18,+-  IS EBCDIC CHAR = TABLE CHAR U3A00940
                          LD      TEMP      NO,RESTORE EBCDIC CHAR TO   U3A00950
                          MDX   2 -1        ACC AND TRY NEXT CHAR.      U3A00960
                          MDX     TLU14     GO TO COMPARE               U3A00970
                          LD      H2001     IF NO MORE IN TABLE,SET     U3A00980
                          STO     CHECK     OVERFLOW ON, CARRY OFF      U3A00990
                    TLU18 LD   L2 0         PRTY TABLE ENTRY            U3A01000
                          MDX  L  CODE,0    IF 1443 CODE,GET LAST 8     U3A01010
                          SLA     8         BITS OF TABLE ENTRY         U3A01020
                          AND     HFF00     RET ONLY 8 BITS- ONE CHAR   U3A01030
                    TLU26 LDX  L2 *-*       RESTORE XR2                 U3A01040
                          BSC  I  TLU       RETURN                      U3A01050
                    *                                                   U3A01060
                    *OBTAIN TABLE ADDRESS                               U3A01070
                    *                                                   U3A01080
                    SBRTA DC      0         RET ADDR                    U3A01090
                          SLA     8         OBTAIN DISPLACEMENT OF TV   U3A01100
                          SRT     8                                     U3A01110
                          STX   3 SBA12+1   CONTENTS OF XR3             U3A01120
                          A       D0002     PT TO THIRD WD OF TV        U3A01130
                          A       SBA12+1   THEN GET LOC OF SUBRT ADDR  U3A01140
                          STO     SBA12+1                               U3A01150
                    SBA12 LD   L  0         SUBROUTINE ADDR IN ACC      U3A01160
                          A       D0003     AVOID STORED LINK WD        U3A01170
                          BSC  I  SBRTA     RETURN W/ TBL ADDR IN ACC   U3A01180
                    D0002 DC      +2        DECIMAL 2                   U3A01190
                    D0003 DC      +3        DECIMAL 3                   U3A01200
                          END                                           U3A01210
