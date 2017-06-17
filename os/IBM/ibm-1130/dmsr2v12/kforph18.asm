                          HDNG    1130 FORTRAN COMPILER PHASE 18        K1800010
                    *************************************************** K1800020
                    *STATUS - VERSION 2, MODIFICATION 11              * K1800030
                    *                                                 * K1800040
                    *FUNCTION/OPERATION-                              * K1800050
                    *   * REPLACES ARITHMETIC, STMNT FUNCTION, CALL,  * K1800060
                    *     AND IF STATEMENTS NOT INVOLVING SUBSCRIPTED * K1800070
                    *     VARIABLES BY COMPILER-GENERATED CODING      * K1800080
                    *   * COMPLETES THE REPLACEMENT OF ARITHMETIC,    * K1800090
                    *     STMNT FUNCTION, CALL, AND IF STMNTS THAT DO * K1800100
                    *     INVOLVE SUBSCRIPTED VARIABLES BY COMPILER-  * K1800110
                    *     GENERATED CODING.                           * K1800120
                    *   * OPTIMIZES IF STMNT BRANCH INSTRUCTIONS.     * K1800130
                    *   * HANDLES MIXED MODE ARITHMETIC               * K1800140
                    *                                                 * K1800150
                    *ENTRY POINTS-                                    * K1800160
                    *   ENQ-PHASE 18 IS READ INTO CORE BY PHASE 17    * K1800170
                    *       AND EXECUTION BEGUN AT LOCATION ENQ.      * K1800180
                    *                                                 * K1800190
                    *INPUT-                                           * K1800200
                    *   NONE IN THE USUAL SENSE. HOWEVER, THE STMNT   * K1800210
                    *   STRING SCANNED BY THE COMPILER MAY BE         * K1800220
                    *   CONSIDERED INPUT.                             * K1800230
                    *                                                 * K1800240
                    *OUTPUT-                                          * K1800250
                    *   NONE IN THE USUAL SENSE. HOWEVER, THE STMNT   * K1800260
                    *   STRING AND THE SYMBOL TABLE ALTERED BY THE    * K1800270
                    *   COMPILER MAY BE CONSIDERED OUTPUT.            * K1800280
                    *                                                 * K1800290
                    *EXTERNAL REFERENCES-N/A                          * K1800300
                    *                                                 * K1800310
                    *EXITS-                                           * K1800320
                    *   NORMAL-                                       * K1800330
                    *      PHASE EXITS NORMALLY IF OVERLAP ERROR IS   * K1800340
                    *      NOT FOUND. PHASE 19 IS LOADED AND EXECUTED * K1800350
                    *   ERROR-                                        * K1800360
                    *      IF AN OVERLAP ERROR OCCURS, COMPILATION IS * K1800370
                    *      ABORTED AND CONTROL IS PASSED FROM PHASE   * K1800380
                    *      TO SUCCEEDING PHASE UNTIL AN OUTPUT PHASE  * K1800390
                    *      IS REACHED WHICH CAN PRINT AN ERROR MESSAGE* K1800400
                    *      NO ERRORS ARE DETECTED IN PHASE 18.        * K1800410
                    *                                                 * K1800420
                    *TABLES/WORK AREAS-                               * K1800430
                    *   NONE EXCEPT STATEMENT STRING AREA, SYMBOL     * K1800440
                    *   TABLE, AND FORTRAN COMMUNICATION AREA         * K1800450
                    *                                                 * K1800460
                    *ATTRIBUTES-N/A                                   * K1800470
                    *                                                 * K1800480
                    *NOTES-                                           * K1800490
                    *   THE SWITCHES USED IN PHASE 18 FOLLOW. IF      * K1800500
                    *   POSITIVE, THE SWITCH IS TRANSFER=T. IF ZERO,  * K1800510
                    *   THE SWITCH IS NORMAL=N. IF MINUS, THE SWITCH  * K1800520
                    *   IS NEGATIVE=M.                                * K1800530
                    *      * MODSW-MODE OF ARITHMETIC                 * K1800540
                    *              N=SWITCH NOT SET.                  * K1800550
                    *              T=FIXED MODE ARITHMETIC            * K1800560
                    *              M=FLOATING MODE ARITHMETIC         * K1800570
                    *      * STNCH-STATEMENT NUMBER                   * K1800580
                    *              N=STMNT HAS NO STMNT NUMBER        * K1800590
                    *              T=STMNT HAS STMNT NUMBER           * K1800600
                    *      * TEMP -OUTPUT SWITCH                      * K1800610
                    *              T=OUTPUT PROCESSED PARTS OF STMNT  * K1800620
                    *                WHILE SEARCHING FOR NEXT NOT     * K1800630
                    *                PROCESSED OPTR IN SUBROUTINE     * K1800640
                    *                FINDN                            * K1800650
                    *************************************************** K1800660
                          ABS                                           K1800670
                    *                                                   K1800680
                    *                       SYSTEM EQUATES              K1800690
                    MEMRY EQU     /8000                                 K1800700
                    OVERL EQU     MEMRY-1500 START OF FCOM              K1800710
                    ROL   EQU     MEMRY-68   LOCN OF RTN TO READ NXT PH K1800720
                    $PHSE EQU     /78        NO. OF PHASE NOW IN CORE   K1800730
                          ORG     OVERL                                 K1800740
                    PHID  EQU     48         ID NUMBER THIS PHASE       K1800750
                    **************************************************  K1800760
                    *                                                   K1800770
                    *                  FORTRAN COMMUNICATION AREA       K1800780
                    *                                                   K1800790
                    SOFS  BSS     1    START OF STRING                  K1800800
                    EOFS  BSS     1    END OF STRING                    K1800810
                    SOFST BSS     1    START OF SYMBOL TABLE            K1800820
                    SOFNS BSS     1    START OF NON-STATEMENT NUMBERS   K1800830
                    SOFXT BSS     1    START OF SUBSCRIPT TEMPORARIES   K1800840
                    SOFGT BSS     1    START OF GENERATED TEMPORARIES   K1800850
                    EOFST BSS     1    END OF SYMBOL TABLE              K1800860
                    COMON BSS     1    NEXT AVAILABLE COMMON            K1800870
                    CSIZE BSS     1    SIZE OF COMMON                   K1800880
                    ERROR BSS     1    OVERLAP ERROR                    K1800890
                    *                BIT 8 S/T EXCEEDS MAX LIMIT   2-11 K1800892
                    FNAME BSS     1    PROGRAM NAME                     K1800900
                          BSS     1                                     K1800910
                    SORF  BSS     1    SUBROUTINE(-) OR FUNCTION(+)     K1800920
                    CCWD  BSS     1    CONTROL CARD WORD                K1800930
                    *                BIT 15 TRANSFER TRACE              K1800940
                    *                BIT 14 ARITHMETIC TRACE            K1800950
                    *                BIT 13 EXTENDED PRECISION          K1800960
                    *                BIT 12 LIST SYMBOL TABLE           K1800970
                    *                BIT 11 LIST SUBPROGRAM NAMES       K1800980
                    *                BIT 10 LIST SOURCE PROGRAM         K1800990
                    *                BIT  9 ONE WORD INTEGERS           K1801000
                    IOCS  BSS     1    IOCS CONTROL CARD WORD           K1801010
                    *                BIT 15 CARD                        K1801020
                    *                BIT 14 PAPER TAPE                  K1801030
                    *                BIT 13 TYPEWRITER                  K1801040
                    *                BIT 12 1403 PRINTER                K1801050
                    *                BIT 11 2501 READER                 K1801060
                    *                BIT 10 KEYBOARD                    K1801070
                    *                BIT  9 1442 PUNCH                  K1801080
                    *                BIT  8 DISK                        K1801090
                    *                BIT  7 1132 PRINTER                K1801100
                    *                BIT  3 PLOTTER                     K1801110
                    DFCNT BSS     1                                     K1801120
                    *                                                   K1801130
                    *                                                   K1801140
                    *                  END OF FORTRAN COMMUNICATION     K1801150
                    *                  AREA                             K1801160
                    *                                                   K1801170
                    BPHAR EQU     *+2      BEGIN PHASE AREA             K1801180
                          DC      0        LOADER WORK AREA             K1801190
                          DC      -48      -PHASE ID FOR SLET LOOKUP    K1801200
                          DC      NXTPH-*+1  TABLE FOR NEXT PHASE ENTRY K1801210
                          DC      1        ONE ENTRY TO BE SET BY LDR   K1801220
                          ORG     *-2                                   K1801230
                    ENT   LDX   1 PHID     GET ID THIS PHASE            K1801240
                          STX  L1 $PHSE    STORE IN SYSTEM PHASE AREA   K1801250
                          LD      ERROR    IS THERE OVERLAP ERROR       K1801260
                          BSC  L  EXIT,Z   BRANCH IF YES                K1801270
                    START LD      EOFS     LOAD END OF STRING ADDR      K1801280
                          S       SOFS     SUBTRACT START OF STRING     K1801290
                          BSC  L  CONT     CONTINUE PROGRAM INITIALIZE  K1801300
                    *                                                   K1801310
                    *                                                   K1801320
                    *                                                   K1801330
                    P1011 LDX  I1 SOFIS    INITIALIZE STRING I/P PT     K1801340
                          LDX  I2 SOFS     INITIALIZE STRING O/P PT     K1801350
                          MDX   2 -1                                    K1801360
                    *                                                   K1801370
                    *             EXTRACTS THE STMNT ID TYPE            K1801380
                    *             EXTRACTS THE STMNT ID TYPE            K1801390
                    P1021 MDX   1 1        MOVE STRING I/P PT           K1801400
                          MDX   2 1        MOVE STRING O/P PT           K1801410
                    P1022 LD    1 0        LOAD STMNT ID WORD           K1801420
                          AND   3 HF803-Z  ELIMINATE NORM IN ID WORD    K1801430
                          A     3 FOUR-Z   ADD ONE TO NORM              K1801440
                          STO   2 0        PUT ON OUTPUT STRING         K1801450
                          AND   3 HF800-Z  GET ID TYPE                  K1801460
                          STO   3 STTYP-Z  SAVE ID TYPE                 K1801470
                          STX  L2 OUTID    SAVE ADDR OF O/P ID          K1801480
                          STX  L1 INID     SAVE ADDR OF I/P ID          K1801490
                          MDX   1 1        MOVE I/P STRING PT           K1801500
                          LD    1 -1       LOAD STMNT ID WORD           K1801510
                          BSC  L  P1023,E  BRANCH IF HAVE STMNT NO.     K1801520
                          MDX     P1031    TEST STMNT TYPE              K1801530
                    *                                                   K1801540
                    P1023 LD    3 FOUR-Z   INCREMENT NORM               K1801550
                          A    I  OUTID    BY ONE                       K1801560
                          STO  I  OUTID    PUT BACK ON OUTPUT STRING    K1801570
                          MDX   1 1        MOVE I/P PT                  K1801580
                          MDX   2 1        MOVE O/P PT                  K1801590
                          LD    1 -1       LOAD STMNT NO.               K1801600
                          STO   2 0        PUT ON OUTPUT STRING         K1801610
                    *             CHECKS FOR A CALL, IF, ARITHMETIC, OR K1801620
                    *             STMNT FUNCTION STATEMENT              K1801630
                    P1031 LD    3 0                                     K1801640
                          STO   3 MODSW-Z  ZERO MODE SWITCH             K1801650
                    *                                                   K1801660
                    *             TEST IF ARITHMETIC STMNT FUNCTION     K1801670
                          LD    3 STTYP-Z  LOAD STMNT ID TYPE           K1801680
                          S     3 HD000-Z  IS IT ARITHMETIC STMNT FUNC  K1801690
                          BSC  L  P1052,+- BRANCH IF YES                K1801700
                          LD    3 STTYP-Z  LOAD STMNT ID TYPE           K1801710
                          S     3 READ-Z   SUBTRACT READ CONSTANT       K1801720
                          BSC     Z        SKIP IF READ                 K1801730
                          S     3 FIND-Z   TEST FOR FIND STATEMENT      K1801740
                          BSC     Z        SKIP IF FIND OR READ         K1801750
                          S     3 WRITE-Z  TEST FOR WRITE               K1801760
                          BSC  L  HERE,Z   BR IF NOT I/O(RD-WRITE-FIND) K1801770
                          LD    1 0        LOAD 2ND WD I/P STRING       K1801780
                          S     3 H0054-Z  IS IT EXPRESSION OPERATOR    K1801790
                          BSC  L  A7A72,Z  BRANCH IF NOT                K1801800
                          MDX   1 1        MOVE I/P STRING PT           K1801810
                          MDX     P2011    BR TO CONTINUE PROCESSING    K1801820
                    A7A72 LD    1 0        LOAD WORD                    K1801830
                          S     3 LIBFR-Z  IS IT LIBF READ              K1801840
                          BSC     Z        SKIP IF YES                  K1801850
                          S     3 H0080-Z  IS IT LIBF WRITE             K1801860
                          BSC     Z        SKIP IF YES                  K1801870
                          S     3 LIBFF-Z  IS IT LIBF FIND              K1801880
                          BSC  L  HERE,Z   BRANCH IF NOT                K1801890
                          MDX   1 -1       DECREMENT STRING I/P PT      K1801900
                          BSC  L  D5011    CHECK REST OF STMNT          K1801910
                    *                                                   K1801920
                    HERE  LD    3 STTYP-Z  LOAD STMNT ID TYPE           K1801930
                          BSC     +-       SKIP IF NOT ARITH STMNT      K1801940
                          MDX     P2011    BRANCH IF ARITHMETIC STMNT   K1801950
                          S     3 TCALL-Z  IS IT CALL STMNT             K1801960
                          BSC  L  P2011,+- BRANCH IF YES                K1801970
                          S     3 H4800-Z  IS IT IF STMNT               K1801980
                          BSC  L  P2011,+- BRANCH IF YES                K1801990
                    *                                                   K1802000
                    *             MOVES THE STMNT TO THE O/P STRING     K1802010
                    *             UNALTERED. DETERMINES IF THE LAST     K1802020
                    *             STMNT WAS AN END STMNT                K1802030
                    P1041 LDX  I1 INID     RESET I/P PT                 K1802040
                          LDX  I2 OUTID    RESET O/P PT                 K1802050
                          LD    1 0        LOAD STMNT ID WORD           K1802060
                          AND   3 H07FC-Z  GET STMNT NORM               K1802070
                          STO   3 NORM-Z   SAVE NORM                    K1802080
                    P1042 LD    1 0        MOVE WORD TO                 K1802090
                          STO   2 0        OUTPUT STRING                K1802100
                          MDX  L  NORM,-4  DECREMENT NORM BY ONE        K1802110
                          MDX     P1043    CONTINUE LOOP                K1802120
                    *                                                   K1802130
                    *             TEST IF LAST OUTPUT STMNT             K1802140
                    *             WAS END STATEMENT                     K1802150
                          LD    3 STTYP-Z  LOAD STMNT ID TYPE           K1802160
                          S     3 TEND-Z   IS IT END STMNT              K1802170
                          BSC  L  P1021,Z  BRANCH IF NOT                K1802180
                    *                                                   K1802190
                    P1044 STX  L2 EOFS     NEW END OF STRING ADDR       K1802200
                          BSC  L  EXIT     GO TO NEXT PHASE             K1802210
                    *                                                   K1802220
                    *                                                   K1802230
                    P1043 MDX   1 1        INCREMENT I/P PT             K1802240
                          MDX   2 1        INCREMENT O/P PT             K1802250
                          MDX     P1042    CONTINUE LOOP                K1802260
                    *                                                   K1802270
                    *             ARITHMETIC STMNT FUNCTION ENCOUNTERED K1802280
                    *             OUTPUT ARITHMETIC STMNT FUNC NAME     K1802290
                    *             AND DUMMY VARIABLES                   K1802300
                    *                                                   K1802310
                    P1051 LD    1 0        LOAD WORD                    K1802320
                          BSI   3 OUTUN-Z  PUT ON OUTPUT STRING         K1802330
                    P1052 MDX   1 1        MOVE I/P PT                  K1802340
                          LD    1 0        LOAD WORD                    K1802350
                          BSC  L  P1051,+Z BRANCH IF NAME               K1802360
                    *                                                   K1802370
                    *                                                   K1802380
                    *                                                   K1802390
                    *             MOVES THE PT PAST THE PROCESSED PART  K1802400
                    *             OF THE STRING ENTRY. RETAINS THE      K1802410
                    *             PROCESSED PART IN THE STRING          K1802420
                    *             UNALTERED. PICKS UP AT THE NEXT       K1802430
                    *             UNPROCESSED WORD                      K1802440
                    *                                                   K1802450
                    P2011 MDX   1 -2       MOVE PT                      K1802460
                          LD    3 ZERO-Z   SET OUTPUT SWITCH            K1802470
                          BSI  L  FINDN    FIND NEXT UNPROCESSED OPTR   K1802480
                    *                                                   K1802490
                          BSC  L  P1021,+- BRANCH IF SEMI-COLON         K1802500
                    *                                                   K1802510
                    *             NOT IN CARD SYSTEM                    K1802520
                    *                                                   K1802530
                          S    L  EXPRO    IS IT EXPRESSION-OPERATOR    K1802540
                          BSC  L  D5011,+- BRANCH IF YES                K1802550
                          LD    1 0        LOAD WORD                    K1802560
                    *                                                   K1802570
                          S     3 UNARY-Z  IS IT UNARY MINUS            K1802580
                          BSC  L  P6011,+- BRANCH IF YES                K1802590
                          S     3 CALLX-Z  IS IT CALL                   K1802600
                          BSC  L  P5011,+- BRANCH IF YES                K1802610
                          S     3 IF-Z     IS IT IF                     K1802620
                          BSC  L  P3011,+- BRANCH IF YES                K1802630
                    *                                                   K1802640
                    *             FIND NEXT NOT-PROCESSED WORD          K1802650
                    *             STARTING AT PTR+2                     K1802660
                    *                                                   K1802670
                    P2013 STX   1 *+3      FIND NEXT UNPROCESSED WORD   K1802680
                          BSI  L  FINDN    DECREMENT PT                 K1802690
                          LDX  L1 *-*                                   K1802700
                    *                                                   K1802710
                          BSC  L  P2071,+Z BRANCH IF 3RD WORD NOT OPTR  K1802720
                          LD    1 0        LOAD WORD AT PT              K1802730
                          S     3 H000E-Z  IS IT .ASSIGN.               K1802740
                          BSC  L  P2051,Z  BRANCH IF NOT                K1802750
                          LD    1 1        LOAD NEXT WORD               K1802760
                          BSI   3 SYMT-Z   GET SYM TBL ID WORD          K1802770
                          SLA     11       IS IT GENERATED TEMPORARY    K1802780
                          BSC     -        SKIP IF YES                  K1802790
                          MDX     P2031    BRANCH IF NO                 K1802800
                    *                                                   K1802810
                    *             MAKE MODE OF GT AGREE WITH MODESW     K1802820
                          LD    1 1        LOAD SYM TBL ENTRY NO        K1802830
                          BSI  L  GTMOD    GET MODE OF NAME             K1802840
                          MDX     P2033    CLEAR MODE SWITCH            K1802850
                    *                                                   K1802860
                    *             GENERATES THE CODE TO HANDLE MIXED-   K1802870
                    *             MODE ARITHMETIC                       K1802880
                    P2031 LD    3 STNA1-Z  LOAD SYM TBL ID WORD         K1802890
                          BSC     -        SKIP IF FIXED PT             K1802900
                          MDX     P2032    BRANCH IF NOT                K1802910
                          LD    3 MODSW-Z  TEST MODE SWITCH             K1802920
                          BSC     -        SKIP IF NOT FIX              K1802930
                          MDX     P2033    BRANCH IF FIX                K1802940
                          LD    3 IFIX-Z   LOAD .CALL IFIX.             K1802950
                          BSI   3 OUTUN-Z  OUTPUT CALL                  K1802960
                          MDX     P2033    CLEAR MODE SWITCH            K1802970
                    *                                                   K1802980
                    *                                                   K1802990
                    P2032 LD    3 MODSW-Z  TEST MODE SWITCH             K1803000
                          BSC     Z+       SKIP IF FIXED                K1803010
                          MDX     P2033    BRANCH IF NOT FIXED          K1803020
                          LD    3 FLT-Z    LOAD .CALL FLOAT.            K1803030
                          BSI   3 OUTUN-Z  OUTPUT CALL                  K1803040
                    *                                                   K1803050
                    *             AT THAT POINT MODESWITCH MUST NOT     K1803060
                    *             BE ZERO (ZERO WOULD MEAN AN ASSIGN-   K1803070
                    *             OPERATOR PRECEDED BY NOT FILLING ANY  K1803080
                    *             ACCUMULATOR                           K1803090
                    *             MODESWITCH IS SET ZERO SINCE NEXT     K1803100
                    *             ARITHMETIC IS INDEPENDENT OF MODE     K1803110
                    P2033 LD    3 ZERO-Z   CLEAR                        K1803120
                          STO   3 MODSW-Z  MODE SWITCH                  K1803130
                    P2041 LD    1 0        LOAD WORD                    K1803140
                          BSI   3 OUTOP-Z  OUTPUT OPERATOR              K1803150
                          LD    1 1        LOAD WORD                    K1803160
                          BSI   3 OUTNA-Z  OUTPUT NAME                  K1803170
                          MDX   1 2        MOVE PT                      K1803180
                          MDX     P2011    FIND NEXT UNPROCESSED WORD   K1803190
                    *                                                   K1803200
                    *                                                   K1803210
                    *             TEST IF WORD AT POINTER IS            K1803220
                    *             .EXPONETIATE. OPERATOR                K1803230
                    *             OR .REVERSE EXPONENTIATE.             K1803240
                    P2051 LD    1 0        LOAD WORD                    K1803250
                          S     3 EXP-Z    IS IT EXPONENTIATE OPTR      K1803260
                          BSC  L  P2041,+- BRANCH IF YES                K1803270
                          S     3 H003E-Z  IS IT REVERSE EXPONENTIATE   K1803280
                          BSC  L  P2041,+- OPTR - BRANCH IF YES         K1803290
                    *                                                   K1803300
                    *             TESTS TO ASCERTAIN PROPER MODE        K1803310
                          LD    1 1        LOAD WORD                    K1803320
                          BSI   3 SYMT-Z   GET SYM TBL ID WORD          K1803330
                          BSC     Z+       SKIP IF FLOAT                K1803340
                          MDX     P2052    BRANCH IF FIX                K1803350
                          LD    3 MODSW-Z  TEST MODE SWITCH             K1803360
                          BSC     +Z       SKIP IF FIX                  K1803370
                          MDX     P2041    BRANCH IF FLOAT              K1803380
                          LD    3 FLT-Z    LOAD .CALL FLOAT.            K1803390
                          BSI   3 OUTUN-Z  OUTPUT CALL                  K1803400
                          LD    3 HF800-Z  SET MODE SWITCH              K1803410
                          STO   3 MODSW-Z  TO FLOAT                     K1803420
                          MDX     P2041    OUTPUT OPERATOR              K1803430
                    *                                                   K1803440
                    P2052 LD    3 MODSW-Z  TEST MODE SWITCH             K1803450
                          BSC     -        SKIP IF FLOAT                K1803460
                          MDX     P2041    BRANCH IF FIXED              K1803470
                    *                                                   K1803480
                    *                                                   K1803490
                    P2061 LD    3 FSTO-Z   LOAD .CALL FSTO.             K1803500
                          BSI   3 OUTOP-Z  OUTPUT CALL                  K1803510
                          BSI   3 GETGT-Z  GET GENERATED TEMPORARY      K1803520
                          BSI  L  GTMOD    MAKE MODE AGREE              K1803530
                          BSI   3 OUTNA-Z  OUTPUT NAME                  K1803540
                          LD    1 1        LOAD WORD                    K1803550
                          BSI   3 SCKLD-Z  OUTPUT .LOAD.                K1803560
                          BSI   3 GETGT-Z  GENERATED TEMPORARY          K1803570
                          STO   1 1        REPLACES NAME                K1803580
                          LD    3 FLT-Z    LOAD .CALL FLT.              K1803590
                          BSI   3 OUTUN-Z  OUTPUT CALL                  K1803600
                          LD    1 0        LOAD WORD                    K1803610
                          BSI   3 REVOP-Z  REVERSE OPERATOR             K1803620
                          STO   1 0        STORE REVERSED OPERATOR      K1803630
                          MDX     P2041    OUTPUT OPERATOR              K1803640
                    *                                                   K1803650
                    P2071 LD    3 HF800-Z  SET MODE SWITCH              K1803660
                          STO   3 MODSW-Z  TO FLOATING PT               K1803670
                          LD   I  PFIND    LOAD NEXT UNPROCESSED WORD   K1803680
                          BSI   3 SYMT-Z   GET SYM TBL ID WORD          K1803690
                          BSC  L  P2081,-  BRANCH IF FLOATING PT        K1803700
                          LD    1 1        LOAD WORD                    K1803710
                          BSI   3 SYMT-Z   GET SYM TBL ID WORD          K1803720
                          BSC  L  P2091,-  BRANCH IF FLOATING PT        K1803730
                          LD    3 ONE-Z    SET MODE SWITCH TO           K1803740
                          STO   3 MODSW-Z  FIXED PT                     K1803750
                          LD    1 1        OUTPUT FOLLOWING -           K1803760
                          BSI   3 SCKLD-Z  LD    PT+1                   K1803770
                          MDX     P2111    FIND NEXT UNPROCESSED OPTR   K1803780
                    *                                                   K1803790
                    P2081 LD    1 1        LOAD WORD                    K1803800
                          BSI   3 SYMT-Z   GET SYM TBL ID WORD          K1803810
                          BSC     +Z       SKIP IF FLOATING PT          K1803820
                          MDX     P2101    BRANCH IF FIXED PT           K1803830
                    *                                                   K1803840
                    P2083 LD    1 1                                     K1803850
                          BSI   3 SCKLD-Z  OUTPUT LOAD INSTRUCTION      K1803860
                          MDX     P2111    FIND NEXT UNPROCESSED OPTR   K1803870
                    *                                                   K1803880
                    P2091 LD    1 0        LOAD WORD                    K1803890
                          S     3 H000E-Z  IS IT ASSIGN                 K1803900
                          BSC     Z        SKIP IF YES                  K1803910
                          MDX     P2093    BRANCH IF NOT                K1803920
                          LD    1 1        LOAD WORD                    K1803930
                          BSI   3 SCKLD-Z  OUTPUT LOAD INSTRUCTION      K1803940
                          LD    3 IFIX-Z   CHANGE VAR TO FIXED PT       K1803950
                          BSI   3 OUTUN-Z  OUTPUT .CALL IFIX.           K1803960
                          MDX     P2111    GET NEXT UNPROCESSED OPTR    K1803970
                    *                                                   K1803980
                    P2093 A     3 H0004-Z  IS IT EXPRESSION OPERATOR    K1803990
                          BSC     +-       SKIP IF NOT                  K1804000
                          MDX     P2083    BRANCH IF YES                K1804010
                          LD    1 0                                     K1804020
                          BSI   3 REVOP-Z  REVERSE THE OPERATOR         K1804030
                          STO   1 0                                     K1804040
                          LD    1 2        LOAD WORD                    K1804050
                          S     3 H4800-Z  IS IT .LDX I1.               K1804060
                          BSC     Z        SKIP IF YES                  K1804070
                          S     3 H1300-Z  IS IT .LDX  L1.              K1804080
                          BSC  L  P2099,Z  BRANCH IF NOT                K1804090
                          LD    1 1        LOAD VARIABLE                K1804100
                          BSI   3 SCKLD-Z  OUTPUT LOAD INST AND VAR     K1804110
                          LD    3 FSTO-Z   LOAD .CALL FSTO.             K1804120
                          BSI   3 OUTUN-Z  OUTPUT CALL                  K1804130
                          BSI   3 GETGT-Z  GET ADDR OF NEXT SYM TBL GT  K1804140
                          BSI  L  GTMOD    MAKE MODE OF VAR AGREE       K1804150
                          BSI   3 OUTNA-Z  OUTPUT VAR                   K1804160
                          SLA     16       CLEAR ACC                    K1804170
                          BSI  L  FINDN    FIND NEXT UNPROCESSED PART   K1804180
                          BSI   3 SCKLD-Z  OUTPUT LOAD INST AND VAR     K1804190
                          LD    3 FLT-Z    LOAD .CALL FLOAT.            K1804200
                          BSI   3 OUTUN-Z  OUTPUT CALL                  K1804210
                          LD    1 -4       LOAD WORD                    K1804220
                          BSI   3 OUTUN-Z  OUTPUT                       K1804230
                          BSI   3 GETGT-Z  GET ADDR OF NEXT SYM TBL GT  K1804240
                          BSI   3 OUTNA-Z  OUTPUT NAME                  K1804250
                          MDX     P3010    GO GET NEXT UNPROCESSED PART K1804260
                    P2099 LD    1 1        LOAD WORD AT PT + 1          K1804270
                          SRT     16       MOVE TO EXTENSION            K1804280
                          LD   I  PFIND    LOAD WORD AT PT + 2          K1804290
                          STO   1 1        STORE AT PT + 1              K1804300
                          SLT     16       PUT WORD ORIGINALLY AT PT+1  K1804310
                          STO  I  PFIND    IN PFIND (PT + 2)            K1804320
                    P2101 LD    1 1        LOAD WORD                    K1804330
                          BSI   3 SCKLD-Z  OUTPUT LOAD INSTRUCTION      K1804340
                          LD    3 FLT-Z    CHANGE WORD TO FLOATING PT   K1804350
                          BSI   3 OUTUN-Z  OUTPUT .CALL FLT.            K1804360
                    *                                                   K1804370
                    *             FIND AND OUTPUT NEXT NONPROCESSED     K1804380
                    *             OPERATOR, ALSO OUTPUT INTERSPERSED    K1804390
                    *             PROCESSED DATA, IF ANY                K1804400
                    *                                                   K1804410
                    P2111 STX   1 P2112+1  SAVE INPUT PT                K1804420
                          LD    3 ZERO-Z   SET OUTPUT SWITCH            K1804430
                          BSI  L  FINDN    FIND NEXT UNPROCESSED OPTR   K1804440
                    P2112 LD   L  *-*      LOAD OPERATOR                K1804450
                          BSI   3 OUTOP-Z  OUTPUT OPERATOR              K1804460
                          LD   I  PFIND    LOAD NAME                    K1804470
                          BSI   3 OUTNA-Z  OUTPUT NAME                  K1804480
                    P3010 MDX   1 1        MOVE I/P PT                  K1804490
                    *                                                   K1804500
                          BSC  L  P2011    GET NEXT UNPROCESSED PART    K1804510
                    *                                                   K1804520
                    *             CHECKS FOR AN IF OPTR. GENERATES THE  K1804530
                    *             TRACING CALLS. CHECKS FOR A STMNT     K1804540
                    *             NO. ON THE NEXT STMNT. OPTIMIZES THE  K1804550
                    *             'BSC  L' INST GENERATED TO COMBINE    K1804560
                    *             CONDITIONS                            K1804570
                    P3011 LD    1 1        LOAD WORD                    K1804580
                          BSI   3 SYMT-Z   GET SYM TBL ID WORD          K1804590
                          SLA     5        IS IT STMNT NO.              K1804600
                          BSC  L  P301A,+Z BRANCH IF YES                K1804610
                    *                                                   K1804620
                          LD    1 1        LOAD WORD                    K1804630
                          BSI   3 SCKLD-Z  OUTPUT LOAD INSTRUCTION      K1804640
                          LD    3 ONE-Z    SET MODE SWITCH              K1804650
                          STO   3 MODSW-Z  TO FIXED POINT               K1804660
                          LD    3 STNA1-Z  LOAD SYM TBL ID WORD         K1804670
                          MDX   1 1        MOVE INPUT POINTER           K1804680
                          BSC  L  P301A,Z+ BRANCH IF INTEGER VARIABLE   K1804690
                          LD    3 HF800-Z  SET MODE SWITCH              K1804700
                          STO   3 MODSW-Z  TO FLOATING POINT            K1804710
                    *                                                   K1804720
                    *                                                   K1804730
                    P301A LD    3 ZERO-Z   ZERO TO                      K1804740
                          STO   3 STNCH-Z  CLEAR STMNT NO. CHECK        K1804750
                          MDX   1 1        MOVE INPUT PT                K1804760
                          LD    1 4        LOAD NEXT STMNT ID WORD      K1804770
                          SLT     15       DOES STMNT HAVE STMNT NO.    K1804780
                          BSC     -        SKIP IF NEXT STMT HAS NUMBER K1804790
                          MDX     P3012    BRANCH IF NOT                K1804800
                          LD    1 5        LOAD STMNT NO.               K1804810
                          STO   3 STNCH-Z  STORE STMNT NO.              K1804820
                    P3012 LD    3 MODSW-Z  TEST MODE SWITCH             K1804830
                          BSC     -        SKIP IF FLOATING POINT       K1804840
                          MDX     P3021    BRANCH IF FIXED POINT        K1804850
                          LD    3 LDFAC-Z  LOAD .LD FAC+1.              K1804860
                          BSI   3 OUTUN-Z  OUTPUT                       K1804870
                    P3021 LD   L  CCWD                                  K1804880
                          SLA     15       IS IF TRACE REQUIRED         K1804890
                          BSC  L  P3022,-  BRANCH IF NOT                K1804900
                          LD    3 MODSW-Z  TEST MODE SWITCH             K1804910
                          BSC  L  P3020,-  BRANCH IF FIXED PT           K1804920
                          LD    3 FIF-Z    REPLACE .LD FAC. BY          K1804930
                          STO   2 0        .CALL FIF. (FLOATING TRACE)  K1804940
                          MDX     P3022    CHECK BRANCH ADDRESSES       K1804950
                    P3020 LD    3 FIIF-Z   LOAD INTEGER IF TRACE CALL   K1804960
                          BSI   3 OUTUN-Z  OUTPUT CALL                  K1804970
                    P3022 LD    1 0        LOAD IF-NEGATIVE BRANCH ADDR K1804980
                          S     3 STNCH-Z  IS IT NEXT STMNT             K1804990
                          BSC     +-       SKIP IF NOT                  K1805000
                          MDX     P3041    BRANCH IF YES                K1805010
                          LD    1 0        IS IF-NEGATIVE BRANCH EQUAL  K1805020
                          S     1 1        TO IF-ZERO BRANCH ADDRESS    K1805030
                          BSC     Z        SKIP IF YES                  K1805040
                          MDX     P3031    BRANCH IF NOT                K1805050
                          LD    3 0        LOAD ZERO                    K1805060
                          STO   1 1        STORE IN IF ZERO WORD        K1805070
                          LD    3 BSCL1-Z  LOAD .BSC L  ,+.             K1805080
                          MDX     P3033    OUTPUT INSTRUCTION           K1805090
                    *                                                   K1805100
                    *                                                   K1805110
                    P3031 LD    1 0        IS IF-NEGATIVE BRANCH EQUAL  K1805120
                          S     1 2        TO IF-POSITIVE BRANCH ADDR   K1805130
                          BSC     Z        SKIP IF YES                  K1805140
                          MDX     P3032    BRANCH IF NOT                K1805150
                          LD    3 0        LOAD ZERO                    K1805160
                          STO   1 2        STORE IN IF-POSITIVE WORD    K1805170
                          LD    3 BSCL2-Z  LOAD .BSC L  ,Z.             K1805180
                          MDX     P3033    OUTPUT INSTRUCTION           K1805190
                    P3032 LD    3 BSCL3-Z  LOAD .BSC L  ,Z+.            K1805200
                    P3033 BSI   3 OUTOP-Z  OUTPUT BSC INSTRUCTION       K1805210
                          LD    1 0        LOAD BRANCH TO ADDRESS       K1805220
                          BSI   3 OUTNA-Z  OUTPUT ADDRESS               K1805230
                    P3041 LD    1 1        LOAD ZERO-BRANCH ADDRESS     K1805240
                          BSC     +-       SKIP IF NOT ZERO             K1805250
                          MDX     P3051    BRANCH IF EQUAL TO NEG-ADDR  K1805260
                          S     3 STNCH-Z  IS IT NEXT STMNT             K1805270
                          BSC     +-       SKIP IF NOT                  K1805280
                          MDX     P3051    BRANCH IF YES                K1805290
                          LD    1 1        IS IF-ZERO BRANCH EQUAL TO   K1805300
                          S     1 2        IF POSITIVE BRANCH ADDRESS   K1805310
                          BSC     Z        SKIP IF YES                  K1805320
                          MDX     P3042    BRANCH IF NOT                K1805330
                          LD    3 0        LOAD ZERO                    K1805340
                          STO   1 2        STORE IN IF-POSITIVE WORD    K1805350
                          LD    3 BSCL4-Z  LOAD .BSC L  ,-.             K1805360
                          MDX     P3043    OUTPUT INSTRUCTION           K1805370
                    *                                                   K1805380
                    P3042 LD    3 BSCL5-Z  LOAD .BSC L  ,+-.            K1805390
                    P3043 BSI   3 OUTOP-Z  OUTPUT BSC INSTRUCTION       K1805400
                          LD    1 1        LOAD ZERO-BRANCH ADDRESS     K1805410
                          BSI   3 OUTNA-Z  OUTPUT ADDRESS               K1805420
                    P3051 LD    1 2        LOAD POSITIVE BRANCH ADDRESS K1805430
                          BSC     +-       SKIP IF NOT ZERO             K1805440
                          MDX     P3053    BRANCH IF ZERO               K1805450
                          S     3 STNCH-Z  IS IT NEXT STMNT             K1805460
                          BSC     +-       SKIP IF NOT                  K1805470
                          MDX     P3053    BRANCH IF YES                K1805480
                          LD    3 BSCL6-Z  LOAD .BSC L  ,-Z.            K1805490
                          BSI   3 OUTOP-Z  OUTPUT INSTRUCTION           K1805500
                          LD    1 2        LOAD POSITIVE BRANCH ADDR    K1805510
                          BSI   3 OUTNA-Z  OUTPUT ADDRESS               K1805520
                    P3053 MDX   1 3        MOVE I/P POINTER             K1805530
                          BSC  L  P1021    GET NEXT STMNT               K1805540
                    *                                                   K1805550
                    *             DETECTS A CALL OPTR. SETS THE MODE    K1805560
                    *             SWITCH. IF IT IS AN IFIX OR FLOAT     K1805570
                    *             CALL, CHANGES IT TO A ONE-WD CALL     K1805580
                    P5011 LD    3 ONE-Z    SET MODE SWITCH              K1805590
                          STO   3 MODSW-Z  TO FIXED POINT               K1805600
                          LD    1 1        LOAD WORD                    K1805610
                          BSI   3 SYMT-Z   GET SYM TBL ID WORD          K1805620
                          BSC     +Z       SKIP IF FLOATING POINT       K1805630
                          MDX     P5012    BRANCH IF FIXED PT           K1805640
                          LD    3 HF800-Z  SET MODE SWITCH              K1805650
                          STO   3 MODSW-Z  TO FLOATING POINT            K1805660
                    *                                                   K1805670
                    *             TEST IF CALL IS .IFIX. OR .FLOAT.     K1805680
                    *             IF SO, CHANGE TO ONE-WORD CALL        K1805690
                    *                                                   K1805700
                    P5012 LD    1 1        LOAD WORD                    K1805710
                          BSI   3 SYMT-Z   GET SYM TBL ID WORD          K1805720
                          LD    3 SYMT1+1-Z  LOAD ADDR OF ID WORD       K1805730
                          A     3 ONE-Z                                 K1805740
                          STO     P501X+1  GET ADDRESS OF NAME IN ENTRY K1805750
                    P501X LD   L  *-*      LOAD FIRST WORD OF NAME      K1805760
                          STO   3 TEMP-Z   STORE                        K1805770
                          MDX  L  P501X+1,1    GET ADDR OF 2ND WORD     K1805780
                          LD   I  P501X+1  LOAD 2ND WORD                K1805790
                          STO   3 TEMP-Z+1 STORE                        K1805800
                    *                                                   K1805810
                    *             TEST IF NAME IS .FLOAT.               K1805820
                          LDD   3 TEMP-Z   LOAD NAME                    K1805830
                          SD    3 NFLT-Z   IS IT .FLOAT.                K1805840
                          BSC  L  P5013,Z  BRANCH IF NOT                K1805850
                          RTE     16       CHECK 2ND WORD               K1805860
                          BSC  L  P5013,Z  BRANCH NOT .FLOAT.           K1805870
                    *                                                   K1805880
                    *             OUTPUT .LOAD., ONEWORD .FLOAT.        K1805890
                          LD    3 FLT-Z    LOAD .CALL FLOAT.            K1805900
                          MDX     P5015    OUTPUT CALL                  K1805910
                    *                                                   K1805920
                    *             TEST IF .IFIX.                        K1805930
                    P5013 LDD   3 TEMP-Z   LOAD NAME                    K1805940
                          SD    3 NIFIX-Z  IS IT .IFIX.                 K1805950
                          BSC  L  P5016,Z  BRANCH IF NOT                K1805960
                          RTE     16       CHECK 2ND WORD               K1805970
                          BSC  L  P5016,Z  BRANCH NOT .IFIX.            K1805980
                    *                                                   K1805990
                    *             OUTPUT ONE-WORD .IFIX.                K1806000
                          LD    3 IFIX-Z   LOAD .CALL IFIX.             K1806010
                    *                                                   K1806020
                    *             2-WD CALL .IFIX. OR .FLOAT. ENCOUNTRD K1806030
                    P5015 STO   3 TEMP-Z   STORE CALL                   K1806040
                          LD    1 2        LOAD NEXT WORD               K1806050
                          BSI   3 SYMT-Z   GET SYM TBL ID WORD          K1806060
                          SLA     2        ISOLATE DIMENSION            K1806070
                          SRA     14       INFORMATION                  K1806080
                          BSC  L  P5017,+- BRANCH NOT DIMENSIONED       K1806090
                          LD    3 H6000-Z  LOAD NOP                     K1806100
                          BSI   3 OUTUN-Z  OUTPUT                       K1806110
                          LD    3 TEMP-Z   LOAD CALL                    K1806120
                          S     3 IFIX-Z   IS IT IFIX                   K1806130
                          BSC     Z        SKIP IF YES                  K1806140
                          LD    3 H8380-Z  CREATE PROPER                K1806150
                          A     3 FLD-Z    LOAD INSTRUCTION             K1806160
                          BSI   3 OUTUN-Z  OUTPUT INSTRUCTION           K1806170
                          LD    3 H6000-Z  LOAD NOP                     K1806180
                          BSI   3 OUTUN-Z  OUTPUT                       K1806190
                          MDX     P5018    OUTPUT ONE-WORD CALL         K1806200
                    P5017 LD    1 2        LOAD WORD                    K1806210
                          BSI   3 SCKLD-Z  OUTPUT LOAD INSTRUCTION      K1806220
                    P5018 LD    3 TEMP-Z   LOAD ONE-WORD CALL           K1806230
                          BSI   3 OUTUN-Z  OUTPUT CALL                  K1806240
                    *                                                   K1806250
                    *             MAKE ENTRY IN SYM TBL A PSEUDO ENTRY  K1806260
                    *             TO AVOID LISTING SUBP NAME TWICE      K1806270
                    *                                                   K1806280
                          LD    1 1        LOAD WORD                    K1806290
                          BSI   3 SYMT-Z   GET SYM TBL ID WORD          K1806300
                          BSC  L  *+2,-    BRANCH IF FLOATING POINT     K1806310
                          LD    3 H4220-Z  LOAD INTEGER STMNT NO. ID    K1806320
                          MDX     *+1      PUT IN SYMBOL TABLE          K1806330
                          LD    3 H0220-Z  LOAD REAL STMNT NO. ID       K1806340
                          STO  I  SYMT1+1  PUT IN SYM TBL               K1806350
                    *                                                   K1806360
                          MDX   1 3        MOVE I/P POINTER             K1806370
                          BSC  L  P2011    GET NEXT UNPROCESSED WORD    K1806380
                    *                                                   K1806390
                    *             TWO-WORD CALL OTHER THAN              K1806400
                    *             .FLOAT. OR .IFIX.                     K1806410
                    *                                                   K1806420
                    P5016 LD    3 ONE-Z    LOAD OPTR FOR TWO WORD CALL  K1806430
                          BSI   3 OUTUN-Z  OUTPUT CALL                  K1806440
                          LD    1 1        LOAD WORD                    K1806450
                          BSI   3 OUTUN-Z  OUTPUT                       K1806460
                          MDX   1 2        MOVE PT TO NEXT WORD         K1806470
                          LD    1 0        LOAD WORD                    K1806480
                          BSC  L  P2011,-  BRANCH IF OPERATOR           K1806490
                    *                                                   K1806500
                    *             CHECKS FOR THE EXTERNAL SPECIFICATION K1806510
                    *             GENERATES THE PROPER CALL             K1806520
                    *             OUTPUTS THE COMPLETE CALL AND         K1806530
                    *             ARGUMENTS                             K1806540
                    P5023 LD    1 0        LOAD WORD                    K1806550
                          BSI   3 SYMT-Z   GET SYM TBL ID WORD          K1806560
                          RTE     1                                     K1806570
                          BSC  L  P5024,+Z BRANCH IF CONSTANT           K1806580
                          SLA     11                                    K1806590
                          BSC  L  P5024,-  BRANCH IF NOT EXTERNAL       K1806600
                    *                                                   K1806610
                    *             NAME IS .EXTERNAL.                    K1806620
                    *             OUTPUT .CALL. OPERATOR (=/0001)       K1806630
                    *                                                   K1806640
                          LD    3 ONE-Z    LOAD CALL OPERATOR           K1806650
                          BSI   3 OUTUN-Z  OUTPUT OPERATOR              K1806660
                    *                                                   K1806670
                    *                                                   K1806680
                    *             OUTPUT NAME AT POINTER                K1806690
                    *                                                   K1806700
                    P5024 LD    1 0        LOAD NAME                    K1806710
                          BSI   3 OUTUN-Z  OUTPUT NAME                  K1806720
                    *                                                   K1806730
                    *             TEST IF END OF ARGUMENT LIST          K1806740
                    *             (NEXT WORD AN OPERATOR)               K1806750
                    *                                                   K1806760
                          MDX   1 1        MOVE I/P PT                  K1806770
                          LD    1 0        LOAD WORD                    K1806780
                          BSC  L  P2011,-  BRANCH IF OPERATOR           K1806790
                          MDX     P5023    BRANCH IF NOT                K1806800
                    *                                                   K1806810
                    *                                                   K1806820
                    *             GENERATES THE CALLS OR INSTRUCTIONS   K1806830
                    *             TO HANDLE THE UNARY MINUS             K1806840
                    *                                                   K1806850
                    P6011 LD    1 1        LOAD WORD                    K1806860
                          BSC     -        SKIP IF NOT OPERATOR         K1806870
                          MDX     P6024    BRANCH IF OPERATOR           K1806880
                          MDX   1 1        MOVE I/P POINTER             K1806890
                          BSI   3 SYMT-Z   GET SYM TBL ID WORD          K1806900
                          BSC     -        SKIP IF INTEGER NAME         K1806910
                          MDX     P6021    BRANCH IF REAL NAME          K1806920
                          LD    3 ONE-Z    SET MODE SWITCH              K1806930
                          STO   3 MODSW-Z  TO FIXED POINT               K1806940
                          LD    3 SLA16-Z  LOAD .SLA  16.               K1806950
                          BSI   3 OUTUN-Z  OUTPUT INSTRUCTION           K1806960
                          LD    3 SL-Z     LOAD .S L.                   K1806970
                          BSI   3 OUTOP-Z  OUTPUT INSTRUCTION           K1806980
                          LD    1 0        LOAD NAME                    K1806990
                          BSI   3 OUTNA-Z  OUTPUT                       K1807000
                    P6012 MDX   1 1        MOVE I/P PT                  K1807010
                          BSC  L  P2011    GET NEXT UNPROCESSED OPER    K1807020
                    P6021 LD    3 HF800-Z  SET MODE SWITCH              K1807030
                          STO   3 MODSW-Z  TO FLOATING POINT            K1807040
                          LD    3 FLD-Z    LOAD .FLD.                   K1807050
                          BSI   3 OUTOP-Z  OUTPUT                       K1807060
                          LD    1 0        LOAD NAME                    K1807070
                          BSI   3 OUTNA-Z  OUTPUT                       K1807080
                    P6022 LD      H1C80    LOAD .CALL RSIGN.            K1807090
                          BSI   3 OUTUN-Z  OUTPUT                       K1807100
                          MDX     P6012    PROCESS NEXT WORD            K1807110
                    H1C80 DC      /1C80    .CALL RSIGN.                 K1807120
                    P6024 LD    3 MODSW-Z  TEST MODE SWITCH             K1807130
                          BSC     +        SKIP IF FIXED POINT          K1807140
                          MDX     P6022    BRANCH IF NOT                K1807150
                          LD    3 STOFA-Z  LOAD .STO FAC+1.             K1807160
                          BSI   3 OUTUN-Z  OUTPUT                       K1807170
                          LD    3 SLA16-Z  LOAD .SLA  16.               K1807180
                          BSI   3 OUTUN-Z  OUTPUT                       K1807190
                          LD    3 SFAC-Z   LOAD .S    FAC+1.            K1807200
                          BSI   3 OUTUN-Z  OUTPUT                       K1807210
                          MDX     P6012    GET NEXT WORD                K1807220
                    *                                                   K1807230
                    *             GENERATES THE CODE FOR A 'LD' INST    K1807240
                    *             IN THE DESIGNATED MODE                K1807250
                    SCKLD DC      0        ENTRY POINT                  K1807260
                          STO     SCKL3    SAVE ACCUMULATOR             K1807270
                          BSI   3 SYMT-Z   GET SYM TBL ID WORD          K1807280
                          BSC  L  SCKL1,-  BRANCH IF REAL VARIABLE      K1807290
                          LD      SCKL3    LOAD INTEGER                 K1807300
                          OR    3 LDL-Z    COMBINE WITH .LD L.          K1807310
                          MDX     SCKL2    OUTPUT INSTRUCTION           K1807320
                    SCKL1 LD    3 FLD-Z    LOAD .FLD.                   K1807330
                          BSI   3 OUTUN-Z  OUTPUT                       K1807340
                          LD      SCKL3    LOAD REAL VARIABLE           K1807350
                    SCKL2 BSI   3 OUTUN-Z  OUTPUT                       K1807360
                          BSC  I  SCKLD    RETURN                       K1807370
                    *                                                   K1807380
                    *             SUBROUTINE                            K1807390
                    *             INCREMENT NORM IN OUTPUT STATEMENT    K1807400
                    *             AND INCREMENT OUTPUT POINTER          K1807410
                    *                                                   K1807420
                    INCR  DC      0        ENTRY POINT                  K1807430
                    NADR  MDX  L  *-*,4    INCREMENT NORM IN O/P STRING K1807440
                          MDX   2 1        INCREMENT O/P PT             K1807450
                          BSC  I  INCR     RETURN                       K1807460
                    OUTID EQU     NADR+1                                K1807470
                    *                                                   K1807480
                    *                                                   K1807490
                          BSS  E  0                                     K1807500
                    TEMP  DC      0        TEMPORARY                    K1807510
                          DC      0        STORAGE                      K1807520
                          BSS  E  0                                     K1807530
                    STNA1 DC      0        STORAGE FOR                  K1807540
                          DC      0        PROGRAM NAME                 K1807550
                    TEMP2 DC      0        TEMPORARY STORAGE            K1807560
                    SCKL3 DC      0        TEMPORARY STORAGE            K1807570
                    MODSW DC      0        MODE SWITCH                  K1807580
                    STTYP DC      0        STMNT ID TYPE                K1807590
                    NORM  DC      0        STMNT NORM                   K1807600
                    SOFIS DC      0        START OF I/P STRING - 1      K1807610
                    STNCH DC      0        STORAGE FOR STMNT NO.        K1807620
                    INID  DC      0        INPUT STMNT ID WORD ADDR     K1807630
                    SSOST DC      0        STORED START OF SYM TBL      K1807640
                    GTMO3 DC      0        TEMPORARY                    K1807650
                    *                                                   K1807660
                    *                                                   K1807670
                          ORG     TEMP                                  K1807680
                    CONT  LDX  L3 ZERO     LOAD INDEX REGISTER 3        K1807690
                          A     3 ONE-Z    ADD 1 TO GET SIZE OF STRING  K1807700
                          STO     MOVCT    SAVE SIZE                    K1807710
                          LDX  I1 EOFST    INITIALIZE LOOP O/P PT       K1807720
                          MDX   1 -10                                   K1807730
                          LDX  I2 EOFS     INITIALIZE LOOP I/P PT       K1807740
                    *                                                   K1807750
                    *             TEST IF OVERLAP ERROR                 K1807760
                          STX   1 TEMP     SAVE END OF SYM TBL ADDR     K1807770
                          LD   L  EOFS     LOAD END OF STRING ADDR      K1807780
                          S       TEMP     SUBTRACT END OF SYM TBL ADDR K1807790
                          BSC  L  MOVST,+Z BRANCH NO OVERLAP ERROR      K1807800
                          MDX  L  ERROR,1  SET OVERLAP ERROR INDICATOR  K1807810
                          BSC  L  EXIT     GO TO NEXT PHASE             K1807820
                    *                                                   K1807830
                    *             MOVES THE STRING NEXT TO THE SYM TBL  K1807840
                    MOVST LD    2 0        MOVE WORD NEXT               K1807850
                          STO   1 0        TO SYMBOL TABLE              K1807860
                          MDX   2 -1       MOVE POINTERS                K1807870
                          MDX   1 -1                                    K1807880
                          MDX  L  MOVCT,-1 SKIP IF FINISHED MOVE        K1807890
                          MDX     MOVST    CONTINUE LOOP                K1807900
                    *                                                   K1807910
                    *                                                   K1807920
                    *                                                   K1807930
                    *                                                   K1807940
                          STX  L1 SOFIS    STORE ADDR OF I/P STRING - 1 K1807950
                          LD   L  SOFST    INSERT STORED START          K1807960
                          STO   3 SSOST-Z  OF SYM TBL ADDR              K1807970
                          BSC  L  P1011    BRANCH TO MAIN PROGRAM       K1807980
                    *                                                   K1807990
                    MOVCT EQU     TEMP+1   COUNTER                      K1808000
                    *                                                   K1808010
                    *                                                   K1808020
                    FAXB  DC      /0000    SYM TBL ADDR OF 2-WORD CALL  K1808030
                    *                      (INITIAL VALUE = ZERO)       K1808040
                    FAXBX DC      /0000    SYM TBL ADDR OF 2-WORD CALL  K1808050
                    *                      (INITIAL VALUE = ZERO)       K1808060
                    *                                                   K1808070
                    H000C DC      /000C    MULTIPLY OPERATOR            K1808080
                    FDVR  DC      /0780    .CALL FDVR.                  K1808090
                    DFAC  DC      /557E    .D  FAC+1.                   K1808100
                    FSBR  DC      /0680    .CALL FSBR.                  K1808110
                    H0220 DC      /0220    FORMAT STMNT NO. ID          K1808120
                    FIXI  DC      /0980    .CALL FIXI.                  K1808130
                    FAXI  DC      /0880    .CALL FAXI.                  K1808140
                    STOL  DC      /9000    .STO L.                      K1808150
                    H9000 EQU     STOL                                  K1808160
                    FARIT DC      /0A80    .CALL FARIT.                 K1808170
                    IARIT DC      /0B80    .CALL IARIT.                 K1808180
                    DL    DC      /A800    .D L.                        K1808190
                    SRT16 DC      /5800    .SRT  16.                    K1808200
                    *                                                   K1808210
                    *             THE FOLLOWING 7 CONSTANTS             K1808220
                    *             MUST FOLLOW EACH OTHER AND RETAIN     K1808230
                    *             THEIR GIVEN ORDER                     K1808240
                    *                                                   K1808250
                    AL    DC      /9800    .A L.                        K1808260
                    SL    DC      /A000    .S L.                        K1808270
                    FADD  DC      /0080    .CALL FADD.                  K1808280
                    FSUB  DC      /0180    .CALL FSUB.                  K1808290
                    FDIV  DC      /0380    .CALL FDIV.                  K1808300
                          DC      0        NOT USED BUT NEEDED FOR TBL  K1808310
                    FMPY  DC      /0280    .CALL FMPY.                  K1808320
                    *                                                   K1808330
                    *                                                   K1808340
                    H0036 DC      /0036    .REVERSE SUB.                K1808350
                    HF803 DC      /F803    MASK TO ELIMINATE NORM       K1808360
                    SFAC  DC      /547E    .S  FAC+1.                   K1808370
                    SLA16 DC      /5900    .SLA 16.                     K1808380
                    STOFA DC      /537E    .STO  FAC+1.                 K1808390
                    BSCL6 DC      /5030    .BSC L ,Z-.                  K1808400
                    FIIF  DC      /0E80    .CALL FIIF. (FIX IF TRACE)   K1808410
                    FIF   DC      /0F00    .CALL FIF.  (FLT IF TRACE)   K1808420
                    LDFAC DC      /527E    .LD  FAC+1.                  K1808430
                    FSTO  DC      /0580    .CALL FSTO.                  K1808440
                    IFIX  DC      /0C80    .CALL IFIX.                  K1808450
                    LDL   DC      /8800    .LD L.                       K1808460
                    H8800 EQU     LDL                                   K1808470
                    FLD   DC      /0480    .CALL FLD.                   K1808480
                    FLT   DC      /0D00    .CALL FLOAT.                 K1808490
                    *                                                   K1808500
                    *             FOLLOWING TWO ENTRIES ARE USED        K1808510
                    *             AS DOUBLE-LENGTH WORDS                K1808520
                    *                                                   K1808530
                          BSS  E  0                                     K1808540
                    NFLT  DC      /8C9A    NAME                         K1808550
                          DC      /E063    .FLOAT.                      K1808560
                    NIFIX DC      /9231    NAME                         K1808570
                          DC      /99C0    .IFIX.                       K1808580
                    *                                                   K1808590
                    H3000 DC      /3000    MASK FOR DIMENSION TEST.     K1808600
                    ZERO  DC      0        ZERO                  00     K1808610
                    Z     EQU     ZERO                                  K1808620
                    ONE   DC      1        ONE                          K1808630
                    TWO   DC      2        TWO                          K1808640
                    THREE DC      3        THREE                        K1808650
                    FOUR  DC      /0004    FOUR                         K1808660
                    H0004 EQU     FOUR                                  K1808670
                    HF800 DC      /F800    ID TYPE MASK                 K1808680
                    TCALL DC      /3000    CALL ID TYPE                 K1808690
                    H4800 DC      /4800    .LDX I1.                     K1808700
                    TEND  DC      /1000    END ID TYPE                  K1808710
                    H000E DC      /000E    ASSIGN OPERATOR              K1808720
                    H800C DC      /800C    VARIABLE TEST MASK           K1808730
                    *             BITS FOR CONST,GENTEMP,SPECGENT       K1808740
                    H07FC DC      /07FC    MASK TO GET NORM             K1808750
                    BSCL1 DC      /5008    .BSC L ,+.                   K1808760
                    BSCL2 DC      /5020    .BSC L ,Z.                   K1808770
                    BSCL3 DC      /5028    .BSC L ,Z+.                  K1808780
                    BSCL4 DC      /5010    .BSC L ,-                    K1808790
                    BSCL5 DC      /5018    .BSC L ,+-.                  K1808800
                    H07FF DC      /07FF    MASK TO GET SYM TBL ADDR     K1808810
                    STLEN DC      /17FD     MAXIMUM LENGTH OF      2-11 K1808812
                    *                       *SYMBOL TABLE          2-11 K1808814
                    H8000 DC      /8000    SIGN BIT MASK                K1808820
                    EXP   DC      /000A    EXPONENTE OPERATOR           K1808830
                    HD000 DC      /D000    ARITHMETIC STMNT FUNC ID     K1808840
                    H0080 DC      /0080    SUBPROGRAM ID WORD           K1808850
                    H0028 DC      /0028    REFERENCED GENERATED TEMP ID K1808860
                    H0054 DC      /0054    EXPRESSION OPERATOR          K1808870
                    H5980 DC      /5980    .SLT 16.                     K1808880
                    HB000 DC      /B000    .M L.                        K1808890
                    H4000 DC      /4000    END STMNT ID WORD            K1808900
                    LIBFR DC      /2180    .LIBF READ.                  K1808910
                    LIBFF DC      /0480    .LIBF WRITE.                 K1808920
                    H4028 DC      /4028    INTEGER, DEFINED VAR, GT ID  K1808930
                    H1900 DC      /1900    .CALL SUBSCR.                K1808940
                    H6000 DC      /6000    CONSTANT FOR DIMENSION TEST  K1808950
                    H8380 DC      /8380    CONSTANT                     K1808960
                    MDXL1 DC      /6100-/1900  .MDX  L1.                K1808970
                    LDXL  DC      /5B00-/6100  .LDX  L.                 K1808980
                    LDXI  DC      /4800-/5B00  .LDX  I.                 K1808990
                    STXL1 DC      /6200-/4800  .STX  L1.                K1809000
                    UNARY DC      /0020    UNARY MINUS                  K1809010
                    CALLX EQU     H000E                                 K1809020
                    IF    DC      /0014-/002E  IF OPERATOR              K1809030
                    H4220 DC      /4220    INTEGER STMNT NO.            K1809040
                    H1300 DC      /1300    .LDX L1.                     K1809050
                    READ  EQU     H9000                                 K1809060
                    WRITE EQU     SL                                    K1809070
                    FIND  EQU     SRT16                                 K1809080
                    *                                                   K1809090
                    *             GETS THE SYM TBL ID WORD OF THE       K1809100
                    *             VARIABLE NAME.                        K1809110
                    SYMT  DC      0        ENTRY POINT                  K1809120
                          AND   3 H07FF-Z  GET NO. OF ENTRY RELATIVE TO K1809130
                          S     3 ONE-Z    START OF SYMBOL TABLE        K1809140
                          STO     SYMT1+1  SAVE NUMBER                  K1809150
                          LD   L  SOFST    GET ADDRESS OF ENTRY BY      K1809160
                          S       SYMT1+1  SUBTRACTING 3 TIMES ENTRY    K1809170
                          S       SYMT1+1  NO. FROM START OF STRING     K1809180
                          S       SYMT1+1  ADDRESS                      K1809190
                          STO     SYMT1+1  STORE ADDR OF ID WORD        K1809200
                    SYMT1 LD   L  *-*      LOAD SYM TBL ID WORD         K1809210
                          RTE     31       ROTATE WORD                  K1809220
                          STD   3 STNA1-Z  STORE ROTATED WORD           K1809230
                          BSC  I  SYMT     RETURN                       K1809240
                    *                                                   K1809250
                    *             GETS THE NAME OF THE NEXT NEW         K1809260
                    *             SYMBOL TABLE ENTRY                    K1809270
                    *                                                   K1809280
                    STENT DC      0        ENTRY POINT                  K1809290
                          MDX  L  EOFST,-3 MOVE END OF SYM TBL ADDR     K1809300
                          LD   L  SOFST    LOAD START OF SYM TBL ADDR   K1809310
                          S    L  EOFST    GET NEW SIZE OF SYM TBL      K1809320
                          SRT     16       POSITION FOR DIVIDE          K1809330
                          D     3 THREE-Z  GET NO. OF TABLE ENTRY       K1809340
                          OR    3 H8000-Z  PUT IN SIGN BIT FOR NAME     K1809350
                          BSC  I  STENT    RETURN                       K1809360
                    *                                                   K1809370
                    *             CHANGES THE SUBTRACT, DIVIDE, AND     K1809380
                    *             EXPONENTIATE OPTRS INTO REVERSE       K1809390
                    *             OPTRS WHERE NEEDED                    K1809400
                    *                                                   K1809410
                    REVOP DC      0        ENTRY POINT                  K1809420
                          STO   3 TEMP2-Z  SAVE OPERATOR                K1809430
                          S     3 H003E-Z  HAS OPERATOR BEEN REVERSED   K1809440
                          BSC  L  REV2,-Z  BRANCH IF YES                K1809450
                          A       H0038    IS OPERATOR MINUS            K1809460
                          BSC     +-       SKIP IF NOT                  K1809470
                          MDX     REV1     BRANCH IF YES                K1809480
                          S     3 TWO-Z    IS OPERATOR DIVIDE           K1809490
                          BSC     +-       SKIP IF NOT                  K1809500
                          MDX     REV1     BRANCH IF YES                K1809510
                          S     3 TWO-Z    IS OPERATOR EXPONENT         K1809520
                          BSC     Z        SKIP IF YES                  K1809530
                          MDX     REV3     BRANCH IF NOT                K1809540
                    *                                                   K1809550
                    REV1  LD    3 TEMP2-Z  LOAD OPERATOR                K1809560
                          A       H003E    ADD REVERSE CONSTANT         K1809570
                    REV2  STO   3 TEMP2-Z  STORE REVERSED OPTR          K1809580
                    REV3  LD    3 TEMP2-Z  LOAD OPERATOR                K1809590
                          BSC  I  REVOP    RETURN                       K1809600
                    H003E DC      /003E    REVERSING CONSTANT           K1809610
                    H0038 DC      /0038    MINUS TEST CONSTANT          K1809620
                    *                                                   K1809630
                    *             COMPUTES THE GT SYM TBL ADDR          K1809640
                    GETGT DC      0        ENTRY POINT                  K1809650
                          LD    3 NXTGT-Z  IS NEXT GT COMPUTED          K1809660
                          BSC  I  GETGT,Z  RETURN IF YES                K1809670
                    *                                                   K1809680
                    *                                                   K1809690
                    CMPGT BSI   3 STENT-Z  GET SYM TBL ADDR FOR NEXT GT K1809700
                          STO   3 NXTGT-Z  STORE ADDR                   K1809710
                    *                                                   K1809720
                    *             MAKE THE ENTRY A GENER TEMP ENTRY     K1809730
                    *             IN SYM T                              K1809740
                    *                                                   K1809750
                          BSI   3 SYMT-Z   GET ADDRESS FOR NEXT ENTRY   K1809760
                          LD    3 H0028-Z  LOAD SYM TBL ID WORD         K1809770
                          STO  I  SYMT1+1  PUT IN SYM TBL               K1809780
                          MDX     GETGT+1  RETURN                       K1809790
                    NXTGT DC      0        NEXT AVAILABLE GT            K1809800
                    *                                                   K1809810
                    *                                                   K1809820
                    *************************************************** K1809830
                    *             FOLLOWING SUBROUTINE PUTS THE CON-  * K1809840
                    *             TENTS OF A-REGISTER INTO OUTPUT     * K1809850
                    *             STRING AND PERFORMS HOUSEKEEPING OF * K1809860
                    *             OUTPUT STRING POINTER. (OUTPUT      * K1809870
                    *             POINTER IS INDEX REGISTER 2)  SUB-  * K1809880
                    *             ROUTINE HAS THREE ENTRY POINTS. USE * K1809890
                    *             OF FIRST MOVES THE CONTENTS OF A-RE-* K1809900
                    *             GISTER UNALTERED AS ONE WORD INTO   * K1809910
                    *             OUTPUT STRING. USING OTHER ENTRIES  * K1809920
                    *             (.NAME. AND .OPERATOR.-ENTRIES) MAY * K1809930
                    *             RESULT IN PACKED OUTPUT (OPERATOR   * K1809940
                    *             AND NAME IN THE SAME WORD). SOME    * K1809950
                    *             OPERATORS ARE CONVERTED INTO SEVERAL* K1809960
                    *             WORDS OF OUTPUT. THE SUBROUTINE ALSO* K1809970
                    *             PERFORMS PARTS OF THE CONTROLS  THAT* K1809980
                    *             ARE REQUIRED FOR MIXED MODE ARITH-  * K1809990
                    *             METIC AND MAY GENERATE CODES REPRE- * K1810000
                    *             SENTING .CALL FLT. OR .CALL IFIX.   * K1810010
                    *************************************************** K1810020
                    *************************************************** K1810030
                    *             ADDS A WORD TO THE STMNT STRING FROM  K1810040
                    *             THE ACCUMULATOR                       K1810050
                    *************************************************** K1810060
                    OUTUN DC      0        ENTRY POINT                  K1810070
                    OUT12 STO   2 1        PUT WORD ON OUTPUT STRING    K1810080
                          BSI   3 INCR-Z   INCREMENT O/P PT AND NORM    K1810090
                    OUT13 BSC  I  OUTUN    RETURN                       K1810100
                    *************************************************** K1810110
                    *             OUTPUT AND COUNT                    * K1810120
                    *             ENTRY = OPERATOR                    * K1810130
                    *************************************************** K1810140
                    *                                                   K1810150
                    *             SAME AS UNALTERED ARGUMENT ENTRY      K1810160
                    *                                                   K1810170
                    OUTOP EQU     OUTUN                                 K1810180
                    *                                                   K1810190
                    CWORD DC      0        CODEWORD             117     K1810200
                    NAME  DC      0        STORED NAME          119     K1810210
                    *                                                   K1810220
                    *************************************************** K1810230
                    *             ADDS A NAME TO THE STMNT STRING       K1810240
                    *             PACKED INTO ONE WORD WITH AN OPTR     K1810250
                    *************************************************** K1810260
                    OUTNA DC      0        ENTRY POINT                  K1810270
                    OUT31 STO     NAME     STORE OUTPUT WORD            K1810280
                          LD      OUTNA    LOAD RETURN ADDRESS          K1810290
                          STO     OUTUN    STORE IN OUTUN               K1810300
                          LD    2 0        LOAD LAST O/P WORD           K1810310
                          STO     CWORD    SAVE WORD                    K1810320
                    *                                                   K1810330
                    *             TEST IF END OF ARITH STMNT FUNC       K1810340
                    *             (IDENTIFIED BY OPTR = .ASSIGN.        K1810350
                    *             AND NAME = .ARITH STMNT FUNC.         K1810360
                    *                                                   K1810370
                          S     3 H000E-Z  IS IT ASSIGN OPERATOR        K1810380
                          BSC  L  OUT33,Z  BRANCH IF NOT                K1810390
                          LD      NAME     LOAD WORD TO BE OUTPUT       K1810400
                          BSI   3 SYMT-Z   GET SYM TBL ID WORD          K1810410
                          SLA     6        IS IT STMNT FUNCTION         K1810420
                          BSC  L  OUT33,-  BRANCH IF NOT                K1810430
                    *                                                   K1810440
                    *             IS IT END OF AN ARITH STMNT FUNC      K1810450
                    *             STATEMENT                             K1810460
                    *             DELETE LAST OUTPUT OPERATOR           K1810470
                    *                                                   K1810480
                          LD   I  NADR+1   LOAD STMNT ID WORD           K1810490
                          S     3 FOUR-Z   DECREMENT NORM               K1810500
                          STO  I  NADR+1   PUT BACK ON STRING           K1810510
                          MDX   2 -1       DECREMENT O/P PT             K1810520
                          BSC  I  OUTNA    RETURN                       K1810530
                    *                                                   K1810540
                    OUT33 LD      CWORD    LOAD LAST O/P WORD           K1810550
                          SRA     8                                     K1810560
                          BSC     +-       SKIP IF NO REDEFINITION      K1810570
                          MDX     OUT51    BRANCH TO REDEFINE CODE WORD K1810580
                    OUT41 LD      CWORD    LOAD CODE WORD               K1810590
                          BSC     +Z       SKIP IF NOT PACKED O/P       K1810600
                          MDX     OUT44    BRANCH TO PACKED OUTPUT      K1810610
                    *                                                   K1810620
                    *             NONPACKED                             K1810630
                    *             ENTRY IF A-REG = CODEWORD VALUE       K1810640
                    *                                                   K1810650
                    OUT43 STO   2 0        STORE CODE WORD              K1810660
                          LD      NAME     LOAD NAME                    K1810670
                          MDX     OUT12    OUTPUT NAME                  K1810680
                    *             PACKED                                K1810690
                    *             A-REG IS ASSUMED = CODEWORD VALUE     K1810700
                    OUT44 OR      NAME     PACK CODE WORD AND NAME      K1810710
                          STO   2 0        PUT ON O/P STRING            K1810720
                          MDX     OUT13    RETURN                       K1810730
                    *                                                   K1810740
                    OUT51 LD      NAME     GET SYM TBL ID               K1810750
                          BSI   3 SYMT-Z   WORD FOR FUTURE USE          K1810760
                          LD      CWORD    LOAD CODE WORD               K1810770
                          S     3 H000E-Z  IS IT ASSIGN OPERATOR        K1810780
                          BSC  L  OUT91,+- BRANCH IF YES                K1810790
                          BSC     -Z       SKIP IF LESS THAN ASSIGN     K1810800
                          MDX     OUT61    BRANCH IF NOT                K1810810
                          LD      CWORD    LOAD CODE WORD               K1810820
                          SRA     1        COMPUTE ADDR TO              K1810830
                          A       ADRC1    GET OPERATOR                 K1810840
                          STO     OUT53+1  STORE ADDR                   K1810850
                          S       ADRC2    IS IT EXPONENT OPERATOR      K1810860
                          BSC  L  OUTC4,+- BRANCH IF NOT                K1810870
                          LD    3 STNA1-Z  LOAD SUM TBL ID WORD OF NAME K1810880
                          BSC  L  OUT55,-  BRANCH IF FLOATING POINT     K1810890
                    *                                                   K1810900
                    *             NAME IS INTEGER NAME                  K1810910
                          LD      CWORD    LOAD OPERATOR                K1810920
                          S     3 H000C-Z  IS IT MULTIPLY OPERATOR      K1810930
                          BSC  L  OUT54,+- BRANCH IF YES                K1810940
                          A     3 H0004-Z  IS IT DIVIDE OPERATOR        K1810950
                          BSC  L  OUT85,+- BRANCH IF YES                K1810960
                    OUT53 LD   L  *-*      LOAD OPERATOR                K1810970
                          MDX     OUT44    PACK AND OUTPUT              K1810980
                    *                                                   K1810990
                    *             ENTRY FOR INTEGER MULTIPLY            K1811000
                    OUT54 LD    3 NAME-Z   LOAD NAME                    K1811010
                          OR    3 HB000-Z  PACK WITH MULTIPLY OPTR      K1811020
                          STO   2 0        PUT ON STRING                K1811030
                          LD    3 H5980-Z  LOAD .SLT  16.               K1811040
                          MDX     OUT12    OUTPUT INSTRUCTION           K1811050
                    *                                                   K1811060
                    *             ENTRY FOR OBTAINING .CALL FADD.,      K1811070
                    *             .CALL FSUB., .CALL FDIV.              K1811080
                    *                                                   K1811090
                    OUT55 MDX  L  OUT53+1,FADD-AL   MODIFY ADDRESS      K1811100
                          LD   I  OUT53+1  LOAD OPERATOR                K1811110
                          MDX     OUT43    OUTPUT OPERATOR, NAME        K1811120
                    *                                                   K1811130
                    ADRC1 DC      AL-2     ADDRESS CONSTANT             K1811140
                    ADRC2 DC      AL+3     ADDRESS CONSTANT             K1811150
                    *                                                   K1811160
                    OUT61 S     3 H0036-Z  IS IT REVERSE SUBTRACT       K1811170
                          BSC  L  OUTF1,+- BRANCH IF YES                K1811180
                          S     3 TWO-Z    IS IT REVERSE DIVIDE         K1811190
                          BSC  L  OUTG1,+- BRANCH                       K1811200
                          MDX     OUTB1    MUST BE REVERSE EXPONENTIATE K1811210
                    *                                                   K1811220
                    OUT85 LD    3 SRT16-Z  LOAD .SRT 16.                K1811230
                          STO   2 0        PUT ON O/P STRING            K1811240
                          BSI   3 INCR-Z   INCREMENT STMNT NORM, O/P PT K1811250
                          LD    3 DL-Z     LOAD .D L.                   K1811260
                          MDX     OUT44    OUTPUT OPERATOR, NAME        K1811270
                    *                                                   K1811280
                    *             ASSIGN                                K1811290
                    OUT91 LD   L  CCWD                                  K1811300
                          SLA     14       IS ARITHMETIC TRACE NEEDED   K1811310
                          BSC     -        SKIP IF YES                  K1811320
                          MDX     OUT95    BRANCH IF NOT                K1811330
                          LDD   3 STNA1-Z  LOAD SYM TBL ID WORD         K1811340
                          RTE     1        PUT ENTIRE WORD IN ACC       K1811350
                          AND   3 H800C-Z  IS IT VARIABLE NAME          K1811360
                          BSC     Z        SKIP IF YES                  K1811370
                          MDX     OUT95    BRANCH IF NOT                K1811380
                          LD    3 STNA1-Z  LOAD SYM TBL ID WORD         K1811390
                          BSC     -        SKIP IF INTEGER NAME         K1811400
                          MDX     OUT93    BRANCH IF NOT                K1811410
                          LD    3 IARIT-Z  LOAD .CALL IARIT.            K1811420
                          MDX     OUT43    OUTPUT CALL, NAME.           K1811430
                    OUT93 LD    3 FARIT-Z  L/AD .CALL FARIT.            K1811440
                          MDX     OUT43    OUTPUT CALL, NAME            K1811450
                    *                                                   K1811460
                    OUT95 LD    3 STNA1-Z  LOAD SYM TBL ID WORD         K1811470
                          BSC     -        SKIP IF INTEGER NAME         K1811480
                          MDX     OUTA1    BRANCH IF NOT                K1811490
                          SLA     3                                     K1811500
                          LD    3 STOL-Z   LOAD .STO L.                 K1811510
                          MDX     OUT44    OUTPUT OPTR, NAME            K1811520
                    OUTA1 LD    3 FSTO-Z   LOAD .CALL FSTO.             K1811530
                          MDX     OUT43    OUTPUT OPTR, WORD            K1811540
                    *                                                   K1811550
                    *             REV. EXPON.                           K1811560
                    OUTB1 LD    3 MODSW-Z  TEST MODE SWITCH             K1811570
                          BSC  L  OUTB2,Z+ BRANCH IF FLOATING POINT     K1811580
                    *                                                   K1811590
                    *             MODE = FIX                            K1811600
                          BSI   3 GETGT-Z  GET GENERATED TEMPORARY      K1811610
                          OR    3 H9000-Z  COMBINE WITH .STO L.         K1811620
                          MDX     OUTB3    OUTPUT                       K1811630
                    *                                                   K1811640
                    *             MODE = FLOAT                          K1811650
                    OUTB2 LD    3 FSTO-Z   LOAD .CALL FSTO.             K1811660
                          STO   2 0        OUTPUT CALL                  K1811670
                          BSI   3 INCR-Z   MOVE PT, INCREMENT NORM      K1811680
                          BSI   3 GETGT-Z  GET GENERATED TEMPORARY      K1811690
                    OUTB3 STO   2 0        PUT ON O/P STRING            K1811700
                    *                                                   K1811710
                    *             MAKE GT-MODE AGREE WITH MODESWITCH    K1811720
                          BSI  L  GTMOD                                 K1811730
                    *                                                   K1811740
                          BSI   3 INCR-Z   MOVE O/P PT, INCREMENT NORM  K1811750
                    *                                                   K1811760
                    *                                                   K1811770
                          LD    3 ONE-Z    SET MODE SWITCH              K1811780
                          STO   3 MODSW-Z  TO FIXED POINT               K1811790
                          LD    3 NAME-Z   OUTPUT                       K1811800
                          OR    3 H8800-Z  .LD L  NAME.                 K1811810
                          STO   2 0        PUT ON OUTPUT STRING         K1811820
                          BSI   3 SYMT-Z   WAS NAME FIXED PT            K1811830
                          BSC  L  OUTC1,Z+ BRANCH IF YES                K1811840
                    *                                                   K1811850
                    *             CHANGE MODESWITCH AND                 K1811860
                    *             REPLACE OUTPUT BY FLOATING ARITHM     K1811870
                    *                                                   K1811880
                          LD    3 HF800-Z  SET MODE SWITCH              K1811890
                          STO   3 MODSW-Z  TO FLOATING POINT            K1811900
                          LD    3 FLD-Z    LOAD .CALL FLD.              K1811910
                          STO   2 0        PUT ON O/P STRING            K1811920
                          BSI   3 INCR-Z   MOVE O/P PT, INCREMENT NORM  K1811930
                          LD    3 NAME-Z   LOAD NAME                    K1811940
                          STO   2 0        PUT ON O/P STRING            K1811950
                    OUTC1 BSI   3 INCR-Z   MOVE O/P PT, INCREMENT NORM  K1811960
                    OUTC3 BSI   3 GETGT-Z  REPLACE STORED NAME BY       K1811970
                          STO   3 NAME-Z   GENERATED TEMPORARY          K1811980
                    *                                                   K1811990
                    *             OPERTR. EXP                           K1812000
                    OUTC4 LD    3 MODSW-Z  TEST MODE SWITCH             K1812010
                          BSC     +        SKIP IF FIXED PT             K1812020
                          MDX     OUTD5    BRANCH IF NOT                K1812030
                          LD    3 NAME-Z   LOAD NAME                    K1812040
                          BSI   3 SYMT-Z   GET SYM TBL ID WORD          K1812050
                          BSC     -        SKIP IF INTEGER NAME         K1812060
                          MDX     OUTD1    BRANCH IF NOT                K1812070
                          LD    3 FIXI-Z   LOAD .CALL FIXI.             K1812080
                    OUTC5 BSC  L  OUT43    OUTPUT CALL, NAME            K1812090
                    *                                                   K1812100
                    OUTD1 LD    3 FLT-Z    LOAD .CALL FLT.              K1812110
                          STO   2 0        PUT ON O/P STRING            K1812120
                          BSI   3 INCR-Z   MOVE O/P PT, INCREMENT NORM  K1812130
                          LD    3 HF800-Z  SET MOD SWITCH               K1812140
                          STO   3 MODSW-Z  TO FLOATING PT               K1812150
                    *                                                   K1812160
                    OUTD2 LD    3 TWO-Z    MAKE CODE WORD IN O/P STRING K1812170
                          STO   2 0        INTO A 2-WORD CALL OPTR      K1812180
                    *                                                   K1812190
                    *             TEST IF NAME DIMENSIONED              K1812200
                          LD    3 NAME-Z   LOAD NAME                    K1812210
                          BSI   3 SYMT-Z   GET SYM TBL ID WORD          K1812220
                          AND   3 H3000-Z  IS IT DIMENSIONED            K1812230
                          BSC  L  OUTD3,+- BRANCH IF NOT                K1812240
                    *                                                   K1812250
                    *             OUTPUT 2-WD CALL FAXBX                K1812260
                          LD    3 FAXBX-Z  LOAD .CALL FAXBX.            K1812270
                          BSI  L  CAXBX,+- BRANCH TO MAKE SYM TBL ENTRY K1812280
                    *                      IF NOT THERE ALREADY         K1812290
                          MDX     OUTD4    MOVE PT                      K1812300
                    *                                                   K1812310
                    *             OUTPUT 2-WD CALL .FAXB.               K1812320
                    OUTD3 LD    3 FAXB-Z   LOAD .CALL FABX.             K1812330
                          BSI  L  CAXB,+-  BRANCT TO MAKE SYM TBL ENTRY K1812340
                    *                      IF NOT THERE ALREADY         K1812350
                    *                                                   K1812360
                    OUTD4 STO   2 1        OUTPUT WORD                  K1812370
                          BSI   3 INCR-Z   MOVE O/P PT, INCREMENT NORM  K1812380
                    *                                                   K1812390
                          LD    3 NAME-Z   LOAD NAME                    K1812400
                    OUTDX BSC  L  OUT12    OUTPUT NAME                  K1812410
                    *                                                   K1812420
                    OUTD5 LD    3 NAME-Z   LOAD NAME                    K1812430
                          BSI   3 SYMT-Z   GET SYM TBL ID WORD          K1812440
                          BSC     -        SKIP IF INTEGER              K1812450
                          MDX     OUTD2    BRANCH IF NOT                K1812460
                    *                                                   K1812470
                          LD    3 FAXI-Z   LOAD .CALL FAXI.             K1812480
                          MDX     OUTC5    OUTPUT CALL                  K1812490
                    *                                                   K1812500
                    *             REVERSE SUB                           K1812510
                    OUTF1 LD    3 STNA1-Z  LOAD SYM TBL ID WORD         K1812520
                          BSC     -        SKIP IF INTEGER              K1812530
                          MDX     OUTF4    BRANCH IF NOT                K1812540
                          LD    3 STOFA-Z  LOAD .STO FAC+1.             K1812550
                          STO   2 0        PUT ON O/P STRING            K1812560
                          LD    3 NAME-Z   LOAD NAME                    K1812570
                          AND   3 H07FF-Z  GET SYM TBL ENTRY NO         K1812580
                          A     3 LDL-Z    COMBINE WITH .LD L.          K1812590
                          STO   2 1        PUT ON O/P STRING            K1812600
                          BSI   3 INCR-Z   MOVE O/P PT, INCREMENT NORM  K1812610
                          LD    3 SFAC-Z   LOAD .S FAC+1.               K1812620
                          MDX     OUTDX    OUTPUT                       K1812630
                    *                                                   K1812640
                    OUTF4 LD    3 FSBR-Z   LOAD.CALL FSBR.              K1812650
                          MDX     OUTC5    OUTPUT                       K1812660
                    *                                                   K1812670
                    *             REVERSE DIVIDE                        K1812680
                    OUTG1 LD    3 STNA1-Z  LOAD SYM TBL ID WORD         K1812690
                          BSC     -        SKIP IF INTEGER              K1812700
                          MDX     OUTG4    BRANCH IF NOT                K1812710
                          LD    3 STOFA-Z  LOAD .STO FAC+1.             K1812720
                          STO   2 0        OUTPUT                       K1812730
                          LD    3 NAME-Z   LOAD NAME                    K1812740
                          OR    3 LDL-Z    COMBINE WITH .LD L.          K1812750
                          STO   2 1        PUT ON O/P STRING            K1812760
                          LD    3 SRT16-Z  LOAD .SRT 16.                K1812770
                          STO   2 2        PUT ON O/P STRING            K1812780
                          BSI   3 INCR-Z   INCREMENT NORM, MOVE O/P PT  K1812790
                          BSI   3 INCR-Z   INCREMENT NORM, MOVE O/P PT  K1812800
                          LD    3 DFAC-Z   LOAD .D  FAC+1.              K1812810
                          MDX     OUTDX    OUTPUT                       K1812820
                    *                                                   K1812830
                    OUTG4 LD    3 FDVR-Z   LOAD .CALL FDVR.             K1812840
                          MDX     OUTC5    OUTPUT                       K1812850
                    *                                                   K1812860
                    *             MAKES THE MODE OF THE GT AGREE WITH   K1812870
                    *             THE CURRENT MODE OF THE MODE SW       K1812880
                    *                                                   K1812890
                    GTMOD DC      0        ENTRY POINT                  K1812900
                          STO   3 GTMO3-Z  SAVE WORD                    K1812910
                          BSI   3 SYMT-Z   GET SYM TBL ID WORD          K1812920
                          LD    3 MODSW-Z  TEST MODE                    K1812930
                          BSC  L  GTMO1,+  RANCH IF FLOATING PT         K1812940
                          LD    3 H4028-Z  SET ID WORD TO FIXED PT      K1812950
                          MDX     GTMO2    PUT IN TABLE                 K1812960
                    GTMO1 LD    3 H0028-Z  SET ID WORD TO FLOATING PT   K1812970
                    GTMO2 STO  I  SYMT1+1  STORE IN TABLE               K1812980
                          LD    3 GTMO3-Z  RESTORE ACCUMULATOR          K1812990
                          BSC  I  GTMOD    RETURN                       K1813000
                    *                                                   K1813010
                    *                                                   K1813020
                    *             MAKES THE SYM TBL ENTRY FOR THE       K1813030
                    *             SUBROUTINE NAMES FAXB AND EAXB SINCE  K1813040
                    *             THEY ARE 2-WORD CALLS                 K1813050
                    *                                                   K1813060
                    CAXB  DC      0        ENTRY POINT                  K1813070
                    *                                                   K1813080
                    *             GET NAM+ OF NEXT SYMT ENTRY           K1813090
                    *             AND STORE                             K1813100
                    *                                                   K1813110
                          BSI   3 STENT-Z  GET NEXT SYM TBL ENTRY NO.   K1813120
                          STO   3 FAXB-Z   SAVE ENTRY NO.               K1813130
                          STO     CAXBX    SAVE ENTRY NO.               K1813140
                    *                                                   K1813150
                          LDD     NAME1    GET EBC-NAME .FABX.          K1813160
                    CAXB1 STD   3 TEMP-Z   STORE NAME                   K1813170
                    *                                                   K1813180
                    *             MAKE SYMBOL TABLE ID-WD ENTRY         K1813190
                          STX  L1 CAXB3+1  SAVE I/P PT                  K1813200
                          LDX  I1 EOFST    LOAD XR1 WITH END OF STRING  K1813210
                          LD    3 H0080-Z  MAKE ID WORD A SUBPROGRAM    K1813220
                          STO   1 3        PUT IN SYM TBL               K1813230
                    *                                                   K1813240
                    *             IF EXTENDED PREC, CHANGE              K1813250
                    *             NAME                                  K1813260
                    *                                                   K1813270
                          LD   L  CCWD                                  K1813280
                          SLA     13       IS THERE STANDARD PRECISION  K1813290
                          BSC  L  CAXB2,-  BRANCH IFYES                 K1813300
                    *                                                   K1813310
                    *             CHANGE NAME TO BEGIN WITH .E.         K1813320
                          LD      NAME3    CHANGE .FAXB.                K1813330
                          STO   3 TEMP-Z   TO .EAXB.                    K1813340
                    *                                                   K1813350
                    CAXB2 LDD   3 TEMP-Z   LOAD NAME                    K1813360
                          STO   1 4        PUT 1ST WORD IN SYM TBL      K1813370
                          RTE     16                                    K1813380
                          STO   1 5        PUT 2ND WORD IN SYM TBL      K1813390
                    *                                                   K1813400
                    CAXB3 LDX  L1 *-*      RESTORE I/P PT               K1813410
                          LD      CAXBX    LOAD SUBPROGRAM NAME         K1813420
                          BSC  I  CAXB     RETURN                       K1813430
                    *                                                   K1813440
                    *                                                   K1813450
                    *             MAKES THE SYM TBL ENTRY FOR THE       K1813460
                    *             SUBROUTINE NAMES FAXBX AND EAXBX      K1813470
                    *             SINCE THEY ARE 2-WD CALLS             K1813480
                    *                                                   K1813490
                    CAXBX DC      0        ENTRY POINT                  K1813500
                          LD      CAXBX    MOVE RETURN ADDR SO CAN USE  K1813510
                          STO     CAXB     .CALL FABX. SUBROUTINE       K1813520
                          BSI   3 STENT-Z  GET NEXT SYM TBL ENTRY NO.   K1813530
                          STO     CAXBX    STORE                        K1813540
                          STO   3 FAXBX-Z  STORE                        K1813550
                          LDD     NAME2    LOAD EBC-NAME .FAXBX.        K1813560
                          MDX     CAXB1    PUT IN SYM TBL               K1813570
                    *                                                   K1813580
                    *             CONSTANTS                             K1813590
                          BSS  E  0                                     K1813600
                    NAME1 DC      /8C0C    EBC-NAME                     K1813610
                          DC      /F080    .FAXB.                       K1813620
                    NAME2 DC      /8C0C    EBC-NAME                     K1813630
                          DC      /F0A7    .FAXBX.                      K1813640
                    NAME3 DC      /8A0C    EBC-NAME .EAX.               K1813650
                    *                                                   K1813660
                    *                                                   K1813670
                    *             LOCATES THE NEXT OPTR NOT YET         K1813680
                    *             PROCESSED                             K1813690
                    *                                                   K1813700
                    FINDN DC      0        ENTRY POINT                  K1813710
                          STO   3 TEMP-Z   STORE O/P SWITCH             K1813720
                          MDX   1 2        INITIALIZE POINTER           K1813730
                          STX   1 PFIND    SAVE I/P PT                  K1813740
                    FINDA LD   I  PFIND    LOAD WORD IN STMNT           K1813750
                          S     3 H1900-Z  IS WORD .CALL SUBSCR.        K1813760
                          BSC  L  MVSUB,+- BRANCH IF YES                K1813770
                          S     3 MDXL1-Z  IS IT .MDX L1.               K1813780
                          BSC  L  MV3,+-   BRANCH IF YES                K1813790
                          S     3 LDXL-Z   IS IT .LDX L1.               K1813800
                          BSC  L  MV2,+-   BRANCH IF YES                K1813810
                          S     3 LDXI-Z   IS IT .LDX I1.               K1813820
                          BSC  L  MV2,+-   BRANCH IF YES                K1813830
                          S     3 STXL1-Z  IS IT .STX L1.               K1813840
                          BSC  L  MV2,+-   BRANCH IF YES                K1813850
                          LD   I  PFIND    RESTORE WORD                 K1813860
                          BSC  I  FINDN    RETURN                       K1813870
                    *                                                   K1813880
                    MV3   BSI     MOVE1    MOVE WORD TO O/P STRING      K1813890
                    MV2   BSI     MOVE1    MOVE WORD TO O/P STRING      K1813900
                    MV1   BSI     MOVE1    MOVE WORD TO O/P STRING      K1813910
                          MDX     FINDA    RETURN                       K1813920
                    MVSUB BSI     MOVE1    MOVE WORD TO O/P STRING      K1813930
                          BSI     MOVE1    MOVE WORD TO O/P STRING      K1813940
                    MVS1  BSI     MOVE1    MOVE WORD TO O/P STRING      K1813950
                          BSI     MOVE1    MOVE WORD TO O/P STRING      K1813960
                          LD   I  PFIND    LOAD WORD                    K1813970
                          BSC  L  MVS1,-   BRANCH IF NOT TAGGED         K1813980
                          MDX     MV1      MOVE WORD, RETURN            K1813990
                    *                                                   K1814000
                    MOVE1 DC      0        ENTRY POINT                  K1814010
                          LD    3 TEMP-Z   TEST SWITCH                  K1814020
                          BSC  L  MOVEX,Z  BRANCH NOT OUTPUT            K1814030
                          LD   I  PFIND    LOAD WORD                    K1814040
                          BSI   3 OUTUN-Z  PUT ON O/P STRING            K1814050
                          MDX   1 1        MOVE I/P PT                  K1814060
                    MOVEX MDX  L  PFIND,1  MOVE SUBROUTINE PT           K1814070
                          BSC  I  MOVE1    RETURN                       K1814080
                    *                                                   K1814090
                    PFIND DC      0        POINTER IN SUBROUTINE        K1814100
                    *                                                   K1814110
                    *                                                   K1814120
                    *             NOT IN CARD SYSTEM                    K1814130
                    *                                                   K1814140
                    *                                                   K1814150
                    *             OUTPUTS DISK READ/WRITE STMNTS        K1814160
                    *                                                   K1814170
                    D5011 LD   I  INID     LOAD STMNT ID WORD           K1814180
                          AND   3 H07FC-Z  GET NORM                     K1814190
                          SRA     2        RIGHT JUSTIFY                K1814200
                          A     3 INID-Z   GET ADDR OF NEXT STMNT       K1814210
                          S     3 ONE-Z    SUBTRACT ONE                 K1814220
                          STO     NXTID    SAVE ADDRESS                 K1814230
                          LD    1 3        LOAD WORD                    K1814240
                          BSI   3 SYMT-Z   GET SYM TBL ID WORD          K1814250
                          BSC  L  D5021,-  BRANCH IF NOT INTEGER        K1814260
                    *                                                   K1814270
                    *             OUTPUT REST OF READ/WRITE             K1814280
                    *             STATEMENT                             K1814290
                    *                                                   K1814300
                    D5013 MDX   1 1        MOVE I/P PT                  K1814310
                          LD    1 0        LOAD WORD                    K1814320
                          BSI   3 OUTUN-Z  PUT ON O/P STRING            K1814330
                          STX   1 TSX1     STORE I/P PT                 K1814340
                          LD      TSX1     TEST FOR END                 K1814350
                          S       NXTID    OF STMNT                     K1814360
                          BSC  L  P1021,-  BRANCH IF END OF STMNT       K1814370
                          BSC  L  D5013    CONTINUE O/P                 K1814380
                    *                                                   K1814390
                    *             ERROR ENCOUNTERED                     K1814400
                    *             EXPRESSION NOT INTEGER                K1814410
                    *             IN READ/WRITE STMT                    K1814420
                    *                                                   K1814430
                    D5021 LDX  I2 OUTID    RESET O/P PT                 K1814440
                          LDX  I1 INID     RESET I/P PT                 K1814450
                          LD      HA008    LOAD ERROR STMNT ID WORD     K1814460
                          STO   2 0        PUT ON O/P STRING            K1814470
                          LD    1 0        LOAD STMNT ID WORD           K1814480
                          SLA     15       DOES STMNT HAVE STMNT NO.    K1814490
                          BSC  L  D5023,-  BRANCH IF NOT                K1814500
                          LD      HA00D    REPLACE ERROR ID WORD WITH   K1814510
                          STO   2 0        ERROR WORD WITH STMNT NO.    K1814520
                          LD    1 1        LOAD STMNT NO.               K1814530
                          STO   2 1        PUT ON O/P STRING            K1814540
                          MDX   2 1        MOVE O/P PT                  K1814550
                    D5023 LD      ERNO     LOAD ERROR NO.               K1814560
                          STO   2 1        PUT ON O/P STRING            K1814570
                          MDX   2 1        MOVE O/P PT                  K1814580
                          LDX  I1 NXTID    MOVE I/P PT TO NEXT STMNT    K1814590
                    *                                                   K1814600
                          BSC  L  P1021    PROCESS NEXT STMNT           K1814610
                    *                                                   K1814620
                    EXPRO DC      /0054    EXPRESSION OPERATOR          K1814630
                    HA008 DC      /A008    ERROR STMNT ID WORD          K1814640
                    HA00D DC      /A00D    ERROR ID WITH STMNT NO.      K1814650
                    ERNO  DC      73       ERROR NO. 73                 K1814660
                    NXTID DC      0        ADDR OF NEXT I/P STMNT - 1   K1814670
                    TSX1  DC      0                                     K1814680
                    *                                                   K1814690
                    *                                                   K1814700
                    *             BR TO LOADER TO LOAD NEST PHASE       K1814710
                    *                                                   K1814720
                    EXIT  LD   L  SOFST     LD START OF S.T. ADDR  2-11 K1814721
                          S    L  STLEN     SUB MAX S/T LENGTH     2-11 K1814723
                          S    L  EOFST     SUB ACTUAL LIMIT       2-11 K1814725
                          BSC  L  EXIT1,+   IF ACTUAL EXCEEDS MAX, 2-11 K1814726
                          LD   L  ERROR     LOAD ERROR INDICATOR   2-11 K1814727
                          OR      ERR8      *SET ERROR BIT         2-11 K1814728
                          STO  L  ERROR     * AND RESTORE          2-11 K1814729
                    EXIT1 LDX  I1 NXTPH+1   LOAD PARAM FOR READING 2-11 K1814730
                          LDD     NXTPH+2  NEXT PHASE                   K1814740
                          BSC  L  ROL      GO TO READ NEXT PHASE        K1814750
                    ERR8  DC      128       TO SET ERROR BIT ON    2-11 K1814755
                          BSS  E  0                                     K1814760
                    NXTPH DC      49       ID OF NEXT PHASE             K1814770
                          DC      *-*      CORE ADDRESS NEXT PHASE      K1814780
                          DC      *-*      WORD COUNT NEXT PHASE        K1814790
                          DC      *-*      SECTOR ADDRESS NEXT PHASE    K1814800
                    *                                                   K1814810
                    *                                                   K1814820
                          BSS     153       PATCH AREA             2-11 K1814830
                          DC       0                                    K1814840
                          END     BPHAR-2                               K1814850
