                    *************************************************** R2E00010
                    *                                                 * R2E00020
                    *   SUBROUTINE NAME-                              * R2E00030
                    *      FULL NAME- STANDARD PRECISION FLOATING-    * R2E00040
                    *         POINT NATURAL LOGARITHM FUNCTION.       * R2E00050
                    *      CODE NAME- FLN/FALOG                       * R2E00060
                    *   PURPOSE- THIS SUBPROGRAM COMPUTES THE FLOATING* R2E00070
                    *      POINT LOGARITHM OF A STANDARD PRECISION    * R2E00080
                    *      FLOATING-POINT NUMBER.                     * R2E00090
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* R2E00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * R2E00110
                    *      SUBROUTINE LIBRARY MANUAL.                 * R2E00120
                    *   SPECIAL FEATURES- N/A                         * R2E00130
                    *   ADDITIONAL INFORMATION-                       * R2E00140
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * R2E00150
                    *         SUBROUTINE LIBRARY MANUAL               * R2E00160
                    *      OTHER- A PERIOD FOLLOWED BY B, APPEARING TO* R2E00170
                    *         THE RIGHT OF COMMENT, INDICATES THAT THE* R2E00180
                    *         NUMBER FOLLOWING IS THE BINARY POINT OF * R2E00190
                    *         THE NUMBER PRESENTLY IN THE ACCUMULATOR.* R2E00200
                    *         LET C REFER TO THE TRUE EXPONENT OF THE * R2E00210
                    *         INPUT ARGUMENT.                         * R2E00220
                    *                                                 * R2E00230
                    *************************************************** R2E00240
                          HDNG    CALL FLN  -V1.                        R2E00250
                          SPR                                           R2E00260
                          ENT     FLN                                   R2E00270
                          ENT     FALOG     STANDARD FORTRAN NAME       R2E00280
                    FALOG DC      0         FORTRAN ENTRY               R2E00290
                          LIBF    FGETP     GET PARAMETER               R2E00300
                    FLN   DC      0         USER ENTRY                  R2E00310
                          STS     STAT      SAVE STATUS                 R2E00320
                          LD    3 125       GET ARGUMENT EXPONENT       R2E00330
                          S       K1        =128                        R2E00340
                          STO     K         STORE SCALED EXPONENT       R2E00350
                          LD      K1        =128                        R2E00360
                          STO   3 125       ZERO FAC EXPONENT           R2E00370
                          LDD   3 126       GET MANTISSA                R2E00380
                          BSC  L  LNZER,+-  IF ZERO,GO SET ERROR INDR   R2E00390
                          BSC  L  *+6,-                                 R2E00400
                          LD      LNEBT     IF ARGUMENT NEGATIVE,       R2E00410
                          OR    3 124       TURN ON LN ERROR PROGRAM    R2E00420
                          STO   3 124       INDICATOR.  USE ABSOLUTE    R2E00430
                          SLT     32        VALUE OF ARGUMENT.          R2E00440
                          SD    3 126                                   R2E00450
                          STD   3 126                                   R2E00460
                          STD     FM1       STORE ABSOLUTE VALUE        R2E00470
                          S       SQRH      =SQRT(0.5)             .B0  R2E00480
                          BSC  L  LN1,-     GO COMPUTE Z IF GT SQRT(.5) R2E00490
                          LD      FM1       MPY MANTISSA BY TWO OTHER-  R2E00500
                          SLT     1         WISE. G=2F                  R2E00510
                          STD     FM1       B1                          R2E00520
                          LD      C129      INCREMENT EXPONENT TO 129   R2E00530
                          STO   3 125       TO CORRESPOND.              R2E00540
                          LD      K         ALSO DECREMENT EXPONENT TO  R2E00550
                          S       ONE+1     BE USED FOR J.              R2E00560
                          STO     K                                     R2E00570
                    LN1   LDD     FM1       COMPUTE F-1 BY REVERSING    R2E00580
                          EOR     C8000     THE STATUS OF THE SIGN BIT  R2E00590
                          STD     FM1                                   R2E00600
                          LIBF    FADD      COMPUTE F+1                 R2E00610
                          DC      FONE                                  R2E00620
                          LIBF    FSTO      AND STORE IN FP1.           R2E00630
                          DC      FP1                                   R2E00640
                          LD      K1        RESTORE EFFECTIVE EXPONENT  R2E00650
                          STO   3 125       OF ZERO TO MANTISSA IN FAC. R2E00660
                          LDD     FM1       PUT F-1 IN FAC         .B0  R2E00670
                          STD   3 126                                   R2E00680
                          LIBF    NORM      NORMALIZE DIVIDEND AND      R2E00690
                          LIBF    FDIV      COMPUTE Z=(F-1)/(F+1)       R2E00700
                          DC      FP1                                   R2E00710
                          LIBF    FSTO      SAVE POLYNOMIAL ARGUMENT    R2E00720
                          DC      Z                                     R2E00730
                          LD      CSRT      GENERATE A SHIFT CONSTANT   R2E00740
                          S     3 125       FROM ARGUMENT EXPONENT      R2E00750
                          STO     SRT       -C-2+/1880                  R2E00760
                          S       CSRTR     CHECK RANGE OF SHIFT        R2E00770
                          BSC  L  *+2,+     BRANCH IF SHIFT LT 16       R2E00780
                          LDD     A0        OTHERWISE,DO NOT COMPUTE    R2E00790
                          MDX     EPOL      HI-ORDER TERMS.        .B2  R2E00800
                          LDD   3 126                            .B0+C  R2E00810
                          BSC     +Z        SCALE BY 1 FOR SHIFT IF NEG R2E00820
                          SD      ONE                                   R2E00830
                    SRT   SRT     *-*       PERFORM SHIFT          .B-2 R2E00840
                          BSC     +Z        RESTORE 1 IF NEG            R2E00850
                          AD      ONE                                   R2E00860
                          STD   3 126       STORE ARGUMENT IN FAC  .B-2 R2E00870
                          LIBF    XMDS      COMPUTE Z**2           .B-4 R2E00880
                          STD   3 126       PUT Z**2 INTO FAC      .B-4 R2E00890
                          SRT     10        0.25*Z**2 SCALED TO    .B4  R2E00900
                          AD      A4        ADD A4                 .B4  R2E00910
                          LIBF    XMDS      MPY BY Z**2            .B0  R2E00920
                          AD      A2        ADD A2                 .B0  R2E00930
                          LIBF    XMDS      MPY BY Z**2            .B-4 R2E00940
                          SRT     6         SCALE TO ADD A0        .B2  R2E00950
                          A       A0                                    R2E00960
                    EPOL  STD   3 126       ST RSLTS=LN(G)              R2E00970
                          LD      C12P2     SET EXPONENT TO +2          R2E00980
                          STO   3 125                                   R2E00990
                          LIBF    FMPY      F1(Z)=Z*LN(G)               R2E01000
                          DC      Z                                     R2E01010
                          LIBF    FSTO      SAVE Z*LN(G) IN Z           R2E01020
                          DC      Z                                     R2E01030
                          SLT     16        CLEAR EXTENSION             R2E01040
                          LD      K         ORIGINAL EXPONENT USED      R2E01050
                          STD   3 126       AS MANTISSA. CHANGE FROM    R2E01060
                          LD      C1P15     INTEGER TO FRACTION BY      R2E01070
                          STO   3 125       ADDING 15 TO EXPONENT.      R2E01080
                          LIBF    NORM      NORMALIZE                   R2E01090
                          LIBF    FMPY      AND MPY BY LN2.             R2E01100
                          DC      LN2       K*LN2                       R2E01110
                          LIBF    FADD      ADD Z*LN(G)                 R2E01120
                          DC      Z         LN(X)=K*LN2+Z*LN(G)         R2E01130
                    STAT  LDS     *-*       RESTORE STATUS              R2E01140
                          BSC  I  FLN       RETURN TO MAIN PROGRAM      R2E01150
                    *                                                   R2E01160
                    *IF INPUT ARGUMENT IS ZERO,TURN ON                  R2E01170
                    *AND RETURN LARGEST NEGATIVE NUMBER.                R2E01180
                    *                                                   R2E01190
                    LNZER LD      LNEBT     GET ERROR BIT               R2E01200
                          OR    3 124       AND STORE                   R2E01210
                          STO   3 124       INDICATOR AND RETURN        R2E01220
                          LD      MXNEC     GET LARGEST EXPONENT        R2E01230
                          STO   3 125                                   R2E01240
                          LDD     MXNEM     MAXIMUM NEG MANTISSA        R2E01250
                          STD   3 126       IN FAC                      R2E01260
                          MDX     STAT      GO TO BR OUT                R2E01270
                    *                                                   R2E01280
                    *CONSTANTS AND BUFFER AREA                          R2E01290
                    *                                                   R2E01300
                    MXNEC DC      255       MAXIMUM EXPONENT            R2E01310
                    MXNEM DEC     -0.9999999999B0     LARGEST NEGATIVE  R2E01320
                    *                                 *MANTISSA         R2E01330
                    A0    DEC     2.0B2               CONSTANTS FOR     R2E01340
                    A2    DEC     0.66664413786B0     *POLYNOMIAL       R2E01350
                    A4    DEC     0.4019234697B4      *COEFICIENTS      R2E01360
                    ONE   DEC     1         TWO WORD ONE                R2E01370
                    N1    DEC     0                                     R2E01380
                    K1    DC      128       EXPONENT CODE CONSTANT      R2E01390
                    SQRH  DEC     1.414214B1          RANGE CHECK FOR F R2E01400
                    K     DC      0         STORAGE FOR K               R2E01410
                    FM1   DEC     0         DIVIDEND BUFFER             R2E01420
                    FONE  DEC     0.9999999999        FLT POINT ONE     R2E01430
                    FP1   DEC     0.0       DIVISOR AND POLYNOMIAL      R2E01440
                    Z     EQU     FP1       RESULT BUFFER               R2E01450
                    LN2   DEC     0.6931471806599452  LOG(E) OF TWO     R2E01460
                    C8000 DC      /8000     SIGN BIT MASK               R2E01470
                    C129  DC      129       CONSTANTS                   R2E01480
                    C12M2 DC      128-2     *FOR                        R2E01490
                    C12P2 DC      128+2     *SCALING                    R2E01500
                    C1P15 DC      128+15    *EXPONENTS                  R2E01510
                    CSRTR DC      16+/1880  SHIFT RIGHT CONSTANTS       R2E01520
                    CSRT  DC      128-2+/1880                           R2E01530
                    LNEBT DC      /1        BIT 15--LN ERROR.           R2E01540
                          END                                           R2E01550
