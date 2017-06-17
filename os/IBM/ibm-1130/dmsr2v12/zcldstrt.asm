                          HDNG    1130 MONITOR SYSTEM COLD START CARD.  ZCS00010
                    *************************************************** ZCS00020
                    * STATUS - VERSION 2, MODIFICATION LEVEL 12       * ZCS00030
                    *                                                 * ZCS00040
                    *FUNCTION/OPERATION -                             * ZCS00050
                    *   THIS PROGRAM IS USED BY THE 1130 MONITOR      * ZCS00060
                    *   SYSTEM TO -                                   * ZCS00070
                    *      * DETERMINE THE PHYSICAL DRIVE NUMBER OF   * ZCS00080
                    *        LOGICAL DRIVE ZERO.                      * ZCS00090
                    *      * READ IN THE COLD START PROGRAM FROM THE  * ZCS00100
                    *        DISK AND THEN TRANSFER TO IT.            * ZCS00110
                    *                                                 * ZCS00120
                    *ENTRY POINT - CS000                              * ZCS00130
                    *   THE PROGRAM IS ENTERED BY PRESSING THE PROGRAM* ZCS00140
                    *   LOAD KEY.                                     * ZCS00150
                    *                                                 * ZCS00160
                    *INPUT -                                          * ZCS00170
                    *   THE PHYSICAL DRIVE NUMBER OF LOGICAL DRIVE    * ZCS00180
                    *   ZERO IS ENTERED THROUGH THE CONSOLE ENTRY     * ZCS00190
                    *   SWITCHES.                                     * ZCS00200
                    *                                                 * ZCS00210
                    *OUTPUT -                                         * ZCS00220
                    *   THE COLD START PROGRAM IS READ IN FROM THE    * ZCS00230
                    *   DISK.                                         * ZCS00240
                    *                                                 * ZCS00250
                    *EXTERNAL REFERENCES - N/A                        * ZCS00260
                    *                                                 * ZCS00270
                    *EXITS -                                          * ZCS00280
                    *   NORMAL -                                      * ZCS00290
                    *      A BRANCH IS MADE TO THE FIRST WORD OF THE  * ZCS00300
                    *      COLD START PROGRAM AFTER READING IT FROM   * ZCS00310
                    *      THE DISK.                                  * ZCS00320
                    *   ERROR - N/A                                   * ZCS00330
                    *                                                 * ZCS00340
                    *TABLES/WORK AREAS - N/A                          * ZCS00350
                    *                                                 * ZCS00360
                    *ATTRIBUTES - N/A                                 * ZCS00370
                    *                                                 * ZCS00380
                    *NOTES -                                          * ZCS00390
                    *   * THIS PROGRAM COMES TO A WAIT AT CS110 IF    * ZCS00400
                    *     EITHER THE DRIVE NUMBER ENTERED IN THE      * ZCS00410
                    *     CONSOLE ENTRY SWITCHES IS INVALID, OR THE   * ZCS00420
                    *     SPECIFIED DRIVE IS NOT YET READY.           * ZCS00430
                    *   * THE PROGRAM WILL COME TO A WAIT AT CS150 IF * ZCS00440
                    *     A DISK ERROR OCCURS WHILE READING IN THE    * ZCS00450
                    *     COLD START PROGRAM.  THE USER CAN RETRY THE * ZCS00460
                    *     OPERATION BY PRESSING THE START KEY.        * ZCS00470
                    *                                                 * ZCS00480
                    *************************************************** ZCS00490
                          ABS                                           ZCS00500
                          ORG     0                                     ZCS00510
                    *                                                   ZCS00520
                    * SET UP THE SECOND WORD OF THE BIT SWITCH IOCC.    ZCS00530
                    *                                                   ZCS00540
                    CS000 LDD     CS030     ACC = /E800, EXT = /E800    ZCS00550
                          RTE     2         ACC = /3A00, EXT = /3A00    ZCS00560
                          STO     CS030     STORE IN BIT SWITCH IOCC.   ZCS00570
                    CS009 LD      CS038     BUILD AREA CODE        2-11 ZCS00575
                          A       CS035     *FOR PHY DR 10         2-11 ZCS00580
                          STO     CS038     SAVE IN DR CODE TABLE  2-11 ZCS00585
                    CS190 LD      CS130     BUILD 1ST WORD OF      2-11 ZCS00590
                          SLA     10        * STO  L  *****  INSTR 2-11 ZCS00595
                          STO     CS130     *AND PUT IN PLACE      2-11 ZCS00600
                    CS010 MDX     CS120     BR TO CONTINUE         2-11 ZCS00605
                    *                                                 * ZCS00610
                    * INITIALLY THE FOLLOWING TWO WORDS ARE THE IOCC  * ZCS00615
                    * FOR READING THE BIT SWITCHES.                   * ZCS00620
                    *                                                 * ZCS00625
                    CS020 DC      CS035     HARDWARE INTRPT ENTRY  2-11 ZCS00630
                    *                                                 * ZCS00635
                    * THE FOLLOWING TWO WORDS WILL EVENTUALLY BE A    * ZCS00640
                    *     BOSC L  *-*       INSTRUCTION               * ZCS00645
                    *                                                 * ZCS00650
                    CS030 DC      /E800                            2-11 ZCS00655
                    *                                                   ZCS00660
                    CS035 DC      /0020     CONSTANT OF /0020      2-11 ZCS00665
                    *                                                   ZCS00670
                          XIO     CS190     SENSE DR W/RESET       2-11 ZCS00675
                          BSC     Z+        SKIP IF NO ERROR       2-11 ZCS00680
                          MDX     CS150     BR TO DISK ERROR WAIT  2-11 ZCS00685
                          MDX     CS030     RETRN TO MAINLINE LEVL 2-11 ZCS00690
                    *                                                 * ZCS00700
                    CS180 DC      /4814     USED TO BLD SEEK IOCC  2-11 ZCS00705
                    *                                                 * ZCS00710
                    * CS050 MUST BE ON EVEN ADDR. AND MUST IMMEDIATELY* ZCS00715
                    * PRECEDE CS040.                                  * ZCS00720
                    *                                                 * ZCS00725
                    CS050 DC      /F026     USED TO BLD LONG INSTR 2-11 ZCS00730
                    CS040 DC      @AC00     AREA CODE--PHY DR  0   2-11 ZCS00735
                          DC      @AC01     AREA CODE--PHY DR  1   2-11 ZCS00740
                          DC      @AC02     AREA CODE--PHY DR  2   2-11 ZCS00745
                          DC      @AC03     AREA CODE--PHY DR  3   2-11 ZCS00750
                          DC      @AC04     AREA CODE--PHY DR  4   2-11 ZCS00755
                          DC      @AC05     AREA CODE--PHY DR  5   2-11 ZCS00760
                          DC      @AC06     AREA CODE--PHY DR  6   2-11 ZCS00765
                          DC      @AC07     AREA CODE--PHY DR  7   2-11 ZCS00770
                          DC      @AC08     AREA CODE--PHY DR  8   2-11 ZCS00775
                          DC      @AC09     AREA CODE--PHY DR  9   2-11 ZCS00780
                    CS038 DC      @AC10     AREA CODE--PHY DR 10   2-11 ZCS00785
                    *                                                   ZCS00790
                    CS110 WAIT              INVAL DR NO OR DK NOT READY ZCS00830
                    CS120 XIO     CS020     GET DR NO FROM BIT SWITCHES ZCS00840
                          LD      CS035     LOAD DRIVE NUMBER      2-11 ZCS00850
                          BSC     Z+        SKIP IF NOT NEGATIVE        ZCS00860
                          MDX     CS110     BR TO INVLD DR WAIT    2-11 ZCS00870
                          S       CS171     SUB DECIMAL 10         2-11 ZCS00880
                          BSC     Z-        SKIP IF LEGAL DRIVE NUMBER  ZCS00890
                          MDX     CS120-1   BR TO INVALID DRIVE WAIT    ZCS00900
                    *                                                 * ZCS00905
                    * CS060 MUST BE ON AN EVEN ADDRESS. CS060 AND     * ZCS00910
                    * CS070 WILL BE THE SEEK IOCC. THE SEEK COUNT     * ZCS00915
                    * IS 1.                                           * ZCS00920
                    CS060 A       CS121     SET UP TO              2-11 ZCS00925
                    CS070 STO     CS121     *FETCH AREA CODE       2-11 ZCS00930
                    CS121 LD      CS038     *   FOR SELECTED DRIVE 2-11 ZCS00935
                          STO     CS009     SAVE AREA CODE         2-11 ZCS00940
                    *                                                   ZCS00970
                    * SET UP THE SENSE DEVICE IOCC.                     ZCS00980
                    *                                                   ZCS00990
                          LD      CS160     ACC = /7010            2-11 ZCS01000
                          SRA     4         ACC = /0701            2-11 ZCS01010
                          OR      CS009     OR IN AREA CODE        2-11 ZCS01020
                          STO     CS190+1   STORE IN SENSE IOCC.        ZCS01030
                    *                                                   ZCS01040
                    *  4 INSTRUCTIONS MOVED AND MODIFIED           2-12 ZCS01050
                    *                                                   ZCS01150
                    * SET UP LONG BRANCH INSTRUCTIONS.                  ZCS01160
                    *                                                   ZCS01170
                          LDD     CS050     ACC = /F026,EXT =/2000 2-11 ZCS01180
                          RTE     19        ACC = /C400,EXT =/1E04 2-11 ZCS01185
                          STO     CS160     ST IN 1ST WD OF LD L **2-11 ZCS01190
                          RTE     4         ACC = /4C18,EXT =/01E0 2-11 ZCS01195
                          STO     CS030     ST IN 1ST WD OF BOSC L 2-11 ZCS01200
                          S       CS170     ACC = /4C18, EXT = /01E0    ZCS01210
                          STD     CS170     ST IN BSC  L  *****,+- INST ZCS01220
                    *                                                   ZCS01230
                    * SET UP SECOND WORD OF SEEK IOCC.                  ZCS01240
                    *                                                   ZCS01250
                          S       CS180     ACC = /0404, EXT = /01E0    ZCS01260
                          OR      CS009     OR IN AREA CODE        2-11 ZCS01270
                          STO     CS070     STORE IN SEEK IOCC.         ZCS01300
                    *                                                   ZCS01390
                    * SET UP WORD COUNT FOR DISK READ OPERATION, AND    ZCS01400
                    * STORE IT WHERE THE COLD START PROGRAM WILL BE     ZCS01410
                    * READ INTO CORE.                                   ZCS01420
                    *                                                   ZCS01430
                          LD      CS210     ACC = /A0C0, EXT = /01E0    ZCS01440
                          SRA     7         ACC = /0141, EXT = /01E0    ZCS01450
                    *                                                   ZCS01460
                    * AT THIS POINT IN EXECUTION, THE FOLLOWING TWO     ZCS01470
                    * WORD ARE A ...STO  L  CLDST... INSTRUCTION.       ZCS01480
                    *                                                   ZCS01490
                    CS130 DC      /0035     STORE WORD COUNT       2-11 ZCS01500
                          DC      CS220     *FOR DISK READ.             ZCS01510
                    *                                                   ZCS01520
                    * SET UP SECOND WORD OF READ IOCC.                  ZCS01530
                    *                                                   ZCS01540
                          LD      CS150     ACC = /3000, EXT = /01E0    ZCS01550
                          SRA     3         ACC = /0600  EXT = /01E0    ZCS01560
                          OR      CS009     OR IN AREA CODE        2-11 ZCS01570
                          STO     CS210     STORE IN READ IOCC.         ZCS01580
                    *                                                   ZCS01590
                    * SEEK ONE CYLINDER TOWARD HOME                     ZCS01600
                    *                                                   ZCS01610
                    *                                                   ZCS01620
                    *                                                   ZCS01630
                    CS140 XIO     CS200     READ SECTOR 0          2-12 ZCS01640
                    *                                              2-12 ZCS01641
                    * IF DRIVE N IS ATTACHED & READY, THE ACC WILL 2-12 ZCS01642
                    * HAVE BIT 3 ON.  IF NOT ATTACHED AND READY,   2-12 ZCS01643
                    * THE ACC WILL HAVE BIT 3 OFF.                 2-12 ZCS01644
                    *                                              2-12 ZCS01645
                          XIO     CS190     SENSE DISK W/RESET     2-12 ZCS01646
                          SLA     3         DISK BUSY BIT TO SIGN  2-12 ZCS01647
                          BSC     -         SKIP IF DISK READY     2-12 ZCS01648
                          MDX     CS110     BR TO INVALID DR WAIT  2-12 ZCS01649
                    CS150 DC      /3000     WAIT FOR INTERRUPT.         ZCS01650
                    *                                                   ZCS01660
                          XIO     CS060     INITIATE THE SEEK      2-12 ZCS01670
                          WAIT              WAIT FOR INTERRUPT.         ZCS01680
                    *                                                   ZCS01690
                    * AT THIS POINT IN EXECUTION, THE FOLLOWING TWO     ZCS01700
                    * WORDS ARE A ...LD   L  CLDST+1... INSTRUCTION.    ZCS01710
                    *                                                   ZCS01720
                    CS160 DC      /7010     LOAD SECTOR ADDRESS    2-11 ZCS01730
                          DC      CS220+1   *OF SECTOR JUST READ.       ZCS01740
                    *                                                   ZCS01750
                    * AT THIS POINT IN EXECUTION, THE FOLLOWING TWO     ZCS01760
                    * WORDS ARE A ...BSC  L  $ZEND,+-... INSTRUCTION.   ZCS01770
                    *                                                   ZCS01780
                    CS170 DC      /0028     BR TO THE COLD START PROG   ZCS01790
                    CS171 DC      /000A     *IF IT HAS BEEN READ   2-11 ZCS01800
                          MDX     CS140     GO TRY SEEK AGAIN.          ZCS01810
                    *                                                   ZCS01820
                          BSS  E  0         ASSURE EVEN BOUNDARY        ZCS01860
                    CS200 DC      CS220     READ                        ZCS01870
                    CS210 DC      /A0C0     *IOCC.                      ZCS01880
                    *                                                   ZCS01890
                    CS220 EQU     /00D0     COLD START PROG CORE ADDR.  ZCS01900
                    *                                                   ZCS01910
                    * DISK DRIVE AREA CODES. DR 0 TO 10                 ZCS01920
                    *                                                   ZCS01930
                    @AC00 EQU     /2000                            2-11 ZCS01940
                    @AC01 EQU     /8800                            2-11 ZCS01950
                    @AC02 EQU     /9000                            2-11 ZCS01960
                    @AC03 EQU     /9800                            2-11 ZCS01970
                    @AC04 EQU     /A000                            2-11 ZCS01980
                    @AC05 EQU     /B000                            2-11 ZCS01990
                    @AC06 EQU     /B800                            2-11 ZCS02000
                    @AC07 EQU     /B810                            2-11 ZCS02010
                    @AC08 EQU     /B820                            2-11 ZCS02020
                    @AC09 EQU     /B830                            2-11 ZCS02030
                    @AC10 EQU     /B820                            2-11 ZCS02040
                          END     CS000                                 ZCS02050
