                          HDNG    ILSX4 - INTERRUPT LEVEL 4 SUBROUTINE  U1J00010
                    *************************************************** U1J00020
                    *                                                 * U1J00030
                    * STATUS - VERSION 2, MODIFICATION LEVEL 6        * U1J00040
                    * FUNCTION/OPERATION - INTERRUPT LEVEL SUBROUTINE * U1J00050
                    *    FOR LEVEL 4.                                 * U1J00060
                    * ENTRY POINT - ENTERED AT IX420 BY A HARDWARE    * U1J00070
                    *    BSI VIA LOCATION 12 DECIMAL.                 * U1J00080
                    * INPUT - NONE                                    * U1J00090
                    * OUTPUT - NONE                                   * U1J00100
                    * EXTERNAL SUBROUTINES - NONE                     * U1J00110
                    * EXITS -                                         * U1J00120
                    *    NORMAL - BOSC INDIRECT THROUGH IX420.        * U1J00130
                    *    ERROR - NONE                                 * U1J00140
                    * TABLES/WORK AREAS - NONE                        * U1J00150
                    * ATTRIBUTES - REUSABLE                           * U1J00160
                    * NOTES - INDEX REGISTERS 1, 2, AND 3, STATUS,    * U1J00170
                    *    ACCUMULATOR AND EXTENSION ARE SAVED UPON     * U1J00180
                    *    ENTRY AND RESTORED AFTER INTERRUPT SERVICED. * U1J00190
                    *                                                 * U1J00200
                    *************************************************** U1J00210
                          HDNG    ILSX4 - INTERRUPT LEVEL 4 SUBROUTINE  U1J00220
                          ILS  04                                       U1J00230
                    IX410 DC      /0033     DEVICE *-* AND ISS NO. *-*  U1J00240
                          DC      /0033     DEVICE *-* AND ISS NO. *-*  U1J00250
                          DC      /0033     DEVICE *-* AND ISS NO. *-*  U1J00260
                          DC      /043D     1231 +4  AND ISS NO. 10     U1J00270
                          DC      /043C     1403 +4  AND ISS NO. 9      U1J00280
                          DC      /0437     2501 +4  AND ISS NO. 4      U1J00290
                          DC      /0734     1442 +4  AND ISS NO. 1      U1J00300
                          DC      /0435     CONSOLE +4  AND ISS NO. 2   U1J00310
                          DC      /0436     1134/1055 +4  AND ISS NO. 3 U1J00320
                    *                                                   U1J00330
                    IX420 DC      0         INTERRUPT ENTRY             U1J00340
                          STD     IX480     SAVE ACC AND EXTENSION,     U1J00350
                          STS     IX430     *STATUS,                    U1J00360
                          STX   1 IX441+1   *XR1,                       U1J00370
                          STX   2 IX442+1   *XR2,                       U1J00380
                          STX   3 IX443+1   *XR3                        U1J00390
                          LDX  I3 $XR3X     POINT TO TRANSFER VECTOR    U1J00400
                          XIO     IX495-1   SENSE KEY BOARD             U1J00410
                          SLA     2         IS IT INTERRUPT REQUEST     U1J00420
                          BSI  I  $IREQ,+Z  *KEY, BR IF YES             U1J00430
                          NOP               MAKE ILSX4 COMP W ILS04 2-6 U1J00435
                          LDX   1 9         NUMBER OF DEVICES ON LEVEL  U1J00440
                          XIO     IX490-1   SENSE ILSW                  U1J00450
                          SLCA  1 0         SHIFT AND DECREMENT XR1     U1J00460
                          BSI  I1 IX410-1   BR TO DEVICE ISS            U1J00470
                    *                                                   U1J00480
                    IX430 LDS     0         RESTORE STATUS,             U1J00490
                    IX441 LDX  L1 *-*       *XR1,                       U1J00500
                    IX442 LDX  L2 *-*       *XR2,                       U1J00510
                    IX443 LDX  L3 *-*       *XR3,                       U1J00520
                          LDD     IX480     *ACC AND EXTENSION          U1J00530
                          BOSC I  IX420     TURN OFF INTERRUPT, RETURN  U1J00540
                    *                                                   U1J00550
                    IX480 BSS  E  2         ACCUMULATOR AND EXTENSION   U1J00560
                          DC      0                                     U1J00570
                    IX490 DC      /0300     IOCC TO SENSE ILSW          U1J00580
                          DC      0                                     U1J00590
                    IX495 DC      /0F00     SENSE IOCC FOR KEY BOARD    U1J00600
                    $IREQ EQU     /002C     ADDR OF ISS FOR KEY INT REQ U1J00610
                    $XR3X EQU     /00E4     ADDR OF TRANSFER VECTOR     U1J00620
                          END                                           U1J00630
