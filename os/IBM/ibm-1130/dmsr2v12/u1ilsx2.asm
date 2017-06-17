                          HDNG    ILSX2 - INTERRUPT LEVEL 2 SUBROUTINE  U1H00010
                    *************************************************** U1H00020
                    *                                                 * U1H00030
                    * STATUS - VERSION 2, MODIFICATION LEVEL 2        * U1H00040
                    * FUNCTION/OPERATION - INTERRUPT LEVEL SUBROUTINE * U1H00050
                    *    FOR LEVEL 2.                                 * U1H00060
                    * ENTRY POINT - ENTERED AT IX220 BY A HARDWARE    * U1H00070
                    *    BSI VIA LOCATION 10 DECIMAL.                 * U1H00080
                    * INPUT - NONE                                    * U1H00090
                    * OUTPUT - NONE                                   * U1H00100
                    * EXTERNAL SUBROUTINES - NONE                     * U1H00110
                    * EXITS -                                         * U1H00120
                    *    NORMAL - BOSC INDIRECT THROUGH IX220.        * U1H00130
                    *    ERROR - NONE                                 * U1H00140
                    * TABLES/WORK AREAS - NONE                        * U1H00150
                    * ATTRIBUTES - REUSABLE                           * U1H00160
                    * NOTES - INDEX REGISTERS 1, 2, AND 3, STATUS,    * U1H00170
                    *    ACCUMULATOR AND EXTENSION ARE SAVED UPON     * U1H00180
                    *    ENTRY AND RESTORED AFTER INTERRUPT SERVICED. * U1H00190
                    *                                                 * U1H00200
                    *************************************************** U1H00210
                          HDNG    ILSX2 - INTERRUPT LEVEL 2 SUBROUTINE  U1H00220
                          ILS  02                                       U1H00230
                    IX210 DC      /0538     DISK +5  AND ISS NO. 5      U1H00240
                    *                                                   U1H00250
                    IX220 DC      0         INTERRUPT ENTRY             U1H00260
                          STD     IX280     SAVE ACC AND EXTENSION,     U1H00270
                          STS     IX230     *STATUS,                    U1H00280
                          STX   1 IX241+1   *XR1,                       U1H00290
                          STX   2 IX242+1   *XR2,                       U1H00300
                          STX   3 IX243+1   *XR3                        U1H00310
                          LDX  I3 $XR3X     POINT TO TRANSFER VECTOR    U1H00320
                          BSI  I  IX210     GO TO ISS                   U1H00330
                    *                                                   U1H00340
                    IX230 LDS     0         RESTORE STATUS,             U1H00350
                    IX241 LDX  L1 *-*       *XR1,                       U1H00360
                    IX242 LDX  L2 *-*       *XR2,                       U1H00370
                    IX243 LDX  L3 *-*       *XR3,                       U1H00380
                          LDD     IX280     *ACC AND EXTENSION          U1H00390
                          BOSC I  IX220     TURN OFF INTERRUPT, RETURN  U1H00400
                    *                                                   U1H00410
                    IX280 BSS  E  2         ACCUMULATOR AND EXTENSION   U1H00420
                    $XR3X EQU     /00E4     ADDR OF TRANSFER VECTOR     U1H00430
                          END                                           U1H00440
