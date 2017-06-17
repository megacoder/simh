                          HDNG    ILSX0 - INTERRUPT LEVEL 0 SUBROUTINE  U1F00010
                    *************************************************** U1F00020
                    *                                                 * U1F00030
                    * STATUS - VERSION 2, MODIFICATION LEVEL 2        * U1F00040
                    * FUNCTION/OPERATION - INTERRUPT LEVEL SUBROUTINE * U1F00050
                    *    FOR LEVEL 0.                                 * U1F00060
                    * ENTRY POINT - ENTERED AT IX020 BY A HARDWARE    * U1F00070
                    *    BSI VIA LOCATION 8.                          * U1F00080
                    * INPUT - NONE                                    * U1F00090
                    * OUTPUT - NONE                                   * U1F00100
                    * EXTERNAL SUBROUTINES - NONE                     * U1F00110
                    * EXITS -                                         * U1F00120
                    *    NORMAL - BOSC INDIRECT THROUGH IX020.        * U1F00130
                    *    ERROR - NONE                                 * U1F00140
                    * TABLES/WORK AREAS - NONE                        * U1F00150
                    * ATTRIBUTES - REUSABLE                           * U1F00160
                    * NOTES - INDEX REGISTERS 1, 2, AND 3, STATUS,    * U1F00170
                    *    ACCUMULATOR AND EXTENSION ARE SAVED UPON     * U1F00180
                    *    ENTRY AND RESTORED AFTER INTERRUPT SERVICED. * U1F00190
                    *                                                 * U1F00200
                    *************************************************** U1F00210
                          HDNG    ILSX0 - INTERRUPT LEVEL 0 SUBROUTINE  U1F00220
                          ILS  00                                       U1F00230
                    IX010 DC      /0434     CARD +4 AND ISS NO. 1       U1F00240
                    *                                                   U1F00250
                    IX020 DC      0         INTERRUPT ENTRY             U1F00260
                          STD     IX080     SAVE ACC AND EXTENSION      U1F00270
                          STS     IX030     SAVE STATUS                 U1F00280
                          STX   1 IX041+1   SAVE XR1                    U1F00290
                          STX   2 IX042+1   SAVE XR2                    U1F00300
                          STX   3 IX043+1   SAVE XR3                    U1F00310
                          LDX  I3 $XR3X     POINT TO TRANSFER VECTOR    U1F00320
                          BSI  I  IX010     GO TO ISS                   U1F00330
                    *                                                   U1F00340
                    IX030 LDS     0         RESTORE STATUS              U1F00350
                    IX041 LDX  L1 *-*       RESTORE XR1                 U1F00360
                    IX042 LDX  L2 *-*       RESTORE XR2                 U1F00370
                    IX043 LDX  L3 *-*       RESTORE XR3                 U1F00380
                          LDD     IX080     RESTORE ACC AND EXTENSION   U1F00390
                          BOSC I  IX020     TURN OFF INTERRUPT, RETURN  U1F00400
                    *                                                   U1F00410
                    IX080 BSS  E  2         ACCUMULATOR AND EXTENSION   U1F00420
                    $XR3X EQU     /00E4     ADDR OF TRANSFER VECTOR     U1F00430
                          END                                           U1F00440
