                    *************************************************** R2D00010
                    *                                                 * R2D00020
                    *   SUBROUTINE NAME-                              * R2D00030
                    *      FULL NAME- STANDARD PRECISION FLOATING-    * R2D00040
                    *         POINT EXPONENTIAL FUNCTION.             * R2D00050
                    *      CODE NAME- FXPN/FEXP                       * R2D00060
                    *   PURPOSE- THIS SUBPROGRAM COMPUTES THE FLOATING* R2D00070
                    *      POINT EXPONENTIAL OF A STANDARD PRECISION  * R2D00080
                    *      FLOATING-POINT NUMBER.                     * R2D00090
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* R2D00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * R2D00110
                    *      SUBROUTINE LIBRARY MANUAL.                 * R2D00120
                    *   SPECIAL FEATURES- N/A                         * R2D00130
                    *   ADDITIONAL INFORMATION-                       * R2D00140
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * R2D00150
                    *         SUBROUTINE LIBRARY MANUAL               * R2D00160
                    *      OTHER- A PERIOD FOLLOWED BY B, APPEARING TO* R2D00170
                    *         THE RIGHT OF COMMENT, INDICATES THAT THE* R2D00180
                    *         NUMBER FOLLOWING IS THE BINARY POINT OF * R2D00190
                    *         THE NUMBER PRESENTLY IN THE ACCUMULATOR.* R2D00200
                    *         LET C REFER TO THE TRUE EXPONENT OF THE * R2D00210
                    *         INPUT ARGUMENT.                         * R2D00220
                    *                                                 * R2D00230
                    *************************************************** R2D00240
                          HDNG    CALL FEXP  -V1.                       R2D00250
                          SPR                                           R2D00260
                          ENT     FEXP      STANDARD FORTRAN NAME       R2D00270
                          ENT     FXPN                                  R2D00280
                    FEXP  DC      0         FORTRAN ENTRY               R2D00290
                          LIBF    FGETP     GET PARAMETER               R2D00300
                    FXPN  DC      0         USER ENTRY                  R2D00310
                          STS     EXPS      SAVE STATUS                 R2D00320
                          STX   1 XR1+1     SAVE XR1                    R2D00330
                          STX   2 XR2+1     SAVE XR2                    R2D00340
                          LDD     LOG2E     GET LOG2E           .B1     R2D00350
                          LIBF    XMDS      MPY BY (FAC).       .B1+C   R2D00360
                    *                       LET Y=INPUT ARGUMENT        R2D00370
                          STD   3 126       STORE Y*LOG2E IN FAC.B1+C   R2D00380
                          LD    3 125       GET Y EXPONENT              R2D00390
                          S       X         SUB 128+14.          C-14   R2D00400
                          BSC  L  OVFL,Z-   BR IF Y EXPONENT TOO BIG    R2D00410
                          A       X+1       SCALE Y EXPONENT BY 3. C+3  R2D00420
                          STO     BUF1+1    KEEP SCALED EXPONENT        R2D00430
                          BSC  L  SRT,+Z    BR IF EXPONENT LT -3        R2D00440
                    BUF1  LDX  L1 *-*       Y EXPONENT+3 IN XR1   .C-3  R2D00450
                          LD    3 126       GET Y*LOG2E          .B1+C  R2D00460
                    SRTR  SRT     17        MOVE TO EXTENSION   .B18+C  R2D00470
                          SLT   1           SHIFT TO EXPONENT+3  .B15   R2D00480
                          A       X+2       ADD IN EXCESS               R2D00490
                          STO   3 125       SET THE EXPONENT OF 2=N     R2D00500
                          SLA     16        CLEAR ACCUMULATOR           R2D00510
                          SLT     2         2 BITS USED AS INDR         R2D00520
                          SLA     1         MPY D BY 2                  R2D00530
                          STO     D+1                                   R2D00540
                          LDD   3 126       GET Y*LOG2E         .B1+C   R2D00550
                          SLT   1           CORRECT FOR EXPONENT.B-2    R2D00560
                          AND     X+3       MAKE SIGN PTV               R2D00570
                          S       X+4       SUB 1/8                     R2D00580
                          STD     Z         STORE REMAINING FRACTION    R2D00590
                          MDX     EXP2                                  R2D00600
                    SRT   SLA     16        CLEAR ACCUMULATOR           R2D00610
                          S       BUF1+1    REVERSE EXPONENT SIGN.-C-3  R2D00620
                          STO     *+1       STORE PTV EXPONENT IN XR1   R2D00630
                          LDX  L1 *-*       PTV EXPONENT IN XR1   .C-3  R2D00640
                          S       C32       CHECK SIZE OF EXPONENT      R2D00650
                          BSC     -         BR IF IN RANGE              R2D00660
                          LDX   1 32        TOO BIG,SET XR1 TO 32       R2D00670
                          LDD   3 126       GET Y*LOG2E         .B1+C   R2D00680
                          BSC     +Z        BR IF NOT NEG               R2D00690
                          SD      ONE       IF NEG,DECR EXPONENT BY 1   R2D00700
                          SRT   1           CORRECT FOR EXPONENT.B-2    R2D00710
                          BSC     +Z        BR IF NOT NEG               R2D00720
                          AD      ONE       IF NEG,RESTORE 1            R2D00730
                          STD   3 126       MODIFIED Y*LOG2E IN FAC     R2D00740
                          LDX   1 0         XR1=ZERO                    R2D00750
                          MDX     SRTR      GO TO GET N,D,Z             R2D00760
                    ONE   DEC     1         FLT PT ONE                  R2D00770
                    HELP  DEC     1.999999999999B1   OVERFLOW CON       R2D00780
                    M8TAB DEC     1.090507734725258B1     2**(1/8)      R2D00790
                          DEC     1.296839554851010B1     2**(3/8)      R2D00800
                          DEC     1.542210825807941B1     2**(5/8)      R2D00810
                          DEC     1.834008086509342B1     2**(5/8)      R2D00820
                    LOG2E DEC     1.442695041288963B1  LOG BASE 2 OF E  R2D00830
                    A1    DEC     0.693147079B2        CONSTANTS        R2D00840
                    A2    DEC     0.240226486B4        FOR              R2D00850
                    A3    DEC     0.0555301557B6       APPROXIMATING    R2D00860
                    A4    DEC     0.0096217399B8       POLYNOMIAL       R2D00870
                    Z     DEC     0         STORE REMAINDER FRACTION    R2D00880
                    X     DC      128+14    CHK SIZE OF EXPONENT        R2D00890
                          DC      14+3      SCALE EXPONENT              R2D00900
                          DC      129       SCALE EXPONENT              R2D00910
                          DC      /7FFF     CHANGE SIGN TO PTV          R2D00920
                          DC      /4000     CON OF 1/8                  R2D00930
                          DC      15000                                 R2D00940
                    C32   DC      32                                    R2D00950
                    EXP2  LDD     Z         USE THE POLYNOMIAL    .B-2  R2D00960
                          STD   3 126       APPROXIMATION TO GET        R2D00970
                          LDD     A4        2**Z                  .B8   R2D00980
                          LIBF    XMDS                            .B6   R2D00990
                          AD      A3                              .B6   R2D01000
                          LIBF    XMDS                            .B4   R2D01010
                          AD      A2                              .B4   R2D01020
                          LIBF    XMDS                            .B2   R2D01030
                          AD      A1                              .B2   R2D01040
                          LIBF    XMDS                            .B0   R2D01050
                          STD   3 126       STORE 2**Z IN FAC           R2D01060
                    D     LDX  L2 *-*       SET XR2 TO REFERENCE TABLE  R2D01070
                          LDD  L2 M8TAB     GET 2**D              .B1   R2D01080
                          LIBF    XMDS      (2**Z)*(2**D)         .B1   R2D01090
                          AD   L2 M8TAB     ADD IN AO TERM        .B1   R2D01100
                          BSC     O         BR IF NO OVERFLOW           R2D01110
                          LDD     HELP      OVFLO DUE TO ROUND ERROR.   R2D01120
                          STD   3 126       STORE IN FAC                R2D01130
                    EXPS  LDS     *-*       RESTORE STATUS              R2D01140
                          LIBF    FARC      CHECK FAC RANGE.            R2D01150
                    XR1   LDX  L1 *-*       RESTORE XR1                 R2D01160
                    XR2   LDX  L2 *-*       RESTORE XR2                 R2D01170
                          BSC  I  FXPN                                  R2D01180
                    OVFL  LD    3 126       IF ARGUMENT IS MUCH TOO     R2D01190
                          STO   3 125       FAR OUT OF RANGE, SET       R2D01200
                          SRA     1         FAC TO FORCE PROPER         R2D01210
                          STO   3 126       ACTION IN FARC.             R2D01220
                          MDX     EXPS                                  R2D01230
                          END                                           R2D01240
