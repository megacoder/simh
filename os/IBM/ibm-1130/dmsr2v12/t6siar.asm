                          HDNG    LIBF SIAR                             T6B00010
                    *************************************************** T6B00020
                    *   SUBROUTINE NAME                               * T6B00030
                    *      FULL NAME- SINGLE DEVICE, INTEGER          * T6B00040
                    *         PRECISION, ARITHMETIC TRACE.            * T6B00050
                    *      CODE NAME- SIAR                            * T6B00060
                    *   PURPOSE- TEST TRACE SWITCH AND INTERFACE      * T6B00070
                    *      WITH SFIO IF TRACING IS REQUESTED.         * T6B00080
                    *   METHOD- N/A                                   * T6B00090
                    *   CAPABILITIES AND LIMITATIONS- N/A             * T6B00100
                    *   SPECIAL FEATURES- N/A                         * T6B00110
                    *   ADDITIONAL INFORMATION- N/A                   * T6B00120
                    *************************************************** T6B00130
                          LIBR                                          T6B00140
                    *             CALL SEQ   LIBF SIAR OR SIARX       * T6B00150
                    *                        DC   VAR ADDR            * T6B00160
                          ENT     SIAR                                  T6B00170
                          ENT     SIARX                                 T6B00180
                    SIAR  STX   1 WORK+1     SAVE XR1                   T6B00190
                          LDX  I1 *-*        LD XR1 W/ RET ADDR         T6B00200
                          SRT     16         SAVE RESULT IN EXTENSION   T6B00210
                          LD    1 0          LD ACC W/ ADDR OF VAR      T6B00220
                    STORE STO     JOE+1      STORE ADDR IN STORE INST   T6B00230
                          STO     VARAD      STORE ADDR FOR PRINTING    T6B00240
                          SLT     16         RETURN RESULT TO ACC       T6B00250
                    JOE   STO  L  *-*        STORE RESULT IN VAR ADDR   T6B00260
                          LIBF    TTEST      GO TO CHECK TRACE SWITCHES T6B00270
                          MDX     WORK-2     DONT TRACE, GO TO EXIT     T6B00280
                          LIBF    SWRT       TRACE                      T6B00290
                          DC      0                                     T6B00300
                          DC      I6                                    T6B00310
                          LIBF    SIOI                                  T6B00320
                    VARAD DC      0                                     T6B00330
                          LIBF    SCOMP                                 T6B00340
                          MDX   1 +1         INCR RET ADDR              T6B00350
                          STX   1 RET+1      SET UP RETURN              T6B00360
                    WORK  LDX  L1 *-*        RESTORE XR1                T6B00370
                    RET   BSC  L  *-*        EXIT                       T6B00380
                    I6    DC      /5002      FORMAT FOR PRINT OUT       T6B00390
                          EBC     . *.                                  T6B00400
                          DC      /2006                                 T6B00410
                          DC      /B003                                 T6B00420
                    *                                                 * T6B00430
                    *             ENTER HERE IF INDEXED               * T6B00440
                    *                                                 * T6B00450
                    SIARX STX   1 WORK+1     SAVE XR1                   T6B00460
                          LDX  I1 *-*        LD XR1 W/ RET ADDR         T6B00470
                          SRT     16         SAVE RESULT IN EXTENSION   T6B00480
                          LD    1 0          LD ACC W/ ADDR OF VAR      T6B00490
                          A       WORK+1     INCR ADDR BY XR1 VALUE     T6B00500
                          MDX     STORE      BRANCH TO STORE VAR ADDR   T6B00510
                          END                                           T6B00520
