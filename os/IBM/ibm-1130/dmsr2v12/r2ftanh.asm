                    *************************************************** R2I00010
                    *                                                 * R2I00020
                    *   SUBROUTINE NAME-                              * R2I00030
                    *      FULL NAME- STANDARD PRECISION FLOATING-    * R2I00040
                    *         POINT HYPERBOLIC TANGENT FUNCTION.      * R2I00050
                    *      CODE NAME- FTNH/FTANH                      * R2I00060
                    *   PURPOSE- THIS SUBPROGRAM COMPUTES THE HYPER-  * R2I00070
                    *      BOLIC TANGENT OF A STANDARD PRECISION FLOAT* R2I00080
                    *      ING-POINT NUMBER.                          * R2I00090
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* R2I00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * R2I00110
                    *      SUBROUTINE LIBRARY MANUAL.                 * R2I00120
                    *   SPECIAL FEATURES- N/A                         * R2I00130
                    *   ADDITIONAL INFORMATION-                       * R2I00140
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * R2I00150
                    *         SUBROUTINE LIBRARY MANUAL               * R2I00160
                    *                                                 * R2I00170
                    *************************************************** R2I00180
                          HDNG    CALL FTANH  -V1.                      R2I00190
                          SPR                                           R2I00200
                          ENT     FTANH     STANDARD FORTRAN NAME       R2I00210
                          ENT     FTNH                                  R2I00220
                    FTANH DC      0         FORTRAN ENTRY               R2I00230
                          LIBF    FGETP     GET PARAMETER               R2I00240
                    FTNH  DC      0         USER ENTRY                  R2I00250
                          LD    3 125       ADD ONE TO EXPONENT TO      R2I00260
                          A       ONE       DOUBLE X.                   R2I00270
                          STO   3 125                                   R2I00280
                          S       EXK       CHK EXPONENT RANGE          R2I00290
                          BSC  L  OUT1,-Z   BR IF TOO LARGE,SET TANH=+1 R2I00300
                          LD    3 126       GET MANTISSA. IF IT IS      R2I00310
                          BSC     +-        ZERO,SET EXPONENT TO ZERO   R2I00320
                          STO   3 125                                   R2I00330
                          CALL    FXPN      COMPUTE E**2X. X=ARGUMENT   R2I00340
                          LIBF    FADD      (E**2X)+1                   R2I00350
                          DC      FLONE                                 R2I00360
                          LIBF    FSTO      SAVE IN Z                   R2I00370
                          DC      Z                                     R2I00380
                          LD    3 127       GET EXPONENT OF FAC         R2I00390
                          SLA     8         AND SAVE IN TEMP.           R2I00400
                          SRA     8                                     R2I00410
                          STO     TEMP                                  R2I00420
                          LIBF    FADD      COMPUTE (E**2X)-1           R2I00430
                          DC      MIN2                                  R2I00440
                          SLA     16        CORRECT THE DIVIDEND        R2I00450
                          S       TEMP      TO ALLOW FOR DIVISOR        R2I00460
                          M     3 126       TRUNCATION UPON DIVISION.   R2I00470
                          D       Z                                     R2I00480
                          SRT     16                                    R2I00490
                          AD    3 126                                   R2I00500
                          STD   3 126                                   R2I00510
                          LIBF    FDIV      PERFORM DIVISION--          R2I00520
                          DC      Z         (E**2X-1)/(E**2X+1).        R2I00530
                          BSC  I  FTNH      RETURN TO MAIN PROGRAM      R2I00540
                    *                                                   R2I00550
                    *ABSOLUTE VALUE OF ARGUMENT GT 32. RETURN +1 OR -1. R2I00560
                    *                                                   R2I00570
                    OUT1  LD    3 126       GET ARGUMENT AND            R2I00580
                          SRT     32        SHIFT OUT ALL BUT THE       R2I00590
                          SLT     31        SIGN BIT.                   R2I00600
                          OR      FLONE     PUT THE SIGN ON FLT PT ONE  R2I00610
                          STD   3 126       AND STORE IN FAC.           R2I00620
                          LD      EXP1      GET CORRESPONDING EXPONENT. R2I00630
                          STO   3 125                                   R2I00640
                          BSC  I  FTNH      RETURN TO MAIN PROGRAM      R2I00650
                    *                                                   R2I00660
                    *CONSTANTS AND BUFFER AREA                          R2I00670
                    *                                                   R2I00680
                    TEMP  DC      0         SAVE LAST OF DIVISOR        R2I00690
                    ONE   DC      1         SINGLE WORD ONE             R2I00700
                    EXP1  DC      129       EXPONENT FOR FLT PT ONE     R2I00710
                    EXK   DC      128+5     EXPONENT CHECK              R2I00720
                    FLONE DEC     1.0       FLT PT ONE                  R2I00730
                    Z     DEC     0.0       STORE DIVISOR               R2I00740
                    MIN2  DEC     -2.0      DIFFERENCE BETWEEN DIVISOR  R2I00750
                    *                       AND DIVIDEND.               R2I00760
                          END                                           R2I00770
