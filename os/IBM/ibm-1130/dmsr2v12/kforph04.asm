                          HDNG    1130 FORTRAN COMPILER PHASE 4         K0400010
                    *************************************************** K0400020
                    *STATUS - VERSION 2  MODIFICATION 12              * K0400030
                    *                                                 * K0400040
                    *FUNCTION/OPERATION-                              * K0400050
                    *   * PLACES COMMON STMNT VARIABLE INTO THE SYMBOL* K0400060
                    *     TABLE. INCLUDES DIMENSION INFORMATION, IF   * K0400070
                    *     PRESENT.                                    * K0400080
                    *   * REMOVES COMMON STMNTS FROM THE STRING       * K0400090
                    *     AND INSERTS A DUMMY ERROR STMT(ERROR NUM 2-11 K0400100
                    *     BER EQUAL TO ZERO) TO ACT AS A LINE COUNT2-11 K0400110
                    *     PLACE HOLDER.                            2-11 K0400120
                    *   * CHECKS FOR A SUBROUTINE OR FUNCTION STMNT.  * K0400130
                    *   * PLACES THE NAME AND DUMMY ARGUMENTS OF THE  * K0400140
                    *     SUBROUTINE OR FUNCTION STATEMENT INTO THE   * K0400150
                    *     SYMBOL TABLE. DELETES THE STMNT FROM THE    * K0400160
                    *     STMNT STRING AND INSERTS A DUMMY ERROR   2-11 K0400170
                    *     STMNT(ERROR NUMBER EQUAL TO ZERO) TO     2-11 K0400180
                    *     ACT AS A LINE COUNT PLACE HOLDER         2-11 K0400190
                    *   * CHECKS REAL AND INTEGER STATEMENTS FOR THE  * K0400200
                    *     WORD FUNCTION                               * K0400210
                    *   * PHASE 4 IS A TWO PASS PHASE. THE FIRST PASS * K0400220
                    *     PROCESSES COMMON STATEMENTS. THE SECOND     * K0400230
                    *     PASS PROCESSES A SUBROUTINE OR FUNCTION     * K0400240
                    *     STATEMENTS, INCLUDING A FUNCTION DESIGNATED * K0400250
                    *     IN A REAL OR INTEGER STATEMENT.             * K0400260
                    *                                                 * K0400270
                    *ENTRY POINTS-                                    * K0400280
                    *   PH-PHASE 4 IS READ INTO CORE BY PHASE 3 AND   * K0400290
                    *      EXECUTION BEGUN AT LOCATION PH.            * K0400300
                    *                                                 * K0400310
                    *INPUT-                                           * K0400320
                    *   NONE IN THE USUAL SENSE. HOWEVER, THE STMNT   * K0400330
                    *   STRING SCANNED BY THE COMPILER MAY BE         * K0400340
                    *   CONSIDERED INPUT.                             * K0400350
                    *                                                 * K0400360
                    *OUTPUT-                                          * K0400370
                    *   NONE IN THE USUAL SENSE. HOWEVER, PHASE 4     * K0400380
                    *   REMOVES STMNTS FROM THE STMNT STRING AND ADDS * K0400390
                    *   ENTRIES TO THE SYMBOL TABLE.                  * K0400400
                    *                                                 * K0400410
                    *EXTERNAL ROUTINES-N/A                            * K0400420
                    *                                                 * K0400430
                    *EXITS-                                           * K0400440
                    *   NORMAL-                                       * K0400450
                    *      PHASE EXITS NORMALLY IF NO STMNTS OF THE   * K0400460
                    *      TYPE IT PROCESSES ARE ENCOUNTERED OR IF NO * K0400470
                    *      ERRORS ARE FOUND. PHASE 5 IS LOADED AND    * K0400480
                    *      EXECUTED.                                  * K0400490
                    *   ERROR-                                        * K0400500
                    *      THE FLOW OF COMPILER PROCESSING IS NOT     * K0400510
                    *      INTERRUPTED WHEN AN ERROR IS ENCOUNTERED   * K0400520
                    *      AN ERROR STMNT REPLACES THE FAULTY STMNT   * K0400530
                    *      ON THE STRING AND STMNT SCANNING PROCESS   * K0400540
                    *      CONTINUES. AN EXCEPTION OCCURS IN THE CASE * K0400550
                    *      OF AN OVERLAP ERROR. COMPILATION IS        * K0400560
                    *      ABORTED AND CONTROL IS PASSED FROM PHASE   * K0400570
                    *      TO SUCCEEDING PHASE UNTIL AN OUTPUT PHASE  * K0400580
                    *      IS REACHED WHICH CAN PRINT AN ERROR MESSAGE* K0400590
                    *      THE ERRORS DETECTED BY PHASE 4 ARE  7, 8,  * K0400600
                    *      10, 11, 12, 13, 14 AND 15.                 * K0400610
                    *                                                 * K0400620
                    *TABLES/WORK AREAS-                               * K0400630
                    *   NON EXCEPT STATEMENT STRING AREA, SYMBOL      * K0400640
                    *   TABLE, AND FORTRAN COMMUNICATION AREA         * K0400650
                    *                                                 * K0400660
                    *ATTRIBUTES-N/A                                   * K0400670
                    *                                                 * K0400680
                    *NOTES-                                           * K0400690
                    *   THE SWITCHES USED IN PHASE 4 FOLLOW. IF NON-  * K0400700
                    *   ZERO, THE SWITCH IS TRANSFER=T. IF ZERO, THE  * K0400710
                    *   SWITCH IS NORMAL=N.                           * K0400720
                    *      * NORM2-SYNTAX ERROR IN COMMON STMNT       * K0400730
                    *             T=SYNTAX ERROR PRESENT              * K0400740
                    *      * ASW1-RIGHT PARENTHESIS ENCOUNTERED       * K0400750
                    *             N=NOT ENCOUNTERED                   * K0400760
                    *      * ASW2-REAL STATEMENT ENCOUNTERED          * K0400770
                    *             N=NOT ENCOUNTERED                   * K0400780
                    *      * ASW3-INTEGER STATEMENT ENCOUNTERED       * K0400790
                    *             N=NOT ENCOUNTERED                   * K0400800
                    *      * SW5 -SECOND PASS SWITCH               2-11 K0400810
                    *             T=SECOND PASS MODE               2-11 K0400820
                    *      * SW5A-FIO STATEMENT PRESENT               * K0400830
                    *             N=NOT PRESENT                       * K0400840
                    *************************************************** K0400850
                          ABS                                           K0400860
                    *                                                   K0400870
                    *                        SYSTEM EQUATES             K0400880
                    MEMRY EQU     /8000                                 K0400890
                    OVERL EQU     MEMRY-1501 START OF FCOM              K0400900
                    ROL   EQU     MEMRY-68   LOCN OF RTN TO READ NXT PH K0400910
                    $PHSE EQU     /78        NO. OF PHASE NOW IN CORE   K0400920
                    PHLEN EQU     3         NO. OF SECTORS THIS PHASE   K0400930
                          ORG     OVERL                                 K0400940
                    PHID  EQU     34         ID NUMBER THIS PHASE       K0400950
                    *                                                   K0400960
                    *                  FORTRAN COMMUNICATION AREA       K0400970
                    ORG   BSS     1    ORIGIN ADDRESS               2-4 K0400980
                    SOFS  BSS     1    START OF STRING                  K0400990
                    EOFS  BSS     1    END OF STRING                    K0401000
                    SOFST BSS     1    START OF SYMBOL TABLE            K0401010
                    SOFNS BSS     1    START OF NON-STATEMENT NUMBERS   K0401020
                    SOFXT BSS     1    START OF SUBSCRIPT TEMPORARIES   K0401030
                    SOFGT BSS     1    START OF GENERATED TEMPORARIES   K0401040
                    EOFST BSS     1    END OF SYMBOL TABLE              K0401050
                    COMON BSS     1    NEXT AVAILABLE COMMON            K0401060
                    CSIZE BSS     1    SIZE OF COMMON                   K0401070
                    ERROR BSS     1    OVERLAP ERROR                    K0401080
                    FNAME BSS     1    PROGRAM NAME                     K0401090
                          BSS     1                                     K0401100
                    SORF  BSS     1    SUBROUTINE(-) OR FUNCTION(+)     K0401110
                    CCWD  BSS     1    CONTROL CARD WORD                K0401120
                    *                BIT 15 TRANSFER TRACE              K0401130
                    *                BIT 14 ARITHMETIC TRACE            K0401140
                    *                BIT 13 EXTENDED PRECISION          K0401150
                    *                BIT 12 LIST SYMBOL TABLE           K0401160
                    *                BIT 11 LIST SUBPROGRAM NAMES       K0401170
                    *                BIT 10 LIST SOURCE PROGRAM         K0401180
                    *                BIT  9 ONE WORD INTEGERS           K0401190
                    *                BIT  8 ORIGIN                  2-4 K0401200
                    IOCS  BSS     1    IOCS CONTROL CARD WORD           K0401210
                    *                BIT 15 CARD                        K0401220
                    *                BIT 14 PAPER TAPE                  K0401230
                    *                BIT 13 TYPEWRITER                  K0401240
                    *                BIT 12 1403 PRINTER                K0401250
                    *                BIT 11 2501 READER                 K0401260
                    *                BIT 10 KEYBOARD                    K0401270
                    *                BIT  9 1442 PUNCH                  K0401280
                    *                BIT  8 DISK                        K0401290
                    *                BIT  7 1132 PRINTER                K0401300
                    *                BIT  3 PLOTTER                     K0401310
                    DFCNT BSS     1                                     K0401320
                    *                                                   K0401330
                    *                                                   K0401340
                    *                  END OF FORTRAN COMMUNICATION     K0401350
                    *                  AREA                             K0401360
                    *                                                   K0401370
                    *                                                   K0401380
                    BPHAR EQU     *+2        BEGIN PHASE AREA           K0401390
                          DC      0          LOADER WORK AREA           K0401400
                          DC      -34        -PHASE ID FOR SLET LOOKUP  K0401410
                          DC      NXTPH-*+1  TABLE FOR NEXT PHASE ENTRY K0401420
                          DC      1          ONE ENTRY TO BE SET BY LDR K0401430
                          ORG     *-2                                   K0401440
                    OKJOE BSC  L  PH         BEGIN PROCESSING PHASE     K0401450
                    *                                                   K0401460
                    *                                                   K0401470
                    COMMC DC      /1400      COMMON                     K0401480
                    ENDC  DC      /0800      END                        K0401490
                    IDTPE DC      /7C00      STMNT ID TYPE MASK         K0401500
                    *                                                   K0401510
                    *                  INITIALIZES THE PHASE            K0401520
                    *                  CHECK FOR A PREVIOUS OVERLAP     K0401530
                    *                  ERROR                            K0401540
                    PH    LDX   1 PHID       INITIALIZE INPUT POINTER   K0401550
                          STX  L1 $PHSE      STORE IN SYS PHASE AREA    K0401560
                          LDX  I1 SOFS       INITIALIZE STRING I/P PT   K0401570
                    *                                                   K0401580
                    *                  OVERLAP ERROR ON                 K0401590
                          LD      ERROR      TEST FOR OVERLAP ERROR     K0401600
                          BSC  L  NXTPQ,Z    BRANCH IF ERROR            K0401610
                    *                                                   K0401620
                    *                                                   K0401630
                    *                  CHECKS FOR END AND COMMON STMNTS K0401640
                    *                  UPDATES THE I/P STRING PT (XR1)  K0401650
                    *                  TO MOVE TO THE NEXT STMNT        K0401660
                    TST   LD    1 0          LOAD STMNT ID WORD         K0401670
                          SRA     1                                     K0401680
                          AND     IDTPE      GET ID TYPE                K0401690
                          S       ENDC       IS IT END                  K0401700
                          BSC  L  NXTPQ,+-   BRANCH IF YES              K0401710
                    *                                                   K0401720
                    *                                                   K0401730
                          S       COMMC      IS IT COMMON               K0401740
                          BSC     +-         SKIP IF NOT                K0401750
                          MDX     FIX        CHECK FOR TYPE OF COMMON   K0401760
                    *                                                   K0401770
                    *                  MOVE TO NEXT STMNT               K0401780
                    MV    LD    1            LOAD STMNT ID WORD         K0401790
                          SRA     2          SHIFT NORM TO RIGHT        K0401800
                          AND     IDNRM      ISOLATE NORM               K0401810
                          STO     NXID+1                                K0401820
                    NXID  MDX  L1            MOVE POINTER TO NEXT STMNT K0401830
                          MDX     TST        GO TEST STMNT TYPE         K0401840
                    *                                                   K0401850
                    *                        UNUSED CODE REMOVED    2-9 K0401860
                    *                                                   K0401870
                    *                  INITIALIZE TO SCAN COMMON STMNTS K0401880
                    FIX   STX   1 IDADR      SAVE INPUT POINTER    2-11 K0401890
                          MDX   1 1          MOVE POINTER               K0401900
                          SLA     16                                    K0401910
                          STO     NORM2      CLEAR NORM2                K0401920
                          MDX     DD2        BRANCH TO SCAN COM ST  2-9 K0401930
                    *                                                   K0401940
                    *                                                   K0401950
                    *                  CHECKS FOR STMNT TERMINATOR      K0401960
                    PTB   LD    1 0          IS CHARACTER               K0401970
                          S       SEMIC      SEMICOLON                  K0401980
                          BSC  L  REMOV,+-   BRANCH IF YES         2-11 K0401990
                    *                                                   K0402000
                    *                                                   K0402010
                          LD      NORM2      IS THERE SYNTAX ERROR IN   K0402020
                          BSC  L  SETUP,E    COMMON STMNT - BRANCH YES  K0402030
                    *                                                   K0402040
                    *                        UNUSED CODE REMOVED    2-9 K0402050
                    *                                                   K0402060
                    *                  CHECKS THE NAME FOR VADIDTY      K0402070
                    DD2   LD    1 0          LOAD WORD                  K0402080
                          BSC     -          SKIP IF NOT SPECIAL CHAR   K0402090
                          MDX     ERAH       GO TO ERROR 7              K0402100
                          STO     WD1        SAVE WORD                  K0402110
                          SLA     2                                     K0402120
                          BSC  L  ERAH,C+Z   BRANCH IF NUMERIC          K0402130
                          LD    1 1          LOAD 2ND WORD              K0402140
                          BSC  L  MAD,+Z     BRANCH IF PART OF NAME     K0402150
                          LD      ZERO       LOAD ZEROES                K0402160
                          STO     WD2        STORE AS 2ND WORD IN NAME  K0402170
                          MDX     ZORRO      CHECK FOR DUPLICATES       K0402180
                    MAD   STO     WD2        STORE 2ND WORD             K0402190
                          MDX   1 1          MOVE POINTER               K0402200
                          LD    1 1          LOAD NEXT WORD             K0402210
                          BSC  L  ERAH,+Z    BRANCH NOT SPECIAL CHAR    K0402220
                    *                                                   K0402230
                    *                  SCANS THE SYM TBL FOR            K0402240
                    *                  DUPLICATION OF THE VAR NAME      K0402250
                    ZORRO LDX  I3 SOFNS      INITIALIZE SYMBOL TABLE PT K0402260
                          MDX     JACK       START LOOP                 K0402270
                    *                                                   K0402280
                    LOOP  LD    3 1          DOES FIRST WORD IN NAME    K0402290
                          S       WD1        MATCH TABLE WORD           K0402300
                          BSC     Z          SKIP IF YES                K0402310
                    *                                                   K0402320
                          MDX     EAT        GET NEXT TABLE ENTRY       K0402330
                          LD    3 2          DOES SECOND WORD IN NAME   K0402340
                          S       WD2        EQUAL TABLE 2ND WORD       K0402350
                          BSC  L  HELP,+-    BRANCH IF YES              K0402360
                    *                                                   K0402370
                    EAT   MDX   3 -3         GET NEXT TABLE ENTRY       K0402380
                    JACK  STX   3 SAVEQ      SAVE TABLE POINTER         K0402390
                          LD      SAVEQ      HAS ENTIRE TABLE BEEN      K0402400
                          S       EOFST      CHECKED FOR DUPLICATES     K0402410
                          BSC     Z          SKIP IF YES                K0402420
                          MDX     LOOP       CONTINUE LOOP              K0402430
                          MDX     PLACE      PUT IN SYMBOL TABLE        K0402440
                    *                                                   K0402450
                    *                  CONSTANTS                        K0402460
                    IDNRM DC      /01FF      NORM MASK                  K0402470
                    SEMIC DC      /001E      SEMICOLON                  K0402480
                    NORM2 DC      0          SWITCH TWO                 K0402490
                    SW2   DC      1          SWITCH 2                   K0402500
                    IDADR DC      0         STMNT ID ADRS          2-11 K0402510
                    SW5   DC      0         SECOND PASS MODE SW    2-11 K0402520
                    WD1   DC      0          WORD 1 OF COMMON NAME      K0402530
                    WD2   DC      0          WORD 2 OF COMMON NAME      K0402540
                    SAVEQ DC      0          SYMBOL TABLE POINTER       K0402550
                    ERRNO DC      0          ERROR NUMBER               K0402560
                    ERR10 DC      10         ERROR NO. 10               K0402570
                    ERR11 DC      11         ERROR NO. 11               K0402580
                    ERR7  DC      7          ERROR NO. 7                K0402590
                    ERR8  DC      8          ERROR NO. 8                K0402600
                    ERRID DC      /A008      ERROR STMNT ID WORD        K0402610
                    ZERO  DC      /8000      USEFUL CONSTANT            K0402620
                    *                        UNUSED WORDS REMOVED   2-9 K0402630
                    *                                                   K0402640
                    *                   SETUP  ERRORS                   K0402650
                    HELP  LD      ERR11      SET ERROR NO. 11           K0402660
                          STO     ERRNO      GO TO CLOSE                K0402670
                          MDX     EROR      UP STRING              2-11 K0402680
                    SETUP LD      ERR10      SET ERROR NO. 10           K0402690
                          STO     ERRNO      GO TO CLOSE                K0402700
                          MDX     EROR      UP STRING              2-11 K0402710
                    GEEP  LD      ERR8       SET ERROR NO. 8            K0402720
                          STO     ERRNO      GO TO CLOSE                K0402730
                          MDX     EROR      UP STRING              2-11 K0402740
                    ERAH  LD      ERR7       SET ERROR NO. 7            K0402750
                          STO     ERRNO                                 K0402760
                          MDX     EROR      CLOSE UP STRING        2-11 K0402770
                    *                                                   K0402780
                    REMOV SLA     16         CLEAR ACCM - SET TO   2-11 K0402790
                          STO     ERRNO     DUMMY ERROR NUMBR      2-11 K0402800
                    *                                                   K0402810
                    *     REPLACE STMNT WITH ERROR ID/OR DUMMY     2-11 K0402820
                    *     ERROR ID(ERROR NO. = ZERO) AND           2-11 K0402830
                    *     CLOSE THE STRING                         2-11 K0402840
                    *                                                   K0402850
                    EROR  LDX  I1 IDADR     RESET STMNT ID POINTER 2-11 K0402860
                          LD    1 0          LOAD STMNT ID WORD         K0402870
                          SRA     2          RIGHT-JUSTIFY NORM         K0402880
                          AND     IDNRM      CLEAR ALL BUT NORM         K0402890
                    *                                                   K0402900
                          STO     NRMSV      ADD NORM TO STRING POINTER K0402910
                          A       IDADR      TO GET ADDRESS OF NEXT2-11 K0402920
                          STO     *+1        STATEMENT             2-11 K0402930
                          LDX  L2 *-*        INITIALIZE LOOP PTR   2-11 K0402940
                    *                                                   K0402950
                          LD      ERRID      LOAD ERROR STMNT ID WORD   K0402960
                          STO   1 0          PUT ON STRING              K0402970
                          LD      ERRNO      LOAD ERROR NUMBER          K0402980
                          STO   1 1          PUT ON STRING              K0402990
                          MDX   1 +2         MOVE POINTER          2-11 K0403000
                    *                                                   K0403010
                          LD   L  EOFS       COMPUTE RANGE OF LOOP      K0403020
                          S       IDADR      SUBTRACT POINTER THEN 2-11 K0403030
                          S       NRMSV      SUBTRACT NORM TO GET       K0403040
                          STO     *+1        RANGE OF LOOP         2-11 K0403050
                          LDX  L3 *-*        INITL RANGE COUNTER   2-11 K0403060
                    *                                                   K0403070
                          STX   1 SAVX1+1    SAVE STRING POINTER   2-11 K0403080
                          MDX   3 1                                     K0403090
                    LOOP1 LD    2 0          MOVE WORD DOWN             K0403100
                          STO   1 0          IN STRING             2-11 K0403110
                          MDX   1 1          MOVE POINTERS              K0403120
                          MDX   2 1                                     K0403130
                          MDX   3 -1         DECREMENT RANGE COUNTER    K0403140
                          MDX     LOOP1      CONTINUE LOOP              K0403150
                    *                                                   K0403160
                          STX  L1 EOFS       NEW END OF STRING          K0403170
                    SAVX1 LDX  L1 *-*        RESTORE INPUT POINTER 2-11 K0403180
                    *                                                   K0403190
                          LD      SW5       CHECK PASS MODE        2-11 K0403200
                          BSC  L  SOS,Z     BRCH IF SECOND         2-11 K0403210
                          BSC  L  TST       BRCH IF FIRST          2-11 K0403220
                    *                                                   K0403230
                    *                  PLACES A VARIABLE NAME IN THE    K0403240
                    *                  SYM TBL - SETS THE COMMON AND    K0403250
                    *                  TYPE INDICATORS IN THE SYM TBL   K0403260
                    *                  ID WORD - CHECKS FOR A SYM TBL   K0403270
                    *                  OVERLAP                          K0403280
                    PLACE LD      WD2        PUT 2ND WORD INTO          K0403290
                          STO   3 2          SYMBOL TABLE               K0403300
                          LD      WD1        PUT 1ST WORD INTO          K0403310
                          STO   3 1          SYMBOL TABLE               K0403320
                    *                                                   K0403330
                    *                  SET TYPE AND COMMON INDICATORS   K0403340
                          LD      WD1        GET FIRST LETTER           K0403350
                          AND     PIT1       OF NAME                    K0403360
                          S       RGTI       IS IT I OR GREATER         K0403370
                          BSC     +Z         SKIP IF YES                K0403380
                          MDX     REEL       GO SET REAL ID WORD        K0403390
                          S       RGTN       IS IT N OR LESS            K0403400
                          BSC  L  REEL,Z-    BRANCH IF NOT              K0403410
                          LD      IDCI       LOAD INTEGER INDICATOR     K0403420
                          MDX     VIP        GO PUT IN SYMBOL TABLE ID  K0403430
                    REEL  LD      IDCR       LOAD REAL SYM TBL ID       K0403440
                    VIP   STO   3 0          PUT IN SYMBOL TABLE    2-9 K0403450
                          MDX  L  EOFST,-3   MODIFY SYMBOL              K0403460
                          MDX  L  SOFXT,-3   TABLE ADDRESSES            K0403470
                          MDX  L  SOFGT,-3                              K0403480
                    *                                                   K0403490
                    *                  SYMBOL TABLE OVERLAP             K0403500
                          LD   L  EOFST      LOAD END OF SYMBOL TABLE   K0403510
                          A       CONST      ADD TWO                    K0403520
                          S    L  EOFS       SUBTRACT END OF STRING     K0403530
                          BSC  L  JIMY,+Z    BRANCH IF NEGATIVE-OVERLAP K0403540
                    *                                                   K0403550
                    *                                                   K0403560
                          MDX   1 1          MOVE POINTER               K0403570
                    *                                                   K0403580
                    *                                                   K0403590
                          LD    1 0          LOAD NEXT WORD             K0403600
                          S       PARNL      IS CHAR LEFT PARENTHESIS   K0403610
                          BSC  L  PRTE,+-    BRANCH IF YES              K0403620
                    *                                                   K0403630
                    *                  CHECKS FOR A COMMA OPTR          K0403640
                    DD3   LD    1 0          LOAD WORD                  K0403650
                          S       COMAC      IS CHARACTER COMMA         K0403660
                          BSC     +-         SKIP IF NO                 K0403670
                          MDX     DD1        GO GET NEXT WORD           K0403680
                    *                                                   K0403690
                    *                        UNUSED CODE REMOVED    2-9 K0403700
                    *                                                   K0403710
                    *                                                   K0403720
                          LD      SW2        SET SYNTAX ERROR IN        K0403730
                          STO     NORM2      COMMON STMNT SWITCH        K0403740
                          LDX  L  PTB        GO CHECK CHARACTER         K0403750
                    *                                                   K0403760
                    *                                                   K0403770
                    *                  UPDATES THE I/P STRING PT (XR1)  K0403780
                    *                  TO MOVE TO THE NEXT STRING WORD  K0403790
                    DD1   MDX   1 1          MOVE POINTER               K0403800
                          LDX  L  DD2        GET NEXT WORD              K0403810
                    *                                                   K0403820
                    *                  CONSTANTS                        K0403830
                    NRMSV DC      0          NORM                       K0403840
                    CONST DC      2          TWO                        K0403850
                    PIT   DC      /6000      NUMERIC ZONE BIT MASK      K0403860
                    PIT1  DC      /7E00      ONE CHAR EBC MASK          K0403870
                    RGTI  DC      /1200      I                          K0403880
                    RGTN  DC      /1800      N                          K0403890
                    IDCI  DC      /6020      INTEGER SYMBOL TABLE ID    K0403900
                    IDCR  DC      /2020      REAL SYMBOL TABLE ID       K0403910
                    PARNL DC      /000D      LEFT PARENTHESIS           K0403920
                    COMAC DC      /002B      COMMA                      K0403930
                          BSS  E  0                                     K0403940
                    TEM   DC      0          EBC NUMBER TO              K0403950
                          DC      0          BE CONVERTED               K0403960
                    COT1  DC      /7E00      EBC NUMERIC MASK           K0403970
                    COT2  DC      /7800      EBC NUMERIC BITS MASK      K0403980
                    HELP1 DC      0          TEMPORARY STORAGE          K0403990
                    NINT  DC      /4800      NINE                       K0404000
                    SUMM  DC      0          TEMPORARY TOTAL            K0404010
                    CNT   DC      0          DIMENSION COUNTER          K0404020
                    PARNR DC      /001D      RIGHT PARENTHESIS          K0404030
                    *                                                   K0404040
                    *                                                   K0404050
                    *                  CONVERTS THE DIMENSION CONSTANT  K0404060
                    *                  TO BINARY                        K0404070
                    PRTE  SLA     16                                    K0404080
                          STO     CNT        CLEAR COUNTER              K0404090
                    *                                                   K0404100
                    *                                                   K0404110
                          MDX   1 1          MOVE POINTER               K0404120
                    *                                                   K0404130
                    *                                                   K0404140
                          LD    1 0          LOAD WORD                  K0404150
                          AND     PIT        IS IT NUMERIC              K0404160
                          EOR     PIT                                   K0404170
                          BSC  L  GEEP,Z     BRANCH IF NOT              K0404180
                    *                                                   K0404190
                    *                  CHANGE CONSTANT TO BINARY NO.    K0404200
                          LDS     0          CLEAR STATUS INDICATORS    K0404210
                          SLT     32         CLEAR ACC AND EXTENSION    K0404220
                          STO     SUMM       ZERO TOTAL                 K0404230
                    *                                                   K0404240
                          LD    1            LOAD FIRST WORD            K0404250
                          STD     TEM        STORE IN WORK AREA         K0404260
                          LD    1 1          LOAD 2ND WORD              K0404270
                          BSC  L  AOT,-      BRANCH ON OPERATOR         K0404280
                          SLA     1          GET RID OF INDICATOR BIT   K0404290
                          STO     TEM+1      STORE 2ND WORD             K0404300
                          LD    1 2          LOAD 3RD WORD              K0404310
                          MDX   1 1          MOVE POINTER               K0404320
                          BSC  L  GEEP,+     BRANCH ON NO OPERATOR      K0404330
                    AOT   LD      TEM        LOAD FIRST WORD            K0404340
                    AOT1  AND     COT1       GET FIRST CHAR FROM WORD   K0404350
                          SLA     2          SHIFT TO TEST IF NUMERIC   K0404360
                    *                                                   K0404370
                          BSC  L  PILL,C     BRANCH CARRY ON            K0404380
                          BSC  L  NEX,+-     BRANCH END OF CONVERSION   K0404390
                          LDX  L  GEEP       BRANCH ERROR               K0404400
                    PILL  BSC  L  GEEP,-     BRANCH NOT NUMERIC         K0404410
                          AND     COT2       GET NUMBER BITS            K0404420
                          S       NINT       IS NO. GREATER THAN NINE   K0404430
                          BSC  L  GEEP,-Z    BRANCH IF YES              K0404440
                          A       NINT       RESTORE ORIGINAL VALUE     K0404450
                    *                                                   K0404460
                          SRA     11         RIGHT JUSTIFY NUMBER       K0404470
                          STO     HELP1      SAVE NUMBER                K0404480
                          LD      SUMM       LOAD PREVIOUS TOTAL        K0404490
                          SLA     1          MULTIPLY BY TWO            K0404500
                          STO     TEMPT      SAVE                       K0404510
                          BSC  L  GEEP,+Z    BRANCH IF OVERFLOW         K0404520
                          SLA     2          MULTIPLY TOTAL BY 8        K0404530
                          BSC  L  GEEP,C+Z   BRANCH IF ERROR IN NUMBER  K0404540
                          A       TEMPT      GET PREVIOUS TOTAL X 10    K0404550
                          A       HELP1      ADD UNITS VALUE            K0404560
                          BSC  L  GEEP,O     BRANCH IF OVERFLOW         K0404570
                          STO     SUMM       STORE NEW TOTAL            K0404580
                    *                                                   K0404590
                          LDD     TEM        SHIFT NUMBER TO            K0404600
                          SLT     6          GET EBC NUMBER             K0404610
                          STD     TEM        IN POSITION                K0404620
                          MDX     AOT1       GO PROCESS NUMBER          K0404630
                    *                                                   K0404640
                    *                   CONSTANTS                       K0404650
                    TEMPT DC      0          TEMPORARY STORAGE          K0404660
                    THRE  DC      3          THREE                      K0404670
                    *                                                   K0404680
                    *                  PLACES A DIMENSION CONSTANT INTO K0404690
                    *                  THE SYMBOL TABLE                 K0404700
                    NEX   MDX  L  CNT,1      INCREMENT DIMENSION COUNT  K0404710
                    *                                                   K0404720
                    *                                                   K0404730
                          LD      SUMM       LOAD DIMENSION VALUE       K0404740
                          BSC  L  GEEP,+-    BRANCH IF ZERO             K0404750
                    *                                                   K0404760
                    *                   PUT CONSTANT IN SYMBOL TABLE    K0404770
                          LD      CNT        LOAD DIMENSION COUNT       K0404780
                          S    L  SW2        WAS COUNT ONE              K0404790
                          BSC     Z          SKIP IF YES                K0404800
                          MDX     O2         CHECK FOR COUNT OF TWO     K0404810
                          LD      SUMM       LOAD DIMENSION VALUE       K0404820
                          STO   3 -1         PUT IN ALL                 K0404830
                          STO   3 -2         THREE DIMENSION            K0404840
                          STO   3 -3         WORDS                      K0404850
                          MDX     NEXP       GO GET NEXT NUMBER         K0404860
                    *                                                   K0404870
                    O2    S    L  SW2        WAS COUNT TWO              K0404880
                          BSC     Z          SKIP IF YES                K0404890
                          MDX     O3         CHECK FOR COUNT OF THREE   K0404900
                          LD    3 -1         GET VALUE FOR 2ND AND 3RD  K0404910
                          M       SUMM       DIMENSION BY MULTIPLYING   K0404920
                          SLT     1         BRANCH TO SET ERROR 8   2-7 K0404930
                          BSC  L  GEEP,Z    *IF TOO GREAT           2-7 K0404940
                          SLT     15        SHIFT INTO ACCUMULATOR  2-7 K0404950
                          STO   3 -2         VALUE                      K0404960
                          STO   3 -3         STORE IN TABLE             K0404970
                          MDX     NEXP       GO GET NEXT NUMBER         K0404980
                    *                                                   K0404990
                    O3    LD    3 -3         GET VALUE FOR 3RD DIM      K0405000
                          M       SUMM       BY MULTIPLYING 2ND VALUE   K0405010
                          SLT     1         BRANCH TO SET ERROR 8   2-7 K0405020
                          BSC  L  GEEP,Z    *IF TOO GREAT           2-7 K0405030
                          SLT     15        SHIFT INTO ACCUMULATOR  2-7 K0405040
                          STO   3 -3         STORE IN TABLE             K0405050
                    *                                                   K0405060
                    *                                                   K0405070
                    *                  CHECKS FOR A COMMA, A RIGHT      K0405080
                    *                  PARENTHESIS, AND AN OVERLAP      K0405090
                    *                  ERROR - INDICATES THE            K0405100
                    *                  DIMENSIONING LEVEL IN THE SYM    K0405110
                    *                  TBL ID WORD                      K0405120
                    NEXP  MDX   1 1          MOVE STRING POINTER        K0405130
                    *                                                   K0405140
                    *                                                   K0405150
                          LD    1 0          LOAD WORD                  K0405160
                          S       COMAC      IS CHARACTER COMMA         K0405170
                          BSC  L  TCNT,+-    BRANCH IF YES              K0405180
                    *                                                   K0405190
                    *                                                   K0405200
                          A       COMAC      RESTORE ORIGINAL VALUE     K0405210
                          S       PARNR      IS IT RIGHT PARENTHESIS    K0405220
                          BSC  L  GEEP,Z     BRANCH IF NOT              K0405230
                    *                                                   K0405240
                    *                   PUT DIMENSION COUNT IN SYM TBL  K0405250
                          LD      CNT        LOAD DIMENSION COUNT       K0405260
                          SLA     11         POSITION FOR SYMBOL TABLE  K0405270
                          OR    3 0          COMBINE WITH ID WORD       K0405280
                          STO   3 0          NEW SYMBOL TABLE ID WORD   K0405290
                          MDX  L  EOFST,-3   MODIFY SYMBOL              K0405300
                          MDX  L  SOFXT,-3   TABLE ADDRESSES            K0405310
                          MDX  L  SOFGT,-3                              K0405320
                    *                                                   K0405330
                    *                                                   K0405340
                          LD   L  EOFST      TEST FOR TABLE OVERLAP     K0405350
                          A       TWO        ADD TWO                    K0405360
                          S    L  EOFS       SUBTRACT END OF STRING     K0405370
                          BSC  L  JIMY,+Z    BRANCH IF OVERLAP          K0405380
                    *                                                   K0405390
                    *                                                   K0405400
                          MDX   1 1          MOVE POINTER               K0405410
                          LDX  L  DD3        GO CHECK NEXT WORD         K0405420
                    *                                                   K0405430
                    *                   CONSTANT                        K0405440
                    TWO   DC      2          TWO                        K0405450
                    *                                                   K0405460
                    *                                                   K0405470
                    JIMY  MDX  L  ERROR,1    SET OVERLAP ERROR          K0405480
                    *                                                   K0405490
                    *                                                   K0405500
                    NXTPQ MDX     START      GO TO NEXT PART OF PHASE   K0405510
                    *                                                   K0405520
                    *                                                   K0405530
                    *             CHECKS THAT DIMENTIONING              K0405540
                    *             DOES NOT EXCEED THREE LEVELS          K0405550
                    TCNT  LD   L  CNT        LOAD DIMENSION COUNT       K0405560
                          S       THRE       IS IT THREE OR GREATER     K0405570
                          BSC  L  PRTE+2,+Z  BRANCH IF NOT              K0405580
                          LDX  L  GEEP       ERROR - BRANCH             K0405590
                          HDNG    SUBROUTINE OR FUNCTION                K0405600
                    *                        UNUSED CODE REMOVED    2-9 K0405610
                    *                                                   K0405620
                    START LD   L  ERROR      IS THERE OVERLAP ERROR     K0405630
                          BSC  L  SOS,Z      BRANCH IF YES              K0405640
                    *                                                   K0405650
                    *                   INITIALIZE PHASE                K0405660
                          LDX  I1 SOFS       INITIALIZE STRING POINTER  K0405670
                          STX  L  SW5       SET SW5 ON             2-11 K0405680
                    *                                                   K0405690
                    *                                                   K0405700
                    STARF LD    1 0          LD STMNT ID                K0405710
                          SRA     11                                    K0405720
                          S       FIOC       TEST IF FIO CALL           K0405730
                          BSC  L  STAR1,Z    BRANCH IF NOT              K0405740
                    *                                                   K0405750
                          STX     SW5A       SET FIO STMNT PRESENT SW   K0405760
                    *                                                   K0405770
                          LD    1 0          GET STMNT NORM             K0405780
                          SRA     2                                     K0405790
                          AND     IDNVQ                                 K0405800
                          STO     *+1                                   K0405810
                          MDX  L1 *-*        MOVE TO NEXT STMNT         K0405820
                    *                                                   K0405830
                          MDX     STARF      CHECK NEXT STMNT           K0405840
                    *                                                   K0405850
                    *                                                   K0405860
                    *                  CHECKS THE FORTRAN COMMUNICATION K0405870
                    *                  AREA (SORF) FOR A SUBP INDN -    K0405880
                    *                  IF NONE, CHECKS THE FIRST STMNT  K0405890
                    *                  TO SEE IF IT IS REAL OR INTEGER  K0405900
                    STAR1 LD   L  SORF       HAVE SUBROUTINE OR FUNC    K0405910
                          BSC  L  DO3,Z      BRANCH IF YES              K0405920
                    *                                                   K0405930
                    *                                                   K0405940
                          LD    1 0          LOAD STMNT ID WORD         K0405950
                          SRA     1                                     K0405960
                          AND     IDTPQ      GET STMNT ID TYPE          K0405970
                          S       REALC      IS STMNT REAL              K0405980
                          BSC  L  TRY,+-     BRANCH IF YES              K0405990
                          S       INTC       IS STMNT INTEGER           K0406000
                          BSC  L  SOS,Z      BRANCH IF NOT              K0406010
                    *                                                   K0406020
                    *                                                   K0406030
                          STX  L0 ASW3       SET INTEGER STMNT SW       K0406040
                          MDX     TRY+2      CHECK FOR FUNCTION         K0406050
                    *                                                   K0406060
                    *                                                   K0406070
                    *                  CHECKS FOR THE WORD 'FUNCTION'   K0406080
                    *                  IN A REAL OR INTEGER STMNT -     K0406090
                    *                  IF FOUND, INDICATES A FUNCTION   K0406100
                    *                  IN THE FORTRAN COMMUNICATION     K0406110
                    *                  AREA (SORF)                      K0406120
                    TRY   STX  L0 ASW2       SET REAL STMNT SW          K0406130
                    *                                                   K0406140
                    *                   ARE NEXT FOUR WORDS 'FUNCTION'  K0406150
                          LD    1 1          LOAD WORD                  K0406160
                          S       FUNC1      ARE CHARACTERS 'FU'        K0406170
                          BSC  L  SOS,Z      BRANCH IF NOT              K0406180
                          LD    1 2          LOAD 2ND WORD              K0406190
                          S       FUNC2      ARE CHARACTERS 'NC'        K0406200
                          BSC  L  SOS,Z      BRANCH IF NOT              K0406210
                          LD    1 3          LOAD 3RD WORD              K0406220
                          S       FUNC3      ARE CHARACTERS 'IO'        K0406230
                          BSC  L  SOS,Z      BRANCH IF NOT              K0406240
                          LD    1 4          LOAD 4TH WORD              K0406250
                          S       FUNC4      IS CHARACTER 'N'           K0406260
                          BSC  L  SOS,Z      BRANCH IF NOT              K0406270
                          STX  L1 IDADR     SAVE STMNT ID POINTER  2-11 K0406280
                          MDX   1 5          MOVE POINTER               K0406290
                    *                                                   K0406300
                    *                  INDICATE FUNCTION IN             K0406310
                    *                  COMMUNICATION AREA               K0406320
                          MDX  L  SORF,1     SET FUNCTION IN SORF       K0406330
                          MDX     DO2+2     CHECK FOR LEGAL NAME   2-12 K0406340
                    *                                                   K0406350
                    *                                                   K0406360
                    *                  CHECKS FOR A SUBP OR FUNC STMNT  K0406370
                    DO3   LD    1 0          LOAD STMNT ID WORD         K0406380
                          SRA     11         GET STMNT ID TYPE          K0406390
                          S       SF1        IS IT FUNCTION             K0406400
                          BSC  L  DO2,+-     BRANCH IF YES              K0406410
                          S       SF2        IS IT SUBROUTINE           K0406420
                          BSC  L  SOS,Z      BRANCH IF NO               K0406430
                    *                                                   K0406440
                    *                  CHECKS FOR A VALID SUBP NAME     K0406450
                    DO2   STX  L1 IDADR     SAVE STMNT ID POINTER  2-11 K0406460
                          MDX   1 1          MOVE POINTER               K0406470
                          LD    1 0          LOAD WORD                  K0406480
                          BSC     -          SKIP IF NUMBER OR LETTER   K0406490
                          MDX     ER7        ERROR                      K0406500
                          STO     WRD1       SAVE WORD                  K0406510
                          LD    1 1          LOAD 2ND WORD              K0406520
                          BSC  L  MADS,+Z    BRANCH IF NAME TWO WORDS   K0406530
                          LD      ZO         SET ZEROS FOR              K0406540
                          STO     WRD2       SECOND WORD OF NAME        K0406550
                          MDX     ZOR        PUT NAME IN SYMBOL TABLE   K0406560
                    MADS  STO     WRD2       STORE 2ND WORD             K0406570
                          MDX   1 1          MOVE POINTER               K0406580
                          LD    1 1          LOAD NEXT WORD             K0406590
                          BSC  L  ER7,+Z     ERROR IF NOT SPECIAL OPER  K0406600
                    *                                                   K0406610
                    *                  SCANS THE SYM TBL FOR            K0406620
                    *                  DUPLICATION OF THE SUBP NAME     K0406630
                    ZOR   LDX  I3 SOFNS      INITIALIZE SYMBOL TABLE PT K0406640
                          MDX     HACK       START CHECK                K0406650
                    LOP   LD    3 1          DOES FIRST WORD OF SYMBOL  K0406660
                          S       WRD1       TABLE MATCH 1ST PART       K0406670
                          BSC     Z          SKIP IF YES                K0406680
                          MDX     EATQ       GET NEXT TABLE ENTRY       K0406690
                          LD    3 2          DOES 2ND WORD OF SYMBOL    K0406700
                          S       WRD2       TABLE MATCH 2ND PART       K0406710
                          BSC  L  CHK,+-     BRANCH IF YES              K0406720
                    EATQ  MDX   3 -3         GO TO NEXT TABLE ENTRY     K0406730
                    HACK  STX   3 SAVE       STORE POINTER              K0406740
                          LD      SAVE       HAS ENTIRE SYMBOL TABLE    K0406750
                          S    L  EOFST      BEEN CHECKED FOR DUPLICATE K0406760
                          BSC     Z          SKIP IF YES                K0406770
                          MDX     LOP        CONTINUE LOOP              K0406780
                          MDX     PLACQ      PLACE NAME IN TABLE        K0406790
                    *                                                   K0406800
                    *                   CONSTANTS                       K0406810
                    SF1   DC      /0D        FUNCTION                   K0406820
                    SF2   DC      /04-/0D    SUBROUTINE                 K0406830
                    SW5A  DC      0          SWITCH 5A                  K0406840
                    FIOC  DC      /1B        FIO                        K0406850
                    REALC DC      /2400      REAL                       K0406860
                    INTC  DC      /0400      INTEGER                    K0406870
                    FUNC1 DC      /8D22      FU                         K0406880
                    FUNC2 DC      /D0E3      NC                         K0406890
                    FUNC3 DC      /92B2      TI                         K0406900
                    FUNC4 DC      /D000      ON                         K0406910
                    WRD1  DC      *-*        TEMPORARY STORAGE FOR      K0406920
                    WRD2  DC      *-*        SYMBOL TABLE ENTRY         K0406930
                    IDNVQ DC      /01FF      NORM MASK                  K0406940
                    IDTPQ DC      /7C00      STMNT ID TYPE MASK         K0406950
                    SAVE  DC      0          TEMPORARY STORAGE          K0406960
                    ER7R  DC      7          ERROR NO. 7                K0406970
                    ERR12 DC      12         ERROR NO. 12               K0406980
                    ERR13 DC      13         ERROR NO. 13               K0406990
                    ERR14 DC      14         ERROR NO. 14               K0407000
                    ZO    DC      /8000      SECOND WORD OF 1 WORD NAME K0407010
                    *                                                   K0407020
                    *                  CHECKS THAT A PARAMETER NAME     K0407030
                    *                  HAS NOT BEEN ENTERED INTO COMMON K0407040
                    CHK   LD    3 0          LOAD SYMBOL TABLE ID WORD  K0407050
                          SLA     2          IS IT IN COMMON            K0407060
                          BSC     +Z         BRANCH IF NOT              K0407070
                          MDX     ER13       GO SET UP ERROR 13         K0407080
                    *                                                   K0407090
                    *                   SET UP ERRORS                   K0407100
                    ER14  LD      ERR14      SET UP                     K0407110
                          STO  L  ERRNO      ERROR NO. 14          2-11 K0407120
                          MDX     CLOSE      CLOSE UP STRING            K0407130
                    ER7   LD      ER7R       SET UP                     K0407140
                          STO  L  ERRNO      ERROR NO. 7           2-11 K0407150
                          MDX     CLOSE      CLOSE UP STRING            K0407160
                    ER12  LD      ERR12      SET UP                     K0407170
                          STO  L  ERRNO      ERROR NO. 12          2-11 K0407180
                          MDX     CLOSE      CLOSE UP STRING            K0407190
                    ER13  LD      ERR13      SET UP                     K0407200
                          STO  L  ERRNO      ERROR NO. 13          2-11 K0407210
                    *                                                   K0407220
                    CLOSE BSC  L  EROR      BRCH TO INSERT ERROR   2-11 K0407230
                    *                                                   K0407240
                    *                  BRANCHES TO THE ROL ROUTINE TO   K0407250
                    *                  LOAD THE NEXT PHASE              K0407260
                    *                                                   K0407270
                    SOS   LDX  I1 NXTPH+1    LOAD PARAM FOR READING     K0407280
                          LDD     NXTPH+2    NEXT PHASE                 K0407290
                          BSC  L  ROL        GO TO READ NEXT PHASE      K0407300
                          BSS  E  0                                     K0407310
                    NXTPH DC      35         ID OF NEXT PHASE           K0407320
                          BSS     3          LOADER TABLE FOR NEXT PHS  K0407330
                    *                                                   K0407340
                    *                  CONSTANTS                        K0407350
                    H7E00 DC      /7E00      STMNT ID TYPE MASK         K0407360
                    H1200 DC      /1200      I                          K0407370
                    H1800 DC      /1800      N                          K0407380
                    H4080 DC      /4080      INTEGER SUBPROGRAM         K0407390
                    H0080 DC      /0080      REAL SUBPROGRAM            K0407400
                    SEMI  DC      /001E      SEMICOLON                  K0407410
                    RPAR  DC      /1D-/2B    RIGHT PARENTHESIS          K0407420
                    LPAR  DC      /0D        LEFT PARENTHESIS           K0407430
                    TWOS  DC      2          TWO                        K0407440
                    ASW2  DC      *-*        SWITCH 2A                  K0407450
                    ASW3  DC      *-*        SWITCH 3A                  K0407460
                    THREE DC      3          THREE                      K0407470
                    SIGN1 DC      /8001      SIGN                       K0407480
                    *                                                   K0407490
                    *                  PLACES THE SUBP NAME INTO THE    K0407500
                    *                  SYM TBL - PLACES THE ADDR OF THE K0407510
                    *                  SYM TBL ENTRY INTO THE FORTRAN   K0407520
                    *                  COMMUNICATIONS AREA (FNAME)      K0407530
                    PLACQ LD      WRD2       LOAD SECOND WORD           K0407540
                          STO   3 2          PUT IN SYMBOL TABLE        K0407550
                          LD      WRD1       LOAD FIRST WORD            K0407560
                          STO   3 1          PUT IN SYMBOL TABLE        K0407570
                    *                                                   K0407580
                    *                  PUT SYMBOL TABLE ADDRESS IN      K0407590
                    *                  COMMUNICATION AREA               K0407600
                          LD   L  SOFST      FIND LOCATION OF PRESENT   K0407610
                          S       SAVE       ENTRY RELATIVE TO START    K0407620
                          SRT     16         OF SYMBOL TABLE            K0407630
                          D       THREE      GET ENTRY POSITION         K0407640
                          A       SIGN1      GIVE SIGN                  K0407650
                          STO  L  FNAME      SAVE                       K0407660
                    *                                                   K0407670
                    *                                                   K0407680
                          LD      ASW2       IS IT REAL                 K0407690
                          BSC  L  IGER,+-    BRANCH IF NOT              K0407700
                    *                                                   K0407710
                    *                                                   K0407720
                          SLA     16                                    K0407730
                          STO     ASW2       CLEAR REAL STMNT SW        K0407740
                          MDX     REELQ      GO SET REAL SUBPROGRAM BIT K0407750
                    *                                                   K0407760
                    *                                                   K0407770
                    IGER  LD      ASW3       ID IT INTEGER              K0407780
                          BSC  L  PLAC1,+-   BRANCH IF NOT              K0407790
                    *                                                   K0407800
                    *                                                   K0407810
                          SLA     16                                    K0407820
                          STO     ASW3       CLEAR INTEGER STMNT SW     K0407830
                          MDX     PLAC1+8    GO SET INTEGER SUBPRG BITS K0407840
                    *                                                   K0407850
                    *                  SET THE SUBP AND TYPE INDRS IN   K0407860
                    *                  THE SYM TBL ID WORD OF A SUBP    K0407870
                    *                  SUBP NAME FOUND IN A SUBP, FUNC, K0407880
                    *                  REAL FUNCTION, OR INTEGER FUNC   K0407890
                    *                  STMNT - CHECKS FOR A SYM TBL     K0407900
                    *                  OVERLAP                          K0407910
                    PLAC1 LD      WRD1       LOAD FIRST WORD            K0407920
                          AND     H7E00      CLEAR ALL BUT FIRST WORD   K0407930
                          S       H1200      IS IT LESS THAN I          K0407940
                          BSC     +Z         SKIP IF YES                K0407950
                          MDX     REELQ      GO SET REAL SUBP BITS      K0407960
                          S       H1800      IS IT N OR LESS            K0407970
                          BSC  L  REELQ,Z-   BRANCH IF NOT              K0407980
                          LD      H4080      SET INTEGER SUBPRG BITS    K0407990
                          MDX     VIPQ       SET INTEGER SUBP BITS      K0408000
                    REELQ LD      H0080      SET REAL SUBPROGRAM BITS   K0408010
                    VIPQ  STO   3 0          PUT IN SYMBOL TABLE        K0408020
                          MDX   3 -3         MOVE SYMBOL TABLE POINTER  K0408030
                          STX  L3 EOFST      NEW END OF SYMBOL TABLE    K0408040
                          MDX  L  SOFXT,-3   MOVE SYMBOL                K0408050
                          MDX  L  SOFGT,-3   TABLE ADDRESSES            K0408060
                    *                                                   K0408070
                    *                  SYMBOL TABLE OVERLAP             K0408080
                          LD   L  EOFST      LOAD END OF SYMBOL TABLE   K0408090
                          A       TWOS       ADD TWO                    K0408100
                          S    L  EOFS       SUBTRACT END OF STRING     K0408110
                          BSC  L  JIMMY,+Z   BRANCH IF OVERLAP ERROR    K0408120
                    *                                                   K0408130
                    *                                                   K0408140
                    SLOP  MDX   1 1          MOVE POINTER               K0408150
                    *                                                   K0408160
                    *                                                   K0408170
                    *                  CHECKS FOR A LEFT PARENTHESIS OR K0408180
                    *                  A STMNT TERMINATOR FOLLOWING THE K0408190
                    *                  SUBP NAME                        K0408200
                    DTB   LD    1 0          LOAD WORD                  K0408210
                          S       SEMI       IS CHARACTER SEMI-COLON    K0408220
                          BSC  L  RMV,+-     BRANCH IF YES              K0408230
                    *                                                   K0408240
                    *                                                   K0408250
                          LD      ASW1       RIGHT PARENTHESIS FOUND    K0408260
                          BSC  L  ER12,Z     BRANCH IF YES              K0408270
                    *                                                   K0408280
                    *                                                   K0408290
                          LD    1 0          LOAD WORD                  K0408300
                          S       LPAR       IS CHARACTER LEFT PAREN    K0408310
                          BSC  L  ER12,Z     BRANCH IF NOT              K0408320
                    *                                                   K0408330
                    *                                                   K0408340
                    FLIP  MDX   1 1          MOVE POINTER               K0408350
                    *                                                   K0408360
                    *                  CHECKS FOR A VALID PARAM NAME    K0408370
                    FLOP  LD    1 0          LOAD WORD                  K0408380
                          BSC  L  ER7,-      ERROR IF OPERATOR      2-4 K0408390
                          SLA     2          ERROR IF NOT           2-4 K0408400
                          BSC  L  ER7,C+Z    ALPHABETIC CHARACTER   2-4 K0408410
                          LD    1 0          LOAD WORD AGAIN        2-4 K0408420
                          STO     WDD1       SAVE WORD                  K0408430
                          LD    1 1          LOAD 2ND WORD              K0408440
                          BSC  L  SADS,+Z    BRANCH IF PART OF NAME     K0408450
                          LD   L  ZO         LOAD ZEROS AS 2ND WORD     K0408460
                          STO     WDD2       STORE                      K0408470
                          MDX     ZARRO      GO PUT IN SYMBOL TABLE     K0408480
                    SADS  STO     WDD2       STORE 2ND WORD             K0408490
                          MDX   1 1          MOVE POINTER               K0408500
                          LD    1 1          LOAD NEXT WORD             K0408510
                          BSC  L  ER7,+Z     BRANCH NOT SPECIAL CHAR    K0408520
                    *                                                   K0408530
                    *                  SCANS THE SYM TBL FOR            K0408540
                    *                  DUPLICATION OF A VAR NAME        K0408550
                    ZARRO LDX  I3 SOFNS      LOAD START OF CHECK ADDR   K0408560
                          MDX     CAKE       START LOOP                 K0408570
                    LIPS  LD    3 1          DOES FIRST WORD OF NAME    K0408580
                          S       WDD1       MATCH 1ST WORD OF TABLE    K0408590
                          BSC     Z          SKIP IF YES                K0408600
                          MDX     CLET       GET NEXT SYMBOL TBL ENTRY  K0408610
                          LD    3 2          DOES 2ND WORD MATCH 2ND    K0408620
                          S       WDD2       WORD OF SYMBOL TBL ENTRY   K0408630
                          BSC  L  CHK,+-     BRANCH IF YES              K0408640
                    CLET  MDX   3 -3         MOVE PT TO NEXT TBL ENTRY  K0408650
                    CAKE  STX   3 SIV        SAVE TABLE POINTER         K0408660
                          LD      SIV        LOAD ENTRY ADDRESS         K0408670
                          S    L  EOFST      SUBTRACT END OF TABLE      K0408680
                          BSC     Z          SKIP IF FINISHED CHECK     K0408690
                          MDX     LIPS       CONTINUE LOOP              K0408700
                          MDX     PIECE      PUT NAME IN SYMBOL TABLE   K0408710
                    *                                                   K0408720
                    *                  CONSTANTS                        K0408730
                    WDD1  DC      0          TEMPORARY STORAGE FOR      K0408740
                    WDD2  DC      0          SYMBOL TABLE ENTRY         K0408750
                    SIV   DC      0          TEMPORARY STORAGE          K0408760
                    IDCII DC      /4400      INTEGER FUNCTION           K0408770
                    IDCRR DC      /0400      REAL FUNCTION              K0408780
                    COMA  DC      /2B        COMMA                      K0408790
                    ASW1  DC      0          SWITCH 1A                  K0408800
                    ERR15 DC      15         ERROR NO. 15               K0408810
                    *                                                   K0408820
                    *                  PLACES THE PARAM NAME INTO THE   K0408830
                    *                  SYM TBL - SETS THE PARAM AND     K0408840
                    *                  TYPE INDICATORS IN THE SYM TBL - K0408850
                    *                  CHECKS FOR A SYM TBL OVERLAP     K0408860
                    *                  CHECKS FOR A COMMA OR RIGHT      K0408870
                    *                  PARENTHESIS                      K0408880
                    PIECE LD      WDD2       LOAD 2ND WORD              K0408890
                          STO   3 2          PUT IN SYMBOL TABLE        K0408900
                          LD      WDD1       LOAD 1ST WORD              K0408910
                          STO   3 1          PUT IN SYMBOL TABLE        K0408920
                    *                                                   K0408930
                    *                  INDICATE TYPE AND                K0408940
                    *                  FORMAL PARAMETER                 K0408950
                          LD      WDD1       LOAD FIRST WORD            K0408960
                          AND  L  H7E00      GET FIRST CHARACTER        K0408970
                          S    L  H1200      IS IT LESS THAN I          K0408980
                          BSC     +Z         SKIP IF NO                 K0408990
                          MDX     KEEL       SET REAL INDICATORS        K0409000
                          S    L  H1800      IS IT GREATER THAN N       K0409010
                          BSC  L  KEEL,Z-    BRANCH IF YES              K0409020
                          LD      IDCII      LOAD INTEGER FUNCTION ID   K0409030
                          MDX     HIPS       GO PUT IN SYMBOL TABLE     K0409040
                    KEEL  LD      IDCRR      LOAD REAL FUNCTION ID      K0409050
                    HIPS  STO   3 0          PUT IN SYMBOL TABLE        K0409060
                          MDX   3 -3         MOVE POINTER               K0409070
                          STX  L3 EOFST      NEW END OF SYMBOL TABLE    K0409080
                          MDX  L  SOFXT,-3   MODIFY SYMBOL              K0409090
                          MDX  L  SOFGT,-3   TABLE ADDRESSES            K0409100
                    *                                                   K0409110
                    *                  SYMBOL TABLE OVERLAP             K0409120
                          LD   L  EOFST      LOAD END OF SYMBOL TABLE   K0409130
                          A    L  TWOS       ADD TWO                    K0409140
                          S    L  EOFS       SUBTRACT END OF STRING     K0409150
                          BSC  L  JIMMY,+Z   BRANCH IF OVERLAP          K0409160
                    *                                                   K0409170
                    *                                                   K0409180
                          MDX   1 1          MOVE STRING POINTER        K0409190
                    *                                                   K0409200
                    *                                                   K0409210
                          LD    1 0          LOAD WORD                  K0409220
                          S       COMA       IS CHARACTER COMMA         K0409230
                          BSC  L  FLIP,+-    BRANCH IF YES              K0409240
                    *                                                   K0409250
                    *                                                   K0409260
                          S    L  RPAR       IS CHARACTER RIGHT PAREN   K0409270
                          BSC  L  ER12,Z     BRANCH IF NOT              K0409280
                    *                                                   K0409290
                    *                                                   K0409300
                          STX   0 ASW1       SET RIGHT PARENTHESIS SW   K0409310
                          MDX     SLOP       CHECK REST OF STMNT        K0409320
                    *                                                   K0409330
                    RMV   LD   L  SW5A      IS FIO STMNT PRESENT   2-11 K0409340
                          BSC  L  REMOV,+-  BRCH IF NOT            2-11 K0409350
                          LD      ERR15     IF PRESENT             2-11 K0409360
                          STO  L  ERRNO     SET ERROR TO 15        2-11 K0409370
                          BSC  L  EROR      AND INSERT ON STRING   2-11 K0409380
                    *                                                   K0409390
                    *                                                   K0409400
                    JIMMY MDX  L  ERROR,1    SET OVERLAP ERROR INDR     K0409410
                          LDX  L  SOS        GO TO END OF PHASE         K0409420
                          BSS     BPHAR+PHLEN*320-1-*  PATCH AREA       K0409430
                          DC      0                                     K0409440
                          END     BPHAR-2                               K0409450
