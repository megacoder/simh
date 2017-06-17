                          HDNG    ILS04 - INTERRUPT LEVEL 4 SUBROUTINE  U1E00010
                    *************************************************** U1E00020
                    *                                                 * U1E00030
                    * TITLE - ILS04                                   * U1E00040
                    * STATUS - VERSION 2, MOCIFICATION LEVEL 0        * U1E00050
                    * FUNCTION/OPERATION - .ILS04. IS A DUMMY         * U1E00060
                    *  INTERRUPT LEVEL SUBROUTINE FOR LEVEL 4.        * U1E00070
                    * ENTRY POINTS - THIS SUBROUTINE IS NOT ENTERED.  * U1E00080
                    * INPUT - NONE                                    * U1E00090
                    * OUTPUT - NONE                                   * U1E00100
                    * EXTERNAL SUBROUTINES - NONE                     * U1E00110
                    * EXITS - NONE                                    * U1E00120
                    * TABLES/WORK AREAS - NONE                        * U1E00130
                    * NOTES - THE FOLLOWING DEVICES ARE ON LEVEL 4    * U1E00140
                    *         1231 OPTICAL MARK PAGE READER           * U1E00150
                    *         1403 PRINTER                            * U1E00160
                    *         2501 CARD READER                        * U1E00170
                    *         1442 CARD READER/PUNCH                  * U1E00180
                    *         KEYBOARD/CONSOLE PRINTER                * U1E00190
                    *         1134/1055 PAPER TAPE READER/PUNCH       * U1E00200
                    *  THIS DUMMY SUBROUTINE PROVIDES A LET LOOK-UP   * U1E00210
                    *  AND AN INTERRUPT BRANCH TABLE FOR THE CORE LOAD* U1E00220
                    *  BUILDER.  A USER ILS04 SUBROUTINE IS STORED ON * U1E00230
                    *  THE DISK AFTER THIS SUBROUTINE HAS BEEN DELETED* U1E00240
                    *  AND IS USED IN PLACE OF THE ILS04 SUBROUTINE   * U1E00250
                    *  WHICH IS A PART OF THE SYSTEM.                 * U1E00260
                    *                                                 * U1E00270
                    *************************************************** U1E00280
                          HDNG    ILS04 - INTERRUPT LEVEL 4 SUBROUTINE  U1E00290
                    *     THIS IS A DUMMY ILS04 SUBROUTINE              U1E00300
                    *                                                   U1E00310
                          ILS  04                                       U1E00320
                    @ISTV EQU     51                                    U1E00330
                    ADDR4 DC      /0400+@ISTV    RESERVED               U1E00340
                          DC      /0400+@ISTV    RESERVED               U1E00350
                          DC      /0400+@ISTV    RESERVED               U1E00360
                          DC      /040A+@ISTV    1231                   U1E00370
                          DC      /0409+@ISTV    1403                   U1E00380
                          DC      /0404+@ISTV    2501                   U1E00390
                          DC      /0701+@ISTV    1442                   U1E00400
                          DC      /0402+@ISTV    KEYBOARD/CONSOLE PTR   U1E00410
                          DC      /0403+@ISTV    1134/1055              U1E00420
                    ILS4  DC      0              END-OF-TABLE MARKER    U1E00430
                          END                                           U1E00440
