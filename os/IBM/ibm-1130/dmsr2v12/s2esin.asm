                    *************************************************** S2G00010
                    *                                                 * S2G00020
                    *   SUBROUTINE NAME-                              * S2G00030
                    *      FULL NAME- EXTENDED PRECISION FLOATING-    * S2G00040
                    *         POINT SINE AND COSINE FUNCTION.         * S2G00050
                    *      CODE NAME- ESIN/ESINE/ECOS/ECOSN           * S2G00060
                    *   PURPOSE- THIS SUBPROGRAM COMPUTES THE SINE,OR * S2G00070
                    *      COSINE AS DESIRED, OF AN EXTENDED PRECISION* S2G00080
                    *      FLOATING POINT ANGLE IN RADIANS.           * S2G00090
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* S2G00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * S2G00110
                    *      SUBROUTINE LIBRARY MANUAL.                 * S2G00120
                    *   SPECIAL FEATURES- N/A                         * S2G00130
                    *   ADDITIONAL INFORMATION-                       * S2G00140
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * S2G00150
                    *         SUBROUTINE LIBRARY MANUAL               * S2G00160
                    *      OTHER- A PERIOD FOLLOWED BY B, APPEARING TO* S2G00170
                    *         THE RIGHT OF COMMENT, INDICATES THAT THE* S2G00180
                    *         NUMBER FOLLOWING IS THE BINARY POINT OF * S2G00190
                    *         THE NUMBER PRESENTLY IN THE ACCUMULATOR.* S2G00200
                    *         LET C REFER TO THE TRUE EXPONENT OF THE * S2G00210
                    *         INPUT ARGUMENT.                         * S2G00220
                    *                                                 * S2G00230
                    *************************************************** S2G00240
                          HDNG    CALL ESIN  -V1.                       S2G00250
                          EPR                                           S2G00260
                          ENT     ESINE                                 S2G00270
                          ENT     ESIN      STANDARD FORTRAN NAME       S2G00280
                          ENT     ECOSN                                 S2G00290
                          ENT     ECOS      STANDARD FORTRAN NAME       S2G00300
                    ECOS  DC      0         FORTRAN ENTRY               S2G00310
                          LIBF    EGETP     GET PARAMETER               S2G00320
                    ECOSN DC      0         USER ENTRY                  S2G00330
                          LD      ECOSN     ADD PI/2 TO ANGLE AND       S2G00340
                          STO     ESINE     USE SINE SUBR SINCE         S2G00350
                          LIBF    EADD      COS(X)=SIN(X+PI/2)          S2G00360
                          DC      HPI                                   S2G00370
                          MDX     ESINE+1                               S2G00380
                    ESIN  DC      0         FORTRAN ENTRY               S2G00390
                          LIBF    EGETP     GET PARAMETER               S2G00400
                    ESINE DC      0         USER ENTRY                  S2G00410
                          LD    3 125       GET EXPONENT,SCALE TO TRUE  S2G00420
                          S       Q         VALUE AND ADD 16.IF NEG,    S2G00430
                          BSC  I  ESINE,+Z  X LT 2**-17 SO SIN(X)=X   . S2G00440
                          S       Q+1       IF X GET 2**24, INDICATE    S2G00450
                          BSC  L  OVFL,-    LOSS OF SIGNIFICANCE ERROR  S2G00460
                    *                                                   S2G00470
                    *SCALE INPUT VALUE                                  S2G00480
                    *                                                   S2G00490
                          LDD     R2PI      DIVIDE ANGLE BY 2PI         S2G00500
                          LIBF    XMD       Y=X*(1/2PI)                 S2G00510
                          STD   3 126       STORE IN FAC        .B-2+C  S2G00520
                          LD    3 125       GET EXPONENT        .C+128  S2G00530
                          S       Q+2       AND MODIFY          .C-1    S2G00540
                          BSC  L  SIN1,+Z   BR IF NEG. OTHERWISE        S2G00550
                          A       Q+5       CONSTRUCT A SHIFT LEFT      S2G00560
                          STO     SLT       CON AND ST IN SLT    .C-1   S2G00570
                          LDD   3 126       GET MANTISSA        .B-2+C  S2G00580
                    *                                                   S2G00590
                    *FIND RANGE OF SCALED ARGUMENT AND MODIFY           S2G00600
                    *                                                   S2G00610
                    SLT   SLT     *-*       SHIFT TO DISCARD INTEGER    S2G00620
                          STD   3 126       PORTION OF Y,AND ST. .B-1   S2G00630
                          SLT     1         IS FRACTION BETWEEN .25     S2G00640
                          EOR   3 126                                   S2G00650
                          BSC  L  *+3,-     AND .75 . NO THEN BR        S2G00660
                          LDD     HALF      YES,THEN SET Z=0.5-Y        S2G00670
                          SD    3 126       Z=0.5-Y IF Y IS BETWEEN     S2G00680
                          STD   3 126       0.25 AND 0.75.              S2G00690
                          SLA     16                                    S2G00700
                    *                                                   S2G00710
                    *COMPUTE EXPONENT AND DO CORRECT SHIFT ON MANTISSA  S2G00720
                    *                                                   S2G00730
                    SIN1  A       Q+6       SCALE EXPONENT              S2G00740
                          STO   3 125       AND STORE CORRECT EXPONENT  S2G00750
                          LIBF    NORM      NORMALIZE                   S2G00760
                          LD    3 125       STORE (FAC) IN Z            S2G00770
                          STO     Z                                     S2G00780
                          LDD   3 126                                   S2G00790
                          STD     Z+1                                   S2G00800
                          LD      Q+4       GENERATE SHIFT CONSTANT     S2G00810
                          S     3 125       FOR EXPONENT.-C-2+/1880     S2G00820
                          STO     SRT                                   S2G00830
                          EOR     SRTK      CHK RANGE OF SHIFT          S2G00840
                          SRA     6                                     S2G00850
                          BSC  L  SPEC,Z    BR IF OUT OF RANGE          S2G00860
                          LDD   3 126       GET MANTISSA         .B0+C  S2G00870
                          BSC     +Z        BR IF NOT NEG               S2G00880
                          SD      ONE       IF NEG,SUB ONE              S2G00890
                    SRT   SRT     *-*       SHIFT FOR EXPONENT   .B-2   S2G00900
                          BSC     +Z        BR IF NOT NEG               S2G00910
                          AD      ONE       IF NEG,RESTORE ONE          S2G00920
                    *                                                   S2G00930
                    *USE POLYNOMIAL TO COMPUTE EXTENDED PRECISION SINE  S2G00940
                    *                                                   S2G00950
                    CSR   STD   3 126       STORE Z IN FAC       .B-2   S2G00960
                          LIBF    XMD       Z**2                 .B-4   S2G00970
                          STD   3 126                                   S2G00980
                          LDD     A6        GET A6               .B4    S2G00990
                          LIBF    XMD       A6*Z**2              .B0    S2G01000
                          AD      S6                                    S2G01010
                          SRT     6         SHIFT TO ADD         .B6    S2G01020
                          AD      A5        B6   +                      S2G01030
                          LIBF    XMD       (Z**2)*(A5+A6*Z**2)  .B2    S2G01040
                          SRT     5         SHIFT TO ADD         .B7    S2G01050
                          AD      A4        B7   -                      S2G01060
                          LIBF    XMD       (Z**2)*(ACC AND EXT) .B3    S2G01070
                          AD      S4                                    S2G01080
                          SRT     4         SHIFT TO ADD         .B7    S2G01090
                          AD      A3        B7   +                      S2G01100
                          LIBF    XMD       (Z**2)*(ACC AND EXT) .B3    S2G01110
                          SRT     3         SHIFT TO ADD A2      .B6    S2G01120
                          AD      A2        B6   -                      S2G01130
                          LIBF    XMD       (Z**2)*(A AND Q REGS).B2    S2G01140
                          AD      ONE                                   S2G01150
                    SRTK  SRT     1         SHIFT TO ADD A1             S2G01160
                          AD      A1        B3   +                      S2G01170
                          STD   3 126       STORE RESULT IN FAC  .B3    S2G01180
                          LD      Q+3       GET AN EXPONENT OF 3        S2G01190
                          STO   3 125                                   S2G01200
                          LIBF    EMPY      PUT IN FACTOR OF Z          S2G01210
                          DC      Z                                     S2G01220
                          BSC  I  ESINE     EXIT                        S2G01230
                    *                                                   S2G01240
                    *CONSTANTS AREA                                     S2G01250
                    *                                                   S2G01260
                    A1    DEC     +6.2831853071B3    COEFFICIENTS       S2G01270
                    A2    DEC     -41.341702117B6    FOR THE            S2G01280
                    A3    DEC     +81.605226206B7    APPROXIMATING      S2G01290
                    A4    DEC     -76.704281321B7    POLYNOMIAL.        S2G01300
                    A5    DEC     +42.009805726B6                       S2G01310
                    A6    DEC     -14.394135365B4                       S2G01320
                    S6    DEC     63                 USED TO ROUND OFF  S2G01330
                    S4    DEC     15                 BEFORE SHIFTING    S2G01340
                    ONE   DEC     1         EXTENDED PREC ONE           S2G01350
                    R2PI  DEC     1.591549430918954E-1B-2  1/2PI        S2G01360
                    HALF  DC      /8000     0.5B-2                      S2G01370
                          DC      /0000                                 S2G01380
                    HPI   XFLC    1.57079632679       PI/2              S2G01390
                    Z     XFLC    0.0           ARGUMENT OF POLYNOMIAL  S2G01400
                    Q     DC      128-16    0   EXPONENT AND SHIFT      S2G01410
                          DC      24+16     1   CONSTANTS.              S2G01420
                          DC      129       2                           S2G01430
                          DC      128+3     3                           S2G01440
                          DC      126+/1880 4                           S2G01450
                          SLT     0         5                           S2G01460
                          DC      127       6                           S2G01470
                    *                                                   S2G01480
                    *ERROR ROUTINES                                     S2G01490
                    *                                                   S2G01500
                    OVFL  SLT     32        SINE LOSS OF SIGNIFICANCE.  S2G01510
                          STO   3 125       RETURN ZERO.                S2G01520
                          STD   3 126       TURN ON SINE PROGRAM        S2G01530
                          LD      SINEB     ERROR INDICATOR.            S2G01540
                          OR    3 124                                   S2G01550
                          STO   3 124                                   S2G01560
                          BSC  I  ESINE     EXIT                        S2G01570
                    SPEC  LDD     MAXF      EXPONENT TOO LARGE.RTN MAX  S2G01580
                          MDX     CSR       PTV NO. TO POLYNOMIAL.      S2G01590
                    MAXF  DEC     0.999999999999B0                      S2G01600
                    SINEB DC      /2        BIT 14--SIN ERROR BIT.      S2G01610
                          END                                           S2G01620
