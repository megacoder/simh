                          HDNG    DUMPLET-  RESIDENT COMMA   2 AUG 67   J0600010
                          ABS                                           J0600020
                    $CIBA EQU     /5   ADDR OF CIB ON MASTER CARTRIDGE  J0600030
                    $CH12 EQU     /6   CHANNEL 12 INDR,NON-ZERO=CHAN 12 J0600040
                    $COMN EQU     /7   WORD COUNT OF COMMON             J0600050
                    $CORE EQU     /E   CORE SIZE,/1000=4K,/2000=8K,ETC) J0600060
                    $CTSW EQU     /F   MCR SW,NON-ZERO=// RECD TRAPPED  J0600070
                    $DADR EQU     /10  SCTR ADDR OF PROG TO BE FETCHED  J0600080
                    $DABL EQU     /11  IOCC FOR SCA RESET (ODD ADDR)    J0600090
                    $DREQ EQU     /12  INDR FOR REQUESTED V. DISK I/O   J0600100
                    $IBSY EQU     /13  PRINC I/O BUSY INDR,NON-ZERO=BSY J0600110
                    $HASH EQU     /14  WORK AREA FOR MONITOR PROGRAMS   J0600120
                    $PRET EQU     /28  ADDR PREOPERATIVE ERROR TRAP     J0600130
                    $IREQ EQU     /2C  ADDR OF INT REQUEST SUBROUTINE   J0600140
                    $ULET EQU     /2D  ADDR OF LET, LOGICAL DRIVE 0     J0600150
                    $IOCT EQU     /32  IOCS CTR,0=NO I/O IN PROGRESS    J0600160
                    $LAST EQU     /33  LAST CD INDR,NON-ZERO=LAST CARD  J0600170
                    $NDUP EQU     /34  INHIBIT DUP SW,NON-ZERO=NO DUP   J0600180
                    $NXEQ EQU     /35  INHIBIT EXEC SW,NON-ZERO=NO EXEQ J0600190
                    $PBSY EQU     /36  PRINC PTR BUSY INDR,NON-ZERO=BSY J0600200
                    $PGCT EQU     /37  PAGE NO. FOR PAGE HEADINGS       J0600210
                    $EXIT EQU     /38  ADDR CALL EXIT ENTRY POINT       J0600220
                    $LINK EQU     /39  ADDR CALL LINK ENTRY POINT       J0600230
                    $DUMP EQU     /3F  ADDR OF CALL DUMP, ENTRY POINT   J0600240
                    $DCDE EQU     /77  DRIVE CODE FOR CORE LOAD BLDR    J0600250
                    $PHSE EQU     /78  NO. OF PHASE CURRENTLY IN CORE   J0600260
                    $UFIO EQU     /79  ARM POSITION IN UNFORMATTED AREA J0600270
                    $WSDR EQU     /7A  WORKING STORAGE DRIVE CODE       J0600280
                    $WRD1 EQU     /7B  LOAD ADDR FOR CURR USER CORE LD  J0600290
                    $KCSW EQU     /7C  INHIBIT INPUT/PRINT OVERLAP SW   J0600300
                    $UFDR EQU     /7D  UNFORMATTED I/O DRIVE CODE       J0600310
                    $CPTR EQU     /7E  CHANNEL 12 INDICATOR FOR CP      J0600320
                    $1132 EQU     /7F  CHANNEL 12 INDICATOR FOR 1132    J0600330
                    $1403 EQU     /80  CHANNEL 12 INDICATOR FOR 1403    J0600340
                    $PST1 EQU     /81  ADDR POSTOP ERROR TRAP,LEVEL 1   J0600350
                    $PST2 EQU     /85  ADDR POSTOP ERROR TRAP,LEVEL 2   J0600360
                    $PST3 EQU     /89  ADDR POSTOP ERROR TRAP,LEVEL 3   J0600370
                    $PST4 EQU     /8D  ADDR POSTOP ERROR TRAP,LEVEL 4   J0600380
                    $STOP EQU     /91  ADDR PROGRAM STOP KEY TRAP       J0600390
                    $FPAD EQU     /95  FILE PROTECT ADDR (ADJ),LOG DR 0 J0600400
                    $CYLN EQU     /9A  ARM POSITION FOR LOGICAL DRIVE 0 J0600410
                    $ACDE EQU     /9F  AREA CODE FOR LOGICAL DRIVE 0    J0600420
                    $DCYL EQU     /A4  1ST DEF CYL ADDR, LOGICAL DR 0   J0600430
                    $I200 EQU     /B3  ENTRY POINT TO ILS FOR LEVEL 2   J0600440
                    $I205 EQU     /B8                                   J0600450
                    $IBT2 EQU     $I205+1 ADDR OF IBT FOR LEVEL 2       J0600460
                    $I400 EQU     /C4  ENTRY POINT TO ILS FOR LEVEL 4   J0600470
                    $I405 EQU     /D3                                   J0600480
                    $IBT4 EQU     $I405+1 ADDR OF IBT FOR LEVEL 4       J0600490
                    $I410 EQU     /D5                                   J0600500
                    $DBSY EQU     /EE  DISK BUSY INDR,NON-ZERO=DK BUSY  J0600510
                    $BYSW EQU     /1CB BYPASS SW,NOP IF FETCHING SOCAL  J0600520
                    DZ000 EQU     /0F2 DISKZ ENTRY POINT                J0600530
                    $ZEND EQU     /1E0 ADDR 1+LAST WORD OF DISKZ        J0600540
                          HDNG          CONCATENATED COMMON AREA(CATCO) J0600550
                    C     EQU     /7FA0     CATCO POINTER SET TO MIDDLE J0600560
                    *************************************************** J0600570
                    *                                                 * J0600580
                    *  INDEX REG 1 IS SET TO .C. WHEN CATCO IS FORMED * J0600590
                    *  FOR USE BY ALL OF DUP FUNCTIONS. ANY DUP ROUT  * J0600600
                    *  USING XR 1 FOR OTHER REASONS MUST RESTORE.     * J0600610
                    *  ALL VALUES IN CATCO HAVE LABELS EQUATED TO THE * J0600620
                    *  VALUE THAT INDICATES THEIR RELATIVE LOCATION   * J0600630
                    *  FROM .C.                                       * J0600640
                    *                                                 * J0600650
                    *************************************************** J0600660
                    *                                                 * J0600670
                    *             CATCO DCOM IMAGE                    * J0600680
                    *   EQUIVALENCES USED TO REFERENCE CATCO WITH XR1 * J0600690
                    *                                                 * J0600700
                    *************************************************** J0600710
                    #NAME EQU     4-/80     NAME OF PROGRAM             J0600720
                    #DBCT EQU     6-/80     DISK BLOCK COUNT OF PROGRAM J0600730
                    #FCNT EQU     7-/80     FILES SW,ZERO 0 NO FILES    J0600740
                    #SYSC EQU     8-/80     NON-ZERO,SYSTEM CARTRIDGE   J0600750
                    #JBSW EQU     9-/80     JOB SW,NON-ZERO='T' MODE    J0600760
                    #CBSW EQU     10-/80    CLB SW,NON-ZERO=STORECI     J0600770
                    #LCNT EQU     11-/80    NO. OF LOCALS               J0600780
                    #MPSW EQU     12-/80    NON-ZERO, CORE MAP DESIRED  J0600790
                    #MDF1 EQU     13-/80    NO. OF DUP CTRL RCDS        J0600800
                    #MDF2 EQU     14-/80    ADDR OF MODIF BUFFER        J0600810
                    #NCNT EQU     15-/80    NO. OF NOCALS               J0600820
                    #ENTY EQU     16-/80    RELATIVE ENTRY ADDR OF PROG J0600830
                    #RP67 EQU     17-/80    IF NON-ZERO,1442 MOD 6,7    J0600840
                    *                                                   J0600850
                    *   NEGATIVE VALUE REPRESENTS DEFAULT CONDITION   * J0600860
                    #TODR EQU     18-/80    DR CODE OF 'TO' DRIVE       J0600870
                    #FRDR EQU     19-/80    DR CODE OF 'FROM' DRIVE     J0600880
                    *                                                 * J0600890
                    #FHOL EQU     20-/80    ADDR OF LARGEST FXA HOLE    J0600900
                    #FSZE EQU     21-/80    BLK CNT LARGEST HOLE IN FXA J0600910
                    #UHOL EQU     22-/80    ADDR OF LARGEST UA HOLE     J0600920
                    #USZE EQU     23-/80    BLK CNT LARGEST HOLE IN UA  J0600930
                    #DCSW EQU     24-/80    NON-ZERO=DUP CALL           J0600940
                    #PIOD EQU     25-/80    PRINC. I/O INDICATOR        J0600950
                    #PPTR EQU     26-/80    PRINC. PRINTER INDICATOR    J0600960
                    #CIAD EQU     27-/80    WD NO. SCTR 0,CIL ADDR      J0600970
                    #ACIN EQU     28-/80    AVAILABLE CARTRIDGE INDR2-8 J0600980
                    #GRPH EQU     29-/80    2250 INDICATOR          2-8 J0600990
                    #GCNT EQU     30-/80    NO. G2250 RECORDS       2-8 J0601000
                    #LOSW EQU     31-/80    LOCAL-CALLS-LOCAL INDR  2-8 J0601010
                    #X3SW EQU     32-/80    SPECIAL ILS SWITCH      2-8 J0601020
                    #ECNT EQU     33-/80    NO. OF EQUAT RCDS       2-8 J0601030
                    #ANDU EQU     35-/80    END OF UA (ADJ) LOG DR 0-4  J0601040
                    #BNDU EQU     40-/80    END OF UA (BASE) LOG DR 0-4 J0601050
                    #FPAD EQU     45-/80    FILE PROTECT ADDR (BASE)    J0601060
                    #PCID EQU     50-/80    CART ID, PHYS DR 0-4        J0601070
                    #CIDN EQU     55-/80    CART ID, LOG DR 0-4         J0601080
                    #CIBA EQU     60-/80    CIB ADDR, LOG DR 0-4        J0601090
                    #SCRA EQU     65-/80    SCRA, LOG DR 0-4            J0601100
                    #FMAT EQU     70-/80    WS FORMAT, LOG DR 0-4       J0601110
                    #FLET EQU     75-/80    FLET ADDR, LOG DR 0-4       J0601120
                    #ULET EQU     80-/80    LET ADDR, LOG DR 0-4        J0601130
                    #WSCT EQU     85-/80    WS BLK CNT, LOG DR 0-4      J0601140
                    #CSHN EQU     90-/80    CUSHION END SCTR ADDR, 0-4  J0601150
                    #DCOM EQU     1         SCTR ADDR OF DCOM           J0601160
                    #HDNG EQU     7         SCTR WITH PAGE HEADING      J0601170
                    @SBFR EQU     /FB0                              2-8 J0601180
                          HDNG    CONCATENATED COMMON AREA (CATCO)      J0601190
                    *************************************************** J0601200
                    *                                                 * J0601210
                    *             CATCO IOAR HDRS FOR DUP PHASES        J0601220
                    *                                                 * J0601230
                    *************************************************** J0601240
                          ORG     -/10                                  J0601250
                    DCHDR BSS     2         DUP CONTROL            PH02 J0601260
                    STHDR BSS     2         STORE                  PH03 J0601270
                    FLHDR BSS     2         FILEQ                  PH04 J0601280
                    DMHDR BSS     2         DUMP                   PH05 J0601290
                    DLHDR BSS     2         DUMPLET                PH06 J0601300
                    DTHDR BSS     2         DELETE                 PH07 J0601310
                    DFHDR BSS     2         DEFINE                 PH08 J0601320
                    DXHDR BSS     2         DUP EXIT               PH09 J0601330
                    UCHDR BSS     2         DUP UPCOR              PH13 J0601340
                    PIHDR BSS     2         PRINCIPAL I/O BLOCK    PH14 J0601350
                    SIHDR BSS     2         PRINC I/O (W/O KB) BLK PH15 J0601360
                    PTHDR BSS     2         PAPER TAPE I/O BLOCK   PH16 J0601370
                    CIHDR BSS     2         CI PHASE READ BY CL BUILDER J0601380
                    MUHDR BSS     2         MACRO UPDATE      PH206 2-8 J0601390
                    D2HDR BSS     2         DUP CONTROL 2     PH205 2-8 J0601400
                          HDNG    DMPLET-   CATCO DUP SWITCHES          J0601410
                    *************************************************** J0601420
                    *                                                   J0601430
                    *             CATCO DUP SWITCHES                  * J0601440
                    *      WORDS USED FOR COMMUNICATION OF DATA         J0601450
                    *   BETWEEN DUP ROUTINES.                           J0601460
                    *                                                 * J0601470
                    *      INITIALIZED TO ZERO BY  .REST. OF DUPCO    * J0601480
                    *                                                   J0601490
                    *************************************************** J0601500
                    CL1   EQU     *                                     J0601510
                    ASMSW BSS     1         NON ZERO IF DEFINE VOID ASM J0601520
                    BITSW BSS     1         NON ZERO TO ALLOW MDUMP-S   J0601530
                    BLKSW BSS     1         NON ZERO IF BYPASSING REC   J0601540
                    CIERR BSS     1         ERROR NO DETECTED BY PH 17  J0601550
                    CISW  BSS     1         NON ZERO IF STORE CI        J0601560
                    CLBSW BSS     1         NON ZERO IF PRECI EXECUTED  J0601570
                    CNTNO BSS     1         RECORD NO BEING PCHD OR RD  J0601580
                    *                                                 * J0601590
                    *   .DATSW. IS FILLED WITH THE CNT FIELD OF THE   * J0601600
                    *   DUP CONTROL RECORD.                           * J0601610
                    *   USED PRIMARILY FOR DATA MOVEMENT, BUT ALSO IS * J0601620
                    *   USED FOR COUNT OF RECORDS TO READ AFTER A     * J0601630
                    *   STORE CI DUP CONTROL RECORD.                  * J0601640
                    DATSW BSS     1         RECORDS VALUE IN CNT FIELD  J0601650
                    DBADR BSS     1         DB ADDR OF REFERENCED PROG  J0601660
                    DELSW BSS     1         ADDR OF REQ LET ENTRY - 1   J0601670
                    DFNSW BSS     1         NON ZERO IF DEFINE FXA      J0601680
                    DKSAD BSS     1         DK SCTR ADDR W/O DR CODE    J0601690
                    DUMPP BSS  E  2         LAST LIMITS FOR PRNTR DUMP  J0601700
                    FORSW BSS     1         NON ZERO IF DEFINE VOID FOR J0601710
                    FRWS  BSS     1         NON ZERO IF FROM FLD IS WS  J0601720
                    FXSW  BSS     1         NON ZERO IF FIXED AREA REQD J0601730
                    HOLSW BSS     1         NON ZERO IF NO CONV REQD    J0601740
                    IOSW  BSS     1         NON ZERO IF IN/OUT REQD     J0601750
                    *                                                 * J0601760
                    *   DUMPLET SWITCH - ZERO IF NOT DUMPLET/DUMPFLET * J0601770
                    *       PLUS VALUE REQUIRES PRINT OF BOTH LET/FLET* J0601780
                    *       NEG. VALUE REQUIRES PRINT OF FLET ONLY    * J0601790
                    LETSW BSS     1         NON ZERO,PRINT LET OR FLET* J0601800
                    LSTLF BSS     1         LAST LET/FLET SECT PROCESSD J0601810
                    MODSW BSS     1         NON ZERO IF STORE MOD FUNC  J0601820
                    NAMSW BSS     1         NON ZERO IF NAME IN LET/F   J0601830
                    NEGSW BSS     1         NON ZERO IF SHRINKING FXA   J0601840
                    PGMHL BSS     1         WORD COUNT OF THE PROG HDR  J0601850
                    PRSW  BSS     1         NON ZERO IF PRINTING OUTPUT J0601860
                    PTSW  BSS     1         NON ZERO IF PAPER TAPE REQD J0601870
                    SKWDS BSS     1         WDS TO SEARCH IN L/F SECT   J0601880
                    STCSW BSS     1         NON ZERO IF STORE DATA CI   J0601890
                    STSW  BSS     1         NON ZERO IF STORE TYPE      J0601900
                    TEMP1 BSS  E  1         1ST WD OF BINEB OUTPUT      J0601910
                    TEMP2 BSS     1         2ND WD OF BINEB OUTPUT      J0601920
                    TOWS  BSS     1         NON ZERO IF TO FIELD IS WS  J0601930
                    T3MSW BSS     1         TYPE 3,4 SOCAL LEVEL CELL   J0601940
                    UASW  BSS     1         NON ZERO IF USER AREA REQD  J0601950
                    WSSW  BSS     1         NON ZERO IF WORK STG REQD   J0601960
                    XEQSW BSS     1         NON ZERO IF NOT RET FR GET  J0601970
                    EBCSW BSS     1         NON ZERO IF EBC DATA OP 2E2 J0601980
                    HDNSW BSS     1         NON ZERO IF NAME IN HDR 2-8 J0601990
                    RPGSW BSS     1         NON Z IF DEFINE VOID RPG2-8 J0602000
                    DFLSW BSS     1         NON ZERO IF *DFILE      2-8 J0602010
                          BSS     1         RESERVED FOR ADDITION   2-8 J0602020
                    CL2   EQU     *-1                                   J0602030
                          HDNG    DMPLET-   CATCO DUP SWITCHES          J0602040
                    *************************************************** J0602050
                    *                                                 * J0602060
                    *             CATCO DUP SWITCHES                  * J0602070
                    *  INITIALIZED BY DCTL AND NOT RESET BY .REST.    * J0602080
                    *                                                 * J0602090
                    *************************************************** J0602100
                    IOREQ BSS     1         MON-ZERO,AUX I/O SET REQ    J0602110
                    PH2   BSS     1         NON-ZERO IF DCTL IN CORE    J0602120
                    PH3   BSS     1         NON-ZERO IF STORE IN CORE   J0602130
                    PH4   BSS     1         NON-ZERO IF DUMP IN CORE    J0602140
                    ************************************************2-8 J0602150
                    *                                               2-8 J0602160
                    *             CATCO SWITCH INITIALIZED TO ZERO  2-8 J0602170
                    *   BY CCAT SUBR AND SET BY MACRO UPDATE PROGRAM2-8 J0602180
                    *                                               2-8 J0602190
                    ************************************************2-8 J0602200
                    DUPCR BSS     1         NON ZERO IF DUP CTRL RCD2-8 J0602210
                    *************************************************** J0602220
                    *                                                 * J0602230
                    *             CATCO DUP SWITCHES SET BY CCAT SUBR * J0602240
                    *                                                 * J0602250
                    *************************************************** J0602260
                    ADDR2 BSS     1         KB INTERRUPT ADDRESS        J0602270
                    KBREQ BSS     1         CONTENTS OF LOC 13          J0602280
                    *      THE FOLLOWING SWITCH IS SET TO INDICATE THE  J0602290
                    *       PRINCIPAL INPUT DEVICE                      J0602300
                    *             -  IS PAPER TAPE                      J0602310
                    *             0  IS CARD                            J0602320
                    *             +  IS KEYBOARD                        J0602330
                    INOUT BSS     1         PRINCIPAL INPUT SWITCH      J0602340
                    *                                                   J0602350
                    PTPON BSS     1         NON-ZERO IF PAPER TP ON SYS J0602360
                    *************************************************** J0602370
                    *                                                 * J0602380
                    *             LEVEL 4 INTERRUPT BRANCH TABLE      * J0602390
                    *             ADDRESSES. INITIALIZED BY CCAT,     * J0602400
                    *             AND CARD/PAPER TAPE INTERFACES.     * J0602410
                    *                                                 * J0602420
                    *************************************************** J0602430
                          ORG     /0049                                 J0602440
                    IBT   BSS     9         9 WD INTRPT BRANCH TABLE    J0602450
                    *************************************************** J0602460
                    *                                                 * J0602470
                    *             CATCO I/O ADDRESSES REQUIRED BY DUP * J0602480
                    *                                                 * J0602490
                    *************************************************** J0602500
                    P1442 BSS  E  2         SYS 1442 IOAR HEADER        J0602510
                    PRPAR BSS     2         DEFAULT LIMITS TO PRINT     J0602520
                    PHDUP BSS     1         LAST DUP PHASE IN CORE      J0602530
                    CRBUF BSS     1         81 WD BFR FOR DUP CTRL RCDS J0602540
                    DCADR BSS     1         ADDR FOR DUP CTRL IOAR HDR  J0602550
                    HDBUF BSS     1         ADDR OF PAGE HEADING BFR    J0602560
                    IOBLK BSS     1         ADDR OF DUP I/O PHASE       J0602570
                    SDBUF BSS     1         STORE/DUMP BUFFER           J0602580
                    LETAR BSS     1         ADDR OF LET SEARCH BUFFER   J0602590
                    PEBUF BSS     1         41 WD BFR FOR PACKED EBCDIC J0602600
                    THIS  BSS     1         ADDR OF DOUBLE BFR, BFR 1   J0602610
                    NEXT  BSS     1         ADDR OF DOUBLE BFR, BFR 2   J0602620
                          HDNG              DUP CORE PARAMETERS         J0602630
                    DISKZ EQU     DZ000     DISKZ ENTRY POINT           J0602640
                    B     EQU     $ZEND-2                               J0602650
                    DMPLC EQU     B         IOAR CORE ADDR FOR DMPLT    J0602660
                    EXITC EQU     B         IOAR CORE ADDR FOR DEXIT    J0602670
                    MUPC  EQU     B         IOAR CORE ADDR FOR MUP  2-8 J0602680
                    DCTL  EQU     B+/1002   ENTRY ADDRESS OF DCTL       J0602690
                    DCTLC EQU     B+/1000   IOAR CORE ADDR FOR DCTL     J0602700
                    WSDC  EQU     B+/2000   IOAR CORE ADDR FOR STORE    J0602710
                    DUMPC EQU     B+/4000   IOAR CORE ADDR FOR DDUMP    J0602720
                    DUPCO EQU     /7DB0     ADDR OF RESIDENT DUPCO      J0602730
                    CATCO EQU     /7F20-2   ADDR OF DCOM IOAR HEADER    J0602740
                    *                                                 * J0602750
                    *  DUPCO ENTRY POINTS...USED WITH INDIRECT BSI    * J0602760
                    *                                                 * J0602770
                          ORG     DUPCO                                 J0602780
                    BINEB BSS     1         CONVERSION BINARY TO EBCDIC J0602790
                    WRTDC BSS     1         WRITE DCOM(S) SUBROUTINE    J0602800
                    ENTER BSS     1         SAVE XR-S AND CONDITIONS    J0602810
                    GET   BSS     1         READ FROM DISK USING DISKZ  J0602820
                    LEAVE BSS     1         HANDLES ALL EXITS FROM DUP  J0602830
                    LINE  BSS     1         SPACES PRINTER 1 LINE       J0602840
                    MASK  BSS     1         INHIBITS KB INT REQUEST     J0602850
                    MDUMP BSS     1         PRINTS SELECTED CORE LOC-S  J0602860
                    PAGE  BSS     1         SKIPS TO NEXT PAGE          J0602870
                    PHID  BSS     1         RECORDS PHASE ID            J0602880
                    PHIDM BSS     1         RECORDS PHASE AND MODIFIER  J0602890
                    PRINT BSS     1         USE SYS PR SUBR TO PRINT    J0602900
                    PUT   BSS     1         WRITES TO DISK USING DISKZ  J0602910
                    REST  BSS     1         RESTORE CATCO,GO TO DCTL    J0602920
                    RTURN BSS     1         RESTORE XR-S AND CONDITIONS J0602930
                    *                                                 * J0602940
                    *  INPUT/OUTPUT PARAMETERS , CORE ADDRESSES       * J0602950
                    *                                                 * J0602960
                    BUF6  EQU     DUPCO-/1F ADDR OF PAGE HEADING BUFFER J0602970
                    PRPNT EQU     BUF6-/141 IOAR ADDR FOR PRINC. PTR    J0602980
                    IOADR EQU     BUF6-/38B START OF I/O INTERFACE      J0602990
                    GETHO EQU     IOADR+4   ENTRY FOR READING HOLL TYPE J0603000
                    GETBI EQU     IOADR+5   ENTRY FOR READING BINARY    J0603010
                    PACKB EQU     IOADR+6   ENTRY TO PACK BINARY        J0603020
                    PCHBI EQU     IOADR+7   ENTRY TO PUNCH BINARY       J0603030
                    BUF1  EQU     IOADR-/51 ADDR OF NEXT BUFFER         J0603040
                    BUF2  EQU     BUF1-/52  ADDR OF THIS BUFFER         J0603050
                    BUF3  EQU     BUF2-/3E  ADDR OF PACKED EBC BUFFER   J0603060
                    BUF4  EQU     BUF3-/52  ADDR OF CONTROL RCD BUFFER  J0603070
                    BUF5  EQU     IOADR-/284   ADDR OF LET SCTR BFR     J0603080
                    BUF7  EQU     BUF5-/7142   ADDR OF STORE/DUMP BFR   J0603090
                          HDNG    DUP-- DUMPLET/DUMPFLET PROLOGUE       J0603100
                    *************************************************** J0603110
                    *STATUS-VERSION 2, MODIFICATION 9                 * J0603120
                    *                                                 * J0603130
                    *FUNCTION/OPERATION                               * J0603140
                    *   THE DUMPLET PROGRAM DUMPS THE CONTENTS OF THE * J0603150
                    *   LOCATION EQUIVALENCE TABLE(LET) AND/OR THE    * J0603160
                    *   FIXED AREA LOCATION EQUIVALENCE TABLE(FLET) TO* J0603170
                    *   THE PRINCIPAL PRINT DEVICE. THE EXTENT OF THE * J0603180
                    *   DUMP DEPENDS ON THE SETTING TWO DUPCO SWITCHES* J0603190
                    *   * LETSW-WHEN THIS SWITCH IS POSITIVE BOTH LET * J0603200
                    *           AND FLET ARE,WHEN IT IS NEGATIVE,ONLY * J0603210
                    *           FLET IS DUMPED.                       * J0603220
                    *   * DRIVF-WHEN THIS SWITCH IS NEGATIVE,LET/FLET * J0603230
                    *           ON ALL CARTRIDGES ARE DUMPED,WHEN IT  * J0603240
                    *           IS NON-NEGATIVE,LET/FLET ON ONLY THE  * J0603250
                    *           CARTRIDGE SPECIFIED IS DUMPED. IN THIS* J0603260
                    *           CASE THE CARTRIDGE REQUIRED IS        * J0603270
                    *           REFLECTED IN DRIVF.                   * J0603280
                    *   EACH PAGE OF OUTPUT CONTAINS IN ADDITION TO   * J0603290
                    *   THE DUMPED OUTPUT,TWO LINES OF HEADER         * J0603300
                    *   INFORMATION.THE FIRST HEADER LINE REFLECTS THE* J0603310
                    *   CONTENTS OF THE FOLLOWING DCOM DATA WORDS--   * J0603320
                    *           =CDIN                                 * J0603330
                    *           $FPAD (COMMA)                         * J0603340
                    *           =FPAD                                 * J0603350
                    *           =CIBA                                 * J0603360
                    *           =ULET                                 * J0603370
                    *           =FLET                                 * J0603380
                    *   THE SECOND HEADER LINE ON EACH PAGE REFLECTS  * J0603390
                    *   INFORMATION TAKEN FROM THE FIRST 5 WORDS OF   * J0603400
                    *   THE LET/FLET SECTOR BEING DUMPED.THIS INFORM- * J0603410
                    *   ATION IS AS FOLLOWS                           * J0603420
                    *           SECTOR NUMBER                         * J0603430
                    *           USER AREA/FIXED AREA                  * J0603440
                    *           WORDS AVAILABLE                       * J0603450
                    *           CHAIN ADDRESS                         * J0603460
                    *   EACH LET/FLET ENTRY WILL HAVE THE FOLLOWING   * J0603470
                    *   INFORMATION PRINTED FOR IT--                  * J0603480
                    *           FORMAT(DSF,DDF,OR DCI)                * J0603490
                    *           NAME                                  * J0603500
                    *           DISK BLOCK COUNT                      * J0603510
                    *           DISK BLOCK ADDRESS                    * J0603520
                    *   THE FORMAT OF THE OUTPUT IS THE SAME FOR ALL  * J0603530
                    *   PRINT DEVICES,(1053,1132,OR 1403)--FIVE LET/  * J0603540
                    *   FLET ENTRIES ARE FORMATTED AND PRINTED PER    * J0603550
                    *   LINE. THE LET/FLET SECTOR IS OUTPUTTED SO THAT* J0603560
                    *   THE ENTRIES ARE LISTED COLUMN-WISE.ILLUSTRATED* J0603570
                    *   BELOW IS THE WAY A SECTOR APPEARS(WITHOUT THE * J0603580
                    *   TWO HEADER LINES)--                           * J0603590
                    *                                                 * J0603600
                    *   ENTRY1  ENTRY22  ENTRY43  ENTRY64  ENTRY85    * J0603610
                    *   ENTRY2  ENTRY23  ENTRY44  ENTRY65  ENTRY86    * J0603620
                    *   ENTRY3  ENTRY24  ENTRY45  ENTRY66  ENTRY87    * J0603630
                    *   ENTRY4  ENTRY25  ENTRY46  ENTRY67  ENTRY88    * J0603640
                    *      -       -        -        -        -         J0603650
                    *      -       -        -        -        -         J0603660
                    *      -       -        -        -        -         J0603670
                    *   ENTRY21 ENTRY42  ENTRY63  ENTRY84  ENTRY105   * J0603680
                    *                                                 * J0603690
                    *   IN ADDITION TO PRINTING A COMPLETE LET OR FLET* J0603700
                    *   THIS PROGRAM ALSO HAS THE FACILITY TO DUMP A  * J0603710
                    *   SINGLE LET OR FLET ENTRY. THIS OPTION IS      * J0603720
                    *   INDICATED BY A SWITCH--NAMSW-- BEING SET NON- * J0603730
                    *   ZERO.                                         * J0603740
                    *                                                 * J0603750
                    *ENTRY POINTS-                                    * J0603760
                    *     DLET -THIS IS THE ONLY ENTRY POINT INTO THE * J0603770
                    *           PROGRAM.                              * J0603780
                    *                                                 * J0603790
                    *INPUT-                                           * J0603800
                    *   * WHEN A SINGLE LET/FLET ENTRY IS DUMPED,INPUT* J0603810
                    *     IS PROVIDED BY THE FOLLOWING CELLS IN CATCO * J0603820
                    *           NAMEP- NAME AND FORMAT CODE           * J0603830
                    *           BLKCT- DB SIZE                        * J0603840
                    *           DBADR- DB ADDRESS                     * J0603850
                    *   * WHEN AN ENTIRE LET OR FLET IS DUMPED INPUT  * J0603860
                    *     IS IN THE FORM OF A LET/FLET SECTOR READ    * J0603870
                    *     INTO CORE FROM THE DISK                     * J0603880
                    *                                                 * J0603890
                    *OUTPUT-                                          * J0603900
                    *   A LINE PRINTED ON THE PRINCIPAL PRINT DEVICE  * J0603910
                    *   FOR EACH 5 ENTRIES. THE NUMBER OF LINES       * J0603920
                    *   OUTPUTTED DEPENDS ON THE NUMBER OF ENTRIES IN * J0603930
                    *   THE TABLE.                                    * J0603940
                    *                                                 * J0603950
                    *EXTERNAL REFERENCES                              * J0603960
                    *   SUBROUTINES IN DUPCO                          * J0603970
                    *      * PHID                                     * J0603980
                    *      * PAGE                                     * J0603990
                    *      * PRINT                                    * J0604000
                    *      * BINEB                                    * J0604010
                    *      * LINE                                     * J0604020
                    *      * DUMP                                     * J0604030
                    *      * GET                                      * J0604040
                    *   SWITCHES IN CATCO                             * J0604050
                    *      * DMPLC                                    * J0604060
                    *      * DRIVF                                    * J0604070
                    *      * LETSW                                    * J0604080
                    *      * =ULET                                    * J0604090
                    *      * TEMP1                                    * J0604100
                    *      * LETAR                                    * J0604110
                    *      * =FLET                                    * J0604120
                    *      * =CIDN                                    * J0604130
                    *      * $FPAD                                    * J0604140
                    *      * =FPAD                                    * J0604150
                    *      * =CIBA                                    * J0604160
                    *      * C                                        * J0604170
                    *                                                 * J0604180
                    *EXITS                                            * J0604190
                    *   NORMAL-                                       * J0604200
                    *      DL147                                      * J0604210
                    *   ERROR -                                       * J0604220
                    *      NONE                                       * J0604230
                    *                                                 * J0604240
                    *TABLES/WORK AREAS-                               * J0604250
                    *      * PRNTA      PRINTER OUTPUT AREA           * J0604260
                    *      * LETAR      I/O AREA FOR LET SECTOR       * J0604270
                    *                                                 * J0604280
                    *ATTRIBUTES-                                      * J0604290
                    *      SERIALLY REUSABLE                          * J0604300
                    *                                                 * J0604310
                    *NOTES- N/A                                       * J0604320
                    *                                                 * J0604330
                    *                                                 * J0604340
                    *                                                 * J0604350
                    *                                                 * J0604360
                    *************************************************** J0604370
                          HDNG    DUP--DUMPLET/DUMPFLET                 J0604380
                          ORG     DMPLC                                 J0604390
                          DC      *-*        LOADER STORES WORD COUNT   J0604400
                          DC      6          DUMPLET/FLET  PHASE ID     J0604410
                    *                                                   J0604420
                    DLET  BSI  I  PHID       GO TO DUPCO TO             J0604430
                          DC      /0006      RECORD PHASE ID.           J0604440
                    *                                                   J0604450
                          LDX  I3 LETAR+C    *FORCE A BLANK NAME *      J0604460
                          SRT     32         *FOLLOWING THE LAST*       J0604470
                          STD  L3 322        *ENTRY IN LET SECTOR*      J0604480
                    *                                                   J0604490
                          LDX   3 60         INITIALIZE WORD COUNT      J0604500
                          STX  L3 PRNTA      OF PRINT BUFFER            J0604510
                    *                                                   J0604520
                          LDX   3 0          INIT.XR3 FOR LOG.DRIVE 0   J0604530
                    *                                                   J0604540
                    *  TEST IF ALL CARTRIDGES ON SYSTEM ARE REQUIRED,OR J0604550
                    *  ONLY THE ONE SPECIFIED.                          J0604560
                    *                                                   J0604570
                          LD    1 #FRDR      TEST IF SWITCH IS NEGATIVE J0604580
                          BSC  L  DL020,+Z   YES,NEED ALL CARTRIDGES    J0604590
                    *                                                   J0604600
                          LDX  I3 #FRDR+C    NO,XR3=DRIVE SPECIFIED     J0604610
                    *                                                   J0604620
                    DL020 STX  L3 PD020+1    SAVE XR3                   J0604630
                          STX  L3 DL085+1                               J0604640
                    *                                                   J0604650
                    *  CHECK -NAMSW- TO SEE IF ONLY ONE ENTRY IS REQD., J0604660
                    *  INDICATED BY.NAMSW. NON-ZERO                     J0604670
                    *                                                   J0604680
                          LD    1 NAMSW      IS NAMSW NON-ZERO          J0604690
                          BSC  L  DL300,Z    YES,GO PROCESS SINGLE ENT  J0604700
                    *                                                   J0604710
                    *  TEST IF BOTH LET AND FLET ARE NEEDED,OR ONLY     J0604720
                    *  FLET,INDICATED BY.LETSW. POSITIVE OR NEGATIVE    J0604730
                    *                                                   J0604740
                    DL022 LD    1 LETSW      LET & FLET OR JUST FLET    J0604750
                          BSC  L  DL070,+Z   JUST FLET GOTO SETUP FSADR J0604760
                    *                                                   J0604770
                          LD   L3 #ULET+C    LET AND FLET,CHK LET SCTR  J0604780
                          BSC  L  DL140,+-   SIGN-OFF IF ZERO ,IF NOT   J0604790
                    DL025 STO  L  HDR+1      LET SCTR ADDR IN I/O HDR   J0604800
                    *                                                   J0604810
                          BSI  L  RDSCT      GO READ A SECTOR           J0604820
                    *                                                   J0604830
                          LD    3 +2         LET OR FLET                J0604840
                          SRA     4          ITS FLET IF 16 OR GREATER  J0604850
                          BSC  L  DL026,Z    BRANCH IF FLET             J0604860
                          LDD  L  LET        LOAD LET MESSAGE INTO      J0604870
                          STD  L  BUF6+19    PAGE HEADING BUFFER        J0604880
                          MDX     DL027      GO RESTORE PAGE            J0604890
                    *                                                   J0604900
                    DL026 LDD  L  SUFFT      STORE FLET MESSAGE IN      J0604910
                          STD  L  BUF6+19    PAGE HEADING BUFFER        J0604920
                    *                                                   J0604930
                    DL027 BSI  I  PAGE       TO DUPCO TO RESTORE PAGE   J0604940
                          BSI  I  LINE       LINE                       J0604950
                          BSI  I  LINE       SPACES                     J0604960
                          BSI  I  LINE       TO                         J0604970
                          BSI  I  LINE       CENTER                     J0604980
                          BSI  I  LINE       OUTPUT                     J0604990
                    *                                                   J0605000
                    *                                                   J0605010
                    *  CHECK THE SWITCH CALLED .CHNGE. TO SEE IF WE     J0605020
                    *  NEED TO INITIALIZE TO A NEW DISK BLOCK ADDRESS.  J0605030
                    *  WE ONLY NEED A NEW DB ADDR.IF WE GO FROM LET TO  J0605040
                    *  FLET--SIGNIFIED BY .CHNGE. EQUAL TO ZERO,        J0605050
                    *  OTHERWISE .CHNGE. WILL BE NON-ZERO               J0605060
                    *                                                   J0605070
                          LD   L  CHNGE      GO INIT. DB ADDR           J0605080
                          BSI  L  INDBA,+-   IF SWITCH IS ZERO          J0605090
                    *                                                   J0605100
                          BSI  L  PDCHR      PRINT DCOM TITLE AND HDR   J0605110
                    *                                                   J0605120
                          LDX  L2 LETH-1     XR2= LET HDR MESSAGE ADDR  J0605130
                          LDX   3 23         XR3= NO.OF WORD TO MOVE    J0605140
                          BSI     MOVE       MOVE HDR.MSG.,PRINT LINE   J0605150
                    *                                                   J0605160
                          BSI  I  PRINT      TO DUPCO TO PRINT A LINE   J0605170
                          DC      PRNTA      PRINT BUFFER ADDRESS       J0605180
                    *                                                   J0605190
                          BSI     CLEAR      CLEAR THE PRINT BUFFER     J0605200
                    *                                                   J0605210
                          LDX  L2 PRNTA      XR2=PRINT BUFFER           J0605220
                          LDX  I3 LETAR+C    XR3=ADDR.OF LET SCTR AREA  J0605230
                          LD    3 +2         PICK-UP LET SECTOR NO.     J0605240
                          BSI  I  BINEB      CONVERT TO EBC             J0605250
                    *                                                   J0605260
                          LDD   1 TEMP1      LET SECTOR NO.STORED IN    J0605270
                          STD   2 +1         PRINT BUFFER               J0605280
                    *                                                   J0605290
                          LD    3 +3         PICK UP SECTOR ADDR OF U/A J0605300
                          BSI  I  BINEB      CONVERT                    J0605310
                    *                                                   J0605320
                          LDD   1 TEMP1      SCTR.ADDR.OF U/A STORED IN J0605330
                          STO   2 +6         PRINT BUFFER--1ST 2 CHARS  J0605340
                          RTE     16         2ND. 2 CHARS               J0605350
                          STO   2 +7                                    J0605360
                    *                                                   J0605370
                          LD    3 +5         PICK-UP SECTOR ADDR OF NO. J0605380
                          BSI  I  BINEB      OF WDS.AVAIL.,CONVERT      J0605390
                    *                                                   J0605400
                          LDD   1 TEMP1      LOAD 2 CONVERTED EBC WORDS J0605410
                          STD   2 +13        STORE IN PRINT BUFFER      J0605420
                    *                                                   J0605430
                          LD    3 +6         CHAIN ADDRESS              J0605440
                          BSI  I  BINEB      CONVERT TO EBC             J0605450
                    *                                                   J0605460
                          LDD   1 TEMP1      LD.2 CONVERTED WORDS       J0605470
                          STD   2 +19        STORE IN PRINT BUFFER      J0605480
                    *                                                   J0605490
                          BSI  I  PRINT      GOTO DUPCO TO PRINT A LINE J0605500
                          DC      PRNTA      PRINT I/O AREA             J0605510
                    *                                                   J0605520
                          BSI  I  LINE       LINE SPACE                 J0605530
                          BSI  I  LINE       LINE SPACE                 J0605540
                          BSI  I  LINE       LINE SPACE                 J0605550
                    *                                                   J0605560
                          BSI     CLEAR      CLEAR THE PRINT BUFFER     J0605570
                    *                                                   J0605580
                          LDX  L2 FORM1-1    XR2=ADDR.OF 1ST.TITLE LINE J0605590
                          BSI     TRLNE      MOVE MSG.,PRINT LINE       J0605600
                    *                                                   J0605610
                          LDX  L2 FORM2-1    XR2=ADDR.OF 2ND.TITLE LINE J0605620
                          BSI     TRLNE      MOVE AND PRINT 2ND HDR     J0605630
                    *                                                   J0605640
                          BSI  I  LINE       LINE SPACE                 J0605650
                    *                                                   J0605660
                    *                                                   J0605670
                    *  INITIALIZE MAX. NUMBER OF LINES PER SECTOR       J0605680
                    *                                                   J0605690
                          LDX   2 21         21 LINES PER SECTOR        J0605700
                          STX  L2 LNCNT                                 J0605710
                          LD   L  DBAD       INIT DB ADDR               J0605720
                          STO  L  DBAD2      COLUMN-WISE                J0605730
                    *                                                   J0605740
                    *  SET XR2 TO THE ADDRESS OF THE FIRST LET/FLET     J0605750
                    *  ENTRY (WORD 6)                                   J0605760
                    *                                                   J0605770
                          LDX  I2 LETAR+C    XR2=ADDR.OF WC OF DISK I/O J0605780
                          MDX   2 6          XR2=ADDR. OF WORD 5        J0605790
                          STX   2 DL080+1    SAVE FOR FUTURE USE        J0605800
                          MDX   2 1          XR2=ADDR.OF WORD 6         J0605810
                    DL060 STX   2 DL065+1    SAVE XR2                   J0605820
                    *                                                   J0605830
                    *                                                   J0605840
                    * GO TO SUBROUTINE WHICH FORMS THE NEXT LINE IN THE J0605850
                    * PRINT BUFFER,AFTER FIRST HAVING INITIALIZED BLANK J0605860
                    * LINE SWITCH(BLNSW) TO ZERO                        J0605870
                    *                                                   J0605880
                          SRA     16         CLEAR                      J0605890
                          STO  L  BLNSW      BLANK LINE SWITCH          J0605900
                    *                                                   J0605910
                          BSI  L  SCAN       GO FORM A LINE             J0605920
                    *                                                   J0605930
                          NOP                                           J0605940
                          LDD  L  PRNTP      *INTERMEDIATE DUMP *       J0605950
                          STD   1 DUMPP      *CONTENTS OF THE   *       J0605960
                          BSI  I  MDUMP      *PRINT BUFFER      *       J0605970
                    *                                                   J0605980
                    DL062 LD   L  BLNSW      CHECK FOR BLANK LINE       J0605990
                          BSC  L  DL080,+-   YES,DONE 1 SCTR,GO WRAP-UP J0606000
                    *                                                   J0606010
                          BSI  I  PRINT      NO,GO PRINT THE LINE       J0606020
                          DC      PRNTA      ADDR.OF WORD COUNT         J0606030
                    *                                                   J0606040
                    DL065 LDX  L2 *-*        RESTORE XR2                J0606050
                          LD    2 2          * INITIALIZE   *           J0606060
                          A    L  DBAD2      * DB ADDRESS   *           J0606070
                          STO  L  DBAD2      * FOR NEXT LINE*           J0606080
                    *                                                   J0606090
                          MDX   2 3          NEXT SEQUENTIAL ENTRY ADDR J0606100
                          MDX  L  LNCNT,-1   DECREMENT LINE COUNT       J0606110
                          MDX     *+1        NOT FINISHED,BRANCH AROUND J0606120
                          MDX     DL080      DONE 1 SECTOR,GO WRAP UP   J0606130
                    *                                                   J0606140
                          STO  L  DBAD       INITIALIZE DB ADDRESS      J0606150
                          MDX     DL060      DO NEXT LINE               J0606160
                    *                                                   J0606170
                    *************************************************** J0606180
                    *  SUBROUTINE TO CLEAR THE PRINTER OUTPUT AREA    * J0606190
                    *  TO BLANKS                                      * J0606200
                    *************************************************** J0606210
                    *                                                   J0606220
                    CLEAR NOP                                           J0606230
                          LDX   1 60         NO.OF WORDS TO CLEAR       J0606240
                          LD      CL901      TWO BLANKS CHARACTERS      J0606250
                    CL010 STO  L1 PRNTA      CLEAR WORD                 J0606260
                    *                                                   J0606270
                          MDX   1 -1         DO NEXT WD.IF              J0606280
                          MDX     CL010      NOT FINISHED               J0606290
                    *                                                   J0606300
                          LDX  L1 C          RESTORE XR1                J0606310
                          BSC  I  CLEAR      RETURN                     J0606320
                    *                                                   J0606330
                    CL901 DC      /4040   2  2 EBC BLANK CHARACTERS     J0606340
                    *                                                   J0606350
                    *                                                   J0606360
                    *************************************************** J0606370
                    *  SUBROUTINE TO MOVE A TEN WORD HEADER MESSAGE   * J0606380
                    *  SUCCESSIVELY  5  TIMES IN TO CONTIGUOUS LOCA-  * J0606390
                    *  TIONS IN THE PRINT BUFFER AND PRINT THE LINE   * J0606400
                    *  THUS FORMED IN THE PRINT BUFFER                * J0606410
                    *************************************************** J0606420
                    TRLNE NOP                *************************  J0606430
                          LDX   1 5          *MOVE A 10 WORD HEADER  *  J0606440
                    TR010 LDX   3 10         *MESSAGE 6 SUCCESSIVE   *  J0606450
                          BSI     MOVE       *TIMES INTO CONSECUTIVE *  J0606460
                          MDX  L  MV010+1,12 *LOCATIONS IN THE       *  J0606470
                          MDX   1 -1         *PRINT AREA             *  J0606480
                          MDX     TR010      *************************  J0606490
                    *                                                   J0606500
                          LD      TR020                                 J0606510
                          STO     MV010+1    REINITIALIZE INSTRUCTION   J0606520
                          BSI  I  PRINT      TO DUPCO TO PRINT A LINE   J0606530
                    TR020 DC      PRNTA      PRINT OUTPUT AREA          J0606540
                    *                                                   J0606550
                          BSC  I  TRLNE      RETURN                     J0606560
                    *************************************************** J0606570
                    *  SUBROUTINE TO MOVE EBC MESSAGE INTO PRINT BFR  * J0606580
                    *************************************************** J0606590
                    *                                                   J0606600
                    MOVE  NOP                                           J0606610
                          STX   2 *+1                                   J0606620
                          LD   L3 *-*        LD.WORD TO BE MOVED        J0606630
                    MV010 STO  L3 PRNTA      STORE IN PRINT BUFFER      J0606640
                    *                                                   J0606650
                          MDX   3 -1         NEXT WORD                  J0606660
                          MDX     MOVE+2     LOOP IF NOT DONE           J0606670
                    *                                                   J0606680
                    *                                                   J0606690
                          BSC  I  MOVE       RETURN                     J0606700
                    *                                                   J0606710
                    *************************************************** J0606720
                    *  SUBROUTINE TO READ A SECTOR  AND RELATED       * J0606730
                    *  HOUSEKEEPING INSTRUCTIONS                      * J0606740
                    *************************************************** J0606750
                    RDSCT NOP                                           J0606760
                          LDX  I3 LETAR+C    CALLING SEQUENCE FOR .GET. J0606770
                          LDD  L  HDR        INSERT WORD-COUNT AND      J0606780
                          STD   3 0          SECTOR ADDRESS             J0606790
                    *                                                   J0606800
                    *                                                   J0606810
                          BSI  I  GET        GO READ A SCTR OF LET/FLET J0606820
                    *                                                   J0606830
                    DL068 BSC  I  RDSCT      RETURN                     J0606840
                    *                                                   J0606850
                    *************************************************** J0606860
                    DL070 LD   L3 #FLET+C    SET UP FLET SECTOR ADDR.   J0606870
                          SLA     4          ELIMINATE                  J0606880
                          SRA     4          *DRIVE CODE                J0606890
                          BSC  L  DL120,+-   NO FLET THIS DR,CHK NXT    J0606900
                          LD   L3 #FLET+C    GET FLET SECTOR ADR AGAIN  J0606910
                          BSC  L  DL025      GO DUMP FLET ONLY          J0606920
                    *************************************************** J0606930
                    *                                                   J0606940
                    DL080 LD   L  *-*        IS WD.5 OF THIS SCTR ZERO  J0606950
                    DL085 LDX  L3 *-*        RESTORE XR3                J0606960
                          BSC  L  DL120,+-   YES,DONE 1 CART,CHK NEXT.  J0606970
                    *                                                   J0606980
                    *                                                   J0606990
                          LD   L3 #FLET+C   *NO,CHECK WORD 5 OF THIS    J0607000
                          SLA     4         *SECTOR TO SEE IF WE ARE    J0607010
                          SRA     4         *CHAINING FROM LET TO FLET, J0607020
                          S    I  DL080+1   *IF SO,SET SWITCH,.CHNGE.   J0607030
                          STO  L  CHNGE     *ZERO,IF NOT,SET IT NONZERO J0607040
                    *                                                   J0607050
                    DL100 LD   L2 2+83*3                                J0607060
                          A    L  DBAD                                  J0607070
                          STO  L  DBAD      UPDATE FOR THE 105TH ENTRY  J0607080
                          LD   L3 #ULET+C   GET DRIVE-                  J0607090
                          SRA     12        *CODE OF THIS               J0607100
                          SLA     12        *CARTRIDGE.                 J0607110
                          OR   I  DL080+1   FORM ADDRESS OF NEXT SECTOR J0607120
                          BSC  L  DL025     *GO READ NEXT SECTOR        J0607130
                    *                                                   J0607140
                    DL120 LD    1 #FRDR     ARE ALL CARTRIDGES REQD     J0607150
                          BSC  L  DL140,-   NO, GO TO SIGN OFF          J0607160
                    *                                                   J0607170
                          MDX   3 1         STEP TO NEXT CART IN TBL    J0607180
                          STX  L3 TEMPO     XR3 TO TEMP LOC             J0607190
                          MDX  L  TEMPO,-4  HAVE WE DONE ALL CARTRIDGES J0607200
                          MDX     DL140     YES,GO SIGN OFF,            J0607210
                          SRA     16        NO,RESET THE DB COUNT-      J0607220
                          STO  L  CHNGE     *INITIALIZE SWITCH AND      J0607230
                          BSC  L  DL020     *GO DO NEXT CARTRIDGE       J0607240
                    *                                                   J0607250
                    *************************************************** J0607260
                    *                                                 * J0607270
                    *   PRINT THE DUMPLET/FLET SIGN OFF MESSAGE       * J0607280
                    *                                                 * J0607290
                    *************************************************** J0607300
                    DL140 BSI  I  LINE       ONE SPACE OR CARRIER RETRN J0607310
                    *                                                   J0607320
                          BSI  I  LINE       ONE SPACE OR CARRIER RETRN J0607330
                    *                                                   J0607340
                          BSI     CLEAR      CLEAR THE PRINT BUFFER     J0607350
                    *                                                   J0607360
                          LD    1 LETSW      WAS THIS JUST A FLET DUMP  J0607370
                          BSC  L  DL150,+Z   YES,GO FORMAT FLET SIGNOFF J0607380
                    *                                                   J0607390
                          LDD     SUFLT      NO,FORMAT LET/FLET SIGNOFF J0607400
                          STD     LTMSG+6    STORE .LET/.               J0607410
                    *                                                   J0607420
                          LDD     SUFLT+2                               J0607430
                          STD     LTMSG+8    STORE .FLET.               J0607440
                    *                                                   J0607450
                          LDX  L2 LTMSG-1    *MOVE SIGNOFF MESSAGE--END J0607460
                          LDX   3 10         *OF DUMPLET/FLET INTO PR   J0607470
                    DL145 BSI     MOVE       *BUFR AND PRINT IT         J0607480
                    *                                                   J0607490
                          BSI  I  PRINT      TO DUPCO TO PRINT A LINE   J0607500
                          DC      PRNTA                                 J0607510
                          LDD     SUFFT+2    CLEAR OUT LET/FLET TITLE   J0607520
                          STD  L  BUF6+19    FROM PAGE HEADING BUFFER   J0607530
                    DL147 BSI  I  REST       EXIT TO DUPCO -EXIT-       J0607540
                    *                                                   J0607550
                    DL150 LDD     SUFFT      FORMAT SIGNOFF MESSAGE FOR J0607560
                          STD     LTMSG+6    DUMP FLET                  J0607570
                    *                                                   J0607580
                          LDD     SUFFT+2    FILL                       J0607590
                          STD     LTMSG+8    BLANKS                     J0607600
                    *                                                   J0607610
                          LDX  L2 LTMSG-1    *MOVE SIGNOFF MESSAGE--END J0607620
                          LDX   3 10         *OF DUMPLET INTO PRINT     J0607630
                          MDX     DL145      *BUFFER AND PRINT MESSAGE  J0607640
                    *************************************************** J0607650
                          HDNG - DUMPLET/FLET - SINGLE ENTRY            J0607660
                    *                                                 * J0607670
                    DL300 STX   0 SECSW      INIT SECONDARY ENTRY SW    J0607680
                          BSI  L  PDCHR      PRINT DCOM TITLE AND HDR   J0607690
                          LDX  L3 PRNTA      INIT PRINT BFR POINTER     J0607700
                          LDX  I2 DELSW+C    XR2=ADDR.LET ENTRY MINUS 1 J0607710
                          MDX   2 1          XR2=ADDR.OF LET ENTRY      J0607720
                    DL310 LD    2 2          CHK DB COUNT FOR NON-ZERO  J0607730
                          BSC  L  DL340,Z    YES,PRIMARY ENTRY          J0607740
                          STO     SECSW      NO,SET SEC ENTRY SW        J0607750
                          MDX   2 -3         AND KEEP                   J0607760
                          MDX     DL310      LOOKING FOR PRIMARY        J0607770
                    *                                                 * J0607780
                    *************************************************** J0607790
                    *                                                 * J0607800
                    *FOUND PRIMARY ENTRY,HOWEVER, IF ORIGINAL REQUEST   J0607810
                    *WAS FOR A SECONDARY ENTRY--SECSW ZERO-- THEN DBADR J0607820
                    *HAS ALREADY BEEN UPDATED BY DUP CONTROL,THEREFORE  J0607830
                    *THE DB COUNT OF THIS ENTRY MUST BE SUBTRACTED      J0607840
                    *OUT AGAIN TO REFLECT A CORRECT DB ADDRESS          J0607850
                    *                                                   J0607860
                    *************************************************** J0607870
                    DL340 LD      SECSW      WAS ORIG NAME A SEC ENTRY  J0607880
                          BSC  L  DL345,Z    NO, .DBADR. IS OK,CONTINUE J0607890
                          LD    1 DBADR      YES,SUBTRACT               J0607900
                          S     2 2          DB COUNT OF                J0607910
                          STO   1 DBADR      THIS ENTRY                 J0607920
                    *                                                   J0607930
                    DL345 SRA     16                                    J0607940
                          STO  L  BLNSW      CLEAR BLANK NAME SWITCH    J0607950
                    *                                                   J0607960
                          LD    1 DBADR                                 J0607970
                          STO  L  DBAD       SINGLE ENTRY DB ADDR       J0607980
                    *                                                   J0607990
                    DL350 BSI  L  SCAN       GO FORMAT ONE ENTRY        J0608000
                    *                                                   J0608010
                          LD   L  BNMSW     WRITE SIGN-OFF MESS-    2-9 J0608020
                          BSC  L  DL140,+-   *AGE IF BLANK NAME.      * J0608030
                    *                                                   J0608040
                          BSI  I  PRINT      PRINT A LINE               J0608050
                          DC      PRNTA      PRINTER I/O AREA           J0608060
                    *                                                   J0608070
                          MDX   2 3          STEP TO NEXT ENTRY         J0608080
                          LD    2 2          CHK.FOR SECONDARY ENTRY    J0608090
                          BSC  L  DL140,Z    NO,SIGN-OFF                J0608100
                    *                                                   J0608110
                          MDX     DL350      YES,GO FORMAT ENTRY        J0608120
                    *************************************************** J0608130
                          HDNG - DUMPLET/FLET - CONSTANTS AND WORK CELL J0608140
                    *************************************************** J0608150
                    * CONSTANTS AND WORK CELLS                        * J0608160
                    *************************************************** J0608170
                    SECSW DC      *-*        SWITCH FOR SECONDARY ENTRY J0608180
                    PRNTA EQU     BUF3       PRINTER OUTPUT AREA        J0608190
                          BSS  E  0                                     J0608200
                    LTMSG EBC     . END OF DUMP.                        J0608210
                    TEMPO BSS     4                                     J0608220
                    SUFLT EBC     .LET/FLET.                            J0608230
                    SUFFT EBC     .FLET    .                            J0608240
                    LET   EBC     .LET .                                J0608250
                    DCOMH EBC     .=CIDN   $FPAD   =FPAD   =CIBA   =U.  J0608260
                          EBC     .LET   =FLET .                        J0608270
                    *                                                   J0608280
                    LETH  EBC     .SCTR NO.  UA/FXA.   WORDS AVAIL.  .  J0608290
                          EBC     .CHAIN ADDR. .                        J0608300
                    *                                                   J0608310
                    FORM1 EBC     . PROG  FOR DB   DB  .                J0608320
                    *                                                   J0608330
                    FORM2 EBC     . NAME  MAT CNT  ADDR.                J0608340
                    *                                                   J0608350
                    *                                                   J0608360
                    *  THE FOLLOWING WORD IS USED AS A SWITCH TO        J0608370
                    *  INDICATE WHEN WE GO  FROM LET TO FLET.           J0608380
                    *                                                   J0608390
                    CHNGE DC      0          LET TO FLET SWITCH         J0608400
                    *                                                   J0608410
                    TABAD DC      FRMTB      ADDRESS OF FORMAT CODE TBL J0608420
                          BSS  E  0                                     J0608430
                    *                                                   J0608440
                    *  FORMAT CODE TABLE,ARRANGED IN ORDER OF BIT       J0608450
                    *  CONFIGURATION,00,01,10,11                        J0608460
                    *                                                   J0608470
                    FRMTB EBC     . DSF.                              E J0608480
                          EBC     .    .                              O J0608490
                          EBC     . DCI.                              E J0608500
                          EBC     . DDF.                              O J0608510
                    *                                                   J0608520
                    *                                                   J0608530
                    *  PARAMETERS FOR INTERMEDIATE DUMP                 J0608540
                    *                                                   J0608550
                    PRNTP DC      PRNTA     UPPER LIMIT               E J0608560
                          DC      PRNTA+60  LOWER LIMIT               O J0608570
                    *                                                   J0608580
                    SV    DC      *-*   TWO WDS.ON EVEN BOUNDARY USED E J0608590
                          DC      *-*   FOR TEMP.STORAGE IN CNAME RTN O J0608600
                    HDR   DC      320   WORD-COUNT FOR LET SECTOR ADDR. J0608610
                          DC      *-*   LET SECTOR ADDR.                J0608620
                    H0C   DC      /00C0 USED FOR CONV.FROM NAME CDE-EBC J0608630
                    H40   DC      /4000 LEFT-HALF IS EBC BLANK          J0608640
                    TMP   DC      *-*   TEMPORARY STORAGE               J0608650
                    HFF   DC      /00FF HEX.CONST.TO AND RT.8 BITS      J0608660
                    H0040 DC      /0040 RIGHT-HALF IS EBC BLANK         J0608670
                    DBAD  DC      *-*   DB ADDR.ACROSS A LINE           J0608680
                    DBAD2 DC      *-*   DB ADDR.DOWN A COLUMN           J0608690
                    BLNSW DC      *-*   BLANK LINE SWITCH               J0608700
                    BNMSW DC      *-*   BLANK NAME SWITCH               J0608710
                    LNCNT DC      *-*   NO. OF LINES/SECTOR             J0608720
                    *                                                   J0608730
                    *  TABLE OF ADDRESSES OF DCOM WORDS TO BE PRINTED   J0608740
                    *                                                   J0608750
                    DCTAB DC      0                                     J0608760
                          DC      #CIDN+C    CARTRIDGE ID ADDR          J0608770
                          DC      $FPAD      FILE PROTECT ADDR(COMMA)   J0608780
                          DC      #FPAD+C    FILE PROTECT ADDR(DCOM)    J0608790
                          DC      #CIBA+C    CORE IMAGE BUFFER ADDR     J0608800
                          DC      #ULET+C    LET SECTOR ADDR            J0608810
                          DC      #FLET+C    FLET SECTOR ADDR.          J0608820
                          HDNG - DUMPLET/FLET - SCAN  SUBROUTINE        J0608830
                    *************************************************** J0608840
                    *  SCAN SUBROUTINE-- THIS SUBROUTINE FORMS A LINE * J0608850
                    *  IN THE PRINT BUFFER,EACH LET/FLET ENTRY IS     * J0608860
                    *  CONVERTED,FORMATED AND STORED IN THE PRINTER   * J0608870
                    *  AREA. A LINE IS COMPOSED OF SIX                * J0608880
                    *  LET/FLET ENTRIES                               * J0608890
                    *************************************************** J0608900
                    *                                                   J0608910
                    SCAN  NOP                                           J0608920
                          BSI  L  CLEAR      CLEAR THE PRINT BUFFER     J0608930
                    *                                                   J0608940
                          LDX   1 5          XR1=NO.OF ENTRIES PER LINE J0608950
                          LDX  L3 PRNTA      XR3=ADDR.OF PRINT BUFFER   J0608960
                    SC010 SRA     16                                    J0608970
                          STO     BNMSW      CLEAR BLANK NAME SWITCH    J0608980
                    *                                                   J0608990
                          BSI     CNAME      CNVRT.NAME TO EBC AND STOR J0609000
                    *                                                   J0609010
                          LD      BNMSW      CHECK FOR BLANK NAME       J0609020
                          BSC  L  SC020,+-   YES,EXIT                   J0609030
                    *                                                   J0609040
                          OR      BLNSW      UPDATE BLANK LINE SWITCH   J0609050
                          STO     BLNSW                                 J0609060
                    *                                                   J0609070
                          LD    2 0          GET 1ST.WD.OF LET ENTRY    J0609080
                          SRA     14         RIGHT-JUSTIFY FORMAT CODE  J0609090
                          SLA     1          MULTIPLY BY 2              J0609100
                          A       TABAD      ADD TABLE ADDRESS          J0609110
                          STO     *+1                                   J0609120
                          LDD  L  *-*        LD.EBC EQUIVALENCE         J0609130
                          STO   3 4          STORE FORMAT               J0609140
                          RTE     16         CODE IN                    J0609150
                          STO   3 5          PRINT BUFFER               J0609160
                    *                                                   J0609170
                          LD    2 +2         LOAD DB COUNT              J0609180
                          BSC  L  SC030,+-   EXIT IF SECONDARY ENTRY    J0609190
                    *                                                   J0609200
                          BSI  I  BINEB      CONVERT TO EBC             J0609210
                    *                                                   J0609220
                    *  FORMAT AND STORE THE DB COUNT IN THE PRINT BFR.  J0609230
                    *                                                   J0609240
                          LD   L  TEMP1+C    1ST TWO EBC CHARACTERS     J0609250
                          SRA     8          RT.JUSTIFY 1ST CHARACTER   J0609260
                          OR      H40        PUT A BLANK IN FRONT OF IT J0609270
                          STO   3 +6         STORE IN PRINT BUFFER      J0609280
                    *                                                   J0609290
                          LDD  L  TEMP1+C    LD.ALL 4 EBC CHARACTERS    J0609300
                          SLT     8          PUT 2ND AND 3RD IN ACCUM.  J0609310
                          STO   3 +7         STORE 2ND AND 3RD          J0609320
                    *                                                   J0609330
                          SLT     16         4TH CHAR TO LH SIDE OF ACC J0609340
                          OR      H0040      PUT A BLANK BEHIND IT      J0609350
                          STO   3 +8         STORE IN PRINT BUFFER      J0609360
                    *                                                   J0609370
                    *  FORMAT AND STORE THE DB ADDR IN PRINT BUFFER     J0609380
                    *                                                   J0609390
                          LD      DBAD       DB ADDR OF ENTRY           J0609400
                          BSI  I  BINEB      CONVERT TO EBC             J0609410
                    *                                                   J0609420
                          LDD  L  TEMP1+C    LD CONVERTED EBC CHARS     J0609430
                          STD   3 +9         STORE IN PRINT BUFFER      J0609440
                    *                                                   J0609450
                    SC013 LD   L  NAMSW+C    CHK FOR SINGLE ENTRY       J0609460
                          BSC  L  SC020,Z    YES,EXIT                   J0609470
                    *                                                   J0609480
                    SC015 STX   3 CM020+2    NO,SAVE XR3                J0609490
                    *                                                   J0609500
                    *  GO TO SUBROUTINE WHICH  COMPUTES THE DISK BLOCK  J0609510
                    *  ADDRESS OF THE NEXT ENTRY TO BE PROCESSED INTO   J0609520
                    *  THE PRINT BUFFER-- ALSO THE NEXT ENTRY ADDRESS   J0609530
                    *  WILL BE IN XR2                                   J0609540
                    *                                                   J0609550
                          BSI     CMPDB                                 J0609560
                    *                                                   J0609570
                    SC018 MDX   3 12         STEP POINTER IN PRINT BFR  J0609580
                          MDX   1 -1         HAVE WE DONE ONE LINE      J0609590
                          MDX     SC010      NO,DO NEXT ENTRY           J0609600
                    *                                                   J0609610
                    SC020 LDX  L1 C          YES,RESTORE XR1            J0609620
                          BSC  I  SCAN       RETURN                     J0609630
                    *                                                   J0609640
                    SC030 LDD     FRMTB+2    THIS IS A SECONDARY,SO     J0609650
                          STO   3 4          REMOVE FORMAT CODE         J0609660
                          STO   3 5          REMOVE FORMAT CODE         J0609670
                          MDX     SC013      CONTINUE                   J0609680
                          HDNG - DUMPLET/FLET - INDBA SUBROUTINE        J0609690
                    *************************************************** J0609700
                    *  SUBROUTINE TO INITIALIZE THE STARTING DISK BLOCK J0609710
                    *  ADDRESS OF THE LET/FLET SECTOR. DONE BY        * J0609720
                    *  MULTIPLYING THE UA/FXA BY 16. THE STARTING DB  * J0609730
                    *  ADDRESS IS INITIALIZED IN THE BEGINNING AND IF * J0609740
                    *  WE GO FROM LET TO FLET.                        * J0609750
                    *************************************************** J0609760
                    *                                                   J0609770
                    INDBA NOP                                           J0609780
                          LD    3 +3         LD SCTR.ADDR OF UA/FXA     J0609790
                          SLA     4          MULTIPLY BY 16 TO GET      J0609800
                          STO     DBAD       DISK BLOCK ADDR-- LINE     J0609810
                          STO     DBAD2      COLUMN                     J0609820
                    *                                                   J0609830
                          BSC  I  INDBA      RETURN                     J0609840
                          HDNG - DUMPLET/FLET - CMPDB SUBROUTINE        J0609850
                    *************************************************** J0609860
                    *  SUBROUTINE TO COMPUTE THE DB ADDRESS OF THE    * J0609870
                    *  NEXT LET/FLET ENTRY.THIS IS DONE BY            * J0609880
                    *  SUCCESSIVE Y ADDING TO THE CONTENTS OF.DBAD.   * J0609890
                    *  THE DB COUNTS OF THE NEXT 21 ENTRIES.          * J0609900
                    *  AT THE CONCLUSION OF THIS                      * J0609910
                    *  SUBROUTINE .DBAD. REFLECTS THE DB COUNT OF THE * J0609920
                    *  NEXT LET/FLET ENTRY AND XR2 POINTS TO THE FIRST* J0609930
                    *  WORD OF THE NEXT ENTRY.                        * J0609940
                    *************************************************** J0609950
                    CMPDB NOP                                           J0609960
                          MDX   1 -1         *BY-PASS THIS       *      J0609970
                          MDX     *+1        *ROUTINE IF THIS    *      J0609980
                          MDX     CM020      *IS THE LAST ENTRY  *      J0609990
                          LDX   3 21         *************************  J0610000
                          LD      DBAD       *ADD THE DB COUNTS OF   *  J0610010
                    CM010 A     2 2          *THE NEXT 21            *  J0610020
                          MDX   2 3          *ENTRIES TO .DBAD. ,THIS*  J0610030
                          MDX   3 -1         *GIVES DB ADDR.OF NEXT  *  J0610040
                          MDX     CM010      *ENTRY TO BE PRINTED    *  J0610050
                          STO     DBAD       *************************  J0610060
                    *                                                   J0610070
                    CM020 MDX   1 1          ADD BACK ONE               J0610080
                          LDX  L3 *-*        RESTORE XR3                J0610090
                          BSC  I  CMPDB      RETURN                     J0610100
                          HDNG - DUMPLET/FLET - CNAME SUBROUTINE        J0610110
                    *************************************************** J0610120
                    *  CNAME-THE SUBROUTINE WHICH CONVERTS A 5 CHAR.  * J0610130
                    *  NAME IN NAME-CODE AND CONVERTS TO 5 PACKED EBC * J0610140
                    *  CHAR-S STORED IN 3 WDS IN THE PRINT BFR WITH A * J0610150
                    *  BLANK PRECEDING THE FIRST CHARACTER            * J0610160
                    *************************************************** J0610170
                    *                                                   J0610180
                    *                  ******A-REG***********Q-REG***** J0610190
                    CNAME NOP                                           J0610200
                          LD    2 1    CCCCDDDDDDEEEEEE                 J0610210
                          RTE     16                   CCCCDDDDDDEEEEEE J0610220
                          LD    2 0    XXAAAAAABBBBBBCCCCCCDDDDDDEEEEEE J0610230
                          SLT     2    AAAAAABBBBBBCCCCCCDDDDDDEEEEEE00 J0610240
                          STD     SV   SHIFT OUT FORMAT CODE,SAVE A & Q J0610250
                          STO     BNMSW      SET BLANK NAME SWITCH      J0610260
                          RTE     16         TO ZERO FOR BLANK NAME OR  J0610270
                          OR      BNMSW      NON-Z IF NAME IS NONBLNK   J0610280
                          RTE     16   AAAAAABBBBBBCCCCCCDDDDDDEEEEEE00 J0610290
                    *                                                   J0610300
                          SRA     10   0000000000AAAAAA                 J0610310
                          BSI     CN010      GO SET-UP 8-BIT EBC CHAR   J0610320
                    *                                                   J0610330
                          OR      H40  0100000011AAAAAA                 J0610340
                          STO   3 +1         BLANK+1ST.CHAR IN PRINT BF J0610350
                    *                                                   J0610360
                          LDD     SV   AAAAAABBBBBBCCCCCCDDDDDDEEEEEE00 J0610370
                          SLT     6    BBBBBBCCCCCCDDDDDDEEEEEE00000000 J0610380
                          STD     SV                                    J0610390
                    *                                                   J0610400
                          SRA     10   0000000000BBBBBB                 J0610410
                          BSI     CN010      GO SET-UP 8-BIT EBC CHAR   J0610420
                    *                                                   J0610430
                          SLA     8    11BBBBBB00000000                 J0610440
                          STO     TMP        SAVE 2ND.CHAR.TEMPORARILY  J0610450
                    *                                                   J0610460
                          LDD  L  SV   BBBBBBCCCCCCDDDDDDEEEEEE00000000 J0610470
                          SLT     6    CCCCCCDDDDDDEEEEEE00000000000000 J0610480
                          SRT     10   ..........CCCCCCDDDDDDEEEEEE0000 J0610490
                          BSI     CN010      GO SET-UP 8-BIT EBC CHAR   J0610500
                    *                                                   J0610510
                          AND  L  HFF  0000000011CCCCCCDDDDDDEEEEEE0000 J0610520
                          A    L  TMP  11BBBBBB11CCCCCC                 J0610530
                          STO   3 +2   STORE 2ND,3RD.CHARS.IN PRINT BFR J0610540
                    *                                                   J0610550
                          SRA     16   0000000000000000DDDDDDEEEEEE0000 J0610560
                          SLT     6    0000000000DDDDDDEEEEEE0000000000 J0610570
                          BSI     CN010      GO SET-UP 8-BIT EBC CHAR   J0610580
                    *                                                   J0610590
                          SLA     2    00000011DDDDDD00EEEEEE0000000000 J0610600
                          SLT     6    11DDDDDD00EEEEEE0000000000000000 J0610610
                          BSI     CN010      GO SET-UP 8-BIT EBC CHAR   J0610620
                    *                                                   J0610630
                          STO   3 +3         4TH.,5TH.CHARS IN PR.BFR   J0610640
                    *                                                   J0610650
                          BSC  I  CNAME      RETURN                     J0610660
                    *                                                   J0610670
                    * INSTRUCTIONS TO CREATE THE 8-BIT EBC CHARACTER    J0610680
                    * FROM THE TRUNCATED 6-BIT CHARACTER.THIS IS DONE   J0610690
                    * BY OR-ING /00C0 IF THE CHARACTER IS ALPHABETIC    J0610700
                    * OR NUMERIC A-Z,0-9.IF THE CHAR. IS $,OR IN /0040. J0610710
                    * IF THE CHAR.IS POUND SIGN(#),CHANGE IT TO EQUAL   J0610720
                    * SIGN(=),IF IT IS AN AT SIGN (@),CHANGE IT TO AN   J0610730
                    * APOSTROPHE.                                       J0610740
                    *                                                   J0610750
                    CN010 DC      *-*                                   J0610760
                          STD     CN900      SAVE ACCUM AND EXTENSION   J0610770
                          AND     H003F      ISOLATE THE 6-BIT CHAR     J0610780
                          S       H001B      IS IT $ SIGN               J0610790
                          BSC  L  CN040,+-   YES,GO PROCESS DOLLAR SIGN J0610800
                          S       H0020      NO,CHECK POUND SIGN        J0610810
                          BSC  L  CN050,+-   YES,GO PROCESS POUND SIGN  J0610820
                          SRA     1          NO,VERIFY AT SIGN          J0610830
                          BSC     Z          SKIP IF AT SIGN            J0610840
                          MDX     CN060      CHAR.IS ALPHA OR NUMERIC   J0610850
                          LDD     CN900      RESTORE ORIGINAL CONTENTS  J0610860
                          AND     HFF00      KEEP LEFT-HALF OF WORD     J0610870
                          OR      H007D      CHANGE AT TO APOSTROPHE    J0610880
                    CN020 BSC  I  CN010      EXIT                       J0610890
                    *                                                   J0610900
                    CN040 LDD     CN900      RESTORE ORIGINAL CONTENTS  J0610910
                          AND     HFF00      KEEP LEFT-HALF OF WORD     J0610920
                          OR      H005B      INSERT DOLLAR SIGN         J0610930
                          MDX     CN020      EXIT                       J0610940
                    *                                                   J0610950
                    CN050 LDD     CN900      RESTORE ORIGINAL CONTENTS  J0610960
                          AND     HFF00      KEEP LEFT HALF             J0610970
                          OR      H007E      CHANGE POIND TO EQUAL SIGN J0610980
                          MDX     CN020      EXIT                       J0610990
                    *                                                   J0611000
                    CN060 LDD     CN900      RESTORE ORIGINAL CONTENTS  J0611010
                          OR      H00C0      CREATE 8-BIT EBC CHAR      J0611020
                          MDX     CN020      EXIT                       J0611030
                    *                                                   J0611040
                    CN900 DEC     0          WDS.TO SAVE ACCUM & EXT.   J0611050
                    H003F DC      /003F      CONST.TO SAVE RIGHT 6 BITS J0611060
                    H001B DC      /001B      CONST.TO TEST FOR $ SIGN   J0611070
                    H0020 DC      /0020      CONST.TO TEST POUND SIGN   J0611080
                    HFF00 DC      /FF00      CONST.TO SAVE LEFT 8 BITS  J0611090
                    H007D DC      /007D      EBC APOSTROPHE SIGN        J0611100
                    H007E DC      /007E      EBC EQUAL SIGN             J0611110
                    H005B DC      /005B      EBC DOLLAR SIGN            J0611120
                    H00C0 DC      /00C0      CONST.TO CREATE EBC CHARS  J0611130
                    *                                                   J0611140
                    *************************************************** J0611150
                    *  SUBROUTINE TO FORMAT A DCOM TITLE LINE IN      * J0611160
                    *  THE PRINT BUFFER,PRINT IT, CLEAR THE BUFFER AND* J0611170
                    *  FORMAT DCOM HEADER INFORMATION IN THE BUFFER AND J0611180
                    *  PRINT THE LINE.THE BUFFER IS CLEARED BEFORE EXIT J0611190
                    *************************************************** J0611200
                    PDCHR DC      *-*                                   J0611210
                          BSI  L  CLEAR      GO CLEAR PRINTER AREA      J0611220
                    *                                                   J0611230
                          LDX  L2 DCOMH-1    XR2=HEADER MESSAGE ADDRESS J0611240
                          LDX   3 23         XR3=NO.OF WORDS TO MOVE    J0611250
                          BSI  L  MOVE       MOVE HDR.MSG,PRINT A LINE  J0611260
                    *                                                   J0611270
                          BSI  I  PRINT      TO DUPCO TO PRINT A LINE   J0611280
                          DC      PRNTA      PRINT BUFFER ADDRESS       J0611290
                    *                                                   J0611300
                          BSI  L  CLEAR      CLEAR THE PRINT BUFFER     J0611310
                    *                                                   J0611320
                    *  CODING TO MOVE THE DCOM DATA INTO THE PRINT AREA J0611330
                    *                                                   J0611340
                    PD020 LDX  L3 *-*        RESTORE XR3 TO LOG.DR NO.  J0611350
                          LDX  L2 PRNTA      XR2=PRNT BFR POINTER       J0611360
                          LDX   1 6          XR1=NO.DCOM WDS TO PICK UP J0611370
                    PD030 LD   L1 DCTAB      PICK UP DCOM WORD ADDR     J0611380
                          STO     *+1                                   J0611390
                          LD   L3 *-*        LD.DCOM WORD.              J0611400
                          BSI  I  BINEB      CONVERT TO EBC             J0611410
                    *                                                   J0611420
                          LDD  L  TEMP1+C    LD.4 CONVERTED EBC CHARS.  J0611430
                          STD   2 +21        STORE IN PRINT BUFFER      J0611440
                    *                                                   J0611450
                          MDX   2 -4         NXT.ADDR.TO STORE IN BFR   J0611460
                          MDX   1 -1         NXT.DCOM WD IN TABLE       J0611470
                          MDX     PD030      LOOP IF NOT FINISHED       J0611480
                    *                                                   J0611490
                          LDX  L1 C          RESTORE XR1                J0611500
                    *                                                   J0611510
                    *                                                   J0611520
                    * CONVERTED AND FORMATED DCOM INFORMATION IS        J0611530
                    * SITTING IN THE PRINT BUFFER,NOW PRINT A LINE      J0611540
                    *                                                   J0611550
                          BSI  I  PRINT      PRINT DCOM INFORMATION     J0611560
                          DC      PRNTA                                 J0611570
                    *                                                   J0611580
                          BSI  I  LINE       ONE SPACE OR CARRIER RETRN J0611590
                    *                                                   J0611600
                          BSI  L  CLEAR      CLEAR PRINT BUFFER         J0611610
                    *                                                   J0611620
                          BSC  I  PDCHR      RETURN                     J0611630
                    *                                                   J0611640
                    *  PATCH AREA                                       J0611650
                    *                                                   J0611660
                          BSS     $ZEND+/3BF-*   PATCH ROOM             J0611670
                          DC      /FFFF     END OF DUMPLET PATCH AREA   J0611680
                    *************************************************** J0611690
                          END     DLET                                  J0611700
