                          HDNG    LIBF SGOTO                            T6A00010
                    *************************************************** T6A00020
                    *   SUBROUTINE NAME                               * T6A00030
                    *      FULL NAME- SINGLE DEVICE, 'GO TO' TRACE    * T6A00040
                    *      CODE NAME- SGOTO                           * T6A00050
                    *   PURPOSE- TEST TRACE SWITCH AND INTERFACE      * T6A00060
                    *      WITH SFIO IF TRACING IS REQUESTED.         * T6A00070
                    *   METHOD- N/A                                   * T6A00080
                    *   CAPABILITIES AND LIMITATIONS- N/A             * T6A00090
                    *   SPECIAL FEATURES- N/A                         * T6A00100
                    *   ADDITIONAL INFORMATION- N/A                   * T6A00110
                    *************************************************** T6A00120
                          LIBR                                          T6A00130
                    *             CALLING SEQ- LDX I1 I               * T6A00140
                    *                        LIBF SGOTO               * T6A00150
                    *                        DC    STMNT NO.          * T6A00160
                          ENT     SGOTO                                 T6A00170
                    SGOTO STX   1 GO1+1      SAVE INDEX VALUE           T6A00180
                          LDX  I1 *-*        LD XR1 TO FIRST DC IN GOTO T6A00190
                          MDX   1 -1         ADJUST PT TO FIRST DC-1    T6A00200
                          LIBF    TTEST      GO TO CHECK TRACE SWITCHES T6A00210
                          MDX     GO1        DONT TRACE, GO TO EXIT     T6A00220
                          LIBF    SWRT       PRINT VALUE OF INDEX       T6A00230
                          DC      0                                     T6A00240
                          DC      I6                                    T6A00250
                          LIBF    SIOI                                  T6A00260
                          DC      GO1+1                                 T6A00270
                          LIBF    SCOMP                                 T6A00280
                    GO1   MDX  L1 *-*        INCR PT BY INDEX VALUE     T6A00290
                          BSC  I1 0          EXEC COMPUTED GOTO BRANCH  T6A00300
                    I6    DC      /5004      I6 FORMAT FOR PRINT OUT    T6A00310
                          EBC     . ***.                                T6A00320
                          DC      /2006                                 T6A00330
                          DC      /B004                                 T6A00340
                          END                                           T6A00350
