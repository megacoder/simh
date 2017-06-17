                          HDNG    CALL TSTOP                            T3H00010
                    *************************************************** T3H00020
                    *                                                 * T3H00030
                    *   SUBROUTINE NAME-                              * T3H00040
                    *      FULL NAME-FORTRAN TRACE STOP               * T3H00050
                    *      CODE NAME-TSTOP                            * T3H00060
                    *   PURPOSE-STOP THE FORTRAN TRACE BY CLEARING THE* T3H00070
                    *      TRACE INDICATOR IN TTEST.                  * T3H00080
                    *   METHOD-N/A                                    * T3H00090
                    *   CAPABILITIES AND LIMITATIONS-N/A              * T3H00100
                    *   SPECIAL FEATURES-N/A                          * T3H00110
                    *   ADDITIONAL INFORMATION-                       * T3H00120
                    *      ESTIMATED EXECUTION TIME-N/A               * T3H00130
                    *                                                 * T3H00140
                    *************************************************** T3H00150
                    *                                                 * T3H00160
                    *   ENTER HERE TO TURN OFF THE TRACE INDICATOR    * T3H00170
                    *                                                 * T3H00180
                          ENT     TSTOP                                 T3H00190
                    TSTOP DC      *-*        RECORD RETURN ADDR         T3H00200
                          SLA     16         ZERO THE ACC               T3H00210
                          LIBF    TSET       GO TO SET ROUTINE          T3H00220
                          BSC  I  TSTOP      EXIT                       T3H00230
                          END                                           T3H00240
