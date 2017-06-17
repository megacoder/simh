                          HDNG    FILEQ--RESIDENT COMMA      2 AUG 67   J0400010
                          ABS                                           J0400020
                    $CIBA EQU     /5   ADDR OF CIB ON MASTER CARTRIDGE  J0400030
                    $CH12 EQU     /6   CHANNEL 12 INDR,NON-ZERO=CHAN 12 J0400040
                    $COMN EQU     /7   WORD COUNT OF COMMON             J0400050
                    $CORE EQU     /E   CORE SIZE,/1000=4K,/2000=8K,ETC) J0400060
                    $CTSW EQU     /F   MCR SW,NON-ZERO=// RECD TRAPPED  J0400070
                    $DADR EQU     /10  SCTR ADDR OF PROG TO BE FETCHED  J0400080
                    $DABL EQU     /11  IOCC FOR SCA RESET (ODD ADDR)    J0400090
                    $DREQ EQU     /12  INDR FOR REQUESTED V. DISK I/O   J0400100
                    $IBSY EQU     /13  PRINC I/O BUSY INDR,NON-ZERO=BSY J0400110
                    $HASH EQU     /14  WORK AREA FOR MONITOR PROGRAMS   J0400120
                    $PRET EQU     /28  ADDR PREOPERATIVE ERROR TRAP     J0400130
                    $IREQ EQU     /2C  ADDR OF INT REQUEST SUBROUTINE   J0400140
                    $ULET EQU     /2D  ADDR OF LET, LOGICAL DRIVE 0     J0400150
                    $IOCT EQU     /32  IOCS CTR,0=NO I/O IN PROGRESS    J0400160
                    $LAST EQU     /33  LAST CD INDR,NON-ZERO=LAST CARD  J0400170
                    $NDUP EQU     /34  INHIBIT DUP SW,NON-ZERO=NO DUP   J0400180
                    $NXEQ EQU     /35  INHIBIT EXEC SW,NON-ZERO=NO EXEQ J0400190
                    $PBSY EQU     /36  PRINC PTR BUSY INDR,NON-ZERO=BSY J0400200
                    $PGCT EQU     /37  PAGE NO. FOR PAGE HEADINGS       J0400210
                    $EXIT EQU     /38  ADDR CALL EXIT ENTRY POINT       J0400220
                    $LINK EQU     /39  ADDR CALL LINK ENTRY POINT       J0400230
                    $DUMP EQU     /3F  ADDR OF CALL DUMP, ENTRY POINT   J0400240
                    $DCDE EQU     /77  DRIVE CODE FOR CORE LOAD BLDR    J0400250
                    $PHSE EQU     /78  NO. OF PHASE CURRENTLY IN CORE   J0400260
                    $UFIO EQU     /79  ARM POSITION IN UNFORMATTED AREA J0400270
                    $WSDR EQU     /7A  WORKING STORAGE DRIVE CODE       J0400280
                    $WRD1 EQU     /7B  LOAD ADDR FOR CURR USER CORE LD  J0400290
                    $KCSW EQU     /7C  INHIBIT INPUT/PRINT OVERLAP SW   J0400300
                    $UFDR EQU     /7D  UNFORMATTED I/O DRIVE CODE       J0400310
                    $CPTR EQU     /7E  CHANNEL 12 INDICATOR FOR CP      J0400320
                    $1132 EQU     /7F  CHANNEL 12 INDICATOR FOR 1132    J0400330
                    $1403 EQU     /80  CHANNEL 12 INDICATOR FOR 1403    J0400340
                    $PST1 EQU     /81  ADDR POSTOP ERROR TRAP,LEVEL 1   J0400350
                    $PST2 EQU     /85  ADDR POSTOP ERROR TRAP,LEVEL 2   J0400360
                    $PST3 EQU     /89  ADDR POSTOP ERROR TRAP,LEVEL 3   J0400370
                    $PST4 EQU     /8D  ADDR POSTOP ERROR TRAP,LEVEL 4   J0400380
                    $STOP EQU     /91  ADDR PROGRAM STOP KEY TRAP       J0400390
                    $FPAD EQU     /95  FILE PROTECT ADDR (ADJ),LOG DR 0 J0400400
                    $CYLN EQU     /9A  ARM POSITION FOR LOGICAL DRIVE 0 J0400410
                    $ACDE EQU     /9F  AREA CODE FOR LOGICAL DRIVE 0    J0400420
                    $DCYL EQU     /A4  1ST DEF CYL ADDR, LOGICAL DR 0   J0400430
                    $I200 EQU     /B3  ENTRY POINT TO ILS FOR LEVEL 2   J0400440
                    $I205 EQU     /B8                                   J0400450
                    $IBT2 EQU     $I205+1 ADDR OF IBT FOR LEVEL 2       J0400460
                    $I400 EQU     /C4  ENTRY POINT TO ILS FOR LEVEL 4   J0400470
                    $I405 EQU     /D3                                   J0400480
                    $IBT4 EQU     $I405+1 ADDR OF IBT FOR LEVEL 4       J0400490
                    $I410 EQU     /D5                                   J0400500
                    $DBSY EQU     /EE  DISK BUSY INDR,NON-ZERO=DK BUSY  J0400510
                    $BYSW EQU     /1CB BYPASS SW,NOP IF FETCHING SOCAL  J0400520
                    DZ000 EQU     /0F2 DISKZ ENTRY POINT                J0400530
                    $ZEND EQU     /1E0 ADDR 1+LAST WORD OF DISKZ        J0400540
                          HDNG          CONCATENATED COMMON AREA(CATCO) J0400550
                    C     EQU     /7FA0     CATCO POINTER SET TO MIDDLE J0400560
                    *************************************************** J0400570
                    *                                                 * J0400580
                    *  INDEX REG 1 IS SET TO .C. WHEN CATCO IS FORMED * J0400590
                    *  FOR USE BY ALL OF DUP FUNCTIONS. ANY DUP ROUT  * J0400600
                    *  USING XR 1 FOR OTHER REASONS MUST RESTORE.     * J0400610
                    *  ALL VALUES IN CATCO HAVE LABELS EQUATED TO THE * J0400620
                    *  VALUE THAT INDICATES THEIR RELATIVE LOCATION   * J0400630
                    *  FROM .C.                                       * J0400640
                    *                                                 * J0400650
                    *************************************************** J0400660
                    *                                                 * J0400670
                    *             CATCO DCOM IMAGE                    * J0400680
                    *   EQUIVALENCES USED TO REFERENCE CATCO WITH XR1 * J0400690
                    *                                                 * J0400700
                    *************************************************** J0400710
                    #NAME EQU     4-/80     NAME OF PROGRAM             J0400720
                    #DBCT EQU     6-/80     DISK BLOCK COUNT OF PROGRAM J0400730
                    #FCNT EQU     7-/80     FILES SW,ZERO = NO FILES    J0400740
                    #SYSC EQU     8-/80     NON-ZERO,SYSTEM CARTRIDGE   J0400750
                    #JBSW EQU     9-/80     JOB SW,NON-ZERO='T' MODE    J0400760
                    #CBSW EQU     10-/80    CLB SW,NON-ZERO=STORECI     J0400770
                    #LCNT EQU     11-/80    NO. OF LOCALS               J0400780
                    #MPSW EQU     12-/80    NON-ZERO, CORE MAP DESIRED  J0400790
                    #MDF1 EQU     13-/80    NO. OF DUP CTRL RCDS        J0400800
                    #MDF2 EQU     14-/80    ADDR OF MODIF BUFFER        J0400810
                    #NCNT EQU     15-/80    NO. OF NOCALS               J0400820
                    #ENTY EQU     16-/80    RELATIVE ENTRY ADDR OF PROG J0400830
                    #RP67 EQU     17-/80    IF NON-ZERO,1442 MOD 6,7    J0400840
                    *                                                   J0400850
                    *   NEGATIVE VALUE REPRESENTS DEFAULT CONDITION   * J0400860
                    #TODR EQU     18-/80    DR CODE OF 'TO' DRIVE       J0400870
                    #FRDR EQU     19-/80    DR CODE OF 'FROM' DRIVE     J0400880
                    *                                                 * J0400890
                    #FHOL EQU     20-/80    ADDR OF LARGEST FXA HOLE    J0400900
                    #FSZE EQU     21-/80    BLK CNT LARGEST HOLE IN FXA J0400910
                    #UHOL EQU     22-/80    ADDR OF LARGEST UA HOLE     J0400920
                    #USZE EQU     23-/80    BLK CNT LARGEST HOLE IN UA  J0400930
                    #DCSW EQU     24-/80    NON-ZERO=DUP CALL           J0400940
                    #PIOD EQU     25-/80    PRINC. I/O INDICATOR        J0400950
                    #PPTR EQU     26-/80    PRINC. PRINTER INDICATOR    J0400960
                    #CIAD EQU     27-/80    WD NO. SCTR 0,CIL ADDR      J0400970
                    #ACIN EQU     28-/80    AVAILABLE CARTRIDGE INDR2-8 J0400980
                    #GRPH EQU     29-/80    2250 INDICATOR          2-8 J0400990
                    #GCNT EQU     30-/80    NO. G2250 RECORDS       2-8 J0401000
                    #LOSW EQU     31-/80    LOCAL-CALLS-LOCAL INDR  2-8 J0401010
                    #X3SW EQU     32-/80    SPECIAL ILS SWITCH      2-8 J0401020
                    #ECNT EQU     33-/80    NO. OF EQUAT RCDS       2-8 J0401030
                    #ANDU EQU     35-/80    END OF UA (ADJ) LOG DR 0-4  J0401040
                    #BNDU EQU     40-/80    END OF UA (BASE) LOG DR 0-4 J0401050
                    #FPAD EQU     45-/80    FILE PROTECT ADDR (BASE)    J0401060
                    #PCID EQU     50-/80    CART ID, PHYS DR 0-4        J0401070
                    #CIDN EQU     55-/80    CART ID, LOG DR 0-4         J0401080
                    #CIBA EQU     60-/80    CIB ADDR, LOG DR 0-4        J0401090
                    #SCRA EQU     65-/80    SCRA, LOG DR 0-4            J0401100
                    #FMAT EQU     70-/80    WS FORMAT, LOG DR 0-4       J0401110
                    #FLET EQU     75-/80    FLET ADDR, LOG DR 0-4       J0401120
                    #ULET EQU     80-/80    LET ADDR, LOG DR 0-4        J0401130
                    #WSCT EQU     85-/80    WS BLK CNT, LOG DR 0-4      J0401140
                    #CSHN EQU     90-/80    CUSHION END SCTR ADDR, 0-4  J0401150
                    #DCOM EQU     1         SCTR ADDR OF DCOM           J0401160
                    #HDNG EQU     7         SCTR WITH PAGE HEADING      J0401170
                    @SBFR EQU     /FB0                              2-8 J0401180
                          HDNG    CONCATENATED COMMON AREA (CATCO)      J0401190
                    *************************************************** J0401200
                    *                                                 * J0401210
                    *             CATCO IOAR HDRS FOR DUP PHASES      * J0401220
                    *                                                 * J0401230
                    *************************************************** J0401240
                          ORG     -/10                                  J0401250
                    DCHDR BSS     2         DUP CONTROL            PH02 J0401260
                    STHDR BSS     2         STORE                  PH03 J0401270
                    FLHDR BSS     2         FILEQ                  PH04 J0401280
                    DMHDR BSS     2         DUMP                   PH05 J0401290
                    DLHDR BSS     2         DUMPLET                PH06 J0401300
                    DTHDR BSS     2         DELETE                 PH07 J0401310
                    DFHDR BSS     2         DEFINE                 PH08 J0401320
                    DXHDR BSS     2         DUP EXIT               PH09 J0401330
                    UCHDR BSS     2         DUP UPCOR              PH13 J0401340
                    PIHDR BSS     2         PRINCIPAL I/O BLOCK    PH14 J0401350
                    SIHDR BSS     2         PRINC I/O (W/O KB) BLK PH15 J0401360
                    PTHDR BSS     2         PAPER TAPE I/O BLOCK   PH16 J0401370
                    CIHDR BSS     2         CI PHASE READ BY CL BUILDER J0401380
                    MUHDR BSS     2         MACRO UPDATE      PH206 2-8 J0401390
                    D2HDR BSS     2         DUP CONTROL 2     PH205 2-8 J0401400
                          HDNG    FILEQ--CATCO DUP SWITCHES             J0401410
                    *************************************************** J0401420
                    *                                                 * J0401430
                    *             CATCO DUP SWITCHES                  * J0401440
                    *      WORDS USED FOR COMMUNICATION OF DATA       * J0401450
                    *   BETWEEN DUP ROUTINES.                         * J0401460
                    *                                                 * J0401470
                    *      INITIALIZED TO ZERO BY  .REST. OF DUPCO    * J0401480
                    *                                                 * J0401490
                    *************************************************** J0401500
                    CL1   EQU     *                                     J0401510
                    ASMSW BSS     1         NON ZERO IF DEFINE VOID ASM J0401520
                    BITSW BSS     1         NON ZERO TO ALLOW MDUMP-S   J0401530
                    BLKSW BSS     1         NON ZERO IF BYPASSING REC   J0401540
                    CIERR BSS     1         ERROR NO DETECTED BY PH 17  J0401550
                    CISW  BSS     1         NON ZERO IF STORE CI        J0401560
                    CLBSW BSS     1         NON ZERO IF PRECI EXECUTED  J0401570
                    CNTNO BSS     1         RECORD NO BEING PCHD OR RD  J0401580
                    *                                                 * J0401590
                    *   .DATSW. IS FILLED WITH THE CNT FIELD OF THE   * J0401600
                    *   DUP CONTROL RECORD.                           * J0401610
                    *   USED PRIMARILY FOR DATA MOVEMENT, BUT ALSO IS * J0401620
                    *   USED FOR COUNT OF RECORDS TO READ AFTER A     * J0401630
                    *   STORE CI DUP CONTROL RECORD.                  * J0401640
                    DATSW BSS     1         RECORDS VALUE IN CNT FIELD  J0401650
                    DBADR BSS     1         DB ADDR OF REFERENCED PROG  J0401660
                    DELSW BSS     1         ADDR OF REQ LET ENTRY - 1   J0401670
                    DFNSW BSS     1         NON ZERO IF DEFINE FXA      J0401680
                    DKSAD BSS     1         DK SCTR ADDR W/O DR CODE    J0401690
                    DUMPP BSS  E  2         LAST LIMITS FOR PRNTR DUMP  J0401700
                    FORSW BSS     1         NON ZERO IF DEFINE VOID FOR J0401710
                    FRWS  BSS     1         NON ZERO IF FROM FLD IS WS  J0401720
                    FXSW  BSS     1         NON ZERO IF FIXED AREA REQD J0401730
                    HOLSW BSS     1         NON ZERO IF NO CONV REQD    J0401740
                    IOSW  BSS     1         NON ZERO IF IN/OUT REQD     J0401750
                    *                                                 * J0401760
                    *   DUMPLET SWITCH - ZERO IF NOT DUMPLET/DUMPFLET * J0401770
                    *       PLUS VALUE REQUIRES PRINT OF BOTH LET/FLET* J0401780
                    *       NEG. VALUE REQUIRES PRINT OF FLET ONLY    * J0401790
                    LETSW BSS     1         NON ZERO,PRINT LET OR FLET* J0401800
                    LSTLF BSS     1         LAST LET/FLET SECT PROCESSD J0401810
                    MODSW BSS     1         NON ZERO IF STORE MOD FUNC  J0401820
                    NAMSW BSS     1         NON ZERO IF NAME IN LET/F   J0401830
                    NEGSW BSS     1         NON ZERO IF SHRINKING FXA   J0401840
                    PGMHL BSS     1         WORD COUNT OF THE PROG HDR  J0401850
                    PRSW  BSS     1         NON ZERO IF PRINTING OUTPUT J0401860
                    PTSW  BSS     1         NON ZERO IF PAPER TAPE REQD J0401870
                    SKWDS BSS     1         WDS TO SEARCH IN L/F SECT   J0401880
                    STCSW BSS     1         NON ZERO IF STORE DATA CI   J0401890
                    STSW  BSS     1         NON ZERO IF STORE TYPE      J0401900
                    TEMP1 BSS  E  1         1ST WD OF BINEB OUTPUT      J0401910
                    TEMP2 BSS     1         2ND WD OF BINEB OUTPUT      J0401920
                    TOWS  BSS     1         NON ZERO IF TO FIELD IS WS  J0401930
                    T3MSW BSS     1         TYPE 3,4 SOCAL LEVEL CELL   J0401940
                    UASW  BSS     1         NON ZERO IF USER AREA REQD  J0401950
                    WSSW  BSS     1         NON ZERO IF WORK STG REQD   J0401960
                    XEQSW BSS     1         NON ZERO IF NOT RET FR GET  J0401970
                    EBCSW BSS     1         NON ZERO IF EBC DATA OP 2E2 J0401980
                    HDNSW BSS     1         NON ZERO IF NAME IN HDR 2-3 J0401990
                    RPGSW BSS     1         NON Z IF DEFINE VOID RPG2-8 J0402000
                    DFLSW BSS     1         NON ZERO IF *DFILE      2-8 J0402010
                          BSS     1         RESERVED FOR ADDITION   2-8 J0402020
                    CL2   EQU     *-1                                   J0402030
                          HDNG    DEXIT-    CATCO DUP SWITCHES          J0402040
                    *************************************************** J0402050
                    *                                                 * J0402060
                    *             CATCO DUP SWITCHES                  * J0402070
                    *  INITIALIZED BY DCTL AND NOT RESET BY .REST.    * J0402080
                    *                                                 * J0402090
                    *************************************************** J0402100
                    IOREQ BSS     1         MON-ZERO,AUX I/O SET REQ    J0402110
                    PH2   BSS     1         NON-ZERO IF DCTL IN CORE    J0402120
                    PH3   BSS     1         NON-ZERO IF STORE IN CORE   J0402130
                    PH4   BSS     1         NON-ZERO IF DUMP IN CORE    J0402140
                    ************************************************2-8 J0402150
                    *                                               2-8 J0402160
                    *             CATCO SWITCH INITIALIZED TO ZERO  2-8 J0402170
                    *   BY CCAT SUBR AND SET BY MACRO UPDATE PROGRAM2-8 J0402180
                    *                                               2-8 J0402190
                    ************************************************2-8 J0402200
                    DUPCR BSS     1         NON ZERO IF DUP CTRL RCD2-8 J0402210
                    *************************************************** J0402220
                    *                                                 * J0402230
                    *             CATCO DUP SWITCHES SET BY CCAT SUBR * J0402240
                    *                                                 * J0402250
                    *************************************************** J0402260
                    ADDR2 BSS     1         KB INTERRUPT ADDRESS        J0402270
                    KBREQ BSS     1         CONTENTS OF LOC 13          J0402280
                    *      THE FOLLOWING SWITCH IS SET TO INDICATE THE  J0402290
                    *       PRINCIPAL INPUT DEVICE                      J0402300
                    *             -  IS PAPER TAPE                      J0402310
                    *             0  IS CARD                            J0402320
                    *             +  IS KEYBOARD                        J0402330
                    INOUT BSS     1         PRINCIPAL INPUT SWITCH      J0402340
                    *                                                   J0402350
                    PTPON BSS     1         NON-ZERO IF PAPER TP ON SYS J0402360
                    *************************************************** J0402370
                    *                                                 * J0402380
                    *             LEVEL 4 INTERRUPT BRANCH TABLE      * J0402390
                    *             ADDRESSES. INITIALIZED BY CCAT,     * J0402400
                    *             AND CARD/PAPER TAPE INTERFACES.     * J0402410
                    *                                                 * J0402420
                    *************************************************** J0402430
                          ORG     /0049                                 J0402440
                    IBT   BSS     9         9 WD INTRPT BRANCH TABLE    J0402450
                    *************************************************** J0402460
                    *                                                 * J0402470
                    *             CATCO I/O ADDRESSES REQUIRED BY DUP * J0402480
                    *                                                 * J0402490
                    *************************************************** J0402500
                    P1442 BSS  E  2         SYS 1442 IOAR HEADER        J0402510
                    PRPAR BSS     2         DEFAULT LIMITS TO PRINT     J0402520
                    PHDUP BSS     1         LAST DUP PHASE IN CORE      J0402530
                    CRBUF BSS     1         81 WD BFR FOR DUP CTRL RCDS J0402540
                    DCADR BSS     1         ADDR FOR DUP CTRL IOAR HDR  J0402550
                    HDBUF BSS     1         ADDR OF PAGE HEADING BFR    J0402560
                    IOBLK BSS     1         ADDR OF DUP I/O PHASE       J0402570
                    SDBUF BSS     1         STORE/DUMP BUFFER           J0402580
                    LETAR BSS     1         ADDR OF LET SEARCH BUFFER   J0402590
                    PEBUF BSS     1         41 WD BFR FOR PACKED EBCDIC J0402600
                    THIS  BSS     1         ADDR OF DOUBLE BFR, BFR 1   J0402610
                    NEXT  BSS     1         ADDR OF DOUBLE BFR, BFR 2   J0402620
                          HDNG              DUP CORE PARAMETERS         J0402630
                    DISKZ EQU     DZ000     DISKZ ENTRY POINT           J0402640
                    B     EQU     $ZEND-2                               J0402650
                    DMPLC EQU     B         IOAR CORE ADDR FOR DMPLT    J0402660
                    EXITC EQU     B         IOAR CORE ADDR FOR DEXIT    J0402670
                    MUPC  EQU     B         IOAR CORE ADDR FOR MUP  2-8 J0402680
                    DCTL  EQU     B+/1002   ENTRY ADDRESS OF DCTL       J0402690
                    DCTLC EQU     B+/1000   IOAR CORE ADDR FOR DCTL     J0402700
                    WSDC  EQU     B+/2000   IOAR CORE ADDR FOR STORE    J0402710
                    DUMPC EQU     B+/4000   IOAR CORE ADDR FOR DDUMP    J0402720
                    DUPCO EQU     /7DB0     ADDR OF RESIDENT DUPCO      J0402730
                    CATCO EQU     /7F20-2   ADDR OF DCOM IOAR HEADER    J0402740
                    *                                                 * J0402750
                    *  DUPCO ENTRY POINTS...USED WITH INDIRECT BSI    * J0402760
                    *                                                 * J0402770
                          ORG     DUPCO                                 J0402780
                    BINEB BSS     1         CONVERSION BINARY TO EBCDIC J0402790
                    WRTDC BSS     1         WRITE DCOM(S) SUBROUTINE    J0402800
                    ENTER BSS     1         SAVE XR-S AND CONDITIONS    J0402810
                    GET   BSS     1         READ FROM DISK USING DISKZ  J0402820
                    LEAVE BSS     1         HANDLES ALL EXITS FROM DUP  J0402830
                    LINE  BSS     1         SPACES PRINTER 1 LINE       J0402840
                    MASK  BSS     1         INHIBITS KB INT REQUEST     J0402850
                    MDUMP BSS     1         PRINTS SELECTED CORE LOC-S  J0402860
                    PAGE  BSS     1         SKIPS TO NEXT PAGE          J0402870
                    PHID  BSS     1         RECORDS PHASE ID            J0402880
                    PHIDM BSS     1         RECORDS PHASE AND MODIFIER  J0402890
                    PRINT BSS     1         USE SYS PR SUBR TO PRINT    J0402900
                    PUT   BSS     1         WRITES TO DISK USING DISKZ  J0402910
                    REST  BSS     1         RESTORE CATCO,GO TO DCTL    J0402920
                    RTURN BSS     1         RESTORE XR-S AND CONDITIONS J0402930
                    *                                                 * J0402940
                    *  INPUT/OUTPUT PARAMETERS , CORE ADDRESSES       * J0402950
                    *                                                 * J0402960
                    BUF6  EQU     DUPCO-/1F ADDR OF PAGE HEADING BUFFER J0402970
                    PRPNT EQU     BUF6-/141  IOAR ADDR FOR PRINC.PTR    J0402980
                    IOADR EQU     BUF6-/38B  START OF I/O INTERFACE     J0402990
                    GETHO EQU     IOADR+4   ENTRY FOR READING HOLL TYPE J0403000
                    GETBI EQU     IOADR+5   ENTRY FOR READING BINARY    J0403010
                    PACKB EQU     IOADR+6   ENTRY TO PACK BINARY        J0403020
                    PCHBI EQU     IOADR+7   ENTRY TO PUNCH BINARY       J0403030
                    BUF1  EQU     IOADR-/51 ADDR OF NEXT BUFFER         J0403040
                    BUF2  EQU     BUF1-/52  ADDR OF THIS BUFFER         J0403050
                    BUF3  EQU     BUF2-/3E  ADDR OF PACKED EBC BUFFER   J0403060
                    BUF4  EQU     BUF3-/52  ADDR OF CONTROL RCD BUFFER  J0403070
                    BUF5  EQU     IOADR-/284    ADDR OF LET SCTR BFR    J0403080
                    BUF7  EQU     BUF5-/7142   ADDR OF STORE/DUMP BFR   J0403090
                          HDNG    FILEQ--PROLOGUE                       J0403100
                    *************************************************** J0403110
                    *                                                 * J0403120
                    *STATUS - VERSION 2, MODIFICATION 11              * J0403130
                    *                                                 * J0403140
                    *FUNCTION/OPERATION-                              * J0403150
                    *    *READ AND PROCESS SUPERVISOR CONTROL RECORDS * J0403160
                    *     AS FOLLOWS-                                 * J0403170
                    *    *LOCAL  CONVERT EACH MAINLINE AND SUBROUTINE * J0403180
                    *            NAME TO NAMECODE AND STORE TO THE    * J0403190
                    *            SCRA.                                * J0403200
                    *    *NOCAL  CONVERT EACH MAINLINE AND SUBROUTINE * J0403210
                    *            NAME TO NAMECODE AND STORE TO THE    * J0403220
                    *            SCRA.                                * J0403230
                    *    *FILES  CONVERT EACH FILE NAME TO NAMECODE   * J0403240
                    *            AND EACH FILE NUMBER AND CARTRIDGE ID* J0403250
                    *            TO BINARY AND STORE TO THE SCRA.     * J0403260
                    *                                                 * J0403270
                    *ENTRY POINTS-                                    * J0403280
                    *    *LF000  ENTERED BY THE *STORECI CONTROL RCD  * J0403290
                    *            PROCESSOR WHEN THE *STORECI RECORD   * J0403300
                    *            INDICATES IT IS FOLLOWED BY          * J0403310
                    *            SUPERVISOR CONTROL RECORDS.          * J0403320
                    *                                                 * J0403330
                    *INPUT-                                           * J0403340
                    *    *SUPERVISOR CONTROL RECORDS FROM THE         * J0403350
                    *     PRINCIPAL INPUT DEVICE.                     * J0403360
                    *                                                 * J0403370
                    *OUTPUT-                                          * J0403380
                    *    *EACH SUPERVISOR CONTROL RECORD IS PRINTED   * J0403390
                    *     TO THE PRINCIPAL PRINT DEVICE.              * J0403400
                    *    *THE SUPERVISOR CONTROL RECORD AREA (SCRA).  * J0403410
                    *    *THE FOLLOWING ARE STORED IN DCOM-           * J0403420
                    *     #FCNT                                       * J0403430
                    *     #LCNT                                       * J0403440
                    *     #NCNT                                       * J0403450
                    *                                                 * J0403460
                    *EXTERNAL SUBROUTINES-                            * J0403470
                    *    *DZ000  SUBROUTINE TO PERFORM DISK I/O.      * J0403480
                    *                                                 * J0403490
                    *EXTERNAL REFERENCES-                             * J0403500
                    *     NOCRD                                       * J0403510
                    *     SBADR                                       * J0403520
                    *     $CH12                                       * J0403530
                    *     $DBSY                                       * J0403540
                    *     $PBSY                                       * J0403550
                    *     $IBSY                                       * J0403560
                    *     #SCRA                                       * J0403570
                    *                                                 * J0403580
                    *EXITS- NORMAL                                    * J0403590
                    *    *AN EXIT IS MADE TO THE *STORECI CONTROL RCD * J0403600
                    *     PROCESSOR UPON SUCESSFUL COMPLETION OF      * J0403610
                    *     PROCESSING SUPERVISOR CONTROL RECORDS.      * J0403620
                    *                                                 * J0403630
                    *EXITS- ERROR                                     * J0403640
                    *    *A CALL $EXIT RESTORES THE MONITOR CONTROL   * J0403650
                    *     RECORD ANALYZER AFTER PRINTING ONE OF THE   * J0403660
                    *     FOLLOWING ERROR MESSAGES-                   * J0403670
                    *     D 41  INVALID STORECI CONTROL RECORD        * J0403680
                    *     D 42  STORECI CONTROL RECORDS INCORRECTLY   * J0403690
                    *           ORDERED.                              * J0403700
                    *     D 43  INCORRECT CONTINUATION.               * J0403710
                    *     D 44  ILLEGAL CHARACTER IN RECORD.          * J0403720
                    *     D 45  ILLEGAL FILE NUMBER.                  * J0403730
                    *     D 46  ILLEGAL NAME.                         * J0403740
                    *     D 47  ILLEGAL CARTRIDGE ID.                 * J0403750
                    *     D 48  SCRA BUFFER OVERFLOW.                 * J0403760
                    *                                                 * J0403770
                    *TABLES AND WORK AREAS-                           * J0403780
                    *    *SCRAB  A 640 WORD BUFFER TO BE STORED TO THE* J0403790
                    *            SCRA.                                * J0403800
                    *    *PBUFR  A 40 WORD BUFFER FOR A PACKED        * J0403810
                    *            SUPERVISOR CONTROL RECORD.           * J0403820
                    *                                                 * J0403830
                    *ATTRIBUTES- NONE                                 * J0403840
                    *                                                 * J0403850
                    *NOTES- NONE                                      * J0403860
                    *                                                 * J0403870
                    *************************************************** J0403880
                          HDNG    FILEQ--PROCESS SUP CONTROL RECORDS    J0403890
                    *                                                   J0403900
                    *     EXTERNAL EQUATE STATEMENTS                    J0403910
                    *                                                   J0403920
                    NORCD EQU     DATSW     NO. OF SUPV CONTROL RECORDS J0403930
                    SBUFR EQU     BUF4+1    SUPERVISOR BUFFER           J0403940
                    PBUFR EQU     BUF3+1    FILEQ PRINTER BUFFER        J0403950
                    SCRAB EQU     BUF7+2    SCRA DISK BUFFER            J0403960
                          HDNG    FILEQ--PROCESS SUP CONTROL RECORDS    J0403970
                    *                                                   J0403980
                    *     PROCESS SUPERVISOR CONTROL RECORDS            J0403990
                    *                                                   J0404000
                          ORG     B                                     J0404010
                          DC      *-*       WORD COUNT OF FILEQ         J0404020
                          DC      4         PHASE ID OF FILEQ           J0404030
                    *                                                   J0404040
                    *     INITIALIZE                                    J0404050
                    *                                                   J0404060
                    LF000 BSI  I  PHID      RECORD PHASE ID             J0404070
                          DC      /0004     FILEQ PHASE IDENTIFICATION  J0404080
                          SRA     16        SET TYPE                    J0404090
                          STO     TYPE2     *OF LAST RECORD ZERO        J0404100
                          LD    1 #SCRA     SET                         J0404110
                          STO     ASCRA     *THE SECTOR ADDRESSES       J0404120
                          A       LF903     *OF THE                     J0404130
                          STO     ASCRA+1   *LOCAL,                     J0404140
                          A       LF903     *NOCAL AND                  J0404150
                          STO     ASCRA+2   *FILES AREAS OF THE SCRA    J0404160
                          A       LF903     SET SCTR ADDR OF G2250  2G2 J0404170
                          STO     ASCRA+3   *AREA OF SCRA           2G2 J0404180
                          SLA     16                                2-2 J0404190
                          STO  I  LF900     RESET LOCAL,            2-2 J0404200
                          STO  I  LF900+1   *     NOCAL,            2-2 J0404210
                          STO  I  LF900+2   *     FILES INDICATOR   2-2 J0404220
                          STO  I  LF900+3   G2250 INDICATOR         2G2 J0404230
                    *                       SET BFR WD CNT LATER    2-4 J0404240
                    *                                                   J0404250
                    *     READ AND PRINT A RECORD                       J0404260
                    *                                                   J0404270
                    LF120 BSI  L  RR000                                 J0404280
                    *                                                   J0404290
                    *     DETERMINE TYPE OF SUPERVISOR CONTROL RECORD   J0404300
                    *                                                   J0404310
                    LF130 BSI  L  DT000                                 J0404320
                    *                                                   J0404330
                          LD      TYPE1     IF THIS RECORD OF SAME TYPE J0404340
                          S       TYPE2     *AS LAST RECORD BRANCH TO   J0404350
                          BSC  I3 LF902-1,+- *PROCESS THE RECORD        J0404360
                    *                                                   J0404370
                          BSI  L  WR000     BRANCH TO WRITE THE SCRA    J0404380
                    *                                                   J0404390
                          LD   I3 LF900-1   FETCH INDICATOR             J0404400
                          BSC  L  LF240,Z   BRANCH IF INDICATOR ON      J0404410
                    *                                                   J0404420
                          LD      LF903     FETCH NON-ZERO              J0404430
                          STO  I3 LF900-1   SET INDICATOR ON            J0404440
                          LD      TYPE1     SET TYPE OF                 J0404450
                          STO     TYPE2     *LAST RECORD                J0404460
                          LD   L3 ASCRA-1   FETCH THE SECTOR ADDRESS    J0404470
                          SRT     16        *AND SHIFT TO EXT       2-4 J0404480
                          LD   L3 LF905-1   FETCH THE WD CNT        2-4 J0404490
                          STD  L  SCRAB-2   STORE TO THE I/O AREA   2-4 J0404500
                          BSC  I3 LF902-1   BRANCH TO PROCESS RECORD    J0404510
                    *                                                   J0404520
                    *     PREPARE TO READ NEXT SUPV CTRL RECORD         J0404530
                    *                                                   J0404540
                    LF140 LD      WDCNT     INCREMENT                   J0404550
                          STO  L  LWDCT     SAVE ADDR OF LAST WORD CNT  J0404560
                          A    I  WDCNT     *ADDRESS                    J0404570
                          STO     WDCNT     *OF WORD COUNT              J0404580
                          MDX  L  BFCNT,1   INCREMENT BUFFER COUNT      J0404590
                          NOP                                           J0404600
                          MDX     LF120     BRANCH TO READ NEXT RECORD  J0404610
                    *                                                   J0404620
                    *     CLEAR THE SECTORS OF TYPES NOT SPECIFIED      J0404630
                    *                                                   J0404640
                    LF200 LDX   3 -4        TYPE COUNT TO XR3       2G2 J0404650
                          LD   I3 LF900+4   FETCH INDICATOR         2G2 J0404660
                          BSC  L  LF220,Z   BRANCH IF INDICATOR SET     J0404670
                          LD   L3 ASCRA+4   SET SECTOR ADDRESS      2G2 J0404680
                          SRT     16        SHIFT TO THE EXT        2-4 J0404690
                          LD   L3 LF905+4   FETCH THE WD CNT        2-4 J0404700
                          STD  L  SCRAB-2   STORE TO THE I/O AREA   2-4 J0404710
                          BSI  L  WR000     BRANCH TO CLEAR DISK        J0404720
                    LF220 MDX   3 1         INCR TYPE CNT, SKIP IF ZERO J0404730
                          MDX     LF200+1   BRANCH TO TEST NEXT TYPE    J0404740
                    *                                                   J0404750
                          LDX  L3 DCTLC     XR3 IS SET TO DCTL IOAR HDR J0404760
                          LDD   1 DCHDR                                 J0404770
                          STD   3 0         SET-UP DCTL IOAR HEADER     J0404780
                    *                                                 * J0404790
                          STO   1 XEQSW     SET XEQ SW TO XEQ DCTL      J0404800
                          BSI  I  GET       GET AND EXECUTE DCTL        J0404810
                    *                                                   J0404820
                    LF240 LDX   2 2         POINT TO ERROR MESSAGE      J0404830
                    *                                                   J0404840
                    *     PRINT THE ERROR MESSAGE                       J0404850
                    *                                                   J0404860
                    LFERR MDX   2 +40                                   J0404870
                    LF255 STX   2 LF250     SET-UP DUP ERROR NO.        J0404880
                          BSI  I  LEAVE     PRINT ERROR MESSAGE         J0404890
                    LF250 DC      *-*       ERROR MESSAGE NO.           J0404900
                    *                                                   J0404910
                    *     CONSTANTS AND WORK AREA                       J0404920
                    *                                                   J0404930
                          BSS  E  0                                     J0404940
                    LF900 DC      #LCNT+C   ADDRESS OF LOCAL INDICATOR  J0404950
                          DC      #NCNT+C   ADDRESS OF NOCAL INDICATOR  J0404960
                          DC      #FCNT+C   ADDRESS OF FILES INDICATOR  J0404970
                          DC      #GCNT+C                           2G2 J0404980
                    LF901 DC      /7001     PRINT FUNCTION CODE         J0404990
                    LF902 DC      LC000     LOCAL-NOCAL PROCESSING ADDR J0405000
                          DC      LC000     LOCAL-NOCAL PROCESSING ADDR J0405010
                          DC      FR000     FILES PROCESSING ADDRESS    J0405020
                          DC      GR000     G2250 PROCESSING ADDR   2G2 J0405030
                    LF903 DC      2         CONSTANT TWO                J0405040
                    LF905 DC      640       LOCAL BFR WD CNT        2-4 J0405050
                          DC      640       NOCAL BFR WD CNT        2-4 J0405060
                          DC      640       FILES BFR WD CNT        2-4 J0405070
                          DC      320       G2250 BFR WD CNT        2-4 J0405080
                    TYPE1 DC      *-*       TYPE CODE OF THIS RECORD    J0405090
                    TYPE2 DC      *-*       TYPE CODE OF LAST RECORD    J0405100
                    *                          0 = NONE                 J0405110
                    *                          1 = LOCAL                J0405120
                    *                          2 = NOCAL                J0405130
                    *                          3 = FILES                J0405140
                    *                          4 = G2250            2G2 J0405150
                    ASCRA DC      *-*       SCTR ADDR OF LOCAL SCRA     J0405160
                          DC      *-*       SCTR ADDR OF NOCAL SCRA     J0405170
                          DC      *-*       SCTR ADDR OF FILES SCRA     J0405180
                          DC      *-*       SCTR ADDR OF G2250 SCRA 2G2 J0405190
                    WDCNT DC      *-*       ADDRESS OF WORD COUNT       J0405200
                    COLSW DC      *-*       COLUMN SWITCH-              J0405210
                    *                          - = BLANK ENDED NAME     J0405220
                    *                          0 = FIRST COLUMN BLANK   J0405230
                    *                          1 = COMMA ENDED NAME     J0405240
                    *                          2 = RT PAREN ENDED NAME  J0405250
                          HDNG    FILEQ--PROCESS LOCAL/NOCAL RECORDS    J0405260
                    *                                                   J0405270
                    *     PROCESS LOCAL AND NOCAL RECORDS               J0405280
                    *                                                   J0405290
                    LC000 LD      LC900     INITIALIZE THE WORD         J0405300
                          STO  I  WDCNT     *COUNT TO ONE               J0405310
                    *                                                   J0405320
                    *     INSPECT THE CONTENTS OF COLUMN 7              J0405330
                    *                                                   J0405340
                          LDX   3 -74       POINT XR3 TO COLUMN 7       J0405350
                          LD   L3 SBUFR+80  FETCH COLUMN 7              J0405360
                          S       LC901     TEST FOR AND                J0405370
                          BSC  L  LC020,Z   *BRANCH IF NOT A COMMA      J0405380
                    *                                                   J0405390
                    *     MAINLINE NAME NOT GIVEN                       J0405400
                    *                                                   J0405410
                          LD    1 HDNSW     NAME IN PROGRAM HEADER  2-3 J0405420
                          BSC  L  LC040,Z   BR TO ERR D 41 IF YES   2-3 J0405430
                    *                                               2-3 J0405440
                          SLT     32        SET MAINLINE                J0405450
                          STD  L  NAMEX     *NAME BLANK                 J0405460
                          LDD     LC900     SET EXT SW TO STORE 2 WORDS J0405470
                          BSI  L  FB000     BR TO STORE NAME TO BUFFER  J0405480
                    LC010 MDX   3 1         INCREMENT THE COLUMN COUNT  J0405490
                          BSI  L  FN000     BRANCH TO FETCH THE NAME    J0405500
                          LD   L  COLSW                                 J0405510
                          BSC  L  LC060,+-  D 44 ERROR IF NO NAME       J0405520
                          MDX     LC080     BRANCH TO STORE NAME        J0405530
                    *                                               2-3 J0405540
                    *     MAINLINE NAME GIVEN                       2-3 J0405550
                    *                                               2-3 J0405560
                    LC020 LD    1 HDNSW     NAME IN PROGRAM HEADER  2-3 J0405570
                          BSC  L  LC040,+-  BR TO ERR D 41 IF NO    2-3 J0405580
                          BSI  L  FN000     BR TO FETCH MAIN NAME   2-3 J0405590
                          LD   L  COLSW                             2-3 J0405600
                          BSC  L  LC060,+-  D 44 ERROR IF BLANK     2-3 J0405610
                    *                                               2-3 J0405620
                          LDD   1 #NAME     NAME SPECIFIED          2-3 J0405630
                          SD   L  NAMEX     NAME ON LOCAL/NOCAL RCD 2-3 J0405640
                          BSC  L  LC040,Z   D 41 ERR IF NOT SAME    2-3 J0405650
                          RTE     16        CHECK SECOND HALF       2-3 J0405660
                          BSC  L  LC040,Z   D 41 ERR IF NOT SAME    2-3 J0405670
                    *                                               2-3 J0405680
                          LDD     LC900     SET EXT TO STORE 2 WDS  2-3 J0405690
                          BSI  L  FB000     BR TO STORE NAME TO BFR 2-3 J0405700
                    *                                               2-3 J0405710
                          LD   L  COLSW     CHECK FOR COMMA         2-3 J0405720
                          BSC  L  LC060,+   D 44 ERROR IF BLANK     2-3 J0405730
                          S       LC900     ONE INDICATES COMMA     2-3 J0405740
                          BSC  L  LC060,Z   D 44 ERROR IF NOT COMMA 2-3 J0405750
                    *                                               2-3 J0405760
                          MDX     LC010     BRANCH TO CONTINUE      2-3 J0405770
                    *                                               2-3 J0405780
                    *     INVALID STORECI CONTROL RECORD            2-3 J0405790
                    *                                               2-3 J0405800
                    LC040 LDX   2 1         MAINLINE NAME NOT ALLOWED   J0405810
                          BSC  L  LFERR     *WITH STORECI. D 41 ERROR   J0405820
                    *                                                   J0405830
                    *     FIRST CHARACTER OF NAME BLANK                 J0405840
                    *                                                   J0405850
                    LC060 LDX   2 4         POINT TO ERROR MESSAGE      J0405860
                          BSC  L  LFERR     BRANCH TO PRINT THE MESSAGE J0405870
                    *                                                   J0405880
                    *     STORE THE NAME TO THE SCRA I/O BUFFER         J0405890
                    *                                                   J0405900
                    LC080 LDD     LC900     SET EXT SW TO STORE 2 WORDS J0405910
                          BSI  L  FB000     BRANCH TO STORE THE NAME    J0405920
                    *                                                   J0405930
                          LD   L  COLSW     FETCH THE COLUMN SWITCH     J0405940
                          BSC  L  LF140,+   BRANCH IF NEXT COLUMN BLANK J0405950
                          MDX   3 1         INCR COL CNT, SKIP IF ZERO  J0405960
                          MDX     LC160                                 J0405970
                    *                                                   J0405980
                    *     RECORD IS CONTINUED, READ CONTINUATION RECORD J0405990
                    *                                                   J0406000
                    LC120 BSI  L  RR000     BRANCH TO READ A RECORD     J0406010
                          BSI  L  DT000     BR TO DETERMINE TYPE OF RCD J0406020
                          LDX   3 -74       POINT XR3 TO COLUMN 7       J0406030
                          LD   L  TYPE1     IF THIS RECORD OF SAME TYPE J0406040
                          S    L  TYPE2     *AS LAST RECORD BRANCH      J0406050
                          BSC  L  LC160,+-  *TO PROCESS THE RECORD      J0406060
                    *                                                   J0406070
                    *     THE RECORD JUST READ WAS NOT A CONTINUATION   J0406080
                    *                                                   J0406090
                    LC140 LDX   2 3         POINT TO ERROR MESSAGE      J0406100
                          BSC  L  LFERR     BRANCH TO PRINT THE MESSAGE J0406110
                    *                                                   J0406120
                    *     TEST FOR END OF RECORD                        J0406130
                    *                                                   J0406140
                    LC160 LD   L3 SBUFR+80  FETCH THE NEXT CHARACTER    J0406150
                          S       LC902     TEST FOR AND                J0406160
                          BSC  L  LC120,+-  *BRANCH IF BLANK            J0406170
                    *                                                   J0406180
                    *     FETCH A SUBROUTINE NAME                       J0406190
                    *                                                   J0406200
                    LC180 BSI  L  FN000     BRANCH TO FETCH A NAME      J0406210
                          MDX  L  COLSW,0   SKIP NEXT IF COL SW ZERO    J0406220
                          MDX     LC080     BRANCH TO STORE THE NAME    J0406230
                          MDX     LC060     BR TO PRINT ERROR MESSAGE   J0406240
                    *                                                   J0406250
                    *     CONSTANTS AND WORK AREA                       J0406260
                    *                                                   J0406270
                    LC900 DC      1         CONSTANT ONE                J0406280
                    LC901 DC      /006B     EBCDIC COMMA                J0406290
                    LC902 DC      /0040     EBCDIC BLANK                J0406300
                          HDNG    FILEQ--PROCESS FILES RECORDS          J0406310
                    *                                                   J0406320
                    *     PROCESS FILES RECORDS                         J0406330
                    *                                                   J0406340
                    FR000 LD      FR900     INITIALIZE THE WORD         J0406350
                          STO  I  WDCNT     *COUNT TO 1             2-9 J0406355
                    *                                               2-8 J0406360
                    * TEST FOR LEFT PARENTHESIS BEFORE FILE NUMBER  2-8 J0406370
                    *                                               2-8 J0406380
                    FR010 LDX   3 -74       POINT XR3 TO COLUMN 7   2-8 J0406390
                    FR012 LD   L3 SBUFR+80  FETCH CHAR              2-8 J0406400
                          S       FR903     TEST FOR LEFT PAREN     2-8 J0406410
                          MDX   3 1         INCR COL COUNT          2-8 J0406420
                          MDX     FR015     CONTINUE IF NOT ZERO    2-8 J0406430
                          LDX   2 3         POINT TO ERROR MSG      2-8 J0406440
                    FR070 BSC  L  LFERR     PRINT ERROR MSG AND EXIT2-8 J0406450
                    FR015 BSC  L  FR020,+-  BR IF LEFT PAREN        2-8 J0406460
                    *     CODING                                    2-9 J0406470
                    *        REMOVED                                2-9 J0406480
                          LDX   2 1         POINT TO ERROR MSG      2-8 J0406490
                          MDX     FR070     BR TO PRINT ERROR MSG   2-8 J0406500
                    *                                                   J0406510
                    *     FETCH AND STORE FILE NUMBER (DECIMAL)         J0406520
                    *                                                   J0406530
                    FR020 BSI  L  FR100     BR TO FETCH AND CONVERT NO. J0406540
                          SLT     32        SET EXT SW TO STORE 1 WORD  J0406550
                          BSI  L  FB000     BR TO STORE NO. TO I/O BUFR J0406560
                    *                                                   J0406570
                    *     FETCH AND STORE FILE NAME                     J0406580
                    *                                                   J0406590
                          LD   L3 SBUFR+80  FETCH THE NEXT COLUMN       J0406600
                          S       FR902     TEST FOR AND                J0406610
                          BSC  L  FR030,Z   *BRANCH IF NOT A COMMA      J0406620
                          SLT     32        SET FILE NAME               J0406630
                          STD  L  NAMEX     *BLANK                      J0406640
                          LDD     FR900     SET EXT SW TO STORE 2 WORDS J0406650
                          BSI  L  FB000     BRANCH TO STORE FILE NAME   J0406660
                          MDX     FR040     BRANCH TO FETCH CART ID     J0406670
                    *                                                   J0406680
                    FR030 BSI  L  FN000     BR TO FETCH + CONVERT NAME  J0406690
                          LD   L  COLSW     FETCH THE COLUMN SWITCH     J0406700
                          BSC  L  LC060,+   BRANCH IF BLANK FORE OR AFT J0406710
                          SRT     16        SET EXT SW TO STORE 2 WORDS J0406720
                          BSI  L  FB000     BRANCH TO STORE FILE NAME   J0406730
                    *                                                   J0406740
                    *     TEST FOR THE PRESENCE OF CARTRIDGE ID         J0406750
                    *                                                   J0406760
                          LD   L  COLSW     FETCH THE COLUMN SWITCH     J0406770
                          S       FR900     TEST FOR AND BRANCH         J0406780
                          BSC  L  FR040,+   *IF NOT A RIGHT PARENTHESIS J0406790
                          SLT     32        SET                         J0406800
                          STD  L  NAMEX     *CARTRIDGE ID BLANK         J0406810
                          MDX     FR060     BRANCH TO STORE CART ID     J0406820
                    *                                                   J0406830
                    *     FETCH AND STORE CARTRIDGE ID (HEXADECIMAL)    J0406840
                    *                                                   J0406850
                    FR040 BSI  L  FR200     BRANCH TO FETCH CART ID     J0406860
                          SLT     32        SET EXT SW TO STORE 1 WORD  J0406870
                    FR060 BSI  L  FB000     BRANCH TO STORE CART ID     J0406880
                    *                                                   J0406890
                    *     TEST FOR END OF RECORD                        J0406900
                    *                                                   J0406910
                          MDX   3 1         INCR COL CNT, SKIP IF ZERO  J0406920
                          MDX     *+2                                   J0406930
                          BSC  L  FR080     BRANCH TO READ NEXT RECORD  J0406940
                          LD   L3 SBUFR+80  FETCH THE NEXT CHARACTER    J0406950
                          S       FR901     TEST FOR AND                J0406960
                          BSC  L  FR080,+-  *BRANCH IF BLANK            J0406970
                          MDX   3 1         INCR COL CNT, SKIP IF ZERO  J0406980
                          MDX     *+1                                   J0406990
                          MDX     FR080     BR TO READ CONTINUATION RCD J0407000
                          LD   L3 SBUFR+80  FETCH THE NEXT CHARACTER    J0407010
                          S       FR901     TEST FOR AND                J0407020
                          BSC  L  FR080,+-  *BRANCH IF BLANK            J0407030
                    *     INSTRUCTION REMOVED                       2-9 J0407040
                          MDX     FR012                             2-8 J0407050
                    *                                                   J0407060
                    *     RECORD IS CONTINUED, READ CONTINUATION RECORD J0407070
                    *                                                   J0407080
                    FR080 BSI  L  RR000     BRANCH TO READ A RECORD     J0407090
                          BSI  L  DT000     BR TO DETERMINE TYPE OF RCD J0407100
                    *     INSTRUCTION REMOVED                       2-9 J0407110
                          LD   L  TYPE1     IF THIS RECORD OF SAME TYPE J0407120
                          S    L  TYPE2     *AS LAST RECORD BRANCH      J0407130
                          BSC  L  LF130,Z   BR TO PROCESS NEW RCD   2-8 J0407140
                          MDX     FR010     BR TO PROCESS CONT RCD  2-8 J0407150
                    *                                                   J0407160
                    *     CONSTANTS AND WORK AREA                       J0407170
                    *                                                   J0407180
                    FR900 DC      1         CONSTANT ONE                J0407190
                    FR901 DC      /0040     EBCDIC BLANK                J0407200
                    FR902 DC      /006B     EBCDIC COMMA                J0407210
                    FR903 DC      /004D     EBCDIC LEFT PARENTHESIS 2-8 J0407220
                    FR904 DC      /001F     PER CENT SIGN-LEFT PAREN2-8 J0407230
                          HDNG    FILEQ--GET FILE NUMBER                J0407240
                    *                                                   J0407250
                    *     FETCH AND CONVERT FILE NUMBER                 J0407260
                    *                                                   J0407270
                    FR100 DC      *-*       ENTRY/RETURN ADDRESS        J0407280
                    *                                                   J0407290
                          LD   L3 SBUFR+80  FETCH FIRST CHARACTER       J0407300
                          S       FR910     MASK AND                    J0407310
                          BSC  L  FR170,Z+  *BRANCH IF NOT NUMERIC      J0407320
                          STO  L  NAMEX     INITIALIZE SUM              J0407330
                    *                                                   J0407340
                          LDX   2 -5        CHARACTER COUNT TO XR2      J0407350
                    *                                                   J0407360
                    FR120 MDX   3 1         INCR COL CNT, SKIP IF ZERO  J0407370
                          MDX     FR160                                 J0407380
                    *                                                   J0407390
                    FR140 LDX   2 3         POINT TO ERROR MESSAGE      J0407400
                          BSC  L  LFERR     BRANCH TO PRINT THE MESSAGE J0407410
                    *                                                   J0407420
                    FR160 LD   L3 SBUFR+80  FETCH THE NEXT CHARACTER    J0407430
                          S       FR911     TEST FOR AND                J0407440
                          BSC  L  FR190,+-  *BRANCH IF A COMMA          J0407450
                    *                                                   J0407460
                          MDX   2 1         INCR CHAR CNT, SKIP IF ZERO J0407470
                          MDX     FR180     BRANCH TO FETCH NEXT CHAR   J0407480
                    *                                                   J0407490
                    FR170 LDX   2 5         POINT TO ERROR MESSAGE      J0407500
                          BSC  L  LFERR     BRANCH TO PRINT THE MESSAGE J0407510
                    *                                                   J0407520
                    FR180 LD   L3 SBUFR+80  FETCH THE CHARACTER AGAIN   J0407530
                          S       FR910     MASK AND                    J0407540
                          BSC  L  FR170,Z+  *BRANCH IF NOT NUMERIC      J0407550
                          STO     FR913     SAVE THE NUMBER             J0407560
                          LD   L  NAMEX     FETCH THE SUM               J0407570
                          M       FR912     MULTIPLY BY TEN             J0407580
                          SLT     16        SHIFT PRODUCT TO ACC        J0407590
                          A       FR913     ADD THE NUMBER              J0407600
                          STO  L  NAMEX     SAVE THE NEW SUM            J0407610
                          MDX     FR120                                 J0407620
                    *                                                   J0407630
                    FR190 MDX   3 1         POINT TO COLUMN AFTER COMMA J0407640
                          MDX     *+1       SKIP                        J0407650
                          MDX     FR140     BRANCH IF RECORD OVER-RUN   J0407660
                    *                                                   J0407670
                          BSC  I  FR100     RETURN                      J0407680
                    *                                                   J0407690
                    *     CONSTANTS AND WORK AREA                       J0407700
                    *                                                   J0407710
                    FR910 DC      /00F0     NUMERIC MASK                J0407720
                    FR911 DC      /006B     EBCDIC COMMA                J0407730
                    FR912 DC      10        CONSTANT TEN                J0407740
                    FR913 DC      *-*       TEMPORARY STORAGE           J0407750
                          HDNG    FILEQ--GET CARTRIDGE ID               J0407760
                    *                                                   J0407770
                    *     FETCH AND CONVERT CARTRIDGE ID                J0407780
                    *                                                   J0407790
                    FR200 DC      *-*       ENTRY/RETURN ADDRESS        J0407800
                    *                                                   J0407810
                          SLA     16        INITAILIZE                  J0407820
                          STO  L  NAMEX     *THE CARTRIDGE ID           J0407830
                          LDX   2 -5        CHARACTER COUNT TO XR2      J0407840
                    *                                                   J0407850
                    FR210 MDX   3 1         INCR COL CNT, SKIP IF ZERO  J0407860
                          MDX     FR230                                 J0407870
                    *                                                   J0407880
                    FR220 LDX   2 3         POINT TO ERROR MESSAGE      J0407890
                          BSC  L  LFERR     BRANCH TO PRINT THE MESSAGE J0407900
                    *                                                   J0407910
                    FR230 LD   L3 SBUFR+80  FETCH A CHARACTER           J0407920
                          S       FR920     TEST FOR AND BRANCH         J0407930
                          BSC  L  FR270,+-  *IF A RIGHT PARENTHESIS     J0407940
                    *                                                   J0407950
                          MDX   2 1         INCR CHAR CNT, SKIP IF ZERO J0407960
                          MDX     FR250                                 J0407970
                    *                                                   J0407980
                    FR240 LDX   2 7         POINT TO ERROR MESSAGE      J0407990
                          BSC  L  LFERR     BRANCH TO PRINT THE MESSAGE J0408000
                    *                                                   J0408010
                    FR250 LD   L3 SBUFR+80  FETCH THE CHARACTER AGAIN   J0408020
                          S       FR921     TEST FOR AND                J0408030
                          BSC  L  FR260,-   *BRANCH IF NUMERIC          J0408040
                          A       FR925                            2-10 J0408050
                          BSC  L  FR240,-Z  ERROR IF ABOVE F       2-10 J0408060
                          A       FR926                            2-10 J0408070
                          BSC  L  FR240,+   ERROR IF BELOW A       2-10 J0408080
                          A       FR922     CONVERT TO ALPHABETIC  2-10 J0408090
                    FR260 SRT     4         SAVE DIGIT IN EXT      2-10 J0408100
                          LD   L  NAMEX     GET PREVIOUS           2-10 J0408110
                          SLT     4         MULT BY 16, ADD NEW    2-10 J0408120
                          STO  L  NAMEX     SAVE NEW SUM                J0408160
                          MDX     FR210     BR TO FETCH NEXT CHARACTER  J0408170
                    *                                                   J0408180
                    FR270 LD   L  NAMEX     FETCH THE CARTRIDGE ID      J0408190
                          BSC  L  FR240,Z+  BRANCH IF NEGATIVE          J0408200
                    *                                                   J0408210
                          BSC  I  FR200     RETURN                      J0408220
                    *                                                   J0408230
                    *     CONSTANTS AND WORK AREA                       J0408240
                    *                                                   J0408250
                    FR920 DC      /005D     EBCDIC RIGHT PARENTHESIS    J0408260
                    FR921 DC      /00F0     NUMERIC MASK                J0408270
                    FR922 DC      /0009     ALPHABETIC MASK             J0408280
                    FR925 DC      /F0-/C6   RANGE TO EBCDIC F      2-10 J0408290
                    FR924 DC      *-*       TEMPORARY STORAGE           J0408300
                    FR926 DC      /C6-/C1+1  RANGE FROM A TO F +1  2-11 J0408305
                          HDNG    FILEQ--PROCESS G2250 RECORDS          J0408310
                    *                                               2G2 J0408320
                    *  PROCESS G2250 RECORDS                        2G2 J0408330
                    *                                               2G2 J0408340
                    *                                               2G2 J0408350
                    GR000 LD      GR900     INITIALIZE THE WORD     2G2 J0408360
                          STO  I  WDCNT     *COUNT TO ONE           2G2 J0408370
                    *                                               2G2 J0408380
                    * INSPECT THE CONTENTS OF COL 7                2-11 J0408390
                    *                                               2G2 J0408400
                          LDX   3 -74                               2G2 J0408410
                          LD   L3 SBUFR+80  FETCH COL 7             2G2 J0408420
                          S       GR902     TEST FOR AND            2G2 J0408430
                          BSC  L  GR030,Z   BR IF NOT BLANK         2G2 J0408440
                    *                                               2G2 J0408450
                    * MAINLINE NAME NOT GIVEN                       2G2 J0408460
                    *                                               2G2 J0408470
                          SLT     32                                2G2 J0408480
                          STD  L  NAMEX     SET M.L. NAME BLANK     2G2 J0408490
                          MDX     GR020                             2G2 J0408500
                    *                                               2G2 J0408510
                    * MAINLINE NAME GIVEN                           2G2 J0408520
                    *                                               2G2 J0408530
                    GR010 BSI  L  FN000     FETCH THE N.L. NAME     2G2 J0408540
                          MDX  L  COLSW,0   SKIP IF COL.1 OF NAME BL2G2 J0408550
                          MDX     GR020     BR TO NAME STORING RTN  2G2 J0408560
                          LDX   2 4         POINT TO ERROR MSG.     2G2 J0408570
                          BSC  L  LFERR     PRINT THE MESSAGE       2G2 J0408580
                    *                                               2G2 J0408590
                    * CONSTANTS                                     2G2 J0408600
                    *                                               2G2 J0408610
                    $GCOM EQU     /63       G2250 SUBROUTINE INDICAT2G2 J0408620
                    GR900 DC      1         CONSTANT ONE            2G2 J0408630
                    GR902 DC      /40       EBCDIC BLANK            2G2 J0408640
                          BSS  E  0                                 2G2 J0408650
                    GR905 DC      /070D     GCOM  (REQUIRED SUBRTN) 2G2 J0408660
                          DC      /6500                             2G2 J0408670
                    GR906 DC      /070C     GCHAR (ALL CHAR)        2G2 J0408680
                          DC      /8059                             2G2 J0408690
                    GR907 DC      /0791     GUPER (UPPER CASE,NUM,SP2G2 J0408700
                          DC      /7159                             2G2 J0408710
                    GR908 DC      /0789     GSP06 (SCISSOR RTN)     2G2 J0408720
                          DC      /7C36                             2G2 J0408730
                    GR909 DC      /95       EBCDIC N-EBCDIC BLANK   2G2 J0408740
                    GR910 DC      /E4       EBCDIC U                2G2 J0408750
                    GR911 DC      /0789     GSP05 (PUSH UP RTN)     2G2 J0408760
                          DC      /7C35                             2G2 J0408770
                    GR912 DC      /0789     GSP12(LEVEL ENT.SUPPORT)2G2 J0408780
                          DC      /7C72                             2G2 J0408790
                    GR913 DC      /0789     GSP11(INDEX ENT.SEARCH R2G2 J0408800
                          DC      /7C71                             2G2 J0408810
                    *                                               2G2 J0408820
                    * STORE THE NAME IN SCRA BUFFER                 2G2 J0408830
                    GR015 DC      *-*       RTN TO STORE SUBROUTINE 2G2 J0408840
                          STD  L  NAMEX     NAME IN SCRA RECORD     2G2 J0408850
                          BSI  L  FB000                             2G2 J0408860
                          BSC  I  GR015                             2G2 J0408870
                    *                                               2G2 J0408880
                    GR020 LDD     GR900     SET EXT SW TO STORE 2 WO2G2 J0408890
                          BSI  L  FB000     STORE THE NAINLINE NAME 2G2 J0408900
                    GR021 LD      GR900                             2G2 J0408910
                          STO  L  $GCOM     SET GSP INDICATOR       2G2 J0408920
                          LDD     GR905     GCOM IN NAME CODE       2G2 J0408930
                          BSI     GR015     STORE NAME IN SCRA RECOR2G2 J0408940
                    *                                               2G2 J0408950
                          LD   L  SBUFR+12  CHK COL 13 FOR U        2G2 J0408960
                          S       GR910     EBCDIC U                2G2 J0408970
                          BSC  L  GR040,+-  BR IF GUPER             2G2 J0408980
                    *                                               2G2 J0408990
                          LD   L  SBUFR+12  CHK COL 13 FOR BLANK OR 2G2 J0409000
                          BSI     GR050     CHK COL FOR BLANK OR N  2G2 J0409010
                          LDD     GR906     GCHAR                   2G2 J0409020
                    GR025 BSI     GR015     STORE NAME IN SCRA REC  2G2 J0409030
                    *                                               2G2 J0409040
                          LD   L  SBUFR+20  CHK COL 21              2G2 J0409050
                          BSI     GR050     CHK COL FOR BLANK OR N  2G2 J0409060
                          LDD     GR912     GSP12                   2G2 J0409070
                          BSI     GR015     STORE NAME IN SCRA REC  2G2 J0409080
                    *                                               2G2 J0409090
                          LD   L  SBUFR+14  CHK COL 15              2G2 J0409100
                          BSI     GR050     CHK COL FOR BLANK OR N  2G2 J0409110
                          LDD     GR908     GSP06                   2G2 J0409120
                          BSI     GR015     STORE NAME IN SCRA REC  2G2 J0409130
                    *                                               2G2 J0409140
                          LD   L  SBUFR+16  CHK COL 17              2G2 J0409150
                          BSI     GR050     CHK COL FOR BLANK OR N  2G2 J0409160
                          LDD     GR911     GSP05                   2G2 J0409170
                          BSI     GR015     STORE NAME IN SCRA REC  2G2 J0409180
                    *                                               2G2 J0409190
                          LD   L  SBUFR+18  CHK COL 19              2G2 J0409200
                          BSI     GR050     CHK COL FOR BLANK OR N  2G2 J0409210
                          LDD     GR913     GSP11                   2G2 J0409220
                          BSI     GR015     STORE NAME IN SCRA REC  2G2 J0409230
                    *                                               2G2 J0409240
                          BSC  L  LF140     FETCH NEXT SUPV REC     2G2 J0409250
                    *                                               2G2 J0409260
                    * ERROR, MAINLINE NAME IN STORECI SUPV          2G2 J0409270
                    * CONTROL RECORD                                2G2 J0409280
                    *                                               2G2 J0409290
                    GR030 LDX   2 1         D 41 ERROR MSG.         2G2 J0409300
                          BSC  L  LFERR     PRINT ERROR MSG.        2G2 J0409310
                    *                                               2G2 J0409320
                    GR040 LDD     GR907     GUPER                   2G2 J0409330
                          MDX     GR025     STORE NAME              2G2 J0409340
                    *                                               2G2 J0409350
                    *    COMMON RTN TO CHK COLUMN FOR               2G2 J0409360
                    *   BLANK OR N.                                 2G2 J0409370
                    *                                               2G2 J0409380
                    GR050 DC      *-*       ENTRY POINT             2G2 J0409390
                          S       GR902     CHK IF COL IS BLANK     2G2 J0409400
                          BSC  I  GR050,+-  BR IF YES               2G2 J0409410
                          S       GR909     NO,CHK IF N             2G2 J0409420
                          BSC  L  GR060,Z   BR IF NO,ERROR          2G2 J0409430
                          MDX  L  GR050,2   INCR RETURN ADDR TO CHK 2G2 J0409440
                          BSC  I  GR050     NEXT COL AND RETURN     2G2 J0409450
                    *                                               2G2 J0409460
                    GR060 LDX   2 4         SET POINTER TO ERROR    2G2 J0409470
                          BSC  L  LFERR     BR TO PRINT MSG         2G2 J0409480
                          HDNG    FILEQ--DETERMINE TYPE OF CONTROL RCD  J0409490
                    *                                                   J0409500
                    *     DETERMINE TYPE OF SUPERVISOR CONTROL RECORD   J0409510
                    *                                                   J0409520
                    DT000 DC      *-*       ENTRY/RETURN ADDRESS        J0409530
                    *                                                   J0409540
                          LDX   3 1         TYPE COUNT TO XR3           J0409550
                          LDX   2 -8        WORD COUNT TO XR2       2G2 J0409560
                    *                                                   J0409570
                    DT020 LDD  L  PBUFR     FETCH NAME FROM BUFFER      J0409580
                          SD   L2 DT900+8   SUBTRACT A SCR NAME     2G2 J0409590
                          BSC  L  DT040,Z   BR IF FIRST HALF NOT EQUAL  J0409600
                          SLT     16        SHIFT 2ND HALF DIFF TO ACC  J0409610
                          BSC  L  DT060,+-  BR IF SECOND HALF EQUAL     J0409620
                    DT040 MDX   3 1         INCREMENT TYPE COUNT        J0409630
                          MDX   2 2         INCR WORD CNT, SKIP IF ZERO J0409640
                          MDX     DT020     BRANCH TO TEST NEXT NAME    J0409650
                    *                                                   J0409660
                          LDX   2 1         POINT TO ERROR MESSAGE      J0409670
                          BSC  L  LFERR     BRANCH TO PRINT THE MESSAGE J0409680
                    *                                                   J0409690
                    DT060 STX  L3 TYPE1     SAVE THE RECORD TYPE CODE   J0409700
                          BSC  I  DT000     RETURN                      J0409710
                    *                                                   J0409720
                    *     CONSTANTS AND WORK AREA                       J0409730
                    *                                                   J0409740
                          BSS  E  0                                     J0409750
                    DT900 EBC     .*LOC.                                J0409760
                          EBC     .*NOC.                                J0409770
                          EBC     .*FIL.                                J0409780
                          EBC     .*G22.                            2G2 J0409790
                          HDNG    FILEQ--INSERT WORDS INTO SCRA BFR     J0409800
                    *                                                   J0409810
                    *     STORE ONE OR TWO WORDS TO THE SCRA I/O BUFFER J0409820
                    *                                                   J0409830
                    FB000 DC      *-*       ENTRY/RETURN ADDRESS        J0409840
                    *                                                   J0409850
                          LDX  L2 *-*       BUFFER COUNT TO XR2         J0409860
                    BFCNT EQU     *-1                                   J0409870
                          MDX   2 1         INCR BUFR CNT, SKIP IF ZERO J0409880
                          MDX     FB040     BRANCH TO STORE WORD        J0409890
                    *                                                   J0409900
                    *     SCRA BUFFER FILLED                            J0409910
                    *                                                   J0409920
                    FB020 LDX   2 8         POINT TO ERROR MESSAGE      J0409930
                          BSC  L  LFERR     BRANCH TO PRINT THE MESSAGE J0409940
                    *                                                   J0409950
                    *     STORE A WORD                                  J0409960
                    *                                                   J0409970
                    FB040 LD      NAMEX     STORE A WORD TO             J0409980
                          STO  L2 SCRAB+640 *THE SCRA I/O BUFFER        J0409990
                          LD   I  WDCNT     INCREMENT                   J0410000
                          A       FB900     THE                         J0410010
                          STO  I  WDCNT     WORD COUNT                  J0410020
                    *                                                   J0410030
                          SLT     16        SHIFT WORD SWITCH TO ACC    J0410040
                          BSC  L  FB060,+-  BRANCH IF ONLY ONE WORD     J0410050
                    *                                                   J0410060
                    *     STORE THE SECOND WORD                         J0410070
                    *                                                   J0410080
                          MDX   2 1         INCR BUFR CNT, SKIP IF ZERO J0410090
                          MDX     *+1       SKIP                        J0410100
                          MDX     FB020     BR TO FETCH ERROR MESSAGE   J0410110
                          LD      NAMEX+1   STORE A WORD TO             J0410120
                          STO  L2 SCRAB+640 *THE SCRA I/O BUFFER        J0410130
                          LD   I  WDCNT     INCREMENT                   J0410140
                          A       FB900     THE                         J0410150
                          STO  I  WDCNT     WORD COUNT                  J0410160
                    *                                                   J0410170
                    FB060 STX   2 BFCNT     SAVE BUFFER COUNT           J0410180
                          BSC  I  FB000     RETURN                      J0410190
                    *                                                   J0410200
                    *     CONSTANTS AND WORK AREA                       J0410210
                    *                                                   J0410220
                          BSS  E  0                                     J0410230
                    NAMEX DC      *-*       NAME IN NAME CODE OR        J0410240
                          DC      *-*       *BINARY NUMBER              J0410250
                    FB900 DC      1         CONSTANT ONE                J0410260
                          HDNG    FILEQ--GET LOCAL,NOCAL,FILES NAME     J0410270
                    *                                                   J0410280
                    *     FETCH A NAME AND CONVERT TO NAME CODE         J0410290
                    *                                                   J0410300
                    FN000 DC      *-*       ENTRY/RETURN ADDRESS        J0410310
                    *                                                   J0410320
                    *     CLEAR THE NAME AREA                           J0410330
                    *                                                   J0410340
                          LDX   2 -5        CHARACTER COUNT TO XR2      J0410350
                          LD      FN901     FETCH EBCDIC BLANK          J0410360
                    FN020 STO  L2 FN900+5   STORE TO NAME AREA          J0410370
                          MDX   2 1         INCR CHAR CNT, SKIP IF ZERO J0410380
                          MDX     FN020     BRANCH TO CLEAR NEXT WORD   J0410390
                    *                                                   J0410400
                    *     FETCH AND TEST THE FIRST CHARACTER            J0410410
                    *                                                   J0410420
                          LD   L3 SBUFR+80  FETCH FIRST CHARACTER       J0410430
                          S       FN901     TEST FOR AND                J0410440
                          BSC  L  FN040,Z   *BRANCH IF NOT BLANK        J0410450
                          SRA     16        ZERO INDICATES A            J0410460
                          STO  L  COLSW     *BLANK FIRST COLUMN         J0410470
                          BSC  I  FN000     RETURN                      J0410480
                    *                                                   J0410490
                    *     STORE THE CHARACTERS                          J0410500
                    *                                                   J0410510
                    FN040 LDX   2 -5        CHARACTER COUNT TO XR2      J0410520
                          LD      FN903     SET UP EXTENSION            J0410530
                          SRT     7         *FOR COLUMN SWITCH          J0410540
                    *                                                   J0410550
                    FN060 LD   L3 SBUFR+80  FETCH THE CHARACTER         J0410560
                          STO  L2 FN900+5   STORE CHAR TO CONVERT AREA  J0410570
                          MDX   3 1         INCR COL CNT, SKIP IF ZERO  J0410580
                          MDX     *+1       SKIP                        J0410590
                          MDX     FN080     BRANCH IF END OF RECORD     J0410600
                    *                                                   J0410610
                          LD   L3 SBUFR+80  FETCH THE CHARACTER         J0410620
                          S       FN901     TEST FOR AND                J0410630
                          BSC  L  FN080,+-  *BRANCH IF A BLANK          J0410640
                    *                                                   J0410650
                          LD   L3 SBUFR+80  FETCH THE CHARACTER AGAIN   J0410660
                          S       FN902     TEST FOR AND                J0410670
                          BSC  L  FN100+1,+-  *BRANCH IF A COMMA        J0410680
                    *                                                   J0410690
                          LD   L3 SBUFR+80  FETCH THE CHARACTER AGAIN   J0410700
                          S       FN903     TEST FOR AND                J0410710
                          BSC  L  FN100,+-  *BRANCH IF A RIGHT PAREN    J0410720
                    *                                                   J0410730
                          LD   L3 SBUFR+80  FETCH THE CHAR AGAIN    2-8 J0410740
                          EOR     FN904     TEST FOR AND            2-8 J0410750
                          BSC  L  FN100,+-  *BRANCH IF A LESS THAN  2-8 J0410760
                    *                                               2-8 J0410770
                          MDX   2 1         INCR CHAR CNT, SKIP IF ZERO J0410780
                          MDX     FN060     BRANCH TO STORE THE CHAR    J0410790
                    *                                                   J0410800
                    *     NAME LONGER THAN FIVE CHARACTERS              J0410810
                    *                                                   J0410820
                    FN070 LDX   2 6         POINT TO ERROR MESSAGE      J0410830
                          BSC  L  LFERR     BRANCH TO PRINT THE MESSAGE J0410840
                    *                                                   J0410850
                    *     SET SWITCH INDICATING CHARACTER ENDING NAME   J0410860
                    *                                                   J0410870
                    *                                                   J0410880
                    FN080 SLT     16        NEGATIVE INDICATES A BLANK  J0410890
                          MDX     FN120                                 J0410900
                    *                                                   J0410910
                    FN100 SLT     1         TWO INDICATES A LEFT PAREN  J0410920
                          SLT     1         ONE INDICATES A COMMA       J0410930
                    FN120 STO  L  COLSW                                 J0410940
                    *                                                   J0410950
                    *     CONVERT THE NAME TO NAME CODE                 J0410960
                    *                                                   J0410970
                          LDX  L2 FN900     ADDR OF CHAR BUFFER TO XR2  J0410980
                          BSI  L  LABCK     BRANCH TO CONVERSION SUBR   J0410990
                          MDX     *+1       SKIP ON NORMAL RETURN       J0411000
                          MDX     FN070     BR TO PRINT ERROR MESSAGE   J0411010
                          STD  L  NAMEX     SAVE NAME                   J0411020
                          BSC  I  FN000     RETURN                      J0411030
                    *                                                   J0411040
                    *     CONSTANTS AND WORK AREA                       J0411050
                    *                                                   J0411060
                    FN900 BSS     5         CHARACTER BUFFER            J0411070
                    FN901 DC      /0040     EBCDIC BLANK                J0411080
                    FN902 DC      /006B     EBCDIC COMMA                J0411090
                    FN903 DC      /005D     EBCDIC RIGHT PARENTHESIS    J0411100
                    FN904 DC      /004C     EBCDIC LESS THAN        2-8 J0411110
                          HDNG    FILEQ--READ AND PRINT CONTROL RECORD  J0411120
                    *                                                   J0411130
                    *     READ AND PRINT A SUPERVISOR CONTROL RECORD    J0411140
                    *                                                   J0411150
                    RR000 DC      *-*       ENTRY/RETURN ADDRESS        J0411160
                    *                                                   J0411170
                          MDX  L  NORCD+C,0 SKIP IF RECORD COUNT ZERO   J0411180
                          MDX     RR020     BRANCH TO READ RECORD       J0411190
                    *                                                   J0411200
                    *     ALL SUPERVISOR CONTROL RECORDS HAVE BEEN READ J0411210
                    *                                                   J0411220
                          BSI  L  WR000     BR TO WRITE BUFFER TO SCRA  J0411230
                          BSC  L  LF200     RETURN - ALL RCDS PROCESSED J0411240
                    *                                                   J0411250
                    *     READ A RECORD                                 J0411260
                    *                                                   J0411270
                    RR020 BSI  I  GETHO     READ SUP CONTROL RECORD     J0411280
                          MDX  L  $IBSY,0   SKIP IF READ COMPLETE       J0411290
                          MDX     *-3       LOOP TILL READ COMPLETE     J0411300
                    *                                                 * J0411310
                    *                                               2-8 J0411320
                    * THE FOLLOWING TWO INSTRUCTIONS ARE            2-8 J0411330
                    * MOVED IN V2M8                                 2-8 J0411340
                    *                                               2-8 J0411350
                          LD    1 PEBUF     INITLZ INSTRUCTION TO       J0411360
                          STO     RR026+1   *STORE                      J0411370
                          A       FB900     POINT ADDR TO PACKED    2-8 J0411380
                          STO     RR028+1   *BUFFER                 2-8 J0411390
                          A       FB900     POINT ADDR TO 2ND WORD  2-8 J0411400
                          STO     RR030+1   *IN BUFFER              2-8 J0411410
                          STO     RR036+1                           2-8 J0411420
                          A       FB900     POINT ADDR TO 3RD WORD  2-8 J0411430
                          STO     RR032+1   *IN BUFFER              2-8 J0411440
                    *                                               2-8 J0411450
                          LD    1 BLKSW                                 J0411460
                          BSC  L  RR028,+-  BRANCH IF RCD CONVERTED 2-8 J0411470
                    *                                                 * J0411480
                          LD    1 CRBUF     ADDR OF I/O BFR IN ACC      J0411490
                          STO     RR024+1   INITIALIZE INSTRUCTION      J0411500
                          LD    1 INOUT     PRINCIPAL INPUT SWITCH  2-3 J0411510
                          BSC  L  RR021,+Z  BR IF PPTAPE PRINC INPUT2-3 J0411520
                          LD    1 CRBUF     ADDR OF I/O BFR IN ACC  2-3 J0411530
                          BSI  I  GETHO-1   CONVERT .CRBUF. TO EBC      J0411540
                    *************************************************** J0411550
                    *                                                 * J0411560
                    *   PACK .CRBUF. INTO .PEBUF.                     * J0411570
                    *                                                 * J0411580
                    *************************************************** J0411590
                    RR021 LDX   2 81        XR2 IS UNPACKED WD CNT + 1  J0411600
                          LDX   3 40        XR3 IS PACKED BFR WD CNT    J0411610
                    *                                               2-8 J0411620
                    * TWO INSTRUCTIONS ARE MOVED FROM HERE IN V2M8  2-8 J0411630
                    *                                               2-8 J0411640
                    *                                                 * J0411650
                    RR022 MDX   2 -2        NEXT UNPACKED WORDS         J0411660
                    RR024 LDD  L2 *-*       PICK UP TWO UNPACKED WORDS  J0411670
                          RTE     16        *AND FORM                   J0411680
                          SLA     8         *TWO PACKED CHARACTERS      J0411690
                          RTE     8         *IN ACCUMULATOR             J0411700
                    RR026 STO  L3 *-*       STORE 2 PACKED CHARACTERS   J0411710
                    *                                                 * J0411720
                          MDX   3 -1        NEXT ADDR IN PACKED BUFFER  J0411730
                          MDX     RR022     CONTINUE PACKING            J0411740
                          MDX     RR050     BR TO PRINT RCD         2-8 J0411750
                    *                                               2-8 J0411760
                    * TEST FOR // RECORD                            2-8 J0411770
                    *                                               2-8 J0411780
                    RR028 LD   L  *-*       TEST FOR //             2-8 J0411790
                          S       RR900                             2-8 J0411800
                          BSC  L  RR050,Z   BR IF NOT //            2-8 J0411810
                    RR030 LD   L  *-*       TEST FOR DUP OR COMMENT 2-8 J0411820
                          S       RR901     *RECORD                 2-8 J0411830
                          BSC  L  RR036,Z   BR IF NOT DUP           2-8 J0411840
                    RR032 LD   L  *-*       TEST IF 5TH AND 6TH COLS2-8 J0411850
                          S       RR902     *ARE 'UP'               2-8 J0411860
                          BSC  L  RR050,+-  BRANCH IF DUP RECORD    2-8 J0411870
                    RR034 LDX   2 -1        PARAMETER FOR EXIT      2-8 J0411880
                          BSC  L  LF255     EXIT TO SUP             2-8 J0411890
                    *                                               2-8 J0411900
                    RR036 LD   L  *-*       TEST FOR COMMENT RCD    2-8 J0411910
                          S       RR903     IF NOT COMMENT RCD EXIT 2-8 J0411920
                          BSC  L  RR034,Z   *TO SUPERVISOR          2-8 J0411930
                    *                                               2-8 J0411940
                          EJCT                                          J0411950
                    *                                                   J0411960
                    *     PRINT THE RECORD                              J0411970
                    *                                                   J0411980
                    RR050 LD    1 PEBUF                                 J0411990
                          STO     RR060     INITLZ CALL TO PRINT SUBR   J0412000
                          BSI  I  PRINT     PRINT SUP CONTROL RECORD    J0412010
                    RR060 DC      *-*       ADDR OF PRINT BUFFER        J0412020
                    *                                                   J0412030
                          MDX  L  NORCD+C,-1     DECR THE NUMBER OF     J0412040
                          NOP               *SUPERVISOR CONTROL RECORDS J0412050
                          BSC  I  RR000     RETURN                      J0412060
                    *                                                   J0412070
                    *     CONSTANTS AND WORK AREA                       J0412080
                    *                                                   J0412090
                    RR900 EBC     .//.                              2-8 J0412100
                    RR901 EBC     . D.                              2-8 J0412110
                    RR902 EBC     .UP.                              2-8 J0412120
                    RR903 EBC     . *.                              2-8 J0412130
                    LWDCT DC      *-*       ADDR OF LAST WORD COUNT     J0412140
                          HDNG    FILEQ--OUTPUT SCRA BFR TO DISK        J0412150
                    *                                                   J0412160
                    *     WRITE THE SCRA I/O BUFFER TO THE DISK         J0412170
                    *                                                   J0412180
                    WR000 DC      *-*       ENTRY/RETURN ADDRESS        J0412190
                          STX   3 WR070+1   SAVE XR3                    J0412200
                    *                                                   J0412210
                          LD   L  TYPE2     IF LAST RECORD TYPE NOT SET J0412220
                          BSC  L  WR040,+-  *BRANCH TO CLEAR THE BUFFER J0412230
                          S       WR903     TEST FOR AND                J0412240
                          BSC  L  WR020,-   *BRANCH IF LAST WAS FILES   J0412250
                    *                                                   J0412260
                    *     WRITE THE BUFFER                              J0412270
                    *                                                   J0412280
                          LD   I  LWDCT     FETCH LAST WORD COUNT       J0412290
                          OR      WR902     -OR- IN NEGATIVE SIGN BIT   J0412300
                          STO  I  LWDCT     RESTORE LAST WORD COUNT     J0412310
                    WR020 LDX  L3 SCRAB-2   XR3 POINTS TO SCRA BFR      J0412320
                          BSI  I  PUT       WRITE TO SCRA               J0412330
                    *                                                   J0412340
                    *     CLEAR THE SCRA BUFFER                         J0412350
                    *                                                   J0412360
                    WR040 LDX  L2 -640      WORD COUNT TO XR2           J0412370
                          SRA     16        CLEAR THE ACCUMULATOR       J0412380
                    WR060 STO  L2 SCRAB+640 STORE THE SCRA BUFFER       J0412390
                          MDX   2 1         INCR WORD CNT, SKIP IF ZERO J0412400
                          MDX     WR060     BRANCH TO CLEAR NEXT WORD   J0412410
                    *                                                   J0412420
                          LDX  L2 SCRAB     INITIALIZE THE ADDRESS OF   J0412430
                          STX  L2 WDCNT     *THE WD CNT OF THE BUFFER   J0412440
                          LD      WR040+1   INITIALIZE THE              J0412450
                          STO  L  BFCNT     *BUFFER COUNT               J0412460
                    WR070 LDX  L3 *-*       RELOAD XR3                  J0412470
                    WR080 BSC  I  WR000     RETURN                      J0412480
                    *                                                   J0412490
                    *     CONSTANTS AND WORK AREA                       J0412500
                    *                                                   J0412510
                          BSS  E  0                                     J0412520
                    WR900 DC      /0001     WRITE FUNCTION CODE         J0412530
                    WR901 DC      SCRAB-2   ADDRESS OF SCRA I/O BUFFER  J0412540
                    WR902 DC      /8000     NEGATIVE SIGN BIT           J0412550
                    WR903 DC      3         CONSTANT THREE              J0412560
                          HDNG    FILEQ--CONVERT NAMES TO NAME CODE     J0412570
                    *     CONVERT NAME FROM UNPACKED FORM (1 CHARACTER/ J0412580
                    *     WORD TO COMPRESSED FORM (5 6-BIT CHARACTERS   J0412590
                    *     TO 30 RIGHT JUSTIFIED BITS IN TWO WORDS.)  IF J0412600
                    *     IS INVALID, PSEUDO-SKIP AND RETURN ZEROS      J0412610
                    *     EQUIVALENT TO 5 BLANKS) IN ACCUMULATOR AND    J0412620
                    *     EXTENTION.                                    J0412630
                    *                                                   J0412640
                    LABCK DC      *-*       ENTRY/EXIT                  J0412650
                          LD    2 0                                     J0412660
                          S       LAB06     FIRST CHARACTER MUST NOT    J0412670
                          BSC  L  LAB04,-   *BE NUMERIC                 J0412680
                          STX   1 LAB09+1   SAVE XR1                    J0412690
                          STX   3 LAB09+3   SAVE XR3                    J0412700
                          LDX   3 -5                                    J0412710
                          LD    2 0                                     J0412720
                          S       LAB06+1                               J0412730
                          BSC  L  LAB12,+-  BRANCH IF FIRST CHAR. BLANK J0412740
                    LAB01 LDX  L1 LAB05                                 J0412750
                          LD    2 0         CHECK EACH CHARACTER FOR    J0412760
                          S       LAB06+1   *BLANK                      J0412770
                          BSC  L  LAB10,+-                              J0412780
                    LAB02 S     1 0         *AND VALID 8-BIT CHARACTER  J0412790
                          BSC  L  LAB04,Z+                              J0412800
                          S     1 1                                     J0412810
                          BSC  L  LAB03,+                               J0412820
                          MDX   1 2                                     J0412830
                          MDX     LAB02                                 J0412840
                    LAB03 MDX   2 1         INCREMENT POINTER           J0412850
                          MDX   3 1         COUNT AND TEST CHARACTERS   J0412860
                          MDX     LAB01     GO TEST NEXT CHARACTER      J0412870
                          MDX     LAB07                                 J0412880
                    LAB04 SLT     32        RETURN BLANKS               J0412890
                          MDX  L  LABCK,1   PSEUDO-SKIP                 J0412900
                          MDX     LAB09                                 J0412910
                    *                                                   J0412920
                    LAB05 DC      .$-.      TABLE OF VALID CHARACTERS   J0412930
                          DC      .$-.$     (INCLUSIVE LIMITS)          J0412940
                          DC      .#-.$     A-I,J-R,S-Z,0-9,$,#,@       J0412950
                          DC      /0001     AT SIGN - POUND SIGN    2-8 J0412960
                          DC      /0045     A - AT SIGN             2-8 J0412970
                          DC      .I-.A                                 J0412980
                          DC      .J-.I                                 J0412990
                          DC      .R-.J                                 J0413000
                          DC      .S-.R                                 J0413010
                          DC      .Z-.S                                 J0413020
                          DC      .0-.Z                                 J0413030
                          DC      .9-.0                                 J0413040
                          DC      /3FFF-.9  (FORCE END CHECK LOOP)      J0413050
                    LAB06 DC      .0                                    J0413060
                          DC      /0040                                 J0413070
                          DC      /003F                                 J0413080
                    *                                                   J0413090
                    LAB07 MDX   2 -5        LABEL IS VALID              J0413100
                          LDX   3 -5        COLLECT IT                  J0413110
                          SLT     32                                    J0413120
                    LAB08 STD     LAB13                                 J0413130
                          LD    2 0                                     J0413140
                          AND     LAB06+2                               J0413150
                          SLA     10                                    J0413160
                          OR      LAB13                                 J0413170
                          RTE     32-6                                  J0413180
                          MDX   2 1                                     J0413190
                          MDX   3 1                                     J0413200
                          MDX     LAB08                                 J0413210
                          MDX   2 -5                                    J0413220
                    LAB09 LDX  L1 *-*       RESTORE XR1                 J0413230
                          LDX  L3 *-*       RESTORE XR3                 J0413240
                          BSC  I  LABCK     EXIT                        J0413250
                    LAB10 LD    2 0         CHECK LABEL FOR EMBEDDED    J0413260
                          S       LAB06+1   *BLANKS                     J0413270
                          BSC  L  LAB04,Z                               J0413280
                          MDX   2 1                                     J0413290
                          MDX   3 1                                     J0413300
                          MDX     LAB10                                 J0413310
                          MDX     LAB07                                 J0413320
                    *                                                   J0413330
                    LAB11 LD    2 0                                     J0413340
                          S       LAB06+1                               J0413350
                          BSC  L  LAB04,Z   BRANCH IF CHAR. NOT BLANK   J0413360
                    LAB12 MDX   2 1                                     J0413370
                          MDX   3 1                                     J0413380
                          MDX     LAB11                                 J0413390
                          SLT     32        SET NAME CODE TO ZERO       J0413400
                          MDX     LAB09                                 J0413410
                    *                                                   J0413420
                    LAB13 BSS  E  2                                     J0413430
                    *                                                   J0413440
                    *                                                   J0413450
                          BSS     LF000+/3BF-*   PATCH ROOM             J0413460
                          DC      /FFFF     END OF FILEQ PATCH AREA     J0413470
                          END     LF000                                 J0413480
