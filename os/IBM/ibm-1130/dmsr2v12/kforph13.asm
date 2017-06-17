                          HDNG    1130 FORTRAN COMPILER PHASE 13        K1300010
                    *************************************************** K1300020
                    *STATUS - VERSION 2  MODIFICATION 8               * K1300030
                    *                                                 * K1300040
                    *FUNCTION/OPERATION-                              * K1300050
                    *   * CHECKS FIND, READ, WRITE, AND GO TO STMNTS  * K1300060
                    *     FOR CORRECT SYNTAX, STATEMENT NUMBERS AND   * K1300070
                    *     REFERENCES, AND VARIABLES.                  * K1300080
                    *   * DETECTS IMPLIED DO LOOPS IN READ AND WRITE  * K1300090
                    *     STATEMENTS. GENERATES THE NECESSARY         * K1300100
                    *     INDICATORS.                                 * K1300110
                    *                                                 * K1300120
                    *ENTRY POINTS-                                    * K1300130
                    *   START-PHASE 13 IS READ INTO CORE BY PHASE 12  * K1300140
                    *         AND EXECUTION BEGUN AT LOCATION START.  * K1300150
                    *                                                 * K1300160
                    *INPUT-                                           * K1300170
                    *   NONE IN THE USUAL SENSE. HOWEVER THE STMNT    * K1300180
                    *   STRING SCANNED BY THE COMPILER MAY BE         * K1300190
                    *   CONSIDERED INPUT.                             * K1300200
                    *                                                 * K1300210
                    *OUTPUT-                                          * K1300220
                    *   NONE IN THE USUAL SENSE. HOWEVER, THE STMNT   * K1300230
                    *   STRING AND THE SYMBOL TABLE ALTERED BY THE    * K1300240
                    *   COMPILER MAY BE CONSIDERED OUTPUT.            * K1300250
                    *                                                 * K1300260
                    *EXTERNAL REFERENCES-N/A                          * K1300270
                    *                                                 * K1300280
                    *EXITS-                                           * K1300290
                    *   NORMAL-                                       * K1300300
                    *      PHASE EXITS NORMALLY IF NO ERRORS ARE      * K1300310
                    *      FOUND. PHASE 14 IS LOADED AND EXECUTED.    * K1300320
                    *   ERROR-                                        * K1300330
                    *      THE FLOW OF COMPILER PROCESSING IS NOT     * K1300340
                    *      INTERRUPTED WHEN AN ERROR IS ENCOUNTERED.  * K1300350
                    *      AN ERROR STMNT REPLACES THE FAULTY STMNT   * K1300360
                    *      ON THE STRING AND STMNT SCANNING PROCESS   * K1300370
                    *      CONTINUES. AN EXCEPTION OCCURS IN THE CASE * K1300380
                    *      OF AN OVERLAP ERROR. COMPILATION IS        * K1300390
                    *      ABORTED AND CONTROL IS PASSED FROM PHASE   * K1300400
                    *      TO SUCCEEDING PHASE UNTIL AN OUTPUT PHASE  * K1300410
                    *      IS REACHED WHICH CAN PRINT AN ERROR MESSAGE* K1300420
                    *      THE ERRORS DETECTED IN PHASE 13 ARE  43,   * K1300430
                    *      44,45,46,47,48,49,50, AND 68.              * K1300440
                    *                                                 * K1300450
                    *TABLES/WORK AREAS-                               * K1300460
                    *   NONE EXCEPT STATEMENT STRING AREA, SYMBOL     * K1300470
                    *   TABLE, AND FORTRAN COMMUNICATION AREA         * K1300480
                    *                                                 * K1300490
                    *ATTRIBUTES-N/A                                   * K1300500
                    *                                                 * K1300510
                    *NOTES-                                           * K1300520
                    *   THE SWITCHES USED IN PHASE 2 FOLLOW. IF NON-  * K1300530
                    *   ZERO  THE SWITCH IS TRANSFER=T. IF ZERO, THE  * K1300540
                    *   SWITCH IS NORMAL=N.                           * K1300550
                    *      * SW1-DIMENSION NAME SUBSCRIPTED           * K1300560
                    *            T=NOT SUBSCRIPTED                    * K1300570
                    *      * SW2-READ OR WRITE STATEMENT              * K1300580
                    *            T=READ STATEMENT FOUND               * K1300590
                    *            N=WRITE STATEMENT FOUND              * K1300600
                    *      * SW3-EQUAL SIGN                           * K1300610
                    *            T=EQUAL SIGN FOUND                   * K1300620
                    *      * SW4-DIMENSIONED NAME                     * K1300630
                    *            T=NAME DIMENSIONED                   * K1300640
                    *      * FNDSW-FIND STATEMENT                     * K1300650
                    *            T=FIND STATEMENT FOUND               * K1300660
                    *************************************************** K1300670
                          ABS                                           K1300680
                    *                                                   K1300690
                    *                       SYSTEM EQUATES              K1300700
                    MEMRY EQU     /8000                                 K1300710
                    OVERL EQU     MEMRY-1501 START OF FCOM          2-4 K1300720
                    ROL   EQU     MEMRY-68   LOCN OF RTN TO READ NXT PH K1300730
                    $PHSE EQU     /78        NO. OF PHASE NOW IN CORE   K1300740
                    PHLEN EQU     3          NO. OF SECTORS THIS PHASE  K1300745
                          ORG     OVERL                                 K1300750
                    PHID  EQU     43         ID NUMBER THIS PHASE       K1300760
                    *                                                   K1300770
                    *                  FORTRAN COMMUNICATION AREA       K1300780
                    ORG   BSS     1    ORIGIN ADDRESS               2-4 K1300785
                    SOFS  BSS     1    START OF STRING                  K1300790
                    EOFS  BSS     1    END OF STRING                    K1300800
                    SOFST BSS     1    START OF SYMBOL TABLE            K1300810
                    SOFNS BSS     1    START OF NON-STATEMENT NUMBERS   K1300820
                    SOFXT BSS     1    START OF SUBSCRIPT TEMPORARIES   K1300830
                    SOFGT BSS     1    START OF GENERATED TEMPORARIES   K1300840
                    EOFST BSS     1    END OF SYMBOL TABLE              K1300850
                    COMON BSS     1    NEXT AVAILABLE COMMON            K1300860
                    CSIZE BSS     1    SIZE OF COMMON                   K1300870
                    ERROR BSS     1    OVERLAP ERROR                    K1300880
                    FNAME BSS     1    PROGRAM NAME                     K1300890
                          BSS     1                                     K1300900
                    SORF  BSS     1    SUBROUTINE(-) OR FUNCTION(+)     K1300910
                    CCWD  BSS     1    CONTROL CARD WORD                K1300920
                    *                BIT 15 TRANSFER TRACE              K1300930
                    *                BIT 14 ARITHMETIC TRACE            K1300940
                    *                BIT 13 EXTENDED PRECISION          K1300950
                    *                BIT 12 LIST SYMBOL TABLE           K1300960
                    *                BIT 11 LIST SUBPROGRAM NAMES       K1300970
                    *                BIT 10 LIST SOURCE PROGRAM         K1300980
                    *                BIT  9 ONE WORD INTEGERS           K1300990
                    *                BIT  8 ORIGIN                  2-4 K1300995
                    IOCS  BSS     1    IOCS CONTROL CARD WORD           K1301000
                    *                BIT 15 CARD                        K1301010
                    *                BIT 14 PAPER TAPE                  K1301020
                    *                BIT 13 TYPEWRITER                  K1301030
                    *                BIT 12 1403 PRINTER                K1301040
                    *                BIT 11 2501 READER                 K1301050
                    *                BIT 10 KEYBOARD                    K1301060
                    *                BIT  9 1442 PUNCH                  K1301070
                    *                BIT  8 DISK                        K1301080
                    *                BIT  7 1132 PRINTER                K1301090
                    *                BIT  3 PLOTTER                     K1301100
                    *                BIT  1 UDISK                       K1301110
                    DFCNT BSS     1                                     K1301120
                    *                                                   K1301130
                    *                                                   K1301140
                    *                  END OF FORTRAN COMMUNICATION     K1301150
                    *                  AREA                             K1301160
                    *                                                   K1301170
                    *                                                   K1301180
                    BPHAR EQU     *+2       BEGIN PHASE AREA            K1301190
                          DC      0         PHASE ID FOR SLET LOOKUP    K1301200
                          DC      -43       TABLE FOR NEXT PHASE ENTRY  K1301210
                          DC      NXTPH-*+1 ONE ENTRY TO BE SET BY LDR  K1301220
                          DC      1                                     K1301230
                          ORG     *-2                                   K1301240
                    *                                                   K1301250
                    START LDX   1 PHID      GET ID FOR THIS PHASE       K1301260
                          STX  L1 $PHSE     STORE IN SYSTEM PHASE AREA  K1301270
                    *                                                   K1301280
                    *                                                   K1301290
                          LD      ERROR     TEST FOR OVERLAP ERROR      K1301300
                          BSC  L  ORGIN,+-  BRANCH IF NO ERROR          K1301310
                    *                                                   K1301320
                    *                  TRANSFERS TO THE ROL ROUTINE     K1301330
                    *                  TO LOAD THE NEXT PHASE           K1301340
                    OVERF LDX  I1 NXTPH+1   LOAD PARAMETER FOR          K1301350
                          LDD     NXTPH+2   READING NEXT PHASE          K1301360
                          BSC  L  ROL       GO TO READ NEXT PHASE       K1301370
                          BSS  E  0                                     K1301380
                    NXTPH DC      44        ID OF NEXT PHASE            K1301390
                          BSS     3         LOADER TBL FOR NEXT PHASE   K1301400
                    *                                                   K1301410
                    *                  MOVES THE STMNT STRING ADJACENT  K1301420
                    *                  TO THE SYM TBL. INITIALIZES      K1301430
                    *                  THE I/P PT. CHECKS FOR THE       K1301440
                    *                  TRACE AND IOCS INDICATORS IN     K1301450
                    *                  THE FORTRAN COMMUNICATIONS AREA  K1301460
                    ORGIN LD      EOFS      GET SIZE OF                 K1301470
                          S       SOFS      STRING - 1                  K1301480
                          STO     *+1       INITIALIZE STRING           K1301490
                          LDX  L3 *-*       SIZE COUNTER                K1301500
                          MDX   3 1         SIZE OF STRING              K1301510
                          LDX  I2 EOFS      LOOP INPUT PT               K1301520
                          LDX  I1 EOFST     LOOP OUTPUT PT              K1301530
                          LD    2 0         LOAD WORD AND MOVE IT       K1301540
                          STO   1 +2        NEXT TO SYMBOL TABLE        K1301550
                          MDX   1 -1        MOVE POINTERS               K1301560
                          MDX   2 -1                                    K1301570
                          MDX   3 -1        DECREMENT COUNTER           K1301580
                          MDX     *-6       CONTINUE LOOP               K1301590
                          MDX   1 3         INITIALIZE STRING INPUT PT  K1301600
                    *                                                   K1301610
                    *                  INITIAL PHASE                    K1301620
                          LDX  I2 SOFS      INITIALIZE STRING O/P PT    K1301630
                    *                                                   K1301640
                    *                  TRACE CONTROL RECORD PRESENT     K1301650
                          LD      CCWD      IS THERE A TRACE            K1301660
                          SLA     14        DEVICE REQUIRED             K1301670
                          BSC  L  XY1,+-    BRANCH IF NO                K1301680
                    *                                                   K1301690
                    *                                                   K1301700
                          LD      SORF      IS TRACE DEVICE PRESENT     K1301710
                          OR      IOCS      OR IN MAINLINE PROGRAM      K1301720
                          BSC  L  XY1,Z     BRANCH IF YES               K1301730
                    *                                                   K1301740
                    *                  PUT OUT ERROR NO. 50             K1301750
                          LD      SAERT     LOAD ERROR ID WORD          K1301760
                          BSI  L  CHECK     OUTPUT ERROR ID WORD        K1301770
                          LD      S50TT     LOAD ERROR NUMBER           K1301780
                          BSI  L  CHECK     OUTPUT ERROR NUMBER         K1301790
                          MDX     XY1       BEGIN BODY SCAN             K1301800
                    *                                                 * K1301810
                    *                  CONSTANTS                        K1301820
                    SAERT DC      /A008     ERROR ID WORD               K1301830
                    S50TT DC      50        ERROR NO. 50                K1301840
                    S0001 DC      /0001     ONE                         K1301850
                    S07FF DC      /07FF     NORM MASK                   K1301860
                    *                                                   K1301870
                    *                  INITIALIZES TO SCAN THE          K1301880
                    *                  STATEMENT BODY                   K1301890
                    XY1   LD    1 0         LOAD STMNT ID WORD          K1301900
                          AND     S07FF     CLEAR OUT ID TYPE           K1301910
                          SRA     2         RIGHT-JUSTIFY NORM          K1301920
                          STO  L  XY27+1    SAVE NORM                   K1301930
                          STX  L1 XT1       SAVE INPUT POINTER          K1301940
                          A    L  XT1       ADD INPUT POINTER TO GET    K1301950
                          STO  L  NXTID     ADDRESS OF NEXT STMNT       K1301960
                          STX  L2 IDSV2     SAVE OUTPUT PT              K1301970
                          STX   1 IDSV1     SAVE INPUT PT               K1301980
                          BSI  L  MOVE1     OUTPUT WORD, MOVE PT        K1301990
                          LD    1 -1        LOAD STMNT ID WORD          K1302000
                          EOR     S0001     TEST FOR STMNT NUMBER       K1302010
                          BSC  L  XY2,E     BRANCH NO STMNT NUMBER      K1302020
                          BSI  L  MOVE1     OUTPUT WORD, MOVE PT        K1302030
                          MDX  L  XY27+1,-1 DECREMENT NORM COUNTER      K1302040
                    *                                                   K1302050
                    *                                                   K1302060
                    *                  CHECKS FOR THE END STMNT         K1302070
                    XY2   LD   L  *-*       LOAD STMNT ID WORD          K1302080
                    IDSV1 EQU     XY2+1     ADDRESS OF STMNT ID WORD    K1302090
                          SRA     11        RIGHT-JUSTIFY ID TYPE       K1302100
                          S    L  TEND      IS IT END STMNT             K1302110
                          BSC  L  XY3,Z     BRANCH IF NOT               K1302120
                    *                                                   K1302130
                    *                                                   K1302140
                    XY34  MDX   2 -1        GET NEW END OF              K1302150
                          STX  L2 EOFS      STRING ADDRESS              K1302160
                          MDX     OVERF     GO TO NEXT PHASE            K1302170
                    *                                                   K1302180
                    *                                                   K1302190
                    *                  DETECTS FIND STMNTS              K1302200
                    XY4B  S    L  TFIND     IS IT FIND STMNT            K1302210
                          BSC  L  XY24,Z    BRANCH IF NOT               K1302220
                          STX   0 FNDSW     SET FIND STMNT SWITCH       K1302230
                          MDX     NSW2      CHECK FOR DEVICE            K1302240
                    *                                                   K1302250
                    *                                                   K1302260
                    *                  DETECTS READ STMNTS              K1302270
                    XY3   S    L  TREAD     IS IT READ STMNT            K1302280
                          BSC  L  XY4,Z     BRANCH IF NOT               K1302290
                    *                                                   K1302300
                    *                                                   K1302310
                          STX  L0 SW2       SET SWITCH TO READ          K1302320
                          MDX     XY6       NORMALIZE FIND SWITCH       K1302330
                    *                                                   K1302340
                    *                                                   K1302350
                    *                  DETECTS WRITE STMNTS             K1302360
                    XY4   S    L  TWRIT     IS IT WRITE STMNT           K1302370
                          BSC  L  XY4B,Z    BRANCH IF NOT               K1302380
                    *                                                   K1302390
                    *                                                   K1302400
                          STO  L  SW2       SET SWITCH TO WRITE         K1302410
                    *                                                   K1302420
                    *                                                   K1302430
                    *                  CHECKS THE SORF WORD IN THE      K1302440
                    *                  FORTRAN COMMUNICATIONS AREA FOR  K1302450
                    *                  A SUBPROGRAM INDICATOR           K1302460
                    *                  CHECKS FOR THE PRESENCE OF IOCS  K1302470
                    *                  INDICATORS IN A MAINLINE         K1302480
                    *                  COMPILATION                      K1302490
                    XY6   STO     FNDSW     NORMALIZE FIND SWITCH       K1302500
                    NSW2  LDX   3 44        PUT ERROR NO. 44            K1302510
                          STX  L3 ERNO      IN ERNO                     K1302520
                    *                                                   K1302530
                    *                                                   K1302540
                          LD   L  SORF      IS THIS SUBROUTINE          K1302550
                          BSC  L  XY6A,Z    BRANCH IF YES               K1302560
                    *                                                   K1302570
                    *                                                   K1302580
                          LD   L  IOCS      CHECK FOR VALID             K1302590
                          AND     H51FF     I/O DEVICE                  K1302600
                          BSC  L  XY6A,Z    BRANCH IF VALID DEVICE      K1302610
                    *                                                   K1302620
                    *                                                   K1302630
                    XY6B  LDX   3 45        PUT ERROR NO. 45            K1302640
                          STX  L3 ERNO      IN ERNO                     K1302650
                          BSC  L  XY7       PUT ERROR STMNT ON STRING   K1302660
                    *                                                   K1302670
                    *                                                   K1302680
                    *                  CHECKS THE SYNTAX OF FIND, READ  K1302690
                    *                  AND WRITE STATEMENTS             K1302700
                    *                  CHECKS VARIABLE NAMES AND        K1302710
                    *                  INTEGER CONSTANTS FOR VALIDITY   K1302720
                    *                  CHECKS FOR A FORMAT STMNT        K1302730
                    *                  NUMBER REFERENCE                 K1302740
                    XY6A  LD    1 0         LOAD WORD                   K1302750
                          S    L  TLP       IS CHAR LEFT PARENTHESIS    K1302760
                          BSC  L  XY7,Z     BRANCH IF NOT               K1302770
                    *                                                   K1302780
                    *                       CALL PUT (I/O OPERATOR)     K1302790
                          STX   2 IOOPS     SAVE OUTPUT POINTER         K1302800
                          LD   L  IOOP      LOAD I/O OPERATOR           K1302810
                          BSI  L  PUT       PUT ON OUTPUT STRING        K1302820
                    *                                                   K1302830
                    *                                                   K1302840
                          LD    1 0         LOAD WORD                   K1302850
                          BSI  L  CHECK     PUT ON OUTPUT STRING        K1302860
                    *                                                   K1302870
                    *                                                   K1302880
                          MDX   1 1         MOVE INPUT POINTER          K1302890
                    *                                                   K1302900
                    *                                                   K1302910
                          LD    1 0         LOAD WORD                   K1302920
                          BSI  L  GETID     GET SYM TBL ID WORD         K1302930
                          AND  L  S5BDE     CHECK TO SEE IF             K1302940
                          EOR     S4000     IT IS INTEGER               K1302950
                          BSC  L  XY7,Z     BRANCH IF NOT               K1302960
                    *                                                   K1302970
                    *                                                   K1302980
                          BSI  L  MOVE1     OUTPUT WORD, MOVE POINTER   K1302990
                    *                                                   K1303000
                    *                                                   K1303010
                          LD    1 0         LOAD WORD                   K1303020
                          S       TCMA      IS CHARACTER COMMA          K1303030
                          BSC  L  XY5,Z     BRANCH IF NOT               K1303040
                    *                                                   K1303050
                    *                                                   K1303060
                          LD   L  IOCS      IS THERE I/O DEVICE OTHER   K1303070
                          AND     H517F     THAN DISK, OR IS THIS       K1303080
                          OR   L  SORF      SUBROUTINE                  K1303090
                          BSC  L  XY6B,+-   BRANCH IF NEITHER           K1303100
                    *                       IN A MAINLINE ONLY.         K1303110
                    *                                                   K1303120
                    *                                                   K1303130
                          BSI  L  MOVE1     OUTPUT WORD, MOVE POINTER   K1303140
                    *                                                   K1303150
                    *                                                   K1303160
                          LD    1 0         LOAD WORD                   K1303170
                          BSI  L  GETID     GET SYM TBL ID WORD         K1303180
                          SLA     9         IS IT FORMAT STATEMENT      K1303190
                          BSC  L  XY9,+Z    BRANCH IF YES               K1303200
                    *                                                   K1303210
                    *                                                   K1303220
                          LDX   3 46        PUT ERROR NO. 46            K1303230
                          STX   3 ERNO      IN ERNO                     K1303240
                          BSC  L  XY7       PUT ERROR STMNT ON STRING   K1303250
                    *                                                   K1303260
                    H51FF DC      /51FF     MASK FOR DEVICE CHECK       K1303270
                    FNDSW DC      0         FIND SWITCH                 K1303280
                    COLON DC      /32       COLON                       K1303290
                    H517F DC      /517F     NON-DISK IOCS MASK          K1303300
                    DIOOP DC      /30       DISK I/O OPERATOR           K1303310
                    APOST DC      /42-/12   APOSTROPHE                  K1303320
                    TEN   DC      10        CONSTANT TEN            2-8 K1303325
                    *                                                   K1303330
                    *                                                   K1303340
                    *                  CHECKS FOR THE APOSTROPHE (')    K1303350
                    *                  MARK - CHANGES IT TO A COMMA     K1303360
                    *                  OPERATOR                         K1303370
                    XY5   S       APOST     IS CHARACTER APOSTROPHE     K1303380
                          BSC  L  XY5A,+-   BRANCH IF YES           2-3 K1303385
                          LD      FNDSW     BRANCH IF THIS IS       2-3 K1303388
                          BSC  L  XY7,Z     *A FIND STATEMENT       2-8 K1303389
                    *                                                   K1303390
                          LD    3 0         LOAD STMNT ID WORD      2-8 K1303392
                          BSC  L  XY8,-     BRANCH IF VARIABLE      2-8 K1303393
                          LD    3 1         LOAD CONSTANT           2-8 K1303394
                          S       TEN       COMPARE WITH TEN        2-8 K1303395
                          BSC  L  XY7,Z     ERROR IF NOT EQUAL      2-8 K1303397
                          MDX     XY8       BRANCH TO CONTINUE      2-8 K1303399
                    *                                                   K1303400
                    *                                                   K1303410
                    XY5A  LD      TCOP      REPLACE APOSTROPHE ON       K1303420
                          STO   1 0         INPUT STRING WITH COMMA     K1303430
                    *                                                   K1303440
                    *                                                   K1303450
                          LD   L  IOCS      REMOVE ALL BITS FROM IOCS   K1303460
                          SLA     8         WORD EXCEPT BIT FOR DISK    K1303470
                          SRA     15        IS DISK DEVICE PRESENT OR   K1303480
                          OR   L  SORF      IS THIS SUBROUTINE          K1303490
                          BSC  L  XY6B,+-   BRANCH IF NEITHER           K1303500
                    *                                                   K1303510
                    *                                                   K1303520
                    *                                                   K1303530
                          LD   L  DFCNT     LOAD FILE COUNT             K1303540
                          OR   L  SORF      COMBINE WITH SORF           K1303550
                          BSC  L  SKCOL,Z   BRANCH IF HAVE EITHER       K1303560
                    *                                                   K1303570
                    *                                                   K1303580
                          LDX   3 70        PUT ERROR NO. 70            K1303590
                          STX   3 ERNO      INTO ERNO                   K1303600
                          BSC  L  XY7       PUT ERROR STMNT ON STRING   K1303610
                    *                                                   K1303620
                    *                                                   K1303630
                    *                  CHECKS FOR THE COLON OPTR. IF    K1303640
                    *                  FOUND CHANGES THE I/O OPTR TO    K1303650
                    *                  A DISK OPTR. CHANGES THE COLON   K1303660
                    *                  OPTR BACK TO A RIGHT             K1303670
                    *                  PARENTHESIS OPERATOR.            K1303680
                    SKCOL LD    1 0         LOAD WORD                   K1303690
                          S       COLON     IS CHARACTER COLON          K1303700
                          BSC  L  REPL,-+   BRANCH IF YES               K1303710
                          BSI  L  MOVE1     OUTPUT WORD, MOVE POINTER   K1303720
                          MDX     SKCOL     GET NEXT WORD               K1303730
                    REPL  LD      RPARN     LOAD RIGHT PARENTHESIS      K1303740
                          STO   1 0         PUT IN PLACE OF COLON       K1303750
                          LD      DIOOP     REPLACE I/O OPERATOR WITH   K1303760
                          STO  L  *-*       DISK I/O OPERATOR           K1303770
                    IOOPS EQU     *-1       ADDRESS OF I/O OPERATOR     K1303780
                          MDX     CLMV1     CONTINUE STMNT CHECK        K1303790
                    *                                                   K1303800
                    *                                                   K1303810
                    XY9   BSI  L  MOVE1     OUTPUT WORD, MOVE POINTER   K1303820
                    *                                                   K1303830
                    *                                                   K1303840
                    XY8   LD    1 0         LOAD WORD                   K1303850
                          S       TRP       IS CHAR RIGHT PARENTHESIS   K1303860
                          BSC  L  XY7,Z     BRANCH IF NOT               K1303870
                    *                                                   K1303880
                    *                                                   K1303890
                    *                  CHECKS FOR THE SEMICOLON OPTR    K1303900
                    *                  IN FIND STMNTS.                  K1303910
                    CLMV1 BSI  L  MOVE1     OUTPUT WORD, MOVE POINTER   K1303920
                    *                                                   K1303930
                    *                  SEMI-COLON MUST FOLLOW FIND      K1303940
                          LD      FNDSW     IS THIS FIND STMNT          K1303950
                          BSC  L  XY8A,+-   BRANCH IF NOT               K1303960
                          LD    1 0         IS CHARACTER SEMI-COLON     K1303970
                          BSC  L  XY7,Z     BRANCH IF NOT               K1303980
                          BSC  L  XY11      CORRECT STMNT NORM          K1303990
                    XY8A  LD    1 0         IS CHAR SEMI-COLON      2-7 K1304000
                          BSC  L  CKCMA,Z   BRANCH IF NO            2-7 K1304005
                          LD   I  IOOPS     GO TO ERROR IF THIS IS  2-7 K1304010
                          S       DIOOP     *A FORMATTED DISK READ  2-7 K1304015
                          BSC  L  XY7,+-    *OR WRITE               2-7 K1304020
                          LD      SW2       IS IT READ STATEMENT    2-7 K1304025
                          BSC  L  CKCMA,Z   BRANCH IF YES           2-7 K1304030
                          LD    1 -3        IS IT UNFORMATTED WRITE     K1304040
                          S       TLP       WITH NO LIST                K1304050
                          BSC  L  XY7,+-    BRANCH IF YES               K1304060
                    *                                                   K1304080
                    CKCMA LD      TCOP      PUT COMMA ON                K1304090
                          BSI  L  CHECK     OUTPUT STRING               K1304100
                    *                                                   K1304110
                    *                                                   K1304120
                          LDX   3 47        PUT ERROR NO. 47            K1304130
                          STX   3 ERNO      INTO ERNO                   K1304140
                          MDX     XY10      START LIST CHECK            K1304150
                    *                                                   K1304160
                    *                  CONSTANTS                        K1304170
                    XT1   DC      0         TEMPORARY STORAGE           K1304180
                    SW2   DC      0         SWITCH 2                    K1304190
                    TEND  DC      /02       END ID                      K1304200
                    TREAD DC      /12-/02   READ ID                     K1304210
                    TWRIT DC      /11-/12   WRITE ID                    K1304220
                    TFIND DC      /1D-/11   FIND ID                     K1304230
                    ERNO  DC      0         ERROR NUMBER                K1304240
                    TLP   DC      /10       LEFT PARENTHESIS            K1304250
                    IOOP  DC      /26       I/O OPERATOR                K1304260
                    S4000 DC      /4000     MASK TO CHECK FOR INTEGER   K1304270
                    TRP   DC      /02       RIGHT PARENTHESIS           K1304280
                    RPARN EQU     TRP       RIGHT PARENTHESIS           K1304290
                    ICMA  DC      /12       COMMA                       K1304300
                    TCMA  EQU     ICMA      COMMA                       K1304310
                    TCOP  EQU     ICMA      COMMA                       K1304320
                    TRGLP DC      /22-/10   SPECIAL SKIP INDICATOR      K1304330
                    TWO   DC      2         TWO                         K1304340
                    S5BDE DC      /5BDE     MASK FOR INTEGER VARIABLE   K1304350
                    TRGOP DC      /22       SPECIAL SKIP INDICATOR      K1304360
                    DOAOP DC      /2A       DOA INDICATOR               K1304370
                    ALL   DC      0         INDEXING PARAMETER COUNTER  K1304380
                    HLQSP DC      /02-/12   RIGHT PARENTHESIS           K1304390
                    FOUR  DC      4         FOUR                        K1304400
                    SF802 DC      /F803     MASK TO CLEAR OUT NORM      K1304410
                    S0020 DC      /0020     VARIABLE DEFINED BIT MASK   K1304420
                    SFFDE DC      /FFDE     MASK FOR INTEGER VARIABLE   K1304430
                    SDBDE DC      /DBDE     CON OR VAR INTEGER MASK     K1304440
                    *                                                   K1304450
                    *                                                   K1304460
                    XY10  LD    1 0         IS CHAR SEMI-COLON          K1304470
                          BSC  L  XY11,+-   BRANCH IF YES               K1304480
                    *                                                   K1304490
                    *                                                   K1304500
                    *                  CHECKS A VARIABLE FOR DEFINITION K1304510
                    *                  IF DEFINED, SETS THE INDICATOR   K1304520
                    *                  IN THE SYM TBL ID WORD           K1304530
                    XY14  LD    1 0         IS IT SPECIAL CHARACTER     K1304540
                          BSC  L  XY12,-    BRANCH IF YES               K1304550
                    *                                                   K1304560
                    *                                                   K1304570
                          BSI  L  GETID     GET SYM TBL ID WORD         K1304580
                          BSI  L  TESTV     TEST VALIDITY OF VARIABLE   K1304590
                    *                                                   K1304600
                    *                                                   K1304610
                          LD      SW2       IS IT READ STMNT            K1304620
                          BSC  L  XY14A,+-  BRANCH IF NOT               K1304630
                    *                                                   K1304640
                    *                                                   K1304650
                          LD    3 0         LOAD SYM TBL ID WORD        K1304660
                          OR      S0020     ADD DEFINED VAR BIT         K1304670
                          STO   3 0         PUT BACK IN SYM TBL         K1304680
                    *                                                   K1304690
                    *                                                   K1304700
                    XY14A BSI  L  NAME      POSITION PT TO NEXT VAR     K1304710
                    *                                                   K1304720
                    *                                                   K1304730
                    XY17  LD    1 0         LOAD WORD                   K1304740
                          S       TCMA      IS CHARACTER COMMA          K1304750
                          BSC  L  XY13,Z    BRANCH IF NOT               K1304760
                    *                                                   K1304770
                    *                                                   K1304780
                          BSI  L  MOVE1     OUTPUT COMMA, MOVE PT       K1304790
                          MDX     XY14      START LIST CHECK AGAIN      K1304800
                    *                                                   K1304810
                    *                                                   K1304820
                    XY12  S       TLP       IS CHAR LEFT PARENTHESIS    K1304830
                          BSC  L  XY15,Z    BRANCH IF NOT               K1304840
                    *                                                   K1304850
                    *                                                   K1304860
                          BSI  L  DO        CHECK FOR IMPLIED DO LOOP   K1304870
                    *                                                   K1304880
                    *                                                   K1304890
                          LD   L  SW3       WAS EQUAL SIGN FOUND        K1304900
                          BSC  L  XY7,+-    BRANCH IF NOT               K1304910
                          MDX     XY16      PROCESS IMPLIED DO LOOPS    K1304920
                    *                                                   K1304930
                    *                                                   K1304940
                    XY15  S       TRGLP     IS CHAR SPECIAL SKIP OPTR   K1304950
                          BSC  L  XY7,Z     BRANCH IF NOT               K1304960
                    *                                                   K1304970
                    *                                                   K1304980
                          LDX   3 3         NO. WORDS TO BE SKIPPED     K1304990
                    *                                                   K1305000
                    *                                                   K1305010
                          BSI  L  OUT       OUTPUT THREE WORDS          K1305020
                    *                                                   K1305030
                    *                                                   K1305040
                          LD    1 0         LOAD CHARACTER              K1305050
                          S       TCMA      IS CHARACTER COMMA          K1305060
                          BSC  L  XY13,Z    BRANCH IF NOT               K1305070
                    *                                                   K1305080
                    *                                                   K1305090
                          MDX   1 1         MOVE POINTER                K1305100
                          MDX     XY14      CHECK REST OF LIST          K1305110
                    *                                                   K1305120
                    *                                                   K1305130
                    *                  CHECKS FOR A NON-DIMENSIONED     K1305140
                    *                  INTEGER VARIABLE                 K1305150
                    *                  INDICATES DEFINITION IF DEFINED  K1305160
                    *                  GENERATES THE DO-INITIALIZE OPTR K1305170
                    XY16  LDX  I1 DOX       GET ADDRESS OF              K1305180
                          MDX   1 -1        VARIABLE                    K1305190
                    *                                                   K1305200
                    *                                                   K1305210
                          STX   2 XT1       STORE OUTPUT POINTER        K1305220
                          LD      XT1       CHECK TO SEE IF             K1305230
                          A       TWO       OVERLAP BETWEEN INPUT       K1305240
                          S    L  DOY       AND OUTPUT STRING           K1305250
                          BSC  L  CK1,-     BRANCH IF OVERLAP           K1305260
                    *                                                   K1305270
                    *                  NON-DIMENSIONED INTEGER VARIABLE K1305280
                          LD    1 0         LOAD WORD                   K1305290
                          BSI  L  GETID     GET SYM TBL ID WORD         K1305300
                          SLA     16        MANIPULATIONS TO            K1305310
                          S    L  SORF      DETERMINE WHICH             K1305320
                          SLA     1         MASK TO USE                 K1305330
                          LD      SDBDE     MAINLINE OR SUBROUTINE MASK K1305340
                          BSC     C         BRANCH NOT FUNCTION         K1305350
                          LD      SFFDE     FUNCTION MASK               K1305360
                          AND   3 0         TEST TO SEE IF VALID        K1305370
                          EOR     S4000     NON-DIMENSIONED INTEGER VAR K1305380
                          BSC  L  XY7,Z     BRANCH IF NOT VALID         K1305390
                    *                                                   K1305400
                    *                                                   K1305410
                          LD    3 0         LOAD SYM TBL ID WORD        K1305420
                          OR      S0020     PUT IN VARIABLE DEFINED BIT K1305430
                          STO   3 0         PUT BACK IN SYMBOL TABLE    K1305440
                    *                                                   K1305450
                    *                                                   K1305460
                          BSI  L  MOVE1     OUTPUT VARIABLE,MOVE PT     K1305470
                    *                                                   K1305480
                    *                                                   K1305490
                          LD      TRGOP     REPLACE VARIABLE IN INPUT   K1305500
                          STO   1 -1        STRING WITH SKIP OPERATOR   K1305510
                    *                                                   K1305520
                    *                                                   K1305530
                          LD      DOAOP     PUT DOA OPERATOR            K1305540
                          BSI  L  PUT       ON OUTPUT STRING            K1305550
                    *                                                   K1305560
                    *                                                   K1305570
                          LD      TLP       REPLACE EQUAL SIGN IN       K1305580
                          STO   1 0         INPUT STRING                K1305590
                    *                                                   K1305600
                    *                                                   K1305610
                          SLA     16        SET INDEXING PARAMETER      K1305620
                          STO     ALL       COUNTER TO ZERO             K1305630
                    *                                                   K1305640
                    *                                                   K1305650
                          MDX   1 1         MOVE POINTER                K1305660
                    *                                                   K1305670
                    *                                                   K1305680
                    XY21  STX   2 XT1       STORE OUTPUT POINTER        K1305690
                          LD      XT1       CHECK TO SEE IF             K1305700
                          A       TWO       OVERLAP BETWEEN INPUT       K1305710
                          S    L  DOY       AND OUTPUT STRING           K1305720
                          BSC  L  CK1,-     BRANCH IF OVERLAP           K1305730
                    *                                                   K1305740
                    *                                                   K1305750
                          LD    1 0         GET INDEXING PARAMETER      K1305760
                          BSI  L  GETID     GET SYM TBL ID WORD         K1305770
                          AND     S5BDE     CHECK FOR VALID INTEGER     K1305780
                          EOR     S4000     CONSTANT OR VARIABLE        K1305790
                          BSC  L  XY7,Z     BRANCH IF NOT VALID         K1305800
                    *                                                   K1305810
                    *                                                   K1305820
                          BSI  L  MOVE1     OUTPUT WORD, MOVE PT        K1305830
                    *                                                   K1305840
                    *                                                   K1305850
                          LD      ALL       IS PARAMETER CTR ZERO       K1305860
                          BSC  L  XY18,+-   BRANCH IF YES               K1305870
                    *                                                   K1305880
                    *                                                   K1305890
                          BSI  L  DELET     REMOVE WORD FROM STRING     K1305900
                          MDX     XY19      CHECK NEXT WORD ON LIST     K1305910
                    *                                                   K1305920
                    *                                                   K1305930
                    XY18  LD      TRGOP     REPLACE INDEXING PARAMETER  K1305940
                          STO   1 -1        WITH SKIP OPERATOR          K1305950
                    *                                                   K1305960
                    *                                                   K1305970
                    XY19  MDX  L  ALL,1     INCREMENT IDX PARAM CTR     K1305980
                    *                                                   K1305990
                    *                                                   K1306000
                          LD    1 0         LOAD WORD                   K1306010
                          S    L  TCOP      IS CHARACTER COMMA          K1306020
                          BSC  L  XY20,Z    BRANCH IF NOT               K1306030
                    *                                                   K1306040
                    *                                                   K1306050
                          BSI  L  MOVE1     OUTPUT COMMA, MOVE PT       K1306060
                    *                                                   K1306070
                    *                  CALL DELET                       K1306080
                          BSI  L  DELET     REMOVE WORD FROM STRING     K1306090
                          MDX     XY21      CHECK NEXT INDEXING PARAM   K1306100
                    *                                                   K1306110
                    *                                                   K1306120
                    XY20  S    L  HLQSP     IS CHAR RIGHT PARENTHESIS   K1306130
                          BSC  L  XY7,Z     BRANCH IF NOT               K1306140
                    *                                                   K1306150
                    *                                                   K1306160
                          BSI  L  MOVE1     OUTPUT WORD, MOVE PT        K1306170
                    *                                                   K1306180
                    *                                                   K1306190
                          BSI  L  DELET     REMOVE WORD FROM STMNT      K1306200
                    *                                                   K1306210
                    *                                                   K1306220
                          LD   L  ALL       IS INDEXING PARAM CTR       K1306230
                          S    L  ONE       LESS THAN ONE               K1306240
                          BSC  L  XY7,+     BR IF YES                   K1306250
                    *                                                   K1306260
                          S    L  TWO       IS IT .GT. THREE            K1306270
                          BSC  L  XY7,-Z    BR IF YES                   K1306280
                    *                                                   K1306290
                          LDX  I1 DOY       MOVE START LIST PT TO       K1306300
                          MDX   1 1         NEXT WORD IN LIST           K1306310
                          BSC  L  XY10      CHECK REST OF LIST          K1306320
                    *                                                   K1306330
                    *                                                   K1306340
                    XY13  LD    1 0         IS CHAR SEMI-COLON          K1306350
                          BSC  L  XY7,Z     BRANCH IF NOT               K1306360
                    *                                                   K1306370
                    *                  MOVES A WORD TO THE O/P STRING   K1306380
                    *                  ADJUSTS THE STMNT NORM           K1306390
                    XY11  BSI  L  PUT       PUT CHAR ON OUTPUT STRING   K1306400
                    *                                                   K1306410
                    *                  CORRECT STATEMENT NORM           K1306420
                          LD   I  IDSV2     CLEAR NORM                  K1306430
                          AND  L  SF802     SAVE ID WORD                K1306440
                          STO     XT4       SAVE OUTPUT POINTER         K1306450
                          STX   2 XT3       GET NEW NORM BY SUBTRACTING K1306460
                          LD      XT3       ADDRESS OF ID WORD FROM     K1306470
                          S       IDSV2     PRESENT POINTER             K1306480
                          SLA     2                                     K1306490
                          A       XT4       PUT NORM IN ID WORD         K1306500
                          STO  I  IDSV2     PUT BACK ON OUTPUT STRING   K1306510
                          MDX     XY22      MOVE TO NEXT STMNT          K1306520
                    *                                                   K1306530
                    *                  CONSTANTS                        K1306540
                    XT3   DC      0         TEMPORARY STORAGE           K1306550
                    XT4   DC      0         TEMPORARY STORAGE           K1306560
                    ERID  DC      /A008     ERROR ID WORD               K1306570
                    *                                                   K1306580
                    *                  REPLACES THE ERRONEOUS STMNT     K1306590
                    *                  BY AN ERROR MESSAGE              K1306600
                    XY7   LDX  L2 *-*       LOAD OUTPUT POINTER WITH    K1306610
                    IDSV2 EQU     XY7+1     ADDRESS OF OUTPUT ID WORD   K1306620
                          LD    2 0         LOAD OUTPUT WORD            K1306630
                          EOR     FIVE      BRANCH IF HAS NO            K1306640
                          BSC  L  *+5,E     STATEMENT NUMBER            K1306650
                          LD      FIVE      PUT STMNT NO. BIT AND ADD   K1306660
                          A       ERID      ONE TO NORM OF ID WORD      K1306670
                          STO   2 0         PUT ON OUTPUT STRING        K1306680
                          MDX   2 1         MOVE POINTER                K1306690
                          MDX     *+3       GO PUT ERROR NO. ON STRING  K1306700
                          LD   L  ERID      LOAD ERROR ID WORD          K1306710
                          STO   2 0         PUT ON OUTPUT STRING        K1306720
                          LD   L  ERNO      LOAD ERROR NUMBER           K1306730
                          STO   2 1         PUT ON STRING               K1306740
                          MDX   2 2         MOVE POINTER                K1306750
                    *                                                   K1306760
                    *                  MOVE TO NEXT STATEMENT           K1306770
                    XY22  LDX  L1 *-*       LOAD INPUT POINTER WITH     K1306780
                    NXTID EQU     XY22+1    NEXT STMNT ADDRESS          K1306790
                          BSC  L  XY1       SCAN STMNT                  K1306800
                    *                                                   K1306810
                    *                                                   K1306820
                    *                  CHECKS THE SYNTAX OF GO TO       K1306830
                    *                  STMNTS - CHECKS THE STMNT NO.    K1306840
                    *                  LIST FOR VALID REFERENCES        K1306850
                    XY24  S       TGOTO     IS IT GO TO STMNT           K1306860
                          BSC  L  W11,Z     BRANCH IF NOT               K1306870
                    *                                                   K1306880
                    *                                                   K1306890
                          LDX   3 48        PUT ERROR NO. 48            K1306900
                          STX  L3 ERNO      IN ERNO                     K1306910
                    *                                                   K1306920
                    *                                                   K1306930
                          LD      GOTOP     LOAD GO TO OPERATOR         K1306940
                          BSI     CHECK     PUT ON OUTPUT STRING        K1306950
                    *                                                   K1306960
                    *                                                   K1306970
                          LD    1 0         LOAD WORD                   K1306980
                          S       ULP       IS CHAR LEFT PARENTHESIS    K1306990
                          BSC  L  XY26,+-   BRANCH IF YES               K1307000
                    *                                                   K1307010
                    *                                                   K1307020
                          BSI  L  LIST      CHECK FOR CORRECT FORMAT    K1307030
                    *                                                   K1307040
                    *                                                   K1307050
                          LD   L  CNT       IS NO. OF PLACES TO BRANCH  K1307060
                          S       THER      GREATER THAN ONE            K1307070
                          BSC  L  XY7,Z     BRANCH IF YES               K1307080
                    XYZ13 MDX     XY13      CHECK FOR END OF STMNT      K1307090
                    *                                                   K1307100
                    *                                                   K1307110
                    XY26  BSI     MOVE1     OUTPUT WORD, MOVE POINTER   K1307120
                    *                                                   K1307130
                    *                                                   K1307140
                          BSI  L  LIST      CHECK FOR CORRECT FORMAT    K1307150
                    *                                                   K1307160
                    *                                                   K1307170
                          LD    1 0         IS CHARACTER                K1307180
                          S       URP       RIGHT PARENTHESIS           K1307190
                          BSC  L  XY7,Z     BRANCH IF NOT               K1307200
                    *                                                   K1307210
                    *                                                   K1307220
                          LD   L  CNT       LOAD COUNT OF STMNT NOS.    K1307230
                          EOR     FIVE      IS COUNT ODD                K1307240
                          BSC  L  XY7,E     BRANCH IF YES               K1307250
                    *                                                   K1307260
                    *                                                   K1307270
                          LDX   3 49        PUT ERROR NO. 49            K1307280
                          STX  L3 ERNO      IN ERNO                     K1307290
                    *                                                   K1307300
                    *                                                   K1307310
                          BSI     MOVE1     OUTPUT WORD, MOVE POINTER   K1307320
                    *                                                   K1307330
                    *                                                   K1307340
                          LD    1 0         IS CHARACTER                K1307350
                          S       UCMA      COMMA                       K1307360
                          BSC  L  XY7,Z     BRANCH IF NOT               K1307370
                    *                                                   K1307380
                    *                                                   K1307390
                          BSI     MOVE1     OUTPUT WORD, MOVE POINTER   K1307400
                    *                                                   K1307410
                    *                                                   K1307420
                          LD    1 0         LOAD WORD                   K1307430
                          BSI     GETID     GET SYM TBL ID WORD         K1307440
                          AND     TDBDE     IS IT NON-DIMENSIONED       K1307450
                          EOR     T4000     INTEGER VARIABLE            K1307460
                          BSC  L  XY7,Z     BRANCH IF NOT               K1307470
                    *                                                   K1307480
                    *                                                   K1307490
                          BSI     MOVE1     OUTPUT WORD, GET NEXT WORD  K1307500
                          MDX     XYZ13     CHECK FOR END OF STMNT      K1307510
                    *                                                   K1307520
                    *                  CONSTANTS                        K1307530
                    T4000 DC      /4000     INTEGER MASK - PART 2       K1307540
                    TDBDE DC      /DBDE     INTEGER MASK - PART 1       K1307550
                    FIVE  DC      5         STMNT NO. MASK              K1307560
                    TGOTO DC      /0E-/1D   GO TO ID TYPE               K1307570
                    ULP   DC      /10       LEFT PARENTHESIS            K1307580
                    URP   DC      /02       RIGHT PARENTHESIS           K1307590
                    UCMA  DC      /12       COMMA                       K1307600
                    GOTOP DC      /16       GO TO STMNT ID TYPE         K1307610
                    THER  DC      1         ONE                         K1307620
                    *************************************************** K1307630
                    *                  GETS THE ID WORD FROM THE      * K1307640
                    *                  SYMBOL TABLE ENTRY.            * K1307650
                    *************************************************** K1307660
                    *                                                   K1307670
                    *                                                   K1307680
                    GETID DC      0         ENTRY POINT                 K1307690
                          BSC  L  XY7,-     BRANCH IF SPECIAL OPERATOR  K1307700
                          AND     SO1FF     GET NO. OF TBL ENTRY        K1307710
                          SLA     2         GET ADDRESS RELATIVE TO     K1307720
                          STO     *+6       START OF SYM TBL BY         K1307730
                          SRA     2         MULTIPLYING NO. OF ENTRY BY K1307740
                          S       *+4       THREE (SIZE OF ENTRY)       K1307750
                          A    L  SOFST     GET ABSOLUTE ADDRESS - 3    K1307760
                          STO     *+1       OF SYM TBL ENTRY            K1307770
                          LDX  L3 *-*       INITIALIZE SYM TBL PT       K1307780
                          MDX   3 3         GET SYM TBL ENTRY ADDR      K1307790
                          LD    3 0         LOAD SYM TBL ID WORD        K1307800
                          BSC  I  GETID     RETURN                      K1307810
                    *                                                   K1307820
                    *                  CONSTANTS                        K1307830
                    SO1FF DC      /07FF     MASK TO GET SYM TBL NO.     K1307840
                    *************************************************** K1307850
                    *                  MOVES THE WORD IN THE ACC TO   * K1307860
                    *                  THE OUTPUT STRING              * K1307870
                    *                  MOVES THE POINTER              * K1307880
                    *************************************************** K1307890
                    *                                                 * K1307900
                    *                                                   K1307910
                    PUT   DC      0         ENTRY POINT                 K1307920
                          STO   2 0         PUT WORD ON OUTPUT STRING   K1307930
                    *                                                   K1307940
                    *                                                   K1307950
                          MDX   2 1         MOVE POINTER                K1307960
                    *                                                   K1307970
                    *                                                   K1307980
                          BSC  I  PUT       RETURN                      K1307990
                    *************************************************** K1308000
                    *                  CHECKS FOR AN OVERLAP CONDITION* K1308010
                    *                  BETWEEN THE INPUT AND OUTPUT   * K1308020
                    *                  STMNT STRINGS                  * K1308030
                    *************************************************** K1308040
                    *                                                   K1308050
                    *                                                   K1308060
                    CHECK DC      0         ENTRY POINT                 K1308070
                          BSI     PUT       OUTPUT WORD                 K1308080
                    *                                                   K1308090
                    *                                                   K1308100
                          STX   1 CKTEM     STORE INPUT PT              K1308110
                          LD      CKTEM     LOAD INPUT PT               K1308120
                          STX   2 CKTEM     STORE OUTPUT PT             K1308130
                          S       CKTEM     SUBTRACT OUTPUT PT          K1308140
                          BSC  L  CK1,+     BRANCH IF OVERLAP           K1308150
                    *                                                   K1308160
                    *                                                   K1308170
                          BSC  I  CHECK     RETURN                      K1308180
                    *                                                   K1308190
                    *                  SET UP OVERLAP ERROR             K1308200
                    CK1   MDX  L  ERROR,1   SET OVERLAP ERROR           K1308210
                          BSC  L  OVERF     GO TO NEXT PHASE            K1308220
                    *                                                   K1308230
                    *                  CONSTANTS                        K1308240
                    CKTEM DC      0         TEMPORARY STORAGE           K1308250
                    *************************************************** K1308260
                    *                  MOVES ONE WORD FROM THE INPUT  * K1308270
                    *                  STRING TO THE OUTPUT STRING    * K1308280
                    *                  INCREMENTS THE POINTER         * K1308290
                    *************************************************** K1308300
                    *                                                   K1308310
                    *                                                   K1308320
                    MOVE1 DC      0         ENTRY POINT                 K1308330
                          LD    1 0         LOAD WORD                   K1308340
                          BSI     PUT       PUT ON OUTPUT STRING        K1308350
                    *                                                   K1308360
                    *                                                   K1308370
                          MDX   1 1         MOVE INPUT POINTER          K1308380
                    *                                                   K1308390
                    *                                                   K1308400
                          BSC  I  MOVE1     RETURN                      K1308410
                    *************************************************** K1308420
                    *                  MOVES WORDS TO THE OUTPUT      * K1308430
                    *                  STRING USING XR3 AS A COUNT    * K1308440
                    *                  CONTROL                        * K1308450
                    *************************************************** K1308460
                    *                                                   K1308470
                    *                                                   K1308480
                    OUT   DC      0         ENTRY POINT                 K1308490
                          BSI     MOVE1     OUTPUT WORD, MOVE POINTER   K1308500
                    *                                                   K1308510
                    *                                                   K1308520
                          MDX   3 -1        DECREMENT COUNTER           K1308530
                    *                                                   K1308540
                    *                                                   K1308550
                          MDX     OUT+1     CONTINUE LOOP               K1308560
                    *                                                   K1308570
                    *                                                   K1308580
                          BSC  I  OUT       RETURN                      K1308590
                    *************************************************** K1308600
                    *                  CHECKS NAMES FOR DIMENSIONING  * K1308610
                    *                  DETERMINES THE DIMENSION LEVEL * K1308620
                    *                  MOVES THE NAME AND DIMENSION   * K1308630
                    *                  INFORMATION TO THE O/P STRING  * K1308640
                    *                  ALLOWS SPACE IN THE O/P STRING * K1308650
                    *                  ACCORDING TO THE DIM LEVEL.    * K1308660
                    *************************************************** K1308670
                    *                                                   K1308680
                    *                                                   K1308690
                    NAME  DC      0         ENTRY POINT                 K1308700
                          LD    1 0         LOAD WORD                   K1308710
                          BSI     PUT                                   K1308720
                    *                                                   K1308730
                    *                                                   K1308740
                          BSI     GETID     GET SYM TBL ID WORD         K1308750
                          AND     S1800     IS IT DIMENSIONED NAME      K1308760
                          BSC  L  NAME1,Z   BRANCH IF YES               K1308770
                    *                                                   K1308780
                    *                                                   K1308790
                          MDX   1 1         MOVE POINTER                K1308800
                    *                                                   K1308810
                    *                                                   K1308820
                          STX   0 SW7       TAG DIMENSION NAME SWITCH   K1308830
                    *                                                   K1308840
                    *                                                   K1308850
                    NAME3 SLA     16        CLEAR DIMENSION NAME        K1308860
                          STO     SW1       SUBSCRIPTED SWITCH          K1308870
                    *                                                   K1308880
                    *                                                   K1308890
                    NAME8 BSC  I  NAME      RETURN                      K1308900
                    *                                                   K1308910
                    *                                                   K1308920
                    NAME1 SLA     16        CLEAR DIMENSIONED           K1308930
                          STO     SW7       NAME SWITCH                 K1308940
                    *                                                   K1308950
                    *                                                   K1308960
                          MDX   1 1         MOVE INPUT POINTER          K1308970
                    *                                                   K1308980
                    *                                                   K1308990
                          LD    1 0                                     K1309000
                          S       NP3       IS IT 3-DIMENSIONED VAR     K1309010
                          BSC  L  NAME2,Z   BRANCH IF NOT               K1309020
                    *                                                   K1309030
                    *                                                   K1309040
                          LDX   3 15        SET MOVE-WORD COUNTER       K1309050
                    *                                                   K1309060
                    *                                                   K1309070
                    NAME4 BSI     OUT       PUT WORDS ON OUTPUT STRING  K1309080
                          MDX     NAME3     NORMALIZE SWITCH 1          K1309090
                    *                                                   K1309100
                    *                                                   K1309110
                    NAME2 S       NP2       IS IT 2-DIMENSIONED VAR     K1309120
                          BSC  L  NAME5,Z   BRANCH IF NOT               K1309130
                    *                                                   K1309140
                    *                                                   K1309150
                          LDX   3 11        LOAD MOVE-WORD CTR          K1309160
                          MDX     NAME4     GO TO PUT ON STRING         K1309170
                    *                                                   K1309180
                    *                                                   K1309190
                    NAME5 S       NP1       IS IT 1-DIMENSIONED VAR     K1309200
                          BSC  L  NAME6,Z   BRANCH IF NOT               K1309210
                    *                                                   K1309220
                    *                                                   K1309230
                          LDX   3 7         LOAD MOVE-WORD CTR          K1309240
                          MDX     NAME4     GO TO PUT ON STRING         K1309250
                    *                                                   K1309260
                    *                                                   K1309270
                    NAME6 S       NP0       IS IT LITERAL               K1309280
                          BSC  L  NAME7,Z   BRANCH IF NOT               K1309290
                    *                                                   K1309300
                    *                                                   K1309310
                          LDX   3 3         LOAD MOVE-WORD CTR          K1309320
                          MDX     NAME4     GO TO PUT ON STRING         K1309330
                    *                                                   K1309340
                    *                                                   K1309350
                    NAME7 STX   0 SW1       SET SWITCH TO NOT SUBSCRIPT K1309360
                          MDX     NAME8     RETURN                      K1309370
                    *                                                   K1309380
                    *                  CONSTANTS                        K1309390
                    SW1   DC      0         SWITCH 1                    K1309400
                    SW7   DC      0         SWITCH 7                    K1309410
                    S1800 DC      /1800     MASK TO TEST FOR DIMENSIONS K1309420
                    NP3   DC      /1E       (3 OPERATOR                 K1309430
                    NP2   DC      /1C-/1E   (2 OPERATOR                 K1309440
                    NP1   DC      /1A-/1C   (1 OPERATOR                 K1309450
                    NP0   DC      /18-/1A   LITERAL OPERATOR            K1309460
                    *************************************************** K1309470
                    *                  CHECKS FOR IMPLIED DO LOOPS IN * K1309480
                    *                  INPUT AND OUTPUT LISTS         * K1309490
                    *                  CHECKS THE SYNTAX OF THE       * K1309500
                    *                  IMPLIED DO                     * K1309510
                    *************************************************** K1309520
                    *                                                   K1309530
                    *                                                   K1309540
                    DO    DC      0         ENTRY POINT                 K1309550
                          STX   1 DOY       SAVE INPUT POINTER          K1309560
                    *                                                   K1309570
                    *                                                   K1309580
                          LDX   3 1         INITIALIZE                  K1309590
                          STX   3 DOPAR     PARENTHESIS COUNTER         K1309600
                    *                                                   K1309610
                    *                                                   K1309620
                    DO3   MDX   1 1         MOVE POINTER                K1309630
                    *                                                   K1309640
                    *                                                   K1309650
                          LD    1 0         IS CHARACTER SEMI-COLON     K1309660
                          BSC  L  DO1,+-    BRANCH IF YES               K1309670
                    *                                                   K1309680
                    *                                                   K1309690
                          S       DLPAR     IS CHAR LEFT-PARENTHESIS    K1309700
                          BSC  L  DO2,Z     BRANCH IF NOT               K1309710
                    *                                                   K1309720
                    *                                                   K1309730
                          MDX  L  DOPAR,1   INCREMENT PARENTHESIS CTR   K1309740
                          MDX     DO3       GET NEXT WORD               K1309750
                    *                                                   K1309760
                    *                                                   K1309770
                    DO2   S       DPMES     IS CHARACTER EQUAL SIGN     K1309780
                          BSC  L  DO4,+-    BRANCH IF YES               K1309790
                    *                                                   K1309800
                    *                                                   K1309810
                          S       DEMRP     IS CHAR RIGHT PARENTHESIS   K1309820
                          BSC  L  DO6,Z     BRANCH IF NOT               K1309830
                    *                                                   K1309840
                    *                                                   K1309850
                          MDX  L  DOPAR,-1  DECREMENT PARENTHESIS CTR   K1309860
                    *                                                   K1309870
                    *                                                   K1309880
                          MDX     DO3       GET NEXT WORD               K1309890
                    *                                                   K1309900
                    *                                                   K1309910
                    DO1   SLA     16        CLEAR EQUAL                 K1309920
                          STO     SW3       SIGN SWITCH                 K1309930
                    *                                                   K1309940
                    *                                                   K1309950
                    DO5   LDX  L1 *-*       RESTORE                     K1309960
                    DOY   EQU     DO5+1     INPUT POINTER               K1309970
                    *                                                   K1309980
                    *                                                   K1309990
                          BSC  I  DO        RETURN                      K1310000
                    *                                                   K1310010
                    *                                                   K1310020
                    DO4   LDX  L3 *-*       LOAD                        K1310030
                    DOPAR EQU     DO4+1     PARENTHESIS COUNTER         K1310040
                          MDX   3 -1        DECREMENT PARENTHESIS CTR   K1310050
                          MDX     DO3       GET NEXT WORD               K1310060
                    *                                                   K1310070
                    *                                                   K1310080
                          STX   1 DOX       SAVE INPUT POINTER          K1310090
                    *                                                   K1310100
                    *                                                   K1310110
                          STX   0 SW3       SET EQUAL SIGN SWITCH       K1310120
                          MDX     DO5       RETURN                      K1310130
                    *                                                   K1310140
                    *                  CONSTANTS                        K1310150
                    SW3   DC      0         SWITCH 3                    K1310160
                    DLPAR DC      /10       LEFT PARENTHESIS            K1310170
                    DPMES DC      /0E-/10   EQUAL SIGN                  K1310180
                    DEMRP DC      /02-/0E   RIGHT PARENTHESIS           K1310190
                    DOX   DC      0         INPUT POINTER AT EQUAL SIGN K1310200
                    DSPMR DC      /18-/02   3-DIMENSIONED OPERATOR      K1310210
                    DSPDL DC      /1E-/18   0-DIMENSIONED OPERATOR      K1310220
                    DOS1  DC      /07       SEVEN                       K1310230
                    *                                                   K1310240
                    *                                                   K1310250
                    DO6   S       DSPMR     IS CHARACTER A SPECIAL      K1310260
                          BSC  L  DO3,+Z    LEFT PARENTHESIS            K1310270
                          S       DSPDL     GET NEXT CHARACTER          K1310280
                          BSC  L  DO3,-Z    IF NOT                      K1310290
                    *                                                   K1310300
                    *                  MOVE PT OVER SUBSCRIPT           K1310310
                          A       DOS1      ADD NINE                    K1310320
                          SLA     1         MULTIPLY BY TWO             K1310330
                          STO     *+1       INCREMENT INPUT PT          K1310340
                          MDX  L1 *-*       TO MOVE OVER SUBSCRIPT      K1310350
                          MDX     DO3       GET NEXT WORD               K1310360
                    *************************************************** K1310370
                    *                  CHECKS THE STMNT NUMBER LIST   * K1310380
                    *                  IN GO TO STMNT FOR VALID       * K1310390
                    *                  REFERENCES.                    * K1310400
                    *             LABEL LIST                          * K1310410
                    *************************************************** K1310420
                    *                                                   K1310430
                    *                                                   K1310440
                    LIST  DC      0         ENTRY POINT                 K1310450
                          SLA     16        CLEAR COUNT                 K1310460
                          STO     CNT       OF STMNT NOS.               K1310470
                    *                                                   K1310480
                    *                  NON-FORMAT STATEMENT NUMBER      K1310490
                    LIST3 LD    1 0         LOAD WORD                   K1310500
                          BSI  L  GETID     SET SYM TBL 1D WORD         K1310510
                          AND     TFFDE     IS WORD A                   K1310520
                          EOR     S0200     STMNT NO.                   K1310530
                          BSC  L  LIST2,Z   BRANCH IF NOT               K1310540
                    *                                                   K1310550
                    *                                                   K1310560
                          BSI     MOVE1     OUTPUT WORD, MOVE POINTER   K1310570
                    *                                                   K1310580
                    *                                                   K1310590
                    LIST1 MDX  L  CNT,1     MODIFY COUNTER              K1310600
                    *                                                   K1310610
                    *                                                   K1310620
                          LD    1 0         LOAD WORD                   K1310630
                          S       LCMA      IS CHARACTER COMMA          K1310640
                          BSC  L  LIST4,+-  BRANCH IF YES               K1310650
                          MDX     LIST5     RETURN                      K1310660
                    *                                                   K1310670
                    *                                                   K1310680
                    LIST2 LDX   3 43        PUT ERROR NO. 43            K1310690
                          STX  L3 ERNO      IN ERNO                     K1310700
                    *                                                   K1310710
                    *                                                   K1310720
                    LIST5 BSC  I  LIST      RETURN                      K1310730
                    *                                                   K1310740
                    *                                                   K1310750
                    LIST4 MDX  L  CNT,1     INCREMENT COUNTER           K1310760
                    *                                                   K1310770
                    *                                                   K1310780
                          BSI  L  MOVE1     OUTPUT WORD, MOVE POINTER   K1310790
                          MDX     LIST3     GET NEXT WORD               K1310800
                    *                                                   K1310810
                    *                  CONSTANTS                        K1310820
                    CNT   DC      0         STMNT NO. COUNTER           K1310830
                    LCMA  DC      /12       COMMA                       K1310840
                    TFFDE DC      /FFDE     STMNT NO. MASK - PART 1     K1310850
                    S0200 DC      /0200     STMNT NO. MASK - PART 2     K1310860
                    *************************************************** K1310870
                    *                  DELETES ONE WD FROM I/P STRING * K1310880
                    *************************************************** K1310890
                    *                                                   K1310900
                    *                                                   K1310910
                    DELET DC      0         ENTRY POINT                 K1310920
                          MDX   1 -1        ADDRESS OF PREVIOUS WORD    K1310930
                    *                                                   K1310940
                    *                                                   K1310950
                          STX   1 DELX      SAVE ADDRESS                K1310960
                    *                                                   K1310970
                    *                                                   K1310980
                    DLT2  LD    1 1         MOVE WORD DOWN ONE          K1310990
                          STO   1 0         POSITION IN STRING          K1311000
                    *                                                   K1311010
                    *                                                   K1311020
                          BSC  L  DLT1,+-   EXIT IF SEMI-COLON          K1311030
                    *                                                   K1311040
                    *                                                   K1311050
                          MDX   1 1         MOVE POINTER                K1311060
                          MDX     DLT2      CONTINUE LOOP               K1311070
                    *                                                   K1311080
                    *                                                   K1311090
                    DLT1  LDX  L1 *-*       RESTORE                     K1311100
                    DELX  EQU     DLT1+1    INPUT POINTER               K1311110
                    *                                                   K1311120
                    *                                                   K1311130
                          BSC  I  DELET     RETURN                      K1311140
                    *                                                   K1311150
                    *                  CHECKS FOR VALID VARIABLES IN    K1311160
                    *                  READ, WRITE, AND GO TO STMNTS    K1311170
                    TESTV DC      0         ENTRY POINT                 K1311180
                          LD   L  SORF      LOAD SORF                   K1311190
                          BSC  L  TESTW,+   BRANCH NOT FUNCTION         K1311200
                          LD    1 0         LOAD NAME                   K1311210
                          S    L  FNAME     IS IT PROGRAM NAME          K1311220
                          BSC  I  TESTV,+-  BRANCH IF YES               K1311230
                          LD   L  SW2       IS IT WRITE STMNT           K1311240
                          BSC  L  TESTW,+-  BRANCH IF YES               K1311250
                          LD      SA7DE     LOAD READ MASK              K1311260
                          MDX     TESTX     GO TO TEST                  K1311270
                    TESTW LD      S83DE     TEST FOR                    K1311280
                    TESTX AND   3 0         VALID VARIABLE              K1311290
                          BSC  L  XY7,Z     BRANCH IF INVALID           K1311300
                          BSC  I  TESTV     RETURN                      K1311310
                    S83DE DC      /83DE     WRITE MASK                  K1311320
                    SA7DE DC      /A7DE     READ MASK                   K1311330
                    *                                                   K1311340
                    *                  MOVES A STMNT TO THE O/P STRING  K1311350
                    XY27  LDX  L3 *-*       LOAD NORM                   K1311360
                          MDX   3 -1        DECREMENT NORM              K1311370
                          MDX     *+1       SKIP NEXT INSTRUCTION       K1311380
                          MDX     XY27A     MOVE TO NEXT STMNT          K1311390
                          BSI  L  MOVE1     OUTPUT WORD, MOVE POINTER   K1311400
                          MDX   3 -1        DECREMENT NORM              K1311410
                          MDX     XY27+3    CONTINUE LOOP               K1311420
                    XY27A BSC  L  XY22      MOVE TO NEXT STMNT          K1311430
                    *                                                   K1311440
                    *                                                   K1311450
                    W11   S       WEQU      IS IT EQUIVALENCE STMNT     K1311460
                          BSC  L  XY27,Z    BRANCH IF NOT               K1311470
                    *                                                   K1311480
                    *                                                   K1311490
                          LDX   3 68        PUT ERROR NO. 68            K1311500
                          STX  L3 ERNO      IN ERNO                     K1311510
                    *                                                   K1311520
                    *                                                   K1311530
                    W12   LD    1 0         LOAD WORD                   K1311540
                          S       WLP       IS CHAR LEFT PARENTHESIS    K1311550
                          BSC  L  XY7,Z     BRANCH IF NOT               K1311560
                    *                                                   K1311570
                    *                       INITIALIZE LIST COUNT       K1311580
                          STO     LCT       TO ZERO                     K1311590
                    *                                                   K1311600
                    *                                                   K1311610
                    W13   BSI  L  MOVE1     MOVE POINTER                K1311620
                    *                                                   K1311630
                    *                                                   K1311640
                          LD    1 0         LOAD WORD                   K1311650
                          BSI  L  GETID     GET SYM TBL ID WORD         K1311660
                          AND     W83DE     IS VALID TO BE EQUIVALENCE  K1311670
                          BSC  L  XY7,Z     BRANCH IF NOT               K1311680
                    *                                                   K1311690
                    *                                                   K1311700
                          BSI  L  NAME      CHECK NAME AND SUBSCRIPTS   K1311710
                          MDX  L  LCT,1     INCREMENT LIST COUNT        K1311720
                    *                                                   K1311730
                    *                                                   K1311740
                          LD   L  SW1       IS DIMENSION NAME SUBSCRIPT K1311750
                          BSC  L  XY7,Z     BRANCH IF NOT               K1311760
                    *                                                   K1311770
                    *                                                   K1311780
                          LD   L  SW7       IS IT DIMENSIONED NAME      K1311790
                          BSC  L  W14,Z     BRANCH IF NO                K1311800
                    *                                                   K1311810
                    *                                                   K1311820
                          LD    2 -3        LOAD WORD                   K1311830
                          S       W18       IS IT LITERAL OPERATOR      K1311840
                          BSC  L  XY7,Z     BRANCH IF NOT               K1311850
                    *                                                   K1311860
                    *                                                   K1311870
                    W14   LD    1 0         LOAD WORD                   K1311880
                          S       WCMA      IS CHARACTER COMMA          K1311890
                          BSC  L  W13,+-    BRANCH IF YES               K1311900
                    *                                                   K1311910
                    *                                                   K1311920
                          S       WRP       IS CHAR RIGHT PARENTHESIS   K1311930
                          BSC  L  XY7,Z     BRANCH IF NO                K1311940
                    *                                                   K1311950
                    *                                                   K1311960
                          LD      LCT       LOAD LIST COUNT             K1311970
                          S       ONE       LESS THAN TWO ARRAYS        K1311980
                          BSC  L  XY7,+     BRANCH IF YES               K1311990
                    *                                                   K1312000
                    *                                                   K1312010
                          BSI  L  MOVE1     OUTPUT WORD, MOVE POINTER   K1312020
                    *                                                   K1312030
                    *                                                   K1312040
                          LD    1 0         LOAD WORD                   K1312050
                          S       WCMA      IS IT COMMA                 K1312060
                          BSC  L  XY13,Z    BRANCH IF NO                K1312070
                    *                                                   K1312080
                    *                                                   K1312090
                          BSI  L  MOVE1     OUTPUT WORD, MOVE PT        K1312100
                          MDX     W12       CHECK CHARACTER             K1312110
                    *                                                   K1312120
                    *                       CONSTANTS                   K1312130
                    LCT   DC      0         LIST COUNT                  K1312140
                    ONE   DC      1         ONE                         K1312150
                    WEQU  DC      /15-/0E   EQUAL SIGN                  K1312160
                    WLP   DC      /10       LEFT PARENTHESIS            K1312170
                    W83DE DC      /87DE     EQUIVALENCE MASK            K1312180
                    W18   DC      /18       LITERAL OPERATOR            K1312190
                    WCMA  DC      /12       COMMA                       K1312200
                    WRP   DC      /02-/12   RIGHT PARENTHESIS           K1312210
                    *                                                   K1312220
                    *                                                   K1312230
                    *                                                   K1312290
                          BSS     BPHAR+PHLEN*320-*-1  PATCH AREA       K1312300
                          DC      0                                     K1312310
                          END     BPHAR-2                               K1312320
