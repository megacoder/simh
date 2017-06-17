                          HDNG    1130 PAPER TAPE REPRODUCER            ZPR00010
                    *************************************************** ZPR00020
                    *STATUS-VERSION 2,MODIFICATION 000                * ZPR00030
                    *                                                 * ZPR00040
                    *FUNCTION/OPERATION- THIS IS A STAND-ALONE UTILITY* ZPR00050
                    *PROGRAM TO REPRODUCE PAPER-TAPE. THIS IS A FRAME-* ZPR00060
                    *FOR-FRAME REPRODUCER WITH OUT CONVERSION OF ANY  * ZPR00070
                    *KIND.                                            * ZPR00080
                    *THIS IS A SELF LOADING PAPER TAPE STRIP AVAILABLE* ZPR00090
                    *ONLY WITH THE PAPERTAPE SYSTEM.                  * ZPR00100
                    *                                                 * ZPR00110
                    *ENTRY POINTS-                                    * ZPR00120
                    *     *START- THIS IS THE ONLY ENTRY TO THE PROG. * ZPR00130
                    *     UPON ENTRY WAITS WITH 1111 IN THE  ACC,     * ZPR00140
                    *     WAITING FOR THE USER TO LOAD THE PAPER TAPE * ZPR00150
                    *     READER AND PAPER TAPE PUNCH.                * ZPR00160
                    *                                                 * ZPR00170
                    *INPUT- PROVIDED BY THE PAPER TAPE READER         * ZPR00180
                    *OUTPUT- PUNCHED OUTPUT ON PAPER TAPE PUNCH       * ZPR00190
                    *                                                 * ZPR00200
                    *EXTERNAL REFERENCES- NONE                        * ZPR00210
                    *                                                 * ZPR00220
                    *EXITS-NORMAL  NONE, CONTINUOUSLY ALTERNATING     * ZPR00230
                    *READING ONE FRAME AND PUNCHING ONE FRAME.        * ZPR00240
                    *                                                 * ZPR00250
                    *TABLES,WORK AREAS- .SENSE. USED AS A 1 WD BUFFER * ZPR00260
                    *                                                 * ZPR00270
                    *ATTRIBUTES- REUSABLE                             * ZPR00280
                    *                                                 * ZPR00290
                    *NOTES- STAND ALONE STRIP OF PAPER TAPE           * ZPR00300
                    *WILL REPRODUCE MANY CONSECTITIVE TAPES WITHOUT   * ZPR00310
                    *REQUIRING RELOADING OF ITSELF.                   * ZPR00320
                    *WAITS WITH VARIOUS ACC SETTINGS AS FOLLOWS       * ZPR00330
                    *     *1111- OPERATOR SHOULD READY READER AND PNCH* ZPR00340
                    *     *2222- OPERATOR SHOULD READY READER         * ZPR00350
                    *     *3333- OPERATOR SHOULD READY PUNCH          * ZPR00360
                    *                                                 * ZPR00370
                    *************************************************** ZPR00380
                    *                                                 * ZPR00390
                          HDNG    1130 PAPER TAPE REPRODUCER            ZPR00400
                    *             1130 IPL MODE PROGRAM                 ZPR00410
                    *             TO REPRODUCE PAPER TAPE               ZPR00420
                    *                                                   ZPR00430
                    START LD      H1111                                 ZPR00440
                          WAIT              LET OPERATOR READY JOB      ZPR00450
                    *                                                 * ZPR00460
                    *************************************************** ZPR00470
                    *                                                 * ZPR00480
                    *   THE FOLLOWING INST IS USED ONLY ONCE AND THEN * ZPR00490
                    *   USED AS A 1 WORD BUFFER FOR READ AND PUNCHING * ZPR00500
                    *                                                 * ZPR00510
                    SENSE MDX     GO        START REPRODUCING           ZPR00520
                          DC      /1F01     IOCC TO SENSE WITH RESET    ZPR00530
                    READ  DC      SENSE     IOCC TO READ ONE            ZPR00540
                          DC      /1A00     * FRAME                     ZPR00550
                    PUNCH DC      SENSE     IOCC TO WRITE ONE           ZPR00560
                          DC      /1900     * FRAME                     ZPR00570
                          DC      LEV4      THESE FIVE CONSTANTS        ZPR00580
                          DC      LEV4      * FORCE ALL INTERRUPTS      ZPR00590
                          DC      LEV4      * ON LEVELS ZERO THRU       ZPR00600
                          DC      LEV4      * FOUR TO BRANCH TO LEVEL   ZPR00610
                          DC      LEV4      * FOUR INTERRUPT PROCESSING ZPR00620
                          DC      LEV5      PROGRAM STOP KEY INTERRUPT  ZPR00630
                    SENS  DC      0         IOCC TO SENSE DSW           ZPR00640
                          DC      /1F00                                 ZPR00650
                    CONT  DC      0         IOCC TO START RDR.          ZPR00660
                          DC      /1C00                                 ZPR00670
                    LEV4  DC      0         ENTRY WORD                  ZPR00680
                          XIO     SENSE     SENSE DSW                   ZPR00690
                          SLA     2                                     ZPR00700
                          BSC     C         TEST FOR READ RESP.         ZPR00710
                          MDX     OUT       YES, RETURN TO MAINLINE     ZPR00720
                          SLA     1                                     ZPR00730
                          BSC     -         TEST FOR PUNCH RESP.        ZPR00740
                          NOP                                           ZPR00750
                    OUT   BOSC I  LEV4      YES, RETURN TO MAINLINE     ZPR00760
                    LEV5  DC      0         PROGRAM STOP ENTRY          ZPR00770
                          WAIT                                          ZPR00780
                          BOSC I  LEV5                                  ZPR00790
                    GO    XIO     SENS      SENSE WITHOUT RESET         ZPR00800
                          SLA     5                                     ZPR00810
                          BSC     +Z        TEST FOR RDR. READY         ZPR00820
                          MDX     WAIT       STOP IF NOT READY          ZPR00830
                          XIO     CONT      START READER                ZPR00840
                          WAIT                                          ZPR00850
                          XIO     READ      READ CHARACTER              ZPR00860
                    SPRDY XIO     SENS                                  ZPR00870
                          SLA     7                                     ZPR00880
                          BSC     +Z        TEST FOR PCH. READY         ZPR00890
                          MDX     PCHNR                                 ZPR00900
                          XIO     PUNCH     PUNCH CHARACTER             ZPR00910
                          WAIT              WAIT FOR PUNCH INTERRUPT    ZPR00920
                          MDX     GO        GO READ NEXT FRAME          ZPR00930
                    WAIT  LD      H2222     READER NOT READY            ZPR00940
                          WAIT                                          ZPR00950
                          MDX     GO        RETRY READING PAPER TAPE    ZPR00960
                    PCHNR LD      H3333     PUNCH NOT READY             ZPR00970
                          WAIT                                          ZPR00980
                          MDX     SPRDY     RETRY PUNCHING PAPER TAPE   ZPR00990
                    *************************************************** ZPR01000
                    *                                                 * ZPR01010
                    *   DISPLAY CONSTANTS SIGNIFYING OPERATOR ACTION  * ZPR01020
                    *                                                 * ZPR01030
                    *                                                 * ZPR01040
                    H1111 DC      /1111     MAKE READER AND PNCH READY  ZPR01050
                    H2222 DC      /2222     MAKE READER READY           ZPR01060
                    H3333 DC      /3333     MAKE PUNCH READY            ZPR01070
                          END     START                                 ZPR01080
