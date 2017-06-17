                          HDNG    1130 FORTRAN COMPILER PHASE 26        K2600010
                    *************************************************** K2600020
                    *                                                 * K2600030
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * K2600040
                    *                                                 * K2600050
                    *FUNCTION/OPERATION-                              * K2600060
                    *   * TESTS FOR EXTENDED PRECISION AND CHANGES    * K2600070
                    *     THE NAME CODES FOR THE AFFECTED SUBROUTINES * K2600080
                    *     TO REFLECT THIS CONDITION                   * K2600090
                    *   * CONVERTS THE COMPILED STATEMENT STRING TO   * K2600100
                    *     OUTPUT CODE AND STORES IT IN THE BUFFER AREA* K2600110
                    *   * PUTS DATA FROM THE BUFFER INTO WORKING      * K2600120
                    *     STORAGE ON THE DISK                         * K2600130
                    *                                                 * K2600140
                    *INPUT-THE STMNT STRING, SYMBOL TABLE, FCOM AND   * K2600150
                    *   THE DISK OUTPUT BUFFER FROM PREVIOUS PHASES   * K2600160
                    *                                                 * K2600170
                    *OUTPUT-                                          * K2600180
                    *   * WORKING STORAGE ON THE DISK CONTAINING      * K2600190
                    *     HEADER AND DATA RECORDS, REAL AND INTEGER   * K2600200
                    *     CONSTANTS AND OUTPUT FROM DEFINE FILE       * K2600210
                    *     STATEMENTS AND THE COMPILED PROGRAM         * K2600220
                    *                                                 * K2600230
                    *EXTERNAL REFERENCES-                             * K2600240
                    *   SUBROUTINES-                                  * K2600250
                    *      * ROL-A SUBROUTINE TO LOAD THE NEXT PHASE  * K2600260
                    *        OF THE COMPILER                          * K2600270
                    *      * DZ000-DISK WRITE SUBROUTINE              * K2600280
                    *   COMMA/DCOM                                    * K2600290
                    *      * $PHSE                                    * K2600300
                    *      * $DBSY                                    * K2600310
                    *      * $LINK                                    * K2600320
                    *                                                 * K2600330
                    *EXITS-                                           * K2600340
                    *   NORMAL-A CALL TO THE ROL ROUTINE BRINGS IN    * K2600350
                    *   THE NEXT PHASE                                * K2600360
                    *   ERROR-NONE                                    * K2600370
                    *                                                 * K2600380
                    *TABLES/WORK AREAS                                * K2600390
                    *   * INPUT STRING                                * K2600400
                    *   * SYMBOL TABLE                                * K2600410
                    *   * FCOM                                        * K2600420
                    *   * DISK OUTPUT BUFFER                          * K2600430
                    *                                                 * K2600440
                    *ATTRIBUTES-N/A                                   * K2600450
                    *                                                 * K2600460
                    *NOTES-                                           * K2600470
                    *   PROGRAM HEADER CONSISTS OF 12 WORDS IN THE    * K2600480
                    *   BUFFER AREA                                   * K2600490
                    *      WD 1 RESERVED                              * K2600500
                    *      WD 2 RESERVED                              * K2600510
                    *      WD 3 INTEGER TYPE, PRECISION               * K2600520
                    *      WD 4 OBJECT TIME PROGRAM LENGTH            * K2600530
                    *      WD 5 LENGTH OF COMMON                      * K2600540
                    *      WD 6 WD SIZE OF PROGRAM HEADER - 9 (=3)    * K2600550
                    *      WD 7 VAR. AREA WHEN NO DEFINE FILE STMNT   * K2600560
                    *      WD 8 LENGTH OF PROGRAM IN DISK BLOCKS      * K2600570
                    *      WD 9 NUMBER OF FILES DEFINED               * K2600580
                    *      WD10 PROGRAM NAME                          * K2600590
                    *      WD11 PROGRAM NAME                          * K2600600
                    *      WD12 EXECUTION ADDRESS                     * K2600610
                    *   DATA HEADER CONSISTS OF 4 WORDS (WD13-WD16)   * K2600620
                    *      WD13 ADDRESS OF NEXT DATA                  * K2600630
                    *      WD 14 NUMBER OF DATA WORDS                 * K2600640
                    *      WD15 FIRST INDICATOR WORD                  * K2600650
                    *      WD16 FIRST DATA WORD                       * K2600660
                    *   EVERY 8 WORDS OF DATA OR PROGRAM OUTPUT IS    * K2600670
                    *   PRECEDED BY AN INDICATOR WORD CONTAINING TWO  * K2600680
                    *   BITS OF INFORMATION FOR EACH OF THE SUCCESSIVE* K2600690
                    *   EIGHT WORDS.  THE TWO BITS HAVE THE FOLLOWING * K2600700
                    *   MEANINGS.                                     * K2600710
                    *      00 = ABSOLUTE INSTRUCTION OR DATA          * K2600720
                    *      01 = RELOCATABLE INSTRUCTION               * K2600730
                    *      10 = ONE WORD CALL                         * K2600740
                    *      11 = TWO WORD CALL                         * K2600750
                    *                                                 * K2600760
                    *************************************************** K2600770
                          HDNG    1130 FORTRAN COMPILER PHASE 26        K2600780
                    *                                                 * K2600790
                    *** NOTE- COMMENTS BEGIN IN COL. 44 ***             K2600800
                    *                                                   K2600810
                          ABS                                           K2600820
                    *             OUTPUT2                               K2600830
                    *                                                   K2600840
                    *             SYSTEM EQUATES                        K2600850
                    *                                                   K2600860
                    MEMRY EQU     /8000                                 K2600870
                    $PHSE EQU     /78        NO. OF PHASE NOW IN CORE   K2600880
                    ROL   EQU     MEMRY-68   LOC OF PROG TO RD NXT PH   K2600890
                    OVERL EQU     MEMRY-1501 START OF FCOM          2-4 K2600900
                    PHID  EQU     56         ID NUMBER THIS PHASE       K2600910
                    DZ000 EQU     /F2        DISKZ ENTRY POINT          K2600920
                    $DBSY EQU     /EE        NON-ZERO WHEN DISKZ BUSY   K2600930
                    $LINK EQU     /39      CALL LINK ENTRY POINT        K2600940
                    PHLEN EQU     3         NO SECTORS THIS PHASE       K2600945
                    *                                                   K2600950
                          ORG     OVERL                                 K2600960
                    *                                                   K2600970
                    *                  FORTRAN COMMUNICATION            K2600980
                    ORG   BSS     1    ORIGIN ADDRESS               2-4 K2600990
                    SOFS  BSS     1    START OF STRING                  K2601000
                    EOFS  BSS     1    END OF STRING                    K2601010
                    SOFST BSS     1    START OF SYMBOL TABLE            K2601020
                    *             AT END OF THIS PHASE                  K2601030
                    *             PROGRAM LENGTH, DISKBYTES             K2601040
                    *             MOVED TO /005C BY RECOVERY PHASE)     K2601050
                    SOFNS BSS     1    PROGR LENGTH AT OBJECT TIME      K2601060
                    *             (MOVED TO /005F BY RECOVERY PHASE)    K2601070
                    SOFXT BSS     1    SIZE OF WORK AREA                K2601080
                    SOFGT BSS     1    SIZE OF CONSTANTS AREA           K2601090
                    EOFST BSS     1    END OF SYMBOL TABLE              K2601100
                    COMON BSS     1    ENTRY POINT                      K2601110
                    CSIZE BSS     1    SIZE OF COMMON                   K2601120
                    ERROR BSS     1    OVERLAP ERROR                    K2601130
                    FNAME BSS     1                                     K2601140
                          BSS     1                                     K2601150
                    SORF  BSS     1    SUBROUTINE(-) OR FUNCTION(+)     K2601160
                    CCWD  BSS     1    CONTROL CARD WORD                K2601170
                    *               BIT 15 TRANSFER TRACE               K2601180
                    *               BIT 14 ARITHMETIC TRACE             K2601190
                    *               BIT 13 EXTENDED PRECISION           K2601200
                    *               BIT 12 LIST SYMBOL TABLE            K2601210
                    *               BIT 11 LIST SUBPROGRAM NAMES        K2601220
                    *               BIT 10 LIST SOURCE PROGRAM          K2601230
                    *               BIT  9 ONE WORD INTEGERS            K2601240
                    *               BIT  8 ORIGIN                   2-4 K2601250
                    IOCS  BSS     1    IOCS CONTROL CARD WORD           K2601260
                    *               BIT 15 CARD                         K2601270
                    *               BIT 14 PAPER TAPE                   K2601280
                    *               BIT 13 TYPEWRITER                   K2601290
                    *               BIT 12 1403 PRINTER                 K2601300
                    *               BIT 11 2501 READER                  K2601310
                    *               BIT 10 KEYBOARD                     K2601320
                    *               BIT  9 1442 PUNCH                   K2601330
                    *               BIT  8 DISK                         K2601340
                    *               BIT  7 1132 PRINTER                 K2601350
                    *               BIT  3 PLOTTER                      K2601360
                    *               BIT  1 UNFORMATTED DISK             K2601370
                    DFCNT BSS     1    FILE COUNT                       K2601380
                    *                                                   K2601390
                    *                                                   K2601400
                    *                  END OF FORTRAN COMMUNICATION     K2601410
                    *                  AREA                             K2601420
                    *************************************************** K2601430
                    *                                                   K2601440
                    *                                                   K2601450
                    *             BUFFER COMMUNICATIONS AREA            K2601460
                    *             AND BUFFER                            K2601470
                    *                                                   K2601480
                    *                                                   K2601490
                    *             RESERVED FOR COMMUNICATION            K2601500
                    *             BETWEEN PHASES                        K2601510
                    *             DISKOUT1 AND DISKOUT2                 K2601520
                    *             AS FOLLOWS                            K2601530
                    *                                                   K2601540
                          BSS     4                                     K2601550
                    *                                                   K2601560
                          BSS  E  0                                     K2601570
                    BUFCT BSS     1        BUFFERCOUNT                  K2601580
                    BUFPT BSS     1        BUFFERPOINTER                K2601590
                    INCT  BSS     1        INDICATOR COUNTER            K2601600
                    INPT  BSS     1        INDICATOR POINTER            K2601610
                    DHDRA BSS     1        DATAHEADER-ADDRESS           K2601620
                    LOCTR BSS     1        LOCATION COUNTER             K2601630
                    PRLGT BSS     1        PROGR LENGTH                 K2601640
                          BSS     1        NOT YET USED                 K2601650
                          BSS     1        SECTOR COUNT                 K2601660
                          BSS     1        SCRATCH SECTOR ADDR          K2601670
                    BUFF  BSS     340                               212 K2601680
                    WD1   EQU     BUFF                                  K2601690
                    WD2   EQU     BUFF+1                                K2601700
                    WD3   EQU     BUFF+2                                K2601710
                    *                                                   K2601720
                    *                                                   K2601730
                          ORG     BUFF+340  ORIGIN FOR THIS PHASE   212 K2601740
                    BPHAR EQU     *+2                                   K2601750
                          DC      0        LOADER WORK AREA             K2601760
                          DC      -56      -PHASE ID FOR SLET LOOKUP    K2601770
                          DC      NXTPH-*+1  TABLE FOR NEXT PHASE ENTRY K2601780
                          DC      1        ONE ENTRY TO BE SET BY LDR   K2601790
                          ORG     *-2                                   K2601800
                    *                                                   K2601810
                    NEQ   BSC  L  ENT      BR TO INITIALIZE PROGRAM     K2601820
                    *                                                   K2601830
                    *             INITIALIZTRANSFER VECTOR POINTER      K2601840
                    START SLA     0        NOP                          K2601850
                          LDX  L3 ZERO     SET UP POINTER TO CONSTANTS  K2601860
                    *                                                   K2601870
                          LD   L  CCWD       IS IT ABSOLUTE         2-4 K2601880
                          SLA     8          COMPILATION            2-4 K2601890
                          BSC     +Z         NO  -  SKIP            2-4 K2601900
                          STO   3 ORGSW-Z    YES - SET ORIGIN SW    2-4 K2601910
                    *                                                   K2601920
                    *             TEST IF EXTENDED PRECISION            K2601930
                    *                                                   K2601940
                          SLA     5        SHIFT EXTENDED PREC INDR     K2601950
                          BSC  L  Q1011,-  BR IF NOT EXTENDED PREC      K2601960
                    *                                                   K2601970
                    *             CHANGE SYSTEM SUBROUTINE NAMES        K2601980
                    *             SO THAT APPLICABLE NAMES BEGIN        K2601990
                    *             WITH E RATHER THAN WITH F             K2602000
                    *                                                   K2602010
                    *             CHANGE SUBROUTINE NAMES               K2602020
                    *             FAXIX THROUGH FADD                    K2602030
                    *                                                   K2602040
                          LDX   1 FAXIX-TABSS+2                         K2602050
                    Q1005 BSI     FTOE     CHANGE NEXT NAME             K2602060
                          MDX   1 -2       DECR COUNT ON NAMES          K2602070
                          MDX     Q1005    BR IF INDEX NOT ZERO         K2602080
                    *                                                   K2602090
                    *             CHANGE WCHRI TO VCHRI                 K2602100
                    *                                                   K2602110
                          LDX   1 FCHRI-TABSS+2                         K2602120
                          BSI     FTOE    CHANGE W TO V                 K2602130
                    *                                                   K2602140
                    *                                                   K2602150
                          LD    3 H0004-Z  DIFF IN SECOND CHAR          K2602160
                          STO     DIFF     BETWEEN E AND F TO CHG NAMES K2602170
                    *                                                   K2602180
                    *             CHANGE NAMES OF TRACE-ROUTINES        K2602190
                    *             TO HAVE SECOND CHARACTER 'E'          K2602200
                    *             INSTEAD OF 'F'                        K2602210
                    *                                                   K2602220
                          LDX   1 FARI-TABSS+2                          K2602230
                          BSI     FTOE     BR TO CHANGE MFAR TO MEAR    K2602240
                          LDX   1 FARIX-TABSS+2                         K2602250
                          BSI     FTOE     BR TO CHANGE MFARX TO MEARX  K2602260
                          LDX   1 FIF-TABSS+2                           K2602270
                          BSI     FTOE     BR TO CHANGE SFIX TO SEIX    K2602280
                          MDX     Q1011    BR PAST SUBROUTINE           K2602290
                    *                                                   K2602300
                    *                                                   K2602310
                    *             SUBROUTINE                            K2602320
                    *             CHANGE .F. IN 1ST OR 2ND CHARACTER OF K2602330
                    *             NAME INTO .E.                         K2602340
                    *             (OR E INTO V ETC)                     K2602350
                    *             (DISPLACEMENT IN NAME LIST = X1)      K2602360
                    *                                                   K2602370
                    FTOE  DC      0        LINK ENTRY POINT             K2602380
                          LD   L1 TABSS-2  LOAD ENTRY FR TBL RLTV XR1   K2602390
                          S       DIFF     SUBTRACT CHARACTER DIFF      K2602400
                          STO  L1 TABSS-2  SAVE NEW NAME                K2602410
                          BSC  I  FTOE     RETURN                       K2602420
                    *                                                   K2602430
                    *             CONSTANTS                             K2602440
                    *                                                   K2602450
                    DIFF  DC      /0100    DIFF BETWEEN .E. AND .F. IN  K2602460
                    *                      FIRST CHARACTER OF A NAME    K2602470
                    *                                                   K2602480
                    Q201A LDX  I1 SOFS     INITIALIZE INPUT POINTER     K2602490
                    Q1011 EQU     Q201A                                 K2602500
                    *                                                   K2602510
                          LDX  L3 ZERO     RESTORE CONSTANT POINTER     K2602520
                    *                                                   K2602530
                          MDX   1 -1                                    K2602540
                    Q2012 BSI   3 INIT-Z   INITIALIZE NEXT STATEMENT    K2602550
                          LD    3 STOID-Z  LOAD STORED ID TYPE          K2602560
                    *                                                   K2602570
                    *             SPOT FOR TEST STOP                    K2602580
                          SLA     0        NOP                          K2602590
                    *                                                   K2602600
                          S     3 IDFOR-Z  TEST FOR FORMAT STATEMENT    K2602610
                          BSC  L  Q2013,+- BR IF FORMAT                 K2602620
                    *                                                   K2602630
                          S     3 IDDEF-Z  TEST FOR DEFINE FILE STMNT   K2602640
                          BSC  L  Q2101,+- BR IF DEFINE FILE            K2602650
                          S     3 IDDAT-Z  TEST FOR DATA STATEMENT      K2602660
                          BSC  L  Q2101,+- BR IF DATA STATEMENT         K2602670
                          S     3 IDCAL-Z  TEST FOR CALL LINK/EXIT      K2602680
                          BSC  L  Q2201,+- BR IF CALL LINK/EXIT         K2602690
                          MDX     Q3011    BR IF NOT ABOVE STMNT TYPES  K2602700
                    *                                                   K2602710
                    *             OUTP FORMAT STMT                      K2602720
                    Q2013 BSI   3 INCPT-Z  INCR INPUT POINTER           K2602730
                    Q2014 LD    1 0        LOAD STRING WORD             K2602740
                          BSI   3 OUABS-Z  SUBR OUTPUT, ENTRY = ABS     K2602750
                          LD    3 WCNT-Z   TEST WORD COUNT              K2602760
                          BSC  L  Q2013,Z- BR IF WORD COUNT IS POSITIVE K2602770
                          MDX     Q2012    BR IF COUNTER IS ZERO        K2602780
                    *                                                   K2602790
                    *             MOVE POINTER WITHOUT OUTPUT           K2602800
                    *             (DATA, DEFINE FILE HAVE ALREADY       K2602810
                    *             BEEN OUPUT)                           K2602820
                    *                                                   K2602830
                    Q2101 SLA     0        NOP                          K2602840
                          BSI   3 INCPT-Z  BR TO INCR I/P POINTER       K2602850
                          LD    3 WCNT-Z   LOAD WORD COUNT              K2602860
                          BSC  L  Q2101,Z- BR IF WORD COUNT IS POSITIVE K2602870
                          MDX     Q2012    BR IF ZERO (END OF STMNT)    K2602880
                    *                                                   K2602890
                    *             SPECIAL OUTPUT OF                     K2602900
                    *             CALL LINK OR CALL EXIT                K2602910
                    *                                                   K2602920
                    *                                                   K2602930
                    *             TEST IF CALLLINK OR CALLEXIT          K2602940
                    *                                                   K2602950
                    Q2201 LD    1 1        LOAD DATA WORD               K2602960
                          S     3 H5B00-Z  TEST CALL LINK FLAG          K2602970
                          BSC  L  Q3011,Z   BR IF NOT CALL LINK         K2602980
                    *                                                   K2602990
                    *             OUTPUT CALL LINK                      K2603000
                    Q2211 LD   L  BSIL     OUTPUT .BSI L.               K2603010
                          BSI   3 OUABS-Z  *                            K2603020
                          LD    3 CLINK-Z  OUTPUT ADDRESS OF LINK       K2603030
                          BSI   3 OUABS-Z  *                            K2603040
                          LD    1 2        OUTPUT NAME WORD 1           K2603050
                          SLA     1        *                            K2603060
                          SRA     2        *                            K2603070
                          BSI   3 OUABS-Z  *                            K2603080
                          LD    1 4        OUTPUT NAME WORD 2           K2603090
                          SRT     15       *                            K2603100
                          LD    1 2        *                            K2603110
                          SLT     15       *                            K2603120
                          BSI   3 OUABS-Z  *                            K2603130
                          MDX     Q2101    CONTINUE                     K2603140
                    *                                                   K2603150
                    *                                                   K2603160
                    *             .NXT.                                 K2603170
                    *             PROCESS STATEMENTS OTHER THAN         K2603180
                    *             FORMAT, DEFINE FILE, DATA AND         K2603190
                    *             CALL LINK/EXIT STATEMENTS             K2603200
                    *                                                   K2603210
                    Q3011 LD    3 WCNT-Z   LOAD WORD COUNTER            K2603220
                          BSC     Z-       SKIP IF WORDCOUNTER NOT POS  K2603230
                          MDX     Q3013    BR IF POSITIVE               K2603240
                          LD    3 STOID-Z  LOAD STORED ID WORD TYPE     K2603250
                          S     3 IDEND-Z  TEST IF END STATEMENT        K2603260
                          BSC     Z        SKIP IF STORED ID = .END.    K2603270
                          MDX     Q2012    BR IF NOT                    K2603280
                    *                                                   K2603290
                          BSC  L  OUTER    TERMINATE OUTPUT             K2603300
                    *                                                   K2603310
                    *                                                   K2603320
                    Q3013 BSI   3 INCPT-Z  INCR INPUT POINTER           K2603330
                    Q3014 LD    1 0        LOAD WORD FROM I/P STRING    K2603340
                          BSC     -        SKIP IF .PACKED. WORD        K2603350
                          MDX     Q4011    BR IF NOT                    K2603360
                    Q3021 LD    1 0        LOAD WORD FROM I/P STRING    K2603370
                          AND   3 H7800-Z  GET INDEX TO INSTRUCTION TBL K2603380
                          BSC  L  Q3023,+- BR IF NO INSTR INCLUDED      K2603390
                    *                      =WORD CONSISTS OF ADDR ONLY  K2603400
                          SRA     11       RIGHT JUSTIFY INDEX          K2603410
                          A     3 CON4B-Z  4-BIT-CONV-TABLE ORIGIN      K2603420
                          STO     Q3022+1  COMPUTE ADDR OF INST IN TBL  K2603430
                    Q3022 LD   L  *-*      LOAD INST FROM TBL (TAB4)    K2603440
                          BSI   3 OUABS-Z  SUBR OUTPUT, ENTRY = ABS     K2603450
                    Q3023 LD    1 0        LOAD WORD FROM I/P STRING    K2603460
                          BSI   3 GETST-Z  GET OBJ TIME ADDR FR SYM TBL K2603470
                          BSI   3 OUREL-Z  SUBR OUTPUT, ENTRY = RLTV    K2603480
                          MDX     Q3011    CONTINUE PROCESSING          K2603490
                    *                                                   K2603500
                    *             TEST IF SPECIAL BSC (ONE WHICH IS     K2603510
                    *             FOLLOWED BY A RELATIVE ADDRESS).      K2603520
                    *                                                   K2603530
                    Q4011 S     3 H5D00-Z  .SPEC BSC L.                 K2603540
                          BSC     +-       SKIP IF NOT .SPEC BSC L.     K2603550
                          MDX     Q4021    BR IF SPEC BSC L             K2603560
                    *                                                   K2603570
                          S     3 HFF00-Z  .BSC I1. - .SPEC BSC L.      K2603580
                          BSC     Z        SKIP IF .BSC I1.             K2603590
                          MDX     Q4031    BR IF NOT                    K2603600
                          LD    3 H4D80-Z  OBJECT TIME .BSC I1. TO ACC  K2603610
                          BSI   3 OUABS-Z  SUBR OUTPUT, ENTRY = ABS     K2603620
                          BSI   3 INCPT-Z  INCREMENT INPUT POINTER      K2603630
                          LD   L  LOCTR    LOCATION COUNTER             K2603640
                    *                                                   K2603650
                    Q4012 BSI   3 OURNC-Z  SUBR OUTPUT, ENTRY=RLTV      K2603660
                          MDX     Q3011                                 K2603670
                    *                                                   K2603680
                    *             SPECIAL BSC L ENCOUNTERED             K2603690
                    *             IS FOLLOWED BY A RELATIVE ADDRESS     K2603700
                    *             RATHER THAN BY A SYMBOL TABLE NAME    K2603710
                    *                                                   K2603720
                    Q4021 LD    3 H4C08-Z  OBJ TIME .BSC L. TO ACC      K2603730
                          BSI   3 OUABS-Z  SUBR OUTPUT, ENTRY = ABS     K2603740
                          BSI   3 INCPT-Z  INCR INPUT POINTER           K2603750
                          LD    1 0        OUTPUT RLTV ADDR FR STRING   K2603760
                          MDX     Q4012    BR TO OUTPUT ROUTINE         K2603770
                    *                                                   K2603780
                    *             TEST IF .LDX L1.                      K2603790
                    *             WHICH IS FOLLOWED BY AN ABSOLUTE      K2603800
                    *             VALUE AND OUTPUT .LDX L1. FOLLOWED    K2603810
                    *             BY THE ABSOLUTE VALUE                 K2603820
                    *                                                   K2603830
                    Q4031 LD    1 0        LOAD WORD FROM I/P STRING    K2603840
                          S     3 H5B00-Z  SUBTRACT CODE FOR .LDX L1.   K2603850
                          BSC     Z        SKIP IF .LDX L1.             K2603860
                          MDX     Q4041    BR IF NOT                    K2603870
                          LD   L  LDXL1    OUTPUT .LDX L1.              K2603880
                          BSI   3 OUABS-Z  OUTPUT IN ABS MODE           K2603890
                          SLA     16       CLEAR ACC                    K2603900
                          S     1 1        CHANGE SIGN OF STRING WD     K2603910
                          BSI   3 OUABS-Z  OUTPUT FOLLOWING WD IN ABS   K2603920
                          BSI   3 INCPT-Z  INCR INPUT POINTER           K2603930
                          MDX     Q3011    CONTINUE THROUGH STRING      K2603940
                    *                                                   K2603950
                    *             TEST IF .BSC I.                       K2603960
                    *             (WHICH REQUIRES OUTPUT OF ENTRY ADDR) K2603970
                    *                                                   K2603980
                    Q4041 LD    1 0        LOAD WORD FROM I/P STRING    K2603990
                          S     3 H5080-Z  SUBTRACT .BSC I. CONSTANT    K2604000
                          BSC  L  Q5011,Z  BR IF NOT BSC I              K2604010
                          LD    3 H4C80-Z  OUTPUT .BSC I.               K2604020
                          BSI   3 OUABS-Z  IN ABSOLUTE MODE             K2604030
                          LD   L  COMON    OUTPUT ENTRY ADDR            K2604040
                    Q4042 BSI   3 OURNC-Z  (ADDR OF OBJECT TIME LINK WD K2604050
                          BSI   3 INCPT-Z  INCREMENT INPUT POINTER      K2604060
                          MDX     Q3011    CONTINUE                     K2604070
                    *                                                   K2604080
                    *             TEST IF TWO-WORD CALL OPERATOR        K2604090
                    Q5011 LD    1 0        LOAD WORD FROM INPUT STRING  K2604100
                          AND   3 HFF80-Z  TEST BITS 0-8                K2604110
                          BSC     Z        SKIP IF .CALL SUBPROGR.      K2604120
                          MDX     Q7011    BR IF NOT                    K2604130
                    *                                                   K2604140
                    *             TWO-WORD CALL                         K2604150
                          LD    1 1        LOAD SECOND WORD OF CALL     K2604160
                          BSI   3 GETST-Z  GET OBJ TIME ADDR (OR NAME)  K2604170
                          BSI   3 OULCL-Z  SUBR O/P, ENTRY = 2-WD CALL  K2604180
                          BSI   3 INCPT-Z  INCREMENT INPUT COUNTER      K2604190
                          MDX     Q3011    CONTINUE THROUGH STRING      K2604200
                    *                                                   K2604210
                    *             TEST IF SYST SUBROUTINE CALL          K2604220
                    Q7011 LD    1 0        LOAD STRING WORD             K2604230
                          SLA     1        TEST BIT 1 FOR CALL          K2604240
                          BSC     +Z       SKIP IF SYST.CALL            K2604250
                          MDX     Q7021    BR IF NOT                    K2604260
                    *                                                   K2604270
                    *             OUTPUT SYSTEM SUBROUTINE CALL         K2604280
                    *             (ONE-WORD CALL)                       K2604290
                    *                                                   K2604300
                          SRA     7        SHIFT POINTER SYST SUBR TBL  K2604310
                          A     3 SSTOR-Z  COMPUTE ADDRESS IN SYSTEM    K2604320
                          STO     Q7012+1  SUBROUTINE TABLE AND INSERT  K2604330
                    *                                                   K2604340
                    Q7012 LD   L  *-*      LOAD WD2 FROM SYST SUBR TBL  K2604350
                          RTE     16       PUT IN EXTENSION             K2604360
                          MDX  L  Q7012+1,-1 DECR ADDR SYSTEM SUBR TBL  K2604370
                          SLA     0        NOP                          K2604380
                          LD   I  Q7012+1  LOAD WD1 FROM SYST SUBR TBL  K2604390
                          BSI   3 OUCAL-Z  SUBR.OUTPUT,ENTRY = CALL     K2604400
                    *                                                   K2604410
                    *             TEST WHETHER OUTPUT SUBR CALL WAS     K2604420
                    *             .SUBSC. OR .SUBIN.                    K2604430
                    *             .FIOAF. OR .FIOAI.                    K2604440
                    *             ARGUMENTS OF THESE CALLS              K2604450
                    *             REQUIRE SPECIAL TREATMENT             K2604460
                    *             (SUBROUTINES HAVE BOTH ABSOLUTE       K2604470
                    *             AND RELATIVE ARGUMENTS)               K2604480
                          LD    1 0        LOAD WORD FROM STRING        K2604490
                          S     3 H1D00-Z  TEST FOR .CALL SUBIN.        K2604500
                          BSC  L  Q7051,+- BR IF .CALL SUBIN.           K2604510
                          LD    1 0        LOAD WORD FROM STRING        K2604520
                          S     3 CSUBS-Z  TEST FOR .CALL SUBSC.        K2604530
                          BSC  L  Q8011,+- BR IF .CALL SUBSC.           K2604540
                          LD    1 0        LOAD WORD FROM STRING        K2604550
                          S     3 M1600-Z  TEST FOR .CALL SIOAI.        K2604560
                          BSC     Z        SKIP IF .CALL SIOAI.         K2604570
                          S     3 M1680-Z  TEST FOR .CALL SIOAF.        K2604580
                          BSC     Z        SKIP IF EITHER SPECIAL CALL  K2604590
                          S     3 M2400-Z  TEST FOR .CALL SDAF.         K2604600
                          BSC     Z        SKIP IF EITHER SPECIAL CALL  K2604610
                          S     3 M2380-Z  TEST FOR .CALL SDAI.         K2604620
                          BSC     Z        SKIP IF EITHER SPECIAL CALL  K2604630
                          S     3 M1E00-Z  TEST FOR .CALL UIOAI.        K2604640
                          BSC     Z        SKIP IF EITHER SPECIAL CALL  K2604650
                          S     3 M1E80-Z  TEST FOR .CALL UIOAF.        K2604660
                          BSC  L  Q8051,+- BR IF ANY OF ABOVE FOUND     K2604670
                    *                                                   K2604680
                    *                      (NO SPECIAL TREATMENT REQ.)  K2604690
                          BSC  L  Q3011    BR TO NEXT ITEM ON STRING    K2604700
                    *                                                   K2604710
                    *             NO SYSTEM SUBROUTINE CALLS FOUND      K2604720
                    *             TEST NEXT FOR .STX L1. CODE           K2604730
                    *                                                   K2604740
                    Q7021 LD    1 0        LOAD WORD FROM STRING        K2604750
                          S     3 H6200-Z  TEST FOR .STX L1.            K2604760
                          BSC  L  Q7031,+- BR IF 'STX L1'               K2604770
                    *                                                   K2604780
                    *             NO SPECIAL TREATMENT REQUIRED         K2604790
                    *             CONVERT ONE WORD OF PRE-OUTPUT CODE   K2604800
                    *             INTO OBJECT TIME-INSTRUCTION,         K2604810
                    *             OUTPUT .ABSOLUTE.                     K2604820
                    *                                                   K2604830
                    *             COMPUTE 6-BIT CONVERSION              K2604840
                          LD    1 0        LOAD WORD FROM STRING        K2604850
                          AND   3 H3F00-Z  GET BITS 2-7=RLTV TBL ADDR   K2604860
                          SRA     8        RIGHT JUSTIFY                K2604870
                          A     3 CON4B-Z  ADD TO ADDR CONVERSION TBL   K2604880
                          STO     Q7022+1  TO COMPUTE ADDR TO LOAD      K2604890
                          LD    1 0        LOAD STRING WORD             K2604900
                          AND   3 H00FF-Z  GET OUTPUT STORAGE ADDR      K2604910
                    Q7022 A    L  *-*      TABLE VALUE                  K2604920
                          BSI   3 OUABS-Z  SUBR OUTPUT, ENTRY = ABS     K2604930
                          BSC  L  Q3011    BR TO NEXT ITEM ON STRING    K2604940
                    *                                                   K2604950
                    *                                                   K2604960
                    Q7031 LD   L  STXL1    OUTPUT .STX L1.              K2604970
                          BSI   3 OUABS-Z  IN ABSOLUTE MODE             K2604980
                          BSI   3 INCPT-Z  INCR INPUT COUNTER           K2604990
                          LD    1 0        LOAD STRING WORD             K2605000
                          AND   3 H7FFF-Z  OUTPUT * + DISPLACEMENT      K2605010
                          A    L  LOCTR    INCR BY LOC COUNTER          K2605020
                          STO   1 0        (STORE FOR DUMP  F TEST)     K2605030
                          BSI   3 OURNC-Z  PUT OUT RELATIVE OUTPUT      K2605040
                          BSC  L  Q3011    CONTINUE THROUGH STRING      K2605050
                    *                                                   K2605060
                    *             OUTPUT ARGUMENTS OF .CALL SUBIN.      K2605070
                    Q7051 BSI   3 INCPT-Z  INCR INPUT POINTER           K2605080
                          LD    1 0        LOAD STRING WORD             K2605090
                          BSC  L  Q7055,+Z BR IF (TAGGED) ADDRESS       K2605100
                    *                                                   K2605110
                    *             OUTPUT DELIMITOR, ONE OR ZERO         K2605120
                          BSI   3 OUABS-Z  IN ABSOLUTE MODE             K2605130
                          LD    1 0        LOAD STRING WORD             K2605140
                          BSC  L  Q7051,+- BR IF DELIMETER = ZERO       K2605150
                          SRA     1        SHIFT OFF LOW ORDER BIT      K2605160
                          BSC  L  Q3011,+- BR IF = ONE                  K2605170
                    *                                                   K2605180
                          WAIT             PAUSE, PROGRAM               K2605190
                          MDX     *-2      ERROR IF NEITHER             K2605200
                    *                                                   K2605210
                    Q7055 AND   3 H7FFF-Z  REMOVE .TAG.                 K2605220
                          BSI   3 OURNC-Z  OUTPUT RELATIVE              K2605230
                    *                      (WITHOUT .COMMON-CHECK.)     K2605240
                          MDX     Q7051    BR TO OUTPUT ARGUMENTS       K2605250
                    *                                                   K2605260
                    *             OUTPUT ARGUMENTS OF                   K2605270
                    *             .CALL SUBSC.                          K2605280
                    Q8011 LD    1 1        LOAD STRING WORD +1          K2605290
                          BSI   3 GETST-Z  GET OBJ TIME ADDR OF SGT     K2605300
                          BSI   3 OUREL-Z  SUBR OUTPUT, ENTRY = RLTV    K2605310
                          LD    1 2        ACC=STRING WORD+2 (D4)       K2605320
                          BSI   3 OUABS-Z  SUBR OUTPUT, ENTRY = ABS     K2605330
                          BSI   3 INCPT-Z  INCR I/P POINTER 1 TIME      K2605340
                          BSI   3 INCPT-Z  INCR I/P POINTER 2 TIMES     K2605350
                          BSI   3 INCPT-Z  INCR I/P POINTER 3 TIMES     K2605360
                    Q8021 LD    1 0        LOAD STRING WORD             K2605370
                          BSI   3 GETST-Z  GET OBJ TIME ADDR            K2605380
                          BSI   3 OUREL-Z  SUBR OUTPUT, ENTRY = RLTV    K2605390
                          LD    1 1        D1 (OR D2 OR D3) TO ACC      K2605400
                          BSI   3 OUABS-Z  SUBR OUTPUT, ENTRY = ABS     K2605410
                          BSI   3 INCPT-Z  INCR I/P POINTER 1 TIME      K2605420
                          BSI   3 INCPT-Z  INCR I/P POINTER 2 TIMES     K2605430
                          LD    1 -1       LOAD PREVIOUS WORD           K2605440
                          BSC  L  Q3014,+Z BR IF PREVIOUS O/P TAGGED    K2605450
                          MDX     Q8021    BR IF NOT                    K2605460
                    *                                                   K2605470
                    *             OUTPUT ARGUMENTS OF                   K2605480
                    *             .CALL FIOAX. OR .CALL FIOIX.          K2605490
                    *                                                   K2605500
                    Q8051 LD    1 1        LOAD 2ND STRING WORD         K2605510
                          BSI   3 GETST-Z  GET OBJECT TIME ADDR         K2605520
                          BSI   3 OUREL-Z  SUBR OUTPUT, ENTRY = RLTV    K2605530
                          LD    1 2        ARRAY SIZE                   K2605540
                          AND   3 H7FFF-Z  REMOVE SIGN                  K2605550
                          BSI   3 OUABS-Z  SUBR OUTPUT, ENTRY = ABS     K2605560
                          BSI   3 INCPT-Z  INCR INPUT POINTER           K2605570
                          BSI   3 INCPT-Z  INCR INPUT POINTER AGAIN     K2605580
                          BSC  L  Q3011    BR TO PROCESS NEXT WORD      K2605590
                    *                                                   K2605600
                          BSS  E  0                                     K2605610
                    WR900 DC      /7001    WRITE DISK PARAMETER         K2605620
                          DC      BUFF-2   DISK BUFFER AREA             K2605630
                    ENDLZ DC      /63F0    END OF WS TEST CONSTANT      K2605640
                    *             WRITE DISK                            K2605650
                    WRITE DC      0        LINK                         K2605660
                    *                                                   K2605670
                    *             CORRECTION OF WORDCOUNT               K2605680
                    *             IN DATAHEADER                         K2605690
                    *             WHEN 'NEW' INDICATORWORD              K2605700
                    *             HAS BEEN RESERVED                     K2605710
                          LD   L  INCT     LOAD INDICATOR WD COUNT      K2605720
                          S     3 C16-Z                                 K2605730
                    WRITX BSC  L  WRIT0,Z  BR IF NOT 'EMPTY' INDIC-WD   K2605740
                    *             PRECEDING INSTRUCTION IS CHANGED      K2605750
                    *             INTO UNCOUNDITIONAL BRANCH            K2605760
                    *             WHEN WRITING LAST SECTOR OF           K2605770
                    *             COMPILED PROGRAM                      K2605780
                          LD   I  PCT0+1   CORRECT WORD COUNT           K2605790
                          S     3 ONE-Z    IN DATA HEADER               K2605800
                          STO  I  PCT0+1                                K2605810
                    *                                                   K2605820
                    *                                                   K2605830
                    WRIT0 LD   L  BUFF-1   CHECK SECTOR ADDRESS         K2605840
                          SLA     4        SHIFT OFF HIGH ORDER BITS    K2605850
                          S       ENDLZ    TEST END OF WORKING STORAGE  K2605860
                          BSC  L  NOWS,-   BRANCH - NO MORE W.S.        K2605870
                          LDD     WR900    LOAD DISK WRITE PARAMETER    K2605880
                          BSI  L  DZ000    WRITE SECTOR ONTO DISK       K2605890
                          MDX  L  $DBSY,0  SKIP IF DISK READY           K2605900
                          MDX     *-3      LOOP IF DISK BUSY            K2605910
                    *                                                   K2605920
                          LD   L  INPT                                  K2605930
                          S     3 C320-Z   DECR INDIC POINTER           K2605940
                          STO  L  INPT                                  K2605950
                          LD   L  BUFPT                                 K2605960
                          S     3 C320-Z   DECR BUFFERPOINTER           K2605970
                          STO  L  BUFPT                                 K2605980
                    *                                                   K2605990
                    *             MOVE BUFFER TAIL TO FRONT OF          K2606000
                    *             NEXT BUFFER                           K2606010
                    *                                                   K2606020
                          LDX   3 24       SET UP 24 WORD MOVE          K2606030
                    MOV1  LD   L3 BUFF+319 MOVE LAST PART OF BUFFER     K2606040
                          STO  L3 BUFF-1   TO START OF BUFFER O/P AREA  K2606050
                          MDX   3 -1       COUNT                        K2606060
                          MDX     MOV1     BR IF NO SKIP                K2606070
                          LDX  L3 ZERO     RESTORE XR3 (CONSTANTS)      K2606080
                    *                                                   K2606090
                          MDX  L  BUFF-1,1 INCR SECTORADDR,SCRATCHAREA  K2606100
                    *                                                   K2606110
                          LD   L  PCT1+1  LOAD DUMMY ADDRESS            K2606120
                          STO  L  PCT0+1  STORE IN UPDATE LOCATION      K2606130
                    *                                                   K2606140
                          BSC  I  WRITE    RETURN                       K2606150
                    *                                                   K2606160
                    NOWS  LDX   1 1        CALL RECOVERY - NO WS        K2606170
                          STX  L1 SOFS-1                                K2606180
                          LDX  I1 NXTPH+1  LOAD PARAM FOR READING       K2606190
                          LDD  L  NXTPH+2  NEXT PHASE                   K2606200
                          BSC  L  ROL      GO TO READ NEXT PHASE        K2606210
                    *                                                   K2606220
                    *                                                   K2606230
                    *                                                   K2606240
                    DC20  DC      20       CONSTANT                     K2606250
                    BUFAD DC      BUFF     ADDR OF BUFFER               K2606260
                    DC36  DC      36       CONSTANT                     K2606270
                    TEN   DC      10       CONSTANT                     K2606280
                    *                                                   K2606290
                    M1600 DC      /1600    SIOAI                        K2606300
                    M1680 DC      /1680-/1600    SIOAF-SIOAI            K2606310
                    H1D00 DC      /1D00    CONSTANT MASK                K2606320
                    H7FFF DC      /7FFF    CONSTANT MASK                K2606330
                    H5B00 DC      /5B00    .LDX L1.                     K2606340
                    *                                                   K2606350
                    CD16  DC      /0010    .ONE. IN WORDCOUNT, -12      K2606360
                    *                      * ALSO INITIAL VALUE         K2606370
                    *                                                   K2606380
                    TEMP1 DC      0        TEMPORARY STORAGE            K2606390
                    TEMP2 DC      0        TEMPORARY STORAGE            K2606400
                    H2000 DC      /2000    MASK FOR COMMON              K2606410
                    H4C80 DC      /4C80    CONSTANT MASK                K2606420
                    H5080 DC      /5080    CONSTANT MASK                K2606430
                    H6200 DC      /6200    CONSTANT MASK                K2606440
                    *                                                   K2606450
                    ZERO  DC      /0000    CONST ZERO            0      K2606460
                    Z     EQU     ZERO                                  K2606470
                    *                                                   K2606480
                    *             ZERO = ORIGIN OF TRANSFVECTOR         K2606490
                    ONE   DC      /0001    CONST ONE                    K2606500
                    TWO   DC      /0002    CONST TWO                    K2606510
                    THREE DC      /0003    CONST THREE                  K2606520
                    FOUR  DC      /0004    CONST FOUR                   K2606530
                    H0004 EQU     FOUR                                  K2606540
                    IDFOR DC      /6000    ID = .FORMAT.         7      K2606550
                    IDEND DC      /1000    ID = .END.            9      K2606560
                    H7800 DC      /7800    CONSTANT MASK                K2606570
                    CON4B DC      TAB4-1   CONV-TABL-ORIGIN             K2606580
                    H5D00 DC      /5D00    .SPEC BSC L.         12      K2606590
                    H4D80 DC      /4D80    OBJ.TIME 'BSC L1'            K2606600
                    HFF00 DC      /FF00    .BSC I1. - .SPECBSC. 14      K2606610
                    BFEND DC      BUFF+320 END OF OUTPUT BUFFER         K2606620
                    H4C08 DC      /4C08    OBJ.TIME .BSC L1.    17      K2606630
                    CSUBS DC      /1900    CALL SUBSCRIPT               K2606640
                    SSTOR DC      TABSS-1  SYSTEM SUBR TABLE ORIGIN     K2606650
                    H3F00 DC      /3F00    MASK F CONVERSION            K2606660
                    H00FF DC      /00FF    CONSTANT MASK                K2606670
                    H07FF DC      /07FF    CONSTANT MASK                K2606680
                    HF800 DC      /F800    CONSTANT MASK                K2606690
                    C320  DC      320      CONSTANT                     K2606700
                    HFF80 DC      /FF80    CONSTANT MASK                K2606710
                    H0005 DC      /0005    CONSTANT MASK                K2606720
                    H07FC DC      /07FC    CONSTANT MASK                K2606730
                    M2400 DC      /2400-/1680    SDAF-SIOAF CONSTANT    K2606740
                    M2380 DC      /2380-/2400    SDAI-SDAF  CONSTANT    K2606750
                    M1E00 DC      /1E00-/2380    UIOAI-SDAI CONSTANT    K2606760
                    M1E80 DC      /1E80-/1E00    UIOAF-UIOAI CONSTANT   K2606770
                    C16   DC      16       CONSTANT                     K2606780
                    SWISH DC      0        ANOTHER CALL INDICATOR       K2606790
                    *                                                   K2606800
                          BSS  E  0                                     K2606810
                    STONA DC      0        STORED NAME                  K2606820
                          DC      0                                     K2606830
                    WCNT  DC      0        WORD COUNTER F. STMT  8      K2606840
                    STOID DC      0        STORED ID-TYPE        6      K2606850
                    TWOWC DC      0        TWO WORD CALL SWITCH         K2606860
                    *                                                   K2606870
                    IDDEF DC      /F000-/6000    DEFINE FILE CONSTANT I K2606880
                    IDDAT DC      /F800-/F000    DATA CONSTANT ID       K2606890
                    IDCAL DC      /E000-/F800    CALL CONSTANT ID       K2606900
                    H4000 DC      /4000    CONSTANT MASK                K2606910
                    CLINK DC      $LINK    .CALL LINK. ENTRY ADDRESS    K2606920
                    ORGSW DC      0          ORIGIN SWITCH          2-4 K2606930
                    *                                                   K2606940
                    *                                                   K2606950
                    *                                                   K2606960
                    *             SUBROUTINE                            K2606970
                    *             INCREMENT INPUT POINTER               K2606980
                    *                                                   K2606990
                    INCPT DC      0        LINK                         K2607000
                          MDX   1 1        INCR INPUT POINTER           K2607010
                          MDX  L  WCNT,-4  DECR WD COUNTER              K2607020
                          SLA     0        GUARDS AGAINST SKIP          K2607030
                          BSC  I  INCPT    RETURN                       K2607040
                    *                                                   K2607050
                    *             SUBROUTINE                            K2607060
                    *             GET OBJ.TIME ADDR OR ALPHABETIC       K2607070
                    *             NAME FROM SYMBOL TABLE                K2607080
                    *             ON ENTRY, THE ACCUMULATOR CONTAINS    K2607090
                    *             THE SYMBOL TABLE REFERENCE WORD       K2607100
                    *                                                   K2607110
                    GETST DC      0        LINK ENTRY POINT             K2607120
                          AND   3 H07FF-Z  GET RLTV ENTRY PT IN SYM TBL K2607130
                          BSC  I  GETST,+-  RETURN IF ZERO          2-6 K2607135
                          STO     GET1+1   SET UP AS ADDR               K2607140
                          LD   L  SOFST    LOAD START OF SYMBOL TABLE   K2607150
                          S       GET1+1   SUBTRACT POINTER ONE TIME    K2607160
                          S       GET1+1   SUBTRACT POINTER SECOND TIME K2607170
                          S       GET1+1   SUBTRACT POINTER THIRD TIME  K2607180
                          A     3 H0005-Z  ADD 5 TO GIVE LOC OF 3RD WD  K2607190
                          STO     GET1+1   SAVE SYMBOL TABLE ADDR(WD 3) K2607200
                    GET1  LD   L  *-*      LOAD 3RD WORD SYMBOL TABLE   K2607210
                          RTE     16       PUT IN EXTENSION             K2607220
                          MDX  L  GET1+1,-1 DECR SYMBOL TABLE POINTER   K2607230
                          SLA     0        GUARDS AGAINST SKIP          K2607240
                          LD   I  GET1+1   LOAD 2ND SYM TBL WD IN ACC   K2607250
                          BSC  I  GETST    RETURN                       K2607260
                    *                                                   K2607270
                    *             SUBROUTINE                            K2607280
                    *             INITIALIZE NEXT STATEMENT             K2607290
                    *                                                   K2607300
                    INIT  DC      0        LINK ENTRY POINT             K2607310
                          BSI   3 INCPT-Z  INCR INPUT COUNTER           K2607320
                          LD    1 0        LOAD STRING WORD             K2607330
                          AND   3 H07FC-Z  EXTRACT AND STORE            K2607340
                          S     3 FOUR-Z   NORM - 1 WORD                K2607350
                          STO   3 WCNT-Z   WDCOUNTER                    K2607360
                          LD    1 0        LOAD STRING WORD             K2607370
                          AND   3 HF800-Z  MASK ALL BUT TYPE CODE ID WD K2607380
                          STO   3 STOID-Z  SAVE TYPE CODE               K2607390
                          BSC  I  INIT     RETURN                       K2607400
                    *                                                   K2607410
                    *                                                   K2607420
                    *             OUTPUT ADDRESS OR CONSTANT IN         K2607430
                    *             ABSOLUTE MODE                         K2607440
                    *             ENTRY = ABSOLUTE OUTPUT               K2607450
                    *                                                   K2607460
                    OUABS DC      0        LINK ENTRY POINT             K2607470
                          MDX     T8011    BR TO OUTPUT IN ABSOLUTE     K2607480
                    *                                                   K2607490
                    *             OUTPUT ADDRESS OR CONSTANT IN         K2607500
                    *             RELOCATABLE MODE EXCEPT FOR VARIABLES K2607510
                    *             IN COMMON WHICH WILL BE ABSOLUTE MODE K2607520
                    *             ENTRY = RELATIVE OUTPUT               K2607530
                    *             WITH .COMMON-CHECK.                   K2607540
                    *                                                   K2607550
                    OUREL DC      0        LINK ENTRY POINT             K2607560
                          MDX     T8013                                 K2607570
                    *                      BR TO OUTPUT IN RLTV MODE    K2607580
                    *             ENTRY = REALTIVE OUTPUT               K2607590
                    *             NO .COMMON-CHECK.                     K2607600
                    *                                                   K2607610
                    OURNC DC      0        LINK ENTRY POINT             K2607620
                          MDX     T7051    BR TO OUTPUT IN RLTV MODE    K2607630
                    *                                                   K2607640
                    *             ENTRY = CALL-OUTPUT                   K2607650
                    *             (ONE WORD CALL)                       K2607660
                    *                                                   K2607670
                    OUCAL DC      0        LINK ENTRY POINT             K2607680
                          MDX     T7011    BR TO OUTPUT ONE WD CALLS    K2607690
                    *                                                   K2607700
                    *             ENTRY FOR TWO-WORD-CALL-OUTPUT        K2607710
                    OULCL DC      0        LINK ENTRY POINT             K2607720
                          MDX     T7005    BR TO OUTPUT TWO WD CALLS    K2607730
                    *                                                   K2607740
                    *                                                   K2607750
                    *             TWO WORD CALL OUTPUT                  K2607760
                    *                                                   K2607770
                    T7005 STD   3 STONA-Z  STORE ACC AND EXTENSION      K2607780
                          LD    3 ZERO-Z   SECOND HALF CALL BITS        K2607790
                          STO   3 TEMP2-Z  SAVE IN TEMP STORAGE         K2607800
                    *                                                   K2607810
                    *             SET TWO WORD CALL SWITCH              K2607820
                          LD    3 ZERO-Z   LOAD ZERO (IND 2WD SW)       K2607830
                          STO   3 TWOWC-Z  SET 2 WD CALL SWITCH         K2607840
                          LD      OULCL    MOVE LINKWORD                K2607850
                    T7006 STO     OUCAL    SAVE IN RETURN WD AREA       K2607860
                          LD    3 THREE-Z  LOAD INDICATOR BITS          K2607870
                          STO   3 TEMP1-Z  SAVE IN TEMPORARY STORAGE    K2607880
                    *                                                   K2607890
                          MDX     T7013    BR TO MOVE BITS              K2607900
                    *                                                   K2607910
                    *             CALL-OUTPUT                           K2607920
                    T7011 STD   3 STONA-Z  STORE REGISTERS              K2607930
                          LD    3 ZERO-Z   LOAD 2ND HALF CALL BITS = 0  K2607940
                          STO   3 TEMP2-Z  SAVE IN TEMP STO             K2607950
                          LD    3 TWO-Z    LOAD 1ST HALF CALL BITS = 2  K2607960
                          STO   3 TEMP1-Z  SAVE IN TEMP STO             K2607970
                    *                                                   K2607980
                    *             SET TWO WORD CALL SWITCH              K2607990
                          STO   3 TWOWC-Z  TWO WD CALL SW SET TO NO     K2608000
                    T7013 STO   3 SWISH-Z  SET ANOTHER CALL INDICATOR   K2608010
                          LD    3 TEMP1-Z  CALL BITS (10 OR 11)         K2608020
                          BSI     IBITS    TO INDICATOR AREA            K2608030
                          LD    3 STONA-Z  FIRST HALF OF NAME           K2608040
                          BSI     TOBUF    MOVE TO BUFFER               K2608050
                          LD    3 TEMP2-Z  SEC HALF OF CALL BITS        K2608060
                    *                      (00 OR 11)                   K2608070
                          BSI     IBITS    TO INDICATOR AREA            K2608080
                    *                                                   K2608090
                    *             CHECK TWO WORD CALL SWITCH            K2608100
                          LD    3 TWOWC-Z  LOAD 2 WD CALL SWITCH        K2608110
                          BSC  L  T7014,+- BRANCH IF 2 WORD CALL        K2608120
                    *                                                   K2608130
                    *             COUNT ONE LOCATION LESS IF            K2608140
                    *             IT IS A ONE-WORD CALL                 K2608150
                    *                                                   K2608160
                          MDX  L  LOCTR,-1 DECR LOCATION COUNTER        K2608170
                          NOP              POSSIBLE SIGN CHANGE         K2608180
                    *                                                   K2608190
                    T7014 LD    3 STONA+1-Z SECOND HALF OF NAME         K2608200
                          BSI     TOBUF    MOVE TO BUFFER               K2608210
                          BSC  I  OUCAL    RETURN                       K2608220
                    *                                                   K2608230
                    *             RELATIVE OUTPUT, NO COMMON CHECK      K2608240
                    *                                                   K2608250
                    T7051 STD   3 STONA-Z  STORE REGISTERS              K2608260
                          LD      OURNC    LOAD LINK WORD PREV ENTRY PT K2608270
                          STO     OUREL    MOVE TO EXIT POINT           K2608280
                          MDX     T8015    BR TO PROCESS RELATIVE O/P   K2608290
                    *                                                   K2608300
                    *             ABSOLUTE OUTPUT                       K2608310
                    *                                                   K2608320
                    T8011 STD   3 STONA-Z  STORE REGISTERS              K2608330
                          LD    3 ZERO-Z   ZERO-ZERO                    K2608340
                          BSI     IBITS    TO INDICATOR AREA            K2608350
                    *                                                   K2608360
                    *             MOVE STORED ACCUMULATOR TO BUFFER     K2608370
                    *                                                   K2608380
                    T8012 LD    3 STONA-Z  LOAD OUTPUT WORD             K2608390
                          BSI     TOBUF    MOVE TO BUFFER               K2608400
                    *                                                   K2608410
                          BSC  I  OUABS    RETURN                       K2608420
                    *                                                   K2608430
                    *             RELATIVE OUTPUT (INCLUDES TEST        K2608440
                    *             WHETHER VARIABLE IS IN COMMON, IN     K2608450
                    *             WHICH CASE OUTPUT IS ABSOLUTE         K2608460
                    *                                                   K2608470
                    T8013 STD   3 STONA-Z  STORE REGISTERS              K2608480
                          LD   L  GET1+1   GET SYMBOL TABLE ADDRESS     K2608490
                          S     3 ONE-Z    MODIFY TO GET SYM TBL ID WD  K2608500
                          STO     T8014+1  SAVE ADDR OF SYM TBL ID WD   K2608510
                    T8014 LD   L  *-*      LOAD SYM TBL ID WORD         K2608520
                          AND   3 H2000-Z  MASK TO GET COMMON BIT ONLY  K2608530
                          BSC  L  T8015,+- BRANCH IF NOT IN COMMON      K2608540
                          LD    3 ZERO-Z   ZERO-ZERO F INDICATOR        K2608550
                          MDX     T8017    GO MOVE TO INDICATOR AREA    K2608560
                    *                                                   K2608570
                    T8015 LD    3 ORGSW-Z    IS IT ABSOLUTE         2-4 K2608580
                          BSC  L  T8016,+-   NO  - BRANCH           2-4 K2608590
                          LD    3 STONA-Z    YES - RELOCATE         2-4 K2608600
                          A    L  ORG        THIS                   2-4 K2608610
                          STO   3 STONA-Z    ADDRESS                2-4 K2608620
                          BSC  L  T8018,+Z   BRANCH TO ERR IF NEG   2-4 K2608630
                          LD    3 ZERO-Z     ZERO-ZERO TO IND BITS  2-4 K2608640
                          MDX     T8017      CONTINUE               2-4 K2608650
                    *                                                   K2608660
                    T8016 LD    3 ONE-Z    ZERO-ONE FOR INDICATOR BITS  K2608670
                    T8017 BSI     IBITS    MOVE TO INDICATOR AREA       K2608680
                          LD      OUREL    MOVE LINK TO RETURN EXIT     K2608690
                          STO     OUABS    SAVE LINK WD                 K2608700
                          MDX     T8012    BR TO O/P WD IN RLTV MODE    K2608710
                    *                                                   K2608720
                    T8018 MDX  L  ERROR,64   SET UP ERROR 86        2-4 K2608730
                          BSC  L  EXIT       EXIT                   2-4 K2608740
                    *                                                   K2608750
                    *             INDICATOR BITS                        K2608760
                    *             ACCUMULATOR CONTAINS BIT PATTERNS     K2608770
                    *             TO MASK INTO THE INDICATOR POINTER    K2608780
                    *             BASED ON SHIFTS SPECIFIED IN THE      K2608790
                    *             INDICATOR COUNTER                     K2608800
                    *                                                   K2608810
                    IBITS DC      0        LINK ENTRY POINT             K2608820
                          STO     IBIT5    SAVE INDICATOR BITS          K2608830
                          LD   L  INCT     PRODUCE SLA AND SRA          K2608840
                          A       IBIT6    INSTRUCTIONS AND INSERT      K2608850
                          STO     IBIT3    (LENGTH OF SHIFT DEPENDS     K2608860
                          A       IBIT7    ON INDICATOR COUNTER)        K2608870
                          STO     IBIT2    SET UP SRA INSTRUCTION       K2608880
                          LD   I  INPT     LOAD WORD FROM BUFFER        K2608890
                    IBIT2 SRA     *-*      SRA (INCT - 2)               K2608900
                          A       IBIT5    VALUE FROM ACC ON ENTRY      K2608910
                    IBIT3 SLA     *-*      SLA (INCT - 2)               K2608920
                          STO  I  INPT     SAVE WORD IN BUFFER          K2608930
                          MDX  L  INCT,-2  DECR INDICATOR COUNTER       K2608940
                          MDX     IBIT4    BR IF NOT ZERO (=NO SKIP)    K2608950
                          MDX  L  INPT,9   INCR INDICATOR POINTER       K2608960
                          LD    3 CD16-Z   REINITIALIZE INDR COUNTER    K2608970
                          STO  L  INCT                                  K2608980
                    IBIT4 BSC  I  IBITS    RETURN                       K2608990
                    IBIT5 DC      0        TEMPORARY STORAGE            K2609000
                    IBIT6 DC      /0FFE    .SLA 0. - 0002               K2609010
                    IBIT7 DC      /0800    .SRA 0. - .SLA 0.            K2609020
                    *                                                   K2609030
                    *             SUBROUTINE                            K2609040
                    *             MOVE TO BUFFER                        K2609050
                    *                                                   K2609060
                    TOBUF DC      0        LINK ENTRY POINT             K2609070
                          STO  I  BUFPT    SAVE I/P WD IN BUFR POINTER  K2609080
                    *                                                   K2609090
                    *             TEST IF SKIP TO NEXT 8WORD GROUP      K2609100
                          LD   L  INCT     LOAD INDICATOR COUNTER       K2609110
                          S     3 CD16-Z   TEST IF NEW INDICATOR WORD   K2609120
                          BSC  L  TOBU1,Z  BR IF NOT NEW INDR WORD      K2609130
                          STO  I  INPT     ZERO TO NEW INDR WORD        K2609140
                    TOBUC BSI     PCT      BR TO INCR DATA HDR, BFR CNT K2609150
                    TOBU1 MDX  L  LOCTR,1  INCR LOCATION COUNTER        K2609160
                          BSI     PCT      BR TO INCR DATA HDR, BFR CNT K2609170
                    *                                                   K2609180
                    *             TEST IF END OF BUFFER                 K2609190
                          LD   L  INPT     LOAD INDICATOR POINTER       K2609200
                          S     3 BFEND-Z  COMPARE TO LAST WD OF BUFFER K2609210
                          BSC  I  TOBUF,Z+ RETURN IF BUFFER NOT FULL    K2609220
                    *                                                   K2609230
                    *             TEST IF FIRST HALF OF CALL            K2609240
                          LD    3 SWISH-Z  TEST INDICATOR BITS(1,2,OR3) K2609250
                          BSC  L  HERE,+-  BR IF 0, = 2ND HALF OF CALL  K2609260
                          SLA     16       CLEAR ACCUMULATOR            K2609270
                          STO   3 SWISH-Z  RESET INDICATOR BIT AREA     K2609280
                          MDX     THERE                                 K2609290
                    HERE  BSI   3 WRITE-Z  BR TO WRITE BUFFER ON DISK   K2609300
                          BSI  L  DHDRR    DATAHEADERROUTINE            K2609310
                    *                                                   K2609320
                    THERE BSC  I  TOBUF    RETURN                       K2609330
                    *                                                   K2609340
                    *             SUBROUTINE MOVE BUFFERPOINTERS        K2609350
                    *                                                   K2609360
                    PCT   DC      0        LINK ENTRY POINT             K2609370
                    *                                                   K2609380
                    *             INCR COUNT IN DATAHEADER              K2609390
                          LD   L  DHDRA    LOAD DATA HEADER ADDRESS     K2609400
                          A     3 ONE-Z    ADD 1                        K2609410
                          STO     PCT0+1   SET UP DATA HEADER ADDR      K2609420
                    PCT0  MDX  L  *-*,1    INCR DATA HEADER WD          K2609430
                    *                                                   K2609440
                          MDX  L  PRLGT,1  INCR PROGRAM LENGTH COUNT    K2609450
                          MDX  L  BUFPT,1  INCR BUFFERPOINTER           K2609460
                    PCT1  BSC  I  PCT      RETURN                       K2609470
                    *                                                   K2609480
                    *             TERMINATE OUTPUT                      K2609490
                    OUTER SLA     0        NOP                          K2609500
                    *                                                   K2609510
                    *             MAKE PROGRLENGTH EVEN NUMBER          K2609520
                          LD   L  LOCTR    LOAD LOCATION COUNTER        K2609530
                          BSC     E        SKIP IF EVEN                 K2609540
                          A     3 ONE-Z    IF NOT, ADD ONE              K2609550
                          STO  L  LOCTR    SAVE IN LOCATION COUNTER     K2609560
                    *                                                   K2609570
                    *             INSERT BYTE COUNT OF PROGR            K2609580
                          LD   L  PRLGT    LOAD PROGRAM LENGTH          K2609590
                          A     3 DC36-Z   ADD CONSTANT =36             K2609600
                          SRT     16       SHIFT EXTENSION              K2609610
                          D     3 DC20-Z   DIVIDE BY 20 WDS/DISK BYTE   K2609620
                    *                                                   K2609630
                          STO  L  SOFST    TO COMMUNICATION AREA        K2609640
                    *                      TO BE USED BY RECOVERY       K2609650
                    *                                                   K2609660
                    *             CHANGE DATAHEADERROUTINE              K2609670
                    *             TO GET INITIAL ZERO AS                K2609680
                    *             WORD COUNT FOR END-OF-PROGR DATAHDR   K2609690
                          LD      LZERO    GET LOAD ZERO INSTRUCTION    K2609700
                          STO     DHDR1    SAVE IN DATA HEADER ROUTINE  K2609710
                    *                                                   K2609720
                    *             CORRECT NO DATA                       K2609730
                          LD      PCT      TEST DATA HDR USED           K2609740
                          BSC  L  *+4,Z    BR IF DATA                   K2609750
                          MDX  L  INPT,-2  DECR INDICATOR POINTER       K2609760
                          MDX  L  PRLGT,-2 DECR PROGRAM LENGTH          K2609770
                    *                                                   K2609780
                    *             CORRECT WORDCOUNT IN DATAHEADER       K2609790
                    *             IF NEW 8-WORD GROUP                   K2609800
                    *                                                   K2609810
                          LD   L  INCT     LOAD INDICATOR COUNT         K2609820
                          S     3 C16-Z    COMPARE WITH GROUP SIZE      K2609830
                          BSC  L  OUTE1,Z  BR IF NOT NEW GROUP          K2609840
                          LD   I  PCT0+1   LOAD DATA HEADER WORD        K2609850
                          S     3 ONE-Z    DECR BY ONE                  K2609860
                          STO  I  PCT0+1   SAVE NEW DATA HDR WORD       K2609870
                    *                                                   K2609880
                    OUTE1 BSI     DHDRR    HEADER FOR END-OF-PROGRAM    K2609890
                    *                                                   K2609900
                    *             WRITE LAST SECTOR                     K2609910
                    *             CHANGE WRITE-ROUTINE                  K2609920
                    *             FOR WRITING OF LAST SECOTR            K2609930
                          LD      BRNCH    LOAD EXIT INSTRUCTION        K2609940
                          STO   3 WRITX-Z  REPLACE WRITE EXIT INSTR     K2609950
                    *                      WRITE OUT BUFFER             K2609960
                          BSI   3 WRITE-Z                               K2609970
                    *                                                   K2609980
                    *             TEST IF PART OF BUFFER STILL          K2609990
                    *             REMAINS TO BE WRITTEN                 K2610000
                    *                                                   K2610010
                          LD   L  BUFPT    LOAD BUFFER POINTER          K2610020
                          S     3 BUFAD-Z  SUBTRACT END OF BUFFER       K2610030
                          BSC  L  EXIT,+Z  BR IF ALL DATA WRITTEN       K2610040
                          BSI   3 WRITE-Z  BR TO WRITE BUFFER           K2610050
                    *                                                   K2610060
                    *             BR TO READING OF NEXT PHASE           K2610070
                    BRNCH BSC  L  EXIT                                  K2610080
                    *                                                   K2610090
                    *                                                   K2610100
                    *             SUBROUTINE TO OUTPUT DATAHEADER       K2610110
                    *                                                   K2610120
                    DHDRR DC      0        LINK ENTRY POINT             K2610130
                          LD   L  INCT     LOAD INDICATOR COUNTER       K2610140
                          S     3 C16-Z    SEE IF NEW 8 WD GROUP        K2610150
                          BSC  L  DHDR0,Z  BR IF NOT 'EMPTY' INDICTR    K2610160
                          LD   L  INPT     LOAD INDICATOR POINTER       K2610170
                          STO  L  BUFPT    MOVE TO BUFFER POINTER       K2610180
                    DHDR0 LD   L  LOCTR    LOCCOUNTER TO DATAHEADER     K2610190
                          STO  I  BUFPT    SAVE IN BUFFER               K2610200
                          LD    3 ORGSW-Z    IS IT ABSOLUTE         2-4 K2610210
                          BSC  L  DHDRX,+-   NO  - BRANCH           2-4 K2610220
                          LD   L  LOCTR      YES - RELOCATE THE     2-4 K2610230
                          A    L  ORG        LOC ADDRESS COUNTER    2-4 K2610240
                          STO  I  BUFPT      STORE IN HEADER        2-4 K2610250
                          BSC  L  T8018,+-   BRANCH IF NEGATIVE     2-4 K2610260
                    DHDRX LD   L  BUFPT    INSERT NEW DATAHEADER ADDR   K2610270
                          STO  L  DHDRA    SAVE IN DATA HEADER ADDR     K2610280
                          MDX  L  BUFPT,1  INCR BUFFER POINTER          K2610290
                          MDX  L  PRLGT,3  COUNT 3 FOR DATAHEADER       K2610300
                    DHDR1 LD    3 THREE-Z  INITIAL COUNT = 3            K2610310
                    *                      INSTRUCTION IS CHANGED FOR   K2610320
                    *                      END-OF-PROG HDR TO BSC LEXIT K2610330
                          STO  I  BUFPT    SAVE IN BUFFER               K2610340
                          MDX  L  BUFPT,1  INCR BUFFER POINTER          K2610350
                          LD    3 ZERO-Z                                K2610360
                          STO  I  BUFPT    ZERO TO FIRST INDICATOR      K2610370
                          STO     PCT      SET PCT FLAG-NO DATA         K2610380
                          LD   L  BUFPT    LOAD BUFFER POINTER          K2610390
                          STO  L  INPT     INSER INDICATOR POINTER      K2610400
                          LD    3 C16-Z    RESET INDICATOR COUNTER      K2610410
                          STO  L  INCT     SAVE IN INDICATOR COUNTER    K2610420
                          MDX  L  BUFPT,1  MOVE BUFFER POINTER          K2610430
                          BSC  I  DHDRR    RETURN                       K2610440
                    *                                                   K2610450
                    LZERO LD    3 ZERO-Z   INITIAL COUNT = 0            K2610460
                    *                                                   K2610470
                    *                                                   K2610480
                    *             .4-BIT.-OBJ. TIME INSTRUCTION TABLE   K2610490
                    *                                                   K2610500
                    TAB4  DC      /C400    LD L     CODE=1              K2610510
                          DC      /D400    STO L         2              K2610520
                          DC      /8400    A L           3              K2610530
                          DC      /9400    S L           4              K2610540
                          DC      /AC00    D L           5              K2610550
                          DC      /A400    M L           6              K2610560
                    BSIL  DC      /4400    BSI L         7              K2610570
                          DC      /6580    LDX I1        8              K2610580
                          DC      /C500    LD L1         9              K2610590
                          DC      /D500    STO L1       10              K2610600
                          DC      /8500    A L1         11              K2610610
                          DC      /9500    S L1         12              K2610620
                          DC      /AD00    D L1         13              K2610630
                          DC      /A500    M L1         14              K2610640
                    *                                                   K2610650
                    BSCL  DC      /4C00    BSC  L       15              K2610660
                    *             (USED FOR UNCOND BRANCH ONLY)         K2610670
                    *                                                   K2610680
                    *             (EXTENSION)                           K2610690
                    *             .6-BIT. OBJ.TIME INSTRUCTION TABLE    K2610700
                    *                                                   K2610710
                    TAB6  DC      /4C00    BSC L    CODE=16 (5000)      K2610720
                          DC      /7400    MDX  L        17 (5100)      K2610730
                          LD    3 0        LD  FAC+1     18 (527E)      K2610740
                          STO   3 0        STO FAC+1     19 (537E)      K2610750
                          S     3 0        S   FAC+1     20 (547E)      K2610760
                          D     3 0        D   FAC+1     21 (557E)      K2610770
                          STD   3 0        STD FAC+1     22 (567E)      K2610780
                          SD    3 0        SD  FAC+1     23 (577E)      K2610790
                          SRT     16       SRT 16        24 (5800)      K2610800
                          SLA     16       SLA 16        25 (5900)      K2610810
                          DC      0        (RES FOR *-1) 26 (5A00)      K2610820
                    LDXL1 DC      /6500    LDX L1        27 (5B00)      K2610830
                          DC      /4D80    BSC I1        28 (5C00)      K2610840
                    SBSCL DC      /4C08    BSC L (SPEC)  29 (5D00)      K2610850
                          DC      0        (RES F GENLB) 30 (5E00)      K2610860
                          DC      0        CONST ZERO    31 (5F00)      K2610870
                          MDX     *+0                    32 (6000)      K2610880
                          DC      /7500    MDX L1        33 (6100)      K2610890
                    STXL1 DC      /6D00    STX L1        34 (6200)      K2610900
                          LDX     0        LDX           35 (6300)      K2610910
                          DC      0                                     K2610920
                          DC      0                                     K2610930
                          DC      0                                     K2610940
                    *                                                   K2610950
                    *                                                   K2610960
                    *             SYSTEM SUBR. TABLE                    K2610970
                    *                                                   K2610980
                    TABSS DC      /0604    FADD  CODE=008               K2610990
                          DC      /4100                                 K2611000
                          DC      /0604    FADDX      010               K2611010
                          DC      /4127                                 K2611020
                          DC      /068A    FSUB       018               K2611030
                          DC      /4080                                 K2611040
                          DC      /068A    FSUBX      020               K2611050
                          DC      /40A7                                 K2611060
                          DC      /0651    FMPY       028               K2611070
                          DC      /7A00                                 K2611080
                          DC      /0651    FMPYX      030               K2611090
                          DC      /7A27                                 K2611100
                          DC      /0610    FDIV       038               K2611110
                          DC      /9940                                 K2611120
                          DC      /0610    FDIVX      040               K2611130
                          DC      /9967                                 K2611140
                          DC      /064C    FLD        048               K2611150
                          DC      /4000                                 K2611160
                          DC      /064C    FLDX       050               K2611170
                          DC      /49C0                                 K2611180
                          DC      /068A    FSTO       058               K2611190
                          DC      /3580                                 K2611200
                          DC      /068A    FSTOX      060               K2611210
                          DC      /35A7                                 K2611220
                          DC      /0688    FSBR       068               K2611230
                          DC      /2640                                 K2611240
                          DC      /0688    FSBRX      070               K2611250
                          DC      /2667                                 K2611260
                          DC      /0612    FDVR       078               K2611270
                          DC      /5640                                 K2611280
                          DC      /0612    FDVRX      080               K2611290
                          DC      /5667                                 K2611300
                          DC      /0606    FAXI       088               K2611310
                          DC      /7240                                 K2611320
                    FAXIX DC      /0606    FAXIX      090               K2611330
                          DC      /7267                                 K2611340
                          DC      /0626    FIXI       098               K2611350
                          DC      /7240                                 K2611360
                          DC      /0626    FIXIX      0A0               K2611370
                          DC      /7267                                 K2611380
                    FARI  DC      /2218    SFAR       0A8               K2611390
                          DC      /1640                                 K2611400
                    FARIX DC      /2218    SFARX      0B0               K2611410
                          DC      /1667                                 K2611420
                    FIAR  DC      /2224    SIAR       0B8               K2611430
                          DC      /1640                                 K2611440
                    FIARX DC      /2224    SIARX      0C0               K2611450
                          DC      /1667                                 K2611460
                    AIFIX DC      /0918    IFIX       0C8               K2611470
                          DC      /99C0                                 K2611480
                    AFLT  DC      /064D    FLOAT      0D0               K2611490
                          DC      /6063                                 K2611500
                          DC      /2666    WRTYZ      0D8               K2611510
                          DC      /3A29                                 K2611520
                          DC      /23A1    TYPEZ      0E0               K2611530
                          DC      /7169                                 K2611540
                    FIIF  DC      /2224    SIIF       0E8               K2611550
                          DC      /9180                                 K2611560
                    FIF   DC      /2218    SFIF       0F0               K2611570
                          DC      /9180                                 K2611580
                    FGOTO DC      /221D    SGOTO      0F8               K2611590
                          DC      /68D6                                 K2611600
                          DC      /0305    CARDZ      100               K2611610
                          DC      /9129                                 K2611620
                          DC      /1765    PRNTZ      108               K2611630
                          DC      /58E9                                 K2611640
                          DC      /1705    PAPTZ      110               K2611650
                          DC      /78E9                                 K2611660
                    FCHRI DC      /260C   WCHRI       118               K2611670
                          DC      /8649                                 K2611680
                    *                                                   K2611690
                    *             THE SUBR ENTRY NAMES FOR UNFORMATTED  K2611700
                    *             I/O ARE LOCATED IN TWO GROUPS, THUS   K2611710
                    *             ANY ONE HAS ONE OF TWO POSSIBLE       K2611720
                    *             DISPLACEMENTS, WHICH ARE              K2611730
                    *             /1200-/1400   OR                      K2611740
                    *             /1D80-/1400                           K2611750
                    *                                                   K2611760
                          DC      /2464    URED       120               K2611770
                          DC      /5100                                 K2611780
                          DC      /2499    UWRT       128               K2611790
                          DC      /98C0                                 K2611800
                          DC      /240D    UCOMP      130               K2611810
                          DC      /6517                                 K2611820
                          DC      /1914    READZ      138               K2611830
                          DC      /1129                                 K2611840
                    AERD  DC      /2264    SRED       140               K2611850
                          DC      /5100                                 K2611860
                          DC      /2299    SWRT       148               K2611870
                          DC      /98C0                                 K2611880
                          DC      /220D    SCOMP      150               K2611890
                          DC      /6517                                 K2611900
                    AFIO  DC      /2218    SFIO       158               K2611910
                          DC      /9580                                 K2611920
                          DC      /2225    SIOAI      160               K2611930
                          DC      /6049                                 K2611940
                    AIOAF DC      /2225    SIOAF      168               K2611950
                          DC      /6046                                 K2611960
                          DC      /2225    SIOFX      170               K2611970
                          DC      /61A7                                 K2611980
                          DC      /2225    SIOIX      178               K2611990
                          DC      /6267                                 K2612000
                          DC      /2225    SIOF       180               K2612010
                          DC      /6180                                 K2612020
                    IOI   DC      /2225    SIOI       188               K2612030
                          DC      /6240                                 K2612040
                    SUBSC DC      /2290    SUBSC      190               K2612050
                          DC      /2883                                 K2612060
                          DC      /1765    PRNZ       198               K2612070
                          DC      /5A40                                 K2612080
                    BCKSP DC      /020D    BCKSP      1A0               K2612090
                          DC      /2897                                 K2612100
                    EOF   DC      /0558    EOF        1A8               K2612110
                          DC      /6000                                 K2612120
                    REWND DC      /1916    REWND      1B0               K2612130
                          DC      /6544                                 K2612140
                          DC      /228D    STOP       1B8               K2612150
                          DC      /65C0                                 K2612160
                          DC      /1706    PAUSE      1C0               K2612170
                          DC      /4885                                 K2612180
                    RSIGN DC      /2255    SNR        1C8               K2612190
                          DC      /9000                                 K2612200
                          DC      /2290    SUBIN      1D0               K2612210
                          DC      /2255                                 K2612220
                          DC      /2418    UFIO       1D8               K2612230
                          DC      /9580                                 K2612240
                          DC      /2425    UIOAI      1E0               K2612250
                          DC      /6049                                 K2612260
                          DC      /2425    UIOAF      1E8               K2612270
                          DC      /6046                                 K2612280
                          DC      /2425    UIOFX      1F0               K2612290
                          DC      /61A7                                 K2612300
                          DC      /2425    UIOIX      1F8               K2612310
                          DC      /6267                                 K2612320
                          DC      /2425    UIOF       200               K2612330
                          DC      /6180                                 K2612340
                          DC      /2425    UIOI       208               K2612350
                          DC      /6240                                 K2612360
                    MDFIO DC      /2210    SDFIO      210               K2612370
                          DC      /6256                                 K2612380
                    MDRED DC      /2211    SDRED      218               K2612390
                          DC      /9144                                 K2612400
                          DC      /2212    SDWRT      220               K2612410
                          DC      /6663                                 K2612420
                          DC      /2210    SDCOM      228               K2612430
                          DC      /3594                                 K2612440
                          DC      0        RESERVED TO KEEP CODE        K2612450
                          DC      0        DIFF CONSTANT                K2612460
                    *                      BETWEEN DISK I/O             K2612470
                    *                      ROUTINES AND OTHERS          K2612480
                          DC      /2210    SDAI       238               K2612490
                          DC      /1240                                 K2612500
                          DC      /2210    SDAF       240               K2612510
                          DC      /1180                                 K2612520
                          DC      /2210    SDFX       248               K2612530
                          DC      /69C0                                 K2612540
                          DC      /2210    SDIX       250               K2612550
                          DC      /99C0                                 K2612560
                          DC      /2210    SDF        258               K2612570
                          DC      /6000                                 K2612580
                    MDI   DC      /2210    SDI        260               K2612590
                          DC      /9000                                 K2612600
                    MDFND DC      /2210    SDFND      268               K2612610
                          DC      /6544                                 K2612620
                          DC      /1754    PNCHZ      270               K2612630
                          DC      /3229                                 K2612640
                    EOTAB DC      0        NOT USED                     K2612650
                          DC      0                                     K2612660
                    *                                                   K2612670
                    *                                                   K2612680
                    **************************************************  K2612690
                    *                                                   K2612700
                    *             PROGRAM ENTRY                         K2612710
                    ENT   LDX   1 PHID     GET ID THIS PHASE            K2612720
                          STX  L1 $PHSE    STORE IN SYSTEM PHASE AREA   K2612730
                    *             TEST IF OUTPUT IS TO BE DEFERRED      K2612740
                          LD   L  ERROR                                 K2612750
                          BSC  L  START,+- BR TO START IF NO ERROR      K2612760
                    *                                                   K2612770
                    *             LOAD OVERLAY-RESTORE                  K2612780
                    *                                                   K2612790
                    EXIT  LDX   1 0                                     K2612800
                          STX  L1 SOFS-1                                K2612810
                          LDX  I1 NXTPH+1  LOAD PARAMETER FOR READING   K2612820
                          LDD     NXTPH+2  *NEXT PHASE                  K2612830
                          BSC  L  ROL      GO TO READ NEXT PHASE        K2612840
                          BSS  E  0                                     K2612850
                    NXTPH DC      57       ID OF NEXT PHASE             K2612860
                          DC      *-*      CORE ADDRESS OF NEXT PHASE   K2612870
                          DC      *-*      WORD COUNT OF NEXT PHASE     K2612880
                          DC      *-*      SECTOR ADDRESS OF NEXT PHASE K2612890
                    *                                                   K2612900
                          BSS     BPHAR+320*PHLEN-*-1   PATCH AREA  2-6 K2612910
                          DC       0                                    K2612920
                          END     BPHAR-2                               K2612930
