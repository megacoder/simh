                          HDNG    DECIMAL TO BINARY CONVERSION          U4G00010
                    *************************************************** U4G00020
                    *                                                 * U4G00030
                    *   SUBROUTINE NAME-                              * U4G00040
                    *      FULL NAME- DECIMAL TO BINARY CONVERSION    * U4G00050
                    *         SUBROUTINE.                             * U4G00060
                    *      CODE NAME- DCBIN                           * U4G00070
                    *   PURPOSE- THIS SUBROUTINE CONVERTS A SIGNED    * U4G00080
                    *      FIVE DIGIT DECIMAL NUMBER,REPRESENTED BY   * U4G00090
                    *      SIX EBCDIC CHARACTERS, TO ITS ONE WORD     * U4G00100
                    *      BINARY EQUIVALENT.                         * U4G00110
                    *   METHOD-                                       * U4G00120
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U4G00130
                    *   CAPABILITIES AND LIMITATIONS-                 * U4G00140
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U4G00150
                    *   SPECIAL FEATURES- N/A                         * U4G00160
                    *   ADDITIONAL INFORMATION-                       * U4G00170
                    *      ESTIMATED EXECUTION TIME-                  * U4G00180
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U4G00190
                    *                                                 * U4G00200
                    *************************************************** U4G00210
                          HDNG    DECIMAL TO BINARY CONVERSION          U4G00220
                          LIBR                                          U4G00230
                          ENT     DCBIN                                 U4G00240
                    DCBIN STX   1 F24+1     CALL ENTRY POINT            U4G00250
                    LINK  LDX  I1 0         LOADER STORED TV ADDRESS    U4G00260
                          STX   2 F26+1     SAVE XR2                    U4G00270
                          STS     F20       SAVE STATUS                 U4G00280
                          STD     TEMP      SAVE ACC AND EXTENSION      U4G00290
                          LD    1 0         XR1= ADDR OF INPUT PARAM    U4G00300
                          STO     F15+1                                 U4G00310
                          MDX   1 +1        XR1= RETURN ADDR            U4G00320
                          STX   1 F28+1                                 U4G00330
                    F15   LDX  L1 1         XR1= INPUT AREA ADDR        U4G00340
                          LD      D0005                                 U4G00350
                          STO     COUNT     SET COUNT FOR 5 DIGITS      U4G00360
                          SRA     16                                    U4G00370
                          STO     TEMP      CLEAR OUTPUT REGISTER       U4G00380
                    F17   LD    1 1         OBTAIN HOLLERITH DIGIT      U4G00390
                          BSC  L  F17A,+-   DON'T CONVERT IF BLANK      U4G00400
                          AND     HC00F     CHK BITS 0,1,12-15          U4G00410
                          BSC  L  F19,Z     IF ILLEGAL CHAR, EXIT WITH  U4G00420
                    *                       OVFLO INDR SET.             U4G00430
                          LD    1 1         WHICH ROW BIT IS SET        U4G00440
                          LDX   2 12                                    U4G00450
                          SLCA  2 0         XR2= 10 IF 0 ROW,1 IF 9,ETC U4G00460
                          S       H8000                                 U4G00470
                          BSC  L  F19,Z     EXIT IF NONE OR MANY        U4G00480
                    *                       ROW BITS SET                U4G00490
                          STX   2 ROW       COMPUTE 10-(XR2) TO GET     U4G00500
                          LD      D0010     BINARY EQUIVALENT OF        U4G00510
                          S       ROW       HOLLERITH DIGIT             U4G00520
                    *                                                   U4G00530
                    *COMPUTE BINARY EQUIVALENT FROM DIGITS.             U4G00540
                    *                                                   U4G00550
                    F17A  A       TEMP      ADD PREVIOUS RESULT         U4G00560
                          MDX  L  COUNT,-1  ARE 5 DIGITS DONE YET       U4G00570
                          MDX     F42       NO,GO MPY BY 10             U4G00580
                          STO     TEMP      YES,STORE FINAL VALUE       U4G00590
                          BSC  L  F44,O     MAY BE ERROR IF OVERFLOW    U4G00600
                          LD    1 -4        GET SIGN WORD               U4G00610
                          BSC  L  F20,+-    SIGN = BLANK                U4G00620
                          S       H4000                                 U4G00630
                          BSC  L  F40,+-    SIGN = MINUS                U4G00640
                          S       H4000                                 U4G00650
                          BSC  L  F20,+-    SIGN = AMPERSAND            U4G00660
                          S       H00A0                                 U4G00670
                    F18   BSC  L  F20,+-    SIGN = PLUS                 U4G00680
                    F19   LDS     1         ERROR - SET OVFLO ON        U4G00690
                          MDX     F22       AND CARRY OFF               U4G00700
                    F20   LDS     0         RESTORE STATUS              U4G00710
                    F22   LDD     TEMP      RESTORE ACC AND EXTENSION   U4G00720
                    F24   LDX  L1 0         RESTORE XR1                 U4G00730
                    F26   LDX  L2 0         RESTORE XR2                 U4G00740
                    F28   BSC  L  0         EXIT                        U4G00750
                    *                                                   U4G00760
                    *SECTION TO COMPLEMENT IF MINUS, MPY BY 10, CHECK   U4G00770
                    *FOR -32768                                         U4G00780
                    *                                                   U4G00790
                    F40   S       TEMP      MINUS SIGN, SO COMPLEMENT   U4G00800
                          STO     TEMP      FINAL VALUE                 U4G00810
                          MDX     F20                                   U4G00820
                    F42   M       H0014     MPY BY 10 SCALED -1         U4G00830
                          BSC  L  F19,Z     ERROR IF OVER +32760        U4G00840
                          SLT     15        PUT PRODUCT IN A REG        U4G00850
                          STO     TEMP      SAVE INTERMEDIATE RESULT    U4G00860
                          MDX   1 +1        SET XR1 TO GET NEXT DIGIT   U4G00870
                          MDX     F17       RET TO REPEAT LOOP          U4G00880
                    F44   EOR     H8000     IS VALUE -32768             U4G00890
                          BSC  L  F19,Z     NO, IS ERROR                U4G00900
                          LD    1 -4                                    U4G00910
                          EOR     H4000     YES, DON'T COMPLIMENT       U4G00920
                          MDX     F18                                   U4G00930
                    *                                                   U4G00940
                    *CONSTANTS AND BUFFER AREA                          U4G00950
                    *                                                   U4G00960
                    COUNT DC      0         COUNTER FOR 5 DIGITS        U4G00970
                    D0005 DC      +5        DECIMAL 5                   U4G00980
                    D0010 DC      +10       DECIMAL 10                  U4G00990
                    H0014 DC      /0014     10 SCALED -1                U4G01000
                    H00A0 DC      /00A0     AMPERSAND CHECK             U4G01010
                    H4000 DC      /4000     BLANK OR MINUS CHECK        U4G01020
                    H8000 DC      /8000     MAX NEG NUMBER              U4G01030
                    HC00F DC      /C00F     CHECK ILLEGAL CODE BITS     U4G01040
                    ROW   DC      0         TEMPORARY STORAGE FOR DIGIT U4G01050
                    TEMP  BSS  E  2         SAVE ACC AND EXT            U4G01060
                          END                                           U4G01070
