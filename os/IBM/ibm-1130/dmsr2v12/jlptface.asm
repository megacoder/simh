                          HDNG    PFACE-    RESIDENT COMMA   2 AUG 67   J1200010
                          ABS                                           J1200020
                    $CIBA EQU     /5   ADDR OF CIB ON MASTER CARTRIDGE  J1200030
                    $CH12 EQU     /6   CHANNEL 12 INDR,NON-ZERO=CHAN 12 J1200040
                    $COMN EQU     /7   WORD COUNT OF COMMON             J1200050
                    $CORE EQU     /E   CORE SIZE,/1000=4K,/2000=8K,ETC) J1200060
                    $CTSW EQU     /F   MCR SW,NON-ZERO=// RECD TRAPPED  J1200070
                    $DADR EQU     /10  SCTR ADDR OF PROG TO BE FETCHED  J1200080
                    $DABL EQU     /11  IOCC FOR SCA RESET (ODD ADDR)    J1200090
                    $DREQ EQU     /12  INDR FOR REQUESTED V. DISK I/O   J1200100
                    $IBSY EQU     /13  PRINC I/O BUSY INDR,NON-ZERO=BSY J1200110
                    $HASH EQU     /14  WORK AREA FOR MONITOR PROGRAMS   J1200120
                    $PRET EQU     /28  ADDR PREOPERATIVE ERROR TRAP     J1200130
                    $IREQ EQU     /2C  ADDR OF INT REQUEST SUBROUTINE   J1200140
                    $ULET EQU     /2D  ADDR OF LET, LOGICAL DRIVE 0     J1200150
                    $IOCT EQU     /32  IOCS CTR,0=NO I/O IN PROGRESS    J1200160
                    $LAST EQU     /33  LAST CD INDR,NON-ZERO=LAST CARD  J1200170
                    $NDUP EQU     /34  INHIBIT DUP SW,NON-ZERO=NO DUP   J1200180
                    $NXEQ EQU     /35  INHIBIT EXEC SW,NON-ZERO=NO EXEQ J1200190
                    $PBSY EQU     /36  PRINC PTR BUSY INDR,NON-ZERO=BSY J1200200
                    $PGCT EQU     /37  PAGE NO. FOR PAGE HEADINGS       J1200210
                    $EXIT EQU     /38  ADDR CALL EXIT ENTRY POINT       J1200220
                    $LINK EQU     /39  ADDR CALL LINK ENTRY POINT       J1200230
                    $DUMP EQU     /3F  ADDR OF CALL DUMP, ENTRY POINT   J1200240
                    $DCDE EQU     /77  DRIVE CODE FOR CORE LOAD BLDR    J1200250
                    $PHSE EQU     /78  NO. OF PHASE CURRENTLY IN CORE   J1200260
                    $UFIO EQU     /79  ARM POSITION IN UNFORMATTED AREA J1200270
                    $WSDR EQU     /7A  WORKING STORAGE DRIVE CODE       J1200280
                    $WRD1 EQU     /7B  LOAD ADDR FOR CURR USER CORE LD  J1200290
                    $KCSW EQU     /7C  INHIBIT INPUT/PRINT OVERLAP SW   J1200300
                    $UFDR EQU     /7D  UNFORMATTED I/O DRIVE CODE       J1200310
                    $CPTR EQU     /7E  CHANNEL 12 INDICATOR FOR CP      J1200320
                    $1132 EQU     /7F  CHANNEL 12 INDICATOR FOR 1132    J1200330
                    $1403 EQU     /80  CHANNEL 12 INDICATOR FOR 1403    J1200340
                    $PST1 EQU     /81  ADDR POSTOP ERROR TRAP,LEVEL 1   J1200350
                    $PST2 EQU     /85  ADDR POSTOP ERROR TRAP,LEVEL 2   J1200360
                    $PST3 EQU     /89  ADDR POSTOP ERROR TRAP,LEVEL 3   J1200370
                    $PST4 EQU     /8D  ADDR POSTOP ERROR TRAP,LEVEL 4   J1200380
                    $STOP EQU     /91  ADDR PROGRAM STOP KEY TRAP       J1200390
                    $FPAD EQU     /95  FILE PROTECT ADDR (ADJ),LOG DR 0 J1200400
                    $CYLN EQU     /9A  ARM POSITION FOR LOGICAL DRIVE 0 J1200410
                    $ACDE EQU     /9F  AREA CODE FOR LOGICAL DRIVE 0    J1200420
                    $DCYL EQU     /A4  1ST DEF CYL ADDR, LOGICAL DR 0   J1200430
                    $I200 EQU     /B3  ENTRY POINT TO ILS FOR LEVEL 2   J1200440
                    $I205 EQU     /B8                                   J1200450
                    $IBT2 EQU     $I205+1 ADDR OF IBT FOR LEVEL 2       J1200460
                    $I400 EQU     /C4  ENTRY POINT TO ILS FOR LEVEL 4   J1200470
                    $I405 EQU     /D3                                   J1200480
                    $IBT4 EQU     $I405+1 ADDR OF IBT FOR LEVEL 4       J1200490
                    $I410 EQU     /D5                                   J1200500
                    $DBSY EQU     /EE  DISK BUSY INDR,NON-ZERO=DK BUSY  J1200510
                    $BYSW EQU     /1CB BYPASS SW,NOP IF FETCHING SOCAL  J1200520
                    DZ000 EQU     /0F2 DISKZ ENTRY POINT                J1200530
                    $ZEND EQU     /1E0 ADDR 1+LAST WORD OF DISKZ        J1200540
                          HDNG          CONCATENATED COMMON AREA(CATCO) J1200550
                    C     EQU     /7FA0     CATCO POINTER SET TO MIDDLE J1200560
                    *************************************************** J1200570
                    *                                                 * J1200580
                    *  INDEX REG 1 IS SET TO .C. WHEN CATCO IS FORMED * J1200590
                    *  FOR USE BY ALL OF DUP FUNCTIONS. ANY DUP ROUT  * J1200600
                    *  USING XR 1 FOR OTHER REASONS MUST RESTORE.     * J1200610
                    *  ALL VALUES IN CATCO HAVE LABELS EQUATED TO THE * J1200620
                    *  VALUE THAT INDICATES THEIR RELATIVE LOCATION   * J1200630
                    *  FROM .C.                                       * J1200640
                    *                                                 * J1200650
                    *************************************************** J1200660
                    *                                                 * J1200670
                    *             CATCO DCOM IMAGE                    * J1200680
                    *   EQUIVALENCES USED TO REFERENCE CATCO WITH XR1 * J1200690
                    *                                                 * J1200700
                    *************************************************** J1200710
                    #NAME EQU     4-/80     NAME OF PROGRAM             J1200720
                    #DBCT EQU     6-/80     DISK BLOCK COUNT OF PROGRAM J1200730
                    #FCNT EQU     7-/80     FILES SW,ZERO = NO FILES    J1200740
                    #SYSC EQU     8-/80     NON-ZERO,SYSTEM CARTRIDGE   J1200750
                    #JBSW EQU     9-/80     JOB SW,NON-ZERO='T' MODE    J1200760
                    #CBSW EQU     10-/80    CLB SW,NON-ZERO=STORECI     J1200770
                    #LCNT EQU     11-/80    NO. OF LOCALS               J1200780
                    #MPSW EQU     12-/80    NON-ZERO, CORE MAP DESIRED  J1200790
                    #MDF1 EQU     13-/80    NO. OF DUP CTRL RCDS        J1200800
                    #MDF2 EQU     14-/80    ADDR OF MODIF BUFFER        J1200810
                    #NCNT EQU     15-/80    NO. OF NOCALS               J1200820
                    #ENTY EQU     16-/80    RELATIVE ENTRY ADDR OF PROG J1200830
                    #RP67 EQU     17-/80    IF NON-ZERO,1442 MOD 6,7    J1200840
                    *                                                   J1200850
                    *   NEGATIVE VALUE REPRESENTS DEFAULT CONDITION   * J1200860
                    #TODR EQU     18-/80    DR CODE OF 'TO' DRIVE       J1200870
                    #FRDR EQU     19-/80    DR CODE OF 'FROM' DRIVE     J1200880
                    *                                                 * J1200890
                    #FHOL EQU     20-/80    ADDR OF LARGEST FXA HOLE    J1200900
                    #FSZE EQU     21-/80    BLK CNT LARGEST HOLE IN FXA J1200910
                    #UHOL EQU     22-/80    ADDR OF LARGEST UA HOLE     J1200920
                    #USZE EQU     23-/80    BLK CNT LARGEST HOLE IN UA  J1200930
                    #DCSW EQU     24-/80    NON-ZERO=DUP CALL           J1200940
                    #PIOD EQU     25-/80    PRINC. I/O INDICATOR        J1200950
                    #PPTR EQU     26-/80    PRINC. PRINTER INDICATOR    J1200960
                    #CIAD EQU     27-/80    WD NO. SCTR 0,CIL ADDR      J1200970
                    #ACIN EQU     28-/80    AVAILABLE CARTRIDGE INDR2-8 J1200980
                    #GRPH EQU     29-/80    2250 INDICATOR          2-8 J1200990
                    #GCNT EQU     30-/80    NO. G2250 RECORDS       2-8 J1201000
                    #LOSW EQU     31-/80    LOCAL-CALLS-LOCAL INDR  2-8 J1201010
                    #X3SW EQU     32-/80    SPECIAL ILS SWITCH      2-8 J1201020
                    #ECNT EQU     33-/80    NO. OF EQUAT RCDS       2-8 J1201030
                    #ANDU EQU     35-/80    END OF UA (ADJ) LOG DR 0-4  J1201040
                    #BNDU EQU     40-/80    END OF UA (BASE) LOG DR 0-4 J1201050
                    #FPAD EQU     45-/80    FILE PROTECT ADDR (BASE)    J1201060
                    #PCID EQU     50-/80    CART ID, PHYS DR 0-4        J1201070
                    #CIDN EQU     55-/80    CART ID, LOG DR 0-4         J1201080
                    #CIBA EQU     60-/80    CIB ADDR, LOG DR 0-4        J1201090
                    #SCRA EQU     65-/80    SCRA, LOG DR 0-4            J1201100
                    #FMAT EQU     70-/80    WS FORMAT, LOG DR 0-4       J1201110
                    #FLET EQU     75-/80    FLET ADDR, LOG DR 0-4       J1201120
                    #ULET EQU     80-/80    LET ADDR, LOG DR 0-4        J1201130
                    #WSCT EQU     85-/80    WS BLK CNT, LOG DR 0-4      J1201140
                    #CSHN EQU     90-/80    CUSHION END SCTR ADDR, 0-4  J1201150
                    #DCOM EQU     1         SCTR ADDR OF DCOM           J1201160
                    #HDNG EQU     7         SCTR WITH PAGE HEADING      J1201170
                    @SBFR EQU     /FB0                              2-8 J1201180
                          HDNG    CONCATENATED COMMON AREA (CATCO)      J1201190
                    *************************************************** J1201200
                    *                                                 * J1201210
                    *             CATCO IOAR HDRS FOR DUP PHASES        J1201220
                    *                                                 * J1201230
                    *************************************************** J1201240
                          ORG     -/10                                  J1201250
                    DCHDR BSS     2         DUP CONTROL            PH02 J1201260
                    STHDR BSS     2         STORE                  PH03 J1201270
                    FLHDR BSS     2         FILEQ                  PH04 J1201280
                    DMHDR BSS     2         DUMP                   PH05 J1201290
                    DLHDR BSS     2         DUMPLET                PH06 J1201300
                    DTHDR BSS     2         DELETE                 PH07 J1201310
                    DFHDR BSS     2         DEFINE                 PH08 J1201320
                    DXHDR BSS     2         DUP EXIT               PH09 J1201330
                    UCHDR BSS     2         DUP UPCOR              PH13 J1201340
                    PIHDR BSS     2         PRINCIPAL I/O BLOCK    PH14 J1201350
                    SIHDR BSS     2         PRINC I/O (W/O KB) BLK PH15 J1201360
                    PTHDR BSS     2         PAPER TAPE I/O BLOCK   PH16 J1201370
                    CIHDR BSS     2         CI PHASE READ BY CL BUILDER J1201380
                    MUHDR BSS     2         MACRO UPDATE      PH206 2-8 J1201390
                    D2HDR BSS     2         DUP CONTROL 2     PH205 2-8 J1201400
                          HDNG    PFACE-    CATCO DUP SWITCHES          J1201410
                    *************************************************** J1201420
                    *                                                   J1201430
                    *             CATCO DUP SWITCHES                  * J1201440
                    *      WORDS USED FOR COMMUNICATION OF DATA         J1201450
                    *   BETWEEN DUP ROUTINES.                           J1201460
                    *                                                 * J1201470
                    *      INITIALIZED TO ZERO BY  .REST. OF DUPCO    * J1201480
                    *                                                   J1201490
                    *************************************************** J1201500
                    CL1   EQU     *                                     J1201510
                    ASMSW BSS     1         NON ZERO IF DEFINE VOID ASM J1201520
                    BITSW BSS     1         NON ZERO TO ALLOW MDUMP-S   J1201530
                    BLKSW BSS     1         NON ZERO IF BYPASSING REC   J1201540
                    CIERR BSS     1         ERROR NO DETECTED BY PH 17  J1201550
                    CISW  BSS     1         NON ZERO IF STORE CI        J1201560
                    CLBSW BSS     1         NON ZERO IF PRECI EXECUTED  J1201570
                    CNTNO BSS     1         RECORD NO BEING PCHD OR RD  J1201580
                    *                                                 * J1201590
                    *   .DATSW. IS FILLED WITH THE CNT FIELD OF THE   * J1201600
                    *   DUP CONTROL RECORD.                           * J1201610
                    *   USED PRIMARILY FOR DATA MOVEMENT, BUT ALSO IS * J1201620
                    *   USED FOR COUNT OF RECORDS TO READ AFTER A     * J1201630
                    *   STORE CI DUP CONTROL RECORD.                  * J1201640
                    DATSW BSS     1         RECORDS VALUE IN CNT FIELD  J1201650
                    DBADR BSS     1         DB ADDR OF REFERENCED PROG  J1201660
                    DELSW BSS     1         ADDR OF REQ LET ENTRY - 1   J1201670
                    DFNSW BSS     1         NON ZERO IF DEFINE FXA      J1201680
                    DKSAD BSS     1         DK SCTR ADDR W/O DR CODE    J1201690
                    DUMPP BSS  E  2         LAST LIMITS FOR PRNTR DUMP  J1201700
                    FORSW BSS     1         NON ZERO IF DEFINE VOID FOR J1201710
                    FRWS  BSS     1         NON ZERO IF FROM FLD IS WS  J1201720
                    FXSW  BSS     1         NON ZERO IF FIXED AREA REQD J1201730
                    HOLSW BSS     1         NON ZERO IF NO CONV REQD    J1201740
                    IOSW  BSS     1         NON ZERO IF IN/OUT REQD     J1201750
                    *                                                 * J1201760
                    *   DUMPLET SWITCH - ZERO IF NOT DUMPLET/DUMPFLET * J1201770
                    *       PLUS VALUE REQUIRES PRINT OF BOTH LET/FLET* J1201780
                    *       NEG. VALUE REQUIRES PRINT OF FLET ONLY    * J1201790
                    LETSW BSS     1         NON ZERO,PRINT LET OR FLET* J1201800
                    LSTLF BSS     1         LAST LET/FLET SECT PROCESSD J1201810
                    MODSW BSS     1         NON ZERO IF STORE MOD FUNC  J1201820
                    NAMSW BSS     1         NON ZERO IF NAME IN LET/F   J1201830
                    NEGSW BSS     1         NON ZERO IF SHRINKING FXA   J1201840
                    PGMHL BSS     1         WORD COUNT OF THE PROG HDR  J1201850
                    PRSW  BSS     1         NON ZERO IF PRINTING OUTPUT J1201860
                    PTSW  BSS     1         NON ZERO IF PAPER TAPE REQD J1201870
                    SKWDS BSS     1         WDS TO SEARCH IN L/F SECT   J1201880
                    STCSW BSS     1         NON ZERO IF STORE DATA CI   J1201890
                    STSW  BSS     1         NON ZERO IF STORE TYPE      J1201900
                    TEMP1 BSS  E  1         1ST WD OF BINEB OUTPUT      J1201910
                    TEMP2 BSS     1         2ND WD OF BINEB OUTPUT      J1201920
                    TOWS  BSS     1         NON ZERO IF TO FIELD IS WS  J1201930
                    T3MSW BSS     1         TYPE 3,4 SOCAL LEVEL CELL   J1201940
                    UASW  BSS     1         NON ZERO IF USER AREA REQD  J1201950
                    WSSW  BSS     1         NON ZERO IF WORK STG REQD   J1201960
                    XEQSW BSS     1         NON ZERO IF NOT RET FR GET  J1201970
                    EBCSW BSS     1         NON ZERO IF EBC DATA OP 2E2 J1201980
                    HDNSW BSS     1         NON ZERO IF NAME IN HDR 2-8 J1201990
                    RPGSW BSS     1         NON Z IF DEFINE VOID RPG2-8 J1202000
                    DFLSW BSS     1         NON ZERO IF *DFILE      2-8 J1202010
                          BSS     1         RESERVED FOR ADDITION   2-8 J1202020
                    CL2   EQU     *-1                                   J1202030
                          HDNG    PFACE-    CATCO DUP SWITCHES          J1202040
                    *************************************************** J1202050
                    *                                                 * J1202060
                    *             CATCO DUP SWITCHES                  * J1202070
                    *  INITIALIZED BY DCTL AND NOT RESET BY .REST.    * J1202080
                    *                                                 * J1202090
                    *************************************************** J1202100
                    IOREQ BSS     1         MON-ZERO,AUX I/O SET REQ    J1202110
                    PH2   BSS     1         NON-ZERO IF DCTL IN CORE    J1202120
                    PH3   BSS     1         NON-ZERO IF STORE IN CORE   J1202130
                    PH4   BSS     1         NON-ZERO IF DUMP IN CORE    J1202140
                    ************************************************2-8 J1202150
                    *                                               2-8 J1202160
                    *             CATCO SWITCH INITIALIZED TO ZERO  2-8 J1202170
                    *   BY CCAT SUBR AND SET BY MACRO UPDATE PROGRAM2-8 J1202180
                    *                                               2-8 J1202190
                    ************************************************2-8 J1202200
                    DUPCR BSS     1         NON ZERO IF DUP CTRL RCD2-8 J1202210
                    *************************************************** J1202220
                    *                                                 * J1202230
                    *             CATCO DUP SWITCHES SET BY CCAT SUBR * J1202240
                    *                                                 * J1202250
                    *************************************************** J1202260
                    ADDR2 BSS     1         KB INTERRUPT ADDRESS        J1202270
                    KBREQ BSS     1         CONTENTS OF LOC 13          J1202280
                    *      THE FOLLOWING SWITCH IS SET TO INDICATE THE  J1202290
                    *       PRINCIPAL INPUT DEVICE                      J1202300
                    *             -  IS PAPER TAPE                      J1202310
                    *             0  IS CARD                            J1202320
                    *             +  IS KEYBOARD                        J1202330
                    INOUT BSS     1         PRINCIPAL INPUT SWITCH      J1202340
                    *                                                   J1202350
                    PTPON BSS     1         NON-ZERO IF PAPER TP ON SYS J1202360
                    *************************************************** J1202370
                    *                                                 * J1202380
                    *             LEVEL 4 INTERRUPT BRANCH TABLE      * J1202390
                    *             ADDRESSES. INITIALIZED BY CCAT,     * J1202400
                    *             AND CARD/PAPER TAPE INTERFACES.     * J1202410
                    *                                                 * J1202420
                    *************************************************** J1202430
                          ORG     /0049                                 J1202440
                    IBT   BSS     9         9 WD INTRPT BRANCH TABLE    J1202450
                    *************************************************** J1202460
                    *                                                 * J1202470
                    *             CATCO I/O ADDRESSES REQUIRED BY DUP * J1202480
                    *                                                 * J1202490
                    *************************************************** J1202500
                    P1442 BSS  E  2         SYS 1442 IOAR HEADER        J1202510
                    PRPAR BSS     2         DEFAULT LIMITS TO PRINT     J1202520
                    PHDUP BSS     1         LAST DUP PHASE IN CORE      J1202530
                    CRBUF BSS     1         81 WD BFR FOR DUP CTRL RCDS J1202540
                    DCADR BSS     1         ADDR FOR DUP CTRL IOAR HDR  J1202550
                    HDBUF BSS     1         ADDR OF PAGE HEADING BFR    J1202560
                    IOBLK BSS     1         ADDR OF DUP I/O PHASE       J1202570
                    SDBUF BSS     1         STORE/DUMP BUFFER           J1202580
                    LETAR BSS     1         ADDR OF LET SEARCH BUFFER   J1202590
                    PEBUF BSS     1         41 WD BFR FOR PACKED EBCDIC J1202600
                    THIS  BSS     1         ADDR OF DOUBLE BFR, BFR 1   J1202610
                    NEXT  BSS     1         ADDR OF DOUBLE BFR, BFR 2   J1202620
                          HDNG              DUP CORE PARAMETERS         J1202630
                    DISKZ EQU     DZ000     DISKZ ENTRY POINT           J1202640
                    B     EQU     $ZEND-2                               J1202650
                    DMPLC EQU     B         IOAR CORE ADDR FOR DMPLT    J1202660
                    EXITC EQU     B         IOAR CORE ADDR FOR DEXIT    J1202670
                    MUPC  EQU     B         IOAR CORE ADDR FOR MUP  2-8 J1202680
                    DCTL  EQU     B+/1002   ENTRY ADDRESS OF DCTL       J1202690
                    DCTLC EQU     B+/1000   IOAR CORE ADDR FOR DCTL     J1202700
                    WSDC  EQU     B+/2000   IOAR CORE ADDR FOR STORE    J1202710
                    DUMPC EQU     B+/4000   IOAR CORE ADDR FOR DDUMP    J1202720
                    DUPCO EQU     /7DB0     ADDR OF RESIDENT DUPCO      J1202730
                    CATCO EQU     /7F20-2   ADDR OF DCOM IOAR HEADER    J1202740
                    *                                                 * J1202750
                    *  DUPCO ENTRY POINTS...USED WITH INDIRECT BSI    * J1202760
                    *                                                 * J1202770
                          ORG     DUPCO                                 J1202780
                    BINEB BSS     1         CONVERSION BINARY TO EBCDIC J1202790
                    WRTDC BSS     1         WRITE DCOM(S) SUBROUTINE    J1202800
                    ENTER BSS     1         SAVE XR-S AND CONDITIONS    J1202810
                    GET   BSS     1         READ FROM DISK USING DISKZ  J1202820
                    LEAVE BSS     1         HANDLES ALL EXITS FROM DUP  J1202830
                    LINE  BSS     1         SPACES PRINTER 1 LINE       J1202840
                    MASK  BSS     1         INHIBITS KB INT REQUEST     J1202850
                    MDUMP BSS     1         PRINTS SELECTED CORE LOC-S  J1202860
                    PAGE  BSS     1         SKIPS TO NEXT PAGE          J1202870
                    PHID  BSS     1         RECORDS PHASE ID            J1202880
                    PHIDM BSS     1         RECORDS PHASE AND MODIFIER  J1202890
                    PRINT BSS     1         USE SYS PR SUBR TO PRINT    J1202900
                    PUT   BSS     1         WRITES TO DISK USING DISKZ  J1202910
                    REST  BSS     1         RESTORE CATCO,GO TO DCTL    J1202920
                    RTURN BSS     1         RESTORE XR-S AND CONDITIONS J1202930
                    *                                                 * J1202940
                    *  INPUT/OUTPUT PARAMETERS , CORE ADDRESSES       * J1202950
                    *                                                 * J1202960
                    BUF6  EQU     DUPCO-/1F ADDR OF PAGE HEADING BUFFER J1202970
                    PRPNT EQU     BUF6-/141 IOAR ADDR FOR PRINC. PTR    J1202980
                    IOADR EQU     BUF6-/38B START OF I/O INTERFACE      J1202990
                    GETHO EQU     IOADR+4   ENTRY FOR READING HOLL TYPE J1203000
                    GETBI EQU     IOADR+5   ENTRY FOR READING BINARY    J1203010
                    PACKB EQU     IOADR+6   ENTRY TO PACK BINARY        J1203020
                    PCHBI EQU     IOADR+7   ENTRY TO PUNCH BINARY       J1203030
                    BUF1  EQU     IOADR-/51 ADDR OF NEXT BUFFER         J1203040
                    BUF2  EQU     BUF1-/52  ADDR OF THIS BUFFER         J1203050
                    BUF3  EQU     BUF2-/3E  ADDR OF PACKED EBC BUFFER   J1203060
                    BUF4  EQU     BUF3-/52  ADDR OF CONTROL RCD BUFFER  J1203070
                    BUF5  EQU     IOADR-/284   ADDR OF LET SCTR BFR     J1203080
                    BUF7  EQU     BUF5-/7142   ADDR OF STORE/DUMP BFR   J1203090
                          HDNG    PAPER TAPE INTERFACE (PFACE) PROLOGUE J1203100
                    *************************************************** J1203110
                    *                                                 * J1203120
                    *STATUS - VERSION 2, MODIFICATION 8               * J1203130
                    *                                                 * J1203140
                    *FUNCTION/OPERATION-THIS DUP MODULE SERVES AS AN  * J1203150
                    *   INTERFACE WITH I/O WHEN PAPER TAPE READING    * J1203160
                    *   OR PUNCHING IS REQUIRED. IT ENABLES VARIOUS   * J1203170
                    *   DUP FUNCTIONS TO PERFORM ONE OR MORE OF THE   * J1203180
                    *   FOLLOWING OPERATIONS.                         * J1203190
                    *                                                 * J1203200
                    *   *  READ A PAPER TAPE RECORD PUNCHED IN PTTC/8 * J1203210
                    *      CODE AND CONVERT THE CONTENTS TO PACKED    * J1203220
                    *      EBCDIC CHARACTERS.                         * J1203230
                    *   *  READ A PAPER TAPE RECORD PUNCHED IN BINARY,* J1203240
                    *      WITH CHECKSUMMING IF REQUIRED, AND PACK THE* J1203250
                    *      RECORD FROM ONE FRAME TO TWO FRAMES        * J1203260
                    *      PER WORD.                                  * J1203270
                    *   *  PUNCH A BINARY PAPER TAPE RECORD.          * J1203280
                    *                                                 * J1203290
                    *ENTRY POINTS-THERE ARE FIVE ENTRY POINTS, THREE  * J1203300
                    *   CORRESPONDING TO THE THREE FUNCTIONS DESCRIBED* J1203310
                    *   ABOVE, TWO SERVING AS DUMMIES TO MATCH        * J1203320
                    *   CARD INTERFACE. THE CALLING SEQUENCE IS AS    * J1203330
                    *   FOLLOWS-                                      * J1203340
                    *             BSI  I  GETHO                       * J1203350
                    *             BSI  I  GETBI                         J1203360
                    *             BSI  I  PACKB       (DUMMY ENTRY)     J1203370
                    *             BSI  I  PCHBI                         J1203380
                    *             -       -                             J1203390
                    *             -       -                             J1203400
                    *             -       -                             J1203410
                    *       GETHO DC      IP000                         J1203420
                    *       GETBI DC      IP140                         J1203430
                    *       PACKB DC      IP190                         J1203440
                    *       PCHBI DC      IP250                         J1203450
                    *                                                   J1203460
                    *INPUT-                                             J1203470
                    *   * GETHO-PTTC/8 PAPER TAPE RECORDS               J1203480
                    *   * GETBI-BINARY PAPER TAPE RECORDS               J1203490
                    *                                                   J1203500
                    *OUTPUT-(PCHBI) BINARY PAPER TAPE RECORDS           J1203510
                    *                                                   J1203520
                    *EXTERNAL REFERENCES-                               J1203530
                    *   SUBROUTINES                                     J1203540
                    *      * PHIDM-MODIFY PHASE ID                      J1203550
                    *      * ENTER-SAVE INDEX REGISTERS,CONDITIONS,     J1203560
                    *        AND ACCUMULATOR AND EXTENSION              J1203570
                    *      * RTURN-RESTORE INDEX REGISTERS,CONDITIONS,  J1203580
                    *        AND ACCUMULATOR AND EXTENSION              J1203590
                    *      * 1134/1055 SYSTEM PAPER TAPE SUBROUTINE     J1203600
                    *   COMMA/DCOM-N/A                                * J1203610
                    *                                                 * J1203620
                    *EXITS-                                           * J1203630
                    *   NORMAL-RETURN TO CALLING DUP MODULE BY MEANS  * J1203640
                    *   OF AN INDIRECT BSC INSTRUCTION WHERE THE      * J1203650
                    *   INDIRECT ADDRESS IS THE ENTRY POINT ADDRESS.  * J1203660
                    *                                                 * J1203670
                    *   ERROR-IF CHECKSUM ERROR IS DETECTED IN GETBI, * J1203680
                    *         AN EXIT IS MADE THRU LEAVE IN DUPCO.    * J1203690
                    *         DUP'S EXIT MODULE WILL PRINT THE        * J1203700
                    *         APPROPRIATE ERROR MESSAGE. IF THE WORD  * J1203710
                    *         COUNT EXCEEDS 54 IN GETBI OR PCHBI      * J1203720
                    *         EXIT IS MADE THRU LEAVE FOR THE PRINTING* J1203730
                    *         OF THE APPROPRIATE ERROR MESSAGE.       * J1203740
                    *                                                 * J1203750
                    *TABLES/WORK AREAS-                               * J1203760
                    *   * GETHO- USES AN 81 WORD BUFFER SPECIFIED     * J1203770
                    *            BY CRBUF IN CATCO                    * J1203780
                    *   * GETBI- USES A ONE WORD BUFFER TO CONTAIN    * J1203790
                    *            THE WORD COUNT OF THE RECORD TO BE   * J1203800
                    *            READ, AND THEN USES A 162 WORD BUFFER* J1203810
                    *            SPECIFIED BY THIS IN CATCO.          * J1203820
                    *   * PCHBI- USES AN 162 WORD BUFFER SPECIFIED    * J1203830
                    *            BY THIS IN CATCO.                    * J1203840
                    *                                                 * J1203850
                    *ATTRIBUTES-                                      * J1203860
                    *   SERIALLY REUSEABLE                            * J1203870
                    *                                                 * J1203880
                    *NOTES-                                           * J1203890
                    *   THIS INTERFACE BECOMES PART OF DUP PHASE 16   * J1203900
                    *   IF PAPER TAPE IS INCLUDED IN THE SYSTEM       * J1203910
                    *   CONFIGURATION.  PHASE 16 IS CONSTRUCTED BY    * J1203920
                    *   THE CCAT SUBROUTINE OF DUPCO.                 * J1203930
                    *                                                 * J1203940
                    *************************************************** J1203950
                          HDNG    PFACE--DUP 1134/1055 INTERFACE        J1203960
                          ORG     IOADR                                 J1203970
                          DC      *-*       WD CNT FILLED BY SYS LDR    J1203980
                          DC      12        PHASE ID FOR PAPT INTERFACE J1203990
                          DC      *-*       ADDR OF SYS PAPT SUBROUTINE J1204000
                          DC      *-*       WASTE ONE WORD              J1204010
                    *************************************************** J1204020
                    *                                                 * J1204030
                    *   THE FOLLOWING 5 WORDS ARE ADDRESSES OF THE I/O* J1204040
                    *   INTERFACE ENTRY POINTS -- GETHO,CONV,GETBI,   * J1204050
                    *   PACKB, AND PCHBI.                             * J1204060
                    *                                                 * J1204070
                    *************************************************** J1204080
                          DC      IP000     ENTRY FOR GETHO             J1204090
                          DC      IP140     ENTRY FOR GETBI             J1204100
                          DC      IP190     ENTRY FOR PACKB             J1204110
                          DC      IP250     ENTRY FOR PCHBI             J1204120
                    *************************************************** J1204130
                    *                                                 * J1204140
                    *   SUBROUTINE ENTERED VIA GETHO. THIS SUBROUTINE * J1204150
                    *   READS A RECORD, CHECKS TO SEE IF IT CONTAINS  * J1204160
                    *   //,*S, OR *D, IN THE FIRST TWO COLUMNS, IF SO,* J1204170
                    *   THE RECORD IS CONVERTED TO PACKED EBC         * J1204180
                    *   (VIA IP   ).                                  * J1204190
                    *                                                 * J1204200
                    *************************************************** J1204210
                    IP000 DC      *-*       GETHO ENTRY POINT           J1204220
                          BSI  I  PHIDM     MODIFY PHASE ID             J1204230
                          DC      /0900     INPUT INTERFACE MODIFIER    J1204240
                          BSI  I  ENTER     SAVE REGISTERS,CONDITIONS   J1204250
                    *                                                 * J1204260
                          LDX   3 0         SET SWITCH FOR READING      J1204270
                          LD    1 CRBUF     ADDR OF I/O AREA IN ACC     J1204280
                          BSI     IP080     GO READ PTTC/8 RECORD       J1204290
                          LD    1 EBCSW     SKIP //,*D,*M,*S TEST   2-8 J1204300
                          BSC  L  IP040,Z   *IF EBCSW SET (BY MUP)  2-8 J1204310
                          LD    2 +1        CHECK FRAME 1 FOR SLASH     J1204320
                          S       IP916                                 J1204330
                          BSC  L  IP030,Z   BRANCH IF 1ST FRAME NOT /   J1204340
                    *                                                 * J1204350
                          LD    2 +2        CHECK FRAME 2 FOR SLASH     J1204360
                          S       IP916                                 J1204370
                          BSC  L  IP040,+-  BRANCH IF FRAMES 1,2 ARE // J1204380
                    *                                                 * J1204390
                    IP010 STO   1 BLKSW     SET BLANK RCD SW NON-ZERO   J1204400
                    IP020 BSI  I  RTURN     RESTORE XR'S,CONDITIONS     J1204410
                          BSC  I  IP000     EXIT GETHO                  J1204420
                    *                                                 * J1204430
                    IP030 S       IP920     CHECK FRAME 1 FOR ASTERISK  J1204440
                          BSC  L  IP010,Z   BR IF 1ST FRAME NOT *       J1204450
                    *                                                 * J1204460
                          LD    2 +2        CHECK FRAME 2 FOR S         J1204470
                          S       IP922                                 J1204480
                          BSC  L  IP040,+-  BRANCH IF FRAMES 1,2 ARE *S J1204490
                    *                                                 * J1204500
                          S       IP924                                 J1204510
                          BSC  L  IP040,+-  BR IF FRAME 2 IS D      2-8 J1204520
                    *                                                 * J1204530
                          S       IP926     CHECK FRAME 2 FOR M     2-8 J1204540
                          BSC  L  IP010,Z   BRANCH IF FRAME 2 NOT M 2-8 J1204550
                    *                                               2-8 J1204560
                    IP040 LDX   2 /28       SET WD CNT OF 40 IN FIRST   J1204570
                          STX  I2 PEBUF+C   *WORD OF PACKED BUFFER.     J1204580
                          LDX   2 81        XR2 IS CRBUF WD CNT PLUS 1  J1204590
                          LDX   3 40        XR3 IS PEBUF WD CNT         J1204600
                          LD    1 CRBUF     ADDR OF I/O BFR IN ACC      J1204610
                          STO     IP060+1   INITIALIZE INSTRUCTION      J1204620
                          LD    1 PEBUF     INITIALIZE INST TO          J1204630
                          STO     IP070+1   *BUILD PACKED BUFFER        J1204640
                    *                                                 * J1204650
                    IP050 MDX   2 -2        NEXT UNPACKED WORDS         J1204660
                    IP060 LDD  L2 *-*       PICK UP TWO UNPACKED WORDS  J1204670
                          RTE     16        *AND FORM                   J1204680
                          SLA     8         *TWO PACKED CHARACTERS      J1204690
                          RTE     8         *IN ACCUMULATOR             J1204700
                    IP070 STO  L3 *-*       STORE 2 PACKED CHARS        J1204710
                          MDX   3 -1        NEXT ADDR IN PACKED BFR     J1204720
                          MDX     IP050     CONT LOOP IF XR3 NOT ZERO   J1204730
                          MDX     IP020     BR TO EXIT GETHO            J1204740
                          HDNG    PFACE--CONSTANTS AND WORK AREAS       J1204750
                          BSS  E  0                                     J1204760
                    IP902 DC      /7000     READ PAPT W/O CONVERSION    J1204770
                          DC      IP910     ADDR FOR READING WD CNT     J1204780
                    IP906 DC      3         CONSTANT                    J1204790
                    IP908 DC      80        CONSTANT                    J1204800
                    IP910 DC      1         CNT TO READ WD CNT FRAME    J1204810
                          DC      *-*       READ WD CNT FRAME HERE      J1204820
                    IP912 DC      /7002     READ PAPT WITH CONVERSION   J1204830
                    IP914 DC      /7001     PUNCH PAPT W/O CONVERSION   J1204840
                    IP916 DC      ./        CONSTANT                    J1204850
                    IP918 DC      /0036     MAX BINARY WD CNT           J1204860
                    IP920 DC      .*-./     CONSTANT                    J1204870
                    IP922 DC      .S        CONSTANT                    J1204880
                    IP924 DC      .D-.S     CONSTANT                    J1204890
                    IP926 DC      .M-.D     CONSTANT                2-8 J1204900
                          HDNG    PFACE--DUP 1134/1055 INTERFACE        J1204910
                    *************************************************** J1204920
                    *                                                 * J1204930
                    *   THIS CLOSED SUBROUTINE PERFORMS THE           * J1204940
                    *   PRELIMINARY INSTRUCTIONS NECESSARY TO READ    * J1204950
                    *   OR PUNCH A RECORD. IT THEN GOES TO THE SYS    * J1204960
                    *   PAPER TAPE SUBROUTINE WITH THE APPROPRIATE    * J1204970
                    *   CALLING SEQUENCE.                             * J1204980
                    *                                                 * J1204990
                    *************************************************** J1205000
                    IP080 DC      *-*       ENTRY POINT                 J1205010
                          STO     IP090+1   I/O BFR ADDR STORED IN      J1205020
                          RTE     16        *IP090 INSTRUCTION.         J1205030
                          LD      GETHO-2                               J1205040
                          A       IP906     SET UP INTERRUPT ADDR FOR   J1205050
                          STO   1 IBT+8     *1134/1055 IN ILS04 IBT.    J1205060
                    *                                                 * J1205070
                          SLA     16                                    J1205080
                          STO   1 BLKSW                                 J1205090
                    *                                                 * J1205100
                    IP090 LDX  L2 *-*                                   J1205110
                    *************************************************** J1205120
                    *                                                 * J1205130
                    *   DETERMINE  FUNCTION TO BE PERFORMED           * J1205140
                    *                                                 * J1205150
                    *************************************************** J1205160
                          MDX   3 0                                     J1205170
                          MDX     IP110     FUNCTION NOT GETHO          J1205180
                    *                                                 * J1205190
                          LD      IP908                                 J1205200
                          STO   2 0         WD CNT IS 72                J1205210
                          LD      IP912     CODE TO READ W/CONVERSION   J1205220
                    IP100 BSI  I  GETHO-2   BR TO SYS PAPT              J1205230
                    IP105 LD   L  $IBSY                                 J1205240
                          BSC  L  IP105,Z   BR IF FUNCTION NOT COMPLETE J1205250
                          BSC  I  IP080     RETURN                      J1205260
                    *                                                 * J1205270
                    IP110 MDX   3 -1                                    J1205280
                          MDX     IP120     FUNCTION IS PCHBI           J1205290
                    *                                                 * J1205300
                          LD      IP902     FUNCTION CODE FOR GETBI     J1205310
                          MDX     IP100                                 J1205320
                    *                                                 * J1205330
                    IP120 LD      IP914     FUNCTION CODE FOR PCHBI     J1205340
                          MDX     IP100                                 J1205350
                    *************************************************** J1205360
                    *                                                 * J1205370
                    *   SUBROUTINE ENTERED BY GETBI. THIS SUBR READS  * J1205380
                    *   A BINARY PAPER TAPE RECORD INTO THE BUFFER    * J1205390
                    *   SPECIFIED BY THIS.                            * J1205400
                    *                                                 * J1205410
                    *************************************************** J1205420
                    IP140 DC      *-*       GETBI ENTRY POINT           J1205430
                          BSI  I  PHIDM     MODIFY PHASE ID             J1205440
                          DC      /0900     READ CD/PAPT MODIFIER       J1205450
                          BSI  I  ENTER     SAVE REGISTERS,CONDITIONS   J1205460
                    *                                                 * J1205470
                          LD    1 NEXT                                  J1205480
                          S     1 THIS                                  J1205490
                          BSC  L  IP150,-   BR IF .THIS. LT .NEXT.      J1205500
                    *                                                 * J1205510
                          LDD   1 THIS                                  J1205520
                          RTE     16        INTERCHANGE DOUBLE BFR ADDR J1205530
                          STD   1 THIS      *SO THAT .THIS. LT .NEXT.   J1205540
                    *************************************************** J1205550
                    *                                                 * J1205560
                    *   READ WORD COUNT OF BINARY RECORD              * J1205570
                    *                                                 * J1205580
                    *************************************************** J1205590
                    IP150 LD      IP902+1   ADDR FOR READING ONE FRAME  J1205600
                          LDX   3 +1        XR3 IS CODE FOR GETBI       J1205610
                          BSI     IP080     READ ONE FRAME              J1205620
                          LD      IP910+1   COMPARE FRAME JUST READ     J1205630
                          SRA     8         *AGAINST MAX BINARY         J1205640
                          S       IP918     *RECORD WORD COUNT          J1205650
                          BSC  L  IP150,-Z  BR IF COUNT EXCEEDS MAX     J1205660
                    *                                                 * J1205670
                    IP170 LD      IP910+1                               J1205680
                          SRA     7         SET UP FRAME COUNT FOR      J1205690
                          STO  I  THIS+C    *SYS PAPER TAPE SUBROUTINE  J1205700
                          LD    1 THIS      ADDR OF PAPT INPUT BFR      J1205710
                          LDX   3 +1        XR3 IS CODE FOR GETBI       J1205720
                          BSI     IP080     READ BINARY PAPT RECORD     J1205730
                    *                                                 * J1205740
                    *                                                 * J1205750
                          BSI  I  RTURN     RESTORE REG'S CONDITIONS    J1205760
                          BSC  I  IP140     RETURN FROM GETBI           J1205770
                    *************************************************** J1205780
                    *                                                 * J1205790
                    *   PACK BINARY RECORD, TWO FRAMES PER WORD       * J1205800
                    *                                                 * J1205810
                    *************************************************** J1205820
                    IP190 DC      *-*       PACKB ENTRY POINT           J1205830
                          BSI  I  PHIDM     MODIFY PHASE ID             J1205840
                          DC      /0900     CD/PAPT INTERFACE MODIFIER  J1205850
                          BSI  I  ENTER     SAVE REGISTERS,CONDITIONS   J1205860
                    *                                                 * J1205870
                          LD    1 THIS                                  J1205880
                          S     1 NEXT                                  J1205890
                          BSC  L  IP195,-   BR IF .NEXT LT .THIS.       J1205900
                    *                                                 * J1205910
                          LDD   1 THIS                                  J1205920
                          RTE     16        INTERCHANGE DOUBLE BFR ADDR J1205930
                          STD   1 THIS      *SO THAT .NEXT. LT .THIS.   J1205940
                    *                                                 * J1205950
                    IP195 LD    1 NEXT      INITIALIZE IP210+1 ADDR     J1205960
                          A       IP210+1   *TO ADDR OF INPUT BFR + 55. J1205970
                          STO     IP210+1                               J1205980
                          LDX   2 -54       XR2 IS LOOP COUNTER         J1205990
                          LDX  I3 NEXT+C    XR3 IS ADDR OF INPUT BFR    J1206000
                    IP200 LD    3 +1                                    J1206010
                          RTE     24                                    J1206020
                          LD    3 +2        PACK TWO FRAMES TO ONE WORD J1206030
                          RTE     8                                     J1206040
                    IP210 STO  L2 55        PACKED WORD TO BUFFER       J1206050
                          MDX   3 +2        NEXT TWO FRAMES             J1206060
                          MDX   2 +1        NEXT WORD IN INPUT BUFFER   J1206070
                          MDX     IP200     CONT IF COUNT NEGATIVE      J1206080
                          LDX   2 55        RESTORE INITIAL VALUE TO    J1206090
                          STX   2 IP210+1   *ADDR AT IP210 + 1.         J1206100
                    *************************************************** J1206110
                    *                                                 * J1206120
                    *   CHECKSUM INPUT RECORD, IF REQUIRED            * J1206130
                    *                                                 * J1206140
                    *************************************************** J1206150
                          LD    1 DATSW     DO NOT CHECKSUM DATA FORMAT J1206160
                          BSC  L  IP240,Z   BR IF READING DATA          J1206170
                    *                                                 * J1206180
                          LDX  I2 NEXT+C    XR2 IS ADDR OF INPUT WD - 1 J1206190
                          LD    2 +2                                    J1206200
                          BSC  L  IP240,+-  BR, CHECKSUMMING NOT REQ    J1206210
                    *                                                 * J1206220
                          LD    2 0         NUMBER OF WORDS TO BE       J1206230
                          SRA     1         *CHECKSUMMED IS ONE-HALF    J1206240
                          STO     IP220+1   *THE FRAME COUNT            J1206250
                          MDX  L  CNTNO+C,1 INCR RECORD NUMBER          J1206260
                    IP220 LDX  L3 *-*       XR3 IS LOOP COUNTER         J1206270
                          LD    1 CNTNO     RECORD NUMBER               J1206280
                    IP230 A     2 +1        *ADD WORD FROM PACKED BFR.  J1206290
                          BSC     C         SKIP PAST ADD, IF CARRY OFF J1206300
                          A       IP910     ADD ONE TO INTERMEDIATE SUM J1206310
                          MDX   2 +1        NEXT WORD TO ADD            J1206320
                          MDX   3 -1        DECR LOOP COUNTER           J1206330
                          MDX     IP230     CONT IF COUNTER POSITIVE    J1206340
                    *                                                 * J1206350
                          S    L  IP910     IS CHECKSUM OK              J1206360
                          BSC  L  IP240,+-  BR IF NO CHECKSUM ERROR     J1206370
                    *                                                 * J1206380
                          BSI  I  LEAVE     GO TO DUP EXIT FOR ERR MSG  J1206390
                          DC      90        CHECKSUM ERROR              J1206400
                    *                                                 * J1206410
                    IP240 BSI  I  RTURN     RESTORE REG'S,CONDITIONS    J1206420
                          BSC  I  IP190     RETURN FROM PACKB           J1206430
                    *************************************************** J1206440
                    *                                                 * J1206450
                    *   SUBROUTINE TO PUNCH BINARY PAPER TAPE         * J1206460
                    *                                                 * J1206470
                    *************************************************** J1206480
                    IP250 DC      *-*       PCHBI ENTRY POINT           J1206490
                          BSI  I  PHIDM     MODIFY PHASE ID             J1206500
                          DC      /0900     CD/PAPT INTERFACE MODIFIER  J1206510
                          BSI  I  ENTER     SAVE REGISTERS,CONDITIONS   J1206520
                    *                                                 * J1206530
                          LD    1 NEXT      ADDR OF OUTPUT BFR          J1206540
                          LDX   3 -1        XR3 IS CODE FOR PCHBI       J1206550
                          BSI  L  IP080     PUNCH BINARY PAPT RECORD    J1206560
                    *                                                 * J1206570
                          BSI  I  RTURN     RESTORE REG'S,CONDITIONS    J1206580
                          BSC  I  IP250     RETURN FROM PCHBI           J1206590
                    *************************************************** J1206600
                          END     IP000                                 J1206610
