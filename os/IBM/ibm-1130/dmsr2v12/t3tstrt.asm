                          HDNG    CALL TSTRT                            T3I00010
                    *************************************************** T3I00020
                    *                                                 * T3I00030
                    *   SUBROUTINE NAME-                              * T3I00040
                    *      FULL NAME-FORTRAN TRACE START              * T3I00050
                    *      CODE NAME-TSTRT                            * T3I00060
                    *   PURPOSE-START TRACE BY SETTING TRACE INDICATOR* T3I00070
                    *      IN TTEST TO A ONE.                         * T3I00080
                    *   METHOD-N/A                                    * T3I00090
                    *   CAPABILITIES AND LIMITATIONS-N/A              * T3I00100
                    *   SPECIAL FEATURES-N/A                          * T3I00110
                    *   ADDITIONAL INFORMATION-                       * T3I00120
                    *      ESTIMATED EXECUTION TIME-N/A               * T3I00130
                    *                                                 * T3I00140
                    *************************************************** T3I00150
                    *                                                 * T3I00160
                    *   ENTER HERE TO TURN ON THE TRACE INDICATOR     * T3I00170
                    *                                                   T3I00180
                          ENT     TSTRT                                 T3I00190
                    TSTRT DC      *-*        REC RETURN ADDR            T3I00200
                          LD      ONE        LOAD ONE TO  THE ACC       T3I00210
                          LIBF    TSET       GO TO SET ROUTINE          T3I00220
                          BSC  I  TSTRT      EXIT                       T3I00230
                    ONE   DC      1          CONSTANT                   T3I00240
                          END                                           T3I00250
