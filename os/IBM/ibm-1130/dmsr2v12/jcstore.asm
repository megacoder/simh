                          HDNG    STORE-    RESIDENT COMMA   2 AUG 67   J0300010
                          ABS                                           J0300020
                    $CIBA EQU     /5   ADDR OF CIB ON MASTER CARTRIDGE  J0300030
                    $CH12 EQU     /6   CHANNEL 12 INDR,NON-ZERO=CHAN 12 J0300040
                    $COMN EQU     /7   WORD COUNT OF COMMON             J0300050
                    $CORE EQU     /E   CORE SIZE,/1000=4K,/2000=8K,ETC) J0300060
                    $CTSW EQU     /F   MCR SW,NON-ZERO=// RECD TRAPPED  J0300070
                    $DADR EQU     /10  SCTR ADDR OF PROG TO BE FETCHED  J0300080
                    $DABL EQU     /11  IOCC FOR SCA RESET (ODD ADDR)    J0300090
                    $DREQ EQU     /12  INDR FOR REQUESTED V. DISK I/O   J0300100
                    $IBSY EQU     /13  PRINC I/O BUSY INDR,NON-ZERO=BSY J0300110
                    $HASH EQU     /14  WORK AREA FOR MONITOR PROGRAMS   J0300120
                    $PRET EQU     /28  ADDR PREOPERATIVE ERROR TRAP     J0300130
                    $IREQ EQU     /2C  ADDR OF INT REQUEST SUBROUTINE   J0300140
                    $ULET EQU     /2D  ADDR OF LET, LOGICAL DRIVE 0     J0300150
                    $IOCT EQU     /32  IOCS CTR,0=NO I/O IN PROGRESS    J0300160
                    $LAST EQU     /33  LAST CD INDR,NON-ZERO=LAST CARD  J0300170
                    $NDUP EQU     /34  INHIBIT DUP SW,NON-ZERO=NO DUP   J0300180
                    $NXEQ EQU     /35  INHIBIT EXEC SW,NON-ZERO=NO EXEQ J0300190
                    $PBSY EQU     /36  PRINC PTR BUSY INDR,NON-ZERO=BSY J0300200
                    $PGCT EQU     /37  PAGE NO. FOR PAGE HEADINGS       J0300210
                    $EXIT EQU     /38  ADDR CALL EXIT ENTRY POINT       J0300220
                    $LINK EQU     /39  ADDR CALL LINK ENTRY POINT       J0300230
                    $DUMP EQU     /3F  ADDR OF CALL DUMP, ENTRY POINT   J0300240
                    $DCDE EQU     /77  DRIVE CODE FOR CORE LOAD BLDR    J0300250
                    $PHSE EQU     /78  NO. OF PHASE CURRENTLY IN CORE   J0300260
                    $UFIO EQU     /79  ARM POSITION IN UNFORMATTED AREA J0300270
                    $WSDR EQU     /7A  WORKING STORAGE DRIVE CODE       J0300280
                    $WRD1 EQU     /7B  LOAD ADDR FOR CURR USER CORE LD  J0300290
                    $KCSW EQU     /7C  INHIBIT INPUT/PRINT OVERLAP SW   J0300300
                    $UFDR EQU     /7D  UNFORMATTED I/O DRIVE CODE       J0300310
                    $CPTR EQU     /7E  CHANNEL 12 INDICATOR FOR CP      J0300320
                    $1132 EQU     /7F  CHANNEL 12 INDICATOR FOR 1132    J0300330
                    $1403 EQU     /80  CHANNEL 12 INDICATOR FOR 1403    J0300340
                    $PST1 EQU     /81  ADDR POSTOP ERROR TRAP,LEVEL 1   J0300350
                    $PST2 EQU     /85  ADDR POSTOP ERROR TRAP,LEVEL 2   J0300360
                    $PST3 EQU     /89  ADDR POSTOP ERROR TRAP,LEVEL 3   J0300370
                    $PST4 EQU     /8D  ADDR POSTOP ERROR TRAP,LEVEL 4   J0300380
                    $STOP EQU     /91  ADDR PROGRAM STOP KEY TRAP       J0300390
                    $FPAD EQU     /95  FILE PROTECT ADDR (ADJ),LOG DR 0 J0300400
                    $CYLN EQU     /9A  ARM POSITION FOR LOGICAL DRIVE 0 J0300410
                    $ACDE EQU     /9F  AREA CODE FOR LOGICAL DRIVE 0    J0300420
                    $DCYL EQU     /A4  1ST DEF CYL ADDR, LOGICAL DR 0   J0300430
                    $I200 EQU     /B3  ENTRY POINT TO ILS FOR LEVEL 2   J0300440
                    $I205 EQU     /B8                                   J0300450
                    $IBT2 EQU     $I205+1 ADDR OF IBT FOR LEVEL 2       J0300460
                    $I400 EQU     /C4  ENTRY POINT TO ILS FOR LEVEL 4   J0300470
                    $I405 EQU     /D3                                   J0300480
                    $IBT4 EQU     $I405+1 ADDR OF IBT FOR LEVEL 4       J0300490
                    $I410 EQU     /D5                                   J0300500
                    $DBSY EQU     /EE  DISK BUSY INDR,NON-ZERO=DK BUSY  J0300510
                    $BYSW EQU     /1CB BYPASS SW,NOP IF FETCHING SOCAL  J0300520
                    DZ000 EQU     /0F2 DISKZ ENTRY POINT                J0300530
                    $ZEND EQU     /1E0 ADDR 1+LAST WORD OF DISKZ        J0300540
                          HDNG          CONCATENATED COMMON AREA(CATCO) J0300550
                    C     EQU     /7FA0     CATCO POINTER SET TO MIDDLE J0300560
                    *************************************************** J0300570
                    *                                                 * J0300580
                    *  INDEX REG 1 IS SET TO .C. WHEN CATCO IS FORMED * J0300590
                    *  FOR USE BY ALL OF DUP FUNCTIONS. ANY DUP ROUT  * J0300600
                    *  USING XR 1 FOR OTHER REASONS MUST RESTORE.     * J0300610
                    *  ALL VALUES IN CATCO HAVE LABELS EQUATED TO THE * J0300620
                    *  VALUE THAT INDICATES THEIR RELATIVE LOCATION   * J0300630
                    *  FROM .C.                                       * J0300640
                    *                                                 * J0300650
                    *************************************************** J0300660
                    *                                                 * J0300670
                    *             CATCO DCOM IMAGE                    * J0300680
                    *   EQUIVALENCES USED TO REFERENCE CATCO WITH XR1 * J0300690
                    *                                                 * J0300700
                    *************************************************** J0300710
                    #NAME EQU     4-/80     NAME OF PROGRAM             J0300720
                    #DBCT EQU     6-/80     DISK BLOCK COUNT OF PROGRAM J0300730
                    #FCNT EQU     7-/80     FILES SW,ZERO = NO FILES    J0300740
                    #SYSC EQU     8-/80     NON-ZERO,SYSTEM CARTRIDGE   J0300750
                    #JBSW EQU     9-/80     JOB SW,NON-ZERO='T' MODE    J0300760
                    #CBSW EQU     10-/80    CLB SW,NON-ZERO=STORECI     J0300770
                    #LCNT EQU     11-/80    NO. OF LOCALS               J0300780
                    #MPSW EQU     12-/80    NON-ZERO, CORE MAP DESIRED  J0300790
                    #MDF1 EQU     13-/80    NO. OF DUP CTRL RCDS        J0300800
                    #MDF2 EQU     14-/80    ADDR OF MODIF BUFFER        J0300810
                    #NCNT EQU     15-/80    NO. OF NOCALS               J0300820
                    #ENTY EQU     16-/80    RELATIVE ENTRY ADDR OF PROG J0300830
                    #RP67 EQU     17-/80    IF NON-ZERO,1442 MOD 6,7    J0300840
                    *                                                   J0300850
                    *   NEGATIVE VALUE REPRESENTS DEFAULT CONDITION   * J0300860
                    #TODR EQU     18-/80    DR CODE OF 'TO' DRIVE       J0300870
                    #FRDR EQU     19-/80    DR CODE OF 'FROM' DRIVE     J0300880
                    *                                                 * J0300890
                    #FHOL EQU     20-/80    ADDR OF LARGEST FXA HOLE    J0300900
                    #FSZE EQU     21-/80    BLK CNT LARGEST HOLE IN FXA J0300910
                    #UHOL EQU     22-/80    ADDR OF LARGEST UA HOLE     J0300920
                    #USZE EQU     23-/80    BLK CNT LARGEST HOLE IN UA  J0300930
                    #DCSW EQU     24-/80    NON-ZERO=DUP CALL           J0300940
                    #PIOD EQU     25-/80    PRINC. I/O INDICATOR        J0300950
                    #PPTR EQU     26-/80    PRINC. PRINTER INDICATOR    J0300960
                    #CIAD EQU     27-/80    WD NO. SCTR 0,CIL ADDR      J0300970
                    #ACIN EQU     28-/80    AVAILABLE CARTRIDGE INDR2-8 J0300980
                    #GRPH EQU     29-/80    2250 INDICATOR          2-8 J0300990
                    #GCNT EQU     30-/80    NO. G2250 RECORDS       2-8 J0301000
                    #LOSW EQU     31-/80    LOCAL-CALLS-LOCAL INDR  2-8 J0301010
                    #X3SW EQU     32-/80    SPECIAL ILS SWITCH      2-8 J0301020
                    #ECNT EQU     33-/80    NO. OF EQUAT RCDS       2-8 J0301030
                    #ANDU EQU     35-/80    END OF UA (ADJ) LOG DR 0-4  J0301040
                    #BNDU EQU     40-/80    END OF UA (BASE) LOG DR 0-4 J0301050
                    #FPAD EQU     45-/80    FILE PROTECT ADDR (BASE)    J0301060
                    #PCID EQU     50-/80    CART ID, PHYS DR 0-4        J0301070
                    #CIDN EQU     55-/80    CART ID, LOG DR 0-4         J0301080
                    #CIBA EQU     60-/80    CIB ADDR, LOG DR 0-4        J0301090
                    #SCRA EQU     65-/80    SCRA, LOG DR 0-4            J0301100
                    #FMAT EQU     70-/80    WS FORMAT, LOG DR 0-4       J0301110
                    #FLET EQU     75-/80    FLET ADDR, LOG DR 0-4       J0301120
                    #ULET EQU     80-/80    LET ADDR, LOG DR 0-4        J0301130
                    #WSCT EQU     85-/80    WS BLK CNT, LOG DR 0-4      J0301140
                    #CSHN EQU     90-/80    CUSHION END SCTR ADDR, 0-4  J0301150
                    #DCOM EQU     1         SCTR ADDR OF DCOM           J0301160
                    #HDNG EQU     7         SCTR WITH PAGE HEADING      J0301170
                    @SBFR EQU     /FB0                              2-8 J0301180
                          HDNG    CONCATENATED COMMON AREA (CATCO)      J0301190
                    *************************************************** J0301200
                    *                                                 * J0301210
                    *             CATCO IOAR HDRS FOR DUP PHASES        J0301220
                    *                                                 * J0301230
                    *************************************************** J0301240
                          ORG     -/10                                  J0301250
                    DCHDR BSS     2         DUP CONTROL            PH02 J0301260
                    STHDR BSS     2         STORE                  PH03 J0301270
                    FLHDR BSS     2         FILEQ                  PH04 J0301280
                    DMHDR BSS     2         DUMP                   PH05 J0301290
                    DLHDR BSS     2         DUMPLET                PH06 J0301300
                    DTHDR BSS     2         DELETE                 PH07 J0301310
                    DFHDR BSS     2         DEFINE                 PH08 J0301320
                    DXHDR BSS     2         DUP EXIT               PH09 J0301330
                    UCHDR BSS     2         DUP UPCOR              PH13 J0301340
                    PIHDR BSS     2         PRINCIPAL I/O BLOCK    PH14 J0301350
                    SIHDR BSS     2         PRINC I/O (W/O KB) BLK PH15 J0301360
                    PTHDR BSS     2         PAPER TAPE I/O BLOCK   PH16 J0301370
                    CIHDR BSS     2         CI PHASE READ BY CL BUILDER J0301380
                    MUHDR BSS     2         MACRO UPDATE      PH206 2-8 J0301390
                    D2HDR BSS     2         DUP CONTROL 2     PH205 2-8 J0301400
                          HDNG    STORE-    CATCO DUP SWITCHES          J0301410
                    *************************************************** J0301420
                    *                                                   J0301430
                    *             CATCO DUP SWITCHES                  * J0301440
                    *      WORDS USED FOR COMMUNICATION OF DATA         J0301450
                    *   BETWEEN DUP ROUTINES.                           J0301460
                    *                                                 * J0301470
                    *      INITIALIZED TO ZERO BY  .REST. OF DUPCO    * J0301480
                    *                                                   J0301490
                    *************************************************** J0301500
                    CL1   EQU     *                                     J0301510
                    ASMSW BSS     1         NON ZERO IF DEFINE VOID ASM J0301520
                    BITSW BSS     1         NON ZERO TO ALLOW MDUMP-S   J0301530
                    BLKSW BSS     1         NON ZERO IF BYPASSING REC   J0301540
                    CIERR BSS     1         ERROR NO DETECTED BY PH 17  J0301550
                    CISW  BSS     1         NON ZERO IF STORE CI        J0301560
                    CLBSW BSS     1         NON ZERO IF PRECI EXECUTED  J0301570
                    CNTNO BSS     1         RECORD NO BEING PCHD OR RD  J0301580
                    *                                                 * J0301590
                    *   .DATSW. IS FILLED WITH THE CNT FIELD OF THE   * J0301600
                    *   DUP CONTROL RECORD.                           * J0301610
                    *   USED PRIMARILY FOR DATA MOVEMENT, BUT ALSO IS * J0301620
                    *   USED FOR COUNT OF RECORDS TO READ AFTER A     * J0301630
                    *   STORE CI DUP CONTROL RECORD.                  * J0301640
                    DATSW BSS     1         RECORDS VALUE IN CNT FIELD  J0301650
                    DBADR BSS     1         DB ADDR OF REFERENCED PROG  J0301660
                    DELSW BSS     1         ADDR OF REQ LET ENTRY - 1   J0301670
                    DFNSW BSS     1         NON ZERO IF DEFINE FXA      J0301680
                    DKSAD BSS     1         DK SCTR ADDR W/O DR CODE    J0301690
                    DUMPP BSS  E  2         LAST LIMITS FOR PRNTR DUMP  J0301700
                    FORSW BSS     1         NON ZERO IF DEFINE VOID FOR J0301710
                    FRWS  BSS     1         NON ZERO IF FROM FLD IS WS  J0301720
                    FXSW  BSS     1         NON ZERO IF FIXED AREA REQD J0301730
                    HOLSW BSS     1         NON ZERO IF NO CONV REQD    J0301740
                    IOSW  BSS     1         NON ZERO IF IN/OUT REQD     J0301750
                    *                                                 * J0301760
                    *   DUMPLET SWITCH - ZERO IF NOT DUMPLET/DUMPFLET * J0301770
                    *       PLUS VALUE REQUIRES PRINT OF BOTH LET/FLET* J0301780
                    *       NEG. VALUE REQUIRES PRINT OF FLET ONLY    * J0301790
                    LETSW BSS     1         NON ZERO,PRINT LET OR FLET* J0301800
                    LSTLF BSS     1         LAST LET/FLET SECT PROCESSD J0301810
                    MODSW BSS     1         NON ZERO IF STORE MOD FUNC  J0301820
                    NAMSW BSS     1         NON ZERO IF NAME IN LET/F   J0301830
                    NEGSW BSS     1         NON ZERO IF SHRINKING FXA   J0301840
                    PGMHL BSS     1         WORD COUNT OF THE PROG HDR  J0301850
                    PRSW  BSS     1         NON ZERO IF PRINTING OUTPUT J0301860
                    PTSW  BSS     1         NON ZERO IF PAPER TAPE REQD J0301870
                    SKWDS BSS     1         WDS TO SEARCH IN L/F SECT   J0301880
                    STCSW BSS     1         NON ZERO IF STORE DATA CI   J0301890
                    STSW  BSS     1         NON ZERO IF STORE TYPE      J0301900
                    TEMP1 BSS  E  1         1ST WD OF BINEB OUTPUT      J0301910
                    TEMP2 BSS     1         2ND WD OF BINEB OUTPUT      J0301920
                    TOWS  BSS     1         NON ZERO IF TO FIELD IS WS  J0301930
                    T3MSW BSS     1         TYPE 3,4 SOCAL LEVEL CELL   J0301940
                    UASW  BSS     1         NON ZERO IF USER AREA REQD  J0301950
                    WSSW  BSS     1         NON ZERO IF WORK STG REQD   J0301960
                    XEQSW BSS     1         NON ZERO IF NOT RET FR GET  J0301970
                    EBCSW BSS     1         NON ZERO IF EBC DATA OP 2E2 J0301980
                    HDNSW BSS     1         NON ZERO IF NAME IN HDR 2-8 J0301990
                    RPGSW BSS     1         NON Z IF DEFINE VOID RPG2-8 J0302000
                    DFLSW BSS     1         NON ZERO IF *DFILE      2-8 J0302010
                          BSS     1         RESERVED FOR ADDITION   2-8 J0302020
                    CL2   EQU     *-1                                   J0302030
                          HDNG    STORE-    CATCO DUP SWITCHES          J0302040
                    *************************************************** J0302050
                    *                                                 * J0302060
                    *             CATCO DUP SWITCHES                  * J0302070
                    *  INITIALIZED BY DCTL AND NOT RESET BY .REST.    * J0302080
                    *                                                 * J0302090
                    *************************************************** J0302100
                    IOREQ BSS     1         NON-ZERO,AUX I/O SET REQ    J0302110
                    PH2   BSS     1         NON-ZERO IF DCTL IN CORE    J0302120
                    PH3   BSS     1         NON-ZERO IF STORE IN CORE   J0302130
                    PH4   BSS     1         NON-ZERO IF DUMP IN CORE    J0302140
                    ************************************************2-8 J0302150
                    *                                               2-8 J0302160
                    *             CATCO SWITCH INITIALIZED TO ZERO  2-8 J0302170
                    *   BY CCAT SUBR AND SET BY MACRO UPDATE PROGRAM2-8 J0302180
                    *                                               2-8 J0302190
                    ************************************************2-8 J0302200
                    DUPCR BSS     1         NON ZERO IF DUP CTRL RCD2-8 J0302210
                    *************************************************** J0302220
                    *                                                 * J0302230
                    *             CATCO DUP SWITCHES SET BY CCAT SUBR * J0302240
                    *                                                 * J0302250
                    *************************************************** J0302260
                    ADDR2 BSS     1         KB INTERRUPT ADDRESS        J0302270
                    KBREQ BSS     1         CONTENTS OF LOC 13          J0302280
                    *      THE FOLLOWING SWITCH IS SET TO INDICATE THE  J0302290
                    *       PRINCIPAL INPUT DEVICE                      J0302300
                    *             -  IS PAPER TAPE                      J0302310
                    *             0  IS CARD                            J0302320
                    *             +  IS KEYBOARD                        J0302330
                    INOUT BSS     1         PRINCIPAL INPUT SWITCH      J0302340
                    *                                                   J0302350
                    PTPON BSS     1         NON-ZERO IF PAPER TP ON SYS J0302360
                    *************************************************** J0302370
                    *                                                 * J0302380
                    *             LEVEL 4 INTERRUPT BRANCH TABLE      * J0302390
                    *             ADDRESSES. INITIALIZED BY CCAT,     * J0302400
                    *             AND CARD/PAPER TAPE INTERFACES.     * J0302410
                    *                                                 * J0302420
                    *************************************************** J0302430
                          ORG     /0049                                 J0302440
                    IBT   BSS     9         9 WD INTRPT BRANCH TABLE    J0302450
                    *************************************************** J0302460
                    *                                                 * J0302470
                    *             CATCO I/O ADDRESSES REQUIRED BY DUP * J0302480
                    *                                                 * J0302490
                    *************************************************** J0302500
                    P1442 BSS  E  2         SYS 1442 IOAR HEADER        J0302510
                    PRPAR BSS     2         DEFAULT LIMITS TO PRINT     J0302520
                    PHDUP BSS     1         LAST DUP PHASE IN CORE      J0302530
                    CRBUF BSS     1         81 WD BFR FOR DUP CTRL RCDS J0302540
                    DCADR BSS     1         ADDR FOR DUP CTRL IOAR HDR  J0302550
                    HDBUF BSS     1         ADDR OF PAGE HEADING BFR    J0302560
                    IOBLK BSS     1         ADDR OF DUP I/O PHASE       J0302570
                    SDBUF BSS     1         STORE/DUMP BUFFER           J0302580
                    LETAR BSS     1         ADDR OF LET SEARCH BUFFER   J0302590
                    PEBUF BSS     1         41 WD BFR FOR PACKED EBCDIC J0302600
                    THIS  BSS     1         ADDR OF DOUBLE BFR, BFR 1   J0302610
                    NEXT  BSS     1         ADDR OF DOUBLE BFR, BFR 2   J0302620
                          HDNG              DUP CORE PARAMETERS         J0302630
                    DISKZ EQU     DZ000     DISKZ ENTRY POINT           J0302640
                    B     EQU     $ZEND-2                               J0302650
                    DMPLC EQU     B         IOAR CORE ADDR FOR DMPLT    J0302660
                    EXITC EQU     B         IOAR CORE ADDR FOR DEXIT    J0302670
                    MUPC  EQU     B         IOAR CORE ADDR FOR MUP  2-8 J0302680
                    DCTL  EQU     B+/1002   ENTRY ADDRESS OF DCTL       J0302690
                    DCTLC EQU     B+/1000   IOAR CORE ADDR FOR DCTL     J0302700
                    WSDC  EQU     B+/2000   IOAR CORE ADDR FOR STORE    J0302710
                    DUMPC EQU     B+/4000   IOAR CORE ADDR FOR DDUMP    J0302720
                    DUPCO EQU     /7DB0     ADDR OF RESIDENT DUPCO      J0302730
                    CATCO EQU     /7F20-2   ADDR OF DCOM IOAR HEADER    J0302740
                    *                                                 * J0302750
                    *  DUPCO ENTRY POINTS...USED WITH INDIRECT BSI    * J0302760
                    *                                                 * J0302770
                          ORG     DUPCO                                 J0302780
                    BINEB BSS     1         CONVERSION BINARY TO EBCDIC J0302790
                    WRTDC BSS     1         WRITE DCOM(S) SUBROUTINE    J0302800
                    ENTER BSS     1         SAVE XR-S AND CONDITIONS    J0302810
                    GET   BSS     1         READ FROM DISK USING DISKZ  J0302820
                    LEAVE BSS     1         HANDLES ALL EXITS FROM DUP  J0302830
                    LINE  BSS     1         SPACES PRINTER 1 LINE       J0302840
                    MASK  BSS     1         INHIBITS KB INT REQUEST     J0302850
                    MDUMP BSS     1         PRINTS SELECTED CORE LOC-S  J0302860
                    PAGE  BSS     1         SKIPS TO NEXT PAGE          J0302870
                    PHID  BSS     1         RECORDS PHASE ID            J0302880
                    PHIDM BSS     1         RECORDS PHASE AND MODIFIER  J0302890
                    PRINT BSS     1         USE SYS PR SUBR TO PRINT    J0302900
                    PUT   BSS     1         WRITES TO DISK USING DISKZ  J0302910
                    REST  BSS     1         RESTORE CATCO,GO TO DCTL    J0302920
                    RTURN BSS     1         RESTORE XR-S AND CONDITIONS J0302930
                    *                                                 * J0302940
                    *  INPUT/OUTPUT PARAMETERS , CORE ADDRESSES       * J0302950
                    *                                                 * J0302960
                    BUF6  EQU     DUPCO-/1F ADDR OF PAGE HEADING BUFFER J0302970
                    PRPNT EQU     BUF6-/141  IOAR ADDR FOR PRINC.PTR    J0302980
                    IOADR EQU     BUF6-/38B  START OF I/O INTERFACE     J0302990
                    GETHO EQU     IOADR+4   ENTRY FOR READING HOLL TYPE J0303000
                    GETBI EQU     IOADR+5   ENTRY FOR READING BINARY    J0303010
                    PACKB EQU     IOADR+6   ENTRY TO PACK BINARY        J0303020
                    PCHBI EQU     IOADR+7   ENTRY TO PUNCH BINARY       J0303030
                    BUF1  EQU     IOADR-/51 ADDR OF NEXT BUFFER         J0303040
                    BUF2  EQU     BUF1-/52  ADDR OF THIS BUFFER         J0303050
                    BUF3  EQU     BUF2-/3E  ADDR OF PACKED EBC BUFFER   J0303060
                    BUF4  EQU     BUF3-/52  ADDR OF CONTROL RCD BUFFER  J0303070
                    BUF5  EQU     IOADR-/284    ADDR OF LET SCTR BFR    J0303080
                    BUF7  EQU     BUF5-/7142   ADDR OF STORE/DUMP BFR   J0303090
                          HDNG    STORE--PROLOGUE                       J0303100
                    *************************************************** J0303110
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * J0303120
                    *                                                 * J0303130
                    *FUNCTION/OPERATION-                              * J0303140
                    *   * THIS DUP MODULE STORES PROGRAMS OR DATA     * J0303150
                    *     FROM CARDS,PAPER TAPE, OR WORKING STORAGE   * J0303160
                    *     (OF ANY DRIVE) TO WORKING STORAGE,USER AREA * J0303170
                    *     OR FIXED AREA OF ANY DRIVE.                 * J0303180
                    *   * STORE RESIDES IN CORE THROUGHOUT THE STORE  * J0303190
                    *     OPERATION WITH THE EXCEPTION OF A STORE     * J0303200
                    *     CORE IMAGE. IN ADDITION, STORE WILL RESIDE  * J0303210
                    *     IN CORE AT ALL TIMES THAT DUP IS IN CONTROL * J0303220
                    *     IF CORE SIZE IS GREATER THAN 8K.            * J0303230
                    *                                                 * J0303240
                    *ENTRY POINTS-                                    * J0303250
                    *   STORE-ENTER FROM DUP CONTROL EITHER AS THE    * J0303260
                    *         RESULT OF A STORE CONTROL RECORD, OR    * J0303270
                    *         THE COMPLETION OF A STORE CORE IMAGE    * J0303280
                    *         BY DUP PHASE 17 WHICH RETURNS TO STORE  * J0303290
                    *         BY WAY OF DUP CONTROL.                  * J0303300
                    *                                                 * J0303310
                    *INPUT-                                           * J0303320
                    *   * CARDS OR PAPER TAPE IF STORING FROM CARD    * J0303330
                    *     OR PAPER TAPE                               * J0303340
                    *   * DISK WORKING STORAGE WHEN MOVING FROM       * J0303350
                    *     WORKING STORAGE TO FIXED AREA WORKING       * J0303360
                    *     STORAGE TO USER AREA ON A DIFFERENT DRIVE,  * J0303370
                    *     OR WORKING STORAGE TO USER AREA ON THE      * J0303380
                    *     SAME DRIVE WHERE DB ADJUSTMENT OF A DSF     * J0303390
                    *     PROGRAM IS REQUIRED.                        * J0303400
                    *   * DISK USER AREA TO GET USER AREA DB'S WHICH  * J0303410
                    *     EXTEND PAST THE END OF THE LAST COMPLETE    * J0303420
                    *     USER AREA SECTOR WHEN STORING A DSF PROGRAM * J0303430
                    *     TO THE USER AREA.                           * J0303440
                    *   * LET OF 'TO' DRIVE WHEN STORING TO THE       * J0303450
                    *     USER AREA.                                  * J0303460
                    *   * FLET OF 'TO' DRIVE WHEN STORING TO THE      * J0303470
                    *     FIXED AREA.                                 * J0303480
                    *                                                 * J0303490
                    *OUTPUT-                                          * J0303500
                    *   * WORKING STORAGE WHEN STORING FROM CARD OR   * J0303510
                    *     PAPER TAPE.                                 * J0303520
                    *   * USER AREA WHEN STORING TO A DRIVE WHICH IS  * J0303530
                    *     NOT THE WORKING STORAGE DRIVE, OR IF        * J0303540
                    *     STORING A DSF PROGRAM WHICH REQUIRES        * J0303550
                    *     DB ADJUSTMENT.                              * J0303560
                    *   * FIXED AREA IF STORING DATA OR STORING DATA  * J0303570
                    *     CORE IMAGE.                                 * J0303580
                    *   * LET OF 'TO' DRIVE WHEN STORING TO THE USER  * J0303590
                    *     AREA.                                       * J0303600
                    *   * FLET OF 'TO' DRIVE WHEN STORING TO THE      * J0303610
                    *     FIXED AREA.                                 * J0303620
                    *                                                 * J0303630
                    *EXTERNAL REFERENCES-                             * J0303640
                    *   SUBROUTINES-                                  * J0303650
                    *      * PHID-ID OF STORE TO 'PHASE' IN COMMA     * J0303660
                    *      * MASK-MASK KEYBOARD REQUEST               * J0303670
                    *      * LEAVE-LINK TO DUP EXIT MODULE            * J0303680
                    *      * PRINT-PRINT STORE SIGN-OFF MESSAGE       * J0303690
                    *      * GET-READ DISK                            * J0303700
                    *      * PUT-WRITE DISK                           * J0303710
                    *      * GETBI-READ BINARY CARD OR PAPER TAPE     * J0303720
                    *      * PACKB-PACK BINARY CARD OR PAPER TAPE     * J0303730
                    *      * REST-EXIT AFTER PRINTING SIGN-OFF        * J0303740
                    *   COMMA/DCOM-                                   * J0303750
                    *      * $CORE                                    * J0303760
                    *      * $IBSY                                    * J0303770
                    *      * $WSDR                                    * J0303780
                    *      * $FPAD                                    * J0303790
                    *      * #NAME                                    * J0303800
                    *      * #DBCT                                    * J0303810
                    *      * #JBSW                                    * J0303820
                    *      * #CBSW                                    * J0303830
                    *      * #ENTY                                    * J0303840
                    *      * #TODR                                    * J0303850
                    *      * #FRDR                                    * J0303860
                    *      * #FHOL                                    * J0303870
                    *      * #FSZE                                    * J0303880
                    *      * #UHOL                                    * J0303890
                    *      * #USZE                                    * J0303900
                    *      * #ANDU                                    * J0303910
                    *      * #BNDU                                    * J0303920
                    *      * #FPAD                                    * J0303930
                    *      * #CIDN                                    * J0303940
                    *      * #FMAT                                    * J0303950
                    *      * #WSCT                                    * J0303960
                    *                                                 * J0303970
                    *EXITS-                                           * J0303980
                    *   NORMAL-                                       * J0303990
                    *      * EXIT TO REST IN DUP COMMON MODULE AFTER  * J0304000
                    *        PRINTING SIGN-OFF MESSAGE.               * J0304010
                    *      * EXIT TO LEAVE IN DUP COMMON MODULE WHEN  * J0304020
                    *        STORING CORE IMAGE AND PROGRAM IS IN     * J0304030
                    *        WORKING STORAGE IN DSF FORMAT. EXIT TO   * J0304040
                    *        LEAVE IS WITH A CODE OF -3.              * J0304050
                    *   ERROR-                                        * J0304060
                    *      LEAVE-EXIT HERE WITH ERROR CODE FOR ERROR  * J0304070
                    *            MESSAGE.                             * J0304080
                    *                                                 * J0304090
                    *TABLES/WORK AREAS                                * J0304100
                    *      * CATCO SWITCHES AND VALUES SET BY DUP     * J0304110
                    *        CONTROL-                                 * J0304120
                    *           * TEMP1                               * J0304130
                    *           * TEMP2                               * J0304140
                    *           * CISW                                * J0304150
                    *           * DATSW                               * J0304160
                    *           * STCSW                               * J0304170
                    *           * MODSW                               * J0304180
                    *           * FXSW                                * J0304190
                    *           * IOSW                                * J0304200
                    *           * STSW                                * J0304210
                    *           * PTSW                                * J0304220
                    *           * UASW                                * J0304230
                    *           * WSSW                                * J0304240
                    *      * BUFFERS-                                 * J0304250
                    *           * THIS (CARD OR PAPER TAPE)           * J0304260
                    *           * NEXT (CARD OR PAPER TAPE)           * J0304270
                    *           * LETAR-ONE SECTOR DISK BUFFER IF 4K  * J0304280
                    *                   OTHERWISE SEVEN SECTOR BUFFER * J0304290
                    *           * LETAR-ONE SECTOR BUFFER FOR LET     * J0304300
                    *                   OR FLET                       * J0304310
                    *                                                 * J0304320
                    *ATTRIBUTES-                                      * J0304330
                    *      SERIALLY REUSEABLE                         * J0304340
                    *                                                 * J0304350
                    *NOTES-                                           * J0304360
                    *      * WHEN STORING FROM CARDS, DOUBLE BUFFER-  * J0304370
                    *        ING IS USED TO MAINTAIN CARD READER      * J0304380
                    *        RATED SPEED.                             * J0304390
                    *      * WHEN STORING CORE IMAGE, EXIT IS MADE TO * J0304400
                    *        LEAVE IN DUPCO WITH A CODE OF MINUS 3.   * J0304410
                    *        LEAVE WILL GET DUP'S EXIT MODULE WHICH   * J0304420
                    *        WILL SAVE UPCOR AND GET THE CLB. AFTER   * J0304430
                    *        THE CORE LOAD IS BUILT, THE CLB WILL     * J0304440
                    *        GET PHASE 17 OF DUP AND TRANSFER TO IT.  * J0304450
                    *        PHASE 17 WILL COMPLETE THE STORECI       * J0304460
                    *        EXCEPT FOR THE LET OR FLET UPDATION. IT  * J0304470
                    *        WILL THEN RELOAD DUP UPCOR, AND EXIT TO  * J0304480
                    *        REST IN DUPCO. AFTER REST HAS RELOADED   * J0304490
                    *        DUP CONTROL, DUP CONTROL WILL LOAD STORE * J0304500
                    *        AND RE-ENTER IT TO UPDATE LET OR FLET    * J0304510
                    *        AND COMPLETE THE STORECI.                * J0304520
                    *************************************************** J0304530
                          HDNG    STORE--MASTER CONTROL                 J0304540
                          ORG     WSDC      ORIGIN AT OVERLAY + 8K      J0304550
                          DC      *-*       SYS LDR FILLS IN WD CNT     J0304560
                          DC      3         PHASE ID OF STORE           J0304570
                    *************************************************** J0304580
                    *                                                 * J0304590
                    *   THE FOLLOWING SUBMODULE OF STORE CONTROLS     * J0304600
                    *   BRANCHING TO THE APPROPRIATE SUBMODULE FOR    * J0304610
                    *   A PARTICULAR TYPE OF STORE OPERATION.         * J0304620
                    *                                                 * J0304630
                    *************************************************** J0304640
                    ST000 BSI  I  PHID      INDICATE STORE IS IN CTRL   J0304650
                          DC      /0003     SLET PHASE ID OF STORE      J0304660
                          SLA     16                                    J0304670
                          STO  L  DS950     CLEAR 1DUMY PADDING DB CNT  J0304680
                          LD    1 DFLSW     TEST DFILE SWITCH       2-8 J0304690
                          BSC  L  ST007,Z   BRANCH IF DFILE         2-8 J0304700
                    *************************************************** J0304710
                    *                                                 * J0304720
                    *   DETERMINE IF INPUT FROM CARD/PAPT REQUIRED    * J0304730
                    *                                                 * J0304740
                    *************************************************** J0304750
                          LD    1 IOSW                                  J0304760
                          BSC  L  IOWS,Z    BRANCH IF CD/PAPT REQUIRED  J0304770
                    *************************************************** J0304780
                    *                                                 * J0304790
                    *   DETERMINE IF OPERATION IS STORECI             * J0304800
                    *                                                 * J0304810
                    *************************************************** J0304820
                    ST020 LD    1 CISW                                  J0304830
                          BSC  L  ST600,Z   BRANCH IF STORECI           J0304840
                    *************************************************** J0304850
                    *                                                 * J0304860
                    *   DETERMINE IF STORE TO USER AREA OR FIXED AREA * J0304870
                    *                                                 * J0304880
                    *************************************************** J0304890
                          LD    1 UASW                                  J0304900
                          OR    1 FXSW                                  J0304910
                          BSI  L  SNOFF,+-  BRANCH IF STORE TO WS       J0304920
                    *************************************************** J0304930
                    *                                                 * J0304940
                    *   DETERMINE IF FUNCTION IS STOREMOD             * J0304950
                    *                                                 * J0304960
                    *************************************************** J0304970
                          LD    1 MODSW                                 J0304980
                          BSC  L  ST700,Z   BRANCH IF STOREMOD          J0304990
                    *                                                 * J0305000
                          LDX  I2 #FRDR+C   SOURCE DR IS #FRDR          J0305010
                    *                                                 * J0305020
                    *************************************************** J0305030
                    *                                                 * J0305040
                    *   MOVE DB COUNT OF PROGRAM IN WS OF 'FROM' DR   * J0305050
                    *   TO # DBCT IN DCOM. HOWEVER, DO NOT SET #DBCT  * J0305060
                    *   IF FUNCTION IS STOREDATA.                     * J0305070
                    *                                                 * J0305080
                    *************************************************** J0305090
                    ST004 LD    1 DATSW                                 J0305100
                          BSC  L  ST007,Z   BRANCH IF STOREDATA         J0305110
                    *                                                 * J0305120
                    ST005 LD   L2 #WSCT+C                               J0305130
                          STO   1 #DBCT     DB COUNT OF PROG IN WS      J0305140
                    *************************************************** J0305150
                    *                                                 * J0305160
                    *   DETERMINE IF PROGRAM OR DATA WILL FIT IN      * J0305170
                    *   AVAILABLE USER AREA OR FIXED AREA HOLE.       * J0305180
                    *                                                 * J0305190
                    *************************************************** J0305200
                    ST007 LD    1 FXSW                                  J0305210
                          BSC  L  ST009,Z   BR IF STORE TO FIXED AREA   J0305220
                    *************************************************** J0305230
                    *                                                 * J0305240
                    *   COMPARE DB@S OF PROGRAM OR DATA TO USER       * J0305250
                    *   AREA HOLE SIZE.                               * J0305260
                    *                                                 * J0305270
                    *************************************************** J0305280
                          LD    1 #USZE                                 J0305290
                    ST008 S     1 #DBCT                                 J0305300
                          BSC  L  ST010,-   BR IF HOLE SIZE OK          J0305310
                          BSI  I  LEAVE     DUP ERROR MESSAGE           J0305320
                          DC      31        DISK AREA EXCEEDED          J0305330
                    *************************************************** J0305340
                    *                                                 * J0305350
                    *   COMPARE DB@S OF PROGRAM OR DATA TO FIXED      * J0305360
                    *   AREA HOLE SIZE.                               * J0305370
                    *                                                 * J0305380
                    *************************************************** J0305390
                    ST009 LD    1 #FSZE                                 J0305400
                          MDX     ST008                                 J0305410
                    ST010 BSI     WD000     MOVE WS TO DESTINATION      J0305420
                    ST015 BSI  L  DOLET     UPDATE LET OR FLET          J0305430
                          BSI  L  UPDCM     UPDATE DCOM                 J0305440
                          BSI  L  SNOFF     PRINT SIGN-OFF MESSAGE      J0305450
                          HDNG    STORE--WS TO USER AREA OR FIXED AREA  J0305460
                    *************************************************** J0305470
                    *                                                 * J0305480
                    *   INITIALIZATION TO MOVE PROGRAM FROM WORKING   * J0305490
                    *   STORAGE TO USER AREA OR FIXED AREA.           * J0305500
                    *                                                 * J0305510
                    *************************************************** J0305520
                    WD000 DC      *-*       ENTRY POINT                 J0305530
                          BSI  I  PHID      STEP PHASE ID OF STORE      J0305540
                          DC      /2003     STEP ID FOR WS TO UA/FXA    J0305550
                          LDX  L3 DS900     XR3 POINTS TO CONSTANTS     J0305560
                          SLA     16                                    J0305570
                          STO   3 DS940-W   RESET 1ST TIME SWITCH       J0305580
                          LD   L  $CORE                                 J0305590
                          SLA     4         IF CORE SIZE IS             J0305600
                          LD    3 DS902-W   *4K, DISK BUFFER IS 2 SCTRS J0305610
                          BSC  L  DS010,C   BRANCH IF CORE IS 4K        J0305620
                    *************************************************** J0305630
                    *                                                 * J0305640
                    *   CORE SIZE IS GT 4K. USE 7 SCTR BFR            * J0305650
                    *                                                 * J0305660
                    *************************************************** J0305670
                          LD    3 DS900-W                               J0305680
                    DS010 STO   3 DS904-W   WD CNT TO READ WS           J0305690
                          STO   3 DS910-W   WD CNT TO WRITE UA          J0305700
                          SRT     16                                    J0305710
                          D     3 DS916-W   WD CNT DIVIVIDED BY 20 IS   J0305720
                          STO   3 DS912-W   *DB CNT TO WRITE UA         J0305730
                          STO   3 DS913-W   DB CNT TO READ WS           J0305740
                    *                                                 * J0305750
                          LD    3 DS904-W                               J0305760
                          S     3 DS918-W   NUMBER OF SECTORS BY WHICH  J0305770
                          SRT     16        *WS SCTR ADDR IS INCR, IS   J0305780
                          SLA     16        *1 LESS THAN SCTRS READ.    J0305790
                          D     3 DS918-W                               J0305800
                          STO   3 DS936-W   WS SCTR ADDR INCREMENT      J0305810
                          SLA     4                                     J0305820
                          STO   3 DS923-W   WS DB COUNT DECREMENT       J0305830
                    *                                                 * J0305840
                          LD    3 DS910-W   NUMBER OF SECTORS BY WHICH  J0305850
                          SRT     16        *UA SCTR ADDR IS INCR, IS   J0305860
                          SLA     16        *SAME AS UA SCTRS WRITTEN.  J0305870
                          D     3 DS918-W                               J0305880
                          STO   3 DS938-W   UA SCTR ADDR INCREMENT      J0305890
                    *                                                 * J0305900
                          LD    1 #DBCT                                 J0305910
                          STO   3 DS914-W   SAVE DB CNT OF PROGRAM      J0305920
                          A     3 DS922-W                               J0305930
                          SRA     4                                     J0305940
                          SLA     4         NUMBER OF SECTORS OF        J0305950
                          STO   3 DS915-W   *WORKING STORAGE TO READ    J0305960
                          LD    1 LETAR                                 J0305970
                          AND   3 DS901-W                               J0305980
                          STO   3 DS903-W   DISK BUFFER CORE ADDRESS    J0305990
                    *************************************************** J0306000
                    *                                                 * J0306010
                    *   DETERMINE NO. OF DB'S OF USER AREA IN EXCESS  * J0306020
                    *   OF LAST COMPLETE UA SECTOR                    * J0306030
                    *                                                 * J0306040
                    *************************************************** J0306050
                          LD    1 #UHOL                                 J0306060
                          AND   3 DS922-W   MASK SCTR OUT OF DB ADDR    J0306070
                          STO   3 DS924-W   USER AREA DB'S              J0306080
                          M     3 DS916-W                               J0306090
                          SLT     16                                    J0306100
                          STO   3 DS926-W   USER AREA WORDS             J0306110
                    *************************************************** J0306120
                    *                                                 * J0306130
                    *   DISPLACEMENT ADDR IN DISK BUFFER FOR READING  * J0306140
                    *   WORKING STORAGE IS ADDR OF DISK BUFFER PLUS   * J0306150
                    *   USER AREA WORDS.                              * J0306160
                    *                                                 * J0306170
                    *************************************************** J0306180
                          A     3 DS903-W                               J0306190
                          STO   3 DS930-W   ADJUSTED DK BFR ADDR        J0306200
                    *                                                 * J0306210
                          LD   L2 $FPAD                                 J0306220
                          STO   3 DS932-W   INITIAL WS SCTR ADDR        J0306230
                          LD    1 #UHOL                                 J0306240
                          MDX  L  DATSW+C,0 SKIP IF DATSW NOT ON        J0306250
                          MDX     DS015     GO CHECK FIXED AREA SW      J0306260
                    *************************************************** J0306270
                    *                                                 * J0306280
                    *   SAVE DESTINATION DB ADDRESS                   * J0306290
                    *                                                 * J0306300
                    *************************************************** J0306310
                    DS012 STO   1 DBADR     DESTINATION DB ADDR         J0306320
                          SRA     4         SCTR ADDR OF DESTINATION    J0306330
                          SRT     12                                    J0306340
                    *                                                 * J0306350
                          LD    1 #TODR                                 J0306360
                          SLT     12        ADD DRIVE CODE OF 'TO' DR   J0306370
                          STO   3 DS934-W   INT DESTINATION SCTR ADDR   J0306380
                          MDX     DS021                                 J0306390
                    *                                                 * J0306400
                    DS015 MDX  L  FXSW+C,0  SKIP IF STORING TO UA       J0306410
                          MDX     DS018                                 J0306420
                    *                                                 * J0306430
                    DS016 A     3 DS922-W   ROUND UP UA DB ADDR TO      J0306440
                          SRA     4         *DB ADDR OF EVEN            J0306450
                          SLA     4         *SECTOR BOUNDARY.           J0306460
                          MDX     DS012                                 J0306470
                    *                                                 * J0306480
                    DS018 LD    1 #FHOL     USE FXA HOLE ADDR AS        J0306490
                          MDX     DS012     *DESTINATION DB ADDR.       J0306500
                    *                                                 * J0306510
                    DS021 LD    1 DATSW                                 J0306520
                          BSC  L  DS020,+-  BRANCH IF NOT STOREDATA     J0306530
                    *                                                 * J0306540
                          LD    3 DS949-W                               J0306550
                          S     3 DS924-W                               J0306560
                          STO   3 DS950-W   NO. OF DB'S PADDING REQ     J0306570
                          SLA     16                                    J0306580
                          STO   3 DS926-W   CLEAR DB ADJ TO ZERO        J0306590
                          LD    3 DS903-W                               J0306600
                          STO   3 DS930-W   DISK BUFFER CORE ADDRESS    J0306610
                          LD    1 DFLSW     TEST DFILE SWITCH       2-8 J0306620
                          BSC  I  WD000,Z   EXIT IF DFILE           2-8 J0306630
                          HDNG    STORE--GET WORKING STORAGE            J0306640
                    *************************************************** J0306650
                    *                                                 * J0306660
                    *   READ PROGRAM FROM WORKING STORAGE             * J0306670
                    *                                                 * J0306680
                    *************************************************** J0306690
                    DS020 LDX  I3 DS930     XR3 IS I/O HDR ADDR FOR GET J0306700
                          LD      DS932                                 J0306710
                          STO   3 +1        WS SECTOR ADDRESS           J0306720
                    *                                                 * J0306730
                          LD      DS915                                 J0306740
                          S       DS913                                 J0306750
                          BSC  L  DS02X,-Z  BR IF MAX WS READ REQ       J0306760
                    *                                                 * J0306770
                          LD      DS915                                 J0306780
                          M       DS916     CONVERT DB'S REMAINING      J0306790
                          SLT     16        *TO WORD COUNT FOR THIS     J0306800
                          MDX     DS02X+1   *WS READ.                   J0306810
                    DS02X LD      DS904                                 J0306820
                          STO   3 0         WD CNT TO READ WS           J0306830
                    *                                                 * J0306840
                          BSI  I  GET       READ WORKING STORAGE        J0306850
                    *                                                 * J0306860
                          LD    3 +1        INCR WS SCTR ADDR           J0306870
                          A       DS936                                 J0306880
                          STO     DS932     NEW WS SCTR ADDR            J0306890
                          LD      DS915                                 J0306900
                          S       DS923                                 J0306910
                          STO     DS915     WS DB'S STILL TO BE READ    J0306920
                          LD    1 DATSW                                 J0306930
                          BSC  L  DS025,Z   BRANCH IF STOREDATA         J0306940
                    *************************************************** J0306950
                    *                                                 * J0306960
                    *   DETERMINE IF THIS IS FIRST TIME WS HAS BEEN   * J0306970
                    *   READ.                                         * J0306980
                    *                                                 * J0306990
                    *************************************************** J0307000
                          MDX  L  DS940,0   SKIP IF FIRST TIME          J0307010
                          MDX     DS080     BRANCH IF NOT FIRST TIME    J0307020
                    *                                                 * J0307030
                          LDX  I2 DS903                                 J0307040
                          MDX   2 -56       XR2 IS PT FOR MOV54 SUBR    J0307050
                          LD    3 +4                                    J0307060
                          AND     DS901     REMOVE OLD SUBTYPE      2-4 J0307070
                          OR    1 T3MSW                                 J0307080
                          STO   3 +4        INCLUDE SOCAL TYPE          J0307090
                          SRA     8         SHIFT OUT PRECISION         J0307100
                          AND     DS922     MASK OUT BITS 8-11          J0307110
                          STO  L  DO911     SAVE PROG HDR TYPE WD       J0307120
                          S       DS944                                 J0307130
                          BSC  L  DS022,-Z  BR IF PROG TYPE GT 4        J0307140
                    *************************************************** J0307150
                    *                                                 * J0307160
                    *   PROGRAM HEADER LENGTH EQUALS THE CONTENTS OF  * J0307170
                    *   PROGRAM HEADER WORD SIX PLUS 9.               * J0307180
                    *                                                 * J0307190
                    *************************************************** J0307200
                          LD    3 +7                                    J0307210
                          A       DS946                                 J0307220
                          STO   1 PGMHL     LENGTH OF PROGRAM HEADER    J0307230
                    DS022 LDD   1 #NAME                                 J0307240
                          STO   3 +11       PRIME ENTRY POINT NAME      J0307250
                          RTE     16        *TO PROGRAM HEADER          J0307260
                          STO   3 +12       *WORDS 10-11.               J0307270
                    DS023 LD    1 #DBCT     GET DB COUNT OF PROGRAM 2-1 J0307280
                          STO   3 +9        AND STORE IN WD 8 OF HDR2-1 J0307290
                          LD    1 #ENTY     PRIME ENTRY POINT TO    2-1 J0307300
                          STO   3 +13       *WD 12 OF HEADER        2-1 J0307310
                    *                                               2-1 J0307320
                    DS024 MDX   3 +1        SAVE PROGRAM HEADER AT      J0307330
                          BSI  L  MOV54     *DISK BUFFER - 56.          J0307340
                    DS025 MDX  L  DS940,-1  SKIP IF FIRST TIME          J0307350
                          MDX     DS080     BRANCH IF NOT FIRST TIME    J0307360
                          LD      DS932                                 J0307370
                          S       DS934     COMPARE DESTINATION SCTR    J0307380
                          S       DS936     *ADDR WITH WS SCTR ADDR     J0307390
                          BSC  L  DS027,Z   BR IF SCTR ADDR'S NOT SAME  J0307400
                    *                                                 * J0307410
                          LD      DS949     SCTR ADDR'S AGREE, WRITE    J0307420
                          STO     DS914     *ONE SECTOR BEFORE EXITING  J0307430
                          MDX     DS070                                 J0307440
                    *************************************************** J0307450
                    *                                                 * J0307460
                    *   DETERMINE IF PROG IN WORKING STORAGE REQUIRES * J0307470
                    *   DB ADJUSTMENT TO BE STORED IN USER AREA.      * J0307480
                    *                                                 * J0307490
                    *************************************************** J0307500
                    DS027 LD      DS926                                 J0307510
                          BSC  L  DS060,Z   BR IF DB ADJUSTMENT REQ     J0307520
                          MDX     DS070     NO GET OF UA REQUIRED       J0307530
                          HDNG    STORE--WS TO UA/FXA CONSTANTS         J0307540
                    DS900 DC      /8C0      WD CNT FOR 7 SECTORS        J0307550
                    DS901 DC      /0FFF     DK BFR CORE ADDRESS MASK    J0307560
                    DS902 DC      /280      WD CNT FOR 2 SECTORS        J0307570
                    DS903 DC      *-*       NON-ADJ DK BFR CORE ADDR    J0307580
                    DS904 DC      *-*       WD CNT FOR READING WS       J0307590
                    DS910 DC      *-*       WD CNT FOR WRITING UA/FXA   J0307600
                    DS912 DC      *-*       DB CNT FOR WRITING UA/FXA   J0307610
                    DS913 DC      *-*       DB CNT TO READ WS           J0307620
                    DS914 DC      *-*       DB CNT OF PROG IN WS        J0307630
                    DS915 DC      *-*       NO. OF WS DB'S TO BE READ   J0307640
                    DS916 DC      20        WORDS PER DB                J0307650
                    DS918 DC      /140      WORDS PER SECTOR            J0307660
                    DS922 DC      /F        MASK SCTR ADDR FROM DB ADDR J0307670
                    DS923 DC      *-*       WS DB COUNT DECREMENT       J0307680
                    DS924 DC      *-*       USER AREA DB'S              J0307690
                    DS926 DC      *-*       USER AREA WORDS             J0307700
                    DS930 DC      *-*       ADJUSTED DISK BUFFER ADDR   J0307710
                    DS932 DC      *-*       INITIAL WS SECTOR ADDR      J0307720
                    DS934 DC      *-*       INITIAL UA/FXA SCTR ADDR    J0307730
                    DS936 DC      *-*       NO. OF WS SECTORS TO READ   J0307740
                    DS938 DC      *-*       NO) OF UA/FXA SCTRS TO WR   J0307750
                    DS940 DC      0         LOOP CTRL SW--ZERO 1ST TIME J0307760
                    DS942 DC      1         CONSTANT OF ONE             J0307770
                    DS944 DC      4         CONSTANT                    J0307780
                    DS946 DC      9         CONSTANT                    J0307790
                    DS949 DC      16        CONSTANT                    J0307800
                    DS950 DC      *-*       NO. OF DB'S PADDING REQ     J0307810
                    W     EQU     DS900     XR3 CONSTANT POINTER        J0307820
                          HDNG    STORE--GET WORKING STORAGE            J0307830
                    DS060 LDX  I3 DS903     XR3 IS ADDR TO GET UA DB'S  J0307840
                          LD      DS934                                 J0307850
                          RTE     16        SET-UP IOAR HDR TO READ     J0307860
                          LD      DS926     *UA WDS REQ FOR ADJUSTMENT  J0307870
                          STD   3 0         UA ADJUSTMENT IOAR HDR      J0307880
                    *                                                 * J0307890
                          BSI  I  GET       READ UA DB'S                J0307900
                    *                                                 * J0307910
                    DS070 LDX  I3 DS903     XR3 IS IOAR HDR FOR PUT     J0307920
                          BSI     DS090                                 J0307930
                    *************************************************** J0307940
                    *                                                 * J0307950
                    *   CHANGE WD CNT'S AND SCTR INCREMENTS FOR VALUES* J0307960
                    *   NECESSARY FOR SUBSEQUENT TIMES THROUGH LOOP OF* J0307970
                    *   READING WORKING STORAGE, AND WRITING TO THE   * J0307980
                    *   USER AREA.                                    * J0307990
                    *                                                 * J0308000
                    *************************************************** J0308010
                          LD      DS910     SUBSEQUENT TIMES THRU LOOP, J0308020
                          S       DS918     *WRITE ONE LESS SECTOR.     J0308030
                          STO     DS910     NEW WRITE TO UA WD CNT      J0308040
                          SRT     16                                    J0308050
                          D       DS916                                 J0308060
                          STO     DS912     WRITE 16 LESS DB'S TO UA    J0308070
                    *                                                 * J0308080
                          LD      DS938     FOLLOWING TIMES THRU LOOP,  J0308090
                          S       DS942     *ADD 1 LESS TO UA SCTR ADDR J0308100
                          STO     DS938     NEW UA SCTR ADDR INCREMENT  J0308110
                          SLA     16                                    J0308120
                          STO     DS924     CLEAR UA DB COUNT           J0308130
                          MDX     DS120     CHECK IF PROG ALL MOVED     J0308140
                    *************************************************** J0308150
                    *                                                 * J0308160
                    *   BRANCH TO HERE AFTER READING OTHER THAN FIRST * J0308170
                    *   BLOCK OF PROGRAM FROM WORKING STORAGE.        * J0308180
                    *                                                 * J0308190
                    *************************************************** J0308200
                    DS080 LDX  I3 DS903     BFR ADDR FOR PUT            J0308210
                          MDX  L3 +320      PUT FROM NXT SCTR IN BFR    J0308220
                          BSI     DS090                                 J0308230
                    *************************************************** J0308240
                    *                                                 * J0308250
                    *   DETERMINE IF MOVE FROM WORKING STORAGE TO     * J0308260
                    *   USER AREA IS COMPLETE.                        * J0308270
                    *                                                 * J0308280
                    *************************************************** J0308290
                    DS120 LD      DS914                                 J0308300
                          BSC  I  WD000,+-  BR (EXIT) IF MOVE COMPLETE  J0308310
                          BSC  L  DS020                             2-2 J0308320
                    *                                                 * J0308330
                          HDNG    STORE--PUT TO UA/FXA                  J0308340
                    DS090 DC      *-*                                   J0308350
                          LD      DS934                                 J0308360
                          STO   3 +1        UA SECTOR ADDRESS           J0308370
                          LD      DS914     CHECK IF DB'S REMAINING     J0308380
                          A       DS924     *GT DISK BUFFER SIZE.       J0308390
                          S       DS912                                 J0308400
                          BSC  L  DS100,-Z  BR IF FULL WRITE REQUIRED   J0308410
                    *************************************************** J0308420
                    *                                                 * J0308430
                    *   THIS IS THE LAST BLOCK TO WRITE TO THE UA     * J0308440
                    *                                                 * J0308450
                    *************************************************** J0308460
                          LD      DS914                                 J0308470
                          MDX  L  DATSW+C,0 SKIP IF NOT STOREDATA   2-2 J0308480
                          MDX     *+1       DO NOT ADD UA DB'S      2-2 J0308490
                          A       DS924     INCLUDE UA DB'S, IF ANY     J0308500
                          M       DS916                                 J0308510
                          SLT     16                                    J0308520
                          STO   3 0         WD CNT FOR LAST UA WRITE    J0308530
                          SLA     16                                    J0308540
                          STO     DS914     CLEAR UA PROG DB CNT        J0308550
                          MDX     DS110                                 J0308560
                    *************************************************** J0308570
                    *                                                 * J0308580
                    *   THIS BLOCK IS NOT THE LAST BLOCK TO BE        * J0308590
                    *   WRITTEN TO THE USER AREA                        J0308600
                    *                                                 * J0308610
                    *************************************************** J0308620
                    DS100 STO     DS914     DB'S OF PROG TO BE WRITTEN  J0308630
                          LD      DS910                                 J0308640
                          STO   3 0         WD CNT TO WRITE TO UA       J0308650
                    *                                                 * J0308660
                    DS110 BSI  I  PUT       WRITE TO USER AREA          J0308670
                    *                                                 * J0308680
                          LD    3 +1        INCR UA SECTOR ADDRESS      J0308690
                          A       DS938                                 J0308700
                          STO     DS934     NEW UA SECTOR ADDRESS       J0308710
                          BSC  I  DS090     EXIT WRITE TO UA/FXA SUBR   J0308720
                          HDNG    STORE--CORE IMAGE CONTROL             J0308730
                    *************************************************** J0308740
                    *                                                 * J0308750
                    *   THIS SECTION OF STORE RETURNS TO DUP'S EXIT   * J0308760
                    *   MODULE IF THE PROGRAM IN WORKING STORAGE HAS  * J0308770
                    *   NOT YET BEEN CONVERTED TO CORE IMAGE. DUP EXIT* J0308780
                    *   THEN CALLS THE CORE LOAD BUILDER. AFTER THE   * J0308790
                    *   CORE LOAD HAS BEEN BUILT, THE CLB CALLS DUP'S * J0308800
                    *   PRECI MODULE TO MOVE THE CORE IMAGE PROGRAM   * J0308810
                    *   TO THE USER AREA, OR THE FIXED AREA. PRECI    * J0308820
                    *   EXITS TO REST IN DUPCO, CAUSING DUP CONTROL   * J0308830
                    *   TO RELOAD STORE. DUP CONTROL THEN PASSES      * J0308840
                    *   CONTROL TO STORE SO THST LET/FLET AND DCOM    * J0308850
                    *   UPDATION MAY BE ACCOMPLISHED.                 * J0308860
                    *                                                 * J0308870
                    *************************************************** J0308880
                    ST600 LD    1 #CBSW                                 J0308890
                          BSC  L  ST610,Z   BR IF RETURNING FROM CLB    J0308900
                    *                                                 * J0308910
                          STX  L0 #CBSW+C   SET CLB SWITCH NON-ZERO     J0308920
                    *************************************************** J0308930
                    *                                                 * J0308940
                    *   PASS EXIT CODE TO INDICATE CLB IS REQUIRED    * J0308950
                    *                                                 * J0308960
                    *************************************************** J0308970
                          BSI  I  LEAVE                                 J0308980
                          DC      -3        CODE INDICATES CLB REQUIRED J0308990
                    *************************************************** J0309000
                    *                                                 * J0309010
                    *   CORE LOAD BUILDER HAS PROCESSED PROGRAM.      * J0309020
                    *   LET/FLET AND DCOM UPDATION MAY BE PERFORMED   * J0309030
                    *   IF ERRORS WERE NOT DETECTED BY THE CLB OR     * J0309040
                    *   BY DUP'S PRECI MODULE.                        * J0309050
                    *                                                 * J0309060
                    *************************************************** J0309070
                    ST610 SLA     16                                    J0309080
                          STO   1 #CBSW     CLEAR CLB SWITCH            J0309090
                    ST620 LD    1 TEMP1                                 J0309100
                          STO     DS950     NO. OF DB'S PADDING REQ     J0309110
                          BSI     DOLET     UPDATE LET/FLET             J0309120
                          BSI  L  UPDCM     UPDATE DCOM                 J0309130
                          BSI  L  SNOFF     PRINT SIGN-OFF MESSAGE      J0309140
                          HDNG    STORE--UPDATE LET/FLET                J0309150
                    *************************************************** J0309160
                    *                                                 * J0309170
                    *   THE FOLLOWING SUBMODULE OF STORE MAKES THE    * J0309180
                    *   REQUIRED LET/FLET ENTRY FOR THE PROGRAM OR    * J0309190
                    *   DATA BEING STORED, AND UPDATES THE LET/FLET   * J0309200
                    *   SECTOR HEADER.                                * J0309210
                    *                                                 * J0309220
                    *************************************************** J0309230
                    DOLET DC      *-*       ENTRY POINT                 J0309240
                          BSI  I  PHID      STEP PHASE ID OF STORE      J0309250
                          DC      /3003     DOLET SUBMODULE ID          J0309260
                          BSI  I  MASK      MASK OUT KB REQUEST         J0309270
                          LDX  I2 SDBUF+C   XR2 IS STORE DK BFR ADDR    J0309280
                    *                    ** ONE WORD SAVED HERE **  2-4 J0309290
                          MDX  L2 322-44    ADJUST TO POINT TO 1ST OF   J0309300
                          STX  L2 DO918     *PROG'S SECONDARY ENTRY PTS J0309310
                          LD    1 CISW                                  J0309320
                          OR    1 STCSW                                 J0309330
                          BSC  L  DO005,+-  BR IF ENTRY NOT CORE IMAGE  J0309340
                    *                                                 * J0309350
                          LD   L  DO934                                 J0309360
                          MDX     DO008                                 J0309370
                    *                                                 * J0309380
                    DO005 LD    1 DATSW                                 J0309390
                          BSC     Z         SKIP IF ENTRY NOT DATA      J0309400
                          LD      DO935                                 J0309410
                    DO008 OR    1 #NAME     PUT BITS INDICATING TYPE    J0309420
                          STO   1 #NAME     *OF ENTRY INTO NAME.        J0309430
                          LD      DO902                                 J0309440
                          STO     DO904     SET LET/FLET WDS REQUIRED   J0309450
                    *************************************************** J0309460
                    *                                                 * J0309470
                    *   COMPUTE WORDS REQUIRED FOR LET/FLET ENTRY     * J0309480
                    *                                                 * J0309490
                    *************************************************** J0309500
                          LD    1 CISW                                  J0309510
                          OR    1 DATSW                                 J0309520
                          BSC  L  DO015,Z   BR IF STORECI OR STOREDATA  J0309530
                          LD      DO911                                 J0309540
                          S       DO903                                 J0309550
                          BSC  L  DO015,-Z  BR IF PROG TYPE GT 4        J0309560
                          LD    1 PGMHL     WORDS REQUIRED FOR ENTRY    J0309570
                          S       DO900     *IS 3 TIMES ENT POINT NAMES J0309580
                          STO     DO904     LET/FLET ENT WORDS REQUIRED J0309590
                    *************************************************** J0309600
                    *                                                 * J0309610
                    *   GET SECTOR OF LET/FLET TO WHICH ENTRY IS      * J0309620
                    *   TO BE MADE.                                   * J0309630
                    *                                                 * J0309640
                    *************************************************** J0309650
                    DO015 LDX  I2 DELSW+C   XR2 IS LETAR ENTRY POINTER  J0309660
                          LDX  I3 LETAR+C   XR3 POINTS TO LET SCTR HDR  J0309670
                          LD    1 STSW                                  J0309680
                          RTE     16                                    J0309690
                          LD      DO920     SET-UP IOAR HDR TO READ     J0309700
                          STD   3 0         *LET/FLET SCTR.             J0309710
                          BSI  I  GET       READ LET/FLET SECTOR        J0309720
                          LD    1 FXSW                                  J0309730
                          BSC  L  ST800,Z   BRANCH IF UPDATING FLET     J0309740
                    *************************************************** J0309750
                    *                                                 * J0309760
                    *   DETERMINE IF WORDS AVAILABLE IN THIS LET/FLET * J0309770
                    *   SECTOR SUFFICIENT FOR MAKING ENTRY            * J0309780
                    *                                                 * J0309790
                    *************************************************** J0309800
                          LD    2 +3                                    J0309810
                          STO     DO923     DB SIZE OF WS               J0309820
                    *************************************************** J0309830
                    *                                                 * J0309840
                    *   DETERMINE IF DSF PROGRAM                      * J0309850
                    *                                                 * J0309860
                    *************************************************** J0309870
                          LD    1 DATSW                                 J0309880
                          OR    1 CISW                                  J0309890
                          BSC  L  DO100,Z   BRANCH IF NOT DSF PROGRAM   J0309900
                    *                                                 * J0309910
                    DO020 LD    3 +5                                    J0309920
                          A       DO902     INCR WDS AVAILABLE BY 3     J0309930
                          S       DO904                                 J0309940
                          BSC  L  DO024,-   BR IF WDS AVAIL FOR ENT     J0309950
                    *                                                 * J0309960
                          LD    3 +5                                    J0309970
                          A       DO902     LET SCTR COMPLETE. INCR     J0309980
                          STO   3 +5        *WORDS AVAILABLE BY THREE   J0309990
                    *                                                 * J0310000
                          LD    1 DATSW                                 J0310010
                          OR    1 CISW                                  J0310020
                          BSC  L  DO022,Z   BR IF STORING DATA OR CI    J0310030
                    *                                                 * J0310040
                          SLA     16                                    J0310050
                          STO   2 +1        CLEAR TERMINAL .1DUMY. ENT  J0310060
                          STO   2 +2        *TO ZEROS IN COMPLETED LET  J0310070
                          STO   2 +3        *SECTOR                     J0310080
                    DO022 BSI     DO040                                 J0310090
                    *************************************************** J0310100
                    *                                                 * J0310110
                    *   UPDATE LET SECTOR FOR DSF PROGRAM             * J0310120
                    *                                                 * J0310130
                    *************************************************** J0310140
                    DO024 LDD   1 #NAME                                 J0310150
                          STO   2 +1        PRIME ENTRY POINT NAME OF   J0310160
                          RTE     16        *PROG TO WORDS 1 AND 2      J0310170
                          STO   2 +2        *OF LET ENTRY.              J0310180
                    *                                                 * J0310190
                          LD    1 #DBCT                                 J0310200
                          STO   2 +3        PROG DB CNT IS WORD 3       J0310210
                    *************************************************** J0310220
                    *                                                 * J0310230
                    *   MOVE ANY SECONDARY ENTRY POINTS INTO LET      * J0310240
                    *                                                 * J0310250
                    *************************************************** J0310260
                    DO025 LD    3 +5                                    J0310270
                          S       DO902     FOR EACH ENTRY MADE TO LET, J0310280
                          STO   3 +5        *DECR WORDS AVAIL BY THREE  J0310290
                    *                                                 * J0310300
                          MDX  L  DO904,-3  SKIP IF NO MORE ENT POINTS  J0310310
                          MDX     DO055                                 J0310320
                          HDNG    STORE--UPDATE LET SECTOR HEADER       J0310330
                    *************************************************** J0310340
                    *                                                 * J0310350
                    *   MODIFY NUMBER OF WORDS AVAILABLE              * J0310360
                    *                                                 * J0310370
                    *************************************************** J0310380
                          LDX  L1 C         XR1 IS CATCO POINTER        J0310390
                          LD    3 +5                                    J0310400
                          BSC  L  DO030,-   BR IF WDS AVAIL NOT MINUS   J0310410
                    *************************************************** J0310420
                    *                                                 * J0310430
                    *   LET SECTOR IS FULL. SET WDS AVAILABLE TO ZERO,* J0310440
                    *   WRITE THIS SECTOR, PREPARE TO PUT .1DUMY.     * J0310450
                    *   ENTRY ON THE NEXT LET SECTOR.                 * J0310460
                    *                                                 * J0310470
                    *************************************************** J0310480
                          SLA     16                                    J0310490
                          STO   3 +5        SET WORDS AVAIL TO ZERO     J0310500
                          BSI     DO040                                 J0310510
                          MDX   2 -3        ADJ XR2 TO MAKE .1DUMY. ENT J0310520
                    *************************************************** J0310530
                    *                                                 * J0310540
                    *   MAKE 1DUMY ENTRY TO TERMINATE LET SECTOR      * J0310550
                    *                                                 * J0310560
                    *************************************************** J0310570
                    DO030 LDD     DO908                                 J0310580
                          STO   2 +4        INSER .1DUMY. IN SYSTEM     J0310590
                          RTE     16        *INTO 2 WORDS FOLLOWING     J0310600
                          STO   2 +5        *LAST LET ENTRY POINT       J0310610
                    *                                                 * J0310620
                          LD   L  DS950                                 J0310630
                          EOR     DO907                                 J0310640
                          BSC  L  DO031,+-  BR IF NO PADDING REQUIRED   J0310650
                    *                                                 * J0310660
                          LD   L  DS950     COMPUTE NEW END OF USER     J0310670
                    DO031 A     1 #UHOL     *AREA DB ADDR               J0310680
                          STO   1 #UHOL                             2-1 J0310690
                          A     1 #DBCT                                 J0310700
                          STO     DO922     SAVE END OF UA DB ADDR      J0310710
                          A       DO901     COMPUTE NEW DB ADDRESS      J0310720
                          SRT     16        *FOR WORKING STORAGE ON     J0310730
                          LD    1 #TODR     *'TO' DRIVE. INCLUDE        J0310740
                          SLT     12        *ITS DRIVE CODE.            J0310750
                          LDX  I1 #TODR+C   *'TO' DRIVE                 J0310760
                          STO  L1 $FPAD     UPDATE FILE PROTECT TBL     J0310770
                          LDX  L1 C         XR1 IS CATCO POINTER        J0310780
                          LD      DO923     DB SIZE OF WS IS            J0310790
                          S     1 #DBCT     *MAX DB ADDR LESS THE SUM   J0310800
                          STO   2 +6        *OF LAST WS AND PROG DB'S   J0310810
                    *************************************************** J0310820
                    *                                                   J0310830
                    *   OUTPUT LET SECTOR                               J0310840
                    *                                                   J0310850
                    *************************************************** J0310860
                          BSI     DO060     WRITE LET SECTOR            J0310870
                          BSC  I  DOLET     BR (EXIT) LET/FLET UPDATE   J0310880
                          HDNG    STORE--UPDATE LET/FLET CONSTANTS      J0310890
                    DO900 DC      9         CONSTANT                    J0310900
                    DO901 DC      /F        MASK OUT BITS 0-11          J0310910
                    DO902 DC      3         CONSTANT OF 3               J0310920
                    DO903 DC      4         CHECK FOR PROG TYPE GT 4    J0310930
                    DO904 DC      *-*       WDS REQUIRED FOR LET/FLET   J0310940
                    DO907 DC      16        CONSTANT                    J0310950
                          BSS  E  0                                     J0310960
                    DO908 DC      /7112     1DUMY NAME CODE, WORD 1     J0310970
                          DC      /4528     1DUMY NAME CODE, WORD 2     J0310980
                    DO909 DC      *-*       ENT POINT TEMP (WORD 1)     J0310990
                          DC      *-*       ENT POINT TEMP (WORD 2)     J0311000
                    DO911 DC      *-*       SAVE PROG TYPE FROM HDR     J0311010
                    DO912 DC      6         LIMIT CHECK FOR LET OVFLO   J0311020
                    DO913 DC      /16       CONSTANT                    J0311030
                    DO914 DC      1         CONSTANT OF 1               J0311040
                    DO915 DC      *-*       LET/FLET TYPE INDICATORS    J0311050
                    DO916 DC      312       MAX WDS AVAIL IN LET SCTR   J0311060
                    DO917 DC      *-*       SAVE DB FROM .1DUMY. ENT    J0311070
                    DO918 DC      *-*       PROG HDR PT, ENT POINTS     J0311080
                    DO920 DC      320       WORDS PER SECTOR            J0311090
                    DO921 DC      /6400     MAX WS DB ADDR              J0311100
                    DO922 DC      *-*       END OF USER AREA, DB ADDR   J0311110
                    DO923 DC      *-*       SAVE LAST WS SIZE           J0311120
                    DO934 DC      /8000     CORE IMAGE TYPE IND BITS    J0311130
                    DO935 DC      /C000     DATA TYPE INDICATOR BITS    J0311140
                    DO938 DC      *-*       ENT POINT DB CNT TEMP       J0311150
                    DO940 DC      *-*       SAVE TYPE OF ENTRY      2-1 J0311160
                          HDNG    STORE--GENERATE NEW LET/FLET SECTOR   J0311170
                    *************************************************** J0311180
                    *                                                 * J0311190
                    *   CURRENT LET/FLET SECTOR IS FULL. WRITE THIS   * J0311200
                    *   SECTOR AND START ENTRIES ON NEXT SECTOR       * J0311210
                    *                                                 * J0311220
                    *************************************************** J0311230
                    DO040 DC      *-*       FULL LET SCTR SUBR          J0311240
                    *************************************************** J0311250
                    *                                                 * J0311260
                    *   CHECK FOR LET/FLET OVERFLOW                   * J0311270
                    *                                                 * J0311280
                    *************************************************** J0311290
                          MDX  L  UASW+C,0  SKIP IF UPDATING FLET       J0311300
                          MDX     DO046                                 J0311310
                    *                                                 * J0311320
                          LD      DO913     MAX FLET SECTOR NO. IS /17  J0311330
                          MDX     DO042                                 J0311340
                    *                                                 * J0311350
                    DO041 LD      DO912     MAX OF 8 SCTRS (0-7)        J0311360
                    DO042 S     3 +2                                    J0311370
                          BSC  L  DO050,-   BR IF NO LET/FLET OVERFLOW  J0311380
                    *                                                 * J0311390
                          BSI  I  LEAVE     DUP ERROR MESSAGE           J0311400
                          DC      33        LET/FLET OVERFLOW MESSAGE   J0311410
                    *                                                 * J0311420
                    DO046 LD    1 #TODR                                 J0311430
                          BSC  L  DO041,+-  BR IF STORING TO DRIVE 0    J0311440
                    *                                                 * J0311450
                    DO048 LD    1 #SYSC     SYSTEM CARTRIDGE?       212 J0311460
                          BSC     Z         NO, ALLOW 6 SECTORS     212 J0311462
                          MDX     DO041     YES, ALLOW 8 SECTORS    212 J0311464
                          LD      DO903                             212 J0311466
                          MDX     DO042     *ON LOGICAL DR'S 1-4 (2-7). J0311470
                    *                                                 * J0311480
                    DO050 LD    3 +6                                    J0311490
                          STO     DO917     SAVE CHAIN SCTR ADDR        J0311500
                          LD    3 +1                                    J0311510
                          SLA     4         GET RID OF DRIVE CODE   2-2 J0311520
                          SRA     4                                 2-2 J0311530
                          A       DO914     UPDATE WORD 5 OF LET HDR    J0311540
                          STO   3 +6        SCTR ADDR OF NEXT LET SCTR  J0311550
                          BSI     DO060     WRITE FULL LET SECTOR       J0311560
                    *                                                 * J0311570
                          LD    3 +2                                    J0311580
                          A       DO914                                 J0311590
                          STO   3 +2        SCTR NO. OF THIS LET SCTR   J0311600
                    *                                                 * J0311610
                          LD      DO916                                 J0311620
                          STO   3 +5        315 DECML WDS AVAILABLE     J0311630
                    *                                                 * J0311640
                          LD      DO917                                 J0311650
                          STO   3 +6        INDICATE LAST LET SCTR      J0311660
                    *                                                 * J0311670
                          LDX  I2 LETAR+C   XR2 AFTER ADJUSTMENT POINTS J0311680
                          MDX   2 +6        *ADDR FOR 1ST PROG ENT      J0311690
                          BSC  I  DO040     EXIT FULL LET SCTR SUBR     J0311700
                          HDNG    STORE--MULTI ENTRY SUBPROGRAM         J0311710
                    *************************************************** J0311720
                    *                                                 * J0311730
                    *   INSERT MULTIPLE ENTRY POINTS INTO LET         * J0311740
                    *                                                 * J0311750
                    *************************************************** J0311760
                    DO055 LDX  I1 DO918     XR1 IS PT FOR PROG HDR      J0311770
                          LD    1 0                                     J0311780
                          STO   2 +4                                    J0311790
                          LD    1 +1        MOVE SECONDARY ENTRY POINT  J0311800
                          STO   2 +5        *NAME TO LET                J0311810
                    *                                                 * J0311820
                          SLA     16        WORD 3 OF ALL SECONDARY     J0311830
                          STO   2 +6        *ENT POINTS IS ZERO         J0311840
                    *                                                 * J0311850
                          MDX   2 +3                                    J0311860
                          MDX   1 +3                                    J0311870
                          STX   1 DO918     UPDATE XR POINTERS FOR      J0311880
                          MDX     DO025     *NEXT ENTRY POINT           J0311890
                          HDNG    STORE--WRITE LET/FLET SECTOR          J0311900
                    *************************************************** J0311910
                    *                                                 * J0311920
                    *   WRITE LET/FLET SECTOR TO DISK                 * J0311930
                    *                                                 * J0311940
                    *************************************************** J0311950
                    DO060 DC      *-*                                   J0311960
                    *************************************************** J0311970
                    *                                                 * J0311980
                    *   DETERMINE WD CNT FOR WRITING LET SECTOR. IF   * J0311990
                    *   WDS AVAILABLE EQUAL ZERO, WD CNT IS 320.      * J0312000
                    *   OTHERWISE WD CNT IS 320 MINUS WDS AVAILABLE.  * J0312010
                    *                                                 * J0312020
                    *************************************************** J0312030
                          LD      DO920                                 J0312040
                          S     3 +5                                    J0312050
                          STO   3 0         WD CNT LESS THAN 320        J0312060
                    DO065 BSI  I  PUT       WRITE LET/FLET SECTOR       J0312070
                    *                                                 * J0312080
                          LD    3 +1                                    J0312090
                          A       DO914     UPDATE LET/FLET SCTR ADDR   J0312100
                          STO   3 +1        NEW LET/FLET SCTR ADDR      J0312110
                          BSC  I  DO060                                 J0312120
                          HDNG    STORE--DATA OR CI LET UPDATE          J0312130
                    *************************************************** J0312140
                    *                                                 * J0312150
                    *   DETERMINE IF DATA OR CORE IMAGE ENTRIES TO    * J0312160
                    *   LET REQUIRE A 1DUMY ENTRY TO ACCOUNT FOR      * J0312170
                    *   DB'S OF PADDING IN USER AREA                  * J0312180
                    *                                                 * J0312190
                    *************************************************** J0312200
                    DO100 LD   L  DS950                                 J0312210
                          EOR     DO907                                 J0312220
                          BSC  L  DO120,+-  BR IF UA SCTR BOUNDARY  2-1 J0312230
                    *                                                 * J0312240
                          LD   L  DS950     WORD 3 OF LAST .1DUMY. IS   J0312250
                    DO110 STO   2 +3        *NO. OF DB'S OF PADDING.    J0312260
                    *                                                 * J0312270
                          LDD     DO908     INSERT .1DYMY. PADDING      J0312280
                          STO   2 +1        *ENTRY INTO LET.            J0312290
                          RTE     16                                    J0312300
                          STO   2 +2                                    J0312310
                    *                                                 * J0312320
                          MDX   2 +3        INCR XR2 FOR NAME ENTRY     J0312330
                          LD    3 +5                                    J0312340
                          S       DO902     BECAUSE .1DUMY. PADDING     J0312350
                          STO   3 +5        *REQ,DECR WDS AVAIL BY 3    J0312360
                    *                                                   J0312370
                          LD      DO923     REDUCE WS .1DUMY. BY        J0312380
                          S     2 0         *NUMBER OF DB'S OF PADDING  J0312390
                          STO     DO923     *REQ FOR DATA OF CORE IMAGE J0312400
                          BSC  L  DO020                                 J0312410
                    *  THE FOLLOWING CODING IS MOVED FROM PATCH AREA2-3 J0312420
                    DO120 LD    3 5         IS THIS THE FIRST ENTRY 2-1 J0312430
                          S       DO916     *TO STORE IN THIS LET   2-1 J0312440
                          BSC  L  DO130,+-  *SECTOR? BRANCH IF YES  2-1 J0312450
                          LD    2 -2        CHECK TYPE OF PREVIOUS  2-1 J0312460
                          SRA     14        *ENTRY. NO DUMMY NEEDED 2-1 J0312470
                    DO125 BSC  L  DO020,Z   *IF NOT DSF. BRANCH     2-1 J0312480
                    *                       PREVIOUS ENTRY DSF TYPE 2-1 J0312490
                          MDX     DO110     BR TO INSERT ZERO DUMMY 2-1 J0312500
                    *                                               2-1 J0312510
                    DO130 LD    1 STSW      SET UP IOAR HEADER TO   2-1 J0312520
                          S       DO914     *READ PREVIOUS LET SCTR 2-1 J0312530
                          RTE     16                                2-1 J0312540
                          LD      DO920                             2-1 J0312550
                          STD   3 0                                 2-1 J0312560
                          BSI  I  GET       READ SECTOR             2-1 J0312570
                          LD   L3 319       CHECK TYPE OF LAST ENTRY2-1 J0312580
                          SRA     14        *IN PREVIOUS SECTOR     2-1 J0312590
                          STO     DO940     SAVE TYPE               2-1 J0312600
                          LD    1 STSW                              2-1 J0312610
                          RTE     16        SET UP IOAR HEADER TO   2-1 J0312620
                          LD      DO920     *READ AGAIN SECTOR      2-1 J0312630
                          STD   3 0         *WHERE NEW ENTRY IS     2-1 J0312640
                          BSI  I  GET       *TO BE STORED.          2-1 J0312650
                          LD      DO940     GET TYPE OF ENTRY       2-1 J0312660
                          MDX     DO125     BR TO CHK IF DUMMY NEEDS2-1 J0312670
                    *                       *TO BE INSERTED         2-1 J0312680
                          HDNG    STORE--MAKE ENTRY TO FLET             J0312690
                    *************************************************** J0312700
                    *                                                 * J0312710
                    *   THIS SUBROUTINE IS USED WHEN STORING TO THE   * J0312720
                    *   FIXED AREA. IT ENTERS THE DATA OR PROGRAM     * J0312730
                    *   NAME IN THE APPROPRIATE FLET SECTOR.          * J0312740
                    *                                                 * J0312750
                    *************************************************** J0312760
                    ST800 LD    1 #FSZE     COMPARE FXA DESTINATION     J0312770
                          S     1 #DBCT     *HOLE SIZE TO PROG SIZE     J0312780
                          BSC  L  ST820,Z   BR IF FLET PUSHDOWN REQ     J0312790
                    *                                                 * J0312800
                          LD    2 +4                                    J0312810
                          BSC  L  ST820,+-  BRANCH IF AT END OF FLET    J0312820
                    *                                                 * J0312830
                          LDD   1 #NAME                                 J0312840
                          STO   2 +1        PRIME ENTRY POINT NAME OF   J0312850
                          RTE     16        *PROG TO WORDS 1 AND 2      J0312860
                          STO   2 +2        *OF FLET ENTRY.             J0312870
                    *                                                 * J0312880
                    ST810 BSI     DO060     WRITE UPDATED FLET SECTOR   J0312890
                          BSC  I  DOLET     EXIT LET/FLET UPDATE        J0312900
                    *************************************************** J0312910
                    *                                                 * J0312920
                    *   DB CNT OF ENTRY IS LESS THAN DB CNT OF        * J0312930
                    *   FIXED AREA HOLE.                              * J0312940
                    *                                                 * J0312950
                    *************************************************** J0312960
                    ST820 LD    2 +3                                    J0312970
                          S     1 #DBCT                                 J0312980
                          STO   2 +3        ADJ SIZE OF .1DUMY. ENTRY   J0312990
                    *                                                 * J0313000
                          LDD   1 #NAME     SAVE ENTRY POINT FOR        J0313010
                          STD  L  DO909     *INSERTION AFTER FLET       J0313020
                          LD    1 #DBCT     *ENTRIES HAVE BEEN PUSHED   J0313030
                          STO  L  DO938     *DOWN 3 WORDS.              J0313040
                    *                                                 * J0313050
                          LD    3 +5                                    J0313060
                          S    L  DO902                                 J0313070
                          STO   3 +5        REDUCE WDS AVAIL BY 3       J0313080
                    *                                                 * J0313090
                    ST830 STX   2 ST840+1                               J0313100
                          LD   I  ST850+1                               J0313110
                          A       ST860+1   COMPUTE NO. OF WORDS IN     J0313120
                          S       ST840+1   *FLET SECTOR TO BE MOVED    J0313130
                          STO     ST840+1   *DOWN 3 WORDS.              J0313140
                    *                                                 * J0313150
                    ST840 LDX  L1 *-*       XR1 IS NO. OF WDS TO MOVE   J0313160
                    ST850 LDX  I3 LETAR+C                               J0313170
                    ST860 MDX  L3 321       XR3 IS ADDR TO START MOVE   J0313180
                    *                                                 * J0313190
                    ST870 LD    3 0         MOVE EACH WORD TO           J0313200
                          STO   3 +3        *THE RIGHT 3 WORDS.         J0313210
                          MDX   3 -1                                    J0313220
                          MDX   1 -1        DECR LOOP COUNTER           J0313230
                          MDX     ST870     CONT IF COUNT POSITIVE      J0313240
                    *                                                 * J0313250
                          LDX  L1 C         XR1 IS CATCO MIDPOINT       J0313260
                          LDX  I3 LETAR+C   XR3 IS FLET SCTR POINTER    J0313270
                    *                                                 * J0313280
                          LDD  L  DO909     INSERT ENTRY POINT NAME     J0313290
                          STO   2 +1        *FROM TEMPORARY LOCATION    J0313300
                          RTE     16                                    J0313310
                          STO   2 +2                                    J0313320
                    *                                                 * J0313330
                          LD   L  DO938     INSERT ENTRY POINT DB COUNT J0313340
                          STO   2 +3        *PUSHED DOWN FROM LAST SCTR J0313350
                    *                                                 * J0313360
                          LD    3 +5        CHECK IF FLET SECTOR FULL   J0313370
                          BSC  L  ST810,-   BR TO EXIT IF NOT FULL      J0313380
                    *                                                 * J0313390
                          SLA     16                                    J0313400
                          STO   3 +5        SET WORDS AVAIL TO ZERO     J0313410
                          BSI  L  DO040     WRAP UP FULL FLET SCTR      J0313420
                    *                                                 * J0313430
                          LD   L  DO917                                 J0313440
                          BSC  L  ST875,Z   GET NEXT FLET SECTOR        J0313450
                    *                                                 * J0313460
                          LDD  L  DO908                                 J0313470
                          STO   3 +7        .1DUMY. WORD 1              J0313480
                          RTE     16                                    J0313490
                          STO   3 +8        .1DUMY. WORD 2              J0313500
                    *                                                 * J0313510
                          LD   L3 +324                                  J0313520
                          STO   3 +9        .1DUMY. DB COUNT            J0313530
                          MDX     ST810                                 J0313540
                    *                                                 * J0313550
                    ST875 BSI  I  GET       READ FLET SECTOR            J0313560
                          LD    3 +5                                    J0313570
                          S    L  DO902                                 J0313580
                          STO   3 +5        REDUCE WDS AVAIL BY THREE   J0313590
                    *                                                 * J0313600
                          MDX  L3 321       XR3 POINTS AT END OF SECTOR J0313610
                          LD    3 +2                                    J0313620
                          RTE     16        MOVE ENTRY POINT PUSHED     J0313630
                          LD    3 +1        *DOWN FROM LAST SECTOR TO   J0313640
                          STD  L  DO909     *TEMPORARY LOCATION.        J0313650
                          LD    3 +3                                    J0313660
                          STO  L  DO938                                 J0313670
                          MDX     ST830     PUSH DOWN CURRENT FLET SCTR J0313680
                          HDNG    STORE--UPDATE DCOM                    J0313690
                    *************************************************** J0313700
                    *                                                 * J0313710
                    *   UPDATE DCOM QUANTITIES COMMON TO 'JOB' AND    * J0313720
                    *   'JOB T'                                       * J0313730
                    *                                                 * J0313740
                    *************************************************** J0313750
                    UPDCM DC      *-*       ENTRY POINT                 J0313760
                          BSI  I  PHID      MODIFY STORE PHASE ID       J0313770
                          DC      /4003     UPDCM SUBR MODIFICATION     J0313780
                    *                                                 * J0313790
                          LDX  I2 #TODR+C   XR2 IS DESTINATION DR CODE  J0313800
                    *                                                 * J0313810
                          LD    1 FXSW                                  J0313820
                          BSC  I  UPDCM,Z   NOT STORE TO UA EXIT UPDCM  J0313830
                    *                                                 * J0313840
                          STO  L2 #WSCT+C   CLEAR WS DB COUNT           J0313850
                    *                                                 * J0313860
                    DO085 LD   L  DO922                                 J0313870
                          STO  L2 #ANDU+C   END OF UA, 'TO' DRIVE ADJ   J0313880
                    *************************************************** J0313890
                    *                                                 * J0313900
                    *   DETERMINE IF IN TEMPORARY JOB MODE            * J0313910
                    *                                                 * J0313920
                    *************************************************** J0313930
                          LD    1 #JBSW                                 J0313940
                          BSC  I  UPDCM,Z   BR IF IN JOB 'T' MODE       J0313950
                    *                                                 * J0313960
                          LD   L  DO922                                 J0313970
                          STO  L2 #BNDU+C   END OF UA, 'TO' DRIVE, BASE J0313980
                    *                                                 * J0313990
                          LD   L2 $FPAD                                 J0314000
                          STO  L2 #FPAD+C   FILE PROTECT ADDR, 'TO' DR  J0314010
                    *                                                 * J0314020
                          BSC  I  UPDCM     BR (EXIT) DCOM UPDATE       J0314030
                          HDNG    STORE--PRINT SIGN OFF MESSAGE         J0314040
                    *************************************************** J0314050
                    *                                                 * J0314060
                    *   FORMAT AND PRINT STORE SIGN OFF MESSAGE         J0314070
                    *                                                 * J0314080
                    * CART ID XXXX  DB ADDR AAAA   DB CNT LLLL        * J0314090
                    *                                                 * J0314100
                    *************************************************** J0314110
                    SNOFF DC      *-*       ENTRY POINT                 J0314120
                          BSI  I  PHID      MODIFY STORE PHASE ID       J0314130
                          DC      /6003     SNOFF SUBR MODIFICATION     J0314140
                    *                                                 * J0314150
                          LD    1 #TODR                                 J0314160
                          SLA     12                                    J0314170
                          STO     SN002     DESTINATION DR CODE (0-3)   J0314180
                          STX   2 SN004+1   SAVE XR2                    J0314190
                          LDX  L3 CATCO     XR3 POINTS TO DCOM IMAGE    J0314200
                          BSI  I  WRTDC     WRITE DCOM                  J0314210
                    SN002 DC      *-*       DESTINATION DRIVE CODE      J0314220
                    SN004 LDX  L2 *-*       RESTORE XR2                 J0314230
                          LD   L  $CORE                                 J0314240
                          SLA     3                                     J0314250
                          BSC  L  SN010,-+  BRANCH IF CORE SIZE GT 4K   J0314260
                          LDX  L3 IOADR                                 J0314270
                          LDD   1 PIHDR+2                               J0314280
                          STD   3 0                                     J0314290
                          BSI  I  GET       READ PRINC. I/O PHASE       J0314300
                    SN010 LD   L2 #CIDN+C                               J0314310
                          BSI  I  BINEB     CART ID FROM BIN TO HEX     J0314320
                          LDD   1 TEMP1                                 J0314330
                          STD     DO926     CART ID TO SIGN OFF MESSAGE J0314340
                    *                                                 * J0314350
                          LD    1 DBADR                                 J0314360
                          BSI  I  BINEB     CONVERT DB ADDR TO HEX      J0314370
                          LDD   1 TEMP1                                 J0314380
                          STD     DO928     INSERT DB ADDR IN MESSAGE   J0314390
                    *                                                 * J0314400
                          LD    1 #DBCT     CONVERT DB CNT TO HEX       J0314410
                          BSI  I  BINEB                                 J0314420
                          LDD   1 TEMP1                                 J0314430
                          STD     DO930     INSERT DB CNT IN MESSAGE    J0314440
                    *                                                 * J0314450
                          BSI  I  PRINT     PRINT SIGN OFF MESSAGE      J0314460
                          DC      DO924     ADDR OF MESSAGE             J0314470
                    *                                                 * J0314480
                          BSI  I  REST      EXIT--STORE COMPLETE        J0314490
                          HDNG    STORE--SIGN-OFF WORK AREA             J0314500
                          BSS  E  0                                     J0314510
                          DC      0         WASTE ONE WORD              J0314520
                    DO924 DC      DO932-DO925    WD CNT OF SIGN OFF     J0314530
                    DO925 EBC     .CART ID .                            J0314540
                    DO926 BSS     2         CART ID IN HEX              J0314550
                          EBC     .   DB ADDR  .                        J0314560
                    DO928 BSS     2         DB ADDR OF PROG OR DATA     J0314570
                          EBC     .   DB CNT   .                        J0314580
                    DO930 BSS     2         DB CNT OF PROG OR DATA      J0314590
                    DO932 BES     0         GENERATE MESSAGE WD CNT     J0314600
                          HDNG    STORE--I/O TO WS INITIALIZATION       J0314610
                    *************************************************** J0314620
                    *                                                 * J0314630
                    * THE FOLLOWING SUBROUTINE IS USED BY STORE       * J0314640
                    * STOREDATA, AND STORECI TO TRANSMIT INFORMATION  * J0314650
                    * FROM CARD OR PAPER TAPE TO WORKING STORAGE      * J0314660
                    *                                                 * J0314670
                    *************************************************** J0314680
                    IOWS  BSI  I  PHID      MOD 1 OF PHASE ID OF STORE  J0314690
                          DC      /1003     PHID PARAMETER              J0314700
                          LDX  L3 IO150     XR3 POINTS TO CONSTANTS     J0314710
                          LD    1 DATSW     CHECK IF STOREDATA          J0314720
                          OR    1 WSSW      *OR TO WORKING STORAGE      J0314730
                          BSC  L  IO010,+-  BR IF NOT STOREDATA         J0314740
                    *************************************************** J0314750
                    *                                                 * J0314760
                    * USE 'TO' DRIVE DEFINED ON DUP STORE CONTROL RCD * J0314770
                    *                                                 * J0314780
                    *************************************************** J0314790
                          LDX  I2 #TODR+C                               J0314800
                          MDX     IO020                                 J0314810
                    *************************************************** J0314820
                    *                                                 * J0314830
                    * USE WS DRIVE DEFINED FOR 'JOB' AS 'TO' DRIVE    * J0314840
                    *                                                 * J0314850
                    *************************************************** J0314860
                    IO010 LDX  I2 $WSDR     ZERO WORKING STORAGE        J0314870
                    IO020 LD   L2 $FPAD                                 J0314880
                          STO   3 IO180-I   SAVE WS ADDR OF THIS DRIVE  J0314890
                          STO   3 IO190-I                               J0314900
                          SLA     4                                     J0314910
                          STO   1 DBADR     DB ADDR OF WORKING STORAGE  J0314920
                          STX  L2 IO210     SAVE DRIVE CD OF 'TO' DRIVE J0314930
                    *************************************************** J0314940
                    *                                                 * J0314950
                    * COMPUTE DISK BUFFER SIZE FOR I/O TO WS          * J0314960
                    *                                                 * J0314970
                    *************************************************** J0314980
                          LD   L  $CORE     DETERMINE CORE SIZE         J0314990
                          SLA     4                                     J0315000
                          LD    3 IO375-I   1 SCTR IF CORE SIZE 4K      J0315010
                          BSC  L  IO030,C   BRANCH IF CORE 4K           J0315020
                    *************************************************** J0315030
                    *                                                   J0315040
                    * CORE SIZE IS GT 4K                              * J0315050
                    *                                                 * J0315060
                    *************************************************** J0315070
                          LD    3 IO150-I   8 SCTR BFR IF GT 4K         J0315080
                    *                       ALLOW FOR ONE MORE CD THAN  J0315090
                    IO030 STO   3 IO240-I   AN INTEGRAL NO. OF SCTRS    J0315100
                          SLA     4                                     J0315110
                          STO   3 IO245-I   SIZE OF BUFFER IN DB'S      J0315120
                          SRA     4                                     J0315130
                    *                                                   J0315140
                          M     3 IO230-I   MULTIPLY BY 320             J0315150
                          SLT     16        RESULT IS WD CNT OF I/O     J0315160
                          STO   3 IO250-I   TO WS BUFFER                J0315170
                          HDNG    STORE--I/O TO WS INITIALIZATION       J0315180
                          LD    1 LETAR                                 J0315190
                          AND   3 IO155-I                               J0315200
                          STO   3 IO200-I   ADDR OF WS BUFFER           J0315210
                    *                                                 * J0315220
                          A     1 PGMHL                                 J0315230
                          A     3 IO370-I                               J0315240
                          STO   3 IO270-I   ADDR OF FIRST DATA HDR      J0315250
                    *************************************************** J0315260
                    *                                                 * J0315270
                    * TEST IF THIS IS STOREDATA (CDD OR PTD FORMAT)   * J0315280
                    *                                                 * J0315290
                    *************************************************** J0315300
                    IO040 LD    1 DATSW                                 J0315310
                          BSC  L  IO480,Z   BRANCH IF STOREDATA         J0315320
                    *************************************************** J0315330
                    *                                                 * J0315340
                    *          FORM DISK PROGRAM HEADER               * J0315350
                    *          51 IS THE MAX LENGTH OF HEADER         * J0315360
                    *                                                 * J0315370
                    *************************************************** J0315380
                          SLA     16                                    J0315390
                          STO     IO160     CLEAR SUBR INDICATOR        J0315400
                          LDX  I2 IO200     XR2 POINTS TO WS BUFFER     J0315410
                          MDX   2 +2        ADJ PT FOR FIRST WORD       J0315420
                          LDX  I3 NEXT+C    POINT TO CD/PAPT BUFFER     J0315430
                          LD    3 +3                                    J0315440
                          SRA     8         DETERMINE IF PROG IS SUBR,  J0315450
                          S       IO370     *PROG TYPE GT TWO.          J0315460
                          BSC     -Z        SKIP IF MAINLINE PROG       J0315470
                          STX   0 IO160     SET SUBR INDICATOR          J0315480
                          LD    1 PGMHL                                 J0315490
                          S    L  DO900     SET WORD 6 OF HEADER TO     J0315500
                          STO   3 +6        *HEADER LENGTH MINUS 9.     J0315510
                          BSI  L  MOV54                                 J0315520
                          HDNG    STORE--IOWS READ DATA RECORDS         J0315530
                    *************************************************** J0315540
                    *                                                 * J0315550
                    * READ NON HEADER RECORDS                           J0315560
                    *                                                 * J0315570
                    *************************************************** J0315580
                    IO060 LDX  L1 C         XR1 POINTS TO CATCO + /82   J0315590
                          LDD   1 THIS      EXCHANGE CARD BUFFER        J0315600
                          RTE     16        ADDRESSES TO DOUBLE         J0315610
                          STD   1 THIS      BUFFER CARD READING         J0315620
                          LDX  I3 NEXT+C    XR3 IS NEXT BINARY RECORD   J0315630
                          LD    1 PTSW                                  J0315640
                          BSC  L  IO067,Z   BR IF READING PAPER TAPE    J0315650
                    *                                                 * J0315660
                          LD    3 +4        CHECK COLUMN 4 OF UNPACKED  J0315670
                          SRA     12        BFR FOR TYPE F END OF PROG  J0315680
                          EOR     IO280                                 J0315690
                          BSC  L  IO067,Z   BRANCH IF NOT TYPE 'F'      J0315700
                    IO065 LD   L  $IBSY     WAIT FOR READ COMPLETE      J0315710
                          BSC  L  IO065,Z   BRANCH IF READ NOT COMPLETE J0315720
                          MDX     IO070                                 J0315730
                    *                                                   J0315740
                    IO067 BSI  I  GETBI     READ NEXT RECORD            J0315750
                    *                                                   J0315760
                    IO070 BSI  I  PACKB     PACK CURRENT RECORD         J0315770
                    *                                                   J0315780
                          LDX  I1 IO270     1ST WD PAST PROGRAM HEADER  J0315790
                          LDX  I3 NEXT+C    XR3 POINTS TO PACKED BFR    J0315800
                          LD    3 +3        PROGRAM TYPE AND PRECISION  J0315810
                          SRT     8         SHIFT OUT PRECISION         J0315820
                          AND     IO280     MASK TYPES NOT 0-F          J0315830
                          STO     IO290     SAVE PROGRAM TYPE           J0315840
                          HDNG    STORE--IOWS RECORD TYPE DECODING      J0315850
                          MDX  L  IO290,-9  TEST IF TYPE GTR THAN 9     J0315860
                          MDX     IO090     TYPE GTR THAN 9 IS OK       J0315870
                    *************************************************** J0315880
                    *                                                   J0315890
                    * TYPE IS LESS THAN 9, INDICATING DUP ERROR 4       J0315900
                    *                                                   J0315910
                    *************************************************** J0315920
                    IO080 BSI  I  LEAVE     CALL DUP EXIT MODULE        J0315930
                          DC      30        INVALID RECORD TYPE         J0315940
                    *                                                   J0315950
                    IO090 MDX  L  IO290,-5                              J0315960
                          MDX     IO095     TYPE F  END OF PROGRAM      J0315970
                          MDX  L  IO290,+3                              J0315980
                          MDX     IO100     TYPE A (PROGRAM DATA)       J0315990
                          MDX  L  IO290,0                               J0316000
                          MDX     IO060     TYPE C,D,E (LDR OVERLAYS)   J0316010
                          MDX     IO080     ILLEGAL TYPE, DUP ERROR 4   J0316020
                    IO095 BSC  L  IO470     BR TO PROCESS END OF PROG   J0316030
                          HDNG    STORE--TYPE A DATA RECORDS            J0316040
                    *************************************************** J0316050
                    *                                                 * J0316060
                    * PROGRAM DATA RECORD PROCESSING                  * J0316070
                    *                                                 * J0316080
                    *************************************************** J0316090
                    IO100 MDX  L  IO300,-1  SKIP IF DATA HDR REQUIRED   J0316100
                          MDX     IO110     DATA HDR NOT REQUESTED      J0316110
                          MDX     IO120                                 J0316120
                    *************************************************** J0316130
                    *                                                 * J0316140
                    * CHECK FOR A SEQUENCE BREAK IN DATA              * J0316150
                    *                                                 * J0316160
                    *************************************************** J0316170
                    IO110 LD   I  IO310     COMPARE LOCATION OF LAST    J0316180
                          A       IO320     DATA WORD MOVED TO BUFFER   J0316190
                          S     3 +1        WITH 1ST LOC OF THIS RECORD J0316200
                          BSC  L  IO130,+-  BRANCH IF NO SEQ BREAK      J0316210
                    *************************************************** J0316220
                    *                                                 * J0316230
                    * DATA HEADER REQUIRED. FIRST WORD OF DATA HEADER * J0316240
                    * IS RELATIVE LOAD LOCATION OF FOLLOWING DATA.    * J0316250
                    *                                                 * J0316260
                    *************************************************** J0316270
                    IO120 LD      IO270                                 J0316280
                          STO     IO310     SAVE ADDR OF DATA HEADER    J0316290
                    *                                                   J0316300
                          SLT     32        SET IND WD CNT AND DISK     J0316310
                          STD     IO320     CNT FOR DATA HDR WD 2 ZERO. J0316320
                    *                                                   J0316330
                          LD    3 +1        RELATIVE LOAD LOCATION IS   J0316340
                          STO   1 0         WORD 1 OF DATA HEADER       J0316350
                    *                                                   J0316360
                          STX   0 IO300     SET SW FOR NO DATA HDR      J0316370
                          HDNG    STORE--TYPE A DATA RECORDS            J0316380
                    *************************************************** J0316390
                    *                                                 * J0316400
                    *       FILL IN DATA HEADER                       * J0316410
                    *       FILL IN ALL INDICATOR WORDS               * J0316420
                    *       FILL IN ALL DATA WORDS                    * J0316430
                    * IF WS BUFFER NOT EXCEEDED THEN READ NEXT CARD   * J0316440
                    *                                                 * J0316450
                    *************************************************** J0316460
                    IO130 LD    3 +3                                    J0316470
                          AND     IO330     MASK TO GET DATA WD CNT     J0316480
                          STO     IO340     SAVE IN MODULO 8 COUNTER    J0316490
                          A       IO320     INCLUDE WITH TOTAL DISK     J0316500
                          STO     IO320     WDS FROM LAST DATA HDR      J0316510
                    *                                                   J0316520
                          SLA     16        SET COUNT OF BLOCKS OF      J0316530
                          STO     IO350     8 WORDS TO ZERO             J0316540
                    *                                                   J0316550
                          STX   1 IO140+1                               J0316560
                    IO140 LDX  L2 *-*       POINT XR2 TO 1ST IND WORD   J0316570
                          MDX   2 +2        AFTER DATA HEADER           J0316580
                          LD      IO340     CHK IF 1ST DATA CD HAS  2-7 J0316590
                          BSC  L  IO415,+-  *NO DATA WDS,THEN BRANCH2-7 J0316600
                          MDX     IO410     BRANCH AROUND CONSTANTS     J0316610
                          HDNG    STORE--IOWS CONSTANTS AND WORK AREA   J0316620
                    IO150 DC      8         CONSTANT OF 8               J0316630
                    IO155 DC      /0FFF     WS BFR CORE ADDR MASK       J0316640
                    IO160 DC      *-*       SUBR INDICATOR IF NZ        J0316650
                    IO170 DC      20        CONSTANT 20                 J0316660
                    IO180 DC      *-*       WS BFR SCTR ADDR            J0316670
                    IO190 DC      *-*       INITIAL FILE PROTECT ADDR   J0316680
                    IO200 DC      *-*       ADDR OF START OF WS BFR     J0316690
                    IO210 DC      *-*       DRIVE CODE OF 'TO' DRIVE    J0316700
                    IO220 DC      54        WD CNT FOR 1 CARD           J0316710
                    IO230 DC      320       WD CNT OF 1 SECTOR          J0316720
                          BSS  E  0                                2-10 J0316725
                    IO235 DC      0                                2-10 J0316730
                          DC      266       CONSTANT(319-53)       2-10 J0316735
                    IO240 DC      *-*       SCTRS IN I/O TO WS BUFFER   J0316740
                    IO245 DC      *-*       SIZE OF DK BUFFER, DB'S     J0316750
                    IO250 DC      *-*       WD CNT FOR NO. OF SCTRS     J0316760
                    IO270 DC      *-*       ADDR OF DATA HDR            J0316770
                    IO280 DC      /F        MASK FOR PROGRAM TYPE       J0316780
                    IO290 DC      *-*       TYPE SAVED HERE             J0316790
                    IO300 DC      *-*       ZERO IF DATA HDR REQ        J0316800
                    IO310 DC      *-*       SAVE ADDR OF DATA HDR       J0316810
                    IO315 DC      *-*       STOREDATA RECORD COUNT      J0316820
                    IO316 DC      *-*       DB'S OF DATA STILL TO WRITE J0316830
                    *                                                   J0316840
                          BSS  E  0                                     J0316850
                    IO320 DC      *-*       CNT FOR DATA HDR WD 2       J0316860
                          DC      *-*       INDICATE WORD COUNT         J0316870
                    IO330 DC      /FF       MASK FOR RCD WD CNT         J0316880
                    IO340 DC      *-*       MODULO 8 WD COUNTER         J0316890
                    IO350 DC      *-*       CNT BLKS OF 8 WDS           J0316900
                    IO360 DC      *-*       ADDR OF LAST IND WD         J0316910
                    IO370 DC      2         CONSTANT 2                  J0316920
                    IO375 DC      1         CONSTANT                    J0316930
                    IO380 DC      *-*       TEMP STORAGE W/BFR OVFLO    J0316940
                    IO390 DC      19        CONSTANT 19                 J0316950
                    I     EQU     IO150     IOWS POINTER FOR CONSTANTS  J0316960
                          HDNG    STORE--TYPE A DATA RECORDS            J0316970
                    *************************************************** J0316980
                    *                                                 * J0316990
                    * FILL IN INDICATOR WORDS                         * J0317000
                    *                                                 * J0317010
                    *************************************************** J0317020
                    IO410 LD    3 +4                                    J0317030
                          STO   2 0         INDICATOR WD TO DISK BUFFER J0317040
                          MDX  L  IO320+1,1 INCR INDR WD COUNTER    2-7 J0317050
                          MDX   3 +1        STEP INPUT RECORD PT        J0317060
                          MDX   2 +1        STEP WS BFR POINTER     2-7 J0317070
                    IO415 MDX  L  IO350,1   INCR NO. OF BLKS OF 8   2-7 J0317080
                          MDX   2 +8        STEP WS BFR POINTER     2-7 J0317090
                          MDX  L  IO340,-8  DECR MODULO 8 WD COUNTER    J0317100
                          MDX     IO410     REPEAT IF NOT LAST IND WORD J0317110
                    *                                                   J0317120
                          LDX  I3 NEXT+C    RESET XR3 TO START OF INPUT J0317130
                          STX   2 IO360     SAVE ADDR OF LAST IND WD    J0317140
                    *************************************************** J0317150
                    *                                                 * J0317160
                    * FILL IN DATA WORDS                              * J0317170
                    *                                                 * J0317180
                    *          DS978 IS THE NO. OF BLOCKS OF 8 WORDS  * J0317190
                    *          XR2 IS WORD COUNT                      * J0317200
                    *                                                 * J0317210
                    *************************************************** J0317220
                    IO420 LDX   2 +8        SET DATA WORD COUNT TO 8    J0317230
                          MDX  L  IO350,-1  DECR NO. OF BLOCKS OF 8     J0317240
                          MDX     IO430     BRANCH TILL BLKS OF 8 IS 0  J0317250
                          MDX  I2 IO340     ADJ WD CNT WITH MOD 8 CTR   J0317260
                          SLA     16        ZERO DATA HDR SW TO         J0317270
                          STO     IO300     REQUIRE DATA BREAK          J0317280
                    *************************************************** J0317290
                    *                                                 * J0317300
                    * XR1 IS DISK BUFFER POINTER                      * J0317310
                    * XR2 IS LOOP CONTROL COUNTER                     * J0317320
                    * XR3 IS INPUT RECORD POINTER                     * J0317330
                    *                                                 * J0317340
                    *************************************************** J0317350
                    IO430 LD    3 +10       MOVE INPUT RECORD DATA      J0317360
                          STO   1 +3        WORD TO DISK BUFFER         J0317370
                    *                                                   J0317380
                          MDX   3 +1        STEP INPUT RECORD POINTER   J0317390
                          MDX   1 +1        STEP DISK BUFFER POINTER    J0317400
                          MDX   2 -1        DECR LOOP COUNTER           J0317410
                    *                                                   J0317420
                          MDX     IO430     REPEAT UNTIL XR2 IS ZERO    J0317430
                          HDNG    STORE--TYPE A DATA RECORDS            J0317440
                    *************************************************** J0317450
                    *                                                 * J0317460
                    * BLOCK OF 8 DATA WORDS MOVED                     * J0317470
                    *                                                 * J0317480
                    *************************************************** J0317490
                          MDX   1 +1        STEP BFR PT PAST IND WORD   J0317500
                    *************************************************** J0317510
                    *                                                 * J0317520
                    * DETERMINE IF ALL INPUT WDS MOVED TO DISK BUFFER * J0317530
                    *                                                 * J0317540
                    *************************************************** J0317550
                          LD      IO350                                 J0317560
                          BSC  L  IO420,Z   BRANCH IF ALL WDS NOT MOVED J0317570
                    *************************************************** J0317580
                    *                                                 * J0317590
                    * FILL IN WORD COUNT IN LAST DATA HEADER. THIS    * J0317600
                    * COUNT IS THE NUMBER OF WORDS UP TO AND INCLUDING* J0317610
                    * THE NEXT DATA HEADER.                           * J0317620
                    *                                                 * J0317630
                    * THE LAST DATA HEADER HAS A WORD COUNT OF ZERO   * J0317640
                    *                                                 * J0317650
                    *************************************************** J0317660
                          LDX  I2 IO310     XR2 IS ADDR OF DK DATA HDR  J0317670
                          LD      IO370                                 J0317680
                          A       IO320     WORD CNT IS NO. OF IND WDS  J0317690
                          A       IO320+1   PLUS DATA WDS PLUS TWO.     J0317700
                          STO   2 +1        FILL IN 2ND WD OF DATA HDR  J0317710
                    *************************************************** J0317720
                    *                                                 * J0317730
                    * UPDATE DATA HEADER POINTER                      * J0317740
                    *                                                 * J0317750
                    *************************************************** J0317760
                          LD      IO360     ADDR OF NEXT DATA HDR       J0317770
                          A       IO340     EQUALS ADDR OF LAST IND WD  J0317780
                          STO     IO270     PLUS DATA WDS AFTER IT.     J0317790
                          BSI     IO435                                 J0317800
                          BSC  L  IO060     BRANCH TO READ INPUT RCDS   J0317810
                    *************************************************** J0317820
                    *                                                 * J0317830
                    * CHECK IF WS BUFFER CAPACITY REACHED             * J0317840
                    *                                                 * J0317850
                    *************************************************** J0317860
                    IO435 DC      *-*       ENTRY POINT                 J0317870
                          LDX  L1 C         XR1 IS CATCO MIDPOINT ADDR  J0317880
                          LD      IO200                                 J0317890
                          A       IO370     ADDR OF BFR WORD 1          J0317900
                          A       IO250     COMPARE DISK BFR FULL ADDR  J0317910
                          S       IO270     TO ADDR OF NEW DATA HEADER  J0317920
                          BSC  I  IO435,-   BR (EXIT) IF BFR NOT FULL   J0317930
                          HDNG    STORE--WRITE PROGRAM TO WS            J0317940
                    *************************************************** J0317950
                    *                                                 * J0317960
                    * WRITE TO WORKING STORAGE ON THE DISK IN BLOCKS  * J0317970
                    * OF SECTORS AS SPECIFIED IN DS958. DS958 IS      * J0317980
                    * CALCULATED AT EXECUTION TIME AND SHOULD BE      * J0317990
                    * TWO IF CORE SIZE IS 4K, OR EIGHT IF CORE SIZE   * J0318000
                    * IS GT 4K.                                       * J0318010
                    *                                                 * J0318020
                    *************************************************** J0318030
                          BSI     IO440     WRITE WS BFR TO DISK        J0318040
                    *                                                   J0318050
                          SLA     16        SET DATA HDR SW TO ZERO     J0318060
                          STO     IO300     TO FORCE A DATA BREAK       J0318070
                          BSC  I  IO435     BR (EXIT)                   J0318080
                    *                                                   J0318090
                    IO440 DC      0                                     J0318100
                          LDX  I3 IO200     XR3 POINTS TO IOAR HDR      J0318110
                          LD      IO180                                 J0318120
                          RTE     16        SET-UP IOAR HDR TO WRITE    J0318130
                          LD      IO250     WS BUFFER TO DISK           J0318140
                          STD   3 0                                     J0318150
                          BSI  I  PUT       WRITE BUFFER TO WS          J0318160
                    *************************************************** J0318170
                    *                                                 * J0318180
                    * INCREMENT WS SECTOR ADDRESS                     * J0318190
                    *                                                 * J0318200
                    *************************************************** J0318210
                          LD      IO316                                 J0318220
                          S       IO245                                 J0318230
                          STO     IO316     DB'S OF DATA REMAINING      J0318240
                          LD      IO180     NEXT SECTOR ADDR EQUALS     J0318250
                          A       IO240     CURRENT SECTOR ADDR PLUS    J0318260
                          STO     IO180     NO. OF SCTRS WRITTEN        J0318270
                    *************************************************** J0318280
                    *                                                 * J0318290
                    * MOVE DISK BUFFER WORDS PAST LAST WORD WRITTEN   * J0318300
                    * TO WORKING STORAGE TO THE BEGINNING OF THE      * J0318310
                    * DISK BUFFER.                                    * J0318320
                    *                                                 * J0318330
                    *************************************************** J0318340
                          LDX  I1 IO200     XR1 POINTS TO START OF BFR  J0318350
                          LDX  I2 IO200                                 J0318360
                          MDX  I2 IO250     XR2 POINTS TO END OF BFR    J0318370
                          STX   2 IO380                                 J0318380
                          LD      IO270     NUMBER WORDS TO BE MOVED    J0318390
                          S       IO380     IS DATA HDR ADDR LESS       J0318400
                          A       IO370     *END OF BUFFER ADDR         J0318410
                          STO     IO380     RESULT IS LOOP COUNTER      J0318420
                          HDNG    STORE--WRITE PROGRAM TO WS            J0318430
                    IO450 LD    2 +2        MOVE OVERFLOW WORD TO       J0318440
                          STO   1 +2        BEGINNING OF BUFFER         J0318450
                          MDX   1 +1        STEP START BFR POINTER      J0318460
                          MDX   2 +1        STEP END BFR POINTER        J0318470
                          MDX  L  IO380,-1  DECR MOVE LOOP COUNTER      J0318480
                          MDX     IO450     CONT IF MORE WDS TO MOVE    J0318490
                    *                                                   J0318500
                          LD      IO270     MOVE DATA HDR ADDR BACK     J0318510
                          S       IO250     TO THREE LT ADDR OF NEXT    J0318520
                          STO     IO270     AVAILABLE DATA WD           J0318530
                    *                                                   J0318540
                          LDX  L1 C         XR1 IS CATCO MIDPOINT ADDR  J0318550
                          BSC  I  IO440     EXIT WRITE TO WS SUBR       J0318560
                          HDNG    STORE--FINAL WRITE TO WS              J0318570
                    *************************************************** J0318580
                    *                                                 * J0318590
                    * WRITE REMAINDER OF DATA ON DISK                 * J0318600
                    *                                                 * J0318610
                    *************************************************** J0318620
                    IO460 DC      0                                     J0318630
                          LD   L  IO190     CNVRT SCTR ADDR OF START2-4 J0318640
                          SLA     4         OF PROGRAM IN WS TO ITS     J0318650
                          STO   1 DBADR     DISK BLOCK ADDRESS          J0318660
                          LDX  I3 IO200     SET XR3 TO IOAR HDR         J0318670
                          BSI  I  PUT       WRITE PARTIAL BFR TO DISK   J0318680
                          LD    3 0         PICKUP LAST WD CNT          J0318690
                          BSC  I  IO460     EXIT                        J0318700
                          HDNG    STORE--TYPE F END OF PROG RECORD      J0318710
                    *************************************************** J0318720
                    *                                                 * J0318730
                    * END OF PROGRAM RECORD PROCESSING                * J0318740
                    *                                                 * J0318750
                    *     XR1 IS ADDRESS OF CURRENT DATA HEADER       * J0318760
                    *     XR3 IS ADDRESS OF CURRENT PACKED INPUT RCD  * J0318770
                    *                                                 * J0318780
                    *************************************************** J0318790
                    IO470 LD   L  IO160                                 J0318800
                          BSC  L  IO475,Z   BR IF PROG IS SUBR          J0318810
                          LD    3 +4        RELATIVE EXEC ADDR IS       J0318820
                          STO  L  #ENTY+C   *WORD 4 OF EOP RECORD       J0318830
                    *                                                   J0318840
                    IO475 LD   L  IO180     SCTR ADDR OF LAST WR TO WS  J0318850
                          RTE     16                                    J0318860
                          LD   L  IO270     COMPUTE WD CNT OF LAST      J0318870
                          S    L  IO200     *WRITE TO WORKING STORAGE   J0318880
                          LDX  I2 IO200                                 J0318890
                          STD   2 0         SET-UP WD CNT AND SCTR ADDR J0318900
                    *                                                   J0318910
                          LD    3 +1        GENERATE EOP DATA HEADER    J0318920
                          STO   1 0         1ST WORD IS NEXT EVEN       J0318930
                          SLA     16        *LOCATION PAST PROGRAM      J0318940
                          STO   1 +1        2ND WORD IS ZERO            J0318950
                          LDX  L1 C         XR1 IS CATCO MIDPOINT ADDR  J0318960
                          BSI     IO460     LAST WRITE TO WS            J0318970
                    *                                                   J0318980
                          A    L  IO390     ADJUST LAST WD CNT TO NEXT  J0318990
                          SRT     16        *DISK BLOCK. CONVERT WORDS  J0319000
                          D    L  IO170     *TO DK BLOCKS BY DIVIDING   J0319010
                          SRT     4         *BY TWENTY                  J0319020
                    *                                                   J0319030
                          A    L  IO180     LAST COMPLETE SCTR ADDR     J0319040
                          S    L  IO190     *LESS 1ST SCTR ADDR TIMES   J0319050
                          SLT     4         *SIXTEEN IS PROGRAM SIZE    J0319060
                          LDX  I2 IO210     *IN DK BLOCKS. ENTER IN     J0319070
                          STX  L2 #FRDR+C   SAVE DR CODE OF PROG IN WS  J0319080
                          STO  L2 #WSCT+C   *#WSCT TBL FOR 'TO' DRIVE   J0319090
                          STO   1 #DBCT     SAVE DB CNT OF PROG OR DATA J0319100
                          SLA     16        FORMAT OF WORKING STORAGE   J0319110
                          STO  L2 #FMAT+C   *IS ZERO FOR DSF            J0319120
                    *************************************************** J0319130
                    *                                                 * J0319140
                    *   IF PROGRAM IS A MAINLINE, INSERT XEQ ADDR     * J0319150
                    *   FROM LAST RECORD INTO PROGRAM HEADER          * J0319160
                    *                                                 * J0319170
                    *************************************************** J0319180
                          LD   L  IO160                                 J0319190
                          BSC  L  ST020,Z   BR IF NOT A MAINLINE        J0319200
                    *                                                 * J0319210
                          LD   L  IO190                                 J0319220
                          RTE     16        SET-UP DISK IOAR HDR        J0319230
                          LD   L  IO230     *TO READ 1ST SCTR OF        J0319240
                          STD   3 0         *PROGRAM                    J0319250
                    *                                                 * J0319260
                          BSI  I  GET       READ 1ST SECTOR             J0319270
                    *                                                 * J0319280
                          LD    1 #ENTY                                 J0319290
                          STO   3 +13       INSERT EXECUTION ADDRESS    J0319300
                    *                                                 * J0319310
                          BSI  I  PUT       WRITE 1ST SECTOR            J0319320
                          BSC  L  ST020     BR (EXIT) I/O TO WS         J0319330
                          HDNG    STORE--SUBR TO MOVE 54 WORDS          J0319340
                    *************************************************** J0319350
                    *                                                 * J0319360
                    * THIS SUBR MOVES 40 OR 54 WORDS FROM THE AREA    * J0319370
                    * SPECIFIED BY XR3 TO THE AREA SPECIFIED BY XR2   * J0319380
                    *                                                 * J0319390
                    *************************************************** J0319400
                    MOV40 DC      0                                 2E2 J0319410
                          LDX   1 40        SET TO MOVE 40 WORDS FOR2E2 J0319420
                          LD      MOV40     *HANDLING OF EBCDIC DATA2E2 J0319430
                          STO     MOV54     SECURE RETURN           2E2 J0319440
                          MDX     MOVXX                             2E2 J0319450
                    *                                               2E2 J0319460
                    MOV54 DC      0                                     J0319470
                          LDX   1 +54       SET TO MOVE 54 WORDS        J0319480
                    *                                                   J0319490
                    MOVXX LD    3 +1                                    J0319500
                          STO   2 0         MOVE WORDS 1-54             J0319510
                    *                                                   J0319520
                          MDX   2 +1        STEP TO NEXT INPUT WORD     J0319530
                          MDX   3 +1        STEP TO NEXT OUTPUT WORD    J0319540
                          MDX   1 -1        DECR LOOP COUNTER           J0319550
                          MDX     MOVXX     CONT TILL 54 WORDS MOVED    J0319560
                    *                                                   J0319570
                          LDX  L1 C         XR1 IS CATCO MIDPOINT ADDR  J0319580
                          BSC  I  MOV54     RETURN                      J0319590
                          HDNG    STORE--STOREDATA I/O TO WS            J0319600
                    IO480 LDX  L2 IO150     XR2 POINTS TO CONSTANTS     J0319610
                          LD    1 WSSW                                  J0319620
                          BSC  L  IO485,Z   BR IF STOREDATA TO WS       J0319630
                          LD    1 FXSW                                  J0319640
                          BSC  L  IO484,Z   BR IF STOREDATA TO FXA      J0319650
                    *                                                 * J0319660
                          LD    1 #UHOL     ROUND DB HOLE ADDRESS TO    J0319670
                    IO482 STO  L  DS950     *DESTINATION SCTR DB ADDR.  J0319680
                          A     2 IO280-I                               J0319690
                          SRT     16                                    J0319700
                          LD    2 IO210-I   PUT DRIVE CODE OF 'TO'      J0319710
                          SLT     12        *DRIVE INTO DESTINATION     J0319720
                          STO   2 IO180-I   *SCTR ADDR.                 J0319730
                          SLA     4                                     J0319740
                          STO   1 DBADR     DB ADDR OF DESTINATION      J0319750
                          LD   L  DS950     MASK OFF NO. OF DB'S FROM   J0319760
                          AND   2 IO280-I   *DB ADDR IN EXCESS OF LAST  J0319770
                          STO  L  DS950     *COMPLETE SECTOR.           J0319780
                          LD   L  DS949     SUBTRACT NO. OF DB'S JUST   J0319790
                          S    L  DS950     *OBTAINED FROM 16.          J0319800
                          STO  L  DS950     NO. OF DB'S OF PADDING REQ  J0319810
                          MDX     IO485                                 J0319820
                    *                                                 * J0319830
                    IO484 LD    1 #FHOL     USE FXA HOLE DB ADDR        J0319840
                          MDX     IO482                                 J0319850
                    *************************************************** J0319860
                    *                                                 * J0319870
                    *   DETERMINE DB CNT OF DATA TO BE STORED. 6 INPUT* J0319880
                    *   RECORDS ARE EQUIVALENT TO ONE SECTOR OF DATA  * J0319890
                    *   IF STOREDATA, 8 IF STOREDATAE OPERATION     2E2 J0319900
                    *                                                 * J0319910
                    *************************************************** J0319920
                    IO485 LD    1 EBCSW     CK TO SEE IF STOREDATAE 2E2 J0319930
                          BSC  L  IO486,+-  BRANCH IF NOT           2E2 J0319940
                          LD    1 DATSW     NO. OF DATA RCDS TO READ2E2 J0319950
                          STO   2 IO315-I                           2E2 J0319960
                          A     2 IO150-I   TO GET NO. OF SECTORS   2-3 J0319970
                          S     2 IO375-I   *REQUIRED, ADD 7        2-3 J0319980
                          SRA     3         *AND DIVIDE BY 8        2-3 J0319990
                          MDX     IO487     JOIN STOREDATA         2-10 J0320000
                    *                                               2E2 J0320010
                    IO486 LD    1 DATSW                                 J0320020
                          STO   2 IO315-I   NO. OF DATA RECORDS TO READ J0320030
                          M     2 IO220-I                               J0320040
                    *                       *NO. OF SCTRS REQUIRED 2-10 J0320050
                          AD    2 IO235-I   *FOR N CDS IS 54*N PLUS2-10 J0320060
                    * 1 INSTRUCTION REMOVED                        2-10 J0320070
                          D     2 IO230-I   *BY 320.                    J0320080
                    *                                                 * J0320090
                    IO487 SLA     4         CONVERT DATA SECTOR CNT2-10 J0320100
                          STO   1 DATSW     *TO DB COUNT.               J0320110
                          STO   1 #DBCT                                 J0320120
                          STO   2 IO316-I   DB'S OF DATA TO BE WRITTEN  J0320130
                          LD    1 WSSW                                  J0320140
                          BSC  L  IO489,Z   BR IF STOREDATA TO WS       J0320150
                          LD    1 #USZE                                 J0320160
                          MDX  L  UASW+C,0  SKIP IF STORE TO FXA        J0320170
                          MDX     IO488                                 J0320180
                    *                                                 * J0320190
                          LD    1 #FSZE                                 J0320200
                    IO488 S     1 #DBCT                                 J0320210
                          BSC  L  IO489,-   BR IF ROOM FOR STORE        J0320220
                          BSI  I  LEAVE     DUP ERROR EXIP. SOURCE      J0320230
                          DC      31        *EXCEEDS AVAIL DISK SPACE   J0320240
                    *************************************************** J0320250
                    *                                                 * J0320260
                    *   BEFORE ENTERING DOUBLE-BUFFERED MODE, DO      * J0320270
                    *   INITIAL READ. SPECIAL CODING FOR RJE        2E2 J0320280
                    *                                                 * J0320290
                    *************************************************** J0320300
                    IO489 LD    1 EBCSW     CK TO SEE IF STOREDATAE 2E2 J0320310
                          BSC  L  IO491,+-  BRANCH IF NOT           2E2 J0320320
                    IO490 BSI  I  GETHO     READ A RECORD           2E2 J0320330
                          MDX  L  $IBSY,0                           2E2 J0320340
                          MDX     *-3       LOOP TILL READ IS COMPL 2E2 J0320350
                          LDX  I2 IO270     INITLZ INDEX REGISTERS  2E2 J0320360
                          LDX  I3 PEBUF+C   *TO MOVE                2E2 J0320370
                          BSI     MOV40     MOVE 40 WORDS FROM PEBUF2E2 J0320380
                          STX  L2 IO270     STORE NEW ADDRESS       2E2 J0320390
                          BSI  L  IO435     CHECK BFR FULL          2E2 J0320400
                          MDX  L  IO315,-1  DECR RECORD COUNT       2E2 J0320410
                          MDX     IO490     READ NEXT RCD IF NOT DON2E2 J0320420
                          MDX     IO496-5   BRANCH TO WRITE ON DISK 2E2 J0320430
                    *                       *BUT FIRST RESTORE XR2  2E2 J0320440
                    IO491 BSI  I  GETBI     READ 1ST RECORD         2E2 J0320450
                          LD    1 PTSW                                  J0320460
                          BSC  L  IO500,Z   BR IF INPUT FROM PAPER TAPE J0320470
                    *                                                 * J0320480
                    IO492 LD    1 PTSW                              2-3 J0320490
                          BSC  L  IO491,Z   IF PT, GO READ NEXT RCD 2-3 J0320500
                    *                                               2-3 J0320510
                          LDD   1 THIS                                  J0320520
                          RTE     16                                    J0320530
                          STD   1 THIS      EXCHANGE BUFFER ADDRESSES   J0320540
                    *                                                 * J0320550
                          MDX  L  IO315,-1  DECR DATA RECORD COUNT  2-3 J0320560
                          MDX     IO494     READ NEXT IF COUNT PLUS 2-3 J0320570
                    *                       TWO WORDS               2-3 J0320580
                    *                       *SAVED                  2-3 J0320590
                    *                                                 * J0320600
                    IO493 MDX  L  $IBSY,0   SKIP IF LAST READ COMPLETE  J0320610
                          MDX     IO493     LOOP TILL READ IS COMPLETE  J0320620
                          MDX     IO495     GO PACK THIS RECORD         J0320630
                    *                                                 * J0320640
                    IO494 BSI  I  GETBI     READ NEXT DATA RECORD       J0320650
                    IO495 BSI  I  PACKB     PACK CURRENT RECORD         J0320660
                    *************************************************** J0320670
                    *                                                 * J0320680
                    *   MOVE PACKED BINARY RECORD TO DISK BUFFER      * J0320690
                    *                                                 * J0320700
                    *************************************************** J0320710
                          LDX  I2 IO270     XR2 IS DK BFR POINTER       J0320720
                          LDX  I3 NEXT+C    XR3 IS INPUT BFR POINTER    J0320730
                          BSI     MOV54     MOVE INPUT BFR TO DK BFR    J0320740
                          STX  L2 IO270                                 J0320750
                          BSI  L  IO435     CHECK FOR DK BFR FULL       J0320760
                    *                                                 * J0320770
                          LDX  L2 IO150     XR2 POINTS TO CONSTANTS     J0320780
                          LD    2 IO315-I                               J0320790
                          BSC  L  IO492,-Z  BR IF RECORD COUNT POSITIVE J0320800
                    *************************************************** J0320810
                    *                                                 * J0320820
                    *   ALL STOREDATA INPUT RECORDS HAVE BEEN READ    * J0320830
                    *   AND PROCESSED. WRITE REMAINDER OF DATA NOW    * J0320840
                    *   IN DISK BUFFER TO WS OR FIXED AREA.           * J0320850
                    *                                                 * J0320860
                    *************************************************** J0320870
                    IO496 LDX  I3 IO200     XR3 IS DK BFR IOAR ADDRESS  J0320880
                          LD    2 IO316-I                               J0320890
                          BSC  L  IO498,+   BR IF ALL DB'S WRITTEN      J0320900
                    *                                                 * J0320910
                          M     2 IO170-I   CONVERT DB'S TO WD COUNT    J0320920
                          SLT     16                                    J0320930
                          STO   3 0         WD CNT FOR LAST WRITE       J0320940
                          LD    2 IO180-I                               J0320950
                          STO   3 +1        SCTR ADDR FOR LAST WRITE    J0320960
                          BSI  I  PUT       WRITE PARTIAL BFR TO DISK   J0320970
                          HDNG    STORE--STOREDATA I/O TO WS,UA, OR FXA J0320980
                    *************************************************** J0320990
                    *                                                 * J0321000
                    *   DETERMINE IF STOREDATA TO USER OR FIXED AREA  * J0321010
                    *                                                 * J0321020
                    *************************************************** J0321030
                    IO498 LDX  I2 IO210     XR2 IS WS DRIVE CODE        J0321040
                          LD    1 WSSW                                  J0321050
                          BSC  L  ST015,+-  BR TO UPDATE LET/FLET       J0321060
                          LD    1 #DBCT                                 J0321070
                          STO  L2 #WSCT+C   DB CNT OF DATA IN WS        J0321080
                          LD   L  IO375     +1 FOR DDF FORMAT       2-5 J0321090
                          MDX  L  STCSW+C,0 SKIP IF NOT STORECI     2-5 J0321100
                          LD      ST904     -2 FOR DCI FORMAT       2-5 J0321110
                    IO499 STO  L2 #FMAT+C   FORMAT PLUS FOR DATA        J0321120
                          BSC  L  ST020     BR TO STORE MASTER CONTROL  J0321130
                    *                                                 * J0321140
                    IO500 LD    2 IO315-I                               J0321150
                          S     2 IO375-I                               J0321160
                          STO   2 IO315-I   DECR DATA RECORD COUNT      J0321170
                          MDX     IO493     GO WAIT FOR READ COMPLETE   J0321180
                          HDNG    STORE--STOREMOD PROCESSING            J0321190
                    *************************************************** J0321200
                    *                                                 * J0321210
                    *   THIS STORE FUNCTION WILL REPLACE AN OLD       * J0321220
                    *   VERSION OF A PROGRAM OR DATA FILE IN WITH     * J0321230
                    *   A NEW VERSION, PROVIDED THE NEW VERSION IS    * J0321240
                    *   NOT LARGER.                                   * J0321250
                    *                                                 * J0321260
                    *************************************************** J0321270
                    ST700 BSI  I  PHID      MODIFY PHASE ID             J0321280
                          DC      /5003     STOREMOD ID MODIFIER        J0321290
                    *                                                 * J0321300
                          LDX  L3 BUF5      XR3 POINTS TO OUTPUT BFR    J0321310
                          LDX  I2 #FRDR+C   XR2 IS DR CODE OF SOURCE DR J0321320
                          LD   L2 $FPAD                                 J0321330
                          STO  L3 +323      SCTR ADDR OF WS SOURCE      J0321340
                          LD   L2 #WSCT+C   USE ACTUAL DB CNT      2-10 J0321342
                          STO     ST910     TOTAL DBS TO BE MOVED  2-10 J0321344
                    *                                                 * J0321350
                          LD    1 DBADR                                 J0321360
                          RTE     16        GET SCTR ADDR OF PROG OR    J0321370
                          LD    1 #TODR     *DATA FILE TO BE REPLACED   J0321380
                          SLT     12                                    J0321390
                          STO   3 +1        STARTING SCTR ADDR          J0321400
                    *                                                 * J0321410
                          SLA     12                                    J0321420
                          SLT     4         COMPUTE RELATIVE WORD NO.   J0321430
                          M       ST900     *WITHIN THIS SCTR AT WHICH  J0321440
                          RTE     16        *OLD VERSION BEGINS.        J0321450
                          S       ST902                                 J0321460
                          STO     ST710+1   RELATIVE WORD NO. (-320)    J0321470
                    *                                                 * J0321480
                    ST710 LDX  L2 *-*       XR2 IS OUTPUT BFR DISP.     J0321490
                          LD      ST902                                 J0321500
                          STO   3 0         OUTPUT BFR WORD COUNT       J0321510
                          STO  L3 +322      INPUT BFR WORD COUNT        J0321520
                    *                                                   J0321530
                          BSI  I  GET       GET INITIAL OUTPUT SECTOR   J0321540
                    *                       CODE REMOVED           2-10 J0321550
                    *                                              2-10 J0321560
                          LD      ST900                                 J0321570
                          STO     ST912     COUNT OF WORDS PER DB       J0321580
                          MDX  L3 +322      XR3 POINTS TO INPUT BFR     J0321590
                    *                                               2-3 J0321600
                          BSI  I  GET       READ FIRST INPUT SECTOR 2-3 J0321610
                          LDX  L3 -320      POINT TO WORD 1         2-3 J0321620
                          LDD   1 #NAME     GET NAME OF ENTRY       2-3 J0321630
                          BSC  L  ST730,+   BRANCH IF NOT DSF       2-4 J0321640
                          STO  L3 BUF5+653  INSERT                  2-3 J0321650
                          RTE     16        *      NAME             2-3 J0321660
                          STO  L3 BUF5+654  *           IN HEADER   2-3 J0321670
                          LD   L3 BUF5+646                          212 J0321673
                          SLA     4         REMOVE OLD SUBTYPE      212 J0321674
                          SRA     4         *                       212 J0321675
                          OR    1 T3MSW     OR IN NEW SUBTYPE       212 J0321676
                          STO  L3 BUF5+646  STORE BACK IN HDR       212 J0321677
                          MDX     ST730     GO TO MOVE PROGRAM      2-3 J0321680
                    *                                                 * J0321690
                    ST720 BSI  I  GET       READ INPUT SECTOR           J0321700
                          LDX  L3 -320      SET XR3 TO ACCESS INPUT WD1 J0321710
                    *                                                 * J0321720
                    ST730 LD   L3 BUF5+644  MOVE ONE WORD FROM INPUT    J0321730
                          STO  L2 BUF5+322  *BUFFER TO OUTPUT BUFFER    J0321740
                    *                                                 * J0321750
                          MDX   2 +1                                    J0321760
                          MDX     ST750     SKIP IF OUTPUT BFR FULL     J0321770
                    *                                                 * J0321780
                          STX   3 ST740+1   SAVE XR3                    J0321790
                          LDX  L3 BUF5                                  J0321800
                          BSI  I  PUT       WRITE OUTPUT SECTOR         J0321810
                    *                                                 * J0321820
                          MDX  L  BUF5+1,1  INCR OUTPUT SCTR ADDR       J0321830
                          LD      ST910     CHECK IF DB JUST DONE  2-10 J0321832
                          S       K1        *IS LAST ONE TO WRITE  2-10 J0321834
                          BSC  L  ST740,+-  SKIP GET IF LAST DB    2-10 J0321836
                          BSI  I  GET       GET NEXT OUTPUT SECTOR      J0321840
                    *                                                 * J0321850
                    ST740 LDX  L3 *-*       RELOAD XR3                  J0321860
                          LDX  L2 -320      RE-SET OUTPUT DISPLACEMENT  J0321870
                    *                                                 * J0321880
                    ST750 MDX  L  ST912,-1  SKIP IF DB COMPLETED        J0321890
                          MDX     ST770                                 J0321900
                    *                                                 * J0321910
                          LD      ST900                                 J0321920
                          STO     ST912     RESET COUNTER FOR NEXT DB   J0321930
                          MDX  L  ST910,-1  SKIP IF END OF MOVE         J0321940
                          MDX     ST770                                 J0321950
                    *                                                 * J0321960
                          MDX  L2 319       SKIP TO OUTPUT LAST SECTOR  J0321970
                          MDX     ST760                                 J0321980
                    *                                                 * J0321990
                          LDX  L3 BUF5                                  J0322000
                          BSI  I  PUT       OUTPUT LAST FULL SECTOR     J0322010
                    *                                                 * J0322020
                    ST760 LDX  I2 #TODR+C   XR2 IS DR CODE OF OUTPUT DR J0322030
                          BSI  L  SNOFF     GO PRINT SIGN-OFF MESSAGE   J0322040
                    *                                                 * J0322050
                    ST770 MDX   3 +1        SKIP IF END OF INPUT BFR    J0322060
                          MDX     ST730                                 J0322070
                    *                                                 * J0322080
                          MDX  L  BUF5+323,1     INCR INPUT SCTR ADDR   J0322090
                          LDX  L3 BUF5+322  XR3 POINTS TO INPUT BFR     J0322100
                          MDX     ST720                                 J0322110
                          HDNG    STORE--STOREMOD CONSTANTS,WORK AREAS  J0322120
                    ST900 DC      20        CONSTANT                    J0322130
                    ST902 DC      320       CONSTANT                    J0322140
                    ST904 DC      -2        CONSTANT                2-5 J0322150
                    ST910 DC      *-*       COUNTER FOR TOTAL DB'S      J0322160
                    ST912 DC      *-*       COUNTER FOR ONE DB          J0322170
                    K1    DC      1         CONST TO CHECK LAST DB 2-10 J0322175
                    *             STORE PATCH AREA                  2-1 J0322180
                    *                                               2-1 J0322190
                          BSS     BUF5-/5000-*-1 STORE PATCH AREA   2-8 J0322200
                          DC      /FFFF          END OF STORE P. A. 2-1 J0322210
                          END     ST000                                 J0322220
