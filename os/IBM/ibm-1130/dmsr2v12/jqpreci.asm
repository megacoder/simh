                          HDNG    PRECI-    RESIDENT COMMA   2 AUG 67   J1700010
                          ABS                                           J1700020
                    $CIBA EQU     /5   ADDR OF CIB ON MASTER CARTRIDGE  J1700030
                    $CH12 EQU     /6   CHANNEL 12 INDR,NON-ZERO=CHAN 12 J1700040
                    $COMN EQU     /7   WORD COUNT OF COMMON             J1700050
                    $CORE EQU     /E   CORE SIZE,/1000=4K,/2000=8K,ETC) J1700060
                    $CTSW EQU     /F   MCR SW,NON-ZERO=// RECD TRAPPED  J1700070
                    $DADR EQU     /10  SCTR ADDR OF PROG TO BE FETCHED  J1700080
                    $DABL EQU     /11  IOCC FOR SCA RESET (ODD ADDR)    J1700090
                    $DREQ EQU     /12  INDR FOR REQUESTED V. DISK I/O   J1700100
                    $IBSY EQU     /13  PRINC I/O BUSY INDR,NON-ZERO=BSY J1700110
                    $HASH EQU     /14  WORK AREA FOR MONITOR PROGRAMS   J1700120
                    $PRET EQU     /28  ADDR PREOPERATIVE ERROR TRAP     J1700130
                    $IREQ EQU     /2C  ADDR OF INT REQUEST SUBROUTINE   J1700140
                    $ULET EQU     /2D  ADDR OF LET, LOGICAL DRIVE 0     J1700150
                    $IOCT EQU     /32  IOCS CTR,0=NO I/O IN PROGRESS    J1700160
                    $LAST EQU     /33  LAST CD INDR,NON-ZERO=LAST CARD  J1700170
                    $NDUP EQU     /34  INHIBIT DUP SW,NON-ZERO=NO DUP   J1700180
                    $NXEQ EQU     /35  INHIBIT EXEC SW,NON-ZERO=NO EXEQ J1700190
                    $PBSY EQU     /36  PRINC PTR BUSY INDR,NON-ZERO=BSY J1700200
                    $PGCT EQU     /37  PAGE NO. FOR PAGE HEADINGS       J1700210
                    $EXIT EQU     /38  ADDR CALL EXIT ENTRY POINT       J1700220
                    $LINK EQU     /39  ADDR CALL LINK ENTRY POINT       J1700230
                    $DUMP EQU     /3F  ADDR OF CALL DUMP, ENTRY POINT   J1700240
                    $DCDE EQU     /77  DRIVE CODE FOR CORE LOAD BLDR    J1700250
                    $PHSE EQU     /78  NO. OF PHASE CURRENTLY IN CORE   J1700260
                    $UFIO EQU     /79  ARM POSITION IN UNFORMATTED AREA J1700270
                    $WSDR EQU     /7A  WORKING STORAGE DRIVE CODE       J1700280
                    $WRD1 EQU     /7B  LOAD ADDR FOR CURR USER CORE LD  J1700290
                    $KCSW EQU     /7C  INHIBIT INPUT/PRINT OVERLAP SW   J1700300
                    $UFDR EQU     /7D  UNFORMATTED I/O DRIVE CODE       J1700310
                    $CPTR EQU     /7E  CHANNEL 12 INDICATOR FOR CP      J1700320
                    $1132 EQU     /7F  CHANNEL 12 INDICATOR FOR 1132    J1700330
                    $1403 EQU     /80  CHANNEL 12 INDICATOR FOR 1403    J1700340
                    $PST1 EQU     /81  ADDR POSTOP ERROR TRAP,LEVEL 1   J1700350
                    $PST2 EQU     /85  ADDR POSTOP ERROR TRAP,LEVEL 2   J1700360
                    $PST3 EQU     /89  ADDR POSTOP ERROR TRAP,LEVEL 3   J1700370
                    $PST4 EQU     /8D  ADDR POSTOP ERROR TRAP,LEVEL 4   J1700380
                    $STOP EQU     /91  ADDR PROGRAM STOP KEY TRAP       J1700390
                    $FPAD EQU     /95  FILE PROTECT ADDR (ADJ),LOG DR 0 J1700400
                    $CYLN EQU     /9A  ARM POSITION FOR LOGICAL DRIVE 0 J1700410
                    $ACDE EQU     /9F  AREA CODE FOR LOGICAL DRIVE 0    J1700420
                    $DCYL EQU     /A4  1ST DEF CYL ADDR, LOGICAL DR 0   J1700430
                    $I200 EQU     /B3  ENTRY POINT TO ILS FOR LEVEL 2   J1700440
                    $I205 EQU     /B8                                   J1700450
                    $IBT2 EQU     $I205+1 ADDR OF IBT FOR LEVEL 2       J1700460
                    $I400 EQU     /C4  ENTRY POINT TO ILS FOR LEVEL 4   J1700470
                    $I405 EQU     /D3                                   J1700480
                    $IBT4 EQU     $I405+1 ADDR OF IBT FOR LEVEL 4       J1700490
                    $I410 EQU     /D5                                   J1700500
                    $DBSY EQU     /EE  DISK BUSY INDR,NON-ZERO=DK BUSY  J1700510
                    $BYSW EQU     /1CB BYPASS SW,NOP IF FETCHING SOCAL  J1700520
                    DZ000 EQU     /0F2 DISKZ ENTRY POINT                J1700530
                    $ZEND EQU     /1E0 ADDR 1+LAST WORD OF DISKZ        J1700540
                          HDNG          CONCATENATED COMMON AREA(CATCO) J1700550
                    C     EQU     /7FA0     CATCO POINTER SET TO MIDDLE J1700560
                    *************************************************** J1700570
                    *                                                 * J1700580
                    *  INDEX REG 1 IS SET TO .C. WHEN CATCO IS FORMED * J1700590
                    *  FOR USE BY ALL OF DUP FUNCTIONS. ANY DUP ROUT  * J1700600
                    *  USING XR 1 FOR OTHER REASONS MUST RESTORE.     * J1700610
                    *  ALL VALUES IN CATCO HAVE LABELS EQUATED TO THE * J1700620
                    *  VALUE THAT INDICATES THEIR RELATIVE LOCATION   * J1700630
                    *  FROM .C.                                       * J1700640
                    *                                                 * J1700650
                    *************************************************** J1700660
                    *                                                 * J1700670
                    *             CATCO DCOM IMAGE                    * J1700680
                    *   EQUIVALENCES USED TO REFERENCE CATCO WITH XR1 * J1700690
                    *                                                 * J1700700
                    *************************************************** J1700710
                    #NAME EQU     4-/80     NAME OF PROGRAM             J1700720
                    #DBCT EQU     6-/80     DISK BLOCK COUNT OF PROGRAM J1700730
                    #FCNT EQU     7-/80     FILES SW,ZERO = NO FILES    J1700740
                    #SYSC EQU     8-/80     NON-ZERO,SYSTEM CARTRIDGE   J1700750
                    #JBSW EQU     9-/80     JOB SW,NON-ZERO='T' MODE    J1700760
                    #CBSW EQU     10-/80    CLB SW,NON-ZERO=STORECI     J1700770
                    #LCNT EQU     11-/80    NO. OF LOCALS               J1700780
                    #MPSW EQU     12-/80    NON-ZERO, CORE MAP DESIRED  J1700790
                    #MDF1 EQU     13-/80    NO. OF DUP CTRL RCDS        J1700800
                    #MDF2 EQU     14-/80    ADDR OF MODIF BUFFER        J1700810
                    #NCNT EQU     15-/80    NO. OF NOCALS               J1700820
                    #ENTY EQU     16-/80    RELATIVE ENTRY ADDR OF PROG J1700830
                    #RP67 EQU     17-/80    IF NON-ZERO,1442 MOD 6,7    J1700840
                    *                                                   J1700850
                    *   NEGATIVE VALUE REPRESENTS DEFAULT CONDITION   * J1700860
                    #TODR EQU     18-/80    DR CODE OF 'TO' DRIVE       J1700870
                    #FRDR EQU     19-/80    DR CODE OF 'FROM' DRIVE     J1700880
                    *                                                 * J1700890
                    #FHOL EQU     20-/80    ADDR OF LARGEST FXA HOLE    J1700900
                    #FSZE EQU     21-/80    BLK CNT LARGEST HOLE IN FXA J1700910
                    #UHOL EQU     22-/80    ADDR OF LARGEST UA HOLE     J1700920
                    #USZE EQU     23-/80    BLK CNT LARGEST HOLE IN UA  J1700930
                    #DCSW EQU     24-/80    NON-ZERO=DUP CALL           J1700940
                    #PIOD EQU     25-/80    PRINC. I/O INDICATOR        J1700950
                    #PPTR EQU     26-/80    PRINC. PRINTER INDICATOR    J1700960
                    #CIAD EQU     27-/80    WD NO. SCTR 0,CIL ADDR      J1700970
                    #ACIN EQU     28-/80    AVAILABLE CARTRIDGE INDR2-8 J1700980
                    #GRPH EQU     29-/80    2250 INDICATOR          2-8 J1700990
                    #GCNT EQU     30-/80    NO. G2250 RECORDS       2-8 J1701000
                    #LOSW EQU     31-/80    LOCAL-CALLS-LOCAL INDR  2-8 J1701010
                    #X3SW EQU     32-/80    SPECIAL ILS SWITCH      2-8 J1701020
                    #ECNT EQU     33-/80    NO. OF EQUAT RCDS       2-8 J1701030
                    #ANDU EQU     35-/80    END OF UA (ADJ) LOG DR 0-4  J1701040
                    #BNDU EQU     40-/80    END OF UA (BASE) LOG DR 0-4 J1701050
                    #FPAD EQU     45-/80    FILE PROTECT ADDR (BASE)    J1701060
                    #PCID EQU     50-/80    CART ID, PHYS DR 0-4        J1701070
                    #CIDN EQU     55-/80    CART ID, LOG DR 0-4         J1701080
                    #CIBA EQU     60-/80    CIB ADDR, LOG DR 0-4        J1701090
                    #SCRA EQU     65-/80    SCRA, LOG DR 0-4            J1701100
                    #FMAT EQU     70-/80    WS FORMAT, LOG DR 0-4       J1701110
                    #FLET EQU     75-/80    FLET ADDR, LOG DR 0-4       J1701120
                    #ULET EQU     80-/80    LET ADDR, LOG DR 0-4        J1701130
                    #WSCT EQU     85-/80    WS BLK CNT, LOG DR 0-4      J1701140
                    #CSHN EQU     90-/80    CUSHION END SCTR ADDR, 0-4  J1701150
                    #DCOM EQU     1         SCTR ADDR OF DCOM           J1701160
                    #HDNG EQU     7         SCTR WITH PAGE HEADING      J1701170
                    @SBFR EQU     /FB0                              2-8 J1701180
                          HDNG    CONCATENATED COMMON AREA (CATCO)      J1701190
                    *************************************************** J1701200
                    *                                                 * J1701210
                    *             CATCO IOAR HDRS FOR DUP PHASES        J1701220
                    *                                                 * J1701230
                    *************************************************** J1701240
                          ORG     -/10                                  J1701250
                    DCHDR BSS     2         DUP CONTROL            PH02 J1701260
                    STHDR BSS     2         STORE                  PH03 J1701270
                    FLHDR BSS     2         FILEQ                  PH04 J1701280
                    DMHDR BSS     2         DUMP                   PH05 J1701290
                    DLHDR BSS     2         DUMPLET                PH06 J1701300
                    DTHDR BSS     2         DELETE                 PH07 J1701310
                    DFHDR BSS     2         DEFINE                 PH08 J1701320
                    DXHDR BSS     2         DUP EXIT               PH09 J1701330
                    UCHDR BSS     2         DUP UPCOR              PH13 J1701340
                    PIHDR BSS     2         PRINCIPAL I/O BLOCK    PH14 J1701350
                    SIHDR BSS     2         PRINC I/O (W/O KB) BLK PH15 J1701360
                    PTHDR BSS     2         PAPER TAPE I/O BLOCK   PH16 J1701370
                    CIHDR BSS     2         CI PHASE READ BY CL BUILDER J1701380
                    MUHDR BSS     2         MACRO UPDATE      PH206 2-8 J1701390
                    D2HDR BSS     2         DUP CONTROL 2     PH205 2-8 J1701400
                          HDNG    PRECI-    CATCO DUP SWITCHES          J1701410
                    *************************************************** J1701420
                    *                                                   J1701430
                    *             CATCO DUP SWITCHES                  * J1701440
                    *      WORDS USED FOR COMMUNICATION OF DATA         J1701450
                    *   BETWEEN DUP ROUTINES.                           J1701460
                    *                                                 * J1701470
                    *      INITIALIZED TO ZERO BY  .REST. OF DUPCO    * J1701480
                    *                                                   J1701490
                    *************************************************** J1701500
                    CL1   EQU     *                                     J1701510
                    ASMSW BSS     1         NON ZERO IF DEFINE VOID ASM J1701520
                    BITSW BSS     1         NON ZERO TO ALLOW MDUMP-S   J1701530
                    BLKSW BSS     1         NON ZERO IF BYPASSING REC   J1701540
                    CIERR BSS     1         ERROR NO DETECTED BY PH 17  J1701550
                    CISW  BSS     1         NON ZERO IF STORE CI        J1701560
                    CLBSW BSS     1         NON ZERO IF PRECI EXECUTED  J1701570
                    CNTNO BSS     1         RECORD NO BEING PCHD OR RD  J1701580
                    *                                                 * J1701590
                    *   .DATSW. IS FILLED WITH THE CNT FIELD OF THE   * J1701600
                    *   DUP CONTROL RECORD.                           * J1701610
                    *   USED PRIMARILY FOR DATA MOVEMENT, BUT ALSO IS * J1701620
                    *   USED FOR COUNT OF RECORDS TO READ AFTER A     * J1701630
                    *   STORE CI DUP CONTROL RECORD.                  * J1701640
                    DATSW BSS     1         RECORDS VALUE IN CNT FIELD  J1701650
                    DBADR BSS     1         DB ADDR OF REFERENCED PROG  J1701660
                    DELSW BSS     1         ADDR OF REQ LET ENTRY - 1   J1701670
                    DFNSW BSS     1         NON ZERO IF DEFINE FXA      J1701680
                    DKSAD BSS     1         DK SCTR ADDR W/O DR CODE    J1701690
                    DUMPP BSS  E  2         LAST LIMITS FOR PRNTR DUMP  J1701700
                    FORSW BSS     1         NON ZERO IF DEFINE VOID FOR J1701710
                    FRWS  BSS     1         NON ZERO IF FROM FLD IS WS  J1701720
                    FXSW  BSS     1         NON ZERO IF FIXED AREA REQD J1701730
                    HOLSW BSS     1         NON ZERO IF NO CONV REQD    J1701740
                    IOSW  BSS     1         NON ZERO IF IN/OUT REQD     J1701750
                    *                                                 * J1701760
                    *   DUMPLET SWITCH - ZERO IF NOT DUMPLET/DUMPFLET * J1701770
                    *       PLUS VALUE REQUIRES PRINT OF BOTH LET/FLET* J1701780
                    *       NEG. VALUE REQUIRES PRINT OF FLET ONLY    * J1701790
                    LETSW BSS     1         NON ZERO,PRINT LET OR FLET* J1701800
                    LSTLF BSS     1         LAST LET/FLET SECT PROCESSD J1701810
                    MODSW BSS     1         NON ZERO IF STORE MOD FUNC  J1701820
                    NAMSW BSS     1         NON ZERO IF NAME IN LET/F   J1701830
                    NEGSW BSS     1         NON ZERO IF SHRINKING FXA   J1701840
                    PGMHL BSS     1         WORD COUNT OF THE PROG HDR  J1701850
                    PRSW  BSS     1         NON ZERO IF PRINTING OUTPUT J1701860
                    PTSW  BSS     1         NON ZERO IF PAPER TAPE REQD J1701870
                    SKWDS BSS     1         WDS TO SEARCH IN L/F SECT   J1701880
                    STCSW BSS     1         NON ZERO IF STORE DATA CI   J1701890
                    STSW  BSS     1         NON ZERO IF STORE TYPE      J1701900
                    TEMP1 BSS  E  1         1ST WD OF BINEB OUTPUT      J1701910
                    TEMP2 BSS     1         2ND WD OF BINEB OUTPUT      J1701920
                    TOWS  BSS     1         NON ZERO IF TO FIELD IS WS  J1701930
                    T3MSW BSS     1         TYPE 3,4 SOCAL LEVEL CELL   J1701940
                    UASW  BSS     1         NON ZERO IF USER AREA REQD  J1701950
                    WSSW  BSS     1         NON ZERO IF WORK STG REQD   J1701960
                    XEQSW BSS     1         NON ZERO IF NOT RET FR GET  J1701970
                    EBCSW BSS     1         NON ZERO IF EBC DATA OP 2E2 J1701980
                    HDNSW BSS     1         NON ZERO IF NAME IN HDR 2-8 J1701990
                    RPGSW BSS     1         NON Z IF DEFINE VOID RPG2-8 J1702000
                    DFLSW BSS     1         NON ZERO IF *DFILE      2-8 J1702010
                          BSS     1         RESERVED FOR ADDITION   2-8 J1702020
                    CL2   EQU     *-1                                   J1702030
                          HDNG    PRECI-    CATCO DUP SWITCHES          J1702040
                    *************************************************** J1702050
                    *                                                 * J1702060
                    *             CATCO DUP SWITCHES                  * J1702070
                    *  INITIALIZED BY DCTL AND NOT RESET BY .REST.    * J1702080
                    *                                                 * J1702090
                    *************************************************** J1702100
                    IOREQ BSS     1         MON-ZERO,AUX I/O SET REQ    J1702110
                    PH2   BSS     1         NON-ZERO IF DCTL IN CORE    J1702120
                    PH3   BSS     1         NON-ZERO IF STORE IN CORE   J1702130
                    PH4   BSS     1         NON-ZERO IF DUMP IN CORE    J1702140
                    ************************************************2-8 J1702150
                    *                                               2-8 J1702160
                    *             CATCO SWITCH INITIALIZED TO ZERO  2-8 J1702170
                    *   BY CCAT SUBR AND SET BY MACRO UPDATE PROGRAM2-8 J1702180
                    *                                               2-8 J1702190
                    ************************************************2-8 J1702200
                    DUPCR BSS     1         NON ZERO IF DUP CTRL RCD2-8 J1702210
                    *************************************************** J1702220
                    *                                                 * J1702230
                    *             CATCO DUP SWITCHES SET BY CCAT SUBR * J1702240
                    *                                                 * J1702250
                    *************************************************** J1702260
                    ADDR2 BSS     1         KB INTERRUPT ADDRESS        J1702270
                    KBREQ BSS     1         CONTENTS OF LOC 13          J1702280
                    *      THE FOLLOWING SWITCH IS SET TO INDICATE THE  J1702290
                    *       PRINCIPAL INPUT DEVICE                      J1702300
                    *             -  IS PAPER TAPE                      J1702310
                    *             0  IS CARD                            J1702320
                    *             +  IS KEYBOARD                        J1702330
                    INOUT BSS     1         PRINCIPAL INPUT SWITCH      J1702340
                    *                                                   J1702350
                    PTPON BSS     1         NON-ZERO IF PAPER TP ON SYS J1702360
                    *************************************************** J1702370
                    *                                                 * J1702380
                    *             LEVEL 4 INTERRUPT BRANCH TABLE      * J1702390
                    *             ADDRESSES. INITIALIZED BY CCAT,     * J1702400
                    *             AND CARD/PAPER TAPE INTERFACES.     * J1702410
                    *                                                 * J1702420
                    *************************************************** J1702430
                          ORG     /0049                                 J1702440
                    IBT   BSS     9         9 WD INTRPT BRANCH TABLE    J1702450
                    *************************************************** J1702460
                    *                                                 * J1702470
                    *             CATCO I/O ADDRESSES REQUIRED BY DUP * J1702480
                    *                                                 * J1702490
                    *************************************************** J1702500
                    P1442 BSS  E  2         SYS 1442 IOAR HEADER        J1702510
                    PRPAR BSS     2         DEFAULT LIMITS TO PRINT     J1702520
                    PHDUP BSS     1         LAST DUP PHASE IN CORE      J1702530
                    CRBUF BSS     1         81 WD BFR FOR DUP CTRL RCDS J1702540
                    DCADR BSS     1         ADDR FOR DUP CTRL IOAR HDR  J1702550
                    HDBUF BSS     1         ADDR OF PAGE HEADING BFR    J1702560
                    IOBLK BSS     1         ADDR OF DUP I/O PHASE       J1702570
                    SDBUF BSS     1         STORE/DUMP BUFFER           J1702580
                    LETAR BSS     1         ADDR OF LET SEARCH BUFFER   J1702590
                    PEBUF BSS     1         41 WD BFR FOR PACKED EBCDIC J1702600
                    THIS  BSS     1         ADDR OF DOUBLE BFR, BFR 1   J1702610
                    NEXT  BSS     1         ADDR OF DOUBLE BFR, BFR 2   J1702620
                          HDNG              DUP CORE PARAMETERS         J1702630
                    DISKZ EQU     DZ000     DISKZ ENTRY POINT           J1702640
                    B     EQU     $ZEND-2                               J1702650
                    DMPLC EQU     B         IOAR CORE ADDR FOR DMPLT    J1702660
                    EXITC EQU     B         IOAR CORE ADDR FOR DEXIT    J1702670
                    MUPC  EQU     B         IOAR CORE ADDR FOR MUP  2-8 J1702680
                    DCTL  EQU     B+/1002   ENTRY ADDRESS OF DCTL       J1702690
                    DCTLC EQU     B+/1000   IOAR CORE ADDR FOR DCTL     J1702700
                    WSDC  EQU     B+/2000   IOAR CORE ADDR FOR STORE    J1702710
                    DUMPC EQU     B+/4000   IOAR CORE ADDR FOR DDUMP    J1702720
                    DUPCO EQU     /7DB0     ADDR OF RESIDENT DUPCO      J1702730
                    CATCO EQU     /7F20-2   ADDR OF DCOM IOAR HEADER    J1702740
                    *                                                 * J1702750
                    *  DUPCO ENTRY POINTS...USED WITH INDIRECT BSI    * J1702760
                    *                                                 * J1702770
                          ORG     DUPCO                                 J1702780
                    BINEB BSS     1         CONVERSION BINARY TO EBCDIC J1702790
                    WRTDC BSS     1         WRITE DCOM(S) SUBROUTINE    J1702800
                    ENTER BSS     1         SAVE XR-S AND CONDITIONS    J1702810
                    GET   BSS     1         READ FROM DISK USING DISKZ  J1702820
                    LEAVE BSS     1         HANDLES ALL EXITS FROM DUP  J1702830
                    LINE  BSS     1         SPACES PRINTER 1 LINE       J1702840
                    MASK  BSS     1         INHIBITS KB INT REQUEST     J1702850
                    MDUMP BSS     1         PRINTS SELECTED CORE LOC-S  J1702860
                    PAGE  BSS     1         SKIPS TO NEXT PAGE          J1702870
                    PHID  BSS     1         RECORDS PHASE ID            J1702880
                    PHIDM BSS     1         RECORDS PHASE AND MODIFIER  J1702890
                    PRINT BSS     1         USE SYS PR SUBR TO PRINT    J1702900
                    PUT   BSS     1         WRITES TO DISK USING DISKZ  J1702910
                    REST  BSS     1         RESTORE CATCO,GO TO DCTL    J1702920
                    RTURN BSS     1         RESTORE XR-S AND CONDITIONS J1702930
                    *                                                 * J1702940
                    *  INPUT/OUTPUT PARAMETERS , CORE ADDRESSES       * J1702950
                    *                                                 * J1702960
                    BUF6  EQU     DUPCO-/1F ADDR OF PAGE HEADING BUFFER J1702970
                    PRPNT EQU     BUF6-/141 IOAR ADDR FOR PRINC. PTR    J1702980
                    IOADR EQU     BUF6-/38B START OF I/O INTERFACE      J1702990
                    GETHO EQU     IOADR+4   ENTRY FOR READING HOLL TYPE J1703000
                    GETBI EQU     IOADR+5   ENTRY FOR READING BINARY    J1703010
                    PACKB EQU     IOADR+6   ENTRY TO PACK BINARY        J1703020
                    PCHBI EQU     IOADR+7   ENTRY TO PUNCH BINARY       J1703030
                    BUF1  EQU     IOADR-/51 ADDR OF NEXT BUFFER         J1703040
                    BUF2  EQU     BUF1-/52  ADDR OF THIS BUFFER         J1703050
                    BUF3  EQU     BUF2-/3E  ADDR OF PACKED EBC BUFFER   J1703060
                    BUF4  EQU     BUF3-/52  ADDR OF CONTROL RCD BUFFER  J1703070
                    BUF5  EQU     IOADR-/284   ADDR OF LET SCTR BFR     J1703080
                    BUF7  EQU     BUF5-/7142   ADDR OF STORE/DUMP BFR   J1703090
                          HDNG    UPCOR-SAVED DURING STORECI BY DEXIT   J1703100
                          ORG     BUF5                                  J1703110
                          DC      *-*       WD CNT, CREATED BY SYS LDR  J1703120
                          DC      13        UPCOR PHASE ID              J1703130
                          BSS     /8000-*-1 UPCOR AREA                  J1703140
                          DC      /FFFF     SIGNIFY END OF UPCOR AREA   J1703150
                          HDNG    PRINCIPAL I/O-GENERATED BY CCAT       J1703160
                          ORG     IOADR                                 J1703170
