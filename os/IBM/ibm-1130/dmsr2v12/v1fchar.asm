                    *************************************************** V1F00010
                    *                                                 * V1F00020
                    *   SUBROUTINE NAME-                              * V1F00030
                    *      FULL NAME- STANDARD PRECISION CHARACTER    * V1F00040
                    *         INITIALIZATION SUBROUTINE.              * V1F00050
                    *      CODE NAME- FCHAR                           * V1F00060
                    *   PURPOSE- INITIALIZES THE ANNOTATION SUBROUTINE* V1F00070
                    *      TO ESTABLISH POSITION AND ORIENTATION OF   * V1F00080
                    *      CHARACTERS.                                * V1F00090
                    *   METHOD- N/A                                   * V1F00100
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM         * V1F00110
                    *      1130/1800 PLOTTER SUBROUTINES MANUAL       * V1F00120
                    *      (FORM C26-3755).                           * V1F00130
                    *   SPECIAL FEATURES- N/A                         * V1F00140
                    *   ADDITIONAL INFORMATION- N/A                   * V1F00150
                    *                                                 * V1F00160
                    *************************************************** V1F00170
                    *                                                   V1F00180
                    *             THE CALL TO THE FCHAR ROUTINE         V1F00190
                    *             IS AS FOLLOWS                         V1F00200
                    *                                                   V1F00210
                    *             CALL FCHAR                            V1F00220
                    *             DC   X(0) (REAL)                      V1F00230
                    *             DC   Y(0) (REAL)                      V1F00240
                    *             DC   XS (REAL)                        V1F00250
                    *             DC   YS (REAL)                        V1F00260
                    *             DC   THETA (REAL)                     V1F00270
                    *                                                   V1F00280
                          SPR                                           V1F00290
                          ENT     FCHAR     ENTER AT FCHAR              V1F00300
                    X     DEC     .0        DECIMAL CONSTANTS           V1F00310
                    Y     DEC     .0        *AND DATA STORAGE           V1F00320
                    XS    DEC     .1                                    V1F00330
                    YS    DEC     .1                                    V1F00340
                    THETA DEC     0.                                    V1F00350
                    SIN   DEC     0.                                    V1F00360
                    UP    DC      1         PEN CONTROL                 V1F00370
                    FCHAR DC      *-*       ENTRY                       V1F00380
                          STX   1 EXIT+1    SAVE XR1                    V1F00390
                          LD      FCHAR                                 V1F00400
                          STO     X2+1      SAVE RETURN ADDRESS         V1F00410
                          LDX   1 -10                                   V1F00420
                    X2    LD   L  *-*                                   V1F00430
                          STO     X1+1                                  V1F00440
                          MDX  L  X2+1,1                                V1F00450
                          NOP                                           V1F00460
                    X1    LIBF    FLD       ST C/ADDR IN * TO FAC       V1F00470
                          DC      *-*       MODIFIABLE PARAMETER        V1F00480
                          LIBF    FSTOX     ST C/FAC TO X+15+C/XR1      V1F00490
                          DC      X+10                                  V1F00500
                          MDX   1 2                                     V1F00510
                          MDX     X2        REPEAT                      V1F00520
                          CALL    FPLOT     RAISE AND POSITION PEN      V1F00530
                          DC      UP                                    V1F00540
                          DC      X                                     V1F00550
                          DC      Y                                     V1F00560
                          CALL    FSIN      COMPUTE SIN AND COS         V1F00570
                          DC      THETA                                 V1F00580
                          LIBF    FSTO      C/FAC STORED IN SIN         V1F00590
                          DC      SIN                                   V1F00600
                          CALL    FCOS      COMPUTE COSINE THETA        V1F00610
                          DC      THETA                                 V1F00620
                          LIBF    FSTO      STORE COS THETA IN THETA    V1F00630
                          DC      THETA                                 V1F00640
                          LDX  L1 XS+8      STORE COS THETA IN THETA    V1F00650
                          LIBF    FCHRX     COLLECT DATA FROM FCHAR     V1F00660
                    EXIT  LDX  L1 *-*       RESTORE XR1 AND XR2         V1F00670
                          BSC  I  X2+1      RETURN                      V1F00680
                          END                                           V1F00690
