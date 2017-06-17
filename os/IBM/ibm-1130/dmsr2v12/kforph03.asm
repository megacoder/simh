                          HDNG    1130 FORTRAN COMPILER PHASE 3         K0300010
                    *************************************************** K0300020
                    *STATUS - VERSION 2, MODIFICATION 12              * K0300030
                    *                                                 * K0300040
                    *FUNCTION/OPERATION-                              * K0300050
                    *   * CHECKS SUBPROGRAM AND SPECIFICATION STMNTS  * K0300060
                    *     FOR THE PROPER ORDER. REMOVES ANY STMNT     * K0300070
                    *     NUMBERS FROM THESE STATEMENTS               * K0300080
                    *   * CHECKS TO ENSURE THAT STMNTS FOLLOWING IF,  * K0300090
                    *     GO TO, RETURN, AND STOP STMNTS HAVE STMNT   * K0300100
                    *     NUMBERS                                     * K0300110
                    *   * REMOVES CONTINUE STATEMENTS THAT DO NOT HAVE* K0300120
                    *     STATEMENT NUMBERS                           * K0300130
                    *   * CHECKS THE STMNTS FOR STMNT NUMBERS         * K0300140
                    *   * CHECKS THE SYMBOL TABLE FOR A PREVIOUS ENTRY* K0300150
                    *     OF THE SAME STMNT NUMBER                    * K0300160
                    *   * PLACES THE STMNT NO. INTO THE SYMBOL TABLE  * K0300170
                    *   * PLACES THE SYMBOL TABLE ADDRESS INTO THE    * K0300180
                    *     STRING ENTRY                                * K0300190
                    *   * PHASE 3 MAKES TWO PASSES THROUGH THE STMNT  * K0300200
                    *     STRING. THE FIRST PASS CHECKS TO ASCERTAIN  * K0300210
                    *     THAT THE SUBPROGRAM AND SPECIFICATION       * K0300220
                    *     STMNTS ARE IN THE FOLLOWING SEQUENCE        * K0300230
                    *        SUBROUTINE OR FUNCTION STATEMENT         * K0300240
                    *        EXTERNAL STATEMENTS                      * K0300250
                    *        DIMENSION STATEMENTS                     * K0300260
                    *        COMMON STATEMENTS                        * K0300270
                    *        EQUIVALENCE STATEMENTS                   * K0300280
                    *   * THE SECOND PASS OF PHASE 3 SCANS THE STMNT  * K0300290
                    *     STRING FOR STMNTS WITH STMNT NUMBERS        * K0300300
                    *                                                 * K0300310
                    *ENTRY POINTS-                                    * K0300320
                    *   START-PHASE 3 IS READ INTO CORE BY PHASE 2    * K0300330
                    *         AND EXECUTION BEGUN AT LOCATION START   * K0300340
                    *                                                 * K0300350
                    *INPUT-                                           * K0300360
                    *   NONE IN THE USUAL SENSE. HOWEVER, THE STMNT   * K0300370
                    *   STRING SCANNED BY THE COMPILER MAY BE         * K0300380
                    *   CONSIDERED INPUT                              * K0300390
                    *                                                 * K0300400
                    *OUTPUT-                                          * K0300410
                    *   NONE IN THE USUAL SENSE. HOWEVER, PHASE 3     * K0300420
                    *   REMOVES STMNTS FROM THE STMNT STRING AND ADDS * K0300430
                    *   ENTRIES TO THE SYMBOL TABLE                   * K0300440
                    *                                                 * K0300450
                    *EXTERNAL ROUTINES-N/A                            * K0300460
                    *                                                 * K0300470
                    *EXITS-                                           * K0300480
                    *   NORMAL-                                       * K0300490
                    *      PHASE EXITS NORMALLY IF NO ERRORS ARE      * K0300500
                    *      FOUND. PHASE 4 IS LOADED AND EXECUTED      * K0300510
                    *   ERROR-                                        * K0300520
                    *      THE FLOW OF COMPILER PROCESSING IS NOT     * K0300530
                    *      INTERRUPTED WHEN AN ERROR IS ENCOUNTERED   * K0300540
                    *      AN ERROR STMNT REPLACES THE FAULTY STMNT   * K0300550
                    *      ON THE STRING AND STMNT SCANNING PROCESS   * K0300560
                    *      CONTINUES. AN EXCEPTION OCCURS IN THE CASE * K0300570
                    *      OF AN OVERLAP ERROR. COMPILATION IS        * K0300580
                    *      ABORTED AND CONTROL IS PASSED FROM PHASE   * K0300590
                    *      TO SUCCEEDING PHASE UNTIL AN OUTPUT PHASE  * K0300600
                    *      IS REACHED WHICH CAN PRINT AN ERROR MESSAGE* K0300610
                    *      THE ERRORS DETECTED BY PHASE 3 ARE  5, 6   * K0300620
                    *      AND 9.                                     * K0300630
                    *                                                 * K0300640
                    *TABLES/WORK AREAS-                               * K0300650
                    *   NON EXCEPT STMNT STRING, SYMBOL TABLE AND     * K0300660
                    *   FORTRAN COMMUNICATION AREA                    * K0300670
                    *                                                 * K0300680
                    *ATTRIBUTES-N/A                                   * K0300690
                    *                                                 * K0300700
                    *NOTES-                                           * K0300710
                    *   THE SWITCHES USED IN PHASE 3 FOLLOW. IF NON-  * K0300720
                    *   ZERO, THE SWITCH IS TRANSFER=T. IF ZERO, THE  * K0300730
                    *   SWITCH IS NOTMAL=N.                           * K0300740
                    *      * SW1-SUBROUTINE OR FUNCTION ALLOWABLE     * K0300750
                    *            T#NOT ALLOWABLE                      * K0300760
                    *      * SW2-TYPE STATEMENT ALLOWABLE             * K0300770
                    *            T#NOT ALLOWABLE                      * K0300780
                    *      * SW3-DIMENSION STATEMENT ALLOWABLE        * K0300790
                    *            T#NOT ALLOWABLE                      * K0300800
                    *      * SW4-COMMON STATEMENT ALLOWABLE           * K0300810
                    *            T#NOT ALLOWABLE                      * K0300820
                    *      * SW5-EQUIVALENCE STATEMENT ALLOWABLE      * K0300830
                    *            T#NOT ALLOWABLE                      * K0300840
                    *      * SW7-STATEMENT ORDER INDICATOR            * K0300850
                    *            T#STATEMENT OUT OF ORDER             * K0300860
                    *************************************************** K0300870
                          ABS                                           K0300880
                    *                                                   K0300890
                    *                        SYSTEM EQUATES             K0300900
                    MEMRY EQU     /8000                                 K0300910
                    OVERL EQU     MEMRY-1501 START OF FCOM              K0300920
                    ROL   EQU     MEMRY-68   LOCN OF RTN TO READ NXT PH K0300930
                    $PHSE EQU     /78        NO. OF PHASE NOW IN CORE   K0300940
                    PHLEN EQU     2         NO SECTORS THIS PHASE   2-9 K0300945
                          ORG     OVERL                                 K0300950
                    PHID  EQU     33         ID NUMBER THIS PHASE       K0300960
                    *                                                   K0300970
                    *                  FORTRAN COMMUNICATION AREA       K0300980
                    ORG   BSS     1    ORIGIN ADDRESS               2-9 K0300985
                    SOFS  BSS     1    START OF STRING                  K0300990
                    EOFS  BSS     1    END OF STRING                    K0301000
                    SOFST BSS     1    START OF SYMBOL TABLE            K0301010
                    SOFNS BSS     1    START OF NON-STATEMENT NUMBERS   K0301020
                    SOFXT BSS     1    START OF SUBSCRIPT TEMPORARIES   K0301030
                    SOFGT BSS     1    START OF GENERATED TEMPORARIES   K0301040
                    EOFST BSS     1    END OF SYMBOL TABLE              K0301050
                    COMON BSS     1    NEXT AVAILABLE COMMON            K0301060
                    CSIZE BSS     1    SIZE OF COMMON                   K0301070
                    ERROR BSS     1    OVERLAP ERROR                    K0301080
                    FNAME BSS     1    PROGRAM NAME                     K0301090
                          BSS     1                                     K0301100
                    SORF  BSS     1    SUBROUTINE(-) OR FUNCTION(+)     K0301110
                    CCWD  BSS     1    CONTROL CARD WORD                K0301120
                    *                BIT 15 TRANSFER TRACE              K0301130
                    *                BIT 14 ARITHMETIC TRACE            K0301140
                    *                BIT 13 EXTENDED PRECISION          K0301150
                    *                BIT 12 LIST SYMBOL TABLE           K0301160
                    *                BIT 11 LIST SUBPROGRAM NAMES       K0301170
                    *                BIT 10 LIST SOURCE PROGRAM         K0301180
                    *                BIT  9 ONE WORD INTEGERS           K0301190
                    *                BIT  8 ORIGIN                  2-9 K0301195
                    IOCS  BSS     1    IOCS CONTROL CARD WORD           K0301200
                    *                BIT 15 CARD                        K0301210
                    *                BIT 14 PAPER TAPE                  K0301220
                    *                BIT 13 TYPEWRITER                  K0301230
                    *                BIT 12 1403 PRINTER                K0301240
                    *                BIT 11 2501 READER                 K0301250
                    *                BIT 10 KEYBOARD                    K0301260
                    *                BIT  9 1442 PUNCH                  K0301270
                    *                BIT  8 DISK                        K0301280
                    *                BIT  7 1132 PRINTER                K0301290
                    *                BIT  3 PLOTTER                     K0301300
                    DFCNT BSS     1                                     K0301310
                    *                                                   K0301320
                    *                                                   K0301330
                    *                  END OF FORTRAN COMMUNICATION     K0301340
                    *                  AREA                             K0301350
                    *                                                   K0301360
                    BPHAR EQU     *+2        BEGIN PHASE AREA           K0301370
                          DC      0          LOADER WORK AREA           K0301380
                          DC      -33        -PHASE ID FOR SLET LOOKUP  K0301390
                          DC      NXTPH-*+1  TABLE FOR NEXT PHASE ENTRY K0301400
                          DC      1          SYSTEM WORK AREA           K0301410
                          ORG     *-2                                   K0301420
                    *                                                   K0301430
                    *                                                   K0301440
                    *                                                   K0301450
                    START LDX   1 PHID       GET ID FOR THIS PHASE      K0301460
                          STX  L1 $PHSE      STORE IN SYST PHASE AREA   K0301470
                          LD      ERROR      IS THERE OVERLAP ERROR     K0301480
                          BSC  L  INIT,Z     GO TO NEXT PHASE IF ERROR  K0301490
                    *                                                   K0301500
                    *                  INITIALIZE PHASE                 K0301510
                          LDX  I1 SOFS       INITIALIZE I/P STRING PT   K0301520
                    *                                                   K0301530
                    *                                                   K0301540
                    FIOCL LD    1 0          LOAD STMNT ID WORD         K0301550
                          SRA     11         GET STMNT ID TYPE          K0301560
                          S       FIOC       IS IT INTERNAL OUTPUT FMT  K0301570
                          BSC  L  MOVE,+-    BRANCH IF YES              K0301580
                    *                                                   K0301590
                    *                                                   K0301600
                    *                  CHECKS FOR A FUNCTION STMNT      K0301610
                    ST1   LD    1 0          LOAD STMNT ID WORD         K0301620
                          SRA     1                                     K0301630
                          AND     IDTPE      GET STMNT ID TYPE          K0301640
                          S       FUNCK      IS IT FUNCTION             K0301650
                          BSC  L  SUBRT,Z    BRANCH IF NOT              K0301660
                    *                                                   K0301670
                    *                                                   K0301680
                          LD      ONE        SET FUNCTION SWITCH (+)    K0301690
                          STO     SORF       IN SORF                    K0301700
                    *                                                   K0301710
                    *                                                   K0301720
                    JIM   LD      SW1        IS SUBR OR FUNC ALLOWED    K0301730
                          BSC  L  BO,Z       BRANCH IF NOT              K0301740
                    *                  DOES STMNT HAVE STMNT NUMBER     K0301750
                    *                                                   K0301760
                          MDX  L  SW1,1      SET SUBR/FUNC NOT ALLOWED  K0301770
                    *                                                   K0301780
                    *                                                   K0301790
                    *                  CHECKS THE STMNT FOR A           K0301800
                    *                  STMNT NUMBER                     K0301810
                    ABEL  LD    1 0          LOAD STMNT ID WORD         K0301820
                          BSC  L  RMOVE,E    BRANCH IF NUMBERED STMNT   K0301830
                    *                                                   K0301840
                    *                  TEST SW7                         K0301850
                    JACK  LD      SW7        IS STMNT OUT OF ORDER      K0301860
                          BSC  L  MOVE,+-    BRANCH IF NOT              K0301870
                    *                                                   K0301880
                    *                  SET UP ERROR NO. 5               K0301890
                    ER5   LD      ERR5       LOAD ERROR NO. 5           K0301900
                          STO     ERRNO      STORE                      K0301910
                          STX   1 SAVE2+1    DUMMY SAVING OF XR1    2-9 K0301914
                    *                        *NEEDED WHEN ENTERING  2-9 K0301915
                    *                        *ON ERR6               2-9 K0301916
                    *                                                   K0301920
                    *                  REPLACES THE ERRONEOUS STMNT     K0301930
                    *                  WITH AN ERROR MESSAGE            K0301940
                    *                  CLOSES UP THE STRING             K0301950
                    CLOSE LD    1 0          LOAD STMNT ID WORD         K0301960
                          SRA     2          SHIFT NORM TO RIGHT        K0301970
                          AND     IDNRM      CLEAR ALL BUT NORM         K0301980
                          STO     NRMSV                                 K0301990
                          STX   1 SAVE1      SAVE INPUT POINTER         K0302000
                          LD      ERRID      LOAD ERROR STMNT ID WORD   K0302010
                          STO   1 0          PUT ON STRING              K0302020
                          LD      EOFS       LOAD END OF STRING ADDRESS K0302030
                    *                                                   K0302040
                          S       SAVE1      GET RANGE OF MOVE LOOP BY  K0302050
                          S       NRMSV      SUBTRACTING PRESENT ADDR   K0302060
                          STO     RANGE      THEN SUBTRACTING PRESENT   K0302070
                          LDX  I3 RANGE      STMNT SIZE                 K0302080
                    *                                                   K0302090
                          MDX   3 1                                     K0302100
                          MDX   1 1          MOVE INPUT POINTER         K0302110
                          LD      ERRNO      PUT ERROR NO.              K0302120
                          STO   1 0          ON STRING                  K0302130
                          LD      SAVE1      GET ADDRESS OF             K0302140
                          A       NRMSV      NEXT STATEMENT             K0302150
                          STO     GET                                   K0302160
                          LDX  I2 GET        INITIALIZE POINTER         K0302170
                    *                                                   K0302180
                    LOOZ  LD    2 0          MOVE WORDS IN STRING       K0302190
                          STO   1 1          NEXT TO ERROR STMNT        K0302200
                    *                                                   K0302210
                          MDX   1 1          MOVE POINTERS              K0302220
                          MDX   2 1                                     K0302230
                          MDX   3 -1         DECREMENT RANGE OF LOOP    K0302240
                          MDX     LOOZ       CONTINUE LOOP              K0302250
                          STX   1 EOFS       NEW END OF STRING ADDRESS  K0302260
                          LDX  I1 SAVE1      RESET INPUT POINTER        K0302270
                    SAVE2 LDX  L1 *-*        NECESSARY IF ERR6      2-9 K0302275
                    *                                                   K0302280
                    *                SW7 TO NORMAL                      K0302290
                          SLA     16                                    K0302300
                          STO     SW7        CLEAR OUT OF ORDER SWITCH  K0302310
                          LDX  L  MOVE       GO TO NEXT STMNT           K0302320
                    *                                                   K0302330
                    *                        CONSTANTS                  K0302340
                    FIOC  DC      /1B        INTERNAL OUTPUT FORMAT     K0302350
                    ONE   DC      1          ONE                        K0302360
                    GET   DC      0          NEXT STMNT ADDR            K0302370
                    IDTPE DC      /7C00      STMNT ID TYPE MASK         K0302380
                    FUNCK DC      /3400      FUNCTION                   K0302390
                    SW1   DC      0          SWITCH 1                   K0302400
                    SW7   DC      0          SWITCH 7                   K0302410
                    ERR5  DC      5          ERROR NO. 5                K0302420
                    ERRNO DC      0          ERROR NO.                  K0302430
                    IDNRM DC      /01FF      NORM MASK                  K0302440
                    NRMSV DC      0          NORM STORAGE               K0302450
                    SAVE1 DC      0          POINTER                    K0302460
                    ERRID DC      /A008      ERROR STMNT ID WORD        K0302470
                    RANGE DC      0          RANGE OF LOOP              K0302480
                    DIP   DC      0          INPUT POINTER              K0302490
                    DIP1  DC      0          POINTER                    K0302500
                    SUBRC DC      /DC00      SUBROUTINE                 K0302510
                    REALC DC      /2400      REAL                       K0302520
                    SW2   DC      0          SWITCH 2                   K0302530
                    SW3   DC      0          SWITCH 3                   K0302540
                    INTC  DC      /0400      INTEGER                    K0302550
                    DIMC  DC      /2000      DIMENSION                  K0302560
                    COMMC DC      /1C00      COMMON                     K0302570
                    TWO   DC      2          TWO                        K0302580
                    MINUS DC      /FFFF      MINUS                      K0302590
                    VALYU DC      9          ELIMINATES STMNT NO. BITS  K0302600
                    DFILE DC      /7800-/1000   DEFINE FILE             K0302610
                    DATAS DC      /7C00-/7800   DATA                    K0302620
                    OKSW  DC      *-*        COMMON OUT OF ORDER        K0302630
                    *                                                   K0302640
                    *                  REMOVES THE STMNT NO. FROM       K0302650
                    *                  NUMBERED SPECIFICATION STMNTS.   K0302660
                    *                  ADJUSTS THE NORM                 K0302670
                    RMOVE STX   1 DIP        SAVE INPUT POINTER         K0302680
                          MDX   1 3          MOVE POINTER TO STMNT BODY K0302690
                          STX   1 DIP1       SAVE INPUT POINTER         K0302700
                          LDX  I2 DIP1                                  K0302710
                          LD   L  EOFS       LOAD END OF STRING         K0302720
                          S       DIP        GET RANGE OF MOVE LOOP     K0302730
                          S       TWO                                   K0302740
                          STO     RANGE                                 K0302750
                          LDX  I3 RANGE      INITIALIZE RANGE COUNTER   K0302760
                          MDX   1 -3         RESTORE INPUT POINTER      K0302770
                    LOOP  LD    2 0          MOVE WORD DOWN             K0302780
                          STO   1 1          TO NEW POSITION            K0302790
                          MDX   1 1          MOVE POINTERS              K0302800
                          MDX   2 1                                     K0302810
                          MDX   3 -1         DECREMENT RANGE OF MOVE    K0302820
                          MDX     LOOP       CONTINUE LOOP              K0302830
                          STX  L1 EOFS       NEW END OF STRING ADDRESS  K0302840
                          LDX  I1 DIP        RESTORE INPUT POINTER      K0302850
                          LD    1 0          REMOVE STMNT NO. BIT AND   K0302860
                          S       VALYU      ADJUST NORM IN ID WORD     K0302870
                          STO   1 0          PUT BACK ON STRING         K0302880
                          MDX     JACK       RETURN                     K0302890
                    *                                                   K0302900
                    *                  CHECKS FOR A SUBROUTINE STMNT    K0302910
                    SUBRT S       SUBRC      IS IT SUBROUTINE           K0302920
                          BSC  L  TENT,Z     BRANCH IF NOT              K0302930
                    *                                                   K0302940
                    *                                                   K0302950
                          LD      MINUS      SET SUBROUTINE SWITCH (-)  K0302960
                          STO  L  SORF       IN SORF                    K0302970
                          MDX     JIM        GO CHECK SWITCH 1          K0302980
                    *                                                   K0302990
                    *                                                   K0303000
                    TENT  MDX  L  SW1,1      SET SUBR/FUNC NOT ALLOWED  K0303010
                    *                                                   K0303020
                    *                  CHECKS FOR DEFINE FILE STMNTS    K0303030
                          S       DFILE      IS IT DEFINE FILE          K0303040
                          BSC  L  TSTOK,+-   BRANCH IF YES              K0303050
                    *                                                   K0303060
                    *                                                   K0303070
                          S       DATAS      IS IT DATA                 K0303080
                          BSC  L  CKRL,Z     BRANCH IF NOT              K0303090
                    *                                                   K0303100
                    *                                                   K0303110
                    TSTOK LD      SW5        IS EQUIVALENCE STMNT       K0303120
                          BSC  L  BO,Z       ALLOWED - BRANCH IF NOT    K0303130
                    *                                                   K0303140
                    *                                                   K0303150
                          LD      SW4        IS COMMON STMNT ALLOWED    K0303160
                          BSC  L  ABEL,+-    BRANCH IF YES              K0303170
                    *                                                   K0303180
                    *                                                   K0303190
                          STX   0 OKSW       SET COMMON OUT OF ORDER SW K0303200
                          BSC  L  ABEL       CHECK FOR STMNT NO         K0303210
                    *                                                   K0303220
                    *                                                   K0303230
                    *                  CHECKS FOR REAL STMNTS           K0303240
                    CKRL  LD    1 0          LOAD STMNT ID WORD         K0303250
                          SRA     1                                     K0303260
                          AND     IDTPE      GET STMNT ID TYPE          K0303270
                          STO     MAM        STORE ID TYPE              K0303280
                          S       REALC      IS IT REAL                 K0303290
                          BSC  L  TENT1,Z    BRANCH IF NOT              K0303300
                    *                                                   K0303310
                    *                                                   K0303320
                    SON   LD      SW2        IS TYPE STMNT ALLOWABLE    K0303330
                          BSC  L  ABEL,+-    BRANCH IF YES              K0303340
                    *                                                   K0303350
                    *                                                   K0303360
                    BO    MDX  L  SW7,1      SET STMNT OUT OF ORDER SW  K0303370
                          BSC  L  ABEL       CHECK FOR STMNT NO.        K0303380
                    *                                                   K0303390
                    *                                                   K0303400
                    *                  CHECKS FOR INTEGER, EXTERNAL,    K0303410
                    *                  AND DIMENSION STMNTS             K0303420
                    TENT1 S       INTC       IS IT INTEGER              K0303430
                          BSC  L  SON,+-     BRANCH IF YES              K0303440
                    *                                                   K0303450
                    *                                                   K0303460
                          MDX  L  SW2,1     SET TYPE NOT ALLOWABLE  212 K0303465
                          LD      MAM        LOAD STMNT ID TYPE         K0303470
                          S       EXTER      IS IT EXTERNAL             K0303480
                          BSC  L  ABEL,+-   BR IF YES               212 K0303490
                    *                                                   K0303500
                    *                                                   K0303510
                    *                                                   K0303530
                    *                                                   K0303540
                          LD    1 0          LOAD STMNT ID WORD         K0303550
                          SRA     1                                     K0303560
                          AND     IDTPE      GET STMNT ID TYPE          K0303570
                          S       DIMC       IS IT DIMENSION            K0303580
                          BSC  L  TAG3,Z     BRANCH IF NOT              K0303590
                    *                                                   K0303600
                    *                                                   K0303610
                          LD      SW3        IS DIM STMNT ALLOWABLE     K0303620
                          BSC  L  ABEL,+-    BRANCH IF YES              K0303630
                          MDX     BO         SET STMNT OUT OF ORDER SW  K0303640
                    *                                                   K0303650
                    *                                                   K0303660
                    TAG3  MDX  L  SW3,1      SET DIM NOT ALLOWABLE SW   K0303670
                    *                                                   K0303680
                    *                  CHECKS FOR COMMON STMNTS         K0303690
                          LD    1 0          LOAD STMNT ID WORD         K0303700
                          SRA     1                                     K0303710
                          AND     IDTPE      GET STMNT ID TYPE          K0303720
                          S       COMMC      IS IT COMMON               K0303730
                          BSC  L  TAG4,Z     BRANCH IF NOT              K0303740
                    *                                                   K0303750
                    *                                                   K0303760
                          LD      SW4        IS COMMON STMNT ALLOWED    K0303770
                          BSC  L  ABEL,+-    BRANCH IF YES              K0303780
                          MDX     BO         SET STMNT OUT OF ORDER SW  K0303790
                    *                                                   K0303800
                    *                  CONSTANTS                        K0303810
                    MAM   DC      0          ID STORAGE                 K0303820
                    EXTER DC      /6400      EXTERNAL                   K0303830
                    SW4   DC      0          SWITCH 4                   K0303840
                    EQUIC DC      /5400      EQUIVALENCE                K0303850
                    SW5   DC      0          SWITCH 5                   K0303860
                    CONTC DC      /5800      CONTINUE                   K0303870
                    DIP2  DC      0          TEMPORARY STORAGE          K0303880
                    DIP3  DC      0          TEMPORARY STORAGE          K0303890
                    GOTOC DC      /E000      GO TO                      K0303900
                    *                                                   K0303910
                    *                                                   K0303920
                    TAG4  MDX  L  SW4,1      SET COMMON NOT ALLOWED SW  K0303930
                    *                                                   K0303940
                    *                  CHECKS FOR EQUIVALENCE STMNTS    K0303950
                          LD    1 0          LOAD STMNT ID WORD         K0303960
                          SRA     1                                     K0303970
                          AND  L  IDTPE      GET STMNT ID TYPE          K0303980
                          S       EQUIC      IS IT EQUIVALENCE          K0303990
                          BSC  L  TAG5,Z     BRANCH IF NOT              K0304000
                    *                                                   K0304010
                    *                                                   K0304020
                          LD      SW5                                   K0304030
                          OR      OKSW       IS EQUIVALENCE STMNT       K0304040
                          BSC  L  ABEL,+-    ALLOWED - BRANCH IF YES    K0304050
                          MDX     BO         SET STMNT OUT OF ORDER SW  K0304060
                    *                                                   K0304070
                    *                                                   K0304080
                    TAG5  MDX  L  SW5,1      SET EQUIVALENCE NOT ALLOW  K0304090
                    *                                                   K0304100
                    *                  CHECKS FOR CONTINUE STMNTS       K0304110
                          LD    1 0          LOAD STMNT ID WORD         K0304120
                          SRA     1                                     K0304130
                          AND     IDSTY      GET STMNT ID TYPE          K0304140
                          S       CONTC      IS IT CONTINUE             K0304150
                          BSC  L  EFF,Z      BRANCH IF NOT              K0304160
                    *                                                   K0304170
                    *                                                   K0304180
                          LD    1 0          LOAD SWITCH ID WORD        K0304190
                          BSC  L  MOVE,E     BRANCH IF HAVE STMNT NO.   K0304200
                          BSI     RMOV1      REMOVE WORD FROM STRING    K0304210
                          BSC  L  ST1        CHECK STATEMENT            K0304220
                    *                                                   K0304230
                    *                  UPDATES THE STRING I/P PT (XR1)  K0304240
                    *                  TO MOVE TO THE NEXT STMNT        K0304250
                    MOVE  LD    1 0          LOAD STMNT ID WORD         K0304260
                          SRA     2          SHIFT RIGHT TO GET NORM    K0304270
                          AND  L  IDNRM      GET NORM                   K0304280
                          STO     NXID+1                                K0304290
                    NXID  MDX  L1            GET ADDR OF NEXT STMNT     K0304300
                          BSC  L  FIOCL      SEE IF FI0 STMNT           K0304310
                    *                                                   K0304320
                    *                  REMOVE STATEMENT FROM STRING     K0304330
                    RMOV1 DC      *-*        RETURN ADDRESS             K0304340
                          STX   1 DIP2       SAVE POINTER               K0304350
                          SRA     2          SHIFT NORM TO RIGHT        K0304360
                          AND  L  IDNRM      CLEAR ALL BUT NORM         K0304370
                    *                                                   K0304380
                          STO  L  NRMSV      ADD NORM TO POINTER        K0304390
                          A       DIP2       TO GET ADDRESS OF          K0304400
                          STO     DIP3       NEXT STATEMENT             K0304410
                    *                                                   K0304420
                          LDX  I2 DIP3       INITIALIZE LOOP INPUT PT   K0304430
                          LD   L  EOFS       GET RANGE OF LOOP BY       K0304440
                          S       DIP2       SUBTRACTING POINTER FROM   K0304450
                          S    L  NRMSV      END OF STRING THEN         K0304460
                          STO     DIP3       SUBTRACT NORM              K0304470
                    *                                                   K0304480
                          LDX  I3 DIP3       INITIALIZE RANGE COUNTER   K0304490
                          MDX   1 -1                                    K0304500
                          MDX   3 1                                     K0304510
                    LOOP1 LD    2 0          MOVE WORD DOWN             K0304520
                          STO   1 1          TO NEW POSITION            K0304530
                          MDX   1 1          MOVE POINTERS              K0304540
                          MDX   2 1                                     K0304550
                          MDX   3 -1         DECREMENT RANGE COUNTER    K0304560
                          MDX     LOOP1      CONTINUE LOOP              K0304570
                          STX  L1 EOFS       NEW END OF STRING ADDRESS  K0304580
                          LDX  I1 DIP2       RESTORE INPUT POINTER      K0304590
                          BSC  I  RMOV1      RETURN                     K0304600
                    *                                                   K0304610
                    *                                                   K0304620
                    ERR6  DC      6          ERROR NO. 6                K0304630
                    IFC   DC      /0400      IF                         K0304640
                    ENDC  DC      /0800-/4000   END                     K0304650
                    RTNCN DC      /4000-/5C00   RETURN                  K0304660
                    STOPC DC      /2000      STOP                       K0304670
                    ERCN  DC      /14-/02    ERROR                      K0304680
                    CLKST DC      /7000-/0800   CALL LINK               K0304690
                    CETST DC      /7001-/7000   CALL EIXT               K0304700
                    CLTST DC      /1800-/7001   CALL                    K0304710
                    CONT  DC      /B004      CONTINUE                   K0304720
                    IDSTY DC      /7C01      ID MASK                    K0304730
                    H000C DC      /000C      FORMAT STATEMENT       2-9 K0304731
                    *                                                   K0304740
                    *                                                   K0304750
                    *                  CHECKS FOR THE PRESENCE OF       K0304760
                    *                  TRANSFER STATEMENTS              K0304770
                    EFF   S       GOTOC      IS IT GO TO                K0304780
                          BSC  L  MOVES,+-   BRANCH IF YES              K0304790
                    *                                                   K0304800
                    *                                                   K0304810
                          S       IFC        IS IT IF                   K0304820
                          BSC  L  MOVES,+-   BRANCH IF YES              K0304830
                    *                                                   K0304840
                    *                                                   K0304850
                          S       STOPC      IS IT STOP                 K0304860
                          BSC  L  MOVES,+-   BRANCH IF YES              K0304870
                    *                                                   K0304880
                    *                                                   K0304890
                          S       RTNCN      IS IT RETURN               K0304900
                          BSC  L  MOVES,+-   BRANCH IF YES              K0304910
                    *                                                   K0304920
                    *                                                   K0304930
                          S       ENDC       IS IT END                  K0304940
                          BSC  L  INIT,+-    BRANCH IF YES              K0304950
                    *                                                   K0304960
                    *                                                   K0304970
                          S       CLKST      IS IT CALL LINK            K0304980
                          BSC  L  MOVES,+-   BRANCH IF YES              K0304990
                    *                                                   K0305000
                    *                                                   K0305010
                          S       CETST      IS IT CALL EXIT            K0305020
                          BSC  L  MOVES,+-   BRANCH IF YES              K0305030
                          MDX     MOVE       GO TO NEXT STMNT           K0305040
                    *                                                   K0305050
                    *                                                   K0305060
                    *                                                   K0305070
                    *                   MOVE TO NEXT STATEMENT          K0305080
                    MOVES LD    1 0          LOAD STMNT ID WORD         K0305090
                          SRA     2          SHIFT NORM TO RIGHT        K0305100
                          AND  L  IDNRM      GET NORM                   K0305110
                          STO     NEXT+1                                K0305120
                    *                                                   K0305130
                    *                  CHECKS FOR STMNT NUMBERS IN      K0305140
                    *                  STMNTS FOLLOWING TRANSFER        K0305150
                    *                  STMNTS                           K0305160
                    NEXT  MDX  L1            GET ADDRESS OF NEXT STMNT  K0305170
                          STX  L1 SAVE2+1    SAVE POINTER,TO BE USED2-9 K0305175
                    *                        *IF ERR6 OCCURS        2-9 K0305176
                    *                                                   K0305180
                    *                                                   K0305190
                    CKEND LD    1 0          LOAD STMNT ID WORD         K0305200
                          SRA     11         GET STMNT ID TYPE          K0305210
                          S    L  TWO        IS IT END                  K0305220
                          BSC  L  INIT,+-    BRANCH IF YES              K0305230
                    *                                                   K0305240
                    *                                                   K0305250
                          S       ERCN       IS IT ERROR                K0305260
                          BSC  L  ST1,+-     BRANCH IF YES              K0305270
                    *                                                   K0305280
                    *                  DOES STATEMENT HAVE NUMBER       K0305290
                          LD    1 0          LOAD STMNT ID WORD         K0305300
                          BSC  L  FMTST,E    BRANCH IF HAS STMNT NO.2-9 K0305310
                          S       CONT       IS IT CONTINUE             K0305320
                          BSC  L  STER6,Z    BRANCH IF NOT              K0305330
                          LD    1 0          LOAD STMNT ID WORD         K0305340
                          BSI  L  RMOV1      REMOVE STMNT FROM STRING   K0305350
                          BSC  L  CKEND      CHECK FOR END              K0305360
                    *                                                   K0305370
                    *                   SET UP ERROR NO. 6              K0305380
                    STER6 LD      ERR6       LOAD ERROR NO. 6           K0305390
                          STO  L  ERRNO      STORE IN ERROR NO.         K0305400
                          LDX  L  CLOSE      CLOSE UP STRING            K0305410
                    *                                                   K0305420
                    FMTST STX   1 RESET+1    SAVE POINTER           2-9 K0305421
                    FORMT SRA     11         IS IT                  2-9 K0305422
                          S       H000C      *FORMAT STATEMENT      2-9 K0305423
                          BSC  L  LOOP2,+-   BRANCH IF YES          2-9 K0305424
                    RESET LDX  L1 *-*        RESET POINTER          2-9 K0305425
                          BSC  L  ST1        GO OUT                 2-9 K0305426
                    LOOP2 LD    1 0          LOAD STMNT ID WORD     2-9 K0305427
                          SRA     2          GET                    2-9 K0305428
                          AND  L  IDNRM      *NORM                  2-9 K0305429
                          STO     MDX1+1     *TO STEP UP POINTER    2-9 K0305430
                    MDX1  MDX  L1 *-*        *TO NEXT STATEMENT     2-9 K0305431
                          LD    1 0          LOAD STMNT ID WORD     2-9 K0305432
                          SRA     11         GET ID TYPE            2-9 K0305433
                          S    L  TWO        IS IT END STATEMENT    2-9 K0305434
                          BSC  L  RESET,+-   BRANCH IF YES          2-9 K0305435
                          S       ERCN       IS IT ERROR            2-9 K0305436
                          BSC  L  RESET,+-   BRANCH IF YES          2-9 K0305437
                          LD    1 0          IS IT STATEMENT NUMBER 2-9 K0305438
                          BSC  L  FORMT,E    BRANCH IF YES          2-9 K0305439
                          S       CONT       IS IT CONTINUE         2-9 K0305440
                          BSC  L  LOOP2,+-   BRANCH IF YES          2-9 K0305441
                          MDX     STER6      GO TO ERROR 6          2-9 K0305442
                    *                  INITIALIZES THE PHASE        2-9 K0305443
                    *                                                   K0305450
                    *                  INITIALIZES THE PHASE            K0305460
                    *                  CHECKS FOR A PREVIOUS OVERLAP    K0305470
                    *                  ERROR                            K0305480
                    INIT  LDX  I1 SOFS       INITIALIZE INPUT POINTER   K0305490
                    *                                                   K0305500
                          LD   L  ERROR      CHECK FOR OVERLAP ERROR    K0305510
                          BSC  L  EOP,Z      BRANCH ON OVERLAP ERROR    K0305520
                    *                                                   K0305530
                    *                                                   K0305540
                    *                  CHECKS FOR THE END STMNT         K0305550
                    *                  CHECKS FOR A STMNT NO. IN STMNT  K0305560
                    *                  OTHER THAN END                   K0305570
                    ENDST LD    1            LOAD STMNT ID WORD         K0305580
                          AND     IDCL       GET STMNT ID TYPE          K0305590
                          S       IDEND      IS IT END                  K0305600
                          BSC  L  EOP,+-     BRANCH IF YES              K0305610
                    *                                                   K0305620
                    *                                                   K0305630
                          LD    1            DOES STMNT HAVE STMNT NO.  K0305640
                          BSC  L  LOOK,E     BRANCH IF YES              K0305650
                    *                                                   K0305660
                    *             MOVE TO NEXT STATEMENT                K0305670
                    MOVS  LD    1 0          LOAD STMNT ID WORD         K0305680
                          AND     NMCL       GET NORM                   K0305690
                          SRA     2          MOVE NORM TO RIGHT         K0305700
                          STO     A+1                                   K0305710
                    A     MDX  L1 0          GET ADDR OF NEXT STMNT     K0305720
                          MDX     ENDST      CHECK FOR END STMNT        K0305730
                    *                                                   K0305740
                    *                  BRANCHES TO ROL ROUTINE TO LOAD  K0305750
                    *                  THE NEXT PHASE                   K0305760
                    EOP   LDX  I1 NXTPH+1    LOAD PARAM FOR READING     K0305770
                          LDD     NXTPH+2    *NEXT PHASE                K0305780
                          BSC  L  ROL        GO TO LOAD NEXT PHASE      K0305790
                          BSS  E  0                                     K0305800
                    NXTPH DC      34         ID OF NEXT PHASE           K0305810
                          BSS     3          LOADER TBL FOR NEXT PHASE  K0305820
                    *                                                   K0305830
                    *                  REPLACES THE ERRONEOUS STMNT     K0305840
                    *                  WITH AN ERROR MESSAGE            K0305850
                    *                  CLOSES UP THE STRING             K0305860
                    CLOZE STO   1 1          STORE ERROR NUMBER         K0305870
                          LD    1            LOAD STMNT ID WORD         K0305880
                          AND     NMCL       CLEAR ALL BUT NORM         K0305890
                          SRA     2          SHIFT NORM TO RIGHT        K0305900
                          STO     C+1                                   K0305910
                          LD      ERTY       LOAD ERROR STMNT ID WORD   K0305920
                          STO   1            PUT ON STRING              K0305930
                          STX   1 TEMP       STORE INPUT POINTER        K0305940
                          LDX  I2 TEMP       INITIALIZE LOOP OUTPUT PT  K0305950
                          MDX   2 2          MODIFY PT FOR STMNT SIZE   K0305960
                          LDX  I3 TEMP       INITIALIZE LOOP INPUT PT   K0305970
                    C     MDX  L3            MODIFY TO GET ADDRESS OF   K0305980
                          MDX   3 -1         NEXT STATEMENT             K0305990
                          STX   3 TEMP                                  K0306000
                          STX   1 TNKOK      SAVE INPUT POINTER         K0306010
                          LD   L  EOFS       GET RANGE OF LOOP BY       K0306020
                          S       TEMP       SUBTRACTING POINTER FROM   K0306030
                          STO     TEMP       END OF STRING              K0306040
                          LDX  I1 TEMP       LOAD RANGE OF LOOP         K0306050
                    *                                                   K0306060
                    LOOPB MDX   3 1          RESET INPUT POINTER        K0306070
                          LD    3            MOVE WORD DOWN             K0306080
                          STO   2            IN STRING                  K0306090
                          MDX   2 1          MOVE POINTER               K0306100
                          MDX   1 -1         DECREMENT RANGE OF LOOP    K0306110
                          MDX     LOOPB      CONTINUE LOOP              K0306120
                          LDX  I1 TNKOK      RESET INPUT POINTER        K0306130
                          MDX   2 -1                                    K0306140
                          STX  L2 EOFS       NEW END OF STRING ADDRESS  K0306150
                          MDX     MOVS       GO TO NEXT STATEMENT       K0306160
                    *                                                   K0306170
                    *             CONSTANTS AND WORKING STORAGE         K0306180
                    IDCL  DC      /F800      ID MASK                    K0306190
                    IDEND DC      /1000      END                        K0306200
                    NMCL  DC      /07FC      NORM MASK                  K0306210
                    TEMP  DC      0          TEMPORARY STORAGE          K0306220
                    STNOC DC      /0200      STMNT NO. SYMBOL TABLE ID  K0306230
                    THREE DC      3          THREE                      K0306240
                    SIGN  DC      /8000      USEFUL CONSTANT            K0306250
                    TNKOK DC      0          TEMPORARY STORAGE          K0306260
                    ERTY  DC      /A008      ERROR STMNT ID WORD        K0306270
                    C2    DC      2          TWO                        K0306280
                    C9    DC      9          NINE                       K0306290
                    *                                                   K0306300
                    *                  SCANS THE SYMBOL TABLE FOR A     K0306310
                    *                  DUPLICATE STMNT NUMBER           K0306320
                    LOOK  LDX  I2 SOFST      INITIALIZE SYMBOL TABLE PT K0306330
                          MDX     RETRY+1    SKIP NEXT INSTRUCTION      K0306340
                    RETRY MDX   2 -3         GO TO NEXT TABLE ENTRY     K0306350
                          STX   2 TEMP       SAVE POINTER               K0306360
                          LD      TEMP       HAS ENTIRE SYMBOL TABLE    K0306370
                          S    L  EOFST      BEEN CHECKED FOR DUPLICATE K0306380
                          BSC  L  PUTIN,+-   BRANCH IF YES              K0306390
                    *                                                   K0306400
                          LD    2 1          COMPARE FIRST WORD         K0306410
                          S     1 1          OF NAMES - IF UNEQUAL      K0306420
                          BSC  L  RETRY,Z    GET NEW TABLE ENTRY        K0306430
                          LD    2 2          COMPARE SECOND WORD OF     K0306440
                          S     1 2          NAMES - IF UNEQUAL GET NEW K0306450
                          BSC  L  RETRY,Z    SYMBOL TABLE ENTRY         K0306460
                    *                                                   K0306470
                    *                   SET UP ERROR NO. 9              K0306480
                          LD      C9         LOAD ERROR NO.             K0306490
                          MDX     CLOZE      CLOSE UP STRING            K0306500
                    *                                                   K0306510
                    *                  PLACES THE STMNT NO. INTO THE    K0306520
                    *                  SYM TBL - UPDATES THE FORTRAN    K0306530
                    *                  COMMUNICATIONS AREA TO REFLECT   K0306540
                    *                  CHANGES IN THE TABLE'S LENGTH -  K0306550
                    *                  REPLACES THE STRING AREA STMNT   K0306560
                    *                  NUMBER WITH THE SYMBOL TABLE     K0306570
                    *                  ADDR WHERE IT IS NOW LOCATED     K0306580
                    *                                                   K0306590
                    PUTIN LD    1 1          LOAD 1ST WORD IN NAME      K0306600
                          STO   2 1          PUT IN SYMBOL TABLE        K0306610
                          LD    1 2          LOAD 2ND WORD IN NAME      K0306620
                          STO   2 2          PUT IN SYMBOL TABLE        K0306630
                          LD      STNOC      LOAD SYMBOL TABLE ID WORD  K0306640
                          STO   2            PUT IN SYMBOL TABLE        K0306650
                    *                                                   K0306660
                          MDX   2 -3         MOVE SYMBOL TABLE POINTER  K0306670
                          STX  L2 SOFNS      NEW START OF NON-STMNT-NOS K0306680
                          STX  L2 EOFST      NEW END OF SYMBOL TABLE    K0306690
                          MDX  L  SOFXT,-3   NEW START OF SUBSCR-TEMP   K0306700
                          MDX  L  SOFGT,-3   NEW START OF GENER-TEMP    K0306710
                    *                                                   K0306720
                    *             PUT RELATIVE ADDRESS IN STRING        K0306730
                          LD   L  SOFST      GET SIZE OF SYMBOL TABLE   K0306740
                          S    L  EOFST                                 K0306750
                          SRT     16         SHIFT FOR DIVIDE           K0306760
                          D       THREE      GET NO. OF ENTRIES IN TBL  K0306770
                          OR      SIGN       PUT IN SIGN                K0306780
                          STO   1 1          STORE IN STRING            K0306790
                          STX   1 B+1        SAVE INPUT POINTER         K0306800
                    B     MDX  L  0,-4       MODIFY NORM BY -1          K0306810
                          LDX  I3 B+1        INITIALIZE POINTER         K0306820
                          MDX   3 2          MOVE POINTER               K0306830
                          LD   L  EOFS       GET RANGE OF MOVE LOOP     K0306840
                          S       B+1                                   K0306850
                          STO     TEMP                                  K0306860
                          LDX  I2 TEMP       INITIALIZE RANGE COUNTER   K0306870
                          MDX   2 -2         MODIFY RANGE               K0306880
                    LOOPA LD    3 1          MOVE WORD DOWN             K0306890
                          STO   3            IN STRING                  K0306900
                          MDX   3 1          MOVE POINTER               K0306910
                          MDX   2 -1         DECREMENT RANGE            K0306920
                          MDX     LOOPA      CONTINUE LOOP              K0306930
                          MDX  L  EOFS,-1    NEW END OF STRING ADDRESS  K0306940
                    *                                                   K0306950
                    *             SYMBOL TABLE OVERLAP                  K0306960
                          LD   L  EOFS       LOAD END OF STRING         K0306970
                          S    L  EOFST      CHECK FOR OVERLAP BY SUBTR K0306980
                          BSC  L  MOVS,+Z    BRANCH NO OVERLAP      2-9 K0307000
                    *                                                   K0307010
                    *             SET UP OVERLAP ERROR                  K0307020
                          MDX  L  ERROR,1    SET ERROR INDICATOR        K0307030
                          BSC  L  EOP        GO TO END OF PHASE         K0307040
                          BSS     BPHAR+PHLEN*320-1-*  PATCH AREA   2-9 K0307050
                          DC      0                                     K0307060
                          END     BPHAR-2                               K0307070