*SBRKGPW 0E          DUP - PRINCIPAL I/O DUMMY PHASE                    J1703180
                          DC      *-*       WD CNT, CREATED BY SYS LDR  J1703190
                          DC      14        PRINC. I/O PHASE ID         J1703200
                          BSS     PRPNT-*-1 AREA REQ FOR PHASE 14       J1703210
                          DC      /FFFF     SIGNIFY END OF PHASE 14     J1703220
                          HDNG    PRINCIPAL I/O (W/O KB)-BUILT BY CCAT  J1703230
                          ORG     IOADR                                 J1703240
*SBRKGPW 0F          DUP - PRINCIPAL I/O (W/O KB) DUMMY PHASE           J1703250
                          DC      *-*       WD CNT, CREATED BY SYS LDR  J1703260
                          DC      15        I/O (W/O DB) PHASE ID       J1703270
                          BSS     PRPNT-*-1 AREA REQ FOR PHASE 15       J1703280
                          DC      /FFFF     SIGNIFY END OF PHASE 15     J1703290
                          HDNG    PAPER TAPE I/O-BUILT BY CCAT          J1703300
                          ORG     IOADR                                 J1703310
*SBRKGPW 10          DUP - PAPER TAPE I/O DUMMY PHASE                   J1703320
                          DC      *-*       WD CNT, CREATED BY SYS LDR  J1703330
                          DC      16        PAPT I/O PHASE ID           J1703340
                          BSS     PRPNT-*-1 AREA REQ FOR PHASE 16       J1703350
                          DC      /FFFF     SIGNIFY END OF PHASE 16     J1703360
                          HDNG    PRECI--PROLOGUE                       J1703370
                    *************************************************** J1703380
                    *                                                 * J1703390
                    *STATUS - VERSION 2, MODIFICATION 11              * J1703400
                    *                                                 * J1703410
                    *FUNCTION/OPERATION-                              * J1703420
                    *   THIS DUP MODULE MOVES A CORE IMAGE PROGRAM    * J1703430
                    *   AS BUILT BY THE CORE LOAD BUILDER TO THE      * J1703440
                    *   USER AREA OR FIXED AREA OF ANY DRIVE.         * J1703450
                    *                                                 * J1703460
                    *ENTRY POINTS-                                    * J1703470
                    *   PC000-ENTER FROM CORE LOAD BUILDER AFTER THE  * J1703480
                    *         CORE IMAGE PROGRAM HAS BEEN BUILT AS    * J1703490
                    *         THE RESULT OF A DUP STORECI FUNCTION.   * J1703500
                    *                                                 * J1703510
                    *INPUT-                                           * J1703520
                    *   * CIB- FIRST 4K OF CORE LOAD.                 * J1703530
                    *   * CORE- CORE LOAD IS EXCESS OF 4K RESIDES     * J1703540
                    *     IN CORE FROM 4K UPWARD.                     * J1703550
                    *   * WORKING STORAGE- ALL LOCALS SOCALS, AND     * J1703560
                    *     NOCALS REQUIRED BY CORE LOAD. THE WORKING   * J1703570
                    *     STORAGE DRIVE WILL BE THE 'JOB' WORKING     * J1703580
                    *     STORAGE.                                    * J1703590
                    *                                                 * J1703600
                    *OUTPUT-                                          * J1703610
                    *   * USER AREA-WHEN FUNCTION IS STORECI TO UA.   * J1703620
                    *   * FIXED AREA-WHEN FUNCTION IS STORECI TO FXA. * J1703630
                    *                                                 * J1703640
                    *EXTERNAL REFERENCES-                             * J1703650
                    *   SUBROUTINES-                                  * J1703660
                    *      * DISKZ-PERFORMS REQUIRED DISK I/O         * J1703670
                    *   COMMA/DCOM-                                   * J1703680
                    *      * $ CORE                                   * J1703690
                    *      * #UHOL                                    * J1703700
                    *      * #FHOL                                    * J1703710
                    *      * #USZE                                    * J1703720
                    *      * #FSZE                                    * J1703730
                    *      * $WSDR                                    * J1703740
                    *      * $PHSE                                    * J1703750
                    *      * $CIBA                                    * J1703760
                    *      * #TODR                                    * J1703770
                    *                                                 * J1703780
                    *EXITS-                                           * J1703790
                    *   NORMAL-EXIT TO DUP CONTROL WITH CATCO SWITCHES* J1703800
                    *          PH2,PH3,PH4 SET TO ZERO.               * J1703810
                    *   ERROR-EXIT TO DUP CONTROL AFTER ZEROING       * J1703820
                    *         PH2,PH3, AND PH4 WITH THE ERROR CODE    * J1703830
                    *         IN CIERR.                               * J1703840
                    *                                                 * J1703850
                    *TABLES/WORK AREAS-                               * J1703860
                    *   DISK BUFFERS-                                 * J1703870
                    *      *  DCBUF-ONE SECTOR DCOM BUFFER            * J1703880
                    *      *  CIBUF-FOUR SECTOR CI PROGRAM BUFFER     * J1703890
                    *                                                 * J1703900
                    *ATTRIBUTES-                                      * J1703910
                    *      SERIALLY REUSEABLE                         * J1703920
                    *                                                 * J1703930
                    *NOTES-N/A                                        * J1703940
                    *************************************************** J1703950
                          HDNG    PRECI--ENTRY FROM CORE LOAD BUILDER   J1703960
                          ORG     B                                     J1703970
