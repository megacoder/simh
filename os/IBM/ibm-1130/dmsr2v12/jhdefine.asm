                          HDNG    DEFINE-   RESIDENT COMMA   2 AUG 67   J0800010
                          ABS                                           J0800020
                    $CIBA EQU     /5   ADDR OF CIB ON MASTER CARTRIDGE  J0800030
                    $CH12 EQU     /6   CHANNEL 12 INDR,NON-ZERO=CHAN 12 J0800040
                    $COMN EQU     /7   WORD COUNT OF COMMON             J0800050
                    $CORE EQU     /E   CORE SIZE,/1000=4K,/2000=8K,ETC) J0800060
                    $CTSW EQU     /F   MCR SW,NON-ZERO=// RECD TRAPPED  J0800070
                    $DADR EQU     /10  SCTR ADDR OF PROG TO BE FETCHED  J0800080
                    $DABL EQU     /11  IOCC FOR SCA RESET (ODD ADDR)    J0800090
                    $DREQ EQU     /12  INDR FOR REQUESTED V. DISK I/O   J0800100
                    $IBSY EQU     /13  PRINC I/O BUSY INDR,NON-ZERO=BSY J0800110
                    $HASH EQU     /14  WORK AREA FOR MONITOR PROGRAMS   J0800120
                    $PRET EQU     /28  ADDR PREOPERATIVE ERROR TRAP     J0800130
                    $IREQ EQU     /2C  ADDR OF INT REQUEST SUBROUTINE   J0800140
                    $ULET EQU     /2D  ADDR OF LET, LOGICAL DRIVE 0     J0800150
                    $IOCT EQU     /32  IOCS CTR,0=NO I/O IN PROGRESS    J0800160
                    $LAST EQU     /33  LAST CD INDR,NON-ZERO=LAST CARD  J0800170
                    $NDUP EQU     /34  INHIBIT DUP SW,NON-ZERO=NO DUP   J0800180
                    $NXEQ EQU     /35  INHIBIT EXEC SW,NON-ZERO=NO EXEQ J0800190
                    $PBSY EQU     /36  PRINC PTR BUSY INDR,NON-ZERO=BSY J0800200
                    $PGCT EQU     /37  PAGE NO. FOR PAGE HEADINGS       J0800210
                    $EXIT EQU     /38  ADDR CALL EXIT ENTRY POINT       J0800220
                    $LINK EQU     /39  ADDR CALL LINK ENTRY POINT       J0800230
                    $DUMP EQU     /3F  ADDR OF CALL DUMP, ENTRY POINT   J0800240
                    $DCDE EQU     /77  DRIVE CODE FOR CORE LOAD BLDR    J0800250
                    $PHSE EQU     /78  NO. OF PHASE CURRENTLY IN CORE   J0800260
                    $UFIO EQU     /79  ARM POSITION IN UNFORMATTED AREA J0800270
                    $WSDR EQU     /7A  WORKING STORAGE DRIVE CODE       J0800280
                    $WRD1 EQU     /7B  LOAD ADDR FOR CURR USER CORE LD  J0800290
                    $KCSW EQU     /7C  INHIBIT INPUT/PRINT OVERLAP SW   J0800300
                    $UFDR EQU     /7D  UNFORMATTED I/O DRIVE CODE       J0800310
                    $CPTR EQU     /7E  CHANNEL 12 INDICATOR FOR CP      J0800320
                    $1132 EQU     /7F  CHANNEL 12 INDICATOR FOR 1132    J0800330
                    $1403 EQU     /80  CHANNEL 12 INDICATOR FOR 1403    J0800340
                    $PST1 EQU     /81  ADDR POSTOP ERROR TRAP,LEVEL 1   J0800350
                    $PST2 EQU     /85  ADDR POSTOP ERROR TRAP,LEVEL 2   J0800360
                    $PST3 EQU     /89  ADDR POSTOP ERROR TRAP,LEVEL 3   J0800370
                    $PST4 EQU     /8D  ADDR POSTOP ERROR TRAP,LEVEL 4   J0800380
                    $STOP EQU     /91  ADDR PROGRAM STOP KEY TRAP       J0800390
                    $FPAD EQU     /95  FILE PROTECT ADDR (ADJ),LOG DR 0 J0800400
                    $CYLN EQU     /9A  ARM POSITION FOR LOGICAL DRIVE 0 J0800410
                    $ACDE EQU     /9F  AREA CODE FOR LOGICAL DRIVE 0    J0800420
                    $DCYL EQU     /A4  1ST DEF CYL ADDR, LOGICAL DR 0   J0800430
                    $I200 EQU     /B3  ENTRY POINT TO ILS FOR LEVEL 2   J0800440
                    $I205 EQU     /B8                                   J0800450
                    $IBT2 EQU     $I205+1 ADDR OF IBT FOR LEVEL 2       J0800460
                    $I400 EQU     /C4  ENTRY POINT TO ILS FOR LEVEL 4   J0800470
                    $I405 EQU     /D3                                   J0800480
                    $IBT4 EQU     $I405+1 ADDR OF IBT FOR LEVEL 4       J0800490
                    $I410 EQU     /D5                                   J0800500
                    $DBSY EQU     /EE  DISK BUSY INDR,NON-ZERO=DK BUSY  J0800510
                    $BYSW EQU     /1CB BYPASS SW,NOP IF FETCHING SOCAL  J0800520
                    DZ000 EQU     /0F2 DISKZ ENTRY POINT                J0800530
                    $ZEND EQU     /1E0 ADDR 1+LAST WORD OF DISKZ        J0800540
                          HDNG          CONCATENATED COMMON AREA(CATCO) J0800550
                    C     EQU     /7FA0     CATCO POINTER SET TO MIDDLE J0800560
                    *************************************************** J0800570
                    *                                                 * J0800580
                    *  INDEX REG 1 IS SET TO .C. WHEN CATCO IS FORMED * J0800590
                    *  FOR USE BY ALL OF DUP FUNCTIONS. ANY DUP ROUT  * J0800600
                    *  USING XR 1 FOR OTHER REASONS MUST RESTORE.     * J0800610
                    *  ALL VALUES IN CATCO HAVE LABELS EQUATED TO THE * J0800620
                    *  VALUE THAT INDICATES THEIR RELATIVE LOCATION   * J0800630
                    *  FROM .C.                                       * J0800640
                    *                                                 * J0800650
                    *************************************************** J0800660
                    *                                                 * J0800670
                    *             CATCO DCOM IMAGE                    * J0800680
                    *   EQUIVALENCES USED TO REFERENCE CATCO WITH XR1 * J0800690
                    *                                                 * J0800700
                    *************************************************** J0800710
                    #NAME EQU     4-/80     NAME OF PROGRAM             J0800720
                    #DBCT EQU     6-/80     DISK BLOCK COUNT OF PROGRAM J0800730
                    #FCNT EQU     7-/80     FILES SW ZERO = NO FILES    J0800740
                    #SYSC EQU     8-/80     NON-0 IF SYSTEM CARTRIDGE   J0800750
                    #JBSW EQU     9-/80     JOB SW,NON-ZERO='T' MODE    J0800760
                    #CBSW EQU     10-/80    CLB SW,NON-ZERO=STORECI     J0800770
                    #LCNT EQU     11-/80    NO. OF LOCALS               J0800780
                    #MPSW EQU     12-/80    NON-ZERO, CORE MAP DESIRED  J0800790
                    #MDF1 EQU     13-/80    NO. OF DUP CTRL RCDS        J0800800
                    #MDF2 EQU     14-/80    ADDR OF MODIF BUFFER        J0800810
                    #NCNT EQU     15-/80    NO. OF NOCALS               J0800820
                    #ENTY EQU     16-/80    RELATIVE ENTRY ADDR OF PROG J0800830
                    #RP67 EQU     17-/80    IF NON-ZERO,1442 MOD 6,7    J0800840
                    *                                                   J0800850
                    *   NEGATIVE VALUE REPRESENTS DEFAULT CONDITION   * J0800860
                    #TODR EQU     18-/80    DR CODE OF 'TO' DRIVE       J0800870
                    #FRDR EQU     19-/80    DR CODE OF 'FROM' DRIVE     J0800880
                    *                                                 * J0800890
                    #FHOL EQU     20-/80    ADDR OF LARGEST FXA HOLE    J0800900
                    #FSZE EQU     21-/80    BLK CNT LARGEST HOLE IN FXA J0800910
                    #UHOL EQU     22-/80    ADDR OF LARGEST UA HOLE     J0800920
                    #USZE EQU     23-/80    BLK CNT LARGEST HOLE IN UA  J0800930
                    #DCSW EQU     24-/80    NON-ZERO=DUP CALL           J0800940
                    #PIOD EQU     25-/80    PRINC. I/O INDICATOR        J0800950
                    #PPTR EQU     26-/80    PRINC. PRINTER INDICATOR    J0800960
                    #CIAD EQU     27-/80    REL LOC IN SCTR 0 OF CIL AD J0800970
                    #ACIN EQU     28-/80    AVAILABLE CARTRIDGE INDR2-8 J0800980
                    #GRPH EQU     29-/80    2250 INDICATOR          2-8 J0800990
                    #GCNT EQU     30-/80    NO. G2250 RECORDS       2-8 J0801000
                    #LOSW EQU     31-/80    LOCAL-CALLS-LOCAL INDR  2-8 J0801010
                    #X3SW EQU     32-/80    SPECIAL ILS SWITCH      2-8 J0801020
                    #ECNT EQU     33-/80    NO. OF EQUAT RCDS       2-8 J0801030
                    #ANDU EQU     35-/80    END OF UA (ADJ) LOG DR 0-4  J0801040
                    #BNDU EQU     40-/80    END OF UA (BASE) LOG DR 0-4 J0801050
                    #FPAD EQU     45-/80    FILE PROTECT ADDR (BASE)    J0801060
                    #PCID EQU     50-/80    CART ID, PHYS DR 0-4        J0801070
                    #CIDN EQU     55-/80    CART ID, LOG DR 0-4         J0801080
                    #CIBA EQU     60-/80    CIB ADDR, LOG DR 0-4        J0801090
                    #SCRA EQU     65-/80    SCRA, LOG DR 0-4            J0801100
                    #FMAT EQU     70-/80    WS FORMAT, LOG DR 0-4       J0801110
                    #FLET EQU     75-/80    FLET ADDR, LOG DR 0-4       J0801120
                    #ULET EQU     80-/80    LET ADDR, LOG DR 0-4        J0801130
                    #WSCT EQU     85-/80    WS BLK CNT, LOG DR 0-4      J0801140
                    #CSHN EQU     90-/80    SECTORS LEFT IN CUSHION     J0801150
                    #DCOM EQU     1         SCTR ADDR OF DCOM           J0801160
                    #HDNG EQU     7         SCTR WITH PAGE HEADING      J0801170
                    @SBFR EQU     /FB0                              2-8 J0801180
                          HDNG    CONCATENATED COMMON AREA (CATCO)      J0801190
                    *************************************************** J0801200
                    *                                                 * J0801210
                    *             CATCO IOAR HDRS FOR DUP PHASES      * J0801220
                    *                                                 * J0801230
                    *************************************************** J0801240
                          ORG     -/10                                  J0801250
                    DCHDR BSS     2         DUP CONTROL            PH02 J0801260
                    STHDR BSS     2         STORE                  PH03 J0801270
                    FLHDR BSS     2         FILEQ                  PH04 J0801280
                    DMHDR BSS     2         DUMP                   PH05 J0801290
                    DLHDR BSS     2         DUMPLET                PH06 J0801300
                    DTHDR BSS     2         DELETE                 PH07 J0801310
                    DFHDR BSS     2         DEFINE                 PH08 J0801320
                    DXHDR BSS     2         DUP EXIT               PH09 J0801330
                    UCHDR BSS     2         DUP UPCOR              PH13 J0801340
                    PIHDR BSS     2         PRINCIPAL I/O BLOCK    PH14 J0801350
                    SIHDR BSS     2         PRINC I/O (W/O KB) BLK PH15 J0801360
                    PTHDR BSS     2         PAPER TAPE I/O BLOCK   PH16 J0801370
                    CIHDR BSS     2         CI PHASE READ BY CL BUILDER J0801380
                    MUHDR BSS     2         MACRO UPDATE      PH206 2-8 J0801390
                    D2HDR BSS     2         DUP CONTROL 2     PH205 2-8 J0801400
                          HDNG    DFINE-    CATCO DUP SWITCHES          J0801410
                    *************************************************** J0801420
                    *                                                 * J0801430
                    *             CATCO DUP SWITCHES                  * J0801440
                    *      WORDS USED FOR COMMUNICATION OF DATA       * J0801450
                    *   BETWEEN DUP ROUTINES.                         * J0801460
                    *                                                 * J0801470
                    *      INITIALIZED TO ZERO BY  .REST. OF DUPCO    * J0801480
                    *                                                 * J0801490
                    *************************************************** J0801500
                    CL1   EQU     *                                     J0801510
                    ASMSW BSS     1         NON ZERO IF DEFINE VOID ASM J0801520
                    BITSW BSS     1         NON ZERO TO ALLOW M-DUMP-S  J0801530
                    BLKSW BSS     1         NON ZERO IF BYPASSING REC   J0801540
                    CIERR BSS     1         ERROR NO DETECTED BY PH 17  J0801550
                    CISW  BSS     1         NON ZERO IF STORE CI        J0801560
                    CLBSW BSS     1         NON ZERO IF PRECI EXECUTED  J0801570
                    CNTNO BSS     1         RECORD NO BEING PCHD OR RD  J0801580
                    *                                                 * J0801590
                    *   .DATSW. IS FILLED WITH THE CNT FIELD OF THE   * J0801600
                    *   DUP CONTROL RECORD.                           * J0801610
                    *   USED PRIMARILY FOR DATA MOVEMENT, BUT ALSO IS * J0801620
                    *   USED FOR COUNT OF RECORDS TO READ AFTER A     * J0801630
                    *   STORE CI DUP CONTROL RECORD.                  * J0801640
                    DATSW BSS     1         RECORDS VALUE IN CNT FIELD  J0801650
                    DBADR BSS     1         DB ADDR OF REFERENCED PROG  J0801660
                    DELSW BSS     1         ADDR OF REQ LET ENTRY - 1   J0801670
                    DFNSW BSS     1         NON ZERO IF DEFINE FXA      J0801680
                    DKSAD BSS     1         DK SCTR ADDR W/O DR CODE    J0801690
                    DUMPP BSS  E  2         LAST LIMITS FOR PRNTR DUMP  J0801700
                    FORSW BSS     1         NON ZERO IF DEFINE VOID FOR J0801710
                    FRWS  BSS     1         NON ZERO IF FROM FLD IS WS  J0801720
                    FXSW  BSS     1         NON ZERO IF FIXED AREA REQD J0801730
                    HOLSW BSS     1         NON ZERO IF NO CONV REQD    J0801740
                    IOSW  BSS     1         NON ZERO IF IN/OUT REQD     J0801750
                    *                                                 * J0801760
                    *   DUMPLET SWITCH - ZERO IF NOT DUMPLET/DUMPFLET * J0801770
                    *       PLUS VALUE REQUIRES PRINT OF BOTH LET/FLET* J0801780
                    *       NEG. VALUE REQUIRES PRINT OF FLET ONLY    * J0801790
                    LETSW BSS     1         NON ZERO,PRINT LET OR FLET* J0801800
                    LSTLF BSS     1         LAST LET/FLET SECT PROCESSD J0801810
                    MODSW BSS     1         NON ZERO IF STORE MOD FUNC  J0801820
                    NAMSW BSS     1         NON ZERO IF NAME IN LET/F   J0801830
                    NEGSW BSS     1         NON ZERO IF SHRINKING FXA   J0801840
                    PGMHL BSS     1         WORD COUNT OF THE PROG HDR  J0801850
                    PRSW  BSS     1         NON ZERO IF PRINTING OUTPUT J0801860
                    PTSW  BSS     1         NON ZERO IF PAPER TAPE REQD J0801870
                    SKWDS BSS     1         WDS TO SEARCH IN L/F SECT   J0801880
                    STCSW BSS     1         NON ZERO IF STORE DATA CI   J0801890
                    STSW  BSS     1         NON ZERO IF STORE TYPE      J0801900
                    TEMP1 BSS  E  1         1ST WD OF BINEB OUTPUT      J0801910
                    TEMP2 BSS     1         2ND WD OF BINEB OUTPUT      J0801920
                    TOWS  BSS     1         NON ZERO IF TO FIELD IS WS  J0801930
                    T3MSW BSS     1         TYPE 3,4 SOCAL LEVEL CELL   J0801940
                    UASW  BSS     1         NON ZERO IF USER AREA REQD  J0801950
                    WSSW  BSS     1         NON ZERO IF WORK STG REQD   J0801960
                    XEQSW BSS     1         NON ZERO IF NOT RET FR GET  J0801970
                    EBCSW BSS     1         NON ZERO IF EBC DATA OP 2E2 J0801980
                    HDNSW BSS     1         NON ZERO IF NAME IN HDR 2-8 J0801990
                    RPGSW BSS     1         POSITIVE=DEFINE VOID RPG2-9 J0802000
                    *                       *NEG=DEFINE VOID COBOL  2-9 J0802010
                    DFLSW BSS     1         NON ZERO IF *DFILE      2-8 J0802020
                          BSS     1         RESERVED FOR ADDITION   2-8 J0802030
                    CL2   EQU     *-1                                   J0802040
                          HDNG    DFINE-    CATCO DUP SWITCHES          J0802050
                    *************************************************** J0802060
                    *                                                 * J0802070
                    *             CATCO DUP SWITCHES                  * J0802080
                    *  INITIALIZED BY DCTL AND NOT RESET BY .REST.    * J0802090
                    *                                                 * J0802100
                    *************************************************** J0802110
                    IOREQ BSS     1         NON-ZERO,AUX I/O SET REQ    J0802120
                    PH2   BSS     1         NON-ZERO IF DCTL IN CORE    J0802130
                    PH3   BSS     1         NON-ZERO IF STORE IN CORE   J0802140
                    PH4   BSS     1         NON-ZERO IF DUMP IN CORE    J0802150
                    ************************************************2-8 J0802160
                    *                                               2-8 J0802170
                    *             CATCO SWITCH INITIALIZED TO ZERO  2-8 J0802180
                    *   BY CCAT SUBR AND SET BY MACRO UPDATE PROGRAM2-8 J0802190
                    *                                               2-8 J0802200
                    ************************************************2-8 J0802210
                    DUPCR BSS     1         NON ZERO IF DUP CTRL RCD2-8 J0802220
                    *************************************************** J0802230
                    *                                                 * J0802240
                    *             CATCO DUP SWITCHES SET BY CCAT SUBR * J0802250
                    *                                                 * J0802260
                    *************************************************** J0802270
                    ADDR2 BSS     1         KB INTERRUPT ADDRESS        J0802280
                    KBREQ BSS     1         CONTENTS OF LOC 13          J0802290
                    *      THE FOLLOWING SWITCH IS SET TO INDICATE THE  J0802300
                    *       PRINCIPAL INPUT DEVICE                      J0802310
                    *             -  IS PAPER TAPE                      J0802320
                    *             0  IS CARD                            J0802330
                    *             +  IS KEYBOARD                        J0802340
                    INOUT BSS     1         PRINCIPAL INPUT SWITCH      J0802350
                    *                                                   J0802360
                    PTPON BSS     1         NON-ZERO IF PAPER TP ON SYS J0802370
                    *************************************************** J0802380
                    *                                                 * J0802390
                    *             LEVEL 4 INTERRUPT BRANCH TABLE      * J0802400
                    *             ADDRESSES. INITIALIZED BY CCAT,     * J0802410
                    *             AND CARD/PAPER TAPE INTERFACES.     * J0802420
                    *                                                 * J0802430
                    *************************************************** J0802440
                          ORG     /0049                                 J0802450
                    IBT   BSS     9         9 WD INTRPT BRANCH TABLE    J0802460
                    *************************************************** J0802470
                    *                                                 * J0802480
                    *             CATCO I/O ADDRESSES REQUIRED BY DUP * J0802490
                    *                                                 * J0802500
                    *************************************************** J0802510
                    P1442 BSS  E  2         SYS 1442 IOAR HEADER        J0802520
                    PRPAR BSS     2         DEFAULT LIMITS TO PRINT     J0802530
                    PHDUP BSS     1         LAST DUP PHASE IN CORE      J0802540
                    CRBUF BSS     1         81 WD BFR FOR DUP CTRL RCDS J0802550
                    DCADR BSS     1         ADDR FOR DUP CTRL IOAR HDR  J0802560
                    HDBUF BSS     1         ADDR OF PAGE HEADING BFR    J0802570
                    IOBLK BSS     1         ADDR OF DUP I/O PHASE       J0802580
                    SDBUF BSS     1         STORE/DUMP BUFFER           J0802590
                    LETAR BSS     1         ADDR OF LET SEARCH BUFFER   J0802600
                    PEBUF BSS     1         41 WD BFR FOR PACKED EBCDIC J0802610
                    THIS  BSS     1         ADDR OF DOUBLE BFR, BFR 1   J0802620
                    NEXT  BSS     1         ADDR OF DOUBLE BFR, BFR 2   J0802630
                          HDNG              DUP CORE PARAMETERS         J0802640
                    DISKZ EQU     DZ000     DISKZ ENTRY POINT           J0802650
                    B     EQU     $ZEND-2                               J0802660
                    DMPLC EQU     B         IOAR CORE ADDR FOR DMPLT    J0802670
                    EXITC EQU     B         IOAR CORE ADDR FOR DEXIT    J0802680
                    MUPC  EQU     B         IOAR CORE ADDR FOR MUP  2-8 J0802690
                    DCTL  EQU     B+/1002   ENTRY ADDRESS OF DCTL       J0802700
                    DCTLC EQU     B+/1000   IOAR CORE ADDR FOR DCTL     J0802710
                    WSDC  EQU     B+/2000   IOAR CORE ADDR FOR STORE    J0802720
                    DUMPC EQU     B+/4000   IOAR CORE ADDR FOR DDUMP    J0802730
                    DUPCO EQU     /7DB0     ADDR OF RESIDENT DUPCO      J0802740
                    CATCO EQU     /7F20-2   ADDR OF DCOM IOAR HEADER    J0802750
                    *                                                 * J0802760
                    *  DUPCO ENTRY POINTS...USED WITH INDIRECT BSI    * J0802770
                    *                                                 * J0802780
                          ORG     DUPCO                                 J0802790
                    BINEB BSS     1         CONVERSION BINARY TO EBCDIC J0802800
                    WRTDC BSS     1         WRITE DCOM(S) SUBROUTINE    J0802810
                    ENTER BSS     1         SAVE XR-S AND CONDITIONS    J0802820
                    GET   BSS     1         READ FROM DISK USING DISKZ  J0802830
                    LEAVE BSS     1         HANDLES ALL EXITS FROM DUP  J0802840
                    LINE  BSS     1         SPACES PRINTER 1 LINE       J0802850
                    MASK  BSS     1         INHIBITS KB INT REQUEST     J0802860
                    MDUMP BSS     1         PRINTS SELECTED CORE LOC-S  J0802870
                    PAGE  BSS     1         SKIPS TO NEXT PAGE          J0802880
                    PHID  BSS     1         RECORDS PHASE ID            J0802890
                    PHIDM BSS     1         RECORDS PHASE AND MODIFIER  J0802900
                    PRINT BSS     1         USE SYS PR SUBR TO PRINT    J0802910
                    PUT   BSS     1         WRITES TO DISK USING DISKZ  J0802920
                    REST  BSS     1         RESTORE CATCO,GO TO DCTL    J0802930
                    RTURN BSS     1         RESTORE XR-S AND CONDITIONS J0802940
                    *                                                 * J0802950
                    *  INPUT/OUTPUT PARAMETERS , CORE ADDRESSES       * J0802960
                    *                                                 * J0802970
                    BUF6  EQU     DUPCO-/1F ADDR OF PAGE HEADING BUFFER J0802980
                    PRPNT EQU     BUF6-/141 IOAR ADDR FOR PRINC. PTR    J0802990
                    IOADR EQU     BUF6-/38B START OF I/O INTERFACE      J0803000
                    GETHO EQU     IOADR+4   ENTRY FOR READING HOLL TYPE J0803010
                    GETBI EQU     IOADR+5   ENTRY FOR READING BINARY    J0803020
                    PACKB EQU     IOADR+6   ENTRY TO PACK BINARY        J0803030
                    PCHBI EQU     IOADR+7   ENTRY TO PUNCH BINARY       J0803040
                    BUF1  EQU     IOADR-/51 ADDR OF NEXT BUFFER         J0803050
                    BUF2  EQU     BUF1-/52  ADDR OF THIS BUFFER         J0803060
                    BUF3  EQU     BUF2-/3E  ADDR OF PACKED EBC BUFFER   J0803070
                    BUF4  EQU     BUF3-/52  ADDR OF CONTROL RCD BUFFER  J0803080
                    BUF5  EQU     IOADR-/284   ADDR OF LET SCTR BUFFER  J0803090
                    BUF7  EQU     BUF5-/7142   ADDR OF STORE/DUMP BFR   J0803100
                          HDNG    DUP DEFINE PROLOGUE                   J0803110
                    *************************************************** J0803120
                    *STATUS - VERSION 2, MODIFICATION 12              * J0803130
                    *                                                 * J0803140
                    *FUNCTION/OPERATION-                              * J0803150
                    *     DUP DEFINE INITIALLY DEFINES A FIXED AREA,  * J0803160
                    *     INCREASES OR DECREASES AN EXISTING FIXED    * J0803170
                    *     AREA, AND VOIDS THE FORTRAN COMPILER, THE   * J0803180
                    *     ASSEMBLER, THE RPG COMPILER, OR THE COBOL2-9* J0803190
                    *     COMPILER AS DIRECTED BY DUP CONTROL REC. 2-9* J0803200
                    *     FIXED AREA OPERATIONS MAY BE DONE ON ANY    * J0803210
                    *     CARTRIDGE.  VOID OPERATIONS ARE RESTRICTED  * J0803220
                    *     TO LOGICAL DRIVE 0.                         * J0803230
                    *                                                 * J0803240
                    *ENTRY POINT-  B+2 -ENTERED FROM DUP CONTROL.     * J0803250
                    *                                                 * J0803260
                    *INPUT-  DATA EXTRACTED BY DUP CONTROL FROM A DUP * J0803270
                    *     CONTROL RECORD AND SAVED IN CATCO.          * J0803280
                    *                                                 * J0803290
                    *OUTPUT-  PRINTED MESSAGE IN CASE OF ERRORS NOT   * J0803300
                    *     HANDLED BY DEXIT.  SIGN OFF MESSAGE IS      * J0803310
                    *     PRINTED AT SUCCESSFUL COMPLETION OF OPER-   * J0803320
                    *     ATIONS.                                     * J0803330
                    *                                                 * J0803340
                    *EXTERNAL REFERENCES-                             * J0803350
                    *     BINEB   -BINARY TO EBCDIC CONVERSION        * J0803360
                    *     GET     -READ FROM DISK                     * J0803370
                    *     PUT     -WRITE TO DISK                      * J0803380
                    *     PHID    -RECORD PHASE ID NUMBER             * J0803390
                    *     PHIDM   -TO MARK PROGRESS OF OPERATIONS     * J0803400
                    *     PRINT   -TO PRINT AN ERROR MESSAGE          * J0803410
                    *     MASK    -PREVENT KEYBOARD INTERRUPT UNTIL   * J0803420
                    *             *PROGRAM RETURNS TO DUP CONTROL.    * J0803430
                    *     WRTDC   -UPDATE DCOM SECTOR(S)              * J0803440
                    *                                                 * J0803450
                    *   SWITCHES AND INDICATORS-                      * J0803460
                    *     $CIBA   -CORE IMAGE BUFFER ADDRESS          * J0803470
                    *     $DBSY   -DISK BUSY INDICATOR                * J0803480
                    *     $FPAD   -FILE PROTECT ADDRESS               * J0803490
                    *     $ULET   -SECTOR ADDRESS OF LET              * J0803500
                    *     $ZEND-3 -CIL SECTOR ADDRESS IN DISKZ        * J0803510
                    *                                                 * J0803520
                    *     #ANDU   -END OF UA (ADJ)                    * J0803530
                    *     #BNDU   -END OF UA (BASE)                   * J0803540
                    *     #CIAD   -LOC IN SCTR 0 OF CIL SCTR ADDR     * J0803550
                    *     #CIBA   -CORE IMAGE BUFFER ADDRESS          * J0803560
                    *     #CIDN   -LOGICAL CARTRIDGE ID               * J0803570
                    *     #CSHN   -CUSHION SIZE IN SECTORS            * J0803580
                    *     #DCOM   -SECTOR ADDRESS OF DCOM             * J0803590
                    *     #FLET   -SECTOR ADDRESS OF FLET             * J0803600
                    *     #FPAD   -FILE PROTECT ADDRESS               * J0803610
                    *     #SCRA   -SCTR ADDR OF SUP CTRL RECORD AREA  * J0803620
                    *     #SYSC   -SYSTEM CARTRIDGE INDICATOR         * J0803630
                    *     #TODR   -CARTRIDGE ON WHICH TO DEFINE FXA   * J0803640
                    *     #ULET   -SECTOR ADDRESS OF LET              * J0803650
                    *     #WSCT   -SIZE OF PROGRAM IN WS              * J0803660
                    *                                                 * J0803670
                    *EXITS-                                           * J0803680
                    *     LEAVE   -EXIT FROM DEFINE TO REQUEST ERROR  * J0803690
                    *             *OR SIGN-OFF PRINTOUT BY DEXIT.     * J0803700
                    *             EXITS WITH ERROR CODE IN RANGE 80   * J0803710
                    *             *THRU 88, SIGN-OFF 101 THRU 103     * J0803720
                    *     REST    -RETURN TO DUP CONTROL.             * J0803730
                    *                                                 * J0803740
                    *                                                 * J0803750
                    *TABLES/WORK AREAS                                * J0803760
                    *     CATCO   -CONCATENATED COMMON AREA OF DUPCO  * J0803770
                    *     BUF5    -ADDRESS OF 320-WORD DISK BUFFER    * J0803780
                    *     BUF7    -ADDRESS OF 320-WORD DISK BUFFER    * J0803790
                    *     TEMP1   -EBCDIC OUTPUT OF BINEB SUBROUTINE  * J0803800
                    *                                                 * J0803810
                    *                                                 * J0803820
                    *                                                 * J0803830
                    *ATTRIBUTES-  REUSABLE                            * J0803840
                    *                                                 * J0803850
                    *NOTES-                                           * J0803860
                    *     TWO PATCH AREAS AVAILABLE.  PATCH AREA      * J0803870
                    *     NO. 1 JUST PRECEDES BUF7 AND PATCH AREA NO. * J0803880
                    *     2 JUST PRECEDES BUF5 ON A 4K SYSTEM.        * J0803890
                    *                                                 * J0803900
                    *************************************************** J0803910
                          HDNG    DUP DEFINE   1130 MONITOR VERSION 2   J0803920
                          ORG     B                                     J0803930
                          DC      0                                     J0803940
                          DC      -8         PHASE ID 8                 J0803950
                          DC      DEFOR-*+1 RELATIVE LOC OF SLET DATA   J0803960
                          DC      8         NO. OF SLET ENTRIES     2-9 J0803970
                          ORG     *-2                                   J0803980
                    *************************************************** J0803990
                    *                                                   J0804000
                    *             FUNCTIONS                             J0804010
                    *                 VOID FORTRAN                      J0804020
                    *                 VOID ASSEMBLER                    J0804030
                    *                 VOID RPG                        * J0804040
                    *                 VOID COBOL                    2-9 J0804050
                    *                 DEFINE FIXED AREA                 J0804060
                    *                 INCREASE FIXED AREA               J0804070
                    *                 DECREASE FIXED AREA               J0804080
                    *                                                   J0804090
                    *************************************************** J0804100
                    *                                                   J0804110
                    *                 XR1 POINTS TO C UPON ENTRY        J0804120
                    *                                                   J0804130
                    *************************************************** J0804140
                          NOP                                           J0804150
                          BSI  I  PHID       RECORD PHASE ID            J0804160
                          DC      8                                     J0804170
                          BSI  I  MASK       MASK KB INTERRUPT          J0804180
                          MDX     DE400      TO PROCESS .TO. DRIVE      J0804190
                    *                                                   J0804200
                    GETX  DC      *-*        ENTRY                      J0804210
                          STX   1 G7+1                                  J0804220
                          STX   2 G8+1       SAVE XR2                   J0804230
                          STX   3 G9+1                                  J0804240
                          LD    3 1          THE DRIVE NO. IS PLACED    J0804250
                          OR   L  DE485      **WITH SCTR ADDR BEFORE    J0804260
                          STO   3 1          **DISK I/O OPERATIONS      J0804270
                          LDX  L1 C          POINT XR1 TO C             J0804280
                    BSIGT BSI  I  GET        READ FROM DISK             J0804290
                          NOP                                           J0804300
                    G7    LDX  L1 *-*        RESTORE INDEX REGISTER     J0804310
                    G8    LDX  L2 *-*        RESTORE POINTER            J0804320
                    G9    LDX  L3 *-*        RESTORE INDEX REGISTER     J0804330
                          BSC  I  GETX       RETURN                     J0804340
                    *                                                   J0804350
                    PUTX  DC      *-*        ENTRY FOR PUT TO DISK      J0804360
                          LD      DUPUT                                 J0804370
                          STO     BSIGT+1    REPLACE ADDR OF GET W/PUT  J0804380
                          BSI     GETX       WRITE TO DISK              J0804390
                          LD      DUGET      SET GET ADDR BACK IN       J0804400
                          STO     BSIGT+1                               J0804410
                          BSC  I  PUTX       RETURN                     J0804420
                    *                                                   J0804430
                    DUPUT DC      PUT        ADDRESS OF PUT ENTRY       J0804440
                    DUGET DC      GET        ADDRESS OF GET ENTRY       J0804450
                    *                                                   J0804460
                          HDNG    DUP DEFINE   1130 MONITOR VERSION 2   J0804470
                    *************************************************** J0804480
                    *                                                   J0804490
                    *     THE RELOAD TABLE SECTOR WILL, ON A VOID       J0804500
                    *     FUNCTION, BE READ INTO CORE OVERLAPPING       J0804510
                    *     DE400 THROUGH DE400 PLUS 321.                 J0804520
                    *                                                   J0804530
                    *************************************************** J0804540
                    *                                                   J0804550
                          BSS  E  0                                     J0804560
                    DE400 LDX  L2 DECST      RESET XR2 POINTER          J0804570
                          LDX  L3 BUF5                                  J0804580
                    *                                                   J0804590
                    DSKZ  EQU     150        PHASE ID OF DISKZ          J0804600
                    CILDR EQU     160        PH ID OF CIL               J0804610
                    *                                                   J0804620
                    #RIAD EQU     2          SCTR WITH RESIDENT IMAGE   J0804630
                    #SLET EQU     3          SCTR WITH SLET             J0804640
                    #RTBL EQU     6          SCTR WITH RELOAD TABLE     J0804650
                    *                                                   J0804660
                    *************************************************** J0804670
                    *                                                   J0804680
                    *     DETERMINE THE DRIVE NO. THAT WILL BE USED     J0804690
                    *     IN IOAR SECTOR ADDRESS OF ALL DISK I/O.       J0804700
                    *                                                   J0804710
                    *************************************************** J0804720
                    DE480 LD    1 #TODR      FETCH NO. 0 THROUGH 4      J0804730
                          BSC  L  DE481,+Z   BR IF DEFAULT CONDITION    J0804740
                          LD    2 DECDC-D    FETCH ADDR OF C            J0804750
                          A     1 #TODR      ADD LOGICAL DRIVE NO.      J0804760
                          STO   2 DECDC-D    SAVE FOR QUINT. POINTER    J0804770
                          LD    1 #TODR      RELOAD DRIVE NUMBER        J0804780
                          STO   2 DE488-D                               J0804790
                          SLA     12         DR CODE TO LEFT 4 BITS     J0804800
                          STO   2 DE485-D                               J0804810
                          LDX  I1 DECDC      POINT TO QUINTUPLE ENTRY   J0804820
                    *                                                   J0804830
                    DE481 LD    1 #ULET      REMOVE DRIVE NO.           J0804840
                          AND   2 DEFFF-D                               J0804850
                          STO   2 DE#UL-D                               J0804860
                    *                                                   J0804870
                          LD    1 #FLET                                 J0804880
                          AND   2 DEFFF-D                               J0804890
                          STO   2 DE#FL-D                               J0804900
                    *                                                   J0804910
                          LD    1 #CIBA                                 J0804920
                          AND   2 DEFFF-D                               J0804930
                          BSC  L  DE482,Z                           2-4 J0804940
                          LD    1 #ULET      IF CIB DELETED,USE BEG 2-4 J0804950
                          STO   3 1          *OF UA INSTEAD OF #CIBA2-4 J0804960
                          LD    2 K320-D     PREPARE TO READ 1ST    2-4 J0804970
                          STO   3 0          *SECTOR OF LET         2-4 J0804980
                          BSI     GETX                              2-4 J0804990
                          LD    3 3          GET ADDR OF UA         2-4 J0805000
                    DE482 STO   2 DE#CI-D                               J0805010
                    *                                                   J0805020
                          LD    1 #FPAD                                 J0805030
                          AND   2 DEFFF-D    REMOVE DRIVE NUMBER        J0805040
                          STO   2 DE#FP-D    SAVE FPAD WITHOUT DR NO.   J0805050
                    *                                                   J0805060
                          LDX  L1 C          POINT TO CATCO             J0805070
                          LDD   2 DECOM-D-1  DCOM DISK ADDRESS          J0805080
                          STD   3 0                                     J0805090
                          BSI     GETX       READ DCOM SECTOR           J0805100
                          LD    3 #SYSC+2+/80  NON-Z IF SYSTEM PACK     J0805110
                          EOR   2 DEVS2-D                               J0805120
                          SRA     8          IGNORE MODIFICATION LEVEL  J0805130
                          STO   2 DEVS2-D    IF RESULT IS ZERO, THIS    J0805140
                    *                        *IS A SYSTEM PACK.         J0805150
                    *                                                   J0805160
                    *************************************************** J0805170
                    *     DETERMINE FUNCTION REQUESTED                  J0805180
                    *************************************************** J0805190
                    *                                                   J0805200
                          LD    1 ASMSW      TEST FOR VOID ASSEMBLER    J0805210
                          BSC  L  DEVAM,Z    BRANCH IF YES              J0805220
                    *                                                   J0805230
                          LD    1 FORSW      TEST FOR VOID FORTRAN      J0805240
                          BSC  L  DEVFN,Z    BRANCH IF YES              J0805250
                    *                                                   J0805260
                          LD    1 RPGSW     TEST FOR VOID RPG/COBOL 2-9 J0805270
                          BSC  L  DEVRG,-Z  BR IF VOID RPG REQUEST  2-9 J0805280
                          BSC  L  DEVCB,Z   BR IF VOID COBOL REQUEST2-9 J0805290
                    *                                                   J0805300
                          LD    1 FXSW       FALL THRU TO ERROR IF OFF  J0805310
                          BSI  L  DE502,+-   BR IF NO DFN SWITCHES ON   J0805320
                    *************************************************** J0805330
                    *                                                   J0805340
                    *             DE500 THRU DE500+4 IS USED FOR A      J0805350
                    *             WORK AREA TO SETUP MESSAGE WHEN FXA   J0805360
                    *             SIGN-OFF DATA IS PREPARED.            J0805370
                    *                                                   J0805380
                    *************************************************** J0805390
                    DE500 LD    1 DATSW      SAVE CYLINDER COUNT        J0805400
                          STO   2 DETSW-D                               J0805410
                          LD    1 NEGSW      TEST NEGATIVE SWITCH       J0805420
                          BSI  L  DECFA,Z    BR TO DECREASE FXA         J0805430
                          LD    2 DETSW-D                               J0805440
                          S     2 K1-D                                  J0805450
                          LDX  I1 DECDC      POINT TO QUINTUPLE ENTRY   J0805460
                          BSC  L  DE506,-    BR IF 1 OR MORE CYLS       J0805470
                    *                                                   J0805480
                    DE502 NOP                                           J0805490
                          LDX   1 ERM4       SET UP ERROR MESSAGE       J0805500
                          BSI   2 SSEL-D     GO TO DISPLAY ERROR        J0805510
                    *                                                   J0805520
                    DE506 BSC  L  PRCD,-Z    PROCEED IF 2 OR MORE CYLS  J0805530
                    *                                                   J0805540
                          LD    1 #FLET      DEFINE 1 CYL OK IF FIXED   J0805550
                          AND   2 DEFFF-D    AREA WAS PREVIOUSLY THERE  J0805560
                          BSI  L  DE502,+-   *ELSE DISPLAY ERROR        J0805570
                    *                                                   J0805580
                    *************************************************** J0805590
                    *             CHECK FOR SUFFICIENT WS FOR THIS      J0805600
                    *               AMT OF FX A TO BE DEFINED           J0805610
                    *************************************************** J0805620
                    *                                                   J0805630
                    PRCD  LD    2 DETSW-D    NO. OF CYLS TO BE DEFINED  J0805640
                    *                                                   J0805650
                    DE522 NOP                                           J0805660
                          SLA     3          SECTORIZE COUNT            J0805670
                          STO   2 NOCYL-D    NO.OF SKTRS ADDED TO FXD   J0805680
                          LD    1 #WSCT      BYTE CNT OF PROG IN WS     J0805690
                          BSC     Z                                     J0805700
                          A     2 K16-D      ADD 1 SCTR IF NON-ZERO     J0805710
                          SRA     4                                     J0805720
                          A     2 DE#FP-D    ADD FILE PROTECTED SCTR    J0805730
                          S     2 K1-D                                  J0805740
                          STO   2 SUBSA-D    SECTOR ADDRESS             J0805750
                          A     2 NOCYL-D                               J0805760
                          STO   2 SVFPA-D                               J0805770
                          LD    2 H0640-D    CHECK IF ANY PROGRAM IN    J0805780
                          S     2 DE#FP-D    *WS WILL BE LOST BY THIS   J0805790
                          S     2 NOCYL-D    *MOVE                      J0805800
                          BSC  L  DE245,+Z  BR IF CNT TOO LARGE    2-12 J0805805
                          SLA     +4                                    J0805810
                          S     1 #WSCT      DB CNT OF PROG IN WS       J0805820
                          BSC  L  PRTYB,-    FALL THRU IF CNT TOO LARGE J0805830
                    *************************************************** J0805840
                    *                                                   J0805850
                    *             CALCULATE MAX CYLS AVAILABLE          J0805860
                    *                                                   J0805870
                    *************************************************** J0805880
                    DE245 LD    2 H0640-D   ADDR OF LAST SECTOR    2-12 J0805890
                          S     2 DE#FP-D    FILE PROTECT ADDR          J0805900
                          SLA     4          FORM BYTES                 J0805910
                          S     1 #WSCT      SUBT DATA IN WS            J0805920
                    DE246 SRA     7          CYLINDERIZE BYTE COUNT     J0805930
                          STO     DE500+4    SAVE HEX COUNT             J0805940
                          BSI     DE247      BR TO CONVERT HEX TO DEC   J0805950
                          MDX     DE252      REJOIN MAINLINE            J0805960
                    *                                                   J0805970
                    DE247 DC      *-*        ENTRY- BINARY TO DECIMAL   J0805980
                          LDX   1 3          THREE DECIMAL DIGITS       J0805990
                          LDX  L3 DE500      POINT TO WORK AREA         J0806000
                          LD      DE500+4    CYLINDER CNT IN HEX        J0806010
                          NOP                                           J0806020
                          SRT     16                                    J0806030
                    DE249 D     2 K10-D      START CONVERSION TO DEC.   J0806040
                          RTE     16         REMAINDER TO ACCUMULATOR   J0806050
                          OR    2 HF0F0-D    MAKE EBCDIC OF BITS 8-15   J0806060
                          STO   3 3          TO OUTPUT AREA             J0806070
                          SLA     16                                    J0806080
                          MDX   3 -1         DECR OUTPUT ADDRESS        J0806090
                          MDX   1 -1         LOOP COUNTER               J0806100
                          MDX     DE249      REPEAT                     J0806110
                    *                                                   J0806120
                    *                        PACK OUTPUT TOGETHER       J0806130
                    *                                                   J0806140
                          LD      DE500+2    PACKED EBCDIC              J0806150
                          SLA     8                                     J0806160
                          OR      DE500+3                               J0806170
                          RTE     16                                    J0806180
                          LD    2 HF0F0-D                               J0806190
                          OR      DE500+1                               J0806200
                          LDX  L1 C          RESET XR1                  J0806210
                          BSC  I  DE247      RETURN                     J0806220
                    *                                                   J0806230
                    DE252 STD  L  DE712      PACKED EBCDIC              J0806240
                          BSI  I  PRINT                                 J0806250
                          DC      DE711      DISPLAY CYLS AVAILABLE     J0806260
                    *                                                   J0806270
                          LDX   1 ERM7       DISPLAY DECREASE COUNT     J0806280
                          BSI   2 SSEL-D     *AND EXIT THRU LEAVE       J0806290
                    *                                                   J0806300
                    PRTYB LDX  L3 BUF5       POINT XR3 TO I/O BUFFER    J0806310
                          LD    2 K320-D     SET WD COUNT               J0806320
                          STO   3 0                                     J0806330
                          BSC  L  MVDSK      TO BEGIN EXPANSION         J0806340
                    *************************************************** J0806350
                    *                                                   J0806360
                    *             WILL RETURN TO DKMVD                  J0806370
                    *             AFTER DCOM IMAGE IN CATCO UPDATED.    J0806380
                    *                                                   J0806390
                    *************************************************** J0806400
                    FINSH LD    2 NOCYL-D    SECTOR COUNT               J0806410
                          STO   2 ADRSV-D                               J0806420
                    *                                                   J0806430
                          BSI  L  UPDLT      UPDATE THE LET HEADER.S.   J0806440
                    *                                                   J0806450
                    *************************************************** J0806460
                    *     XR1 HAS BEEN MODIFIED BY DRIVE NUMBER         J0806470
                    *************************************************** J0806480
                    *                                                   J0806490
                          LD    2 DE#FL-D    FLET SCTR ADRS             J0806500
                          A     2 K8-D       *PLUS 8 FOR FLET CYL       J0806510
                          STO   2 ADRSV-D    *EQUALS SCTR ADDR OF FXA   J0806520
                    *                                                   J0806530
                    DE312 BSI  L  UPDCM      UPDATE DCOM ON DISK        J0806540
                    *                                                   J0806550
                    CAFXA LDX  I1 DECDC      POINT TO QUINTUPLE ENTRY   J0806560
                          LD    1 #FLET                                 J0806570
                          AND   2 DEFFF-D    REMOVE DRIVE NUMBER        J0806580
                          BSC  L  DE320,+-   NO FXA LEFT IF ZERO FLET   J0806590
                    *                                                   J0806600
                          LD    1 #CIBA                                 J0806610
                          AND   2 DEFFF-D    CHECK #CIBA AND FALL   2-4 J0806620
                          BSC  L  DE315,Z    *THRU IF CIB DELETED   2-4 J0806630
                          LD    1 #ULET      PREPARE TO USE BEG OF  2-4 J0806640
                          STO   3 1          *UA INSTEAD OF #CIBA   2-4 J0806650
                          BSI  L  GETX       *IF #CIBA IS ZERO      2-4 J0806660
                          LD    3 3                                 2-4 J0806670
                    DE315 OR    2 DE485-D    OR IN DRIVE CODE       2-4 J0806680
                          S     1 #FLET                                 J0806690
                          SRT     16                                    J0806700
                          D     2 K8-D       FORM CYLINDER COUNT        J0806710
                          S     2 K1-D       SUBTRACT FLET CYLINDER     J0806720
                    DE320 STO     DE500+4    HEX RESULT                 J0806730
                          BSI     DE247      HEX TO DECIMAL             J0806740
                          STD  L  DE703+1    CYLINDERS FXA              J0806750
                          LD    2 DEDBA-D                               J0806760
                          BSI  I  BINEB      BINARY TO EBCDIC           J0806770
                          LDD   1 TEMP1      FETCH EBCDIC               J0806780
                          STD  L  DE703+9                               J0806790
                          LDX  I1 DECDC      POINT TO QUINTUPLE ENTRY   J0806800
                          LD    1 #FLET                                 J0806810
                          LDX  L1 C          RESET XR1 FOR CATCO        J0806820
                          BSI  I  BINEB      BINARY TO EBCDIC           J0806830
                          LDD   1 TEMP1      LOAD RESULT                J0806840
                          STD  L  DE704+9    SHOULD BE EVEN ADDR        J0806850
                          LD      CIDXX      CARTRIDGE ID               J0806860
                          BSI  I  BINEB      BINARY TO EBCDIC           J0806870
                          LDD   1 TEMP1                                 J0806880
                          STD  L  DE702+4    SHOULD BE EVEN ADDR        J0806890
                    *                                                   J0806900
                          NOP                                           J0806910
                          BSI  I  PRINT      GO TO PRINT MESSAGE        J0806920
                          DC      DEBBM      SIGN OFF MESSAGE FOR FXA   J0806930
                    *                                                   J0806940
                          BSI  I  REST       RETURN TO DUP CONTROL      J0806950
                    *                                                   J0806960
                    CIDXX DC      *-*        CARTRIDGE ID NUMBER        J0806970
                    *************************************************** J0806980
                    *                                                   J0806990
                    * COMPLETION OF PROCESS WITH A PREVIOUS FIXED AREA  J0807000
                    *                                                   J0807010
                    *************************************************** J0807020
                    PRVFA LD    2 DE#FL-D                               J0807030
                    *                                                   J0807040
                    *     XR1 HAS BEEN MODIFIED BY DRIVE NUMBER         J0807050
                    *                                                   J0807060
                    DE333 STO  L  BUF5+1     FETCH THE 1ST FLET SECTOR  J0807070
                          BSI  L  GETX       READ SECTOR                J0807080
                          LD    3 2+4        TEST WORD 5                J0807090
                          NOP                NEXT SCTR OF FLET IF NON-Z J0807100
                          BSC     Z          SKIP IF LAST               J0807110
                          MDX     DE333      TRY NEXT SECTOR            J0807120
                    *                                                   J0807130
                          LDX  L2 DECST      RESET POINTER              J0807140
                          LD    2 K320-D     LOCATE POSITION OF WORD    J0807150
                          S     3 2+3        *FOLLOWING LAST ENTRY      J0807160
                          A     2 BUFAD-D                               J0807170
                          STO   2 DFTMP-D    POSITION IN DISK BUFFER    J0807180
                          LDX  I2 DFTMP      INITIALIZE XR2             J0807190
                          LD    2 -3         BACKUP TO 1DUMY ENTRY      J0807200
                          EOR  L  DUMNM      TEST IF PRESENT            J0807210
                          BSC  L  PDMY,+-    BR TO PREV DUMMY IF SO     J0807220
                          NOP                                           J0807230
                    DE345 NOP                TRACE WORD                 J0807240
                          LDX   1 ERM70      LAST ENTRY NOT 1DUMY       J0807250
                          BSI  L  SSEL       BR TO SET UP ERROR & LEAVE J0807260
                    *                                                   J0807270
                    *     C/XR2 IS ADDR OF 1ST EMPTY ENTRY LOC          J0807280
                    *                                                   J0807290
                    PDMY  LD    2 -1         STORE DB COUNT OF          J0807300
                          STO  L  ADRSV      *AVAIL FXA FROM OLD        J0807310
                    *                        *DUMMY ENTRY               J0807320
                    PDMY3 MDX   2 -3         REWRITE THE FLET DUMMY     J0807330
                          BSI  L  DUMMY      FILL IN DUMMY ENTRY W/NAME J0807340
                          BSI  L  PUTX       PUT 1 SKTR                 J0807350
                          LDX  L2 DECST      RESET POINTER              J0807360
                          LD    2 K320-D     RESTORE WD COUNT           J0807370
                          STO   3 +0                                    J0807380
                          BSC  L  FINSH      TO UPDATE LET AND DCOM     J0807390
                          HDNG    DECREASE FIXED AREA                   J0807400
                    DECFA DC      *-*        ENTRY                      J0807410
                          LDX  L3 BUF5                                  J0807420
                          LD    2 DE#FL-D    CHECK FOR FXA PRESENT      J0807430
                          BSC  L  DE067,Z    BR IF PRESENT              J0807440
                          LDX   1 ERM6       SET UP ERROR MESSAGE       J0807450
                          BSI   2 SSEL-D     TO DISPLAY ERROR           J0807460
                    *                                                   J0807470
                    DE067 LD    2 DETSW-D    LOAD CYLINDER OCUNT        J0807480
                          STO   2 CYL-D                                 J0807490
                          SLA     +3                                    J0807500
                          STO   2 SKT-D      SECTOR COUNT               J0807510
                          SLA     +4                                    J0807520
                          STO   2 DBS-D      BYTE COUNT                 J0807530
                          LDX  I1 DECDC      POINT TO QUINTUPLE ENTRY   J0807540
                          LD    1 #FLET      FETCH SCTR ADDR OF FLET    J0807550
                          STO   3 +1         *AND SETUP FOR GET         J0807560
                          LD    2 K320-D                                J0807570
                          STO   3 +0                                    J0807580
                    *                                                   J0807590
                    *************************************************** J0807600
                    *                                                   J0807610
                    NXSKT BSI  L  GETX       TO READ IN A SECTOR        J0807620
                          LD    3 +6         TEST FOR LAST FLET SCTR    J0807630
                          NOP                                           J0807640
                          BSC  L  LSKT,+-    BRANCH IF YES              J0807650
                          MDX  L  BUF5+1,1   *ELSE GET NEXT             J0807660
                          MDX     NXSKT                                 J0807670
                    *                                                   J0807680
                    *************************************************** J0807690
                    *                                                   J0807700
                    LSKT  LD   L  K317       SCTR LGTH MINUS 1 ENTRY    J0807710
                          S     3 +5         SUBT AVAILABLE WORDS       J0807720
                          A     2 BUFAD-D    CORE ADDR OF 1ST WORD      J0807730
                          STO   2 TMPST-D    STORE TEMPORARILY          J0807740
                          LD   I  TMPST      LOAD 1ST WD OF LAST ENTRY  J0807750
                          EOR   2 DUMNM-D    CHECK FOR 1DUMY            J0807760
                          BSC  L  DE071,+-   BR IF PRESENT              J0807770
                          NOP                                           J0807780
                    *                        1DUMY ENTRY IS MISSING     J0807790
                          BSI     DE345      BR TO SET UP ERROR         J0807800
                    *                                                   J0807810
                    DE071 MDX  L  TMPST,+2   FETCH DBS REPRESENTED      J0807820
                          LD   I  TMPST      *BY THIS ENTRY.            J0807830
                          S     2 DBS-D      DECR COUNT IN 1DUMY        J0807840
                          STO   2 DEDBA-D    SAVE FOR SIGN OFF          J0807850
                    *                                                   J0807860
                          BSC  L  DE073,-    BR IF ENOUGH CYLS AVAIL    J0807870
                          LD    3 5          LOAD AVAIL WDS FROM HDR    J0807880
                          A     3 2          ADD 0010 IF 1ST FLET SCTR  J0807890
                          S     2 K0148-D    TEST FOR SINGLE ENTRY IN   J0807900
                    *                        *ONLY FLET SECTOR          J0807910
                          BSC  L  DE236,Z    BR IF CONDITIONS NOT MET   J0807920
                          LD   I  TMPST      FETCH DBS OF FXA AVAIL     J0807930
                          SRA     7          CONVERT TO CYLINDERS       J0807940
                          STO   2 DETSW-D    RESET DETSW                J0807950
                          MDX     DE067      REPEAT DETSW PROCESSING    J0807960
                    *                                                   J0807970
                    DE236 LD   I  TMPST      FETCH DBS OF FXA AVAIL     J0807980
                          BSC  L  DE246                                 J0807990
                    DE073 BSC  L  DEQD,+-    BR IF EQUAL                J0808000
                          STO  I  TMPST      *ELSE PLACE NEW VALUE      J0808010
                    *                        *IN 1DUMY                  J0808020
                    *                                                   J0808030
                    *                        XR1 POINTS TO C            J0808040
                    *************************************************** J0808050
                          NOP                                           J0808060
                    RSM1  BSI  L  PUTX       WRITE BACK TO DISK         J0808070
                          LD    2 DE#FL-D                               J0808080
                          A     2 K8-D       BEGINNING OF FXA           J0808090
                          SLA     +4                                    J0808100
                          LDX  L1 C          POINT XR1 TO C             J0808110
                          STO   1 DBADR      DB ADDR                    J0808120
                    RSM2  LD    2 DE#CI-D    SET UP FROM ADRS TO MOVE   J0808130
                          STO   2 FAD2-D                                J0808140
                          S     2 SKT-D                                 J0808150
                          STO   2 TAD2-D     SETUP ADDR TO MOVE TO      J0808160
                    *                                               2-4 J0808170
                          LD    2 DE#CI-D    IF CIB DELETED AND MAX 2-4 J0808180
                          S     2 H0640-D    *FXA IS DEFINED WITH NO2-4 J0808190
                          BSC  L  RSM3,+-    *UA PRESENT,DO NOT MOVE2-4 J0808200
                    *                                               2-4 J0808210
                          BSI  L  MOVE       MOVE CIB THRU USERS AREA   J0808220
                    *                                                   J0808230
                    RSM3  NOP                COME HERE WITH ZERO IN ACC J0808240
                          S     2 SKT-D                                 J0808250
                          STO   2 NOCYL-D                               J0808260
                          STO   2 ADRSV-D                               J0808270
                    *                        XR1 POINTS TO QUINTUPLE    J0808280
                          SRA     16                                    J0808290
                          STO   2 SKT-D                                 J0808300
                          BSC  L  DKMVD      TO UPDATE DCOM IN CATCO    J0808310
                    *                                                   J0808320
                    DE085 BSI     UPDLT      UPDATE LET HEADER(S)       J0808330
                    *                                                   J0808340
                    *************************************************** J0808350
                    *                                                   J0808360
                    *             NEW FXA WILL BE CALCULATED            J0808370
                    *             DBS AVAIL ARE IN DEDBA                J0808380
                    *                                                   J0808390
                          BSC  L  DE312      TO UPDATE DCOM ON DISK     J0808400
                    *                                                   J0808410
                    *************************************************** J0808420
                    *                                                   J0808430
                    DEQD  LD    3 +5         TEST WHETHER 1DUMY IS THE  J0808440
                          S     2 K312-D     *SOLE ENTRY IN THIS SCTR   J0808450
                          BSC  L  SOLEN,+-   BR TO SOLE ENTRY IF YES    J0808460
                    *                                                   J0808470
                          SLA     16         *ELSE SET COUNT IN 1DUMY   J0808480
                          LDX  I2 TMPST      *TO 0                      J0808490
                          STO   2 +0                                    J0808500
                          LDX  L2 DECST      RESET XR2 TO CONSTANTS     J0808510
                          MDX     RSM1       REJOIN MAINLINE            J0808520
                    *                                                   J0808530
                    *************************************************** J0808540
                    *                                                   J0808550
                    SOLEN SLA     +16        SOLE ENTRY IN SECTOR, SO   J0808560
                          LDX   2 8          *ZERO OUT THE 08 WDS OF    J0808570
                    LOOP2 STO  L2 BUF5+1     *DUMMY ENTRY AND SKTR HDR. J0808580
                          MDX   2 -1                                    J0808590
                          MDX     LOOP2                                 J0808600
                    *                                                   J0808610
                          LDX  L2 DECST      RESET XR2 TO CONSTANTS     J0808620
                          BSI  L  PUTX       WRITE TO DISK              J0808630
                          NOP                                           J0808640
                          LD    3 +1         TEST FOR 1ST FLET SCTR     J0808650
                          S     2 DE#FL-D                               J0808660
                          AND   2 DEFFF-D    MASK OUT DRIVE CODE        J0808670
                          BSC  L  FSKT,+-    GO TO FSKT IF YES          J0808680
                          MDX  L  BUF5+1,-1  *ELSE GET PREVIOUS SCTR    J0808690
                          BSI  L  GETX       *AND CHANGE INDR IN HDR    J0808700
                          SLA     +16                                   J0808710
                          STO   3 +6         INDICATE LAST SECTOR       J0808720
                    *                                                   J0808730
                          MDX     RSM1       REJOIN MAINLINE            J0808740
                    *                                                   J0808750
                    FSKT  MDX  L  SKT,+8     IF ALL OF FXA IS BEING     J0808760
                          LD    2 SKT-D      *DELETED, THEN ALSO DELETE J0808770
                          SLA     +4         *THE 8 SKTRS RESERVED FOR  J0808780
                          STO   2 DBS-D      *FLET                      J0808790
                          LD    1 #FLET      SET UP FOR                 J0808800
                          SLA     +4         *CONDITION OF DELETING     J0808810
                          STO   1 DBADR      *ALL OF FIXED AREA         J0808820
                          LD    2 DE485-D    FETCH DRIVE NUMBER         J0808830
                          STO   1 #FLET      INDICATE IN DCOM NO FLET   J0808840
                          MDX     RSM2       REJOIN MAINLINE            J0808850
                          HDNG    DEFINE...UPDATE LET                   J0808860
                    *************************************************** J0808870
                    *                                                   J0808880
                    *             UPDATE LET HDR WDS                    J0808890
                    *                                                   J0808900
                    *************************************************** J0808910
                    UPDLT DC      0                                     J0808920
                          LDX  I1 DECDC      POINT TO QUINTUPLE ENTRY   J0808930
                    *                                                   J0808940
                    *************************************************** J0808950
                    *     XR1 HAS BEEN MODIFIED BY DRIVE NUMBER         J0808960
                    *************************************************** J0808970
                    *                                                   J0808980
                          NOP                                           J0808990
                          LD    1 #ULET                                 J0809000
                          STO   3 1          SAD OF LET IN IOAR         J0809010
                    *                                                   J0809020
                    HDRFL BSI  L  GETX       GET 1ST SCTR OF LET        J0809030
                          NOP                                           J0809040
                          LD    3 6          LAST LET SCTR -REL WD 4-   J0809050
                          SLA     4          REMOVE DRIVE NUMBER        J0809060
                          BSC  L  SADFL,+-   YES                        J0809070
                    *                                                   J0809080
                          LD    3 6          TEST FOR FLET SCTR ADDR    J0809090
                          S     2 DE#FL-D                               J0809100
                          SLA     4          REMOVE DRIVE NUMBER        J0809110
                          BSC  L  SADFL,+-   BR IF LAST LET SE TOR      J0809120
                    *                                                   J0809130
                          LD    2 DEVS2-D    CHECK IF SYSTEM CART   2-2 J0809140
                          BSC  L  MUAAD,Z    BR IF NON-SYS          2-2 J0809150
                          LD    3 +6         OLD ADDR NEXT LET SCTR 2-2 J0809160
                          A     2 ADRSV-D    MODIFY TO NEW SCTR ADDR2-2 J0809170
                    *                                               2-2 J0809180
                          STO   3 6                                     J0809190
                    MUAAD LD    3 3          MODIFY UA ADDRESS          J0809200
                          A     2 ADRSV-D                               J0809210
                          STO   3 3                                     J0809220
                          BSI  L  PUTX       WRITE BACK LET SECTOR      J0809230
                          LD    3 +6         SET NEXT SCTR ADDR IN      J0809240
                          STO   3 +1         *PLACE FOR GET             J0809250
                          MDX     HDRFL      RETURN FOR OTHER SECTORS   J0809260
                    *                                                   J0809270
                    SADFL LD    1 #FLET                                 J0809280
                          AND   2 DEFFF-D    REVOVE DRIVE NUMBER        J0809290
                          STO   3 6          FLET SCTR ADDR IN LAST HDR J0809300
                          LD    3 3          FETCH OLD UA ADDR          J0809310
                          A     2 ADRSV-D    ADD SECTORS IN FXA         J0809320
                          STO   3 3          UPDATE REL WORD 1          J0809330
                          LD    2 K320-D     LOCATE THE DUMMY ENTRY     J0809340
                          S     3 2+3        RELATIVE WORD 3            J0809350
                          A     2 BUFAD-D                               J0809360
                          STO     LTEMP      SAVE FOR XR LOADING        J0809370
                          LDX  I2 LTEMP                                 J0809380
                          LD    2 -1         MODIFY UA REMAINING        J0809390
                          S    L  DEBES      SUBTRACT BYTES             J0809400
                          STO   2 -1                                    J0809410
                          LDX  L2 DECST      RESET XR2 TO CONSTANTS     J0809420
                          BSI  L  PUTX       PUT 1 SECTOR               J0809430
                          BSC  I  UPDLT      RETURN                     J0809440
                    *                                                   J0809450
                    LTEMP DC      *-*        REL LOC IN LAST LET SCTR   J0809460
                          HDNG    DEFINE...UPDATE DCOM                  J0809470
                    *************************************************** J0809480
                    *                                                   J0809490
                    *             UPDATE DCOM AND WRITE TO DSK          J0809500
                    *                                                   J0809510
                    *************************************************** J0809520
                    UPDCM DC      0                                     J0809530
                          NOP                                           J0809540
                    *                        XR1 POINTS TO QUINTUPLE    J0809550
                          LD    1 #CIDN                                 J0809560
                          STO  L  CIDXX      CATRIDGE ID NUMBER         J0809570
                          LD   L  DE485      FETCH DRIVE CODE           J0809580
                          STO     DE360                                 J0809590
                          STX   3 DE364+1    SAVE INDEX REGISTERS       J0809600
                          STX   2 DE366+1                               J0809610
                          LDX  L1 C          RESET XR1                  J0809620
                          LDX  L3 CATCO                                 J0809630
                          BSI  I  WRTDC      UPDATE DCOM THRU CATCO     J0809640
                    DE360 DC      *-*        TO BE SET W/DR CODE        J0809650
                    *                                                   J0809660
                    DE364 LDX  L3 *-*        RESTORE INDEX REGISTER     J0809670
                    DE366 LDX  L2 *-*        RESTORE INDEX REGISTER     J0809680
                          BSC  I  UPDCM      RETURN                     J0809690
                          HDNG    DEFINE...ENTER DUMMY ENTRY(S) IN FLET J0809700
                    DUMMY DC      0                                     J0809710
                          LDD  L  DUMNM                                 J0809720
                          STO   2 0          SET UP 1DUMY               J0809730
                          SLT     16                                    J0809740
                          STO   2 1          2ND WRD DUMMY NAME IN NTRY J0809750
                    *                                                   J0809760
                          LD   L  ADRSV      CALC DBS OF AVAIL FXA      J0809770
                          A    L  DEBES                                 J0809780
                          STO   2 2          DBS OF FIXED AREA          J0809790
                          STO  L  DEDBA                                 J0809800
                          BSC  I  DUMMY                                 J0809810
                    *                                                   J0809820
                    *************************************************** J0809830
                    *                                                   J0809840
                    *              UPDATE DCOM IMAGE IN CATGO           J0809850
                    *                                                   J0809860
                    *************************************************** J0809870
                    DKMVD LD    2 DE#CI-D    OLD CIB                    J0809880
                          STO   2 OLDCB-D                               J0809890
                          NOP                                           J0809900
                          LDX  I1 DECDC      POINT TO QUINTUPLE         J0809910
                          LD    1 #CIBA      DO NOT UPDATE #CIBA IF 2-4 J0809920
                          AND   2 DEFFF-D    *EQUAL TO ZERO         2-4 J0809930
                          BSC  L  DE369,+-   BR IF CIB DELETED      2-4 J0809940
                          A     2 NOCYL-D                               J0809950
                          A     2 DE485-D    ADD IN THE DRIVE NO.       J0809960
                          STO   1 #CIBA                                 J0809970
                    DE369 LD    2 DEVS2-D    TEST IF SYSTEM CARTRIDGE   J0809980
                          BSC  L  DE372,Z    BRANCH AROUND LET CHANGE   J0809990
                    *                        *IF NON-SYSTEM SATELLITE   J0810000
                          LD    1 #ULET      OLD LET SCTR ADDR          J0810010
                          A     2 NOCYL-D                               J0810020
                          STO   1 #ULET      NEW LET SCTR ADDR          J0810030
                    *                                                   J0810040
                    DE372 LD    1 #FPAD      UPDATE FILE PROTECT ADDR   J0810050
                          A     2 NOCYL-D                               J0810060
                          STO   1 #FPAD                                 J0810070
                    *                                                   J0810080
                          LD    2 NOCYL-D    NUMBER OF SCTRS ADDED      J0810090
                          SLA     4                                     J0810100
                          STO   2 DEBES-D    NUMBER OF DBS ADDED        J0810110
                    *                                                   J0810120
                          LD    1 #BNDU                                 J0810130
                          A     2 DEBES-D                               J0810140
                          STO   1 #BNDU      NEW #BNDU ADDR             J0810150
                    *                                                   J0810160
                          LD    1 #ANDU                                 J0810170
                          A     2 DEBES-D                               J0810180
                          STO   1 #ANDU      NEW #ANDU ADDR             J0810190
                          LDX  L1 C                                     J0810200
                          BSI     UDCOM      UPDATE RESIDENT MONITOR    J0810210
                    *                                                   J0810220
                          LD   L  DECFA      TEST FOR DECREASE FXA      J0810230
                          BSC  L  DE085,Z    RETURN TO UPDATE LET IF SO J0810240
                          LD    2 DE#FL-D    TEST FOR PREVIOUS FXA      J0810250
                          LDX  L1 C          RESET XR1 FOR CATCO        J0810260
                          BSC  L  PRVFA,Z    BR IF YES                  J0810270
                          BSC  L  DENOF      TO SET UP FLET SECTOR      J0810280
                    *     ********************************************* J0810290
                          HDNG    VOID FORTRAN ASM RPG OR DECREASE FXA  J0810300
                    *                                                   J0810310
                    MOVE  DC      *-*                                   J0810320
                          LDX  L3 BUF5                                  J0810330
                          LDX  L2 DECST      RESET POINTER              J0810340
                          LD    2 K320-D     WD COUNT FOR DISK I/O      J0810350
                          STO   3 0                                     J0810360
                    *                                                   J0810370
                          LDX  L1 C                                     J0810380
                    *                                                   J0810390
                          LD    1 FXSW                                  J0810400
                          BSC  L  MOVE1,+-   BR IF NOT DFN FXA OP       J0810410
                          LDX  I1 DECDC     PT. TO QUINTUPLE ENTRY 2-10 J0810415
                          LD    1 #WSCT      LGTH OF PROG IN WS         J0810420
                          BSC     Z         SKIP IF ZERO           2-12 J0810425
                          S     2 K1-D      COMPUTE NUMBER OF       2-7 J0810430
                          SRT     4         *SECTORS MINUS ONE      2-7 J0810440
                          A     2 DE#FP-D    ADD FILE PROTECT ADRS      J0810450
                          STO   2 LMV-D      LAST SECTOR TO MOVE        J0810460
                    MOVE1 LD    2 FAD2-D     SET ADDR TO GET FROM       J0810470
                          STO   3 1                                     J0810480
                          BSI  L  GETX                                  J0810490
                          LD    2 TAD2-D     SET ADDR TO PUT TO         J0810500
                          STO   3 1                                     J0810510
                          BSI  L  PUTX                                  J0810520
                          LD    2 FAD2-D     WHEN LAST SCTR HAS BEEN    J0810530
                          S     2 LMV-D      *MOVED, EXIT               J0810540
                          BSC  I  MOVE,+-                               J0810550
                    *                                                   J0810560
                          MDX  L  FAD2,+1    MODIFY FROM ADDR           J0810570
                          MDX  L  TAD2,+1    MODIFY TO ADDR             J0810580
                          MDX     MOVE1      REPEAT                     J0810590
                          HDNG    UPDATE COMMA (VOID FOR,ASM,RPG)       J0810600
                    *                                                   J0810610
                    UDCOM DC      *-*        UPDATE RESIDENT IMAGE      J0810620
                          LDX  L3 BUF5       POINT XR3 TO BUFFER        J0810630
                          LD    2 DERIM-D    FETCH RES IMAGE SCTR NO.   J0810640
                          STO   3 1                                     J0810650
                          BSI  L  GETX       GET RESIDENT IMAGE         J0810660
                    *                                                   J0810670
                    *************************************************** J0810680
                    *                                                   J0810690
                    *     COMPARE DR NO. OF SYSTEM CIB IN $CIBA AND     J0810700
                    *     #TODR.  UPDATE $CIBA ONLY IF EQUAL DR NO.     J0810710
                    *                                                   J0810720
                    *     SKT IS SET ONLY WHEN SHRINKING PACK           J0810730
                    *                                                   J0810740
                    *************************************************** J0810750
                          LDX  L3 $ULET      POINT XR3 TO CORE ADDR     J0810760
                          LDX  I1 DECDC      POINT TO QUINTUPLE ENTRY   J0810770
                    *                                                   J0810780
                          LD   L  $CIBA      SYSTEM CIB ADDR W/DR NO.   J0810790
                          EOR   2 DE485-D    COMPARE DRIVE NUMBERS      J0810800
                          SRA     12                                    J0810810
                          BSC  L  DE391,Z    UPDATE $CIBA IF AGREEMENT  J0810820
                    *                                                   J0810830
                          LD    1 #CIBA                                 J0810840
                          S     2 SKT-D                                 J0810850
                          STO  L  $CIBA      UPDATE IN-CORE CIBA        J0810860
                          STO   1 #CIBA                                 J0810870
                    *                                                   J0810880
                    DE391 MDX  I3 DE488      MODIFY QUINTUPLE ADDRESS   J0810890
                    *                                                   J0810900
                          LD    1 #ULET      LET ADDR FROM CATCO        J0810910
                          S     2 SKT-D      MODIFY LET ADDRESS         J0810920
                          STO   1 #ULET                                 J0810930
                          STO   3 0          UPDATE CORE QUINTUPLE      J0810940
                    *                                                   J0810950
                          LD    1 #FPAD      FROM DCOM IMAGE IN CATCO   J0810960
                          S     2 SKT-D      MODIFY FPAD ADDRESS        J0810970
                          STO   1 #FPAD                                 J0810980
                          LDX  L3 $FPAD      POINT XR3 TO CORE ADDR     J0810990
                          MDX  I3 DE488      MODIFY BY DRIVE NUMBER     J0811000
                          STO   3 0          UPDATE $FPAD QUINTUPLE     J0811010
                    *                                                   J0811020
                          LDX  L3 BUF5                                  J0811030
                          LDX  L2 D          RESET POINTER              J0811040
                          BSI  L  PUTX       FILE BACK RES IMAGE        J0811050
                          BSC  I  UDCOM      RETURN                     J0811060
                    *************************************************** J0811070
                          HDNG               SIGNOFF MESSAGES           J0811080
                          BSS  E  0                                     J0811090
                          DC      0                                     J0811100
                    DEBBM DC      DE711-*    WORD COUNT            ODD  J0811110
                    DE702 EBC     .CART ID       CYLS FXA.            E J0811120
                    DE703 EBC     .        DBS AVAIL       .            J0811130
                    DE704 EBC     .FLET SECTOR ADDR        .            J0811140
                    *                                                   J0811150
                    DE711 DC      DE714-*    WORD COUNT                 J0811160
                    DE712 EBC     .ZERO CYLS AVAILABLE.                 J0811170
                    DE714 BSS     0                                     J0811180
                    *************************************************** J0811190
                          HDNG    SLET SEARCH SUBROUTINE                J0811200
                    *************************************************** J0811210
                    *                                                   J0811220
                    *     ENTER WITH THE PH ID BEING LOOKED FOR IN ACC. J0811230
                    *     PROG WILL RETURN WITH THE ACC C/ID AND XR2    J0811240
                    *     CONTAINING THE ADRS OF PH ID AS IT RESIDES    J0811250
                    *     IN THE IN-CORE BUFFER PROVIDED THAT THE PH    J0811260
                    *     WAS FOUND.  IF NOT FOUND ACC WILL CONTAIN 0.  J0811270
                    *                                                   J0811280
                    *************************************************** J0811290
                    *                                                   J0811300
                    FSST  DC      *-*        TEMPORARY PHASE ID         J0811310
                    *                                                   J0811320
                    FSS   DC      *-*                                   J0811330
                          STO     FSST       STORE PH ID IN TEMP LOC    J0811340
                          STX   1 FR15+1                                J0811350
                          LDD     SLETA-1    RESET TO 1ST SCTR SLET     J0811360
                          STD  L  FSLET                                 J0811370
                    FR04  LDX  L3 BUF5                                  J0811380
                          BSI  L  GETX       GET A SCTR OF SLET         J0811390
                          LDX  L2 FSLET+2                               J0811400
                          LDX   1 80         80 SETS PER SECTOR         J0811410
                    FR07  LD      FSST       LD PH ID BEING SOUGHT      J0811420
                          S     2 0          SUBT PH ID OF A SLET SET   J0811430
                          BSC  L  FNDID,+-   BR TO FOUND ID IF MATCH    J0811440
                          MDX   2 4          **ELSE BUMP TO NEXT SET    J0811450
                          MDX   1 -1         SKIP IF 80 PROCESSED       J0811460
                          MDX     FR07       **ELSE GO ROUND AGAIN      J0811470
                          LD   L  FSLET+1    DO NOT SEARCH MORE SCTRS   J0811480
                          S       SLETC     *THAN SLET OCCUPIES     2-9 J0811490
                          BSC     +-                                    J0811500
                          MDX     FR15       RESTORE XR1 AND EXIT       J0811510
                          MDX  L  FSLET+1,1  BUMP TO NEXT SCTR OF SLET  J0811520
                          MDX     FR04       GET NEXT SCTR              J0811530
                    *                                                   J0811540
                    FNDID LD      FSST       SET ACCUM PLUS             J0811550
                    FR15  LDX  L1 *-*                                   J0811560
                          BSC  I  FSS        RETURN TO MAINLINE         J0811570
                    *                                                   J0811580
                          BSS  E  0                                     J0811590
                          DC      /140       WORD COUNT                 J0811600
                    SLETA DC      #SLET      1ST SECTOR OF SLET         J0811610
                    *             CONSTANT REMOVED                  2-9 J0811620
                    SLETC DC      #SLET+2   3RD SECTOR OF SLET      2-9 J0811630
                          HDNG    RELOAD TABLE REPROCESS SUBROUTINE     J0811640
                    *************************************************** J0811650
                    *                                                   J0811660
                    *     PROCESS RELOAD TABLE NOW IN CORE TO FIND THE  J0811670
                    *     PHASES WHICH REQUIRE SLET TABLE INFO.         J0811680
                    *                                                   J0811690
                    *     USES TWO DISK BUFFERS, VIZ. BUF5 & BUF7.      J0811700
                    *                                                   J0811710
                    *************************************************** J0811720
                    BUFF1 EQU     BUF7                                  J0811730
                    FSLET EQU     BUF5                                  J0811740
                    RTBFR EQU     DE400      THIS LOC TO BE OVERLAYED   J0811750
                    *                                                   J0811760
                    W200  DC      *-*        ENTRY                      J0811770
                    W202  LD   L  RTBFR+2    TEST ENTRIES AND PROCESS   J0811780
                          EOR     EFF        **EACH GROUP OF 3 UNTIL    J0811790
                          BSC  I  W200,+-    **-1 IS REACHED IN WD      J0811800
                          EOR     EFF        RESTORE ID TO ACC          J0811810
                    *                        **FOLLOWING LAST ENTRY.    J0811820
                    *                                                   J0811830
                          BSI     FSS        GO TO SLET SEARCH          J0811840
                          BSI  L  DE814,+    TO ERROR IF MISSING        J0811850
                          LDX  I1 W202+1     LD XR1 W/LOC IN RELOAD     J0811860
                          LD    1 1          **TABLE BUFFER             J0811870
                          SRT     16         DETM WHICH SCTR OF PH THE  J0811880
                          D       D320       **CORRECTIONS WILL BE      J0811890
                    *                        **MADE IN.                 J0811900
                          A     2 3          ADD QUOT TO SCTR ADDR TO   J0811910
                          STO  L  BUFF1+1    **BE UPDATED               J0811920
                          RTE     16         REM CONTAINS REL LOC IN    J0811930
                          STO     WREM       **THIS SECTOR              J0811940
                          LD    1 2          SAVE THE COUNT OF SETS     J0811950
                          STO     SETCT      **TO BE FILLED OUT         J0811960
                    *                                                   J0811970
                          BSI     GETB7      GET PH WHICH NEEDS DATA    J0811980
                    *                                                   J0811990
                    W501  LD      WREM       IF C/WREM IS 140 HEX WDS,  J0812000
                          S       D320       **THE BUFFER IS FULL.      J0812010
                          BSC  L  W520,Z+                               J0812020
                          BSI     PUTB7      FILE UPDATED REQUESTING    J0812030
                          SRA     16         **PHASE, ZERO POINTER TO   J0812040
                          STO     WREM       **BEGINNING OF SUCCEEDING  J0812050
                          MDX  L  BUFF1+1,1  **PHASE.                   J0812060
                          BSI     GETB7      READ NEXT SCTR OF PHASE    J0812070
                    *                        **REQUESTING SLET DATA.    J0812080
                    W520  LDX  I1 WREM       RESET XR1 WITH THE REM     J0812090
                          STX   1 W540+1     SAVE XR1                   J0812100
                          LD   L1 BUFF1+2    FETCH PH ID TO LOOK UP     J0812110
                          BSI     FSS        SEARCH SLET                J0812120
                          BSC  L  W540,Z     FALL THRU IF CANT FIND     J0812130
                    *************************************************** J0812140
                    *                                                   J0812150
                    *     CONTINUE IF FIRST OR LAST PHASE OF        2-5 J0812160
                    *     FOR/ASM/RPG/COB IS REQUESTED DURING A     2-9*J0812170
                    *     VOID FOR/ASM/RPG/COB LOAD.                2-9*J0812180
                    *                                                   J0812190
                    *************************************************** J0812200
                          MDX   2 -4        SET PT TO LAST ENTRY IN 2-5 J0812210
                    *                       *SLET SCTR, HPFLY ZEROS 2-5 J0812220
                          LD   L  DEFOR     PH ID OF FORTRAN, 1ST   2-5 J0812230
                          BSI     W530      GO CHECK IF LOOKED FOR  2-5 J0812240
                          LD   L  DEFL1     PH ID OF FORTRAN, LAST  2-5 J0812250
                          BSI     W530                              2-5 J0812260
                    *                                               2-5 J0812270
                          LD   L  DEASM     ASM FIRST PHASE         2-5 J0812280
                          BSI     W530                              2-5 J0812290
                          LD   L  DEAL1     ASM LAST PHASE          2-5 J0812300
                          BSI     W530                              2-5 J0812310
                    *                                               2-5 J0812320
                          LD   L  DERPG     RPG 1ST PHASE           2-5 J0812330
                          BSI     W530                              2-5 J0812340
                          LD   L  DERL1     RPG LAST PHASE          2-5 J0812350
                          BSI     W530                              2-5 J0812360
                          LD   L  DECOB     COBOL 1ST PHASE         2-9 J0812370
                          BSI     W530                              2-9 J0812380
                          LD   L  DECL1     COBOL LAST PHASE        2-9 J0812390
                          BSI     W530                              2-9 J0812400
                    *                                               2-5 J0812410
                          BSI  L  DE814     ERROR, DEFECTIVE SLET   2-5 J0812420
                    *                                               2-5 J0812430
                    ************************************************2-5 J0812440
                    *                                               2-5 J0812450
                    W530  DC      *-*       ENTER TO CHECK A PH ID  2-5 J0812460
                          EOR     FSST      CMP W/ PH ID REQUESTED  2-5 J0812470
                          BSC  L  W540,+-   MATCH, GO PLACE ZEROS   2-5 J0812480
                          BSC  I  W530      NO MATCH,BACK TO CALLER 2-5 J0812490
                    *                                               2-5 J0812500
                    ************************************************2-5 J0812510
                    *                                                   J0812520
                    W540  LDX  L1 *-*        RESTORE XR1                J0812530
                          MDX   1 1          BUMP XR1                   J0812540
                          MDX  L  WREM,1     BUMP REMAINDER             J0812550
                          LD   L  1          IF XR1 OVER 319, PATCHING  J0812560
                          S       D319       **WILL BE DONE IN NEXT     J0812570
                          BSC  L  W720+1,-Z  **SECTOR                   J0812580
                    W600  LD    2 1          LOAD A SLET ENTRY          J0812590
                          STO  L1 BUFF1+2    UPDATE SPECIAL PHASE       J0812600
                          MDX  L  WREM,1     BUMP REMAINDER             J0812610
                          NOP                MAY SKIP                   J0812620
                          MDX  L  WCTR3,-1   DECR ON EACH UPDATE        J0812630
                          MDX     W660                                  J0812640
                          LD      D3                                    J0812650
                          STO     WCTR3      RESTORE COUNTER            J0812660
                          MDX  L  SETCT,-1   ONE SET HAS BEEN DONE      J0812670
                          MDX     W501       PROCESS NEXT SET           J0812680
                          BSI     PUTB7      FILE UPDATED SECTOR        J0812690
                          MDX  L  W202+1,3   POINT TO NEXT SET          J0812700
                          MDX     W202       TO CHECK NEXT ENTRY        J0812710
                    *                                                   J0812720
                    W400  SRA     16         CLEAR SAVED REM TO 0       J0812730
                          STO     WREM                                  J0812740
                          MDX  L  BUFF1+1,1  BUMP TO NEXT SECTOR        J0812750
                          BSI     GETB7      READ FROM DISK             J0812760
                          LDX  I1 WREM       LD XR1 W/NEW REMAINDER     J0812770
                          MDX     W600       TO STORE SLET INFO.        J0812780
                    *                                                   J0812790
                    W660  LD      WREM       IF REM IS UP TP 320, NEXT  J0812800
                          S       D320       **SCTR MUST BE READ DOWN   J0812810
                          BSC  L  W720,+-                               J0812820
                          MDX   2 1          BUMP XR2 TO NEXT WD OF     J0812830
                          LDX  I1 WREM       **SLET AND POINT XR1 TO    J0812840
                          MDX     W600       **NEXT WORD OF BUFF1       J0812850
                    *                                                   J0812860
                    W720  MDX   2 1          NEXT WD TO UPDATE WILL BE  J0812870
                          BSI     PUTB7      *1ST WD OF NEXT SECTOR     J0812880
                          MDX     W400                                  J0812890
                    *                                                   J0812900
                    *                                                   J0812910
                    WREM  DC      *-*        SAVED REMAINDER            J0812920
                    SETCT DC      *-*        SAVED SET CNT TO PATCH     J0812930
                    WCTR3 DC      3          CTR TO UPDATE 3 WDS/SET    J0812940
                    D3    DC      3          CST TO RESET WCTR3         J0812950
                    D319  DC      319        WD COUNT OF SCTR - 1       J0812960
                    D320  DC      320        WD COUNT OF 1 SECTOR       J0812970
                    EFF   DC      /FFFF      MASK                       J0812980
                    *                                                   J0812990
                          HDNG    BUF7 READ/WRITE SUBROUTINES           J0813000
                    *                                                   J0813010
                    GETB7 DC      *-*        ENTRY                      J0813020
                          STX   3 B5+1       SAVE XR3                   J0813030
                          LDX  L3 BUF7       POINT TO BUFF1             J0813040
                          LD   L  K320       FULL SECTOR                J0813050
                          STO   3 0          SET WORD COUNT             J0813060
                          BSI  L  GETX       READ INTO BUFF1            J0813070
                    B5    LDX  L3 *-*                                   J0813080
                          BSC  I  GETB7                                 J0813090
                    *                                                   J0813100
                    PUTB7 DC      *-*        WRITE FROM BUFF1           J0813110
                          STX   3 B6+1                                  J0813120
                          LDX  L3 BUF7                                  J0813130
                          BSI  L  PUTX                                  J0813140
                    B6    LDX  L3 *-*                                   J0813150
                          BSC  I  PUTB7                                 J0813160
                    *                                                   J0813170
                          HDNG    DISKZ UPDATE SUBROUTINE               J0813180
                    DER60 DC      *-*        ENTRY                      J0813190
                          LD      CILPH      LOAD CIL PHASE ID          J0813200
                          BSI  L  FSS        SEARCH OUT CIL FROM SLET   J0813210
                          BSI  L  DE814,+    ERROR IF MESSING           J0813220
                          LD    2 3          SAVE NEW SECTOR ADDRESS    J0813230
                          STO     SCIL       SAVE                       J0813240
                    *************************************************** J0813250
                    *                                                   J0813260
                    *     THE NEW SECTOR ADDRESS OF THE CIL IS PULLED   J0813270
                    *     FROM UPDATED SLET AND REPLACES OLD CIL ENTRY  J0813280
                    *     IN DISKZ.                                     J0813290
                    *                                                   J0813300
                    *************************************************** J0813310
                          LD      IDDKZ                                 J0813320
                          BSI  L  FSS        SEARCH OUT DISKZ FROM SLET J0813330
                          BSI  L  DE814,+    ERROR IF MISSING           J0813340
                          LDD   2 2          PLACE WD CNT AND SCTR ADDR J0813350
                          STD  L  BUFF1      **IN IOAR FOR BUFF1        J0813360
                          LDX  L3 BUFF1                                 J0813370
                          BSI  I  GET        READ FROM DISK             J0813380
                          NOP                                           J0813390
                          LDX  L1 BUFF1      SETUP XR1 W/LOC IN BUFFU   J0813400
                          MDX  I1 BUFF1      **OF END OF DISKZ          J0813410
                          LD      SCIL       FETCH SAVED CIL ADDR FOR   J0813420
                    *                        **DISKZ.                   J0813430
                          STO   1 -1                                    J0813440
                          LDX  L1 C          RESET INDEX REGISTER       J0813450
                          BSI  I  PUT        FILE DISKZ BACK            J0813460
                          LDX  L2 DECST      RESTORE POINTER            J0813470
                          LDD   2 DEPUT-D    0001 AND BUF5 TO AQ        J0813480
                          SRA     16         CLEAR FOR GET              J0813490
                          STO  L  BUF5+1     SETUP TO GET SCTR 0        J0813500
                          BSI  L  DZ000      READ COLD START SECTOR     J0813510
                          MDX  L  $DBSY,0    WAIT FOR OP COMPLETE       J0813520
                          MDX     *-3        BR TO TEST OP COMPLETE     J0813530
                          LD    1 #CIAD      LOAD THE REL NO. IN DCOM   J0813540
                          A     2 DEPUT+1-D  ADD BUF5 ADDRESS           J0813550
                          A     2 K3-D       CORRECTION                 J0813560
                          STO     DESTR+1                               J0813570
                          LD      SCIL       NEW CIL SECTOR ADDRESS     J0813580
                    DESCL STO  L  $ZEND-3    PLACE IN DISKZ IN CORE     J0813590
                    DESTR STO  L  *-*        PRESET                     J0813600
                          LDD   2 DEPUT-D                               J0813610
                          BSI  L  DZ000      WRITE BACK                 J0813620
                          MDX  L  $DBSY,0    WAIT FOR OP COMPLETE       J0813630
                          MDX     *-3                                   J0813640
                          BSC  I  DER60      RETURN                     J0813650
                    *                                                   J0813660
                    CILPH DC      CILDR      CORE IMAGE LDR PHASE ID.   J0813670
                    IDDKZ DC      DSKZ       PH ID OF DISKZ             J0813680
                    SCIL  DC      *-*        CIL SCTR ADDR FROM SLET    J0813690
                          HDNG    ERROR MESSAGES AND CONSTANTS          J0813700
                    ERM1  EQU     80  FIXED AREA PRESENT                J0813710
                    ERM2  EQU     81  ASSEMBLER NOT IN SYSTEM           J0813720
                    ERM3  EQU     82  FORTRAN NOT IN SYSTEM             J0813730
                    ERM4  EQU     83  INCREASE VALUE IN COUNT FIELD     J0813740
                    DERM8 EQU     84  DEFECTIVE SLET                    J0813750
                    ERM6  EQU     85  FIXED AREA NOT PRESENT            J0813760
                    ERM7  EQU     86  DECREASE VALUE IN COUNT FIELD     J0813770
                    ERM87 EQU     87  RPG NOT IN SYSTEM             2-5 J0813780
                    ERM88 EQU     88        COBOL NOT IN SYSTEM     2-9 J0813790
                    *                                                   J0813800
                    DEVA  EQU     101 ASSEMBLER VOIDED                  J0813810
                    DEVF  EQU     102 FORTRAN VOIDED                    J0813820
                    DEVR  EQU     103 RPG VOIDED                    2-5 J0813830
                    DEVC  EQU     104       COBOL VOIDED            2-9 J0813840
                    *                                                   J0813850
                    ERM15 EQU     15  INVALID TO FIELD FOR VOID         J0813860
                    ERM70 EQU     70  LAST ENTRY IN LET/FLET NOT 1DUMY  J0813870
                    *                                                   J0813880
                    SSEL  NOP                TRACE WORD                 J0813890
                          NOP                                           J0813900
                          STX   1 INBUF                                 J0813910
                          LDX  L1 C          RESET XR1 FOR CATCO        J0813920
                          BSI  I  LEAVE      PRINT THE MESSAGE          J0813930
                    INBUF DC      *-*        ERROR CODE NUMBER          J0813940
                    *                                                   J0813950
                    *************************************************** J0813960
                    *                                                   J0813970
                    DEFOR DC      31         PHASE ID OF FORTRAN        J0813980
                    DE#FP DC      *-*        SET WITH #FPAD W/O DR NO.  J0813990
                    DE#CI DC      *-*        SET WITH #CIBA W/O DR NO.  J0814000
                    FSAD  DC      *-*        TO BE SET W/FORT ADDR      J0814010
                    *                                                   J0814020
                    DEFL1 DC      57        PHID OF FOR, LAST PHASE 2-5 J0814030
                    SNOFF DC      *-*       STORAGE FOR SIGNOFF NO. 2-5 J0814040
                    DEFL3 DC      *-*       TO BE SET W/ WORD CNT   2-5 J0814050
                    DEFL4 DC      *-*       TO BE SET W/ SCTR ADDR  2-5 J0814060
                    *                                               2-5 J0814070
                    DEASM DC      207       PHASE ID OF ASSEMBLER   2-8 J0814080
                    DE#FL DC      *-*        SET WITH #FLET W/O DR NO.  J0814090
                    DE#UL DC      *-*        SET WITH #ULET W/O DR NO.  J0814100
                    ASAD  DC      *-*        TO BE SET W/ASM ADDR       J0814110
                    *                                                   J0814120
                    DEAL1 DC      246       PHID OF ASM, LAST PHASE 2-8 J0814130
                    ERRNO DC      *-*       STORAGE FOR ERR MSG NO. 2-5 J0814140
                    DEAL3 DC      *-*       TO BE SET W/ WORD CNT   2-5 J0814150
                    DEAL4 DC      *-*       TO BE SET W/ SCTR ADDR  2-5 J0814160
                    *                                               2-5 J0814170
                    DERPG DC      176       PHASE ID OF RPG COMP    2-5 J0814180
                    ADRSV DC      *-*       GENERAL USAGE BUCKET        J0814190
                    DETSW DC      *-*       FILLED WITH C/DATSW         J0814200
                    RSAD  DC      *-*       TO BE SET W/ RPG ADDR   2-5 J0814210
                    *                                                   J0814220
                    DERL1 DC      204       PHID OF RPG, LAST PHASE 2-5 J0814230
                          DC      *-*       RESERVED                2-5 J0814240
                    DERL3 DC      *-*       TO BE SET W/ WORD CNT   2-5 J0814250
                    DERL4 DC      *-*       TO BE SET W/ SCTR ADDR  2-5 J0814260
                    *                                                   J0814270
                    DECOB DC      81        PHASE ID OF COBOL COMPIL2-9 J0814280
                          DC      *-*       UNUSED                  2-9 J0814290
                          DC      *-*       UNUSED                  2-9 J0814300
                    CSAD  DC      *-*       TO BE SET W/ COBOL ADDR 2-9 J0814310
                    *                                               2-9 J0814320
                    DECL1 DC      92        PHID COBOL, LAST PHASE 2-11 J0814330
                          DC      *-*       UNUSED                  2-9 J0814340
                    DECL3 DC      *-*       TO BE SET W/ WD COUNT   2-9 J0814350
                    DECL4 DC      *-*       TO BE SET W/ SCTR ADDR  2-9 J0814360
                    *************************************************** J0814370
                    *                                                   J0814380
                    DECST DC      *-*        FOR EMERGENCY USE          J0814390
                    SK8   DC      /9400      CST TO BUILD THE INSTRUC-  J0814400
                          DC      K8         *TION   S   L  K8          J0814410
                    DFTMP DC      0          WORK AREA                  J0814420
                    DEBES DC      0          FXA CHANGE IN DBS          J0814430
                    NOCYL DC      0          NO. OF SCTRS, NOT CYLS     J0814440
                    K1    DC      1          CONSTANT                   J0814450
                    K3    DC      +3         CONSTANT                   J0814460
                    K8    DC      +8         SECTORS PER CYLINDER       J0814470
                    K10   DC      10         DECIMAL TEN                J0814480
                    HF0F0 DC      /F0F0      EBCDIC FOR BLANK, ZERO     J0814490
                    K16   DC      +16        FOR FLET SCTR HEADER       J0814500
                    K0138 DC      /0138      SCTR OF WDS -8 HDR WDS     J0814510
                    K312  EQU     K0138      DITTO                      J0814520
                    K0148 DC      /148       HEX 138 PLUS HEX 10        J0814530
                    K317  DC      320-3      SCTR LGTH MINUS 1 ENTRY    J0814540
                    N80   DC      -128       NEGATES ADDITION OF A CYL  J0814550
                    H0640 DC      /0640      NUMBER OF SECTORS ON PACK  J0814560
                          BSS  E  0                                     J0814570
                    K320  DC      /140       WORD COUNT                 J0814580
                    DECOM DC      #DCOM      SECTOR ADDR OF DCOM        J0814590
                    DEPUT DC      1          DISKZ I/O CONTROL WORD     J0814600
                          DC      BUF5       *AND IOAR ADDRESS          J0814610
                          BSS  E  0                                     J0814620
                    DUMNM DC      /7112      1DUMY NAME W/INDR BITS     J0814630
                          DC      /4528      DITTO                      J0814640
                          BSS  E  0                                     J0814650
                    SUBSA DC      0          UPPER SCTR TO MOVE UP      J0814660
                    SVFPA DC      0          LOWER SCTR TO MOVE UP      J0814670
                    FAD2  DC      *-*        'FROM' ADDR FOR GET        J0814680
                    TAD2  DC      *-*        'TO' ADDR FOR PUT          J0814690
                    LMV   DC      *-*        LAST SCTR TO MOVE          J0814700
                    TMPST DC      *-*        TEMPORARY STORAGE          J0814710
                    BUFAD DC      BUF5+2     DATA ADDR IN BUF5          J0814720
                    CYL   DC      *-*        CYLINDER CNT TO MOVE       J0814730
                    SKT   DC      *-*        SCTR CNT TO MOVE           J0814740
                    DBS   DC      *-*        DB CNT TO MOVE             J0814750
                    DEDBA DC      *-*        DBS OF AVAILABLE FXA       J0814760
                    SVMAG DC      *-*        MAGNITUDE OF MOVE          J0814770
                    OLDCB DC      *-*        ORIGINAL CIB ADDRESS       J0814780
                    DE485 DC      *-*        DRIVE CODE -LEFT 4 BITS    J0814790
                          BSS  E  0                                     J0814800
                    RETBL DC      /140       WORD COUNT                 J0814810
                          DC      #RTBL      RELOAD TABLE SCTR ADDR     J0814820
                          BSS  E  0                                     J0814830
                    DE870 DC      *-*        SCTRS VOIDED  -WHOLE CYLS  J0814840
                    DE871 DC      *-*        SECTORS LEFT OVER          J0814850
                    DE488 DC      *-*        TO INCREMENT XR.S          J0814860
                    DERIM DC      #RIAD      SCTR ADDR OF RES IMAGE     J0814870
                    DEVS2 DC      /0200      0 INDICATES SYSTEM PACK    J0814880
                    DEFFF DC      /0FFF      TO MASK DRIVE NUMBER       J0814890
                    DECDC DC      C          TO BE BUMPED BY DRIVE NO.  J0814900
                    *                                                   J0814910
                    *************************************************** J0814920
                          HDNG    VOID FORTRAN/ASSEMBLER/RPG            J0814930
                    DE814 NOP                TRACE WORD                 J0814940
                          LDX   1 DERM8      DISPLAY DEFE TIVE SLET     J0814950
                          BSI     SSEL       EXIT THROUGH LEAVE         J0814960
                    *                                                   J0814970
                    DE852 NOP                                           J0814980
                    *        INSTRUCTION REMOVED                    2-9 J0814985
                          BSI  L  DER10      GO WORK ON RELOAD TABLE    J0814990
                          NOP                                           J0815000
                          BSI  L  W200       PROCESS REBUILT TABLE      J0815010
                    *                                                   J0815020
                          LD      DE870     FETCH NO. SECTOR MOVED 2-10 J0815030
                          SRT     16                                    J0815040
                          D       K8         DETERMINE WHOLE CYLINDERS  J0815050
                          SLA     3                                     J0815060
                          STD     DE870                                 J0815070
                          LDX  L1 C          RESET FOR CATCO            J0815080
                    *                                               2-9 J0815081
                          LD    1 MUHDR+1   UPDATE MUP DUP PHASE    2-9 J0815082
                          S       SVMAG     *IOAR HEADER SECTOR     2-9 J0815083
                          STO   1 MUHDR+1   *ADDRESS                2-9 J0815084
                    *                                               2-9 J0815085
                          LD    1 D2HDR+1   UPDATE DUP CONTROL 2    2-9 J0815086
                          S       SVMAG     *PHASE IOAR HEADER      2-9 J0815087
                          STO   1 D2HDR+1   *SECTOR ADDRESS         2-9 J0815088
                    *                                               2-9 J0815089
                          LD    1 #SCRA      SETUP FROM ADDR FOR MOVE   J0815090
                          STO     FAD2                                  J0815100
                          S       DE870      CYLINDERS VOIDED           J0815110
                          STO     TAD2                                  J0815120
                          LD    1 #WSCT                                 J0815130
                          S       K1        COMPUTE NUMBER OF       2-7 J0815140
                          SRT     4         *SECTORS MINUS ONE      2-7 J0815150
                          A     1 #FPAD                                 J0815160
                          STO     LMV        LAST SECTOR TO MOVE        J0815170
                          BSI  L  MOVE       SHIFT DOWN                 J0815180
                          NOP                                           J0815190
                          SRA     16                                    J0815200
                          S       DE870      FORM NEGATIVE CYLIN COUNT  J0815210
                          STO     ADRSV                                 J0815220
                          SLA     4                                     J0815230
                          STO     DEBES      FORM NEGATIVE BYTE COUNT   J0815240
                          LD    1 #ULET      ADJUST CATCO LET ADDR      J0815250
                          S       DE870                                 J0815260
                          STO   1 #ULET                                 J0815270
                    *                                                   J0815280
                          BSI  L  UPDLT      UPDATE LET IN NEW POSITION J0815290
                    *                                                   J0815300
                    *                        REVISE ADDR'S IN CATCO     J0815310
                          LD    1 #CIBA                                 J0815320
                          S       DE870                                 J0815330
                          STO   1 #CIBA                                 J0815340
                    *                                                   J0815350
                          LD    1 #SCRA                                 J0815360
                          S       DE870                                 J0815370
                          STO   1 #SCRA                                 J0815380
                    *                                                   J0815390
                          LD    1 #FPAD                                 J0815400
                          S       DE870                                 J0815410
                          STO   1 #FPAD                                 J0815420
                    *                                                   J0815430
                          LD    1 #BNDU                                 J0815440
                          A       DEBES      NEGATIVE VALUE IN DEBES    J0815450
                          STO   1 #BNDU                                 J0815460
                    *                                                   J0815470
                          LD    1 #ANDU                                 J0815480
                          A       DEBES      NEGATIVE VALUE IN DEBES    J0815490
                          STO   1 #ANDU                                 J0815500
                    *                                                   J0815510
                          NOP                                           J0815520
                          LD    1 #CSHN                                 J0815530
                          A       DE871                                 J0815540
                          STO   1 #CSHN                                 J0815550
                    *                                                   J0815560
                          BSI  L  UPDCM      UPDATE DCOM FROM CATCO     J0815570
                    *                        SRT SHOULD BE ZERO         J0815580
                          BSI  L  UDCOM      UPDATE RESIDENT IMAGE      J0815590
                    *                                                   J0815600
                    *************************************************** J0815610
                    *                                                   J0815620
                    *     LOCATE DISKZ AND RESET WITH NEW SECTOR ADDR   J0815630
                    *     OF CORE IMAGE LOADER.                         J0815640
                    *                                                   J0815650
                    *************************************************** J0815660
                    *                                                   J0815670
                          BSI  L  DER60      TO UPDATE DISKZ            J0815680
                          LDX  I1 SNOFF     SET UP SIGN-OFF NO. AND 2-5 J0815690
                          BSI  L  SSEL       *GO THRU SSEL TO LEAVE     J0815700
                    *                                                   J0815710
                    *                                                   J0815720
                    *                                                   J0815730
                    *************************************************** J0815740
                    *                                                   J0815750
                    *     SET THE NECESSARY CONSTANTS FOR VOIDING   2-5 J0815760
                    *     A PROGRAM.                                2-5 J0815770
                    *                                                   J0815780
                    *************************************************** J0815790
                    *                                                   J0815800
                    DEVFN LDX   1 ERM3      SET FOR ERR MSG NO.     2-5 J0815810
                          STX  L1 ERRNO     *                       2-5 J0815820
                          LDX   1 DEVF      SET FOR SIGN-OFF MSG NO.2-5 J0815830
                          STX  L1 SNOFF     *                       2-5 J0815840
                          LD    2 DEFOR-D   SET LOW LIMIT PHASE ID  2-5 J0815850
                          STO     DELOW     *                       2-5 J0815860
                          LD    2 DEFL1-D   SET HIGH LIMIT PHASE ID 2-5 J0815870
                          STO     DEHGH     *                       2-5 J0815880
                          LD    2 FSAD-D    SET TO SCTR ADDR        2-5 J0815890
                          STO   2 TAD2-D    *                       2-5 J0815900
                          LD    2 DEFL4-D   SAVE ADDR OF LAST PHASE 2-5 J0815910
                          STO   2 FAD2-D    *OF PROGRAM             2-5 J0815920
                          LD    2 DEFL3-D   GET WD CNT OF LAST PHASE2-5 J0815930
                          MDX     DE700     BR TO CALC NO. SCTRS    2-5 J0815940
                    *                                               2-5 J0815950
                    DEVAM LDX   1 ERM2      SET ASM ERR MSG NO.     2-5 J0815960
                          STX  L1 ERRNO     *                       2-5 J0815970
                          LDX   1 DEVA      SET ASM SIGN-OFF MSG NO.2-5 J0815980
                          STX  L1 SNOFF     *                       2-5 J0815990
                          LD    2 DEASM-D   SET LOW LIMIT PHID      2-5 J0816000
                          STO     DELOW     *                       2-5 J0816010
                          LD    2 DEAL1-D   SET HIGH LIMIT PHID     2-5 J0816020
                          STO     DEHGH     *                       2-5 J0816030
                          LD    2 ASAD-D    SET TO SCTR ADDR        2-5 J0816040
                          STO   2 TAD2-D    *                       2-5 J0816050
                          LD    2 DEAL4-D   SAVE ADDR OF LAST PHASE 2-5 J0816060
                          STO   2 FAD2-D    *OF PROG                2-5 J0816070
                          LD    2 DEAL3-D   GET WD CNT OF LAST PHASE2-5 J0816080
                          MDX     DE700     BR TO CALC NO. SCTRS    2-5 J0816090
                    *                                               2-5 J0816100
                    DEVRG LDX   1 ERM87     SET RPG ERR MSG NO.     2-5 J0816110
                          STX  L1 ERRNO     *                       2-5 J0816120
                          LDX   1 DEVR      SET RPG SICN-OFF MSG NO.2-5 J0816130
                          STX  L1 SNOFF     *                       2-5 J0816140
                          LD    2 DERPG-D   SET LOW LIMIT PHID      2-5 J0816150
                          STO     DELOW     *                       2-5 J0816160
                          LD    2 DERL1-D   SET HIGH LIMIT PHID     2-5 J0816170
                          STO     DEHGH     *                       2-5 J0816180
                          LD    2 RSAD-D    SET TO SCTR ADDR        2-5 J0816190
                          STO   2 TAD2-D                            2-5 J0816200
                          LD    2 DERL4-D   SAVE ADDR OF LAST PHASE 2-5 J0816210
                          STO   2 FAD2-D    *OF PROG                2-5 J0816220
                          LD    2 DERL3-D   GET WD CNT OF LAST PHASE2-5 J0816230
                          MDX     DE700     BR TO CALC NO. SCTRS    2-9 J0816240
                    *                                               2-5 J0816250
                    DEVCB LDX   1 ERM88     SET COBOL ERR MSG NO.   2-9 J0816260
                          STX  L1 ERRNO     *                       2-9 J0816270
                          LDX   1 DEVC      SET COBOL SIGNOFF MSGNO.2-9 J0816280
                          STX  L1 SNOFF     *                       2-9 J0816290
                          LD    2 DECOB-D   SET LOW LIMIT PHID      2-9 J0816300
                          STO     DELOW     *                       2-9 J0816310
                          LD    2 DECL1-D   SET HIGH LIMIT PHID     2-9 J0816320
                          STO     DEHGH     *                       2-9 J0816330
                          LD    2 CSAD-D    SET TO SCTR ADDR        2-9 J0816340
                          STO   2 TAD2-D    *                       2-9 J0816350
                          LD    2 DECL4-D   SAVE ADDR OF LAST PHASE 2-9 J0816360
                          STO   2 FAD2-D    *OF PROGRAM             2-9 J0816370
                          LD    2 DECL3-D   GET WD CNT OF LAST PHASE2-9 J0816380
                    *                                               2-9 J0816390
                    DE700 S     2 K1-D      SUBTRACT ONE FROM WD CNT2-5 J0816400
                          SRT     16        DIVIDE SCTR WD CNT      2-5 J0816410
                          D     2 RETBL-D   *BY 320                 2-5 J0816420
                          A     2 K1-D      ADD ONE TO QUOTIENT     2-5 J0816430
                          A     2 FAD2-D    UPDATE FROM SCTR ADDR   2-5 J0816440
                          STO   2 FAD2-D    *TO 1ST SCTR ABOVE PROG 2-5 J0816450
                          NOP               FOR DEBUG STOP              J0816460
                    *                                                   J0816470
                          LD    2 DE488-D                               J0816480
                          BSC  L  DE721,+                               J0816490
                          LDX   1 ERM15      INVALID 'TO' FIELD         J0816500
                          BSI   2 SSEL-D     DISPLAY ERROR AND LEAVE    J0816510
                    *                                                   J0816520
                    DE721 LD    2 DEVS2-D    TEST FOR SYSTEM CARTRIDGE  J0816530
                          BSC  L  DE794,+-   BR TO CONTINUE IF YES      J0816540
                          BSI     DE801-1    *ELSE DISPLAY ERROR        J0816550
                    *                                                   J0816560
                    *************************************************** J0816570
                    *                                                   J0816580
                    *     THIS SUBROUTINE REMOVES FROM THE RELOAD TABLE J0816590
                    *     THOSE PHASE ID NUMBERS WHICH BELONG TO A      J0816600
                    *     VOIDED PROGRAM.  THE REMAINING SETS ARE       J0816610
                    *     COMPRESSED TO FILL EACH HOLE AS IT DEVELOPS.  J0816620
                    *                                                   J0816630
                    *************************************************** J0816640
                    *                                                   J0816650
                    DER10 DC      *-*        ENTRY                      J0816660
                          LDD  L  RETBL      FETCH WD CNT & SCTR ADDR   J0816670
                          STD  L  RTBFR      OVERLAY UNUSED CORE        J0816680
                          LDX  L3 RTBFR      POINT XR3 TO CORE TABLE    J0816690
                          BSI  I  GET                                   J0816700
                          LDX  L2 RTBFR+2    POINT XR2 TO 1ST ENTRY     J0816710
                    DER14 LD    2 0                                     J0816720
                          EOR     DEFF2                                 J0816730
                          BSC  L  DER36,+-   BR IF END OF STRING        J0816740
                    *                                                   J0816750
                    *************************************************** J0816760
                    *                                                   J0816770
                    *     PHASE ID NUMBERS TO BE REMOVED FROM SLET AND  J0816780
                    *     FROM RELOAD TABLE ARE EQUAL TO OR LARGER      J0816790
                    *     THAN LOW LIMIT AND LESS THAN OR EQUAL TO  2-5 J0816800
                    *     HIGH LIMIT                                2-5 J0816810
                    *                                                   J0816820
                    *     IF PH IS IN RANGE, PROG WILL EXIT WITH ACC    J0816830
                    *     PLUS, OTHERWISE ACC WILL BE CLEARED TO ZERO.  J0816840
                    *                                                   J0816850
                    *************************************************** J0816860
                    *                                                   J0816870
                          EOR     DEFF2      REGAIN PHASE ID            J0816880
                          S       DELOW      IS IT LESS TAN LOW LIMIT   J0816890
                          BSC  L  DER20,+Z   BR TO OUT OF BOUNDS IF SO  J0816900
                          A       DELOW      PHASE IS OUTSIDE DELETE    J0816910
                          S       DEHGH     *BOUNDS IF ABOVE HIGH   2-5 J0816920
                          BSC  L  DER20,-Z  *LIMIT, THEN BRANCH     2-5 J0816930
                          LD    2 0          RELOAD PHASE ID TESTED     J0816940
                          MDX     DER23      CONTINUE                   J0816950
                    *                                                   J0816960
                    DER20 SRA     16         CLEAR TO AVOID VOIDING     J0816970
                          MDX     DER23      CONTINUE                   J0816980
                    *                                                   J0816990
                    *************************************************** J0817000
                    DELOW DC      *-*        STARTING PH ID TO VOID     J0817010
                    DEHGH DC      *-*       LAST PHASE ID TO VOID   2-5 J0817020
                    *************************************************** J0817030
                    *                                                   J0817040
                    DER23 BSC  L  DER25,Z    BR IF ACC +, PH IN RANGE   J0817050
                          MDX   2 3          OTHERWISE BUMP TO NEXT ID  J0817060
                          MDX     DER14      BR TO COMPARE THIS PH ID   J0817070
                    *                                                   J0817080
                    DER25 STX   2 DER29+1    SAVE CURRENT XR2 VALUE     J0817090
                          MDX   2 3                                     J0817100
                    DER27 LD    2 0          FETCH NEXT PH ID           J0817110
                          STO   2 -3         MOVE BACK 3 STEPS          J0817120
                          EOR     DEFF2      TEST FOR END OF STRFING    J0817130
                          BSC  L  DER29,+-   FALL THRU IF NOT END       J0817140
                          MDX   2 1                                     J0817150
                          MDX     DER27      KEEP MOVING UNTIL END      J0817160
                    DER29 LDX  L2 *-*                                   J0817170
                          MDX     DER14      GO TEST PH MOVED INTO HOLE J0817180
                    *                                                   J0817190
                    DER36 LD   L  2          LD C/XR2 CURRENTLY         J0817200
                          S       DER14-1    SUBTRACT BUFFER START      J0817210
                          A    L  K1                                    J0817220
                          STO   3 0          RESET WORDS TO FILE        J0817230
                          BSI  I  PUT                                   J0817240
                          BSC  I  DER10      RETURN                     J0817250
                    *                                                   J0817260
                    *************************************************** J0817270
                    *                                                   J0817280
                    *                                                   J0817290
                    *     THIS SUBROUTINE LOCATES 1ST SET IN SLET TO    J0817300
                    *     BE DELETED.  ALL ENTRIES BELONGING TO THE     J0817310
                    *     PROGRAM WHICH WAS DELETED WILL BE SET TO 0.   J0817320
                    *                                                   J0817330
                    *             FINAL EXIT IS TO DE852                J0817340
                    *                                                   J0817350
                    *************************************************** J0817360
                    *                                                   J0817370
                    *        INSTRUCTION REMOVED                    2-9 J0817375
                    DE843 LD      DELOW     PHASE ID OF 1ST PHASE   2-5 J0817380
                          BSI  L  FSS        LOCATE 1ST PH ID VOIDED    J0817390
                          BSC     Z                                     J0817400
                          MDX     DE848                                 J0817410
                          BSI  L  DE814      DEFECTIVE SLET             J0817420
                    *                                                   J0817430
                    DE848 SLT     32         CLEAR ALL 4 ENTRIES        J0817440
                          STD   2 0                                     J0817450
                          STD   2 2                                     J0817460
                          LD   L  2          TEST FOR END OF SLET SCTR  J0817470
                          S       FSAL                                  J0817480
                          BSC  L  DE846,Z   BRANCH IF NOT END       2-9 J0817490
                          BSI  I  PUT       WRITE UPDATED SECTOR    2-9 J0817500
                          BSI     DE844     READ NEXT SCTR IF THERE 2-9 J0817510
                          MDX     DE847     ERROR IF END OF SLET HIT2-9 J0817520
                          MDX   2 -4        POINT TO LAST ENTRY     2-9 J0817530
                    DE846 LD    2 4         TEST NEXT PH ID FOR END 2-9 J0817540
                          S       DEHGH                             2-5 J0817550
                          BSC  L  DE849,+-  EXIT IF EQUAL           2-5 J0817560
                          MDX   2 4         STEP UP SLET PTR            J0817570
                          MDX     DE848     REPEAT UNTIL DONE           J0817580
                    *                                                   J0817590
                    DE849 SLT     32        CLEAR THE LAST          2-5 J0817600
                          STD   2 4         *SLET ENTRY OF PROG     2-5 J0817610
                          STD   2 6                                 2-5 J0817620
                          BSI  I  PUT       WRITE SLET SECTOR       2-9 J0817630
                          BSC  L  DE852     HEAD FOR RELOAD TABLE   2-5 J0817640
                    *                       *PROCESSING             2-5 J0817650
                    *                                               2-9 J0817660
                    DE847 BSI  L  DE814     DISPLAY DEFECTIVE SLET  2-9 J0817670
                    *                                                   J0817680
                    *************************************************** J0817690
                    FSAL  DC      FSLET+2+316  ADDR OF LAST SLET SET    J0817700
                    DEFF2 DC      -1         CONSTANT                   J0817710
                    DE829 DC      *-*        TEMPORARY SCTR STORAGE     J0817720
                    KAND  DC      /3FFF      SIGN BIT MASK              J0817730
                    DE830 DC      *-*        STORAGE                    J0817740
                    *             CONSTANT REMOVED                  2-9 J0817750
                    *                                                   J0817760
                    DE794 BSI  I  PHIDM                                 J0817770
                          DC      /0408      RECORD MODULE              J0817780
                    *                                                   J0817790
                          LDX  L1 C         RESTORE XR1             2-5 J0817800
                          LD    1 #FLET      TEST FOR FXA PRESENT       J0817810
                          BSC  L  DE800,+-   OK TO VOID IF NONE         J0817820
                          LDX   1 ERM1       SET UP FOR ERROR           J0817830
                          BSI  L  SSEL                                  J0817840
                    *                                                   J0817850
                    DE800 LD      DELOW      TEST PRESET SCTR ADDR      J0817860
                          BSI  L  FSS        VERIFY PRESENCE            J0817870
                          BSC  L  DE803,Z-                              J0817880
                          NOP                TRACE WORD                 J0817890
                    DE801 LDX  I1 ERRNO     GET ERR MSG NO.         2-5 J0817900
                          BSI  L  SSEL       TO SET-UP FOR ERROR        J0817910
                    *                                                   J0817920
                    DE803 LDX  L2 D          RESET POINTER              J0817930
                          LD    2 FAD2-D    GET FROM ADDR          2-10 J0817940
                          S     2 TAD2-D    *SUBTRACT TO ADDR      2-10 J0817950
                          STO   2 DE870-D   TOTAL SECTORS TO SHIFT 2-10 J0817960
                          LD    1 #SCRA                                 J0817970
                    *  1 INSTRUCTION MOVED                         2-12 J0817980
                          S     2 K1-D                                  J0817990
                          STO   2 LMV-D      LAST SCTR TO BE MOVED      J0818000
                    *                                               2-5 J0818010
                          S     1 #CSHN     CUSHION NOT MOVED      2-12 J0818015
                          S     2 FAD2-D    CHK IF PROG TO VOID IS  2-5 J0818020
                          BSC  L  DE808,+Z  *LAST SYS PROG. THEN    2-5 J0818030
                    *                       *BRANCH AROUND MOVE.    2-5 J0818040
                          LD    2 DE870-D   SET SECTORS OF         2-10 J0818042
                          STO   2 SVMAG-D   *SYS PROG SHIFT        2-10 J0818044
                    *                                              2-10 J0818046
                          BSI  L  MOVE       MOVE THE SYSTEM PROGRAMS   J0818050
                    DE808 NOP                FOR DEBUG STOP             J0818060
                          LD      DEHGH                             2-5 J0818070
                          BSI  L  FSS       LOCATE LAST ENTRY OF    2-5 J0818080
                    *                       *PROGRAM TO VOID        2-5 J0818090
                          BSI  L  DE814,+-   BR TO ERROR IF MISSING     J0818100
                          MDX   2 4         MOVE PTR TO NEXT ENTRY  2-5 J0818110
                    DE820 LD    2 3          LOAD SCTR ADDR             J0818120
                          BSC     +-                                    J0818130
                          MDX     DE834      NO CHANGE IF ZERO          J0818140
                          STO     DE829      SAVE SCTR                  J0818150
                          AND     KAND       MASK OUT SIGN BIT          J0818160
                          S    L  SVMAG      DECR SCTR ADDR             J0818170
                          STO     DE830                                 J0818180
                          LD      DE829                                 J0818190
                          SRA     15         SAVE SIGN BIT IF PRESENT   J0818200
                          SLA     15                                    J0818210
                          OR      DE830      OR SIGN INTO NEW SCTR ADDR J0818220
                          STO   2 3                                     J0818230
                    DE834 LD   L  2          TEST FOR END OF SECTOR     J0818240
                          S       FSAL                                  J0818250
                    DE836 BSC  L  DE840,+-   BR WHEN END IS REACHED     J0818260
                          MDX   2 4                                     J0818270
                          MDX     DE820      REPEAT                     J0818280
                    DE840 BSI  I  PUT        FILE BACK                  J0818290
                          BSI     DE844     GET NEXT SLET SECTOR    2-9 J0818300
                          MDX     DE843     EXIT IF SLET FINISHED   2-9 J0818310
                          MDX     DE820     PROCESS NEXT SLET SCTR  2-9 J0818320
                    *                                               2-9 J0818330
                    ************************************************2-9 J0818340
                    *                                               2-9 J0818350
                    *        READ NEXT SLET SECTOR IF NOT AT END    2-9 J0818360
                    *        DIRECT RETURN IF SLET EXHAUSTED        2-9 J0818370
                    *        DIRECT + 1 RETURN IF NEXT SCTR READ    2-9 J0818380
                    *                                               2-9 J0818390
                    ************************************************2-9 J0818400
                    DE844 DC      *-*                               2-9 J0818410
                          LD   L  BUF5+1    GET CURRENT SLET S/A    2-9 J0818420
                          S    L  SLETC     TEST IF LAST ONE READ   2-9 J0818430
                          BSC  L  DE845,+-  BRANCH IF YES           2-9 J0818440
                          MDX  L  DE844,1   INCREMENT RETURN ADDRESS2-9 J0818450
                          MDX  L  BUF5+1,1  FIND NEXT SLET SCTR ADDR2-9 J0818460
                          BSI  L  GETX      READ NEXT SLET SECTOR   2-9 J0818470
                          LDX  L2 BUF5+2    POINT TO 1ST WORD OF SCT2-9 J0818480
                    DE845 BSC  I  DE844     RETURN                  2-9 J0818490
                    *************************************************** J0818500
                          HDNG         EXPAND FIXED AREA                J0818510
                    *************************************************** J0818520
                    *                                                   J0818530
                    *                  EXPANSION FOR FIXED AREA         J0818540
                    *                                                   J0818550
                    *************************************************** J0818560
                    MVDSK LD    2 SUBSA-D                               J0818570
                          STO  L  BUF5+1     SAD TO GET IN IOAR         J0818580
                          BSI  L  GETX       GET 1 SECTOR               J0818590
                          LD    2 SVFPA-D                               J0818600
                          STO  L  BUF5+1     SCTR ADDR TO RELOCATE TO   J0818610
                          BSI  L  PUTX       WRITE 1 SECTOR             J0818620
                          LD    2 DE#CI-D                               J0818630
                          S     2 SUBSA-D    HAVE ALL BEEN MOVED        J0818640
                          BSC  L  DKMVD,-    YES                    2-4 J0818650
                          MDX  L  SUBSA,-1   MOVE ANOTHER SECTOR        J0818660
                          MDX  L  SVFPA,-1   *UNTIL DE#CI IS REACHED    J0818670
                          MDX     MVDSK      GO BACK TO MOVE SKTRS      J0818680
                    *                                                   J0818690
                    *************************************************** J0818700
                    *                                                   J0818710
                    *               WRITE 1 DUMMY FLET ENTRY            J0818720
                    *               NO PREVIOUS FLET WAS PRESENT        J0818730
                    *                                                   J0818740
                    *************************************************** J0818750
                    SHDR  DC      +0                                    J0818760
                    DENOP NOP                THIS NOP USED AS CONSTANT  J0818770
                          LDX  L3 BUF5+2     POINT XR3 TO 1ST DATA WD   J0818780
                          LD    2 K16-D      STORE HEX 0010 TO 1ST SCTR J0818790
                          STO   3 0                                     J0818800
                          LD    2 OLDCB-D    FETCH ORIGINAL CIB ADDRS   J0818810
                          A     2 K8-D       FORM ADDR OF NEXT CYLINDER J0818820
                          STO   3 1                                     J0818830
                          SLA     16                                    J0818840
                          STO   3 2          ZERO TO RESERVED WORD      J0818850
                          STO   3 4          INDICATE LAST FLET SCTR    J0818860
                          LD    2 K0138-D    SET UP AVAILABLE WORDS     J0818870
                          STO   3 3          NEW FLET SECTOR            J0818880
                          LDD   2 DUMNM-D                               J0818890
                          STO   3 5          SETUP NAME---1DUMY         J0818900
                          RTE     16                                    J0818910
                          STO   3 6                                     J0818920
                          LD    2 NOCYL-D    FETCH SECTOR COUNT         J0818930
                    SHDR1 NOP                INSTRUC MODIFIED IF NO     J0818940
                          NOP                *PREVIOUS FXA              J0818950
                          SLA     4          MULTIPLY TO GET BYTES      J0818960
                          STO   3 7          FXA SIZE IN BYTES          J0818970
                          MDX   3 -2         POINT XR3 TO IOAR          J0818980
                    *                        FILE FLET SECTOR           J0818990
                    *                        THIS ADDR WILL ALSO BE     J0819000
                    *                        *PUT IN LET                J0819010
                          BSC  I  SHDR       RETURN                     J0819020
                    *                                                   J0819030
                    *     NO PREVIOUS FLET OR FIXED AREA                J0819040
                    *                                                   J0819050
                    DENOF LD    2 OLDCB-D    OLD CIB ADDR IS NEW FLET   J0819060
                          A     2 DE485-D    ADD IN THE DRIVE NO.       J0819070
                          LDX  I1 DECDC      POINT TO QUINTUPLE ENTRY   J0819080
                          STO   1 #FLET                                 J0819090
                          STO   2 DE#FL-D                               J0819100
                    *                                                   J0819110
                    *     XR1 HAS BEEN MODIFIED BY DRIVE NUMBER         J0819120
                    *                                                   J0819130
                          NOP                                           J0819140
                          LD    2 SK8-D      SETUP THE INSTRUCTION TO   J0819150
                          STO     SHDR1      *MODIFY AMT OF FX A BEING  J0819160
                    *                        *ADDED, IF NO PREV FX A    J0819170
                          LD    2 SK8+1-D    *TO ALLOW FOR INITIATION   J0819180
                          STO     SHDR1+1    *OF FLET                   J0819190
                          BSI     SHDR       BUILD THE SECTOR HEADER    J0819200
                          LD      DENOP      NOP THE MODIFYING INST FOR J0819210
                          STO     SHDR1      *USE BY OTHER PORTIONS OF  J0819220
                    *                        *THE PROGRAM               J0819230
                          STO     SHDR1+1                               J0819240
                          LD    2 N80-D      TO SUBTRACT FOR FLET CYL   J0819250
                    *                        C/N80 IS NO. OF DBS/CYL    J0819260
                          STO   2 ADRSV-D                               J0819270
                          A     2 DEBES-D    CALCULATE AVAILABLE DBS    J0819280
                          STO   2 DEDBA-D    SAVE FOR SIGN OFF          J0819290
                          LD    1 #FLET      NEW FLET SECTOR ADDR       J0819300
                          STO  L  BUF5+1     FLET SAD TO IOAR           J0819310
                          LD    2 K8-D       WORDS TO WRITE ON DISK     J0819320
                          STO   3 +0                                    J0819330
                          BSI  L  PUTX       WRITE FLET DUMMY SCTR      J0819340
                          LD    2 K320-D     RESET WD COUNT FOR FULL    J0819350
                          STO   3 +0         *SECTOR                    J0819360
                          BSC  L  FINSH      TO FINISH THE JOB          J0819370
                    *                                                   J0819380
                    D     EQU     DECST                                 J0819390
                          BSS     BUF5-/7000-*-1 AUXILARY PATCH AREA    J0819400
                          DC      /FFFF      END OF DEFINE PATCH AREA   J0819410
                    *************************************************** J0819420
                    *                                                   J0819430
                    *     USE PATCH AREA NO. 1 FOR ANY PATCH NOT IN     J0819440
                    *     *VOLVING VOID FORTRAN/ASM.  OTHERWISE USE     J0819450
                    *     PATCH AREA NO. 2 WHICH PRECEDES BUF7.         J0819460
                    *                                                   J0819470
                    *     PATCH AREA NO. 1 MUST NOT OVERLAY BUF5        J0819480
                    *     PATCH AREA NO. 2 MUST NOT OVERLAY BUF7        J0819490
                    *                                                   J0819500
                    *************************************************** J0819510
                          END     B                                     J0819520
