                          HDNG    ILS01 - INTERRUPT LEVEL 1 SUBROUTINE  U1B00010
                    *************************************************** U1B00020
                    *                                                 * U1B00030
                    * TITLE - ILS01                                   * U1B00040
                    * STATUS - VERSION 2, MODIFICATION LEVEL 9        * U1B00050
                    * FUNCTION/OPERATION - .ILS01. IS THE INTERRUPT   * U1B00060
                    *  LEVEL SUBROUTINE FOR LEVEL 1                   * U1B00070
                    * ENTRY POINTS - ILS01. ENTERED BY HARDWARE BSI   * U1B00080
                    *  VIA LOCATION 9                                 * U1B00090
                    * INPUT - NONE                                    * U1B00100
                    * OUTPUT - NONE                                   * U1B00110
                    * EXTERNAL ROUTINES - NONE                        * U1B00120
                    * EXITS - NORMAL - BOSC INDIRECT THROUGH .ILS01.  * U1B00130
                    *      -ERROR - NONE                              * U1B00140
                    * TABLES/WORK AREAS - NONE                        * U1B00150
                    * ATTRIBUTES - REUSABLE                           * U1B00160
                    * NOTES -                                         * U1B00170
                    *             ******     1130 ILS01               * U1B00180
                    *             *     THIS IS THE INTERRUPT LEVEL   * U1B00190
                    *             *     SUBROUTINE FOR LEVEL 1.       * U1B00200
                    *             *     THE 1132 PRINTER AND THE      * U1B00210
                    *             *     COMMUNICATIONS ADAPTER ARE ON * U1B00220
                    *             *     LEVEL 1.                      * U1B00230
                    *             *     BIT 0 - 1132 PRINTER          * U1B00240
                    *             *     BIT 1 - COMMUNICATIONS ADAPTER* U1B00250
                    *             ******                              * U1B00260
                    *                                                 * U1B00270
                    *************************************************** U1B00280
                          HDNG    ILS01 - INTERRUPT LEVEL 1 SUBROUTINE  U1B00290
                          ILS  01                                       U1B00300
                    P2    DC      /0439                                 U1B00310
                    CAT2  DC      /043B                                 U1B00320
                    ILS01 DC      0          ENTERED BY HARDWARE BSI    U1B00330
                    *                        *VIA LOCATION 0009         U1B00340
                          STD     AQ         SAVE ACC AND EXTENSION     U1B00350
                          STS     STAT       SAVE STATUS                U1B00360
                          STX   1 XR1+1      SAVE INDEX REGISTER 1      U1B00370
                          STX   2 XR2+1      SAVE INDEX REGISTER 2      U1B00380
                    *                                                   U1B00390
                          XIO     SENS-1     SENSE ILSW                 U1B00400
                          LDX   1 1                                 2-9 U1B00410
                          BSC     +         SKIP IF SCA INTRPT      2-9 U1B00420
                          LDX   1 0                                 2-9 U1B00422
                          BSI  I1 P2        BR TO PROCESS INTRPT    2-9 U1B00424
                    *                                                   U1B00430
                    STAT  LDS     0          RESTORE                    U1B00440
                          LDD     AQ                                    U1B00450
                    XR1   LDX  L1 *-*                                   U1B00460
                    XR2   LDX  L2 *-*                                   U1B00470
                    *                                                   U1B00480
                          BOSC I  ILS01      TURN OFF LEVEL AND EXIT    U1B00490
                    *                                                   U1B00500
                    *                                                   U1B00530
                    AQ    BSS  E  2          FOR SAVING ACC AND EXT.    U1B00540
                          DC      0                                     U1B00550
                    SENS  DC      /0300      IOCC TO SENSE ILSW         U1B00560
                    *                                                   U1B00570
                          END                                           U1B00580
