                          HDNG    CFACE-    RESIDENT COMMA   2 AUG 67   J1000010
                          ABS                                           J1000020
                    $CIBA EQU     /5   ADDR OF CIB ON MASTER CARTRIDGE  J1000030
                    $CH12 EQU     /6   CHANNEL 12 INDR,NON-ZERO=CHAN 12 J1000040
                    $COMN EQU     /7   WORD COUNT OF COMMON             J1000050
                    $CORE EQU     /E   CORE SIZE,/1000=4K,/2000=8K,ETC) J1000060
                    $CTSW EQU     /F   MCR SW,NON-ZERO=// RECD TRAPPED  J1000070
                    $DADR EQU     /10  SCTR ADDR OF PROG TO BE FETCHED  J1000080
                    $DABL EQU     /11  IOCC FOR SCA RESET (ODD ADDR)    J1000090
                    $DREQ EQU     /12  INDR FOR REQUESTED V. DISK I/O   J1000100
                    $IBSY EQU     /13  PRINC I/O BUSY INDR,NON-ZERO=BSY J1000110
                    $HASH EQU     /14  WORK AREA FOR MONITOR PROGRAMS   J1000120
                    $PRET EQU     /28  ADDR PREOPERATIVE ERROR TRAP     J1000130
                    $IREQ EQU     /2C  ADDR OF INT REQUEST SUBROUTINE   J1000140
                    $ULET EQU     /2D  ADDR OF LET, LOGICAL DRIVE 0     J1000150
                    $IOCT EQU     /32  IOCS CTR,0=NO I/O IN PROGRESS    J1000160
                    $LAST EQU     /33  LAST CD INDR,NON-ZERO=LAST CARD  J1000170
                    $NDUP EQU     /34  INHIBIT DUP SW,NON-ZERO=NO DUP   J1000180
                    $NXEQ EQU     /35  INHIBIT EXEC SW,NON-ZERO=NO EXEQ J1000190
                    $PBSY EQU     /36  PRINC PTR BUSY INDR,NON-ZERO=BSY J1000200
                    $PGCT EQU     /37  PAGE NO. FOR PAGE HEADINGS       J1000210
                    $EXIT EQU     /38  ADDR CALL EXIT ENTRY POINT       J1000220
                    $LINK EQU     /39  ADDR CALL LINK ENTRY POINT       J1000230
                    $DUMP EQU     /3F  ADDR OF CALL DUMP, ENTRY POINT   J1000240
                    $DCDE EQU     /77  DRIVE CODE FOR CORE LOAD BLDR    J1000250
                    $PHSE EQU     /78  NO. OF PHASE CURRENTLY IN CORE   J1000260
                    $UFIO EQU     /79  ARM POSITION IN UNFORMATTED AREA J1000270
                    $WSDR EQU     /7A  WORKING STORAGE DRIVE CODE       J1000280
                    $WRD1 EQU     /7B  LOAD ADDR FOR CURR USER CORE LD  J1000290
                    $KCSW EQU     /7C  INHIBIT INPUT/PRINT OVERLAP SW   J1000300
                    $UFDR EQU     /7D  UNFORMATTED I/O DRIVE CODE       J1000310
                    $CPTR EQU     /7E  CHANNEL 12 INDICATOR FOR CP      J1000320
                    $1132 EQU     /7F  CHANNEL 12 INDICATOR FOR 1132    J1000330
                    $1403 EQU     /80  CHANNEL 12 INDICATOR FOR 1403    J1000340
                    $PST1 EQU     /81  ADDR POSTOP ERROR TRAP,LEVEL 1   J1000350
                    $PST2 EQU     /85  ADDR POSTOP ERROR TRAP,LEVEL 2   J1000360
                    $PST3 EQU     /89  ADDR POSTOP ERROR TRAP,LEVEL 3   J1000370
                    $PST4 EQU     /8D  ADDR POSTOP ERROR TRAP,LEVEL 4   J1000380
                    $STOP EQU     /91  ADDR PROGRAM STOP KEY TRAP       J1000390
                    $FPAD EQU     /95  FILE PROTECT ADDR (ADJ),LOG DR 0 J1000400
                    $CYLN EQU     /9A  ARM POSITION FOR LOGICAL DRIVE 0 J1000410
                    $ACDE EQU     /9F  AREA CODE FOR LOGICAL DRIVE 0    J1000420
                    $DCYL EQU     /A4  1ST DEF CYL ADDR, LOGICAL DR 0   J1000430
                    $I200 EQU     /B3  ENTRY POINT TO ILS FOR LEVEL 2   J1000440
                    $I205 EQU     /B8                                   J1000450
                    $IBT2 EQU     $I205+1 ADDR OF IBT FOR LEVEL 2       J1000460
                    $I400 EQU     /C4  ENTRY POINT TO ILS FOR LEVEL 4   J1000470
                    $I405 EQU     /D3                                   J1000480
                    $IBT4 EQU     $I405+1 ADDR OF IBT FOR LEVEL 4       J1000490
                    $I410 EQU     /D5                                   J1000500
                    $DBSY EQU     /EE  DISK BUSY INDR,NON-ZERO=DK BUSY  J1000510
                    $BYSW EQU     /1CB BYPASS SW,NOP IF FETCHING SOCAL  J1000520
                    DZ000 EQU     /0F2 DISKZ ENTRY POINT                J1000530
                    $ZEND EQU     /1E0 ADDR 1+LAST WORD OF DISKZ        J1000540
                          HDNG          CONCATENATED COMMON AREA(CATCO) J1000550
                    C     EQU     /7FA0     CATCO POINTER SET TO MIDDLE J1000560
                    *************************************************** J1000570
                    *                                                 * J1000580
                    *  INDEX REG 1 IS SET TO .C. WHEN CATCO IS FORMED * J1000590
                    *  FOR USE BY ALL OF DUP FUNCTIONS. ANY DUP ROUT  * J1000600
                    *  USING XR 1 FOR OTHER REASONS MUST RESTORE.     * J1000610
                    *  ALL VALUES IN CATCO HAVE LABELS EQUATED TO THE * J1000620
                    *  VALUE THAT INDICATES THEIR RELATIVE LOCATION   * J1000630
                    *  FROM .C.                                       * J1000640
                    *                                                 * J1000650
                    *************************************************** J1000660
                    *                                                 * J1000670
                    *             CATCO DCOM IMAGE                    * J1000680
                    *   EQUIVALENCES USED TO REFERENCE CATCO WITH XR1 * J1000690
                    *                                                 * J1000700
                    *************************************************** J1000710
                    #NAME EQU     4-/80     NAME OF PROGRAM             J1000720
                    #DBCT EQU     6-/80     DISK BLOCK COUNT OF PROGRAM J1000730
                    #FCNT EQU     7-/80     FILES SW,ZERO = NO FILES    J1000740
                    #SYSC EQU     8-/80     NON-ZERO,SYSTEM CARTRIDGE   J1000750
                    #JBSW EQU     9-/80     JOB SW,NON-ZERO='T' MODE    J1000760
                    #CBSW EQU     10-/80    CLB SW,NON-ZERO=STORECI     J1000770
                    #LCNT EQU     11-/80    NO. OF LOCALS               J1000780
                    #MPSW EQU     12-/80    NON-ZERO, CORE MAP DESIRED  J1000790
                    #MDF1 EQU     13-/80    NO. OF DUP CTRL RCDS        J1000800
                    #MDF2 EQU     14-/80    ADDR OF MODIF BUFFER        J1000810
                    #NCNT EQU     15-/80    NO. OF NOCALS               J1000820
                    #ENTY EQU     16-/80    RELATIVE ENTRY ADDR OF PROG J1000830
                    #RP67 EQU     17-/80    IF NON-ZERO,1442 MOD 6,7    J1000840
                    *                                                   J1000850
                    *   NEGATIVE VALUE REPRESENTS DEFAULT CONDITION   * J1000860
                    #TODR EQU     18-/80    DR CODE OF 'TO' DRIVE       J1000870
                    #FRDR EQU     19-/80    DR CODE OF 'FROM' DRIVE     J1000880
                    *                                                 * J1000890
                    #FHOL EQU     20-/80    ADDR OF LARGEST FXA HOLE    J1000900
                    #FSZE EQU     21-/80    BLK CNT LARGEST HOLE IN FXA J1000910
                    #UHOL EQU     22-/80    ADDR OF LARGEST UA HOLE     J1000920
                    #USZE EQU     23-/80    BLK CNT LARGEST HOLE IN UA  J1000930
                    #DCSW EQU     24-/80    NON-ZERO=DUP CALL           J1000940
                    #PIOD EQU     25-/80    PRINC. I/O INDICATOR        J1000950
                    #PPTR EQU     26-/80    PRINC. PRINTER INDICATOR    J1000960
                    #CIAD EQU     27-/80    WD NO. SCTR 0,CIL ADDR      J1000970
                    #ACIN EQU     28-/80    AVAILABLE CARTRIDGE INDR2-8 J1000980
                    #GRPH EQU     29-/80    2250 INDICATOR          2-8 J1000990
                    #GCNT EQU     30-/80    NO. G2250 RECORDS       2-8 J1001000
                    #LOSW EQU     31-/80    LOCAL-CALLS-LOCAL INDR  2-8 J1001010
                    #X3SW EQU     32-/80    SPECIAL ILS SWITCH      2-8 J1001020
                    #ECNT EQU     33-/80    NO. OF EQUAT RCDS       2-8 J1001030
                    #ANDU EQU     35-/80    END OF UA (ADJ) LOG DR 0-4  J1001040
                    #BNDU EQU     40-/80    END OF UA (BASE) LOG DR 0-4 J1001050
                    #FPAD EQU     45-/80    FILE PROTECT ADDR (BASE)    J1001060
                    #PCID EQU     50-/80    CART ID, PHYS DR 0-4        J1001070
                    #CIDN EQU     55-/80    CART ID, LOG DR 0-4         J1001080
                    #CIBA EQU     60-/80    CIB ADDR, LOG DR 0-4        J1001090
                    #SCRA EQU     65-/80    SCRA, LOG DR 0-4            J1001100
                    #FMAT EQU     70-/80    WS FORMAT, LOG DR 0-4       J1001110
                    #FLET EQU     75-/80    FLET ADDR, LOG DR 0-4       J1001120
                    #ULET EQU     80-/80    LET ADDR, LOG DR 0-4        J1001130
                    #WSCT EQU     85-/80    WS BLK CNT, LOG DR 0-4      J1001140
                    #CSHN EQU     90-/80    CUSHION END SCTR ADDR, 0-4  J1001150
                    #DCOM EQU     1         SCTR ADDR OF DCOM           J1001160
                    #HDNG EQU     7         SCTR WITH PAGE HEADING      J1001170
                    @SBFR EQU     /FB0                              2-8 J1001180
                          HDNG    CONCATENATED COMMON AREA (CATCO)      J1001190
                    *************************************************** J1001200
                    *                                                 * J1001210
                    *             CATCO IOAR HDRS FOR DUP PHASES        J1001220
                    *                                                 * J1001230
                    *************************************************** J1001240
                          ORG     -/10                                  J1001250
                    DCHDR BSS     2         DUP CONTROL            PH02 J1001260
                    STHDR BSS     2         STORE                  PH03 J1001270
                    FLHDR BSS     2         FILEQ                  PH04 J1001280
                    DMHDR BSS     2         DUMP                   PH05 J1001290
                    DLHDR BSS     2         DUMPLET                PH06 J1001300
                    DTHDR BSS     2         DELETE                 PH07 J1001310
                    DFHDR BSS     2         DEFINE                 PH08 J1001320
                    DXHDR BSS     2         DUP EXIT               PH09 J1001330
                    UCHDR BSS     2         DUP UPCOR              PH13 J1001340
                    PIHDR BSS     2         PRINCIPAL I/O BLOCK    PH14 J1001350
                    SIHDR BSS     2         PRINC I/O (W/O KB) BLK PH15 J1001360
                    PTHDR BSS     2         PAPER TAPE I/O BLOCK   PH16 J1001370
                    CIHDR BSS     2         CI PHASE READ BY CL BUILDER J1001380
                    MUHDR BSS     2         MACRO UPDATE      PH206 2-8 J1001390
                    D2HDR BSS     2         DUP CONTROL 2     PH205 2-8 J1001400
                          HDNG    CFACE-    CATCO DUP SWITCHES          J1001410
                    *************************************************** J1001420
                    *                                                   J1001430
                    *             CATCO DUP SWITCHES                  * J1001440
                    *      WORDS USED FOR COMMUNICATION OF DATA         J1001450
                    *   BETWEEN DUP ROUTINES.                           J1001460
                    *                                                 * J1001470
                    *      INITIALIZED TO ZERO BY  .REST. OF DUPCO    * J1001480
                    *                                                   J1001490
                    *************************************************** J1001500
                    CL1   EQU     *                                     J1001510
                    ASMSW BSS     1         NON ZERO IF DEFINE VOID ASM J1001520
                    BITSW BSS     1         NON ZERO TO ALLOW MDUMP-S   J1001530
                    BLKSW BSS     1         NON ZERO IF BYPASSING REC   J1001540
                    CIERR BSS     1         ERROR NO DETECTED BY PH 17  J1001550
                    CISW  BSS     1         NON ZERO IF STORE CI        J1001560
                    CLBSW BSS     1         NON ZERO IF PRECI EXECUTED  J1001570
                    CNTNO BSS     1         RECORD NO BEING PCHD OR RD  J1001580
                    *                                                 * J1001590
                    *   .DATSW. IS FILLED WITH THE CNT FIELD OF THE   * J1001600
                    *   DUP CONTROL RECORD.                           * J1001610
                    *   USED PRIMARILY FOR DATA MOVEMENT, BUT ALSO IS * J1001620
                    *   USED FOR COUNT OF RECORDS TO READ AFTER A     * J1001630
                    *   STORE CI DUP CONTROL RECORD.                  * J1001640
                    DATSW BSS     1         RECORDS VALUE IN CNT FIELD  J1001650
                    DBADR BSS     1         DB ADDR OF REFERENCED PROG  J1001660
                    DELSW BSS     1         ADDR OF REQ LET ENTRY - 1   J1001670
                    DFNSW BSS     1         NON ZERO IF DEFINE FXA      J1001680
                    DKSAD BSS     1         DK SCTR ADDR W/O DR CODE    J1001690
                    DUMPP BSS  E  2         LAST LIMITS FOR PRNTR DUMP  J1001700
                    FORSW BSS     1         NON ZERO IF DEFINE VOID FOR J1001710
                    FRWS  BSS     1         NON ZERO IF FROM FLD IS WS  J1001720
                    FXSW  BSS     1         NON ZERO IF FIXED AREA REQD J1001730
                    HOLSW BSS     1         NON ZERO IF NO CONV REQD    J1001740
                    IOSW  BSS     1         NON ZERO IF IN/OUT REQD     J1001750
                    *                                                 * J1001760
                    *   DUMPLET SWITCH - ZERO IF NOT DUMPLET/DUMPFLET * J1001770
                    *       PLUS VALUE REQUIRES PRINT OF BOTH LET/FLET* J1001780
                    *       NEG. VALUE REQUIRES PRINT OF FLET ONLY    * J1001790
                    LETSW BSS     1         NON ZERO,PRINT LET OR FLET* J1001800
                    LSTLF BSS     1         LAST LET/FLET SECT PROCESSD J1001810
                    MODSW BSS     1         NON ZERO IF STORE MOD FUNC  J1001820
                    NAMSW BSS     1         NON ZERO IF NAME IN LET/F   J1001830
                    NEGSW BSS     1         NON ZERO IF SHRINKING FXA   J1001840
                    PGMHL BSS     1         WORD COUNT OF THE PROG HDR  J1001850
                    PRSW  BSS     1         NON ZERO IF PRINTING OUTPUT J1001860
                    PTSW  BSS     1         NON ZERO IF PAPER TAPE REQD J1001870
                    SKWDS BSS     1         WDS TO SEARCH IN L/F SECT   J1001880
                    STCSW BSS     1         NON ZERO IF STORE DATA CI   J1001890
                    STSW  BSS     1         NON ZERO IF STORE TYPE      J1001900
                    TEMP1 BSS  E  1         1ST WD OF BINEB OUTPUT      J1001910
                    TEMP2 BSS     1         2ND WD OF BINEB OUTPUT      J1001920
                    TOWS  BSS     1         NON ZERO IF TO FIELD IS WS  J1001930
                    T3MSW BSS     1         TYPE 3,4 SOCAL LEVEL CELL   J1001940
                    UASW  BSS     1         NON ZERO IF USER AREA REQD  J1001950
                    WSSW  BSS     1         NON ZERO IF WORK STG REQD   J1001960
                    XEQSW BSS     1         NON ZERO IF NOT RET FR GET  J1001970
                    EBCSW BSS     1         NON ZERO IF EBC DATA OP 2E2 J1001980
                    HDNSW BSS     1         NON ZERO IF NAME IN HDR 2-8 J1001990
                    RPGSW BSS     1         NON Z IF DEFINE VOID RPG2-8 J1002000
                    DFLSW BSS     1         NON ZERO IF *DFILE      2-8 J1002010
                          BSS     1         RESERVED FOR ADDITION   2-8 J1002020
                    CL2   EQU     *-1                                   J1002030
                          HDNG    CFACE-    CATCO DUP SWITCHES          J1002040
                    *************************************************** J1002050
                    *                                                 * J1002060
                    *             CATCO DUP SWITCHES                  * J1002070
                    *  INITIALIZED BY DCTL AND NOT RESET BY .REST.    * J1002080
                    *                                                 * J1002090
                    *************************************************** J1002100
                    IOREQ BSS     1         MON-ZERO,AUX I/O SET REQ    J1002110
                    PH2   BSS     1         NON-ZERO IF DCTL IN CORE    J1002120
                    PH3   BSS     1         NON-ZERO IF STORE IN CORE   J1002130
                    PH4   BSS     1         NON-ZERO IF DUMP IN CORE    J1002140
                    ************************************************2-8 J1002150
                    *                                               2-8 J1002160
                    *             CATCO SWITCH INITIALIZED TO ZERO  2-8 J1002170
                    *   BY CCAT SUBR AND SET BY MACRO UPDATE PROGRAM2-8 J1002180
                    *                                               2-8 J1002190
                    ************************************************2-8 J1002200
                    DUPCR BSS     1         NON ZERO IF DUP CTRL RCD2-8 J1002210
                    *************************************************** J1002220
                    *                                                 * J1002230
                    *             CATCO DUP SWITCHES SET BY CCAT SUBR * J1002240
                    *                                                 * J1002250
                    *************************************************** J1002260
                    ADDR2 BSS     1         KB INTERRUPT ADDRESS        J1002270
                    KBREQ BSS     1         CONTENTS OF LOC 13          J1002280
                    *      THE FOLLOWING SWITCH IS SET TO INDICATE THE  J1002290
                    *       PRINCIPAL INPUT DEVICE                      J1002300
                    *             -  IS PAPER TAPE                      J1002310
                    *             0  IS CARD                            J1002320
                    *             +  IS KEYBOARD                        J1002330
                    INOUT BSS     1         PRINCIPAL INPUT SWITCH      J1002340
                    *                                                   J1002350
                    PTPON BSS     1         NON-ZERO IF PAPER TP ON SYS J1002360
                    *************************************************** J1002370
                    *                                                 * J1002380
                    *             LEVEL 4 INTERRUPT BRANCH TABLE      * J1002390
                    *             ADDRESSES. INITIALIZED BY CCAT,     * J1002400
                    *             AND CARD/PAPER TAPE INTERFACES.     * J1002410
                    *                                                 * J1002420
                    *************************************************** J1002430
                          ORG     /0049                                 J1002440
                    IBT   BSS     9         9 WD INTRPT BRANCH TABLE    J1002450
                    *************************************************** J1002460
                    *                                                 * J1002470
                    *             CATCO I/O ADDRESSES REQUIRED BY DUP * J1002480
                    *                                                 * J1002490
                    *************************************************** J1002500
                    P1442 BSS  E  2         SYS 1442 IOAR HEADER        J1002510
                    PRPAR BSS     2         DEFAULT LIMITS TO PRINT     J1002520
                    PHDUP BSS     1         LAST DUP PHASE IN CORE      J1002530
                    CRBUF BSS     1         81 WD BFR FOR DUP CTRL RCDS J1002540
                    DCADR BSS     1         ADDR FOR DUP CTRL IOAR HDR  J1002550
                    HDBUF BSS     1         ADDR OF PAGE HEADING BFR    J1002560
                    IOBLK BSS     1         ADDR OF DUP I/O PHASE       J1002570
                    SDBUF BSS     1         STORE/DUMP BUFFER           J1002580
                    LETAR BSS     1         ADDR OF LET SEARCH BUFFER   J1002590
                    PEBUF BSS     1         41 WD BFR FOR PACKED EBCDIC J1002600
                    THIS  BSS     1         ADDR OF DOUBLE BFR, BFR 1   J1002610
                    NEXT  BSS     1         ADDR OF DOUBLE BFR, BFR 2   J1002620
                          HDNG              DUP CORE PARAMETERS         J1002630
                    DISKZ EQU     DZ000     DISKZ ENTRY POINT           J1002640
                    B     EQU     $ZEND-2                               J1002650
                    DMPLC EQU     B         IOAR CORE ADDR FOR DMPLT    J1002660
                    EXITC EQU     B         IOAR CORE ADDR FOR DEXIT    J1002670
                    MUPC  EQU     B         IOAR CORE ADDR FOR MUP  2-8 J1002680
                    DCTL  EQU     B+/1002   ENTRY ADDRESS OF DCTL       J1002690
                    DCTLC EQU     B+/1000   IOAR CORE ADDR FOR DCTL     J1002700
                    WSDC  EQU     B+/2000   IOAR CORE ADDR FOR STORE    J1002710
                    DUMPC EQU     B+/4000   IOAR CORE ADDR FOR DDUMP    J1002720
                    DUPCO EQU     /7DB0     ADDR OF RESIDENT DUPCO      J1002730
                    CATCO EQU     /7F20-2   ADDR OF DCOM IOAR HEADER    J1002740
                    *                                                 * J1002750
                    *  DUPCO ENTRY POINTS...USED WITH INDIRECT BSI    * J1002760
                    *                                                 * J1002770
                          ORG     DUPCO                                 J1002780
                    BINEB BSS     1         CONVERSION BINARY TO EBCDIC J1002790
                    WRTDC BSS     1         WRITE DCOM(S) SUBROUTINE    J1002800
                    ENTER BSS     1         SAVE XR-S AND CONDITIONS    J1002810
                    GET   BSS     1         READ FROM DISK USING DISKZ  J1002820
                    LEAVE BSS     1         HANDLES ALL EXITS FROM DUP  J1002830
                    LINE  BSS     1         SPACES PRINTER 1 LINE       J1002840
                    MASK  BSS     1         INHIBITS KB INT REQUEST     J1002850
                    MDUMP BSS     1         PRINTS SELECTED CORE LOC-S  J1002860
                    PAGE  BSS     1         SKIPS TO NEXT PAGE          J1002870
                    PHID  BSS     1         RECORDS PHASE ID            J1002880
                    PHIDM BSS     1         RECORDS PHASE AND MODIFIER  J1002890
                    PRINT BSS     1         USE SYS PR SUBR TO PRINT    J1002900
                    PUT   BSS     1         WRITES TO DISK USING DISKZ  J1002910
                    REST  BSS     1         RESTORE CATCO,GO TO DCTL    J1002920
                    RTURN BSS     1         RESTORE XR-S AND CONDITIONS J1002930
                    *                                                 * J1002940
                    *  INPUT/OUTPUT PARAMETERS , CORE ADDRESSES       * J1002950
                    *                                                 * J1002960
                    BUF6  EQU     DUPCO-/1F ADDR OF PAGE HEADING BUFFER J1002970
                    PRPNT EQU     BUF6-/141  IOAR ADDR FOR PRINC.PTR    J1002980
                    IOADR EQU     BUF6-/38B  START OF I/O INTERFACE     J1002990
                    GETHO EQU     IOADR+4   ENTRY FOR READING HOLL TYPE J1003000
                    GETBI EQU     IOADR+5   ENTRY FOR READING BINARY    J1003010
                    PACKB EQU     IOADR+6   ENTRY TO PACK BINARY        J1003020
                    PCHBI EQU     IOADR+7   ENTRY TO PUNCH BINARY       J1003030
                    BUF1  EQU     IOADR-/51 ADDR OF NEXT BUFFER         J1003040
                    BUF2  EQU     BUF1-/52  ADDR OF THIS BUFFER         J1003050
                    BUF3  EQU     BUF2-/3E  ADDR OF PACKED EBC BUFFER   J1003060
                    BUF4  EQU     BUF3-/52  ADDR OF CONTROL RCD BUFFER  J1003070
                    BUF5  EQU     IOADR-/284    ADDR OF LET SCTR BFR    J1003080
                    BUF7  EQU     BUF5-/7142   ADDR OF STORE/DUMP BFR   J1003090
                          HDNG    DUP CFACE PROLOGUE 06FEB67 DD         J1003100
                    *                                                 * J1003110
                    *************************************************** J1003120
                    *                                                 * J1003130
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * J1003140
                    *                                                 * J1003150
                    *FUNCTION/OPERATION--THIS PROGRAM SERVES AS AN    * J1003160
                    *  INTERFACE WITH I/O WHEN THE 1442 OR 2501 IS THE* J1003170
                    *  PRINCIPAL I/O DEVICE. IT ENABLES VARIOUS DUP   * J1003180
                    *  FUNCTIONS TO PERFORM ONE OR MORE OF THE        * J1003190
                    *  FOLLOWING OPERATIONS.                          * J1003200
                    *     1.READ A CARD IN IBM CARD CODE AND CONVERT  * J1003210
                    *       THE CONTENTS TO PACKED EBC CHARACTERS.    * J1003220
                    *     3.READ A BINARY CARD (NO CONERSION)         * J1003230
                    *     4.CONVERT DATA FROM CARD BINARY(ONE COLUMN  * J1003240
                    *       PER WORD) TO PACKED BINARY(4 COLS.PER 3   * J1003250
                    *       WORDS)--THE CARD IS CHECK-SUMMED IF REQD. * J1003260
                    *     5.PUNCH A CARD FROM AN 80 WORD BUFFER.      * J1003270
                    *  THERE ARE 4 ENTRY POINTS TO THIS PROGRAM(SEE   * J1003280
                    *  BELOW),ONE EACH FOR THE FUNCTIONS LISTED ABOVE.* J1003290
                    *  UPON ENTRY TO EACH OF THESE FUNCTIONS,ALL ENTRY* J1003300
                    *  CONDITIONS ARE SAVED(REGISTERS AND STATUS)AND  * J1003310
                    *  THE PHASE ID.IS RECORDED BY DOING A BSI TO     * J1003320
                    *  PHIDM IN DUP CONTROL. PRIOR TO EXITING BACK TO * J1003330
                    *  THE CALLING PROGRAM, THE SAVED CONDITIONS ARE  * J1003340
                    *  RESTORED BY DOING A BSI TO RTURN IN DUP CONTROL* J1003350
                    *                                                 * J1003360
                    * ENTRY POINTS.THERE ARE FOUR ENTRY POINTS,       * J1003370
                    *  EACH CORRESPONDING TO ONE OF THE 4 FUNCTIONS   * J1003380
                    *  LISTED UNDER FUNCTION/OPERATION.THE CALLING    * J1003390
                    *  SEQUENCE IS AS FOLLOWS.                        * J1003400
                    *             BSI  I  GETHO                       * J1003410
                    *             BSI  I  GETBI                       * J1003420
                    *             BSI  I  PACKB                       * J1003430
                    *             BSI  I  PCHBI                         J1003440
                    *             -       -                           * J1003450
                    *             -       -                           * J1003460
                    *             -       -                           * J1003470
                    *       GETHO DC      IC000                       * J1003480
                    *       GETBI DC      IC200                       * J1003490
                    *       PACKB DC      IC300                       * J1003500
                    *       PCHBI DC      IC400                       * J1003510
                    *                                                 * J1003520
                    *INPUT                                            * J1003530
                    *  1.GETHO(IC000)-DUP.CONTROL RECORDS             * J1003540
                    *  2.CONV(IC100)-IBM CARD CODE RECORDS            * J1003550
                    *  3.GETBI(IC200)-BINARY CARDS READ BY DCTL,STORE * J1003560
                    *  4.PACKB(IC300)-CARD BINARY FORMAT(1 COL/ WORD) * J1003570
                    *  5.PCHBI(IC400)-                                * J1003580
                    *                                                 * J1003590
                    *OUTPUT                                           * J1003600
                    *  1.GETHO(IC000)-PACKED EBC IN PEBUF             * J1003610
                    *  3.GETBI(IC200)-                                * J1003620
                    *  4.PACKB(IC300)-PACKED BINARY(4 COLS/3 WDS)     * J1003630
                    *  5.PCHBI(IC400)-BINARY CARDS                    * J1003640
                    *                                                 * J1003650
                    *EXTERNAL ROUTINES-THE FOLLOWING EXTERNAL         * J1003660
                    *  SUBROUTINES ARE USED                           * J1003670
                    *    1.PHIDM IN DUP.CONTROL TO SAVE CONDITIONS,AND* J1003680
                    *      RECORD PHASE ID                            * J1003690
                    *    2.2501/1442 SYSTEM I/O ROUTINE TO READ CARDS * J1003700
                    *    3.CDCNV,SYSTEM CONVERSION SUBROUTINE TO      * J1003710
                    *      CONVERT FROM HOLLERITH TO UNPACKED EBC     * J1003720
                    *    4 RTURN,SUBROUTINE IN DUPCO TO RESTORE       * J1003730
                    *      CONDITIONS                                 * J1003740
                    *                                                 * J1003750
                    *EXITS-NORMAL                                     * J1003760
                    *        GETHO- IC008-2                           * J1003770
                    *        GETBI- IC210                             * J1003780
                    *        PACKB- IC340+2                           * J1003790
                    *  A6L THE ABOVE EXITS ARE RETURNS TO DUP CONTROL.* J1003800
                    *  ALL EXITS ARE PERFORMED BY A BSC INDIRECT INST.* J1003810
                    *                                                 * J1003820
                    *EXITS- ERRORS                                    * J1003830
                    *        IN THE PACKB FUNCTION IF AN INCORRECT    * J1003840
                    *        CHECKSUM IS DETECTED,AN ERROR EXIT IS    * J1003850
                    *        PERFORMED TO .LEAVE. SUBROUTINE IN DUPCO * J1003860
                    *        WITH AN ERROR CODE OF 71(DECIMAL)        * J1003870
                    *                                                 * J1003880
                    *TABLES/WORK AREAS                                * J1003890
                    *    1. GETHO(IC000) USES AN 81 WORD INPUT BUFFER * J1003900
                    *       SPECIFIED BY .CRBUF. IN CATCO, AND A      * J1003910
                    *       41 WORD OUTPUT BUFFER .PEBUF.             * J1003920
                    *    3  GETBI(IC200)-USES AN 81 WORD INPUT BUFFER * J1003930
                    *       SPECIFIED BY .THIS.                       * J1003940
                    *    4  PACKB(IC300)USES .NEXT. AS AN INPUT/OUTPUT* J1003950
                    *       BUFFER FOR PACKING BINARY INFORMATION     * J1003960
                    *    5  PCHBI(IC400)USES AN 81 WORD OUTPUT BUFFER * J1003970
                    *       SPECIFIED BY .NEXT. TO PUNCH A CARD.      * J1003980
                    *                                                 * J1003990
                    *ATTRIBUTES-- ABSOLUTE. THIS PROGRAM IS ASSEMBLED * J1004000
                    *AT SYMBOLIC LOCATION .IOADR.,IT IS BROUGHT INTO  * J1004010
                    *CORE BY THE CCAT MODULE OF DUPCO AND IS THEN     * J1004020
                    *RESIDENT FOR THE REMAINDER OF TIME THAT DUP      * J1004030
                    *MAINTAINS CONTROL.                               * J1004040
                    *                                                 * J1004050
                    *NOTES-- THIS PROGRAM HAS NO WAITS                * J1004060
                    *                                                 * J1004070
                    *                                                 * J1004080
                    *************************************************** J1004090
                          HDNG    CFACE--DUP 1442/2501 CARD  INTERFACE  J1004100
                          ORG     IOADR                                 J1004110
                          DC      *-*       SYSTEM LOADER PUTS WD.CNT.  J1004120
                          DC      10        PHASE ID FOR CARD INTERFACE J1004130
                          DC      *-*       ADDR.OF SYSTEM I/O SUBR.  E J1004140
                          DC      *-*       ADDR.OF SYSTEM CONVERSION O J1004150
                    *                                                   J1004160
                    *                                                   J1004170
                    *  THE FOLLOWING 5 WORDS ARE ADDRESSES OF THE I/O * J1004180
                    *  INTERFACE ENTRY POINTS -- GETHO,CONV,GETBI     * J1004190
                    *  PACKB AND PCHBI.                                 J1004200
                    *                                                   J1004210
                          DC      IC000     ENTRY FOR GETHO             J1004220
                          DC      IC200     ENTRY FOR GETBI             J1004230
                          DC      IC300     ENTRY FOR PACKB             J1004240
                          DC      IC400     ENTRY FOR PCHBI             J1004250
                    *************************************************** J1004260
                    *  SUBROUTINE ENTERED VIA.GETHO.,THIS SUBROUTINE  * J1004270
                    *  READS A CARD ,CHECKS TO SEE IF IT CONTAINS     * J1004280
                    *  //,*S,*M OR *D IN THE 1ST 2 COLS. IF SO, THE 2-8 J1004290
                    *  CARD IS CONVERTED FIRST TO UNPACKED EBC (VIA   * J1004300
                    *  .CONV2.) AND FINALLY TO PACKED EBC(VIA.PACKE.)*  J1004310
                    *************************************************** J1004320
                    IC000 DC      *-*       GETHO ENTRY--RD CD.IN HOLL  J1004330
                          BSI  I  PHIDM     TO DUPCO TO SAVE CONDITIONS J1004340
                          DC      /0800     AND REGISTER PHASE 1D       J1004350
                          BSI  I  ENTER     SAVE CONDITIONS             J1004360
                    *                                                   J1004370
                          LDX  I2 CRBUF+C   STORE A ONE IN BIT 15       J1004380
                          LDD     D1        OF FIRST TWO WORDS OF       J1004390
                    IC005 STD   2 1         CARD I/O AREA               J1004400
                    *                                                   J1004410
                          LDX   3 0         SET SWITCH FOR CARD READING J1004420
                          LD    1 CRBUF     ADDR.OF I/O AREA IN ACCUM   J1004430
                          BSI     RPCHN     GO READ A CARD              J1004440
                    *                                                   J1004450
                          LD    1 EBCSW     IF STOREDATAE OP        2E2 J1004460
                          BSC  L  IC007,Z   *BYPASS CHECK.          2E2 J1004470
                    *                                               2E2 J1004480
                    IC006 LD    2 2         LOOP TILL COLS 1 AND 2      J1004490
                          BSC  L  IC006,E   HAVE BEEN READ IN.          J1004500
                    *                                                   J1004510
                          LDD   2 1                                     J1004520
                          SD      SLASH     CHECK FOR // IN COLS 1-2    J1004530
                          BSC     Z                                     J1004540
                          MDX     IC010     NO,CHECK FOR * IN COL 1 2E2 J1004550
                    *                                                   J1004560
                          RTE     16                                    J1004570
                          BSC  L  IC008,Z   NOT // OR *, SET BLKSW  2E2 J1004580
                    *                                                   J1004590
                    IC007 MDX  L  $IBSY,0   FOUND //,*S,*M OR *D SIT2-8 J1004600
                          MDX     *-3       TILL WHOLE CARD READ IN     J1004610
                    *                                                   J1004620
                          BSI     CONV2     GO CONVERT TO EBC           J1004630
                    *                                                   J1004640
                          BSC  I  IC000     RETURN TO DUP CONTROL       J1004650
                    *                       OR TO STOREDATAE        2E2 J1004660
                    *                                                   J1004670
                    IC008 STO   1 BLKSW     SET BLANK CARD SWITCH,NONZR J1004680
                    *                                                   J1004690
                          MDX     IC008-2   RETURN TO DUP CONTROL       J1004700
                    *                                                   J1004710
                    IC010 SD      KONAS     CHECK FOR *S            2-3 J1004720
                          BSC  L  IC008,Z   BR IF NOT * IN COL 1    2-3 J1004730
                          RTE     16        LOOK FOR S IN COL 2     2-3 J1004740
                          BSC  L  IC007,+-  FOUND *S, MUST CONVERT  2-3 J1004750
                    *                                               2-3 J1004760
                          S       KONM      TEST FOR M IN COL 2     2-8 J1004770
                          BSC  L  IC007,+-  BR TO CONVERT IF FOUND  2-8 J1004780
                    *                                               2-8 J1004790
                          S       KOND      LOOK FOR D IN COL 2     2-3 J1004800
                          BSC  L  IC007,+-  FOUND *D, MUST CONVERT  2-3 J1004810
                          MDX     IC008     NOT //,*S,*M, OR *D,    2-8 J1004820
                    *                       *SO SET BLKSW           2-8 J1004830
                    *                                               2-3 J1004840
                    * THE ABOVE CODING HAS BEEN MADE MORE EFFICIENT 2-3 J1004850
                    * TEST FOR M IN COL 2 ADDED TO IMPLEMENT MUP    2-8 J1004860
                    *                                               2-3 J1004870
                    *************************************************** J1004880
                    *                                                   J1004890
                    * CONSTANTS                                         J1004900
                    *                                                   J1004910
                    *************************************************** J1004920
                    D80   DC      80        CONS FOR WD CNT             J1004925
                          BSS  E  0                                     J1004930
                    KONAS DC      /121F     DOUBLE CON FOR DETECT-    E J1004940
                          DC      /F800     *ING *S IN COLS 1 AND 2   O J1004950
                    CLCNT DC      0       WD.USED TO STORE COL.COUNT  E J1004960
                    SLASH DC      /3000   SLASH CHAR.IN HOLLERITH CDE.O J1004970
                    KONM  DC      /1A00     CON FOR DETECTING M     2-8 J1005000
                    KOND  DC      /4000     CON FOR DETECTING D     2-8 J1005010
                    H7000 DC      /7000   CODE FOR SYS.I/O SUBR-RD.CD.  J1005020
                    H7003 DC      /7003     CODE FOR SYS 1442 SUBR-FEED J1005030
                    *                                                   J1005050
                    *************************************************** J1005060
                    * CONV2--THIS CLOSED SUBROUTINE LINKS TO THE SYSTEM J1005070
                    *I/O CONVERSION ROUTINE. THE UNPACKED RESULT IN EBC J1005080
                    * IS THEN PACKED TWO CHARACTERS PER WORD            J1005090
                    *************************************************** J1005100
                    CONV2 DC      *-*                                   J1005110
                          LD    1 CRBUF     ADDR OF I/O BUF.IN ACCUM.   J1005120
                          STO     PA010+1   INITIALIZE INSTRUCTION      J1005130
                    *                                                   J1005140
                    *GO TO SYS.I/O RTN TO CONVERT TO UNPACKED EBCDIC    J1005150
                    *                                                   J1005160
                          BSI  I  GETHO-1                               J1005170
                    *************************************************** J1005180
                    *************************************************** J1005190
                    *SUBROUTINE TO PACK THE EBC CHARACTERS FROM AN 81 * J1005200
                    * WORD BUFFER TO A 41 BUFFER.                     * J1005210
                    *************************************************** J1005220
                    PACKE LDX   2 /28       SET WORD-COUNT OF 40 IN 1ST J1005230
                          STX  I2 PEBUF+C   WORD OF PACKED BUFFER.      J1005240
                          LDX   2 81        XR2= UNPACKED WORD-COUNT+1  J1005250
                          LDX   3 40        XR3= PACKED BUFFER WD.COUNT J1005260
                          LD    1 PEBUF     INIT.INSTRUCTION TO         J1005270
                          STO     PA020+1   STORE PACKED BUFFER         J1005280
                    *                                                   J1005290
                    PA005 MDX   2 -2        NEXT UNPACKED WORDS         J1005300
                    PA010 LDD  L2 *-*       PICK UP TWO UNPACKED WORDS  J1005310
                          RTE     16        AND FORM                    J1005320
                          SLA     8         TWO PACKED CHARACTERS       J1005330
                          RTE     8         IN ACCUMULATOR              J1005340
                    PA020 STO  L3 *-*       STORE 2 PACKED CHARS        J1005350
                    *                                                   J1005360
                          MDX   3 -1        NEXT ADDR IN PACKED BUFFER  J1005370
                          MDX     PA005     LOOP                        J1005380
                    *                                                   J1005390
                          BSI  I  RTURN     TO DUPCO,RESTORE CONDITIONS J1005400
                    *                                                   J1005410
                          BSC  I  CONV2     EXIT                        J1005420
                          BSS  E  0         ASSURE EVEN BOUNDARY    212 J1005422
                    D1    DC      1         CONSTANT OF 1               J1005424
                    D3    DC      3         CONSTANT OF 3               J1005426
                    *************************************************** J1005430
                    * RPCHN--THIS CLOSED SUBROUTINE PERFORMS THE      * J1005440
                    * PRELIMINARY INSTRUCTIONS NECESSARY TO READ OR   * J1005450
                    * PUNCH A RECORD,IT THEN GOES TO THE SYSTEM I/O   * J1005460
                    *SUBROUTINE WITH THE APPROPRIATE CALLING SEQUENCE * J1005470
                    *************************************************** J1005480
                    *                                                   J1005490
                    RPCHN DC      *-*                                   J1005500
                          STO     RP010+1   I/O BUFFER ADDR. STORED IN  J1005510
                          RTE     16        RP010 INSTR.AND IN Q REG.   J1005520
                    *                                                   J1005530
                          LD      GETHO-2   **********************      J1005540
                          A       D3        *SET UP INTERRUPT    *      J1005550
                          STO   1 IBT+5     *LEVEL ADDRESSES IN  *      J1005560
                          STO   1 IBT+6     *ILS04 AND IN LOC    *      J1005570
                          A       D3        *0008                *      J1005580
                          STO  L  8         **********************      J1005590
                          SRA     16        INITIALIZE BLANK            J1005600
                          STO   1 BLKSW     CARD SWITCH TO ZERO         J1005610
                    *                                                   J1005620
                          LD      D80       WORD COUNT IN 1ST WORD      J1005630
                    RP010 STO  L  *-*       OF I/O AREA                 J1005640
                    *                                                   J1005650
                          MDX  L  $IBSY,0   SKIP IF NOT BUSY            J1005660
                          MDX     *-3       LOOP TILL NOT BUSY          J1005670
                          MDX   3 0         SKIP IF READING             J1005690
                          MDX     RP015                                 J1005700
                    *                                                 * J1005710
                          LD   L  $LAST                                 J1005720
                          BNP     RP015     BRANCH IF NOT 1442      212 J1005730
                    *                                                 * J1005740
                          LD      H7003                                 J1005750
                          BSI  I  GETHO-2   FEED TO EJECT LAST CARD     J1005760
                    *                                                 * J1005770
                    RP015 LD      RP010+1                               J1005780
                          RTE     16        BFR ADDR TO ACC EXTENSION   J1005790
                          LD      H7000     CODE TO READ A CARD         J1005800
                          MDX   3 0         IS CARD PUNCHING REQUIRED   J1005810
                          A       D1        YES,MAKE ACCUM 7001,PCH.CD  J1005820
                          BSI  I  GETHO-2   NO,7000 OK,GOTO SYS I/O RTN J1005830
                    *                                                   J1005840
                          BSC  I  RPCHN     RETURN                      J1005850
                    ************************************************2E2 J1005860
                    *                                               2E2 J1005870
                          BSS     0         CDFACE PATCH AREA       2-8 J1005880
                    *                                               2E2 J1005890
                    *                                               2E2 J1005900
                    *************************************************** J1005910
                    *  SUBROUTINE ENTERED VIA .GETBI., THIS SUBR.     * J1005920
                    *  READS A CARD INTO A BUFFER SPECIFIED BY.THIS.  * J1005930
                    *************************************************** J1005940
                    IC200 DC      *-*       GETBI ENTRY--GET BINARY REC J1005950
                          BSI  I  PHIDM     TO DUPCO TO SAVE CONDITIONS J1005960
                          DC      /0800     AND RECORD PHASE ID.        J1005970
                          BSI  I  ENTER     SAVE CONDITIONS             J1005980
                    *                                                   J1005990
                          LDX  I2 THIS+C     * SET BIT 15 IN WORD 4 OF* J1006000
                          LD      D1         * OF CARD BUFFER BEFORE  * J1006010
                          STO   2 4          * GOING OUT TO RD A CD   * J1006020
                    *                                                   J1006030
                          LD    1 THIS      ADDR. OF CARD INPUT BUFR    J1006040
                          LDX   3 0         SET SWITCH FOR CARD READING J1006050
                          BSI     RPCHN     GO READ A CARD INTO THIS    J1006060
                    *                                                   J1006070
                    IC210 LD    2 4          *LOOP TILL COL.4 OF  *     J1006080
                          BSC  L  IC210,E    *CARD HAS BEEN READ  *     J1006090
                    *                                                   J1006100
                          BSI  I  RTURN     TO DUPCO,RESTORE CONDITIONS J1006110
                    *                                                   J1006120
                          BSC  I  IC200     RETURN TO DUP CONTROL       J1006130
                    *                                                   J1006140
                    *************************************************** J1006150
                    * IC300,THE SUBROUTINE TO PACK BINARY CARDS,FROM  * J1006160
                    * 1 COL/WD TO 4 COLS/3 WORDS.INPUT IS FOUND IN    * J1006170
                    *(NEXT) AND PACKED INTO THE SAME BUFFER.          * J1006180
                    *************************************************** J1006190
                    *                                                   J1006200
                    IC300 DC      *-*       PACKB ENTRY,PACK BIN.SUBR.  J1006210
                          BSI  I  PHIDM     TO DUPCO TO SAVE CONDITIONS J1006220
                          DC      /0800     AND RECORD PHASE ID         J1006230
                          BSI  I  ENTER     SAVE CONDITIONS             J1006240
                    *                                                   J1006250
                          LDX   2 72                                    J1006260
                          STX   2 CLCNT     COLUMN COUNT = 72           J1006270
                          LDX  I2 NEXT+C    *XR2=ADDR OF 1ST INPUT WD.  J1006280
                          LDX  I3 NEXT+C    *XR3=ADDR.OF 1ST OUTPUT WD. J1006290
                    *                       ACC AND EXT                 J1006300
                    IC310 LDD   2 1         ABC0DEF0   LD.COLS 1 AND 2  J1006310
                          SRA     4         0ABCDEFO                    J1006320
                          SLT     4         ABCDEFOO   1ST WORD IN A    J1006330
                          STO   3 1         ABCD       STORE 1ST WD.    J1006340
                    *                                                   J1006350
                          SRT     8         ..ABCDEF                    J1006360
                          LD    2 3         GHI0CDEF   LD.COL.3         J1006370
                          RTE     8         EFGHIOCD   2ND.WORD IN A    J1006380
                          STO   3 2         EFGH       STORE 2ND WD.    J1006390
                    *                                                   J1006400
                          SRT     12        ...EFGHI                    J1006410
                          LD    2 4         JKL0FGHI   LD.COL.4         J1006420
                          RTE     4         IJKLOFGH   3RD.WORD IN A    J1006430
                          STO   3 3         IJKL       STORE 3RD.WD.    J1006440
                    *                                                   J1006450
                          MDX   2 4         INCREMENT INPUT COUNTER     J1006460
                          MDX   3 3         INCREMENT OUTPUT COUNTER    J1006470
                          MDX  L  CLCNT,-4  DECR.COL.CNT,ARE WE DONE    J1006480
                          MDX     IC310     NO,PACK NEXT 4 COLS.        J1006490
                    *                                                   J1006500
                    *DONE PACKING,NOW DO CHECKSUM                       J1006510
                    *                                                   J1006520
                          LD    1 DATSW     DO NOT CHECKSUM IF THIS IS  J1006530
                          BSC  L  IC340,Z   DATA, DATSW NONZERO         J1006540
                    *                                                   J1006550
                          LD    3 -52       ALSO IF CHECKSUM IS ZERO    J1006560
                          BSC  L  IC340,+-                              J1006570
                    *                                                   J1006580
                          MDX  L  CNTNO+C,1 STEP CARD COUNT NO.         J1006590
                          LDX   2 54                                    J1006600
                          LD    1 CNTNO     SEQUENCE NO.                J1006610
                    IC320 A     3 -53       ADD WORD FROM PACKED BUFR   J1006620
                          BSC  L  IC325,C   BR IF CARRY ON              J1006630
                          MDX     IC330     DO NOT ADD 1 IF CARRY OFF   J1006640
                    IC325 A       D1        ADD 1 WHEN CARRY IS ON      J1006650
                    IC330 MDX   3 1         NEXT WORD TO ADD            J1006660
                          MDX   2 -1        HAVE WE DONE 54 WORDS       J1006670
                          MDX     IC320     NO,DO NEXT                  J1006680
                          S       D1        IS CKSUM OK?                J1006690
                          BSC  L  IC340,+-  YES, RETURN TO DUPCO        J1006700
                          BSI  I  LEAVE     NO, GO TO SUBROUTINE IN     J1006710
                          DC      90        *DUPCO WITH ERROR CODE      J1006720
                    *                                                   J1006730
                    IC340 BSI  I  RTURN     RESTORE CONDITIONS          J1006740
                    *                                                   J1006750
                          BSC  I  IC300     EXIT                        J1006760
                    *                                                   J1006770
                    *************************************************** J1006780
                    * ENTRY TO PUNCH BINARY RECORDS                   * J1006790
                    *************************************************** J1006800
                    *                                                   J1006810
                    IC400 DC      *-*                                   J1006820
                          BSI  I  PHIDM     TO DUPCO TO SAVE CONDITIONS J1006830
                    IC410 DC      /0800     AND RECORD PHASE ID.        J1006840
                          BSI  I  ENTER     SAVE CONDITIONS             J1006850
                    *                                                   J1006860
                          LDX  I2 NEXT+C     * PUT A PUNCH STOP   *     J1006870
                          LDX   3 1         SET SWITCH TO PUNCH CARDS   J1006880
                          LD    1 NEXT  ADDRI/O AREA ADDR IN ACC        J1006890
                          BSI  L  RPCHN     GO PUNCH A CARD             J1006900
                    *                                                   J1006910
                          BSI  I  RTURN     RESTORE REGISTERS           J1006920
                    *                                                   J1006930
                          BSC  I  IC400      EXIT                       J1006940
                    *************************************************** J1006950
                          END     IC000                                 J1006960
