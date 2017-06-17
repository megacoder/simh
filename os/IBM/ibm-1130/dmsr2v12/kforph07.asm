                          HDNG    1130 FORTRAN COMPILER PHASE 7         K0700010
                    *************************************************** K0700020
                    *                                                 * K0700030
                    *STATUS - VERSION 2, MODIFICATION 11              * K0700040
                    *                                                 * K0700050
                    *FUNCTION/OPERATION ANALYSES AND MODIFIES THE     * K0700060
                    *   FOLLOWING STATEMENTS...                       * K0700070
                    *   *DEFINE FILE- DECODES STATEMENT, CHECKS FOR   * K0700080
                    *   SYNTAX ERRORS AND DUPLICATE FILE NUMBERS      * K0700090
                    *   OUTPUTS SEVEN WORD FILE TABLE INTO STATEMENT  * K0700100
                    *   STRING AND MAKES ENTRY OF FILE NUMBER IN      * K0700110
                    *   SYMBOL TABLE                                  * K0700120
                    *   *CALL EXIT- DECODES AND CHECKS FOR SYNTAX ERR * K0700130
                    *   SETS UP NEW CODE AND INSERTS IN STRING        * K0700140
                    *   *CALL LINK- DECODES AND CHECKS FOR SYNTAX ERR * K0700150
                    *   SETS UP NEW CODES AND INSERTS IN STRING       * K0700160
                    *   ALL OTHER STATEMENTS ARE MOVED FROM THE INPUT * K0700170
                    *   STRING TO THE OUTPUT STRING.                  * K0700180
                    *                                                 * K0700190
                    *ENTRY POINTS - THE ONLY ENTRY POINT IS AT BPHAR  * K0700200
                    *   AND IS REACHED BY A CALL TO THE ROL ROUTINE BY* K0700210
                    *   THE PREVIOUS PHASE                            * K0700220
                    *                                                 * K0700230
                    *INPUT-THE STATEMENT STRING AND SYMBOL TABLE BEING* K0700240
                    *   PROCESSED BY THE COMPILER                     * K0700250
                    *                                                 * K0700260
                    *OUTPUT-THE MODIFIED STATEMENT STRING AND SYMBOL  * K0700270
                    *   TABLE AS PROCESSED BY THIS PHASE              * K0700280
                    *                                                 * K0700290
                    *EXTERNAL REFERENCES- ROL, THE ROUTINE NEEDED TO  * K0700300
                    *   READ IN THE NEXT PHASE OF THE COMPILER        * K0700310
                    *                                                 * K0700320
                    *EXITS-NORMAL-IF NO ERRORS ARE FOUND, THE PHASE   * K0700330
                    *   PROCESSES NORMALLY AND EXITS BY A CALL        * K0700340
                    *   TO THE ROL ROUTINE                            * K0700350
                    *                                                 * K0700360
                    *EXITS-ERRORS-WHEN AN ERROR IS ENCOUNTERED, THE   * K0700370
                    *   STATEMENT IS REPLACED BY THE ERROR ID CODE AND* K0700380
                    *   ERROR NUMBER. WHEN AN OVERLAP OF STRING AND   * K0700390
                    *   SYMBOL TABLE OCCURS PROCESSING IS DISCONTINUED* K0700400
                    *   AND PROCESSING CONTINUES TO NEXT PHASE        * K0700410
                    *   ERRORS DETECTED BY THIS PHASE ARE 71 AND 72.  * K0700420
                    *                                                 * K0700430
                    *TABLES/WORK AREAS-STRING,SYMBOL TABLE,FORTRAN    * K0700440
                    *   COMMUNICATION AREA                            * K0700450
                    *                                                 * K0700460
                    *ATTRIBUTES-NONE.                                 * K0700470
                    *                                                 * K0700480
                    *NOTES                                            * K0700490
                    *   7 WORD DEFINE FILE TABLE CREATED BY DEFN FILE * K0700500
                    *   WORD 1 FILE NUMBER                            * K0700510
                    *   WORD 2 NUMBER OF RECORDS                      * K0700520
                    *   WORD 3 RECORD LENGTH IN WORDS                 * K0700530
                    *   WORD 4 ADDRESS OF ASSOCIATED VARIABLE         * K0700540
                    *   WORD 5 ZEROS                                  * K0700550
                    *   WORD 6 NUMBER OF RECORDS PER SECTOR           * K0700560
                    *   WORD 7 NUMBER OF DISK BLOCKS PER FILE         * K0700570
                    *                                                 * K0700580
                    *************************************************** K0700590
                          ABS                                           K0700600
                    *                                                   K0700610
                    *                       SYSTEM EQUATES              K0700620
                    MEMRY EQU     /8000                                 K0700630
                    OVERL EQU     MEMRY-1500 START OF FCOM              K0700640
                    ROL   EQU     MEMRY-68   LOCN OF RTN TO READ NXT PH K0700650
                    $PHSE EQU     /78        NO. OF PHASE NOW IN CORE   K0700660
                          ORG     OVERL                                 K0700670
                    PHID  EQU     37         ID NUMBER THIS PHASE       K0700680
                    *                                                   K0700690
                    *                  FORTRAN COMMUNICATION AREA       K0700700
                    SOFS  BSS     1    START OF STRING                  K0700710
                    EOFS  BSS     1    END OF STRING                    K0700720
                    SOFST BSS     1    START OF SYMBOL TABLE            K0700730
                    SOFNS BSS     1    START OF NON-STATEMENT NUMBERS   K0700740
                    SOFXT BSS     1    START OF SUBSCRIPT TEMPORARIES   K0700750
                    SOFGT BSS     1    START OF GENERATED TEMPORARIES   K0700760
                    EOFST BSS     1    END OF SYMBOL TABLE              K0700770
                    COMON BSS     1    NEXT AVAILABLE COMMON            K0700780
                    CSIZE BSS     1    SIZE OF COMMON                   K0700790
                    ERROR BSS     1    OVERLAP ERROR                    K0700800
                    FNAME BSS     1         PROGRAM NAME                K0700810
                          BSS     1                                     K0700820
                    SORF  BSS     1    SUBROUTINE(-) OR FUNCTION(+)     K0700830
                    CCWD  BSS     1    CONTROL CARD WORD                K0700840
                    *                BIT 15 TRANSFER TRACE              K0700850
                    *                BIT 14 ARITHMETIC TRACE            K0700860
                    *                BIT 13 EXTENDED PRECISION          K0700870
                    *                BIT 12 LIST SYMBOL TABLE           K0700880
                    *                BIT 11 LIST SUBPROGRAM NAMES       K0700890
                    *                BIT 10 LIST SOURCE PROGRAM         K0700900
                    *                BIT  9 ONE WORD INTEGERS           K0700910
                    IOCS  BSS     1    IOCS CONTROL CARD WORD           K0700920
                    *                BIT 15 CARD                        K0700930
                    *                BIT 14 PAPER TAPE                  K0700940
                    *                BIT 13 TYPEWRITER                  K0700950
                    *                BIT 12 1403 PRINTER                K0700960
                    *                BIT 11 2501 READER                 K0700970
                    *                BIT 10 KEYBOARD                    K0700980
                    *                BIT  9 1442 PUNCH                  K0700990
                    *                BIT  8 DISK                        K0701000
                    *                BIT  7 1132 PRINTER                K0701010
                    *                BIT  3 PLOTTER                     K0701020
                    DFCNT BSS     1                                     K0701030
                    *                                                   K0701040
                    *                                                   K0701050
                    *                  END OF FORTRAN COMMUNICATION     K0701060
                    *                  AREA                             K0701070
                    *************************************************** K0701080
                    BPHAR EQU     *+2                                   K0701090
                          DC      0          LOADER WORK AREA           K0701100
                          DC      -37        -PHASE ID FOR SLET LOOKUP  K0701110
                          DC      NXTPH-*+1  TABLE FOR NEXT PHASE ENTRY K0701120
                          DC      1          ONE ENTRY TO BE SET BY LDR K0701130
                          ORG     *-2                                   K0701140
                    *                                                   K0701150
                    *                       INITIALIZE PHASE            K0701160
                    *                                                   K0701170
                    PHST  LDX   1 PHID       LOAD ID NUMBER THIS PHASE  K0701180
                          STX  L1 $PHSE      STORE IN SYS PHASE AREA    K0701190
                          LDX  I1 SOFS      INITIALIZE INPUT STRING PT  K0701200
                          LDX  I2 SOFS      INITIALIZE OUTPUT STRING PT K0701210
                    *                                                   K0701220
                    *                       CHECK FOR OVERLAP ERROR     K0701230
                          LD      ERROR     LOAD OVERLAP ERROR WD       K0701240
                          BSC  L  EXIT,Z    BRANCH IF SO                K0701250
                    *                                                   K0701260
                    *                       INITIALIZE FOR STATEMENT    K0701270
                    CK1   LDX  L3 V         SET INDEX FOR CONSTANTS     K0701280
                          STX   1 IDSV1     STRING ADDR. I/P STRING     K0701290
                          STX  L2 IDSV2     STRING ADDR. O/P STRING     K0701300
                          LD    1 0         PICK UP ID WORD FROM STRNG  K0701310
                          STO   3 ORIG-V    SAVE IN TEMP. STO           K0701320
                          AND   3 HF803-V   MASK OUT STMNT NORM         K0701330
                          BSI   3 OUT-V     STORE IN O/P STRING         K0701340
                          LD    1 -1        PICK UP MASKED ID WORD      K0701350
                          SLA     15        TEST BIT 15 FOR STMNT NO.   K0701360
                          BSC  L  *+2,-     BR IF NO STMNT NO.          K0701370
                          LD    1 0         STMNT NO. FOUND             K0701380
                          BSI   3 OUT-V     MOVE STMNT NO. TO STRING    K0701390
                    *                                                   K0701400
                    *                       TEST FOR DEFINE FILE STMNT  K0701410
                          LD    3 ORIG-V    GET STRING ID WD -TEMP STO  K0701420
                          AND   3 HF802-V   MASK OUT STATEMENT NORM     K0701430
                          S     3 DFILE-V   TEST FOR DEFINE FILE ID     K0701440
                          BSC  L  DF1,+-    BRANCH IF YES.              K0701450
                    *                                                   K0701460
                    *                       TEST FOR CALL EXIT STMNT    K0701470
                          S     3 CEXIT-V   TEST FOR CALL EXIT ID       K0701480
                          BSC  L  CE1,+-    BRANCH IF YES               K0701490
                    *                                                   K0701500
                    *                       TEST FOR CALL LINK STMNT    K0701510
                          S     3 CLINK-V   TEST FOR CALL LINK ID       K0701520
                          BSC  L  CL1,+-    BRANCH IF YES.              K0701530
                    *                                                   K0701540
                    *                       END STATEMENT               K0701550
                          S     3 ENDCN-V   TEST FOR END ID             K0701560
                          BSC  L  ED1,+-    BRANCH IF YES               K0701570
                    *                                                   K0701580
                    *                       MOVE TO NEXT STATEMENT      K0701590
                          LDX  L1 *-*       GET I/P STRING ADDR.        K0701600
                    IDSV1 EQU     *-1                                   K0701610
                          LDX  I2 IDSV2     GET O/P STRING ADDR         K0701620
                          LD    3 ORIG-V    GET STMNT ID WORD           K0701630
                          STO   1 0         STORE STMNT ID BACK IN I/P  K0701640
                          SLA     5         SHIFT OFF ALL BITS BUT      K0701650
                          SRA     7         STATEMENT NORM              K0701660
                          STO     *+1                                   K0701670
                          LDX  L3 *-*       GET NO WDS THIS STMNT       K0701680
                          LD    1 0         MOVE STATEMENT FROM I/P     K0701690
                          STO   2 0         TO O/P STRING               K0701700
                          MDX   1 1         INCR. I/P COUNTER           K0701710
                          MDX   2 1         INCR. O/P COUNTER           K0701720
                          MDX   3 -1        CONTINUE UNTIL ALL WDS IN   K0701730
                          MDX     *-6       STATEMENT MOVED             K0701740
                          MDX     CK1       GET NEXT STATEMENT          K0701750
                    *                                                   K0701760
                    *************************************************** K0701770
                    *                                                   K0701780
                    *             PROCESS CALL EXIT STATEMENT           K0701790
                    *             CHECK FOR SYNTAX ERROR                K0701800
                    *             DELETE INTERPHASE COMM BIT IN ID WORD K0701810
                    *             ADD 2 FLAG WORDS(HEX 5F00) TO STRING  K0701820
                    *             TO INDICATE CALL EXIT                 K0701830
                    *                                                   K0701840
                    *                       CALL EXIT STATEMENT         K0701850
                    *                 REMOVE BIT 14 OF ID WORD          K0701860
                    CE1   LD   I  IDSV2     GET ID WD FROM STRING       K0701870
                          AND   3 HFFFD-V   MASK OUT BIT 14             K0701880
                          STO  I  IDSV2     SAVE BACK IN ID WORD        K0701890
                    *                                                   K0701900
                    *                                                   K0701910
                    *                       SEMI-COLON                  K0701920
                          LD    1 0         GET 1ST DATA WD IN STMT     K0701930
                          S     3 SEMI-V    TEST FOR SEMI-COLON         K0701940
                          BSC  L  CE3,+-    BRANCH IF SEMI-COLON        K0701950
                    *                                                   K0701960
                    *                       PUT ERROR NO. 3             K0701970
                    ER3   LD    3 D0003-V   SYNTAX ERROR CODE           K0701980
                          BSI   3 ERR-1-V   BRANCH TO OUTPUT ERROR.     K0701990
                    *                                                   K0702000
                    *                                                   K0702010
                    *                       RESHAPE CALL EXIT           K0702020
                    CE3   LD    3 H6338-V   OUTPUT CALL EXIT            K0702030
                          BSI   3 OUT-V     BRANCH TO ADD TO STRING     K0702040
                          MDX     CK1       BRANCH TO HANDLE NXT STMNT  K0702050
                    *                                                   K0702060
                    *************************************************** K0702070
                    *                                                   K0702080
                    *             PROCESS CALL LINK STATEMENT           K0702090
                    *             CHECKS SYNTAX AND RESHAPES STATEMENT  K0702100
                    *             BY ADDING THE WORD (HEX) 5B00 BEFORE  K0702110
                    *             EACH OF THE TWO PACKED NAME WORDS     K0702120
                    *                                                   K0702130
                    *                       LEFT PARENTHESIS            K0702140
                    CL1   LD    1 0         PICK UP WD. IN I/P STRING   K0702150
                          S     3 LPAR-V    TEST FOR LEFT PARENTHESES   K0702160
                          BSC  L  ER3,Z     BRANCH TO ERROR IF NOT      K0702170
                    *                                                   K0702180
                    *                                                   K0702190
                    *                       MOVE POINTER                K0702200
                          MDX   1 1                                     K0702210
                    *                                                   K0702220
                    *                       FIRST WORD OF NAME ALPHA    K0702230
                          LD    1 0                                     K0702240
                          BSC  L  ER3,-     BRANCH IF OPERATOR          K0702250
                          SLA     2                                     K0702260
                          BSC  L  *+2,-     BRANCH IF ALPHABETIC        K0702270
                          BSC  L  ER3,C     BRANCH IF NUMERIC           K0702280
                    *                                                   K0702290
                    *                       OUTPUT FIRST WORD OF NAME   K0702300
                          LD    1 0         LOAD WD FROM INPUT STRING   K0702310
                          BSI   3 OUT-V     BRANCH TO PUT WORD O/P STRI K0702320
                    *                                                   K0702330
                    *                       OUTPUT BLANK SECOND WORD    K0702340
                          LD    3 H8000-V   LOAD CONSTANT BLANK         K0702350
                          BSI   3 OUT-V     BRANCH TO O/P SUBROUTINE    K0702360
                    *                                                   K0702370
                    *                       TWO WORD NAME               K0702380
                          LD    1 -1                                    K0702390
                          BSC  L  CL2,-     BRANCH IF NO                K0702400
                    *                                                   K0702410
                    *                       PUT OUT SECOND WORD OF NAME K0702420
                          STO   2 -1                                    K0702430
                    *                                                   K0702440
                    *                       MOVE POINTER                K0702450
                          MDX   1 1                                     K0702460
                    *                                                   K0702470
                    *                       RIGHT PARENTHESIS           K0702480
                    CL2   LD    1 -1                                    K0702490
                          S     3 RPAR-V                                K0702500
                          BSC  L  ER3,Z     BRANCH IF NOT R PAR         K0702510
                    *                                                   K0702520
                          LD    1 0                                     K0702530
                          S     3 SEMI-V     TEST FOR SEMI-COLON        K0702540
                          BSC  L  ER3,Z      BR TO ERROR IF NOT FOUND   K0702550
                    *                       RESHAPE CALL LINK           K0702560
                          LD    2 -1        MOVE SECOND WORD OF NAME    K0702570
                          STO   2 +1        TWO LOCS                    K0702580
                          LD    2 -2        MOVE FIRST WORD OF NAME     K0702590
                          STO   2 -1        ONE LOCATION                K0702600
                          LD    3 H5B00-V   INSERT HEX CONST 5B00       K0702610
                          STO   2 -2        BEFORE FIRST AND 2ND NAMES  K0702620
                          STO   2 0                                     K0702630
                          BSI   3 OUT-V     INCR.XR1, XR2, AND NORM     K0702640
                          LD    2 0                                     K0702650
                          BSI   3 OUT-V     INCR XR1, XR2, AND NORM     K0702660
                    *                                                   K0702670
                    *                       MOVE POINTER                K0702680
                          MDX   1 -1        I/P STRING TOO FAR          K0702690
                    *                                                   K0702700
                    *                       SEMICOLON                   K0702710
                          MDX     CK1        GO PROCESS NEXT STATEMENT  K0702720
                    *                                                   K0702730
                    *************************************************** K0702740
                    *             DEFINE FILE STATEMENT                 K0702750
                    *             CHECK SYNTAX OF STATEMENT             K0702760
                    *             CHECK FOR DUPLICATE FILE NOS.         K0702770
                    *             OUTPUT 7 WORD FILE DESCRIPTION TABLE  K0702780
                    *                                                   K0702790
                    *                                                   K0702800
                    *                       TEST FOR SUBPROGRAM         K0702810
                    *                       DEFN FILE ILLEGAL IN SUBP   K0702820
                    DF1   LD   L  SORF      GET SUBPROGRAM INDICATOR    K0702830
                          BSC  L  ER72,Z    BRANCH ERROR IF SUBPROGRAM  K0702840
                    *                                                   K0702850
                    *                       CLEAR FCT                   K0702860
                          STO   3 FCT-V     PUT ZERO FROM ACC IN FCT    K0702870
                    *                                                   K0702880
                    *                       COLLECT VALID CONSTANT      K0702890
                    DF5   BSI   3 COLL-V    FROM NEXT 2 WDS (FILE NO.)  K0702900
                          MDX  L  FCT,7     INCREMENT FILE COUNT        K0702910
                    *                                                   K0702920
                    *                       CHECK DUPLICATE OR          K0702930
                    *                       EXCESSIVE DEFINE FILES.     K0702940
                    *                                                   K0702950
                          BSI   3 FILES-V                               K0702960
                    *                                                   K0702970
                    *                       OUTPUT FILE NUMBER          K0702980
                          BSI   3 OUT-V     IN BINARY                   K0702990
                    *                                                   K0703000
                    *                       LEFT PARENTHESIS            K0703010
                          LD    1 0         GET NEXT WD. FROM STRING    K0703020
                          S     3 LPAR-V    TEST FOR LEFT PARENTHESIS   K0703030
                          BSC  L  ER71,Z    BRANCH IF NO                K0703040
                    *                                                   K0703050
                    *                       MOVE POINTER                K0703060
                          MDX   1 1                                     K0703070
                    *                                                   K0703080
                    *                       COLLECT VALID CONSTANT      K0703090
                    *             GET NUMBER OF RECORDS, CONVERT TO BIN K0703100
                          BSI   3 COLL-V                                K0703110
                    *                                                   K0703120
                    *                       OUTPUT NUMBER OF RECORDS    K0703130
                          BSI   3 OUT-V                                 K0703140
                    *                                                   K0703150
                    *                       COMMA                       K0703160
                          LD    1 0         TEST NEXT OP FOR COMMA      K0703170
                          S     3 COMA-V                                K0703180
                          BSC  L  ER71,Z    BRANCH IF NO                K0703190
                    *                                                   K0703200
                    *                       MOVE POINTER                K0703210
                          MDX   1 1                                     K0703220
                    *                                                   K0703230
                    *                       COLLECT VALID CONSTANT      K0703240
                          BSI   3 COLL-V    AND CONVERT REC. LNG TO BI  K0703250
                    *                                                   K0703260
                    *                       OUTPUT RECORD LENGTH        K0703270
                          BSI   3 OUT-V                                 K0703280
                    *                                                   K0703290
                    *                       RECORD LENGTH LESS THAN 321 K0703300
                          LD    2 -1        LOAD RECORD LENGTH          K0703310
                          S     3 D0320-V   COMPARE WITH 320            K0703320
                          BSC  L  ER71,Z-   BR IF RECORD LENGTH GT 320  K0703330
                    *                                                   K0703340
                    *                       COMMA                       K0703350
                          LD    1 0         GET NEXT WORD IN I/P STRNG  K0703360
                          S     3 COMA-V    TEST FOR COMMA              K0703370
                          BSC  L  ER71,Z    BRANCH IF NO                K0703380
                    *                                                   K0703390
                    *                       U (UNEDITED)                K0703400
                          LD    1 1         TEST FOR U, BUT DO NOT USE  K0703410
                          S     3 U-V                                   K0703420
                          BSC  L  ER71,Z    BRANCH IF NO                K0703430
                    *                                                   K0703440
                    *                       COMMA                       K0703450
                          LD    1 2         TEST FOR COMMA              K0703460
                          S     3 COMA-V                                K0703470
                          BSC  L  ER71,Z    BRANCH IF NO                K0703480
                    *                                                   K0703490
                    *                       MOVE POINTER                K0703500
                          MDX   1 3         BYPASS PREV. 3 WDS I/P STR  K0703510
                    *                                                   K0703520
                    *                       GATHER CONSTANT             K0703530
                          BSI   3 GATH-V    GET VAR. NAME REF. FILE     K0703540
                          LD    3 WD2-V     GET 2ND WD OF NAME          K0703550
                          SRA     1                                     K0703560
                          OR    3 H8000-V   ADD FLAG                    K0703570
                          STO   3 WD2-V                                 K0703580
                    *                                                   K0703590
                    *                       VALID NAME                  K0703600
                          LD    3 WD1-V     GET FIRST WD OF NAME        K0703610
                          SLA     2                                     K0703620
                          BSC  L  *+2,-     BRANCH IF ALPHA             K0703630
                          BSC  L  ER71,C    BRANCH IF NUMERIC           K0703640
                    *                                                   K0703650
                    *                       VARIABLE IN SYMBOL TABLE    K0703660
                          LD   L  SOFNS     FIND DIFF BET  END OF NON-  K0703670
                          S    L  EOFST      STMNT NOS AND SYM TBL      K0703680
                          A     3 D0003-V   INCR BY 3                   K0703690
                          STO   3 TEMP-V                                K0703700
                          STX   2 XR2R      SAVE O/P STRING ADDR        K0703710
                          LDX  I2 SOFNS     GET LAST WD SYMBOL TABLE    K0703720
                          MDX     DF3       BRANCH TO MODIFY            K0703730
                    DF2   LD    2 1         COMPARE SYM TBL ENTRY       K0703740
                          S     3 WD1-V     WITH STRING WORD            K0703750
                          BSC  L  DF3-1,Z   BRANCH NOT CURRENT ENTRY    K0703760
                          LD    2 2         COMPARE 2ND WD. IN SYM TBL  K0703770
                          S     3 WD2-V     WITH 2ND STRING WORD        K0703780
                          BSC  L  DF4,+-    BRANCH IF FOUND             K0703790
                          MDX   2 -3        DECR SYM TBL ADDRESS        K0703800
                    DF3   MDX  L  TEMP,-3   DECR. SYM TBL COUNTER       K0703810
                          MDX     DF2       GO TO NXT TBL ENTRY UNLESS  K0703820
                    *                       TABLE FINISHED              K0703830
                    *                       PUT IN SYMBOL TABLE         K0703840
                          LD    3 WD1-V     GET FIRST WD OF NAME        K0703850
                          STO   2 1         SAVE IN SYMBOL TABLE+1      K0703860
                          LD    3 WD2-V     GET SECOND WD. OF NAME      K0703870
                          STO   2 2         SAVE IN SYMBOL TABLE+2      K0703880
                          LD    3 H4000-V   GET ID FOR INTEGER VAR      K0703890
                          STO   2 0         SAVE IN SYMBOL TABLE +0     K0703900
                    *                                                   K0703910
                    *             ADJUST SYM TBL POINTERS               K0703920
                          MDX  L  SOFGT,-3                              K0703930
                          MDX  L  SOFXT,-3                              K0703940
                          MDX  L  EOFST,-3                              K0703950
                    *                                                   K0703960
                    *                       TEST FOR INTEGER VARIABLE   K0703970
                          LD    3 WD1-V     GET FIRST WD OF NAME        K0703980
                          AND   3 H7E00-V   MASK OUT ALL BUT 1ST CHAR   K0703990
                          S     3 H1200-V   SEE IF GREATER THAN 'H'     K0704000
                          BSC  L  ER71,Z+   BRANCH IF NO                K0704010
                          S     3 H1800-V   SEE IF LESS THAN 'O'        K0704020
                          BSC  L  ER71,Z-   BRANCH IF NO.               K0704030
                    *                                                   K0704040
                    *                       CHECK LEGAL VARIABLE        K0704050
                    DF4   LD    2 0         GET SYMBOL TABLE ID WD      K0704060
                          AND   3 HDFDE-V   TEST IF ID WORD CONTAINS    K0704070
                          EOR   3 H4000-V   FLAG FOR VARIABLE INTEGER   K0704080
                          BSC  L  ER71,Z    BRANCH IF NO                K0704090
                    *                                                   K0704100
                    *                       INDICATE DEFINED            K0704110
                          LD    2 0         GET SYMBOL TABLE ID WORD    K0704120
                          OR    3 H0020-V   ADD IN DEFINED VARIABLE     K0704130
                          STO   2 0         FLAG                        K0704140
                    *                                                   K0704150
                    *                       COMPUTE S.T. POINTER        K0704160
                          STX   2 TEMP      SAVE SYMBOL TABLE ADDR.     K0704170
                          LD   L  SOFST     FIND DIFF BET. START OF     K0704180
                          S     3 TEMP-V    SYMBOL TABLE AND CUR LOC.   K0704190
                          SRT     16                                    K0704200
                          D     3 D0003-V   DIVIDE BY 3 AND             K0704210
                          A     3 H8001-V   MAKE RLTV TO SYMBOL TABLE   K0704220
                    *                                                   K0704230
                    *                       OUTPUT VARIABLE             K0704240
                          LDX  L2 *-*       GET STRING ADDR O/P         K0704250
                    XR2R  EQU     *-1       ADD SYMBOL TABLE ENTRY      K0704260
                          BSI   3 OUT-V     TO O/P STRING               K0704270
                    *                                                   K0704280
                    *                       RIGHT PARENTHESIS           K0704290
                          LD    1 0         GET NEXT WD OF STRING       K0704300
                          S     3 RPAR-V    TEST FOR RIGHT PARENTHESIS  K0704310
                          BSC  L  ER71,Z    BRANCH IF NO                K0704320
                    *                                                   K0704330
                    *                       MOVE  POINTER BACK BY 1     K0704340
                          MDX   1 -1        TO ALLOW FOR INCR. BY OUT   K0704350
                    *                                                   K0704360
                    *                       OUTPUT ZERO                 K0704370
                          SLA     16                                    K0704380
                          BSI   3 OUT-V     FIFTH WD OF FILE BLOCK      K0704390
                    *                                                   K0704400
                    *                       COMPUTE RECORDS/SECTOR      K0704410
                          LD    3 D0320-V   NO REC/SECTOR = 320         K0704420
                          SRT     16        DIVIDED BY                  K0704430
                          D     2 -3        NUMBER WDS/RECORD           K0704440
                    *                                                   K0704450
                    *                       OUTPUT RECORDS/SECTOR       K0704460
                          BSI   3 OUT-V                                 K0704470
                    *                                                   K0704480
                    *             COMPUTE NUMBER OF DISK BLOCKS         K0704490
                          LDS     0          RESET OVERFLOW & CARRY 2-4 K0704495
                          LD    2 -5        LOAD NO. OF RECORDS         K0704500
                          SRT     12        MULT BY NO. DB/SECTOR (16)  K0704510
                          D     2 -1        DIVIDE BY NO. RCDS/SETOR    K0704520
                          BSC  L  ER74,O     BRANCH IF OVERFLOW     2-4 K0704525
                          STO   3 TEMP-V    SAVE NO. DISK BLOCKS (TEMP) K0704530
                          BSC  L  PTCH1      BRANCH TO PATCH AREA   2-4 K0704540
                    *                                                   K0704590
                    *                       COMMA                       K0704600
                    PTH1A LD    1 -1                                    K0704610
                          S     3 COMA-V                                K0704620
                          BSC  L  DF5,+-    BRANCH IF YES               K0704630
                    *                                                   K0704640
                    *                       SEMI-COLON                  K0704650
                          LD    1 -1                                    K0704660
                          S     3 SEMI-V                                K0704670
                          BSC  L  ER71,Z    BRANCH IF YES               K0704680
                    *                                                   K0704690
                    *                       UPDATE FILE COUNT           K0704700
                          LD   L  DFCNT     INTERPHASE FILE WD. COUNT   K0704710
                          A     3 FCT-V     NO. WDS THIS FILE DESC      K0704720
                          STO  L  DFCNT     SAVE                        K0704730
                          BSC  L  CK1       BR TO PROCESS NEW STMNT     K0704740
                    *                                                   K0704750
                    *                       PUT ERROR 71                K0704760
                    ER71  LD    3 D0071-V   SYNTAX ERROR DEFINE FILE    K0704770
                          MDX     ERR                                   K0704780
                    *                                                   K0704790
                    *                       PUT ERROR 72                K0704800
                    ER72  LD    3 D0072-V   DUPLICATE DEFINE FILE NO.   K0704810
                          MDX     ERR                                   K0704820
                    *                                                   K0704830
                    *                       CONSTANTS                   K0704840
                    V     EQU     *+128     RLTV ADDR FACTOR FOR CON    K0704850
                    HFFFD DC      /FFFD     MASK FOR STRING ID WD       K0704860
                    HF803 DC      /F803     MASK FOR STRING ID WD       K0704870
                    HF802 DC      /F802     MASK FOR STRING ID WD       K0704880
                    HDFDE DC      /DFDE     SYMBOL TABLE MASK           K0704890
                    HA008 DC      /A008     ERROR ID WORD               K0704900
                    H8001 DC      /8001     CON FOR COMP SYM TBL PT     K0704910
                    H8000 DC      /8000     CON   USED FOR BLANK WORD   K0704920
                    H7E00 DC      /7E00     MASK FOR INT. WD. TEST      K0704930
                    H6338 DC      /6338     CALL EXIT CONSTANT          K0704940
                    H5F00 DC      /5F00     CALL EXIT CONSTANT          K0704950
                    H5B00 DC      /5B00     CALL LINK CONSTANT          K0704960
                    H4000 DC      /4000     SYM TBL ID. FOR INTEGER     K0704970
                    H1800 DC      /1800     TEST FOR INTEGER VARIABLE   K0704980
                    H1200 DC      /1200     TEST FOR INTEGER VARIABLE   K0704990
                    H0020 DC      /0020     SYMBOL TABLE MASK           K0705000
                    H0004 DC      /0004     USED TO INCR STMNT NORM     K0705010
                    H0001 DC      /0001     USEFUL CONSTANT             K0705020
                    D0003 DC      3         USEFUL CONSTANT             K0705030
                    D0009 DC      9         CONSTANT TEST NUMERIC       K0705040
                    D0010 DC      10        CONSTANT USED BIN. CONVERT  K0705050
                    D0071 DC      71        ERROR FLAG NO. 71           K0705060
                    D0072 DC      72        ERROR FLAG NO. 72           K0705070
                    D0320 DC      320       MAX. REC.SIZE DEFINE FILE   K0705080
                    FCT   DC      *-*       NO. WDS. IN DEFN FILE O/P   K0705090
                    TEMP  DC      *-*       TEMPORARY STORAGE AREA      K0705100
                    TEMPA DC      *-*       TEMPORARY STORAGE AREA.     K0705110
                    ORIG  DC      *-*       ORIGINAL ID WORD            K0705120
                    FILET DC      DDDT      LOC OF FILE DESCRIPTOR TBL  K0705130
                    FCNT  DC      75        MAX OF 75 DEFINED FILES     K0705140
                    DFILE DC      /F000     DEFN FILE ID FLAG TEST      K0705150
                    CEXIT DC      /E002-/F000 CALL EXIT ID FLAG TEST    K0705160
                    CLINK DC      /E000-/E002 CALL LINK ID FLAG TEST    K0705170
                    ENDCN DC      /1000-/E000 END ID TEST               K0705180
                    SEMI  DC      /1E       SEMI-COLON                  K0705190
                    LPAR  DC      /0D       (                           K0705200
                    RPAR  DC      /1D       )                           K0705210
                    COMA  DC      /2B       ,                           K0705220
                    U     DC      /C800     U                           K0705230
                          BSS  E  0                                     K0705240
                    WD1   DC      *-*       TEMP STO USED TO CONVERT    K0705250
                    WD2   DC      *-*       VARIABLE CONSTANTS(PACKED)  K0705260
                    *                                                   K0705270
                    *                  THE OUTPUT ROUTINE STORES THE    K0705280
                    *                  THE CONTENTS OF THE A REGISTER   K0705290
                    *                  AT XR2, INCRAMENT XR1 AND XR2,   K0705300
                    *                  AND INCRAMENTS THE NORM OF THE   K0705310
                    *                  STATEMENT.                       K0705320
                    *                                                   K0705330
                    OUT   DC      *-*       BSI ENTRY POINT             K0705340
                          STO   2 0         SAVE ACC IN O/P STRING      K0705350
                          MDX   1 1         INCREMENT I/P STRING CTR    K0705360
                          MDX   2 1         INCREMENT O/P STRING CTR    K0705370
                          MDX  L  *-*,4     INCREMENT STMNT NORM BY 1   K0705380
                    IDSV2 EQU     *-1                                   K0705390
                          BSC  I  OUT       RETURN                      K0705400
                    *                                                   K0705410
                    *                  THE COLLECT CONSTANT ROUTINE     K0705420
                    *                  CALLS GATHER CONSTANT ROUTINE    K0705430
                    *                  AND THE CONVERTS THE CONSTANT    K0705440
                    *                  TO BINARY. THE ROUTINE GOES TO   K0705450
                    *                  ERROR NUMBER 71 IF CONSTANT IS   K0705460
                    *                  INVALID, ZERO OR OVER 32767.     K0705470
                    *                                                   K0705480
                    COLL  DC      *-*       BSI ENTRY POINT             K0705490
                          BSI   3 GATH-V    BRANCH TO GET 2 WD CONST    K0705500
                          SLA     16                                    K0705510
                          STO   3 TEMP-V    ZERO TEMP STO WD            K0705520
                    COLL1 LD    3 WD1-V     GET 1ST OF 2 WD CONSTANT    K0705530
                          SLA     2                                     K0705540
                          BSC  L  *+3,C     TEST FOR POSIBLE NUMERIC    K0705550
                          BSC  L  ER71,Z    ZERO CON,   SYNTAX ERROR    K0705560
                          MDX     COLL2     BRANCH TO RETURN            K0705570
                          BSC  L  ER71,-    TEST FOR ZERO, INVALID CON  K0705580
                          SLA     1         SHIFT OFF ONE BIT           K0705590
                          SRA     12        PUT BITS 3-9 INTO BITS9-30  K0705600
                          STO   3 TEMPA-V   SAVE TEMPORARILY            K0705610
                          S     3 D0009-V   DETERMINE IF NO. BETWEEN    K0705620
                          BSC  L  ER71,-Z   0 AND 9. ERROR IF NOT       K0705630
                          LD    3 TEMP-V    MULT PREV. CON   BY 10      K0705640
                          M     3 D0010-V                               K0705650
                          SLT     1         TEST FOR OVERFLOW           K0705660
                          BSC  L  ER71,Z    NO. GT 32767, ERROR         K0705670
                          SLT     15        PUT PREV CON   IN ACC       K0705680
                          A     3 TEMPA-V   ADD CURRENT WD              K0705690
                          STO   3 TEMP-V    SAVE IN PREV. CON           K0705700
                          BSC  L  ER71,+Z   ERROR IF NO. GT 32767       K0705710
                          LDD   3 WD1-V     GET NEXT 6 BITS WD1-WD2     K0705720
                          SLT     6                                     K0705730
                          STD   3 WD1-V     RESET WD1-WD2               K0705740
                          MDX     COLL1     GO PROCESS NEXT 6 BITS      K0705750
                    COLL2 LD    3 TEMP-V                                K0705760
                          BSC  L  ER71,+                                K0705770
                          BSC  I  COLL      BR IF LE 0 TO ERROR         K0705780
                    *                       RETURN                      K0705790
                    *                  THE GATHER CONSTANT ROUTINE      K0705800
                    *                  PICK TWO WORD CONSTANT AND       K0705810
                    *                  PUT THEM IN WD1 AND WD2. POINTER K0705820
                    *                  REMAINS ON LAST WORD USED. ON    K0705830
                    *                  ERRORS THE ROUTINE GOES TO       K0705840
                    *                  ERROR 71.                        K0705850
                    *                                                   K0705860
                    GATH  DC      *-*       BSI ENTRY                   K0705870
                          LD    1 0         GET WORD FROM I/P STRING    K0705880
                          STO   3 WD1-V     SAVE IN WD1                 K0705890
                          SLA     16                                    K0705900
                          STO   3 WD2-V     ZERO WD2.                   K0705910
                          LD    1 1         TEST 2ND WD I/P STRING      K0705920
                          BSC  L  GATH1,-   RETURN IF WD NOT FLAGGED    K0705930
                          SLA     1         REMOVE FLAG.                K0705940
                          STO   3 WD2-V     SAVE WORD 2.                K0705950
                          MDX   1 1         INCREMENT I/P STRING COUNT  K0705960
                          LD    1 1         TEST 3RD WD OF STRING FOR   K0705970
                          BSC  L  ER71,+Z   VAR. SYNTAX ERR IF FOUND    K0705980
                    GATH1 BSC  I  GATH      RETURN                      K0705990
                    *                                                   K0706000
                    *                  THE ERROR ROUTINE REPLACES THE   K0706010
                    *                  STATEMENT WITH AN ERROR MESSAGE. K0706020
                    *                  THE ERROR NUMBER IS IN THE       K0706030
                    *                  ACCUMULATOR WHEN COMING HERE     K0706040
                          DC      *-*                                   K0706050
                    ERR   LDX  I1 IDSV1     GET STRING I/P ID WD ADDR   K0706060
                          LDX  I2 IDSV2     GET STRING O/P ID WD ADDR   K0706070
                          STO   3 TEMP-V    STORE ERROR CONST TEMP.     K0706080
                          LD    3 ORIG-V     GET ID WD FROM I/P STRING  K0706090
                          AND   3 H0001-V   GET STMT NO. FLAG FROM ID   K0706100
                          A     3 HA008-V   INCR BY ERROR ID WORD.      K0706110
                          BSC     E         TEST IF STMT NO. PRESENT    K0706120
                          A     3 H0004-V   INCR. NORM IF STMT HAS NO.  K0706130
                          STO   2 0         SAVE ID WORD IN O/P STRING  K0706140
                          SLA     15        TEST FOR NUMBERED STMT      K0706150
                          BSC     +Z        BR IF NO               2-11 K0706160
                    *  2 INSTRUCTIONS REMOVED                      2-11 K0706170
                          MDX   2 1         INCR O/P STRING COUNT       K0706190
                          LD    3 TEMP-V    GET ERROR NO.               K0706200
                          STO   2 1         PUT IN O/P STRING           K0706210
                          MDX   2 2         INCR O/P STRING CTR         K0706220
                    *                                                   K0706230
                    *                   SKIP OVER REMAINDER OF THE      K0706240
                    *                   STATEMENT.                      K0706250
                    *                                                   K0706260
                    SKIP  LD    3 ORIG-V    GET STMNT ID I/P STRING     K0706270
                          SLA     5                                     K0706280
                          SRA     7         DECODE STMNT NORM           K0706290
                          STO     *+1       INCR I/P STRING CTR BY      K0706300
                          MDX  L1 *-*       STATEMENT NORM              K0706310
                          BSC  L  CK1       GO PROCESS NEXT STMNT       K0706320
                    *                                                   K0706330
                    *                  THIS SUBROUTINE SCANS THE TABLE  K0706340
                    *                  OF DEFINE FILE NUMBERS TO ENSURE K0706350
                    *                  THAT THERE  ARE NO DUPLICATES OR K0706360
                    *                  THAT THERE ARE NOT MORE THAN     K0706370
                    *                       75 DEFINED FILES.           K0706380
                    *                                                   K0706390
                    *                       ACC CONTAINS BIN FILE NO.   K0706400
                    FILES DC      *-*       BSI ENTRY POINT             K0706410
                          STO   3 TEMP-V    SAVE ACC.                   K0706420
                          LD    3 FCNT-V    TEST IF NO. FILES LEFT      K0706430
                          S     3 H0001-V   IS GT 1                     K0706440
                          BSC  L  ER72,+Z   IF NOT, OVERLAP ERROR  2-11 K0706450
                          STO   3 FCNT-V                                K0706460
                          LD    3 FILET-V   GET LOC OF FILE TABLE       K0706470
                          STO     FL1+1                                 K0706480
                    FL1   LD   L  *-*       GET ENTRY FROM TABLE        K0706490
                          BSC  L  FL2,+-    IF ENTRY=0, ADD FILE NO.    K0706500
                          S     3 TEMP-V    COMPARE ENTRY WITH FILE NO  K0706510
                          BSC  L  ER72,+-   EQUAL, DUP FILE ERROR       K0706520
                          MDX  L  FL1+1,-1  MODIFY FILE TABLE LOC.      K0706530
                          MDX     FL1       GO COMPARE ENTRY NEXT FILE  K0706540
                    FL2   MDX  L  FILET,1   INCR. FILE TABLE LOC        K0706550
                          LD    3 TEMP-V    GET BINARY FILE NO.         K0706560
                          STO  I  FILET     SAVE IN FILE TABLE          K0706570
                          BSC  I  FILES     RETURN                      K0706580
                    *                                                   K0706590
                    *                       RESTORE STRING POINTERS     K0706600
                    ED1   MDX   2 -1                                    K0706610
                          STX  L2 EOFS                                  K0706620
                    *                                                   K0706630
                    *                       READ AND GO TO NEXT PHASE   K0706640
                    EXIT  EQU     *                                     K0706650
                          LDX  I1 NXTPH+1   LOAD PARAMETER FOR READING  K0706660
                          LDD     NXTPH+2   NEXT PHASE                  K0706670
                          BSC  L  ROL       GO TO READ NEXT PHASE       K0706680
                          BSS  E  0                                     K0706690
                    NXTPH DC      38        ID OF MEXT PHASE            K0706700
                          BSS     3         LOADER TABLE FOR NEXT PHASE K0706710
                    *                                                   K0706720
                    *                       PATCH AREA                  K0706730
                          BSS     50                                    K0706740
                    *                                                   K0706750
                    *                       DEFINE FILE NUMBER TABLE    K0706760
                    DDDT  DC      0                                     K0706770
                          BSS     75        DEFINED FILE TABLE          K0706780
                    *                                                   K0706790
                    *             PATCH FOR MOD 4                   2-4 K0706800
                    *                                                   K0706810
                    PTCH1 RTE     16         SHIFT REMAINDER TO ACC 2-4 K0706820
                          BSC     Z          SKIP IF NO REMAINDER   2-4 K0706830
                          LD    3 H0001-V    LOAD 1 IF REMAINDER    2-4 K0706840
                          A     3 TEMP-V     ADD NO OF DISK BLOCKS  2-4 K0706850
                          S       DBMAX      COMPARE WITH DISK SIZE 2-4 K0706860
                          BSC  L  ER74,Z-    BRANCH IF EXCEEDED     2-4 K0706870
                          A       DBMAX      RESTORE DB COUNT       2-4 K0706880
                          BSI   3 OUT-V      OUTPUT DB COUNT        2-4 K0706890
                          BSC  L  PTH1A      BRANCH BACK            2-4 K0706900
                    *                                                   K0706910
                    ER74  LD      D0074      LOAD ERROR 74          2-4 K0706920
                          BSC  L  ERR        FILE EXCEEDS DISK SIZE 2-4 K0706930
                    *                                                   K0706940
                    DBMAX DC      /6400      DISK SIZE DB COUNT     2-4 K0706950
                    D0074 DC      74         ERROR FLAG NO 74       2-4 K0706960
                    *                                                   K0706970
                          BSS     /7CB5-*   PATCH AREA             2-11 K0706980
                          DC      0                                     K0706990
                          END     BPHAR-2                               K0707000
