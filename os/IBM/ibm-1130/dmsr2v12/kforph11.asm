                          HDNG    1130 FORTRAN COMPILER PHASE 11        K1100010
                    *************************************************** K1100020
                    *                                                 * K1100030
                    *STATUS - VERSION 2  MODIFICATION 12              * K1100040
                    *                                                 * K1100050
                    *FUNCTION/OPERATION-                              * K1100060
                    *   * BYPASSES ALL FORMAT, CONTINUE AND ERROR     * K1100070
                    *     STATEMENTS.                                 * K1100080
                    *   * SCANS ALL OTHER STATEMENTS BUT OPERATES ONLY* K1100090
                    *     ON THOSE STATEMENTS CONTAINING THE SPECIAL  * K1100100
                    *     LEFT PARENTHESIS OPERATOR INSERTED BY PHASE8* K1100110
                    *   * CHECKS SUBSCRIPTING INFORMATION FOR EACH    * K1100120
                    *     VARIABLE FOR VALIDITY.                      * K1100130
                    *   * CALCULATES THE SUBSCRIPT CONSTANT D4 AND,   * K1100140
                    *     DEPENDING ON THE DIMENSIONING LEVEL, THE    * K1100150
                    *     CONSTANTS D1, D2, AND D3.                   * K1100160
                    *   * INSERTS THE SUBSCRIPT CONSTANTS INTO THE    * K1100170
                    *     SUBSCRIPT EXPRESSION WITH THE SUBSCRIPT     * K1100180
                    *     INDICES.                                    * K1100190
                    *   * CHANGES THE RIGHT AND LEFT PARENTHESIS      * K1100200
                    *     ENCLOSING THE SUBSCRIPT EXPRESSION TO       * K1100210
                    *     SPECIAL OPERATORS TO BE USED IN A LATER     * K1100220
                    *     PHASE.                                      * K1100230
                    *   * CHECKS ARITHMETIC STATEMENTS FOR         2-11 K1100240
                    *     COMMAS INCORRECTLY PLACED                2-11 K1100250
                    *                                                 * K1100260
                    *ENTRY POINTS-                                    * K1100270
                    *   * START-PHASE 11 IS READ INTO CORE BY THE ROL * K1100280
                    *     PROGRAM AND EXECUTION BEGINS AT THIS ADDRESS* K1100290
                    *                                                 * K1100300
                    *INPUT-                                           * K1100310
                    *   * THE STATEMENT STRING                        * K1100320
                    *   * THE SYMBOL TABLE                            * K1100330
                    *   * FCOM                                        * K1100340
                    *                                                 * K1100350
                    *OUTPUT-                                          * K1100360
                    *   * THE MODIFIED STATEMENT STRING               * K1100370
                    *   * THE SYMBOL TABLE                            * K1100380
                    *   * FCOM                                        * K1100390
                    *                                                 * K1100400
                    *EXTERNAL REFERENCES-                             * K1100410
                    *   SUBROUTINES-                                  * K1100420
                    *      * ROL                                      * K1100430
                    *   COMMA/DCOM-                                   * K1100440
                    *      * $PHSE                                    * K1100450
                    *                                                 * K1100460
                    *EXITS                                            * K1100470
                    *   NORMAL-                                       * K1100480
                    *      * EXITS VIA A CALL TO THE ROL SUBROUTINE TO* K1100490
                    *        READ IN THE NEXT PHASE                   * K1100500
                    *                                                 * K1100510
                    *   ERROR-                                        * K1100520
                    *      * OVERLAP-NO PROCESSING OCCURS AND AN EXIT * K1100530
                    *        IS MADE VIA ROL AS FOR NORMAL EXITS      * K1100540
                    *      * COMPILATION ERRORS DETECTED BY THIS PHASE* K1100550
                    *        ARE 31, 32, 33, 34 AND 35.               * K1100560
                    *                                                 * K1100570
                    *TABLES/WORK AREAS-N/A                            * K1100580
                    *                                                 * K1100590
                    *ATTRIBUTES- NONE.                                * K1100600
                    *                                                 * K1100610
                    *NOTES- THE SWITCHES USED IN PHASE 11 FOLLOW.  IF * K1100620
                    *   NON-ZERO, THE SWITCH IS TRANSFER=T.  IF ZERO, * K1100630
                    *   THE SWITCH IS NORMAL=N.                       * K1100640
                    *      SW1 - SIGN CONDITION INDICATOR             * K1100650
                    *          N=PLUS SIGN FOUND                      * K1100660
                    *          T=MINUS SIGN FOUND                     * K1100670
                    *      SW2 - SIGN FOUND INDICATOR                 * K1100680
                    *          T=SIGN FOUND                           * K1100690
                    *          N=SING NOT FOUND                       * K1100700
                    *      SW3 - RIGHT PARENTHESIS INDICATOR          * K1100710
                    *          T=RIGHT PARENTHESIS FOUND              * K1100720
                    *      SW4 - STRING CLOSE INDICATOR               * K1100730
                    *          T=STRING CLOSURE REQUIRED              * K1100740
                    *                                                 * K1100750
                    *************************************************** K1100760
                          HDNG    1130 FORTRAN COMPILER PHASE 11        K1100770
                          ABS                                           K1100780
                    *                                                   K1100790
                    *             SYSTEM EQUATES                        K1100800
                    MEMRY EQU     /8000     CORE SIZE                   K1100810
                    OVERL EQU     MEMRY-1500  PHASE OVERLAY AREA SIZE   K1100820
                    ROL   EQU     MEMRY-68  LOC OF RTN TO READ NEXT PH  K1100830
                    $PHSE EQU     /78       NO. OF PHASE NOW IN CORE    K1100840
                          ORG     OVERL                                 K1100850
                    PHID  EQU     41        ID NUMBER THIS PHASE        K1100860
                    *                                                   K1100870
                    *                  FORTRAN COMMUNICATION AREA       K1100880
                    *                                                   K1100890
                    SOFS  BSS     1    START OF STRING                  K1100900
                    EOFS  BSS     1    END OF STRING                    K1100910
                    SOFST BSS     1    START OF SYMBOL TABLE            K1100920
                    SOFNS BSS     1    START OF NON-STATEMENT NUMBERS   K1100930
                    SOFXT BSS     1    START OF SUBSCRIPT TEMPORARIES   K1100940
                    SOFGT BSS     1    START OF GENERATED TEMPORARIES   K1100950
                    EOFST BSS     1    END OF SYMBOL TABLE              K1100960
                    COMON BSS     1    NEXT AVAILABLE COMMON            K1100970
                    CSIZE BSS     1    SIZE OF COMMON                   K1100980
                    ERROR BSS     1    OVERLAP ERROR                    K1100990
                    FNAME BSS     2    PROGRAM NAME                     K1101000
                    SORF  BSS     1    SUBROUTINE(-) OR FUNCTION(+)     K1101010
                    CCWD  BSS     1    CONTROL CARD WORD                K1101020
                    *                BIT 15 TRANSFER TRACE              K1101030
                    *                BIT 14 ARITHMETIC TRACE            K1101040
                    *                BIT 13 EXTENDED PRECISION          K1101050
                    *                BIT 12 LIST SYMBOL TABLE           K1101060
                    *                BIT 11 LIST SUBPROGRAM NAMES       K1101070
                    *                BIT 10 LIST SOURCE PROGRAM         K1101080
                    *                BIT  9 ONE WORD INTEGERS           K1101090
                    *                BIT  8 PUNCH                       K1101100
                    *                BIT  7 NONPROCESS PROGRAM          K1101110
                    IOCS  BSS     1    IOCS CONTROL CARD WORD           K1101120
                    *                BIT 15 CARD                        K1101130
                    *                BIT 14 PAPER TAPE                  K1101140
                    *                BIT 13 TYPEWRITER                  K1101150
                    *                BIT 12 1443 PRINTER                K1101160
                    *                BIT 11 MAGNETIC TAPE               K1101170
                    *                BIT 10 KEYBOARD                    K1101180
                    *                BIT  8 DISK                        K1101190
                    *                BIT  3 PLOTTER                     K1101200
                    *                BIT  1 UNFORMATTED DISK            K1101210
                    DFCNT BSS     1         FILE TABLE WORD COUNT       K1101220
                    *                                                   K1101230
                    *                                                   K1101240
                    *                                                   K1101250
                    *                  END OF FORTRAN COMMUNICATION     K1101260
                    *                  AREA                             K1101270
                    *                                                   K1101280
                    BPHAR EQU     *+2       BEGIN PH AREA               K1101290
                          DC      0         LOADER WORK AREA            K1101300
                          DC      -41       -PHASE ID FOR SLET LOOKUP   K1101310
                          DC      NXTPH-*+1 TABLE FOR NEXT PHASE ENTRY  K1101320
                          DC      1         ONE ENTRY TO BE SET BY LDR  K1101330
                          ORG     *-2                                   K1101340
                    START LDX   1 PHID      GET ID THIS PHASE           K1101350
                          STX  L1 $PHSE     STORE IN SYSTEM PHASE AREA  K1101360
                    *                                                   K1101370
                    *             CHECK FOR OVERLAP ERROR               K1101380
                    *                                                   K1101390
                          LD      ERROR     IF OVERLAP ERROR THEN BR TO K1101400
                          BSC  L  OUT,Z     READ IN NEXT PH AND EXECUTE K1101410
                    *                                                   K1101420
                    *             INITIALIZE PHASE                      K1101430
                    *                                                   K1101440
                          LDX  I1 SOFS      START OF FIRST STMNT ADDR   K1101450
                    *                                                   K1101460
                    *             CHECK STATEMENT TYPE                  K1101470
                    *                                                   K1101480
                    TEST  LD    1 0         STMNT ID WORD               K1101490
                          SRA     1         POSITION TO TEST STMNT TYPE K1101500
                          AND     IDTPE     EXTRACT STMNT TYPE BITS     K1101510
                          BSC  L  ARITH,+-  BRNCH IF ARITH STMT     212 K1101520
                    RTRN  S       ENDC      END STMT CONSTANT       212 K1101530
                          BSC  L  OUT,+-    BR IF END TO RD NEXT PHASE  K1101540
                          S       ERRC      ERROR STMNT CONSTANT        K1101550
                          BSC  L  MOVE,+-   BR IF ERR TO GET NEXT STMNT K1101560
                          S       FORMC     FORMAT STMNT CONSTANT       K1101570
                          BSC  L  MOVE,+-   BR IF FORMAT TO NEXT STMNT  K1101580
                          S       CONTC     CONTINUE STMNT CONSTANT     K1101590
                          BSC  L  MOVE,+-   BR IF CONTINUE TO GET NEXT  K1101600
                          S       FIOC      FIO STMNT CONSTANT          K1101610
                          BSC  L  MOVE,+-   BR IF FIO TO GET NEXT STMNT K1101620
                          S       DFL       DEFINE FILE STMNT CONSTANT  K1101630
                          BSC  L  MOVE,+-   BR IF DEFINE FILE- GET NEXT K1101640
                          S       CEXT      CALL EXIT OR LINK CONSTANT  K1101650
                          BSC  L  MOVE,+-   BR TO GET NEXT IF EXIT-LINK K1101660
                          S       DATAS     DATA STMNT CONSTANT         K1101670
                          BSC  L  MOVE,+-   BR TO GET NEXT IF DATA      K1101680
                    *                                                   K1101690
                    *             INITIALIZE TO SCAN STATEMENT          K1101700
                    *                                                   K1101710
                          SLA     16        ZERO ACCUMULATOR            K1101720
                          STO     SW4       CLEAR STRING CLOSE SWITCH   K1101730
                          STO  L  HOB       STRING CLOSE VALUE          K1101740
                          STX   1 IDSAV     SAVE STMNT START ADDRESS    K1101750
                          LD    1 0         STMNT ID WORD               K1101760
                          SRA     2         RIGHT JUSTIFY STMNT WD CNT  K1101770
                          AND  L  IDNRM     EXTRACT WORD COUNT          K1101780
                          STO  L  NRMSV     STMNT WORD COUNT TEMPORARY  K1101790
                          LD    1 0         STMNT WORD COUNT            K1101800
                          BSC     E         SKIP NEXT IF NO STMNT NO.   K1101810
                          MDX   1 1         INCR TO BYPASS STMNT NUMBER K1101820
                          MDX   1 1         INCR STMNT POINTER          K1101830
                    *                                                   K1101840
                    *             CHK FOR STMNT TERMINATOR (SEMICOLON)  K1101850
                    *                                                   K1101860
                    TEST1 LD    1 0         NEXT STMNT WORD             K1101870
                          BSC  L  O,+-      BR IF SEMICOLON             K1101880
                    *                                                   K1101890
                    *             CHECK FOR DIMENSION SUBSCRIPTS        K1101900
                    *                                                   K1101910
                          S       SUB1      ONE-DIMENSIONAL SUBSCRIPT   K1101920
                          BSC  L  ABEL,+-   BR IF ONE-DIMENSIONAL SIBSC K1101930
                          S       SUB3      SUBSCRIPT CONSTANT          K1101940
                          BSC  L  ABEL,+-   BR IF TWO-DIMENSIONAL SUBSC K1101950
                          S       SUB3      SUBSCRIPT CONSTANT          K1101960
                          BSC  L  ABEL,+-   BR IF 3-DIMENSIONAL SUBSC   K1101970
                    L     MDX   1 1         MOVE STMNT POINTER          K1101980
                          MDX     TEST1     BR TO TEST FOR SEMICOLON    K1101990
                    *                                                   K1102000
                    *             CONSTANTS AND WORK AREA               K1102010
                    *                                                   K1102020
                    SW1   DC      0         SIGN CONDITION INDR         K1102030
                    SW2   DC      0         SIGN FOUND INDR             K1102040
                    SW3   DC      0         RIGHT PARENTHESIS INDR      K1102050
                    SW4   DC      0         STRING CLOSE REQUIRED INDR  K1102060
                    IDTPE DC      /7C00     STMNT TYPE MASK             K1102070
                    ENDC  DC      /0800     END STMNT CONSTANT          K1102080
                    ERRC  DC      /5000-/0800  ERROR STMNT CONSTANT     K1102090
                    FORMC DC      /3000-/5000  FORMAT STMNT CONSTANT    K1102100
                    CONTC DC      /5800-/3000  CONTINUE STMNT CONSTANT  K1102110
                    FIOC  DC      /6C00-/5800  FIO STMNT CONSTANT       K1102120
                    DFL   DC      /7800-/6C00  DEFINE FILE STMNT CON    K1102130
                    CEXT  DC      /7000-/7800  CALL EXIT-LINK STMNT CON K1102140
                    DATAS DC      /7C00-/7000  DATA STMNT CONSTANT      K1102150
                    IDSAV DC      0         STMNT ID ADDR TEMPORARY     K1102160
                    SUB1  DC      /001A     ONE-DIMENSIONAL SUBSC CON   K1102170
                    SUB3  DC      /0002     DIMENSION SUBSCRIPT CON     K1102180
                    Y     DC      0         STMNT POINTER TEMPORARY     K1102190
                    MASK  DC      /07FF     SYMBOL TABLE POINTER MASK   K1102200
                    SAVE  DC      0         SYMBOL TABLE ADDR TEMPORARY K1102210
                    THREE DC      /FFFD     MINUS 3 CONSTANT            K1102220
                    IJMAX DC      0         FIRST DIMENSION FACTOR TEMP K1102230
                    IMAX  DC      0         2ND DIMENSION FACTOR TEMP   K1102240
                          BSS  E  0         MAKE ADDRESS EVEN           K1102250
                    TEM   DC      0         1ST WD BINARY CONSTANT TEMP K1102260
                          DC      0         2ND WD BINARY CONSTANT TEMP K1102270
                    COT1  DC      /7E00     BINARY CON HIGH DIGIT MASK  K1102280
                    COT2  DC      /7800     4 BIT DIGIT MASK            K1102290
                    NINT  DC      /4800     DECIMAL 9 DIGIT LIMIT CON   K1102300
                    HELP1 DC      0         DIGIT TEMPORARY             K1102310
                    TEMPT DC      0         PARTIAL PRODUCT TEMPORARY   K1102320
                    MASK1 DC      /FFFF     ONE COMPLEMENT MASK         K1102330
                    ASTK  DC      /001C     ASTERISK CONSTANT           K1102340
                    SUMM  DC      0         CUMULATIVE CONVERTED SUM    K1102350
                    *                                                   K1102370
                    *             ARITHMETIC STATEMENT FUNCTION         K1102380
                    *                                                   K1102390
                    ABEL  LD   I  IDSAV     STMNT ID WORD               K1102400
                          SRA     11        RIGHT JUSTIFY STMNT TYPE    K1102410
                          S       SUB1      STMNT FUNCTION CONSTANT     K1102420
                          BSC  L  ABELL,Z   BR IF NOT ARITH STMNT FUNC  K1102430
                          LDX   1 ERR32     SUBSC VAR IN STMT FUNC  212 K1102440
                          B    L  STORE     BR-REPLACE STMT W/ERROR 212 K1102450
                    *             GET DIMENSION INFORMATION             K1102480
                    *                                                   K1102490
                    ABELL STX   1 Y         SAVE STMNT POINTER          K1102500
                          MDX   1 1         INCR STMNT POINTER          K1102510
                          SLA     16        CLEAR ACCUMULATOR           K1102520
                          STO     SW1       CLEAR SIGN CONDITION INDR   K1102530
                          STO     SW2       CLEAR SIGN FOUND INDR       K1102540
                          STO     SW3       CLEAR RIGHT PAREN INDR      K1102550
                          STO  L  GO        CLEAR COMMA COUNT TEMP      K1102560
                          STO  L  D4        ZERO SUBSC CONSTANT 4       K1102570
                          STO  L  CNT       ZERO SUBSC ELEMENT COUNT    K1102580
                          STO  L  D1        ZERO SUBSC CONSTANT 1       K1102590
                          STO  L  D2        ZERO SUBSC CONSTANT 2       K1102600
                          STO  L  D3        ZERO SUBSC CONSTANT 3       K1102610
                          STO  L  D4        ZERO SUBSC CONSTANT 4       K1102620
                          STO  L  A         DIMENSION VALUE CON TEMP212 K1102630
                          STO     B         DIMENSION VALUE CON TEMP    K1102640
                          LD    1 -2        SYMBOL TABLE POINTER WD     K1102650
                          AND     MASK      EXTRACT POINTER             K1102660
                          M       THREE     WORDS PER ENTRY             K1102670
                          SLT     16        MOVE TO ACCUMULATOR         K1102680
                          A    L  SOFST     START OF SYMBOL TABLE ADDR  K1102690
                          STO     SAVE      SAVE SYMBOL TABLE ADDR      K1102700
                          LDX  I3 SAVE      XR3= SYMBOL TABLE ADDR      K1102710
                          LD    3 +1                                    K1102720
                          STO     IJMAX     1ST DIMENSION CONSTANT      K1102730
                          LD    3 +2                                    K1102740
                          STO     IMAX      2ND DIMENSION CONSTANT      K1102750
                          LD    3 +3                                    K1102760
                          STO  L  HOLD      3RD DIMENSION CONSTANT      K1102770
                    *                                                   K1102780
                    *             CHK FOR OPERATOR, NAME, OR CONSTANT   K1102790
                    *                                                   K1102800
                    G     LD    1 0         NEXT STMND WORD             K1102810
                          BSC  L  ER33,-    BR IF OPERATOR          212 K1102820
                          SLA     2                                     K1102830
                          BSC  L  *+1,C     BR TO TEST SIGN IF CARRY ON K1102840
                          MDX     D         BR IF NOT CARRY - NAME      K1102850
                          BSC  L  D,-                                   K1102860
                          LDS     0         RESET STATUS INDRS          K1102870
                          SLT     32        CLEAR ACC AND EXTENSION     K1102880
                          STO     SUMM      ACCUMULATED CONVERTED CON   K1102890
                          LD    1 0         FIRST CONSTANT WORD         K1102900
                          STD     TEM       CONSTANT TEMPORARY          K1102910
                          LD    1 1         NEXT STMNT WORD             K1102920
                          BSC  L  COLL,-    BR TO CONVERT TO BINARY     K1102930
                          SLA     1         SHIFT OFF INDR BIT          K1102940
                          STO     TEM+1     SECOND CONSTANT WORD        K1102950
                          LD    1 2         NEXT STMNT WORD             K1102960
                          MDX   1 1         INCR STMNT POINTER          K1102970
                          BSC  L  ER33,+Z   BR IF 3RD WORD          212 K1102980
                    *                                                   K1102990
                    *             COLLECT CONSTANT TO BINARY            K1103000
                    *                                                   K1103010
                    COLL  LD      TEM       FIRST CONSTANT WORD         K1103020
                          AND     COT1      EXTRACT HIGH CHARACTER      K1103030
                          SLA     2                                     K1103040
                          BSC  L  PILL,C    BR TO TEST SIGN IF CARRY ON K1103050
                          BSC  L  NEX,+-    BR TO CHK SIGN CONDITION SW K1103060
                          BSC  L  ER33      BR IF NON-DIGIT CHAR    212 K1103070
                    PILL  BSC  L  ER33,-    BR IF NON-DIGIT CHAR    212 K1103080
                          AND     COT2      EXTRACT BCD DIGIT           K1103090
                          S       NINT      NINE                        K1103100
                          BSC  L  ER33,-Z   BR IF .GT. 9            212 K1103110
                          A       NINT      RESTORE DIGIT               K1103120
                          SRA     11        RIGHT JUSTIFY               K1103130
                          STO     HELP1     UNITS DIGIT TEMPORARY       K1103140
                          LD      SUMM      CUMULATIVE SUM OF CONSTANT  K1103150
                          SLA     1         TIMES 2                     K1103160
                          STO     TEMPT     SAVE                        K1103170
                          BSC  L  ER33,+Z   BR IF TOO LARGE         212 K1103180
                          SLA     2         TIMES 8                     K1103190
                          BSC  L  ER33,C+Z  BR IF TOO LARGE         212 K1103200
                          A       TEMPT     TIMES 10                    K1103210
                          A       HELP1     UNITS DIGIT                 K1103220
                          BSC  L  ER33,O+Z  BR IF TOO LARGE         212 K1103230
                          STO     SUMM      NEW CUMULATIVE SUM          K1103240
                          LDD     TEM       TWO-WD CONSTANT TEMPORARY   K1103250
                          SLT     6         SHIFT OFF CONVERTED DIGIT   K1103260
                          STD     TEM       RESTORE CONSTANT            K1103270
                          MDX     COLL+1    BR TO CONVERT NEXT DIGIT    K1103280
                    NEX   LD   L  SW1       SIGN CONDITION SWITCH       K1103290
                          BSC  L  C,Z       BR IF MINUS SIGN            K1103300
                          LD      SUMM      CONVERTED CONSTANT          K1103310
                          MDX     C+3       BR TO STORE IN B            K1103320
                    C     LD      SUMM      CONVERTED CONSTANT          K1103330
                          EOR     MASK1     ONES COMPLIMENT             K1103340
                          A       ONE       TWOS COMPLIMENT = -CONSTANT K1103350
                          STO     B         PROPERLY SIGNED CONSTANT    K1103360
                          SLA     16                                    K1103370
                          STO  L  SW1       RESET SIGN CONDITION SWITCH K1103380
                          MDX   1 1         INCR STMNT POINTER          K1103390
                    *                                                   K1103400
                    *             CHECK IF FIRST OR SECOND CONSTANT     K1103410
                    *                                                   K1103420
                          LD    1 0         NEXT STMNT WORD             K1103430
                          S       ASTK      ASTERISK CONSTANT           K1103440
                          BSC  L  F,Z       BR TO CHK IF COMMA          K1103450
                          LD      B         PREVIOUS CON WAS 1ST OF 2   K1103460
                          STO  L  A         STORE AS A              212 K1103470
                          SLA     16                                    K1103480
                          STO     B         CLEAR B                     K1103490
                          MDX   1 1         INCR STMNT POINTER          K1103500
                    *                                                   K1103510
                    *             CHECK FOR VARIABLE NAME               K1103520
                    *                                                   K1103530
                          LD    1 0         NEXT STMNT WORD             K1103540
                          BSC  L  ER33,-    BR IF NOT NAME          212 K1103550
                          SLA     2                                     K1103560
                          BSC  L  POS,C     BR TO TEST SIGN IF CARRY ON K1103570
                          MDX     TV        BR TO TEST SIGN FOUND SW    K1103580
                    POS   BSC  L  TV,-      BR IF ALPHA CHAR - NO ERROR K1103590
                          B       ER33      BR IF NOT ALPHA CHAR    212 K1103600
                    *                                                   K1103610
                    *             MOVE TO NEXT STMNT                    K1103620
                    *                                                   K1103630
                    MOVE  LD    1 0         NEXT STMNT WORD             K1103640
                          SRA     2                                     K1103650
                          AND     IDNRM     EXTRACT STMNT WORD COUNT    K1103660
                          STO     NXID+1    ADDR NEXT INSTRUCTION       K1103670
                    NXID  MDX  L1 0         INCR TO NEXT STMNT ID WORD  K1103680
                          LDX  L  TEST      BR TO SCAN NEXT STMNT       K1103690
                    *                                                   K1103700
                    *             CONSTANTS AND WORK AREA               K1103710
                    *                                                   K1103720
                    ON    DC      /8000     SIGN BIT CONSTANT           K1103730
                    B     DC      0         DIMENSION VALUE CON TEMP    K1103740
                    IDNRM DC      /01FF     STMNT WD COUNT EXTRACT MASK K1103760
                    ONE   DC      1         DECIMAL ONE CONSTANT        K1103770
                    WORD1 DC      0         NAME CONVERSION TEMP-1ST WD K1103780
                    WORD2 DC      0         NAME CONVERSION TEMP-2ND WD K1103790
                    SAVE1 DC      0         INDEX REG 3 TEMPORARY       K1103800
                    *                                                   K1103810
                    *             CHECK FOR LEGEL VARIABLE NAME         K1103820
                    *                                                   K1103830
                    D     LD      ONE                                   K1103840
                          STO  L  A         NO CON BEFORE NAME-A=1  212 K1103850
                    TV    LD   L  SW2       SIGN FOUND SWITCH           K1103860
                          BSC  L  ER33,Z    BR IF SIGN FOUND        212 K1103870
                          LD      ON        PRESET WORD TWO FOR ONE     K1103880
                          STO     WORD2     WORD NAME.                  K1103890
                          LD    1 0         NEXT STMNT WORD             K1103900
                          STO     WORD1     FIRST NAME WORD             K1103910
                          LD    1 1         NEXT STMNT WORD             K1103920
                          BSC  L  CK1,-     BR IF ONE WORD ONLY         K1103930
                          STO     WORD2     SECOND NAME WORD            K1103940
                          MDX   1 1         INCR STMNT POINTER          K1103950
                          LD    1 1         NEXT STMNT WORD             K1103960
                          BSC  L  ER33,+Z   BR IF 3RD NAME WORD     212 K1103970
                    *                                                   K1103980
                    *             CHECK SYMBOL TABLE FOR DUPLICATE NAME K1103990
                    *                                                   K1104000
                    CK1   LDX  I3 SOFNS     START OF NON-STMNT NUMBERS  K1104010
                          MDX     JACK      BR TO INITIATE              K1104020
                    LPP   LD    3 1         NEXT NAME - FIRST WORD      K1104030
                          S       WORD1     CHECK FOR DUPLICATE         K1104040
                          BSC     Z         SKIP NEXT IF 1ST WDS EQUAL  K1104050
                          MDX     EAT       BR TO CHK AGAINST NEXT NAME K1104060
                          LD    3 2         COMPARE SECOND WORDS OF     K1104070
                          S       WORD2     NAME IF FIRST WDS COMPARE.  K1104080
                          BSC  L  CK3,+-    BR TO CONVERT IF NAME FOUND K1104090
                    EAT   MDX   3 -3        DECR TO NEXT ENTRY          K1104100
                    JACK  STX   3 SAVE1     XR3 TO TEMPORARY            K1104110
                          LD      SAVE1     CURRENT SYMBOL TBL ADDRESS  K1104120
                          S    L  EOFST     END OF SYMBOL TABLE         K1104130
                          BSC     Z         SKIP NEXT IF END OF TABLE   K1104140
                          MDX     LPP       CONTINUE NAME SEARCH        K1104150
                          LDX   1 ERR34     UNDEFINED VAR IN SUBSC  212 K1104160
                          B       STORE     BR TO REPLACE STMT      212 K1104170
                    *                                                   K1104190
                    *             CONSTANTS AND WORK AREA               K1104200
                    *                                                   K1104210
                    ERRNO DC      0         ERROR NUMBER TEMPORARY      K1104230
                    THRE  DC      3         DECIMAL 3 CONSTANT          K1104240
                    DEE   DC      0         DIMENSIONAL SUBSC NAME TEMP K1104250
                    EEE   DC      0         DIMENSIONAL SUBSC NAME TEMP K1104260
                    NAME  DC      0         CONVERTED NAME TEMPORARY    K1104270
                    CEE   DC      0         DIMENSIONAL SUBSC NAME TEMP K1104280
                    MARS  DC      /D800     DIMENSION INDR BIT MASK     K1104290
                    PLUSC DC      /000E     PLUS CONSTANT               K1104300
                    MINC  DC      /0020-/000E  MINUS CONSTANT           K1104310
                    COMMC DC      /002B     COMMA CONSTANT              K1104320
                    SPECP DC      /0002-/002B  SPECIAL RT PARENTHESIS   K1104330
                    NRMSV DC      0         STMNT WD COUNT TEMPORARY    K1104350
                    GETZ  DC      0         NEXT STMNT ADDR TEMPORARY   K1104360
                    ERRID DC      /A008     ERROR IDENTIFIER CONSTANT   K1104370
                    RNG   DC      0         STRING CLOSURE RANGE        K1104380
                    HUB   DC      /4000     BIT 1 MASK                  K1104390
                    ERIID DC      /A00D     ERROR ID CONSTANT           K1104400
                    *                                                   K1104410
                    *             CONVERT NAME TO POINTER               K1104420
                    *                                                   K1104430
                    CK3   STX   3 SAVE1     CURRENT SYMBOL TABLE ADDR   K1104440
                          LD   L  SOFST     START OF SYMBOL TABLE       K1104450
                          A       THRE      ADJUST FOR SEARCH LOOP DECR K1104460
                          S       SAVE1     ADDR WHERE NAME FOUND       K1104470
                          SRT     16        MAKE NORMAL DIVIDEND        K1104480
                          D       THRE      FORM SYMBOL TABLE POINTER   K1104490
                          OR      ON        SIGN BIT                    K1104500
                          STO     NAME      NAME POINTER                K1104510
                          LD      DEE                                   K1104520
                          STO     CEE       PUSH DOWN DIMENSIONAL       K1104530
                          LD      EEE       SUBSCRIPT NAME POINTERS AND K1104540
                          STO     DEE       ADD THE NAME JUST CONVERTED K1104550
                          LD      NAME      TO THE TOP OF THE LIST.     K1104560
                          STO     EEE                                   K1104570
                    *                                                   K1104580
                    *             CHECK FOR NON-DIMENSIONED NAME        K1104590
                    *                                                   K1104600
                    E     LD   I  SAVE1     SYMBOL TABLE ID WORD        K1104610
                          AND     MARS      DIMENSION BIT MASK          K1104620
                          EOR     HUB       REAL/INTEGER BIT MASK       K1104630
                          BSC  L  ER33,Z    BR IF NON-DIM NAME      212 K1104640
                          MDX   1 1         INCR STMNT POINTER          K1104650
                    *                                                   K1104660
                    *             CHECK FOR OPERATOR                    K1104670
                    *                                                   K1104680
                          LD    1 0         NEXT STMNT WORD             K1104690
                          S       PLUSC     PLUS SIGN CONSTANT          K1104700
                          BSC  L  CK4,+-    BR IF PLUS SIGN             K1104710
                          S       MINC      MINUS SIGN CONSTANT         K1104720
                          BSC  L  CK5,+-    BR IF MINUS SIGN            K1104730
                    F     LD    1 0         NEXT STMNT WORD             K1104740
                          S       COMMC     COMMA CONSTANT              K1104750
                          BSC  L  CK6,+-    BR IF COMMA                 K1104760
                          S       SPECP     SPECIAL RIGHT PARENTHESIS   K1104770
                          BSC  L  CK7,+-    BR IF RIGHT PARENTHESIS     K1104780
                    *                                                   K1104790
                    *             SET UP ERROR 33                       K1104800
                    *                                                   K1104810
                    ER33  LDX   1 ERR33                             212 K1104820
                          B       STORE                             212 K1104823
                    ER35  LDX   1 ERR35                             212 K1104826
                          B       STORE                             212 K1104830
                    ER36  LDX   1 ERR36                             212 K1104833
                    STORE STX   1 ERRNO     SAVE ERROR NUMBER       212 K1104836
                    *                                                   K1104840
                    *             REPLACE STMNT WITH ERROR              K1104850
                    *                                                   K1104860
                    N     LDX  I1 IDSAV     STMNT ID WORD ADDRESS       K1104870
                          LD    1 0         STMNT ID WORD               K1104880
                          SRA     2         RIGHT JUSTIFY WD COUNT      K1104890
                          AND     IDNRM     EXTRACT WORD COUNT          K1104900
                          STO     NRMSV     SAVE WORD COUNT             K1104910
                          A    L  IDSAV     STMNT ID WORD ADDRESS       K1104920
                          STO     GETZ      ADDR NEXT STMNT ID WORD     K1104930
                          LDX  I2 GETZ      XR2 = NEXT STMNT ADDRESS    K1104940
                          LD    1 0         STMNT ID WORD               K1104950
                          BSC  L  CALD,E    BR IF NUMBERED STMNT        K1104960
                          MDX     CALD+4    BR IF UNNUMBERED STMNT      K1104970
                    CALD  LD      ERIID     ERROR ID WORD               K1104980
                          STO   1 0         STORE AS STMNT ID           K1104990
                          MDX   1 1         INCR STMNT POINTER          K1105000
                          MDX     CALD+6    BR TO SET UP ERR ON STRING  K1105010
                          LD      ERRID     ERROR ID WORD               K1105020
                          STO   1 0         STORE AS STMNT ID           K1105030
                          LD      ERRNO     ERROR NUMBER                K1105040
                          STO   1 1         STORE ON STRING             K1105050
                          MDX   1 1         INCR STMNT POINTER          K1105060
                          LD   L  EOFS      END OF STRING ADDRESS       K1105070
                          S    L  IDSAV     CURRENT STMNT ADDRESS       K1105080
                          S       NRMSV     CURRENT STMNT WORD COUNT    K1105090
                          STO     RNG                                   K1105100
                          LDX  I3 RNG       RANGE OF STRING CLOSURE     K1105110
                          STX   1 RNG       CURRENT STMNT POINTER       K1105120
                          MDX   3 1         ADJUST RANGE                K1105130
                    LIM   LD    2 0         NEXT WORD TO MOVE           K1105140
                          STO   1 1         CLOSE UP STRING             K1105150
                          MDX   1 1         INCR MOVE TO POINTER        K1105160
                          MDX   2 1         INCR MOVE FROM POINTER      K1105170
                          MDX   3 -1        DECR NO. WDS TO MOVE        K1105180
                          MDX     LIM       BR TO CONTINUE CLOSING      K1105190
                          STX  L1 EOFS      END OF STRING ADDRESS       K1105200
                          LDX  I1 RNG       XR1= CURRENT STMNT POINTER  K1105210
                          MDX   1 1         INCR STMNT POINTER          K1105220
                          BSC  L  TEST      BR TO TEST NEXT STMNT TYPE  K1105230
                    *                                                   K1105240
                    *             SET SWITCHES TO INDICATE SIGN FOUND   K1105250
                    *                                                   K1105260
                    CK4   SLA     16        CLEAR ACCUMULATOR           K1105270
                          STO  L  SW1       SET SW1 TO PLUS CONDITION   K1105280
                          MDX  L  SW2,1     SET SW2 = SIGN FOUND        K1105290
                          MDX   1 1         INCR STMNT POINTER          K1105300
                          LDX  L  G         BR TO CHK FOR OPERATOR      K1105310
                    CK5   MDX  L  SW1,1     SET SW1 TO MINUS CONDITION  K1105320
                          MDX     CK4+3     BR TO SET SWITCH 2          K1105330
                    *                                                   K1105390
                    *             DETERMINE DIMENSIONING LEVEL          K1105400
                    *                                                   K1105410
                    CK7   MDX  L  SW3,1     SET SW3 = RIGHT PARENTHESIS K1105420
                          STX   1 VAMP      SAVE INDEX REG 1            K1105430
                    CK6   MDX  L  GO,1      INCR DIMENSION LEVEL CTR    K1105440
                          LD      GO        DIMENSION LEVEL CTR         K1105450
                          S    L  ONE       DECIMAL ONE                 K1105460
                          BSC  L  CK8,+-    BR IF 1-DIMENSION           K1105470
                          S    L  ONE       DECIMAL ONE                 K1105480
                          BSC  L  CK9,+-    BR IF 2-DIMENSION           K1105490
                          S    L  ONE       DECIMAL ONE                 K1105500
                          BSC  L  ER33,Z    BR IF MORE THAN 3       212 K1105510
                          LD      SUBB3     3 DIMENSION INDR CONSTANT   K1105520
                          STO     TAB       DIMENSION LEVEL INDR        K1105530
                    *                                                   K1105540
                    *             CALCULATE D4=D4+IJ                    K1105550
                    *                                                   K1105560
                          LD   L  B         DIMENSION VALUE CONSTANT    K1105570
                          M    L  IJMAX     FIRST DIMENSION FACTOR      K1105580
                          SLT     16        PRODUCT INTO ACCUMULATOR    K1105590
                          S    L  IJMAX     FIRST DIMENSION FACTOR      K1105600
                          A       D4        D4 SUBSCRIPT CONSTANT       K1105610
                          STO     D4        NEW D4                      K1105620
                    *                                                   K1105630
                    *             CALCULATE A=A*IJMAX                   K1105640
                    *                                                   K1105650
                          LD      A         DIMENSION VALUE CONSTANT212 K1105660
                          M    L  IJMAX     FIRST DIMENSION FACTOR      K1105670
                          SLT     16        PRODUCT INTO ACCUMULATOR    K1105680
                          STO     A         NEW A VALUE             212 K1105690
                          MDX     CK10      BR TO CHECK IF A=0          K1105700
                    *                                                   K1105710
                    *             CALCULATE  D4=D4+B-1                  K1105720
                    *                                                   K1105730
                    CK8   LD   L  SUB1      ONE-DIMENSIONAL SUBSC CON   K1105740
                          STO     TAB       DIMENSIONAL LEVEL INDR      K1105750
                          LD      D4        D4 SUBSC CONSTANT       212 K1105760
                          A    L  B         DIMENSION VALUE CONSTANT    K1105770
                          S    L  ONE       DECIMAL ONE                 K1105780
                          STO     D4        NEW D4                      K1105790
                          MDX     CK10      BR TO CHECK IF A=0          K1105800
                    *                                                   K1105810
                    *             CALCULATE  D4=D4+IMAX(B-1)            K1105820
                    *                                                   K1105830
                    CK9   LD      SUBB2     TWO-DIMENSIONAL SUBSC CON   K1105840
                          STO     TAB       DIMENSIONAL LEVEL INDR      K1105850
                          LD   L  B         DIMENSION VALUE CONSTANT    K1105860
                          M    L  IMAX      2ND DIMENSION FACTOR        K1105870
                          SLT     16        PRODUCT INTO ACCUMULATOR    K1105880
                          S    L  IMAX      2ND DIMENSION FACTOR        K1105890
                          A       D4        D4 SUBSCRIPT CONSTANT       K1105900
                          STO     D4        NEW D4                      K1105910
                    *                                                   K1105920
                    *             CALCULATE  A=A*IMAX                   K1105930
                    *                                                   K1105940
                          LD      A         DIMENSION VALUE CONSTANT212 K1105950
                          M    L  IMAX      2ND DIMENSION FACTOR        K1105960
                          SLT     16        PRODUCT INTO ACCUMULATOR    K1105970
                          STO     A         NEW A VALUE             212 K1105980
                    *                                                   K1105990
                    *             CHECK FOR A=0                         K1106000
                    *                                                   K1106010
                    CK10  LD      A         DIMENSION VALUE CONSTANT212 K1106020
                          BSC  L  J,+-      BR IF A=0 TO TEST IF B=0    K1106030
                    *                                                   K1106040
                    *             SET A INTO NEXT SUBSCRIPT CONSTANT    K1106050
                    *                                                   K1106060
                          MDX  L  CNT,1     INCR SUBSC ELEMENT COUNTER  K1106070
                          LD      D2        D1=D2                       K1106080
                          STO     D1                                    K1106090
                          LD      D3        D2=D3                       K1106100
                          STO     D2                                    K1106110
                          LD      A         D3=A                    212 K1106120
                          STO     D3                                    K1106130
                          MDX     JK        BR TO CHK RIGHT PAREN INDR  K1106140
                    J     LD   L  B         DIMENSION VALUE CONSTANT    K1106150
                          BSC  L  ER33,+-   BR IF B= ZERO           212 K1106160
                    *                                                   K1106170
                    *             TEST RIGHT PARENTHESIS INDICATOR      K1106180
                    *                                                   K1106190
                    JK    LD   L  SW3       RT PARENTHESIS INDICATOR    K1106200
                          BSC  L  CK11,Z    BR IF RT PARENTHESIS        K1106210
                          MDX   1 1         MOVE STMNT POINTER          K1106220
                          SLA     16        CLEAR ACCUMULATOR           K1106230
                          STO  L  SW2       RESET SIGN INDICATOR        K1106240
                          STO     A         CLEAR DIM VALUE CON A   212 K1106250
                          STO  L  B         CLEAR DIMENSION VALUE CON B K1106260
                          LDX  L  G         BR TO CHK FOR OPERATOR      K1106270
                    *                                                   K1106280
                    *             CONSTANTS AND WORK AREA               K1106290
                    *                                                   K1106300
                    TAB   DC      0         DIMENSIONAL LEVEL INDICATOR K1106310
                    SUBB2 DC      /001C     2 DIMENSION INDR CONSTANT   K1106320
                    SUBB3 DC      /001E     3 DIMENSION INDR CONSTANT   K1106330
                    A     DC      0         DIMENSION VALUE CON TEMP212 K1106340
                    FOUR  DC      4         DECIMAL 4 CONSTANT          K1106360
                    OP    DC      0         STMNT CLOSURE COUNT TEMP    K1106370
                    NO    DC      0         SUBSC EXPRESSION SIZE TEMP  K1106380
                    SUBZ  DC      /0018     ZERO SUBSC INDR CONSTANT    K1106390
                    GO    DC      0         DIMENSION LEVEL TEMP    212 K1106400
                    D4    DC      0         DIMENSION CONSTANT TENP 212 K1106405
                    SPARR DC      /0024     SPECIAL RT PARENTHESIS CON  K1106410
                    VAMP  DC      0         INDEX REG 1 TEMPORARY       K1106420
                    D1    DC      0         SUBSC CONSTANT D1           K1106430
                    D2    DC      0         SUBSC CONSTANT D2           K1106440
                    D3    DC      0         SUBSC CONSTANT D3           K1106450
                    EQVIC DC      /15       EQUIVALENCE STMNT CONSTANT  K1106460
                    *                                                   K1106470
                    *             DO SUBSCRIPTS AGREE                   K1106480
                    *                                                   K1106490
                    CK11  LD   I  Y         STMNT SUBSC WORD            K1106500
                          S       TAB       DIMENSION LEVEL INDICATOR   K1106510
                          BSC  L  CK12,+-   BR IF SUBSCRIPTS AGREE      K1106520
                    *                                                   K1106530
                    *             EQUIVALENCE STATEMENT                 K1106540
                    *                                                   K1106550
                          LD   I  IDSAV     STMNT ID WORD               K1106560
                          SRA     11        RT JUSTIFY STMNT TYPE       K1106570
                          S       EQVIC     EQUIVALENCE STMNT CONSTANT  K1106580
                          BSC  L  ER35,Z    BR IF NOT EQU STMT      212 K1106590
                    *                                                   K1106600
                    *             CHECK IF 1 DIMENSIONAL STMNT          K1106610
                    *                                                   K1106620
                          LD   L  TAB       DIMENSION LEVEL INDICATOR   K1106630
                          S    L  SUB1      ONE-DIMENSIONAL SUBSC CON   K1106640
                          BSC  L  CK12,+-   BR IF ONE DIMENSION SUBSC   K1106650
                          LDX   1 ERR31     SUBSC ERROR IN EQU STMT 212 K1106660
                          B    L  STORE     BR-REPLACE STMT W/ERROR 212 K1106670
                    CK12  LD      CNT       SUBSCRIPT ELEMENT COUNT     K1106720
                          M       FOUR      CNT=CNT*4                   K1106730
                          SLT     16        PRODUCT INTO ACCUMULATOR    K1106740
                          STO     CNT       RESTORE CNT                 K1106750
                    *                                                   K1106760
                    *             COMPUTE SIZE OF SUBSCRIPT EXPRESSION  K1106770
                    *                                                   K1106780
                          LD      VAMP      STMNT POINTER END           K1106790
                          S    L  Y         STMNT POINTER BEGINNING     K1106800
                          STO     NO        STORE SIZE-1                K1106810
                          MDX  L  NO,1      SUBSCRIPT EXPRESSION SIZE   K1106820
                    *                                                   K1106830
                    *             COMPUTE RANGE OF STMNT CLOSURE        K1106840
                    *                                                   K1106850
                          LD      CNT       SUBSCRIPT ELEMENT COUNT     K1106860
                          S       NO        SUBSCRIPT EXPRESSION SIZE   K1106870
                          A    L  THRE      THREE                       K1106880
                          STO     OP        RANGE OF CLOSURE            K1106890
                          BSC  L  CK13,+Z   BR IF RANGE IS NEGATIVE     K1106900
                          BSC  L  CK14,Z    BR IF RANGE IS POSITIVE     K1106910
                    K     LDX  I1 Y         STMNT PT =Y IF RANGE ZERO   K1106920
                    *                                                   K1106930
                    *             COMPUTE NO. OF WORDS PER ENTRY        K1106940
                    *                                                   K1106950
                          LD      HOLD      3RD DIMENSION CONSTANT      K1106960
                          SLA     1         REAL-INTEGER INDR INTO SIGN K1106970
                          BSC  L  HOLD1,-   BR IF REAL                  K1106980
                          LD   L  CCWD      CONTROL CARD WORD           K1106990
                          SLA     9         ONE-WD INTEGER BIT TO SIGN  K1107000
                          BSC     +Z        SKIP NEXT IF NOT ONE WORD   K1107010
                          MDX     HLD2      BR IF ONE WORD INTEGER MODE K1107020
                    HOLD1 LD   L  CCWD      CONTROL CARD WORD           K1107030
                          SLA     13        EXTENDED PREC BIT INTO SIGN K1107040
                          BSC     +Z        SKIP NEXT IF STANDARD PREC  K1107050
                          MDX     ZZZZ-2    BR IF EXTENDED PRECISION    K1107060
                          LD   L  TWO                               212 K1107070
                          MDX     ZZZZ      BR TO SET WDS PER ENTRY =2  K1107080
                    HLD2  LD   L  ONE                                   K1107090
                          MDX     ZZZZ      BR TO SET WDS PER ENTRY =1  K1107100
                          LD   L  THRE      WORDS PER ENTRY =3          K1107110
                    ZZZZ  STO     SES       NO. OF WORDS PER SUBSCRIPT  K1107120
                    *                                                   K1107130
                    *             SET UP D1, D2, D3, AND D4             K1107140
                    *                                                   K1107150
                          LDX   2 3         LOOP COUNTER                K1107160
                          LD   L2 D1-1      D-FACTOR                    K1107170
                          M       SES       NO. OF WORDS PER SUNSCRIPT  K1107180
                          SLT     16        PRODUCT INTO ACCUMULATOR    K1107190
                          STO  L2 D1-1      COMPUTED DIMENSION INDEX    K1107200
                          MDX   2 -1        DECR COUNTER                K1107210
                          MDX     ZZZZ+2    BR TO COMPUTE NEXT D FACTOR K1107220
                          LD      D1        TEST IF D1, D2, D3          K1107230
                          OR      D2        *ARE ALL ZERO               K1107240
                          OR      D3        *                           K1107250
                          BSC  L  D40K,Z    BRANCH IF NOT ALL ZERO      K1107260
                    *                                                   K1107270
                    *             TEST FOR SUBSCRIPT SIZE ERROR         K1107280
                    *                                                   K1107290
                          LD   I  SAVE      LOAD MAXIMUM SUBSCRIPT      K1107300
                          S       D4        SUBTRACT THIS SUBSCRIPT 212 K1107310
                          BSC  L  D40K,-Z   BRANCH IF SIZE OK           K1107320
                          B    L  ER35      SUBSC SIZE ERROR        212 K1107330
                    D40K  EQU     *         CONTINUE                    K1107350
                    *                                                   K1107360
                    *             PUT D4 ON STRING AT POINTER+1         K1107370
                    *                                                   K1107380
                          LD      D4        D-FACTOR                212 K1107390
                          M       SES       NO. OF WORDS PER SUBSCRIPT  K1107400
                          SLT     16        PRODUCT INTO ACCUMULATOR    K1107410
                          OR   L  ON        SIGN BIT                    K1107420
                          STO  L  D4        COMPUTED DIMENSION INDEX    K1107430
                          STO   1 1         PLACE ON STRING             K1107440
                    *                                                   K1107450
                    *            PLACE DIMENSION SUBSC ON OUTPUT STRING K1107460
                    *                                                   K1107470
                          LD      CNT       SUBSC ELEMENT COUNT         K1107480
                          BSC  L  Z,Z       BR IF NOT ZERO              K1107490
                          LD      SUBZ      ZERO SUBSC INDR             K1107500
                          STO   1 0         PLACE ON STRING             K1107510
                    Z3    LD   L  Y         COMPUTE POINTER=Y+CNT+2     K1107520
                          A       CNT       ELEMENT COUNT               K1107530
                          A    L  TWO       DECIMAL TWO             212 K1107540
                          STO     TAT+1     ADDR OF LDX INSTRUCTION     K1107550
                    TAT   LDX  L1 0         POINTER= Y+CNT+2            K1107560
                    *                                                   K1107570
                    *             PUT SPECIAL RT PARENTHESIS ON STRING  K1107580
                    *                                                   K1107590
                          LD      SPARR     SPECIAL RT PARENTHESIS      K1107600
                          STO   1 0         PLACE ON STRING             K1107610
                          LDX  L  L         BR TO CHK FOR END OF STMNT  K1107620
                    *                                                   K1107630
                    *             CONSTANTS AND WORK AREA               K1107640
                    *                                                   K1107650
                    EIGHT DC      8                                     K1107660
                    CNT   DC      0         SUBSCRIPT ELEMENT COUNT 212 K1107665
                    HOLD  DC      0         3RD DIMENSION FACTOR TEMP   K1107670
                    SES   DC      0         NO. OF WORDS PER SUBSC TEMP K1107680
                    COMS  DC      /0012     COMMA CONSTANT              K1107690
                    *                                                   K1107700
                    *             CHECK FOR D1=0                        K1107710
                    *                                                   K1107720
                    Z     LD      D1        D-FACTOR 1                  K1107730
                          BSC  L  Z1,Z      BR IF NOT ZERO              K1107740
                          LD   L  D2        D-FACTOR 2                  K1107750
                          STO  L  D1        D1=D2                       K1107760
                          LD   L  D3        D-FACTOR 3                  K1107770
                          STO  L  D2        D2=D3                       K1107780
                          LD   L  DEE                                   K1107790
                          STO  L  CEE       C=D                         K1107800
                          LD   L  EEE                                   K1107810
                          STO  L  DEE       D=E                         K1107820
                          MDX     Z         BR TO CHK D1 FOR ZERO       K1107830
                    Z1    LD      CNT       ELEMENT COUNT           212 K1107840
                          S    L  FOUR      DECIMAL FOUR                K1107850
                          BSC  L  Z4,Z      BR TO Z4 IF GREATER THAN 4  K1107860
                          LD   L  SUB1      1 DIMENSIONAL SUBSC INDR    K1107870
                          STO   1 0         PLACE ON STRING             K1107880
                          MDX   1 2         INCR POINTER BY 2           K1107890
                    *                                                   K1107900
                    *             PLACE ,C,D1 ON STRING                 K1107910
                    *                                                   K1107920
                    Z5    LD      COMS      COMMA CHARACTER CONSTANT    K1107930
                          STO   1 0         FIRST COMMA                 K1107940
                          STO   1 2         SECOND COMMA                K1107950
                          LD   L  D1                                    K1107960
                          STO   1 3         D1                          K1107970
                          LD   L  CEE                                   K1107980
                          STO   1 1         C                           K1107990
                          MDX     Z3        BR TO COMPUTE POINTER       K1108000
                    Z4    LD      EIGHT     DECIMAL EIGHT               K1108010
                          S       CNT       ELEMENT COUNT           212 K1108020
                          BSC  L  Z6,Z      BR TO Z6 IF GREATER THAN 8  K1108030
                          LD   L  SUBB2     2 DIMENSIONAL SUBSC INDR    K1108040
                          STO   1 0         PLACE ON STRING             K1108050
                          MDX   1 6         INCR POINTER BY 6           K1108060
                    *                                                   K1108070
                    *             PUT ,D,D2 ON STRING                   K1108080
                    *                                                   K1108090
                    Z7    LD      COMS      COMMA CONSTANT              K1108100
                          STO   1 0         FIRST COMMA                 K1108110
                          STO   1 2         SECOND COMMA                K1108120
                          LD   L  D2                                    K1108130
                          STO   1 3         D2                          K1108140
                          LD   L  DEE                                   K1108150
                          STO   1 1         D                           K1108160
                          MDX   1 -4        MOVE POINTER BY -4          K1108170
                          MDX     Z5        BR TO PUT ,C,D1 ON STRING   K1108180
                    Z6    LD   L  SUBB3     3 DIMENSIONAL SUBSC INDR    K1108190
                          STO   1 0         PLACE ON STRING             K1108200
                          MDX   1 10        INCR POINTER BY 10          K1108210
                    *                                                   K1108220
                    *             PUT ,E,D3 ON STRING                   K1108230
                    *                                                   K1108240
                          LD      COMS      COMMA CHARACTER CONSTANT    K1108250
                          STO   1 0         FIRST COMMA                 K1108260
                          STO   1 2         SECOND COMMA                K1108270
                          LD   L  D3                                    K1108280
                          STO   1 3         D3                          K1108290
                          LD   L  EEE                                   K1108300
                          STO   1 1         E                           K1108310
                          MDX   1 -4        MOVE POINTER BY -4          K1108320
                          MDX     Z7        BR TO PUT ,D,D2 ON STRING   K1108330
                    *                                                   K1108340
                    *             COMPUTE STRING CLOSE VALUE            K1108350
                    *                                                   K1108360
                    CK13  LD      HOB       STRING CLOSE VALUE          K1108370
                          S    L  OP        STMNT CLOSURE RANGE         K1108380
                          STO     HOB       ADJUSTED STRING CLOSE VALUE K1108390
                          MDX  L  SW4,1     SET STRING CLOSE SWITCH ON  K1108400
                    *                                                   K1108410
                    *             CLOSE STMNT OP WORDS                  K1108420
                    *                                                   K1108430
                          LD   L  Y         ADDR BEGIN SUBSCRIPT STMNT  K1108440
                          S    L  OP        RANGE OF STMNT CLOSURE      K1108450
                          STO     *+1                                   K1108460
                          LDX  L2 0         MOVE FROM ADDRESS           K1108470
                          LDX  I1 Y         MOVE TO ADDRESS             K1108480
                    CLOS  LD    2 1         NEXT WORD TO MOVE           K1108490
                          STO   1 1         CLOSE UP STMNT              K1108500
                          BSC  L  *+3,+-    BR IF END OF STMNT FOUND    K1108510
                          MDX   1 1         INCR MOVE TO ADDR           K1108520
                          MDX   2 1         INCR MOVE FROM ADDR         K1108530
                          MDX     CLOS      BR TO CONTINUE CLOSING      K1108540
                          BSC  L  K         BR TO SET STMNT POINTER =Y  K1108550
                    *                                                   K1108560
                    *             OPEN STRING OP WORDS                  K1108570
                    *                                                   K1108580
                    CK14  STX   1 CRIK      CURRENT STMNT POINTER       K1108590
                          LDX  I1 EOFS      END OF STRING ADDRESS       K1108600
                          LDX  I2 EOFS      END OF STRING ADDRESS       K1108610
                          MDX  I2 OP        NEW END OF STRING ADDRESS   K1108620
                          LD   L  EOFS      END OF STRING ADDRESS       K1108630
                          S       CRIK      CURRENT STMNT POINTER       K1108640
                          STO     CRIK1+1   DIFFERENCE AS ADDR NEXT     K1108650
                    CRIK1 LDX  L3 0                                     K1108660
                          MDX   3 1         NO. OF WORDS TO MOVE        K1108670
                          STX  L2 EOFS      NEW END OF STRING ADDRESS   K1108680
                    LAMB  LD    1 0         NEXT WORD TO MOVE           K1108690
                          STO   2 0         OPEN STRING                 K1108700
                          MDX   1 -1        DECR MOVE FROM ADDRESS      K1108710
                          MDX   2 -1        DECR MOVE TO ADDRESS        K1108720
                          MDX   3 -1        DECR NO. OF WORDS TO MOVE   K1108730
                          MDX     LAMB      BR TO CONTINUE MOVE         K1108740
                          LDX  I1 IDSAV     ADDR OF STMNT ID WORD       K1108750
                          LD    1 0         STMNT ID WORD               K1108760
                          AND     MAZZ      EXTRACT STMNT WORD COUNT    K1108770
                          STO     CRIK      SAVE ID WITHOUT WORD COUNT  K1108780
                          LD   L  NRMSV     OLD WD COUND                K1108790
                          A    L  OP        INCR WD COUNT BY RANGE      K1108800
                          STO  L  NRMSV     NEW WD COUNT                K1108810
                          SLA     2         POSITION FOR ID WD FORMAT   K1108820
                          OR      CRIK      NEW WD COUNT IN ID WORD     K1108830
                          STO   1 0         RESTORE ID WITH NEW WD CNT  K1108840
                          LD   L  EOFST     LOAD END OF SYMBOL TABLE    K1108850
                          S    L  EOFS      SUBTRACT END OF STRING      K1108860
                          BSC  L  K,-Z      BRANCH IF NO OVERLAP        K1108870
                          MDX  L  ERROR,1   SET OVERLAP INDICATOR ON    K1108880
                          BSC  L  OUT       EXIT                   2-12 K1108890
                    *                                                   K1108900
                    *             CONSTANTS AND WORK AREA               K1108910
                    *                                                   K1108920
                    HOB   DC      0         STRING CLOSE VALUE          K1108930
                    CRIK  DC      0         STMNT POINTER TEMPORARY     K1108940
                    MAZZ  DC      /F803     STMNT ID WD EXTRACT MASK    K1108950
                    ZAP1  DC      0         STMNT WORD COUNT TEMPORARY  K1108960
                    ZAP   DC      0         INDEX REG 1 TEMPORARY       K1108970
                    *                                                   K1108980
                    *             CHECK SWITCH 4 FOR STRING CLOSURE     K1108990
                    *                                                   K1109000
                    O     LD   L  SW4       STRING CLOSE SWITCH         K1109010
                          BSC  L  ZAPZ,Z    BR IF STRING CLOSE REQUIRED K1109020
                    ZAP6  MDX   1 1         INCR STMNT POINTER          K1109030
                          BSC  L  TEST      GO TO NEXT STMNT            K1109040
                    *                                                   K1109050
                    *             CLOSE STRING BY HOB WORDS             K1109060
                    *                                                   K1109070
                    ZAPZ  STX   1 ZAP       SAVE CURRENT STMNT POINTER  K1109080
                          LDX  I1 IDSAV     ADDR OF STMNT ID WORD       K1109090
                          LD    1 0         STMNT ID WORD               K1109100
                          AND     MAZZ      EXTRACT STMNT WORD COUNT    K1109110
                          STO     CRIK      SAVE ID WITHOUT WORD COUNT  K1109120
                          LD   L  NRMSV     OLD STMNT WORD COUNT        K1109130
                          S       HOB       STRING CLOSURE RANGE        K1109140
                          SLA     2         POSITION FOR ID WORD FORMAT K1109150
                          OR      CRIK      NEW STMNT WORD CNT IN ID WD K1109160
                          STO   1 0         RESTORE ID WITH NEW WD CNT  K1109170
                          LD   L  NRMSV     OLD WORD COUNT              K1109180
                          A    L  IDSAV     ADDRESS STMNT ID WORD       K1109190
                          STO     ZAP1                                  K1109200
                          LDX  I2 ZAP1      MOVE FROM ADDRESS           K1109210
                          LD   L  EOFS      END OF STRING ADDRESS       K1109220
                          S       ZAP1      MOVE FROM ADDRESS           K1109230
                          STO     ZAP2+1                                K1109240
                    ZAP2  LDX  L3 0         RANGE-1 OF MOVE             K1109250
                          MDX   3 1         NO. OF WORDS TO MOVE        K1109260
                          LDX  I1 ZAP       MOVE TO ADDRESS             K1109270
                    ZAP4  LD    2 0         NEXT WORD TO MOVE           K1109280
                          STO   1 1         CLOSE UP STRING             K1109290
                          MDX   1 1         INCR MOVE TO ADDRESS        K1109300
                          MDX   2 1         INCR MOVE FROM ADDRESS      K1109310
                          MDX   3 -1        DECR NO. OF WDS TO MOVE     K1109320
                          MDX     ZAP4      BR TO CONTINUE MOVE         K1109330
                          LDX  I1 ZAP       RESTORE INDEX REG 1         K1109340
                          MDX     ZAP6      BR TO INCR STMNT POINTER    K1109350
                    *********************************************** 212 K1109353
                    *                                             * 212 K1109356
                    *   THIS ROUTINE SCANS TO THE RIGHT UNTIL A   * 212 K1109360
                    * COMMA (/2B OR /12) IS FOUND.  THEN THE SCAN * 212 K1109363
                    * IS REVERSED AND PARENTHESIS ARE COUNTED.    * 212 K1109366
                    * (+1 FOR LEFT AND -1 FOR RIGHT)  WHEN THE    * 212 K1109370
                    * COUNT IS EQUAL TO +1 A CHECK IS MADE TO     * 212 K1109373
                    * INSURE THAT THE COMMA IS IN A VALID POSITION* 212 K1109376
                    *   IN THE CASE OF SUBSCRIPTS, A CHECK FOR TOO* 212 K1109380
                    * MANY COMMAS IS MADE.                        * 212 K1109383
                    *                                             * 212 K1109386
                    *********************************************** 212 K1109390
                    *                                             * 212 K1109393
                    ARITH EQU     *         ENTRY POINT                 K1109396
                          STX  L1 IDSAV     SAVE STMT START ADDR    212 K1109400
                          LD    1 0         STMT ID WD              212 K1109403
                          SLA     5         RT JUSTIFY WD           212 K1109406
                          SRA     7         EXTRACT WD CNT          212 K1109410
                          S       TWO       ADJ FOR STMT ID/TERM    212 K1109413
                          STO  L  NRMSV     SAVE STMT WD CNT        212 K1109416
                          MDX   1 1         MOVE POINTER            212 K1109420
                    LOOP  SLA     16                                212 K1109423
                          STO     SW        SW=0                    212 K1109426
                          STO     COUNT     COUNT=0                 212 K1109430
                          STX   1 LOCSV     SAVE POINTER            212 K1109433
                          LD    1 0                                 212 K1109436
                          S       COMA1     IS IT AN ARRAY COMMA    212 K1109440
                          BNZ     FUNCT     NO-BR                   212 K1109443
                          MDM     SW,1      INCR SW                 212 K1109446
                    OVER  MDX   1 -1        DECR LOC                212 K1109450
                          LD    1 0                                 212 K1109453
                          S       COMA1     IF LOC=2B               212 K1109456
                          BNZ     OVER1                             212 K1109460
                          MDM     SW,1      * THEN INCR SW          212 K1109463
                          B       OVER      * LOOP                  212 K1109466
                    *                                             * 212 K1109470
                    OVER1 BSI     PAREN     CHECK FOR PARENS        212 K1109473
                          B       OVER      NO-LOOP                 212 K1109476
                    *                                             * 212 K1109480
                          SKP     Z         SKIP IF (0010)          212 K1109483
                          S       TEN       IF (001A) OR (0010)     212 K1109486
                          BZ      PERR      ERROR CONDITION         212 K1109490
                          S       TWO       IF (001C)               212 K1109493
                          BZ      OVER2     YES-BR                  212 K1109496
                          MDM     SW,-2     IS SW LT OR EQ 2        212 K1109500
                          B       PERR      NO-ERROR                212 K1109503
                          B       RSTOR     YES-OKAY                212 K1109506
                    *                                             * 212 K1109510
                    OVER2 MDM     SW,-1     IS SW LT OR EQ 1        212 K1109513
                          B       PERR      NO-ERROR                212 K1109516
                    *                                             * 212 K1109520
                    RSTOR LDX  I1 LOCSV     YES-RESTART             212 K1109523
                          MDX   1 1         * WITH NEXT LOC         212 K1109526
                          MDM     NRMSV,-1  DECR WD CNT             212 K1109530
                          B       LOOP      CONTINUE SCANNING       212 K1109533
                    *                                               212 K1109536
                          LDX  I1 IDSAV     RESTORE XR1             212 K1109540
                          SLA     16        CLAER ACC               212 K1109543
                          B    L  RTRN      RETURN                  212 K1109546
                    *                                             * 212 K1109550
                    *                                             * 212 K1109553
                    PERR  B    L  ER35      TOO MANY COMMAS IN SUBSC212 K1109560
                    *********************************************** 212 K1109563
                    *                                               212 K1109566
                    * ROUTINE CONSTANTS                             212 K1109570
                    *                                               212 K1109573
                    *********************************************** 212 K1109576
                    SW    DC      *-*                               212 K1109580
                    COUNT DC      *-*                               212 K1109583
                    TWO   DC      2                                 212 K1109586
                    TEN   DC      10                                212 K1109590
                    SIXTN DC      16                                212 K1109593
                    COMA1 DC      /2B                               212 K1109596
                    COMA2 DC      /12                               212 K1109600
                    LOCSV DC      *-*                               212 K1109603
                    *                                               212 K1109606
                    FUNCT LD    1 0                                 212 K1109610
                          S       COMA2     IS IT A FUNCTION COMMA  212 K1109613
                          BNZ     RSTOR     NO-RESTART              212 K1109616
                    *                                             * 212 K1109620
                    AGAIN MDX   1 -1        DECR LOC                212 K1109623
                          BSI     PAREN     CHECK FOR PARENS        212 K1109626
                          B       AGAIN     NO-LOOP                 212 K1109630
                    *                                             * 212 K1109633
                          BNZ     ER36      BR IF NOT (0010)        212 K1109636
                          LD    1 -1        GET PRECEEDING WORD     212 K1109640
                          BP      ER36      BR IF NOT CONSTANT      212 K1109643
                          B       RSTOR     RESTART                 212 K1109646
                    *********************************************** 212 K1109650
                    *                                             * 212 K1109655
                    * THIS ROUTINE COUNTS PARENTHESIS WHEN        * 212 K1109660
                    * ENCOUNTERED.                                * 212 K1109663
                    *                                             * 212 K1109666
                    *********************************************** 212 K1109670
                    *                                             * 212 K1109673
                    PAREN DC      *-*       ENTRY POINT             212 K1109676
                          LD    1 0                                 212 K1109680
                          S       TWO       IS LOC=RT PAREN         212 K1109683
                          BNZ     PARN1     NO-BR                   212 K1109686
                          LD      COUNT     YES-DECR COUNT          212 K1109690
                          S    L  ONE                               212 K1109693
                          STO     COUNT                             212 K1109696
                          B    I  PAREN     RETURN                  212 K1109700
                    *                                             * 212 K1109703
                    PARN1 S       SIXTN     IS IT COMMA             212 K1109706
                          BZ   I  PAREN     YES-RETURN              212 K1109710
                          A       TWO       NO-CHECK FOR ALL        212 K1109720
                          SKP     Z         * LEFT PAREN            212 K1109730
                          S       TEN                               212 K1109740
                          SKP     Z                                 212 K1109750
                          S       TWO                               212 K1109760
                          SKP     Z                                 212 K1109770
                          S       TWO                               212 K1109780
                          BNZ  I  PAREN     RETURN IF NOT A PAREN   212 K1109790
                    *                                             * 212 K1109800
                          LD      COUNT     INCR CO4NT              212 K1109810
                          A    L  ONE                               212 K1109820
                          STO     COUNT                             212 K1109830
                          S    L  ONE       COUNT=1                 212 K1109840
                          BNZ  I  PAREN     NO-PAREN                212 K1109850
                    *                                             * 212 K1109860
                          MDM     PAREN,1   YES-MOVE RETURN         212 K1109870
                          LD    1 0         STORE ACC W/ RESULTS    212 K1109880
                          S       SIXTN     * OF TESTING FOR (0010) 212 K1109890
                          B    I  PAREN     RETURN                  212 K1109900
                    *                                             * 212 K1109910
                    *                                                   K1109920
                    *             READ IN AND GO TO NEXT PHASE          K1109930
                    *                                                   K1109940
                    OUT   LDX  I1 NXTPH+1   LOAD PARAM FOR READING      K1109950
                          LDD     NXTPH+2   NEXT PHASE                  K1109960
                          BSC  L  ROL       BR TO READ IN NEXT PHASE    K1109970
                          BSS  E  0         MAKE ADDRESS EVEN           K1109980
                    NXTPH DC      42        ID OF NEXT PHASE            K1109990
                          DC      *-*       CORE ADDR OF NEXT PHASE     K1110000
                          DC      *-*       WORD COUNT NEXT PHASE       K1110010
                          DC      *-*       SECTOR ADDRESS NEXT PHASE   K1110020
                    PATCH BSS     /7DF5-*   PATCH AREA             2-11 K1110030
                          DC      0                                     K1110040
                    ERR31 EQU     31                                212 K1110050
                    ERR32 EQU     32                                212 K1110060
                    ERR33 EQU     33                                212 K1110070
                    ERR34 EQU     34                                212 K1110080
                    ERR35 EQU     35                                212 K1110090
                    ERR36 EQU     36                                212 K1110100
                          END     BPHAR-2                               K1110110
