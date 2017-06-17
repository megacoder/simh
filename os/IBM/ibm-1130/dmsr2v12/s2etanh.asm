                    *************************************************** S2I00010
                    *                                                 * S2I00020
                    *   SUBROUTINE NAME-                              * S2I00030
                    *      FULL NAME- EXTENDED PRECISION FLOATING-    * S2I00040
                    *         POINT HYPERBOLIC TANGENT FUNCTION.      * S2I00050
                    *      CODE NAME- ETNH/ETANH                      * S2I00060
                    *   PURPOSE- THIS SUBPROGRAM COMPUTES THE HYPER-  * S2I00070
                    *      BOLIC TANGENT OF AN EXTENDED PRECISION     * S2I00080
                    *      FLOATING-POINT NUMBER.                     * S2I00090
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* S2I00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * S2I00110
                    *      SUBROUTINE LIBRARY MANUAL.                 * S2I00120
                    *   SPECIAL FEATURES- N/A                         * S2I00130
                    *   ADDITIONAL INFORMATION-                       * S2I00140
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * S2I00150
                    *         SUBROUTINE LIBRARY MANUAL               * S2I00160
                    *                                                 * S2I00170
                    *************************************************** S2I00180
                          HDNG    CALL ETANH  -V1.                      S2I00190
                          EPR                                           S2I00200
                          ENT     ETANH     STANDARD FORTRAN NAME       S2I00210
                          ENT     ETNH                                  S2I00220
                    ETANH DC      0         FORTRAN ENTRY               S2I00230
                          LIBF    EGETP     GET PARAMETER               S2I00240
                    ETNH  DC      0         USER ENTRY                  S2I00250
                          LD    3 125       ADD ONE TO EXPONENT TO      S2I00260
                          A       ONE       DOUBLE X.                   S2I00270
                          STO   3 125                                   S2I00280
                          S       EXK       CHK IF ARGUMENT GT 32       S2I00290
                          BSC  L  OUT1,-Z   BR TOO LARGE....TANH=+1     S2I00300
                          LD    3 126                                   S2I00310
                          BSC     +-        RESTORE EXPONENT TO ZERO IF S2I00320
                          STO   3 125       MANTISSA IS ZERO.           S2I00330
                          CALL    EXPN      OTHERWISE COMPUTE E**2X     S2I00340
                          LIBF    EADD      (E**2X)+1                   S2I00350
                          DC      FLONE                                 S2I00360
                          LIBF    ESTO      STORE IN Z                  S2I00370
                          DC      Z                                     S2I00380
                          LIBF    EADD      COMPUTE (E**2X)-1           S2I00390
                          DC      MIN2      -2 =(E**2X)-1               S2I00400
                          LIBF    EDIV      TANH(X)=((E**2X)-1)/        S2I00410
                          DC      Z                       ((E**2X)+1)   S2I00420
                          BSC  I  ETNH      EXIT                        S2I00430
                    OUT1  LD    3 126       GET THE SIGN BIT FROM THE   S2I00440
                          SRT     32        MANTISSA.TANH(X)=+1 IF X    S2I00450
                          SLT     31        GT 32.TANH(X)=-1,X LT -32.  S2I00460
                          OR      FLONE+1   SET SIGN ON CONSTANT OF 1   S2I00470
                          STD   3 126                                   S2I00480
                          LD      EXP1      GET PROPER EXPONENT         S2I00490
                          STO   3 125                                   S2I00500
                          BSC  I  ETNH      EXIT                        S2I00510
                    *                                                   S2I00520
                    *CONSTANTS AREA                                     S2I00530
                    *                                                   S2I00540
                    ONE   DC      1         SINGLE WORD ONE             S2I00550
                    EXP1  DC      129       EXPONENT OF CON ONE         S2I00560
                    EXK   DC      128+5     RANGE CHK CON               S2I00570
                    FLONE XFLC    1.0       EXTENDED PREC FLT PT ONE    S2I00580
                    MIN2  XFLC    -2.0      EXTENDED PREC FLT PT -2     S2I00590
                    Z     XFLC    0.0       STORE DIVISOR               S2I00600
                          END                                           S2I00610