*SBRKGPW 11          DUP - MOVE DCI PROGRAMS TO UA OR FXA               J1703980
                          DC      *-*  WD CNT SUPPLIED BY SYS LOADER    J1703990
                          DC      -17  SLET INFO REQ BY THIS PHASE      J1704000
                          DC      P-PC000   ADDR OF SLET WORK AREA      J1704010
                          DC      1         NO. OF SLET ENTRIES REQ     J1704020
                          ORG     *-2  OVERLAY SYS LOADER WORDS         J1704030
                    *************************************************** J1704040
                    *                                                 * J1704050
                    *   DETERMINE IF CORE LOAD WAS BUILT              * J1704060
                    *                                                 * J1704070
                    *************************************************** J1704080
                    $INT1 EQU     /0009     ADDR OF LEVEL 1 INTRPT ADDR J1704090
                    *************************************************** J1704100
                    PC000 DC      *-*       ENT POINT FROM CLB          J1704110
                          BSI  I  PHIDP     PHASE ID OF PRECI TO $PHSE  J1704120
                          DC      /0011                                 J1704130
                          LD   L  $NDUP                                 J1704140
                          BSC  L  PC250,Z   BR IF CORE LOAD NOT BUILT   J1704150
                    *                                                 * J1704160
                          LDX  L1 P         XR1 IS PRECI WORK AREA PT   J1704170
                          LD   L  $WSDR                                 J1704180
                          SLA     12        WS DR CODE, ACC BITS 0-3    J1704190
                          OR    1 PC904-P   COMPLETE DCOM SCTR ADDR     J1704200
                          RTE     16                                    J1704210
                          LDD   1 PC904-P   SET UP DISK I/O TO READ     J1704220
                          STD  L1 -130      *FIRST 128 WORDS OF DCOM.   J1704230
                    *                                                 * J1704240
                          LDX  L3 P-130     XR3 IS IOAR ADDR FOR DCOM   J1704250
                          BSI  I  GETP      READ DCOM                   J1704260
                    *************************************************** J1704270
                    *                                                 * J1704280
                    *   SAVE CORE IMAGE HEADER IN PRECI WORK AREA     * J1704290
                    *                                                 * J1704300
                    *************************************************** J1704310
                          LD   L  $CIBA                                 J1704320
                          STO   1 PC907-P                               J1704330
                          LDX  L3 PC906     I/O ADDR FOR CI HDR IN XR3  J1704340
                          BSI  I  GETP      READ CORE IMAGE HEADER      J1704350
                    *************************************************** J1704360
                    *                                                 * J1704370
                    *   COMPUTE NUMBER OF SECTORS REQUIRED FOR        * J1704380
                    *   CORE IMAGE PROGRAM, INCLUDING ANY LOCALS      * J1704390
                    *   AND SOCALS.                                   * J1704400
                    *                                                 * J1704410
                    *************************************************** J1704420
                          LD    1 PC917-P                               J1704430
                          A     1 PC948-P   ROUND WD CNT UP BY 319      J1704440
                          RTE     16        *TO GET NO. OF SCTRS REQ    J1704450
                          SLA     16                                    J1704460
                          D     1 PC949-P                               J1704470
                          STO   1 PC950-P   SCTRS REQ W/O LOCALS/SOCALS J1704480
                          A     1 PC934-P                               J1704490
                          STO   1 PC951-P   TOTAL SECTORS REQUIRED      J1704500
                          SLA     4                                     J1704510
                          STO   1 #DBCT     DB CNT OF TOTAL CI PROGRAM  J1704520
                    *************************************************** J1704530
                    *                                                 * J1704540
                    *   DETERMINE IF DISK AREA DESTINATION WILL       * J1704550
                    *   CONTAIN CORE IMAGE PROGRAM                    * J1704560
                    *                                                 * J1704570
                    *************************************************** J1704580
                          LD    1 #UHOL                                 J1704590
                          BSC  L  PC020,+-  BR IF STORECI TO FIXED AREA J1704600
                    *                                                 * J1704610
                          STO   1 PC952-P   DESTINATION DB ADDR         J1704620
                          LD    1 #USZE                                 J1704630
                    PC010 SRA     4                                     J1704640
                          S     1 PC951-P                               J1704650
                          BSC  L  PC255,+Z  BR IF DESTINATION TOO SMALL J1704660
                          MDX     PC040                                 J1704670
                    *                                                 * J1704680
                    PC020 LD    1 #FHOL                                 J1704690
                          STO   1 PC952-P   DESTINATION DB ADDR         J1704700
                          LD    1 #FSZE                                 J1704710
                          MDX     PC010                                 J1704720
                          HDNG    PRECI--LOCALS/SOCALS TO UA OR FXA     J1704730
                    PC040 BSI  I  PHIDP     MODIFY PHASE ID             J1704740
                          DC      /1011     LOCAL/SOCAL PRECI MODIFIER  J1704750
                          LDX  I2 PC934     XR2 IS NO. OF LOCALS/SOCALS J1704760
                          LD    1 PC952-P                               J1704770
                          AND   1 PC954-P   MASK OF LAST POSITION       J1704780
                          STO   1 PC989-P   *OF DESTINATION DB ADDR.    J1704790
                    *                                                 * J1704800
                          LD    1 PC952-P                               J1704810
                          A     1 PC954-P   ADJUST DESTINATION DB ADDR  J1704820
                          SRT     16        *TO SECTOR BOUNDARY.        J1704830
                          LD    1 #TODR     INCLUDE DR CODE OF 'TO' DR  J1704840
                          SLT     12                                    J1704850
                          STO   1 PC953-P   INT DESTINATION SCTR ADDR   J1704860
                          STO   1 PC961-P                               J1704870
                          SLA     4                                     J1704880
                          STO   1 PC952-P   ADJUSTED DB ADDR            J1704890
                          LDX  I3 $WSDR     XR3 IS DR CODE OF WS        J1704900
                          LD    1 PC950-P   IS WS FILE GT           2-5 J1704910
                          S     1 PC913-P   *PROGRAM                2-5 J1704920
                          BSC     +Z        NO  - SKIP              2-5 J1704930
                          STO   1 PC992-P   YES - SET MOVE INDICATR 2-5 J1704940
                          LD   L3 $FPAD                                 J1704950
                          A     1 PC913-P   COMPUTE                 2-5 J1704960
                          MDX  L  PC992,0   *INITIAL                2-5 J1704970
                          MDX     PC045     *SOURCE                 2-5 J1704980
                          A     1 PC934-P   *SECTOR                 2-5 J1704990
                          S     1 PC991-P   *ADDR FOR LOCALS/SOCALS     J1705000
                    PC045 STO   1 PC955-P   STORE THE ADDRESS           J1705010
                    *                                                 * J1705020
                          RTE     16                                    J1705030
                          LD    1 PC953-P                               J1705040
                          A     1 PC950-P                               J1705050
                          MDX  L  PC992,0                           2-5 J1705060
                          MDX     PC048                             2-5 J1705070
                          A     1 PC934-P                               J1705080
                          S     1 PC991-P   COMPUTE DESTINATION SCTR    J1705090
                    PC048 STO   1 PC956-P   *ADDR FOR LOCALS/SOCALS     J1705100
                    *************************************************** J1705110
                    *                                                 * J1705120
                    *   DETERMINE IF ANY LOCALS OR SOCALS             * J1705130
                    *                                                 * J1705140
                    *************************************************** J1705150
                          LD    1 PC934-P                               J1705160
                          BSC  L  PC100,+-  BR IF NO LOCALS OR SOCALS   J1705170
                          LD    1 PC949-P                               J1705180
                          LDX  L3 BUF7      XR3 IS IOAR ADDR OF WS BFR  J1705190
                          STD   3 0         SET-UP IOAR TO READ WS      J1705200
                    PC050 BSI  I  GETP      READ LOCAL/SOCAL SECTOR     J1705210
                          LD    1 PC956-P                               J1705220
                          STO   3 +1        SET-UP IOAR TO WRITE UA/FXA J1705230
                          BSI  I  PUTP      WRITE LOCAL/SOCAL SECTOR    J1705240
                    *                                                 * J1705250
                          LD    1 PC992-P                           2-5 J1705260
                          BSC  L  PC060,-                           2-5 J1705270
                          MDX  L  PC955,1                           2-5 J1705280
                          MDX  L  PC956,1                           2-5 J1705290
                          MDX     PC070                             2-5 J1705300
                    PC060 MDX  L  PC955,-1  DECR WS SECTOR ADDRESS      J1705310
                          MDX  L  PC956,-1  DECR VA/FXA SECTOR ADDRESS  J1705320
                    PC070 LD    1 PC955-P                               J1705330
                          STO   3 +1        SET-UP IOAR TO READ WS      J1705340
                          MDX   2 -1        DECR LOCAL/SOCAL COUNTER    J1705350
                          MDX     PC050     CONT IF MORE LOCALS/SOCALS  J1705360
                          HDNG    PRECI--CORE IMAGE BUFFER TO UA/FXA    J1705370
                    *************************************************** J1705380
                    *                                                 * J1705390
                    *   MOVE CORE LOAD RESIDING IN CIB TO UA/FXA      * J1705400
                    *                                                 * J1705410
                    *************************************************** J1705420
                    PC100 BSI  I  PHIDP     MODIFY PHASE ID             J1705430
                          DC      /2011     CIB TO UA/FXA MODIFIER      J1705440
                          LD    1 PC957-P                               J1705450
                          S     1 PC914-P                               J1705460
                          BSC  L  PC270,+   BR IF PROG ALL IN CORE      J1705470
                          STO   1 PC958-P                               J1705480
                          S     1 PC917-P                               J1705490
                    *************************************************** J1705500
                    *                                                 * J1705510
                    *   DETERMINE IF CORE LOAD EXCEEDS 4K BOUNDARY    * J1705520
                    *                                                 * J1705530
                    *************************************************** J1705540
                          BSC  L  PC170,+Z  BR IF CORE LOAD ABOVE 4K    J1705550
                          LD    1 PC917-P                               J1705560
                    PC110 STO     PC125+1   INITLZ LDX INSTRUCTION      J1705570
                    PC120 LDX   1 4         XR1 IS MOD 4 LOOP COUNTER   J1705580
                    PC125 LDX  L3 *-*       XR3 IS WD CNT FOR CIB TO DK J1705590
                          LDX   2 0         XR2 IS MOD 4 SCTR WD CNT    J1705600
                    PC130 MDX  L2 +320      INCR MOD 4 WD CNT           J1705610
                          MDX  L3 -320      DECR CIB TO DK WD COUNT     J1705620
                          MDX     PC140                                 J1705630
                          MDX  L3 +320      INCR CIB TO DK WD COUNT     J1705640
                          NOP               ALLOW FOR SKIP              J1705650
                          MDX     PC160                                 J1705660
                    PC140 MDX   1 -1        DECR MOD 4 LOOP COUNTER     J1705670
                          MDX     PC130     CONT IF COUNTER POSITIVE    J1705680
                    *************************************************** J1705690
                    *                                                 * J1705700
                    *   MOVE FOUR FULL SECTORS FROM CIB TO UA/FXA     * J1705710
                    *                                                 * J1705720
                    *************************************************** J1705730
                          STX   3 PC125+1   SAVE REMAINING WD CNT       J1705740
                          STX  L2 BUF7                                  J1705750
                          LDX  L3 BUF7                                  J1705760
                          LD   L  PC907     SET UP IOAR TO READ CIB     J1705770
                          STO   3 +1                                    J1705780
                          BSI  I  GETP      READ FOUR SCTRS OF CIB      J1705790
                    *                                                 * J1705800
                          LD   L  PC953     CHANGE SCTR ADDR TO SCTR    J1705810
                          STO   3 +1        *ADDR OF UA/FXA DESTINATION J1705820
                          BSI  I  PUTP      WRITE 4 SECTORS TO UA/FXA   J1705830
                    *                                                 * J1705840
                          MDX  L  PC907,4   INCR CIB SCTR ADDR          J1705850
                          MDX  L  PC953,4   INCR UA/FXA SCTR ADDR       J1705860
                          MDX     PC120                                 J1705870
                    *************************************************** J1705880
                    *                                                 * J1705890
                    *   MOVE REMAINING WD CNT FROM CIB TO UA/FXA      * J1705900
                    *                                                 * J1705910
                    *************************************************** J1705920
                    PC160 STX  L2 BUF7                                  J1705930
                          STX  L3 PC960     NO. OF WORDS IN LAST SCTR   J1705940
                          LDX  L3 BUF7      SET UP I/O TO READ CORE     J1705950
                          LD   L  PC907     *LOAD REMAINING ON CIB.     J1705960
                          STO   3 +1                                    J1705970
                          BSI  I  GETP      READ CIB                    J1705980
                    *                                                 * J1705990
                          LD   L  PC953     CHANGE SCTR ADDR TO SCTR    J1706000
                          STO   3 +1        *ADDR OF UA/FXA DESTINATION J1706010
                          BSI  I  PUTP      WRITE TO UA/FXA             J1706020
                          MDX     PC180                                 J1706030
                    *************************************************** J1706040
                    *                                                 * J1706050
                    *   CORE LOAD EXCEEDS 4K BOUNDARY. SET UP WORD    * J1706060
                    *   COUNT TO MOVE CIB PORTION OF CORE LOAD TO THE * J1706070
                    *   USER AREA OR FIXED AREA.                      * J1706080
                    *                                                 * J1706090
                    *************************************************** J1706100
                    PC170 STO   1 PC959-P   SAVE NO. WDS ABOVE 4K       J1706110
                          LD    1 PC958-P   WD CNT OF CIB IS 4096 LESS  J1706120
                          MDX     PC110     *STARTING ADDR OF CORE LOAD J1706130
                          HDNG    PRECI--MOVE CORE LOAD ABOVE 4K        J1706140
                    *************************************************** J1706150
                    *                                                 * J1706160
                    *   IF CORE LOAD EXCEEDED 4K BOUNDARY, MOVE PART  * J1706170
                    *   ABOVE 4K TOWARD LOWER CORE TO ENABLE BRINGING * J1706180
                    *   DUP UPCOR PHASE BACK TO CORE.                   J1706190
                    *                                                 * J1706200
                    *************************************************** J1706210
                    PC180 BSI  I  PHIDP     MODIFY PHASE ID             J1706220
                          DC      /3011     ABOVE 4K PRECI MODIFIER     J1706230
                          LDX  L1 P         XR1 IS WORK AREA POINTER  * J1706240
                          LD    1 PC959-P   NO. OF WDS PAST 4K          J1706250
                          BSC  L  PC230,+-  BR IF NO CORE LOAD ABOVE 4K J1706260
                    *************************************************** J1706270
                    *                                                 * J1706280
                    *   FIND THE BEGINNING ADDR OF THE LAST SECTOR,   * J1706290
                    *   OR PARTIAL SECTOR OF THE CIB PORTION OF THE   * J1706300
                    *   CORE LOAD                                     * J1706310
                    *                                                 * J1706320
                    *************************************************** J1706330
                    *                       CODE REMOVED            2-9 J1706380
                          LD    1 PC957-P                               J1706390
                          S     1 PC960-P   COMPUTE IOAR HDR ADDR FOR   J1706400
                          S     1 PC964-P   *WRITING REMAINDER OF CORE  J1706410
                          STO     PC200+1   *LOAD TO UA/FXA.            J1706420
                          LD    1 PC962-P   COMPUTE ADDR FOR MOVING WDS J1706430
                          A     3 0         *WRITTEN ON LAST PARTIAL    J1706440
                          S     1 PC949-P   *SCTR ADJACENT TO THOSE     J1706450
                          STO     PC215+1   *PAST THE 4K BOUNDARY9      J1706460
                    PC200 LDX  L2 *-*       XR2 IS IOAR OF LAST SCTR(S) J1706470
                    *************************************************** J1706480
                    *                                                 * J1706490
                    *   BEFORE WRITING THE REMAINDER OF THE CORE LOAD * J1706500
                    *   TO DISK, THE WORDS REMAINING, PLUS THE DISK   * J1706510
                    *   IOAR HDR, IS MOVED /700 WORDS TOWARD LOWER    * J1706520
                    *   CORE. THIS WILL ALLOW DUP UPPER CORE TO BE    * J1706530
                    *   RESTORED BEFORE DOING LAST WRITE.             * J1706540
                    *                                                 * J1706550
                    *************************************************** J1706560
                          SLA     16                                    J1706570
                          S     1 PC959-P   COMPUTE WD CNT FOR WRITING  J1706580
                    *                       CODE REMOVED            2-9 J1706590
                          A     1 PC960-P   *REMAINDER OF CORE LOAD.    J1706600
                          STO   2 0         WORD COUNT                  J1706610
                    *                                                 * J1706620
                          LD    1 PC957-P                               J1706630
                          S     1 PC914-P                               J1706640
                          S    L  PC991     SUB 1 FOR EXACT SECTOR 2-11 J1706645
                          RTE     16        COMPUTE UA/FXA SCTR ADDR    J1706650
                          SLA     16        *TO WHICH REMAINDER OF      J1706660
                          D     1 PC949-P   *CORE LOAD WILL BE WRITTEN. J1706670
                          A     1 PC961-P                               J1706680
                          STO   2 +1        UA/FXA SCTR ADDR            J1706690
                    *                                                 * J1706700
                          LDX  I3 PC960     XR3 IS NO. OF WORDS TO MOVE J1706710
                    PC215 LDX  L1 *-*       XR1 IS START OF LAST SCTR   J1706720
                    PC220 LD    1 0         MOVE EACH WORD FROM LAST    J1706730
                          STO   2 +2        *SCTR SO AS TO BE ADJACENT  J1706740
                          MDX   1 +1        *TO CORE LOAD PAST 4K.      J1706750
                          MDX   2 +1        ADDR OF NEXT WD TO MOVE     J1706760
                          MDX   3 -1        DECR MOVE LOOP COUNTER      J1706770
                          MDX     PC220     CONT IF COUNT POSITIVE      J1706780
                    *                       CODE REMOVED            2-9 J1706900
                    PC228 LDX  I3 PC200+1                               J1706910
                          BSI  I  PUTP      WRITE REMAINDER OF PROG     J1706920
                    PC230 BSI     PC260     GET UPCOR                   J1706930
                    PC240 BSI  I  PHIDP     MODIFY PHASE ID             J1706940
                          DC      /5011     PRECI WRAP-UP MODIFIER      J1706950
                          LD   L  #DBCT+P                               J1706960
                          STO   1 #DBCT     DB CNT TO CATCO DCOM IMAGE  J1706970
                          LD   L  PC952                                 J1706980
                          STO   1 DBADR     DB ADDR TO CATCO            J1706990
                    *                                                 * J1707000
                          LD    1 IBT+4                                 J1707010
                          STO  L  $INT1     RESTORE LEVEL 1 INTERRUPT   J1707020
                          LDX  L2 IBT-1+C                               J1707030
                          STX  L2 $IBT4     POINT TO INTERRUPT TABLE -1 J1707040
                    *                                                 * J1707050
                          LD   L  PC990     COMPUTE NO. OF DB'S         J1707060
                          S    L  PC989     *PADDING REQUIRED.          J1707070
                          STO   1 TEMP1                                 J1707080
                          SLA     16                                    J1707090
                          STO   1 IOSW      RESET I/O REQ  FOR STORE    J1707100
                    *                                                 * J1707110
                          STO   1 PH2       CLEAR SWITCHES TO CAUSE     J1707120
                          STO   1 PH3       DUP CONTROL TO BRING        J1707130
                          STO   1 PH4       DUP PHASES BACK TO CORE     J1707140
                          STO  L  $NDUP     CLEAR SYS DUP INHIBIT SW    J1707150
                          LDX  L3 DCTLC                                 J1707160
                          LDD   1 DCHDR                                 J1707170
                          STD   3 0                                     J1707180
                          STO   1 XEQSW                                 J1707190
                          BSI  I  GET       GET AND EXECUTE DUP CONTROL J1707200
                    PC250 BSI     PC260     GET UPCOR                   J1707210
                          LDX   3 32                                    J1707220
                          STX  L3 CIERR+C   SET UP ERROR CODE           J1707230
                          MDX     PC240                                 J1707240
                    PC255 BSI     PC260     GET UPCOR                   J1707250
                          LDX   3 31                                    J1707260
                          STX  L3 CIERR+C   SET UP ERROR CODE           J1707270
                          MDX     PC240                                 J1707280
                    PC260 DC      *-*       GET UPCOR ENTRY POINT       J1707290
                          LDX  I3 PC900+1   XR3 IS IOAR FOR DUP UPCOR   J1707300
                          LDD  L  PC902                                 J1707310
                          STD   3 0         SET UP IOAR TO READ UPCOR   J1707320
                          BSI  I  GETP      READ UPCOR (PHASE 13)       J1707330
                          LDX  L1 C         XR1 IS CATCO MIDPOINT ADDR  J1707340
                          BSC  I  PC260     RETURN FROM GET UPCOR       J1707350
                    *                                                 * J1707360
                          HDNG    PRECI--CONSTANTS AND WORK AREAS       J1707370
                    *************************************************** J1707380
                    *                                                 * J1707390
                    *   DCOM IMAGE. RELATIVE LOCATIONS CORRESPOND TO  * J1707400
                    *   THOSE USED IN DUP FRONT END.                    J1707410
                    *                                                 * J1707420
                    *************************************************** J1707430
                          BSS  E  /82                                   J1707440
                    P     EQU     *         PRECI WORK AREA XR1 POINTER J1707450
                    PC900 DC      13        DUP UPCOR PHASE ID          J1707460
                          DC      *-*       FILLED BY THE SYSTEM LOADER J1707470
                    PC902 DC      *-*       FILLED BY THE SYSTEM LOADE  J1707480
                          DC      *-*       FILLED BY THE SYSTEM LOADE  J1707490
                    PC904 DC      /80       WORD COUNT TO READ DCOM     J1707500
                          DC      #DCOM     SYMBOLIC DCOM SCTR ADDR     J1707510
                    PC906 DC      40        WD CNT TO READ CI HEADER    J1707520
                    PC907 DC      *-*       CIB, DRIVE CODE--SCTR ADDR  J1707530
                          BSS     5         WORDS 1-5 OF CI HEADER      J1707540
                    PC913 DC      *-*       NO. OF FILES SECTORS        J1707550
                    PC914 DC      *-*       LOAD ADDR OF CORE LOAD      J1707560
                          BSS     2         WORDS 8-9 OF CI HEADER      J1707570
                    PC917 DC      *-*       LENGTH OF CORE LOAD, WORDS  J1707580
                          BSS     16        WORDS 11-26 OF CI HEADER    J1707590
                    PC934 DC      *-*       NO. OF LOCAL/SOCAL SECTORS  J1707600
                          BSS     13        WORDS 28-40 OF CI HEADER    J1707610
                    PC948 DC      319       CONSTANT                    J1707620
                    PC949 DC      320       CONSTANT                    J1707630
                    PC950 DC      *-*       PROG SCTRS W/O LOCAL/SOCALS J1707640
                    PC951 DC      *-*       TOTAL SCTRS REQ FOR PROG    J1707650
                    PC952 DC      *-*       DESTINATION DB ADDR         J1707660
                    PC953 DC      *-*       DESTINATION SCTR ADDR       J1707670
                    PC954 DC      /F        CONSTANT                    J1707680
                    PC955 DC      *-*       NO. OF LOCAL/SOCAL SCTRS    J1707690
                    PC956 DC      *-*       LOCAL/SOCALS UA/FXA ADDR    J1707700
                    PC957 DC      /1000     CONSTANT                    J1707710
                    PC958 DC      *-*       4096 - LOAD ADDR OF PROG    J1707720
                    PC959 DC      *-*       PC958 - LENGTH OF PROG      J1707730
                    PC960 DC      *-*       CIB TO UA/FXA WD CNT        J1707740
                    PC961 DC      *-*       DESTINATION SCTR ADDR       J1707750
                    PC962 DC      BUF7+2    ADDR OF DISK BUFFER, WD 1   J1707760
                    PC964 DC      2         CONSTANT                    J1707770
                    PC975 DC      *-*       HOLDS SCTR ADDR             J1707780
                          HDNG    PRECI--CONSTANTS AND WORK AREAS       J1707790
                          BSS  E  0                                     J1707800
                    PC977 DC      *-*       HOLDS FUNCTION ID           J1707810
                          DC      *-*       HOLDS I/O ADDR              J1707820
                    PC981 DC      /7000     RESTORE/READ W/O CONV       J1707830
                    PC982 DC      /7001     PRINT                       J1707840
                    PC984 DC      /0FFF     MASK                        J1707850
                    PC985 DC      /F0FF     MASK TO ELIMINATE MODULE    J1707860
                    PC986 DC      319       CONSTANT 319                J1707870
                    PC987 DC      320       CONSTANT 320                J1707880
                    PC988 DC      1600      CONSTANT 1600               J1707890
                    PC989 DC      *-*       LOW ORDER DIGIT OF DB ADDR  J1707900
                    PC990 DC      16        CONSTANT                    J1707910
                    PC991 DC      1         CONSTANT                    J1707920
                    PC992 DC      0         MOVE INDICATOR          2-5 J1707930
                    IDMP  DC      PC300     RECORDS PHASE ID MODIFIER   J1707940
                    PHIDP DC      PC310     RECORDS PHASE ID            J1707950
                    GETP  DC      PC320     READ FROM DISK USING DISKZ  J1707960
                    PUTP  DC      PC330     WRITE TO DISK USING DISKZ   J1707970
                          HDNG    PRECI--ENTIRE CORE LOAD ABOVE 4K      J1707980
                    PC270 BSI  I  PHIDP     MODIFY PHASE ID             J1707990
                          DC      /4011     PROG ABOVE 4K MODIFIER      J1708000
                          LD    1 PC914-P                               J1708010
                          S     1 PC964-P                               J1708020
                          STO     PC280+1                               J1708030
                    PC280 LDX  L3 *-*       XR3 IS HDR FOR CORE LOAD    J1708040
                          LD    1 PC953-P                               J1708050
                          STO   3 1         SECOND WD OF IOAR HDR   2-9 J1708060
                          LD    1 PC917-P                               J1708070
                          STO   3 0         FIRST WD OF IOAR HDR    2-9 J1708080
                          BSI  I  PUTP      WRITE CORE LOAD TO UA/FXA   J1708090
                          BSC  L  PC230     BRANCH TO FETCH UPCOR       J1708100
                          HDNG    PRECI--PHASE ID MODIFICATION          J1708110
                    *************************************************** J1708120
                    *                                                 * J1708130
                    * MODIFY PHASE ID FOR MOST RECENT SUB MODULE      * J1708140
                    *                                                 * J1708150
                    *************************************************** J1708160
                    PC300 DC      *-*       RECORD SOURCE OF ENTRY      J1708170
                    *                                                   J1708180
                          LD   L  $PHSE                                 J1708190
                          AND     PC985     EXTRACT LAST MODULE IND     J1708200
                          OR   I  PC300     INSERT NEW SUB MODULE IND   J1708210
                          STO     *+1       RECORD REQUIRED CONSTANT    J1708220
                    *                                                   J1708230
                          BSI     PC310     GO TO RECORD REQD ID        J1708240
                          DC      *-*       PHASE ID PUT HERE           J1708250
                    *                                                   J1708260
                          MDX  L  PC300,+1  STEP RETURN ADDRESS         J1708270
                          BSC  I  PC300     RETURN TO SUB MODULE        J1708280
                    *                                                   J1708290
                          HDNG    PRECI--RECORD PHASE ID                J1708300
                    *************************************************** J1708310
                    *                                                   J1708320
                    * RECORD PHASE ID FOR THE OVERLAY JUST READ IN CORE J1708330
                    *                                                 * J1708340
                    *************************************************** J1708350
                    PC310 DC      *-*       RECORD SOURCE OF ENTRY      J1708360
                          LD   I  PC310                                 J1708370
                          STO  L  $PHSE     RECORD PHASE IDENTIFICATION J1708380
                    *                                                   J1708390
                          MDX  L  PC310,+1  INCRE RET ADDR              J1708400
                    *                                                   J1708410
                          BSC  I  PC310     RETURN TO DUP OVERLAY       J1708420
                          HDNG    PRECI--DISKZ INTERFACE                J1708430
                    *************************************************** J1708440
                    *                                                 * J1708450
                    *  ENTER HERE TO READ FROM DISK                   * J1708460
                    *                                                 * J1708470
                    *************************************************** J1708480
                    PC320 DC      *-*       RECORD SOURCE OF ENTRY      J1708490
                          BSI  I  IDMP      IDENTIFY PHASE MODIFICATION J1708500
                          DC      /0100     GET IS MOD 1                J1708510
                    *                                                 * J1708520
                          LD      PC320                                 J1708530
                          STO     PC330     SET UP EXIT ADDRESS         J1708540
                    *                                                   J1708550
                          LD      PC981     READ FUNC CODE TO ACC       J1708560
                          MDX     PC340     GO TO READ FROM DISK        J1708570
                    *                                                   J1708580
                    *************************************************** J1708590
                    *                                                 * J1708600
                    *  ENTER HERE TO WRITE ON DISK                    * J1708610
                    *                                                 * J1708620
                    *************************************************** J1708630
                    PC330 DC      *-*       RECORD SOURCE OF ENTRY      J1708640
                          BSI  I  IDMP      IDENTIFY PHASE MODIFICATION J1708650
                          DC      /0200     PUT IS MOD 2                J1708660
                    *                                                 * J1708670
                          LD      PC982     SET UP TO WRITE             J1708680
                    *************************************************** J1708690
                    *                                                 * J1708700
                    *  THE BALANCE OF DUP34 IS USED FOR BOTH RD & WRT * J1708710
                    *                                                 * J1708720
                    *************************************************** J1708730
                    PC340 STO     PC977                                 J1708740
                    *                                                   J1708750
                          STX   3 PC977+1    SET UP IOAR                J1708760
                    *************************************************** J1708770
                    *                                                 * J1708780
                    * TEST DISK PARAMS - SCTR 0,NEG WD CNT,CART OVFLO * J1708790
                    *                                                 * J1708800
                    *************************************************** J1708810
                          LD    3 1                                     J1708820
                          AND     PC984     /0FFF MASK DRIVE CODE       J1708830
                          STO     PC975     SAVE SCTR ADDR W/O OR CODE  J1708840
                    *                                                   J1708850
                          BSC     Z         SKIP IF SCTR ZERO..ERROR..  J1708860
                    *                                                   J1708870
                          LD    3 0                                     J1708880
                          BSC  L  PC350,-Z  WORD COUNT POSITIVE         J1708890
                    *                                                   J1708900
                          BSI  L  PC260     RESTORE DUP UPCOR           J1708910
                          LDX   3 92                                    J1708920
                          STX  L3 CIERR+C   D 92 ERROR. BAD DISKZ CALL  J1708930
                          BSC  L  PC240     BR TO COMPLETE PRECI        J1708940
                    *                                                   J1708950
                    *************************************************** J1708960
                    *                                                 * J1708970
                    *   INSURE DISK OPERATION WILL NOT EXCEED CYL 200 * J1708980
                    *                                                 * J1708990
                    *************************************************** J1709000
                    PC350 A       PC986     ADJ WD CNT TO NEXT SCTR     J1709010
                          RTE     16                                    J1709020
                          SLA     16                                    J1709030
                          D       PC987     CONVERT TO SECTORS          J1709040
                          A       PC975     SPECIFIED SECTORS           J1709050
                          S       PC988     CYL 200 (SCTRS)             J1709060
                          BSC  L  PC355,Z+  WITHIN LIMITS           2-9 J1709070
                    *                                                   J1709080
                          BSI  L  PC260     RESTORE DUP UPCOR           J1709090
                          LDX   3 93                                    J1709100
                          STX  L3 CIERR+C   D 93 ERROR9 CART OVERFLOW   J1709110
                          BSC  L  PC240     BR TO COMPLETE PRECI        J1709120
                    *                                               2-9 J1709121
                    *  IF LD ADR ODD, MOVE COMPLETE CORE LD DOWN 1  2-9 J1709122
                    *                                               2-9 J1709123
                    PC355 LD      PC977+1   GET ADR OF IOAR         2-9 J1709124
                          BSC  L  PC356,E   IF ODD MOVE LOAD DOWN   2-9 J1709125
                          MDX     PC360     SKIP AROUND IF EVEN     2-9 J1709126
                    PC356 STO     PC357+1   SAVE FOR WD CNT LOAD    2-9 J1709127
                    PC357 LDX  I1 *-*       LD WD CNT OF CODE LOAD  2-9 J1709128
                          S       PC991     SUB 1                   2-9 J1709129
                          STO     PC977+1   POINT IOCC TO EVEN ADR  2-9 J1709130
                          MDX   3 -1        POINT TO IOAR ADR-1     2-9 J1709131
                          MDX   1 2         CORE LD SIZE+2 FOR MOVE 2-9 J1709132
                    PC358 LD    3 1         THIS LOOP MOVES         2-9 J1709133
                          STO   3 0         *CORE LD DOWN ONE WORD  2-9 J1709134
                          MDX   3 1         *SO THE BEGINNING       2-9 J1709135
                          MDX   1 -1        *ADR IS EVEN            2-9 J1709136
                          MDX     PC358     *FOR DISKZ WRITE        2-9 J1709137
                    *                                                   J1709138
                    *************************************************** J1709140
                    *                                                 * J1709150
                    *  DO REQD DISK FUNCTION AND WAIT UNTIL COMPLETE  * J1709160
                    *                                                 * J1709170
                    *************************************************** J1709180
                    PC360 LDD     PC977     NO ERROR, SO GO WRITE OUT   J1709190
                          BSI  L  DISKZ     *BUFFER                     J1709200
                    *                                                   J1709210
                    PC370 MDX  L  $DBSY,0   LOOP ON BUSY                J1709220
                          MDX     PC370                                 J1709230
                          BSC  I  PC330     RETURN FROM GET OR PUT      J1709240
                          BSS     $ZEND+/27F-*   PATCH AREA             J1709250
                          DC      /FFFF     END OF PRECI PATCH AREA     J1709260
                          HDNG    MODIF EXIT-DUP RETURN TO MODIF        J1709270
                          ORG     @SBFR-322                         2-8 J1709280
*SBRKGPW 12          DUP - EXIT TO MODIF DUMMY PHASE                    J1709290
                          DC      *-*       WD CNT, CREATED BY SYS LDR  J1709300
                          DC      18        MODIF EXIT PHASE ID         J1709310
                          BSS     @SBFR-*-1 AREA REQ FOR PHASE 18   2-8 J1709320
                          DC      /FFFF     SIGNIFY END OF PHASE 18     J1709330
                          END     PC000                                 J1709340
