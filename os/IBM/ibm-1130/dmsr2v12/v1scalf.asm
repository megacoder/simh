                          HDNG    CALL SCALF                            V1O00010
                    *************************************************** V1O00020
                    *                                                 * V1O00030
                    *   SUBROUTINE NAME-                              * V1O00040
                    *      FULL NAME- STANDARD PRECISION PLOTTER      * V1O00050
                    *         SCALING FUNCTION.                       * V1O00060
                    *      CODE NAME- SCALF                           * V1O00070
                    *   PURPOSE- DEFINES THE SCALING FACTORS FOR      * V1O00080
                    *      THE X AXIS AND THE Y AXIS, AND DEFINES     * V1O00090
                    *      THE INTERSECTION OF THE X AXIS AND THE     * V1O00100
                    *      Y AXIS.                                    * V1O00110
                    *   METHOD- N/A                                   * V1O00120
                    *   CAPABILITIES AND LIMITATIONS- SEE IBM         * V1O00130
                    *      1130/1800 PLOTTER SUBROUTINES MANUAL       * V1O00140
                    *      (FORM C26-3755).                           * V1O00150
                    *   SPECIAL FEATURES- N/A                         * V1O00160
                    *   ADDITIONAL INFORMATION- N/A                   * V1O00170
                    *                                                 * V1O00180
                    *************************************************** V1O00190
                          HDNG    CALL SCALF                            V1O00200
                    *                                                   V1O00210
                    *             THE CALL TO THE SCALF ROUTINE         V1O00220
                    *             IS AS FOLLOWS                         V1O00230
                    *                                                   V1O00240
                    *             CALL SCALF                            V1O00250
                    *             DC   X-SCALE (REAL)                   V1O00260
                    *             DC   Y-SCALE (REAL)                   V1O00270
                    *             DC   X(0) (REAL)                      V1O00280
                    *             DC   Y(0) (REAL)                      V1O00290
                    *                                                   V1O00300
                          SPR                                           V1O00310
                          ENT     SCALF                                 V1O00320
                    SCALF DC      *-*       ENTRY POINT                 V1O00330
                          LD      SCALF     SET-UP SCALE AND ORIGIN     V1O00340
                          LIBF    FRULE     ADDR OF ARGUMENT LIST       V1O00350
                          END                                           V1O00360
