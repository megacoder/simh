                          HDNG    1130 FORTRAN COMPILER PHASE 16        K1600010
                    *************************************************** K1600020
                    *STATUS - VERSION 2, MODIFICATION 11              * K1600030
                    *                                                 * K1600040
                    *FUNCTION/OPERATION-                              * K1600050
                    *   * CONVERTS ALL READ, WRITE, FIND, IF, GOTO,   * K1600060
                    *     CALL, STATEMENT FUNCTION, AND ARITHMETIC    * K1600070
                    *     STATEMENTS INTO MODIFIED POLISH NOTATION.   * K1600080
                    *   * ESTABLISHES THE ORDER OF ARITHMETIC         * K1600090
                    *     OPERATIONAL PERFORMANCE.                    * K1600100
                    *   * SETS UP THE ARGUMENTS FOR SUBROUTINE CALLS  * K1600110
                    *     TO BE GENERATED.                            * K1600120
                    *                                                 * K1600130
                    *ENTRY POINTS-                                    * K1600140
                    *   ENQ- ENTERED VIA CALL TO THE ROL SUBROUTINE   * K1600150
                    *        FROM THE PREVIOUS PHASE.                 * K1600160
                    *                                                 * K1600170
                    *INPUT-                                           * K1600180
                    *   NONE IN THE USUAL SENSE.  HOWEVER THE STMNT   * K1600190
                    *   STRING AND SYMBOL TABLE SCANNED BY THE        * K1600200
                    *   COMPILER MAY BE CONSIDERED INPUT              * K1600210
                    *                                                 * K1600220
                    *OUTPUT-                                          * K1600230
                    *   MODIFICATION OF THE STRING AND SYMBOL TABLE   * K1600240
                    *   MAY BE CONSIDERED OUTPUT                      * K1600250
                    *                                                 * K1600260
                    *EXTERNAL REFERENCES                              * K1600270
                    *   $PHSE                                         * K1600280
                    *                                                 * K1600290
                    *EXITS-                                           * K1600300
                    *   EXIT IS MADE TO THE NEXT PHASE VIA A CALL TO  * K1600310
                    *   THE ROL SUBROUTINE.                           * K1600320
                    *                                                 * K1600330
                    *TABLES/WORK AREAS-                               * K1600340
                    *   STATEMENT STRING                              * K1600350
                    *   SYMBOL TABLE                                  * K1600360
                    *   FCOM                                          * K1600370
                    *                                                 * K1600380
                    *ATTRIBUTES                                       * K1600390
                    *   N/A                                           * K1600400
                    *                                                 * K1600410
                    *NOTES-                                           * K1600420
                    *   THE SWITCHES USED IN THIS PHASE FOLLOW.       * K1600430
                    *   IF NON-ZERO, THE SWITCH IS TRANSFER=T         * K1600440
                    *   IF ZERO, THE SWITCH IS NORMAL=N               * K1600450
                    *   SWITCH SW1 GENERATE TEMPORARIES               * K1600460
                    *     T = GENERATED TEMPORARIES REQUESTED         * K1600470
                    *   SWITCH SW2 FAC IN OUTPUT EXPRESSION           * K1600480
                    *     T = FAC INCLUDED IN OUTPUT EXPRESSION       * K1600490
                    *   SWITCH SW3 FAC CHECK                          * K1600500
                    *     T = FAC IS ON STRING                        * K1600510
                    *                                                 * K1600520
                    *   ERRORS DETECTED IN THIS PHASE - 64            * K1600530
                    *************************************************** K1600540
                          ABS                                           K1600550
                    *                                                   K1600560
                    *                       SYSTEM EQUATES              K1600570
                    MEMRY EQU     /8000                                 K1600580
                    OVERL EQU     MEMRY-1500 START OF FCOM              K1600590
                    ROL   EQU     MEMRY-68   LOCN OF RTN TO READ NXT PH K1600600
                    $PHSE EQU     /78        NO. OF PHASE NOW IN CORE   K1600610
                          ORG     OVERL                                 K1600620
                    PHID  EQU     46         ID NUMBER THIS PHASE       K1600630
                    *                                                   K1600640
                    *                  FORTRAN COMMUNICATION AREA       K1600650
                    SOFS  BSS     1    START OF STRING                  K1600660
                    EOFS  BSS     1    END OF STRING                    K1600670
                    SOFST BSS     1    START OF SYMBOL TABLE            K1600680
                    SOFNS BSS     1    START OF NON-STATEMENT NUMBERS   K1600690
                    SOFXT BSS     1    START OF SUBSCRIPT TEMPORARIES   K1600700
                    SOFGT BSS     1    START OF GENERATED TEMPORARIES   K1600710
                    EOFST BSS     1    END OF SYMBOL TABLE              K1600720
                    COMON BSS     1    NEXT AVAILABLE COMMON            K1600730
                    CSIZE BSS     1    SIZE OF COMMON                   K1600740
                    ERROR BSS     1    OVERLAP ERROR                    K1600750
                    FNAME BSS     1         PROGRAM NAME                K1600760
                          BSS     1                                     K1600770
                    SORF  BSS     1    SUBROUTINE(-) OR FUNCTION(+)     K1600780
                    CCWD  BSS     1    CONTROL CARD WORD                K1600790
                    *                BIT 15 TRANSFER TRACE              K1600800
                    *                BIT 14 ARITHMETIC TRACE            K1600810
                    *                BIT 13 EXTENDED PRECISION          K1600820
                    *                BIT 12 LIST SYMBOL TABLE           K1600830
                    *                BIT 11 LIST SUBPROGRAM NAMES       K1600840
                    *                BIT 10 LIST SOURCE PROGRAM         K1600850
                    *                BIT  9 ONE WORD INTEGERS           K1600860
                    IOCS  BSS     1    IOCS CONTROL CARD WORD           K1600870
                    *                BIT 15 CARD                        K1600880
                    *                BIT 14 PAPER TAPE                  K1600890
                    *                BIT 13 TYPEWRITER                  K1600900
                    *                BIT 12 1403 PRINTER                K1600910
                    *                BIT 11 2501 READER                 K1600920
                    *                BIT 10 KEYBOARD                    K1600930
                    *                BIT  9 1442 PUNCH                  K1600940
                    *                BIT  8 DISK                        K1600950
                    *                BIT  7 1132 PRINTER                K1600960
                    *                BIT  3 PLOTTER                     K1600970
                    DFCNT BSS     1                                     K1600980
                    *                                                   K1600990
                    *                                                   K1601000
                    *                  END OF FORTRAN COMMUNICATION     K1601010
                    *                  AREA                             K1601020
                    *************************************************** K1601030
                    *             THE SWITCHES USED IN PHASE 17 FOLLOW  K1601040
                    *             IF NON ZERO, THE SWITCH IS TRANSFER=T K1601050
                    *             IF ZERO, THE SWITCH IS NORMAL=N       K1601060
                    *             SWITCH SW1  GENERATE TEMPORARIES      K1601070
                    *               T= GENERATE TEMPORARIES OF REQUIRED K1601080
                    *             SWITCH SW2  FAC IN OUTPUT EXPRESSION  K1601090
                    *               T= FAC INCLUDED IN OUTPUT EXPRESS   K1601100
                    *             SWITCH SW3  FAC CHECK                 K1601110
                    *               T= FAC IS ON STRING                 K1601120
                    *                                                   K1601130
                    *                                                   K1601140
                    BPHAR EQU     *+2       BEGIN PH AREA               K1601150
                          DC      0          LOADER WORK AREA.          K1601160
                          DC      -46        -PHASE ID FOR SLET LOOKUP  K1601170
                          DC      NXTPH-*+1  TABLE FOR NEXT PHASE ENTRY K1601180
                          DC      1          ONE ENTRY TO BE SET BY LDR K1601190
                          ORG     *-2                                   K1601200
                    ENQ   LDX   1 PHID       GET ID THIS PHASE          K1601210
                          STX  L1 $PHSE      STORE IN SYSTEM PHASE AREA K1601220
                    *                                                   K1601230
                    *             CHECK FOR OVERLAP                     K1601240
                    *                                                   K1601250
                          LD      ERROR                                 K1601260
                          BSC  L  GOSS,Z                                K1601270
                    *                                                   K1601280
                    *                  INITIALIZE PHASE                 K1601290
                          LDX  I1 SOFS                                  K1601300
                          LD      EOFST                                 K1601310
                          STO     SOFGT                                 K1601320
                    RST   LD      EOFST                                 K1601330
                          STO     ROFGT                                 K1601340
                    *                                                   K1601350
                    *                  STATEMENT TO BE SCANNED          K1601360
                    SETUP LD    1 0                                     K1601370
                          SRA     11                                    K1601380
                          STO     XTMP1                                 K1601390
                          LDX   3 TYTBE-TYTB+1                          K1601400
                          LD      XTMP1                                 K1601410
                          S    L3 TYTB-1                                K1601420
                          BSC  L  SCANI,+-                              K1601430
                          MDX   3 -1                                    K1601440
                          MDX     *-7                                   K1601450
                    *                                                   K1601460
                    *                  END STATEMENT                    K1601470
                          LD      XTMP1                                 K1601480
                          S       ENST                                  K1601490
                          BSC  L  NEXTS,Z                               K1601500
                    *                                                   K1601510
                    *                  READ AND GO TO NEXT PHASE        K1601520
                    GOSS  LDX  I1 NXTPH+1    LOAD PARAM FOR READING     K1601530
                          LDD     NXTPH+2    NEXT PHASE                 K1601540
                          BSC  L  ROL        GO TO READ NEXT PHASE      K1601550
                          BSS  E  0                                     K1601560
                    NXTPH DC      47         ID OF NEXT PHASE           K1601570
                          BSS     3          LOADER TABLE FOR NEXT PHS  K1601580
                    *                                                   K1601590
                    *                  MOVE TO NEXT STATEMENT           K1601600
                    NEXTS LD    1 0                                     K1601610
                          AND     S07FC                                 K1601620
                          SRA     2                                     K1601630
                          STO     *+1                                   K1601640
                          MDX  L1 *-*                                   K1601650
                    *                                                   K1601660
                    *                  WAS LAST STATEMENT ASF           K1601670
                          LD      XTMP1                                 K1601680
                          S       ASF                                   K1601690
                          BSC  L  RST,+-                                K1601700
                          MDX     SETUP                                 K1601710
                    *                                                   K1601720
                    *                  TABLE OF TYPES TO BE SCANNED     K1601730
                    TYTB  DC      /00       ARITHMETIC                  K1601740
                    ASF   DC      /1A       ARITH STATEMENT FUNCTION    K1601750
                          DC      /06       CALL                        K1601760
                          DC      /0E       GO TO                       K1601770
                          DC      /0F       IF                          K1601780
                          DC      /1D       FIND                        K1601790
                          DC      /11       WRITE                       K1601800
                    TYTBE DC      /12       READ                        K1601810
                    *                                                   K1601820
                    *                  CONSTANTS                        K1601830
                    XTMP1 DC      0         TEMPERARY                   K1601840
                    ENST  DC      /02       END                         K1601850
                    S07FC DC      /07FC                                 K1601860
                    ROFGT DC      0                                     K1601870
                    *                                                   K1601880
                    *                  INITIALIZE FOR SCAN              K1601890
                    SCANI STX  L1 IDSV1                                 K1601900
                          LD    1 0                                     K1601910
                          BSC     E                                     K1601920
                          MDX   1 1                                     K1601930
                          MDX   1 2                                     K1601940
                          STX  L1 SNDOP                                 K1601950
                          SLA     16                                    K1601960
                          LD   I  IDSV1                                 K1601970
                          BSC     C                                     K1601980
                          S       TS4                                   K1601990
                          AND     S07FC                                 K1602000
                          SRA     2                                     K1602010
                          STO     STNOM                                 K1602020
                          STO     INORM                                 K1602030
                          LDX  L3 PNT                                   K1602040
                          STX   3 OUTPT                                 K1602050
                          LDX  L3 PDL-2                            2-11 K1602060
                          STX   3 PUSHD                                 K1602070
                          SLA     16                                    K1602080
                          STO  L  SW3                                   K1602090
                    *                                                   K1602100
                    *                                                   K1602110
                    *             RESET GTS                             K1602120
                    *                                                   K1602130
                          LD      ROFGT                                 K1602140
                          STO  L  XOFGT                                 K1602150
                    *                  NORM LESS THAN 4                 K1602160
                    *                                                   K1602170
                    CKNM  LDX  L3 *-*                                   K1602180
                    STNOM EQU     CKNM+1                                K1602190
                          MDX   3 -3                                    K1602200
                          MDX     ADV                                   K1602210
                          MDX     PTPOL                                 K1602220
                    *                                                   K1602230
                    *                  MOVE POINTER (1                  K1602240
                    ADV   MDX   1 1                                     K1602250
                    *                                                   K1602260
                    *                  BOTH SYMBOLS OPERATORS           K1602270
                    NAME  LD    1 0                                     K1602280
                          OR    1 -2                                    K1602290
                          BSC  L  ADV,+Z                                K1602300
                    *                                                   K1602310
                    *                  DO OPERATORS FORCE               K1602320
                    FORCE LD    1 0                                     K1602330
                          STO     ROP+1                                 K1602340
                          LD    1 -2                                    K1602350
                          STO     LOP+1                                 K1602360
                          LDX  L3 FTAB                                  K1602370
                    ROP   LD   L3 *-*                                   K1602380
                          AND     S00FF                                 K1602390
                          STO     XTE1                                  K1602400
                    LOP   LD   L3 *-*                                   K1602410
                          SRA     8                                     K1602420
                          S       XTE1                                  K1602430
                          BSC  L  ADV,Z-                                K1602440
                    *                                                   K1602450
                    *                  INTERPRETER                      K1602460
                          MDX  I3 LOP+1                                 K1602470
                          LD    3 1                                     K1602480
                          STO     *+1                                   K1602490
                          LDX  L2 *-*                                   K1602500
                          MDX     *+1                                   K1602510
                    RETRR MDX   2 2                                     K1602520
                          LD    2 1                                     K1602530
                          BSC  I2 0                                     K1602540
                    *                                                   K1602550
                    *                  CONSTANTS                        K1602560
                    XTE1  DC      0         TEMPERARY                   K1602570
                    XRR2  EQU     XTE1                                  K1602580
                    S00FF DC      /00FF                                 K1602590
                    PUSHD DC      0                                     K1602600
                    OUTPT DC      0                                     K1602610
                    ERID  DC      /A008                                 K1602620
                    FIVE  DC      5                                     K1602630
                    ERNO  DC      64                                    K1602640
                    INORM DC      0                                     K1602650
                    TS4   DC      4                                     K1602660
                    *                                                   K1602670
                    *                  CHECK OVERLAP IN OUTPUT AREA     K1602680
                    OVCHK LD      PUSHD                                 K1602690
                          S       OUTPT                                 K1602700
                          BSC  L  RETRN,-Z                              K1602710
                    *                                                   K1602720
                    *                  PUT ERROR ON STRING              K1602730
                    BADST LDX  I1 IDSV1                                 K1602740
                          LD    1 0                                     K1602750
                          BSC  L  *+3,E                                 K1602760
                          LD      ERID                                  K1602770
                          STO   1 0                                     K1602780
                          MDX     *+6                                   K1602790
                          LD      ERID                                  K1602800
                          A       FIVE                                  K1602810
                          STO   1 0                                     K1602820
                          MDX   1 1                                     K1602830
                          MDX  L  INORM,1                               K1602840
                          LD      ERNO                                  K1602850
                          STO   1 1                                     K1602860
                          MDX   1 1                                     K1602870
                    *                                                   K1602880
                    *                  CLOSE UP THE STRING              K1602890
                          LDX  I2 IDSV1                                 K1602900
                          MDX  I2 INORM                                 K1602910
                          STX   2 XRR2                                  K1602920
                          LD   L  EOFS                                  K1602930
                          S       XRR2                                  K1602940
                          STO     *+1                                   K1602950
                          LDX  L3 *-*                                   K1602960
                          MDX   3 1                                     K1602970
                          LD    2 0                                     K1602980
                          STO   1 1                                     K1602990
                          MDX   1 1                                     K1603000
                          MDX   2 1                                     K1603010
                          MDX   3 -1                                    K1603020
                          MDX     *-6                                   K1603030
                          STX  L1 EOFS                                  K1603040
                          LDX  I1 IDSV1                                 K1603050
                          MDX     QLZQ                                  K1603060
                    *                                                   K1603070
                    *                  CALCULATE THE STATEMENT NORM     K1603080
                    PTPOL MDX  L  INORM,-2                              K1603090
                    *                                                   K1603100
                    *                  IS MOVEMENT NECESSARY            K1603110
                          LD      CPNT                                  K1603120
                          S       OUTPT                                 K1603130
                          STO     CNT                                   K1603140
                          A       INORM                                 K1603150
                          STO     AMOUT                                 K1603160
                          BSC  L  OPEN,Z+                               K1603170
                          BSC  L  CLOSE,Z                               K1603180
                    *                                                   K1603190
                    *                  PLACE POLISH TABLE ON STRING     K1603200
                    MOVE  LDX  L2 PNT                                   K1603210
                          LDX  I1 SNDOP                                 K1603220
                          LDX  L3 *-*                                   K1603230
                    CNT   EQU     *-1                                   K1603240
                          LD    2 0                                     K1603250
                          STO   1 -1                                    K1603260
                          MDX   1 1                                     K1603270
                          MDX   2 1                                     K1603280
                          MDX   3 1                                     K1603290
                          MDX     *-6                                   K1603300
                          LDX  L1 *-*                                   K1603310
                    IDSV1 EQU     *-1                                   K1603320
                    QLZQ  BSC  L  NEXTS                                 K1603330
                    *                                                   K1603340
                    *                  CONSTANTS                        K1603350
                    AMOUT DC      0                                     K1603360
                    CPNT  DC      PNT                                   K1603370
                    *                                                   K1603380
                    *                  CAN STRING BE OPENED             K1603390
                    OPEN  LD   L  EOFST                                 K1603400
                          S    L  EOFS                                  K1603410
                          A       AMOUT                                 K1603420
                          BSC  L  OVERS,+Z                              K1603430
                    *                                                   K1603440
                    *                  OPEN STRING                      K1603450
                          LDX  I1 EOFS                                  K1603460
                          LD   L  EOFS                                  K1603470
                          S       SNDOP                                 K1603480
                          STO     *+1                                   K1603490
                          LDX  L3 *-*                                   K1603500
                          LD   L  EOFS                                  K1603510
                          S       AMOUT                                 K1603520
                          STO  L  EOFS                                  K1603530
                          LDX  I2 EOFS                                  K1603540
                          LD    1 0                                     K1603550
                          STO   2 0                                     K1603560
                          MDX   1 -1                                    K1603570
                          MDX   2 -1                                    K1603580
                          MDX   3 -1                                    K1603590
                          MDX     *-6                                   K1603600
                    *                                                   K1603610
                    *                  CORRECT NORM                     K1603620
                    CRTNM LD   I  IDSV1                                 K1603630
                          SRT     2                                     K1603640
                          S       AMOUT                                 K1603650
                          SLT     2                                     K1603660
                          STO  I  IDSV1                                 K1603670
                          MDX     MOVE                                  K1603680
                    *                                                   K1603690
                    *                  CLOSE STRING                     K1603700
                    CLOSE LDX  L2 *-*                                   K1603710
                    SNDOP EQU     *-1                                   K1603720
                          LD      SNDOP                                 K1603730
                          A       AMOUT                                 K1603740
                          STO     *+1                                   K1603750
                          LDX  L1 *-*                                   K1603760
                          LD   L  EOFS                                  K1603770
                          S       *-4                                   K1603780
                          STO     *+1                                   K1603790
                          LDX  L3 *-*                                   K1603800
                          LD    1 1                                     K1603810
                          STO   2 1                                     K1603820
                          MDX   1 1                                     K1603830
                          MDX   2 1                                     K1603840
                          MDX   3 -1                                    K1603850
                          MDX     *-6                                   K1603860
                          STX  L2 EOFS                                  K1603870
                          MDX     CRTNM                                 K1603880
                    *                                                   K1603890
                    *                  SET UP OVERLAP ERROR             K1603900
                    OVERS MDX  L  ERROR,1                               K1603910
                          BSC  L  GOSS                                  K1603920
                    *************************************************** K1603930
                    *                                                 * K1603940
                    *                  INTERPRETER STRING PACKAGE     * K1603950
                    *                                                 * K1603960
                    *************************************************** K1603970
                    *                  PLACE OPERAND ON STRING AT XR1-1 K1603980
                    *                  IF OPERAN OPERAND IS FAC (/8000) K1603990
                    *                  TAG SW3 AND SAVE ADDRESS OF FAC  K1604000
                    *                  ON THE STRING                    K1604010
                    *                                                   K1604020
                    PLACE STO   1 -1                                    K1604030
                          S       FACNY                                 K1604040
                          BSC  L  RETRN,Z                               K1604050
                          STX  L0 SW3                                   K1604060
                          STX  L1 FACSV                                 K1604070
                          MDX  L  FACSV,-1                              K1604080
                          MDX     RETRN                                 K1604090
                    FACNY DC      /8000                                 K1604100
                    *                                                   K1604110
                    *                  MOVE THE POINTER BY ADDING THE   K1604120
                    *                  OPERAND TO IX1.                  K1604130
                    *                                                   K1604140
                    MVPT  STO     *+1                                   K1604150
                          MDX  L1 *-*                                   K1604160
                          MDX     RETRN                                 K1604170
                    *                                                   K1604180
                    *                  INSERT STOP CODE ON PUSH DOWN    K1604190
                    *                  LIST.                            K1604200
                    *                                                   K1604210
                    STOPI MDX  L  PUSHD,-1                              K1604220
                          SLA     16                                    K1604230
                          STO  I  PUSHD                                 K1604240
                          MDX   2 -1                                    K1604250
                          BSC  L  OVCHK                                 K1604260
                    *                                                   K1604270
                    *                  DELET THE STOP CODE FROM THE     K1604280
                    *                  PUSH DOWN LIST.                  K1604290
                    *                                                   K1604300
                    STOPD MDX  L  PUSHD,1                               K1604310
                          MDX   2 -1                                    K1604320
                          MDX     RETRN                                 K1604330
                    *                                                   K1604340
                    *                  MOVE PUSH DOWN LIST TO THE       K1604350
                    *                  OUTPUT BUFFER UNTILL A STOP      K1604360
                    *                  CODE IS INCOUNTERED.             K1604370
                    *                                                   K1604380
                    PTO   MDX   2 -1                                    K1604390
                          LD   I  PUSHD                                 K1604400
                          BSC  L  RETRN,+-                              K1604410
                          STO  I  OUTPT                                 K1604420
                          MDX  L  PUSHD,1                               K1604430
                          MDX  L  OUTPT,1                               K1604440
                          MDX     PTO+1                                 K1604450
                    *                                                   K1604460
                    *                  DELET THE NUMBER OF SYMBOLS      K1604470
                    *                  SPECIFIED BY THE OPERAND FROM    K1604480
                    *                  THE STRING. THE OPERAND IS       K1604490
                    *                  ALWAYS NEGATIVE. THE SPECIAL     K1604500
                    *                  STRING NORM WILL BE CORRECTED.   K1604510
                    *                  THE ADDRESS OF FAC WILL BE       K1604520
                    *                  ADJUSTED IF FAC ON THE STRING    K1604530
                    *                  IS MOVED.                        K1604540
                    *                                                   K1604550
                    DELET STO     *+4                                   K1604560
                          STX   1 *+1                                   K1604570
                          LDX  L3 *-*                                   K1604580
                          MDX  L3 *-*                                   K1604590
                          STX   3 DEND+1                                K1604600
                    DELOP LD    1 0                                     K1604610
                          STO   3 0                                     K1604620
                          MDX   1 1                                     K1604630
                          MDX   3 1                                     K1604640
                          BSC  L  DELOP,Z                               K1604650
                          LD   L  FACSV                                 K1604660
                          S       DELET+3                               K1604670
                          BSC  L  *+5,Z+                                K1604680
                          LD   L  FACSV                                 K1604690
                          A       DELET+5                               K1604700
                          STO  L  FACSV                                 K1604710
                    DEND  LDX  L1 *-*                                   K1604720
                          LD   L  STNOM                                 K1604730
                          A       DELOP-2                               K1604740
                          STO  L  STNOM                                 K1604750
                          MDX     RETRN                                 K1604760
                    *                                                   K1604770
                    *                  PLACE THOSE STRING ELEMENTS      K1604780
                    *                  SPECIFIED BY THE SUBSTRING       K1604790
                    *                  ON THE PUSH DOWN LIST            K1604800
                    *                  IF FAC IS PUSHED DOWN A G.T.     K1604810
                    *                  IS GENERATED                     K1604820
                    *                                                   K1604830
                    PUSH  STO     *+1                                   K1604840
                          LDX  I3 *-*                                   K1604850
                          STO     PUSH1+1                               K1604860
                          MDX  L  PUSH1+1,1                             K1604870
                    PUSH1 LD   L  *-*                                   K1604880
                          STO     *+1                                   K1604890
                          LD   L1 *-*                                   K1604900
                          MDX  L  PUSHD,-1                              K1604910
                    PUSH2 STO  I  PUSHD                                 K1604920
                          S    L  CONS3                                 K1604930
                          BSC  L  PUSH3,+-                              K1604940
                          MDX   3 -1                                    K1604950
                          MDX     PUSH1-2                               K1604960
                          MDX     RETRN                                 K1604970
                    PUSH3 LD   L  CONS5                                 K1604980
                          STO  I  OUTPT                                 K1604990
                          MDX  L  OUTPT,1                               K1605000
                          BSI     COMGT                                 K1605010
                          STO  I  OUTPT                                 K1605020
                          MDX  L  OUTPT,1                               K1605030
                          MDX     PUSH2                                 K1605040
                    *                                                   K1605050
                    *                       COMPUTE GT FOR FAC          K1605060
                    COMGT DC      0                                     K1605070
                          SLA     16                                    K1605080
                          STO     SW3                                   K1605090
                          LD      CONS4                                 K1605100
                          STO  L  *-*                                   K1605110
                    XOFGT EQU     *-1                                   K1605120
                          MDX  L  XOFGT,-3                              K1605130
                          LD      XOFGT                                 K1605140
                          S    L  EOFST                                 K1605150
                          BSC  L  *+2,-                                 K1605160
                          MDX  L  EOFST,-3                              K1605170
                          LD   L  SOFST                                 K1605180
                          S       XOFGT                                 K1605190
                          SRT     16                                    K1605200
                          D       CONS2                                 K1605210
                          OR      CONS3                                 K1605220
                          BSC  I  COMGT                                 K1605230
                    *                                                   K1605240
                    *                  RETERN                           K1605250
                    RETRN BSC  L  RETRR                                 K1605260
                    *                                                   K1605270
                    *                  OUTPUT UNDER CONTROL OF A SUB-   K1605280
                    *                  STRING. IF ENTRY IS TO LABEL     K1605290
                    *                  OUTFC THE OUTPUT ROUTINE WILL    K1605300
                    *                  GENERATE TEMPERARIES WHEN        K1605310
                    *                  NECESSARY.                       K1605320
                    *                                                   K1605330
                    OUTFC LDX   3 1                                     K1605340
                          MDX     OUT+1                                 K1605350
                    OUT   LDX   3 0                                     K1605360
                          STX   3 SW1                                   K1605370
                          LDX   3 0                                     K1605380
                          STX   3 SW2                                   K1605390
                          STX   3 SWCAL                                 K1605400
                          STO     *+1                                   K1605410
                          LDX  I3 *-*                                   K1605420
                          STO     OUT1+1                                K1605430
                          MDX  L  OUT1+1,1                              K1605440
                    OUT1  LD   L  *-*                                   K1605450
                          STO     *+4                                   K1605460
                          LD      SW1                                   K1605470
                          EOR     OUTFC                                 K1605480
                          SLA     16                                    K1605490
                          LD   L1 *-*                                   K1605500
                          STO  I  OUTPT                                 K1605510
                          BSC  L  NOREV+2,C                             K1605520
                          S       CONS3                                 K1605530
                          BSC  L  NOREV+2,Z                             K1605540
                          STX   0 SW2                                   K1605550
                          MDX  L  OUTPT,-1                              K1605560
                          LD   I  OUTPT                                 K1605570
                          BSC  L  NOREV+2,-                             K1605580
                          MDX  L  OUTPT,-1                              K1605590
                          LD   I  OUTPT                                 K1605600
                          S       CALOP                                 K1605610
                          BSC     +-                                    K1605620
                          STX   0 SWCAL                                 K1605630
                          S       SREV1                                 K1605640
                          BSC  L  NOREV,+Z                              K1605650
                          S       SREV2                                 K1605660
                          BSC  L  NOREV,-Z                              K1605670
                          A       SREV3                                 K1605680
                          STO  I  OUTPT                                 K1605690
                    NOREV MDX  L  OUTPT,1                               K1605700
                          MDX  L  OUTPT,1                               K1605710
                          MDX   3 -1                                    K1605720
                          MDX     OUT1-2                                K1605730
                          LD      SW1                                   K1605740
                          BSC  L  OVCHK,+-                              K1605750
                          LD      SW3                                   K1605760
                          BSC  L  OVCHK,+-                              K1605770
                          LD      SWCAL                                 K1605780
                          BSC  L  LOP2,+-                               K1605790
                          BSI     COMGT                                 K1605800
                          STO  I  OUTPT                                 K1605810
                          MDX  L  OUTPT,1                               K1605820
                          MDX  L  XOFGT,3                               K1605830
                          MDX     LOP3                                  K1605840
                    LOP2  LD      SW2                                   K1605850
                          BSC  L  OVCHK,Z                               K1605860
                    LOP3  MDX  L  OUTPT,2                               K1605870
                          LDX  I3 OUTPT                                 K1605880
                    LOP1  LD    3 -3                                    K1605890
                          MDX   3 -1                                    K1605900
                          STO   3 0                                     K1605910
                          BSC  L  LOP1,+Z                               K1605920
                          BSI     COMGT                                 K1605930
                          STO   3 -1                                    K1605940
                          STO  L  *-*                                   K1605950
                    FACSV EQU     *-1                                   K1605960
                          LD      CONS5                                 K1605970
                          STO   3 -2                                    K1605980
                          BSC  L  OVCHK                                 K1605990
                    SW1   DC      0                                     K1606000
                    SW2   DC      0                                     K1606010
                    SW3   DC      0                                     K1606020
                    SWCAL DC      0                                     K1606030
                    CALOP DC      /2E                                   K1606040
                    SREV1 DC      /06-/2E                               K1606050
                    SREV2 DC      /0A-/06                               K1606060
                    SREV3 DC      /0A+/44-/06                           K1606070
                    CONS2 DC      3                                     K1606080
                    CONS3 DC      /8000                                 K1606090
                    CONS4 DC      /0008     GENERATED TEMPERARY ID      K1606100
                    CONS5 DC      /0E       #                           K1606110
                    XR1   DC      0                                     K1606120
                    SEND  DC      /24       S)                          K1606130
                    *                                                   K1606140
                    *                       END                         K1606150
                    END   MDX   1 -1                                    K1606160
                          STX   1 XR1                                   K1606170
                          LD      XR1                                   K1606180
                          S    L  SNDOP                                 K1606190
                          BSC  L  *+2,-                                 K1606200
                          LDX  I1 SNDOP                                 K1606210
                          BSC  L  CKNM                                  K1606220
                    *                                                   K1606230
                    *             HANDLE SUBSCRIPTING BY                K1606240
                    *             FORCING OUT COMPLETE LIST             K1606250
                    *                                                   K1606260
                    SUBSC MDX   2 -8                                    K1606270
                          LD    1 0                                     K1606280
                          S       SEND                                  K1606290
                          BSC  L  RETRR,Z                               K1606300
                          MDX   2 7                                     K1606310
                          MDX     RETRN                                 K1606320
                    *                                                   K1606330
                    *                  POLISH AND PUSH DOWN LISTS       K1606340
                    PNT   BSS     401                                   K1606350
                    PDL   DC      0                                     K1606360
                    *                                                   K1606370
                    *                  FORCING TABLE                    K1606380
                    FTAB  DC      /3C3C     SEMI-COLON                  K1606390
                          DC      BADST                                 K1606400
                          DC      /0132     )                           K1606410
                          DC      BADST                                 K1606420
                          DC      /0A0A     +                           K1606430
                          DC      CD1                                   K1606440
                          DC      /0A0A     -                           K1606450
                          DC      CD1                                   K1606460
                          DC      /0505     /                           K1606470
                          DC      CD1                                   K1606480
                          DC      /0504     **                          K1606490
                          DC      CD1                                   K1606500
                          DC      /0505     *                           K1606510
                          DC      CD1                                   K1606520
                          DC      /3B3C     =                           K1606530
                          DC      CD1                                   K1606540
                          DC      /3101     (                           K1606550
                          DC      CD2                                   K1606560
                          DC      /3130     ,                           K1606570
                          DC      CD3                                   K1606580
                          DC      /3101     IF                          K1606590
                          DC      CD8                                   K1606600
                          DC      /3101     GOT                         K1606610
                          DC      CD5                                   K1606620
                          DC      /2A01      (0                         K1606630
                          DC      CD6                                   K1606640
                          DC      /2A01      (1                         K1606650
                          DC      CD6                                   K1606660
                          DC      /2A01      (2                         K1606670
                          DC      CD6                                   K1606680
                          DC      /2A01      (3                         K1606690
                          DC      CD6                                   K1606700
                          DC      /0501     U-                          K1606710
                          DC      CD7                                   K1606720
                          DC      /3131    RG                           K1606730
                          DC      CD10                                  K1606740
                          DC      /3131     S)                          K1606750
                          DC      BADST                                 K1606760
                          DC      /3001     I/O                         K1606770
                          DC      CD11                                  K1606780
                          DC      /3030     LIST                        K1606790
                          DC      CD12                                  K1606800
                          DC      /3101    DOA                          K1606810
                          DC      CD9                                   K1606820
                          DC      /3B01     ASF                         K1606830
                          DC      CD13                                  K1606840
                          DC      /0201       C                         K1606850
                          DC      CD4                                   K1606860
                          DC      /3001     DI/O                        K1606870
                          DC      CD11                                  K1606880
                    *                                                   K1606890
                    *                  CODE1                            K1606900
                    CD1   DC      OUTFC                                 K1606910
                          DC      SUB1                                  K1606920
                          DC      DELET                                 K1606930
                          DC      -2                                    K1606940
                          DC      PLACE                                 K1606950
                          DC      /8000     FAC                         K1606960
                          DC      END                                   K1606970
                    *                                                   K1606980
                    *                  CODE2                            K1606990
                    CD2   DC      MVPT                                  K1607000
                          DC      -1                                    K1607010
                          DC      DELET                                 K1607020
                          DC      -1                                    K1607030
                          DC      MVPT                                  K1607040
                          DC      2                                     K1607050
                          DC      DELET                                 K1607060
                          DC      -1                                    K1607070
                          DC      END                                   K1607080
                    *                                                   K1607090
                    *                  CODE 3                           K1607100
                    CD3   DC      PUSH                                  K1607110
                          DC      SUB2                                  K1607120
                          DC      DELET                                 K1607130
                          DC      -2                                    K1607140
                          DC      END                                   K1607150
                    *                                                   K1607160
                    *                  CODE4                            K1607170
                    CD4   DC      OUTFC                                 K1607180
                          DC      SUB1                                  K1607190
                          DC      PTO                                   K1607200
                          DC      DELET                                 K1607210
                          DC      -2                                    K1607220
                          DC      PLACE                                 K1607230
                          DC      /8000     FAC                         K1607240
                          DC      END                                   K1607250
                    *                                                   K160726-
                    *                  CODE 5                           K1607270
                    CD5   DC      OUT                                   K1607280
                          DC      SUB2                                  K1607290
                          DC      PTO                                   K1607300
                          DC      DELET                                 K1607310
                          DC      -1                                    K1607320
                          DC      END                                   K1607330
                    *                                                   K1607340
                    *                  CODE 6                           K1607350
                    CD6   DC      OUT                                   K1607360
                          DC      SUB3                                  K1607370
                          DC      DELET                                 K1607380
                          DC      -2                                    K1607390
                          DC      MVPT                                  K1607400
                          DC      2                                     K1607410
                          DC      OUT                                   K1607420
                          DC      SUB2                                  K1607430
                          DC      SUBSC                                 K1607440
                          DC      MVPT                                  K1607450
                          DC      1                                     K1607460
                          DC      DELET                                 K1607470
                          DC      -3                                    K1607480
                          DC      END                                   K1607490
                    *                                                   K1607500
                    *                  CODE 7                           K1607510
                    CD7   DC      OUTFC                                 K1607520
                          DC      SUB3                                  K1607530
                          DC      DELET                                 K1607540
                          DC      -1                                    K1607550
                          DC      PLACE                                 K1607560
                          DC      /8000     FAC                         K1607570
                          DC      END                                   K1607580
                    *                                                   K1607590
                    *             CODE 8                                K1607600
                    CD8   DC      OUTFC                                 K1607610
                          DC      SUB3                                  K1607620
                          DC      PTO                                   K1607630
                          DC      DELET                                 K1607640
                          DC      -1                                    K1607650
                          DC      END                                   K1607660
                    *                                                   K1607670
                    *             CODE 9                                K1607680
                    CD9   DC      OUT                                   K1607690
                          DC      SUB1                                  K1607700
                          DC      PUSH                                  K1607710
                          DC      SUB5                                  K1607720
                          DC      MVPT                                  K1607730
                          DC      1                                     K1607740
                          DC      DELET                                 K1607750
                          DC      -4                                    K1607760
                          DC      STOPI                                 K1607770
                          DC      END                                   K1607780
                    *                                                   K1607790
                    *             CODE 10                               K1607800
                    *                                                   K1607810
                    CD10  DC      PLACE                                 K1607820
                          DC      /4A       DOT                         K1607830
                          DC      OUT                                   K1607840
                          DC      SUB2                                  K1607850
                          DC      STOPD                                 K1607860
                          DC      PTO                                   K1607870
                          DC      MVPT                                  K1607880
                          DC      1                                     K1607890
                          DC      DELET                                 K1607900
                          DC      -3                                    K1607910
                          DC      END                                   K1607920
                    *                                                   K1607930
                    *                  CODE 11                          K1607940
                    CD11  DC      OUT                                   K1607950
                          DC      SUB3                                  K1607960
                          DC      PTO                                   K1607970
                          DC      DELET                                 K1607980
                          DC      -2                                    K1607990
                          DC      MVPT                                  K1608000
                          DC      +1                                    K1608010
                          DC      PLACE                                 K1608020
                          DC      /28     LIST                          K1608030
                          DC      END                                   K1608040
                    *                                                   K1608050
                    *                  CODE 12                          K1608060
                    CD12  DC      OUT                                   K1608070
                          DC      SUB3                                  K1608080
                          DC      MVPT                                  K1608090
                          DC      +1                                    K1608100
                          DC      DELET                                 K1608110
                          DC      -2                                    K1608120
                          DC      END                                   K1608130
                    *                                                   K1608140
                    *                       CODE 13                     K1608150
                    CD13  DC      OUT                                   K1608160
                          DC      SUB1                                  K1608170
                          DC      PTO                                   K1608180
                          DC      DELET                                 K1608190
                          DC      -2                                    K1608200
                          DC      MVPT                                  K1608210
                          DC      +1                                    K1608220
                          DC      END                                   K1608230
                    *                                                   K1608240
                    *                  SUBSTRING 1                      K1608250
                    SUB1  DC      3                                     K1608260
                          DC      -2                                    K1608270
                          DC      -3                                    K1608280
                          DC      -1                                    K1608290
                    *                                                   K1608300
                    *                  SUBSTRING 2                      K1608310
                    SUB2  DC      1                                     K1608320
                          DC      -1                                    K1608330
                    *                                                   K1608340
                    *                  SUBSTRING 3                      K1608350
                    SUB3  DC      2                                     K1608360
                          DC      -2                                    K1608370
                          DC      -1                                    K1608380
                    *                                                   K1608390
                    *             SUB STRING 5                          K1608400
                    SUB5  DC      1                                     K1608410
                          DC      -3                                    K1608420
                          BSS     183        PATCH AREA             2-1 K1608430
                          DC      0                                     K1608440
                          END     BPHAR-2                               K1608450
