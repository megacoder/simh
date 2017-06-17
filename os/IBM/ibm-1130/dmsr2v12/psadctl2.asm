                          HDNG    DCTL2  -  DUP CONTROL 2 - 15 JAN 70   PS000010
                          ABS                                           PS000020
                    $CIBA EQU     /5   ADDR OF CIB ON MASTER CARTRIDGE  PS000030
                    $CH12 EQU     /6   CHANNEL 12 INDR,NON-ZERO=CHAN 12 PS000040
                    $COMN EQU     /7   WORD COUNT OF COMMON             PS000050
                    $CORE EQU     /E   CORE SIZE,/1000=4K,/2000=8K,ETC) PS000060
                    $CTSW EQU     /F   MCR SW,NON-ZERO=// RECD TRAPPED  PS000070
                    $DADR EQU     /10  SCTR ADDR OF PROG TO BE FETCHED  PS000080
                    $DABL EQU     /11  IOCC FOR SCA RESET (ODD ADDR)    PS000090
                    $DREQ EQU     /12  INDR FOR REQUESTED V. DISK I/O   PS000100
                    $IBSY EQU     /13  PRINC I/O BUSY INDR,NON-ZERO=BSY PS000110
                    $HASH EQU     /14  WORK AREA FOR MONITOR PROGRAMS   PS000120
                    $PRET EQU     /28  ADDR PREOPERATIVE ERROR TRAP     PS000130
                    $IREQ EQU     /2C  ADDR OF INT REQUEST SUBROUTINE   PS000140
                    $ULET EQU     /2D  ADDR OF LET, LOGICAL DRIVE 0     PS000150
                    $IOCT EQU     /32  IOCS CTR,0=NO I/O IN PROGRESS    PS000160
                    $LAST EQU     /33  LAST CD INDR,NON-ZERO=LAST CARD  PS000170
                    $NDUP EQU     /34  INHIBIT DUP SW,NON-ZERO=NO DUP   PS000180
                    $NXEQ EQU     /35  INHIBIT EXEC SW,NON-ZERO=NO EXEQ PS000190
                    $PBSY EQU     /36  PRINC PTR BUSY INDR,NON-ZERO=BSY PS000200
                    $PGCT EQU     /37  PAGE NO. FOR PAGE HEADINGS       PS000210
                    $EXIT EQU     /38  ADDR CALL EXIT ENTRY POINT       PS000220
                    $LINK EQU     /39  ADDR CALL LINK ENTRY POINT       PS000230
                    $DUMP EQU     /3F  ADDR OF CALL DUMP, ENTRY POINT   PS000240
                    $DCDE EQU     /77  DRIVE CODE FOR CORE LOAD BLDR    PS000250
                    $PHSE EQU     /78  NO. OF PHASE CURRENTLY IN CORE   PS000260
                    $UFIO EQU     /79  ARM POSITION IN UNFORMATTED AREA PS000270
                    $WSDR EQU     /7A  WORKING STORAGE DRIVE CODE       PS000280
                    $WRD1 EQU     /7B  LOAD ADDR FOR CURR USER CORE LD  PS000290
                    $KCSW EQU     /7C  INHIBIT INPUT/PRINT OVERLAP SW   PS000300
                    $UFDR EQU     /7D  UNFORMATTED I/O DRIVE CODE       PS000310
                    $CPTR EQU     /7E  CHANNEL 12 INDICATOR FOR CP      PS000320
                    $1132 EQU     /7F  CHANNEL 12 INDICATOR FOR 1132    PS000330
                    $1403 EQU     /80  CHANNEL 12 INDICATOR FOR 1403    PS000340
                    $PST1 EQU     /81  ADDR POSTOP ERROR TRAP,LEVEL 1   PS000350
                    $PST2 EQU     /85  ADDR POSTOP ERROR TRAP,LEVEL 2   PS000360
                    $PST3 EQU     /89  ADDR POSTOP ERROR TRAP,LEVEL 3   PS000370
                    $PST4 EQU     /8D  ADDR POSTOP ERROR TRAP,LEVEL 4   PS000380
                    $STOP EQU     /91  ADDR PROGRAM STOP KEY TRAP       PS000390
                    $FPAD EQU     /95  FILE PROTECT ADDR (ADJ),LOG DR 0 PS000400
                    $CYLN EQU     /9A  ARM POSITION FOR LOGICAL DRIVE 0 PS000410
                    $ACDE EQU     /9F  AREA CODE FOR LOGICAL DRIVE 0    PS000420
                    $DCYL EQU     /A4  1ST DEF CYL ADDR, LOGICAL DR 0   PS000430
                    $I200 EQU     /B3  ENTRY POINT TO ILS FOR LEVEL 2   PS000440
                    $I205 EQU     /B8                                   PS000450
                    $IBT2 EQU     $I205+1 ADDR OF IBT FOR LEVEL 2       PS000460
                    $I400 EQU     /C4  ENTRY POINT TO ILS FOR LEVEL 4   PS000470
                    $I405 EQU     /D3                                   PS000480
                    $IBT4 EQU     $I405+1 ADDR OF IBT FOR LEVEL 4       PS000490
                    $I410 EQU     /D5                                   PS000500
                    $DBSY EQU     /EE  DISK BUSY INDR,NON-ZERO=DK BUSY  PS000510
                    $BYSW EQU     /1CB BYPASS SW,NOP IF FETCHING SOCAL  PS000520
                    DZ000 EQU     /0F2 DISKZ ENTRY POINT                PS000530
                    $ZEND EQU     /1E0 ADDR 1+LAST WORD OF DISKZ        PS000540
                          HDNG          CONCATENATED COMMON AREA(CATCO) PS000550
                    C     EQU     /7FA0     CATCO POINTER SET TO MIDDLE PS000560
                    *************************************************** PS000570
                    *                                                 * PS000580
                    *  INDEX REG 1 IS SET TO .C. WHEN CATCO IS FORMED * PS000590
                    *  FOR USE BY ALL OF DUP FUNCTIONS. ANY DUP ROUT  * PS000600
                    *  USING XR 1 FOR OTHER REASONS MUST RESTORE.     * PS000610
                    *  ALL VALUES IN CATCO HAVE LABELS EQUATED TO THE * PS000620
                    *  VALUE THAT INDICATES THEIR RELATIVE LOCATION   * PS000630
                    *  FROM .C.                                       * PS000640
                    *                                                 * PS000650
                    *************************************************** PS000660
                    *                                                 * PS000670
                    *             CATCO DCOM IMAGE                    * PS000680
                    *   EQUIVALENCES USED TO REFERENCE CATCO WITH XR1 * PS000690
                    *                                                 * PS000700
                    *************************************************** PS000710
                    #NAME EQU     4-/80     NAME OF PROGRAM             PS000720
                    #DBCT EQU     6-/80     DISK BLOCK COUNT OF PROGRAM PS000730
                    #FCNT EQU     7-/80     FILES SW,ZERO = NO FILES    PS000740
                    #SYSC EQU     8-/80     NON-ZERO,SYSTEM CARTRIDGE   PS000750
                    #JBSW EQU     9-/80     JOB SW,NON-ZERO='T' MODE    PS000760
                    #CBSW EQU     10-/80    CLB SW,NON-ZERO=STORECI     PS000770
                    #LCNT EQU     11-/80    NO. OF LOCALS               PS000780
                    #MPSW EQU     12-/80    NON-ZERO, CORE MAP DESIRED  PS000790
                    #MDF1 EQU     13-/80    NO. OF DUP CTRL RCDS        PS000800
                    #MDF2 EQU     14-/80    ADDR OF MODIF BUFFER        PS000810
                    #NCNT EQU     15-/80    NO. OF NOCALS               PS000820
                    #ENTY EQU     16-/80    RELATIVE ENTRY ADDR OF PROG PS000830
                    #RP67 EQU     17-/80    IF NON-ZERO,1442 MOD 6,7    PS000840
                    *                                                   PS000850
                    *   NEGATIVE VALUE REPRESENTS DEFAULT CONDITION   * PS000860
                    #TODR EQU     18-/80    DR CODE OF 'TO' DRIVE       PS000870
                    #FRDR EQU     19-/80    DR CODE OF 'FROM' DRIVE     PS000880
                    *                                                 * PS000890
                    #FHOL EQU     20-/80    ADDR OF LARGEST FXA HOLE    PS000900
                    #FSZE EQU     21-/80    BLK CNT LARGEST HOLE IN FXA PS000910
                    #UHOL EQU     22-/80    ADDR OF LARGEST UA HOLE     PS000920
                    #USZE EQU     23-/80    BLK CNT LARGEST HOLE IN UA  PS000930
                    #DCSW EQU     24-/80    NON-ZERO=DUP CALL           PS000940
                    #PIOD EQU     25-/80    PRINC. I/O  INDICATOR       PS000950
                    #PPTR EQU     26-/80    PRINC. PRINTER INDICATOR    PS000960
                    #CIAD EQU     27-/80    WD NO. SCTR 0,CIL ADDR      PS000970
                    #ACIN EQU     28-/80    AVAILABLE CARTRIDGE INDR    PS000980
                    #GRPH EQU     29-/80    2250 INDICATOR              PS000990
                    #GCNT EQU     30-/80    G2250 INDICATOR         2-4 PS001000
                    #LOSW EQU     31-/80    LOCAL-CALL-LOCAL SWITCH 2-3 PS001010
                    #X3SW EQU     32-/80    SPECIAL-ILS SWITCH      2-3 PS001020
                    #ECNT EQU     33-/80    NO. OF EQUAT RECORDS        PS001030
                    #ANDU EQU     35-/80    END OF UA (ADJ) LOG DR 0-4  PS001040
                    #BNDU EQU     40-/80    END OF UA (BASE) LOG DR 0-4 PS001050
                    #FPAD EQU     45-/80    FILE PROTECT ADDR (BASE)    PS001060
                    #PCID EQU     50-/80    CART ID, PHYS DR 0-4        PS001070
                    #CIDN EQU     55-/80    CART ID, LOG DR 0-4         PS001080
                    #CIBA EQU     60-/80    CIB ADDR, LOG DR 0-4        PS001090
                    #SCRA EQU     65-/80    SCRA, LOG DR 0-4            PS001100
                    #FMAT EQU     70-/80    WS FORMAT, LOG DR 0-4       PS001110
                    #FLET EQU     75-/80    FLET ADDR, LOG DR 0-4       PS001120
                    #ULET EQU     80-/80    LET ADDR, LOG DR 0-4        PS001130
                    #WSCT EQU     85-/80    WS BLK CNT, LOG DR 0-4      PS001140
                    #CSHN EQU     90-/80    CUSHION END SCTR ADDR, 0-4  PS001150
                    #DCOM EQU     1         SCTR ADDR OF DCOM           PS001160
                    #HDNG EQU     7         SCTR WITH PAGE HEADING      PS001170
                    @SBFR EQU     /FB0                                  PS001180
                          HDNG    CONCATENATED COMMON AREA (CATCO)      PS001190
                    *************************************************** PS001200
                    *                                                 * PS001210
                    *             CATCO IOAR HDRS FOR DUP PHASES        PS001220
                    *                                                 * PS001230
                    *************************************************** PS001240
                          ORG     -/10                                  PS001250
                    DCHDR BSS     2         DUP CONTROL            PH02 PS001260
                    STHDR BSS     2         STORE                  PH03 PS001270
                    FLHDR BSS     2         FILEQ                  PH04 PS001280
                    DMHDR BSS     2         DUMP                   PH05 PS001290
                    DLHDR BSS     2         DUMPLET                PH06 PS001300
                    DTHDR BSS     2         DELETE                 PH07 PS001310
                    DFHDR BSS     2         DEFINE                 PH08 PS001320
                    DXHDR BSS     2         DUP EXIT               PH09 PS001330
                    UCHDR BSS     2         DUP UPCOR              PH13 PS001340
                    PIHDR BSS     2         PRINCIPAL I/O BLOCK    PH14 PS001350
                    SIHDR BSS     2         PRINC I/O (W/O KB) BLK PH15 PS001360
                    PTHDR BSS     2         PAPER TAPE I/O BLOCK   PH16 PS001370
                    CIHDR BSS     2         CI PHASE READ BY CL BUILDER PS001380
                    MUHDR BSS     2         MACRO UPDATE      PH206     PS001390
                    D2HDR BSS     2         DUP CONTROL 2     PH205     PS001400
                          HDNG    DCTL2 -    CATCO DUP SWITCHES         PS001410
                    *************************************************** PS001420
                    *                                                   PS001430
                    *             CATCO DUP SWITCHES                  * PS001440
                    *      WORDS USED FOR COMMUNICATION OF DATA         PS001450
                    *   BETWEEN DUP ROUTINES.                           PS001460
                    *                                                 * PS001470
                    *      INITIALIZED TO ZERO BY  .REST. OF DUPCO    * PS001480
                    *                                                   PS001490
                    *************************************************** PS001500
                    CL1   EQU     *                                     PS001510
                    ASMSW BSS     1         NON ZERO IF DEFINE VOID ASM PS001520
                    BITSW BSS     1         NON ZERO TO ALLOW MDUMP-S   PS001530
                    BLKSW BSS     1         NON ZERO IF BYPASSING REC   PS001540
                    CIERR BSS     1         ERROR NO DETECTED BY PH 17  PS001550
                    CISW  BSS     1         NON ZERO IF STORE CI        PS001560
                    CLBSW BSS     1         NON ZERO IF PRECI EXECUTED  PS001570
                    CNTNO BSS     1         RECORD NO BEING PCHD OR RD  PS001580
                    *                                                 * PS001590
                    *   .DATSW. IS FILLED WITH THE CNT FIELD OF THE   * PS001600
                    *   DUP CONTROL RECORD.                           * PS001610
                    *   USED PRIMARILY FOR DATA MOVEMENT, BUT ALSO IS * PS001620
                    *   USED FOR COUNT OF RECORDS TO READ AFTER A     * PS001630
                    *   STORE CI DUP CONTROL RECORD.                  * PS001640
                    DATSW BSS     1         RECORDS VALUE IN CNT FIELD  PS001650
                    DBADR BSS     1         DB ADDR OF REFERENCED PROG  PS001660
                    DELSW BSS     1         ADDR OF REQ LET ENTRY - 1   PS001670
                    DFNSW BSS     1         NON ZERO IF DEFINE FXA      PS001680
                    DKSAD BSS     1         DK SCTR ADDR W/O DR CODE    PS001690
                    DUMPP BSS  E  2         LAST LIMITS FOR PRNTR DUMP  PS001700
                    FORSW BSS     1         NON ZERO IF DEFINE VOID FOR PS001710
                    FRWS  BSS     1         NON ZERO IF FROM FLD IS WS  PS001720
                    FXSW  BSS     1         NON ZERO IF FIXED AREA REQD PS001730
                    HOLSW BSS     1         NON ZERO IF NO CONV REQD    PS001740
                    IOSW  BSS     1         NON ZERO IF IN/OUT REQD     PS001750
                    *                                                 * PS001760
                    *   DUMPLET SWITCH - ZERO IF NOT DUMPLET/DUMPFLET * PS001770
                    *       PLUS VALUE REQUIRES PRINT OF BOTH LET/FLET* PS001780
                    *       NEG. VALUE REQUIRES PRINT OF FLET ONLY    * PS001790
                    LETSW BSS     1         NON ZERO,PRINT LET OR FLET* PS001800
                    LSTLF BSS     1         LAST LET/FLET SECT PROCESSD PS001810
                    MODSW BSS     1         NON ZERO IF STORE MOD FUNC  PS001820
                    NAMSW BSS     1         NON ZERO IF NAME IN LET/F   PS001830
                    NEGSW BSS     1         NON ZERO IF SHRINKING FXA   PS001840
                    PGMHL BSS     1         WORD COUNT OF THE PROG HDR  PS001850
                    PRSW  BSS     1         NON ZERO IF PRINTING OUTPUT PS001860
                    PTSW  BSS     1         NON ZERO IF PAPER TAPE REQD PS001870
                    SKWDS BSS     1         WDS TO SEARCH IN L/F SECT   PS001880
                    STCSW BSS     1         NON ZERO IF STORE DATA CI   PS001890
                    STSW  BSS     1         NON ZERO IF STORE TYPE      PS001900
                    TEMP1 BSS  E  1         1ST WD OF BINEB OUTPUT      PS001910
                    TEMP2 BSS     1         2ND WD OF BINEB OUTPUT      PS001920
                    TOWS  BSS     1         NON ZERO IF TO FIELD IS WS  PS001930
                    T3MSW BSS     1         TYPE 3,4 SOCAL LEVEL CELL   PS001940
                    UASW  BSS     1         NON ZERO IF USER AREA REQD  PS001950
                    WSSW  BSS     1         NON ZERO IF WORK STG REQD   PS001960
                    XEQSW BSS     1         NON ZERO IF NOT RET FR GET  PS001970
                    EBCSW BSS     1         NON ZERO IF EBC DATA OP 2E2 PS001980
                    HDNSW BSS     1         NON ZERO IF NAME IN HDR 2-3 PS001990
                    RPGSW BSS     1         POSITIVE=DEFINE VOID RPG2-9 PS002000
                    *                       *NEG=DEFINE VOID COBOL  2-9 PS002005
                    DFLSW BSS     1         NON ZERO IF *DFILE      2-8 PS002010
                          BSS     1         RESERVED FOR ADDITION   2-8 PS002020
                    CL2   EQU     *-1                                   PS002030
                          HDNG    DCTL2 -   CATCO DUP SWITCHES          PS002040
                    *************************************************** PS002050
                    *                                                 * PS002060
                    *             CATCO DUP SWITCHES                  * PS002070
                    *  INITIALIZED BY DCTL AND NOT RESET BY .REST.    * PS002080
                    *                                                 * PS002090
                    *************************************************** PS002100
                    IOREQ BSS     1         NON-ZERO,AUX I/O SET REQ    PS002110
                    PH2   BSS     1         NON-ZERO IF DCTL IN CORE    PS002120
                    PH3   BSS     1         NON-ZERO IF STORE IN CORE   PS002130
                    PH4   BSS     1         NON-ZERO IF DUMP IN CORE    PS002140
                    ************************************************2-8 PS002150
                    *                                               2-8 PS002160
                    *             CATCO SWITCH INITIALIZED TO ZERO  2-8 PS002170
                    *   BY CCAT SUBR AND SET BY MACRO UPDATE PROGRAM2-8 PS002180
                    *                                               2-8 PS002190
                    ************************************************2-8 PS002200
                    DUPCR BSS     1         NON ZERO IF DUP CTRL RCD2-8 PS002210
                    *************************************************** PS002220
                    *                                                 * PS002230
                    *             CATCO DUP SWITCHES SET BY CCAT SUBR * PS002240
                    *                                                 * PS002250
                    *************************************************** PS002260
                    ADDR2 BSS     1         KB INTERRUPT ADDRESS        PS002270
                    KBREQ BSS     1         CONTENTS OF LOC 13          PS002280
                    *      THE FOLLOWING SWITCH IS SET TO INDICATE THE  PS002290
                    *       PRINCIPAL INPUT DEVICE                      PS002300
                    *             -  IS PAPER TAPE                      PS002310
                    *             0  IS CARD                            PS002320
                    *             +  IS KEYBOARD                        PS002330
                    INOUT BSS     1         PRINCIPAL INPUT SWITCH      PS002340
                    *                                                   PS002350
                    PTPON BSS     1         NON-ZERO IF PAPER TP ON SYS PS002360
                    *************************************************** PS002370
                    *                                                 * PS002380
                    *             LEVEL 4 INTERRUPT BRANCH TABLE      * PS002390
                    *             ADDRESSES. INITIALIZED BY CCAT,     * PS002400
                    *             AND CARD/PAPER TAPE INTERFACES.     * PS002410
                    *                                                 * PS002420
                    *************************************************** PS002430
                          ORG     /0049                                 PS002440
                    IBT   BSS     9         9 WD INTRPT BRANCH TABLE    PS002450
                    *************************************************** PS002460
                    *                                                 * PS002470
                    *             CATCO I/O ADDRESSES REQUIRED BY DUP * PS002480
                    *                                                 * PS002490
                    *************************************************** PS002500
                    P1442 BSS  E  2         SYS 1442 IOAR HEADER        PS002510
                    PRPAR BSS     2         DEFAULT LIMITS TO PRINT     PS002520
                    PHDUP BSS     1         LAST DUP PHASE IN CORE      PS002530
                    CRBUF BSS     1         81 WD BFR FOR DUP CTRL RCDS PS002540
                    DCADR BSS     1         ADDR FOR DUP CTRL IOAR HDR  PS002550
                    HDBUF BSS     1         ADDR OF PAGE HEADING BFR    PS002560
                    IOBLK BSS     1         ADDR OF DUP I/O PHASE       PS002570
                    SDBUF BSS     1         STORE/DUMP BUFFER           PS002580
                    LETAR BSS     1         ADDR OF LET SEARCH BUFFER   PS002590
                    PEBUF BSS     1         41 WD BFR FOR PACKED EBCDIC PS002600
                    THIS  BSS     1         ADDR OF DOUBLE BFR, BFR 1   PS002610
                    NEXT  BSS     1         ADDR OF DOUBLE BFR, BFR 2   PS002620
                          HDNG              DUP CORE PARAMETERS         PS002630
                    DISKZ EQU     DZ000     DISKZ ENTRY POINT           PS002640
                    B     EQU     $ZEND-2                               PS002650
                    DMPLC EQU     B         IOAR CORE ADDR FOR DMPLT    PS002660
                    EXITC EQU     B         IOAR CORE ADDR FOR DEXIT    PS002670
                    MUPC  EQU     B         IOAR CORE ADDR FOR MUP  2-8 PS002680
                    DCTL  EQU     B+/1002   ENTRY ADDRESS OF DCTL       PS002690
                    DCTLC EQU     B+/1000   IOAR CORE ADDR FOR DCTL     PS002700
                    WSDC  EQU     B+/2000   IOAR CORE ADDR FOR STORE    PS002710
                    DUMPC EQU     B+/4000   IOAR CORE ADDR FOR DDUMP    PS002720
                    DUPCO EQU     /7DB0     ADDR OF RESIDENT DUPCO      PS002730
                    CATCO EQU     /7F20-2   ADDR OF DCOM IOAR HEADER    PS002740
                    *                                                 * PS002750
                    *  DUPCO ENTRY POINTS...USED WITH INDIRECT BSI    * PS002760
                    *                                                 * PS002770
                          ORG     DUPCO                                 PS002780
                    BINEB BSS     1         CONVERSION BINARY TO EBCDIC PS002790
                    WRTDC BSS     1         WRITE DCOM(S) SUBROUTINE    PS002800
                    ENTER BSS     1         SAVE XR-S AND CONDITIONS    PS002810
                    GET   BSS     1         READ FROM DISK USING DISKZ  PS002820
                    LEAVE BSS     1         HANDLES ALL EXITS FROM DUP  PS002830
                    LINE  BSS     1         SPACES PRINTER 1 LINE       PS002840
                    MASK  BSS     1         INHIBITS KB INT REQUEST     PS002850
                    MDUMP BSS     1         PRINTS SELECTED CORE LOC-S  PS002860
                    PAGE  BSS     1         SKIPS TO NEXT PAGE          PS002870
                    PHID  BSS     1         RECORDS PHASE ID            PS002880
                    PHIDM BSS     1         RECORDS PHASE AND MODIFIER  PS002890
                    PRINT BSS     1         USE SYS PR SUBR TO PRINT    PS002900
                    PUT   BSS     1         WRITES TO DISK USING DISKZ  PS002910
                    REST  BSS     1         RESTORE CATCO,GO TO DCTL    PS002920
                    RTURN BSS     1         RESTORE XR-S AND CONDITIONS PS002930
                    *                                                 * PS002940
                    *  INPUT/OUTPUT PARAMETERS , CORE ADDRESSES       * PS002950
                    *                                                 * PS002960
                    BUF6  EQU     DUPCO-/1F ADDR OF PAGE HEADING BUFFER PS002970
                    PRPNT EQU     BUF6-/141 IOAR ADDR FOR PRINC. PTR    PS002980
                    IOADR EQU     BUF6-/38B START OF I/O INTERFACE      PS002990
                    GETHO EQU     IOADR+4   ENTRY FOR READING HOLL TYPE PS003000
                    GETBI EQU     IOADR+5   ENTRY FOR READING BINARY    PS003010
                    PACKB EQU     IOADR+6   ENTRY TO PACK BINARY        PS003020
                    PCHBI EQU     IOADR+7   ENTRY TO PUNCH BINARY       PS003030
                    BUF1  EQU     IOADR-/51 ADDR OF NEXT BUFFER         PS003040
                    BUF2  EQU     BUF1-/52  ADDR OF THIS BUFFER         PS003050
                    BUF3  EQU     BUF2-/3E  ADDR OF PACKED EBC BUFFER   PS003060
                    BUF4  EQU     BUF3-/52  ADDR OF CONTROL RCD BUFFER  PS003070
                    BUF5  EQU     IOADR-/284   ADDR OF LET SCTR BFR     PS003080
                    BUF7  EQU     BUF5-/7142   ADDR OF STORE/DUMP BFR   PS003090
                          HDNG    DUP CONTROL 2 (DCTL2)  PROLOGUE       PS003100
                    *************************************************** PS003110
                    *                                                 * PS003120
                    *STATUS - VERSION 2, MODIFICATION 9               * PS003130
                    *                                                 * PS003140
                    *FUNCTION/OPERATION -                             * PS003150
                    *   DUP CONTROL 2 (DCTL2) DECODES AND ANALYZES THE* PS003160
                    *   DUP CONTROL RECORDS NOT PROCESSED BY DCTL     * PS003170
                    *   (*DEFINE, *MACRO UPDATE, AND *DWADR). DCTL2   * PS003180
                    *   PROCESSES THE DUP CONTROL RECORD AND CALLS IN * PS003190
                    *   THE REQUIRED DUP MODULE.                      * PS003200
                    *                                                 * PS003210
                    *ENTRY POINTS -                                   * PS003220
                    *   PROGRAM START - CHECK - ENTERED FROM DUP      * PS003230
                    *   CONTROL                                       * PS003240
                    *                                                 * PS003250
                    *INPUT -                                          * PS003260
                    *   UPON ENTRY, A DUP CONTROL RECORD IS IN THE    * PS003270
                    *   PACKED EBCDIC BUFFER ADDRESSED VIA PEBUF.     * PS003280
                    *                                                 * PS003290
                    *OUTPUT - N/A                                     * PS003300
                    *                                                 * PS003310
                    *EXTERNAL REFERENCES-                             * PS003320
                    *   SUBROUTINES -                                 * PS003330
                    *      *GET   - FETCH DUP MODULE FROM DISK AND    * PS003340
                    *               EXECUTE                           * PS003350
                    *      *LEAVE - RECORD ERROR MESSAGE, GO TO REST  * PS003360
                    *               IN DUPCO                          * PS003370
                    *      *PHID  - TO IDENTIFY DCTL2 AS IN CONTROL   * PS003380
                    *   COMMUNICATIONS AREAS -                        * PS003390
                    *      *COMMA                                     * PS003400
                    *         $CORE                                   * PS003410
                    *      *DCOM                                      * PS003420
                    *         #CIDN                                   * PS003430
                    *         #DCSW                                   * PS003440
                    *         #FRDR                                   * PS003450
                    *         #JBSW                                   * PS003460
                    *         #NAME                                   * PS003470
                    *         #TODR                                   * PS003480
                    *                                                 * PS003490
                    *EXITS -                                          * PS003500
                    *   NORMAL -                                      * PS003510
                    *      *DWADR DUP CONTROL RECORD RECOGNIZED. EXIT * PS003520
                    *       THRU LINK SUBROUTINE OF DUPCO.            * PS003530
                    *      *DEFINE OR MACRO UPDATE DUP CONTROL RECORD * PS003540
                    *       RECOGNIZED. EXIT THRU GET SUBR OF DUPCO.  * PS003550
                    *   ERROR -                                       * PS003560
                    *      *INVALID DUP CTRL RECORD CAUSES EXIT THRU  * PS003570
                    *       LEAVE SUBR OF DUPCO WITH ERROR CODE OF    * PS003580
                    *       13,17,18,19,20, OR 24.                    * PS003590
                    *                                                 * PS003600
                    *TABLES/WORK AREAS- CATCO                         * PS003610
                    *   CATCO - CONCATENATED COMMON AREA OF DUPCO     * PS003620
                    *   CRBUF - ADDR OF INPUT BFR FOR CONTROL RECORDS * PS003630
                    *   PEBUF - ADDR FOR PACKED EBCDIC CONTROL RECORDS* PS003640
                    *                                                 * PS003650
                    *ATTRIBUTES- REUSABLE                             * PS003660
                    *                                                 * PS003670
                    *NOTES -                                          * PS003680
                    *   DCTL2 IS A PHASE CREATED IN MODIFICATION 8    * PS003690
                    *   BY DIVIDING DUP CONTROL (DCTL) INTO 2 PHASES. * PS003700
                    *   THEREFORE THE VERSION AND MODIFICATION LEVEL  * PS003710
                    *   INDICATORS(CC 69-71) FROM DCTL APPEAR IN DCTL2* PS003720
                    *************************************************** PS003730
                          HDNG    DCTL2 - CHECK DUP CONTROL RECORD      PS003740
                    *************************************************** PS003750
                          ORG     DCTLC                                 PS003760
                          DC      *-*       USED BY SYSTEM LOADER       PS003770
                          DC      /00CD     PHASE ID FOR DCTL2          PS003780
                    *************************************************** PS003790
                    *                                                 * PS003800
                    *   LABELS FOR ERROR MESSAGES FROM DCTL2          * PS003810
                    *                                                 * PS003820
                    *************************************************** PS003830
                    PH213 EQU     13        INVALID FUNCTION FIELD      PS003840
                    PH217 EQU     17        INVALID COUNT FIELD         PS003850
                    PH218 EQU     18        INVALID DURING TEMP MODE    PS003860
                    PH219 EQU     19        CARTRIDGE NOT ON SYSTEM     PS003870
                    PH220 EQU     20        CART ID OUTSIDE VALID RANGE PS003880
                    PH224 EQU     24        COUNT FIELD TOO LONG        PS003890
                    *************************************************** PS003900
                    CHECK EQU     *         DCTL2 ENTRY POINT           PS003910
                          BSI  I  PHID      IDENTIFY DUP PHASE IN CORE  PS003920
                          DC      /00CD     DUP CONTROL 2 (DCTL2)       PS003930
                    *                                                 * PS003940
                          LDD  L  RE902                                 PS003950
                          STD   1 PRPAR     PRINT PARAMETER LIMITS      PS003960
                          STD   1 DUMPP                                 PS003970
                    *                                                   PS003980
                          SLA     16                                    PS003990
                          STO   1 PH2       INDICATE DCTL IS NOT IN COREPS004000
                    *                                                   PS004010
                          LDX  L2 BUF3+1    POINT TO COLS 1,2           PS004020
                    *                                                   PS004030
                          BSI     DCBAF     CHECK COLS 1,2              PS004040
                          EBC     .*D.                                  PS004050
                          MDX     RE055     NOT *D, TRY MUP             PS004060
                          MDX     RE110     GO TO CHECK DEF,DWA         PS004070
                    *                                                   PS004080
                    RE055 BSI     DCEXF     CHECK COLS 1,2              PS004090
                          EBC     .*M.      MACRO UPDATE CONSTANT       PS004100
                          DC      PH213     INVALID FUNCTION CODE       PS004110
                    *                                                   PS004120
                          BSI     DCEXF     CHECK COLS 3,4              PS004130
                          EBC     .AC.      MACRO UPDATE CONSTANT       PS004140
                          DC      PH213     INVALID FUNCTION CODE       PS004150
                    *                                                   PS004160
                          BSI     DCEXF     CHECK COLS 5,6              PS004170
                          EBC     .RO.      MACRO UPDATE CONSTANT       PS004180
                          DC      PH213     INVALID FUNCTION CODE       PS004190
                          HDNG    DCTL2 - PROCESS *MACRO UPDATE RECO    PS004200
                    MUCTL LD   L  $CORE     TEST CORE SIZE FOR 8K       PS004210
                          SRA     13        *OR MORE                    PS004220
                          BSC  L  RE058,Z   BRANCH IF 8K OR MORE        PS004230
                          BSI  I  LEAVE     ERROR IF NOT 8K OR MORE     PS004240
                          DC      PH213     ERROR CODE                  PS004250
                    *                                                   PS004260
                    RE058 LDX  L3 MUPC      IOAR HEADER ADDR FOR MUP    PS004270
                          BSI     CKTMP     ERROR EXIT IF TEMP MODE     PS004280
                    *                                                   PS004290
                          LDD   1 MUHDR     IOAR HEADER FOR MUP         PS004300
                          BSC  L  PLUS2     GO TO FETCH MUP             PS004310
                          HDNG    DCTL2 - CHECK DUP CONTROL RECORD      PS004320
                    *************************************************** PS004330
                    *                                                 * PS004340
                    *   NOT A MACRO UPDATE FUNCTION, THEREFORE        * PS004350
                    *   CHECK FOR MISCELLANEOUS TYPE,DEF OR DWA       * PS004360
                    *                                                 * PS004370
                    *************************************************** PS004380
                    *                                                   PS004390
                    RE110 BSI     DCBAF     CHECK COLS 3,4              PS004400
                          EBC     .EF.      DEFINE CONSTANT             PS004410
                          MDX     RE120     NOT A DEFINE FUNCITON       PS004420
                    *                                                   PS004430
                          BSI     DCEXF     CHECK COLS 5,6              PS004440
                          EBC     .IN.      DEFINE CONSTANT             PS004450
                          DC      PH213     INVALID FUNCTION CODE       PS004460
                    *                                                   PS004470
                          BSI     DCEXF     CHECK COLS 7,8              PS004480
                          EBC     .E .      DEFINE CONSTANT             PS004490
                          DC      PH213     INVALID FUNCTION CODE       PS004500
                    *                                                   PS004510
                          BSC  L  DFCTL     DEFINE FUNCTION             PS004520
                    *                                                   PS004530
                    RE120 BSI     DCEXF     CHECK COLS 3,4              PS004540
                          EBC     .WA.      DWADR CONSTANT              PS004550
                          DC      PH213     INVALID FUNCTION CODE       PS004560
                    *                                                   PS004570
                          BSI     DCEXF     CHECK COLS 5,6              PS004580
                          EBC     .DR.      DWADR CONSTANT              PS004590
                          DC      PH213     INVALID FUNCTION CODE       PS004600
                    *                                                   PS004610
                    *************************************************** PS004620
                          BSC  L  WACTL     DISK WRITE ADDR FUNCTION    PS004630
                    *************************************************** PS004640
                          BSS  E  0                                     PS004650
                    RE902 DC      BUF4      LOWER PRINT LIMIT FOR DCTL  PS004660
                          DC      PRINT     UPPER PRINT LIMIT FOR DCTL  PS004670
                    RE903 DC      /FF00     MASK                        PS004680
                    RE904 DC      /F000     MASK                        PS004690
                    *************************************************** PS004700
                          HDNG    DCTL2 - COMPARE 2 EBCDIC CHARS. SUBR. PS004710
                    *************************************************** PS004720
                    *                                                 * PS004730
                    *   COMPARE  EBCDIC CHARS SPEC WITH 2 EBCDIC CHAR * PS004740
                    *   IN PEBUF SPEC BY THE CC POINTER (XR2)         * PS004750
                    *   ADVANCES CC POINTER TO NEXT 2 COLS            * PS004760
                    *   RETURNS TO SOURCE ADDR + 2 IF ALIKE.          * PS004770
                    *   IF UNEQUAL THEN GO TO LEAVE (DUPCO) WITH SPEC * PS004780
                    *   ERROR CODE.     LINKAGE IS                    * PS004790
                    *     BSI     DCEXF     COMPARING SUBROUTINE      * PS004800
                    *     EBC     .XX.      EBCDIC CHARACTERS         * PS004810
                    *     DC      YY        ERROR CODE                * PS004820
                    *                                                 * PS004830
                    *************************************************** PS004840
                    DCEXF DC      *-*       RECORD SOURCE ADDR          PS004850
                          LD   I  DCEXF     2 EBCDIC CHAR FROM PROG     PS004860
                          MDX  L  DCEXF,+2  STEP SOURCE ADDR FOR RETURN PS004870
                          S     2 0         2 EBCDIC CHAR FROM PEBUF    PS004880
                          MDX   2 +1        STEP CC PT TO NEXT 2 COLS   PS004890
                          BSC  I  DCEXF,-+  EQUAL SO RETURN             PS004900
                          MDX  L  DCEXF,-1                              PS004910
                          LD   I  DCEXF                                 PS004920
                          STO     *+2       RECORD ERROR CODE           PS004930
                    *                                                   PS004940
                    *************************************************** PS004950
                          BSI  I  LEAVE     PRINT ERROR MESSAGE         PS004960
                          DC      *-*       ERROR CODE SPECIFIED        PS004970
                    *************************************************** PS004980
                    *                                                 * PS004990
                    *************************************************** PS005000
                    *                                                 * PS005010
                    *   COMPARE 2 EBCDIC CHARS SPEC WITH THE 2 EBCDIC * PS005020
                    *   CHAR IN PEBUF SPEC BY THE CC POINTER (XR2).   * PS005030
                    *   ADVANCE CC POINTER TO NEXT 2 COLS ONLY IF SAME* PS005040
                    *   IF ALIKE RETURN TO SOURCE ADDR + 2            * PS005050
                    *   WITH SOURCE ADDR + 2 IN THE A REG.            * PS005060
                    *   IF UNEQUAL THEN RETURN TO SOURCE ADDR +1      * PS005070
                    *   THE LINKAGE IS                                * PS005080
                    *     BSI     DCBAF     COMPARE .XX. WITH NEXT COL* PS005090
                    *     EBC     .XX.      EBCDIC CHARACTERS         * PS005100
                    *     MDX     NG        UNEQUAL                   * PS005110
                    *                                                 * PS005120
                    *************************************************** PS005130
                    DCBAF DC      *-*       RECORD SOURCE ADDR          PS005140
                          LD   I  DCBAF     2 EBCDIC CHAR FOR COMPARE   PS005150
                          MDX  L  DCBAF,+1  STEP SOURCE ADDR            PS005160
                          S     2 0         2 EBCDIC CHAR FROM CTRL REC PS005170
                          BSC  I  DCBAF,Z   UNEQUAL, RETURN             PS005180
                    *                                                   PS005190
                          MDX   2 +1        STEP CC POINTER TO NEXT COL PS005200
                          MDX  L  DCBAF,+1  STEP SOURCE ADDR            PS005210
                          LD      DCBAF     PUT SOURCE ADDR IN A REG    PS005220
                          BSC  I  DCBAF     EQUAL COMPARE, RETURN       PS005230
                    *************************************************** PS005240
                    *                                                 * PS005250
                    *   INHIBIT FURTHER PROCESSING IF JOB IS TEMP MODE* PS005260
                    *                                                 * PS005270
                    *************************************************** PS005280
                    CKTMP DC      *-*       RECORD RETURN ADDR          PS005290
                          LD    1 #JBSW                                 PS005300
                          BSC  I  CKTMP,-+  NOT A TEMP JOB-RETURN--     PS005310
                    *                                                   PS005320
                          BSI  I  LEAVE     PRINT ERROR MESSAGE         PS005330
                          DC      PH218     INVALID DURING TEMP-ER EXIT PS005340
                    *************************************************** PS005350
                    ST855 BSI  I  LEAVE     PRINT ERROR MESSAGE         PS005360
                          DC      PH217     INVALID COUNT FIELD         PS005370
                    *************************************************** PS005380
                          HDNG    DCTL2 - *DEFINE TYPE DUP CTRL RECORD  PS005390
                    *************************************************** PS005400
                    *                                                 * PS005410
                    *   DECODE DEFINE FIXED AREA DUP CONTROL RECORD   * PS005420
                    *                                                 * PS005430
                    *************************************************** PS005440
                    DFCTL BSI  L  DCBAF     CHECK COLS  9,10            PS005450
                          EBC     .FI.      DEFINE FIXED AREA CONSTANT  PS005460
                          MDX     DF200     NOT FIXED AREA,TRY VOID     PS005470
                    *                                                   PS005480
                          MDX   2 +3        SKIP 6 COLS                 PS005490
                    *                                                   PS005500
                          BSI  L  DCEXF     CHECK COLS 17,18            PS005510
                          EBC     .EA.      FIXED AREA CONSTANT         PS005520
                          DC      PH213     INVALID FUNCTION CODE       PS005530
                    *                                                   PS005540
                          MDX   2 +6        ADJUST CC POINTER           PS005550
                          BSI  L  DCBAF     CHECK COLS 31,32            PS005560
                          EBC     .  .      BLANK COLS CONSTANT         PS005570
                          MDX     DF150     NOT BLANK COLS,TRY MINUS    PS005580
                    *                                                   PS005590
                          MDX     DF160     EXPANDING FIXED AREA        PS005600
                    *                                                   PS005610
                    DF150 BSI  L  DCEXF     CHECK COLS 31,32            PS005620
                          EBC     .- .      MINUS CONSTANT              PS005630
                          DC      PH224     COUNT FIELD OFFSET          PS005640
                    *                                                   PS005650
                          STX  L0 NEGSW+C   INDICATE DECREASING FXA     PS005660
                    *                                                   PS005670
                    DF160 BSI  L  DACNT     PUT CYL COUNT INTO DATSW    PS005680
                    *                                                   PS005690
                          LD    1 DATSW                                 PS005700
                          STO   1 FXSW      RECORD CYL COUNT AND SET SW PS005710
                          STO   1 DFNSW     INDICATE DEFINE FIXED AREA  PS005720
                    *                                                   PS005730
                          BSC  L  ST855,-+  ZERO CYL COUNT SPEC--ERROR  PS005740
                    *                                                 * PS005750
                          MDX     DF800     DO COMMON DEFINE CHECKS     PS005760
                    *************************************************** PS005770
                    *************************************************** PS005780
                    *                                                 * PS005790
                    *   DECODE DEFINE VOID ASSEMBLED DUP CONTROL REC  * PS005800
                    *                                                 * PS005810
                    *************************************************** PS005820
                    DF200 BSI  L  DCEXF     CHECK COLS 09,10            PS005830
                          EBC     .VO.      VOID CONSTANT               PS005840
                          DC      PH213     INVALID FUNCTION CODE       PS005850
                    *                                                   PS005860
                          MDX   2 +3        SKIP 6 COLS                 PS005870
                    *                                                   PS005880
                          BSI  L  DCBAF     CHECK COLS 17,18            PS005890
                          EBC     .EM.      VOID ASSEMBLER CONSTANT     PS005900
                          MDX     DF300     NOT VOID ASMBL, TRY FORTRAN PS005910
                    *                                                   PS005920
                          STO   1 ASMSW     SET VOID ASM SW             PS005930
                    *                                                   PS005940
                          MDX     DF800     DO COMMON DEFINE CHECKS     PS005950
                    *************************************************** PS005960
                    *************************************************** PS005970
                    *                                                 * PS005980
                    *   DECODE DEFINE VOID FORTRAN DUP CONTROL RECORD * PS005990
                    *                                                 * PS006000
                    *************************************************** PS006010
                    DF300 BSI  L  DCBAF     CHECK COLS 17,18        2-5 PS006020
                          EBC     .TR.      VOID FORTRAN CONSTANT       PS006030
                          MDX     DF350     NOT FORTRAN, TRY COBOL  2-9 PS006040
                    *                                                   PS006050
                          STO   1 FORSW     SET VOID FORTRAN SW     2-5 PS006060
                    *                                               2-5 PS006070
                          MDX     DF800     DO COMMON DEFINE CHECKS 2-5 PS006080
                    ************************************************2-5 PS006090
                    *************************************************** PS006091
                    *                                              2-9* PS006092
                    *   DECODE DEFINE VOID COBOL DUP CTL RECORD    2-9* PS006093
                    *                                              2-9* PS006094
                    *************************************************** PS006095
                    DF350 BSI  L  DCBAF     CHECK COLS. 17,18       2-9 PS006096
                          EBC     .OL.      VOID COBOL CONSTANT     2-9 PS006097
                          MDX     DF400     NOT VOID COBOL, TRY RPG 2-9 PS006098
                    *                                               2-9 PS006099
                          LD      *-1       ACC=NEGATIVE VALUE      2-9 PS006100
                          STO  L  RPGSW+C   SET SW TO VOID COBOL    2-9 PS006101
                    *                                               2-9 PS006102
                          MDX     DF800     DO COMMON DEFINE CHECKS 2-9 PS006103
                    *************************************************** PS006104
                    *************************************************** PS006105
                    *                                               2-5 PS006110
                    *   DECODE  DEFINE VOID RPG  DUP CONTROL RECORD 2-5 PS006120
                    *                                               2-5 PS006130
                    ************************************************2-5 PS006140
                    DF400 MDX   2 -2        STEP BACK POINTER       2-5 PS006150
                          BSI  L  DCEXF     CHECK COLS 13,14        2-5 PS006160
                          EBC     . R.      RPG, 1ST HALF           2-5 PS006170
                          DC      PH213     INVALID FUNCTION CODE   2-5 PS006180
                    *                                               2-5 PS006190
                          BSI  L  DCEXF     CHECK COLS 15,16 IF . R.2-5 PS006200
                          EBC     .PG.      RPG, 2ND HALF           2-5 PS006210
                          DC      PH213     INVALID FUNCTION CODE   2-5 PS006220
                    *                                               2-5 PS006230
                          STX  L0 RPGSW+C   SET VOID RPG SWITCH     2-5 PS006240
                    ************************************************2-5 PS006250
                    *************************************************** PS006260
                    *                                                 * PS006270
                    *   PROCESS COMMON FIELDS FOR DEFINE DUP CTRL REC * PS006280
                    *                                                 * PS006290
                    *************************************************** PS006300
                    DF800 BSI  L  CKTMP     ERROR EXIT IF IN JOB T MODE PS006310
                    *                                                   PS006320
                    DF810 BSI     FRLAB     IDENTIFY CARTRIDGE REQUIRED PS006330
                    *                                                   PS006340
                          BSC  L  PL080     GO TO FETCH DEFINE          PS006350
                    *                                                 * PS006360
                    *************************************************** PS006370
                          HDNG    DCTL2 -- *DWADR DUP CONTROL RECORD    PS006380
                    *************************************************** PS006390
                    *                                                 * PS006400
                    *   PROCESS THE BALANCE OF THE DWADR DUP CTRL REC * PS006410
                    *                                                 * PS006420
                    *************************************************** PS006430
                    WACTL BSI     FRLAB     PROCESS CART ID FIELDS      PS006440
                    *                                                   PS006450
                          BSI  L  CKTMP     RETURN ONLY IF NOT JOB T    PS006460
                    *                                                   PS006470
                          LDD     WA900                                 PS006480
                          STD   1 #NAME     NAME OF PROG TO BE LINKED   PS006490
                          STO   1 #DCSW     ADRWS IS TO RETURN TO DUP   PS006500
                    *                                                   PS006510
                          BSI  I  LEAVE     RECORD CATCO TO COMMA+DCOM  PS006520
                          DC      -4        *AND XEQ LINK PROCEDURE     PS006530
                    *************************************************** PS006540
                          BSS  E  0                                     PS006550
                    WA900 DC      /0111     NAME CODE FOR  ADRWS        PS006560
                          DC      /99A2                                 PS006570
                    *************************************************** PS006580
                          HDNG    DCTL2 -FRLAB- CVRT CART ID TO LOG DR  PS006590
                    *************************************************** PS006600
                    *                                                 * PS006610
                    *   CONVERT COLUMNS 31-34 AND 37-40 FROM PACKED   * PS006620
                    *   EBCDIC TO THE FROM AND TO LOGICAL DRIVE NO.   * PS006630
                    *   IF NONE SPECIFIED DEFAULT TO NEGATIVE VALUE.  * PS006640
                    *                                                 * PS006650
                    *************************************************** PS006660
                    FRLAB DC      *-*       RECORD RETURN ADDR          PS006670
                          STX   2 FR040+1   SAVE RECORD IMAGE POINTER   PS006680
                          LDX  I2 PEBUF+C   POINT TO PACKED EBCDIC BFR  PS006690
                          LD    1 DFNSW                                 PS006700
                          BSC  L  FR020,Z   DEFINE FXA,DECODE TO FIELD  PS006710
                    *                                                 * PS006720
                          BSI     FR050     PROCESS  THE FROM ID FIELD  PS006730
                    *                                                 * PS006740
                          STO   1 #FRDR     RECORD LOGICAL FROM DRIVE   PS006750
                    *                                                 * PS006760
                    *************************************************** PS006770
                    *                                                 * PS006780
                    *   CONVERT COLUMNS 37-40 FROM PACKED EBCDIC TO   * PS006790
                    *   LOGICAL DRIVE NUMBER AND PUT INTO #TODR.      * PS006800
                    *                                                 * PS006810
                    *************************************************** PS006820
                    FR020 MDX   2 +3        STEP POINTER 6COLS.TO-FIELD PS006830
                          BSI     FR050     PROCESS  THE TO   ID FIELD  PS006840
                    *                                                 * PS006850
                          STO   1 #TODR     RECORD LOGICAL TO DRIVE     PS006860
                    *                                                 * PS006870
                    *                                                 * PS006880
                    FR040 LDX  L2 *-*       RESTORE REC IMAGE POINTER   PS006890
                          BSC  I  FRLAB     FROM AND TO FIELDS DONE-RET PS006900
                    *************************************************** PS006910
                    *                                                 * PS006920
                    *************************************************** PS006930
                    *                                                 * PS006940
                    *   PROCESS EITHER THE FROM OR THE TO ID FIELD    * PS006950
                    *                                                 * PS006960
                    *************************************************** PS006970
                    FR050 DC      *-*       RECORD RETURN ADDRESS       PS006980
                          BSI     FR100     CONVERT FROM CART ID        PS006990
                    *                                                 * PS007000
                          BSC  L  FR810,Z+  INVALID RANGE       --ERROR PS007010
                    *                                                 * PS007020
                          BSC     +         CART ID SPECIFIED           PS007030
                          LD      *-1       NO,SET ACC NEGATIVE         PS007040
                          BSI     FR600     COMPARE ACC  WITH CARD ID-S PS007050
                    *                                                 * PS007060
                          BSC  I  FR050     RETURN                      PS007070
                    *************************************************** PS007080
                    *                                                 * PS007090
                    *   CONVERT 4 UNPACKED EBCDIC CHARACTERS INTO     * PS007100
                    *   ONE BINARY WORD                               * PS007110
                    *                                                 * PS007120
                    *************************************************** PS007130
                    FR100 DC                                            PS007140
                          LDX   3 4         COUNT OF HEX CHARACTERS     PS007150
                          SLT     32        CLEAR THE ACC AND EXT       PS007160
                    *                                                   PS007170
                          LD    2 16        LOAD RELATIVE COLS 31,32    PS007180
                          RTE     8         ONE CHAR IN EACH A AND Q    PS007190
                          STO     FR960     HI ORDER,UNPACKED EBCDIC    PS007200
                    *                                                   PS007210
                          SLA     16        CONVERT TO UNPACKED EBCDIC  PS007220
                          SLT     8                                     PS007230
                          STO     FR960+1   2ND HIGHEST ORDER DIGIT     PS007240
                    *                                                   PS007250
                          LD    2 17        LOAD RELATIVE COLS 33,34    PS007260
                          RTE     8                                     PS007270
                          STO     FR960+2   3RD HIGHEST ORDER DIGIT     PS007280
                    *                                                   PS007290
                          SLA     16                                    PS007300
                          SLT     8                                     PS007310
                          STO     FR960+3   LO ORDER DIGIT              PS007320
                    *************************************************** PS007330
                    *                                                 * PS007340
                    *   CONVERT 4 UNPACKED EBCDIC CHARACTERS INTO     * PS007350
                    *   ONE BINARY WORD AND RETURN WITH IT IN THE AREG* PS007360
                    *                                                 * PS007370
                    *************************************************** PS007380
                          LDX   3 +4                                    PS007390
                    *                                                   PS007400
                    FR310 LD   L3 FR960-1   PICK UP NEXT CHARACTER      PS007410
                          EOR     FR930     /00F0                       PS007420
                          SRT     4                                     PS007430
                          BSI  L  FR350,Z   NOT NUMERIC RANGE TRY A-F   PS007440
                    *                                                 * PS007450
                    FR320 MDX   3 -1        DECR WD CNT, VAL IN EXT     PS007460
                          MDX     FR310     GET NEXT CHAR               PS007470
                    *                                                 * PS007480
                          RTE     16        MOVE BINARY RESULT TO A REG PS007490
                          BSC  I  FR100     CONVERSION COMPLETE -RETURN PS007500
                    *                                                   PS007510
                    *************************************************** PS007520
                    *                                                 * PS007530
                    *   CHECK FOR VALID HEX CHARACTER BETWEEN A AND F * PS007540
                    *                                                 * PS007550
                    *************************************************** PS007560
                    FR350 DC      *-*       RECORD RETURN ADDR          PS007570
                          LD   L3 FR960-1   CHAR VALUE                  PS007580
                          S       FR932     /00C1 MASK FOR  -A-         PS007590
                          BSC  L  FR370,Z+  TOO LOW TRY BLANK (0040)    PS007600
                    *                                                 * PS007610
                          LD   L3 FR960-1   CHAR VALUE                  PS007620
                          S       FR931     /00C6 MASK FOR  -F-         PS007630
                          BSC  L  FR810,Z-  OUTSIDE THE RANGE.  --ERROR PS007640
                    *                                                 * PS007650
                          SLT     4         SELECT EBCDIC CHAR FR QREG  PS007660
                          A       FR933     /0009 TO CONVERT TO HEX     PS007670
                          SRT     4         SAVE HEX DIGIT IN EXT   2-4 PS007680
                          MDX     FR380     THIS CHARACTER OK           PS007690
                    *                                                 * PS007700
                    *************************************************** PS007710
                    *                                                 * PS007720
                    *   CHECK FOR A BLANK DIGIT,INSERT A ZERO IF FOUND* PS007730
                    *                                                 * PS007740
                    *************************************************** PS007750
                    FR370 LD   L3 FR960-1   CHAR VALUE                  PS007760
                          S       FR937     /0040 EBCDIC BLANK CHAR     PS007770
                          BSC  L  FR810,Z   OUTSIDE THE RANGE   -ERROR- PS007780
                    *                                                   PS007790
                    *                       INSTRUCTION MOVED       2-4 PS007800
                    *                                                   PS007810
                    FR380 BSC  I  FR350     CHECK NEXT CHAR     -RETURN PS007820
                    *                                                   PS007830
                    *************************************************** PS007840
                    *                                                 * PS007850
                    *   MATCH THE ACC WITH CONTENTS OF THE QUINTUPLE  * PS007860
                    *   LABELED #CIDN (CART ID-S IN LOGICAL ORDER)    * PS007870
                    *                                                 * PS007880
                    *************************************************** PS007890
                    FR600 DC      *-*       RECORD RETURN ADDRESS       PS007900
                          BSC  I  FR600,Z+  DEFAULT CONDITION --RETURN- PS007910
                    *                                                   PS007920
                          STO     FR960     SAVE SPECIFIED CART ID      PS007930
                          LDX   3 +5        NO OF ELEMENTS              PS007940
                    *                                                   PS007950
                    FR610 LD   L3 #CIDN+C-1 PICK UP CART ID             PS007960
                          S       FR960     ADJUST BY SPECIFIED CART ID PS007970
                          BSC  L  FR690,-+  MATCH FOUND                 PS007980
                    *                                                   PS007990
                          MDX   3 -1                                    PS008000
                          MDX     FR610     LAST ENTRY NOT YET CHECKED  PS008010
                    *************************************************** PS008020
                          MDX     FR800     CART ID NOT FOUND  --ERROR- PS008030
                    *************************************************** PS008040
                    *                                                   PS008050
                    FR690 MDX   3 -1        ADJUST TO LOGICAL DRIVE NO. PS008060
                          NOP               ALLOW SKIP WHEN STEP TO 0   PS008070
                          STX   3 FR960+1                               PS008080
                          LD      FR960+1   PUT LOGICAL DR NO. IN ACC   PS008090
                          BSC  I  FR600     MATCH FOUND       --RETURN- PS008100
                    *************************************************** PS008110
                          HDNG    DCTL2 -FRLAB- ERR EXITS AND CONSTANTS PS008120
                    *************************************************** PS008130
                    *                                                 * PS008140
                    *   ERROR EXIT FOR CARTRIDGE ID FIELDS              PS008150
                    *                                                 * PS008160
                    *************************************************** PS008170
                    FR800 BSI  I  LEAVE     PRINT ERROR MESSAGE         PS008180
                          DC      PH219     CARTRIDGE NOT ON SYSTEM     PS008190
                    *************************************************** PS008200
                    FR810 BSI  I  LEAVE     PRINT ERROR MESSAGE         PS008210
                          DC      PH220     OUTSIDE VALID RANGE         PS008220
                    *************************************************** PS008230
                    *************************************************** PS008240
                    *                                                 * PS008250
                    *   CONSTANTS AND WORK AREAS                      * PS008260
                    *                                                 * PS008270
                    *************************************************** PS008280
                    FR930 DC      /00F0     MASK FOR NUMERICS VS A - F  PS008290
                    FR931 DC      /00C6     MASK FOR HEX F              PS008300
                    FR932 DC      /00C1     MASK FOR HEX A              PS008310
                    FR933 DC      /0009     CONSTANT FOR CONVERSION     PS008320
                    FR937 DC      /0040     EBCDIC BLANK CONSTANT       PS008330
                    FR960 BSS     4         WORK AREA                   PS008340
                    *************************************************** PS008350
                          HDNG    DCTL2 -- FETCH AND EXECUTE SUBROUTINE PS008360
                    *************************************************** PS008370
                    *                                                 * PS008380
                    *   SET UP CORE LOC, WD CNT AND SECT ADDR FOR ALL * PS008390
                    *   MODULES REQUIRED BY DCTL TO PROCESS SPEC FUNC * PS008400
                    *                                                 * PS008410
                    *************************************************** PS008420
                    PLUS2 STO   1 XEQSW     SET TO EXECUTE FETCHED PROG PS008430
                    PLUSX STD   3 0         INSERT REQD IOAR HEADER     PS008440
                    *                                                 * PS008450
                          BSI  I  PHID      RECORD PROGRESS OF PHASE 2  PS008460
                          DC      /C002     NEXT PHASE BEING CALLED     PS008470
                    *                                                 * PS008480
                          BSI  I  MDUMP     PRINT MONITORED OUTPUT      PS008490
                    *                                                 * PS008500
                          BSI  I  GET       FETCH REQD PHASE     -EXIT- PS008510
                    *                                                 * PS008520
                    PL009 BSC  L  *-*       EXIT TO DCTL EXTENSIONS     PS008530
                    *************************************************** PS008540
                          HDNG    DCTL -- FETCH AND EXECUTE SUBROUTINE  PS008550
                    *************************************************** PS008560
                    *                                                 * PS008570
                    *   SET UP TO FETCH AND EXECUTE THE DEFINE MODULE * PS008580
                    *                                                 * PS008590
                    *************************************************** PS008600
                    PL080 LDX  L3 B         CORE LOC TO PLACE IOAR HDR  PS008610
                          SLA     16                                    PS008620
                          STO   1 BITSW     INHIBIT PRINT DURING MDUMP  PS008630
                          LDD   1 DFHDR     IOAR HDR FOR DEFINE         PS008640
                          MDX     PLUS2     GO TO FETCH DEFINE          PS008650
                    *                                                 * PS008660
                          HDNG    DCTL2 -- PROCESS THE COUNT FIELD      PS008670
                    *************************************************** PS008680
                    *                                                 * PS008690
                    *   PUT DECIMAL VALUE FROM COLS 27-30 TO DATSW    * PS008700
                    *   IN HEX.                                       * PS008710
                    *                                                 * PS008720
                    *************************************************** PS008730
                    DACNT DC      *-*       RECORD RETURN ADDR          PS008740
                          STX   2 DA200+1   SAVE XR 2                   PS008750
                          LDX  I2 PEBUF+C   POINT TO PACKED EBCDIC BFR  PS008760
                          LDX   3 4                                     PS008770
                    *************************************************** PS008780
                    *                                                 * PS008790
                    *   PROCESS COLUMNS 29 AND 30                     * PS008800
                    *                                                 * PS008810
                    *************************************************** PS008820
                          LD    2 15        COLS 29,30                  PS008830
                          SLA     8         COL 30 ONLY                 PS008840
                          BSI     DA800     CHECK FOR NUMERIC FIELD     PS008850
                    *                                                   PS008860
                          BSI     DA700     RECORD INTO DATSW,UNITS     PS008870
                    *                                                   PS008880
                          LD    2 15        COLS 29,30                  PS008890
                          BSI     DA800     CHECK FOR COL 29 NUMERIC    PS008900
                    *                                                   PS008910
                          SLA     4                                     PS008920
                          BSI     DA700     RECORD COL 29 INTO DATSW    PS008930
                    *************************************************** PS008940
                    *                                                 * PS008950
                    *   PROCESS COLUMNS 27 AND 28                     * PS008960
                    *                                                 * PS008970
                    *************************************************** PS008980
                          LD    2 14        COLS 27,28                  PS008990
                          SLA     8         COL 28 ONLY                 PS009000
                          BSI     DA800     CHECK COL 28 FOR NUMERIC    PS009010
                    *                                                   PS009020
                          SLA     8                                     PS009030
                          BSI     DA700     RECORD COL 28 AS HUNDREDS   PS009040
                    *                                                   PS009050
                          LD    2 14                                    PS009060
                          BSI     DA800     CHECK COL 27 FOR NUMERIC    PS009070
                    *                                                   PS009080
                          SLA     12                                    PS009090
                          BSI     DA700     RECORD COL 27 AS THOUSANDS  PS009100
                    *************************************************** PS009110
                    *                                                 * PS009120
                    *   CONVERT DECIMAL VALUE IN DATSW TO HEX VALUE   * PS009130
                    *                                                 * PS009140
                    *************************************************** PS009150
                    DA100 SLT     32        CLEAR THE A AND Q REGISTERS PS009160
                          STO   1 TEMP1     CLEAR WORKING LOCATION      PS009170
                    *                                                   PS009180
                          LD    1 DATSW     WORD TO BE CONVERTED        PS009190
                    *                                                   PS009200
                    DA150 RTE     32-4                                  PS009210
                          STO   1 TEMP2     SAVE REST OF DIGITS         PS009220
                    *                                                   PS009230
                          MDX   3 -1        STEP DOWN NO OF DIGITS LEFT PS009240
                          MDX     DA170                                 PS009250
                          MDX     DA180     LAST DIGIT PROCESSED        PS009260
                    *                                                   PS009270
                    DA170 SLT     16        MOVE DIGIT TO THE A REG     PS009280
                          A     1 TEMP1     RUNNING TOTAL               PS009290
                          M       DA900     TIMES 10                    PS009300
                          SLT     16                                    PS009310
                          STO   1 TEMP1     NEW TOTAL                   PS009320
                    *                                                   PS009330
                          LD    1 TEMP2     BALANCE OF WORD TO CONVERT  PS009340
                          MDX     DA150     PROCESS NEXT DIGIT          PS009350
                    *                                                   PS009360
                    DA180 SLT     16                                    PS009370
                          A     1 TEMP1                                 PS009380
                          STO   1 DATSW     HEX VALUE INTO DATSW        PS009390
                    *************************************************** PS009400
                    DA200 LDX  L2 *-*       RESTORE XR 2                PS009410
                          BSC  I  DACNT     RETURN--- FROM DACNT ---    PS009420
                    *************************************************** PS009430
                    *                                                   PS009440
                    DA700 DC      *-*       RECORD RETURN ADDR          PS009450
                          OR    1 DATSW                                 PS009460
                          STO   1 DATSW     ACCUMULATIVE DECIMAL COUNT  PS009470
                    *                                                   PS009480
                          BSC  I  DA700     RETURN - DATSW UPDATED      PS009490
                    *************************************************** PS009500
                    DA800 DC      *-*       RECORD RETURN ADDR          PS009510
                          AND     DA901     MASK WITH FFOO              PS009520
                          EOR     DA902     MASK WITH 4000              PS009530
                          BSC  L  DA100,+-  FIRST LOW ORDER BLANK       PS009540
                          EOR     DA903     MASK WITH B000              PS009550
                          SRT     12                                    PS009560
                          BSC  L  ST855,Z   INVALID COUNT FIELD --ERROR PS009570
                          SLT     4                                     PS009580
                          BSC  I  DA800     RETURN-DIGIT IS NUMERIC     PS009590
                    *                                                   PS009600
                    *************************************************** PS009610
                    *                                                 * PS009620
                    *   CONSTANT USED BY THE DACNT  SUBROUTINE        * PS009630
                    *                                                 * PS009640
                    *************************************************** PS009650
                    DA900 DC      10        CONSTANT MULTIPLIER         PS009660
                    DA901 DC      /FF00     MASK                        PS009670
                    DA902 DC      /4000     MASK                        PS009680
                    DA903 DC      /B000     MASK                        PS009690
                    *************************************************** PS009700
                    *************************************************** PS009710
                    *************************************************** PS009720
                    *                                                 * PS009730
                          BSS     DCTL+640-*-1  DCTL2 PATCH (2 SCTR)  * PS009740
                          DC      /FFFF     END OF DCTL2 PATCH AREA   * PS009750
                    *                                                 * PS009760
                    *************************************************** PS009770
                    *************************************************** PS009780
                          END     CHECK                                 PS009790
