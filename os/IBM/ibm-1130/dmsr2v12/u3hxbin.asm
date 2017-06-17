                          HDNG    HEXADECIMAL TO BINARY CONVERSION      U3D00010
                    *************************************************** U3D00020
                    *                                                 * U3D00030
                    *   SUBROUTINE NAME-                              * U3D00040
                    *      FULL NAME- HEXADECIMAL TO BINARY CON-      * U3D00050
                    *         VERSION SUBROUTINE.                     * U3D00060
                    *      CODE NAME- HXBIN                           * U3D00070
                    *   PURPOSE- THIS SUBROUTINE CONVERTS A FOUR-     * U3D00080
                    *      CHARACTER HEXADECIMAL NUMBER IN EBCDIC     * U3D00090
                    *      TO ITS ONE-WORD BINARY EQUIVALENT.         * U3D00100
                    *   METHOD-                                       * U3D00110
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U3D00120
                    *   CAPABILITIES AND LIMITATIONS-                 * U3D00130
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U3D00140
                    *   SPECIAL FEATURES- N/A                         * U3D00150
                    *   ADDITIONAL INFORMATION-                       * U3D00160
                    *      ESTIMATED EXECUTION TIME-                  * U3D00170
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U3D00180
                    *                                                 * U3D00190
                    *************************************************** U3D00200
                          HDNG    HEXADECIMAL TO BINARY CONVERSION      U3D00210
                          LIBR                                          U3D00220
                          ENT     HXBIN                                 U3D00230
                    HXBIN STX   1 C24+1     CALL ENTRY POINT            U3D00240
                    LINK  LDX  I1 0         LOADER STORED TV ADDR       U3D00250
                          STX   2 C26+1     SAVE XR2                    U3D00260
                          STS     C20       SAVE STATUS                 U3D00270
                          STD     TEMP      SAVE ACC AND EXTENSION      U3D00280
                          LD    1 0         XR1=ADDR OF INPUT PARAM     U3D00290
                          A       D0003     INCR TO REF LAST CHAR       U3D00300
                          STO     C15+1                                 U3D00310
                          MDX   1 +1        SET UP RETURN ADDR          U3D00320
                          STX   1 C28+1                                 U3D00330
                    C15   LDX  L1 0         XR1= IOAR +3                U3D00340
                          LD      D0004     SET COUNT FOR 4 DIGITS      U3D00350
                          STO     COUNT                                 U3D00360
                    *                                                   U3D00370
                    *LOOP TO CONVERT HEXADECIMAL DIGITS                 U3D00380
                    *                                                   U3D00390
                    C16   LD    1 0         OBTAIN HOLLERITH DIGIT      U3D00400
                          BSC  L  C40,Z+    TEST FOR ALPHA DIGIT        U3D00410
                          AND     H400F     IF NUMERIC, GO SET ERROR    U3D00420
                          BSC  L  C42,Z     INDR IF BITS 1,12-15 ON     U3D00430
                          LD    1 0         WHICH ROW BIT IS SET        U3D00440
                    C17   LDX   2 12                                    U3D00450
                          SLCA  2 0         XR2=10 IF 0 ROW,1 IF 9,ETC  U3D00460
                          S       H8000     ERROR IF MULTIPLE ROWS      U3D00470
                          BSC  L  C42,Z     OR IF NO BITS SET.          U3D00480
                          STX   2 TEMP                                  U3D00490
                          LD      D0010     10-(XR2) = ROW BIT SET      U3D00500
                          S       TEMP                                  U3D00510
                          BSC     O         IS DIGIT ALPHA              U3D00520
                          A       D0009     YES, ADD +9 TO ROW          U3D00530
                          SRT     4         ST BINARY DIGIT IN EXT      U3D00540
                          MDX   1 -1        ARE 4 DIGITS DONE YET       U3D00550
                          MDX  L  COUNT,-1                              U3D00560
                          MDX     C16       NO,DO NEXT HEX CHAR         U3D00570
                    C20   LDS     0         YES, RESTORE STATUS         U3D00580
                    C22   LD      TEMP+1    PUT BINARY IN ACC AND       U3D00590
                          RTE     16        RESTORE EXTENSION.          U3D00600
                    C24   LDX  L1 *-*       RESTORE XR1                 U3D00610
                    C26   LDX  L2 *-*       RESTORE XR1                 U3D00620
                    C28   BSC  L  0         EXIT                        U3D00630
                    *                                                   U3D00640
                    *SECTION TO TREAT ALPHA CHARACTERS                  U3D00650
                    *                                                   U3D00660
                    C40   LDS     1         SET ALPHA DIGIT INDR        U3D00670
                          LD    1 0                                     U3D00680
                          AND     H607F     ERROR IF 11,0,7,8,9 ROW     U3D00690
                          BSC  L  C42,Z     OR BITS 12-15 SET           U3D00700
                          LD    1 0                                     U3D00710
                          EOR     H8000     MASK OUT 12 ROW BIT         U3D00720
                          MDX     C17       GO DO NORMAL CONVERSION     U3D00730
                    C42   LDS     1         SET ERROR INDR (OVERFLOW ON U3D00740
                          MDX     C22       AND CARRY OFF)              U3D00750
                    *                                                   U3D00760
                    *CONSTANTS AND BUFFER AREA                          U3D00770
                    *                                                   U3D00780
                    COUNT DC      0         FOUR-CHAR COUNT BUFFER      U3D00790
                    D0003 DC      +3        DECIMAL NUMBERS FOR SCALING U3D00800
                    D0004 DC      +4        ROW BIT VALUE.              U3D00810
                    D0009 DC      +9        SCALING DIGIT               U3D00820
                    D0010 DC      +10       SCALING DIGIT               U3D00830
                    H400F DC      /400F     MASK FOR BITS 1,12-15       U3D00840
                    H607F DC      /607F     MASK FOR BITS 11,0,7,8,9,   U3D00850
                    H8000 DC      /8000     12-15 SIGN BIT MASK         U3D00860
                    TEMP  BSS  E  2         TEMPORARY STG. SAVE EXT     U3D00870
                          END                                           U3D00880
