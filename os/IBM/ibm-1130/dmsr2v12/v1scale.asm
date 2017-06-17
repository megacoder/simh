                          HDNG    CALL SCALE                            V1N00010
                    *************************************************** V1N00020
                    *                                                 * V1N00030
                    *   SUBROUTINE NAME-                              * V1N00040
                    *      FULL NAME- EXTENDED PRECISION PLOTTER      * V1N00050
                    *         SCALING FUNCTION.                       * V1N00060
                    *      CODE NAME- SCALE                           * V1N00070
                    *   PURPOSE- DEFINES THE SCALING FACTORS FOR      * V1N00080
                    *      THE X AXIS AND THE Y AXIS, AND DEFINES     * V1N00090
                    *      THE INTERSECTION OF THE X AXIS AND THE     * V1N00100
                    *      Y AXIS.                                    * V1N00110
                    *   METHOD- N/A                                   * V1N00120
                    *   CAPABALITIES AND LIMITATIONS- SEE IBM         * V1N00130
                    *      1130/1800 PLOTTER SUBROUTINES MANUAL       * V1N00140
                    *      (FORM C26-3755).                           * V1N00150
                    *   SPECIAL FEATURES- N/A                         * V1N00160
                    *   ADDITIONAL INFORMATION- N/A                   * V1N00170
                    *                                                 * V1N00180
                    *************************************************** V1N00190
                          HDNG    CALL SCALE                            V1N00200
                    *                                                   V1N00210
                    *             THE CALL TO THE SCALE ROUTINE         V1N00220
                    *             IS AS FOLLOWS                         V1N00230
                    *                                                   V1N00240
                    *             CALL SCALE                            V1N00250
                    *             DC   X-SCALE (REAL)                   V1N00260
                    *             DC   Y-SCALE (REAL)                   V1N00270
                    *             DC   X(0) (REAL)                      V1N00280
                    *             DC   Y(0) (REAL)                      V1N00290
                    *                                                   V1N00300
                          EPR                                           V1N00310
                          ENT     SCALE                                 V1N00320
                    SCALE DC      *-*       ENTRY POINT                 V1N00330
                          LD      SCALE     ADDR OF ARGUMENT LIST       V1N00340
                          LIBF    ERULE     SET-UP SCALE AND ORIGIN     V1N00350
                          END                                           V1N00360
