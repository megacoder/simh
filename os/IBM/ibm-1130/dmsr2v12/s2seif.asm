                          HDNG    LIBF SEIF                             S2K00010
                    *************************************************** S2K00020
                    *   SUBROUTINE NAME                               * S2K00030
                    *      FULL NAME- SINGLE DEVICE, EXTENDED         * S2K00040
                    *         PRECISION, 'IF' STATEMENT TRACE.        * S2K00050
                    *      CODE NAME- SEIF                            * S2K00060
                    *   PURPOSE- TEST TRACE SWITCH AND INTERFACE      * S2K00070
                    *      WITH SFIO IF TRACING IS REQUESTED.         * S2K00080
                    *   METHOD- N/A                                   * S2K00090
                    *   CAPABILITIES AND LIMITATIONS- N/A             * S2K00100
                    *   SPECIAL FEATURES- N/A                         * S2K00110
                    *   ADDITIONAL INFORMATION- N/A                   * S2K00120
                    *************************************************** S2K00130
                          LIBR                                          S2K00140
                    *             CALL SEQ  LIBF SEIF                 * S2K00150
                    *                        BSC  STMT ADDR,COND      * S2K00160
                    *                        BSC  STMT ADDR,COND      * S2K00170
                    *                        BSC  STMT ADDR,COND      * S2K00180
                          ENT     SEIF                                  S2K00190
                    SEIF  STX   1 WORK+1     SAVE XR1                   S2K00200
                          LDX  I1 *-*        LD XR1 W/ RET ADDR         S2K00210
                          LIBF    TTEST      GO TO CHECK TRACE SWITCHES S2K00220
                          MDX     WORK-1     DONT TRACE, GO TO EXIT     S2K00230
                          LIBF    ESTO       STORE VAR TO BE PRINTED    S2K00240
                          DC      VARAD                                 S2K00250
                          LIBF    SWRT       PRINT OUT                  S2K00260
                          DC      0                                     S2K00270
                          DC      E1710                                 S2K00280
                          LIBF    SIOF                                  S2K00290
                          DC      VARAD                                 S2K00300
                          LIBF    SCOMP                                 S2K00310
                          STX   1 RET+1      SET UP RETURN              S2K00320
                    WORK  LDX  L1 *-*        RESTORE XR1                S2K00330
                          LD    3 +126       LOAD ACC WITH PART OF FAC  S2K00340
                    RET   BSC  L  *-*        EXIT                       S2K00350
                    E1710 DC      /5003      FORMAT FOR PRINT OUT       S2K00360
                          EBC     . **.                                 S2K00370
                          DC      /0511                                 S2K00380
                          DC      /B004                                 S2K00390
                    VARAD DC      0          VARIABLE                   S2K00400
                          DC      0          *STORAGE                   S2K00410
                          DC      0          *AREA                      S2K00420
                          END                                           S2K00430
