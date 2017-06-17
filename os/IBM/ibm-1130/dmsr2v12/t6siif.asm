                          HDNG    LIBF SIIF                             T6C00010
                    *************************************************** T6C00020
                    *   SUBROUTINE NAME                               * T6C00030
                    *      FULL NAME- SINGLE DEVICE, INTEGER          * T6C00040
                    *         PRECISION, 'IF' STATEMENT TRACE.        * T6C00050
                    *      CODE NAME- SIIF                            * T6C00060
                    *   PURPOSE- TEST TRACE SWITCH AND INTERFACE      * T6C00070
                    *      WITH SFIO IF TRACING IS REQUESTED.         * T6C00080
                    *   METHOD- N/A                                   * T6C00090
                    *   CAPABILITIES AND LIMITATIONS- N/A             * T6C00100
                    *   SPECIAL FEATURES- N/A                         * T6C00110
                    *   ADDITIONAL INFORMATION- N/A                   * T6C00120
                    *************************************************** T6C00130
                          LIBR                                          T6C00140
                    *             CALL SEQ   LIBF SIIF                * T6C00150
                    *             BSC  STMT ADDR,COND                 * T6C00160
                    *             BSC  STMT ADDR,COND                 * T6C00170
                    *             BSC  STMT ADDR,COND                 * T6C00180
                          ENT     SIIF                                  T6C00190
                    SIIF  STX   1 WORK+1     SAVE XR1                   T6C00200
                          LDX  I1 *-*        LD XR1 W/ RET ADDR         T6C00210
                          STO     RET+1      STORE ACC IN WORK AREA     T6C00220
                          LIBF    TTEST      GO TO CHECK TRACE SWITCHES T6C00230
                          MDX     WORK-2     DONT TRACE, GO TO EXIT     T6C00240
                          LIBF    SWRT       PRINT OUT                  T6C00250
                          DC      0                                     T6C00260
                          DC      I6                                    T6C00270
                          LIBF    SIOI                                  T6C00280
                          DC      RET+1                                 T6C00290
                          LIBF    SCOMP                                 T6C00300
                          LD      RET+1      RESTORE ACC                T6C00310
                          STX   1 RET+1      SET UP RETURN              T6C00320
                    WORK  LDX  L1 *-*        RESTORE XR1                T6C00330
                    RET   BSC  L  *-*        EXIT                       T6C00340
                    I6    DC      /5003      FORMAT FOR PRINT OUT       T6C00350
                          EBC     . **.                                 T6C00360
                          DC      /2006                                 T6C00370
                          DC      /B004                                 T6C00380
                          END                                           T6C00390
