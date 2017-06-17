                          HDNG    DDUMP-    RESIDENT COMMA   2 AUG 67   J0500010
                          ABS                                           J0500020
                    $CIBA EQU     /5   ADDR OF CIB ON MASTER CARTRIDGE  J0500030
                    $CH12 EQU     /6   CHANNEL 12 INDR,NON-ZERO=CHAN 12 J0500040
                    $COMN EQU     /7   WORD COUNT OF COMMON             J0500050
                    $CORE EQU     /E   CORE SIZE,/1000=4K,/2000=8K,ETC) J0500060
                    $CTSW EQU     /F   MCR SW,NON-ZERO0// RECD TRAPPED  J0500070
                    $DADR EQU     /10  SCTR ADDR OF PROG TO BE FETCHED  J0500080
                    $DABL EQU     /11  IOCC FOR SCA RESET (ODD ADDR)    J0500090
                    $DREQ EQU     /12  INDR FOR REQUESTED V. DISK I/O   J0500100
                    $IBSY EQU     /13  PRINC I/O BUSY INDR,NON-ZERO0BSY J0500110
                    $HASH EQU     /14  WORK AREA FOR MONITOR PROGRAMS   J0500120
                    $PRET EQU     /28  ADDR PREOPERATIVE ERROR TRAP     J0500130
                    $IREQ EQU     /2C  ADDR OF INT REQUEST SUBROUTINE   J0500140
                    $ULET EQU     /2D  ADDR OF LET, LOGICAL DRIVE 0     J0500150
                    $IOCT EQU     /32  IOCS CTR,0=NO I/O IN PROGRESS    J0500160
                    $LAST EQU     /33  LAST CD INDR,NON-ZERO=LAST CARD  J0500170
                    $NDUP EQU     /34  INHIBIT DUP SW,NON-ZERO=NO DUP   J0500180
                    $NXEQ EQU     /35  INHIBIT EXEC SW,NON-ZERO=NO EXEQ J0500190
                    $PBSY EQU     /36  PRINC PTR BUSY INDR,NON-ZERO=BSY J0500200
                    $PGCT EQU     /37  PAGE NO. FOR PAGE HEADINGS       J0500210
                    $EXIT EQU     /38  ADDR CALL EXIT ENTRY POINT       J0500220
                    $LINK EQU     /39  ADDR CALL LINK ENTRY POINT       J0500230
                    $DUMP EQU     /3F  ADDR OF CALL DUMP, ENTRY POINT   J0500240
                    $DCDE EQU     /77  DRIVE CODE FOR CORE LOAD BLDR    J0500250
                    $PHSE EQU     /78  NO. OF PHASE CURRENTLY IN CORE   J0500260
                    $UFIO EQU     /79  ARM POSITION IN UNFORMATTED AREA J0500270
                    $WSDR EQU     /7A  WORKING STORAGE DRIVE CODE       J0500280
                    $WRD1 EQU     /7B  LOAD ADDR FOR CURR USER CORE LD  J0500290
                    $KCSW EQU     /7C  INHIBIT INPUT/PRINT OVERLAP SW   J0500300
                    $UFDR EQU     /7D  UNFORMATTED I/O DRIVE CODE       J0500310
                    $CPTR EQU     /7E  CHANNEL 12 INDICATOR FOR CP      J0500320
                    $1132 EQU     /7F  CHANNEL 12 INDICATOR FOR 1132    J0500330
                    $1403 EQU     /80  CHANNEL 12 INDICATOR FOR 1403    J0500340
                    $PST1 EQU     /81  ADDR POSTOP ERROR TRAP,LEVEL 1   J0500350
                    $PST2 EQU     /85  ADDR POSTOP ERROR TRAP,LEVEL 2   J0500360
                    $PST3 EQU     /89  ADDR POSTOP ERROR TRAP,LEVEL 3   J0500370
                    $PST4 EQU     /8D  ADDR POSTOP ERROR TRAP,LEVEL 4   J0500380
                    $STOP EQU     /91  ADDR PROGRAM STOP KEY TRAP       J0500390
                    $FPAD EQU     /95  FILE PROTECT ADDR (ADJ),LOG DR 0 J0500400
                    $CYLN EQU     /9A  ARM POSITION FOR LOGICAL DRIVE 0 J0500410
                    $ACDE EQU     /9F  AREA CODE FOR LOGICAL DRIVE 0    J0500420
                    $DCYL EQU     /A4  1ST DEF CYL ADDR, LOGICAL DR 0   J0500430
                    $I200 EQU     /B3  ENTRY POINT TO ILS FOR LEVEL 2   J0500440
                    $I205 EQU     /B8                                   J0500450
                    $IBT2 EQU     $I205+1 ADDR OF IBT FOR LEVEL 2       J0500460
                    $I400 EQU     /C4  ENTRY POINT TO ILS FOR LEVEL 4   J0500470
                    $I405 EQU     /D3                                   J0500480
                    $IBT4 EQU     $I405+1 ADDR OF IBT FOR LEVEL 4       J0500490
                    $I410 EQU     /D5                                   J0500500
                    $DBSY EQU     /EE  DISK BUSY INDR,NON-ZERO=DK BUSY  J0500510
                    $BYSW EQU     /1CB BYPASS SW,NOP IF FETCHING SOCAL  J0500520
                    DZ000 EQU     /0F2 DISKZ ENTRY POINT                J0500530
                    $ZEND EQU     /1E0 ADDR 1+LAST WORD OF DISKZ        J0500540
                          HDNG          CONCATENATED COMMON AREA(CATCO) J0500550
                    C     EQU     /7FA0     CATCO POINTER SET TO MIDDLE J0500560
                    *************************************************** J0500570
                    *                                                 * J0500580
                    *  INDEX REG 1 IS SET TO .C. WHEN CATCO IS FORMED * J0500590
                    *  FOR USE BY ALL OF DUP FUNCTIONS. ANY DUP ROUT  * J0500600
                    *  USING XR 1 FOR OTHER REASONS MUST RESTORE.     * J0500610
                    *  ALL VALUES IN CATCO HAVE LABELS EQUATED TO THE * J0500620
                    *  VALUE THAT INDICATES THEIR RELATIVE LOCATION   * J0500630
                    *  FROM .C.                                       * J0500640
                    *                                                 * J0500650
                    *************************************************** J0500660
                    *                                                 * J0500670
                    *             CATCO DCOM IMAGE                    * J0500680
                    *   EQUIVALENCES USED TO REFERENCE CATCO WITH XR1 * J0500690
                    *                                                 * J0500700
                    *************************************************** J0500710
                    #NAME EQU     4-/80     NAME OF PROGRAM             J0500720
                    #DBCT EQU     6-/80     DISK BLOCK COUNT OF PROGRAM J0500730
                    #FCNT EQU     7-/80     FILES SW,ZERO = NO FILES    J0500740
                    #SYSC EQU     8-/80     NON-ZERO,SYSTEM CARTRIDGE   J0500750
                    #JBSW EQU     9-/80     JOB SW,NON-ZERO='T' MODE    J0500760
                    #CBSW EQU     10-/80    CLB SW,NON-ZERO=STORECI     J0500770
                    #LCNT EQU     11-/80    NO. OF LOCALS               J0500780
                    #MPSW EQU     12-/80    NON-ZERO, CORE MAP DESIRED  J0500790
                    #MDF1 EQU     13-/80    NO. OF DUP CTRL RCDS        J0500800
                    #MDF2 EQU     14-/80    ADDR OF MODIF BUFFER        J0500810
                    #NCNT EQU     15-/80    NO. OF NOCALS               J0500820
                    #ENTY EQU     16-/80    RELATIVE ENTRY ADDR OF PROG J0500830
                    #RP67 EQU     17-/80    IF NON-ZERO,1442 MOD 6,7    J0500840
                    *                                                   J0500850
                    *   NEGATIVE VALUE REPRESENTS DEFAULT CONDITION   * J0500860
                    #TODR EQU     18-/80    DR CODE OF 'TO' DRIVE       J0500870
                    #FRDR EQU     19-/80    DR CODE OF 'FROM' DRIVE     J0500880
                    *                                                 * J0500890
                    #FHOL EQU     20-/80    ADDR OF LARGEST FXA HOLE    J0500900
                    #FSZE EQU     21-/80    BLK CNT LARGEST HOLE IN FXA J0500910
                    #UHOL EQU     22-/80    ADDR OF LARGEST UA HOLE     J0500920
                    #USZE EQU     23-/80    BLK CNT LARGEST HOLE IN UA  J0500930
                    #DCSW EQU     24-/80    NON-ZERO=DUP CALL           J0500940
                    #PIOD EQU     25-/80    PRINC. I/O INDICATOR        J0500950
                    #PPTR EQU     26-/80    PRINC. PRINTER INDICATOR    J0500960
                    #CIAD EQU     27-/80    WD NO. SCTR 0,CIL ADDR      J0500970
                    #ACIN EQU     28-/80    AVAILABLE CARTRIDGE INDR2-8 J0500980
                    #GRPH EQU     29-/80    2250 INDICATOR          2-8 J0500990
                    #GCNT EQU     30-/80    NO. G2250 RECORDS       2-8 J0501000
                    #LOSW EQU     31-/80    LOCAL-CALLS-LOCAL INDR  2-8 J0501010
                    #X3SW EQU     32-/80    SPECIAL ILS SWITCH      2-8 J0501020
                    #ECNT EQU     33-/80    NO. OF EQUAT RCDS       2-8 J0501030
                    #ANDU EQU     35-/80    END OF UA (ADJ) LOG DR 0-4  J0501040
                    #BNDU EQU     40-/80    END OF UA (BASE) LOG DR 0-4 J0501050
                    #FPAD EQU     45-/80    FILE PROTECT ADDR (BASE)    J0501060
                    #PCID EQU     50-/80    CART ID, PHYS DR 0-4        J0501070
                    #CIDN EQU     55-/80    CART ID, LOG DR 0-4         J0501080
                    #CIBA EQU     60-/80    CIB ADDR, LOG DR 0-4        J0501090
                    #SCRA EQU     65-/80    SCRA, LOG DR 0-4            J0501100
                    #FMAT EQU     70-/80    WS FORMAT, LOG DR 0-4       J0501110
                    #FLET EQU     75-/80    FLET ADDR, LOG DR 0-4       J0501120
                    #ULET EQU     80-/80    LET ADDR, LOG DR 0-4        J0501130
                    #WSCT EQU     85-/80    WS BLK CNT, LOG DR 0-4      J0501140
                    #CSHN EQU     90-/80    CUSHION END SCTR ADDR, 0-4  J0501150
                    #DCOM EQU     1         SCTR ADDR OF DCOM           J0501160
                    #HDNG EQU     7         SCTR WITH PAGE HEADING      J0501170
                    @SBFR EQU     /FB0                              2-8 J0501180
                    @LFEN EQU     3         SYMBOLIC SIZE OF LET ENT2-3 J0501190
                          HDNG    CONCATENATED COMMON AREA (CATCO)      J0501200
                    *************************************************** J0501210
                    *                                                 * J0501220
                    *             CATCO IOAR HDRS FOR DUP PHASES      * J0501230
                    *                                                 * J0501240
                    *************************************************** J0501250
                          ORG     -/10                                  J0501260
                    DCHDR BSS     2         DUP CONTROL            PH02 J0501270
                    STHDR BSS     2         STORE                  PH03 J0501280
                    FLHDR BSS     2         FILEQ                  PH04 J0501290
                    DMHDR BSS     2         DUMP                   PH05 J0501300
                    DLHDR BSS     2         DUMPLET                PH06 J0501310
                    DTHDR BSS     2         DELETE                 PH07 J0501320
                    DFHDR BSS     2         DEFINE                 PH08 J0501330
                    DXHDR BSS     2         DUP EXIT               PH09 J0501340
                    UCHDR BSS     2         DUP UPCOR              PH13 J0501350
                    PIHDR BSS     2         PRINCIPAL I/O BLOCK    PH14 J0501360
                    SIHDR BSS     2         PRINC I/O (W/O KB) BLK PH15 J0501370
                    PTHDR BSS     2         PAPER TAPE I/O BLOCK   PH16 J0501380
                    CIHDR BSS     2         CI PHASE READ BY CL BUILDER J0501390
                    MUHDR BSS     2         MACRO UPDATE      PH206 2-8 J0501400
                    D2HDR BSS     2         DUP CONTROL 2     PH205 2-8 J0501410
                          HDNG    DDUMP-    CATCO DUP SWITCHES          J0501420
                    *************************************************** J0501430
                    *                                                 * J0501440
                    *             CATCO DUP SWITCHES                  * J0501450
                    *      WORDS USED FOR COMMUNICATION OF DATA       * J0501460
                    *   BETWEEN DUP ROUTINES.                         * J0501470
                    *                                                 * J0501480
                    *      INITIALIZED TO ZERO BY  .REST. OF DUPCO    * J0501490
                    *                                                 * J0501500
                    *************************************************** J0501510
                    CL1   EQU     *                                     J0501520
                    ASMSW BSS     1         NON ZERO IF DEFINE VOID ASM J0501530
                    BITSW BSS     1         NON ZERO TO ALLOW MDUMP-S   J0501540
                    BLKSW BSS     1         NON ZERO IF BYPASSING REC   J0501550
                    CIERR BSS     1         ERROR NO DETECTED BY PH 17  J0501560
                    CISW  BSS     1         NON ZERO IF STORE CI        J0501570
                    CLBSW BSS     1         NON ZERO IF PRECI EXECUTED  J0501580
                    CNTNO BSS     1         RECORD NO BEING PCHD OR RD  J0501590
                    *                                                 * J0501600
                    *   .DATSW. IS FILLED WITH THE CNT FIELD OF THE   * J0501610
                    *   DUP CONTROL RECORD.                           * J0501620
                    *   USED PRIMARILY FOR DATA MOVEMENT, BUT ALSO IS * J0501630
                    *   USED FOR COUNT OF RECORDS TO READ AFTER A     * J0501640
                    *   STORE CI DUP CONTROL RECORD.                  * J0501650
                    DATSW BSS     1         RECORDS VALUE IN CNT FIELD  J0501660
                    DBADR BSS     1         DB ADDR OF REFERENCED PROG  J0501670
                    DELSW BSS     1         ADDR OF REQ LET ENTRY - 1   J0501680
                    DFNSW BSS     1         NON ZERO IF DEFINE FXA      J0501690
                    DKSAD BSS     1         DK SCTR ADDR W/O DR CODE    J0501700
                    DUMPP BSS  E  2         LAST LIMITS FOR PRNTR DUMP  J0501710
                    FORSW BSS     1         NON ZERO IF DEFINE VOID FOR J0501720
                    FRWS  BSS     1         NON ZERO IF FROM FLD IS WS  J0501730
                    FXSW  BSS     1         NON ZERO IF FIXED AREA REQD J0501740
                    HOLSW BSS     1         NON ZERO IF NO CONV REQD    J0501750
                    IOSW  BSS     1         NON ZERO IF IN/OUT REQD     J0501760
                    *                                                 * J0501770
                    *   DUMPLET SWITCH - ZERO IF NOT DUMPLET/DUMPFLET * J0501780
                    *       PLUS VALUE REQUIRES PRINT OF BOTH LET/FLET* J0501790
                    *       NEG. VALUE REQUIRES PRINT OF FLET ONLY    * J0501800
                    LETSW BSS     1         NON ZERO,PRINT LET OR FLET* J0501810
                    LSTLF BSS     1         LAST LET/FLET SECT PROCESSD J0501820
                    MODSW BSS     1         NON ZERO IF STORE MOD FUNC  J0501830
                    NAMSW BSS     1         NON ZERO IF NAME IN LET/F   J0501840
                    NEGSW BSS     1         NON ZERO IF SHRINKING FXA   J0501850
                    PGMHL BSS     1         WORD COUNT OF THE PROG HDR  J0501860
                    PRSW  BSS     1         NON ZERO IF PRINTING OUTPUT J0501870
                    PTSW  BSS     1         NON ZERO IF PAPER TAPE REQD J0501880
                    SKWDS BSS     1         WDS TO SEARCH IN L/F SECT   J0501890
                    STCSW BSS     1         NON ZERO IF STORE DATA CI   J0501900
                    STSW  BSS     1         NON ZERO IF STORE TYPE      J0501910
                    TEMP1 BSS  E  1         1ST WD OF BINEB OUTPUT      J0501920
                    TEMP2 BSS     1         2ND WD OF BINEB OUTPUT      J0501930
                    TOWS  BSS     1         NON ZERO IF TO FIELD IS WS  J0501940
                    T3MSW BSS     1         TYPE 3,4 SOCAL LEVEL CELL   J0501950
                    UASW  BSS     1         NON ZERO IF USER AREA REQD  J0501960
                    WSSW  BSS     1         NON ZERO IF WORK STG REQD   J0501970
                    XEQSW BSS     1         NON ZERO IF NOT RET FR GET  J0501980
                    EBCSW BSS     1         NON ZERO IF EBC DATA OP 2E2 J0501990
                    HDNSW BSS     1         NON ZERO IF NAME IN HDR 2-8 J0502000
                    RPGSW BSS     1         NON Z IF DEFINE VOID RPG2-8 J0502010
                    DFLSW BSS     1         NON ZERO IF *DFILE      2-8 J0502020
                          BSS     1         RESERVED FOR ADDITION   2-8 J0502030
                    CL2   EQU     *-1                                   J0502040
                          HDNG    DDUMP-    CATCO DUP SWITCHES          J0502050
                    *************************************************** J0502060
                    *                                                 * J0502070
                    *             CATCO DUP SWITCHES                  * J0502080
                    *  INITIALIZED BY DCTL AND NOT RESET BY .REST.    * J0502090
                    *                                                 * J0502100
                    *************************************************** J0502110
                    IOREQ BSS     1         MON-ZERO,AUX I/O SET REQ    J0502120
                    PH2   BSS     1         NON-ZERO IF DCTL IN CORE    J0502130
                    PH3   BSS     1         NON-ZERO IF STORE IN CORE   J0502140
                    PH4   BSS     1         NON-ZERO IF DUMP IN CORE    J0502150
                    ************************************************2-8 J0502160
                    *             CATCO SWITCH INITIALIZED TO ZERO  2-8 J0502170
                    *   BY CCAT SUBR AND SET BY MACRO UPDATE PROGRAM2-8 J0502180
                    *                                               2-8 J0502190
                    ************************************************2-8 J0502200
                    DUPCR BSS     1         NON ZERO IF DUP CTRL RCD2-8 J0502210
                    *************************************************** J0502220
                    *                                                 * J0502230
                    *             CATCO DUP SWITCHES SET BY CCAT SUBR * J0502240
                    *                                                 * J0502250
                    *************************************************** J0502260
                    ADDR2 BSS     1         KB INTERRUPT ADDRESS        J0502270
                    KBREQ BSS     1         CONTENTS OF LOC 13          J0502280
                    *      THE FOLLOWING SWITCH IS SET TO INDICATE THE  J0502290
                    *       PRINCIPAL INPUT DEVICE                      J0502300
                    *             -  IS PAPER TAPE                      J0502310
                    *             0  IS CARD                            J0502320
                    *             +  IS KEYBOARD                        J0502330
                    INOUT BSS     1         PRINCIPAL INPUT SWITCH      J0502340
                    *                                                   J0502350
                    PTPON BSS     1         NON-ZERO IF PAPER TP ON SYS J0502360
                    *************************************************** J0502370
                    *                                                 * J0502380
                    *             LEVEL 4 INTERRUPT BRANCH TABLE      * J0502390
                    *             ADDRESSES. INITIALIZED BY CCAT,     * J0502400
                    *             AND CARD/PAPER TAPE INTERFACES.     * J0502410
                    *                                                 * J0502420
                    *************************************************** J0502430
                          ORG     /0049                                 J0502440
                    IBT   BSS     9         9 WD INTRPT BRANCH TABLE    J0502450
                    *************************************************** J0502460
                    *                                                 * J0502470
                    *             CATCO I/O ADDRESSES REQUIRED BY DUP * J0502480
                    *                                                 * J0502490
                    *************************************************** J0502500
                    P1442 BSS  E  2         SYS 1442 IOAR HEADER        J0502510
                    PRPAR BSS     2         DEFAULT LIMITS TO PRINT     J0502520
                    PHDUP BSS     1         LAST DUP PHASE IN CORE      J0502530
                    CRBUF BSS     1         81 WD BFR FOR DUP CTRL RCDS J0502540
                    DCADR BSS     1         ADDR FOR DUP CTRL IOAR HDR  J0502550
                    HDBUF BSS     1         ADDR OF PAGE HEADING BFR    J0502560
                    IOBLK BSS     1         ADDR OF DUP I/O PHASE       J0502570
                    SDBUF BSS     1         STORE/DUMP BUFFER           J0502580
                    LETAR BSS     1         ADDR OF LET SEARCH BUFFER   J0502590
                    PEBUF BSS     1         41 WD BFR FOR PACKED EBCDIC J0502600
                    THIS  BSS     1         ADDR OF DOUBLE BFR, BFR 1   J0502610
                    NEXT  BSS     1         ADDR OF DOUBLE BFR, BFR 2   J0502620
                          HDNG              DUP CORE PARAMETERS         J0502630
                    DISKZ EQU     DZ000     DISKZ ENTRY POINT           J0502640
                    B     EQU     $ZEND-2                               J0502650
                    DMPLC EQU     B         IOAR CORE ADDR FOR DMPLT    J0502660
                    EXITC EQU     B         IOAR CORE ADDR FOR DEXIT    J0502670
                    MUPC  EQU     B         IOAR CORE ADDR FOR MUP  2-8 J0502680
                    DCTL  EQU     B+/1002   ENTRY ADDRESS OF DCTL       J0502690
                    DCTLC EQU     B+/1000   IOAR CORE ADDR FOR DCTL     J0502700
                    WSDC  EQU     B+/2000   IOAR CORE ADDR FOR STORE    J0502710
                    DUMPC EQU     B+/4000   IOAR CORE ADDR FOR DDUMP    J0502720
                    DUPCO EQU     /7DB0     ADDR OF RESIDENT DUPCO      J0502730
                    CATCO EQU     /7F20-2   ADDR OF DCOM IOAR HEADER    J0502740
                    *                                                 * J0502750
                    *  DUPCO ENTRY POINTS...USED WITH INDIRECT BSI    * J0502760
                    *                                                 * J0502770
                          ORG     DUPCO                                 J0502780
                    BINEB BSS     1         CONVERSION BINARY TO EBCDIC J0502790
                    WRTDC BSS     1         WRITE DCOM(S) SUBROUTINE    J0502800
                    ENTER BSS     1         SAVE XR-S AND CONDITIONS    J0502810
                    GET   BSS     1         READ FROM DISK USING DISKZ  J0502820
                    LEAVE BSS     1         HANDLES ALL EXITS FROM DUP  J0502830
                    LINE  BSS     1         SPACES PRINTER 1 LINE       J0502840
                    MASK  BSS     1         INHIBITS KB INT REQUEST     J0502850
                    MDUMP BSS     1         PRINTS SELECTED CORE LOC-S  J0502860
                    PAGE  BSS     1         SKIPS TO NEXT PAGE          J0502870
                    PHID  BSS     1         RECORDS PHASE ID            J0502880
                    PHIDM BSS     1         RECORDS PHASE AND MODIFIER  J0502890
                    PRINT BSS     1         USE SYS PR SUBR TO PRINT    J0502900
                    PUT   BSS     1         WRITES TO DISK USING DISKZ  J0502910
                    REST  BSS     1         RESTORE CATCO,GO TO DCTL    J0502920
                    RTURN BSS     1         RESTORE XR-S AND CONDITIONS J0502930
                    *                                                 * J0502940
                    *  INPUT/OUTPUT PARAMETERS , CORE ADDRESSES       * J0502950
                    *                                                 * J0502960
                    BUF6  EQU     DUPCO-/1F ADDR OF PAGE HEADING BUFFER J0502970
                    PRPNT EQU     BUF6-/141  IOAR ADDR FOR PRINC.PTR    J0502980
                    IOADR EQU     BUF6-/38B  START OF I/O INTERFACE     J0502990
                    GETHO EQU     IOADR+4   ENTRY FOR READING HOLL TYPE J0503000
                    GETBI EQU     IOADR+5   ENTRY FOR READING BINARY    J0503010
                    PACKB EQU     IOADR+6   ENTRY TO PACK BINARY        J0503020
                    PCHBI EQU     IOADR+7   ENTRY TO PUNCH BINARY       J0503030
                    BUF1  EQU     IOADR-/51 ADDR OF NEXT BUFFER         J0503040
                    BUF2  EQU     BUF1-/52  ADDR OF THIS BUFFER         J0503050
                    BUF3  EQU     BUF2-/3E  ADDR OF PACKED EBC BUFFER   J0503060
                    BUF4  EQU     BUF3-/52  ADDR OF CONTROL RCD BUFFER  J0503070
                    BUF5  EQU     IOADR-/284    ADDR OF LET SCTR BFR    J0503080
                    BUF7  EQU     BUF5-/7142   ADDR OF STORE/DUMP BFR   J0503090
                          HDNG    DUMP-MAINLINE                         J0503100
                    ************************************************2-1 J0503110
                    *                                              *2-1 J0503120
                    *STATUS-VERSION2, MODIFICATION 12              *    J0503130
                    *                                              *2-1 J0503140
                    *     DUP-DUMP MODULE                          *2-1 J0503150
                    *                                              *2-1 J0503160
                    ************************************************2-1 J0503170
                    *                                               2-1 J0503180
                    *   PARAMETERS FOR THE SYSTEM LOADER                J0503190
                    *                                                   J0503200
                          ORG     DUMPC                                 J0503210
                          DC      *-*       WORD COUNT FILLED BY LOADER J0503220
                          DC      5         PHASE ID                    J0503230
                    *                                                   J0503240
                    *   INDICATE THE PHASE OF THE SYSTEM THAT HAS       J0503250
                    *   CONTROL OF THE MACHINE                          J0503260
                    *                                                   J0503270
                    DD000 BSI  I  PHID      PLACE PHASE ID NUMBER       J0503280
                          DC      /0005                                 J0503290
                    *                                               2E2 J0503300
                          SLA     16        DUMP MODULE MUST ALWAYS 2E2 J0503310
                          STO   1 PH4       *BE RELOADED INTO CORE  2E2 J0503320
                          BSC  L  DD050     BR TO INITLZ PART       2E2 J0503330
                    *                                                   J0503340
                    *   PUNCH HEADER CARD                               J0503350
                    *                                                   J0503360
                    *   FORMAT THE HEADER RECORD                        J0503370
                    *                                                   J0503380
                    DD290 LD    2 DD974-X                               J0503390
                          STO   2 DD962-X   STORE WORD COUNT OF 6       J0503400
                    DD300 BSI  L  XG000     LINK TO GET DATA FROM DISK  J0503410
                          BSI  L  XW000     LINK TO PLACE DATA IN WS    J0503420
                          BSI  L  XF000     LINK TO PLACE DATA ON PUNCH J0503430
                          MDX  L  DD962,-1  DECREMENT WORD COUNT        J0503440
                          MDX     DD300     BRANCH IF WORD COUNT NOT 0  J0503450
                          LD    2 DD958-X                               J0503460
                          BSC  L  DD320,Z   BRANCH IF HEADER PLACED     J0503470
                          LD    2 DD921-X                               J0503480
                          A     2 DD972-X                               J0503490
                          STO   2 DD962-X   CALCULATE LENGTH OF HEADER  J0503500
                          STO   2 DD958-X   SET SECOND HALF SWITCH      J0503510
                          MDX     DD300     BRANCH                      J0503520
                    *                                                   J0503530
                    *   GET INFORMATION FROM HEADER                     J0503540
                    *                                                   J0503550
                    DD320 LDX  I3 NEXT+C    REGISTER 3 POINTS AT BUFFER J0503560
                          LD    3 12                                    J0503570
                          STO   2 DD942-X   GET EXECUTION ADDRESS       J0503580
                          LD    3 1                                     J0503590
                          STO   2 DD936-X   GET PUNCH ADDRESS VALUE     J0503600
                          SLA     16                                2-1 J0503610
                          STO   3 2         ZERO THE OLD CHECKSUM   2-1 J0503620
                          LD    3 8         GET WD 8 OF HEADER      2-1 J0503630
                          BSC     +-        SKIP IF DB CNT INSERTED 2-8 J0503640
                          LD    2 DD965-X   GET DB COUNT OF PROGRAM 2-1 J0503650
                          STO   3 8         INSERT INTO WD 8        2-1 J0503660
                    *                                               2-4 J0503670
                    DD325 LD    3 3         GET WORD 3              2-4 J0503680
                          SLA     4         SHIFT OUT               2-4 J0503690
                          SRA     4         *         SUBTYPE       2-4 J0503700
                          STO   3 3         *AND CHANGE WORD 3      2-4 J0503710
                    *                                               2-2 J0503720
                    DD327 LD    1 WSSW      CHECK IF FROM WS        2-2 J0503730
                          BSC  L  DD330,+-  BRANCH IF NOT           2-2 J0503740
                          LDD   1 #NAME     GET NAME ON CTRL CARD   2-2 J0503750
                          STO   3 10                                2-2 J0503760
                          RTE     16        CHANGE THE NAME         2-2 J0503770
                          STO   3 11                                2-2 J0503780
                    *                                                   J0503790
                    *   SET WORD COUNT TO ZERO                          J0503800
                    *                                                   J0503810
                    DD330 LD    1 NEXT                                  J0503820
                          A     2 DD977-X                               J0503830
                          STO   2 DD940-X   POINT AT FIRST DATA WORD    J0503840
                    *                                                   J0503850
                    *   INDICATE PROGRAM TO BE PUNCHED IS DSF           J0503860
                    *                                                   J0503870
                          SLA     16                                    J0503880
                          STO   2 DD923-X   INDICATE DSF PROGRAM        J0503890
                          BSI  L  XP001     LINK TO PUNCH RECORD        J0503900
                    *                                                   J0503910
                    *   TEST TO SEE IF WORKING STORAGE IS USED AT ALL   J0503920
                    *                                                   J0503930
                    DD340 LD    1 WSSW                                  J0503940
                          BSC     +-        BRANCH IF PROG IN WS    2-8 J0503950
                    *                                                   J0503960
                    *    TEST IF DUMP DATA                              J0503970
                    *                                                   J0503980
                          LD    1 DATSW                                 J0503990
                          BSC  L  DD400,Z   BRANCH IF DUMP DATA         J0504000
                    *                                                   J0504010
                          LD    1 #NAME     CHECK FORMAT BITS       2-6 J0504020
                          SLA     1         *FOR CORE IMAGE         2-6 J0504030
                          BSC     C         SKIP IF DSF FORMAT      2-6 J0504040
                          MDX     DD400     CI FORMAT, BRANCH       2-6 J0504050
                    *                                               2-6 J0504060
                    *   INDICATE THAT THE PROGRAM IS TO BE PLACED IN    J0504070
                    *   WORKING STORAGE                                 J0504080
                    *                                                   J0504090
                    DD360 STX  L0 DD955     SET TO WS SWITCH ON         J0504100
                          MDX     DD400                                 J0504110
                    *                                                   J0504120
                    *   INDICATE THE PRINTER IS TO BE USED              J0504130
                    *                                                   J0504140
                    DD380 STX  L0 DD956     SET PRINTER SWITCH ON       J0504150
                    *                                                   J0504160
                    *   TEST TO SEE IF PROGRAM IS IN CORE IMAGE FORMAT  J0504170
                    *                                                   J0504180
                          LD    1 #NAME     LOAD 1ST WORD OF LET NAME   J0504190
                          SLA     1                                     J0504200
                          BSC     C         SKIP IF DSF FORMAT          J0504210
                          BSC     +Z        SKIP IF CORE IMAGE FORMAT   J0504220
                          MDX     DD340     BR IF NOT CORE IMAGE        J0504230
                    *                                                   J0504240
                    *   SET TO PRINT CORE IMAGE PROGRAM                 J0504250
                    *                                                   J0504260
                          BSI  L  XG000     GET FIRST WORD          2-8 J0504270
                          LDX  I3 LETAR+C   REGISTER 3 POINTS AT BUFFER J0504280
                          LD    1 DATSW     LOAD DATA SWITCH        2-8 J0504290
                          BSC  L  DD390,Z   BRANCH IF DUMP DATA     2-8 J0504300
                    *                                               2-8 J0504310
                    * FOR DCI DUMP USE WD CNT FROM DCI HEADER       2-8 J0504320
                    *                                               2-8 J0504330
                          LD    3 11        GET CORE LOAD LENGTH    2-8 J0504340
                          S     2 DD970-X   SUBTRACT 1              2-8 J0504350
                          BSC  L  DD390,+   USE BLK IF NEG OR ZERO  2-8 J0504360
                          SRT     16                                2-8 J0504370
                          SD    2 DD900-X   SUB WD CNT OF DK BLKS   2-8 J0504380
                          BSC     -         USE MIN OF WD CNT FROM  2-8 J0504390
                          SLT     32        *CORE LD AND DK BLK CNT 2-8 J0504400
                          AD    2 DD900-X   ADD EXISTING WD CNT     2-8 J0504410
                          STD   2 DD900-X   SET WD CNT FOR DCI DUMP 2-8 J0504420
                    DD390 LD    3 8         COMPUTE LINE ADDR       2-8 J0504430
                          AND   2 DD998-X                               J0504440
                          S     2 DD979-X                               J0504450
                          STO   2 DD952-X   STORE LINE ADDRESS          J0504460
                          LD    3 8                                     J0504470
                          STO   2 DD948-X   SET CORE IMAGE SWITCH       J0504480
                          AND   2 DD978-X                               J0504490
                          STO   2 DD946-X   STORE NUMBER OF BLANKS      J0504500
                          BSI  L  XL000     PLACE ON PRINTER            J0504510
                          LD    2 DD955-X   LOAD WS SWITCH              J0504520
                          BSI  L  XW000,Z   BRANCH TO PLACE IN WS       J0504530
                    *                                                   J0504540
                    *   SET THE NEW BLOCK SIZE FOR PRINTED OUTPUT       J0504550
                    *                                                   J0504560
                          LD    2 DD979-X                               J0504570
                          STO   2 DD949-X   LINES PER BLOCK = 16        J0504580
                          MDX     DD340     BRANCH                      J0504590
                    *                                                   J0504600
                    *   THE MAIN SUBROUTINE DRIVER                      J0504610
                    *                                                   J0504620
                    DD400 BSI     XG000     GET DATA FROM DISK      2-8 J0504630
                          LD    2 DD955-X   LOAD WORKING STORAGE SWITCH J0504640
                          BSI  L  XW000,Z   BRANCH TO PLACE IN WS       J0504650
                          LD    2 DD956-X   LOAD PRINT SWITCH           J0504660
                          BSI  L  XL000,Z   BRANCH TO PLACE ON PRINTER  J0504670
                          LD    2 DD957-X   LOAD PUNCH SWITCH           J0504680
                          BSI  L  XF000,Z   BRANCH TO PLACE ON PUNCH    J0504690
                          LD    2 DD922-X   TEST INDICATOR WORD         J0504700
                          S     2 DD972-X                               J0504710
                          BSC  L  DD400,Z   BRANCH IF NOT DONE          J0504720
                    *                                                   J0504730
                    *   TEST TO SEE IF PUNCH FUNCTION                   J0504740
                    *                                                   J0504750
                          LD    2 DD957-X                               J0504760
                          BSC  L  DD410,+-  BRANCH IF NOT PUNCHING      J0504770
                    *                                                   J0504780
                    *   READ IN I/O BLOCK (PHASE 15)                    J0504790
                    *                                                   J0504800
                          LDX  L3 IOADR     POINT AT IOAR HDR           J0504810
                          LDD   1 PIHDR+2                               J0504820
                          STD   3 0         SET IOAR HDR                J0504830
                          BSI  I  GET       GET PRINCIPAL I/O           J0504840
                    *                                                   J0504850
                    *   TEST TO SEE IF DATA IS LEFT IN WORKING STORAGE  J0504860
                    *                                                   J0504870
                    DD410 LD    2 DD967-X   LOAD FROM WS SWITCH         J0504880
                          BSC  L  DD440,Z   BRANCH IF FROM WS           J0504890
                          LD    1 WSSW      LOAD WS SWITCH              J0504900
                          BSC  L  DD420,Z   BRANCH IF DUMP TO WS        J0504910
                          LD    1 DATSW     LOAD DATA SWITCH            J0504920
                          BSC  L  DD440,Z   BRANCH IF WS NOT USED       J0504930
                    *                                                   J0504940
                    *   INDICATE THE CHARACTER OF WORKING STORAGE       J0504950
                    *                                                   J0504960
                    DD420 LD    1 #NAME     LOAD NAME INDICATOR BITS    J0504970
                          SRT     14        FORM -1 OR ZERO             J0504980
                          BSC     E         SKIP IF DSF OR DCI          J0504990
                          SRA     15        FORM +1 FOR DDF             J0505000
                          LDX  I3 DD963     LOAD TO DRIVE               J0505010
                          STO  L3 #FMAT+C   INDICATE WS FORMAT          J0505020
                          LD    2 DD965-X                               J0505030
                          STO  L3 #WSCT+C   STORE WS DB COUNT           J0505040
                    *                                                   J0505050
                    *   FORMAT THE EXITING MESSAGE                      J0505060
                    *                                                   J0505070
                    DD440 LDX  I3 DD964     LOAD FROM DRIVE             J0505080
                          LD   L3 #CIDN+C                               J0505090
                          BSI  I  BINEB                                 J0505100
                          LDD   1 TEMP1                                 J0505110
                          STD     DD898+5   STORE CARTRIDGE ID          J0505120
                          LD    2 DD966-X                               J0505130
                          BSI  I  BINEB                                 J0505140
                          LDD   1 TEMP1                                 J0505150
                          STO     DD898+12  STORE DB ADDRESS (1ST)      J0505160
                          RTE     16                                    J0505170
                          STO     DD898+13  STORE DB ADDRESS (2ND)      J0505180
                    *                                               2-3 J0505190
                          LD    1 PTSW                              2-3 J0505200
                          BSC  L  DD445,+-  BR IF NOT TO PAPER TAPE 2-3 J0505210
                          LDD     DD89X     GET .RCD .              2-3 J0505220
                          STD     DD898+15  MODIFY MESSAGE          2-3 J0505230
                    *                                               2-3 J0505240
                          LD    2 DD965-X   GET DB COUNT            2-3 J0505250
                          M     2 DD982-X   CALC. # OF WORDS       2-12 J0505260
                          AD    2 DD99A-X   INCR TO NEXT REC,IF NEC2-12 J0505265
                          D     2 DD984-X   DIVIDE BY # WDS/REC    2-12 J0505270
                          STO   2 DD965-X   SAVE TEMP               2-9 J0505280
                          LD    2 DD944-X   GET CARD SEQ CNT        2-9 J0505285
                          S     2 DD970-X   IF NON ZERO USE FOR     2-9 J0505290
                          BSC     +         *RCD CNT, ELSE USE SAVE 2-9 J0505300
                    DD445 LD    2 DD965-X   GET DB COUNT            2-3 J0505310
                    DD446 BSI  I  BINEB                                 J0505320
                          LDD   1 TEMP1                                 J0505330
                          STD     DD898+19  STORE DB COUNT              J0505340
                    *                                                   J0505350
                    *   PRINT THE EXITING MESSAGE                       J0505360
                    *                                                   J0505370
                          BSI  I  PRINT     BRANCH TO PRINT MESSAGE     J0505380
                          DC      DD898                                 J0505390
                    *                                                   J0505400
                    *   RESTORE PAGE IF DUMP TO PRINTER                 J0505410
                    *                                                   J0505420
                          LD    2 DD956-X   LOAD PRINT SWITCH           J0505430
                          BSI  I  PAGE,Z    BRANCH TO RESTORE PAGE      J0505440
                    *                                                   J0505450
                    *   EXIT FROM DUMP PROGRAM                          J0505460
                    *                                                   J0505470
                          BSI  I  REST      RETURN TO DUP CONTROL       J0505480
                    *                                                   J0505490
                    *   EXIT MESSAGE                                    J0505500
                    *                                                   J0505510
                          DC      *-*                                   J0505520
                          BSS  E  0                                     J0505530
                          ORG     *-1                                   J0505540
                    DD898 DC      DD899-*   WORD COUNT                  J0505550
                          EBC     .CART ID XXXX  DB ADDR XXXX   DB CN.  J0505560
                          EBC     .T XXXX.                              J0505570
                    DD899 EQU     *         END OF MESSAGE              J0505580
                    DD89X EBC     .RCD .    FOR PAPER TAPE MESSAGE  2-3 J0505590
                          HDNG    DUMP-GET DATA FROM DISK TO DUMP       J0505600
                    *************************************************** J0505610
                    *                                                 * J0505620
                    *FUNCTION-                                        * J0505630
                    *   *THIS SUBROUTINE GETS A SECTOR FROM THE DISK  * J0505640
                    *    AND PLACES IT IN A BUFFER, AND HANDS OUT THE * J0505650
                    *    WORDS FROM THE SECTOR ALONG WITH AN INDICATOR* J0505660
                    *    TELLING THE TYPE OF WORD IT IS.              * J0505670
                    *                                                 * J0505680
                    *ENTRY POINTS-                                    * J0505690
                    *   *XG000-PLACES THE DATA WORD IN DD921 AND THE  * J0505700
                    *    TYPE OF DATA IN DD922                        * J0505710
                    *                                                 * J0505720
                    *INPUT-                                           * J0505730
                    *   *THIS SUBROUTINE READ SECTORS FROM THE USERS  * J0505740
                    *    AREA, FIXED AREA, OR WORKING STORAGE OF THE  * J0505750
                    *    DISK SPECIFIED IN THE FROM FIELD OF          * J0505760
                    *    THE DUP CONTROL RECORD.                      * J0505770
                    *                                                 * J0505780
                    *OUTPUT-                                          * J0505790
                    *   *N/A                                          * J0505800
                    *                                                 * J0505810
                    *EXTERNAL REFERANCES-                             * J0505820
                    *   *DD921-THIS WORD HOLDS THE DATA WORD THAT IS  * J0505830
                    *    BEING GIVEN OUT.                             * J0505840
                    *       INITIALIZED BY THIS SUBROUTINE.           * J0505850
                    *                                                 * J0505860
                    *   *DD922-THIS WORD TELLS THE TYPE OF DATA THAT  * J0505870
                    *    DD921 IS.                                    * J0505880
                    *       0 = DATA WORD.                            * J0505890
                    *       1 = INDICATOR WORD (IF DSF).              * J0505900
                    *       2 = PROGRAM HEADER WORD (IF DSF).         * J0505910
                    *       3 = LAST WORD OF DATA.                    * J0505920
                    *       INITIALIZED BY THIS SUBROUTINE.           * J0505930
                    *                                                 * J0505940
                    *   *DD923-THIS WORD INDICATES IF THE FUNCTION IS * J0505950
                    *    BY WORD COUNT.                               * J0505960
                    *       0 = NOT BY WORD COUNT.                    * J0505970
                    *       NOT 0 = BY WORD COUNT.                    * J0505980
                    *       INITIALIZED BY DUMP MAINLINE.             * J0505990
                    *                                                 * J0506000
                    *   *GET  -THIS SUBR IN DUPCO READS THE BUFFER    * J0506010
                    *    FROM THE DISK.                               * J0506020
                    *                                                 * J0506030
                    *EXITS-NORMAL-                                    * J0506040
                    *   *THE NORMAL EXIT IS TO THE WORD FOLLOWING THE * J0506050
                    *    BSI INSTRUCTION THAT CALLED THIS SUBROUTINE. * J0506060
                    *                                                 * J0506070
                    *EXITS-ERRORS-                                    * J0506080
                    *   *N/A                                          * J0506090
                    *                                                 * J0506100
                    *TABLES/WORK AREAS-                               * J0506110
                    *   *DD900-THIS IS A DOUBLE WORD THAT HOLDS THE   * J0506120
                    *    WORD COUNT IF THE DUMP FUNCTION IS BY WORD   * J0506130
                    *    COUNT.                                       * J0506140
                    *       INITIALIZED BY DUMP MAINLINE.             * J0506150
                    *       MAINTAINED BY THIS SUBROUTINE.            * J0506160
                    *                                                 * J0506170
                    *   *DD924-THIS WORD IS A SWITCH THAT TELLS WHEN  * J0506180
                    *    TO READ SOME MORE DATA FROM THE DISK.        * J0506190
                    *       0 = READ IN NEXT SECTOR.                  * J0506200
                    *       NOT 0 # SECTOR IS IN CORE.                * J0506210
                    *       INITIALIZED BY DUMP MAINLINE.             * J0506220
                    *       MAINTAINED BY THIS SUBROUTINE.            * J0506230
                    *                                                 * J0506240
                    *   *DD925-THIS WORD HOLDS THE ADDRESS OF THE NEXT* J0506250
                    *    WORD TO BE GIVEN.                            * J0506260
                    *       INITIALIZED BY DUMP MAINLINE.             * J0506270
                    *       MAINTAINED BY THIS SUBROUTINE.            * J0506280
                    *                                                 * J0506290
                    *   *DD926-THIS WORD HOLDS THE COUNT OF THE       * J0506300
                    *    NUMBER OF WORDS STILL PRESENT IN THE BUFFER. * J0506310
                    *       INITIALIZED BY DUMP MAINLINE              * J0506320
                    *       MAINTAINED BY THIS SUBROUTINE.            * J0506330
                    *                                                 * J0506340
                    *   *DD927-THIS WORD HOLDS THE COUNT OF THE       * J0506350
                    *    NUMBER OF WORDS TO THE NEXT PROGRAM HEADER   * J0506360
                    *    IF THE DUMP FUNCTION IS NOT BY WORD COUNT.   * J0506370
                    *       INITIALIZED BY DUMP MAINLINE.             * J0506380
                    *       MAINTAINED BY THIS SUBROUTINE.            * J0506390
                    *                                                 * J0506400
                    *   *DD928-THIS WORD IS A SWITCH TO INDICATE IF   * J0506410
                    *    THE NEXT PROGRAM HEADER WORD IS THE FIRST OR * J0506420
                    *    SECOND WORD OF A PROGRAM HEADER IF THE DUMP  * J0506430
                    *    FUNCTION IS NOT BY WORD COUNT.               * J0506440
                    *       0 = NEXT IS FIRST WORD.                   * J0506450
                    *       NOT 0 = NEXT IS SECOND WORD.              * J0506460
                    *       INITIALIZED BY DUMP MAINLINE.             * J0506470
                    *       MAINTAINED BY THIS SUBROUTINE.            * J0506480
                    *                                                 * J0506490
                    *   *DD929-THIS WORD HOLDS THE COUNT OF THE       * J0506500
                    *    NUMBER OF WORDS TO THE NEXT INDICATOR WORD IF* J0506510
                    *    THE DUMP FUNCTION IS NOT BY WORD COUNT       * J0506520
                    *       MAINTAINED BY THIS SUBROUTINE.            * J0506530
                    *                                                 * J0506540
                    *   *LETAR-THIS WORD HOLDS THE ADDRESS OF A 322   * J0506550
                    *    WORD BUFFER THAT IS USED TO HOLD THE DATA    * J0506560
                    *    FROM THE DISK. THIS WORD IS LOCATED IN DUPCO.* J0506570
                    *       IOAR HEADER INITIALIZED BY DUMP MAINLINE. * J0506580
                    *       MAINTAINED BY THIS SUBROUTINE.            * J0506590
                    *                                                 * J0506600
                    *NOTES-                                           * J0506610
                    *   *THE CALLING SEQUENCE TO THIS ROUTINE IS A    * J0506620
                    *    BSI INSTRUCTION TO IT.                       * J0506630
                    *                                                 * J0506640
                    *   *INDEX REGISTER 1 POINTS TO THE LABEL C IN    * J0506650
                    *    DUPCO.                                       * J0506660
                    *                                                 * J0506670
                    *   *INDEX REGISTER 2 POINTS TO THE LABEL X IN THE* J0506680
                    *    MIDDLE OF DUMPS CONSTANTS AND WORKING STORAGE* J0506690
                    *    AREA.                                        * J0506700
                    *                                                 * J0506710
                    *   *INDEX REGISTER 3 IS USED AS A WORKING        * J0506720
                    *    REGISTER SO THE CONTENTS ARE DESTROYED.      * J0506730
                    *                                                 * J0506740
                    *************************************************** J0506750
                          HDNG    DUMP-GET DATA FROM DISK TO DUMP       J0506760
                    *                                                   J0506770
                    *   ENTRY POINT                                     J0506780
                    *                                                   J0506790
                    XG000 DC      *-*       LINK WORD                   J0506800
                    *                                                   J0506810
                    *   CHECK TO SEE IF THE SECTOR IS IN CORE           J0506820
                    *                                                   J0506830
                          LD    2 DD924-X   LOAD IN CORE SWITCH         J0506840
                          BSC  L  XG100,Z   BRANCH IF SECTOR IN CORE    J0506850
                    *                                                   J0506860
                    *   READ IN THE NEXT SECTOR FROM DISK               J0506870
                    *                                                   J0506880
                          LDX  I3 LETAR+C   REGISTER 3 POINTS AT BUFFER J0506890
                          BSI  I  GET       LINK TO GET DISK SECTOR     J0506900
                          LDX  I3 LETAR+C   REGISTER 3 POINTS AT BUFFER J0506910
                          LD    3 1                                     J0506920
                          A     2 DD970-X                               J0506930
                          STO   3 1         INCREMENT SECTOR ADDRESS    J0506940
                          STX  L0 DD924     INDICATE SECTOR IS IN CORE  J0506950
                    *                                                   J0506960
                    *   MOVE DATA WORD FROM SECTOR                      J0506970
                    *                                                   J0506980
                    XG100 LD   I  DD925                                 J0506990
                          STO   2 DD921-X   SAVE WORD FROM SECTOR       J0507000
                          MDX  L  DD925,1   INCREMENT GET ADDRESS       J0507010
                    *                                                   J0507020
                    *   DECREMENT NUMBER OF WORDS LEFT IN BUFFER        J0507030
                    *                                                   J0507040
                          MDX  L  DD926,-1  DECREMENT WORD COUNT        J0507050
                          MDX     XG120     BRANCH IF WORD COUNT NOT 0  J0507060
                    *                                                   J0507070
                    *   INDICATE THAT A NEW SECTOR MUST BE READ         J0507080
                    *                                                   J0507090
                          SLA     16                                    J0507100
                          STO   2 DD924-X   SET IN CORE SWITCH TO 0     J0507110
                    *                                                   J0507120
                    *   INITIALIZE TO READ A NEW SECTOR                 J0507130
                    *                                                   J0507140
                          LD    2 DD989-X                               J0507150
                          STO   2 DD926-X   WORDS PER SECTOR COUNT      J0507160
                          LD    1 LETAR                                 J0507170
                          A     2 DD971-X                               J0507180
                          STO   2 DD925-X   POINTER AT START OF BUFFER  J0507190
                    *                                                   J0507200
                    *   TEST TO SEE IF DATA IS TO BE OBTAINED BY WORD   J0507210
                    *   COUNT                                           J0507220
                    *                                                   J0507230
                    XG120 LD    2 DD923-X   TEST WORD COUNT FUNCTION    J0507240
                          BSC  L  XG140,+-  BRANCH IF NOT               J0507250
                    *                                                   J0507260
                    *   DECREMENT THE DOUBLE WORD WORD COUNT OF DATA TO J0507270
                    *   BE DUMPED BY 1                                  J0507280
                    *                                                   J0507290
                          LDD   2 DD900-X                               J0507300
                          SD    2 DD968-X                               J0507310
                          STD   2 DD900-X   SAVE ADJUSTED WORD COUNT    J0507320
                    *                                                   J0507330
                    *   TEST TO SEE IF THE WORD COUNT HAS BEEN          J0507340
                    *   SATISFIED                                       J0507350
                    *                                                   J0507360
                          BSC     +-        SKIP IF NOT FINISHED        J0507370
                          RTE     16        CHECK Q REGISTER            J0507380
                          BSC  L  XG180,+-  BRANCH IF LAST WORD         J0507390
                          MDX     XG220     BRANCH                      J0507400
                    *                                                   J0507410
                    *   DECREMENT THE COUNT OF WORDS TO NEXT HEADER     J0507420
                    *                                                   J0507430
                    XG140 MDX  L  DD927,-1  DECREMENT COUNT TO HEADER   J0507440
                          MDX     XG200     BRANCH IF WORD COUNT NOT 0  J0507450
                    *                                                   J0507460
                    *   TEST TO SEE IF FIRST OR SECOND WORD OF HEADER   J0507470
                    *   BEING PROCESSED                                 J0507480
                    *                                                   J0507490
                          LD    2 DD928-X   LOAD HEADER SWITCH          J0507500
                          BSC  L  XG160,Z   BRANCH IF 2ND HEADER WORD   J0507510
                    *                                                   J0507520
                    *   INDICATE THAT THE FIRST WORD OF THE HEADER      J0507530
                    *   HAS BEEN PROCESSED                              J0507540
                    *                                                   J0507550
                          STX  L0 DD928     SET 2ND WORD SWITCH NOT = 0 J0507560
                    *                                                   J0507570
                    *   INITIALIZE LENGTH OF HEADER WORD COUNT AND THE  J0507580
                    *   WORD COUNT TO FETCH NEXT INDICATOR WORD         J0507590
                    *                                                   J0507600
                          LD    2 DD970-X                               J0507610
                          STO   2 DD927-X   NEXT HEADER WORD COUNT = 1  J0507620
                          STO   2 DD929-X   NEXT INDICATOR COUNT = 1    J0507630
                    *                                                   J0507640
                    *   INDICATE THAT THE PRESENT WORD IS PART OF A     J0507650
                    *   PROGRAM HEADER                                  J0507660
                    *                                                   J0507670
                          LD    2 DD971-X                               J0507680
                          STO   2 DD922-X   TYPE = 2 (PROGRAM HEADER)   J0507690
                          MDX     XG240     BRANCH                      J0507700
                    *                                                   J0507710
                    *   TEST TO SE IF THIS IS THE END OF PROGRAM        J0507720
                    *   HEADER                                          J0507730
                    *                                                   J0507740
                    XG160 LD    2 DD921-X   LOAD WORD FROM SECTOR       J0507750
                          BSC  L  XG180,+-  BRANCH IF LAST HEADER       J0507760
                    *                                                   J0507770
                    *   PLACE THE WORD COUNT TO THE NEXT PROGRAM HEADER J0507780
                    *                                                   J0507790
                          LD    2 DD921-X   LOAD LENGTH FROM HEADER     J0507800
                          S     2 DD970-X   SUBTRACT 1 FOR HEADER WORDS J0507810
                          STO   2 DD927-X   STORE COUNT TO NEXT HEADER  J0507820
                    *                                                   J0507830
                    *   INDICATE THAT NEXT HEADER WORD INCOUNTERED IS   J0507840
                    *   THE FIRST ONE OF A NEW HEADER                   J0507850
                    *                                                   J0507860
                          SLA     16                                    J0507870
                          STO   2 DD928-X   SET 2ND WORD SWITCH = 0     J0507880
                          MDX     XG240     BRANCH                      J0507890
                    *                                                   J0507900
                    *   INDICATE THE PRESENT WORD IS LAST WORD OF       J0507910
                    *   PROGRAM                                         J0507920
                    *                                                   J0507930
                    XG180 LD    2 DD972-X                               J0507940
                          STO   2 DD922-X   TYPE = 3 (END OF PROGRAM)   J0507950
                          MDX     XG240     BRANCH                      J0507960
                    *                                                   J0507970
                    *   DECREMENT THE WORD COUNT TO THE NEXT INDICATOR  J0507980
                    *   WORD                                            J0507990
                    *                                                   J0508000
                    XG200 MDX  L  DD929,-1  DECREMENT WORD COUNT        J0508010
                          MDX     XG220     BRANCH IF WORD COUNT NOT =0 J0508020
                    *                                                   J0508030
                    *   INDICATE THAT WORD IS AN INDICATOR WORD         J0508040
                    *                                                   J0508050
                          LD    2 DD970-X                               J0508060
                          STO   2 DD922-X   TYPE = 1 (INDICATOR WORD)   J0508070
                    *                                                   J0508080
                    *   INITIALIZE THE WORD COUNT TO THE NEXT INDICATOR J0508090
                    *   WORD                                            J0508100
                    *                                                   J0508110
                          LD    2 DD976-X                               J0508120
                          STO   2 DD929-X   INDICATOR WORD COUNT = 9    J0508130
                          MDX     XG240     BRANCH                      J0508140
                    *                                                   J0508150
                    *   INDICATE THAT THE WORD IS A DATA WORD           J0508160
                    *                                                   J0508170
                    XG220 SLA     16                                    J0508180
                          STO   2 DD922-X   TYPE = 0 (DATA WORD)        J0508190
                    *                                                   J0508200
                    *   RETURN TO THE CALLING PROGRAM                   J0508210
                    *                                                   J0508220
                    XG240 BSC  I  XG000     RETURN                      J0508230
                    *************************************************** J0508240
                    *                                                 * J0508250
                    *                       END OF SOURCE             * J0508260
                    *                                                 * J0508270
                    *************************************************** J0508280
                          HDNG    DUMP-PLACE DATA IN WORKING STORAGE    J0508290
                    *************************************************** J0508300
                    *                                                 * J0508310
                    *FUNCTION-                                        * J0508320
                    *   *THIS SUBROUTINE COLLECTS DATA WORDS INTO A   * J0508330
                    *    BUFFER TO BE PLACED IN WORKING STORAGE ON THE* J0508340
                    *    SPECIFIED DRIVE.                             * J0508350
                    *                                                 * J0508360
                    *ENTRY POINT-                                     * J0508370
                    *   *XW000-TAKES THE DATA FROM DD921 AND PLACES IT* J0508380
                    *    IN A BUFFER TO WRITE INTO WORKING STORAGE.   * J0508390
                    *                                                 * J0508400
                    *INPUT-                                           * J0508410
                    *   *N/A                                          * J0508420
                    *                                                 * J0508430
                    *OUTPUT-                                          * J0508440
                    *   *THIS SUBROUTINE WRITES SECTORS OF DATA TO    * J0508450
                    *    WORKING STORAGE ON THE SPECIFIED DRIVE.      * J0508460
                    *                                                 * J0508470
                    *EXTERNAL REFERANCES-                             * J0508480
                    *   *DD921-THIS WORD HOLDS THE DATA WORD THAT IS  * J0508490
                    *    TO BE PLACED IN THE BUFFER AND ON THE DISK.  * J0508500
                    *       INITIALIZED BY XG000.                     * J0508510
                    *                                                 * J0508520
                    *   *DD922-THIS WORD INDICATES THE TYPE ON DD921. * J0508530
                    *    IF DD922 IS EQUAL TO 3 THEN DD921 IS THE     * J0508540
                    *    LAST WORD OF THE DATA.                       * J0508550
                    *       INITIALIZED BY XG000.                     * J0508560
                    *                                                 * J0508570
                    *   *PUT  -THIS SUBR IN DUPCO WRITES THE          * J0508580
                    *    BUFFER ON THE DISK.                          * J0508590
                    *                                                 * J0508600
                    *EXITS-NORMAL-                                    * J0508610
                    *   *THE NORMAL EXIT IS TO THE WORD FOLLOWING THE * J0508620
                    *    BSI INSTRUCTION THAT CALLED THIS SUBROUTINE. * J0508630
                    *                                                 * J0508640
                    *EXITS-ERRORS-                                    * J0508650
                    *   *N/A                                          * J0508660
                    *                                                 * J0508670
                    *TABLES/WORK AREAS-                               * J0508680
                    *   *DD930-THIS WORD HOLDS THE COUNT OF THE       * J0508690
                    *    NUMBER WORDS STILL UNFILLED IN THE BUFFER.   * J0508700
                    *        INITIALIZED BY DUMP MAINLINE.            * J0508710
                    *       MAINTAINED BY THIS SUBROUTINE.            * J0508720
                    *                                                 * J0508730
                    *   *DD931-THIS WORD HOLDS THE ADDRESS OF THE NEXT* J0508740
                    *    WORD IN THE BUFFER TO RECEIVE THE DATA FROM  * J0508750
                    *    DD921.                                       * J0508760
                    *        INITIALIZED BY DUMP MAINLINE.            * J0508770
                    *       MAINTAINED BY THIS SUBROUTINE.            * J0508780
                    *                                                 * J0508790
                    *   *SDBUF-THIS WORD HOLDS THE ADDRESS OF A  322  * J0508800
                    *    WORD BUFFER THAT IS USED TO HOLD THE DATA    * J0508810
                    *    GOING TO THE DISK. THIS WORD IS LOCATED IN   * J0508820
                    *    DUPCO.                                       * J0508830
                    *       IOAR HEADER INITIALIZED BY DUMP MAINLINE. * J0508840
                    *       MAINTAINED BY THIS SUBROUTINE.            * J0508850
                    *                                                 * J0508860
                    *NOTES-                                           * J0508870
                    *   *THE CALLING SEQUENCE TO THIS ROUTINE IS A    * J0508880
                    *    BSI INSTRUCTION TO IT.                       * J0508890
                    *                                                 * J0508900
                    *   *INDEX REGISTER 1 POINTS AT THE LABEL C IN    * J0508910
                    *    DUPCO.                                       * J0508920
                    *                                                 * J0508930
                    *   *INDEX REGISTER 2 POINTS AT THE LABEL X IN THE* J0508940
                    *    MIDDLE OF DUMPS CONSTANTS AND WORKING STORAGE* J0508950
                    *    AREA.                                        * J0508960
                    *                                                 * J0508970
                    *   *INDEX REGISTER 3 IS USED AS A WORKING        * J0508980
                    *    REGISTER SO THE CONTENTS ARE DESTROYED.      * J0508990
                    *                                                 * J0509000
                    *************************************************** J0509010
                          HDNG    DUMP-PLACE DATA IN WORKING STORAGE    J0509020
                    *                                                   J0509030
                    *   ENTRY POINT                                     J0509040
                    *                                                   J0509050
                    XW000 DC      *-*       LINK WORD                   J0509060
                    *                                                   J0509070
                    *   PLACE WORD IN BUFFER TO PLACE IN WORKING        J0509080
                    *   STORAGE.                                        J0509090
                    *                                                   J0509100
                          LD    2 DD921-X   LOAD WORD TO PLACE IN WS    J0509110
                          STO  I  DD931     STORE IN BUFFER             J0509120
                          MDX  L  DD931,1   INCREMENT ADDRESS BY 1      J0509130
                    *                                                   J0509140
                    *   TEST TO SEE IF ALL DATA HAS BEEN TRANSFERED     J0509150
                    *                                                   J0509160
                          LD    2 DD922-X   LOAD DATA TYPE WORD         J0509170
                          S     2 DD972-X   CHECK FOR END OF DATA       J0509180
                          BSC  L  XW050,+-  BR TO WRITE LAST SCTR   2-4 J0509190
                    *                                                   J0509200
                    *   CHECK TO SEE IF THE BUFFER IS FULL              J0509210
                    *                                                   J0509220
                          MDX  L  DD930,-1  DECREMENT WORD COUNT        J0509230
                          MDX     XW120     BRANCH IF WORD COUNT NOT 0  J0509240
                    XW050 LDX  I3 SDBUF+C   REGISTER 3 POINTS AT BUFFER J0509250
                          LD    2 DD920-X                               J0509260
                          BSC  L  XW100,Z   BRANCH IF NOT 1ST FULL BFR  J0509270
                          STX  L0 DD920     SET FIRST BFR FULL SW       J0509280
                    *                                                   J0509290
                    *   CHECK TO SEE IF A DSF PROGRAM                   J0509300
                    *                                                   J0509310
                          LD    1 #NAME     CHECK TYPE OF UA/FXA ENTRY  J0509320
                          BSC     +         SKIP IF DSF             2-4 J0509330
                          MDX     XW100                                 J0509340
                    *                                                 * J0509350
                    *   CHECK TO SEE IF MAINLINE PROGRAM              * J0509360
                    *                                                 * J0509370
                          LD    3 +4                                    J0509380
                          SRA     8         SHIFT TO CK IF TYPE 2   2-4 J0509390
                          S     2 DD971-X                               J0509400
                          BSC  L  XW100,-Z  BRANCH IF NOT A MAINLINE    J0509410
                    *                                                 * J0509420
                    *   CLEAR MAINLINE NAME IN HEADER                 * J0509430
                    *                                                 * J0509440
                          SLA     16                                    J0509450
                          STO   3 +11       WORD 1 OF NAME              J0509460
                          STO   3 +12       WORD 2 OF NAME              J0509470
                    *                                                   J0509480
                    *   WRITE THE BUFFER TO WORKING STORAGE             J0509490
                    *                                                   J0509500
                    XW100 LDX  I3 SDBUF+C   REGISTER 3 POINTS AT BUFFER J0509510
                          BSI  I  PUT       LINK TO PLACE ON DISK       J0509520
                          LDX  I3 SDBUF+C   REGISTER 3 POINTS AT BUFFER J0509530
                          LD    3 1                                     J0509540
                          A     2 DD970-X                               J0509550
                          STO   3 1         INCREMENT SECTOR ADDRESS    J0509560
                    *                                                   J0509570
                    *   INITIALIZE TO CREATE NEXT BUFFER                J0509580
                    *                                                   J0509590
                          LD    1 SDBUF                                 J0509600
                          A     2 DD971-X                               J0509610
                          STO   2 DD931-X   POINTER AT START OF BUFFER  J0509620
                          LD    2 DD989-X                               J0509630
                          STO   2 DD930-X   WORD PER SECTOR COUNT       J0509640
                    *                                                   J0509650
                    *   RETURN TO CALLING PROGRAM                       J0509660
                    *                                                   J0509670
                    XW120 BSC  I  XW000     RETURN                      J0509680
                    *************************************************** J0509690
                    *                                                 * J0509700
                    *                  END OF SOURCE                  * J0509710
                    *                                                 * J0509720
                    *************************************************** J0509730
                          HDNG    DUMP-FORMAT THE PUNCHED OUTPUT        J0509740
                    *************************************************** J0509750
                    *                                                 * J0509760
                    *FUNCTION-                                        * J0509770
                    *   *THIS SUBROUTINE FORMATS THE DATA INTO PUNCHED* J0509780
                    *    OUTPUT RECORDS AND CALLS XP000 OR XP001 TO   * J0509790
                    *    OUTPUT THE RECORDS. IF THE DUMP FUNCTION IS  * J0509800
                    *    BY WORD COUNT THE RECORDS ARE FORMATED INTO  * J0509810
                    *    THE DATA FORMAT, AND IF NOT THE RECORDS ARE  * J0509820
                    *    FORMATED INTO RELOCATABLE OBJECT DECKS.      * J0509830
                    *                                                 * J0509840
                    *ENTRY POINTS-                                    * J0509850
                    *   *XF000-THIS ROUTINE FORMATS THE PUNCHED OUTPUT* J0509860
                    *    AND DIRECTS ITS PUNCHING.                    * J0509870
                    *                                                 * J0509880
                    *INPUT-                                           * J0509890
                    *   *N/A                                          * J0509900
                    *                                                 * J0509910
                    *OUTPUT-                                          * J0509920
                    *   *THIS ROUTINE DIRECTS RECORDS TO BE PUNCHED ON* J0509930
                    *    ETHER CARDS OR PAPER TAPE.                   * J0509940
                    *                                                 * J0509950
                    *EXTERNAL REFERANCES-                             * J0509960
                    *   *DD921-THIS WORD HOLDS THE DATA THAT IS TO BE * J0509970
                    *    PLACED IN THE PUNCHED OUTPUT RECORDS.        * J0509980
                    *       INITIALIZED BY XG000.                     * J0509990
                    *                                                 * J0510000
                    *   *DD922-THIS WORD HOLDS THE TYPE OF DATA THAT  * J0510010
                    *    IS IN DD921.                                 * J0510020
                    *       0 = DATA WORD.                            * J0510030
                    *       1 = INDICATOR WORD (IF DSF).              * J0510040
                    *       2 = PROGRAM HEADER WORD (IF DSF).         * J0510050
                    *       3 = LAST WORD OF DATA.                    * J0510060
                    *       INITIALIZED BY XG000.                     * J0510070
                    *                                                 * J0510080
                    *   *DD923-THIS WORD INDICATES IF THE FUNCTION IS * J0510090
                    *    BY WORD OUTPUT.                              * J0510100
                    *       0 = NOT BY WORD COUNT.                    * J0510110
                    *       NOT 0 = BY WORD COUNT.                    * J0510120
                    *       INITIALIZED BY DUMP MAINLINE.             * J0510130
                    *                                                 * J0510140
                    *   *DD936-THIS WORD HOLDS THE ADDRESS THAT IS TO * J0510150
                    *    BE PLACED IN THE NEXT RECORD TO BE PUNCHED   * J0510160
                    *    IF THE DUMP FUNCTION IS NOT BY WORD COUNT.   * J0510170
                    *       MAINTAINED BY THIS SUBROUTINE.            * J0510180
                    *                                                 * J0510190
                    *   *DD942-THIS WORD HOLDS THE EXECUTION ADDRESS  * J0510200
                    *    OF THE PROGRAM IF THE DUMP FUNCTION IS NOT BY* J0510210
                    *    WORD COUNT.                                  * J0510220
                    *       INITIALIZE BY DUMP MAINLINE.              * J0510230
                    *                                                 * J0510240
                    *   *XP000-THIS ROUTINE IN DUMP PUNCHS            * J0510250
                    *    DATA FORMATED OUTPUT ON THE DEVICE SPECIFIED.* J0510260
                    *                                                 * J0510270
                    *   *XP001-THIS ROUTINE IN DUMP PUNCHS RELOCATABLE* J0510280
                    *    FORMATED OUTPUT ON THE DEVICE SPECIFIED.     * J0510290
                    *                                                 * J0510300
                    *EXITS-NORMAL-                                    * J0510310
                    *   *THE NORMAL EXIT IS TO THE WORD FOLLOWING THE * J0510320
                    *    BSI INSTRUCTION THAT CALLED THIS SUBROUTINE. * J0510330
                    *                                                 * J0510340
                    *EXITS-ERRORS-                                    * J0510350
                    *   *N/A                                          * J0510360
                    *                                                 * J0510370
                    *TABLES/WORK AREAS-                               * J0510380
                    *   *DD932-THIS WORD HOLDS THE 8 SETS OF INDICATOR* J0510390
                    *    BITS FOR A BLOCK OF 8 DATA WORDS IF DUMP     * J0510400
                    *    FUNCTION IS NOT BY WORD COUNT.               * J0510410
                    *       MAINTAINED BY THIS SUBROUTINE.            * J0510420
                    *                                                 * J0510430
                    *   *DD933-THIS WORD HOLDS THE SHIFT COUNT NEEDED * J0510440
                    *    TO GET THE NEXT SET OF INDICATOR BITS FROM   * J0510450
                    *    DD932 IF THE DUMP FUNCTION IS NOT BY WORD    * J0510460
                    *    COUNT.                                       * J0510470
                    *       MAINTAINED BY THIS SUBROUTINE.            * J0510480
                    *                                                 * J0510490
                    *   *DD934-THIS WORD IS A SWITCH TO INDICATE IF   * J0510500
                    *    THE NEXT PROGRAM HEADER WORD IS THE FIRST OR * J0510510
                    *    SECOND WORD OF A PROGRAM HEADER IF THE DUMP  * J0510520
                    *    FUNCTION IS NOT BY WORD COUNT.               * J0510530
                    *       0 = NEXT IS FIRST WORD.                   * J0510540
                    *       NOT 0 = NEXT IS SECOND WORD.              * J0510550
                    *       INITIALIZED BY DUMP MAINLINE.             * J0510560
                    *       MAINTAINED BY THIS SUBROUTINE.            * J0510570
                    *                                                 * J0510580
                    *   *DD935-THIS WORD IS A SWITCH TO INDICATE IF   * J0510590
                    *    THE FIRST PROGRAM HEADER HAS PASSED IF DUMP  * J0510600
                    *    FUNCTION IS NOT BY WORD COUNT.               * J0510610
                    *       0 = FIRST HEADER NOT PASSED.              * J0510620
                    *       NOT 0 = FIRST HEADER HAS PASSED.          * J0510630
                    *       INITIALIZED BY DUMP MAINLINE.             * J0510640
                    *       MAINTAINED BY THIS SUBROUTINE.            * J0510650
                    *                                                 * J0510660
                    *   *DD937-THIS WORD HOLDS THE RELATIVE ADDRESS OF* J0510670
                    *    THE NEXT WORD TO BE RECEIVED IF THE FUNCTION * J0510680
                    *    IS NOT BY WORD COUNT.                        * J0510690
                    *       MAINTAINED BY THIS SUBROUTINE.            * J0510700
                    *                                                 * J0510710
                    *   *DD938-THIS WORD HOLDS THE SHIFT COUNT NEEDED * J0510720
                    *    TO PLACE THE INDICATOR BITS IN DD939 INTO    * J0510730
                    *    THE WORD REFERANCED BY DD941 IF THE DUMP     * J0510740
                    *    FUNCTION IS NOT BY WORD COUNT.               * J0510750
                    *       INITIALIZED BY DUMP MAINLINE AND XP001.   * J0510760
                    *       MAINTAINED BY THIS SUBROUTINE.            * J0510770
                    *                                                 * J0510780
                    *   *DD939-THIS WORD HOLDS THE INDICATOR BIT FOR  * J0510790
                    *    THE DATA HELD BY DD921 IF THE DUMP FUNCTION  * J0510800
                    *    IS NOT BY WORD COUNT.                        * J0510810
                    *       MAINTAINED BY THIS SUBROUTINE.            * J0510820
                    *                                                 * J0510830
                    *   *DD940-THIS WORD HOLDS THE ADDRESS IN THE     * J0510840
                    *    RECORD WHERE DD921 IS TO BE PLACED.          * J0510850
                    *       INITIALIZED BY DUMP MAINLINE AND XP001.   * J0510860
                    *       MAINTAINED BY THIS SUBROUTINE.            * J0510870
                    *                                                 * J0510880
                    *   *DD941-THIS WORD HOLDS THE ADDRESS OF THE     * J0510890
                    *    PRESENT INDICATOR WORD BEING FILLED IN THE   * J0510900
                    *    RECORD IF THE DUMP FUNCTION IS NOT BY WORD   * J0510910
                    *    COUNT.                                       * J0510920
                    *       INITIALIZED BY DUMP MAINLINE AND XP001.   * J0510930
                    *       MAINTAINED BY THIS SUBROUTINE.            * J0510940
                    *                                                 * J0510950
                    *NOTES-                                           * J0510960
                    *   *THE CALLING SEQUENCE TO THIS SUBROUTINE IS A * J0510970
                    *    BSI INSTRUCTION TO IT.                       * J0510980
                    *                                                 * J0510990
                    *   *INDEX REGISTER 1 POINTS AT THE LABEL C IN    * J0511000
                    *    DUPCO.                                       * J0511010
                    *                                                 * J0511020
                    *   *INDEX REGISTER 2 POINTS AT THE LABEL X IN THE* J0511030
                    *    MIDDLE OF DUMPS CONSTANTS AND WORKING STORAGE* J0511040
                    *    AREA.                                        * J0511050
                    *                                                 * J0511060
                    *   *INDEX REGISTER 3 IS USED AS A WORKING        * J0511070
                    *    REGISTER SO THE CONTENTS ARE DESTROYED.      * J0511080
                    *                                                 * J0511090
                    *************************************************** J0511100
                          HDNG    DUMP-FORMAT THE PUNCHED OUTPUT        J0511110
                    *                                                   J0511120
                    *   ENTRY POINT                                     J0511130
                    *                                                   J0511140
                    XF000 DC      *-*       LINK WORD                   J0511150
                    *                                                   J0511160
                    *   CHECK TO SEE IF WORD COUNT TYPE DUMP            J0511170
                    *                                                   J0511180
                          LD    2 DD923-X                               J0511190
                          BSC  L  XF260,Z   BRANCH IF DUMP BY WORD CNT  J0511200
                    *                                                   J0511210
                    *   BRANCH TO THE CORRECT ROUTINE DEPENDING ON THE  J0511220
                    *   VALUE OF THE TYPE OF DATA                       J0511230
                    *                                                   J0511240
                          LDX  I3 DD922     REGISTER 3 HOLDS DATA TYPE  J0511250
                          BSC  I3 *         BRANCH TO ROUTINE           J0511260
                          DC      XF200     O = DATA WORD               J0511270
                          DC      XF100     1 = INDICATOR WORD          J0511280
                          DC      XF120     2 = HEADER WORD             J0511290
                          DC      XF240     3 = END OF PROGRAM WORD     J0511300
                    *                                                   J0511310
                    *   SAVE THE INDICATOR BITS FOR NEXT 8 WORDS        J0511320
                    *                                                   J0511330
                    XF100 LD    2 DD921-X                               J0511340
                          STO   2 DD932-X   SAVE INDICATOR BITS         J0511350
                    *                                                   J0511360
                    *   INITIALIZE SHIFT COUNTER TO FIND THE BITS       J0511370
                    *                                                   J0511380
                          SLA     16                                    J0511390
                          STO   2 DD933-X   SHIFT COUNT = 0             J0511400
                          MDX     XF140     BRANCH                      J0511410
                    *                                                   J0511420
                    *   TEST TO SEE IF THIS IS THE FIRST WORD OF A      J0511430
                    *   PROGRAM HEADER                                  J0511440
                    *                                                   J0511450
                    XF120 LD    2 DD934-X   LOAD FIRST HEADER SWITCH    J0511460
                          BSC  L  XF180,Z   BRANCH IF 2ND HEADER WORD   J0511470
                    *                                                   J0511480
                    *   SET THE SWITCH TO INDICATE NEXT HEADER WORD     J0511490
                    *   IS SECOND                                       J0511500
                    *                                                   J0511510
                          STX  L0 DD934     SET FIRST HEADER WORD SW    J0511520
                    *                                                   J0511530
                    *   TEST TO SEE IF THIS IS THE FIRST DATA HEADER    J0511540
                    *                                                   J0511550
                          LD    2 DD935-X   LOAD FIRST HEADER SWITCH    J0511560
                          BSC  L  XF160,Z   BRANCH IF NOT FIRST HEADER  J0511570
                    *                                                   J0511580
                    *   SAVE FIRST LOCATION OF PROGRAM                  J0511590
                    *                                                   J0511600
                          LD    2 DD921-X                               J0511610
                          STO   2 DD937-X   SET LOCATION COUNTER        J0511620
                          STO   2 DD936-X   SET PUNCH ADDRESS           J0511630
                    *                                                   J0511640
                    *   SET THE SWITCH TO INDICATE THAT FIRST HEADER    J0511650
                    *   HAS PASSED                                      J0511660
                    *                                                   J0511670
                          STX  L0 DD935     SET FIRST HEADER SWITCH     J0511680
                    *                                                   J0511690
                    *   RETURN TO THE CALLING PROGRAM                   J0511700
                    *                                                   J0511710
                    XF140 BSC  I  XF000     RETURN                      J0511720
                    *                                                   J0511730
                    *   CHECK TO SEE IF THERE IS A SEQUENCE BREAK AND   J0511740
                    *   IF SO PUNCH THE CARD BUFFER                     J0511750
                    *                                                   J0511760
                    XF160 LD    2 DD921-X   LOAD NEW DATA ADDRESS       J0511770
                          S     2 DD937-X   CHECK WITH EXPECTED         J0511780
                          BSC  L  XF140,+-  BRANCH TO NOT PUNCH         J0511790
                    *                                                   J0511800
                    *   CHECK IF NO DATA ON CARD                        J0511810
                    *                                                   J0511820
                          LD    2 DD940-X                               J0511830
                          S     1 NEXT                                  J0511840
                          S     2 DD977-X                               J0511850
                          BSC  L  XF166,Z   PUNCH IF DATA ON CARD   2-8 J0511860
                    *                                                   J0511870
                          LD    2 DD935-X   LOAD FIRST HDR SWITCH   2-7 J0511880
                          BSC  L  XF170,+   BRANCH IF NOT 2ND HDR   2-7 J0511890
                    XF166 LD      *-1       SET 1ST HDR SW NEG TO   2-8 J0511900
                          STO   2 DD935-X   *INDICATE 2ND HDR       2-7 J0511910
                          BSI  L  XP001     GO TO PUNCH CARD        2-7 J0511920
                    *                                               2-7 J0511930
                    *   SAVE THE NEW LOCATION ADDRESS                   J0511940
                    *                                                   J0511950
                    XF170 LD    2 DD921-X                               J0511960
                          STO   2 DD937-X   SET LOCATION COUNTER        J0511970
                          STO   2 DD936-X   SET PUNCH ADDRESS           J0511980
                          MDX     XF140     BRANCH                      J0511990
                    *                                                   J0512000
                    *   SET SWITCH TO INDICATE THAT THE NEXT HEADER     J0512010
                    *   WORD IS THE FIRST OF A SET                      J0512020
                    *                                                   J0512030
                    XF180 SLA     16                                    J0512040
                          STO   2 DD934-X   FIRST HEADER WORD SWITCH =0 J0512050
                          MDX     XF140     BRANCH                      J0512060
                    *                                                   J0512070
                    *   GET THE NEXT TWO INDICATOR BITS                 J0512080
                    *                                                   J0512090
                    XF200 LDX  I3 DD933     REGISTER 3 HOLDS SHIFT CNT  J0512100
                          LD    2 DD932-X   LOAD INDICATOR BITS         J0512110
                          SLA   3 0         (XX--------------)          J0512120
                          SRA     14        (00000000000000XX)          J0512130
                          STO   2 DD939-X   SAVE DESIRED BITS           J0512140
                    *                                                   J0512150
                    *   INCREMENT THE SHIFT COUNT TO THE NEXT SET OF    J0512160
                    *   BITS                                            J0512170
                    *                                                   J0512180
                          MDX  L  DD933,2   INCREMENT SHIFT COUNT       J0512190
                    *                                                   J0512200
                    *   IF THE INDICATOR BITS ARE NOT A 2 INCREMENT THE J0512210
                    *   LOCATION ADDRESS                                J0512220
                    *                                                   J0512230
                          LD    2 DD939-X   LOAD INDICATOR BITS         J0512240
                          S     2 DD971-X   CHECK FOR A LIBF (2)        J0512250
                          BSC  L  *+2,+-    BRANCH IF A LIBF            J0512260
                          MDX  L  DD937,1   INCREMENT THE LOCATION ADR  J0512270
                    *                                                   J0512280
                    *   PLACE THE DATA WORD ON THE CARD                 J0512290
                    *                                                   J0512300
                          LD    2 DD921-X   LOAD DATA WORD              J0512310
                          STO  I  DD940     PLACE WORD ON CARD          J0512320
                          MDX  L  DD940,1   INCREMENT PLACEMENT ADDRESS J0512330
                    *                                                   J0512340
                    *   PLACE THE INDICATOR BITS ON CARD                J0512350
                    *                                                   J0512360
                          LDX  I3 DD938     REGISTER 3 HOLDS SHIFT CNT  J0512370
                          SLT     16        CLEAR Q REGISTER TO ZERO    J0512380
                          LD   I  DD941     LOAD INDICATOR WORD         J0512390
                          RTE   3 0         (--------YYYYYYYY/000...)   J0512400
                          SLT     2         (------YYYYYYYY00/000...)   J0512410
                          OR    2 DD939-X   (------YYYYYYYYXX/000...)   J0512420
                          SRT     2         (--------YYYYYYYY/XX0...)   J0512430
                          SLT   3 0         (YYYYYYYYXX000000/000...)   J0512440
                          STO  I  DD941     SAVE NEW INDICATOR WORD     J0512450
                    *                                                   J0512460
                    *   ALTER SHIFT COUNT AND TEST TO SEE IF WORD IS    J0512470
                    *   FULL                                            J0512480
                    *                                                   J0512490
                          MDX  L  DD938,-2  DECREMENT SHIFT COUNT       J0512500
                          MDX     XF220     BRANCH IF SHIFT COUNT NOT=0 J0512510
                    *                                                   J0512520
                    *   INITIALIZE FOR NEXT INDICATOR WORD              J0512530
                    *                                                   J0512540
                          MDX  L  DD941,1   INCREMENT INDICATOR BIT ADR J0512550
                          LD    2 DD979-X                               J0512560
                          STO   2 DD938-X   SET SHIFT COUNT = 16        J0512570
                    *                                                   J0512580
                    *   PUNCH THE CARD IF IT IS FULL OF DATA            J0512590
                    *                                                   J0512600
                    XF220 LD    2 DD940-X   LOAD PLACEMENT ADDRESS      J0512610
                          S     2 DD986-X   CHECK FOR 46TH WORD         J0512620
                          S     1 NEXT      CHECK CORRECT BUFFER        J0512630
                          BSC  L  XF140,Z   BRANCH TO NOT PUNCH         J0512640
                          BSI     XP001     LINK TO PUNCH CARD          J0512650
                          LD    2 DD937-X                               J0512660
                          STO   2 DD936-X   SET PUNCH ADDRESS           J0512670
                          LD      *-1       SET 1ST HDR SW NEG TO  2-11 J0512672
                          STO   2 DD935-X   *INDICATE 2ND HDR      2-11 J0512674
                          MDX     XF140     BRANCH                      J0512680
                    *                                                   J0512690
                    *   PUNCH THE PARTIAL BUFFER IF ONE IS PRESENT      J0512700
                    *                                                   J0512710
                    XF240 LD    2 DD940-X   LOAD PLACEMENT ADDRESS      J0512720
                          S     2 DD977-X   CHECK WITH 10TH WORD        J0512730
                          S     1 NEXT      CHECK CORRECT BUFFER        J0512740
                          BSI  L  XP001,Z   BRANCH TO PUNCH BUFFER      J0512750
                    *                                                   J0512760
                    *   FORMAT AND PUNCH THE TRAILER CARD               J0512770
                    *                                                   J0512780
                          LDX  I3 NEXT+C    REGISTER 3 POINTS AT BUFFER J0512790
                          STX  L3 DD940                                 J0512800
                          MDX  L  DD940,10  MAKE CALCULATED WORD CNT 0  J0512810
                          LD    2 DD992-X                               J0512820
                          STO   3 3         STORE TYPE CODE             J0512830
                          LD    2 DD937-X                               J0512840
                          STO   2 DD936-X   STORE PROGRAM LENGTH        J0512850
                          LD    2 DD942-X                               J0512860
                          STO   3 4         STORE ENTRY ADDRESS         J0512870
                          BSI     XP001     LINK TO PUNCH RECORD        J0512880
                          MDX     XF140     BRANCH                      J0512890
                    *                                                   J0512900
                    *   PLACE THE DATA ON THE CARD                      J0512910
                    *                                                   J0512920
                    XF260 LD    1 EBCSW     IF DUMP EBCDIC ON CARDS 2E2 J0512930
                          BSC  L  XE000,Z   *GO TO SPECIAL ROUTINE  2E2 J0512940
                    *                                               2E2 J0512950
                          LD    2 DD921-X                               J0512960
                          STO  I  DD940     PLACE DATA WORD ON CARD     J0512970
                          MDX  L  DD940,1   INCREMENT PLACEMENT ADDRESS J0512980
                    *                                                   J0512990
                    *   PUNCH THE CARD IF THE LAST DATA WORD            J0513000
                    *                                                   J0513010
                    XF265 LD    2 DD922-X   LOAD TYPE WORD              J0513020
                          S     2 DD972-X   CHECK FOR LAST DATA WORD    J0513030
                          BSC  L  XF270,Z   BRANCH NOT LAST DATA WORD   J0513040
                          BSI     XP000     LINK TO PUNCH RECORD        J0513050
                          MDX     XF140     BRANCH                      J0513060
                    *                                                   J0513070
                    *   PUNCH THE CARD IF IT IS FULL                    J0513080
                    *                                                   J0513090
                    XF270 LD    1 EBCSW                             2E2 J0513100
                          BSC  L  XF280,+-  BRANCH IF NOT DUMPDATA E2E2 J0513110
                          LD    2 DD940-X   CHECK FOR 80TH WORD     2E2 J0513120
                          S     2 DD985-X                           2E2 J0513130
                          MDX     *+2                               2E2 J0513140
                    *                                               2E2 J0513150
                    XF280 LD    2 DD940-X   LOAD PLACEMENT ADDRESS      J0513160
                          S     2 DD986-X   CHECK FOR 55TH WORD         J0513170
                          S     1 NEXT      CHECK CORRECT BUFFER        J0513180
                          BSI  L  XP000,-   BRANCH TO PUNCH CARD        J0513190
                          MDX     XF140     BRANCH                      J0513200
                    *************************************************** J0513210
                    *                                                 * J0513220
                    *                       END OF SOURCE             * J0513230
                    *                                                 * J0513240
                    *************************************************** J0513250
                          HDNG    DUMP-PUNCH THE FORMATED OUTPUT        J0513260
                    *************************************************** J0513270
                    *                                                 * J0513280
                    *FUNCTION-                                        * J0513290
                    *   *THIS SUBROUTINE TAKES THE FORMATED PUNCHED   * J0513300
                    *    OUTPUT BUFFER AND UNPACKS IT TO PLACE ON THE * J0513310
                    *    CARD PUNCH OR PAPER TAPE PUNCH AS SPECIFIED. * J0513320
                    *    THE CORRECT ENTRY POINT WILL PLACE THE WORD  * J0513330
                    *    COUNT, LOAD ADDRESS, AND CHECK SUM. THE CARD * J0513340
                    *    SEQUENCE NUMBERS ARE ALSO INCREMENTED BY THIS* J0513350
                    *    ROUTINE.                                     * J0513360
                    *                                                 * J0513370
                    *ENTRY POINTS-                                    * J0513380
                    *   *XP000-UNPACKS THE BUFFER TO BE PUNCHED.      * J0513390
                    *                                                 * J0513400
                    *   *XP001-PLACES THE CHECK SUM, LOAD ADDRESS, AND* J0513410
                    *    WORD COUNT ON THE RECORDS TO BE PUNCHED. ALSO* J0513420
                    *    UNPACKS THE BUFFER TO BE PUNCHED.            * J0513430
                    *                                                 * J0513440
                    *INPUT-                                           * J0513450
                    *   *IN THE CASE WHERE THE INPUT IS FROM THE 1442 * J0513460
                    *    CARD READER (READING AND PUNCHING ON SAME    * J0513470
                    *    DEVICE) THIS ROUTINE READS THE CARD TO SEE IF* J0513480
                    *    IT IS A BLANK BEFORE PUNCHING ON IT.         * J0513490
                    *                                                 * J0513500
                    *OUTPUT-                                          * J0513510
                    *   *THE PCHBI ROUTINE IN DUPCO IS CALLED TO PUNCH* J0513520
                    *    ETHER CARDS OR PAPER TAPE AS REQUESTED.      * J0513530
                    *                                                 * J0513540
                    *EXTERNAL REFERANCES-                             * J0513550
                    *   *DD923-THIS WORD IS A SWITCH THAT INDICATES   * J0513560
                    *    THAT THE DUMP FUNCTION IS BY WORD COUNT.     * J0513570
                    *       0 = NOT BY WORD COUNT.                    * J0513580
                    *       NOT 0 = BY WORD COUNT.                    * J0513590
                    *       INITIALIZED BY DUMP MAINLINE.             * J0513600
                    *                                                 * J0513610
                    *   *DD941-THIS WORD HOLDS THE ADDRESS OF THE     * J0513620
                    *    INDICATOR WORD TO BE FILLED WITH BITS IF THE * J0513630
                    *    DUMP FUNCTION IS NOT BY WORD COUNT.          * J0513640
                    *       INITIALIZED BY THIS ROUTINE AND DUMP      * J0513650
                    *       MAINLINE.                                 * J0513660
                    *       MAINTAINED BY XF000.                      * J0513670
                    *                                                 * J0513680
                    *   *DD938-THIS WORD HOLDS THE SHIFT COUNT NEEDED * J0513690
                    *    TO PLACE THE INDICATOR BITS INTO DD941 IF THE* J0513700
                    *    DUMP FUNCTION IS NOT BY WORD COUNT.          * J0513710
                    *       INITIALIZED BY THIS ROUTINE AND DUMP      * J0513720
                    *       MAINLINE.                                 * J0513730
                    *       MAINTAINED BY XF000.                      * J0513740
                    *                                                 * J0513750
                    *   *DD936-THIS WORD HOLDS THE ADDRESS TO BE      * J0513760
                    *    PUNCHED IN THE RECORD IF DUMP FUNCTION IS    * J0513770
                    *    NOT BY WORD COUNT.                           * J0513780
                    *       INITIALIZED BY XF000.                     * J0513790
                    *                                                 * J0513800
                    *   *DD940-THIS WORD HOLDS THE ADDRESS IN THE     * J0513810
                    *    RECORD WHERE DD921 IS TO BE PLACED BY XF000. * J0513820
                    *       INITIALIZED BY THIS SUBR AND BY THE DUMP  * J0513830
                    *       MAINLINE.                                 * J0513840
                    *                                                 * J0513850
                    *   *PTSW -THIS WORD LOCATED IN DUPCO IS A SWITCH * J0513860
                    *    TO INDICATE IF THE PUNCHED OUTPUT IS TO BE ON* J0513870
                    *    PAPER TAPE.                                  * J0513880
                    *       0 = NOT PAPER TAPE OUTPUT                 * J0513890
                    *       NOT 0 = PAPER TAPE OUTPUT.                * J0513900
                    *                                                 * J0513910
                    *   *PCHBI-THIS IS A ROUTINE THAT PUNCHS BINARY   * J0513920
                    *    FROM THE BUFFER POINTED AT BY THE WORD(NEXT).* J0513930
                    *    THIS SUBROUTINE IS TO CARD OR PAPER TAPE AS  * J0513940
                    *    SPECIFIED.                                   * J0513950
                    *                                                 * J0513960
                    *   *GETBI-THIS IS A ROUTINE THAT READS BINARY    * J0513970
                    *    INTO THE BUFFER POINTED AT BY THE WORD(THIS).* J0513980
                    *    THIS SUBROUTINE IS FROM CARD OR PAPER TAPE AS* J0513990
                    *    SPECIFIED.                                   * J0514000
                    *                                                 * J0514010
                    *   *RBLNK-THIS WORD IS A SWITCH THAT INDICATES   * J0514020
                    *    IF A BLANK CARD MUST BE READ BEFORE PUNCHING.* J0514030
                    *       0 = 2501 OR PAPER TAPE INPUT.             * J0514040
                    *       NOT 0 = 1442 INPUT.                       * J0514050
                    *                                                 * J0514060
                    *   *PRINT-THIS SUBROUTINE IN DUPCO PRINTS A LINE * J0514070
                    *    ON THE PRINCIPAL PRINT DEVICE.               * J0514080
                    *                                                 * J0514090
                    *   *LINE -THIS SUBROUTINE IN DUPCO SPACES A LINE * J0514100
                    *    ON THE PRINCIPAL PRINT DEVICE.               * J0514110
                    *                                                 * J0514120
                    *   *NEXT -THIS IS A WORD IN DUPCO THAT POINTS AT * J0514130
                    *    A 111 WORD BUFFER TO BE USED TO HOLD THE     * J0514140
                    *    PUNCHED OUTPUT.                              * J0514150
                    *                                                 * J0514160
                    *   *THIS -THIS IS A WORD IN DUPCO THAT POINTS AT * J0514170
                    *    A 81 WORD BUFFER TO BE USED TO CHECK CARDS   * J0514180
                    *    TO SEE THEY ARE BLANK BEFORE PUNCHING INTO   * J0514190
                    *    THEM.                                        * J0514200
                    *                                                 * J0514210
                    *EXITS-NORMAL-                                    * J0514220
                    *   *THE NORMAL EXIT IS TO THE WORD FOLLOWING THE * J0514230
                    *    BSI INSTRUCTION THAT CALLED THIS SUBROUTINE. * J0514240
                    *                                                 * J0514250
                    *EXITS-ERRORS-                                    * J0514260
                    *   *N/A                                          * J0514270
                    *                                                 * J0514280
                    *TABLES/WORK AREAS-                               * J0514290
                    *   *DD943-THIS WORD IS USED TO HOLD A WORD COUNT * J0514300
                    *    DURING THE CALCULATION OF CHECK SUMS AND WHEN* J0514310
                    *    THE BUFFER IS BEING UNPACKED FOR OUTPUTING.  * J0514320
                    *                                                 * J0514330
                    *   *DD944-THIS WORD HOLDS THE RECORD NUMBER OF   * J0514340
                    *    THE RECORD BEING CHECK SUMED NOW.            * J0514350
                    *       INITIALIZED BY DUMP MAINLINE.             * J0514360
                    *       MAINTAINED BY THIS SUBROUTINE.            * J0514370
                    *                                                 * J0514380
                    *   *DD901-THIS DOUBLE WORD HOLDS A COMMAND TO    * J0514390
                    *    SENSE THE DEVICE STATUS WORD OF THE 1442 TO  * J0514400
                    *    DETERMINE THE STATUS.                        * J0514410
                    *                                                 * J0514420
                    *NOTES-                                           * J0514430
                    *   *THE CALLING SEQUENCE TO THIS SUBROUTINE IS A * J0514440
                    *    BSI INSTRUCTION TO ITS ENTRY POINT.          * J0514450
                    *                                                 * J0514460
                    *   *INDEX REGISTER 1 POINTS TO THE LABEL C IN    * J0514470
                    *    DUPCO.                                       * J0514480
                    *                                                 * J0514490
                    *   *INDEX REGISTER 2 POINTS TO THE LABEL X IN THE* J0514500
                    *    MIDDLE OF DUMPS CONSTANTS AND WORKING STORAGE* J0514510
                    *    AREA.                                        * J0514520
                    *                                                 * J0514530
                    *   *INDEX REGISTER 3 IS USED AS A WORKING        * J0514540
                    *    REGISTER SO THE CONTENTS ARE DESTROYED.      * J0514550
                    *                                                 * J0514560
                    *************************************************** J0514570
                          HDNG    DUMP-PUNCH THE FORMATED OUTPUT        J0514580
                    *                                                   J0514590
                    *   ENTRY POINT                                     J0514600
                    *                                                   J0514610
                    XP000 DC      *-*       LINK WORD                   J0514620
                    *                                                   J0514630
                    *   INITIALIZE FOR NEXT BUFFER FULL                 J0514640
                    *                                                   J0514650
                          LD    1 NEXT                                  J0514660
                          A     2 DD970-X                               J0514670
                          STO   2 DD940-X   STORE DATA PLACEMENT ADDRES J0514680
                          MDX     XP120                                 J0514690
                    *                                                   J0514700
                    *   ENTRY POINT                                     J0514710
                    *                                                   J0514720
                    XP001 DC      *-*       LINK WORD                   J0514730
                    *                                                   J0514740
                    *   SET REGISTER 3 TO POINT AT THE BUFFER TO PUNCH  J0514750
                    *                                                   J0514760
                          LDX  I3 NEXT+C    REGISTER 3 POINTS AT BUFFER J0514770
                    *                                                   J0514780
                    *   PLACE THE ADDRESS AND WORD COUNT IN THE CARD    J0514790
                    *   TO PUNCH                                        J0514800
                    *                                                   J0514810
                          LD    2 DD936-X                               J0514820
                          STO   3 1         PLACE ADDRESS ON CARD       J0514830
                          LD    2 DD940-X   LOAD PLACEMENT ADDRESS      J0514840
                          S     2 DD977-X   SUBTRACT OFFSET             J0514850
                          S     1 NEXT      SUBTRACT BUFFER START       J0514860
                          OR    3 3         OR IN CARD TYPE             J0514870
                          STO   3 3         STORE WORD COUNT AND TYPE   J0514880
                    *                                                   J0514890
                    *   CHECK SUM THE CARD                              J0514900
                    *                                                   J0514910
                          LD    1 EBCSW     NO CHECK SUM IF EBCDIC  2E2 J0514920
                          BSC  L  XP110,Z   *DATA, BRANCH IF SO     2E2 J0514930
                    *                                               2E2 J0514940
                          LD    2 DD984-X                               J0514950
                          STO   2 DD943-X   WORD COUNT = 54             J0514960
                          LD    2 DD944-X   LOAD THE CARD NUMBER        J0514970
                          MDX  L  DD944,1   INCREMENT CARD NO           J0514980
                    XP100 A     3 1         ADD A WORD                  J0514990
                          BSC     C         SKIP ON NO CARRY            J0515000
                          A     2 DD970-X   ADD A 1 FOR A CARRY         J0515010
                          MDX   3 1         MOVE TO NEXT WORD           J0515020
                          MDX  L  DD943,-1  DECREASE COUNT BY 1         J0515030
                          MDX     XP100     BRANCH IF COUNT NOT = 0     J0515040
                          EOR   2 DD999-X   COMPLAMENT SUM TO CHECK SUM J0515050
                          A     2 DD970-X                               J0515060
                          STO   3 -52       STORE CHECK SUM             J0515070
                    *                                                   J0515080
                    *   INITIALIZE FOR NEXT BUFFER FULL                 J0515090
                    *                                                   J0515100
                    XP110 LD    1 NEXT                                  J0515110
                          A     2 DD973-X                               J0515120
                          STO   2 DD941-X   STORE INDICATOR BIT ADDRESS J0515130
                          A     2 DD974-X                               J0515140
                          STO   2 DD940-X   STORE DATA PLACEMENT ADDRES J0515150
                          LD    2 DD979-X                               J0515160
                          STO   2 DD938-X   SHIFT = 16                  J0515170
                    *                                                   J0515180
                    *   TEST TO SEE IF OUTPUT IS TO BE PLACED ON THE    J0515190
                    *   PAPER TAPE PUNCH                                J0515200
                    *                                                   J0515210
                    XP120 LD    1 PTSW      LOAD PAPER TAPE SWITCH      J0515220
                          BSC  L  XP165,+-  BRANCH TO PUNCH ON CARDS    J0515230
                    *                                                   J0515240
                    *   OPEN THE BUFFER SO AS TO PUNCH ON PAPER TAPE    J0515250
                    *                                                   J0515260
                          LDX  I3 NEXT+C                                J0515270
                          MDX   3 54        POINT AT PACKED BUFFER      J0515280
                          LD    2 DD984-X                               J0515290
                          STO   2 DD943-X   STORE WORD COUNT TO MOVE    J0515300
                          LDX  I2 NEXT+C                                J0515310
                          MDX   2 110       POINT AT UNPACKED BUFFER    J0515320
                    XP140 LD    3 0         (XXYY/0000)                 J0515330
                          RTE     8         (00XX/YY00)                 J0515340
                          SLA     8         (XX00/YY00)                 J0515350
                          STO   2 -1        STORE LEFT FRAME            J0515360
                          SLT     16        (YY00/0000)                 J0515370
                          STO   2 0         STORE RIGHT FRAME           J0515380
                          MDX   3 -1        ADJUST PACKED POINTER       J0515390
                          MDX   2 -2        ADJUST UNPACKED POINTER     J0515400
                          MDX  L  DD943,-1  DECREMENT WORD COUNT        J0515410
                          MDX     XP140     BRANCH IF WORD COUNT NOT =0 J0515420
                          LDX  L2 X         RESTORE REGISTER 2          J0515430
                    *                                                   J0515440
                    *   PLACE WORD COUNT AND HEADER TO PUNCH PAPER      J0515450
                    *   TAPE                                            J0515460
                    *                                                   J0515470
                          LD    2 DD923-X                               J0515480
                          BSC  L  XP145,+-  BRANCH IF DSF PROGRAM       J0515490
                          LD    2 DD984-X                               J0515500
                          SLA     1                                     J0515510
                          MDX     XP160                                 J0515520
                    XP145 LD    3 7                                     J0515530
                          S     2 DD991-X                               J0515540
                          BSC  L  XP155,+-  BRANCH DATA RECORD          J0515550
                          LD    3 7                                     J0515560
                          S     2 DD992-X                               J0515570
                          BSC  L  XP150,+-  BRANCH IF TRAILER RECORD    J0515580
                          LD    3 14                                    J0515590
                          SRA     7                                     J0515600
                          A     2 DD981-X   CALCULATE WORD COUNT        J0515610
                          MDX     XP160                                 J0515620
                    XP150 LD    2 DD975-X   LOAD WORD COUNT             J0515630
                          MDX     XP160                                 J0515640
                    XP155 LD    3 8                                     J0515650
                          SRA     7                                     J0515660
                          A     2 DD981-X   CALCULATE WORD COUNT        J0515670
                    XP160 A     2 DD971-X                               J0515680
                          STO   3 0         STORE PUNCH WORD COUNT      J0515690
                          S     2 DD971-X                               J0515700
                          SLA     7                                     J0515710
                          STO   3 2         STORE READ WORD COUNT       J0515720
                          LD    2 DD994-X                               J0515730
                          STO   3 1         STORE DELETE CODE           J0515740
                          BSI  I  PCHBI     LINK TO PUNCH RECORD        J0515750
                          MDX     XP280     BRANCH                      J0515760
                    *                                                   J0515770
                    *   INCREMENT THE CARD NUMBER                       J0515780
                    *                                                   J0515790
                    XP165 LD    1 EBCSW     NO CARD NO. IF EBC DATA 2E2 J0515800
                          BSC  L  XP230,Z                           2E2 J0515810
                    *                                               2E2 J0515820
                          LDX  I3 NEXT+C    REGISTER 3 POINTS AT BUFFER J0515830
                          LDX   1 3         INITLZ COUNTER          2-4 J0515840
                          LD    2 DD919-X   CHECK 4 COL SEQ SW      2-9 J0515842
                          BSC     +Z        SKIP IF 3 COL           2-9 J0515845
                          MDX   1 1         RAISE COUNTER TO 4      2-9 J0515847
                    XP180 LD    3 80        LOAD SEQUENCE NUMBER        J0515850
                          SRA     1         ADD 1 IN HOLLERITH          J0515860
                          STO   3 80        STORE NEW SEQUENCE NUMBER   J0515870
                          SRA     4         CHECK FOR PAST 9            J0515880
                          BSC  L  XP200,Z   BRANCH IF NOT PAST 9        J0515890
                          LD    2 DD993-X                               J0515900
                          STO   3 80        STORE A ZERO                J0515910
                          MDX   3 -1        DECREMENT TO NEXT DIGIT     J0515920
                          MDX   1 -1        SKIP IF SEQ NO. OVERFLOW2-4 J0515930
                          MDX     XP180     BRANCH TO DO NEXT DIGIT     J0515940
                    *                                                   J0515950
                    *   OPEN THE BUFFER SO AS TO PUNCH ON CARDS         J0515960
                    *                                                   J0515970
                    XP200 LD    2 DD981-X                               J0515980
                          STO   2 DD943-X   STORE WORD COUNT TO MOVE    J0515990
                          LDX  L1 C         RESTORE INDEX REG 1     2-4 J0516000
                          LDX  I3 NEXT+C                                J0516010
                          MDX   3 54        POINT AT PACKED BUFFER      J0516020
                          LDX  I2 NEXT+C                                J0516030
                          MDX   2 72        POINT AT UNPACKED BUFFER    J0516040
                    XP220 SLT     16        SET Q REGISTER TO ZERO      J0516050
                          LD    3 0         (XXXX/0000)                 J0516060
                          RTE     28        (XXX0/000X)                 J0516070
                          STO   2 0         STORE RIGHT COLUMN          J0516080
                          SLT     12        (0000/X000)                 J0516090
                          LD    3 -1        (XXXX/X000)                 J0516100
                          RTE     24        (XXX0/00XX)                 J0516110
                          STO   2 -1        STORE RIGHT CENTER COLUMN   J0516120
                          SLT     8         (X000/XX00)                 J0516130
                          LD    3 -2        (XXXX/XX00)                 J0516140
                          RTE     20        (XXX0/0XXX)                 J0516150
                          STO   2 -2        STORE LEFT CENTER COLUMN    J0516160
                          SLT     20        (XXX0/0000)                 J0516170
                          STO   2 -3        STORE LEFT COLUMN           J0516180
                          MDX   3 -3        ADJUST PACKED POINTER       J0516190
                          MDX   2 -4        ADJUST UNPACKED POINTER     J0516200
                          MDX  L  DD943,-1  DECREMENT WORD COUNT        J0516210
                          MDX     XP220     BRANCH IF WORD COUNT NOT =0 J0516220
                    *                                                   J0516230
                    *   TEST TO SEE IF BLANK CARD MUST BE READ          J0516240
                    *                                                   J0516250
                    XP230 LD    1 #RP67     LOAD READ BLANK SWITCH      J0516260
                          BSC  L  XP260,+-  BRANCH TO NOT READ BLANK    J0516270
                    *                                                   J0516280
                    *   READ A CARD AND CHECK TO SEE IF IT IS BLANK     J0516290
                    *                                                   J0516300
                    XP240 BSI  I  GETBI     LINK TO READ A CARD         J0516310
                          LDX  I3 THIS+C    REGISTER 3 POINTS AT BUFFER J0516320
                    *                                                   J0516330
                    *   WAIT TILL CARD READING DONE                     J0516340
                    *                                                   J0516350
                          MDX  L  $IBSY,0   SKIP IF NOT BUSY            J0516360
                          MDX     *-3       BRANCH IF BUSY              J0516370
                          LDX   2 80        REGISTER 2 HOLDS WORD COUNT J0516380
                          SLA     16        ZERO A REGISTER             J0516390
                          OR    3 1         OR IN A WORD                J0516400
                          MDX   3 1         MOVE BUFFER POINTER         J0516410
                          MDX   2 -1        DECREMENT WORD COUNT        J0516420
                          MDX     *-4       BRANCH IF WORD COUNT NOT =0 J0516430
                          BSC  L  XP260,+-  BRANCH IF BLANK CARD        J0516440
                    *                                                   J0516450
                    *   PRINT A LINE TO ASK FOR BLANK CARDS             J0516460
                    *                                                   J0516470
                          BSI  I  PRINT     LINK TO PRINT A LINE        J0516480
                          DC      XP300                                 J0516490
                          BSI  I  LINE      LINK TO SPACE A LINE        J0516500
                          BSI  I  LINE      LINK TO SPACE A LINE        J0516510
                          LD   L  $PBSY                                 J0516520
                          BSC  L  *-4,Z     LOOP TILL PRINTER NOT BUSY  J0516530
                    *                                                   J0516540
                    *   WAIT UNTIL THE OPERATOR HAS INTERVENED          J0516550
                    *                                                   J0516560
                          SLT     16        CLEAR EXTENSION             J0516570
                          LD   L  DD995     (100F/0000)                 J0516580
                          BSI  L  $PRET     WAIT AT PRE-OPERATIVE TRAP  J0516590
                          MDX     XP240     BRANCH                      J0516600
                    *                                                   J0516610
                    *   PUNCH THE CARD                                  J0516620
                    *                                                   J0516630
                    XP260 LDX  I3 NEXT+C    REGISTER 3 POINTS AT BUFFER J0516640
                          LD    3 80                                    J0516650
                          OR   L  DD975                                 J0516660
                          STO   3 80        PLACE END OF CARD INDICATOR J0516670
                          BSI  I  PCHBI     LINK TO PUNCH CARD          J0516680
                    *                                                   J0516690
                    *   WAIT UNTIL THE CARD PUNCHING ROUTINE IS NOT     J0516700
                    *   BUSY                                            J0516710
                    *                                                   J0516720
                          MDX  L  $IBSY,0   TEST CARD PUNCH BUSY        J0516730
                          MDX     *-3       BRANCH IF BUSY              J0516740
                    *                                                   J0516750
                    *   CLEAR THE PUNCH AREA                            J0516760
                    *                                                   J0516770
                    XP280 LDX  I3 NEXT+C    REGISTER 3 POINTS AT BUFFER J0516780
                          LDX   2 54        REGISTER 2 HOLDS WORD COUNT J0516790
                          LD    1 EBCSW                             2E2 J0516800
                          BSC     Z                                 2E2 J0516810
                          LDX   2 80        SET TO 80 IF DUMPDATA E 2E2 J0516820
                          SLA     16        SET A REGISTER TO ZERO      J0516830
                          STO   3 1         CLEAR A BUFFER WORD         J0516840
                          MDX   3 1         ADJUST BUFFER POINTER       J0516850
                          MDX   2 -1        DECREMENT WORD COUNT        J0516860
                          MDX     *-4       BRANCH IF WORD COUNT NOT =0 J0516870
                          LDX  L2 X         RESTORE REGISTER 2          J0516880
                    *                                                   J0516890
                    *   TEST TO SEE IF WORD COUNT TYPE DUMP FUNCTION    J0516900
                    *                                                   J0516910
                          LD    2 DD923-X   TEST DATA WORD FUNCTION     J0516920
                          BSC  I  XP000,Z   BRANCH IF IT IS             J0516930
                    *                                                   J0516940
                    *   PLACE CARD TYPE                                 J0516950
                    *                                                   J0516960
                          LD    2 DD991-X                               J0516970
                          STO   3 -51       STORE DATA TYPE FOR CARD    J0516980
                    *                                                   J0516990
                    *   RETURN TO CALLING PROGRAM                       J0517000
                    *                                                   J0517010
                          BSC  I  XP001     RETURN                      J0517020
                    *                                                   J0517030
                    *   THE FOLLOWING IS THE MESSAGE TO BE PRINTED WHEN J0517040
                    *   BLANK CARDS ARE REQUIRED BUT NOT PRESENT        J0517050
                    *                                                   J0517060
                    XP300 DC      XP320-*   WORD COUNT                  J0517070
                          EBC     .D112 NON-BLANK CARD READ ENTER . 2-8 J0517080
                          EBC     .BLANK CARDS.                     2-8 J0517090
                    XP320 EQU     *                                     J0517100
                    *************************************************** J0517110
                    *                                                 * J0517120
                    *                       END OF SOURCE             * J0517130
                    *                                                 * J0517140
                    *************************************************** J0517150
                          HDNG    DUMP-PLACE DATA ON PRINTER            J0517160
                    *************************************************** J0517170
                    *                                                 * J0517180
                    *FUNCTION-                                        * J0517190
                    *   *THIS SUBROUTINE PLACES THE DATA IN DD921 IN  * J0517200
                    *    A BUFFER TO PRINT THE ON THE PRINCIPAL       * J0517210
                    *    PRINTER.                                     * J0517220
                    *                                                 * J0517230
                    *ENTRY POINTS-                                    * J0517240
                    *   *XL000-THIS SUBROUTINE PLACES THE DATA IN THE * J0517250
                    *    BUFFER AND DIRECTS THE PRINTING ON THE       * J0517260
                    *    PRINCIPAL PRINT DEVICE.                      * J0517270
                    *                                                 * J0517280
                    *INPUT-                                           * J0517290
                    *   *N/A                                          * J0517300
                    *                                                 * J0517310
                    *OUTPUT-                                          * J0517320
                    *   *THIS SUBR PRINTS ON THE PRINCIPAL PRINT      * J0517330
                    *    DEVICE.                                      * J0517340
                    *                                                 * J0517350
                    *EXTERNAL REFERANCES-                             * J0517360
                    *   *PRINT-THIS SUBR IN DUPCO PRINTS A LINE       * J0517370
                    *    ON THE PRINCIPAL PRINT DEVICE.               * J0517380
                    *                                                 * J0517390
                    *   *LINE - THIS SUBR IN DUPCO SPACES A LINE      * J0517400
                    *    ON THE PRINCIPAL PRINT DEVICE.               * J0517410
                    *                                                 * J0517420
                    *   *BINEB- THIS SUBR IN DUPCO CONVERTS ONE       * J0517430
                    *    BINERY WORD INTO TWO EBCDIC WORDS.           * J0517440
                    *                                                 * J0517450
                    *   *TEMP1-THIS DOUBLE WORD IN DUPCO HOLDS THE    * J0517460
                    *    OUTPUT OF BINEB.                             * J0517470
                    *                                                 * J0517480
                    *   *XC000- THIS SUBR IN DUMP CLEARS THE PRINT    * J0517490
                    *    AREA AND INITIALIZES SOME OF THE POINTERS IN * J0517500
                    *    THIS ROUTINE.                                * J0517510
                    *                                                 * J0517520
                    *   *XI000- THIS SUBR IN DUMP PLACES A DOUBLE     * J0517530
                    *    WORD IN THE PRINT AREA AND HANDLES THE       * J0517540
                    *    SPACING ON A LINE.                           * J0517550
                    *                                                 * J0517560
                    *   *DD921-THIS WORD HOLDS THE DATA WORD THAT IS  * J0517570
                    *    TO BE PLACED IN THE BUFFER AND ON THE SYSTEM * J0517580
                    *    PRINTER.                                     * J0517590
                    *       INITIALIZED BY DU200.                     * J0517600
                    *                                                 * J0517610
                    *   *DD922-THIS WORD INDICATES THE TYPE ON DD921. * J0517620
                    *    IF DD921 IS EQUAL TO 3 THEN IT IS THE        * J0517630
                    *    LAST WORD OF THE DATA.                       * J0517640
                    *       INITIALIZED BY XG000.                     * J0517650
                    *                                                 * J0517660
                    *   *DD999-THIS IS A 60 WORD BUFFER USED TO PRINT * J0517670
                    *    THE DATA WORDS FROM.                         * J0517680
                    *       THE IOAR HEADER IS INITIALIZED BY DUMP    * J0517690
                    *       MAINLINE.                                 * J0517700
                    *                                                 * J0517710
                    *EXITS-                                           * J0517720
                    *   NORMAL-                                       * J0517730
                    *       *THE NORMAL EXIT IS TO THE WORD FOLLOWING * J0517740
                    *        THE BSI INSTRUCTION THAT CALLED THIS     * J0517750
                    *        SUBROUTINE.                              * J0517760
                    *                                                 * J0517770
                    *   ERRORS-                                       * J0517780
                    *       *N/A                                      * J0517790
                    *                                                 * J0517800
                    *TABLES/WORK AREAS-                               * J0517810
                    *   *DD945-THIS WORD IS A SWITCH THAT INDICATES   * J0517820
                    *    THAT A HEADER SHOULD BE PRINTED.             * J0517830
                    *       0 = PRINT HEADER                          * J0517840
                    *       NOT 0 = HEADER IS PRINTED                 * J0517850
                    *       INITIALIZED BY DUMP MAINLINE.             * J0517860
                    *       MAINTAINED BY THIS SUBROUTINE.            * J0517870
                    *                                                 * J0517880
                    *   *DD946-THIS WORD IS A COUNT OF THE BLANK WORDS* J0517890
                    *    THAT ARE TO BE PLACED ON THE FIRST LINE OF   * J0517900
                    *    PRINTED OUTPUT.                              * J0517910
                    *       INITIALIZED BY DUMP MAINLINE.             * J0517920
                    *       MAINTAINED BY THIS SUBROUTINE.            * J0517930
                    *                                                 * J0517940
                    *   *DD947-THIS WORD IS THE COUNT OF NUMBER OF    * J0517950
                    *    WORDS ON THE PRINT LINE STILL TO BE FILLED.  * J0517960
                    *       INITIALIZED BY XC000.                     * J0517970
                    *       MAINTAINED BY THIS SUBROUTINE.            * J0517980
                    *                                                 * J0517990
                    *   *DD948-THIS WORD IS A SWITCH THAT INDICATES IF* J0518000
                    *    THE PROGRAM BEING DUMPED IS CORE IMAGE OR    * J0518010
                    *    NOT.                                         * J0518020
                    *       0 = NOT CORE IMAGE                        * J0518030
                    *       NOT 0 = CORE IMAGE                        * J0518040
                    *       INITIALIZED BY DUMP MAINLINE.             * J0518050
                    *                                                 * J0518060
                    *   *DD949-THIS WORD IS THE NUMBER OF LINES TO BE * J0518070
                    *    PRINTED BEFORE A SPACE TO BLOCK THE OUTPUT.  * J0518080
                    *       INITIALIZED BY DUMP MAINLINE.             * J0518090
                    *       MAINTAINED BY THIS SUBROUTINE.            * J0518100
                    *                                                 * J0518110
                    *NOTES-                                           * J0518120
                    *   *THE CALLING SEQUENCE TO THIS SUBROUTINE IS A * J0518130
                    *    BSI INSTRUCTION TO IT.                       * J0518140
                    *                                                 * J0518150
                    *   *INDEX REGISTER 1 POINTS AT THE LABEL C IN    * J0518160
                    *    DUPCO.                                       * J0518170
                    *                                                 * J0518180
                    *   *INDEX REGISTER 2 POINTS AT THE LABEL X IN THE* J0518190
                    *    MIDDLE OF DUMPS CONSTANTS AND WORKING STORAGE* J0518200
                    *    AREA.                                        * J0518210
                    *                                                 * J0518220
                    *   *INDEX REGISTER 3 IS USED AS A WORKING        * J0518230
                    *    REGISTER SO ITS CONTENTS ARE DESTROYED.      * J0518240
                    *                                                 * J0518250
                    *************************************************** J0518260
                          HDNG    DUMP-PLACE DATA ON PRINTER            J0518270
                    *                                                   J0518280
                    *   ENTRY POINT                                     J0518290
                    *                                                   J0518300
                    XL000 DC      *-*       LINK WORD                   J0518310
                    *                                               2E2 J0518320
                    *   TEST TO SEE IF DUMP EBCDIC ON PRINTER       2E2 J0518330
                    *                                               2E2 J0518340
                          LD    1 EBCSW                             2E2 J0518350
                          BSC  L  XL050,+-  BRANCH IF NOT DUMPDATA E2E2 J0518360
                    *                                               2E2 J0518370
                          BSI  L  XC000     LINK TO CLEAR PRINT BFR 2E2 J0518380
                    *                                               2E2 J0518390
                          LD    2 DD965-X   GET DB COUNT            2E2 J0518400
                          STO   2 DD959-X                           2E2 J0518410
                          LD    1 PEBUF                             2E2 J0518420
                          STO     XL030     STORE ADDRESS OF LINE   2E2 J0518430
                    XL010 LD    2 DD988-X   40 WORDS TO MOVE        2E2 J0518440
                          SRA     1         DIVIDE 80 BY 2          2E2 J0518450
                          STO   2 DD954-X   STORE IN COUNTER        2E2 J0518460
                          LDX  I3 PEBUF+C                           2E2 J0518470
                    XL020 LD    2 DD921-X   GET DATA WORD           2E2 J0518480
                          STO   3 1                                 2E2 J0518490
                          STX   3 XL025+1   SAVE XR3 TEMPORARILY    2-8 J0518500
                          BSI  L  XG000     FETCH NEW DATA WORD     2E2 J0518510
                    XL025 LDX  L3 *-*       RESTORE XR3             2-8 J0518520
                          MDX   3 1         POINT TO NEXT CHARACTER 2E2 J0518530
                          MDX  L  DD954,-1  DECREASE COUNTER        2E2 J0518540
                          MDX     XL020     MOVE 40 WORDS,THEN PRINT2E2 J0518550
                          BSI  I  PRINT     PRINT 1 LINE, 80 COLUMNS2E2 J0518560
                    XL030 DC      *-*                               2E2 J0518570
                          MDX  L  DD959,-2  DECR BY 2 DB'S (=ONE CD)2E2 J0518580
                          MDX     XL010     PROCESS NEXT CARD IMAGE 2E2 J0518590
                          LD    2 DD972-X   PLACE CONSTANT 3 TO     2E2 J0518600
                          STO   2 DD922-X   *INDICATE LAST RECORD   2E2 J0518610
                          MDX     XL190                             2E2 J0518620
                    *                                                   J0518630
                    *   TEST TO SEE IF THE HEADER HAS TO BE PRINTED     J0518640
                    *                                                   J0518650
                    XL050 LD    2 DD945-X   LOAD PRINT HEADER SWITCH    J0518660
                          BSC  L  XL120,Z   BRANCH TO NOT PRINT HEADER  J0518670
                    *                                                   J0518680
                    *   PRINT HEADER                                    J0518690
                    *                                                   J0518700
                          BSI  I  PRINT     LINK TO PRINT A LINE        J0518710
                          DC      XL220     ADDRESS OF HEADER           J0518720
                          BSI  I  LINE      SKIP A LINE ON PRINTER      J0518730
                    *                                                   J0518740
                    *   INDICATE THAT HEADER HAS BEEN PRINTED           J0518750
                    *                                                   J0518760
                          STX  L0 DD945     SET PRINT HEADER SWITCH     J0518770
                    *                                                   J0518780
                    *   LINK THE CLEAR PRINT AREA AND READY IT FOR      J0518790
                    *   DUMPING OF DATA TO PRINTER                      J0518800
                    *                                                   J0518810
                          BSI     XC000     LINK TO CLEAR ROUTINE       J0518820
                    *                                                   J0518830
                    *   TEST TO SEE IF BLANKS ARE TO BE PLACED IN THE   J0518840
                    *   PRINT AREA TO POSITION DATA                     J0518850
                    *                                                   J0518860
                          LD    2 DD946-X   LOAD BLANK COUNT            J0518870
                          BSC  L  XL120,+-  BRANCH IF NONE TO BE PLACED J0518880
                    *                                                   J0518890
                    *   PLACE A BLANK WORD IN PRINT AREA                J0518900
                    *                                                   J0518910
                    XL100 LDD   2 DD969-X   LOAD BLANK WORD             J0518920
                          BSI  L  XI000     LINK TO PLACE BLANK WORD    J0518930
                    *                                                   J0518940
                    *   DECREMENT WORD COUNT AND CHECK TO SEE IF NOW    J0518950
                    *   ZERO                                            J0518960
                          MDX  L  DD947,-1  DECR WORDS PER LINE COUNT   J0518970
                          MDX  L  DD946,-1  DECREMENT COUNT             J0518980
                          MDX     XL100     BRANCH IF COUNT NOT ZERO    J0518990
                    *                                                   J0519000
                    *   PLACE DATA WORD IN PRINT AREA                   J0519010
                    *                                                   J0519020
                    XL120 LD    2 DD921-X   LOAD WORD                   J0519030
                          BSI  I  BINEB     LINK TO FORMAT TO EBCDIC    J0519040
                          LDD   1 TEMP1     LOAD FORMATED WORD          J0519050
                          BSI     XI000     LINK TO PLACE IN BUFFER     J0519060
                    *                                                   J0519070
                    *                                                   J0519080
                    *   TEST TO SEE IF THAT WAS THE LAST WORD OF DATA   J0519090
                    *   TO BE PRINTED                                   J0519100
                    *                                                   J0519110
                          LD    2 DD922-X   LOAD INDICATOR WORD         J0519120
                          S     2 DD972-X                               J0519130
                          BSC  L  XL140,+-  BRANCH IF LAST DATA WORD    J0519140
                    *                                                   J0519150
                    *   DECREMENT LINE COUNT AND TEST TO SEE IF LINE    J0519160
                    *   IS FULL                                         J0519170
                    *                                                   J0519180
                          MDX  L  DD947,-1  DECREMENT WORD COUNT        J0519190
                          MDX     XL200     BRANCH IF WORD COUNT NOT 0  J0519200
                    *                                                   J0519210
                    *   PRINT THE LINE OF DATA                          J0519220
                    *                                                   J0519230
                    XL140 LD    1 PEBUF                                 J0519240
                          STO     *+2       SAVE PRINT AREA ADDRESS     J0519250
                          BSI  I  PRINT     LINT TO PRINT LINE          J0519260
                          DC      *-*       ADDRESS OF PRINT AREA       J0519270
                    *                                                   J0519280
                    *   DECREMENT THE COUNT OF LINES PER BLOCK AND TEST J0519290
                    *   FOR WHEN IT REACHS ZERO                         J0519300
                    *                                                   J0519310
                          MDX  L  DD949,-1  DECREMENT LINE COUNT        J0519320
                          MDX     XL180     BRANCH IF LINE COUNT NOT 0  J0519330
                    *                                                   J0519340
                    *   SPACE A LINE ON THE SYSTEM PRINTER              J0519350
                    *                                                   J0519360
                          LD   I  $CH12     LOAD CHANNEL 12 INDICATOR   J0519370
                          BSI  I  LINE,+-   BRANCH TO SPACE A LINE      J0519380
                    *                    ***CODING REMOVED***       2-8 J0519390
                    *                                                   J0519400
                    *   INITIALIZE COUNT OF LINES PER BLOCK TO 20       J0519410
                    *                                                   J0519420
                          LD    2 DD982-X                               J0519430
                    *                                               2-8 J0519440
                    *   TEST IF CORE IMAGE PROGRAM IS BEING DUMPED  2-8 J0519450
                    *                                               2-8 J0519460
                          MDX  L  DD948,0   SKIP IF NOT DCI         2-8 J0519470
                    *                                                   J0519480
                    *   INITIALIZE COUNT OF LINES PER BLOCK TO 16       J0519490
                    *                                                   J0519500
                          LD    2 DD979-X   SET LINE CNT TO 16      2-8 J0519510
                          STO   2 DD949-X   STORE LINES PER BLOCK       J0519520
                    *                                                   J0519530
                    *   CHECK IF PAGE RESTORED                          J0519540
                    *                                                   J0519550
                    XL180 LD   I  $CH12     LOAD CHANNEL 12 INDICATOR   J0519560
                          BSC  L  XL190,+-  BRANCH IF NOT CHANNEL 12    J0519570
                    *                                                   J0519580
                    *   INDICATE THAT A NEW HEADING SHOULD BE PRINTED   J0519590
                    *                                                   J0519600
                          SLA     16                                    J0519610
                          STO   2 DD945-X   SET PRINT HEADER SWITCH     J0519620
                          MDX     XL200     BRANCH                      J0519630
                    *                                                   J0519640
                    *   LINK TO CLEAR PRINT AREA AND READY IT DUMPING   J0519650
                    *   OF DATA TO PRINTER                              J0519660
                    *                                                   J0519670
                    XL190 BSI     XC000     LINK TO CLEAR AREA          J0519680
                    *                                                   J0519690
                    *   RETURN TO THE CALLING PROGRAM                   J0519700
                    *                                                   J0519710
                    XL200 BSC  I  XL000     RETURN                      J0519720
                    *                                                   J0519730
                    *    PRINTER HEADING                                J0519740
                    *                                                   J0519750
                    XL220 DC      XL240-*   WORD COUNT                  J0519760
                          EBC     .ADDR    ***0  ***1  ***2  ***3    .  J0519770
                          EBC     .***4  ***5  ***6  ***7    ***8  **.  J0519780
                          EBC     .*9  ***A  ***B    ***C  ***D  ***E.  J0519790
                          EBC     .  ***F.                              J0519800
                    XL240 EQU     *                                     J0519810
                    *************************************************** J0519820
                    *                                                 * J0519830
                    *                       END OF SOURCE             * J0519840
                    *                                                 * J0519850
                    *************************************************** J0519860
                          HDNG    DUMP-CLEAR PRINT AREA                 J0519870
                    *************************************************** J0519880
                    *                                                 * J0519890
                    *FUNCTION-                                        * J0519900
                    *   *THIS SUBROUTINE CLEARS THE PRINT BUFFER TO   * J0519910
                    *    BLANKS AND INITIALIZES SOME POINTERS IN      * J0519920
                    *    XL000.                                       * J0519930
                    *                                                 * J0519940
                    *ENTRY POINTS-                                    * J0519950
                    *   *XC000-THIS SUBR PERFORMS THE ABOVE FUNCTION. * J0519960
                    *                                                 * J0519970
                    *INPUT-                                           * J0519980
                    *   *N/A                                          * J0519990
                    *                                                 * J0520000
                    *OUTPUT-                                          * J0520010
                    *   *N/A                                          * J0520020
                    *                                                 * J0520030
                    *EXTERNAL REFERENCES-                             * J0520040
                    *   *BINEB-THIS SUBR IN DUPCO CONVERTS ONE        * J0520050
                    *    BINARY WORD INTO TWO EBCDIC WORDS.           * J0520060
                    *                                                 * J0520070
                    *   *TEMP1-THIS DOUBLE WORD IN DUPCO HOLDS THE    * J0520080
                    *    OUTPUT OF BINEB.                             * J0520090
                    *                                                 * J0520100
                    *   *DD951-THIS WORD HOLDS THE ADDRESS OF THE     * J0520110
                    *    NEXT WORD OF THE PRINT AREA THAT WILL ACCEPT * J0520120
                    *    DATA.                                        * J0520130
                    *       INITIALIZED BY THIS ROUTINE.              * J0520140
                    *                                                 * J0520150
                    *   *DD953-THIS WORD HOLDS THE COUNT OF THE NUMBER* J0520160
                    *    OF XI000 FUNCTIONS THAT ARE TO BE DONE BEFORE* J0520170
                    *    AN ADDITIONAL SET OF SPACES ARE TO BE PLACED * J0520180
                    *    ON THE LINE.                                 * J0520190
                    *       INITIALIZED BY THIS ROUTINE.              * J0520200
                    *                                                 * J0520210
                    *   *DD947-THIS WORD HOLDS THE COUNT OF THE       * J0520220
                    *    NUMBER OF DATA WORD TO BE PLACED ON THE LINE.* J0520230
                    *       INITIALIZED BY THIS ROUTINE.              * J0520240
                    *                                                 * J0520250
                    *EXITS-                                           * J0520260
                    *   *NORMAL-                                      * J0520270
                    *       *THE NORMAL EXIT IS TO THE WORD FOLLOWING * J0520280
                    *        THE BSI INSTRUCTION THAT CALLED THIS     * J0520290
                    *        SUBROUTINE.                              * J0520300
                    *                                                 * J0520310
                    *   *ERRORS-                                      * J0520320
                    *       *N/A                                      * J0520330
                    *                                                 * J0520340
                    *TABLES/WORK AREAS-                               * J0520350
                    *   *DD950-THIS WORD HOLDS THE COUNT OF THE NUMBER* J0520360
                    *    OF WORDS IN THE PRINT AREA TO CLEAR.         * J0520370
                    *       MAINTAINED BY THIS SUBROUTINE.            * J0520380
                    *                                                 * J0520390
                    *   *PEBUF-THIS WORD HOLDS THE ADDRESS OF A 61    * J0520400
                    *    WORD BUFFER THAT IS USED TO HOLD THE DATA    * J0520410
                    *    GOING TO THE PRINTER. THIS WORD IS LOCATED IN* J0520420
                    *    DUPCO.                                       * J0520430
                    *       IOAR HEADER INITIALIZED BY DUMP MAINLINE. * J0520440
                    *                                                 * J0520450
                    *NOTES-                                           * J0520460
                    *   *THE CALLING SEQUENCE TO THIS SUBROUTINE IS A * J0520470
                    *    BSI INSTRUCTION TO IT.                       * J0520480
                    *                                                 * J0520490
                    *   *INDEX REGISTER 1 POINTS AT THE LABEL C IN    * J0520500
                    *    DUPCO.                                       * J0520510
                    *                                                 * J0520520
                    *   *INDEX REGISTER 2 POINTS AT THE LABEL X IN THE* J0520530
                    *    MIDDLE OF DUMPS CONSTANTS AND WORKING STORAGE* J0520540
                    *    AREA.                                        * J0520550
                    *                                                 * J0520560
                    *   *INDEX REGISTER 3 IS USED AS A WORKING        * J0520570
                    *    REGISTER SO ITS CONTENTS ARE DESTROYED.      * J0520580
                    *                                                 * J0520590
                    *************************************************** J0520600
                    *                                                   J0520610
                    *   ENTRY POINT                                     J0520620
                    *                                                   J0520630
                    XC000 DC      *-*       LINK WORD                   J0520640
                    *                                                   J0520650
                    *   CLEAR PRINT BUFFER                              J0520660
                    *                                                   J0520670
                          LD    2 DD987-X                               J0520680
                          STO   2 DD950-X   WORD COUNT TO CLEAR         J0520690
                          LDX  I3 PEBUF+C   REGISTER 3 POINTS AT BUFFER J0520700
                          LD    2 DD969-X   LOAD DOUBLE BLANKS          J0520710
                    XC100 STO   3 1         STORA A DOUBLE BLANK        J0520720
                          MDX   3 1         INCREMENT BUFFER POINTER    J0520730
                          MDX  L  DD950,-1  DECREMENT WORD COUNT        J0520740
                          MDX     XC100     BRANCH IF WORD COUNT NOT 0  J0520750
                    *                                                   J0520760
                    *   INITIALIZE POINTERS                             J0520770
                    *                                                   J0520780
                          LD    1 PEBUF                                 J0520790
                          A     2 DD970-X                               J0520800
                          STO   2 DD951-X   SET PLACEMENT ADDRESS       J0520810
                          LD    2 DD970-X                               J0520820
                          STO   2 DD953-X   SET SKIP COUNT TO 1         J0520830
                          LD    2 DD979-X                               J0520840
                          STO   2 DD947-X   PLACE WORDS PER LINE        J0520850
                    *                                                   J0520860
                    *   PLACE THE ADDRESS OF THE LINE                   J0520870
                    *                                                   J0520880
                          LD    2 DD952-X   LOAD LINE ADDRESS           J0520890
                          A     2 DD979-X   INCREMENT LINE ADDRESS      J0520900
                          STO   2 DD952-X   STORE UPDATED ADDRESS       J0520910
                          BSI  I  BINEB     FORMAT ADDRESS TO PRINT     J0520920
                          LDD   1 TEMP1     LOAD FORMATED ADDRESS       J0520930
                          BSI     XI000     PLACE DATA IN BUFFER        J0520940
                    *                                                   J0520950
                    *   RETURN TO THE CALLING PROGRAM                   J0520960
                    *                                                   J0520970
                          BSC  I  XC000     RETURN                      J0520980
                    *************************************************** J0520990
                    *                                                 * J0521000
                    *                       END OF SOURCE             * J0521010
                    *                                                 * J0521020
                    *************************************************** J0521030
                          HDNG    DUMP-PLACE IN PRINT AREA              J0521040
                    *************************************************** J0521050
                    *                                                 * J0521060
                    *FUNCTION-                                        * J0521070
                    *   *THIS SUBROUTINE PLACES THE DATA IN THE A AND * J0521080
                    *    Q REGISTERS IN THE PRINT BUFFER.             * J0521090
                    *                                                 * J0521100
                    *ENTRY POINTS-                                    * J0521110
                    *   *XI000-THIS SUBROUTINE DOES THE ABOVE FUNCTION* J0521120
                    *                                                 * J0521130
                    *INPUT-                                           * J0521140
                    *   *N/A                                          * J0521150
                    *                                                 * J0521160
                    *OUTPUT-                                          * J0521170
                    *   *N/A                                          * J0521180
                    *                                                 * J0521190
                    *EXTERNAL REFERANCES-                             * J0521200
                    *   *DD951-THIS WORD HOLDS THE ADDRESS OF WHERE   * J0521210
                    *    THE DATA IS TO BE PLACED IN THE BUFFER.      * J0521220
                    *       INITIALIZED BY XC000.                     * J0521230
                    *       MAINTAINED BY THIS SUBROUTINE.            * J0521240
                    *                                                 * J0521250
                    *   *DD953-THIS WORD HOLDS THE COUNT OF THE       * J0521260
                    *    NUMBER OF DATA ELEMENTS TO BE PLACED BEFORE  * J0521270
                    *    AN ADDITIONAL SET OF SKIPS IS REQUIRED.      * J0521280
                    *       INITIALIZED BY XC000.                     * J0521290
                    *       MAINTAINED BY THIS SUBROUTINE.            * J0521300
                    *                                                 * J0521310
                    *EXITS-                                           * J0521320
                    *   *NORMAL-                                      * J0521330
                    *       *THE NORMAL EXIT IS TO THE WORD FOLLOWING * J0521340
                    *        THE BSI INSTRUCTION THAT CALLED THIS     * J0521350
                    *        SUBROUTINE.                              * J0521360
                    *                                                 * J0521370
                    *   *ERRORS-                                      * J0521380
                    *       *N/A                                      * J0521390
                    *                                                 * J0521400
                    *TABLES/WORK AREAS-                               * J0521410
                    *   *PEBUF-THIS WORD HOLDS THE ADDRESS OF A 61    * J0521420
                    *    WORD BUFFER THAT IS USED TO HOLD THE DATA    * J0521430
                    *    GOING TO THE PRINTER. THIS WORD IS LOCATED IN* J0521440
                    *    DUPCO.                                       * J0521450
                    *       IOAR HEADER INITIALIZED BY DUMP MAINLINE. * J0521460
                    *                                                 * J0521470
                    *NOTES-                                           * J0521480
                    *   *THE CALLING SEQUENCE TO THIS SUBROUTINE IS A * J0521490
                    *     LDD     DATA                                * J0521500
                    *     BSI     XI000                               * J0521510
                    *                                                 * J0521520
                    *   *INDEX REGISTER 1 POINTS AT THE LABEL C IN    * J0521530
                    *    DUPCO.                                       * J0521540
                    *                                                 * J0521550
                    *   *INDEX REGISTER 2 POINTS AT THE LABEL X IN THE* J0521560
                    *    MIDDLE OF DUMPS CONSTANTS AND WORKING STORAGE* J0521570
                    *    AREA.                                        * J0521580
                    *                                                 * J0521590
                    *************************************************** J0521600
                    *                                                   J0521610
                    *   ENTRY POINT                                     J0521620
                    *                                                   J0521630
                    XI000 DC      *-*       LINK WORD                   J0521640
                    *                                                   J0521650
                    *   PLACE THE FORMATED DATA                         J0521660
                    *                                                   J0521670
                          STO  I  DD951     PLACE FIRST WORD            J0521680
                          MDX  L  DD951,1   INCREMENT ADDRESS           J0521690
                          RTE     16                                    J0521700
                          STO  I  DD951     PLACE SECOND WORD           J0521710
                          MDX  L  DD951,2   INCREMENT ADDRESS           J0521720
                    *                                                   J0521730
                    *   INCREMENT SKIP COUNT AND CHECK FOR ZERO         J0521740
                    *                                                   J0521750
                          MDX  L  DD953,-1  DECREMENT SKIP COUNT        J0521760
                          MDX     XI500     BRANCH IF COUNT NOT 0       J0521770
                    *                                                   J0521780
                    *   INCREMENT FOR ADDITIONAL BLANKS                 J0521790
                    *                                                   J0521800
                          MDX  L  DD951,1   INCREMENT ADDRESS           J0521810
                    *                                                   J0521820
                    *   RESET SKIP COUNT TO 4                           J0521830
                    *                                                   J0521840
                          LD    2 DD973-X                               J0521850
                          STO   2 DD953-X   SKIP COUNT = 4              J0521860
                    *                                                   J0521870
                    *   RETURN TO CALLING PROGRAM                       J0521880
                    *                                                   J0521890
                    XI500 BSC  I  XI000     RETURN                      J0521900
                    *************************************************** J0521910
                    *                                                 * J0521920
                    *                       END OF SOURCE             * J0521930
                    *                                                 * J0521940
                    *************************************************** J0521950
                          HDNG    CONV EBCDIC - CARD CODE. RJE.     2E2 J0521960
                    ************************************************2E2 J0521970
                    *                                               2E2 J0521980
                    *   SPECIAL SUBROUTINE TO CONVERT FROM EBCDIC TO2E2 J0521990
                    *   CARD CODE AND PLACE DATA ON CARD, FOR RJE.  2E2 J0522000
                    *   USED BY XF000 AND ENTERED FROM XF260 ONLY.  2E2 J0522010
                    *                                               2E2 J0522020
                    ************************************************2E2 J0522030
                    *                                               2E2 J0522040
                    XE000 LD      XE960     SET FIRST HALF SWITCH   2-9 J0522050
                          STO     XE950     *POSITIVE               2-9 J0522060
                          LD    2 DD921-X   LD PACKED EBCDIC WD     2-9 J0522070
                          STO     XE910     SAVE WD                 2-9 J0522080
                          STX   1 XE110+1   SAVE XR1                2-9 J0522090
                          STX   2 XE111+1   SAVE XR2                2-9 J0522100
                          SRA     8                                 2-9 J0522110
                    XE020 AND     XE960     MASK OFF HALF           2-9 J0522120
                          STO     XE920     SAVE CURRENT HALF       2-9 J0522130
                    *                                               2-9 J0522140
                    *   SEARCH TABLE IN 1442 CONVERSION ROUTINE.    2-9 J0522150
                    *   THE CONSTANT XE900 IS THE TABLE LOCATION    2-9 J0522160
                    *   RELATIVE TO THE BEGINNING OF THE ROUTINE.   2-9 J0522170
                    *   THIS CONSTANT MUST BE MANUALLY CHANGED      2-9 J0522180
                    *   IF THE POSITION OF THE TABLE MOVES.         2-9 J0522190
                    *                                               2-9 J0522200
                          LDX  I1 IOADR+3   GET LD ADDR OF 1442 CONV2-9 J0522210
                          MDX  I1 XE900     POINT TO TABL BEGIN     2-9 J0522220
                          LDX  I2 XE940     SET TO -TABL SIZE       2-9 J0522230
                    XE040 SLT     32        CLEAR ACC-EXT           2-9 J0522240
                          LD    1           GET TABL WD   LLRR 0000 2-9 J0522250
                          RTE     8                       00LL RR00 2-9 J0522260
                          S       XE920     COMPARE WITH CURR HALF  2-9 J0522270
                          BSC  L  XE060,+-  BR IF FOUND LEFT        2-9 J0522280
                          SLA     16        GET RT HALF   0000 RR00 2-9 J0522290
                          SLT     8         *OF TABL WD   00RR 0000 2-9 J0522300
                          S       XE920     COMPARE                 2-9 J0522310
                          BSC  L  XE050,+-  BR IF FOUND RIGHT       2-9 J0522320
                          MDX   1 1         PT TO NEXT TABL WD      2-9 J0522330
                          MDX   2 1         MODIFY WD CNT           2-9 J0522340
                          MDX     XE040     LOOP                    2-9 J0522350
                          SLA     16        NOT FOUND IN TABL       2-9 J0522360
                          MDX     XE100     *OUTPUT BLANK CHAR      2-9 J0522370
                    *                                               2-9 J0522380
                    *   DISPLACEMENT IN TABL IS CONVERTED TO CD CODE2-9 J0522390
                    *                                               2-9 J0522400
                    XE050 LD      XE980     SET TO PUN 9 COL        2-9 J0522410
                    XE060 STO     XE990     *AS FOUND RIGHT OR LEFT 2-9 J0522420
                          STX   2 XE930                             2-9 J0522430
                          LD      XE930     GET PLACE WHERE FOUND   2-9 J0522440
                          S       XE940     SET POSITIVE  007F XXXX 2-9 J0522450
                          SRT     4         1-7 PUN IN ACC0007 FXXX 2-9 J0522460
                          BSC  L  XE090,+-  BR IF NO PUN IN 1-7     2-9 J0522470
                          STO     XE080+1                           2-9 J0522480
                    XE080 LDX  L2 *-*       USE TO SHIFT PUN CHAR   2-9 J0522490
                          LD      XE970     PUNCH CHAR FOR 1-7      2-9 J0522500
                          SLA   2           *SHIFTED TO CORR PLACE  2-9 J0522510
                    XE090 OR      XE990     PUT IN 9 PUNCH          2-9 J0522520
                          STO     XE920     SAVE TEMP               2-9 J0522530
                          SLT     3         GET 12 11 0 PUN FROM EXT2-9 J0522540
                          SLA     7         ALLOW FOR 1-7 PUNCH     2-9 J0522550
                          SLT     1         PICK UP 8 PUN FROM EXT  2-9 J0522560
                          SLA     5         POSITION                2-9 J0522570
                          OR      XE920     PUT IN 1-7 AND 9        2-9 J0522580
                    *                                               2-9 J0522590
                    XE100 STO  I  DD940     CONV CD CODE TO BUFFER  2-9 J0522600
                          MDX  L  DD940,1   INCREMENT ADDR          2-9 J0522610
                          LD      XE950     LD FIRST/SEC HALF SW    2-9 J0522620
                          BSC  L  XE110,+-  BR IF THROUGH           2-9 J0522630
                          SLA     16                                2-9 J0522640
                          STO     XE950     SET FOR SEC HALF        2-9 J0522650
                          LD      XE910     GET SEC HALF            2-9 J0522660
                          MDX     XE020     GO TO CONVERT           2-9 J0522670
                    *                                               2-9 J0522680
                    XE110 LDX  L1 *-*       RESTORE XR1             2-9 J0522690
                    XE111 LDX  L2 *-*       RESTORE XR2             2-9 J0522700
                          BSC  L  XF265     BRANCH BACK             2-9 J0522710
                    *                                               2-9 J0522720
                    XE900 DC      /0038     1442 CONV TABL BEGIN    2-9 J0522730
                    *                       *ALWAYS SP130-SP000-1   2-9 J0522740
                    XE910 DC      *-*       SAVE WD BEING COMVERTED 2-9 J0522750
                    XE920 DC      *-*       TEMP STORE- CIRR HALF   2-9 J0522760
                    XE930 DC      *-*       NEG OF TABL DISP        2-9 J0522770
                    XE940 DC      -129      NEG OF TABL SIZE  -1    2-9 J0522780
                    XE950 DC      *-*       FIRST HALF IF NON ZERO  2-9 J0522790
                    XE960 DC      /00FF     MASK FOR HALF EBCDIC WD 2-9 J0522800
                    XE980 DC      /0010     CARD CODE FOR 9 PUNCH   2-9 J0522810
                    XE970 DC      /0020     CARD CODE FOR 8 PUNCH   2-9 J0522820
                    XE990 DC      *-*       9 PUNCH SW              2-9 J0522830
                    *                                               2-9 J0522840
                    *                                               2-9 J0522850
                          BSS     19        PATCH AREA              2-9 J0522860
                          DC      /FFFF                             2-9 J0522870
                    *                                               2-9 J0522880
                    *                                               2-9 J0522890
                    *                                               2-9 J0522900
                    *                                               2-9 J0522910
                    *                                               2E2 J0522920
                    ************************************************2E2 J0522930
                    *                   END OF SOURCE               2E2 J0522940
                    ************************************************2E2 J0522950
                          HDNG    DUMP-TABLES/WORK AREAS                J0522960
                    *                                                   J0522970
                    *   DUMPS CONSTANTS AND WORKING STORAGE             J0522980
                    *                                                   J0522990
                          BSS  E  0         MAKE LOCATION COUNTER EVEN  J0523000
                    X     EQU     *+128                                 J0523010
                    DD900 DEC     0         PROGRAM WORD COUNT          J0523020
                    DD901 DC      0         DSW SENSE FUNCTION          J0523030
                          DC      /1700                                 J0523040
                    DD902 DEC     0         PROGRAM NAME                J0523050
                    DD919 DC      *-*       PUNCH SEQ SW,4 COL IF - 2-9 J0523055
                    DD920 DC      *-*       FIRST BFR FULL SWITCH       J0523060
                    DD921 DC      *-*       DATA WORD                   J0523070
                    DD922 DC      *-*       INDICATOR WORD FOR DD921    J0523080
                    DD923 DC      *-*       DUMP FUNCTION SWITCH        J0523090
                    DD924 DC      *-*       SECTOR READ SWITCH          J0523100
                    DD925 DC      *-*       GET WORD ADDRESS            J0523110
                    DD926 DC      *-*       GET WORD COUNT              J0523120
                    DD927 DC      *-*       WORDS TO HEADER             J0523130
                    DD928 DC      *-*       FIRST HEADER WORD SWITCH    J0523140
                    DD929 DC      *-*       WORDS TO INDICATOR          J0523150
                    DD930 DC      *-*       PUT WORD COUNT              J0523160
                    DD931 DC      *-*       PUT WORD ADDRESS            J0523170
                    DD932 DC      *-*       DISK INDICATOR BITS         J0523180
                    DD933 DC      *-*       SHIFT COUNT FOR DD932       J0523190
                    DD934 DC      *-*       FIRST HEADER WORD SWITCH    J0523200
                    DD935 DC      *-*       FIRST HEADER SWITCH         J0523210
                    DD936 DC      *-*       PUNCH ADDRESS VALUE         J0523220
                    DD937 DC      *-*       LOCATION COUNTER            J0523230
                    DD938 DC      *-*       SHIFT COUNT FOR DD939       J0523240
                    DD939 DC      *-*       WORD INDICATOR BITS         J0523250
                    DD940 DC      *-*       PUNCH WORD ADDRESS          J0523260
                    DD941 DC      *-*       CARD INDICATOR ADDRESS      J0523270
                    DD942 DC      *-*       PROGRAM EXECUTION ADDRESS   J0523280
                    DD943 DC      *-*       TEMPERARY COUNTER FOR LOOPS J0523290
                    DD944 DC      *-*       CARD COUNT                  J0523300
                    DD945 DC      *-*       HEADER PRINT SWITCH         J0523310
                    DD946 DC      *-*       BLANK WORD COUNT            J0523320
                    DD947 DC      *-*       WORDS PER LINE              J0523330
                    DD948 DC      *-*       CORE IMAGE SWITCH           J0523340
                    DD949 DC      *-*       LINES PER BLOCK COUNT       J0523350
                    DD950 DC      *-*       WORD COUNT TO CLEAR         J0523360
                    DD951 DC      *-*       PLACEMENT ADDRESS           J0523370
                    DD952 DC      *-*       LINE ADDRESS                J0523380
                    DD953 DC      *-*       SKIP COUNT ON LINE          J0523390
                    DD954 DC      *-*       TEMPERARY STORAGE           J0523400
                    DD955 DC      *-*       TO WORKING STORAGE SWITCH   J0523410
                    DD956 DC      *-*       TO PRINTER SWITCH           J0523420
                    DD957 DC      *-*       TO PUNCH SWITCH             J0523430
                    DD958 DC      *-*       SECOND HALF SWITCH          J0523440
                    DD959 DC      *-*       TEMPORARY STORAGE           J0523450
                    DD960 DC      *-*       CONVERTED CHARACTER         J0523460
                    DD961 DC      *-*       SHIFT COUNT                 J0523470
                    DD962 DC      *-*       TEMPORARY WORD COUNT        J0523480
                    DD963 DC      *-*       TO DRIVE                    J0523490
                    DD964 DC      *-*       FROM DRIVE                  J0523500
                    DD965 DC      *-*       DB COUNT                    J0523510
                    DD966 DC      *-*       DB ADDRESS                  J0523520
                    DD967 DC      *-*       FROM WS SWITCH              J0523530
                    *                                                   J0523540
                    *   CONSTANTS                                       J0523550
                    *                                                   J0523560
                    DD968 DEC     1         CONSTANT                    J0523570
                    DD969 DC      /4040     DOUBLE CONSTANT             J0523580
                          DC      /4040                                 J0523590
                    DD970 DC      /1        CONSTANT                    J0523600
                    DD971 DC      /2        CONSTANT                    J0523610
                    DD972 DC      /3        CONSTANT                    J0523620
                    DD973 DC      /4        CONSTANT                    J0523630
                    DD974 DC      /6        CONSTANT                    J0523640
                    DD975 DC      /8        CONSTANT                    J0523650
                    DD976 DC      /9        CONSTANT                    J0523660
                    DD977 DC      /A        CONSTANT                    J0523670
                    DD978 DC      /F        CONSTANT                    J0523680
                    DD979 DC      /10       CONSTANT                    J0523690
                    DD981 DC      /12       CONSTANT                    J0523700
                    DD982 DC      /14       CONSTANT                    J0523710
                    DD983 DC      /20       CONSTANT                    J0523720
                    DD984 DC      /36       CONSTANT                    J0523730
                    DD985 DC      /51       CONSTANT                2E2 J0523740
                    DD986 DC      /37       CONSTANT                    J0523750
                    DD987 DC      /3B       CONSTANT                    J0523760
                    DD988 DC      /50       CONSTANT                    J0523770
                    DD989 DC      /140      CONSTANT                    J0523780
                    DD991 DC      /A00      CONSTANT                    J0523790
                    DD992 DC      /F00      CONSTANT                    J0523800
                    DD993 DC      /2000     CONSTANT                    J0523810
                    DD994 DC      /7F00     CONSTANT                    J0523820
                    DD995 DC      /100F     CONSTANT                    J0523830
                    DD996 DC      /8000     CONSTANT                    J0523840
                    DD997 DC      /E000     CONSTANT                    J0523850
                    DD998 DC      /FFF0     CONSTANT                    J0523860
                    DD999 DC      /FFFF     CONSTANT                    J0523870
                          BSS  E  0                                     J0523872
                    DD99A DC      /0000     DOUBLE CONSTANT USED TO2-12 J0523874
                          DC      /0035     *CALC NO. OF RECORDS   2-12 J0523876
                    *                                                   J0523880
                    *   PATCH AREA                                      J0523890
                    *                                                   J0523900
                          BSS     BUF7+/4000-*                          J0523910
                          DC      /FFFF     END OF DDUMP PATCH AREA     J0523920
                    *                                                   J0523930
                    *                                               2E2 J0523940
                    *   THE FOLLOWING INITIALIZATION PART OF DUMP   2E2 J0523950
                    *   IS OVERLAID BY BUF7 AFTER IT HAS BEEN       2E2 J0523960
                    *   EXECUTED. THUS DUMP CANNOT BE REENTERED.    2E2 J0523970
                    *                                               2E2 J0523980
                    *   ORDER THIS AND NEXT                             J0523990
                    *                                                   J0524000
                          ORG     BUF7+/4002                        2E2 J0524010
                    DD050 LDX  L2 X         LOAD REGISTER 2             J0524020
                          LD    1 THIS      CHECK ORDER (THIS AND NEXT) J0524030
                          S     1 NEXT                                  J0524040
                          BSC  L  DD100,-   BRANCH IF ORDER CORRECT     J0524050
                          LDD   1 THIS      REVERSE THIS AND NEXT       J0524060
                          RTE     16                                    J0524070
                          STD   1 THIS      STORE REVERSED ADDRESSES    J0524080
                    *                                                   J0524090
                    *   TEST TO SEE IF FUNCTION IS FROM WORKING         J0524100
                    *   STORAGE                                         J0524110
                    *                                                   J0524120
                    DD100 LD    1 IOSW      LOAD I/O SWITCH             J0524130
                          BSC     Z         SKIP IF FUNCTION TO WS      J0524140
                          LD    1 WSSW      LOAD WS SWITCH              J0524150
                          BSC     Z         SKIP IF FUNCTION FROM UA/FX J0524160
                          LD    2 DD970-X   LOAD TO SET SWITCH          J0524170
                          STO   2 DD967-X   SET SWITCH                  J0524180
                    *                                                   J0524190
                    *   DECIDE ON THE DRIVE THAT WORKING STORAGE WILL   J0524200
                    *   BE USED IF REQUIRED.                            J0524210
                    *                                                   J0524220
                          LD    1 #TODR     LOAD TO DRIVE               J0524230
                          BSC  L  *+2,-     BRANCH IF DRIVE SPECIFIED   J0524240
                          LD   L  $WSDR     LOAD JOB WS DRIVE           J0524250
                          STO   2 DD963-X   STORE TO DRIVE              J0524260
                    *                                                   J0524270
                    *   DECIDE ON THE DRIVE THAT THE DATA IS TO BE      J0524280
                    *   RETRIEVED FROM                                  J0524290
                    *                                                   J0524300
                          LD    1 #FRDR     LOAD FROM DRIVE             J0524310
                          BSC  L  DD120,-   BRANCH IF DRIVE SPECIFIED   J0524320
                          LD    2 DD967-X   PLACE INDICATOR IN CARRY    J0524330
                          SLA     16                                    J0524340
                          LD   L  $WSDR     LOAD JOB WS DRIVE           J0524350
                          BSC  L  DD120,C   BRANCH IF UA/FX PROGRAM     J0524360
                          LD    1 LSTLF     LOAD ADDRESS OF LET SECTOR  J0524370
                          SRA     12        ISOLATE DRIVE CODE          J0524380
                    DD120 STO   2 DD964-X   STORE FROM DRIVE            J0524390
                    *                                                   J0524400
                    *   FIND THE DB LENGTH OF DATA BEING DUMPED         J0524410
                    *                                                   J0524420
                          LDX  I3 DD964     REGISTER 3 HOLDS DRIVE NO   J0524430
                          LD    1 DATSW     LOAD DATA SWITCH            J0524440
                          BSC  L  DD140,Z-  BRANCH IF DUMPDATA CNT  212 J0524450
                          LD    2 DD967-X   PLACE INDICATOR IN CARRY    J0524460
                          SLA     16                                    J0524470
                          LD   L3 #WSCT+C   LOAD DB COUNT FROM WS       J0524480
                          BSC  L  DD140,C   SKIP IF DATA IN WS          J0524490
                          LD    1 #DBCT     LOAD DB COUNT FROM LET      J0524500
                    DD140 STO   2 DD965-X   STORE DB COUNT              J0524510
                          BNZ     DD150     BR IF CNT NOT ZERO      212 J0524512
                          BSI  I  LEAVE     INVALID COUNT FIELD     212 J0524514
                          DC      17        *MESSAGE                212 J0524516
                    *                                                   J0524520
                    *   FIND THE DB ADDRESS OF DATA BEING DUMPED        J0524530
                    *                                                   J0524540
                    DD150 LD    2 DD967-X   LOAD FROM WS SWITCH     212 J0524550
                          BSC  L  DD160,+-  BRANCH IF DATA IN UA/FX     J0524560
                          LD   L3 $FPAD     LOAD WS SECTOR ADDRESS      J0524570
                          SLA     4         MAKE DB ADDRESS             J0524580
                          MDX     DD180     BRANCH                      J0524590
                    DD160 LDX  I3 DELSW+C   XR3 =(ADDR OF LET ENT-1)2-3 J0524600
                          LD    3 @LFEN     LOAD DB COUNT OF ENTRY  2-3 J0524610
                          BSC  L  DD170,Z   BRANCH IF PRIME ENTRY PT2-3 J0524620
                    *                                               2-3 J0524630
                    *   LET SEARCH WAS USED TO LOCATE A SECONDARY   2-3 J0524640
                    *   ENTRY POINT (DB COUNT = 3). THE FOLLOWING   2-3 J0524650
                    *   LOOP IS USED TO SCAN BACK THROUGH THE LET   2-3 J0524660
                    *   ENTRIES UNTIL THE PRIME ENTRY POINT IS FOUND2-3 J0524670
                    *                                               2-3 J0524680
                    DD165 MDX   3 -@LFEN    MOVE POINTER BACK 1 ENT 2-3 J0524690
                          LD    3 @LFEN     LOAD DB COUNT OF ENTRY  2-3 J0524700
                          BSC  L  DD165,+-  BR IF STILL NOT PR ENT  2-3 J0524710
                    *                                               2-3 J0524720
                    *   PRIME ENTRY POINT FOUND                     2-3 J0524730
                    *                                               2-3 J0524740
                          STO   1 #DBCT     DB COUNT OF SUBROUTINE  2-3 J0524750
                          STO   2 DD965-X   SAVE FOR TERMINAL MSG   2-3 J0524760
                          LD    1 DBADR                             2-3 J0524770
                          S     1 #DBCT     ADJUST DB ADDR TO POINT 2-3 J0524780
                          STO   1 DBADR     *TO THIS SUBROUTINE     2-3 J0524790
                    *                                                   J0524800
                    DD170 LD    1 DBADR     LOAD DB ADDRESS FROM LET2-3 J0524810
                    DD180 STO   2 DD966-X   STORE DB ADDRESS        2-3 J0524820
                    *                                               2-3 J0524830
                    *   INITIALIZE ALL THE SUBROUTINE PARAMETER         J0524840
                    *                                                   J0524850
                          SLA     16                                    J0524860
                          STO   2 DD924-X   SECTOR READ SWITCH  (XG000) J0524870
                          STO   2 DD928-X   HEADER WORD SWITCH  (XG000) J0524880
                          STO   2 DD934-X   HEADER WORD SWITCH  (XF000) J0524890
                          STO   2 DD935-X   FIRST HEADER SWITCH (XF000) J0524900
                          STO   2 DD945-X   PRINT HEADER SWITCH (XL000) J0524910
                          STO   2 DD948-X   CORE IMAGE SWITCH   (XL000) J0524920
                          STO   2 DD955-X   TO WORKING STORAGE  (DD000) J0524930
                          STO   2 DD956-X   TO PRINTER          (DD000) J0524940
                          STO   2 DD957-X   TO PUNCH            (DD000) J0524950
                          STO   2 DD958-X   ZERO SECOND HALF SWITCH     J0524960
                          STO   2 DD920-X   CLEAR FIRST BFR FULL SW     J0524970
                          LD    2 DD970-X                               J0524980
                          STO   2 DD923-X   DUMP FUNCTION SWITCH(ALL)   J0524990
                          STO   2 DD927-X   WORDS TO HEADER     (XG000) J0525000
                          STO   2 DD944-X   RECORD PUNCH COUNT  (XP000) J0525010
                          LD    2 DD979-X                               J0525020
                          STO   2 DD947-X   WORDS PER LINE      (XL000) J0525030
                          LD    2 DD982-X                               J0525040
                          STO   2 DD949-X   LINES PER BLOCK     (XL000) J0525050
                          LD    1 SDBUF                                 J0525060
                          A     2 DD971-X                               J0525070
                          STO   2 DD931-X   PUT WORD ADDRESS    (XF000) J0525080
                          LD    2 DD965-X   LOAD DB COUNT               J0525090
                          M     2 DD982-X                               J0525100
                          STD   2 DD900-X   PROGRAM WORD COUNT  (XG000) J0525110
                          LD    2 DD998-X                               J0525120
                          STO   2 DD952-X   LINE ADDRESS        (XL000) J0525130
                          LD    2 DD966-X   LOAD DB ADDRESS             J0525140
                          AND   2 DD978-X   GET DB IN SECTOR            J0525150
                          M     2 DD982-X                               J0525160
                          RTE     16                                    J0525170
                          STO   2 DD954-X   COMPUTE WORD IN SECTOR      J0525180
                          A     1 LETAR                                 J0525190
                          A     2 DD971-X                               J0525200
                          STO   2 DD925-X   GET WORD ADDRESS    (XG000) J0525210
                          LD    2 DD989-X                               J0525220
                          STO   2 DD930-X   PUT WORD COUNT      (XW000) J0525230
                          S     2 DD954-X                               J0525240
                          STO   2 DD926-X   GET WORD COUNT      (XG000) J0525250
                          LD    1 NEXT                                  J0525260
                          A     2 DD970-X                               J0525270
                          STO   2 DD940-X   PUNCH WORD ADDRESS  (XF000) J0525280
                    *                                                   J0525290
                    *   PLACE ALL IOAR HEADERS                          J0525300
                    *                                                   J0525310
                          LD    2 DD966-X   (AAA-/----)                 J0525320
                          RTE     16        (----/AAA-)                 J0525330
                          LD    2 DD964-X   (000D/AAA-)                 J0525340
                          SRT     4         (0000/DAAA)                 J0525350
                          LD    2 DD989-X   (0140/DAAA)                 J0525360
                          STD  I  LETAR+C   LETAR IOAR HEADER   (XG000) J0525370
                          LDX  I3 DD963     LOAD DRIVE CODE             J0525380
                          LD   L3 $FPAD     (-AAA/----)                 J0525390
                          SRT     12        (----/AAA-)                 J0525400
                          LD    2 DD963-X   (000D/AAA-)                 J0525410
                          SRT     4         (0000/DAAA)                 J0525420
                          LD    2 DD989-X   (0140/DAAA)                 J0525430
                          STD  I  SDBUF+C   SDBUF IOAR HEADER   (XW000) J0525440
                          LD    2 DD988-X                               J0525450
                          STO  I  NEXT+C    NEXT IOAR HEADER            J0525460
                          STO  I  THIS+C    THIS IOAR HEADER            J0525470
                          LD    2 DD987-X                               J0525480
                          STO  I  PEBUF+C   PEBUF IOAR HEADER           J0525490
                    *                                                   J0525500
                    *   TEST TO SEE IF THE DUMP IS TO AN I/O DEVICE     J0525510
                    *                                                   J0525520
                          LD    1 IOSW                                  J0525530
                          BSC  L  DD360,+-  BRANCH IF DUMP TO WS        J0525540
                    *                                                   J0525550
                    *   TEST THE TYPE OF I/O DEVICE USED                J0525560
                    *                                                   J0525570
                          LD    1 PRSW                                  J0525580
                          BSC  L  DD380,Z   BRANCH IF PRINTER           J0525590
                    *                                                   J0525600
                    *   PUNCHING ON PAPER TAPE                          J0525610
                    *                                                   J0525620
                          LD    1 PTSW                                  J0525630
                          BSC  L  DD190,Z   BR IF PUNCHING PAPER TAPE   J0525640
                    *                                                   J0525650
                    *   READ IN 1442 ROUTINE                            J0525660
                    *                                                   J0525670
                          LDX  I3 IOADR+2                               J0525680
                          MDX   3 -3        POINT AT IOAR HEADER        J0525690
                          LDD   1 P1442                                 J0525700
                          STD   3 0         SET IOAR HEADER             J0525710
                          BSI  I  GET       GET 1442 ROUTINE            J0525720
                    *                                                   J0525730
                    *   INDICATE THAT THE PUNCH IS TO BE USED           J0525740
                    *                                                   J0525750
                    DD190 STX  L0 DD957     TURN  PUNCH SWITCH ON       J0525760
                    *                                                   J0525770
                    *   CLEAR THE PUNCH AREA                            J0525780
                    *                                                   J0525790
                          LDX  I3 NEXT+C    REGISTER 3 POINTS AT BUFFER J0525800
                          LDX   2 80        REGISTER 2 HOLDS WORD COUNT J0525810
                          SLA     16        LOAD A ZERO                 J0525820
                    DD200 STO   3 1         CLEAR A WORD OF BUFFER      J0525830
                          MDX   3 1         MOVE REGISTER 3             J0525840
                          MDX   2 -1        DECREMENT WORD COUNT        J0525850
                          MDX     DD200     BRANCH TO WORD COUNT NOT 0  J0525860
                    *                                                   J0525870
                    *   PLACE SEQUENCE NUMBER                           J0525880
                    *                                                   J0525890
                          LDX  L2 X         RESTORE REGISTER 2          J0525900
                          LD    1 EBCSW     NEITHER SEQUENCE NO. NOR2E2 J0525910
                    *                       *NAME IF DUMPDATA E     2E2 J0525920
                          LD    2 DD993-X                               J0525930
                          STO   3 -3        ASSUME NAME NOT 5 CHAR  2-9 J0525935
                          STO   3 -2                                    J0525940
                          STO   3 -1                                    J0525950
                          STO   3 0         STORE SEQ NUMBER 0000   2-9 J0525960
                    *                                                   J0525970
                    *   PLACE NAME ON CARD                              J0525980
                    *                                                   J0525990
                          LDD   1 #NAME                                 J0526000
                    DD220 STD   2 DD902-X   PLACE NAME REMAINING        J0526010
                          SLA     2         (XXXXXX----------)          J0526020
                          SRA     10        (0000000000XXXXXX)          J0526030
                          STO   2 DD959-X   STORE EBCDIC CHARACTER      J0526040
                          SLA     16                                    J0526050
                          STO   2 DD960-X   ZERO CHARACTER              J0526060
                          LD    2 DD959-X                               J0526070
                          AND   2 DD978-X                               J0526080
                          BSC  L  DD240,Z   BRANCH IF NUMERIC NOT ZERO  J0526090
                          MDX  L  DD959,-16 DECREMENT ZONE              J0526100
                          MDX     DD280     BRANCH                      J0526110
                    DD240 STO   2 DD961-X   STORE NUMERIC SHIFT         J0526120
                          S     2 DD976-X                               J0526130
                          BSC  L  DD260,+   BRANCH IF UNDER 9           J0526140
                          A     2 DD970-X                               J0526150
                          STO   2 DD961-X   STORE NUMERIC SHIFT         J0526160
                          LD    2 DD983-X                               J0526170
                          STO   2 DD960-X   STORE 8 PUNCH               J0526180
                    DD260 LDX  I1 DD961     LOAD SHIFT COUNT            J0526190
                          LD    2 DD993-X   LOAD A ZERO BIT             J0526200
                          SRA   1 0         SHIFT TO CORRECT POSITION   J0526210
                          OR    2 DD960-X                               J0526220
                          STO   2 DD960-X   STORE PARTIAL CONVERSION    J0526230
                    DD280 LD    2 DD959-X                               J0526240
                          SRA     4                                     J0526250
                          AND   2 DD972-X                               J0526260
                          STO   2 DD961-X   STORE ZONE SHIFT COUNT      J0526270
                          LDX  I1 DD961     LOAD SHIFT COUNT            J0526280
                          LD    2 DD996-X   LOAD A 12 BIT               J0526290
                          SRA   1 0         SHIFT TO CORRECT ZONE       J0526300
                          AND   2 DD997-X   SAVE 12,11 OR 0 ZONE        J0526310
                          OR    2 DD960-X   MAKE THE WHOLE CHARACTER    J0526320
                          STO   3 -7        PLACE CHARACTER OF NAME     J0526330
                          MDX   3 1         ADJUST BUFFER POINTER       J0526340
                          LDD   2 DD902-X                               J0526350
                          SLT     8         (XXXXXX----------)          J0526360
                          SRT     2         (--XXXXXX--------)          J0526370
                          BSC  L  DD220,Z   BRANCH IF NAME ALL DONE     J0526380
                          LDX  L1 C         RESTORE REGISTER 1          J0526390
                          MDX   3 -85       NO. CHAR & BUF BEG      2-9 J0526394
                          STX  L3 DD919     STORE TEMP              2-9 J0526395
                          LD    2 DD919-X   SET COL SEQ SWITCH      2-9 J0526396
                          S    L  NEXT+C    *NEG IF 4 COL SEQ      2-10 J0526397
                          STO   2 DD919-X   *ZERO IF 3 COL          2-9 J0526398
                    *                                                   J0526400
                    *   TEST TO SEE IF THE PROGRAM IS DISK SYSTEM       J0526410
                    *   FORMAT                                          J0526420
                    *                                                   J0526430
                          LD    1 DATSW                                 J0526440
                          BSC  L  DD340,Z   BRANCH IF DUMP DATA         J0526450
                          LD    1 #NAME                                 J0526460
                          BSC  L  DD340,+   BRANCH IF NOT DSF           J0526470
                          BSC  L  DD290     BRANCH TO REST OF DUMP  2E2 J0526480
                          END     DD000                                 J0526490
