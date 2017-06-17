                          HDNG    DELETE-   RESIDENT COMMA   2 AUG 67   J0700010
                          ABS                                           J0700020
                    $CIBA EQU     /5   ADDR OF CIB ON MASTER CARTRIDGE  J0700030
                    $CH12 EQU     /6   CHANNEL 12 INDR,NON-ZERO=CHAN 12 J0700040
                    $COMN EQU     /7   WORD COUNT OF COMMON             J0700050
                    $CORE EQU     /E   CORE SIZE,/1000=4K,/2000=8K,ETC) J0700060
                    $CTSW EQU     /F   MCR SW,NON-ZERO=// RECD TRAPPED  J0700070
                    $DADR EQU     /10  SCTR ADDR OF PROG TO BE FETCHED  J0700080
                    $DABL EQU     /11  IOCC FOR SCA RESET (ODD ADDR)    J0700090
                    $DREQ EQU     /12  INDR FOR REQUESTED V. DISK I/O   J0700100
                    $IBSY EQU     /13  PRINC I/O BUSY INDR,NON-ZERO=BSY J0700110
                    $HASH EQU     /14  WORK AREA FOR MONITOR PROGRAMS   J0700120
                    $PRET EQU     /28  ADDR PREOPERATIVE ERROR TRAP     J0700130
                    $IREQ EQU     /2C  ADDR OF INT REQUEST SUBROUTINE   J0700140
                    $ULET EQU     /2D  ADDR OF LET, LOGICAL DRIVE 0     J0700150
                    $IOCT EQU     /32  IOCS CTR,0=NO I/O IN PROGRESS    J0700160
                    $LAST EQU     /33  LAST CD INDR,NON-ZERO=LAST CARD  J0700170
                    $NDUP EQU     /34  INHIBIT DUP SW,NON-ZERO=NO DUP   J0700180
                    $NXEQ EQU     /35  INHIBIT EXEC SW,NON-ZERO=NO EXEQ J0700190
                    $PBSY EQU     /36  PRINC PTR BUSY INDR,NON-ZERO=BSY J0700200
                    $PGCT EQU     /37  PAGE NO. FOR PAGE HEADINGS       J0700210
                    $EXIT EQU     /38  ADDR CALL EXIT ENTRY POINT       J0700220
                    $LINK EQU     /39  ADDR CALL LINK ENTRY POINT       J0700230
                    $DUMP EQU     /3F  ADDR OF CALL DUMP, ENTRY POINT   J0700240
                    $DCDE EQU     /77  DRIVE CODE FOR CORE LOAD BLDR    J0700250
                    $PHSE EQU     /78  NO. OF PHASE CURRENTLY IN CORE   J0700260
                    $UFIO EQU     /79  ARM POSITION IN UNFORMATTED AREA J0700270
                    $WSDR EQU     /7A  WORKING STORAGE DRIVE CODE       J0700280
                    $WRD1 EQU     /7B  LOAD ADDR FOR CURR USER CORE LD  J0700290
                    $KCSW EQU     /7C  INHIBIT INPUT/PRINT OVERLAP SW   J0700300
                    $UFDR EQU     /7D  UNFORMATTED I/O DRIVE CODE       J0700310
                    $CPTR EQU     /7E  CHANNEL 12 INDICATOR FOR CP      J0700320
                    $1132 EQU     /7F  CHANNEL 12 INDICATOR FOR 1132    J0700330
                    $1403 EQU     /80  CHANNEL 12 INDICATOR FOR 1403    J0700340
                    $PST1 EQU     /81  ADDR POSTOP ERROR TRAP,LEVEL 1   J0700350
                    $PST2 EQU     /85  ADDR POSTOP ERROR TRAP,LEVEL 2   J0700360
                    $PST3 EQU     /89  ADDR POSTOP ERROR TRAP,LEVEL 3   J0700370
                    $PST4 EQU     /8D  ADDR POSTOP ERROR TRAP,LEVEL 4   J0700380
                    $STOP EQU     /91  ADDR PROGRAM STOP KEY TRAP       J0700390
                    $FPAD EQU     /95  FILE PROTECT ADDR (ADJ),LOG DR 0 J0700400
                    $CYLN EQU     /9A  ARM POSITION FOR LOGICAL DRIVE 0 J0700410
                    $ACDE EQU     /9F  AREA CODE FOR LOGICAL DRIVE 0    J0700420
                    $DCYL EQU     /A4  1ST DEF CYL ADDR, LOGICAL DR 0   J0700430
                    $I200 EQU     /B3  ENTRY POINT TO ILS FOR LEVEL 2   J0700440
                    $I205 EQU     /B8                                   J0700450
                    $IBT2 EQU     $I205+1 ADDR OF IBT FOR LEVEL 2       J0700460
                    $I400 EQU     /C4  ENTRY POINT TO ILS FOR LEVEL 4   J0700470
                    $I405 EQU     /D3                                   J0700480
                    $IBT4 EQU     $I405+1 ADDR OF IBT FOR LEVEL 4       J0700490
                    $I410 EQU     /D5                                   J0700500
                    $DBSY EQU     /EE  DISK BUSY INDR,NON-ZERO=DK BUSY  J0700510
                    $BYSW EQU     /1CB BYPASS SW,NOP IF FETCHING SOCAL  J0700520
                    DZ000 EQU     /0F2 DISKZ ENTRY POINT                J0700530
                    $ZEND EQU     /1E0 ADDR 1+LAST WORD OF DISKZ        J0700540
                          HDNG          CONCATENATED COMMON AREA(CATCO) J0700550
                    C     EQU     /7FA0     CATCO POINTER SET TO MIDDLE J0700560
                    *************************************************** J0700570
                    *                                                 * J0700580
                    *  INDEX REG 1 IS SET TO .C. WHEN CATCO IS FORMED * J0700590
                    *  FOR USE BY ALL OF DUP FUNCTIONS. ANY DUP ROUT  * J0700600
                    *  USING XR 1 FOR OTHER REASONS MUST RESTORE.     * J0700610
                    *  ALL VALUES IN CATCO HAVE LABELS EQUATED TO THE * J0700620
                    *  VALUE THAT INDICATES THEIR RELATIVE LOCATION   * J0700630
                    *  FROM .C.                                       * J0700640
                    *                                                 * J0700650
                    *************************************************** J0700660
                    *                                                 * J0700670
                    *             CATCO DCOM IMAGE                    * J0700680
                    *   EQUIVALENCES USED TO REFERENCE CATCO WITH XR1 * J0700690
                    *                                                 * J0700700
                    *************************************************** J0700710
                    #NAME EQU     4-/80     NAME OF PROGRAM             J0700720
                    #DBCT EQU     6-/80     DISK BLOCK COUNT OF PROGRAM J0700730
                    #FCNT EQU     7-/80     FILES SW,ZERO = NO FILES    J0700740
                    #SYSC EQU     8-/80     NON-ZERO,SYSTEM CARTRIDGE   J0700750
                    #JBSW EQU     9-/80     JOB SW,NON-ZERO='T' MODE    J0700760
                    #CBSW EQU     10-/80    CLB SW,NON-ZERO=STORECI     J0700770
                    #LCNT EQU     11-/80    NO. OF LOCALS               J0700780
                    #MPSW EQU     12-/80    NON-ZERO, CORE MAP DESIRED  J0700790
                    #MDF1 EQU     13-/80    NO. OF DUP CTRL RCDS        J0700800
                    #MDF2 EQU     14-/80    ADDR OF MODIF BUFFER        J0700810
                    #NCNT EQU     15-/80    NO. OF NOCALS               J0700820
                    #ENTY EQU     16-/80    RELATIVE ENTRY ADDR OF PROG J0700830
                    #RP67 EQU     17-/80    IF NON-ZERO,1442 MOD 6,7    J0700840
                    *                                                   J0700850
                    *   NEGATIVE VALUE REPRESENTS DEFAULT CONDITION   * J0700860
                    #TODR EQU     18-/80    DR CODE OF 'TO' DRIVE       J0700870
                    #FRDR EQU     19-/80    DR CODE OF 'FROM' DRIVE     J0700880
                    *                                                 * J0700890
                    #FHOL EQU     20-/80    ADDR OF LARGEST FXA HOLE    J0700900
                    #FSZE EQU     21-/80    BLK CNT LARGEST HOLE IN FXA J0700910
                    #UHOL EQU     22-/80    ADDR OF LARGEST UA HOLE     J0700920
                    #USZE EQU     23-/80    BLK CNT LARGEST HOLE IN UA  J0700930
                    #DCSW EQU     24-/80    NON-ZERO=DUP CALL           J0700940
                    #PIOD EQU     25-/80    PRINC. I/O INDICATOR        J0700950
                    #PPTR EQU     26-/80    PRINC. PRINTER INDICATOR    J0700960
                    #CIAD EQU     27-/80    WD NO. SCTR 0,CIL ADDR      J0700970
                    #ACIN EQU     28-/80    AVAILABLE CARTRIDGE INDR2-8 J0700980
                    #GRPH EQU     29-/80    2250 INDICATOR          2-8 J0700990
                    #GCNT EQU     30-/80    NO. G2250 RECORDS       2-8 J0701000
                    #LOSW EQU     31-/80    LOCAL-CALLS-LOCAL INDR  2-8 J0701010
                    #X3SW EQU     32-/80    SPECIAL ILS SWITCH      2-8 J0701020
                    #ECNT EQU     33-/80    NO. OF EQUAT RCDS       2-8 J0701030
                    #ANDU EQU     35-/80    END OF UA (ADJ) LOG DR 0-4  J0701040
                    #BNDU EQU     40-/80    END OF UA (BASE) LOG DR 0-4 J0701050
                    #FPAD EQU     45-/80    FILE PROTECT ADDR (BASE)    J0701060
                    #PCID EQU     50-/80    CART ID, PHYS DR 0-4        J0701070
                    #CIDN EQU     55-/80    CART ID, LOG DR 0-4         J0701080
                    #CIBA EQU     60-/80    CIB ADDR, LOG DR 0-4        J0701090
                    #SCRA EQU     65-/80    SCRA, LOG DR 0-4            J0701100
                    #FMAT EQU     70-/80    WS FORMAT, LOG DR 0-4       J0701110
                    #FLET EQU     75-/80    FLET ADDR, LOG DR 0-4       J0701120
                    #ULET EQU     80-/80    LET ADDR, LOG DR 0-4        J0701130
                    #WSCT EQU     85-/80    WS BLK CNT, LOG DR 0-4      J0701140
                    #CSHN EQU     90-/80    CUSHION END SCTR ADDR, 0-4  J0701150
                    #DCOM EQU     1         SCTR ADDR OF DCOM           J0701160
                    #HDNG EQU     7         SCTR WITH PAGE HEADING      J0701170
                    @SBFR EQU     /FB0                              2-8 J0701180
                          HDNG    CONCATENATED COMMON AREA (CATCO)      J0701190
                    *************************************************** J0701200
                    *                                                 * J0701210
                    *             CATCO IOAR HDRS FOR DUP PHASES        J0701220
                    *                                                 * J0701230
                    *************************************************** J0701240
                          ORG     -/10                                  J0701250
                    DCHDR BSS     2         DUP CONTROL            PH02 J0701260
                    STHDR BSS     2         STORE                  PH03 J0701270
                    FLHDR BSS     2         FILEQ                  PH04 J0701280
                    DMHDR BSS     2         DUMP                   PH05 J0701290
                    DLHDR BSS     2         DUMPLET                PH06 J0701300
                    DTHDR BSS     2         DELETE                 PH07 J0701310
                    DFHDR BSS     2         DEFINE                 PH08 J0701320
                    DXHDR BSS     2         DUP EXIT               PH09 J0701330
                    UCHDR BSS     2         DUP UPCOR              PH13 J0701340
                    PIHDR BSS     2         PRINCIPAL I/O BLOCK    PH14 J0701350
                    SIHDR BSS     2         PRINC I/O (W/O KB) BLK PH15 J0701360
                    PTHDR BSS     2         PAPER TAPE I/O BLOCK   PH16 J0701370
                    CIHDR BSS     2         CI PHASE READ BY CL BUILDER J0701380
                    MUHDR BSS     2         MACRO UPDATE      PH206 2-8 J0701390
                    D2HDR BSS     2         DUP CONTROL 2     PH205 2-8 J0701400
                          HDNG    DLETE-    CATCO DUP SWITCHES          J0701410
                    *************************************************** J0701420
                    *                                                   J0701430
                    *             CATCO DUP SWITCHES                  * J0701440
                    *      WORDS USED FOR COMMUNICATION OF DATA         J0701450
                    *   BETWEEN DUP ROUTINES.                           J0701460
                    *                                                 * J0701470
                    *      INITIALIZED TO ZERO BY  .REST. OF DUPCO    * J0701480
                    *                                                   J0701490
                    *************************************************** J0701500
                    CL1   EQU     *                                     J0701510
                    ASMSW BSS     1         NON ZERO IF DEFINE VOID ASM J0701520
                    BITSW BSS     1         NON ZERO TO ALLOW MDUMP-S   J0701530
                    BLKSW BSS     1         NON ZERO IF BYPASSING REC   J0701540
                    CIERR BSS     1         ERROR NO DETECTED BY PH 17  J0701550
                    CISW  BSS     1         NON ZERO IF STORE CI        J0701560
                    CLBSW BSS     1         NON ZERO IF PRECI EXECUTED  J0701570
                    CNTNO BSS     1         RECORD NO BEING PCHD OR RD  J0701580
                    *                                                 * J0701590
                    *   .DATSW. IS FILLED WITH THE CNT FIELD OF THE   * J0701600
                    *   DUP CONTROL RECORD.                           * J0701610
                    *   USED PRIMARILY FOR DATA MOVEMENT, BUT ALSO IS * J0701620
                    *   USED FOR COUNT OF RECORDS TO READ AFTER A     * J0701630
                    *   STORE CI DUP CONTROL RECORD.                  * J0701640
                    DATSW BSS     1         RECORDS VALUE IN CNT FIELD  J0701650
                    DBADR BSS     1         DB ADDR OF REFERENCED PROG  J0701660
                    DELSW BSS     1         ADDR OF REQ LET ENTRY - 1   J0701670
                    DFNSW BSS     1         NON ZERO IF DEFINE FXA      J0701680
                    DKSAD BSS     1         DK SCTR ADDR W/O DR CODE    J0701690
                    DUMPP BSS  E  2         LAST LIMITS FOR PRNTR DUMP  J0701700
                    FORSW BSS     1         NON ZERO IF DEFINE VOID FOR J0701710
                    FRWS  BSS     1         NON ZERO IF FROM FLD IS WS  J0701720
                    FXSW  BSS     1         NON ZERO IF FIXED AREA REQD J0701730
                    HOLSW BSS     1         NON ZERO IF NO CONV REQD    J0701740
                    IOSW  BSS     1         NON ZERO IF IN/OUT REQD     J0701750
                    *                                                 * J0701760
                    *   DUMPLET SWITCH - ZERO IF NOT DUMPLET/DUMPFLET * J0701770
                    *       PLUS VALUE REQUIRES PRINT OF BOTH LET/FLET* J0701780
                    *       NEG. VALUE REQUIRES PRINT OF FLET ONLY    * J0701790
                    LETSW BSS     1         NON ZERO,PRINT LET OR FLET* J0701800
                    LSTLF BSS     1         LAST LET/FLET SECT PROCESSD J0701810
                    MODSW BSS     1         NON ZERO IF STORE MOD FUNC  J0701820
                    NAMSW BSS     1         NON ZERO IF NAME IN LET/F   J0701830
                    NEGSW BSS     1         NON ZERO IF SHRINKING FXA   J0701840
                    PGMHL BSS     1         WORD COUNT OF THE PROG HDR  J0701850
                    PRSW  BSS     1         NON ZERO IF PRINTING OUTPUT J0701860
                    PTSW  BSS     1         NON ZERO IF PAPER TAPE REQD J0701870
                    SKWDS BSS     1         WDS TO SEARCH IN L/F SECT   J0701880
                    STCSW BSS     1         NON ZERO IF STORE DATA CI   J0701890
                    STSW  BSS     1         NON ZERO IF STORE TYPE      J0701900
                    TEMP1 BSS  E  1         1ST WD OF BINEB OUTPUT      J0701910
                    TEMP2 BSS     1         2ND WD OF BINEB OUTPUT      J0701920
                    TOWS  BSS     1         NON ZERO IF TO FIELD IS WS  J0701930
                    T3MSW BSS     1         TYPE 3,4 SOCAL LEVEL CELL   J0701940
                    UASW  BSS     1         NON ZERO IF USER AREA REQD  J0701950
                    WSSW  BSS     1         NON ZERO IF WORK STG REQD   J0701960
                    XEQSW BSS     1         NON ZERO IF NOT RET FR GET  J0701970
                    EBCSW BSS     1         NON ZERO IF EBC DATA OP 2E2 J0701980
                    HDNSW BSS     1         NON ZERO IF NAME IN HDR 2-8 J0701990
                    RPGSW BSS     1         NON Z IF DEFINE VOID RPG2-8 J0702000
                    DFLSW BSS     1         NON ZERO IF *DFILE      2-8 J0702010
                          BSS     1         RESERVED FOR ADDITION   2-8 J0702020
                    CL2   EQU     *-1                                   J0702030
                          HDNG    DLETE-    CATCO DUP SWITCHES          J0702040
                    *************************************************** J0702050
                    *                                                 * J0702060
                    *             CATCO DUP SWITCHES                  * J0702070
                    *  INITIALIZED BY DCTL AND NOT RESET BY .REST.    * J0702080
                    *                                                 * J0702090
                    *************************************************** J0702100
                    IOREQ BSS     1         MON-ZERO,AUX I/O SET REQ    J0702110
                    PH2   BSS     1         NON-ZERO IF DCTL IN CORE    J0702120
                    PH3   BSS     1         NON-ZERO IF STORE IN CORE   J0702130
                    PH4   BSS     1         NON-ZERO IF DUMP IN CORE    J0702140
                    ************************************************2-8 J0702150
                    *                                               2-8 J0702160
                    *             CATCO SWITCH INITIALIZED TO ZERO  2-8 J0702170
                    *   BY CCAT SUBR AND SET BY MACRO UPDATE PROGRAM2-8 J0702180
                    *                                               2-8 J0702190
                    ************************************************2-8 J0702200
                    DUPCR BSS     1         NON ZERO IF DUP CTRL RCD2-8 J0702210
                    *************************************************** J0702220
                    *                                                 * J0702230
                    *             CATCO DUP SWITCHES SET BY CCAT SUBR * J0702240
                    *                                                 * J0702250
                    *************************************************** J0702260
                    ADDR2 BSS     1         KB INTERRUPT ADDRESS        J0702270
                    KBREQ BSS     1         CONTENTS OF LOC 13          J0702280
                    *      THE FOLLOWING SWITCH IS SET TO INDICATE THE  J0702290
                    *       PRINCIPAL INPUT DEVICE                      J0702300
                    *             -  IS PAPER TAPE                      J0702310
                    *             0  IS CARD                            J0702320
                    *             +  IS KEYBOARD                        J0702330
                    INOUT BSS     1         PRINCIPAL INPUT SWITCH      J0702340
                    *                                                   J0702350
                    PTPON BSS     1         NON-ZERO IF PAPER TP ON SYS J0702360
                    *************************************************** J0702370
                    *                                                 * J0702380
                    *             LEVEL 4 INTERRUPT BRANCH TABLE      * J0702390
                    *             ADDRESSES. INITIALIZED BY CCAT,     * J0702400
                    *             AND CARD/PAPER TAPE INTERFACES.     * J0702410
                    *                                                 * J0702420
                    *************************************************** J0702430
                          ORG     /0049                                 J0702440
                    IBT   BSS     9         9 WD INTRPT BRANCH TABLE    J0702450
                    *************************************************** J0702460
                    *                                                 * J0702470
                    *             CATCO I/O ADDRESSES REQUIRED BY DUP * J0702480
                    *                                                 * J0702490
                    *************************************************** J0702500
                    P1442 BSS  E  2         SYS 1442 IOAR HEADER        J0702510
                    PRPAR BSS     2         DEFAULT LIMITS TO PRINT     J0702520
                    PHDUP BSS     1         LAST DUP PHASE IN CORE      J0702530
                    CRBUF BSS     1         81 WD BFR FOR DUP CTRL RCDS J0702540
                    DCADR BSS     1         ADDR FOR DUP CTRL IOAR HDR  J0702550
                    HDBUF BSS     1         ADDR OF PAGE HEADING BFR    J0702560
                    IOBLK BSS     1         ADDR OF DUP I/O PHASE       J0702570
                    SDBUF BSS     1         STORE/DUMP BUFFER           J0702580
                    LETAR BSS     1         ADDR OF LET SEARCH BUFFER   J0702590
                    PEBUF BSS     1         41 WD BFR FOR PACKED EBCDIC J0702600
                    THIS  BSS     1         ADDR OF DOUBLE BFR, BFR 1   J0702610
                    NEXT  BSS     1         ADDR OF DOUBLE BFR, BFR 2   J0702620
                          HDNG              DUP CORE PARAMETERS         J0702630
                    DISKZ EQU     DZ000     DISKZ ENTRY POINT           J0702640
                    B     EQU     $ZEND-2                               J0702650
                    DMPLC EQU     B         IOAR CORE ADDR FOR DMPLT    J0702660
                    EXITC EQU     B         IOAR CORE ADDR FOR DEXIT    J0702670
                    MUPC  EQU     B         IOAR CORE ADDR FOR MUP  2-8 J0702680
                    DCTL  EQU     B+/1002   ENTRY ADDRESS OF DCTL       J0702690
                    DCTLC EQU     B+/1000   IOAR CORE ADDR FOR DCTL     J0702700
                    WSDC  EQU     B+/2000   IOAR CORE ADDR FOR STORE    J0702710
                    DUMPC EQU     B+/4000   IOAR CORE ADDR FOR DDUMP    J0702720
                    DUPCO EQU     /7DB0     ADDR OF RESIDENT DUPCO      J0702730
                    CATCO EQU     /7F20-2   ADDR OF DCOM IOAR HEADER    J0702740
                    *                                                 * J0702750
                    *  DUPCO ENTRY POINTS...USED WITH INDIRECT BSI    * J0702760
                    *                                                 * J0702770
                          ORG     DUPCO                                 J0702780
                    BINEB BSS     1         CONVERSION BINARY TO EBCDIC J0702790
                    WRTDC BSS     1         WRITE DCOM(S) SUBROUTINE    J0702800
                    ENTER BSS     1         SAVE XR-S AND CONDITIONS    J0702810
                    GET   BSS     1         READ FROM DISK USING DISKZ  J0702820
                    LEAVE BSS     1         HANDLES ALL EXITS FROM DUP  J0702830
                    LINE  BSS     1         SPACES PRINTER 1 LINE       J0702840
                    MASK  BSS     1         INHIBITS KB INT REQUEST     J0702850
                    MDUMP BSS     1         PRINTS SELECTED CORE LOC-S  J0702860
                    PAGE  BSS     1         SKIPS TO NEXT PAGE          J0702870
                    PHID  BSS     1         RECORDS PHASE ID            J0702880
                    PHIDM BSS     1         RECORDS PHASE AND MODIFIER  J0702890
                    PRINT BSS     1         USE SYS PR SUBR TO PRINT    J0702900
                    PUT   BSS     1         WRITES TO DISK USING DISKZ  J0702910
                    REST  BSS     1         RESTORE CATCO,GO TO DCTL    J0702920
                    RTURN BSS     1         RESTORE XR-S AND CONDITIONS J0702930
                    *                                                 * J0702940
                    *  INPUT/OUTPUT PARAMETERS , CORE ADDRESSES       * J0702950
                    *                                                 * J0702960
                    BUF6  EQU     DUPCO-/1F ADDR OF PAGE HEADING BUFFER J0702970
                    PRPNT EQU     BUF6-/141  IOAR ADDR FOR PRINC.PTR    J0702980
                    IOADR EQU     BUF6-/38B  START OF I/O INTERFACE     J0702990
                    GETHO EQU     IOADR+4   ENTRY FOR READING HOLL TYPE J0703000
                    GETBI EQU     IOADR+5   ENTRY FOR READING BINARY    J0703010
                    PACKB EQU     IOADR+6   ENTRY TO PACK BINARY        J0703020
                    PCHBI EQU     IOADR+7   ENTRY TO PUNCH BINARY       J0703030
                    BUF1  EQU     IOADR-/51 ADDR OF NEXT BUFFER         J0703040
                    BUF2  EQU     BUF1-/52  ADDR OF THIS BUFFER         J0703050
                    BUF3  EQU     BUF2-/3E  ADDR OF PACKED EBC BUFFER   J0703060
                    BUF4  EQU     BUF3-/52  ADDR OF CONTROL RCD BUFFER  J0703070
                    BUF5  EQU     IOADR-/284    ADDR OF LET SCTR BFR    J0703080
                    BUF7  EQU     BUF5-/7142   ADDR OF STORE/DUMP BFR   J0703090
                    *                                                   J0703100
                    *                                                   J0703110
                    *                                                   J0703120
                          HDNG    DUP-DELETE  DRIVER                    J0703130
                    *************************************************** J0703140
                    *STATUS - VERSION 2, MODIFICATION 10              * J0703150
                    *                                                 * J0703160
                    *FUNCTION/OPERATION-                              * J0703170
                    *   *DELETE REMOVES PROGRAMS FROM EITHER THE FIXED* J0703180
                    *    OR USER AREA AND THEIR ENTRIES FROM LET OR   * J0703190
                    *    FLET.                                        * J0703200
                    *   *IF THE DELETION IS FROM THE USER AREA, THE   * J0703210
                    *    USER AREA IS PACKED. THE FIXED AREA IS NEVER * J0703220
                    *    PACKED SINCE PROGRAMS IN THIS AREA MUST RE-  * J0703230
                    *    MAIN AT FIXED LOCATIONS.                     * J0703240
                    *   *WHEN A PROGRAM IS DELETED FROM THE USER AREA,* J0703250
                    *    THE BOUNDARY BETWEEN THE USER AREA AND WORK- * J0703260
                    *    ING STORAGE USUALLY CHANGES. IF A PROGRAM IS * J0703270
                    *    IN WORKING STORAGE IT IS MOVED TO THE NEW    * J0703280
                    *    BOUNDARY.                                    * J0703290
                    *   *IF THE DELETION IS FROM THE USER AREA, THE   * J0703300
                    *    1DUMY ENTRY PRECEEDING THE NEXT DCI OR DDF   * J0703310
                    *    PROGRAM IS UPDATED TO KEEP THE PROGRAM AT A  * J0703320
                    *    SECTOR BOUNDARY IN THE USER AREA. IT IS POS- * J0703330
                    *    SIBLE THAT THE 1DUMY MUST BE REMOVED TO SEC- * J0703340
                    *    TORIZE THE PROGRAM.                          * J0703350
                    *   *THE LAST ENTRY IN LET REFLECTS THE DISTANCE  * J0703360
                    *    FROM THE LAST PROGRAM IN THE USER AREA TO THE* J0703370
                    *    END OF THE DISK. IF A PROGRAM IS DELETED FROM* J0703380
                    *    THE USER AREA, THIS ENTRY IS UPDATED TO RE-  * J0703390
                    *    FLECT THE SIZE OF THE DELETED PROGRAM AND ANY* J0703400
                    *    ADJUSTMENTS TO A 1DUMY ENTRY.                * J0703410
                    *   *IF THE DELETION IS FROM THE FIXED AREA, THE  * J0703420
                    *    FLET ENTRY IS CONVERTED TO A 1DUMY ENTRY AND * J0703430
                    *    THEN COMBINED WITH ANY ADJACENT 1DUMY ENTRIES* J0703440
                    *    FLET IS SHRUNK ONLY IF THERE ARE ADJACENT    * J0703450
                    *    1DUMY ENTRIES.                               * J0703460
                    *   *SECONDARY ENTRY POINTS APPEAR ONLY IN DSF    * J0703470
                    *    PROGRAMS.                                    * J0703480
                    *   *DSF ARE STORED ONLY IN THE USER AREA.        * J0703490
                    *   *SECONDARY ENTRY POINTS ARE NEVER CONTINUED   * J0703500
                    *    OVER A SECTOR BOUNDARY OF LET, I.E. ALL ENTRY* J0703510
                    *    POINTS TO A PROGRAM APPEAR IN THE SAME SECTOR* J0703520
                    *    OF LET.                                      * J0703530
                    *   *THE SUBROUTINE, MASK, IS USED TO INHIBIT ALL * J0703540
                    *    KEYBOARD REQUESTS WHILE DELETE HAS CONTROL.  * J0703550
                    *   *DE900 CONTAINS PARAMETERS USED BY SEVERAL    * J0703560
                    *    DELETE SUBROUTINES. PARAMETERS UNIQUE TO A   * J0703570
                    *    SUBROUTINE ARE CODED WITHIN THE SUBROUTINE.  * J0703580
                    *                                                 * J0703590
                    *ENTRY POINTS-                                    * J0703600
                    *   *DE000 IS THE ONLY ENTRY POINT. CONTROL IS    * J0703610
                    *    PASSED TO DELETE FROM DCTL.                  * J0703620
                    *                                                 * J0703630
                    *EXTERNAL REFERENCES-                             * J0703640
                    *   SUBROUTINES- ALL IN DUPCO                     * J0703650
                    *      *BINEB  CONVERSION BINARY TO EBCDIC        * J0703660
                    *      *GET    READ FROM DISK USING DISKZ         * J0703670
                    *      *LEAVE  HANDLES ALL EXITS FROM DUP         * J0703680
                    *      *MASK   INHIBITS KB INT REQUEST            * J0703690
                    *      *MDUMP  PRINTS SELECTED CORE LOCATIONS     * J0703700
                    *      *PHID   RECORDS PHASE ID                   * J0703710
                    *      *PRINT  USE SYS PR SUBR TO PRINT           * J0703720
                    *      *PUT    WRITES TO DISK USING DISKZ         * J0703730
                    *      *REST   RESTORE CATCO, GO TO DCTL          * J0703740
                    *      *WRTDC  WRITE DCOM(S) SUBROUTINE           * J0703750
                    *   CATCO SWITCHES-                               * J0703760
                    *      *C      CATCO POINTER                      * J0703770
                    *      *DELSW  ADDR OF REQUIRED LET/FLET ENTRY    * J0703780
                    *      *DUMPP  LAST LIMITS FOR PRINTER DUMP       * J0703790
                    *      *LETAR  ADDR OF LET SEARCH BUFFER          * J0703800
                    *      *LSTLF  LAST LET/FLET SCTR PROCESSED       * J0703810
                    *      *SDBUF  STORE/DUMP BUFFER                  * J0703820
                    *      *TEMP1  1ST WD OF BINEB OUTPUT             * J0703830
                    *   COMMA SWITCHES-                               * J0703840
                    *      $CORE   CORE SIZE,/1000=4K,/2000=8K, ETC   * J0703850
                    *      $FPAD   FILE PROTECT ADDR (ADJ)            * J0703860
                    *      $PBSY   PRINC PTR BUSY.INDR,NON-ZERO=BSY   * J0703870
                    *   DCOM SWITCHES-                                * J0703880
                    *      #ANDU   END OF UA (ADJ)                    * J0703890
                    *      #BNDU   END OF UA (BASE)                   * J0703900
                    *      #CIDN   LOGICAL CARTRIDGE ID               * J0703910
                    *      #FLET   FLET ADDRESS                       * J0703920
                    *      #FPAD   FILE PROTECT ADDRESS               * J0703930
                    *      #WSCT   WS BLOCK COUNT                     * J0703940
                    *                                                 * J0703950
                    *EXITS-                                           * J0703960
                    *   NORMAL-                                       * J0703970
                    *      *REST  RETURNS CONTROL TO DCTL             * J0703980
                    *   ERROR-                                        * J0703990
                    *      *LEAVE PRINTS ERROR MESSAGE AND RETURNS    * J0704000
                    *       CONTROL TO DCTL                           * J0704010
                    *                                                 * J0704020
                    *TABLES/WORK AREAS-                               * J0704030
                    *   *LETAR MUST POINT TO A BUFFER OF AT LEAST 664 * J0704040
                    *    DECIMAL WORDS. LET/FLET IS PROCESSED IN THIS * J0704050
                    *    BUFFER. THE CONTENTS OF THE TWO LET/FLET SEC-* J0704060
                    *    TORS ARE NEVER EXCHANGED, RATHER THE BUFFER  * J0704070
                    *    LOGIC IS SWITCHED.                           * J0704080
                    *    BFRA POINTS TO THE SECTOR CURRENTLY BEING    * J0704090
                    *    PROCESSED. BFRB POINTS TO THE NEXT SECTOR.   * J0704100
                    *    A SECTOR OF LET/FLET IS ASSUMED TO BE IN LET-* J0704110
                    *    AR WHEN CONTROL IS PASSED TO DELETE. THIS    * J0704120
                    *    SECTOR MUST CONTAIN THE SPECIFIED ENTRY POINT* J0704130
                    *    WHOSE LOCATION -1 IS CONTAINED IN DELSW.     * J0704140
                    *   *SDBUF IS USED AS A BUFFER TO SHRINK THE USER * J0704150
                    *    AREA. IF CORE SIZE IS 4K, A 642 DEC. WORD    * J0704160
                    *    BUFFER IS USED. FOR LARGER CORE SIZES IT EX- * J0704170
                    *    PANDS TO 2562 WORDS. SDBUF MAY POINT TO A    * J0704180
                    *    LOCATION WITHIN DELETE ITSELF. THE PORTION   * J0704190
                    *    OVERLAYED WILL HAVE BEEN EXECUTED. NOTE THAT * J0704200
                    *    DI000 DUMPS DELETE BEFORE SDBUF IS USED.     * J0704210
                    *                                                 * J0704220
                    *ATRRIBUTES- NONE                                 * J0704230
                    *                                                 * J0704240
                    *NOTES-                                           * J0704250
                    *      *THE DIAGNOSTIC ROUTINE DI000 IS UNDER THE * J0704260
                    *       CONTROL OF BIT SWITCH 0 WHEN THE DUP TRACE* J0704270
                    *       IS ENABLED.                               * J0704280
                    *                                                 * J0704290
                    *************************************************** J0704300
                          HDNG    DUP-DELETE  DRIVER                    J0704310
                          ORG     B         ORG TO DZEND-2              J0704320
                    *                       PROVIDE PARAMETERS FOR      J0704330
                    *                       SYSTEM LOADER               J0704340
                    *                                                   J0704350
                          DC      DEND-*    WORD COUNT OF DELETE        J0704360
                          DC      7         ID NO. OF DELETE            J0704370
                    *                                                   J0704380
                    **************************************************  J0704390
                    * DE000 IS THE DUP-DELETE DRIVER WHICH CALLS THE    J0704400
                    *       MAJOR DUP-DELETE SUBROUTINES.               J0704410
                    *       DE000 IS THE DUP-DELETE ENTRY POINT.        J0704420
                    *       THE PATCH AREA IS NEVER OVERLAYED WHILE     J0704430
                    *       DUP-DELETE MAINTAINS CONTROL.               J0704440
                    **************************************************  J0704450
                    *                                                   J0704460
                    DE000 NOP               ENTRY TO DELETE FROM DCTL   J0704470
                          NOP                                           J0704480
                    *                                                   J0704490
                          BSI  I  PHID      RECORD PHASE ID OF DELETE   J0704500
                          DC      7                                     J0704510
                    *                                                   J0704520
                          BSI  I  MASK      INHIBIT ALL KEYBOARD INTER- J0704530
                    *                       *RUPTS DURING DELETE        J0704540
                    *                                                   J0704550
                          BSI  L  IN000     PERFORM DELETE INITIALIZAT- J0704560
                    *                       *ION                        J0704570
                    *                                                   J0704580
                          BSI  L  BA000     INVESTIGATE ENTRIES BEFORE  J0704590
                    *                       *SPECIFIED ENTRY            J0704600
                    *                                                   J0704610
                          BSI  L  MU000     INVESTIGATE ENTRIES AFTER   J0704620
                    *                       *SPECIFIED ENTRY            J0704630
                    *                                                   J0704640
                          BSI  L  CN000     PROCESS LET/FLET            J0704650
                    *                                                   J0704660
                          BSI  L  DI000     DUMP DELETE AND BUFFERS     J0704670
                    *                       *TO PRINTER (BIT SW 0 ON)   J0704680
                          LD      DE915                                 J0704690
                          BSC  L  DE010,Z   BR IF DELETION IS FROM THE  J0704700
                    *                       *FIXED AREA                 J0704710
                    *                                                   J0704720
                          BSI  L  UA000     PACK THE USER AREA          J0704730
                    *                                                   J0704740
                          BSI  L  DI500     DUMP DELETE AND BUFFERS     J0704750
                    *                       *TO PRINTER (BIT SW 0 ON)   J0704760
                    *                                                   J0704770
                          LD      DE911     SET DRIVE CODE IN CALLING   J0704780
                          STO     DE005     *SEQUENCE                   J0704790
                          LDX  L3 CATCO                                 J0704800
                    *                                                   J0704810
                          BSI  I  WRTDC     WRITE DCOM(S)               J0704820
                    DE005 DC      *-*       DRIVE CODE SET HERE         J0704830
                    *                                                   J0704840
                    DE010 BSI  L  HK000     PRINT SIGN-OFF MESSAGE      J0704850
                    *                                                   J0704860
                          NOP               AREA TO PATCH A WAIT OR     J0704870
                          NOP               *BRANCH                     J0704880
                    *                                                   J0704890
                          BSI  I  REST      DELETE EXIT. RETURN TO DCTL J0704900
                    *                                               2-2 J0704910
                    DE500 BSS     20        PATCH AREA              2-2 J0704920
                    *                                                   J0704930
                    **************************************************  J0704940
                          HDNG    DUP-DELETE  CONTROLS                  J0704950
                    *                                                   J0704960
                    **************************************************  J0704970
                    * THE FOLLOWING CONTROL CELLS ARE USED BY THE       J0704980
                    * VARIOUS DELETE SUBROUTINES                        J0704990
                    **************************************************  J0705000
                    *                                                   J0705010
                    DE900 DC      *-*  ADDR IN LET/FLET OF THE PRIMARY  J0705020
                    *                  *ENTRY POINT OF THE PROGRAM TO   J0705030
                    *                  *BE DELETED                      J0705040
                    *                                                   J0705050
                    DE901 DC      *-*  AS EACH LET/FLET ENTRY IS MOVED, J0705060
                    *                  THE DB SIZE IS SUMED HERE        J0705070
                    *                                                   J0705080
                    DE902 DC      *-*  IF THE LET/FLET ENTRY PRECEEDING J0705090
                    *                  *THE ENTRY TO BE DELETED IS A    J0705100
                    *                  *DUMY, IT'S ADDRESS IS RECORDED  J0705110
                    *                  *HERE                            J0705120
                    *                                                   J0705130
                    DE904 DC      *-*  CONTAINS THE PRIMARY ENTRY POINT J0705140
                    *                  *ADDRESS OF THE LET/FLET ENTRY   J0705150
                    *                  *FOLLOWING THE SPECIFIED ENTRY.  J0705160
                    *                  *MAY BE THE ADDRESS OF A DUMY    J0705170
                    *                  *ENTRY                           J0705180
                    *                                                   J0705190
                    DE905 DC      *-*  NON-ZERO IF DE906 CONTAINS THE   J0705200
                    *                  *ADDRESS OF THE LAST LET/FLET    J0705210
                    *                  *DUMY                            J0705220
                    *                                                   J0705230
                    DE906 DC      *-*  LET/FLET ADDRESS OF A DUMY ENTRY J0705240
                    *                  *IF IT FOLLOWS THE SPECIFIED     J0705250
                    *                  *ENTRY                           J0705260
                    *                                                   J0705270
                    DE907 DC      *-*  USED AS AN INPUT PARAMETER TO    J0705280
                    *                  *SEVERAL SUBROUTINES. CONTAINS   J0705290
                    *                  *THE ADDRESS OF BFRA OR BFRB     J0705300
                    *                                                   J0705310
                    DE908 DC      *-*  CONTAINS THE SECTOR ADDRESS OF   J0705320
                    *                  *FLET (IF ANY) FOR THIS DRIVE    J0705330
                    *                                                   J0705340
                    DE909 DC      *-*  DRIVE CODE. BITS 13, 14, AND 15  J0705350
                    *                  *ON WHICH TO DELETE SPECIFIED    J0705360
                    *                  *PROGRAM                         J0705370
                    *                                                   J0705380
                    DE910 DC      *-*  'FROM' ADDR IN THE UA. CONTAINS  J0705390
                    *                  *THE DB ADDRESS OF THE FIRST     J0705400
                    *                  *NON-DUMY PROGRAM FOLLOWING THE  J0705410
                    *                  *SPECIFIED PROGRAM               J0705420
                    *                                                   J0705430
                    DE911 DC      *-*  DRIVE CODE SPECIFIED IN DE909    J0705440
                    *                  *IN BITS 1, 2, AND 3             J0705450
                    *                                                   J0705460
                    DE912 DC      *-*  'TO' ADDR IN THE UA. CONTAINS    J0705470
                    *                  *DB ADDRESS OF THE SPECIFIED     J0705480
                    *                  *PROGRAM OR OF A PRECEEDING      J0705490
                    *                  *DUMY                            J0705500
                    *                                                   J0705510
                    DE913 DC      *-*  CONTAINS THE ADDRESS OF THE      J0705520
                    *                  *'FROM' LET/FLET BUFFER. BFRA    J0705530
                    *                  *OR BFRB                         J0705540
                    *                                                   J0705550
                    DE914 DC      *-*  CONTAINS THE DB ADJUSTMENT WHICH J0705560
                    *                  *IS ADDED TO THE LAST LET DUMY   J0705570
                    *                  *ENTRY                           J0705580
                    *                                                   J0705590
                    DE915 DC      *-*  NON-ZERO INDICATES THE DELETION  J0705600
                    *                  *IS FROM FLET                    J0705610
                    *                                                   J0705620
                    DE917 DC      *-*  USER AREA DB ADDRESS OF THE      J0705630
                    *                  *FIRST DDF OR DCI PROGRAM FOLL-  J0705640
                    *                  *OWING THE SPECIFIED PROGRAM     J0705650
                    *                                                   J0705660
                    DE918 DC      *-*  SIZE OF DUMMY PRECEDING NEXT 2-1 J0705670
                    *                  *DCI/DDF PROG.NEG= NO DUMMY  2-1 J0705680
                    *                                                   J0705690
                    DE919 DC      *-*  DB SIZE OF PROGRAM TO DELETE     J0705700
                    *                                                   J0705710
                    DE920 DC      *-*  DB ADDRESS IN THE USER AREA OF   J0705720
                    *                  *THE PROGRAM TO BE DELETED       J0705730
                    *                                                   J0705740
                    DE921 DC      *-*  NON-ZERO IF PREVIOUS LET/FLET    J0705750
                    *                  SECTOR HAS BEEN READ             J0705760
                    *                                                   J0705770
                          BSS  E  0                                     J0705780
                    BFRA  DC      *-*  CONTAINS THE ADDRESS OF A 322    J0705790
                    *                  *WORD BUFFER REFERED TO AS BFRA  J0705800
                    *                                                   J0705810
                    BFRB  DC      *-*  CONTAINS THE ADDRESS OF A 322    J0705820
                    *                  *WORD BUFFER REFERED TO AS BFRB  J0705830
                    *                                                   J0705840
                    BFRAF DC      *-*  POINTS TO THE FIRST WORD OF THE  J0705850
                    *                  *FIRST ENTRY IN BFRA             J0705860
                    *                                                   J0705870
                    BFRBF DC      *-*  POINTS TO THE FIRST WORD OF THE  J0705880
                    *                  *FIRST ENTRY IN BFRB             J0705890
                    *                                                   J0705900
                    BFRAL DC      *-*  POINTS TO THE FIRST WORD OF THE  J0705910
                    *                  *LAST ENTRY IN BFRA (IN THE SEN- J0705920
                    *                  *SE OF THE LAST POSSIBLE POSIT-  J0705930
                    *                  *ION)                            J0705940
                    *                                                   J0705950
                    BFRBL DC      *-*  POINTS TO THE FIRST WORD OF THE  J0705960
                    *                  *LAST ENTRY IN BFRB              J0705970
                    *                                                   J0705980
                    **************************************************  J0705990
                          HDNG    DUP-DELETE  UA000                     J0706000
                    **************************************************  J0706010
                    * UA000 CONTROLS THE PROCESSING OF THE USER AREA    J0706020
                    *       AND OF WORKING STORAGE.                     J0706030
                    *       *A WORKING AREA OF 2 OR 8 SECTORS IS USED   J0706040
                    *        DEPENDING IF CORE IS 4K OR GREATER. THE    J0706050
                    *        BUFFER IS SPECIFIED BY SDBUF IN CATCO.     J0706060
                    *        THIS BUFFER WILL OVERLAY A PORTION OF      J0706070
                    *        DELETE                                     J0706080
                    *       *MOVES FROM FIRST PROGRAM FOLLOWING DELETED J0706090
                    *        PROGRAM TO NEXT DDF/DCI PROGRAM BY WORDS   J0706100
                    *       *MOVES THE REMAINDER OF THE USER AREA AND   J0706110
                    *        WORKING STORAGE BY SECTORS                 J0706120
                    *       *SETS #FPAD, #ANDU, AND #BNDU IN THE DCOM   J0706130
                    *        IMAGE IN CATCO                             J0706140
                    **************************************************  J0706150
                    *                                                   J0706160
                    UA000 DC      *-*       ENTRY                       J0706170
                    *                                                   J0706180
                    **************************************************  J0706190
                    * UA000 INITIALIZATION                              J0706200
                    **************************************************  J0706210
                    *                                                   J0706220
                          LDX  L1 C                                     J0706230
                          LD    1 SDBUF     SAVE THE ADDRESS OF THE     J0706240
                          STO  L  UA922     *SDBUF BUFFER               J0706250
                          LDX  I3 UA922                                 J0706260
                          A       UA912     *ADDRESS. (2)               J0706270
                          STO     UA914     CORE ADDR 1ST WD 'FROM' BFR J0706280
                          STO     UA915                                 J0706290
                    *                                                   J0706300
                    * TEST CORE SIZE                                    J0706310
                    *                                                   J0706320
                          LD   L  $CORE     FETCH CORE SIZE             J0706330
                          S       UA916     4100                        J0706340
                          BSC  L  UA010,-   BR IF CORE SIZE GT 4K       J0706350
                          LDX   1 1                                     J0706360
                          LDX  L2 320                                   J0706370
                    UA005 EQU     *-1                                   J0706380
                          LD      UA922     ADDR OF SDBUF BUFFER        J0706390
                          A       UA920     322                         J0706400
                          MDX     UA020     BR TO CONTINUE              J0706410
                    *                                                   J0706420
                    * CORE SIZE GREATER THAN 4K                         J0706430
                    *                                                   J0706440
                    UA010 LDX   1 7                                     J0706450
                          LDX  L2 2240                                  J0706460
                          LD      UA922     ADDR OF SDBUF BUFFER        J0706470
                          A       UA921     2242                        J0706480
                    UA020 STX   1 UA905     LENGTH IN SECTORS OF SDBUF  J0706490
                    *                       *-1                         J0706500
                          STX   2 UA903     WORD COUNT OF ABOVE         J0706510
                    *                                                   J0706520
                          STO     UA904     ADDR OF 1ST WORD OF LAST    J0706530
                    *                       *SECTOR OF SDBUF            J0706540
                          LD      UA905     SCTR COUNT OF 1 OR 7        J0706550
                          A       UA910     1                           J0706560
                          STO     UA918     LENGTH IN SCTRS OF SDBUF    J0706570
                          LD      UA903     WORD COUNT OF 320 OR 2240   J0706580
                          A       UA005     320                         J0706590
                          STO     UA919     LENGTH IN WORDS OF SDBUF    J0706600
                    *                                                   J0706610
                    * COMPUTE NO. WORDS FROM PROGRAM FOLLOWING SPECIF-  J0706620
                    * IED PROGRAM TO NEXT DDF DCI PROGRAM.              J0706630
                    *                                                   J0706640
                          LD      DE918     BRANCH IF REFLECTING    2-1 J0706650
                          BSC  L  UA022,-   *SIZE OF DUMMY          2-1 J0706660
                          SLA     16        IF NEGATIVE, PUT ZERO   2-1 J0706670
                          STO     DE918     *FOR NO DUMMY           2-1 J0706680
                    UA022 LD      DE917     ADDR NEX DDF OR DCI PROG    J0706690
                          S       DE918     SIZE DUMY BEFORE DCI/DDF    J0706700
                          S       DE910     ADDR FOLLOWING PROGRAM      J0706710
                          STO     UA906                                 J0706720
                    *                                                   J0706730
                    * COMPUTE 'TO' CORE ADDRESS AND SECTOR ADDRESS      J0706740
                    *                                                   J0706750
                          LD      DE912     'TO' DB ADDRESS             J0706760
                          SRT     4         'TO' SCTR ADDRESS           J0706770
                          OR      DE911     'OR' IN DRIVE CODE          J0706780
                          STO   3 1                                     J0706790
                          STO     UA908     NEXT 'TO' SCTR ADDRESS      J0706800
                          SRA     16                                    J0706810
                          SLT     4                                     J0706820
                          M       UA911     20                          J0706830
                          RTE     16                                    J0706840
                          A       UA915     FIRST WORD IN SDBUF         J0706850
                          STO     UA050     SAVE 'TO' CORE ADDRESS      J0706860
                    *                                                   J0706870
                    * COMPUTE 'FROM' SECTOR ADDRESS                     J0706880
                    *                                                   J0706890
                          LD      UA906     FETCH NO DBS AND BRANCH     J0706900
                          BSC  L  UA025,Z-  *IF SOME LEFT               J0706910
                          LD      DE912                                 J0706920
                          AND     UA923     DETERMINE IF "TO" SCTR      J0706930
                          BSC  L  UA024,+-  *EMPTY AND BR IF IT IS      J0706940
                          MDX  L  UA908,1   BUMP NEXT 'TO' SCTR ADDR    J0706950
                    UA024 BSC  L  UA170     BR TO CONTINUE              J0706960
                    UA025 LD   L  DE910     'FROM' DB ADDRESS           J0706970
                          SRT     4         'FROM' SCTR ADDRESS         J0706980
                          OR   L  DE911     'OR' IN DRIVE CODE          J0706990
                          STO     UA909     SAVE 'FROM' SCTR ADDRESS    J0707000
                          SRA     16                                    J0707010
                          SLT     4                                     J0707020
                          STO     UA900     SAVE NO. REMAINING DB'S     J0707030
                    *                                                   J0707040
                    * COMPUTE NUMBER OF WORDS BETWEEN 'FROM' AND END    J0707050
                    * OF FIRST 'FROM' SECTOR                            J0707060
                    *                                                   J0707070
                          LD      UA913     16                          J0707080
                          S       UA900                                 J0707090
                          STO     UA925                                 J0707100
                          M       UA911                                 J0707110
                          RTE     16                                    J0707120
                          STO     UA070     SAVE THE RESULT             J0707130
                    *                                                   J0707140
                    * DETERMINE IF THERE IS LESS THAN ONE SECTOR TO     J0707150
                    * PROCESS                                           J0707160
                    *                                                   J0707170
                          LD      UA906     NO. DBS TO NEXT DCI OR DDF  J0707180
                          BSC  L  UA170,+   BR IF NO DBS TO MOVE        J0707190
                          S       UA925     NO. DBS LEFT THIS SECTOR    J0707200
                          BSC  L  UA030,-   BR IF MORE 'FROM' SCTRS TO  J0707210
                    *                       *PROCESS                    J0707220
                          LD      UA906                                 J0707230
                          M       UA911     CONVERT TO WORDS            J0707240
                          RTE     16                                    J0707250
                          STO     UA070                                 J0707260
                          SRA     16        INDICATE ALL DBS READ       J0707270
                    UA030 STO     UA906     UPDATE NO. WDS LEFT TO RD   J0707280
                    *                                                   J0707290
                    * FETCH FIRST 'TO' SECTOR                           J0707300
                    *                                                   J0707310
                          LD      UA005     SET WORD COUNT OF 320       J0707320
                          STO   3 0                                     J0707330
                          BSI  L  GGET      READ THE SECTOR             J0707340
                    *                                                   J0707350
                    *                                                   J0707360
                    * DETERMINE IF FIRST 'TO' SCTR IS THE SAME AS       J0707370
                    * FIRST 'FROM' SECTOR                               J0707380
                    *                                                   J0707390
                          LD    3 1         FIRST 'TO' SCTR ADDR        J0707400
                          S       UA909     FIRST 'FROM' SCTR ADDR      J0707410
                          BSC  L  UA040,+-  BRANCH IF THE SAME          J0707420
                    *                                                   J0707430
                    * FETCH FIRST 'FROM' SECTOR                         J0707440
                    *                                                   J0707450
                          LD      UA909     'FROM' SECTOR ADDRESS       J0707460
                          RTE     16                                    J0707470
                          LD      UA005     WORD COUNT OF 320           J0707480
                          MDX  L3 320       POINT TO 2ND SCTR OF SDBUF  J0707490
                          STD   3 0                                     J0707500
                          BSI  L  GGET      READ THE SECTOR             J0707510
                    *                                                   J0707520
                    * COMPUTE 'FROM' CORE ADDRESS                       J0707530
                    *                                                   J0707540
                          LD      UA914     UPDATE CORE ADDRESS OF 1ST  J0707550
                          A       UA005     *WORD OF 'FROM' BUFFER      J0707560
                          STO     UA914                                 J0707570
                    *                                                   J0707580
                    UA040 LD      UA900     REMAINING DB'S              J0707590
                          M       UA911     20                          J0707600
                          RTE     16                                    J0707610
                          A       UA914                                 J0707620
                          STO     UA060     SAVE 'FROM' CORE ADDRESS    J0707630
                          MDX  L  UA909,1   POINT TO NEXT 'FROM' SCTR   J0707640
                          MDX     UA045     BRANCH TO CONTINUE          J0707650
                    *                                                   J0707660
                    **************************************************  J0707670
                    * CONSTANTS AND VARIABLES USED IN UA000             J0707680
                    **************************************************  J0707690
                    *                                                   J0707700
                    UA900 DC      *-*       WASTEBASKET                 J0707710
                    UA901 DC      *-*       STORAGE FOR THE TWO WORDS   J0707720
                    UA902 DC      *-*       *REPLACED BY WD CNT,STR ADR J0707730
                    UA903 DC      *-*       WORD COUNT OF 320 OR 2240   J0707740
                    UA904 DC      *-*       ADDR OF 1ST WORD OF LAST    J0707750
                    *                       *SECTOR OF SDBUF            J0707760
                    UA905 DC      *-*       SECTOR COUNT OF 1 OR 7      J0707770
                    UA906 DC      *-*       NO. OF DBS BETWEEN NEXT     J0707780
                    *                       *PROG AND NEXT DDF/DCI PROG J0707790
                    UA907 DC      *-*       END+1 ADDR OF LAST WD READ  J0707800
                    UA908 DC      *-*       NEXT 'TO' SECTOR ADDRESS    J0707810
                    UA909 DC      *-*       NEXT 'FROM' SECTOR ADDRESS  J0707820
                    UA910 DC      1         CONSTANT                    J0707830
                    UA911 DC      20        WORD COUNT OF 1 DB          J0707840
                    UA912 DC      2         CONSTANT                    J0707850
                    UA913 DC      16        DB SIZE OF 1 SECTOR         J0707860
                    UA914 DC      *-*       (SDBUF)+2 OR (SDBUF)+322    J0707870
                    UA915 DC      *-*       (SDBUF)+2                   J0707880
                    UA916 DC      4100      USED TO TEST CORE SIZE      J0707890
                    UA917 DC      *-*       NO. SCTRS FROM NEXT DDF/DCI J0707900
                    *                       *PROG TO END OF PROG IN WS  J0707910
                    UA918 DC      *-*       SCTR COUNT OF 2 OR 8        J0707920
                    UA919 DC      *-*       WORD COUNT OF 640 OR 2560   J0707930
                    UA920 DC      322       WD CNT+2 OF 1 SECTOR        J0707940
                    UA921 DC      2242      WD CNT+2 OF 7 SECTORS       J0707950
                    UA922 DC      *-*       ADDR OF SDBUF BUFFER        J0707960
                    UA923 DC      15        USED TO MASK UNSCTRIZED DBS J0707970
                    UA924 DC      320       WORD COUNT OF ONE SECTOR    J0707980
                    UA925 DC      *-*       NO. REMAINING DBS FIRST STR J0707990
                    *                                                   J0708000
                    **************************************************  J0708010
                    *                                                   J0708020
                    * MOVE 'FROM' AGAINST 'TO'                          J0708030
                    *                                                   J0708040
                    UA045 LDX  L1 *-*       SET WITH 'TO' CORE ADDRESS  J0708050
                    UA050 EQU     *-1                                   J0708060
                          LDX  L2 *-*       SET WITH 'FROM' CORE ADDR   J0708070
                    UA060 EQU     *-1                                   J0708080
                          LDX  L3 *-*       SET WITH NO. WORDS TO MOVE  J0708090
                    UA070 EQU     *-1                                   J0708100
                    UA080 LD    2 0         MOVE                        J0708110
                          STO   1 0         *A                          J0708120
                          MDX   2 1         *WORD                       J0708130
                          MDX   1 1                                     J0708140
                          MDX   3 -1        SKIP WHEN MOVE COMPLETE     J0708150
                          MDX     UA080     BRANCH TO CONTINUE          J0708160
                          STX   1 UA907     SAVE CURRENT POSITION       J0708170
                    *                                                   J0708180
                    UA090 LDX  I3 UA922     POINT TO 1ST WORD OF SDBUF  J0708190
                          LD      UA906                                 J0708200
                          BSC  L  UA100,Z-  BR IF ALL DBS NOT READ      J0708210
                          LD      UA907     ADDR LAST WD IN BFR + 1     J0708220
                          S       UA915     ADDR FIRST DATA WORD, SDBUF J0708230
                          STO   3 0         STORE WORD COUNT            J0708240
                          MDX     UA110     BRANCH TO CONTINUE          J0708250
                    *                                                   J0708260
                    * DETERMINE IF SDBUF BUFFER IS FULL                 J0708270
                    *                                                   J0708280
                    UA100 LD      UA907     ADDR LAST WD IN BFR + 1     J0708290
                          S       UA904     LAST SDBUF SECTOR ADDRESS   J0708300
                          BSC  L  UA150,+Z  BR IF SDBUF NOT FULL        J0708310
                    *                                                   J0708320
                          LD      UA903     WORD COUNT OF 320 OR 2240   J0708330
                          STO   3 0                                     J0708340
                    UA110 LD      UA908     NEXT 'TO' SCTR ADDR         J0708350
                          STO   3 1                                     J0708360
                    *                                                   J0708370
                          BSI  L  PPUT      WRITE SDBUF BUFFER TO DISK  J0708380
                    *                                                   J0708390
                    **************************************************  J0708400
                    * UPDATE NEXT 'TO' SECTOR ADDRESS                   J0708410
                    **************************************************  J0708420
                    *                                                   J0708430
                          LD    3 0         FETCH WORD COUNT            J0708440
                          RTE     16                                    J0708450
                          SRA     16                                    J0708460
                          D       UA924     320 ACC CONTAINS NO. SCTRS  J0708470
                          RTE     16        *WRITTEN                    J0708480
                          BSC  L  UA115,+-  BR IF WROTE EVEN NO. SCTRS  J0708490
                          RTE     16        INCREASE SCTR CNT BY 1      J0708500
                          A       UA910     1                           J0708510
                          MDX     UA116                                 J0708520
                    UA115 RTE     16                                    J0708530
                    UA116 A       UA908     ADD NO. SCTRS WRITTEN TO    J0708540
                          STO     UA908     *LAST 'TO' SCTR ADDR        J0708550
                          LD      UA906                                 J0708560
                          BSC  L  UA170,+   BR IF ALL DBS READ          J0708570
                    *                                                   J0708580
                    **************************************************  J0708590
                    * MOVE ANY WORDS REMAINING IN RIGHTMOST SDBUF SCTR  J0708600
                    * TO LEFTMOST SDBUF SCTR                            J0708610
                    **************************************************  J0708620
                    *                                                   J0708630
                          LD      UA907     ADDR LAST WORD IN BFR + 1   J0708640
                          S       UA904     ADDR 1ST WORD OF LAST SCTR  J0708650
                          BSC  L  UA120,Z-  BR IF THERE ARE REM. WORDS  J0708660
                          LD      UA915     RESET LAST WORD ADDR WITH   J0708670
                          STO     UA907     *1ST ADDR OF BUFFER         J0708680
                          MDX     UA150     BRANCH TO CONTINUE          J0708690
                    *                                                   J0708700
                    * MOVE THE BLOCK                                    J0708710
                    *                                                   J0708720
                    UA120 LDX  I1 UA915     FIRST LOCATION OF BUFFER    J0708730
                          LDX  I2 UA904     ADDR 1ST WD LEFT SCTR SDBUF J0708740
                          STO     UA130     SET NO. WORDS TO MOVE       J0708750
                          LDX  L3 *-*                                   J0708760
                    UA130 EQU     *-1                                   J0708770
                    UA140 LD    2 0         MOVE                        J0708780
                          STO   1 0         *A                          J0708790
                          MDX   2 1         *WORD                       J0708800
                          MDX   1 1                                     J0708810
                          MDX   3 -1        SKIP WHEN MOVE COMPLETE     J0708820
                          MDX     UA140     *BRANCH OTHERWISE           J0708830
                          STX   1 UA907     ADDR LAST WORD IN BFR + 1   J0708840
                    *                                                   J0708850
                    **************************************************  J0708860
                    * READ USER AREA INTO SDBUF BUFFER                  J0708870
                    **************************************************  J0708880
                    *                                                   J0708890
                    UA150 LDX  I3 UA907     ADDR LAST WORD IN BFR + 1   J0708900
                          MDX   3 -2                                    J0708910
                          LD    3 0         SAVE LAST 2 WORDS IN BFR    J0708920
                          STO     UA901     *SO WD CNT SCTR ADDR MAY    J0708930
                          LD    3 1         *BE SET IN                  J0708940
                          STO     UA902                                 J0708950
                          LD      UA909     SET NEXT 'FROM' SECTOR ADDR J0708960
                          STO   3 1                                     J0708970
                    *                                                   J0708980
                    * COMPUTE NO. OF FULL SECTORS WHICH MAY BE READ     J0708990
                    * INTO SDBUF                                        J0709000
                    *                                                   J0709010
                          LD      UA919     COMPUTE END OF SDBUF +1     J0709020
                          A       UA915                                 J0709030
                          S       UA907     ADDR LAST WD IN BFR + 1     J0709040
                    *                       NO. WDS AVAIL NOW IN ACC    J0709050
                          RTE     16                                    J0709060
                          SRA     16                                    J0709070
                          D       UA924     320 CONVERT TO SCTRS        J0709080
                          STO     UA905     SAVE NO. SCTRS TO READ      J0709090
                          M       UA913     16 CONVERT TO DBS           J0709100
                          RTE     16                                    J0709110
                          STO     UA900     TEMP SAVE                   J0709120
                          M       UA911     20 CONVERT TO WORDS         J0709130
                          RTE     16                                    J0709140
                          STO   3 0         SET WD CNT OF EVEN NO. SCTR J0709150
                    *                                                   J0709160
                    * UPDATE NEXT 'FROM' SECTOR ADDRESS                 J0709170
                    *                                                   J0709180
                    *                                                   J0709190
                          LD      UA906     NO. DBS LEFT TO READ        J0709200
                          S       UA900     NO. DBS ABOUT TO BE READ    J0709210
                          BSC  L  UA160,-Z  BR IF NEED TO READ THEM ALL J0709220
                    *                                                   J0709230
                          LD      UA906                                 J0709240
                          A       UA923     SECTORIZE REMAINING DBS     J0709250
                          SRA     4                                     J0709260
                          STO     UA905                                 J0709270
                          LD      UA906     CONVERT TO WORDS            J0709280
                          M       UA911                                 J0709290
                          RTE     16                                    J0709300
                          STO   3 0                                     J0709310
                          SRA     16        CLEAR NO. WDS TO READ       J0709320
                    UA160 STO     UA906     UPDATE TOTAL DBS TO PROCESS J0709330
                    *                                                   J0709340
                          BSI  L  GGET      PERFORM THE DISK I/O        J0709350
                          LD      UA909     INCREASE LAST FROM SCTR     J0709360
                          A    L  UA905     *ADDR BY NO. OF SECTORS     J0709370
                          STO     UA909     *READ                       J0709380
                    *                                                   J0709390
                          LD   L  UA907     UPDATE ADDR OF LAST WORD    J0709400
                          A     3 0         *IN BUFFER                  J0709410
                          STO  L  UA907                                 J0709420
                          LD   L  UA901     RESTORE 2 WORDS PREVIOUSLY  J0709430
                          STO   3 0         *SAVED                      J0709440
                          LD   L  UA902                                 J0709450
                          STO   3 1                                     J0709460
                          BSC  L  UA090     BRANCH TO CONTINUE          J0709470
                    *                                                   J0709480
                    **************************************************  J0709490
                    * MOVE THE REMAINDER OF THE USER AREA BY SECTORS    J0709500
                    **************************************************  J0709510
                    *                                                   J0709520
                    * COMPUTE NEXT 'FROM' SECTOR ADDRESS                J0709530
                    *                                                   J0709540
                    UA170 LD   L  DE917     CONVERT ADDR NEXT DCI/DDF   J0709550
                          A    L  UA923     *TO A SCTR ADDR. IF NO FOL- J0709560
                          SRA     4         *LOWING DCI/DDF, ADDR WILL  J0709570
                          STO  L  UA900     *BE THAT OF FILE PROTECT    J0709580
                          OR   L  DE911     'OR' IN DRIVE CODE          J0709590
                          STO  L  UA909                                 J0709600
                    *                                                   J0709610
                    * COMPUTE SECTOR ADDRESS OF THE END OF PROGRAM IN   J0709620
                    * WORKING STORAGE. IF NO PROGRAM IN WS, ADDR WILL   J0709630
                    * BE THAT OF FILE PROTECT                           J0709640
                    *                                                   J0709650
                          LDX  I3 DE909     FETCH DR CODE FOR INDEXING  J0709660
                          LD   L3 #FPAD+C   FETCH FILE PROTECT ADDR     J0709670
                          SLA     4         SHIFT OFF DR CODE IF ANY    J0709680
                          SRA     4                                     J0709690
                          S    L  UA900     SCTR ADDR DCI/DDF PROG FOL- J0709700
                          STO  L  UA900     *LOWING ENTRY TO BE DELETED J0709710
                    *                                                   J0709720
                    * UA900 NOW CONTAINS THE NO. OF SECTORS BETWEEN     J0709730
                    * NEXT DCI/DDF PROG AND START OF WORKING STORAGE.   J0709740
                    * WILL BE 0 IF NO FOLLOWING DCI/DDF PROG FOUND      J0709750
                    *                                                   J0709760
                          BSC  L  UA173,Z   BR IF HAVE SCTRS TO MOVE    J0709770
                          LD   L3 #WSCT+C   FETCH NO. DBS IN WS AND     J0709780
                          BSC  L  UA200,+-  *BRANCH IF NONE             J0709790
                    *                                                   J0709800
                    * COMPUTE NO. SECTORS OF WORKING STORAGE NEEDED TO  J0709810
                    * BE MOVED                                          J0709820
                    *                                                   J0709830
                    UA173 LD   L3 #WSCT+C   CONVERT DB COUNT TO SECTORS J0709840
                          RTE     16                                    J0709850
                          SRA     16                                    J0709860
                          D    L  UA913     16                          J0709870
                          RTE     16                                    J0709880
                          BSC  L  UA175,+-  BR IF EVEN NO. OF SECTORS   J0709890
                          RTE     16        *OTHERWISE INCREASE SCTR    J0709900
                          A    L  UA910     *COUNT BY ONE               J0709910
                          MDX     UA178                                 J0709920
                    UA175 RTE     16                                    J0709930
                    UA178 A    L  UA900     ADD NO. SCTRS BETWEEN NEXT  J0709940
                          STO  L  UA917     *DCI/DDF PROG AND WS        J0709950
                          BSC  L  UA200,+   BR IF NO SCTRS TO MOVE      J0709960
                    *                                                   J0709970
                    * UA917 NOW CONTAINS NO. ENTIRE SCTRS TO MOVE       J0709980
                    *                                                   J0709990
                    * PREPARE TO FETCH 2 OR 8 SECTORS                   J0710000
                    *                                                   J0710010
                          LDX  I3 UA922     POINT TO SDBUF BUFFER       J0710020
                    UA180 LD   L  UA909     FETCH NEXT 'FROM' SCTR ADDR J0710030
                          RTE     16                                    J0710040
                          LD   L  UA919     FETCH WD CNT OF 640 OR 2560 J0710050
                          STD   3 0                                     J0710060
                    *                                                   J0710070
                    * DETERMINE IF READ WILL EXHAUST NO. SCTRS TO MOVE  J0710080
                    *                                                   J0710090
                          LD   L  UA917     NO. SCTRS YET TO MOVE       J0710100
                          S    L  UA918     SCTR COUNT OF 2 OR 8        J0710110
                          BSC  L  UA190,-   BR IF 2 OR 8 STRS CAN BE RD J0710120
                          LD   L  UA917     FETCH NO. SCTRS YET TO MOVE J0710130
                          M    L  UA005     *AND CONVERT TO A WORD CNT  J0710140
                          RTE     16                                    J0710150
                          STO   3 0                                     J0710160
                          SRA     16        INDICATE ALL SCTRS MOVED    J0710170
                    UA190 STO  L  UA917     UPDATE NO. SCTRS YET TO MOV J0710180
                    *                                                   J0710190
                          BSI  L  GGET      FETCH THE SECTORS           J0710200
                    *                                                   J0710210
                    * PREPARE TO WRITE 2 OR 8 SECTORS                   J0710220
                    *                                                   J0710230
                          LD   L  UA908     SET NEXT 'TO' SCTR ADDRESS  J0710240
                          STO   3 1                                     J0710250
                    *                                                   J0710260
                          BSI  L  PPUT      WRITE TO DISK               J0710270
                    *                                                   J0710280
                          LD   L  UA917                                 J0710290
                          BSC  L  UA200,+   BR IF ALL SECTORS MOVED     J0710300
                    *                                                   J0710310
                          LD   L  UA908     UPDATE NEXT 'FROM' SCTR ADR J0710320
                          A    L  UA918                                 J0710330
                          STO  L  UA908                                 J0710340
                    *                                                   J0710350
                          LD   L  UA909     UPDATE NEXT 'TO' SCTR ADDR  J0710360
                          A    L  UA918                                 J0710370
                          STO  L  UA909                                 J0710380
                          MDX     UA180     BR TO MOVE MORE SCTRS       J0710390
                    *                                                   J0710400
                    * UPDATE IN-CORE DCOM                               J0710410
                    *                                                   J0710420
                    UA200 LDX  I3 DE909     DRIVE CODE FOR INDEXING     J0710430
                          LD   L3 #BNDU+C                               J0710440
                          S    L  DE914     ADJUST BY NO. DB'S REMOVED  J0710450
                          STO  L3 #ANDU+C                               J0710460
                          STO  L3 #BNDU+C                               J0710470
                          A    L  UA923     15 SECTORIZE                J0710480
                          SRA     4         CONVERT FROM DB TO SCTR ADR J0710490
                          OR   L  DE911     'OR' IN DRIVE CODE          J0710500
                          STO  L3 #FPAD+C   STORE IN IN-CORE DCOM       J0710510
                          STO  L3 $FPAD     STOR IN COMMA               J0710520
                          BSC  I  UA000     EXIT                        J0710530
                    *                                                   J0710540
                    **************************************************  J0710550
                          HDNG    DUP-DELETE  GGET AND PPUT             J0710560
                    **************************************************  J0710570
                    * GGET AND PPUT CONTROL THE DISK OPERATIONS         J0710580
                    *      FOR DELETE. THE CALLING SEQUENCES ARE AS     J0710590
                    *      IN GET AND PUT                               J0710600
                    **************************************************  J0710610
                    *                                                   J0710620
                    GGET  DC      *-*       ENTRY                       J0710630
                          STX   1 G0001     SAVE XR1                    J0710640
                          LDX  L1 C                                     J0710650
                          BSI  I  GET       READ FROM THE DISK          J0710660
                          LDX  L1 *-*       RESTORE XR1                 J0710670
                    G0001 EQU     *-1                                   J0710680
                          BSC  I  GGET      EXIT                        J0710690
                    *                                                   J0710700
                    *                                                   J0710710
                    *                                                   J0710720
                    PPUT  DC      *-*       ENTRY                       J0710730
                          STX   1 P0001     SAVE XR1                    J0710740
                          LDX  L1 C                                     J0710750
                          BSI  I  PUT       WRITE TO THE DISK           J0710760
                          LDX  L1 *-*       RESTORE XR1                 J0710770
                    P0001 EQU     *-1                                   J0710780
                          BSC  I  PPUT      EXIT                        J0710790
                    *                                                   J0710800
                    **************************************************  J0710810
                          HDNG    DUP-DELETE  HK000                     J0710820
                    **************************************************  J0710830
                    * HK000 PRINTS THE DELETE SIGN-OFF MESSAGE          J0710840
                    **************************************************  J0710850
                    *                                                   J0710860
                    HK000 DC      *-*       ENTRY                       J0710870
                          LDX  I3 DE909     DRIVE CODE FOR INDEXING     J0710880
                          LD   L3 #CIDN+C   FETCH CARTRIDGE ID          J0710890
                          BSI  I  BINEB     CONVERT TO EBCDIC           J0710900
                          LDD  L  TEMP1+C                               J0710910
                          STD     HK902                                 J0710920
                          LD   L  DE920     DB ADDR OF PROG TO DELETE   J0710930
                          BSI  I  BINEB     CONVERT TO EBCDIC           J0710940
                          LDD  L  TEMP1+C                               J0710950
                          STD     HK903                                 J0710960
                          LD   L  DE919     DB SIZE OF PROG TO DELETE   J0710970
                          BSI  I  BINEB     CONVERT TO EBCDIC           J0710980
                          LDD  L  TEMP1+C                               J0710990
                          STD     HK904                                 J0711000
                          BSI  I  PRINT     PRINT THE MESSAGE           J0711010
                          DC      HK901     ADDR OF WORD COUNT          J0711020
                          MDX  L  $PBSY,0   WAIT FOR PRINTER            J0711030
                          MDX     *-3                                   J0711040
                          BSC  I  HK000     EXIT                        J0711050
                    *                                                   J0711060
                          BSS  E  0                                     J0711070
                          BSS     1         BEGIN AT ODD LOCATION       J0711080
                    HK901 DC      22        22 WORDS OF DATA            J0711090
                          EBC     .CART ID .                            J0711100
                    HK902 BSS     2                                     J0711110
                          EBC     .   DB ADDR  .                        J0711120
                    HK903 BSS     2                                     J0711130
                          EBC     .   DB CNT   .                        J0711140
                    HK904 BSS     2                                     J0711150
                    *                                                   J0711160
                    **************************************************  J0711170
                          HDNG    DUP-DELETE  DI000                     J0711180
                    **************************************************  J0711190
                    * DI000 DUMPS DUP-DELETE WHEN THE TRACE HAS BEEN    J0711200
                    *       ENABLED. THERE ARE TWO ENTRY POINTS.        J0711210
                    *       *DI000 DUMPS DELETE, BFRA, AND BFRB.        J0711220
                    *       *DI500 DUMPS DELETE AND SDBUF.              J0711230
                    *       *MDUMP IS USED FOR DUMPING.                 J0711240
                    **************************************************  J0711250
                    *                                                   J0711260
                    DI000 DC      *-*       ENTRY                       J0711270
                          LDX  L1 C                                     J0711280
                          LD      DI900     ADDR OF END OF DELETE       J0711290
                          RTE     16                                    J0711300
                          LD      DI901     ADDR OF BEGINNING OF DELETE J0711310
                          STD   1 DUMPP                                 J0711320
                          BSI  I  MDUMP     DUMP DELETE                 J0711330
                    *                                                   J0711340
                          LD   L  BFRA      ADDR OF BEGINNING OF BFRA   J0711350
                          RTE     16                                    J0711360
                          LD   L  BFRA                                  J0711370
                          A       DI902     ADDR OF END OF BFRA         J0711380
                          RTE     16                                    J0711390
                          STD   1 DUMPP                                 J0711400
                          BSI  I  MDUMP     DUMP BFRA                   J0711410
                    *                                                   J0711420
                          LD   L  BFRB      ADDR OF BEGINNING OF BFRB   J0711430
                          RTE     16                                    J0711440
                          LD   L  BFRB                                  J0711450
                          A       DI902     ADDR OF END OF BFRB         J0711460
                          RTE     16                                    J0711470
                          STD   1 DUMPP                                 J0711480
                          BSI  I  MDUMP     DUMP BFRB                   J0711490
                          BSC  I  DI000                                 J0711500
                    *                                                   J0711510
                    * ENTRY TO DUMP DELETE AND SDBUF                    J0711520
                    *                                                   J0711530
                    DI500 DC      *-*       ENTRY                       J0711540
                          LDX  L1 C                                     J0711550
                          LD      DI900     ADDR OF END OF DELETE       J0711560
                          RTE     16                                    J0711570
                          LD      DI901     ADDR OF BEGINNING OF DELETE J0711580
                          STD   1 DUMPP                                 J0711590
                          BSI  I  MDUMP     DUMP DELETE                 J0711600
                    *                                                   J0711610
                          LD    1 SDBUF     ADDR OF BEGINNING OF SDBUF  J0711620
                          RTE     16                                    J0711630
                          LD    1 SDBUF                                 J0711640
                          A    L  UA919                                 J0711650
                          A    L  UA912     ADDR OF END OF SDBUF        J0711660
                          RTE     16                                    J0711670
                          STD   1 DUMPP                                 J0711680
                          BSI  I  MDUMP     DUMP SDBUF                  J0711690
                          BSC  I  DI500     EXIT                        J0711700
                    *                                                   J0711710
                    **************************************************  J0711720
                    * CONSTANTS AND VARIABLES               DI000       J0711730
                    **************************************************  J0711740
                    *                                                   J0711750
                    DI900 DC      DEND      ADDR OF END OF DELETE       J0711760
                    DI901 DC      DE000     ADDR OF BEGINNING OF DELETE J0711770
                    DI902 DC      322       WORD COUNT OF BFRA/BFRB     J0711780
                    *                                                   J0711790
                    **************************************************  J0711800
                          HDNG    DUP-DELETE  CN000                     J0711810
                    **************************************************  J0711820
                    * CN000 CONTROLS THE PROCESSING OF THE LET/FLET     J0711830
                    *       TABLES.                                     J0711840
                    *       *IF THE DELETION IS FROM FLET- CONVERTS     J0711850
                    *        THE ENTRY TO BE DELETED TO A 1DUMY ENTRY   J0711860
                    *        AND COMBINES IT WITH ANY SURROUNDING 1DUMY J0711870
                    *        ENTRY POINTS AND SHRINKS FLET IF NECESSARY J0711880
                    *       *IF THE DELETION IS FROM LET- REMOVES THE   J0711890
                    *        ENTRY AND ALL SECONDARY ENTRY POINTS FROM  J0711900
                    *        LET. UPDATES OR REMOVES IF NECESSARY THE   J0711910
                    *        1DUMY ENTRY BEFORE THE NEXT DCI OR DDF     J0711920
                    *        PROGRAM. UPDATES THE LAST 1DUMY ENTRY OF   J0711930
                    *        LET. SHIRNKS LET.                          J0711940
                    *       *NOTE- EXCEPT FOR INITIALIZATION AND THE    J0711950
                    *        HANDLING OF THE LAST 1DUMY ENTRY, BOTH LET J0711960
                    *        AND FLET ARE PROCESSED IN THE SAME MANNER. J0711970
                    **************************************************  J0711980
                    *                                                   J0711990
                    CN000 DC      *-*       ENTRY                       J0712000
                    *                                                   J0712010
                    * SET SWITCH                                        J0712020
                    *                                                   J0712030
                          LDX  L3 CN015     SET .CN090. TO .CN015.      J0712040
                          STX  L3 CN090                                 J0712050
                    *                                                   J0712060
                    * SET 'TO' DB ADDRESS IN USER AREA                  J0712070
                    *                                                   J0712080
                          LDX  I3 DE902     ADDR PREV DUMY, IF ANY      J0712090
                          LD   L  DE920     DB ADDR PROG IN U/F AREA    J0712100
                          MDX   3 0         SKIP IF NO PREV DUMY        J0712110
                          S     3 2         PT TO DB ADDR OF PREV DUMY  J0712120
                          STO  L  DE912     'TO' DB ADDR IN USER AREA   J0712130
                    *                                                   J0712140
                          AND  L  CN908     SAVE DB POSITION WITHIN THE J0712150
                          STO  L  CN901     *SECTOR                     J0712160
                    *                                                   J0712170
                    **************************************************  J0712180
                    * BRANCH FOR INITIALIZATION OF LET/FLET PROCESSING  J0712190
                    **************************************************  J0712200
                    *                                                   J0712210
                          LD   L  DE915     FETCH LET/FLET INDICATOR    J0712220
                          BSC  L  CN095,Z   *AND BR IF PROCESSING FLET  J0712230
                    *                                                   J0712240
                    **************************************************  J0712250
                    * INITIALIZE FOR LET PROCESSING                     J0712260
                    **************************************************  J0712270
                    *                                                   J0712280
                          LD   L  DE921     BRANCH IF PREVIOUS LET/FLET J0712290
                          BSC  L  CN005,+-  *SCTR NOT READ              J0712300
                          BSI  L  FL000     FLIP BUFFER LOGIC TO PRO-   J0712310
                    *                       *CESS PREVIOUS L/F SECTOR   J0712320
                          LD   L  DE902     ADDR OF PRECEDING DUMMY 2-1 J0712330
                          BSC  L  CN008,Z   BRANCH IF DUMMY         2-1 J0712340
                          LDX  I1 BA060     GET ADDR OF LAST ENTRY  2-1 J0712350
                          MDX   1 3         POINT TO FOLL ENTRY     2-1 J0712360
                          MDX     CN010                             2-1 J0712370
                    *                                                   J0712380
                    CN005 LDX  I1 DE900     SET 'TO' WITH ADDR PRIME    J0712390
                          LD   L  DE902     *ENTRY OR PRECEEDING DUMY   J0712400
                          BSC  L  CN010,+-                              J0712410
                    CN008 LDX  I1 DE902                                 J0712420
                    CN010 LDX  I2 DE904     SET 'FROM' WITH ADDR OF     J0712430
                    *                       *NEXT PRIME ENTRY           J0712440
                    *                                                   J0712450
                    CN015 LD   L  DE915     FETCH LET/FLET INDICATOR    J0712460
                          BSC  L  CN155,+-  *AND BR IF PROCESSING LET   J0712470
                    *                                                   J0712480
                    **************************************************  J0712490
                    * SEARCH FOR LAST LET/FLET DUMY ENTRY               J0712500
                    **************************************************  J0712510
                    *                                                   J0712520
                    CN020 LD    2 0         FETCH 1ST WORD OF NAME      J0712530
                          SLA     2         SHIFT OFF INDICATOR BITS    J0712540
                          S    L  CN902     '1DUMY MASK'                J0712550
                          BSC  L  CN185,+-  BR IF A DUMY ENTRY FOUND    J0712560
                    *                                                   J0712570
                          LD      *         INDICATE ENTRY IS NOT   2-1 J0712580
                          STO  L  CN903     *A DUMMY, WITH NEG NO.  2-1 J0712590
                    *                                                   J0712600
                    CN030 LD    2 2         ADD DB SIZE OF ENTRY TO     J0712610
                          A    L  DE901     *COMPUTE ADDR NEXT DCI/DDF  J0712620
                          STO  L  DE901                                 J0712630
                          LD    2 2                                     J0712640
                          A    L  CN901     UPDATE CURRENT SCTR POSN    J0712650
                          STO  L  CN901                                 J0712660
                    *                                                   J0712670
                          HDNG    DUP-DELETE  CN000                     J0712680
                    **************************************************  J0712690
                    * DETERMINE IF NEXT LET/FLET ENTRY WILL FIT IN 'TO' J0712700
                    * BUFFER  (ALWAYS BFRA)                             J0712710
                    **************************************************  J0712720
                    *                                                   J0712730
                          LD   L  CN916     CHECK IF DUMMY TO BE    2-1 J0712740
                          BSC  L  CN050,Z   *REMOVED WAS MOVED LAST 2-1 J0712750
                    *                       *ACROSS SCTR BOUNDARY   2-1 J0712760
                    *                                               2-1 J0712770
                          STX   2 CN040     NU000 EXPECTS XR3 TO        J0712780
                          LDX  L3 *-*       *SPECIFY LOCN OF ENTRY      J0712790
                    CN040 EQU     *-1                                   J0712800
                          LD   L  DE913     NU000 NEEDS THE BFR ADDRESS J0712810
                          STO  L  DE907                                 J0712820
                          BSI  L  NU000     COMPUTE NO. WDS IN NEXT ENT J0712830
                          STO     CN060     *(RESULTS IN ACC)           J0712840
                          BSI  L  CN800     DETERMINE IF ENT FITS IN    J0712850
                          MDX     CN050     *BFRA. BRANCH IF IT DOES    J0712860
                          BSI  L  CN700     *BRANCH IF IT DOES NOT      J0712870
                    *                                                   J0712880
                    **************************************************  J0712890
                    * MOVE A LET/FLET ENTRY                             J0712900
                    **************************************************  J0712910
                    *                                                   J0712920
                    CN050 LDX  L3 *-*       SET WITH NO. WORDS IN ENTRY J0712930
                    CN060 EQU     *-1                                   J0712940
                    *                                               2-1 J0712950
                          LD   L  CN914     FLIP INDICATORS FOR     2-1 J0712960
                          STO  L  CN915     *LAST AND 2ND LAST MOVED2-1 J0712970
                          LD    2 0         GET TYPE OF ENTRY TO    2-1 J0712980
                          SRA     15        *MOVE,AND STORE IN      2-1 J0712990
                          STO  L  CN914     *LAST-MOVED INDICATOR   2-1 J0713000
                    *                                               2-1 J0713010
                    CN070 LD    2 0         MOVE                        J0713020
                          STO   1 0         *A                          J0713030
                          MDX   2 1         *WORD                       J0713040
                          MDX   1 1                                     J0713050
                          MDX   3 -1        SKIP WHEN ENTRY MOVED       J0713060
                          MDX     CN070     *OTHERWISE BR TO CONTINUE   J0713070
                    *                                                   J0713080
                    * NOTE THAT XR1 AND XR2 ARE NOW UPDATED TO THEIR    J0713090
                    * NEXT POSITIONS                                    J0713100
                    *                                                   J0713110
                    **************************************************  J0713120
                    * DETERMINE IF THE 'FROM' BFR (BFRA OR BFRB) IS     J0713130
                    * EMPTY                                             J0713140
                    **************************************************  J0713150
                    *                                                   J0713160
                    *                                              2-10 J0713170
                          LDX  I3 DE913     ADDR OF 'FROM' BFR          J0713180
                          LD   L  DE913     ADDR OF 'FROM' BFR          J0713190
                          A    L  CN913     321                         J0713200
                          S     3 5         NO. WORDS AVAIL THIS SCTR   J0713210
                          STX   2 CN904                            2-10 J0713215
                          S       CN904     CURRENT POSITION            J0713220
                          BSC  L  CN075,Z-  BR IF "FROM" BFR NOT EMPTY  J0713230
                    *                                                   J0713240
                    **************************************************  J0713250
                    * READ NEXT LET/FLET SCTR INTO BFRB                 J0713260
                    **************************************************  J0713270
                    *                                                   J0713280
                          LDX  I3 BFRA                                  J0713290
                          LD    3 6         FETCH NEXT L/F SCTR ADDR    J0713300
                          OR   L  DE911     'OR' IN DRIVE CODE          J0713310
                          LDX  I3 BFRB                                  J0713320
                          RTE     16                                    J0713330
                          LD      CN906     WD CNT OF 320               J0713340
                          STD   3 0         SET WD CNT, SECTOR ADDRESS  J0713350
                          BSI  L  GGET      FETCH THE SECTOR            J0713360
                    *                                                   J0713370
                          STX  L3 DE913     SAVE ADDR OF 'FROM' BFR     J0713380
                    *                                                   J0713390
                          LDX  I2 BFRBF     POINT TO NEXT 'FROM' ENTRY  J0713400
                    **************************************************  J0713410
                    * DETERMINE IF THE 'TO' BFR (BFRA) IS FILLED        J0713420
                    **************************************************  J0713430
                    *                                                   J0713440
                    CN075 LD      CN916     BR IF NOT RE-PROCESSING 2-1 J0713450
                          BSC  L  CN077,+-  *A DUMMY THAT HAS BEEN  2-1 J0713460
                    *                       *MOVED ACROSS SCTR BNDY 2-1 J0713470
                          LDX  I3 BFRB      WR NEW VERSION OF PREV  2-1 J0713480
                          BSI  L  PPUT      *LET SECTOR TO DISK     2-1 J0713490
                          SLA     16                                2-1 J0713500
                          STO     CN916     RESET SPECIAL INDICATOR 2-1 J0713510
                          MDX   1 7         MOVE POINTER PAST HEADER2-1 J0713520
                          MDX     CN080                             2-1 J0713530
                    CN077 STX   1 CN904                                 J0713540
                          LD   L  BFRAL                                 J0713550
                          S       CN904                                 J0713560
                          BSI  L  CN700,Z+  BRANCH IF BFRA FILLED       J0713570
                    *                                                   J0713580
                    *                                                   J0713590
                    **************************************************  J0713600
                    * .CN090. SWITCH                                    J0713610
                    **************************************************  J0713620
                    *                                                   J0713630
                    CN080 BSC  L  *-*       SET WITH .CN015. OR .CN020. J0713640
                    CN090 EQU     *-1                                   J0713650
                    *                                                   J0713660
                    **************************************************  J0713670
                    * INITIALIZE FOR FLET PROCESSING                    J0713680
                    **************************************************  J0713690
                    *                                                   J0713700
                    CN095 BSI  L  FD000     CONVERT SPECIFIED ENTRY TO  J0713710
                    *                       *A DUMY AND COMBINE SURROU- J0713720
                    *                       *NDING DUMIES.              J0713730
                          LDX  I3 DE906                                 J0713740
                          MDX   3 0         DETERMINE IF THERE EXISTS   J0713750
                          MDX     CN120     *A FOLLOWING DUMY.BR IF YES J0713760
                    CN100 LDX  I2 DE902                                 J0713770
                          MDX   2 0         DETERMINE IF THERE EXISTS   J0713780
                          MDX     CN110     *A PREV DUMMY. BR IF YES    J0713790
                    *                                                   J0713800
                    * EXIT FROM DELETE. THERE IS NO FLET SHRINKAGE      J0713810
                    *                                                   J0713820
                    **************************************************  J0713830
                    * DELETE EXIT                                       J0713840
                    **************************************************  J0713850
                    *                                                   J0713860
                          LDX  I3 BFRA      WRITE FLET SCTR BACK TO     J0713870
                          BSI  L  PPUT      *DISK                       J0713880
                    CN115 BSC  I  CN000     EXIT                        J0713890
                    *                                                   J0713900
                    CN110 LDX  I1 DE900     SET 'TO' WITH PRIME ENTRY   J0713910
                          LDX  I2 DE904     SET 'FROM' WITH NEXT PRIME  J0713920
                          MDX     CN015     BRANCH TO CONTINUE          J0713930
                    *                                                   J0713940
                    CN120 LDX  I1 DE906     SET 'TO' WITH FOLLOW. DUMY  J0713950
                          LDX  I3 BFRA                                  J0713960
                          LD   L  DE905     DETERMINE IF IT IS LAST L/F J0713970
                          BSC  L  CN130,+-  *DUMY. BRANCH IF NOT        J0713980
                    *                                                   J0713990
                    * LAST PROG IN FLET IS BEING DELETED                J0714000
                    *                                                   J0714010
                          LD   L  BFRAL     UPDATE NO. WORDS AVAILABLE  J0714020
                          S    L  FD030                                 J0714030
                          STO   3 5                                     J0714040
                    *                                                   J0714050
                          SLA     16                               2-10 J0714053
                          STO   3 6         SET CHAIN ADDR ZERO    2-10 J0714055
                    *                                              2-10 J0714058
                          LD      CN906     UPDATE WORD COUNT. THE SCTR J0714060
                          S     3 5         *ADDRESS IS ASSUMED TO BE   J0714070
                          STO   3 0         *SET                        J0714080
                          BSI  L  PPUT      WRITE BFRA TO DISK          J0714090
                          MDX     CN115     EXIT FROM DELETE            J0714100
                    *                                                   J0714110
                    CN130 LD   L  DE913     DETERMINE IF SECOND ENTRY   J0714120
                          STO  L  DE907     *FOLLOWING THE SPECIFIED    J0714130
                          LD   L  DE904     *ENTRY IS IN THE 'FROM' BFR J0714140
                          A       CN905     *                           J0714150
                          STO     CN140     *                           J0714160
                          BSI  L  IB000     *                           J0714170
                          MDX     CN150     *BRANCH IF NOT              J0714180
                    *                                                   J0714190
                          LDX  L2 *-*       SET 'FROM' WITH THIS '2ND'  J0714200
                    CN140 EQU     *-1       *ENTRY                      J0714210
                          LD   L  DE902     DETERMINE IF HAD PREV DUMY  J0714220
                          BSC  L  CN015,+-  BR IF NOT PREV 1DUMY    2-2 J0714230
                          LDX  I1 DE900     FLET ADDR OF FOLL 1DUMY 2-2 J0714240
                          BSC  L  CN015     BR TO CONTINUE          2-2 J0714250
                    *                                                   J0714260
                    CN150 LD    3 6         SCTR ADDR NEXT LET/FLET STR J0714270
                          OR   L  DE911     'OR' IN DRIVE CODE          J0714280
                          LDX  I3 BFRB                                  J0714290
                          RTE     16                                    J0714300
                          LD      CN906     WORD COUNT OF 320           J0714310
                          STD   3 0         SET WD CNT, SCTR ADDR       J0714320
                          BSI  L  GGET      FETCH NEXT LET/FLET SCTR    J0714330
                    *                                                   J0714340
                          LDX  I2 BFRBF     SET 'FROM' WITH FIRST ENTRY J0714350
                          LD   L  BFRB      SAVE ADDR OF 'FROM' BUFFER  J0714360
                          STO  L  DE913     *(BFRB)                     J0714370
                          MDX     CN100     BRANCH TO CONTINUE          J0714380
                    **************************************************  J0714390
                    * STORAGE FOR CONSTANTS AND VARIABLES               J0714400
                    **************************************************  J0714410
                    *                                                   J0714420
                    CN900 DC      *-*       WASTEBASKET                 J0714430
                    CN901 DC      *-*       DB POSN IN BFR (REM)        J0714440
                    CN902 DC      /C448     1ST WD '1DUMY' SHIFTED LFT2 J0714450
                    CN903 DC      /FFFF    NON-NEG IF LAST MOVED DMY2-1 J0714460
                    CN904 DC      *-*       WASTEBASKET                 J0714470
                    CN905 DC      3         NO. WORDS PER ENTRY         J0714480
                    CN906 DC      320       SCTR WORD COUNT             J0714490
                    CN907 DC      322       CONSTANT                    J0714500
                    CN908 DC      15        MASK FOR UNSECTORIZED DB'S  J0714510
                    CN909 DC      16        NO. DB"S PER SECTOR         J0714520
                    CN910 DC      /7112     '1DUMY' IN NAME CODE WITH   J0714530
                    CN911 DC      /4528     *INDICATOR BITS OF 01       J0714540
                    CN912 DC      *-*       UNSECTORIZED DB'S OF REM    J0714550
                    CN913 DC      321       CONSTANT                    J0714560
                    CN914 DC      *-*       IND LAST MOVED ENTRY TYP2-1 J0714570
                    *                       *1 = DDF/DCI, 0 = OTHER 2-1 J0714580
                    CN915 DC      *-*       IND 2ND LAST MOVED ENTRY2-1 J0714590
                    CN916 DC      *-*       SPECIAL IND, NON-ZERO IF2-1 J0714600
                    *                       *PREV DUMMY NOT IN BFRA 2-1 J0714610
                          HDNG    DUP-DELETE  CN000                     J0714620
                    **************************************************  J0714630
                    * LET PROCESSING. TEST ENTRY FOR BEING A DCI OR     J0714640
                    * DDF PROGRAM                                       J0714650
                    **************************************************  J0714660
                    *                                                   J0714670
                    CN155 LD    2 0         TEST INDICATOR BIT AND      J0714680
                          BSC  L  CN020,-   *BRANCH IF NOT DCI OR DDF   J0714690
                    *                                                   J0714700
                    * DCI OR DDF ENTRY FOUND                            J0714710
                    *                                                   J0714720
                          LD      CN903     SAVE SIZE OF PRECEEDING     J0714730
                          STO  L  DE918     *DUMY                       J0714740
                          LD   L  DE901     SAVE DB ADDR OF NEXT DCI OR J0714750
                          STO  L  DE917     *DDF PROGRAM                J0714760
                          LD      CN901     'AND' OUT NO. OF DB'S FROM  J0714770
                          AND     CN908     *START OF SECTOR            J0714780
                          STO     CN912                                 J0714790
                          BSC  L  CN156,Z   BR IF NOT UA SCTR BNDRY 2-1 J0714800
                          LD      CN903     IF LAST ENTRY PROCESSED 2-1 J0714810
                          BSC  L  CN165,-   *WAS DUMMY,BR TO UPDATE 2-1 J0714820
                          LD      CN914     NO DUMMY. CHK TYPE PREV 2-1 J0714830
                          BSC  L  CN160,Z   *ENTRY, BR IF DDF/DCI   2-1 J0714840
                          LD      CN909     PREV ENTRY DSF. PREPARE 2-1 J0714850
                          STO     CN912     *FOR INSERTING DUMMY OF 2-1 J0714860
                          MDX     CN157     *ZERO DB'S              2-1 J0714870
                    *                                                   J0714880
                    * INSERT OR UPDATE A DUMY                           J0714890
                    *                                                   J0714900
                    CN156 LD      CN903     DETERMINE IF LAST ENTRY     J0714910
                          BSC  L  CN165,-   *PROC'D A DUMMY.BR YES  2-1 J0714920
                    *                                                   J0714930
                    * INSERT A DUMY                                     J0714940
                    *                                                   J0714950
                    CN157 LD      CN905     DETERMINE IF ROOM FOR NEW   J0714960
                          BSI  L  CN800     *DUMY ENT IN "TO" BFR       J0714970
                          MDX     CN158     *BRANCH IF THERE IS         J0714980
                    *                                                   J0714990
                          BSI  L  CN700                                 J0715000
                    *                       *AND UPDATE FOR NEXT'TO'BFR J0715010
                    CN158 LD      CN909                                 J0715020
                          S       CN912                                 J0715030
                          STO   1 2         SIZE OF DUMY                J0715040
                          LD      CN910                                 J0715050
                          STO   1 0         NAME                        J0715060
                          LD      CN911     *OF                         J0715070
                          STO   1 1         *DUMMY                      J0715080
                          LD   L  DE914     UPDATE LAST DUMMY INCR      J0715090
                          S     1 2                                     J0715100
                          STO  L  DE914                                 J0715110
                          MDX   1 3         RESET 'TO' ADDR             J0715120
                    *                                                   J0715130
                    * SET SWITCH                                        J0715140
                    *                                                   J0715150
                    CN160 LDX  L3 CN020     SET SWITCH CN090 TO         J0715160
                          STX  L3 CN090     *CN020                      J0715170
                          BSC  L  CN020     BRANCH TO CONTINUE          J0715180
                    *                                                   J0715190
                    * LAST LET ENTRY PROCESSED WAS A DUMY - UPDATE      J0715200
                    * IT IF NECESSARY                                   J0715210
                    *                                                   J0715220
                    CN165 STX   1 CN900                             2-1 J0715230
                          LD      CN900                             2-1 J0715240
                          S       CN905                             2-1 J0715250
                          S    L  BFRAF     DETERMINE IF PREV DUMMY 2-1 J0715260
                          BSC  L  CN175,Z+  *IS IN BFRA. BR IF NOT  2-1 J0715270
                    CN167 LD      CN901                             2-1 J0715280
                          S     1 -1        SUB SIZE OF PREV DUMMY  2-1 J0715290
                          AND     CN908                             2-1 J0715300
                          STO     CN912     SAVE REMAINING DBS      2-1 J0715310
                    *                                                   J0715320
                    CN168 LD   L  DE914     UPDATE LAST DUMY INCREMENT  J0715330
                          A     1 -1                                    J0715340
                          STO  L  DE914                                 J0715350
                          LD      CN912                                 J0715360
                          BSC  L  CN170,Z   *DUMY WILL SECTORIZE.BR NO  J0715370
                    CN169 LD      CN915     CHK TYPE OF ENTRY BEFORE2-1 J0715380
                          BSC  L  CN172,+-  *DUMMY,BRANCH IF DSF    2-1 J0715390
                          MDX   1 -3        POINT 'TO' OVER PREV DUMY   J0715400
                          MDX     CN160     BRANCH TO CONTINUE          J0715410
                    *                                                   J0715420
                    CN170 LD      CN909     UPDATE PREV DUMY TO SECTOR- J0715430
                          S       CN912     *IZE NEXT PROGRAM           J0715440
                    CN172 STO   1 -1                                    J0715450
                          LD   L  DE914     UPDATE LAST DUMY INCREMENT  J0715460
                          S     1 -1                                    J0715470
                          STO  L  DE914                                 J0715480
                    *                                               2-1 J0715490
                          LD      CN916     IF DUMMY ENTRY IN PREV  2-1 J0715500
                          BSC  L  CN160,+-  *SECTOR,DON'T BR TO CONT2-1 J0715510
                          BSI  L  PPUT      WRITE SCTR WITH UPDATED 2-1 J0715520
                          SLA     16        *DUMMY TO DISK, AND     2-1 J0715530
                          STO     CN916     *RESTORE SPECIAL INDR   2-1 J0715540
                          LDX  I1 BFRAF     PT TO 1ST ENT NEXT SCTR 2-3 J0715550
                          MDX     CN160     BRANCH TO CONTINUE          J0715560
                    *                                                   J0715570
                    * PREVIOUS ENTRY NOT IN BFRA. ASSUME IT IS IN BFRB  J0715580
                    *                                                   J0715590
                    CN175 LDX  I3 BFRB                                  J0715600
                          LD   L  BFRBL                                 J0715610
                          S     3 5                                     J0715620
                          STO     CN180                                 J0715630
                          LDX  L1 *-*       SET WITH ADDR OF LAST ENTRY J0715640
                    CN180 EQU     *-1                                   J0715650
                          MDX   1 3                                     J0715660
                          STO     CN916     IND DUMMY IN PREV SCTR  2-1 J0715670
                          MDX     CN167     BR TO COMP REM DB'S     2-1 J0715680
                    *                                                   J0715690
                    **************************************************  J0715700
                    * A DUMY ENTRY HAS BEEN FOUND IN EITHER LET OR FLET J0715710
                    **************************************************  J0715720
                    *                                                   J0715730
                    CN183 BSC  L  CN030     BRANCH TO CONTINUE          J0715740
                    *                                                   J0715750
                    CN185 LD    2 2         INDICATE DUMMY BEING MOVED  J0715760
                          STO     CN903                                 J0715770
                    *                                                   J0715780
                          LD   L  DE913     ADDR OF 'FROM' BFR          J0715790
                          STO  L  DE907                                 J0715800
                          BSI     LA000     DETERMINE IF LAST LET/FLET  J0715810
                          MDX     CN183     SCTR. BRANCH IF NOT         J0715820
                          STX   2 CN190                                 J0715830
                          LDX  L3 *-*       IB000 EXPECTS XR3 SET WITH  J0715840
                    CN190 EQU     *-1       *ADDRESS TO BE TESTED       J0715850
                          MDX   3 3         POINT TO NEXT ENTRY         J0715860
                          BSI  L  IB000     DETERMINE IF NEXT ENTRY IS  J0715870
                          MDX     CN193     *IN BFR AND BRANCH IF NOT   J0715880
                          MDX     CN183                                 J0715890
                    *                                                   J0715900
                    * THE LAST LET/FLET DUMY HAS BEEN FOUND             J0715910
                    *                                                   J0715920
                    CN193 LD   L  DE915     FETCH LET/FLET INDICATOR    J0715930
                          BSC  L  CN195,Z   BRANCH IF PROCESSING FLET   J0715940
                    *                                                   J0715950
                    *                                                   J0715960
                          LD   L  DE917                                 J0715970
                          BSC  L  CN194,Z                               J0715980
                          LD   L  DE901                                 J0715990
                          STO  L  DE917                                 J0716000
                    CN194 LD    2 2                                     J0716010
                          A    L  DE914     *ENTRY                      J0716020
                          STO   2 2                                     J0716030
                    *                                                   J0716040
                    CN195 LD   L  CN905     3                           J0716050
                          BSI     CN800     DETERMINE IF DUMY WILL FIT  J0716060
                          MDX     CN200     *IN BFRA. BR IF IT WILL     J0716070
                    *                                                   J0716080
                          BSI     CN700     WRITE 'TO' BFR TO DISK      J0716090
                    *                                                   J0716100
                    CN200 LD    2 0         MOVE                        J0716110
                          STO   1 0         *THE                        J0716120
                          LD    2 1         *LAST                       J0716130
                          STO   1 1         *DUMMY                      J0716140
                          LD    2 2         *ENTRY                      J0716150
                          STO   1 2                                     J0716160
                          MDX   1 3         INCREMENT 'TO' POINTER      J0716170
                          STX  L1 CN900                                 J0716180
                          LD   L  BFRAL                                 J0716190
                          A    L  CN905     3                           J0716200
                          S    L  CN900                                 J0716210
                          LDX  I3 BFRA      UPDATE NO. WDS AVAILABLE    J0716220
                          STO   3 5         *IN LET/FLET HEADER         J0716230
                    *                                                   J0716240
                          LD   L  CN906     SET WORD COUNT. SCTR ADDR   J0716250
                          S     3 5         *ASSUMED TO BE SET          J0716260
                          STO   3 0                                     J0716270
                    *                                                   J0716280
                          LDX  I1 DE913     SET IN SECTOR ID WHICH WAS  J0716290
                          LD    1 6         SET CHAIN ADDRESS           J0716300
                          STO   3 6                                     J0716310
                    *                                                   J0716320
                          BSI  L  PPUT      WRITE LAST L/F SCTR TO DISK J0716330
                    *                                                   J0716340
                          BSC  I  CN000     EXIT FROM CN000             J0716350
                          HDNG    DUP-DELETE  CN000                     J0716360
                    **************************************************  J0716370
                    * CN700 WRITES BFRA TO THE DISK AND RESETS CON-     J0716380
                    *       TROLS                                       J0716390
                    *       BSI     CN700                               J0716400
                    *       NORMAL RETURN                               J0716410
                    **************************************************  J0716420
                    *                                                   J0716430
                    *                                                   J0716440
                    CN700 DC      *-*       ENTRY                       J0716450
                    *                                                   J0716460
                    * UPDATE NO. WDS AVAILABLE IN HEADER                J0716470
                    *                                                   J0716480
                          STX  L1 CN904                                 J0716490
                          STX  L1 CN904                                 J0716500
                          LD   L  BFRAL                                 J0716510
                          A    L  CN905                                 J0716520
                          S    L  CN904     1ST AVAILABLE POSITION      J0716530
                          LDX  I3 BFRA                                  J0716540
                          STO   3 5         NO. WDS AVAILABLE           J0716550
                    *                                                   J0716560
                    * WRITE BFRA TO DISK                                J0716570
                    *                                                   J0716580
                          LD   L  CN906     SET WORD COUNT. SCTR ADDR   J0716590
                          S     3 5         *ASSUMED SET                J0716600
                          STO   3 0                                     J0716610
                          BSI  L  PPUT      WRITE BFRA TO DISK          J0716620
                    *                                                   J0716630
                    * FLIP BFRA/BFRB LOGIC AND RESET 'TO' ADDR          J0716640
                    *                                                   J0716650
                          BSI  L  FL000     FLIP LOGIC                  J0716660
                          LDX  I1 BFRAF     RESET "TO"                  J0716670
                          BSC  I  CN700     EXIT                        J0716680
                    *                                                   J0716690
                    **************************************************  J0716700
                          HDNG    DUP-DELETE  CN000                     J0716710
                    **************************************************  J0716720
                    * CN800 DETERMINES IF A MULTI-ENTRY WILL FIT INTO   J0716730
                    *       BFRA. THE ACCUMULATOR MUST CONTAIN THE      J0716740
                    *       NUMBER OF WORDS IN THE MULTI-ENTRY AND XR1  J0716750
                    *       MUST POINT TO THE FIRST AVAILABLE LOCATION  J0716760
                    *       IN BFRA.                                    J0716770
                    *       BSI     CN800                               J0716780
                    *       YES EXIT                                    J0716790
                    *       NO  EXIT                                    J0716800
                    **************************************************  J0716810
                    *                                                   J0716820
                    CN800 DC      *-*       ENTRY                       J0716830
                          STO  L  CN900     NO. WDS IN ENTRY            J0716840
                          STX  L1 CN904     1ST AVAILABLE LOCATION      J0716850
                          LD   L  BFRAL                                 J0716860
                          A    L  CN905                                 J0716870
                          S    L  CN904     ACC SET WITH NO. WDS AVAIL  J0716880
                          S    L  CN900     NO. WDS REQUIRED            J0716890
                          BSC  I  CN800,-   EXIT CALL+1 IF IT FITS      J0716900
                          MDX  L  CN800,1                               J0716910
                          BSC  I  CN800     EXIT CALL+2. DOES NOT FIT   J0716920
                    *                                                   J0716930
                    **************************************************  J0716940
                          HDNG    DUP-DELETE  FI000                     J0716950
                    **************************************************  J0716960
                    * FI000 DETERMINES IF A SPECIFIED LET/FLET SECTOR   J0716970
                    *       IS THE FIRST LET SECTOR OR FIRST FLET SCTR  J0716980
                    *       BFRA MUST CONTAIN THE ADDRESS OF THE SCTR   J0716990
                    *       TO BE TESTED                                J0717000
                    *       BSI     FI000                               J0717010
                    *       EXIT IF NOT FIRST SECTOR                    J0717020
                    *       EXIT IF FIRST SECTOR                        J0717030
                    **************************************************  J0717040
                    *                                                   J0717050
                    FI000 DC      *-*       ENTRY                       J0717060
                          STX   1 FI010     SAVE XR1                    J0717070
                          LDX  I1 BFRA      POINT TO SECTOR             J0717080
                          LD    1 2         FETCH SECTOR ID             J0717090
                          BSC     Z         BR IF FIRST LET SCTR. ID=0  J0717100
                          S       FI900     FIRST FLET SCTR ID=16       J0717110
                          BSC  L  FI005,Z   BR IF A FIRST SCTR          J0717120
                          MDX  L  FI000,1   SET EXIT TO CALL+2          J0717130
                    FI005 LDX  L1 *-*       RESTORE XR1                 J0717140
                    FI010 EQU     *-1                                   J0717150
                          BSC  I  FI000     EXIT                        J0717160
                    *                                                   J0717170
                    **************************************************  J0717180
                    *STORAGE FOR CONSTANTS AND VARIABLES IN FI000       J0717190
                    **************************************************  J0717200
                    *                                                   J0717210
                    FI900 DC      16        SCTR ID FOR FIRST FLET SCTR J0717220
                    *                                                   J0717230
                    **************************************************  J0717240
                          HDNG    DUP-DELETE  LA000                     J0717250
                    **************************************************  J0717260
                    * LA000 DETERMINES IF A SPECIFIED LET/FLET SECTOR   J0717270
                    *       IS THE LAST LET SECTOR OR LAST FLET SECTOR  J0717280
                    *       ACC MUST CONTAIN THE ADDRESS OF THE SECTOR  J0717290
                    *       TO BE TESTED                                J0717300
                    *       BSI     LA000                               J0717310
                    *       EXIT IF NOT LAST SCTR                       J0717320
                    *       EXIT IF LAST SCTR                           J0717330
                    **************************************************  J0717340
                    *                                                   J0717350
                    LA000 DC      *-*       ENTRY                       J0717360
                          STX   3 LA010     SAVE XR3                    J0717370
                          STO     LA003                                 J0717380
                          LDX  L3 *-*       POINT TO BUFFER TO BE       J0717390
                    LA003 EQU     *-1       *TESTED                     J0717400
                          LD    3 6         FETCH CHAIN ADDRESS         J0717410
                          BSC  L  LA020,+-  BR IF LAST SECTOR           J0717420
                          S    L  DE908     FIRST FLET SCTR ADDRESS     J0717430
                          BSC  L  LA020,+-  BR IF LAST LET SCTR         J0717440
                    LA005 LDX  L3 *-*       RESTORE XR3                 J0717450
                    LA010 EQU     *-1                                   J0717460
                          BSC  I  LA000     EXIT                        J0717470
                    LA020 MDX  L  LA000,1   SET EXIT TO CALL+2          J0717480
                          MDX     LA005     BR TO EXIT                  J0717490
                    *                                                   J0717500
                    **************************************************  J0717510
                          HDNG    DUP-DELETE  TD000                     J0717520
                    *************************************************** J0717530
                    * TD000 DETERMINES IF A SPECIFIED LET/FLET ENTRY    J0717540
                    *       IS A DUMY ENTRY                             J0717550
                    *       XR3 MUST POINT TO THE ENTRY                 J0717560
                    *       BSI     TD000                               J0717570
                    *       EXIT IF IT IS A DUMY                        J0717580
                    *       EXIT IF IT IS NOT                           J0717590
                    *************************************************** J0717600
                    *                                                   J0717610
                    TD000 DC      *-*       ENTRY                       J0717620
                          LD    3 0         FIRST WORD OF THE NAME      J0717630
                          SLA     2         SHIFT OFF INDICATOR BITS    J0717640
                          S       TD900     1ST WD '1DUMY' SHIFTED LFT2 J0717650
                          BSC  I  TD000,+-  EXIT TO CALL + 1 IF IT IS   J0717660
                          MDX  L  TD000,1                               J0717670
                          BSC  I  TD000     EXIT TO CALL + 2 IF NOT     J0717680
                    *                                                   J0717690
                    *************************************************** J0717700
                    * STORAGE FOR CONSTANTS AND VARIABLES IN TD000      J0717710
                    *************************************************** J0717720
                    *                                                   J0717730
                    TD900 DC      /C448     1ST WD '1DUMY' SHIFTED LFT2 J0717740
                    *                                                   J0717750
                    *************************************************** J0717760
                          HDNG    DUP-DELETE  IB000                     J0717770
                    *************************************************** J0717780
                    * IB000 DETERMINES IF A SPECIFIED ENTRY IS IN A     J0717790
                    *       SPECIFIED BUFFER                            J0717800
                    *       XR3 MUST POINT TO THE ENTRY TO BE TESTED    J0717810
                    *       DE907 MUST CONTAIN THE BUFFER ADDRESS       J0717820
                    *       BSI     IB000                               J0717830
                    *       NOT IN BFR EXIT                             J0717840
                    *       IN BFR EXIT                                 J0717850
                    *************************************************** J0717860
                    *                                                   J0717870
                    IB000 DC      *-*       ENTRY                       J0717880
                          STX   3 IB010     SAVE ADDRESS TO BE TESTED   J0717890
                          LDX  I3 DE907     ADDR OF BFRA OR BFRB        J0717900
                          MDX  L3 322       POINT TO 1+END OF BFRA/BFRB J0717910
                          STX   3 IB900                                 J0717920
                          LD      IB900                                 J0717930
                          S    L3 -317      NO. WDS AVAIL THIS L/F SCTR J0717940
                          S       IB010     ADDRESS TO CHECK            J0717950
                          LDX  L3 *-*       RESTORE XR3                 J0717960
                    IB010 EQU     *-1                                   J0717970
                          BSC  I  IB000,+   EXIT CALL + 1 IF NOT IN BFR J0717980
                          MDX  L  IB000,1                               J0717990
                          BSC  I  IB000     EXIT CALL + 2 IF IN BFR     J0718000
                    *                                                   J0718010
                    *************************************************** J0718020
                    * STORAGE FOR CONSTANTS AND VARIABLES IN IB000      J0718030
                    *************************************************** J0718040
                    *                                                   J0718050
                    IB900 DC      *-*       WASTEBASKET                 J0718060
                    *                                                   J0718070
                    *************************************************** J0718080
                          HDNG    DUP-DELETE  NU000                     J0718090
                    *************************************************** J0718100
                    * NU000 COUNTS THE NUMBER OF WORDS IN A SPECIFIED   J0718110
                    *       ENTRY AND SAVES THE ADDRESS OF THE FOLLOW-  J0718120
                    *       ING ENTRY IN NU900                          J0718130
                    *       XR3 MUST POINT TO THE ENTRY                 J0718140
                    *       EXITS WITH THE WORD COUNT IN THE ACC        J0718150
                    *       BSI     NU000                               J0718160
                    *************************************************** J0718170
                    *                                                   J0718180
                    NU000 DC      *-*       ENTRY                       J0718190
                          STX   3 NU040     SAVE INITIAL ADDRESS        J0718200
                          LD      NU902     COUNT 3 WDS FOR THE PRIMARY J0718210
                          STO     NU901     *ENTRY POINT                J0718220
                    *                                                   J0718230
                    * TEST FOR NEXT PRIMARY ENTRY POINT                 J0718240
                    *                                                   J0718250
                    NU020 MDX   3 3         POINT TO NEXT ENTRY AND     J0718260
                          STX   3 NU900     *SAVE ITS LOCATION          J0718270
                    *                                                   J0718280
                          BSI     IB000     DETERMINE IF NEXT ENTRY IS  J0718290
                          MDX     NU030     *IN THE BFR. BRANCH IF NOT  J0718300
                    *                                                   J0718310
                          BSI     TD000     THIS TEST IS NECESSARY      J0718320
                          MDX     NU030     *BECAUSE THE LAST 1DUMY MAY J0718330
                    *                       *HABE A 0 DB COUNT          J0718340
                          LD    3 2                                     J0718350
                          BSC  L  NU030,Z   BR IF NOT SECONDARY ENT PT  J0718360
                          MDX  L  NU901,3   COUNT 3 MORE WORDS          J0718370
                          MDX     NU020     BRANCH TO CONTINUE          J0718380
                    *                                                   J0718390
                    * THE NEXT PRIMARY ENTRY POINT HAS BEEN FOUND       J0718400
                    *                                                   J0718410
                    NU030 LDX  L3 *-*       RESTORE XR3                 J0718420
                    NU040 EQU     *-1                                   J0718430
                          LD      NU901     FETCH NO. WORDS COUNTED     J0718440
                          BSC  I  NU000     EXIT                        J0718450
                    *                                                   J0718460
                    *************************************************** J0718470
                    * STORAGE FOR CONSTANTS AND VARIABLES IN NU000      J0718480
                    *************************************************** J0718490
                    *                                                   J0718500
                    NU900 DC      *-*       ADDR NEXT PRIME ENTRY POINT J0718510
                    NU901 DC      *-*       NO. WORDS IN ENTRY          J0718520
                    NU902 DC      3         CONSTANT                    J0718530
                    *                                                   J0718540
                    *************************************************** J0718550
                          HDNG    DUP-DELETE  FL000                     J0718560
                    **************************************************  J0718570
                    * FL000 FLIPS THE BUFFER LOGIC BETWEEN BFRA AND     J0718580
                    *       BFRB. THE CONTENTS OF THE FOLLOWING CON-    J0718590
                    *       TROLS ARE EXCHANGED.                        J0718600
                    *       BFRA  AND BFRB                              J0718610
                    *       BFRAF AND BFRBF                             J0718620
                    *       BFRAL AND BFRBL                             J0718630
                    *       BSI     FL000                               J0718640
                    **************************************************  J0718650
                    *                                                   J0718660
                    FL000 DC      *-*       ENTRY                       J0718670
                          STX   1 FL030     SAVE XR1                    J0718680
                          LDX   1 6         SET LOOP COUNTER            J0718690
                    FL010 LDD  L1 BFRA-2    REVERSE                     J0718700
                          RTE     16        *TWO                        J0718710
                          STD  L1 BFRA-2    *ENTRIES                    J0718720
                          MDX   1 -2        SKIP WHEN 3 PAIRS REVERSED  J0718730
                          MDX     FL010     BR TO CONTINUE              J0718740
                          LDX  L1 *-*       RESTORE XR1                 J0718750
                    FL030 EQU     *-1                                   J0718760
                          BSC  I  FL000     EXIT                        J0718770
                    *                                                   J0718780
                    **************************************************  J0718790
                          HDNG    DUP-DELETE  FD000                     J0718800
                    **************************************************  J0718810
                    * FD000 CONVERTS THE FLET ENTRY TO BE DELETED TO A  J0718820
                    *       1DUMY ENTRY. ADJACENT 1 DUMY ENTRIES ARE    J0718830
                    *       THEN COMBINED AND STORED IN THE POSITION    J0718840
                    *       OF THE FIRST 1 DUMY ENTRY. I.E. IN PLACE OF J0718850
                    *       A PREVIOUS 1DUMY ENTRY IF ONE EXISTS OR IN  J0718860
                    *       THE POSITION OF THE CONVERTED FLET ENTRY.N  J0718870
                    *************************************************   J0718880
                    *                                                   J0718890
                    FD000 DC      *-*       ENTRY                       J0718900
                          LDX  I1 DE900     ADDR OF PRIME ENTRY         J0718910
                          LDX  I2 DE902     ADDR OF PRECEEDING DUMY     J0718920
                          LDX  I3 DE906     ADDR OF FOLLOWING DUMY      J0718930
                          STX   1 FD030     ADDR FOR CONSTRUCTING DUMY  J0718940
                          MDX   2 0         SKIP IF NO PRECEEDING DUMY  J0718950
                          MDX     FD040     BR TO PROCESS PRECEED. DUMY J0718960
                    FD010 LD    1 2         ADD DB"S OF PRIME ENTRY     J0718970
                          A       FD902     *TO DB COUNTER              J0718980
                          STO     FD902                                 J0718990
                          MDX   3 0         SKIP IF NO FOLLOWING DUMY   J0719000
                          MDX     FD050     BR TO PROCESS FOLLOWING DMY J0719010
                    FD020 LDX  L1 *-*       SET WITH ADDR TO STORE NEW  J0719020
                    FD030 EQU     *-1       *DUMY ENTRY                 J0719030
                          LD      FD900     STORE                       J0719040
                          STO   1 0         *THE                        J0719050
                          LD      FD901     *NEW                        J0719060
                          STO   1 1         *DUMY                       J0719070
                          LD      FD902     *ENTRY                      J0719080
                          STO   1 2                                     J0719090
                          BSC  I  FD000     EXIT                        J0719100
                    *                                                   J0719110
                    *                       PROCESS PRECEEDING DUMY     J0719120
                    *                                                   J0719130
                    FD040 STX   2 FD030     ADDR TO CONSTRUCT NEW DUMY  J0719140
                          LD    2 2         ADD DB SIZE OF DUMY TO DB   J0719150
                          A       FD902     *COUNTER                    J0719160
                          STO     FD902                                 J0719170
                          MDX     FD010     BR TO CONTINUE              J0719180
                    *                                                   J0719190
                    *                       PROCESS FOLLOWING DUMY      J0719200
                    *                                                   J0719210
                    FD050 LD    3 2                                     J0719220
                          A       FD902     ADD DB SIZE OF DUMY TO DB   J0719230
                          STO     FD902     *COUNTER                    J0719240
                          MDX     FD020                                 J0719250
                    *                                                   J0719260
                    *                                                   J0719270
                    FD900 DC      /7112     1ST WD '1DUMY' IN NAME CODE J0719280
                    FD901 DC      /4528     2ND WD "1DUMY" IN NAME CODE J0719290
                    FD902 DC      *-*       DB SIZE OF NEW DUMY         J0719300
                          HDNG    DUP-DELETE  MU000                     J0719310
                    **************************************************  J0719320
                    * MU000 PERFORMS THE FOLLOWING FUNCTIONS            J0719330
                    *       *SAVES THE LET/FLET ADDRESS OF THE FIRST    J0719340
                    *        PRIMARY ENTRY POINT FOLLOWING THE SPECIF-  J0719350
                    *        IED ENTRY.                                 J0719360
                    *       *DETERMINES IF THIS ENTRY IS A DUMY ENTRY   J0719370
                    *       *IF IT IS, DETERMINES IF THIS IS THE LAST   J0719380
                    *        LET/FLET DUMY ENTRY                        J0719390
                    *       *IF THE FOLLOWING ENTRY IS NOT IN BFRA,     J0719400
                    *        THE NEXT LET/FLET SCTR IS READ INTO BFRB   J0719410
                    *       *SETS THE USER AREA DB ADDRESS OF THE FIRST J0719420
                    *        NON-DUMY PROGRAM FOLLOWING THE PROGRAM TO  J0719430
                    *        BE DELETED                                 J0719440
                    **************************************************  J0719450
                    *                                                   J0719460
                    MU000 DC      *-*       ENTRY                       J0719470
                    *                                                   J0719480
                    * SAVE THE DB ADDR OF THE NEXT PROGRAM IN THE UA    J0719490
                    *                                                   J0719500
                          LDX  I3 DE900     POINT TO PRIME ENTRY        J0719510
                          LD   L  DE920     DB ADDRESS IN THE UA OF     J0719520
                    *                       *PROG TO BE DELETED         J0719530
                          A     3 2         SIZE OF DELETED PROGRAM     J0719540
                          STO  L  DE901     UPDATE PROG ADDR COUNTER    J0719550
                          STO  L  DE910     UPDATE 'FROM' ADDR IN UA    J0719560
                    *                                                   J0719570
                          LD   L  BFRA      NU000 NEEDS THE BFR ADDRESS J0719580
                          STO  L  DE907                                 J0719590
                          BSI  L  NU000     POINT TO NEXT ENTRY-        J0719600
                          LDX  I3 NU900     *NU900 NOW POINTS TO IT     J0719610
                    *                                                   J0719620
                          BSI  L  IB000     DETERMINE IF NEXT ENTRY IS  J0719630
                          MDX     MU030     *IN BFRA. BRANCH IF NOT     J0719640
                    *                                                   J0719650
                    * SAVE ADDRESS OF THE FOLLOWING PRIME ENTRY POINT   J0719660
                    *                                                   J0719670
                    MU005 STX  L3 DE904     SAVE THE ADDRESS            J0719680
                    *                                                   J0719690
                    * DETERMINE IF IT IS A DUMY                         J0719700
                    *                                                   J0719710
                          BSI  L  TD000     TEST FOR BEING A DUMY       J0719720
                          MDX     MU020     *AND BRANCH IF IT IS        J0719730
                    *                                                   J0719740
                    MU010 BSC  I  MU000     EXIT                        J0719750
                    *                                                   J0719760
                    *                                                   J0719770
                    * DETERMINE IF DUMY IS THE LAST LET/FLET DUMY       J0719780
                    *                                                   J0719790
                    MU020 STX  L3 DE906     SAVE ADDR FOLLOWING DUMY    J0719800
                          MDX   3 3         POINT TO THE NEXT ENTRY     J0719810
                          BSI  L  IB000     DETERMINE IF DUMY WAS LAST  J0719820
                          MDX     MU025     *ENTRY IN BFRA. BRANCH YES  J0719830
                          LD   L  DE910     POINT "FROM" ADDR IN UA     J0719840
                          A     3 -1        *TO THE PROG FOLLOWING  2-1 J0719850
                          STO  L  DE910     *THIS DUMY                  J0719860
                          MDX     MU010                                 J0719870
                    *                                                   J0719880
                    * THE LAST LET/FLET DUMY HAS BEEN FOUND             J0719890
                    *                                                   J0719900
                    MU025 STX  L3 DE905     SET LAST DUMY INDICATOR     J0719910
                          MDX     MU010     EXIT                        J0719920
                    *                                                   J0719930
                    MU030 LD   L  BFRA      DETERMINE IF BFRA CONTAIN   J0719940
                          BSI  L  LA000     *THE LAST LET/FLET SECTOR   J0719950
                          MDX     MU040     *BRANCH IF NOT              J0719960
                    *                                                   J0719970
                    * PRINT DELETE ERROR MESSAGE                        J0719980
                    *                                                   J0719990
                          BSI  I  LEAVE     THE LAST ENTRY IN LET/FLET  J0720000
                          DC      70        *IS NOT A DUMY              J0720010
                    *                                                   J0720020
                    * READ NEXT LET/FLET SECTOR INTO BFRB               J0720030
                    *                                                   J0720040
                    MU040 LDX  I3 BFRB                                  J0720050
                          LDX  I2 BFRA                                  J0720060
                          LD    2 6         FETCH SCTR ADDR NEXT LET/   J0720070
                          OR   L  DE911     *FLET SCTR. 'OR' IN DR CODE J0720080
                          RTE     16                                    J0720090
                          LD   L  IN904     FETCH WORD COUNT OF 320     J0720100
                          STD   3 0                                     J0720110
                          BSI  L  GGET      FETCH THE SECTOR            J0720120
                          STX  L3 DE913     SAVE 'FROM' BUFFER ADDRESS  J0720130
                          STX  L3 DE907     FOR IB000 LATER         2-1 J0720140
                          LDX  I3 BFRBF     POINT TO FIRST ENTRY        J0720150
                          MDX     MU005     BRANCH TO CONTINUE          J0720160
                    *                                                   J0720170
                    **************************************************  J0720180
                          HDNG    DUP-DELETE  BA000                     J0720190
                    **************************************************  J0720200
                    * BA000 PERFORMS THE FOLLOWING FUNCTIONS            J0720210
                    *       *SAVES THE LET/FLET ADDRESS (IN DE900)      J0720220
                    *        OF THE PRIMARY ENTRY OF THE PROGRAM TO     J0720230
                    *        BE DELETED.                                J0720240
                    *       *TESTS THE ENTRY PREVIOUS TO THE SPECIFIED  J0720250
                    *        ENTRY. IF IT IS A DUMY, SAVE THE LET/FLET  J0720260
                    *        ADDRESS IN DE902.                          J0720270
                    *       *IF THE PREVIOUS ENTRY IS NOT IN BFRA, THE  J0720280
                    *        PRECEEDING LET/FLET SECTOR IS READ.        J0720290
                    **************************************************  J0720300
                    *                                                   J0720310
                    BA000 DC      *-*       ENTRY                       J0720320
                    *                                                   J0720330
                    * POINT TO ENTRY SPECIFIED TO DELETE                J0720340
                    *                                                   J0720350
                          LD    1 DELSW     DELSW (IN CATCO) POINTS     J0720360
                          STO     BA005     *TO 1-ENTRY POINT ADDR      J0720370
                          LDX  L3 *-*       *OF PROGRAM TO DELETE       J0720380
                    BA005 EQU     *-1                                   J0720390
                          MDX   3 1         POINT TO FIRST WD OF ENTRY  J0720400
                    *                                                   J0720410
                    * TEST ENTRY TO DETERMINE IF IT IS THE PRIMARY ENT  J0720420
                    *                                                   J0720430
                    BA010 LD    3 2         IF DB SIZE IS NON-ZERO, ENT J0720440
                          BSC  L  BA020,Z   *IS THE PRIME. BR IF IT IS  J0720450
                    *                                                   J0720460
                          LD      *         INDICATE THAT A SECONDARY   J0720470
                          STO     BA901     *ENTRY POINT HAS BEEN FOUND J0720480
                          STX   3 BA900                                 J0720490
                          LD   L  BFRAF     DETERMINE IF ENTRY IS FIRST J0720500
                          S       BA900     *ENTRY IN THIS LET/FLET     J0720510
                          BSC  L  BA080,-   *SECTOR AND BRANCH IF IT IS J0720520
                    *                                                   J0720530
                          MDX   3 -3        POINT TO PREVIOUS ENTRY     J0720540
                          MDX     BA010     BRANCH TO CONTINUE          J0720550
                    *                                                   J0720560
                    * THE PRIMARY ENTRY POINT HAS BEEN FOUND            J0720570
                    *                                                   J0720580
                    BA020 LD    3 2         UPDATE LAST DUMMY INCREMENT J0720590
                          STO  L  DE914     *WITH SIZE OF DELETED PROG  J0720600
                          STO  L  DE919     SAVE THE SIZE               J0720610
                          LD      BA901     DETERMINE IF POINTING TO    J0720620
                          BSC  L  BA025,+-  *2NDARY ENT PT. BR IF NOT   J0720630
                          LD   L  DE920     MOVE DB ADDRESS BACK TO     J0720640
                          S     3 2         *POINT AT DESIRED PROGRAM   J0720650
                          STO  L  DE920                                 J0720660
                    BA025 BSI  L  TD000     DETERMINE IF ENTRY IS A     J0720670
                          MDX     BA090     *DUMMY, BR IF YES           J0720680
                    *                                                   J0720690
                          STX  L3 DE900     SAVE ADDR OF PRIME ENT PT   J0720700
                    *                                                   J0720710
                          MDX   3 -3        POINT TO PREVIOUS ENTRY     J0720720
                          STX   3 BA900                                 J0720730
                          LD      BA900     DETERMINE IF PREVIOUS ENTRY J0720740
                          S    L  BFRAF     *IS IN THE BUFFER           J0720750
                          BSC  L  BA040,Z+  *AND BRANCH IF NOT          J0720760
                    *                                                   J0720770
                    * DETERMINE IF PREVIOUS ENTRY IS A DUMY             J0720780
                    *                                                   J0720790
                          BSI  L  TD000     TEST ENTRY                  J0720800
                          MDX     BA035     *AND BRANCH IF IT IS A DUMY J0720810
                    *                                                   J0720820
                    BA030 LD    3 0         GET TYPE OF PREV ENTRY  2-1 J0720830
                          SRA     15                                2-1 J0720840
                          STO  L  CN914     SET INDICATOR           2-1 J0720850
                          BSC  I  BA000     EXIT                    2-1 J0720860
                    *                                                   J0720870
                    * A PREVIOUS DUMY HAS BEEN FOUND                    J0720880
                    *                                                   J0720890
                    BA035 STX  L3 DE902     SAVE ADDR OF PREV DUMY      J0720900
                    *                                                   J0720910
                          LD    3 2         ADD SIZE OF PREVIOUS DUMY   J0720920
                          A    L  DE914     *TO THE LAST DUMY INCREMENT J0720930
                          STO  L  DE914                                 J0720940
                          MDX     BA030     BRANCH TO EXIT              J0720950
                    *                                                   J0720960
                    BA040 BSI  L  FI000     TEST FOR BEING 1ST LET/FLET J0720970
                          MDX     BA050     *BRANCH IF IT IS NOT        J0720980
                          MDX     BA030     *EXIT IF IT IS              J0720990
                    *                                                   J0721000
                    * READ PREVIOUS LET/FLET SECTOR                     J0721010
                    *                                                   J0721020
                    BA050 LDX  I3 BFRB      INPUT BUFFER ADDRESS        J0721030
                          LD    1 LSTLF     LSTLF (IN CATCO) CONTAINS   J0721040
                          OR   L  DE911     *ADDRESS OF PREV L/F SCTR   J0721050
                          RTE     16        'OR' IN DRIVE CODE          J0721060
                          LD      IN904     *AND FETCH WD CNT OF 320    J0721070
                          STD   3 0                                     J0721080
                          BSI  L  GGET      READ SCTR INTO BFRB         J0721090
                          LD      *         INDICATE PREVIOUS LET/FLET  J0721100
                          STO  L  DE921     *SECTOR HAS BEEN READ       J0721110
                    *                                                   J0721120
                    * DETERMINE IF THE LAST ENTRY IN THE PREVIOUS       J0721130
                    * LET/FLET SECTOR IS A DUMY                         J0721140
                    *                                                   J0721150
                          LD   L  BFRBL     COMPUTE ADDR OF LAST        J0721160
                          S     3 5         *ENTRY IN BFRB              J0721170
                          STO     BA060                                 J0721180
                          LDX  L3 *-*       TD000 EXPECTS THE ADDRESS   J0721190
                    BA060 EQU     *-1       *OF ENTRY IN XR3            J0721200
                    *                                                   J0721210
                          BSI  L  TD000     DETERMINE IF PREVIOUS ENTRY J0721220
                          MDX     BA035     *IS A DUMMY. BR IF YES      J0721230
                          MDX     BA030     *EXIT IF NOT                J0721240
                    *                                                   J0721250
                    * PRINT DELETE ERROR MESSAGES                       J0721260
                    *                                                   J0721270
                    BA080 BSI  I  LEAVE     1ST ENTRY IN THIS LET/FLET  J0721280
                          DC      72        *SCTR HAS A DB CNT OF 0     J0721290
                    *                                                   J0721300
                    BA090 BSI  I  LEAVE     A DUMY ENT FOLLOWED BY      J0721310
                          DC      71        *SECONDARY ENTRY PTS FOUND  J0721320
                    *                                                   J0721330
                    **************************************************  J0721340
                    * STORAGE FOR CONSTANTS AND VARIABLES IN BA000      J0721350
                    **************************************************  J0721360
                    *                                                   J0721370
                    BA900 DC      *-*       WASTEBASKET                 J0721380
                    BA901 DC      *-*       NON-ZERO IF 2ND ENT PT FND  J0721390
                    *                                                   J0721400
                    **************************************************  J0721410
                          HDNG    DUP-DELETE  IN000                     J0721420
                    **************************************************  J0721430
                    * IN000 PERFORMS THE INITIALIZATION FOR DELETE      J0721440
                    *       *THE DB ADDRESS IN THE USER/FIXED AREA OF   J0721450
                    *        THE PROGRAM TO BE DELETED IS SAVED.        J0721460
                    *       *BFRA, BFRB, BFRAF, BFRBF, BFRAL, AND BFRBL J0721470
                    *        ARE INITIALIZED.                           J0721480
                    *       *THE LOGICAL DRIVE ON WHICH TO DELETE IS    J0721490
                    *        SAVED.                                     J0721500
                    *       *A TEST IS MADE TO DETERMINE IF THE DELET-  J0721510
                    *        ION IS FROM LET OR FLET.                   J0721520
                    *       *THE SECTOR ADDRESS OF THE FIRST FLET SEC-  J0721530
                    *        TOR IS DETERMINED.                         J0721540
                    **************************************************  J0721550
                    *                                                   J0721560
                    IN000 DC      *-*       ENTRY                       J0721570
                    *                                                   J0721580
                    * INITIALIZE BFRA AND BFRB ADDRESSES                J0721590
                    *                                                   J0721600
                          LD    1 DBADR     SAVE ADDRESS IN USER AREA   J0721610
                          STO  L  DE920     *OF PROG TO DELETE          J0721620
                          LD    1 LETAR     LETAR POINTS TO ADDR OF     J0721630
                          STO  L  BFRA      *LET/FLET SCTR IN CORE      J0721640
                          STO     IN010                                 J0721650
                          STO  L  DE913     ADDR OF L/F 'FROM' BUFFER   J0721660
                          A       IN901     7                           J0721670
                          STO  L  BFRAF     ADDR FIRST ENTRY IN BFRA    J0721680
                          A       IN902     312                         J0721690
                          STO  L  BFRAL     ADDR LAST ENTRY IN BFRA     J0721700
                          A       IN903     3                           J0721710
                          STO  L  BFRB      SET ADDR OF BFRB            J0721720
                          A       IN901     7                           J0721730
                          STO  L  BFRBF     ADDR FIRST ENTRY IN BFRB    J0721740
                          A       IN902     312                         J0721750
                          STO  L  BFRBL     ADDR LAST ENTRY IN BFRB     J0721760
                    *                                                   J0721770
                    * INITIALIZE DRIVE ON WHICH TO DELETE               J0721780
                    *                                                   J0721790
                          LDX  L2 *-*       POINT TO LETAR BUFFER       J0721800
                    IN010 EQU     *-1                                   J0721810
                          LD    2 1         FETCH DR CODE, SCTR ADDR    J0721820
                          SRT     12                                    J0721830
                          STO  L  DE909     SAVE DR CODE, RIGHT JUST.   J0721840
                          SLA     12                                    J0721850
                          STO  L  DE911     SAVE DR CODE, LEFT JUST.    J0721860
                    *                                                   J0721870
                    * DETERMINE IF DELETION IS FROM UA OR FX            J0721880
                    *                                                   J0721890
                          LD    2 2         FETCH SECTOR ID             J0721900
                          S       IN905     15                          J0721910
                          BSC  L  IN020,+                               J0721920
                          STO  L  DE915                                 J0721930
                    *                                                   J0721940
                    * DETERMINE SCTR ADDR OF FLET, IF ANY               J0721950
                    *                                                   J0721960
                    IN020 LDX  I2 DE909                                 J0721970
                          LD   L2 #FLET+C   FETCH FLET DR CODE, STR ADR J0721980
                          SLA     4         SHIFT OFF DRIVE CODE        J0721990
                          SRA     4                                     J0722000
                          STO  L  DE908     SAVE FIRST FLET SCTR ADDR   J0722010
                          BSC  I  IN000     EXIT                        J0722020
                    *                                                   J0722030
                    **************************************************  J0722040
                    * STORAGE FOR CONSTANTS AND VARIABLES IN IN000      J0722050
                    **************************************************  J0722060
                    *                                                   J0722070
                    IN900 DC      *-*       WASTEBASKET                 J0722080
                    IN901 DC      7         CONSTANT                    J0722090
                    IN902 DC      312       CONSTANT                    J0722100
                    IN903 DC      3         CONSTANT                    J0722110
                    IN904 DC      320       CONSTANT                    J0722120
                    IN905 DC      15        CONSTANT                    J0722130
                    *                                                   J0722140
                    DEND  EQU     *                                     J0722150
                    *************************************************** J0722160
                    *                                                 * J0722170
                    *   PATCH AREA FOR OVERLAID SECTION OF DELETE     * J0722180
                    *   (CN000 TO END) SEE DE500 FOR NON-OVERLAID     * J0722190
                    *   PATCH ROOM                                    * J0722200
                    *                                                 * J0722210
                    *************************************************** J0722220
                          BSS     BUF5-/7000-*-1 DELETE PATCH AREA  2-5 J0722230
                          DC      /FFFF     END OF DELETE PATCH AREA    J0722240
                          END     *                                     J0722250
