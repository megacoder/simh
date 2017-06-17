                          HDNG    1130 FORTRAN COMPILER PHASE 5         K0500010
                    *************************************************** K0500020
                    *STATUS - VERSION 2  MODIFICATION 11                K0500030
                    *                                                 * K0500040
                    *FUNCTION/OPERATION-                              * K0500050
                    *   * ANALYZES DIMENSION STMNTS. PLACES DIMENSION * K0500060
                    *     INFORMATION INTO THE SYMBOL TABLE.          * K0500070
                    *   * REMOVES DIMENSION STMNT FROM THE STMNT      * K0500080
                    *     STRING                                      * K0500090
                    *   * PLACES VARIABLES AND DIMENSION INFORMATION  * K0500100
                    *     FROM REAL, INTEGER, AND EXTERNAL STMNTS INTO* K0500110
                    *     THE SYMBOL TABLE                            * K0500120
                    *   * INDICATES IN THE SYMBOL TABLE ID WORD THE   * K0500130
                    *     MODE (REAL OR INTEGER)                      * K0500140
                    *   * CHECKS EXTERNAL STMNTS FOR THE NAMES IFIX   * K0500150
                    *     AND FLOAT, WHICH ARE NOT ALLOWED.           * K0500160
                    *   * THE PROCESSING OF PHASE 5 IS DONE IN TWO    * K0500170
                    *     PASSES. THE FIRST PASS ANALYZES DIMENSION     K0500180
                    *     STMNTS. THE SECOND PASS EXAMINES REAL,      * K0500190
                    *     INTEGER, AND EXTERNAL STMNTS FOUND IN THE   * K0500200
                    *     STMNT STRING                                * K0500210
                    *   * UPON COMPLETION OF THE SECOND PASS A     2-11 K0500220
                    *     BRANCH IS TAKEN TO REPACK THE INPUT      2-11 K0500230
                    *     STRING, REMOVING DUMMY ERROR ENTRIES.    2-11 K0500240
                    *                                                 * K0500250
                    *ENTRY POINTS-                                    * K0500260
                    *   * PHASE-PHASE 5 IS READ INTO CORE BY PHASE 4  * K0500270
                    *           AND EXECUTION BEGUN AT LOCATION PHASE.* K0500280
                    *                                                 * K0500290
                    *INPUT-                                           * K0500300
                    *   NONE IN THE USUAL SENSE. HOWEVER, THE STMNT   * K0500310
                    *   STRING SCANNED BY THE COMPILER MAY BE         * K0500320
                    *   CONSIDERED INPUT.                             * K0500330
                    *                                                 * K0500340
                    *OUTPUT-                                          * K0500350
                    *   NONE IN THE USUAL SENSE. HOWEVER, PHASE 5     * K0500360
                    *   REMOVES STMNTS FROM THE STMNT STRING AND ADDS * K0500370
                    *   ENTRIES TO THE SYMBOL TABLE.                  * K0500380
                    *                                                 * K0500390
                    *EXTERNAL REFERENCES-                             * K0500400
                    *   SUBROUTINES-                                  * K0500410
                    *      * ROL                                      * K0500420
                    *   COMMA/DCOM-                                   * K0500430
                    *      * $PHSE                                    * K0500440
                    *                                                 * K0500450
                    *EXITS-                                           * K0500460
                    *   NORMAL-                                       * K0500470
                    *      PHASE EXITS NORMALLY IF NO STMNTS OF THE   * K0500480
                    *      TYPE IT PROCESSES ARE ENCOUNTERED OR IF NO * K0500490
                    *      ERRORS ARE FOUND. PHASE 6 IS LOADED AND    * K0500500
                    *      EXECUTED.                                  * K0500510
                    *   ERROR-                                        * K0500520
                    *      THE FLOW OF COMPILER PROCESSING IS NOT     * K0500530
                    *      INTERRUPTED WHEN AN ERROR IS ENCOUNTERED   * K0500540
                    *      AN ERROR STMNT REPLACES THE FAULTY STMNT   * K0500550
                    *      ON THE STRING AND STMNT SCANNING PROCESS   * K0500560
                    *      CONTINUES. AN EXCEPTION OCCURS IN THE CASE * K0500570
                    *      OF AN OVERLAP ERROR. COMPILATION IS        * K0500580
                    *      ABORTED AND CONTROL IS PASSED FROM PHASE   * K0500590
                    *      TO SUCCEEDING PHASE UNTIL AN OUTPUT PHASE  * K0500600
                    *      IS REACHED WHICH CAN PRINT AN ERROR MESSAGE* K0500610
                    *      THE ERRORS DETECTED BY PHASE 5 ARE 7, 8,   * K0500620
                    *      16, 17, 18, 19, 20, 21, AND 22.            * K0500630
                    *                                                 * K0500640
                    *TABLES/WORK AREAS-                               * K0500650
                    *   NON EXCEPT STATEMENT STRING AREA AND SYMBOL   * K0500660
                    *   TABLE.                                        * K0500670
                    *                                                 * K0500680
                    *ATTRIBUTES-N/A                                   * K0500690
                    *                                                 * K0500700
                    *NOTES-                                           * K0500710
                    *   THE SWITCHES USED IN PHASE 5 FOLLOW. IF NON-  * K0500720
                    *   ZERO. THE SWITCH IS TRANSFER=T. IF ZERO, THE  * K0500730
                    *   SWITCH IS NORMAL=N.                           * K0500740
                    *      SW2-OPERATOR SEMICOLON                     * K0500750
                    *          T=NEXT OPERATOR MUST BE SEMICOLON      * K0500760
                    *      SW3-SYMBOL TABLE OPEN                      * K0500770
                    *          T=SYMBOL TABLE WAS SPREAD THREE WORDS  * K0500780
                    *      SW1A-TYPE STATEMENT ENCOUNTERED            * K0500790
                    *          T=TYPE STMNT HAS BEEN ENCOUNTERED      * K0500800
                    *          N=REAL STATEMENT                       * K0500810
                    *          T=INTEGER STATEMENT                    * K0500820
                    *      SW3A-SEMICOLON                             * K0500830
                    *          T=SEMICOLON MUST BE NEXT               * K0500840
                    *      SW4-EXTERNAL STATEMENT                     * K0500850
                    *          T=EXTERNAL STMNT ENCOUNTERED           * K0500860
                    *      SW5-DIMENSIONED NAME                       * K0500870
                    *          T=NOT DIMENSIONED NAME                 * K0500880
                    *      SW6-TEMPORARY EXTERNAL SWITCH              * K0500890
                    *          T=TEMPORARY EXTERNAL                   * K0500900
                    *      SW7-FIRST PASS THROUGH PH05 SWITCH      2-11 K0500910
                    *          T=FIRST PASS MODE                   2-11 K0500920
                    *************************************************** K0500930
                          ABS                                           K0500940
                    *                                                   K0500950
                    *                        SYSTEM EQUATES             K0500960
                    *                                                   K0500970
                    MEMRY EQU     /8000     CORE SIZE                   K0500980
                    OVERL EQU     MEMRY-1501   PHASE OVERLAY AREA SIZE  K0500990
                    ROL   EQU     MEMRY-68  LOC OF RTN TO READ NEXT PH  K0501000
                    $PHSE EQU     /78       NO. OF PHASE NOW IN CORE    K0501010
                    PHLEN EQU     4         NO SECTORS THIS PHASE   2-6 K0501020
                          ORG     OVERL                                 K0501030
                    PHID  EQU     35        ID NUMBER THIS PHASE        K0501040
                    *                                                   K0501050
                    *                  FORTRAN COMMUNICATION AREA       K0501060
                    *                                                   K0501070
                    ORG   BSS     1    ORIGIN ADDRESS               2-4 K0501080
                    SOFS  BSS     1    START OF STRING                  K0501090
                    EOFS  BSS     1    END OF STRING                    K0501100
                    SOFST BSS     1    START OF SYMBOL TABLE            K0501110
                    SOFNS BSS     1    START OF NON-SUBSCRIPTED NUMBERS K0501120
                    SOFXT BSS     1    START OF SUBSCRIPT TEMPORARIES   K0501130
                    SOFGT BSS     1    START OF GENERATED TEMPORARIES   K0501140
                    EOFST BSS     1    END OF SYMBOL TABLE              K0501150
                    COMON BSS     1    NEXT AVAILABLE COMMON            K0501160
                    CSIZE BSS     1    SIZE OF COMMON                   K0501170
                    ERROR BSS     1    OVERLAP ERROR                    K0501180
                    FNAME BSS     1     PROGRAM NAME                    K0501190
                          BSS     1     *                               K0501200
                    SORF  BSS     1    SUBROUTINE(-) OR FUNCTION(+)     K0501210
                    CCWD  BSS     1    CONTROL CARD WORD                K0501220
                    *                BIT 15 TRANSFER TRACE              K0501230
                    *                BIT 14 ARITHMETIC TRACE            K0501240
                    *                BIT 13 EXTENDED PRECISION          K0501250
                    *                BIT 12 LIST SYMBOL TABLE           K0501260
                    *                BIT 11 LIST SUBPROGRAM NAMES       K0501270
                    *                BIT 10 LIST SOURCE PROGRAM         K0501280
                    *                BIT  9 ONE WORD INTEGERS           K0501290
                    *                BIT  8 ORIGIN                      K0501300
                    IOCS  BSS     1    IOCS CONTROL CARD WORD           K0501310
                    *                BIT 15 CARD                        K0501320
                    *                BIT 14 PAPER TAPE                  K0501330
                    *                BIT 13 TYPEWRITER                  K0501340
                    *                BIT 12 1443 PRINTER                K0501350
                    *                BIT 11 MAGNETIC TAPE               K0501360
                    *                BIT 10 KEYBOARD                    K0501370
                    *                BIT  8 DISK                        K0501380
                    *                BIT  1 UNFORMATTED DISK            K0501390
                    DFCNT BSS     1         FILE TABLE WORD COUNT       K0501400
                    *                                                   K0501410
                    *                                                   K0501420
                    *                                                   K0501430
                    *                  END OF FORTRAN COMMUNICATION     K0501440
                    *                  AREA                             K0501450
                    *                                                   K0501460
                    BPHAR EQU     *+2       BEGINNING ADDR OF PHASE     K0501470
                          DC      0         LOADER WORK AREA            K0501480
                          DC      -35       -PHASE ID FOR SLET LOOKUP   K0501490
                          DC      NXPID-*+1 TABLE FOR NEXT PHASE   2-11 K0501500
                          DC      1         ONE ENTRY TO BE SET BY LDR  K0501510
                          ORG     *-2                                   K0501520
                    *                                                   K0501530
                    *             INITIALIZE DIMENSION PASS             K0501540
                    *                                                   K0501550
                          LDX   1 PHID      LOAD ID NUMBER         2-11 K0501560
                          STX  L1 $PHSE     STORE IN SYS PHASE AREA     K0501570
                          LDX  I1 SOFS      START OF STRING ADDRESS     K0501580
                          LD      ERROR     OVERLAP ERROR INDICATOR     K0501590
                          BSC  L  BEGIN,Z   BR TO NEXT PHASE IF OVERLAP K0501600
                          STX     SW7       SET ON SW7             2-11 K0501610
                    TEST  LD    1 0         FIRST WORD OF STMNT         K0501620
                          SRA     1         POSITION TO TEST STMNT TYPE K0501630
                          AND     IDTPE     STATEMENT TYPE (BITS 1-5)   K0501640
                          S       ENDC      END STATEMENT CONSTANT      K0501650
                          BSC  L  BEGIN,+-  BR TO BEGIN IF END STMNT    K0501660
                          S       DIMC      DIMENSION STMNT CONSTANT    K0501670
                          BSC     +-        SKIP NEXT IF NOT DIMENSION  K0501680
                          MDX     MIX       BR TO SCAN DIMENSION STMNT  K0501690
                          LD    1 0         STMNT ID WORD          2-11 K0501700
                          SRA     2                                     K0501710
                          AND     IDNRM     EXTRACT STMNT WORD COUNT    K0501720
                          STO     *+1       STO CNT TO UPDATE PNTR 2-11 K0501730
                          MDX  L1 *-*       INCRMNT TO NEXT STMNT  2-11 K0501740
                          MDX     TEST      BR TO TEST STMNT TYPE       K0501750
                    *                                                   K0501760
                    *             CONSTANTS AND WORK AREA               K0501770
                    *                                                   K0501780
                    SW7   DC      *-*       FIRST PASS SWITCH      2-11 K0501790
                    ENDC  DC      /0800     END STATEMENT CONSTANT      K0501800
                    DIMC  DC      /2000-/0800  DIMENSION STMNT CONSTANT K0501810
                    SEMIC DC      /001E     SEMI-COLON CONSTANT         K0501820
                    ERR   DC      18        ERROR 18 CONSTANT           K0501830
                    ERR7  DC      7         ERROR  7 CONSTANT           K0501840
                    ERR8  DC      8         ERROR  8 CONSTANT           K0501850
                    ERR16 DC      16        ERROR 16 CONSTANT           K0501860
                    ERR17 DC      17        ERROR 17 CONSTANT           K0501870
                    ERRNO DC      0         ERROR NUMBER           2-11 K0501880
                    WD1   DC      0         STMNT NAME (FIRST HALF)     K0501890
                    WD2   DC      0         STMNT NAME (SECOND HALF)    K0501900
                    SAVE  DC      0         INDEX REGISTER 3 TEMPORARY  K0501910
                    IDNRM DC      /01FF     STMNT WORD COUNT MASK       K0501920
                          DC      0         RESERVED FOR FUTURE USE     K0501930
                    SW2   DC      0         ERROR 16 SWITCH NON-ZERO=ON K0501940
                    IDADR DC      *-*       START ADRS OF STMNT    2-11 K0501950
                    IDTPE DC      /7C00     STATEMENT TYPE MASK         K0501960
                    ERRID DC      /A008     ERROR IDENTIFIER CONSTANT   K0501970
                    ZERO  DC      /8000     SWITCH 2 RESET CONSTANT     K0501980
                    *                                                   K0501990
                    *             INITIALIZE TO SCAN DIMENSION STMNT    K0502000
                    *                                                   K0502010
                    MIX   STX   1 IDADR     SAVE START ADRS OF STMT2-11 K0502020
                          MDX   1 1         INCREMENT STMNT ADDRESS     K0502030
                          SLA     16        CLEAR ACCUMULATOR           K0502040
                          STO     SW2       TURN OFF SWITCH 2           K0502050
                          STO  L  SW3       TURN OFF SWITCH 3           K0502060
                    SIP   LD    1 0         LOAD NEXT STMNT WORD        K0502070
                          S       SEMIC     SEMI-COLON                  K0502080
                          BSC  L  REMOV,+-  BRCH IF SEMI-COLON     2-11 K0502090
                          LD      SW2       ERROR 16 INDICATOR          K0502100
                          BSC  L  ER16,Z    BR IF POSITIVE              K0502110
                          MDX  L  SW2,1     SET ERROR 16 INDICATOR ON   K0502120
                    PADS  LD    1 0         STATEMENT NAME (FIRST HALF) K0502130
                          BSC     -         BR TO ER7 IF FIRST CHAR IS  K0502140
                          MDX     ER7       NOT ALPHABETIC.             K0502150
                          STO     WD1       SAVE FIRST HALF OF NAME     K0502160
                          SLA     2                                     K0502170
                          BSC  L  ER7,C+Z   BR IF 1ST CHAR NOT ALPHA    K0502180
                          LD    1 1         LAST HALF OF STATEMENT NAME K0502190
                          BSC  L  MADS,+Z   BR IF NAME LONGER THAN 1 WD K0502200
                          LD      ZERO      ONE WORD NAME INDICATOR     K0502210
                          STO     WD2       LAST HALF OF NAME           K0502220
                          MDX     ZORRO     BR TO SEARCH SYMBOL TABLE   K0502230
                    MADS  STO     WD2       LAST HALF OF NAME           K0502240
                          MDX   1 1         INCREMENT STMNT ADDRESS     K0502250
                          LD    1 1         BR TO ER7 IF NAME IS MORE   K0502260
                          BSC  L  ER7,+Z    THAN TWO WORDS LONG.        K0502270
                    *                                                   K0502280
                    *             LOOK FOR NAME IN SYMBOL TABLE         K0502290
                    *                                                   K0502300
                    ZORRO LDX  I3 SOFNS     START OF NON-STMNT NUMBERS  K0502310
                          MDX     BILL      BR TO CHECK END OF SEARCH   K0502320
                    LOOP  LD    3 1         LD NEXT SYMBOL TABLE ENTRY  K0502330
                          S       WD1       FIRST HALF OF NAME          K0502340
                          BSC     Z         SKIP NEXT IF EQUAL NAME     K0502350
                          MDX     HEAT      BR IF NOT EQUAL NAME        K0502360
                          LD    3 2         LD NEXT SYMBOL TABLE ENTRY  K0502370
                          S       WD2       LAST HALF OF NAME           K0502380
                          BSC  L  CHK,+-    BR IF NAME FOUND            K0502390
                    HEAT  MDX   3 -3        DECREMENT SYMBOL TABLE ADDR K0502400
                    BILL  STX   3 SAVE      STORE TO TEMPORARY          K0502410
                          LD      SAVE      LOAD CURRENT SEARCH ADDRESS K0502420
                          S    L  EOFST     END OF SYMBOL TABLE         K0502430
                          BSC     Z         SKIP NEXT IF END SEARCH     K0502440
                          MDX     LOOP      BR TO CONTINUE SEARCH       K0502450
                          MDX     PLACE     BR TO PUT NAME IN TABLE     K0502460
                    CHK   LD    3 0         CHECK FOR SUBPROGRAM NAME   K0502470
                          SLA     8         BR TO SET ERROR 17 IF       K0502480
                          BSC  L  PREV,-    SUBPROGRAM NAME IN STMNT.   K0502490
                    *                                                   K0502500
                    *             SET UP ERRORS                         K0502510
                    *                                                   K0502520
                    ER17  LD      ERR17     ERROR 17 INDICATOR          K0502530
                          STO     ERRNO     ERROR NUMBER TEMPORARY 2-11 K0502540
                          MDX     CLOSE     BR TO CLOSE STRING          K0502550
                    ER8   LD      ERR8      ERROR 08 INDICATOR          K0502560
                          STO     ERRNO     ERROR NUMBER TEMPORARY 2-11 K0502570
                          MDX     CLOSE     BR TO CLOSE STRING          K0502580
                    ER16  LD      ERR16     ERROR 16 INDICATOR          K0502590
                          STO     ERRNO     ERROR NUMBER TEMPORARY 2-11 K0502600
                          MDX     CLOSE     BR TO CLOSE STRING          K0502610
                    ER7   LD      ERR7      ERROR 07 INDICATOR          K0502620
                          STO     ERRNO     ERROR NUMBER TEMPORARY 2-11 K0502630
                          MDX     CLOSE     BR TO CLOSE STRING          K0502640
                    ER    LD      ERR       ERROR 18 INDICATOR          K0502650
                          STO     ERRNO     ERROR NUMBER TEMPORARY 2-11 K0502660
                          MDX     CLOSE     BRCH TO CLOSE STRING   2-11 K0502670
                    *                                              2-11 K0502680
                    REMOV SLA     16        SET TO ZERO (DUMMY ERR)2-11 K0502690
                          STO     ERRNO     ERROR NUMBER TEMPORARY 2-11 K0502700
                    *                                                   K0502710
                    *     REPLACE STMNT WITH ERROR ID/OR DUMMY     2-11 K0502720
                    *     ERROR ID AND CLOSE STRING                2-11 K0502730
                    *                                                   K0502740
                    CLOSE LDX  I1 IDADR     STRING ADRS            2-11 K0502750
                          LD    1 0         FIRST WD OF STMNT           K0502760
                          SRA     2                                     K0502770
                          AND     IDNRM     EXTRACT STMNT WORD COUNT    K0502780
                          STO     NRMSV     SAVE IN WD COUNT TEMPORARY  K0502790
                          A       IDADR     ADRS FIRST WRD OF STMNT2-11 K0502800
                          STO     *+1       ADRS OF NEXT STMNT     2-11 K0502810
                          LDX  L2 *-*       NEXT STMNT ADRS INTO XR2-11 K0502820
                          LD      ERRID     PUT ERROR IDENTIFIER        K0502830
                          STO   1 0         ON STRING.                  K0502840
                          LD      ERRNO     ERROR NUMBER           2-11 K0502850
                          STO   1 1         PUT ERROR NUMBER ON STRING  K0502860
                          MDX   1 2         INCREMENT STRING PTR   2-11 K0502870
                          LD   L  EOFS      END OF STRING ADDRESS       K0502880
                          S    L  IDADR     ADRS OF THIS STMNT ID  2-11 K0502890
                          S       NRMSV     WORD COUNT THIS STATEMENT   K0502900
                          STO     *+1       COMPUTED RANGE         2-11 K0502910
                          LDX  L3 *-*       RANGE                  2-11 K0502920
                          STX   1 SAVX1+1   SAVE XR1               2-11 K0502930
                          MDX   3 1                                     K0502940
                    LOOP1 LD    2 0         NEXT WORD OF STRING TO MOVE K0502950
                          STO   1 0         CLOSE STRING           2-11 K0502960
                          MDX   1 1         INCREMENT STRING POINTER    K0502970
                          MDX   2 1         INCR ADDR NEXT WD TO MOVE   K0502980
                          MDX   3 -1        DECR RANGE AND SKIP IF ZERO K0502990
                          MDX     LOOP1     BR TO MOVE NEXT WORD        K0503000
                          STX  L1 EOFS      NEW END OF STRING ADDRESS   K0503010
                    SAVX1 LDX  L1 *-*       RESTORE XR1            2-11 K0503020
                    *                                              2-11 K0503030
                          LD   L  SW7       CHECK FOR 1ST PASS MODE2-11 K0503040
                          BSC  L  TEST,Z    BRCH TO CONT DIMEN     2-11 K0503050
                          BSC  L  DAP       BRCH TO 2ND PASS MODE  2-11 K0503060
                    *                                                   K0503070
                    *             CONSTANTS AND WORK AREA               K0503080
                    *                                                   K0503090
                    NRMSV DC      0         STMNT WORD COUNT            K0503100
                    TWO   DC      2         DECIMAL 2 FOR ADDR INCR     K0503110
                    TENT  DC      0         SYMBOL TABLE ADDRESS        K0503120
                    SW3   DC      0         SYMBOL TABLE OVERLAP INDR   K0503130
                    ONEDM DC      /0800     ONE DIMENSION CONSTANT      K0503140
                    *                                                   K0503150
                    *             PLACE NAME IN SYMBOL TABLE            K0503160
                    *                                                   K0503170
                    PLACE LD   L  WD2       LAST HALF OF NAME           K0503180
                          STO   3 2         NEXT SYMBOL TABLE ENTRY+1   K0503190
                          LD   L  WD1       FIRST HALF OF NAME          K0503200
                          STO   3 1         NEXT SYMBOL TABLE ENTRY     K0503210
                          MDX  L  EOFST,-3  DECR END SYMBOL TABLE ADDR  K0503220
                          MDX  L  SOFXT,-3  DECR START OF SUBSC TEMPS   K0503230
                          MDX  L  SOFGT,-3  DECR START GENERATED TEMPS  K0503240
                    *                                                   K0503250
                    *             SET TYPE INDICATOR (REAL OR INTEGER)  K0503260
                    *                                                   K0503270
                          LD   L  WD1       FIRST HALF OF NAME          K0503280
                          AND  L  PIT1      EXTRACT FIRST NAME CHAR     K0503290
                          S    L  RGTI      ALPHA CONSTANT              K0503300
                          BSC     +Z        SKIP IF NOT REAL            K0503310
                          MDX     REEL      BR TO REEL IF NEG (REAL)    K0503320
                          S    L  RGTN      ALPHA CONSTANT              K0503330
                          BSC  L  REEL,Z-   BR TO REEL IF PLUS          K0503340
                          LD   L  IDCI      INTEGER INDICATOR           K0503350
                          MDX     VIP       BR TO STORE INDICATOR       K0503360
                    REEL  LD      IDCR      REAL INDICATOR              K0503370
                    VIP   STO   3 0         IDENTIFICATION WORD         K0503380
                          MDX     LORD      BR TO TEST FOR OVERLAP ERR  K0503390
                    *                                                   K0503400
                    *             TEST FOR NAME PREVIOUSLY DIMENSIONED  K0503410
                    *                                                   K0503420
                    PREV  LD    3 0         IDENTIFICATION WORD         K0503430
                          SLA     4         SHIFT DIMENSION CHARACTER   K0503440
                          BSC     C         INTO THE CARRY AND SIGN     K0503450
                          MDX     ER        POSITIONS AND BR TO ER IF   K0503460
                          BSC  L  ER,+Z     EITHER BIT IS ON.           K0503470
                    *                                                   K0503480
                    *             CHECK IF SUBPROGRAM OR FUNCTION       K0503490
                    *                                                   K0503500
                          LD   L  SORF      SUBPROGRAM OR FUNCTION INDR K0503510
                          BSC  L  SUBN,+-   BR IF EITHER INDICATOR ON   K0503520
                          LD    3 0         IDENTIFICATION WORD         K0503530
                          SLA     2         COMMON INDICATOR TO SIGN    K0503540
                          BSC  L  SUBN,-    BR IF ALREADY IN COMMON     K0503550
                          MDX  L  FNAME,1   ADJUST FNAME POINTER        K0503560
                    *                                                   K0503570
                    *             SPREAD SYMBOL TABLE FOR DIMENSION WDS K0503580
                    *                                                   K0503590
                    SUBN  STX   1 VVV+1     SAVE STATEMENT POINTER      K0503600
                          STX   3 TENT      ADDR OF NAME IN COMMON      K0503610
                          LD      TENT                                  K0503620
                          S    L  EOFST     END OF STRING ADDRESS       K0503630
                          STO     TENT      NUMBER OF WORDS TO MOVE     K0503640
                          LDX  I2 TENT                                  K0503650
                          MDX   2 -3        DECR WORDS TO MOVE COUNT    K0503660
                          MDX     PASS      BR TO SLIDE TABLE 1 ENTRY   K0503670
                          MDX     GLINK     BR TO CLEAR ENTRY IF ZERO   K0503680
                    PASS  LDX  I1 EOFST     END OF SYMBOL TABLE ADDRESS K0503690
                    LOOP3 LD    1 3         LD WORD TO MOVE             K0503700
                          STO   1 0         SPREAD TABLE 3 WORDS        K0503710
                          MDX   1 1         INCREMENT MOVE POINTER      K0503720
                          MDX   2 -1        DECR CTR,SKIP NEXT IF DONE  K0503730
                          MDX     LOOP3     BR TO CONTINUE              K0503740
                    GLINK SLA     16        CLEAR ACCUMULATOR           K0503750
                          STO   3 -1        ZERO WD 3 DIMENSION ENTRY   K0503760
                          STO   3 -2        ZERO WD 2 DIMENSION ENTRY   K0503770
                          STO   3 -3        ZERO WD 1 DIMENSION ENTRY   K0503780
                          LD    3 0         IDENTIFICATION WORD         K0503790
                          OR      ONEDM     ONE DIMENSION INDICATOR     K0503800
                          STO   3 0         REPLACE IN TABLE ENTRY      K0503810
                    VVV   LDX  L1 0         RESTORE INDEX REGISTER 1    K0503820
                          MDX  L  EOFST,-3  DECR END OF SYMBOL TABLE    K0503830
                          MDX  L  SOFXT,-3  DECR START OF SUBSC TEMPS   K0503840
                          MDX  L  SOFGT,-3  DECR START GENERATED TEMPS  K0503850
                          MDX  L  SW3,1                                 K0503860
                    LORD  LD   L  EOFST     CHK FOR SYMBOL TBL OVERFLOW K0503870
                          A       TWO                                   K0503880
                          S    L  EOFS      END OF STRING               K0503890
                          BSC  L  JIMY,+Z   BR IF SYMBOL TABLE OVERFLOW K0503900
                    TARZ  MDX   1 1         MOVE STATEMENT POINTER      K0503910
                          LD    1 0         NEXT CHAR DIMENSION STMNT   K0503920
                          S       PARNL     LEFT PARENTHESIS            K0503930
                          BSC  L  ER8,Z     BR IF NO LEFT PARENTHESIS   K0503940
                    SON1  SLA     16        CLEAR ACCUMULATOR           K0503950
                          STO     CNT       RESET DIMENSION COUNTER     K0503960
                          MDX   1 1         MOVE STMNT POINTER          K0503970
                          LD    1 0         NEXT CHAR OF STMNT          K0503980
                          AND     PIT       CHECK FOR ALPHA CHARACTER   K0503990
                          EOR     PIT                                   K0504000
                          BSC  L  ER8,Z     BR TO ER8 IF NOT NUMERIC    K0504010
                    *                                                   K0504020
                    *             COLLECT CONSTANT TO BINARY            K0504030
                    *                                                   K0504040
                          LDS     0         RESET OVERFLOW AND CARRY    K0504050
                          SLT     32        CLEAR ACCUMULATOR           K0504060
                          STO     SUMM      CLEAR CONSTANT SUM          K0504070
                          LD    1 0         WORD 1 OF CONSTANT          K0504080
                          STD     TEM                                   K0504090
                          LD    1 1         WORD 2 OF CONSTANT          K0504100
                          BSC  L  AOT,-     BRANCH ON OPERATOR          K0504110
                          SLA     1         MAKE BITS CONTIGUOUS        K0504120
                          STO     TEM+1                                 K0504130
                          LD    1 2         NEXT STATEMENT WORD         K0504140
                          MDX   1 1         MOVE STATEMENT POINTER      K0504150
                          BSC  L  ER8,+     BR ON NO OPERATOR           K0504160
                    AOT   LD      TEM       WORD 1 OF CONSTANT          K0504170
                    AOT1  AND     COT1      AND OUT ALL BUT 1ST 6 BITS  K0504180
                          SLA     2                                     K0504190
                          BSC  L  PILL,C    BRANCH IF CARRY ON          K0504200
                          BSC  L  NEX,+-    BR TO CHECK FOR ZERO CON    K0504210
                          LDX  L  ER8       BR IMBEDDED ALPHA CHARACTER K0504220
                    PILL  BSC  L  ER8,-     BR NOT MINUS                K0504230
                          AND     COT2      EXTRACT DIGIT               K0504240
                          S       NINT      NINE                        K0504250
                          BSC  L  ER8,-Z    BR GREATER THAN NINE        K0504260
                          A       NINT      RESTORE DIGIT               K0504270
                          SRA     11        RIGHT JUSTIFY               K0504280
                          STO     HELP1                                 K0504290
                          LD      SUMM      CUMULATIVE SUM              K0504300
                          SLA     1         TIMES 2                     K0504310
                          STO     GORT      TEMPORARY STORE             K0504320
                          BSC  L  ER8,+Z    BR IF TOO LARGE             K0504330
                          SLA     2         TIMES 8                     K0504340
                          BSC  L  ER8,C+Z   BR IF TOO LARGE             K0504350
                          A       GORT      TIMES 10                    K0504360
                          A       HELP1     UNITS DIGIT                 K0504370
                          BSC  L  ER8,O     BR TOO LARGE                K0504380
                          STO     SUMM      CUMULATIVE SUM              K0504390
                          LDD     TEM       DIGIT TEMPORARY             K0504400
                          SLT     6         SHIFT NEXT DIGIT TO HIGH 6  K0504410
                          STD     TEM                                   K0504420
                          MDX     AOT1      BR TO PROCESS NEXT DIGIT    K0504430
                    *                                                   K0504440
                    *             CONSTANTS AND WORK AREA               K0504450
                    *                                                   K0504460
                    PIT   DC      /6000     ALPHABETIC MASK             K0504470
                    PIT1  DC      /7E00     FIRST NAME CHARACTER MASK   K0504480
                    RGTI  DC      /1200     CHARACTER LIMIT CHECK CON   K0504490
                    RGTN  DC      /1800     CHARACTER LIMIT CHECK CON   K0504500
                    IDCI  DC      /4000     INTEGER TYPE CONSTANT INDR  K0504510
                    IDCR  DC      0         REAL TYPE CONSTANT INDR     K0504520
                    PARNL DC      /000D     LEFT PARENTHESIS CONSTANT   K0504530
                    COMAC DC      /002B     COMMA CONSTANT              K0504540
                          BSS  E  0         MAKE ADDRESS EVEN           K0504550
                    TEM   DC      0         2 WORD TEMPORARY FOR        K0504560
                          DC      0         CONSTANT TO BE CONVERTED.   K0504570
                    COT1  DC      /FE00     EXTRACT CHARACTER CONSTANT  K0504580
                    COT2  DC      /7800     EXTRACT DIGIT CONSTANT      K0504590
                    HELP1 DC      0         UNITS DIGIT TEMPORARY       K0504600
                    NINT  DC      /4800     DECIMAL NINE CONSTANT       K0504610
                    SUMM  DC      0         CUMULATIVE SUM OF CONSTANT  K0504620
                    CNT   DC      0         NUMBER OF CONSTANTS COUNTER K0504630
                    PARNR DC      /001D     RIGHT PARENTHESIS CONSTANT  K0504640
                    GORT  DC      0         CONSTANT TIMES 2 TEMPORARY  K0504650
                    O1    DC      1         DECIMAL 1 CONSTANT          K0504660
                    *                                                   K0504670
                    *             MAKE DIMENSION ENTRY IN SYMBOL TABLE  K0504680
                    *                                                   K0504690
                    NEX   MDX  L  CNT,1     INCR CONSTANT COUNTER       K0504700
                          LD      SUMM      CHECK FOR ZERO CONSTANT     K0504710
                          BSC  L  ER8,+-    BR IF DIMENSION CON IS ZERO K0504720
                          LD      CNT       DIMENSION COUNTER           K0504730
                          S       O1        ONE                         K0504740
                          BSC     Z         SKIP NEXT IF FIRST CONSTANT K0504750
                          MDX     O2        BR TO COMPUTE 2ND CONSTANT  K0504760
                          LD      SUMM      DIMENSION CONSTANT          K0504770
                          STO   3 -1        STORE IN ALL 3 DIMENSION    K0504780
                          STO   3 -2        WORDS OF SYMBOL TABLE       K0504790
                          STO   3 -3        ENTRY.                      K0504800
                          MDX     NEXP      BR TO GET NEXT STMNT CHAR   K0504810
                    O2    S       O1        ONE                         K0504820
                          BSC     Z         SKIP NEXT IF SECOND CON     K0504830
                          MDX     O3        BR TO COMPUTE THIRD CON     K0504840
                          LD    3 -1        FIRST DIMENSION CONSTANT    K0504850
                          M       SUMM      SECOND DIMENSION CONSTANT   K0504860
                          SLT     1         BRANCH TO SET ERROR 8   2-7 K0504870
                          BSC  L  ER8,Z     *IF TOO GREAT           2-7 K0504880
                          SLT     15        SHIFT INTO ACCUMULATOR  2-7 K0504890
                          STO   3 -2        STORE IN SECOND AND THIRD   K0504900
                          STO   3 -3        DIMENSION WORDS.            K0504910
                          MDX     NEXP      BR TO GET NEXT STMNT CHAR   K0504920
                    O3    LD    3 -3        1ST X 2ND DIMENSION CON     K0504930
                          M       SUMM      THIRD DIMENSION CONSTANT    K0504940
                          SLT     1         BRANCH TO SET ERROR 8   2-7 K0504950
                          BSC  L  ER8,Z     *IF TOO GREAT           2-7 K0504960
                          SLT     15        SHIFT INTO ACCUMULATOR  2-7 K0504970
                          STO   3 -3        STORE IN THIRD DIMENSION WD K0504980
                    NEXP  MDX   1 1         INCREMENT STMNT POINTER     K0504990
                          LD    1 0         NEXT CHARACTER              K0505000
                          S       COMAC     COMMA                       K0505010
                          BSC  L  TCNT,+-   BR TO CHECK DIMENSION COUNT K0505020
                          A       COMAC     RESTORE CHARACTER           K0505030
                          S       PARNR     RIGHT PARENTHESIS           K0505040
                          BSC  L  ER8,Z     BR TO ERR IF NO PARENTHESIS K0505050
                          LD      CNT       DIMENSION COUNT             K0505060
                          SLA     11        SHIFT TO BITS 3 AND 4       K0505070
                          STO     TMPDM     TEMPORARY                   K0505080
                          LD    3 0         SYMBOL TABLE ID WORD        K0505090
                          AND     THRDM     SET BITS 3 AND 4 EQUAL TO   K0505100
                          OR      TMPDM     THE NUMBER OF DIMENSIONS.   K0505110
                          STO   3 0         SYMBOL TABLE ID WORD        K0505120
                          LD   L  SW3                                   K0505130
                          BSC  L  YELP1,Z   BR TO CHECK FOR OVERLAP     K0505140
                          MDX  L  EOFST,-3  DECR END OF SYMBOL TABLE    K0505150
                          MDX  L  SOFXT,-3  DECR START OF SUBSC TEMPS   K0505160
                          MDX  L  SOFGT,-3  DECR START GENERATED TEMPS  K0505170
                    YELP1 LD   L  EOFST     CHK FOR SYMBOL TBL OVERLAP  K0505180
                          A    L  TWO                                   K0505190
                          S    L  EOFS      END OF STRING               K0505200
                          BSC  L  JIMY,+Z   BR IF SYMBOL TABLE OVERLAP  K0505210
                          SLA     16        CLEAR ACCUMULATOR           K0505220
                          STO  L  SW3       RESET SWITCH 3              K0505230
                          MDX   1 1         MOVE STMNT POINTER          K0505240
                          LD    1 0         NEXT STMNT CHARACTER        K0505250
                          S       COMAC     COMMA                       K0505260
                          BSC  L  SIP,Z     BR NOT COMMA                K0505270
                          MDX   1 1         MOVE STMNT POINTER          K0505280
                          BSC  L  PADS      BR TO CHK FOR LEGAL NAME    K0505290
                    *                                                   K0505300
                    *             CONSTANTS AND WORK AREA               K0505310
                    *                                                   K0505320
                    THRE  DC      3         DECIMAL THREE               K0505330
                    THRDM DC      /E7FF     MASK TO REMOVE BITS 3 AND 4 K0505340
                    TMPDM DC      *-*       DIMENSION COUNT TEMPORARY   K0505350
                    *                                                   K0505360
                    *             CHECK FOR OVERLAP ERROR               K0505370
                    *                                                   K0505380
                    JIMY  MDX  L  ERROR,1   SET OVERLAP ERROR ON        K0505390
                          BSC  L  BEGIN     BR TO REAL AND INTEGER      K0505400
                    TCNT  LD      CNT       CHK FOR COUNT LESS THAN 3   K0505410
                          S       THRE                                  K0505420
                          BSC  L  ER8,-     BR IF COUNT 3 OR MORE       K0505430
                          LDX  L  SON1+2    BR TO CONVERT NEXT CONSTANT K0505440
                    *                                                   K0505450
                    *             CONSTANTS AND WORK AREA               K0505460
                    *                                                   K0505470
                    ONE   DC      1         DECIMAL 1                   K0505480
                    SW1A  DC      0         MOVE SWITCH                 K0505490
                    SW2A  DC      0         REAL/INTEGER SWITCH         K0505500
                    H0800 DC      /0800     END STMNT CONSTANT          K0505510
                    INTGR DC      /0400     INTEGER STMNT CONSTANT      K0505520
                    REALC DC      /2400-/0800  REAL STMNT CONSTANT      K0505530
                    SEMI  DC      /1E       SEMICOLON CONSTANT          K0505540
                    SW3A  DC      0         SYNTAX ERROR SWITCH         K0505550
                    IDTPQ DC      /7C00     STATEMENT TYPE MASK         K0505560
                    EXTER DC      /3C00     EXTERNAL STMNT CONSTANT     K0505570
                    *                                                   K0505580
                    *             INITIALIZE TYPE STATEMENT PASS        K0505590
                    *                                                   K0505600
                    BEGIN LDX  I1 SOFS      START OF STRING ADDRESS     K0505610
                          LD   L  ERROR     OVERLAP ERROR INDICATOR     K0505620
                          BSC  L  NXTPH,Z   BRCH IF OVERLAP ERROR  2-11 K0505630
                    DAP   SLA     16                                    K0505640
                          STO  L  SW4       RESET EXTERNAL STMNT SWITCH K0505650
                          STO  L  SW6       RESET SWITCH 6              K0505660
                          STO  L  SW7       RESET 1ST PASS SWITCH  2-11 K0505670
                          LD    1 0         FIRST WORD OF STMNT         K0505680
                          SRA     1         POSITION TO TEST STMNT TYPE K0505690
                          AND     IDTPQ     STMNT TYPE (BITS 1-5)       K0505700
                          S       H0800     END STATEMENT CONSTANT      K0505710
                          BSC  L  REPAK,+-  GO DO REPACK OF STRING 2-11 K0505720
                          S       REALC     REAL STMNT CONSTANT         K0505730
                          BSC  L  LAP,+-    BR IF REAL STMNT            K0505740
                          S       INTGR     INTEGER CONSTANT            K0505750
                          BSC  L  LAP1,+-   BR IF INTEGER STMNT         K0505760
                          S       EXTER     EXTERNAL STMNT CONSTANT     K0505770
                          BSC  L  PTCH1,Z    BRANCH TO PATCH IF NO  2-4 K0505780
                          MDX  L  SW4,1     EXTERNAL SWITCH ON          K0505790
                          MDX     LAP4      BR TO SET MOVE SWITCH ON    K0505800
                    LAP1  STX   0 SW2A      SW2A SET NON-ZERO = INTEGER K0505810
                          MDX     LAP4      BR TO SET MOVE SWITCH ON    K0505820
                    LAP   SLA     16        SET SW2A TO ZERO TO         K0505830
                          STO     SW2A      INDICATE REAL STMNT.        K0505840
                    LAP4  STX   0 SW1A      SET MOVE SWITCH ON          K0505850
                    *                                                   K0505860
                    *             INITIALIZE TO SCAN BODY OF STMNT      K0505870
                    *                                                   K0505880
                    LAP3  STX  L1 IDADR     ADRS 1ST STMNT WORD    2-11 K0505890
                          MDX   1 1         INCR STMNT ADDR             K0505900
                          SLA     16        CLEAR ACCUMULATOR           K0505910
                          STO  L  SW5       SYMBOL TABLE ADDR ADJUST SW K0505920
                          STO     SW3A      RESET SYNTAX ERROR INDR     K0505930
                    JAP   LD    1 0         FIRST STMNT WORD            K0505940
                          S       SEMI      SEMI-COLON                  K0505950
                          BSC  L  REMOV,+-  BRCH IF SEMI-COLON     2-11 K0505960
                          LD      SW3A      SYNTAX ERROR SW             K0505970
                          BSC  L  ER19,Z    BR TO SET ERROR IF SW3 ON   K0505980
                    ZAR   LD    1 0         STMNT NAME (FIRST HALF)     K0505990
                          BSC  L  LAP2,+Z   BRANCH IF NAME          2-6 K0506000
                          S       SEMI      ERROR 19                2-6 K0506010
                          BSC  L  ER19,+-   *IF SEMICOLON           2-6 K0506020
                          MDX     ER7R      ERROR 7 IF NOT          2-6 K0506030
                    *                                                   K0506040
                    LAP2  STO     WORD1     SAVE FIRST HALF OF NAME     K0506050
                          SLA     2                                     K0506060
                          BSC  L  ER7R,C+Z  BR IF 1ST CHAR NOT ALPHA    K0506070
                          LD    1 1         LAST HALF OF STMNT NAME     K0506080
                          BSC  L  HOCK,+Z   BR IF NAME LONGER THAN 1 WD K0506090
                          LD      ZO        ONE WORD NAME INDICATOR     K0506100
                          STO     WORD2     LAST HALF OF NAME           K0506110
                          MDX     *+2                               2-1 K0506120
                    HOCK  STO     WORD2     LAST HALF OF NAME           K0506130
                          MDX   1 1         INCR STMNT ADDRESS          K0506140
                          LD   L  SW4       EXTERNAL INDICATOR      2-1 K0506150
                          BSC  L  GENEL,+-  BR IF NOT EXTERNAL      2-1 K0506160
                          LD    1 1         BR TO ER19 IF           2-1 K0506170
                          S    L  PARNL     NAME IS                 2-1 K0506180
                          BSC  L  ER19,+-   SUBSCRIPTED             2-1 K0506190
                    GENEL LD    1 1         BR TO ER7 IF NAME MORE  2-1 K0506200
                          BSC  L  ER7R,+Z   THAN TWO WORDS LONG.        K0506210
                    *                                                   K0506220
                    *             LOOK FOR NAME IN SYMBOL TABLE         K0506230
                    *                                                   K0506240
                    ZOR   LDX  I3 SOFNS     START OF NON-STMNT NUMBERS  K0506250
                          MDX     HACK      BR TO CHECK END OF SEARCH   K0506260
                    LOOPQ LD    3 1         LD NEXT SYMBOL TABLE ENTRY  K0506270
                          S       WORD1     FIRST HALF OF NAME          K0506280
                          BSC     Z         SKIP NEXT IF EQUAL NAME     K0506290
                          MDX     EAT       BR IF NOT EQUAL NAME        K0506300
                          LD    3 2         LD NEXT SYMBOL TABLE ENTRY  K0506310
                          S       WORD2     LAST HALF OF NAME           K0506320
                          BSC  L  FUN,+-    BR IF NAME FOUND            K0506330
                    EAT   MDX   3 -3        DECR SYMBOL TABLE ADDRESS   K0506340
                    HACK  STX   3 SAVEQ     STORE TO TEMPORARY          K0506350
                          LD      SAVEQ     LOAD CURRENT SEARCH ADDRESS K0506360
                          S    L  EOFST     END OF SYMBOL TABLE         K0506370
                          BSC     Z         SKIP NEXT IF END SEARCH     K0506380
                          MDX     LOOPQ     BR TO CONTINUE SEARCH       K0506390
                          MDX     PLACQ     BR TO PUT NAME IN TABLE     K0506400
                    *                                                   K0506410
                    *             CONSTANTS AND WORK AREA               K0506420
                    *                                                   K0506430
                    ZO    DC      /8000     SWITCH 2 RESET CONSTANT     K0506440
                    SAVEQ DC      0         INDEX REGISTER 3 TEMPORARY  K0506450
                    WORD1 DC      0         STMNT NAME (FIRST HALF)     K0506460
                    WORD2 DC      0         STMNT NAME (SECOND HALF)    K0506470
                    ERR18 DC      18        ERROR 18 CONSTANT           K0506480
                    ERR19 DC      19        ERROR 19 CONSTANT           K0506490
                    ERR20 DC      20        ERROR 20 CONSTANT           K0506500
                    ERR8S DC      8         ERROR 08 CONSTANT           K0506510
                    ERR7S DC      7         ERROR 07 CONSTANT           K0506520
                    ERR21 DC      21        ERROR 21 CONSTANT           K0506530
                    *                                                   K0506540
                    *             SET UP ERRORS                         K0506550
                    *                                                   K0506560
                    ER19  LD      ERR19     ERROR 19 INDICATOR          K0506570
                          STO  L  ERRNO     TEMP ERROR NUMBER      2-11 K0506580
                          BSC  L  CLOSE     BRCH TO INSERT ERROR ID2-11 K0506590
                    ER20  LD      ERR20     ERROR 20 INDICATOR          K0506600
                          STO  L  ERRNO     TEMP ERROR NUMBER      2-11 K0506610
                          BSC  L  CLOSE     BRCH TO INSERT ERROR ID2-11 K0506620
                    ER8R  LD      ERR8S     ERROR 08 INDICATOR          K0506630
                          STO  L  ERRNO     TEMP ERROR NUMBER      2-11 K0506640
                          BSC  L  CLOSE     BRCH TO INSERT ERROR ID2-11 K0506650
                    ER18  LD      ERR18     ERROR 18 INDICATOR          K0506660
                          STO  L  ERRNO     TEMP ERROR NUMBER      2-11 K0506670
                          BSC  L  CLOSE     BRCH TO INSERT ERROR ID2-11 K0506680
                    ER21  LD      ERR21     ERROR 21 INDICATOR          K0506690
                          STO  L  ERRNO     TEMP ERROR NUMBER      2-11 K0506700
                          BSC  L  CLOSE     BRCH TO INSERT ERROR ID2-11 K0506710
                    ER7R  LD      ERR7S     ERROR 07 INDICATOR          K0506720
                          STO  L  ERRNO     TEMP ERROR NUMBER      2-11 K0506730
                          BSC  L  CLOSE     BRCH TO INSERT ERROR ID2-11 K0506740
                    *                                                   K0506750
                    *             CONSTANTS AND WORK AREA               K0506760
                    *                                                   K0506770
                    RLIND DC      /BFFF     REAL INDICATOR              K0506780
                    ININD DC      /4000     INTEGER INDICATOR           K0506790
                    COMA  DC      /2B       COMMA CONSTANT              K0506800
                    LPAR  DC      /0D-/2B   LEFT PARENTHESIS CONSTANT   K0506810
                    RPAR  DC      /1D-/2B   RIGHT PARENTHESIS CONSTANT  K0506820
                    MART  DC      /3800     EXTERNAL STMNT MASK         K0506830
                    TENTS DC      0         SYMBOL TABLE ADDRESS        K0506840
                    MART1 DC      /0090     EXTERNAL INDICATORS         K0506850
                    SW5   DC      0         SYMBOL TABLE ADDR ADJUST SW K0506860
                    SW4   DC      0         EXTERNAL STMNT SWITCH       K0506870
                    ER22  DC      22        ERROR 22 CONSTANT           K0506880
                    IFIXC DC      /9231     IFIX EBCDIC CON (FIRST WD)  K0506890
                          DC      /99C0     IFIX EBCDIC CON (LAST WD)   K0506900
                    FLT   DC      /8C9A     FLT  EBCDIC CON (FIRST WD)  K0506910
                          DC      /E063     FLT  EBCDIC CON (LAST WD)   K0506920
                    H7E00 DC      /7E00     FIRST NAME CHAR MASK        K0506930
                    H1200 DC      /1200     NAME ALPHA CONSTANT         K0506940
                    H1800 DC      /1800     NAME ALPHA CONSTANT         K0506950
                    SW6   DC      *-*       DIMENSION ERROR SWITCH      K0506960
                    *                                                   K0506970
                    *             PLACE NAME IN SYMBOL TABLE            K0506980
                    *                                                   K0506990
                    PLACQ LD      WORD2     LAST HALF OF NAME           K0507000
                          STO   3 2         NEXT SYMBOL TABLE ENTRY+1   K0507010
                          LD      WORD1     FIRST HALF OF NAME          K0507020
                          STO   3 1         NEXT SYMBOL TABLE ENTRY     K0507030
                          SLA     16                                    K0507040
                          STO   3 0         CLEAR SYMBOL TABLE ID WORD  K0507050
                          MDX  L  EOFST,-3  DECR END SYMBOL TABLE ADDR  K0507060
                          MDX  L  SOFXT,-3  DECR START OF SUBSC TEMPS   K0507070
                          MDX  L  SOFGT,-3  DECR START GENERATED TEMPS  K0507080
                          LD   L  EOFST     CHECK FOR               2-1 K0507090
                          A    L  TWOS      SYMBOL TABLE            2-1 K0507100
                          S    L  EOFS      OVERLAP                 2-1 K0507110
                          BSC  L  JIMMY,+Z  BR IF OVERLAP           2-1 K0507120
                          LD      SW4       EXTERNAL STMNT SWITCH       K0507130
                          BSC  L  TICK,+-   BR IF NOT EXTERNAL STMNT    K0507140
                    MLTN  LD    3 0         SYMBOL TABLE ID WORD        K0507150
                          AND     MART      BR TO ER21 IF EXTERNAL NAME K0507160
                          BSC  L  ER21,Z    IS IN COMMON OR DIMENSION.  K0507170
                          LD    3 0         SYMBOL TABLE ID WORD        K0507180
                          OR      MART1     SET EXTERNAL STMNT INDR     K0507190
                          STO   3 0         RESTORE ID WD               K0507200
                          LD    3 1         FIRST HALF OF NAME          K0507210
                          S       IFIXC     FIRST HALF OF IFIX NAME CON K0507220
                          BSC  L  TICKK,Z   BR IF NAME NOT EQUAL IFIX   K0507230
                          LD    3 2         LAST HALF OF NAME           K0507240
                          S       IFIXC+1   LAST HALF OF IFIX NAME CON  K0507250
                          BSC  L  TICKK,Z   BR IF NAME NOT EQUAL IFIX   K0507260
                    EROR  LD      ER22      SET UP ERROR 22 - IFIX      K0507270
                          STO  L  ERRNO     TEMP ERROR NUMBER      2-11 K0507280
                          BSC  L  CLOSE     BRCH TO INSERT ERROR ID2-11 K0507290
                    TICKK LD    3 1         FIRST HALF OF NAME          K0507300
                          S       FLT       FIRST HALF OF FLT NAME CON  K0507310
                          BSC  L  TICKP,Z   BR NAME NOT EQUAL FLT       K0507320
                          LD    3 2         LAST HALF OF NAME           K0507330
                          S       FLT+1     LAST HALF OF FLT NAME CON   K0507340
                          BSC  L  EROR,+-   BR IF NAME EQUAL FLT        K0507350
                    TICKP LD      SW6                                   K0507360
                          BSC  L  TICKQ,+-  BR IF SW6 IS OFF            K0507370
                          SLA     16                                    K0507380
                          STO     SW6       CLEAR SW6                   K0507390
                          MDX     MOTQS     BR TO MOVE STMNT POINTER    K0507400
                    TICKQ LD    3 1         FIRST NAME WORD             K0507410
                          AND     H7E00     EXTRACT FIRST CHARACTER     K0507420
                          S       H1200                                 K0507430
                          BSC  L  LAP5,+Z   BR IF MINUS TO SET REAL     K0507440
                          S       H1800                                 K0507450
                          BSC  L  LAP5,-Z   BR IF POS TO SET REAL       K0507460
                          MDX     MA        BR TO SET INTEGER INDR      K0507470
                    FUN   LD    3 0         SYMBOL TBL ID WORD          K0507480
                          SLA     8                                     K0507490
                          BSC  L  ER20,+Z   BR IF SUBPROGRAM NAME       K0507500
                    *                                                   K0507510
                    *             CHECK FOR NAME PREVIOUSLY DIMENSIONED K0507520
                    *                                                   K0507530
                          LD    3 0         SYMBOL TBL ID WORD          K0507540
                          SLA     3                                     K0507550
                          BSC  L  ER18,+Z   BR IF MULTIPLE DIMENSION    K0507560
                          SLA     1                                     K0507570
                          BSC  L  ER18,+Z   BR IF MULTIPLE DIMENSION    K0507580
                          LD      SW4       EXTERNAL SWITCH             K0507590
                          BSC  L  TICK,+-   BR IF NOT EXTERNAL STMNT    K0507600
                          STX   0 SW6       TURN ON SWITCH 6            K0507610
                          MDX     MLTN      BR TO CHK EXTERNAL ERROR    K0507620
                    TICK  LD   L  SW2A      REAL/INTEGER SWITCH         K0507630
                          BSC  L  MA,Z      BR TO SET INTEGER INDICATOR K0507640
                    LAP5  LD    3 0         SYMBOL TABLE ID WORD        K0507650
                          AND     RLIND     SET INDICATOR REAL          K0507660
                          MDX     ZZ        BR TO RESTORE ID WORD       K0507670
                    MA    LD    3 0         ID WORD                     K0507680
                          OR      ININD     SET INDICATOR INTEGER       K0507690
                    ZZ    STO   3 0         RESTORE ID WORD             K0507700
                    MOTQS MDX   1 1         INCR STMNT POINTER          K0507710
                          LD    1 0         NEXT STMNT WORD             K0507720
                          S       COMA      COMMA CONSTANT              K0507730
                          BSC  L  BROT,+-   BR IF COMMA                 K0507740
                          S       LPAR      LEFT PARENTHESIS CONSTANT   K0507750
                          BSC  L  SIS,Z     BR NOT LEFT PARENTHESIS     K0507760
                          SLA     16                                    K0507770
                          STO     CNTQ      RESET DIMENSION COUNTER     K0507780
                    *                                                   K0507790
                    *             CHECK FOR SUBPROGRAM OR FUNCTION      K0507800
                    *                                                   K0507810
                          LD   L  SORF      SUBPROGRAM OR FUNCTION INDR K0507820
                          BSC  L  SUBQ,+-   BR IF SUBPROG OR FUNCTION   K0507830
                          LD    3 0         SYMBOL TBL ID WORD          K0507840
                          SLA     2                                     K0507850
                          BSC  L  SUBQ,-    BR IF ALREADY IN COMMON     K0507860
                          MDX  L  FNAME,1   ADJUST FNAME POINTER        K0507870
                    *                                                   K0507880
                    *             SPREAD SYMBOL TABLE FOR DIMENSION WDS K0507890
                    *                                                   K0507900
                    SUBQ  STX   1 SAVIT+1   SAVE STMNT POINTER          K0507910
                          STX   3 TENTS     ADDR OF NAME IN COMMON      K0507920
                          LD   L  TENTS                                 K0507930
                          S    L  EOFST     END OF STRING ADDRESS       K0507940
                          STO  L  TENTS     NUMBER OF WORDS TO MOVE     K0507950
                          LDX  I2 TENTS                                 K0507960
                          MDX   2 -3        DECR WDS TO MOVE COUNT      K0507970
                          MDX     PASSS     BR TO SLIDE TABLE 1 ENTRY   K0507980
                          MDX     GLINE     BR TO CLEAR ENTRY IF ZERO   K0507990
                    PASSS LDX  I1 EOFST     END OF SYMBOL TABLE ADDRESS K0508000
                    LOOP8 LD    1 3         LD WORD TO MOVE             K0508010
                          STO   1 0         SPREAD TABLE THREE WORDS    K0508020
                          MDX   1 1         INCR MOVE POINTER           K0508030
                          MDX   2 -1        DECR CTR, SKIP NEXT IF DONE K0508040
                          MDX     LOOP8     BR TO CONTINUE              K0508050
                    GLINE SLA     16                                    K0508060
                          STO   3 -1        ZERO WD 3 DIMENSION ENTRY   K0508070
                          STO   3 -2        ZERO WD 2 DIMENSION ENTRY   K0508080
                          STO   3 -3        ZERO WD 1 DIMENSION ENTRY   K0508090
                          LD    3 0         ID WORD                     K0508100
                          OR      MUM1      ONE DIMENSION INDICATOR     K0508110
                          STO   3 0         REPLACE IN TABLE ENTRY      K0508120
                          MDX  L  EOFST,-3  DECR END OF SYMBOL TABLE    K0508130
                          MDX  L  SOFXT,-3  DECR START OF SUBSC TEMPS   K0508140
                          MDX  L  SOFGT,-3  DECR START GENERATED TEMPS  K0508150
                    SAVIT LDX  L1 *-*       RESTORE INDEX REGISTER 1    K0508160
                          MDX  L  SW5,1                                 K0508170
                          LD   L  EOFST     CHK FOR SYMBOL TBL OVERLAP  K0508180
                          A       TWOS                                  K0508190
                          S    L  EOFS      END OF STRING               K0508200
                          BSC  L  JIMMY,+Z  BR IF SYMBOL TABLE OVERLAP  K0508210
                    PHIL  MDX   1 1         MOVE STATEMENT POINTER      K0508220
                          LD    1 0         NEXT CHARACTER OF STATEMENT K0508230
                          AND     H6000     CHECK FOR ALPHA CHARACTER   K0508240
                          EOR     H6000                                 K0508250
                          BSC  L  ER8R,Z    BR TO ER8 IF NOT NUMERIC    K0508260
                    *                                                   K0508270
                    *             COLLECT CONSTANT TO BINARY            K0508280
                    *                                                   K0508290
                          LDS     0         RESET OVERFLOW AND CARRY    K0508300
                          SLT     32                                    K0508310
                          STO     SUMMS     CLEAR CONSTANT SUM          K0508320
                          LD    1 0         WORD ONE OF CONSTANT        K0508330
                          STD     TEMP                                  K0508340
                          LD    1 1         WORD TWO OF CONSTANT        K0508350
                          BSC  L  BOT,-     BR ON OPERATOR              K0508360
                          SLA     1         MAKE BITS CONTIGUOUS        K0508370
                          STO     TEMP+1                                K0508380
                          LD    1 2         NEXT STATEMENT WORD         K0508390
                          MDX   1 1         MOVE STMNT POINTER          K0508400
                          BSC  L  ER8R,+    BR ON NO OPERATOR           K0508410
                    BOT   LD      TEMP      WD 1 OF CONSTANT            K0508420
                    BOT1  AND     COT10     AND OUT ALL BUT 1ST 6 BITS  K0508430
                          SLA     2                                     K0508440
                          BSC  L  PILLS,C   BRANCH IF CARRY ON          K0508450
                          BSC  L  NEXT,+-   BR TO CHK FOR ZERO CONSTANT K0508460
                          BSC  L  ER8R      BR IMBEDDED ALPHA CHARACTER K0508470
                    PILLS BSC  L  ER8R,-    BR NOT MINUS                K0508480
                          AND     COT20     EXTRACT DIGIT               K0508490
                          S       NINTS     NINE                        K0508500
                          BSC  L  ER8R,-Z   BR GREATER THAN NINE        K0508510
                          A       NINTS     RESTORE DIGIT               K0508520
                          SRA     11        RIGHT JUSTIFY               K0508530
                          STO     HP1                                   K0508540
                          LD      SUMMS     CUMULATIVE SUM              K0508550
                          SLA     1         TIMES 2                     K0508560
                          STO     TENZ      TEMPORARY STORE             K0508570
                          BSC  L  ER8R,+Z   BR IF TOO LARGE             K0508580
                          SLA     2         TIMES 8                     K0508590
                          BSC  L  ER8R,C+Z  BR IF TOO LARGE             K0508600
                          A       TENZ      TIMES 10                    K0508610
                          A       HP1       UNITS DIGIT                 K0508620
                          BSC  L  ER8R,O    BR TOO LARGE                K0508630
                          STO     SUMMS     CUMULATIVE SUM              K0508640
                          LDD     TEMP      DIGIT TEMPORARY             K0508650
                          SLT     6         SHIFT NEXT DIGIT TO HIGH 6  K0508660
                          STD     TEMP                                  K0508670
                          MDX     BOT1      BR TO PROCESS NEXT DIGIT    K0508680
                    *                                                   K0508690
                    *             CONSTANTS AND WORK AREA               K0508700
                    *                                                   K0508710
                    TENZ  DC      0         CONSTANT TIMES 2 TEMPORARY  K0508720
                    H6000 DC      /6000     ALPHABETIC MASK             K0508730
                    SUMMS DC      0         CUMULATIVE SUM OF CONSTANT  K0508740
                          BSS  E  0         MAKE ADDRESS EVEN           K0508750
                    TEMP  DC      0         2 WORD TEMPORARY FOR        K0508760
                          DC      0         CONSTANT TO BE CONVERTED.   K0508770
                    COT10 DC      /7E00     FIRST NAME CHAR MASK        K0508780
                    COT20 DC      /7800     EXTRACT DIGIT CONSTANT      K0508790
                    HP1   DC      0         UNITS DIGIT TEMPORARY       K0508800
                    CNTQ  DC      0         NUMBER OF CONSTANTS COUNTER K0508810
                    NINTS DC      /4800     DECIMAL NINE CONSTANT       K0508820
                    TWOS  DC      2         DECIMAL TWO CONSTANT        K0508830
                    THREE DC      3         DECIMAL THREE CONSTANT      K0508840
                    MUM1  DC      /0800     ONE DIMENSION INDICATOR     K0508850
                    DIMCL DC      /E7FF     MASK TO REMOVE BITS 3 AND 4 K0508860
                    *                                                   K0508870
                    *             COMPUTE AND STORE DIMENSION CONSTANTS K0508880
                    *                                                   K0508890
                    NEXT  MDX  L  CNTQ,1    INCR CONSTANT COUNTER       K0508900
                          LD      SUMMS     CHECK FOR ZERO CONSTANT     K0508910
                          BSC  L  ER8R,+-   BR IF DIMENSION CON IS ZERO K0508920
                          LD      CNTQ      DIMENSION COUNTER           K0508930
                          S    L  ONE                                   K0508940
                          BSC     Z         SKIP NEXT IF FIRST CONSTANT K0508950
                          MDX     OZ2       BR TO COMPUTE 2ND CONSTANT  K0508960
                          LD      SUMMS     DIMENSION CONSTANT          K0508970
                          STO   3 -1        STORE FIRST DIMENSION       K0508980
                          STO   3 -2        CONSTANT IN ALL 3 WORDS OF  K0508990
                          STO   3 -3        SYMBOL TABLE ENTRY.         K0509000
                          MDX     NEXTS     BR TO GET NEXT STMNT CHAR   K0509010
                    OZ2   S    L  ONE                                   K0509020
                          BSC     Z         SKIP NEXT IF 2ND CONSTANT   K0509030
                          MDX     OZ3       BR TO COMPUTE 3RD CONSTANT  K0509040
                          LD    3 -1        FIRST DIMENSION CONSTANT    K0509050
                          M       SUMMS     SECOND DIMENSION CONSTANT   K0509060
                          SLT     1         BRANCH TO SET ERROR 8   2-7 K0509070
                          BSC  L  ER8R,Z    *IF TOO GREAT           2-7 K0509080
                          SLT     15        SHIFT INTO ACCUMULATOR  2-7 K0509090
                          STO   3 -2        STORE IN SECOND AND THIRD   K0509100
                          STO   3 -3        DIMENSION WORDS.            K0509110
                          MDX     NEXTS     BR TO GET NEXT STMNT CHAR   K0509120
                    OZ3   LD    3 -3        1ST X 2ND DIMENSION CON     K0509130
                          M       SUMMS     THIRD DIMENSION CONSTANT    K0509140
                          SLT     1         BRANCH TO SET ERROR 8   2-7 K0509150
                          BSC  L  ER8R,Z    *IF TOO GREAT           2-7 K0509160
                          SLT     15        SHIFT INTO ACCUMULATOR  2-7 K0509170
                          STO   3 -3        STORE IN THIRD DIMENSION WD K0509180
                    NEXTS MDX   1 1         INCR STMNT POINTER          K0509190
                          LD    1 0         NEXT CHARACTER              K0509200
                          S    L  COMA      COMMA                       K0509210
                          BSC  L  COZ,Z     BR CHK RIGHT PARENTHESIS    K0509220
                          LD      CNTQ      CHK FOR COUNT LESS THAN 3   K0509230
                          S       THREE                                 K0509240
                          BSC  L  ER8R,-    BR IF COUNT THREE OR MORE   K0509250
                          MDX     PHIL      BR TO CONVERT NEXT CONSTANT K0509260
                    COZ   S    L  RPAR      RIGHT PARENTHESIS           K0509270
                          BSC  L  ER8R,Z    BR TO ERR IF NO PARENTHESIS K0509280
                          LD      CNTQ      DIMENSION COUNT             K0509290
                          SLA     11        SHIFT TO BITS 3 AND 4       K0509300
                          STO     TEMP      TEMPORARY                   K0509310
                          LD    3 0         SYMBOL TABLE ID WORD        K0509320
                          AND     DIMCL     SET BITS 3 AND 4 EQUAL TO   K0509330
                          OR      TEMP      THE NUMBER OF DIMENSIONS.   K0509340
                          STO   3 0         SYMBOL TABLE ID WORD        K0509350
                          LD   L  SW5                                   K0509360
                          BSC  L  YELP,Z    BR TO CHECK FOR OVERLAP     K0509370
                          MDX  L  EOFST,-3  DECR END OF SYMBOL TABLE    K0509380
                          MDX  L  SOFXT,-3  DECR START OF SUBSC TEMPS   K0509390
                          MDX  L  SOFGT,-3  DECR START GENERATED TEMPS  K0509400
                    YELP  LD   L  EOFST     CHK FOR SYMBOL TBL OVERLAP  K0509410
                          A       TWOS                                  K0509420
                          S    L  EOFS      END OF STRING               K0509430
                          BSC  L  JIMMY,+Z  BR IF SYMBOL TABLE OVERLAP  K0509440
                          SLA     16        CLEAR ACCUMULATOR           K0509450
                          STO  L  SW5       RESET SWITCH 5              K0509460
                          MDX   1 1         MOVE STMNT POINTER          K0509470
                          LD    1 0         NEXT STMNT CHARACTER        K0509480
                          S    L  COMA      COMMA                       K0509490
                          BSC  L  SIS,Z     BR NOT COMMA                K0509500
                          MDX   1 1         MOVE STMNT POINTER          K0509510
                          LDX  L  ZAR       BR TO CHK FOR LEGAL NAME    K0509520
                    BROT  MDX   1 1         MOVE STMNT POINTER          K0509530
                          LDX  L  ZAR       BR TO CHK FOR LEGAL NAME    K0509540
                    *                                                   K0509550
                    *             CHECK CONTINUE SCAN OR READ NEXT PH   K0509560
                    *                                                   K0509570
                    TAP   LD   L  SW1A                                  K0509580
                          BSC  L  REPAK,Z   GO DO REPACK OF STRING 2-11 K0509590
                          BSC  L  MOVE      BR TO SCAN NEXT STMNT       K0509600
                    SIS   STX  L0 SW3A      SET SYMBOL TBL OPEN SWITCH  K0509610
                          BSC  L  JAP       BR TO TEST FOR SEMI-COLON   K0509620
                    JIMMY MDX  L  ERROR,1   SET OVERLAP ERROR ON        K0509630
                          BSC  L  NXTPH     BR TO READ NEXT PHASE  2-11 K0509640
                    *                                                   K0509650
                    *             PATCH FOR MOD 4                       K0509660
                    *                                                   K0509670
                    PTCH1 S       H1400      IS IT DEFINE FILE      2-4 K0509680
                          BSC     Z          SKIP IF YES            2-4 K0509690
                          S       H0400      IS IT DATA STATEMENT   2-4 K0509700
                          BSC  L  MOVE,+-    YES - MOVE TO NEXTSTMT 2-4 K0509710
                          MDX     TAP        BRANCH TO TEST SW1A    2-4 K0509720
                    *                                                   K0509730
                    H1400 DC      /1400      CONST FOR DEF FILE TST 2-4 K0509740
                    H0400 DC      /0400      CONST FOR DATA TEST    2-4 K0509750
                    *                                                   K0509760
                    MOVE  LD    1 0         STMNT ID               2-11 K0509770
                          SRA     2                                2-11 K0509780
                          AND  L  IDNRM     STMNT WORD COUNT       2-11 K0509790
                          STO     *+1       STORE TO UPDATE        2-11 K0509800
                          MDX  L1 *-*       INCR TO NEXT STMNT     2-11 K0509810
                          BSC  L  DAP       BRCH TO TEST STMNT     2-11 K0509820
                          SPAC    1                                2-11 K0509830
                    ***********************************************2-11 K0509840
                    *                                              2-11 K0509850
                    *     THIS ROUTINE REPACKS THE INPUT STRING    2-11 K0509860
                    *     REMOVING DUMMY ERROR ENTRIES EXCEPT      2-11 K0509870
                    *     PRIOR TO GROUP/OR SINGLE ENTRIES OF      2-11 K0509880
                    *     EQUIVALENCE-DEFINE FILE-OR DATA          2-11 K0509890
                    *     SPECIFICATION STATEMENTS. PRIOR TO THESE 2-11 K0509900
                    *     STATEMENTS THE DUMMY ERROR REMAINS TO    2-11 K0509910
                    *     ACT AS A LINE COUNT PLACE HOLDER.        2-11 K0509920
                    *     IF THE DUMMY ERROR IS KEPT AND/OR IF     2-11 K0509930
                    *     THERE IS A LEGAL ERROR STMNT ID PRESENT  2-11 K0509940
                    *     THE LINE COUNT FOR THAT STATEMENT IS     2-11 K0509950
                    *     OR'ED INTO THE ERROR NUMBERS LEFT MOST   2-11 K0509960
                    *     BITS (0-8)                               2-11 K0509970
                    *                                              2-11 K0509980
                    ***********************************************2-11 K0509990
                          SPAC    1                                2-11 K0510000
                    *                                              2-11 K0510010
                    ***   CONSTANT'S AREA                          2-11 K0510020
                    *                                              2-11 K0510030
                    K0002 DC      /0002     CONSTANT-TWO           2-11 K0510040
                    KA000 DC      /A000     ERROR CONST            2-11 K0510050
                    K0800 DC      /0800     EQUIV/DATA CONST       2-11 K0510060
                    K7000 DC      /7000     IOCS CONST             2-11 K0510070
                    K2800 DC      /2800     DEFINE FILE CONST      2-11 K0510080
                    K5800 DC      /5800     DEFINE FILE CONST      2-11 K0510090
                    LNCNT DC      0         LINE COUNT VALUE       2-11 K0510100
                          SPAC    1                                2-11 K0510110
                    REPAK EQU     *                                2-11 K0510120
                          NOP               FOR DE-BUGGING         2-11 K0510130
                          SLT     32        CLEAR ACCM/EXT         2-11 K0510140
                          STO     LNCNT     ZERO LINE COUNT VALUE  2-11 K0510150
                          LD   L  SOFS      LOAD START OF STRING   2-11 K0510160
                          STO  L  IDADR     SAVE STMNT ID ADRS     2-11 K0510170
                          SPAC    1                                2-11 K0510180
                    CONT  LDX  I1 IDADR     SET XR1 TO IDADR       2-11 K0510190
                          LD    1 0         LOAD STMNT ID          2-11 K0510200
                          RTE     11        SAVE NORM IN EXT       2-11 K0510210
                          SLA     11        RESTORE STMNT ID       2-11 K0510220
                          MDX     RPK02     GO CHECK STMNT ID      2-11 K0510230
                          SPAC    1                                2-11 K0510240
                    RPK01 SLA     16        CLEAR ACCM             2-11 K0510250
                          SLT     9         RESTORE NORM           2-11 K0510260
                          A    L  IDADR     ADD NORM AND STMNT     2-11 K0510270
                          STO  L  IDADR     *ADRS FOR NEXT STMNT   2-11 K0510280
                          MDX     CONT      CONTINUE SCAN          2-11 K0510290
                          SPAC    1                                2-11 K0510300
                    RPK02 EOR     KA000                            2-11 K0510310
                          BSC  L  RPK04,+-  BRCH IF ERROR ID       2-11 K0510320
                          EOR     K0800                            2-11 K0510330
                          BSC  L  RPK03,+-  BRCH IF EQUIV ID       2-11 K0510340
                          EOR     K7000                            2-11 K0510350
                          BSC  L  RPK01,+-  BRCH IF IOCS ID        2-11 K0510360
                          EOR     K2800                            2-11 K0510370
                          BSC  L  RPK03,+-  BRCH IF DEFINE FILE ID 2-11 K0510380
                          EOR     K0800                            2-11 K0510390
                          BSC  L  RPK03,+-  BRCH IF DATA ID        2-11 K0510400
                          MDX     NXTPH     READ IN NEXT PHASE     2-11 K0510410
                          SPAC    1                                2-11 K0510420
                    RPK03 MDX  L  LNCNT,+1  INCREMENT LINE COUNT   2-11 K0510430
                          MDX     RPK01     CONTINUE SCAN          2-11 K0510440
                          SPAC    1                                2-11 K0510450
                    *                                              2-11 K0510460
                    ***   CHECK TYPE OF ERROR STMNT                2-11 K0510470
                    *                                              2-11 K0510480
                    RPK04 MDX  L  LNCNT,+1  INCREMENT LINE COUNT   2-11 K0510490
                          SPAC    1                                2-11 K0510500
                          LD    1 0         LOAD STMNT ID          2-11 K0510510
                          BSC  L  NXTPH,E   BRCH IF NUMBERED       2-11 K0510540
                          SPAC    1                                2-11 K0510550
                          LD    1 1         IS IT A DUMMY ERROR    2-11 K0510560
                          BSC  L  RPK06,+-  YES-BRCH               2-11 K0510570
                          SPAC    1                                2-11 K0510580
                    ***** REAL ERROR'S                             2-11 K0510590
                          SPAC    1                                2-11 K0510600
                    RPK05 LDX  I1 IDADR     RESTORE XR1            2-11 K0510610
                          LD      LNCNT     LOAD LINE COUNT        2-11 K0510620
                          SLA     7         POSITION LNCNT FIELD   2-11 K0510630
                          STO  L  TEMP      STORE AT TEMP          2-11 K0510640
                          LD    1 1         LOAD ERROR NUMBER      2-11 K0510650
                          OR   L  TEMP      OR IN LINE COUNT       2-11 K0510660
                          STO   1 1         STORE BACK ON STRING   2-11 K0510670
                          MDX     RPK01     CONTINUE SCAN          2-11 K0510680
                          SPAC    1                                2-11 K0510690
                    ***** DUMMY ERROR'S                            2-11 K0510700
                          SPAC    1                                2-11 K0510710
                    RPK06 LD    1 2         LOAD NEXT STMNT AND    2-11 K0510720
                          SRA     11        REMOVE NORM            2-11 K0510730
                          SLA     11        RESTORE STMNT ID       2-11 K0510740
                          EOR     KA000     CHECK FOR ERROR ID     2-11 K0510750
                          BSC  L  RPK07,+-  YES-BRCH TO REMOVE     2-11 K0510760
                          EOR     K0800     IF EQUIV STMNT         2-11 K0510770
                          BSC  L  RPK05,+-  ADD IN LINE COUNT      2-11 K0510780
                          EOR     K5800     IF DEFINE FILE         2-11 K0510790
                          BSC  L  RPK05,+-  ADD IN LINE COUNT      2-11 K0510800
                          EOR     K0800     IF DATA STMNT          2-11 K0510810
                          BSC  L  RPK05,+-  ADD IN LINE COUNT      2-11 K0510820
                          SPAC    1                                2-11 K0510830
                    *                                              2-11 K0510840
                    *     THIS ROUTINE REMOVES DUMMY ERROR         2-11 K0510850
                    ***   STMNTS FROM THE INPUT STRING AND         2-11 K0510860
                    *     CLOSES THE STRING UP                     2-11 K0510870
                    *                                              2-11 K0510880
                          SPAC    1                                2-11 K0510890
                    RPK07 LDX  I1 IDADR     SET XR1 TO STMNT ADRS  2-11 K0510900
                          LD   L  IDADR     LOAD STMNT ADRS        2-11 K0510910
                          A       K0002     ADJ FOR ERROR ID       2-11 K0510920
                          STO     *+1       AND SET XR2            2-11 K0510930
                          LDX  L2 *-*       TO NEXT STMNT ADRS     2-11 K0510940
                          SPAC    1                                2-11 K0510950
                          LD   L  EOFS      LOAD END OF STRING ADRS2-11 K0510960
                          S    L  /0002     SUB VALUE IN XR2       2-11 K0510970
                          STO     *+1       AND STORE AS           2-11 K0510980
                          LDX  L3 *-*       RANGE IN XR3           2-11 K0510990
                          MDX   3 +1        ADJ XR3 BY ONE         2-11 K0511000
                          SPAC    1                                2-11 K0511010
                    RPK08 LD    2 0         NEXT WORD TO MOVE      2-11 K0511020
                          STO   1 0         TO NEW ADRS            2-11 K0511030
                          MDX   1 1         INCREMENT TO NEXT WORD 2-11 K0511040
                          MDX   2 1         INCREMENT NEW ADRS     2-11 K0511050
                          MDX   3 -1        DECREMENT RANGE        2-11 K0511060
                          MDX     RPK08     LOOP UNTILL RANGE ZERO 2-11 K0511070
                          SPAC    1                                2-11 K0511080
                          STX  L1 EOFS      NEW END OF STRING      2-11 K0511090
                          MDX     CONT      CONTINUE SCAN          2-11 K0511100
                    *                                                   K0511110
                    *             READ AND GO TO NEXT PHASE             K0511120
                    *                                                   K0511130
                    NXTPH LDX  I1 NXPID+1   LOAD PARAM FOR READING 2-11 K0511140
                          LDD     NXPID+2   NEXT PHASE             2-11 K0511150
                          BSC  L  ROL       BR TO ROLLER TO READ PHASE  K0511160
                          BSS  E  0         MAKE ADDRESS EVEN           K0511170
                    NXPID DC      36        ID OF NEXT PHASE       2-11 K0511180
                          BSS     3         LOADER TBL FOR NEXT PHASE   K0511190
                    *                                                   K0511200
                          BSS     BPHAR+PHLEN*320-1-*   PATCH AREA      K0511210
                          DC      0                                     K0511220
                          END     BPHAR-2                               K0511230
