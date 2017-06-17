                          HDNG    DUPCO-    RESIDENT COMMA   2 AUG 67   J0100010
                          ABS                                           J0100020
                    $CIBA EQU     /5   ADDR OF CIB ON MASTER CARTRIDGE  J0100030
                    $CH12 EQU     /6   CHANNEL 12 INDR,NON-ZERO=CHAN 12 J0100040
                    $COMN EQU     /7   WORD COUNT OF COMMON             J0100050
                    $CORE EQU     /E   CORE SIZE,/1000=4K,/2000=8K,ETC) J0100060
                    $CTSW EQU     /F   MCR SW,NON-ZERO=// RECD TRAPPED  J0100070
                    $DADR EQU     /10  SCTR ADDR OF PROG TO BE FETCHED  J0100080
                    $DABL EQU     /11  IOCC FOR SCA RESET (ODD ADDR)    J0100090
                    $DREQ EQU     /12  INDR FOR REQUESTED V. DISK I/O   J0100100
                    $IBSY EQU     /13  PRINC I/O BUSY INDR,NON-ZERO=BSY J0100110
                    $HASH EQU     /14  WORK AREA FOR MONITOR PROGRAMS   J0100120
                    $PRET EQU     /28  ADDR PREOPERATIVE ERROR TRAP     J0100130
                    $IREQ EQU     /2C  ADDR OF INT REQUEST SUBROUTINE   J0100140
                    $ULET EQU     /2D  ADDR OF LET, LOGICAL DRIVE 0     J0100150
                    $IOCT EQU     /32  IOCS CTR,0=NO I/O IN PROGRESS    J0100160
                    $LAST EQU     /33  LAST CD INDR,NON-ZERO=LAST CARD  J0100170
                    $NDUP EQU     /34  INHIBIT DUP SW,NON-ZERO=NO DUP   J0100180
                    $NXEQ EQU     /35  INHIBIT EXEC SW,NON-ZERO=NO EXEQ J0100190
                    $PBSY EQU     /36  PRINC PTR BUSY INDR,NON-ZERO=BSY J0100200
                    $PGCT EQU     /37  PAGE NO. FOR PAGE HEADINGS       J0100210
                    $EXIT EQU     /38  ADDR CALL EXIT ENTRY POINT       J0100220
                    $LINK EQU     /39  ADDR CALL LINK ENTRY POINT       J0100230
                    $DUMP EQU     /3F  ADDR OF CALL DUMP, ENTRY POINT   J0100240
                    $DCDE EQU     /77  DRIVE CODE FOR CORE LOAD BLDR    J0100250
                    $PHSE EQU     /78  NO. OF PHASE CURRENTLY IN CORE   J0100260
                    $UFIO EQU     /79  ARM POSITION IN UNFORMATTED AREA J0100270
                    $WSDR EQU     /7A  WORKING STORAGE DRIVE CODE       J0100280
                    $WRD1 EQU     /7B  LOAD ADDR FOR CURR USER CORE LD  J0100290
                    $KCSW EQU     /7C  INHIBIT INPUT/PRINT OVERLAP SW   J0100300
                    $UFDR EQU     /7D  UNFORMATTED I/O DRIVE CODE       J0100310
                    $CPTR EQU     /7E  CHANNEL 12 INDICATOR FOR CP      J0100320
                    $1132 EQU     /7F  CHANNEL 12 INDICATOR FOR 1132    J0100330
                    $1403 EQU     /80  CHANNEL 12 INDICATOR FOR 1403    J0100340
                    $PST1 EQU     /81  ADDR POSTOP ERROR TRAP,LEVEL 1   J0100350
                    $PST2 EQU     /85  ADDR POSTOP ERROR TRAP,LEVEL 2   J0100360
                    $PST3 EQU     /89  ADDR POSTOP ERROR TRAP,LEVEL 3   J0100370
                    $PST4 EQU     /8D  ADDR POSTOP ERROR TRAP,LEVEL 4   J0100380
                    $STOP EQU     /91  ADDR PROGRAM STOP KEY TRAP       J0100390
                    $FPAD EQU     /95  FILE PROTECT ADDR (ADJ),LOG DR 0 J0100400
                    $CYLN EQU     /9A  ARM POSITION FOR LOGICAL DRIVE 0 J0100410
                    $ACDE EQU     /9F  AREA CODE FOR LOGICAL DRIVE 0    J0100420
                    $DCYL EQU     /A4  1ST DEF CYL ADDR, LOGICAL DR 0   J0100430
                    $I200 EQU     /B3  ENTRY POINT TO ILS FOR LEVEL 2   J0100440
                    $I205 EQU     /B8                                   J0100450
                    $IBT2 EQU     $I205+1 ADDR OF IBT FOR LEVEL 2       J0100460
                    $I400 EQU     /C4  ENTRY POINT TO ILS FOR LEVEL 4   J0100470
                    $I405 EQU     /D3                                   J0100480
                    $IBT4 EQU     $I405+1 ADDR OF IBT FOR LEVEL 4       J0100490
                    $I410 EQU     /D5                                   J0100500
                    $DBSY EQU     /EE  DISK BUSY INDR,NON-ZERO=DK BUSY  J0100510
                    $BYSW EQU     /1D1 BYPASS SW,NOP IF FETCHING SOCAL  J0100520
                    DZ000 EQU     /0F2 DISKZ ENTRY POINT                J0100530
                    $ZEND EQU     /1E0 ADDR 1+LAST WORD OF DISKZ        J0100540
                          HDNG          CONCATENATED COMMON AREA(CATCO) J0100550
                    C     EQU     /7FA0     CATCO POINTER SET TO MIDDLE J0100560
                    *************************************************** J0100570
                    *                                                 * J0100580
                    *  INDEX REG 1 IS SET TO .C. WHEN CATCO IS FORMED * J0100590
                    *  FOR USE BY ALL OF DUP FUNCTIONS. ANY DUP ROUT  * J0100600
                    *  USING XR 1 FOR OTHER REASONS MUST RESTORE.     * J0100610
                    *  ALL VALUES IN CATCO HAVE LABELS EQUATED TO THE * J0100620
                    *  VALUE THAT INDICATES THEIR RELATIVE LOCATION   * J0100630
                    *  FROM .C.                                       * J0100640
                    *                                                 * J0100650
                    *************************************************** J0100660
                    *                                                 * J0100670
                    *             CATCO DCOM IMAGE                    * J0100680
                    *   EQUIVALENCES USED TO REFERENCE CATCO WITH XR1 * J0100690
                    *                                                 * J0100700
                    *************************************************** J0100710
                    #NAME EQU     4-/80     NAME OF PROGRAM             J0100720
                    #DBCT EQU     6-/80     DISK BLOCK COUNT OF PROGRAM J0100730
                    #FCNT EQU     7-/80     FILES SW,ZERO = NO FILES    J0100740
                    #SYSC EQU     8-/80     NON-ZERO,SYSTEM CARTRIDGE   J0100750
                    #JBSW EQU     9-/80     JOB SW,NON-ZERO='T' MODE    J0100760
                    #CBSW EQU     10-/80    CLB SW,NON-ZERO=STORECI     J0100770
                    #LCNT EQU     11-/80    NO. OF LOCALS               J0100780
                    #MPSW EQU     12-/80    NON-ZERO, CORE MAP DESIRED  J0100790
                    #MDF1 EQU     13-/80    NO. OF DUP CTRL RCDS        J0100800
                    #MDF2 EQU     14-/80    ADDR OF MODIF BUFFER        J0100810
                    #NCNT EQU     15-/80    NO. OF NOCALS               J0100820
                    #ENTY EQU     16-/80    RELATIVE ENTRY ADDR OF PROG J0100830
                    #RP67 EQU     17-/80    1442-6,7 SW,NZ = 1442-6,7   J0100840
                    *                                                   J0100850
                    *   NEGATIVE VALUE REPRESENTS DEFAULT CONDITION   * J0100860
                    *                                                 * J0100870
                    #TODR EQU     18-/80    DR CODE OF 'TO' DRIVE       J0100880
                    #FRDR EQU     19-/80    DR CODE OF 'FROM' DRIVE     J0100890
                    *                                                 * J0100900
                    #FHOL EQU     20-/80    ADDR OF LARGEST FXA HOLE    J0100910
                    #FSZE EQU     21-/80    BLK CNT LARGEST HOLE IN FXA J0100920
                    #UHOL EQU     22-/80    ADDR OF LARGEST UA HOLE     J0100930
                    #USZE EQU     23-/80    BLK CNT LARGEST HOLE IN UA  J0100940
                    #DCSW EQU     24-/80    NON-ZERO=DUP CALL           J0100950
                    #PIOD EQU     25-/80    PRINC. I/O INDICATOR        J0100960
                    #PPTR EQU     26-/80    PRINC. PRINTER INDICATOR    J0100970
                    #CIAD EQU     27-/80    WD NO. SCTR 0,CIL ADDR      J0100980
                    #ACIN EQU     28-/80    AVAILABLE CARTRIDGE INDR2-8 J0100990
                    #GRPH EQU     29-/80    2250 INDICATOR          2-8 J0101000
                    #GCNT EQU     30-/80    NO. G2250 RECORDS       2-8 J0101010
                    #LOSW EQU     31-/80    LOCAL-CALLS-LOCAL INDR  2-8 J0101020
                    #X3SW EQU     32-/80    SPECIAL ILS SWITCH      2-8 J0101030
                    #ECNT EQU     33-/80    NO. OF EQUAT RCDS       2-8 J0101040
                    #ANDU EQU     35-/80    END OF UA (ADJ) LOG DR 0-4  J0101050
                    #BNDU EQU     40-/80    END OF UA (BASE) LOG DR 0-4 J0101060
                    #FPAD EQU     45-/80    FILE PROTECT ADDR (BASE)    J0101070
                    #PCID EQU     50-/80    CART ID, PHYS DR 0-4        J0101080
                    #CIDN EQU     55-/80    CART ID, LOG DR 0-4         J0101090
                    #CIBA EQU     60-/80    CIB ADDR, LOG DR 0-4        J0101100
                    #SCRA EQU     65-/80    SCRA, LOG DR 0-4            J0101110
                    #FMAT EQU     70-/80    WS FORMAT, LOG DR 0-4       J0101120
                    #FLET EQU     75-/80    FLET ADDR, LOG DR 0-4       J0101130
                    #ULET EQU     80-/80    LET ADDR, LOG DR 0-4        J0101140
                    #WSCT EQU     85-/80    WS BLK CNT, LOG DR 0-4      J0101150
                    #CSHN EQU     90-/80    CUSHION END SCTR ADDR, 0-4  J0101160
                    #DCOM EQU     1         SCTR ADDR OF DCOM           J0101170
                    #HDNG EQU     7         SCTR WITH PAGE HEADING      J0101180
                    @SBFR EQU     /FB0                                * J0101190
                          HDNG    CONCATENATED COMMON AREA (CATCO)      J0101200
                    *************************************************** J0101210
                    *                                                 * J0101220
                    *             CATCO IOAR HDRS FOR DUP PHASES        J0101230
                    *                                                 * J0101240
                    *************************************************** J0101250
                          ORG     -/10                                  J0101260
                    DCHDR BSS     2         DUP CONTROL            PH02 J0101270
                    STHDR BSS     2         STORE                  PH03 J0101280
                    FLHDR BSS     2         FILEQ                  PH04 J0101290
                    DMHDR BSS     2         DUMP                   PH05 J0101300
                    DLHDR BSS     2         DUMPLET                PH06 J0101310
                    DTHDR BSS     2         DELETE                 PH07 J0101320
                    DFHDR BSS     2         DEFINE                 PH08 J0101330
                    DXHDR BSS     2         DUP EXIT               PH09 J0101340
                    UCHDR BSS     2         DUP UPCOR              PH13 J0101350
                    PIHDR BSS     2         PRINCIPAL I/O BLOCK    PH14 J0101360
                    SIHDR BSS     2         PRINC I/O (W/O KB) BLK PH15 J0101370
                    PTHDR BSS     2         PAPER TAPE I/O BLOCK   PH16 J0101380
                    CIHDR BSS     2         CI PHASE READ BY CL BUILDER J0101390
                    MUHDR BSS     2         MACRO UPDATE      PH206 2-8 J0101400
                    D2HDR BSS     2         DUP CONTROL 2     PH205 2-8 J0101410
                          HDNG    DUPCO-    CATCO DUP SWITCHES          J0101420
                    *************************************************** J0101430
                    *                                                   J0101440
                    *             CATCO DUP SWITCHES                  * J0101450
                    *      WORDS USED FOR COMMUNICATION OF DATA         J0101460
                    *   BETWEEN DUP ROUTINES.                           J0101470
                    *                                                 * J0101480
                    *      INITIALIZED TO ZERO BY  .REST. OF DUPCO    * J0101490
                    *                                                   J0101500
                    *************************************************** J0101510
                    CL1   EQU     *                                     J0101520
                    ASMSW BSS     1         NON ZERO IF DEFINE VOID ASM J0101530
                    BITSW BSS     1         NON ZERO TO ALLOW MDUMP-S   J0101540
                    BLKSW BSS     1         NON ZERO IF BYPASSING REC   J0101550
                    CIERR BSS     1         ERROR NO DETECTED BY PH 17  J0101560
                    CISW  BSS     1         NON ZERO IF STORE CI        J0101570
                    CLBSW BSS     1         NON ZERO IF PRECI EXECUTED  J0101580
                    CNTNO BSS     1         RECORD NO BEING PCHD OR RD  J0101590
                    *                                                 * J0101600
                    *   .DATSW. IS FILLED WITH THE CNT FIELD OF THE   * J0101610
                    *   DUP CONTROL RECORD.                           * J0101620
                    *   USED PRIMARILY FOR DATA MOVEMENT, BUT ALSO IS * J0101630
                    *   USED FOR COUNT OF RECORDS TO READ AFTER A     * J0101640
                    *   STORE CI DUP CONTROL RECORD.                  * J0101650
                    *                                                 * J0101660
                    DATSW BSS     1         RECORDS VALUE IN CNT FIELD  J0101670
                    DBADR BSS     1         DB ADDR OF REFERENCED PROG  J0101680
                    DELSW BSS     1         ADDR OF REQ LET ENTRY - 1   J0101690
                    DFNSW BSS     1         NON ZERO IF DEFINE FXA      J0101700
                    DKSAD BSS     1         DK SCTR ADDR W/O DR CODE    J0101710
                    DUMPP BSS  E  2         LAST LIMITS FOR PRNTR DUMP  J0101720
                    FORSW BSS     1         NON ZERO IF DEFINE VOID FOR J0101730
                    FRWS  BSS     1         NON ZERO IF FROM FLD IS WS  J0101740
                    FXSW  BSS     1         NON ZERO IF FIXED AREA REQD J0101750
                    HOLSW BSS     1         NON ZERO IF NO CONV REQD    J0101760
                    IOSW  BSS     1         NON ZERO IF IN/OUT REQD     J0101770
                    *                                                 * J0101780
                    *   DUMPLET SWITCH - ZERO IF NOT DUMPLET/DUMPFLET * J0101790
                    *       PLUS VALUE REQUIRES PRINT OF BOTH LET/FLET* J0101800
                    *       NEG. VALUE REQUIRES PRINT OF FLET ONLY    * J0101810
                    *                                                 * J0101820
                    LETSW BSS     1         NON ZERO,PRINT LET OR FLET* J0101830
                    LSTLF BSS     1         LAST LET/FLET SECT PROCESSD J0101840
                    MODSW BSS     1         NON ZERO IF STORE MOD FUNC  J0101850
                    NAMSW BSS     1         NON ZERO IF NAME IN LET/F   J0101860
                    NEGSW BSS     1         NON ZERO IF SHRINKING FXA   J0101870
                    PGMHL BSS     1         WORD COUNT OF THE PROG HDR  J0101880
                    PRSW  BSS     1         NON ZERO IF PRINTING OUTPUT J0101890
                    PTSW  BSS     1         NON ZERO IF PAPER TAPE REQD J0101900
                    SKWDS BSS     1         WDS TO SEARCH IN L/F SECT   J0101910
                    STCSW BSS     1         NON ZERO IF STORE DATA CI   J0101920
                    STSW  BSS     1         NON ZERO IF STORE TYPE      J0101930
                    TEMP1 BSS  E  1         1ST WD OF BINEB OUTPUT      J0101940
                    TEMP2 BSS     1         2ND WD OF BINEB OUTPUT      J0101950
                    TOWS  BSS     1         NON ZERO IF TO FIELD IS WS  J0101960
                    T3MSW BSS     1         TYPE 3,4 SOCAL LEVEL CELL   J0101970
                    UASW  BSS     1         NON ZERO IF USER AREA REQD  J0101980
                    WSSW  BSS     1         NON ZERO IF WORK STG REQD   J0101990
                    XEQSW BSS     1         NON ZERO IF NOT RET FR GET  J0102000
                    EBCSW BSS     1         NON ZERO IF EBC DATA OP 2E2 J0102010
                    HDNSW BSS     1         NON ZERO IF NAME IN HDR 2-8 J0102020
                    RPGSW BSS     1         NON Z IF DEFINE VOID RPG2-8 J0102030
                    DFLSW BSS     1         NON ZERO IF *DFILE      2-8 J0102040
                          BSS     1         RESERVED FOR ADDITION   2-8 J0102050
                    CL2   EQU     *-1                                   J0102060
                          HDNG    DUPCO-    CATCO DUP SWITCHES          J0102070
                    *************************************************** J0102080
                    *                                                 * J0102090
                    *             CATCO DUP SWITCHES                  * J0102100
                    *  INITIALIZED BY DCTL AND NOT RESET BY .REST.    * J0102110
                    *                                                 * J0102120
                    *************************************************** J0102130
                    IOREQ BSS     1         NON-ZERO,AUX I/O SET REQ    J0102140
                    PH2   BSS     1         NON-ZERO IF DCTL IN CORE    J0102150
                    PH3   BSS     1         NON-ZERO IF STORE IN CORE   J0102160
                    PH4   BSS     1         NON-ZERO IF DUMP IN CORE    J0102170
                    ************************************************2-8 J0102180
                    *                                               2-8 J0102190
                    *             CATCO SWITCH INITIALIZED TO ZERO  2-8 J0102200
                    *   BY CCAT SUBR AND SET BY MACRO UPDATE PROGRAM2-8 J0102210
                    *                                               2-8 J0102220
                    ************************************************2-8 J0102230
                    DUPCR BSS     1         NON ZERO IF DUP CTRL RCD2-8 J0102240
                    *************************************************** J0102250
                    *                                                 * J0102260
                    *             CATCO DUP SWITCHES SET BY CCAT SUBR * J0102270
                    *                                                 * J0102280
                    *************************************************** J0102290
                    ADDR2 BSS     1         KB INTERRUPT ADDRESS        J0102300
                    KBREQ BSS     1         CONTENTS OF LOC 13          J0102310
                    *      THE FOLLOWING SWITCH IS SET TO INDICATE THE  J0102320
                    *       PRINCIPAL INPUT DEVICE                      J0102330
                    *             -  IS PAPER TAPE                      J0102340
                    *             0  IS CARD                            J0102350
                    *             +  IS KEYBOARD                        J0102360
                    INOUT BSS     1         PRINCIPAL INPUT SWITCH      J0102370
                    *                                                   J0102380
                    PTPON BSS     1         NON-ZERO IF PAPER TP ON SYS J0102390
                    *************************************************** J0102400
                    *                                                 * J0102410
                    *             LEVEL 4 INTERRUPT BRANCH TABLE      * J0102420
                    *             ADDRESSES. INITIALIZED BY CCAT,     * J0102430
                    *             AND CARD/PAPER TAPE INTERFACES.     * J0102440
                    *                                                 * J0102450
                    *************************************************** J0102460
                          ORG     /0049                                 J0102470
                    IBT   BSS     9         9 WD INTRPT BRANCH TABLE    J0102480
                    *************************************************** J0102490
                    *                                                 * J0102500
                    *             CATCO I/O ADDRESSES REQUIRED BY DUP * J0102510
                    *                                                 * J0102520
                    *************************************************** J0102530
                    P1442 BSS  E  2         SYS 1442 IOAR HEADER        J0102540
                    PRPAR BSS     2         DEFAULT LIMITS TO PRINT     J0102550
                    PHDUP BSS     1         LAST DUP PHASE IN CORE      J0102560
                    CRBUF BSS     1         81 WD BFR FOR DUP CTRL RCDS J0102570
                    DCADR BSS     1         ADDR FOR DUP CTRL IOAR HDR  J0102580
                    HDBUF BSS     1         ADDR OF PAGE HEADING BFR    J0102590
                    IOBLK BSS     1         ADDR OF DUP I/O PHASE       J0102600
                    SDBUF BSS     1         STORE/DUMP BUFFER           J0102610
                    LETAR BSS     1         ADDR OF LET SEARCH BUFFER   J0102620
                    PEBUF BSS     1         41 WD BFR FOR PACKED EBCDIC J0102630
                    THIS  BSS     1         ADDR OF DOUBLE BFR, BFR 1   J0102640
                    NEXT  BSS     1         ADDR OF DOUBLE BFR, BFR 2   J0102650
                          HDNG              DUP CORE PARAMETERS         J0102660
                    DISKZ EQU     DZ000     DISKZ ENTRY POINT           J0102670
                    B     EQU     $ZEND-2                               J0102680
                    DMPLC EQU     B         IOAR CORE ADDR FOR DMPLT    J0102690
                    EXITC EQU     B         IOAR CORE ADDR FOR DEXIT    J0102700
                    MUPC  EQU     B         IOAR CORE ADDR FOR MUP  2-8 J0102710
                    DCTL  EQU     B+/1002   ENTRY ADDRESS OF DCTL       J0102720
                    DCTLC EQU     B+/1000   IOAR CORE ADDR FOR DCTL     J0102730
                    WSDC  EQU     B+/2000   IOAR CORE ADDR FOR STORE    J0102740
                    DUMPC EQU     B+/4000   IOAR CORE ADDR FOR DDUMP    J0102750
                    DUPCO EQU     /7DB0     ADDR OF RESIDENT DUPCO      J0102760
                    CATCO EQU     /7F20-2   ADDR OF DCOM IOAR HEADER    J0102770
                    *                                                 * J0102780
                    *  DUPCO ENTRY POINTS...USED WITH INDIRECT BSI    * J0102790
                    *                                                 * J0102800
                          ORG     DUPCO                                 J0102810
                    BINEB BSS     1         CONVERSION BINARY TO EBCDIC J0102820
                    WRTDC BSS     1         WRITE DCOM(S) SUBROUTINE    J0102830
                    ENTER BSS     1         SAVE XR-S AND CONDITIONS    J0102840
                    GET   BSS     1         READ FROM DISK USING DISKZ  J0102850
                    LEAVE BSS     1         HANDLES ALL EXITS FROM DUP  J0102860
                    LINE  BSS     1         SPACES PRINTER 1 LINE       J0102870
                    MASK  BSS     1         INHIBITS KB INT REQUEST     J0102880
                    MDUMP BSS     1         PRINTS SELECTED CORE LOC-S  J0102890
                    PAGE  BSS     1         SKIPS TO NEXT PAGE          J0102900
                    PHID  BSS     1         RECORDS PHASE ID            J0102910
                    PHIDM BSS     1         RECORDS PHASE AND MODIFIER  J0102920
                    PRINT BSS     1         USE SYS PR SUBR TO PRINT    J0102930
                    PUT   BSS     1         WRITES TO DISK USING DISKZ  J0102940
                    REST  BSS     1         RESTORE CATCO,GO TO DCTL    J0102950
                    RTURN BSS     1         RESTORE XR-S AND CONDITIONS J0102960
                    *                                                 * J0102970
                    *  INPUT/OUTPUT PARAMETERS , CORE ADDRESSES       * J0102980
                    *                                                 * J0102990
                    BUF6  EQU     DUPCO-/1F ADDR OF PAGE HEADING BUFFER J0103000
                    PRPNT EQU     BUF6-/141  IOAR ADDR FOR PRINC.PTR    J0103010
                    IOADR EQU     BUF6-/38B  START OF I/O INTERFACE     J0103020
                    GETHO EQU     IOADR+4   ENTRY FOR READING HOLL TYPE J0103030
                    GETBI EQU     IOADR+5   ENTRY FOR READING BINARY    J0103040
                    PACKB EQU     IOADR+6   ENTRY TO PACK BINARY        J0103050
                    PCHBI EQU     IOADR+7   ENTRY TO PUNCH BINARY       J0103060
                    BUF1  EQU     IOADR-/51 ADDR OF NEXT BUFFER         J0103070
                    BUF2  EQU     BUF1-/52  ADDR OF THIS BUFFER         J0103080
                    BUF3  EQU     BUF2-/3E  ADDR OF PACKED EBC BUFFER   J0103090
                    BUF4  EQU     BUF3-/52  ADDR OF CONTROL RCD BUFFER  J0103100
                    BUF5  EQU     IOADR-/284    ADDR OF LET SCTR BFR    J0103110
                    BUF7  EQU     BUF5-/7142   ADDR OF STORE/DUMP BFR   J0103120
                          HDNG    DUP COMMON PROLOGUE 1200-20APR67      J0103130
                    *************************************************** J0103140
                    *                                                 * J0103150
                    *STATUS - VERSION -, MODIFICATION 8               * J0103160
                    *                                                 * J0103170
                    *FUNCTION/OPERATION- THIS MODULE RESIDES IN CORE  * J0103180
                    *   WHILE DUP IS IN CONTROL (EXCEPTION-STORE CI). * J0103190
                    *   DUPCO CONSISTS OF RELATIVELY SMALL ROUTINES   * J0103200
                    *   COMMON TO MANY DUP FUNCTIONS.                 * J0103210
                    *   ALL DISK OPERATIONS ARE COORDINATED EXCEPT IN * J0103220
                    *   THOSE SYSTEM LIBRARY FUNCTIONS USED BY DUP.   * J0103230
                    *   WHEN THE CORE LOAD BUILDER IS CALLED TO       * J0103240
                    *   CONVERT THE DSF PROGRAM TO CI,THE ENTIRE DUP  * J0103250
                    *   COMMON AREA IS SAVED ON DISK AND RESTORED BY  * J0103260
                    *   THE CORE LOAD BUILDER BEFORE RETURNING TO DUP * J0103270
                    *   ANY EXIT FROM DUP MUST GO THRU DUPCO.         * J0103280
                    *   MACHINE INDEPENDENT PORTION OF PRINT ROUTINE  * J0103290
                    *   IS INCLUDED.                                  * J0103300
                    *   FACILITY TO CALL DUMMY LINKS INTO CORE IS     * J0103310
                    *   PROVIDED.                                     * J0103320
                    *   ENTRY TO DUP FROM THE SUPERVISOR AND CORE     * J0103330
                    *   LOAD  BUILDER IS PROVIDED.                    * J0103340
                    *   ROUTINES THAT WILL IDENTIFY THE CURRENT DUP   * J0103350
                    *   PHASE AND PREVENT CATASTROPHIC INTERRUPTS     * J0103360
                    *   FROM KEYBOARD REQUEST ARE INCLUDED            * J0103370
                    *                                                 * J0103380
                    *ENTRY POINTS-                                    * J0103390
                    *        DUP01 -       - ENTRY FROM SUPERVISOR    * J0103400
                    *   AFTER DUPCO HAS BEEN READ INTO CORE FROM DISK.* J0103410
                    *   LINKAGE IS  BSC  L  DUP01   EXIT TO REST,DUPCO  J0103420
                    *                                                 * J0103430
                    *        DUP02 - WRTDC - ENTRY FROM DUP FUNCTIONS * J0103440
                    *   WHEN UPDATING DCOM OF LOGICAL DRIVE ZERO      * J0103450
                    *   AS WELL AS ANY SATELLITE CARTRIDGE EFFECTED.  * J0103460
                    *   LINKAGE IS  LDC  L3 CATCO                     * J0103470
                    *               BSI  I  WRTDC                     * J0103480
                    *               DC      /X000 X IS DRIVE CODE     * J0103490
                    *   XR2 IS NOT SAVED IN THIS SUBROUTINE           * J0103500
                    *                                                 * J0103510
                    *        DUP04 - PHIDM- ENTRY TO MODIFY PHASE ID  * J0103520
                    *   USED TO IDENTIFY MODULES OR SUBMODULES OF DUP * J0103530
                    *   FUNCTIONS.                                    * J0103540
                    *   ESPECIALLY USED FOR SEVERAL DUPCO ENTRIES AS  * J0103550
                    *   WELL AS PROGRESS CHECKING DURING DEBUGING.    * J0103560
                    *   LINKAGE IS  BSI  I  PHIDM                     * J0103570
                    *               DC      /0D00 D IS HEX DIGIT TO   * J0103580
                    *         *         IDENTIFY SUB MODULE.          * J0103590
                    *   THE ADDRESS OF THE SUB MODULE IDENTIFIER IS   * J0103600
                    *   RECORDED IN DUP04 AND LATER PUT INTO DUP05.   * J0103610
                    *                                                 * J0103620
                    *        DUP05 - PHID  - ENTRY TO RECORD THE      * J0103630
                    *   PHASE ID FOR ALL DUP ROUTINES.                * J0103640
                    *   LINKAGE IS  BSI  I  PHID  RECORD ID OF PHASE  * J0103650
                    *               DC      XXYY  YY IS PHASE NO.     * J0103660
                    *         *                   XX IS DUP MODIFIER  * J0103670
                    *   THE ADDRESS OF PHASE NUMBER AND THE INTERNAL  * J0103680
                    *   DUP MODIFIER IS RECORDED IN DUP05.            * J0103690
                    *                                                 * J0103700
                    *        DUP06 - MASK  - ENTRY TO MASK KEYBOARD   * J0103710
                    *   REQUEST FOR CRITICAL DUP FUNCTIONS.           * J0103720
                    *   LINKAGE IS  BSI  I  MASK  MASK KB REQUEST     * J0103730
                    *   THE ADDRESS OF THE NEXT DUP FUNCTION WORD IS  * J0103740
                    *   RECORDED IN THE ENTRY POINT                   * J0103750
                    *                                                 * J0103760
                    *        DUP08 - LEAVE - ENTRY USED TO EXIT FROM  * J0103770
                    *   DUP TO OTHER PARTS OF THE MONITOR SYSTEM.     * J0103780
                    *   LINKAGE IS  BSI  I  LEAVE EXIT FROM DUP       * J0103790
                    *               DC      ZZZZ  WHERE IF ZZZZ IS    * J0103800
                    *   THE ADDRESS OF THE CONTROL PARAMETER IS       * J0103810
                    *   RECORDED IN DUP08.                            * J0103820
                    *                                                 * J0103830
                    *   *    DUP09 - MDUMP - ENTRY TO DUMP SELECTED   * J0103840
                    *   PORTIONS OF CORE MEMORY TO PRINCIPLE PRINT    * J0103850
                    *   DEVICE. THE LINKAGE IS  BSI  I  MDUMP         * J0103860
                    *   THE RETURN ADDRESS IS RECORDED IN THE ENTRY PT* J0103870
                    *   DDMPP OF CATCO CONTAINS THE 2 LIMIT ADDRESSES * J0103880
                    *                                                 * J0103890
                    *        DUP10 - BINEB - ENTRY TO CONVERT 1 BINARY* J0103900
                    *   WORD TO 2 EBCDIC WORDS                        * J0103910
                    *   LINKAGE IS  LD      WORD  PUT INFO INTO AREG  * J0103920
                    *               BSI  I  BINEB CONVERT TO EBCDIC   * J0103930
                    *   THE ADDRESS OF THE NEXT DUP FUNCTION WORD IS  * J0103940
                    *   RECORDED IN THE ENTRY POINT                   * J0103950
                    *                                                 * J0103960
                    *        DUP11 - PRINT - ENTRY TO PRINT A LINE    * J0103970
                    *   LINKAGE IS  BSI  I  PRINT PRINT 1 LINE        * J0103980
                    *               DC      IOAR  POINT TO WD CNT     * J0103990
                    *   THE ADDRESS OF THE LOC OF THE WORD COUNT THAT * J0104000
                    *   PRECEEDS THE DATA TO BE PRINTED IS RECORDED   * J0104010
                    *   IN DUP11                                      * J0104020
                    *                                                 * J0104030
                    *        DUP12 - PAGE - ENTER TO SKIP TO NEXT PAGE* J0104040
                    *   LINKAGE IS  BSI  I  PAGE  SKIP TO NEW PAGE    * J0104050
                    *   THE ADDRESS OF THE NEXT DUP FUNCTION WORD IS  * J0104060
                    *   RECORDED IN THE ENTRY POINT                   * J0104070
                    *                                                 * J0104080
                    *        DUP13 - LINE - ENTER TO SKIP 1 LINE      * J0104090
                    *   LINKAGE IS  BSI  I  LINE  SKIP 1 LINE         * J0104100
                    *   THE ADDRESS OF THE NEXT DUP FUNCTION WORD IS  * J0104110
                    *   RECORDED IN THE ENTRY POINT                   * J0104120
                    *                                                 * J0104130
                    *        DUP14 - REST - NORMAL ENTRY AFTER DUP    * J0104140
                    *   FUNCTION HAS PRINTED SIGN OFF MESSAGE.        * J0104150
                    *   ENTRY USED BY CORE LOAD                       * J0104160
                    *   BUILDER TO RETURN TO DUP AFTER CORE LOAD IS   * J0104170
                    *   BUILT AT THE REQUEST OF DUP (STORECI)         * J0104180
                    *   LINKAGE IS  BSI  I  REST  RETURN CTL TO DUPCO * J0104190
                    *   THE ADDRESS OF THE NEXT DUP FUNCTION WORD IS  * J0104200
                    *   RECORDED IN THE ENTRY POINT                   * J0104210
                    *                                                 * J0104220
                    *       DUP15 - ENTER - ENTRY TO SAVE A AND Q REGS* J0104230
                    *   INDEX REGISTERS AND STATUS.                   * J0104240
                    *   LINKAGE IS  BSI  I  ENTER                     * J0104250
                    *   THE RETURN ADDRESS IS RECORDED IN DUP15       * J0104260
                    *                                                 * J0104270
                    *       DUP16 - RTURN - ENTRY TO RESTORE THE A AND* J0104280
                    *   Q REGISTERS, INDEX REGISTERS, AND STATUS.     * J0104290
                    *   LINKAGE IS  BSI  I  RTURN                     * J0104300
                    *   THE RETURN ADDRESS IS RECORDED IN DUP16       * J0104310
                    *                                                 * J0104320
                    *        DUP30 - GET  - ENTRY TO READ FROM DISK   * J0104330
                    *   ALL DISK READS DONE IN DUP EXCEPT THOSE FROM  * J0104340
                    *   ROUTINES WITHIN THE SYSTEM LIBRARY.           * J0104350
                    *   LINKAGE IS  LDX  L3 IOAR  SET XR3 TO I/O AREA * J0104360
                    *               LDD     HDR                       * J0104370
                    *               STD   3 0     INSERT IOAR HDR INFO* J0104380
                    *               BSI  I  GET   READ IN SPEC ROUTINE* J0104390
                    *  TO GET AND EXECUTE SET XEQSW TO NON ZERO BEFORE* J0104400
                    *  GOING TO .GET.                                 * J0104410
                    *  LINKAGE TO GET AND EXECUTE IS                  * J0104420
                    *     STX  L  XEQSW+C    SET XEQ SWTCH TO NON-ZERO* J0104430
                    *     LDX   3 IOAR      XR3 SET TO IOAR HEADER    * J0104440
                    *     BSI  I  GET       GET AND EXEC PROG IND     * J0104450
                    *                       BY WD CNT AND SCTR ADDR   * J0104460
                    *                       IN THE IOAR SPECIFIED     * J0104470
                    *   THE ADDRESS OF THE NEXT DUP FUNCTION WORD IS  * J0104480
                    *   RECORDED IN THE ENTRY POINT                   * J0104490
                    *                                                 * J0104500
                    *        DUP34 - PUT  - ENTRY TO WRITE TO DISK    * J0104510
                    *   ALL DISK WRITES DONE IN DUP EXCEPT THOSE FROM * J0104520
                    *   ROUTINES WITHIN THE SYSTEM LIBRARY.           * J0104530
                    *   LINKAGE IS  LDX  L3 IOAR  SET XR3 TO I/O AREA * J0104540
                    *               LDD     HDR                       * J0104550
                    *               STD   3 0     INSERT IOAR HDR INFO* J0104560
                    *               BSI  I  PUT   WRITE SPEC INFO     * J0104570
                    *   THE ADDRESS OF THE NEXT DUP FUNCTION WORD IS  * J0104580
                    *   RECORDED IN THE ENTRY POINT                   * J0104590
                    *                                                 * J0104600
                    *INPUT/OUTPUT                                     * J0104610
                    *   DUP01  INPUT-PRINCIPAL PRINT DEVICE ROUTINE   * J0104620
                    *                PRINCIPAL INPUT DEVICE ROUTINE   * J0104630
                    *                PRINCIPAL I/O CONVERSION ROUTINE * J0104640
                    *                PRINCIPAL I/O INTERFACE ROUTINE  * J0104650
                    *                DCTL  SECTORS FROM DISK          * J0104660
                    *                DCOM  SECTORS FROM DISK          * J0104670
                    *   DUP01  OUTPUT-COMPLETED UPCOR FOR DUP         * J0104680
                    *   DUP02  INPUT-DCOM OF LOGICAL ZERO             * J0104690
                    *          OUTPUT-DCOM OF LOGICAL ZERO, AND DCOM  * J0104700
                    *          OF # TODR IF OTHER THAN ZERO.          * J0104710
                    *   DUP04  INPUT-SUB MODULE IDENTIFICATION        * J0104720
                    *          OUTPUT-PHASE AND SUB MODULE IDENTITIES * J0104730
                    *                OR-ED TOGETHER AND RECORDED IN   * J0104740
                    *                          COMMA (PHASE)          * J0104750
                    *   DUP05  INPUT-PHASE IDENTIFICATION             * J0104760
                    *          OUTPUT-PHASE IDENTIFICATION RECORDED IN* J0104770
                    *          COMMA (PHASE)                          * J0104780
                    *   DUP06  INPUT-ADDRESS OF KTRAP WITHIN ILS04    * J0104790
                    *          OUTPUT-KBREQ                           * J0104800
                    *   DUP08  INPUT-EXIT CODE                        * J0104810
                    *          OUTPUT-EXIT CODE TO XR2                * J0104820
                    *                ADDRESS OF EXIT ROUTINE TO XR3   * J0104830
                    *                XEQ INDICATOR                    * J0104840
                    *   *    DUP09 - 2 WORDS IN CATCO LABELED DUMPP.  * J0104850
                    *   THESE WORDS SPECIFY THE FIRST AND LAST CORE   * J0104860
                    *   LOCATION REQUIRED FOR THE PRINTED DUMP.       * J0104870
                    *   * BIT SWITCHES FROM CONSOLE ARE READ          * J0104880
                    *   *    DUP09 - PRINT OUT OF AREA SPECIFIED BY   * J0104890
                    *   WORDS IN DUMPP OF CATCO                       * J0104900
                    *                                                 * J0104910
                    *   DUP10  INPUT-BINARY DATA (VIA ACC)            * J0104920
                    *          OUTPUT-2 PACKED EBCDIC WORDS TO CATCO  * J0104930
                    *          (TEMP1 + TEMP2)                        * J0104940
                    *   DUP11  INPUT-IOAR HEADER ADDRESS IN XR3       * J0104950
                    *                BFR IN PACKED EBC                * J0104960
                    *          OUTPUT-PRINTED BUFFER                  * J0104970
                    *   DUP12  INPUT-RETURN ADDRESS IN ENTRY POINT    * J0104980
                    *          OUTPUT-A PAGE RESTORE                  * J0104990
                    *   DUP13  INPUT-RETURN ADDRESS IN ENTRY POINT    * J0105000
                    *          OUTPUT-A LINE SKIP                     * J0105010
                    *   DUP14  INPUT-NONE                             * J0105020
                    *          OUTPUT-DUPCO SWITCHES IN CATCO CLEARED * J0105030
                    *   DUP15  NONE                                   * J0105040
                    *   DUP16  NONE                                   * J0105050
                    *   DUP30  INPUT-IOAR HEADER IN XR3               * J0105060
                    *                XEQ INDICATOR  XEQSW IN CATCO    * J0105070
                    *          OUTPUT-SPECIFIED NO OF WORDS FROM DISK * J0105080
                    *   DUP34  INPUT-IOAR HEADER (IN XR3)             * J0105090
                    *          OUTPUT-SPECIFIED WORDS WRITTEN TO DISK * J0105100
                    *                                                 * J0105110
                    *EXTERNAL REFERENCES ROUTINES                     * J0105120
                    *          EXIT (DUP EXIT ROUTINE)                * J0105130
                    *          DISK (SYSTEM DISK ROUTINE)             * J0105140
                    *          SDR (SYSTEM DEVICE ROUTINE)            * J0105150
                    *          DUMP (SYSTEM DUMP TO PRINTER ROUTINE)  * J0105160
                    *          SWITCHES + STORAGE DBUSY (IN COMMA)    * J0105170
                    *                              TEMP1 (IN CATCO)   * J0105180
                    *                              TEMP2 (IN CATCO)   * J0105190
                    *                              NAME1 (IN CATCO)   * J0105200
                    *                              NAME2 (IN CATCO)   * J0105210
                    *                              XEQSW (IN CATCO)   * J0105220
                    *                              CORSW (IN CATCO)   * J0105230
                    *                              KBREQ (IN CATCO)   * J0105240
                    *                              PHASE (IN COMMA)   * J0105250
                    *                                                 * J0105260
                    *                                                 * J0105270
                    *TABLES AND WORK AREAS                            * J0105280
                    *   DUP01  INTFC   SLET ENTRIES FROM SYSTEM LDR   * J0105290
                    *   DUP02  NONE                                   * J0105300
                    *   DUP04  NONE                                   * J0105310
                    *   DUP05  NONE                                   * J0105320
                    *   DUP06  KBSUS   SET TO ZERO                    * J0105330
                    *   DUP08  NONE                                   * J0105340
                    *   DUP09  NONE                                   * J0105350
                    *   DUP10  TOBOR   TEMPORARY STORAGE              * J0105360
                    *   DUP11  NONE                                   * J0105370
                    *   DUP12  NONE                                   * J0105380
                    *   DUP13  NONE                                   * J0105390
                    *   DUP14  NONE                                   * J0105400
                    *                                                 * J0105410
                    *************************************************** J0105420
                    *************************************************** J0105430
                          HDNG    DUPCO-    ENTRY POINTS                J0105440
                          ORG     PRPNT                                 J0105450
                          DC      *-*  WD CNT OF DUPCO (FROM SYS LDR)   J0105460
                          DC      -1   SLET ID OF DUPCO                 J0105470
                    SYSLD DC      INTFC-SYSLD    SYSTEM LDR SUPPLIES    J0105480
                          DC      24        REQUIRED SLET ENTRIES   2-8 J0105490
                    *                                                   J0105500
                          ORG     DUPCO     ALLOW CORE FOR CCAT SUBR    J0105510
                    *************************************************** J0105520
                    *                                                 * J0105530
                    *  DUPCO ENTRY POINTS...USED WITH INDIRECT BSI    * J0105540
                    *                                                 * J0105550
                    *************************************************** J0105560
                          DC      DUP10     (BINEB) ENTRY POINT         J0105570
                          DC      DUP02     (WRTDC) UPDATE DCOM         J0105580
                          DC      DUP15     (ENTER) SAVE SUBR ENT PT    J0105590
                          DC      DUP30     (GET) READ DISK ENTRY POINT J0105600
                          DC      DUP08     (LEAVE) ENTRY POINT         J0105610
                          DC      DUP13     (LINE) LINE SPACE ENT PT    J0105620
                          DC      DUP06     (MASK) MASK KB REQ          J0105630
                          DC      DUP09     (MDUMP) MONITORING DUMP     J0105640
                          DC      DUP12     (PAGE) SKIP TO NEW PAGE     J0105650
                          DC      DUP05     (PHID) SET PHASE IDENT.     J0105660
                          DC      DUP04     (PHIDM) MODIFY PHASE ID     J0105670
                          DC      DUP11     (PRINT) PRINT WITH SPACE    J0105680
                          DC      DUP34     (PUT) WRITE TO DISK         J0105690
                          DC      DUP14     (REST) ENTRY POINT          J0105700
                          DC      DUP16     (RTURN) RESTORE ENTRY POINT J0105710
                          HDNG    DUP COMMON MODULE  (DUPCO)            J0105720
                    START ORG     SYSLD                                 J0105730
                    *************************************************** J0105740
                    *                                                 * J0105750
                    *  ENTER HERE WHEN DUPCO READ IN BY THE SUPERVISOR* J0105760
                    *                                                 * J0105770
                    *        EXECUTE THE CCAT ROUTINE AND GO TO       * J0105780
                    *        REST IN DUPCO                            * J0105790
                    *                                                 * J0105800
                    *************************************************** J0105810
                    *                                                 * J0105820
                    *             BEGIN CCAT                          * J0105830
                    *                                                 * J0105840
                    *     THIS EXTENSION OF DUPCO FORMS THE           * J0105850
                    *     CONCATENATED COMMON AREA OF DUP, READS      * J0105860
                    *     DUP'S PRINCIPAL I/O INTERFACE, PRINCIPAL I/O* J0105870
                    *     ROUTINE, PRINCIPAL I/O CONVERSION INTO      * J0105880
                    *     CORE, READS DUP CONTROL (DCTL) INTO CORE,   * J0105890
                    *     SETS UP IOAR HEADERS FOR STORE,DUMP,DUMPL,  * J0105900
                    *     DLETE,DFINE,EXIT,FILEQ,AND MUP FUNCTIONS. 2-8 J0105910
                    *     IF CORE SIZE = 32K, READ DUMP AND STORE     * J0105920
                    *     FUNCTIONS. IF CORE SIZE = 16K, READ IN      * J0105930
                    *     STORE FUNCTION. USE 1132 MASK WORDS (32-39) * J0105940
                    *     TO READ THE PRINCIPAL PRINT ROUTINE INTO    * J0105950
                    *     CORE AND EXIT TO REST IN DUPCO.             * J0105960
                    *                                                 * J0105970
                    *************************************************** J0105980
                          HDNG    DUPCO--CCAT,INITIALIZE CATCO TO ZEROS J0105990
                    DUP01 BSI  I  PHID      RECORD PHASE ID FOR DUP     J0106000
                          DC      1         PHASE ID                    J0106010
                          LDX   2 -/60      CLEAR CONCATENATED          J0106020
                          SLA     16        COMMON AREA OF DUP          J0106030
                    DU011 STO  L2 C+/60     (CATCO) TO ZEROS.           J0106040
                    *                                                 * J0106050
                          MDX   2 +1                                    J0106060
                          MDX     DU011                                 J0106070
                    *                                                   J0106080
                    *             SET XR1 TO CATCO MID-POINT ADDRESS    J0106090
                    *                                                   J0106100
                          LDX  L1 C                                     J0106110
                    *************************************************** J0106120
                    *                                                 * J0106130
                    *   DETERMINE IF PAPER TAPE ATTACHED              * J0106140
                    *                                                 * J0106150
                    *************************************************** J0106160
                          LDX  L2 PINPT     XR2 IS SLET ENTRIES POINTER J0106170
                          LD    2 I1134+3-S                             J0106180
                          BSC  L  CC030,+Z  BR IF PAPT NOT ATTACHED     J0106190
                    *                                                 * J0106200
                          STX  L0 PTPON+C   SET PAPT ATTACHED SW        J0106210
                          LD    2 PINTF+1-S                             J0106220
                          STO   2 PHS16+1-S PHASE 16 CORE ADDRESS       J0106230
                    *                                                 * J0106240
                          LDD   2 PINTF+2-S SET-UP IOAR HDR TO READ     J0106250
                          STD  I  PINTF+1   *DUP PAPT INTERFACE         J0106260
                          LDX  I3 PINTF+1                               J0106270
                          BSI  I  GET       READ PAPER TAPE INTERFACE   J0106280
                    *                                                 * J0106290
                          LD    2 PHS16+1-S                             J0106300
                          A     2 PINTF+2-S COMPUTE CORE ADDR FOR       J0106310
                          A       CC900     *SYSTEM 1134 ROUTINE        J0106320
                          BSC     E                                     J0106330
                          A       CC901     FORCE IOAR ADDR TO BE EVEN  J0106340
                          STO   2 I1134+1-S SYSTEM 1134 IOAR HDR ADDR   J0106350
                    *                                                 * J0106360
                          A       CC902                                 J0106370
                          STO   3 +2        SYS DEVICE ENT POINT ADDR   J0106380
                          LDD   2 I1134+2-S SET-UP IOAR HDR TO READ     J0106390
                          STD  I  I1134+1   *SYS 1134 ROUTINE           J0106400
                    *                                                 * J0106410
                          LDX  I3 I1134+1                               J0106420
                          BSI  I  GET       READ SYS PAPT ROUTINE       J0106430
                    *************************************************** J0106440
                    *                                                 * J0106450
                    *   COMPUTE TOTAL WORD COUNT FOR PHASE 16         * J0106460
                    *                                                 * J0106470
                    *************************************************** J0106480
                          LD    2 I1134+1-S                             J0106490
                          A     2 I1134+2-S ADDR OF CONVERT IOAR HDR,   J0106500
                          A       CC900     *PLUS WD CNT OF CONVERT,    J0106510
                          S     2 PINTF+1-S *PLUS 2,LESS STARTING ADDR. J0106520
                          STO   2 PHS16+2-S PHASE 16 WORD COUNT         J0106530
                    *                                                 * J0106540
                          LDX  I3 PHS16+1                               J0106550
                          LDD   2 PHS16+2-S SET-UP IOAR HDR TO          J0106560
                          STD   3 0         *WRITE PHASE 16.            J0106570
                          BSI  I  PUT       WRITE PHASE 16 (PAPT I/O)   J0106580
                    *************************************************** J0106590
                    *                                                 * J0106600
                    *   IF PRINCIPAL INPUT (W/O KEYBOARD) IS PAPER    * J0106610
                    *   TAPE, PHASE 15 IS THE SAME AS PHASE 16.       * J0106620
                    *                                                 * J0106630
                    *************************************************** J0106640
                          LD    2 PINPT+3-S                             J0106650
                          EOR   2 I1134+3-S                             J0106660
                          BSC  L  CC030,Z   BR IF PAPT NOT PRINC. I/O   J0106670
                    *                                                 * J0106680
                          LD    2 PHS16+1-S                             J0106690
                          STO   2 PHS15+1-S SET-UP LOAD ADDRESS AND     J0106700
                          STO   2 PHS14+1-S *WD CNT OF PHASES 14 AND 15 J0106710
                          LD    2 PHS16+2-S *EQUAL TO PHASE 16.         J0106720
                          STO   2 PHS15+2-S                             J0106730
                          STO   2 PHS14+2-S                             J0106740
                          LD    2 PHS15+3-S                             J0106750
                          STO   3 +1        SET-UP PHASE 15 IOAR HDR    J0106760
                          BSI  I  PUT       WRITE PHASE 15              J0106770
                          LD      *-1                                   J0106780
                          STO   1 INOUT     I/O SW NEGATIVE FOR PAPT    J0106790
                    *************************************************** J0106800
                    *                                                 * J0106810
                    *   IF KEYBOARD INPUT HAS BEEN SELECTED SET-UP    * J0106820
                    *   PHASE 14 AS KEYBOARD INPUT PHASE. OTHERWISE,  * J0106830
                    *   SET-UP PHASE 14 IOAR HDR, AND WRITE IT TO     * J0106840
                    *   THE DISK.                                     * J0106850
                    *                                                 * J0106860
                    *************************************************** J0106870
                    CC010 LD   L  $KCSW                                 J0106880
                          BSC  L  CC040,Z   BR IF KEYBOARD INPUT        J0106890
                    *                                                 * J0106900
                    CC020 LD    2 PHS14+3-S                             J0106910
                          STO   3 +1        SET-UP PHASE 14 IOAR HDR    J0106920
                          BSI  I  PUT       WRITE PHASE 14              J0106930
                          BSC  L  CC050                                 J0106940
                          HDNG    DUPCO--CCAT CONSTANTS                 J0106950
                    CC900 DC      2         CONSTANT                    J0106960
                    CC901 DC      1         CONSTANT                    J0106970
                    CC902 DC      3         CONSTANT                    J0106980
                    CC903 DC      $PST4                                 J0106990
                    CC904 DC      BUF4      81 WD BFR FOR DUP CTRL RCDS J0107000
                          DC      *-*       ADDR FOR DCTL IOAR HDR      J0107010
                          DC      BUF6      ADDR OF PAGE HEADING BFR    J0107020
                          DC      *-*       ADDR OF DUP I/O PHASE       J0107030
                          DC      BUF7      ADDR OF STORE/DUMP BUFFER   J0107040
                          DC      BUF5      ADDR OF LET SEARCH BUFFER   J0107050
                          DC      BUF3      41 WD BFR FOR PACKED EBCDIC J0107060
                          DC      BUF2      DOUBLE BFR ADDR, 1ST BFR    J0107070
                          DC      BUF1      DOUBLE BFR ADDR, 2ST BFR    J0107080
                    CC905 BES     0                                     J0107090
                    CC906 EQU     CC904-CC905                           J0107100
                          BSS  E  0                                     J0107110
                    CC910 DC      BUF4      LOWER DEFAULT MDUMP LIMIT   J0107120
                          DC      IOADR     UPPER DEFAULT MDUMP LIMIT   J0107130
                    CC912 DC      PRPNT     PRINC. PRINTER IOAR ADDR    J0107140
                    CC913 DC      IBT-1+C   ILS04 BR ADDR BEFORE IDXING J0107150
                          HDNG    DUPCO--CCAT, PAPT NOT ATTACHED        J0107160
                    CC030 LD    2 INTFC+1-S                             J0107170
                          STO   2 PHS15+1-S PHASE 15 CORE ADDRESS       J0107180
                    *                                                 * J0107190
                          LDD   2 INTFC+2-S SET-UP IOAR HDR TO READ     J0107200
                          STD  I  INTFC+1   *DUP CARD INTERFACE.        J0107210
                          LDX  I3 INTFC+1                               J0107220
                          BSI  I  GET       READ CARD INTERFACE         J0107230
                    *                                                 * J0107240
                          LD    2 PHS15+1-S                             J0107250
                          A     2 INTFC+2-S COMPUTE CORE ADDR FOR       J0107260
                          A       CC900     *SYSTEM CARD ROUTINE.       J0107270
                          BSC     E                                     J0107280
                          A       CC901     FORCE IOAR ADDR TO BE EVEN  J0107290
                          STO   2 PINPT+1-S SYSTEM CARD IOAR HDR ADDR   J0107300
                    *                                                 * J0107310
                          A       CC902                                 J0107320
                          STO   3 +2        SYS CARD ENT POINT ADDR     J0107330
                          LDD   2 PINPT+2-S SET-UP IOAR HDR TO READ     J0107340
                          STD  I  PINPT+1   *SYS CARD ROUTINE.          J0107350
                    *                                                 * J0107360
                          LDD   2 I1442+2-S                             J0107370
                          STD   1 P1442     SYS 1442 WD CNT, SCTR ADDR  J0107380
                          A     2 PINPT+1-S COMPUTE CORE ADDR FOR       J0107390
                          A       CC900     *SYS CARD CONVERT ROUTINE.  J0107400
                          BSC     E                                     J0107410
                          A       CC901     FORCE IOAR ADDR TO BE EVEN  J0107420
                          STO   2 PCVRT+1-S SYS CARD CONVERT IOAR ADDR  J0107430
                    *                                                 * J0107440
                          A       CC902                                 J0107450
                          STO   3 +3        SYS CONVERT ENT POINT ADDR  J0107460
                          LDD   2 PCVRT+2-S SET-UP IOAR HDR TO READ     J0107470
                          STD  I  PCVRT+1   *SYS CARD CONVERT ROUTINE.  J0107480
                    *                                                 * J0107490
                          LDX  I3 PINPT+1                               J0107500
                          BSI  I  GET       READ SYS CARD ROUTINE       J0107510
                    *                                                 * J0107520
                          LDX  I3 PCVRT+1                               J0107530
                          BSI  I  GET       READ SYS CARD CONVERT       J0107540
                    *************************************************** J0107550
                    *                                                 * J0107560
                    *   COMPUTE TOTAL WORD COUNT FOR PHASE 15         * J0107570
                    *                                                 * J0107580
                    *************************************************** J0107590
                          LD    2 PCVRT+1-S                             J0107600
                          A     2 PCVRT+2-S ADDR OF CONVERT IOAR HDR,   J0107610
                          A       CC900     *PLUS WD CNT OF CONVERT,    J0107620
                          S     2 INTFC+1-S *PLUS 2,LESS STARTING ADDR  J0107630
                          STO   2 PHS15+2-S PHASE 15 WORD COUNT         J0107640
                    *                                                 * J0107650
                          LDX  I3 PHS15+1                               J0107660
                          LDD   2 PHS15+2-S SET-UP IOAR HDR TO          J0107670
                          STD   3 0         *WRITE PHASE 15 (CARD I/O)  J0107680
                          BSI  I  PUT       WRITE PHASE 15              J0107690
                    *                                                 * J0107700
                          SLA     16                                    J0107710
                          STO   1 INOUT     INOUT IS 0 FOR CARD I/O     J0107720
                    *                                                 * J0107730
                          LD    2 PHS15+1-S                             J0107740
                          STO   2 PHS14+1-S SET-UP LOAD ADDRESS AND     J0107750
                          LD    2 PHS15+2-S *WD CNT OF PHASE 14 EQUAL   J0107760
                          STO   2 PHS14+2-S *TO PHASE 15.               J0107770
                          MDX     CC010                                 J0107780
                          HDNG    DUPCO--CCAT, BUILD KEYBOARD I/O PHASE J0107790
                    CC040 LD    2 KINTF+1-S                             J0107800
                          STO   2 PHS14+1-S PHASE 14 CORE ADDRESS       J0107810
                    *                                                 * J0107820
                          LDD   2 KINTF+2-S SET-UP IOAR HDR TO READ     J0107830
                          STD  I  KINTF+1   *DUP KEYBOARD INTERFACE.    J0107840
                          LDX  I3 KINTF+1                               J0107850
                          BSI  I  GET       READ KEYBOARD INTERFACE     J0107860
                    *                                                 * J0107870
                          LD    2 PHS14+1-S                             J0107880
                          A     2 KINTF+2-S COMPUTE CORE ADDR FOR       J0107890
                          A       CC900     *SYSTEM KEYBOARD ROUTINE.   J0107900
                          BSC     E                                     J0107910
                          A       CC901     FORCE IOAR ADDR TO BE EVEN  J0107920
                          STO   2 IKBRD+1-S SYS KEYBOARD IOAR HDR ADDR  J0107930
                    *                                                 * J0107940
                          A       CC902                                 J0107950
                          STO   3 +2        SYS KEYBOARD ENT POINT ADDR J0107960
                          LDD   2 IKBRD+2-S SET-UP IOAR HDR TO READ     J0107970
                          STD  I  IKBRD+1   *SYS KEYBOARD ROUTINE.      J0107980
                    *                                                 * J0107990
                          LD    2 IKBRD+1-S                             J0108000
                          A     2 IKBRD+2-S COMPUTE CORE ADDR FOR       J0108010
                          A       CC900     *SYS KEYBOARD CONVERT.      J0108020
                          BSC     E                                     J0108030
                          A       CC901     FORCE IOAR ADDR TO BE EVEN  J0108040
                          STO   2 CKBRD+1-S SYS KYBRD CONVERT IOAR ADDR J0108050
                    *                                                 * J0108060
                          A       CC902                                 J0108070
                          STO   3 +3        SYS CONVERT ENT POINT ADDR  J0108080
                          LDD   2 CKBRD+2-S SET-UP IOAR HDR TO READ     J0108090
                          STD  I  CKBRD+1   *SYS KEYBOARD CONVERT.      J0108100
                    *                                                 * J0108110
                          LDX  I3 IKBRD+1                               J0108120
                          BSI  I  GET       READ SYS KEYBOARD ROUTINE   J0108130
                    *                                                 * J0108140
                          LDX  I3 CKBRD+1                               J0108150
                          BSI  I  GET       READ SYS KEYBOARD CONVERT   J0108160
                    *                                                 * J0108170
                          STX  L0 INOUT+C   INOUT PLUS FOR KEYBOARD I/O J0108180
                    *************************************************** J0108190
                    *                                                 * J0108200
                    *   COMPUTE TOTAL WORD COUNT FOR PHASE 14         * J0108210
                    *                                                 * J0108220
                    *************************************************** J0108230
                          LD    2 CKBRD+1-S                             J0108240
                          A     2 CKBRD+2-S ADDR OF CONVERT IOAR HDR,   J0108250
                          A    L  CC900     *PLUS WD CNT OF CONVERT,    J0108260
                          S     2 KINTF+1-S *PLUS 2,LESS STARTING ADDR  J0108270
                          STO   2 PHS14+2-S PHASE 14 WORD COUNT         J0108280
                    *                                                 * J0108290
                          LDX  I3 PHS14+1                               J0108300
                          LD    2 PHS14+2-S SET-UP WORD COUNT TO        J0108310
                          STO   3 0         *WRITE PHASE 14.            J0108320
                          BSC  L  CC020     GO WRITE PHASE 14           J0108330
                          HDNG    DUPCO--CCAT,PHASE IOAR HDRS TO CATCO  J0108340
                    CC050 LDX   3 +12                                   J0108350
                          LDX  L2 PINPT                                 J0108360
                          LD    2 PHS2+1-S  SAVE ADDR OF DCTL IOAR HDR  J0108370
                          STO  L  CC904+1   *IN ADDR TABLE.             J0108380
                          LD    2 PHS14+1-S SAVE ADDR OF PRINC. INPUT   J0108390
                          STO  L  CC904+3   *PHASE IN ADDR TABLE        J0108400
                    *                                                 * J0108410
                    CC090 LDD   2 PHS2+2-S  MOVE IOAR HDR'S FOR DUP     J0108420
                          STD   1 DCHDR     *PHASES 2-9,13,14,15, AND   J0108430
                          MDX   1 +2        *16 TO CATCO                J0108440
                          MDX   2 +4                                    J0108450
                          MDX   3 -1                                    J0108460
                          MDX     CC090     CONT UNTIL ALL HDR'S MOVED  J0108470
                          LDD   2 PHS2+2-S  MOVE PHASE 205          2-8 J0108480
                          STD   1 DCHDR+4   *HEADER TO CATCO        2-8 J0108490
                          LDD   2 PHS2+6-S  MOVE PHASE 206 IOAR     2-8 J0108500
                          STD   1 DCHDR+2   *HEADER TO CATCO        2-8 J0108510
                          HDNG    DUPCO--CCAT,INITLZ CATCO I/O ADDR'S   J0108520
                          LDX  L2 CC904                                 J0108530
                          LDX   3 CC906                                 J0108540
                    *                                                 * J0108550
                    CC080 LD    2 0         MOVE TABLE OF ADDRESSES     J0108560
                          STO  L3 C+/60     *FROM CCAT CONSTANTS TO     J0108570
                          MDX   2 +1        *CATCO AREA RESERVED FOR    J0108580
                          MDX   3 +1        *DUP I/O ADDRESSES          J0108590
                          MDX     CC080                                 J0108600
                          HDNG    DUPCO--CCAT,FINAL INITIALIZATION      J0108610
                          LDX  L1 C         XR1 IS CATCO MIDPOINT       J0108620
                          LDD  L  CC910                                 J0108630
                          STD   1 PRPAR     DEFAULT LIMITS FOR MDUMP    J0108640
                    *                                                 * J0108650
                          MDX  L  CC912,6                               J0108660
                          LD   L  CC912     INITLZ CORE WORD 9 AND      J0108670
                          STO   1 IBT+4     *1403 ENTRY IN BRANCH TBL   J0108680
                          STO  L  9         *FOR PRINT IOAR + 6.        J0108690
                    *                                                 * J0108700
                          LD   L  CC913     INITLZ ILS04 BR ADDR TO     J0108710
                          STO  L  $IBT4     *POINT TO DUP I/O BR TABLE  J0108720
                    *                                                 * J0108730
                          LD   L  CC903                                 J0108740
                          STO   1 IBT-1     INITIALIZE ALL UNASSIGNED   J0108750
                          STO   1 IBT       *ENTRIES IN DUP'S IBT FOR   J0108760
                          STO   1 IBT+1     *LEVEL 4 TO TRAP ALL        J0108770
                          STO   1 IBT+2     *SPURIOUS LEVEL 4 INTRPTS   J0108780
                          STO   1 IBT+3     *TO $PST4.                  J0108790
                    *                                                 * J0108800
                          LDX  L2 KBSUS                                 J0108810
                          STX  L2 ADDR2+C   RECORD KB INTERRUPT ADDR    J0108820
                    *                                                 * J0108830
                          LD   L  $IREQ                                 J0108840
                          STO   1 KBREQ     SYSTEM KB INTERRUPT ADDR    J0108850
                    *                                                 * J0108860
                          LDD   1 PIHDR     SET-UP IOAR HDR TO READ IN  J0108870
                          STD  I  IOBLK+C   *PRINC. I/O (PHASE 14).     J0108880
                          SLA     16        INITIALIZE DUP CONTROL  2-8 J0108890
                          STO   1 DUPCR     *RECORD SWITCH TO ZERO  2-8 J0108900
                          HDNG    DUPCO--CCAT,FINAL FETCHES TO INIT DUP J0108910
                    *************************************************** J0108920
                    *                                                 * J0108930
                    *   FETCH DCOM, THEN USE HDNG AREA TO FETCH       * J0108940
                    *   FETCH PRINC PRINT SUBROUTINE AND TO           * J0108950
                    *   FETCH THE HEADING LINE                        * J0108960
                    *                                                 * J0108970
                    *************************************************** J0108980
                          LDD  L  PRDVC+2   SET-UP IOAR HDR TO          J0108990
                          STD  L  PRPNT     *READ PRINC. PRINT ROUTINE  J0109000
                    *                                                 * J0109010
                          LDX  L3 C-/82     READ DCOM WORDS 1-/70 INTO  J0109020
                          BSI  I  GET       *CATCO WORDS -/80 THRU -/11 J0109030
                    *                                                 * J0109040
                          LDX  L3 PRPNT     POINT TO PRINT SUBR BUFFER  J0109050
                          MDX     CC200     SKIP PATCH AREA             J0109060
                    *                                                 * J0109070
                    CC150 BSS     BUF6-*-1  BASIC PATCH ROOM FOR CCAT   J0109080
                    *                                                 * J0109090
                          BSS  E  0         ADJUST TO EVEN BOUNDARY     J0109100
                          DC      CC300-*+1 LENGTH OF HEADING TO READ   J0109110
                          DC      #HDNG     SAD OF HEADING BUFFER       J0109120
                    *                                                 * J0109130
                    *************************************************** J0109140
                    *                                                 * J0109150
                    *   THE FOLLOWING CODE IS OVERLAYED BY THE        * J0109160
                    *   CONTENTS OF THE HEADING SECTOR.               * J0109170
                    *                                                 * J0109180
                    *************************************************** J0109190
                    CC200 BSI  I  GET       FETCH SYS PRINT SUBR        J0109200
                    *                                                 * J0109210
                          LDX  L3 BUF6-1    POINT TO HEADER BUFFER      J0109220
                          MDX     CC300     SKIP                        J0109230
                    *                                                 * J0109240
                    *   NOTE.. ADDITIONAL PATCH ROOM AT CC150         * J0109250
                    *                                                 * J0109260
                          BSS     DUPCO-*-/10    AUXILIARY PATCH ROOM   J0109270
                    *                                                 * J0109280
                          BSS  E  0                                     J0109290
                    CC300 BSI  I  GET       FETCH HEADING RECORD        J0109300
                    *                                                 * J0109310
                          LDX   3 CC400-BUF6                            J0109320
                          STX  L3 BUF6      HEADER LENGTH FOR DUP       J0109330
                    *                                                 * J0109340
                    *************************************************** J0109350
                    *                                                 * J0109360
                    *   CLEAR CC300 THRU CC400 FOR HEADING BUFFER     * J0109370
                    *                                                 * J0109380
                    *************************************************** J0109390
                          SLT     32        ACC AND EXTENSION TO ZERO   J0109400
                          LDX   3 -8        NO OF WORDS TO ZERO         J0109410
                    CC350 STD  L3 CC350+1   CLEAR THIS PART OF HDBUF    J0109420
                          MDX   3 +2        STEP COUNT BY 2 WORDS       J0109430
                          MDX     CC350     LOOP UNTIL 8 WORDS ARE CLRD J0109440
                          STD     CC350+1                               J0109450
                          STD     CC350+3                               J0109460
                    CC400 STD     CC350+5   CLEAR THRU THIS WORD        J0109470
                    *                                                 * J0109480
                          BSI  I  REST      CCAT EXIT--TO DUPCO    ---- J0109490
                    *************************************************** J0109500
                          HDNG    DUPCO-    CCAT WORK AREA              J0109510
                    *************************************************** J0109520
                    *                                                   J0109530
                    *             THE FOLLOWING TABLE IS FILLED IN      J0109540
                    *             BY THE SYSTEM LOADER AT SYSTEM        J0109550
                    *             LOAD TIME.                            J0109560
                    *                                                   J0109570
                    *************************************************** J0109580
                          ORG     #NAME-4+C                             J0109590
                    INTFC DC      10   DUP CARD INTERFACE               J0109600
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0109610
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0109620
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0109630
                    KINTF DC      11   DUP KEYBOARD INTERFACE           J0109640
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0109650
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0109660
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0109670
                    PINTF DC      12   DUP PAPER TAPE INTERFACE         J0109680
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0109690
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0109700
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0109710
                    *                                                   J0109720
                    PINPT DC      154  PRINCIPAL INPUT DEVC RTN         J0109730
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0109740
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0109750
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0109760
                    *                                                   J0109770
                    S     EQU     PINPT     SLET ENTRY POINTER          J0109780
                    *                                                   J0109790
                    I1442 DC      144  1442 DEVICE RTN                  J0109800
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0109810
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0109820
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0109830
                    I1134 DC      145  PAPER TAPE DEVICE RTN            J0109840
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0109850
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0109860
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0109870
                    IKBRD DC      146  KEYBOARD DEVICE RTN              J0109880
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0109890
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0109900
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0109910
                    PRDVC DC      153  PRINCIPAL PRINTER DEVC RTN       J0109920
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0109930
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0109940
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0109950
                    *                                                   J0109960
                    PCVRT DC      156  PRINCIPAL INPUT CNVRT RTN        J0109970
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0109980
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0109990
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110000
                    CKBRD DC      149  KEYBOARD CONVERT ROUTINE         J0110010
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110020
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110030
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110040
                    *                                                   J0110050
                    PHS2  DC      2    DUP CONTROL                      J0110060
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110070
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110080
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110090
                    PHS3  DC      3    STORE                            J0110100
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110110
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110120
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110130
                    PHS4  DC      4    FILEQ                            J0110140
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110150
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110160
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110170
                    PHS5  DC      5    DUMP                             J0110180
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110190
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110200
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110210
                    PHS6  DC      6    DUMPLET                          J0110220
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110230
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110240
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110250
                    PHS7  DC      7    DELETE                           J0110260
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110270
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110280
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110290
                    PHS8  DC      8    DEFINE                           J0110300
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110310
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110320
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110330
                    PHS9  DC      9    DUP EXIT                         J0110340
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110350
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110360
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110370
                    *                                                   J0110380
                    PHS13 DC      13   DUP UPCOR AREA FOR CLB           J0110390
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110400
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110410
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110420
                    *                                                   J0110430
                    PHS14 DC      14   PRINCIPAL I/O BLOCK              J0110440
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110450
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110460
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110470
                    PHS15 DC      15   PRINCIPAL I/O (W/O KB) BLOCK     J0110480
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110490
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110500
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110510
                    PHS16 DC      16   PAPER TAPE I/O BLOCK             J0110520
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110530
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110540
                          DC      *-*       FILLED BY THE SYSTEM LOADER J0110550
                    PH205 DC      /00CD     DUP CONTROL 2           2-8 J0110560
                          DC      *-*       FILLED IN BY SYSTEM LDR 2-8 J0110570
                          DC      *-*       FILLED BY THE SYSTEM LDR2-8 J0110580
                          DC      *-*       FILLED IN BY SYSTEM LDR 2-8 J0110590
                    PH206 DC      /00CE     MACRO UPDATE PROGRAM    2-8 J0110600
                          DC      *-*       FILLED IN BY SYSTEM LDR 2-8 J0110610
                          DC      *-*       FILLED BY THE SYSTEM LDR2-8 J0110620
                          DC      *-*       FILLED IN BY SYSTEM LDR 2-8 J0110630
                    *************************************************** J0110640
                    *                                                   J0110650
                    *             THE NEXT CONSTANT WILL                J0110660
                    *             FORCE SYSTEM LDR TO LOAD ALL OF TABLE J0110670
                    *                                                   J0110680
                    *************************************************** J0110690
                          DC      /FFFF                                 J0110700
                    *************************************************** J0110710
                    *                                                   J0110720
                    *             END CCAT SUBR                         J0110730
                    *                                                   J0110740
                    *************************************************** J0110750
                          HDNG    DUPCO-    WRTDC  (UPDATE DCOM)        J0110760
                          ORG     START                                 J0110770
                    *************************************************** J0110780
                    *                                                 * J0110790
                    *   WRITE DCOM TO LOGICAL DRIVE ZERO, AND TO      * J0110800
                    *   DESTINATION DRIVE USED BY CALLING DUP FUNCTION* J0110810
                    *   IF OTHER THAN ZERO.                           * J0110820
                    *                                                 * J0110830
                    *************************************************** J0110840
                    DUP02 DC      *-*       ENTRY POINT                 J0110850
                          BSI  I  PUT       WRITE DCOM ON LOGICAL ZERO  J0110860
                    *************************************************** J0110870
                    *                                                 * J0110880
                    *   WRITE DCOM TO DRIVE SPECIFIED IN CALLING      * J0110890
                    *   SEQUENCE, IF NOT ZERO.                        * J0110900
                    *                                                 * J0110910
                    *************************************************** J0110920
                          LD   I  DUP02     DR CODE FROM CALL           J0110930
                          BSC  L  DU022,+-  BR IF DRIVE CODE IS ZERO    J0110940
                    *                                                 * J0110950
                          OR    3 +1                                    J0110960
                          STO   3 +1        DCOM SECTOR ADDRESS         J0110970
                    *                                                 * J0110980
                          LD   L  DRNCT     READ DR INDEPENT WORDS FROM J0110990
                          STO   3 0         *SATELLITE CART AND MERGE   J0111000
                          BSI  I  GET       *WITH DR DEPENDENT TABLES.  J0111010
                    *                                                 * J0111020
                          LD   L  DR0CT     USE FULL DCOM WD CNT TO     J0111030
                          STO   3 0         *OUTPUT MERGED QUANTITIES.  J0111040
                    *                                                 * J0111050
                          BSI  I  PUT       WRITE DCOM TO SATELLITE DR  J0111060
                    *                                                 * J0111070
                          LD    3 +1                                    J0111080
                          SLA     4                                     J0111090
                          SRA     4         RE-ESTABLISH SECTOR ADDRESS J0111100
                          STO   3 +1        *OF LOGICAL ZERO DCOM.      J0111110
                    *                                                 * J0111120
                          BSI  I  GET       READ DCOM FROM LOGICAL ZERO J0111130
                    *                                                 * J0111140
                    DU022 MDX  L  DUP02,1   INCR RETURN ADDRESS         J0111150
                          BSC  I  DUP02     RETURN TO DUP FUNCTION      J0111160
                          HDNG    DUPCO-    PHASE IDENTIFICATION        J0111170
                    *************************************************** J0111180
                    *                                                 * J0111190
                    * MODIFY PHASE ID FOR MOST RECENT SUB MODULE      * J0111200
                    *                                                 * J0111210
                    *************************************************** J0111220
                    DUP04 DC      *-*       RECORD SOURCE OF ENTRY      J0111230
                    *                                                   J0111240
                          LD   L  $PHSE                                 J0111250
                          AND  L  HF0FF     EXTRACT LAST MODULE IND     J0111260
                          OR   I  DUP04     INSERT NEW SUB MODULE IND   J0111270
                          STO     *+1       RECORD REQUIRED CONSTANT    J0111280
                    *                                                   J0111290
                          BSI     DUP05     GO TO RECORD REQ ID         J0111300
                          DC      *-*       PHASE ID PUT HERE           J0111310
                    *                                                   J0111320
                          MDX  L  DUP04,+1  STEP RETURN ADDRESS         J0111330
                          BSC  I  DUP04     RETURN TO SUB MODULE        J0111340
                    *                                                   J0111350
                    *************************************************** J0111360
                    *                                                   J0111370
                    * RECORD PHASE ID FOR THE OVERLAY JUST READ IN CORE J0111380
                    *                                                 * J0111390
                    *************************************************** J0111400
                    DUP05 DC      *-*       RECORD SOURCE OF ENTRY      J0111410
                          LD   I  DUP05                                 J0111420
                          STO  L  $PHSE     RECORD PHASE IDENTIFICATION J0111430
                          STO  L  PHDUP+C   SAVE PHASE IN CATCO         J0111440
                    *                                                   J0111450
                          MDX  L  DUP05,+1  INCRE RET ADDR              J0111460
                    *                                                   J0111470
                          BSC  I  DUP05      RETURN TO DUP OVERLAY      J0111480
                    *************************************************** J0111490
                          HDNG    DUPCO-    KB REQUEST MASK             J0111500
                    *************************************************** J0111510
                    *                                                 * J0111520
                    * USE TO ALTER KEYBOARD REQUEST INTERRUPT ADDRESS * J0111530
                    *                                                 * J0111540
                    *************************************************** J0111550
                    DUP06 DC      *-*       RECORD SOURCE OF ENTRY      J0111560
                    *                                                   J0111570
                          LD    1 ADDR2                                 J0111580
                          STO  L  $IREQ     INSERT KB INT SUSPENSE ADDR J0111590
                    *                                                   J0111600
                          SLA     16                                    J0111610
                          STO     KBSUS     ZERO ENTRY POINT AND SWITCH J0111620
                    *                                                   J0111630
                          BSC  I  DUP06     RETURN TO CALLER            J0111640
                    *                                                   J0111650
                    KBSUS DC      *-*       ENTRY POINT FOR KB INT      J0111660
                          XIO  L  RSTKB     RESET KEYBOARD/CP DSW       J0111670
                          BSC  L  $I410     RETURN TO ILS04             J0111680
                    *                                                 * J0111690
                    *                                                   J0111700
                    *************************************************** J0111710
                          HDNG    DUPCO-    COMMON EXIT FROM DUP        J0111720
                    *************************************************** J0111730
                    *                                                   J0111740
                    *  SERVICE THE EXIT FROM DUP.  THE PARAMETER      * J0111750
                    *  CODES, DESCRIBED BELOW, INDICATE EXIT PROCED   * J0111760
                    *  PLUS    WRITE DCOM, ERROR MESSAGE AND GOTO REST* J0111770
                    *  ZERO    WILL CAUSE DECONCATENATION & GO TO EXIT* J0111780
                    *  MINUS 1 WILL CAUSE DECONCATENATION & GO TO KTRAP J0111790
                    *  MINUS 2 WILL CAUSE DECONCATENATION & RETURN    * J0111800
                    *                                                 * J0111810
                    *************************************************** J0111820
                    DUP08 DC      *-*       RECORD SOURCE OF ENTRY      J0111830
                          LDX  L3 EXITC      ADDR OF EXIT ROUT TO XR3   J0111840
                          LDX  L1 C         POINT TO MIDDLE OF CATCO    J0111850
                          LDD   1 DXHDR     SET-UP IOAR HDR TO          J0111860
                          STD   3 0         READ IN DUP EXIT MODULE     J0111870
                    *                                                   J0111880
                          SLT     32                                    J0111890
                          STD   1 DUMPP     ZEROS FOR TOTAL CORE DUMP   J0111900
                    *                                                 * J0111910
                          BSI     DUP09     PRINT BETWEEN SPEC LIMITS   J0111920
                    *                                                 * J0111930
                          LD   I  DUP08                                 J0111940
                          STO     DU081+1   EXIT CODE                   J0111950
                    *                                                 * J0111960
                    DU081 LDX  L2 *-*       XR2 CONTAINS EXIT CODE      J0111970
                          LD      *-1       SET TO NON-ZERO             J0111980
                          STO   1 XEQSW     SET TO XEQ EXIT SUBR        J0111990
                    *                                                   J0112000
                          BSI  I  GET       GO TO GET EXIT SUBR         J0112010
                    *************************************************** J0112020
                          HDNG    DUPCO-    MONITORING PRINTER DUMPS    J0112030
                    *************************************************** J0112040
                    *                                                 * J0112050
                    *   CONTROL MONITORING PRINTING OF SELECTED KEY   * J0112060
                    *   PORTIONS OF CORE AND RETURN                   * J0112070
                    *   XR1 IS POINTING AT C OF CATCO                 * J0112080
                    *                                                 * J0112090
                    *************************************************** J0112100
                    DUP09 DC      *-*       RECORD RETURN ADDRESS       J0112110
                          STD     DU096     SAVE THE A AND Q REGS       J0112120
                          LDD  L  DUMPP+C                               J0112130
                          STO     DU092     INSERT PARAMETERS           J0112140
                          RTE     16                                    J0112150
                          STO     DU092+1                               J0112160
                    *                                                   J0112170
                          LDD   1 PRPAR                                 J0112180
                          STD   1 DUMPP     RESTORE STND PHASE LIMITS   J0112190
                    *                                                 * J0112200
                          LD    1 BITSW     BIT SWITCH SIMULATION.COL 3 J0112210
                    *                                                 * J0112220
                    *   FOLLOWING INST IS OVERLAID BY INST AT END OF  * J0112230
                    *   DUPCO DECK TO PREVENT DUMPS DURING DUPCO      * J0112240
                    *                                                 * J0112250
                    DU090 BSC  L  DU091     FORCE DUMP IF NOT OVERLAID  J0112260
                    *                                                 * J0112270
                          BSC  L  DU093,-+  ALL SW-S OFF -DO NOT DUMP-- J0112280
                    *                                                   J0112290
                          LD    1 PHDUP     PHASE ID                    J0112300
                          AND     H001F     MASK WITH /001F             J0112310
                          EOR   1 BITSW     BIT SWITCH SIMULATION.COL 3 J0112320
                          BSC  L  DU093,Z   NOT EXACT MATCH-DO NOT DUMP J0112330
                    *                                                   J0112340
                    DU091 BSI  L  $DUMP     PRINT BETWEEN SPEC LIMITS   J0112350
                          DC      0                                     J0112360
                    DU092 DC      *-*       STARTING CORE ADDR          J0112370
                          DC      *-*       ENDING   CORE ADDR          J0112380
                    *                                                   J0112390
                          BSI  L  $DUMP     PRINT CATCO                 J0112400
                          DC      0         HEXIDECIMAL DUMP REQUIRED   J0112410
                          DC      CATCO+2   LOWER LIMIT                 J0112420
                          DC      NEXT+C    UPPER LIMIT                 J0112430
                    *************************************************** J0112440
                    DU093 LDD     DU096                                 J0112450
                          BSC  I  DUP09     RETURN, PRINTING COMPLETED  J0112460
                    *************************************************** J0112470
                          HDNG    DUPCO-    PRINTER INTERFACE SUBRS     J0112480
                    *************************************************** J0112490
                    *                                                 * J0112500
                    *  CONVERT BINARY TO PACKED EBC.  BIN DATA        * J0112510
                    *  IS ENTERED VIA THE A REG, AND TWO PACKED       * J0112520
                    *  EBC WORDS ARE RETURNED TO TEMP IN CATCO.       * J0112530
                    *                                                 * J0112540
                    *************************************************** J0112550
                    DUP10 DC      *-*       RECORD SOURCE OF ENTRY      J0112560
                          BSI  L  DUP15     SAVE CONDITIONS             J0112570
                          BSI     DUP04     IDENTIFY PH MOD & SAVE COND J0112580
                          DC      /0500     BINEB IS MOD 5              J0112590
                    *                                                   J0112600
                          LDX   3 +2        INIT XR3 TO 2               J0112610
                          LD      AQ        RESTORE A AND Q REGS        J0112620
                          SRT     16        MOVE RT 4 WDS TO Q          J0112630
                          LDX   2 +2        INIT XR2 TO 2               J0112640
                    DU101 SLA     16                                    J0112650
                          SLT     4         MOVE NEXT WD TO ACC         J0112660
                          S       TEN       THIS LOOP DECODES AND       J0112670
                          BSC     -         *CONVERTS BIN WD TO ECB     J0112680
                          A       CODE1                                 J0112690
                          A       CODE2                                 J0112700
                          MDX   2 -1        DECR XR2                    J0112710
                          MDX     *+1       SKIP                        J0112720
                          MDX     DU102     GO TO PACK 2 WDS            J0112730
                    *                                                   J0112740
                          SLA     8         LEFT JUSTIFY AND            J0112750
                          STO     TOBOR     *STORE TEMP                 J0112760
                    *                                                   J0112770
                          MDX     DU101     GO TO DECODE IT             J0112780
                    *                                                   J0112790
                    *                                                   J0112800
                    DU102 OR      TOBOR     OR WITH LEFT HALF EBC WD    J0112810
                          STO   1 TEMP1     *AND STO RESULT IN CATCO    J0112820
                    *                                                   J0112830
                          MDX   3 -1        DECR XR3                    J0112840
                          MDX     DU103     GO TO HANDLE MORE WORDS     J0112850
                    *                                                   J0112860
                          BSI     DUP16     RESTORE A,Q,XRS,AND STATUS  J0112870
                    *                                                   J0112880
                          BSC  I  DUP10     RETURN TO CALLER            J0112890
                    *                                                   J0112900
                    DU103 MDX   1 1         INCR CATCO POINTER          J0112910
                          MDX     DU101-1   GO DECODE LAST 2 WDS        J0112920
                    *************************************************** J0112930
                    *                                                 * J0112940
                    *  INITIALIZE THE PRINC PRINT DEVICE ROUTINE.     * J0112950
                    *  FETCH IOAR ADDR FROM CALLING SEQ.  I/O DATA    * J0112960
                    *  TO BE PRINTED MUST BE IN PACKED EBC.           * J0112970
                    *   CHECK BEFORE PRINTING FOR PAGE RESTORE        * J0112980
                    *                                                 * J0112990
                    *************************************************** J0113000
                    DUP11 DC      *-*       RECORD SOURCE OF ENTRY      J0113010
                    *                                                   J0113020
                          BSI  I  PHIDM     GO TO IDENTIFY PHASE        J0113030
                          DC      /0400     *AND MODULE                 J0113040
                    *                                                   J0113050
                          LD   I  $CH12                                 J0113060
                          BSI  L  DUP12,Z   NEW PAGE REQUIRED           J0113070
                    *                                                   J0113080
                          LD   I  DUP11                                 J0113090
                          RTE     16        IOAR ADDR TO Q-REG          J0113100
                          LD      FUNC2     PRINT FUNC CODE TO ACC      J0113110
                    *                                                   J0113120
                          BSI  L  PRPNT+3   GO TO PRINT                 J0113130
                    *                                                   J0113140
                          MDX  L  DUP11,+1  INCR RETURN ADDR            J0113150
                          LD   L  $PBSY                                 J0113160
                          BSC  L  *-4,-Z    BR IF PRINTING NOT COMPLETE J0113170
                    *                                                   J0113180
                          BSC  I  DUP11     RETURN TO CALLER            J0113190
                    *************************************************** J0113200
                    *************************************************** J0113210
                    *                                                 * J0113220
                    *  EXECUTE A RESTORE                              * J0113230
                    *                                                   J0113240
                    *************************************************** J0113250
                    DUP12 DC      *-*       RECORD SOURCE OF ENTRY      J0113260
                          LD   L  HDBUF+C   IOAR ADDR OF THE PAGE BFR   J0113270
                          RTE     16        HEADING BUFFER TO EXTENSION J0113280
                          LD      FUNC1     RESTORE CODE (7000) TO ACC  J0113290
                          BSI  L  PRPNT+3   GO TO RESTORE A PAGE        J0113300
                          BSI  L  PRPNT+3   GO TO PRINT HEADING         J0113310
                          BSI     DUP13     ADDITIONAL LINE AFTER HDG   J0113320
                    *                                                   J0113330
                          BSC  I  DUP12     RETURN                      J0113340
                    *************************************************** J0113350
                    *************************************************** J0113360
                    *                                                 * J0113370
                    *  EXECUTE A SKIP                                 * J0113380
                    *                                                 * J0113390
                    *************************************************** J0113400
                    DUP13 DC      *-*       RECORD SOURCE OF ENTRY      J0113410
                          LD      FUNC3     SPACE FUNC (7002) TO ACC    J0113420
                          BSI  L  PRPNT+3   GO TO SKIP A LINE           J0113430
                    *                                                   J0113440
                          BSC  I  DUP13     RETURN                      J0113450
                    *************************************************** J0113460
                          HDNG    DUPCO-    COMMON CONSTANTS+WORK AREAS J0113470
                    AQ    BSS  E  2                                     J0113480
                    DU096 DC      *-*       WORK AREA FOR A AND Q REGS  J0113490
                    TOBOR DC      *-*       WORK AREA FOR A AND Q REGS  J0113500
                    DRNCT DC      34        WD CNT TO READ DCOM'S 1-4   J0113510
                          DC      /0F01     SENSE KB/CP WITH RESET      J0113520
                    RSTKB EQU     DRNCT                                 J0113530
                    PARAM DC      *-*       HOLDS FUNC ID               J0113540
                          DC      *-*       HOLDS IOAR ADDR             J0113550
                    CODE1 DC      .A-.0-10  ALPHA CHAR                  J0113560
                    CODE2 DC      .0+10     NUMERIC VALUE               J0113570
                    TEN   DC      10        CONSTANT                    J0113580
                    FUNC1 DC      /7000     RESTORE/READ W/O CONV       J0113590
                    FUNC2 DC      /7001     PRINT                       J0113600
                    FUNC3 DC      /7002     SKIP(LINE)/READ W/CONV      J0113610
                    H001F DC      /001F     MASK FOR PHASE PURIFICATION J0113620
                    H0FFF DC      /0FFF     MASK                        J0113630
                    HF0FF DC      /F0FF     MASK TO ELIMINATE MODULE    J0113640
                    K319  DC      319       CONSTANT 319                J0113650
                    K320  DC      320       CONSTANT 320                J0113660
                    K1600 DC      1600      CONSTANT 1600               J0113670
                    DR0CT DC      /70       WD CNT FOR DCOM,LOG DR 0    J0113680
                    *************************************************** J0113690
                          HDNG    DUPCO-    RESTORE DUP AND GO TO DCTL  J0113700
                    *************************************************** J0113710
                    *                                                 * J0113720
                    *  CLEAR THE DUP PARAMETER AREA OF CATCO AND        J0113730
                    *  CALL IN DCTL IF CORE SIZE IS 4K.                 J0113740
                    *                                                 * J0113750
                    *************************************************** J0113760
                    DUP14 DC      *-*       RECORD SOURCE OF ENTRY      J0113770
                          BSI  I  PHID      IDENTIFY PHASE              J0113780
                          DC      /0001     DUPCO IN CHARGE IS PHASE 1  J0113790
                    *                                                 * J0113800
                          LDX  L1 C         RESTORE XR1                 J0113810
                          LDX   2 CL2-CL1+1 NO OF CORE TO CLEAR TO ZERO J0113820
                    *                                                 * J0113830
                          LD    1 KBREQ                                 J0113840
                          STO  L  $IREQ     RESTORE SYS INTRPT REQ ADDR J0113850
                          LD   I1 ADDR2                                 J0113860
                          BSC  L  DU143,+-  BR IF NO INTRPT REQ YET     J0113870
                    *                                                 * J0113880
                          BSI  L  $DUMP     USE SYS ERROR ANALYSIS PROG J0113890
                          DC      -2        *AND TAKE INTRPT REQ ACTION J0113900
                    *                                                 * J0113910
                    DU143 STO  L2 C+CL1-1   START AT THE HIGH END       J0113920
                          MDX   2 -1        DECREMENT CORE LOC TO CLEAR J0113930
                          MDX     DU143     NOT ALL CLEARED             J0113940
                    *                                                   J0113950
                          STO   1 #USZE     INITIALIZE TO ZERO          J0113960
                          STO   1 #FSZE     INITIALIZE TO ZERO          J0113970
                    *                                                   J0113980
                          LD    1 PH2                                   J0113990
                          BSC  L  DCTL,Z    DCTL IN CORE ALREADY        J0114000
                    *                                                   J0114010
                          LDX  L3 DCTLC     ADDR OF DUP CONTROL PHASE 2 J0114020
                          LDD   1 DCHDR     SET UP IOAR HDR TO READ     J0114030
                          STD   3 0         IN DUP CONTROL              J0114040
                          STO   1 XEQSW     SET XEQSW TO NON ZERO       J0114050
                    *                                                   J0114060
                          BSI  I  GET       READ IN DCTL AND EXECUTE    J0114070
                    *************************************************** J0114080
                          HDNG    DUPCO-    SAVE AND RESTORE XRS, ETC   J0114090
                    *************************************************** J0114100
                    *                                                 * J0114110
                    *  SAVE A AND Q REGS, INDEX REGS, AND STATUS      * J0114120
                    *                                                 * J0114130
                    *************************************************** J0114140
                    DUP15 DC      *-*       RECORD SOURCE OF ENTRY      J0114150
                          STD     AQ        SAVE A AND Q REGISTERS      J0114160
                    *                                                   J0114170
                          STS     DU164     SAVE STATUS                 J0114180
                    *                                                   J0114190
                          STX   1 DU163+1   SAVE INDEX REGISTERS        J0114200
                          STX   2 DU162+1                               J0114210
                          STX   3 DU161+1                               J0114220
                    *                                                   J0114230
                          LDX  L1 C         INITIALIZE XR1 TO CATCO     J0114240
                          BSC  I  DUP15     RETURN TO CALLING SUBR      J0114250
                    *                                                 * J0114260
                    *************************************************** J0114270
                    *                                                 * J0114280
                    *  RESTORE A AND Q REGS, INDEX REGS, AND STATUS   * J0114290
                    *                                                 * J0114300
                    *************************************************** J0114310
                    DUP16 DC      *-*       RECORD SOURCE OF ENTRY      J0114320
                    DU161 LDX  L3 *-*       RESTORE INDEX REGISTERS     J0114330
                    DU162 LDX  L2 *-*                                   J0114340
                    DU163 LDX  L1 *-*                                   J0114350
                          LDD     AQ        RESTORE A AND Q REGS        J0114360
                    DU164 LDS     0                                     J0114370
                          BSC  I  DUP16     RETURN TO CALLING SUBR      J0114380
                    *************************************************** J0114390
                          HDNG    DUPCO-    DISK I/O INTERFACE          J0114400
                    *                                                   J0114410
                    *************************************************** J0114420
                    *                                                 * J0114430
                    *  ENTER HERE TO READ FROM DISK                   * J0114440
                    *                                                 * J0114450
                    *************************************************** J0114460
                    DUP30 DC      *-*       RECORD SOURCE OF ENTRY      J0114470
                          BSI  I  PHIDM     IDENTIFY PHASE MODIFICATION J0114480
                          DC      /0100     GET IS MOD 1                J0114490
                    *                                                 * J0114500
                          LD      DUP30                                 J0114510
                          STO     DUP34     SET UP EXIT ADDRESS         J0114520
                    *                                                   J0114530
                          LD      FUNC1     READ FUNC CODE TO ACC       J0114540
                          MDX     DU341     GO TO READ FROM DISK        J0114550
                    *                                                   J0114560
                    *************************************************** J0114570
                    *                                                 * J0114580
                    *  ENTER HERE TO WRITE ON DISK                    * J0114590
                    *                                                 * J0114600
                    *************************************************** J0114610
                    DUP34 DC      *-*       RECORD SOURCE OF ENTRY      J0114620
                          BSI  I  PHIDM     IDENTIFY PHASE MODIFICATION J0114630
                          DC      /0200     PUT IS MOD 2                J0114640
                    *                                                 * J0114650
                          LD      FUNC2     SET UP TO WRITE             J0114660
                    *************************************************** J0114670
                    *                                                 * J0114680
                    *  THE BALANCE OF DUP34 IS USED FOR BOTH RD & WRT * J0114690
                    *                                                 * J0114700
                    *************************************************** J0114710
                    DU341 STO     PARAM                                 J0114720
                    *                                                   J0114730
                          STX   3 PARAM+1   SET UP IOAR                 J0114740
                    *************************************************** J0114750
                    *                                                 * J0114760
                    * TEST DISK PARAMS - SCTR 0,NEG WD CNT,CART OVFLO * J0114770
                    *                                                 * J0114780
                    *************************************************** J0114790
                          LD    3 1                                     J0114800
                          AND     H0FFF     /0FFF MASK DRIVE CODE       J0114810
                          STO   1 DKSAD     SAVE SAD WITHOUT DRIVE CODE J0114820
                    *                                                   J0114830
                          BSC     Z         SKIP IF SCTR ZERO..ERROR..  J0114840
                    *                                                   J0114850
                          LD    3 0                                     J0114860
                          BSC  L  DU342,-Z  WORD COUNT POSITIVE         J0114870
                    *                                                   J0114880
                          BSI  I  LEAVE     ERROR EXIT                  J0114890
                          DC      92        NEGATIVE WORD COUNT         J0114900
                    *                                                   J0114910
                    *************************************************** J0114920
                    *                                                 * J0114930
                    *   INSURE DISK OPERATION WILL NOT EXCEED CYL 200 * J0114940
                    *                                                 * J0114950
                    *************************************************** J0114960
                    DU342 A       K319      ADJ WD CNT TO NEXT SCTR     J0114970
                          RTE     16                                    J0114980
                          SLA     16                                    J0114990
                          D       K320      CONVERT TO SECTORS          J0115000
                          A     1 DKSAD     SPECIFIED SECTORS           J0115010
                          S       K1600     CYL 200 (SCTRS)             J0115020
                          BSC  L  DU343,+   WITHIN LIMITS               J0115030
                    *                                                   J0115040
                          BSI  I  LEAVE     PRINT ERROR MESSAGE         J0115050
                          DC      93        CARTRIDGE OVERFLOW          J0115060
                    *                                                   J0115070
                    *************************************************** J0115080
                    *                                                 * J0115090
                    *  DO REQD DISK FUNCTION AND WAIT UNTIL COMPLETE  * J0115100
                    *                                                 * J0115110
                    *************************************************** J0115120
                    DU343 LDD     PARAM     NO ERROR, SO GO TO DISK     J0115130
                          BSI  L  DISKZ     *SUBR TO WRITE OUT BUFFER   J0115140
                    *                                                   J0115150
                    DU345 MDX  L  $DBSY,0   TEST DISK BUSY              J0115160
                          MDX     DU345      LOOP ON BUSY               J0115170
                    *                                                   J0115180
                    *************************************************** J0115190
                    *                                                 * J0115200
                    *   SET UP PARAMETERS REQD FOR MONITORING BY PRINT* J0115210
                    *                                                 * J0115220
                    *************************************************** J0115230
                          LD      PARAM+1                               J0115240
                          STO   1 DUMPP     IOAR ADDR                   J0115250
                    *                                                   J0115260
                          A     3 0         WORD COUNT                  J0115270
                          STO   1 DUMPP+1   TERMINAL ADDR               J0115280
                    *                                                   J0115290
                          BSI  I  MDUMP     PRINT IOAR HEADER & BUFFER  J0115300
                    *                                                   J0115310
                    *                                                   J0115320
                          LD    1 XEQSW                                 J0115330
                    *                                                   J0115340
                          BSC  I  DUP34,-+  NORMAL RETURN               J0115350
                    *                                                   J0115360
                          SLA     16                                    J0115370
                          STO   1 XEQSW     RESET EXEC SW TO ZERO       J0115380
                    *                                                   J0115390
                          BSC  L3 +2        SET EXIT TO NEW MODULE      J0115400
                    *************************************************** J0115410
                          BSS     CATCO-*   DUPCO PATCH ROOM            J0115420
                    *************************************************** J0115430
                          ORG     CATCO     SET UP DCOM IOAR HDR        J0115440
                          DC      /70       WD CNT FOR DCOM READ (CCAT) J0115450
                          DC      #DCOM     SCTR ADDR OF 1ST DCOM SCTR  J0115460
                    *************************************************** J0115470
                    *                                                 * J0115480
                    *   THE CARD GENERATED BY THE FOLLOWING           * J0115490
                    *   INSTRUCTION MAY BE REMOVED FROM THE BACK OF   * J0115500
                    *   THE DUPCO (PHASE 01) DECK (JUST PRIOR TO THE  * J0115510
                    *   F TYPE CARD). THIS WILL FORCE DIAGNOSTIC      * J0115520
                    *   DUMPS TO OCCUR DURING ALL REQUIRED DUP PHASES * J0115530
                    *   INCLUDING DUPCO.                              * J0115540
                    *                                                 * J0115550
                    *************************************************** J0115560
                          ORG     DU090                                 J0115570
                          BSC  L  DU091,+Z  SW ZERO ON - FORCE DUMP -   J0115580
                    *                                                 * J0115590
                          END     SYSLD                                 J0115600
