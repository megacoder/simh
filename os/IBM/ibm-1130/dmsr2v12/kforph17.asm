                          HDNG    1130 FORTRAN COMPILER PHASE 17        K1700010
                    *************************************************** K1700020
                    *STATUS-VERSION 2, MODIFICATION 5                 * K1700030
                    *                                                 * K1700040
                    *FUNCTION/OPERATION-                              * K1700050
                    *   * REPLACES READ, FIND, WRITE, GO TO, AND      * K1700060
                    *     RETURN STATEMENTS WITH COMPILER-GENERATED   * K1700070
                    *     CODING                                      * K1700080
                    *   * SETS UP IMPLIED DO LOOPS WITHIN READ AND    * K1700090
                    *     WRITE STATEMENT                             * K1700100
                    *   * REPLACES THOSE PARTS OF ARITHMETIC, IF,     * K1700110
                    *     CALL AND STMNT FUNCTION STATEMENTS THAT     * K1700120
                    *     INVOLVE SUBSCRIPTING OF VARIABLES WITH      * K1700130
                    *     COMPILER-GENERATED CODING.                  * K1700140
                    *   * CHECKS SUBPROGRAMS FOR A RETURN STATEMENT.  * K1700150
                    *                                                 * K1700160
                    *ENTRY POINTS-                                    * K1700170
                    *   START-PHASE 17 IS READ INTO CORE BY PHASE 16  * K1700180
                    *         AND EXECUTION BEGUN AT LOCATION START   * K1700190
                    *                                                 * K1700200
                    *INPUT-                                           * K1700210
                    *   NONE IN THE USUAL SENSE. HOWEVER, THE STMNT   * K1700220
                    *   STRING SCANNED BY THE COMPILER MAY BE         * K1700230
                    *   CONSIDERED INPUT.                             * K1700240
                    *                                                 * K1700250
                    *OUTPUT-                                          * K1700260
                    *   NONE IN THE USUAL SENSE. HOWEVER, THE STMNT   * K1700270
                    *   STRING AND THE SYMBOL TABLE ALTERED BY THE    * K1700280
                    *   COMPILER MAY BE CONSIDERED OUTPUT.            * K1700290
                    *                                                 * K1700300
                    *EXTERNAL REFERENCES-N/A                          * K1700310
                    *                                                 * K1700320
                    *EXITS-                                           * K1700330
                    *   NORMAL-                                       * K1700340
                    *      PHASE EXITS NORMALLY IF NO ERRORS ARE      * K1700350
                    *      FOUND. PHASE 18 IS LOADED AND EXECUTED.    * K1700360
                    *   ERROR-                                        * K1700370
                    *      THE FLOW OF COMPILER PROCESSING IS NOT     * K1700380
                    *      INTERRUPTED WHEN AN ERROR IS ENCOUNTERED.  * K1700390
                    *      AN ERROR STMNT REPLACES THE FAULTY STMNT   * K1700400
                    *      ON THE STRING AND STMNT SCANNING PROCESS   * K1700410
                    *      CONTINUES, AN EXCEPTION OCCURS IN THE CASE * K1700420
                    *      OF AN OVERLAP ERROR. COMPILATION IS        * K1700430
                    *      ABORTED AND CONTROL IS PASSED FROM PHASE   * K1700440
                    *      TO SUCCEEDING PHASE UNTIL AN OUTPUT PHASE  * K1700450
                    *      IS REACHED WHICH CAN PRINT AN ERROR MESSAGE* K1700460
                    *      THE ERROR DETECTED BY PHASE 17 IS  69.     * K1700470
                    *                                                 * K1700480
                    *TABLES/WORK AREAS-                               * K1700490
                    *   NONE EXCEPT STATEMENT STRING AREA, SYMBOL     * K1700500
                    *   TABLE AND FORTRAN COMMUNICATION AREA          * K1700510
                    *                                                 * K1700520
                    *ATTRIBUTES-N/A                                   * K1700530
                    *                                                 * K1700540
                    *NOTES-                                           * K1700550
                    *   THE SWITCHES USED IN PHASE 14 FOLLOW. IF NON- * K1700560
                    *   ZERO, THE SWITCH IS TRANSFER=T. IF ZERO, THE  * K1700570
                    *   SWITCH IS NORMAL=N.                           * K1700580
                    *      * RETCT-RETURN STATEMENTS                  * K1700590
                    *              N=NO RETURN STMNTS ENCOUNTERED     * K1700600
                    *      * STXSW-                                   * K1700610
                    *              T=TWO WORD CALL HAS INDEXED        * K1700620
                    *                ARGUMENTS, SECOND SCAN NECESSARY * K1700630
                    *                TO COMPUTE DISPLACEMENT VALUE IN * K1700640
                    *                STX L1 INSTRUCTION               * K1700650
                    *      * USWIT-UNFORMATTED I/O                    * K1700660
                    *              T=STMNT IS NOT FORMATTED, I.E.,    * K1700670
                    *                DOES NOT HAVE OPTR AT I/O OPTR+2.* K1700680
                    *      * DSWIT-DISK SWITCH                        * K1700690
                    *              T=DISK I/O OPTR                    * K1700700
                    *************************************************** K1700710
                          ABS                                           K1700720
                    *                                                   K1700730
                    *                       SYSTEM EQUATES              K1700740
                    MEMRY EQU     /8000                                 K1700750
                    OVERL EQU     MEMRY-1501 START OF FCOM              K1700760
                    ROL   EQU     MEMRY-68   LOCN OF RTN TO READ NXT PH K1700770
                    $PHSE EQU     /78        NO. OF PHASE NOW IN CORE   K1700780
                          ORG     OVERL                                 K1700790
                    PHID  EQU     47         ID NUMBER THIS PHASE       K1700800
                    **************************************************  K1700810
                    *                                                   K1700820
                    *                  FORTRAN COMMUNICATION AREA       K1700830
                    *                                                   K1700840
                    ORG   BSS     1    ORIGIN ADDRESS               2-4 K1700845
                    SOFS  BSS     1    START OF STRING                  K1700850
                    EOFS  BSS     1    END OF STRING                    K1700860
                    SOFST BSS     1    START OF SYMBOL TABLE            K1700870
                    SOFNS BSS     1    START OF NON-STATEMENT NUMBERS   K1700880
                    SOFXT BSS     1    START OF SUBSCRIPT TEMPORARIES   K1700890
                    SOFGT BSS     1    START OF GENERATED TEMPORARIES   K1700900
                    EOFST BSS     1    END OF SYMBOL TABLE              K1700910
                    COMON BSS     1    NEXT AVAILABLE COMMON            K1700920
                    CSIZE BSS     1    SIZE OF COMMON                   K1700930
                    ERROR BSS     1    OVERLAP ERROR                    K1700940
                    FNAME BSS     1    PROGRAM NAME                     K1700950
                          BSS     1                                     K1700960
                    SORF  BSS     1    SUBROUTINE(-) OR FUNCTION(+)     K1700970
                    CCWD  BSS     1    CONTROL CARD WORD                K1700980
                    *                BIT 15 TRANSFER TRACE              K1700990
                    *                BIT 14 ARITHMETIC TRACE            K1701000
                    *                BIT 13 EXTENDED PRECISION          K1701010
                    *                BIT 12 LIST SYMBOL TABLE           K1701020
                    *                BIT 11 LIST SUBPROGRAM NAMES       K1701030
                    *                BIT 10 LIST SOURCE PROGRAM         K1701040
                    *                BIT  9 ONE WORD INTEGERS           K1701050
                    *                BIT  8 ORIGIN                  2-4 K1701055
                    IOCS  BSS     1    IOCS CONTROL CARD WORD           K1701060
                    *                BIT 15 CARD                        K1701070
                    *                BIT 14 PAPER TAPE                  K1701080
                    *                BIT 13 TYPEWRITER                  K1701090
                    *                BIT 12 1403 PRINTER                K1701100
                    *                BIT 11 2501 READER                 K1701110
                    *                BIT 10 KEYBOARD                    K1701120
                    *                BIT  9 1442 PUNCH                  K1701130
                    *                BIT  8 DISK                        K1701140
                    *                BIT  7 1132 PRINTER                K1701150
                    *                BIT  3 PLOTTER                     K1701160
                    DFCNT BSS     1                                     K1701170
                    *                                                   K1701180
                    *                                                   K1701190
                    *                  END OF FORTRAN COMMUNICATION     K1701200
                    *                  AREA                             K1701210
                    *                                                   K1701220
                    BPHAR EQU     *+2      BEGIN PHASE AREA             K1701230
                          DC      0        LOADER WORK AREA             K1701240
                          DC      -47      PHASE ID FOR SLET LOOPUP     K1701250
                          DC      NXTPH-*+1   TBL FOR NEXT PHASE ENTRY  K1701260
                          DC      1        ONE ENTRY TO BE SET BY LDR   K1701270
                          ORG     *-2                                   K1701280
                    ENQ   LDX   1 PHID     GET ID THIS PHASE            K1701290
                          STX  L1 $PHSE    STORE IN SYSTEM PHASE AREA   K1701300
                          BSC  L  ENT                                   K1701310
                    *                                                   K1701320
                    *             MOVES THE STMNT STRING NEXT TO THE    K1701330
                    *             SYMBOL TABLE                          K1701340
                    *             CHECKS FOR SYM TBL OVERLAP            K1701350
                    *                                                   K1701360
                    START LD      EOFS     LOAD END OF STRING ADDR      K1701370
                          S       SOFS     SUBTRACT START OF STRING     K1701380
                          LDX  L3 ZERO     SET XR3                      K1701390
                          A     3 ONE-Z    SIZE OF STRING               K1701400
                          STO     MOVCT    STORE STRING SIZE            K1701410
                          LDX  I1 EOFST    INITIALIZE OUTPUT PT         K1701420
                          MDX   1 -10                                   K1701430
                          LDX  I2 EOFS     INITALIZE INPUT PT           K1701440
                    *                                                   K1701450
                    *             TEST IF OVERLAP ERROR                 K1701460
                          STX  L1 TEMP1    IS THERE OVERLAP             K1701470
                          LD      EOFS     BETWEEN STRING               K1701480
                          S     3 TEMP1-Z  AND SYMBOL TABLE             K1701490
                          BSC  L  MOVST,+Z BRANCH IF NO                 K1701500
                    OVLAP MDX  L  ERROR,1  SET OVERLAP ERROR            K1701510
                          BSC  L  EXIT     GO TO NEXT PHASE             K1701520
                    MOVCT EQU     ENQ                                   K1701530
                    *                                                   K1701540
                    MOVST LD    2 0        MOVE STRING ITEM             K1701550
                          STO   1 0        NEXT TO SYMBOL TABLE         K1701560
                          MDX   2 -1       MOVE POINTER                 K1701570
                          MDX   1 -1                                    K1701580
                          MDX  L  MOVCT,-1 DECREMENT STRING SIZE CT     K1701590
                          MDX     MOVST    CONTINUE LOOP                K1701600
                    *                                                   K1701610
                          STX  L1 SOFIS    NEW START OF STRING ADDR -1  K1701620
                          LD   L  SOFST    PUT START OF SYM TBL ADDR    K1701630
                          STO   3 SSOST-Z  IN SSOST                     K1701640
                    *                                                   K1701650
                    Q1011 LDX  I1 SOFIS    INITIALIZE I/P STRING PT     K1701660
                          LDX  I2 SOFS     INITALIZE O/P STRING PT      K1701670
                          MDX   2 -1                                    K1701680
                    *                                                   K1701690
                    *                                                   K1701700
                    *             INITIALIZES TO SCAN THE STMNT         K1701710
                    Q1021 MDX   1 1        MOVE I/P STRING PT           K1701720
                          MDX   2 1        MOVE O/P STRING PT           K1701730
                    *                                                   K1701740
                          LD    3 ZERO-Z                                K1701750
                          STO   3 STXSW-Z                               K1701760
                          STO   3 CURR-Z   INITIALIZE SWITCHES          K1701770
                          LD    3 H8000-Z                               K1701780
                          STO   3 CURD4-Z                               K1701790
                    *                                                   K1701800
                    *             EXTRACTS THE STMNT TYPE               K1701810
                    Q1022 LD    1 0        LOAD STMNT ID WORD           K1701820
                          AND   3 HF803-Z  ELIMINATE NORM               K1701830
                          A     3 FOUR-Z   ADD ONE TO NORM              K1701840
                          STO   2 0        PUT ON OUTPUT STRING         K1701850
                          AND   3 HF800-Z  GET STMNT ID TYPE            K1701860
                          STO   3 STTYP-Z  SAVE ID TYPE                 K1701870
                          STX  L2 OUTID    STORE ADDR OF O/P ID         K1701880
                          STX  L1 INID     STORE ADDR OF I/P ID         K1701890
                          MDX   1 1        MOVE I/P PT                  K1701900
                          LD    1 -1       LOAD STMNT ID WORD           K1701910
                          BSC  L  Q1023,E  BRANCH IF HAVE STMNT NO.     K1701920
                          MDX     Q1031    IDENTIFY STMNT TYPE          K1701930
                    *                                                   K1701940
                    Q1023 BSI   3 MOVAW-Z  O/P STMNT NO., MOVE PTS      K1701950
                    *                                                   K1701960
                    *             TESTS FOR ARITHMETIC, STMNT FUNCTION, K1701970
                    *             CALL, IF, GO TO, READ, FIND, WRITE,   K1701980
                    *             AND RETURN STMNTS.                    K1701990
                    Q1031 STX   1 Q1033+1  SAVE I/P STRING PT           K1702000
                          LDX  L1 BRTAB-2  INITIALIZE TABLE PT          K1702010
                    Q1032 MDX   1 2        INCREMENT TABLE PT           K1702020
                          LD    1 0        LOAD TABLE WORD              K1702030
                          BSC  L  Q1041,+- BRANCH IF END OF TABLE       K1702040
                          S     3 STTYP-Z  DOES TABLE TYPE MATCH        K1702050
                          S     3 ONE-Z    STATEMENT TYPE               K1702060
                          BSC  L  Q1032,Z  BRANCH IF NOT                K1702070
                          LD    1 1        LOAD BRANCH ADDRESS          K1702080
                          STO     Q1034+1  INSERT BRANCH ADDRESS        K1702090
                    Q1033 LDX  L1 *-*      RESTORE I/P STRING PT        K1702100
                    Q1034 BSC  L  *-*      BRANCH TO PROPER ID SUBR     K1702110
                    *                                                   K1702120
                    *             BRANCH TABLE                          K1702130
                    *             FOR STATEMENT TYPE                    K1702140
                    *                                                   K1702150
                    *                                                   K1702160
                    *             /0001 IS ADDED TO TYPE IN ORDER TO    K1702170
                    *             ENABLE NORMAL SEARCH FOR              K1702180
                    *             TYPE = ZERO (ARITHMETIC STMNT)        K1702190
                    BRTAB DC      /0001    ARITH                        K1702200
                          DC      Q1061                                 K1702210
                          DC      /D001    ARITH STMT FUNCTION          K1702220
                          DC      Q1051                                 K1702230
                          DC      /3001    CALL                         K1702240
                          DC      Q1061                                 K1702250
                          DC      /7801    IF                           K1702260
                          DC      Q1061                                 K1702270
                          DC      /7001    GOTO                         K1702280
                          DC      P2011                                 K1702290
                          DC      /9001    READ                         K1702300
                          DC      P1052                                 K1702310
                          DC      /8801    WRITE                        K1702320
                          DC      P1051                                 K1702330
                          DC      /8001    RETURN                       K1702340
                          DC      P2031                                 K1702350
                          DC      /E801    FIND                         K1702360
                          DC      P1053                                 K1702370
                          DC      0        END-OF-TABLE-VALUE           K1702380
                    *                                                   K1702390
                    *                                                   K1702400
                    *                                                   K1702410
                    *                                                   K1702420
                    P1053 LD    3 FIND-Z   LOAD FIND CALL               K1702430
                          MDX     D1011    CHECK I/O OPERATOR           K1702440
                    *                                                   K1702450
                    *                                                   K1702460
                    P1051 LD    3 FWRT-Z   LOAD WRITE CALL              K1702470
                          MDX     D1011    CHECK FOR I/O OPERATOR       K1702480
                    *                                                   K1702490
                    *             ENTRY PT FOR READ-STMT                K1702500
                    *                                                   K1702510
                    P1052 LD    3 FRED-Z   LOAD READ CALL               K1702520
                    *                                                   K1702530
                    *             DETECTS THE DISK I/O OPTR. OUTPUTS    K1702540
                    *             THE APPROPRIATE OPTRS AND ARGUMENTS   K1702550
                    D1011 STO   3 TEMPY-Z  STORE CALL                   K1702560
                    *                                                   K1702570
                          LD    3 ZERO-Z   CLEAR                        K1702580
                          STO   3 DSWIT-Z  DISK SWITCH AND              K1702590
                          STO   3 USWIT-Z  UNFORMATTED I/O SWITCH       K1702600
                    *                                                   K1702610
                          LD    1 0        LOAD WORD                    K1702620
                          S     3 IOOPR-Z  IS IT I/O OPERATOR           K1702630
                          BSC  L  D1015,+- BRANCH IF YES                K1702640
                          MDX  L  DSWIT,1  SET DISK SWITCH              K1702650
                          LD    1 0        LOAD WORD                    K1702660
                          S     3 DIOOP-Z  IS IT DISK I/O OPERATOR      K1702670
                          BSC  L  Q2008,+- BRANCH IF YES                K1702680
                          LD    3 EXPRO-Z  LOAD EXPRESSION OPERATOR     K1702690
                          BSI   3 OUTP-Z   OUTPUT ON STRING             K1702700
                    *                                                   K1702710
                          BSC  L  Q2011    IDENTIFY NEXT OPERATOR       K1702720
                    *                                                   K1702730
                    *             DISK I/O OPTR ENCOUNTERED AFTER       K1702740
                    *             AN ARITHMETIC EXPRESSION              K1702750
                    *                                                   K1702760
                    D1014 LD    3 EXPRO-Z  LOAD EXPRESSION OPERATOR     K1702770
                          BSI   3 OUTP-Z   OUTPUT ON STRING             K1702780
                    *                                                   K1702790
                    *                                                   K1702800
                    D1015 LD    1 2        IS THIS UNFORMATTED I/O      K1702810
                          BSC  L  D1021,Z+ BRANCH IF NOT                K1702820
                          STX  L  USWIT    SET UNFORMATTED I/O SWITCH   K1702830
                    *                                                   K1702840
                    D1021 LD    3 TEMPY-Z  OUTPUT CALL WITH DISK        K1702850
                          BSI   3 DTEST-Z  AND UNFORMATTED I/O TEST     K1702860
                    *                                                   K1702870
                          LD    1 1        LOAD AND O/P ADDR OF         K1702880
                          BSI   3 OUTP-Z   LOGICAL UNIT NUMBER          K1702890
                          LD    3 USWIT-Z  IS STMNT UNFORMATTED         K1702900
                          BSC  L  D1024,+- BRANCH IF NO                 K1702910
                          MDX   1 2        INCREMENT PT                 K1702920
                          MDX     D1026    CHECK FOR FIND STMNT         K1702930
                    D1024 LD    1 2        LOAD AND OUTPUT              K1702940
                          BSI   3 OUTP-Z   ADDRESS OF FORMAT            K1702950
                          MDX   1 3        MOVE PT                      K1702960
                    D1026 LD    1 0        LOAD WORD                    K1702970
                          BSC  L  P3011,Z  BRANCH IF NOT SEMI-COLON     K1702980
                    *                                                   K1702990
                    *             GENERATES A CALL SCOMP WHEN A         K1703000
                    *             WRITE STMNT IS DETECTED               K1703010
                    D1031 EQU     *                                     K1703020
                    P1061 EQU     D1031                                 K1703030
                          MDX  L  USWIT,0  OUTPUT CALL COMPLETE IF      K1703040
                          MDX     P1062    *UNFORMATTED I/O             K1703050
                    *                                                   K1703060
                          LD    3 STTYP-Z  LOAD STMNT ID TYPE           K1703070
                          S     3 WRITE-Z  IS IT A WRITE STATEMENT      K1703080
                          BSC  L  Q1021,Z  BRANCH IF NOT                K1703090
                    P1062 LD    3 FCOMP-Z  OUTPUT .CALL SCOMP.          K1703100
                          BSI   3 DTEST-Z  WITH DISK TEST               K1703110
                          BSC  L  Q1021    GET NEXT STMNT               K1703120
                    *                                                   K1703130
                    *                                                   K1703140
                    *             GO TO STMNT                           K1703150
                    *             PRODUCES A 'BSC  L' INSTRUCTION FROM  K1703160
                    *             A SIMPLE GO TO STMNT. IF TRACING  IS  K1703170
                    *             REQUIRED, OUTPUTS THE CALL TO THE     K1703180
                    *             TRACE ROUTINE                         K1703190
                    *                                                   K1703200
                    P2011 LD    1 1        IS THIS UNCONDITIONAL GO TO  K1703210
                          BSC     Z        SKIP IF YES                  K1703220
                          MDX     P2012    COMPUTED GO TO BRANCH        K1703230
                          LD    3 HF800-Z  OUTPUT .BSC L.               K1703240
                          BSI   3 OUTP-Z   PUT ON STRING                K1703250
                          LD    1 0        LOAD BRANCH TO ADDR          K1703260
                          AND   3 H07FF-Z  COMBINE INSTRUCTION AND      K1703270
                          A     2 0        ADD ADDRESS TO GET           K1703280
                          STO   2 0        *****  BSC  L  ADDRESS       K1703290
                          MDX   1 1        MOVE I/P PT                  K1703300
                          BSC  L  Q1021    GO TO NEXT STMNT             K1703310
                    *                                                   K1703320
                    *             COMPUTED GOTO                         K1703330
                    *             PRODUCES A 'BSC  I1' INSTR FROM A     K1703340
                    *             COMPUTED GO TO OPTR. IF TRACING IS    K1703350
                    *             REQUIRED, OUTPUTS THE CALL TO THE     K1703360
                    *             TRACE ROUTINE                         K1703370
                    P2012 LD    1 1        LOAD INTEGER VARIABLE        K1703380
                          AND   3 H07FF-Z  COMBINE WITH .LDX  I1.       K1703390
                          A     3 LDXI1-Z  TO GET                       K1703400
                          BSI   3 OUTP-Z   *****  MDX  I1 INTEGER VAR   K1703410
                    *                                                   K1703420
                    *             MOVE FIRST STMNT NUMBER NAME ON       K1703430
                    *             STRING SO THAT ALL STMNT NUMBERS      K1703440
                    *             WILL BE CONSECUTIVE                   K1703450
                    *                                                   K1703460
                          LD    1 0        MOVE FIRST STMNT NO.         K1703470
                          STO   1 1        ON STRING                    K1703480
                    *                                                   K1703490
                    *             TEST IF TRACE REQUIRED                K1703500
                          LD   L  CCWD     LOAD CONTROL CARD WORD       K1703510
                          SLA     15       IS TRACE REQUIRED            K1703520
                          BSC     -        SKIP IF YES                  K1703530
                          MDX     P2021    BRANCH IF NOT                K1703540
                    *                                                   K1703550
                          LD    3 FGOTO-Z  OUTPUT .CALL SGOTO.          K1703560
                          BSI   3 OUTP-Z   ON OUTPUT STRING             K1703570
                          MDX     P202A    OUTPUT STMNT NOS.            K1703580
                    *                                                   K1703590
                    P2021 LD    3 BSCI1-Z  LOAD .BSC  I1. INSTRUCTION   K1703600
                          BSI   3 OUTP-Z   COMBINE WITH .*-1. TO GET    K1703610
                          LD    3 ASTM1-Z  *****  BSC  I1 *-1           K1703620
                          BSI   3 OUTP-Z   OUTPUT INSTRUCTION           K1703630
                    *                                                   K1703640
                    P202A MDX   1 1        MOVE I/P PT                  K1703650
                    *                                                   K1703660
                    *             OUTPUT STATEMENT NUMBERS IN           K1703670
                    *             COMPUTED GO TO                        K1703680
                    *                                                   K1703690
                    P2022 LD    1 0        LOAD WORD                    K1703700
                          BSC  L  Q1021,+- BRANCH IF SEMICOLON          K1703710
                          BSI   3 OUTP-Z   OUTPUT STMNT NO.             K1703720
                          MDX   1 1        MOVE I/P STRING PT           K1703730
                          MDX     P2022    CONTINUE LOOP                K1703740
                    *                                                   K1703750
                    *             GENERATES THE RETURN LINKAGE FROM A   K1703760
                    *             SUBPROGRAM. ALLOWS THE ARGUMENTS TO   K1703770
                    *             BE PASSED                             K1703780
                    P2031 LD   L  SORF     IS THIS MAINLINE PROGRAM     K1703790
                          BSC  L  ERRR,+-  BRANCH IF YES                K1703800
                          BSC  L  P2034,+  BRANCH IF SUBROUTINE         K1703810
                          LD   L  FNAME    LOAD PROGRAM NAME            K1703820
                          BSI   3 GETID-Z  GET SYMBOL TABLE ID WORD     K1703830
                          SLA     1                                     K1703840
                          BSC     -        SKIP IF INTEGER FUNCTION     K1703850
                          MDX     P2032    BRANCH IF NOT                K1703860
                          LD   L  FNAME    LOAD PROGRAM NAME            K1703870
                          OR    3 LDL-Z    COMBINE WITH .LD   L. TO GET K1703880
                          MDX     P2033    *****  LD   L  PROGRAM NAME  K1703890
                    P2032 LD    3 FLD-Z    LOAD .CALL FLD.              K1703900
                          BSI   3 OUTP-Z   PUT CALL ON OUTPUT STRING    K1703910
                          LD   L  FNAME    LOAD FUNCTION NAME           K1703920
                    P2033 BSI   3 OUTP-Z   PUT ON OUTPUT STRING         K1703930
                    P2034 MDX  L  RETCT,1  COUNT RETURN STMNTS          K1703940
                          LD    3 H5080-Z  LOAD .BSC I.                 K1703950
                          BSI   3 OUTP-Z   PUT ON OUTPUT STRING         K1703960
                          LD    3 H5F00-Z  OUTPUT BLANK WHICH WILL BE   K1703970
                    *                      REPLACED BY ENTRY-PT ADDR    K1703980
                    *                      *****  BSC  I  ENTRY PT      K1703990
                          BSI   3 OUTP-Z   PUT ON OUTPUT STRING         K1704000
                          BSC  L  Q1021    GO TO NEXT STMNT             K1704010
                    *                                                   K1704020
                    *             CHANGE RETURN STMNT INTO              K1704030
                    *             ERROR STATEMENT                       K1704040
                    *                                                   K1704050
                    ERRR  LD   I  OUTID    LOAD RETURN STMNT ID TYPE    K1704060
                          A       DIFF     CHANGE TO ERROR STMNT ID     K1704070
                          STO  I  OUTID    PUT BACK ON O/P STRING       K1704080
                          LD    3 C69-Z    PUT ERROR NO. 69             K1704090
                          BSI   3 OUTP-Z   ON OUTPUT STRING             K1704100
                          BSC  L  Q1021    GO TO NEXT STMNT             K1704110
                    DIFF  DC      /A000-/8000   ERROR STMNT ID TYPE 2-1 K1704120
                    *                                                   K1704130
                    *             IOOP                                  K1704140
                    P3011 LD    1 0        LOAD WORD                    K1704150
                          S     3 LOP-Z    IS IT LIST OPERATOR          K1704160
                          BSC     +-       SKIP IF NOT                  K1704170
                          MDX     P3031    BRANCH IF LIST OPERATOR      K1704180
                    *                                                   K1704190
                          LD    1 0        LOAD WORD                    K1704200
                          S     3 H0018-Z  IS IT LITERAL SUBSCRIPT      K1704210
                          BSC  L  P3025,+- BRANCH IF YES                K1704220
                          BSC  L  P4011,+  BRANCH IF LESS THAN (O OPTR  K1704230
                          S     3 H0008-Z  IS IT GREATER THAN (3 OPTR   K1704240
                          BSC  L  P4011,-Z BRANCH IF YES                K1704250
                    P3023 BSI  L  SBSN     PROCESS SUBSCRIPT OPERATORS  K1704260
                          MDX     P3011    CHECK NEXT WORD              K1704270
                    P3025 BSI  L  SBSLT    PROCESS LITERAL SUBSCRIPT    K1704280
                          MDX     P3011    CHECK NEXT WORD              K1704290
                    *                                                   K1704300
                    *             IDENTIFIES THE LIST VARIABLE TYPE     K1704310
                    P3031 LD    1 1        LOAD WORD                    K1704320
                          BSI   3 GETID-Z  GET SYM TBL ID               K1704330
                          AND   3 H1800-Z  IS IT DIMENSIONED            K1704340
                          BSC     +-       SKIP IF YES                  K1704350
                          MDX     P3043    BRANCH IF NOT                K1704360
                          LD    1 1        LOAD WORD                    K1704370
                          AND   3 H7800-Z  GET PSEUDO INDEX FOR SGT     K1704380
                          BSC     +        SKIP IF HAVE INDEX           K1704390
                          MDX     P3051    BRANCH IF NOT                K1704400
                          BSI   3 SCHP1-Z  LOAD LITERAL SUBSC OFFSET    K1704410
                    *                                                   K1704420
                    *             GENERATES THE CALLS FOR THE           K1704430
                    *             DIMENSIONED LIST VARIABLES WITH THE   K1704440
                    *             ASSOCIATED SGT                        K1704450
                    *                                                   K1704460
                    P3041 LD    1 1        LOAD WORD                    K1704470
                          BSI   3 GETID-Z  GET SYM TBL ID WORD          K1704480
                          SLA     1        IS IT REAL VARIABLE          K1704490
                          BSC  L  P304A,-  BRANCH IF YES                K1704500
                    *                                                   K1704510
                          LD    3 FIOIX-Z  LOAD .LIBF SIOIX., OUTPUT    K1704520
                          MDX     P304B    CALL, BASE ADDR OF DIM VAR   K1704530
                    *                                                   K1704540
                    P304A LD    3 FIOFX-Z  LOAD .LIBF SIOFX., OUTPUT    K1704550
                    P304B BSI   3 OUTIO-Z  CALL, BASE ADDR OF DIM VAR   K1704560
                    *                                                   K1704570
                    P3042 MDX   1 2        MOVE I/P PT                  K1704580
                          MDX     P3011    CHECK NEXT WORD              K1704590
                    *                                                   K1704600
                    *                                                   K1704610
                    *             GENERATES THE CALL FOR NON-           K1704620
                    *             DIMENSIONED LIST VARIABLES WITH THE   K1704630
                    *             ASSOCIATED SGT                        K1704640
                    *                                                   K1704650
                    P3043 LD    1 1        LOAD WORD                    K1704660
                          BSI   3 GETID-Z  GET SYM TBL ID WORD          K1704670
                          SLA     1        IS IT REAL VARIABLE          K1704680
                          BSC  L  P3044,-  BRANCH IF YES                K1704690
                          LD    3 FIOI-Z   LOAD .LIBF SIOI.             K1704700
                          MDX     P3045    OUTPUT CALL, ADDR OF VAR     K1704710
                    *                                                   K1704720
                    P3044 LD    3 FIOF-Z   LOAD .LIBF SIOF.             K1704730
                    P3045 BSI   3 OUTIO-Z  OUTPUT CALL, ADDR OF VAR     K1704740
                          MDX     P3042    GET NEXT WORD                K1704750
                    *                                                   K1704760
                    *                                                   K1704770
                    *             GENERATES THE CALL FOR A              K1704780
                    *             DIMENSIONED LIST VARIABLE WITHOUT     K1704790
                    *             THE ASSOCIATED SGT                    K1704800
                    P3051 LD    1 1        LOAD WORD                    K1704810
                          BSI   3 GETID-Z  GET SYM TBL ID WORD          K1704820
                          SLA     1        IS IT REAL VARIABLE          K1704830
                          BSC  L  P3052,-  BRANCH IF YES                K1704840
                          LD    3 FIOAI-Z  LOAD .LIBF SIOAI., O/P CALL  K1704850
                          MDX     P3053    ADDR OF 1ST ELEMENT IN ARRAY K1704860
                    *                                                   K1704870
                    P3052 LD    3 FIOAF-Z  LOAD .LIBF SIOAF., O/P CALL  K1704880
                    P3053 BSI   3 OUTIO-Z  ADDR OF 1ST ELEMENT IN ARRAY K1704890
                    *                                                   K1704900
                    *             OUTPUT ARRAY SIZE                     K1704910
                    *             (.TAGGED. TO FACILITATE HANDLING)     K1704920
                    *                                                   K1704930
                          MDX  L  SYMT1+1,-3  DECR SYM TBL ADDR         K1704940
                          LD   I  SYMT1+1  LOAD ARRAY SIZE              K1704950
                          OR    3 H8000-Z  TAG SIZE WORD                K1704960
                          BSI   3 OUTP-Z   OUTPUT ARRAY SIZE            K1704970
                          MDX     P3042                                 K1704980
                    *                                                   K1704990
                    *                                                   K1705000
                    *             GENERATES THE DO INITIALIZE CODE      K1705010
                    *             (DO-OPERATOR ENCOUNTERED)             K1705020
                    *                                                   K1705030
                    P4011 LD    1 0        LOAD WORD                    K1705040
                          BSC  L  P1061,+- BRANCH IF SEMI-COLON         K1705050
                          S     3 DOAOP-Z  IS IT DO OPERATOR            K1705060
                          BSC     Z        SKIP IF YES                  K1705070
                          MDX     P4023    BRANCH IF NOT                K1705080
                          LD    3 ZERO-Z   CLEAR                        K1705090
                          STO   3 CURR-Z   PSX-IN-USE SWITCH            K1705100
                          LD    1 2        LOAD INITIAL DO VALUE        K1705110
                          AND   3 H07FF-Z  COMBINE WITH .LD L.          K1705120
                          A     3 LDL-Z    TO GET                       K1705130
                          BSI   3 OUTP-Z   *****  LD  L  INITIAL VALUE  K1705140
                          LD    1 1        LOAD INDEX                   K1705150
                          AND   3 H07FF-Z  COMBINE WITH .STO L.         K1705160
                          A     3 STOL-Z   TO GET                       K1705170
                          BSI   3 OUTP-Z   *****  STO  L  INDEX         K1705180
                          LD    3 GENLO-Z  OUTPUT GENERATED             K1705190
                          BSI   3 OUTP-Z   LABEL OPERATOR               K1705200
                          MDX  L  GENLO,1  INCREMENT STORED GENERAL     K1705210
                    *                      LABEL OPTR BY ONE            K1705220
                    P4021 MDX   1 3        MOVE I/P PT                  K1705230
                          BSC  L  P3011    CHECK NEXT ELEMENT           K1705240
                    *                                                   K1705250
                    *             GENERATES DO TEST CODE                K1705260
                    P4023 LD    1 0                                     K1705270
                          S     3 DOTOP-Z  IS WORD DO TEST OPTR         K1705280
                          BSC  L  P1061,Z  BRANCH IF NOT                K1705290
                    *                                                   K1705300
                    *             DOTEST                                K1705310
                          MDX  L  GENLO,-1 DECREMENT GENERAL LABEL      K1705320
                    *                      OPERATOR NUMBER BY 1         K1705330
                          LD    1 3        IS INCREMENT GT ONE          K1705340
                          BSC     -        SKIP IF YES                  K1705350
                          MDX     P4032    BRANCH IF INCREMENT IS ONE   K1705360
                          BSI   3 OULDL-Z  *****  LD   L  INDEX         K1705370
                          LD    1 3        LOAD INCREMENT               K1705380
                          AND   3 H07FF-Z  COMBINE WITH .A L.           K1705390
                          A     3 AL-Z     TO GET                       K1705400
                          BSI   3 OUTP-Z   *****  A    L  INCREMENT     K1705410
                          LD    1 1        LOAD INDEX                   K1705420
                          AND   3 H07FF-Z  COMBINE WITH .STO L.         K1705430
                          A     3 STOL-Z   TO GET                       K1705440
                          BSI   3 OUTP-Z   *****  STO  L  INDEX         K1705450
                    P4031 BSI     P4035    *****  S    L  LIMIT VALUE   K1705460
                    *                      *****  BSC  L  GEN LAB,+Z    K1705470
                          MDX   1 1        MOVE I/P PT                  K1705480
                          MDX     P4021    CHECK NEXT WORD              K1705490
                    *                                                   K1705500
                    *                                                   K1705510
                    P4032 LD    3 MDXL1-Z  LOAD .MDX L  *-*,1.          K1705520
                          BSI   3 OUTP-Z   OUTPUT                       K1705530
                          LD    1 1        LOAD INDEX                   K1705540
                          BSI   3 OUTP-Z   *****  MDX  L  INDEX,1       K1705550
                          BSI   3 OULDL-Z  *****  LD   L  INDEX         K1705560
                          BSI     P4035    *****  S    L  LIMIT VALUE   K1705570
                          MDX     P4021    *****  BSC  L  GEN LAB,+Z    K1705580
                    *                      CHECK NEXT WORD              K1705590
                    *                                                   K1705600
                    *             SUBROUTINE TO OUTPUT                  K1705610
                    *                   S    L  LIMIT VALUE             K1705620
                    *                   BSC  L  GEN LAB,+Z              K1705630
                    *                                                   K1705640
                    P4035 DC      0        ENTRY POINT                  K1705650
                          LD    1 2        LOAD LIMIT VALUE             K1705660
                          AND   3 H07FF-Z  COMBINE WITH .S L.           K1705670
                          A     3 SL-Z     TO GET                       K1705680
                          BSI   3 OUTP-Z   *****  S    L  LIMIT VALUE   K1705690
                          LD    3 GENLO-Z  LOAD RETURN INSTRUCTION      K1705700
                          BSI   3 OUTP-Z   *****  BSC  L  GEN LAB,+Z    K1705710
                          BSC  I  P4035    RETURN                       K1705720
                    *                                                   K1705730
                    *             INSERTS THE FUNCTION NAME IN NAME     K1705740
                    *             CODE INTO FNAME IN THE FORTRAN        K1705750
                    *             COMMUNICATIONS AREA                   K1705760
                    TMTE  SLA     0        NOP                          K1705770
                    *                                                   K1705780
                    *             PROCESS .FNAME. IN                    K1705790
                    *             COMMUNICATION AREA                    K1705800
                    *                                                   K1705810
                    *             IF MAINLINE PROGRAM, NO ACTION TAKEN  K1705820
                    *                                                   K1705830
                          LD   L  SORF     IS THIS MAINLINE PROGRAM     K1705840
                          BSC  L  EXIT,+-  BRANCH IF YES                K1705850
                    *                                                   K1705860
                    *             IT IS SUBROUTINE OR FUNCTION          K1705870
                    *             REPLACE SYM TBL REF IN FNAME BY       K1705880
                    *             NAME (WITH CHARACTERS PACKED IN       K1705890
                    *             OUTPUT MODE)                          K1705900
                    *                                                   K1705910
                          LD   L  FNAME    LOAD PROGRAM NAME            K1705920
                          BSC  L  EXIT,-   BRANCH IF ALREADY HAVE NAME  K1705930
                          BSI   3 GETID-Z  GET SYM TBL ID WORD          K1705940
                          LDX  I2 SYMT1+1  LOAD SYM TBL ID WORD ADDR    K1705950
                          LD    2 2        LOAD 2ND WORD OF NAME        K1705960
                          SRT     15       PUT IN EXTENSION             K1705970
                          LD    2 1        LOAD FIRST WORD OF NAME      K1705980
                          SLA     1        REMOVE ALPHA-INDICATOR BIT   K1705990
                          SRA     1        RESTORE WORD                 K1706000
                          SRT     1        RIGHT JUSTIFY NAME           K1706010
                          STO  L  FNAME    STORE FIRST WORD OF NAME     K1706020
                          RTE     16       PUT 2ND WORD OF NAME IN ACC  K1706030
                          STO  L  FNAME+1  STORE 2ND WORD               K1706040
                    *                                                   K1706050
                    *             MAKE SYM TBL ID WORD .VARIABLE.       K1706060
                          LD    2 0        LOAD SYM TBL ID WORD         K1706070
                          AND   3 H4020-Z  CLEAR ALL BUT REAL/INTEGER   K1706080
                    *                      AND DEFINED BITS IN ID WORD  K1706090
                          STO   2 0        STORE ID WORD IN SYM TBL     K1706100
                    *                                                   K1706110
                    *             IF SUBR, MAKE SYM TBL ENTRY LOOK      K1706120
                    *             LIKE REFERENCED GENERATED LABEL       K1706130
                    *             INSTEAD  (THIS PSEUDO-ENTRY WILL NOT  K1706140
                    *             CAUSE CONFUSION IN FOLLOWING          K1706150
                    *             PHASES BUT WILL BE PASSED BY          K1706160
                    *             WITHOUT ACTION)                       K1706170
                    *                                                   K1706180
                          LD   L  SORF     LOAD SORF WORD               K1706190
                          BSC  L  EXIT,-   BRANCH IF FUNCTION           K1706200
                    *                                                   K1706210
                          LD    3 H0220-Z  LOAD REFERENCED STMNT NO. ID K1706220
                          STO   2 0        PUT IN SYM TBL               K1706230
                          LD    3 ZERO-Z   LOAD ZERO                    K1706240
                          STO   2 1        PUT IN                       K1706250
                          STO   2 2        AS NAME                      K1706260
                          BSC  L  EXIT     GO TO NEXT PHASE             K1706270
                    *                                                   K1706280
                    *             RETAINS THE CURRENT STMNT IN THE      K1706290
                    *             STRING UNALTERED                      K1706300
                    Q1041 LDX  I1 INID     RESET I/P STRING PT          K1706310
                          LDX  I2 OUTID    RESET O/P STRING PT          K1706320
                          LD    1 0        LOAD STMNT ID WORD           K1706330
                          AND   3 H07FC-Z  EXTRACT                      K1706340
                          STO   3 NORM-Z   NORM                         K1706350
                    Q1042 LD    1 0        AND STORE                    K1706360
                          STO   2 0        MOVE ONE WORD                K1706370
                          MDX  L  NORM,-4  TO O/P STRING                K1706380
                          MDX     Q1043    DECREMENT NORM BY ONE        K1706390
                    *                      TEST IF LAST OUTPUT STMT     K1706400
                    *                      WAS END STMNT                K1706410
                          LD    3 STTYP-Z  CONTINUE LOOP                K1706420
                          S     3 TEND-Z   LOAD STMNT ID TYPE           K1706430
                          BSC  L  Q1021,Z  IS IT END STMNT              K1706440
                    *                      BRANCH IF NOT                K1706450
                    Q1044 STX  L2 EOFS     NEW END OF STRING ADDRESS    K1706460
                    *                                                   K1706470
                    *             TEST THAT SUBPROGRAM CONTAINS AT      K1706480
                    *             LEAST ONE RETURN-STATEMENT            K1706490
                    *                                                   K1706500
                          LD   L  SORF     LOAD SORF                    K1706510
                          BSC  L  RETRN,Z  BRANCH UNLESS MAINLINE       K1706520
                          LD    3 RETCT-Z  DOES PROGRAM HAVE RETURN     K1706530
                          BSC  L  P1044,+- STMNT - BRANCH IF NOT        K1706540
                          MDX     ERRRR    ERROR IF YES                 K1706550
                    RETRN LD    3 RETCT-Z  DOES PROGRAM HAVE RETURN     K1706560
                          BSC  L  P1044,Z  STMNT - BRANCH IF YES        K1706570
                    ERRRR LD    3 HA008-Z  LOAD ERROR STMNT ID WORD     K1706580
                          STO   2 0        PUT ON OUTPUT STRING         K1706590
                          LD    3 C69-Z    LOAD ERROR NO.               K1706600
                          STO   2 1        PUT ON OUTPUT STRING         K1706610
                          LD    1 0        LOAD END STMNT               K1706620
                          STO   2 2        OUTPUT                       K1706630
                          MDX   2 2        MOVE OUTPUT PT               K1706640
                    *                                                   K1706650
                    P1044 STX  L2 EOFS     NEW END OF STRING ADDR       K1706660
                    *                                                   K1706670
                    *                                                   K1706680
                          BSC  L  TMTE     BRANCH TO TERMINATE PHASE    K1706690
                    *                                                   K1706700
                    *                                                   K1706710
                    Q1043 MDX   1 1        MOVE I/P PT                  K1706720
                          MDX   2 1        MOVE O/P PT                  K1706730
                          MDX     Q1042    CONTINUE LOOP                K1706740
                    *                                                   K1706750
                    *             OUTPUTS THE NAME AND PARAMETERS FOR   K1706760
                    *             STMNT FUNCTION STATEMENTS             K1706770
                    *                                                   K1706780
                    Q1051 BSI   3 MOVAW-Z  OUTPUT WORD, MOVE PTS        K1706790
                          LD    1 0        LOAD WORD                    K1706800
                          BSC  L  Q1051,+Z BRANCH NOT OPERATOR          K1706810
                    *                                                   K1706820
                    *             SAVE OUTPUT POINTER + 1               K1706830
                    *             AT TEMPP                              K1706840
                    *                                                   K1706850
                    Q1061 STX  L2 TEMPP    SAVE OUTPUT PT               K1706860
                          MDX  L  TEMPP,1  MOVE O/P PT                  K1706870
                    *                                                   K1706880
                    *             IDENTIFY NEXT OPERATOR                K1706890
                    *                                                   K1706900
                    *                                                   K1706910
                    Q2011 LD    1 0        LOAD WORD                    K1706920
                          BSC  L  Q2041,+- BRANCH IF SEMI-COLON         K1706930
                          S     3 DIOOP-Z  IS IT DISK I/O OPERATOR      K1706940
                          BSC  L  Q2009,Z  BRANCH IF NOT                K1706950
                          LD    2 0        LOAD LAST O/P WORD           K1706960
                          S     3 EXPRO-Z  IS IT EXPRESSION OPTR        K1706970
                          BSC  L  Q2012,+- BRANCH IF YES                K1706980
                    *                                                   K1706990
                          LD    1 2        LOAD RECORD NUMBER           K1707000
                          AND   3 H7800-Z  IS IT SUBSCRIPTED            K1707010
                          BSC  L  D1014,+- BRANCH IF NOT                K1707020
                    *                                                   K1707030
                    Q2012 MDX   1 1        MOVE I/P PT                  K1707040
                          BSI   3 SCHP1-Z  LOAD LITERAL SUBSC OFFSET    K1707050
                          MDX   1 -1       DECREMENT I/P PT             K1707060
                          LD    3 H6100-Z  LOAD .MDX L1.                K1707070
                          BSI   3 OUTP-Z   OUTPUT                       K1707080
                          LD    1 2        LOAD DIMENSION               K1707090
                          AND   3 H87FF-Z  REMOVE SUBSCRIPT BITS        K1707100
                          STO   1 2        RESTORE                      K1707110
                    *                                                   K1707120
                          BSI   3 OUTP-Z   OUTPUT                       K1707130
                          LD    3 H6000-Z  LOAD NOP (MDX 0)             K1707140
                          BSI   3 OUTP-Z   OUTPUT NOP                   K1707150
                          LD    3 H6200-Z  LOAD .STX L1.                K1707160
                          BSI   3 OUTP-Z   OUTPUT                       K1707170
                          LD    3 H8003-Z  LOAD                         K1707180
                          BSI   3 OUTP-Z   OUTPUT                       K1707190
                          LD    3 ZERO-Z     CLEAR                  2-5 K1707192
                          STO   3 CURR-Z     CURR                   2-5 K1707194
                          BSC  L  D1014    OUTPUT EXPRESSION OPERATOR   K1707200
                    *                                                   K1707210
                    *                                                   K1707220
                    Q2008 LD    1 2        LD RECD NO.                  K1707230
                          AND   3 H7800-Z  IS IT SUBSCRIPTED            K1707240
                          BSC  L  D1021,+- BRANCH IF NOT                K1707250
                          LD    3 EXPRO-Z  OUTPUT EXPRESSION OPERATOR   K1707260
                          BSI   3 OUTP-Z   *                            K1707270
                          MDX     Q2012    CONTINUE                     K1707280
                    *                                                   K1707290
                    Q2009 LD    1 0        LOAD WORD                    K1707300
                    *                                                   K1707310
                          S     3 H002E-Z  IS IT CALL OPERATOR          K1707320
                          BSC  L  Q4011,+- BRANCH IF YES                K1707330
                          A     3 H0016-Z  IS IT LITERAL SUBSC OPTR     K1707340
                          BSC  L  Q3051,+- BRANCH IF YES                K1707350
                          BSC  L  Q2013,+  IS IT SPECIAL PARENTHESIS    K1707360
                          S     3 H0008-Z  FOR DIMENSIONED ARRAYS       K1707370
                          BSC  L  Q3011,Z+ BRANCH IF YES                K1707380
                          BSC  L  Q2021,+- BRANCH IF UNARY MINUS        K1707390
                    Q2013 LD    1 0        LOAD WORD                    K1707400
                          S     3 H0014-Z  IS IT IF OPERATOR            K1707410
                          BSC  L  Q2031,Z  BRANCH IF NOT                K1707420
                    *                                                   K1707430
                    *             IF OPERATOR ENCOUNTERED               K1707440
                    *             TEST IF NEXT WD IS STMNT NUMBER       K1707450
                          LD    1 1        LOAD NEXT WORD               K1707460
                          BSI   3 SYMT-Z   GET SYM TBL ID WORD          K1707470
                          AND   3 H0200-Z  IS IT STMNT NO.              K1707480
                          BSC  L  MOVE4,Z  BRANCH IF YES                K1707490
                          BSI   3 SCHP1-Z  LOAD LITERAL SUBSC OFFSET    K1707500
                          BSI   3 MOVAW-Z  OUTPUT WORD, MOVE POINTERS   K1707510
                    MOVE4 BSI   3 MOVAW-Z  OUTPUT WORD, MOVE POINTERS   K1707520
                    MOVE3 BSI   3 MOVAW-Z  OUTPUT WORD, MOVE POINTERS   K1707530
                    MOVE2 BSI   3 MOVAW-Z  OUTPUT WORD, MOVE POINTERS   K1707540
                    MOVE1 BSI   3 MOVAW-Z  OUTPUT WORD, MOVE POINTERS   K1707550
                          MDX     Q2011    IDENTIFY NEXT OPERATOR       K1707560
                    *                                                   K1707570
                    *             UNARY MINUS ENCOUNTERED               K1707580
                    *             TEST IF NEXT WORD IS OPERATOR         K1707590
                    Q2021 LD    1 1        LOAD NEXT WORD               K1707600
                          BSC  L  MOVE1,-  BRANCH IF NEXT WORD OPERATOR K1707610
                    *                                                   K1707620
                    *                                                   K1707630
                    Q2022 BSI   3 SCHP1-Z  LOAD LITERAL SUBSC OFFSET    K1707640
                          MDX     MOVE2    MOVE WORD                    K1707650
                    *                                                   K1707660
                    *             .OTHER OPERATOR. ENCOUNTERED          K1707670
                    Q2031 LD    1 2        LOAD WORD                    K1707680
                          BSC  L  Q2022,-  BRANCH IF OPERATOR           K1707690
                          LD    1 0        LOAD WORD                    K1707700
                          S     3 H000E-Z  IS IT ASSIGN                 K1707710
                          BSC  L  Q2032,Z  BRANCH IF NOT                K1707720
                    *                                                   K1707730
                    *             .ASSIGN. FOLLOWED BY TWO NAMES        K1707740
                    *             ENCOUNTERED, EXCHANGE WORDS AT        K1707750
                    *             POINTER+1 AND POINTER+2               K1707760
                    *                                                   K1707770
                          LD    1 1        LOAD FIRST WORD              K1707780
                          RTE     16       PUT IN EXTENSION             K1707790
                          LD    1 2        LOAD 2ND WORD                K1707800
                          STO   1 1        PLACE IN FIRST WORD LOCATION K1707810
                          RTE     16       PUT 1ST WORD IN ACCUMULATOR  K1707820
                          STO   1 2        PLACE IN 2ND WORD LOCATION   K1707830
                    Q2032 BSI   3 SCHP1-Z  SUBSCR CHECK, PTR+1          K1707840
                          BSI   3 MOVAW-Z  OUTPUT WORD, MOVE POINTERS   K1707850
                          BSI   3 MOVAW-Z  OUTPUT WORD, MOVE POINTERS   K1707860
                          BSI   3 SCHP2-Z  LOAD LITERAL SUBSC OFFSETS   K1707870
                          MDX     MOVE1    MOVE WORD                    K1707880
                    *                                                   K1707890
                    *             SEMICOLON ENCOUNTERED                 K1707900
                    *             MOVE LAST WORD AND TEST SWITCH        K1707910
                    *                                                   K1707920
                    Q2041 BSI   3 MOVAW-Z  OUTPUT WORD, MOVE POINTERS   K1707930
                          MDX   1 -1       DECREMENT I/P PT             K1707940
                          LD    3 STXSW-Z  TEST STX SWITCH              K1707950
                          BSC  L  Q5011,Z  BRANCH IF SET                K1707960
                          BSC  L  Q1021    GO TO NEXT STMNT             K1707970
                    *                                                   K1707980
                    *             SUBSCRIPT OPERATOR ENCOUNTERED        K1707990
                    *                                                   K1708000
                    Q3011 BSI     SBSN     PROCESS SUBSCR OPTR          K1708010
                          MDX     Q2011    IDENTIFY NEXT OPERATOR       K1708020
                    *                                                   K1708030
                    *             LITTERAL SUBSC OPERATOR ENCOUNTERED   K1708040
                    Q3051 BSI     SBSLT    PROCESS LITERAL SUBSCRIPT    K1708050
                          MDX     Q2011    IDENTIFY NEXT OPERATOR       K1708060
                    *                                                   K1708070
                    *                                                   K1708080
                    *             GENERATES THE CALL FOR SUBSCRIPT      K1708090
                    *             CALCULATION WITH ARGUMENTS            K1708100
                    *             MAKES THE SGT TBL ENTRY               K1708110
                    *                                                   K1708120
                    SBSN  DC      0        ENTRY POINT                  K1708130
                          A     3 H0008-Z  GET DIMENSION COUNT          K1708140
                          STO   3 DIMCT-Z  STORE DIMENSION COUNT        K1708150
                          LD    3 H1900-Z  LOAD .CALL SUBSC.            K1708160
                          BSI   3 OUTP-Z   OUTPUT CALL                  K1708170
                          LD    1 1        LOAD WORD                    K1708180
                          AND   3 H87FF-Z  GET SYM TBL ENTRY NO.        K1708190
                          BSI   3 OUTP-Z   OUTPUT                       K1708200
                          LD    1 1        LOAD WORD                    K1708210
                          AND   3 H7800-Z  GET PSEUDO INDEX             K1708220
                          SRA     11       RIGHT JUSTIFY                K1708230
                          STO   3 CURR-Z   PUT IN CURR                  K1708240
                          LD    1 2        LOAD D4                      K1708250
                          SLA     1        DELETE                       K1708260
                          SRT     1        BIT 0                        K1708270
                          BSI   3 OUTP-Z   OUTPUT                       K1708280
                    *                                                   K1708290
                    *             INSERT .NON-LITTERAL. TO SGT-TABLE    K1708300
                          LD    1 1        LOAD WORD                    K1708310
                          BSI   3 SGTAD-Z  COMPUTE SGT TABLE ADDR       K1708320
                          LD    3 H8000-Z  LOAD NON-LITERAL SGT WORD    K1708330
                          STO  I  SGTI     PUT IN TABLE                 K1708340
                    *                                                   K1708350
                          MDX   1 3        MOVE I/P PT                  K1708360
                    *                                                   K1708370
                    *             OUTPUT REMAINING ARGUMENTS            K1708380
                    SBS1  LD    1 0        LOAD WORD                    K1708390
                          BSI   3 OUTP-Z   OUTPUT                       K1708400
                          LD    1 1        LOAD WORD                    K1708410
                          BSI   3 OUTP-Z   OUTPUT                       K1708420
                          MDX   1 2        MOVE O/P PT                  K1708430
                          MDX  L  DIMCT,-2 DECREMENT DIMENSION COUNT    K1708440
                          MDX     SBS1     OUTPUT REMAINING ARGUMENTS   K1708450
                    *                                                   K1708460
                    *             TAG LAST ARGUMENT IN LIST             K1708470
                          LD    2 0        LOAD LAST AGUMENT            K1708480
                          OR    3 H8000-Z  TAG ARGUMENT                 K1708490
                          STO   2 0        PUT BACK IN O/P STRING       K1708500
                    *                                                   K1708510
                          BSC  I  SBSN     RETURN                       K1708520
                    *                                                   K1708530
                    *             MAKES THE LITERAL SUBSCRIPT ENTRY     K1708540
                    *             INTO THE SGT TABLE                    K1708550
                    *                                                   K1708560
                    SBSLT DC      0        ENTRY POINT                  K1708570
                          LD    1 1        LOAD NAME                    K1708580
                          BSI   3 SGTAD-Z  COMPUTE ADDR IN SGT-TABLE    K1708590
                          LD    1 2        LOAD D4                      K1708600
                          SLA     1        DELETE BIT 0                 K1708610
                          SRT     1                                     K1708620
                          STO  I  SGTI     PUT IN SGT-TABLE             K1708630
                          MDX   1 3        MOVE POINTER                 K1708640
                          BSC  I  SBSLT    RETURN                       K1708650
                    *                                                   K1708660
                    *             SCANS THE TWO-WORD CALL ARGUMENT LIST K1708670
                    *             FOR SUBSCRIPTED NAMES                 K1708680
                    *             GENERATES THE INSTRUCTIONS FOR        K1708690
                    *             OBJECT-TIME ADDRESS INSERTION FOR     K1708700
                    *             SUBSCRIPTED VARIABLES                 K1708710
                    *                                                   K1708720
                    Q4011 STX   1 Q4021+1  SAVE I/P PT                  K1708730
                    Q4012 LD    1 1        LOAD WORD                    K1708740
                          BSC  L  Q4021,-  BRANCH IF OPERATOR           K1708750
                          STO   3 TEMP1-Z  SAVE ARGUMENT                K1708760
                          AND   3 H7800-Z  GET PSEUDO INDEX BITS        K1708770
                          BSC  L  Q4014,+- BRANCH IF NO PSEUDO INDEX    K1708780
                          BSI   3 SGTAD-Z  COMPUTE SGT TABLE ADDRESS    K1708790
                          BSI   3 SCHP1-Z  LOAD LITERAL SUBSC OFFSETS   K1708800
                          LD    3 H6100-Z  LOAD .MDX L1.                K1708810
                          BSI   3 OUTP-Z   OUTPUT                       K1708820
                          LD    1 1        LOAD WORD                    K1708830
                          BSI   3 OUTP-Z   OUTPUT                       K1708840
                          LD    3 H6000-Z  LOAD .NOP. (MDX O)           K1708850
                          BSI   3 OUTP-Z   OUTPUT                       K1708860
                          LD    3 H6200-Z  LOAD .STX L1.                K1708870
                          BSI   3 OUTP-Z   OUTPUT                       K1708880
                    *                                                   K1708890
                    *             RESTORE WORD AT PT+1                  K1708900
                    *             WITH ITS PSEUDO INDEX                 K1708910
                    *                                                   K1708920
                          LD    3 TEMP1-Z  LOAD NAME                    K1708930
                          STO   1 1        PUT BACK ON STRING           K1708940
                    *                                                   K1708950
                          BSI   3 OUTP-Z   OUTPUT WORD                  K1708960
                    *             SERVES LATER AS IDENTIFICATION        K1708970
                    *             AT STX L1-SCAN                        K1708980
                    *             ZERO .CURRENT SGT. *                  K1708990
                    *             (SGT DESTROYED AT OBJECT TIME         K1709000
                    *             BY MDX L1-INSTR)                      K1709010
                    *                                                   K1709020
                          SLA     16       CLEAR ACCUMULATOR            K1709030
                          STO   3 CURR-Z   CLEAR CURR                   K1709040
                          LD    3 H8000-Z  SET CURRENT D4               K1709050
                          STO   3 CURD4-Z  TO NON-LITERAL               K1709060
                          STO  I  SGTI     SET LAST SGT TO NON-LITERAL  K1709070
                          MDX  L  STXSW,1  SET STX-SWITCH               K1709080
                    *                                                   K1709090
                    Q4014 MDX   1 1        MOVE POINTER                 K1709100
                          MDX     Q4012    PROCESS SUBSCRIPTED ARGUMENT K1709110
                    *                                                   K1709120
                    *             OUTPUTS THE 2-WORD SUBP CALL WITH     K1709130
                    *             ARGUMENTS                             K1709140
                    *                                                   K1709150
                    Q4021 LDX  L1 *-*      RESTORE POINTER              K1709160
                    Q4022 BSI   3 MOVAW-Z  OUTPUT WORD, MOVE POINTERS   K1709170
                          LD    1 0        LOAD WORD                    K1709180
                          BSC  L  XXXXX,-  BRANCH IF END OF ARGUMENTS   K1709190
                    *                      - OPERATOR ENCOUNTERED       K1709200
                          MDX     Q4022    PROCESS NEXT ARGUMENT        K1709210
                    *                                                   K1709220
                    *             COMPUTES DISPLACEMENT VALUES FOR      K1709230
                    *             'STX  L1' INSTRUCTIONS USED FOR       K1709240
                    *             STORING THE COMPUTED SUBSCRIPT OFFSET K1709250
                    *             INSERTS THOSE VALUES INTO THE SECOND  K1709260
                    *             WORD OF THE INSTRUCTION               K1709270
                    Q5011 STX   1 Q5015+1  SAVE POINTER                 K1709280
                          LDX  I1 TEMPP    LOAD TEMPORARY POINTER       K1709290
                    Q5013 LD    1 0        LOAD WORD                    K1709300
                          BSC  L  Q5021,Z  BRANCH IF NOT SEMI-COLON     K1709310
                    Q5015 LDX  L1 *-*      RESTORE POINTER              K1709320
                          BSC  L  Q1021    PROCESS NEXT STMNT           K1709330
                    *                                                   K1709340
                    Q5021 BSC  L  Q5031,-  BRANCH IF NOT NAME           K1709350
                    *                                                   K1709360
                    Q5022 MDX   1 1        MOVE POINTER                 K1709370
                          MDX     Q5013    CHECK FOR END OF STMNT       K1709380
                    *                                                   K1709390
                    Q5031 S     3 H1900-Z  IS WORD .CALL SUBSCR.        K1709400
                          BSC  L  Q5035,Z  BRANCH IF NOT                K1709410
                          BSI   3 PASSA-Z  MOVE POINTER PAST ARGUMENTS  K1709420
                          MDX     Q5013    CHECK FOR END OF STMNT       K1709430
                    Q5035 LD    1 0        LOAD WORD                    K1709440
                          S     3 H6200-Z  IS IT  .STX L1.              K1709450
                          BSC  L  Q5041,+- BRANCH IF YES                K1709460
                          S     3 DIFF1-Z  IS IT .LDX L1.               K1709470
                          BSC  L  Q5022,Z  BRANCH IF NOT                K1709480
                          MDX   1 1        MOVE POINTER                 K1709490
                          MDX     Q5022    MOVE PT, CHECK NEXT WORD     K1709500
                    *                                                   K1709510
                    *             COMPUTE Z IN INSTRUCTION              K1709520
                    *             STX L1 Z                              K1709530
                    *             AND INSERT ON STRING                  K1709540
                    *                                                   K1709550
                    Q5041 SLA     16       CLEAR EXTERNAL COUNTER       K1709560
                          STO   3 COUNT-Z                               K1709570
                          MDX   1 1        MOVE POINTER                 K1709580
                          STX  L1 TEMPX    SAVE POINTER                 K1709590
                    *                                                   K1709600
                    *             SEARCH FOR IDENTIFIER  IN             K1709610
                    *             CALL-ARGUMENT LIST                    K1709620
                    *                                                   K1709630
                    Q5042 MDX   1 1        MOVE POINTER                 K1709640
                    Q5043 LD    1 0                                     K1709650
                          S     3 H1900-Z  IS WORD .CALL SUBSC.         K1709660
                          BSC  L  Q5045,Z  BRANCH IF NOT                K1709670
                          BSI   3 PASSA-Z  MOVE PT PAST ARGUMENTS       K1709680
                          MDX     Q5043    CHECK NEXT WORD              K1709690
                    *                                                   K1709700
                    Q5045 LD    1 0                                     K1709710
                          S     3 H5B00-Z  IS WORD .LDX L1.             K1709720
                          BSC  L  Q5046,Z  BRANCH IF NOT                K1709730
                          MDX   1 1        MOVE POINTER                 K1709740
                          MDX     Q5042    SEARCH FOR IDENTIFIER        K1709750
                    *                                                   K1709760
                    Q5046 LD    1 0        LOAD WORD                    K1709770
                          BSC  L  PTCH1,+Z   BRANCH IF NOT OPERATOR 2-3 K1709780
                          S     3 H002E-Z    IS IT CALL OPERATOR    2-3 K1709790
                          BSC  L  Q5042,Z    BRANCH IF NO           2-3 K1709800
                          MDX     Q5045+4    BRANCH IF YES          2-3 K1709810
                    *                                                   K1709815
                    PTH1A MDX  L  COUNT,1  INCREMENT EXTERNAL COUNTER   K1709820
                          MDX     Q5042    GO MOVE POINTER              K1709830
                    CONTU LD    1 0        RELOAD STRING ARGUMENT       K1709840
                          S    I  TEMPX    IS IT ADDR IN STX L1 INSTR   K1709850
                          BSC  L  Q5042,Z  BRANCH IF NOT                K1709860
                    *                                                   K1709870
                    *             REMOVE PSEUDOINDEXBITS FROM           K1709880
                    *             CALL-ARGUMENT WORD                    K1709890
                    *                                                   K1709900
                          LD    1 0        LOAD WORD                    K1709910
                          AND   3 H87FF-Z  REMOVE PSEUDO INDEX BITS     K1709920
                          STO   1 0        PUT BACK ON STRING           K1709930
                    *                                                   K1709940
                    *             COMPUTE AND INSERT SECOND HALF        K1709950
                    *             OF STX L1-INSTRUCTION                 K1709960
                    *                                                   K1709970
                          STX  L1 TEMP1    SAVE POINTER                 K1709980
                          LD    3 TEMP1-Z  LOAD ADDRESS OF PT           K1709990
                          S     3 TEMPX-Z  SUBTRACT STORED PT           K1710000
                          OR    3 H8000-Z  PUT IN SIGN BIT              K1710010
                          A     3 COUNT-Z  ADD EXTERNAL COUNT           K1710020
                          STO  I  TEMPX    PUT IN STX  L1 INSTRUCTION   K1710030
                          LDX  I1 TEMPX    RESTORE POINTER              K1710040
                          MDX     Q5022    MOVE PT, CHECK NEXT WORD     K1710050
                    *                                                   K1710060
                    *                                                   K1710070
                    *             SGT-TABLE                             K1710080
                    *                                                   K1710090
                    SGTB  DC      /8000    NON-LITERAL CONSTANT         K1710100
                          DC      /8000    NON-LITERAL CONSTANT         K1710110
                          DC      /8000    NON-LITERAL CONSTANT         K1710120
                          DC      /8000    NON-LITERAL CONSTANT         K1710130
                          DC      /8000    NON-LITERAL CONSTANT         K1710140
                          DC      /8000    NON-LITERAL CONSTANT         K1710150
                          DC      /8000    NON-LITERAL CONSTANT         K1710160
                          DC      /8000    NON-LITERAL CONSTANT         K1710170
                          DC      /8000    NON-LITERAL CONSTANT         K1710180
                          DC      /8000    NON-LITERAL CONSTANT         K1710190
                          DC      /8000    NON-LITERAL CONSTANT         K1710200
                          DC      /8000    NON-LITERAL CONSTANT         K1710210
                          DC      /8000    NON-LITERAL CONSTANT         K1710220
                          DC      /8000    NON-LITERAL CONSTANT         K1710230
                          DC      /8000    NON-LITERAL CONSTANT         K1710240
                    *                                                   K1710250
                    *                                                   K1710260
                    *             GETS THE ID WORD OF A SIM TBL ENTRY   K1710270
                    *                                                   K1710280
                    SYMT  DC      0        ENTRY POINT                  K1710290
                    GETID EQU     SYMT                                  K1710300
                          AND   3 H07FF-Z  GET SYM TBL ENTRY NO.        K1710310
                          S     3 ONE-Z                                 K1710320
                          STO     SYMT1+1  SAVE ENTRY NO.               K1710330
                          LD   L  SOFST    LOAD START OF SYM TBL ADDR   K1710340
                    *                                                   K1710350
                          S       SYMT1+1  GET ADDRESS OF ENTRY         K1710360
                          S       SYMT1+1  BY MULTIPLYING ENTRY NO. BY  K1710370
                          S       SYMT1+1  THREE AND SUBTRACTING IT     K1710380
                          STO     SYMT1+1  FROM TABLE ORIGIN            K1710390
                    *                                                   K1710400
                    SYMT1 LD   L  *-*      LOAD SYM TBL ID WORD         K1710410
                          BSC  I  SYMT     RETURN                       K1710420
                    *                                                   K1710430
                    *             SUBROUTINE                            K1710440
                    *             MOVES THE POINTER PAST THE            K1710450
                    *             ARGUMENTS OF 'LIBF SUBSC'             K1710460
                    *                                                   K1710470
                    PASSA DC      0        ENTRY POINT                  K1710480
                          MDX   1 3        MOVE POINTER                 K1710490
                    PASS1 MDX   1 2        MOVE POINTER                 K1710500
                          LD    1 -1       RETURN IF LAST               K1710510
                          BSC  I  PASSA,Z+ ARGUMENT TAGGED              K1710520
                          MDX     PASS1    BRANCH IF NOT                K1710530
                    *                                                   K1710540
                    *                                                   K1710550
                    *             SUBROUTINE                            K1710560
                    *             MOVE WORD AT I/P PT TO O/P STRING     K1710570
                    *             INCREMENT POINTERS                    K1710580
                    MOVAW DC      0        ENTRY POINT                  K1710590
                          LD    1 0        LOAD WORD                    K1710600
                          BSI   3 OUTP-Z   OUTPUT WORD, MOVE O/P PT     K1710610
                          MDX   1 1        MOVE I/P PT                  K1710620
                          BSC  I  MOVAW    RETURN                       K1710630
                    *                                                   K1710640
                    *             SUBROUTINE                            K1710650
                    *             OUTPUT                                K1710660
                    *             MOVES CONTENTS OF ACC TO              K1710670
                    *             OUTPUT STRING, INCR NORM AND          K1710680
                    *             CHECKS IF OVERLAP ERROR               K1710690
                    *                                                   K1710700
                    OUTP  DC      0        ENTRY POINT                  K1710710
                          STO   2 1        OUTPUT WORD                  K1710720
                          MDX   2 1        MOVE O/P PT                  K1710730
                          LD   I  OUTID    LOAD STMNT I/D WORD          K1710740
                          A     3 FOUR-Z   INCREMENT NORM BY ONE        K1710750
                          STO  I  OUTID    PUT ID WORD ON O/P STRING    K1710760
                          STX   1 OUTP3                                 K1710770
                          STX   2 OUTP4    CHECK FOR                    K1710780
                          LD      OUTP3    OVERLAP                      K1710790
                          S       OUTP4    ERROR                        K1710800
                          S     3 TWO-Z                                 K1710810
                          BSC  I  OUTP,Z-  RETURN IF NO OVERLAP ERROR   K1710820
                          BSC  L  OVLAP    OVERLAP ERROR                K1710830
                    OUTP3 DC      0        TEMPORARY STORAGE OF PT      K1710840
                    OUTP4 DC      0        TEMPORARY STORAGE OF PT      K1710850
                    *                                                   K1710860
                    *                                                   K1710870
                    *             SUBROUTINE                            K1710880
                    *             CONVERTS PSEUDO INDEX IN ACC          K1710890
                    *             INTO SGT-TABLE ADDRESS,               K1710900
                    *             STORE AT .SGTI.                       K1710910
                    *                                                   K1710920
                    SGTAD DC      0        ENTRY POINT                  K1710930
                          AND   3 H7800-Z  GET PSEUDO INDEX             K1710940
                          SRA     11       RIGHT JUSTIFY INDEX          K1710950
                          A     3 ADRC-Z   GET ACTUAL                   K1710960
                          STO     SGTI     SGT-TABLE ADDRESS            K1710970
                          BSC  I  SGTAD    RETURN                       K1710980
                    SGTI  DC      0        COMPUTED SGT-TABLE ADDRESS   K1710990
                    *                                                   K1711000
                    *                                                   K1711010
                    *             GENERATES THE 'LDX' INSTRUCTION       K1711020
                    *             USING THE SGT TABLE                   K1711030
                    *                                                   K1711040
                    *                                                   K1711050
                    *             ENTRY FOR ARGUM = POINTER + 0         K1711060
                    *                                                   K1711070
                    SCHP2 DC      0        ENTRY PT                     K1711080
                          LD      SCHP2    MOVE RETURN ADDRESS          K1711090
                          STO     SCHP1    TO SCHP1                     K1711100
                          LD    3 ZERO-Z   LOAD ZERO                    K1711110
                          MDX     SCH11    CONTINUE                     K1711120
                    *                                                   K1711130
                    *             ENTRY FOR ARGUM = POINTER + 1         K1711140
                    *                                                   K1711150
                    SCHP1 DC      0        ENTRY POINT                  K1711160
                          LD    3 ONE-Z    LOAD ONE                     K1711170
                    SCH11 STX   1 ADDR     SAVE INPUT POINTER           K1711180
                          A       ADDR     MODIFY INPUT POINTER         K1711190
                          STO     ADDR     SAVE ADDR                    K1711200
                          LD   I  ADDR     LOAD WORD AT I/P PT + 1      K1711210
                          AND   3 H7800-Z  GET PSEUDO INDEX             K1711220
                          BSC  I  SCHP1,+- RETURN IF NO PSEUDO INDEX    K1711230
                          SRA     11       RIGHT JUSTIFY                K1711240
                          S     3 CURR-Z   IS IT CURRENT SGT            K1711250
                          BSC  L  SCH15,+- BRANCH IF YES                K1711260
                          A     3 CURR-Z   RESTORE WORD                 K1711270
                          STO   3 CURR-Z   PUT IN CURRENT SGT           K1711280
                          LD   I  ADDR     LOAD WORD                    K1711290
                          BSI   3 SGTAD-Z  COMPUTE SGT-TABLE ADDRESS    K1711300
                          LD   I  SGTI     LOAD ADDRESS                 K1711310
                          S     3 H8000-Z  IS IT NON-LITERAL SGT        K1711320
                          BSC  L  SCH21,+- BRANCH IF YES                K1711330
                    *                                                   K1711340
                    *             LITERAL SUBSCRIPT ENCOUNTERED         K1711350
                    *             TEST IF IT MATCHES WITH               K1711360
                    *             CURRENT LITERAL D4                    K1711370
                    *                                                   K1711380
                    *             OUTPUT .LDX L1. AND D4                K1711390
                          LD    3 H5B00-Z  LOAD .LDX L1.                K1711400
                          BSI   3 OUTP-Z   OUTPUT                       K1711410
                          LD   I  SGTI     LOAD SGT TABLE WORD          K1711420
                          STO   3 CURD4-Z  STORE AS CURRENT D4          K1711430
                          BSI   3 OUTP-Z   OUTPUT WORD                  K1711440
                    *                      *****  LDX L1  SGT TBL WD    K1711450
                    *             DELETE PSEUDOINDEX-BITS               K1711460
                    *             FROM STRING WORD, RETURN              K1711470
                    *                                                   K1711480
                    SCH15 LD   I  ADDR     LOAD WORD                    K1711490
                          AND   3 H87FF-Z  DELETE PSEUDO INDEX BITS     K1711500
                          STO  I  ADDR     RESTORE WORD                 K1711510
                          BSC  I  SCHP1    RETURN                       K1711520
                    *                                                   K1711530
                    *             OUTPUT .LDX I1. AND SGT               K1711540
                    SCH21 LD    3 H4800-Z  LOAD .LDX  I1.               K1711550
                          BSI   3 OUTP-Z   OUTPUT .LDX I1.              K1711560
                          LD   L  SOFST    LOAD START OF SYM TBL ADDR   K1711570
                          S    L  SOFXT    SUBTRACT START OF SUBSCRIPT  K1711580
                          SRT     16       TEMPORARIES                  K1711590
                          D     3 THREE-Z  DIVIDE BY THREE              K1711600
                          A     3 CURR-Z   ADD CURRENT SGT              K1711610
                          OR    3 H8000-Z  PUT SIGN BIT FOR ADDRESS     K1711620
                          BSI   3 OUTP-Z   *****  LDX I1  ADDRESS       K1711630
                          LD    3 H8000-Z  INSERT NON LITERAL           K1711640
                          STO   3 CURD4-Z  CURRENT D4                   K1711650
                          MDX     SCH15    DELETE PSEUDO INDEX WORDS    K1711660
                    ADDR  DC      0        ADDRESS STORAGE              K1711670
                    *                                                   K1711680
                    USWIT DC      0        UNFORMATTED I/O SWITCH       K1711690
                    ZERO  DC      0        ZERO                         K1711700
                    Z     EQU     ZERO                                  K1711710
                    ONE   DC      1        ONE                          K1711720
                    TWO   DC      2        TWO                          K1711730
                    THREE DC      3        THREE                        K1711740
                    FOUR  DC      4        FOUR                         K1711750
                    *                                                   K1711760
                    LDXI1 DC      /C000    .LDX  L1.                    K1711770
                    BSCI1 DC      /5C00    .BSC  I1.                    K1711780
                    ASTM1 DC      /5A00    .*-1.                        K1711790
                    FGOTO DC      /0F80    CALL GO TO TRACE             K1711800
                    LOP   DC      /0028    LIST-OPERATOR                K1711810
                    H1800 DC      /1800    DIMENSION MASK - SYM TBL ID  K1711820
                    *                                                   K1711830
                    FIOIX DC      /1700    .CALL SIOIX.                 K1711840
                    FIOFX DC      /1680    .CALL SIOFX.                 K1711850
                    FIOI  DC      /1880    .CALL SIOI.                  K1711860
                    FIOF  DC      /1800    .CALL SIOF.                  K1711870
                    FIOAI DC      /1580    .CALL SIOAI.                 K1711880
                    FIOAF DC      /1600    .CALL SIOAF.                 K1711890
                    GENLO DC      /5E01    STORED GENERAL LABEL OPTR    K1711900
                    DOAOP DC      /002A    DOA-OPERATOR                 K1711910
                    DOTOP DC      /004A    DO TEST OPERATOR             K1711920
                    AL    DC      /9800    .A    L.                     K1711930
                    STOL  DC      /9000    .STO  L.                     K1711940
                    SL    DC      /A000    .S    L.                     K1711950
                    MDXL1 DC      /5101    .MDX  L1.                    K1711960
                    LDL   DC      /8800    .LD   L.                     K1711970
                    H0018 DC      /0018    LITERAL OPERATOR             K1711980
                    HA008 DC      /A008    ERROR STMNT ID WORD          K1711990
                    C69   DC      69       ERROR NO. 69                 K1712000
                    H5F00 DC      /5F00    .BLANK.                      K1712010
                    *                                                   K1712020
                    *             SUBROUTINE                            K1712030
                    *             OUTPUT CONTENTS OF ACC AND WORD AT    K1712040
                    *             POINTER + 1 WITH DISK I/O TEST        K1712050
                    *                                                   K1712060
                    OUTIO DC      0        ENTRY POINT                  K1712070
                          BSI   3 DTEST-Z  OUTPUT CALL                  K1712080
                          LD    1 1        LOAD WORD                    K1712090
                          AND   3 H87FF-Z  DELETE PSEUDO INDEX BITS     K1712100
                          BSI   3 OUTP-Z   OUTPUT WORD                  K1712110
                          BSC  I  OUTIO    RETURN                       K1712120
                    *                                                   K1712130
                    *             SUBR  OUTPUT .LD L. PTR+1             K1712140
                    OULDL DC      0        ENTRY POINT                  K1712150
                          LD    1 1        LOAD WORD                    K1712160
                          AND   3 H07FF-Z  GET SYM TBL ENTRY NO.        K1712170
                          A     3 LDL-Z    COMBINE WITH .LD L.          K1712180
                          BSI   3 OUTP-Z   OUTPUT INSTRUCTION           K1712190
                          BSC  I  OULDL    RETURN                       K1712200
                    FLD   DC      /0480    .CALL FLD.                   K1712210
                    FRED  DC      /1400    .CALL FRED.                  K1712220
                    FWRT  DC      /1480    .CALL FWRT.                  K1712230
                    FCOMP DC      /1500    .CALL FCOMP.                 K1712240
                    FIND  DC      /2680-/2180+/1400  .CALL FIND.        K1712250
                    *                      'CALL FIND',                 K1712260
                    *                      CHANGED LATER TO /2680       K1712270
                    *                      BY 'DTEST'                   K1712280
                    *                                                   K1712290
                    WRITE DC      /8800    WRITE ID                     K1712300
                    *                                                   K1712310
                    RETCT DC      0        RETURN-COUNT                 K1712320
                    BSCI  DC      /5080    .BSC I.                      K1712330
                    H5080 EQU     BSCI                                  K1712340
                    H4020 DC      /4020    DEFINED INTEGER VAR ID       K1712350
                    H0220 DC      /0220    REFERENCED STMNT NO. ID      K1712360
                    *                                                   K1712370
                    H002E DC      /002E    CALL OPERATOR                K1712380
                    H0016 DC      /0016    .CALL.                       K1712390
                    H0008 DC      /0008    CONSTANT FOR DIM COUNT       K1712400
                    H000E DC      /000E    ASSIGN-OPERATOR              K1712410
                    H0200 DC      /0200    STMNT NO. IN SYM TBL ID WD   K1712420
                    H1900 DC      /1900    .CALL SUBSCR.                K1712430
                    H7800 DC      /7800    MASK TO GET PSEUDO INDEX     K1712440
                    H87FF DC      /87FF    MASK TO ELIMINATE PSEUDO IDX K1712450
                    H07FC DC      /07FC    MASK TO GET STMNT NORM       K1712460
                    H07FF DC      /07FF    MASK TO GET ADDR             K1712470
                    ADRC  DC      SGTB-1   MASK FOR SYM TBL ENTRY NO.   K1712480
                    H0014 DC      /0014    IF OPERATOR                  K1712490
                    DIFF1 DC      /5B00-/6200   .LDX  L1.               K1712500
                    H8000 DC      /8000    NON-LITERAL SGT              K1712510
                    H8003 DC      /8003    USEFUL CONSTANT              K1712520
                    H6100 DC      /6100    .MDX  L1.                    K1712530
                    H6000 DC      /6000    .NOP.    (MDX 0)             K1712540
                    H6200 DC      /6200    .STX  L1.                    K1712550
                    H5B00 DC      /5B00    .LDX  L1.                    K1712560
                    H4800 DC      /4800    .LDX  I1.                    K1712570
                    HF800 DC      /F800    ID TYPE MASK                 K1712580
                    HF803 DC      /F803    MASK TO ELIMINATE STMNT NORM K1712590
                    H1000 DC      /1000    END STMNT ID TYPE            K1712600
                    TEND  EQU     H1000                                 K1712610
                    *                                                   K1712620
                    STTYP DC      0        STATEMENT TYPE               K1712630
                    OUTID DC      0        ADDRESS OF O/P STMNT ID WORD K1712640
                    INID  DC      0        ADDRESS OF I/P STMNT ID WORD K1712650
                    NORM  DC      0        STMNT NORM                   K1712660
                    STXSW DC      0        STX-SWITCH                   K1712670
                    TEMPX DC      0        POINTER STORAGE              K1712680
                    TEMPP DC      0        POINTER STORAGE              K1712690
                    TEMP1 DC      0        POINTER STORAGE              K1712700
                    DIMCT DC      0        DIMENSION COUNT              K1712710
                    CURR  DC      0        CURRENT SGT                  K1712720
                    SOFIS DC      0        START OF INPUT STRING        K1712730
                    SSOST DC      0        STORED START OF I/P STRING   K1712740
                    *                                                   K1712750
                    CURD4 DC      0        CURRENT D4                   K1712760
                    *                      (=/8000 IF NOT LITERAL)      K1712770
                    *                                                   K1712780
                    *                                                   K1712790
                    *             NOT USED IN CARD SYSTEM               K1712800
                    *                                                   K1712810
                    IOOPR DC      /0026    IO-OPERATOR                  K1712820
                    DIOOP DC      /0030    DISK IO OPERATOR             K1712830
                    EXPRO DC      /0054    EXPRESSION OPERATOR          K1712840
                    DSWIT DC      0        DISK SWITCH                  K1712850
                    TEMPY DC      0        TEMPORARY STORAGE            K1712860
                    COUNT DC      0        EXTERNAL COUNTER             K1712870
                    *                                                   K1712880
                    *             SUBROUTINE                            K1712890
                    *             OUTPUT, WITH TEST OF DISKSWITCH       K1712900
                    *                                                   K1712910
                    DTEST DC      0        ENTRY POINT                  K1712920
                          STO     DTES1    SAVE CALL                    K1712930
                          LD    3 DSWIT-Z  IS IT DISK OPERATION         K1712940
                          BSC  L  ADI,+-   BRANCH IF NOT                K1712950
                          LD      CDIFF    SET DISK NAME                K1712960
                          MDX     ADDN     TABLE OFFSET                 K1712970
                    ADI   LD    3 USWIT-Z  IS IT UNFORMATTED I/O        K1712980
                          BSC  L  ADDN,+-  BRANCH IF NOT                K1712990
                          LD      DTES1    CHECK THE NO. OF THE ENTRY   K1713000
                          S       H1500    TO SEE WHICH PART OF THE     K1713010
                          BSC  L  ADQ,Z-   TABLE IN O/P PHASE HOLDS THE K1713020
                          LD      UDIF1    CORRESPONDING UNFORMATTED    K1713030
                          MDX     ADDN     I/O NAME AND PUT THE PROPER  K1713040
                    ADQ   LD      UDIF2    DISPLACEMENT                 K1713050
                    ADDN  A       DTES1    ADD BASE ADDRESS             K1713060
                    *                      VALUE OF DTEST1 IS UNCHANGED K1713070
                    *                      UNLESS DISK OR UNFORMATTED   K1713080
                    *                      I/O IS PRESENT               K1713090
                          BSI   3 OUTP-Z   OUTPUT WORD, MOVE O/P PT     K1713100
                          BSC  I  DTEST    RETURN                       K1713110
                    *                                                   K1713120
                    H1500 DC      /1500    CONSTANT FOR CHECKING TBL    K1713130
                    DTES1 DC      0        TEMPORARY STORAGE            K1713140
                    CDIFF DC      /2180-/1400  DISK NAME TABLE          K1713150
                    UDIF1 DC      /1200-/1400  UNFORMATTED  - PART 1    K1713160
                    UDIF2 DC      /1D80-/1580  I/O NAME TBL - PART 2    K1713170
                    *                                                   K1713180
                    *                                                   K1713190
                    *             TRANSFERS TO THE COL ROUTINE TO LOAD  K1713200
                    *             THE NEXT PHASE                        K1713210
                    *                                                   K1713220
                    EXIT  LDX  I1 NXTPH+1  LOAD PARAM FOR READING       K1713230
                          LDD     NXTPH+2  NEXT PHASE                   K1713240
                          BSC  L  ROL      READ NEXT PHASE              K1713250
                          BSS  E  0                                     K1713260
                    NXTPH DC      48       ID OF NEXT PHASE             K1713270
                          BSS     3        LOADER TABLE NEXT PHASE      K1713280
                    *                                                   K1713290
                    *                                                   K1713300
                    ENT   LD   L  ERROR    IS THERE OVERLAP ERROR       K1713310
                          BSC  L  START,+- BRANCH IF NO                 K1713320
                          MDX     EXIT     BR TO EXIT IF OVERLAP ERROR  K1713330
                    *                                                   K1713340
                          DC      *-*      TO BE FILLED                 K1713350
                    XXXXX SLA     16                                    K1713360
                          STO   3 CURR-Z   CLEAR CURRENT SGT            K1713370
                          BSC  L  Q2011    GET NEXT OPERATOR            K1713380
                    *                                                   K1713390
                    *             PATCH FOR MOD 3                       K1713400
                    *                                                   K1713410
                    PTCH1 BSI   3 GETID-Z    GET ID WORD FROM SYM T 2-3 K1713420
                          BSC  L  CONTU,+Z   BRANCH IF CONSTANT     2-3 K1713430
                          SLA     11                                2-3 K1713440
                          BSC  L  CONTU,-    BRANCH IF NOT EXTERNAL 2-3 K1713450
                          BSC  L  PTH1A      BRANCH BACK            2-3 K1713460
                    *                                                   K1713470
                          BSS     293        PATCH AREA             2-5 K1713480
                          DC      0                                     K1713490
                          END     BPHAR-2                               K1713500
