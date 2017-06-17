                          HDNG    DCTL -DUP CONTROL - COMMA  2 AUG 67   J0200010
                          ABS                                           J0200020
                    $CIBA EQU     /5   ADDR OF CIB ON MASTER CARTRIDGE  J0200030
                    $CH12 EQU     /6   CHANNEL 12 INDR,NON-ZERO=CHAN 12 J0200040
                    $COMN EQU     /7   WORD COUNT OF COMMON             J0200050
                    $CORE EQU     /E   CORE SIZE,/1000=4K,/2000=8K,ETC) J0200060
                    $CTSW EQU     /F   MCR SW,NON-ZERO=// RECD TRAPPED  J0200070
                    $DADR EQU     /10  SCTR ADDR OF PROG TO BE FETCHED  J0200080
                    $DABL EQU     /11  IOCC FOR SCA RESET (ODD ADDR)    J0200090
                    $DREQ EQU     /12  INDR FOR REQUESTED V. DISK I/O   J0200100
                    $IBSY EQU     /13  PRINC I/O BUSY INDR,NON-ZERO=BSY J0200110
                    $HASH EQU     /14  WORK AREA FOR MONITOR PROGRAMS   J0200120
                    $PRET EQU     /28  ADDR PREOPERATIVE ERROR TRAP     J0200130
                    $IREQ EQU     /2C  ADDR OF INT REQUEST SUBROUTINE   J0200140
                    $ULET EQU     /2D  ADDR OF LET, LOGICAL DRIVE 0     J0200150
                    $IOCT EQU     /32  IOCS CTR,0=NO I/O IN PROGRESS    J0200160
                    $LAST EQU     /33  LAST CD INDR,NON-ZERO=LAST CARD  J0200170
                    $NDUP EQU     /34  INHIBIT DUP SW,NON-ZERO=NO DUP   J0200180
                    $NXEQ EQU     /35  INHIBIT EXEC SW,NON-ZERO=NO EXEQ J0200190
                    $PBSY EQU     /36  PRINC PTR BUSY INDR,NON-ZERO=BSY J0200200
                    $PGCT EQU     /37  PAGE NO. FOR PAGE HEADINGS       J0200210
                    $EXIT EQU     /38  ADDR CALL EXIT ENTRY POINT       J0200220
                    $LINK EQU     /39  ADDR CALL LINK ENTRY POINT       J0200230
                    $DUMP EQU     /3F  ADDR OF CALL DUMP, ENTRY POINT   J0200240
                    $DCDE EQU     /77  DRIVE CODE FOR CORE LOAD BLDR    J0200250
                    $PHSE EQU     /78  NO. OF PHASE CURRENTLY IN CORE   J0200260
                    $UFIO EQU     /79  ARM POSITION IN UNFORMATTED AREA J0200270
                    $WSDR EQU     /7A  WORKING STORAGE DRIVE CODE       J0200280
                    $WRD1 EQU     /7B  LOAD ADDR FOR CURR USER CORE LD  J0200290
                    $KCSW EQU     /7C  INHIBIT INPUT/PRINT OVERLAP SW   J0200300
                    $UFDR EQU     /7D  UNFORMATTED I/O DRIVE CODE       J0200310
                    $CPTR EQU     /7E  CHANNEL 12 INDICATOR FOR CP      J0200320
                    $1132 EQU     /7F  CHANNEL 12 INDICATOR FOR 1132    J0200330
                    $1403 EQU     /80  CHANNEL 12 INDICATOR FOR 1403    J0200340
                    $PST1 EQU     /81  ADDR POSTOP ERROR TRAP,LEVEL 1   J0200350
                    $PST2 EQU     /85  ADDR POSTOP ERROR TRAP,LEVEL 2   J0200360
                    $PST3 EQU     /89  ADDR POSTOP ERROR TRAP,LEVEL 3   J0200370
                    $PST4 EQU     /8D  ADDR POSTOP ERROR TRAP,LEVEL 4   J0200380
                    $STOP EQU     /91  ADDR PROGRAM STOP KEY TRAP       J0200390
                    $FPAD EQU     /95  FILE PROTECT ADDR (ADJ),LOG DR 0 J0200400
                    $CYLN EQU     /9A  ARM POSITION FOR LOGICAL DRIVE 0 J0200410
                    $ACDE EQU     /9F  AREA CODE FOR LOGICAL DRIVE 0    J0200420
                    $DCYL EQU     /A4  1ST DEF CYL ADDR, LOGICAL DR 0   J0200430
                    $I200 EQU     /B3  ENTRY POINT TO ILS FOR LEVEL 2   J0200440
                    $I205 EQU     /B8                                   J0200450
                    $IBT2 EQU     $I205+1 ADDR OF IBT FOR LEVEL 2       J0200460
                    $I400 EQU     /C4  ENTRY POINT TO ILS FOR LEVEL 4   J0200470
                    $I405 EQU     /D3                                   J0200480
                    $IBT4 EQU     $I405+1 ADDR OF IBT FOR LEVEL 4       J0200490
                    $I410 EQU     /D5                                   J0200500
                    $DBSY EQU     /EE  DISK BUSY INDR,NON-ZERO=DK BUSY  J0200510
                    $BYSW EQU     /1CB BYPASS SW,NOP IF FETCHING SOCAL  J0200520
                    DZ000 EQU     /0F2 DISKZ ENTRY POINT                J0200530
                    $ZEND EQU     /1E0 ADDR 1+LAST WORD OF DISKZ        J0200540
                          HDNG          CONCATENATED COMMON AREA(CATCO) J0200550
                    C     EQU     /7FA0     CATCO POINTER SET TO MIDDLE J0200560
                    *************************************************** J0200570
                    *                                                 * J0200580
                    *  INDEX REG 1 IS SET TO .C. WHEN CATCO IS FORMED * J0200590
                    *  FOR USE BY ALL OF DUP FUNCTIONS. ANY DUP ROUT  * J0200600
                    *  USING XR 1 FOR OTHER REASONS MUST RESTORE.     * J0200610
                    *  ALL VALUES IN CATCO HAVE LABELS EQUATED TO THE * J0200620
                    *  VALUE THAT INDICATES THEIR RELATIVE LOCATION   * J0200630
                    *  FROM .C.                                       * J0200640
                    *                                                 * J0200650
                    *************************************************** J0200660
                    *                                                 * J0200670
                    *             CATCO DCOM IMAGE                    * J0200680
                    *   EQUIVALENCES USED TO REFERENCE CATCO WITH XR1 * J0200690
                    *                                                 * J0200700
                    *************************************************** J0200710
                    #NAME EQU     4-/80     NAME OF PROGRAM             J0200720
                    #DBCT EQU     6-/80     DISK BLOCK COUNT OF PROGRAM J0200730
                    #FCNT EQU     7-/80     FILES SW,ZERO = NO FILES    J0200740
                    #SYSC EQU     8-/80     NON-ZERO,SYSTEM CARTRIDGE   J0200750
                    #JBSW EQU     9-/80     JOB SW,NON-ZERO='T' MODE    J0200760
                    #CBSW EQU     10-/80    CLB SW,NON-ZERO=STORECI     J0200770
                    #LCNT EQU     11-/80    NO. OF LOCALS               J0200780
                    #MPSW EQU     12-/80    NON-ZERO, CORE MAP DESIRED  J0200790
                    #MDF1 EQU     13-/80    NO. OF DUP CTRL RCDS        J0200800
                    #MDF2 EQU     14-/80    ADDR OF MODIF BUFFER        J0200810
                    #NCNT EQU     15-/80    NO. OF NOCALS               J0200820
                    #ENTY EQU     16-/80    RELATIVE ENTRY ADDR OF PROG J0200830
                    #RP67 EQU     17-/80    IF NON-ZERO,1442 MOD 6,7    J0200840
                    *                                                   J0200850
                    *   NEGATIVE VALUE REPRESENTS DEFAULT CONDITION   * J0200860
                    #TODR EQU     18-/80    DR CODE OF 'TO' DRIVE       J0200870
                    #FRDR EQU     19-/80    DR CODE OF 'FROM' DRIVE     J0200880
                    *                                                 * J0200890
                    #FHOL EQU     20-/80    ADDR OF LARGEST FXA HOLE    J0200900
                    #FSZE EQU     21-/80    BLK CNT LARGEST HOLE IN FXA J0200910
                    #UHOL EQU     22-/80    ADDR OF LAST UA 1DUMY  2-10 J0200920
                    #USZE EQU     23-/80    BLK CNT LAST UA 1DUMY  2-10 J0200930
                    #DCSW EQU     24-/80    NON-ZERO=DUP CALL           J0200940
                    #PIOD EQU     25-/80    PRINC. I/O  INDICATOR       J0200950
                    #PPTR EQU     26-/80    PRINC. PRINTER INDICATOR    J0200960
                    #CIAD EQU     27-/80    WD NO. SCTR 0,CIL ADDR      J0200970
                    #ACIN EQU     28-/80    AVAILABLE CARTRIDGE INDR2-8 J0200980
                    #GRPH EQU     29-/80    2250 INDICATOR          2-8 J0200990
                    #GCNT EQU     30-/80    NO. G2250 RECORDS       2-8 J0201000
                    #LOSW EQU     31-/80    LOCAL-CALL-LOCAL SWITCH 2-3 J0201010
                    #X3SW EQU     32-/80    SPECIAL-ILS SWITCH      2-3 J0201020
                    #ECNT EQU     33-/80    NO. OF EQUAT RCDS       2-8 J0201030
                    #ANDU EQU     35-/80    END OF UA (ADJ) LOG DR 0-4  J0201040
                    #BNDU EQU     40-/80    END OF UA (BASE) LOG DR 0-4 J0201050
                    #FPAD EQU     45-/80    FILE PROTECT ADDR (BASE)    J0201060
                    #PCID EQU     50-/80    CART ID, PHYS DR 0-4        J0201070
                    #CIDN EQU     55-/80    CART ID, LOG DR 0-4         J0201080
                    #CIBA EQU     60-/80    CIB ADDR, LOG DR 0-4        J0201090
                    #SCRA EQU     65-/80    SCRA, LOG DR 0-4            J0201100
                    #FMAT EQU     70-/80    WS FORMAT, LOG DR 0-4       J0201110
                    #FLET EQU     75-/80    FLET ADDR, LOG DR 0-4       J0201120
                    #ULET EQU     80-/80    LET ADDR, LOG DR 0-4        J0201130
                    #WSCT EQU     85-/80    WS BLK CNT, LOG DR 0-4      J0201140
                    #CSHN EQU     90-/80    CUSHION END SCTR ADDR, 0-4  J0201150
                    #DCOM EQU     1         SCTR ADDR OF DCOM           J0201160
                    #HDNG EQU     7         SCTR WITH PAGE HEADING      J0201170
                    @SBFR EQU     /FB0                              2-8 J0201180
                          HDNG    CONCATENATED COMMON AREA (CATCO)      J0201190
                    *************************************************** J0201200
                    *                                                 * J0201210
                    *             CATCO IOAR HDRS FOR DUP PHASES        J0201220
                    *                                                 * J0201230
                    *************************************************** J0201240
                          ORG     -/10                                  J0201250
                    DCHDR BSS     2         DUP CONTROL            PH02 J0201260
                    STHDR BSS     2         STORE                  PH03 J0201270
                    FLHDR BSS     2         FILEQ                  PH04 J0201280
                    DMHDR BSS     2         DUMP                   PH05 J0201290
                    DLHDR BSS     2         DUMPLET                PH06 J0201300
                    DTHDR BSS     2         DELETE                 PH07 J0201310
                    DFHDR BSS     2         DEFINE                 PH08 J0201320
                    DXHDR BSS     2         DUP EXIT               PH09 J0201330
                    UCHDR BSS     2         DUP UPCOR              PH13 J0201340
                    PIHDR BSS     2         PRINCIPAL I/O BLOCK    PH14 J0201350
                    SIHDR BSS     2         PRINC I/O (W/O KB) BLK PH15 J0201360
                    PTHDR BSS     2         PAPER TAPE I/O BLOCK   PH16 J0201370
                    CIHDR BSS     2         CI PHASE READ BY CL BUILDER J0201380
                    MUHDR BSS     2         MACRO UPDATE      PH206 2-8 J0201390
                    D2HDR BSS     2         DUP CONTROL 2     PH205 2-8 J0201400
                          HDNG    DCTL -    CATCO DUP SWITCHES          J0201410
                    *************************************************** J0201420
                    *                                                   J0201430
                    *             CATCO DUP SWITCHES                  * J0201440
                    *      WORDS USED FOR COMMUNICATION OF DATA         J0201450
                    *   BETWEEN DUP ROUTINES.                           J0201460
                    *                                                 * J0201470
                    *      INITIALIZED TO ZERO BY  .REST. OF DUPCO    * J0201480
                    *                                                   J0201490
                    *************************************************** J0201500
                    CL1   EQU     *                                     J0201510
                    ASMSW BSS     1         NON ZERO IF DEFINE VOID ASM J0201520
                    BITSW BSS     1         NON ZERO TO ALLOW MDUMP-S   J0201530
                    BLKSW BSS     1         NON ZERO IF BYPASSING REC   J0201540
                    CIERR BSS     1         ERROR NO DETECTED BY PH 17  J0201550
                    CISW  BSS     1         NON ZERO IF STORE CI        J0201560
                    CLBSW BSS     1         NON ZERO IF PRECI EXECUTED  J0201570
                    CNTNO BSS     1         RECORD NO BEING PCHD OR RD  J0201580
                    *                                                 * J0201590
                    *   .DATSW. IS FILLED WITH THE CNT FIELD OF THE   * J0201600
                    *   DUP CONTROL RECORD.                           * J0201610
                    *   USED PRIMARILY FOR DATA MOVEMENT, BUT ALSO IS * J0201620
                    *   USED FOR COUNT OF RECORDS TO READ AFTER A     * J0201630
                    *   STORE CI DUP CONTROL RECORD.                  * J0201640
                    DATSW BSS     1         RECORDS VALUE IN CNT FIELD  J0201650
                    DBADR BSS     1         DB ADDR OF REFERENCED PROG  J0201660
                    DELSW BSS     1         ADDR OF REQ LET ENTRY - 1   J0201670
                    DFNSW BSS     1         NON ZERO IF DEFINE FXA      J0201680
                    DKSAD BSS     1         DK SCTR ADDR W/O DR CODE    J0201690
                    DUMPP BSS  E  2         LAST LIMITS FOR PRNTR DUMP  J0201700
                    FORSW BSS     1         NON ZERO IF DEFINE VOID FOR J0201710
                    FRWS  BSS     1         NON ZERO IF FROM FLD IS WS  J0201720
                    FXSW  BSS     1         NON ZERO IF FIXED AREA REQD J0201730
                    HOLSW BSS     1         NON ZERO IF NO CONV REQD    J0201740
                    IOSW  BSS     1         NON ZERO IF IN/OUT REQD     J0201750
                    *                                                 * J0201760
                    *   DUMPLET SWITCH - ZERO IF NOT DUMPLET/DUMPFLET * J0201770
                    *       PLUS VALUE REQUIRES PRINT OF BOTH LET/FLET* J0201780
                    *       NEG. VALUE REQUIRES PRINT OF FLET ONLY    * J0201790
                    LETSW BSS     1         NON ZERO,PRINT LET OR FLET* J0201800
                    LSTLF BSS     1         LAST LET/FLET SECT PROCESSD J0201810
                    MODSW BSS     1         NON ZERO IF STORE MOD FUNC  J0201820
                    NAMSW BSS     1         NON ZERO IF NAME IN LET/F   J0201830
                    NEGSW BSS     1         NON ZERO IF SHRINKING FXA   J0201840
                    PGMHL BSS     1         WORD COUNT OF THE PROG HDR  J0201850
                    PRSW  BSS     1         NON ZERO IF PRINTING OUTPUT J0201860
                    PTSW  BSS     1         NON ZERO IF PAPER TAPE REQD J0201870
                    SKWDS BSS     1         WDS TO SEARCH IN L/F SECT   J0201880
                    STCSW BSS     1         NON ZERO IF STORE DATA CI   J0201890
                    STSW  BSS     1         NON ZERO IF STORE TYPE      J0201900
                    TEMP1 BSS  E  1         1ST WD OF BINEB OUTPUT      J0201910
                    TEMP2 BSS     1         2ND WD OF BINEB OUTPUT      J0201920
                    TOWS  BSS     1         NON ZERO IF TO FIELD IS WS  J0201930
                    T3MSW BSS     1         TYPE 3,4 SOCAL LEVEL CELL   J0201940
                    UASW  BSS     1         NON ZERO IF USER AREA REQD  J0201950
                    WSSW  BSS     1         NON ZERO IF WORK STG REQD   J0201960
                    XEQSW BSS     1         NON ZERO IF NOT RET FR GET  J0201970
                    EBCSW BSS     1         NON ZERO IF EBC DATA OP 2E2 J0201980
                    HDNSW BSS     1         NON ZERO IF NAME IN HDR 2-3 J0201990
                    RPGSW BSS     1         NON Z IF DEFINE VOID RPG2-5 J0202000
                    DFLSW BSS     1         NON ZERO IF *DFILE      2-8 J0202010
                          BSS     1         RESERVED FOR ADDITION   2-8 J0202020
                    CL2   EQU     *-1                                   J0202030
                          HDNG    DCTL -    CATCO DUP SWITCHES          J0202040
                    *************************************************** J0202050
                    *                                                 * J0202060
                    *             CATCO DUP SWITCHES                  * J0202070
                    *  INITIALIZED BY DCTL AND NOT RESET BY .REST.    * J0202080
                    *                                                 * J0202090
                    *************************************************** J0202100
                    IOREQ BSS     1         NON-ZERO,AUX I/O SET REQ    J0202110
                    PH2   BSS     1         NON-ZERO IF DCTL IN CORE    J0202120
                    PH3   BSS     1         NON-ZERO IF STORE IN CORE   J0202130
                    PH4   BSS     1         NON-ZERO IF DUMP IN CORE    J0202140
                    ************************************************2-8 J0202150
                    *                                               2-8 J0202160
                    *             CATCO SWITCH INITIALIZED TO ZERO  2-8 J0202170
                    *   BY CCAT SUBR AND SET BY MACRO UPDATE PROGRAM2-8 J0202180
                    *                                               2-8 J0202190
                    ************************************************2-8 J0202200
                    DUPCR BSS     1         NON ZERO IF DUP CTRL RCD2-8 J0202210
                    *************************************************** J0202220
                    *                                                 * J0202230
                    *             CATCO DUP SWITCHES SET BY CCAT SUBR * J0202240
                    *                                                 * J0202250
                    *************************************************** J0202260
                    ADDR2 BSS     1         KB INTERRUPT ADDRESS        J0202270
                    KBREQ BSS     1         CONTENTS OF LOC 13          J0202280
                    *      THE FOLLOWING SWITCH IS SET TO INDICATE THE  J0202290
                    *       PRINCIPAL INPUT DEVICE                      J0202300
                    *             -  IS PAPER TAPE                      J0202310
                    *             0  IS CARD                            J0202320
                    *             +  IS KEYBOARD                        J0202330
                    INOUT BSS     1         PRINCIPAL INPUT SWITCH      J0202340
                    *                                                   J0202350
                    PTPON BSS     1         NON-ZERO IF PAPER TP ON SYS J0202360
                    *************************************************** J0202370
                    *                                                 * J0202380
                    *             LEVEL 4 INTERRUPT BRANCH TABLE      * J0202390
                    *             ADDRESSES. INITIALIZED BY CCAT,     * J0202400
                    *             AND CARD/PAPER TAPE INTERFACES.     * J0202410
                    *                                                 * J0202420
                    *************************************************** J0202430
                          ORG     /0049                                 J0202440
                    IBT   BSS     9         9 WD INTRPT BRANCH TABLE    J0202450
                    *************************************************** J0202460
                    *                                                 * J0202470
                    *             CATCO I/O ADDRESSES REQUIRED BY DUP * J0202480
                    *                                                 * J0202490
                    *************************************************** J0202500
                    P1442 BSS  E  2         SYS 1442 IOAR HEADER        J0202510
                    PRPAR BSS     2         DEFAULT LIMITS TO PRINT     J0202520
                    PHDUP BSS     1         LAST DUP PHASE IN CORE      J0202530
                    CRBUF BSS     1         81 WD BFR FOR DUP CTRL RCDS J0202540
                    DCADR BSS     1         ADDR FOR DUP CTRL IOAR HDR  J0202550
                    HDBUF BSS     1         ADDR OF PAGE HEADING BFR    J0202560
                    IOBLK BSS     1         ADDR OF DUP I/O PHASE       J0202570
                    SDBUF BSS     1         STORE/DUMP BUFFER           J0202580
                    LETAR BSS     1         ADDR OF LET SEARCH BUFFER   J0202590
                    PEBUF BSS     1         41 WD BFR FOR PACKED EBCDIC J0202600
                    THIS  BSS     1         ADDR OF DOUBLE BFR, BFR 1   J0202610
                    NEXT  BSS     1         ADDR OF DOUBLE BFR, BFR 2   J0202620
                          HDNG              DUP CORE PARAMETERS         J0202630
                    DISKZ EQU     DZ000     DISKZ ENTRY POINT           J0202640
                    B     EQU     $ZEND-2                               J0202650
                    DMPLC EQU     B         IOAR CORE ADDR FOR DMPLT    J0202660
                    EXITC EQU     B         IOAR CORE ADDR FOR DEXIT    J0202670
                    MUPC  EQU     B         IOAR CORE ADDR FOR MUP  2-8 J0202680
                    DCTL  EQU     B+/1002   ENTRY ADDRESS OF DCTL       J0202690
                    DCTLC EQU     B+/1000   IOAR CORE ADDR FOR DCTL     J0202700
                    WSDC  EQU     B+/2000   IOAR CORE ADDR FOR STORE    J0202710
                    DUMPC EQU     B+/4000   IOAR CORE ADDR FOR DDUMP    J0202720
                    DUPCO EQU     /7DB0     ADDR OF RESIDENT DUPCO      J0202730
                    CATCO EQU     /7F20-2   ADDR OF DCOM IOAR HEADER    J0202740
                    *                                                 * J0202750
                    *  DUPCO ENTRY POINTS...USED WITH INDIRECT BSI    * J0202760
                    *                                                 * J0202770
                          ORG     DUPCO                                 J0202780
                    BINEB BSS     1         CONVERSION BINARY TO EBCDIC J0202790
                    WRTDC BSS     1         WRITE DCOM(S) SUBROUTINE    J0202800
                    ENTER BSS     1         SAVE XR-S AND CONDITIONS    J0202810
                    GET   BSS     1         READ FROM DISK USING DISKZ  J0202820
                    LEAVE BSS     1         HANDLES ALL EXITS FROM DUP  J0202830
                    LINE  BSS     1         SPACES PRINTER 1 LINE       J0202840
                    MASK  BSS     1         INHIBITS KB INT REQUEST     J0202850
                    MDUMP BSS     1         PRINTS SELECTED CORE LOC-S  J0202860
                    PAGE  BSS     1         SKIPS TO NEXT PAGE          J0202870
                    PHID  BSS     1         RECORDS PHASE ID            J0202880
                    PHIDM BSS     1         RECORDS PHASE AND MODIFIER  J0202890
                    PRINT BSS     1         USE SYS PR SUBR TO PRINT    J0202900
                    PUT   BSS     1         WRITES TO DISK USING DISKZ  J0202910
                    REST  BSS     1         RESTORE CATCO,GO TO DCTL    J0202920
                    RTURN BSS     1         RESTORE XR-S AND CONDITIONS J0202930
                    *                                                 * J0202940
                    *  INPUT/OUTPUT PARAMETERS , CORE ADDRESSES       * J0202950
                    *                                                 * J0202960
                    BUF6  EQU     DUPCO-/1F ADDR OF PAGE HEADING BUFFER J0202970
                    PRPNT EQU     BUF6-/141 IOAR ADDR FOR PRINC. PTR    J0202980
                    IOADR EQU     BUF6-/38B START OF I/O INTERFACE      J0202990
                    GETHO EQU     IOADR+4   ENTRY FOR READING HOLL TYPE J0203000
                    GETBI EQU     IOADR+5   ENTRY FOR READING BINARY    J0203010
                    PACKB EQU     IOADR+6   ENTRY TO PACK BINARY        J0203020
                    PCHBI EQU     IOADR+7   ENTRY TO PUNCH BINARY       J0203030
                    BUF1  EQU     IOADR-/51 ADDR OF NEXT BUFFER         J0203040
                    BUF2  EQU     BUF1-/52  ADDR OF THIS BUFFER         J0203050
                    BUF3  EQU     BUF2-/3E  ADDR OF PACKED EBC BUFFER   J0203060
                    BUF4  EQU     BUF3-/52  ADDR OF CONTROL RCD BUFFER  J0203070
                    BUF5  EQU     IOADR-/284   ADDR OF LET SCTR BFR     J0203080
                    BUF7  EQU     BUF5-/7142   ADDR OF STORE/DUMP BFR   J0203090
                          HDNG    DUP CONTROL(DCTL*PROLOGUE 1200-20APR  J0203100
                    *************************************************** J0203110
                    *                                                 * J0203120
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * J0203130
                    *                                                 * J0203140
                    *FUNCTION/OPERATION-DUP CONTROL (DCTL) READS      * J0203150
                    *   DECODES PRINTS AND ANALYZES DUP CONTROL       * J0203160
                    *   RECORDS.                                      * J0203170
                    *   DCTL SEARCHES LET/FLET AS REQUIRED, RECORDS   * J0203180
                    *   LET/FLET ENTRY INFIRMATION, SETS UP REQUIRED  * J0203190
                    *   ENTRY CODES AND CALLS IN REQUIRED DUP MODULE. * J0203200
                    *                                                 * J0203210
                    *ENTRY POINTS- DCTL -  ENTRY FROM DUPCO TO READ   * J0203220
                    *   AND PROCESS THE NEXT RECORD.  LINKAGE IS      * J0203230
                    *     BSC  L3 2    FROM THE .GET. SUBR OF DUPCO   * J0203240
                    *                  WHERE XR3 CONTAINS THE CORE    * J0203250
                    *                  ADDRESS OF THE IOAR HEADER OF  * J0203260
                    *                  DCTL.                          * J0203270
                    *                                                 * J0203280
                    *INPUT-  RECORDS FROM CARDS, PAPER TAPE OR KEY-   * J0203290
                    *   BOARD. THESE ARE GENERALLY DUP CONTROL RECORDS* J0203300
                    *   BUT LAST ONE,BEFORE RETURNING CONTROL TO THE  * J0203310
                    *   SUPERVISOR,IS A SUPERVISOR CONTROL RECORD.    * J0203320
                    *        IF,THE DUP CTL REC IS A STORE FROM CARDS * J0203330
                    *   THEN 2 CARDS IN DISK SYSTEM FORMAT ARE READ   * J0203340
                    *   LET/FLET FROM ALL CARTRIDGES ASSIGNED TO THE  * J0203350
                    *   CURRENT JOB                                   * J0203360
                    *                                                 * J0203370
                    *OUTPUT- PRINTING OF DUP CONTROL RECORDS & PAGE NO* J0203380
                    *                                                 * J0203390
                    *EXTERNAL REFERENCES-                             * J0203400
                    *   ENTER - SAVE XR-S, A AND Q REGS, AND STATUS   * J0203410
                    *   RTURN -RESTORE XR, A AND Q REGS, AND STATUS   * J0203420
                    *   GET   -READ  FROM THE DISK                    * J0203430
                    *         -FETCH DUP MODULE FROM DISK AND EXECUTE * J0203440
                    *   GETBI -READ DSF HDR REC,CONV TO UNPACKED EBC  * J0203450
                    *   GETHO -READ CONTROL RECORD CONV TO PACKED EBC * J0203460
                    *   LEAVE -EXIT FROM DUP-SUPERVISOR CONTROL REC RD* J0203470
                    *         -RECORD ERROR MESSAGE,GO TO REST (DUPCO)* J0203480
                    *   LINE  -TO SPACE 1 LINE ON PRINCIPAL PRINT DEV.* J0203490
                    *   PACKB -CONVERT UNPACKED EBCDIC TO PACKED EBC  * J0203500
                    *   PAGE  -TO RESTORE PAPER                       * J0203510
                    *   PHID  -TO IDENTIFY DCTL BEING IN CORE         * J0203520
                    *   PHIDM -TO MARK PROGRESS OF DCTL               * J0203530
                    *   PRINT -TO PRINT DUP CONTROL RECORDS           * J0203540
                    *                                                 * J0203550
                    *EXITS-NORMAL                                     * J0203560
                    *                                               2-8 J0203570
                    *                                               2-8 J0203580
                    *   STORE,DUMP,DELETE OR DUMPLET DUP CONTROL    2-8 J0203590
                    *   RECORDS RECOGNIZED. EXIT IS THRU GET SUBR OF  * J0203600
                    *   DUPCO.                                        * J0203610
                    *   EXIT TO DCTL2 VIA GET IF DUP CONTROL RECORD 2-8 J0203620
                    *   IS NOT A STORE,DUMP,DELETE OR DUMPLET/FLET. 2-8 J0203630
                    *   EXIT TO FILEQ (PH04) TO PROCESS RECORDS THAT  * J0203640
                    *   ARE REQUIRED FOR STORE CI (*FILES,*LOCALS,    * J0203650
                    *   *NOCALS).                                     * J0203660
                    *   EXIT TO STORE TO COMPLETE STORECI AFTER       * J0203670
                    *   RETURNING FROM THE CORE LOAD BUILDER          * J0203680
                    *   MONITOR CONTROL RECORD REQUIRES EXIT THRU THE * J0203690
                    *   LEAVE ROUTINE OF DUPCO                        * J0203700
                    *     -ERROR                                      * J0203710
                    *   INVALID DUP CTRL REC CAUSES EXIT THRU THE     * J0203720
                    *   LEAVE SUBR OF DUPCO WITH ERROR CODES OF 13    * J0203730
                    *   THRU 18.                                      * J0203740
                    *   INVALID DSF HEADER RECORD WILL CAUSE EXIT THRU* J0203750
                    *   THE LEAVE SUBR OF DUPCO WITH DUP ERROR CODES  * J0203760
                    *   OF 01,02,03, OR 05.                           * J0203770
                    *                                                 * J0203780
                    *TABLES/WORK AREAS- CATCO                         * J0203790
                    *   CATCO - CONCATENATED COMMON AREA OF DUPCO     * J0203800
                    *   CRBUF - ADDR OF INPUT BFR FOR CONTROL RECORDS * J0203810
                    *   LETAR - ADDR OF AREA USED TO SEARCH EACH      * J0203820
                    *           SECTOR OF EACH LET/FLET.              * J0203830
                    *   NEXT  - ADDR OF PACKED BINARY DATA RECORDS    * J0203840
                    *   PEBUF - ADDR FOR PACKED EBCDIC CONTROL RECORDS* J0203850
                    *    THIS  - ADDR OF INPUT BFR FOR DATA RECORDS   * J0203860
                    *                                                 * J0203870
                    *ATTRIBUTES- REUSABLE                             * J0203880
                    *                                                 * J0203890
                    *NOTES                                            * J0203900
                    *************************************************** J0203910
                          HDNG    DCTL - READ DUP CONTROL RECORDS       J0203920
                    *************************************************** J0203930
                          ORG     DCTLC                                 J0203940
                          DC      *-*       USED BY SYSTEM LOADER       J0203950
                          DC      +/0002    PHASE ID FOR DCTL           J0203960
                    *************************************************** J0203970
                    *                                                 * J0203980
                    *   LABELS FOR ERROR MESSAGES FROM DCTL           * J0203990
                    *                                                 * J0204000
                    *************************************************** J0204010
                    PH201 EQU     01        NAME IS NOT PRIME ENTRY     J0204020
                    PH202 EQU     02        INVALID HEADER RECORD TYPE  J0204030
                    PH203 EQU     03        INVALID HEADER LENGTH       J0204040
                    PH205 EQU     05        SECONDARY ENT PT IN LET/FLE J0204050
                    PH206 EQU     06        ENTRY POINT OR NAME IN LET  J0204060
                    PH212 EQU     12        INVALID DISK I/O SPECIFIED  J0204070
                    PH213 EQU     13        INVALID FUNCTION FIELD      J0204080
                    PH214 EQU     14        INVALID FROM FIELD          J0204090
                    PH215 EQU     15        INVALID TO FIELD            J0204100
                    PH216 EQU     16        INVALID NAME FIELD          J0204110
                    PH217 EQU     17        INVALID COUNT FIELD         J0204120
                    PH218 EQU     18        INVALID DURING TEMP MODE    J0204130
                    PH219 EQU     19        CARTRIDGE NOT ON SYSTEM     J0204140
                    PH220 EQU     20        CART ID OUTSIDE VALID RANGE J0204150
                    PH221 EQU     21        INVALID STOREMOD            J0204160
                    PH222 EQU     22        PROGRAM NOT IN WORK STORAGE J0204170
                    PH223 EQU     23        INVALID SYSTEM OVERLAY SPEC J0204180
                    PH224 EQU     24        COUNT FIELD TOO LONG        J0204190
                    PH225 EQU     25        REQUIRED FORMAT NOT IN WS   J0204200
                    PH226 EQU     26        NAME NOT FOUND IN LET/FLET  J0204210
                    PH227 EQU     27        SOURCE NOT IN DSF           J0204220
                    PH285 EQU     85        FIXED AREA NOT PRESENT      J0204230
                    *************************************************** J0204240
                    FLQSW EQU     MODSW     NON ZERO IF FILEQ REQUIRED  J0204250
                    READ  EQU     *         LABEL NEXT INSTRUCTION      J0204260
                          BSI  I  PHID      IDENTIFY DUP PHASE IN CORE  J0204270
                          DC      /0002     DUP CONTROL (DCTL)          J0204280
                    *                                                 * J0204290
                          LDD  L  RE902                                 J0204300
                          STD   1 PRPAR     PRINT PARAMETER LIMITS      J0204310
                          STD   1 DUMPP                                 J0204320
                    *                                                   J0204330
                          SLA     16                                    J0204340
                          STO   1 #DCSW     CLEAR DUP CALL SWITCH       J0204350
                    *                                                   J0204360
                    *************************************************** J0204370
                    *                                                 * J0204380
                    *   GO AND PROCESS HEADER IF RETURNING FROM FILEQ * J0204390
                    *                                                 * J0204400
                    *************************************************** J0204410
                          LD    1 FLQSW                                 J0204420
                          BSC  L  RE005,-+  NOT RETURNING FROM FILEQ    J0204430
                    *                                                 * J0204440
                          SLA     16                                    J0204450
                          STO   1 FLQSW     CLEAR FILEQ XEQ SW          J0204460
                          BSC  L  ST015     READ AND PROCESS HEADER     J0204470
                    *                                                 * J0204480
                    *************************************************** J0204490
                    *                                                 * J0204500
                    *   GO GET AND EXECUTE STORE MODULE IF RETURNING  * J0204510
                    *   FROM THE CORE LOAD BUILDER                    * J0204520
                    *                                                 * J0204530
                    *************************************************** J0204540
                    RE005 LD    1 CISW                                  J0204550
                          BSC  L  PL035,Z   RETURNING FROM THE CLB      J0204560
                    *                                                 * J0204570
                    *************************************************** J0204580
                    *                                                 * J0204590
                    *   FETCH DUP PHASE 14 TO OVERLAY DUP SUBR SET    * J0204600
                    *   CURRENTLY IN IOBLK AREA OF CORE               * J0204610
                    *                                                 * J0204620
                    *************************************************** J0204630
                          LD    1 IOREQ                                 J0204640
                          BSI  L  RI710,Z   PRINC I/O IS NOT IN CORE    J0204650
                    *                                                 * J0204660
                    *************************************************** J0204670
                    *                                                 * J0204680
                    *   READ NEXT DUP CONTROL RECORD                  * J0204690
                    *   RETURNS WITH PACKED EBCDIC IN PEBUF           * J0204700
                    *                                                 * J0204710
                    *************************************************** J0204720
                    RE010 LDX  L2 BUF3+1    SET CC POINTER TO CD COL 1  J0204730
                          SLA     16                                    J0204740
                          STO  L  $CTSW     CLEAR CONTROL REC SW        J0204750
                    *                                                 * J0204760
                          STO   1 #TODR     INITIALIZE SPECIAL DCOM SWS J0204770
                          STO   1 #FRDR                                 J0204780
                          STO   1 #FHOL                                 J0204790
                          STO   1 #UHOL                                 J0204800
                          LD    1 DUPCR     TEST FOR DUP CONTROL    2-8 J0204810
                          BSC  L  RE015,Z   *RECORD IN BFR-BR IF SO 2-8 J0204820
                    *                                                 * J0204830
                          BSI  I  GETHO     READ CONTROL RECORD         J0204840
                    *                                                 * J0204850
                          HDNG    DCTL -DECODE FUNCTION OF DUP CTRL REC J0204860
                    *************************************************** J0204870
                    *                                                 * J0204880
                    *   PROCESS ALL NON MON OR DUP CONTROL RECORDS    * J0204890
                    *                                                 * J0204900
                    *************************************************** J0204910
                    RE015 LD    1 BLKSW                                 J0204920
                          BSC  L  RE010,Z   BYPASS NON CONTROL RECORDS  J0204930
                    *                                                   J0204940
                    *                       RESET DUP CONTROL RECORD2-8 J0204950
                          STO   1 DUPCR     *IN BUFFER SWITCH       2-8 J0204960
                    *                                               2-8 J0204970
                          LD   L  $CTSW     NON ZERO IF MON CTRL RECORD J0204980
                          BSC  L  RE060,Z   PROCESS   MONITOR CTRL REC  J0204990
                    *                                                   J0205000
                          BSI     RE080     PRINT DUP CONTROL RECORD    J0205010
                    *                                                 * J0205020
                    *************************************************** J0205030
                    *                                                 * J0205040
                    *   CHECK COL 35 FOR MDUMP REQUEST                * J0205050
                    *   BLANK FOR NO DUMP                             * J0205060
                    *   ZERO  FOR ALL DUP PHASES EXCEPT DUPCO         * J0205070
                    *   2 THRU 9 FOR DUP PHASES 2 THRU 9 RESPECTIVELY * J0205080
                    *   11 AND 12 ZONE PUNCHES WILL INHIBIT DUMP.     * J0205090
                    *                                                 * J0205100
                    *************************************************** J0205110
                          LD      *-1       NEGATIVE NUMBER             J0205120
                          STO   1 BITSW     SET TO DUMP ALL PHASES      J0205130
                    *                                                 * J0205140
                          LD   L  BUF3+18   COLUMNS 35 AND 36           J0205150
                          AND     RE903     /FF00 MASK COL 36           J0205160
                          EOR     RE904     /F000. ONLY NUMBERS WILL    J0205170
                          SRA     8         * HAVE BITS 0 THRU 11 ZERO  J0205180
                          BSC     Z         SKIP IF DUMP OF ALL PHASES  J0205190
                    *                                                 * J0205200
                          STO   1 BITSW     RECORD PHASE REQUESTED      J0205210
                    *                                                 * J0205220
                    *************************************************** J0205230
                    *                                                 * J0205240
                    *   CHECK FOR STORE TYPE DUP FUNCTION             * J0205250
                    *                                                 * J0205260
                    *************************************************** J0205270
                          BSI  L  DCBAF     CHECK COLS 1,2              J0205280
                          EBC     .*S.      STORE CONSTANT              J0205290
                          MDX     RE020     NOT STORE TYPE              J0205300
                    *                                                   J0205310
                          BSI     DCEXF     CHECK COLS 3,4              J0205320
                          EBC     .TO.      STORE CONSTANT              J0205330
                          DC      PH213     INVALID FUNCTION CODE       J0205340
                    *                                                   J0205350
                          BSI     DCEXF     CHECK COLS 5,6              J0205360
                          EBC     .RE.      STORE CONSTANT              J0205370
                          DC      PH213     INVALID FUNCTION CODE       J0205380
                    *                                                   J0205390
                          BSC  L  STCTL     STORE TYPE CONTROL RECORD   J0205400
                    *                                                 * J0205410
                    *************************************************** J0205420
                    *                                                 * J0205430
                    *   CHECK FOR DUMP TYPE DUP FUNCTION              * J0205440
                    *                                                 * J0205450
                    *************************************************** J0205460
                    RE020 BSI     DCBAF     CHECK COLS 1, 2       2-11  J0205470
                          EBC     .*D.      DUMP CONSTANT               J0205480
                          MDX     RE050     NOT D, GET DCTL2 PHASE  2-8 J0205490
                    *                                                   J0205500
                          BSI     DCBAF     CHECK COLS 3,4              J0205510
                          EBC     .UM.      DUMP CONSTANT               J0205520
                          MDX     RE040     NOT STORE OR DUMP TYPE  2-8 J0205530
                    *                                                 * J0205540
                          BSI  L  FRLAB     DECODE FR AND TO CART ID-S  J0205550
                    *                                                   J0205560
                          BSI     DCBAF     CHECK COLS 5,6              J0205570
                          EBC     .P .      DUMP CONSTANT               J0205580
                          MDX     RE030     NOT DUP DUMP CONTROL RECORD J0205590
                    *                                                   J0205600
                          BSC  L  DUCTL     DUMP CONTROL RECORD         J0205610
                    *                                                   J0205620
                    RE030 BSI     DCBAF     CHECK COLS 5,6              J0205630
                          EBC     .PD.      DUMP DATA CONSTANT          J0205640
                          MDX     RE035     NOT DUMPDATA,TRY DUMPLET2-8 J0205650
                    *                                                   J0205660
                          BSI     DCEXF     CHECK COLS 7,8              J0205670
                          EBC     .AT.      DUMPDATA CONSTANT           J0205680
                          DC      PH213     INVALID FUNCTION CODE       J0205690
                    *                                                   J0205700
                          BSI     DCEXF     CHECK COLS 9,10             J0205710
                          EBC     .A .      DUMPDATA CONSTANT           J0205720
                          DC      PH213     INVALID FUNCTION CODE       J0205730
                    *                                                   J0205740
                          BSC  L  DACTL     DUMP DATA TYPE              J0205750
                    RE035 BSI     DCBAF     CHECK COLS 5,6              J0205760
                          EBC     .PL.      DUMPLET CONSTANT            J0205770
                          MDX     RE038     NOT DUMPLET                 J0205780
                    *                                                   J0205790
                          STO   1 LETSW     INDICATE LET/FLET PRINT     J0205800
                    *                                                 * J0205810
                          BSC  L  LECTL     DUMPLET TYPE                J0205820
                    *                                                   J0205830
                    RE038 BSI     DCEXF     CHECK COLS 5,6              J0205840
                          EBC     .PF.      DUMPFLET CONSTANT           J0205850
                          DC      PH213     INVALID FUNCTION CODE       J0205860
                    *                                                   J0205870
                          BSC  L  FLCTL     DUMPFLET CONTROL RECORD     J0205880
                    *                                                 * J0205890
                    RE040 BSI     DCBAF     CHECK COLS 3,4          2-8 J0205900
                          EBC     .FI.      DFILE CONSTANT          2-8 J0205910
                          MDX     RE045     NOT DFILE, TRY DELETE   2-8 J0205920
                    *                                               2-8 J0205930
                          BSI     DCEXF     CHECK COLS 5,6          2-8 J0205940
                          EBC     .LE.      DFILE CONSTANT          2-8 J0205950
                          DC      PH213     INVALID FUNCTION CODE   2-8 J0205960
                    *                                               2-8 J0205970
                          BSC  L  DDCTL     DFILE TYPE CONTROL RECD 2-8 J0205980
                    RE045 BSI     DCBAF     CHECK COLS 3,4              J0205990
                          EBC     .EL.      DELETE CONSTANT             J0206000
                          MDX     RE050     NOT DELETE,GET DCTL2    2-8 J0206010
                    *                                                   J0206020
                          BSI     DCEXF     CHECK COLS 5,6              J0206030
                          EBC     .ET.      DELETE CONSTANT             J0206040
                          DC      PH213     INVALID FUNCTION CODE       J0206050
                    *                                                   J0206060
                          BSI     DCEXF     CHECK COLS 7,8              J0206070
                          EBC     .E .      DELETE CONSTANT             J0206080
                          DC      PH213     INVALID FUNCTION CODE       J0206090
                    *                                                   J0206100
                          BSC  L  DLCTL     DELETE FUNCTION             J0206110
                    *                                                   J0206120
                    *************************************************** J0206130
                    RE050 EQU     *                                 2-8 J0206140
                          LDX  L3 DCTLC     IOAR HDR CORE ADDR OF DCTL2 J0206150
                          LDD   1 D2HDR     IOAR HDR FOR DCTL2          J0206160
                          BSC  L  PLUS2     GO TO FETCH DCTL2 PHASE 2-8 J0206170
                    *************************************************** J0206180
                    *                                                 * J0206190
                    *   PROCESS   MONITOR CONTROL RECORD              * J0206200
                    *                                                 * J0206210
                    *************************************************** J0206220
                    RE060 MDX   2 +1        INCREMENT CD COL POINTER    J0206230
                          BSI     DCBAF     CHECK COLS 3,4              J0206240
                          EBC     . D.      MON DCR CONSTANT            J0206250
                          MDX     RE070     NOT // DUP RECORD           J0206260
                    *                                                   J0206270
                          BSI     DCEXF     CHECK COLS 5,6              J0206280
                          EBC     .UP.      MON DCR CONSTANT            J0206290
                          DC      0         NOT // DUP RECORD           J0206300
                    *                                                   J0206310
                          BSI     DCEXF     CHECK COLS 7,8              J0206320
                          EBC     .  .      MON DCE CONSTANT            J0206330
                          DC      0         NOT .// DUP  . RECORD       J0206340
                    *                                                   J0206350
                          STO  L  $CTSW     CLEAR MON CTRL REG SWITCH   J0206360
                    *                                                   J0206370
                          MDX     RE010     BYPASS .// DUP  . RECORD    J0206380
                    *                                                   J0206390
                    RE070 BSI     DCEXF     CHECK COLS 3,4              J0206400
                          EBC     . *.      COMMENT CONSTANT            J0206410
                          DC      0         NOT A MON COMMENT RECORD    J0206420
                    *                                                   J0206430
                          BSI     RE080     PRINT COMMENT RECORD        J0206440
                    *                                                   J0206450
                          MDX     RE010     READ NEXT DUP CONTROL REC   J0206460
                    *                                                 * J0206470
                    *************************************************** J0206480
                    *                                                 * J0206490
                    *   COMMON (DCTL) SUBR TO PRINT AN EBCDIC RECORD  * J0206500
                    *   AFTER A LINE SPACE. (AN INTERFACE TO PRINT    * J0206510
                    *                                                 * J0206520
                    *************************************************** J0206530
                    RE080 DC      *-*       RECORD RETURN ADDR          J0206540
                          BSI  I  LINE      SPACE 1 LINE BEFORE PRINT   J0206550
                    *                                                   J0206560
                          BSI  I  PRINT     GO TO PRINT EBCDIC INTERFCE J0206570
                          DC      BUF3      IOAR ADDR                   J0206580
                    *                                                   J0206590
                          MDX  L  #MDF1+C,-1     REDUCE #MDF1 COUNT     J0206600
                          NOP                                           J0206610
                    *                                                 * J0206620
                          BSC  I  RE080     RETURN TO CALLING SUBR      J0206630
                    *                                                 * J0206640
                    *************************************************** J0206650
                          BSS  E  0                                     J0206660
                    RE902 DC      BUF4      LOWER PRINT LIMIT FOR DCTL  J0206670
                          DC      PRINT     UPPER PRINT LIMIT FOR DCTL  J0206680
                    RE903 DC      /FF00     MASK                        J0206690
                    RE904 DC      /F000     MASK                        J0206700
                    *************************************************** J0206710
                          HDNG    DCTL -- COMPARE 2 EBCDIC CHARS. SUBR  J0206720
                    *************************************************** J0206730
                    *                                                 * J0206740
                    *   COMPARE  EBCDIC CHARS SPEC WITH 2 EBCDIC CHAR * J0206750
                    *   IN PEBUF SPEC BY THE CC POINTER (XR2)         * J0206760
                    *   ADVANCES CC POINTER TO NEXT 2 COLS            * J0206770
                    *   RETURNS TO SOURCE ADDR + 2 IF ALIKE.          * J0206780
                    *   IF UNEQUAL THEN GO TO LEAVE (DUPCO) WITH SPEC * J0206790
                    *   ERROR CODE.     LINKAGE IS                    * J0206800
                    *     BSI     DCEXF     COMPARING SUBROUTINE      * J0206810
                    *     EBC     .XX.      EBCDIC CHARACTERS         * J0206820
                    *     DC      YY        ERROR CODE                * J0206830
                    *                                                 * J0206840
                    *************************************************** J0206850
                    DCEXF DC      *-*       RECORD SOURCE ADDR          J0206860
                          LD   I  DCEXF     2 EBCDIC CHAR FROM PROG     J0206870
                          MDX  L  DCEXF,+2  STEP SOURCE ADDR FOR RETURN J0206880
                          S     2 0         2 EBCDIC CHAR FROM PEBUF    J0206890
                          MDX   2 +1        STEP CC PT TO NEXT 2 COLS   J0206900
                          BSC  I  DCEXF,-+  EQUAL SO RETURN             J0206910
                          MDX  L  DCEXF,-1                              J0206920
                          LD   I  DCEXF                                 J0206930
                          STO     *+2       RECORD ERROR CODE           J0206940
                    *                                                   J0206950
                    *************************************************** J0206960
                          BSI  I  LEAVE     PRINT ERROR MESSAGE         J0206970
                          DC      *-*       ERROR CODE SPECIFIED        J0206980
                    *************************************************** J0206990
                    *                                                 * J0207000
                    *************************************************** J0207010
                    *                                                 * J0207020
                    *   COMPARE 2 EBCDIC CHARS SPEC WITH THE 2 EBCDIC * J0207030
                    *   CHAR IN PEBUF SPEC BY THE CC POINTER (XR2).   * J0207040
                    *   ADVANCE CC POINTER TO NEXT 2 COLS ONLY IF SAME* J0207050
                    *   IF ALIKE RETURN TO SOURCE ADDR + 2            * J0207060
                    *   WITH SOURCE ADDR + 2 IN THE A REG.            * J0207070
                    *   IF UNEQUAL THEN RETURN TO SOURCE ADDR +1      * J0207080
                    *   THE LINKAGE IS                                * J0207090
                    *     BSI     DCBAF     COMPARE .XX. WITH NEXT COL* J0207100
                    *     EBC     .XX.      EBCDIC CHARACTERS         * J0207110
                    *     MDX     NG        UNEQUAL                   * J0207120
                    *                                                 * J0207130
                    *************************************************** J0207140
                    DCBAF DC      *-*       RECORD SOURCE ADDR          J0207150
                          LD   I  DCBAF     2 EBCDIC CHAR FOR COMPARE   J0207160
                          MDX  L  DCBAF,+1  STEP SOURCE ADDR            J0207170
                          S     2 0         2 EBCDIC CHAR FROM CTRL REC J0207180
                    DCBAG BSC  I  DCBAF,Z   UNEQUAL, RETURN       2-11  J0207190
                    *                                                   J0207200
                          MDX   2 +1        STEP CC POINTER TO NEXT COL J0207210
                          MDX  L  DCBAF,+1  STEP SOURCE ADDR            J0207220
                          LD      DCBAF     PUT SOURCE ADDR IN A REG    J0207230
                          MDX     DCBAG     EQUAL COMPARE, RETURN 2-11  J0207240
                    *************************************************** J0207250
                          HDNG    DCTL -- DECODE THE .FROM. FIELD       J0207260
                    *************************************************** J0207270
                    *                                                 * J0207280
                    *   DECODE FROM FIELD AND RECORD IN IOSW, PTSW,   * J0207290
                    *   WSSW, UASW, AND FXSW AS REQUIRED              * J0207300
                    *                                                 * J0207310
                    *************************************************** J0207320
                    SC130 DC      *-*       RECORD RETURN ADDRESS       J0207330
                          LDX  L2 BUF3+7    SET POINTER TO CD COL 13    J0207340
                    *                                                   J0207350
                          BSI     DCBAF     CHECK COLS 13,14            J0207360
                          EBC     .WS.                                  J0207370
                          MDX     SC132     NOT FROM WS                 J0207380
                    *                                                   J0207390
                          STO   1 WSSW      FROM WORK STORAGE           J0207400
                          STO   1 FRWS      FROM FIELD IS WS            J0207410
                          MDX     SC139     EXIT FROM THIS SUBR         J0207420
                    *                                                 * J0207430
                    SC132 BSI     DCBAF     CHECK COLS 13,14            J0207440
                          EBC     .PT.                                  J0207450
                          MDX     SC134     NOT FROM PT UNLESS PRIN I/O J0207460
                    *                                                   J0207470
                          STO   1 PTSW      FROM PAPER TAPE             J0207480
                          MDX     SC138     SET I/O SW AND EXIT         J0207490
                    *                                                   J0207500
                    SC134 BSI     DCBAF     CHECK COLS 13,14            J0207510
                          EBC     .UA.                                  J0207520
                          MDX     SC135     NOT FROM USER AREA          J0207530
                    *                                                   J0207540
                          STO   1 UASW                                  J0207550
                          MDX     SC139     EXIT IF FROM UA             J0207560
                    *                                                   J0207570
                    SC135 BSI     DCBAF     CHECK COLS 13,14            J0207580
                          EBC     .FX.                                  J0207590
                          MDX     SC137     NOT FROM FIXED AREA         J0207600
                    *                                                   J0207610
                          STO   1 FXSW      SET FIXED AREA SWITCH       J0207620
                          MDX     SC139     EXIT IF FROM FIXED AREA     J0207630
                    *                                                   J0207640
                    SC137 BSI     DCEXF     CHECK COLS 13,14            J0207650
                          EBC     .CD.                                  J0207660
                          DC      PH214     INVALID FROM FIELD          J0207670
                    *                                                   J0207680
                          LD    1 #PIOD     CHECK IF PAPER TAPE DEFAULT J0207690
                          BSC     +Z        SKIP IF  PAPERTAPE NOT I/O  J0207700
                          STO   1 PTSW      NEG,NON ZERO FOR PAPER TAPE J0207710
                    *                                                 * J0207720
                    SC138 STX  L0 IOSW+C    FROM CARD OR PAPER TAPE     J0207730
                    SC139 BSC  I  SC130     RETURN TO CALLER            J0207740
                    *************************************************** J0207750
                          HDNG    DCTL -- DECODE THE .TO. FIELD OF DCR  J0207760
                    *************************************************** J0207770
                    *                                                 * J0207780
                    *   DECODE TO FIELD AND RECORD IN IOSW, PTSW      * J0207790
                    *   PRSW, WSSW, UASW, AND FXSW AS REQUIRED.       * J0207800
                    *   THE .FRLAB. SUBR MUST HAVE BEEN EXECUTED FIRST* J0207810
                    *                                                 * J0207820
                    *************************************************** J0207830
                    SC170 DC      *-*       RECORD RETURN ADDRESS       J0207840
                          LDX  L2 BUF3+9    SET POINTER TO COL 17       J0207850
                    *                                                   J0207860
                          BSI     DCBAF     CHECK COLS 17,18            J0207870
                          EBC     .PT.                                  J0207880
                          MDX     SC172     NOT TO PT UNLESS PRINC I/O  J0207890
                    *                                                   J0207900
                          STO   1 PTSW      TO   PAPER TAPE             J0207910
                          MDX     SC178     SET I/O SW AND EXIT         J0207920
                    *                                                   J0207930
                    SC172 BSI     DCBAF     CHECK COLS 17,18            J0207940
                          EBC     .PR.                                  J0207950
                          MDX     SC173     NOT TO PRINTER              J0207960
                    *                                                   J0207970
                          STO   1 PRSW      TO PRINTER                  J0207980
                          MDX     SC178     SET I/O SW AND EXIT         J0207990
                    *                                                   J0208000
                    SC173 BSI     DCBAF     CHECK COLS 17,18            J0208010
                          EBC     .WS.                                  J0208020
                          MDX     SC175     NOT TO WS                   J0208030
                    *                                                   J0208040
                          STO   1 WSSW      TO WORK STORAGE             J0208050
                          STO   1 TOWS      THE TO FIELD IS WS          J0208060
                    *                                                 * J0208070
                          LD    1 FRWS                                  J0208080
                          BSC  L  ST820,Z   FROM WS INDICATED           J0208090
                    *                                                   J0208100
                          MDX     SC179     EXIT IF TO WS               J0208110
                    *************************************************** J0208120
                    *                                                 * J0208130
                    SC175 BSI     DCBAF     CHECK COLS 17,18            J0208140
                          EBC     .UA.                                  J0208150
                          MDX     SC176     NOT TO UA                   J0208160
                    *                                                   J0208170
                          STO   1 UASW      TO USER AREA                J0208180
                          MDX     SC179     EXIT IF TO UA               J0208190
                    *                                                   J0208200
                    SC176 BSI     DCBAF     CHECK COLS 17,18            J0208210
                          EBC     .FX.                                  J0208220
                          MDX     SC177     NOT TO THE FIXED AREA       J0208230
                    *                                                   J0208240
                          STO   1 FXSW      TO FIXED AREA INDICATOR     J0208250
                    *                                                   J0208260
                          LDX  I2 #TODR+C   SELECT LOG DRIVE NO         J0208270
                          LD    1 #TODR                                 J0208280
                          BSC     Z+        SKIP IF 'TO' DR SPECIFIED   J0208290
                          LDX   2 0         DEFAULT IS LOG DRIVE ZERO   J0208300
                          LD   L2 #FLET+C   SELECT FLET SAD OF THAT DR  J0208310
                          BSI  L  CKFXA     ERROR EXIT IF NO FIXED AREA J0208320
                    *                                                   J0208330
                          BSI  L  CKTMP     INHIBIT IF IN JOB T MODE    J0208340
                    *                                                   J0208350
                          MDX     SC179     EXIT                        J0208360
                    *                                                   J0208370
                    SC177 BSI     DCEXF     CHECK COLS 17,18            J0208380
                          EBC     .CD.                                  J0208390
                          DC      PH215     INVALID TO FIELD            J0208400
                    *                                                   J0208410
                          LD    1 #PIOD     CHECK IF PAPER TAPE DEFAULT J0208420
                          BSC     +Z        SKIP IF  PAPERTAPE NOT I/O  J0208430
                          STO   1 PTSW      NEG,NON ZERO FOR PAPER TAPE J0208440
                    *                                                 * J0208450
                    SC178 STX  L0 IOSW+C    TO AN I/O DEVICE INDICATED  J0208460
                    SC179 BSC  I  SC170     RETURN TO CALLER            J0208470
                    *************************************************** J0208480
                          HDNG    DCTL -- PROCESS DCR OF STORE TYPE     J0208490
                    STCTL STX  L  STSW+C    SET STORE SWITCH (IN CATCO) J0208500
                    *                                                   J0208510
                    *************************************************** J0208520
                    *                                                 * J0208530
                    *   COMMON CHECKS FOR FROM,TO,NAME & CART ID FIELDS J0208540
                    *                                                 * J0208550
                    *************************************************** J0208560
                          BSI  L  FRLAB     DECODE FR AND TO CART ID-S  J0208570
                    *                                                   J0208580
                          BSI     SC130     SCAN THE FROM FIELD   2-11  J0208590
                    *                                                 * J0208600
                          LD    1 FRWS                                  J0208610
                          OR    1 IOSW                                  J0208620
                          BSC  L  ST810,-+  SOURCE NOT I/O OR WS-ERROR- J0208630
                    *                                                 * J0208640
                    *************************************************** J0208650
                    *                                                 * J0208660
                    *   STORE TO WS DOES NOT REQUIRE A NAME           * J0208670
                    *                                                 * J0208680
                    *************************************************** J0208690
                          BSI     SC170     SCAN THE TO FIELD     2-11  J0208700
                          LD    1 TOWS                                  J0208710
                          BSC  L  ST001,Z   STORING TO WORKING STORAGE  J0208720
                    *                                                 * J0208730
                          OR    1 UASW                                  J0208740
                          OR    1 FXSW                                  J0208750
                          BSC  L  ST820,-+  NOT TO WS,UA,OR FXA -ERROR- J0208760
                    *                                                   J0208770
                          BSI  L  SNAME     CONVERT NAME FIELD          J0208780
                    *                                                   J0208790
                          LD    1 #NAME                                 J0208800
                          BSC  L  ST830,-+  NAME NOT SPECIFIED  -ERROR- J0208810
                    *                                                 * J0208820
                          BSI  L  LETSR     SEARCH LET/FLET FOR NAME    J0208830
                    *                                                 * J0208840
                          HDNG    DCTL -- PROCESS DCR OF STORE TYPE     J0208850
                    *************************************************** J0208860
                    *                                                 * J0208870
                    *   SET UP #FRDR AND #TODR FOR DEFAULT CONDITIONS * J0208880
                    *                                                 * J0208890
                    *   IF STORING, FROM WORKING STORAGE,THEN $WSDR   * J0208900
                    *   IS THE DEFAULT CONDITION FOR #FRDR.           * J0208910
                    *   IF STORING, FROM AN INPUT DEVICE,THEN THE     * J0208920
                    *   MASTER CARTRIDGE (LOGICAL ZERO) IS THE DEFAULT* J0208930
                    *   CONDITION.                                    * J0208940
                    *                                                 * J0208950
                    *   IF STORE IS TO UA/FXA THEN DEFAULT TO LOG ZERO* J0208960
                    *   (MASTER CARTRIDGE). IF TO WS,    THEN $WSDR   * J0208970
                    *   IS THE DEFAULT SETTING FOR  #TODR             * J0208980
                    *                                                 * J0208990
                    *************************************************** J0209000
                    ST001 LD    1 #FRDR                                 J0209010
                          BSC  L  ST002,-   FROM CART IS SPECIFIED      J0209020
                    *                                                 * J0209030
                          LD   L  $WSDR     DEFAULT IF FROM WS          J0209040
                          MDX  L  IOSW+C,0  DO A SKIP IF FROM WS        J0209050
                          SLA     16        DEFAULT IF FROM I/O         J0209060
                          STO   1 #FRDR     SELECTED DEFAULT DRIVE NO.  J0209070
                    *                                                 * J0209080
                    ST002 LD    1 #TODR                                 J0209090
                          STO     DSPEC     0,+ DRIVE SPEC SW ON   2-10 J0209095
                    *                       * - DRIVE SPEC SW OFF  2-10 J0209097
                          BSC  L  ST003,-   THE TO CART IS SPECIFIED    J0209100
                    *                                                 * J0209110
                          LD    1 TOWS                                  J0209120
                          BSC  L  *+2,-+    BR IF DEFAULT IS TO ZERO    J0209130
                          LD   L  $WSDR                                 J0209140
                          STO   1 #TODR                                 J0209150
                    *                                                 * J0209160
                    *************************************************** J0209170
                    *                                                 * J0209180
                    *   DECODE BALANCE OF FUNC FIELD (STORE MODIFIERS)* J0209190
                    *                                                 * J0209200
                    *************************************************** J0209210
                    ST003 BSS     0         LABEL OF NEXT INSTRUCTION   J0209220
                          LDX  L2 BUF3+4    POINT TO COLS 7 AND 8       J0209230
                          BSI  L  DCBAF     CHECK COLS 7,8              J0209240
                          EBC     .  .      STORE   CONSTANT            J0209250
                          MDX     ST200     NOT .STORE  . TRY STOREMOD  J0209260
                          HDNG    DCTL -- PROCESS DCR OF STORE TYPE     J0209270
                    *************************************************** J0209280
                    *                                                 * J0209290
                    *   DECODE COL 11 FOR SYSTEM OVERLAY SPECIFICATION* J0209300
                    *                                                 * J0209310
                    *************************************************** J0209320
                    ST004 LDX  L2 BUF3+6    POINT TO COLS 11 AND 12     J0209330
                          BSI  L  DCBAF     CHECK COLS 11,12            J0209340
                          EBC     .  .      SOCAL CONSTANT              J0209350
                          MDX     *+1       IT IS A SOCAL               J0209360
                    *                                                 * J0209370
                          MDX     ST010     NOT ELIGIBLE TO BE A SOCAL  J0209380
                    *                                                   J0209390
                          LD    2 0         PICK UP COLS 11,12          J0209400
                          A       ST904                                 J0209410
                          BSC  L  ST005,C   NUMERIC CHARACTER           J0209420
                    *                                                   J0209430
                    *************************************************** J0209440
                    ST007 BSI  I  LEAVE     PRINT ERROR MESSAGE     212 J0209450
                          DC      PH223     INVALID SYSTEM OVERLAY      J0209460
                    *************************************************** J0209470
                    *                                                   J0209480
                    ST005 AND     ST903     LEAVE NUMERIC PART OF COL11 J0209490
                          SLA     4                                     J0209500
                          STO   1 T3MSW     RECORD NUMERIC VALUE ONLY   J0209510
                    *                                                   J0209520
                    *************************************************** J0209530
                    *                                                 * J0209540
                    *   SPECIAL .STORE  . ERROR CHECKING              * J0209550
                    *                                                 * J0209560
                    *************************************************** J0209570
                    ST010 LD    1 NAMSW                                 J0209580
                          BSC  L  ST850,Z   NAME IN LET/FLET - ERROR    J0209590
                    *                                                   J0209600
                          LD    1 FXSW                                  J0209610
                          BSC  L  ST820,Z   FX IS INVALID TO FIELD      J0209620
                    *                                                 * J0209630
                    *************************************************** J0209640
                    *                                                 * J0209650
                    *   FETCH REQD I/O SET AND PROCESS THE HEADER REC * J0209660
                    *                                                 * J0209670
                    *************************************************** J0209680
                    ST015 BSI  L  PL500     GET REQD I/O SUBRS IN CORE  J0209690
                    *                                                   J0209700
                          BSI  L  RDHDR     READ AND PROCESS HEADER REC J0209710
                    *                                                   J0209720
                    *************************************************** J0209730
                          MDX     ST230     GET AND EXEC STORE     2-11 J0209740
                    *************************************************** J0209750
                    DSPEC BSS     1         DRIVE SPECIFIED SWITCH 2-10 J0209753
                    COUNT DC      *-*       TEMP STORAGE FOR DB CNT 212 J0209756
                    ST903 DC      /0F00                             212 J0209757
                    ST904 DC      /1000                             212 J0209758
                          HDNG    DCTL -- STORE MOD CTRL REC DECODE     J0209760
                    *************************************************** J0209770
                    *                                                 * J0209780
                    *   VERIFY THE FUNCTION SPEC BY THE DUP CTRL REC  * J0209790
                    *                                                 * J0209800
                    *************************************************** J0209810
                    ST200 EQU     *         LABEL FOR NEXT INSTRUCTION  J0209820
                          BSI  L  DCBAF     CHECK COLS 7,8              J0209830
                          EBC     .MO.      STOREMOD CONSTANT           J0209840
                          MDX     ST400     NOT STOREMOD, TRY STOREDATA J0209850
                    *                                                 * J0209860
                          LD      DSPEC     BRANCH IF CARTRIDGE    2-10 J0209862
                          BSC  L  ST205,-   * ID SPECIFIED         2-10 J0209864
                    *                                              2-10 J0209866
                          LD    1 LSTLF     DRIVE CODE & SAD OF L/F     J0209870
                          SRA     12        ELIMINATE SAD               J0209880
                          STO   1 #TODR     SAVE DRIVE CODE FOR STORE   J0209890
                    *                                                 * J0209900
                    *************************************************** J0209910
                    *                                                 * J0209920
                    *   CHECK CRITICAL FIELDS OF THE DUP CTRL REC     * J0209930
                    *                                                 * J0209940
                    *************************************************** J0209950
                          LD    1 NAMSW                                 J0209960
                          BSC  L  ST205,Z   NAME FOUND IN LET/FLET 2-11 J0209965
                          SLA     16        DEFAULT TO DRIVE 0     2-11 J0209970
                          STO   1 #TODR     *IF NO DRIVE SPECIFIED  212 J0209971
                    ST205 LD    1 #DBCT     GET AN SAVE ORIGINAL    212 J0209972
                          STO     COUNT     *DISK BLOCK COUNT       212 J0209975
                          LD    1 FRWS      STORE FROM WS           212 J0209976
                          BSC  L  ST810,-+  ST MOD NOT FROM WS-ERR 2-11 J0209977
                          LDX  I2 #FRDR+C   XR2=DR CDE OF SOURCE   2-11 J0209980
                          LD   L2 #WSCT+C   DB CNT,SRCE DTA OR PROG2-11 J0209985
                          BSC  L  RD830,+-  NOTHING IN WS-ERROR    2-11 J0209986
                          STO   1 #DBCT     SAVE PROPER DB COUNT   2-11 J0209987
                          MDX  L  NAMSW+C,0 CHECK IF NAME FOUND    2-11 J0209988
                          MDX     ST210     BR IF NAME IN LET/FLET 2-11 J0209989
                          STO   1 DATSW     SET IN DB CNT          2-11 J0209990
                          LD   L2 #FMAT+C   GET FROM FORMAT IND    2-11 J0210000
                          BSC     +-        SKIP IF NOT DSF        2-11 J0210010
                          STO   1 DATSW     CLEAR DB COUNT         2-11 J0210020
                          BSC     +Z        SKIP IF NOT CI         2-11 J0210030
                          STO   1 STCSW     SET CI SWITCH          2-11 J0210040
                          MDX     ST220     FINISH PROCESSING           J0210050
                    *                                               212 J0210060
                    ST210 STX  L0 MODSW+C   INDICATE STORE MOD     2-11 J0210070
                          LD      COUNT     GET ORIGINAL DB CNT     212 J0210075
                          S     1 #DBCT                                 J0210080
                          BSC  L  ST815,+Z  INVALID,NEW VERS GT OLD 212 J0210090
                    *                                                 * J0210100
                          LD    1 #NAME                                 J0210110
                          SRT     14        FORM 0, -1, OR -2           J0210120
                          BSC     E         SKIP IF NOT DATA            J0210130
                    *                                                 * J0210140
                          SRA     15        FORM 0, +1                  J0210150
                          S    L2 #FMAT+C                               J0210160
                          BSC  L  ST805,Z   REQ FORMAT NOT IN WS -ERRO  J0210170
                    *                                                 * J0210180
                    ST220 LD    1 UASW                             2-11 J0210190
                          OR    1 FXSW                                  J0210200
                          BSC  L  ST820,-+  INVALID,MUST BE UA OR FX    J0210210
                    *                                                 * J0210220
                          BSI  L  CKTMP     INHIBIT IF JOB TEMP    2-11 J0210230
                          LD   L2 #FMAT+C   DSF MOCULE ?            212 J0210231
                          BSC  L  ST230,Z   BR IF NOT DSF           212 J0210232
                          STO   1 DATSW     DO NOT PROCESS NAME SW  212 J0210233
                          BSI  L  RDHDR     GET MODULE HEADER       212 J0210234
                          LD    2 3         LOAD PROG TYPE          212 J0210235
                          SRA     12        SAVE BITS 0 - 3,        212 J0210236
                          SLA     12        * THE SUBTYPE           212 J0210237
                          STO   1 T3MSW     * AND SAVE IT           212 J0210238
                          LDX  L2 BUF3+6    POINT TO COL 11 + 12    212 J0210239
                          BSI  L  DCBAF     CHECK CONTENTS OF COLS  212 J0210240
                          EBC     .  .                              212 J0210241
                          MDX     *+1       SKIP ONE IF NOT BLANK   212 J0210242
                          MDX     ST230     COMPLETE PROCESSING     212 J0210243
                          LD    2 0         LOAD CONTENTS OF 11+12  212 J0210244
                          A       ST904     CHECK IF NUMERIC        212 J0210245
                          BSC  L  *+1,C     SKIP IF NUMERIC         212 J0210246
                          MDX     ST007     INVALID SOCAL TYPE      212 J0210247
                          AND     ST903     SAVE NUMERIC PORTION    212 J0210248
                          SLA     4         *AND SHIFT TO 0-3 BITS  212 J0210249
                          STO   1 T3MSW     SAVE SUBTYPE FOR STORE  212 J0210250
                    *                                               212 J0210251
                    *************************************************** J0210259
                    ST230 BSC  L  PL030     GET AND EXEC STORE     2-11 J0210260
                    *************************************************** J0210270
                          HDNG    DCTL -- STORE DATA CTRL REC DECODE    J0210280
                    ST400 BSI  L  DCBAF     CHECK COLS 7,8              J0210290
                          EBC     .DA.      STOREDATA CONSTANT          J0210300
                          MDX     ST600     NOT STOREDATA,TRY STORECI   J0210310
                    *************************************************** J0210320
                    *                                                 * J0210330
                    *   PROCESSING REQUIRED FOR STOREDATA ONLY        * J0210340
                    *                                                 * J0210350
                    *************************************************** J0210360
                    *                                                   J0210370
                          BSI  L  DACNT     RECORD REC COUNT IN DATSW   J0210380
                    *                                                   J0210390
                          SLA     4         CONVERT TO DB               J0210400
                          MDX  L  FRWS+C,0  SKIP, IF NOT FROM WS        J0210410
                          STO   1 DATSW     RECORD DB-S IF FROM WS      J0210420
                    *                                                 * J0210430
                          LDX  L2 BUF3+6    POINT TO COLS 11,12         J0210440
                    *                                                 * J0210450
                          BSI  L  DCBAF     CHECK COLS 11,12            J0210460
                          EBC     .E .      STOREDATAE CONSTANT     2E2 J0210470
                    *                                                 * J0210480
                          MDX     ST410     NOT EBCDIC DATA, TRY CI 2E2 J0210490
                    *                                                   J0210500
                          STO   1 EBCSW     SET EBCDIC SWITCH       2E2 J0210510
                    *                                                 * J0210520
                          MDX     ST500     COMMON STOREDATA ERR CHECKS J0210530
                    *                                                   J0210540
                    ST410 BSI  L  DCBAF     CHECK COLS 11,12            J0210550
                          EBC     .CI.      STOREDATACI CONSTANT        J0210560
                          MDX     ST412                             212 J0210570
                    *                                                   J0210580
                          STO   1 STCSW     SET STORE CI DATA SWITCH    J0210590
                    ST412 LD    1 FRWS                              212 J0210600
                          BSC  L  ST500,-+  NOT FROM WS.MAKE ERR CHECKS J0210610
                    *                                                 * J0210620
                          LD    1 DATSW     DB COUNT                212 J0210624
                          BSC  L  ST500,Z   BR IF DB COUNT SPECIFIED212 J0210626
                          LDX  I2 #FRDR+C   XR2 IS DR CODE OF SOURCE DR J0210630
                          LD   L2 #WSCT+C                          2-11 J0210640
                          STO   1 DATSW     DB COUNT OF PROG IN SPEC WS J0210650
                    *                                                 * J0210660
                          BSC  L  RD830,-+  NO PROGRAM IN WS    -ERROR- J0210670
                    *                                                 * J0210680
                    * FIVE WORDS REMOVED                            212 J0210690
                    *                                                   J0210700
                    ST500 LD    1 NAMSW                                 J0210750
                          BSC  L  ST850,Z   NAME FOUND IN LET/FLET--ERR J0210760
                    *                                                 * J0210770
                          LD    1 DATSW                                 J0210780
                          STO   1 #DBCT     ACTUAL DB OR RECORD COUNT   J0210790
                    *                                                 * J0210800
                          BSC  L  ST855,-+  INVALID RECORD COUNT        J0210810
                    *************************************************** J0210820
                          MDX     ST230     GET AND EXEC STORE     2-11 J0210830
                    *************************************************** J0210840
                          HDNG    DCTL -- STORE CORE IMAGE CTRL REC     J0210850
                    *************************************************** J0210860
                    *                                                 * J0210870
                    *   PROCESS BALANCE OF DCR OF STORECI TYPE        * J0210880
                    *                                                 * J0210890
                    *************************************************** J0210900
                    ST600 BSI  L  DCEXF     CHECK COLS 7,8              J0210910
                          EBC     .CI.      STORE CI CONSTANT           J0210920
                          DC      PH213     INVALID FUNCTION CODE       J0210930
                    *                                                   J0210940
                          SRA     16        CLEAR ACCUMULATOR       2-8 J0210950
                          STO   1 #MPSW     RESET CORE MAP SW       2-8 J0210960
                    *                                               2-8 J0210970
                          LD      *                                     J0210980
                          STO   1 CISW      SET STORE CORE IMAGE SW     J0210990
                    *************************************************** J0211000
                    *                                                 * J0211010
                    *   DECODE COL 9 FOR TYPE OF DISK I/O REQUIRED    * J0211020
                    *             DISKZ IF BLANK. RECORD -1 IN $DREQ  * J0211030
                    *             DISK1 IF 0    . RECORD  0 IN $DREQ  * J0211040
                    *             DISK1 IF 1    . RECORD  0 IN $DREQ  * J0211050
                    *             DISKN IF N    . RECORD +1 IN $DREQ  * J0211060
                    *                                                 * J0211070
                    *************************************************** J0211080
                          BSI  L  DCBAF     CHECK COLS 9,10             J0211090
                          EBC     .  .      DISKZ CONSTANT              J0211100
                          MDX     ST610     NOT BLANK, TRY Z            J0211110
                    *                                                 * J0211120
                          MDX     ST615     RECORD -1 FOR DISKZ         J0211130
                    *                                                 * J0211140
                    ST610 BSI  L  DCBAF     CHECK COLS 9,10             J0211150
                          EBC     .Z .      DISKZ CONSTANT              J0211160
                          MDX     ST620     NOT DISKZ, TRY DISK1        J0211170
                    *                                                   J0211180
                    ST615 LDX   3 -1        SET XR3 MINUS 1, DISKZ      J0211190
                          MDX     ST640     RECORD -1 FOR DISK Z        J0211200
                    *                                                 * J0211210
                    *                                                 * J0211220
                    ST620 BSI  L  DCBAF     CHECK COLS 9,10             J0211230
                          EBC     .0 .      DISK0 CONSTANT              J0211240
                          MDX     ST630     NOT DISK0, TRY DISK 1       J0211250
                    *                                                 * J0211260
                          MDX     ST633     RECORD 0 FOR DISK0          J0211270
                    *                                                 * J0211280
                    ST630 BSI  L  DCBAF     CHECK COLS 9,10             J0211290
                          EBC     .1 .      DISK1 CONSTANT              J0211300
                          MDX     ST635     NOT DISK1, TRY DISK N       J0211310
                    *                                                   J0211320
                    ST633 LDX   3 0         SET XR3 ZERO, DISK0/1       J0211330
                          MDX     ST640     RECORD  0 FOR DISK1         J0211340
                    *                                                   J0211350
                    ST635 BSI  L  DCEXF     CHECK COLS 9,10             J0211360
                          EBC     .N .      DISKN CON                   J0211370
                          DC      PH212     INVALID DISK I/O SPEC       J0211380
                    *                                                   J0211390
                          LDX   3 1         SET XR3 PLUS 1, DISKN       J0211400
                    ST640 STX  L3 $DREQ     RECORD REQ DISK CODE        J0211410
                    *                                               2-3 J0211420
                    ************************************************2-3 J0211430
                    *                                               2-3 J0211440
                    *   DECODE COL 11 FOR LOCAL-CALL-LOCAL REQUEST. 2-3 J0211450
                    *                 ANY PUNCH SETS #LOSW.         2-3 J0211460
                    *   DECODE COL 12 FOR SPECIAL ILS REQUEST.      2-3 J0211470
                    *                 ANY PUNCH SETS #X3SW          2-3 J0211480
                    *                                               2-3 J0211490
                    ************************************************2-3 J0211500
                          LD    2 0         LOAD COLS 11 AND 12     2-3 J0211510
                          SRT     8         SHIFT OUT COL 11 TO EXT 2-3 J0211520
                          S       ST905     SUBTRACT EBCDIC BLANK   2-3 J0211530
                          STO   1 #LOSW     SET SW IF NOT BLANK     2-3 J0211540
                          SLA     16                                2-3 J0211550
                          SLT     8         SHIFT IN COL 12         2-3 J0211560
                          S       ST905     SUBTRACT EBCDIC BLANK   2-3 J0211570
                          STO   1 #X3SW     SET SW IF NOT BLANK     2-3 J0211580
                    *                                               2-3 J0211590
                    *************************************************** J0211600
                    *                                               2-8 J0211610
                    *   CHECK COL 42 FOR CORE MAP REQUEST.          2-8 J0211620
                    *                N CAUSES CORE MAP SUPPRESSION  2-8 J0211630
                    *                                               2-8 J0211640
                    ************************************************2-8 J0211650
                          LDX  L2 BUF3+21   POINT TO COLS 41-42     2-8 J0211660
                          BSI  L  DCBAF     CHECK COLS 41-42        2-8 J0211670
                          EBC     . N.      NO CORE MAP CONSTANT    2-8 J0211680
                          STO   1 #MPSW     NOT N, SET SW NON-ZERO  2-8 J0211690
                    *                                               2-8 J0211700
                    *************************************************** J0211710
                    *                                                 * J0211720
                    *   CHECK SPECIFIED PARAMETERS                    * J0211730
                    *                                                 * J0211740
                    *************************************************** J0211750
                    *                       REDUNDANT CODING        2-3 J0211760
                    *                       *REMOVED                2-3 J0211770
                    *                                                 * J0211780
                    ST650 BSI  L  DACNT     REC NO OF *FILES RECORDS    J0211790
                    *                                                   J0211800
                          LD    1 TOWS                                  J0211810
                          BSC  L  ST820,Z   WS IS NOT A VALID TO FIELD  J0211820
                    *                                                   J0211830
                          LD    1 NAMSW                                 J0211840
                          BSC  L  ST850,Z   NAME FOUND - ERROR          J0211850
                    *                                                   J0211860
                    *                       ACC CONTAINS ZERO       2-4 J0211870
                          STO   1 #LCNT     CLEAR LOCAL,            2-4 J0211880
                          STO   1 #NCNT     *     NOCAL,            2-4 J0211890
                          STO   1 #FCNT     *     FILES,            2-4 J0211900
                          STO   1 #GCNT     *     G2250 INDICATORS  2-4 J0211910
                    *                                               2-4 J0211920
                          LD    1 DATSW                                 J0211930
                          BSC  L  ST015,+-  BR IF NO SUPV CTRL RCDS 2-3 J0211940
                    *                                               2-3 J0211950
                          LD    1 FRWS      PROC HDR BEFORE FETCHING2-3 J0211960
                          BSI  L  RDHDR,Z   *FILEQ, IF FROM WS ONLY 2-3 J0211970
                    *                                               2-3 J0211980
                          BSC  L  PL040     FETCH FILEQ             2-3 J0211990
                    *                                                   J0212000
                    *                                               2-3 J0212010
                    *************************************************** J0212020
                          HDNG    DCTL -- ERROR MESSAGE EXITS           J0212030
                    *************************************************** J0212040
                    *                                                 * J0212050
                    *   INHIBIT FURTHER PROCESSING IF JOB IS TEMP MODE* J0212060
                    *                                                 * J0212070
                    *************************************************** J0212080
                    CKTMP DC      *-*       RECORD RETURN ADDR          J0212090
                          LD    1 #JBSW                                 J0212100
                          BSC  I  CKTMP,-+  NOT A TEMP JOB-RETURN--     J0212110
                    *                                                   J0212120
                          BSI  I  LEAVE     PRINT ERROR MESSAGE         J0212130
                          DC      PH218     INVALID DURING TEMP-ER EXIT J0212140
                    *************************************************** J0212150
                    ST805 BSI  I  LEAVE     PRINT ERROR MESSAGE         J0212160
                          DC      PH225     REQ FORMAT NOT IN WS -ERROR J0212170
                    *************************************************** J0212180
                    ST810 BSI  I  LEAVE     PRINT ERROR MESSAGE         J0212190
                          DC      PH214     INVALID FROM FLD-ERROR EXIT J0212200
                    *************************************************** J0212210
                    ST815 BSI  I  LEAVE     PRINT ERROR MESSAGE         J0212220
                          DC      PH221     INVALID STOREMOD-ERR EXIT   J0212230
                    *************************************************** J0212240
                    ST820 BSI  I  LEAVE     PRINT ERROR MESSAGE         J0212250
                          DC      PH215     INVALID TO FIELD-ERROR EXIT J0212260
                    *************************************************** J0212270
                    *************************************************** J0212300
                    ST835 BSI  I  LEAVE     PRINT ERROR MESSAGE         J0212310
                          DC      PH226     NAME NOT IN LET/FLET        J0212320
                    *************************************************** J0212330
                    CKFXA DC      *-*       RECORD RETURN ADDR          J0212340
                          SLA     4         STRIP OFF DRIVE CODE        J0212350
                          BSC  I  CKFXA,Z   FIXED AREA PRESENT          J0212360
                    *                                                 * J0212370
                    ST840 BSI  I  LEAVE                                 J0212380
                          DC      PH285     NO FIXED AREA PRESENT       J0212390
                    *************************************************** J0212400
                    ST850 BSI  I  LEAVE     PRINT ERROR MESSAGE         J0212410
                          DC      PH206     ENTRY POINT IN LET/FLET     J0212420
                    *************************************************** J0212430
                    ST855 BSI  I  LEAVE     PRINT ERROR MESSAGE         J0212440
                          DC      PH217     INVALID COUNT FIELD         J0212450
                    *************************************************** J0212460
                    ST860 BSI  I  LEAVE     PRINT ERROR MESSAGE         J0212470
                    ST861 DC      *-*       WORK AREA FOR DUP ERROR CDE J0212480
                    *************************************************** J0212490
                    ST905 DC      /0040     BLANK                   2-3 J0212520
                    *************************************************** J0212530
                          HDNG    DCTL -- *DUMP, *DUMPDATA DUP CTRL REC J0212540
                    *************************************************** J0212550
                    *                                                 * J0212560
                    *   INITIALIZATION REQUIRED BY *DUMPDATA ONLY     * J0212570
                    *                                                 * J0212580
                    *************************************************** J0212590
                    DACTL BSI  L  DACNT     CONVERT COUNT FIELD         J0212600
                    *                                                   J0212610
                          SLA     4         CONVERT TO DB-S,FROM SCTRS  J0212620
                          BSC     +         SKIP IF THERE IS A CNT  212 J0212630
                          LD      *-1       ELSE SET CNT NEG.       212 J0212640
                          STO   1 DATSW     SET CNT AND DUMPDATA SW 212 J0212650
                    *                                               212 J0212660
                          BSI  L  DCBAF     CHECK COLS 11,12            J0212670
                          EBC     .E .      DUMPDATA E CONSTANT     2E2 J0212680
                          MDX     DUCTL     NOT EBCDIC DATA DUMP    2E2 J0212690
                    *                                                   J0212700
                          STO   1 EBCSW     SET EBCDIC SWITCH       2E2 J0212710
                    *                                                   J0212720
                    *************************************************** J0212730
                    *                                                 * J0212740
                    *   USE COMMON SUBROUTINES TO PROCESS CART ID,    * J0212750
                    *   FROM, AND TO FIELDS FOR DUMP AND DUMP DATA    * J0212760
                    *                                                 * J0212770
                    *************************************************** J0212780
                    DUCTL BSI  L  SC130     SCAN THE FROM FIELD         J0212790
                    *                                                   J0212800
                          LD    1 IOSW                                  J0212810
                          BSC  L  ST810,Z   I/O IS NOT VALID FROM FIELD J0212820
                    *                                                   J0212830
                          BSI  L  SC170     SCAN THE TO FIELD           J0212840
                    *                                                   J0212850
                          LD    1 IOSW                                  J0212860
                          OR    1 TOWS                                  J0212870
                          BSC  L  ST820,-+  TO FIELD NEITHER I/O NOR WS J0212880
                    *                                                   J0212890
                    *************************************************** J0212900
                    *                                                 * J0212910
                    *   DUMP AND DUMPDATA NAME FIELD DECODE AND CHECK * J0212920
                    *                                                 * J0212930
                    *************************************************** J0212940
                          BSI  L  SNAME     CONVERT THE NAME FIELD      J0212950
                    *                                                   J0212960
                          LD    1 #NAME                                 J0212970
                          BSC  L  DU002,Z   NAME IS ON THE DUP CTRL REC J0212980
                    *                                                   J0212990
                          LD    1 IOSW                                  J0213000
                          BSC  L  ST830,-+  FROM UA/FXA,REQ NAME--ERROR J0213010
                    *                                                   J0213020
                          LD    1 PTSW                                  J0213030
                          OR    1 PRSW                                  J0213040
                          BSC  L  ST830,-+  TO CARDS,REQ NAME   --ERROR J0213050
                    *                                                   J0213060
                    DU002 LD    1 UASW                                  J0213070
                          OR    1 FXSW                                  J0213080
                          BSC  L  DU006,Z   BR IF LET SEARCH REQD   2-5 J0213090
                          LD    1 #FRDR     WAS CART SPECIFIED      2-5 J0213100
                          BSC  L  DU003,-   BR IF SPECIFIED        2-10 J0213105
                          LD   L  $WSDR                            2-10 J0213110
                          STO   1 #FRDR     SET TO DEFAULT WS DRIVE2-10 J0213115
                    DU003 LDX  I2 #FRDR+C   XR2 IS DR CODE OF SRCE 2-10 J0213120
                          LD    1 DATSW                            2-10 J0213125
                          BSC  L  DU004,Z   BR IF DUMPDATA         2-10 J0213130
                          LD   L2 #WSCT+C   ANY PROG IN WS'        2-10 J0213135
                          BSC  L  RD830,+   BR IF NO PROG --ERROR- 2-10 J0213140
                    DU004 LD   L2 #FMAT+C   GET FORMAT OF SOJRCE WS2-10 J0213150
                          BSC  L  DU008,-   BR IF FORMAT NOT CI     2-5 J0213160
                          SLA     14        IF CI, INSERT FORMAT    2-5 J0213170
                          OR    1 #NAME     *BITS IN NAME           2-5 J0213180
                          STO   1 #NAME     *                       2-5 J0213190
                          MDX     DU008     GO FETCH DUMP           2-5 J0213200
                    *                                                   J0213210
                    DU006 BSI  L  LETSR     SEARCH LET FOR NAME         J0213220
                    *                                                   J0213230
                          LD    1 NAMSW                                 J0213240
                          BSC  L  ST835,+-  NAME NOT FOUND      --ERROR J0213250
                    *                                                   J0213260
                    DU008 BSC  L  PL050     GO TO FETCH DUMP TO CORE    J0213270
                    *************************************************** J0213280
                          HDNG    *DFILE DUP CONTROL RECORD             J0213290
                    DDCTL LD      *         GET NON ZERO VALUE      2-8 J0213300
                          STO   1 DFLSW     SET DFILE SW ON         2-8 J0213310
                          STO   1 STSW      INDICATE STORE-TYPE OPER2-8 J0213320
                    *                                               2-8 J0213330
                    *                       INSTRUCTION MOVED      2-10 J0213340
                    *                                               2-8 J0213350
                          BSI  L  DACNT     PUT COUNT FIELD IN DATSW2-8 J0213360
                          SLA     4         CONVERT SECTOR COUNT TO 2-8 J0213370
                          STO   1 DATSW     *DISK BLOCK COUNT       2-8 J0213380
                          STO   1 #DBCT     *SAVE IN CATCO          2-8 J0213390
                          BSC  L  ST855,+-  INVALID BLOCK COUNT     2-8 J0213400
                    *                                               2-8 J0213410
                          BSI  L  FRLAB     DECODE CART ID FIELDS   2-9 J0213415
                          BSI  L  SC170     DECODE TO FIELD         2-8 J0213420
                          LD    1 UASW      TEST IF TO USER AREA   2-10 J0213430
                          BSC  L  DU009     SKIP INHIBIT TEST IF UA2-10 J0213440
                          BSI  L  CKTMP     INHIBIT IF TEMP MODE   2-10 J0213445
                          LD    1 UASW      RESUME CHECK FOR UA    2-10 J0213447
                    DU009 OR    1 FXSW      TEST IF TO UA,FXA      2-10 J0213450
                          BSC  L  ST820,+-  NOT TO UA OR FXA-ERROR  2-8 J0213460
                    *                                               2-8 J0213470
                    *                INSTRUCTION MOVED ELSEWHERE    2-9 J0213480
                    *                                               2-8 J0213490
                          BSI  L  SNAME     CONVERT NAME FIELD      2-8 J0213500
                          LD    1 #NAME     TEST FOR NAME           2-8 J0213510
                          BSC  L  ST830,+-  ERROR IF NO NAME        2-8 J0213520
                    *                                               2-8 J0213530
                          BSI  L  LETSR     SEARCH LET/FLET FOR NAME2-8 J0213540
                          LD    1 NAMSW     TEST IF NAME FOUND IN   2-8 J0213550
                          BSC  L  ST850,Z   *LET/FLET - BR IF SO -ER2-8 J0213560
                    *                                               2-8 J0213570
                          LD    1 #TODR     SEE IF TO CART SPECFIED 2-8 J0213580
                          BSC  L  PL030,-   GET STORE PHASE IF SO   2-8 J0213590
                          SLA     16        OTHERWISE,DEFAULT TO    2-8 J0213600
                          STO   1 #TODR     *LOGICAL DRIVE ZERO     2-8 J0213610
                          BSC  L  PL030     GET AND EXECUTE STORE   2-8 J0213620
                          HDNG    DCTL -- PROCESS BALANCE OF DUMPLET    J0213630
                    *************************************************** J0213640
                    *                                                 * J0213650
                    *   PROCESS DUMPFLET DUP CONTROL RECORD           * J0213660
                    *                                                 * J0213670
                    *************************************************** J0213680
                    FLCTL LD      *-1                                   J0213690
                          STO   1 LETSW     INDICATE FLET PRINT ONLY    J0213700
                    *                                                 * J0213710
                    *************************************************** J0213720
                    *                                                 * J0213730
                    *   CHECK FOR EXISTENCE OF REQUESTED FLET         * J0213740
                    *                                                 * J0213750
                    *************************************************** J0213760
                          LD    1 #FRDR                                 J0213770
                          BSC  L  FL050,-   CARTRIDGE WAS SPECIFIED     J0213780
                    *                                                 * J0213790
                          LD    1 #FLET     FLET ADDR WILL BE ZERO IF   J0213800
                          OR    1 #FLET+1   *NO FIXED AREA ON CART      J0213810
                          OR    1 #FLET+2                               J0213820
                          OR    1 #FLET+3                               J0213830
                          OR    1 #FLET+4                               J0213840
                          MDX     FL060     COMPLETE THE CHECK FOR FLET J0213850
                    *                                                 * J0213860
                    FL050 LDX  I2 #FRDR+C   FROM DRIVE NO INTO XR 2     J0213870
                          LD   L2 #FLET+C   SELECT SPECIFIED FLET       J0213880
                    FL060 BSI  L  CKFXA     ERROR EXIT IF NO FLET   2-8 J0213890
                    *                                                 * J0213900
                    *************************************************** J0213910
                    *                                                 * J0213920
                    *   NAME FIELD PROCESSING FOR DUMPLET AND DUMPFLET* J0213930
                    *                                                 * J0213940
                    *************************************************** J0213950
                    LECTL BSI  L  SNAME     CONVERT THE NAME, IF ANY    J0213960
                    *                                                   J0213970
                          LD    1 #NAME                                 J0213980
                          BSC  L  PL060,-+  NO NAME,FETCH DUMPLET/FLET  J0213990
                    *                                                   J0214000
                          BSI  L  LETSR     FIND NAME IN LET            J0214010
                    *                                                   J0214020
                          LD    1 LSTLF     DRIVE CODE FROM .LETSR.SUBR J0214030
                          SRA     12        RIGHT JUSTIFY TO LOG DRIVE  J0214040
                          STO   1 #FRDR     LOGICAL .FROM. DRIVE        J0214050
                    *                                                 * J0214060
                          LD    1 NAMSW                                 J0214070
                          BSC  L  ST835,-+  ERROR - NO NAME FOUND       J0214080
                    *                                                   J0214090
                          BSC  L  PL060     FETCH THE DUMPLET/FLET SUBR J0214100
                    *************************************************** J0214110
                          HDNG    DCTL -- *DELETE DUP CONTROL RECORD    J0214120
                    *************************************************** J0214130
                    *                                                 * J0214140
                    *   PROCESS BAL OF DELETE DUP CONTROL RECORD      * J0214150
                    *                                                 * J0214160
                    *************************************************** J0214170
                    DLCTL BSI  L  CKTMP     CHECK FOR JOB T MODE        J0214180
                    *                                                   J0214190
                          BSI     FRLAB     DECODE FR AND TO CART ID-S  J0214200
                    *                                                   J0214210
                          BSI  L  SNAME     CONVERT NAME FIELD          J0214220
                    *                                                   J0214230
                          LD    1 #NAME                                 J0214240
                          BSC  L  ST830,-+  NO NAME ON CTRL REC --ERROR J0214250
                    *                                                   J0214260
                          BSI  L  LETSR     SEARCH LET FOR NAME         J0214270
                    *                                                   J0214280
                          LD    1 NAMSW                                 J0214290
                          BSC  L  ST835,-+  NAME NOT FOUND      --ERROR J0214300
                    *                                                   J0214310
                          LD   L  LE929                                 J0214320
                          STO   1 LSTLF     ADDR OF LAST COMPLETE SCTR  J0214330
                    *                                                 * J0214340
                          BSC  L  PL070     GO TO SET UP FETCH OF DLETE J0214350
                    *************************************************** J0214360
                          HDNG    DCTL -FRLAB- CVRT CART ID TO LOG DR   J0214370
                    *************************************************** J0214380
                    *                                                 * J0214390
                    *   CONVERT COLUMNS 31-34 AND 37-40 FROM PACKED   * J0214400
                    *   EBCDIC TO THE FROM AND TO LOGICAL DRIVE NO.   * J0214410
                    *   IF NONE SPECIFIED DEFAULT TO NEGATIVE VALUE.  * J0214420
                    *                                                 * J0214430
                    *************************************************** J0214440
                    FRLAB DC      *-*       RECORD RETURN ADDR          J0214450
                          STX   2 FR040+1   SAVE RECORD IMAGE POINTER   J0214460
                          LDX  I2 PEBUF+C   POINT TO PACKED EBCDIC BFR  J0214470
                          LD    1 DFNSW                                 J0214480
                          BSC  L  FR020,Z   DEFINE FXA,DECODE TO FIELD  J0214490
                    *                                                 * J0214500
                          BSI     FR050     PROCESS  THE FROM ID FIELD  J0214510
                    *                                                 * J0214520
                          STO   1 #FRDR     RECORD LOGICAL FROM DRIVE   J0214530
                    *                                                 * J0214540
                    *************************************************** J0214550
                    *                                                 * J0214560
                    *   CONVERT COLUMNS 37-40 FROM PACKED EBCDIC TO   * J0214570
                    *   LOGICAL DRIVE NUMBER AND PUT INTO #TODR.      * J0214580
                    *                                                 * J0214590
                    *************************************************** J0214600
                    FR020 MDX   2 +3        STEP POINTER 6COLS.TO-FIELD J0214610
                          BSI     FR050     PROCESS  THE TO   ID FIELD  J0214620
                    *                                                 * J0214630
                          STO   1 #TODR     RECORD LOGICAL TO DRIVE     J0214640
                    *                                                 * J0214650
                    *                                                 * J0214660
                    FR040 LDX  L2 *-*       RESTORE REC IMAGE POINTER   J0214670
                          BSC  I  FRLAB     FROM AND TO FIELDS DONE-RET J0214680
                    *************************************************** J0214690
                    *                                                 * J0214700
                    *************************************************** J0214710
                    *                                                 * J0214720
                    *   PROCESS EITHER THE FROM OR THE TO ID FIELD    * J0214730
                    *                                                 * J0214740
                    *************************************************** J0214750
                    FR050 DC      *-*       RECORD RETURN ADDRESS       J0214760
                          MDX     FR100     CONVERT FROM CART ID    212 J0214770
                    *                                                 * J0214780
                    FR055 BSC  L  FR810,Z+  INVALID RANGE -ERROR-   212 J0214790
                    *                                                 * J0214800
                          BSC     Z         CART ID SPECIFIED       212 J0214810
                    * ONE INSTR REMOVED                             212 J0214820
                          MDX     FR600     COMPARE ADD WITH CARD ID212 J0214830
                          LD      *-1                               212 J0214835
                    *                                                 * J0214840
                    FR060 BSC  I  FR050     RETURN                  212 J0214850
                    *************************************************** J0214860
                    *                                                 * J0214870
                    *   CONVERT 4 UNPACKED EBCDIC CHARACTERS INTO     * J0214880
                    *   ONE BINARY WORD                               * J0214890
                    *                                                 * J0214900
                    *************************************************** J0214910
                    FR100 EQU     *         ENTRY POINT             212 J0214920
                          LDX   3 4         COUNT OF HEX CHARACTERS     J0214930
                          SLT     32        CLEAR THE ACC AND EXT       J0214940
                    *                                                   J0214950
                          LD    2 16        LOAD RELATIVE COLS 31,32    J0214960
                          RTE     8         ONE CHAR IN EACH A AND Q    J0214970
                          STO     FR960     HI ORDER,UNPACKED EBCDIC    J0214980
                    *                                                   J0214990
                          SLA     16        CONVERT TO UNPACKED EBCDIC  J0215000
                          SLT     8                                     J0215010
                          STO     FR960+1   2ND HIGHEST ORDER DIGIT     J0215020
                    *                                                   J0215030
                          LD    2 17        LOAD RELATIVE COLS 33,34    J0215040
                          RTE     8                                     J0215050
                          STO     FR960+2   3RD HIGHEST ORDER DIGIT     J0215060
                    *                                                   J0215070
                          SLA     16                                    J0215080
                          SLT     8                                     J0215090
                          STO     FR960+3   LO ORDER DIGIT              J0215100
                    *************************************************** J0215110
                    *                                                 * J0215120
                    *   CONVERT 4 UNPACKED EBCDIC CHARACTERS INTO     * J0215130
                    *   ONE BINARY WORD AND RETURN WITH IT IN THE AREG* J0215140
                    *                                                 * J0215150
                    *************************************************** J0215160
                          LDX   3 +4                                    J0215170
                    *                                                   J0215180
                    FR310 LD   L3 FR960-1   PICK UP NEXT CHARACTER      J0215190
                          EOR     FR930     /00F0                       J0215200
                          SRT     4                                     J0215210
                          BSC  L  FR350,Z   NONNUMERIC RANGE TRY A-F212 J0215220
                    *                                                 * J0215230
                    FR320 MDX   3 -1        DECR WD CNT, VAL IN EXT     J0215240
                          MDX     FR310     GET NEXT CHAR               J0215250
                    *                                                 * J0215260
                          RTE     16        MOVE BINARY RESULT TO A REG J0215270
                          MDX     FR055     CONVERSION COMPLETE-RTN 212 J0215280
                    *                                                   J0215290
                    *************************************************** J0215300
                    *                                                 * J0215310
                    *   CHECK FOR VALID HEX CHARACTER BETWEEN A AND F * J0215320
                    *                                                 * J0215330
                    *************************************************** J0215340
                    FR350 EQU     *         ENTRY POINT             212 J0215350
                          LD   L3 FR960-1   CHAR VALUE                  J0215360
                          S       FR932     /00C1 MASK FOR  -A-         J0215370
                          BSC  L  FR370,Z+  TOO LOW TRY BLANK (0040)    J0215380
                    *                                                 * J0215390
                          LD   L3 FR960-1   CHAR VALUE                  J0215400
                          S       FR931     /00C6 MASK FOR  -F-         J0215410
                          BSC  L  FR810,Z-  OUTSIDE THE RANGE.  --ERROR J0215420
                    *                                                 * J0215430
                          SLT     4         SELECT EBCDIC CHAR FR QREG  J0215440
                          A       FR933     /0009 TO CONVERT TO HEX     J0215450
                          SRT     4         SAVE HEX DIGIT IN EXT   2-4 J0215460
                          MDX     FR380     THIS CHARACTER OK           J0215470
                    *                                                 * J0215480
                    *************************************************** J0215490
                    *                                                 * J0215500
                    *   CHECK FOR A BLANK DIGIT,INSERT A ZERO IF FOUND* J0215510
                    *                                                 * J0215520
                    *************************************************** J0215530
                    FR370 LD   L3 FR960-1   CHAR VALUE                  J0215540
                          S       FR937     /0040 EBCDIC BLANK CHAR     J0215550
                          BSC  L  FR810,Z   OUTSIDE THE RANGE   -ERROR- J0215560
                    *                                                   J0215570
                    *                       INSTRUCTION MOVED       2-4 J0215580
                    *                                                   J0215590
                    FR380 MDX     FR320     CHECK NEXT CHAR-RTN     212 J0215600
                    *                                                   J0215610
                    *************************************************** J0215620
                    *                                                 * J0215630
                    *   MATCH THE ACC WITH CONTENTS OF THE QUINTUPLE  * J0215640
                    *   LABELED #CIDN (CART ID-S IN LOGICAL ORDER)    * J0215650
                    *                                                 * J0215660
                    *************************************************** J0215670
                    FR600 EQU     *         ENTRY POINT             212 J0215680
                    * ONE INSTR REMOVED                             212 J0215690
                    *                                                   J0215700
                          STO     FR960     SAVE SPECIFIED CART ID      J0215710
                          LDX   3 +5        NO OF ELEMENTS              J0215720
                    *                                                   J0215730
                    FR610 LD   L3 #CIDN+C-1 PICK UP CART ID             J0215740
                          S       FR960     ADJUST BY SPECIFIED CART ID J0215750
                          BSC  L  FR690,-+  MATCH FOUND                 J0215760
                    *                                                   J0215770
                          MDX   3 -1                                    J0215780
                          MDX     FR610     LAST ENTRY NOT YET CHECKED  J0215790
                    *************************************************** J0215800
                          MDX     FR800     CART ID NOT FOUND  --ERROR- J0215810
                    *************************************************** J0215820
                    *                                                   J0215830
                    FR690 MDX   3 -1        ADJUST TO LOGICAL DRIVE NO. J0215840
                          NOP               ALLOW SKIP WHEN STEP TO 0   J0215850
                          STX   3 FR960+1                               J0215860
                          LD      FR960+1   PUT LOGICAL DR NO. IN ACC   J0215870
                          MDX     FR060     MATCH FOUND -RETURN-    212 J0215880
                    *************************************************** J0215890
                          HDNG    DCTL-FRLAB- ERROR EXITS AND CONSTANTS J0215900
                    *************************************************** J0215910
                    *                                                 * J0215920
                    *   ERROR EXIT FOR CARTRIDGE ID FIELDS              J0215930
                    *                                                 * J0215940
                    *************************************************** J0215950
                    FR800 BSI  I  LEAVE     PRINT ERROR MESSAGE         J0215960
                          DC      PH219     CARTRIDGE NOT ON SYSTEM     J0215970
                    *************************************************** J0215980
                    FR810 BSI  I  LEAVE     PRINT ERROR MESSAGE         J0215990
                          DC      PH220     OUTSIDE VALID RANGE         J0216000
                    *************************************************** J0216010
                    *************************************************** J0216020
                    *                                                 * J0216030
                    *   CONSTANTS AND WORK AREAS                      * J0216040
                    *                                                 * J0216050
                    *************************************************** J0216060
                    FR930 DC      /00F0     MASK FOR NUMERICS VS A - F  J0216070
                    FR931 DC      /00C6     MASK FOR HEX F              J0216080
                    FR932 DC      /00C1     MASK FOR HEX A              J0216090
                    FR933 DC      /0009     CONSTANT FOR CONVERSION     J0216100
                    FR937 DC      /0040     EBCDIC BLANK CONSTANT       J0216110
                    FR960 BSS     4         WORK AREA                   J0216120
                    *************************************************** J0216130
                          HDNG    DCTL -- FETCH AND EXECUTE SUBROUTINE  J0216140
                    *************************************************** J0216150
                    *                                                 * J0216160
                    *   SET UP CORE LOC, WD CNT AND SECT ADDR FOR ALL * J0216170
                    *   MODULES REQUIRED BY DCTL TO PROCESS SPEC FUNC * J0216180
                    *                                                 * J0216190
                    *************************************************** J0216200
                    PLUS2 STO   1 XEQSW     SET TO EXECUTE FETCHED PROG J0216210
                    PLUSX STD   3 0         INSERT REQD IOAR HEADER     J0216220
                    *                                                 * J0216230
                          BSI  I  PHID      RECORD PROGRESS OF PHASE 2  J0216240
                          DC      /C002     NEXT PHASE BEING CALLED     J0216250
                    *                                                 * J0216260
                          BSI  I  MDUMP     PRINT MONITORED OUTPUT      J0216270
                    *                                                 * J0216280
                          BSI  I  GET       FETCH REQD PHASE     -EXIT- J0216290
                    *                                                 * J0216300
                    PL009 BSC  L  *-*       EXIT TO DCTL EXTENSIONS     J0216310
                    *************************************************** J0216320
                    *************************************************** J0216330
                    *                                                 * J0216340
                    *   FETCH AS REQD, EXECUTE STORE MODULE           * J0216350
                    *                                                 * J0216360
                    *************************************************** J0216370
                    PL030 BSI     PL500     FETCH AUX I/O IF REQUIRED   J0216380
                    *                                                 * J0216390
                          SRA     1         NON ZERO IF CORE GT 8K      J0216400
                          BSC  L  PL035,-+  STORE MODULE NOT IN CORE    J0216410
                    *                                                 * J0216420
                          LD    1 PH3                                   J0216430
                          BSC  L  WSDC+2,Z  EXECUTE STORE IF IN CORE    J0216440
                    *                                                   J0216450
                    PL035 LDX  L3 WSDC      IOAR HEADER ADDR FOR STORE  J0216460
                          LD    1 CIERR                                 J0216470
                          STO  L  ST861     RECORD ANY ERROR OF PRECI   J0216480
                    *                                                   J0216490
                          BSC  L  ST860,Z   ERROR EXIT, PRINT MESSAGE   J0216500
                    *                                                   J0216510
                          LDD   1 STHDR     IOAR HDR FOR STORE          J0216520
                          STO   1 PH3       RECORD THAT STORE IS CALLED J0216530
                    *                                                   J0216540
                          MDX     PLUS2     GO TO FETCH STORE           J0216550
                    *                                                   J0216560
                          HDNG    DCTL -- FETCH AND EXECUTE SUBROUTINE  J0216570
                    *************************************************** J0216580
                    *                                                 * J0216590
                    *   FETCH AND EXECUTE THE FILEQ MODULE            * J0216600
                    *                                                 * J0216610
                    *************************************************** J0216620
                    PL040 LDX  L3 B         IOAR HDR CORE ADDR OF FILEQ J0216630
                          LDD   1 FLHDR     IOAR HDR OF FILEQ           J0216640
                          STO   1 FLQSW     SET FILEQ REQD SW NON ZERO  J0216650
                    *                                                 * J0216660
                          MDX     PLUS2                                 J0216670
                    *                                                 * J0216680
                    *************************************************** J0216690
                    *                                                 * J0216700
                    *   FETCH AS REQUIRED, EXECUTE THE DDUMP MODULE   * J0216710
                    *                                                 * J0216720
                    *************************************************** J0216730
                    PL050 BSI     PL500     FETCH AUX I/O IF REQUIRED   J0216740
                    *                                                 * J0216750
                    *   DUMP IS ALWAYS FETCHED BEFORE ENTERED       2E2 J0216760
                    *                                                   J0216770
                    PL055 LDX  L3 DUMPC     IOAR HDR ADDR FOR DDUMP     J0216780
                          LDD   1 DMHDR     IOAR HEADER FOR DDUMP       J0216790
                          STO   1 PH4       RECORD THAT DDUMP IS CALLED J0216800
                    *                                                   J0216810
                          MDX     PLUS2     GO TO FETCH DDUMP           J0216820
                    *                                                   J0216830
                          HDNG    DCTL -- FETCH AND EXECUTE SUBROUTINE  J0216840
                    *************************************************** J0216850
                    *                                                 * J0216860
                    *   FETCH AND EXECUTE THE DUMPLET/DUMPFLET MODULE * J0216870
                    *                                                 * J0216880
                    *************************************************** J0216890
                    PL060 LDX  L3 B         INITIAL CORE LOCATION       J0216900
                          LDD   1 DLHDR     IOAR HDR ADDR FOR DUMPLET   J0216910
                          MDX     PLUS2     FETCH DUMPLET AND EXECUTE   J0216920
                    *                                                   J0216930
                    *************************************************** J0216940
                    *                                                 * J0216950
                    *   SET UP TO FETCH AND EXECUTE THE DELETE MODULE * J0216960
                    *                                                 * J0216970
                    *************************************************** J0216980
                    PL070 LDX  L3 B         IOAR HDR ADDR FOR DELETE    J0216990
                          LDD   1 DTHDR     IOAR HDR FOR DELETE         J0217000
                          MDX     PLUS2     GO TO FETCH DELETE          J0217010
                    *                                                   J0217020
                    *                                                 * J0217030
                    *************************************************** J0217040
                    *                                                 * J0217050
                    *   FETCH AUX I/O SUBR REQD AND SIZE OF CORE      * J0217060
                    *                                                 * J0217070
                    *************************************************** J0217080
                    PL500 DC      *-*       RECORD RETURN ADDR          J0217090
                          LD      *-1                                   J0217100
                          STO   1 IOREQ     SET NON ZERO                J0217110
                    *                                                 * J0217120
                          MDX     RI700     CHECK IF AUX I/O REQD   212 J0217130
                    *                                                 * J0217140
                    PL510 LD   L  $CORE                             212 J0217150
                          SRA     13                                    J0217160
                          STO   1 PH2       INDICATE DCTL IN CORE IF 8K J0217170
                    *                                                 * J0217180
                          BSC  I  PL500     RETURN - EXIT FROM PL500    J0217190
                    *************************************************** J0217200
                          HDNG    DCTL -- PROCESS NAME FIELD OF DCR     J0217210
                    *************************************************** J0217220
                    *                                                 * J0217230
                    *   CONVERT CHAR IN NAME FIELD TO NAME CODE       * J0217240
                    *   STORE RESULT IN .#NAME.                       * J0217250
                    *   CHECK VALIDITY OF FIRST CHARACTER (ALPHA ONLY)* J0217260
                    *                                                 * J0217270
                    *   IN REMARKS AAAA REFERS TO THE FIRST CHAR      * J0217280
                    *              BBBB REFERS TO THE SECOND CHAR     * J0217290
                    *              CCCC REFERS TO THE THIRD CHAR      * J0217300
                    *              DDDD REFERS TO THE FOURTH CHAR     * J0217310
                    *              EEEE REFERS TO THE FIFTH CHAR      * J0217320
                    *              Z    IS INDETERMINATE VALUE        * J0217330
                    *              NUMBERS ARE FACE VALUE             * J0217340
                    *   AND THE REMARKS ILLUSTRATE CONTENTS OF THE A  * J0217350
                    *   AND Q REGISTERS AFTER THE INSTRUCTION IS EXEC.* J0217360
                    *   WHERE THE CONTENTS ARE NOT SHOWN THEY ARE THE * J0217370
                    *   SAME AS THE PREVIOUS INSTRUCTION.             * J0217380
                    *                                                 * J0217390
                    *************************************************** J0217400
                    *                                                 * J0217410
                    SNAME DC      *-*       RECORD RETURN ADDR          J0217420
                          LDX  L2 BUF3+11   POINT TO COL 21,22 OF DCR   J0217430
                    *                                                   J0217440
                          LDD   2 0         AAAA BBBB  CCCC DDDD        J0217450
                          SLT     2         AAAB BBBC CCCD DDD0         J0217460
                          RTE     8         DDD0 AAAB BBBC CCCD         J0217470
                          SRA     2         ZDDD ZAAA                   J0217480
                          RTE     24        ZAAA BBBC  CCCD ZDDD        J0217490
                          SRA     2         ZZAA ABBB                   J0217500
                          SLT     2         ZAAA BBBC  CCDZ DDD0        J0217510
                          STO   1 #NAME     RECORD FIRST WORD OF NAME   J0217520
                    *                                                   J0217530
                          BSC  I  SNAME,-+  NAME FIELD BLANK            J0217540
                    *                                                 * J0217550
                          LD    2 2         EEEE 4444  CCDZ DDD0        J0217560
                          RTE     24        4444 CCDZ  DDD0 EEEE        J0217570
                          SRA     4         0044 44CC                   J0217580
                          RTE     22        4CCD DD0E  EEE0 0444        J0217590
                          SRA     4         044C CDDD                   J0217600
                          SRT     10        0000 0044  CCDD DEEE        J0217610
                          LD    1 #NAME     ZAAA BBBC  CCDD DEEE        J0217620
                          STD   1 #NAME     RECORD BOTH RESULTS         J0217630
                    *                                                   J0217640
                    *************************************************** J0217650
                    *                                                 * J0217660
                    *   CHECK THAT THE FIRST CHAR IS ALPHABETIC       * J0217670
                    *   NAME CODE FOR THE NAME IS IN THE A+Q REGISTERS* J0217680
                    *                                                 * J0217690
                    *************************************************** J0217700
                          S       SN901     LOWER LIMIT                 J0217710
                          BSC  L  SN100,+Z  BELOW LOWEST ALPHA CHAR     J0217720
                    *                                                   J0217730
                          LD    1 #NAME     RESTORE A+Q REGISTERS       J0217740
                          SRA     8         RIGHT JUSTIFY           2-8 J0217750
                          S       SN902     HIGHER LIMIT                J0217760
                          BSC  I  SNAME,+   WITHIN VALID RANGE..RETURN. J0217770
                          S       SN903     TEST FOR POUND SIGN     2-8 J0217780
                          BSC  I  SNAME,+-  EXIT IF SO - VALID      2-8 J0217790
                          SRA     1         TEST FOR AT SIGN        2-8 J0217800
                          BSC  I  SNAME,+-  EXIT IF SO - VALID      2-8 J0217810
                    *                                                 * J0217820
                    *************************************************** J0217830
                    SN100 BSI  I  LEAVE     PRINT ERROR MESSAGE         J0217840
                          DC      PH216     INVALID NAME FIELD          J0217850
                    ST830 EQU     SN100                             212 J0217855
                    *************************************************** J0217860
                    *************************************************** J0217870
                    SN901 DC      /0100     LOWEST ALPHA CHAR           J0217880
                    SN902 DC      /0029     HIGHEST ALPHA CHAR (Z)  2-8 J0217890
                    SN903 DC      /0012     #-9 (6BIT)              2-8 J0217900
                    *************************************************** J0217910
                          HDNG    DCTL -- PROCESS THE COUNT FIELD       J0217920
                    *************************************************** J0217930
                    *                                                 * J0217940
                    *   PUT DECIMAL VALUE FROM COLS 27-30 TO DATSW    * J0217950
                    *   IN HEX.                                       * J0217960
                    *                                                 * J0217970
                    *************************************************** J0217980
                    DACNT DC      *-*       RECORD RETURN ADDR          J0217990
                          STX   2 DA200+1   SAVE XR 2                   J0218000
                          LDX  I2 PEBUF+C   POINT TO PACKED EBCDIC BFR  J0218010
                          LDX   3 4                                     J0218020
                    *************************************************** J0218030
                    *                                                 * J0218040
                    *   PROCESS COLUMNS 29 AND 30                     * J0218050
                    *                                                 * J0218060
                    *************************************************** J0218070
                          LD    2 15        COLS 29,30                  J0218080
                          SLA     8         COL 30 ONLY                 J0218090
                          BSI     DA800     CHECK FOR NUMERIC FIELD     J0218100
                    *                                                   J0218110
                          BSI     DA700     RECORD INTO DATSW,UNITS     J0218120
                    *                                                   J0218130
                          LD    2 15        COLS 29,30                  J0218140
                          BSI     DA800     CHECK FOR COL 29 NUMERIC    J0218150
                    *                                                   J0218160
                          SLA     4                                     J0218170
                          BSI     DA700     RECORD COL 29 INTO DATSW    J0218180
                    *************************************************** J0218190
                    *                                                 * J0218200
                    *   PROCESS COLUMNS 27 AND 28                     * J0218210
                    *                                                 * J0218220
                    *************************************************** J0218230
                          LD    2 14        COLS 27,28                  J0218240
                          SLA     8         COL 28 ONLY                 J0218250
                          BSI     DA800     CHECK COL 28 FOR NUMERIC    J0218260
                    *                                                   J0218270
                          SLA     8                                     J0218280
                          BSI     DA700     RECORD COL 28 AS HUNDREDS   J0218290
                    *                                                   J0218300
                          LD    2 14                                    J0218310
                          BSI     DA800     CHECK COL 27 FOR NUMERIC    J0218320
                    *                                                   J0218330
                          SLA     12                                    J0218340
                          BSI     DA700     RECORD COL 27 AS THOUSANDS  J0218350
                    *************************************************** J0218360
                    *                                                 * J0218370
                    *   CONVERT DECIMAL VALUE IN DATSW TO HEX VALUE   * J0218380
                    *                                                 * J0218390
                    *************************************************** J0218400
                    DA100 SLT     32        CLEAR THE A AND Q REGISTERS J0218410
                          STO   1 TEMP1     CLEAR WORKING LOCATION      J0218420
                    *                                                   J0218430
                          LD    1 DATSW     WORD TO BE CONVERTED        J0218440
                    *                                                   J0218450
                    DA150 RTE     32-4                                  J0218460
                          STO   1 TEMP2     SAVE REST OF DIGITS         J0218470
                    *                                                   J0218480
                          MDX   3 -1        STEP DOWN NO OF DIGITS LEFT J0218490
                          MDX     DA170                                 J0218500
                          MDX     DA180     LAST DIGIT PROCESSED        J0218510
                    *                                                   J0218520
                    DA170 SLT     16        MOVE DIGIT TO THE A REG     J0218530
                          A     1 TEMP1     RUNNING TOTAL               J0218540
                          M       DA900     TIMES 10                    J0218550
                          SLT     16                                    J0218560
                          STO   1 TEMP1     NEW TOTAL                   J0218570
                    *                                                   J0218580
                          LD    1 TEMP2     BALANCE OF WORD TO CONVERT  J0218590
                          MDX     DA150     PROCESS NEXT DIGIT          J0218600
                    *                                                   J0218610
                    DA180 SLT     16                                    J0218620
                          A     1 TEMP1                                 J0218630
                          STO   1 DATSW     HEX VALUE INTO DATSW        J0218640
                    *************************************************** J0218650
                    DA200 LDX  L2 *-*       RESTORE XR 2                J0218660
                          BSC  I  DACNT     RETURN--- FROM DACNT ---    J0218670
                    *************************************************** J0218680
                    *                                                   J0218690
                    DA700 DC      *-*       RECORD RETURN ADDR          J0218700
                          OR    1 DATSW                                 J0218710
                          STO   1 DATSW     ACCUMULATIVE DECIMAL COUNT  J0218720
                    *                                                   J0218730
                          BSC  I  DA700     RETURN - DATSW UPDATED      J0218740
                    *************************************************** J0218750
                    DA800 DC      *-*       RECORD RETURN ADDR          J0218760
                          AND     DA901     MASK WITH FFOO              J0218770
                          EOR     DA902     MASK WITH 4000              J0218780
                          BSC  L  DA100,+-  FIRST LOW ORDER BLANK       J0218790
                          EOR     DA903     MASK WITH B000              J0218800
                          SRT     12                                    J0218810
                          BSC  L  ST855,Z   INVALID COUNT FIELD --ERROR J0218820
                          SLT     4                                     J0218830
                          BSC  I  DA800     RETURN-DIGIT IS NUMERIC     J0218840
                    *                                                   J0218850
                    *************************************************** J0218860
                    *                                                 * J0218870
                    *   CONSTANT USED BY THE DACNT  SUBROUTINE        * J0218880
                    *                                                 * J0218890
                    *************************************************** J0218900
                    DA900 DC      10        CONSTANT MULTIPLIER         J0218910
                    DA901 DC      /FF00     MASK                        J0218920
                    DA902 DC      /4000     MASK                        J0218930
                    DA903 DC      /B000     MASK                        J0218940
                    *************************************************** J0218950
                          HDNG    DCTL  READ IN REQD IOCS SUBRS FOR DUP J0218960
                    *************************************************** J0218970
                    *                                                 * J0218980
                    *   INSURE THAT THE DUP I/O SUBR SET REQUESTED    * J0218990
                    *   BY THE DUP CONTROL RECORD IS IN CORE          * J0219000
                    *   PH 14 IS PRINCIPAL I/O SUBR SET               * J0219010
                    *   PH 15 IS PRINCIPAL I/O SUBR SET EXCLUDING KB  * J0219020
                    *   PH 16 IS PAPER TAPE I/O SUBR SET              * J0219030
                    *                                                 * J0219040
                    *   IF PAPER TAPE IS REQUESTED THEN FETCH PHASE 16* J0219050
                    *                                                 * J0219060
                    *   IF KEYBOARD IS IN CORE THEN FETCH PHASE 15    * J0219070
                    *                                                 * J0219080
                    *   OTHERWISE CORRECT SUBR SET IS IN CORE         * J0219090
                    *                                                 * J0219100
                    *************************************************** J0219110
                    RI700 EQU     *         ENTRY POINT             212 J0219120
                          STX   3 RI708+1   SAVE XR 3                   J0219130
                          LDX  L3 RI708                                 J0219140
                          STX   3 RI800     INSERT RIOCS EXIT ADDR      J0219150
                    *                                                 * J0219160
                          LD    1 PTSW                                  J0219170
                          BSC  L  RI730,Z   PAPER TAPE REQUESTED        J0219180
                    *                                                   J0219190
                          LD    1 INOUT                                 J0219200
                          BSC  L  RI720,-Z  KB IN.FETCH PH 15           J0219210
                    *                                                   J0219220
                          LD    1 EBCSW                             2-9 J0219225
                          BSC     Z         IF DATA E SWITCH SET    2-9 J0219230
                          MDX     RI709     *GO OVERLAY CONV TABLE  2-9 J0219235
                          STO   1 IOREQ     PRINC I/O STILL IN CORE     J0219240
                    *                                                 * J0219250
                    RI708 LDX  L3 *-*       RESTORE XR 3                J0219260
                          BSC  L  PL510     RETURN                  212 J0219270
                    ************************************************2-9 J0219271
                    *                                               2-9 J0219272
                    *   IF DUMPDATA E OR STOREDATA E                2-9 J0219273
                    *   OVERLAY THE 1442 CONVERSION TABLE.          2-9 J0219274
                    *                                               2-9 J0219275
                    ************************************************2-9 J0219276
                    RI709 LDX  I3 IOADR+3   GET LD ADDR OF 1442 CONV2-9 J0219277
                          MDX  I3 RI900     POINT TO TABLE BEGIN    2-9 J0219278
                          LD      RI905     OVERLAY                 2-9 J0219279
                          STO   3 8         *FIVE                   2-9 J0219280
                          LD      RI906     *WORDS                  2-9 J0219281
                          STO   3 65        *OF                     2-9 J0219282
                          LD      RI907     *1442                   2-9 J0219283
                          STO   3 67        *CONVERSION             2-9 J0219284
                          LD      RI908     *TABLE                  2-9 J0219285
                          STO   3 73                                2-9 J0219286
                          LD      RI909                             2-9 J0219287
                          STO   3 81        RETURN WITH IOREQ       2-9 J0219288
                          MDX     RI708     *STILL SET FOR RESTORE  2-9 J0219289
                          HDNG    READ IN REQD IOCS SUBRS FOR DUP       J0219290
                    *************************************************** J0219300
                    *                                                 * J0219310
                    *   SET UP IOAR HEADER FOR PRINCIPAL INPUT SUBRS  * J0219320
                    *                                                 * J0219330
                    *************************************************** J0219340
                    RI710 DC      *-*       RECORD RETURN ADDR          J0219350
                          LDD   1 PIHDR     PRINC INPUT IOAR            J0219360
                    *                                                   J0219370
                          BSI     RI800     READ IN DUP PRINC IN SUBRS  J0219380
                    *                                                   J0219390
                          BSC  I  RI710     RETURN                      J0219400
                    *************************************************** J0219410
                    *************************************************** J0219420
                    *                                                 * J0219430
                    *   SET UP IOAR HEADER FOR PRINC IN SUBRS(EXCL KB)* J0219440
                    *                                                 * J0219450
                    *************************************************** J0219460
                    RI720 LDD   1 PIHDR+2   REQD IOAR                   J0219470
                          MDX     RI810     FETCH PRINC I/O (EXCL KB)   J0219480
                    *************************************************** J0219490
                    *************************************************** J0219500
                    *                                                 * J0219510
                    *   SET UP IOAR HEADER FOR PAPER TAPE SUBRS         J0219520
                    *                                                 * J0219530
                    *************************************************** J0219540
                    RI730 LDD   1 PIHDR+4   PT IOAR HDR                 J0219550
                          MDX     RI810     FETCH PAPER TAPE I/O SUBRS  J0219560
                    *************************************************** J0219570
                    *************************************************** J0219580
                    *                                                 * J0219590
                    *   READ INTO CORE THE REQD DUP I/O SUBROUTINES   * J0219600
                    *                                                 * J0219610
                    *************************************************** J0219620
                    RI800 DC      *-*       RECORD RETURN ADDR          J0219630
                    RI810 LDX  L3 IOADR     REQD CORE LOCATION          J0219640
                          STD   3 0         INSERT SPEC IOAR HEADER     J0219650
                    *                                                   J0219660
                          MDX  L  $IBSY,0   DO NOT RRAD IN AN I/O   2-6 J0219670
                          MDX     *-3       *ROUTINE UNTIL ALL I/O  2-6 J0219680
                    *                       *OPERATIONS FINISHED    2-6 J0219690
                          BSI  I  GET       GET SPEC GROUP OF SUBRS     J0219700
                    *                                                   J0219710
                          BSC  I  RI800     RETURN                      J0219720
                    *                                               2-9 J0219722
                    RI900 DC      /0038     SP130-SP000-1, TABL BEG 2-9 J0219723
                    RI905 DC      /50C9     OVERLAY                 2-9 J0219724
                    RI906 DC      /7C3C     *TABLE                  2-9 J0219725
                    RI907 DC      /6C2C     *WITH                   2-9 J0219726
                    RI908 DC      /4C0C     *THESE                  2-9 J0219727
                    RI909 DC      /7B3B     *WORDS                  2-9 J0219728
                    *                                               2-9 J0219729
                    *************************************************** J0219730
                          HDNG    DCTL  READ AND PROCESS HEADER RECORD  J0219740
                    *************************************************** J0219750
                    *                                                 * J0219760
                    *   READ FIRST DATA RECORD (HEADER RECORD) INTO   * J0219770
                    *   BUFFER WHOSE ADDR IS SPECIFIED IN .THIS. (IN  * J0219780
                    *   CATCO)                                        * J0219790
                    *   USES .GETBI. OF I/O INTERFACE SUBR TO READ THE* J0219800
                    *   RECORD.                                       * J0219810
                    *   USES .RD110. TO PROCESS MULTI ENTRY NAMES THRU* J0219820
                    *   LET SEARCH                                    * J0219830
                    *   FILTERS LEADING LOADER OVERLAY RECORDS        * J0219840
                    *   LEAVES HEADER RECORD IN BUFFER SPEC BY .NEXT. * J0219850
                    *   LEAVES FOLLOWING REC IN BFR SPEC BY .THIS. BUT* J0219860
                    *   IN UNPACKED STATUS.                           * J0219870
                    *                                                 * J0219880
                    *   EXIT-NORMAL RETURN TO CALLER                  * J0219890
                    *   EXIT-ERROR  INVALID TYPE                        J0219900
                    *   EXIT-ERROR  SECONDARY NAME ALREADY IN LET     * J0219910
                    *                                                 * J0219920
                    *************************************************** J0219930
                    RDHDR DC      *-*       RECORD RETURN ADDR          J0219940
                          LD    1 IOSW                                  J0219950
                          BSC  L  RD500,-+  SOURCE NOT I/O.RD FROM DISK J0219960
                    *                                                   J0219970
                          LD    1 PTSW                                  J0219980
                          BSI  I  GETBI,-+  READ BINARY RCD (IF CARD)   J0219990
                    *                                                 * J0220000
                    RD010 LDD   1 THIS                                  J0220010
                          RTE     16                                    J0220020
                          STD   1 THIS      SWITCH BUFFERS              J0220030
                    *                                                   J0220040
                          BSI  I  GETBI     READ NEXT BINARY RECORD     J0220050
                    *                                                 * J0220060
                          BSI  I  PACKB     PACK THIS BINARY RECORD     J0220070
                    *                                                 * J0220080
                    *************************************************** J0220090
                    *                                                 * J0220100
                    *   DECODE TYPE OF HEADER RECORD                  * J0220110
                    *        TYPES 3,4  SEARCH LET FOR SECONDARY ENTRY* J0220120
                    *        TYPES 1,2,5,6,7  RETURN TO CALLING SUBR  * J0220130
                    *                   POINTS                        * J0220140
                    *                                                 * J0220150
                    *        TYPES 8,9,A,B,F  ARE ERRONEOUS TYPES     * J0220160
                    *        TYPES C,D,E  ARE LOADER OVERLAY. BYPASSED* J0220170
                    *                                                 * J0220180
                    *************************************************** J0220190
                    RD015 LDX  I2 NEXT+C    PT TO WD CNT OF BUFFER      J0220200
                          LD    2 3         PICK UP TYPE AND PRECISION  J0220210
                          SLA     4         SHIFT OFF SUB TYPE          J0220220
                          SRA     12        SHIFT OFF PRECISION         J0220230
                          A       RD904     ADD MDX OP CODE         212 J0220240
                          STO     RD020     SET UP REQUIRED MDX INST    J0220250
                    *************************************************** J0220260
                    *                                                 * J0220270
                    *   DECODE TYPE. POSITION IN TABLE IS THE TYPE NO.* J0220280
                    *                                                 * J0220290
                    *************************************************** J0220300
                    RD020 EQU     *         LABEL NEXT INSTURCYION      J0220310
                          MDX     *                                     J0220320
                          MDX     RD800     TYPE 0 - ERROR              J0220330
                          MDX     RD060     TYPE 1 - MAINLINE ABSOLUTE  J0220340
                          MDX     RD060     TYPE 2 - MAINLINE RELOC     J0220350
                          MDX     RD100     TYPE 3 - LIBF SUBROUTINE    J0220360
                          MDX     RD100     TYPE 4 - CALL SUBROUTINE    J0220370
                          MDX     RD150     TYPE 5 - LIBF ISS           J0220380
                          MDX     RD150     TYPE 6 - CALL ISS           J0220390
                          MDX     RD150     TYPE 7 - ILS                J0220400
                          MDX     RD800     TYPE 8 - INVALID            J0220410
                          MDX     RD800     TYPE 9 - INVALID            J0220420
                          MDX     RD800     TYPE A - DATA - INVALID     J0220430
                          MDX     RD800     TYPE B - INVALID            J0220440
                          MDX     RD010     TYPE C -LDR OVERLAY- BYPASS J0220450
                          MDX     RD010     TYPE D -LDR OVERLAY- BYPASS J0220460
                          MDX     RD010     TYPE E -LDR OVERLAY- BYPASS J0220470
                          MDX     RD800     TYPE F - END - INVALID      J0220480
                    *                                                 * J0220490
                    *************************************************** J0220500
                    *                                                 * J0220510
                    *   DRIVER FOR PROCESSING HEADER RECORDS WITH     * J0220520
                    *   RD060 - MAIN LINE HEADERS      TYPES 1+2 ENTRY* J0220530
                    *   RD100 - LIBF AND CALL SUBR     TYPES 3+4 ENTRY* J0220540
                    *   RD150 - LIBF,CALL ISS+ILS SUBR TYPES 5-7 ENTRY* J0220550
                    *                                                 * J0220560
                    *************************************************** J0220570
                    RD060 LD    1 CISW      GO TO CHECK PROG HDR    2-3 J0220580
                          BSC  L  RD065,+-  *NAME ONLY IF STORECI   2-3 J0220590
                          LD    1 DATSW     *WITH SUPV CONTROL      2-3 J0220600
                          BSI  L  RD550,Z   *RECORDS SPECIFIED      2-3 J0220610
                    *                                               2-3 J0220620
                    RD065 SLA     16                                    J0220630
                          STO   2 10        CLEAR ML NAME FROM DSF HDR  J0220640
                          STO   2 11                                    J0220650
                    *                                                 * J0220660
                          LD      RD902     THREE                       J0220670
                          STO   2 6         FORCE ML HEADER LENGTH   12 J0220680
                    *                                                 * J0220690
                          MDX     RD160     COMMON HEADER PROCESSING    J0220700
                    *                                                 * J0220710
                    RD100 EQU     *         LABEL NEXT INSTRUCTION      J0220720
                          LD    1 UASW                                  J0220730
                          OR    1 FXSW                                  J0220740
                          BSC  L  RD210,Z   STORE TO UA OR FX,SEARCH212 J0220750
                    *                                                   J0220760
                    RD150 EQU     *         LABEL FOR NEXT INSTRUCTION  J0220770
                          BSI     RD550     CHECK PROGRAM NAME          J0220780
                    *                                                 * J0220790
                    RD160 MDX     RD600     CHECK PROG HDR LNGH     212 J0220800
                    *                                                   J0220810
                    * ONE INSTR REMOVED                             212 J0220820
                    *************************************************** J0220830
                    RD904 DC      /7000     MDX OP CODE             212 J0220835
                          HDNG    DCTL -- PROCESS THE HEADER RECORD     J0220840
                    *************************************************** J0220850
                    *                                                 * J0220860
                    *   SEARCH LET FOR EACH SECONDARY ENTRY POINT     * J0220870
                    *                                                 * J0220880
                    *************************************************** J0220890
                    RD210 EQU     *         ENTRY POINT             212 J0220900
                          LD    1 MODSW     BY-PASS SECONDARY ENTRY 212 J0220903
                          BSC  L  RD150,Z   *POINTS IF STOREMOD     212 J0220906
                          STX   2 RD240+1   SAVE XR2 WHILE IN SUBR      J0220910
                          LD    2 6         3 * NO OF ENTRY POINTS      J0220920
                          S       RD902     REDUCE BY WORDS OF ONE NTRY J0220930
                          STO     RD903     RECORD 3*(NO OF ENTRYS-1)   J0220940
                    *                                                   J0220950
                          BSC  L  RD150,-+  NO SECONDARY            212 J0220960
                    *                                                   J0220970
                          LDD   1 #NAME                                 J0220980
                          STD     RD900     SAVE NAME FROM DCR          J0220990
                    *                                                   J0221000
                    RD220 LD    2 14                                    J0221010
                          RTE     16                                    J0221020
                          LD    2 13                                    J0221030
                          STD   1 #NAME     SECONDARY ENTRY NAME        J0221040
                          STX   2 RD230+1   SAVE XR2 OVER LETSR         J0221050
                    *                                                   J0221060
                          BSI     LETSR     SEARCH LET FOR NAME         J0221070
                    *                                                   J0221080
                    RD230 LDX  L2 *-*       RESTORE XR2 AFTER LETSEARCH J0221090
                          LD    1 NAMSW                                 J0221100
                          BSC  L  RD850,Z   NAME FOUND   ---ERROR---    J0221110
                    *                                                   J0221120
                          MDX   2 +3        ADVANCE PT TO THE NEXT NAME J0221130
                          MDX  L  RD903,-3  REDUCE ENTRY COUNT BY 1     J0221140
                          MDX     RD220     LOOP FOR NEXT ENTRY         J0221150
                    *                                                 * J0221160
                          LDD     RD900                                 J0221170
                          STD   1 #NAME     RESTORE PRIME ENTRY NAME    J0221180
                    *                                                 * J0221190
                    RD240 LDX  L2 *-*       RESTORE XR2 TO ORIG VALUE   J0221200
                          MDX     RD150     RTN-LET SRCH COMPLETE   212 J0221210
                    *************************************************** J0221220
                    *************************************************** J0221230
                    *                                                 * J0221240
                    *   MULTIPLE ENTRYS      REQUIRE SCAN OF LET/FLET * J0221250
                    *   READ HEADER RECORD FROM DISK (WS) AFTER       * J0221260
                    *   CHECKING VALIDITY OF THE PROGRAM IN WS        * J0221270
                    *                                                 * J0221280
                    *************************************************** J0221290
                    RD500 LDX  I3 NEXT+C                                J0221300
                          MDX   3 -1        POINT TO IOAR HEADER AREA   J0221310
                    *                                                   J0221320
                          LD      RD952                                 J0221330
                          STO   3 0         INSERT WORD COUNT MAXIMUM   J0221340
                    *                                                   J0221350
                          LDX  I2 #FRDR+C   SELECT DRIVE REQD FOR WS    J0221360
                          LD   L2 #WSCT+C                               J0221370
                          BSC  L  RD830,-+  NO PROGRAM IN WS    -ERROR- J0221380
                    *                                                 * J0221390
                          LD   L2 #FMAT+C                               J0221400
                          BSC  L  RD820,Z   PROG NOT IN DSF     -ERROR- J0221410
                    *                                                   J0221420
                          LD    1 #FRDR                                 J0221430
                          SLA     12        LEFT JUSTIFY 4 BIT DRIVE NO J0221440
                          OR   L2 $FPAD     COMBINE DR # WITH SCTR ADDR J0221450
                          STO   3 1         RECORD WORK STORAGE SCTR    J0221460
                    *                                                   J0221470
                          BSI  I  GET       READ PROG HDR WDS FROM WS   J0221480
                    *                                                   J0221490
                          MDX     RD015     HEADER RECORD READ          J0221500
                    *************************************************** J0221510
                    *************************************************** J0221520
                    *                                                 * J0221530
                    *   PROCESS HEADER FOR SPECIFIED NAME AND         * J0221540
                    *   LEGITIMATE PROGRAM HEADER LENGTH.             * J0221550
                    *                                                 * J0221560
                    *************************************************** J0221570
                    RD550 DC      *-*       RECORD RETURN ADDRESS       J0221580
                          LD    1 TOWS                                  J0221590
                          BSC  I  RD550,Z   NAME NOT REQD. STORE TO WS  J0221600
                    *                                                 * J0221610
                          LD    2 10                                    J0221620
                          BSC  I  RD550,-+  SKIP CHECK IF NAME BLANK    J0221630
                    *                                                   J0221640
                          LD    1 #NAME                                 J0221650
                          AND     RD999     AND OUT THE 2 HIORDER BITS  J0221660
                          S     2 10                                    J0221670
                          BSC  L  RD790,Z   FIRST WORD OF NAME NOT SAME J0221680
                    *                                                   J0221690
                          LD    2 11                                    J0221700
                          S     1 #NAME+1                               J0221710
                          BSC  L  RD790,Z   BRANCH IF NAME NOT SAME 2-3 J0221720
                          LD      *         NAME IN HDR AGREES WITH 2-3 J0221730
                          STO   1 HDNSW     *NAME SPECIFIED. SET    2-3 J0221740
                          BSC  I  RD550     *HDR NAME SW AND RETURN 2-3 J0221750
                    *************************************************** J0221760
                    *************************************************** J0221770
                    *                                                 * J0221780
                    *   RECORD REQD PROGRAM HEADER LENGTH AND CHECK   * J0221790
                    *                                                 * J0221800
                    *************************************************** J0221810
                    RD600 EQU     *         ENTRY POINT             212 J0221820
                          LD    2 12        WORD 12 OF THE PROG HEADER  J0221830
                          STO   1 #ENTY     CORE LOC FOR PRIME ENTRY    J0221840
                    *                                                   J0221850
                          LD    2 6         WORD 6 OF THE PROG HEADER   J0221860
                          A       RD909                                 J0221870
                          STO   1 PGMHL     RECORD DSF PROG HDR LENGTH  J0221880
                    *                                                   J0221890
                          S       RD912                                 J0221900
                          BSC  L  RD810,+Z  HEADER LENGTH LESS THAN 12  J0221910
                    *                                                   J0221920
                          S       RD939                                 J0221930
                          BSC     -Z        HDR LENGTH L.T. 52      212 J0221940
                    *                                                   J0221950
                          MDX     RD810     HEADER LENGTH TOO LONG      J0221960
                    *************************************************** J0221970
                          HDNG    DCTL -- EXITS FROM READING HEADER REC J0221980
                    *************************************************** J0221990
                    RD750 BSC  I  RDHDR     RETURN -- EXIT -- NORMAL -- J0222000
                    *************************************************** J0222010
                    *                                                 * J0222020
                    *************************************************** J0222030
                    RD790 BSI  I  LEAVE     PRINT ERROR MESSAGE         J0222040
                          DC      PH201     NOT PRIME ENTRY-ERROR EXIT- J0222050
                    *************************************************** J0222060
                    *************************************************** J0222070
                    RD800 BSI  I  LEAVE     PRINT ERROR MESSAGE         J0222080
                          DC      PH202     INVALID TYPE -- ERROR EXIT  J0222090
                    *************************************************** J0222100
                    *************************************************** J0222110
                    RD810 BSI  I  LEAVE     PRINT ERROR MESSAGE         J0222120
                          DC      PH203     INVALID HEADER LENGTH--EXIT J0222130
                    *************************************************** J0222140
                    *************************************************** J0222150
                    RD820 BSI  I  LEAVE     PRINT ERROR MESSAGE         J0222160
                          DC      PH227     SOURCE IS NOT IN DSF -EXIT- J0222170
                    *************************************************** J0222180
                    *************************************************** J0222190
                    RD830 BSI  I  LEAVE     PRINT ERROR MESSAGE         J0222200
                          DC      PH222     PROG NOT IN WS       -EXIT- J0222210
                    *************************************************** J0222220
                    *************************************************** J0222230
                    RD850 EQU     *         LABEL FOR NEXT INSTRUCTION  J0222240
                          BSI  I  LEAVE     PRINT ERROR MESSAGE         J0222250
                          DC      PH205     ENTRY POINT IN LET --EXIT   J0222260
                    *************************************************** J0222270
                          BSS  E  0                                     J0222280
                    RD900 DC      *-*       2 WORDS FOR SAVEING PRIME   J0222290
                          DC      *-*       ENTRY NAME                  J0222300
                    RD902 DC      3         CONSTANT                    J0222320
                    RD903 DC      *-*       TEMP STG OF ENTRY PT WD CNT J0222330
                    RD909 DC      9         CONSTANT                    J0222350
                    RD912 DC      12        CONSTANT                    J0222360
                    RD939 DC      39        CONSTANT                    J0222370
                    RD952 DC      52        CONSTANT                    J0222380
                    RD999 DC      /3FFF     CONSTANT FOR MASKING        J0222390
                    *************************************************** J0222400
                          HDNG    DCTL -- DUP LET SEARCH                J0222410
                    *************************************************** J0222420
                    *                                                 * J0222430
                    *   *SEARCH LET/FLET FOR NAME RECORDED IN .#NAME. * J0222440
                    *   OF DCOM.                                      * J0222450
                    *   * STORE FUNCTION WILL SUPPLY DRIVE NO TO BE   * J0222460
                    *   SEARCHED IN .#TODR. WHILE DUMP,DUMPLET, AND   * J0222470
                    *   DELETE SPECIFY THE DRIVE NO. IN .#FRDR.       * J0222480
                    *   *AS EACH SECTOR OF LET/FLET FOR THE FIRST     * J0222490
                    *   CARTRIDGE IS SEARCHED THE SIZE AND ADDR OF    * J0222500
                    *   THE LARGEST AREA AVAILABLE FOR STORAGE IS     * J0222510
                    *   RECORDED.                                     * J0222520
                    *   * IF A 1DUMY ENTRY IS LOCATED AND THE RECORD  * J0222530
                    *   SWITCH .LE960. IS ON THEN THE LET ENTRY AND   * J0222540
                    *   DB LOCATION IS RECORDED FOR LET OR FLET.      * J0222550
                    *   THE SIZE IS IN #USZE, AND #FSZE               * J0222560
                    *   THE DB ADDR IS PUT IN #UHOL AND #FHOL         * J0222570
                    *   * IF THE NAME WAS FOUND THE LET ENTRY AND THE * J0222580
                    *   PROG/DATA  DBADR ARE RECORDED BEFORE RETURNING* J0222590
                    *   TO THE CALLING SUBROUTINE.                    * J0222600
                    *   * WHEN THE FIRST SECTOR OF LET IS SEARCHED    * J0222610
                    *   WORD 5 OF THE LET SECTOR HEADER SPECIFIES THE * J0222620
                    *   NEXT SECTOR OF LET/FLET TO FETCH.             * J0222630
                    *   * AFTER FETCHING AND SEARCHING UNTIL WORD 5   * J0222640
                    *   OF THE LET HEADER IS ZERO A CHECK IS MADE     * J0222650
                    *   TO GET THE FIRST SECTOR OF LET ON THE NEXT    * J0222660
                    *   LOGICAL CARTRIDGE.                            * J0222670
                    *   * WHEN THE LAST SPECIFIED CARTRIDGE HAS BEEN  * J0222680
                    *   SEARCHED,OR THE NAME FOUND CONTROL IS RETURNED* J0222690
                    *   TO THE CALLING SUBROUTINE.                    * J0222700
                    *   * AT THE END OF EACH LET A SYSTEM CHECK IS    * J0222710
                    *   MADE OF THE CALC (BASED ON DB CNT OF LET      * J0222720
                    *   ENTRIES)OF DBADR OF THE END OF THE UA AND     * J0222730
                    *   THE ACTUAL END OF THE UA AS SPECIFIED IN #ANDU* J0222740
                    *   IN DCOM FOR THE SPECIFIED CARTRIDGE.          * J0222750
                    *   * IF THEY ARE NOT EQUAL A DIAGNOSTIC PRINTOUT * J0222760
                    *   WILL OCCUR AND THE LONGER WILL BE REDUCED TO  * J0222770
                    *   THE SHORTER WHERE POSSIBLE.                   * J0222780
                    *   * IF BY REMOVING 1 OR MORE LET ENTRIES A      * J0222790
                    *   MATCH WILL OCCUR THEN THE NAMES OF THOSE      * J0222800
                    *   ENTRY(S) WILL BE PRINTED AS THEY ARE REMOVED. * J0222810
                    *                                                 * J0222820
                    *************************************************** J0222830
                    *                                                 * J0222840
                    *   INITIALIZATION                                * J0222850
                    *                                                 * J0222860
                    *************************************************** J0222870
                    LETSR DC      *-*       RECORD RETURN ADDR          J0222880
                          BSI  I  PHID      RECORD PHASE ID             J0222890
                          DC      /C002     INITIAL LET SEARCH IN DCTL  J0222900
                    *                                                   J0222910
                          LD    1 STSW                                  J0222920
                          STO     LE960     PERMIT RECORDING IF STORING J0222930
                    *                                                   J0222940
                          BSC  L  LE010,-+  NOT STORE FUNCTION          J0222950
                    *                                                   J0222960
                          LD    1 #TODR     PICK UP DRIVE NO FOR STORE  J0222970
                          LDX  I2 #TODR+C   PICK UP LOG DRIVE NO.       J0222980
                          MDX     LE020     CONTINUE SEARCH,STORE TYPE  J0222990
                    *                                                   J0223000
                    LE010 LD    1 #FRDR     PICK UP PROPER DRIVE IND.   J0223010
                          LDX  I2 #FRDR+C   PICK UP LOG DRIVE NO.       J0223020
                    LE020 LDX   3 1         SET UP FOR SINGLE DRIVE     J0223030
                          BSC  L  LE030,-   SINGLE DRIVE SPECIFIED      J0223040
                    *                                                   J0223050
                          LDX   2 0         SET DRIVE NO TO LOG ZERO    J0223060
                          LDX   3 5         ALLOW FOR MAX OF 5 DRIVES   J0223070
                    LE030 STX   3 LE950     MAX DRIVE COUNT TO SEARCH   J0223080
                    *                                                   J0223090
                          LDD   1 #NAME     PICK UP NAME SPECIFIED      J0223100
                          SLT     2         ELIMINATE FIRST TWO BITS    J0223110
                          STD     LE930     RECORD SHIFTED NAME         J0223120
                    *                                                   J0223130
                          LDX  I3 LETAR+C   RECORD L/F IOAR HDR ADDR    J0223140
                    *                                                   J0223150
                          MDX     LE042     BYPASS RESET OF RECORD SW   J0223160
                    *************************************************** J0223170
                    *                                                 * J0223180
                    *   SET UP NEW DRIVE PROCESSING                   * J0223190
                    *                                                 * J0223200
                    *************************************************** J0223210
                    LE040 SLA     16        CREATE ZERO                 J0223220
                          STO     LE960     TURN OFF RECORD SWITCH      J0223230
                    *                                                 * J0223240
                          MDX  L  LE950,-1  REDUCE NO OF DRIVES TO SRCH J0223250
                          MDX   2 +1        ADVANCE TO NEXT DRIVE       J0223260
                    LE042 LD      LE950                                 J0223270
                          BSC  L  LE090,+   LAST REQD DRIVE SEARCHED    J0223280
                    *                                                   J0223290
                          MDX     LE200     PROCESS NEW DRIVE       212 J0223300
                    *                                                   J0223310
                    LE044 BSI  I  PHID      RECORD PH IN PROGRESS   212 J0223320
                          DC      /E002     NEW DRIVE OR EXIT LETSR     J0223330
                    *                                                   J0223340
                          BSI  I  MDUMP     PRINT UPCOR EXCLUDING LETAR J0223350
                    *                                                   J0223360
                          LD    3 6         LET SECTOR ADDR INCL DRIVE  J0223370
                          SLA     4                                     J0223380
                          BSC  L  LE090,-+  ZERO ADDR.L/F SEARCH COMP   J0223390
                    *                                                   J0223400
                    *************************************************** J0223410
                    *                                                 * J0223420
                    *   SET UP NEW SECTOR PROCESSING                  * J0223430
                    *                                                 * J0223440
                    *************************************************** J0223450
                    LE050 LD    3 6         LET SECTOR ADDR             J0223460
                          BSC  L  LE040,-+  LAST L/F SCTR OF DR SEARCHD J0223470
                    *                                                   J0223480
                          BSI  I  PHID      RECORD PHASE ID PROGRESS    J0223490
                          DC      /D002     NEW SECTOR OF FLET SEARCH   J0223500
                    *                                                   J0223510
                          MDX     LE400     PROCESS NEW SCTR AND HDR212 J0223520
                    *                                                   J0223530
                    *************************************************** J0223540
                    *                                                 * J0223550
                    *   SET UP NEXT ENTRY PROCESSING                  * J0223560
                    *                                                 * J0223570
                    *************************************************** J0223580
                    LE060 MDX  L  SKWDS+C,-3   DECREMENT BY 1 ENTRY     J0223590
                          MDX     LE062     MORE ENTRYS TO PROCESS      J0223600
                    *                                                   J0223610
                          LDX  I3 LETAR+C   POINT TO IOAR HDR OF LET    J0223620
                          MDX     LE050     LAST ENTRY OF SCTR PROCESSD J0223630
                    *                                                 * J0223640
                    LE062 MDX     LE600     PROCESS NEXT L/F ENTRY  212 J0223650
                    *                                                 * J0223660
                    LE063 LD    1 NAMSW                             212 J0223670
                          BSC  L  LE060,-+  NAME NOT FOUND              J0223680
                    *                                                 * J0223690
                    *************************************************** J0223700
                    *                                                 * J0223710
                    *   PROCESS ENTRY OF NAME THAT WAS FOUND          * J0223720
                    *                                                 * J0223730
                    *************************************************** J0223740
                          LD    3 3                                     J0223750
                          STO   1 #DBCT     DB SIZE OF ENTRY            J0223760
                    *                                                   J0223770
                          LDD     LE932                                 J0223780
                          STD   1 #NAME     RECORD FOUND NAME & INDR-S  J0223790
                    *                                                   J0223800
                          STX  L3 DELSW+C   REL ADDR OF L/F ENTRY -1    J0223810
                    *                                                   J0223820
                    *************************************************** J0223830
                    *                                                 * J0223840
                    *   EXIT FROM .LETSR. SUBROUTINE                  * J0223850
                    *                                                 * J0223860
                    *************************************************** J0223870
                    LE090 EQU     *         LABEL FOR NEXT INSTRUCTION  J0223880
                    *                                                   J0223890
                    *************************************************** J0223900
                          BSC  I  LETSR     LET SEARCH COMPLETE -RETURN J0223910
                    *************************************************** J0223920
                          HDNG    DCTL - LET SEARCH - CONSTANTS+WK AREA J0223930
                    *************************************************** J0223940
                    *                                                 * J0223950
                    *   CONSTANTS AND WORK AREAS USED BY LET SEARCH   * J0223960
                    *                                                 * J0223970
                    *************************************************** J0223980
                    LE906 DC      /7112     FIRST WORD OF 1DUMY         J0223990
                    LE908 DC      0         NON ZERO FOR LET SEARCHING  J0224000
                    LE917 DC      /F000     MASK FOR THE DRIVE CODE     J0224020
                    LE918 DC      *-*       CURRENT LOGICAL DRIVE       J0224030
                    LE920 DC      320       WORD COUNT OF 1 SECTOR      J0224040
                    LE929 DC      *-*       SCTR ADDR OF LAST PROC SCTR J0224050
                    LE930 BSS  E  2         GIVEN NAME SHIFTED LEFT 2   J0224060
                    LE932 BSS     2         CURRENT ENTRY NAME          J0224070
                    LE950 BSS     1         NO.OF DRIVES YET TO SEARCH  J0224080
                    LE960 BSS     1         NON ZERO TO RECORD LET INFO J0224090
                    LE970 DC      /6400     NO. DB PER CART        2-10 J0224095
                    *************************************************** J0224100
                          HDNG    DCTL - LET SEARCH - NEW DRIVE         J0224110
                    *************************************************** J0224120
                    *                                                 * J0224130
                    *   PROCESS A NEW DRIVE                           * J0224140
                    *                                                 * J0224150
                    *************************************************** J0224160
                    LE200 EQU     *         ENTRY POINT             212 J0224170
                          LD   L2 #ULET+C   PICK UP LET SECT ADDR       J0224180
                          STO   3 6         RECORD NEXT LET SCTR ADDR   J0224190
                    *                                                   J0224200
                          AND     LE917     MASK                        J0224210
                          STO     LE918     SAVE DRIVE CODE BITS ONLY   J0224220
                    *                                                 * J0224230
                    * ONE INSTR REMOVED                             212 J0224240
                          STX     LE908     SET L/F SW TO LET       212 J0224250
                    *                                                 * J0224260
                          MDX     LE044     NEW DRIVE SELECTED-RTN  212 J0224270
                    *************************************************** J0224280
                          HDNG    DCTL - LET SEARCH - NEW SECTOR        J0224290
                    *************************************************** J0224300
                    *                                                 * J0224310
                    *   PROCESS NEW LET/FLET SECTOR                   * J0224320
                    *   RECORD THE PREVIOUS SECTOR ADDR               * J0224330
                    *   RECORD THE REQD LET/FLET SCTR IOAR HDR,FETCHIT* J0224340
                    *                                                 * J0224350
                    *************************************************** J0224360
                    LE400 EQU     *         ENTRY POINT             212 J0224370
                          LDX  I3 LETAR+C   INIT XR3 FOR L/F IOAR HDR   J0224380
                          LD    3 1                                     J0224390
                          STO     LE929     RECORD LAST SCTR PROCESSED  J0224400
                    *                                                 * J0224410
                          LD    3 6         REQD SCTR ADDR              J0224420
                          OR      LE918     INCL DRIVE CODE             J0224430
                          STO   3 1         RECORD REQD SCTR ADDR       J0224440
                          STO   1 LSTLF     RECORD SECTOR AND DRIVE     J0224450
                    *                                                   J0224460
                          LD      LE920                                 J0224470
                          STO   3 0         WORD COUNT FOR 1 SECTOR     J0224480
                    *                                                 * J0224490
                          BSI  I  GET       FETCH REQD LET/FLET SECTOR  J0224500
                    *                                                 * J0224510
                    *************************************************** J0224520
                    *                                                 * J0224530
                    *   CHECK FOR FIRST LET AND FLET SECTORS ON THIS  * J0224540
                    *   DRIVE AND SET RESPECTIVE PARAMETERS FOR THE   * J0224550
                    *   UA AND FIXED AREA IF A FIRST SCTR IS IDENTIFD * J0224560
                    *                                                 * J0224570
                    *************************************************** J0224580
                    LE450 LD   L2 #ULET+C   FIRST LET SECTOR ADDR       J0224590
                          S     3 1         SCTR JUST IN CORE           J0224600
                          BSC  L  LE460,Z   NOT FIRST LET SECTOR        J0224610
                    *                                                   J0224620
                          MDX     LE465     SET UP FOR FIRST LET SCTR   J0224630
                    *                                                 * J0224640
                    LE460 LD   L2 #FLET+C   FLET SCTR ADDR              J0224650
                          S     3 1         ADDR OF SCTR JUST READ      J0224660
                          BSC  L  LE470,Z   NOT FIRST FLET SCTR         J0224670
                    *                                                 * J0224680
                          STO     LE908     SET LET/FLET SW TO FLET     J0224690
                    *                                                 * J0224700
                    LE465 LD    3 3         STARTING SECTOR             J0224710
                          SLA     4         CONVERT TO DB-S             J0224720
                          STO   1 DBADR     DB ADDR,STARTING            J0224730
                    *                                                   J0224740
                    LE470 LD      LE920     WORDS/SCTR                  J0224750
                          S     3 5         WORDS AVAIL ON THIS SCTR    J0224760
                          STO   1 SKWDS     NO OF WORDS TO SEARCH       J0224770
                    *                                                   J0224780
                          MDX  L  SKWDS+C,-2   SUB HDR WDS,ADD 1 ENTRY  J0224790
                    *                                                   J0224800
                          MDX   3 +3        PT TO 1ST ENTRY -1,-1 ENTRY J0224810
                    *                                                   J0224820
                          MDX     LE060     SCTR HDR PROCESSED-RTN  212 J0224830
                    *************************************************** J0224840
                          HDNG    DCTL - LET SEARCH - NEW ENTRY         J0224850
                    *************************************************** J0224860
                    *                                                 * J0224870
                    *   PROCESS A NEW LET/FLET ENTRY.NAME AND DB COUNT* J0224880
                    *                                                 * J0224890
                    *************************************************** J0224900
                    LE600 EQU     *         ENTRY POINT             212 J0224910
                          MDX   3 +3        ADVANCE POINTER 1 ENTRY     J0224920
                          LD    3 2         WORD 2 OF THE NAME          J0224930
                          RTE     16                                    J0224940
                          LD    3 1         WORD 1 OF THE NAME          J0224950
                          STD     LE932     CURRENT ENTRY NAME          J0224960
                    *                                                   J0224970
                          SLT     2         ELIMINATE TYPE ID           J0224980
                          SD      LE930                                 J0224990
                          BSC  L  LE650,Z   FIRST WORD OF NAME DIFFERS  J0225000
                    *                                                   J0225010
                          RTE     16                                    J0225020
                          BSC  L  LE650,Z   SECOND WORD OF NAME DIFFERS J0225030
                    *                                                 * J0225040
                    *************************************************** J0225050
                    *                                                 * J0225060
                    *   SPECIFIED PROGRAM NAME FOUND IN LET/FLET SCTR   J0225070
                    *                                                 * J0225080
                    *************************************************** J0225090
                          STX  L  NAMSW+C   INDICATE THAT NAME FOUND    J0225100
                    LE625 MDX     LE063     NAME FOUND, RETURN      212 J0225110
                    *                                                 * J0225120
                    *************************************************** J0225130
                    *************************************************** J0225140
                    *                                                 * J0225150
                    *   CHECK FOR AND PROCESS 1DUMY ENTRIES           * J0225160
                    *                                                 * J0225170
                    *************************************************** J0225180
                    LE650 LD      LE960     *IS RECORDING REQUIRED      J0225190
                          BSC  L  LE685,-+  *NO,PARAMS OF 1DUMY NOT REQ J0225200
                    *                                                   J0225210
                          LD    3 1         FIRST WORD OF NAME          J0225220
                          S       LE906                                 J0225230
                          BSC  L  LE685,Z   NOT A 1DUMY ENTRY           J0225240
                    *                                                   J0225250
                          LD      LE908                                 J0225260
                          BSC  L  LE670,Z   SEARCHING A LET SECTOR  212 J0225270
                    *                                                 * J0225280
                    *************************************************** J0225290
                    *                                                 * J0225300
                    *   PROCESS A 1DUMY FLET ENTRY                    * J0225310
                    *                                                 * J0225320
                    *************************************************** J0225330
                          LD    3 3                                     J0225340
                          S     1 #FSZE                                 J0225350
                          BSC  L  LE685,+   CURRENT ENTRY NOT LARGER    J0225360
                    *                                                   J0225370
                          LD    1 FXSW                                  J0225380
                          BSC  L  LE685,-+  STORE IS TO UA              J0225390
                    *                                                 * J0225400
                          LD    3 3                                     J0225410
                          STO   1 #FSZE     RECORD LARGER ENTRY         J0225420
                    *                                                   J0225430
                          LD    1 DBADR                                 J0225440
                          STO   1 #FHOL     RECORD DBADR OF LARGER HOLE J0225450
                    *                                                   J0225460
                          MDX     LE680     FINISH PROCESSING FLET ENTR J0225470
                    *                                                 * J0225480
                    *************************************************** J0225490
                    *                                                 * J0225500
                    *   PROCESS A 1DUMY LET ENTRY                     * J0225510
                    *                                                 * J0225520
                    *************************************************** J0225530
                    LE670 LD    1 UASW                             2-10 J0225540
                          BSC  L  LE685,-+  STORE IS TO FXA        2-10 J0225550
                    *                                              2-10 J0225560
                          LD    3 3         DB CNT OF THIS 1DUMY   2-10 J0225570
                          A     1 DBADR     BEGIN ADDR THIS 1DUMY  2-10 J0225580
                          S       LE970     SUB NO. DB PER CART    2-10 J0225590
                          BSC  L  LE685,+Z  BR IF NOT LAST 1DUMY   2-10 J0225595
                    *                                                 * J0225600
                          LD    3 3                                     J0225610
                          STO   1 #USZE     DB SIZE LAST UA 1DUMY  2-10 J0225620
                    *                                                   J0225630
                          LD    1 DBADR                                 J0225640
                          STO   1 #UHOL     DB ADDR LAST UA 1DUMY  2-10 J0225650
                    *                                                   J0225660
                    *************************************************** J0225670
                    *                                                 * J0225680
                    *   COMPLETE THE PROCESSING OF THE LET/FLET ENTRY * J0225690
                    *                                                 * J0225700
                    *************************************************** J0225710
                    LE680 STX  L3 DELSW+C   POINT TO 1DUMY ENTRY -1     J0225720
                    *                                                   J0225730
                          LD   L  BUF5+1    PICK UP CURRENT SECTOR ADDR J0225740
                          OR      LE918     INCL DRIVE CODE             J0225750
                          STO   1 STSW      SCTR ADDR & DRIVE CODE      J0225760
                    *                                                   J0225770
                    LE685 LD    3 3                                     J0225780
                          A     1 DBADR                                 J0225790
                          STO   1 DBADR     RECORD DB ADDR OF NEXT NTRY J0225800
                    *                                                   J0225810
                          LD    1 STSW                                  J0225820
                          BSC  L  LE690,Z   STORE TYPE OPERATION        J0225830
                    *                                                 * J0225840
                          STX  L3 DELSW+C   RECORD REL POSITION IN L/F  J0225850
                    *                                                   J0225860
                    *************************************************** J0225870
                    *************************************************** J0225880
                    *                                                 * J0225890
                    LE690 MDX     LE625     ENTRY COMPLETED-RETURN  212 J0225900
                    *                                                 * J0225910
                    *************************************************** J0225920
                    *************************************************** J0225930
                    *                                                 * J0225940
                          BSS     BUF5-*-/6000-1 PATCH ROOM             J0225950
                          DC      /FFFF     END OF DCTL PATCH AREA      J0225960
                    *                                                 * J0225970
                    *************************************************** J0225980
                    *************************************************** J0225990
                          END     READ                                  J0226000
