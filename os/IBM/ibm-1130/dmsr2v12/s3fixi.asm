                    *************************************************** S3B00010
                    *                                                 * S3B00020
                    *   SUBROUTINE NAME-                              * S3B00030
                    *      FULL NAME- I**J INTEGER FUNCTION.          * S3B00040
                    *      CODE NAME- FIXI/FIXIX                      * S3B00050
                    *   PURPOSE- THIS FUNCTION COMPUTES A SINGLE WORD * S3B00060
                    *      INTEGER TAKEN TO A SINGLE WORD INTEGER     * S3B00070
                    *      EXPONENT.                                  * S3B00080
                    *   METHOD-SEE IBM 1130 SUBROUTINE LIBRARY MANUAL.* S3B00090
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM 1130    * S3B00100
                    *      SUBROUTINE LIBRARY MANUAL.                 * S3B00110
                    *   SPECIAL FEATURES- N/A                         * S3B00120
                    *   ADDITIONAL INFORMATION-                       * S3B00130
                    *      ESTIMATED EXECUTION TIME- SEE IBM 1130     * S3B00140
                    *         SUBROUTINE LIBRARY MANUAL               * S3B00150
                    *                                                 * S3B00160
                    *************************************************** S3B00170
                          HDNG    LIBF FIXI  -V1.                       S3B00180
                          LIBR                                          S3B00190
                          ENT     FIXI                                  S3B00200
                          ENT     FIXIX                                 S3B00210
                    FIXIX STO     IHOLD     STORE INTEGER BASE          S3B00220
                          LD   L  *-*       CALL+1                      S3B00230
                          STX   1 FXSAV+1   SAVE XR1                    S3B00240
                          MDX     *+5                                   S3B00250
                    FIXI  STO     IHOLD     STORE INTEGER BASE          S3B00260
                          LD   L  *-*       CALL+1                      S3B00270
                          STX   1 FXSAV+1   SAVE XR1                    S3B00280
                          LDX   1 0         XR1 = ZERO                  S3B00290
                          STO     *+3       STORE OP ADDR               S3B00300
                          A       ONE       BUILD EXIT                  S3B00310
                          STO     FXEX+1                                S3B00320
                          MDX  I1 *-*       MODIFY X1 BY OP ADDRESS     S3B00330
                          NOP               IF MDX CAUSES BR,SLIP NOP   S3B00340
                    *                                                   S3B00350
                    *TAKE CARE OF ERROR CONDITION                       S3B00360
                    *                                                   S3B00370
                          STS     FXSTA     SAVE STATUS                 S3B00380
                          LD      IHOLD     GET INTEGER BASE            S3B00390
                          BSC  L  FIXI1,Z   BE IF NOT ZERO              S3B00400
                          LD    1 0         IF BASE ZERO, SET ACC TO    S3B00410
                          BSC  L  EZERO,-Z  ZERO. GET EXPONENT.BR IF    S3B00420
                          LD      ERFL      PTV,OTHERWISE SET ERROR     S3B00430
                          OR    3 124       INDR WORD (BIT 11) TO 1     S3B00440
                          STO   3 124       (ZERO TO NON-PTV EXPONENT)  S3B00450
                    *                                                   S3B00460
                    *EXIT                                               S3B00470
                    *                                                   S3B00480
                    EZERO SLA     16        ZERO ACC FOR ZERO BASE      S3B00490
                    FXSTA LDS     *-*       RESTORE STATUS              S3B00500
                    FXSAV LDX  L1 *-*       RESTORE XR1                 S3B00510
                    FXEX  BSC  L  *-*       EXIT                        S3B00520
                    *                                                   S3B00530
                    *CALCULATE I**J                                     S3B00540
                    *                                                   S3B00550
                    FIXI1 S       ONE       IF BASE NOT ZERO,SUB 1      S3B00560
                          BSC  L  EXONE,+-  BR IF BASE=+1.I**J=+1       S3B00570
                          A       TWO                                   S3B00580
                          BSC  L  *+7,Z     BR IF BASE NOT +1,-1,ZERO   S3B00590
                          LD    1 0         BASE=-1.                  . S3B00600
                          BSC  L  *+2,E     BR IF EXPONENT IS ODD       S3B00610
                    EXONE LD      ONE       I**J=+1                     S3B00620
                          MDX     FXSTA                                 S3B00630
                          LD      MASK      I**J=-1                     S3B00640
                          MDX     FXSTA                                 S3B00650
                          LD    1 0         GET EXPONENT                S3B00660
                          BSC  L  EXONE,+-  BR IF EXPONENT=0.I**J=+1    S3B00670
                          BSC  L  EZERO,+   BR EXPONENT NEG.I**J=ZERO O S3B00680
                          SRT     4         EXPONENT PTV                S3B00690
                          BSC  L  EZERO,Z   BR EXPONENT GT 15           S3B00700
                          SLT     4         OTHERWISE RESTORE EXPONENT  S3B00710
                          STO     COUNT     STORE AS A MPY COUNTER      S3B00720
                          LD      ONE       ACCUMULATOR = +1            S3B00730
                    IJPL  M       IHOLD     INCR POWER OF BASE BY ONE   S3B00740
                          RTE     16        SHIFT TO ACCUMULATOR        S3B00750
                          MDX  L  COUNT,-1  DECR COUNTER                S3B00760
                          MDX     IJPL      REPEAT                      S3B00770
                          MDX     FXSTA     BR OUT                      S3B00780
                    *                                                   S3B00790
                    *CONSTANTS AREA                                     S3B00800
                    *                                                   S3B00810
                    IHOLD DC      0         STORE INTEGER BASE          S3B00820
                    COUNT DC      0         STORE INTEGER EXPONENT      S3B00830
                    ONE   DC      1         SINGLE WORD ONE             S3B00840
                    TWO   DC      2         SINGLE WORD TWO             S3B00850
                    ERFL  DC      /10       1 IN BIT POSITION 11        S3B00860
                    MASK  DC      /FFFF     SINGLE WORD MINUS ONE       S3B00870
                          END                                           S3B00880
