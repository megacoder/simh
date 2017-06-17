                          HDNG    HOLL TO EBC AND EBC - HOLL CONVERSION U3B00010
                    *************************************************** U3B00020
                    *                                                 * U3B00030
                    *   SUBROUTINE NAME-                              * U3B00040
                    *      FULL NAME- HOLLERITH TO EBCDIC OR EBCDIC   * U3B00050
                    *         TO HOLLERITH CONVERSION SUBROUTINE.     * U3B00060
                    *      CODE NAME- HOLEB                           * U3B00070
                    *   PURPOSE- THIS SUBROUTINE CONVERTS HOLLERITH   * U3B00080
                    *      TO EBCDIC,PACKED TWO CHARACTERS PER WORD,  * U3B00090
                    *      OR CONVERTS PACKED EBCDIC TO HOLLERITH.    * U3B00100
                    *   METHOD-                                       * U3B00110
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U3B00120
                    *   CAPABILITIES AND LIMITATIONS-                 * U3B00130
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U3B00140
                    *   SPECIAL FEATURES-N/A                          * U3B00150
                    *   ADDITIONAL INFORMATION-                       * U3B00160
                    *      ESTIMATED EXECUTION TIME-                  * U3B00170
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U3B00180
                    *                                                 * U3B00190
                    *************************************************** U3B00200
                          HDNG    HOLL TO EBC AND EBC - HOLL CONVERSION U3B00210
                          LIBR                                          U3B00220
                          ENT     HOLEB                                 U3B00230
                    HOLEB STX   1 SAV1+1    CALL ENTRY POINT            U3B00240
                    LINK  LDX  I1 0         LOADER STORED TV ADDRESS    U3B00250
                          STX   2 SAV2+1    SAVE XR2                    U3B00260
                          STS     SAVST     SAVE STATUS                 U3B00270
                          STD     TEMP      SAVE ACC AND EXTENSION      U3B00280
                          LD    1 1         XR1= ADDR OF FIRST PARAM    U3B00290
                          STO     INPUT+1   INPUT ADDR                  U3B00300
                          LD    1 2                                     U3B00310
                          STO     OUTPT+1   OUTPUT ADDR                 U3B00320
                          LD    1 3                                     U3B00330
                          STO     COUNT     CHARACTER COUNT             U3B00340
                          LD      CALL1                                 U3B00350
                          BSI     SBRTA     OBTAIN ADDR OF HOLL TBL     U3B00360
                          STO     TLU14+1                               U3B00370
                          STO     TLU32+1                               U3B00380
                          LD      CALL2                                 U3B00390
                          BSI     SBRTA     OBTAIN ADDR OF EBPA TBL     U3B00400
                          STO     TLU12+1                               U3B00410
                          STO     TLU34+1                               U3B00420
                          LD    1 0         INDR OF EBCDIC OR HOLLERITH U3B00430
                          MDX   1 +4                                    U3B00440
                          STX   1 EXIT+1    SET EXIT TO CALL+5          U3B00450
                    INPUT LDX  L1 0         XR1= INPUT DATA AREA        U3B00460
                    OUTPT LDX  L2 0         XR2= OUTPUT DATA AREA       U3B00470
                          BSC  L  HOLIN,+   BR IF HOLLERITH INPUT       U3B00480
                    *                                                   U3B00490
                    *CONVERT INPUT EBCDIC TO HOLLERITH                  U3B00500
                    *                                                   U3B00510
                    EBCIN LD    1 0         GET AN INPUT WORD (2 CHARS) U3B00520
                          BSI     HLOUT     CONVERT LEFT CHAR           U3B00530
                          MDX  L  COUNT,-1  DECR CHAR COUNT             U3B00540
                          MDX     EBRGT     CONTINUE IF MORE CHARS      U3B00550
                          MDX     SAV1      EXIT IF NO MORE CHARS       U3B00560
                    EBRGT LD    1 0                                     U3B00570
                          SLA     8                                     U3B00580
                          BSI     HLOUT     CONVERT RIGHT CHAR          U3B00590
                          MDX   1 +1        XR1 PTS TO NEXT INPUT WORD  U3B00600
                          MDX  L  COUNT,-1  DECR CHAR COUNT             U3B00610
                          MDX     EBCIN     LOOP FOR NEXT CHAR          U3B00620
                          MDX     SAV1      EXIT IF NO MORE CHARS       U3B00630
                    *                                                   U3B00640
                    *THIS SECTION DOES THE TABLE LOOKUP FOR EBCDIC TO   U3B00650
                    *HOLLERITH CONVERSION.                              U3B00660
                    *                                                   U3B00670
                    HLOUT NOP               STORE RETURN ADDR           U3B00680
                          STO     CHAR                                  U3B00690
                          STX   1 TLU16+1                               U3B00700
                          LDX   1 +75       XR1=CONVERSION TBL LENGTH   U3B00710
                    TLU12 EOR  L1 0         EBPA TABLE ENTRY            U3B00720
                          SRA     8         DO CHARS CMP                U3B00730
                          BSC  L  TLU14,+-  YES,GO STORE CORRECT CHAR   U3B00740
                          LD      CHAR      NO,RESTORE INPUT CHAR       U3B00750
                          MDX   1 -1        DECR TBL PT                 U3B00760
                          MDX     TLU12     NOT DONE W/TBL,CONTINUE     U3B00770
                          LD      H2001     TABLE SEARCH DONE,NONE CMP- U3B00780
                          STO     SAVST     TURN ON OVERFLOW INDR.      U3B00790
                    TLU14 LD   L1 0                                     U3B00800
                          STO   2 0         STORE HOLLERITH CHAR        U3B00810
                          MDX   2 +1        SET FOR NEXT O/P CHAR       U3B00820
                    TLU16 LDX  L1 0         RESTORE XR1                 U3B00830
                          BSC  I  HLOUT     RETURN                      U3B00840
                    *                                                   U3B00850
                    *CONSTANTS AND BUFFER AREA                          U3B00860
                    *                                                   U3B00870
                    CALL1 LIBF    HOLL      GET HOLL SUBRT ADDR         U3B00880
                    CALL2 LIBF    EBPA      GET EBPA SUBRT ADDR         U3B00890
                    CHAR  DC      0         EBCDIC CHAR BUFFER          U3B00900
                    COUNT DC      0         CHAR COUNT                  U3B00910
                    H00FF DC      /00FF     LOW-BIT MASK                U3B00920
                    H2001 DC      /2001     OVERFLOW INDR WD            U3B00930
                    TEMP  BSS  E  2         SAVE ACC AND EXT            U3B00940
                    *                                                   U3B00950
                    *CONVERT INPUT HOLLERITH TO EBCDIC                  U3B00960
                    *                                                   U3B00970
                    HOLIN BSI     EBOUT                                 U3B00980
                          SLA     8                                     U3B00990
                          STO     CHAR      CONVERT LEFT O/P CHAR       U3B01000
                          MDX  L  COUNT,-1  ANY MORE CHARS              U3B01010
                          MDX     RIGHT     YES, CONTINUE               U3B01020
                          LD    2 0         NO, STORE LEFT CHAR IN      U3B01030
                          AND     H00FF     OUTPUT AREA (DO NOT         U3B01040
                          A       CHAR      ALTER RIGHT CHAR)           U3B01050
                          STO   2 0                                     U3B01060
                          MDX     SAV1      GO TO PREPARE FOR EXIT      U3B01070
                    RIGHT BSI     EBOUT     CONVERT RIGHT O/P CHAR      U3B01080
                          A       CHAR      STORE BOTH CHARS IN         U3B01090
                          STO   2 0         OUTPUT AREA                 U3B01100
                          MDX   2 +1        SET FOR NEXT O/P WD         U3B01110
                          MDX  L  COUNT,-1  ANY MORE CHARS              U3B01120
                          MDX     HOLIN     YES, LOOP                   U3B01130
                    SAV1  LDX  L1 0         RESTORE XR1                 U3B01140
                    SAV2  LDX  L2 0         RESTORE XR2                 U3B01150
                    SAVST LDS     0         OVERFLOW ON IF ERROR        U3B01160
                          LDD     TEMP      RESTORE ACC AND EXT         U3B01170
                    EXIT  BSC  L  0         EXIT                        U3B01180
                    *                                                   U3B01190
                    *THIS SECTION DOES THE TABLE LOOKUP FOR HOLLERITH   U3B01200
                    *TO EBCDIC CONVERSION.                              U3B01210
                    *                                                   U3B01220
                    EBOUT NOP               RETURN ADDR                 U3B01230
                          STX   2 TLU36+1   SAVE XR2                    U3B01240
                          LDX   2 +75       XR2=CONVERSION TABLE LENGTH U3B01250
                    TLU30 LD    1 0         GET FIRST CHAR              U3B01260
                    TLU32 EOR  L2 0         CHK AGAINST TABLE ENTRY     U3B01270
                          BSC  L  TLU34,+-  SAME,GO GET EBCDIC CHAR     U3B01280
                          MDX   2 -1        NOT SAME,DECR TABLE PT      U3B01290
                          MDX     TLU30     NOT DONE W/TBL,CHK NEXT WD  U3B01300
                          LD      H2001     END OF TBL,SET OVERFLOW     U3B01310
                          STO     SAVST     INDR AS ERROR INDR          U3B01320
                    TLU34 LD   L2 0         OBTAIN EBCDIC CHAR          U3B01330
                          SRA     8         PUT IN LAST HALF OF WORD    U3B01340
                          MDX   1 +1        SET FOR NEXT INPUT CHAR     U3B01350
                    TLU36 LDX  L2 0         RESTORE XR2                 U3B01360
                          BSC  I  EBOUT     EXIT                        U3B01370
                    *                                                   U3B01380
                    *THIS SECTION GETS THE ADDRESS OF THE SUBROUTINES   U3B01390
                    *LOADED WITH THIS PROGRAM.                          U3B01400
                    *                                                   U3B01410
                    SBRTA NOP               SAVE RET ADDR               U3B01420
                          SLA     8                                     U3B01430
                          SRT     8         EXTEND MODIFIER SIGN        U3B01440
                          STX   3 CHAR      GET ADDR OF TV TABLE        U3B01450
                          A       CHAR      ADD TO DISPLACEMENT TO GET  U3B01460
                          A       D0002     TV-PT TO THIRD WD OF TV.    U3B01470
                          STO     SBA12+1                               U3B01480
                    SBA12 LD   L  0         GET SUBRT ENTRY ADDR        U3B01490
                          A       D0003     AVOID STORED LINK WORD      U3B01500
                          BSC  I  SBRTA     EXIT                        U3B01510
                    D0002 DC      +2        DECIMAL 2                   U3B01520
                    D0003 DC      +3        DECIMAL 3                   U3B01530
                          END                                           U3B01540
