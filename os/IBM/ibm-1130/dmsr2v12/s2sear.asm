                          HDNG    LIBF SEAR                             S2J00010
                    *************************************************** S2J00020
                    *   SUBROUTINE NAME                               * S2J00030
                    *      FULL NAME- SINGLE DEVICE, EXTENDED         * S2J00040
                    *         PRECISION, ARITHMETIC TRACE             * S2J00050
                    *      CODE NAME- SEAR                            * S2J00060
                    *   PURPOSE- TEST TRACE SWITCH AND INTERFACE      * S2J00070
                    *      WITH SFIO IF TRACING IS REQUESTED.         * S2J00080
                    *   METHOD- N/A                                   * S2J00090
                    *   CAPABILITIES AND LIMITATIONS- N/A             * S2J00100
                    *   SPECIAL FEATURES- N/A                         * S2J00110
                    *   ADDITIONAL INFORMATION- N/A                   * S2J00120
                    *************************************************** S2J00130
                          LIBR                                          S2J00140
                          EPR                                           S2J00150
                    *             CALL SEQ   LIBF SVAR OR SVARX       * S2J00160
                    *                        DC   VAR ADDR            * S2J00170
                          ENT     SEAR                                  S2J00180
                          ENT     SEARX                                 S2J00190
                    SEAR  STX   1 WORK+1     SAVE XR1                   S2J00200
                          LDX  I1 *-*        LD XR1 W/RET ADDR          S2J00210
                          LD    1 0          LD ACC W/ ADDR OF VAR      S2J00220
                    STORE STO     JOE                                   S2J00230
                          STO     VARAD      INITLZ CALLING SEQUENCES   S2J00240
                          LIBF    ESTO       STORE FAC IN VARAD         S2J00250
                    JOE   DC      *-*                                   S2J00260
                          LIBF    TTEST      GO TO CHECK TRACE SWITCHES S2J00270
                          MDX     WORK-2     DONT TRACE, GO TO EXIT     S2J00280
                          LIBF    SWRT       PRINT OUT                  S2J00290
                          DC      0          TRACE DEVICE               S2J00300
                          DC      E1710      FORMAT                     S2J00310
                          LIBF    SIOF                                  S2J00320
                    VARAD DC      0          VARIABLE ADDRESS           S2J00330
                          LIBF    SCOMP                                 S2J00340
                          MDX   1 +1         INCR RET ADDR              S2J00350
                          STX   1 RET+1      SET UP RETURN              S2J00360
                    WORK  LDX  L1 *-*        RESTORE INDEX REG 1        S2J00370
                    RET   BSC  L  *-*        E X I T                    S2J00380
                    E1710 DC      /5002      FORMAT FOR PRINT OUT       S2J00390
                          EBC     . *.                                  S2J00400
                          DC      /0511                                 S2J00410
                          DC      /B003                                 S2J00420
                    *                                                 * S2J00430
                    *             ENTER HERE IF INDEXED               * S2J00440
                    *                                                 * S2J00450
                    SEARX STX   1 WORK+1     SAVE XR1                   S2J00460
                          LDX  I1 *-*        LOAD XR1 W/ RET ADDR       S2J00470
                          LD    1 *-*        LD ACC W/ VAR ADDR         S2J00480
                          A       WORK+1     ADD SUBSC IND TO VAR ADDR  S2J00490
                          MDX     STORE      BR TO STORE VAR ADDR       S2J00500
                          END                                           S2J00510
