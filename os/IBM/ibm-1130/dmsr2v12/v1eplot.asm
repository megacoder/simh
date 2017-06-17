                          HDNG    CALL EPLOT                            V1D00010
                    *************************************************** V1D00020
                    *                                                 * V1D00030
                    *   SUBROUTINE NAME-                              * V1D00040
                    *      FULL NAME- EXTENDED PRECISION PLOT LINE    * V1D00050
                    *         FUNCTION.                               * V1D00060
                    *      CODE NAME- EPLOT.                          * V1D00070
                    *   PURPOSE- MOVES THE PEN FROM ITS PRESENT       * V1D00080
                    *      POSITION TO A NEW POSITION.                * V1D00090
                    *   METHOD- N/A.                                  * V1D00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM         * V1D00110
                    *      1130/1800 PLOTTER SUBROUTINES MANUAL       * V1D00120
                    *      (FORM C26-3755).                           * V1D00130
                    *   SPECIAL FEATURES- N/A.                        * V1D00140
                    *   ADDITIONAL INFORMATION- N/A.                  * V1D00150
                    *                                                 * V1D00160
                    *************************************************** V1D00170
                          HDNG    CALL EPLOT                            V1D00180
                    *             THE CALL TO THE EPLOT SUBROUTINE      V1D00190
                    *             IS AS FOLLOWS                         V1D00200
                    *                                                   V1D00210
                    *             CALL    EPLOT                         V1D00220
                    *             DC      INDICATOR                     V1D00230
                    *             DC      X                             V1D00240
                    *             DC      Y                             V1D00250
                    *                                                   V1D00260
                          EPR                                           V1D00270
                          ENT     EPLOT                                 V1D00280
                    *                                                   V1D00290
                    *             CONSTANTS                             V1D00300
                    *                                                   V1D00310
                    X     XFLC    .0        X COORDINATE                V1D00320
                    Y     XFLC    .0        Y COORDINATE                V1D00330
                    MONE  DC      9         RAISE PEN                   V1D00340
                    ONE   DC      0         LOWER PEN                   V1D00350
                    *                                                   V1D00360
                    EPLOT DC      *-*       ENTRY/RETURN ADDRESS        V1D00370
                          STX   1 EXIT+1    SAVE XR1                    V1D00380
                          LDX  I1 EPLOT     POINT TO FIRST PARAMETER    V1D00390
                          LD   I1 0         FETCH INDICATOR             V1D00400
                          STO     AREA      *AND SAVE                   V1D00410
                          BSI  L  CNTL,Z-   BR IF INDICATOR POSITIVE    V1D00420
                    FP1   LD    1 1         FETCH X,                    V1D00430
                          STO     *+1       *CHANGE                     V1D00440
                          LIBF    ELD       *TO                         V1D00450
                          DC      *-*       *EXTENDED                   V1D00460
                          LIBF    ESTO      *PRECISION                  V1D00470
                          DC      X         *AND SAVE                   V1D00480
                          LD    1 2         FETCH Y,                    V1D00490
                          STO     *+1       *CHANGE                     V1D00500
                          LIBF    ELD       *TO                         V1D00510
                          DC      *-*       *EXTENDED                   V1D00520
                          LIBF    ESTO      *PRECISION                  V1D00530
                          DC      Y         *AND SAVE                   V1D00540
                          MDX   1 3         COMPUTE AND                 V1D00550
                          STX   1 EXIT+3    *STORE RETURN ADDRESS       V1D00560
                          LIBF    EMOVE     COMPUTE DELTA (X AND Y)     V1D00570
                          DC      X                                     V1D00580
                          DC      Y                                     V1D00590
                          LIBF    XYPLT     PLOT DELTA (X AND Y)        V1D00600
                          DC      X                                     V1D00610
                          DC      Y                                     V1D00620
                          LD      AREA      TEST FOR AND                V1D00630
                          BSI  L  CNTL,Z+   *BR IF INDICATOR NEGATIVE   V1D00640
                    EXIT  LDX  L1 *-*       RESTORE XR1                 V1D00650
                          BSC  L  *-*       RETURN                      V1D00660
                    *                                                   V1D00670
                    CNTL  DC      *-*                                   V1D00680
                          BSC  L  IN,E      BRANCH IF INDICATOR ODD     V1D00690
                          LD      ONE       LOWER PEN                   V1D00700
                          MDX     OUT                                   V1D00710
                    IN    LD      MONE      RAISE PEN                   V1D00720
                    OUT   STO     AREA                                  V1D00730
                          LIBF    PLOTI     PLOT PEN CONTROL            V1D00740
                    AREA  DC      *-*       INDICATOR                   V1D00750
                          BSC  I  CNTL                                  V1D00760
                          END                                           V1D00770
