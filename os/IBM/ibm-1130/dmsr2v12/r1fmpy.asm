                    *************************************************** R1G00010
                    *                                                 * R1G00020
                    *   SUBROUTINE NAME-                              * R1G00030
                    *      FULL NAME- STANDARD PRECISION FLOATING-    * R1G00040
                    *         POINT MULTIPLY FUNCTION.                * R1G00050
                    *      CODE NAME- FMPY/FMPYX                      * R1G00060
                    *   PURPOSE- THIS FUNCTION COMPUTES THE PRODUCT OF* R1G00070
                    *      TWO STANDARD PRECISION FLOATING-POINT      * R1G00080
                    *      NUMBERS.                                   * R1G00090
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* R1G00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * R1G00110
                    *      SUBROUTINE LIBRARY MANUAL.                 * R1G00120
                    *   SPECIAL FEATURES- N/A                         * R1G00130
                    *   ADDITIONAL INFORMATION-                       * R1G00140
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * R1G00150
                    *         SUBROUTINE LIBRARY MANUAL               * R1G00160
                    *                                                 * R1G00170
                    *************************************************** R1G00180
                          HDNG    LIBF FMPY  -V1.                       R1G00190
                          LIBR                                          R1G00200
                          SPR                                           R1G00210
                          ENT     FMPY                                  R1G00220
                          ENT     FMPYX                                 R1G00230
                    FMPYX STX   1 SAVE+1    SAVE XR1                    R1G00240
                          LD   L  *-*       CALL+1                      R1G00250
                          MDX     COM                                   R1G00260
                    FMPY  STX   1 SAVE+1    SAVE XR1                    R1G00270
                          LD   L  *-*       CALL+1                      R1G00280
                          LDX   1 0         XR1=ZERO                    R1G00290
                    COM   STO     *+4       STORE CALL+1                R1G00300
                          STS     STAT      STORE STATUS                R1G00310
                          A       ONE       BUILD EXIT                  R1G00320
                          STO     EXIT+1                                R1G00330
                          MDX  I1 *-*       EFFECTIVE OP ADDR IN XR1    R1G00340
                          NOP               IF MDX CAUSES BR,SKIP NOP   R1G00350
                    *                                                   R1G00360
                    *COMPUTE PRODUCT                                    R1G00370
                    *                                                   R1G00380
                          LDD   1 0         LOAD MULTIPLIER             R1G00390
                          STD     BARG      STORE MULTIPLIER            R1G00400
                          RTE     16        STORE EXPONENT IN ACC       R1G00410
                          STS     BARG+1    STRIP OFF EXPONENT IN BARG  R1G00420
                          EOR     BARG+1    EXPONENENT ONLY IN ACC      R1G00430
                          A     3 125       ADD FAC EXPONENT LESS 128   R1G00440
                          S       EXES                                  R1G00450
                          STO   3 125       STORE NEW EXPONENT IN FAC   R1G00460
                          LDD     BARG      GET MANTISSA FROM FAC       R1G00470
                          LIBF    XMDS      24-BIT PREC MPY             R1G00480
                          STD   3 126       PRODUCT PUT IN FAC          R1G00490
                    *                                                   R1G00500
                    *GET ABSOLUTE VALUE OF MANTISSA AND NORMALIZE       R1G00510
                    *                                                   R1G00520
                          BSC  L  *+2,-     BR IF NON-NEG               R1G00530
                          SLT     32        IF NEG,REVERSE SIGN         R1G00540
                          SD    3 126                                   R1G00550
                          SLT     1         CHECK FOR SIGNIFICANT BIT   R1G00560
                          BSC  L  NTPOS,+   BR IF NOT PTV               R1G00570
                          LD    3 125       IF PTV,DECR EXPONENT BY     R1G00580
                          S       ONE       ONE                         R1G00590
                          STO   3 125                                   R1G00600
                          LDD   3 126       AND SHIFT MANTISSA LEFT     R1G00610
                          SLT     1         BY ONE                      R1G00620
                          STD   3 126                                   R1G00630
                    NTPOS BSC     +-        SKIP IF NOT ZERO            R1G00640
                          STO   3 125       IF ZERO MAKE EXPONENT ZERO  R1G00650
                          LIBF    FARC      CHK OVERFLOW/UNDERFLOW      R1G00660
                    STAT  LDS     *-*       STORE STATUS                R1G00670
                    SAVE  LDX  L1 *-*       STORE XR1                   R1G00680
                    EXIT  BSC  L  *-*       RET TO CALL+2               R1G00690
                    *                                                   R1G00700
                    *CONSTANTS AREA                                     R1G00710
                    *                                                   R1G00720
                    BARG  DEC     0.0       STORE MULTIPLIER            R1G00730
                    EXES  DC      /80       EXPONENT EXCESS=128         R1G00740
                    ONE   DC      1         SINGLE WORD ONE             R1G00750
                          END                                           R1G00760
