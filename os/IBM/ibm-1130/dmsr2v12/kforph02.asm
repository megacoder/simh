                          HDNG    1130 FORTRAN COMPILER PHASE 2         K0200010
                    *************************************************** K0200020
                    *             PDUMP PROCESSING INCLUDED           * K0200030
                    *************************************************** K0200040
                    *************************************************** K0200050
                    *STATUS - VERSION 2, MODIFICATION LEVEL 11        * K0200060
                    *                                                 * K0200070
                    *FUNCTION/OPERATION-                              * K0200080
                    *   * DETERMINES THE STMNT TYPE FOR EACH STMNT,   * K0200090
                    *     INSERTS THE TYPE CODE INTO THE STMNT ID WORD* K0200100
                    *   * PLACES THE TERMINAL CHARACTER AT THE END OF * K0200110
                    *     EACH STATEMENT                              * K0200120
                    *   * CONVERTS SUBPROGRAM NAMES LONGER THAN FIVE  * K0200130
                    *     CHARACTERS TO FIVE-CHARACTER NAMES          * K0200140
                    *   * CONVERTS FORTRAN-SUPPLIED SUBPROGRAM NAMES  * K0200150
                    *     ACCORDING TO THE SPECIFIED PRECISION        * K0200160
                    *                                                 * K0200170
                    *ENTRY POINTS-                                    * K0200180
                    *   START-PHASE 2 IS READ INTO CORE BY PHASE 1    * K0200190
                    *         AND EXECUTION BEGUN AT LOCATION START   * K0200200
                    *                                                 * K0200210
                    *INPUT-                                           * K0200220
                    *   NONE IN THE USUAL SENSE. HOWEVER, THE STMNT   * K0200230
                    *   STRING SCANNED BY THE COMPILER MAY BE         * K0200240
                    *   CONSIDERED INPUT                              * K0200250
                    *                                                 * K0200260
                    *OUTPUT-                                          * K0200270
                    *   NONE IN THE USUAL SENSE. HOWEVER, THE STMNT   * K0200280
                    *   STRING ALTERED BY THE COMPILER MAY BE         * K0200290
                    *   CONSIDERED OUTPUT                             * K0200300
                    *                                                 * K0200310
                    *EXTERNAL ROUTINES-N/A                            * K0200320
                    *                                                 * K0200330
                    *EXITS-                                           * K0200340
                    *   NORMAL-                                       * K0200350
                    *      PHASE EXITS NORMALLY IF NO ERRORS ARE      * K0200360
                    *      FOUND. PHASE 3 IS LOADED AND EXECUTED.     * K0200370
                    *   ERROR-                                        * K0200380
                    *      THE OVERFLOW OF COMPILER PROCESSING IS NOT * K0200390
                    *      INTERRUPTED WHEN AN ERROR IS ENCOUNTERED.  * K0200400
                    *      AN ERROR STMNT REPLACES THE FAULTY STMNT   * K0200410
                    *      ON THE STRING AND STMNT SCANNING PROCESS   * K0200420
                    *      CONTINUES. AN EXCEPTION OCCURS IN THE CASE * K0200430
                    *      OF AN OVERLAP ERROR. COMPILATION IS        * K0200440
                    *      ABORTED AND CONTROL IS PASSED FROM PHASE   * K0200450
                    *      TO SUCCEEDING PHASE UNTIL AN OUTPUT PHASE  * K0200460
                    *      IS REACHED WHICH CAN PRINT AN ERROR MESSAGE* K0200470
                    *      THE ERROR DETECTED BY PHASE 2 IS 4.        * K0200480
                    *                                                 * K0200490
                    *TABLES/WORK AREAS-                               * K0200500
                    *   NONE EXCEPT STATEMENT STRING AREA, SYMBOL     * K0200510
                    *   TABLE, AND FORTRAN COMMUNICATION AREA         * K0200520
                    *                                                 * K0200530
                    *ATTRIBUTES-N/A                                   * K0200540
                    *                                                 * K0200550
                    *NOTES-                                           * K0200560
                    *   THE SWITCHES USED IN PHASE 2 FOLLOW. IF NON-  * K0200570
                    *   ZERO, THE SWITCH IS TRANSFER=T. IF ZERO, THE  * K0200580
                    *   SWITCH IS NORMAL=N.                           * K0200590
                    *      * SW1-REAL OR INTEGER INDICATOR            * K0200600
                    *            T#STATEMENT IS REAL OR INTEGER       * K0200610
                    *      * SW2-DO INDICATOR                         * K0200620
                    *            T#STATEMENT IS DO                    * K0200630
                    *      * SW3-WHICH HALF OF WORD IS CHARACTER      * K0200640
                    *            T#RIGHT HALF                         * K0200650
                    *      * SW4-CONTENTS OF 'NAMS'                   * K0200660
                    *            T#CHARACTER IN NAMS                  * K0200670
                    *      * SW5-TYPE OF ARGUMENT TO MAKE CHARACTER   * K0200680
                    *            T#OPERATOR                           * K0200690
                    *      * SW6-POSITION IN STATEMENT                * K0200700
                    *            T#END OF STATEMENT                   * K0200710
                    *      * SW7-DATA INDICATOR                       * K0200720
                    *            T#STATEMENT IS DATA                  * K0200730
                    *      * SW8-QUOTE ENCOUNTERED                    * K0200740
                    *            N#NOT ENCOUNTERED                    * K0200750
                    *      * SW9-OUTPUT WHICH HALF OF WORD            * K0200760
                    *            N#LEFT HALF                          * K0200770
                    *            T#RIGHT HALF                         * K0200780
                    *                                                 * K0200790
                    *************************************************** K0200800
                          ABS                                           K0200810
                    *                                                   K0200820
                    *                       SYSTEM EQUATES              K0200830
                    MEMRY EQU     /8000                                 K0200840
                    OVERL EQU     MEMRY-1501 START OF FCOM              K0200850
                    ROL   EQU     MEMRY-68   LOCN OF RTN TO READ NXT PH K0200860
                    $PHSE EQU     /78        NO. OF PHASE NOW IN CORE   K0200870
                          ORG     OVERL                                 K0200880
                    PHID  EQU     32         ID NUMBER THIS PHASE       K0200890
                    *                                                   K0200900
                    *                  FORTRAN COMMUNICATION AREA       K0200910
                    ORG   BSS     1    ORIGIN ADDRESS               2-5 K0200915
                    SOFS  BSS     1    START OF STRING                  K0200920
                    EOFS  BSS     1    END OF STRING                    K0200930
                    SOFST BSS     1    START OF SYMBOL TABLE            K0200940
                    SOFNS BSS     1    START OF NON-STATEMENT NUMBERS   K0200950
                    SOFXT BSS     1    START OF SUBSCRIPT TEMPORARIES   K0200960
                    SOFGT BSS     1    START OF GENERATED TEMPORARIES   K0200970
                    EOFST BSS     1    END OF SYMBOL TABLE              K0200980
                    COMON BSS     1    NEXT AVAILABLE COMMON            K0200990
                    CSIZE BSS     1    SIZE OF COMMON                   K0201000
                    ERROR BSS     1    OVERLAP ERROR                    K0201010
                    FNAME BSS     1    PROGRAM NAME                     K0201020
                          BSS     1                                     K0201030
                    SORF  BSS     1    SUBROUTINE(-) OR FUNCTION(+)     K0201040
                    CCWD  BSS     1    CONTROL CARD WORD                K0201050
                    *                BIT 15 TRANSFER TRACE              K0201060
                    *                BIT 14 ARITHMETIC TRACE            K0201070
                    *                BIT 13 EXTENDED PRECISION          K0201080
                    *                BIT 12 LIST SYMBOL TABLE           K0201090
                    *                BIT 11 LIST SUBPROGRAM NAMES       K0201100
                    *                BIT 10 LIST SOURCE PROGRAM         K0201110
                    *                BIT  8 ORIGIN                      K0201120
                    IOCS  BSS     1    IOCS CONTROL CARD WORD           K0201130
                    *                BIT 15 CARD                        K0201140
                    *                BIT 14 PAPER TAPE                  K0201150
                    *                BIT 13 TYPEWRITER                  K0201160
                    *                BIT 12 1403 PRINTER                K0201170
                    *                BIT 11 2501 READER                 K0201180
                    *                BIT 10 KEYBOARD                    K0201190
                    *                BIT  9 1442 PUNCH                  K0201200
                    *                BIT  8 DISK                        K0201210
                    *                BIT  7 1132 PRINTER                K0201220
                    *                BIT  3 PLOTTER                     K0201230
                    *                                                   K0201240
                    DFCNT BSS     1                                     K0201250
                    *                                                   K0201260
                    *                                                   K0201270
                    *                  END OF FORTRAN COMMUNICATION     K0201280
                    *                  AREA                             K0201290
                    *                                                   K0201300
                    *                                                   K0201310
                    BPHAR EQU     *+2                                   K0201320
                          DC      0          LOADER WORK AREA           K0201330
                          DC      -32        -PHASE ID FOR SLET LOOKUP  K0201340
                          DC      NXTPH-*+1  TABLE FOR NEXT PHASE ENTRY K0201350
                          DC      1          ONE ENTRY TO BE SET BY LDR K0201360
                          ORG     *-2                                   K0201370
                    START LDX   1 PHID       GET PHASE ID NUMBER        K0201380
                          STX  L1 $PHSE      STORE IN CORE PHASE LOC    K0201390
                    *                                                   K0201400
                    *                  CHECKS THE FORTRAN COMMUNICATION K0201410
                    *                  AREA ERROR WORD FOR AN OVERLAP   K0201420
                    *                  CONDITION                        K0201430
                          LD      ERROR      IS THERE OVERLAP ERROR     K0201440
                          BSC  L  ORGCK,+-  BRANCH IF NOT          2-11 K0201450
                    *                                                   K0201460
                    *                  TRANSFERS TO THE ROL ROUTINE     K0201470
                    *                  TO LOAD THE NEXT PHASE           K0201480
                    WAIT  LDX  I1 NXTPH+1    LOAD PARAM FOR READING     K0201490
                          LDD     NXTPH+2    NEXT PHASE                 K0201500
                          BSC  L  ROL        GO TO READ NEXT PHASE      K0201510
                          BSS  E  0                                     K0201520
                    NXTPH DC      33         ID OF NEXT PHASE           K0201530
                          BSS     3          LOADER TBL FOR NEXT PHASE  K0201540
                    *                                                   K0201550
                    *                  MOVES THE ENTIRE STATEMENT       K0201560
                    *                  STRING NEXT TO THE SYM TBL       K0201570
                    BACK  LD      EOFS       LOAD END OF STRING ADDRESS K0201580
                          S       SOFS       SUBTRACT START OF STRING   K0201590
                          STO     *+1        TO GET SIZE OF STRING - 1  K0201600
                          LDX  L3 *-*        LOAD SIZE IN XR3           K0201610
                          MDX   3 1          GET SIZE OF STRING         K0201620
                    *                                                   K0201630
                          LDX  I2 EOFS       INITIALIZE POINTERS FOR    K0201640
                          LDX  I1 EOFST      MOVING STRING UP TO SYMBOL K0201650
                          LD    2 0          TABLE                      K0201660
                    *                                                   K0201670
                          STO   1 +2         MOVE WORD FROM STRING TO   K0201680
                          MDX   1 -1         SYMBOL TABLE - MOVE        K0201690
                          MDX   2 -1         POINTERS - DECREMENT       K0201700
                          MDX   3 -1         COUNTER OF RANGE OF LOOP   K0201710
                          MDX     *-6        CONTINUE LOOP              K0201720
                    *                                                   K0201730
                          MDX   1 3          RESET INPUT POINTER        K0201740
                          LDX  I2 SOFS       RESET OUTPUT POINTER       K0201750
                          BSC  L  CQCT       CHECK FOR NONPROCESS,PUNCH K0201760
                    *                                                   K0201770
                    *                  MOVES STMNTS FROM THE INPUT      K0201780
                    *                  STRING TO THE OUTPUT STRING      K0201790
                    MOVE  LD    1 0          LOAD STATEMENT ID WORD     K0201800
                          AND     S07FC      ZERO ALL BUT NORM          K0201810
                          SRA     2          MOVE NORM TO RIGHT         K0201820
                          STO     XTE1       SET NORM COUNTER           K0201830
                    *                                                   K0201840
                    MXS   LD    1 0          LOAD ID WORD               K0201850
                          BSI  L  PUT        PUT ON OUTPUT STRING       K0201860
                          MDX   1 1          MOVE INPUT POINTER         K0201870
                          MDX  L  XTE1,-1    DECREMENT NORM COUNTER     K0201880
                          MDX     MXS        CONTINUE LOOP              K0201890
                    *                                                   K0201900
                    *                  MOVE TO NEXT STATEMENT           K0201910
                    MOVE1 LDX  L1 *-*        MOVE INPUT POINTER TO      K0201920
                    IDSV  EQU     *-1        NEXT STATEMENT             K0201930
                    *                                                   K0201940
                    *                  INITIALIZES FOR A SCAN OF        K0201950
                    *                  THE STMNT STRING                 K0201960
                    ZAO   LD    1 0          LOAD STATEMENT ID WORD     K0201970
                          SLA     5          SHIFT TO GET NORM          K0201980
                          SRA     7                                     K0201990
                          STO     *+1                                   K0202000
                    ZA0A  LDX  L3 *-*        SAVE NORM IN XR3           K0202010
                          STX   1 IDSV       SAVE INPUT POINTER         K0202020
                    *                                                   K0202030
                          LD      ZA0A+1     ADD NORM TO POINTER TO GET K0202040
                          A       IDSV       ADDRESS OF NEXT STATEMENT  K0202050
                          STO     IDSV                                  K0202060
                    *                                                   K0202070
                          LD    1 0          LOAD ID WORD               K0202080
                          BSC     E          DOES STMNT HAVE STMNT NO.  K0202090
                          MDX   3 -2         YES, MODIFY NORM CTR       K0202100
                    *                                                   K0202110
                          MDX   3 -1         MODIFY CTR SO HAVE SIZE OF K0202120
                          NOP                STMNT WITHOUT ID WORD AND  K0202130
                          STX  L3 NCNT       STATEMENT NUMBER           K0202140
                    *                                                   K0202150
                          STX  L3 NCNTS      SAVE MODIFIED NORM         K0202160
                    *                                                   K0202170
                    *                  CHECK FOR SPECIAL END INDICATOR  K0202180
                    ZA1   LD    1 0          LOAD STATEMENT ID WORD     K0202190
                          SRA     11         GET ID TYPE CODE           K0202200
                          S       ENDC       CHECK FOR END TYPE CODE    K0202210
                          BSC  L  ZA1B,Z     BRANCH IF NOT END          K0202220
                    *                                                   K0202230
                    *                                                   K0202240
                          LD   L  ERID       LOAD ERROR STMNT ID WORD   K0202250
                          BSI  L  PUT        PUT WORD ON OUTPUT STRING  K0202260
                          LD      ERNO2      LOAD ERROR NUMBER          K0202270
                          BSI  L  PUT        PUT NO. ON OUTPUT STRING   K0202280
                    *                                                   K0202290
                    *                  PLACES THE END STMNT ID WORD     K0202300
                    *                  ON THE STRING                    K0202310
                    ZA1A  STX  L2 EOFS       SET END OF STRING ADDRESS  K0202320
                          LD      S1000      LOAD END STMNT ID WORD     K0202330
                          BSI  L  PUT        PUT WORD ON OUTPUT STRING  K0202340
                          BSC  L  CALLC      GO TO PHASE EXIT           K0202350
                    *                                                   K0202360
                    *                  CHECKS FOR ARITHMETIC STMNTS     K0202370
                    ZA1B  S       ATHC       HAS STMNT BEEN CLASSIFIED  K0202380
                          BSC  L  MOVE,Z     YES, GO CHECK STMNT        K0202390
                    *                                                   K0202400
                    *                  INITIALIZE GET SUBROUTINE        K0202410
                          STX   1 IDSV1      SAVE INPUT POINTER         K0202420
                          LD    1 0          LOAD STMNT ID WORD         K0202430
                          BSC     E          HAS STMNT NO.              K0202440
                          MDX   1 2          YES, MOVE POINTER OVER NO. K0202450
                          MDX   1 1          MOVE POINTER TO FIRST WORD K0202460
                          STX   1 IDSA1      AFTER ID - SAVE ADDRESS    K0202470
                    *                                                   K0202480
                          SLA     16                                    K0202490
                          STO  L  SW3        CLEAR SWITCH 3             K0202500
                          STO  L  SW6        CLEAR SWITCH 6             K0202510
                          STO     SW7        CLEAR SWITCH 7             K0202520
                          STO     SW8        CLEAR SWITCH 8             K0202530
                          STO     SW9        CLEAR SWITCH 9             K0202540
                    *                                                   K0202550
                    *                                                   K0202560
                    *                  CHECKS THE ARITHMETIC STMNT      K0202570
                    *                  FOR THE VARIOUS TYPES OF OPTRS   K0202580
                    ZA2   BSI  L  GET1       GET CHAR FROM INPUT STRING K0202590
                          STO     X          SAVE CHARACTER             K0202600
                    *                                                   K0202610
                    *                                                   K0202620
                          S       SLHHS      IS CHARACTER SLASH         K0202630
                          BSC  L  ZA5,+-     BRANCH IF YES              K0202640
                    *                                                   K0202650
                    *                                                   K0202660
                          LD      X                                     K0202670
                          S       EQUC       IS CHARACTER EQUAL SIGN    K0202680
                          BSC  L  ZA3,+-     BRANCH IF YES              K0202690
                    *                                                   K0202700
                    *                                                   K0202710
                          LD      X          IS CHARACTER ZERO          K0202720
                          BSC  L  ZA2,Z      BRANCH IF NOT              K0202730
                          MDX     ZA5        BRANCH - END OF STMNT      K0202740
                    *                                                   K0202750
                    *                                                   K0202760
                    ZA3   BSI  L  GET1       GET CHAR FROM INPUT STRING K0202770
                          STO     X          SAVE CHARACTER             K0202780
                    *                                                   K0202790
                    *                                                   K0202800
                          S       CMAC       IS CHARACTER COMMA         K0202810
                          BSC  L  ZA5,+-     BRANCH IF YES              K0202820
                    *                                                   K0202830
                    *                                                   K0202840
                          S       LPC        IS CHAR LEFT PARENTHESIS   K0202850
                          BSC  L  ZA4,+-     BRANCH IF YES              K0202860
                    *                                                   K0202870
                    *                                                   K0202880
                          LD      X                                     K0202890
                          BSC  L  ZA3,Z      BRANCH IF NOT END OF STMNT K0202900
                    *                                                   K0202910
                    *                  INITIALIZE  GET SUBROUTINE       K0202920
                    ZA4   LDX  L1 *-*        LOAD STATEMENT ID WORD     K0202930
                    IDSA1 EQU     *-1                                   K0202940
                          STO  L  SW3        CLEAR SWITCH 3             K0202950
                          STO  L  SW4        CLEAR SWITCH 4             K0202960
                          STO  L  SW6        CLEAR SWITCH 6             K0202970
                          LD   L  NCNTS      RESET NORM TO              K0202980
                          STO  L  NCNT       ORIGINAL VALUE             K0202990
                    *                                                   K0203000
                    *                  PUT ARITHMETIC ID WORD IN IDWD   K0203010
                          SLA     16         GET ARITHMETIC ID WORD     K0203020
                          STO     IDWD       STORE IN ID WORD           K0203030
                          MDX     ZA6        GO PUT ON OUTPUT STRING    K0203040
                    *                                                   K0203050
                    *                  CONSTANTS                        K0203060
                    ERNO2 DC      3          ERROR NO. 3                K0203070
                    S07FC DC      /07FC      NORM MASK                  K0203080
                    XTE1  DC      0          NORM COUNTER               K0203090
                    ENDC  DC      /02        END STMNT ID TYPE          K0203100
                    S1000 DC      /1004      END STMNT ID WORD          K0203110
                    ATHC  DC      /00-/02    ARITHMETIC STMNT ID TYPE   K0203120
                    IDSV1 DC      0          INPUT POINTER              K0203130
                    EQUC  DC      /7E        EQUAL SIGN                 K0203140
                    CMAC  DC      /6B        COMMA                      K0203150
                    LPC   DC      /4D-/6B    LEFT PARENTHESIS           K0203160
                    IDWD  DC      0          ID WORD                    K0203170
                    REALC DC      /4800      REAL STMNT ID TYPE         K0203180
                    INTC  DC      /5000-/4800   INTEGER STMNT ID TYPE   K0203190
                    DOC   DC      /5800-/5000   DO STMNT ID TYPE        K0203200
                    EIGHT DC      8          EIGHT                      K0203210
                    SW7   DC      *-*        SWITCH 7                   K0203220
                    SW8   DC      *-*        SWITCH 8                   K0203230
                    SW9   DC      *-*        SWITCH 9                   K0203240
                    SW10  DC      *-*        PDUMP SWITCH               K0203250
                    SW1   DC      0          SWITCH 1                   K0203260
                    SW2   DC      0          SWITCH 2                   K0203270
                    X     DC      0          TEMPORARY STORAGE          K0203280
                    SLHHS DC      /61        SLASH                      K0203290
                    *                                                   K0203300
                    *                                                   K0203310
                    ZA5   LDX  I1 IDSA1      SET POINTER AT STMNT ID    K0203320
                          SLA     16                                    K0203330
                          STO  L  SW3        CLEAR SWITCH 3             K0203340
                          STO  L  SW4        CLEAR SWITCH 4             K0203350
                          STO  L  SW6        CLEAR SWITCH 6             K0203360
                          LD   L  NCNTS      RESET NORM TO              K0203370
                          STO  L  NCNT       ORIGINAL VALUE             K0203380
                    *                                                   K0203390
                    *                                                   K0203400
                          BSI  L  GETID      GET ID TYPE                K0203410
                    *                                                   K0203420
                    *                                                   K0203430
                          LD      IDWD       LOAD ID WORD               K0203440
                          S    L  ID4B+2     IS DATA STATEMENT          K0203450
                          BSC  L  *+2,Z      BRANCH IF NO               K0203460
                          STX  L0 SW7        SET DATA STMNT INDICATOR   K0203470
                    *                                                   K0203480
                    *                                                   K0203490
                          LD      IDWD       LOAD ID WORD               K0203500
                          S    L  ID7+2      IS END STATEMENT           K0203510
                          BSC  L  ZA1A,+-    BRANCH IF YES              K0203520
                          LD      IDWD      LOAD ID WORD            2-1 K0203530
                          S    L  ID17+3    SUBTRACT RETURN ID      2-1 K0203540
                          OR   L  SW6       OR END OF STATEMENT INDR2-1 K0203550
                          BSC  L  ER,+-     BR TO ERROR IF RETURN   2-1 K0203560
                    *                       AND NOT END OF STATEMENT2-1 K0203570
                    *                                                   K0203580
                    *                  CALL PDUMP                       K0203590
                          LD      IDWD       LOAD ID WORD               K0203600
                          S    L  ID1L+5     TEST FOR PDUMP             K0203610
                          BSC  L  ZA6,Z      BRANCH IF NOT              K0203620
                    ZA51  LD   L  ID2+2      SET ID TO CALL             K0203630
                          STO     IDWD                                  K0203640
                          STX     SW10       SET PDUMP SWITCH           K0203650
                    *                                                   K0203660
                    *             RESET POINTERS BACK TO NAME           K0203670
                    *                                                   K0203680
                          MDX   1 -2         RESET INPUT STRING POINTER K0203690
                          SLA     16                                    K0203700
                          STO     SW3        RESET LEFT-RIGHT SWITCH    K0203710
                          MDX  L  NCNT,2     RESET WORD COUNTERS        K0203720
                          MDX  L  NCNTS,2    *                          K0203730
                    *                                                   K0203740
                    *                                                   K0203750
                    *                  PUT ID WORD ON THE NEW STRING    K0203760
                    ZA6   STX  L2 IDSV2      STORE OUTPUT POINTER       K0203770
                          LDX  I3 IDSV1      LOAD ADDR OF STMNT ID WD   K0203780
                          LD    3 0                                     K0203790
                          OR      IDWD                                  K0203800
                          BSI  L  PUT        PLACE ID WORD ON STRING    K0203810
                    *                                                   K0203820
                          LD    3 0          LOAD ID WORD               K0203830
                          BSC     E          HAS STMNT NO.              K0203840
                          MDX     *+1        YES, GO PUT NO. ON STRING  K0203850
                          MDX     *+6        NO, GO SCAN BODY OF STMNT  K0203860
                    *                                                   K0203870
                          LD    3 1          LOAD 1ST WORD OF STMNT NO. K0203880
                          BSI  L  PUT        PUT ON OUTPUT STRING       K0203890
                          LD    3 2          LOAD 2ND WORD OF STMNT NO. K0203900
                          BSI  L  PUT        PUT ON OUTPUT STRING       K0203910
                    *                                                   K0203920
                    *                  INITIALIZE TO SCAN BODY OF STATE K0203930
                          SLA     16         CLEAR SWITCHES             K0203940
                          STO     SW1                                   K0203950
                          STO     SW2                                   K0203960
                          STO     FCNT                                  K0203970
                    *                                                   K0203980
                    *                  IS IDWD REAL OR INTEGER          K0203990
                          LD      IDWD       LOAD ID WORD               K0204000
                          S       REALC      IS IT REAL                 K0204010
                          BSC  L  *+3,+-     BRANCH IF YES              K0204020
                          S       INTC       IS IT INTEGER              K0204030
                          BSC  L  ZA7,Z      BRANCH IF NOT              K0204040
                    *                                                   K0204050
                    *                  TAG SW1                          K0204060
                          STX   0 SW1        SET REAL/INTEGER INDICATOR K0204070
                          MDX     ZA8        GO GET NEXT CHARACTER      K0204080
                    *                                                   K0204090
                    *                                                   K0204100
                    ZA7   S       DOC        IS IT DO STMNT             K0204110
                          BSC  L  ZA8,Z      BRANCH IF NOT              K0204120
                    *                                                   K0204130
                    *                  TAG SW2                          K0204140
                          STX   0 SW2        SET DO INDICATOR           K0204150
                    *                                                   K0204160
                    *                                                   K0204170
                    ZA8   BSI  L  GET1       GET CHAR FROM INPUT STRING K0204180
                          STO     X          STORE CHAR                 K0204190
                    *                                                   K0204200
                    *                                                   K0204210
                          LD      SW1        IS IT REAL/INTEGER STMNT   K0204220
                          BSC  L  ZA11,+-    BRANCH IF NOT              K0204230
                    *                                                   K0204240
                    *                                                   K0204250
                          LD      FCNT       LOAD FUNCTION LETTER CTR   K0204260
                          S       EIGHT      ALL LETTERS COMPARED       K0204270
                          BSC  L  ZA9,+-     YES, GO PUT ON ISOLATOR    K0204280
                    *                                                   K0204290
                    *                                                   K0204300
                          MDX  L  FCNT,1     MODIFY FUNCTION LETTER CTR K0204310
                    *                                                   K0204320
                    *                  ISOLATES THE WORD FUNCTION IN    K0204330
                    *                  A TYPE STMNT ON THE STRING       K0204340
                          LDX  L3 *-*        LOAD XR3 WITH              K0204350
                    FCNT  EQU     *-1        FUNCTION LETTER COUNTER    K0204360
                    *                                                   K0204370
                          LD   L3 FUNT-1     LOAD LETTER FROM TABLE     K0204380
                          S       X          DOES IT MATCH STRING CHAR  K0204390
                          BSC  L  ZA12,+-    BRANCH IF YES              K0204400
                          MDX     ZA10       GO NORMALIZE SWITCH 1      K0204410
                    *                                                   K0204420
                    *                                                   K0204430
                    ZA9   LD      COLON      LOAD COLON                 K0204440
                          BSI  L  MAKE       CONVERT CHAR FOR OUTPUT    K0204450
                    *                                                   K0204460
                    *                  NORMALIZE SW1                    K0204470
                    ZA10  SLA     16                                    K0204480
                          STO     SW1        CLEAR REAL/INTEGER SWITCH  K0204490
                          MDX     ZA12       GO TEST FOR LAST CHAR      K0204500
                    *                                                   K0204510
                    *                  ISOLATES STMNT NUMBERS IN        K0204520
                    *                  DO STATEMENTS                    K0204530
                    ZA11  LD      SW2        IS IT DO STMNT             K0204540
                          BSC  L  ZA12,+-    BRANCH IF NOT              K0204550
                    *                                                   K0204560
                    *                  IS X NUMERIC                     K0204570
                          LD      X          LOAD CHARACTER             K0204580
                          SLA     11         SHIFT LEFT 11              K0204590
                          BSC  L  *+2,-      FIRST TEST FOR NUMERIC     K0204600
                          BSC  L  ZA12,C     SECOND TEST-BRANCH NUMERIC K0204610
                    *                                                   K0204620
                    *                                                   K0204630
                          LD      COLON      LOAD COLON                 K0204640
                          BSI  L  MAKE       CONVERT CHAR FOR OUTPUT    K0204650
                    *                                                   K0204660
                    *                  NORMALIZE SW2                    K0204670
                          SLA     16                                    K0204680
                          STO  L  SW2        CLEAR DO INDICATOR         K0204690
                    *                                                   K0204700
                    *                                                   K0204710
                    ZA12  LD   L  X          LOAD CHARACTER             K0204720
                          BSC  L  ZA13,+-    BRANCH IF FINISHED STMNT   K0204730
                    *                                                   K0204740
                    *                                                   K0204750
                          LD   L  X          LOAD CHARACTER             K0204760
                          BSI  L  MAKE       CONVERT CHAR FOR OUTPUT    K0204770
                          MDX     ZA8        CONTINUE CHECK LOOP        K0204780
                    *                                                   K0204790
                    *                  CONSTANTS                        K0204800
                    SW3   DC      0          SWITCH 3                   K0204810
                    SW4   DC      0          SWITCH 4                   K0204820
                    FUNT  DC      /C6        F                          K0204830
                          DC      /E4        U                          K0204840
                          DC      /D5        N                          K0204850
                          DC      /C3        C                          K0204860
                          DC      /E3        T                          K0204870
                          DC      /C9        I                          K0204880
                          DC      /D6        O                          K0204890
                          DC      /D5        N                          K0204900
                    COLON DC      /3A        COLON                      K0204910
                    QSX1  DC      0          TEMPORARY STORAGE          K0204920
                    SF803 DC      /F803      CLEAR NORM MASK            K0204930
                    SFF   DC      /FF        CLEAR LEFT 8 BITS MASK     K0204940
                    SEMI  DC      /1E        SEMI-COLON                 K0204950
                    PDMP  DC      /D808      DUMMY ZERO VARIABLE TO     K0204960
                          DC      /5F00      TERMINATE PDUMP CALL       K0204970
                    *                                                   K0204980
                    *                                                   K0204990
                    *                  PLACES THE STMNT TERMINATOR      K0205000
                    *                  (SEMI-COLON) AT THE END OF THE   K0205010
                    *                  STATEMENT                        K0205020
                    ZA13  LD      SEMI       LOAD SEMI-COLON            K0205030
                          BSI  L  MAKE       CONVERT CHAR FOR OUTPUT    K0205040
                    *                                                   K0205050
                    *                                                   K0205060
                          LD   L  IDWD       LOAD ID WORD               K0205070
                          S    L  ID4+4      IS CONTINUE STMNT          K0205080
                          BSC  L  QZA1,Z     BRANCH IF NO               K0205090
                    *                                                   K0205100
                    *                                                   K0205110
                          MDX   2 -1         DECREMENT OUTPUT POINTER   K0205120
                    *                                                   K0205130
                    *                  INSERT THE STATEMENT NORM        K0205140
                    *                  STMNT ID WORD                    K0205150
                    QZA1  STX   2 QSX1       STORE OUTPUT POINTER       K0205160
                          LD      QSX1                                  K0205170
                          S       IDSV2      SUBTRACT START ADDRESS TO  K0205180
                          SLA     2          GET NORM - MOVE IN ID WORD K0205190
                          STO     QSX1                                  K0205200
                    *                                                   K0205210
                          LD   L  *-*        LOAD STATEMENT             K0205220
                    IDSV2 EQU     *-1        ID WORD                    K0205230
                    *                                                   K0205240
                          AND     SF803      ZERO NORM                  K0205250
                          OR      QSX1       INSERT NEW NORM            K0205260
                          STO  I  IDSV2      PUT BACK ON STRING         K0205270
                          LD   L  SW10       TEST FOR PDUMP CALL        K0205280
                          BSC  L  MOVE1,+-   BRANCH IF NO CALL          K0205290
                          LD      PDMP       OUTPUT INTERNAL FORMAT ID  K0205300
                          BSI  L  PUT                                   K0205310
                          LD      PDMP+1     OUTPUT ZERO CONSTANT       K0205320
                          BSI  L  PUT                                   K0205330
                          SLA     16                                    K0205340
                          STO  L  SW10       CLEAR PDUMP SWITCH         K0205350
                          BSC  L  MOVE1      GO TO NEXT STATEMENT       K0205360
                    *                                                   K0205370
                    *                                                   K0205380
                    *                  GETS A CHAR FROM THE I/P STRING  K0205390
                    GET1  DC      0          RETURN ADDRESS             K0205400
                          LD   L  SW3        IS CHAR IN RIGHT HALF      K0205410
                          BSC  L  GXY1,Z     BRANCH IF NOT              K0205420
                    *                                                   K0205430
                    *                                                   K0205440
                          LD      SW6        IS IT END OF STMNT         K0205450
                          BSC  L  GXY4,Z     BRANCH IF NOT              K0205460
                    *                                                   K0205470
                    *                  TAG SW3                          K0205480
                          STX  L0 SW3        SET RIGHT HALF INDICATOR   K0205490
                    *                                                   K0205500
                    *                  GET LEFT CHARACTER               K0205510
                          LD    1 0          LOAD WORD FROM STRING      K0205520
                          SRA     8          UNPACK - GET LEFT HALF     K0205530
                          MDX     GXY3       GO TO RETURN               K0205540
                    *                                                   K0205550
                    *                                                   K0205560
                    GXY1  SLA     16                                    K0205570
                          STO  L  SW3        CLEAR RIGHT HALF INDICATOR K0205580
                    *                                                   K0205590
                    *                  GET RIGHT CHARACTER              K0205600
                          LD    1 0          LOAD INPUT WORD            K0205610
                          AND  L  SFF        UNPACK - GET RIGHT CHAR    K0205620
                    *                                                   K0205630
                    *                                                   K0205640
                    GXY2  MDX   1 1          MOVE POINTER               K0205650
                    *                                                   K0205660
                    *                                                   K0205670
                          MDX  L  NCNT,-1    DECREMENT NORM COUNTER     K0205680
                    *                                                   K0205690
                    *                                                   K0205700
                          MDX     GXY3       BRANCH TO RETURN           K0205710
                    *                                                   K0205720
                    *                                                   K0205730
                          STX   0 SW6        SET END OF STMNT SW        K0205740
                    *                                                   K0205750
                    *                  BLANK CHARACTER                  K0205760
                    GXY5  S       S0040      IS LAST CHAR BLANK         K0205770
                          BSC  L  GXY3,+-    BRANCH IF YES              K0205780
                          A       S0040      SET LAST CHAR TO BLANK     K0205790
                          MDX     GXY3       BRANCH TO RETURN           K0205800
                    *                                                   K0205810
                    *                                                   K0205820
                    GXY4  SLA     16         SET END OF STMNT INDICATOR K0205830
                    *                                                   K0205840
                    *                                                   K0205850
                    GXY3  BSC  I  GET1       RETURN                     K0205860
                    *                                                   K0205870
                    *                                                   K0205880
                    *                  GETS TWO CHARACTERS FROM THE     K0205890
                    *                  INPUT STRING                     K0205900
                    GET2  DC      0          RETURN ADDRESS             K0205910
                          LD      SW6        IS IT END OF STMNT         K0205920
                          BSC  L  GXY4,Z     BRANCH IF YES              K0205930
                    *                                                   K0205940
                    *                  GET BOTH CHARACTERS              K0205950
                          LD      GET2       LOAD RETURN ADDRESS        K0205960
                          STO     GET1       STORE IN GET1              K0205970
                          LD    1 0          LOAD WORD IN STMNT         K0205980
                          MDX     GXY2       GO TO MOVE POINTER         K0205990
                    *                                                   K0206000
                    *                  CONSTANTS                        K0206010
                    NCNT  DC      0          NORM COUNTER               K0206020
                    NCNTS DC      0          SAVE ORIGINAL NORM         K0206030
                    SW6   DC      0          SWITCH 6                   K0206040
                    ERID  DC      /A008      ERROR STMNT ID WORD        K0206050
                    NINE  DC      9          NINE                       K0206060
                    CHAR  DC      0          CHARACTER COUNTER          K0206070
                    ERNO  DC      4          ERROR NO. 4                K0206080
                    OVLPC DC      0          OVERLAY TEST WORD          K0206090
                    S0040 DC      /0040      EBC BLANK                  K0206100
                    *                                                   K0206110
                    *                                                   K0206120
                    GETID DC      0          RETURN ADDRESS             K0206130
                          LDX  L3 TWONT-2    INITIALIZE TABLE POINTER   K0206140
                    *                                                   K0206150
                    *                                                   K0206160
                    *                  INITIALIZES FOR A STATEMENT      K0206170
                    *                  TYPE CODE TABLE SEARCH           K0206180
                    *                  GETS THE STMNT TYPE CODE         K0206190
                    *                  STORES IT IN THE ID WORD         K0206200
                    GTID1 MDX   3 2          MODIFY POINTER             K0206210
                    *                                                   K0206220
                    *                                                   K0206230
                          LD    3 0          LOAD WORD FROM TABLE       K0206240
                          BSC  L  ER,+-      BRANCH IF END OF TABLE     K0206250
                    *                                                   K0206260
                    *                                                   K0206270
                          S     1 0          DOES MATCH WORD IN STRING  K0206280
                          BSC  L  GTID1,Z    CONTINUE LOOP IF NOT       K0206290
                    *                                                   K0206300
                    *                  GET CORRECT NAME TABLE           K0206310
                          LD    3 1          LOAD ADDR OF NAME TABLE    K0206320
                          STO     *+2                                   K0206330
                          STX   3 GTID4+3    SAVE TABLE POINTER         K0206340
                          LDX  L3 *-*        ADDR OF NAME TABLE         K0206350
                    *                                                   K0206360
                    *                  INITIALIZE TO SCAN NAME TABLE    K0206370
                          STX   1 GTID4+1    SAVE INPUT POINTER         K0206380
                          MDX   1 1          MOVE INPUT POINTER         K0206390
                    *                                                   K0206400
                    *                  PUT CHARACTER COUNT IN CHAR      K0206410
                          LD    3 0          LOAD CHARACTER COUNT       K0206420
                          STO     CHAR       SAVE                       K0206430
                    *                                                   K0206440
                    *                                                   K0206450
                          BSC  L  GTID3,+-   BRANCH IF ZERO             K0206460
                    *                                                   K0206470
                    *                                                   K0206480
                    GTID2 MDX  L  CHAR,-1    DECREMENT COUNT            K0206490
                    *                                                   K0206500
                    *                                                   K0206510
                          MDX     GTID6      GET NEXT WORD FROM STRING  K0206520
                    *                                                   K0206530
                    *                                                   K0206540
                          BSI     GET1       GET CHAR FROM INPUT STRING K0206550
                          MDX     GTID5      SEE IF CHARACTERS MATCH    K0206560
                    *                                                   K0206570
                    *                                                   K0206580
                    GTID6 BSI     GET2       GET NEXT WORD IN STMNT     K0206590
                    *                                                   K0206600
                    *                                                   K0206610
                    GTID5 S     3 1          DOES WORD MATCH            K0206620
                          BSC  L  GTID4,Z    BRANCH IF NO               K0206630
                    *                                                   K0206640
                    *                                                   K0206650
                          MDX   3 1          MOVE TABLE POINTER         K0206660
                    *                                                   K0206670
                    *                                                   K0206680
                          MDX  L  CHAR,-1    DECREMENT CHARACTER COUNT  K0206690
                    *                                                   K0206700
                    *                                                   K0206710
                          MDX     GTID2      GO TO DECREMENT COUNT      K0206720
                    *                                                   K0206730
                    *                                                   K0206740
                    GTID3 LD    3 1          LOAD STMNT ID WORD         K0206750
                          STO  L  IDWD       SAVE                       K0206760
                    *                                                   K0206770
                    *                                                   K0206780
                          MDX  L  NCNT,-1    MODIFY NORM COUNT          K0206790
                          MDX     *+1        SKIP SET SWITCH            K0206800
                          STX   0 SW6        SET END OF STMNT SWITCH    K0206810
                    *                                                   K0206820
                    *                                                   K0206830
                          BSC  I  GETID      RETURN                     K0206840
                    *                                                   K0206850
                    *                                                   K0206860
                    GTID4 LDX  L1 *-*        RESTORE INDEX 1            K0206870
                          LDX  L3 *-*        RESTORE INDEX 3            K0206880
                          LD      NCNTS      RESET NORM TO              K0206890
                          STO     NCNT       ORIGINAL VALUE             K0206900
                    *                                                   K0206910
                    *                                                   K0206920
                          SLA     16                                    K0206930
                          STO  L  SW3        CLEAR RIGHT HALF INDICATOR K0206940
                          MDX     GTID1      START COMPARE AGAIN        K0206950
                    *************************************************** K0206960
                    *             THIS SUBROUTINE PUTS THE WORD THAT    K0206970
                    *             IS IN THE ACCUMULATOR ON THE          K0206980
                    *             OUTPUT STRING. ENTRY IS A BSI         K0206990
                    *             INSTRUCTION TO THE LABEL (PUT).       K0207000
                    *             THE OUTPUT STRING POINTER (XR2) IS    K0207010
                    *             INCREMENTED BY ONE UPON EXITING.      K0207020
                    *************************************************** K0207030
                    *                                                   K0207040
                    *                  PUT WORD ON STRING               K0207050
                    *                                                   K0207060
                    PUT   DC      0          RETURN ADDRESS             K0207070
                          STO   2 0          PUT WORD ON OUTPUT STRING  K0207080
                    *                                                   K0207090
                    *                                                   K0207100
                          MDX   2 1          MOVE OUTPUT STRING POINTER K0207110
                    *                                                   K0207120
                    *                  OVERLAP ERROR                    K0207130
                          STX   2 OVLPC      STORE OUTPUT POINTER       K0207140
                          LD      OVLPC                                 K0207150
                          S       THREE      SUBTRACT THREE             K0207160
                          S    L  EOFST      SUBTRACT END OF SYMBOL TBL K0207170
                          BSC  L  RTN,+Z     BRANCH IF NO OVERLAP       K0207180
                    *                                                   K0207190
                    *                  SET UP OVERLAP ERROR             K0207200
                          MDX  L  ERROR,1    SET OVERLAP ERROR          K0207210
                          BSC  L  WAIT       EXIT FROM PHASE            K0207220
                    *                                                   K0207230
                    *                                                   K0207240
                    RTN   BSC  I  PUT        RETURN                     K0207250
                    *                                                   K0207260
                    *                  PUT OUT ERROR NO. 4              K0207270
                    ER    LD      ERID       LOAD ERROR STMNT ID WORD   K0207280
                          BSI     PUT        PUT ON OUTPUT STRING       K0207290
                          LD   I  IDSV1      LOAD STMNT ID WORD         K0207300
                          BSC  L  ER1,E      BRANCH IF HAVE STMNT NO.   K0207310
                    ER2   LD      ERNO       LOAD ERROR NUMBER          K0207320
                          BSI     PUT        PUT ON OUTPUT STRING       K0207330
                          LDX   3 4                                     K0207340
                          STX   3 ERNO       RESTORE ERROR NO. TO 4     K0207350
                          BSC  L  MOVE1      GO TO NEXT STATEMENT       K0207360
                    *                                                   K0207370
                    ER1   LD    2 -1         LOAD OUTPUT STMNT ID WORD  K0207380
                          A       NINE       ADD TWO TO NORM, SET STMNT K0207390
                          STO   2 -1         NO. BIT ON, O/P ON STRING  K0207400
                    *                                                   K0207410
                          LDX  I3 IDSV1      LOAD STMNT ADDR IN XR3     K0207420
                          LD    3 1          LOAD FIRST WORD OF NUMBER  K0207430
                          BSI     PUT        PUT ON OUTPUT STRING       K0207440
                    *                                                   K0207450
                          LD    3 2          LOAD 2ND WORD OF STMNT NO. K0207460
                          BSI     PUT        PUT ON OUTPUT STRING       K0207470
                          MDX     ER2        PUT ERROR NO. ON STRING    K0207480
                    *                                                   K0207490
                    *                  CONSTANTS                        K0207500
                    THREE DC      3          THREE                      K0207510
                    SVV1  DC      0          SAVE WORD                  K0207520
                    SW5   DC      0          SWITCH 5                   K0207530
                    S0001 DC      /0001      ONE                        K0207540
                    S003F DC      /003F      NORM MASK                  K0207550
                    QUOTE DC      /7D        QUOTE                      K0207560
                          BSS  E  0                                     K0207570
                    NAMS  DC      0          TWO WORD AREA FOR 1130     K0207580
                          DC      0          SYMBOL TABLE NAME          K0207590
                    *                                                   K0207600
                    *                  STORES NAME IN NAME CODE         K0207610
                    *                  STORES OPTR IN ONE WORD ON       K0207620
                    *                  THE STRING                       K0207630
                    *                                                   K0207640
                    MAKE  DC      0          RETURN ADDRESS             K0207650
                          STO     SVV1       STORE WORD                 K0207660
                    *                                                   K0207670
                          S    L  SEMI      IS IT SEMICOLON         2-5 K0207672
                          BSC  L  MAKE0,Z   NO  - CONTINUE          2-5 K0207674
                          STO  L  SW8       YES - RESET SWITCH 8    2-5 K0207676
                    *                                                   K0207680
                    MAKE0 LD   L  SW8        HAS QUOTE BEEN ENCOUNTERED K0207690
                          BSC  L  MAKE7,Z    BRANCH IF YES              K0207700
                          LD      SVV1       LOAD WORD                  K0207710
                          SLA     8          GET RIGHT CHAR             K0207720
                          BSC  L  MAKE1,-    BRANCH IF SPECIAL OPERATOR K0207730
                    *                                                   K0207740
                    *                                                   K0207750
                          SLA     16                                    K0207760
                          STO     SW5        CLEAR ARGUMENT TYPE SW     K0207770
                    *                                                   K0207780
                    *                                                   K0207790
                          LD   L  SW4        IS THERE CHAR IN NAMS      K0207800
                          BSC  L  MAKE4,Z    BRANCH IF YES              K0207810
                    *                                                   K0207820
                    *                  INITIALIZE NAMS                  K0207830
                    MAKE3 SLT     16         CLEAR EXTENSION            K0207840
                          LD      S0001      LOAD NAMS FULL INDICATOR   K0207850
                          STD     NAMS       STORE IN NAMS              K0207860
                    *                                                   K0207870
                    *                                                   K0207880
                          STX  L0 SW4        SET CHAR IN NAMS SW        K0207890
                    *                                                   K0207900
                    *                  IS NAMS FULL                     K0207910
                    MAKE4 LD      NAMS+1     LOAD 2ND WORD OF NAMS      K0207920
                          SLT     1          SHIFT TO SEE IF FULL       K0207930
                          BSC  L  MAKE2,+Z   BRANCH IF FULL             K0207940
                    *                                                   K0207950
                    *                  ADD ARGUMENT TO NAMS             K0207960
                          LDD     NAMS       LOAD NAME                  K0207970
                          RTE     26         CLEAR SPACE FOR NEXT CHAR  K0207980
                          STO     NAMS       STORE                      K0207990
                          LD      SVV1       LOAD WORD                  K0208000
                          AND     S003F      CLEAR EXTRA BITS           K0208010
                          OR      NAMS       COMBINE WITH NAMS          K0208020
                          STD     NAMS       SAVE NEW NAMS              K0208030
                    *                                                   K0208040
                    *                                                   K0208050
                    MAKE5 BSC  I  MAKE       RETURN                     K0208060
                    *                                                   K0208070
                    *                                                   K0208080
                    MAKE1 STX   0 SW5        SET SWITCH TO OPERATOR     K0208090
                    *                                                   K0208100
                    *                                                   K0208110
                          LD   L  SW4        IS THERE CHAR IN NAMS      K0208120
                          BSC  L  MAKE7,+-   BRANCH IF NO               K0208130
                    *                                                   K0208140
                    *                  NORMALIZE NAMS                   K0208150
                    MAKE2 LDD     NAMS       LOAD NAMS                  K0208160
                          RTE     16         ROTATE NAME                K0208170
                          SLT     1          MOVE CHAR FROM EXTENSION   K0208180
                    *                        TO ACCUMULATOR             K0208190
                          BSC  L  *-3,-      BRANCH IF SPECIAL OPERATOR K0208200
                          STD     NAMS       STORE NAME                 K0208210
                    *                                                   K0208220
                    *                                                   K0208230
                          BSI     PUT        PUT FIRST WORD ON STRING   K0208240
                          LDD     NAMS       LOAD NAME                  K0208250
                          SRT     3          PUT FIRST HALF OF 3RD CHAR K0208260
                          SLA     16         INTO EXTENSION-MOVE ENTIRE K0208270
                          SLT     6          CHAR TO ACC FOR TESTING    K0208280
                          BSC  L  *+4,+-     BRANCH IF ONE WORD NAME    K0208290
                          LDD     NAMS       LOAD NAMS                  K0208300
                          SRA     15         MOVE BIT TO RIGHT-MOST POS K0208310
                          SLT     15         MOVE EXTENSION TO ACC      K0208320
                          BSI     PUT        PUT ON OUTPUT STRING       K0208330
                    *                                                   K0208340
                    *                  GET MODE OF NAMS                 K0208350
                          LDX  L3 /8C00      LOAD FLOATING POINT MODE   K0208360
                          LD   L  CCWD       TEST EXTENDED PRECISION    K0208370
                          SLA     13         BIT OF CONTROL CARD WORD   K0208380
                          BSC  L  *+2,-      BRANCH IF  STANDARD PREC   K0208390
                          LDX  L3 /8A00      LOAD EXTENSION PRECISION   K0208400
                    *                        MODE                       K0208410
                          STX   3 NAMED      STORE MODE                 K0208420
                    *                                                   K0208430
                    *                  FIND NAME TO TRANSLATE           K0208440
                          LDX   3 36         INITIALIZE COUNTER         K0208450
                    EXFN1 LD    2 -2         LOAD WORD TO BE TRANSLATED K0208460
                          S    L3 FUNEX-4    MATCH ENTRY IN TABLE       K0208470
                          BSC  L  EXFN2,Z    BRANCH IF NOT              K0208480
                    *                                                   K0208490
                          LD    2 -1         LOAD 2ND WORD              K0208500
                          S    L3 FUNEX-3    MATCH ENTRY IN TABLE       K0208510
                          BSC  L  EXFN2,Z    BRANCH IF NOT              K0208520
                    *                                                   K0208530
                          LDD  L3 FUNEX-2    LOAD FUNCTION NAME         K0208540
                          OR      NAMED      ADD MODE TO NAME           K0208550
                          STO   2 -2         STORE IN OUTPUT STRING     K0208560
                          RTE     16         LOAD 2ND WORD              K0208570
                          STO   2 -1         PUT ON OUTPUT STRING       K0208580
                          MDX     *+2        GO TEST SWITCH 5           K0208590
                    EXFN2 MDX   3 -4         MODIFY COUNTER             K0208600
                          MDX     EXFN1      CONTINUE LOOP              K0208610
                    *                                                   K0208620
                    *                                                   K0208630
                          LD      SW5        IS ARGUMENT OPERATOR       K0208640
                          BSC  L  MAKE3,+-   BRANCH IF NO               K0208650
                    *                                                   K0208660
                    *                                                   K0208670
                    MAKE7 LD      SVV1       LOAD WORD                  K0208680
                          S       QUOTE      IS IT QUOTE                K0208690
                          BSC  L  MAKE9,Z    BRANCH IF NO               K0208700
                    *                                                   K0208710
                    *                                                   K0208720
                          LD   L  SW7        IS IT DATA STMNT           K0208730
                          BSC     Z                                     K0208740
                          S       QUMSC                                 K0208750
                          BSC  L  MAKE6,+-   BRANCH IF NO               K0208760
                    *                                                   K0208770
                    *                                                   K0208780
                          SLA     16                                    K0208790
                          STO  L  SW9        SET LEFT HALF SWITCH       K0208800
                    *                                                   K0208810
                    *                                                   K0208820
                          LD      *                                     K0208830
                          EOR  L  SW8        REVERSE QUOTE INDICATOR    K0208840
                          STO  L  SW8                                   K0208850
                          MDX     MAKE6      PUT CHAR ON OUTPUT STRING  K0208860
                    *                                                   K0208870
                    *                                                   K0208880
                    MAKE9 LD   L  SW8        WAS QUOTE ENCOUNTERED      K0208890
                          BSC  L  MAKE6,+-   BRANCH IF NOT              K0208900
                    *                                                   K0208910
                    *                                                   K0208920
                          LD   L  SW9        OUTPUT RIGHT HALF OF WORD  K0208930
                          BSC  L  MAKE8,Z    BRANCH IF YES              K0208940
                    *                                                   K0208950
                    *                                                   K0208960
                          LD   L  SVV1       LOAD WORD                  K0208970
                          SLA     8          SHIFT TO LEFT              K0208980
                          BSI  L  PUT        PUT ON OUTPUT STRING       K0208990
                    *                                                   K0209000
                    *                                                   K0209010
                          STX  L0 SW9        SET SW TO O/P RIGHT HALF   K0209020
                          MDX     MAKEA      GO NORMALIZE SWITCH 4      K0209030
                    *                                                   K0209040
                    *                                                   K0209050
                    MAKE8 LD    2 -1         LOAD WORD FROM OUTPUT      K0209060
                          OR   L  SVV1       PUT IN RIGHT CHAR          K0209070
                          STO   2 -1         PUT BACK ON OUTPUT STRING  K0209080
                    *                                                   K0209090
                    *                                                   K0209100
                          SLA     16                                    K0209110
                          STO  L  SW9        SET SW TO O/P LEFT HALF    K0209120
                          MDX     MAKEA      GO NORMALIZE SWITCH 4      K0209130
                    *                                                   K0209140
                    *                                                   K0209150
                    MAKE6 LD   L  SVV1       LOAD WORD                  K0209160
                          AND  L  S003F      GET NECESSARY BITS         K0209170
                          BSI  L  PUT        PUT ON OUTPUT STRING       K0209180
                    *                                                   K0209190
                    *                                                   K0209200
                    MAKEA SLA     16                                    K0209210
                          STO  L  SW4        CLEAR CHAR IN NAMS SW      K0209220
                          MDX     MAKE5      RETURN                     K0209230
                    *                                                   K0209240
                    QUMSC DC      /1E-/7D    QUOTE - SEMICOLON          K0209250
                    *                                                   K0209260
                    *                  FUNCTIONAL EXCHANGE TABLE        K0209270
                          BSS  E  0                                     K0209280
                    FUNEX DC      /C44A      -SI-                       K0209290
                          DC      /D000      -N -                       K0209300
                          DC      /0111      - S-                       K0209310
                          DC      /9540      -IN-                       K0209320
                          DC      /86B4      -CO-                       K0209330
                          DC      /A000      -S -                       K0209340
                          DC      /001A      - C-                       K0209350
                          DC      /E880      -OS-                       K0209360
                          DC      /8318      -AT-                       K0209370
                          DC      /9540      -AN-                       K0209380
                          DC      /000C      -AT-                       K0209390
                          DC      /B055      -AN-                       K0209400
                          DC      /C4C3      -SQ-                       K0209410
                          DC      /98C0      -RT-                       K0209420
                          DC      /0113      -SQ-                       K0209430
                          DC      /8663      -RT-                       K0209440
                          DC      /829A      -AL-                       K0209450
                          DC      /E1C0      -OG-                       K0209460
                          DC      /000A      -AL-                       K0209470
                          DC      /B587      -OG-                       K0209480
                          DC      /8B3A      -EX-                       K0209490
                          DC      /F000      -D -                       K0209500
                          DC      /002C      - E-                       K0209510
                          DC      /F5C0      -XP-                       K0209520
                          DC      /C448      -SI-                       K0209530
                          DC      /F540      -GN-                       K0209540
                          DC      /0111      -SI-                       K0209550
                          DC      /91D5      -GN-                       K0209560
                          DC      /C60A      -TA-                       K0209570
                          DC      /D200      -NH-                       K0209580
                          DC      /0118      -TA-                       K0209590
                          DC      /9548      -NH-                       K0209600
                          DC      /8214      -AB-                       K0209610
                          DC      /A000      -S -                       K0209620
                          DC      /0008      - A-                       K0209630
                          DC      /A880      -BS-                       K0209640
                    NAMED DC      0          USEFUL CONSTANT            K0209650
                    *                                                   K0209660
                    *                  TABLE CONTAINING THE FIRST TWO   K0209670
                    *                  CHARS OF THE FORTRAN STMNT       K0209680
                    *                  NAMES AND THE ADDRESSES OF THE   K0209690
                    *                  REMAINING NAME CHARACTERS        K0209700
                    *                                                   K0209710
                    TWONT DC      /C4D6      DO                         K0209720
                          DC      ID6        ADDRESS                    K0209730
                          DC      /C7D6      GO TO                      K0209740
                          DC      ID11       ADDRESS                    K0209750
                          DC      /C9C6      IF                         K0209760
                          DC      ID12       ADDRESS                    K0209770
                          DC      /D9C5      READ                       K0209780
                          DC      ID15       ADDRESS                    K0209790
                          DC      /E6D9      WRITE                      K0209800
                          DC      ID21       ADDRESS                    K0209810
                          DC      /C3C1      CALL EXIT                  K0209820
                          DC      ID1J       ADDRESS                    K0209830
                          DC      /C3C1      CALL LINK                  K0209840
                          DC      ID1K       ADDRESS                    K0209850
                          DC      /C3C1      CALL PDUMP                 K0209860
                          DC      ID1L       ADDRESS                    K0209870
                          DC      /C3C1      CALL                       K0209880
                          DC      ID2        ADDRESS                    K0209890
                          DC      /C6C9      FIND                       K0209900
                          DC      ID9S       ADDRESS                    K0209910
                          DC      /C4C9      DIMENSION                  K0209920
                          DC      ID5        ADDRESS                    K0209930
                          DC      /C3D6      COMMON                     K0209940
                          DC      ID3        ADDRESS                    K0209950
                          DC      /C5D8      EQUIVALENCE                K0209960
                          DC      ID9        ADDRESS                    K0209970
                          DC      /C9D5      INTEGER                    K0209980
                          DC      ID13       ADDRESS                    K0209990
                          DC      /D9C5      REAL                       K0210000
                          DC      ID16       ADDRESS                    K0210010
                          DC      /C5E7      EXTERNAL                   K0210020
                          DC      ID9J       ADDRESS                    K0210030
                          DC      /C3D6      CONTINUE                   K0210040
                          DC      ID4        ADDRESS                    K0210050
                          DC      /D7C1      PAUSE                      K0210060
                          DC      ID14       ADDRESS                    K0210070
                          DC      /D9C5      RETURN                     K0210080
                          DC      ID17       ADDRESS                    K0210090
                          DC      /E2E3      STOP                       K0210100
                          DC      ID19       ADDRESS                    K0210110
                          DC      /D9C5      REWIND                     K0210120
                          DC      ID18       ADDRESS                    K0210130
                          DC      /C2C1      BACKSPACE                  K0210140
                          DC      ID1        ADDRESS                    K0210150
                          DC      /C5D5      END FILE                   K0210160
                          DC      ID8        ADDRESS                    K0210170
                          DC      /C4C5      DEFINE FILE                K0210180
                          DC      ID4J       ADDRESS                    K0210190
                          DC      /C5D5      END                        K0210200
                          DC      ID7        ADDRESS                    K0210210
                          DC      /C6E4      FUNCTION                   K0210220
                          DC      ID10       ADDRESS                    K0210230
                          DC      /E2E4      SUBROUTINE                 K0210240
                          DC      ID20       ADDRESS                    K0210250
                          DC      /C4C1      DATA                       K0210260
                          DC      ID4B       ADDRESS                    K0210270
                          DC      0          USEFUL CONSTANT            K0210280
                    *                                                   K0210290
                    *                  BODY NAME TABLE                  K0210300
                    *                                                   K0210310
                    *                  BACKSPACE                        K0210320
                    ID1   DC      7          COUNT                      K0210330
                          DC      /C3D2      CK                         K0210340
                          DC      /E2D7      SP                         K0210350
                          DC      /C1C3      AC                         K0210360
                          DC      /00C5      E                          K0210370
                          DC      /0800      ID WORD                    K0210380
                    *                                                   K0210390
                    *                   CALL EXIT                       K0210400
                    ID1J  DC      6          COUNT                      K0210410
                          DC      /D3D3      LL                         K0210420
                          DC      /C5E7      EX                         K0210430
                          DC      /C9E3      IT                         K0210440
                          DC      /E002      ID WORD                    K0210450
                    *                                                   K0210460
                    *                  CALL LINK                        K0210470
                    ID1K  DC      6          COUNT                      K0210480
                          DC      /D3D3      LL                         K0210490
                          DC      /D3C9      LI                         K0210500
                          DC      /D5D2      NK                         K0210510
                          DC      /E000      ID WORD                    K0210520
                    *                                                   K0210530
                    *                  CALL PDUMP                       K0210540
                    ID1L  DC      7          COUNT                      K0210550
                          DC      /D3D3      LL                         K0210560
                          DC      /D7C4      PD                         K0210570
                          DC      /E4D4      UM                         K0210580
                          DC      /00D7      P                          K0210590
                          DC      /E003      ID WORD                    K0210600
                    *                                                   K0210610
                    *                  CALL                             K0210620
                    ID2   DC      2          COUNT                      K0210630
                          DC      /D3D3      LL                         K0210640
                          DC      /3000      ID WORD                    K0210650
                    *                                                   K0210660
                    *                  COMMON                           K0210670
                    ID3   DC      4          COUNT                      K0210680
                          DC      /D4D4      MM                         K0210690
                          DC      /D6D5      ON                         K0210700
                          DC      /3800      ID WORD                    K0210710
                    *                                                   K0210720
                    *                  CONTINUE                         K0210730
                    ID4   DC      6          COUNT                      K0210740
                          DC      /D5E3      NT                         K0210750
                          DC      /C9D5      IN                         K0210760
                          DC      /E4C5      UE                         K0210770
                          DC      /B000      ID WORD                    K0210780
                    *                                                   K0210790
                    *                       DATA                        K0210800
                    ID4B  DC      2          COUNT                      K0210810
                          DC      /E3C1      TA                         K0210820
                          DC      /F800      ID WORD                    K0210830
                    *                                                   K0210840
                    *                 DEFINE FILE                       K0210850
                    ID4J  DC      8          COUNT                      K0210860
                          DC      /C6C9      FI                         K0210870
                          DC      /D5C5      NE                         K0210880
                          DC      /C6C9      FI                         K0210890
                          DC      /D3C5      LE                         K0210900
                          DC      /F000      ID WORD                    K0210910
                    *                                                   K0210920
                    *                  DIMENSION                        K0210930
                    ID5   DC      7          COUNT                      K0210940
                          DC      /D4C5      ME                         K0210950
                          DC      /D5E2      NS                         K0210960
                          DC      /C9D6      IO                         K0210970
                          DC      /00D5      N                          K0210980
                          DC      /4000      ID WORD                    K0210990
                    *                                                   K0211000
                    *                  DO                               K0211010
                    ID6   DC      0          COUNT                      K0211020
                          DC      /5800      ID WORD                    K0211030
                    *                                                   K0211040
                    *                  END                              K0211050
                    ID7   DC      2          COUNT                      K0211060
                          DC      /C440      D                          K0211070
                          DC      /1000      ID WORD                    K0211080
                    *                                                   K0211090
                    *                  ENDFILE                          K0211100
                    ID8   DC      5          COUNT                      K0211110
                          DC      /C4C6      DF                         K0211120
                          DC      /C9D3      IL                         K0211130
                          DC      /00C5      E                          K0211140
                          DC      /1800      ID WORD                    K0211150
                    *                                                   K0211160
                    *                  EQUIVALENCE                      K0211170
                    ID9   DC      9          COUNT                      K0211180
                          DC      /E4C9      UI                         K0211190
                          DC      /E5C1      VA                         K0211200
                          DC      /D3C5      LE                         K0211210
                          DC      /D5C3      NC                         K0211220
                          DC      /00C5      E                          K0211230
                          DC      /A800      ID WORD                    K0211240
                    *                                                   K0211250
                    *             EXTERNAL                              K0211260
                    ID9J  DC      6          COUNT                      K0211270
                          DC      /E3C5      TE                         K0211280
                          DC      /D9D5      RN                         K0211290
                          DC      /C1D3      AL                         K0211300
                          DC      /C800      ID WORD                    K0211310
                    *                                                   K0211320
                    *                  FIND                             K0211330
                    ID9S  DC      2          COUNT                      K0211340
                          DC      /D5C4      ND                         K0211350
                          DC      /E800      ID WORD                    K0211360
                    *                                                   K0211370
                    *                  FUNCTION                         K0211380
                    ID10  DC      6          COUNT                      K0211390
                          DC      /D5C3      NC                         K0211400
                          DC      /E3C9      TI                         K0211410
                          DC      /D6D5      ON                         K0211420
                          DC      /6800      ID WORD                    K0211430
                    *                                                   K0211440
                    *                  GOTO                             K0211450
                    ID11  DC      2          COUNT                      K0211460
                          DC      /E3D6      TO                         K0211470
                          DC      /7000      ID WORD                    K0211480
                    *                                                   K0211490
                    *                  IF                               K0211500
                    ID12  DC      0          COUNT                      K0211510
                          DC      /7800      ID WORD                    K0211520
                    *                                                   K0211530
                    *                  INTEGER                          K0211540
                    ID13  DC      5          COUNT                      K0211550
                          DC      /E3C5      TE                         K0211560
                          DC      /C7C5      GE                         K0211570
                          DC      /00D9      R                          K0211580
                          DC      /5000      ID WORD                    K0211590
                    *                                                   K0211600
                    *                  PAUSE                            K0211610
                    ID14  DC      3          COUNT                      K0211620
                          DC      /E4E2      US                         K0211630
                          DC      /00C5      E                          K0211640
                          DC      /9800      ID WORD                    K0211650
                    *                                                   K0211660
                    *                  READ  COUNT                      K0211670
                    ID15  DC      2                                     K0211680
                          DC      /C1C4      AD                         K0211690
                          DC      /9000      ID WORD                    K0211700
                    *                                                   K0211710
                    *                  REAL                             K0211720
                    ID16  DC      2          COUNT                      K0211730
                          DC      /C1D3      AL                         K0211740
                          DC      /4800      ID WORD                    K0211750
                    *                                                   K0211760
                    *                  RETURN                           K0211770
                    ID17  DC      4          COUNT                      K0211780
                          DC      /E3E4      TU                         K0211790
                          DC      /D9D5      RN                         K0211800
                          DC      /8000      ID WORD                    K0211810
                    *                                                   K0211820
                    *                  REWIND                           K0211830
                    ID18  DC      4          COUNT                      K0211840
                          DC      /E6C9      WI                         K0211850
                          DC      /D5C4      ND                         K0211860
                          DC      /2800      ID WORD                    K0211870
                    *                                                   K0211880
                    *                  STOP                             K0211890
                    ID19  DC      2          COUNT                      K0211900
                          DC      /D6D7      OP                         K0211910
                          DC      /B800      ID WORD                    K0211920
                    *                                                   K0211930
                    *                  SUBROUTINE                       K0211940
                    ID20  DC      8          COUNT                      K0211950
                          DC      /C2D9      BR                         K0211960
                          DC      /D6E4      OU                         K0211970
                          DC      /E3C9      TI                         K0211980
                          DC      /D5C5      NE                         K0211990
                          DC      /2000      ID WORD                    K0212000
                    *                                                   K0212010
                    *                  WRITE                            K0212020
                    ID21  DC      3          COUNT                      K0212030
                          DC      /C9E3      IT                         K0212040
                          DC      /00C5      E                          K0212050
                          DC      /8800      ID WORD                    K0212060
                    *                                                   K0212070
                    *                  RE-INITIALIZE                    K0212080
                    CALLC LDX  I1 SOFS       INITIALIZE INPUT POINTER   K0212090
                    *                                                   K0212100
                    *                  CHECKS FOR THE PRESENCE OF AN    K0212110
                    *                  END STATEMENT                    K0212120
                    ENDD  STX   1 IDSVV      STORE INPUT POINTER        K0212130
                          LD    1 0          LOAD STMNT ID WORD         K0212140
                          S    L  S1000      IS IT END STMNT            K0212150
                          BSC  L  WAIT,+-    BRANCH IF YES              K0212160
                    *                                                   K0212170
                    *                  CALL STATEMENT                   K0212180
                          LD    1 0          LOAD STMNT ID WORD         K0212190
                          AND     IDTPE      GET ID TYPE                K0212200
                          SRA     2          SHIFT RIGHT TWO            K0212210
                          S       CALL1      IS IT CALL STMNT           K0212220
                          BSC  L  MOVIE,Z    BRANCH IF NOT              K0212230
                    *                                                   K0212240
                    *                                                   K0212250
                          LD    1 0          LOAD STMNT ID WORD         K0212260
                          BSC     E          HAS STMNT NO.              K0212270
                          MDX   1 2          YES - MOVE PT OVER NO.     K0212280
                          MDX   1 1          MOVE INPUT POINTER         K0212290
                    *                                                   K0212300
                    *                  CHECKS FOR THE NAME SSWTCH       K0212310
                    IDAHO LD    1 0          LOAD FIRST WORD IN BODY    K0212320
                          S       SENC       IS IT SS                   K0212330
                          BSC  L  XYZ,Z      BRANCH IF NOT              K0212340
                          LD    1 1          LOAD 2ND WORD OF BODY      K0212350
                          S       SENC1      IS IT WT                   K0212360
                          BSC     Z          SKIP IF YES                K0212370
                          MDX     XYZ        GO TO NEXT COMPARE         K0212380
                          LD    1 2          LOAD 3RD WORD OF BODY      K0212390
                          S       SENC2      IS IT CH                   K0212400
                          BSC     Z          SKIP IF YES                K0212410
                          MDX     XYZ        GO TO NEXT COMPARE         K0212420
                          MDX     XXYZ       GO TO CONVERT TO 5 CHAR    K0212430
                    *                                                   K0212440
                    *             CONSTANTS                             K0212450
                    IDSVV DC      0          INPUT POINTER              K0212460
                    IDTPE DC      /F800      ID MASK                    K0212470
                    CALL1 DC      /0C00      CALL STMNT ID TYPE         K0212480
                    SENC  DC      /C514      SS                         K0212490
                    SENC1 DC      /E8C3      WT                         K0212500
                    SENC2 DC      /9000      CH                         K0212510
                    NAME  DC      0          INPUT POINTER              K0212520
                    OVER  DC      /AD28      OV                         K0212530
                    OVER1 DC      /D646      ER                         K0212540
                    OVER2 DC      /A600      FL                         K0212550
                    SENL  DC      /C499      SL                         K0212560
                    SENL1 DC      /98C5      IT                         K0212570
                    SENL2 DC      /C600      ET                         K0212580
                    SENL3 DC      /98E3      T                          K0212590
                    S0004 DC      4          NORM OF ONE                K0212600
                    *                                                   K0212610
                    *                  CHECKS FOR THE NAME OVERFL       K0212620
                    XYZ   LD    1 0          LOAD 1ST WORD IN BODY      K0212630
                          S       OVER       IS IT OV                   K0212640
                          BSC  L  XYZ1,Z     BRANCH IF NOT              K0212650
                          LD    1 1          LOAD 2ND WORD IN BODY      K0212660
                          S       OVER1      IS IT ER                   K0212670
                          BSC  L  XYZ1,Z     BRANCH IF NOT              K0212680
                          LD    1 2          LOAD 3RD WORD IN BODY      K0212690
                          S       OVER2      IS IT FL                   K0212700
                          BSC  L  XXYZ,+-    BRANCH IF YES              K0212710
                    *                                                   K0212720
                    *                  CHECKS FOR THE NAME SLITET       K0212730
                    XYZ1  LD    1 0          LOAD 1ST WORD IN BODY      K0212740
                          S       SENL       IS IT SL                   K0212750
                          BSC  L  MOVIE,Z    BRANCH IF NOT              K0212760
                          LD    1 1          LOAD 2ND WORD IN BODY      K0212770
                          S       SENL1      IS IT IT                   K0212780
                          BSC     Z          SKIP IF YES                K0212790
                          MDX     MOVIE      GO TO NEXT STMNT           K0212800
                          LD    1 2          LOAD 3RD WORD IN BODY      K0212810
                          S       SENL2      IS IT ET                   K0212820
                          BSC     Z          SKIP IF YES                K0212830
                          MDX     MOVIE      GO TO NEXT STMNT           K0212840
                          LD      SENL3      LOAD NEW WORD FOR SLITET   K0212850
                          STO   1 1          STORE END                  K0212860
                    *                                                   K0212870
                    *                  CLOSES THE STRING BY ONE WORD    K0212880
                    *                  AND ADJUSTS THE STMNT NORM       K0212890
                    XXYZ  MDX   1 2          MOVE INPUT POINTER         K0212900
                          STX   1 NAME       SAVE INPUT POINTER         K0212910
                          LD   L  EOFS       LOAD END OF STRING ADDRESS K0212920
                          S       NAME       SUBTRACT INPUT POINTER TO  K0212930
                          STO     *+1        GET RANGE OF LOOP          K0212940
                          LDX  L3 0          LOAD XR3 WITH RANGE        K0212950
                          LD    1 1          MOVE WORD DOWN             K0212960
                          STO   1 0          ONE POSITION               K0212970
                          MDX   1 1          MOVE POINTER               K0212980
                          MDX   3 -1         DECREMENT RANGE            K0212990
                          MDX     *-5        CONTINUE LOOP              K0213000
                    *                                                   K0213010
                    *                  ADJUST NORM                      K0213020
                          LDX  I1 IDSVV      RESTORE INPUT POINTER      K0213030
                          LD    1 0          LOAD STMNT ID WORD         K0213040
                          S       S0004      DECREMENT NORM BY ONE      K0213050
                          STO   1 0          PUT NORM BACK ON STRING    K0213060
                    *                                                   K0213070
                    *                  UPDATES THE STRING I/P PT (XR1)  K0213080
                    *                  TO MOVE TO THE NEXT STMNT        K0213090
                    MOVIE LDX  I1 IDSVV      RESTORE INPUT POINTER      K0213100
                          LD    1 0          LOAD STMNT ID WORD         K0213110
                          SLA     5          SHIFT TO GET NORM          K0213120
                          SRA     7                                     K0213130
                          A       IDSVV      ADD INPUT POINTER TO GET   K0213140
                          STO     NXID+1     ADDRESS OF NEXT STMNT      K0213150
                    NXID  LDX  L1 0          RESET INPUT POINTER        K0213160
                          MDX     ENDD       GO CHECK FOR STMNT TYPE    K0213170
                    *                                                   K0213180
                    *             PROCESS IOCS WORD AND SET DEVICE      K0213190
                    *             INITIALIZATION ROUTINES               K0213200
                    *                                                   K0213210
                    H7    DC      /7         MASK FOR BITS 14,15,16     K0213220
                    RDB   DC      /7F7F      MASK FOR DISK IOCS WORD    K0213230
                    *                                                   K0213240
                    *             SETUP PRECISION AND TEST FOR ONE WD   K0213250
                    *             INTEGERS                              K0213260
                    CQCT  EQU     *          ENTRY POINT                K0213270
                          LD   L  IOCS       SEE IF IOCS ROUTINES       K0213280
                    *                                                   K0213290
                          STO     IOCST      SAVE IOCS WD TEMP STO      K0213300
                    *                                                   K0213310
                          LD   L  CCWD       PUT ONE WORD INTEGER       K0213320
                          SRT     7          FLAG IN EXTENSION          K0213330
                          LD   L  CCWD       EXTENDED PRECISION FLAG    K0213340
                          SLA     13         CLEAR ACC - PUT EXTENDED   K0213350
                          SRA     15         PRECISION FLAG IN BIT 15   K0213360
                          SLT     1                                     K0213370
                          EOR     PX5        REVERSE INTEGER FLAG       K0213380
                          OR   L  FIO+1      PUT IN                     K0213390
                          STO  L  FIO+1      FIO CALL                   K0213400
                          AND     H7         GET PRECISION BITS         K0213410
                          OR   L  FIOCL      PUT OUT AS PRECISION DC    K0213420
                          STO     SUFIO+1    STORE IN DISK              K0213430
                          STO     SDFIO+1    ROUTINE CALLS              K0213440
                    *                                                   K0213450
                    *             CHECK FOR UNFORMATTED DISK I/O        K0213460
                          LD      IOCST      LOAD IOCS WD               K0213470
                          SLA     1          SHIFT BIT TO SIGN          K0213480
                          BSC  L  SDF,-      BR IF NOT REQUESTED        K0213490
                          LDX   3 -3         INITIALIZE COUNTER         K0213500
                          LD   L3 SUFIO+2    LOAD WORD OF CALL          K0213510
                          BSI  L  PUT        OUTPUT WORD                K0213520
                          MDX   3 1          INCREMENT COUNTER          K0213530
                          MDX     *-6        CONTINUE LOOP              K0213540
                    *                                                   K0213550
                    *                                                   K0213560
                    *                      CHECK FOR DISK               K0213570
                    *                                                   K0213580
                    SDF   LD      IOCST      LOAD IOCS WORD             K0213590
                          SLA     8                                     K0213600
                          BSC  L  PFIOC,-    BRANCH IF NO DISK REQUEST  K0213610
                    *                                                   K0213620
                    *             PUT SDFIO CALL ON STRING              K0213630
                    *                                                   K0213640
                          LDX   3 -3         INITIALIZE COUNTER         K0213650
                          LD   L3 SDFIO+2    LOAD WORD OF CALL          K0213660
                          BSI  L  PUT        PUT CALL TO SDFIO          K0213670
                          MDX   3 1          INCREMENT COUNTER          K0213680
                          MDX     *-6        CONTINUE LOOP              K0213690
                          LD   L  IOCS       TST IOCS WD FOR OTHER DEVC K0213700
                          AND     RDB        OTHER THAN DISK            K0213710
                          BSC  L  ZAO,+-     BRANCH IF NO OTHER CALLS   K0213720
                          MDX     PFIOC      CHECK OTHER DEVICES        K0213730
                          DC      /D80C      SUFIO CALL ID WORD         K0213740
                    SUFIO DC      /1D80      LIBF SUFIO CODE            K0213750
                          DC      *-*        PRECISION                  K0213760
                          DC      /D80C      SDFIO CALL ID WORD         K0213770
                    SDFIO DC      /2100      LIBF SDFIO                 K0213780
                          DC      *-*        PRECISION                  K0213790
                    IOCST DC      *-*        TEMP STG FOR IOCS WD       K0213800
                    PX5   DC      1          USEFUL CONSTANT            K0213810
                    *                                                   K0213820
                    *             CHECK OTHER DEVICES SPECIFIED BY IOCS K0213830
                    *             WORD AND SET UP STRING                K0213840
                    *                                                   K0213850
                    UDTST DC      /BF7F      MASK FOR NON-DISK IOCS     K0213860
                    *                                                   K0213870
                    PFIOC LD      IOCST      TEST IF ANY NON-DISK I/O   K0213880
                          AND     UDTST      *                          K0213890
                          BSC  L  ZAO,+-     BRANCH IF NOT              K0213900
                    *                                                   K0213910
                          LD      IOCST      KEYBOARD TEST              K0213920
                          SLA     10                                    K0213930
                          BSC  L  *+2,+Z     BRANCH IF KEYBOARD REQUEST K0213940
                          LDD     FIOCL      NO KEYBOARD                K0213950
                          STD     FIO+13     SET FLAG                   K0213960
                          LD      IOCST      PAPER TAPE TEST            K0213970
                          SLA     14                                    K0213980
                          BSC  L  *+2,+Z     BRANCH IF PAPER TAPE       K0213990
                          LDD     FIOCL      NO PAPET TAPE              K0214000
                          STD     FIO+9      SET FLAG                   K0214010
                          LD      IOCST      PLOTTER                    K0214020
                          SLA     3                                     K0214030
                          BSC  L  *+2,+Z     BRANCH IF PLOTTER          K0214040
                          LDD     FIOCL      SET FLAG                   K0214050
                          STD     FIO+15     NO PLOTTER                 K0214060
                          LD      IOCST      1132 PRINTER TEST          K0214070
                          SLA     7                                     K0214080
                          BSC  L  *+2,+Z     BRANCH IF PRINTER          K0214090
                          LDD     FIOCL      SET FLAG                   K0214100
                          STD     FIO+7      NO 1132 PRINTER            K0214110
                          LD      IOCST      1403 PRINTER TEST          K0214120
                          SLA     12                                    K0214130
                          BSC  L  *+2,+Z     BRANCH IF REQUIRED         K0214140
                          LDD     FIOCL      SET FLAG                   K0214150
                          STD     FIO+11     NO 1403 PRINTER            K0214160
                          LD      IOCST      TYPEWRITER TEST            K0214170
                          SLA     13                                    K0214180
                          BSC  L  NTP,-      BRANCH IF TYPEWRITER       K0214190
                          LD      FIO+13     TEST IF KEYBOARD REQUESTED K0214200
                          EOR     FIOCL      *                          K0214210
                          BSC  L  T2501,+-   BRANCH IF NOT              K0214220
                          LD      FIO+13     INSERT .LIBF TYPEZ.        K0214230
                          STO     FIO+3      *INSTEAD OF .LIBF WRTYZ.   K0214240
                          MDX     T2501      CONTINUE                   K0214250
                    NTP   LDD     FIOCL      SET FLAG                   K0214260
                          STD     FIO+3      NO TYPEWRITER              K0214270
                    T2501 LD      IOCST      2501 CARD READER           K0214280
                          SLA     11                                    K0214290
                          BSC  L  *+2,+Z     BRANCH IF 2501             K0214300
                          LDD     FIOCL      SET FLAG                   K0214310
                          STD     FIO+17     NO 2501 CARD READER        K0214320
                          LD      IOCST      1442 CARD READ/PUNCH       K0214330
                          SLA     15                                    K0214340
                          BSC  L  *+2,+Z     BRANCH IF 1442 RD/PUNCH    K0214350
                          LDD     FIOCL      SET FLAG                   K0214360
                          STD     FIO+5      NO 1442 CARD RD/PUNCH      K0214370
                          LD      IOCST      1442 PUNCH ONLY            K0214380
                          SLA     9                                     K0214390
                          BSC  L  *+2,+Z     BRANCH IF 1442 PUNCH ONLY  K0214400
                          LDD     FIOCL      SET FLAG                   K0214410
                          STD     FIO+19     NO 1442 PUNCH              K0214420
                    *                                                   K0214430
                    *             SET TRACE DEVICE INDICATOR IN FIO     K0214440
                    *             CALLING SEQUENCE                      K0214450
                    *                                                   K0214460
                          LD      IOCST      PICK UP IOCS WORD          K0214470
                          SRT     4          PUT 1403 INDICATOR IN EXT  K0214480
                          SLA     11         PUT 1132 INDICATOR IN SIGN K0214490
                          RTE     16         EXCHANGE ACC AND EXT       K0214500
                          BSC  L  PFIO1,+Z   BRANCH IF 1403 PRINTER     K0214510
                          RTE     16         TEST 1132 PRINTER BIT      K0214520
                          BSC  L  PFIO2,-    BRANCH IF NO 1132 PRINTER  K0214530
                          LD      H0040      GET 1132 PRINTER FLAG      K0214540
                          MDX     *+1                                   K0214550
                    PFIO1 LD      H0060      GET 1403 PRINTER FLAG      K0214560
                          OR      FIO+1      INSERT TRACE DEVICE AS     K0214570
                          STO     FIO+1      *PART OF SFIO CALLING SEQ  K0214580
                          MDX     PTFIO      BRANCH TO PUT FIO ON STRNG K0214590
                    *                                                   K0214600
                    PFIO2 LD      H0020      GET CONSOLE PRINTER FLAG   K0214610
                          MDX     PFIO1+1    GO INSERT                  K0214620
                    *                                                   K0214630
                    H0020 DC      /0020      MASK FOR C.P. TRACE DEVICE K0214640
                    H0040 DC      /0040      MASK FOR 1132 TRACE DEVICE K0214650
                    H0060 DC      /0060      MASK FOR 1403 TRACE DEVICE K0214660
                    *                                                   K0214670
                    *             FIO TABLE                             K0214680
                          BSS  E  0                                     K0214690
                          DC      /D860      FIO ID WORD                K0214700
                    FIO   DC      /1580      LIBF FIO                   K0214710
                          DC      /5F04      TRACE - PRECISION          K0214720
                    *                                                   K0214730
                    *             BITS 8-10 INDICATE ERROR DEVICE       K0214740
                    *             1 = TYPEWRITER                        K0214750
                    *             3 = 1132 PRINTER                      K0214760
                    *             5 = 1403 PRINTER                      K0214770
                    *                                                   K0214780
                          DC      /5F16      2*NO. OF UNITS +2     22   K0214790
                    *                                                   K0214800
                          DC      /0D80      LIBF WRTYZ  TYPEWRITER     K0214810
                          DC      /5F00                                 K0214820
                          DC      /1000      LIBF CARDZ  1442 RD/PNCH   K0214830
                          DC      /5F00                                 K0214840
                          DC      /1080      LIBF PRNTZ  1132 PRINTER   K0214850
                          DC      /5F00                                 K0214860
                          DC      /1100      LIBF PHPTZ  PAPER TAPE     K0214870
                          DC      /5F00                                 K0214880
                          DC      /1980      LIBF PRNZ   1403 PRINTER   K0214890
                          DC      /5F00                                 K0214900
                          DC      /0E00      LIBF TYPEZ  KEYBOARD       K0214910
                          DC      /5F00                                 K0214920
                          DC      /1180      LIBF WCHRI  PLOTTER        K0214930
                          DC      /5F00                                 K0214940
                          DC      /1380      LIBF READZ  2510 CD READER K0214950
                          DC      /5F00                                 K0214960
                          DC      /2700      LIBF PNCHZ  1442 PNCH ONLY K0214970
                          DC      /5F00                                 K0214980
                          DC      /0480      LIBF FLD                   K0214990
                          DC      /0580      LIBF FSTO                  K0215000
                    FIOCL DC      /5F00      BLANK                      K0215010
                          DC      /5F00      BLANK                      K0215020
                    PTFIO LDX   3 -24        PUT FIO ON STRING          K0215030
                          LD   L3 FIO+23     LOOP THROUGH ENTRIES       K0215040
                          BSI  L  PUT        BRANCH TO SUBROUTINES      K0215050
                          MDX   3 1                                     K0215060
                          MDX     PTFIO+1    END OF LOOP                K0215070
                          BSC  L  ZAO        RETURN TO PROCESSING       K0215080
                    *                                              2-11 K0215081
                    * CHECK IF ORIGIN SPECIFIED, AND MAKE EVEN     2-11 K0215082
                    *                                              2-11 K0215083
                    ORGCK LD   L  CCWD      FETCH CONTROL CARD IND 2-11 K0215084
                          SLA     13        EXTEND. PRECISION SPEC 2-11 K0215085
                          BSC  L  BACK,+Z   BR IF YES              2-11 K0215086
                          LD   L  ORG       LOAD ORIGIN ADDRESS    2-11 K0215087
                          BSC  L  BACK,+-   BR IF ZERO             2-11 K0215088
                          BSC     E         SKIP IF ORG ADDR EVEN  2-11 K0215089
                          A       ORG01     ADD 1 TO MAKE EVEN     2-11 K0215090
                          STO  L  ORG       SAVE IN COMMUNICATIONS 2-11 K0215091
                          BSC  L  BACK      *AREA, AND CONTINUE    2-11 K0215092
                    *                                                   K0215093
                    ORG01 DC      1         CONSTANT OF 1          2-11 K0215094
                    *                                                   K0215095
                          BSS     /7F35-*   PATCH AREA                  K0215100
                          DC      0                                     K0215110
                          END     BPHAR-2                               K0215120
