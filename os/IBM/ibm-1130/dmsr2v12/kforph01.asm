                          HDNG    1130 FORTRAN COMPILER PHASE 1       * K0100010
                    *************************************************** K0100020
                    *                                                 * K0100030
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * K0100040
                    *                                                 * K0100050
                    *FUNCTION/OPERATION-                              * K0100060
                    *                                                 * K0100070
                    *   * LOADS THE SYSTEM INPUT, THE SYSTEM INPUT    * K0100080
                    *     CONVERSION, AND THE SYSTEM PRINT SUBROUTINES* K0100090
                    *     FOR USE IN THIS PHASE.                      * K0100100
                    *                                                 * K0100110
                    *   * INITIALIZES THE INTERRUPT TRANSFER ADDRESSES* K0100120
                    *     NECESSARY FOR THESE SUBROUTINES.  SINCE     * K0100130
                    *     OTHER PHASES REQUIRE THE SYSTEM PRINT SUB-  * K0100140
                    *     ROUTINE, THIS SUBROUTINE IS LOADED AT A     * K0100150
                    *     COMMON ADDRESS SO THE INTERRUPT BRANCH ADDR * K0100160
                    *     FOR THIS SUBROUTINE NEED ONLY BE INITIALIZED* K0100170
                    *     ONCE.  THE ILS 4 BRANCH TABLE IS LOCATED AT * K0100180
                    *     A HIGH CORE ADDRESS WHERE IT WILL NOT BE    * K0100190
                    *     OVERLAYED.                                  * K0100200
                    *                                                 * K0100210
                    *   * READS THE CONTROL RECORDS, AND SETS         * K0100220
                    *     CORRESPONDING INDICATORS IN THE FORTRAN     * K0100230
                    *     COMMUNICATIONS AREA (FCOM).                 * K0100240
                    *                                                 * K0100250
                    *   * READS THE SOURCE STATEMENTS AND STORES THEM * K0100260
                    *     IN THE STRING AREA.  EACH STATEMENT IS      * K0100270
                    *     PRECEDED WITH A PARTIALLY COMPLETED ID WORD.* K0100280
                    *                                                 * K0100290
                    *   * CHECKS FOR A MAXIMUM OF FIVE CONTINUATION   * K0100300
                    *     RECORDS PER STATEMENT.                      * K0100310
                    *                                                 * K0100320
                    *   * LISTS THE SOURCE PROGRAM IF REQUIRED.       * K0100330
                    *                                                 * K0100340
                    *ENTRY POINTS-                                    * K0100350
                    *   * FZ000-ENTERED BY A CALL FROM THE SUPERVISOR * K0100360
                    *                                                 * K0100370
                    *INPUT-                                           * K0100380
                    *   * INPUT IS VIA CONTROL AND SOURCE STATEMENTS  * K0100390
                    *     ENTERED THROUGH THE PRINCIPAL INPUT DEVICE. * K0100400
                    *                                                 * K0100410
                    *OUTPUT-                                          * K0100420
                    *   * LISTING ON THE PRINCIPAL PRINTER OF ALL     * K0100430
                    *     CONTROL RECORDS, AND OF ALL SOURCE          * K0100440
                    *     STATEMENTS IF SO REQUESTED.                 * K0100450
                    *                                                 * K0100460
                    *   * INFORMATION FOR THE OTHER PHASES DEALING    * K0100470
                    *     WITH THE CURRENT COMPILATION STORED IN FCOM.* K0100480
                    *                                                 * K0100490
                    *   * SOURCE STATEMENTS WITH PARTIALLY COMPLETED  * K0100500
                    *     IDS STORED IN THE STRING AREA.              * K0100510
                    *                                                 * K0100520
                    *EXTERNAL REFERENCES-                             * K0100530
                    *   SUBROUTINES-                                  * K0100540
                    *      * DZ000- DISKZ ENTRY POINT                 * K0100550
                    *      * $DUMP- CALL DUMP ENTRY POINT             * K0100560
                    *                                                 * K0100570
                    *   COMMA/DCOM                                    * K0100580
                    *      * $CH12- NON-ZERO WHEN CHANNEL 12 SENSED   * K0100590
                    *      * $CORE- SIZE OF CORE E.G. 4096 = 4K       * K0100600
                    *      * $CTSW- CONTROL RECORD TRAP SWITCH        * K0100610
                    *      * $IBSY- NON-ZERO WHEN INPUT DEVICE BUSY   * K0100620
                    *      * $LAST- NON-ZERO WHEN LAST CARD SENSED    * K0100630
                    *      * $PBSY- NON-ZERO WHEN PRINTER BUSY        * K0100640
                    *      * $PHSE- NO. OF PHASE NOW IN CORE          * K0100650
                    *      * $KCSW- INHIBIT INPUT/PRINT OVERLAP SW      K0100660
                    *      * $IBT4- ADDRESS OF THE LEVEL 4 IBT        * K0100670
                    *      * $DBSY- NON-ZERO WHEN DISKZ BUSY          * K0100680
                    *      * $ZEND- END OF DISKZ + 1                  * K0100690
                    *                                                 * K0100700
                    *   SECTOR ADDRESSES                              * K0100710
                    *      * $HDNG- SECTOR ADDRESS OF PAGE HEADER     * K0100720
                    *                                                 * K0100730
                    *EXITS-                                           * K0100740
                    *   NORMAL-                                       * K0100750
                    *      * EXIT IS MADE THROUGH THE INTERPHASE      * K0100760
                    *        ROLLER SUBROUTINE WITH A REQUEST TO ENTER* K0100770
                    *        PHASE 2.  THIS EXIT IS MADE AFTER THE END* K0100780
                    *        STATEMENT IS ENCOUNTERED.                * K0100790
                    *   ERROR-                                        * K0100800
                    *      * // CONTROL CARD ENCOUNTERED-             * K0100810
                    *        EXIT IS MADE THROUGH THE INTERPHASE      * K0100820
                    *        ROLLER SUBROUTINE WITH A REQUEST TO ENTER* K0100830
                    *        THE RECOVERY PHASE 27.                   * K0100840
                    *                                                 * K0100850
                    *TABLES/WORK AREAS-                               * K0100860
                    *   * FCOM                                        * K0100870
                    *      ORG  - ORIGIN ADDRESS                      * K0100880
                    *      SOFS - START OF STRING                     * K0100890
                    *      EOFS - END OF STRING                       * K0100900
                    *      SOFST- START OF SYMBOL TABLE               * K0100910
                    *      SOFNS- START OF NON-STATEMENT NUMBERS      * K0100920
                    *      SOFXT- START OF SUBSCRIPTED TEMPORARIES    * K0100930
                    *      SOFGT- START OF GENERATED TEMPORARIES      * K0100940
                    *      EOFST- END OF SYMBOL TABLE                 * K0100950
                    *      COMON- NEXT AVAILABLE COMMON               * K0100960
                    *      CSIZE- SIZE OF COMMON                      * K0100970
                    *      ERROR- OVERLAP ERROR SWITCH                * K0100980
                    *      FNAME- PROGRAM NAME (2 WORDS)              * K0100990
                    *      SORF - SUBROUTINE(-) OR FUNCTION(+)        * K0101000
                    *      CCWD - CONTROL CARD WORD                   * K0101010
                    *         BIT 15 TRANSFER TRACE                   * K0101020
                    *         BIT 14 ARITHMETIC TRACE                 * K0101030
                    *         BIT 13 EXTENDED PRECISION               * K0101040
                    *         BIT 12 LIST SYMBOL TABLE                * K0101050
                    *         BIT 11 LIST SUBPROGRAM NAMES            * K0101060
                    *         BIT 10 LIST SOURCE PROGRAM              * K0101070
                    *         BIT  9 ONE WORD INTEGERS                * K0101080
                    *         BIT  8 ORIGIN                           * K0101090
                    *         BIT  7 NOT USED                         * K0101100
                    *         BIT  6 NOT USED                         * K0101110
                    *         BIT  5 NOT USED                         * K0101120
                    *         BIT  4 NOT USED                         * K0101130
                    *         BIT  3 NOT USED                         * K0101140
                    *         BIT  2 NOT USED                         * K0101150
                    *         BIT  1 NOT USED                         * K0101160
                    *         BIT  0 NOT USED                         * K0101170
                    *      IOCS - IOCS CONTROL CARD WORD              * K0101180
                    *         BIT 15 CARD                             * K0101190
                    *         BIT 14 PAPER TAPE                       * K0101200
                    *         BIT 13 TYPEWRITER                       * K0101210
                    *         BIT 12 1403 PRINTER                     * K0101220
                    *         BIT 11 2501 READER                      * K0101230
                    *         BIT 10 KEYBOARD                         * K0101240
                    *         BIT  9 1442 PUNCH                       * K0101250
                    *         BIT  8 DISK                             * K0101260
                    *         BIT  7 1132 PRINTER                     * K0101270
                    *         BIT  6 NOT USED                         * K0101280
                    *         BIT  5 NOT USED                         * K0101290
                    *         BIT  4 NOT USED                         * K0101300
                    *         BIT  3 PLOTTER                          * K0101310
                    *         BIT  1 UNFORMATTED DISK                 * K0101320
                    *         BIT  0 NOT USED                         * K0101330
                    *         BIT  0 NOT USED                         * K0101340
                    *      DFCNT-  DEFINE FILE COUNT                  * K0101350
                    *                                                 * K0101360
                    *   * PROGRAMMED SWITCHES-                        * K0101370
                    *     THE SWITCHES USED IN PHASE 1 FOLLOW-        * K0101380
                    *     IF NON-ZERO, THE SWITCH IS TRANSFER = T     * K0101390
                    *     IF ZERO, THE SWITCH IS NORMAL = N           * K0101400
                    *      * SWITCH 1- FZ951                          * K0101410
                    *         N= SOURCE CARD NOT YET ENCOUNTERED      * K0101420
                    *         T= SOURCE CARD ENCOUNTERED              * K0101430
                    *      * SWITCH  2- FZ952                         * K0101440
                    *         N= CONTINUATION CARD NOT ALLOWED        * K0101450
                    *         T= CONTINUATION CARD OK                 * K0101460
                    *      * SWITCH  3- FZ953                         * K0101470
                    *         N= NO NORM CALCULATION REQUIRED         * K0101480
                    *         T= STMNT REQUIRES NORM CALCULATION      * K0101490
                    *      * SWITCH  4- FZ954                         * K0101500
                    *         N= NORMAL                               * K0101510
                    *         T= EXCESS CONTINUATION RECORDS          * K0101520
                    *      * SWITCH  5- FZ955                         * K0101530
                    *         N= NORMAL                               * K0101540
                    *         T= STMNT NOT POSSIBLY A FORMAT STMNT    * K0101550
                    *      * SWITCH  6- FZ956                         * K0101560
                    *         N= NORMAL                               * K0101570
                    *         T= FORMAT STMNT, DON'T REMOVE BLANKS    * K0101580
                    *      * SWITCH  7- FZ957                         * K0101590
                    *         N= STORE CHAR IN LEFT OF WORD           * K0101600
                    *         T= STORE CHAR IN RIGHT OF WORD          * K0101610
                    *      * SWITCH  9- FZ959                         * K0101620
                    *         N= NORMAL                               * K0101630
                    *         T= DATA STATEMENT BEING PROCESSED       * K0101640
                    *      * SWITCH 14- FZ95E                         * K0101650
                    *         N= END OF CTRL CARD NOT ANTICIPATED     * K0101660
                    *         T= NORMAL                               * K0101670
                    *                                                 * K0101680
                    *   * STRING AREA                                 * K0101690
                    *      THE STRING AREA DURING COMPILATION CONTAINS* K0101700
                    *      BOTH THE STATEMENT STRING AND THE SYMBOL   * K0101710
                    *      TABLE.  THE STATEMENT STRING IS BUILT BY   * K0101720
                    *      PHASE 1 IN AN ASCENDING CHAIN BEGINNING IN * K0101730
                    *      THE LOW-ADDRESSED WORDS OF THE STRING AREA * K0101740
                    *      *$ZEND).  THE SYMBOL TABLE IS BUILT DURING * K0101750
                    *      THE COMPILATION PROCESS IN THE HIGH-       * K0101760
                    *      ADDRESSED WORDS OF THE STRING AREA (THE    * K0101770
                    *      BEGINNING OF FCOM - 3).  THE ACTUAL START  * K0101780
                    *      AND END ADDRESSES OF THE STRING AREA MAY BE* K0101790
                    *      FOUND IN ENTRYS IN FCOM.                   * K0101800
                    *   * OVERP-                                      * K0101810
                    *      START OF A 329 WORD WORK AREA FOR STORAGE  * K0101820
                    *      OF THE PRINCIPAL PRINT SUBROUTINE.  ALL    * K0101830
                    *      PHASES REQUIRING PRINTED OUTPUT WILL HAVE  * K0101840
                    *      THE PRINT SUBROUTINE IN THIS SAME AREA.    * K0101850
                    *   * HEAD                                        * K0101860
                    *      START OF A 49 WORD AREA CONTAINING THE PAGE* K0101870
                    *      HEADING FOR LISTINGS.                      * K0101880
                    *   * RL000                                       * K0101890
                    *      START OF A 58 WORD AREA CONTAINING THE     * K0101900
                    *      FORTRAN INTERPHASE ROLLER SUBROUTINE.      * K0101910
                    *   * IBT4                                        * K0101920
                    *      START OF A 9 WORD AREA CONTAINING THE      * K0101930
                    *      INTERRUPT BRANCH ADDRESSES FOR LEVEL 4     * K0101940
                    *      INTERRUPTS.                                * K0101950
                    *                                                 * K0101960
                    *   * NOTE                                        * K0101970
                    *      THE AREAS HEAD, RL000, AND IBT4 ARE NOT    * K0101980
                    *      OVERLAYED BY ANY SUBSEQUENT PHASE.         * K0101990
                    *                                                 * K0102000
                    *ATTRIBUTES-                                      * K0102010
                    *   * ERRORS DETECTED BY THIS PHASE - 1,2         * K0102020
                    *                                                 * K0102030
                    *NOTES-N/A                                        * K0102040
                    *************************************************** K0102050
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0102060
                          ABS                                           K0102070
                    *                                                   K0102080
                    *                                                   K0102090
                    *             THE FOLLOWING PROGRAM (FZXXX) IS IN   K0102100
                    *             CORE ONLY UNTIL THE CONTROL CARDS     K0102110
                    *             ARE ANALYZED.                         K0102120
                    *                                                   K0102130
                    *                                                   K0102140
                    *             SYSTEM EQUATES                        K0102150
                    *                                                   K0102160
                    MEMRY EQU     /8000      MODULE CORE SIZE           K0102170
                    *                                                   K0102180
                    $CH12 EQU     /06   CHANNEL12 INDR,NON-ZERO=CHAN12  K0102190
                    $CORE EQU     /0E   SIZE OF CORE, E.G. 4096 = 4K    K0102200
                    $CTSW EQU     /0F   CONTROL RECORD TRAP SWITCH      K0102210
                    $IBSY EQU     /13   NON-ZERO WHEN INPUT DEVICE BUSY K0102220
                    $LAST EQU     /33   NON-ZERO WHEN LAST CARD SENSED  K0102230
                    $PBSY EQU     /36   NON-ZERO WHEN PRINTER BUSY      K0102240
                    *                   *NEGATIVE WHEN BUFFER FREE.     K0102250
                    $PHSE EQU     /78   NO. OF PHASE NOW IN CORE        K0102260
                    $KCSW EQU     /7C   INHIBIT INPUT/PRINT OVERLAP SW  K0102270
                    $DUMP EQU     /3F   CALL DUMP ENTRY POINT           K0102280
                    $IBT4 EQU     /D4   ADDRESS OF THE IBT              K0102290
                    $DBSY EQU     /EE   NON-ZERO WHEN DISKZ BISU        K0102300
                    DZ000 EQU     /F2   DISKZ ENTRY POINT               K0102310
                    $ZEND EQU     /1E0  END OF DISKZ +1                 K0102320
                    *                                                   K0102330
                    *                                                   K0102340
                    #HDNG EQU     7          SECTOR ADDR PAGE HEADER    K0102350
                    *                                                   K0102360
                    *             PHASE 1 EQUATES                       K0102370
                    *                                                   K0102380
                    PHID  EQU     31    PHASE ID                        K0102390
                    *                                                   K0102400
                    I4900 EQU     MEMRY-10   ILS4 BRANCH TABLE          K0102410
                    RL000 EQU     MEMRY-68   ENTRY INTERPHASE ROLL SUBR K0102420
                    HEAD  EQU     RL000-49   PAGE HEADER STORAGE AREA   K0102430
                    OVERP EQU     HEAD-327-2 SYSTEM PRINT SUBR AREA     K0102440
                    OVERZ EQU     MEMRY-2548 PHASE 1 ORIGIN         2-6 K0102450
                    OVERL EQU     MEMRY-1501 FCOM ORIGIN            2-4 K0102460
                    ADSTF EQU     137        DELTA FOR ADD NEEDS    2-4 K0102470
                    OVERX EQU     OVERL-ADSTF ADDITIONAL PHASE 1 NEEDS  K0102480
                    *                                                   K0102490
                    *                                                   K0102500
                          HDNG    1130 DISK MON SYS VER 2 FORT PHASE 1  K0102510
                    *                                                   K0102520
                          ORG     OVERZ      PHASE 1 ORIGIN             K0102530
                    *                                                   K0102540
                          DC      0          WORK AREA FOR LOADER       K0102550
                          DC      -31        -ID COMPILER PHASE 1       K0102560
                          DC      FZZ90-*+1  REL ADR SLET ENTRY STORAGE K0102570
                          DC      8          COUNT OF SLET ENTRIES  2-6 K0102580
                          ORG     *-2                                   K0102590
                    *                                                   K0102600
                    FZ000 EQU     *                                     K0102610
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0102620
                    *                                                   K0102630
                    *             PHASE 1 INITIALIZATION                K0102640
                    *                                                   K0102650
                    *                                                   K0102660
                    *                                                   K0102670
                          LDX   3 PHID       LOAD PHASE ID              K0102680
                          STX  L3 $PHSE      STORE INTO PHASE LOG       K0102690
                    *                                                   K0102700
                    *                                                   K0102710
                    *                                                   K0102720
                    *             READ PAGE HEADER                      K0102730
                    *                                                   K0102740
                    FZZ10 LD   L  FZ900      LOAD SECTOR ADR FOR HEADER K0102750
                          STO  L  HEAD       STORE IN HEADER AREA       K0102760
                          LDD     FZ901      LOAD DISK READ PARAMETERS  K0102770
                          BSI  L  DZ000      READ IN PAGE HEADER        K0102780
                          MDX  L  $DBSY                                 K0102790
                          MDX     *-3        LOOP ON DISK BUSY          K0102800
                    *                                                   K0102810
                    *                                                   K0102820
                          LD   L  HEAD-1     MOVE WORD COUNT TO PROPER  K0102830
                          STO  L  HEAD       LOCATION FOR PRINT         K0102840
                    *                                                   K0102850
                    *             FETCH PRINT ROUTINE AND STORE, ALSO   K0102860
                    *             SAVE WORD COUNT AND SECTOR ADDRESS    K0102870
                    *             FOR PHASE 19.                         K0102880
                    *                                                   K0102890
                    *                                                   K0102900
                          LDD     FZZ93+2    LD DISK ADDR OF PRINT SUBR K0102910
                          STD  L  F1803-2         STORE IN PRINT RTN AR K0102920
                          LDD     FZ902           SET UP TO LD PRINT RT K0102930
                          BSI  L  DZ000           LOAD PRINT RT         K0102940
                    *                                                   K0102950
                    *             FETCH INPUT ROUTINE AND INPUT         K0102960
                    *             CONVERSION ROUTINE AND STORE.         K0102970
                    *                                                   K0102980
                    *             TEST IF INPUT FROM CARD               K0102990
                    *                                                   K0103000
                          LD   L  $KCSW      TEST IF KEYBOARD INPUT 2-6 K0103010
                          BSC  L  FZZ20,Z    BRANCH IF YES          2-6 K0103020
                    *                                                   K0103030
                          LD      FZZ98+3    TEST IF                2-6 K0103040
                          S       FZZ94+3    *PAPER TAPE INPUT      2-6 K0103050
                          BSC  L  FZZ25,+-   BRANCH IF YES          2-6 K0103060
                    *                                                   K0103070
                    *             LOAD CARD INPUT ROUTINE               K0103080
                    *                                                   K0103090
                          LDD     FZZ94+2    LOAD INPUT ROUTINE ADDR2-6 K0103100
                          STD  L  F1801-2    STORE IN AREA          2-6 K0103110
                          LDD     FZ903      LOAD PARAMETERS        2-6 K0103120
                          BSI  L  DZ000      READ IN ROUTINE        2-6 K0103130
                          MDX     FZZ35      CONTINUE               2-6 K0103140
                    *                                                   K0103150
                    *             SET UP FOR KEYBOARD INPUT             K0103160
                    *                                                   K0103170
                    FZZ20 LDX  L1 F179K     KYBRD TBL MODIFIERS     2-8 K0103180
                          STX  L1 F179A+1   INILZ INST FOR DATA MVE 2-8 K0103190
                          LDD     FZZ97+2   SET KEYBOARD CONVERT AS 2-8 K0103200
                          STD     FZZ95+2    *INPUT CONVERSION SUBR     K0103210
                          LDD     FZZ96+2    LOAD DISK ADDR KB I/P SUBR K0103220
                          MDX     FZZ30      CONTINUE                   K0103230
                    *                                                   K0103240
                    *                                                   K0103250
                    FZZ25 LDD     FZZ94+2    LD DISK ADDR OF INPUT SUBR K0103260
                    FZZ30 STD  L  F1801-2    STORE IN INPUT ROUTINE AR  K0103270
                    *                                                   K0103280
                    *             WORD COUNT OF INPUT RTN IN A REGISTER K0103290
                    *                                                   K0103300
                          A       FZ907      GET LOAD LOCATION FOR      K0103310
                          A       FZ903+1    CONVERSION ROUTINE         K0103320
                    *                                                   K0103330
                          BSC     E          TEST FOR EVEN LOCN         K0103340
                          A       FZ900+1    MAKE LOC EVEN              K0103350
                          STO     FZ904+1    SET INTO LOAD PARAMETER    K0103360
                          A       FZ907      GET ENTRY POINT TO CNVRT   K0103370
                          A       FZ900+1    INCR ENTRY POINT BY ONE    K0103380
                          STO  L  F1802      STORE AS INDIRECT ADDRESS  K0103390
                    *                                                   K0103400
                          LDD     FZ903      LOAD INPUT RTN LOAD PARAM  K0103410
                          BSI  L  DZ000      LOAD INPUT ROUTINE         K0103420
                    *                                                   K0103430
                    *                                                   K0103440
                          LDD     FZZ95+2    LD DISK ADDR CONVERT SUBR  K0103450
                          STD  I  FZ904+1    STORE IN CNVRT RTN AREA    K0103460
                          LDD     FZ904      LOAD CNVRT RTN LOAD PARAM  K0103470
                          BSI  L  DZ000      LOAD CNVRT ROUTINE         K0103480
                          B    L  F1799     GO INITLZ CONV TBLS     2-8 K0103490
                    *                                                   K0103500
                    FZZ35 LD      FZZ91+1    SAVE PHASE 2 CORE ADDRESS, K0103510
                          STO  L  F1038      WORD COUNT, AND SECTOR     K0103520
                          LDD     FZZ91+2    ADDRESS FOR LINKAGE TO     K0103530
                          STD  L  F1039      ROLLER ROUTINE.            K0103540
                    *                                                   K0103550
                          LD      FZZ92+1    SAVE PHASE 27 CORE ADDR,   K0103560
                          STO  L  F1568      WORD COUNT, AND SECTOR     K0103570
                          LDD     FZZ92+2    ADDRESS FOR LINKAGE TO     K0103580
                          STD  L  F1569      ROLLER ROUTINE.            K0103590
                    *                                                   K0103600
                    *                                                   K0103610
                    *                                                   K0103620
                    *                                                   K0103630
                    *                                                   K0103640
                    *             SET UP INTERRUPT BRANCH LOCATIONS     K0103650
                    *             FOR SYSTEM I/O ROUTINES.              K0103660
                    *                                                   K0103670
                    *                                                   K0103680
                    *                                                   K0103690
                          LDX  L3 I4900-1    INITIALIZE ILS4 BRANCH     K0103700
                          STX  L3 $IBT4      TABLE ADDRESS.             K0103710
                    *                                                   K0103720
                          LDX  L3 F1803+4    PRINT RTN INTERRUPT ENTRY  K0103730
                          STX  L3 9          1132 INT                   K0103740
                    *                                                   K0103750
                          LDX  L3 F1801+7    1403 COLUMN INTERRUPT ENTR K0103760
                          STX  L3 8          1403 COLUMN INT            K0103770
                    *                                                   K0103780
                    *                                                   K0103790
                    *                                                   K0103800
                          MDX  L  $DBSY,0    SKIP IF DISK NOT BUSY      K0103810
                          MDX     *-3        LOOP IF DISK BUSY          K0103820
                    *                                                   K0103830
                    *                                                   K0103840
                          MDX     FZZ50      CONTINUE                   K0103850
                    *                                                   K0103860
                    *                                                   K0103870
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0103880
                    *                                                   K0103890
                          BSS  E  0                                     K0103900
                    *                                                   K0103910
                    *             STORAGE FOR SLET ENTRIES              K0103920
                    *                                                   K0103930
                    FZZ90 EQU     *                                     K0103940
                    *                                                   K0103950
                    *                                                   K0103960
                    FZZ91 DC      32         ID PHASE 2                 K0103970
                          DC      *-*        CORE ADDRESS               K0103980
                          DC      *-*        WORD COUNT                 K0103990
                          DC      *-*        SECTOR ADDRESS             K0104000
                    *                                                   K0104010
                    FZZ92 DC      57         ID PHASE 27 (RECOVERY)     K0104020
                          DC      *-*        CORE ADDRESS               K0104030
                          DC      *-*        WORD COUNT                 K0104040
                          DC      *-*        SECTOR ADDRESS             K0104050
                    *                                                   K0104060
                    FZZ98 DC      145        ID P/T INPUT ROUTINE   2-6 K0104070
                          DC      *-*        NOT USED               2-6 K0104080
                          DC      *-*        WORD COUNT             2-6 K0104090
                          DC      *-*        SECTOR ADDRESS         2-6 K0104100
                    *                                                   K0104110
                    FZZ96 DC      146        ID KB INPUT SUBROUTINE     K0104120
                          DC      *-*        NOT USED                   K0104130
                          DC      *-*        WORD COUNT                 K0104140
                          DC      *-*        SECTOR ADDRESS             K0104150
                    *                                                   K0104160
                    FZZ97 DC      149        ID KB INPUT CONVERT SUBR   K0104170
                          DC      *-*        NOT USED                   K0104180
                          DC      *-*        WORD COUNT                 K0104190
                          DC      *-*        SECTOR ADDRESS             K0104200
                    *                                                   K0104210
                    FZZ93 DC      153        ID PRINCIPAL PRINT SUBR    K0104220
                          DC      *-*        NOT USED                   K0104230
                          DC      *-*        WORD COUNT                 K0104240
                          DC      *-*        SECTOR ADDRESS             K0104250
                    *                                                   K0104260
                    FZZ94 DC      154        ID PRINCIPAL INPUT SUBR    K0104270
                          DC      *-*        NOT USED                   K0104280
                          DC      *-*        WORD COUNT                 K0104290
                          DC      *-*        SECTOR ADDRESS             K0104300
                    *                                                   K0104310
                    FZZ95 DC      156        ID INPUT CONVERSION SUBR   K0104320
                          DC      *-*        NOT USED                   K0104330
                          DC      *-*        WORD COUNT                 K0104340
                          DC      *-*        SECTOR ADDRESS             K0104350
                    *                                                   K0104360
                    *                                                   K0104370
                          BSS  E  0                                     K0104380
                    FZ901 DC      /7000      DISK CONTROL FOR READING   K0104390
                          DC      HEAD-1     PAGE HEADER RECORD         K0104400
                    *                                                   K0104410
                    FZ902 DC      /7000      PARAMETER FOR LOADING      K0104420
                          DC      F1803-2    PRINT ROUTINE.             K0104430
                    *                                                   K0104440
                    FZ903 DC      /7000      PARAMETER FOR LOADING      K0104450
                          DC      F1801-2    INPUT ROUTINE.             K0104460
                    *                                                   K0104470
                    FZ904 DC      /7000      PARAMETER FOR LOADING      K0104480
                          DC      *-*        INPUT CONVERSION ROUTINE.  K0104490
                    *                                                   K0104500
                    FZ907 DC      2          USEFUL CONSTANT            K0104510
                    FZ90B DC      /4040      2 EBC BLANKS               K0104520
                    FZ900 DC      #HDNG      SECTOR ADDRESS PAGE HEADER K0104530
                          DC      1          USEFUL CONSTANT            K0104540
                    *                                                   K0104550
                    *                                                   K0104560
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0104570
                    *                                                   K0104580
                    FZZ50 LDX  I3 $CORE      XR3 = ACTUAL CORE SIZE     K0104590
                          MDX  L3 OVERL-MEMRY-3  SET SYM TBL END    2-4 K0104600
                    *                                                   K0104610
                          NOP                PREVIOUS INST SKIPS IF 32K K0104620
                    *                                                   K0104630
                          STX  L3 FX003 INIT START OF SYMBOL TABLE      K0104640
                          STX  L3 FX004      START OF NON-STATEMENT NOS K0104650
                          STX  L3 FX005      START OF SUBSCRIPT TEMPS   K0104660
                    *                                                   K0104670
                          STX  L3 FX006      START OF GENERATED TEMPS   K0104680
                    *                                                   K0104690
                    *                                                   K0104700
                    *             MODIFY END OF SYMBOL TABLE ADDRESS    K0104710
                    *             FOR ADDITIONAL PHASE 1 NEEDS.         K0104720
                    *                                                   K0104730
                          MDX  L3 -ADSTF                                K0104740
                    *                                                   K0104750
                    *                                                   K0104760
                          STX  L3 FX007      END OF SYMBOL TABLE        K0104770
                    *                                                   K0104780
                          LDX  L3 /7FFF      SET ADDRESS OF             K0104790
                          STX  L3 FX008      NEXT AVAILABLE COMMON      K0104800
                    *                                                   K0104810
                          SLA     16         SET THE FOLLOWING TO ZERO- K0104820
                          STO  L  FX000      ORIGIN ADDRESS         2-4 K0104830
                          STO  L  FX009      SIZE OF COMMON             K0104840
                          STO  L  FX010      OVERLAP ERROR SWITCH       K0104850
                          STO  L  FX012      SUBROUTINE OR FUNCTION SW  K0104860
                          STO  L  FX014      IOCS CONTROL CARD WORD     K0104870
                          STO  L  FX013      CONTROL CARD SWITCH WORD   K0104880
                          STO  L  FX011      PROGRAM NAME               K0104890
                          STO  L  FX011+1                               K0104900
                          STO  L  FX015      FILE COUNT                 K0104910
                    *                                                   K0104920
                    *             INITIALIZE PHASE 1                    K0104930
                    *                                                   K0104940
                          STO  L  F1951      NORMALIZE SWITCH 1         K0104950
                          LDX  L3 $ZEND      SET UP FOR STRING AREA     K0104960
                          STX  L3 FX001      START OF STRING ADDRESS    K0104970
                          LDX  I1 FX001      START OF STRING ADDR IN X1 K0104980
                    *                                                   K0104990
                    *             INITIALIZE HEADER AREA                K0105000
                    *                                                   K0105010
                    *                                                   K0105020
                          LDX   3 -35                                   K0105030
                          LD      FZ90B      A REGISTER = /4040         K0105040
                    FZ001 STO  L3 HEAD+48    ZERO HEADER WORD           K0105050
                          MDX   3 1          SKIP IF ALL 40 WORDS ZERO  K0105060
                          MDX     *-4        GO TO ZERO NEXT WORD       K0105070
                    *                                                   K0105080
                          BSC  L  F1000      GO START INPUT OF RECORDS  K0105090
                    *                                                   K0105100
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0105110
                    *                                                   K0105120
                    *             CONSTANTS AND SWITCHES                K0105130
                    *                                                   K0105140
                    FZ95E DC      0          SWITCH 14                  K0105150
                    *                                                   K0105160
                    FZ911 DC      .T         T TEST CONSTANT            K0105170
                    FZ912 DC      .A-.T      A TEST                     K0105180
                    FZ913 DC      .L-.A      L TEST                     K0105190
                    FZ914 DC      .E-.L      E TEST                     K0105200
                    FZ915 DC      .I-.E      I TEST                     K0105210
                    FZ916 DC      .O-.I      O TEST                     K0105220
                    FZ918 DC      .*-.O      * TEST                     K0105230
                    FZ922 DC      .N-.*      N TEST                     K0105240
                    FZ919 DC      .-         - FOR CONTROL CARD ERROR   K0105250
                    *                                                   K0105260
                    *                                                   K0105270
                    FZ920 DC      0          LENGTH FOR CTL CARD COMPAR K0105280
                    FZ921 DC      *          PAGE RESTORE  SWITCH       K0105290
                    *                                                   K0105300
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0105310
                    FZ003 EQU     *                                     K0105320
                    *                                                   K0105330
                    FZ004 SLA     16                                    K0105340
                          STO     FZ95E      NORMALIZE SWITCH 14        K0105350
                    *                                                   K0105360
                          BSI  L  FZ600      GET FIRST NON-BLANK CHAR   K0105370
                    *                                                   K0105380
                          S       FZ911      IS THE CHARACTER T         K0105390
                          BSC  L  FZ008,+-   BRANCH IF YES              K0105400
                    *                                                   K0105410
                          S       FZ912      IS THE CHARACTER A         K0105420
                          BSC  L  FZ012,+-   BRANCH IF YES              K0105430
                    *                                                   K0105440
                          S       FZ913      IS THE CHARACTER L         K0105450
                          BSC  L  FZ014,+-   BRANCH IF YES              K0105460
                    *                                                   K0105470
                          S       FZ914      IS THE CHARACTER E         K0105480
                          BSC  L  FZ022,+-   BRANCH IF YES              K0105490
                    *                                                   K0105500
                          S       FZ915      IS THE CHARACTER I         K0105510
                          BSC  L  FZ024,+-   BRANCH IF YES              K0105520
                    *                                                   K0105530
                          S       FZ916      IS THE CHARACTER O         K0105540
                          BSC  L  FZ070,+-   BRANCH IF YES          2-4 K0105550
                    *                                                   K0105560
                          S       FZ918      IS THE CHARACTER *         K0105570
                          BSC  L  FZ090,+-   BRANCH IF YES              K0105580
                    *                                                   K0105590
                          S       FZ922      IS CHARACTER N             K0105600
                          BSC  L  FZ100,+-   BRANCH IF YES              K0105610
                    *                                                   K0105620
                    *                                                   K0105630
                    *             BAD CONTROL CARD ENTRY                K0105640
                    *                                                   K0105650
                    FZ005 LD      FZ919      LOAD - ERROR INDICATOR     K0105660
                          STO  I  F1003+1    PLACE MINUS INTO CC RECORD K0105670
                    *                        PRINT CARD IN ERROR AND    K0105680
                          BSC  L  F1003      GET ANOTHER.               K0105690
                    *                                                   K0105700
                    *                                                   K0105710
                    *                                                   K0105720
                    FZ008 LDX   3 12         SET CHARACTER COUNT        K0105730
                          STX   3 FZ920      TO 12                      K0105740
                          LDX  L3 FZ971      'RANSFERTRACE'             K0105750
                    *                                                   K0105760
                    *                                                   K0105770
                    FZ010 BSC  L  FZ056      GO CHECK IF VALID CONTROL  K0105780
                    *                                                   K0105790
                    *                                                   K0105800
                    FZ012 LDX   3 14         SET CHARACTER              K0105810
                          STX   3 FZ920      COUNT TO 14                K0105820
                          LDX  L3 FZ972      'RITHMETICTRACE'           K0105830
                          MDX     FZ010      GO CHECK                   K0105840
                    *                                                   K0105850
                    *                                                   K0105860
                    FZ014 LDX   3 3          SET CHARACTER              K0105870
                          STX   3 FZ920      COUNT TO 3                 K0105880
                          LDX  L3 FZ981      'IST'                      K0105890
                          BSI  L  FZ060      GO CHECK, RETURN IF EQUAL  K0105900
                    *                                                   K0105910
                          BSI  L  FZ600      GET NEXT NON-BLANK CHAR    K0105920
                    *                                                   K0105930
                          S       FZ923      IS CHARACTER S             K0105940
                          BSC  L  FZ020,Z    BRANCH IF NO               K0105950
                    *                                                   K0105960
                          BSI  L  FZ600      GET NEXT NON-BLANK CHAR    K0105970
                    *                                                   K0105980
                          S       FZ924      IS CHARACTER Y             K0105990
                          BSC  L  FZ016,Z    BRANCH IF NO               K0106000
                    *                                                   K0106010
                          LDX   3 9          SET CHARACTER              K0106020
                          STX   3 FZ920      COUNT TO 9                 K0106030
                          LDX  L3 FZ982      'MBOLTABLE'                K0106040
                          MDX     FZ010      GO CHECK                   K0106050
                    *                                                   K0106060
                    FZ016 S       FZ925      IS CHARACTER O             K0106070
                          BSC  L  FZ018,Z    BRANCH IF NO               K0106080
                    *                                                   K0106090
                          LDX   3 11         SET CHARACTER              K0106100
                          STX   3 FZ920      COUNT TO 11                K0106110
                          LDX  L3 FZ983      'URCEPROGRAM'              K0106120
                          MDX     FZ010      GO CHECK                   K0106130
                    *                                                   K0106140
                    FZ018 S       FZ926                                 K0106150
                          BSC  L  FZ005,Z    BRANCH TO ERROR IF NO.     K0106160
                    *                                                   K0106170
                          LDX   3 13         SET CHARACTER              K0106180
                          STX   3 FZ920      COUNT TO 13                K0106190
                          LDX  L3 FZ984      'BPROGRAMNAMES'            K0106200
                          MDX     FZ010      GO CHECK                   K0106210
                    *                                                   K0106220
                    FZ020 S       FZ927      IS CHARACTER A             K0106230
                          BSC  L  FZ005,Z    BRANCH TO ERROR IF NO      K0106240
                    *                                                   K0106250
                          LDX   3 2          SET CHARACTER              K0106260
                          STX   3 FZ920      COUNT TO 2                 K0106270
                          LDX  L3 FZ985      'LL'                       K0106280
                          MDX     FZ010      GO CHECK                   K0106290
                    *                                                   K0106300
                    FZ022 LDX   3 16         SET CHARACTER              K0106310
                          STX   3 FZ920      COUNT TO 16                K0106320
                          LDX  L3 FZ974      'XTENDEDPRECISION'         K0106330
                          MDX     FZ010      GO CHECK                   K0106340
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0106350
                    *                                                   K0106360
                    *             CONSTANTS                             K0106370
                    *                                                   K0106380
                    FZ923 DC      .S         S TEST                     K0106390
                    FZ924 DC      .Y         Y TEST                     K0106400
                    FZ925 DC      .O-.Y      O TEST                     K0106410
                    FZ926 DC      .U-.O      U TEST                     K0106420
                    FZ927 DC      .A-.S      A TEST                     K0106430
                    FZ928 DC      /006C      LEFT PAREN TEST            K0106440
                    FZ929 DC      /4D-/6C    360 LEFT PAREN TEST        K0106450
                    FZ930 DC      0          TEMPORARY I/O DEVICE SW    K0106460
                    FZ931 DC      .C         C TEST                     K0106470
                    FZ932 DC      .P-.C      P TEST                     K0106480
                    FZ933 DC      .T-.P      T TEST                     K0106490
                    FZ934 DC      .K-.T      K TEST                     K0106500
                    FZ935 DC      .1-.K      1 TEST                     K0106510
                    FZ936 DC      .D-.1      D TEST                     K0106520
                    FZ93U DC      .U-.D      U TEST                     K0106530
                    FZ937 DC      .2-.U      2 TEST                     K0106540
                    FZ938 DC      /006B      COMMA TEST                 K0106550
                    FZ939 DC      /4C-/6B    RIGHT PAREN TEST           K0106560
                    FZ940 DC      /5D-/4C    360 RIGHT PAREN TEST       K0106570
                    FZ941 DC      .L         L TEST                     K0106580
                    FZ942 DC      .A-.L      A TEST                     K0106590
                    *                                                   K0106600
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0106610
                    *                                                   K0106620
                    FZ024 LDX   3 3          SET CHARACTER              K0106630
                          STX  L3 FZ920      COUNT TO 3                 K0106640
                          LDX  L3 FZ973      'OCS'                      K0106650
                          BSI  L  FZ060      GO CHECK, RETURN IF VALID  K0106660
                    *                                                   K0106670
                    FZ026 BSI  L  FZ600      GET NEXT NON-BLANK CHAR    K0106680
                    *                                                   K0106690
                          S       FZ928      IS CHARACTER LFT PAREN     K0106700
                          BSC  L  *+3,+-     BRANCH IF YES              K0106710
                          S       FZ929      IS CHARACTER 360 LFT PAREN K0106720
                          BSC  L  FZ005,Z    BRANCH TO ERROR IF NOT YES K0106730
                    *                                                   K0106740
                          SLA     16                                    K0106750
                          STO  L  FZ95E      ZERO SWITCH 14             K0106760
                          STO     FZ930      CLEAR TEMP I/O DEVICE SW   K0106770
                    *                                                   K0106780
                    FZ028 BSI  L  FZ600      GET NEXT NON-BLANK CHAR    K0106790
                    *                                                   K0106800
                          S       FZ931      IS CHARACTER C             K0106810
                          BSC  L  FZ036,+-   BRANCH IF YES              K0106820
                    *                                                   K0106830
                          S       FZ932      IS CHARACTER P             K0106840
                          BSC  L  FZ038,+-   BRANCH IF YES              K0106850
                    *                                                   K0106860
                          S       FZ933      IS CHARACTER T             K0106870
                          BSC  L  FZ040,+-   BRANCH IF YES              K0106880
                    *                                                   K0106890
                          S       FZ934      IS CHARACTER K             K0106900
                          BSC  L  FZ042,+-   BRANCH IF YES              K0106910
                    *                                                   K0106920
                          S       FZ935      IS CHARACTER 1             K0106930
                          BSC  L  FZ044,+-   BRANCH IF YES              K0106940
                    *                                                   K0106950
                          S       FZ936      IS CHARACTER D             K0106960
                          BSC  L  FZ046,+-   BRANCH IF YES              K0106970
                    *                                                   K0106980
                          S       FZ93U      IS CHARACTER U             K0106990
                          BSC  L  FZ054,+-   BRANCH IF YES              K0107000
                    *                                                   K0107010
                          S       FZ937      IS CHARACTER 2             K0107020
                          BSC  L  FZ005,Z    BRANCH TO ERROR IF NO      K0107030
                    *                                                   K0107040
                          LDX   3 9          SET CHARACTER              K0107050
                          STX  L3 FZ920      COUNT TO 9                 K0107060
                          LDX  L3 FZ97F      '501READER'                K0107070
                    *                                                   K0107080
                    FZ032 BSI  L  FZ060      GO CHECK, RETURN IF VALID  K0107090
                    *                                                   K0107100
                    FZ034 LD      FZ930      INDICATE REQUESTED         K0107110
                          OR    3 0          *I/O DEVICE                K0107120
                          STO     FZ930                                 K0107130
                    *                                                   K0107140
                          BSI  L  FZ600      GET NEXT NON-BLANK CHAR    K0107150
                    *                                                   K0107160
                          S       FZ938      IS CHARACTER COMMA         K0107170
                          BSC  L  FZ028,+-   IF YES, CHECK NEXT DEVICE  K0107180
                    *                                                   K0107190
                          S       FZ939      IS CHARACTER RIGHT PAREN   K0107200
                          BSC  L  *+3,+-     BRANCH IF YES              K0107210
                    *                                                   K0107220
                          S       FZ940      IS CHAR 360 RIGHT PAREN    K0107230
                          BSC  L  FZ005,Z    BRANCH TO ERROR IF NO      K0107240
                    *                                                   K0107250
                          LD   L  FX014      LOAD IOCS WORD             K0107260
                          OR      FZ930      ADD DEVICES FROM THIS CARD K0107270
                          STO     FZ930      STORE TEMPORARILY          K0107280
                    *                                                   K0107290
                    *             CHECK FOR BOTH 1442 PUNCH AND CARD.   K0107300
                    *             ERROR IF BOTH ARE INDICATED.          K0107310
                    *                                                   K0107320
                          SLA     6          SHIFT CARD TO 1442 BIT     K0107330
                          AND     FZ930      AND CARD TO 1442 PUNCH BIT K0107340
                          SLA     9          SHIFT TO SIGN LOCATION     K0107350
                          BSC  L  FZ005,+Z   BRANCH TO ERROR IF BOTH ON K0107360
                    *                                                   K0107370
                          LD      FZ930      LOAD NEW IOCS WORD VALUE   K0107380
                          STO  L  FX014      STORE INTO IOCS WORD       K0107390
                    *                                                   K0107400
                          BSC  L  F1003      PRINT CARD AND GET ANOTHER K0107410
                    *                                                   K0107420
                    FZ036 LDX   3 3          SET CHARACTER              K0107430
                          STX  L3 FZ920      COUNT TO 3                 K0107440
                          LDX  L3 FZ976      'ARD'                      K0107450
                          MDX     FZ032      GO CHECK                   K0107460
                    *                                                   K0107470
                    *             PAPER TAPE OR PLOTTER                 K0107480
                    *                                                   K0107490
                    FZ038 BSI  L  FZ600      GET NEXT NON-BLANK CHAR    K0107500
                    *                                                   K0107510
                          S       FZ941      IS CHARACTER L             K0107520
                          BSC  L  FZ048,+-   BRANCH IF YES              K0107530
                    *                                                   K0107540
                          S       FZ942      IS CHARACTER A             K0107550
                          BSC  L  FZ005,Z    BRANCH TO ERROR IF NO      K0107560
                    *                                                   K0107570
                          LDX   3 7          SET CHARACTER              K0107580
                          STX  L3 FZ920      COUNT TO 7                 K0107590
                          LDX  L3 FZ978      'PERTAPE'                  K0107600
                          MDX     FZ032      GO CHECK                   K0107610
                    *                                                   K0107620
                    FZ040 LDX   3 9          SET CHARACTER              K0107630
                          STX  L3 FZ920      COUNT TO 9                 K0107640
                          LDX  L3 FZ979      'YPEWRITER'                K0107650
                          MDX     FZ032      GO CHECK                   K0107660
                    *                                                   K0107670
                    FZ042 LDX   3 7          SET CHARACTER              K0107680
                          STX  L3 FZ920      COUNT TO 7                 K0107690
                          LDX  L3 FZ97A      'EYBOARD'                  K0107700
                          MDX     FZ032      GO CHECK                   K0107710
                    *                                                   K0107720
                    FZ044 BSI  L  FZ600      GET NEXT NON-BLANK CHAR    K0107730
                    *                                                   K0107740
                          S       FZ943      IS CHARACTER 4             K0107750
                          BSC  L  FZ050,Z    BRANCH IF NO               K0107760
                    *                                                   K0107770
                          BSI  L  FZ600      GET NEXT NON-BLANK CHAR    K0107780
                          S       FZ943      IS CHARACTER 4             K0107790
                          BSC  L  FZ051,Z    BRANCH IF NO               K0107800
                    *                                                   K0107810
                    *                                                   K0107820
                          LDX   3 6          SET CHARACTER              K0107830
                          STX  L3 FZ920      COUNT TO 6                 K0107840
                          LDX  L3 FZ977      '2PUNCH'                   K0107850
                          MDX     FZ032      GO CHECK                   K0107860
                    *                                                   K0107870
                    *             A REGISTER = D                        K0107880
                    *                                                   K0107890
                    FZ046 LDX   3 3          SET CHARACTER              K0107900
                          STX  L3 FZ920      COUNT TO 3                 K0107910
                          LDX  L3 FZ97C      'ISK'                      K0107920
                          MDX     FZ032      GO CHECK                   K0107930
                    *                                                   K0107940
                    FZ048 LDX   3 5          SET CHARACTER              K0107950
                          STX  L3 FZ920      COUNT TO 5                 K0107960
                          LDX  L3 FZ97D      'OTTER'                    K0107970
                          MDX     FZ032      GO CHECK                   K0107980
                    *                                                   K0107990
                    FZ050 S       FZ944      IS CHARACTER 1             K0108000
                          BSC  L  FZ005,Z    BRANCH TO ERROR IF NO      K0108010
                    *                                                   K0108020
                          LDX   3 9          SET CHARACTER              K0108030
                          STX  L3 FZ920      COUNT = 9                  K0108040
                          LDX  L3 FZ97B      '32PRINTER'                K0108050
                          MDX     FZ032      GO CHECK                   K0108060
                    *                                                   K0108070
                    FZ051 S       FZ948      TEST FOR 0                 K0108080
                          BSC  L  FZ005,Z    BRANCH TO ERROR IF NOT     K0108090
                          LDX   3 8          SET CHARACTER              K0108100
                          STX  L3 FZ920      COUNT=8                    K0108110
                          LDX  L3 FZ97E      '3PRINTER'                 K0108120
                          MDX     FZ032                                 K0108130
                    *                                                   K0108140
                    FZ052 LDX   3 13         SET CHARACTER          2-4 K0108150
                          STX  L3 FZ920      COUNT TO 13            2-4 K0108160
                          LDX  L3 FZ986      'EWORDINTEGERS'        2-4 K0108170
                          MDX     FZ056      GO CHECK                   K0108180
                    *                                                   K0108190
                    FZ054 LDX   3 4          SET CHARACTER              K0108200
                          STX  L3 FZ920      *COUNT TO 4                K0108210
                          LDX  L3 FZ988      'DISK'                     K0108220
                          MDX     FZ032      GO CHECK                   K0108230
                    *                                                   K0108240
                    *                                                   K0108250
                    FZ056 BSI     FZ060      GO CHECK, RETURN IF EQUAL  K0108260
                    *                                                   K0108270
                          MDX  L  FZ95E,1    TAG SWITCH 14              K0108280
                          BSI     FZ600      GET NEXT NON-BLANK CHAR    K0108290
                    *                                                   K0108300
                    FZ058 BSC  L  FZ005      BRANCH TO ERROR IF RETURN  K0108310
                    *                                                   K0108320
                    *             COMPARE CHARACTERS FOR EQUAL -        K0108330
                    *             RETURN IF ALL CHARACTERS EQUAL,       K0108340
                    *             GO TO ERROR IF NOT                    K0108350
                    *                                                   K0108360
                    FZ060 DC      0          BSI ADDRESS                K0108370
                    *                                                   K0108380
                          BSI     FZ600      GET NEXT NON-BLANK CHAR    K0108390
                    *                                                   K0108400
                          S     3 0          IS CHARACTER CORRECT       K0108410
                          BSC  L  FZ005,Z    BRANCH IF NOT              K0108420
                    *                                                   K0108430
                          MDX   3 1          INCREMENT FOR NEXT COMPARE K0108440
                    *                                                   K0108450
                          MDX  L  FZ920,-1   DECREMENT CHARACTER COUNT  K0108460
                    *                                                   K0108470
                          MDX     FZ060+1    CHECK NEXT CHARACTER       K0108480
                    *                                                   K0108490
                          BSC  I  FZ060      RETURN, COMPARE COMPLETE   K0108500
                    *                                                   K0108510
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0108520
                    *                                                   K0108530
                    *             CONSTANTS                             K0108540
                    FZ943 DC      .4         4 TEST                     K0108550
                    FZ944 DC      .1-.4      1 TEST                     K0108560
                    FZ945 DC      71         TEST FOR LAST COLUMN       K0108570
                    FZ946 DC      0          WORK WORD                  K0108580
                    FZ947 DC      /0040      EBC BLANK                  K0108590
                    FZ948 DC      .0-.4      0 TEST                     K0108600
                    FZ949 DC      .N         N TEST                 2-4 K0108610
                    FZ950 DC      ./         SLASH TEST             2-4 K0108620
                    FZ951 DC      /F0        MASK FOR NUMERIC       2-4 K0108630
                    FZ952 DC      10         CONSTANT 10            2-4 K0108640
                    FZ953 DC      .A         A TEST                 2-4 K0108650
                    FZ954 DC      .F-.A      F TEST                 2-4 K0108660
                    FZ955 DC      15         CONSTANT 15            2-4 K0108670
                    *                                                   K0108680
                    *                                                   K0108690
                    *             CHECK IF ORIGIN RECORD                K0108700
                    *                                                   K0108710
                    FZ070 BSI     FZ600      GET NEXT NONBLANK CHAR 2-4 K0108720
                          S       FZ949      IS IT N                2-4 K0108730
                          BSC  L  FZ052,+-   BRANCH IF YES          2-4 K0108740
                          A       FZ948      IS IT R                2-4 K0108750
                          BSC  L  FZ005,Z    NO - ERROR             2-4 K0108760
                    *                                                   K0108770
                    *             CHECK FOR VALID ORIGIN RECORD         K0108780
                    *                                                   K0108790
                          LDX   3 4          SET CHARACTER          2-4 K0108800
                          STX  L3 FZ920      COUNT TO 4             2-4 K0108810
                          LDX  L3 FZ989      'IGIN'                 2-4 K0108820
                          BSI     FZ060      CHECK IF EQUAL         2-4 K0108830
                    *                                                   K0108840
                    *             COMPUTE ADDRESS                       K0108850
                    *                                                   K0108860
                          BSI     FZ600      GET NEXT NONBLANK CHAR 2-4 K0108870
                          S       FZ950      IS IT A SLASH          2-4 K0108880
                          BSC  L  FZ076,+-   YES - BRANCH           2-4 K0108890
                          A       FZ950      NO - RESTORE CHARACTER 2-4 K0108900
                          STX  L  FZ95E      SET SWITCH 14          2-4 K0108910
                          MDX     FZ074      START COMPUTATION      2-4 K0108920
                    *                                                   K0108930
                    FZ072 BSI     FZ600      GET NEXT NONBLANK CHAR 2-4 K0108940
                    FZ074 EOR     FZ951      /00F0                  2-4 K0108950
                          SRT     4          IS CHAR NUMERIC        2-4 K0108960
                          BSC  L  FZ005,Z    NO - ERROR             2-4 K0108970
                          SLT     4          YES - RESTORE NUMBER   2-4 K0108980
                          STO     FZ946      STORE TEMPORARY        2-4 K0108990
                          LD   L  FX000      LOAD ADDRESS           2-4 K0109000
                          M       FZ952      MULTIPLY BY TEN        2-4 K0109010
                          BSC  L  FZ005,Z    ERROR IF OVERFLOW      2-4 K0109020
                          SLT     16                                2-4 K0109030
                          BSC     -          SKIP IF NEGATIVE       2-4 K0109040
                          A       FZ946      ADD NEW DIGIT          2-4 K0109050
                          BSC  L  FZ005,+Z   ERROR IF NEGATIVE      2-4 K0109060
                          STO  L  FX000      STORE NEW ADDRESS      2-4 K0109070
                          MDX     FZ072      GET NEXT DIGIT         2-4 K0109080
                    *                                                   K0109090
                    FZ076 BSI     FZ600      GET NEXT NONBLANK CHAR 2-4 K0109100
                          STO     FZ946      STORE TEMPORARY        2-4 K0109110
                          EOR     FZ951      /00F0                  2-4 K0109120
                          SRT     4          IS IT NUMERIC          2-4 K0109130
                          BSC  L  FZ080,+-   YES - BRANCH           2-4 K0109140
                          LD      FZ946      LOAD CHARACTER         2-4 K0109150
                          S       FZ953                             2-4 K0109160
                          BSC  L  FZ005,+Z   ERROR IF LT A          2-4 K0109170
                          S       FZ954                             2-4 K0109180
                          BSC  L  FZ005,-Z   ERROR IF GT F          2-4 K0109190
                          A       FZ955      RESTORE DIGIT          2-4 K0109200
                          SRT     4          SAVE IN EXT            2-4 K0109210
                    *                                                   K0109220
                    FZ080 LD   L  FX000      LOAD ADDRESS           2-4 K0109230
                          SRT     12                                2-4 K0109240
                          BSC  L  FZ005,Z    ERROR IF TOO HIGH      2-4 K0109250
                          SLT     16                                2-4 K0109260
                          BSC  L  FZ005,+Z   ERROR IF NEGATIVE      2-4 K0109270
                          STO  L  FX000      SAVE ADDRESS           2-4 K0109280
                          STX  L  FZ95E      SET SWITCH 14          2-4 K0109290
                          MDX     FZ076      GET NEXT DIGIT         2-4 K0109300
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0109310
                    *                                                   K0109320
                    *             THIS SUBROUTINE PICKS UP NON-BLANK    K0109330
                    *             COLUMNS FROM THE INPUT CARD.  ENTRY   K0109340
                    *             IS A BSI INSTRUCTION TO THE LABEL     K0109350
                    *             (FZ600).  UPON EXITING FROM THE       K0109360
                    *             ROUTINE THE A REGISTER WILL CONTAIN   K0109370
                    *             THE CHARACTER IN UNPACKED EBC CODE.   K0109380
                    *                                                   K0109390
                    FZ600 DC      0          BSI ENTRY                  K0109400
                    *                                                   K0109410
                          STX   2 FZ946      XR2 = POINTER IN CARD BUFR K0109420
                          LD      FZ946      LOAD POINTER               K0109430
                    *                                                   K0109440
                          S       FZ945      CHECK IF                   K0109450
                          S    L  F1003+1    END OF CARD.               K0109460
                    *                                                   K0109470
                          BSC  L  FZ601,+Z   BRANCH IF NO               K0109480
                    *                                                   K0109490
                          LD   L  FZ95E      LOAD SWITCH 14             K0109500
                          BSC  L  FZ005,+-   BRANCH TO ERROR IF NOT ON  K0109510
                    *                                                   K0109520
                    *                                                   K0109530
                          LD    3 0          SET CURRENT CONTROL OPTION K0109540
                          OR   L  FX013      INTO CONTROL CARD          K0109550
                          STO  L  FX013      WORD.                      K0109560
                    *                                                   K0109570
                          BSC  L  F1003      PRINT AND GET NEXT CARD    K0109580
                    *                                                   K0109590
                    FZ601 LD    2 1          LOAD NEXT CHARACTER IN CD  K0109600
                    *                                                   K0109610
                          MDX   2 1          INCREMENT POINTER          K0109620
                    *                                                   K0109630
                          STO     FZ946      SAVE CHAR                  K0109640
                          EOR     FZ947      CHECK IF CHARACTER BLANK   K0109650
                          BSC  L  FZ600+1,+- BRANCH IF BLANK            K0109660
                    *                                                   K0109670
                          LD      FZ946      LOAD CHARACTER             K0109680
                    *                                                   K0109690
                          BSC  I  FZ600      RETURN                     K0109700
                    *                                                   K0109710
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0109720
                    *                                                   K0109730
                    *****         CONTROL CARD TABLES         *****     K0109740
                    *                                                   K0109750
                    *                                                   K0109760
                    *                        TRANSFER TRACE             K0109770
                    FZ971 DC      .R         R                          K0109780
                          DC      .A         A                          K0109790
                          DC      .N         N                          K0109800
                          DC      .S         S                          K0109810
                          DC      .F         F                          K0109820
                          DC      .E         E                          K0109830
                          DC      .R         R                          K0109840
                          DC      .T         T                          K0109850
                          DC      .R         R                          K0109860
                          DC      .A         A                          K0109870
                          DC      .C         C                          K0109880
                          DC      .E         E                          K0109890
                          DC      /0001      INDICATOR                  K0109900
                    *                                                   K0109910
                    *                        ARITHMETIC TRACE           K0109920
                    FZ972 DC      .R         R                          K0109930
                          DC      .I         I                          K0109940
                          DC      .T         T                          K0109950
                          DC      .H         H                          K0109960
                          DC      .M         M                          K0109970
                          DC      .E         E                          K0109980
                          DC      .T         T                          K0109990
                          DC      .I         I                          K0110000
                          DC      .C         C                          K0110010
                          DC      .T         T                          K0110020
                          DC      .R         R                          K0110030
                          DC      .A         A                          K0110040
                          DC      .C         C                          K0110050
                          DC      .E         E                          K0110060
                    *                                                   K0110070
                          DC      /0002      INDICATOR                  K0110080
                    *                                                   K0110090
                    *                                                   K0110100
                    *                        IOCS                       K0110110
                    FZ973 DC      .O         O                          K0110120
                          DC      .C         C                          K0110130
                          DC      .S         S                          K0110140
                    *                                                   K0110150
                    *                                                   K0110160
                    *                        EXTENDED PRECISION         K0110170
                    FZ974 DC      .X         X                          K0110180
                          DC      .T         T                          K0110190
                          DC      .E         E                          K0110200
                          DC      .N         N                          K0110210
                          DC      .D         D                          K0110220
                          DC      .E         E                          K0110230
                          DC      .D         D                          K0110240
                          DC      .P         P                          K0110250
                          DC      .R         R                          K0110260
                          DC      .E         E                          K0110270
                          DC      .C         C                          K0110280
                          DC      .I         I                          K0110290
                          DC      .S         S                          K0110300
                          DC      .I         I                          K0110310
                          DC      .O         O                          K0110320
                          DC      .N         N                          K0110330
                    *                                                   K0110340
                          DC      /0004      INDICATOR                  K0110350
                    *                                                   K0110360
                    *                                                   K0110370
                    *                        CARD                       K0110380
                    FZ976 DC      .A         A                          K0110390
                          DC      .R         R                          K0110400
                          DC      .D         D                          K0110410
                    *                                                   K0110420
                          DC      /0001      INDICATOR                  K0110430
                    *                                                   K0110440
                    *                                                   K0110450
                    *                      1442 PUNCH                   K0110460
                    FZ977 DC      .2         2                          K0110470
                          DC      .P         P                          K0110480
                          DC      .U         U                          K0110490
                          DC      .N         N                          K0110500
                          DC      .C         C                          K0110510
                          DC      .H         H                          K0110520
                    *                                                   K0110530
                          DC      /0040      INDICATOR                  K0110540
                    *                                                   K0110550
                    *                                                   K0110560
                    *                       PAPER TAPE                  K0110570
                    FZ978 DC      .P         P                          K0110580
                          DC      .E         E                          K0110590
                          DC      .R         R                          K0110600
                          DC      .T         T                          K0110610
                          DC      .A         A                          K0110620
                          DC      .P         P                          K0110630
                          DC      .E         E                          K0110640
                    *                                                   K0110650
                          DC      /0002      INDICATOR                  K0110660
                    *                                                   K0110670
                    *                                                   K0110680
                    *                        TYPEWRITER                 K0110690
                    FZ979 DC      .Y         Y                          K0110700
                          DC      .P         P                          K0110710
                          DC      .E         E                          K0110720
                          DC      .W         W                          K0110730
                          DC      .R         R                          K0110740
                          DC      .I         I                          K0110750
                          DC      .T         T                          K0110760
                          DC      .E         E                          K0110770
                          DC      .R         R                          K0110780
                    *                                                   K0110790
                          DC      /0004      INDICATOR                  K0110800
                    *                                                   K0110810
                    *                                                   K0110820
                    *                        KEYBOARD                   K0110830
                    FZ97A DC      .E         E                          K0110840
                          DC      .Y         Y                          K0110850
                          DC      .B         B                          K0110860
                          DC      .O         O                          K0110870
                          DC      .A         A                          K0110880
                          DC      .R         R                          K0110890
                          DC      .D         D                          K0110900
                    *                                                   K0110910
                          DC      /0020      INDICATOR                  K0110920
                    *                                                   K0110930
                    *                                                   K0110940
                    *                       1132 PRINTER                K0110950
                    FZ97B DC      .3         3                          K0110960
                          DC      .2         2                          K0110970
                          DC      .P         P                          K0110980
                          DC      .R         R                          K0110990
                          DC      .I         I                          K0111000
                          DC      .N         N                          K0111010
                          DC      .T         T                          K0111020
                          DC      .E         E                          K0111030
                          DC      .R         R                          K0111040
                    *                                                   K0111050
                          DC      /0100      INDICATOR                  K0111060
                    *                                                   K0111070
                    *                                                   K0111080
                    *                        DISK                       K0111090
                    FZ97C DC      .I         I                          K0111100
                          DC      .S         S                          K0111110
                          DC      .K         K                          K0111120
                    *                                                   K0111130
                          DC      /0080      INDICATOR                  K0111140
                    *                                                   K0111150
                    *                                                   K0111160
                    *                       PLOTTER                     K0111170
                    FZ97D DC      .O         O                          K0111180
                          DC      .T         T                          K0111190
                          DC      .T         T                          K0111200
                          DC      .E         E                          K0111210
                          DC      .R         R                          K0111220
                    *                                                   K0111230
                          DC      /1000      INDICATOR                  K0111240
                    *                                                   K0111250
                    *                                                   K0111260
                    *                      1403 PRINTER                 K0111270
                    FZ97E DC      .3         3                          K0111280
                          DC      .P         P                          K0111290
                          DC      .R         R                          K0111300
                          DC      .I         I                          K0111310
                          DC      .N         N                          K0111320
                          DC      .T         T                          K0111330
                          DC      .E         E                          K0111340
                          DC      .R         R                          K0111350
                    *                                                   K0111360
                          DC      /0008      INDICATOR                  K0111370
                    *                                                   K0111380
                    *                                                   K0111390
                    *                        2501 READER                K0111400
                    FZ97F DC      .5         5                          K0111410
                          DC      .0         0                          K0111420
                          DC      .1         1                          K0111430
                          DC      .R         R                          K0111440
                          DC      .E         E                          K0111450
                          DC      .A         A                          K0111460
                          DC      .D         D                          K0111470
                          DC      .E         E                          K0111480
                          DC      .R         R                          K0111490
                    *                                                   K0111500
                          DC      /0010      INDICATOR                  K0111510
                    *                                                   K0111520
                    *                                                   K0111530
                    *                        LIST                       K0111540
                    FZ981 DC      .I         I                          K0111550
                          DC      .S         S                          K0111560
                          DC      .T         T                          K0111570
                    *                                                   K0111580
                    *                                                   K0111590
                    *                       SYMBOL TABLE                K0111600
                    FZ982 DC      .M         M                          K0111610
                          DC      .B         B                          K0111620
                          DC      .O         O                          K0111630
                          DC      .L         L                          K0111640
                          DC      .T         T                          K0111650
                          DC      .A         A                          K0111660
                          DC      .B         B                          K0111670
                          DC      .L         L                          K0111680
                          DC      .E         E                          K0111690
                    *                                                   K0111700
                          DC      /0008      INDICATOR                  K0111710
                    *                                                   K0111720
                    *                                                   K0111730
                    *                       SOURCE PROGRAM              K0111740
                    FZ983 DC      .U         U                          K0111750
                          DC      .R         R                          K0111760
                          DC      .C         C                          K0111770
                          DC      .E         E                          K0111780
                          DC      .P         P                          K0111790
                          DC      .R         R                          K0111800
                          DC      .O         O                          K0111810
                          DC      .G         G                          K0111820
                          DC      .R         R                          K0111830
                          DC      .A         A                          K0111840
                          DC      .M         M                          K0111850
                    *                                                   K0111860
                          DC      /0020      INDICATOR                  K0111870
                    *                                                   K0111880
                    *                                                   K0111890
                    *                       SUBPROGRAM NAMES            K0111900
                    FZ984 DC      .B         B                          K0111910
                          DC      .P         P                          K0111920
                          DC      .R         R                          K0111930
                          DC      .O         O                          K0111940
                          DC      .G         G                          K0111950
                          DC      .R         R                          K0111960
                          DC      .A         A                          K0111970
                          DC      .M         M                          K0111980
                          DC      .N         N                          K0111990
                    FZ987 DC      .A         A                          K0112000
                          DC      .M         M                          K0112010
                          DC      .E         E                          K0112020
                          DC      .S         S                          K0112030
                    *                                                   K0112040
                          DC      /0010      INDICATOR                  K0112050
                    *                                                   K0112060
                    *                                                   K0112070
                    *                        ALL                        K0112080
                    FZ985 DC      .L         L                          K0112090
                          DC      .L         L                          K0112100
                    *                                                   K0112110
                          DC      /0038      INDICATOR                  K0112120
                    *                                                   K0112130
                    *                                                   K0112140
                    *                       ONE WORD INTEGERS           K0112150
                    FZ986 DC      .E         E                          K0112160
                          DC      .W         W                          K0112170
                          DC      .O         O                          K0112180
                          DC      .R         R                          K0112190
                          DC      .D         D                          K0112200
                          DC      .I         I                          K0112210
                          DC      .N         N                          K0112220
                          DC      .T         T                          K0112230
                          DC      .E         E                          K0112240
                          DC      .G         G                          K0112250
                          DC      .E         E                          K0112260
                          DC      .R         R                          K0112270
                          DC      .S         S                          K0112280
                    *                                                   K0112290
                          DC      /0040      INDICATOR                  K0112300
                    *                                                   K0112310
                    *                                                   K0112320
                    *                        UDISK                      K0112330
                    FZ988 DC      .D         D                          K0112340
                          DC      .I         I                          K0112350
                          DC      .S         S                          K0112360
                          DC      .K         K                          K0112370
                    *                                                   K0112380
                          DC      /4000      INDICATOR                  K0112390
                    *                                                   K0112400
                    *                                               2-4 K0112410
                    *                       ORIGIN                  2-4 K0112420
                    FZ989 DC      .I         I                      2-4 K0112430
                          DC      .G         G                      2-4 K0112440
                          DC      .I         I                      2-4 K0112450
                          DC      .N         N                      2-4 K0112460
                    *                                               2-4 K0112470
                          DC      /0080      INDICATOR              2-4 K0112480
                    *                                               2-4 K0112490
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0112500
                    *                                                   K0112510
                    *             SET UP HEADER                         K0112520
                    *                                                   K0112530
                    *                                                   K0112540
                    FZ090 LDX   3 -35        INITIALIZE TO PACK HEADER  K0112550
                    FZ091 LD    2 1          LOAD CHARACTER TO BE MOVED K0112560
                          SLA     8          SHIFT LEFT                 K0112570
                          OR    2 2          ADD NEXT CHARACTER         K0112580
                          STO  L3 HEAD+47    STORE IN HEADER            K0112590
                          MDX   2 2          GET NEXT CHAR PAIR         K0112600
                          MDX   3 1          SKIP WHEN COMPLETE         K0112610
                          MDX     FZ091      LOOP                       K0112620
                          SLA     16         SET PAGE RESTORE           K0112630
                          STO  L  F1700     *SWITCH                2-11 K0112640
                          LDX  I2 F1003+1    RESET XR2                  K0112650
                          BSC  L  F1004      PRINT CARD - READ NEXT     K0112660
                    *                                                   K0112670
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0112680
                    *                                                   K0112690
                    *             PROCESS *NAME CARD                    K0112700
                    *                                                   K0112710
                    *                                                   K0112720
                    *                                                   K0112730
                    FZ100 LDX   3 3          SET CHARACTER              K0112740
                          STX  L3 FZ920      COUNT TO 3                 K0112750
                          LDX  L3 FZ987      'AME'                      K0112760
                          BSI  L  FZ060      GO CHECK, RETURN IF EQUAL  K0112770
                    *                                                   K0112780
                          BSI  L  FZ600      GET NEXT NON-BLANK CHAR    K0112790
                    *                                                   K0112800
                          STX   2 FZ110      SAVE CHARACTER POINTER     K0112810
                    *                                                   K0112820
                          LD   L  F1003+1    GENERATE ADDRESS           K0112830
                          A       FZ114      OF LAST COLUMN             K0112840
                          STO     FZ111      *                          K0112850
                    *                                                   K0112860
                          BSI     FZ106      GET FIRST CHAR OF NAME     K0112870
                          SLA     8          SHIFT LEFT 8               K0112880
                          STO     FZ112      SAVE                       K0112890
                    *                                                   K0112900
                          BSI     FZ106      GET SECOND CHAR OF NAME    K0112910
                          SLA     2          SHIFT LEFT 2               K0112920
                          OR      FZ112      ADD SAVED PORTION          K0112930
                          STO     FZ112      SAVE                       K0112940
                    *                                                   K0112950
                          BSI     FZ106      GET THIRD CHAR OF NAME     K0112960
                          SRT     4          SAVE 4 BITS IN EXTENSION   K0112970
                          OR      FZ112      ADD SAVED PORTION          K0112980
                          STO     FZ112      SAVE                       K0112990
                          SLT     4          GET BITS FROM EXTENSION    K0113000
                          SLA     12         SHIFT LEFT 12              K0113010
                          STO     FZ113      SAVE                       K0113020
                    *                                                   K0113030
                          BSI     FZ106      GET FOURTH CHAR OF NAME    K0113040
                          SLA     6          SHIFT LEFT 6               K0113050
                          OR      FZ113      ADD SAVED PORTION          K0113060
                          STO     FZ113      SAVE                       K0113070
                    *                                                   K0113080
                          BSI     FZ106      GET FIFTH CHAR OF NAME     K0113090
                          OR      FZ113      ADD SAVED PORTION          K0113100
                          RTE     16         SHIFT TO EXTENSION         K0113110
                          LD      FZ112      LOAD FIRST SAVED PORTION   K0113120
                    *                                                   K0113130
                          STD  L  FX011      STORE AS PROGRAM NAME      K0113140
                          BSC  L  F1003      PRINT AND READ NEXT CARD   K0113150
                    *                                                   K0113160
                    *             THIS RTN GETS A CHARACTER FROM        K0113170
                    *             NAME CARD, CHECKS FOR LAST COLUMN,    K0113180
                    *             AND CREATES TRUNCATED EBCDIC CODE.    K0113190
                    *                                                   K0113200
                    FZ106 DC      *-*        LINK                       K0113210
                    *                                                   K0113220
                          LD      FZ110      LOAD POINTER ADDRESS       K0113230
                          S       FZ111      SUBTRACT LAST COLUMN ADR   K0113240
                          BSC  L  FZ107,+Z   BRANCH IF OK               K0113250
                    *                                                   K0113260
                          SLA     16         LOAD DUMMY ZERO            K0113270
                          MDX     FZ108      GO RETURN ZERO CHARACTER   K0113280
                    *                                                   K0113290
                    FZ107 LD   I  FZ110      LOAD CHARACTER             K0113300
                          MDX  L  FZ110,1    INCREMENT ADDRESS          K0113310
                    *                                                   K0113320
                    FZ108 SLA     10         TRUNCATE HIGH ORDER        K0113330
                          SRA     10         TWO BITS OF CHARACTER.     K0113340
                    *                                                   K0113350
                          BSC  I  FZ106      RETURN                     K0113360
                    *                                                   K0113370
                    *                                                   K0113380
                    FZ110 DC      *-*        CHARACTER ADDRESS          K0113390
                    FZ111 DC      *-*        LAST COLUMN ADDRESS        K0113400
                    FZ112 DC      *-*        SAVE AREA FOR WORD 1       K0113410
                    FZ113 DC      *-*        SAVE AREA FOR WORD 2       K0113420
                    FZ114 DC      71         USEFUL CONSTANT            K0113430
                    *                                                   K0113440
                    *                                                   K0113450
                    *                                                   K0113460
                    *                                                   K0113470
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0113480
                    *             END OF INITIALIZATION AND CONTROL     K0113490
                    *             CARD PROCESSING SECTION OF PHASE 1.   K0113500
                    *                                                   K0113510
                    *                                                   K0113520
                    *                                                   K0113530
                    *                                                   K0113540
                    *             TEMPORARY - TO BE REMOVED             K0113550
                    *             ON FINAL ASSEMBLY.                    K0113560
                    *                                                   K0113570
                    FZEND EQU     *                                     K0113580
                    FZLNG EQU     FZEND-FZ000  LENGTH OF PHASE 0        K0113590
                    *                                                   K0113600
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0113610
                    *             BEGINNING OF MAIN BODY OF PHASE 1     K0113620
                    *             THIS SECTION LIES BELOW THE SYMBOL    K0113630
                    *             TABLE AND STRING AREA.                K0113640
                    *                                                   K0113650
                    *                                                   K0113660
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0113670
                    *                                                   K0113680
                    *                                                   K0113690
                          ORG     OVERX                                 K0113700
                    *                                                   K0113710
                    *                                                   K0113720
                    *             RESTORE PAGE ROUTINE                  K0113730
                    *                                                   K0113740
                    F1700 NOP               ENTRY POINT/EJECT SW   2-11 K0113750
                    *                                                   K0113760
                          LDD     F1796                                 K0113770
                          BSI  L  F1803+1    RESTORE PAGE               K0113780
                    *                                                   K0113790
                          BSI  L  F1803+1    PRINT HEADER               K0113800
                          LD      F1798      LOAD SPACE PARAMETER       K0113810
                          BSI  L  F1803+1    SPACE SPRINTER             K0113820
                    *                                                   K0113830
                          BSC  I  F1700      RETURN                     K0113840
                    *                                                   K0113850
                          BSS  E  0                                     K0113860
                    F1796 DC      /7000      PAGE RESTORE PARAMETER     K0113870
                          DC      HEAD       HEADER AREA ADDRESS        K0113880
                    F1798 DC      /7002      SPACE PARAMETER            K0113890
                    *                                                   K0113900
                    *                                                   K0113910
                    F1PBF DC      40         PRINT OUTPUT               K0113920
                          BSS     40         BUFFER.                    K0113930
                    *                                                   K0113940
                    *                                                   K0113950
                    *                                                   K0113960
                    F1CDA DC      80         READ INPUT BUFFER 1        K0113970
                          BSS     80         *                          K0113980
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0113990
                    *                                               2-8 K0114000
                    *   FOLLOWING CODE INITIALIZES ENTRIES FOR      2-8 K0114010
                    *   AMPERSAND,AT SIGN,POUND SIGN,PERCENT,       2-8 K0114020
                    *   LESS THAN, AND INVALID CHARACTER IN THE     2-8 K0114030
                    *   SYSTEM KEYBOARD AND PAPER TAPE DEVICE       2-8 K0114040
                    *   SUBROUTINE CONVERSION TABLES                2-8 K0114050
                    *                                               2-8 K0114060
                    *   THIS CODE IS OVERLAID WHEN THE FIRST        2-8 K0114070
                    *   SOURCE RECORD IS READ                       2-8 K0114080
                    *                                               2-8 K0114090
                          ORG     F1CDA+1   1ST WD OF 1ST BUFFER    2-8 K0114100
                    F1799 LD   L  $DBSY     DISK BUSY INDR          2-8 K0114110
                          BSC     Z         SKIP IF NOT BUSY        2-8 K0114120
                          MDX     *-4       LOOP ON BUSY            2-8 K0114130
                          LDX   3 6         NO. OF ENTRIES CHANGED  2-8 K0114140
                    F179A LDX  L1 F179P     (F179K IF KEYBOARD)     2-8 K0114150
                          LDX  L2 F1801-2                           2-8 K0114160
                          STX   2 F179W     BUILD ADDR WITHIN KYBRD 2-8 K0114170
                          LD      F179W     *OP PAPER TAPE DEVICE   2-8 K0114180
                          A    L  F1801+1   *SUBR WHERE TABLE       2-8 K0114190
                          STO     *+1       *ENTRIES WILL BE        2-8 K0114200
                          LDX  L2 *-*       *MODIFIED.              2-8 K0114210
                    F179B LD    1 0         PLACE FORTRAN CHAR      2-8 K0114220
                          STO   2 0         *IN CONVERSION TBL      2-8 K0114230
                          MDX   1 +1        POINT TO NEXT CHAR      2-8 K0114240
                          MDX   2 +1        POINT TO NEXT TBL ENTRY 2-8 K0114250
                          MDX   3 -1        DECR LOOP COUNTER       2-8 K0114260
                          B       F179B     CONTINUE TBL INITLZ     2-8 K0114270
                    *                                               2-8 K0114280
                          B    L  FZZ35     CONT INITLZ COMMON W/CD 2-8 K0114290
                    *                                               2-8 K0114300
                    F179K DC      /2150     INVALID CHAR (AMP)      2-8 K0114310
                          DC      /444E     AMPERSAND               2-8 K0114320
                          DC      /C27E     POUND SIGN              2-8 K0114330
                          DC      /E67D     AT SIGN                 2-8 K0114340
                          DC      /FE4D     PERCENT                 2-8 K0114350
                          DC      /F65D     LESS THAN               2-8 K0114360
                    F179P DC      /0050     INVALID CHAR (AMP)      2-8 K0114370
                          DC      /704E     AMPERSAND               2-8 K0114380
                          DC      /0B7E     POUND SIGN              2-8 K0114390
                          DC      /207D     AT SIGN                 2-8 K0114400
                          DC      /954D     PERCENT                 2-8 K0114410
                          DC      /825D     LESS THAN               2-8 K0114420
                    F179W DC      *-*       WORK AREA TO BUILD ADDR 2-8 K0114430
                          HDNG    1130 FORTRAN COMPILER PHASE 1         K0114440
                    *                                                   K0114450
                    *             THE ABOVE SECTION WILL BE OVERLAYED   K0114460
                    *             WITH SYMBOL TABLE ENTRIES IN          K0114470
                    *             SUBSEQUENT PHASES.                    K0114480
                    *                                                   K0114490
                    *                                                   K0114500
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0114510
                    *                                                   K0114520
                          ORG     OVERL                                 K0114530
                    *                                                   K0114540
                    *             FORTRAN COMMUNICATIONS AREA           K0114550
                    *             (FCOM)                                K0114560
                    *                                                   K0114570
                    FX000 BSS     1     ORIGIN ADDRESS              2-4 K0114580
                    FX001 BSS     1     START OF STRING                 K0114590
                    FX002 BSS     1     END OF STRING                   K0114600
                    FX003 BSS     1     START OF SYMBOL TABLE           K0114610
                    FX004 BSS     1     START OF NON-STATEMENT NUMBERS  K0114620
                    FX005 BSS     1     START OF SUBSCRIPT TEMPORARIES  K0114630
                    FX006 BSS     1     START OF GENERATED TEMPORARIES  K0114640
                    FX007 BSS     1     END OF SYMBOL TABLE             K0114650
                    FX008 BSS     1     NEXT AVAILABLE COMMON           K0114660
                    FX009 BSS     1     SIZE OF COMMON                  K0114670
                    FX010 BSS     1     OVERLAP ERROR                   K0114680
                    FX011 BSS     1     PROGRAM NAME                    K0114690
                          BSS     1                                     K0114700
                    FX012 BSS     1     SUBROUTINE(-) OR FUNCTION(+)    K0114710
                    FX013 BSS     1     CONTROL CARD WORD               K0114720
                    *                    BIT 15  TRANSFER TRACE         K0114730
                    *                    BIT 14  ARITHMETIC TRACE       K0114740
                    *                    BIT 13  EXTENDED PRECISION     K0114750
                    *                    BIT 12  LIST SYMBOL TABLE      K0114760
                    *                    BIT 11  LIST SUBPROGRAM NAMES  K0114770
                    *                    BIT 10  LIST SOURCE PROGRAM    K0114780
                    *                    BIT  9  ONE WORD INTEGERS      K0114790
                    *                                                   K0114800
                    FX014 BSS     1     IOCS CONTROL CARD WORD          K0114810
                    *                    BIT 15  CARD                   K0114820
                    *                    BIT 14  PAPER TAPE             K0114830
                    *                    BIT 13  TYPEWRITER             K0114840
                    *                    BIT 12  1403 PRINTER           K0114850
                    *                    BIT 11  2501 READER            K0114860
                    *                    BIT 10  KEYBOARD               K0114870
                    *                    BIT  9  1442 PUNCH             K0114880
                    *                    BIT  8  DISK                   K0114890
                    *                    BIT  7  1132 PRINTER           K0114900
                    *                    BIT  3  PLOTTER                K0114910
                    *                                                   K0114920
                    FX015 BSS     1     FILE COUNT                      K0114930
                    *                                                   K0114940
                    *                                                   K0114950
                    ORG   EQU     FX000      FCOM EQUIVALENCES      2-4 K0114960
                    SOFS  EQU     FX001      *                          K0114970
                    EOFS  EQU     FX002      *                          K0114980
                    SOFST EQU     FX003      *                          K0114990
                    SOFNS EQU     FX004      *                          K0115000
                    SOFXT EQU     FX005      *                          K0115010
                    SOFGT EQU     FX006      *                          K0115020
                    EOFST EQU     FX007      *                          K0115030
                    COMON EQU     FX008      *                          K0115040
                    CSIZE EQU     FX009      *                          K0115050
                    ERROR EQU     FX010      *                          K0115060
                    FNAME EQU     FX011      *                          K0115070
                    SORF  EQU     FX012      *                          K0115080
                    CCWD  EQU     FX013      *                          K0115090
                    IOCS  EQU     FX014      *                          K0115100
                    DFCNT EQU     FX015      *                          K0115110
                          HDNG    1130 DISK MON SYS VER 2 FORT PHASE 1  K0115120
                    *                                                   K0115130
                    *                                                   K0115140
                    *                                                   K0115150
                    *             INPUT ROUTINES LOAD HERE              K0115160
                    *                                                   K0115170
                    *                                                   K0115180
                    *                                                   K0115190
                          BSS     2                                     K0115200
                    F1801 BSS     203        THIS SPACE WILL CONTAIN    K0115210
                    *                        THE INPUT ROUTINE          K0115220
                    *                        IF INPUT IS NOT FROM CARDS K0115230
                    *                        THE INPUT CONVERSION       K0115240
                    *                        ROUTINE WILL FOLLOW THE    K0115250
                    *                        INPUT ROUTINE AND THE CARD K0115260
                    *                        CONVERSION ROUTINE BELOW   K0115270
                    *                        WILL BE OVERLAID IF        K0115280
                    *                        NECESSARY                  K0115290
                    *                                                   K0115300
                    *                                                   K0115310
                          HDNG    1130 FORTRAN COMPILER PHASE 1         K0115320
                    *************************************************** K0115330
                    *                                                 * K0115340
                    *             CARD CONVERSION ROUTINE             * K0115350
                    *                                                 * K0115360
                    *************************************************** K0115370
                    *                                                   K0115380
                    *                                                   K0115390
                    SP000 BSC  L  *-*        EXIT / ENTRY               K0115400
                          STS     SP074      SAVE STATUS                K0115410
                          STX   1 SP070+1    SAVE XR1                   K0115420
                          STX   2 SP072+1    SAVE XR2                   K0115430
                          STO     SP020+1    INITIALIZE LOAD AND STORE  K0115440
                          STO     SP060+1    *WITH ADDRESS OF I/O AREA  K0115450
                    *                                                   K0115460
                          LDX   2 80         SET COLUMN COUNT IN XR2    K0115470
                    *                                                   K0115480
                    SP020 LD   L2 *-*        GET CARD COLUMN            K0115490
                          STO     SP090      SAVE TEMPORARY             K0115500
                          SRT     6          PACK ROWS 12,11,0 NEXT TO  K0115510
                          SRA     7          *ROWS 8,9 AND STORE        K0115520
                          SRT     3          *IN EXTENSION              K0115530
                          LD      SP090      RELOAD CARD COLUMN         K0115540
                    *                                                   K0115550
                    *     DETERMINE WHICH ROWS OF 1-7 ARE PUNCHED       K0115560
                    *                                                   K0115570
                          LDX   1 10         SET UP XR1                 K0115580
                          AND     SP100      ZERO ALL ROWS EXCEPT 1-7   K0115590
                          SLCA  1                                       K0115600
                          SLA     1          IS MULTIPLE PUNCH IN 1-7   K0115610
                          BSC     +-         SKIP IF YES                K0115620
                          MDX     SP030      BRANCH IF NO               K0115630
                          LD      SP120      UAE AMPERSAND TO INDICATE  K0115640
                          MDX     SP060      *INVALID PUNCH             K0115650
                    *                                                   K0115660
                    *     COLUMN CONTAINS VALID PUNCH                   K0115670
                    *                                                   K0115680
                    SP030 STX   1 SP090      XR1=0 IF NO 1-7 PUNCH      K0115690
                          LD      SP090      *    1 IF 7 PUNCH          K0115700
                          SLT     4          *    7 IF 1 PUNCH          K0115710
                          STO     SP050+1    ADD 12,11,0,8 ROWS         K0115720
                          SLT     17         STORE 9 ROW IN CARRY       K0115730
                    SP050 LDX  L1 *-*        XR1 = TABLE LOOK-UP ADDR   K0115740
                          LD   L1 SP130      LOAD TABLE ENTRY           K0115750
                    *                                                   K0115760
                    *     IF 9 PUNCH - USE RIGHT HALF OF ENTRY          K0115770
                    *                                                   K0115780
                          BSC     C          IS CARRY ON                K0115790
                          SLA     8          YES - USE RIGHT-HALF       K0115800
                          SRA     8          NO  - USE LEFT-HALF        K0115810
                    SP060 STO  L2 *-*        STORE CHAR IN BUFFER       K0115820
                          MDX   2 -1         CHANGE COLUMN POINTER      K0115830
                          MDX     SP020      *TO CONVERT NEXT COLUMN    K0115840
                    *                                                   K0115850
                    *     CARD IS CONVERTED - RETURN                    K0115860
                    *                                                   K0115870
                    SP070 LDX  L1 *-*        RESTORE XR1                K0115880
                    SP072 LDX  L2 *-*        RESTORE XR2                K0115890
                    SP074 LDS     *-*        RESTORE STATUS             K0115900
                          MDX     SP000      RETURN TO CALLING PROGRAM  K0115910
                    *                                                   K0115920
                    *     CONSTANTS USED BY THIS ROUTINE                K0115930
                    *                                                   K0115940
                    SP090 DC      *-*        TEMPORARY STORAGE          K0115950
                    SP100 DC      /1FC0      MASK FOR COLUMNS 1-7       K0115960
                    SP120 DC      /0050      EBC FOR AMPERSAND          K0115970
                    *                                                   K0115980
                          HDNG    1130 FORTRAN COMPILER PHASE 1         K0115990
                    *                                                   K0116000
                    *     EBC CHARACTER TABLE -BASED ON PACKED HOL      K0116010
                    *     ( 1-7 ROW COMPLEMENT, 12,11,0,8 ROWS )        K0116020
                    *     RIGHT CHAR IF 9 ROW PUNCHED                   K0116030
                    *                                                   K0116040
                    *             EBC    HOL,ROW PUNCHES    LEFT RIGHT  K0116050
                    *                                                   K0116060
                    SP130 DC      /40F9  BLANK,(9)          BLANK 9     K0116070
                          DC      /F850  8,(9)              8     INVAL K0116080
                          DC      /F0E9  0,(9)              ZERO  Z     K0116090
                          DC      /E850  0,8,(9)            Y     INVAL K0116100
                          DC      /60D9  11,(9)             DASH  R     K0116110
                          DC      /D850  11,8,(9)           Q     INVAL K0116120
                          DC      /5050  11,0,(9)           INVAL INVAL K0116130
                          DC      /5050  11,0,8,(9)         INVAL INVAL K0116140
                          DC      /4EC9  12,(9)             PLUS  I     K0116150
                          DC      /C850  12,8,(9)           H     INVAL K0116160
                          DC      /5050  12,0,(9)           INVAL INVAL K0116170
                          DC      /5050  12,0,8,(9)         INVAL INVAL K0116180
                          DC      /5050  12,11,(9)          INVAL INVAL K0116190
                          DC      /5050  12,11,8,(9)        INVAL INVAL K0116200
                          DC      /5050  12,11,0,(9)        INVAL INVAL K0116210
                          DC      /5050  12,11,0,8,(9)      INVAL INVAL K0116220
                          DC      /F750  7,(9)              7     INVAL K0116230
                          DC      /5050  7,8,(9)            INVAL INVAL K0116240
                          DC      /E750  7,0,(9)            X     INVAL K0116250
                          DC      /5050  7,0,8,(9)          INVAL INVAL K0116260
                          DC      /D750  7,11,(9)           P     INVAL K0116270
                          DC      /5050  7,11,8,(9)         INVAL INVAL K0116280
                          DC      /5050  7,11,0,(9)         INVAL INVAL K0116290
                          DC      /5050  7,11,0,8,(9)       INVAL INVAL K0116300
                          DC      /C750  7,12,(9)           G     INVAL K0116310
                          DC      /5050  7,12,8,(9)         INVAL INVAL K0116320
                          DC      /5050  7,12,0,(9)         INVAL INVAL K0116330
                          DC      /5050  7,12,0,8,(9)       INVAL INVAL K0116340
                          DC      /5050  7,12,11,(9)        INVAL INVAL K0116350
                          DC      /5050  7,12,11,8,(9)      INVAL INVAL K0116360
                          DC      /5050  7,12,11,0,(9)      INVAL INVAL K0116370
                          DC      /5050  7,12,11,0,8,(9)    INVAL INVAL K0116380
                          DC      /F650  6,(9)              6     INVAL K0116390
                          DC      /7E50  6,8,(9)            EQUAL INVAL K0116400
                          DC      /E650  6,0,(9)            W     INVAL K0116410
                          DC      /5050  6,0,8,(9)          INVAL INVAL K0116420
                          DC      /D650  6,11,(9)           O     INVAL K0116430
                          DC      /5050  6,11,8,(9)         INVAL INVAL K0116440
                          DC      /5050  6,11,0,(9)         INVAL INVAL K0116450
                          DC      /5050  6,11,0,8,(9)       INVAL INVAL K0116460
                          DC      /C650  6,12,(9)           F     INVAL K0116470
                          DC      /4E50  6,12,8,(9)         PLUS  INVAL K0116480
                          DC      /5050  6,12,0,(9)         INVAL INVAL K0116490
                          DC      /5050  6,12,0,8,(9)       INVAL INVAL K0116500
                          DC      /5050  6,12,11,(9)        INVAL INVAL K0116510
                          DC      /5050  6,12,11,8,(9)      INVAL INVAL K0116520
                          DC      /5050  6,12,11,0,(9)      INVAL INVAL K0116530
                          DC      /5050  6,12,11,0,8,(9)    INVAL INVAL K0116540
                          DC      /F550  5,(9)              5     INVAL K0116550
                          DC      /7D50  5,8,(9)            APOST INVAL K0116560
                          DC      /E550  5,0,(9)            V     INVAL K0116570
                          DC      /5050  5,0,8,(9)          INVAL INVAL K0116580
                          DC      /D550  5,11,(9)           N     INVAL K0116590
                          DC      /5D50  5,11,8,(9)         )     INVAL K0116600
                          DC      /5050  5,11,0,(9)         INVAL INVAL K0116610
                          DC      /5050  5,11,0,8,(9)       INVAL INVAL K0116620
                          DC      /C550  5,12,(9)           E     INVAL K0116630
                          DC      /4D50  5,12,8,(9)         (     INVAL K0116640
                          DC      /5050  5,12,0,(9)         INVAL INVAL K0116650
                          DC      /5050  5,12,0,8,(9)       INVAL INVAL K0116660
                          DC      /5050  5,12,11,(9)        INVAL INVAL K0116670
                          DC      /5050  5,12,11,8,(9)      INVAL INVAL K0116680
                          DC      /5050  5,12,11,0,(9)      INVAL INVAL K0116690
                          DC      /5050  5,12,11,0,8,(9)    INVAL INVAL K0116700
                          DC      /F450  4,(9)              4     INVAL K0116710
                          DC      /7D50  4,8,(9)            APOST INVAL K0116720
                          DC      /E450  4,0,(9)            U     INVAL K0116730
                          DC      /4D50  4,0,8,(9)          %     INVAL K0116740
                          DC      /D450  4,11,(9)           M     INVAL K0116750
                          DC      /5C50  4,11,8,(9)         *     INVAL K0116760
                          DC      /5050  4,11,0,(9)         INVAL INVAL K0116770
                          DC      /5050  4,11,0,8,(9)       INVAL INVAL K0116780
                          DC      /C450  4,12,(9)           D     INVAL K0116790
                          DC      /5D50  4,12,8,(9)         <     INVAL K0116800
                          DC      /5050  4,12,0,(9)         INVAL INVAL K0116810
                          DC      /5050  4,12,0,8,(9)       INVAL INVAL K0116820
                          DC      /5050  4,12,11,(9)        INVAL INVAL K0116830
                          DC      /5050  4,12,11,8,(9)      INVAL INVAL K0116840
                          DC      /5050  4,12,11,0,(9)      INVAL INVAL K0116850
                          DC      /5050  4,12,11,0,8,(9)    INVAL INVAL K0116860
                          DC      /F350  3,(9)              3     INVAL K0116870
                          DC      /7E50  3,8,(9)            EQUAL INVAL K0116880
                          DC      /E350  3,0,(9)            T     INVAL K0116890
                          DC      /6B50  3,0,8,(9)          ,     INVAL K0116900
                          DC      /D350  3,11,(9)           L     INVAL K0116910
                          DC      /5B50  3,11,8,(9)         $     INVAL K0116920
                          DC      /5050  3,11,0,(9)         INVAL INVAL K0116930
                          DC      /5050  3,11,0,8,(9)       INVAL INVAL K0116940
                          DC      /C350  3,12,(9)           C     INVAL K0116950
                          DC      /4B50  3,12,8,(9)         .     INVAL K0116960
                          DC      /5050  3,12,0,(9)         INVAL INVAL K0116970
                          DC      /5050  3,12,0,8,(9)       INVAL INVAL K0116980
                          DC      /5050  3,12,11,(9)        INVAL INVAL K0116990
                          DC      /5050  3,12,11,8,(9)      INVAL INVAL K0117000
                          DC      /5050  3,12,11,0,(9)      INVAL INVAL K0117010
                          DC      /5050  3,12,11,0,8,(9)    INVAL INVAL K0117020
                          DC      /F250  2,(9)              2     INVAL K0117030
                          DC      /5050  2,8,(9)            INVAL INVAL K0117040
                          DC      /E250  2,0,(9)            S     INVAL K0117050
                          DC      /5050  2,0,8,(9)          INVAL INVAL K0117060
                          DC      /D250  2,11,(9)           K     INVAL K0117070
                          DC      /5050  2,11,8,(9)         INVAL INVAL K0117080
                          DC      /5050  2,11,0,(9)         INVAL INVAL K0117090
                          DC      /5050  2,11,0,8,(9)       INVAL INVAL K0117100
                          DC      /C250  2,12,(9)           B     INVAL K0117110
                          DC      /5050  2,12,8,(9)         INVAL INVAL K0117120
                          DC      /5050  2,12,0,(9)         INVAL INVAL K0117130
                          DC      /5050  2,12,0,8,(9)       INVAL INVAL K0117140
                          DC      /5050  2,12,11,(9)        INVAL INVAL K0117150
                          DC      /5050  2,12,11,8,(9)      INVAL INVAL K0117160
                          DC      /5050  2,12,11,0,(9)      INVAL INVAL K0117170
                          DC      /5050  2,12,11,0,8,(9)    INVAL INVAL K0117180
                          DC      /F150  1,(9)              1     INVAL K0117190
                          DC      /5050  1,8,(9)            INVAL INVAL K0117200
                          DC      /6150  1,0,(9)            SLASH INVAL K0117210
                          DC      /5050  1,0,8,(9)          INVAL INVAL K0117220
                          DC      /D150  1,11,(9)           J     INVAL K0117230
                          DC      /5050  1,11,8,(9)         INVAL INVAL K0117240
                          DC      /5050  1,11,0,(9)         INVAL INVAL K0117250
                          DC      /5050  1,11,0,8,(9)       INVAL INVAL K0117260
                          DC      /C150  1,12,(9)           A     INVAL K0117270
                          DC      /5050  1,12,8,(9)         INVAL INVAL K0117280
                          DC      /5050  1,12,0,(9)         INVAL INVAL K0117290
                          DC      /5050  1,12,0,8,(9)       INVAL INVAL K0117300
                          DC      /5050  1,12,11,(9)        INVAL INVAL K0117310
                          DC      /5050  1,12,11,8,(9)      INVAL INVAL K0117320
                          DC      /5050  1,12,11,0,(9)      INVAL INVAL K0117330
                          DC      /5050  1,12,11,0,8,(9)    INVAL INVAL K0117340
                    *                                                   K0117350
                    *                                                   K0117360
                    *                                                   K0117370
                    F1802 DC      SP000+1    INDIRECT ADDRESS ENTRY TO  K0117380
                    *                        *CONVERSION ROUTINE        K0117390
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0117400
                    *                                                   K0117410
                    *                                                   K0117420
                    *             PACK AND PRINT ROUTINE                K0117430
                    *                                                   K0117440
                    *                                                   K0117450
                    F1600 DC      0          BSI ADDRESS                K0117460
                          STX   1 F1603+1    SAVE XR1                   K0117470
                    *                                                   K0117480
                          LDX  L3 -80        SET UP TO PACK             K0117490
                          LDX  L1 -40        PRINT BUFFER.              K0117500
                    *                                                   K0117510
                          LD      F1691      MESSAGE ADDRESS(MA)        K0117520
                          A       F1693      MA + 80                    K0117530
                          STO     F1691                                 K0117540
                          A       F1694      MA + 81                    K0117550
                          STO     F1692                                 K0117560
                    *                                                   K0117570
                          LD   L  $PBSY      LOOP IF THE PRINT BUFFER   K0117580
                          BSC  L  *-4,-Z     IS NOT AVAILABLE           K0117590
                    *                                                   K0117600
                    F1601 LD   L3 *-*        LOAD LEFT CHARACTER        K0117610
                    F1691 EQU     *-1                                   K0117620
                          SLA     8          LEFT JUSTIFY               K0117630
                          OR   L3 *-*        ADD  RIGHT CHARACTER       K0117640
                    F1692 EQU     *-1                                   K0117650
                          STO  L1 F1PBF+1+40 STORE IN PRINT BUFFER      K0117660
                          MDX   3 2          NEXT INPUT PAIR            K0117670
                          NOP                                           K0117680
                          MDX   1 1          NEXT OUTPUT WORD           K0117690
                          MDX     F1601      GET NEXT PAIR              K0117700
                    *                                                   K0117710
                          LDD     F1695      PRINT CONTROL              K0117720
                          BSI  L  F1803+1    PRINT LINE                 K0117730
                    F1603 LDX  L1 *-*        RESTORE XR1                K0117740
                          BSC  I  F1600      RETURN                     K0117750
                    *                                                   K0117760
                    F1693 DC      80         USEFUL CONSTANT            K0117770
                    F1694 DC      1          USEFUL CONSTANT            K0117780
                    *                                                   K0117790
                          BSS  E  0                                     K0117800
                    F1695 DC      /7001      PRINT CONTROL PARAMETER    K0117810
                          DC      F1PBF      ADDRESS OF PRINT BUFFER    K0117820
                    *                                                   K0117830
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0117840
                    F2CDA DC      80         READ INPUT BUFFER 2        K0117850
                          BSS     6          *                          K0117860
                          DC      /FFFF      *                          K0117870
                          BSS     73         *                          K0117880
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0117890
                    *                                                   K0117900
                    *     READ    INPUT ROUTINE                         K0117910
                    *                                                   K0117920
                    F1500 DC      *-*        BSI ADDRESS                K0117930
                    *                                                   K0117940
                          STX   1 F1513+1    SAVE XR1                   K0117950
                    *                                                   K0117960
                    *                                                   K0117970
                    *             TEST IF END CARD WAS PREVIOUSLY       K0117980
                    *             PROCESSED                             K0117990
                    *                                                   K0118000
                          LD      F1591+1    WAS PREVIOUS RECORD .END.  K0118010
                    *                                                   K0118020
                          BSC  L  F1035,+-   BRANCH IF YES              K0118030
                    *                                                   K0118040
                    *                                                   K0118050
                          MDX  L  $IBSY,0    CHECK IF I/P SUBR BUSY     K0118060
                          MDX     *-3        LOOP IF BUSY               K0118070
                    *                                                   K0118080
                          MDX  L  $CTSW,0    CHECK IF MON CTL CARD READ K0118090
                          MDX     F1560      BRANCH IF YES              K0118100
                    *                                                   K0118110
                          LD   L  $LAST      LOAD LAST CARD SWITCH      K0118120
                          BSC  L  *+3,+-     BRANCH IF NOT LAST CARD    K0118130
                    *                                                   K0118140
                          LD      F159A      FEED PARAMETER             K0118150
                          BSI  L  F1801+1    FEED LAST CARD             K0118160
                    *                                                   K0118170
                          LDX  I2 F1591+1                               K0118180
                          MDX   2 1          CARD START IN XR2          K0118190
                          STX   2 F1512+1    SAVE XR2                   K0118200
                    *                                                   K0118210
                          LD    2 0          LOAD COL 1                 K0118220
                    *                                                   K0118230
                          S       F1598      IS FIRST COL EBC C         K0118240
                          BSC  L  F1510,+-   BRANCH IF YES              K0118250
                    *                                                   K0118260
                          S       F1599      IS FIRST COL HOL C         K0118270
                          BSC  L  PTCH1      BRANCH TO PATCH AREA   2-3 K0118280
                    *                                                   K0118290
                    BACK  MDX   2 72         CARD START + 72 IN XR2     K0118300
                          STX   2 F1501+1    STORE                      K0118310
                          STX   2 F1504+1    STORE                      K0118320
                          STX   2 BACK1+1   SAVE                    212 K0118330
                          LDX   1 -67       NO.OF COLUMNS TO CHECK  212 K0118340
                          LDX   2 -3         CTL FOR ?END? CHECK        K0118350
                    BACK1 LD   L1 *-*       LOAD CHAR IN COL 6      212 K0118355
                          BNZ     F1510     BRANCH IF CONTINUATION  212 K0118360
                          MDX   1 1         POINT TO COLUMN 7       212 K0118365
                    F1501 LD   L1 *-*        LOAD CHARACTER             K0118370
                          BSC  L  F1506,+-   HOL BLANK                  K0118380
                          S       F1594                                 K0118390
                          BSC  L  F1506,+-   EBC BLANK                  K0118400
                    *                                                   K0118410
                          S    L2 F1595+3    CHECK FOR EBC E,N,D        K0118420
                          BSC  L  F1502,+-   BRANCH IF YES              K0118430
                    *                                                   K0118440
                          S    L2 F1596+3    CHECK FOR HOL E,N,D        K0118450
                          BSC  L  F1510,Z    BRANCH IF NO               K0118460
                    *                                                   K0118470
                    F1502 MDX   2 1          SKIP IF E,N,D ALL CHECKED  K0118480
                          MDX     F1506      BRANCH IF NOT              K0118490
                    *                                                   K0118500
                    F1503 MDX   1 1          SKIP IF ALL CHARS CHECKED  K0118510
                          MDX     F1504      IF NO SKIP, CHECK MORE.    K0118520
                    *                                                   K0118530
                    *             END CARD ENCOUNTERED                  K0118540
                    *                                                   K0118550
                          SLA     16         LOAD ZEROS                 K0118560
                          STO     F1591      STORE INTO RECORD POINTER  K0118570
                          MDX     F1511      EXIT                       K0118580
                    *                                                   K0118590
                    F1504 LD   L1 *-*        LOAD CHARACTER             K0118600
                          BSC  L  F1503,+-   BRANCH IF HOL BLANK        K0118610
                    *                                                   K0118620
                          S       F1594                                 K0118630
                          BSC  L  F1503,+-   BRANCH IF EBC BLANK        K0118640
                          MDX     F1510      EXIT                       K0118650
                    *                                                   K0118660
                    F1506 MDX   1 1          INCREMENT TO NEXT CHAR     K0118670
                          MDX     F1501      GET NEXT  CHARACTER        K0118680
                    *                                                   K0118690
                    F1510 LD      F1591      LOAD READ AREA ADDRESS     K0118700
                          RTE     16         STORE IN Q REGISTER        K0118710
                          LD      F1593      LOAD READ PARAMETER        K0118720
                          BSI  L  F1801+1    READ INPUT CARD            K0118730
                    *                                                   K0118740
                    F1511 LDD     F1591      ROTATE BUFFER POINTER      K0118750
                          RTE     16         *                          K0118760
                          STD     F1591      *                          K0118770
                    *                                                   K0118780
                    F1512 LDX  L2 *-*        RESTORE XR2                K0118790
                    F1513 LDX  L1 *-*        RESTORE XR1                K0118800
                          BSC  I  F1500      RETURN                     K0118810
                    *             CALL FOR RECOVERY PHASE               K0118820
                    *                                                   K0118830
                    F1560 EQU     *                                     K0118840
                          LDX  I2 F1591+1    SAVE INPUT AREA ADDRESS    K0118850
                          STX  L2 FX002      *                          K0118860
                    *                                                   K0118870
                          LD      F1591+1    LOAD BUFFER ADDRESS        K0118880
                          BSI  I  F1802      CONVERT BUFFER             K0118890
                    *                                                   K0118900
                          LDX   1 2          PUT RECOVERY CODE          K0118910
                          STX  L1 FX001-1                               K0118920
                    *                                                   K0118930
                          LDX  I1 F1568      LOAD LINKAGE TO            K0118940
                          LDD     F1569      RECOVERY PHASE             K0118950
                    *                                                   K0118960
                          BSC  L  RL000      LOAD RECOVERY PHASE        K0118970
                    *                                                   K0118980
                    F1568 DC      *-*        CORE ADDRESS RECOVERY PHAS K0118990
                    F1569 BSS  E  2          WC, SA OF RECOVERY PHASE   K0119000
                    *                                                   K0119010
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0119020
                    *                                                   K0119030
                    *             CONSTANTS                             K0119040
                    *                                                   K0119050
                          BSS  E  0                                     K0119060
                    *                                                   K0119070
                    F1591 DC      F1CDA      READ AREA 1                K0119080
                          DC      F2CDA      READ AREA 2                K0119090
                    *                                                   K0119100
                    F1593 DC      /7002      READ PARAMETER             K0119110
                    F1594 DC      /0040      EBC BLANK                  K0119120
                    F1595 DC      .E-/40     EBC E TEST                 K0119130
                          DC      .N-/40     EBC N TEST                 K0119140
                          DC      .D-/40     EBC D TEST                 K0119150
                    *                                                   K0119160
                    F1596 DC      /8100-.E   HOL E TEST                 K0119170
                          DC      /4100-.N   HOL N TEST                 K0119180
                          DC      /8200-.D   HOL D TEST                 K0119190
                    *                                                   K0119200
                    F1598 DC      .C         EBC C TEST                 K0119210
                    F1599 DC      /8400-.C   HOL C TEST                 K0119220
                    *                                                   K0119230
                    F159A DC      /7003      CARD FEED PARAMETER        K0119240
                    *                                                   K0119250
                    *                                                   K0119260
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0119270
                    *                                                   K0119280
                    *             MAIN LINE PROGRAM                     K0119290
                    *                                                   K0119300
                    *                                                   K0119310
                    F1000 BSI     F1500      READ CARD                  K0119320
                    *                                                   K0119330
                    F1001 BSI     F1500      READ CARD                  K0119340
                    *                                                   K0119350
                          STX   2 F1003+1    SAVE XR2                   K0119360
                    *                                                   K0119370
                          LD      F1591      BUFFER ADDRESS             K0119380
                          BSI  I  F1802      CONVERT CARD               K0119390
                    *                                                   K0119400
                          LD   L  F1951      LOAD SWITCH 1              K0119410
                          BSC  L  F1002,Z    BRANCH IF SW1 NON-ZERO     K0119420
                    *                                                   K0119430
                          LD    2 0          LOAD COLUMN 1              K0119440
                    *                                                   K0119450
                          S    L  F1963      IS IT AN *                 K0119460
                          BSC  L  FZ003,+-   BRANCH IF YES (CONTROL CD) K0119470
                    *                                                   K0119480
                          STX  L  F1951      TAG SWITCH 1               K0119490
                    *                                                   K0119500
                          LD   L  FX013      TEST IF SOURCE LIST REQD.  K0119510
                          SLA     10                                    K0119520
                          BSC  L  F1002,-    BRANCH IF NO               K0119530
                    *                                                   K0119540
                          MDX  L  F1700,0   TEST PAGE RESTORE SW   2-11 K0119550
                          MDX     F1002      BR, DON'T RESTORE PAGE     K0119560
                    *                                                   K0119570
                          BSI  L  F1700      RESTORE PAGE               K0119580
                    *                                                   K0119590
                    F1002 EQU     *          CONTINUE                   K0119600
                    *                                                   K0119610
                    F1003 LDX  L2 *-*        RESTORE XR2                K0119620
                    *                                                   K0119630
                          LD   L  F1951      LOAD SWITCH 1              K0119640
                          BSC  L  F1004,+-   BRANCH IF SWITCH 1 NOT ON  K0119650
                    *                                                   K0119660
                          LD   L  FX013      TEST IF SOURCE LIST REQD   K0119670
                          SLA     10                                    K0119680
                          BSC  L  F1005,-    BRANCH IF NOT              K0119690
                    *                                                   K0119700
                          LD   L  $KCSW      TEST IF KB,CP BOTH USED    K0119710
                          BSC  L  F1005,-Z   BRANCH IF BOTH USED        K0119720
                    *                                                   K0119730
                    F1004 LD   I  $CH12      TEST IF CHANNEL 12 SENSED  K0119740
                          BSI  L  F1700,Z    RESTORE PAGE IF YES        K0119750
                    *                                                   K0119760
                          STX  L2 F1691      READ BUFFER ADDRESS        K0119770
                          BSI  L  F1600      PACK AND PRINT MESSAGE     K0119780
                    *                                                   K0119790
                          LD      F1951      LOAD SWITCH 1              K0119800
                          BSC  L  F1001,+-   GO READ A CARD IF NOT SET  K0119810
                    *                                                   K0119820
                    *                                                   K0119830
                    F1005 LD    2 0          IS THIS A COMMENT CARD     K0119840
                          S       F1967                                 K0119850
                          BSC  L  F1006,Z    BRANCH IF NO               K0119860
                    *                                                   K0119870
                          STO     F1952      NORMALIZE SWITCH 2         K0119880
                          MDX     F1001      GET NEXT CARD              K0119890
                    *                                                   K0119900
                    F1006 LD    2 5          TEST FOR CONTINUATION CARD K0119910
                          S       F1965                                 K0119920
                          BSC  L  *+3,+-     BRANCH IF BLANK            K0119930
                          S       F1966                                 K0119940
                          BSC  L  F1016,Z    BRANCH IF NON-ZERO         K0119950
                    *                                                   K0119960
                    *                                                   K0119970
                    *                                                   K0119980
                          STO     F1954      NORMALIZE SWITCH 4         K0119990
                          STO  L  F1959      NORMALIZE SWITCH 9         K0120000
                          STO  L  F1984      CLEAR DATA AREA            K0120010
                    *                                                   K0120020
                    F1007 LDX   3 72         INITIALIZE TO TEST FOR     K0120030
                          STX   2 *+1        BLANK CARD.                K0120040
                    *                                                   K0120050
                          LD   L  *-*        LOAD CARD COLUMN           K0120060
                          S       F1965                                 K0120070
                          BSC  L  *+5,Z      BRANCH IF COLUMN NOT BLANK K0120080
                    *                                                   K0120090
                          MDX  L  *-6,1      INCREMENT TO NEXT COLUMN   K0120100
                          MDX   3 -1         KICK COUNT, SKIP IF ZERO   K0120110
                          MDX     *-9        CHECK NEXT COLUMN          K0120120
                    *                                                   K0120130
                          MDX     F1001      BLANK CARD, GET NEXT       K0120140
                    *                                                   K0120150
                          STX     F1952      SET SWITCH 2               K0120160
                    *                                                   K0120170
                    F1008 SLT     32         INITIALIZE                 K0120180
                          STO     F1969      TO COLLECT                 K0120190
                          LD      F1962      STATEMENT                  K0120200
                          STD     F1972      NUMBERS.                   K0120210
                          LDX   3 5                                     K0120220
                    *                                                   K0120230
                    F1009 LD    2 0          CHECK IF COLUMN BLANK      K0120240
                          S       F1965                                 K0120250
                          BSC  L  F1012,+-   BRANCH IF BLANK            K0120260
                    *                                                   K0120270
                          S       F1966      IS COLUMN ZERO             K0120280
                          BSC  L  F1010,Z    BRANCH IF NON-ZERO         K0120290
                    *                                                   K0120300
                          LD      F1969      IS IT A LEADING ZERO       K0120310
                          BSC  L  F1011,Z    BRANCH IF NO               K0120320
                          MDX     F1012      YES, LEADING ZERO          K0120330
                    *                                                   K0120340
                    F1010 BSC  L  F1030,+    BRANCH IF NON-NUMERIC      K0120350
                          S       F1968                                 K0120360
                          BSC  L  F1030,-Z   BRANCH IF NON-NUMERIC      K0120370
                    *                                                   K0120380
                    F1011 STX     F1969      INDICATE VALID DIGIT       K0120390
                    *                                                   K0120400
                          LDD     F1972      ADD                        K0120410
                          RTE     26         DIGIT                      K0120420
                          STO     F1972      TO                         K0120430
                          LD    2 0          STATEMENT                  K0120440
                          AND     F1961      NUMBER                     K0120450
                          OR      F1972      *                          K0120460
                          STD     F1972      *                          K0120470
                    *                                                   K0120480
                    F1012 MDX   2 1          GO TO NEXT CHARACTER       K0120490
                          MDX   3 -1         SKIP IF THROGH             K0120500
                          MDX     F1009      GET NEXT DIGIT IF NOT      K0120510
                    *                                                   K0120520
                          LD      F1969      IS THERE A STATEMENT NO.   K0120530
                          BSC  L  F1013,+-   BRANCH IF NOT              K0120540
                    *                                                   K0120550
                          LDD     F1972      NORMALIZE                  K0120560
                          RTE     16         STATEMENT                  K0120570
                          SLT     1          NUMBER                     K0120580
                          BSC  L  *-3,-      (PACKED                    K0120590
                          STO     F1972      6 BITS PER                 K0120600
                          SRA     15         DECIMAL CHARACTER)         K0120610
                          SLT     15         *                          K0120620
                          STO     F1972+1    *                          K0120630
                    *                                                   K0120640
                    F1013 MDX   2 1          GET NEXT CHARACTER         K0120650
                    *                                                   K0120660
                          SLA     16         NORMALIZE                  K0120670
                          STO     F1971      CHARACTER COUNT            K0120680
                    *                                                   K0120690
                          LD      F1953      LOAD SWITCH 3              K0120700
                          BSC  L  F1014,+-   BRANCH IF SWITCH 3 NOT SET K0120710
                    *                                                   K0120720
                          BSI  L  F1029      COMPUTE NORM               K0120730
                    *                                                   K0120740
                    F1014 STX     F1953      SET SWITCH 3               K0120750
                    *                                                   K0120760
                    *             (XR1 POINTS AT SOFS)                  K0120770
                    *                                                   K0120780
                          STX   1 F1970                                 K0120790
                          SLA     16                                    K0120800
                          BSI  L  F1050      GO TO PUT ID WORD          K0120810
                    *                                                   K0120820
                          LD      F1969      LOAD STATEMENT NO. IND     K0120830
                          BSC  L  F1015,+-   BRANCH IF NO STATEMENT NO. K0120840
                    *                                                   K0120850
                          LD   I  F1970      INDICATE                   K0120860
                          OR      F1962      STATEMENT                  K0120870
                          STO  I  F1970      NUMBER                     K0120880
                    *                                                   K0120890
                          LD      F1972      PUT                        K0120900
                          BSI  L  F1050      STATEMENT                  K0120910
                          LD      F1972+1    NUMBER.                    K0120920
                          BSI  L  F1050      *                          K0120930
                    *                                                   K0120940
                    F1015 SLA     16                                    K0120950
                          STO     F1955      NORMALIZE SWITCH 5         K0120960
                          STO     F1956      NORMALIZE SWITCH 6         K0120970
                          STO     F1957      NORMALIZE SWITCH 7         K0120980
                          STO  L  F1991      NORMALIZE FCCT             K0120990
                          MDX     F1017      CONTINUE                   K0121000
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0121010
                    *                                                   K0121020
                    *             CONSTANTS, STORAGE, AND SWITCHES      K0121030
                    *                                                   K0121040
                    F1951 DC      0          SWITCH 1                   K0121050
                    F1952 DC      0          SWITCH 2                   K0121060
                    F1953 DC      0          SWITCH 3                   K0121070
                    F1954 DC      0          SWITCH 4                   K0121080
                    F1955 DC      0          SWITCH 5                   K0121090
                    F1956 DC      0          SWITCH 6                   K0121100
                    F1957 DC      0          SWITCH 7                   K0121110
                    *                                                   K0121120
                    F1961 DC      /003F      MASK FOR STM NO. PACKING   K0121130
                    *                                                   K0121140
                    F1962 DC      1          USEFUL CONSTANT            K0121150
                    *                                                   K0121160
                    F1963 DC      .*         * TEST                     K0121170
                    *                                                   K0121180
                    *                                                   K0121190
                    F1965 DC      /0040      EBC BLANK TEST             K0121200
                    F1966 DC      /F0-/40    EBC ZERO TEST              K0121210
                    F1968 DC      /F9-/F0    DIGIT TEST                 K0121220
                    *                                                   K0121230
                    F1969 DC      0          STATEMENT NO.TEST          K0121240
                    *                                                   K0121250
                    F1970 DC      0          ID SAVE WORD               K0121260
                    *                                                   K0121270
                    F1967 DC      .C         C TEST                     K0121280
                    *                                                   K0121290
                    F1971 DC      0          CHARACTER COUNT            K0121300
                    *                                                   K0121310
                          BSS  E  0                                     K0121320
                    F1972 DC      0          STATEMENT NUMBER           K0121330
                          DC      0          COLLECTION AREA            K0121340
                    *                                                   K0121350
                    *                                                   K0121360
                    *                                                   K0121370
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0121380
                    *                                                   K0121390
                    F1016 LD      F1954      LOAD SWITCH 4              K0121400
                          BSC  L  F1001,Z    BRANCH IF SW 4 SET         K0121410
                    *                                                   K0121420
                          LD      F1952      LOAD SWITCH 2              K0121430
                          BSC  L  F1031,+-   BRANCH TO ERROR IF NOT SET K0121440
                    *                                                   K0121450
                          MDX  L  F1971,1    INCREMENT CHARACTER COUNT  K0121460
                    *                                                   K0121470
                          LD      F1971      ERROR IF COUNT IS GREATER  K0121480
                          S       F1985      *THAN 6.                   K0121490
                          BSC  L  F1054,-    *                          K0121500
                    *                                                   K0121510
                          MDX   2 6          MV PT TO CD COLUMN SEVEN   K0121520
                    *                                                   K0121530
                    *                                                   K0121540
                    *                                                   K0121550
                    F1017 LDX   3 66         INITIALIZE TO PACK RECORD  K0121560
                    *                                                   K0121570
                    F1018 LD      F1956      LOAD SWITCH 6              K0121580
                          BSC  L  F1021,Z    BRANCH IF SWITCH 6 SET     K0121590
                    *                                                   K0121600
                    F1019 LD    2 0          IS COLUMN BLANK            K0121610
                          S       F1965                                 K0121620
                          BSC  L  F1021,Z    BRANCH IF NOT BLANK        K0121630
                    *                                                   K0121640
                    F1020 MDX   2 1          INCR TO NEXT COLUMN        K0121650
                    *                                                   K0121660
                          MDX   3 -1         SKIP IF WHOLE CARD CHECKED K0121670
                          MDX     F1018      CHECK NEXT COLUMN          K0121680
                    *                                                   K0121690
                          BSC  L  F1001      READ NEXT CARD             K0121700
                    *                                                   K0121710
                    F1021 LD      F1959      LOAD SWITCH 9              K0121720
                          BSC  L  F1028,Z    BRANCH IF SWITCH 9 SET     K0121730
                    *                                                   K0121740
                    F1022 MDX  L  F1984,/10  CDATA = CDATA + /10        K0121750
                    *                                                   K0121760
                          LD      F1957      LOAD SWITCH 7              K0121770
                          BSC  L  F1023,Z    BRANCH IF SWITCH 7 SET     K0121780
                    *                                                   K0121790
                          LD    2 0          PUT                        K0121800
                          SLA     8          LEFT                       K0121810
                          OR      F1965      CHARACTER.                 K0121820
                          BSI  L  F1050      *                          K0121830
                    *                                                   K0121840
                          STX     F1957      SET SWITCH 7               K0121850
                          MDX     F1020      GET NEXT CHARACTER         K0121860
                    *                                                   K0121870
                    F1023 SLA     16         NORMALIZE                  K0121880
                          STO     F1957      SWITCH 7                   K0121890
                    *                                                   K0121900
                          LD    1 -1         ADD                        K0121910
                          AND     F1995      RIGHT                      K0121920
                          OR    2 0          CHARACTER                  K0121930
                          STO   1 -1         *                          K0121940
                    *                                                   K0121950
                          LD      F1984      LD CDATA                   K0121960
                          S       F1965                                 K0121970
                          BSC  L  F1027,+-   BRANCH IF EQ TO /40        K0121980
                    *                                                   K0121990
                    F1024 LD      F1955      LOAD SWITCH 5              K0122000
                          BSC  L  F1020,Z    BRANCH IF SWITCH 5 SET     K0122010
                    *                                                   K0122020
                          MDX  L  F1991,1    INCREMENT FORMAT COUNT     K0122030
                    *                                                   K0122040
                          LD      F1991      IS CHARACTER               K0122050
                          A       F1993      PART OF                    K0122060
                          STO     *+1        FORMAT                     K0122070
                          LD   L  *-*        *                          K0122080
                          S     1 -1         *                          K0122090
                          BSC  L  F1025,+-   BRANCH IF YES              K0122100
                    *                                                   K0122110
                          STX     F1955      TAG SWITCH 5               K0122120
                          MDX     F1020      CONTINUE TO PACK           K0122130
                    *                                                   K0122140
                    F1025 LD      F1991      LOAD FORMAT COUNT          K0122150
                          S       F1992                                 K0122160
                          BSC  L  F1020,Z    BRANCH IF NOT EQUAL TO 3   K0122170
                    *                                                   K0122180
                    F1026 MDX   1 -3         XR1 = XR1-3                K0122190
                    *                                                   K0122200
                          LD   I  F1970      SET                        K0122210
                          OR      F1990+3    FORMAT                     K0122220
                          STO  I  F1970      STATEMENT ID.              K0122230
                    *                                                   K0122240
                          STX     F1956      TAG SWITCH 6               K0122250
                          MDX     F1020      CONTINUE, DON>T PACK FMT   K0122260
                    *                                                   K0122270
                    *             DATA STATEMENT                        K0122280
                    *                                                   K0122290
                    F1027 LD    1 -1         ARE SECOND PAIR OF         K0122300
                          S       F1982      CHARACTERS EQ TO (TA)      K0122310
                          BSC  L  F1024,Z    BRANCH IF NO               K0122320
                    *                                                   K0122330
                          LD    1 -2         ARE FIRST PAIR OF          K0122340
                          S       F1981      CHARACTERS EQ TO (DA)      K0122350
                          BSC     +-         SKIP IF NO                 K0122360
                    *                                                   K0122370
                          STX     F1959      TAG SWITCH 9               K0122380
                    *                                                   K0122390
                          MDX     F1024      CONTINUE WITH PACK RTN.    K0122400
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0122410
                    *                                                   K0122420
                    *             CONSTANTS, WORK AREAS AND SWITCHES    K0122430
                    *                                                   K0122440
                    F1981 DC      /C4C1      DA TEST                    K0122450
                    F1982 DC      /E3C1      TA TEST                    K0122460
                    *                                                   K0122470
                    F1983 DC      /7D        QUOTE TEST                 K0122480
                    *                                                   K0122490
                    F1984 DC      *-*        DATA WORK AREA             K0122500
                    *                                                   K0122510
                    F1959 DC      *-*        SWITCH 9                   K0122520
                    *                                                   K0122530
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0122540
                    *                                                   K0122550
                    F1028 LD    2 0          IS CHARACTER A QUOTE       K0122560
                          S       F1983                                 K0122570
                          BSC  L  F1022,Z    BRANCH IF NO               K0122580
                    *                                                   K0122590
                    *                                                   K0122600
                          LD      F1956      LOAD SWITCH 6              K0122610
                          EOR     *          REVERSE SWITCH 6           K0122620
                          STO     F1956      STORE                      K0122630
                          MDX     F1022      CONTINUE                   K0122640
                    *                                                   K0122650
                    F1029 DC      0          BSI ADDRESS                K0122660
                          LD    1 -1         ELIMINATE                  K0122670
                          S       F1994      TRAILING                   K0122680
                          BSC  L  *+2,Z      BLANKS                     K0122690
                          MDX   1 -1         *                          K0122700
                          MDX     *-6        *                          K0122710
                    *                                                   K0122720
                          STX   1 F1986      COMPUTE                    K0122730
                          LD      F1986      NORM                       K0122740
                          S       F1970      *                          K0122750
                          SLA     2          *                          K0122760
                          OR   I  F1970      *                          K0122770
                    *                                                   K0122780
                          STO  I  F1970      STORE NORM IN IDSAVY       K0122790
                    *                                                   K0122800
                          BSC  I  F1029      RETURN                     K0122810
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0122820
                    *                                                   K0122830
                    *             CONSTANTS AND WORK AREAS              K0122840
                    *                                                   K0122850
                    F1985 DC      6          USEFUL CONSTANT            K0122860
                    *                                                   K0122870
                    F1986 DC      0          WORK WORD                  K0122880
                    *                                                   K0122890
                    F1987 DC      0          ERNO                       K0122900
                    F1988 DC      /A008      ERROR ID                   K0122910
                    *                                                   K0122920
                    F1989 DC      0          OVERLAP COUNTER            K0122930
                    *                                                   K0122940
                    F1990 DC      /C6D6      FO                         K0122950
                          DC      /D9D4      RM                         K0122960
                          DC      /C1E3      AT                         K0122970
                          DC      /6000      FORMAT ID WORD             K0122980
                    *                                                   K0122990
                    F1991 DC      0          FORMAT COUNT               K0123000
                    *                                                   K0123010
                    F1992 DC      3          USEFUL CONSTANT            K0123020
                    *                                                   K0123030
                    F1993 DC      F1990-1    COMPARE POINTER FOR FORMAT K0123040
                    *                                                   K0123050
                    F1994 DC      /4040      BLANK TEST                 K0123060
                    *                                                   K0123070
                    F1995 DC      /FF00      MASK WORD                  K0123080
                    *                                                   K0123090
                    F1996 DC      /1000      END STATEMENT ID           K0123100
                    *                                                   K0123110
                    *                                                   K0123120
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0123130
                    *                                                   K0123140
                    F1030 LDX   3 1          SET ERROR NUMBER           K0123150
                          STX   3 F1987      EQUAL TO /                 K0123160
                          MDX     F1032      GO TO ERROR                K0123170
                    *                                                   K0123180
                    F1031 LDX   3 2          SET ERROR NUMBER           K0123190
                          STX   3 F1987      EQUAL TO 2                 K0123200
                    *                                                   K0123210
                    F1032 LD   L  F1953      LOAD SWITCH 3              K0123220
                          BSC  L  F1033,+-   BRANCH IF SWITCH 3 NOT SET K0123230
                    *                                                   K0123240
                          BSI     F1029      COMPUTE NORM               K0123250
                    *                                                   K0123260
                    F1033 LD      F1988      PUT ERROR ID               K0123270
                          BSI     F1050                                 K0123280
                    *                                                   K0123290
                          LD      F1987      PUT ERROR NUMBER           K0123300
                          BSI     F1050                                 K0123310
                    *                                                   K0123320
                    F1034 STX  L  F1954      TAG SWITCH 4               K0123330
                    *                                                   K0123340
                          SLA     16         NORMALIZE SWITCH 3         K0123350
                          STO  L  F1953                                 K0123360
                          BSC  L  F1001      GET NEXT CARD              K0123370
                    *                                                   K0123380
                    F1035 LD   L  F1953      LOAD SWITCH 3              K0123390
                          BSC  L  F1036,+-   BRANCH IF NOT SET          K0123400
                    *                                                   K0123410
                          BSI     F1029      COMPUTE NORM               K0123420
                    *                                                   K0123430
                    F1036 LD      F1996      LOAD END ID                K0123440
                          STX  L1 FX002      SET END OF STRING POINTER  K0123450
                    *                                                   K0123460
                          BSI     F1050      PUT END STATEMENT ID       K0123470
                    *                                                   K0123480
                    *                                                   K0123490
                    *             MODIFY END OF SYMBOL TABLE ADDRESS    K0123500
                    *             FOR SUBSEQUENT PHASES.                K0123510
                    *                                                   K0123520
                          LDX  I1 FX007      LOAD SYMBOL TABLE END ADDR K0123530
                          MDX  L1 ADSTF      MODIFY                     K0123540
                          STX  L1 FX007      RETURN TO FCOM             K0123550
                    *                                                   K0123560
                    *                                                   K0123570
                    *                                                   K0123580
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0123590
                    *                                                   K0123600
                          LDX  I1 F1038      LOAD LINKAGE TO            K0123610
                          LDD     F1039      NEXT PHASE.                K0123620
                    *                                                   K0123630
                          BSC  L  RL000      GO TO NEXT PHASE           K0123640
                    *                                                   K0123650
                    F1038 DC      *-*        CORE ADDRESS NEXT PHASE    K0123660
                    F1039 BSS  E  2          WC, SA OF NEXT PHASE       K0123670
                    *                                                   K0123680
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0123690
                    *             THE FOLLOWING SUBROUTINE PUTS THE     K0123700
                    *             WORD THAT IS IN THE A REGISTER ON THE K0123710
                    *             STRING THAT IS INDICATED BY INDEX     K0123720
                    *             REGISTER 1.  ENTRY IS A BSI           K0123730
                    *             INSTRUCTION TO THE LABEL (F1050).     K0123740
                    *             INDEX REGISTER 1 IS INCREMENTED BY    K0123750
                    *             1 UPON EXITING.                       K0123760
                    *                                                   K0123770
                    *                                                   K0123780
                    F1050 DC      0          BSI ADDRESS                K0123790
                    F1051 STO   1 0          STORE A REGISTER IN STRING K0123800
                    *                                                   K0123810
                    F1052 MDX   1 1          MOVE POINTER (XR1)         K0123820
                    *                                                   K0123830
                          STX   1 F1989      CHECK FOR                  K0123840
                          LD      F1989      OVERLAP                    K0123850
                          S    L  FX007      ERROR.                     K0123860
                    *                                                   K0123870
                          BSC  L  F1053,+Z   BRANCH IF NO ERROR         K0123880
                    *                                                   K0123890
                          LD   L  F1962      SET OVERLAP                K0123900
                          STO  L  FX010      ERROR INDICATOR            K0123910
                    *                                                   K0123920
                          LD      F1051      SET UP TO NO LONGER        K0123930
                          STO     F1052      INCREMENT XR1              K0123940
                    *                                                   K0123950
                    *                                                   K0123960
                    F1053 BSC  I  F1050      RETURN                     K0123970
                    *                                                   K0123980
                    *                                                   K0123990
                    F1054 LDX   3 2          SET ERROR NUMBER           K0124000
                          STX   3 F1987      EQUAL TO 2.                K0124010
                    *                                                   K0124020
                          LDX  I1 F1970      XR1 = CONTENTS OF IDSAV    K0124030
                    *                                                   K0124040
                          LD    1 0                                     K0124050
                          BSC  L  *+1,E      BRANCH IF STATEMENT NUMBRD K0124060
                          MDX     F1033      BRANCH IF NOT              K0124070
                    *                                                   K0124080
                    *                                                   K0124090
                          LD      F1999      PUT OUT ERROR ID FOR       K0124100
                          STO   1 0          STM NO.                    K0124110
                    *                                                   K0124120
                          LD      F1987      PUT OUT ERROR NO           K0124130
                          STO   1 3                                     K0124140
                    *                                                   K0124150
                          MDX   1 4          INCREMENT POINTER          K0124160
                    *                                                   K0124170
                          MDX     F1034      GO SET SWITCH 4            K0124180
                    *                                                   K0124190
                    F1999 DC      /A011      ERROR ID                   K0124200
                    *                                                   K0124210
                    PTCH1 BSC  L  F1510,+-   BRANCH IF YES          2-3 K0124220
                          S       TEST1      IS FIRST COL ASTERISK  2-3 K0124230
                          BSC  L  F1510,+-   BRANCH IF YES          2-3 K0124240
                          S       TEST2      IS FIRST COL ASTERISK  2-3 K0124250
                          BSC  L  F1510,+-   BRANCH IF YES          2-3 K0124260
                          BSC  L  BACK       BRANCH BACK            2-3 K0124270
                    *                                                   K0124280
                    TEST1 DC      .*-/8400   EBC ASTERISK TEST      2-3 K0124290
                    TEST2 DC      /4220-.*   HOL ASTERISK TEST      2-3 K0124300
                          BSS     OVERP-1-*  PATCH AREA                 K0124310
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0124320
                    *                                                   K0124330
                    *                                                   K0124340
                    F1803 EQU     OVERP+2    THIS SPACE WILL CONTAIN    K0124350
                    *                        THE SYSTEM PRINT ROUTINE   K0124360
                    *                                                   K0124370
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0124380
                    *                                                   K0124390
                    *             HEADER AREA                           K0124400
                    *                                                   K0124410
                          ORG     HEAD-1                                K0124420
                          DC      47         WORD COUNT FOR HEADER READ K0124430
                          DC      *-*        SECTOR ADDRESS FOR HEADER  K0124440
                    *                                                   K0124450
                    *             HEADER WORD COUNT OVERLAYS THE SECTOR K0124460
                    *             ADDRESS AFTER THE HEADER IS LOADED.   K0124470
                    *             HEADER WORD COUNT MUST BE AT AN       K0124480
                    *             ODD CORE LOCATION                     K0124490
                    *                                                   K0124500
                          BSS     47         HEADER AREA                K0124510
                    *                                                   K0124520
                          HDNG    1130 FORTRAN COMPILER PHASE  1        K0124530
                    *************************************************** K0124540
                    *                                                 * K0124550
                    *FORTRAN INTERPHASE ROLLER AND DUMP CONTROL SUBR  * K0124560
                    *                                                 * K0124570
                    *************************************************** K0124580
                    *STATUS-VERSION 2, MODIFICATION 0                 * K0124590
                    *                                                 * K0124600
                    *FUNCTION/OPERATION                               * K0124610
                    *   * DUMP THE STRING AREA, SYMBOL TABLE AREA AND * K0124620
                    *     FCOM FOR PHASE JUST COMPLETED ON REQUEST.   * K0124630
                    *                                                 * K0124640
                    *   * LOAD THE PHASE REQUESTED FROM ENTRY LINKAGE * K0124650
                    *     AND THEN TRANSFER CONTROL TO IT.            * K0124660
                    *                                                 * K0124670
                    *ENTRY POINTS-                                    * K0124680
                    *   * RL000- (OTHERWISE KNOWN AS ROL). THE CALLING* K0124690
                    *            SEQUENCE IS-                         * K0124700
                    *               LDX  L1 ADDR1                     * K0124710
                    *               LDD     ADDR2                     * K0124720
                    *               BSC  L  RL000                     * K0124730
                    *            WHERE ADDR1 IS THE LOAD ADDRESS OF   * K0124740
                    *            THE PHASE TO BE LOADED, AND ADDR2 IS * K0124750
                    *            A TWO WORD LOCATION CONTAINING THE   * K0124760
                    *            WORD COUNT AND SECTOR ADDRESS OF THE * K0124770
                    *            PHASE TO BE LOADED.                  * K0124780
                    *   * NOTE-                                       * K0124790
                    *      IF UPON ENTRY TO THE ROLLER SUBROUTINE THE * K0124800
                    *      CONSOLE ENTRY SWITCHES ARE SET EQUAL TO    * K0124810
                    *      THE PHASE ID ( E.G. /001F = PHASE 1) THEN  * K0124820
                    *      THE STRING AREA, THE SYMBOL TABLE AREA AND * K0124830
                    *      FCOM FOR THE PHASE NOW IN CORE ARE DUMPED  * K0124840
                    *      ON THE PRINCIPAL PRINTER PRIOR TO THE      * K0124850
                    *      LOADING OF THE NEXT PHASE.                 * K0124860
                    *                                                 * K0124870
                    *INPUT- NONE                                      * K0124880
                    *                                                 * K0124890
                    *OUTPUT-                                          * K0124900
                    *   * DUMP OF WORK AREAS ON REQUEST - XR3 CONTAINS* K0124910
                    *     PHASE ID OF DUMPED PHASE.                   * K0124920
                    *EXTERNAL REFERENCES-                             * K0124930
                    *   SUBROUTINES-                                  * K0124940
                    *      * DZ000-                                   * K0124950
                    *      * DUMP -                                   * K0124960
                    *   COMMA/DCOM                                    * K0124970
                    *      * PHASE- NO. OF PHASE NOW IN CORE          * K0124980
                    *   FCOM                                          * K0124990
                    *      * SOFS - START OF STRING                   * K0125000
                    *      * EOFS - END OF STRING                     * K0125010
                    *      * EOFST- END OF SYMBOL TABLE               * K0125020
                    *      * DFCNT- END OF FCOM                       * K0125030
                    *                                                 * K0125040
                    *TABLES/WORK AREAS- NONE                          * K0125050
                    *                                                 * K0125060
                    *ATTRIBUTES-                                      * K0125070
                    *   NOT OVERLAYED BY ANY PHASE, NOT USED BY PHASE * K0125080
                    *   27 *RECOVERY).                                * K0125090
                    *                                                 * K0125100
                    *NOTES- N/A                                       * K0125110
                    *************************************************** K0125120
                    *                                                   K0125130
                          ORG     RL000                                 K0125140
                    *                                                   K0125150
                    *                                                   K0125160
                    ROL   EQU     *                                     K0125170
                          STX   1 RL952+1    SAVE CA OF NEXT PHASE      K0125180
                          STD     RL950      SAVE WC AND SA NEXT PHASE  K0125190
                    *                                                   K0125200
                    RL001 EQU     *                                     K0125210
                    *                                                   K0125220
                    *             TO ENABLE THE INTERPHASE DUMP,    2-1 K0125230
                    *             CHANGE THE FOLLOWING INSTRUCTION  2-1 K0125240
                    *             TO AN XIO   RL930  (0833)         2-1 K0125250
                    *             WHICH READS THE CONSOLE SWITCHES  2-1 K0125260
                          NOP                                       2-1 K0125270
                    *                                                   K0125280
                          LD      RL940      LOAD SWITCH VALUE          K0125290
                          S    L  $PHSE      SUBTRACT PHASE NUMBER      K0125300
                          BSC  L  RL010,Z    BRANCH IF NO DUMP DESIRED  K0125310
                    *                                                   K0125320
                          LDX  I3 $PHSE      PLACE PHASE ID INTO XR3    K0125330
                    *                                                   K0125340
                          LD   L  FX002      END OF STRING AREA         K0125350
                          RTE     16                                    K0125360
                          LD   L  FX001      START OF STRING AREA       K0125370
                          BSI     RL050      DUMP STRING AREA           K0125380
                    *                                                   K0125390
                          LD      RL951      END OF FCOM                K0125400
                          RTE     16                                    K0125410
                          LD   L  FX007      END OF SYMBOL TABLE AREA   K0125420
                    *                                                   K0125430
                    *                        DUMP SYMBOL TABLE AND      K0125440
                          BSI     RL050      FORTRAN COMMUNICATION AREA K0125450
                    *                                                   K0125460
                    *                                                   K0125470
                          WAIT               PAUSE AFTER DUMP           K0125480
                    *                                                   K0125490
                    *                                                   K0125500
                    RL010 LDD     RL950      WC & SA FOR PHASE LOAD     K0125510
                          STD  I  RL952+1    STORE IN PHASE AREA        K0125520
                    *                                                   K0125530
                          MDX  L  $PBSY,0    SKIP IF PRINTER READY      K0125540
                          MDX     *-3        LOOP IF PRINTER BUSY       K0125550
                    *                                                   K0125560
                          LDD     RL952      DISK CONTROL FOR LOAD      K0125570
                          BSI  L  DZ000      LOAD NEXT PHASE            K0125580
                    *                                                   K0125590
                    *                                                   K0125600
                          MDX  L  $DBSY,0    LOOP IF DISK IS            K0125610
                          MDX     *-3        STILL BUSY.                K0125620
                    *                                                   K0125630
                          LDX  I1 RL952+1    SET UP ADDRESS OF NEXT     K0125640
                          MDX   1 2          PHASE IN XR1.              K0125650
                          BSC  L1 0          GO TO NEXT PHASE           K0125660
                    *                                                   K0125670
                    RL940 DC      *-*        DATA ENTRY READ AREA       K0125680
                    RL951 DC      FX015      END OF FORTRAN COMM AREA   K0125690
                    *                                                   K0125700
                    *                                                   K0125710
                    RL050 EQU     *          DUMP CONTROL ROUTINE       K0125720
                    *                                                   K0125730
                          DC      *-*        BSI ADDRESS                K0125740
                          STD     RL051      STORE DUMP LIMITS          K0125750
                          BSI  L  $DUMP      DUMP REQUIRED WORDS        K0125760
                          DC      0          HEX FORMAT                 K0125770
                    RL051 DC      *-*        LOW LIMIT                  K0125780
                          DC      *-*        HIGH LIMIT                 K0125790
                    *                                                   K0125800
                          BSC  I  RL050      RETURN                     K0125810
                    *                                                   K0125820
                    *                                                   K0125830
                          BSS  E  0          CONSTANTS AND STORAGE      K0125840
                    *                                                   K0125850
                    *                                                   K0125860
                    RL950 DC      *-*        WC PHASE TO BE LOADED      K0125870
                          DC      *-*        SA PHASE TO BE LOADED      K0125880
                    *                                                   K0125890
                    *                                                   K0125900
                    RL952 DC      /7000      DISK CONTROL FOR           K0125910
                          DC      *-*        PHASE LOAD                 K0125920
                    *                                                   K0125930
                    *                                                   K0125940
                    RL930 DC      RL940      IOCC FOR READING           K0125950
                          DC      /3A00      DATA ENTRY SWITCHES.       K0125960
                    *                                                   K0125970
                          HDNG    1130 FORTRAN COMPILER PHASE 1         K0125980
                    *                                                   K0125990
                    *             ILS4 INTERRUPT BRANCH TABLE           K0126000
                    *                                                   K0126010
                    *                                                   K0126020
                          ORG     I4900                                 K0126030
                    *                                                   K0126040
                          DC      0          RESERVED                   K0126050
                    *                                                   K0126060
                          DC      0          RESERVED                   K0126070
                    *                                                   K0126080
                          DC      0          RESERVED                   K0126090
                    *                                                   K0126100
                          DC      0          1231 - NOT USED            K0126110
                    *                                                   K0126120
                          DC      F1803+4    1403 PRINTER               K0126130
                    *                                                   K0126140
                          DC      F1801+4    2501 CARD READER           K0126150
                    *                                                   K0126160
                          DC      F1801+4    1442 CARD READER/PUNCH     K0126170
                    *                                                   K0126180
                    I4907 DC      *-*        KEYBOARD/CONSOLE PRINTER   K0126190
                    *                                                   K0126200
                          DC      F1801+4    1134/1055 PAPERTAPE RD/PCH K0126210
                    *                                                   K0126220
                    *                                                   K0126230
                          END     FZ000-2                               K0126240
