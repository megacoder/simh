                    *************************************************** S2E00010
                    *                                                 * S2E00020
                    *   SUBROUTINE NAME-                              * S2E00030
                    *      FULL NAME- EXTENDED PRECISION NATURAL      * S2E00040
                    *         LOGARITHM FUNCTION.                     * S2E00050
                    *      CODE NAME-ELN/EALOG                        * S2E00060
                    *   PURPOSE- THIS SUBROUTINE COMPUTES THE NATURAL * S2E00070
                    *      LOGARITHM OF AN EXTENDED PRECISION FLOATING* S2E00080
                    *      POINT NUMBER.                              * S2E00090
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* S2E00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * S2E00110
                    *      SUBROUTINE LIBRARY MANUAL.                 * S2E00120
                    *   SPECIAL FEATURES- N/A                         * S2E00130
                    *   ADDITIONAL INFORMATION-                       * S2E00140
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * S2E00150
                    *         SUBROUTINE LIBRARY MANUAL               * S2E00160
                    *      OTHER- A PERIOD FOLLOWED BY B, APPEARING TO* S2E00170
                    *         THE RIGHT OF COMMENT, INDICATES THAT THE* S2E00180
                    *         NUMBER FOLLOWING IS THE BINARY POINT OF * S2E00190
                    *         THE NUMBER PRESENTLY IN THE ACCUMULATOR.* S2E00200
                    *         LET C REFER TO THE TRUE EXPONENT OF THE * S2E00210
                    *         INPUT ARGUMENT.                         * S2E00220
                    *                                                 * S2E00230
                    *************************************************** S2E00240
                          HDNG    CALL ELN  -V1.                        S2E00250
                          EPR                                           S2E00260
                          ENT     ELN                                   S2E00270
                          ENT     EALOG     ASA STD. FORTRAN NAME.      S2E00280
                    EALOG DC      0         FORTRAN ENTRY               S2E00290
                          LIBF    EGETP     GET PARAMETER               S2E00300
                    ELN   DC      0         USER ENTRY                  S2E00310
                          STS     STAT      SAVE STATUS                 S2E00320
                          LD    3 125       GET INPUT EXPONENT          S2E00330
                          S       K1        SUB 128 AND                 S2E00340
                          STO     K         SAVE TRUE EXPONENT          S2E00350
                          LD      K1        GIVE FAC AN EFFECTIVE       S2E00360
                          STO   3 125       EXPONENT OF 0(128)          S2E00370
                          LDD   3 126       LD MANTISSA TO TEST         S2E00380
                          BSC  L  LNZER,+-  BR IF ZERO                  S2E00390
                          BSC  L  MNABS,-   BR IF PTV                   S2E00400
                          LD      LNEBT     IF ARGUMENT NEGATIVE,       S2E00410
                          OR    3 124       TURN ON LN ERROR PROGRAM    S2E00420
                          STO   3 124       INDICATOR.  USE ABSOLUTE    S2E00430
                          SLT     32        VALUE OF ARGUMENT.          S2E00440
                          SD    3 126                                   S2E00450
                          STD   3 126       STORE ABS VALUE IN          S2E00460
                    MNABS STD     FM1       FAC AND IN FM1              S2E00470
                    *                                                   S2E00480
                    *GET RANGE OF NO. INPUT TO COMPUTE POLYNOMIAL INPUT S2E00490
                    *                                                   S2E00500
                          S       SQRH      SUB (SQRT(2))/2             S2E00510
                          BSC  L  LN1,-     BR IF NON-NEG               S2E00520
                          LD      FM1       IF NEG,MPY FM1 BY 2         S2E00530
                          SLT     1         AND STORE IN FM1 AGAIN      S2E00540
                          STD     FM1                             .B1   S2E00550
                          LD      C129      GET PROPER EXPONENT         S2E00560
                          STO   3 125       AND STORE IN FAC            S2E00570
                          LD      K         DECR ORIGINAL EXPONENT BY   S2E00580
                          S       ONE+1     ONE                         S2E00590
                          STO     K                                     S2E00600
                    *                                                   S2E00610
                    *COMPUTE THE INPUT TO THE POLYNOMIAL                S2E00620
                    *                                                   S2E00630
                    LN1   LDD     FM1       GET F=INPUT MANTISSA        S2E00640
                          EOR     C8000     COMPUTE F-1          .B-1   S2E00650
                          STD     FM1                                   S2E00660
                          LIBF    EADD      COMPUTE F+1                 S2E00670
                          DC      FONE                                  S2E00680
                          LD    3 125       STORE EXPONENT AND          S2E00690
                          STO     FP1       MANTISSA OF F+1 IN FP1      S2E00700
                          LDD   3 126                                   S2E00710
                          STD     FP1+1                                 S2E00720
                          LD      K1        SET FAC EXPONENT TO         S2E00730
                          STO   3 125       EFFECTIVE ZERO(128)         S2E00740
                          LDD     FM1       PUT F-1 IN FAC       .B0    S2E00750
                          STD   3 126                                   S2E00760
                          LIBF    NORM      NORMALIZE                   S2E00770
                          LIBF    EDIV      COMPUTE (F-1)/(F+1)         S2E00780
                          DC      FP1                                   S2E00790
                          LD    3 125       STORE EXPONENT AND          S2E00800
                          STO     Z         MANTISSA IN Z               S2E00810
                          LDD   3 126                                   S2E00820
                          STD     Z+1                                   S2E00830
                          LD      CSRT      GENERATE A SHIFT CON FOR    S2E00840
                          S       Z         ARGUMENT EXPONENT.          S2E00850
                          STO     SRT       -C-2+/1880                  S2E00860
                          S       CSRTR     CHK IF SHIFT LTE 16         S2E00870
                          BSC  L  *+2,+     BR IF SHIFT IS LTE 16       S2E00880
                          LDD     A0        OTHERWISE,DO NOT COMPUTE    S2E00890
                          MDX     EPOL      HI-ORDER TERMS.       .B2   S2E00900
                          LDD   3 126       GET Z                .B0+C  S2E00910
                          BSC     +Z        BR IF NOT NEG               S2E00920
                          SD      ONE       IF NEG,SUB 1                S2E00930
                    SRT   SRT     *-*       SHIFT FOR EXPONENT   .B-2   S2E00940
                          BSC     +Z        BR IF NOT NEG               S2E00950
                          AD      ONE       IF NEG,RESTORE 1            S2E00960
                    *                                                   S2E00970
                    *CALCULATE POLYNOMIAL RESULT                        S2E00980
                    *                                                   S2E00990
                          STD   3 126       STORE Z IN FAC       .B-2   S2E01000
                          LIBF    XMD       COMPUTE Z**2         .B-4   S2E01010
                          STD   3 126       STORE Z**2 IN FAC     .B-4  S2E01020
                          SRT     5         SHIFT TO GET .25*Z**2 .B-1  S2E01030
                          AD      A6        AND ADD A6            .B-1  S2E01040
                          LIBF    XMD       (Z**2)*(A6+A8*(Z**2))  .B-5 S2E01050
                          SRT     4         SHIFT TO ADD A4       .B-1  S2E01060
                          AD      A4                              .B-1  S2E01070
                          LIBF    XMD       COMPUTE NEXT TERM     .B-5  S2E01080
                          SRT     5         SHIFT TO ADD A2       .B0   S2E01090
                          AD      A2                              .B0   S2E01100
                          LIBF    XMD       COMPUTE NEXT TERM     .B-4  S2E01110
                          SRT     6         SHIFT TO ADD A0       .B2   S2E01120
                          A       A0        WE NOW HAVE G(Z)      .B2   S2E01130
                    EPOL  STD   3 126       STORE IN FAC          .B2   S2E01140
                          LD      C12P2     SET FAC TO CORRECT          S2E01150
                          STO   3 125       EXPONENT=128+2              S2E01160
                          LIBF    EMPY      COMPUTE F1(Z)=Z*(G(Z))      S2E01170
                          DC      Z         F1(Z)=Z*(POLY)              S2E01180
                          LD    3 125       STORE EXPONENT AND          S2E01190
                          STO     Z         MANTISSA OF F1(Z) IN FAC    S2E01200
                          LDD   3 126                                   S2E01210
                          STD     Z+1                                   S2E01220
                    *                                                   S2E01230
                    *COMPUTE AND ADD K*LN(2) TO Z*G(Z) TO GET LN(X)     S2E01240
                    *                                                   S2E01250
                          SLT     16        CLEAR EXTENSION             S2E01260
                          LD      K                                     S2E01270
                          STD   3 126       PUT K MANTISSA IN FAC       S2E01280
                          LD      C1P15     MAKE INTEGER INTO FRACTION  S2E01290
                          STO   3 125       PUT IN FAC                  S2E01300
                          LIBF    NORM      NORMALIZE TO MPY            S2E01310
                          LIBF    EMPY      COMPUTE K.LN(2)             S2E01320
                          DC      LN2                                   S2E01330
                          LIBF    EADD      ADD LN(F)=F1(Z)             S2E01340
                          DC      Z         WE HAVE LN(X)               S2E01350
                    STAT  LDS     *-*       RESTORE STATUS              S2E01360
                          BSC  I  ELN                                   S2E01370
                    LNZER LD      LNEBT     IF ARGUMENT ZERO,           S2E01380
                          OR    3 124       TURN ON LN ERROR PROGRAM    S2E01390
                          STO   3 124       INDICATOR AND RETURN        S2E01400
                          LD      MXNEC     LARGEST NEGATIVE NUMBER.    S2E01410
                          STO   3 125                                   S2E01420
                          LDD     MXNEM                                 S2E01430
                          STD   3 126                                   S2E01440
                          MDX     STAT                                  S2E01450
                    *                                                   S2E01460
                    *CONSTANTS AREA                                     S2E01470
                    *                                                   S2E01480
                    MXNEC DC      255       LARGEST EXPONENT            S2E01490
                    K1    DC      128       CON TO SCALE EXPONENT       S2E01500
                    K     DC      0         STORE INPUT EXPONENT        S2E01510
                    LNEBT DC      /1        BIT 15--LN ERROR.           S2E01520
                    MXNEM DEC     -0.9999999999B0    LARGEST NEG NO.    S2E01530
                    A0    DEC     2.0B2              COEFFICIENTS       S2E01540
                    A2    DEC     0.666666564181B0   OF                 S2E01550
                    A4    DEC     0.400018840613B-1  APPROXIMATING      S2E01560
                    A6    DEC     0.284535726600B-1  POLYNOMIAL         S2E01570
                    ONE   DEC     1           FLT PT ONE                S2E01580
                    N1    DEC     0           FLT PT ZERO               S2E01590
                    SQRH  DEC     1.414214B1  STORE INPUT MANTISSA      S2E01600
                    FM1   DEC     0           STORE NON-ZERO ABS VALUE  S2E01610
                    FONE  XFLC    0.9999999999  FLT PT ONE              S2E01620
                    FP1   XFLC    0.0           STORE F+1               S2E01630
                    LN2   XFLC    0.6931471806599452 EXTENDED PREC LN2  S2E01640
                    Z     EQU     FP1         STORE EXTENDED PREC NO.   S2E01650
                    C8000 DC      /8000       CON USED TO SUB 1         S2E01660
                    C129  DC      129         EXPONENT OF +1            S2E01670
                    C12M2 DC      128-2       EXPONENT OF -2            S2E01680
                    C12P2 DC      128+2       EXPONENT OF +2            S2E01690
                    C1P15 DC      128+15      EXPONENT OF +15           S2E01700
                    CSRTR DC      16+/1880  SHIFT RT 16 CON             S2E01710
                    CSRT  DC      128-2+/1880 EXPONENT SHIFT RT CORR    S2E01720
                          END                                           S2E01730
