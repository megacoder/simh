                    *************************************************** S1B00010
                    *                                                 * S1B00020
                    *   SUBROUTINE NAME-                              * S1B00030
                    *      FULL NAME- EXTENDED PRECISION FLOATING     * S1B00040
                    *         POINT A**I FUNCTION.                    * S1B00050
                    *      CODE NAME- EAXI/EAXIX                      * S1B00060
                    *   PURPOSE- THIS SUBPROGRAM COMPUTES AN EXTENDED * S1B00070
                    *      PRECISION FLOATING-POINT BASE TO AN INTEGER* S1B00080
                    *      EXPONENT.                                  * S1B00090
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* S1B00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * S1B00110
                    *      SUBROUTINE LIBRARY MANUAL.                 * S1B00120
                    *   SPECIAL FEATURES- N/A                         * S1B00130
                    *   ADDITIONAL INFORMATION-                       * S1B00140
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * S1B00150
                    *         SUBROUTINE LIBRARY MANUAL               * S1B00160
                    *                                                 * S1B00170
                    *************************************************** S1B00180
                          HDNG    LIBF EAXI  -V1.                       S1B00190
                          LIBR                                          S1B00200
                          EPR                                           S1B00210
                          ENT     EAXI                                  S1B00220
                          ENT     EAXIX                                 S1B00230
                    EAXIX STX   1 SAVE+1    SAVE XR1                    S1B00240
                          LD   L  *-*       LOADER INSERT               S1B00250
                          MDX     COM                                   S1B00260
                    EAXI  STX   1 SAVE+1    SAVE XR1                    S1B00270
                          LD   L  *-*       LOADER INSERT               S1B00280
                          LDX   1 0         INITIALIZE XR1-NOT USED     S1B00290
                    COM   STO     *+3                                   S1B00300
                          A       ONE       BUILD EXIT                  S1B00310
                          STO     EXIT+1                                S1B00320
                          MDX  I1 *-*       OPND ADDR INTO XR1          S1B00330
                          NOP               MAY SKIP                    S1B00340
                    *                                                   S1B00350
                    *CHECK FOR SPECIAL CONDITIONS. GET ABSOLUTE VALUE   S1B00360
                    *OF I.  INITIALIZE FACTOR.                          S1B00370
                    *                                                   S1B00380
                          LD    3 126       GET BASE=A                  S1B00390
                          BSC  L  ZOER,+-   BR IF A=0 TO CHK FOR ERROR  S1B00400
                          LD    1 0         GET EXPONENT=I              S1B00410
                          BSC  L  STONE,+-  BR IF I=O TO RET ONE        S1B00420
                          LD      FL1       GET FLT PT ONE              S1B00430
                          STO     FACTR     SET FACTR TO EXTENDED       S1B00440
                          LDD     FL1+1     PRECISION FLT PT ONE--      S1B00450
                          STD     FACTR+1   INITIALIZE PRODUCT LOOP.    S1B00460
                          SLA     16        CALC ABS VALUE OF I         S1B00470
                          S     1 0         AND STORE IN I              S1B00480
                          BSC     +                                     S1B00490
                          LD    1 0                                     S1B00500
                          STO     I                                     S1B00510
                    *                                                   S1B00520
                    *COMPUTE A**I                                       S1B00530
                    *                                                   S1B00540
                    EVEN  LIBF    ESTO                                  S1B00550
                          DC      A         A=A*A                       S1B00560
                          LD      I         PUT ABS VALUE OF I IN A REG S1B00570
                          BSC  L  MULT,E    BR IF LEAST BIT OF I = ONE  S1B00580
                    SHRT1 SRA     1         I=I/2                       S1B00590
                          STO     I                                     S1B00600
                          BSC  L  NEGCK,+-  IF I=ZERO,GO CHK FOR NEG I  S1B00610
                          LIBF    ELD       OTHERWISE,GET CURRENT       S1B00620
                          DC      A         CONTENTS OF A AND SQUARE    S1B00630
                          LIBF    EMPY      THEM,LEAVING RSLT IN FAC.   S1B00640
                          DC      A                                     S1B00650
                          MDX     EVEN      REPEAT LOOP                 S1B00660
                    MULT  LIBF    EMPY      IF PRESENT I VALUE IS ODD,  S1B00670
                          DC      FACTR     MPY FACTR BY A TO ACCOUNT   S1B00680
                          LIBF    ESTO      FOR THE BIT LOST IN SHIFT.  S1B00690
                          DC      FACTR                                 S1B00700
                          LD      I         RESTORE I TO A REG          S1B00710
                          MDX     SHRT1     RET TO SQUARE A             S1B00720
                    *                                                   S1B00730
                    *IF I WAS NEGATIVE, TAKE RECIPROCAL OF RESULT       S1B00740
                    *                                                   S1B00750
                    NEGCK LD    1 0         GET SIGN OF I               S1B00760
                          BSC  L  RCPR,+    IF NEG,GO TO GET RECIPROCAL S1B00770
                    SAVE  LDX  L1 *-*       RESTORE XR1                 S1B00780
                    EXIT  BSC  L  *-*       EXIT                        S1B00790
                    *                                                   S1B00800
                    *SUBROUTINES TO TAKE RECIPROCAL,OR LOAD ONE INTO    S1B00810
                    *FAC,OR SET ERROR CONDITION INDICATORS.             S1B00820
                    *                                                   S1B00830
                    RCPR  LIBF    EDVR      TAKE RECIPROCAL OF FACTR    S1B00840
                          DC      FL1       AND PUT IN FAC.             S1B00850
                          MDX     SAVE      GO TO EXIT                  S1B00860
                    STONE LIBF    ELD       A NOT ZERO,I=ZERO=RETURN    S1B00870
                          DC      FL1       FLT PT ONE IN FAC           S1B00880
                          MDX     SAVE      GO TO EXIT                  S1B00890
                    ZOER  LD    1 0         A=ZERO.GET SIGN OF I        S1B00900
                          BSC  L  SAVE,-Z   IF PTV,EXIT WITH FAC=ZERO   S1B00910
                          LD      AIEBT     IF NOT PTV,TURN ON ERROR    S1B00920
                          OR    3 124       INDICATOR.                  S1B00930
                          STO   3 124                                   S1B00940
                          MDX     SAVE      GO TO EXIT                  S1B00950
                    *                                                   S1B00960
                    *CONSTANTS AND BUFFER AREA                          S1B00970
                    *                                                   S1B00980
                    ONE   DC      1         SINGLE WORD ONE             S1B00990
                          BSS  E  0                                     S1B01000
                    I     DC      0         EXPONENT BUFFER             S1B01010
                    FL1   XFLC    1.0       EXTENDED PREC FLT PT ONE    S1B01020
                    A     XFLC    0.0       BASE BUFFER                 S1B01030
                    FACTR XFLC    0.0       PRODUCT BUFFER              S1B01040
                    AIEBT DC      /20       BIT 10--A**I ERROR BIT.     S1B01050
                          END                                           S1B01060
