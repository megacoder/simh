                          HDNG    LIBF SFIF                             R2K00010
                    *************************************************** R2K00020
                    *   SUBROUTINE NAME                               * R2K00030
                    *      FULL NAME- SINGLE DEVICE, STANDARD         * R2K00040
                    *         PRECISION, 'IF' STATEMENT TRACE.        * R2K00050
                    *      CODE NAME- SFIF                            * R2K00060
                    *   PURPOSE- TEST TRACE SWITCH AND INTERFACE      * R2K00070
                    *      WITH SFIO IF TRACING IS REQUESTED.         * R2K00080
                    *   METHOD- N/A                                   * R2K00090
                    *   CAPABILITIES AND LIMITATIONS- N/A             * R2K00100
                    *   SPECIAL FEATURES- N/A                         * R2K00110
                    *   ADDITIONAL INFORMATION- N/A                   * R2K00120
                    *************************************************** R2K00130
                          LIBR                                          R2K00140
                    *             CALL SEQ   LIBF SFIF                * R2K00150
                    *                        BSC  STMT ADDR,COND      * R2K00160
                    *                        BSC  STMT ADDR,COND      * R2K00170
                    *                        BSC  STMT ADDR,COND      * R2K00180
                          ENT     SFIF                                  R2K00190
                    SFIF  STX   1 WORK+1     SAVE XR1                   R2K00200
                          LDX  I1 *-*        LD XR1 W/ RET ADDR         R2K00210
                          LIBF    TTEST      GO TO CHECK TRACE SWITCHES R2K00220
                          MDX     WORK-1     DONT TRACE, GO TO EXIT     R2K00230
                          LIBF    FSTO       STORE VAR TO BE PRINTED    R2K00240
                          DC      VARAD                                 R2K00250
                          LIBF    SWRT       PRINT OUT                  R2K00260
                          DC      0                                     R2K00270
                          DC      E1407                                 R2K00280
                          LIBF    SIOF                                  R2K00290
                          DC      VARAD                                 R2K00300
                          LIBF    SCOMP                                 R2K00310
                          STX   1 RET+1      SET UP RETURN              R2K00320
                    WORK  LDX  L1 *-*        RESTORE XR1                R2K00330
                          LD    3 +126       LOAD ACC WITH PART OF FAC  R2K00340
                    RET   BSC  L  *-*        EXIT                       R2K00350
                    E1407 DC      /5003      FORMAT FOR PRINT OUT       R2K00360
                          EBC     . **.                                 R2K00370
                          DC      /038E                                 R2K00380
                          DC      /B004                                 R2K00390
                          BSS  E  0                                     R2K00400
                    VARAD DC      0          VARIABLE                   R2K00410
                          DC      0          *STORAGE                   R2K00420
                          END                                           R2K00430
