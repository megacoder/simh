                          HDNG    1130 FORTRAN COMPILER PHASE 9         K0900010
                    *************************************************** K0900020
                    *                                                 * K0900030
                    *STATUS - VERSION 2 MODIFICATION 7                * K0900040
                    *                                                 * K0900050
                    *FUNCTION/OPERATION-                              * K0900060
                    *   * EXAMINES ONLY DATA STATEMENTS, BYPASSING ALL* K0900070
                    *     OTHER STATEMENTS.                           * K0900080
                    *   * CHECKS EACH VARIABLE FOR VALIDITY           * K0900090
                    *   * CHECKS TO SEE THAT EACH VARIABLE NAME HAS   * K0900100
                    *     BEEN ENTERED INTO THE SYMBOL TABLE.         * K0900110
                    *   * CHECKS TO ENSURE THAT DIMENSIONING INDICATED* K0900120
                    *     IN THE DATA STATEMENT DOES NOT EXCEED THE   * K0900130
                    *     DIMENSIONS INDICATED BY THE SYMBOL TBL ENTRY* K0900140
                    *   * CHECKS EACH DATA STMNT FOR CORRECT SYNTAX   * K0900150
                    *   * REFORMATS THE DATA STMNT INTO A STRING OF   * K0900160
                    *     DATA GROUPS.                                * K0900170
                    *                                                 * K0900180
                    *ENTRY POINTS-                                    * K0900190
                    *   * BEGIN-PHASE 9 IS READ INTO CORE BY THE ROL  * K0900200
                    *     PROGRAM AND EXECUTION BEGINS AT THIS ADDRESS* K0900210
                    *                                                 * K0900220
                    *INPUT-                                           * K0900230
                    *   * THE STATEMENT STRING                        * K0900240
                    *   * THE SYMBOL TABLE                            * K0900250
                    *   * DCOM                                        * K0900260
                    *                                                 * K0900270
                    *OUTPUT-                                          * K0900280
                    *   * THE UPDATED STATEMENT STRING                * K0900290
                    *   * THE UPDATED SYMBOL TABLE                    * K0900300
                    *   * DCOM                                        * K0900310
                    *                                                 * K0900320
                    *EXTERNAL REFERENCES-                             * K0900330
                    *   SUBROUTINES-                                  * K0900340
                    *      * ROL                                      * K0900350
                    *   COMMA/DCOM-                                   * K0900360
                    *      * $PHSE                                    * K0900370
                    *                                                 * K0900380
                    *EXITS-                                           * K0900390
                    *   NORMAL-                                       * K0900400
                    *      * EXITS VIA A CALL TO THE ROL SUBROUTINE TO* K0900410
                    *        READ IN THE NEXT PHASE.                  * K0900420
                    *                                                 * K0900430
                    *   ERROR-                                        * K0900440
                    *      * OVERLAP-DOES NO PROCESSING AND EXITS     * K0900450
                    *        NORMALLY                                 * K0900460
                    *      * ERRORS DETECTED BY THIS PHASE ARE        * K0900470
                    *        75, 76, 77, 78, 79, 80, AND 82.          * K0900480
                    *                                                 * K0900490
                    *TABLES/WORK AREAS-N/A                            * K0900500
                    *                                                 * K0900510
                    *ATTRIBUTES-NONE                                  * K0900520
                    *                                                 * K0900530
                    *NOTES-N/A                                        * K0900540
                    *                                                 * K0900550
                    *************************************************** K0900560
                          HDNG    1130 FORTRAN COMPILER PHASE 9         K0900570
                    *                                                   K0900580
                          ABS                                           K0900590
                    *                                                   K0900600
                    *             /8000     SYSTEM EQUATES              K0900610
                    MEMRY EQU     /8000     CORE SIZE                   K0900620
                    OVERL EQU     MEMRY-1501  PHASE OVERLAY AREA SIZE   K0900630
                    ROL   EQU     MEMRY-68                              K0900640
                    $PHSE EQU     /78                                   K0900650
                          ORG     OVERL                                 K0900660
                    PHID  EQU     39                                    K0900670
                    *                                                   K0900680
                    *                  FORTRAN COMMUNICATION AREA       K0900690
                    *                                                   K0900700
                    ORG   BSS     1    ORIGIN ADDRESS               2-4 K0900705
                    SOFS  BSS     1    START OF STRING                  K0900710
                    EOFS  BSS     1    END OF STRING                    K0900720
                    SOFST BSS     1    START OF SYMBOL TABLE            K0900730
                    SOFNS BSS     1    START OF NON-STATEMENT NUMBERS   K0900740
                    SOFXT BSS     1    START OF SUBSCRIPT TEMPORARIES   K0900750
                    SOFGT BSS     1    START OF GENERATED TEMPORARIES   K0900760
                    EOFST BSS     1    END OF SYMBOL TABLE              K0900770
                    COMON BSS     1    NEXT AVAILABLE COMMON            K0900780
                    CSIZE BSS     1    SIZE OF COMMON                   K0900790
                    ERROR BSS     1    OVERLAP ERROR                    K0900800
                    FNAME BSS     1    PROGRAM NAME                     K0900810
                          BSS     1    *                                K0900820
                    SORF  BSS     1    SUBROUTINE(-) OR FUNCTION(+)     K0900830
                    CCWD  BSS     1    CONTROL CARD WORD                K0900840
                    *                BIT 15 TRANSFER TRACE              K0900850
                    *                BIT 14 ARITHMETIC TRACE            K0900860
                    *                BIT 13 EXTENDED PRECISION          K0900870
                    *                BIT 12 LIST SYMBOL TABLE           K0900880
                    *                BIT 11 LIST SUBPROGRAM NAMES       K0900890
                    *                BIT 10 LIST SOURCE PROGRAM         K0900900
                    *                BIT  9 ONE WORD INTEGERS           K0900910
                    *                BIT  8 ORIGIN                      K0900920
                    IOCS  BSS     1    IOCS CONTROL CARD WORD           K0900940
                    *                BIT 15 CARD                        K0900950
                    *                BIT 14 PAPER TAPE                  K0900960
                    *                BIT 13 TYPEWRITER                  K0900970
                    *                BIT 12 1443 PRINTER                K0900980
                    *                BIT 11 MAGNETIC TAPE               K0900990
                    *                BIT 10 KEYBOARD                    K0901000
                    *                BIT  8 DISK                        K0901010
                    *                BIT  3 PLOTTER                     K0901020
                    *                BIT  1 UNFORMATTED DISK            K0901030
                    DFCNT BSS     1                                     K0901040
                    *                                                   K0901050
                    *                                                   K0901060
                    *                                                   K0901070
                    *                  END OF FORTRAN COMMUNICATION     K0901080
                    *                  AREA                             K0901090
                    *                                                   K0901100
                    BPHAR EQU     *+2       BEGINNING ADDR OF PHASE     K0901110
                          DC      0         LOADER WORK AREA            K0901120
                          DC      -39       -PHASE ID FOR SLET LOOKUP   K0901130
                          DC      NXTPH-*+1 TABLE FOR NEXT PHASE ENTRY  K0901140
                          DC      1         ONE ENTRY TO BE SET BY LDR  K0901150
                          ORG     *-2                                   K0901160
                    *                                                   K0901170
                    * THIS PHASE PROCESSES THE DATA STATEMENT. INPUT IS K0901180
                    *                                                   K0901190
                    *     ST-ID NAME1,...,NAMEN/CON1,...CONN/           K0901200
                    * WHERE NAMES HAVE NOT YET BEEN LOOKED UP IN THE    K0901210
                    * SYMBOL LIST, REAL CONSTANTS ARE ALREADY CONVERTED K0901220
                    * EXCEPT FOR SIGN, AND INTEGERS ARE NOT YET         K0901230
                    * CONVERTED. OUTPUT IS OF THE FORM                  K0901240
                    *                                                   K0901250
                    *     ST-ID DATAGROUP HDR CON1 NAME1 DATAGROUP HDR  K0901260
                    *     CON2 NAME2...DATAGROUP HDR CONN NAMEN         K0901270
                    *                                                   K0901280
                    * WHERE THE DATAGROUP HDR IS OF THE FORM BIT0=0,    K0901290
                    * BIT 1-7=DUPLICATION FACTOR, BITS 8-15=CONSTANT    K0901300
                    * LENGTH. BIT 1 OF THE NAME PT=1 IF A DISPLACEMENT  K0901310
                    * WORD FOLLOWS, ELSE IT IS 0. ALL NAME PTS NOW      K0901320
                    * POINT TO THE SYMBOL LIST, AND ALL CONSTANTS ARE   K0901330
                    * CONVERTED.                                        K0901340
                    *                                                   K0901350
                    BEGIN LDX   1 PHID      GET ID THIS PHASE           K0901360
                          STX  L1 $PHSE     STORE IN SYSTEM PHASE AREA  K0901370
                          LD      ERROR     OVERLAP ERROR SWITCH        K0901380
                          BSC  L  EXIT1,Z   SKIP PHASE IF OVERLAP ERROR K0901390
                          LD      SOFS      START OF STRING ADDRESS     K0901400
                          STO  L  NEXT      NEXT STMNT ID WORD ADDRESS  K0901410
                          LDX  L1 WORK      INDEX REG 1= WORK AREA ADDR K0901420
                          BSI     FINDD     FIND FIRST DATA STMNT       K0901430
                          LD      START     CURRENT STMNT ID WD ADDR    K0901440
                          STO  L  ENDD      PRESET FOR MOVE             K0901450
                          LD      CCWD      CONTROL CARD WORD           K0901460
                          AND     L4        EXTRACT BIT 13- PRECISION   K0901470
                          SRA     2         RIGHT JUSTIFY               K0901480
                          A       TWO       LENGTH=2 NORMAL, 3 EXTENDED K0901490
                          STO  L  LNGTH     REAL WORD LENGTH            K0901500
                          STO     INTL      SAVE AS INTEGER LENGTH      K0901510
                          LD      CCWD      CONTROL CARD WORD           K0901520
                          SLA     9         ONE-WD INTEGER INDR TO SIGN K0901530
                          SRA     15        RIGHT JUSTIFY INDICATOR     K0901540
                          BSC     Z         SKIP IF NO ONE-WD INTEGERS  K0901550
                          STO     INTL      SET INTEGER LENGTH TO ONE   K0901560
                    *                                                   K0901570
                    *             FIND FIRST CONSTANT IN SUBSTATEMENT   K0901580
                    *                                                   K0901590
                    FINDC STX  L2 K         SET K=J                     K0901600
                          STX   2 J         SAVE J                      K0901610
                    FNDC1 EQU     *         LABEL FNDC1 EQUALS LOOP1    K0901620
                    LOOP1 LD   I  K         NEXT STMNT WORD             K0901630
                          S       SLASH     SLASH CONSTANT              K0901640
                          BSC  L  LOOP2,+-  BRANCH IF SLASH             K0901650
                          MDX  L  K,1       INCREMENT K=K+1             K0901660
                          LD      NEXT      ADDR NEXT STMNT ID WORD     K0901670
                          S    L  K         ADDR CURRENT STMNT POINTER  K0901680
                          BSC  L  LOOP1,Z   BR IF NOT STMNT END         K0901690
                    ERR8  LDX  X1 D8        ILLEGAL STATEMENT FORMAT    K0901700
                          BSC  L  ERR       BR TO SET UP ERROR 75       K0901710
                    *                                                   K0901720
                    *             CONSTANTS AND WORK AREA               K0901730
                    *                                                   K0901740
                    J     BSS     1         INDEX FOR VARIABLES         K0901750
                    HDRPT BSS     1         DATA GROUP HEADER WD PT     K0901760
                    L4    DC      4         DECIMAL 4                   K0901770
                    *                                                   K0901780
                    *             CHECK FOR NAMES                       K0901790
                    *                                                   K0901800
                    LOOP2 STO  L  SUB       CLEAR SUBSCRIPT             K0901810
                          LD   L  K         CURRENT POINTER ADDRESS     K0901820
                          S       J         POINTER AFTER LAST CONSTANT K0901830
                          SRA     1                                     K0901840
                          BSC  L  NEXTC+1,Z BR IF NAMES SPECIFIED       K0901850
                          LDX  X1 D1        NO NAMES SPECIFIED          K0901860
                          BSC  L  ERR       BR TO SET UP ERROR 75       K0901870
                    NEXTC EQU     *         LABEL FOR NEXT INSTRUCTION  K0901880
                          STX   2 J         SAVE POINTER AFTER LAST CON K0901890
                          MDX  L  K,1       INCR INTER-STMNT POINTER    K0901900
                          STX   1 HDRPT     HEADER WORD POINTER         K0901910
                          BSI     INCRP     INCR WORK AREA POINTER      K0901920
                          BSI  L  GCON      BR TO GET NEXT CONSTANT     K0901930
                          LD      CONL      CONSTANT LENGTH INDR        K0901940
                          BSC  L  ERR8,+-   BR IF CONSTANT NOT FOUND    K0901950
                          LDX   2 1                                     K0901960
                          STX   2 DUP       DUPLICATION FACTOR=1        K0901970
                          LD   I  K         NEXT STMNT WORD             K0901980
                          S       STAR      ASTERISK CONSTANT           K0901990
                          BSC  L  BLDH,Z    BR IF NOT ASTERISK          K0902000
                          LD      CONL      CONSTANT LENGTH INDICATOR   K0902010
                          S    L  ONE                                   K0902020
                          BSC  L  *+3,+-    BR IF CONSTANT LENGTH=1     K0902030
                    ERR2  LDX  X1 D2        NOT A POSITIVE INTEGER      K0902040
                          BSC  L  ERR       BR TO SET UP ERROR 75       K0902050
                          LD    1 -1        LAST WORD HEADER WORK AREA  K0902060
                          BSC  L  ERR2,Z+   BR TO SET ERROR 75          K0902070
                          STO     DUP       SAVE FOR NAME ITERATION     K0902080
                          S       TOP       CHECK DUPLICATION SIZE      K0902090
                          BSC  L  ERR2,-    BR IF TOO LARGE             K0902100
                          MDX  L  K,1       INCREMENT K                 K0902110
                          MDX   1 -1        MOVE WORK AREA POINTER      K0902120
                          BSI  L  GCON      GET NEXT CONSTANT           K0902130
                          LD      CONL      CONSTANT LENGTH INDR        K0902140
                          BSC  L  BLDH,Z    BR IF CONSTANT FOUND        K0902150
                          LDX  X1 D3        SET UP ERROR 75 IF CONSTANT K0902160
                          BSC  L  ERR       NOT FOUND AFTER DUP FACTOR  K0902170
                    *                                                   K0902180
                    *             CONSTANTS                             K0902190
                    *                                                   K0902200
                    STAR  DC      /1C       ASTERISK CONSTANT           K0902210
                    TOP   DC      /1000     DUPLICATION FACTOR LIMIT    K0902220
                    *                                                   K0902230
                    * THIS ROUTINE INCREMENTS X1, THE WORK AREA POINTER K0902240
                    * BY ONE, CHECKING TO SEE THAT THE LIMIT OF THE     K0902250
                    * AREA IS NOT EXCEEDED. IF IT IS EXCEEDED, THE      K0902260
                    * STATEMENT RECEIVES AN ERROR 82.                   K0902270
                    *                                                   K0902280
                    INCRP BSS     1         RETURN ADDR                 K0902290
                          MDX   1 1         INCR WORK AREA POINTER      K0902300
                          STX   1 WKAA                                  K0902310
                          LD      WKAA      WORK AREA POINTER           K0902320
                          S       WKNDA     WORK AREA END ADDRESS       K0902330
                          BSC  I  INCRP,+Z  EXIT IF NO OVERLAP          K0902340
                          LDX   1 D15       OVERLAP ERROR INDICATED     K0902350
                          BSC  L  ERR       SET UP ERROR 82             K0902360
                    *                                                   K0902370
                    *             CONSTANT AND WORK AREA                K0902380
                    *                                                   K0902390
                    WKNDA DC      WKEND     ADDR END OF WORK AREA       K0902400
                    WKAA  DC      *-*       CURRENT END OF WORK AREA    K0902410
                    *                                                   K0902420
                    * THIS ROUTINE LOCATES THE NEXT DATA STATEMENT.     K0902430
                    * THE POINTERS START AND NEXT ARE UPDATED TO POINT  K0902440
                    * TO THE START OF THE NEXT DATA STATEMENT AND TO    K0902450
                    * THE STATEMENT FOLLOWING, RESPECTIVELY.            K0902460
                    *                                                   K0902470
                    FINDD BSS     1         RETURN ADDRESS              K0902480
                          LDX  I2 NEXT      POINTER TO NEXT STMNT ID WD K0902490
                          STX  L2 SAVE+1    SAVE FOR MOVE               K0902500
                    FNDD1 STX   2 START     SAVE AS START OF STMNT      K0902510
                    START EQU     *+1       LABEL NEXT INSTRUCTION ADDR K0902520
                          LD   L  *-*       STMNT ID WORD               K0902530
                          SRA     2         RIGHT JUSTIFY STMNT WD CNT  K0902540
                          AND     L1FF      EXRACT WORD COUNT           K0902550
                          A       START     START OF STMNT ADDR         K0902560
                          STO     NEXT      ADDR OF NEXT STMNT ID WORD  K0902570
                          S    L  EOFS      END OF STRING ADDRESS       K0902580
                          BSC  L  EXIT,Z-   EXIT IF END OF STRING       K0902590
                          LD    2 0         STMNT ID WORD               K0902600
                          SRA     11        RIGHT JUSTIFY STMNT TYPE    K0902610
                          S       DATA      DATA STMNT TYPE CONSTANT    K0902620
                          BSC  I  FINDD,+-  EXIT IF DATA STMNT          K0902630
                    NEXT  EQU     *+1       LABEL NEXT INSTRUCTION ADDR K0902640
                          LDX  L2 *-*       SET POINTER NEXT STMNT ID   K0902650
                          MDX     FNDD1     BR TO FIND NEXT STMNT ID WD K0902660
                    *                                                   K0902670
                    *             CONSTANTS AND WORK AREA               K0902680
                    *                                                   K0902690
                    L1FF  DC      /1FF      STMNT WD COUNT MASK         K0902700
                    DATA  DC      /1F       DATA STMNT TYPE CODE        K0902710
                    H8000 DC      /8001     NAME BIT PLUS 1             K0902720
                    H20   DC      /20       DEFINED BIT                 K0902730
                    TWO   DC      2         DECIMAL TWO                 K0902740
                    CONL  BSS     1         LENGTH OF CONSTANT          K0902750
                    INTL  BSS     1         INTEGER ELEMENT LENGTH      K0902760
                    SLASH DC      /21       / CONSTANT                  K0902770
                    *                                                   K0902780
                    *             BUILD DATAGROUP HEADER WORD           K0902790
                    *                                                   K0902800
                    BLDH  LD      CONL      CONSTANT LENGTH             K0902810
                          STO     CONLT     SAVE FOR NAME ITERATION     K0902820
                          LD      DUP       DUPLICATION FACTOR          K0902830
                          SLA     3         TO HIGH 13 BITS             K0902840
                          A       CONL      CONSTANT LENGTH             K0902850
                          STO  I  HDRPT     DATAGROUP HEADER WORD       K0902860
                          LD      CONTP     CONSTANT TYPE               K0902870
                          STO     CONTT     SAVE FOR NAME ITERATION     K0902880
                          LDX  I2 J         SET INDEX REG 2 = J         K0902890
                          MDX  L  SUB,0     CHECK SUBSC TEMP-SKIP IF 0  K0902900
                          MDX     NXTN4+1   BR IF NAME NOT YET FULL     K0902910
                    NEXTN MDX   2 1         INCR J=J+1                  K0902920
                          LD    2 0         NEXT STMNT WORD             K0902930
                          BSC  L  ERR2,-    BR IF NOT A NAME        2-6 K0902940
                          LDX  I3 SOFNS     INDEX REG 3=SYMBOL TABLE PT K0902950
                    NXTN1 LD    2 0         NEXT STMNT WORD             K0902960
                          S     3 1         SYMBOL TABLE ENTRY          K0902970
                          BSC  L  NXTN3,+-  BR IF NAME FOUND            K0902980
                    NXTNA EQU     *         LABEL NEXT INSTRUCTION      K0902990
                          LD    3 0         EXTRACT DIMENSION           K0903000
                          SLA     3         *INFORMATION                K0903010
                          SRA     14        *                           K0903020
                          BSC     Z         SKIP NEXT IF NO DIMENSION   K0903030
                          MDX   3 -3        DECR SYMBOL TABLE POINTER   K0903040
                          MDX   3 -3        DECR SYMBOL TABLE POINTER   K0903050
                          STX   3 NOST      ADDR TEMP                   K0903060
                          LD      NOST      CURRENT SYMBOL TBL POINTER  K0903070
                          S    L  EOFST     END OF SYMBOL TABLE ADDRESS K0903080
                          BSC  L  NXTN1,Z   BR IF NOT STRING END        K0903090
                    ERR4  LDX  X1 D4        NAME IS UNDEFINED           K0903100
                          BSC  L  ERR       SET UP ERROR 80             K0903110
                    *                                                   K0903120
                    *             CONSTANTS AND WORK AREA               K0903130
                    *                                                   K0903140
                    THREE DC      3         DECIMAL 3 CONSTANT          K0903150
                    DUP   BSS     1         DUPLICATION FACTOR          K0903160
                    NOST  BSS     1         INTEGER SAVE TEMPORARY      K0903170
                    CONLT BSS     1         CONSTANT LENGTH TEMPORARY   K0903180
                    CONTT BSS     1         CONSTANT TYPE TEMPORARY     K0903190
                    BLANK DC      /4040     WORD OF EBCDIC BLANKS       K0903200
                    CONTP BSS     1         CONSTANT TYPE               K0903210
                    T8000 DC      /8000     NAME BIT CONSTANT           K0903220
                    *                                                   K0903230
                    *             CONTINUE BUILD DATAGROUP HEADER WORD  K0903240
                    *                                                   K0903250
                    NXTN3 LD    2 1         NEXT STMNT WORD             K0903260
                          BSC     -         SKIP IF 2ND WORD OF NAME    K0903270
                          LD      T8000     BLANK 2ND WORD OF NAME      K0903280
                          S     3 2         2ND WD FR SYMBOL TABLE      K0903290
                          BSC  L  NXTNA,Z   BR IF NAME NOT FOUND        K0903300
                          LD    2 1         2ND HALF OF NAME            K0903310
                          BSC     +Z        SKIP NEXT IF NOT NAME       K0903320
                          MDX   2 1         INCR STMNT POINTER J=J+1    K0903330
                    NXTN4 EQU     *         LABEL FOR NEXT INSTRUCTION  K0903340
                          MDX   2 1         INCR STMNT POINTER          K0903350
                          STX   3 NOST      SYMBOL TABLE POINTER        K0903360
                          LD   L  SOFST     START OF SYMBOL TABLE ADDR  K0903370
                          S       NOST      CURRENT POINTER VALUE       K0903380
                          SRT     16        MAKE NORMAL DIVIDEND        K0903390
                          D       THREE     NO. OF WORDS PER ENTRY      K0903400
                          A       H8000     NAME BIT                    K0903410
                          STO     TNAME     STORE NAME                  K0903420
                    *                                                   K0903430
                          LD    3 0         SYMBOL TABLE ID WORD        K0903440
                          OR      H20       SET DEFINED BIT             K0903450
                          STO   3 0         RESTORE ID WORD             K0903460
                          BSC  L  ERR9,+    BR IF NOT A VARIABLE- ERROR K0903470
                          SRA     10        IS IT A DUMMY VARIABLE  2-5 K0903472
                          BSC  L  ERR4,E    ERROR 80 IF YES         2-5 K0903474
                          SRA     4         DATA TYPE BITS              K0903480
                          STO     NOST                                  K0903490
                          S       CONTT     CON TYPE TEMPORARY          K0903500
                          BSC  L  NXTN8,+-  BR IF SAME TYPE             K0903510
                          LD      CONTT     CONSTANT TYPE TEMP          K0903520
                          S       TWO                                   K0903530
                          BSC  L  *+3,+-    BR IF HOLLERITH DATA        K0903540
                    ERR9  LDX   1 D9        DATA TYPES DO NOT MATCH     K0903550
                          BSC  L  ERR       SET UP ERROR 77             K0903560
                    NXTN8 LD      NOST      CON TYPE                2-1 K0903570
                          BSC  L  INT,Z     BR IF INTEGER           2-1 K0903580
                          LD   L  LNGTH     LENGTH OF REAL          2-1 K0903590
                          STO     NAML      CURRENT LENGTH          2-1 K0903600
                          MDX     *+4                               2-1 K0903610
                    INT   LD      INTL      LENGTH OF INTEGER       2-1 K0903620
                          STO     NAML      CURRENT LENGTH          2-1 K0903630
                          LD   L  ONE                               2-1 K0903640
                          S       CONLT     CONSTANT LENGTH TEMPORARY   K0903650
                          BSC  L  ERR11,+Z  BR TO SET UP ERR 78 IF NEG  K0903660
                          BSC  L  NXT8A,+   BRANCH IF ZERO              K0903670
                    *                                                   K0903680
                          LD      CONTT                                 K0903690
                          S       TWO                                   K0903700
                          BSC  L  NXT8A,Z   BRANCH IF NOT ALPHA CONST   K0903710
                    *                                                   K0903720
                          LD      BLANK     PACK CONSTANT WITH BLANKS   K0903730
                          STO   1 0         *                           K0903740
                          BSI  L  INCRP                                 K0903750
                          LD   I  HDRPT     ADJUST HEADER               K0903760
                          A    L  ONE       *                           K0903770
                          STO  I  HDRPT     *                           K0903780
                          MDX  L  CONLT,1   INCREMENT CONSTANT LENGTH   K0903790
                          MDX     NXTN8     CONTINUE                    K0903800
                    *                                                   K0903810
                    TNAME DC      0         NAME SAVE AREA              K0903820
                    *                                                   K0903830
                    NXT8A LD      TNAME     OUTPUT NAME                 K0903840
                          STO   1 0         *                           K0903850
                          BSI  L  INCRP     *                           K0903860
                    *                                                   K0903870
                          LD    3 0         SYMBOL TABLE ID WORD        K0903880
                          SLA     3         EXTRACT AND RIGHT JUSTIFY   K0903890
                          SRA     14        DIMENSION BITS.             K0903900
                          STO     DIMN      SAVE DIMENSIONALITY         K0903910
                          STO     DIMNT     SAVE FOR SUBSC CALCULATION  K0903920
                          BSC  L  NXTN7,+-  BR IF NOT DIMENSIONED       K0903930
                          BSI  L  INCRP     INCR WORK AREA POINTER      K0903940
                          MDX  L  SUB,0     TEST FOR SUBSCRIPT          K0903950
                          MDX     NXTN2     BR IF SUBSCRIPT             K0903960
                          MDX   1 -1        DECR WORK AREA POINTER      K0903970
                          LD    2 0         NEXT STMNT WORD             K0903980
                          S       LPAR      LEFT PARENTHESIS CONSTANT   K0903990
                          BSC  L  NXTN5,+-  BR TO GET SUBSCRIPT         K0904000
                    NXTN7 LD   L  ONE                                   K0904010
                          MDX  L  DIMN,0    SKIP IF NOT DIMENSIONED     K0904020
                          LD    3 -3        NEXT SYMBOL ID WORD         K0904030
                          S       SUB       REMAINING ELEMENTS IN NAME  K0904040
                          BSC  L  *+3,-Z    BR IF SUBSCRIPT OK          K0904050
                    ERR13 EQU     *         LABEL FOR NEXT INSTRUCTION  K0904060
                          LDX  X1 D13       SUBSCRIPT TOO LARGE         K0904070
                    GERR  BSC  L  ERR       SET UP ERROR 33             K0904080
                          S       DUP       DUPLICATION FACTOR          K0904090
                          STO     TEMP      REMAINING AFTER THIS CON    K0904100
                          BSC  L  NXTN9,+   BF IF NAME FULL OR OVERFLOW K0904110
                          LD    3 -3        NEXT ENTRY ID WORD          K0904120
                          S       TEMP      REMAINDER                   K0904130
                          STO     SUB       SUBSCRIPT FOR NEXT CONSTANT K0904140
                          MDX     COM       BR TO TEST FOR ANOTHER CON  K0904150
                    NXTN9 SRA     16                                    K0904160
                          STO     SUB       CLEAR SUBSCRIPT             K0904170
                          S       TEMP      REMAINDER                   K0904180
                          STO     DUP       DUPCTN FACTOR FOR NEXT NAME K0904190
                          BSC  L  *+5,+-    BR IF CONSTANT EXHAUSTED    K0904200
                          LD    2 0         NEXT STMNT WORD             K0904210
                          S       COMMA     COMMA CONSTANT              K0904220
                          BSC  L  NEXTN,+-  BR CONSTANT NOT EXHAUSTED   K0904230
                          MDX     ERR7      NO COMMA AFTER NAME         K0904240
                          LD    2 0         NEXT STMNT WORD             K0904250
                          S       COMMA     COMMA CONSTANT              K0904260
                          BSC  L  COM,+-    BR IF COMMA                 K0904270
                    SLSH2 EQU     *         LABEL FOR NEXT INSTRUCITON  K0904280
                          LD    2 0         NEXT STMNT WORD             K0904290
                          S    L  SLASH     SLASH CONSTANT              K0904300
                          BSC  L  SLSH,+-   BR IF SLASH                 K0904310
                          LDX  X1 D5        ILLEGAL CHAR AFTER NAME     K0904320
                          MDX     GERR      BR TO SET UP ERROR 75       K0904330
                    *                                                   K0904340
                    *             CONSTANTS AND WORK AREA               K0904350
                    *                                                   K0904360
                    SUB   DC      0         SUBSCRIPT TEMPORARY         K0904370
                    TEMP  BSS     1         REMAINDER TEMPORARY         K0904380
                    LPAR  DC      /0D       LEFT PARENTHESIS CONSTANT   K0904390
                    H4000 DC      /4000     NAME SUBSCRIPT BIT          K0904400
                    NAML  BSS     1         CURRENT DIMENSION LENGTH    K0904410
                    DIMNT DC      0         DIMENSION TEMPORARY         K0904420
                    COMMA DC      /2B       COMMA CONSTANT              K0904430
                    SUBSW DC      *         SUBSCRIPTED ELEMENT SWITCH  K0904440
                    *                                                   K0904450
                    *             CALCULATE VECTOR DISPLACEMENT FROM    K0904460
                    *             VARIABLE STATEMENT                    K0904470
                    *                                                   K0904480
                    NEXTS LD    2 0         NEXT STMNT WORD             K0904490
                          S       COMMA     COMMA CONSTANT              K0904500
                          BSC  L  ERR13,Z   BR NO COMMA BETWEEN SUBSC   K0904510
                          MDX   1 -1        DECR WORK AREA POINTER      K0904520
                          BSI  L  GCONS     GET NEXT SUBSCRIPT INTEGER  K0904530
                          M     3 0         MPY BY DIMENSION            K0904540
                          RTE     16        PRODUCT TO ACC              K0904550
                          A       SUB       ACCUMULATED VALUE           K0904560
                          MDX     TESTS     BR TO SAVE AND TEST SUBSC   K0904570
                    NXTN5 STO     SUBSW     SET SUBSCRIPTED ELT SWITCH  K0904580
                          LD   L  K                                     K0904590
                          STO     TEMP      SAVE K                      K0904600
                          STX  L2 K         K=J                         K0904610
                          BSI  L  GCONS     GET SUBSCRIPT INTEGER       K0904620
                    TESTS STO     SUB       SAVE ACCUMULATED RESULT     K0904630
                          S     3 -1        TEST FOR CURRENT SIZE       K0904640
                          BSC  L  ERR13,-   TOO LARGE                   K0904650
                          MDX   3 -1        MOVE DIMENSION PT BACK ONE  K0904660
                          MDX  L  DIMNT,-1  TEST IF MORE SUBSC EXPECTED K0904670
                          MDX     NEXTS     YES                         K0904680
                    NXTN6 LD      TEMP      K FROM TEMPORARY            K0904690
                          STO  L  K         RESET K                     K0904700
                          MDX   2 1         INCREMENT STMNT POINTER     K0904710
                          LD    2 -1        LAST STMNT WORD             K0904720
                          S    L  RPAR      RIGHT PARENTHESIS CONSTANT  K0904730
                          BSC  L  ERR13,Z   BR NOT RIGHT PARENTHESIS    K0904740
                    DIMN  EQU     *+1       NUMBER OF DIMENSIONS        K0904750
                          MDX  L3 *-*       RESET SYMBOL TBL POINTER    K0904760
                    NXTN2 LD      SUB       SUBSCRIPT TEMP              K0904770
                          M       NAML      GET TRUE DISPLACEMENT       K0904780
                          SLT     16        PRODUCT TO ACC              K0904790
                          STO   1 -1        STORE SUBSCRIPT IN WORK     K0904800
                          LD    1 -2        NAME WORD                   K0904810
                          OR      H4000     SET SUBSCRIPT BIT IN NAME   K0904820
                          STO   1 -2        RESTORE NAME WORD           K0904830
                          MDX  L  SUBSW,0   SKIP IF SUBSCRIPTED ELT     K0904840
                          MDX     NXTN7     BR TO FIND MORE ENTRIES     K0904850
                          STX     SUBSW     RESET SUBSCRIPTED ELT SW    K0904860
                          SLA     16        LOAD ZERO                   K0904870
                          STO     DIMN      ZERO NO. OF DIMENSIONS      K0904880
                          STO     DIMNT     ZERO WORK AREA              K0904890
                          STO     SUB       ZERO SUBSCRIPTS             K0904900
                          LD    1 -2        SET SUBSCRIPTED ELEMENT     K0904910
                          OR      H2000     *BIT INTO NAME POINTER      K0904920
                          STO   1 -2        *                           K0904930
                          MDX     NXTN7     BR TO FIND MORE             K0904940
                    H2000 DC      /2000     SUBSCRIPTED ELEMENT BIT     K0904950
                    COM   EQU     *         LABEL FOR NEXT INSTRUCTION  K0904960
                          LD   I  K         NEXT STMNT WORD             K0904970
                          S       COMMA     COMMA CONSTANT              K0904980
                          BSC  L  NEXTC,+-  NEXT CON IF MORE IN LIST    K0904990
                          MDX  L  SUB,0     SKIP NEXT SUBSCRIPT = ZERO  K0905000
                          MDX     SLSH2     CHK FOR UNFILLED LAST NAME  K0905010
                    ERR7  LDX  X1 D7        NO. OF CONS, NAMES UNEQUAL  K0905020
                          MDX     ERR       BR TO SET UP ERROR 76       K0905030
                    *                                                   K0905040
                    *             MOVE WORK STRING TO STRING AREA       K0905050
                    *                                                   K0905060
                    SLSH  EQU     *         LABEL FOR NEXT INSTRUCITON  K0905070
                          STO     SUB       CLEAR SUBSCRIPT             K0905080
                          LD   I  K         NEXT STMNT WORD             K0905090
                          S    L  SLASH     SLASH CONSTANT              K0905100
                          BSC  L  ERR7,Z    BR IF NOT SLASH             K0905110
                          MDX  L  K,1       INCR STMNT POINTER          K0905120
                          LD   I  K         NEXT STMNT WORD             K0905130
                          S       COMMA     COMMA CONSTANT              K0905140
                          BSC  L  SLSH1,Z   BR IF NOT A COMMA           K0905150
                          LD      K         STMNT POINTER               K0905160
                          STO  L  J         J=K                         K0905170
                          BSC  L  FNDC1     BR FOR MULTIPLE STMNTS      K0905180
                    SLSH1 MDX  L  K,1       INCR STMNT POINTER          K0905190
                          LD      K         CURRENT POINTER VALUE       K0905200
                          S    L  NEXT      ADDR NEXT STMNT ID WORD     K0905210
                          BSC  L  ERR8,Z    BR IF NOT STMNT END         K0905220
                          MDX  L1 1-WORK    GET LENGTH                  K0905230
                          STX   1 SL+1      END OF OUTPUT INCREMENT     K0905240
                          LDX  I2 ENDD      PICK UP END OF OUTPUT PT    K0905250
                          LD      DATAS     DATA STMNT ID SHIFTED 2 RT  K0905260
                          OR      SL+1      BUILD NEW STMNT ID FOR DATA K0905270
                          SLA     2         RESTORE TO NORMAL FROM      K0905280
                          STO     IDWD      SAVE NEW ID WORD            K0905290
                          S     2 0         END OF OUTPUT WORD          K0905300
                          BSC  L  OPEN,-Z   BR TO OPEN STRING           K0905310
                    CONTS LD      IDWD      RESTORE NEW ID WORD         K0905320
                          STO   2 0         MOVE IN DATA STMNT ID       K0905330
                          MDX   1 -1        DECR WORK AREA POINTER      K0905340
                    SL    MDX  L2 *-*       POINT TO END OF OUTPUT      K0905350
                          STX   2 ENDD      SAVE AS NEW END             K0905360
                    LOOP3 LD   L1 WORK-1    WORD FROM WORK AREA         K0905370
                          STO   2 -1        TO STRING AREA              K0905380
                          MDX   2 -1        DECR STRING POINTER         K0905390
                          MDX   1 -1        DECR AREA POINTER           K0905400
                          MDX     LOOP3     BR IF WORK PT NOT ZERO      K0905410
                    NXTD  BSI  L  FINDD     FIND NEXT DATA STMNT        K0905420
                          BSI     MOVE      COMPRESS STRING             K0905430
                          LDX  L1 WORK      RESET WORK POINTER          K0905440
                          BSC  L  FINDC     FIND CONSTANT               K0905450
                    *                                                   K0905460
                    *             WORK AREA                             K0905470
                    *                                                   K0905480
                    IDWD  DC      *-*       NEW ID WORD TEMPORARY       K0905490
                    RUNOF DC      *-*       STRING SIZE TO MOVE         K0905500
                    *                                                   K0905510
                    *             THIS ROUTINE OPENS THE STRING TO PUT  K0905520
                    *             ENLARGED DATA STMNT IN STRING AREA    K0905530
                    *                                                   K0905540
                    OPEN  SRA     2                                     K0905550
                          STO     CNTOF     COUNT OVERFLOW              K0905560
                          A    L  EOFS      FIND NEW END OF STRING      K0905570
                          STO     OWD1+3    PUT ADDR IN MOVER LOOP      K0905580
                          LD   L  EOFS      END OF STRING ADDRESS       K0905590
                          STO     OWD1+1    MOVE INSTRUCTION            K0905600
                          S       ENDD      START OF MOVE AREA          K0905610
                          A       ONE       ONE                         K0905620
                          STO     RUNOF     STRING SIZE TO MOVE         K0905630
                          LD      OWD1+3                                K0905640
                          S    L  EOFST     CHECK IF OVERLAP        2-7 K0905642
                          BSC  L  ERR97,-   BRANCH IF YES           2-7 K0905644
                          LD      OWD1+3    LOAD AND STORE          2-7 K0905646
                          STO  L  EOFS      NEW END OF STRING ADDRESS   K0905650
                    OWD1  LD   L  *-*       NEXT WORD TO MOVE           K0905660
                          STO  L  *-*       OPEN STRING                 K0905670
                          MDX  L  OWD1+1,-1 DECR NEXT WORD TO MOVE ADDR K0905680
                          MDX  L  OWD1+3,-1 DECR MOVE TO ADDRESS        K0905690
                          MDX  L  RUNOF,-1  DECR NO. OF WORDS TO MOVE   K0905700
                          MDX     OWD1      BR TO CONTINUE              K0905710
                          LD   L  NEXT      ADDR NEXT STMNT ID WORD     K0905720
                          A       CNTOF     RANGE OF MOVE               K0905730
                          STO  L  NEXT      NEW NEXT STMNT ADDR         K0905740
                          MDX     CONTS     BR TO RESTORE NEW ID WORD   K0905750
                    *                                                   K0905760
                    CNTOF DC      *-*       RANGE OF STRING OPENING     K0905770
                    *                                                   K0905780
                    * THIS ROUTINE IS ENTERED FOR ALL ERROR CONDITIONS. K0905790
                    * THE STATEMENT BEING PROCESSED IS DISCARDED, AND   K0905800
                    * REPLACED BY AN ERROR RECORD. MOVE IS THEN CALLED  K0905810
                    * TO CONDENSE THE STRING, AND PROCESSING CONTINUES  K0905820
                    * WITH THE NEXT STATEMENT. ON INPUT, INDEX 1 HOLDS  K0905830
                    * THE ERROR NUMBER.                                 K0905840
                    *                                                   K0905850
                    ERR   LD      ERRCD     ERROR INDICATOR             K0905860
                          STO  I  ENDD      SET ERROR IN STMNT ID WORD  K0905870
                          MDX  L  ENDD,1    INCR END OF STRING          K0905880
                          STX  I1 ENDD      SET ERROR CODE              K0905890
                          MDX  L  ENDD,1    INCR END OF STRING          K0905900
                          MDX     NXTD      COMPRESS, THEN NEXT STMNT   K0905910
                    *                                                   K0905912
                    ERR97 MDX  L  ERROR,1   SET ERROR 97            2-7 K0905914
                          MDX     EXIT1     EXIT TO NEXT PHASE      2-7 K0905916
                    *                                                   K0905918
                    *                                                   K0905920
                    *             CONSTANTS AND ERROR EQUIVALENCE TABLE K0905930
                    *                                                   K0905940
                    ERRCD DC      /A008     ERROR INDICATOR - STMNT ID  K0905950
                    D1    EQU     75        NO NAMES SPECIFIED          K0905960
                    D2    EQU     75        DUPCTN FACTOR NOT POS DIGI  K0905970
                    D3    EQU     75        NO CON AFTER DUPCTN FACTOR  K0905980
                    D4    EQU     80        UNDEFINED NAME              K0905990
                    D5    EQU     75        ILLEGAL CHAR AFTER NAME     K0906000
                    D6    EQU     24        ILLEGAL INTEGER CONSTANT    K0906010
                    D7    EQU     76        NAMES AND CONS NOT 1 TO 1   K0906020
                    D8    EQU     75        ILLEGAL STMNT FORMAT        K0906030
                    D9    EQU     77        NAME AND CON TYPE NOT SAME  K0906040
                    D10   EQU     75        ILLEGAL MINUS SIGN          K0906050
                    D11   EQU     78        ILLEGAL HOLLERITH CONSTANT  K0906060
                    D12   EQU     79        ILLEGAL PARTIAL WORD FIELD  K0906070
                    D13   EQU     33        ILLEGAL SUBSCRIPT           K0906080
                    D14   EQU     79        ILLEGAL CHAR IN PARTIAL WD  K0906090
                    D15   EQU     82        WORK AREA EXCEEDED          K0906100
                    K     BSS     1         INDEX FOR CONSTANTS         K0906110
                    DATAS DC      /3E00     DATA STMNT ID SHIFTED 2 RT  K0906120
                    RPAR  DC      /1D       RIGHT PARENTHESIS CONSTANT  K0906130
                    MINUS DC      /20       -                           K0906140
                    BCD   DC      /3D       QUOTE MARK (APOSTROPHE)     K0906150
                    ONE   DC      1         DECIMAL ONE CONSTANT        K0906160
                    *                                                   K0906170
                    * THIS SUBROUTINE COMPRESSES THE STATEMENT STRING.  K0906180
                    * THE INPUT CONSISTS OF A FROM POINTER AND A TO     K0906190
                    * POINTER, IN START AND ENDD RESPECTIVELY           K0906200
                    * ON OUTPUT, ENDD IS UPDATED TO POINT ONE BEYOND    K0906210
                    * THE NEW END, AND INDEX 2 CONTAINS THE INPUT START K0906220
                    * VALUE.                                            K0906230
                    *                                                   K0906240
                    MOVE  BSS     1         RETURN ADDRESS              K0906250
                    SAVE  LDX  L3 *-*       START OF STRING TO MOVE     K0906260
                    ENDD  EQU     *+1       LABEL NEXT INSTRUCTION ADD  K0906270
                          LDX  L2 *-*       START OF MOVE AREA          K0906280
                          LD      ONE                                   K0906290
                          S    L  START     1-START                     K0906300
                          STO     TEST+1    SAVE FOR END TEST           K0906310
                    MOVE1 LD    3 0         NEXT WORD TO MOVE           K0906320
                          STO   2 0         COMPRESS STRING             K0906330
                    TEST  MDX  L3 *-*       TEST FOR END OF MOVE        K0906340
                          MDX     DONE      DONE IF NOT ZERO OR NEG     K0906350
                          MDX  I3 START     EFFECTIVE INCR MOVE ADDR    K0906360
                          MDX     *         NO-OP FOR POSSIBLE SKIP     K0906370
                          MDX   2 1         INCR MOVE TO ADDRESS        K0906380
                          MDX     MOVE1     NEXT WORD                   K0906390
                    DONE  STX   2 ENDD      NEW END OF STRING           K0906400
                          LDX  I2 START     RESET INDEX REG 2           K0906410
                          BSC  I  MOVE      EXIT                        K0906420
                    *                                                   K0906430
                    * THIS ROUTINE COMPLETES STRING COMPRESSION AND     K0906440
                    * EXITS TO THE NEXT PHASE                           K0906450
                    *                                                   K0906460
                    EXIT  LD      ENDD      END OF STRING               K0906470
                          BSC  L  EXIT1,+-  IF ENDD IS ZERO, NO MOVE    K0906480
                          BSI     MOVE      MOVE THE REST OF THE STRING K0906490
                          LD      ENDD                                  K0906500
                          STO  L  EOFS      NEW END OF STRING ADDR      K0906510
                    EXIT1 EQU     *         LABEL FOR NEXT INSTRUCTION  K0906520
                          LDX  I1 NXTPH+1   LOAD PARAM FOR READING      K0906530
                          LDD     NXTPH+2   NEXT PHASE                  K0906540
                          BSC  L  ROL       BR TO READ IN NEXT PHASE    K0906550
                          BSS  E  0         MAKE ADDRESS EVEN           K0906560
                    NXTPH DC      40        ID OF NEXT PHASE            K0906570
                          BSS     3         LOADER TBL FOR NEXT PHASE   K0906580
                    *                                                   K0906590
                    * THIS SUBROUTINE CALLS THE GET CONSTANT SUBROUTINE K0906600
                    * TO FIND A SUBSCRIPT INTEGER. IT TESTS THE GCON    K0906610
                    * OUTPUT TO DETERMINE VALIDITY OF THE SUBSCRIPT.    K0906620
                    *                                                   K0906630
                    GCONS BSS     1         RETURN ADDRESS              K0906640
                          MDX  L  K,1       INCR CONSTANT INDEX         K0906650
                          BSI     GCON      GET CONSTANT                K0906660
                          LD   L  CONL      CONSTANT LENGTH             K0906670
                          S       ONE       ONE                         K0906680
                          BSC  L  ERR6,Z    ERROR IF NOT AN INTEGER     K0906690
                          LD    1 -1        CONSTANT                    K0906700
                          S       ONE       CONSTANT - 1                K0906710
                          LDX  I2 K         J=K                         K0906720
                          BSC  I  GCONS,-   EXIT IF POSITIVE INTEGER    K0906730
                    ERR6  LDX  X1 D6        ILLEGAL SUBSCRIPT           K0906740
                          MDX     ERR       SET UP ERROR 24             K0906750
                    *                                                   K0906760
                    PLUS  DC      /0E       + SIGN                      K0906770
                    *                                                   K0906780
                    * THIS SUBROUTINE FINDS THE NEXT CONSTANT IN THE    K0906790
                    * STRING, IF ANY. ON INPUT, K POINTS TO THE         K0906800
                    * EXPECTED FIRST WORD OF THE CONSTANT, AND INDEX 1  K0906810
                    * TO THE NEXT AVAILABLE WORD IN THE WORK AREA.      K0906820
                    * ON EXIT, THE CONSTANT IS IN THE WORK AREA, INDEX  K0906830
                    * 1 UPDATED, AND THE FOLLOWING SWITCHES SET.        K0906840
                    *             CONL=0          NO CONSTANT FOUND     K0906850
                    *                 =OTHER      LENGTH OF CONSTANT    K0906860
                    *             CONTP=O         REAL CONSTANT         K0906870
                    *                  =1         INTEGER CONSTANT      K0906880
                    *                  =2         HOLLERITH CONSTANT    K0906890
                    *                                                   K0906900
                    * IN ADDITION, K IS UPDATED TO POINT TO THE NEXT    K0906910
                    * WORD PAST THE CONSTANT                            K0906920
                    *                                                   K0906930
                    GCON  BSS     1         RETURN ADDRESS              K0906940
                          SRA     16        CLEAR ACCUMULATOR           K0906950
                          STO  L  CONL      ZERO CONSTANT LENGTH        K0906960
                          STO  L  CONTP     CONSTANT TYPE               K0906970
                          STO     NEG       NEGATIVE SWITCH             K0906980
                          STX  L3 SAV3+1    SAVE INDEX REGISTER O       K0906990
                          LDX  I3 K         SET INDEX REG 3 = K         K0907000
                          LD    3 0         NEXT STMNT WORD             K0907010
                          S       PLUS      PLUS SIGN                   K0907020
                          BSC  L  *+2,Z     BR IF NOT PLUS SIGN         K0907030
                          MDX   3 1         DISCARD PLUS SIGN           K0907040
                          MDX     *+6       BR TO LOAD NEXT STMNT WORD  K0907050
                          LD    3 0         NEXT STMNT WORD             K0907060
                          S       MINUS     MINUS SIGN                  K0907070
                          BSC  L  *+2,Z     BR NOT MINUS SIGN CHAR      K0907080
                          STX     NEG       MINUS SIGN, SET NEG NONZERO K0907090
                          MDX   3 1         INCR STMNT POINTER          K0907100
                          LD    3 0         NEXT STMNT WORD             K0907110
                          S       BCD       QUOTE MARK                  K0907120
                          BSC  L  GCON1,Z   BR IF NOT HOLLERITH         K0907130
                          LD      NEG       NEGATIVE INDICATOR          K0907140
                          BSC  L  *+2,+-    BR IF POSITIVE              K0907150
                    ERR10 EQU     *         LABEL FOR NEXT INSTRUCTION  K0907160
                          LDX  X1 D10       NEGATIVE HOLLERITH CONSTANT K0907170
                          MDX     ERR       BR TO SET UP ERROR 75       K0907180
                          MDX  L  CONTP,2   SET DATA TYPE =2            K0907190
                          MDX   3 1         INCR STMNT POINTER          K0907200
                    *                                                   K0907210
                    *             PROCESS EBCDIC CONSTANTS              K0907220
                    *                                                   K0907230
                    GCON2 SLT     16        CLEAR EXTENSION             K0907240
                          LD    3 0         NEXT STMNT WORD             K0907250
                          EOR     BCD       QUOTE MARK CONSTANT         K0907260
                          BSC  L  GCON4,+-  BR IF QUOTE MARK            K0907270
                          SRA     8                                     K0907280
                          BSC  L  ERR11,+-  BR IF ILLEGAL HOLLERITH CON K0907290
                          LD    3 0         NEXT STMNT WORD             K0907300
                    B     MDX   3 1         INCR STMNT POINTER          K0907310
                          RTE     16        BRING IN PREVIOUS WORD      K0907320
                          BSC  L  GCON2+1,+- DISCARD IF EMPTY           K0907330
                          STO   1 0         WORK AREA                   K0907340
                          BSI  L  INCRP     INCR WORK AREA POINTER      K0907350
                          LD    1 -1        LOAD LAST O/P WORD          K0907360
                          AND     LFF       MASK OUT LEFT CHARACTER     K0907370
                          MDX  L  CONL,1    INCR CONSTANT LENGTH IF     K0907380
                          BSC  L  GCON2+1,Z WORD FULL.                  K0907390
                          LD    1 -1        LAST WD FROM WORK AREA      K0907400
                          SRA     8         RIGHT JUSTIFY LEFT CHAR     K0907410
                          SLT     8         PACK IN ONE MORE CHARACTER  K0907420
                          STO   1 -1        RESTORE TO WORK AREA        K0907430
                          MDX     GCON2+1   GET NEXT INPUT              K0907440
                    *                                                   K0907450
                    BCD1  DC      /7D00     LEFT ADJUSTED QOUTE MARK    K0907460
                    LFF   DC      /FF       LOW 8 BIT MASK              K0907470
                    *                                                   K0907480
                    GCON4 MDX   3 1         INCR STMNT POINTER          K0907490
                          LD    3 0         NEXT STMNT WORD             K0907500
                          S       BCD       QUOTE MARK                  K0907510
                          BSC  L  QT1,Z     BR IF NOT ANOTHER QUOTE     K0907520
                          LD      BCD1      COMPRESS TO ONE QUOTE       K0907530
                          MDX     B         CONTINUE PACKING            K0907540
                    QT1   SLT     16        SHIFT IN PREVIOUS WORD      K0907550
                          BSC  L  QT2,+-    BR IF ZERO                  K0907560
                          OR   L  BLANK     BLANK LOW CHAR IF ZERO      K0907570
                          STO   1 0         WORK AREA                   K0907580
                          BSI  L  INCRP     INCR WORK AREA POINTER      K0907590
                          MDX  L  CONL,1    UPDATE CONSTANT LENGTH      K0907600
                    QT2   LD   L  CONL      CONSTANT LENGTH             K0907610
                          BSC  L  GCONX,Z   EXITIF VALID                K0907620
                    ERR11 LDX  X1 D11       ILLEGAL CONSTANT LENGTH     K0907630
                          BSC  L  ERR       SET UP ERROR 77             K0907640
                    *                                                   K0907650
                    REAL  DC      /5E       REAL CONSTANT INDR          K0907660
                    LNGTH DC      0         LENGTH OF REAL INDR         K0907670
                    NEG   BSS     1         NEGATIVE CONSTANT HDR       K0907680
                    *                                                   K0907690
                    *             PROCESS REAL CONSTANTS                K0907700
                    *                                                   K0907710
                    GCON1 LD    3 0         NEXT STMNT WORD             K0907720
                          S       REAL      REAL CONSTANT INDR          K0907730
                          BSC  L  GCON3,Z   BR IF NOT A REAL CONSTANT   K0907740
                          LD    3 1         FIRST WORD OF REAL CONSTANT K0907750
                          STO   1 0         WORK AREA                   K0907760
                          STO     WD        SAVE IN CASE NEGATIVE       K0907770
                          LD    3 2         SECOND WORD OF REAL CON     K0907780
                          STO   1 1         WORK AREA                   K0907790
                          LD      LNGTH     LENGTH OF REAL INDR         K0907800
                          STO  L  CONL      SET CONSTANT LENGTH         K0907810
                          S    L  THREE     THREE                       K0907820
                          STO     EXTND     NORMAL PRECISION= NON-ZERO  K0907830
                          BSC  L  INC3,Z    BR IF NORMAL PRECISION      K0907840
                          LD    3 2         2ND WORD OF EXTENDED REAL   K0907850
                          STO     WD        SAVE IN CASE NEGATIVE       K0907860
                          LD    3 3         3RD WORD OF EXTENDED REAL   K0907870
                          STO   1 2         WORK AREA                   K0907880
                          MDX   3 1         SPECIAL INCR FOR 3RD WORD   K0907890
                          BSI  L  INCRP     INCR WORK AREA POINTER      K0907900
                    INC3  MDX   3 3         UPDATE STMNT POINTER        K0907910
                          BSI  L  INCRP     INCREMENT WORK AREA POINTER K0907920
                          BSI  L  INCRP     TWICE.                      K0907930
                          LD      NEG       NEGATIVE CONSTANT INDR      K0907940
                          BSC  L  GCONX,+-  EXIT IF POSITIVE            K0907950
                          LD    3 -1        LAST WORD (THIRD OR SECOND) K0907960
                          MDX  L  EXTND,0   SKIP NEXT IF EXTENDED PREC  K0907970
                          AND     HFF00     MASK OUT EXPONENT           K0907980
                          STO     WD+1      SAVE FOR COMPLEMENT         K0907990
                          EOR   3 -1        IF NORMAL, SET EXPONENT     K0908000
                          STO     EXP       IF EXTENDED, SET ZERO       K0908010
                          SRT     24        CLEAR ACC AND EXT           K0908020
                          SD      WD        COMPLEMENT MANTISSA         K0908030
                          STO   1 -2        (LAST-1) WORD TO WORK       K0908040
                          RTE     16        LAST WORD                   K0908050
                          OR      EXP       SET EXPONENT IF NORMAL PREC K0908060
                          STO   1 -1        LAST WORD TO WORK           K0908070
                          MDX     GCONX     EXIT                        K0908080
                    *                                                   K0908090
                    WD    BSS  E  2         TEMP FOR COMPLEMENTING      K0908100
                    EXTND DC      0         NORMAL PRECISION=NONZERO    K0908110
                    HFF00 DC      /FF00     HIGH ORDER 8-BIT MASK       K0908120
                    EXP   DC      0         EXPONENT FOR NORMAL PREC    K0908130
                    *                                                   K0908140
                    *             PROCESS INTEGER CONSTANTS             K0908150
                    *                                                   K0908160
                    GCON3 LD    3 0         LOOK FOR PARTIAL WORD SPEC  K0908170
                          AND     H7E00     EXTRACT 1ST CHAR OF SYMBOL  K0908180
                          EOR     SYMZ      CHECK FOR A Z               K0908190
                          BSC  L  BPWS,+-   BRANCH IF SO.               K0908200
                          MDX     *+5       BR TO CHECK FOR OPERATOR    K0908210
                          LD    3 0         LOAD CHARACTER              K0908220
                          EOR  L  LPAR      CHK FOR LEFT PARENTHESIS    K0908230
                          BSC  L  FPWS,+-   BR IF LEFT PARENTHESIS      K0908240
                          LD    3 0         CHK FOR OPERATOR            K0908250
                          BSC  L  ERR8,-    BRANCH IF SO (ERROR).       K0908260
                          BSI  L  GCONI     GET INTEGER                 K0908270
                          BSI  L  INCRP     INCR WORK AREA POINTER      K0908280
                          MDX     GCONX     EXIT                        K0908290
                    FPWS  LD      NEG       NEGATIVE CONSTANT INDICATOR K0908300
                          BSC  L  ERR10,Z   BR IF NEG PARTIAL WORD      K0908310
                          SRA     16        CLEAR ACCUMULATOR           K0908320
                          STO     PW        CLEAR PARTIAL WD ACC        K0908330
                          STO     PWTOT     CLEAR PARTIAL WORD COUNT    K0908340
                    *                                                   K0908350
                    *             PROCESS PARTIAL WORD CONSTANTS        K0908360
                    *                                                   K0908370
                    GCON9 MDX   3 1         DISCARD DELIMITER           K0908380
                          BSI  L  GCONI     GET INTEGER                 K0908390
                          LD    1 0         COUNT FROM WORK AREA        K0908400
                          STO     PWCT      SAVE COUNT FOR THIS FIELD   K0908410
                          A       PWTOT     UPDATE TOTAL COUNT          K0908420
                          STO     PWTOT     RESTORE                     K0908430
                          S       L16       DECIMAL 16                  K0908440
                          BSC  L  *+3,+     BR PRATIAL WORD COUNT OK    K0908450
                    ERR12 LDX  X1 D12       PARTIAL WD CNT GT 16        K0908460
                          BSC  L  ERR       BR TO SET UP ERROR 79       K0908470
                          LD   L  CONL      CONSTANT LENGTH             K0908480
                          BSC  L  ERR12,+-  BR CONSTANT NOT FOUND       K0908490
                          LD    3 0         NEXT STMNT WORD             K0908500
                          S       EQSGN     EQUAL SIGN                  K0908510
                          BSC  L  ERR12,Z   BR NO EQUAL SIGN            K0908520
                          MDX   3 1         INCR STMNT POINTER          K0908530
                          BSI  L  GCONI     GET INTEGER                 K0908540
                          STX   2 SAV2+1    SAVE INDEX REG 2            K0908550
                    PWCT  EQU     *+1       PARTIAL WD ELEMENT LENGTH   K0908560
                          LDX  L2 *-*       GET SHIFT COUNT             K0908570
                          LD    1 0         HEADER WD FROM WORK AREA    K0908580
                          SRT   2 0                                     K0908590
                          BSC  L  ERR12,Z   BR IF CONSTANT TOO LARGE    K0908600
                          LD      PW        PARTIAL WORD TO ACCUMULATOR K0908610
                          SLT   2 0         PUT IN NEW FIELD            K0908620
                    SAV2  LDX  L2 *-*       RESTORE INDEX REG 2         K0908630
                          STO     PW        STORE UPDATED PARTIAL WORD  K0908640
                          LD    3 0         NEXT STMNT WORD             K0908650
                          S    L  COMMA     COMMA CONSTANT              K0908660
                          BSC  L  GCON9,+-  BR TO GET NEXT FIELD IF ANY K0908670
                          LD    3 0         NEXT STMNT WORD             K0908680
                          S    L  RPAR      RIGHT PARENTHESIS CONSTANT  K0908690
                          BSC  L  ERR12,Z   ERROR IF NOT RT PARENTHESIS K0908700
                          LD      PW        PARTIAL WORD                K0908710
                          STO   1 0         TO WORK AREA                K0908720
                          BSI  L  INCRP     INCR WORK AREA POINTER      K0908730
                          MDX   3 1         INCR STMNT POINTER          K0908740
                          STX  L3 K         SAVE AS K                   K0908750
                          LDX   3 1         SET INTEGER SWITCH          K0908760
                          STX  L3 CONTP     CONSTANT TYPE               K0908770
                          STX  L3 CONL      CONSTANT LENGTH             K0908780
                          MDX     SAV3      BR TO RESTORE XR3 AND EXIT  K0908790
                    GCONX STX  L3 K         SAVE K                      K0908800
                    SAV3  LDX  L3 *-*       RESTORE XR3                 K0908810
                          BSC  I  GCON      EXIT                        K0908820
                    *                                                   K0908830
                    *             CONSTANTS AND WORK AREA               K0908840
                    *                                                   K0908850
                    PW    BSS     1         PARTIAL WORD TEMPORARY      K0908860
                    PWTOT BSS     1         PARTIAL WORD TOTAL LENGTH   K0908870
                    L16   DC      16        PARTIAL WD COUNT LIMIT      K0908880
                    H7E00 DC      /7E00     MASK TO GET 1ST CHAR        K0908890
                    SYMZ  DC      /5200     Z DENOTES HEX DIGITS FOLLOW K0908900
                    PW1   BSS  E  1         HOLDS 1-4 CHARACTERS (HEX   K0908910
                    PW2   BSS     1         DIGITS W/ Z PRECEDING).     K0908920
                    HC000 DC      /C000     MASK TO GET ZONE BITS       K0908930
                    HF000 DC      /F000     MASK TO GET NUMERIC PART    K0908940
                    H9000 DC      /9000     GT THAN WHICH ARE CHARS     K0908950
                    H1800 DC      /1800     ADD TO NO. PART TO GET BIN  K0908960
                    HFC00 DC      /FC00     MASK TO GET 1ST CHAR        K0908970
                    EQSGN DC      /3E       =                           K0908980
                    *                                                   K0908990
                    *             CONTINUE PROCESSING PARTIAL WD CONS   K0909000
                    *                                                   K0909010
                    BPWS  LD   L  NEG       CHK FOR NEGATIVE            K0909020
                          BSC  L  ERR10,Z   BRANCH IF SO (ERROR).       K0909030
                          STO     PW        CLEAR PARTIAL WORD          K0909040
                          STO     PW2       ZERO 2ND HALF OF SYMBOL     K0909050
                          LD    3 0         CHECK FIRST CHAR AFTER      K0909060
                          SLA     7         THE Z, MUST BE NON-BLANK.   K0909070
                          AND     HFC00     EXTRACT THE CHAR            K0909080
                          BSC  L  ER14,+-   BR TO SET UP ERROR IF BLANK K0909090
                          SLT     32        CLEAR EXTENSION             K0909100
                          LD    3 0         GET 1ST HALF                K0909110
                          SLA     1         SHIFT OUT INDICATOR BIT     K0909120
                          STO     PW1       SAVE IN PW1 TEMPORARY       K0909130
                          LD    3 1         CHECK FOR 3-5 CHARS         K0909140
                          BSC  L  SYMGT,-   BRANCH IF NOT               K0909150
                          SLA     1         SHIFT OUT INDICATOR BIT     K0909160
                          SRA     1         REPLACE IT W/ ZERO, MOVE    K0909170
                          SRT     14        LAST 15 BITS TO Q, TO LEAVE K0909180
                          OR      PW1       THE CHARACTERS CONTIGUOUS   K0909190
                          STO     PW1       AND LEFT JUSTIFIED IN       K0909200
                          RTE     16        PW1 AND PW2.                K0909210
                          STO     PW2                                   K0909220
                          MDX   3 1         INCREMENT STRING POINTER    K0909230
                          LD    3 1         CHECK TO BE SURE THE NEXT   K0909240
                          BSC  L  ERR12,+Z  CHAR IS AN OPERATOR, BR NOT K0909250
                    SYMGT STX   2 X2S+1     SAVE X2                     K0909260
                          LDX   2 6         SET SHIFT COUNTER FOR 1ST   K0909270
                    GTHD  LDD     PW1       LOAD THE PW SPEC ZHHHH      K0909280
                          SLT   2 0         GET THE NTH CHARACTER       K0909290
                          AND     HC000     CHK ZONE BITS               K0909300
                          BSC  L  CKAD,+-   BR IF A TO F.               K0909310
                          S       HC000     ELSE IT MUST BE NUMERIC,    K0909320
                          BSC  L  ER14,Z    ERROR IF NOT.               K0909330
                          LDD     PW1       GET THE DIGIT, IN 6-BIT     K0909340
                          SLT   2 0         CODE, LEFT JUSTIFY IN ACC.  K0909350
                          SLA     2         STRIP ZONE BITS             K0909360
                          AND     HF000     DROP OTHER DIGITS           K0909370
                          BSC  L  PTHD,+-   BRANCH ON DIGIT ZERO        K0909380
                          S       H9000     CHK WITHIN RANGE 0 TO 9     K0909390
                          BSC  L  ER14,-Z   BR NOT 0 TO 9               K0909400
                          A       H9000     (RESTORE ACTUAL VALUE)      K0909410
                    PTHD  SRT     16        LEFT JUSTIFY DIGIT IN EX-   K0909420
                          LD      PW        TENSION, THEN APPEND IT TO  K0909430
                          SLT     4         THE PARTIAL WD BEING BUILT. K0909440
                          STO     PW                                    K0909450
                          MDX   2 6         INCR XR2 TO GET NEXT CHAR   K0909460
                          MDX     GTHD      BR TO GET CHARACTER         K0909470
                    CKAD  LDD     PW1       CHECK DIGITS A-F.           K0909480
                          SLT   2 0         GET THE CHARACTER           K0909490
                          AND     HFC00     DROP OTHER CHARACTERS       K0909500
                          BSC  L  ENDHD,+   EXIT IF 000000              K0909510
                          S       H1800     CHECK TO SEE IF IN RANGE    K0909520
                          BSC  L  ER14,-Z   BRANCH IF NOT A-F.          K0909530
                          A       HFC00     ADD BACK 1800 PLUS 2400 TO  K0909540
                          SLA     2         GET BINARY EQUIVALENT.      K0909550
                          MDX     PTHD      INSTALL IN PARTIAL WORD     K0909560
                    ENDHD LD      PW        PARTIAL WORD TEMPORARY      K0909570
                          STO   1 0         STORE PARTIAL WD            K0909580
                          BSI  L  INCRP     INCR WORK AREA POINTER      K0909590
                          MDX   3 1         K=K+1                       K0909600
                          STX  L3 K         SAVE K                      K0909610
                          LDX   3 1                                     K0909620
                          STX  L3 CONTP     CONSTANT TYPE               K0909630
                          STX  L3 CONL      CONSTANT LENGTH             K0909640
                    X2S   LDX  L2 *-*       RESTORE XR2                 K0909650
                          MDX     SAV3      BR TO RESTORE XR3 AND EXIT  K0909660
                    ER14  LDX   1 D14       ERROR - CHAR NOT A-F IN     K0909670
                          BSC  L  ERR       PARTIAL WORD SPEC.          K0909680
                    *                                                   K0909690
                    * THIS SUBROUTINE IS USED BY GCON TO GET AN INTEGER K0909700
                    * CONST WHICH IS PUT IN NEXT AVAIL WORK AREA WORD.  K0909710
                    * WK AREA POINTER IS UPDATED.                       K0909720
                    *                                                   K0909730
                    GCONI BSS     1         RETURN ADDRESS              K0909740
                          SLT     32        CLEAR ACC AND EXTENSION     K0909750
                          STO   1 0         CLEAR NEXT WORK AREA WORD   K0909760
                          LD    3 0         NEXT STMNT WORD             K0909770
                          STD     NOS       SAVE INTEGER WORD 1         K0909780
                          MDX   3 1         INCR STMNT POINTER          K0909790
                          LD    3 0         NEXT STMNT WORD             K0909800
                          BSC  L  GCON6,-   BR IF NO WORD 2             K0909810
                          SLA     1         KNOCK OUT HIGH BIT          K0909820
                          STO     NOS+1     SAVE INTEGER WORD 2         K0909830
                          MDX   3 1         INCR STMNT POINTER          K0909840
                    GCON6 LDS     0         CLEAR CARRY BIT             K0909850
                          LD      NOS       INTEGER TEMPORARY           K0909860
                    GCON7 SLA     2                                     K0909870
                          BSC  L  *+3,C     BR IF NOT FINISHED          K0909880
                          BSC  L  ERR6,Z    BR TO ERROR IF NOT A DIGIT  K0909890
                          MDX     GCON8     BR FINISHED                 K0909900
                          BSC  L  ERR6,-    BR TO ERROR IF NOT A DIGIT  K0909910
                          SLA     1         STRIP OFF ZONE BITS         K0909920
                          SRA     12        ISOLATE DIGIT               K0909930
                          STO  L  NOST      SAVE DIGIT                  K0909940
                          S       NINE      DIGIT LIMIT VALUE           K0909950
                          BSC  L  ERR6,-Z   BR IF NOT A DECIMAL DIGIT   K0909960
                          LD    1 0         ACCUMULATED TOTAL           K0909970
                          M       TEN       MPY BY 10                   K0909980
                          SLT     1                                     K0909990
                          BSC  L  ERR6,Z    BR IF VALUE TOO LARGE       K0910000
                          SLT     15        SHIFT INTO ACCUMULATOR      K0910010
                          A    L  NOST      ADD LATEST DIGIT            K0910020
                          BSC  L  ERR6,O    BR IF VALUE TOO LARGE       K0910030
                          STO   1 0         UPDATE ACCUMULATED TOTAL    K0910040
                          LDD     NOS       INTEGER TEMPORARY           K0910050
                          SLT     6         SHIFT OFF PROCESSED DIGIT   K0910060
                          STD     NOS       RESTORE                     K0910070
                          MDX     GCON7     BR TO FIND NEXT DIGIT       K0910080
                    GCON8 S     1 0         NEGATE INTEGER              K0910090
                          MDX  L  NEG,0     SKIP NEXT IF NEG INDR OFF   K0910100
                          STO   1 0         SET INTEGER NEGATIVE        K0910110
                          MDX  L  CONL,1    INCR CONSTANT LENGTH        K0910120
                          MDX  L  CONTP,1   INCR CONSTANT TYPE          K0910130
                          BSC  I  GCONI     EXIT                        K0910140
                    *                                                   K0910150
                    *             CONSTANTS, WORK, AND PATCH AREA       K0910160
                    *                                                   K0910170
                    TEN   DC      10        DECIMAL 10 MPY CONSTANT     K0910180
                    NOS   BSS  E  2         INTEGER TEMPORARY STORE     K0910190
                    NINE  DC      9         DECIMAL 9 DIGIT LIMIT CON   K0910200
                    PATCH BSS     /7E25-*  PATCH AREA                   K0910210
                          DC      0                                     K0910220
                    WORK  BSS     ROL-50-*  ORIGIN OF OUTPUT DATA STMNT K0910230
                    WKEND EQU     *         END OF WK AREA + 1          K0910240
                    *                                                   K0910250
                          END     BPHAR-2                               K0910260
