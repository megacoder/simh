                          HDNG    1130 FORTRAN COMPILER PHASE 25        K2500010
                    *************************************************** K2500020
                    *                                                 * K2500030
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * K2500040
                    *                                                 * K2500050
                    *FUNCTION/OPERATION-                              * K2500060
                    *   * BUILD  PROGRAM HEADER AND DATA HEADER       * K2500070
                    *     RECORDS                                     * K2500080
                    *   * OUTPUT THESE RECORDS BY BUFFER LOADS OF 320 * K2500090
                    *     WORDS TO DISK WORKING STORAGE               * K2500100
                    *   * ANALYZES DEFINE FILE STATEMENTS AND PUTS    * K2500110
                    *     THEM IN THE BUFFER FOR OUTPUT TO WORKING    * K2500120
                    *     STORAGE IN ABSOLUTE MODE (EXCEPT FOR THE    * K2500130
                    *     ASSOCIATED VARIABLE WHICH IS IN RELOCATABLE * K2500140
                    *     OR ABSOLUTE MODE)                           * K2500150
                    *   * SCANS THE SYMBOL TABLE FOR REAL AND INTEGER * K2500160
                    *     CONSTANTS AND PLACES THEM IN THE BUFFER IN  * K2500170
                    *     ABSOLUTE MODE FOR OUTPUT TO WORKING STORAGE * K2500180
                    *                                                 * K2500190
                    *ENTRY POINTS-THE ONLY ENTRY POINT IS AT BPHAR    * K2500200
                    *   AND IS REACHED BY A CALL TO THE ROL ROUTINE   * K2500210
                    *   BY A PREVIOUS PHASE                           * K2500220
                    *                                                 * K2500230
                    *INPUT-THE STATEMENT STRING AND SYMBOL TABLE FROM * K2500240
                    *   THE PREVIOUS PHASES                           * K2500250
                    *                                                 * K2500260
                    *OUTPUT-                                          * K2500270
                    *   * WORKING STORAGE ON THE DISK CONTAINING      * K2500280
                    *     HEADER AND DATA RECORDS, REAL AND INTEGER   * K2500290
                    *     CONSTANTS AND OUTPUT FROM DEFINE FILE       * K2500300
                    *     STATEMENTS                                  * K2500310
                    *   * A 320 WORD BUFFER CONTAINING SIMILAR        * K2500320
                    *     INFORMATION TO BE OUTPUT TO WORKING STORAGE * K2500330
                    *     OR TO BE PASSED ON TO PHASE 26 TO BE FILLED * K2500340
                    *     AND PUT INTO WORKING STORAGE                * K2500350
                    *                                                 * K2500360
                    *EXTERNAL REFERENCES-                             * K2500370
                    *   SUBROUTINES-                                  * K2500380
                    *      * ROL-LOADS NEXT PHASE OF THE COMPILER     * K2500390
                    *      * DZ000-DISK WRITE SUBROUTINE              * K2500400
                    *   COMMA-DCOM-                                   * K2500410
                    *      * $PHSE                                    * K2500420
                    *      * $WSDR                                    * K2500430
                    *      * $DBSY                                    * K2500440
                    *      * $FPAD                                    * K2500450
                    *                                                 * K2500460
                    *EXITS-                                           * K2500470
                    *   NORMAL-A CALL TO THE ROL ROUTINE BRINGS IN    * K2500480
                    *   THE NEXT PHASE                                * K2500490
                    *   ERROR-NONE                                    * K2500500
                    *                                                 * K2500510
                    *TABLES/WORK AREAS                                * K2500520
                    *   * INPUT STRING                                * K2500530
                    *   *SYMBOL TABLE                                 * K2500540
                    *   *FORTRAN COMMUNICATIONS AREA                  * K2500550
                    *   *DISK OUTPUT BUFFER                           * K2500560
                    *                                                 * K2500570
                    *ATTRIBUTES-N/A                                   * K2500580
                    *                                                 * K2500590
                    *NOTES-                                           * K2500600
                    *   PROGRAM HEADER CONSISTS OF 12 WORDS IN THE    * K2500610
                    *   BUFFER AREA                                   * K2500620
                    *      WD 1 RESERVED                              * K2500630
                    *      WD 2 RESERVED                              * K2500640
                    *      WD 3 INTEGER TYPE, PRECISION               * K2500650
                    *      WD 4 OBJECT TIME PROGRAM LENGTH            * K2500660
                    *      WD 5 LENGTH OF COMMON                      * K2500670
                    *      WD 6 WD SIZE OF PROGRAM HEADER - 9 (=3)    * K2500680
                    *      WD 7 VAR. AREA WHEN NO DEFINE FILE STMNT   * K2500690
                    *      WD 8 LENGTH OF PROGRAM IN DISK BLOCKS      * K2500700
                    *      WD 9 NUMBER OF FILES DEFINED               * K2500710
                    *      WD10 PROGRAM NAME                          * K2500720
                    *      WD11 PROGRAM NAME                          * K2500730
                    *      WD12 EXECUTION ADDRESS                     * K2500740
                    *   DATA HEADER CONSISTS OF 4 WORDS (WD13-WD16)   * K2500750
                    *      WD 13 ADDRESS OF NEXT DATA                 * K2500760
                    *      WD 14 NUMBER OF DATA WORDS                 * K2500770
                    *      WD15 FIRST INDICATOR WORD                  * K2500780
                    *      WD16 FIRST DATA WORD                       * K2500790
                    *   EVERY 8 WORDS OF DATA OR PROGRAM OUTPUT IS    * K2500800
                    *   PRECEDED BY AN INDICATOR WORD CONTAINING TWO  * K2500810
                    *   BITS OF INFORMATION FOR EACH OF THE SUCCESSIVE* K2500820
                    *   EIGHT WORDS.  THE TWO BITS HAVE THE FOLLOWING * K2500830
                    *   MEANINGS.                                     * K2500840
                    *      00 = ABSOLUTE INSTRUCTION OR DATA          * K2500850
                    *      01 = RELOCATABLE INSTRUCTION               * K2500860
                    *      10 = ONE WORD CALL                         * K2500870
                    *      11 = TWO WORD CALL                         * K2500880
                    *                                                 * K2500890
                    *************************************************** K2500900
                          HDNG    1130 FORTRAN COMPILER PHASE 25        K2500910
                    *** NOTE- COMMENTS BEGIN IN COL. 44 ***             K2500920
                          ABS                                           K2500930
                    *                                                   K2500940
                    *             SYSTEM EQUATES                        K2500950
                    *                                                   K2500960
                    MEMRY EQU     /8000                                 K2500970
                    OVERL EQU     MEMRY-1501 START OF FCOM          2-4 K2500980
                    $PHSE EQU     /78        NO. OF PHASE NOW IN CORE   K2500990
                    ROL   EQU     MEMRY-68   LOC OF PROG TO RD NXT PH   K2501000
                    PHID  EQU     55         ID NUMBER THIS PHASE       K2501010
                    DZ000 EQU     /F2        DISKZ ENTRY POINT          K2501020
                    $DBSY EQU     /EE        NON-ZERO WHEN DISKZ BUSY   K2501030
                    $WSDR EQU     /7A        WORKING STORAGE DRIVE CODE K2501040
                    $FPAD EQU     /95        TABLE OF FILE PROTECT ADDR K2501050
                          ORG     OVERL                                 K2501060
                    *                                                   K2501070
                    *                  FORTRAN COMMUNICATION            K2501080
                    ORG   BSS     1    ORIGIN ADDRESS               2-4 K2501090
                    SOFS  BSS     1    START OF STRING                  K2501100
                    EOFS  BSS     1    END OF STRING                    K2501110
                    SOFST BSS     1    START OF SYMBOL TABLE            K2501120
                    SOFNS BSS     1    PROGR LENGTH AT OBJECT TIME      K2501130
                    SOFXT BSS     1    SIZE OF WORK AREA                K2501140
                    SOFGT BSS     1    SIZE OF CONSTANTS AREA           K2501150
                    EOFST BSS     1    END OF SYMBOL TABLE              K2501160
                    COMON BSS     1    ENTRY POINT                      K2501170
                    CSIZE BSS     1    SIZE OF COMMON                   K2501180
                    ERROR BSS     1    OVERLAP ERROR                    K2501190
                    FNAME BSS     1    PROGRAM NAME                     K2501200
                          BSS     1                                     K2501210
                    SORF  BSS     1    SUBROUTINE(-) OR FUNCTION(+)     K2501220
                    CCWD  BSS     1    CONTROL CARD WORD                K2501230
                    *               BIT 15 TRANSFER TRACE               K2501240
                    *               BIT 14 ARITHMETIC TRACE             K2501250
                    *               BIT 13 EXTENDED PRECISION           K2501260
                    *               BIT 12 LIST SYMBOL TABLE            K2501270
                    *               BIT 11 LIST SUBPROGRAM NAMES        K2501280
                    *               BIT 10 LIST SOURCE PROGRAM          K2501290
                    *               BIT  9 ONE WORD INTEGERS            K2501300
                    *               BIT  8 ORIGIN                   2-4 K2501310
                    IOCS  BSS     1    IOCS CONTROL CARD WORD           K2501320
                    *               BIT 15 CARD                         K2501330
                    *               BIT 14 PAPER TAPE                   K2501340
                    *               BIT 13 TYPEWRITER                   K2501350
                    *               BIT 12 1403 PRINTER                 K2501360
                    *               BIT 11 2501 READER                  K2501370
                    *               BIT 10 KEYBOARD                     K2501380
                    *               BIT  9 1442 PUNCH                   K2501390
                    *               BIT  8 DISK                         K2501400
                    *               BIT  7 1132 PRINTER                 K2501410
                    *               BIT  3 PLOTTER                      K2501420
                    *               BIT 1 UNFORMATTED DISK              K2501430
                    DFCNT BSS     1    FILE COUNT                       K2501440
                    *                                                   K2501450
                    *                                                   K2501460
                    *                  END OF FORTRAN COMMUNICATION     K2501470
                    *                  AREA                             K2501480
                    *************************************************** K2501490
                    *             THE SWITCHES USED IN PHASE 26 FOLLOW  K2501500
                    *             IF POSITIVE, THE SWITCH IS TRANSFER=T K2501510
                    *             IF ZERO, THE SWITCH IS NORMAL=N       K2501520
                    *             SWITCH COSW                           K2501530
                    *               N= OUTPUT OF REAL CONSTANTS         K2501540
                    *               T= OUTPUT OF INTEGER CONSTANTS      K2501550
                    *             THE SWITCHES USED IN PHASE 26 FOLLOW  K2501560
                    *             IF POSITIVE, THE SWITCH IS TRANSFER=T K2501570
                    *             IF ZERO, THE SWITCH IS NORMAL=N       K2501580
                    *             SWITCH TWOWC                          K2501590
                    *               N= OUTPUT OF TWO-WORD CALL NAME     K2501600
                    *               T= OUTPUT OF ONE-WORD CALL NAME     K2501610
                    *                                                   K250162-
                    *                                                   K2501630
                    BPHAR EQU     *+2                                   K2501640
                          DC      0        PROGRAM ORIGIN               K2501650
                          DC      -55      -PHASE ID FOR SLET LOOKUP    K2501660
                          DC      NXTPH-*+1  TABLE FOR NEXT PHASE ENTRY K2501670
                          DC      1        ONE ENTRY TO BE SET BY LDR   K2501680
                          ORG     *-2      ORG PROGRAM                  K2501690
                    *                                                   K2501700
                    *                                                   K2501710
                    NEQ   BSC  L  ENT                                   K2501720
                    *                                                   K2501730
                    *                                                   K2501740
                    *             BUFFER COMMUNICATIONS AREA            K2501750
                    *             AND BUFFER                            K2501760
                    *                                                   K2501770
                    *             RESERVED FOR COMMUNICATION            K2501780
                    *             BETWEEN PHASES                        K2501790
                    *             OUTPUT1 AND OUTPUT2                   K2501800
                    *             AS FOLLOWS                            K2501810
                    *                                                   K2501820
                          BSS  E  0                                     K2501830
                          DC      0        BFR CNT NXT PH-NOT YET USED  K2501840
                    BUFPT DC      WD16     BUFFERPOINTER                K2501850
                    INCT  DC      16       INDICATOR COUNTER            K2501860
                    INPT  DC      WD15     INDICATOR POINTER            K2501870
                    DHDRA DC      WD13     DATAHEADER-ADDRESS           K2501880
                    LOCTR DC      0        LOCATION COUNTER             K2501890
                    PRLGT DC      0        PROGRAM LENGTH               K2501900
                    *                      (ON DISK)                    K2501910
                          DC      0        NOT YET USED                 K2501920
                          DC      /140     WORD COUNT                   K2501930
                          DC      /0000    SCRATCH SECTOR ADDR          K2501940
                    *                                                   K2501950
                    *             DISK OUTPUT BUFFER                    K2501960
                    BUFF  DC      0                                     K2501970
                    *                                                   K2501980
                    *             PROGRAM HEADER                        K2501990
                    WD1   EQU     BUFF     RESERVED                     K2502000
                    WD2   DC      0        RESERVED                     K2502010
                    WD3   DC      0        TYPE, PRECISION              K2502020
                    WD4   DC      0        OBJECT TIME PROGRAM LENGTH   K2502030
                    WD5   DC      0        LENGTH OF COMMON             K2502040
                    WD6   DC      3        WD SIZE OF PROG HDR - 9      K2502050
                    WD7   DC      0        VAR AREA IF NO DEFINE FILES  K2502060
                    WD8   DC      0        PROG LNG (DB CNT - DUP ADDS) K2502070
                    *             (DISKBYTE COUNT, INSERTED BY DUP)     K2502080
                    WD9   DC      0        NUMBER OF FILES DEFINED      K2502090
                    WD10  DC      0        PROGRAM NAME                 K2502100
                          DC      0        WORD 2 OF PROGRAM NAME       K2502110
                    WD12  DC      0        EXECUTION ADDR               K2502120
                    *                                                   K2502130
                    *             FIRST DATA HEADER                     K2502140
                    WD13  DC      0        RELATIVE ADDR OF NEXT DATA   K2502150
                    WD14  DC      3        NUMBER OF DATA WORDS         K2502160
                    *                                                   K2502170
                    *                                                   K2502180
                    WD15  DC      0        FIRST INDICATOR WORD         K2502190
                    WD16  DC      0        FIRST DATA WORD              K2502200
                    *                                                   K2502210
                          ORG     *+50                                  K2502220
                    *                                                   K2502230
                    *                                                   K2502240
                    *             FOLLOWING INITIAL PROGRAM             K2502250
                    *             IS WITHIN BUFFERAREA                  K2502260
                    *                                                   K2502270
                    START SLA     0        NOP                          K2502280
                    *                                                   K2502290
                    *             INITIALIZE WORKING STORAGE SECTOR     K2502300
                    *             ADDRESS FROM COMMA                    K2502310
                    *                                                   K2502320
                          LDX  I3 $WSDR    WORKING STORAGE DRIVE CODE   K2502330
                          LD   L3 $FPAD    LOAD WORKING STO SECTOR ADDR K2502340
                          STO     BUFF-1   SAVE IN SCRATCH SECTOR ADDR  K2502350
                    *                                                   K2502360
                    *             INITIALIZE TRANSFER VECTOR            K2502370
                    *                                                   K2502380
                          LDX  L3 ZERO                                  K2502390
                    *                                                   K2502400
                    *                                                   K2502410
                          LD      CCWD       IS IT AN ABSOLUTE      2-4 K2502420
                          SLA     8          COMPILATION            2-4 K2502430
                          BSC  L  STAR1,-    NO  - BRANCH           2-4 K2502440
                          STO   3 ORGSW-Z    YES - SET ORIGIN SW    2-4 K2502450
                          LD    3 H0101-Z    SET UP FOR ABSOLUTE    2-4 K2502460
                          STO   3 TYPE-Z     TYPE CODE              2-4 K2502470
                    *                                                   K2502480
                    *                                                   K2502490
                    *                                                   K2502500
                    *             STORE FNAME FOR OUTPUT                K2502510
                    *                                                   K2502520
                    STAR1 LD      SORF     DO NOT STORE NAME IF         K2502530
                          BSC  L  Q0010,+- *SUBROUTINE OR FUNCTION      K2502540
                    *                                                   K2502550
                    *                                                   K2502560
                          LDD     FNAME    GET 2 WD PROG OR SUBR NAME   K2502570
                          STO     WD10     SAVE WD 1 IN PROG HDR NAME   K2502580
                          RTE     16       PUT WD 2 IN ACC              K2502590
                          STO     WD10+1   SAVE WD 2 IN PROG HDR NAME   K2502600
                    *                                                   K2502610
                    *                                                   K2502620
                    *             INITIALIZE INDICATORS IN WORD 9       K2502630
                    Q0010 LD      DFCNT                                 K2502640
                          SRT     16                                    K2502650
                          D     3 SEVEN-Z  COMPUTE NUMBER OF FILES DEF  K2502660
                          A     3 H2000-Z                               K2502670
                          STO   3 TEMP2-Z                               K2502680
                          LD      IOCS     DISK IO INDICATOR            K2502690
                          SLA     8                                     K2502700
                          AND   3 H8000-Z  PUT DISK I/O IND IN BIT 0    K2502710
                          OR    3 TEMP2-Z                               K2502720
                          STO   3 TEMP2-Z                               K2502730
                          LD      CCWD     CHECK FOR EXT. PRECISION IO  K2502740
                          AND   3 HFEFF-Z                               K2502750
                          BSC     Z        SKIP IF EXT PREC IO BIT OFF  K2502760
                          LD    3 H4000-Z  SET FLAG                     K2502770
                          OR    3 TEMP2-Z                               K2502780
                          STO     WD9                                   K2502790
                    *             SET VAR AREA WHEN NO DEFINE FILE      K2502800
                          LD      DFCNT                                 K2502810
                          BSC  L  Q1000,+- SKIP IF DEFINE FILE PRESENT  K2502820
                          LD   L  SOFXT    PUT SIZE OF WK-AREA IN WD7   K2502830
                    Q1000 STO     WD7                                   K2502840
                    *                                                   K2502850
                    *                                                   K2502860
                    INIT  SLA     0        NOP                          K2502870
                          LD   L  SOFNS     STORE PROGRAM LENGTH    2-2 K2502880
                          A    L  SOFXT     IN WORD 4 OF            2-2 K2502890
                          STO     WD4       PROGRAM HEADER          2-2 K2502900
                          LD    3 ORGSW-Z    IS IT ABSOLUTE         2-4 K2502910
                          BSC  L  Q1011,+-   NO  - BRANCH           2-4 K2502920
                          LD      WD4        YES - RELOCATE         2-4 K2502930
                          A    L  ORG        THE TERMINAL           2-4 K2502940
                          STO  L  WD4        ADDRESS                2-4 K2502950
                          BSC  L  Q1011,-    BRANCH IF POSITIVE     2-4 K2502960
                          MDX  L  ERROR,64   SET UP ERROR 86        2-4 K2502970
                          BSC  L  EXIT       EXIT                   2-4 K2502980
                    *                                                   K2502990
                          ORG     BUFF+340  ALLOW 320 WS BFR +20    212 K2503000
                    *                                                   K2503010
                    *             CHECK FOR MAINLINE PROG OR SUBP       K2503020
                    *             PUT ADDITIONAL INFO IN O/P AREA       K2503030
                    *             OUTPUT DEFINE FILE STATEMENTS         K2503040
                    Q1011 SLA     0        NOP                          K2503050
                    *                                                   K2503060
                    *                                                   K2503070
                    *             INITIALIZE OUTPUT                     K2503080
                    *                                                   K2503090
                    *             DETERMINE WHETHER MAIN LINE           K2503100
                    *             OR SUBPROGRAM                         K2503110
                    *                                                   K2503120
                          LD   L  SORF     GET SUBR-FUNCTION IND WD     K2503130
                          BSC  L  INISR,Z  BR IF SUBROUTINE             K2503140
                    *                                                   K2503150
                    *             INITIALIZE MAIN LINE PROGR            K2503160
                          LD   L  CCWD     SPECIFY PRECISION            K2503170
                          SRA     2                                     K2503180
                          AND   3 ONE-Z    MASK OUT ALL BUT EXT PRE BIS K2503190
                          A     3 TYPE-Z   MAINL REL TYPE W PREC CONST  K2503200
                    Q101X STO  L  WD3      SAVE IN 3RD WORD OF PROG HDR K2503210
                          LD   L  CCWD      IS ONE WORD INTEGERS    2-5 K2503211
                          SRA     6         *SPECIFIED              2-5 K2503212
                          AND   3 ONE-Z     IF YES - SET            2-5 K2503213
                          SLA     4         *INDICATOR FOR          2-5 K2503214
                          A       H0080     *INTEGER PRECISION      2-5 K2503215
                          A    L  WD3       *IN WORD 3 OF           2-5 K2503216
                          STO  L  WD3       *PROGRAM HEADER         2-5 K2503217
                          LD   L  CSIZE    SIZE OF COMMON               K2503220
                          STO  L  WD5      SAVE IN 5TH WORD OF PROG HDR K2503230
                    *                                                   K2503240
                    Q101A LD   L  COMON    PROGRAM ENTRY POINT          K2503250
                          STO  L  WD12     PUT IN 12TH WORD OF PROG HDR K2503260
                          LD    3 ORGSW-Z    IS IT ABSOLUTE         2-4 K2503270
                          BSC  L  Q101B,+-   NO  - BRANCH           2-4 K2503280
                          LD   L  WD12       YES - RELOCATE         2-4 K2503290
                          A    L  ORG        THIS                   2-4 K2503300
                          STO  L  WD12       WORD                   2-4 K2503310
                          BSC  L  Q101B,-    BRANCH IF POSITIVE     2-4 K2503320
                    Q101C MDX  L  ERROR,64   SET UP ERROR 86        2-4 K2503330
                          BSC  L  EXIT       EXIT                   2-4 K2503340
                    *                                                   K2503350
                    H0080 DC      /0080     INDICATOR WORD          2-5 K2503352
                    *                                                   K2503354
                    *                                                   K2503356
                    *             TEST IF ANY 'DEFINEFILE' STATEMENTS   K2503360
                    *             INCLUDED                              K2503370
                    *                                                   K2503380
                    Q101B LD   L  DFCNT    CNT OF NO. DEFINING FILE     K2503390
                          BSC  L  F1012,Z  BR IF DEFN FILES ARE PRESENT K2503400
                          MDX     F2012    BR IF NOT                    K2503410
                    *                                                   K2503420
                    *             OUTPUT 'DEFINE FILE' STATEMENTS       K2503430
                    COUNT DC      0        NO. WDS DEFN FILE STMNTS     K2503440
                    F1012 STO     COUNT    SET DEF FILE WORDCOUNTER     K2503450
                          SLA     16       CLEAR ACC                    K2503460
                          BSI  L  DHDRR    DATAHEADERROUTINE            K2503470
                    *                      ACC = 0 AT ENTRY TO SUBR     K2503480
                    *                                                   K2503490
                          LDX  I1 SOFS     INIT STRING POINTER          K2503500
                    *                                                   K2503510
                    F1014 LD      COUNT    NO. WDS DEFN FILE            K2503520
                    *             SCAN STRING FOR DEFINE FILE STMNTS    K2503530
                          BSC  L  F2012,+  BR IF NO MORE DEFN FILE 2-10 K2503540
                    F1015 LD    1 0        GET ID WORD FROM STRING      K2503550
                          AND   3 H07FC-Z  MASK ALL BUT NORM BITS       K2503560
                          STO   3 NORM-Z   SAVE NORM IN TEMP STO        K2503570
                          LD    1 0        GET ID WORD FROM STRING      K2503580
                          AND   3 HF800-Z  MASK ALL BUT TYPE CODE       K2503590
                          S     3 HF000-Z  TEST FOR DEFN FILE CODE      K2503600
                          BSC  L  F1021,+- BR IF DEFINE FILE STATEMENT  K2503610
                    *                                                   K2503620
                    *             MOVE POINTER TO NEXT STATEMENT        K2503630
                          LD    3 NORM-Z   GET STMNT NORM               K2503640
                          SRA     2        RIGHT JUSTIFY NORM           K2503650
                          STO     F1016+1  SAVE NORM COUNT              K2503660
                    F1016 MDX  L1 *-*      INCR I/P STRING PT BY NORM   K2503670
                          MDX     F1015    BR TO CHECK NEXT STMNT TYPE  K2503680
                    *                                                   K2503690
                    *             OUTPUT A DEFINE FILE STATEMENT        K2503700
                    *                                                   K2503710
                    *             INITIALIZE COUNTER TO OUTPUT          K2503720
                    *             FOURTH WORD IN EACH SEVENWORD GROUP   K2503730
                    *             AS RELATIVE SYMBOL TABLE ADDRESS      K2503740
                    *                                                   K2503750
                    F1021 LD    3 FOUR-Z   GET CONSTANT = 4             K2503760
                          STO   3 SCT-Z    SET UP COUNTER ON NO. WORDS  K2503770
                    *                                                   K2503780
                    F1022 MDX   1 1        INCR POINTER                 K2503790
                          MDX  L  NORM,-4  DECR NORM BY ONE WORD        K2503800
                          MDX     F1023    BR IF NO SKIP                K2503810
                          MDX     F1014    BR IF END OF STATEMENT       K2503820
                    *                                                   K2503830
                    *             TEST IF FOURTH WD IN GROUP            K2503840
                    F1023 MDX  L  SCT,-1   DECR WORD COUNTER            K2503850
                          MDX     F1024    BR IF NO SKIP                K2503860
                    *                                                   K2503870
                    *             OUTPUT RELTV ADDR ASSOCIATED VAR-WD 4 K2503880
                          LD    1 0        PICK UP FOURTH WORD STMNT    K2503890
                          BSI   3 GETST-Z  GET SYMBOL TABLE ADDRESS     K2503900
                          BSI   3 OUREL-Z  OUTPUT RELATIVE WORD         K2503910
                    *                      (OR ABSOLUTE IF IN           K2503920
                    *                      COMMON)                      K2503930
                          LD    3 SEVEN-Z  RESET CTR ON DEFN FILE WDCNT K2503940
                          STO   3 SCT-Z    SAVE COUNT IN TEMP CTR       K2503950
                          MDX     F1025    BR TO CONTINUE O/P OF STMNT  K2503960
                    *                                                   K2503970
                    *             OUTPUT ABSOLUTE                       K2503980
                    F1024 LD    1 0                                     K2503990
                          BSI   3 OUABS-Z                               K2504000
                    *                                                   K2504010
                    *             COUNT DEFINE FILE WORDS               K2504020
                    F1025 MDX  L  COUNT,-1                              K2504030
                          SLA     0        TO BALANCE SKIP              K2504040
                          MDX     F1022                                 K2504050
                    *                                                   K2504060
                    *                                                   K2504070
                    *             HERE COMES OUTPUT OF                  K2504080
                    *             'DATA'-STATEMENTS                     K2504090
                    *             SEARCH THROUGH STRING FOR DATA        K2504100
                    *             STATEMENTS AND OUTPUT                 K2504110
                    *                                                   K2504120
                    *     SUPERFLUOUS CODING REMOVED               2-10 K2504200
                    *                                                   K2504210
                    F2012 EQU     *                                     K2504220
                    *                                                   K2504230
                          LDX  I1 SOFS     INITIALIZE POINTER           K2504240
                    *                                                   K2504250
                    *             STORE STMNT-ID COMPUTE                K2504260
                    *             ADDR OF NEXT STATEMENT                K2504270
                    *                                                   K2504280
                    DT102 LD    1 0        LOAD STMNT ID WORD           K2504290
                          AND   3 HF800-Z  MASK OUT ALL BUT STMNT TYPE  K2504300
                          STO     STID     SAVE STMNT TYPE              K2504310
                          LD    1 0        LOAD STMNT ID WORD AGAIN     K2504320
                          AND   3 H07FC-Z  MASK OUT ALL BUT STMNT NORM  K2504330
                          SRA     2        RIGHT JUSTIFY NORM           K2504340
                          STX   1 TMP1     SAVE PT OF CURRENT STMNT     K2504350
                          A       TMP1     ADD TO STMNT NORM TO         K2504360
                          STO     DT104+1  COMPUTE POINTER TO NXT STMNT K2504370
                    *                                                   K2504380
                          LD      STID     TEST IF END-STMNT            K2504390
                          S     3 H1000-Z  END STMNT ID CONSTANT        K2504400
                          BSC  L  F3011,+- BR IF END-STMNT              K2504410
                          S       DTAID    DATA STATEMENT TEST CONSTANT K2504420
                          BSC  L  DT201,+- BRANCH IF DATA STATEMENT     K2504430
                    DT104 LDX  L1 *-*      MOVE POINTER TO NEXT STMNT   K2504440
                          MDX     DT102    CONTINUE SCAN FOR DATA STMNT K2504450
                    *                                                   K2504460
                    *             CONSTANTS, TEMP STORAGE               K2504470
                    *                                                   K2504480
                    TMP1  DC      0        POINTER TO CURRENT STMNT     K2504490
                    STID  DC      0        STATEMENT ID TYPE            K2504500
                    DPLF  DC      0        DUPLICATION FACTOR           K2504510
                    DTAID DC      /F800-/1000                           K2504520
                    *                                                   K2504530
                    *             MOVE POINTER TO NEXT DATAGROUP        K2504540
                    *                                                   K2504550
                    DT201 MDX   1 1                                     K2504560
                    *                                                   K2504570
                          SLA     0        NOP                          K2504580
                          STX   1 TMP1     SAVE CURRENT STRING POINTER  K2504590
                          LD      TMP1     COMPARE CURRENT STRING LOC   K2504600
                          S       DT104+1  WITH START OF NEXT STMNT     K2504610
                          BSC  L  DT104,-  BR IF END OF STATEMENT       K2504620
                    *                                                   K2504630
                    *             SAVE ADDR OF CONSTANT STRING - 1      K2504640
                    *             MOVE POINTER TO FIRST VARIABLE        K2504650
                    *                                                   K2504660
                          STX  L1 ADCST    SAVE ADDRESS                 K2504670
                          LD    1 0        GET LENGTH OF CON STRING WD  K2504680
                          AND   3 H0007-Z  MASK OUT ALL BUT LENGTH      K2504690
                          STO     DT202+1  SAVE LENGTH                  K2504700
                          LD    1 0        GET WD HAVING DUPCTN FACTOR  K2504710
                          SRA     3        RIGHT JUSTIFY FACTOR IN ACC  K2504720
                          STO     DPLF     STORE DUPLICATION FACTOR     K2504730
                          MDX   1 1        MOVE I/P PT PAST DATA HEADER K2504740
                    DT202 MDX  L1 *-*      MOVE PT TO FIRST VAR NAME    K2504750
                    DT203 LD    1 0        GET DATA POINTER             K2504760
                          BSI   3 GETST-Z  LOCATE SYMBOL TABLE ID WORD  K2504770
                          LD   I  GET4     GET SYMBOL TABLE ID WORD     K2504780
                          AND   3 H1800-Z  MASK ID WD FOR DIMENSION BIT K2504790
                          BSC  L  DT301,Z  BR IF DIMENSIONED VARIABLE   K2504800
                    *                                                   K2504810
                    *             OUTPUT DATA FOR A SINGLE VARIABLE     K2504820
                    *                                                   K2504830
                          LD   I  GET1+1   GET LOCATION                 K2504840
                    DT211 BSI     DHT      OUTPUT DATAHDR IF NECESSARY  K2504850
                    *     SUPERFLUOUS CODING REMOVED                2-9 K2504870
                          BSI     DTAC     OUTPUT DATA CONSTANT         K2504880
                    DT221 MDX  L  DPLF,-1  DECR DUPLICATION FACTOR      K2504890
                          MDX     DT222    BR IF NOT END OF VARIABLES   K2504900
                          MDX     DT201    BR IF END OF DTAGROUP        K2504910
                    DT222 MDX   1 1        BR TO PROCESS NEXT VARIABLE  K2504920
                          MDX     DT203                                 K2504930
                    *                                                   K2504940
                    *             DIMENSIONED VARIABLE ENCOUNTERED      K2504950
                    *                                                   K2504960
                    DT301 EQU     *        ENTRY POINT LABEL            K2504970
                          LD      DPLF     PLACE DUPLICATION FACTOR     K2504980
                          STO   3 ADUPF-Z  *INTO TEMPORARY WORK AREA    K2504990
                          SLA     16       CLEAR ACC                    K2505000
                          STO   3 OFSET-Z  CLEAR OFFSET DISPLACEMENT WD K2505010
                    *                                                   K2505020
                          LD    1 0        LOAD DATA POINTER WORD       K2505030
                          SLA     1        SHIFT DISPLACEMENT INDR BIT  K2505040
                          BSC  L  DT320,-   BRANCH, NO OFFSET           K2505050
                    *                                                   K2505060
                          MDX   1 1        POSITION POINTER             K2505070
                          LD    1 0        GET DISPLACEMENT WORD        K2505080
                          STO   3 OFSET-Z  OFSET= F(SUBSCRIPT)          K2505090
                          LD    1 -1        LOAD DATA POINTER WORD      K2505100
                          SLA     2         TEST FOR SUBSC ELEMENT BIT  K2505110
                          BSC  L  DT320,-   BRANCH IF NOT ON            K2505120
                          LD    3 ONE-Z    SET DUPLICATION FACTOR = 1   K2505130
                          STO   3 ADUPF-Z  *FOR SUBSCRIPTED VARIABLE    K2505140
                    *                                                   K2505150
                    DT320 EQU     *        ENTRY POINT LABEL            K2505160
                          LD   L  CCWD     VSIZE=SIZE OF REAL VARIABLE  K2505170
                          SLA     14       PLACE INDICATOR IN CARRY     K2505180
                          LD    3 TWO-Z    STANDARD VARIABLE SIZE       K2505190
                          BSC     C        SKIP IF STANDARD PRECISION   K2505200
                          LD    3 THREE-Z  EXTENDED VARIABLE SIZE       K2505210
                          STO   3 VSIZE-Z  SAVE VARIABLE SIZE           K2505220
                    *                                                   K2505230
                          LD   I  GET4     LOAD SYMBOL TABLE ID WORD    K2505240
                          SLA     1        TEST BIT 1 (REAL OR INTEGER) K2505250
                          BSC  L  DT340,-  BRANCH IF REAL VARIABLE      K2505260
                    *                                                   K2505270
                          LD   L  CCWD     VSIZE = SIZE OF INTEGER VAR  K2505280
                          SLA     10       PLACE INDICATOR IN CARRY     K2505290
                          LD    3 ONE-Z    ONE WORD INTEGER SIZE        K2505300
                          BSC     C        SKIP ON NO ONE WORD INTEGER  K2505310
                          STO   3 VSIZE-Z  SAVE VARIABLE SIZE           K2505320
                    *                                                   K2505330
                    DT340 EQU     *        ENTRY POINT LABEL            K2505340
                    *                                                   K2505350
                          LD    3 GET4-Z   COMPUTE ARRAY SIZE IN WORDS  K2505360
                          S     3 THREE-Z  FIRST COMPUTE ADDR OF FIRST  K2505370
                          STO     *+1      WORD OF ARRAY SIZE           K2505380
                          LD   L  *-*      LOAD ARRAY SIZE FROM SYM TBL K2505390
                          M     3 VSIZE-Z  MULTIPLY BY VARIABLE SIZE    K2505400
                          SLT     16       PUT PRODUCT IN ACC           K2505410
                          STO   3 ASIZE-Z  SAVE IN ARRAY SIZE           K2505420
                    *                                                   K2505430
                          S     3 OFSET-Z  COMPUTE NO.OF ELEMENTS THAT  K2505440
                          SRT     16       CAN BE FILLED.               K2505450
                          D     3 VSIZE-Z  DIVIDE BY VARIABLE SIZE      K2505460
                          STO   3 NOELM-Z  SAVE NO. ELEMENTS TO FILL    K2505470
                    *                                                   K2505480
                          S     3 ADUPF-Z  SUBTRACT DUPLICATION FACTOR  K2505490
                          BSC  L  DT330,+  BR, FILL ARRAY IF NOELM LE   K2505500
                    *                      DUPLICATION FACTOR           K2505510
                          LD    3 ADUPF-Z  NOELM = DPLF                 K2505520
                          STO   3 NOELM-Z                               K2505530
                    *                                                   K2505540
                          M     3 VSIZE-Z  COMPUTE ARRAY SIZE           K2505550
                          SLT     16       NO. ELEMENTS * VAR SIZE      K2505560
                          A     3 OFSET-Z  PLUS OFFSET                  K2505570
                          STO   3 ASIZE-Z  =ARRAY SIZE                  K2505580
                    *                                                   K2505590
                    DT330 EQU     *        ENTRY POINT                  K2505600
                          LD      DPLF     ADJUST DUPLICATION FACTOR    K2505610
                          S     3 NOELM-Z  SUBTRACT NO. ELEMENTS        K2505620
                          A     3 ONE-Z    PLUS ONE                     K2505630
                          STO     DPLF     SAVE NEW DUPLICATION FACTOR  K2505640
                    *                                                   K2505650
                          LD    3 NOELM-Z  GET NO. ELEMENTS TO FILL     K2505660
                          SRA     1        REMOVE LOW ORDER BIT         K2505670
                          BSC  L  DT350,+- BRANCH IF REMAINDER = 0      K2505680
                    *                                                   K2505690
                          LD   I  GET4     LOAD SYMBOL TABLE ID WORD    K2505700
                          SLA     1        TEST FOR INTEGER VARIABLE    K2505710
                          BSC  L  DT350,-  BRANCH, NOT INTEGER VARIABLE K2505720
                    *                                                   K2505730
                          LD   L  CCWD     TEST CONTROL CARD WORD       K2505740
                          SLA     9        FOR ONE WORD INTEGERS        K2505750
                          BSC  L  DT350,+Z BRANCH, ONE WORD INTEGERS    K2505760
                    *                                                   K2505770
                          SLA     5        EXTENDED PREC BIT TO CARRY   K2505780
                          LD    3 NOELM-Z  LOAD NO. ELEMENTS            K2505790
                          BSC     C        TEST CARRY FOR EXTENDED PREC K2505800
                          SLA     1        EXTENDED PREC MPY NO. ELTS*2 K2505810
                          A     3 NOELM-Z  ADD ACTUAL NO. ELEMENTS      K2505820
                          STO   3 NOELM-Z  NO.ELEMENTS *2 OR 3 - SAVE   K2505830
                    *                                                   K2505840
                    DT350 EQU     *        ENTRY POINT LABEL            K2505850
                          LD   I  GET1+1   PLACE DSF HEADER             K2505860
                          S     3 ASIZE-Z  DATA WD ADDR - ARRAY SIZE    K2505870
                          A     3 VSIZE-Z  PLUS VAR SIZE                K2505880
                          BSI     DHT      BR TO SEE IF DATA HDR O/P    K2505890
                    *                                                   K2505900
                    *     SUPERFLUOUS CODING REMOVED                2-9 K2505920
                    DT360 BSI     DTAC     OUTPUT CONSTANTS         2-9 K2505930
                          MDX  L  NOELM,-1 DECR COUNT ON NO. ELEMENTS   K2505940
                          MDX     DT360    CONTINUE IF MORE O/P         K2505950
                          MDX     DT221    FINISHED, RETURN             K2505960
                    *                                                   K2505970
                    *             SUBROUTINE                            K2505980
                    *             TEST IF DATAHEADER NECESSARY          K2505990
                    *             ACC CONTAINS ADDR OF VAR TO BE O/P    K2506000
                    *             OUTPUT DATA HEADER IF NECESSARY       K2506010
                    *                                                   K2506020
                    DHT   DC      0        LINK ENTRY POINT             K2506030
                          BSC  L  DHT1,+-  IF ZERO, OUTPUT HEADER       K2506040
                          S    L  LOCTR    TEST LOCATION COUNTER        K2506050
                          BSC  L  DHT2,+-  BR IF LOC = LOCTR, NO HDR    K2506060
                    *                      IS NEEDED                    K2506070
                          A    L  LOCTR    RESET LOCATION COUNTER       K2506080
                    DHT1  STO  L  LOCTR    SAVE                         K2506090
                          BSI  L  DHDRR    OUTPUT DATA HEADER           K2506100
                          LD   L  INPT     LOAD INDICATOR POINTER       K2506110
                          S     3 BFEND-Z  DETERMINE IF BUFFER FULL     K2506120
                          BSC  I  DHT,+Z   RETURN IF NOT                K2506130
                          BSI  L  WRITS    WRITE TO DISK                K2506140
                          LD    3 CD16-Z                                K2506150
                          STO  L  INCT     RESET INDICATOR COUNTER      K2506160
                    DHT2  BSC  I  DHT      RETURN                       K2506170
                    *                                                   K2506180
                    *             SUBROUTINE OUTPUT DATA-CONSTANT       K2506190
                    *                                                   K2506200
                    *             FROM THE STRING                       K2506210
                    DTAC  DC      0        ENTRY POINT                  K2506220
                          LD    3 ADCST-Z  INSERT ADDRESS OF CON STRING K2506230
                          STO     DTAC2+1  SAVE ADDRESS OF CON STRING   K2506240
                          LD   L  DT202+1  INITLZ CONSTANT STRING COUNT K2506250
                          STO   3 CLCT-Z   SAVE CONSTANT STRING COUNT   K2506260
                    DTAC1 MDX  L  DTAC2+1,1 INCR ADDR OF CON STRING     K2506270
                    DTAC2 LD   L  *-*      GET CONSTANT FR STRING       K2506280
                          BSI   3 OUABS-Z  OUTPUT                       K2506290
                          MDX  L  CLCT,-1  CONSTANT STRING COUNT        K2506300
                          MDX     DTAC1    BR IF PART OF CNSTNT REMAINS K2506310
                          BSC  I  DTAC     RETURN IF END OF CONSTANT    K2506320
                    *                                                   K2506330
                    **                                                  K2506340
                    *                                                   K2506350
                    *                                                   K2506360
                    *             INITIALIZE LOCATIONCOUNTER            K2506370
                    F3011 SLA     0                                     K2506380
                          LD   L  SOFXT    NOP                          K2506390
                    *                      (INCLUDING DEFINEFILE WORDS) K2506400
                          STO  L  LOCTR    LOCATION COUNTER             K2506410
                          BSI  L  DHDRR    DATAHEADERROUTINE            K2506420
                    *                                                   K2506430
                    *                                                   K2506440
                    *             OUTPUT CONSTANTS                      K2506450
                    *             SCANS SYMBOL TABLE AND OUTPUTS REAL   K2506460
                    *             CONSTANTS, FOLLOWED BY A SCAN TO      K2506470
                    *             OUTPUT INTEGER CONSTANTS              K2506480
                    *                                                   K2506490
                    *             INITIALIZE SYMBOL TABLE FOR OUTPUT    K2506500
                    *             OF CONSTANTS                          K2506510
                    *                                                   K2506520
                    INIST LD   L  SOFST    LOAD START LOC OF ST     2-9 K2506530
                          STO   3 SYMTP-Z  SYMBOL TABLE POINTER         K2506540
                    *                                                   K2506550
                    *             TEST IF END OF SYM TABLE              K2506560
                    Q1012 LD    3 SYMTP-Z  SYMBOL TABLE POINTER         K2506570
                          S    L  EOFST    END OF SYMBOL TABLE          K2506580
                          BSC  L  Q1041,+  BR IF END OF SYMBOL TABLE    K2506590
                    *                                                   K2506600
                          LD   I  SYMTP    LOAD ID WORD FROM SYMBOL TBL K2506610
                          BSC     +Z       SKIP IF NOT ENTRY OF CON     K2506620
                          MDX     Q1021    BR IF ENTRY CONSTANT         K2506630
                    *                                                   K2506640
                    *             MOVE SYMBOL TABLE POINTER             K2506650
                    *             BY 3 WORDS FOR MOST SYMBOLS           K2506660
                    *             OR 6 WORDS FOR DIMENSIONED VARIABLES  K2506670
                    Q1013 LD   I  SYMTP    LOAD SYMBOL TABLE ID WORD    K2506680
                          AND   3 H1800-Z  TEST FOR DIMENSIONED VAR.    K2506690
                          BSC     Z        SKIP IF NOT DIMENSIONED VA   K2506700
                          LD    3 HFFFD-Z  INCR BY -3 WDS FOR DIM VAR   K2506710
                          A     3 HFFFD-Z  INCR BY -3 WDS FOR ALL ENT   K2506720
                          A     3 SYMTP-Z  ADD TO SYMBOL TABLE POINTE   K2506730
                          STO   3 SYMTP-Z  SAVE IN SYMBOL TABLE POINT   K2506740
                          MDX     Q1012    CONTINUE SCAN OF SYMBOL TB   K2506750
                    *                                                   K2506760
                    *             CONSTANT FOUND IN SYMBOL TABLE        K2506770
                    *             OUTPUT REAL AND INTEGER CONSTANTS IN  K2506780
                    *             ABSOLUTE MODE                         K2506790
                    *                                                   K2506800
                    Q1021 LDX  I1 SYMTP    PUT SYMBOL TABLE POINTER X   K2506810
                    *                                                   K2506820
                    *             SAVE LOCATION COUNTER                 K2506830
                    Q1022 LD   L  LOCTR    LOAD LOCATION COUNTER        K2506840
                          STO   3 TEMP2-Z  SAVE IN TEMPORARY STORAGE    K2506850
                    *                                                   K2506860
                          LD    1 0        GET SYMBOL TABLE CONSTANT    K2506870
                          SLA     1        SHIFT INTEGER BIT TO SIGN    K2506880
                          BSC     -        SKIP IF INTEGER CONSTANT     K2506890
                          MDX     Q1031    BR IF NOT                    K2506900
                    *                                                   K2506910
                    *             TEST IF INTEGER CONSTANT OUTPUT PASS  K2506920
                          LD    3 COSW-Z   LOAD INTEGER CON O/P SWITC   K2506930
                          BSC  L  Q1013,+- BR IF NOT INTEGER CON O/P    K2506940
                    *                                                   K2506950
                          LD    1 1        SECOND WORD IN SYMBOL TABL   K2506960
                    *                      ENTRY TO ACCUMULATOR         K2506970
                          MDX     Q1033    BR TO O/P IN ABSOLUTE MODE   K2506980
                    *                                                   K2506990
                    *             TEST IF REAL CONSTANT PASS            K2507000
                    Q1031 LD    3 COSW-Z   LOAD INTEGER CON O/P SWITC   K2507010
                          BSC  L  Q1013,Z  BR IF INTEGER CON INDICATED  K2507020
                    *                                                   K2507030
                    *             TEST IF EXTENDED PRECISION            K2507040
                          LD   L  CCWD     LOAD CONTROL CARD WORD       K2507050
                          SLA     13       SHIFT EXTENDED PREC BIT      K2507060
                          BSC     -        SKIP IF EXTENDED PREC        K2507070
                          MDX     Q1032    BR IF NOT EXTENDED PREC      K2507080
                    *                                                   K2507090
                          LD    1 0        LOAD SYMBOL TABLE ID WORD    K2507100
                          AND   3 H00FF-Z  MASK ALL BUT BITS 8-15       K2507110
                          BSI   3 OUABS-Z  SUBR OUTPUT, ENTRY = ABS     K2507120
                    Q1032 LD    1 1        SECOND WORD IN ENTRY TO ACC  K2507130
                          BSI   3 OUABS-Z  SUBR OUTPUT, ENTRY = ABS     K2507140
                          LD    1 2        THIRD WORD IN SYMBOL TABLE   K2507150
                    *                      ENTRY TO ACC                 K2507160
                    Q1033 BSI   3 OUABS-Z  SUBR OUTPUT, ENTRY = ABS     K2507170
                    *                                                   K2507180
                    *             INSERT ALLOCATION INTO SYM.TBL.       K2507190
                          LD    3 TEMP2-Z  GET ALLOC CON FROM TEMP STO  K2507200
                          STO   1 1        STORE IN 2ND WD OF SYM TBL   K2507210
                    *                                                   K2507220
                          MDX     Q1013    BR TO CONTINUE SYM TBL SCAN  K2507230
                    *                                                   K2507240
                    *             TEST IF THAT WAS THE SECOND           K2507250
                    *             (=INTEGER CONSTANT) PASS              K2507260
                    *                                                   K2507270
                    Q1041 LD    3 COSW-Z   CONSTANT OUTPUT SWITCH       K2507280
                          BSC  L  Q1051,Z  BR IF SECOND PASS            K2507290
                          MDX  L  COSW,1   CHANGE CONSTANT O/P SWITCH   K2507300
                          MDX     INIST    GO TO NEXT PASS              K2507310
                    *                                                   K2507320
                    *             OUTPUT OF CONSTANTS COMPLETED         K2507330
                    *             START OUTPUT  OF STRING DATA          K2507340
                    *                                                   K2507350
                    *             TEST THAT OUTPUT LOCATION COUNTER     K2507360
                    *             CHECKS WITH THE ONE ASSUMED AT        K2507370
                    *             STATEMENT ALLOCATION. IF NOT,         K2507380
                    *             OUTPUT DUMMY WORD.                    K2507390
                    Q1051 LD   L  SOFXT    LOAD SIZE OF WORK AREA       K2507400
                          A    L  SOFGT    PLUS SIZE OF CONSTANT AREA   K2507410
                          S    L  LOCTR    LESS THE LOCATION COUNTER    K2507420
                          BSC  L  EXIT,+   BR IF SIZE WK AREA & CONST   K2507430
                    *             AREA L.E. LOCATION COUNTER            K2507440
                          SLA     16       CLEAR ACC                    K2507450
                          BSI   3 OUABS-Z  OUTPUT DUMMY WORD            K2507460
                          MDX     Q1051    CONTINUE LOOP                K2507470
                    *                                                   K2507480
                    *             BR TO LOADING OF NEXT PHASE           K2507490
                          BSC  L  EXIT                                  K2507500
                    *                                                   K2507510
                    *             PROGRAM BEING COMPILED IS A SUBR      K2507520
                    *             INITIALIZE SUBR. OUTPUT               K2507530
                    INISR SLA     0        NOP                          K2507540
                    *                                                   K2507550
                    *                      INSERT TYPECODE .SUBPROGR.   K2507560
                    *                      AND PRECISION                K2507570
                    *                                                   K2507580
                          LD   L  CCWD     SPECIFY PRECISION            K2507590
                          SRA     2        SHIFT EXTENDED PREC TO BIT15 K2507600
                          AND   3 1        MASK EXTENDED PRECISION BIT  K2507610
                          A     3 H0401-Z  ADD TYPE AND PRECISION MASK  K2507620
                          BSC  L  Q101X    RETURN TO CONTINUE PROCESSIN K2507630
                    *                                                   K2507640
                    *                                                   K2507650
                          BSS  E  0        DISK CONSTANTS               K2507660
                    WR900 DC      /7001    WRITE DISK PARAMETER         K2507670
                          DC      BUFF-2   DISK BUFFER AREA             K2507680
                    ENDLZ DC      /63F0    END OF WK STO TEST CONSTANT  K2507690
                    *                                                   K2507700
                    *             WRITE DISK                            K2507710
                    WRITS DC      *-*      LINK ENTRY POIN              K2507720
                          LD      WRITS    MOVE LINK WORD               K2507730
                          STO     WRITE    TO RETURN LINK               K2507740
                          MDX     WRITT    BRANCH TO WRITE DISK         K2507750
                    WRITE DC      0        LINK ENTRY AND RETURN        K2507760
                    *                                                   K2507770
                    *             CORRECT WORDCOUNT IN DATAHEADER       K2507780
                          BSI  L  PCT        BUFFER COUNT           2-3 K2507790
                          NOP                                       2-3 K2507800
                          NOP                                       2-3 K2507810
                          NOP                                       2-3 K2507820
                    *                                                   K2507830
                    *                                                   K2507840
                    WRITT LD   L  BUFF-1   CHECK SECTOR ADDRESS         K2507850
                          SLA     4        REMOVE HIGH ORDER BITS       K2507860
                          S       ENDLZ    TEST IF END OF WORKING STO   K2507870
                          BSC  L  NOWS,-   BRANCH IF NO WORKING STO     K2507880
                          LDD     WR900    LOAD DISK WRITE PARAMETERS   K2507890
                          BSI  L  DZ000    WRITE SECTOR ONTO DISK       K2507900
                          MDX  L  $DBSY,0  SKIP IF DISK READY           K2507910
                          MDX     *-3      LOOP IF DISK BUSY            K2507920
                    *                      RESET POINTERS               K2507930
                          LD   L  INPT     INDICATOR POINTER            K2507940
                          S     3 C320-Z   DECR INDICATOR POINTER       K2507950
                          STO  L  INPT     SAVE BACK IN POINTER         K2507960
                          LD   L  BUFPT    BUFFER POINTER               K2507970
                          S     3 C320-Z   DECR BUFFERPOINTER           K2507980
                          STO  L  BUFPT    SAVE BACK IN BUFFER POINTER  K2507990
                          LD   L  DHDRA    DATA HEADER ADDR             K2508000
                          S     3 C320-Z   DECR DATA HEADER ADDR        K2508010
                          STO  L  DHDRA    SAVE BACK IN DATA HDR ADDR   K2508020
                    *                                                   K2508030
                    *             MOVE BUFFER TAIL TO FRONT OF          K2508040
                    *             NEXT BUFFER                           K2508050
                    *                                                   K2508060
                          LDX   3 24       XR3 = WORD COUNT OF 24       K2508070
                    MOV1  LD   L3 BUFF+319 MOVE LAST 24 WDS OF BFR AREA K2508080
                          STO  L3 BUFF-1   TO HEADER AREA               K2508090
                          MDX   3 -1       COUNT                        K2508100
                          MDX     MOV1     BR IF NO SKIP                K2508110
                          LDX  L3 ZERO     RESTORE XR3 TO CONSTANT      K2508120
                    *                                                   K2508130
                          MDX  L  BUFF-1,1 INCR SECTORADDR,SCRATCHAREA  K2508140
                    *                                                   K2508150
                          MDX  L  INCT,20  MAKE INCT NON-16             K2508160
                    *                                                   K2508170
                          BSC  I  WRITE    RETURN                       K2508180
                    *                                                   K2508190
                    NOWS  LDX   1 1        CALL RECOVERY - NO WS        K2508200
                          STX  L1 SOFS-1                                K2508210
                          LDX  I1 NXTPH+1  LOAD PARAMETER FOR READING   K2508220
                          LDD  L  NXTPH+2  NEXT PHASE                   K2508230
                          BSC  L  ROL      GO TO READ NEXT PHASE        K2508240
                    *                                                   K2508250
                    *                                                   K2508260
                    *                                                   K2508270
                    *                                                   K2508280
                          BSS  E  0                                     K2508290
                    STONA DC      0        STORED NAME WD 1             K2508300
                          DC      0        STORED NAME WD 2             K2508310
                    *                                                   K2508320
                    ZERO  DC      0        CONSTANT                     K2508330
                    Z     EQU     ZERO     CONSTANT                     K2508340
                    ONE   DC      1        CONSTANT                     K2508350
                    TWO   DC      2        CONSTANT                     K2508360
                    THREE DC      3        CONSTANT                     K2508370
                    FOUR  DC      4        CONSTANT                     K2508380
                    H0002 DC      /0002    CONSTANT                     K2508390
                    H0003 DC      /0003    CONSTANT                     K2508400
                    H0005 DC      /0005    CONSTANT                     K2508410
                    SEVEN DC      7        CONSTANT                     K2508420
                    H0200 DC      /0200    CONSTANT                     K2508430
                    TYPE  DC      /0201    MAINL REL TYPE W PREC CONST  K2508440
                    H0401 DC      /0401    CONSTANT                     K2508450
                    C320  DC      320      CONSTANT                     K2508460
                    H1800 DC      /1800    CONSTANT                     K2508470
                    HFFFD DC      /FFFD    CONSTANT                     K2508480
                    HFEFF DC      /FEFF    EXT PRECISION MASK           K2508490
                    H0007 DC      /0007    CONSTANT                     K2508500
                    H00FF DC      /00FF    CONSTANT                     K2508510
                    CD16  DC      16       CONSTANT                     K2508520
                    H07FC DC      /07FC    CONSTANT                     K2508530
                    HF800 DC      /F800    CONSTANT                     K2508540
                    HF000 DC      /F000    ID FOR 'DEFINE FILE'         K2508550
                    H07FF DC      /07FF    CONSTANT                     K2508560
                    H1000 DC      /1000    CONSTANT                     K2508570
                    H2000 DC      /2000    CONSTANT                     K2508580
                    H8000 DC      /8000    MASK TO SEE IF DISK IO(BIT0) K2508590
                    H4000 DC      /4000    CONSTANT                     K2508600
                    BFEND DC      BUFF+320  END OF BUFFER O/P AREA  212 K2508610
                    OFSET DC      *-*      DISPLACEMENT WD FR DATA PT   K2508620
                    VSIZE DC      *-*      VARIABLE SIZE = 1,2 OR 3     K2508630
                    ASIZE DC      *-*      ARRAY SIZE DATA STMNT        K2508640
                    NOELM DC      *-*      NO. ELEMENTS TO BE FILLED    K2508650
                    ADCST DC      *-*      ADDR CONSTANT STRING - 1     K2508660
                    CLCT  DC      *-*      LENGTH OF CONSTANT STRING    K2508670
                    * SUPERFLUOUS WORD REMOVED                      2-9 K2508680
                    *                                                   K2508690
                    NORM  DC      0        WD COUNT I/P STRING          K2508700
                    COSW  DC      0        CONSTANT PASS SWITCH         K2508710
                    TEMP2 DC      0        TEMPORARY STORAGE            K2508720
                    SYMTP DC      0        SYMBOL TABLE POINTER         K2508730
                    SCT   DC      0        SEVEN COUNT                  K2508740
                    ADUPF DC      *-*      TEMPORARY DUPLICATION FACTOR K2508750
                    ORGSW DC      0          ORIGIN SWITCH          2-4 K2508760
                    H0101 DC      /0101      ABSOLUTE TYPE          2-4 K2508770
                    *                                                   K2508780
                    *                                                   K2508790
                    *             SUBROUTINE GETST                      K2508800
                    *             GET OBJECT TIME ADDRESS OR            K2508810
                    *             ALPHABETIC NAME FROM SYMBOL TABLE     K2508820
                    *             ON ENTRY ACC = STRING POINTER TO      K2508830
                    *             SYMBOL TABLE                          K2508840
                    *                                                   K2508850
                    GETST DC      0        LINK ENTRY POINT             K2508860
                          AND   3 H07FF-Z  MASK OUT ALL BUT VAR PT      K2508870
                          STO     GET1+1   SAVE VARIABLE POINTER        K2508880
                          LD   L  SOFST    LOAD START OF SYMBOL TABLE   K2508890
                          S       GET1+1   SUBTRACT POINTER IN SYM TBL  K2508900
                          S       GET1+1   *THREE                       K2508910
                          S       GET1+1   *TIMES                       K2508920
                          A     3 H0005-Z  ADD 5 TO POS AT END OF DATA  K2508930
                          STO     GET1+1   SAVE POINTER                 K2508940
                          S     3 TWO-Z    MOVE PT BACK TO ADDR OF ID   K2508950
                          STO     GET4     STORE ADDR OF ID-WD          K2508960
                    GET1  LD   L  *-*      LOAD VARIABLE FROM SYM TBL   K2508970
                          RTE     16       PUT IN EXTENSION             K2508980
                          MDX  L  GET1+1,-1 DECR POINTER                K2508990
                          SLA     0        GUARDS AGAINST SKIP          K2509000
                          LD   I  GET1+1   GET DATA WD FR SYM TBL       K2509010
                          BSC  I  GETST    RETURN                       K2509020
                    GET4  DC      *-*      ADDR OF SYM TBL ID WORD      K2509030
                    *                                                   K2509040
                    *             OUTPUT ADDRESS OR CONSTANT IN         K2509050
                    *             ABSOLUTE MODE                         K2509060
                    *             ACCUMULATOR AND EXTENSION CONTAIN     K2509070
                    *             WORDS TO BE OUTPUT                    K2509080
                    *                                                   K2509090
                    *             ENTRY = ABSOLUTE OUTPUT               K2509100
                    OUABS DC      0        LINK                         K2509110
                    T8011 STD   3 STONA-Z  STORE ACC AND EXTENSION      K2509120
                          LD    3 ZERO-Z   ZERO-ZERO                    K2509130
                          BSI     IBITS    TO INDICATOR AREA            K2509140
                    *                                                   K2509150
                    T8012 LD    3 STONA-Z  GET STORED ACCUMULATOR       K2509160
                          BSI     TOBUF    MOVE TO BUFFER               K2509170
                    *                                                   K2509180
                    T8016 BSC  I  OUABS    RETURN                       K2509190
                    *                                                   K2509200
                    *             OUTPUT ADDRESS OR CONSTANT IN         K2509210
                    *             RELOCATABLE MODE                      K2509220
                    *                                                   K2509230
                    *             ENTRY = RELATIVE OUTPUT               K2509240
                    *             RELATIVE OUTPUT (INCLUDES TEST        K2509250
                    *             WHETHER VARIABLE IS IN COMMON, IN     K2509260
                    *             WHICH CASE OUTPUT IS ABSOLUTE         K2509270
                    *                                                   K2509280
                    OUREL DC      0        LINK ENTRY POINT             K2509290
                    T8013 STD   3 STONA-Z  STORE ACC AND EXTENSION      K2509300
                          LD      OUREL    SET LINK RETURN ADDRESS      K2509310
                          STO     OUABS    IN ABSOLUTE LINK EXIT POINT  K2509320
                          LD   L  GET1+1   LOAD ADDR OF SYM TBL DATA WD K2509330
                          S     3 ONE-Z    SUBTRACT 1 TO GET ADDR ID WD K2509340
                          STO     T8014+1  INSERT ADDR OF SYM TBL ID WD K2509350
                    T8014 LD   L  *-*      LOAD SYM TBL ID WORD         K2509360
                          AND   3 H2000-Z  TEST FOR COMMON INDR BIT     K2509370
                          BSC  L  T8015,+- BR IF NOT IN COMMON          K2509380
                          LD    3 ZERO-Z   ZERO INDICATOR BIT MASK      K2509390
                          MDX     T8017+1  GO OUTPUT INDICATOR BITS     K2509400
                    *                                                   K2509410
                    T8015 LD    3 ORGSW-Z    IS IT ABS COMPILATION  2-4 K2509420
                          BSC  L  T8017,+-   NO  - BRANCH           2-4 K2509430
                          LD    3 STONA-Z    YES - RELOCATE         2-4 K2509440
                          A    L  ORG        THIS                   2-4 K2509450
                          STO   3 STONA-Z    ADDRESS                2-4 K2509460
                          BSC  L  Q101C,+Z   BRANCH TO ERROR IF NEG 2-4 K2509470
                          LD    3 ZERO-Z     ZERO-ZERO TO IND BITS  2-4 K2509480
                          MDX     *+1        SKIP                   2-4 K2509490
                    *                                                   K2509500
                    T8017 LD    3 ONE-Z    ZERO-ONE FOR INDICATOR BITS  K2509510
                          BSI     IBITS    MOVE TO INDICATOR AREA       K2509520
                          MDX     T8012    RETURN                       K2509530
                    *                                                   K2509540
                    *                                                   K2509550
                    *             INDICATOR BITS                        K2509560
                    *             ACCUMULATOR CONTAINS BIT PATTERNS TO  K2509570
                    *             MASK INTO THE INDICATOR POINTER       K2509580
                    *             BASED ON SHIFTS SPECIFIED IN THE      K2509590
                    *             INDICATOR COUNTER                     K2509600
                    *                                                   K2509610
                    *                                                   K2509620
                    IBITS DC      0        LINK ENTRY POINT             K2509630
                          STO     IBIT5    SAVE BIT PATTERNS            K2509640
                          LD   L  INCT     PRODUCE SLA AND SRA          K2509650
                          A       IBIT6    INSTRUCTIONS AND INSERT      K2509660
                          STO     IBIT3    (LENGTH OF SHIFT DEPENDS ON  K2509670
                          A       IBIT7    INDICATOR COUNTER)           K2509680
                          STO     IBIT2    SET UP SRA INSTRUCTION       K2509690
                          LD   I  INPT                                  K2509700
                    IBIT2 SRA     *-*      SRA (INCT - 2)               K2509710
                          A       IBIT5    TEMP VALUE FROM ACC          K2509720
                    IBIT3 SLA     *-*      SLA (INCT - 2)               K2509730
                          STO  I  INPT                                  K2509740
                          MDX  L  INCT,-2  DECR INDICATOR COUNTER       K2509750
                          MDX     IBIT4    BR IF NOT ZERO (=NO SKIP)    K2509760
                          MDX  L  INPT,9   INCR INDICATOR POINTER       K2509770
                          LD    3 CD16-Z   REINITIALIZE INDICATOR CTR   K2509780
                          STO  L  INCT     TO 16                        K2509790
                    IBIT4 BSC  I  IBITS    RETURN                       K2509800
                    IBIT5 DC      0        TEMPORARY STORAGE            K2509810
                    IBIT6 DC      /0FFE    .SLA 0. - 0002               K2509820
                    IBIT7 DC      /0800    .SRA 0. - .SLA 0.            K2509830
                    *                                                   K2509840
                    *             SUBROUTINE                            K2509850
                    *             MOVE TO BUFFER                        K2509860
                    *             ACCUMULATOR CONTAINS INDICATOR        K2509870
                    *             POINTER                               K2509880
                    *                                                   K2509890
                    TOBUF DC      0        LINK ENTRY POINT             K2509900
                          STO  I  BUFPT    SAVE WORD IN BUFFER          K2509910
                          MDX  L  LOCTR,1  INCR LOCATION COUNTER        K2509920
                    *                                                   K2509930
                    *             TEST IF SKIP TO NEXT 8WORD GROUP      K2509940
                          LD   L  INCT     LOAD INDICATOR COUNTER       K2509950
                          S     3 CD16-Z   SUBTRACT 16                  K2509960
                          BSC  L  TOBU1,Z  BR IF NOT NEW INDR WORD      K2509970
                          STO  I  INPT     ZERO TO NEW INDICATOR WORD   K2509980
                    *                                                   K2509990
                    *     SUPERFLUOUS CODING REMOVED                2-9 K2510000
                    *                                                   K2510050
                    *             TEST IF END OF BUFFER                 K2510060
                    TEOB  LD   L  INPT     LOAD INDICATOR POINTER       K2510070
                          S     3 BFEND-Z                               K2510080
                          BSC  L  TOBUC,Z+ BR IF BUFF NOT FULL          K2510090
                          BSI   3 WRITE-Z                               K2510100
                          LD   L  INPT     INDIC PTR TO                 K2510110
                          STO  L  BUFPT    BUFFER POINTER               K2510120
                          BSI  L  DHDRR    DATAHEADERROUTINE            K2510130
                          BSC  I  TOBUF    REUTRN                       K2510140
                    *                                                   K2510150
                    TOBUC BSI     PCT      BUFFER COUNT SUBR            K2510160
                    TOBU1 BSI     PCT      BUFFER COUNT SUBR            K2510170
                          BSC  I  TOBUF    RETURN                       K2510180
                    *                                                   K2510190
                    *                                                   K2510200
                    *             SUBROUTINE MOVE BUFFERPOINTERS        K2510210
                    *                                                   K2510220
                    PCT   DC      0        LINK                         K2510230
                    *                                                   K2510240
                    *             INCR COUNT IN DATAHEADER              K2510250
                          LD   L  DHDRA    LOAD ADDR OF NEXT DATA WD    K2510260
                          A     3 ONE-Z    ADD 1                        K2510270
                          STO     PCT0+1   SAVE ADDR OF CNT NXT DATA WD K2510280
                    PCT0  MDX  L  *-*,1    INCR CNT OF DATA WDS         K2510290
                    *                                                   K2510300
                          MDX  L  PRLGT,1  INCR PROGRAM  LENGTH COUNT   K2510310
                          MDX  L  BUFPT,1  INCR BUFFERPOINTER           K2510320
                    PCT1  BSC  I  PCT      RETURN                       K2510330
                    *                                                   K2510340
                    *                                                   K2510350
                    *             DATAHEADER ROUTINE                    K2510360
                    *             OUTPUT DATA HEADER                    K2510370
                    *             ACCUMULATOR CONTAINS LOCATION COUNTER K2510380
                    *                                                   K2510390
                    DHDRR DC      0        LINK                         K2510400
                    DHDR1 MDX     FIRST    FIRST-TIME-SWITCH            K2510410
                    *                      (AFTER FIRST TIME = NO OP)   K2510420
                          LD   L  INCT     LOAD INDICATOR COUNTER       K2510430
                          S     3 CD16-Z   SUBTRACT 16                  K2510440
                          BSC  L  DHDR0,Z  BR IF NOT EMPTY              K2510450
                          LD   I  PCT0+1   LOAD NO. DATA WDS IN BUFFER  K2510480
                          S     3 ONE-Z    DECR BY 1                    K2510490
                          STO  I  PCT0+1    ADJUST HEADER               K2510500
                          S     3 TWO-Z    CHECK IF NO DATA WORDS   2-8 K2510501
                          BSC  L  LAB1,Z   DO NOT BRANCH IF SO      2-8 K2510502
                          MDX  L  PRLGT,-3 OVERLAY LAST DATA HEADER 2-8 K2510503
                          MDX  L  INPT,-2  *WITH THE NEW ONE        2-8 K2510504
                          MDX     LAB2                              2-8 K2510505
                    LAB1  MDX  L  PRLGT,-1                          2-8 K2510506
                    LAB2  LD   L  INPT     LOAD INDICATOR POINTER   2-8 K2510507
                          STO  L  BUFPT    RESET BUFFER POINTER     2-8 K2510508
                    DHDR0 EQU     *        ENTRY POINT                  K2510510
                          LD    3 ORGSW-Z    IS IT ABSOLUTE         2-4 K2510520
                          BSC  L  DHDRY,+-   NO  - BRANCH           2-4 K2510530
                          LD   L  LOCTR      RELOCATE THE           2-4 K2510540
                          A    L  ORG        LOCATION COUNTER       2-4 K2510550
                          BSC  L  Q101C,+Z   ERROR IF NEGATIVE      2-4 K2510560
                          MDX     DHDRZ      CONTINUE               2-4 K2510570
                    DHDRY LD   L  LOCTR    LOCCOUNTER TO DATAHEADER     K2510580
                    DHDRZ STO  I  BUFPT    SAVE IN BUFFER               K2510590
                          LD   L  BUFPT    INSERT NEW DATAHEADER ADDR   K2510600
                          STO  L  DHDRA    SAVE                         K2510610
                          A     3 ONE-Z    INCREASE TO POINT        2-8 K2510613
                          STO     PCT0+1   *AT WORD COUNT           2-8 K2510616
                          MDX  L  BUFPT,1  INCR BUFFER POINTER          K2510620
                          LD    3 THREE-Z  INITIAL COUNT = 3            K2510630
                    *                      (INDICATOR WORD +2)          K2510640
                          STO  I  BUFPT    SAVE IN BUFFER               K2510650
                          MDX  L  BUFPT,1  INCR BUFFER POINTER          K2510660
                          LD    3 ZERO-Z   CLEAR ACC                    K2510670
                          STO  I  BUFPT    ZERO TO FIRST INDICATOR      K2510680
                          LD   L  BUFPT    GET BUFFER POINTER           K2510690
                          STO  L  INPT     INSER INDICATOR POINTER      K2510700
                          LD    3 CD16-Z   RESET INDICATOR POINTER      K2510710
                          STO  L  INCT                                  K2510720
                          MDX  L  BUFPT,1  MOVE BUFPTR TO NEXT DATAWORD K2510730
                          MDX  L  PRLGT,3  COUNT 3 FOR DATAHDR          K2510740
                    DHDRX BSC  I  DHDRR    RETURN                       K2510750
                    *                                                   K2510760
                    *             USED AT FIRST ENTRY TO ROUTINE        K2510770
                    FIRST STO  L  LOCTR    INSERT LOCATION COUNTER      K2510780
                          STO  L  WD13     SAVE IN HEADER WD            K2510790
                          LD    3 ORGSW-Z    IS IT ABSOLUTE         2-4 K2510800
                          BSC  L  FRST1,+-   NO  - BRANCH           2-4 K2510810
                          LD   L  WD13       YES - LOAD WORD 13     2-4 K2510820
                          BSC  L  FRST2,Z    BRANCH IF NON-ZERO     2-4 K2510830
                          LD   L  ORG        SET ORIGIN ADDRESS     2-4 K2510840
                          STO  L  WD13       IN WORD 13             2-4 K2510850
                    FRST1 LD      NOP      REPLACE FIRST-TIME-BRANCH    K2510860
                          STO     DHDR1    BY NOP                       K2510870
                          MDX     DHDRX    TO RETURN                    K2510880
                    NOP   SLA     0                                     K2510890
                    *                                                   K2510900
                    FRST2 S     3 ONE-Z      IS IT ONE              2-4 K2510910
                          BSC  L  FRST3,Z    NO  - BRANCH           2-4 K2510920
                          BSI   3 OUABS-Z    YES - OUTPUT DUMMY     2-4 K2510930
                          LD   L  ORG        WORD AT THE            2-4 K2510940
                          STO  L  WD13       ORIGIN ADDRESS         2-4 K2510950
                          MDX     FRST1      GO BACK AGAIN          2-4 K2510960
                    *                                                   K2510970
                    FRST3 LD   L  ORG        SET ORIGIN ADDRESS     2-4 K2510980
                          STO  L  WD13       IN DATA HEADER         2-4 K2510990
                          LD      NOP        SET NOP IN             2-4 K2511000
                          STO     DHDR1      FIRST TIME BRANCH      2-4 K2511010
                          LD    3 ZERO-Z     OUTPUT DUMMY           2-4 K2511020
                          BSI   3 OUABS-Z    WORD                   2-4 K2511030
                          MDX  L  LOCTR,-1   RESTORE LOCTR          2-4 K2511040
                          MDX     DHDR1      MAKE NEW HEADER        2-4 K2511050
                    *                                                   K2511060
                    *                                                   K2511070
                    *             LOAD NEXT PHASE                       K2511080
                    *                                                   K2511090
                    EXIT  LDX  I1 NXTPH+1  LOAD PARAM FOR READING       K2511100
                          LDD     NXTPH+2  NEXT PHASE                   K2511110
                          BSC  L  ROL      GO TO READ NEXT PHASE        K2511120
                          BSS  E  0                                     K2511130
                    NXTPH DC      56       ID OF NEXT PHASE             K2511140
                          BSS     3        LOADER TABLE FOR NEXT PHASE  K2511150
                    *                                                   K2511160
                    *                                                   K2511170
                    *             PROGRAM ENTRY                         K2511180
                    ENT   LDX   1 PHID     GET ID THIS PHASE            K2511190
                          STX  L1 $PHSE    STORE IN SYSTEM PHASE AREA   K2511200
                    *             TEST IF OUTPUT IS TO BE DEFERRED      K2511210
                    *                                                   K2511220
                          LD   L  ERROR                                 K2511230
                          BSC  L  START,+- BRANCH TO START IF NO        K2511240
                    *                        ERROR                      K2511250
                          BSC  L  EXIT                                  K2511260
                    *                                                   K2511270
                    *     SUPERFLUOUS CODING REMOVED                2-9 K2511280
                          BSS     /7F35-*   PATCH AREA                  K2511320
                          DC      0                                     K2511330
                          END     BPHAR-2                               K2511340
