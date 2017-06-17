                          HDNG    ILS03 - INTERRUPT LEVEL 3 SUBROUTINE  U1D00010
                    *************************************************** U1D00020
                    *                                                 * U1D00030
                    * TITLE - ILS03                                   * U1D00040
                    * STATUS - VERSION 2. MODIFICATION LEVEL 9        * U1D00050
                    * FUNCTION/OPERATION - .ILS03. IS THE INTERRUPT   * U1D00060
                    *  LEVEL SUBROUTINE FOR LEVEL 3.                  * U1D00070
                    * ENTRY POINTS - ILS03 IS ENTERED BY A HARDWARE   * U1D00080
                    *  BSI VIA LOCATION 11.                           * U1D00090
                    * INPUT - NONE                                    * U1D00100
                    * OUTPUT - NONE                                   * U1D00110
                    * EXTERNAL SUBROUTINES - NONE                     * U1D00120
                    * EXITS -                                         * U1D00130
                    *  NORMAL - BOSC INDIRECT THROUGH .ILS03.         * U1D00140
                    *  ERROR - NONE                                   * U1D00150
                    * TABLES/WORK AREAS - NONE                        * U1D00160
                    * ATTRIBUTES - REUSABLE                           * U1D00170
                    * NOTES - THE 1627 PLOTTER INTERRUPT IS ON LEVEL 3* U1D00180
                    *         THE 2250 DISPLAY UNIT INTERRUPT ALSO  2-6 U1D00190
                    *                                                 * U1D00200
                    *************************************************** U1D00210
                          HDNG    ILS03 - INTERRUPT LEVEL 3 SUBROUTINE  U1D00220
                          ILS  03                                       U1D00230
                    I0310 DC      /0741     MTCA INTERVAL TIMER     2-9 U1D00235
                          DC      /0441     MTCA END OF OPERATION   2-9 U1D00236
                          DC      /0033                             2-9 U1D00237
                          DC      /0033                             2-9 U1D00238
                          DC      /0033                             2-9 U1D00239
                          DC      /043E     2250                    2-9 U1D00240
                          DC      /0033                             2-6 U1D00250
                          DC      /0033                             2-6 U1D00260
                          DC      /0033                             2-6 U1D00270
                          DC      /043A     1627                    2-6 U1D00280
                    *                                               2-6 U1D00290
                    I0320 DC      0         INTRPT ENTRY            2-6 U1D00300
                          STD     I0380     SAVE ACC AND EXT,       2-6 U1D00310
                          STS     I0330     *STATUS,                2-6 U1D00320
                          STX   1 I0341+1   *XR1,                   2-6 U1D00330
                          STX   2 I0342+1   *XR2                    2-6 U1D00340
                          LDX   1 10        NO. OF DEVICES ON LEVEL 2-9 U1D00350
                          XIO     I0390-1    GET ILSW               2-6 U1D00355
                          BSC     Z         SKIP IF 1627 INTRPT     2-9 U1D00360
                          SLCA  1 0         SHIFT AND DECR XR1      2-6 U1D00370
                          BSI  I1 I0310-1   BR TO DEVICE ISS        2-6 U1D00380
                    *                                               2-6 U1D00390
                    I0330 LDS     0         RESTORE STATUS,         2-6 U1D00400
                    I0341 LDX  L1 *-*       *XR1,                   2-6 U1D00410
                    I0342 LDX  L2 *-*       *XR2,                   2-6 U1D00420
                          LDD     I0380     *ACC AND EXT            2-6 U1D00430
                          BOSC I  I0320     TURN OFF INTRPT, RETURN 2-6 U1D00440
                    *                                               2-6 U1D00450
                    *                                               2-7 U1D00480
                    I0380 BSS  E  2         ACC AND EXT             2-6 U1D00490
                          DC      0                                 2-6 U1D00500
                    I0390 DC      /0300     IOCC TO SENSE ILSW      2-6 U1D00510
                          END                                       2-6 U1D00520
