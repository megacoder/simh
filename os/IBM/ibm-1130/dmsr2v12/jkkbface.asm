                          HDNG    KFACE-    RESIDENT COMMA   2 AUG 67   J1100010
                          ABS                                           J1100020
                    $CIBA EQU     /5   ADDR OF CIB ON MASTER CARTRIDGE  J1100030
                    $CH12 EQU     /6   CHANNEL 12 INDR,NON-ZERO=CHAN 12 J1100040
                    $COMN EQU     /7   WORD COUNT OF COMMON             J1100050
                    $CORE EQU     /E   CORE SIZE,/1000=4K,/2000=8K,ETC) J1100060
                    $CTSW EQU     /F   MCR SW,NON-ZERO=// RECD TRAPPED  J1100070
                    $DADR EQU     /10  SCTR ADDR OF PROG TO BE FETCHED  J1100080
                    $DABL EQU     /11  IOCC FOR SCA RESET (ODD ADDR)    J1100090
                    $DREQ EQU     /12  INDR FOR REQUESTED V. DISK I/O   J1100100
                    $IBSY EQU     /13  PRINC I/O BUSY INDR,NON-ZERO=BSY J1100110
                    $HASH EQU     /14  WORK AREA FOR MONITOR PROGRAMS   J1100120
                    $PRET EQU     /28  ADDR PREOPERATIVE ERROR TRAP     J1100130
                    $IREQ EQU     /2C  ADDR OF INT REQUEST SUBROUTINE   J1100140
                    $ULET EQU     /2D  ADDR OF LET, LOGICAL DRIVE 0     J1100150
                    $IOCT EQU     /32  IOCS CTR,0=NO I/O IN PROGRESS    J1100160
                    $LAST EQU     /33  LAST CD INDR,NON-ZERO=LAST CARD  J1100170
                    $NDUP EQU     /34  INHIBIT DUP SW,NON-ZERO=NO DUP   J1100180
                    $NXEQ EQU     /35  INHIBIT EXEC SW,NON-ZERO=NO EXEQ J1100190
                    $PBSY EQU     /36  PRINC PTR BUSY INDR,NON-ZERO=BSY J1100200
                    $PGCT EQU     /37  PAGE NO. FOR PAGE HEADINGS       J1100210
                    $EXIT EQU     /38  ADDR CALL EXIT ENTRY POINT       J1100220
                    $LINK EQU     /39  ADDR CALL LINK ENTRY POINT       J1100230
                    $DUMP EQU     /3F  ADDR OF CALL DUMP, ENTRY POINT   J1100240
                    $DCDE EQU     /77  DRIVE CODE FOR CORE LOAD BLDR    J1100250
                    $PHSE EQU     /78  NO. OF PHASE CURRENTLY IN CORE   J1100260
                    $UFIO EQU     /79  ARM POSITION IN UNFORMATTED AREA J1100270
                    $WSDR EQU     /7A  WORKING STORAGE DRIVE CODE       J1100280
                    $WRD1 EQU     /7B  LOAD ADDR FOR CURR USER CORE LD  J1100290
                    $KCSW EQU     /7C  INHIBIT INPUT/PRINT OVERLAP SW   J1100300
                    $UFDR EQU     /7D  UNFORMATTED I/O DRIVE CODE       J1100310
                    $CPTR EQU     /7E  CHANNEL 12 INDICATOR FOR CP      J1100320
                    $1132 EQU     /7F  CHANNEL 12 INDICATOR FOR 1132    J1100330
                    $1403 EQU     /80  CHANNEL 12 INDICATOR FOR 1403    J1100340
                    $PST1 EQU     /81  ADDR POSTOP ERROR TRAP,LEVEL 1   J1100350
                    $PST2 EQU     /85  ADDR POSTOP ERROR TRAP,LEVEL 2   J1100360
                    $PST3 EQU     /89  ADDR POSTOP ERROR TRAP,LEVEL 3   J1100370
                    $PST4 EQU     /8D  ADDR POSTOP ERROR TRAP,LEVEL 4   J1100380
                    $STOP EQU     /91  ADDR PROGRAM STOP KEY TRAP       J1100390
                    $FPAD EQU     /95  FILE PROTECT ADDR (ADJ),LOG DR 0 J1100400
                    $CYLN EQU     /9A  ARM POSITION FOR LOGICAL DRIVE 0 J1100410
                    $ACDE EQU     /9F  AREA CODE FOR LOGICAL DRIVE 0    J1100420
                    $DCYL EQU     /A4  1ST DEF CYL ADDR, LOGICAL DR 0   J1100430
                    $I200 EQU     /B3  ENTRY POINT TO ILS FOR LEVEL 2   J1100440
                    $I205 EQU     /B8                                   J1100450
                    $IBT2 EQU     $I205+1 ADDR OF IBT FOR LEVEL 2       J1100460
                    $I400 EQU     /C4  ENTRY POINT TO ILS FOR LEVEL 4   J1100470
                    $I405 EQU     /D3                                   J1100480
                    $IBT4 EQU     $I405+1 ADDR OF IBT FOR LEVEL 4       J1100490
                    $I410 EQU     /D5                                   J1100500
                    $DBSY EQU     /EE  DISK BUSY INDR,NON-ZERO=DK BUSY  J1100510
                    $BYSW EQU     /1CB BYPASS SW,NOP IF FETCHING SOCAL  J1100520
                    DZ000 EQU     /0F2 DISKZ ENTRY POINT                J1100530
                    $ZEND EQU     /1E0 ADDR 1+LAST WORD OF DISKZ        J1100540
                          HDNG          CONCATENATED COMMON AREA(CATCO) J1100550
                    C     EQU     /7FA0     CATCO POINTER SET TO MIDDLE J1100560
                    *************************************************** J1100570
                    *                                                 * J1100580
                    *  INDEX REG 1 IS SET TO .C. WHEN CATCO IS FORMED * J1100590
                    *  FOR USE BY ALL OF DUP FUNCTIONS. ANY DUP ROUT  * J1100600
                    *  USING XR 1 FOR OTHER REASONS MUST RESTORE.     * J1100610
                    *  ALL VALUES IN CATCO HAVE LABELS EQUATED TO THE * J1100620
                    *  VALUE THAT INDICATES THEIR RELATIVE LOCATION   * J1100630
                    *  FROM .C.                                       * J1100640
                    *                                                 * J1100650
                    *************************************************** J1100660
                    *                                                 * J1100670
                    *             CATCO DCOM IMAGE                    * J1100680
                    *   EQUIVALENCES USED TO REFERENCE CATCO WITH XR1 * J1100690
                    *                                                 * J1100700
                    *************************************************** J1100710
                    #NAME EQU     4-/80     NAME OF PROGRAM             J1100720
                    #DBCT EQU     6-/80     DISK BLOCK COUNT OF PROGRAM J1100730
                    #FCNT EQU     7-/80     FILES SW,ZERO = NO FILES    J1100740
                    #SYSC EQU     8-/80     NON-ZERO,SYSTEM CARTRIDGE   J1100750
                    #JBSW EQU     9-/80     JOB SW,NON-ZERO='T' MODE    J1100760
                    #CBSW EQU     10-/80    CLB SW,NON-ZERO=STORECI     J1100770
                    #LCNT EQU     11-/80    NO. OF LOCALS               J1100780
                    #MPSW EQU     12-/80    NON-ZERO, CORE MAP DESIRED  J1100790
                    #MDF1 EQU     13-/80    NO. OF DUP CTRL RCDS        J1100800
                    #MDF2 EQU     14-/80    ADDR OF MODIF BUFFER        J1100810
                    #NCNT EQU     15-/80    NO. OF NOCALS               J1100820
                    #ENTY EQU     16-/80    RELATIVE ENTRY ADDR OF PROG J1100830
                    #RP67 EQU     17-/80    IF NON-ZERO,1442 MOD 6,7    J1100840
                    *                                                   J1100850
                    *   NEGATIVE VALUE REPRESENTS DEFAULT CONDITION   * J1100860
                    #TODR EQU     18-/80    DR CODE OF 'TO' DRIVE       J1100870
                    #FRDR EQU     19-/80    DR CODE OF 'FROM' DRIVE     J1100880
                    *                                                 * J1100890
                    #FHOL EQU     20-/80    ADDR OF LARGEST FXA HOLE    J1100900
                    #FSZE EQU     21-/80    BLK CNT LARGEST HOLE IN FXA J1100910
                    #UHOL EQU     22-/80    ADDR OF LARGEST UA HOLE     J1100920
                    #USZE EQU     23-/80    BLK CNT LARGEST HOLE IN UA  J1100930
                    #DCSW EQU     24-/80    NON-ZERO=DUP CALL           J1100940
                    #PIOD EQU     25-/80    PRINC. I/O INDICATOR        J1100950
                    #PPTR EQU     26-/80    PRINC. PRINTER INDICATOR    J1100960
                    #CIAD EQU     27-/80    WD NO. SCTR 0,CIL ADDR      J1100970
                    #ACIN EQU     28-/80    AVAILABLE CARTRIDGE INDR2-8 J1100980
                    #GRPH EQU     29-/80    2250 INDICATOR          2-8 J1100990
                    #GCNT EQU     30-/80    NO. G2250 RECORDS       2-8 J1101000
                    #LOSW EQU     31-/80    LOCAL-CALLS-LOCAL INDR  2-8 J1101010
                    #X3SW EQU     32-/80    SPECIAL ILS SWITCH      2-8 J1101020
                    #ECNT EQU     33-/80    NO. OF EQUAT RCDS       2-8 J1101030
                    #ANDU EQU     35-/80    END OF UA (ADJ) LOG DR 0-4  J1101040
                    #BNDU EQU     40-/80    END OF UA (BASE) LOG DR 0-4 J1101050
                    #FPAD EQU     45-/80    FILE PROTECT ADDR (BASE)    J1101060
                    #PCID EQU     50-/80    CART ID, PHYS DR 0-4        J1101070
                    #CIDN EQU     55-/80    CART ID, LOG DR 0-4         J1101080
                    #CIBA EQU     60-/80    CIB ADDR, LOG DR 0-4        J1101090
                    #SCRA EQU     65-/80    SCRA, LOG DR 0-4            J1101100
                    #FMAT EQU     70-/80    WS FORMAT, LOG DR 0-4       J1101110
                    #FLET EQU     75-/80    FLET ADDR, LOG DR 0-4       J1101120
                    #ULET EQU     80-/80    LET ADDR, LOG DR 0-4        J1101130
                    #WSCT EQU     85-/80    WS BLK CNT, LOG DR 0-4      J1101140
                    #CSHN EQU     90-/80    CUSHION END SCTR ADDR, 0-4  J1101150
                    #DCOM EQU     1         SCTR ADDR OF DCOM           J1101160
                    #HDNG EQU     7         SCTR WITH PAGE HEADING      J1101170
                    @SBFR EQU     /FB0                              2-8 J1101180
                          HDNG    CONCATENATED COMMON AREA (CATCO)      J1101190
                    *************************************************** J1101200
                    *                                                 * J1101210
                    *             CATCO IOAR HDRS FOR DUP PHASES        J1101220
                    *                                                 * J1101230
                    *************************************************** J1101240
                          ORG     -/10                                  J1101250
                    DCHDR BSS     2         DUP CONTROL            PH02 J1101260
                    STHDR BSS     2         STORE                  PH03 J1101270
                    FLHDR BSS     2         FILEQ                  PH04 J1101280
                    DMHDR BSS     2         DUMP                   PH05 J1101290
                    DLHDR BSS     2         DUMPLET                PH06 J1101300
                    DTHDR BSS     2         DELETE                 PH07 J1101310
                    DFHDR BSS     2         DEFINE                 PH08 J1101320
                    DXHDR BSS     2         DUP EXIT               PH09 J1101330
                    UCHDR BSS     2         DUP UPCOR              PH13 J1101340
                    PIHDR BSS     2         PRINCIPAL I/O BLOCK    PH14 J1101350
                    SIHDR BSS     2         PRINC I/O (W/O KB) BLK PH15 J1101360
                    PTHDR BSS     2         PAPER TAPE I/O BLOCK   PH16 J1101370
                    CIHDR BSS     2         CI PHASE READ BY CL BUILDER J1101380
                    MUHDR BSS     2         MACRO UPDATE      PH206 2-8 J1101390
                    D2HDR BSS     2         DUP CONTROL 2     PH205 2-8 J1101400
                          HDNG    KFACE-    CATCO DUP SWITCHES          J1101410
                    *************************************************** J1101420
                    *                                                   J1101430
                    *             CATCO DUP SWITCHES                  * J1101440
                    *      WORDS USED FOR COMMUNICATION OF DATA         J1101450
                    *   BETWEEN DUP ROUTINES.                           J1101460
                    *                                                 * J1101470
                    *      INITIALIZED TO ZERO BY  .REST. OF DUPCO    * J1101480
                    *                                                   J1101490
                    *************************************************** J1101500
                    CL1   EQU     *                                     J1101510
                    ASMSW BSS     1         NON ZERO IF DEFINE VOID ASM J1101520
                    BITSW BSS     1         NON ZERO TO ALLOW MDUMP-S   J1101530
                    BLKSW BSS     1         NON ZERO IF BYPASSING REC   J1101540
                    CIERR BSS     1         ERROR NO DETECTED BY PH 17  J1101550
                    CISW  BSS     1         NON ZERO IF STORE CI        J1101560
                    CLBSW BSS     1         NON ZERO IF PRECI EXECUTED  J1101570
                    CNTNO BSS     1         RECORD NO BEING PCHD OR RD  J1101580
                    *                                                 * J1101590
                    *   .DATSW. IS FILLED WITH THE CNT FIELD OF THE   * J1101600
                    *   DUP CONTROL RECORD.                           * J1101610
                    *   USED PRIMARILY FOR DATA MOVEMENT, BUT ALSO IS * J1101620
                    *   USED FOR COUNT OF RECORDS TO READ AFTER A     * J1101630
                    *   STORE CI DUP CONTROL RECORD.                  * J1101640
                    DATSW BSS     1         RECORDS VALUE IN CNT FIELD  J1101650
                    DBADR BSS     1         DB ADDR OF REFERENCED PROG  J1101660
                    DELSW BSS     1         ADDR OF REQ LET ENTRY - 1   J1101670
                    DFNSW BSS     1         NON ZERO IF DEFINE FXA      J1101680
                    DKSAD BSS     1         DK SCTR ADDR W/O DR CODE    J1101690
                    DUMPP BSS  E  2         LAST LIMITS FOR PRNTR DUMP  J1101700
                    FORSW BSS     1         NON ZERO IF DEFINE VOID FOR J1101710
                    FRWS  BSS     1         NON ZERO IF FROM FLD IS WS  J1101720
                    FXSW  BSS     1         NON ZERO IF FIXED AREA REQD J1101730
                    HOLSW BSS     1         NON ZERO IF NO CONV REQD    J1101740
                    IOSW  BSS     1         NON ZERO IF IN/OUT REQD     J1101750
                    *                                                 * J1101760
                    *   DUMPLET SWITCH - ZERO IF NOT DUMPLET/DUMPFLET * J1101770
                    *       PLUS VALUE REQUIRES PRINT OF BOTH LET/FLET* J1101780
                    *       NEG. VALUE REQUIRES PRINT OF FLET ONLY    * J1101790
                    LETSW BSS     1         NON ZERO,PRINT LET OR FLET* J1101800
                    LSTLF BSS     1         LAST LET/FLET SECT PROCESSD J1101810
                    MODSW BSS     1         NON ZERO IF STORE MOD FUNC  J1101820
                    NAMSW BSS     1         NON ZERO IF NAME IN LET/F   J1101830
                    NEGSW BSS     1         NON ZERO IF SHRINKING FXA   J1101840
                    PGMHL BSS     1         WORD COUNT OF THE PROG HDR  J1101850
                    PRSW  BSS     1         NON ZERO IF PRINTING OUTPUT J1101860
                    PTSW  BSS     1         NON ZERO IF PAPER TAPE REQD J1101870
                    SKWDS BSS     1         WDS TO SEARCH IN L/F SECT   J1101880
                    STCSW BSS     1         NON ZERO IF STORE DATA CI   J1101890
                    STSW  BSS     1         NON ZERO IF STORE TYPE      J1101900
                    TEMP1 BSS  E  1         1ST WD OF BINEB OUTPUT      J1101910
                    TEMP2 BSS     1         2ND WD OF BINEB OUTPUT      J1101920
                    TOWS  BSS     1         NON ZERO IF TO FIELD IS WS  J1101930
                    T3MSW BSS     1         TYPE 3,4 SOCAL LEVEL CELL   J1101940
                    UASW  BSS     1         NON ZERO IF USER AREA REQD  J1101950
                    WSSW  BSS     1         NON ZERO IF WORK STG REQD   J1101960
                    XEQSW BSS     1         NON ZERO IF NOT RET FR GET  J1101970
                    EBCSW BSS     1         NON ZERO IF EBC DATA OP 2E2 J1101980
                    HDNSW BSS     1         NON ZERO IF NAME IN HDR 2-8 J1101990
                    RPGSW BSS     1         NON Z IF DEFINE VOID RPG2-8 J1102000
                    DFLSW BSS     1         NON ZERO IF *DFILE      2-8 J1102010
                          BSS     1         RESERVED FOR ADDITION   2-8 J1102020
                    CL2   EQU     *-1                                   J1102030
                          HDNG    KFACE-    CATCO DUP SWITCHES          J1102040
                    *************************************************** J1102050
                    *                                                 * J1102060
                    *             CATCO DUP SWITCHES                  * J1102070
                    *  INITIALIZED BY DCTL AND NOT RESET BY .REST.    * J1102080
                    *                                                 * J1102090
                    *************************************************** J1102100
                    IOREQ BSS     1         MON-ZERO,AUX I/O SET REQ    J1102110
                    PH2   BSS     1         NON-ZERO IF DCTL IN CORE    J1102120
                    PH3   BSS     1         NON-ZERO IF STORE IN CORE   J1102130
                    PH4   BSS     1         NON-ZERO IF DUMP IN CORE    J1102140
                    ************************************************2-8 J1102150
                    *                                               2-8 J1102160
                    *             CATCO SWITCH INITIALIZED TO ZERO  2-8 J1102170
                    *   BY CCAT SUBR AND SET BY MACRO UPDATE PROGRAM2-8 J1102180
                    *                                               2-8 J1102190
                    ************************************************2-8 J1102200
                    DUPCR BSS     1         NON ZERO IF DUP CTRL RCD2-8 J1102210
                    *************************************************** J1102220
                    *                                                 * J1102230
                    *             CATCO DUP SWITCHES SET BY CCAT SUBR * J1102240
                    *                                                 * J1102250
                    *************************************************** J1102260
                    ADDR2 BSS     1         KB INTERRUPT ADDRESS        J1102270
                    KBREQ BSS     1         CONTENTS OF LOC 13          J1102280
                    *      THE FOLLOWING SWITCH IS SET TO INDICATE THE  J1102290
                    *       PRINCIPAL INPUT DEVICE                      J1102300
                    *             -  IS PAPER TAPE                      J1102310
                    *             0  IS CARD                            J1102320
                    *             +  IS KEYBOARD                        J1102330
                    INOUT BSS     1         PRINCIPAL INPUT SWITCH      J1102340
                    *                                                   J1102350
                    PTPON BSS     1         NON-ZERO IF PAPER TP ON SYS J1102360
                    *************************************************** J1102370
                    *                                                 * J1102380
                    *             LEVEL 4 INTERRUPT BRANCH TABLE      * J1102390
                    *             ADDRESSES. INITIALIZED BY CCAT,     * J1102400
                    *             AND CARD/PAPER TAPE INTERFACES.     * J1102410
                    *                                                 * J1102420
                    *************************************************** J1102430
                          ORG     /0049                                 J1102440
                    IBT   BSS     9         9 WD INTRPT BRANCH TABLE    J1102450
                    *************************************************** J1102460
                    *                                                 * J1102470
                    *             CATCO I/O ADDRESSES REQUIRED BY DUP * J1102480
                    *                                                 * J1102490
                    *************************************************** J1102500
                    P1442 BSS  E  2         SYS 1442 IOAR HEADER        J1102510
                    PRPAR BSS     2         DEFAULT LIMITS TO PRINT     J1102520
                    PHDUP BSS     1         LAST DUP PHASE IN CORE      J1102530
                    CRBUF BSS     1         81 WD BFR FOR DUP CTRL RCDS J1102540
                    DCADR BSS     1         ADDR FOR DUP CTRL IOAR HDR  J1102550
                    HDBUF BSS     1         ADDR OF PAGE HEADING BFR    J1102560
                    IOBLK BSS     1         ADDR OF DUP I/O PHASE       J1102570
                    SDBUF BSS     1         STORE/DUMP BUFFER           J1102580
                    LETAR BSS     1         ADDR OF LET SEARCH BUFFER   J1102590
                    PEBUF BSS     1         41 WD BFR FOR PACKED EBCDIC J1102600
                    THIS  BSS     1         ADDR OF DOUBLE BFR, BFR 1   J1102610
                    NEXT  BSS     1         ADDR OF DOUBLE BFR, BFR 2   J1102620
                          HDNG              DUP CORE PARAMETERS         J1102630
                    DISKZ EQU     DZ000     DISKZ ENTRY POINT           J1102640
                    B     EQU     $ZEND-2                               J1102650
                    DMPLC EQU     B         IOAR CORE ADDR FOR DMPLT    J1102660
                    EXITC EQU     B         IOAR CORE ADDR FOR DEXIT    J1102670
                    MUPC  EQU     B         IOAR CORE ADDR FOR MUP  2-8 J1102680
                    DCTL  EQU     B+/1002   ENTRY ADDRESS OF DCTL       J1102690
                    DCTLC EQU     B+/1000   IOAR CORE ADDR FOR DCTL     J1102700
                    WSDC  EQU     B+/2000   IOAR CORE ADDR FOR STORE    J1102710
                    DUMPC EQU     B+/4000   IOAR CORE ADDR FOR DDUMP    J1102720
                    DUPCO EQU     /7DB0     ADDR OF RESIDENT DUPCO      J1102730
                    CATCO EQU     /7F20-2   ADDR OF DCOM IOAR HEADER    J1102740
                    *                                                 * J1102750
                    *  DUPCO ENTRY POINTS...USED WITH INDIRECT BSI    * J1102760
                    *                                                 * J1102770
                          ORG     DUPCO                                 J1102780
                    BINEB BSS     1         CONVERSION BINARY TO EBCDIC J1102790
                    WRTDC BSS     1         WRITE DCOM(S) SUBROUTINE    J1102800
                    ENTER BSS     1         SAVE XR-S AND CONDITIONS    J1102810
                    GET   BSS     1         READ FROM DISK USING DISKZ  J1102820
                    LEAVE BSS     1         HANDLES ALL EXITS FROM DUP  J1102830
                    LINE  BSS     1         SPACES PRINTER 1 LINE       J1102840
                    MASK  BSS     1         INHIBITS KB INT REQUEST     J1102850
                    MDUMP BSS     1         PRINTS SELECTED CORE LOC-S  J1102860
                    PAGE  BSS     1         SKIPS TO NEXT PAGE          J1102870
                    PHID  BSS     1         RECORDS PHASE ID            J1102880
                    PHIDM BSS     1         RECORDS PHASE AND MODIFIER  J1102890
                    PRINT BSS     1         USE SYS PR SUBR TO PRINT    J1102900
                    PUT   BSS     1         WRITES TO DISK USING DISKZ  J1102910
                    REST  BSS     1         RESTORE CATCO,GO TO DCTL    J1102920
                    RTURN BSS     1         RESTORE XR-S AND CONDITIONS J1102930
                    *                                                 * J1102940
                    *  INPUT/OUTPUT PARAMETERS , CORE ADDRESSES       * J1102950
                    *                                                 * J1102960
                    BUF6  EQU     DUPCO-/1F ADDR OF PAGE HEADING BUFFER J1102970
                    PRPNT EQU     BUF6-/141 IOAR ADDR FOR PRINC. PTR    J1102980
                    IOADR EQU     BUF6-/38B START OF I/O INTERFACE      J1102990
                    GETHO EQU     IOADR+4   ENTRY FOR READING HOLL TYPE J1103000
                    GETBI EQU     IOADR+5   ENTRY FOR READING BINARY    J1103010
                    PACKB EQU     IOADR+6   ENTRY TO PACK BINARY        J1103020
                    PCHBI EQU     IOADR+7   ENTRY TO PUNCH BINARY       J1103030
                    BUF1  EQU     IOADR-/51 ADDR OF NEXT BUFFER         J1103040
                    BUF2  EQU     BUF1-/52  ADDR OF THIS BUFFER         J1103050
                    BUF3  EQU     BUF2-/3E  ADDR OF PACKED EBC BUFFER   J1103060
                    BUF4  EQU     BUF3-/52  ADDR OF CONTROL RCD BUFFER  J1103070
                    BUF5  EQU     IOADR-/284   ADDR OF LET SCTR BFR     J1103080
                    BUF7  EQU     BUF5-/7142   ADDR OF STORE/DUMP BFR   J1103090
                          HDNG    KFACE  DUP KEYBOARD INTERFACE         J1103100
                    *************************************************** J1103110
                    *                                                 * J1103120
                    *STATUS - VERSION 2, MODIFICATION 8               * J1103130
                    *                                                 * J1103140
                    *FUNCTION/OPERATION-                              * J1103150
                    *   *KFACE SERVES AS THE I/O INTERFACE FOR DUP    * J1103160
                    *    WHEN THE PRINCIPAL I/O DEVICE IS THE KEYBOARD* J1103170
                    *    IT INPUTS UP TO 80 CHARACTERS FROM THE TYPE- * J1103180
                    *    WRITER AND CONVERTS FROM UNPACKED TO PACKED  * J1103190
                    *    EBCDIC. CONDITIONS AND REGISTERS ARE SAVED.  * J1103200
                    *                                                 * J1103210
                    *ENTRY POINTS-                                    * J1103220
                    *   *KFACE HAS ONE ENTRY POINT, IK000, WHICH MAY  * J1103230
                    *    BE REFERENCED BY  BSI  I  GETHO.             * J1103240
                    *                                                 * J1103250
                    *INPUT-N/A                                        * J1103260
                    *                                                 * J1103270
                    *OUTPUT-                                          * J1103280
                    *   *CRBUF- 81 WORDS. THE FIRST WORD WILL CONTAIN * J1103290
                    *    A WORD COUNT OF 80 FOLLOWED BY 80 WORDS OF   * J1103300
                    *    UNPACKED EBCDIC.                             * J1103310
                    *                                                 * J1103320
                    *   *PEBUF- 41 WORDS. THE FIRST WORD WILL CONTAIN * J1103330
                    *    A WORD COUNT OF 40 FOLLOWED BY 40 WORDS OF   * J1103340
                    *    PACKED EBCDIC.                               * J1103350
                    *                                                 * J1103360
                    *EXTERNAL REFERENCES-                             * J1103370
                    *   *THE FOLLOWING REFERENCES ARE MADE TO CATCO   * J1103380
                    *   *IOADR                                        * J1103390
                    *   *CRBUF                                        * J1103400
                    *   *PEBUF                                        * J1103410
                    *EXTERNAL ROUTINES-                               * J1103420
                    *   *KBSYS- ISS USED TO INPUT FROM THE TYPEWRITER.* J1103430
                    *   *ENTER- IN DPCO- USED TO SAVE REGISTERS.      * J1103440
                    *   *RTURN- IN DPCO- USED TO RESTORE REGISTERS.   * J1103450
                    *                                                 * J1103460
                    *EXITS-                                           * J1103470
                    *   *NORMAL- A BSC  I  IK000 IS EXECUTED TO RETURN* J1103480
                    *    TO DCTL                                      * J1103490
                    *                                                 * J1103500
                    *   *ERROR- NONE OTHER THAN THOSE OF KBSYS        * J1103510
                    *                                                 * J1103520
                    *TABLES/WORK AREAS-N/A                            * J1103530
                    *                                                 * J1103540
                    *ATTRIBUTES-                                      * J1103550
                    *   *ABSOLUTE. KFACE IS ASSEMBLED AT SYMBOLIC     * J1103560
                    *    LOCATION .IOADR., IT IS BROUGHT INTO CORE BY * J1103570
                    *    THE CCAT MODULE OF DUPCO AND IS THEN RESIDENT* J1103580
                    *    AS LONG AS DUP MAINTAINS CONTROL.            * J1103590
                    *                                                 * J1103600
                    *NOTES-                                           * J1103610
                    *   *KFACE HAS NO WAITS                           * J1103620
                    *                                                 * J1103630
                    *************************************************** J1103640
                          HDNG    KFACE  DUP KEYBOARD INTERFACE         J1103650
                          ORG     IOADR                                 J1103660
                          DC      *-*       WD. CNT. SET BY SYSTEM LDR  J1103670
                          DC      11        PHASE ID FOR KFACE          J1103680
                          DC      *-*       ADDR OF SYSTEM I/O SUBR     J1103690
                          DC      *-*       ADDR OF SYSTEM CONVERSION   J1103700
                    *                                                   J1103710
                    **************************************************  J1103720
                    *  THE FOLLOWING 5 WORDS ARE ADDRESSES OF THE I/O   J1103730
                    *  INTERFACE ENTRY POINTS -- GETHO IS THE ONLY      J1103740
                    *  LEGAL ENTRY                                      J1103750
                    **************************************************  J1103760
                    *                                                   J1103770
                          DC      IK000     ENTRY FOR GETHO             J1103780
                          DC      *-*       DUMMY ENTRY                 J1103790
                          DC      *-*       DUMMY ENTRY                 J1103800
                          DC      *-*       DUMMY ENTRY                 J1103810
                    *                                                   J1103820
                    *                                                   J1103830
                    IK000 DC      *-*       GETHO ENTRY                 J1103840
                          BSI  I  PHIDM     MODIFY PHASE ID             J1103850
                          DC      /0A00     KEYBOARD INPUT MODIFIER     J1103860
                          BSI  I  ENTER     SAVE REGISTERS              J1103870
                    *                                                   J1103880
                          LD      IK080     SET WORD COUNT OF 80        J1103890
                          STO  I1 CRBUF     *FOR KBSYS                  J1103900
                    *                                                   J1103910
                          LD      IK040     SET WORD COUNT OF 40        J1103920
                    * INPUT CONTROL RECORD VIA TYPEWRITER               J1103930
                    *                                                   J1103940
                          STO  I1 PEBUF     *INTO PACKED BUFFER         J1103950
                    *                                                   J1103960
                          LD    1 PEBUF     FETCH ADDRESS OF THE PACKED J1103970
                          STO     IK020     *BUFFER                     J1103980
                    *                                                   J1103990
                          LD    1 CRBUF     FETCH ADDRESS OF THE INPUT  J1104000
                          STO     IK010     *BUFFER, SAVE IT, SET EXT   J1104010
                          RTE     16        *WITH ADDR OF WORD COUNT    J1104020
                          LD      I7002     FETCH FUNCTION CODE (7002)  J1104030
                          BSI  I  IK000-6   INPUT CONTROL RECORD        J1104040
                          LD   L  $IBSY                                 J1104050
                          BSC  L  *-4,Z     WAIT FOR READ COMPLETE      J1104060
                    *                                                   J1104070
                          LDX   3 40        LOOP WORD COUNT             J1104080
                          LDX  L1 *-*       SET WITH ADDR IN CRBUF      J1104090
                    IK010 EQU     *-1                                   J1104100
                          LDX  L2 *-*       SET WITH ADDR IN PEBUF      J1104110
                    IK020 EQU     *-1                                   J1104120
                          MDX   1 1         POINT TO 2ND WORD IN CRBUF  J1104130
                          MDX   2 1         POINT TO 2ND WORD IN PEBUF  J1104140
                    *                                                   J1104150
                    * CONVERT UNPACKED EBCDIC IN CRBUF TO PACKED        J1104160
                    * EBCDIC IN PEBUF                                   J1104170
                    *                                                   J1104180
                    IK030 LD    1 1         PACK TWO                    J1104190
                          SRT     8         *CHARACTERS                 J1104200
                          LD    1 0         *INTO ONE WORD              J1104210
                          SLT     8                                     J1104220
                          STO   2 0                                     J1104230
                          MDX   1 2                                     J1104240
                          MDX   2 1                                     J1104250
                          MDX   3 -1        SKIP IF 80 WDS PACKED TO 40 J1104260
                          MDX     IK030     *BRANCH OTHERWISE           J1104270
                    *                                                   J1104280
                          BSI  I  RTURN     RESTORE REGISTERS           J1104290
                          BSC  I  IK000     RETURN TO DCTL              J1104300
                    *                                                   J1104310
                    **************************************************  J1104320
                    *                                                   J1104330
                    *  CONSTANTS                                        J1104340
                    *                                                   J1104350
                    **************************************************  J1104360
                    *                                                   J1104370
                    IK040 DC      40        WD CNT -1 OF PEBUF          J1104380
                    IK080 DC      80        WD CNT -1 OF CRBUF          J1104390
                    I7002 DC      /7002     FUNCTION CODE FOR KBSYS     J1104400
                    *                                                   J1104410
                    **************************************************  J1104420
                    **************************************************  J1104430
                          END     IK000                                 J1104440
