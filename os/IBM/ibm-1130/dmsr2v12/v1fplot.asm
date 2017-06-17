                          HDNG    CALL FPLOT                            V1I00010
                    *************************************************** V1I00020
                    *                                                 * V1I00030
                    *   SUBROUTINE NAME-                              * V1I00040
                    *      FULL NAME- STANDARD PRECISION PLOT LINE    * V1I00050
                    *         FUNCTION.                               * V1I00060
                    *      CODE NAME- FPLOT.                          * V1I00070
                    *   PURPOSE- MOVES THE PEN FROM ITS PRESENT       * V1I00080
                    *      POSITION TO A NEW POSITION.                * V1I00090
                    *   METHOD- N/A.                                  * V1I00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM         * V1I00110
                    *      1130/1800 PLOTTER SUBROUTINES MANUAL       * V1I00120
                    *      (FORM C26-3755).                           * V1I00130
                    *   SPECIAL FEATURES- N/A.                        * V1I00140
                    *   ADDITIONAL INFORMATION- N/A.                  * V1I00150
                    *                                                 * V1I00160
                    *************************************************** V1I00170
                          HDNG    CALL FPLOT                            V1I00180
                    *             THE CALL TO THE FPLOT SUBROUTINE      V1I00190
                    *             IS AS FOLLOWS                         V1I00200
                    *                                                   V1I00210
                    *             CALL    FPLOT                         V1I00220
                    *             DC      INDICATOR                     V1I00230
                    *             DC      X                             V1I00240
                    *             DC      Y                             V1I00250
                    *                                                   V1I00260
                          SPR                                           V1I00270
                          ENT     FPLOT                                 V1I00280
                    *                                                   V1I00290
                    *             CONSTANTS                             V1I00300
                    *                                                   V1I00310
                    X     DEC     .0        X COORDINATE                V1I00320
                    Y     DEC     .0        Y COORDINATE                V1I00330
                    MONE  DC      9         RAISE PEN                   V1I00340
                    ONE   DC      0         LOWER PEN                   V1I00350
                    *                                                   V1I00360
                    FPLOT DC      *-*       ENTRY/RETURN ADDRESS        V1I00370
                          STX   1 EXIT+1    SAVE XR1                    V1I00380
                          LDX  I1 FPLOT     POINT TO FIRST PARAMETER    V1I00390
                          LD   I1 0         FETCH AND                   V1I00400
                          STO     AREA      *SAVE INDICATOR             V1I00410
                          BSI  L  CNTL,Z-   BR IF INDICATOR POSITIVE    V1I00420
                    FP1   LDD  I1 1         FETCH AND                   V1I00430
                          STD     X         *SAVE X                     V1I00440
                          LDD  I1 2         FETCH AND                   V1I00450
                          STD     Y         *SAVE Y                     V1I00460
                          MDX   1 3         COMPUTE AND                 V1I00470
                          STX   1 EXIT+3    *STORE RETURN ADDRESS       V1I00480
                          LIBF    FMOVE     COMPUTE DELTA (X AND Y)     V1I00490
                          DC      X                                     V1I00500
                          DC      Y                                     V1I00510
                          LIBF    XYPLT     PLOT DELTA (X AND Y)        V1I00520
                          DC      X                                     V1I00530
                          DC      Y                                     V1I00540
                          LD      AREA      TEST FOR AND                V1I00550
                          BSI  L  CNTL,Z+   *BR IF INDICATOR NEGATIVE   V1I00560
                    EXIT  LDX  L1 *-*       RESTORE XR1                 V1I00570
                          BSC  L  *-*       RETURN                      V1I00580
                    *                                                   V1I00590
                    CNTL  DC      *-*                                   V1I00600
                          BSC  L  IN,E      BRANCH IF INDICATOR ODD     V1I00610
                          LD      ONE       LOWER PEN                   V1I00620
                          MDX     OUT                                   V1I00630
                    IN    LD      MONE      RAISE PEN                   V1I00640
                    OUT   STO     AREA                                  V1I00650
                          LIBF    PLOTI     PLOT PEN CONTROL            V1I00660
                    AREA  DC      *-*       INDICATOR                   V1I00670
                          BSC  I  CNTL                                  V1I00680
                          END                                           V1I00690
