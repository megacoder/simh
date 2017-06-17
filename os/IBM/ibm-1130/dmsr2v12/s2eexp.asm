                    *************************************************** S2D00010
                    *                                                 * S2D00020
                    *   SUBROUTINE NAME-                              * S2D00030
                    *      FULL NAME- EXTENDED PRECISION FLOATING-    * S2D00040
                    *         POINT EXPONENTIAL FUNCTION.             * S2D00050
                    *      CODE NAME- EXPN/EEXP                       * S2D00060
                    *   PURPOSE- THIS SUBROUTINE COMPUTES THE EXPONENT* S2D00070
                    *      IAL OF AN EXTENDED PRECISION FLOATING-POINT* S2D00080
                    *      NUMBER.                                    * S2D00090
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* S2D00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * S2D00110
                    *      SUBROUTINE LIBRARY MANUAL.                 * S2D00120
                    *   SPECIAL FEATURES- N/A                         * S2D00130
                    *   ADDITIONAL INFORMATION-                       * S2D00140
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * S2D00150
                    *         SUBROUTINE LIBRARY MANUAL               * S2D00160
                    *      OTHER- A PERIOD FOLLOWED BY B, APPEARING TO* S2D00170
                    *         THE RIGHT OF COMMENT, INDICATES THAT THE* S2D00180
                    *         NUMBER FOLLOWING IS THE BINARY POINT OF * S2D00190
                    *         THE NUMBER PRESENTLY IN THE ACCUMULATOR.* S2D00200
                    *         LET C REFER TO THE TRUE EXPONENT OF THE * S2D00210
                    *         INPUT ARGUMENT.                         * S2D00220
                    *                                                 * S2D00230
                    *************************************************** S2D00240
                          HDNG    CALL EEXP  -V1.                       S2D00250
                          EPR                                           S2D00260
                          ENT     EEXP      STANDARD FORTRAN NAME       S2D00270
                          ENT     EXPN                                  S2D00280
                    EEXP  DC      0         FORTRAN ENTRY               S2D00290
                          LIBF    EGETP     GET PARAMETER               S2D00300
                    EXPN  DC      0         USER ENTRY                  S2D00310
                          STS     EXPS      SAVE STATUS                 S2D00320
                          STX   1 XR1+1     SAVE XR1                    S2D00330
                          STX   2 XR2+1     SAVE XR2                    S2D00340
                          LDD     LOG2E     GET LOG2E           .B1     S2D00350
                          LIBF    XMD       MPY BY (FAC).       .B1+C   S2D00360
                          STD   3 126       STORE Y*LOG2E IN FAC.B1+C   S2D00370
                          LD    3 125       GET Y EXPONENT              S2D00380
                          S       X         SUB 128+14.          C-14   S2D00390
                          BSC  L  OVFL,Z-   BR IF Y EXPONENT TOO BIG    S2D00400
                          A       X+1       SCALE Y EXPONENT BY 3. C+3  S2D00410
                          STO     BUF1+1    KEEP SCALED EXPONENT        S2D00420
                          BSC  L  SRT,+Z    BR IF EXPONENT LT -3        S2D00430
                    BUF1  LDX  L1 *-*       Y EXPONENT+3 IN XR1   .C-3  S2D00440
                          LD    3 126       GET Y*LOG2E          .B1+C  S2D00450
                    SRTR  SRT     17        MOVE TO EXT         .B18+C  S2D00460
                          SLT   1           SHIFT OF EXPONENT+3  .B15   S2D00470
                          A       X+2       ADD IN EXCESS               S2D00480
                          STO   3 125       SET THE EXPONENT OF 2=N     S2D00490
                          SLA     16        CLEAR ACCUMULATOR           S2D00500
                          SLT     2         2 BITS USED AS INDR         S2D00510
                          SLA     1         MPY D BY 2                  S2D00520
                          STO     D+1                                   S2D00530
                          LDD   3 126       GET Y*LOG2E         .B1+C   S2D00540
                          SLT   1           CORRECT FOR EXPONENT.B-2    S2D00550
                          AND     X+3       MAKE SIGN PTV               S2D00560
                          S       X+4       SUB 1/8                     S2D00570
                          STD     Z         STORE REMAINING FRACTION    S2D00580
                          MDX     EXP2                                  S2D00590
                    SRT   SLA     16        CLEAR ACCUMULATOR           S2D00600
                          S       BUF1+1    REVERSE EXPONENT SIGN.-C-3  S2D00610
                          STO     *+1       STORE PTV EXPONENT IN XR1   S2D00620
                          LDX  L1 *-*       PTV EXPONENT IN XR1   .C    S2D00630
                          S       C32       CHECK SIZE OF EXPONENT      S2D00640
                          BSC     -         BR IF IN RANGE              S2D00650
                          LDX   1 32        TOO BIG,SET XR1 TO 32       S2D00660
                          LDD   3 126       GET Y*LOG2E         .B1+C   S2D00670
                          BSC     +Z        BR IF NOT NEG               S2D00680
                          SD      ONE       IF NEG,DECR EXPONENT BY 1   S2D00690
                          SRT   1           CORRECT FOR EXPONENT.B-2    S2D00700
                          BSC     +Z        BR IF NOT NEG               S2D00710
                          AD      ONE       IF NEG,RESTORE 1            S2D00720
                          STD   3 126       MODIFIED Y*LOG2E IN FAC     S2D00730
                          LDX   1 0         XR1=ZERO                    S2D00740
                          MDX     SRTR      GO TO GET N,D,Z             S2D00750
                    ONE   DEC     1         FLT PT ONE                  S2D00760
                    HELP  DEC     1.999999999999B1   OVERFLOW CON       S2D00770
                    M8TAB DEC     1.090507732725258B1      1/8          S2D00780
                          DEC     1.296839554851010B1      3/8          S2D00790
                          DEC     1.542210825807941B1      5/8          S2D00800
                          DEC     1.834008086509342B1      7/8          S2D00810
                    LOG2E DEC     1.442695041288963B1                   S2D00820
                    A1    DEC     0.6931471806663105B0    CONSTANTS     S2D00830
                    A2    DEC     2.402264858011591E-1B-2 FOR           S2D00840
                    A3    DEC     5.550410540590362E-2B-4 APPROXIMATION S2D00850
                    A4    DEC     9.621739874741388E-3B-6 POLYNOMIAL.   S2D00860
                    A5    DEC     1.333772937497065E-3B-9               S2D00870
                    Z     DEC     0         STORE REMAINDER FRACTION    S2D00880
                    X     DC      128+14    CHK SIZE OF EXPONENT        S2D00890
                          DC      14+3      SCALE EXPONENT              S2D00900
                          DC      129       SCALE EXPONENT              S2D00910
                          DC      /7FFF     CHANGE SIGN TO PTV          S2D00920
                          DC      /4000     CON OF 1/8                  S2D00930
                          DC      15000                                 S2D00940
                    C32   DC      32                                    S2D00950
                    *                                                   S2D00960
                    *USE POLYNOMIAL APPROXIMATION TO CALC 2**Z          S2D00970
                    *                                                   S2D00980
                    EXP2  LDD     Z         GET Z INTO FAC        .B-2  S2D00990
                          STD   3 126                                   S2D01000
                          LDD     A5        A5 INTO ACC AND EXT   .B-9  S2D01010
                          LIBF    XMD       A5*Z                  .B-11 S2D01020
                          LDX   1 5         XR1=5 FOR SHIFT             S2D01030
                          BSI     SRTM      SHIFT RT 5 TO ADD A4  .B-6  S2D01040
                          AD      A4        A4+A5*Z               .B-6  S2D01050
                          LIBF    XMD       Z*(A4+A5*Z)           .B-8  S2D01060
                          LDX   1 4         XR1=4 FOR SHIFT             S2D01070
                          BSI     SRTM      SHIFT RT 4 TO ADD A3  .B-4  S2D01080
                          AD      A3        A3+(ACC AND EXT)      .B-4  S2D01090
                          LIBF    XMD       MPY BY Z              .B-6  S2D01100
                          LDX   1 4         XR1=4 FOR SHIFT             S2D01110
                          BSI     SRTM      SHIFT RT 4 TO ADD A2  .B-2  S2D01120
                          AD      A2                              .B-2  S2D01130
                          LIBF    XMD       MPY BY Z              .B-4  S2D01140
                          LDX   1 4         XR1=4 FOR SHIFT             S2D01150
                          BSI     SRTM      SHIFT RT 4 TO ADD A1  .B0   S2D01160
                          AD      A1                              .B0   S2D01170
                          LIBF    XMD       MPY BY Z              .B-2  S2D01180
                          STD   3 126       SAVE RESULT IN FAC          S2D01190
                    *                                                   S2D01200
                    *GET 2**D AND MULTIPLY TIMES 2**Z                   S2D01210
                    *                                                   S2D01220
                    D     LDX  L2 *-*       PUT REFERENCE NO. IN XR2    S2D01230
                          LDD  L2 M8TAB     GET 2**D              .B1   S2D01240
                          LIBF    XMD       MPY BY 2**Z           .B-1  S2D01250
                          LDX   1 2         XR2=2 FOR SHIFT             S2D01260
                          BSI     SRTM      SHIFT RT 2 TO ADD     .B1   S2D01270
                          AD   L2 M8TAB     ADD ON A0 TERM        .B1   S2D01280
                          BSC     O         BR IF NO OVFLO              S2D01290
                          LDD     HELP      OVFL DUE TO ROUND ERROR.    S2D01300
                          STD   3 126       STORE FINAL RESULT          S2D01310
                    EXPS  LDS     *-*       RESTORE STATUS              S2D01320
                          LIBF    FARC      CHECK FAC RANGE             S2D01330
                    XR1   LDX  L1 *-*       RESTORE XR1                 S2D01340
                    XR2   LDX  L2 *-*       RESTORE XR2                 S2D01350
                          BSC  I  EXPN                                  S2D01360
                    SRTM  DC      0         SHIFT RIGHT ROUTINE.        S2D01370
                          BSC     +Z        CONVERT - NUMBER            S2D01380
                          SD      ONE       TO ONES COMP.(SHIFTABLE)    S2D01390
                          SRT   1           SHIFT                       S2D01400
                          BSC     +Z        RE-CONVERT                  S2D01410
                          AD      ONE                                   S2D01420
                          BSC  I  SRTM                                  S2D01430
                    OVFL  LD    3 126       IF ARGUMENT IS MUCH TOO     S2D01440
                          STO   3 125       FAR OUT OF RANGE, SET       S2D01450
                          SRA     1         FAC TO FORCE PROPER         S2D01460
                          STO   3 126       ACTION IN FARC.             S2D01470
                          MDX     EXPS                                  S2D01480
                          END                                           S2D01490
