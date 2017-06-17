                    *************************************************** R2H00010
                    *                                                 * R2H00020
                    *   SUBROUTINE NAME-                              * R2H00030
                    *      FULL NAME- STANDARD PRECISION FLOATING-    * R2H00040
                    *         POINT SQUARE ROOT FUNCTION.             * R2H00050
                    *      CODE NAME- FSQR/FSQRT                      * R2H00060
                    *   PURPOSE- THIS SUBPROGRAM COMPUTES THE SQUARE  * R2H00070
                    *      ROOT OF A STANDARD PRECISION FLOATING-POINT* R2H00080
                    *      NUMBER.                                    * R2H00090
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* R2H00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * R2H00110
                    *      SUBROUTINE LIBRARY MANUAL.                 * R2H00120
                    *   SPECIAL FEATURES- N/A                         * R2H00130
                    *   ADDITIONAL INFORMATION-                       * R2H00140
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * R2H00150
                    *         SUBROUTINE LIBRARY MANUAL               * R2H00160
                    *                                                 * R2H00170
                    *************************************************** R2H00180
                          HDNG    CALL FSQR  -V1.                       R2H00190
                          SPR                                           R2H00200
                          ENT     FSQR                                  R2H00210
                          ENT     FSQRT     STANDARD FORTRAN NAME       R2H00220
                    *                                                   R2H00230
                    *CONSTANTS AND BUFFER AREA                          R2H00240
                    *                                                   R2H00250
                    F     DEC     0         RANGED ARGUMENT.            R2H00260
                    PN    DEC     0         NEWTON ITERATION RESULT.    R2H00270
                    A     DEC     0.875     F BETWEEN 0.25 AND 0.5      R2H00280
                          DEC     0.578125  F BETWEEN 0.50 AND 1.0      R2H00290
                    B     DEC     0.27863   F BETWEEN 0.25 AND 0.5      R2H00300
                          DEC     0.421875  F BETWEEN 0.50 AND 1.0      R2H00310
                    *                                                   R2H00320
                    *ENTER AND OBTAIN ABSOLUTE VALUE OF ARGUMENT        R2H00330
                    *                                                   R2H00340
                    FSQRT DC      0         FORTRAN ENTRY               R2H00350
                          LIBF    FGETP     GET PARAMETER               R2H00360
                    FSQR  DC      0         USER ENTRY                  R2H00370
                          STX   1 XR1+1     SAVE XR1                    R2H00380
                          LD    3 126       GET ARGUMENT                R2H00390
                          BSC  I  FSQR,+-   SQRT(0.0)=0.0               R2H00400
                          BSC  L  EXP,-     BR IF PTV TO GET EXPONENT   R2H00410
                          LD      SQREF     SET SQUARE ROOT ERROR FLAG  R2H00420
                          OR    3 124       IF ARGUMENT IS NEG.         R2H00430
                          STO   3 124       USE ABSOLUTE VALUE.         R2H00440
                          SLT     32                                    R2H00450
                          SD    3 126       GET ABSOLUTE VALUE AND PUT  R2H00460
                          STD   3 126       INTO FAC.                   R2H00470
                    *                                                   R2H00480
                    *COMPUTE EXPONENT AND INPUT TO ITERATION ROUTINE    R2H00490
                    *                                                   R2H00500
                    EXP   LD    3 125       GET EXPONENT                R2H00510
                          A       Q+2       DOUBLE THE EXCESS FOR       R2H00520
                          SRT     1         DIVISION BY 2.              R2H00530
                          STO     BLC       STORE RESULT EXPONENT=B     R2H00540
                          SLA     16        GET LAST BIT OF EXPONENT    R2H00550
                          SLT     1         +1.                         R2H00560
                          LDX   1 0         SET XR1 TO ZERO OR TWO      R2H00570
                          BSC     Z         ACCORDING AS F IS LT OR GT  R2H00580
                          LDX   1 2         0.5. XR1 POINTS TO PROPER   R2H00590
                    *                       INITIAL CONSTANTS           R2H00600
                          A       Q+1       ADD IN EXCESS-1 TO GET      R2H00610
                          STO   3 125       PROPER EXPONENT FOR F.      R2H00620
                          LIBF    FSTO      SAVE F.                     R2H00630
                          DC      F                                     R2H00640
                          LIBF    FMPYX     COMPUTE THE INITIAL         R2H00650
                          DC      A         APPROXIMATION. XR1 POINTS   R2H00660
                          LIBF    FADDX     TO PROPER A AND B.          R2H00670
                          DC      B         P1=A*X+B                    R2H00680
                    *                                                   R2H00690
                    *PERFORM NEWTON ITERATION TWICE                     R2H00700
                    *                                                   R2H00710
                          LDX   1 2         SET NEWTON ITERATION COUNT. R2H00720
                    LOOP  LIBF    FSTO      STORE PREV APPROXIMATION.   R2H00730
                          DC      PN                                    R2H00740
                          LIBF    FLD       PUT IN X FACTOR.            R2H00750
                          DC      F                                     R2H00760
                          LIBF    FDIV      PERFORM DIVISION.           R2H00770
                          DC      PN        X/PN                        R2H00780
                          LIBF    FADD      ADD PN.                     R2H00790
                          DC      PN        X/PN + PN                   R2H00800
                          LD    3 125       DIVIDE BY 2 BY DECREMENTING R2H00810
                          S       Q         EXPONENT BY ONE.            R2H00820
                          STO   3 125       (X/PN+PN)/2                 R2H00830
                          MDX   1 -1        DECR ITERATION COUNTER.     R2H00840
                          MDX     LOOP      RETURN TO REPEAT LOOP.      R2H00850
                          LD      BLC       GET RESULT EXPONENT         R2H00860
                          STO   3 125       AND PUT IN FAC.             R2H00870
                    XR1   LDX  L1 *-*       RESTORE XR1                 R2H00880
                          BSC  I  FSQR      RETURN TO CALLER.           R2H00890
                    *                                                   R2H00900
                    *CONSTANTS AND BUFFER AREA                          R2H00910
                    *                                                   R2H00920
                    BLC   DC      0         RESULT EXPONENT.            R2H00930
                    Q     DC      1         SINGLE WORD ONE             R2H00940
                          DC      127       CONSTANTS TO SET            R2H00950
                          DC      129       EXPONENT.                   R2H00960
                    SQREF DC      /4        BIT 13--ERROR FLAG.         R2H00970
                          END                                           R2H00980
