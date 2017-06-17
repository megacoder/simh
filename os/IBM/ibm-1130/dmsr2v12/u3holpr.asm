                          HDNG    HOLLERITH TO PRINTER CODE CONVERSION  U3C00010
                    *************************************************** U3C00020
                    *                                                 * U3C00030
                    *   SUBROUTINE NAME-                              * U3C00040
                    *      FULL NAME- HOLLERITH TO 1053 OR 1443       * U3C00050
                    *         PRINTER CODE CONVERSION SUBROUTINE.     * U3C00060
                    *      CODE NAME- HOLPR                           * U3C00070
                    *   PURPOSE- THIS SUBROUTINE CONVERTS HOLLERITH   * U3C00080
                    *      CHARACTER CODE TO EITHER 1053 OR 1443      * U3C00090
                    *      PRINTER CODE,PACKED TWO CHARACTERS PER WORD* U3C00100
                    *   METHOD-                                       * U3C00110
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U3C00120
                    *   CAPABILITIES AND LIMITATIONS-                 * U3C00130
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U3C00140
                    *   SPECIAL FEATURES- N/A                         * U3C00150
                    *   ADDITIONAL INFORMATION-                       * U3C00160
                    *      ESTIMATED EXECUTION TIME-                  * U3C00170
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U3C00180
                    *                                                 * U3C00190
                    *************************************************** U3C00200
                          HDNG    HOLLERITH TO PRINTER CODE CONVERSION  U3C00210
                          LIBR                                          U3C00220
                          ENT     HOLPR                                 U3C00230
                    HOLPR STX   1 SAV1+1    CALL ENTRY POINT            U3C00240
                    LINK  LDX  I1 0         LOADER STORED TV ADDR       U3C00250
                          STX   2 SAV2+1    SAVE XR2                    U3C00260
                          STS     CHECK     SAVE STATUS                 U3C00270
                          STD     SAVAQ     SAVE ACC AND EXT            U3C00280
                          LD    1 1                                     U3C00290
                          STO     INPUT+1   SAVE INPUT ADDR             U3C00300
                          LD    1 2                                     U3C00310
                          STO     OUTPT+1   SAVE OUPUT ADDR             U3C00320
                          LD    1 3                                     U3C00330
                          STO     COUNT     SAVE CHAR COUNT             U3C00340
                          LD      CALL1                                 U3C00350
                          BSI     SBRTA     SET UP HOLL TABLE ADDR      U3C00360
                          STO     TLU14+1                               U3C00370
                          LD      CALL2                                 U3C00380
                          BSI     SBRTA     SET UP PRTY TABLE ADDR      U3C00390
                          STO     TLU18+1                               U3C00400
                          LD    1 0         SET OUTPUT CODE INDR        U3C00410
                          EOR     D0001     (0 IF 1443, 1 IF 1053)      U3C00420
                          STO     CODE                                  U3C00430
                          MDX   1 +4        SET EXIT TO SKIP 4 PARAMS   U3C00440
                          STX   1 EXIT+1                                U3C00450
                    INPUT LDX  L1 0         XR1= INPUT ADDR             U3C00460
                    OUTPT LDX  L2 0         XR2= OUTPUT ADDR            U3C00470
                    *                                                   U3C00480
                    *THIS SECTION SETS UP THE CONVERSION AND STORES     U3C00490
                    *THE RESULTS IN THE OUTPUT AREA.                    U3C00500
                    *                                                   U3C00510
                    LEFT  LD    2 0                                     U3C00520
                          SRT     8         SAVE RT HALF OF O/P AREA WD U3C00530
                          BSI     TLU       GO CONVERT HOLLERITH CHAR   U3C00540
                          SLT     8         ST CONVERTED CHAR IN FIRST, U3C00550
                          STO   2 0         RESTORE LAST HALF OF WORD.  U3C00560
                          MDX  L  COUNT,-1  ANY MORE CHARS TO CONVERT   U3C00570
                          MDX     RIGHT     YES,GO TO FILL OUT O/P WD   U3C00580
                          MDX     CHECK     NO,GO TO EXIT               U3C00590
                    RIGHT LD    2 0                                     U3C00600
                          SRT     24        SAVED CONVERTED LEFT CHAR   U3C00610
                          BSI     TLU       CONVERT HOLL CHAR AND PUT   U3C00620
                          SLA     8         IN BITS 0-7.                U3C00630
                          RTE     8                                     U3C00640
                          STO   2 0         STORE BOTH CONVERTED CHARS  U3C00650
                          MDX   2 +1        SET FOR NEXT OUTPUT WORD    U3C00660
                          MDX  L  COUNT,-1  ANY MORE CHARS TO CONVERT   U3C00670
                          MDX     LEFT      YES,REPEAT LOOP             U3C00680
                    CHECK LDS     0         NO,RESTORE STATUS           U3C00690
                    SAV1  LDX  L1 0         RESTORE XR1                 U3C00700
                    SAV2  LDX  L2 0         RESTORE XR2                 U3C00710
                          LDD     SAVAQ     RESTORE ACC AND EXT         U3C00720
                    EXIT  BSC  L  0         EXIT                        U3C00730
                    *                                                   U3C00740
                    *CONSTANTS AND BUFFER AREA                          U3C00750
                    *                                                   U3C00760
                    CALL1 LIBF    HOLL      USED TO GET HOLL LOAD ADDR  U3C00770
                    CALL2 LIBF    PRTY      USED TO GET PRTY LOAD ADDR  U3C00780
                    SAVAQ BSS  E  2         SAVE ACC AND EXT            U3C00790
                    CODE  DC      0         O/P CODE INDR(0=1443,1=1053 U3C00800
                    COUNT DC      0         CHAR COUNT                  U3C00810
                    D0001 DC      +1        15-BIT MASK                 U3C00820
                    H00FF DC      /00FF     HIGH BIT MASK               U3C00830
                    H2001 DC      /2001     OVERFLOW STATUS WD          U3C00840
                    *                                                   U3C00850
                    *THIS SECTION DOES A TABLE LOOKUP CONVERSION USING  U3C00860
                    *EBPA AND HOLL.                                     U3C00870
                    *                                                   U3C00880
                    TLU   DC      0         SAVE RET ADDR               U3C00890
                          STX   2 TLU26+1   SAVE XR1                    U3C00900
                          LDX   2 +75       XR2= NO. OF CHARS IN TABLE  U3C00910
                    TLU12 LD    1 0         GET HOLLERITH CHAR          U3C00920
                    TLU14 EOR  L2 0         CHK AGAINST TABLE ENTRY     U3C00930
                          BSC  L  TLU16,+-  IF SAME,GO CONVERT          U3C00940
                          MDX   2 -1        IF NOT,CHK FOR END OF TABLE U3C00950
                          MDX     TLU12     MORE TBL,CONTINUE SEARCH    U3C00960
                          LD      H2001     END OF TBL,SET ERROR INDR-  U3C00970
                          STO     CHECK     CARRY OFF, OVERFLOW ON.     U3C00980
                    TLU16 MDX   1 +1        RT TBL ENTRY, REF NEXT CHAR U3C00990
                    TLU18 LD   L2 0         GET PRTY TABLE ENTRY        U3C01000
                          MDX  L  CODE,0    SKIP IF 1443,USE LAST 8 BIT U3C01010
                          SRA     8         IF 1053,USE FIRST 8 BITS    U3C01020
                          AND     H00FF     RET ONLY ONE CHAR           U3C01030
                    TLU26 LDX  L2 0         RESTORE XR2                 U3C01040
                          BSC  I  TLU       RETURN                      U3C01050
                    *                                                   U3C01060
                    *THIS SECTION GET THE ADDRESS OF THE BEGINNING OF   U3C01070
                    *THE TABLES IN PRTY AND HOLL.                       U3C01080
                    *                                                   U3C01090
                    SBRTA DC      *-*       SAVE RET ADDR               U3C01100
                          SLA     8         PROPAGATE SIGN BIT OF TV    U3C01110
                          SRT     8         DISPLACEMENT.               U3C01120
                          STX   3 SBA12+1   GET TV TBL LOCATION         U3C01130
                          A       D0002     CONSTRUCT THE ADDRESS OF    U3C01140
                          A       SBA12+1   THIRD WD OF TV.             U3C01150
                          STO     SBA12+1                               U3C01160
                    SBA12 LD   L  0         GET SUBRT ENTRY ADDR        U3C01170
                          A       D0003                                 U3C01180
                          BSC  I  SBRTA     RETURN CALL+3               U3C01190
                    D0002 DC      +2        DECIMAL 2                   U3C01200
                    D0003 DC      +3        DECIMAL 3                   U3C01210
                          END                                           U3C01220
