                          HDNG    DEXIT-    RESIDENT COMMA   2 AUG 67   J0900010
                          ABS                                           J0900020
                    $CIBA EQU     /5   ADDR OF CIB ON MASTER CARTRIDGE  J0900030
                    $CH12 EQU     /6   CHANNEL 12 INDR,NON-ZERO=CHAN 12 J0900040
                    $COMN EQU     /7   WORD COUNT OF COMMON             J0900050
                    $CORE EQU     /E   CORE SIZE,/1000=4K,/2000=8K,ETC) J0900060
                    $CTSW EQU     /F   MCR SW,NON-ZERO=// RECD TRAPPED  J0900070
                    $DADR EQU     /10  SCTR ADDR OF PROG TO BE FETCHED  J0900080
                    $DABL EQU     /11  IOCC FOR SCA RESET (ODD ADDR)    J0900090
                    $DREQ EQU     /12  INDR FOR REQUESTED V. DISK I/O   J0900100
                    $IBSY EQU     /13  PRINC I/O BUSY INDR,NON-ZERO=BSY J0900110
                    $HASH EQU     /14  WORK AREA FOR MONITOR PROGRAMS   J0900120
                    $PRET EQU     /28  ADDR PREOPERATIVE ERROR TRAP     J0900130
                    $IREQ EQU     /2C  ADDR OF INT REQUEST SUBROUTINE   J0900140
                    $ULET EQU     /2D  ADDR OF LET, LOGICAL DRIVE 0     J0900150
                    $IOCT EQU     /32  IOCS CTR,0=NO I/O IN PROGRESS    J0900160
                    $LAST EQU     /33  LAST CD INDR,NON-ZERO=LAST CARD  J0900170
                    $NDUP EQU     /34  INHIBIT DUP SW,NON-ZERO=NO DUP   J0900180
                    $NXEQ EQU     /35  INHIBIT EXEC SW,NON-ZERO=NO EXEQ J0900190
                    $PBSY EQU     /36  PRINC PTR BUSY INDR,NON-ZERO=BSY J0900200
                    $PGCT EQU     /37  PAGE NO. FOR PAGE HEADINGS       J0900210
                    $EXIT EQU     /38  ADDR CALL EXIT ENTRY POINT       J0900220
                    $LINK EQU     /39  ADDR CALL LINK ENTRY POINT       J0900230
                    $DUMP EQU     /3F  ADDR OF CALL DUMP, ENTRY POINT   J0900240
                    $DCDE EQU     /77  DRIVE CODE FOR CORE LOAD BLDR    J0900250
                    $PHSE EQU     /78  NO. OF PHASE CURRENTLY IN CORE   J0900260
                    $UFIO EQU     /79  ARM POSITION IN UNFORMATTED AREA J0900270
                    $WSDR EQU     /7A  WORKING STORAGE DRIVE CODE       J0900280
                    $WRD1 EQU     /7B  LOAD ADDR FOR CURR USER CORE LD  J0900290
                    $KCSW EQU     /7C  INHIBIT INPUT/PRINT OVERLAP SW   J0900300
                    $UFDR EQU     /7D  UNFORMATTED I/O DRIVE CODE       J0900310
                    $CPTR EQU     /7E  CHANNEL 12 INDICATOR FOR CP      J0900320
                    $1132 EQU     /7F  CHANNEL 12 INDICATOR FOR 1132    J0900330
                    $1403 EQU     /80  CHANNEL 12 INDICATOR FOR 1403    J0900340
                    $PST1 EQU     /81  ADDR POSTOP ERROR TRAP,LEVEL 1   J0900350
                    $PST2 EQU     /85  ADDR POSTOP ERROR TRAP,LEVEL 2   J0900360
                    $PST3 EQU     /89  ADDR POSTOP ERROR TRAP,LEVEL 3   J0900370
                    $PST4 EQU     /8D  ADDR POSTOP ERROR TRAP,LEVEL 4   J0900380
                    $STOP EQU     /91  ADDR PROGRAM STOP KEY TRAP       J0900390
                    $FPAD EQU     /95  FILE PROTECT ADDR (ADJ),LOG DR 0 J0900400
                    $CYLN EQU     /9A  ARM POSITION FOR LOGICAL DRIVE 0 J0900410
                    $ACDE EQU     /9F  AREA CODE FOR LOGICAL DRIVE 0    J0900420
                    $DCYL EQU     /A4  1ST DEF CYL ADDR, LOGICAL DR 0   J0900430
                    $I200 EQU     /B3  ENTRY POINT TO ILS FOR LEVEL 2   J0900440
                    $I205 EQU     /B8                                   J0900450
                    $IBT2 EQU     $I205+1 ADDR OF IBT FOR LEVEL 2       J0900460
                    $I400 EQU     /C4  ENTRY POINT TO ILS FOR LEVEL 4   J0900470
                    $I405 EQU     /D3                                   J0900480
                    $IBT4 EQU     $I405+1 ADDR OF IBT FOR LEVEL 4       J0900490
                    $I410 EQU     /D5                                   J0900500
                    $DBSY EQU     /EE  DISK BUSY INDR,NON-ZERO=DK BUSY  J0900510
                    $BYSW EQU     /1CB BYPASS SW,NOP IF FETCHING SOCAL  J0900520
                    DZ000 EQU     /0F2 DISKZ ENTRY POINT                J0900530
                    $ZEND EQU     /1E0 ADDR 1+LAST WORD OF DISKZ        J0900540
                          HDNG          CONCATENATED COMMON AREA(CATCO) J0900550
                    C     EQU     /7FA0     CATCO POINTER SET TO MIDDLE J0900560
                    *************************************************** J0900570
                    *                                                 * J0900580
                    *  INDEX REG 1 IS SET TO .C. WHEN CATCO IS FORMED * J0900590
                    *  FOR USE BY ALL OF DUP FUNCTIONS. ANY DUP ROUT  * J0900600
                    *  USING XR 1 FOR OTHER REASONS MUST RESTORE.     * J0900610
                    *  ALL VALUES IN CATCO HAVE LABELS EQUATED TO THE * J0900620
                    *  VALUE THAT INDICATES THEIR RELATIVE LOCATION   * J0900630
                    *  FROM .C.                                       * J0900640
                    *                                                 * J0900650
                    *************************************************** J0900660
                    *                                                 * J0900670
                    *             CATCO DCOM IMAGE                    * J0900680
                    *   EQUIVALENCES USED TO REFERENCE CATCO WITH XR1 * J0900690
                    *                                                 * J0900700
                    *************************************************** J0900710
                    #NAME EQU     4-/80     NAME OF PROGRAM             J0900720
                    #DBCT EQU     6-/80     DISK BLOCK COUNT OF PROGRAM J0900730
                    #FCNT EQU     7-/80     FILES SW,ZERO = NO FILES    J0900740
                    #SYSC EQU     8-/80     NON-ZERO,SYSTEM CARTRIDGE   J0900750
                    #JBSW EQU     9-/80     JOB SW,NON-ZERO='T' MODE    J0900760
                    #CBSW EQU     10-/80    CLB SW,NON-ZERO=STORECI     J0900770
                    #LCNT EQU     11-/80    NO. OF LOCALS               J0900780
                    #MPSW EQU     12-/80    NON-ZERO, CORE MAP DESIRED  J0900790
                    #MDF1 EQU     13-/80    NO. OF DUP CTRL RCDS        J0900800
                    #MDF2 EQU     14-/80    ADDR OF MODIF BUFFER        J0900810
                    #NCNT EQU     15-/80    NO. OF NOCALS               J0900820
                    #ENTY EQU     16-/80    RELATIVE ENTRY ADDR OF PROG J0900830
                    #RP67 EQU     17-/80    IF NON-ZERO,1442 MOD 6,7    J0900840
                    *                                                   J0900850
                    *   NEGATIVE VALUE REPRESENTS DEFAULT CONDITION   * J0900860
                    #TODR EQU     18-/80    DR CODE OF 'TO' DRIVE       J0900870
                    #FRDR EQU     19-/80    DR CODE OF 'FROM' DRIVE     J0900880
                    *                                                 * J0900890
                    #FHOL EQU     20-/80    ADDR OF LARGEST FXA HOLE    J0900900
                    #FSZE EQU     21-/80    BLK CNT LARGEST HOLE IN FXA J0900910
                    #UHOL EQU     22-/80    ADDR OF LARGEST UA HOLE     J0900920
                    #USZE EQU     23-/80    BLK CNT LARGEST HOLE IN UA  J0900930
                    #DCSW EQU     24-/80    NON-ZERO=DUP CALL           J0900940
                    #PIOD EQU     25-/80    PRINC. I/O INDICATOR        J0900950
                    #PPTR EQU     26-/80    PRINC. PRINTER INDICATOR    J0900960
                    #CIAD EQU     27-/80    WD NO. SCTR 0,CIL ADDR      J0900970
                    #ACIN EQU     28-/80    AVAILABLE CARTRIDGE INDR2-8 J0900980
                    #GRPH EQU     29-/80    2250 INDICATOR          2-8 J0900990
                    #GCNT EQU     30-/80    NO. G2250 RECORDS       2-8 J0901000
                    #LOSW EQU     31-/80    LOCAL-CALLS-LOCAL INDR  2-8 J0901010
                    #X3SW EQU     32-/80    SPECIAL ILS SWITCH      2-8 J0901020
                    #ECNT EQU     33-/80    NO. OF EQUAT RCDS       2-8 J0901030
                    #ANDU EQU     35-/80    END OF UA (ADJ) LOG DR 0-4  J0901040
                    #BNDU EQU     40-/80    END OF UA (BASE) LOG DR 0-4 J0901050
                    #FPAD EQU     45-/80    FILE PROTECT ADDR (BASE)    J0901060
                    #PCID EQU     50-/80    CART ID, PHYS DR 0-4        J0901070
                    #CIDN EQU     55-/80    CART ID, LOG DR 0-4         J0901080
                    #CIBA EQU     60-/80    CIB ADDR, LOG DR 0-4        J0901090
                    #SCRA EQU     65-/80    SCRA, LOG DR 0-4            J0901100
                    #FMAT EQU     70-/80    WS FORMAT, LOG DR 0-4       J0901110
                    #FLET EQU     75-/80    FLET ADDR, LOG DR 0-4       J0901120
                    #ULET EQU     80-/80    LET ADDR, LOG DR 0-4        J0901130
                    #WSCT EQU     85-/80    WS BLK CNT, LOG DR 0-4      J0901140
                    #CSHN EQU     90-/80    CUSHION END SCTR ADDR, 0-4  J0901150
                    #DCOM EQU     1         SCTR ADDR OF DCOM           J0901160
                    #HDNG EQU     7         SCTR WITH PAGE HEADING      J0901170
                    @SBFR EQU     /FB0                              2-8 J0901180
                          HDNG    CONCATENATED COMMON AREA (CATCO)      J0901190
                    *************************************************** J0901200
                    *                                                 * J0901210
                    *             CATCO IOAR HDRS FOR DUP PHASES        J0901220
                    *                                                 * J0901230
                    *************************************************** J0901240
                          ORG     -/10                                  J0901250
                    DCHDR BSS     2         DUP CONTROL            PH02 J0901260
                    STHDR BSS     2         STORE                  PH03 J0901270
                    FLHDR BSS     2         FILEQ                  PH04 J0901280
                    DMHDR BSS     2         DUMP                   PH05 J0901290
                    DLHDR BSS     2         DUMPLET                PH06 J0901300
                    DTHDR BSS     2         DELETE                 PH07 J0901310
                    DFHDR BSS     2         DEFINE                 PH08 J0901320
                    DXHDR BSS     2         DUP EXIT               PH09 J0901330
                    UCHDR BSS     2         DUP UPCOR              PH13 J0901340
                    PIHDR BSS     2         PRINCIPAL I/O BLOCK    PH14 J0901350
                    SIHDR BSS     2         PRINC I/O (W/O KB) BLK PH15 J0901360
                    PTHDR BSS     2         PAPER TAPE I/O BLOCK   PH16 J0901370
                    CIHDR BSS     2         CI PHASE READ BY CL BUILDER J0901380
                    MUHDR BSS     2         MACRO UPDATE      PH206 2-8 J0901390
                    D2HDR BSS     2         DUP CONTROL 2     PH205 2-8 J0901400
                          HDNG    DEXIT-    CATCO DUP SWITCHES          J0901410
                    *************************************************** J0901420
                    *                                                   J0901430
                    *             CATCO DUP SWITCHES                  * J0901440
                    *      WORDS USED FOR COMMUNICATION OF DATA         J0901450
                    *   BETWEEN DUP ROUTINES.                           J0901460
                    *                                                 * J0901470
                    *      INITIALIZED TO ZERO BY  .REST. OF DUPCO    * J0901480
                    *                                                   J0901490
                    *************************************************** J0901500
                    CL1   EQU     *                                     J0901510
                    ASMSW BSS     1         NON ZERO IF DEFINE VOID ASM J0901520
                    BITSW BSS     1         NON ZERO TO ALLOW MDUMP-S   J0901530
                    BLKSW BSS     1         NON ZERO IF BYPASSING REC   J0901540
                    CIERR BSS     1         ERROR NO DETECTED BY PH 17  J0901550
                    CISW  BSS     1         NON ZERO IF STORE CI        J0901560
                    CLBSW BSS     1         NON ZERO IF PRECI EXECUTED  J0901570
                    CNTNO BSS     1         RECORD NO BEING PCHD OR RD  J0901580
                    *                                                 * J0901590
                    *   .DATSW. IS FILLED WITH THE CNT FIELD OF THE   * J0901600
                    *   DUP CONTROL RECORD.                           * J0901610
                    *   USED PRIMARILY FOR DATA MOVEMENT, BUT ALSO IS * J0901620
                    *   USED FOR COUNT OF RECORDS TO READ AFTER A     * J0901630
                    *   STORE CI DUP CONTROL RECORD.                  * J0901640
                    DATSW BSS     1         RECORDS VALUE IN CNT FIELD  J0901650
                    DBADR BSS     1         DB ADDR OF REFERENCED PROG  J0901660
                    DELSW BSS     1         ADDR OF REQ LET ENTRY - 1   J0901670
                    DFNSW BSS     1         NON ZERO IF DEFINE FXA      J0901680
                    DKSAD BSS     1         DK SCTR ADDR W/O DR CODE    J0901690
                    DUMPP BSS  E  2         LAST LIMITS FOR PRNTR DUMP  J0901700
                    FORSW BSS     1         NON ZERO IF DEFINE VOID FOR J0901710
                    FRWS  BSS     1         NON ZERO IF FROM FLD IS WS  J0901720
                    FXSW  BSS     1         NON ZERO IF FIXED AREA REQD J0901730
                    HOLSW BSS     1         NON ZERO IF NO CONV REQD    J0901740
                    IOSW  BSS     1         NON ZERO IF IN/OUT REQD     J0901750
                    *                                                 * J0901760
                    *   DUMPLET SWITCH - ZERO IF NOT DUMPLET/DUMPFLET * J0901770
                    *       PLUS VALUE REQUIRES PRINT OF BOTH LET/FLET* J0901780
                    *       NEG. VALUE REQUIRES PRINT OF FLET ONLY    * J0901790
                    LETSW BSS     1         NON ZERO,PRINT LET OR FLET* J0901800
                    LSTLF BSS     1         LAST LET/FLET SECT PROCESSD J0901810
                    MODSW BSS     1         NON ZERO IF STORE MOD FUNC  J0901820
                    NAMSW BSS     1         NON ZERO IF NAME IN LET/F   J0901830
                    NEGSW BSS     1         NON ZERO IF SHRINKING FXA   J0901840
                    PGMHL BSS     1         WORD COUNT OF THE PROG HDR  J0901850
                    PRSW  BSS     1         NON ZERO IF PRINTING OUTPUT J0901860
                    PTSW  BSS     1         NON ZERO IF PAPER TAPE REQD J0901870
                    SKWDS BSS     1         WDS TO SEARCH IN L/F SECT   J0901880
                    STCSW BSS     1         NON ZERO IF STORE DATA CI   J0901890
                    STSW  BSS     1         NON ZERO IF STORE TYPE      J0901900
                    TEMP1 BSS  E  1         1ST WD OF BINEB OUTPUT      J0901910
                    TEMP2 BSS     1         2ND WD OF BINEB OUTPUT      J0901920
                    TOWS  BSS     1         NON ZERO IF TO FIELD IS WS  J0901930
                    T3MSW BSS     1         TYPE 3,4 SOCAL LEVEL CELL   J0901940
                    UASW  BSS     1         NON ZERO IF USER AREA REQD  J0901950
                    WSSW  BSS     1         NON ZERO IF WORK STG REQD   J0901960
                    XEQSW BSS     1         NON ZERO IF NOT RET FR GET  J0901970
                    EBCSW BSS     1         NON ZERO IF EBC DATA OP 2E2 J0901980
                    HDNSW BSS     1         NON ZERO IF NAME IN HDR 2-8 J0901990
                    RPGSW BSS     1         POSITIVE=DEFINE VOID RPG2-9 J0902000
                    *                       *NEG=DEFINE VOID COBOL  2-9 J0902001
                    DFLSW BSS     1         NON ZERO IF *DFILE      2-8 J0902010
                          BSS     1         RESERVED FOR ADDITION   2-8 J0902020
                    CL2   EQU     *-1                                   J0902030
                          HDNG    DEXIT-    CATCO DUP SWITCHES          J0902040
                    *************************************************** J0902050
                    *                                                 * J0902060
                    *             CATCO DUP SWITCHES                  * J0902070
                    *  INITIALIZED BY DCTL AND NOT RESET BY .REST.    * J0902080
                    *                                                 * J0902090
                    *************************************************** J0902100
                    IOREQ BSS     1         MON-ZERO,AUX I/O SET REQ    J0902110
                    PH2   BSS     1         NON-ZERO IF DCTL IN CORE    J0902120
                    PH3   BSS     1         NON-ZERO IF STORE IN CORE   J0902130
                    PH4   BSS     1         NON-ZERO IF DUMP IN CORE    J0902140
                    ************************************************2-8 J0902150
                    *                                               2-8 J0902160
                    *             CATCO SWITCH INITIALIZED TO ZERO  2-8 J0902170
                    *   BY CCAT SUBR AND SET BY MACRO UPDATE PROGRAM2-8 J0902180
                    *                                               2-8 J0902190
                    ************************************************2-8 J0902200
                    DUPCR BSS     1         NON ZERO IF DUP CTRL RCD2-8 J0902210
                    *************************************************** J0902220
                    *                                                 * J0902230
                    *             CATCO DUP SWITCHES SET BY CCAT SUBR * J0902240
                    *                                                 * J0902250
                    *************************************************** J0902260
                    ADDR2 BSS     1         KB INTERRUPT ADDRESS        J0902270
                    KBREQ BSS     1         CONTENTS OF LOC 13          J0902280
                    *      THE FOLLOWING SWITCH IS SET TO INDICATE THE  J0902290
                    *       PRINCIPAL INPUT DEVICE                      J0902300
                    *             -  IS PAPER TAPE                      J0902310
                    *             0  IS CARD                            J0902320
                    *             +  IS KEYBOARD                        J0902330
                    INOUT BSS     1         PRINCIPAL INPUT SWITCH      J0902340
                    *                                                   J0902350
                    PTPON BSS     1         NON-ZERO IF PAPER TP ON SYS J0902360
                    *************************************************** J0902370
                    *                                                 * J0902380
                    *             LEVEL 4 INTERRUPT BRANCH TABLE      * J0902390
                    *             ADDRESSES. INITIALIZED BY CCAT,     * J0902400
                    *             AND CARD/PAPER TAPE INTERFACES.     * J0902410
                    *                                                 * J0902420
                    *************************************************** J0902430
                          ORG     /0049                                 J0902440
                    IBT   BSS     9         9 WD INTRPT BRANCH TABLE    J0902450
                    *************************************************** J0902460
                    *                                                 * J0902470
                    *             CATCO I/O ADDRESSES REQUIRED BY DUP * J0902480
                    *                                                 * J0902490
                    *************************************************** J0902500
                    P1442 BSS  E  2         SYS 1442 IOAR HEADER        J0902510
                    PRPAR BSS     2         DEFAULT LIMITS TO PRINT     J0902520
                    PHDUP BSS     1         LAST DUP PHASE IN CORE      J0902530
                    CRBUF BSS     1         81 WD BFR FOR DUP CTRL RCDS J0902540
                    DCADR BSS     1         ADDR FOR DUP CTRL IOAR HDR  J0902550
                    HDBUF BSS     1         ADDR OF PAGE HEADING BFR    J0902560
                    IOBLK BSS     1         ADDR OF DUP I/O PHASE       J0902570
                    SDBUF BSS     1         STORE/DUMP BUFFER           J0902580
                    LETAR BSS     1         ADDR OF LET SEARCH BUFFER   J0902590
                    PEBUF BSS     1         41 WD BFR FOR PACKED EBCDIC J0902600
                    THIS  BSS     1         ADDR OF DOUBLE BFR, BFR 1   J0902610
                    NEXT  BSS     1         ADDR OF DOUBLE BFR, BFR 2   J0902620
                          HDNG              DUP CORE PARAMETERS         J0902630
                    DISKZ EQU     DZ000     DISKZ ENTRY POINT           J0902640
                    B     EQU     $ZEND-2                               J0902650
                    DMPLC EQU     B         IOAR CORE ADDR FOR DMPLT    J0902660
                    EXITC EQU     B         IOAR CORE ADDR FOR DEXIT    J0902670
                    MUPC  EQU     B         IOAR CORE ADDR FOR MUP  2-8 J0902680
                    DCTL  EQU     B+/1002   ENTRY ADDRESS OF DCTL       J0902690
                    DCTLC EQU     B+/1000   IOAR CORE ADDR FOR DCTL     J0902700
                    WSDC  EQU     B+/2000   IOAR CORE ADDR FOR STORE    J0902710
                    DUMPC EQU     B+/4000   IOAR CORE ADDR FOR DDUMP    J0902720
                    DUPCO EQU     /7DB0     ADDR OF RESIDENT DUPCO      J0902730
                    CATCO EQU     /7F20-2   ADDR OF DCOM IOAR HEADER    J0902740
                    *                                                 * J0902750
                    *  DUPCO ENTRY POINTS...USED WITH INDIRECT BSI    * J0902760
                    *                                                 * J0902770
                          ORG     DUPCO                                 J0902780
                    BINEB BSS     1         CONVERSION BINARY TO EBCDIC J0902790
                    WRTDC BSS     1         WRITE DCOM(S) SUBROUTINE    J0902800
                    ENTER BSS     1         SAVE XR-S AND CONDITIONS    J0902810
                    GET   BSS     1         READ FROM DISK USING DISKZ  J0902820
                    LEAVE BSS     1         HANDLES ALL EXITS FROM DUP  J0902830
                    LINE  BSS     1         SPACES PRINTER 1 LINE       J0902840
                    MASK  BSS     1         INHIBITS KB INT REQUEST     J0902850
                    MDUMP BSS     1         PRINTS SELECTED CORE LOC-S  J0902860
                    PAGE  BSS     1         SKIPS TO NEXT PAGE          J0902870
                    PHID  BSS     1         RECORDS PHASE ID            J0902880
                    PHIDM BSS     1         RECORDS PHASE AND MODIFIER  J0902890
                    PRINT BSS     1         USE SYS PR SUBR TO PRINT    J0902900
                    PUT   BSS     1         WRITES TO DISK USING DISKZ  J0902910
                    REST  BSS     1         RESTORE CATCO,GO TO DCTL    J0902920
                    RTURN BSS     1         RESTORE XR-S AND CONDITIONS J0902930
                    *                                                 * J0902940
                    *  INPUT/OUTPUT PARAMETERS , CORE ADDRESSES       * J0902950
                    *                                                 * J0902960
                    BUF6  EQU     DUPCO-/1F ADDR OF PAGE HEADING BUFFER J0902970
                    PRPNT EQU     BUF6-/141 IOAR ADDR FOR PRINC. PTR    J0902980
                    IOADR EQU     BUF6-/38B START OF I/O INTERFACE      J0902990
                    GETHO EQU     IOADR+4   ENTRY FOR READING HOLL TYPE J0903000
                    GETBI EQU     IOADR+5   ENTRY FOR READING BINARY    J0903010
                    PACKB EQU     IOADR+6   ENTRY TO PACK BINARY        J0903020
                    PCHBI EQU     IOADR+7   ENTRY TO PUNCH BINARY       J0903030
                    BUF1  EQU     IOADR-/51 ADDR OF NEXT BUFFER         J0903040
                    BUF2  EQU     BUF1-/52  ADDR OF THIS BUFFER         J0903050
                    BUF3  EQU     BUF2-/3E  ADDR OF PACKED EBC BUFFER   J0903060
                    BUF4  EQU     BUF3-/52  ADDR OF CONTROL RCD BUFFER  J0903070
                    BUF5  EQU     IOADR-/284   ADDR OF LET SCTR BFR     J0903080
                    BUF7  EQU     BUF5-/7142   ADDR OF STORE/DUMP BFR   J0903090
                          HDNG    EXIT-MAINLINE                         J0903100
                    *************************************************** J0903110
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * J0903120
                    *                                                 * J0903130
                    *FUNCTION/OPERATION-                              * J0903140
                    *   *    EX000 IS ONE OF THE OVERLAYS IN THE DISK * J0903150
                    *    UTILITY PROGRAM (DUP). THIS MODULE PERFORMS  * J0903160
                    *    THE FUNCTIONS NECESSARY TO GIVE CONTROL TO   * J0903170
                    *    SOME OTHER PART OF THE SYSTEM. THERE ARE     * J0903180
                    *    5 WAYS TO EXIT FROM DUP. IN ADDITION TO THE  * J0903190
                    *    EXITING FUNCTIONS PERFORMED BY EX000, IT ALSO* J0903200
                    *    PRINTS MOST OF THE ERROR MESSAGES FOR DUP.   * J0903210
                    *    ON ENTRY TO EX000 INDEX REGISTER 2 CONTAINS  * J0903220
                    *    THE ADDRESS OF A CODE THAT CONTROLS THE      * J0903230
                    *    FUNCTION TO BE PERFORMED. THE NUMBER 0 MEANS * J0903240
                    *    A NORMAL EXIT. THE NUMBER -2 MEANS THAT      * J0903250
                    *    THE INTERRUPT REQUEST KEY WAS PRESSED WHEN   * J0903260
                    *    DUP WAS IN MASK MODE. THE NUMBER -3 MEANS    * J0903270
                    *    THAT STORE WANTS CONTROL PASSED TO THE CORE  * J0903280
                    *    LOAD BUILDER. THE NUMBER -4 MEANS CONTROL    * J0903290
                    *    SHOULD BE PASSED TO SUP TO EXECUTE ADRWS.    * J0903300
                    *    ANY NUMBER THAT IS POSITIVE IS THE NUMBER    * J0903310
                    *    OF AN ERROR MESSAGE THAT IS TO BE PRINTED.   * J0903320
                    *                                                 * J0903330
                    *    A NORMAL EXIT IS WHEN DUP ENCOUNTERS A       * J0903340
                    *    DOUBLE SLASH RECORD (MONITOR CONTROL RECORD).* J0903350
                    *    THE DISK COMMUNICATION AREA IS WRITTEN ONTO  * J0903360
                    *    THE MASTER CARTRIDGE.                        * J0903370
                    *    THE TRAPPED CONTROL RECORD IS MOVED TO THE   * J0903380
                    *    SUPERVISOR BUFFER. A CHECK IS MADE TO SEE IF * J0903390
                    *    THE MODIFICATION PROGRAM IS USING DUP AND IF * J0903400
                    *    NOT RETURNS TO SUP. IF THE MODIFICATION      * J0903410
                    *    PROGRAM WAS USING DUP THEN CONTROL IS RETURED* J0903420
                    *    TO IT.                                       * J0903430
                    *                                                 * J0903440
                    *    THE INTERRUPT REQUEST FUNCTION WRITES DCOM   * J0903450
                    *    (DISK COMMUNICATION AREA) ON THE MASTER CART * J0903460
                    *    AND EXITS TO THE SYSTEM DUMP PROGRAM WITH    * J0903470
                    *    A CODE OF -2. SUP WILL THEN READ RECORDS     * J0903480
                    *    FROM THE INPUT STREAM UNTIL THE NEXT JOB     * J0903490
                    *    CONTROL RECORD IS DETECTED.                  * J0903500
                    *                                                 * J0903510
                    *    THE STORE CORE IMAGE FUNCTION WRITES DCOM    * J0903520
                    *    ON THE MASTER DRIVE AFTER WHICH IT SETS UP   * J0903530
                    *    THE INDICATORS REQUIRED BY THE CORE LOAD     * J0903540
                    *    BUILDER. SOME OF CORE IS SAVED ON THE DISK   * J0903550
                    *    TO ALLOW DUP TO CONTINUE WHEN IT AGAIN GETS  * J0903560
                    *    CONTROL. EX000 MOVES A SMALL PROGRAM TO THE  * J0903570
                    *    1132 SCAN AREA THAT READS IN PHASE 0/1 OF    * J0903580
                    *    THE CORE LOAD BUILDER.                       * J0903590
                    *                                                 * J0903600
                    *    THE LINK TO ADRWS FUNCTION WRITES DCOM ON THE* J0903610
                    *    MASTER DRIVE AND SAVES SOME OF CORE BEFORE   * J0903620
                    *    DOING A CALL LINK FOR ADRWS.                 * J0903630
                    *                                                 * J0903640
                    *    THE ERROR MESSAGE FUNCTION WRITES DCOM ON THE* J0903650
                    *    MASTER DRIVE AND SEARCHES THE ERROR MESSAGE  * J0903660
                    *    TABLE. THE MESSAGE IS PRINTED AND CONTROL    * J0903670
                    *    IS PASSED TO REST IN DUPCO.                  * J0903680
                    *                                                 * J0903690
                    *ENTRY POINTS-                                    * J0903700
                    *   *EX000-THIS IS THE ONLY ENTRY POINT, AND IT   * J0903710
                    *    PERFORMS THE ABOVE FUNCTIONS.                * J0903720
                    *                                                 * J0903730
                    *INPUT-                                           * J0903740
                    *   *N/A                                          * J0903750
                    *                                                 * J0903760
                    *OUTPUT-                                          * J0903770
                    *   *DCOM IS WRITTEN ON THE MASTER DRIVE, AND     * J0903780
                    *    ERROR MESSAGES ARE PRINTED.                  * J0903790
                    *                                                 * J0903800
                    *EXTERNAL REFERENCES-                             * J0903810
                    *   *$CTSW-THIS WORD IS SET TO -1 TO INDICATE THAT* J0903820
                    *    A VALID DOUBLE SLASH TRAP HAS OCCURED.       * J0903830
                    *                                                 * J0903840
                    *   *$EXIT-THIS IS THE EXITING RETURN TO THE      * J0903850
                    *    SUPERVISOR.                                  * J0903860
                    *                                                 * J0903870
                    *   *$DUMP-ENTRY POINT TO THE SKELETON SUPERVISOR * J0903880
                    *    TO CAUSE THE CURRENT JOB TO BE TERMINATED.   * J0903890
                    *                                                 * J0903900
                    *   *UCHDR-THIS TWO WORD AREA CONTAINS THE IOAR   * J0903910
                    *    NEEDED TO SAVE UP CORE FOR DUP.              * J0903920
                    *   *IOADR-THIS IS WHERE THE CONTENTS OF UCHDR    * J0903930
                    *    ARE PLACED TO SAVE UPCORE.                   * J0903940
                    *                                                 * J0903950
                    *   *$WSDR-THIS WORD CONTAINS THE LOGICAL NUMBER  * J0903960
                    *    OF SYSTEM WORKING STORAGE.                   * J0903970
                    *                                                 * J0903980
                    *   *$FPAD-THIS GROUP OF WORDS CONTAIN THE ADDRESS* J0903990
                    *    OF WORKING STORAGE ON THE DRIVES.            * J0904000
                    *                                                 * J0904010
                    *   *$DADR-THIS WORD CONTAINS THE DB ADDRESS OF   * J0904020
                    *    THE PROGRAM FOR THE CORE LOAD BUILDER.       * J0904030
                    *                                                 * J0904040
                    *   *$DCDE-THIS WORD CONTAINS THE DRIVE CODE THAT * J0904050
                    *    THE PROGRAM IS ON FOR THE CORE LOAD BUILDER. * J0904060
                    *                                                 * J0904070
                    *   *DZ000-THIS IS THE ENTRY POINT TO THE DISK    * J0904080
                    *    ROUTINE.                                     * J0904090
                    *                                                 * J0904100
                    *   *$DBSY-THIS IS THE DISK BUSY INDICATOR        * J0904110
                    *                                                 * J0904120
                    *   *#CBSW-THIS WORD INDICATES THAT THE CORE      * J0904130
                    *    LOAD BUILDER SHOUL RETURN TO DUP.            * J0904140
                    *                                                 * J0904150
                    *   *$LINK-THIS IS THE CALL LINK ENTRY POINT TO   * J0904160
                    *    THE SUPERVISOR.                              * J0904170
                    *                                                 * J0904180
                    *   *$IREQ-THIS WORD CONTAINS THE ADDRESS TO WHERE* J0904190
                    *    THE INTERRUPT REQUEST KEY GOES.              * J0904200
                    *                                                 * J0904210
                    *   *#MDF2-THIS WORD IS AN INDICATOR TO TELL IF   * J0904220
                    *    THE MODIFICATION PROGRAM WANTS CONTROL AFTER * J0904230
                    *    DUP.                                         * J0904240
                    *                                                 * J0904250
                    *EXITS-                                           * J0904260
                    *   *NORMAL-THERE ARE 6 EXITS FROM EX000 EXPLAINED* J0904270
                    *    UNDER FUNCTION.                              * J0904280
                    *                                                 * J0904290
                    *   *ERROR-N/A                                    * J0904300
                    *                                                 * J0904310
                    *TABLES/WORK AREAS-                               * J0904320
                    *   *EX110-THIS IS THE SLET ENTRY FOR THE CORE    * J0904330
                    *    LOAD BUILDER.                                * J0904340
                    *                                                 * J0904350
                    *   *EX120-THIS IS THE SLET ENTRY FOR THE MODIF   * J0904360
                    *    PROGRAM.                                     * J0904370
                    *                                                 * J0904380
                    *   *EX800-THIS IS THE ERROR MESSAGE TABLE.       * J0904390
                    *                                                 * J0904400
                    *ATTRIBUTES-                                      * J0904410
                    *   SERIALLY REUSEABLE                            * J0904420
                    *                                                 * J0904430
                    *NOTES-N/A                                        * J0904440
                    *************************************************** J0904450
                          HDNG    EXIT-MAINLINE                         J0904460
                    *                                                   J0904470
                    *   SYSTEM LOADER INFORMATION USED TO LOAD THE      J0904480
                    *   EXIT PHASE OF DUP                               J0904490
                    *                                                   J0904500
                          ORG     EXITC                                 J0904510
                          DC      *-*       FOR SYSTEM LOADER           J0904520
                          DC      -9        PHASE ID NUMBER FOR SLET    J0904530
                          DC      EX110-*+1 ADDRESS OF SET TABLE        J0904540
                          DC      2         NO OF SLET ENTRIES          J0904550
                          ORG     *-2                                   J0904560
                    *                                                   J0904570
                    *   INDICATE THE PHASE OF THE SYSTEM THAT HAS       J0904580
                    *   CONTROL OF THE MACHINE                          J0904590
                    *                                                   J0904600
                    EX000 BSI  I  PHID      PLACE PHASE ID NUMBER       J0904610
                          DC      /0009     PHASE ID OF DUP EXIT        J0904620
                    *                                                   J0904630
                    *   DETECT THE TYPE OF FUNCTION TO BE PREFORMED     J0904640
                    *                                                   J0904650
                          MDX   2 0         TEST FUNCTION FOR 0         J0904660
                          MDX     *+1       BRANCH IF NOT               J0904670
                          MDX     EX020     BRANCH IF ZERO              J0904680
                          MDX   2 4         TEST FOR NEGATIVE FUNCTION  J0904690
                          MDX     EX130     BRANCH IF POSITIVE          J0904700
                    *                                                   J0904710
                          MDX   2 -4        RESTORE VALUE OF ENTRY CODE J0904720
                          NOP               MIGHT SKIP                  J0904730
                          BSC  I2 EX010     BRANCH TO FUNCTION          J0904740
                          DC      EX100     ADDRESS OF -4 FUNCTION      J0904750
                          DC      EX070     ADDRESS OF -3 FUNCTION      J0904760
                          DC      EX050     ADDRESS OF -2 FUNCTION      J0904770
                          DC      EX022     ADDR OF -1 FUNCTION     2-8 J0904780
                    EX010 EQU     *                                     J0904790
                          HDNG    EXIT-EX020 (NORMAL EXIT)              J0904800
                    *                                                   J0904850
                    *   MOVE CARD TO BE INTERPRETED BY THE SUPERVISOR   J0904860
                    *                                                   J0904870
                    EX020 LDX   3 -1                               2-10 J0904880
                          STX  L3 $CTSW     SET CARD TRAP SWITCH        J0904890
                          MDX     EX024     BRANCH TO MOVE RECORD   2-8 J0904900
                    *                                               2-8 J0904910
                    * EXIT-EX022 // RCD DETECTED BY FILEQ           2-8 J0904920
                    *                                               2-8 J0904930
                    *                                              2-10 J0904940
                    EX022 STX  L  $CTSW     SET SW FOR SUPERVISOR  2-10 J0904950
                          STX  L  $NXEQ     SET NON-XEQ SW          2-8 J0904960
                          STX  L  $NDUP     SET NON-DUP SW          2-8 J0904970
                    *                                               2-8 J0904980
                    EX024 LD   I1 ADDR2     LOAD INT INDICATOR     2-11 J0904985
                          STO     EX905     STORE TEMPORARILY      2-11 J0904990
                          LDX  I3 CRBUF+C   POINT AT DUP BUFFER         J0904995
                          LDX  L2 @SBFR-1   POINT AT SUP BUFFER     2-8 J0905000
                          LDX   1 81        WORD COUNT TO MOVE          J0905010
                    EX030 LD    3 0                                     J0905020
                          STO   2 0         MOVE 1 WORD OF CARD         J0905030
                          MDX   3 1         INCREMENT DUP POINTER       J0905040
                          NOP                                           J0905050
                          MDX   2 1         INCREMENT SUP POINTER       J0905060
                          NOP                                           J0905070
                          MDX   1 -1        DECREMENT WORD COUNT        J0905080
                          MDX     EX030     BRANCH IF NOT ZERO          J0905090
                          LDX  L1 C         XR1 IS CATCO MIDPOINT  2-10 J0905094
                          BSI  L  EX180     WRITE DCOM ON MASTER   2-10 J0905095
                    *                                                   J0905100
                    *   CHECK TO SEE IF MODIF CALL TO DUP               J0905110
                    *                                                   J0905120
                          BSI  L  EX190     LINK TO CHECK MODIF CALL    J0905130
                          LDX   0 $EXIT     RETURN TO SUPERVISOR        J0905140
                    *                                                   J0905150
                    *   CONSTANTS AND WORKING AREA                      J0905160
                    *                                                   J0905170
                    EX905 DC      *-*       TEMP SAVE WORD         2-11 J0905175
                    EX930 DC      2         CONSTANT                    J0905200
                    EX940 DC      /100      INCR FOR #MDF1 ERROR COUNT  J0905210
                    EX950 DC      33        COMPARE FOR EXIT CODE = 33  J0905220
                    EX960 DC      59        (92-33) FOR EXIT CODE = 92  J0905230
                          HDNG    EXIT-EX050 (KEYBOARD REQUEST)         J0905240
                    *                                                   J0905250
                    *   WRITE DCOM ON MASTER CARTRIDGE                  J0905260
                    *                                                   J0905270
                    EX050 BSI  L  EX180                                 J0905280
                    *                                                   J0905290
                    *   TERMINATE CURRENT JOB                           J0905300
                    *                                                   J0905310
                    EX060 BSI  L  $DUMP     ENTRY OF SYSTEM DUMP PROG   J0905320
                          DC      -2        CODE TO TERMINATE JOB       J0905330
                          HDNG    EXIT-EX070 (STORE CORE IMAGE)         J0905340
                    *                                                   J0905350
                    *   WRITE DCOM ON MASTER CARTRIDGE                  J0905360
                    *                                                   J0905370
                    EX070 BSI  L  EX180                                 J0905380
                    *                                                   J0905390
                    *   WRITE DUP UPCOR ON THE MASTER CARTRIDGE         J0905400
                    *                                                   J0905410
                          LDD   1 UCHDR                                 J0905420
                          LDX  L3 BUF5      XR3 POINTS TO IOAR ADDR     J0905430
                          STD   3 0         IOAR HEADER FOR UPCOR       J0905440
                          BSI  I  PUT       LINK TO SAVE UP-CORE        J0905450
                    *                                                   J0905460
                    *   GIVE CORE LOAD BUILDER DB ADDRESS               J0905470
                    *                                                   J0905480
                          LDX  I2 #FRDR+C                               J0905490
                          LD   L2 $FPAD                                 J0905500
                          SLA     4                                     J0905510
                          STO  L  $DADR     DB ADR OF REQD WS           J0905520
                    *                                                   J0905530
                    *   GIVE CORE LOAD BUILDER WORKING STORAGE DRIVE    J0905540
                    *   CODE                                            J0905550
                    *                                                   J0905560
                          LD    1 #FRDR                                 J0905570
                          SLA     12                                    J0905580
                          STO  L  $DCDE     DRIVE NO. OF REQUIRED WS    J0905590
                    *                                                   J0905600
                    *   SET UP TO READ IN CORE LOAD BUILDER             J0905610
                    *                                                   J0905620
                          LDD     EX110+2                               J0905630
                          STD  I  EX110+1   PLACE IOAR HEADER           J0905640
                          LD      EX110+1                               J0905650
                          STO     EX080+1   SET-UP DISKZ PARAMETERS     J0905660
                          A       EX930                                 J0905670
                          STO     EX090+6   CALCULATE ENTRY ADDRESS     J0905680
                    *                                                   J0905690
                    *   MOVE READING PROGRAM TO LOW CORE                J0905700
                    *                                                   J0905710
                          LDX   2 32                                    J0905720
                          LDD     EX090                                 J0905730
                          STD   2 0         MOVE BSI INSTRUCTION        J0905740
                          LDD     EX090+2                               J0905750
                          STD   2 2         MOVE MDX INSTRUCTION        J0905760
                          LDD     EX090+4                               J0905770
                          STD   2 4         MOVE MDX INSTRUCTION        J0905780
                          LDD     EX090+6                               J0905790
                          STD   2 6         MOVE BSC INSTRUCTION        J0905800
                    *                                                   J0905810
                    *   GO TO LOW CORE TO READ IN CORE LOAD BUILDER     J0905820
                    *                                                   J0905830
                          LDD     EX080     LOAD ACC AND EXTENSION      J0905840
                          BSC  L  32        BRANCH TO READ IN CLB       J0905850
                    *                                                   J0905860
                    *   PROGRAM TO READ IN CLB                          J0905870
                    *                                                   J0905880
                          BSS  E  0                                     J0905890
                    EX080 DC      /7000     DISK READ FUNCTION          J0905900
                          DC      *-*       ADDRESS OF WORD COUNT       J0905910
                    EX090 BSI  L  DZ000     LINK TO READ IN CLB         J0905920
                          MDX  L  $DBSY,0   TEST BUSY SWITCH            J0905930
                          MDX     *-3       BRANCH IF STILL BUSY        J0905940
                          BSC  L  *-*       BRANCH TO ENTER CLB         J0905950
                          HDNG    EXIT-EX100 (LINK TO ADRWS)            J0905960
                    EX100 SLA     16                                    J0905970
                          STO   1 #MPSW     CLEAR CLB MAP SWITCH        J0905980
                          BSI     EX180     WRITE DCOM TO LOGICAL ZERO  J0905990
                    *                                                   J0906000
                    *   INDICATE DISKN REQUIRED                         J0906010
                    *                                                   J0906020
                          LDX   1 1         DISKN CODE                  J0906030
                          STX  L1 $DREQ     SET DK REQ INDICATOR        J0906040
                    *                                                   J0906050
                    *   LINK TO EXECUTE ADRWS ROUTINE                   J0906060
                    *                                                   J0906070
                          BSI  L  $LINK     LINK TO SUPERVISOR          J0906080
                          DC      /0111     ADRWS                       J0906090
                          DC      /99A2                                 J0906100
                          HDNG    EXIT-SLET ENTRIES                     J0906110
                    *                                                   J0906120
                    *   SLET ENTRY FOR CORE LOAD BUILDER                J0906130
                    *                                                   J0906140
                          BSS  E  0         MAKE ADDRESS EVEN           J0906150
                    EX110 DC      120       ID NO. OF CORE LOAD BUILDER J0906160
                          DC      *-*       CORE ADDRESS                J0906170
                          DC      *-*       WORD COUNT                  J0906180
                          DC      *-*       SECTOR ADDRESS              J0906190
                    *                                                   J0906200
                    *   SLET ENTRY FOR MODIF                            J0906210
                    *                                                   J0906220
                    EX120 DC      18        ID NO. OF MODIF             J0906230
                          DC      *-*       CORE ADDRESS                J0906240
                          DC      *-*       WORD COUNT                  J0906250
                          DC      *-*       SECTOR ADDRESS              J0906260
                    *                                               212 J0906262
                    *CONSTANTS                                      212 J0906264
                    *                                               212 J0906266
                          SPAC                                          J0906267
                    EX900 DC      /00C0     EBCDIC FORCING VALUE    212 J0906268
                    EX990 DC      *-*       TEMPORARY SAVE AREA     212 J0906269
                          HDNG    EXIT-EX130 (PRINT THE ERROR MESSAGE)  J0906270
                    EX130 SLA     16                                    J0906280
                          STO   1 #CBSW     CLEAR CLB SW ON ERROR MSG   J0906290
                    *                                                 * J0906300
                          LD    1 #MDF1                                 J0906310
                          A       EX940                                 J0906320
                          STO   1 #MDF1     INCR #MDF1 ERROR COUNT      J0906330
                    *                                                   J0906340
                    *   LINK TO WRITE DCOM ON MASTER CARTRIDGE          J0906350
                    *                                                   J0906360
                          BSI     EX180                                 J0906370
                    *                                                   J0906380
                    *   LOOK FOR MESSAGE IN TABLE                       J0906390
                    *                                                   J0906400
                          MDX   2 -4        RESTORE MESSAGE NUMBER      J0906410
                          STX   2 EX150     STORE MESSAGE NUMBER        J0906420
                          LDX  L3 EX800     REGISTER 3 POINTS AT TABLE  J0906430
                    EX140 LD    3 0         LOAD MESSAGE                J0906440
                          BSC  L  EX160,+-  BRANCH ZERO (END OF TABLE)  J0906450
                          S       EX150     CHECK MESSAGE NUMBER        J0906460
                          BSC  L  EX160,+-  BRANCH IF SPACE MESSAGE NO  J0906470
                          LD    3 1                                     J0906480
                          STO     *+1       STORE MESSAGE LENTH         J0906490
                          MDX  L3 *-*       INCREMENT TO NEXT MESSAGE   J0906500
                          MDX   3 2                                     J0906510
                          MDX     EX140     BRANCH                      J0906520
                    EX150 DC      *-*       MESSAGE NUMBER              J0906530
                    *                                                   J0906540
                    *   PLACE THE MESSAGE NUMBER IN THE ZERO MESSAGE    J0906550
                    *                                                   J0906560
                    EX160 LD    3 0         LOAD ERROR NUMBER2      212 J0906561
                          S    L  XXX03     ERROR = D05?            212 J0906562
                          BSC  L  EX165,Z   NO, GO PRINT IT         212 J0906563
                          LDD   1 #NAME     PICK UP NAME CODE       212 J0906564
                          SLA     2         ISOLATE                 212 J0906565
                          SRA     10        *FIRST CHARACTER        212 J0906566
                          OR      EX900     CHANGE TO EBCDIC        212 J0906567
                          STO  L  XXX04     SAVE IN MESSAGE BUFFER  212 J0906568
                          LDD   1 #NAME     RELOAD NAME CODE     R  212 J0906569
                          SLA     8         ISOLATE 2ND             212 J0906570
                          SRA     10        *CHARACTER              212 J0906571
                          OR      EX900     FORCE EBCDIC            212 J0906572
                          SLA     8         *AND STORE              212 J0906573
                          STO     EX990     *TEMPORARILY            212 J0906574
                          LDD   1 #NAME     RELOAD NAME CODE        212 J0906575
                          SLT     14        ISOLATE 3RD             212 J0906576
                          SRA     10        *CHARACTER              212 J0906577
                          OR      EX900     FORCE EBCDIC            212 J0906578
                          OR      EX990     *AND 2ND EBCDIC         212 J0906579
                          STO  L  XXX04+1   SAVE IN MESSAGE BUFFER  212 J0906580
                          LDD   1 #NAME     RELOAD NAME CODE        212 J0906581
                          SLT     20        ISOLATE 4TH             212 J0906582
                          SRA     10        *CHARACTER              212 J0906583
                          OR      EX900     FORCE EBCDIC            212 J0906584
                          SLA     8         *AND SAVE               212 J0906585
                          STO     EX990     * TEMPORARILY           212 J0906586
                          LDD   1 #NAME     RELOAD NAME CODE        212 J0906587
                          SLT     26        ISOLATE 5TH             212 J0906588
                          SRA     10        *CHARACTER              212 J0906589
                          OR      EX900     FORCE EBCDIC VALUE      212 J0906590
                          OR      EX990     COMBINE WITH 4TH CHAR   212 J0906591
                          STO  L  XXX04+2   SAVE IN MESSAGE BUFFER  212 J0906592
                    EX165 MDX   3 1         POINT TO MESSAGE COUNT  212 J0906593
                          STX   3 EX170     SAVE ADDRESS OF MESSAGE 212 J0906594
                          LD      EX150     LOAD MESSAGE NUMBER     212 J0906595
                          BSI  I  BINEB     CONVERT TO EBCDIC           J0906600
                          LD    1 TEMP1+1   LOAD LAST TWO CHARACTERS    J0906610
                          STO  L  XXX00-1   PLACE IN MESSAGE ZERO       J0906620
                    *                                                   J0906630
                    *   PRINT THE MESSAGE                               J0906640
                    *                                                   J0906650
                          BSI  I  PRINT     LINK TO PRINT LINE          J0906660
                    EX170 DC      *-*       ADDRESS OF MESSAGE          J0906670
                          BSI  I  LINE      LINK TO SPACE ONE LINE      J0906680
                          LD      EX150     CHECK FOR CODE = 33 OR 92   J0906690
                          S    L  EX950                                 J0906700
                          BSC  L  EX172,+-  BRANCH IF CODE = 33         J0906710
                    *                                                 * J0906720
                          S    L  EX960                                 J0906730
                          BSC  L  EX174,Z   BRANCH IF CODE NOT 92       J0906740
                    *                                                 * J0906750
                    EX172 BSI  L  $DUMP     CALL SYSTEM DUMP            J0906760
                          DC      0         CODE FOR CORE DUMP          J0906770
                          DC      0         DUMP ALL OF CORE IN         J0906780
                          DC      0         *STANDARD HEX FORMAT        J0906790
                    *                                                 * J0906800
                    EX174 BSI  I  REST      EXIT TO CONTROL ROUTINES    J0906810
                          HDNG    EXIT-WRITE DCOM ON MASTER CARTRIDGE   J0906820
                    EX180 DC      *-*       LINK WORD                   J0906830
                          LDX  L3 CATCO     XR3 POINTS TO DCOM IOAR     J0906840
                          LD    3 1         (DAAA/XXXX)                 J0906850
                          SLA     4         (AAA0/XXXX)                 J0906860
                          SRA     4         (0AAA/XXXX)                 J0906870
                          STO   3 1         SET LOGICAL 0 DRIVE         J0906880
                          BSI     EX185     LINK TO WRITE DCOM          J0906890
                    *                                                   J0906900
                    *   CHECK FOR INTERRUPT REQUEST                     J0906910
                    *                                                   J0906920
                          LD    1 KBREQ                                 J0906930
                          STO  L  $IREQ     RESTORE SYSTEM INTRPT REQ   J0906940
                          LD   L  EX905     LOAD INT INDICATOR     2-11 J0906950
                          BSC  I  EX180,+-  BRANCH IF NOT               J0906960
                          BSC  L  EX060     BRANCH TO ADMIT INTERRUPT   J0906970
                    EX185 DC      *-*       ENTRY POINT                 J0906980
                          STX  L3 EX080+1   PLACE IOAR ADDRESS          J0906990
                          LDD  L  EX080     LOAD ACC AND EXTENSION      J0907000
                          SRA     14        CHANGE READ CODE TO WRITE   J0907010
                          BSI  L  DZ000     WRITE DCOM                  J0907020
                          MDX  L  $DBSY,0   CHECK DISK BUSY             J0907030
                          MDX     *-3       BRANCH IF BUSY              J0907040
                          BSC  I  EX185     RETURN                      J0907050
                          HDNG    EXIT-CHECK FOR MODIF CALL TO DUP      J0907060
                    *                                                   J0907070
                    *   BRANCH IF MODIFICATIONS ARE NOT BEING DONE      J0907080
                    *                                                   J0907090
                    EX190 DC      *-*       LINK WORD                   J0907100
                          LDX  L1 C         XR1 IS CATCO MIDPOINT       J0907110
                          LD    1 #MDF2                                 J0907120
                          BSC  I  EX190,+-  BRANCH IF NOT MODIF CALL    J0907130
                          STO  L  EX120+1   INTLZ MODIF EXIT CORE ADDR  J0907140
                    *                                                   J0907150
                    *   CLEAR MODF2 TO ZERO                             J0907160
                    *                                                   J0907170
                          SLA     16                                    J0907180
                          STO   1 #MDF2     CLEAR MODIF INDICATOR       J0907190
                          LDX  L3 CATCO     POINT XR3 AT OUTPUT AREA    J0907200
                          LD    3 +1        (DAAA/XXXX)                 J0907210
                          SLA     4         (AAA0/XXXX)                 J0907220
                          SRA     4         (0AAA/XXXX)                 J0907230
                          STO   3 +1        DCOM SCTR ADDR, LOGICAL 0   J0907240
                          BSI     EX185     LINK TO WRITE DCOM          J0907250
                    *                                                   J0907260
                    *   SET UP TO READ IN MODIF                         J0907270
                    *                                                   J0907280
                          LDD  L  EX120+2                               J0907290
                          STD  I  EX120+1   PLACE IOAR HEADER           J0907300
                          LD   L  EX120+1                               J0907310
                          STO  L  EX080+1   SET ACC AND EXT             J0907320
                          A    L  EX930                                 J0907330
                          STO  L  EX090+6   CALCULATE ENTRY ADDRESS     J0907340
                    *                                                   J0907350
                    *   MOVE READING PROGRAM                            J0907360
                    *                                                   J0907370
                          LDX   2 32                                    J0907380
                          LDD  L  EX090                                 J0907390
                          STD   2 0         MOVE BSI INSTRUCTION        J0907400
                          LDD  L  EX090+2                               J0907410
                          STD   2 2         MOVE MDX INSTRUCTION        J0907420
                          LDD  L  EX090+4                               J0907430
                          STD   2 4         MOVE MDX INSTRUCTION        J0907440
                          LDD  L  EX090+6                               J0907450
                          STD   2 6         MOVE BSC INSTRUCTION        J0907460
                    *                                                   J0907470
                    *   GO TO LOW CORE TO READ IN MODIF                 J0907480
                    *                                                   J0907490
                          LDD  L  EX080     LOAD ACC AND EXTENSION      J0907500
                          BSC  L  32        BRANCH TO READ IN MODIF     J0907510
                          HDNG    EXIT-ERROR MESSAGE TABLE              J0907520
                    *                                                   J0907530
                    *   DUP ERROR MESSAGE TABLE                         J0907540
                    *                                                   J0907550
                    EX800 EQU     *                                     J0907560
                          DC      1         MESSAGE NUMBER              J0907570
                          DC      XXX01-*   WORD COUNT                  J0907580
                          EBC     .D 01 NAME IS NOT PRIME ENTRY.        J0907590
                    XXX01 EQU     *                                     J0907600
                          DC      2         MESSAGE NUMBER              J0907610
                          DC      XXX02-*   WORD COUNT                  J0907620
                          EBC     .D 02 INVALID HEADER RECORD TYPE.     J0907630
                    XXX02 EQU     *                                     J0907640
                          DC      3         MESSAGE NUMBER              J0907650
                          DC      XXX03-*   WORD COUNT                  J0907660
                          EBC     .D 03 INVALID HEADER LENGTH.          J0907670
                    XXX03 EQU     *                                     J0907680
                          DC      5         MESSAGE NUMBER              J0907690
                          DC      XXX05-*   WORD COUNT                  J0907700
                          EBC     .D 05 SECONDARY ENTRY.            212 J0907710
                          DC      /4040                             212 J0907722
                    XXX04 DC      *-*                               212 J0907724
                          DC      *-*                               212 J0907726
                          DC      *-*                               212 J0907728
                          EBC     .  IN LET.                        212 J0907729
                    XXX05 EQU     *                                     J0907730
                          DC      6         MESSAGE NUMBER              J0907740
                          DC      XXX06-*   WORD COUNT                  J0907750
                          EBC     .D 06 ENTRY POINT NAME ALREADY IN L.  J0907760
                          EBC     .ET/FLET.                             J0907770
                    XXX06 EQU     *                                     J0907780
                          DC      12        MESSAGE NUMBER              J0907790
                          DC      XXX12-*   WORD COUNT                  J0907800
                          EBC     .D 12 INVALID DISK I/O SPECIFIED.     J0907810
                    XXX12 EQU     *                                     J0907820
                          DC      13        MESSAGE NUMBER              J0907830
                          DC      XXX13-*   WORD COUNT                  J0907840
                          EBC     .D 13 INVALID FUNCTION FIELD .   2-10 J0907850
                    XXX13 EQU     *                                     J0907860
                          DC      14        MESSAGE NUMBER              J0907870
                          DC      XXX14-*   WORD COUNT                  J0907880
                          EBC     .D 14 INVALID FROM FIELD (CC 13-14).  J0907890
                    XXX14 EQU     *                                     J0907900
                          DC      15        MESSAGE NUMBER              J0907910
                          DC      XXX15-*   WORD COUNT                  J0907920
                          EBC     .D 15 INVALID TO FIELD (CC 17-18).    J0907930
                    XXX15 EQU     *                                     J0907940
                          DC      16        MESSAGE NUMBER              J0907950
                          DC      XXX16-*   WORD COUNT                  J0907960
                          EBC     .D 16 INVALID NAME FIELD (CC 21-25).  J0907970
                    XXX16 EQU     *                                     J0907980
                          DC      17        MESSAGE NUMBER              J0907990
                          DC      XXX17-*   WORD COUNT                  J0908000
                          EBC     .D 17 INVALID COUNT FIELD (CC 27-30). J0908010
                    XXX17 EQU     *                                     J0908020
                          DC      18        MESSAGE NUMBER              J0908030
                          DC      XXX18-*   WORD COUNT                  J0908040
                          EBC     .D 18 INVALID FUNCTION DURING TEMPO.  J0908050
                          EBC     .RARY JOB.                            J0908060
                    XXX18 EQU     *                                     J0908070
                          DC      19        MESSAGE NUMBER              J0908080
                          DC      XXX19-*   WORD COUNT                  J0908090
                          EBC     .D 19 CARTRIDGE NOT ON SYSTEM.        J0908100
                    XXX19 EQU     *                                     J0908110
                          DC      20        MESSAGE NUMBER              J0908120
                          DC      XXX20-*   WORD COUNT                  J0908130
                          EBC     .D 20 CARTRIDGE ID OUTSIDE VALID RA.  J0908140
                          EBC     .NGE (0001-7FFF).                     J0908150
                    XXX20 EQU     *                                     J0908160
                          DC      21        MESSAGE NUMBER              J0908170
                          DC      XXX21-*   WORD COUNT                  J0908180
                          EBC     .D 21 INVALID STOREMOD. SIZE OF REP.  J0908190
                          EBC     .LACEMENT EXCEEDS SIZE OF ORIGINAL.   J0908200
                    XXX21 EQU     *                                     J0908210
                          DC      22        MESSAGE NUMBER              J0908220
                          DC      XXX22-*   WORD COUNT                  J0908230
                          EBC     .D 22 PROGRAM NOT IN WORKING STORAGE. J0908240
                    XXX22 EQU     *                                     J0908250
                          DC      23        MESSAGE NUMBER              J0908260
                          DC      XXX23-*   WORD COUNT                  J0908270
                          EBC     .D 23 INVALID SYSTEM OVERLAY SUBTYP.  J0908280
                          EBC     .E SPECIFIED.                         J0908290
                    XXX23 EQU     *                                     J0908300
                          DC      24        MESSAGE NUMBER              J0908310
                          DC      XXX24-*   WORD COUNT                  J0908320
                          EBC     .D 24 COUNT FIELD TOO LARGE.          J0908330
                    XXX24 EQU     *                                     J0908340
                          DC      25        MESSAGE NUMBER              J0908350
                          DC      XXX25-*   WORD COUNT                  J0908360
                          EBC     .D 25 REQUIRED FORMAT NOT IN WS.      J0908370
                    XXX25 EQU     *                                     J0908380
                          DC      26        MESSAGE NUMBER              J0908390
                          DC      XXX26-*   WORD COUNT                  J0908400
                          EBC     .D 26 NAME NOT FOUND IN LET/FLET.     J0908410
                    XXX26 EQU     *                                     J0908420
                          DC      27        MESSAGE NUMBER              J0908430
                          DC      XXX27-*   WORD COUNT                  J0908440
                          EBC     .D 27 SOURCE NOT IN DSF.              J0908450
                    XXX27 EQU     *                                     J0908460
                          DC      30        MESSAGE NUMBER              J0908470
                          DC      XXX30-*   WORD COUNT                  J0908480
                          EBC     .D 30 INVALID RECORD TYPE.            J0908490
                    XXX30 EQU     *                                     J0908500
                          DC      31        MESSAGE NUMBER              J0908510
                          DC      XXX31-*   WORD COUNT                  J0908520
                          EBC     .D 31 PROGRAM OR DATA EXCEEDS DESTI.  J0908530
                          EBC     .NATION DISK AREA.                    J0908540
                    XXX31 EQU     *                                     J0908550
                          DC      32        MESSAGE NUMBER              J0908560
                          DC      XXX32-*   WORD COUNT                  J0908570
                          EBC     .D 32 INVALID CORE IMAGE CONVERSION.  J0908580
                    XXX32 EQU     *                                     J0908590
                          DC      33        MESSAGE NUMBER              J0908600
                          DC      XXX33-*   WORD COUNT                  J0908610
                          EBC     .D 33 LET/FLET OVERFLOW. A CORE DUM.  J0908620
                          EBC     .P FOLLOWS.                           J0908630
                    XXX33 EQU     *                                     J0908640
                          DC      41        MESSAGE NUMBER              J0908650
                          DC      XXX41-*   WORD COUNT                  J0908660
                          EBC     .D 41 INVALID STORECI CONTROL RECOR.  J0908670
                          EBC     .D.                                   J0908680
                    XXX41 EQU     *                                     J0908690
                          DC      42        MESSAGE NUMBER              J0908700
                          DC      XXX42-*   WORD COUNT                  J0908710
                          EBC     .D 42 STORECI CONTROL RECORDS INCOR.  J0908720
                          EBC     .RECTLY ORDERED.                      J0908730
                    XXX42 EQU     *                                     J0908740
                          DC      43        MESSAGE NUMBER              J0908750
                          DC      XXX43-*   WORD COUNT                  J0908760
                          EBC     .D 43 INCORRECT CONTINUATION.         J0908770
                    XXX43 EQU     *                                     J0908780
                          DC      44        MESSAGE NUMBER              J0908790
                          DC      XXX44-*   WORD COUNT                  J0908800
                          EBC     .D 44 ILLEGAL CHARACTER IN RECORD.    J0908810
                    XXX44 EQU     *                                     J0908820
                          DC      45        MESSAGE NUMBER              J0908830
                          DC      XXX45-*   WORD COUNT                  J0908840
                          EBC     .D 45 ILLEGAL FILE NUMBER.            J0908850
                    XXX45 EQU     *                                     J0908860
                          DC      46        MESSAGE NUMBER              J0908870
                          DC      XXX46-*   WORD COUNT                  J0908880
                          EBC     .D 46 ILLEGAL NAME.                   J0908890
                    XXX46 EQU     *                                     J0908900
                          DC      47        MESSAGE NUMBER              J0908910
                          DC      XXX47-*   WORD COUNT                  J0908920
                          EBC     .D 47 ILLEGAL CARTRIDGE ID.           J0908930
                    XXX47 EQU     *                                     J0908940
                          DC      48        MESSAGE NUMBER              J0908950
                          DC      XXX48-*   WORD COUNT                  J0908960
                          EBC     .D 48 SCRA BUFFER OVERFLOW.           J0908970
                    XXX48 EQU     *                                     J0908980
                          DC      70        MESSAGE NUMBER              J0908990
                          DC      XXX70-*   WORD COUNT                  J0909000
                          EBC     .D 70 LAST ENTRY IN LET/FLET NOT A .  J0909010
                          EBC     .1DUMY.                               J0909020
                    XXX70 EQU     *                                     J0909030
                          DC      71        MESSAGE NUMBER              J0909040
                          DC      XXX71-*   WORD COUNT                  J0909050
                          EBC     .D 71 1DUMY ENTRY IN LET/FLET IS FO.  J0909060
                          EBC     .LLOWED BY A SECONDARY ENTRY POINT.   J0909070
                    XXX71 EQU     *                                     J0909080
                          DC      72        MESSAGE NUMBER              J0909090
                          DC      XXX72-*   WORD COUNT                  J0909100
                          EBC     .D 72 FIRST ENTRY IN LET/FLET SECTO.  J0909110
                          EBC     .R IS A SECONDARY ENTRY POINT.        J0909120
                    XXX72 EQU     *                                     J0909130
                          DC      80        MESSAGE NUMBER              J0909140
                          DC      XXX80-*   WORD COUNT                  J0909150
                          EBC     .D 80 FIXED AREA PRESENT.             J0909160
                    XXX80 EQU     *                                     J0909170
                          DC      81        MESSAGE NUMBER              J0909180
                          DC      XXX81-*   WORD COUNT                  J0909190
                          EBC     .D 81 ASSEMBLER NOT IN SYSTEM.        J0909200
                    XXX81 EQU     *                                     J0909210
                          DC      82        MESSAGE NUMBER              J0909220
                          DC      XXX82-*   WORD COUNT                  J0909230
                          EBC     .D 82 FORTRAN NOT IN SYSTEM.          J0909240
                    XXX82 EQU     *                                     J0909250
                          DC      83        MESSAGE NUMBER              J0909260
                          DC      XXX83-*   WORD COUNT                  J0909270
                          EBC     .D 83 INCREASE VALUE IN COUNT FIELD.  J0909280
                          EBC     . (CC 27-30).                         J0909290
                    XXX83 EQU     *                                     J0909300
                          DC      84        MESSAGE NUMBER              J0909310
                          DC      XXX84-*   WORD COUNT                  J0909320
                          EBC     .D 84 DEFECTIVE SLET. DEFINE VOID T.  J0909330
                          EBC     .ERMINATED.                           J0909340
                    XXX84 EQU     *                                     J0909350
                          DC      85        MESSAGE NUMBER              J0909360
                          DC      XXX85-*   WORD COUNT                  J0909370
                          EBC     .D 85 FIXED AREA NOT PRESENT.         J0909380
                    XXX85 EQU     *                                     J0909390
                          DC      86        MESSAGE NUMBER              J0909400
                          DC      XXX86-*   WORD COUNT                  J0909410
                          EBC     .D 86 DECREASE VALUE IN COUNT FIELD . J0909420
                          EBC     .(CC 27-30).                          J0909430
                    XXX86 EQU     *                                     J0909440
                          DC      87        MESSAGE NUMBER          2-5 J0909450
                          DC      XXX87-*   WORD COUNT              2-5 J0909460
                          EBC     .D 87 RPG NOT IN SYSTEM.          2-5 J0909470
                    XXX87 EQU     *                                 2-5 J0909480
                          DC      88        MESSAGE NUMBER          2-9 J0909483
                          DC      XXX88-*   WORD COUNT              2-9 J0909484
                          EBC     .D 88 COBOL NOT IN SYSTEM.        2-9 J0909485
                    XXX88 EQU     *                                 2-9 J0909486
                          DC      90        MESSAGE NUMBER              J0909490
                          DC      XXX90-*   WORD COUNT                  J0909500
                          EBC     .D 90 CHECK SUM ERROR.                J0909510
                    XXX90 EQU     *                                     J0909520
                          DC      92        MESSAGE NUMBER              J0909530
                          DC      XXX92-*   WORD COUNT                  J0909540
                          EBC     .D 92 INVALID DISKZ CALL. A CORE DU.  J0909550
                          EBC     .MP FOLLOWS.                          J0909560
                    XXX92 EQU     *                                     J0909570
                          DC      93        MESSAGE NUMBER              J0909580
                          DC      XXX93-*   WORD COUNT                  J0909590
                          EBC     .D 93 CARTRIDGE OVERFLOW.             J0909600
                    XXX93 EQU     *                                     J0909610
                          DC      101       MESSAGE NUMBER              J0909620
                          DC      XX101-*   WORD COUNT                  J0909630
                          EBC     .ASSEMBLER VOIDED.                    J0909640
                    XX101 EQU     *                                     J0909650
                          DC      102       MESSAGE NUMBER              J0909660
                          DC      XX102-*   WORD COUNT                  J0909670
                          EBC     .FORTRAN VOIDED.                      J0909680
                    XX102 EQU     *                                     J0909690
                          DC      103       MESSAGE NO.             2-5 J0909700
                          DC      XX103-*   WORD COUNT              2-5 J0909710
                          EBC     .RPG VOIDED.                      2-5 J0909720
                    XX103 EQU     *                                 2-5 J0909730
                          DC      104       MESSAGE NUMBER          2-9 J0909735
                          DC      XX104-*   WORD COUNT              2-9 J0909736
                          EBC     .COBOL VOIDED.                    2-9 J0909737
                    XX104 EQU     *                                     J0909738
                          DC      0         MESSAGE NUMBER              J0909740
                          DC      XXX00-*   WORD COUNT                  J0909750
                          EBC     .NO SUCH ERROR MESSAGE NUMBER.        J0909760
                          EBC     .  XX.                                J0909770
                    XXX00 EQU     *                                     J0909780
                          BSS     $ZEND+/4FF-*   PATCH AREA             J0909790
                          DC      /FFFF     END OF DEXIT PATCH AREA     J0909800
                          END     EX000                                 J0909810
