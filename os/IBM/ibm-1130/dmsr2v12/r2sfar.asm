                          HDNG    LIBF SFAR                             R2J00010
                    *************************************************** R2J00020
                    *   SUBROUTINE NAME                               * R2J00030
                    *      FULL NAME- SINGLE DEVICE, STANDARD         * R2J00040
                    *         PRECISION, ARITHMETIC TRACE.            * R2J00050
                    *      CODE NAME- SFAR                            * R2J00060
                    *   PURPOSE- TEST TRACE SWITCH AND INTERFACE      * R2J00070
                    *      WITH SFIO IF TRACING IS REQUESTED.         * R2J00080
                    *   METHOD- N/A                                   * R2J00090
                    *   CAPABILITIES AND LIMITATIONS- N/A             * R2J00100
                    *   SPECIAL FEATURES- N/A                         * R2J00110
                    *   ADDITIONAL INFORMATION- N/A                   * R2J00120
                    *************************************************** R2J00130
                          LIBR                                          R2J00140
                    *             CALL SEQ   LIBF SWAR OR SWARX       * R2J00150
                    *                        DC   VAR ADDR            * R2J00160
                          ENT     SFAR                                  R2J00170
                          ENT     SFARX                                 R2J00180
                    SFAR  STX   1 WORK+1     SAVE XR1                   R2J00190
                          LDX  I1 *-*        LD XR1 W/RET ADDR          R2J00200
                          LD    1 0          LD ACCUM W/ ADDR OF VAR    R2J00210
                    STORE STO     JOE                                   R2J00220
                          STO     VARAD      INITLZ CALLING SEQUENCES   R2J00230
                          LIBF    FSTO       STORE FAC IN VARAD         R2J00240
                    JOE   DC      *-*                                   R2J00250
                          LIBF    TTEST      GO TO CHECK TRACE SWITCHES R2J00260
                          MDX     WORK-2     DONT TRACE, GO TO EXIT     R2J00270
                          LIBF    SWRT                                  R2J00280
                          DC      0                                     R2J00290
                          DC      E1407                                 R2J00300
                          LIBF    SIOF                                  R2J00310
                    VARAD DC      0                                     R2J00320
                          LIBF    SCOMP                                 R2J00330
                          MDX   1 +1         INCR RET ADDR              R2J00340
                          STX   1 RET+1      SET UP RETURN              R2J00350
                    WORK  LDX  L1 *-*        RESTORE INDEX REG 1        R2J00360
                    RET   BSC  L  *-*        E X I T                    R2J00370
                    E1407 DC      /5002      FORMAT FOR E14.7           R2J00380
                          EBC     . *.                                  R2J00390
                          DC      /038E                                 R2J00400
                          DC      /B003                                 R2J00410
                    *                                                 * R2J00420
                    *             ENTER HERE IF INDEXED               * R2J00430
                    *                                                 * R2J00440
                    SFARX STX   1 WORK+1     SAVE XR1                   R2J00450
                          LDX  I1 *-*        LOAD XR1 W/ RET ADDR       R2J00460
                          LD    1 *-*        LD ACC W/ VAR ADDR         R2J00470
                          A       WORK+1     ADD SUBSC IND TO VAR ADDR  R2J00480
                          MDX     STORE      BR TO STORE VAR ADDR       R2J00490
                          END                                           R2J00500
