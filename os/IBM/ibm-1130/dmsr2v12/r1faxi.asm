                    *************************************************** R1B00010
                    *                                                 * R1B00020
                    *   SUBROUTINE NAME-                              * R1B00030
                    *      FULL NAME- STANDARD PRECISION FLOATING-    * R1B00040
                    *         POINT A**I FUNCTION.                    * R1B00050
                    *      CODE NAME- FAXI/FAXIX                      * R1B00060
                    *   PURPOSE- THIS FUNCTION COMPUTES A STANDARD    * R1B00070
                    *      PRECISION FLOATING POINT NUMBER TAKEN TO AN* R1B00080
                    *      INTEGER EXPONENT.                          * R1B00090
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* R1B00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * R1B00110
                    *      SUBROUTINE LIBRARY MANUAL.                 * R1B00120
                    *   SPECIAL FEATURES- N/A                         * R1B00130
                    *   ADDITIONAL INFORMATION-                       * R1B00140
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * R1B00150
                    *         SUBROUTINE LIBRARY MANUAL               * R1B00160
                    *                                                 * R1B00170
                    *************************************************** R1B00180
                          HDNG    LIBF FAXI  -V1.                       R1B00190
                          LIBR                                          R1B00200
                          SPR                                           R1B00210
                          ENT     FAXI                                  R1B00220
                          ENT     FAXIX                                 R1B00230
                    FAXIX STX   1 SAVE+1    SAVE XR1                    R1B00240
                          LD   L  *-*       CALL+1                      R1B00250
                          MDX     COM                                   R1B00260
                    FAXI  STX   1 SAVE+1    SAVE XR1                    R1B00270
                          LD   L  *-*       CALL+1                      R1B00280
                          LDX   1 0         XR1=ZERO                    R1B00290
                    COM   STO     *+3                                   R1B00300
                          A       ONE       BUILD EXIT                  R1B00310
                          STO     EXIT+1                                R1B00320
                          MDX  I1 *-*       OP ADDRESS INTO XR1         R1B00330
                          NOP               IF MDX CAUSES BR, SKIP NOP  R1B00340
                    *                                                   R1B00350
                    *CHECK FOR SPECIAL CONDITIONS. GET SIGN OF I. USE   R1B00360
                    *ABSOLUTE VALUE OF I. INITIALIZE FACTR.             R1B00370
                    *                                                   R1B00380
                          LD    3 126       GET FLT PT BASE=A           R1B00390
                          BSC  L  ZOER,+-   BR A=ZERO                   R1B00400
                          LD    1 0         GET INTEGER EXPONENT=I      R1B00410
                          BSC  L  STONE,+-  BR I=ZERO                   R1B00420
                          LDD     FL1       GET FLT PT 1                R1B00430
                          STD     FACTR     FACTR=1                     R1B00440
                          SLA     16        CLEAR ACCUMULATOR           R1B00450
                          S     1 0         GET - I                     R1B00460
                          BSC     +         SKIP IF -I IS PTV           R1B00470
                          LD    1 0         -I NEG,GET I                R1B00480
                          STO     I         STORE ABS VALUE OF I        R1B00490
                    *                                                   R1B00500
                    *COMPUTE A**I                                       R1B00510
                    *                                                   R1B00520
                    EVEN  LIBF    FSTO      GET CONTENTS OF FAC         R1B00530
                          DC      A         STORE IN A                  R1B00540
                          LD      I                                     R1B00550
                          BSC  L  MULT,E    BR IF LEAST BIT OF I = ONE  R1B00560
                    SHRT1 SRA     1         REPLACE I WITH I/2          R1B00570
                          STO     I                                     R1B00580
                          BSC  L  NEGCK,+-  BR IF I=ZERO                R1B00590
                          LIBF    FLD       GET (A) INTO FAC            R1B00600
                          DC      A                                     R1B00610
                          LIBF    FMPY      MPY,STORE (A)((A) IN FAC    R1B00620
                          DC      A                                     R1B00630
                          MDX     EVEN                                  R1B00640
                    MULT  LIBF    FMPY                                  R1B00650
                          DC      FACTR                                 R1B00660
                          LIBF    FSTO                                  R1B00670
                          DC      FACTR     FACTR=FACTR*A               R1B00680
                          LD      I         GET I                       R1B00690
                          MDX     SHRT1     RET TO REITERATE            R1B00700
                    *                                                   R1B00710
                    *IF I WAS NEGATIVE,TAKE RECIPROCAL OF RESULT        R1B00720
                    *                                                   R1B00730
                    NEGCK LD    1 0         GET ORIGINAL I              R1B00740
                          BSC  L  RCPR,+    BR IF I NEGATIVE            R1B00750
                    SAVE  LDX  L1 *-*       RESTORE XR1                 R1B00760
                    EXIT  BSC  L  *-*       (FAC)=(FACTR)               R1B00770
                    *                                                   R1B00780
                    *SUBROUTINES TO TAKE RECIPROCAL, LOAD ONE INTO FAC  R1B00790
                    *OR SET ERROR INDICATORS.                           R1B00800
                    *                                                   R1B00810
                    RCPR  LIBF    FDVR                                  R1B00820
                          DC      FL1                                   R1B00830
                          MDX     SAVE      (FAC)=1/(FACTR)             R1B00840
                    STONE LIBF    FLD       SINCE I=O,A NOT ZERO        R1B00850
                          DC      FL1       SET A**I=1                  R1B00860
                          MDX     SAVE      (FAC)=1                     R1B00870
                    ZOER  LD    1 0         CHECK I. IF NOT POSITIVE,   R1B00880
                          BSC  L  SAVE,-Z   TURN ON A**I PROGRAM        R1B00890
                          LD      AIEBT     ERROR INDICATOR.            R1B00900
                          OR    3 124                                   R1B00910
                          STO   3 124                                   R1B00920
                          MDX     SAVE                                  R1B00930
                    *                                                   R1B00940
                    *CONSTANTS AREA                                     R1B00950
                    *                                                   R1B00960
                    ONE   DC      1         SINGLE WORD ONE             R1B00970
                    I     DC      0         STORE INTEGER EXPONENT      R1B00980
                    FL1   DEC     1.0       FLT PT STD PREC ONE         R1B00990
                    A     DEC     0.0       STORE FLT PT BASE           R1B01000
                    FACTR DEC     0.0       STORE RESULTS               R1B01010
                    AIEBT DC      /20       BIT 10--A**I ERROR BIT.     R1B01020
                          END                                           R1B01030
