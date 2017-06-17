                          HDNG    CARDZ                                 T5A00020
                          LIBR                                          T5A00030
                          ISS  01 CARDZ     0    4                      T5A00040
                    *************************************************** T5A00050
                    *                                                 * T5A00060
                    *STATUS-VERSION 2, MODIFICATION 9                 * T5A00070
                    *                                                 * T5A00080
                    *FUNCTION/OPERATION-                              * T5A00090
                    *   SINGLE DEVICE (1442) CARD READ/PUNCH          * T5A00100
                    *   SUBROUTINE FOR FORTRAN, CALLED BY SFIO        * T5A00110
                    *                                                 * T5A00120
                    *ENTRY POINTS-                                    * T5A00130
                    *   *  CARDZ-CALL PORTION ENTERED BY SFIO         * T5A00140
                    *   *  CZ100-INTERRUPT LEVEL 1 ENTRY FOR COLUMN   * T5A00150
                    *      INTERRUPTS                                 * T5A00160
                    *      CZ110-INTERRUPT LEVEL 4 ENTRY FOR OPERATION* T5A00170
                    *      COMPLETE INTERRUPT                         * T5A00180
                    *INPUT-                                           * T5A00190
                    *   *  ACC=0 FOR READ, 2 FOR WRITE                * T5A00200
                    *   *  XR1 CONTAINS BUFFER ADDRESS                * T5A00210
                    *   *  XR2 CONTAINS WORD COUNT                    * T5A00220
                    *                                                 * T5A00230
                    *OUTPUT                                           * T5A00240
                    *   *  A PUNCHED CARD OR BUFFER OF DATA           * T5A00250
                    *                                                 * T5A00260
                    *EXTERNAL REFERENCES-                             * T5A00270
                    *   *  $PRET                                      * T5A00280
                    *   *  $PST4                                      * T5A00290
                    *   *  $EXIT                                      * T5A00300
                    *   *  $RCWZ                                      * T5A00310
                    *   *  HOLEZ                                      * T5A00330
                    *EXITS-                                           * T5A00340
                    *   NORMAL-                                       * T5A00350
                    *      * CALL PORTION-CARDZ+1, BACK TO SFIO       * T5A00360
                    *      * INTERRUPT PORTION CZ100 FOR LEVEL 1 AND  * T5A00370
                    *        CZ110 FOR LEVEL 4 TO RETURN TO ILS       * T5A00380
                    *      * $EXIT WHEN // RECORD ENCOUNTERED         * T5A00390
                    *                                                 * T5A00400
                    *   ERROR-                                        * T5A00410
                    *      * $PRET-MONITOR PRE-OPERATIVE ERROR TRAP   * T5A00420
                    *        WHEN NOT IN READY STATUS.                * T5A00430
                    *      * $PST4-MONITOR POST-OPERATIVE ERROR TRAP  * T5A00440
                    *        WHEN ERROR CONDITION                     * T5A00450
                    *                                                 * T5A00460
                    *TABLES/WORK  AREAS-N/A                           * T5A00470
                    *                                                 * T5A00480
                    *NOTES-REGISTERS NOT SAVED.                       * T5A00490
                    *                                                 * T5A00500
                    *************************************************** T5A00510
                          HDNG    CARDZ                                 T5A00520
                    *                                                   T5A00530
                    *             SYSTEM COMMUNICATION WORDS            T5A00540
                    *                                                   T5A00550
                    $PST4 EQU     /8D        POST OP ERR TRAP LEVEL 4   T5A00560
                    $EXIT EQU     /38        MONITOR EXIT               T5A00570
                    $RWCZ EQU     /F1         PREV 1442 RD/WRT SWITCH   T5A00580
                    $PRET EQU     /28        PRE-OP ERR TRAP            T5A00590
                    *                                                   T5A00610
                    *             PROGRAM ENTRY POINT                   T5A00620
                    *                                                   T5A00630
                    CARDZ MDX     CZ200      BR TO START PROCESSING     T5A00640
                          BSC  I  *-*        RETURN TO CALLING PROGRAM  T5A00650
                    CZ010 DC      *          INTERRUPT SWITCH           T5A00660
                    *                        +=NO INTERRUPT, 0=COLUMN   T5A00670
                    *                        *INTERRUPT, -= OP COMPLETE T5A00680
                    *                                                   T5A00690
                    *                                                   T5A00700
                    *             COLUMN INTERRUPT ENTRY                T5A00710
                    *                                                   T5A00720
                    CZ100 DC      *-*        COL. INTERRUPT ENTRY POINT T5A00730
                          MDX     CZ400      BR TO SERVICE INTERRUPT    T5A00740
                          DC      /8000      NEG SIGN FOR OP COMPLETE   T5A00750
                    *                                                   T5A00760
                    *                        PROCESS OP COMPLETE        T5A00770
                    *                                                   T5A00780
                    CZ110 DC      *-*        OP COMPLETE INTERRUPT      T5A00790
                          XIO     CZ900      SENSE WITH RESET           T5A00800
                          STO     CZ920      SAVE DSW WORD TEMP STO     T5A00810
                          LD      CZ921      LOAD NEGATIVE WD           T5A00820
                          STO     CZ010      SAVE IN INTERRUPT SWITCH   T5A00830
                          BSC  I  CZ110      RETURN TO ILS              T5A00840
                    *                                                   T5A00841
                          BSS  E  0                                     T5A00842
                    CZ900 DC      0          TEMP STO DSW WORD AND      T5A00843
                          DC      /1702      *SENSE IOCC WITH RESET     T5A00844
                    *                                                   T5A00850
                    *             MAINLINE PROCESSING                   T5A00860
                    *                                                   T5A00870
                    CZ200 STX   1 CZ260+1    SAVE I/O BUFFER POINTER    T5A00880
                          STO     CZ912      SAVE READ/WRITE INDICATOR  T5A00890
                          BSC  L  CZ230,+-   BRANCH IF INDR=READ        T5A00900
                          LIBF    HOLEZ      CONVERT WRITE BUFFER       T5A00910
                          LD   L  $RWCZ      TEST PREVIOUS CARD OP      T5A00920
                          BSC  L  CZ220,Z    BRANCH IF PREVIOUS WRITE   T5A00930
                    *                                                   T5A00940
                    *             SET UP TO READ OR WRITE USING IOCCS   T5A00950
                    *                                                   T5A00960
                    CZ210 LDD     CZ908      LOAD WRITE IOCC            T5A00970
                          MDX     CZ240      BR TO PROCESS              T5A00980
                    *                                                   T5A00990
                    CZ220 MDX  L  CZ913,4    SET FLAG TO TEST FOR //    T5A01000
                    *                        *CARD BEFORE WRITING ON IT T5A01010
                    *                                                   T5A01020
                    CZ230 XIO     CZ900      SENSE DSW                  T5A01030
                          SLA     3                                     T5A01040
                          BSC     +Z         SKIP IF NOT LAST CARD      T5A01050
                    *                                                   T5A01060
                          XIO     CZ910      FEED LAST CD (NO INTRP)    T5A01070
                    *                                                   T5A01080
                          LDD     CZ906      LOAD READ IOCC             T5A01090
                    *                                                   T5A01100
                    CZ240 STD     CZ904      SET UP START RD/PUNCH IOCC T5A01110
                          STO     CZ902+1    SET UP RD/PUNCH IOCC       T5A01120
                          SLA     16                                    T5A01130
                          NOP                                       2-3 T5A01140
                          NOP                                       2-3 T5A01141
                          MDX     CZ260      BR TO START I/O OPERATIONS T5A01150
                    *                                                   T5A01160
                    *             1442 NOT IN READY STATUS, LOAD        T5A01170
                    *             INDICATOR AND BRANCH TO PRE-OP ERROR  T5A01180
                    *                                                   T5A01190
                    CZ250 LD      CZ922      LOAD ERROR INDICATOR       T5A01200
                          BSI  L  $PRET      BRANCH TO PRE-OP ERR TRAP  T5A01210
                    *                                                   T5A01220
                    CZ260 LDX  L1 *-*         SET BUFFER POINTER        T5A01230
                          MDX   1 -1         DECR BY 1                  T5A01240
                          STX   1 CZ923       SAVE BUFFER ADDR-1        T5A01250
                          STX   1 CZ925                                 T5A01260
                          MDX   1 1          RESTORE TO BUFFER ADDR     T5A01265
                          XIO     CZ900      CHK IF READER/PUNCH READY  T5A01270
                          SLA     2         SHIFT ERROR BIT IN POS  2-9 T5A01280
                          BSC  L  CZ262,+Z  BRANCH IF ERROR         2-9 T5A01290
                          SLA     13        SHIFT NOT READY BIT     2-9 T5A01300
                          BSC  L  CZ250,+Z  BRANCH IF NOT READY     2-9 T5A01310
                          MDX     CZ270     BRANCH TO PROCESS RCD   2-9 T5A01312
                    *                                               2-9 T5A01314
                    CZ262 SLA     14        CLEAR ACC               2-9 T5A01316
                          STO     CZ924      SET NO START SW IN ERROR   T5A01320
                    *                                                   T5A01330
                    *             ERROR ROUTINE, ERROR                  T5A01340
                    *                                                   T5A01350
                    CZ265 LD      CZ922      LOAD ERROR INDICATOR       T5A01360
                          BSI  L  $PST4      BR TO POST-OP ERR TRAP     T5A01370
                          XIO     CZ900     TEST IF STILL ERROR COND2-9 T5A01372
                          AND     CZ928                             2-9 T5A01374
                          BSC  L  CZ265,Z   IF ERROR BRANCH         2-9 T5A01376
                          MDX  L  $RWCZ,0    TEST IF PREV OP A READ     T5A01380
                          MDX     CZ260      BR TO RESTART IF NOT       T5A01390
                          LD      CZ924      LOAD PREVIOUS START WORD   T5A01400
                          BSC  L  CZ266,+-   BR TO FEED IF NO I/O START T5A01410
                          LD      CZ923      LOAD CURRENT BUFR ADDR     T5A01420
                          S       CZ925      COMPARE WITH START ADDR    T5A01430
                          BSC  L  CZ260,Z    BR TO RESTART IF COL READ  T5A01440
                    *             FEED ROUTINE                          T5A01450
                    CZ266 XIO     CZ910      FEED A CARD                T5A01460
                          LD      CZ910      LOAD CONSTANT ADDR         T5A01470
                          STO     CZ390+1    SET UP ADDR                T5A01480
                          MDX     CZ300      BR TO WAIT FOR INTERRUPT   T5A01490
                    *                                                   T5A01500
                    *             WHEN  EXIT FROM CARDZ SUBROUTINE      T5A01510
                    *             SHOULD OCCUR, A BRANCH WILL COME      T5A01520
                    *             HERE AND RESTART PROCEDURES WILL      T5A01530
                    *             FOLLOW                                T5A01540
                    *                                                   T5A01550
                    CZ267 LD      CZ926                                 T5A01560
                          STO     CZ390+1    SAVE IN EXIT BRANCH        T5A01570
                          MDX     CZ260      BR TO REPROCESS            T5A01580
                    *                                                   T5A01590
                    *             NO ERROR FOUND, START PROCESSING      T5A01600
                    *                                                   T5A01610
                    CZ270 LD      CZ912      GET READ/WRITE INDICATOR   T5A01620
                          STO  L  $RWCZ      SET PREVIOUS,CURRENT OP    T5A01630
                          XIO     CZ902      START READER OR PUNCH      T5A01640
                    *                                                   T5A01650
                    *             WAIT FOR AN INTERRUPT AND PROCESS     T5A01660
                    *             AFTER INTERRUPT FINISHED              T5A01670
                    *                                                   T5A01680
                    CZ300 LD      CZ010      LOAD INTERRUPT TYPE SWITCH T5A01690
                          BSC  L  CZ300,-    BR IF COLUMN INTERRUPT     T5A01720
                          STX     CZ010     RESET INTR SWITCH       2-9 T5A01725
                    *                                                   T5A01730
                    *             OPERATION COMPLETE INTERRUPT, POST    T5A01740
                    *             PROCESSING                            T5A01750
                    *                                                   T5A01760
                          LD      CZ920      LOAD DSW WORD              T5A01770
                          SLA     3          ERROR-C, LAST CD-SIGN      T5A01780
                          BSC     C          SKIP IF NO ERROR           T5A01790
                          STX     CZ924      SET ERROR INDICATOR        T5A01800
                          BSC  L  CZ265,C    BRANCH IF ERROR            T5A01810
                          BSC  L  *+2,-      BRANCH IF NOT LAST CARD    T5A01820
                          NOP                                       2-3 T5A01830
                          NOP                                       2-3 T5A01831
                          LD      CZ913      LOAD RD BEFORE WRITE INDR  T5A01840
                          BSC  L  CZ330,Z    BR IF OFF                  T5A01850
                          LD      CZ912      LOAD READ/WRITE FALG       T5A01860
                          BSC  L  CARDZ+1,Z  EXIT ON WRITE AFTER PREVRD T5A01870
                    *                                                   T5A01880
                    *             CHECK READ O/P BUFFER FOR // BLANK    T5A01890
                    *                                                   T5A01900
                    CZ310 LD    1 2          GET 3RD WORD O/P BUFR      T5A01910
                          STO     CZ918-2    SAVE IN O/P BUFFER         T5A01920
                          LDD   1 0          LOAD 1ST 2WDS TO CHK       T5A01930
                          MDX     CZ340                                 T5A01940
                    CZ330 SLA     16         CLEAR RD BEFORE WRITE INDR T5A01950
                          STO     CZ913                                 T5A01960
                          LDD     CZ918-1    LOAD TEMP BUFR             T5A01970
                    CZ340 SD      CZ919      TEST BLANK ACC & ENTENSION T5A01980
                          BSC     +-         SKIP IF NOT BLANK ACC      T5A01990
                          RTE     16         SHIFT EXTENSION TO ACC     T5A02000
                          BSC  L  CZ350,Z    BR OUT IF NO //            T5A02010
                          LD      CZ918-2    CHECK FOR BLANK            T5A02020
                          BSC     +-         SKIP IF NOT BLANK          T5A02030
                          LDX     $EXIT      SYSTEM EXIT IF FOUND       T5A02040
                    *                                                   T5A02050
                    *             DATA NOT MONITOR CTL CD (// BLANK)    T5A02060
                    *                                                   T5A02070
                    CZ350 LD      CZ912      TEST FOR RD OR WRITE       T5A02080
                          BSC  L  CZ210,Z    GO COMPLETE WRITE          T5A02090
                    *             CONVERT READIN DATA                   T5A02100
                          LDX   2 80         SET UP WD CNT FOR HOLEZ    T5A02110
                          LIBF    HOLEZ      CONVERT READ BUFFER        T5A02120
                    CZ390 BSC  L  CARDZ+1    NORMAL EXIT FR SUBROUTINE  T5A02130
                    *                                                   T5A02140
                    *             COLUMN INTERRUPT                      T5A02150
                    *                                                   T5A02160
                    CZ400 SLA     16         CLEAR ACC                  T5A02170
                          STO  L  CZ010      SET COLUMN INTERRUPT INDR  T5A02180
                          LD      CZ913      LOAD RD-THEN WRITE FLAG    T5A02190
                          BSC  L  CZ410,Z    BR WRITE W/O PREVIOUS RD   T5A02200
                          MDX  L  CZ923,1    INCR PREVIOUS BUFFER ADDR  T5A02210
                          LD      CZ923      GET NEW ADDR               T5A02220
                          STO     CZ904       STORE IN RD/WRT IOCC      T5A02230
                          MDX     CZ420      BR TO READ OR WRITE        T5A02240
                    *                                                   T5A02250
                    *             CONSTANTS AND DATA AREAS              T5A02260
                    *                                                   T5A02270
                          BSS  E  0                                     T5A02280
                    CZ912 DC      0          CURRENT RD/WRITE FLAG      T5A02310
                    CZ913 DC      0          COUNT ON CHARS TO BE SAVED T5A02320
                    CZ901 DC      0                                     T5A02330
                          DC      /1701      *SENSE IOCC WITHOUT RESET  T5A02340
                    CZ902 DC      /1000      ERROR DISPLAY WD AND STO   T5A02350
                          DC      0          *FOR START RD/WRITE IOCC   T5A02360
                    CZ904 DC      0          READ OR PUNCH LOC AND      T5A02370
                          DC      0          *IOCC SET BY PROGRAM       T5A02380
                    CZ906 DC      /1404      START READ IOCC AND        T5A02390
                          DC      /1200      *READ IOCC                 T5A02400
                    CZ908 DC      /1401      START WRITE IOCC AND       T5A02410
                          DC      /1100      *WRITE IOCC                T5A02420
                    CZ910 DC      CZ267      LOC OF FEED ERR PROCESSING T5A02430
                          DC      /1402      *AND FEED IOCC             T5A02440
                    *                        *NOW-ZERO INDICATES READ   T5A02450
                    *                        *AND TEST BEFORE PUNCHING  T5A02460
                    CZ926 DC      CARDZ+1                           2-3 T5A02461
                    CZ914 DC      CZ918-4    TEMP BUFR ADDR-4           T5A02470
                          DC      0          TEMP 4 WD BUFR TO STORE    T5A02480
                          DC      0          *FIRST 3 COLS OF DATA ON   T5A02490
                          DC      0          *CD +ALL OTHER COLS IN 4TH T5A02500
                    CZ918 DC      0          *WD TO TEST FOR //BLANK    T5A02510
                    CZ920 EQU     CZ900      SAVE DSW WORD              T5A02530
                    CZ921 EQU     CZ100+2    BEGATIVE SIGN CONSTANT     T5A02540
                    CZ922 EQU     CZ902      ERROR INDICATOR            T5A02550
                    CZ923 DC      0          TEMP STO BUFR ADDR-1       T5A02560
                    CZ924 DC      0          ERR TYPE SW                T5A02570
                    CZ925 DC      0          BUFFER ADDR FOR ERR CMP    T5A02580
                    CZ919 DC      /3000     EBC SLASH(ODD ADDR TO SD2-3 T5A02590
                    CZ928 DC      /2001     MASK                    2-9 T5A02592
                    *                                                   T5A02600
                    *             SET UP TO READ BEFORE WRITE. PREVIOUS T5A02610
                    *             CARD WAS WRITTEN                      T5A02620
                    *                                                   T5A02630
                    CZ410 A       CZ914      GET ADDR OF TEMPORARY      T5A02640
                    *                        BUFFER WHERE 3 COLS OF     T5A02650
                    *                        DATA & ALL OTHER COLS TO   T5A02660
                    *                        BE STORED                  T5A02670
                    *                                                   T5A02680
                          STO     CZ904      SET UP WRITE IOCC          T5A02690
                          MDX  L  CZ913,-1   DECR 4 SAVE CHAR CNT       T5A02700
                          MDX     CZ420      BR TO PROCESS COLS 1-3     T5A02710
                          MDX  L  CZ913,1    RESET CNT SO WDS 4-80      T5A02720
                    *                        *STORED IN 1 WD TEMP BUFR  T5A02730
                    *                                                   T5A02740
                    CZ420 XIO     CZ904      READ OR WRITE COLUMN       T5A02750
                          XIO     CZ901      RESET INTERRUPT INDRS      T5A02760
                          BSC  I  CZ100      BR OUT OF COL. INTERRUPT   T5A02770
                          END                                           T5A02780
