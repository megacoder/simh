                          HDNG    PAUSE SUBROUTINE                      T2A00010
                    *************************************************** T2A00020
                    *STATUS-VERSION 2, MODIFICATION 0                 * T2A00030
                    *                                                 * T2A00040
                    *FUNCTION/OPERATION                               * T2A00050
                    *   * WAIT FOR $IOCT TO BECOME ZERO.              * T2A00060
                    *   * SET $PAUS TO ZERO.                          * T2A00070
                    *   * LOAD DISPLAY INTO THE A REGISTER.           * T2A00080
                    *   * WAIT.                                       * T2A00090
                    *   * EXIT IF $PAUS IS ZERO, OTHERWISE CLEAR      * T2A00100
                    *     $PAUS, RELOAD DISPLAY AND AGAIN WAIT.       * T2A00110
                    *                                                 * T2A00120
                    *ENTRY POINTS                                     * T2A00130
                    *   * LIBF    PAUSE                               * T2A00140
                    *     DC      ADDR       ADDRESS OF INDICATOR     * T2A00150
                    *                                                 * T2A00160
                    *INPUT- N/A                                       * T2A00170
                    *                                                 * T2A00180
                    *OUTPUT- N/A                                      * T2A00190
                    *                                                 * T2A00200
                    *EXTERNAL REFERENCES                              * T2A00210
                    *   COMMA/DCOM                                    * T2A00220
                    *      * $IOCT                                    * T2A00230
                    *      * $PAUS                                    * T2A00240
                    *      * $PRET                                      T2A00250
                    *                                                 * T2A00260
                    *EXITS-                                           * T2A00270
                    *   NORMAL-                                       * T2A00280
                    *      EXITS TO LIBF + 2                          * T2A00290
                    *   ERROR - N/A                                   * T2A00300
                    *                                                 * T2A00310
                    *TABLES/WORK AREAS- N/A                           * T2A00320
                    *                                                 * T2A00330
                    *ATTRIBUTES-                                      * T2A00340
                    *      ASSEMBLED RELOCATABLE                      * T2A00350
                    *                                                 * T2A00360
                    *NOTES- N/A                                       * T2A00370
                    *************************************************** T2A00380
                          HDNG    PAUSE SUBROUTINE                      T2A00390
                          LIBR                                          T2A00400
                          ENT     PAUSE                                 T2A00410
                    *                                                   T2A00420
                    $IOCT EQU     /32        ZERO IN NO I/O IN PROGRESS T2A00430
                    $PAUS EQU     /F0        NON-ZERO IF SCA INTERRUPT  T2A00440
                    $PRET EQU     /28        SYSTEM WAIT SUBR           T2A00450
                    *                                                   T2A00460
                    *                                                   T2A00470
                    PAUSE EQU     *          ENTRY POINT                T2A00480
                    *                                                   T2A00490
                          STX   2 PE008+1    SAVE XR2                   T2A00500
                          LDX  I2 *-*        XR2 .EQ. INDICATOR ADDR    T2A00510
                    *                                                   T2A00520
                    PE001 MDX  L  $IOCT,0    SKIP IF NO I/O BUSY        T2A00530
                          MDX     PE001      LOOP IF I/O BUSY           T2A00540
                    *                                                   T2A00550
                    PE002 SLA     16                                    T2A00560
                          STO  L  $PAUS      CLEAR INTERRUPT INDICATOR  T2A00570
                    *                                                   T2A00580
                          LD   I2 0          LOAD DISPLAY WORD          T2A00590
                    *                                                   T2A00600
                          BSI  L  $PRET      WAIT                       T2A00610
                    *                                                   T2A00620
                          MDX  L  $PAUS,0    SKIP IF NO INTERRUPT       T2A00630
                          MDX     PE002      BRANCH IF INTERRUPT        T2A00640
                    *                                                   T2A00650
                          MDX   2 1          CALCULATE RETURN ADDRESS   T2A00660
                          STX   2 PE009+1    STORE RETURN ADDRESS       T2A00670
                    *                                                   T2A00680
                    PE008 LDX  L2 *-*        RESTORE XR2                T2A00690
                    PE009 BSC  L  *-*        RETURN                     T2A00700
                    *                                                   T2A00710
                          END                                           T2A00720
