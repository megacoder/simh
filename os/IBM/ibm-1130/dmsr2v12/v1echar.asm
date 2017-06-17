                    *************************************************** V1A00010
                    *                                                 * V1A00020
                    *   SUBROUTINE NAME-                              * V1A00030
                    *      FULL NAME- EXTENDED PRECISION CHARACTER    * V1A00040
                    *         INITIALIZATION SUBROUTINE.              * V1A00050
                    *      CODE NAME- ECHAR                           * V1A00060
                    *   PURPOSE- INITIALIZES THE ANNOTATION SUBROUTINE* V1A00070
                    *      TO ESTABLISH POSITION AND ORIENTATION OF   * V1A00080
                    *      CHARACTERS.                                * V1A00090
                    *   METHOD- N/A                                   * V1A00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM         * V1A00110
                    *      1130/1800 PLOTTER SUBROUTINES MANUAL       * V1A00120
                    *      (FORM C26-3755).                           * V1A00130
                    *   SPECIAL FEATURES- N/A                         * V1A00140
                    *   ADDITIONAL INFORMATION- N/A                   * V1A00150
                    *                                                 * V1A00160
                    *************************************************** V1A00170
                    *                                                   V1A00180
                    *             THE CALL TO THE ECHAR ROUTINE         V1A00190
                    *             IS AS FOLLOWS                         V1A00200
                    *                                                   V1A00210
                    *             CALL ECHAR                            V1A00220
                    *             DC   X(0) (REAL)                      V1A00230
                    *             DC   Y(0) (REAL)                      V1A00240
                    *             DC   XS (REAL)                        V1A00250
                    *             DC   YS (REAL)                        V1A00260
                    *             DC   THETA (REAL)                     V1A00270
                    *                                                   V1A00280
                          EPR                                           V1A00290
                          ENT     ECHAR     ENTER AT ECHAR              V1A00300
                    X     XFLC    .0        FLOATING POINT CONSTANTS    V1A00310
                    Y     XFLC    .0        *AND DATA STORAGE           V1A00320
                    XS    XFLC    .1                                    V1A00330
                    YS    XFLC    .1                                    V1A00340
                    THETA XFLC    0.                                    V1A00350
                    SIN   XFLC    0.                                    V1A00360
                    UP    DC      1         PEN CONTROL                 V1A00370
                    ECHAR DC      *-*       ENTRY                       V1A00380
                          STX   1 EXIT+1    SAVE XR1                    V1A00390
                          LD      ECHAR                                 V1A00400
                          STO     X2+1      SAVE RETURN ADDRESS         V1A00410
                          LDX   1 -15                                   V1A00420
                    X2    LD   L  *-*                                   V1A00430
                          STO     X1+1                                  V1A00440
                          MDX  L  X2+1,1                                V1A00450
                          NOP                                           V1A00460
                    X1    LIBF    ELD       ST C/ADDR IN * TO FAC       V1A00470
                          DC      *-*       MODIFIABLE PARAMETER        V1A00480
                          LIBF    ESTOX     ST C/FAC TO X+15+C/XR1      V1A00490
                          DC      X+15                                  V1A00500
                          MDX   1 3                                     V1A00510
                          MDX     X2        REPEAT                      V1A00520
                          CALL    EPLOT     RAISE AND POSITION PEN      V1A00530
                          DC      UP                                    V1A00540
                          DC      X                                     V1A00550
                          DC      Y                                     V1A00560
                          CALL    ESIN      COMPUTE SIN AND COS         V1A00570
                          DC      THETA                                 V1A00580
                          LIBF    ESTO      C/FAC STORED IN SIN         V1A00590
                          DC      SIN                                   V1A00600
                          CALL    ECOS      COMPUTE COSINE THETA        V1A00610
                          DC      THETA                                 V1A00620
                          LIBF    ESTO      STORE COS THETA IN THETA    V1A00630
                          DC      THETA                                 V1A00640
                          LDX  L1 XS+12     STORE COS THETA IN THETA    V1A00650
                          LIBF    ECHRX     COLLECT DATA FROM ECHAR     V1A00660
                    EXIT  LDX  L1 *-*       RESTORE XR1 AND XR2         V1A00670
                          BSC  I  X2+1      RETURN                      V1A00680
                          END                                           V1A00690
