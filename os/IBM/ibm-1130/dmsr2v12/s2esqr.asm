                    *************************************************** S2H00010
                    *                                                 * S2H00020
                    *   SUBROUTINE NAME-                              * S2H00030
                    *     FULL NAME- EXTENDED PRECISION FLOATING-     * S2H00040
                    *         POINT SQUARE ROOT FUNCTION.             * S2H00050
                    *      CODE NAME- ESQR/ESQRT                      * S2H00060
                    *   PURPOSE- THIS SUBPROGRAM COMPUTES THE SQUARE  * S2H00070
                    *      ROOT OF AN EXTENDED PRECISION FLOATING-    * S2H00080
                    *      POINT NUMBER.                              * S2H00090
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* S2H00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * S2H00110
                    *      SUBROUTINE LIBRARY MANUAL.                 * S2H00120
                    *   SPECIAL FEATURES- N/A                         * S2H00130
                    *   ADDITIONAL INFORMATION-                       * S2H00140
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * S2H00150
                    *         SUBROUTINE LIBRARY MANUAL               * S2H00160
                    *                                                 * S2H00170
                    *************************************************** S2H00180
                          HDNG    CALL ESQR  -V1.                       S2H00190
                          EPR                                           S2H00200
                          ENT     ESQR                                  S2H00210
                          ENT     ESQRT     STANDARD FORTRAN NAME       S2H00220
                    ESQRT DC      0         FORTRAN ENTRY               S2H00230
                          LIBF    EGETP     GET PARAMETER               S2H00240
                    ESQR  DC      0         USER ENTRY                  S2H00250
                          STX   1 XR1+1     SAVE XR1                    S2H00260
                          LD    3 126                                   S2H00270
                          BSC  I  ESQR,+-   SQRT(0.0)=0.0               S2H00280
                          BSC  L  NNEG,-    BR IF PTV                   S2H00290
                          LD      SQREF     SET SQRT ERROR FLAG         S2H00300
                          OR    3 124       IF X NEGATIVE.              S2H00310
                          STO   3 124       USE ABSOLUTE VALUE.         S2H00320
                          SLT     32                                    S2H00330
                          SD    3 126                                   S2H00340
                          STD   3 126                                   S2H00350
                    *                                                   S2H00360
                    *COMPUTE EXPONENT AND INPUT TO ITERATION ROUTINE    S2H00370
                    *                                                   S2H00380
                    NNEG  LD    3 125                                   S2H00390
                          A       Q+2       ADD 129 TO EXPONENT         S2H00400
                          SRT     1         DIVIDE BY TWO               S2H00410
                          STO     BLC       SAVE EXPONENT OF RESULT     S2H00420
                          SLA     16                                    S2H00430
                          SLT     1         GET LAST BIT OF EXPONENT+1  S2H00440
                          LDX   1 0         IA.ZERO,SET XR1=ZERO        S2H00450
                          BSC     Z                                     S2H00460
                          LDX   1 3         IF ONE,SET XR1=3.           S2H00470
                          A       Q+1       SET UP EXPONENT FOR         S2H00480
                          STO   3 125       MANTISSA                    S2H00490
                          LIBF    ESTO      STORE RANGED ARGUMENT       S2H00500
                          DC      F                                     S2H00510
                          LIBF    EMPYX     P1=A*X+B                    S2H00520
                          DC      A                                     S2H00530
                          LIBF    EADDX                                 S2H00540
                          DC      B                                     S2H00550
                    *                                                   S2H00560
                    *USE NEWTON ITERATION TO GET SQUARE ROOT--          S2H00570
                    *           P(I+1)=(P(I)+F/P(I))/2                  S2H00580
                    *                                                   S2H00590
                          LDX   1 3         SET NEWTON ITERATION COUNT. S2H00600
                    LOOP  LIBF    ESTO      STORE LAST APPROXIMATION    S2H00610
                          DC      PN                                    S2H00620
                          LIBF    ELD       GET ARGUMENT                S2H00630
                          DC      F                                     S2H00640
                          LIBF    EDIV      DIVIDE BY PRIOR             S2H00650
                          DC      PN        APPROXIMATION.              S2H00660
                          LIBF    EADD      ADD PRIOR APPROXIMATION     S2H00670
                          DC      PN                                    S2H00680
                          LD    3 125       DECR EXPONENT BY ONE-       S2H00690
                          S       Q         (EFFECTIVELY DIVIDES BY 2)  S2H00700
                          STO   3 125                                   S2H00710
                          MDX   1 -1        DECR CTR FOR RET            S2H00720
                          MDX     LOOP                                  S2H00730
                          LD      BLC       GET PROPER EXPONENT FOR     S2H00740
                          STO   3 125       SQUARE ROOT.                S2H00750
                    XR1   LDX  L1 *-*       RESTORE XR1                 S2H00760
                          BSC  I  ESQR      EXIT                        S2H00770
                    *                                                   S2H00780
                    *CONSTANTS AREA                                     S2H00790
                    *                                                   S2H00800
                    BLC   DC      0         RESULT EXPONENT.            S2H00810
                    Q     DC      1         SINGLE WORD ONE             S2H00820
                          DC      127       EXPONENT SCALING CONSTANTS  S2H00830
                          DC      129       2                           S2H00840
                    SQREF DC      /4        BIT 13--SQUARE ROOT ERROR   S2H00850
                    F     XFLC              RANGED ARGUMENT.            S2H00860
                    PN    XFLC              NEWTON ITERATION RESULT.    S2H00870
                    A     XFLC    0.875     F BETWEEN 0.25 AND 0.5      S2H00880
                          XFLC    0.578125  F BETWEEN 0.50 AND 1.0      S2H00890
                    B     XFLC    0.27863   F BETWEEN 0.25 AND 0.5      S2H00900
                          XFLC    0.421875  F BETWEEN 0.50 AND 1.0      S2H00910
                          END                                           S2H00920
