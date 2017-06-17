                          HDNG    ILSX3 - INTERRUPT LEVEL 3 SUBROUTINE  U1I00010
                    *************************************************** U1I00020
                    *                                                 * U1I00030
                    * STATUS - VERSION 2, MODIFICATION LEVEL 9        * U1I00040
                    * FUNCTION/OPERATION - INTERRUPT LEVEL SUBROUTINE * U1I00050
                    *    FOR LEVEL 3.                                 * U1I00060
                    * ENTRY POINT - ENTERED AT IX320 BY A HARDWARE    * U1I00070
                    *    BSI VIA LOCATION 11 DECIMAL.                 * U1I00080
                    * INPUT - NONE                                    * U1I00090
                    * OUTPUT - NONE                                   * U1I00100
                    * EXTERNAL SUBROUTINES - NONE                     * U1I00110
                    * EXITS -                                         * U1I00120
                    *    NORMAL - BOSC INDIRECT THROUGH IX320.        * U1I00130
                    *    ERROR - NONE                                 * U1I00140
                    * TABLES/WORK AREAS - NONE                        * U1I00150
                    * ATTRIBUTES - REUSABLE                           * U1I00160
                    * NOTES - INDEX REGISTERS 1, 2, AND 3, STATUS,    * U1I00170
                    *    ACCUMULATOR AND EXTENSION ARE SAVED UPON     * U1I00180
                    *    ENTRY AND RESTORED AFTER INTERRUPT SERVICED. * U1I00190
                    *                                                 * U1I00200
                    *************************************************** U1I00210
                          HDNG    ILSX3 - INTERRUPT LEVEL 3 SUBROUTINE  U1I00220
                          ILS  03                                       U1I00230
                    IX310 DC      /0741     MTCA +7,    ISS NO. 14  2-9 U1I00235
                          DC      /0441     MTCA +4,    ISS NO. 14  2-9 U1I00236
                          DC      /0033     DEVICE *-*, ISS NO. *-* 2-9 U1I00237
                          DC      /0033     DEVICE *-*, ISS NO. *-* 2-9 U1I00238
                          DC      /0033     DEVICE *-*, ISS NO. *-* 2-9 U1I00239
                          DC      /043E     2250 +4,    ISS NO. 11  2-9 U1I00240
                          DC      /0033     DEVICE *-* AND ISS NO. *-*  U1I00250
                          DC      /0033     DEVICE *-* AND ISS NO. *-*  U1I00260
                          DC      /0033     DEVICE *-* AND ISS NO. *-*  U1I00270
                          DC      /043A     1627 +4    AND ISS NO. 7    U1I00280
                    *                                                   U1I00290
                    IX320 DC      0         INTERRUPT ENTRY             U1I00300
                          STD     IX380     SAVE ACC AND EXTENSION,     U1I00310
                          STS     IX330     *STATUS,                    U1I00320
                          STX   1 IX341+1   *XR1,                       U1I00330
                          STX   2 IX342+1   *XR2,                       U1I00340
                          STX   3 IX343+1   *XR3                        U1I00350
                          LDX  I3 $XR3X     POINT TO TRANSFER VECTOR    U1I00360
                          LDX   1 10        NO. OF DEVICES ON LEVEL 2-9 U1I00370
                          XIO     IX390-1   SENSE ILSW                  U1I00380
                          BSC     Z         SKIP IF 1627 INTRPT     2-9 U1I00390
                          SLCA  1 0         SHIFT AND DECREMENT XR1     U1I00400
                          BSI  I1 IX310-1   BR TO DEVICE ISS            U1I00410
                    *                                                   U1I00420
                    IX330 LDS     0         RESTORE STATUS,             U1I00430
                    IX341 LDX  L1 *-*       *XR1,                       U1I00440
                    IX342 LDX  L2 *-*       *XR2,                       U1I00450
                    IX343 LDX  L3 *-*       *XR3,                       U1I00460
                          LDD     IX380     *ACC AND EXTENSION          U1I00470
                          BOSC I  IX320     TURN OFF INTERRUPT, RETURN  U1I00480
                    *                                                   U1I00490
                    IX380 BSS  E  2         ACCUMULATOR AND EXTENSION   U1I00530
                          DC      0                                     U1I00540
                    IX390 DC      /0300     IOCC TO SENSE ILSW          U1I00550
                    $XR3X EQU     /00E4     ADDR OF TRANSFER VECTOR     U1I00560
                          END                                           U1I00570
