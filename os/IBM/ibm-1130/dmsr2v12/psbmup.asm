                          HDNG    MUP - RESIDENT MONITOR                PS100010
                          ABS                                           PS100020
                    $CIBA EQU     /5   ADDR OF CIB ON MASTER CARTRIDGE  PS100030
                    $CH12 EQU     /6   CHANNEL 12 INDR,NON-ZERO=CHAN 12 PS100040
                    $COMN EQU     /7   WORD COUNT OF COMMON             PS100050
                    $CORE EQU     /E   CORE SIZE,/1000=4K,/2000=8K,ETC. PS100060
                    $CTSW EQU     /F   MCR SW,NON-ZERO=// RECD TRAPPED  PS100070
                    $DADR EQU     /10  SCTR ADDR OF PROG TO BE FETCHED  PS100080
                    $DABL EQU     /11  IOCC FOR SCA RESET (ODD ADDR)    PS100090
                    $DREQ EQU     /12  INDR FOR REQUESTED V. DISK I/O   PS100100
                    $IBSY EQU     /13  PRINC I/O BUSY INDR,NON-ZERO=BSY PS100110
                    $HASH EQU     /14  WORK AREA FOR MONITOR PROGRAMS   PS100120
                    $PRET EQU     /28  ADDR PREOPERATIVE ERROR TRAP     PS100130
                    $IREQ EQU     /2C  ADDR OF INT REQUEST SUBROUTINE   PS100140
                    $ULET EQU     /2D  ADDR OF LET, LOGICAL DRIVE 0     PS100150
                    $IOCT EQU     /32  IOCS CTR,0=NO I/O IN PROGRESS    PS100160
                    $LAST EQU     /33  LAST CD INDR,NON-ZERO=LAST CARD  PS100170
                    $NDUP EQU     /34  INHIBIT DUP SW,NON-ZERO=NO DUP   PS100180
                    $NXEQ EQU     /35  INHIBIT EXEC SW,NON-ZERO=NO EXEC PS100190
                    $PBSY EQU     /36  PRINC PTR BUSY INDR,NON-ZERO=BSY PS100200
                    $PGCT EQU     /37  PAGE NO. FOR PAGE HEADINGS       PS100210
                    $EXIT EQU     /38  ADDR CALL EXIT ENTRY POINT       PS100220
                    $LINK EQU     /39  ADDR CALL LINK ENTRY POINT       PS100230
                    $DUMP EQU     /3F  ADDR OF CALL DUMP, ENTRY POINT   PS100240
                    $DCDE EQU     /77  DRIVE CODE FOR CORE LOAD BLDR    PS100250
                    $PHSE EQU     /78  NO. OF PHASE CURRENTLY IN CORE   PS100260
                    $UFIO EQU     /79  ARM POSITION IN UNFORMATTED AREA PS100270
                    $WSDR EQU     /7A  WORKING STORAGE DRIVE CODE       PS100280
                    $WRD1 EQU     /7B  LOAD ADDR FOR CURR USER CORE LD  PS100290
                    $KCSW EQU     /7C  INHIBIT INPUT/PRINT OVERLAP SW   PS100300
                    $UFDR EQU     /7D  UNFORMATTED I/O DRIVE CODE       PS100310
                    $CPTR EQU     /7E  CHANNEL 12 INDICATOR FOR CP      PS100320
                    $1132 EQU     /7F  CHANNEL 12 INDICATOR FOR 1132    PS100330
                    $1403 EQU     /80  CHANNEL 12 INDICATOR FOR 1403    PS100340
                    $PST1 EQU     /81  ADDR POSTOP ERROR TRAP,LEVEL 1   PS100350
                    $PST2 EQU     /85  ADDR POSTOP ERROR TRAP,LEVEL 2   PS100360
                    $PST3 EQU     /89  ADDR POSTOP ERROR TRAP,LEVEL 3   PS100370
                    $PST4 EQU     /8D  ADDR POSTOP ERROR TRAP,LEVEL 4   PS100380
                    $STOP EQU     /91  ADDR PROGRAM STOP KEY TRAP       PS100390
                    $FPAD EQU     /95  FILE PROTECT ADDR (ADJ),LOG DR 0 PS100400
                    $CYLN EQU     /9A  ARM POSITION FOR LOGICAL DRIVE 0 PS100410
                    $ACDE EQU     /9F  AREA CODE FOR LOGICAL DRIVE 0    PS100420
                    $DCYL EQU     /A4  1ST DEF CYL ADDR, LOGICAL DR 0   PS100430
                    $I200 EQU     /B3  ENTRY POINT TO ILS FOR LEVEL 2   PS100440
                    $I205 EQU     /B8                                   PS100450
                    $IBT2 EQU     $I205+1   ADDR OF IBT FOR LEVEL 2     PS100460
                    $I400 EQU     /C4  ENTRY POINT TO ILS FOR LEVEL 4   PS100470
                    $I405 EQU     /D3                                   PS100480
                    $IBT4 EQU     $I405+1   ADDR OF IBT FOR LEVEL 4     PS100490
                    $I410 EQU     /D5                                   PS100500
                    $DBSY EQU     /EE  DISK BUSY INDR,NON-ZERO=DK BUSY  PS100510
                    $BYSW EQU     /1CB BYPASS SW,NOP IF FETCHING SOCAL  PS100520
                    DZ000 EQU     /0F2 DISKZ ENTRY POINT                PS100530
                    $ZEND EQU     /1E0 ADDR 1+LAST WORD OF DISKZ        PS100540
                          HDNG          CONCATENATED COMMON AREA(CATCO) PS100550
                    C     EQU     /7FA0     CATCO POINTER SET TO MIDDLE PS100560
                    *************************************************** PS100570
                    *                                                 * PS100580
                    *  INDEX REG 1 IS SET TO .C. WHEN CATCO IS FORMED * PS100590
                    *  FOR USE BY ALL OF DUP FUNCTIONS. ANY DUP ROUT  * PS100600
                    *  USING XR 1 FOR OTHER REASONS MUST RESTORE.     * PS100610
                    *  ALL VALUES IN CATCO HAVE LABELS EQUATED TO THE * PS100620
                    *  VALUE THAT INDICATES THEIR RELATIVE LOCATION   * PS100630
                    *  FROM .C.                                       * PS100640
                    *                                                 * PS100650
                    *************************************************** PS100660
                    *                                                 * PS100670
                    *             CATCO DCOM IMAGE                    * PS100680
                    *   EQUIVALENCES USED TO REFERENCE CATCO WITH XR1 * PS100690
                    *                                                 * PS100700
                    *************************************************** PS100710
                    #NAME EQU     4-/80     NAME OF PROGRAM             PS100720
                    #DBCT EQU     6-/80     DISK BLOCK COUNT OF PROGRAM PS100730
                    #FCNT EQU     7-/80     FILES SW,ZERO = NO FILES    PS100740
                    #SYSC EQU     8-/80     NON-ZERO,SYSTEM CARTRIDGE   PS100750
                    #JBSW EQU     9-/80     JOB SW,NON-ZERO='T' MODE    PS100760
                    #CBSW EQU     10-/80    CLB SW,NON-ZERO=STORECI     PS100770
                    #LCNT EQU     11-/80    NO. OF LOCALS               PS100780
                    #MPSW EQU     12-/80    NON-ZERO, CORE MAP DESIRED  PS100790
                    #MDF1 EQU     13-/80    NO. OF DUP CTRL RCDS        PS100800
                    #MDF2 EQU     14-/80    ADDR OF MODIF BUFFER        PS100810
                    #NCNT EQU     15-/80    NO. OF NOCALS               PS100820
                    #ENTY EQU     16-/80    RELATIVE ENTRY ADDR OF PROG PS100830
                    #RP67 EQU     17-/80    IF NON-ZERO,1442 MOD 6,7    PS100840
                    *                                                   PS100850
                    *   NEGATIVE VALUE REPRESENTS DEFAULT CONDITION   * PS100860
                    #TODR EQU     18-/80    DR CODE OF 'TO' DRIVE       PS100870
                    #FRDR EQU     19-/80    DR CODE OF 'FROM' DRIVE     PS100880
                    *                                                 * PS100890
                    #FHOL EQU     20-/80    ADDR OF LARGEST FXA HOLE    PS100900
                    #FSZE EQU     21-/80    BLK CNT LARGEST HOLE IN FXA PS100910
                    #UHOL EQU     22-/80    ADDR OF LARGEST UA HOLE     PS100920
                    #USZE EQU     23-/80    BLK CNT LARGEST HOLE IN UA  PS100930
                    #DCSW EQU     24-/80    NON-ZERO=DUP CALL           PS100940
                    #PIOD EQU     25-/80    PRINC. I/O INDICATOR        PS100950
                    #PPTR EQU     26-/80    PRINC. PRINTER INDICATOR    PS100960
                    #CIAD EQU     27-/80    WD NO. SCTR 0,CIL ADDR      PS100970
                    #ACIN EQU     28-/80    AVAILABLE CARTRIDGE INDR    PS100980
                    #GRPH EQU     29-/80    2250 INDICATOR              PS100990
                    #GCNT EQU     30-/80    NO. G2250 RECORDS           PS101000
                    #LOSW EQU     31-/80    LOCAL-CALLS-LOCAL INDR      PS101010
                    #X3SW EQU     32-/80    SPECIAL ILS SWITCH          PS101020
                    #ECNT EQU     33-/80    NO. OF EQUAT RECORDS        PS101030
                    #ANDU EQU     35-/80    END OF UA (ADJ) LOG DR 0-4  PS101040
                    #BNDU EQU     40-/80    END OF UA (BASE) LOG DR 0-4 PS101050
                    #FPAD EQU     45-/80    FILE PROTECT ADDR (BASE)    PS101060
                    #PCID EQU     50-/80    CART ID, PHYS DR 0-4        PS101070
                    #CIDN EQU     55-/80    CART ID, LOG DR 0-4         PS101080
                    #CIBA EQU     60-/80    CIB ADDR, LOG DR 0-4        PS101090
                    #SCRA EQU     65-/80    SCRA, LOG DR 0-4            PS101100
                    #FMAT EQU     70-/80    WS FORMAT, LOG DR 0-4       PS101110
                    #FLET EQU     75-/80    FLET ADDR, LOG DR 0-4       PS101120
                    #ULET EQU     80-/80    LET ADDR, LOG DR 0-4        PS101130
                    #WSCT EQU     85-/80    WS BLK CNT, LOG DR 0-4      PS101140
                    #CSHN EQU     90-/80    CUSHION END SCTR ADDR, 0-4  PS101150
                    #DCOM EQU     1         SCTR ADDR OF DCOM           PS101160
                    #HDNG EQU     7         SCTR WITH PAGE HEADING      PS101170
                    @SBFR EQU     /FB0                                  PS101180
                          HDNG    CONCATENATED COMMON AREA (CATCO)      PS101190
                    *************************************************** PS101200
                    *                                                 * PS101210
                    *             CATCO IOAR HDRS FOR DUP PHASES        PS101220
                    *                                                 * PS101230
                    *************************************************** PS101240
                          ORG     -/10                                  PS101250
                    DCHDR BSS     2         DUP CONTROL            PH02 PS101260
                    STHDR BSS     2         STORE                  PH03 PS101270
                    FLHDR BSS     2         FILEQ                  PH04 PS101280
                    DMHDR BSS     2         DUMP                   PH05 PS101290
                    DLHDR BSS     2         DUMPLET                PH06 PS101300
                    DTHDR BSS     2         DELETE                 PH07 PS101310
                    DFHDR BSS     2         DEFINE                 PH08 PS101320
                    DXHDR BSS     2         DUP EXIT               PH09 PS101330
                    UCHDR BSS     2         DUP UPCOR              PH13 PS101340
                    PIHDR BSS     2         PRINCIPAL I/O BLOCK    PH14 PS101350
                    SIHDR BSS     2         PRINC I/O (W/O KB) BLK PH15 PS101360
                    PTHDR BSS     2         PAPER TAPE I/O BLOCK   PH16 PS101370
                    CIHDR BSS     2         CI PHASE READ BY CL BUILDER PS101380
                    MUHDR BSS     2         MACRO UPDATE      PH206     PS101390
                    D2HDR BSS     2         DUP CONTROL 2     PH205     PS101400
                          HDNG    MUP -   CATCO DUP SWITCHES            PS101410
                    *************************************************** PS101420
                    *                                                   PS101430
                    *             CATCO DUP SWITCHES                  * PS101440
                    *      WORDS USED FOR COMMUNICATION OF DATA         PS101450
                    *   BETWEEN DUP ROUTINES.                           PS101460
                    *                                                 * PS101470
                    *      INITIALIZED TO ZERO BY  .REST. OF DUPCO    * PS101480
                    *                                                   PS101490
                    *************************************************** PS101500
                    CL1   EQU     *                                     PS101510
                    ASMSW BSS     1         NON ZERO IF DEFINE VOID ASM PS101520
                    BITSW BSS     1         NON ZERO TO ALLOW MDUMP-S   PS101530
                    BLKSW BSS     1         NON ZERO IF BYPASSING REC   PS101540
                    CIERR BSS     1         ERROR NO DETECTED BY PH 17  PS101550
                    CISW  BSS     1         NON ZERO IF STORE CI        PS101560
                    CLBSW BSS     1         NON ZERO IF PRECI EXECUTED  PS101570
                    CNTNO BSS     1         RECORD NO BEING PCHD OR RD  PS101580
                    *                                                 * PS101590
                    *   .DATSW. IS FILLED WITH THE CNT FIELD OF THE   * PS101600
                    *   DUP CONTROL RECORD.                           * PS101610
                    *   USED PRIMARILY FOR DATA MOVEMENT, BUT ALSO IS * PS101620
                    *   USED FOR COUNT OF RECORDS TO READ AFTER A     * PS101630
                    *   STORE CI DUP CONTROL RECORD.                  * PS101640
                    DATSW BSS     1         RECORDS VALUE IN CNT FIELD  PS101650
                    DBADR BSS     1         DB ADDR OF REFERENCED PROG  PS101660
                    DELSW BSS     1         ADDR OF REQ LET ENTRY - 1   PS101670
                    DFNSW BSS     1         NON ZERO IF DEFINE FXA      PS101680
                    DKSAD BSS     1         DK SCTR ADDR W/O DR CODE    PS101690
                    DUMPP BSS  E  2         LAST LIMITS FOR PRNTR DUMP  PS101700
                    FORSW BSS     1         NON ZERO IF DEFINE VOID FOR PS101710
                    FRWS  BSS     1         NON ZERO IF FROM FLD IS WS  PS101720
                    FXSW  BSS     1         NON ZERO IF FIXED AREA REQD PS101730
                    HOLSW BSS     1         NON ZERO IF NO CONV REQD    PS101740
                    IOSW  BSS     1         NON ZERO IF IN/OUT REQD     PS101750
                    *                                                 * PS101760
                    *   DUMPLET SWITCH - ZERO IF NOT DUMPLET/DUMPFLET * PS101770
                    *       PLUS VALUE REQUIRES PRINT OF BOTH LET/FLET* PS101780
                    *       NEG. VALUE REQUIRES PRINT OF FLET ONLY    * PS101790
                    LETSW BSS     1         NON ZERO,PRINT LET OR FLET* PS101800
                    LSTLF BSS     1         LAST LET/FLET SECT PROCESSD PS101810
                    MODSW BSS     1         NON ZERO IF STORE MOD FUNC  PS101820
                    NAMSW BSS     1         NON ZERO IF NAME IN LET/F   PS101830
                    NEGSW BSS     1         NON ZERO IF SHRINKING FXA   PS101840
                    PGMHL BSS     1         WORD COUNT OF THE PROG HDR  PS101850
                    PRSW  BSS     1         NON ZERO IF PRINTING OUTPUT PS101860
                    PTSW  BSS     1         NON ZERO IF PAPER TAPE REQD PS101870
                    SKWDS BSS     1         WDS TO SEARCH IN L/F SECT   PS101880
                    STCSW BSS     1         NON ZERO IF STORE DATA CI   PS101890
                    STSW  BSS     1         NON ZERO IF STORE TYPE      PS101900
                    TEMP1 BSS  E  1         1ST WD OF BINEB OUTPUT      PS101910
                    TEMP2 BSS     1         2ND WD OF BINEB OUTPUT      PS101920
                    TOWS  BSS     1         NON ZERO IF TO FIELD IS WS  PS101930
                    T3MSW BSS     1         TYPE 3,4 SOCAL LEVEL CELL   PS101940
                    UASW  BSS     1         NON ZERO IF USER AREA REQD  PS101950
                    WSSW  BSS     1         NON ZERO IF WORK STG REQD   PS101960
                    XEQSW BSS     1         NON ZERO IF NOT RET FR GET  PS101970
                    EBCSW BSS     1         NON ZERO IF EBC DATA OP 2E2 PS101980
                    HDNSW BSS     1         NON ZERO IF NAME IN HDR     PS101990
                    RPGSW BSS     1         NON Z IF DEFINE VOID RPG    PS102000
                    DFLSW BSS     1         NON ZERO IF *DFILE          PS102010
                          BSS     1         RESERVED FOR ADDITION       PS102020
                    CL2   EQU     *-1                                   PS102030
                          HDNG    MUP -   CATCO DUP SWITCHES            PS102040
                    *************************************************** PS102050
                    *                                                 * PS102060
                    *             CATCO DUP SWITCHES                  * PS102070
                    *  INITIALIZED BY DCTL AND NOT RESET BY .REST.    * PS102080
                    *                                                 * PS102090
                    *************************************************** PS102100
                    IOREQ BSS     1         MON-ZERO,AUX I/O SET REQ    PS102110
                    PH2   BSS     1         NON-ZERO IF DCTL IN CORE    PS102120
                    PH3   BSS     1         NON-ZERO IF STORE IN CORE   PS102130
                    PH4   BSS     1         NON-ZERO IF DUMP IN CORE    PS102140
                    *************************************************** PS102150
                    *                                                 * PS102160
                    *             CATCO SWITCH INITIALIZED TO ZERO    * PS102170
                    *   BY CCAT SUBR AND SET BY MACRO UPDATE PROGRAM  * PS102180
                    *                                                 * PS102190
                    *************************************************** PS102200
                    DUPCR BSS     1         NON ZERO IF DUP CTRL RCD    PS102210
                    *************************************************** PS102220
                    *                                                 * PS102230
                    *             CATCO DUP SWITCHES SET BY CCAT SUBR * PS102240
                    *                                                 * PS102250
                    *************************************************** PS102260
                    ADDR2 BSS     1         KB INTERRUPT ADDRESS        PS102270
                    KBREQ BSS     1         CONTENTS OF LOC 13          PS102280
                    *      THE FOLLOWING SWITCH IS SET TO INDICATE THE  PS102290
                    *       PRINCIPAL INPUT DEVICE                      PS102300
                    *             -  IS PAPER TAPE                      PS102310
                    *             0  IS CARD                            PS102320
                    *             +  IS KEYBOARD                        PS102330
                    INOUT BSS     1         PRINCIPAL INPUT SWITCH      PS102340
                    *                                                   PS102350
                    PTPON BSS     1         NON-ZERO IF PAPER TP ON SYS PS102360
                    *************************************************** PS102370
                    *                                                 * PS102380
                    *             LEVEL 4 INTERRUPT BRANCH TABLE      * PS102390
                    *             ADDRESSES. INITIALIZED BY CCAT,     * PS102400
                    *             AND CARD/PAPER TAPE INTERFACES.     * PS102410
                    *                                                 * PS102420
                    *************************************************** PS102430
                          ORG     /0049                                 PS102440
                    IBT   BSS     9         9 WD INTRPT BRANCH TABLE    PS102450
                    *************************************************** PS102460
                    *                                                 * PS102470
                    *             CATCO I/O ADDRESSES REQUIRED BY DUP * PS102480
                    *                                                 * PS102490
                    *************************************************** PS102500
                    P1442 BSS  E  2         SYS 1442 IOAR HEADER        PS102510
                    PRPAR BSS     2         DEFAULT LIMITS TO PRINT     PS102520
                    PHDUP BSS     1         LAST DUP PHASE IN CORE      PS102530
                    CRBUF BSS     1         81 WD BFR FOR DUP CTRL RCDS PS102540
                    DCADR BSS     1         ADDR FOR DUP CTRL IOAR HDR  PS102550
                    HDBUF BSS     1         ADDR OF PAGE HEADING BFR    PS102560
                    IOBLK BSS     1         ADDR OF DUP I/O PHASE       PS102570
                    SDBUF BSS     1         STORE/DUMP BUFFER           PS102580
                    LETAR BSS     1         ADDR OF LET SEARCH BUFFER   PS102590
                    PEBUF BSS     1         41 WD BFR FOR PACKED EBCDIC PS102600
                    THIS  BSS     1         ADDR OF DOUBLE BFR, BFR 1   PS102610
                    NEXT  BSS     1         ADDR OF DOUBLE BFR, BFR 2   PS102620
                          HDNG              DUP CORE PARAMETERS         PS102630
                    DISKZ EQU     DZ000     DISKZ ENTRY POINT           PS102640
                    B     EQU     $ZEND-2                               PS102650
                    DMPLC EQU     B         IOAR CORE ADDR FOR DMPLT    PS102660
                    EXITC EQU     B         IOAR CORE ADDR FOR DEXIT    PS102670
                    DCTL  EQU     B+/1002   ENTRY ADDRESS OF DCTL       PS102680
                    DCTLC EQU     B+/1000   IOAR CORE ADDR FOR DCTL     PS102690
                    WSDC  EQU     B+/2000   IOAR CORE ADDR FOR STORE    PS102700
                    DUMPC EQU     B+/4000   IOAR CORE ADDR FOR DDUMP    PS102710
                    DUPCO EQU     /7DB0     ADDR OF RESIDENT DUPCO      PS102720
                    CATCO EQU     /7F20-2   ADDR OF DCOM IOAR HEADER    PS102730
                    *                                                 * PS102740
                    *  DUPCO ENTRY POINTS...USED WITH INDIRECT BSI    * PS102750
                    *                                                 * PS102760
                          ORG     DUPCO                                 PS102770
                    BINEB BSS     1         CONVERSION BINARY TO EBCDIC PS102780
                    WRTDC BSS     1         WRITE DCOM(S) SUBROUTINE    PS102790
                    ENTER BSS     1         SAVE XR-S AND CONDITIONS    PS102800
                    GET   BSS     1         READ FROM DISK USING DISKZ  PS102810
                    LEAVE BSS     1         HANDLES ALL EXITS FROM DUP  PS102820
                    LINE  BSS     1         SPACES PRINTER 1 LINE       PS102830
                    MASK  BSS     1         INHIBITS KB INT REQUEST     PS102840
                    MDUMP BSS     1         PRINTS SELECTED CORE LOC-S  PS102850
                    PAGE  BSS     1         SKIPS TO NEXT PAGE          PS102860
                    PHID  BSS     1         RECORDS PHASE ID            PS102870
                    PHIDM BSS     1         RECORDS PHASE AND MODIFIER  PS102880
                    PRINT BSS     1         USE SYS PR SUBR TO PRINT    PS102890
                    PUT   BSS     1         WRITES TO DISK USING DISKZ  PS102900
                    REST  BSS     1         RESTORE CATCO,GO TO DCTL    PS102910
                    RTURN BSS     1         RESTORE XR-S AND CONDITIONS PS102920
                    *                                                 * PS102930
                    *  INPUT/OUTPUT PARAMETERS , CORE ADDRESSES       * PS102940
                    *                                                 * PS102950
                    BUF6  EQU     DUPCO-/1F ADDR OF PAGE HEADING BUFFER PS102960
                    PRPNT EQU     BUF6-/141 IOAR ADDR FOR PRINC. PTR    PS102970
                    IOADR EQU     BUF6-/38B START OF I/O INTERFACE      PS102980
                    GETHO EQU     IOADR+4   ENTRY FOR READING HOLL TYPE PS102990
                    GETBI EQU     IOADR+5   ENTRY FOR READING BINARY    PS103000
                    PACKB EQU     IOADR+6   ENTRY TO PACK BINARY        PS103010
                    PCHBI EQU     IOADR+7   ENTRY TO PUNCH BINARY       PS103020
                    BUF1  EQU     IOADR-/51 ADDR OF NEXT BUFFER         PS103030
                    BUF2  EQU     BUF1-/52  ADDR OF THIS BUFFER         PS103040
                    BUF3  EQU     BUF2-/3E  ADDR OF PACKED EBC BUFFER   PS103050
                    BUF4  EQU     BUF3-/52  ADDR OF CONTROL RCD BUFFER  PS103060
                    BUF5  EQU     IOADR-/284   ADDR OF LET SCTR BFR     PS103070
                    BUF7  EQU     BUF5-/7142   ADDR OF STORE/DUMP BFR   PS103080
                          HDNG    MACRO UPDATE PROGRAM PROLOGUE         PS103090
                    *************************************************** PS103100
                    *STATUS - VERSION 2, MODIFICATION 12              * PS103110
                    *                                                 * PS103120
                    *FUNCTION/OPERATION -                             * PS103130
                    *   * THIS DUP MODULE PROVIDES MACRO LIBRARY      * PS103140
                    *     UPDATE AND MAINTENANCE FACILITIES. IT       * PS103150
                    *     PERFORMS MACRO LIBRARY INITIALIZATION,      * PS103160
                    *     PHYSICAL OR LOGICAL MACRO LIBRARY JOINING,  * PS103170
                    *     AND PROVIDES THE ABILITY TO ADD, PURGE,     * PS103180
                    *     RENAME, PUNCH, AND UPDATE MACROS.           * PS103190
                    *   * THIS MODULE IS READ INTO CORE WHEN AN       * PS103200
                    *     *MACRO UPDATE DUP CONTROL RECORD IS READ IF * PS103210
                    *     CORE SIZE IS 8K OR GREATER.                 * PS103220
                    *   * THE PARTICULAR FUNCTIONS TO BE PERFORMED    * PS103230
                    *     ARE INDICATED BY MEANS OF THE MUP CONTROL   * PS103240
                    *     RECORDS WHICH FOLLOW THE *MACRO UPDATE DUP  * PS103250
                    *CONTROL RECORD.                                  * PS103260
                    *                                                 * PS103270
                    *ENTRY POINTS -                                   * PS103280
                    *     PROGRAM START - MUP                         * PS103290
                    *                                                 * PS103300
                    *INPUT -                                          * PS103310
                    *   * MUP CONTROL RECORDS                         * PS103320
                    *   * MACRO DEFINITION SOURCE TEXT IF MACRO TEXT  * PS103330
                    *     IS TO BE ADDED TO A MACRO LIBRARY           * PS103340
                    *   * DISK MACRO LIBRARIES IN USER OR FIXED AREA  * PS103350
                    *   * DISK WORKING STORAGE IF LIBRARY SPILL HAS   * PS103360
                    *     OCCURED                                     * PS103370
                    *                                                 * PS103380
                    *OUTPUT -                                         * PS103390
                    *   * THE MACRO LIBRARIES IN THE USER OR FIXED    * PS103400
                    *     AREAS ARE UPDATED AS REQUESTED              * PS103410
                    *   * MUP CONTROL STATEMENTS AND ANY ERROR        * PS103420
                    *     MESSAGES ARE PRINTED ON THE PRINCIPAL       * PS103430
                    *     PRINTER                                     * PS103440
                    *   * MACRO HEADERS, WITH OR WITHOUT MACRO SOURCE * PS103450
                    *     TEXT IS PRINTED ON THE PRINCIPAL PRINTER    * PS103460
                    *     UNDER CONTROL OF MUP CONTROL RECORDS        * PS103470
                    *   * MACROS ARE PUNCHED IF REQUESTED BY MUP      * PS103480
                    *     CONTROL RECORDS                             * PS103490
                    *   * DISK WORKING STORAGE IS USED TO HOLD        * PS103500
                    *     LIBRARY SPILL WHEN NEEDED                   * PS103510
                    *                                                 * PS103520
                    *EXTERNAL REFERENCES -                            * PS103530
                    * SUBROUTINES -                                   * PS103540
                    *    *ENTER - SAVE XR-S  A AND Q REGS, STATUS     * PS103550
                    *    *RTURN - RESTORE XR-S, A AND Q REGS, STATUS  * PS103560
                    *    *GET   - READ FROM DISK                      * PS103570
                    *           - READ LET/FLET IN LIBRARY SEARCH     * PS103580
                    *           - READ MACRO LIBRARY SECTORS          * PS103590
                    *           - READ WORKING STORAGE IF SPILL       * PS103600
                    *    *GETHO - READ MUP CONTROL RECORDS, CONVERT   * PS103610
                    *             TO EBCDIC IN CRBUF                  * PS103620
                    *    *LEAVE - EXIT FROM DUP-SUPERVISOR CNTL RCD RD* PS103630
                    *    *LINE  - SPACE 1 LINE ON PRINCIPAL PRINTER   * PS103640
                    *    *MASK  - PREVENT INTERRUPT REQUEST DURING RUN* PS103650
                    *    *PAGE  - RESTORE PAPER                       * PS103660
                    *    *PCHBI - PUNCH MACRO SOURCE TEXT             * PS103670
                    *    *PHID  - RECORD PHASE ID                     * PS103680
                    *    *PRINT - TO PRINT MUP CONTROL RECORDS, ERROR * PS103690
                    *             MESSAGES, MACRO HEADERS AND TEXT    * PS103700
                    *    *REST  - TO RETURN TO DUP CONTROL            * PS103710
                    * COMMUNICATION AREAS -                           * PS103720
                    *    *LET/FLET - USED TO LOCATE MACRO LIBRARIES   * PS103730
                    *    *COMMA -                                     * PS103740
                    *             $CTSW                               * PS103750
                    *             $FPAD                               * PS103760
                    *             $IBSY                               * PS103770
                    *             $PBSY                               * PS103780
                    *             $PRET                               * PS103790
                    *             $ULET                               * PS103800
                    *             $WSDR                               * PS103810
                    *    *DCOM -                                      * PS103820
                    *             #PIOD                               * PS103830
                    *             #RP67                               * PS103840
                    *                                                 * PS103850
                    *EXITS -                                          * PS103860
                    * NORMAL -                                        * PS103870
                    *    ENDUP MUP CONTROL RECORD RECOGNIZED. EXIT    * PS103880
                    *    THROUGH REST DUPCO SUBROUTINE                * PS103890
                    * ERROR -                                         * PS103900
                    *    MONITOR OR DUP CONTROL RECORD READ.          * PS103910
                    *    MONITOR CONTROL RECORD CAUSES EXIT THRU LEAVE* PS103920
                    *    SUBROUTINE IN DUPCO.                         * PS103930
                    *    DUP CONTROL RECORD (* IN COL 1) IS PASSED TO * PS103940
                    *    DUP CONTROL FOR ANALYSIS BY SETTING DUPCR    * PS103950
                    *    SWITCH NON-ZERO AND EXITING VIA REST IN DUPCO* PS103960
                    *                                                 * PS103970
                    *TABLES/WORK AREAS -                              * PS103980
                    *   *CATCO -  CONCATENATED COMMON AREA OF DUPCO   * PS103990
                    *   *CRBUF -  ADDR OF INPUT BFR FOR CONTROL RCDS  * PS104000
                    *   *LETAR -  ADDR OF AREA USED TO SEARCH EACH    * PS104010
                    *             SECTOR OF EACH LET/FLET             * PS104020
                    *   *NEXT  -  ADDR OF UNPACKED HOLLERITH RECORDS  * PS104030
                    *             DURING CARD PUNCHING OPERATION      * PS104040
                    *   *PARNO -  FIRST WORD OF 142 WORD AREA USED TO * PS104050
                    *             HOLD NAME STATEMENT PARAMETERS FOR  * PS104060
                    *             CONVERSION TO DISK MACRO PROTOTYPE  * PS104070
                    *             FORMAT AND BACK                     * PS104080
                    *   *THIS  -  ADDR OF AREA USED TO CHECK CARD FOR * PS104090
                    *             NON-BLANKS BEFORE PUNCHING IT IF    * PS104100
                    *             1442-6 OR -7 PRESENT                * PS104110
                    *                                                 * PS104120
                    *ATTRIBUTES -                                     * PS104130
                    *   NON-REUSABLE                                  * PS104140
                    *                                                 * PS104150
                    *NOTES -                                          * PS104160
                    *   *MOST CONSTANTS, WORK AREAS, AND SWITCHES ARE * PS104170
                    *    GROUPED TOGETHER AND MAY BE ADDRESSED WITH A * PS104180
                    *    SHORT INSTRUCTION USING INDEX 3. INDEX 3     * PS104190
                    *    POINTS TO LOCATION D. LONG INSTRUCTIONS CAN  * PS104200
                    *    BE USED WHEN NEEDED (EG. INDEX 3 IS POINTING * PS104210
                    *    ELSEWHERE). LABELS FOR LONG ADDRESSING HAVE  * PS104220
                    *    AN X APPENDED.                               * PS104230
                    *   *THE FIRST 142 WORDS OF THE PHASE ARE OVERLAID* PS104240
                    *    WITH THE NAME STATEMENT PARAMETER AREA. THE  * PS104250
                    *    OVERLAID CODING IS EXECUTED ONLY ONCE, DURING* PS104260
                    *    MUP INITIALIZATION.                          * PS104270
                    *   *MUP HAS 1 WAIT - WHEN A NON-BLANK CARD IS    * PS104280
                    *    FOUND DURING PUNCHING ON 1442-6 OR -7.       * PS104290
                    *   *MUP USES 2 OUTPUT DISK BUFFERS, KOUT AND     * PS104300
                    *    KNOUT. ALTERNATE OUTPUT DISK BUFFERING IS    * PS104310
                    *    USED. THE UNUSED BUFFER IS USED WHENEVER A   * PS104320
                    *    MISC DISK READ/WRITE IS NEEDED (SUCH AS SPILL* PS104330
                    *    TO WORKING STORAGE).                         * PS104340
                    *                                                 * PS104350
                    *************************************************** PS104360
                          HDNG    MUP INITIALIZATION & CONTROL ROUTINE  PS104370
                          ORG     B                                     PS104380
                    NMS   EQU     141       NAME LIST AREA              PS104390
                    *             INITIALIZATION ROUTINE              * PS104400
                    *               CODE TO LABEL MUP08 IS              PS104410
                    *               INITIALIZATION AND IS ENTERED ONLY  PS104420
                    *               ONCE FOR THE PROGRAM. LOCATION MUP  PS104430
                    *               IS THE START OF THE PROGRAM         PS104440
                          DC      *-*       SYSTEM LDR FILLS IN WORD CT PS104450
                          DC      /00CE     SLET PHASE ID               PS104460
                    MUP   MDX     MUP01                                 PS104470
                    PARNO DC      *-*       NO. OF NAME PARAMETERS      PS104480
                    PBUFF DC      *-*                                   PS104490
                    MUP01 EQU     *                                     PS104500
                    *                                                   PS104510
                          BSI  I  PHID      IDENTIFY MUP PHASE          PS104520
                          DC      /00CE     *                           PS104530
                    *                                                   PS104540
                          LDX  L1 C         RESTORE CATCO POINTER       PS104550
                    *                                                   PS104560
                          LD      *         TURN ON SW TO MAKE CD READ  PS104570
                          STO   1 EBCSW     *ROUTINE CONVERT TO PACKED  PS104580
                    *                       *EBC                        PS104590
                          LDX  L3 D         SET PTR TO CONSTANT AREA    PS104600
                    *                                                   PS104610
                    MUP05 SLA     16        SET SWITCH TO INDICATE      PS104620
                          STO   1 PH2       *DCTL NOT IN CORE           PS104630
                    *                                                   PS104640
                          BSI  L  PTINT     INITIALIZE PRINT ROUTINE    PS104650
                    *                                                   PS104660
                          LD    1 LETAR     SAVE ADDR OF LET/FLET       PS104670
                          STO  L  LET       *SEARCH BUFFER              PS104680
                    *                                                   PS104690
                          LD    3 D320      SET SECTOR WORD COUNT INTO  PS104700
                          STO  I1 LETAR     *LET/FLET SEARCH BUFFER     PS104710
                    *                                                   PS104720
                          LD   L  $WSDR     GET WORKING STORAGE DRIVE   PS104730
                          SRA     12        *NUMBER, RIGHT JUSTIFY      PS104740
                          STO  L  TEMP3     INDEX TO GET FILE PROTECT   PS104750
                          LDX  I2 TEMP3     *ADDR OF CARTRIDGE TO BE    PS104760
                          LD   L2 $FPAD     *USED                       PS104770
                          SLA     4         ELIMINATE DRIVE CODE        PS104780
                          SRA     4         *                           PS104790
                          STO   3 WORKS     SAVE FPAD                   PS104800
                          LD    3 D1600     LOAD DISK CAPACITY          PS104810
                          S     3 WORKS     SUBTRACT FPAD               PS104820
                          STO   3 ESPL      SET SPILL AREA SIZE         PS104830
                          LD   L  TEMP3     GET DRIVE CODE              PS104840
                          SLA     12        LEFT JUSTIFY                PS104850
                          OR    3 WORKS     FORM WS SECTOR ADDR WITH    PS104860
                          STO   3 WORKS     *LOGICAL DRIVE CODE         PS104870
                    *                                                   PS104880
                          LD    3 UPLIM     CALCULATE AVAILABLE CORE    PS104890
                          S     3 INLC                                  PS104900
                    MUP02 SRT     16                                    PS104910
                          D     3 D322      COMPUTE NUM. BUF IN FCOR    PS104920
                          STO   3 X         OF INPUT BUFFERS            PS104930
                    *                                                   PS104940
                          LDX  L2 KOUT                                  PS104950
                          LDX  I1 XX        LOAD WITH TOTAL             PS104960
                          MDX   1 2         NUMBER OF BUFFERS           PS104970
                    MUP04 LD    3 D320      SET WORD COUNTS INTO        PS104980
                          STO   2 0         EACH BUFFER AREA TO BE      PS104990
                          MDX  L2 322       PROCESSED                   PS105000
                          MDX   1 -1        LOOP TO INTIALIZE NEXT      PS105010
                          MDX     MUP04     IF NOT DONE                 PS105020
                          STX  L2 BENDX     SET BUFFER END POINTER      PS105030
                    *                                                   PS105040
                          BSI  L  RPAGE     EJECT PAGE                  PS105050
                    *                                                 * PS105060
                          LDX  L1 C         RESTORE CATCO POINTER       PS105070
                          BSI  I  MASK      MASK INTERRUPT REQUESTS     PS105080
                    *                       *DURING MUP OPERATION       PS105090
                          MDX     MUP09                                 PS105100
                          BSS     NMS-*+PARNO                           PS105110
                    *                                                   PS105120
                    *************************************************** PS105130
                    *                                                 * PS105140
                    *  THE CODING AND AREA UP TO THIS POINT ARE       * PS105150
                    *  OVERLAID BY THE NAME LIST AREA WHEN A NAME     * PS105160
                    *  STATEMENT IS PROCESSED                         * PS105170
                    *                                                 * PS105180
                    *************************************************** PS105190
                    MUP08 MDX     MUPX3     UPDATE ERROR                PS105200
                    MUP09 BSI  L  RDCRD     READ A CARD                 PS105210
                    *                                                   PS105220
                          SLA     16                                    PS105230
                          STO   3 SKSW      CLEAR SKIP SWITCH           PS105240
                    *                                                   PS105250
                    MUP11 LD    3 LNAM      PICK UP LIB NAME            PS105260
                          BSC  L  MUP10,+-  BRANCH IF NONE              PS105270
                          LDX  L1 SAREA     POINT TO COL 1              PS105280
                          LDX   2 8         SET TO TABLE LENGTH         PS105290
                          BSI  L  MCCSN     GO TO SCAN FOR L OR B       PS105300
                          DC      .L        LIB                         PS105310
                          DC      MUP9B                                 PS105320
                          DC      .B        BUILD                       PS105330
                          DC      MUP9B                                 PS105340
                          DC      .J        JOIN                        PS105350
                          DC      MUP9A                                 PS105360
                          DC      .E        ENDUP                       PS105370
                          DC      MUP9B                                 PS105380
                          MDX     MUP10     NO, SKIP FLUSH              PS105390
                    *                                                   PS105400
                    MUP9A SLA     16        YES, SET JOIN SW            PS105410
                          STO   3 JSW                                   PS105420
                          STO   3 J1SW      *AND JOIN1 SWITCH           PS105430
                    *                                                   PS105440
                          LD    3 PSW                                   PS105450
                          BSI  L  NMTST,Z                               PS105460
                    MUP9B LD    3 PSW       TEST FOR SELECT P           PS105470
                          STO   3 PSWSV     SAVE SELECT P SETTING       PS105480
                          BSC  L  MUP9C,+-  BRANCH IF NOT               PS105490
                          LD    3 NMSW      TEST IF NAME STATEMENT USED PS105500
                          BSC  L  MUP9C,Z   BRANCH IF SO                PS105510
                          STO   3 PSW       OTHERWISE, RESET SELECT P   PS105520
                    MUP9C LD    3 X00FF                                 PS105530
                          STO   3 LPSW      SET 2ND PASS FLAG           PS105540
                          STO   3 LNRS      SET LIB NAME RESET SW       PS105550
                          BSI  L  UPDAT     FLUSH CURRENT LIBRARY       PS105560
                          MDX     *         ALLOW FOR UPDAT RETURN      PS105570
                          LD    3 PSWSV     GET SAVED PSW VALUE         PS105580
                          STO   3 PSW       RESTORE PSW                 PS105590
                          STO   3 LNRS      CLEAR LIB NAME RESET SW     PS105600
                          STO   3 CCSW      CLEAR CONCATENATE SW        PS105610
                    *                                                   PS105620
                    MUP10 LDX  L1 SAREA     POINT TO COLUMN 1           PS105630
                          LD    1 0         FOR BLANK                   PS105640
                          EOR   3 BLAN                                  PS105650
                    MUP12 BSC  L  MUP09,+-  BRANCH YES TO SKIP CARD     PS105660
                    *                                                   PS105670
                          MDX  L  SAREA+71,1 FORCE SCAN TERM. AT COL 72 PS105680
                    MUP14 MDX   1 1         BUMP POINTER                PS105690
                          LDX   2 2                                     PS105700
                    *                                                   PS105710
                          BSI  L  MCCSN     ENTER BASIC SCAN            PS105720
                          DC      .         CHECK FOR BLANK             PS105730
                          DC      MUP16                                 PS105740
                          MDX     MUP14     NO RETURN TO SCAN           PS105750
                    *                                                   PS105760
                    MUP16 MDX   1 1         BUMP POINTER                PS105770
                          LDX  X2 MUP15-MP16A     SET AND               PS105780
                          BSI  L  MCCSN     *ENTER BASIC SCAN           PS105790
                    MP16A DC      .         CHECK FOR BLANK             PS105800
                          DC      MUP16     YES-RE-ENTER,ELSE EXIT      PS105810
                    *                                                   PS105820
                    MUP15 MDX  L  SAREA+71,-1  RESTORE CHARACTER        PS105830
                    MUP17 STX  L1 RPTX      SET RPT EQUAL NEXT NON 0    PS105840
                    *                                                   PS105850
                          BSI  L  CRPRT     PRINT CONTROL RECORD        PS105860
                    *                                                   PS105870
                    MUP19 LDX  L1 SAREA                                 PS105880
                          LDX  X2 MUPX2-MUPX1  SET AND ENTER BASIC      PS105890
                          BSI  L  MCCSN     SCAN TO CHECK CONTROL       PS105900
                    MUPX1 EQU     *                                     PS105910
                          DC      .L+/8000  LIB                         PS105920
                          DC      LIB                                   PS105930
                          DC      MUP09                                 PS105940
                    *                                                   PS105950
                          DC      .U+/8000  UPDATE                      PS105960
                          DC      UPDAT                                 PS105970
                          DC      MUP08                                 PS105980
                    *                                                   PS105990
                          DC      .I+/8000  INSERT                      PS106000
                          DC      INSRT                                 PS106010
                          DC      MUP11                                 PS106020
                    *                                                   PS106030
                          DC      .D+/8000  DELETE                      PS106040
                          DC      DELET                                 PS106050
                          DC      MUP11                                 PS106060
                    *                                                   PS106070
                          DC      .A+/8000  ADD                         PS106080
                          DC      ADD                                   PS106090
                          DC      MUP11                                 PS106100
                    *                                                   PS106110
                          DC      .O+/8000  OUTPUT                      PS106120
                          DC      OUTPT                                 PS106130
                          DC      MUP09                                 PS106140
                    *                                                   PS106150
                          DC      .R+/8000  RENAME                      PS106160
                          DC      RENAM                                 PS106170
                          DC      MUP09                                 PS106180
                    *                                                   PS106190
                          DC      .P+/8000  PURGE                       PS106200
                          DC      PURGE                                 PS106210
                          DC      MUP09                                 PS106220
                    *                                                   PS106230
                          DC      .S+/8000  SELECT                      PS106240
                          DC      SEL       F                           PS106250
                          DC      MUP09                                 PS106260
                    *                                                   PS106270
                          DC      .B+/8000  BUILD                       PS106280
                          DC      BUILD                                 PS106290
                          DC      MUP09                                 PS106300
                    *                                                   PS106310
                          DC      .J+/8000  JOIN                        PS106320
                          DC      JOIN                                  PS106330
                          DC      MUP09                                 PS106340
                    *                                                   PS106350
                          DC      .C+/8000  CONCATENATE                 PS106360
                          DC      CONC                                  PS106370
                          DC      MUP09                                 PS106380
                    *                                                   PS106390
                          DC      .N+/8000  NAME                        PS106400
                          DC      NAME                                  PS106410
                          DC      MUP11                                 PS106420
                    *                                                   PS106430
                          DC      .E        ENDUP                       PS106440
                          DC      END5                                  PS106450
                    *                                                   PS106460
                    MUPX2 BSI   3 EPRT      PRINT MESSAGE               PS106470
                          DC      EM5       ILLEGAL REQUEST             PS106480
                          MDX     MUP09     READ NEXT CARD              PS106490
                    *                                                   PS106500
                    MUPX3 BSI   3 EPRT      PRINT MACRO NOT FOUND       PS106510
                          DC      EM11      *MESSAGE                    PS106520
                          MDX     MUP09     READ NEXT CONTROL RECORD    PS106530
                          HDNG    NAME ROUTINE                       05 PS106540
                    *************************************************** PS106550
                    *             NAME ROUTINE, BUILDS PARAMETER LIST * PS106560
                    *             TO IDENTIFY SYMBOLIC PARAMETERS FOR * PS106570
                    *             INSERT. READS NEXT STATEMENT, IF    * PS106580
                    *             NAME,IT CAUSES CONTINUATION OF      * PS106590
                    *             PREVIOUS STATEMENTS                 * PS106600
                    *************************************************** PS106610
                    NAME  DC      *-*       ENTRY POINT                 PS106620
                          LD    1 1         TEST COL 2 FOR A            PS106630
                          EOR   3 CA        *                           PS106640
                          BSC  L  MUPX2,Z   ILLEGAL REQUEST IF NOT      PS106650
                    *                                                   PS106660
                          LDX  I1 RPTX      PICK UP NAME POINTER        PS106670
                          MDX   1 -1        POINT TO CHAR BACK          PS106680
                          STX   1 NAM01     SAVE                        PS106690
                          BSC  L  *         MODIFIED,SWITCH FOR NEXT    PS106700
                    *                                                   PS106710
                    NAMEZ SLA     16        CLEAR COUNTS                PS106720
                          STO  L  PARNO     NO. OF PARAMETERS           PS106730
                          STO  L  PBUFF     TOTAL CHARACTERS            PS106740
                          LD    1 1         CHECK IF BLANK NAME         PS106750
                          EOR   3 BLAN      *STATEMENT,NO CONTINUE      PS106760
                          BSC  L  NAM06,+-  YES,BRANCH TO EXIT          PS106770
                    NAM0X SLA     16                                    PS106780
                          STO   3 NAMC                                  PS106790
                          STO  L  SAREA                                 PS106800
                    NAM0  STX   1 NAM02                                 PS106810
                          SLA     16        CLEAR CHARACTER COUNT       PS106820
                          STO   3 MCHA      *                           PS106830
                          LD    1 1         TEST IF 1ST CHAR AMPERSAND  PS106840
                          EOR   3 CAMP                                  PS106850
                          STO  L  NMSIX     SET VALID CHARACTER COUNT   PS106860
                          BSC  L  NAM0T,Z   NO, CONTINUE                PS106870
                          MDX   1 1         BUMP CHARACTER POINTER      PS106880
                          MDX     NAM04     GO TO STORE AMPERSAND       PS106890
                    *                                                   PS106900
                    NAM0T LD    1 1         TEST IF 1ST CHAR NUMERIC    PS106910
                          S     3 F0                                    PS106920
                          BSC  L  NAM00,+Z  SKIP ERROR FUNCTION         PS106930
                    NAM0Y MDX   1 1         NUMERIC, POINT TO 1ST CHAR  PS106940
                          MDX     NMERR     GO TO ERROR                 PS106950
                    *                                                   PS106960
                    NAM00 MDX   1 1         POINT TO FIRST CHAR         PS106970
                          LDX  X2 NAM3A-NAM03  SET TO ENTER SYNTAX      PS106980
                          BSI  L  MCCSN     *SCAN ROUTINE               PS106990
                    NAM03 DC      .$        DOLLAR SIGN                 PS107000
                          DC      NAM04                                 PS107010
                          DC      .#        POUND SIGN                  PS107020
                          DC      NAM04                                 PS107030
                          DC      /007C     AT SIGN                     PS107040
                          DC      NAM04                                 PS107050
                          DC      .,        COMMA                       PS107060
                          DC      NAMCM     0                           PS107070
                          DC      .         BLANK                       PS107080
                          DC      NAMBL     0                           PS107090
                    NAM3A LD    1 0         TEST IF ALPHANUMERIC        PS107100
                          S     3 X00C0                                 PS107110
                          BSC  L  NMERR,+   NO, GO TO ERROR             PS107120
                    NAM04 MDX  L  MCHAX,1   BUMP CHAR. COUNT            PS107130
                          MDX  L  SAREA,1   BUMP PARA CHARS             PS107140
                          MDX     NAM00     LOOP TO NEXT                PS107150
                    *                                                   PS107160
                    *************************************************** PS107170
                    *             PROCESS COMMA TERMINATOR              PS107180
                    *************************************************** PS107190
                    NAMCM LD    3 MCHA      FETCH CHARACTER COUNT       PS107200
                          STO  L  *-*       STORE IN IMAGE              PS107210
                    NAM02 EQU     *-1                                   PS107220
                          MDX  L  NMSIX,0   SEE IF 5 OR 6 CHARS VALID   PS107230
                          MDX     NAM2A                                 PS107240
                          S     3 ONE       6, SET FOR TEST             PS107250
                    NAM2A S     3 L5        TEST IF VALID PARAMETER     PS107260
                          BSC  L  NMER1,-Z  NO, GO TO ERROR             PS107270
                          LD    1 0         NEXT COLUMN BLANK?          PS107280
                          EOR   3 BLAN                                  PS107290
                          BSC  L  NAM0Y,+-  YES, GO TO ERROR            PS107300
                          MDX  L  NAMCX,1   BUMP COUNT                  PS107310
                          MDX     NAM0      LOOP FOR NEXT NAME          PS107320
                    *                                                   PS107330
                    *************************************************** PS107340
                    *             PROCESS BLANK TERMINATOR              PS107350
                    *************************************************** PS107360
                    NAMBL LD    3 MCHA      FETCH CHARACTER COUNT       PS107370
                          MDX  L  NAMCX,1   BUMP COUNT                  PS107380
                          STO  I  NAM02     SAVE IN CARD IMAGE          PS107390
                          MDX  L  NMSIX,0   SEE IF 5 OR 6 CHARS VALID   PS107400
                          MDX     NMBL0                                 PS107410
                          S     3 ONE       6, SET FOR TEST             PS107420
                    NMBL0 S     3 L5        TEST IF VALID PARAMETER     PS107430
                          BSC  L  NMER1,-Z  NO, GO TO ERROR             PS107440
                          LDX  I2 PBUF      BUFFER START, THIS IMAGE0   PS107450
                          STX   1 NAMSV     SAVE COLUMN NUMBER          PS107460
                    NMBL1 MDX   1 1         BUMP COLUMN POINTER         PS107470
                          STX   1 NMTMP     PREPARE TO LOAD             PS107480
                          LD      NMTMP     GET NEXT CHAR ADDRESS       PS107490
                          S       NMEND     ARE WE PAST COLUMN 72       PS107500
                          BSC  L  NMBL2,-Z  YES, TERMINATE BLANK TEST   PS107510
                          LD    1 0         NO, GET NEXT CHARACTER      PS107520
                          EOR   3 BLAN      TEST FOR BLANK              PS107530
                          BSC  L  NMBL1,+-  YES, GO TEST SOME MORE      PS107540
                          LDX  I1 NAMSV     NO, SET XR1 FOR ERROR       PS107550
                          MDX     NMERR     GO TO ERROR                 PS107560
                    *                                                   PS107570
                    NMBL2 LDX  L1 PBUFF                                 PS107580
                          LD    3 NAMC      UPDATE NUMBER OF PARAMS     PS107600
                          A     1 -1        SPECIFIED BY THIS           PS107610
                          STO   1 -1        NAME SEQUENCE               PS107620
                          S     3 D20       TEST IF MORE THAN 20 PARAM  PS107630
                          BSC  L  NMBL3,+   NO, SKIP ERROR FUNCTION     PS107640
                          BSI   3 EPRT      YES, PRINT INVALID PARAM    PS107650
                          DC      EM17                                  PS107660
                          MDX     NMEXT     AND EXIT                    PS107670
                    *                                                   PS107680
                    NMBL3 LD    3 NAMC      COMPUTE NO OF CHARS THIS    PS107690
                          A    L  SAREA     *STATEMENT FOR MOVE         PS107700
                          STO   3 NAMC                                  PS107710
                          A     1 0         UPDATE TOTAL NUMBER CHAR    PS107720
                          STO   1 0         *THIS NAME SEQUENCE         PS107730
                          LDX  L1 *-*       PICK UP STARTING POINT      PS107740
                    NAM01 EQU     *-1       0                           PS107750
                    NAM05 LD    1 0         MOVE LOOP-MOVE FROM         PS107760
                          STO   2 1         *IMAGE AREA TO PARAM        PS107770
                          MDX   2 1         *BUFFER AREA                PS107780
                          MDX   1 1         *0                          PS107790
                          MDX  L  NAMCX,-1  *0                          PS107800
                          MDX     NAM05     *0                          PS107810
                          STX   2 PBUF      SET PBUFF POINTER           PS107820
                    NAM06 EQU     *                                     PS107830
                          BSI  L  RDCRD     READ NEXT CARD              PS107840
                          LD   L  SAREA     FERCH FIRST CHAR            PS107850
                          EOR   3 CN        CHECK FOR N                 PS107860
                          BSC  L  NAMA,+-   BRANCH IF YES               PS107870
                          LDX  L2 PBUFF     NO-INITIALIZE ROUTINE       PS107880
                          LDX  L1 NAMEZ     FOR NEXT NAME CARD          PS107890
                          STX   2 PBUF                                  PS107900
                          STX  L  NMSWX     SET NAME SWITCH             PS107910
                    NAMB  STX  L1 NAMEZ-1                               PS107920
                          BSC  I  NAME      EXIT TO CALLING ROUTINE     PS107930
                    NAMA  LDX  L1 NAM0X     SET FOR NEXT ENTRY          PS107940
                          MDX     NAMB      GO TO EXIT                  PS107950
                    *************************************************** PS107960
                    *             ERROR ROUTINE                         PS107970
                    *************************************************** PS107980
                    NMER1 MDX   1 -1        POINT TO LAST CHAR IN NAME  PS107990
                    NMERR BSI  L  CVDEC     GO FIND INVALID SUBFIELD    PS108000
                    NMEXT LDX  L2 PBUFF     REINITIALIZE NAME ROUTINE   PS108010
                          STX   2 PBUF      *FOR NEXT ENTRY             PS108020
                          LDX  L1 NAMEZ     *                           PS108030
                          STX  L1 NAMEZ-1   *                           PS108040
                          BSI  L  FLUSH     FLUSH TO LIB OR BUILD       PS108050
                    *                                                   PS108060
                    *************************************************** PS108070
                    *             LOCAL CONSTANTS AND BUFFER            PS108080
                    *************************************************** PS108090
                    *                                                   PS108100
                    NMSIX DC      *-*       0 IF SIX CHARACTERS VALID   PS108110
                    NMTMP DC      *-*       XR1 STORAGE                 PS108120
                    NMEND DC      SAREA+71  POINTS TO COLUMN 72         PS108130
                    NAMSV DC      *-*       COLUMN NUMBER STORAGE       PS108140
                    PBUF  DC      PBUFF                                 PS108150
                          HDNG    INSERT ROUTINE   1130 MACRO UPDATE    PS108160
                    *************************************************** PS108170
                    *             INSERT ROUTINE,SCAN INSERT STATEMENT* PS108180
                    *             FOR INSERTION POINT. READS SOURCE   * PS108190
                    *             AND GOES TO DEFIN ROUTINE FOR PACKING PS108200
                    *             TO MACRO PROTOTYPE FORMAT. ENTER WITH PS108210
                    *             BSI  INSRT . INDEX 3 IS EXPECTED TO * PS108220
                    *             POINT TO CONSTANT AREA, CDNO IS     * PS108230
                    *             EXPECTED TO BE ZERO.                * PS108240
                    *************************************************** PS108250
                    *                                                   PS108260
                    INSRT DC      *-*       ENTRY POINT                 PS108270
                          LD    1 1         TEST COL 2 FOR N            PS108280
                          EOR   3 CN        *                           PS108290
                          BSC  L  MUPX2,Z   NO, ILLEGAL REQUEST         PS108300
                          BSI  L  NMTST     TEST IF NAME STATEMENT READ PS108310
                          STX  L  INDLX     SET INSERT/DELETE SWITCH    PS108320
                          BSI     SCAN      GO SCAN FOR INSERT NO       PS108330
                          BSI     PASS      LOCATE INSERT POINT         PS108340
                          MDX     INSRN     BRANCH TO INSERT NEXT       PS108350
                    *                                                   PS108360
                    *************************************************** PS108370
                    *             READ NEXT CARD, CHECK FOR SOURCE CARD PS108380
                    *              IF IT IS, GO TO DEFIN ROUTINE.       PS108390
                    *************************************************** PS108400
                    *                                                   PS108410
                    INSRX DC      *-*       SUBROUTINE ENTRY TO INSRN   PS108420
                          LD      *-2                                   PS108430
                          STO     INSRT     BUILD RETURN THRU INSRT     PS108440
                    INSRN BSI  L  RDCRD     LINK TO READ ROUTINE        PS108450
                          MDX  L  $CTSW,0   MONITOR CONTROL RECORD READ PS108460
                          MDX     INR20     BRANCH IF YES               PS108470
                          MDX  L  DUPCR+C,0 DUP CONTROL RECORD READ     PS108480
                          MDX     INR20     BRANCH IF YES               PS108490
                          LDX  L1 SAREA     CARD AREA POINTER           PS108500
                          LDX   2 19                                    PS108510
                          LD    1 0         SCAN TWENTY COLUMNS         PS108520
                    INR02 OR    1 1         *AND OR TOGETHER            PS108530
                          MDX   1 1         TEST RESULT FOR             PS108540
                          MDX   2 -1        *BLANK TO SEE IF ALL        PS108550
                          MDX     INR02     *ARE BLANK.                 PS108560
                          EOR   3 BLAN                                  PS108570
                          BSC  L  INR05,Z   BRANCH IF NOT ALL BLANK     PS108580
                    *                                                   PS108590
                          LD    3 ESPL      ALL BLANK, TEST WORKING     PS108600
                          BSC  L  PUTTO,+   *STORAGE - BRANCH IF NONE   PS108610
                          BSI  L  DEFIN     PROCESS MACRO SOURCE TEXT   PS108620
                    *                                                   PS108630
                    INR05 LD    3 INDL      TEST INSERT/DELETE SWITCH   PS108640
                          BSC  L  INR10,+-  IF 0, NORMAL EXIT           PS108650
                    *                                                   PS108660
                          LDX  L1 SAREA     POINT TO COL 1              PS108670
                          LDX   2 6         SET TO TABLE LENGTH     212 PS108680
                          BSI  L  MCCSN     GO TO SCAN                  PS108690
                          DC      .I        INSERT                      PS108700
                          DC      INR10     SKIP MACRO END              PS108710
                          DC      .D        DELETE                      PS108720
                          DC      INR10     SKIP MACRO END              PS108730
                          DC      .E        ENDUP                   212 PS108735
                          DC      INR07     SKIP ERROR MESSAGE      212 PS108740
                          BSI   3 EPRT      GO PRINT D102 MESSAGE   212 PS108744
                          DC      EM5       ADDRESS OF MESSAGE      212 PS108746
                    INR07 LD    3 X00FE     PUNCH IN 1-20, END INSER212 PS108750
                          BSI  L  MOVE      MOVE REST OF MACRO          PS108760
                          SLA     16        CLEAR ACCUM                 PS108770
                          STO   3 INDL      CLEAR INSERT/DELETE SWITCH  PS108780
                    INR10 BSC  I  INSRT     RETURN TO CALLER            PS108790
                    *                                                   PS108800
                    INR20 LD    3 INDL      TEST IF INSERTION           PS108810
                          BSC  L  INR10,+-  BRANCH IF NOT               PS108820
                          LD    3 X00FE     MOVE THE REST OF THE        PS108830
                          BSI  L  MOVE      *MACRO                      PS108840
                          SLA     16        RESET INSERT/DELETE         PS108850
                          STO   3 INDL      *SWITCH                     PS108860
                          BSC  L  ENDUP     EXIT MUP                    PS108870
                          EJCT                                          PS108880
                    *************************************************** PS108890
                    *             PASS ROUTINE. MOVES CARDS UNTIL THE * PS108900
                    *             CARD NUMBER IN ARG1 HAS BEEN REACHED* PS108910
                    *             PASS EXITS THROUGH INSRT IF AN      * PS108920
                    *             FE IS ENCOUNTERED FIRST             * PS108930
                    *************************************************** PS108940
                    PASS  DC      *-*                                   PS108950
                          LD    3 MNAM                                  PS108960
                          BSC  L  MUPX2,+-  ERROR IF NOT AT HDR         PS108970
                          LD    3 CRDN                                  PS108980
                          S     3 ARG1      WAS DESIRED CARDS REACHED   PS108990
                          BSC  I  PASS,+-   EXIT IF SO                  PS109000
                    *                                                   PS109010
                          LD    3 FD                                    PS109020
                          BSI  L  MOVE      MOVE CURRENT CARD           PS109030
                          LD    3 MHSW                                  PS109040
                          BSC  L  SCAN2,Z   ERROR IF END OF MACRO       PS109050
                          MDX     PASS+1    TRY AGAIN                   PS109060
                          EJCT                                          PS109070
                    *************************************************** PS109080
                    *CONTROL CARD SCAN ROUTINE.  ENTER WITH BSI  SCAN * PS109090
                    *               INDEX 3 IS EXPECTED TO POINT TO   * PS109100
                    *                 CONSTANT AREA                   * PS109110
                    *               RPT POINTS TO THE FIRST CHARACTER * PS109120
                    *                 TO BE SCANNED.                  * PS109130
                    *             NUMBER WITH COMMA TERMINATOR IS PUT * PS109140
                    *             IN ARG1, NUMBER WITH BLANK TERMINATOR PS109150
                    *             IS PUT IN ARG2.  ON EXIT INDEX 1      PS109160
                    *             POINTS TO LAST NUMBER, INDEX 2 LOST.  PS109170
                    *************************************************** PS109180
                    *                                                   PS109190
                    SCAN  DC      *-*       ENTRY POINT                 PS109200
                          LDX  I1 RPTX      POINT TO CARD PARAMETER     PS109210
                          BSI     PARTS     GO CHECK PARAM VALIDITY     PS109220
                          STX   0 ARGSW     SET ARG SWITCH              PS109230
                    SCAN0 LDS     0         SET COUNT TO ZERO, LOW      PS109240
                          STS     X2CNT     BYTE ONLY,MUST BE 5 OR LES  PS109250
                    *                                                   PS109260
                    SCAN1 LDX   2 4         COUNT OF WORDS IN LIST      PS109270
                          BSI  L  MCCSN     GO TO SCAN                  PS109280
                          DC      .         BLANK                       PS109290
                          DC      SCANN     EXIT FOR BLANK              PS109300
                          DC      .,        COMMA                       PS109310
                          DC      SCANC     EXIT FOR COMMA              PS109320
                    *                                                   PS109330
                          MDX   1 1         NO TERMINATOR, BUMP AND     PS109340
                          MDX  L  X2CNT,1   *SCAN FOR NEXT              PS109350
                          MDX     SCAN1                                 PS109360
                    *************************************************** PS109370
                    *             PROCESS COMMA TERMINATOR              PS109380
                    *************************************************** PS109390
                    SCANC STX   1 SCNC1+1   SAVE POINTER                PS109400
                          LD    3 DELT      INSERT OR DELETE?           PS109410
                          BSC  L  PART2,+-  INSERT, GO TO ERROR RTN     PS109420
                          SLA     16                                    PS109430
                          STO     ARGSW     CLEAR ARG SWITCH            PS109440
                          BSI     SCONV     GO TO CONVERT ROUTINE       PS109450
                          STO   3 ARG1      STORE FIRST NUMBER          PS109460
                    SCNC1 LDX  L1 *-*       RESTORE POINTER AND RETURN  PS109470
                          MDX   1 1         *TO SCAN FOR NEXT           PS109480
                          BSI     PARTS     GO CHECK PARAM VALIDITY     PS109490
                          MDX     SCAN0                                 PS109500
                    ARGSW DC      *-*                                   PS109510
                    *************************************************** PS109520
                    *             ROUTINE TO PROCESS BLANK TERMINATOR   PS109530
                    *************************************************** PS109540
                    SCANN BSI     SCONV     GO TO CONVERT               PS109550
                          STO   3 ARG2      STORE LAST NUMBER           PS109560
                          MDX  L  ARGSW,0                               PS109570
                          STO   3 ARG1      ARG1 = ARG2 IF ONE PARAM    PS109580
                          S     3 ARG1      TEST FOR 1 GREATER THAN 2   PS109590
                          BSC  L  SCAN3,+Z  YES, GO TO ERROR RTN        PS109600
                          LD    3 CRDN      GET CURRENT INPUT POS       PS109610
                          BSC  I  SCAN,+-   IF ZERO, SKIP BACK TEST     PS109620
                          S     3 ARG1      TEST IF INS/DEL BACK        PS109630
                          BSC  I  SCAN,+Z   NO, OK TO EXIT              PS109640
                    SCAN2 BSI   3 EPRT      YES, PRINT SEQ NOT FOUND    PS109650
                          DC      EM1                                   PS109660
                          SLA     16        RESET                       PS109670
                          STO   3 INDL      *INSERT/DELETE SWITCH,      PS109680
                          STO   3 DELT      *DELETE SWITCH,             PS109690
                          MDX  L  SKSWX,0   TEST SKIP SWITCH            PS109700
                          MDX     SCAN4     BRANCH IF SET               PS109710
                          MDX     PART3     GO FLUSH TO NEXT CTRL CD    PS109720
                    SCAN4 STO   3 SKSW      RESET SKIP SWITCH           PS109730
                          STO   3 MHSW      RESET HEADER MOVE SWITCH    PS109740
                          LD    3 X00FE     INDICATE /FE IS TO BE       PS109750
                          STO   3 FESW      *FORCED OUT                 PS109760
                          STO   3 INDL      FAKE INSERT TO FORCE PRINT  PS109770
                          BSI  L  MOVE      PLACE /FE                   PS109780
                          MDX     PART3     GO READ NEXT CONTROL RECORD PS109810
                    *                                                   PS109820
                    SCAN3 LDX  I1 SCNC1+1   SET XR1 FOR ERR MSG         PS109830
                          MDX   1 1         BUMP TO CORRECT             PS109840
                          MDX     PART2     GO TO ERROR RTN             PS109850
                    *                                                   PS109860
                    *************************************************** PS109870
                    *             CONVERSION ROUTINE.  CONVERTS EBC   * PS109880
                    *             NUMBER,POINTED TO LOW ORDER DIGIT BY* PS109890
                    *             INDEX1-1, TO BINARY. RETURNS WITH   * PS109900
                    *             NUMBER IN ACCUMULATOR.              * PS109910
                    *************************************************** PS109920
                    *                                                   PS109930
                    SCONV DC      *-*       ENTRY POINT                 PS109940
                    X2CNT LDX   2 0         COUNT SET ABOVE             PS109950
                          STX   2 X21CT     SAVE 2 FOR FUTURE USE       PS109960
                    CNV0  LD    1 -1        FETCH LOW DIGIT             PS109970
                          MDX   2 -1        DECREMENT COUNT, IF 1,SKIP  PS109980
                          MDX     CNV1      ELSE BRANCH TO CNV1         PS109990
                          AND   3 H0F       MASK OF ZONE BITS           PS110000
                          LDX  L2 *-*       RESTORE COUNT               PS110010
                    X21CT EQU     *-1                                   PS110020
                    CNV2  STO   3 TEMP      SAVE ACC                    PS110030
                          MDX   2 -1        DECREMENT COUNT,SKIP IF 1   PS110040
                          MDX     *+2       BRANCH IF NO SKIP           PS110050
                          BSC  I  SCONV     EXIT ROUTINE                PS110060
                          SLA     2         ACC TIMES 4                 PS110070
                          A     3 TEMP      *+ ACC IS ACC TIMES 5       PS110080
                          SLA     1         TIMES 2 EQUALS ACC X 10     PS110090
                          STO   3 TEMP      STORE                       PS110100
                          SLA     16        CLEAR ACC                   PS110110
                          SLT     4         SHIF IN NEXT                PS110120
                          A     3 TEMP      ADD TEMP AND CONTINUE       PS110130
                          MDX     CNV2      *CONVERSION                 PS110140
                    CNV1  SRT     4         SHIFT TO Q REGISTER         PS110150
                          MDX   1 -1        DECREMENT COUNT, FINISH     PS110160
                          MDX     CNV0      *PACKING NUMBER             PS110170
                    PARTS DC      *-*       VALIDITY CHECK ROUTINE      PS110180
                          LD    1 0         GET 1ST CHAR                PS110190
                          SRA     4         CLEAR NUMERIC               PS110200
                          EOR   3 H0F       TEST FOR F ZONE             PS110210
                          BSC  I  PARTS,+-  YES, RETURN                 PS110220
                    PART2 BSI  L  CVDEC     NO, GO CONVERT COL NO       PS110230
                    PART3 SLA     16        RESET                       PS110240
                          STO   3 INDL      *INSERT/DELETE              PS110250
                          STO   3 DELT      *AND DELETE SWITCH          PS110260
                          BSC  L  MUP09     READ NEXT COMTROL RECORD    PS110270
                          HDNG    DELETE ROUTINE   1130 MACRO UPDATE    PS110280
                    *************************************************** PS110290
                    *             THIS ROUTINE PERFORMS THE DELETION    PS110300
                    *             OF SELECTED STATEMENTS FROM THE       PS110310
                    *             SOURCE LIBRARY.  ENTRY IS BSI  DELET  PS110320
                    *                INDEX 3 MUST POINT TO CONSTANT     PS110330
                    *                AREA.   DELETE STATEMENT IS        PS110340
                    *                SCANNED FOR RANGE OF STATEMENTS TO PS110350
                    *                BE DELETED. DELETION IS PERFORMED. PS110360
                    *                ON EXIT CONTROL IS PASSED TO THE   PS110370
                    *                INSERT CARD READ ROUTINE FOR       PS110380
                    *                POSSIBLE INSERTION. INSERT         PS110390
                    *************************************************** PS110400
                    DELET DC      *-*       ENTRY POINT                 PS110410
                          LD    1 1         TEST COL 2 FOR E            PS110420
                          EOR   3 CE        *                           PS110430
                          BSC  L  MUPX2,Z   ILLEGAL REQUEST IF NOT      PS110440
                    *                                                   PS110450
                          BSI  L  NMTST     TEST IF NAME STATEMENT READ PS110460
                    *                                                   PS110470
                          LD      DELET     SET UP EXIT FROM INSERT     PS110480
                          STO  L  INSRT                                 PS110490
                          STO   3 DELT      SET DELET SWITCH            PS110500
                    *                                                   PS110510
                          LD    3 RPT       SAVE COL POINTER            PS110520
                          STO     DELT2+1   IN CASE OF ERROR            PS110530
                    *                                                   PS110540
                          STX  L  INDLX     SET INSERT/DELETE SWITCH    PS110550
                    *                                                   PS110560
                          BSI     SCAN      SCAN FOR SKIP RANGE         PS110570
                          LD    3 ARG1                                  PS110580
                          BSC  L  DELT2,+-  IF ZERO, GO TO ERROR RTN    PS110590
                          S     3 X0001                                 PS110600
                          STO   3 ARG1      POSITION TO FIRST CARD      PS110610
                          BSI  L  PASS      *TO BE DELETED              PS110620
                    *                                                   PS110630
                          LD    3 ARG2                                  PS110640
                          STO   3 SKSW      SET TO AVOID STORE          PS110650
                          STO   3 ARG1                                  PS110660
                    *                                                   PS110670
                          BSI  L  PASS      DELETE AS REQUESTED         PS110680
                          STO   3 SKSW      CLEAR SKIP SWITCH           PS110690
                          STO   3 DELT      RESET DELET SW              PS110700
                          BSC  L  INSRN     INSERTS MAY BE PRESENT      PS110710
                    *                                                   PS110720
                    DELT2 LDX  L1 *-*       DELETE 0, SET FOR ERROR     PS110730
                          STO   3 DELT      RESET DELETE SW             PS110740
                          MDX     PART2     GO TO ERROR RTN             PS110750
                          HDNG    DEFIN ROUTINE  FOR NEW CODE INSERT    PS110760
                    *************************************************** PS110770
                    *             ROUTINE FOR CONVERTING CARD IMAGE TO  PS110780
                    *             MACRO PROTOTYPE FORM.  ENTRY IS       PS110790
                    *                   BSI   DEFIN                     PS110800
                    *               XR3 MUST POINT TO CONSTANT AREA     PS110810
                    *               XR1 AND XR2 ARE DESTROYED           PS110820
                    *             CARD IMAGE,IN EBCDIC ASSUMED IN SAREA PS110830
                    *************************************************** PS110840
                    DEFIN DC      *-*       ENTRY POINT                 PS110850
                          BSI     EOC       COMPUTE LOGICAL CARD END    PS110860
                          LDX  L1 SAREA+20  XR1 POINTS TO START OF      PS110870
                          LD    1 0         *STATEMENT.GET FIRST        PS110880
                          EOR   3 ASTK      CHECK FOR ASTK.             PS110890
                          STO   3 ASSW      SET SWITCH,0 IF YES         PS110900
                          BSC  L  EBC,+-    IF 0 SKIP OP CODE CHECK     PS110910
                    *                                                   PS110920
                    *************************************************** PS110930
                    *             PACK AND CHECK OP FOR DMES OR EBC     PS110940
                    *************************************************** PS110950
                          LD    1 8         FETCH 3RD CHAR.             PS110960
                          SLA     8         PACK WITH                   PS110970
                          OR    1 9         *4TH CHAR.                  PS110980
                          RTE     16        SAVE BOTH IN Q REGISTER     PS110990
                          LD    1 6         FETCH FIRST CHAR            PS111000
                          SLA     8         PACK WITH                   PS111010
                          OR    1 7         *2 ND. OP NOW IN A AND Q    PS111020
                          STD   3 OPCD      SAVE OP CODE                PS111030
                    *                                                   PS111040
                          LDX  X2 SPTRT-SPOP SET XR2 TO TABLE LENGTH    PS111050
                    DEF01 LD   L2 SPOP-2    FETCH SECOND                PS111060
                          RTE     16        *AND                        PS111070
                          LD   L2 SPOP-3    *FIRST WD OF NAME AND       PS111080
                          SD    3 OPCD      COMPARE                     PS111090
                          BSC     +-        IF FIRS TWO CHARACTERS      PS111100
                          RTE     16        *EQUAL, SWAP A AND Q        PS111110
                          BSC  I2 SPOP-1,+- FOUND-EXIT AS REQUIRED      PS111120
                    *                                                   PS111130
                    DEF02 MDX   2 -3        ELSE LOOP THRU TABLE        PS111140
                          MDX     DEF01                                 PS111150
                    *                                                   PS111160
                    *************************************************** PS111170
                    *             DRIVER FOR DEF SCAN,GET,PUT AND MOVE  PS111180
                    *************************************************** PS111190
                    DEF03 LDD   3 OPT       SAVE CURRENT PUT SETTING    PS111200
                          STD   3 DTMP                                  PS111210
                          LDD   3 OPTD      INITIALIZE TO PROTP AREA    PS111220
                          STD   3 OPT                                   PS111230
                    *                                                   PS111240
                          BSI     SCDEF     GO TO PROCESS STATEMENT     PS111250
                    *                                                   PS111260
                          LDD   3 IPT       SAVE CURRENT GET SETTING    PS111270
                          STD   3 DTMG                                  PS111280
                          LDD   3 GTST      INITIALIZE FOR MOVE FROM    PS111290
                          STD   3 IPT       *PROTOTYPE AREA             PS111300
                          LDD   3 DTMP      RESTORE PUT SETTING         PS111310
                          STD   3 OPT                                   PS111320
                          LD    3 ADSW      IS THIS AN ADD?         212 PS111322
                          BSC  L  DEF04,Z   YES, BRANCH.            212 PS111324
                          LD    3 PSW       SELECT P?               212 PS111330
                          OR    3 ISW       INSERT?                 212 PS111334
                          BSC  L  DEF04,+-  NO, BRANCH              212 PS111335
                          BSI  L  PTINT     YES, CLEAR PRINT BUFFER 212 PS111340
                    DEF04 LD    3 HE740     LOAD X FOR PRINT BUFFER 212 PS111345
                          STO  L  PAREA+9                               PS111350
                          LD      *-1       NEGATIVE NUMBER         212 PS111355
                          STO  L  GET1                              212 PS111360
                          LD    3 FD        SET END OF CARD FLAG        PS111370
                          STO   3 SSW       INHIBIT CRDN UPDATE         PS111380
                          BSI  L  MOVE      GO TO MOVE NEW STATEMENT    PS111390
                    *                                                   PS111400
                          SLA     16                                    PS111410
                          STO   3 SSW       CLEAR SEQ UPDATE SWITCH     PS111420
                    *                                                   PS111430
                          LDD   3 DTMG      RESTORE GET SETTING         PS111440
                          STD   3 IPT                                   PS111450
                          BSC  L  INSRN     GO TO READ NEXT CARD        PS111460
                    *                                                   PS111470
                    *************************************************** PS111480
                    *             PROCESS MAC AND SMAC OP CODES BY    * PS111490
                    *             INCREMENTING NEST COUNT.            * PS111500
                    *************************************************** PS111510
                    *                                                   PS111520
                    MAC   MDX  L  NSTSX,1   01                          PS111530
                          MDX     DEF03     01                          PS111540
                    *************************************************** PS111550
                    *             PROCESS MEND STATEMENT. DECREMENT   * PS111560
                    *             COUNT IF NON ZERO.                  * PS111570
                    *************************************************** PS111580
                    *                                                   PS111590
                    MEND  LD    3 NSTS      FETCH NEST SWITCH           PS111600
                          BSC     Z         TEST FOR ZERO               PS111610
                          S     3 C1        NO-DECREMENT BY ONE         PS111620
                          STO   3 NSTS      RESET AND EXIT              PS111630
                          MDX     DEF03     *01                         PS111640
                          SPAC    2                                     PS111650
                    *************************************************** PS111660
                    *             END OF LOGICAL CARD ROUTINE. SCANS  * PS111670
                    *             FROM COL.71 TO LEFT FOR FIRST NON-  * PS111680
                    *             BLANK. SET COL 72 TO BLANK. ENTRY IS* PS111690
                    *                   BSI    EOC                    * PS111700
                    *                  XR1 AND XR2 ARE DESTROYED      * PS111710
                    *                   XR3 POINTS TO CONSTANT AREA   * PS111720
                    *                ON RETURN XR2 IS THE COUNT OF    * PS111730
                    *                CHARACTERS FOR THIS CARD, XR1    * PS111740
                    *                POINTS TO LAST NON BLANK ON CARD * PS111750
                    *************************************************** PS111760
                    EOC   DC      *-*       ENTRY POINT                 PS111770
                          LDX   2 51        SET MAX COUNT               PS111780
                          LDX  L1 SAREA+70  POINT TO COLUMN 71          PS111790
                    EOC1  LD    3 BLAN      FETCH BLANK                 PS111800
                          STO   1 1         STORE IN LAST CHECKED(COL   PS111810
                          EOR   1 0         *72 FIRST).CHECK THIS       PS111820
                          BSC  L  EOC2,Z    IF NON-BLANK BRANCH         PS111830
                          MDX   1 -1        IF BLANK LOOP TILL NON      PS111840
                          MDX   2 -1        *BLANK FOUND OR COUNT       PS111850
                          MDX     EOC1      *EXHAUSTED                  PS111860
                    EOC2  STX  L1 ECDX      SAVE POINTER AND            PS111870
                          BSC  I  EOC       *EXIT ROUTINE               PS111880
                          SPAC    2                                     PS111890
                    *************************************************** PS111900
                    *             SPECIAL OP CODE TABLE. CONTAINS OPS * PS111910
                    *             REQUIRING SPECIAL HANDLING.         * PS111920
                          SPAC                                          PS111930
                    *************************************************** PS111940
                    SPOP  BSS  E  0                                     PS111950
                          EBC     .EBC .                                PS111960
                          DC      EBC                                   PS111970
                          EBC     .DMES.                                PS111980
                          DC      EBC                                   PS111990
                          EBC     .HDNG.                                PS112000
                          DC      EBC                                   PS112010
                          EBC     .PURG.                                PS112020
                          DC      EBC                                   PS112030
                          EBC     .SMAC.                                PS112040
                          DC      MAC                                   PS112050
                          EBC     .MAC .                                PS112060
                          DC      MAC                                   PS112070
                          EBC     .MEND.                                PS112080
                          DC      MEND                                  PS112090
                          EBC     .DEC .                                PS112100
                          DC      DEC                                   PS112110
                          EBC     .XFLC.                                PS112120
                          DC      DEC                                   PS112130
                    SPTRT EQU     *                                     PS112140
                          SPAC    2                                     PS112150
                    *************************************************** PS112160
                    *             SET EBC SWITCH                        PS112170
                    *************************************************** PS112180
                    EBC   EQU     *                                     PS112190
                          STX  L0 COMX      SET SWTICH NON ZERO         PS112200
                          MDX     DEF03     EXIT                        PS112210
                    *                                                   PS112220
                    DEC   STX  L  DECSW     SET DEC-XFLC SWITCH NON-0   PS112230
                          MDX     DEF03                                 PS112240
                          EJCT                                          PS112250
                    *************************************************** PS112260
                    *             THIS ROUTINE SCANS THE SOURCE TO BE   PS112270
                    *             INSERTED,BUILDS PROTOTYPE IMAGE FOR   PS112280
                    *             INSERTION INTO A MACRO.               PS112290
                    *             ENTRY TO ROUTINE IS  BSI  SCDEF       PS112300
                    *             INDEX 3 IS EXPECTED TO POINT TO       PS112310
                    *             CONSTANT AREA. XR2 HAS COL. COUNT.XR1 PS112320
                    *             IS LOST.   XR1 IS USED AS A POINTER   PS112330
                    *             TO CARD AREA. XR2 IS SCRATCH REGISTER PS112340
                    *             ON EXIT, PROTOTYPE FORM OF CARD IMAGE PS112350
                    *             IS IN PTBUF                           PS112360
                    *************************************************** PS112370
                    SCDEF DC      *-*       ENTRY POINT                 PS112380
                          STX   2 COUNT     SAVE COUNT AND              PS112390
                          STX   2 EXIT+1    FOR EXIT RESTORE            PS112400
                    *                                                   PS112410
                          LDX   2 6         SET FIELD TALLY COUNT       PS112420
                          STX  L2 FLDCT                                 PS112430
                    *                                                   PS112431
                          LDX  L1 SAREA+20  SET XR1 TO COLUMN 21   2-11 PS112441
                    *                                                   PS112460
                    DEFX  SLA     16        CLEAR CHARACTER COUNT       PS112470
                          STO   3 MCHA                                  PS112480
                    *                                                   PS112490
                    DEFX6 STX  L1 DEFX9     SAVE CURRENT POINTER        PS112500
                    *                                                   PS112510
                    DEFX0 LDX  X2 DEFX2-DEFX1  SET XR2 TO TABLE SIZE    PS112520
                          BSI  L  MCCSN     ENTER BASIC SCAN            PS112530
                    *************************************************** PS112540
                    *             THE FOLLOWING IS A LIST OF TERMINATOR PS112550
                    *             AND THEIR RESPECTIVE BRANCH POINTS.   PS112560
                    *************************************************** PS112570
                    DEFX1 DC      .         BLANK                       PS112580
                          DC      DEFT1     GO TO DEFT1                 PS112590
                    *                                                   PS112600
                          DC      .,        COMMA                       PS112610
                          DC      DEFT2     GO TO DEFT2                 PS112620
                    *                                                   PS112630
                          DC      ..        PERIOD                      PS112640
                          DC      DEFT3     GO TO DEFT3                 PS112650
                    *                                                   PS112660
                          DC      ./        SLASH                       PS112670
                          DC      DEFT2     GO TO DEFT2                 PS112680
                    *                                                   PS112690
                          DC      /4E       PLUS                        PS112700
                          DC      DEFT2     GO TO DEFT2                 PS112710
                    *                                                   PS112720
                          DC      /50       AMPERSAND (026 PLUS)        PS112730
                          DC      DEFAM                                 PS112740
                    *                                                   PS112750
                          DC      .*        *                           PS112760
                          DC      DEFT2     GO TO DEFT2                 PS112770
                    *                                                   PS112780
                          DC      /60       MINUS                       PS112790
                          DC      DEFT2     GO TO DEFT2                 PS112800
                    *                                                   PS112810
                          DC      /5D       LEFT PAREN                  PS112820
                          DC      DEFT5     GO TO DEFT5                 PS112830
                    *                                                   PS112840
                          DC      /4D       RIGHT PAREN                 PS112850
                          DC      DEFT6     GO TO DEFT6                 PS112860
                    *                                                   PS112870
                          DC      /7D       APOSTROPHIE                 PS112880
                          DC      DEFT7     GO TO DEFT7                 PS112890
                    *************************************************** PS112900
                    *             TABLE END                             PS112910
                    *************************************************** PS112920
                    DEFX2 EQU     *                                     PS112930
                    DEFX3 MDX  L  MCHAX,1   INCREMENT CHARACTER COUNT   PS112940
                    DEFX4 MDX   1 1         INCREMENT COLUMN POINTER    PS112950
                          STX  L1 DFTSV     SAVE POINTER                PS112960
                    *                                                   PS112970
                          LD    3 ASSW      TEST FOR COMMENTS CARD      PS112980
                          BSC  L  DEFX0,+-  YES, SKIP COL 32 TEST       PS112990
                    *                                                   PS113000
                          LD   L  DFTSV     CHECK IF AT COLUMN 32       PS113010
                          S     3 C32       *                           PS113020
                          BSC  L  DEFX0,Z   NO,BRANCH TO CONTINUE       PS113030
                    *                                                   PS113040
                          BSI     STRNG     YES, GO TO PLACE STRING     PS113050
                          LD    3 BLAN      SET BLANK AS OP FIELD       PS113060
                          MDX     DFT18+1   TERMINATOR AND BRANCH       PS113070
                    *                                                   PS113080
                    DFX10 MDX   1 1         INCREMENT POINTER  R        PS113090
                    DEFX5 BSI  L  PUTT      GO TO PLACE CHARACTER       PS113100
                          MDX     DEFX6     CONTINUE TO SCA             PS113110
                    *                                                   PS113120
                    EXIT  LDX  L2 *-*       RESTOR XR2                  PS113130
                          BSC  I  SCDEF     RETURN TO CALLING ROUTINE   PS113140
                    COUNT DC      *-*       CHARACTER COUNT             PS113150
                    *************************************************** PS113160
                    *             ROUTINE TO PLACE STRING IF NOT A      PS113170
                    *             PARAMETER                             PS113180
                    *************************************************** PS113190
                    DEFX8 DC      *-*                                   PS113200
                          LDX  L1 *-*       PICK UP START POINTER       PS113210
                    DEFX9 EQU     *-1                                   PS113220
                    DEFX7 LD    1 0         FETCH NEXT CHARACTER        PS113230
                          STO   3 CHAR                                  PS113240
                          BSI  L  PUTT      GO PLACE CHARACTER          PS113250
                          MDX   1 1         INCREMENT POINTER           PS113260
                          LD    3 MCHA      REDUCE COUNT                PS113270
                          S     3 ONE       LOOP IF NOT COMPLETE        PS113280
                          STO   3 MCHA      SAVE NEW COUNT              PS113290
                          BSC  I  DEFX8,+-                              PS113300
                          MDX     DEFX7     EXIT ROUTINE                PS113310
                    BUFAD DC      PAREA+13  START OF CARD IMAGE    2-11 PS113312
                    PAR4B DC      /004B     HEX PERIOD              212 PS113314
                    ADDR1 DC      SAREA+20  ADDRESS OF COL 21      2-11 PS113316
                          SPAC    2                                     PS113323
                    *************************************************** PS113324
                    *                                                 * PS113330
                    *ROUTINE FOR PROCESSING BLANK TERMINATOR.  ENTERED* PS113335
                    *   FROM SCAN VIA SYNTAX TABLE IN CALLING         * PS113340
                    *   SEQUENCE.                                     * PS113345
                    *                                                 * PS113350
                    *************************************************** PS113360
                          SPAC    2                                     PS113365
                    DEFT1 EQU     *                                     PS113370
                          BSI  L  STRNG     CHECK FOR PARAMETER         PS113380
                          LD    3 ASSW                                  PS113390
                          BSC  L  DFT15,+-  BRANCH IF COMMENTS CARD     PS113400
                    DFT11 MDX  L  FLDCT,-1  DEC AND TEST FIELD COUNT    PS113410
                          MDX     DFT18     ELSE DO STEP 8 (DFT18)      PS113420
                    DFT12 MDX  L  EBCSX,0   IF EBC OR DMES STATEMENT    PS113430
                          MDX     DFT15     *PASS BLANK                 PS113440
                    DFT13 MDX  L  LPCTX,0   IF WITHIN PARENTHESIS       PS113450
                          MDX     DFT15     *PASS BLANKS                PS113460
                    DFT14 MDX  L  CSWX,0    IF COMMENTS ARE TO BE       PS113470
                          MDX     DFT15     *CARRIED, PASS BLANKS       PS113480
                          MDX     DFT17     ELSE, GO TO STEP 7*DFT17    PS113490
                    *                                                   PS113500
                    DFT15 LD    3 ECD       COMPARE CURRENT POSITION    PS113510
                          S       DFTSV     *WITH END OF CARD           PS113520
                          BSC  L  DFT17,+   IF AT END, BRANCH           PS113530
                          LD    3 X0001     SET FIELD COUNT TO 1        PS113540
                          STO     FLDCT     FOR OPERAND FIELD           PS113550
                    DFT16 SLA     16        ELSE, CLEAR CHARACTER       PS113560
                          STO   3 MCHA      *COUNT, FETCH CHARACTER     PS113570
                    DF16B EQU     *         *                           PS113580
                          LD    1 0         *AND RETURN                 PS113590
                          STO   3 CHAR      *06                         PS113600
                          MDX     DFX10     *TO CONTINUE PROCESS        PS113610
                    *                                                   PS113620
                    DF16A BSC  L  FT-2,+-   IF ZERO,BRANCH TO DO PUT    PS113630
                          S     3 C2        TEST FOR COLUMN 34          PS113640
                          BSC  L  FT,Z      BRANCH IF NO                PS113650
                          STO   3 MCHA      CLEAR CHARACTER COUNT       PS113660
                          MDX   1 1         INCREMENT POINTER TO SKIP   PS113670
                          LD    3 X0001     SET FIELD COUNT TO 1        PS113680
                          STO     FLDCT     FOR OPERAND FIELD           PS113690
                          MDX     DEFX6     CONTINUE SCAN               PS113700
                    *                                                   PS113710
                    DFT17 LD    3 FD        SET END OF CARD INDICATOR   PS113720
                          STO   3 CHAR      *INTO PROTOTYPE             PS113730
                    *                                                   PS113740
                          SLA     16        CLEAR EBC-DMES COMMENT      PS113750
                          STO   3 COM       *TYPE SWTICH                PS113760
                          STO   3 EBCS      *01                         PS113770
                    *                                                   PS113780
                          BSI     PUTT      GO TO PLACE CHAR            PS113790
                          MDX     EXIT      EXIT SCANNER ROUTINE        PS113800
                    *                                                   PS113810
                    DFT18 LD    1 0         FETCH TERMINATOR            PS113820
                          STO   3 CHAR      *AND SAVE FOR ENTRY TO PUT  PS113830
                    *                                                   PS113840
                    DF18A LD      DFTSV                                 PS113850
                          S     3 C32       32 OR BEYOND (33 OR         PS113860
                          BSC  L  DF16A,-   *34)PLACE BLANK             PS113870
                          A     3 L5        ELSE IF 27 OR GREATER       PS113880
                          BSC  L  DFT8X,-   *BRANCH TO SET TO COLUMN 32 PS113890
                          LDX  L1 SAREA+26  SET TO COLUMN 27            PS113900
                          MDX     DFT8Y                                 PS113910
                    *                                                   PS113920
                    DFT8X LDX  L1 SAREA+31  SET TO COLUMN 32            PS113930
                          LD    3 COM       SET EBC SWTICH              PS113940
                          STO   3 EBCS                                  PS113950
                          BSI     PUTT      GO TO PLACE CHAR            PS113960
                    FT    STX   1 DEFX9     SET CURRENT POSITION        PS113970
                          LD    1 0         TEST FOR SLASH              PS113980
                          EOR   3 SLSH      IF YES, GO TO / PROCESS     PS113990
                          BSC  L  DEFT2,+-  *ROUTINE                    PS114000
                          LD    3 ONE       SET CHARACTER COUNT = 1     PS114010
                          STO   3 MCHA      *TO PROCESS FLAG OR TAG     PS114020
                          BSI     STRNG     *FIELDS                     PS114030
                          MDX   1 1         BUMP POINTER                PS114040
                          STX   1 DFTSV     SET FOR TEST AT DFT18A      PS114050
                          MDX     DF18A     BRANCH TO TEST              PS114060
                    *                                                   PS114070
                    DFT8Y SLA     16        CLEAR CHARACTER COUNT       PS114080
                          STO   3 MCHA      *SWITCH AND RETURN          PS114090
                          MDX     DEFX5                                 PS114100
                    *                                                   PS114110
                    FLDCT DC      *-*       FIELD COUNT                 PS114120
                    DFT8Z MDX     DFT16                             212 PS114130
                    STRNG DC      *-*       ENTRY                       PS114140
                          STX   1 DFTSV     SAVE X1                     PS114150
                    STNG1 LD    3 MCHA      IF MCHA=0, NO STRING        PS114160
                          BSC  L  STNG4,+-  *PRESENT, EXIT              PS114170
                          LDX  I1 DEFX9     SET X1 AS POINTER           PS114180
                          BSI  L  PCHEK     CHECK FOR PARAMETER         PS114190
                          BSC  L  STNG3,-Z  YES, PROCESS PARAMETER      PS114200
                    STG11 LD    3 AMPS      NO, TEST IF AMPERSAND       PS114215
                          BSC  L  STNG2,+-  NO, GO PLACE STRING         PS114220
                          LD    3 CAMP      YES, GET AMPERSAND          PS114230
                          STO   3 CHAR      *AND                        PS114240
                          BSI     PUTT      *PUT IN PLACE               PS114250
                          MDX  L  MCHAX,-1  DECREMENT COUNT             PS114260
                          NOP               ALLOW FOR SKIP              PS114270
                          MDX  L  DEFX9,1   POINT TO NEXT CHARACTER     PS114280
                          SLA     16        CLEAR AMPERSAND SWITCH      PS114290
                          STO   3 AMPS      *                           PS114300
                          MDX     STNG1     TEST WITHOUT AMPERSAND      PS114310
                    *                                                   PS114320
                    STNG2 BSI  L  DEFX8     GO PLACE STRING             PS114330
                    STNG3 STO   3 CHAR      STORE PARAM NO. OR ZERO     PS114340
                          BSI  L  PUTT,Z    PLACE PARAMETER NO.         PS114350
                          SLA     16        CLEAR AMPERSAND SWITCH      PS114360
                          STO   3 AMPS      *                           PS114370
                    STNG4 LDX  L1 *-*       RESTORE XR1                 PS114380
                    DFTSV EQU     *-1                                   PS114390
                          BSC  I  STRNG     EXIT                        PS114400
                    *                                                   PS114410
                    *************************************************** PS114420
                    *             ROUTINE TO CALL PUTCH AND UPDATE    * PS114430
                    *             LIBRARY AND SECTOR BALANCE COUNTS   * PS114440
                    *             FOR OVERFLOW PROTECTION             * PS114450
                    *************************************************** PS114460
                    PUTT  DC      *-*       ENTRY                       PS114470
                          BSI  L  PUTCH     PUT CHARACTER               PS114480
                          MDX  L  SBALX,-1  DECREMEN SECTOR BALANCE     PS114490
                          MDX     PUTTX     NO SKIP, BRANCH TO EXIT     PS114500
                          LD    3 LBAL      FETCH SECTOR BALANCE AND    PS114510
                          S     3 C1        *DECREMENT                  PS114520
                          BSC  L  PUTTY,+-  TEST OVERFLOW, BR IF 0      PS114530
                          STO   3 LBAL      SAVE                        PS114540
                          LD    3 D640                                  PS114550
                          S     3 C2                                    PS114560
                          STO   3 SBAL                                  PS114570
                    PUTTX BSC  I  PUTT      EXIT                        PS114580
                    *                                                   PS114590
                    PUTTY LD    3 ADSW      TEST FOR ADD                PS114600
                          BSC  I  PUTT,Z    YES, RETURN                 PS114610
                          LDD   3 DTMP      RESTORE OPT FOR             PS114620
                          STD   3 OPT       PUT TO PLACE IN OUTPUT      PS114630
                          STO   3 LPSW      SET FOR LIBRARY FLUSH       PS114640
                          STO   3 LNRS      SET LIB NAME RESET SW       PS114650
                          LD    3 SPOV      TEST IF SPILL OVERFLOW      PS114660
                          BSC  L  PUTTO,Z   YES, GO TO SPILL MSG        PS114670
                          BSI   3 EPRT      PRINT OVERFLOW MESSAGE      PS114680
                          DC      EM2                                   PS114690
                    *                                                   PS114700
                    PUTTZ LD    3 X00FE     MOVE OUT CURRENT MACRO      PS114710
                          BSI  L  MOVE      *                           PS114720
                          SLA     16        RESET INSERT/DELETE SWITCH  PS114730
                          STO   3 INDL      *                           PS114740
                          BSI  L  UPDAT     FLUSH CURRENT LIBRARY       PS114750
                          STO   3 LNRS      RESET LIB NAME RESET SW     PS114760
                          STO   3 SPOV      RESET SPILL OVERFLOW SWITCH PS114770
                          BSC  L  B071      GO RESET ADD & FLUSH CDS    PS114780
                    *                                                   PS114790
                    PUTTO BSI   3 EPRT      PRINT SPILL OVERFLOW MSG    PS114800
                          DC      EM3                                   PS114810
                          MDX     PUTTZ     GO FLUSH LIBRARY            PS114820
                    *                                                   PS114830
                    *************************************************** PS114840
                    *             PROCESS GENERAL TERMINATORS AS        PS114850
                    *             FOLLOWS  , + - * - /                  PS114860
                    *************************************************** PS114870
                    DEFT2 EQU     *                                     PS114880
                          BSI  L  STRNG     CHECK FOR PARAMETER         PS114890
                          BSC  L  DFT16                                 PS114900
                          SPAC    2                                     PS114910
                    *************************************************** PS114920
                    *             PROCESS PERIOD TERMINATOR. ACTS AS  * PS114930
                    *             A GENERAL CONCATENATOR              * PS114940
                    *************************************************** PS114950
                    DECSW DC      *-*       NON-ZERO IF DEC OR XFLC     PS114960
                          SPAC                                          PS114970
                    DEFT3 MDX  L  MCHAX,0   IF 0, NO CONCATENATION  212 PS114987
                          MDX     DFT32     PROCESS AS CONCATENATOR     PS114989
                          MDX     DFT8Z                             212 PS114992
                    DFT32 MDX  L  EBCSX,0                           212 PS115025
                          MDX     DEFT2     YES-BRANCH                  PS115030
                          LD      DECSW     NO, TEST IF DEC OR XFLC     PS115040
                          BSC  L  DFT33,+-  NO, TREAT AS CONCATENATOR   PS115050
                    DFT43 SLA     16        YES CLEAR DEC-XFLC SWITCH   PS115060
                          STO     DECSW     *                           PS115070
                          BSC  L  DEFX3     TREAT AS ANY OTHER CHAR     PS115080
                    DFT33 BSI  L  STRNG     CHECK FOR PARAMETER         PS115090
                          MDX   1 1         INCREMENT POINTER      2-11 PS115106
                          BSC  L  DEFX      CONTINUE SCAN TO NEXT       PS115110
                    *                                                   PS115120
                    *************************************************** PS115130
                    *                          SCAN ROUTINE           * PS115140
                    *             ROUTINE TO PROCESS LEFT PAREN TERM. * PS115150
                    *             ENTERED FROM SCAN (MCCSN) VIA SYNTAX* PS115160
                    *             TABLE IN CALLING SEQUENCE           * PS115170
                    *************************************************** PS115180
                    DEFT5 MDX  L  EBCSX,0   IF EBC OR DMES, EXIT TO     PS115190
                          MDX     *+2       PROCESS AS STANDARD TERM.   PS115200
                          MDX  L  LPCTX,1   BUMP LEFT PAREN COUNT       PS115210
                    DFT53 MDX     DEFT2                                 PS115220
                          SPAC    2                                     PS115230
                    *************************************************** PS115240
                    *             ROUTINE TO PROCESS RIGHT PAREN. SAME* PS115250
                    *             AS DEFT5 EXCEPT LEFT PAREN COUNT IS * PS115260
                    *             DECREMENTED                         * PS115270
                    *************************************************** PS115280
                    DEFT6 MDX  L  EBCSX,0   CHECK FOR EBC OR DMES, IF   PS115290
                          MDX     *+3       *NO, SKIP. ELSE EXIT        PS115300
                          MDX  L  LPCTX,-1  DECREMENT PAREN COUNT       PS115310
                          MDX     *         MAY SKIP                    PS115320
                          MDX     DFT53     RETURN TO PROCESS AS        PS115330
                    *                        NORMAL TERMINATOR          PS115340
                          SPAC    2                                     PS115350
                    *************************************************** PS115360
                    *             ROUTINE TO PROCESS APOSTROPHIE      * PS115370
                    *              IF AN EBC OR DMES, PASS CHARACTER. * PS115380
                    *              IF NOT SET PROPER NAME GENERATION  * PS115390
                    *              FLAG. FC IF MCHA IS 0, FB IF NOT   * PS115400
                    *************************************************** PS115410
                    DEFT7 LD    3 EBCS      IF EBC SWITCH OR           2PS115420
                          OR    3 NSTS      *NEST SWITCH ARE NON-ZERO01 PS115430
                          BSC  L  DFT71,Z   BRANCH TO PASS QUOTE        PS115440
                          LD    3 FC        NO EBC OR DMES, TEST MCHA   PS115450
                          MDX  L  MCHAX,0   IF SKIP USE FC              PS115460
                          S     3 ONE       NO-MAKE FB                  PS115470
                          STO   1 0         SAVE CHARACTER AND          PS115480
                    DFT71 EQU     *                                     PS115490
                          LD    3 MCHA      IF MCHA 0, BRANCH           PS115500
                          BSC  L  DF16B,+-                              PS115510
                          BSI  L  STRNG     CHECK FOR PARAMETER         PS115520
                          SLA     16        CLEAR MCHA                  PS115530
                          STO   3 MCHA                                  PS115540
                          LD    3 EBCS      IF EBC,DMES OR NESTED       PS115550
                          OR    3 NSTS      DEFINITION, BRANCH TO       PS115560
                          BSC  L  DF16B,Z   PASS QUOTE                  PS115570
                          LD   L  FLDCT     REDUCE FIELD SIZE           PS115580
                          S     3 ONE                                   PS115590
                          BSC  L  DF16B,+-  IF LAST FIELD,PROCESS       PS115600
                          STO  L  FLDCT     ELSE STORE AND RETURN TO    PS115610
                          BSC  L  DFT18     *SET FIELD                  PS115620
                          SPAC    2                                     PS115630
                    *************************************************** PS115640
                    *             PROCESS AMPERSAND                     PS115650
                    *************************************************** PS115660
                    DEFAM LD    3 MCHA      TEST IF CHARACTER COUNT=0   PS115670
                          BSI  L  STRNG,Z   NO, GO TO PROCESS STRING    PS115680
                          LD    3 ONE                                   PS115690
                          STO   3 AMPS      AMPERSAND SWITCH            PS115700
                          STO   3 MCHA      CHARACTER COUNT             PS115710
                          STX  L1 DEFX9     SAVE STARTING ADDRESS       PS115720
                          MDX   1 1         POINT TO NEXT CHARACTER     PS115730
                          BSC  L  DEFX0                                 PS115740
                    DFAM1 SLA     16        CLEAR MCHA                  PS115750
                          STO   3 MCHA                                  PS115760
                          STX  L1 DEFX9     STORE POINTER               PS115770
                          BSC  L  DEFX3     RETURN TO SCAN              PS115780
                          HDNG    PCHEK                                 PS115790
                    *************************************************** PS115800
                    *             PARAMETER CHECK ROUTINE               PS115810
                    *************************************************** PS115820
                    PNUM  DC      *-*                                   PS115830
                    PCHEK DC      *-*       ENTRY                       PS115840
                          STX   1 PCSV1     SAVE INDEX                  PS115850
                          STX   2 PCSV2     *REGISTERS                  PS115860
                    *                                                   PS115870
                          LDX   2 1         SET COUNT TO 1              PS115880
                          STX   2 PNUM                                  PS115890
                          LDX  L2 PBUFF+1   SETUP XR2 AS A POINTER      PS115900
                          LD    2 -1                                    PS115910
                    PC00  BSC  L  PCEXT,+   IF COUNT ZERO OR -,EXIT     PS115920
                          S     2 0         SUBTRACT NO. CHAR THIS      PS115930
                          RTE     16        *PARAMETER AND STORE IN Q   PS115940
                          LD    2 0         FETCH COUNT THIS PARA       PS115950
                          STO   3 NAMC      SAVE                        PS115960
                          S     3 MCHA      COMPARE WITH MCHA           PS115970
                          MDX   2 1         BUMP POINTER                PS115980
                          BSC  L  PC03,Z    IF NOT EQUAL BRANCH         PS115990
                    PC01  LD    2 0         ELSE COMPARE CHARACTERS     PS116000
                          S     1 0                                     PS116010
                          BSC  L  PC03,Z    BRANCH NO COMPARE           PS116020
                          MDX   2 1         BUMP BOTH                   PS116030
                          MDX   1 1         *POINTERS                   PS116040
                          MDX  L  NAMCX,-1  DECREMENT COUNT             PS116050
                          MDX     PC01      LOOP                        PS116060
                          LD      PNUM      PICK UP PARA NUMBER         PS116070
                    PCEXT LDX  L1 *-*       RESTORE REGISTERS           PS116080
                    PCSV1 EQU     *-1                                   PS116090
                          LDX  L2 *-*                                   PS116100
                    PCSV2 EQU     *-1                                   PS116110
                          BSC  I  PCHEK     AND EXIT ROUTINE            PS116120
                    PC03  MDX  L  PNUM,1    INCREMENT PARA NUM          PS116130
                          MDX  I2 NAMCX     INCREMENT POINTER           PS116140
                          RTE     16        LOAD ACC FROM Q             PS116150
                          S     3 ONE       DECREMENT TO ACCT FOR CNT   PS116160
                          LDX  I1 PCSV1     REFRESH XR1                 PS116170
                          MDX     PC00      LOOP BACK TO TEST NEXT      PS116180
                          HDNG    MACRO NAME SCAN                       PS116190
                    *************************************************** PS116200
                    *             MSNSC CHECKS FOR VALID MACRO NAMES  * PS116210
                    *             IN ADD, PURGE, OUTPUT, RENAME, AND  * PS116220
                    *             UPDATE CONTROL STATEMENTS.  THE 1ST * PS116230
                    *             NON-BLANK COL MUST BE A QUOTE, NAME * PS116240
                    *             CHAR'S CANNOT BE PERIOD, COMMA, LEFT* PS116250
                    *             OR RIGHT PARENTHESIS, AND THE NAME  * PS116260
                    *             MUST END WITH A QUOTE.              * PS116270
                    *************************************************** PS116280
                    MSNSC DC      *-*       ENTRY POINT                 PS116290
                          LDX  I1 RPTX      XR1 = ADDR OF 1ST NONBLANK  PS116300
                          LD    1 0         GET FIRST CHARACTER         PS116310
                          EOR   3 QUOT      TEST FOR QUOTE              PS116320
                          BSC  L  MSNER,Z   NOT QUOTE, ERROR            PS116330
                          MDX   1 1         BUMP TO NEXT CHARACTER      PS116340
                          LD    1 0         TEST FOR QUOTE              PS116350
                          EOR   3 QUOT      *                           PS116360
                          BSC  L  MSNER,+-  ERROR IF QUOTE ('')         PS116370
                          LD    3 L5        SET FIELD LENGTH            PS116380
                          STO     MSNCT     *                           PS116390
                    MSNLP LDX   2 10        SET TABLE LENGTH            PS116400
                          BSI  L  MCCSN     SCAN A CHARACTER            PS116410
                          DC      ..        PERIOD                      PS116420
                          DC      MSNER     *IS AN ERROR                PS116430
                    *                                                   PS116440
                          DC      .,        COMMA                       PS116450
                          DC      MSNER     *IS AN ERROR                PS116460
                    *                                                   PS116470
                          DC      .(        LEFT PARENTHESIS            PS116480
                          DC      MSNER     *IS AN ERROR                PS116490
                    *                                                   PS116500
                          DC      .)        RIGHT PARENTHESIS           PS116510
                          DC      MSNER     *IS AN ERROR                PS116520
                    *                                                   PS116530
                          DC      .'        QUOTE                       PS116540
                          DC      MSNRT     *IS ONLY VALID TERMINATOR   PS116550
                    *                                                   PS116560
                          MDX   1 1         BUMP CHARACTER POINTER      PS116570
                          MDX  L  MSNCT,-1  DECREMENT CHARACTER COUNT   PS116580
                          MDX     MSNLP     CONTINUE SCAN               PS116590
                          LD    1 0         TEST FOR TRAILING QUOTE     PS116600
                          EOR   3 QUOT      *                           PS116610
                          BSC  L  MSNER,Z   ERROR IF NOT                PS116620
                    MSNRT BSC  I  MSNSC     RETURN                      PS116630
                    *                                                   PS116640
                    MSNER BSI   3 EPRT      PRINT INVALID NAME          PS116650
                          DC      EM15      *MESSAGE                    PS116660
                          BSC  L  MUP09     READ NEXT CONTROL STATEMENT PS116670
                    MSNCT DC      *-*       CHARACTER COUNT             PS116680
                          HDNG    BASIC SCAN ROUTINE                    PS116690
                    *************************************************** PS116700
                    *             BASIC SCAN ROUTINE                  * PS116710
                    *                 TO ENTER-XR1 POINTS TO CHARACTER* PS116720
                    *                          XR2 NO OF WORDS IN     * PS116730
                    *                              SYNTAX LIST        * PS116740
                    *                   BSI    MCCSW                  * PS116750
                    *                   DC     TERM1                  * PS116760
                    *                   DC     ADDR1   SYNTAX LIST    * PS116770
                    *                   DC     TERM2                  * PS116780
                    *                   DC     ADDR2                  * PS116790
                    *             0 BIT ON IN TERM INDICATES SUBROUTINE PS116800
                    *             LINKAGE IS TO BE BUILT - CALLED     * PS116810
                    *             SUBROUTINE RETURNS TO THE ADDRESS 2 * PS116820
                    *             WORDS BEYOND ENTRY POINT ADDRESSS.  * PS116830
                    *************************************************** PS116840
                          SPAC    2         .                           PS116850
                    MCCSN DC      *-*                                   PS116860
                          STX   2 MCSN2     SET UP COUNT                PS116870
                          LDX  I2 MCCSN     FETCH CALLING LIST POINTER  PS116880
                    MCSN1 LD    1 0         CHECK CHARACTER             PS116890
                          EOR   2 0         AGAINST LIST                PS116900
                          BSC  L  SUBSN,+Z  IF MINUS, SUBROUTINE CALL   PS116910
                          BSC  I2 1,+-      IF EQUAL, EXIT VIA LIST     PS116920
                    MCSN3 EQU     *                                     PS116930
                          MDX   2 2         STEP THROUGH LIST           PS116940
                          MDX  L  MCSN2,-2  DECREMENT COUNT             PS116950
                          MDX     MCSN1     LIST NOT DONE, LOOP BACK    PS116960
                          BSC  L2 0         RETURN TO CALLING ROUTINE   PS116970
                    *                                                   PS116980
                    MCSN2 EQU     *-1       FOUND, EXIT                 PS116990
                    SUBSN MDX   2 1         ACCOUNT FOR EXTRA WORD      PS117000
                          MDX  L  MCSN2,-1  *IN CALLING SEQUENCE        PS117010
                          AND   3 X00FF     MASK OUT FLAGS              PS117020
                          BSC  L  MCSN3,Z   IF NOT EQUAL, BRANCH        PS117030
                          STX   2 *+2       SAVE ENTRY POINT INDEX      PS117040
                          LD    2 1         GET RETURN POINT            PS117050
                          LDX  I2 *-*       ENTRY POINT TO INDEX        PS117060
                          STO   2 0         SET RETURN FOR CALLEE       PS117070
                          BSC  L2 1         ENTER CALLEE                PS117080
                          HDNG    PRINT ROUTINES                        PS117090
                    *************************************************** PS117100
                    *             ROUTINE TO FORMAT PRINTING OF         PS117110
                    *             PROTOTYPE STATEMENTS.                 PS117120
                    *             ENTRY- BSI PRNTC  XR3 IS EXPECTED TO  PS117130
                    *               POINT TO CONSTANT AREA. USES PRINT. PS117140
                    *************************************************** PS117150
                    PRNTC DC      *-*       ENTRY POINT                 PS117160
                          STO   3 CHAR      SAVE INPUT CHARACTER        PS117170
                          MDX  L  SKSWX,0                               PS117180
                          MDX     SVX1                                  PS117190
                          STX   2 SVX2+1                                PS117200
                          LD    3 IND                                   PS117210
                          BSC  L  PTC1,Z    TO PRINT IF NOT FIRST TIME  PS117220
                          LD   L  BUFAD     LOAD POINTER FOR CARD   212 PS117224
                          STO   3 CPP       AND STORE               212 PS117226
                          MDX  L  INDX,1    UPDATE FIELD INDICATOR      PS117230
                          LD    3 CHAR                                  PS117240
                          EOR   3 ASTK                                  PS117250
                          STO   3 ASSW      SET SW=0 IF ASTERISK        PS117260
                    PTC1  LD    3 CHAR      LOAD CHARACTER          212 PS117276
                          BSI   3 PRNT      PLACE CHARACTER             PS117280
                    PTC2  LD    3 ASSW      LOAD ASTERISK SWITCH   2-11 PS117290
                          BSC  L  SVX2,+-   AND TEST                    PS117300
                          LD    3 CHAR                                  PS117310
                          EOR   3 BLAN      IS IT BLANK                 PS117320
                          BSC  L  CHEK,+-   YES, BRANCH                 PS117330
                          LD    3 IND       NO, FETCH INDICATOR         PS117340
                          S     3 L3        IS IT 3 OR GREATER          PS117350
                          BSC  L  CHEK,-    YES, BRANCH                 PS117360
                          LD    3 CHAR                                  PS117370
                          S     3 FB        IS CHARACTER  FB            PS117380
                          BSC  L  CHEK,+-   YES, BRANCH                 PS117390
                          MDX     SVX2      EXIT IF COMMENTS CARD       PS117400
                    *                                                   PS117410
                    *************************************************** PS117420
                    *             ROUTINE TO SET INDICATOR AND EXIT   * PS117430
                    *             VIA PRINT                           * PS117440
                    *************************************************** PS117450
                    SETI  MDX  L  INDX,1    UPDATE FIELD INDICATOR      PS117460
                    SVX2  LDX  L2 *-*       RESTORE XR2                 PS117470
                          LD    3 CHAR      FETCH CHARACTER             PS117480
                    SVX1  BSC  I  PRNTC     EXIT                        PS117490
                    *             CHECK ROUTINE                         PS117500
                    CHEK  LD    3 IND       FETCH INDICATOR             PS117510
                          LDX  L2 BRCH      COMPUTE BRANCH TABLE        PS117520
                          STO     *+1       *LOCATION AND EXECUTE       PS117530
                          BSC  I2 *-*       *BRANCH                     PS117540
                    BRCH  EQU     *-1                                   PS117550
                          DC      IND1                                  PS117560
                          DC      IND2                                  PS117570
                          DC      SETI                                  PS117580
                          DC      IND4                                  PS117590
                          DC      SVX2                                  PS117600
                    IND1  LDX   2 6         POINT TO POSITION 27        PS117610
                          LD      *-1                               212 PS117612
                          STO  L  GET1      SET PARM FOUND SWITCH   212 PS117614
                          MDX     SETIX+1   *                           PS117620
                    IND2  LDX   2 9                                     PS117630
                          LD      *-1                               212 PS117632
                          STO  L  GET1      SET PARM FOUND SWITCH   212 PS117634
                          MDX     SETIX                                 PS117640
                    IND4  EQU     *                                     PS117650
                          LDX   2 10        POINT TO POSITION 35        PS117660
                          LD      *-1                               212 PS117662
                          STO  L  GET1      SET PARM FOUND SWITCH   212 PS117664
                          MDX     SETIX+1   *                           PS117670
                    SETIX SLA     16                                    PS117680
                          STO   3 PRTSW     POSITION LEFT OR RIGHT CHAR PS117690
                          LD    3 P9RT      SET UP PRINT POSITION       PS117700
                          STX   2 P9SVP     *POINTER BASED ON           PS117710
                          A       P9SVP     *COUNT IN XR2               PS117720
                          STO   3 CPP                                   PS117730
                          MDX     SETI                                  PS117740
                    P9SVP DC      *-*                                   PS117750
                    *                                                   PS117760
                          HDNG    PRNTN                                 PS117770
                    *************************************************** PS117780
                    *                                                 * PS117790
                    *PRNTN - THIS ENTRY FETCHES THE SEQUENCE NUMBER,  * PS117800
                    *   CONVERTS IT TO EBCDIC, AND PLACES IT IN THE   * PS117810
                    *   PRINT BUFFER.                                 * PS117815
                    *                                                 * PS117820
                    *************************************************** PS117830
                    *                                                   PS117840
                    PRNTN DC      *-*       ENTRY POINT                 PS117850
                          STX   2 PRTN2+1   SAVE INDEX 2                PS117870
                          LD    3 CDNO      LOAD CARD NUMBER       2-11 PS117878
                          LDX   2 5                                     PS117880
                          RTE     16        ACC TO Q                    PS117890
                    PRTN1 SLA     16        CLEAR ACC                   PS117900
                          D    L2 L1-1      DIVIDE BY TABLE TO CONVT.   PS117910
                          STD   3 OPCD      SAVE Q                      PS117920
                          OR    3 F0        FORM EBCDIC DIGIT IN ACC    PS117930
                          BSI  L  P9MVE     GO TO CONVERT,STASH,PRINT   PS117940
                          LDD   3 OPCD      RESTORE Q REGISTER          PS117950
                          MDX   2 -1        LOOP TILL 5 CHARACTERS      PS117960
                          MDX     PRTN1     *HAVE BEEN CONVERTED        PS117970
                    PRTN2 LDX  L2 *-*       RESTORE INDEX 2             PS118020
                          BSC  I  PRNTN     RETURN                      PS118030
                    *                                                   PS118040
                          HDNG    PRIN1                                 PS118050
                    *************************************************** PS118060
                    *                                                 * PS118070
                    *PRIN1 - THIS IS THE MAIN PRINT ENTRY POINT. ENTER* PS118080
                    *   WITH AN EBCDIC CHARACTER IN THE ACCUMULATOR.  * PS118090
                    *   ON RETURN, THE ACCUMULATOR AND INDEX REGISTERS* PS118100
                    *   ARE RESTORED.  INDEX REGISTER 3 IS EXPECTED TO* PS118110
                    *   POINT TO THE CONSTANT AREA.  A CHARACTER IS   * PS118120
                    *   PLACED IN THE PRINT BUFFER.  THESE CHARACTERS * PS118130
                    *   ARE TREATED AS FOLLOWS:  FB AND FC ARE APOS-  * PS118140
                    *   TROPHES, FD CAUSES A LINE TO BE PRINTED, AND  * PS118150
                    *   FE CAUSES A MACRO END OR LIBRARY END MESSAGE  * PS118160
                    *   TO BE PRINTED.                                * PS118170
                    *                                                 * PS118175
                    *************************************************** PS118180
                    *                                                   PS118190
                    PRIN1 DC      *-*       ENTRY                       PS118200
                          BSC  I  PRIN1,+-  EXIT PRINT ROUTINE IF ZERO  PS118210
                          STO   3 CHAR                                  PS118220
                          SRT     6                                     PS118230
                          BSC  L  PSUB,+-   BRANCH IF PARAMETER         PS118240
                          LD    3 CHAR                                  PS118250
                          S     3 FA        TEST IF GREATER THAN FA     PS118260
                          BSC  L  PRNT1,+Z  BRANCH IF NOT               PS118270
                          S     3 L3        TEST IF LESS THAN FD.       PS118280
                          BSC  L  PRNT2,+Z  BRANCH IF YES.              PS118290
                          BSC  L  PRNT3,Z   BRANCH IF GREATER THAN FD.  PS118300
                    PRTND LDX  L3 D         RESET INDEX 3 TO CON AREA   PS118310
                          LD    3 BLAN      PLACE BLANK TO INSURE       PS118320
                          BSI  L  P9MVE     *FULL WORD                  PS118330
                          BSI  L  TV3       GO TO PRINT ROUTINE         PS118340
                    PRNTX LD    3 CHAR      FETCH CHARACTER AND EXIT    PS118350
                          BSC  I  PRIN1     *TO CALLING PROGRAM.        PS118360
                          SPAC                                          PS118361
                    *************************************************** PS118380
                    *             SET FB AND FC TO QUOTE                PS118390
                    *************************************************** PS118400
                    *                                                   PS118410
                    PRNT2 LD    3 QUOT                                  PS118420
                          MDX     PRNT1+1                               PS118430
                    *                                                   PS118440
                    *************************************************** PS118450
                    *             GO TO PLACE INTO PRINT BUFFER.      * PS118460
                    *************************************************** PS118470
                    *                                                   PS118480
                    PRNT1 LD    3 CHAR                                  PS118490
                          BSI  L  P9MVE     BRANCH TO CONVERT           PS118500
                          MDX     PRNTX                                 PS118510
                    *                                                   PS118520
                    PSUB  EQU     *                                     PS118530
                          LD   L  PBUFF     IF PBUFF NON ZERO,GO TO     PS118540
                          BSI  L  STGIN,Z   *CHECK FOR PARAMETER STRING PS118550
                    PSUBX LD    3 ADSW      TEST IF ADD OR INSERT       PS118560
                          BSC  L  PSUBY,Z   YES, SKIP OUTPUT TEST       PS118570
                          LD    3 OPSW      TEST FOR OUTPUT             PS118580
                          BSC  L  OUT35,Z   ABORT OUTPUT IF SO          PS118590
                    PSUBY STX  L  LSWX      SET LIST ERROR SWITCH       PS118600
                          LD    3 SLSH                                  PS118610
                          BSI  L  P9MVE     OUTPUT FIRST /              PS118620
                          LD    3 SLSH                                  PS118630
                          BSI  L  P9MVE     OUTPUT SECOND /             PS118640
                          LD    3 CHAR                                  PS118650
                          S     3 L10       IS NUMBER LESS THAN 10      PS118660
                          BSC  L  PSUB2,-   NO BRANCH                   PS118670
                          A     3 L10       YES, REFRESH                PS118680
                    PSUB1 OR    3 F0        MAKE EBCDIC FORM            PS118690
                          BSI  L  P9MVE     *AND OUTPUT                 PS118700
                          MDX     PRNTX     EXIT                        PS118710
                    PSUB2 STO   3 TEMP      SAVE RESIDUE                PS118720
                          LD    3 ONE       FETCH 1                     PS118730
                          STO   3 MCHA      HIGH DIGIT AT LEAST ONE     PS118740
                          LD    3 TEMP      FETCH RESIDUE               PS118750
                    PSUB3 S     3 L10       LESS 10                     PS118760
                          BSC  L  PSUB4,+Z  IF MINUS, DONE-EXIT LOOP    PS118770
                          STO   3 TEMP      SAVE RESIDUE IF + OR 0      PS118780
                          MDX  L  MCHAX,1   BUMP HIGH DIGIT             PS118790
                          MDX     PSUB3     LOOP FOR NEXT               PS118800
                    PSUB4 LD    3 MCHA      FETCH HIGH DIGIT AND        PS118810
                          OR    3 F0        *FORM EBCDIC CHARACTER      PS118820
                          BSI  L  P9MVE     OUTPUT                      PS118830
                          LD    3 TEMP      FETCH RESIDUE               PS118840
                          MDX     PSUB1     GO TO OUTPUT AND EXIT       PS118850
                    TEST  DC      *-*       ENTRY POINT             212 PS118851
                          STO     TEMPS     SAVE FOR LATER USE      212 PS118852
                          S       C1HEX     TEST FOR A-Z OR 0-9     212 PS118860
                          BSC     +Z        INSERT PERIOD IF YES    212 PS118870
                          MDX     STX02     CONTINUE                212 PS118871
                          BSC  I  TEST      RETURN                  212 PS118872
                    *************************************************** PS118879
                    *                                                 * PS118880
                    *             NAME STATEMENT.                       PS118890
                    *ROUTINE TO SUBSTITUTE CHARACTER STRING FOR PARAM-* PS118900
                    *   ETER AS SPECIFIED BY A NAME STATEMENT.        * PS118903
                    *                                                 * PS118904
                    *************************************************** PS118905
                          SPAC                                          PS118907
                    STGIN DC      *-*       ENTRY POINT                 PS118910
                          LDX  L2 PBUFF     SET POINTER                 PS118920
                          LD    3 CHAR                                  PS118930
                          STO   3 TEMP                                  PS118940
                          LD    2 -1        NO. OF PARAMETERS           PS118950
                          S     3 CHAR      IF CURRENT EXCEEDS NO.      PS118960
                          BSC  I  STGIN,+Z  *SPECIFIED BY NAME, EXIT    PS118970
                    STG01 MDX   2 1         STEP TO STRING COUNT        PS118980
                          LD    2 0         FETCH COUNT AND SAVE AS     PS118990
                          STO     STGCT     *INDEX VALUE                PS119000
                          MDX  L  TEMPX,-1  DECREMENT CURRENT, WHEN     PS119010
                          MDX     STG03     *ZERO SKIP TO PROC.,OR LOOP PS119020
                          BSC  I  STGIN,+-  IF COUNT=0 EXIT             PS119030
                          LD    3 IND       GET FIELD COUNT             PS119040
                          S     3 X0003     TEST FOR 3 OR GREATER       PS119050
                          BSC  L  STG04,+Z  NO, SKIP FURTHER TEST   212 PS119060
                          S     3 X0001     YES, IS IT 3-4 (FLAG-TAG)   PS119070
                          BP      STG04     NO, SKIP FURTHER TEST   212 PS119080
                          LD    2 0         FLAG/TAG, TEST STRING COUNT PS119090
                          S     3 X0001     *                           PS119100
                          BSC  L  PSUBX,Z   GREATER THAN 1, DONT USE    PS119110
                    STG04 STX   2 STX02+1   SAVE XR2                212 PS119111
                          LDX  I2 CPPX      POINT TO OUTPUT BUFFER  212 PS119112
                          MDX  L  PTSWX,0   CHAR IN PREV WORD, SKIP 212 PS119113
                          MDX     STG05     SAVE WORD - BRANCH      212 PS119114
                          LD    2 -1        PICK UP PREVIOUS        212 PS119115
                          SLA     8         ISOLATE                 212 PS119116
                          SRA     8         *CHARACTER              212 PS119117
                          BSI     TEST      TEST FOR ALPHANUMERIC   212 PS119118
                          LD      CN4B      LOAD EBCDIC PERIOD      212 PS119119
                          SLA     8         SHIFT INTO POSITION     212 PS119120
                          STO   2 0         SAVE IN OUTPUT BUFFER   212 PS119121
                          LD      *         RESET PRINT             212 PS119122
                          STO   3 PRTSW     *SWITCH                 212 PS119123
                          MDX     STX02     RESTORE XR2             212 PS119124
                    STG05 LD    2 0         LOAD PREV CHAR          212 PS119125
                          SRA     8         ISOLATE IT              212 PS119126
                          BSI     TEST      TEST FOR ALPHANUMERIC   212 PS119127
                          LD    2 0         LOAD PREV CHAR          212 PS119128
                          SRA     8         ISOLATE INTO            212 PS119129
                          SLA     8         *LEFT 8 BITS            212 PS119130
                          OR      CN4B      OR WITH EBCDIC PERIOD   212 PS119131
                          STO   2 0         RESTORE IN OUTPUT BUFFER212 PS119132
                          MDX  L  CPPX,1    INCREMENT OUTPUT POINTER212 PS119133
                          LD    3 CPP       LOAD POINTER            212 PS119134
                          S     3 PLOC      TEST FOR END            212 PS119135
                          S     3 D40       *OF LINE                212 PS119136
                          BSC     Z-        SKIP IF NOT             212 PS119137
                          S     3 ONE       SUBTRACT ONE            212 PS119138
                          A     3 D40       RESTORE CHAR COUNG      212 PS119139
                          STO     PAREA-1   STORE IN WD COUNT       212 PS119140
                          SLA     16        RESET HI/LO             212 PS119141
                          STO   3 PRTSW     SWITCH                  212 PS119142
                    STX02 LDX  L2 *-*       RESTORE XR2             212 PS119143
                    STG02 LD    2 1         FETCH CHAR              212 PS119145
                          BSI  L  P9MVE     *AND PLACE              212 PS119146
                          MDX   2 1         MODIFY POINTER          212 PS119147
                          MDX  L  STGCT,-1  *AND COUNT                  PS119150
                          MDX     STG02     LOOP TILL DONE              PS119160
                          BSC  L  PRNTX     EXIT ROUTINE                PS119170
                    STG03 MDX  L2 *-*       BUMP POINTER PAST THIS      PS119180
                    STGCT EQU     *-1       *PARAMETER AND LOOP         PS119190
                          MDX     STG01     *TO PROCESS NEXT            PS119200
                    *************************************************** PS119210
                    *             PRINT END MESSAGE FOR FE              PS119220
                    *************************************************** PS119230
                    PRNT3 EQU     *                                     PS119240
                          LD    3 PRNT                                  PS119250
                          STO     P3SV      SAVE PRINT EXIT             PS119260
                          LD   L  PAREA+12  TEST FOR LIB END. IF SO     PS119270
                    *                       PRINT POS 22 IS BLANK. IF   PS119280
                    *                       NOT, ITS NUMERIC.           PS119290
                          EOR   3 X4000     TEST FOR BLANK              PS119300
                          SRA     8         IGNORE RIGHT 8 BITS         PS119310
                          BSC  L  PRNT4,Z   BRANCH IF NOT               PS119320
                    PMES2 LD    3 ADSW      TEST FOR ADD                PS119330
                          BSC  L  PRNT6,Z   IF SO, SKIP LIB END PRINT   PS119340
                          LD    3 JSW       TEST FOR JOIN               PS119350
                          BSC  L  PRNT6,+-  IF SO, SKIP LIB END PRINT   PS119360
                          SLA     16                                    PS119370
                          STO     PAREA+9   CLEAR INSERT X IF THERE     PS119380
                          STX  L  P21X      PRINT IN POSITION 21        PS119390
                          BSI   3 EPRT      PRINT LIBRARY END MESSAGE   PS119400
                          DC      MESS2                                 PS119410
                          MDX     PRNT5     SKIP MACRO END              PS119420
                    PRNT4 STX  L  P21X      PRINT IN POSITION 21        PS119430
                          LDX  L1 PAREA+13  RESET PRINT POSITION TO     PS119440
                          STX  L1 CPPX      *POSITION 27                PS119450
                          STO   3 PRTSW     SET PRINT SWITCH NON-ZERO   PS119460
                          BSI   3 EPRT      PRINT MACRO END MESSAGE     PS119470
                          DC      MESS                                  PS119480
                    PRNT5 LD    3 X00FE                                 PS119490
                          STO   3 CHAR      RESTORE FE                  PS119500
                          BSC  L  *-*       EXIT PRINT ROUTINE          PS119510
                    P3SV  EQU     *-1       PRINT EXIT SAVE             PS119520
                    PRNT6 BSI     PTINT     REINITIALIZE PRINT          PS119530
                          MDX     PRNT5     RETURN                      PS119540
                    C1HEX DC      /C1       EBCDIC 'A'              212 PS119544
                    TEMPS DC      *-*       TEMPORARY SAVE          212 PS119545
                    CN4B  DC      /4B       PERIOD CONSTANT         212 PS119548
                          HDNG    PTINT                                 PS119550
                    *************************************************** PS119560
                    *             SUBROUTINE TO RE-INITIALIZE PRINT     PS119570
                    *             ROUTINE. RESETS COUNT AND POINTER,    PS119580
                    *************************************************** PS119590
                    PTINT DC      *-*       ENTRY POINT                 PS119600
                          SLA     16        CLEAR                       PS119610
                          STO   3 PRTSW     *POSITION SWITCH AND        PS119620
                          STO   3 IND       *CLEAR POSIT. INDICATOR     PS119630
                          LD    3 H4040     LOAD EBCDIC BLANKS          PS119640
                          LDX   3 42        CLEAR PRINT                FPS119650
                    PTCL  STO  L3 PAREA-2   *BUFFER                     PS119660
                          MDX   3 -1        *                           PS119670
                          MDX     PTCL      *                           PS119680
                          LDX  L3 D         RESTORE XR3                 PS119690
                          LD    3 P9RT      SET POINTER TO POINT        PS119700
                          STO   3 CPP       *TO PAREA                   PS119710
                          STO   3 ASSW      RESET * SWITCH              PS119720
                          LD    3 TV4P      SET ADDRESS IN PRINT        PS119730
                          STO     TV4       *CALLING SEQUENCE           PS119740
                          BSC  I  PTINT     EXIT ROUTINE                PS119750
                          DC      *-*                                   PS119760
                    PAREA BSS     41                                    PS119770
                    *                                                   PS119780
                    *************************************************** PS119790
                    *             MACRO FND MESSAGE, PRINTED WHEN AN    PS119800
                    *                  FE IS ENCOUNTERED                PS119810
                    *************************************************** PS119820
                    *                                                   PS119830
                    MESS  EBC     .** MACRO END *.                      PS119840
                          DC      /5CFD     * AND /FD (PRINT TERMINATOR PS119850
                    *************************************************** PS119860
                    *             LIBRARY END MESSAGE. PRINTED WHEN   * PS119870
                    *             FE IS ENCOUNTERED AND PRINT POS 22  * PS119880
                    *             IS BLANK.                           * PS119890
                    *************************************************** PS119900
                    MESS2 EBC     .** LIBRARY END *.                    PS119910
                          DC      /5CFD     * AND /FD (PRINT TERMINATOR PS119920
                    *                                                   PS119930
                    P9MVE DC      *-*                                   PS119940
                          STX   2 XR2                                   PS119950
                          LDX  I2 CPPX      PTR TO CURRENT PRINT POS    PS119960
                          MDX  L  PTSWX,0                               PS119970
                          MDX     PMVE1     LO ORDER CHARACTER          PS119980
                          SLA     8         POSITION TO HI ORDER        PS119990
                          STO   2 0         PLACE                       PS120000
                          LD    3 BLAN      NON-ZERO FOR PTSW           PS120010
                          MDX     PMVEX                                 PS120020
                    PMVE1 OR    2 0         BRING IN HI ORDER           PS120030
                          STO   2 0         PLACE HI AND LO             PS120040
                          LD    3 CPP                                   PS120050
                          A     3 ONE                                   PS120060
                          STO   3 CPP       UPDATE PRINT POSITION       PS120070
                          S     3 PLOC                                  PS120080
                          S     3 D40                                   PS120090
                          BSC     -Z        SKIP IF NOT END OF LINE     PS120100
                          S     3 ONE       BACK UP                     PS120110
                          A     3 D40                                   PS120120
                          STO     PAREA-1   UPDATE PRINT CHAR COUNT     PS120130
                          LD      PAREA+9   LOAD COLUMN 9 OF PRBUF 2-11 PS120131
                          EOR   3 HE740     EOR WITH 'X'           2-11 PS120132
                          SRA     8         SHIFT RIGHT 8 BITS     2-11 PS120133
                          BSC  L  PMVE2,Z   NOT ZERO, SKIP         2-11 PS120134
                          LD    3 X0029     LOAD CONSTANT OF 41    2-12 PS120135
                          STO     PAREA-1   STORE LENGTH OF BUFFER 2-12 PS120136
                    PMVE2 SLA     16        ZERO FOR PTSW               PS120140
                    PMVEX STO   3 PRTSW     SET HI/LO SWITCH            PS120150
                          LDX  L2 *-*       RESTORE INDEX REG 2         PS120160
                    XR2   EQU     *-1                                   PS120170
                          BSC  I  P9MVE     EXIT                        PS120180
                          HDNG    TV3   LINK TO PRINT ROUTINE           PS120190
                    *************************************************** PS120200
                    *             LINK TO SYSTEM PRINT INTERFACE.     * PS120210
                    *************************************************** PS120220
                    *                                                   PS120230
                    TV3   DC      *-*                                   PS120240
                          LD   L  OPSWX     OUTPUT SWITCH               PS120250
                          BSC  L  TV35,+-   PRINT IF NOT DOING OUTPUT   PS120260
                          LD   L  LF50X     IF OUTPUT, TEST TEMPORARY   PS120270
                          BSC  I  TV3,+-    *PRINT SW - EXIT IF OFF     PS120280
                    TV35  EQU     *                                     PS120290
                          BSI  I  PRINT     PRINT FROM PAREA            PS120300
                    TV4   EQU     *                                     PS120310
                          DC      PAREA-1                               PS120320
                          LDX  L3 D         RESTORE INDEX 3             PS120330
                          LD    3 OPSW      TEST IF OUTPUT              PS120340
                          BSC  I  TV3,Z     SKIP INITIALIZATION IF SO   PS120350
                          BSI  L  PTINT     RE-INITIALIZE PRINT ROUT    PS120360
                          BSC  I  TV3                                   PS120370
                    *                                                   PS120380
                    *                                                   PS120390
                    *                                                   PS120400
                    SPACE DC      *-*       SPACE 1 LINE                PS120410
                          BSI  I  LINE      TO LINE SPACE ROUTINE       PS120420
                          LDX  L3 D         RESTORE INDEX 3             PS120430
                          BSC  I  SPACE                                 PS120440
                    *                                                   PS120450
                    RPAGE DC      *-*                                   PS120460
                          BSI  I  PAGE      TO PAGE RESTORE ROUTINE     PS120470
                          LDX  L3 D         RESTORE INDEX 3             PS120480
                          BSC  I  RPAGE                                 PS120490
                          HDNG    CRPRT                                 PS120500
                    *************************************************** PS120510
                    *             THIS ROUTINE PRINTS THE CONTROL     * PS120520
                    *             RECORD IN SAREA                     * PS120530
                    *************************************************** PS120540
                    *                                                   PS120550
                    CRPRT DC      *-*                                   PS120560
                          LD    3 PLOC      RESET PRINT POSITION TO     PS120570
                          STO   3 CPP       *POSITION 1                 PS120580
                          BSI   3 EPRT      LINK TO PRINT ROUTINE       PS120590
                          DC      SAREA     *                           PS120600
                          BSC  I  CRPRT     RETURN                      PS120610
                          HDNG    PRINCIPAL INPUT READ ROUTINE          PS120620
                    *************************************************** PS120630
                    *             RDCRD READS A RECORD FROM THE       * PS120640
                    *             PRINCIPAL INPUT DEVICE. CHECKS FOR  * PS120650
                    *             MONITOR OR DUP CONTROL RECORD. IF   * PS120660
                    *             SO, THE MUP RUN IS TERMINATED UNLESS* PS120670
                    *             ADD OR INSERT IS BEING DONE (THESE  * PS120680
                    *             REQUIRE HOUSEKEEPING BEFORE EXIT).  * PS120690
                    *             IF NOT // OR *, RECORD IS MOVED INTO* PS120700
                    *             SAREA BUFFER.                       * PS120710
                    *************************************************** PS120720
                    RDCRD DC      *-*       CARD READ ENTRY POINT       PS120730
                          BSI  I  GETHO     USE DUPCO READ ROUTINE      PS120740
                          MDX  L  $CTSW,0   TEST FOR MON CTL REC RD     PS120750
                          MDX     RD020                                 PS120760
                    *                                                   PS120770
                          LDX  L1 C         RESTORE CATCO POINTER       PS120780
                          LD    1 CRBUF     GET INPUT BUFFER ADDRESS    PS120790
                          STO  L  TEMP4     SAVE IT                     PS120800
                          LDX  I1 TEMP4     PUT INTO INDEX REGISTER     PS120810
                          LD    1 1         GET COLUMN 1                PS120820
                          EOR   3 ASTK      TEST FOR *                  PS120830
                          BSC     +-        SKIP IF NOT *               PS120840
                          MDX     RD030     FOUND *, SET SWITCH         PS120850
                    *                                                   PS120860
                          LDX   2 80        LOAD AMOUNT OF DATA MOVED   PS120870
                          MDX   1 80        LOCATE LAST CARD COLUMN     PS120880
                    CNTIN LD    1 0         MOVE A WORD TO THE MUP      PS120890
                          STO  L2 SAREA-1   *INPUT BUFFER               PS120900
                          MDX   1 -1        DECREMENT ADDRESSES         PS120910
                          MDX   2 -1        *AND SKIP WHEN MOVE DONE    PS120920
                          MDX     CNTIN     *                           PS120930
                    *                                                   PS120940
                          LDX  I1 CRBUF+C   GET BUFFER ADDRESS          PS120950
                          LD    1 1         GET COLUMN 1                PS120960
                          EOR   3 DOT       TEST FOR . (COMMENT)        PS120970
                          BSC  L  RD010,Z   BRANCH IF NO                PS120980
                          LD    3 FLSW      TEST FLUSH SWITCH           PS120990
                          BSC     Z         NOT SET, SKIP TO PRINT      PS121000
                          MDX     RD010     SET, RETURN                 PS121010
                          BSI     CRPRT     PRINT COMMENT               PS121020
                          MDX     RDCRD+1   READ NEXT CONTROL RECORD    PS121030
                    RD010 BSC  I  RDCRD     RETURN                      PS121040
                    *************************************************** PS121050
                    *             MONITOR CONTROL RECORD READ           PS121060
                    *************************************************** PS121070
                    RD020 LD    3 INDL      TEST IF DOING INSERT        PS121080
                          BSC  I  RDCRD,Z   EXIT IF SO                  PS121090
                          LD    3 ADSW      TEST IF DOING ADD           PS121100
                          BSC  I  RDCRD,Z   EXIT IF SO                  PS121110
                          BSC  L  ENDUP     OTHERWISE, END MUP RUN NOW  PS121120
                    *************************************************** PS121130
                    *             DUP CONTROL RECORD READ               PS121140
                    *************************************************** PS121150
                    RD030 STX  L  DUPCR+C   INDICATE DUP CONTROL RECORD PS121160
                    *                       *READ                       PS121170
                          MDX     RD020     TEST CONDITIONS             PS121180
                          HDNG    GETCH                                 PS121190
                    *************************************************** PS121200
                    *           GETCH PICKS UP THE NEXT INPUT CHARACTER PS121210
                    *             VIA IPT AND GETS THE NEXT BUFFER IF   PS121220
                    *             NECESSARY. ON EXIT, IPT POINTS TO THE PS121230
                    *             NEXT INPUT CHARACTER AND CHAR HOLDS   PS121240
                    *             THE CHARACTER GOTTEN.                 PS121250
                    *************************************************** PS121260
                    GETCH DC      *-*                                   PS121270
                          LD    3 IPT                                   PS121280
                          S     3 CBUF                                  PS121290
                          S     3 C322      TEST IF BUFFER EMPTY        PS121300
                          BSI  L  NXTBF,+-  GET NEXT BUFFER IF SO       PS121310
                          LD   I  IPTX      PICK UP NEXT CHAR           PS121320
                          MDX  L  ICSWX,0   TEST FOR HI ORDER           PS121330
                          SLA     8         NO, SHIFT IT THERE          PS121340
                          SRA     8         SHIFT TO LO ORDER           PS121350
                          STO   3 CHAR      SAVE IT                     PS121360
                          S       GET4      ALPHAMERIC OR GREATER?  212 PS121361
                          BN      GTCH1     NO                      212 PS121362
                          LD    3 CHAR      RELOAD CHARACTER        212 PS121363
                          S       GET5      ALPHAMERIC?             212 PS121364
                          BNN     GTCH1     NO                      212 PS121365
                          LD      GET1      PARAM LAST FOUND        212 PS121366
                          BNZ     GTCH1     NO, CONTINUE            212 PS121367
                          LD      *-1       YES                     212 PS121368
                          STO     GET1      *RESET SWITCH           212 PS121369
                          LD      GET3      LOAD PERIOD             212 PS121370
                          BSI  L  P9MVE                             212 PS121371
                    GTCH1 LD    3 CHAR      RELOAD CHARACTER        212 PS121372
                          AND     GET2      CHECK FOR PARAMETER     212 PS121373
                          STO     GET1      SAVE RESULT IN INDICATOR212 PS121374
                          LD    3 IPT                                   PS121375
                          A     3 ICSW                                  PS121380
                          STO   3 IPT       UPDATE IPT, IF NECESSARY    PS121390
                          LD    3 ICSW                                  PS121400
                          EOR   3 X0001                                 PS121410
                          STO   3 ICSW      FLIP ALIGNMENT SWITCH       PS121420
                    GTCH2 BSC  I  GETCH     EXIT                        PS121430
                    GET1  DC      /00F0                             212 PS121432
                    GET2  DC      /00F0                             212 PS121434
                    GET3  DC      /004B     PERIOD-                 212 PS121436
                    GET4  DC      /00C1                             212 PS121437
                    GET5  DC      /00FA                             212 PS121438
                          SPAC                                          PS121440
                          HDNG    PUTCH                                 PS121450
                    *************************************************** PS121460
                    *             PUTCH STORES THE DESIGNATED CHARACTER PS121470
                    *             IN THE OUTPUT BUFFER, UPDATES THE     PS121480
                    *             OUTPUT POINTER, AND WRITES THE BUFFER PS121490
                    *             IF NECESSARY. INPUT IS IN CHAR.       PS121500
                    *************************************************** PS121510
                    PUTCH DC      *-*                                   PS121520
                          MDX  L  SKSWX,0                               PS121530
                          MDX     PUT5      EXIT IF SKIP MODE           PS121540
                          LD    3 OPT                                   PS121550
                          S     3 OUT                                   PS121560
                          S     3 C322                                  PS121570
                          BSI  L  BFOUT,+-  FLUSH BUFFER IF FULL        PS121580
                          LD   I  OPTX                                  PS121590
                          SRT     24        POSITION POSSIBLE HI CHAR   PS121600
                          LD    3 CHAR      NEW CHAR                    PS121610
                          SLA     8         OK IF HI                    PS121620
                          MDX  L  OCSWX,0   TEST, SKIP IF HI            PS121630
                          RTE     8         SHIFT IN HI, NEW IS LO      PS121640
                          STO  I  OPTX      STORE RESULT                PS121650
                          LD    3 OPT                                   PS121660
                          A     3 OCSW                                  PS121670
                          STO   3 OPT       UPDATE OPT, IF NECESSARY    PS121680
                          LD    3 OCSW                                  PS121690
                          EOR   3 ONE                                   PS121700
                          STO   3 OCSW      FLIP HI/LO SWITCH           PS121710
                    PUT5  BSC  I  PUTCH     RETURN                      PS121720
                          SPAC                                          PS121730
                          HDNG    MOVE                                  PS121740
                    *************************************************** PS121750
                    *             MOVE TRANSFERS CHARACTERS FROM INPUT  PS121760
                    *             TO OUTPUT AS DESIGNATED BY IPT AND    PS121770
                    *             OPT. IF THE SKIP SWITCH, SKSW, IS SET PS121780
                    *             TRANSFER IS SUPPRESSED. CARDS ARE   * PS121790
                    *             PRINTED IF REQUESTED. TRANSFER IS   * PS121800
                    *             TERMINATED WHEN THE SUPPLIED OR A   * PS121810
                    *             HIGER TERMINATOR IS REACHED. THE    * PS121820
                    *             OUTPUT CARD NUMBER IS UPDATED.      * PS121830
                    *             *INPUT PARAMETERS                   * PS121840
                    *             /00FE IN ACC. CAUSES MACRO          * PS121850
                    *                  PROTOTYPE TO BE MOVED.         * PS121860
                    *             /00FD IN ACC. CAUSES 1 MACRO        * PS121870
                    *                  STATEMENT TO BE MOVED.         * PS121880
                    *************************************************** PS121890
                    MOVE  DC      *-*                                   PS121900
                          STO   3 TERM      SAVE TERMINATOR             PS121910
                          LD    3 MHSW                                  PS121920
                          BSC  I  MOVE,Z    EXIT IF HDR MOVE NEEDED     PS121930
                    *                                                   PS121940
                          LD    3 X00FE                                 PS121950
                          STO   3 CHAR      SET /FE AS NEXT CHAR        PS121960
                    MV2   MDX  L  SSWX,0                                PS121970
                          MDX     MV1       BRANCH IF NO SEQ NUMBERS    PS121980
                          MDX  L  CRDNX,1   UPDATE INPUT CARD NUMBER    PS121990
                    MV1   MDX  L  OPSWX,0   SKIP IF NOT DOING OUTPUT    PS122000
                          MDX     MV10      BRANCH IF DOING OUTPUT      PS122010
                          MDX  L  SKSWX,0                               PS122020
                          MDX     MV3       BRANCH IF NOT PUTTING       PS122030
                    MV10  MDX  L  CDNOX,1   UPDATE OUTPUT CARD NUMBER   PS122040
                          BSI     PTST      CHECK IF PRINT REQUIRED     PS122050
                          BSI  L  PRNTN,Z   PRINT SEQ NO. IF REQUIRED   PS122060
                    MV3   EQU     *                                     PS122070
                          MDX  L  FESWX,0   TEST IF FE NEEDED           PS122080
                          MDX     MV7       BRANCH IF SO                PS122090
                    MV5   BSI  L  GETCH     GET NEXT CHARACTER          PS122100
                          LD    3 X0001     SET TO BUMP BALANCE         PS122110
                          MDX  L  SKSWX,0   *COUNT IF NOT PUTTING       PS122120
                          BSI     INSBL                                 PS122130
                          LD    3 CHAR                                  PS122140
                          EOR   3 X00FF                                 PS122150
                          BSC  L  MV8,Z     IF NOT END OF INPUT BUFFER  PS122160
                          BSI  L  NXTBF     GET NEXT BUFFER             PS122170
                          MDX     MV5       TRY AGAIN                   PS122180
                    *                                                   PS122190
                    MV7   SLA     16                                    PS122200
                          STO   3 FESW      CLEAR FE NEEDED SWITCH      PS122210
                    *                                                   PS122220
                    MV8   LD    3 CHAR                                  PS122230
                          BSI  L  PUTCH,Z   PUT CHARACTER IF NONZERO    PS122240
                          BSI     PTST      CHECK IF PRINT REQUIRED     PS122250
                          BSC  L  MV9,+-                                PS122260
                          LD    3 CHAR                                  PS122270
                          BSI  L  PRNTC     PRINT, PROTOTYPE MODE       PS122280
                    *                                                   PS122290
                    MV9   LD    3 CHAR                                  PS122300
                          EOR   3 X00FE                                 PS122310
                          BSC  L  MV18,Z    BRANCH IF NOT END OF MACRO  PS122320
                          MDX  L  SKSWX,0   TEST IF SKIP SW SET         PS122330
                          MDX     MV14      BRANCH IF SO (/FE PURGED)   PS122340
                          STO   3 CHAR                                  PS122350
                          BSI  L  PUTCH     PUT 00                      PS122360
                          SLA     16                                    PS122370
                          STO   3 OCSW      SET TO WORD BOUNDARY        PS122380
                          STO   3 CDNO      RESET CARD NUMBER           PS122390
                    *                                                   PS122400
                          LD    3 OUT                                   PS122410
                          A     3 C317      SEE IF ROOM                 PS122420
                          S     3 OPT       *FOR MACRO HEADER           PS122430
                          BSC  L  MV14,-    BRANCH IF OK                PS122440
                          LD    3 X00FF                                 PS122450
                          STO   3 CHAR                                  PS122460
                          BSI  L  PUTCH     PUT BUFFER TRUNCATOR        PS122470
                          BSI  L  BFOUT     FORCE OUT BUFFER            PS122480
                    MV14  LD    3 X00FE                                 PS122490
                          STO   3 MHSW      SET HDR MOVE NEEDED         PS122500
                    MV15  S     3 TERM                                  PS122510
                          BSC  I  MOVE,+-   EXIT IF TERMINATOR OK       PS122520
                    MV16  LD    3 X00FE                                 PS122530
                          STO   3 TERM      SET TERM TO /FE             PS122540
                          MDX     MV15                                  PS122550
                    *                                                   PS122560
                    MV17  LD    3 CHAR      GET CHARACTER               PS122570
                          EOR   3 TERM                                  PS122580
                          BSC  I  MOVE,+-   EXIT IF TERMINATOR REACHED  PS122590
                          MDX     MV2       OTHERWISE, CONTINUE MOVE    PS122600
                    *                                                   PS122610
                    MV18  LD    3 CHAR      GET CHARACTER               PS122620
                          EOR   3 X00FD                                 PS122630
                          BSC  L  MV5,Z     BRANCH IF NOT END OF CARD   PS122640
                          LD    3 LSW       TEST IF LIST ERROR          PS122650
                          BSC  L  MV17,+-   NO, SKIP ERROR MESSAGE      PS122660
                          BSI   3 EPRT      YES, PRINT INVALID          PS122670
                          DC      EM17      *PARAMETER MESSAGE          PS122680
                          SLA     16        CLEAR LIST ERROR SWITCH     PS122690
                          STO   3 LSW       *                           PS122700
                          MDX     MV17      END OF RECORD               PS122710
                          EJCT                                          PS122720
                    *************************************************** PS122730
                    *             CHECK IF PRINT REQUIRED. IF PSW IS  * PS122740
                    *             SET, PRINTING WILL ALWAYS BE DONE.  * PS122750
                    *             IF ISW IS SET, PRINTING WILL BE DONE* PS122760
                    *             IF AN INSERT, DELETE OR ADD IS      * PS122770
                    *             BEING PROCESSED.                    * PS122780
                    *************************************************** PS122790
                    PTST  DC      *-*       ENTRY POINT                 PS122800
                          LD    3 PSW       SELECT P?                   PS122810
                          BSC  I  PTST,Z    PRINT IF YES                PS122820
                          LD    3 ISW       NOT P, SELECT I?            PS122830
                          BSC  I  PTST,+-   NOT P OR I, SUPPRESS PRINT  PS122840
                          LD    3 INDL      SEL I, INSERT OR DELETE?    PS122850
                          BSC  I  PTST,Z    YES, PRINT                  PS122860
                          LD    3 SSW       NO, ARE WE DOING ADD        PS122870
                          BSC  I  PTST      YES, PRINT -- NO, SUPPRESS  PS122880
                    *************************************************** PS122890
                    *             INSBL ROUTINE.  ENTER WITH COUNT    * PS122900
                    *                           IN ACC.  INCREMENTS   * PS122910
                    *                           SECTOR BALANCE BY     * PS122920
                    *                           THAT MANY BYTES       * PS122930
                    *************************************************** PS122940
                    INSBL DC      *-*       ENTRY                       PS122950
                          A     3 SBAL      ADD PREVIOUS SECTOR         PS122960
                    INSB1 STO   3 SBAL      *BALANCE AND STORE          PS122970
                          S     3 D640      SUB 2*320 FOR BYTES/SECT    PS122980
                          BSC  I  INSBL,Z+  IF - EXIT                   PS122990
                          MDX  L  LBALX,+1  ELSE BUMP LIB BALENCE BY    PS123000
                          MDX     INSB1     *ONE AND LOOP               PS123010
                          HDNG    NXTBF                                 PS123020
                    *************************************************** PS123030
                    *             NXTBF GETS THE NEXT INPUT BUFFER FROM PS123040
                    *             THE LIBRARY, OR FROM THE SPILL AREA * PS123050
                    *             IF SPILL HAS OCCURRED. IT EXITS WITH* PS123060
                    *             IPT POINTING TO THE NEXT BUFFER PAST* PS123070
                    *             THE CHAIN WORD, AND NMAC CONTAINING * PS123080
                    *             THE CHAIN WORD POINTER              * PS123090
                    *************************************************** PS123100
                    NXTBF DC      *-*                                   PS123110
                          LDX  I1 CBUFX     POINT TO CURRENT BUFFER     PS123120
                          STX  L1 RADDR     SET BUFF AD. FOR READ  2-11 PS123125
                          LD    3 CBUF                                  PS123130
                          A     3 C322                                  PS123140
                    NB1   STO   3 CBUF      SET BUFFER POINTER          PS123150
                          EOR   3 BEND      TEST FOR END OF BUFFER LIST PS123160
                          BSC  L  NB2,Z     BRANCH IF NOT               PS123170
                          STO   3 INSW      SET CYCLE SWITCH            PS123180
                          LD    3 INLC      POINT TO FIRST BUFFER       PS123190
                          MDX     NB1                                   PS123200
                    NB2   LD    3 SPSW                                  PS123210
                          BSC  L  NB12,+-   BRANCH IF NO SPILL          PS123220
                    *************************************************** PS123230
                    *             READ FROM SPILL AREA                * PS123240
                    *************************************************** PS123250
                          LD    3 SPL1                                  PS123260
                          A     3 WORKS     CALCULATE ACTUAL DISK ADDR  PS123270
                          STO   1 1         SET BUFFER SA TO READ SPIL  PS123280
                          S     3 WORKS     RESET ADDRESS               PS123290
                          A     3 C1                                    PS123300
                          STO   3 SPL1      UPDATE SPILL POINTER        PS123310
                          S     3 ESPL                                  PS123320
                          BSC     +-        SKIP IF MORE SPILL AREA     PS123330
                          STO   3 SPL1      RESET TO 1ST SECTOR         PS123340
                          LD    3 SPL1                                  PS123350
                          S     3 SPLN                                  PS123360
                          BSC  L  NB5,Z     BRANCH IF NOT LAST SPILL    PS123370
                          STO   3 SPL1                                  PS123380
                          STO   3 SPLN                                  PS123390
                          STO   3 SPSW      RESET SPILL POINTERS        PS123400
                    NB5   EQU     *                                     PS123410
                    NB10  EQU     *                                     PS123420
                          BSI  I  ENTER     SAVE ALL STATUS             PS123440
                          LDX  I3 RADDR                                 PS123450
                          BSI  I  GET       READ A DISK SECTOR          PS123460
                          BSI  I  RTURN     RESTORE STATUS              PS123470
                          LDX  L3 D         RESTORE INDEX 3             PS123480
                    NB9   EQU     *                                     PS123490
                    NB7   LD    3 CBUF                                  PS123500
                          A     3 C3                                    PS123510
                          STO   3 IPT       POINT IPT PAST CHAIN WORD   PS123520
                          SLA     16                                    PS123530
                          STO   3 ICSW      SET TO WORD BOUNDARY        PS123540
                          LDX  I1 IPTX                                  PS123550
                          LD    1 -1                                    PS123560
                          AND   3 X01FF                                 PS123570
                          STO   3 NMAC      POINT NMAC TO NEXT MACRO    PS123580
                          BSC  I  NXTBF     EXIT                        PS123590
                    *************************************************** PS123600
                    *             READ FROM LIBRARY AREA              * PS123610
                    *************************************************** PS123620
                    NB12  STO   1 2         CLEAR CHAIN WORD, LAST BUF  PS123630
                          MDX  L  ENSWX,0                               PS123640
                          MDX     NB9                                   PS123650
                          LD    3 NIN                                   PS123660
                          STO   1 1                                     PS123670
                          A     3 C1                                    PS123680
                          STO   3 NIN       UPDATE NEXT IN POINTER      PS123690
                          S     3 ELIB                                  PS123700
                          BSC  L  NB10,Z    TO READ IF NOT LAST         PS123710
                          STX  L  ENSWX     SET END SWITCH              PS123720
                          MDX     NB10      TO READ                     PS123730
                          SPAC                                          PS123740
                          HDNG    BFOUT                                 PS123750
                    *************************************************** PS123760
                    *             BFOUT EMPTIES THE CURRENT OUTPUT    * PS123770
                    *             BUFFER TO THE LIB BEING PROCESSED,  * PS123780
                    *             SPILLING AN INPUT SECTOR TO WORKING * PS123790
                    *             STORAGE IF NECESSARY. IT RETURNS    * PS123800
                    *             POINTING TO THE NEXT OUTPUT BUFFER  * PS123810
                    *             VIA OPT, PAST THE CHAIN WORD POINTED* PS123820
                    *             TO VIA LMAC.                        * PS123830
                    *************************************************** PS123840
                    BFOUT DC      *-*                                   PS123850
                          LD    3 OUT                                   PS123860
                          A     3 X0003                                 PS123870
                          S     3 OPT                                   PS123880
                          BSC  L  BO9,+-    EXIT IF BUFFER EMPTY        PS123890
                          LDX  I2 OUTX      CURRENT OUTPUT BUFFER PTR   PS123900
                          LD    3 OLIB                                  PS123910
                          S     2 1                                     PS123920
                          BSC  L  BO2,Z     BRANCH IF NOT LIB END       PS123930
                    *************************************************** PS123940
                    *             LIBRARY OVERFLOW ROUTINE            * PS123950
                    *************************************************** PS123960
                          LD    3 ESEC      GET SECTOR WITH OLD END     PS123970
                          LDX  I2 OUTX      *OF LIBRARY                 PS123980
                          STO   2 1         PLACE IT IN DISK BUFFER     PS123990
                          BSI  I  ENTER     SAVE ALL STATUS             PS124000
                          LDX  I3 OUTX      GET BUFFER ADDRESS          PS124010
                          BSI  I  GET       READ LAST LIBRARY SECTOR    PS124020
                          BSI  I  RTURN     RESTORE STATUS              PS124030
                    *                                                   PS124040
                          LD    3 OUT       GET BUFFER POINTER          PS124050
                          A     3 EPTR      ADD DISPLACEMENT            PS124060
                    *                                                   PS124070
                          STO     *+1       PLACE IN INDEX REGISTER     PS124080
                          LDX  L2 *-*       *                           PS124090
                    *                                                   PS124100
                    *                                                   PS124110
                          LD    3 XFE00     STORE END OF LIBRARY        PS124120
                          STO   2 -4        *INDICATOR                  PS124130
                          LD    3 CCSA      GET CONCATENATE SCTR ADDR   PS124140
                    *                                                   PS124150
                          STO   2 -3                                    PS124160
                          LDD   3 CLIB      PLACE CONCATENATED          PS124170
                          STO   2 -2        *LIBRARY'S NAME IN          PS124180
                          RTE     16        *END OF LIBRARY HEADER      PS124190
                          STO   2 -1        *                           PS124200
                    *                                                   PS124210
                    BO5   LD    3 OUT       SET UP BUFFER ADDRESS       PS124220
                          STO  L  WADDR     *FOR REWRITE                PS124230
                          A     3 X0003                                 PS124240
                          STO   3 OPT       RESET OPT TO 1ST OUTPUT WD  PS124250
                          S     3 X0001                                 PS124260
                          STO   3 LMAC      POINT LMAC TO CHAIN WORD    PS124270
                          BSI     BO8       REWRITE SECTOR              PS124280
                    BO7   EQU     *                                     PS124290
                          BSI   3 EPRT                                  PS124300
                          DC      EM2       LIBRARY OVERFLOW            PS124310
                          LD    3 ADSW      TEST IF ADD OPERATION       PS124320
                          BSC  L  BO75,Z    BRANCH IF SET               PS124330
                          LD    3 INDL      TEST INSERT/DELETE SWITCH   PS124340
                          BSC  L  BO75,Z    BRANCH IF SET               PS124350
                    B071  SLA     16        TURN OFF ADD SWITCH         PS124360
                          STO   3 ADSW      *                           PS124370
                          STO   3 LNAM      CLEAR LIBRARY NAME          PS124380
                          STO   3 INDL      RESET INSERT/DELET SW       PS124390
                          STX  L  JSWX      RESET JOIN SWITCH           PS124400
                          STX  L  J1SWX     RESET 1ST JOIN FLUSH SWITCH PS124410
                          BSI  L  FLUSH     GET NEXT LIB OR BUILD       PS124420
                    *                                                   PS124430
                    BO75  SLA     16        TURN OFF ADD SWITCH         PS124440
                          STO   3 ADSW      *                           PS124450
                          STO   3 INDL      CLEAR INSERT/DELETE SWITCH  PS124460
                          STO   3 LNAM      CLEAR LIBRARY NAME          PS124470
                          BSI  L  CTTST     TEST IF CONTROL STMT READ   PS124480
                          BSC  L  FL008     GO TO ANALYSE RCD IN BRF    PS124490
                    *************************************************** PS124500
                    *             TEST IF SPILL REQUIRED              * PS124510
                    *************************************************** PS124520
                    BO2   LD    2 1         SA                          PS124530
                          MDX  L  ADSWX,0   TEST IF ADD BEING DONE      PS124540
                          MDX     BO3       SKIP SPILL TEST IF SO       PS124550
                          S     3 NIN       COMPARE TO NEXT INPUT SA    PS124560
                          A     3 ENSW      NO SPILL IF NO MORE INPUT   PS124570
                          BSC  L  BO11,+-   TO SPILL IF EQUAL           PS124580
                    *************************************************** PS124590
                    *             WRITE TO LIBRARY AREA               * PS124600
                    *************************************************** PS124610
                    BO3   LDD   3 OUT                                   PS124620
                          STO  L  WADDR     SET BUFFER ADDR FOR WRITE   PS124630
                          RTE     16                                    PS124640
                          STD   3 OUT       FLIP NOUT, OUT              PS124650
                          A     3 X0003                                 PS124660
                          STO   3 OPT       POINT TO NEXT OUTPUT WORD   PS124670
                          S     3 X0001                                 PS124680
                          STO   3 LMAC      POINT LMAC TO CHAIN WORD    PS124690
                          LD    2 1                                     PS124700
                          BSI     BO8       WRITE BUFFER                PS124710
                          A     3 X0001                                 PS124720
                          LDX  I2 OUTX                                  PS124730
                          STO   2 1         SET SA FOR NEXT BUFFER      PS124740
                    BO9   SLA     16        CLEAR ACCUMULATOR           PS124750
                          STO  I  LMACX     CLEAR CHAIN WORD            PS124760
                          SLA     16                                    PS124770
                          STO   3 OCSW      SET FOR HI CHAR ON OUTPUT   PS124780
                          BSC  I  BFOUT     EXIT                        PS124790
                    BO8   DC      *-*                                   PS124800
                          BSI  I  ENTER     SAVE ALL STATUS             PS124810
                          LDX  I3 WADDR     WRITE LIBRARY OUTPUT        PS124820
                          BSI  I  PUT       *SECTOR                     PS124830
                          BSI  I  RTURN     RESTORE STATUS              PS124840
                          LDX  L3 D         RESTORE INDEX 3             PS124850
                          BSC  I  BO8       EXIT                        PS124860
                    *************************************************** PS124870
                    *        WRITE TO SPILL AREA IN WORKING STORAGE   * PS124880
                    *************************************************** PS124890
                    BO11  LD    3 NIN                                   PS124900
                          LDX  I1 NOUTX                                 PS124910
                          STO   1 1         SET SPILL READ ADDRESS      PS124920
                          A     3 X0001                                 PS124930
                          STO   3 NIN       UPDATE NEXT IN POINTER      PS124940
                          BSI  I  ENTER     SAVE ALL STATUS             PS124950
                          LDX  I3 NOUTX     READ A SECTOR INTO THE      PS124960
                          BSI  I  GET       *SPILL BUFFER               PS124970
                          BSI  I  RTURN     RESTORE STATUS              PS124980
                          LDX  L3 D         RESTORE INDEX 3             PS124990
                    BO13  LD    3 SPLN                                  PS125000
                          A     3 WORKS     ADD WORKING STORAGE ADDR    PS125010
                          STO   1 1                                     PS125020
                          S     3 WORKS     RESET SECTOR ADDRESS        PS125030
                          A     3 X0001                                 PS125040
                          STO   3 SPSW      SET SPILL SWITCH            PS125050
                          STO   3 SPLN      UPDATE NEXT SPILL POINTER   PS125060
                          S     3 ESPL                                  PS125070
                          BSC     +-        SKIP IF NOT SPILL AREA END  PS125080
                          STO   3 SPLN      RESET                       PS125090
                          LD    3 SPOV      TEST IF DOING OVFLO FLUSH   PS125100
                          BSC  L  BO15,Z    YES, SKIP OVERFLOW TEST     PS125110
                          LD    3 SPLN      NEXT OUTPUT SECTOR          PS125120
                          S     3 SPL1      NEXT INPUT SECTOR           PS125130
                          BSC  L  BO14,+    BRANCH IF INPUT LARGER      PS125140
                          LD    3 ESPL      OUT LARGER, GET SPILL END   PS125150
                          S     3 SPLN      LESS NEXT OUT               PS125160
                          A     3 SPL1      PLUS NEXT IN                PS125170
                          S     3 X0002     MINUS 2                     PS125180
                          BSC  L  BO16,+    2 OR LESS LEFT, SET END     PS125190
                          MDX     BO15      MORE THAN 2 LEFT, CONTINUE  PS125200
                    BO14  A     3 X0002     TEST IF MORE THAN 2 LEFT    PS125210
                          BSC  L  BO16,-    NO, SET TO END INSERT       PS125220
                    BO15  BSI  I  ENTER     SAVE ALL STATUS             PS125230
                          LDX  I3 NOUTX                                 PS125240
                          BSI  I  PUT       *SECTOR                     PS125250
                          BSI  I  RTURN     RESTORE STATUS              PS125260
                          LDX  L3 D         RESTORE INDEX 3             PS125270
                          MDX     BO3       TO WRITE OUTPUT BUFFER      PS125280
                    BO16  STX  L  SPOVX     SET SPILL OVERFLOW SWITCH   PS125290
                          LD    3 X0001     SET LIB SECTOR BAL TO 1     PS125300
                          STO   3 LBAL                                  PS125310
                          MDX     BO15      CONTINUE                    PS125320
                          SPAC                                          PS125330
                          HDNG    SELECT                                PS125340
                    *************************************************** PS125350
                    *         SELECT SETS SWITCHES AFFECTING COMMENTS,* PS125360
                    *             PRINT CONTROL, ETC. BASED ON USER     PS125370
                    *             REQUEST. PARAMETERS NOT SPECIFIED ARE PS125380
                    *             SET ZERO, EXCEPT IN OVERRIDE CASES.   PS125390
                    *************************************************** PS125400
                    SEL   DC      *-*       ENTRY POINT                 PS125410
                          SLA     16        TO CLEAR SWITCHES           PS125420
                          STO   3 CSW       COMMENTS                    PS125430
                          STO   3 PSW       FULL PRINT                  PS125440
                          STO   3 MSW       MACRO HEADER PRINT          PS125450
                          STO   3 ISW       INSERT PRINT                PS125460
                          STO   3 NSTS      NEST LEVEL                  PS125470
                          LDX  I1 RPTX      POINT TO FIRST PARAM        PS125480
                    CTL3  LDX  X2 CTL2-CTL1 PARAM LIST LENGTH           PS125490
                          BSI  L  MCCSN     SCAN FOR PARAM              PS125500
                    CTL1  DC      .,                                    PS125510
                          DC      CTL4                                  PS125520
                          DC      .                                     PS125530
                          DC      CTLX                                  PS125540
                          DC      .C                                    PS125550
                          DC      CTLC                                  PS125560
                          DC      .P                                    PS125570
                          DC      CTLP                                  PS125580
                          DC      .M                                    PS125590
                          DC      CTLM                                  PS125600
                          DC      .I                                    PS125610
                          DC      CTLI                                  PS125620
                          DC      .N                                    PS125630
                          DC      CTLN                                  PS125640
                    CTL2  BSI  L  CVDEC     CONVERT COL NO TO DEC       PS125650
                          MDX     CTL4                                  PS125660
                    CTLN  MDX  L  NSTSX,1   INCREMENT NEST LEVEL        PS125670
                          MDX     CTL4                                  PS125680
                    CTLC  STX  L  CSWX      SET COMMENTS SWITCH         PS125690
                    CTL4  MDX   1 1         POINT TO NEXT               PS125700
                          MDX     CTL3      SCAN NEXT                   PS125710
                    *                                                   PS125720
                    CTLP  STX  L  PSWX      SET FULL PRINT SWITCH       PS125730
                    CTLI  STX  L  ISWX      SET INSERT PRINT SWITCH     PS125740
                    CTLM  STX  L  MSWX      SET MACRO HDR PRINT SWITCH  PS125750
                          MDX     CTL4      TO PREPARE FOR NEXT         PS125760
                    *                                                   PS125770
                    CTLX  LD    3 FLSW      TEST IF IN FLUSH MODE       PS125780
                          BSC  L  FL005,Z   BRANCH IF SO                PS125790
                          BSC  I  SEL       OTHERWISE, NORMAL RETURN    PS125800
                          HDNG    BUILD                                 PS125810
                    *************************************************** PS125820
                    *             BUILD GENERATES A NEW LIBRARY         PS125830
                    *************************************************** PS125840
                    BUILD DC      *-*                                   PS125850
                          LD    1 1         TEST COL 2 FOR U            PS125860
                          EOR   3 CU        *                           PS125870
                          BSC  L  MUPX2,Z   ILLEGAL REQUEST IF NOT      PS125880
                          LD    1 2         TEST COL 3 FOR I            PS125890
                          EOR   3 CI        *                           PS125900
                          BSC  L  MUPX2,Z   ILLEGAL REQUEST IF NOT      PS125910
                          LD    3 ONE                                   PS125920
                          STO   3 BSW       SET BUILD SWITCH            PS125930
                          BSI  L  LIB       INITIALIZE FOR NEW LIB      PS125940
                          LD    3 XFE00                                 PS125950
                          STO   1 4         SET LIB END HEADER          PS125960
                          SLA     6                                     PS125970
                          SLA     1                                     PS125980
                          STO   1 5         AND CONCATENATE WORD        PS125990
                          STO   3 CCSW      CLEAR CONCATENATE SWITCH    PS126000
                          BSC  I  BUILD     EXIT                        PS126010
                          HDNG    JOIN                                  PS126020
                    *************************************************** PS126030
                    *             JOIN ATTACHES NAMED LIB TO CURRENT    PS126040
                    *************************************************** PS126050
                    JOIN  DC      *-*                                   PS126060
                          LD    3 LBSW      LIB OR BUILD BEFORE?        PS126070
                          BSC  L  ERR4,+-   ERROR IF NO LIB OR BUILD    PS126080
                          SLA     16                                    PS126090
                          STO   3 JSW       SET SW FOR LIB              PS126100
                          BSI     LIB       SET UP FOR NEW LIB          PS126110
                          LD    3 XFE00                                 PS126120
                          STO   3 CCSW      SET CONCATENATE SWITCH      PS126130
                          STO   3 J1SW      RESET JOIN1 SWITCH          PS126140
                          STO   3 LPSW      SET SECOND PASS FLAG        PS126150
                          BSI  L  UPDAT     COMPLETE JOIN OPERATION     PS126160
                    JOIN2 STX  L  JSWX      RESET JOIN SWITCH           PS126170
                          BSC  I  JOIN      EXIT                        PS126180
                          HDNG    CONCATENATE                           PS126190
                    *************************************************** PS126200
                    *             CONCATENATE LOGICALLY LINKS NAMED     PS126210
                    *             LIB TO CURRENT LIB                    PS126220
                    *************************************************** PS126230
                    CONC  DC      *-*                                   PS126240
                          LD    3 LNAM      TEST IF CURRENT LIBRARY     PS126250
                          BSC  L  ERR4,+-   ERROR MSG AND FLUSH IF NOT  PS126260
                          LD   I  RPTX      PICK UP FIRST CHAR          PS126270
                          EOR   3 QUOT                                  PS126280
                          BSC  L  CONC1,+-  BRANCH IF NAME              PS126290
                          MDX     CONC3     ERROR                       PS126300
                    *                                                   PS126310
                    CONC2 STO   3 CCSA      SET CONCATENATE SA          PS126320
                          STX  L  CCSWX     *AND SWITCH                 PS126330
                    CONC4 BSC  I  CONC      EXIT                        PS126340
                    *                                                   PS126350
                    CONC1 MDX  L  RPTX,1    POINT TO 1ST PAST BELIMITER PS126360
                          LD   I  RPTX      GET 1ST PAST DELIMITER      PS126370
                          EOR   3 F0        TEST FOR 0                  PS126380
                          BSC     +-        SKIP IF NOT                 PS126390
                          MDX     CONC2     RESET CONCATENATE           PS126400
                          BSI  L  LFSRH     SEARCH LET/FLET             PS126410
                          MDX     CONC3     INVALID NAME ERROR          PS126420
                          MDX     CONC9     NOT FOUND ERROR             PS126430
                          LDX  I1 NOUTX     GET UNUSED OUTPUT BFR ADDR  PS126440
                          STO   1 1         PLACE SECTOR ADDRESS        PS126450
                          BSI  I  ENTER     SAVE ALL STATUS             PS126460
                          LDX  I3 NOUTX     GET INPUT BUFFER ADDRESS    PS126470
                          BSI  I  GET       READ 1ST LIBRARY SECTOR     PS126480
                          BSI  I  RTURN     RESTORE STATUS              PS126490
                          LD    1 2         GET 1ST WORD OF SECTOR      PS126500
                          EOR   3 L5        TEST FOR /0005              PS126510
                          BSC  L  CONC8,Z   ERROR IF NOT                PS126520
                          LD    1 6         GET SECOND LIBRARY NAME WD  PS126530
                          RTE     16        PUT IN EXTENSION            PS126540
                          LD    1 5         GET FIRST LIBRARY NAME WORD PS126550
                          SD    3 LNAM      COMPARE TO SPECIFIED NAME   PS126560
                          BSC     +-        SKIP IF ERROR               PS126570
                          RTE     16        TEST REST OF NAME           PS126580
                          BSC  L  CONC8,Z   BRANCH IF ERROR             PS126590
                          LDD   3 LNAM      GET LIBRARY NAME            PS126600
                          STD   3 CLIB      SAVE CONCATENATED LIB NAME  PS126610
                          LD    1 1         LIBRARY OK, GET SCTR ADDR   PS126620
                          MDX     CONC2     STORE AND EXIT              PS126630
                    *                                                   PS126640
                    CONC3 BSI   3 EPRT                                  PS126650
                          DC      EM15      PRINT INVALID NAME MESSAGE  PS126660
                          MDX     CONC4     EXIT                        PS126670
                    *                                                   PS126680
                    CONC8 BSI   3 EPRT      PRINT LIBRARY NOT           PS126690
                          DC      EM16      *INITIALIZED                PS126700
                          MDX     CONC4     *AND EXIT                   PS126710
                    *                                                   PS126720
                    CONC9 BSI   3 EPRT      PRINT NOT FOUND             PS126730
                          DC      EM7       *                           PS126740
                          MDX     CONC4     EXIT                        PS126750
                          HDNG    LIB                                   PS126760
                    *************************************************** PS126770
                    *             LIB INITIALIZES TO OPERATE ON THE   * PS126780
                    *             NAMED LIBRARY. IT CALLS THE LET/FLET* PS126790
                    *             SEARCH ROUTINE TO FIND THE LIBRARY  * PS126800
                    *             SECTOR ADDRESS AND COUNT.USED BY JOIN PS126810
                    *             BUILD ROUTINES.                     * PS126820
                    *************************************************** PS126830
                    LIB   DC      *-*                                   PS126840
                          LD    3 JSW       TEST FOR JOIN               PS126850
                          BSC  L  LIB1,+-   YES, SKIP NAME SW RESET     PS126860
                          SLA     16        CLEAR NAME SWITCH           PS126870
                          STO   3 NMSW                                  PS126880
                          STO  L  PBUFF     SET PARAM NUMBER TO ZERO    PS126890
                          STO   3 LBSW      RESET LIB,BUILD SWITCH      PS126900
                    LIB1  LD   I  RPTX                                  PS126910
                          EOR   3 QUOT                                  PS126920
                          BSC  L  LIB5,+-   BRANCH IF NAME              PS126930
                    ERR7  BSI   3 EPRT                                  PS126940
                          DC      EM15      PRINT INVALID NAME FOUND    PS126950
                    ERR75 EQU     *                                     PS126960
                    LIB7  SLA     16                                    PS126970
                          STO   3 LNAM      CLEAR LIB NAME              PS126980
                    LIB3  STO   3 BSW       CLEAR BUILD SWITCH          PS126990
                          STX  L  JSWX      CLEAR JOIN SWITCH           PS127000
                          BSI  L  FLUSH     FLUSH INPUT RECORDS UNTIL   PS127010
                          BSC  L  MUP11     *LIB, BUILD, OR ENDUP       PS127020
                    LIB5  EQU     *                                     PS127030
                          MDX  L  RPTX,1    POINT TO 1ST PAST '         PS127040
                          BSI  L  LFSRH     SEARCH LET/FLET FOR LIB     PS127050
                          MDX     ERR7      INVALID NAME                PS127060
                          MDX     ERR8      NOT FOUND                   PS127070
                          STO   3 SLIB      SET LIB START               PS127080
                          RTE     16                                    PS127090
                          A     3 SLIB      CALCULATE LIBRARY END       PS127100
                    LIB6  STO   3 ELIB      SET LIB END                 PS127110
                          LD    3 NDDF      TEST IF NON-DDF ENTRY FOUND PS127120
                          BSC  L  LIB4,+-   BRANCH IF DDF ENTRY         PS127130
                          LD    3 BSW       TEST IF BUILD OPERATION     PS127140
                          BSC  L  ERR16,Z   BRANCH IF SO                PS127150
                          MDX     ERR8      OTHERWISE, PRINT LIB NOT FD PS127160
                    LIB4  STX  L  LBSWX     SET LIB,BUILD SWITCH        PS127170
                          LDD   3 SLIB      LIB START AND END           PS127180
                          MDX  L  JSWX,0                                PS127190
                          STD   3 SLS       SAVE IF NOT FROM JOIN       PS127200
                          LD    3 ELS                                   PS127210
                          STO   3 OLIB      SET OUTPUT LIB END          PS127220
                          BSI     INIT      SET UP TO PROCESS LIB       PS127230
                          LDX  I1 IPTX      POINT TO FIRST HEADER       PS127240
                          LD    1 -1        PICK UP CHAIN WORD          PS127250
                          MDX  L  BSWX,0    CHECK IF BUILDING A LIB     PS127260
                          LD    3 L5        GET CHAIN WORD IF SO        PS127270
                          STO   1 -1        SET CHAIN WORD              PS127280
                          STO   3 NMAC      SET NEXT MACRO PTR          PS127290
                          MDX  L  BSWX,0    TEST IF BUILD               PS127300
                          MDX     LIB8      BRANCH IF YES               PS127310
                          S     3 L5        TEST FOR LIB START          PS127320
                          BSC  L  ERR16,Z   ERROR IF NOT LIBRARY START  PS127330
                          LD    1 3         PICK UP LIB NAME FROM       PS127340
                          RTE     16        SECTOR ( LIBRARY HEADER)    PS127350
                          LD    1 2         *                           PS127360
                          SD    3 LNAM      COMPARE WITH SPECIFIED      PS127370
                          BSC     +-        *LIBRARY NAME               PS127380
                          RTE     16                                    PS127390
                          BSC  L  ERR16,Z   ERROR IF UNEQUAL COMPARERT  PS127400
                          LD    3 JSW       TEST FOR JOIN MODE          PS127410
                          BSC  L  LIB9,Z    BRANCH IF NOT JOIN          PS127420
                          MDX  L  IPTX,4    ELSE POINT PAST HEADER      PS127430
                          BSC  I  LIB       EXIT                        PS127440
                    LIB8  STO   1 1         STORE END POINTER FOR BUILD PS127450
                          LDD   3 LNAM      PICK UP PACKED NAME         PS127460
                          STO   1 2         *AND STORE AS PART OF       PS127470
                          RTE     16        *LIBRARY HEADER             PS127480
                          STO   1 3                                     PS127490
                          LD    3 SLS       STORE SA OF END OF LIB      PS127500
                          S     3 SLIB      *RELATIVE TO LIBR BEG  2-10 PS127505
                          STO   1 0         *IN LIBRARY HEADER          PS127510
                    LIB9  EQU     *                                     PS127520
                    *                                                   PS127530
                          LD    3 D320      COMPUTE SECTOR AND          PS127540
                          S     1 1         *LIBRARY BALANCE COUNT      PS127550
                          S     3 C4                                    PS127560
                          SLA     1         FOR POSSIBLE INSERTS        PS127570
                          STO   3 SBAL                                  PS127580
                          LD    3 ELS                                   PS127590
                          S     3 SLIB      SUBTRACT LIBR BEGIN    2-10 PS127595
                          S     1 0                                     PS127600
                          STO   3 LBAL                                  PS127610
                          BSI     MVDUM     GO MOVE POINTERS            PS127620
                          SLA     16                                    PS127630
                          STO   3 BSW       CLEAR BUILD SWITCH          PS127640
                          BSC  I  LIB       EXIT                        PS127650
                    ERR8  BSI   3 EPRT      PRINT LIBRARY NOT FOUND     PS127660
                          DC      EM7       *                           PS127670
                          MDX     ERR75                                 PS127680
                    ERR16 BSI   3 EPRT      PRINT LIBRARY NOT           PS127690
                          DC      EM16      *INITIALIZED MESSAGE        PS127700
                          MDX     ERR75                                 PS127710
                          HDNG    MVDUM                                 PS127720
                    MVDUM DC      *-*       ENTRY POINT                 PS127730
                          STX   2 MVDX+1    SAVE XR2                    PS127740
                          LDX  I2 OUTX      OUTPUT BUFFER POINTER       PS127750
                          LD    1 -1        MOVE CHAIN WORD             PS127760
                          STO   2 2         *TO OUTPUT BUFFER           PS127770
                          LD    1 0         MOVE SECTOR ADDRESS         PS127780
                          STO   2 3         *                           PS127790
                          LD    1 1         MOVE FE POINTER             PS127800
                          STO   2 4         *                           PS127810
                          LD    1 2         MOVE 1ST WORD OF NAME       PS127820
                          STO   2 5         *                           PS127830
                          LD    1 3         MOVE 2ND WORD OF NAME       PS127840
                          STO   2 6         *                           PS127850
                          MDX  L  OPTX,+4   BUMP OPT                    PS127860
                    MVDX  LDX  L2 *-*       RESTORE XR2                 PS127870
                          BSC  I  MVDUM     RETURN TO CALLER            PS127880
                          SPAC                                          PS127890
                          HDNG    INIT                                  PS127900
                    *************************************************** PS127910
                    *             INIT SETS UP TO START LIBRARY PROCESS PS127920
                    *************************************************** PS127930
                    INIT  DC      *-*                                   PS127940
                          LD    3 SLIB                                  PS127950
                          STO   3 NIN       TO START AT LIB START       PS127960
                          LDX  I1 OUTX      POINT TO CURRENT OUTPUT BUF PS127970
                          MDX  L  JSWX,0    SKIP IF IN JOIN MODE        PS127980
                          STO   1 1         SET SA TO LIB START         PS127990
                          LD    3 BSW       SET NO INPUT SW IF BUILD,   PS128000
                          STO   3 ENSW      ELSE CLEAR IT               PS128010
                          SLT     32                                    PS128020
                          STD   3 SPL1      CLEAR SPL1, SPLN            PS128030
                          STO   3 SPSW      *AND SPILL SWITCH           PS128040
                          LD    3 INLC                                  PS128050
                          STO   3 CBUF      POINT TO 1ST INPUT BUFFER   PS128060
                          STO   3 MHSW      CLEAR HDR MOVE HEEDED SW    PS128070
                          STO   3 INSW      SET INIT SWITCH             PS128080
                    IN4   BSI  L  NXTBF                                 PS128090
                          LD    3 INSW                                  PS128100
                          BSC  I  INIT,+-                               PS128110
                          MDX     IN4                                   PS128120
                          SPAC                                          PS128130
                          HDNG    PURGE                                 PS128140
                    *************************************************** PS128150
                    *             PURGE DELETES THE SPECIFIED MACRO   * PS128160
                    *             FROM THE LIBRARY. UPDAT IS USED FOR * PS128170
                    *             POSITIONING.                        * PS128180
                    *************************************************** PS128190
                          SPAC                                          PS128200
                    PURGE DC      *-*                                   PS128210
                          LD    1 1         TEST COL 2 FOR U            PS128220
                          EOR   3 CU        *                           PS128230
                          BSC  L  MUPX2,Z   NO, ILLEGAL REQUEST         PS128240
                          LD    1 2         TEST COL 2 FOR R            PS128250
                          EOR   3 CR        *                           PS128260
                          BSC  L  MUPX2,Z   NO, ILLEGAL REQUEST         PS128270
                          SLA     16        CLEAR TO PURGE MACRO        PS128280
                          STO   3 MPSW      AND ACCOUNT FOR SPACE       PS128290
                          BSI  L  UPDAT     POSITION TO DESIRED MACRO   PS128300
                          MDX     PG000     HDR NOT FOUND---ERROR       PS128310
                          STX  L  P21X      FORCE PRINTING IN POS 21    PS128320
                          BSI   3 EPRT                                  PS128330
                          DC      EM9       PRINT PURGED MESSAGE        PS128340
                          LD    3 PGSW                                  PS128350
                          STO   3 LMAC                                  PS128360
                          STO   3 MHSW      FORCE HEADER MOVE NEXT      PS128370
                          MDX  L  OPTX,-4                               PS128380
                          BSC  I  PURGE     EXIT                        PS128390
                    *                                                   PS128400
                    PG000 BSI   3 EPRT      PRINT MACRO NOT FOUND       PS128410
                          DC      EM11      *MESSAGE                    PS128420
                          BSC  L  MUP09     READ NEXT RECORD            PS128430
                          SPAC                                          PS128440
                          HDNG    UPDAT                                 PS128450
                    **************************************************  PS128460
                    *             UPDAT  POSITIONS TO THE REQUESTED     PS128470
                    *             MACRO FOR FURTHER PROCESSING. IF NOT  PS128480
                    *             FOUND, UPDAT  RETURNS TO THE CALL     PS128490
                    *             LOCATION+1, ELSE TO THE CALL LOCATIO  PS128500
                    *             +2. THE LIBRARY MAY BE FLUSHED BY     PS128510
                    *             SETTING LPSW NONZERO ON ENTRY.        PS128520
                    *             ADD, PURGE, AND REDEF USE UPDAT  FOR  PS128530
                    *             POSITIONING.                          PS128540
                    **************************************************  PS128550
                    UPDAT DC      *-*                                   PS128560
                          LD    3 LNAM                                  PS128570
                          BSC  L  ERR4,+-   ERROR IF NO LIB SPECIFIED   PS128580
                          LD    3 PSW       TEST FOR SELECT P           PS128590
                          BSC  L  UP1,+-    NO, SKIP NAME TEST          PS128600
                          BSI  L  NMTST     YES, GO TEST FOR NAME       PS128610
                    UP1   LD    3 LPSW      TEST IF LIB FLUSH DESIRED   PS128620
                          STO   3 SNAM                                  PS128630
                          BSC  L  UP11,Z    BRANCH IF YES               PS128640
                          BSI  L  PKNM      PACK REQUESTED NAME         PS128650
                    UP9   LD    3 X00FE                                 PS128660
                          BSI  L  MOVE      MOVE OUT CURRENT MACRO      PS128670
                          BSI  L  MHDR      MOVE HEADER                 PS128680
                          LDD   3 MNAM      COMPARE CURRENT MACRO       PS128690
                          SD    3 SNAM      *TO DESIRED MACRO           PS128700
                          BSC  L  UP11,Z    BRANCH IF NO MATCH          PS128710
                          RTE     16        TEST WORDS 3,4              PS128720
                          BSC  L  UP11,Z    BRANCH IF DIFFERENT         PS128730
                          LD    3 MN2                                   PS128740
                          EOR   3 SN2                                   PS128750
                          SRA     8         IGNORE LAST CHARACTER       PS128760
                          BSC  L  UP11,Z    BRANCH IF NO MATCH          PS128770
                          MDX  L  UPDAT,1   SET FOUND RETURN            PS128780
                    UP10  EQU     *                                     PS128790
                          STO   3 LPSW      CLEAR LOOP SWITCH           PS128800
                          BSC  I  UPDAT     RETURN                      PS128810
                    *                                                   PS128820
                    UP11  LD    3 MNAM                                  PS128830
                          EOR   3 XFE00     TEST FOR LIB END            PS128840
                          BSC  L  UP9,Z     BRANCH IF NOT               PS128850
                          STO   3 MNAM      CLEAR MNAM FOR REENTRY      PS128860
                          BSI  L  ETEST     TEST FOR LIBRARY END        PS128870
                    UP7   LDX  I1 OPTX      POINT TO OUTPUT             PS128880
                          LD    3 ADSW      TEST FOR ADD                PS128890
                          BSC  L  UP5,Z     YES, BRANCH                 PS128900
                          LD    3 J1SW      TEST IF 1ST JOIN FLUSH      PS128910
                          BSC  L  UP6,Z     BRANCH IF NOT               PS128920
                    UP5   LD    3 CCSW      TEST FOR CONCATENATE SET    PS128930
                          BSC  L  UP6,Z     BRANCH IF SO                PS128940
                          LDX  I1 OPTX      GET OUTPUT POINTER          PS128950
                          LD    1 -3        PICK UP CONCATENATOR        PS128960
                          STO   3 CCSA      SAVE CONCATENATE SCTR ADDR  PS128970
                          LD    1 -1        GET CONCATENATED            PS128980
                          SRT     16        *LIBRARY NAME               PS128990
                          LD    1 -2        *                           PS129000
                          STD   3 CLIB      SAVE IT                     PS129010
                    UP6   LD    3 ADSW      TEST ADD SWITCH             PS129020
                          BSC  L  UP8,Z     BRANCH IF ADD BEING DONE    PS129030
                          LD    3 JSW       TEST JOIN SW                PS129040
                          BSC  L  UP8,+-    BRANCH IF JOIN BEING DONE   PS129050
                          MDX     UP15                                  PS129060
                    *                                                   PS129070
                    UP8   MDX  L  OPTX,-4   BACK OVER OUTPUT HEADER     PS129080
                          LD    3 NMCSV     BACK OVER INPUT HEADER      PS129090
                          STO   3 NMAC                                  PS129100
                          STO   3 MHSW      SET HEADER MOVE SWITCH      PS129110
                          SLA     16        CLEAR ACCUMULATOR           PS129120
                          MDX     UP10      AND GO TO EXIT              PS129130
                    *                                                   PS129140
                    UP16  LD   L  HTEMP     GET SAVED CONCAT WORD 2     PS129150
                          MDX     UP17      GO STORE IT                 PS129160
                    *                                                   PS129170
                    UP15  LD    3 CCSW      TEST CONCATENATE SWITCH     PS129180
                          BSC  L  UP16,+-   BRANCH IF NOT SET           PS129190
                          LD    3 CCSA      GET SECTOR ADDRESS          PS129200
                          STO   1 -3        STORE CONCATENATOR          PS129210
                          LDD   3 CLIB      GET CONCATENATED LIB NAME   PS129220
                          STO   1 -2        PLACE INTO END OF           PS129230
                          RTE     16        *LIBRARY HEADER             PS129240
                    UP17  STO   1 -1        *                           PS129250
                          LD    3 MSW       CHECK HEADER PRINT SWITCH   PS129260
                          BSC  L  UP12,+-   BYPASS PRINT IF NOT SET     PS129270
                          LD    1 -3        PICK UP CONCATENATOR        PS129280
                          BSI  L  PHEX      PUT IT IN PRINT BUFFER      PS129290
                          LD    3 X00FD                                 PS129300
                          BSI   3 PRNT      PRINT LINE                  PS129310
                    UP12  EQU     *                                     PS129320
                          BSI  L  BFOUT     FORCE OUT LAST BUFFER       PS129330
                          LD    3 NOUT      ADDR OF FREE OUTPUT BUFFER  PS129340
                          A     3 C1        POINT TO SAD WD             PS129350
                          STO     UP20      SAVE POINTER                PS129360
                          LD    3 SLS       =STARTING SAD               PS129370
                          STO  I  UP20      PUT SAD INTO I/O BUFFER     PS129380
                          LD    3 NOUT      GET ADDR OF READ-IN BFR     PS129390
                          STO  L  RADDR     SAVE BUFFER ADDRESS         PS129400
                          BSI  I  ENTER     SAVE ALL STATUS             PS129410
                          LDX  I3 RADDR     GET BUFFER ADDRESS          PS129420
                          BSI  I  GET       READ DISK SECTOR            PS129430
                          BSI  I  RTURN     RESTORE STATUS              PS129440
                          LDX  L3 D                                     PS129450
                          LD    3 ESEC      =LIBRARY END SAD            PS129460
                          LDX  I2 NOUTX     SET XR2 TO OUTPUT BUFFER    PS129470
                          S     2 1         SUBTRACT BEGIN SCRT AD 2-11 PS129475
                          STO   2 3         PUT IN LIB END S/A          PS129480
                          LD    3 EPTR      FE POINTER                  PS129490
                          S     3 X0002     ALLOW FOR W/C, S/A AND      PS129500
                          S     3 X0004     NAME AND POINTERS           PS129510
                          STO   2 4         PUT IN OUTPUT BUFFER        PS129520
                          LD    3 NOUT      =I/O AREA ADDRESS           PS129530
                          STO  L  WADDR                                 PS129540
                          BSI  I  ENTER                                 PS129550
                          LDX  I3 WADDR                                 PS129560
                          BSI  I  PUT                                   PS129570
                          LDX  L3 D                                     PS129580
                    UP14  LD    3 LPSW                                  PS129590
                          BSC  L  UP13,+-   BRANCH IF FIRST PASS        PS129600
                          LD    3 LNRS      TEST LIB NAME RESET SW      PS129610
                          BSC  L  UP14A,+-  NOT SET, SKIP               PS129620
                          SLA     16                                    PS129630
                          STO   3 LNAM      CLEAR LIB NAME              PS129640
                          MDX     UP10      TO NOT FOUND RETURN         PS129650
                    UP14A STO   3 SNAM      CLEAR HEADER                PS129660
                    UP13  EQU     *                                     PS129670
                          MDX  L  LPSWX,1   SET SECOND PASS SWITCH      PS129680
                          LDD   3 SLS                                   PS129690
                          STD   3 SLIB      SET START, END FOR RECYCL   PS129700
                          BSI  L  INIT      RESET FOR SECOND PASS       PS129710
                          BSI  L  MVDUM     GO MOVE POINTERS            PS129720
                          LD    3 SNAM      IF NO HDR SPECIFIED         PS129730
                          BSC  L  UP10,+-   *TAKE NOT FOUND EXIT        PS129740
                          BSC  L  UP9       TEST FIRST MACRO            PS129750
                    ERR4  BSI   3 EPRT                                  PS129760
                          DC      EM4       PRINT LIB NOT SPECIFIED     PS129770
                          BSI  L  FLUSH                                 PS129780
                          BSC  L  MUP11                                 PS129790
                    UP20  DC      *-*       TEMP SAVE WORD              PS129800
                          HDNG    ETEST                                 PS129810
                    **************************************************  PS129820
                    *             TEST THAT THE CURRENT BUFFER WILL   * PS129830
                    *             FIT INTO THE LIBRARY. IF SO, UPDATE * PS129840
                    *             THE END OF PHYSICAL LIBRARY SECTOR  * PS129850
                    *             ADDRESS AND DISPLACEMENT. IF NOT    * PS129860
                    *             LIBRARY OVERFLOW HAS OCCURED.       * PS129870
                    **************************************************  PS129880
                    ETEST DC      *-*                                   PS129890
                          LDX  I1 OUTX      GET END OF LIBRARY+1        PS129900
                          LD    3 OLIB      *SECTOR ADDRESS             PS129910
                          S     1 1         COMPARE TO CURRENT SCTR     PS129920
                          BSI  L  BFOUT,+-  *ADDR-BR IF OVERFLOW        PS129930
                          LD    1 1         GET CURRENT SECTOR ADDR     PS129940
                          STO   3 ESEC      SAVE IT                     PS129950
                          LD    3 OPT       GET POINTER TO END OF       PS129960
                          S     3 OUT       *LIBRARY.FIND DISPLACEMENT  PS129970
                          STO   3 EPTR      *HEADER AND SAVE IT         PS129980
                          BSC  I  ETEST     RETURN                      PS129990
                    *************************************************** PS130000
                    *             TESTS THAT A NAME STATEMENT HAS BEEN* PS130010
                    *             PROCESSED SINCE LAST LIB OR BUILD   * PS130020
                    *             FLUSHES LIBRARY IF NOT.             * PS130030
                    *************************************************** PS130040
                    NMTST DC      *-*       ENTRY POINT                 PS130050
                          LD    3 NMSW      GET NAME SWITCH             PS130060
                          BSC  I  NMTST,Z   SET, RETURN TO CALLER       PS130070
                          LD    3 JSW       TEST IF JOIN                PS130080
                          BSC  L  NMTS2,Z   BRANCH IF NOT               PS130090
                          LD    3 X00FF     RESET JOIN SWITCHES         PS130100
                          STO   3 JSW       *                           PS130110
                          STO   3 J1SW      *                           PS130120
                          BSI  L  CRPRT     PRINT CONTROL RECORD        PS130130
                    NMTS2 BSI   3 EPRT      PRINT ERROR MESSAGE         PS130140
                          DC      EM14                                  PS130150
                          BSI  L  FLUSH                                 PS130160
                          BSC  L  MUP11                                 PS130170
                    *                                                   PS130180
                    *************************************************** PS130190
                    *             EXITS VIA ENDUP IF MONITOR OR DUP   * PS130200
                    *             CONTROL RECORD HAS BEEN READ.RETURNS* PS130210
                    *             IF NOT.                             * PS130220
                    *************************************************** PS130230
                    CTTST DC      *-*                                   PS130240
                          MDX  L  $CTSW,0   MONITOR CONTROL RECORD READ PS130250
                          MDX     CT010     BRANCH IF YES               PS130260
                          MDX  L  DUPCR+C,0 DUP CONTROL RECORD READ     PS130270
                          MDX     CT010     BRANCH IF YES               PS130280
                          BSC  I  CTTST     RETURN IF NEITHER           PS130290
                    CT010 BSC  L  ENDUP     CONTROL RECORD READ, EXIT   PS130300
                          HDNG    ADD                                   PS130310
                    *************************************************** PS130320
                    *             ADD POSITIONS TO END OF LIBRARY     * PS130330
                    *             THEN INSERTS THE NEW HEADER. FESW IS* PS130340
                    *             SET TO ASSURE THAT AN END OF MACRO  * PS130350
                    *             FLAG IS INSERTED AT THE END OF THE  * PS130360
                    *             ADDITIONS, AND THAT NO MOVES ARE    * PS130370
                    *             ATTEMTED. MHSW IS SET TO INHIBIT    * PS130380
                    *             MOVING OF THE NEXT HEADER WHEN ADD  * PS130390
                    *             IS POSITIONING TO END OF MACRO.     * PS130400
                    *************************************************** PS130410
                          SPAC                                          PS130420
                    ADD   DC      *-*                                   PS130430
                          LD    1 1         TEST COL 2 FOR D            PS130440
                          EOR   3 CD        *                           PS130450
                          BSC  L  MUPX2,Z   ILLEGAL REQUEST IF NOT      PS130460
                          LD    3 LNAM                                  PS130470
                          BSI  L  UPDAT,+-  ERROR IF LIB                PS130480
                          BSC  L  ERR4,+-   *NOT SPECIFIED              PS130490
                          BSI     NMTST     GO TEST FOR NAME            PS130500
                          BSI  L  MSNSC     TEST FOR VALID MACRO NAME   PS130510
                          LD      *         TF                          PS130520
                          STO   3 ADSW      INDICATE ADD IS BEING DONE  PS130530
                          STO   3 LPSW      POSITION TO END OF          PS130540
                          BSI  L  UPDAT     *LIBRARY                    PS130550
                          BSI  L  PKNM      CONDENSE HDR                PS130560
                          LDX  L1 SNAMX                                 PS130570
                          BSI  L  HOUT      MOVE IT TO OUTPUT BUFFER    PS130580
                          BSI  L  INSRX     PROCESS ADD TEXT CARDS      PS130590
                          LD    3 X00FE     FE FOR MOVE                 PS130600
                          STO   3 FESW      FORCE FE TO OUTPUT          PS130610
                          STO   3 INDL      FAKE INSERT TO FORCE PRINT  PS130620
                          BSI  L  MOVE      MOVE FE, NEXT HEADER        PS130630
                          MDX  L  OPTX,4    POSITION AS IF HDR MOVED    PS130640
                          BSI  L  ETEST     TEST IF ADDITION WILL FIT   PS130650
                          MDX  L  OPTX,-4   RESET OUTPUT POINTER        PS130660
                          SLA     16        RESET INSERT/DELETE SW      PS130670
                          STO   3 INDL      $F                          PS130680
                          STO   3 ADSW      *                           PS130690
                          BSI     CTTST     TEST IF CONTROL STMT READ   PS130700
                          BSC  I  ADD       RETURN                      PS130710
                          HDNG    OUTPUT                                PS130720
                    *************************************************** PS130730
                    *             OUTPUT PUNCHES INTO CARDS THE MACRO * PS130740
                    *             PROTOTYPE NAMED.MVADD AND PUNCH ARE * PS130750
                    *             CALLED TO PUNCH THE ADD CARD. THE   * PS130760
                    *             TEXT PRINT SWITCH (PSW) IS THEN SET * PS130770
                    *             TO FORCE FORMATTING OF PROTOTYPE    * PS130780
                    *             STATEMENTS. THE STATEMENTS ARE THEN * PS130790
                    *             MOVED TO AND PUNCHED FROM SAREA VIA * PS130800
                    *             SLAP AND PUNCH.                     * PS130810
                    *************************************************** PS130820
                    OUTPT DC      *-*       ENTRY/EXIT                  PS130830
                          LDX  L1 C         RESTORE CATCO POINTER       PS130840
                          LD    1 #PIOD     TEST PRINCIPAL I/O DEVICE   PS130850
                          BSC  L  MUPX2,+Z  BR IF PAPER TAPE - ERROR    PS130860
                          LD    3 LNAM      IS THERE A CURRENT LIBRARY  PS130870
                          BSC     Z         NO, GO TO UPDAT FOR ERROR   PS130880
                          BSI     NMTST     YES, TEST IF NAME PROCESSED PS130890
                    *                                                   PS130900
                          BSI  L  UPDAT     POSITION TO DESIRED MACRO   PS130910
                          MDX     OUT29     MACRO NOT FOUND             PS130920
                          LDX  L1 C         RESTORE CATCO POINTER       PS130930
                          LDD   1 PIHDR+2   PRINCIPAL I/O HEADER        PS130940
                          LDX  L3 IOADR     POINT TO CORE ADDRESS       PS130950
                          STD   3 0         PLACE HEADER                PS130960
                          MDX  L  $IBSY,0   WAIT UNTIL ALL I/O          PS130970
                          MDX     *-3       *COMPLETE                   PS130980
                          BSI  I  GET       GET SUBROUTINE              PS130990
                          STX  L  IOREQ+C   INDICATE CARD ROUTINE READ  PS131000
                          LDX  L3 D         RESTORE CONSTANT POINTER    PS131010
                          LDX  L1 C         GET CATCO POINTER           PS131020
                          LD    1 THIS      CHECK ORDER OF THIS AND     PS131030
                          S     1 NEXT      *NEXT                       PS131040
                          BSC  L  OUT01,-   BRANCH IF IN ORDER          PS131050
                          LDD   1 THIS      SWITCH THIS AND NEXT        PS131060
                          RTE     16        *                           PS131070
                          STD   1 THIS      *                           PS131080
                    *                                                   PS131090
                    OUT01 LD    3 D0080     PLACE WORD COUNTS IN        PS131100
                          STO  I  THIS+C    *BUFFER                     PS131110
                          STO  I  NEXT+C    *                           PS131120
                          LDX  I1 NEXT+C    CLEAR BUFFER TO ZEROS       PS131130
                          LDX   2 80        FIND BUFFER END             PS131140
                          SLA     16        CLEAR ACC TO 0              PS131150
                    OUT02 STO   1 1         CLEAR A WORD                PS131160
                          MDX   1 1         FIND NEXT WORD              PS131170
                          MDX   2 -1        DECREMENT COUNT             PS131180
                          MDX     OUT02     CONTINUE UNTIL DONE         PS131190
                    *                                                   PS131200
                          LDX   1 80        CLEAR SAREA TO EBCDIC       PS131210
                          LD    3 BLAN      BLANKS                      PS131220
                    OUT03 STO  L1 SAREA-1   *                           PS131230
                          MDX   1 -1        *                           PS131240
                          MDX     OUT03     *                           PS131250
                          LDX  L1 C         GET CATCO POINTER           PS131260
                          LD    1 #RP67     TEST PUNCH DEVICE           PS131270
                          BSC  L  OUT05,+   BRANCH IF 1442-5            PS131280
                    *************************************************** PS131290
                    *             GET 1442/1442 DEVICE ROUTINE          PS131300
                    *************************************************** PS131310
                          LDX  I3 IOADR+2   GET CORE ADDRESS            PS131320
                          MDX   3 -3        *                           PS131330
                          LDD   1 P1442     GET IOAR HEADER             PS131340
                          STD   3 0         PUT IN CORE ADDRESS         PS131350
                          BSI  I  GET       GET MODULE                  PS131360
                          LDX  L3 D         RESTORE POINTER             PS131370
                    *                                                   PS131380
                    OUT04 BSI  I  GETBI     READ A CARD                 PS131390
                          BSI  L  BLTST     TEST IT FOR NONBLANKS       PS131400
                          MDX     OUT04     READ AGAIN IF NOT BLANK     PS131410
                    *                                                   PS131420
                    OUT05 BSI  L  MVADD     SET UP THE ADD CARD         PS131430
                          BSI  L  PUNCH     PUNCH THE ADD CARD          PS131440
                          LD    3 PSW       SELECT P INDICATOR          PS131450
                          STO   3 LF500     TEMPORARILY SAVE IT         PS131460
                          LD      OUTPT     GET A NON-0 VALUE INACC     PS131470
                          STO   3 PSW       FORCE SELECT P              PS131480
                          STO   3 OPSW      SET OUTPUT SWITCH           PS131490
                    OUT10 LDX  L1 C         GET CATCO POINTER           PS131500
                          LD    1 #RP67     TEST PUNCH DEVICE           PS131510
                          BSC  L  OUT15,+   BRANCH IF 1442-5            PS131520
                    OUT12 BSI  I  GETBI     READ A CARD                 PS131530
                          BSI  L  BLTST     TEST IT FOR NONBLANKS       PS131540
                          MDX     OUT12     READ AGAIN IF NOT BLANK     PS131550
                    *                                                   PS131560
                    OUT15 LD    3 FD        GET NEXT STMNT INDICATOR    PS131570
                          BSI  L  MOVE      PUT NEXT CARD INTO PAREA    PS131580
                    *                                                   PS131590
                          LDX   1 80        CLEAR SAREA TO EBCDIC       PS131600
                          LD    3 BLAN      *BLANKS                     PS131610
                    OUT17 STO  L1 SAREA-1   *                           PS131620
                          MDX   1 -1        *                           PS131630
                          MDX     OUT17     *                           PS131640
                    *                                                   PS131650
                          BSI  L  SLAP      SLAP CARD INTO SAREA        PS131660
                    *                                                   PS131670
                          BSI  L  PUNCH     PUNCH IT                    PS131680
                    OUT20 BSI  L  PTINT     INITIALIZE PRINT ROUTINE    PS131690
                          MDX     OUT10     LOOP UNTIL MACRO PUNCHED    PS131700
                    OUT29 MDX     OUT30     MACRO NOT FOUND             PS131710
                    *                                                   PS131720
                    OUT25 SLA     16                                    PS131730
                          STO   3 OPSW      RESET OUTPUT SW UPON EXIT   PS131740
                          BSI  L  PTINT     INITAIALIZE PRINT ROUTINE   PS131750
                          LD    3 LF500     = SAVED WORD                PS131760
                          LDX  L1 C         RESTORE CATCO POINTER       PS131770
                          STO   3 PSW       RESTORE SELECT P STATUS     PS131780
                    *************************************************** PS131790
                    *             RESTORE PRINCIPAL I/O MODULE          PS131800
                    *************************************************** PS131810
                          LDX  L3 IOADR     RELOAD PRINCIPAL I/O BLOCK  PS131820
                          LDD   1 PIHDR     *                           PS131830
                          STD   3 0                                     PS131840
                          BSI  I  GET       RESTORE PRINCIPAL I/O       PS131850
                          LDX  L3 D         RESTORE POINTER             PS131860
                    *                                                   PS131870
                          BSC  I  OUTPT     EXIT OUTPUT PROCESSING      PS131880
                    *                                                   PS131890
                    OUT30 BSI   3 EPRT      PRINT MACRO NOT FOUND       PS131900
                          DC      EM11      *MESSAGE                    PS131910
                          BSC  L  MUP09     READ NEXT CONTROL RECORD    PS131920
                    OUT35 SLA     16        CLEAR OUTPUT SWITCH         PS131930
                          STO   3 OPSW      *                           PS131940
                          BSI  L  PTINT     INITIALIZE PRINT ROUTINE    PS131950
                          BSI   3 EPRT      PRINT INVALID PARAMETER     PS131960
                          DC      EM17      *MESSAGE                    PS131970
                          MDX     OUT25     ABORT OUTPUT OPERATION      PS131980
                          HDNG    RENAME                                PS131990
                    *************************************************** PS132000
                    *             RENAME USES UPDAT TO POSITION TO THE* PS132010
                    *             DESIRED MACRO, THEN CHANGES ITS NAME* PS132020
                    *             AS REQUESTED.                       * PS132030
                    *************************************************** PS132040
                    RENAM DC      *-*                                   PS132050
                          BSI  L  UPDAT     POSITION TO DESIRED MACRO   PS132060
                          MDX     REDX1     ERROR IF NOT FOUND          PS132070
                          BSI  L  PKNM      PACK MACRO NAME             PS132080
                          STX  L  P21X      FORCE PRINTING IN POS 21    PS132090
                          BSI   3 EPRT                                  PS132100
                          DC      EM10      PRINT REDEF MESSAGE         PS132110
                          MDX  L  OPTX,-4   BACK OVER HEADER            PS132120
                          LDX  L1 SNAMX                                 PS132130
                          LD    3 MSW       SAVE SETTING OF HDR PRT SW  PS132140
                          STO     MSAVE     *                           PS132150
                          STX  L  MSWX      SET HEADER PRINT SWITCH ON  PS132160
                          BSI  L  HOUT      MOVE HEADER OVER OLD ONE    PS132170
                          LD      MSAVE     RESTORE HEADER PRINT        PS132180
                          STO   3 MSW       *SWITCH                     PS132190
                          BSC  I  RENAM     RETURN                      PS132200
                    REDX1 BSC  L  MUPX3     PRINT MACRO NOT FOUND MSG   PS132210
                    MSAVE DC      *-*       SAVES MSW SETTING           PS132220
                          HDNG    BLTST                               $FPS132230
                    *************************************************** PS132240
                    *             BLTST CHECKS THAT A CARD TO BE      * PS132250
                    *             PUNCHED ON A 1442-6 OR -7 IS BLANK. * PS132260
                    *             IF NON-BLANK,PRINT ERROR MESSAGE AND* PS132270
                    *             RETURN DIRECTLY.                    * PS132280
                    *             IF BLANK, RETURN TO 1 BEYOND DIRECT.* PS132290
                    *************************************************** PS132300
                    BLTST DC      *-*       ENTRY/EXIT                  PS132310
                          LDX  I1 THIS+C    POINT TO CARD BUFFER        PS132320
                          MDX  L  $IBSY,0   WAIT UNTIL CARD IS          PS132330
                          MDX     *-3       *COMPLETELY READ            PS132340
                          LDX   2 80        INITIALIZE LOOP COUNTER     PS132350
                    BL000 LD    1 1         GET A COLUMN                PS132360
                          BSC  L  NTBLK,Z   BRANCH IF NOT BLANK         PS132370
                    *                                                   PS132380
                          MDX   1 1         BUMP COLUMN POINTER         PS132390
                          MDX   2 -1        DECREMENT LOOP COUNTER      PS132400
                          MDX     BL000     LOOP UNTIL 80 ARE CHECKED   PS132410
                          MDX  L  BLTST,1   SET BLANK CARD RETURN       PS132420
                          BSC  I  BLTST     EXIT                        PS132430
                    *                                                   PS132440
                    NTBLK EQU     *                                     PS132450
                          SLA     16        CLEAR OUTPUT SWITCH FOR     PS132460
                          STO   3 OPSW      *ERROR MESSAGE PRINT        PS132470
                          BSI   3 EPRT      CALL PRINT ROUTINE          PS132480
                          DC      EM13      NEED BLANK CARDS MESSAGE    PS132490
                          SLT     16        CLEAR EXTENSION             PS132500
                          MDX  L  $PBSY,0   WAIT FOR PRINT COMPLETE     PS132510
                          MDX     *-3       *                           PS132520
                          LD    3 X100F     GET WAIT CODE               PS132530
                          STO   3 OPSW      SET OUTPUT SWITCH BACK ON   PS132540
                          BSI  L  $PRET     WAIT                        PS132550
                          BSC  I  BLTST     RETURN                      PS132560
                          HDNG    LET/FLET SEARCH                       PS132570
                    *                                                   PS132580
                    *************************************************** PS132590
                    *                                                 * PS132600
                    *             LET/FLET SEARCHES FOR FILES         * PS132610
                    *                                                 * PS132620
                    *************************************************** PS132630
                    *                                                   PS132640
                    *                                                   PS132650
                    *             CHECK FILE NAME FOR VALIDITY          PS132660
                    LFSRH DC      *-*       LET/FLET SEARCH             PS132670
                          SLA     16        RESET NON-DDF ENTRY FOUND   PS132680
                          STO   3 NDDF      *SWITCH                     PS132690
                    *                                                   PS132700
                          STX  L3 SAVE3     SAVE XR3                    PS132710
                          LDX  I1 RPTX      SET POINTER TO LIB NAME     PS132720
                          LDX   2 6         SET LOOP LIMIT              PS132730
                    SR005 LD    1 0         LOAD CHARACTER              PS132740
                          EOR   3 QUOT      TEST FOR QUOT MARK          PS132750
                          BSC  L  SR045,+-  BRANCH IF FOUND             PS132760
                          MDX   1 1         INCREMENT INPUT POINTER     PS132770
                          MDX   2 -1        DECREMENT LENGTH LIMIT      PS132780
                          MDX     SR005     LOOP IF NOT ERROR           PS132790
                          MDX     SR010     ERROR EXIT                  PS132800
                    SR045 LD    3 BLAN      QUOT FOUND - BLANK IT OUT   PS132810
                    BLKIT STO   1 0         *                           PS132820
                          MDX   1 1         BLANK OUT NAME FROM POINT   PS132830
                          MDX   2 -1        *WHERE QUOT  FOUND TO MAX   PS132840
                          MDX     BLKIT     *POSSIBLE LENGTH            PS132850
                          LDX  I1 RPTX      POINT TO DATA NAME          PS132860
                          LD    1 0         FIRST CHAR MUST BE          PS132870
                          S    L  SR900     *NONNUMERIC                 PS132880
                          BSC  L  SR010,-   BR-FIRST CHAR IS NUMERIC    PS132890
                    *                                                   PS132900
                          LDX   3 -5        SET CHAR CNT                PS132910
                    SR050 LDX  L2 SR901     SET TABLE ADDR              PS132920
                    *                                                   PS132930
                          LD    1 0         CHECK FOR BLANK COL         PS132940
                          S    L  SR902                                 PS132950
                          BSC  L  SR020,+-  BR-COL IS BLANK             PS132960
                    *                                                   PS132970
                    SR040 S     2 0         CHECK FOR VALID 8-BIT CHAR  PS132980
                          BSC  L  SR010,+Z  BR-NOT IN CHAR RANGE        PS132990
                          S     2 1                                     PS133000
                          BSC  L  SR030,+   BR-CHAR IS VALID            PS133010
                          MDX   2 2                                     PS133020
                          MDX     SR040     CONT CHAR CHECK             PS133030
                    *                                                   PS133040
                    SR030 MDX   1 1         INCR I/P PT                 PS133050
                          MDX   3 1         INCR CHAR CNT               PS133060
                          MDX     SR050     CONT NAME CHECK-NEXT CHAR   PS133070
                          MDX     SR060     LABEL VALID-GO PACK,SEARCH  PS133080
                    *                                                   PS133090
                    SR010 EQU     *                                     PS133100
                          MDX     SR135     ERROR EXIT                  PS133110
                    *                                                   PS133120
                    SR020 LD    1 0         CHECK FOR EMBEDDED BLANKS   PS133130
                          S    L  SR902                                 PS133140
                          BSC  L  SR010,Z   BR-EMBEDDED BLANK ERROR     PS133150
                          MDX   1 1                                     PS133160
                          MDX   3 1         INCR CHAR CNT               PS133170
                          MDX     SR020     CONT BLANK CHECK            PS133180
                    *                                                   PS133190
                          LD    1 -5        CHECK FOR BLANK NAME FIELD  PS133200
                          S       SR902                                 PS133210
                          BSC  L  SR010,+-  BR-FILE NAME BLANK          PS133220
                    *                                                   PS133230
                    *************************************************** PS133240
                    *                                                 * PS133250
                    *             PACK FILE NAME                      * PS133260
                    *                                                 * PS133270
                    *************************************************** PS133280
                    SR060 MDX   1 -5        NAME IS VALID               PS133290
                          LDX   3 -5        PACK NAME                   PS133300
                          SLT     32        CLEAR REGISTERS             PS133310
                    *                                                   PS133320
                    SR070 STD     SR908     CLEAR NAME SAVE AREA        PS133330
                          LD    1 0         RETRIEVE CHAR               PS133340
                          AND     SR903     PREPARE 6 BITS FOR PACK     PS133350
                          SLA     10                                    PS133360
                          OR      SR908     ADD 6 BIT CHAR TO PACK NAME PS133370
                          RTE     32-6                                  PS133380
                          MDX   1 1         INCR I/O PT                 PS133390
                          MDX   3 1         INCR CHAR CNT               PS133400
                          MDX     SR070     CONT NAME PACK              PS133410
                    *                                                   PS133420
                          OR      SR904     OR ON DDF INDR TO NAME      PS133430
                          STD     SR908     SAVE FILE NAME              PS133440
                          STD  L  LNAMX     SAVE LIBRARY NAME           PS133450
                    *                                                   PS133460
                    *************************************************** PS133470
                    *                                                 * PS133480
                    *             PERFORM LET/FLET SEARCH             * PS133490
                    *                                                 * PS133500
                    *************************************************** PS133510
                          LDX  I2 LET       SET DISK BUFFER POINTER     PS133520
                          MDX   2 2         REG 2 PT TO I/O AREA        PS133530
                    *                                                   PS133540
                    SR090 LDX   1 -@MXDR-1  SET REG 1 TO MAX DR CNT     PS133550
                          LD   L1 $ULET+@MXDR+1 FETCH ADDR OF LET       PS133560
                          MDX   1 1         SKIP IF ALL DRIVES SEARCHED PS133570
                          MDX     *+1       *BRANCH OTHERWISE           PS133580
                    *                                                   PS133590
                    *     TAKE ERROR EXIT                               PS133600
                    *                                                   PS133610
                          MDX     SR138     SET UP NOT FOUND RETURN     PS133620
                    *                                                   PS133630
                          BSC     +-        SKIP IF DR BEING USED,      PS133640
                          MDX     SR138     *ERROR OTHERWISE            PS133650
                    SR140 STO   2 -1        PUT SCTR ADDR IN I/O AREA   PS133660
                    *                                                   PS133670
                          LDX  I3 LET                                   PS133680
                          BSI  I  ENTER     SAVE ALL STATUS             PS133690
                          BSI  I  GET       READ A SECTOR               PS133700
                          BSI  I  RTURN     RESTORE STATUS              PS133710
                    *                                                   PS133720
                          LD    2 @SCTN     FETCH LET/FLET SCTR NO.     PS133730
                          BSC     +-        SKIP,NOT FIRST LET SCTR     PS133740
                          MDX     SR100     *BRANCH OTHERWISE           PS133750
                    *                                                   PS133760
                          S       SR906                                 PS133770
                          BSC     Z         SKIP IF 1ST SCTR FLET       PS133780
                          MDX     SR110     BR,NOT 1ST SCTR LET FLET    PS133790
                    *                                                   PS133800
                    SR100 LD    2 @UAFX     INITIALIZE BLK ADDR ACC     PS133810
                          SLA     4         *TO ADDR 1ST PROGRAM        PS133820
                          STO     SR905     *STORED IN LET/FLET         PS133830
                    *                                                   PS133840
                    SR110 LD      SR907     COMPUTE NO. WDS IN CURRENT  PS133850
                          S     2 @WDSA     *LET/FLET SECTOR            PS133860
                          STO     SR909                                 PS133870
                    *                                                   PS133880
                    SR130 LD    2 @BLCT+@LFHD SAVE BLK CNT OF CURRENT   PS133890
                          STO     SR910     *LET/FLET ENTRY             PS133900
                    *                                                   PS133910
                    *     COMPARE FILE NAME TO ENTRY NAME               PS133920
                    *                                                   PS133930
                    *                                                   PS133940
                          LD    2 @LFNM+1+@LFHD FETCH 2ND WD-ENT NAME   PS133950
                          S       SR908+1                               PS133960
                          BSC     Z         SKIP IF NAMES MATCH,        PS133970
                          MDX     SR120     *BRANCH OTHERWISE           PS133980
                    *                                                   PS133990
                          LD    2 @LFNM+@LFHD GET 1ST WORD OF ENTRY     PS134000
                          EOR     SR908     COMPARE TO NAME SOUGHT      PS134010
                          BSC  L  SR132,+-  BRANCH IF WORDS MATCH       PS134020
                          SLA     2         TEST FOR NON DDF MATCH      PS134030
                          BSC  L  SR120,Z   BRANCH IF NOT               PS134040
                          STX  L  NDDFX     SET NON-DDF ENTRY SWITCH    PS134050
                    *                                                   PS134060
                    *     RETURN SCTR ADDR AND BLK CNT FOR FILE         PS134070
                    *                                                   PS134080
                    SR132 EQU     *                                     PS134090
                          LD    2 @LFNM+2+@LFHD FETCH BLK CNT OF FILE   PS134100
                          SRT     16        *AND PUT IN EXTENSION REG   PS134110
                          SLA     4         ELIMINATE POSSIBLE SIGN     PS134120
                          SRT     4         CONVERT TO SECTOR ADDR      PS134130
                    *                                                   PS134140
                          LD      SR905     FETCH BLK ADDR OF FILE      PS134150
                          SRA     4         CONVERT TO SCTR ADDR        PS134160
                          STO     SR905     SAVE SCTR ADDR              PS134170
                          LD    3 1         GET CURRENT DRIVE CODE      PS134180
                          AND     SR912                                 PS134190
                          OR      SR905     ADD SECTOR ADDR             PS134200
                          MDX  L  LFSRH,2   SET UP FOUND RETURN         PS134210
                    SR135 LDX  I3 SAVE3     RESTORE XR3                 PS134220
                          BSC  I  LFSRH     RETURN                      PS134230
                    SR138 MDX  L  LFSRH,1   SET UP NOT FOUND RETURN     PS134240
                          MDX     SR135     EXIT                        PS134250
                    *                                                   PS134260
                    *     CONTINUE SEARCH,NO MATCH FOUND                PS134270
                    *                                                   PS134280
                    SR912 DC      /F000                                 PS134290
                    SR120 LD      SR905     COMPUTE ACCUMULATED BLK     PS134300
                          A       SR910     *ADDR AND                   PS134310
                          STO     SR905     *SAVE                       PS134320
                    *                                                   PS134330
                          MDX   2 @LFEN     PT TO NEXT LET/FLET ENTRY   PS134340
                          LD      SR909                                 PS134350
                          S    L  D3        DECREMENT LET/FLET COUNT    PS134360
                          STO     SR909                                 PS134370
                          BSC     Z         SKIP WHEN SCTR SEARCHED,    PS134380
                          MDX     SR130     *BRANCH OTHERWISE           PS134390
                    *                                                   PS134400
                    *     PREPARE TO READ DOWN A NEW LET/FLET SCTR      PS134410
                    *                                                   PS134420
                          LDX  I2 LET       BFR ADDR TO INDEX 2         PS134430
                          MDX   2 2         *                           PS134440
                          LD    2 @NEXT                                 PS134450
                          BSC     +-        SKIP UNLESS LAST LET/FLET   PS134460
                          MDX     SR090+1   BR TO INITIALIZE NEW DR     PS134470
                    *                                                   PS134480
                          LD    2 -1        FETCH CURR SCTR ADDR        PS134490
                          AND     SR912     AND OUT SCTR ADDR           PS134500
                          OR    2 @NEXT     OR IN NEW SCTR ADDR         PS134510
                          MDX     SR140     BRANCH TO CONTINUE          PS134520
                    *************************************************** PS134530
                    *                                                 * PS134540
                    *             LET/FLET SEARCH CONSTANTS           * PS134550
                    *                                                 * PS134560
                    *************************************************** PS134570
                          DC      .Z-.S                                 PS134580
                    @LFNM EQU     0         RLTV ADDR OF LET/FLET NAME  PS134590
                    @BLCT EQU     2         DISP TO BLK CNT             PS134600
                    @LENM EQU     0         DISP TO NAME                PS134610
                    @LFEN EQU     3         LNG OF LET/FLET ENT         PS134620
                    @NEXT EQU     4         DISP TO NEXT SCTR ADDR      PS134630
                    SR901 DC      .$-.      CHARS BELOW $ ARE INVALID   PS134640
                          DC      .$-.$     $ IS VALID CHARACTER        PS134650
                          DC      .#-.$     CHARS BETWEEN $,# INVALID   PS134660
                          DC      /0001     NEXT 2 CHARS # , AT SIGN) O PS134670
                          DC      /0045     CHARS BETWEEN AT SIGN, A IN PS134680
                          DC      .I-.A     CHARS A TRU I OK            PS134690
                          DC      .J-.I     CHARS BETWEEN I, J INVALID  PS134700
                          DC      .R-.J     CHARS J THRU R OK           PS134710
                          DC      .S-.R     CHARS BETWEEN R, S INVALID  PS134720
                          DC      .Z-.S     CHARS S THRU Z OK           PS134730
                          DC      .0-.Z     CHARS BETWEEN Z, 0 INV      PS134740
                          DC      .9-.0     CHARS 0 THRU 9 OK           PS134750
                          DC      /3FFF-.9  (FORCE END CHECK LOOP)      PS134760
                    SR910 DC      *-*       BLK CNT OF CURR LET ENT     PS134770
                    SR900 DC      .0        EBC 0                       PS134780
                    SR902 DC      .         EBC BLANK                   PS134790
                    SR903 DC      /3F       USED TO SAVE BITS 10-15     PS134800
                    SR904 DC      /C000     DISK DATA FMT INDR          PS134810
                    SR908 BSS  E  2         SAVE ADDR FOR PACKED NAME E PS134820
                    @MXDR EQU     5         MAX NO. OF DISK DRIVES      PS134830
                    SR905 DC      *-*       CURRENT BLOCK ADDR          PS134840
                    @SCTN EQU     0         DISP TO SCTR NO.            PS134850
                    SR909 DC      *-*       NO. WDS LEFT FOR COMPARISON PS134860
                    @WDSA EQU     3         DISP TO NO. WDS OF SCTR     PS134870
                    @LFHD EQU     5         LNG OF SCTR HEADER          PS134880
                    SR907 DC      320-@LFHD NO. WDS PER LET/FLET SCTR   PS134890
                    @UAFX EQU     1         DISP TO SCTR ADDR,USER AREA PS134900
                    SR906 DC      16        NO. OF 1ST SCTR IN FLET     PS134910
                    D3    DC      3         DECIMAL CONSTANT 3          PS134920
                    LET   DC      *-*       ADDR OF LET/FLET BUFFER     PS134930
                          HDNG    MVADD                                 PS134940
                    *             MVADD FORMATS THE ADD CARD WHEN     * PS134950
                    *             OUTPUTING A MACRO PROTOTYPE         * PS134960
                    MVADD DC      *-*       ENTRY/EXIT                  PS134970
                          LDD   3 MNAM      FIRST 2 WDS OF MACRO NAME   PS134980
                          STO     MVA50+3   STORE INTO EBC STMNT        PS134990
                          RTE     16        2ND WD TO ACCUMULATOR       PS135000
                          STO     MVA50+4   STORE INTO EBC STMNT        PS135010
                          LD    3 MN2       3RD WD OF MACRO NAME        PS135020
                          AND     HFF00     KEEP ONLY 5TH CHAR          PS135030
                          OR    3 QUOT      OR IN TRAILING QUOTE        PS135040
                          STO     MVA50+5   ADD STMNT READY - UNPACK    PS135050
                          LDX   1 6         INITIALIZE LOOP COUNTER     PS135060
                          LDX  L2 MVA50     POINT TO PACKED TEXT        PS135070
                          LDX  L3 SAREA     POINT TO CARD BUFFER        PS135080
                    MVA10 BSI     MVA30     UNPACK AND STORE TEXT       PS135090
                          MDX   2 1         BUMP FROM POINTER           PS135100
                          MDX   3 2         BUMP TO POINTER             PS135110
                          MDX   1 -1        DECREMENT MOVE COUNTER      PS135120
                          MDX     MVA10     COMPLETE MOVE               PS135130
                          LDX  L3 D         POINT TO CONSTANT AREA      PS135140
                          BSC  I  MVADD     EXIT                        PS135150
                    *                                                   PS135160
                    HFF00 DC      /FF00     HIGH BYTE MASK              PS135170
                          BSS  E  0         ASSURE EVEN ADDRESS         PS135180
                    MVA50 EBC     .ADD  '    .                          PS135190
                          DC      *-*       CHAR 5 AND TRAILING QUOTE   PS135200
                    *                                                   PS135210
                    MVA30 DC      *-*       ENTRY/EXIT                  PS135220
                          LD    2 0         CH1  CH2  X    X            PS135230
                          SRT     8         0    CH1  CH2  X            PS135240
                          SLA     8         CH1  0    CH2  X            PS135250
                          SRT     8         0    CH1  0    CH2          PS135260
                          AND  L  HXFF      FIRST 8 BITS MUST BE ZERO   PS135270
                          STO   3 0         STORE 1ST CHAR              PS135280
                          RTE     16        GET 2ND                     PS135290
                          STO   3 1         STORE 2ND CHAR              PS135300
                          BSC  I  MVA30     EXIT                        PS135310
                          HDNG    FLUSH                                 PS135320
                    *************************************************** PS135330
                    *             FLUSH READS INPUT RECORDS           * PS135340
                    *             UNTIL A LIB,BUILD,ENDUP OR MONITOR  * PS135350
                    *             OR DUP CONTROL RECORD IS READ       * PS135360
                    *             SELECT RECORDS ARE PROCESSED        * PS135370
                    *             NORMALLY.                           * PS135380
                    *************************************************** PS135390
                    FLUSH DC      *-*       ENTRY POINT                 PS135400
                          STX  L  FLSWX     SET FLUSH SWITCH            PS135410
                    FL005 BSI  L  RDCRD     READ A RECORD               PS135420
                    FL008 EQU     *                                     PS135430
                          LDX   2 8         INITIALIZE FOR CHARACTER    PS135440
                          LDX  L1 SAREA     *SCAN                       PS135450
                          BSI  L  MCCSN     ENTER SCAN                  PS135460
                          DC      .L        LIB                         PS135470
                          DC      FEXIT     EXIT FLUSH IF LIB           PS135480
                          DC      .B        BUILD                       PS135490
                          DC      FEXIT     EXIT FLUSH IF BUILD         PS135500
                          DC      .E        ENDUP                       PS135510
                          DC      FEXIT     EXIT FLUSH IF ENDUP         PS135520
                          DC      .S        SELECT                      PS135530
                          DC      MUP10     PERFORM SELECT FUNCTION     PS135540
                          MDX     FL005     CONTINUE FLUSH              PS135550
                    *                                                   PS135560
                    FEXIT SLA     16        CLEAR FLUSH SWITCH          PS135570
                          STO   3 FLSW      *                           PS135580
                          STO   3 LPSW      RESET LIB WRITEBACK SWITCH  PS135590
                          BSC  L  MUP11     GO TO PROCESS RECORD        PS135600
                          HDNG    SLAP                                $FPS135610
                    *************************************************** PS135620
                    *************************************************** PS135630
                    SLAP  DC      *-*       ENTRY/EXIT                  PS135640
                          LD   L  PAREA+13  GET CC 21 (PRINT BFR)       PS135650
                          SLA     8         REMOVE LEFT 9 BITS          PS135660
                          SRA     8         *                           PS135670
                          STO  L  SAREA+20  PUT IN CARD BUFFER          PS135680
                          LDX   1 26        INITIALIZE MOVE COUNTER     PS135690
                          LDX  L2 PAREA+14  POINT TO CC 22 (PRINT BFR)  PS135700
                          LDX  L3 SAREA+21  POINT TO CC 22              PS135710
                    SLAP1 BSI     MVA30     UNPACK AND STORE TEXT       PS135720
                          MDX   2 1         BUMP 'FROM' POINTER         PS135730
                          MDX   3 2         BUMP 'TO' POINTER           PS135740
                          MDX   1 -1        DECREMENT MOVE COUNTER      PS135750
                          MDX     SLAP1     COMPLETE MOVE               PS135760
                          LDX  I3 SAREA-1   GET WORD COUNT              PS135770
                    SLAP2 LD   L3 SAREA-1   GET A COLUMN                PS135780
                          BSC  L  SLAP4,+-  BRANCH IF COLUMN = ZERO     PS135790
                    SLAP3 MDX   3 -1        DECREMENT LOOP COUNTER      PS135800
                          MDX     SLAP2     LOOP UNTIL CHECK IS DONE    PS135810
                    *                                                   PS135820
                    *************************************************** PS135830
                    *             MOVE ID AND SEQUENCE NUMBER TO BFR    PS135840
                    *************************************************** PS135850
                    *                                                   PS135860
                          LDX  L2 SNAMX     POINT XR2 TO MACRO NAME     PS135870
                          LDX  L3 SAREA+72  POINT XR3 TO COL 73         PS135880
                          BSI     MVA30     UNPACK AND STORE            PS135890
                          MDX   2 1         POINT TO 2ND WORD OF NAME   PS135900
                          MDX   3 2         POINT TO COL 75             PS135910
                          BSI     MVA30     UNPACK AND STORE            PS135920
                          LDX  L2 PAREA+10  POINT TO SEQ NUMBER         PS135930
                          MDX   3 1         POIN TO COL 76              PS135940
                          BSI     MVA30     UNPACK AND STORE            PS135950
                          MDX   2 1         POINT TO 2ND WORD OF NO.    PS135960
                          MDX   3 2         POINT TO COL 77             PS135970
                          BSI     MVA30     UNPACK AND STORE            PS135980
                          LD   L  PAREA+12  GET LAST DIGIT OF NUMBER    PS135990
                          SRA     8         RIGHT JUSTIFY               PS136000
                          STO  L  SAREA+79  PUT IN PUNCH BUFFER         PS136010
                          LDX  L3 D         POINT TO CONSTANT AREA      PS136020
                    *                                                   PS136030
                          LDX  L1 SAREA-1   POINT TO CARD BUFFER        PS136040
                          LD    1 33        GET CC 33                   PS136050
                          EOR   3 BLAN      TEST FOR A BLANK            PS136060
                          BSC  L  SLAP5,Z   NORMAL EXIT IF NOT BLANK    PS136070
                          LD    1 34        GET CC 34                   PS136080
                          EOR   3 ASTK      TEST FOR AN ASTERISK        PS136090
                          BSC  L  SLAP5,Z   NORMAL EXIT IF NOT *        PS136100
                          LD    1 35        GET CC 35                   PS136110
                          EOR   3 ASTK      TEST FOR AN ASTERISK        PS136120
                          BSC  L  SLAP5,Z   NORMAL EXIT IF NOT *        PS136130
                    *************************************************** PS136140
                    *                                                 * PS136150
                    *             IF EXIT TO SLAP5 WAS NOT TAKEN, THEN* PS136160
                    *             ALL CARDS HAVE BEEN PUNCHED. BRANCH * PS136170
                    *             BACK TO OUTPUT CODE.                * PS136180
                    *************************************************** PS136190
                          BSC  L  OUT25     END OF OUTPUT               PS136200
                    *                                                   PS136210
                    SLAP5 BSC  I  SLAP      EXIT                        PS136220
                    SLAP4 LD   L  BLANX     GET EBCDIC BLANK            PS136230
                          STO  L3 SAREA-1   CHANGE /0000 TO /0040       PS136240
                          MDX     SLAP3     CONTINUE /0000 CHECK        PS136250
                    *                                                   PS136260
                          HDNG    ENDUP                                 PS136270
                          SPAC                                          PS136280
                    *************************************************** PS136290
                    *             ENDUP TERMINATES THE MUP RUN.  IT   * PS136300
                    *             WRITES BACK THE CURRENT LIBRARY IF  * PS136310
                    *             THERE IS ONE USING UPDAT,THEN PRINTS* PS136320
                    *             THE SIGN-OFF MESSAGE AND RETURNS TO * PS136330
                    *             DUP CONTROL.                        * PS136340
                    *************************************************** PS136350
                    ENDUP EQU     *                                     PS136360
                          LD    3 LNAM      TEST IF CURRENT LIBRARY     PS136370
                          BSC  L  END5,+-   BRANCH IF NONE              PS136380
                          LD    3 PSW       TEST FOR SELECT P           PS136390
                          BSC  L  END02,+-  NO, SKIP NAME TEST          PS136400
                          LD    3 NMSW      SELECT P, TEST FOR NAME     PS136410
                          BSC     +-        SKIP IF NAME OK             PS136420
                          STO   3 PSW       NO NAME, RESET SELECT P     PS136430
                    END02 LD    3 X00FF     SET LIBRARY WRITE BACK      PS136440
                          STO   3 LPSW      *SWITCH                     PS136450
                          STO   3 LNRS      SET LIBRARY NAME RESET SW   PS136460
                          BSI  L  UPDAT     WRITE BACK CURRENT LIBRARY  PS136470
                          NOP               ALLOW FOR UPDAT RETURN      PS136480
                    END5  MDX  L  $CTSW,0   TEST FOR MONITOR CONTROL    PS136490
                          MDX     END07     *RECORD READ - BR IF SO     PS136500
                    *                                                   PS136510
                          MDX  L  DUPCR+C,0 TEST FOR DUP CONTROL RECORD PS136520
                          MDX     END09     BRANCH IF SO                PS136530
                    *************************************************** PS136540
                    *             NORMAL EXIT                         * PS136550
                    *************************************************** PS136560
                    END06 STX  L  P21X      FORCE PRINTING IN POS 21    PS136570
                          BSI   3 EPRT      PRINT END OF MUP RUN        PS136580
                          DC      EM6       *MESSAGE                    PS136590
                          BSI  I  REST      EXIT TO DUP CONTROL         PS136600
                    *************************************************** PS136610
                    *             EXIT IF MONITOR CONTROL RECORD READ * PS136620
                    *************************************************** PS136630
                    END07 BSI   3 EPRT      PRINT CONTROL RECORD READ   PS136640
                          DC      EM8       *MESSAGE                    PS136650
                          STX  L  P21X      FORCE PRINTING IN POS 21    PS136660
                          BSI   3 EPRT      PRINT END OF MUP RUN        PS136670
                          DC      EM6       *MESSAGE                    PS136680
                          BSI  I  LEAVE     RETURN TO SUPERVISOR        PS136690
                          DC      0         INDICATE CONTROL RECORD     PS136700
                    *                       *READ                       PS136710
                    *************************************************** PS136720
                    *             EXIT IF DUP CONTROL RECORD READ     * PS136730
                    *************************************************** PS136740
                    END09 BSI   3 EPRT      PRINT CONTROL RECORD READ   PS136750
                          DC      EM8       *MESSAGE                    PS136760
                          MDX     END06     RETURN TO DUP CONTROL       PS136770
                          HDNG    PUNCH                                 PS136780
                    *************************************************** PS136790
                    *             PUNCH USES EBH TO CONVERT THE 80-   * PS136800
                    *             CHARACTER UNPACKED RECORD IN SAREA  * PS136810
                    *             TO HOLLERITH CODE IN THE BUFFER     * PS136820
                    *             ADDRESSED BY NEXT.                  * PS136830
                    *************************************************** PS136840
                    PUNCH DC      *-*       ENTRY POINT                 PS136850
                          LDX  I1 NEXT+C    GET BUFFER ADDRESS          PS136860
                          LDX   3 80        INITIALIZE WORD COUNT       PS136870
                    PUN00 LD   L3 SAREA-1   GET A COLUMN                PS136880
                          BSI  L  EBH       EBCDIC TO HOLLERITH SUBR    PS136890
                          STO  L1 80        STORE CONVERTED COLUMN      PS136900
                          MDX   1 -1        DECREMENT OUTPUT ADDRESS    PS136910
                          MDX   3 -1        DECREMENT LOOP COUNTER      PS136920
                          MDX     PUN00     LOOP UNTIL DONE             PS136930
                          LDX  I1 NEXT+C    GET BUFFER ADDRESS          PS136940
                          LD    1 80        GET COLUMN 80               PS136950
                          OR   L  H0008     PLACE PUNCH STOP BIT        PS136960
                          STO   1 80        *                           PS136970
                          LDX  L3 D         RESET CONSTANT AREA POINTER PS136980
                    PUN05 BSI  I  PCHBI     PUNCH A RECORD              PS136990
                          MDX  L  $IBSY,0   WAIT FOR PUNCH COMPLETE     PS137000
                          MDX     *-3       *                           PS137010
                          BSC  I  PUNCH     RETURN                      PS137020
                          HDNG    CVDEC                                 PS137030
                    *************************************************** PS137040
                    *             CVDEC CONVERTS THE ADDRESS IN XR1 TO* PS137050
                    *             A COLUMN NUMBER, PUTS THE COL NO    * PS137060
                    *             INTO THE INVALID SUBFIELD MESSAGE   * PS137070
                    *             AND PRINTS THE MESSAGE.  THE NUMBER * PS137080
                    *             MUST BE LESS THAN 100 DECIMAL.      * PS137090
                    *************************************************** PS137100
                    *                                                   PS137110
                    CVDEC DC      *-*       ENTRY POINT                 PS137120
                          SLA     16        CLEAR 10'S COUNTER          PS137130
                          STO   3 DEC10                                 PS137140
                          STX   1 COTMP     PUT COLUMN ADDRESS          PS137150
                          LD      COTMP     *INTO THE ACCUMULATOR       PS137160
                          S     3 ADCON     SUBTRACT BFR STARTING ADDR  PS137170
                    CVD10 S     3 D0010     SUBTRACT 10                 PS137180
                          BSC  L  CVD20,+Z  BRANCH IF NEG RESULT        PS137190
                          MDX  L  DC10X,+1  INCREMENT 10'S COUNTER      PS137200
                          MDX     CVD10     LOOP                        PS137210
                    CVD20 A     3 D0010     ADD 10 BACK IN              PS137220
                          OR    3 F0        FORM EBCDIC CHARACTER       PS137230
                          SRT     8         PUT IN EXTENSION            PS137240
                          LD    3 DEC10     GET 10'S VALUE              PS137250
                          OR    3 F0        FORM EBCDIC CHARACTER       PS137260
                          SLT     8         PACK CHARACTERS             PS137270
                          STO  L  EM12+14   PUT COL NO IN ERROR MESS    PS137280
                          BSI   3 EPRT      PRINT INVALID SUBFIELD MSG  PS137290
                          DC      EM12      *                           PS137300
                          BSC  I  CVDEC     RETURN                      PS137310
                    COTMP DC      *-*       TEMP STORAGE                PS137320
                          HDNG    EBCDIC TO HOLLERITH SUBROUTINE        PS137330
                    *************************************************** PS137340
                    *             INPUT PARAMETER - EBCDIC CHAR IN ACC* PS137350
                    *             OUTPUT PARAMETER - HOLL. CHAR IN ACC* PS137360
                    *************************************************** PS137370
                    EBH   DC      *-*       ENTRY/EXIT                  PS137380
                          STO     EBH10     SAVE INPUT CHARACTER        PS137390
                          STX   1 EBHXT+1   SAVE XR1                    PS137400
                          STX   2 EBHXT+3   SAVE XR2                    PS137410
                          LDX  L1 EBH50     POINT TO SPECIAL CHAR TBL   PS137420
                          LDX   2 15        NO. OF CHARS TO CHECK       PS137430
                    EBH00 LD      EBH10     INPUT CHARACTER             PS137440
                          EOR   1 0         COMPARE WITH TBL ENTRY      PS137450
                          BSC  L  EBH30,+-  BRANCH IF CHAR FOUND        PS137460
                          MDX   1 2         POINT TO NEXT TBL ENTRY     PS137470
                          MDX   2 -1        DECREMENT LOOP COUNTER      PS137480
                          MDX     EBH00     LOOP UNTIL TBL SCANNED      PS137490
                          LDX  L2 EBHT      POINT TO TABLE              PS137500
                          LD      EBH10     RESTORE INPUT CHARACTER     PS137510
                    EBHA  S     2 0         FIND ZONE GROUP             PS137520
                          STO     EBHB+1    STORE NUMERIC VALUE         PS137530
                          MDX   2 2         BUMP TABLE POINTER          PS137540
                          BSC     +Z        SKIP IF FOUND               PS137550
                          MDX     EBHA      LOOP                        PS137560
                          LD    2 -1        GET VALUE                   PS137570
                          STO     EBHC      STORE IN SAVE AREA          PS137580
                          LD      EBHT+3    =/2000                      PS137590
                    EBHB  LDX  L2 *-*       NUMERIC VALUE               PS137600
                          SRA   2 0         GENERATE NUMERIC PUNCH      PS137610
                          OR      EBHC      COMBINE WITH ZONE PUNCH     PS137620
                    EBHXT LDX  L1 *-*       RESTORE XR1                 PS137630
                          LDX  L2 *-*       RESTORE XR2                 PS137640
                          BSC  I  EBH       EXIT                        PS137650
                    *                                                   PS137660
                    EBH10 DC      *-*       SAVED INPUT CHARACTER       PS137670
                    *                                                   PS137680
                    EBH30 LD    1 1         GET HOLLERITH EQUIVALENT    PS137690
                          MDX     EBHXT     EXIT                        PS137700
                          HDNG    EBCDIC TO HOLLERITH SUBROUTINE        PS137710
                    *************************************************** PS137720
                    *************************************************** PS137730
                    EBH50 DC      ..        EBCDIC PERIOD               PS137740
                          DC      /8420     HOLLERITH PERIOD            PS137750
                          DC      .(        EBCDIC LEFT PAREN           PS137760
                          DC      /8120     HOLLERITH LEFT PAREN        PS137770
                          DC      .         EBCDIC BLANK                PS137780
                          DC      /0000     HOLLERITH BLANK             PS137790
                          DC      .+        EBCDIC PLUS                 PS137800
                          DC      /80A0     HOLLERITH PLUS              PS137810
                          DC      /0050     EBCDIC AMPERSAND            PS137820
                          DC      /8000     HOLLERITH AMPERSAND         PS137830
                          DC      .$        EBCDIC DOLLAR SIGN          PS137840
                          DC      /4420     HOLLERITH DOLLAR SIGN       PS137850
                          DC      .*        EBCDIC ASTERISK             PS137860
                          DC      /4220     HOLLERITH ASTERISK          PS137870
                          DC      .)        EBCDIC RIGHT PAREN          PS137880
                          DC      /4120     HOLLERITH RIGHT PAREN       PS137890
                          DC      .;        EBCDIC SEMICOLON            PS137900
                          DC      /40A0     HOLLERITH SEMICOLON         PS137910
                          DC      .-        EBCDIC MINUS                PS137920
                          DC      /4000     HOLLERITH MINUS             PS137930
                          DC      ./        EBCDIC SLASH                PS137940
                          DC      /3000     HOLLERITH SLASH             PS137950
                          DC      .,        EBCDIC COMMA                PS137960
                          DC      /2420     HOLLERITH COMMA             PS137970
                          DC      .#        EBCDIC POUND                PS137980
                          DC      /0420     HOLLERITH POUND             PS137990
                          DC      /007C     EBCDIC AT SIGN              PS138000
                          DC      /0220     HOLLERITH AT                PS138010
                          DC      .'        EBCDIC QUOTE                PS138020
                          DC      /0120     HOLLERITH QUOTE             PS138030
                    *                                                   PS138040
                    EBHT  DC      .0        0-9 NO ZONE                 PS138050
                          DC      0         HOLLERITH - NO ZONE         PS138060
                          DC      .S-2-.0   S-Z  0 ZONE                 PS138070
                          DC      /2000     HOLLERITH - 0 ZONE          PS138080
                          DC      .J-1-.S+2 J-R 11 ZONE                 PS138090
                          DC      /4000     HOLLERITH - 11 ZONE         PS138100
                          DC      .A-.J     A-I 12 ZONE                 PS138110
                          DC      /8000     HOLLERITH - 12 ZONE         PS138120
                          DC      /FF78     AT OR NUMBER SIGN           PS138130
                          DC      /0020     CONSTANT                    PS138140
                    EBHC  DC      *-*       COLUMN SAVE BUFFER          PS138150
                          HDNG    PKNM                                  PS138160
                    *************************************************** PS138170
                    *             PKNM PACKS THE NAME POINTED TO BY RPT PS138180
                    *             INTO A TWO CHARACTER PER WORD FORMAT, PS138190
                    *             AND LEAVES THE RESULT IN SNAM,        PS138200
                    *             SNAM+1 AND SN2 LEFT JUSTIFIED WITH    PS138210
                    *             BLANK FILL TO THE RIGHT               PS138220
                    *************************************************** PS138230
                    PKNM  DC      *-*                                   PS138240
                          BSI  L  MSNSC     TEST FOR VALID MACRO NAME   PS138250
                          LDX  I1 RPTX      POINT TO NAME ARG           PS138260
                          STX   2 PKEX+1    SAVE INDEX 2                PS138270
                          SLT     32                                    PS138280
                          STD   3 SNAM      CLEAR RESLUT AREA           PS138290
                          MDX   1 1         POINT TO NEXT               PS138300
                          LD    3 L5                                    PS138310
                          STO   3 TEMP      SET LOOP COUNT              PS138320
                          LDX  L2 SNAMX                                 PS138330
                    PK2   BSI     PKC       GET NEXT CHAR               PS138340
                          SLA     8         POSITION IT                 PS138350
                          STO   2 0         SAVE IT                     PS138360
                          BSI     PKC       LO ORDER                    PS138370
                          EOR   2 0         PACK WITH HI ORDER          PS138380
                          MDX  L  TEMPX,-1  SKIP IF SIXTH CHARACTER     PS138390
                          STO   2 0         STORE WORD                  PS138400
                          MDX   2 1         POINT TO NEXT WORD          PS138410
                          MDX  L  TEMPX,-1  TEST IF DONE                PS138420
                          MDX     PK2       LOOP FOR NEXT WORD          PS138430
                    PKEX  LDX  L2 *-*       RESTORE INDEX 2             PS138440
                    PK3   MDX   1 1         ONE BEYOND LAST CHAR        PS138450
                          LD    1 -1                                    PS138460
                          EOR   3 X0040                                 PS138470
                          BSC     Z         SKIP IF IT WAS A BLANK      PS138480
                          EOR   3 X002B                                 PS138490
                          STX  L1 RPTX      UPDATE RPT                  PS138500
                          BSC  I  PKNM,+-   EXIT IF BLANK OR COMMA      PS138510
                          MDX     PK3       LOOP TO TEST NEXT           PS138520
                    PKC   DC      *-*                                   PS138530
                          LD    1 0         PICK UP CHAR                PS138540
                          EOR   3 QUOT      TEST FOR QUOTE              PS138550
                          BSC  L  PKC1,+-   BRANCH IF SO                PS138560
                          MDX   1 1         POINT TO NEXT               PS138570
                          EOR   3 X003D     RESTORE CHAR, EXCEPT 1 BIT  PS138580
                    PKC1  EOR   3 BLAN      MAKE BLANK OR RESTORE CHAR  PS138590
                          BSC  I  PKC       EXIT                        PS138600
                    PK4   BSI   3 EPRT      PRINT MACRO NOT FOUND MESS  PS138610
                          DC      EM11      TF                          PS138620
                    PK5   BSC  L  MUP09     GO TO READ CTRL CD          PS138630
                          SPAC                                          PS138640
                          HDNG    MHDR                                  PS138650
                    *************************************************** PS138660
                    *             MHDR SKIPS TO THE NEXT MACRO IGNORING PS138670
                    *             INTERVENING TEXT AND PURGED MACROS.   PS138680
                    *             IT THEN UPDATES THE POINTER TO NEXT   PS138690
                    *             MACRO, FILLS IN THE CHAIN WORD IN THE PS138700
                    *             OUTPUT BUFFER, AND TRANSFERS THE      PS138710
                    *             MACRO HEADER TO THE OUTPUT BUFFER.    PS138720
                    *************************************************** PS138730
                          SPAC                                          PS138740
                    MHDR  DC      *-*                                   PS138750
                    MH1   MDX  L  MPSWX,0                               PS138760
                          MDX     MH11                                  PS138770
                          LD    3 IPT       CALCULATE                   PS138780
                          A     3 L5        *IPT-CBUF+5                 PS138790
                          S     3 CBUF      *                           PS138800
                          STO     MTEMP     *AND SAVE                   PS138810
                          LD    3 LMAC      PICK UP LMAC AND            PS138820
                          S       MTEMP     *SUBTRACT                   PS138830
                          BSC     +         TEST,SKIP IF PLUS           PS138840
                          LD      MTEMP     - OR Z SET ACC TO IPT       PS138850
                          A     3 C1        YES, AND ONE MORE           PS138860
                          SLA     1         MULTIPLY AND                PS138870
                          BSI  L  INSBL     *CALL INSBL TO UPDATE       PS138880
                    MH11  LD    3 NMAC                                  PS138890
                          STO   3 NMCSV                                 PS138900
                          BSC  L  MH2,Z     BRANCH IF IN THIS BUFFER    PS138910
                          BSI  L  NXTBF     GET NEXT BUFFER             PS138920
                          MDX     MH1       TRY AGAIN                   PS138930
                    MH2   A     3 CBUF                                  PS138940
                          A     3 L5                                    PS138950
                          A     3 C1                                    PS138960
                          STO   3 IPT       POINT TO NEW MACRO          PS138970
                          SLA     16                                    PS138980
                          STO   3 ICSW      POINT TO 1ST CHAR OF WORD   PS138990
                          LDX  I1 IPTX                                  PS139000
                          LD    1 -1                                    PS139010
                          AND   3 X01FF     MASK OUT FLAGS              PS139020
                          STO   3 NMAC      SET NEXT MACRO POINTER      PS139030
                          MDX   1 -3                                    PS139040
                          MDX   1 -1                                    PS139050
                          LD    1 0         TEST IF MACRO PURGED        PS139060
                          STO   3 MPSW                                  PS139070
                          BSC  L  MH1,+-    GET NEXT MACRO IF SO        PS139080
                          BSI  L  HOUT      MOVE HEADER TO OUTPUT       PS139090
                          BSC  I  MHDR      RETURN                      PS139100
                    MTEMP DC      *-*                                   PS139110
                          SPAC                                          PS139120
                          HDNG    PHEX                                  PS139130
                    *************************************************** PS139140
                    *             PHEX CONVERTS THE NUMBER IN THE     * PS139150
                    *             ACCUMULATOR TO HEX, AND PRINTS IT.  * PS139160
                    *             INDEX 1 IS NOT SAVED.               * PS139170
                    *************************************************** PS139180
                    PHEX  DC      *-*                                   PS139190
                          RTE     16        POSITION NUMBER             PS139200
                          LDX   1 4         SET COUNT TO FOUR           PS139210
                    PHEX1 SLA     16                                    PS139220
                          SLT     4         MOVE IN NEXT DIGIT          PS139230
                          STD   3 DTMP      SAVE SHIFTED NUMBER         PS139240
                          S     3 C10                                   PS139250
                          BSC     -         SKIP IF DIGIT               PS139260
                          S     3 X0039     ADJUST FOR A THUR F         PS139270
                          A     3 X00FA     BUILD EBCDIC DIGIT          PS139280
                          BSI   3 PRNT      PRINT IT                    PS139290
                          LDD   3 DTMP      PICK UP FOR NEXT            PS139300
                          MDX   1 -1        SKIP IF DONE                PS139310
                          MDX     PHEX1     LOOP IF NOT                 PS139320
                          BSC  I  PHEX      RETURN                      PS139330
                          SPAC                                          PS139340
                          HDNG    PHDR                                  PS139350
                    *************************************************** PS139360
                    *             PHDR PRINTS A MACRO HEADER USING THE* PS139370
                    *             FOLLOWING FORMAT                    * PS139380
                    *                                                 * PS139390
                    *             XXXX YYY AAAA                       * PS139400
                    *                                                 * PS139410
                    *             WHERE XXXX IS THE SECTOR NUMBER IN  * PS139420
                    *             HEX, OBTAINED FROM THE CURRENT OUTPUT PS139430
                    *             BUFFER SH, YYY IS THE MACRO HEADER    PS139440
                    *             DISPLACEMENT IN HEX, OBTAINED THRU    PS139450
                    *             LMAC, AND AAAA IS THE BCD MACRO HDR   PS139460
                    *************************************************** PS139470
                    PHDR  DC      *-*                                   PS139480
                          STX   1 PHSV+1    SAVE INDEX 1                PS139490
                          BSI  L  PTINT     CLEAR PRINT BUFFER      212 PS139495
                          LDX  I1 OUTX                                  PS139500
                          LD    1 1         PICK UP SECTOR ADDRESS      PS139510
                          BSI  L  PHEX      CONVERT TO HEX AND PRINT    PS139520
                          LD    3 X0040     BLANK                       PS139530
                          BSI   3 PRNT      PRINT BLANK                 PS139540
                          LD   I  LMACX     DISPLACEMENT                PS139550
                          BSI  L  PHEX      CONVERT TO HEX AND PRINT    PS139560
                          LDD   3 MNAM                                  PS139570
                          STD     HDPR+1                                PS139580
                          LD    3 MN2                                   PS139590
                          STO     HDPR+3    SET UP NAME FOR PRINTING    PS139600
                          STX  L  P21X      PRINT IN POSITION 21        PS139610
                          BSI   3 EPRT      PRINT IT                    PS139620
                          DC      HDPR                                  PS139630
                    PHSV  LDX  L1 *-*       RESTORE INDEX 1             PS139640
                          BSC  I  PHDR      EXIT                        PS139650
                          ORG     *-1                                   PS139660
                          BSS  E  1                                     PS139670
                    HDPR  DC      /0040     BLANK                       PS139680
                          DC      *-*       FIRST WORD OF NAME          PS139690
                          DC      *-*       SECOND                      PS139700
                          DC      *-*       THIRD PLUS FD               PS139710
                          SPAC                                          PS139720
                          HDNG    HOUT                                  PS139730
                    *************************************************** PS139740
                    *             HOUT MOVES THE HEADER POINTER TO BY * PS139750
                    *             INDEX 1 TO THE OUTPUT BUFFER, AND   * PS139760
                    *             UPDATES THE OUTPUT CHAINS AND OPT.  * PS139770
                    *             IF REQUIRED, IT PRINTS THE MACRO    * PS139780
                    *             HEADER MOVED.                       * PS139790
                    *************************************************** PS139800
                    HOUT  DC      *-*                                   PS139810
                          LDX  I2 OPTX      POINT TO OUTPUT             PS139820
                          LD    1 0                                     PS139830
                          STO   3 MNAM      SAVE                        PS139840
                          STO   2 0                                     PS139850
                          LD    1 1         MACRO                       PS139860
                          STO   3 MNAM+1    NAME                        PS139870
                          STO   2 1                                     PS139880
                          LD    1 2                                     PS139890
                          STO   2 2                                     PS139900
                          OR    3 X00FF                                 PS139910
                          EOR   3 C2                                    PS139920
                          STO   3 MN2       FIFTH CHAR PLUS FD          PS139930
                          LD    3 OPT                                   PS139940
                          S     3 OUT                                   PS139950
                          S     3 C2                                    PS139960
                          OR   I  LMACX     CARRY OVER FLAGS            PS139970
                          STO  I  LMACX     BUILD NEW OUTPUT CHAIN      PS139980
                          LD    1 3         SAVES 1ST WORD PAST HEADER  PS139990
                          STO     HTEMP     *FOR POSSIBLE CONCATENATION PS140000
                          LD    3 MSW       TEST MACRO HDR PRINT SW     PS140010
                          BSI  L  PHDR,Z    PRINT HEADER IF REQUIRED    PS140020
                          SLA     16                                    PS140030
                          STO   3 CRDN      CLEAR INPUT CARD NUMBER     PS140040
                          STO   3 CDNO      CLEAR OUTPUT CARD NUMBER    PS140050
                          STO   3 MHSW      CLEAR HDR MOVE NEEDED SW    PS140060
                          STO   2 3         CLEAR OUTPUT CHAIN WORD     PS140070
                          LD    3 LMAC                                  PS140080
                          STO   3 PGSW      SAVE LAST LMAC              PS140090
                          LD    3 OPT       TF                          PS140100
                          A     3 C3        TF                          PS140110
                          STO   3 LMAC      POINT TO NEW HEADER         PS140120
                          MDX  L  OPTX,+4   UPDATE OUTPUT POINTER       PS140130
                          BSC  I  HOUT      RETURN                      PS140140
                    HSV   DC      *-*                                   PS140150
                          LD    3 OPT                                   PS140160
                          A     3 C3                                    PS140170
                          STO   3 LMAC      POINT TO NEW HEADER         PS140180
                          MDX  L  OPTX,4    UPDATE OUTPUT POINTER       PS140190
                          BSC  I  HSV       EXIT                        PS140200
                    *                                                   PS140210
                    HTEMP DC      *-*       SAVES 1ST WD PAST HEADER    PS140220
                          SPAC                                          PS140230
                          SPAC                                          PS140240
                          HDNG    EPRT                                  PS140250
                    *************************************************** PS140260
                    *             TABLE OF ERROR MESSAGES PROCESSED     PS140270
                    *             BY EPRT                               PS140280
                    *************************************************** PS140290
                    *                                                   PS140300
                    EM1   EQU     *                                     PS140310
                          EBC     .D105   SEQUENCE NUMBER NOT FOUND.    PS140320
                          DC      /FD00                                 PS140330
                    EM2   EQU     *                                     PS140340
                          EBC     .D103   LIBRARY OVERFLO.              PS140350
                          DC      /E6FD                                 PS140360
                    EM3   EQU     *                                     PS140370
                          EBC     .D107   SPILL OVERFLO.                PS140380
                          DC      /E6FD                                 PS140390
                    EM4   EQU     *                                     PS140400
                          EBC     .D106   LIBRARY NOT SPECIFIED.        PS140410
                          DC      /FD00                                 PS140420
                    EM5   EQU     *                                     PS140430
                          EBC     .D102   ILLEGAL REQUEST.              PS140440
                          DC      /FD00                                 PS140450
                    EM6   EQU     *                                     PS140460
                          EBC     .UPDATE COMPLETED.                    PS140470
                          DC      /FD00                                 PS140480
                          EQU     *                                     PS140490
                    EM7   EQU     *                                     PS140500
                          EBC     .D100   LIBRARY NOT FOUND.            PS140510
                          DC      /FD00                                 PS140520
                    EM8   EQU     *                                     PS140530
                          EBC     .D108   CONTROL STATEMENT REA.        PS140540
                          DC      /C4FD                                 PS140550
                    EM9   EQU     *                                     PS140560
                          EBC     .ABOVE MACRO PURGED.                  PS140570
                          DC      /FD00                                 PS140580
                    EM10  EQU     *                                     PS140590
                          EBC     .ABOVE MACRO RENAMED AS.              PS140600
                          DC      /FD00                                 PS140610
                    EM11  EQU     *                                     PS140620
                          EBC     .D104   MACRO NOT FOUND.              PS140630
                          DC      /FD00                                 PS140640
                    EM12  EQU     *                                     PS140650
                          EBC     .D101   INVALID SUBFIELD COL XX   .   PS140660
                          DC      /FD00                                 PS140670
                    EM13  EQU     *                                     PS140680
                          EBC     .D112   NONBLANK CARD FOUND ENTER.    PS140690
                          EBC     . BLANK CARDS.                        PS140700
                          DC      /FD00                                 PS140710
                    EM14  EQU     *                                     PS140720
                          EBC     .D109   NAME STATEMENT NOT FOUN.      PS140730
                          DC      /C4FD                                 PS140740
                    EM15  EQU     *                                     PS140750
                          EBC     .D110   INVALID NAM.                  PS140760
                          DC      /C5FD                                 PS140770
                    EM16  EQU     *                                     PS140780
                          EBC     .D116   LIBRARY NOT INITIALIZED.      PS140790
                          DC      /FD00                                 PS140800
                    EM17  EQU     *                                     PS140810
                          EBC     .D117   INVALID PARAMETER.            PS140820
                          DC      /FD00                                 PS140830
                          SPAC                                          PS140840
                          HDNG    EPRT PROCESSING                       PS140850
                    D     EQU     *+128     CONSTANT AREA REFERENCE     PS140860
                    *************************************************** PS140862
                    *             ERROR MESSAGE PRINT ROUTINE - ALSO  * PS140863
                    *             USED TO PRINT MUP CONTROL RECORDS   * PS140864
                    *             AND MACRO HEADERS.                  * PS140865
                    *************************************************** PS140866
                    EPRT  EQU     *-D                                   PS140870
                    EPRTX DC      *-*       ERROR ROUTINE ENTRY POINT   PS140880
                          LD    3 EPRT                                  PS140890
                          STO     EPRT2+1   SET AREA POINTER INDEX      PS140900
                          A     3 ONE                                   PS140910
                          STO   3 EPRT      SET EXIT                    PS140920
                          STX   1 EPEX+1                                PS140930
                          LD    3 P21       TEST IF PRINTING IN PRINT   PS140940
                          BSC  L  EPRT2,Z   *POSITION 21 WANTED         PS140950
                          LD    3 PLOC      FORCE PRINTING TO START AT  PS140960
                          STO   3 CPP       *1ST PRINT POSITION         PS140970
                    EPRT2 LDX  I1 *-*       AREA INDEX                  PS140980
                          SLA     16        RESET PRINT POSITION 21     PS140990
                          STO   3 P21       *SWITCH                     PS141000
                    EPRT1 LD    1 0                                     PS141010
                          SRA     8                                     PS141020
                          BSI     EPS       PRINT LEFT CHARACTER        PS141030
                          LD    1 0                                     PS141040
                          AND   3 X00FF                                 PS141050
                          BSI     EPS       PRINT RIGHT CHARACTER       PS141060
                          MDX   1 1         POINT TO NEXT WORD          PS141070
                          MDX     EPRT1     LOOP                        PS141080
                    EPS   DC      *-*                                   PS141090
                          BSI   3 PRNT      PRINT CHARACTER             PS141100
                          S     3 X00FD                                 PS141110
                          BSC  I  EPS,+Z    RETURN IF MORE              PS141120
                    EPEX  LDX  L1 *-*       RESTORE INDEX 1             PS141130
                          BSC  I  EPRTX,+                               PS141140
                          BSC  L  PHSV                                  PS141150
                    PRNT  EQU     *-D                                   PS141160
                    PRNTY DC      *-*                                   PS141170
                          BSI  L  PRIN1     CALL PRINT                  PS141180
                          BSC  I  PRNTY     EXIT                        PS141190
                          HDNG    DOUBLE WORD STORAGE                   PS141200
                          BSS  E  0                                     PS141210
                    CLIB  EQU     *-D       NAME OF CONCATENATED        PS141220
                    CLIBX DC      *-*       *LIBRARY IN NAME CODE       PS141230
                          DC      *-*       *                           PS141240
                    DTMG  EQU     *-D       SAVES CONTENTS OF IPT,ICSW  PS141250
                    DTMGX DC      *-*       *DURING PROCESSING OF       PS141260
                          DC      *-*       *MACRO TEXT                 PS141270
                    DTMP  EQU     *-D       SAVES CONTENTS OF OPT, OCSW PS141280
                    DTMPX DC      *-*       *DURING PROCESSING OF       PS141290
                          DC      *-*       *MACRO TEXT                 PS141300
                    GTST  EQU     *-D       POINTER TO PROTOTYPE AREA   PS141310
                    GTSTX DC      PTBUF     *FOR PROCESSING MACRO       PS141320
                          DC      *-*       *SOURCE TEXT                PS141330
                    IPT   EQU     *-D       CORE POINTER TO WORD        PS141340
                    IPTX  DC      *-*       *HOLDING NEXT INPUT CHAR    PS141350
                    ICSW  EQU     *-D       INPUT CHAR BYTE POINTER     PS141360
                    ICSWX DC      *-*       0=LEFT,NONZERO=RIGHT BYTE   PS141370
                    LNAM  EQU     *-D       NAME OF LIBRARY FOUND IN    PS141380
                    LNAMX DC      *-*       *LET/FLET (NAME CODE)       PS141390
                          DC      *-*       *                           PS141400
                    MNAM  EQU     *-D       FIRST 4 CHARACTERS OF       PS141410
                    MNAMX DC      *-*       *CURRENT MACRO NAME         PS141420
                          DC      *-*       *                           PS141430
                    OPCD  EQU     *-D       HOLDS OP CODE OF SOURCE     PS141440
                    OPCDX DC      *-*       RECORD BEING PROCESSED      PS141450
                          DC      *-*       *                           PS141460
                    OPT   EQU     *-D       CORE POINTER TO WORD        PS141470
                    OPTX  DC      KOUT+3    *HOLDING NEXT OUTPUT CHAR   PS141480
                    OCSW  EQU     *-D       OUTPUT CHAR BYTE POINTER    PS141490
                    OCSWX DC      *-*       0=LEFT,NONZERO=RIGHT BYTE   PS141500
                    OPTD  EQU     *-D       POINTER TO PROTOTYPE AREA   PS141510
                    OPTDX DC      PTBUF     *FOR PROCESSING MACRO       PS141520
                          DC      *-*       *SOURCE TEXT                PS141530
                    OUT   EQU     *-D       POINTER TO CURRENT OUTPUT   PS141540
                    OUTX  DC      KOUT      *BUFFER                     PS141550
                    NOUT  EQU     *-D       POINTER TO CURRENT UNUSED   PS141560
                    NOUTX DC      KNOUT     *OUTPUT BUFFER              PS141570
                    SLIB  EQU     *-D       FIRST SECTOR ADDR OF        PS141580
                    SLIBX DC      *-*       *CURRENT LIBRARY            PS141590
                    ELIB  EQU     *-D       LAST SECTOR OF CURRENT      PS141600
                    ELIBX DC      /7FFF     *LIBRARY + 1                PS141610
                    SLS   EQU     *-D       LIB START SAVE              PS141620
                    SLSX  DC      *-*       *                           PS141630
                    ELS   EQU     *-D       LIB END SAVE                PS141640
                    ELSX  DC      *-*       *                           PS141650
                    SNAM  EQU     *-D       NAME OF MACRO BEING SOUGHT  PS141660
                    SNAMX DC      -1        *                           PS141670
                          DC      -1        VALUE-FFF FFF               PS141680
                    SN2   EQU     *-D                                   PS141690
                          DC      *-*       EXTENSION OF SNAM           PS141700
                    MN2   EQU     *-D                                   PS141710
                          DC      *-*       EXTENSION OF MNAM           PS141720
                    SPL1  EQU     *-D       NEXT INPUT SPILL SECTOR     PS141730
                    SPL1X DC      *-*       *(RELATIVE TO START OF WS)  PS141740
                    SPLN  EQU     *-D       NEXT OUTPUT SPILL SECTOR    PS141750
                    SPLNX DC      *-*       *(RELATICE TO START OF WS)  PS141760
                          HDNG    SINGLE WORD STORAGE                   PS141770
                    ADSW  EQU     *-D       ADD SWITCH - SET ON         PS141780
                    ADSWX DC      *-*       *(NON-ZERO) DURING ADD      PS141790
                    AMPS  EQU     *-D       AMPERSAND SWITCH            PS141800
                    AMPSX DC      *-*       *                           PS141810
                    ARG1  EQU     *-D       HOLDS FIRST PARAMETER ON    PS141820
                    ARG1X DC      *-*       *DELETE STATEMENT           PS141830
                    ARG2  EQU     *-D       HOLDS SECOND PARAMETER      PS141840
                    ARG2X DC      *-*       *ON DELETE STATEMENT        PS141850
                    ASSW  EQU     *-D       ASTERISK SWITCH - SET=0 IF  PS141860
                    ASSWX DC      *-*       *COMMENT (* IN COL 21)      PS141870
                    BEND  EQU     *-D       BUFFER END - SET TO LAST    PS141880
                    BENDX DC      *-*       *(ONLY) INPUT BUFFER + 322  PS141890
                    BSW   EQU     *-D       BUILD SWITCH - SET NONZERO  PS141900
                    BSWX  DC      *-*       *DURING BUILD OPERATION     PS141910
                    CBUF  EQU     *-D       POINTER TO CURRENT INPUT    PS141920
                    CBUFX DC      *-*       *BUFFER                     PS141930
                    CCSA  EQU     *-D       CONCATENATE SECTOR ADDRESS  PS141940
                    CCSAX DC      *-*       *                           PS141950
                    CCSW  EQU     *-D       CONCATENATE SWITCH - SET    PS141960
                    CCSWX DC      *-*       *IF CONCATENATE IN EFFECT   PS141970
                    CDNO  EQU     *-D       OUTPUT RECORD NUMBER        PS141980
                    CDNOX DC      *-*       *                           PS141990
                    CHAR  EQU     *-D       HOLDS CURRENT INPUT OR      PS142000
                    CHARX DC      *-*       *OUTPUT CHARACTER           PS142010
                    COM   EQU     *-D       SET - TREAT MACRO TEXT AS   PS142020
                    COMX  DC      *-*       *A COMMENT                  PS142030
                    CPP   EQU     *-D       CURRENT PRINT POSITION      PS142040
                    CPPX  DC      *-*       *                           PS142050
                    CRDN  EQU     *-D       INPUT RECORD NUMBER         PS142060
                    CRDNX DC      *-*       *                           PS142070
                    CSW   EQU     *-D       COMMENTS INCLUSION SWITCH   PS142080
                    CSWX  DC      *-*       SET IF C PARAMETER ON SEL.  PS142090
                    C32   EQU     *-D       CONSTANT POINTER TO COL. 32 PS142100
                    C32X  DC      SAREA+31  *                           PS142110
                    DEC10 EQU     *-D       BAD COLUMN 10'S COUNTER     PS142120
                    DC10X DC      *-*       *                           PS142130
                    DELT  EQU     *-D       DELET SWITCH                PS142140
                    DELTX DC      *-*       *                           PS142150
                    EBCS  EQU     *-D       EBCDIC SWITCH - IF SET,     PS142160
                    EBCSX DC      *-*       *LEAVE SOURCE TEXT IN EBC   PS142170
                    ECD   EQU     *-D       LOGICAL END OF RECORD       PS142180
                    ECDX  DC      *-*       *                           PS142190
                    ENSW  EQU     *-D       END SWITCH - SET IF NO      PS142200
                    ENSWX DC      *-*       *MORE INPUT SECTORS IN LIB  PS142210
                    EPTR  EQU     *-D       HOLDS ADDRESS OF LAST       PS142220
                    EPTRX DC      *-*       *SECTOR USED IN LIBRARY     PS142230
                    ESEC  EQU     *-D       LAST SECTOR USED BY         PS142240
                    ESECX DC      *-*       *CURRENT LIBRARY            PS142250
                    ESPL  EQU     *-D       NUMBER OF SECTORS OF        PS142260
                    ESPLX DC      *-*       *AVAILABLE WORKING STORAGE  PS142270
                    FESW  EQU     *-D       SET BY ADD TO FORCE MOVE    PS142280
                    FESWX DC      *-*       *TO PUT A /FE OUT           PS142290
                    FLSW  EQU     *-D       FLUSH SWITCH                PS142300
                    FLSWX DC      *-*       *                           PS142310
                    IND   EQU     *-D       FIELD POSITION INDICATOR    PS142320
                    INDX  DC      *-*       *                           PS142330
                    INDL  EQU     *-D                                   PS142340
                    INDLX DC      *-*       INSERT/DELETE SWITCH        PS142350
                    INLC  EQU     *-D       CONSTANT - POINTER TO 1ST   PS142360
                    INLCX DC      IN1       *(ONLY) INPUT BUFFER        PS142370
                    INSW  EQU     *-D       INIT SW - SET ON TO FORCE   PS142380
                    INSWX DC      *         *FILLING OF INPUT BUFFER (S PS142390
                    ISW   EQU     *-D                                   PS142400
                    ISWX  DC      *         INSERT PRINT SWITCH         PS142410
                    JSW   EQU     *-D       JOIN SW - SET ON (0)        PS142420
                    JSWX  DC      *         *DURING LIBRARY JOINING     PS142430
                    J1SW  EQU     *-D       JOIN1 SW-SET ON (ZERO)      PS142440
                    J1SWX DC      *         FOR 1ST JOIN FLUSH          PS142450
                    LBAL  EQU     *-D                                   PS142460
                    LBALX DC      *-*       LIBRARY BALANCE COUNT       PS142470
                    LBSW  EQU     *-D       LIB OR BUILD SWITCH         PS142480
                    LBSWX DC      *-*       *                           PS142490
                    LF500 EQU     *-D       WORK WORD                   PS142500
                    LF50X DC      *-*       *                           PS142510
                    LNRS  EQU     *-D       LIB NAME RESET SWITCH       PS142520
                    LNRSX DC      *-*       *                           PS142530
                    LPSW  EQU     *-D       LAST PASS SWITCH - SET ON   PS142540
                    LPSWX DC      *-*       *IF LIB WRITEBACK DESIRED   PS142550
                    LMAC  EQU     *-D       CORE POINTER TO CHAIN WORD  PS142560
                    LMACX DC      KOUT+2    *OF LAST MACRO HEADER       PS142570
                    LPCT  EQU     *-D       INCREMENTED (DECREMENTED)   PS142580
                    LPCTX DC      *-*       *IF LEFT (RIGHT) PAREN.     PS142590
                    LSW   EQU     *-D       LIST ERROR SWITCH           PS142600
                    LSWX  DC      *-*       *                           PS142610
                    MCHA  EQU     *-D       NUMBER OF CHARACTERS IN THE PS142620
                    MCHAX DC      *-*       *CURRENT CHARACTER STRING   PS142630
                    MHSW  EQU     *-D       HEADER MOVE SWITCH - SET    PS142640
                    MHSWX DC      *         *IF MACRO HDR MOVE NEEDED   PS142650
                    MPSW  EQU     *-D                                   PS142660
                    MPSWX DC      *         MACRO PURGE SWITCH          PS142670
                    MSW   EQU     *-D       MACRO HEADER PRINT SWITCH   PS142680
                    MSWX  DC      *         (ON INITIALLY - DEFAULT)    PS142690
                    NAMC  EQU     *-D       NAME ROUTINE WORK WORD      PS142700
                    NAMCX DC      *-*       *                           PS142710
                    NDDF  EQU     *-D       INDICATES NON-DDF ENTRY     PS142720
                    NDDFX DC      *-*       *MATCH FOUND IN LET/FLET    PS142730
                    NIN   EQU     *-D       HOLDS NEXT INPUT SECTOR     PS142740
                    NINX  DC      *-*       *OF LIBRART                 PS142750
                    NMAC  EQU     *-D       DISPLACEMENT FROM SECTOR    PS142760
                    NMACX DC      *-*       *START TO NEXT MACRO HDR    PS142770
                    NMCSV EQU     *-D       SAVE LAST HEADER IN LOC     PS142780
                    NMCSX DC      *-*       *                           PS142790
                    NMSW  EQU     *-D       NAME SWITCH                 PS142800
                    NMSWX DC      *-*       *                           PS142810
                    NSTS  EQU     *-D       MACRO NEST SWITCH           PS142820
                    NSTSX DC      *-*       *                           PS142830
                    OLIB  EQU     *-D       LAST OUTPUT SECTOR OF       PS142840
                    OLIBX DC      *-*       *CURRENT LIBRARY + 1        PS142850
                    OPSW  EQU     *-D       OUTPUT SWITCH - SET ON      PS142860
                    OPSWX DC      *-*       *DURING OUTPUT PROCESSING   PS142870
                    PGSW  EQU     *-D                                   PS142880
                    PGSWX DC      *-*       HEADER PURGE SWITCH         PS142890
                    PLOC  EQU     *-D       PRINT LOCATION              PS142900
                    PLOCX DC      PAREA     *                           PS142910
                    PSW   EQU     *-D                                   PS142920
                    PSWX  DC      *-*       SELECT P INDICATOR          PS142930
                    PSWSV EQU     *-D       SAVES SELECT P SWITCH (PSW) PS142940
                    PSSVX DC      *-*       *DURING LIBRARY FLUSH       PS142950
                    PRTSW EQU     *-D       PRINT HALFWORD POINTER      PS142960
                    PTSWX DC      *-*       0=LEFT,NONZERO=RIGHT BYTE   PS142970
                    P21   EQU     *-D       ERROR MESSAGE PRINT IN      PS142980
                    P21X  DC      *-*       *PRINT POSITION 21 SWITCH   PS142990
                    P9RT  EQU     *-D       CONSTANT - POINTER TO PRINT PS143000
                    P9RTX DC      PAREA+10  *POSITION 21                PS143010
                    RADDR DC      *-*       HOLDS DISK READ ADDRESS     PS143020
                    RPT   EQU     *-D       SET TO ADDRESS OF FIRST     PS143030
                    RPTX  DC      *-*       *CHARACTER OF OPERAND       PS143040
                    SAVE3 DC      *-*       SAVES XR3                   PS143050
                    SBAL  EQU     *-D                                   PS143060
                    SBALX DC      *-*       SECTOR BALANCE COUNT        PS143070
                    SKSW  EQU     *-D       SKIP SW - PREVENTS DATA     PS143080
                    SKSWX DC      *-*       *MOVEMENT TO OUTPUT DSK BFR PS143090
                    SPOV  EQU     *-D       SPILL OVERFLOW SWITCH       PS143100
                    SPOVX DC      *-*       *                           PS143110
                    SPSW  EQU     *-D       SPILL SWITCH - SET IF SPILL PS143120
                    SPSWX DC      *-*       *TO WORKING STORAGE OCCURS  PS143130
                    SSW   EQU     *-D       IF SET PREVENTS MOVE SUBR   PS143140
                    SSWX  DC      *-*       *FROM UPDATING INPUT SEQ NO PS143150
                    TEMP  EQU     *-D       WORK WORD                   PS143160
                    TEMPX DC      *-*       *                           PS143170
                    TEMP3 DC      *-*       WORK WORD                   PS143180
                    TEMP4 DC      *-*       WORK WORD                   PS143190
                    TERM  EQU     *-D       HOLDS TERMINATOR USED TO    PS143200
                    TERMX DC      *-*       *CONTROL MOVE SUBR ACTION   PS143210
                    TV4P  EQU     *-D       CONSTANT - PRINT ROUTINE    PS143220
                    TV4PX DC      PAREA-1   *CALLING SEQUENCE ADDR      PS143230
                    WORKS EQU     *-D       WORK. STOR. STARTING ADDR   PS143240
                          DC      *-*       *WITH LOGICAL DRIVE CODE    PS143250
                    WADDR DC      *-*       SECTOR WRITE ADDRESS        PS143260
                    X     EQU     *-D       NUMBER OF INPUT DISK        PS143270
                    XX    DC      *-*       *BUFFERS (1)                PS143280
                          HDNG    CONSTANT STORAGE                      PS143290
                    *************************************************** PS143300
                    *             THE FOLLOWING CONSTANTS TO D10T MUST  PS143310
                    *              REMAIN IN THIS ORDER AS THEY         PS143320
                    *              COMPRISE A CONVERSION TABLE.         PS143330
                    *************************************************** PS143340
                    L1    EQU     *         START OF CONVERSION TABLE   PS143350
                    X0001 EQU     *-D       CONSTANT 1                  PS143360
                    C1X   DC      1         *                           PS143370
                    C1    EQU     X0001     *                           PS143380
                    ONE   EQU     X0001     *                           PS143390
                    C10   EQU     *-D       CONSTANT 10                 PS143400
                          DC      10        *                           PS143410
                    L10   EQU     C10       *                           PS143420
                          DC      100       CONSTANT 100                PS143430
                          DC      1000      CONSTANT 1000               PS143440
                    D10T  DC      10000     CONSTANT 10000              PS143450
                    ******************  END OF CONVERSION TABLE  ****** PS143454
                    X0002 EQU     *-D                                   PS143460
                          DC      /2                                    PS143470
                    C2    EQU     X0002                                 PS143480
                    X0003 EQU     *-D                                   PS143490
                          DC      /3                                    PS143500
                    L3    EQU     X0003                                 PS143510
                    C3    EQU     X0003                                 PS143520
                    X0004 EQU     *-D                                   PS143530
                          DC      4                                     PS143540
                    C4    EQU     X0004                                 PS143550
                    L5    EQU     *-D                                   PS143560
                    L5X   DC      5                                     PS143570
                    H0008 DC      /0008                                 PS143580
                    D0010 EQU     *-D                                   PS143590
                          DC      10        CONSTANT 10                 PS143600
                    H0F   EQU     *-D                                   PS143610
                    H0FX  DC      /F                                    PS143620
                    D20   EQU     *-D       DECIMAL 20                  PS143630
                          DC      20                                    PS143640
                    D40   EQU     *-D                                   PS143650
                          DC      40                                    PS143660
                    X0029 EQU     *-D                                   PS143670
                          DC      /0029                                 PS143680
                    X002B EQU     *-D                                   PS143690
                          DC      /2B                                   PS143700
                    X2B   EQU     X002B                                 PS143710
                    X0039 EQU     *-D                                   PS143720
                          DC      /39                                   PS143730
                    X003D EQU     *-D                                   PS143740
                          DC      /003D                                 PS143750
                    BLAN  EQU     *-D                                   PS143760
                    BLANX DC      /40       EBCDIC BLANK                PS143770
                    X0040 EQU     BLAN                                  PS143780
                    D0080 EQU     *-D                                   PS143790
                          DC      80                                    PS143800
                    ASTK  EQU     *-D                                   PS143810
                    ASTKX DC      .*                                    PS143820
                    DOT   EQU     *-D       COMMENT DESIGNATION         PS143830
                    DOTX  DC      ..        *                           PS143840
                    SLSH  EQU     *-D                                   PS143850
                    SHSHX DC      ./                                    PS143860
                    QUOT  EQU     *-D                                   PS143870
                    QUOTX DC      /7D                                   PS143880
                    CAMP  EQU     *-D       EBCDIC AMPERSAND            PS143890
                    CAMPX DC      /0050                                 PS143900
                    X0085 EQU     *-D                                   PS143910
                          DC      /85                                   PS143920
                    X00C0 EQU     *-D                                   PS143930
                          DC      /00C0                                 PS143940
                    CA    EQU     *-D       EBCDIC A                    PS143950
                    CAX   DC      .A                                    PS143960
                    DCONT EQU     *-D                                   PS143970
                    CD    EQU     DCONT                                 PS143980
                          DC      .D        EBCDIC D                    PS143990
                    CE    EQU     *-D       EBCDIC E                    PS144000
                    CEX   DC      .E                                    PS144010
                    CI    EQU     *-D       EBCDIC I                    PS144020
                    CIX   DC      .I                                    PS144030
                    MCONT EQU     *-D                                   PS144040
                          DC      .M        EBCDIC M                    PS144050
                    CN    EQU     *-D                                   PS144060
                    CNX   DC      .N                                    PS144070
                    CR    EQU     *-D       EBCDIC R                    PS144080
                    CRX   DC      .R                                    PS144090
                    CU    EQU     *-D       EBCDIC U                    PS144100
                    CUX   DC      .U                                    PS144110
                    HE740 EQU     *-D                                   PS144120
                          DC      /E740     EBCDIC X AND BLANK          PS144130
                    SCONT EQU     *-D                                   PS144140
                          DC      .S        EBCDIC S                    PS144150
                    H00EF EQU     *-D       CONVERSION TABLE ENTRY      PS144160
                    HEFX  DC      /00EF     *REPLACEMENT                PS144170
                    F0    EQU     *-D                                   PS144180
                    F0X   DC      /F0                                   PS144190
                    FA    EQU     *-D                                   PS144200
                    FAX   DC      /FA                                   PS144210
                    X00FA EQU     FA                                    PS144220
                    FB    EQU     *-D                                   PS144230
                    FBX   DC      /FB                                   PS144240
                    FC    EQU     *-D                                   PS144250
                          DC      /FC                                   PS144260
                    FD    EQU     *-D                                   PS144270
                    FDX   DC      /FD                                   PS144280
                    X00FD EQU     FD                                    PS144290
                    X00FE EQU     *-D                                   PS144300
                          DC      /00FE                                 PS144310
                    X00FF EQU     *-D                                   PS144320
                    HXFF  DC      /00FF                                 PS144330
                    C314  EQU     *-D                                   PS144340
                          DC      314                                   PS144350
                    C316  EQU     *-D                                   PS144360
                          DC      316                                   PS144370
                    C317  EQU     *-D                                   PS144380
                          DC      317                                   PS144390
                    D320  EQU     *-D                                   PS144400
                    D320X DC      320                                   PS144410
                    C320  EQU     D320                                  PS144420
                    D322  EQU     *-D                                   PS144430
                    D322X DC      322                                   PS144440
                    C322  EQU     D322                                  PS144450
                    X01FF EQU     *-D                                   PS144460
                          DC      /01FF                                 PS144470
                    D640  EQU     *-D                                   PS144480
                    D640X DC      640                                   PS144490
                    D1600 EQU     *-D                                   PS144500
                          DC      1600                                  PS144510
                    UPLIM EQU     *-D                                   PS144520
                          DC      BUF5-/6000  INPUT BFR ALLOCATION LIM  PS144530
                    H4040 EQU     *-D       EBCDIC BLANKS               PS144540
                          DC      /4040     *                           PS144550
                    ADCON EQU     *-D                                   PS144560
                          DC      SAREA-1   INPUT BUFFER - 1            PS144570
                    X1000 EQU     *-D                                   PS144580
                          DC      /1000                                 PS144590
                          BSS  E  0                                     PS144600
                    X1001 EQU     *-D                                   PS144610
                          DC      /1001                                 PS144620
                    X100F EQU     *-D                                   PS144630
                          DC      /100F                                 PS144640
                    X4000 EQU     *-D                                   PS144650
                          DC      /4000                                 PS144660
                    X8000 EQU     *-D                                   PS144670
                          DC      /8000                                 PS144680
                    X8001 EQU     *-D                                   PS144690
                          DC      /8001                                 PS144700
                    X8005 EQU     *-D       G                           PS144710
                          DC      /8005     G                           PS144720
                    XFE00 EQU     *-D                                   PS144730
                          DC      /FE00                                 PS144740
                          HDNG    BUFFERS                               PS144750
                          DC      80                                    PS144760
                    SAREA BSS     80                                    PS144770
                          DC      /FD00                                 PS144780
                    PTBUF EQU     SAREA                                 PS144790
                    *************************************************** PS144800
                    *************************************************** PS144810
                    PTCH  EQU     BUF5-/6000-/03C6 ALLOW 3 DISK BFRS    PS144820
                    PATCH BSS     PTCH-*                                PS144830
                    *************************************************** PS144840
                    *************************************************** PS144850
                          BSS  E  0         ALIGN BFRS ON EVEN BOUNDARY PS144860
                    KOUT  DC      *-*                                   PS144870
                          DC      *-*                                   PS144880
                          DC      *-*                                   PS144890
                          HDNG    EQUATES                               PS144900
                    KNOUT EQU     KOUT+322                              PS144910
                    IN1   EQU     KNOUT+322 FIRST INPUT BUFFER LOCATION PS144920
                          END     MUP                                   PS144930
