                          HDNG    1130 FORTRAN COMPILER PHASE 12        K1200010
                    *************************************************** K1200020
                    *                                                 * K1200030
                    *STATUS - VERSION 2  MODIFICATION 8               * K1200040
                    *                                                 * K1200050
                    *FUNCTION/OPERATION-                              * K1200060
                    *   * EXAMINES ONLY THE ARITHMETIC, IF, CALL, AND * K1200070
                    *     STATEMENT FUNCTION STATEMENTS IN THE STMNT  * K1200080
                    *     STRING.                                     * K1200090
                    *   * CHECKS SYNTAX OF STATEMENTS EXAMINED.       * K1200100
                    *   * INSERTS A CALL OPERATOR BETWEEN THE SUBPROG * K1200110
                    *     NAME AND ITS DUMMY ARGUMENTS IN A CALL STMNT* K1200120
                    *   * CHECKS STATEMENT FUNCTION CALLS, INCLUDING  * K1200130
                    *     NESTED CALLS, FOR VALID NAMES AND THE       * K1200140
                    *     CORRECT NUMBER OF PARAMETERS.               * K1200150
                    *   * CHECKS TO SEE THAT VARIABLES ARE DEFINED    * K1200160
                    *     CORRECTLY AND SETS DEFINED INDR IN SYM TBL. * K1200170
                    *   * CHECKS FOR VALID STATEMENT NUMBER REFERENCES* K1200180
                    *     IN IF STATEMENTS. REFERENCES TO FORMAT      * K1200190
                    *     STATEMENT NUMBERS ARE INVALID.              * K1200200
                    *   * CHECKS SYNTAX OF THE RECORD NUMBER          * K1200210
                    *     EXPRESSION IN DISK READ/WRITE STATEMENTS.   * K1200220
                    *     THE RIGHT PARENTHESIS IS CHANGED TO A COLON * K1200230
                    *     OPERATOR FACILITATING SCAN OF DISK READY    * K1200240
                    *     WRITE STMNT IN THE NEXT PHASE.              * K1200250
                    *                                                 * K1200260
                    *ENTRY POINTS-                                    * K1200270
                    *   * START-THE PHASE IS LOADED BY THE ROL SUBR   * K1200280
                    *     AND EXECUTION STARTS AT THIS ADDRESS.       * K1200290
                    *                                                 * K1200300
                    *INPUT-                                           * K1200310
                    *   * THE STATEMENT STRING                        * K1200320
                    *   * THE SYMBOL TABLE                            * K1200330
                    *   * FCOM                                        * K1200340
                    *                                                 * K1200350
                    *OUTPUT-                                          * K1200360
                    *   * THE STATEMENT STRING                        * K1200370
                    *   * THE SYMBOL TABLE                            * K1200380
                    *   * FCOM                                        * K1200390
                    *                                                 * K1200400
                    *EXTERNAL REFERENCES-                             * K1200410
                    *   SUBROUTINES-                                  * K1200420
                    *      * ROL                                      * K1200430
                    *   COMMA/FCOM                                    * K1200440
                    *      * $PHSE                                    * K1200450
                    *                                                 * K1200460
                    *EXITS-                                           * K1200470
                    *   NORMAL-                                       * K1200480
                    *      * EXITS VIA A CALL TO THE ROL SUBROUTINE TO* K1200490
                    *        READ IN THE NEXT PHASE.                  * K1200500
                    *   ERROR-                                        * K1200510
                    *      * OVERLAP ERROR-BYPASSES PROCESSING AND    * K1200520
                    *        EXITS VIA THE ROL SUBROUTINE             * K1200530
                    *      * COMPILATION ERRORS DETECTED BY THIS PHASE* K1200540
                    *        ARE 36, 37, 38, 39, 40, 41, 42, AND 43   * K1200550
                    *                                                 * K1200560
                    *TABLES/WORK AREAS-N/A                            * K1200570
                    *                                                 * K1200580
                    *ATTRIBUTES-NONE                                  * K1200590
                    *                                                 * K1200600
                    *NOTES-                                           * K1200610
                    *   THE SWITCHES USED BY THIS PHASE FOLLOW. IF    * K1200620
                    *   NON-ZERO, THE SWITCH IS TRANSFER = T. IF ZERO,* K1200630
                    *   THE SWITCH IS NORMAL=N                        * K1200640
                    *      SW1-DIMENSIONED NAME SUBSCRIPTED           * K1200650
                    *         T = NOT SUBSCRIPTED                     * K1200660
                    *      SW4-SIGN ALLOWABLE                         * K1200670
                    *         N = SIGN ALLOWABLE                      * K1200680
                    *      SW5-POINTER INSIDE FUNCTION CALL           * K1200690
                    *         T = POINTER INSIDE FUNCTION CALL        * K1200700
                    *      SW7-DIMENSIONED NAME                       * K1200710
                    *         T = NAME DIMENSIONED                    * K1200720
                    *                                                 * K1200730
                    *************************************************** K1200740
                          HDNG    1130 FORTRAN COMPILER PHASE 12        K1200750
                          ABS                                           K1200760
                    *                                                   K1200770
                    *                       SYSTEM EQUATES              K1200780
                    MEMRY EQU     /8000                                 K1200790
                    OVERL EQU     MEMRY-1501                        2-4 K1200800
                    ROL   EQU     MEMRY-68  LOC OF RTN TO READ NEXT PH  K1200810
                    $PHSE EQU     /78       NO. OF PHASE NOW IN CORE    K1200820
                    PHLEN EQU     3         NO. OF SECTORS THIS PHASE   K1200825
                          ORG     OVERL                                 K1200830
                    PHID  EQU     42        ID NUMBER THIS PHASE        K1200840
                    *                                                   K1200850
                    *                  FORTRAN COMMUNICATION AREA       K1200860
                    ORG   BSS     1    ORIGIN ADDRESS               2-4 K1200865
                    SOFS  BSS     1    START OF STRING                  K1200870
                    EOFS  BSS     1    END OF STRING                    K1200880
                    SOFST BSS     1    START OF SYMBOL TABLE            K1200890
                    SOFNS BSS     1    START OF NON-STATEMENT NUMBERS   K1200900
                    SOFXT BSS     1    START OF SUBSCRIPT TEMPORARIES   K1200910
                    SOFGT BSS     1    START OF GENERATED TEMPORARIES   K1200920
                    EOFST BSS     1    END OF SYMBOL TABLE              K1200930
                    COMON BSS     1    NEXT AVAILABLE COMMON            K1200940
                    CSIZE BSS     1    SIZE OF COMMON                   K1200950
                    ERROR BSS     1    OVERLAP ERROR                    K1200960
                    FNAME BSS     1         PROGRAM NAME                K1200970
                          BSS     1                                     K1200980
                    SORF  BSS     1    SUBROUTINE(-) OR FUNCTION(+)     K1200990
                    CCWD  BSS     1    CONTROL CARD WORD                K1201000
                    *                BIT 15 TRANSFER TRACE              K1201010
                    *                BIT 14 ARITHMETIC TRACE            K1201020
                    *                BIT 13 EXTENDED PRECISION          K1201030
                    *                BIT 12 LIST SYMBOL TABLE           K1201040
                    *                BIT 11 LIST SUBPROGRAM NAMES       K1201050
                    *                BIT 10 LIST SOURCE PROGRAM         K1201060
                    *                BIT  9 ONE WORD INTEGERS           K1201070
                    *                BIT  8 ORIGIN ADDRESS          2-4 K1201080
                    *                                                   K1201090
                    IOCS  BSS     1    IOCS CONTROL CARD WORD           K1201100
                    *                BIT 15 CARD                        K1201110
                    *                BIT 14 PAPER TAPE                  K1201120
                    *                BIT 13 TYPEWRITER                  K1201130
                    *                BIT 12 1443 PRINTER                K1201140
                    *                BIT 11 MAGNETIC TAPE               K1201150
                    *                BIT 10 KEYBOARD                    K1201160
                    *                BIT  8 DISK                        K1201170
                    *                BIT  3 PLOTTER                     K1201180
                    *                BIT  1 UNFORMATTED DISK            K1201190
                    DFCNT BSS     1                                     K1201200
                    *                                                   K1201210
                    *                                                   K1201220
                    *                                                   K1201230
                    *                                                   K1201240
                    *                  END OF FORTRAN COMMUNICATION     K1201250
                    *                  AREA                             K1201260
                    *************************************************** K1201270
                    *                                                   K1201280
                    *                                                   K1201290
                    BPHAR EQU     *+2       BEGIN PH AREA               K1201300
                          DC      0         LOADER WORK AREA            K1201310
                          DC      -42       -PHASE ID FOR SLET LOOKUP   K1201320
                          DC      NXTPH-*+1 TABLE FOR NEXT PHASE ENTRY  K1201330
                          DC      1         ONE ENTRY TO BE SET BY LDR  K1201340
                          ORG     *-2                                   K1201350
                    *                                                   K1201360
                    START LDX   1 PHID      GET ID THIS PHASE           K1201370
                          STX  L1 $PHSE     STORE IN SYSTEM PHASE AREA  K1201380
                    *                                                   K1201390
                    *             CHECK FOR OVERLAP ERROR               K1201400
                    *                                                   K1201410
                          LD      ERROR     IF NO OVERLAP ERROR THEN BR K1201420
                          BSC  L  ORGIN,+-  TO MOVE STRING.             K1201430
                    *                                                   K1201440
                    *             READ AND GO TO NEXT PHASE             K1201450
                    *                                                   K1201460
                    OVERF LDX  I1 NXTPH+1   LOAD PARAM FOR READING      K1201470
                          LDD     NXTPH+2   NEXT PHASE                  K1201480
                          BSC  L  ROL       BR TO READ IN NEXT PHASE    K1201490
                          BSS  E  0         MAKE ADDRESS EVEN           K1201500
                    NXTPH DC      43        ID OF NEXT PHASE            K1201510
                          BSS     3         LOADER TABLE FOR NEXT PHASE K1201520
                    *                                                   K1201530
                    *             MOVE STRING NEXT TO SYMBOL TABLE      K1201540
                    *                                                   K1201550
                    ORGIN LD      EOFS      END OF STRING ADDRESS       K1201560
                          S       SOFS      START OF STRING ADDRESS     K1201570
                          STO     *+1       ADDR OF NEXT INSTRUCTION    K1201580
                          LDX  L3 *-*       RANGE OF MOVE               K1201590
                          MDX   3 1         NO. OF WORDS INCLUSIVE      K1201600
                          LDX  I2 EOFS      END OF STRING ADDR          K1201610
                          LDX  I1 EOFST     END OF SYMBOL TABLE ADDRESS K1201620
                    ORGA1 LD    2 0         NEXT WORD TO MOVE           K1201630
                          STO   1 +2        MOVE STRING NEXT TO SYM TBL K1201640
                          MDX   1 -1        DECR MOVE TO ADDRESS        K1201650
                          MDX   2 -1        DECR MOVE FROM ADDRESS      K1201660
                          MDX   3 -1        DECR NO. OF WORDS TO MOVE   K1201670
                          MDX     ORGA1     CONTINUE                    K1201680
                          MDX   1 3         INCR TO EQUAL 1ST STMNT PT  K1201690
                    *                                                   K1201700
                    *             INITIALIZE INPUT AND OUTPUT           K1201710
                    *             STRING POINTERS                       K1201720
                    *                                                   K1201730
                          LDX  I2 SOFS      START OF STRING ADDR        K1201740
                          MDX   2 -1        DECR BY 1                   K1201750
                          STX  L2 CKS2+1    STORE AS ASF TABLE ADDRESS  K1201760
                          MDX   2 2                                     K1201770
                          STX  L2 XY33+1    ASF TABLE REFERENCE         K1201780
                          MDX   2 -1                                    K1201790
                          STX  L2 CKS3+1    STORE FOR ASF ARGUMENT CNT  K1201800
                    *                                                   K1201810
                    *             INITIALIZE TO SCAN STATEMENT          K1201820
                    *                                                   K1201830
                    XY1   LD    1 0         STMNT ID WORD               K1201840
                          AND     S07FF     EXTRACT STMNT WORD COUNT    K1201850
                          SRA     2         RIGHT JUSTIFY               K1201860
                          STO  L  XY27+1    STORE AS INSTRUCTION ADDR   K1201870
                          STX   1 XT1       INDEX REG 1 TEMPORARY       K1201880
                          A       XT1       ADDR OF STMNT ID WORD       K1201890
                          STO  L  NXTID     ADDR OF NEXT STMNT ID WORD  K1201900
                          STX  L2 IDSV2     INDEX REG 2 TEMPORARY       K1201910
                          STX   1 IDSV1     INDEX REG 1 TEMPORARY       K1201920
                          BSI  L  MOVE1     BR TO OUTPUT 1 ELEMENT      K1201930
                          LD    1 -1        STMNT ID WORD               K1201940
                          EOR     S0001     EXTRACT AND REVERSE BIT 15  K1201950
                          BSC  L  XY2,E     BR IF NOT A NUMBERED STMNT  K1201960
                          BSI  L  MOVE1     BR TO OUTPUT ONE ELEMENT    K1201970
                          MDX  L  XY27+1,-1 ADJUST TO EXCLUDE STMNT NO. K1201980
                    *                                                   K1201990
                    *             CHECK FOR END STATEMENT               K1202000
                    *                                                   K1202010
                    XY2   LD   L  *-*       STMNT ID WORD               K1202020
                    IDSV1 EQU     XY2+1     LABEL PREVIOUS ADDRESS      K1202030
                          SRA     11        RIGHT JUSTIFY STMNT TYPE    K1202040
                          S       TEND      END STMNT CONSTANT          K1202050
                          BSC  L  XY5,Z     BR IF NOT END STMNT         K1202060
                    *                                                   K1202070
                    *             REMOVE ASF TABLE IF PRESENT           K1202080
                    *                                                   K1202090
                          MDX  L  CKAS+1,-1 DECR ASF TABLE COUNTER      K1202100
                          MDX     *+1       BR IF ASF TABLE             K1202110
                          MDX     XY34      BR IF NO ASF TABLE          K1202120
                          STX   2 EOFS      END OF STRING ADDR          K1202130
                          LD      SOFS      START OF STRING ADDR        K1202140
                          A    L  CKAS+1    ASF TABLE COUNT             K1202150
                          STO     *+1       ADDR OF NEXT INSTRUCTION    K1202160
                          LDX  L1 *-*       MOVE FROM ADDRESS           K1202170
                          LDX  I2 SOFS      MOVE TO ADDRESS             K1202180
                          S    L  EOFS      END OF STRING ADDRESS       K1202190
                          STO     *+1       ADDR OF NEXT INSTRUCTION    K1202200
                          LDX  L3 *-*       RANGE OF MOVE               K1202210
                    MV1   LD    1 0         NEXT WORD TO MOVE           K1202220
                          STO   2 0         REMOVE ARITH STMNT FUNC TBL K1202230
                          MDX   1 1         INCR MOVE FROM ADDR         K1202240
                          MDX   2 1         INCR MOVE TO ADDR           K1202250
                          MDX   3 1         INCR MOVE COUNTER           K1202260
                          MDX     MV1       BR TO CONTINUE MOVE         K1202270
                    XY34  MDX   2 -1        END OF STRING = XR2-1       K1202280
                          STX  L2 EOFS      NEW END OF STRING ADDR      K1202290
                          MDX     OVERF                                 K1202300
                    *                                                   K1202310
                    *             CONSTANTS AND WORK AREA               K1202320
                    *                                                   K1202330
                    XT1   DC      0         INDEX REG 1 TEMPORARY       K1202340
                    S07FF DC      /07FF     STMNT TYPE MASK CONSTANT    K1202350
                    TEND  DC      /02       END STMNT CONSTANT          K1202360
                    ERNO  DC      0         ERROR NUMBER TEMPORARY      K1202370
                    S0001 DC      /0001     STMNT NO. INDR BIT MASK     K1202380
                    SF802 DC      /F803     STMNT WORD COUNT MASK       K1202390
                    S0020 DC      /0020     DEFINED BIT CONSTANT        K1202400
                    *                                                   K1202410
                    *             CHECK FOR STMNT TERMINATOR            K1202420
                    *                                                   K1202430
                    XY13  LD    1 0         NEXT STMNT WORD             K1202440
                          BSC  L  XY7,Z     BR IF NO TERMINATOR         K1202450
                    XY11  BSI  L  PUT       BR TO MOVE 1 WD TO OUTPUT   K1202460
                    CRCTN LD   I  IDSV2     STMNT ID WITHOUT WD COUNT   K1202470
                          AND  L  SF802     ZERO WORD COUNT BITS        K1202480
                          STO     XT4       STMNT ID WORD TEMPORARY     K1202490
                          STX   2 XT3       INDEX REG 2 TEMPORARY       K1202500
                          LD      XT3       NEXT STMNT ID WD ADDRESS    K1202510
                          S       IDSV2     CURRENT STMNT ID WD ADDRESS K1202520
                          SLA     2         POSITION TO STORE STMNT CNT K1202530
                          A       XT4       STMNT ID W/O WORD COUNT     K1202540
                          STO  I  IDSV2     CORRECTED STMNT ID WORD     K1202550
                          MDX     XY22      BR TO MOVE TO NEXT STMNT    K1202560
                    *                                                   K1202570
                    *             CONSTANTS AND WORK AREA               K1202580
                    *                                                   K1202590
                    XT3   DC      0         INDEX REG 2 TEMPORARY       K1202600
                    XT4   DC      0         STMNT ID WORD TEMPORARY     K1202610
                    ERID  DC      /A008     ERROR ID WORD               K1202620
                    *                                                   K1202630
                    *             REPLACE STATEMENT WITH ERROR          K1202640
                    *                                                   K1202650
                    XY7   LDX  L2 *-*       STMNT ID WORD ADDRESS       K1202660
                    ATERR EQU     XY7       LABEL LAST INSTRUCTION      K1202670
                    IDSV2 EQU     XY7+1     LABEL LAST INSTRUCTION ADDR K1202680
                          LD    2 0         OUTPUT STMNT ID WORD        K1202690
                          EOR     FIVE      REVERSE STMNT NO. INDR BIT  K1202700
                          BSC  L  *+5,E     BR IF NOT A NUMBERED STMNT  K1202710
                          LD      FIVE      STMNT NUMBERED INDR         K1202720
                          A       ERID      SET BIT 15 ON AND INCR CNT  K1202730
                          STO   2 0         REPLACE STMNT ID WORD       K1202740
                          MDX   2 1         INCR STMNT POINTER          K1202750
                          MDX     *+3       BR TO SET UP ERROR NUMBER   K1202760
                          LD   L  ERID      ERROR ID WORD               K1202770
                          STO   2 0         STMNT ID WORD               K1202780
                          LD   L  ERNO      ERROR NUMBER                K1202790
                          STO   2 1         STORE ON OUTPUT STRING      K1202800
                          MDX   2 2         INCR STMNT POINTER          K1202810
                    XY22  LDX  L1 *-*       NEXT STMNT ID WORD ADDRESS  K1202820
                    NXTID EQU     XY22+1    LABEL FOR PRECEDING ADDRESS K1202830
                          BSC  L  XY1       BR TO SCAN NEXT STMNT       K1202840
                    *                                                   K1202850
                    *             CHECK FOR AN ARITHMETIC STATEMENT     K1202860
                    *                                                   K1202870
                    XY5   S       TARTH     ARITH STMNT CONSTANT        K1202880
                          BSC  L  XY23,Z    BR IF NOT ARITH STMNT       K1202890
                          LDX   3 36        ERROR NUMBER 36             K1202900
                          STX  L3 ERNO      SET UP ERROR NUMBER         K1202910
                          LD    1 0         STMNT ID WORD               K1202920
                          BSI     GETID     BR TO GET SYMBOL TBL ID WD  K1202930
                          BSI  L  TESTV     BR TO TEST VARIABLE NAMES   K1202940
                          LD    3 0         SYMBOL TABLE ID WORD        K1202950
                          OR   L  S0020     SET DEFINED BIT ON          K1202960
                          STO   3 0         RESTORE ID WORD             K1202970
                          BSI  L  NAME      BR TO CHK NAME DIMENSIONING K1202980
                          LD   L  SW1       TEST DIMENSIONED NAME SUBSC K1202990
                          BSC  L  XY7,Z     BR IF NOT SUBSCRIPTED       K1203000
                    *                                                   K1203010
                    *             SCAN ARITH EXPRESSION IF EQUAL SIGN   K1203020
                    *                                                   K1203030
                    XY5A  LD    1 0         NEXT STMNT WORD             K1203040
                          S       EQSGN     EQUAL SIGN CONSTANT         K1203050
                          BSC  L  XY7,Z     BR IF NOT EQUAL SIGN        K1203060
                          BSI  L  MOVE1     BR TO MOVE ONE ELEMENT      K1203070
                          BSI  L  ARITH     BR TO ARITH SCAN            K1203080
                          MDX     XY13      BR TO CHK FOR SEMICOLON     K1203090
                    *                                                   K1203100
                    *             CHECK FOR IF STATEMENT                K1203110
                    *                                                   K1203120
                    XY23  S       TIF       IF STMNT CONSTANT           K1203130
                          BSC  L  XY25,Z    BR IF NOT IF STMNT          K1203140
                          LDX   3 37        ERROR NUMBER 37             K1203150
                          STX  L3 ERNO      SET UP ERROR NUMBER         K1203160
                          LD      IFOP      IF OPERATOR                 K1203170
                          BSI     CHECK     BR TO CHK STRING OVERLAP    K1203180
                    *                                                   K1203190
                    *             CHECK FOR LEFT PARENTHESIS            K1203200
                    *                                                   K1203210
                          LD    1 0         NEXT STMNT WORD             K1203220
                          S       ULP       LEFT PARENTHESIS CONSTANT   K1203230
                          BSC  L  XY7,Z     BR IF NOT LEFT PARENTHESIS  K1203240
                          BSI     MOVE1     BR TO MOVE ONE ELEMENT      K1203250
                          LDX   3 38        ERROR NUMBER 38             K1203260
                          STX  L3 ERNO      SET UP ERROR WORD           K1203270
                          BSI  L  ARITH     BR TO ARITH SCAN            K1203280
                          LDX   3 37        ERROR NUMBER 37             K1203290
                          STX  L3 ERNO      SET UP ERROR WORD           K1203300
                    *                                                   K1203310
                    *             CHECK FOR RIGHT PARENTHESIS           K1203320
                    *                                                   K1203330
                          LD    1 0         NEXT STMNT WORD             K1203340
                          S       URP       RIGHT PARENTHESIS CONSTANT  K1203350
                          BSC  L  XY7,Z     BR IF NOT RIGHT PARENTHESIS K1203360
                          BSI     MOVE1     BR TO MOVE ONE ELEMENT      K1203370
                    *                                                   K1203380
                    *             CHECK FOR COMMA OPERATOR              K1203390
                    *                                                   K1203400
                          LD      UCMA      COMMA OPERATOR CONSTANT     K1203410
                          BSI     CHECK     BR TO CHECK STRING OVERLAP  K1203420
                          BSI  L  LIST      BR TO CHK STMNT NO. LISTS   K1203430
                          LD   L  CNT       STMNT NO. COUNT             K1203440
                          S       FIVE      DECIMAL FIVE                K1203450
                          BSC  L  XY7,Z     BR IF NOT FIVE              K1203460
                          MDX     XY13      BR TO CHK FOR SEMICOLON     K1203470
                    *                                                   K1203480
                    *             CONSTANTS AND WORK AREA               K1203490
                    *                                                   K1203500
                    TARTH DC      /00-/02   ARITHMETIC ID               K1203510
                    EQSGN DC      /0E       = OPERATOR                  K1203520
                    FIVE  DC      5         DECIMAL FIVE CONSTANT       K1203530
                    TIF   DC      /0F-/00   IF ID                       K1203540
                    IFOP  DC      /14       IF OPERATOR                 K1203550
                    ULP   DC      /10       ( OPERATOR                  K1203560
                    URP   DC      /02       ) OPERATOR                  K1203570
                    UCMA  DC      /12       , OPERATOR                  K1203580
                    *************************************************** K1203590
                    *             THIS SUBROUTINE GETS THE ID WORD    * K1203600
                    *             FROM THE SYMBOL TABLE. THE ENTRY IS * K1203610
                    *             A BSI INSTRUCTION TO THE LABEL GETID* K1203620
                    *************************************************** K1203630
                    *                                                   K1203640
                    *             GET ID WORD                           K1203650
                    *                                                   K1203660
                    GETID DC      0         RETURN ADDRESS              K1203670
                          BSC  L  XY7,-     BR IF NOT SYMBOL TBL PT     K1203680
                          AND     SO1FF     EXTRACT TABLE DISPLACEMENT  K1203690
                          SLA     2         EFFECTIVE MULTIPLY BY 4     K1203700
                          STO     *+6       TEMPORARY STORE             K1203710
                          SRA     2         RESTORE - RIGHT JUSTIFY     K1203720
                          S       *+4       -3 TIMES DISPLACEMENT       K1203730
                          A    L  SOFST     START OF SYMBOL TBL ADDR    K1203740
                          STO     *+1       ADDR OF NEXT INSTRUCTION    K1203750
                          LDX  L3 *-*       INDEX 3 = SYMBOL TBL ADDR   K1203760
                          MDX   3 3         ADJUST ADDRESS              K1203770
                          LD    3 0         SYMBOL TABLE ID WORD        K1203780
                          BSC  I  GETID     BR TO EXIT GETID SUBROUTINE K1203790
                    *                                                   K1203800
                    *             CONSTANTS AND WORK AREA               K1203810
                    *                                                   K1203820
                    SO1FF DC      /07FF     SYMBOL TBL POINTER MASK     K1203830
                    *                                                   K1203840
                    *************************************************** K1203850
                    *             THIS SUBROUTINE PLACES THE ITEMS    * K1203860
                    *             ON THE NEW STRING. THE ENTRY IS A   * K1203870
                    *             BSI INSTRUCTION TO THE LABEL PUT.   * K1203880
                    *************************************************** K1203890
                    *             STORE ACCUMULATOR ON NEW STRING       K1203900
                    *                                                   K1203910
                    PUT   DC      0         RETURN ADDRESS              K1203920
                          STO   2 0         ONE ELEMENT TO NEW STRING   K1203930
                          MDX   2 1         INCR NEW STRING POINTER     K1203940
                          BSC  I  PUT       BR TO EXIT FROM PUT         K1203950
                    *************************************************** K1203960
                    *             THIS SUBROUTINE CHECKS FOR ROOM     * K1203970
                    *             BETWEEN THE TWO STRINGS. THE ENTRY  * K1203980
                    *             IS A BSI INSTRUCTION TO THE LABEL   * K1203990
                    *             CHECK.                              * K1204000
                    *************************************************** K1204010
                    *                                                   K1204020
                    *             CALL PUT                              K1204030
                    *                                                   K1204040
                    CHECK DC      0         RETURN ADDRESS              K1204050
                          BSI     PUT       BR TO MOVE ONE ELEMENT      K1204060
                    *                                                   K1204070
                    *             CHK FOR XR1 GREATER THAN XR2          K1204080
                    *                                                   K1204090
                          STX   1 CKTEM     INDEX REGISTER 1 TEMPORARY  K1204100
                          LD      CKTEM     ADDR OF INPUT STRING        K1204110
                          STX   2 CKTEM     INDEX REGISTER 2 TEMPORARY  K1204120
                          S       CKTEM     ADDR OF OUTPUT STRING       K1204130
                          BSC  L  CK1,+     BR IF STRING OVERLAP        K1204140
                          BSC  I  CHECK     BR TO EXIT                  K1204150
                    CK1   MDX  L  ERROR,1   SET OVERLAP ERROR ON        K1204160
                          BSC  L  OVERF     BR TO RD AND GO TO NEXT PH  K1204170
                    *                                                   K1204180
                    *             CONSTANTS AND WORK AREA               K1204190
                    *                                                   K1204200
                    CKTEM DC      0         INDEX REG TEMPORARY STORE   K1204210
                    *                                                   K1204220
                    *************************************************** K1204230
                    *             THIS SUBROUTINE OUTPUTS ONE ELEMENT * K1204240
                    *             AND MOVES THE POINTER. THE ENTRY IS * K1204250
                    *             A BSI INSTRUCTION TO THE LABEL MOVE1* K1204260
                    *************************************************** K1204270
                    *             CALL PUT                              K1204280
                    *                                                   K1204290
                    MOVE1 DC      0         RETURN ADDRESS              K1204300
                          LD    1 0         NEXT STMNT WORD             K1204310
                          BSI     PUT       BR TO MOVE ONE ELEMENT      K1204320
                          MDX   1 1         INCR INPUT POINTER          K1204330
                          BSC  I  MOVE1     BR TO EXIT                  K1204340
                    *************************************************** K1204350
                    *             THIS SUBROUTINE OUTPUT UNDER CONTROL* K1204360
                    *             OF XR3. THE ENTRY IS A BSI INSTRUC. * K1204370
                    *             TO THE LABEL OUT.                   * K1204380
                    *************************************************** K1204390
                    *                  CALL MOVE1                       K1204400
                    *                                                   K1204410
                    OUT   DC      0         RETURN ADDRESS              K1204420
                          BSI     MOVE1     BR TO MOVE ONE ELEMENT      K1204430
                          MDX   3 -1        DECR MOVE COUNT             K1204440
                          MDX     OUT+1     BR TO OUTPUT ONE MORE       K1204450
                          BSC  I  OUT       EXIT IF COUNT IS ZERO       K1204460
                    *************************************************** K1204470
                    *             THIS SUBROUTINE HANDLES THE NAME    * K1204480
                    *             AND THE SUBSCRIPT IF THERE IS AND   * K1204490
                    *             SHOULD BE ONE. THE ENTRY IS A BSI   * K1204500
                    *             INSTRUCTION TO THE LABEL NAME.      * K1204510
                    *************************************************** K1204520
                    *                                                   K1204530
                    *             CALL PUT                              K1204540
                    *                                                   K1204550
                    NAME  DC      0         RETURN ADDRESS              K1204560
                          LD    1 0         NEXT STMNT WORD             K1204570
                          BSI     PUT       BR TO OUTPUT ONE ELEMENT    K1204580
                          BSI     GETID     BR TO GET SYMBOL TBL ID WD  K1204590
                          STO     SVID      ID WORD TEMPORARY           K1204600
                          AND     S1800     EXTRACT DIMENSION BITS      K1204610
                          BSC  L  NAME1,Z   BR IF NOT DIMENSIONED NAME  K1204620
                          MDX   1 1         INCR STMNT POINTER          K1204630
                          STX   0 SW7       SET DIMENSIONED NAME SW ON  K1204640
                    NAME3 SLA     16        CLEAR ACCUMULATOR           K1204650
                          STO     SW1       ZERO DIMENSION SUBSC INDR   K1204660
                    NAME8 BSC  I  NAME      BR TO EXIT                  K1204670
                    *                                                   K1204680
                    *             RESET DIMENSIONED NAME SWITCH         K1204690
                    *                                                   K1204700
                    NAME1 SLA     16        CLEAR ACCUMULATOR           K1204710
                          STO     SW7       RESET DIMENSIONED NAME SW   K1204720
                          MDX   1 1         INCR STMNT POINTER          K1204730
                          LD    1 0         NEXT STMNT WORD             K1204740
                          S       NP3       3 DIMENSION OPERATOR CON    K1204750
                          BSC  L  NAME2,Z   BR IF NOT 3 DIMENSION       K1204760
                          LDX   3 15        SET UP OUTPUT SPACE IN XR3  K1204770
                    NAME4 BSI     OUT       BR TO MOVE TO OUTPUT STRING K1204780
                          MDX     NAME3     BR TO NORMALIZE SWITCH 1    K1204790
                    NAME2 S       NP2       2 DIMENSION OPERATOR CON    K1204800
                          BSC  L  NAME5,Z   BR IF NOT 2 DIMENSION       K1204810
                          LDX   3 11        SET UP OUTPUT SPACE IN XR3  K1204820
                          MDX     NAME4     BR TO OUTPUT                K1204830
                    NAME5 S       NP1       1 DIMENSION OPERATOR CON    K1204840
                          BSC  L  NAME6,Z   BR IF NOT 1 DIMENSION       K1204850
                          LDX   3 7         SET UP OUTPUT SPACE IN XR3  K1204860
                          MDX     NAME4     BR TO OUTPUT                K1204870
                    NAME6 S       NP0       O DIMENSION OPERATOR CON    K1204880
                          BSC  L  NAME7,Z   BR IF NOT O DIMENSION       K1204890
                          LDX   3 3         SET UP OUTPUT SPACE IN XR3  K1204900
                          MDX     NAME4     BR TO OUTPUT                K1204910
                    NAME7 STX   0 SW1       SET SWITCH 1 ON             K1204920
                          MDX     NAME8     BR TO EXIT FROM NAME        K1204930
                    *                                                   K1204940
                    *             CONSTANTS AND WORK AREA               K1204950
                    *                                                   K1204960
                    SW1   DC      0         DIMENSIONED NAME SUBSC SW   K1204970
                    SW7   DC      0         DIMENSIONED NAME SWITCH     K1204980
                    S1800 DC      /1800     DIMENSION INDICATOR MASK    K1204990
                    NP3   DC      /1E       (3 OPERATOR CONSTANT        K1205000
                    NP2   DC      /1C-/1E   (2 OPERATOR CONSTANT        K1205010
                    NP1   DC      /1A-/1C   (1 OPERATOR CONSTANT        K1205020
                    NP0   DC      /18-/1A   (0 OPERATOR CONSTANT        K1205030
                    SVID  DC      *-*       SYMBOL TABLE ID WORD TEMP   K1205040
                    *************************************************** K1205050
                    *             THIS SUBROUTINE CHECKS THE STATEMENTS K1205060
                    *             NUMBER LIST OF IF AND GOTO STATEMENTS K1205070
                    *             ENTRY IS A BSI INSTRUCTION TO THE   * K1205080
                    *             LABEL LIST                          * K1205090
                    *************************************************** K1205100
                    LIST  DC      0         RETURN ADDRESS              K1205110
                          SLA     16        CLEAR ACCUMULATOR           K1205120
                          STO     CNT       ZERO COUNT OF WORDS OUTPUT  K1205130
                    *                                                   K1205140
                    *             CHK FOR NON-FORMAT STMNT NUMBER       K1205150
                    *                                                   K1205160
                    LIST3 LD    1 0         NEXT STMNT WORD             K1205170
                          BSI  L  GETID     BR TO GET SYMBOL TABLE ID   K1205180
                          AND     SFFDF     REMOVE REFERENCED NO. INDR  K1205190
                          EOR     S0200     FLIP STMNT NO. INDR BIT     K1205200
                          BSC  L  LIST2,Z   BR IF NO STMNT NUMBER       K1205210
                          BSI     MOVE1     BR TO MOVE 1 WD TO OUTPUT   K1205220
                          MDX  L  CNT,1     INCR WORDS OUTPUT COUNT     K1205230
                    *                                                   K1205240
                    *             CHECK FOR COMMA CHARACTER             K1205250
                    *                                                   K1205260
                          LD    1 0         NEXT STMNT WORD             K1205270
                          S       LCMA      COMMA CONSTANT              K1205280
                          BSC  L  LIST4,+-  BR IF COMMA                 K1205290
                          MDX     LIST5     BR TO EXIT                  K1205300
                    *                                                   K1205310
                    *             SET UP ERROR 43                       K1205320
                    *                                                   K1205330
                    LIST2 LDX   3 43        INDEX REG 3 = 43            K1205340
                          STX  L3 ERNO      SET UP ERROR WORD           K1205350
                    *                                                   K1205360
                    *             RETURN                                K1205370
                    *                                                   K1205380
                    LIST5 BSC  I  LIST      EXIT FROM LIST CHECK SUBR   K1205390
                    LIST4 MDX  L  CNT,1     INCR WORD OUTPUT COUNT      K1205400
                          BSI  L  MOVE1     BR TO OUTPUT ONE WORD       K1205410
                          MDX     LIST3     BR TO GET SYMBOL TBL ID WD  K1205420
                    *                                                   K1205430
                    *             CONSTANTS AND WORK AREA               K1205440
                    *                                                   K1205450
                    CNT   DC      0         NO. OF WDS OUTPUT COUNTER   K1205460
                    LCMA  DC      /12       COMMA CHARACTER CONSTANT    K1205470
                    SFFDF DC      /FFDF     SYMBOL TABLE ID WORD MASK   K1205480
                    S0200 DC      /0200     STMNT NUMBER INDR MASK      K1205490
                    *************************************************** K1205500
                    *             THIS SUBROUTINE CHECKS AND ALTERS   * K1205510
                    *             ALL ARITHMETIC EXPRESSIONS TO BE    * K1205520
                    *             SCANNED. THE ENTRY IS A BSI COMMAND * K1205530
                    *             TO THE LABEL ARITH. INDEX REGISTER  * K1205540
                    *             1 POINTS AT THE RIGHT STRING AND    * K1205550
                    *             INDEX REGISTER 2 POINTS AT THE LEFT * K1205560
                    *             STRING. THE ARITHMETIC EXPRESSION   * K1205570
                    *             IS MOVED FROM THE RIGHT STRING TO   * K1205580
                    *             THE LEFT STRING AS IT IS CHECKED.   * K1205590
                    *             A NEST CALL TABLE IS INSERTED IN THE* K1205600
                    *             STRING AS NEEDED.                   * K1205610
                    *************************************************** K1205620
                    *                                                   K1205630
                    *             INITIALIZE TO HANDLE EXPRESSIONS      K1205640
                    *                                                   K1205650
                    ARITH DC      0         SUBR ENTRY POINT            K1205660
                          SLA     16        CLEAR ACCUMULATOR           K1205670
                          STO     PAR       CLEAR PARENTHESIS COUNTER   K1205680
                          STO     SW4       CLEAR SIGN ALLOWABLE SWITCH K1205690
                          STO     SW5       CLEAR PT INSIDE FUNCTION SW K1205700
                          STO     CALLN     FUNCTION CALL INDICATOR     K1205710
                          STO     ASFN      ARITH STMNT FUNC INDICATOR  K1205720
                          LDX   3 1         SET INDEX REG 3 =1          K1205730
                          STX   3 PARNO     INITIALIZE PARAMETER COUNT  K1205740
                          LD   L  NXTID                                 K1205750
                          STO  L  ATH14+1   ADDR OF NEXT STMNT ID WORD  K1205760
                    ATH3  LD    1 0         NEXT STMNT WORD             K1205770
                          BSC  L  ATH1,+Z   BR IF NOT OPERATOR          K1205780
                          S       ARPEN     LEFT PARENTHESIS CONSTANT   K1205790
                          BSC  L  ATH2,Z    BR IF NOT LEFT PARENTHESIS  K1205800
                    *                                                   K1205810
                    *                  PAR = PAR + 1                    K1205820
                          MDX  L  PAR,1     INCR PARENTHESIS COUNT      K1205830
                    ATH12 BSI  L  MOVE1     BR TO MOVE ONE WD TO OUTPUT K1205840
                          SLA     16        CLEAR ACCUMULATOR           K1205850
                          STO     SW4       NORMALIZE SWITCH 4          K1205860
                          MDX     ATH3      BR TO CHK NEXT STMNT WORD   K1205870
                    ATH2  LD      SW4       SIGN ALLOWABLE SWITCH       K1205880
                          BSC  L  ATERR,Z   BR IF SIGN NOT ALLOWABLE    K1205890
                          LD    1 0         NEXT STMNT WORD             K1205900
                          S    L  APSGN     PLUS SIGN CONSTANT          K1205910
                          BSC  L  ATH4,+-   BR IF PLUS SIGN FOUND       K1205920
                          S    L  AMSGN     MINUS SIGN CONSTANT         K1205930
                          BSC  L  ATERR,Z   BR IF NOT MINUS SIGN        K1205940
                    *                                                   K1205950
                    *             CALL PUT (U- OPERATOR)                K1205960
                    *                                                   K1205970
                          LD   L  UMNS      U- OPERATOR                 K1205980
                          BSI  L  PUT       BR TO PUT ON OUTPUT STRING  K1205990
                    ATH4  MDX   1 1         INCR STMNT POINTER          K1206000
                    ATH11 STX   0 SW4       SET SWITCH 4 ON             K1206010
                          MDX     ATH3      BR TO CHK NEXT STMNT WORD   K1206020
                    ATH1  STO  L  SNAME     SAVE NAME IN SNAME          K1206030
                          BSI  L  NAME      BR TO CHK NAME DIMENSIONING K1206040
                          LD   L  SW1       DIMENSIONED NAME SUBSCR SW  K1206050
                          BSC  L  ATH5,Z    BR IF NAME NOT SUBSCRIPTED  K1206060
                          LD   L  SW7       DIMENSIONED NAME SWITCH     K1206070
                          BSC  L  ATH6,+-   BR IF NAME NOT DIMENSIONED  K1206080
                    *                                                   K1206090
                    *             CHECK FOR CONSTANT                    K1206100
                    *                                                   K1206110
                          LD      SVID      SYMBOL TABLE ID WORD        K1206120
                          BSC  L  ATH6,+Z   BR TO CHECK FOR SEMICOLON   K1206130
                          LD    1 0         NEXT STMNT WORD             K1206140
                          S       ARPEN     LEFT PARENTHESIS CONSTANT   K1206150
                          BSC  L  ATH7,+-   BR IF LEFT PARENTHESIS      K1206160
                          LD      SVID      LOAD ID                     K1206170
                          AND     S0190    CHECK IF ARITHMETIC STMNT    K1206180
                          BSC  L  ATH6,+-   BR IF ARITHMETIC STMNT      K1206190
                          EOR     H0090                                 K1206200
                          BSC  L  ATH20,+-  BRANCH IF EXTERNAL      2-6 K1206210
                          LD   L  SORF      TEST FOR SUBR OR FUNCTION   K1206220
                          BSC  L  XY7,+     BRANCH IF SUBROUTINE        K1206230
                          LD   L  FNAME     LOAD PROG NAME SYM TBL PT   K1206240
                          S    L  SNAME     COMPARE WITH FUNCTION PT    K1206250
                    ATH21 BSC  L  XY7,Z     BR TO ERR IF FNAME NE SNAME K1206260
                    ATH6  LD    1 0         NEXT STMNT WORD             K1206270
                          BSC  L  ATH8,+-   BR IF SEMICOLON             K1206280
                          S       APSGN     PLUS SIGN CONSTANT          K1206290
                          BSC  L  ATH9,+-   BR IF PLUS SIGN             K1206300
                          S       AMSGN     MINUS SIGN CONSTANT         K1206310
                          BSC  L  ATH9,+-   BR IF MINUS SIGN            K1206320
                          S       ASLH      SLASH CONSTANT              K1206330
                          BSC  L  ATH9,+-   BR IF SLASH                 K1206340
                          S       ASTER     ASTERISK CONSTANT           K1206350
                          BSC  L  ATH10,Z   BR IF NOT ASTERISK          K1206360
                          LD    1 1         NEXT STMNT WORD             K1206370
                          S       ASK       ASTERISK CONSTANT           K1206380
                          BSC  L  ATH9,Z    BR IF NOT ASTERISK          K1206390
                    *                                                   K1206400
                    *             CALL PUT  (** OPERATOR)               K1206410
                    *                                                   K1206420
                          MDX   1 2         MOVE POINTER BY 2           K1206430
                          LD      AEXP      ** OPERATOR                 K1206440
                          BSI  L  PUT       BR TO PUT ON OUTPUT STRING  K1206450
                          MDX     ATH11     BR TO TAG SWITCH 4          K1206460
                    ATH9  BSI  L  MOVE1     BR TO ONE WD TO OUTPUT      K1206470
                          MDX     ATH11     BR TO TAG SWITCH 4          K1206480
                    ATH8  LD      PAR       PARENTHESIS COUNT           K1206490
                          BSC  L  ATERR,Z   BR IF NOT ZERO TO SET ERROR K1206500
                          BSC  I  ARITH     BR TO EXIT FROM ARITH SUBR  K1206510
                    *                                                   K1206520
                    ATH20 LD      SW5       ERROR IF POINTER IS     2-8 K1206521
                          BSC  L  XY7,+-    *OUTSIDE PARAMETER LIST 2-8 K1206522
                          MDX     ATH6      CONTINUE IF NOT         2-8 K1206523
                    *                                                   K1206527
                    *             CONSTANTS AND WORK AREA               K1206530
                    *                                                   K1206540
                    PAR   DC      0         PARENTHESIS COUNT           K1206550
                    SW4   DC      0         SWITCH 4 - SIGN ALLOWABLE   K1206560
                    SW5   DC      0         POINTER INSIDE FUNC CALL SW K1206570
                    ARPEN DC      /10       LEFT PARENTHESIS CONSTANT   K1206580
                    CALLN DC      0         FUNCTION CALL INDICATOR     K1206590
                    PARNO DC      0         PARAMETER COUNT             K1206600
                    ASFN  DC      0         ARITH STMNT FUNC INDICATOR  K1206610
                    S0190 DC      /0190    ARITHMETIC STMNT MASK        K1206620
                    H0090 DC      /0090    EXTERNAL STMNT MASK          K1206630
                    *                                                   K1206640
                    *             CALL CHECK (C OPERATOR)               K1206650
                    *                                                   K1206660
                    ATH7  LD      ACALL     C OPERATOR                  K1206670
                          BSI  L  CHECK     CHECK FOR OVERLAP           K1206680
                          STX   0 SW5       SET SWITCH 5 ON             K1206690
                          MDX  L  CALLN,1   CALLN = CALLN +1            K1206700
                    *                                                   K1206710
                    *             CHK FOR LEGAL SUBPROGRAM NAME         K1206720
                    *                                                   K1206730
                          LD      SNAME     IS IT REFERENCE TO      2-5 K1206732
                          S    L  FNAME     NAME OF THIS PROGRAM    2-5 K1206734
                          BSC  L  ATERR,+-  YES - ERROR 36          2-5 K1206736
                          LD      SNAME     NAME                        K1206740
                          BSI  L  GETID     GET SYMBOL TABLE ID WORD    K1206750
                          SLA     8         SUBPROGRAM NAME BIT TO SIGN K1206760
                          BSC  L  ATH19,C   BR IF STMNT FUNCTION NAME   K1206770
                          BSC  L  ATH17,+Z  BR IF SUBPROGRAM NAME       K1206780
                          LD    3 0         SYMBOL TABLE ID WORD        K1206790
                          AND     SBE7F     LEGAL SUBPROGRAM NAME MASK  K1206800
                          BSC  L  ATERR,Z   BR TO SET UP ERROR          K1206810
                    ATH15 LD    3 0         SYMBOL TABLE ID WORD        K1206820
                          OR      S0080     SUBPROGRAM INDICATOR BIT    K1206830
                          STO   3 0         RESTORE SYMBOL TBL ID WORD  K1206840
                          MDX     ATH17     CONTINUE                    K1206845
                    *                                                   K1206850
                    ATH19 LDX  I3 IDSV2     IS THIS THE             2-5 K1206852
                          MDX   3 1         NAME OF THE             2-5 K1206853
                          STX   3 *+1       STATEMENT               2-5 K1206854
                          LD   L  *-*       FUNCTION JUST           2-5 K1206856
                          S       SNAME     BEING LOOKED AT         2-5 K1206857
                          BSC  L  ATERR,+-  YES - ERROR 42          2-5 K1206858
                    *                                                   K1206859
                    *             XR2 +2 LESS THAN XR1                  K1206860
                    *                                                   K1206870
                    ATH17 STX   2 ATEMP     INDEX REG 2 TEMPORARY       K1206880
                          LD      ATEMP     XR2 CONTENTS-OUTPUT STRING  K1206890
                          A       ATWO      INCR BY 2                   K1206900
                          STX   1 ATEMP     INDEX REG 1 TEMPORARY       K1206910
                          S       ATEMP     ADDR OF INPUT STRING        K1206920
                          BSC  L  CK1,-     BR IF OVERLAP ERROR         K1206930
                    *                                                   K1206940
                    *             OPEN STRING 2 WORDS                   K1206950
                    *                                                   K1206960
                          LD      ATH14+1   NEXT STMNT ID WORD ADDRESS  K1206970
                          S       ATEMP     CURRENT STMNT ADDRESS       K1206980
                          STO     *+1       ADDR NEXT INSTRUCTION       K1206990
                          LDX  L3 *-*       RANGE - NO. WDS TO MOVE     K1207000
                          MDX   1 -2        DECR CURRENT STMNT ADDRESS  K1207010
                          STX   1 *+6       NEW CURRENT STMNT ADDRESS   K1207020
                          LD    1 2         NEXT WORD TO MOVE           K1207030
                          STO   1 0         OPEN STRING 2 WORDS         K1207040
                          MDX   1 1         INCR STMNT MOVE POINTER     K1207050
                          MDX   3 -1        DECR NO. OF WORDS TO MOVE   K1207060
                          MDX     *-5       BR TO CONTINUE MOVE         K1207070
                          LDX  L1 *-*       SET UP NEW STMNT POINTER    K1207080
                    *                                                   K1207090
                    *                  PUT PAR,PARNO AND ASFN IN THE    K1207100
                    *                  NESTED CALL TABLE                K1207110
                    *                                                   K1207120
                          LDX  I3 ATH14+1   ADDR OF NEXT STMNT ID WORD  K1207130
                          MDX   3 -2        DECR BY 2                   K1207140
                          STX   3 ATH14+1   ADDR NESTED CALL TABLE      K1207150
                          LD      ASFN      ARITH STMNT FUNC NAME       K1207160
                          STO   3 0         CALL TABLE                  K1207170
                          LD      PAR       PARENTHESIS COUNT           K1207180
                          SLA     8                                     K1207190
                          OR      PARNO                                 K1207200
                          STO   3 1                                     K1207210
                          LD      SNAME                                 K1207220
                          STO     ASFN                                  K1207230
                          LDX   3 1                                     K1207240
                          STX   3 PAR                                   K1207250
                          STX   3 PARNO                                 K1207260
                          BSC  L  ATH12                                 K1207270
                    *                                                   K1207280
                    *             CONSTANTS AND WORK AREA               K1207290
                    *                                                   K1207300
                    APSGN DC      /04       +                           K1207310
                    AMSGN DC      /06-/04   --+                         K1207320
                    UMNS  DC      /20       U- OPERATOR                 K1207330
                    SNAME DC      0         LAST NAME                   K1207340
                    ASLH  DC      /08-/06   /--                         K1207350
                    ASTER DC      /0C-/08   *-/                         K1207360
                    ASK   DC      /0C       *                           K1207370
                    AEXP  DC      /0A       ** OPERATOR                 K1207380
                    ACALL DC      /2E       C OPERATOR                  K1207390
                    ATEMP DC      0         INDEX REGISTERS TEMPORARY   K1207400
                    ACOMA DC      /12       ,                           K1207410
                    ARPC  DC      /02-/12   )-,                         K1207420
                    SBE7F DC      /BA6E     LEGAL SUBPROGRAM ID MASK    K1207430
                    ATWO  DC      2         DECIMAL TWO CONSTANT        K1207440
                    S0080 DC      /0080     SUBPROGRAM NAME INDR BIT    K1207450
                    CMSGN EQU     ATWO      , - (                  2-10 K1207451
                    *                                                   K1207460
                    *            TEST SWITCH 5                          K1207470
                    *                                                   K1207480
                    ATH5  LD      SW5                                   K1207490
                          BSC  L  ATERR,+-                              K1207500
                          LD    1 -2        CHECK IF PRECEDING WD  2-10 K1207501
                          S       ARPEN     *WAS LEFT PAR OR COMMA 2-10 K1207502
                          BSC  L  ATH10,+-  IF YES GO ON TESTING ON2-10 K1207503
                          S       CMSGN     *SUCCEDING,IF NO GO TO 2-10 K1207504
                          BSC  L  ATERR,Z   *ERROR                 2-10 K1207505
                    *                                                   K1207510
                    *             CHK FOR COMMA (1                      K1207520
                    *                                                   K1207530
                    ATH10 LD    1 0                                     K1207540
                          S       ACOMA                                 K1207550
                          BSC  L  ATH13,Z                               K1207560
                    *                                                   K1207570
                    *             TEST SWITCH 5                         K1207580
                    *                                                   K1207590
                          LD      SW5       BR NO POINTER INSIDE        K1207600
                          BSC  L  ATH8,+-   FUNCTION CALL.              K1207610
                          MDX  L  PARNO,1   INCR PARAMETER COUNT BY 1   K1207620
                          BSC  L  ATH12     BR TO MOVE 1 ELEMENT        K1207630
                    *                                                   K1207640
                    *             CHECK FOR RIGHT PARENTHESIS (1        K1207650
                    *                                                   K1207660
                    ATH13 S       ARPC      RIGHT PARENTHESIS CONSTANT  K1207670
                          BSC  L  ATERR,Z   BR IF NOT RIGHT PARENTHESIS K1207680
                          LD      PAR       PARENTHESIS COUNT           K1207690
                          BSC  L  ATH8,+-   BR IF ZERO                  K1207700
                          MDX  L  PAR,-1    DECR PAR BY 1 IF NOT ZERO   K1207710
                          MDX     ATH16     BR IF PAR IS NOW ZERO       K1207720
                          LD      SW5       BR IF NO POINTER INSIDE     K1207730
                          BSC  L  ATH16,+-  FUNCTION CALL.              K1207740
                          BSI     CKASF     BR TO CHK ARITH STMNT FUNC  K1207750
                          MDX  L  CALLN,-1  CALLN = CALLN -1            K1207760
                          MDX     ATH14     BR IF CALLN IS NOW ZERO     K1207770
                          SLA     16        CLEAR ACCUMULATOR           K1207780
                          STO  L  SW5       NORMALIZE SW5          2-10 K1207790
                    *                                                   K1207800
                    *             GET PAR, PARNO, AND ASFN FROM THE     K1207810
                    *             NESTED CALL TABLE.                    K1207820
                    *                                                   K1207830
                    ATH14 LDX  L3 *-*       ADDR OF NESTED CALL TABLE   K1207840
                          LD    3 0         FIRST TABLE ELEMENT         K1207850
                          STO  L  ASFN      ARITH STMNT FUNC NAME  2-10 K1207860
                          LD    3 1         SECOND TABLE ELEMENT        K1207870
                          SRT     8         RIGHT JUSTIFY PAR           K1207880
                          STO  L  PAR       PARENTHESIS COUNT           K1207890
                          SLA     16        CLEAR ACCUMULATOR           K1207900
                          SLT     8         SHIFT IN 8 FROM EXTENSION   K1207910
                          STO  L  PARNO     PARAMETER COUNT             K1207920
                    *                                                   K1207930
                    *             CLOSE STRING 2 WORDS                  K1207940
                    *                                                   K1207950
                          STX   1 ATEMP     INDEX REG 1 TEMPORARY       K1207960
                          LD      ATH14+1   ADDR OF NESTED CALL TABLE   K1207970
                          S       ATEMP     CURRENT STMNT POINTER       K1207980
                          STO     *+1       ADDR OF NEXT INSTRUCTION    K1207990
                          LDX  L3 *-*       RANGE OF MOVE TO CLOSE      K1208000
                          MDX   1 2         INCR CURRENT POINTER BY 2   K1208010
                          MDX  L  ATH14+1,2 INCR ADDR NESTED CALL TABLE K1208020
                          STX   1 ATH18+1   NEW STMNT POINTER           K1208030
                          LDX  I1 ATH14+1   XR1 EQUALS MOVE ADDRESS     K1208040
                          LD    1 -3        MOVE TO CLOSE               K1208050
                          STO   1 -1        STRING TWO WORDS            K1208060
                          MDX   1 -1        DECR MOVE ADDR              K1208070
                          MDX   3 -1        DECR MOVE COUNTER           K1208080
                          MDX     *-5       BR TO CONTINUE MOVE         K1208090
                    ATH18 LDX  L1 *-*       NEW STMNT POINTER           K1208100
                    ATH16 BSI  L  MOVE1     BR TO MOVE 1 ELEMENT        K1208110
                          BSC  L  ATH6      BR TO CHK FOR SEMICOLON     K1208120
                    *                                                   K1208130
                    *************************************************** K1208140
                    *             THIS ROUTINE CHECKS THE ASF TABLE TO* K1208150
                    *             INSURE THAT CALLS TO ASF STATEMENTS * K1208160
                    *             HAVE THE CORRECT NO OF PARAMETERS.  * K1208170
                    *             THE ENTRY IS A BSI INSTRUCTION TO   * K1208180
                    *             THE LABEL CKASF. THE ROUTINE RETURNS* K1208190
                    *             ONLY IF THE MATCH IS CORRECT.       * K1208200
                    *************************************************** K1208210
                    *                                                   K1208220
                    CKASF DC      0         SUBR ENTRY POINT            K1208230
                    CKAS  LDX  L3 1         INITIALIZE INDEX REG 3      K1208240
                    CKS1  MDX   3 -2        SKIP NEXT IF XR3 NEG OR 0   K1208250
                          MDX     *+2       BRANCH IF XR3 POSITIVE      K1208260
                    CKS1A BSC  I  CKASF     EXIT FROM CKASF             K1208270
                    CKS2  LD   L3 *-*       PRESTORED ASF TABLE ADDR    K1208280
                          S    L  ASFN      COMPARE NAMES               K1208290
                          BSC  L  CKS1,Z    BR IF NOT SAME NAME         K1208300
                    CKS3  LD   L3 *-*       PRESTORED ASR TABLE ADDR    K1208310
                          S    L  PARNO     COMPARE PARAMETER COUNTS    K1208320
                          BSC  L  ATERR,Z   BR TO ERROR IF NOT EQUAL    K1208330
                          MDX     CKS1A     BR TO EXIT IF MATCH         K1208340
                    *                                                   K1208350
                    *             CHECK FOR VALID VARIABLE IN           K1208360
                    *             ARITHMETIC EXPRESSION                 K1208370
                    *                                                   K1208380
                    TESTV DC      0         ENTRY POINT                 K1208390
                          LD   L  SORF      SUBPROGRAM OR FUNC INDR     K1208400
                          BSC  L  TESTW,+   BR IF NOT FUNCTION          K1208410
                          LD    1 0         NEXT STMNT WORD             K1208420
                          S    L  FNAME     FUNCTION NAME               K1208430
                          BSC  I  TESTV,+-  EXIT IF NAME COMPARE        K1208440
                          LD      SA7DE     LEGAL FUNCTION ID MASK      K1208450
                          MDX     TESTX     BR TO MASK SYMBOL TBL ID WD K1208460
                    TESTW LD      S83DE     LEGAL SUBROUTINE ID MASK    K1208470
                    TESTX AND   3 0         MASK SYMBOL TABLE ID WORD   K1208480
                          BSC  L  XY7,Z     BR TO ERROR IF ANY BITS ON  K1208490
                          BSC  I  TESTV     EXIT IF LEGAL SUBR OR FUNC  K1208500
                    *                                                   K1208510
                    S83DE DC      /83DE     SUBROUTINE ID MASK          K1208520
                    SA7DE DC      /A7DE     FUNCTION ID MASK            K1208530
                    *                                                   K1208540
                    *             CHECK CALL STMNT SYNTAX               K1208550
                    *                                                   K1208560
                    XY25  S       CCALL     CALL ID CONSTANT            K1208570
                          BSC  L  XY28,Z    BR IF NOT CALL              K1208580
                          LDX   3 39        SET XR3 =39                 K1208590
                          STX  L3 ERNO      SET UP ERROR NUMBER 39      K1208600
                          LD    1 0         IS IT A CALL            2-5 K1208602
                          S    L  FNAME     TO THIS SUBPROGRAM      2-5 K1208604
                          BSC  L  ATERR,+-  YES - ERROR 39          2-5 K1208606
                          LD    1 0         NEXT STMNT WORD             K1208610
                          BSI  L  GETID     GET SYMBOL                  K1208620
                          AND     SUB1X     LEGAL SUBPROGRAM MASK       K1208630
                          BSC  L  ATERR,Z   BR TO ERROR IF NOT LEGAL    K1208640
                          LD    3 0         SYMBOL TABLE ID WORD        K1208650
                          OR      SUBPO     SET SUBPROG INDR BIT ON     K1208660
                          STO   3 0         RESTORE SYMBOL TABLE ID WD  K1208670
                          BSI  L  NAME      CALL NAME                   K1208680
                          LD   L  SW7       DIMENSIONED NAME SWITCH     K1208690
                          BSC  L  ATERR,+-  BR IF NOT DIMENSIONED NAME  K1208700
                          LD      RCOP      C OPERATOR                  K1208710
                          BSI  L  CHECK     CHECK FOR OVERLAP           K1208720
                    *                                                   K1208730
                    *             CH FOR LEFT PARENTHESIS (1            K1208740
                    *                                                   K1208750
                          LD    1 0         NEXT STMNT WORD             K1208760
                          S       LPAR      LEFT PARENTHESIS CONSTANT   K1208770
                          BSC  L  XY29,Z    BR IF NOT LEFT PARENTHESIS  K1208780
                    XY30  BSI  L  MOVE1     BR TO MOVE ONE ELEMENT      K1208790
                    *                                                   K1208800
                    *             CHECK FOR SUBSCRIPTED ELEMENT         K1208810
                    *                                                   K1208820
                          STX   1 XY30B+1   SAVE XR1                    K1208830
                          LD    1 1         NEXT STMNT WORD             K1208840
                          S       LX1       SUBSC CHARACTER LOW LIMIT   K1208850
                          BSC  L  XY30A,+Z  BR IF NOT SUBSCRIPT CHAR    K1208860
                          S       LX2       SUBSC CHARACTER HIGH LIMIT  K1208870
                          BSC  L  XY30A,-Z  BR IF NOT SUBSCRIPT CHAR    K1208880
                          A       LX3       RESTORE SUBSCRIPT VALUE     K1208890
                          SLA     1         MPY BY 2                    K1208900
                          STO     *+1       ADDR NEXT INSTRUCTION       K1208910
                          MDX  L1 *-*       INCR TO SKIP OVER SUBSC     K1208920
                          MDX   1 1         AJUST BY ONE MORE           K1208930
                    *                                                   K1208940
                    *             CHK FOR COMMA OR RT PARENTHESIS       K1208950
                    *                                                   K1208960
                    XY30A LD    1 1         NEXT CHAR BEYOND SUBSCRIPT  K1208970
                    XY30B LDX  L1 *-*       RESTORE STMNT POINTER       K1208980
                          S       LX4       COMMA CHARACTER CONSTANT    K1208990
                          BSC  L  XY30C,+-  BR IF COMMA                 K1209000
                          S       LX5       RIGHT PARENTHESIS CONSTANT  K1209010
                          BSC  L  XY30D,Z   BR IF NOT RIGHT PARENTHESIS K1209020
                    XY30C LDX   3 39        INDEX REG 3 =39             K1209030
                          STX  L3 ERNO      SET UP ERROR NUMBER 39      K1209040
                    *                                                   K1209050
                    *             CHECK FOR LEGAL VARIABLE              K1209060
                    *                                                   K1209070
                          LD    1 0         NEXT STMNT WORD             K1209080
                          BSI  L  GETID     GET SYMBOL TABLE ID WORD    K1209090
                          AND     LX6       LEGAL VARIABLE ID MASK      K1209100
                          BSC  L  XY30D,Z   BR IF NOT LEGAL VARIABLE    K1209110
                    *                                                   K1209120
                    *             CHECK FOR SUBPROGRAM NAME             K1209130
                    *                                                   K1209140
                          LD    3 0         SYMBOL TABLE ID WORD        K1209150
                          SLA     8         SUBPROGRAM NAME BIT TO SIGN K1209160
                          BSC  L  XY30G,+Z  BR IF SUBPROGRAM NAME       K1209170
                          LD    3 0         SYMBOL TABLE ID WORD        K1209180
                          OR      LX7       REFERENCED INDICATOR BIT ON K1209190
                          STO   3 0         RESTORE SYMBOL TABLE ID WD  K1209200
                    *                                                   K1209210
                    *             CALL NAME                             K1209220
                    *                                                   K1209230
                    XY30F BSI  L  NAME      BR TO CHK NAME DIMENSIONING K1209240
                          MDX     XY30E     BR TO CHK FOR COMMA         K1209250
                    *                                                   K1209260
                    *             SET UP ERROR NUMBER 40                K1209270
                    *                                                   K1209280
                    XY30D LDX   3 40        INDEX REG 3 =40             K1209290
                          STX  L3 ERNO      SET UP ERROR NUMBER 40      K1209300
                    *                                                   K1209310
                    *             CALL ARITH EXPRESSION SCAN            K1209320
                    *                                                   K1209330
                          BSI  L  ARITH     BR TO ARITH SCAN SUBROUTINE K1209340
                    *                                                   K1209350
                    *             CHECK FOR COMMA (1                    K1209360
                    *                                                   K1209370
                    XY30E LD    1 0         NEXT STMNT WORD             K1209380
                          S       CMAS      COMMA CHAR CONSTANT         K1209390
                          BSC  L  XY30,+-   BR IF COMMA FOUND           K1209400
                          S       RPAR      RIGHT PARENTHESIS (1        K1209410
                          BSC  L  XY7,Z     BR IF NOT RT PARENTHESIS    K1209420
                          BSI  L  MOVE1     BR TO MOVE ONE ELEMENT      K1209430
                    XY31  BSC  L  XY13      BR TO CHECK FOR SEMICOLON   K1209440
                    XY29  LD    1 0         NEXT STMNT WORD             K1209450
                          BSC  L  XY7,Z     BR TO ERR IF NOT SEMICOLON  K1209460
                          LD      RFAC      FLOATING ACC INDICATOR      K1209470
                          BSI  L  CHECK     OUTPUT AND CHK FOR OVERLAP  K1209480
                          MDX     XY31      BR TO CHK FOR SEMICOLON     K1209490
                    *                                                   K1209500
                    XY30G SLA     3         TEST IF EXTERNAL            K1209510
                          BSC     +Z        SKIP IF NOT             2-5 K1209520
                          MDX     XY30F     CONTINUE                    K1209530
                    *                                                   K1209531
                          LD   L  SORF      IS IT FUNCTION SUBPROGR 2-5 K1209532
                          BSC  L  ATERR,+   ERROR IF NOT            2-5 K1209533
                          LD    1 0         LOAD STATEMENT WORD     2-5 K1209534
                          S    L  FNAME     IS IT FUNCTION NAME     2-5 K1209535
                          BSC  L  ATERR,Z   ERROR IF NOT            2-5 K1209536
                          LD    3 0         SET THE REFERENCED      2-5 K1209537
                          OR      LX7       *INDICATOR BIT IN THE   2-5 K1209538
                          STO   3 0         *SYMBOL TABLE ID WORD   2-5 K1209539
                          MDX     XY30F     CONTINUE                2-5 K1209540
                    *                                                   K1209541
                    *             CONSTANTS AND WORK AREA               K1209550
                    *                                                   K1209560
                    LX1   DC      /18       SUBSC CHAR LOW LIMIT CON    K1209570
                    LX2   DC      /1E-/18   SUBSC CHAR HIGH LIMIT CON   K1209580
                    LX3   DC      7         RESTORE SUBSC VALUE CON     K1209590
                    LX4   DC      /12       COMMA CHAR CONSTANT         K1209600
                    LX5   DC      /02-/12   RIGHT PARENTHESIS CONSTANT  K1209610
                    LX6   DC      /834E     LEGAL VARIABLE MASK         K1209620
                    LX7   DC      /0020     REFERENCED STMNT NO. INDR   K1209630
                    LX8   DC      /BEFE     LEGAL ASF MASK          2-7 K1209640
                    LX9   DC      /0100     ARITH STMNT FUNC INDR BIT   K1209650
                    CCALL DC      /06-/0F   CALL ID                     K1209660
                    LPAR  DC      /10       LEFT PARENTHESIS CONSTANT   K1209670
                    CMAS  DC      /12       COMMA CHAR CONSTANT         K1209680
                    RCOP  DC      /2E       CALL OPERATOR               K1209690
                    RPAR  DC      /02-/12   RIGHT PARENTHESIS CONSTANT  K1209700
                    RFAC  DC      /8000     FLOATING ACC INDR CONSTANT  K1209710
                    ASFID DC      /1A-/06   ASF ID                      K1209720
                    RASF  DC      /2C       ASF OPERATOR                K1209730
                    SUBPO DC      /0080     SUBPROGRAM INDR BIT         K1209740
                    SUB1X DC      /BB6E     LEGAL SUBPROGRAM MASK       K1209750
                    *                                                   K1209760
                    *             CHK FOR ARITH STMNT FUNCTION          K1209770
                    *                                                   K1209780
                    XY28  S       ASFID     ARITH STMNT FUNC ID         K1209790
                          BSC  L  XY26,Z    BR IF NOT ARITH STMNT FUNC  K1209800
                          LDX   3 41        INDEX REG 3 =41             K1209810
                          STX  L3 ERNO      SET UP ERROR NUMBER 43      K1209820
                    *                                                   K1209830
                    *             CHK FOR VALID ARITH STMNT FUNC NAME   K1209840
                    *                                                   K1209850
                          LD    1 0         NEXT STMNT WORD             K1209860
                          BSI  L  GETID     GET SYMBOL TABLE ID WORD    K1209870
                          AND     LX8       VALID ASF NAME MASK         K1209880
                          BSC  L  XY7,Z     BR IF NOT VALID TO SET ERR  K1209890
                          LD    3 0         SYMBOL TABLE ID WORD        K1209900
                          OR      LX9       SET STMNT FUNC NAME BIT ON  K1209910
                          STO   3 0         RESTORE SYMBOL TABLE ID WD  K1209920
                          BSI  L  MOVE1     BR TO MOVE ON ELEMENT       K1209930
                    *                                                   K1209940
                    *             OPEN STRING 2 WDS IF REQUIRED         K1209950
                    *                                                   K1209960
                          MDX   2 2         INCR OUTPUT STRING ADDRESS  K1209970
                          STX   2 XQ1       INDEX REG 2 TO TEMPORARY    K1209980
                          LD      XQ1       OUTPUT STRING ADDRESS       K1209990
                          STX   1 XQ2       INDEX REG 1 TO TEMPORARY    K1210000
                          S       XQ2       INPUT STRING ADDRESS        K1210010
                          BSC  L  CK1,-     BR IF OVERLAP ERROR         K1210020
                          LD      XQ1       CURRENT OUTPUT STRING PT    K1210030
                          S    L  SOFS      START OF STRING ADDRESS     K1210040
                          STO     *+1       ADDR NEXT INSTRUCTION       K1210050
                          LDX  L3 *-*       RANGE OF MOVE TO OPEN       K1210060
                          MDX   3 -2        NO. OF WORDS TO MOVE        K1210070
                          LD    2 -3        NEXT WORD TO MOVE TO OPEN   K1210080
                          STO   2 -1        OPEN STRING 2 WORDS         K1210090
                          MDX   2 -1        DECR MOVE ADDRESS           K1210100
                          MDX   3 -1        DECR MOVE WORD COUNT        K1210110
                          MDX     *-5       BR TO CONTINUE MOVE         K1210120
                          LDX  I2 SOFS      NEW START OF STRING ADDRESS K1210130
                          MDX  L  IDSV2,2   INCR STMNT WORD COUNT BY 2  K1210140
                    *                                                   K1210150
                    *             PUT NAME AND ZERO IN ARITH STMNT      K1210160
                    *             FUNCTION TABLE.                       K1210170
                    *                                                   K1210180
                          LD    1 -1        ASF NAME                    K1210190
                          STO   2 0         ASF FUNCTION TABLE          K1210200
                          SLA     16        CLEAR ACCUMULATOR           K1210210
                          STO   2 1         STORE ZERO IN ASF TABLE     K1210220
                          MDX  L  CKAS+1,2  INCR ASF TABLE POINTER BY 2 K1210230
                          LDX  L2 *-*       RESTORE OUTPUT STRING PT    K1210240
                    XQ1   EQU     *-1       ADDR FOR LAST INSTRUCTION   K1210250
                          LDX  L1 *-*       RESTORE INPUT STRING PT     K1210260
                    XQ2   EQU     *-1       ADDR FOR LAST INSTRUCTION   K1210270
                    *                                                   K1210280
                    *             CALL CHECK (ASF OPERATOR)             K1210290
                          LD      RASF      ASF OPERATOR                K1210300
                          BSI  L  CHECK     OUTPUT AND CHK FOR OVERLAP  K1210310
                          LD    1 0         NEXT STMNT WORD             K1210320
                          S       LPAR      LEFT PARENTHESIS CONSTANT   K1210330
                          BSC  L  XY7,Z     BR IF NOT LEFT PARENTHESIS  K1210340
                    XY32  BSI  L  MOVE1     BR TO OUPUT ONE ELEMENT     K1210350
                    *                                                   K1210360
                    *             CHK FOR VALID DUMMY ARGUMENT          K1210370
                    *                                                   K1210380
                          LD    1 0         NEXT STMNT WORD             K1210390
                          BSI  L  GETID     BR TO GET SYMBOL TABLE ID W K1210400
                          BSC  L  XY7,+Z    BR TO ERROR IF MINUS        K1210410
                          BSI  L  MOVE1     BR TO OUTPUT ONE ELEMENT    K1210420
                    XY33  MDX  L  *-*,1     COUNT ASF ARGUMENTS         K1210430
                          LD    1 0         NEXT STMNT WORD             K1210440
                          S       CMAS      COMMA CHAR CONSTANT         K1210450
                          BSC  L  XY32,+-   BR IF COMMA FOUND           K1210460
                          S       RPAR      RIGHT PARENTHESIS CONSTANT  K1210470
                          BSC  L  XY7,Z     BR TO ERR IF NOT RT PAREN   K1210480
                          BSI  L  MOVE1     BR TO OUTPUT ONE ELEMENT    K1210490
                          LD    1 0         NEXT STMNT WORD             K1210500
                          S    L  EQSGN     EQUAL SIGN CHAR CONSTANT    K1210510
                          BSC  L  XY7,Z     BR TO ERR IF NO EQUAL SIGN  K1210520
                          LDX   3 42        INDEX REG 3 =42             K1210530
                          STX  L3 ERNO      SET UP ERROR NUMBER 42      K1210540
                          BSC  L  XY5A      BR TO CHK FOR EQUAL SIGN    K1210550
                    *                                                   K1210560
                    *             CONSTANTS FOR DISK READ/WRITE SCAN    K1210570
                    *                                                   K1210580
                    REDID DC      /12-/1A   READ ID                     K1210590
                    WRTID DC      /11-/12   WRITE ID                    K1210600
                    FNDID DC      /1D-/11   FIND ID                     K1210610
                    APOST DC      /42-/02   APOSTRAPHE                  K1210620
                    RPARN DC      /02       RIGHT PARENTHESIS           K1210630
                    COLON DC      /32       COLON OPERATOR              K1210640
                    *                                                   K1210650
                    *             SEEK READ/WRITE OPERATOR              K1210660
                    *                                                   K1210670
                    XY26  S       REDID     READ ID CONSTANT            K1210680
                          BSC     Z         SKIP IF READ                K1210690
                          S       WRTID     WRITE ID CONSTANT           K1210700
                          BSC     Z         SKIP IF FIND                K1210710
                          S       FNDID     FIND ID CONSTANT            K1210720
                          BSC  L  XY27,Z    BRANCH UNLESS READ OR WRITE K1210730
                    *                                                   K1210740
                    *             TEST FOR SIDK READ/WRITE              K1210750
                    *                                                   K1210760
                          LDX   3 73        ERROR NUMBER                K1210770
                          STX  L3 ERNO      SET ERROR NO JUST IN CASE   K1210780
                    MOVCH BSI  L  MOVE1     MOVE ONE CHAR               K1210790
                          LD    1 -1        GET CHARACTER JUST MOVED    K1210800
                    *                                                   K1210810
                    *             CHECK FOR APOSTROPHE                  K1210820
                    *                                                   K1210830
                          BSC  L  XY22,+-   BRANCH IF SEMICOLON         K1210840
                          S       RPARN     TEST FOR RIGHT PAREN        K1210850
                          BSC  L  MVRST,+-  BRANCH IF NOT DISK R/W      K1210860
                          S       APOST     APOSTROPHE CHAR CONSTANT    K1210870
                          BSC     Z         SKIP ON APOSTRAPHE          K1210880
                          MDX     MOVCH     BR TO MOVE ONE CHARACTER    K1210890
                    *                                                   K1210900
                    *             GO SCAN FOR SECTOR ADDR               K1210910
                    *                                                   K1210920
                          BSI  L  ARITH     GO TO SCAN ARITH EXPRESSION K1210930
                          LD    1 0         REQUIRE RIGHT PAREN         K1210940
                          S       RPARN     AS TERMINATOR               K1210950
                          BSC  L  XY7,Z     BRANCH TO ERROR IF NOT      K1210960
                    *                                                   K1210970
                    *             PUT COLON OVER THE RIGHT PARENTHESIS  K1210980
                    *                                                   K1210990
                          LD      COLON     COLON OPERATOR              K1211000
                          STO   1 0         PUT OVER RIGHT PARENTHESIS  K1211010
                    *                                                   K1211020
                    *             MOVE REST OF STMNT                    K1211030
                    *                                                   K1211040
                    MVRST BSI  L  MOVE1     MOVE REST OF STATEMENT      K1211050
                          LD    1 -1        STOP WHEN SEMICOLON         K1211060
                          BSC  L  MVRST,Z   FOUND.                      K1211070
                          BSC  L  CRCTN     GO CORRECT NORM             K1211080
                    *                                                   K1211090
                    *             MOVE STATEMENT                        K1211100
                    *                                                   K1211110
                    XY27  LDX  L3 *-*       RANGE OF STMNT MOVE         K1211120
                          MDX   3 -1        NO. OF WORDS TO MOVE        K1211130
                          MDX     *+1       BR IF RANGE NOT ZERO        K1211140
                          MDX     XY27A     BR TO GO NEXT STMNT         K1211150
                          BSI  L  MOVE1     GO TO MOVE ONE ELEMENT      K1211160
                          MDX   3 -1        DECR MOVE COUNTER           K1211170
                          MDX     XY27+3    BR TO MOVE NEXT WORD        K1211180
                    XY27A BSC  L  XY22                                  K1211190
                    *                                                   K1211200
                    *             END OF ASCAN PHASE                    K1211210
                    *             NO PATCH AREA LEFT IN THIS PHASE 2-10 K1211215
                          END     BPHAR-2                               K1211225
