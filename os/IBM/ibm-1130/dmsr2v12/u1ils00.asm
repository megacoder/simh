                          HDNG    ILS00 - INTERRUPT LEVEL 0 SUBROUTINE  U1A00010
                    *************************************************** U1A00020
                    *                                                 * U1A00030
                    * TITLE - ILS00                                   * U1A00040
                    * STATUS - VERSION 2, MODIFICATION LEVEL 0        * U1A00050
                    * FUNCTION/OPERATION - .ILS00. IS THE INTERRUPT   * U1A00060
                    *  LEVEL SUBROUTINE FOR LEVEL 0.                  * U1A00070
                    * ENTRY POINTS - ILS00 IS ENTERED BY A HARDWARE   * U1A00080
                    *  BSI VIA LOCATION 8.                            * U1A00090
                    * INPUT - NONE                                    * U1A00100
                    * OUTPUT - NONE                                   * U1A00110
                    * EXTERNAL SUBROUTINES - NONE                     * U1A00120
                    * EXITS -                                         * U1A00130
                    *  NORMAL - BOSC INDIRECT THROUGH .ILS00.         * U1A00140
                    *  ERROR - NONE                                   * U1A00150
                    * TABLES/WORK AREAS - NONE                        * U1A00160
                    * ATTRIBUTES - REUSABLE                           * U1A00170
                    * NOTES - THE 1442 COLUMN INTERRUPT IS ON LEVEL 0.* U1A00180
                    *                                                 * U1A00190
                    *************************************************** U1A00200
                          HDNG    ILS00 - INTERRUPT LEVEL 0 SUBROUTINE  U1A00210
                          ILS  00                                       U1A00220
                    ADDR  DC      /0434      = CARD +4               ** U1A00230
                    INT   DC      0                                     U1A00240
                          STD     TEMP       SAVE STATUS                U1A00250
                          STX   1 INT14+1                               U1A00260
                          STX   2 INT15+1                               U1A00270
                          STS     INT12                                 U1A00280
                          LD      AREA       OBTAIN IOCC FOR DSW SENSE  U1A00290
                          BSI  I  ADDR       GO TO ISS ROUTINE          U1A00300
                    INT12 LDS     0                                     U1A00310
                    INT14 LDX  L1 0                                     U1A00320
                    INT15 LDX  L2 *-*                                   U1A00330
                          LDD     TEMP       RESTORE STATUS             U1A00340
                          BOSC I  INT        EXIT & TURN OFF INT LEVEL  U1A00350
                    TEMP  BSS  E  2          ACCUMULATOR AND EXTENSION  U1A00360
                    AREA  DC      /1701      = 1442 CARD             ** U1A00370
                          END                                           U1A00380
