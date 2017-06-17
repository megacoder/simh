                    *************************************************** S1G00010
                    *                                                 * S1G00020
                    *   SUBROUTINE NAME-                              * S1G00030
                    *      FULL NAME- EXTENDED PRECISION FLOATING-    * S1G00040
                    *         POINT MULTIPLY SUBPROGRAM.              * S1G00050
                    *      CODE NAME- EMPY/EMPYX                      * S1G00060
                    *   PURPOSE- THIS SUBPROGRAM COMPUTES THE PRODUCT * S1G00070
                    *      OF TWO EXTENDED PRECISION FLOATING-POINT   * S1G00080
                    *      NUMBERS.                                   * S1G00090
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* S1G00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * S1G00110
                    *      SUBROUTINE LIBRARY MANUAL.                 * S1G00120
                    *   SPECIAL FEATURES- N/A                         * S1G00130
                    *   ADDITIONAL INFORMATION-                       * S1G00140
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * S1G00150
                    *         SUBROUTINE LIBRARY MANUAL               * S1G00160
                    *                                                 * S1G00170
                    *************************************************** S1G00180
                          HDNG    LIBF EMPY  -V1.                       S1G00190
                          LIBR                                          S1G00200
                          EPR                                           S1G00210
                          ENT     EMPY      LIBF                        S1G00220
                          ENT     EMPYX                                 S1G00230
                    EMPYX STX   1 EMX1+1    SAVE XR1                    S1G00240
                          LD   L  *-*       LOADER INSERT.              S1G00250
                          MDX     EMC                                   S1G00260
                    EMPY  STX   1 EMX1+1    SAVE XR1                    S1G00270
                          LD   L  *-*       LOADER INSERT.              S1G00280
                          LDX   1 0         SUPPRESS INDEXING.          S1G00290
                    EMC   STO     *+3       STORE ADDR OF OPND          S1G00300
                          A       MCN+1     INCR ADDR BY ONE            S1G00310
                          STO     MX+1      BUILD EXIT                  S1G00320
                          MDX  I1 *-*       OPND ADDRESS INTO XR1.      S1G00330
                          NOP               IF MDX CAUSES BR,SKIP NOP   S1G00340
                    *                                                   S1G00350
                    *COMPUTE PRODUCT                                    S1G00360
                    *                                                   S1G00370
                    CMN   LD    3 125       GET FAC EXPONENT            S1G00380
                          A     1 0         ADD ARGUMENT EXPONENT       S1G00390
                          S       MCN       CORR FACTOR OF 128          S1G00400
                          STO   3 125       PRODUCT EXPONENT INTO FAC   S1G00410
                          LD    1 2         GET ARGUMENT MANTISSA       S1G00420
                          RTE     16        INTO ACC AND EXT            S1G00430
                          LD    1 1                                     S1G00440
                          LIBF    XMD       MULTIPLY FRACTIONS.         S1G00450
                          STD   3 126       STORE IN FAC                S1G00460
                    *                                                   S1G00470
                    *GET ABSOLUTE VALUE OF MANTISSA AND NORMALIZE       S1G00480
                    *                                                   S1G00490
                          BSC  L  *+2,-     BR IF NON-NEG               S1G00500
                          SLT     32        IF NEG,REVERSE SIGN         S1G00510
                          SD    3 126                                   S1G00520
                          SLT     1                                     S1G00530
                          BSC  L  NONP,+    BR IF NOT PTV               S1G00540
                          LD    3 125       IF PTV,GET EXPONENT         S1G00550
                          S       MCN+1     AND DECR BY ONE             S1G00560
                          STO   3 125                                   S1G00570
                          LDD   3 126       GET MANTISSA AND            S1G00580
                          SLT     1         SHIFT LEFT ONE              S1G00590
                          STD   3 126                                   S1G00600
                    NONP  BSC     +-        BR IF MANTISSA NON-ZERO     S1G00610
                          STO   3 125       ZERO CHARACTERISTIC         S1G00620
                    EMX1  LDX  L1           RESTORE XR1.                S1G00630
                          LIBF    FARC      ERROR ROUTINE               S1G00640
                    MX    BSC  L  *-*       EXIT.                       S1G00650
                    *                                                   S1G00660
                    *CONSTANTS AREA                                     S1G00670
                    *                                                   S1G00680
                    MCN   DC      128       CONSTANT TO SCALE EXPONENT  S1G00690
                          DC      1         SINGLE WORD ONE             S1G00700
                          END                                           S1G00710
