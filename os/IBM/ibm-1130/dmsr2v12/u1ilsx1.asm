                          HDNG    ILSX1 - INTERRUPT LEVEL 1 SUBROUTINE  U1G00010
                    *************************************************** U1G00020
                    *                                                 * U1G00030
                    * STATUS - VERSION 2, MODIFICATION LEVEL 9        * U1G00040
                    * FUNCTION/OPERATION - INTERRUPT LEVEL SUBROUTINE * U1G00050
                    *    FOR LEVEL 1.                                 * U1G00060
                    * ENTRY POINT - ENTERED AT IX120 BY A HARDWARE    * U1G00070
                    *    BSI VIA LOCATION 9.                          * U1G00080
                    * INPUT - NONE                                    * U1G00090
                    * OUTPUT - NONE                                   * U1G00100
                    * EXTERNAL SUBROUTINES - NONE                     * U1G00110
                    * EXITS -                                         * U1G00120
                    *    NORMAL - BOSC INDIRECT THROUGH IX120.        * U1G00130
                    *    ERROR - NONE                                 * U1G00140
                    * TABLES/WORK AREAS - NONE                        * U1G00150
                    * ATTRIBUTES - REUSABLE                           * U1G00160
                    * NOTES - INDEX REGISTERS 1, 2, AND 3, STATUS,    * U1G00170
                    *    ACCUMULATOR AND EXTENSION ARE SAVED UPON     * U1G00180
                    *    ENTRY AND RESTORED AFTER INTERRUPT SERVICED. * U1G00190
                    *                                                 * U1G00200
                    *************************************************** U1G00210
                          HDNG    ILSX1 - INTERRUPT LEVEL 1 SUBROUTINE  U1G00220
                          ILS  01                                       U1G00230
                    IX110 DC      /043B     SCA  +4  AND ISS NO. 8      U1G00240
                    IX111 DC      /0439     1132 +4  AND ISS NO. 6      U1G00250
                    *                                                   U1G00260
                    IX120 DC      0         INTERRUPT ENTRY             U1G00270
                          STD     IX180     SAVE ACC AND EXTENSION,     U1G00280
                          STS     IX130     *STATUS,                    U1G00290
                          STX   1 IX141+1   *XR1,                       U1G00300
                          STX   2 IX142+1   *XR2,                       U1G00310
                          STX   3 IX143+1   *XR3                        U1G00320
                          LDX  I3 $XR3X     POINT TO TRANSFER VECTOR    U1G00330
                          XIO     IX190-1   SENSE ILSW                  U1G00350
                          LDX   1 0                                 2-9 U1G00360
                          BSC     +         SKIP IF SCA INTRPT      2-9 U1G00362
                          LDX   1 1                                 2-9 U1G00364
                          BSI  I1 IX110     BRANCH TO SERVICE INTR  2-9 U1G00370
                    *                                                   U1G00380
                    IX130 LDS     0         RESTORE STATUS,             U1G00390
                    IX141 LDX  L1 *-*       *XR1,                       U1G00400
                    IX142 LDX  L2 *-*       *XR2,                       U1G00410
                    IX143 LDX  L3 *-*       *XR3,                       U1G00420
                          LDD     IX180     *ACC AND EXTENSION          U1G00430
                          BOSC I  IX120     TURN OFF INTERRUPT, RETURN  U1G00440
                    *                                               2-6 U1G00442
                    *                                                   U1G00450
                    IX180 BSS  E  2         ACCUMULATOR AND EXTENSION   U1G00460
                          DC      0                                     U1G00470
                    IX190 DC      /0300     IOCC TO SENSE ILSW          U1G00480
                    $XR3X EQU     /00E4     ADDR OF TRANSFER VECTOR     U1G00490
                          END                                           U1G00500
