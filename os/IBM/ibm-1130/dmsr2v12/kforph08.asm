                    *************************************************** K0800000
                    *                                                 * K0800010
                    *STATUS - VERSION 2, MODIFICATION 12              * K0800020
                    *                                                 * K0800030
                    *FUNCTION/OPERATION-                              * K0800040
                    *   * CHECKS VARIABLE NAMES FOUND IN STATEMENT    * K0800050
                    *     STRING FOR VALIDITY.                        * K0800060
                    *   * ADDS VALID VARIABLES TO THE SYMBOL TABLE    * K0800070
                    *   * ENSURES THAT ALL VARIABLE NAMES CONFORM TO  * K0800080
                    *     THE IMPLICIT OR EXPLICIT MODE SPECIFICATIONS* K0800090
                    *     (REAL OR INTEGER).                          * K0800100
                    *   * ADDS UNIQUE INTEGER CONSTANTS TO THE SYMBOL * K0800110
                    *     TABLE.                                      * K0800120
                    *   * REPLACES NAMES AND CONSTANTS IN THE STMNT   * K0800130
                    *     STRING BY POINTERS TO THEIR RESPECTIVE      * K0800140
                    *     SYMBOL TABLE ENTRIES.                       * K0800150
                    *   * REPLACES INTERNAL STATEMENT NUMBERS BY      * K0800160
                    *     POINTERS TO CORRESPONDING SYMBOL TABLE      * K0800170
                    *     ENTRIES.                                    * K0800180
                    *   * PLACES PARAMETERS FROM STATEMENT FUNCTION   * K0800190
                    *     STATEMENTS INTO THE SYMBOL TABLE.           * K0800200
                    *   * CONVERTS THE LEFT PARENTHESIS OF SUBSCRIPTS * K0800210
                    *     TO A SPECIAL DIMENSION INDICATOR            * K0800220
                    *   * REPLACES OPERATORS WITH POINTERS TO THE     * K0800230
                    *     SCAN-FORCING TABLE.                         * K0800240
                    *                                                 * K0800250
                    *ENTRY POINTS-                                    * K0800260
                    *   * ORIGIN-PHASE 8 IS READ INTO CORE BY THE ROL * K0800270
                    *     PROGRAM AND EXECUTION BEGINS AT THIS ADDRESS* K0800280
                    *                                                 * K0800290
                    *INPUT-                                           * K0800300
                    *   * THE STATEMENT STRING FROM PREVIOUS PHASES   * K0800310
                    *   * THE SYMBOL TABLE FROM PREVIOUS PHASES       * K0800320
                    *   * DCOM                                        * K0800330
                    *                                                 * K0800340
                    *OUTPUT-                                          * K0800350
                    *   * THE STATEMENT STRING AS MODIFIED BY THIS PHS* K0800360
                    *   * THE SYMBOL TABLE AS MODIFIED BY THIS PHASE  * K0800370
                    *   * DCOM                                        * K0800380
                    *                                                 * K0800390
                    *EXTERNAL REFERENCES-                             * K0800400
                    *   SUBROUTINES-                                  * K0800410
                    *      * ROL                                      * K0800420
                    *   COMMA/DCOM                                    * K0800430
                    *      * $PHSE                                    * K0800440
                    *                                                 * K0800450
                    *EXITS                                            * K0800460
                    *   NORMAL-PHASE EXITS VIA THE ROL SUBROUTINE     * K0800470
                    *                                                 * K0800480
                    *   ERROR                                         * K0800490
                    *      * OVERLAP ERROR CAUSES NEXT PHASE TO BE    * K0800500
                    *        LOADED WITHOUT PROCESSING.               * K0800510
                    *      * COMPILATION ERRORS DETECTED BY THIS PHASE* K0800520
                    *      * ARE 7, 24, 25, 26, 41 AND 43.            * K0800530
                    *                                                 * K0800540
                    *TABLES/WORK AREAS-N/A                            * K0800550
                    *                                                 * K0800560
                    *ATTRIBUTES- NONE.                                  K0800570
                    *                                                 * K0800580
                    *NOTES- THE SWITCHES USED IN PHASE 8 FOLLOW.  IF    K0800590
                    *   NON-ZERO, THE SWITCH IS TRANSFER=T.  IF ZERO,   K0800600
                    *   THE SWITCH IS NORMAL=N.                         K0800610
                    *      SW1 - GOTO STATEMENT                         K0800620
                    *          T=GOTO STATEMENT                         K0800630
                    *      SW2 - IF STATEMENT                           K0800640
                    *          T= IF STATEMENT                          K0800650
                    *      SW3 - POSSIBLE ASF                           K0800660
                    *          N0POSSIBLE ASF                           K0800670
                    *      SW4 - READ OR WRITE STMNT                    K0800680
                    *          T=READ OR WRITE STMNT                    K0800690
                    *      SW5 - PACK STRING BY CNT                     K0800700
                    *          T=PACK STRING                            K0800710
                    *      SW6 - ASF NAME TABLE                         K0800720
                    *          T=PUT NAMES IN ASF TABLE                 K0800730
                    *      SW7 - ASF NAME TABLE                         K0800740
                    *          T=CHECK NAMES IN ASF TABLE               K0800750
                    *      SW8 - ASF STMNT                              K0800760
                    *          T=ASF STMNT                              K0800770
                    *      SW9 - PHASING SWITCH                         K0800780
                    *          N=PHASING SWITCH                         K0800790
                    *      SW10- TWO-WORD NAME                          K0800800
                    *          T=TWO-WORD NAME                          K0800810
                    *                                                   K0800820
                    *************************************************** K0800830
                          HDNG    1130 FORTRAN COMPILER PHASE 8         K0800840
                          ABS                                           K0800850
                    *                                                   K0800860
                    *             SYSTEM EQUATES                        K0800870
                    *                                                   K0800880
                    MEMRY EQU     /8000     CORE SIZE                   K0800890
                    OVERL EQU     MEMRY-1501 PHASE OVERLAY AREA START   K0800900
                    ROL   EQU     MEMRY-68  LOC OF RTN TO READ NEXT PH  K0800910
                    $PHSE EQU     /78       NO. OF PHASE NOW IN CORE    K0800920
                    PHLEN EQU     4         NO. OF SECTORS THIS PHASE   K0800925
                          ORG     OVERL                                 K0800930
                    PHID  EQU     38        ID NUMBER THIS PHASE        K0800940
                    *                                                   K0800950
                    *                  FORTRAN COMMUNICATION AREA       K0800960
                    ORG   BSS     1    ORIGIN ADDRESS               2-4 K0800965
                    SOFS  BSS     1    START OF STRING                  K0800970
                    EOFS  BSS     1    END OF STRING                    K0800980
                    SOFST BSS     1    START OF SYMBOL TABLE            K0800990
                    SOFNS BSS     1    START OF NON-STATEMENT NUMBERS   K0801000
                    SOFXT BSS     1    START OF SUBSCRIPT TEMPORARIES   K0801010
                    SOFGT BSS     1    START OF GENERATED TEMPORARIES   K0801020
                    EOFST BSS     1    END OF SYMBOL TABLE              K0801030
                    COMON BSS     1    NEXT AVAILABLE COMMON            K0801040
                    CSIZE BSS     1    SIZE OF COMMON                   K0801050
                    ERROR BSS     1    OVERLAP ERROR                    K0801060
                    FNAME BSS     2    PROGRAM NAME                     K0801070
                    SORF  BSS     1    SUBROUTINE(-) OR FUNCTION(+)     K0801080
                    CCWD  BSS     1    CONTROL CARD WORD                K0801090
                    *                BIT 15 TRANSFER TRACE              K0801100
                    *                BIT 14 ARITHMETIC TRACE            K0801110
                    *                BIT 13 EXTENDED PRECISION          K0801120
                    *                BIT 12 LIST SYMBOL TABLE           K0801130
                    *                BIT 11 LIST SUBPROGRAM NAMES       K0801140
                    *                BIT 10 LIST SOURCE PROGRAM         K0801150
                    *                BIT  9 ONE WORD INTEGERS           K0801160
                    *                BIT  8 ORIGIN                  2-4 K0801170
                    *                                                   K0801180
                    IOCS  BSS     1    IOCS CONTROL CARD WORD           K0801190
                    *                BIT 15 CARD                        K0801200
                    *                BIT 14 PAPER TAPE                  K0801210
                    *                BIT 13 TYPEWRITER                  K0801220
                    *                BIT 12 1443 PRINTER                K0801230
                    *                BIT 11 MAGNETIC TAPE               K0801240
                    *                BIT 10 KEYBOARD                    K0801250
                    *                BIT  8 DISK                        K0801260
                    *                BIT  3 PLOTTER                     K0801270
                    *                BIT  1 UNFORMATTED DISK            K0801280
                    DFCNT BSS     1    FILE TABLE LENGTH IN WORDS       K0801290
                    *                                                   K0801300
                    *                                                   K0801310
                    *                                                   K0801320
                    *                  END OF FORTRAN COMMUNICATION     K0801330
                    *                  AREA                             K0801340
                    *                                                   K0801350
                    BPHAR EQU     *+2       BEGINNING ADDR PHASE AREA   K0801360
                          DC      0         LOADER WORK AREA            K0801370
                          DC      -38       -PHASE ID FOR SLET LOOKUP   K0801380
                          DC      NXTPH-*+1 TABLE FOR NEXT PHASE ENTRY  K0801390
                          DC      1         ONE ENTRY TO BE SET BY LDR  K0801400
                          ORG     *-2                                   K0801410
                    *                                                   K0801420
                    *             INITIALIZE PHASE                      K0801430
                    *                                                   K0801440
                    ORGIN LDX   1 PHID      GET ID THIS PHASE           K0801450
                          STX  L1 $PHSE     STORE IN SYSTEM PHASE AREA  K0801460
                          LDX  I1 SOFS      START OF STRING ADDRESS     K0801470
                          LD      ERROR     OVERLAP ERROR INDICATOR     K0801480
                          BSC  L  CV1,+-    BR TO INITIALIZE STMNT SCAN K0801490
                    *                                                   K0801500
                    *             READ IN NEXT PHASE AND EXECUTE        K0801510
                    *                                                   K0801520
                    WAIT  LDX  I1 NXTPH+1   LOAD PARAM FOR READING      K0801530
                          LDD     NXTPH+2   NEXT PHASE                  K0801540
                          BSC  L  ROL       GO TO READ NEXT PHASE       K0801550
                          BSS  E  0                                     K0801560
                    NXTPH DC      39        ID OF NEXT PHASE            K0801570
                          BSS     3         LOADER TABLE FOR NEXT PHS   K0801580
                    *                                                   K0801590
                    *             CONSTANTS                             K0801600
                    *                                                   K0801610
                    ENDC  DC      /02       END STMNT CONSTANT          K0801620
                    FIOC  DC      /1B-/02   FIO STMNT CONSTANT          K0801630
                    CONTC DC      /16-/1B   CONTINUE STMNT CONSTANT     K0801640
                    FORC  DC      /0C-/16   FORMAT STMNT CONSTANT       K0801650
                    EQUC  DC      /15-/0C   EQUIVALENCE STMNT CONSTANT  K0801660
                    ERRCN DC      /14-/15   ERROR STMNT CONSTANT        K0801670
                    CLINK DC      /1C-/14   CALL LINK STMNT CONSTANT    K0801680
                    DFILE DC      /1E-/1C   DEFINE FILE STMNT CONSTANT  K0801690
                    DATAS DC      /1F-/1E   DATA STMNT CONSTANT         K0801700
                    *                                                   K0801710
                    *             MOVE TO NEXT STATEMENT                K0801720
                    *                                                   K0801730
                    MOVE  LDX  L1 *-*       ADDR OF CURRENT STMNT ID WD K0801740
                    IDSV1 EQU     *-1       LABEL ADDR LAST INSTRUCTION K0801750
                          LD    1 0         CURRENT STMNT ID WORD       K0801760
                          AND  L  S07FC     EXTRACT STMNT WD COUNT      K0801770
                          SRA     2         RIGHT JUSTIFY               K0801780
                          STO     *+1                                   K0801790
                          MDX  L1 *-*       INCR TO NEXT STMNT ID WORD  K0801800
                    *                                                   K0801810
                    *             INITIALIZE TO SCAN BODY OF STATEMENT  K0801820
                    *                                                   K0801830
                    CV1   STX   1 IDSV1     SAVE ADDR OF STMNT ID WORD  K0801840
                          LDX  L3 ASFT      ARITH STMNT FUNC TBL ADDR   K0801850
                          STX  L3 ASFNT     SAVE ADDRESS NAME TABLE     K0801860
                          SLA     16        CLEAR ACC                   K0801870
                          STO  L  SW1       RESET SWITCH 1              K0801880
                          STO  L  SW2       RESET SWITCH 2              K0801890
                          STO  L  SW4       RESET SWITCH 4              K0801900
                          STO  L  SW5       RESET SWITCH 5              K0801910
                          STO  L  SW6       RESET SWITCH 6              K0801920
                          STO  L  SW7       RESET SWITCH 7              K0801930
                          STO  L  SW8       RESET SWITCH 8              K0801940
                          STO  L  SW9       RESET SWITCH 9              K0801950
                          STO  L  SW10      RESET SWITCH 10             K0801960
                          STO  L  CNT       STMNT WORD COUNT TEMPORARY  K0801970
                          STO  L  PAR       LEFT PARENTHESIS SWITCH     K0801980
                          LD    1 0         STMNT ID WORD               K0801990
                          BSC     E         SKIP IF STMNT NOT NUMBERED  K0802000
                          MDX   1 1         INCR STMNT POINTER          K0802010
                          MDX   1 1         INCR STMNT POINTER          K0802020
                    *                                                   K0802030
                    *             CHECK STATEMENT TYPE                  K0802040
                    *                                                   K0802050
                          LD   I  IDSV1     STMNT ID WORD               K0802060
                          SRA     11        POSITION TO TEST STMNT TYPE K0802070
                          S       ENDC      END STMNT CONSTANT          K0802080
                          BSC  L  WAIT,+-   BR TO RD NEXT PH IF END     K0802090
                          S       FIOC      FIO STMNT CONSTANT          K0802100
                          BSC  L  MOVE,+-   BR IF FIO STMNT             K0802110
                          S       CONTC     CONTINUE STMNT CONSTANT     K0802120
                          BSC  L  CV0,+-    BR IF CONTINUE STMNT        K0802130
                          S       FORC      FORMAT STMNT CONSTANT       K0802140
                          BSC  L  MOVE,+-   BR IF FORMAT STMNT          K0802150
                          S       EQUC      EQUIVALENCE STMNT CONSTANT  K0802160
                          BSC  L  CV5,+-    BR IF EQUIVALENCE STMNT     K0802170
                          S       ERRCN     ERROR STMNT CONSTANT        K0802180
                          BSC  L  MOVE,+-   BR IF ERROR STMNT           K0802190
                          S       CLINK     CALL LINK STMNT CONSTANT    K0802200
                          BSC  L  MOVE,-+   BR IF CALL LINK STMNT       K0802210
                          S       DFILE     DEFINE FILE CONSTANT        K0802220
                          BSC  L  MOVE,-+   BR IF DEFINE FILE STMNT     K0802230
                          S       DATAS     DATA STMNT CONSTANT         K0802240
                          BSC  L  MOVE,+-   BR IF DATA STMNT            K0802250
                          LD   L  SW3       ARITH STMNT FUNC SWITCH     K0802260
                          BSC  L  CV2,Z     BR ASF STMNT NOT POSSIBLE   K0802270
                          LD   I  IDSV1     STMNT ID WORD               K0802280
                          SRA     11        RIGHT JUSTIFY STMNT TYPE    K0802290
                          BSC  L  CV5,+-    BF IF ARITHMETIC STMNT      K0802300
                          STX  L0 SW3       SET SW3 NON-ARITH STMNT     K0802310
                    CV2   LD   I  IDSV1     STMNT ID WORD               K0802320
                          SRA     11        RIGHT JUSTIFY STMNT TYPE    K0802330
                          S    L  GOTOC     GO TO STMNT CONSTANT        K0802340
                          BSC  L  CV3,Z     BR IF NOT GOTO STMNT        K0802350
                          LDX   3 43                                    K0802360
                          STX  L3 ERNO      SET UP ERROR 43             K0802370
                          LD    1 0         LD NEXT WORD OF STMNT       K0802380
                          S    L  LPAR      LEFT PARENTHESIS CONSTANT   K0802390
                          BSC  L  CV25A,Z   BR IF NOT LEFT PARENTHESIS  K0802400
                          STX  L0 SW1       SET SWITCH 1 FOR GOTO STMNT K0802410
                          BSC  L  CV5A      BR TO CHECK FOR OPERATOR    K0802420
                    CV3   S    L  DOC       DO STMNT CONSTANT           K0802430
                          BSC  L  CV3A,Z    BR NOT DO STMNT             K0802440
                          LDX   3 43                                    K0802450
                          STX  L3 ERNO      SET UP ERROR 43             K0802460
                          BSC  L  CV25A     BR TO CHK STMNT NUMBER OK   K0802470
                    CV3A  S    L  IFC       IF STMNT CONSTANT           K0802480
                          BSC  L  CV4,Z     BR IF NOT IF STMNT          K0802490
                          LDX   3 43                                    K0802500
                          STX  L3 ERNO      SET UP ERROR 43             K0802510
                          STX  L0 SW2       SET SW2 =IF STMNT           K0802520
                          MDX     CV5       BR TO CHK GOTO STMNT SWITCH K0802530
                    CV4   S    L  RDC       READ STMNT CONSTANT         K0802540
                          BSC  L  *+4,+-    BR TO SET SW4 IF READ       K0802550
                          S    L  WTC       WRITE STMNT CONSTANT        K0802560
                          BSC  L  CV5,Z     BR IF NOT WRITE STMNT       K0802570
                          STX  L0 SW4       SET SW4=READ OR WRITE STMNT K0802580
                          LDX   3 46        INDEX REG 3 = 46            K0802590
                          STX  L3 ERNO      SET UP ERROR 46             K0802600
                    CV5   LD   L  SW1       SWITCH 1                    K0802610
                          BSC  L  CV26,Z    BR IF .GOTO. STMNT          K0802620
                          LD      SW2       SWITCH 2                    K0802630
                          BSC  L  CV29,Z    BR IF .IF. STMNT            K0802640
                          LD      SW4       SWITCH 4                    K0802650
                          BSC  L  CV31,Z    BR IF RD OR WRT STMNT       K0802660
                    *                                                   K0802670
                    *             CHECK FOR OPERATOR                    K0802680
                    *                                                   K0802690
                    CV5A  LD    1 0         NEXT STMNT WD               K0802700
                          BSC  L  CV11,+Z   BR IF NOT OPERATOR          K0802710
                    CV5B  LD    1 0         NEXT STMNT WD               K0802720
                          S    L  SEMIC     SEMICOLON CONSTANT          K0802730
                          BSC  L  CV6,Z     BR IF NOT SEMICOLON         K0802740
                    CV5C  SLA     16        CLEAR ACCUMULATOR           K0802750
                          STO   1 0         CONVERT SEMICOLON OPERATOR  K0802760
                          MDX   1 1         INCR STMNT POINTER          K0802770
                    *                                                   K0802780
                    *             CHECK FOR ARITHMETIC STMNT FUNCTION   K0802790
                    *                                                   K0802800
                    CV0   LD      SW3       SWITCH 3                    K0802810
                          BSC  L  CV5D,Z    BR ASF STMNT NOT POSSIBLE   K0802820
                          LD   I  IDSV1     STMNT ID WORD               K0802830
                          SRA     11        RIGHT JUSTIFY STMNT TYPE    K0802840
                          S       EQCOO     EQUIVALENCE STMNT CONSTANT  K0802850
                          BSC  L  CV5D,+-   BR IF EQUIVALENCE STMNT     K0802860
                          LD      SW8       SWITCH 8                    K0802870
                          BSC  L  CV0A,+-   BR IF NOT ASF STMNT         K0802880
                          LD   I  IDSV1     STMNT ID WORD               K0802890
                          OR      ASFID     CHANGE ID WD TO ASF TYPE    K0802900
                          STO  I  IDSV1     RESTORE ID WORD             K0802910
                    *                                                   K0802920
                    *             CHECK FOR STMNT NUMBER                K0802930
                    *                                                   K0802940
                          BSC     E         SKIP NEXT IF NO STMNT NO.   K0802950
                          MDX     *+1       BR IF STMNT NUMBERED        K0802960
                          MDX     CV5D      BR NO STMNT NUMBER          K0802970
                          STX   1 XR1SV+1   SAVE INDEX REGISTER 1       K0802980
                          LDX  I1 IDSV1     INDEX REG 1 = ADDR ID WORD  K0802990
                          LD    1 1         STMNT NUMBER                K0803000
                          SLA     1         SHIFT OFF INDR BIT          K0803010
                          M       MT3       MINUS 3                     K0803020
                          SLT     15        PRODUCT TO ACCUMULATOR      K0803030
                          A    L  SOFST     START OF SYMBOL TBL ADDRESS K0803040
                          S       MT2       MINUS 4                     K0803050
                          STO     *+2       SET STORE ADDRESS           K0803060
                          SLA     16        CLEAR ACC                   K0803070
                          STO  L  *-*       ZERO SYMBOL TBL ENTRY       K0803080
                          STX     SW5       SET SW5 ON-PACK STRING      K0803090
                          LD    1 0         STMNT ID WORD               K0803100
                          EOR     AONE      REMOVE STMNT NUMBER INDR    K0803110
                          STO   1 0         RESTORE ID WORD             K0803120
                          MDX   1 1         INCR TO NEXT STMNT WD       K0803130
                          LD    1 1         REMOVE STATEMENT NUMBER     K0803140
                          STO   1 0         CLOSE STMNT 1 WORD          K0803150
                          BSC  L  *-5,Z     BR TO CONTINUE CLOSING      K0803160
                          MDX  L  CNT,1     ADJUST STMNT WORD COUNT     K0803170
                    XR1SV LDX  L1 *-*       RESTORE INDEX REG 1         K0803180
                          MDX   1 -1        ADJUST STMNT POINTER        K0803190
                          MDX     CV5D      BR TO CHECK FOR STRING PACK K0803200
                    *                                                   K0803210
                    *             TAG SWITCH 3                          K0803220
                    *                                                   K0803230
                    CV0A  STX   0 SW3       ASF STMNT NOT POSSIBLE      K0803240
                    *                                                   K0803250
                    *             CHECK IF STRING CLOSURE REQUIRED      K0803260
                    *                                                   K0803270
                    CV5D  LD      SW5       SWITCH 5                    K0803280
                          BSC  L  MOVE,+-   BR TO GO TO NEXT STATEMENT  K0803290
                          STX   1 CX0       SAVE INDEX REGISTER 1       K0803300
                          LD      CX0       CURRENT STRING POINTER      K0803310
                          A       CNT       STMNT WORD COUNT            K0803320
                          STO     CX1       STORE ADDR TO MOVE FROM     K0803330
                          LD   L  EOFS      END OF STRING ADDRESS       K0803340
                          S       CX1       MOVE FROM ADDR              K0803350
                          STO     *+1       RANGE OF CLOSURE            K0803360
                          LDX  L3 *-*       INDEX REG 3 = RANGE         K0803370
                          LDX  L2 *-*       ADDR FIRST WD TO MOVE       K0803380
                    CX1   EQU     *-1       LABEL ADDR LAST INSTRUCTION K0803390
                          MDX   3 1         NO. OF WORDS TO MOVE        K0803400
                          LD    2 0         NEXT WORD TO MOVE           K0803410
                          STO   1 0         CLOSE UP STRING             K0803420
                          MDX   1 1         INCR ADDR TO MOVE TO        K0803430
                          MDX   2 1         INCR ADDR TO MOVE FROM      K0803440
                          MDX   3 -1        DECR MOVE COUNTER           K0803450
                          MDX     *-6       BR TO CONTINUE MOVE         K0803460
                          MDX   1 -1        ADJUST INDEX REG 1          K0803470
                          STX  L1 EOFS      NEW END OF STRING ADDRESS   K0803480
                          LDX  L1 *-*       RESTORE INDEX REG 1         K0803490
                    CX0   EQU     *-1       LABEL ADDR LAST INSTRUCTION K0803500
                          LD   I  IDSV1     STMNT ID WORD               K0803510
                          SRT     2         RIGHT JUSTIFY STMNT NORM    K0803520
                          S       CNT       CORRECT STMNT WORD COUNT    K0803530
                          SLT     2         SHIFT BACK TO NORMAL FORM   K0803540
                          STO  I  IDSV1     RESTORE CORRECTED STMNT ID  K0803550
                          BSC  L  MOVE      BR TO GO TO NEXT STATEMENT  K0803560
                    *                                                   K0803570
                    *             REMOVE CONSTANT OPERATOR FROM STMNT   K0803580
                    *                                                   K0803590
                    CV6   S       CONC      CONSTANT OPERATOR           K0803600
                          BSC  L  CV8,Z     BR IF NOT CONSTANT OPERATOR K0803610
                          MDX   1 -1        ADJUST TO REMOVE  OPERATOR  K0803620
                          BSI  L  SXB1      BR TO CLOSE STMNT ONE WORD  K0803630
                          MDX   1 1         MOVE STMNT POINTER          K0803640
                          STX   0 SW5       SET SW5 TO CLOSE STRING     K0803650
                          MDX  L  CNT,1     ADJUST STMNT WORD COUNT     K0803660
                    CV7   MDX   1 1         INCR STMNT POINTER          K0803670
                          MDX     CV5       BR TO TEST SWITCH 1         K0803680
                    *                                                   K0803690
                    *             CONSTANTS AND WORK AREA               K0803700
                    *                                                   K0803710
                    SW1   DC      0         GOTO STMNT SWITCH           K0803720
                    SW2   DC      0         IF STMNT SWITCH             K0803730
                    SW3   DC      0         POSSIBLE ASF STMNT SWITCH   K0803740
                    SW4   DC      0         READ OR WRITE STMNT SWITCH  K0803750
                    SW5   DC      0         CLOSE STRING SWITCH         K0803760
                    SW6   DC      0         ASF NAME TABLE PUT SWITCH   K0803770
                    SW7   DC      0         ASF NAME TABLE CHECK SWITCH K0803780
                    SW8   DC      0         ARITH STMNT FUNCTION SWITCH K0803790
                    SW9   DC      0         PHASING SWITCH              K0803800
                    SW10  DC      0         TWO WORD NAME SWITCH        K0803810
                    AONE  DC      1         STMNT NO. EXTRACT MASK      K0803820
                    EQCOO DC      /15       EQUIVALENCE STMNT CONSTANT  K0803830
                    ASFID DC      /D000     ARITH STMNT FUNC ID CON     K0803840
                    GOTOC DC      /0E       GOTO STMNT CONSTANT         K0803850
                    DOC   DC      /0B-/0E   DO STMNT CONSTANT           K0803860
                    IFC   DC      /0F-/0B   IF STMNT CONSTANT           K0803870
                    RDC   DC      /12-/0F   EAD STMNT CONSTANT          K0803880
                    WTC   DC      /11-/12   WRITE STMNT CONSTANT        K0803890
                    SEMIC DC      /1E       SEMICOLON CONSTANT          K0803900
                    CONC  DC      /5E-/1E   CONSTANT OPERATOR CONSTANT  K0803910
                    CNT   DC      0         STMNT WORD COUNT TEMPORARY  K0803920
                    S07FC DC      /07FC     STMNT NORM EXTRACT MASK     K0803930
                    MT2   DC      -4        STMNT NO. CONVERSION CON    K0803940
                    MT3   DC      -3        STMNT NO. CONVERSION CON    K0803950
                    *                                                   K0803960
                    *             CHECK FOR OPERATOR AND CONVERT        K0803970
                    *                                                   K0803980
                    CV8   LD      SW8       ASF STMNT SWITCH            K0803990
                          BSC  L  CV33,+-   BR IF NOT ASF               K0804000
                          LD      SW9       PHASING SWITCH              K0804010
                          BSC  L  CV10,+-   BR NOT SET ON               K0804020
                          LD    1 0         NEXT STMNT WORD             K0804030
                          S    L  LPAR      LEFT PARENTHESIS CONSTANT   K0804040
                          BSC  L  CV9,Z     BR IF NOT LEFT PARENTHESIS  K0804050
                          STX   0 SW6       SET SW6 TO T CONDITION      K0804060
                          MDX     CV10      BR TO CONVERT OPERATOR      K0804070
                    CV9   LD    1 0         NEXT STMNT WORD             K0804080
                          S    L  RPAR      RIGHT PARENTHESIS CONSTANT  K0804090
                          BSC  L  CV10,Z    BR IF NOT RIGHT PARENTHESIS K0804100
                          STO     SW9       RESET PHASING SWITCH        K0804110
                          STO     SW6       RESET ASF NAME TBL PUT SW   K0804120
                          STX   0 SW7       SET ASF NAME TBL CHECK SW   K0804130
                    *                                                   K0804140
                    *             CONVERT OPERATOR TO SCAN-FORCING CODE K0804150
                    *                                                   K0804160
                    CV10  LDX  L3 TABLE     TABLE ADDRESS               K0804170
                          LDX   2 QX2-TABLE INITIALIZE COUNTER          K0804180
                          LD      INST1     MDX INSTRUCTION             K0804190
                          STO     INST      INITIALIZE ODD              K0804200
                          LD    1 0         OPERATOR                    K0804210
                          BSC  L  CUD,E     BR IF ODD                   K0804220
                          LD      INST2     MDX INSTRUCTION             K0804230
                          STO     INST      INITIALIZE EVEN             K0804240
                          LDX   2 TABLE-QX1 INITIALIZE COUNTER          K0804250
                    CUD   LD    3 0         TABLE ENTRY                 K0804260
                          AND     SFF       EXTRACT OPERATOR            K0804270
                          S     1 0         COMPARE WITH OPERATOR       K0804280
                          BSC  L  OZ,+-     BR IF OPERATOR FOUND        K0804290
                    INST  NOP               INCR OR DECR TABLE ADDRESS  K0804300
                          MDX   2 -1        DECR COUNTER                K0804310
                          MDX     CUD       BR TO CONTINUE SEARCH       K0804320
                    OZ    LD    3 0         TABLE ENTRY                 K0804330
                          SRA     8         RIGHT JUSTIFY FORCING CODE  K0804340
                          STO   1 0         REPLACE OPERATOR            K0804350
                          MDX     CV7       BR TO MOVE STMNT POINTER    K0804360
                    *                                                   K0804370
                    *             TABLE TO CONVERT OPERATORS            K0804380
                    *                                                   K0804390
                    QX1   DC      /3000     NOP                         K0804400
                          DC      /323A     COLON                       K0804410
                          DC      /0E3E     =                           K0804420
                          DC      /0C1C     *                           K0804430
                          DC      /0620     -                           K0804440
                          DC      /040E     +                           K0804450
                    TABLE DC      /021D     )                           K0804460
                          DC      /100D     (                           K0804470
                          DC      /122B     ,                           K0804480
                          DC      /0821     /                           K0804490
                          DC      /423D     QUOTE (APOSTROPHE)          K0804500
                    QX2   DC      /3000     NOP                         K0804510
                    *                                                   K0804520
                    *             CONSTANTS AND WORK AREA               K0804530
                    *                                                   K0804540
                    INST1 MDX   3 1         INCR TABLE ADDR INSTRUCTION K0804550
                    INST2 MDX   3 -1        DECR TABLE ADDR INSTRUCTION K0804560
                    S8000 DC      /8000     ONE WORD NAME INDICATOR     K0804570
                    ERNO  DC      0         ERROR NUMBER TEMPORARY      K0804580
                    S0001 DC      1         DECIMAL ONE CONSTANT        K0804590
                    ERID  DC      /A008     ERROR IDENTIFIER            K0804600
                    SFF   DC      /01FF     OPERATOR EXTRACT MASK       K0804610
                    *                                                   K0804620
                    *             CHECK FOR LEGAL NAME                  K0804630
                    *                                                   K0804640
                    CV11  SLA     2         SHIFT INTO SIGN AND CARRY   K0804650
                          BSC  L  *+2,-     BR TO CHK FOR LEGAL NAME    K0804660
                          BSC  L  CV22,C    BR TO CHK IF LEGAL CONSTANT K0804670
                          SLA     16        CLEAR ACCUMULATOR           K0804680
                          STO  L  IND       SET INDR = ZERO             K0804690
                          LD      S8000     ONE WORD NAME INDICATOR     K0804700
                          STO  L  WORD2     SECOND WORD OF 2-WORD NAME  K0804710
                          LD    1 0         FIRST HALF OF NAME          K0804720
                          STO  L  WORD1     FIRST HALF OF NAME TEMP     K0804730
                          LD    1 1         SECOND HALF OF NAME         K0804740
                          BSC  L  CV13,-    BR IF ONE WORD NAME         K0804750
                          STO  L  WORD2     SECOND HALF OF NAME TEMP    K0804760
                          STX   0 SW10      SET TWO-WORD NAME SWITCH ON K0804770
                          LD    1 2         NEXT STMNT WORD             K0804780
                          BSC  L  CV13,-    BR IF NOT NAME WORD         K0804790
                          LDX   3 7         INDEX REG 3 = 7             K0804800
                    BK    STX   3 ERNO      SET UP ERROR NO. 7          K0804810
                    *                                                   K0804820
                    *             REPLACE STATEMENT WITH ERROR          K0804830
                    *                                                   K0804840
                    CV12  LDX  I1 IDSV1     STMNT ID WORD ADDRESS       K0804850
                          LD    1 0         STMNT ID WORD               K0804860
                          AND     S07FC     EXTRACT STMNT WORD COUNT    K0804870
                          SRA     2         RIGHT JUSTIFY               K0804880
                          A    L  IDSV1     ADDR OF STMNT ID WORD       K0804890
                          STO     *+1       ADDR OF NEXT STMNT ID WORD  K0804900
                          LDX  L2 *-*       INDEX REG 2 = NEXT STMNT ID K0804910
                          LD   L  EOFS      END OF STRING ADDRESS       K0804920
                          S       *-4       ADDR OF NEXT STMNT ID WORD  K0804930
                          STO     *+1       ADDR OF NEXT INSTRUCTION    K0804940
                          LDX  L3 *-*       INDEX REG 3=RANGE OF CLOSE  K0804950
                          MDX   3 1         NO. OF WORDS TO MOVE        K0804960
                          LD    1 0         STMNT ID WORD               K0804970
                          AND     S0001     EXTRACT LOW BIT             K0804980
                          OR      ERID      ERROR IDENTIFIER            K0804990
                          STO   1 0         STMNT ID WORD               K0805000
                          EOR     S0001     REVERSE STMNT NUMBER INDR   K0805010
                          BSC  L  *+4,E     BR IF BIT 15 ON             K0805020
                          STX   1 *+1       STMNT ID WORD ADDRESS       K0805030
                          MDX  L  *-*,4     INCR STMNT ID WORD          K0805040
                          MDX   1 1         INCR STMNT POINTER          K0805050
                          LD      ERNO      ERROR NUMBER                K0805060
                          STO   1 1         ERROR NO. INTO STMNT        K0805070
                          LD    2 0         NEXT WORD TO MOVE           K0805080
                          STO   1 2         CLOSE UP STRING             K0805090
                          MDX   2 1         INCR ADDR TO MOVE FROM      K0805100
                          MDX   1 1         INCR ADDR TO MOVE TO        K0805110
                          MDX   3 -1        DECR MOVE WORD COUNT        K0805120
                          MDX     *-6       BR TO CONTINUE CLOSING      K0805130
                          MDX   1 1         ADJUST TO MAKE NEW END OF   K0805140
                          STX  L1 EOFS      STRING ADDRESS.             K0805150
                          BSC  L  MOVE      BR TO SCAN NEXT STMNT       K0805160
                    *                                                   K0805170
                    *             PUT NAME IN ASF TABLE                 K0805180
                    *                                                   K0805190
                    CV13  LD   L  SW6       PUT NAME SWITCH             K0805200
                          BSC  L  CV14,+-   BR TO CHECK FOR NAME IN TBL K0805210
                          LDD     WORD1     TWO-WORD NAME               K0805220
                          STD  I  ASFNT     PUT NAME IN ASF TABLE       K0805230
                          BSI  L  NASFT     CHECK FOR DUPLICATE STMNT   K0805240
                          DC      ER25      FUNCTION PARAMETERS.        K0805250
                          DC      *                                     K0805260
                          MDX  L  ASFNT,2   INCR NEXT TABLE ENTRY ADDR  K0805270
                          LD   L  AFSNT     MINUS 3                     K0805280
                          S    L  ASFNT     NEXT TABLE ADDR             K0805290
                          BSC  L  CV15,-    BR IF LESS THAN 15 NAMES    K0805300
                    ER25  LDX   3 25        SET UP ERROR 25             K0805310
                          MDX     BK        BR TO STORE ERROR NUMBER    K0805320
                    *                                                   K0805330
                    *             CHECK FOR NAME IN ASF TABLE           K0805340
                    *                                                   K0805350
                    CV14  LD   L  SW7       CHECK NAME SWITCH           K0805360
                          BSC  L  CV16,+-   BR TO CHK FOR INTEGER NAME  K0805370
                    CV14A BSI  L  NASFT     CHK FOR NAME ALREADY IN TBL K0805380
                          DC      CV15                                  K0805390
                          DC      CV16                                  K0805400
                    CV15  LD      WORD2     SECOND WD OF STMNT NAME     K0805410
                          SLA     1         REMOVE SIGN BIT             K0805420
                          SRA     1                                     K0805430
                          STO     WORD2     RESTORE SECOND WORD OF NAME K0805440
                          LD      IND       ADD STATEMENT FUNCTION      K0805450
                          OR      S0400     PARAMETER TO THE SYMBOL     K0805460
                          STO     IND       TABLE ID WORD TEMPORARY     K0805470
                    *                                                   K0805480
                    *             CHECK FOR INTEGER NAME                K0805490
                    *                                                   K0805500
                    CV16  LD      WORD1     FIRST WORD OF NAME          K0805510
                          SRA     9         RIGHT JUSTIFY FIRST CHAR    K0805520
                          S       ILOW      LOW ALPHA LIMIT CONSTANT    K0805530
                          BSC  L  CV17,+Z   BR IF ALPHA BELOW I         K0805540
                          S       IHI       HIGH ALPHA LIMIT CONSTANT   K0805550
                          BSC  L  CV17,-Z   BR IF ALPHA ABOVE N         K0805560
                          LD      IND       SYMBOL TBL ID WORD TEMP     K0805570
                          OR      S4000     ADD INTEGER INDR            K0805580
                          STO     IND       RESTORE SYMBOL TBL ID TEMP  K0805590
                    *                                                   K0805600
                    *             PUT STMNT FUNC NAME IN SYMBOL TABLE   K0805610
                    *                                                   K0805620
                    CV17  BSI  L  PTCH2     BRANCH TO PUT NAME      2-3 K0805630
                          BSI  L  EXTRA     SYMBOL TBL ADDR TO STRING   K0805640
                    TAM   MDX   1 1         MOVE STMNT POINTER          K0805650
                    *                                                   K0805660
                    *             CHECK FOR LEFT PARENTHESIS OPERATOR   K0805670
                    *                                                   K0805680
                          LD    1 0         NEXT STMNT WORD             K0805690
                          S       LPAR      LEFT PARENTHESIS CONSTANT   K0805700
                          BSC  L  CV5,Z     BR IF NOT LEFT PARENTHESIS  K0805710
                    *                                                   K0805720
                    *             CHK FOR DIMENSIONED NAME, ARITH STMNT K0805730
                    *                                                   K0805740
                    DIMED LD    3 0         SYMBOL TABLE ID WORD        K0805750
                          AND     MK        DIMENSION BIT MASK          K0805760
                          BSC  L  CV19,Z    BR IF DIMENSIONED NAME      K0805770
                          LD   I  IDSV1     STMNT ID WORD               K0805780
                          SRA     11        RIGHT JUSTIFY STMNT TYPE    K0805790
                          BSC  L  CV18,Z    BR IF NOT ARITHM STMNT  2-7 K0805800
                          LD   L  SW3       ASF POSSIBLE SWITCH         K0805810
                          BSC  L  CV18,Z    BR IF ASF NOT POSSIBLE  2-7 K0805820
                          LD   L  SW8       ASF STMNT SWITCH            K0805830
                          BSC  L  CV18,Z    BR IF ASF STMNT SW ON   2-7 K0805840
                          STX  L0 SW8       SET ASF SWITCH ON           K0805850
                          STX  L0 SW9       SET PHASING SWITCH ON       K0805860
                    *                                                   K0805861
                    *             CHECK FOR PREVIOUS ASF WITH THIS NAME K0805862
                          LD    3 0         GET SYMBOL TABLE ID WD 2-12 K0805863
                          SLA     7         ISOLATE ASF BIT        2-12 K0805864
                          BSC  L  DIM10,-   BR IF NOT ALREADY ASF  2-12 K0805865
                          LDX   3 41        GENERATE A C41 ERROR   2-12 K0805866
                          BSC  L  BK        *FOR THIS STATEMENT    2-12 K0805867
                    DIM10 LD    3 0         SET ASF BIT            2-12 K0805868
                          OR      S0100     *IN THE SYMBOL         2-12 K0805869
                          STO   3 0         *TABLE ID WORD         2-12 K0805870
                    *                                                   K0805871
                    CV18  LD    3 0         BR TO CHK CLOSURE RE-  2-12 K0805872
                          SLA     7         *QUIRED IF ASF BIT IA  2-12 K0805873
                          BSC  L  CV5,+Z    *ON IN SBL TBL ID WORD  2-7 K0805874
                          LD   L  OLDEN     TEST OLD SYM TBL ENT   2-10 K0805875
                          BSC  L  CV18A,+-  BR IF NEW ENTRY        2-10 K0805876
                          LD    3 0         LD SYM TBL ID WORD     2-10 K0805877
                          SLA     2         TEST IF IN COMMON      2-10 K0805878
                          BSC  L  CV18A,-   *BR IF NOT             2-10 K0805879
                          LDX   3 35        FLAG ERROR 35          2-10 K0805880
                          BSC  L  BK        GO SET UP ERR MSG      2-10 K0805881
                    CV18A LD    3 0         SET SUBPROGRAM BIT ON  2-10 K0805882
                          OR      S0080     *IN THE SYMBOL TABLE    2-7 K0805883
                          STO   3 0         *ID WORD                2-7 K0805884
                          BSC  L  CV5       BR TO CHK CLOSURE REQRD 2-7 K0805885
                    *                                               2-7 K0805886
                    *             CONSTANTS AND WORK AREA               K0805890
                    *                                                   K0805900
                          BSS  E  0         MAKE ADDRESS EVEN           K0805910
                    WORD1 DC      0         FIRST HALF OF NAME          K0805920
                    WORD2 DC      0         SECOND HALF OF NAME         K0805930
                    ILOW  DC      /0049     LOW ALPHA LIMIT CONSTANT    K0805940
                    IHI   DC      /000C     HIGH ALPHA LIMIT CONSTANT   K0805950
                    IND   DC      0         SYMBOL TABLE ID WD TEMP     K0805960
                    LPAR  DC      /000D     LEFT PARENTHESIS CONSTANT   K0805970
                    SEMS  DC      /001E     SEMICOLON CONSTANT          K0805980
                    RPAR  DC      /001D     RIGHT PARENTHESIS CONSTANT  K0805990
                          BSS  E  0         MAKE ADDRESS EVEN           K0806000
                    NOS   DC      0         2 WORD TEMPORARY FOR        K0806010
                          DC      0         CONSTANT TO BE CONVERTED.   K0806020
                    NOST  DC      0         CUMULATIVE SUM OF CONSTANT  K0806030
                    NINE  DC      9         DECIMAL NINE CONSTANT       K0806040
                    TEN   DC      10        DECIMAL TEN CONSTANT        K0806050
                    YZ1   DC      0         INDEX REGISTER 3 TEMPORARY  K0806060
                    MK    DC      /1800     DIMENSION BIT MASK          K0806070
                    S0020 DC      /0020     STMNT NO. REFERENCED INDR   K0806080
                    RPARQ DC      /001D-/001E  RIGHT PARENTHESIS CON    K0806090
                    S0100 DC      /0100     ASF INDICATOR           2-7 K0806092
                    S0080 DC      /0080     SUBPROGRAM INDICATOR    2-7 K0806095
                    S0400 DC      /0400     STMNT FUNC PARAMETER INDR   K0806100
                    S4000 DC      /4000     INTEGER INDICATOR           K0806110
                    SS1   DC      /001A     DIMENSION LEVEL 1 OPERATOR  K0806120
                          DC      /1C       DIMENSION LEVEL 2 OPERATOR  K0806130
                          DC      /1E       DIMENSION LEVEL 3 OPERATOR  K0806140
                    H7E00 DC      /7E00     HIGH CHARACTER CONSTANT     K0806150
                    H6000 DC      /6000     LEADING ZEROES CONSTANT     K0806160
                    H8000 DC      /8000     SIGN CONSTANT               K0806170
                    *                                                   K0806180
                    *             CONVERT SPECIAL LEFT PARENTHESIS      K0806190
                    *                                                   K0806200
                    CV19  LD    3 0         SYMBOL TABLE ID WORD        K0806210
                          AND     MK        DIMENSION BIT MASK          K0806220
                          SRA     11        RIGHT JUSTIFY               K0806230
                          STO     *+1                                   K0806240
                          LDX  L3 *-*       1, 2, OR 3 DIMENSION INDR   K0806250
                          LD   L3 SS1-1     SPECIAL LEFT PARENTHESIS    K0806260
                          STO   1 0         STORE TO STMNT STRING       K0806270
                    CV20  MDX   1 1         MOVE STMNT POINTER          K0806280
                    *                                                   K0806290
                    *             CHECK FOR OPERATOR                    K0806300
                    *                                                   K0806310
                          LD    1 0         NEXT STMNT WORD             K0806320
                          S       SEMS      SEMICOLON CONSTANT          K0806330
                          BSC  L  CV21,+-   BR IF SEMICOLON OPERATOR    K0806340
                          S       RPARQ     RIGHT PARENTHESIS CONSTANT  K0806350
                          BSI  L  PTCH1     BRANCH TO PATCH AREA    2-3 K0806360
                          MDX     CV20      BR TO MOVE POINTER          K0806370
                    CV21  LDX   3 26                                    K0806380
                          STX  L3 ERNO      SET UP ERROR NUMBER 26      K0806390
                          BSC  L  CV12      BR TO REPLACE STMNT IN ERR  K0806400
                    *                                                   K0806410
                    *             CHECK FOR VALID CONSTANT              K0806420
                    *                                                   K0806430
                    CV22  SLT     32        CLEAR ACC AND EXTENSION     K0806440
                          STD     WORD1     CLEAR NAME TEMPORARY        K0806450
                          LD    1 0         FIRST HALF OF CONSTANT      K0806460
                          STD     NOS       STORE AND CLEAR 2ND HALF    K0806470
                          LD    1 1         SECOND HALF OF CONSTANT     K0806480
                          BSC  L  COOT,-    BR TO CONVERT IF NOT NEG    K0806490
                          STX  L0 SW10      SET TWO-WORD NAME SWITCH    K0806500
                          SLA     1         SHIFT OFF SIGN BIT          K0806510
                          STO     NOS+1     SECOND HALF OF CONSTANT     K0806520
                          LD    1 2         NEXT STMNT WORD             K0806530
                          BSC  L  CV23,+Z   BR IF NEG TO SET NAME ERROR K0806540
                    *                                                   K0806550
                    *             COLLECT CONSTANT TO BINARY            K0806560
                    *                                                   K0806570
                    COOT  LDS     0         RESET OVERFLOW AND CARRY    K0806580
                          LD      NOS       FIRST HALF OF CONSTANT      K0806590
                    XX1   SLA     2         SHIFT TO CHK FOR NUMERIC    K0806600
                          BSC  L  *+3,C     BR IF CARRY                 K0806610
                          BSC  L  CV23,Z    BR TO SET ERROR 24          K0806620
                          MDX     JDC       BR SET SYMBOL TBL ID INDRS  K0806630
                          BSC  L  CV23,-    BR NOT DIGIT TO SET ERROR   K0806640
                          SLA     1         SHIFT OFF NON-DIGIT BIT     K0806650
                          SRA     12        RIGHT JUSTIFY 4-BIT DIGIT   K0806660
                          STO     NOST      TEMPORARY                   K0806670
                          S       NINE      DECIMAL NINE LIMIT CONSTANT K0806680
                          BSC  L  CV23,-Z   BR IF GREATER THAN NINE     K0806690
                          LD      WORD1     PREVIOUS CONSTANT VALUE     K0806700
                          M       TEN       MPY BY 10                   K0806710
                          SLT     1                                     K0806720
                          BSC  L  CV23,Z    BR CONSTANT TOO LARGE       K0806730
                          SLT     15        SHIFT INTO ACCUMULATOR      K0806740
                          A       NOST      UNITS DIGIT                 K0806750
                          BSC  L  CV23,O    BR IF OVERLOW TO SET ERROR  K0806760
                          STO     WORD1     TEMPORARY CUMULATIVE SUM    K0806770
                          LDD     NOS       TWO-WORD CON TO CONVERT     K0806780
                          SLT     6         NEXT DIGIT TO HIGH 6 BITS   K0806790
                          STD     NOS       RESTORE TO TEMP             K0806800
                          MDX     XX1       BR TO CONVERT NEXT DIGIT    K0806810
                    JDC   LDX  L3 /C000     INTEGER CONSTANT INDR BITS  K0806820
                          STX   3 IND       SYMBOL TBL ID WD TEMPORARY  K0806830
                          MDX  L  SWCS,1    CHK SYMBOL TBL OVERLAP SW   K0806840
                          BSI  L  STOOK     BR PUT NAME IN SYMBOL TABLE K0806850
                          BSI  L  EXTRA     SYMBOL TBL ADDR ON STRING   K0806860
                          BSC  L  CV7       BR TO MOVE STMNT POINTER    K0806870
                    *                                                   K0806880
                    *             SET UP ERROR NO 24                    K0806890
                    *                                                   K0806900
                    CV23  LDX   3 24        INDEX REG 3= 24             K0806910
                          STX  L3 ERNO      SET UP ERROR 24             K0806920
                          BSC  L  CV12      BR REPLACE STMNT WITH ERROR K0806930
                    *                                                   K0806940
                    *             CHECK FOR VALID STATEMENT NUMBER      K0806950
                    *                                                   K0806960
                    CV25A SLA     16        CLEAR ACCUMULATOR           K0806970
                          STO     WORD2     ZERO SECOND WD OF TEMPORARY K0806980
                          LD    1 0         NEXT STMNT WORD             K0806990
                          BSC  L  CV12,-    BR REPLACE STMNT WITH ERROR K0807000
                          STO     WORD1     FIRST HALF OF STMNT NUMBER  K0807010
                          LD    1 1         NEXT STMNT WORD             K0807020
                          BSC  L  YYX,-     BR TO CHK FOR DUPLICATE NO. K0807030
                          SLA     1         SHIFT OFF SIGN BIT          K0807040
                          STO     WORD2     SECOND HALF OF STMNT NUMBER K0807050
                          STX  L0 SW10      SET TWO-WORD SWITCH ON      K0807060
                          LD    1 2         NEXT STMNT WORD             K0807070
                          BSC  L  CV12,+Z   BR TO SET ERROR IF 3RD WORD K0807080
                    *                                                   K0807090
                    *             ADJUST FOR LEADING ZEROES             K0807100
                    *                                                   K0807110
                    YYX   LD   L  WORD1     FIRST HALF OF NUMBER        K0807120
                    ZEROT AND     H7E00     EXTRACT FIRST DIGIT         K0807130
                          EOR     H6000     REMOVE NON-DIGIT BITS       K0807140
                          BSC  L  ZSLT,Z    BR NO LEADING ZERO          K0807150
                          LDD  L  WORD1     TWO-WORD NUMBER TEMPORARY   K0807160
                          SLT     6         SHIFT OFF LEADING ZERO      K0807170
                          OR      H8000     REPLACE SIGN BIT            K0807180
                          STD  L  WORD1     RESTORE NUMBER              K0807190
                          MDX     ZEROT     BR TO TEST FOR LEADING ZERO K0807200
                    ZSLT  LD   L  WORD2     SECOND HALF OF STMNT NUMBER K0807210
                          SRA     1         RIGHT JUSTIFY               K0807220
                          OR      H8000     REPLACE SIGN BIT            K0807230
                          STO  L  WORD2     RESTORE TO TEMPORARY        K0807240
                    *                                                   K0807250
                    *             CHK FOR DUPLICATE NO. IN SYMBOL TABLE K0807260
                    *                                                   K0807270
                          LDX  I3 SOFST     START OF STRING ADDRESS     K0807280
                          MDX     YY1       BR TO INITIALIZE LOOP       K0807290
                    YY0   LD    3 1         FIRST HALF SYMBOL TBL ENTRY K0807300
                          S    L  WORD1     FIRST HALF STMNT NUMBER     K0807310
                          BSC  L  YEQZ,Z    BR NOT FOUND                K0807320
                          LD    3 2         2ND HALF SYMBOL TABLE ENTRY K0807330
                          S    L  WORD2     2ND HALF STMNT NUMBER       K0807340
                          BSC  L  YYZ,+-    BR IF STMNT NUMBER FOUND    K0807350
                    YEQZ  MDX   3 -3        DECR SYMBOL TABLE ADDRESS   K0807360
                    YY1   STX  L3 YZ1       STORE IN TEMPORARY          K0807370
                          LD   L  YZ1       CURRENT SEARCH ADDRESS      K0807380
                          S    L  SOFNS     START OF NON-STMNT NUMBERS  K0807390
                          BSC  L  CV12,+    BR REPLACE STMNT WITH ERROR K0807400
                          MDX     YY0       BR TO CHECK NEXT ENTRY      K0807410
                    YYZ   LD   I  IDSV1     STMNT ID WORD TEMP          K0807420
                          SRA     11        RIGHT JUSTIFY STMNT TYPE    K0807430
                          S       DOCC      DO STMNT CONSTANT           K0807440
                          BSC  L  YYZQ,+-   BR IF DO STATEMENT          K0807450
                    YY2   LD    3 0         SET STATEMENT NUMBER REFER- K0807460
                          OR   L  S0020     ENCED INDICATOR IN THE      K0807470
                          STO   3 0         SYMBOL TABLE ID WORD.       K0807480
                    YYZQ  BSI  L  EXTRA     SYMBOL TABLE ADDR ON STRING K0807490
                          BSC  L  CV7       BR TO MOVE INCR             K0807500
                    *                                                   K0807510
                    *             CHECK FOR SEMICOLON OPERATOR          K0807520
                    *                                                   K0807530
                    CV26  LD   L  SW2       IF STMNT SWITCH             K0807540
                          BSC  L  CV27,+-   BR NOT IF STMNT             K0807550
                          LD    1 0         NEXT STMNT WORD             K0807560
                          S    L  SEMS      SEMICOLON CONSTANT          K0807570
                          BSC  L  CV28,Z    BR IF NOT SEMICOLON         K0807580
                          STO  L  SW1       RESET GOTO STMNT SWITCH     K0807590
                          STO  L  SW2       RESET IF STMNT SWITCH       K0807600
                          BSC  L  CV5C      BR TO CONVERT SEMICOLON     K0807610
                    *                                                   K0807620
                    *             CHECK FOR RIGHT PARENTHESIS OPERATOR  K0807630
                    *                                                   K0807640
                    CV27  LD    1 0         NEXT STMNT WORD             K0807650
                          S    L  RPAR      RIGHT PARENTHESIS CONSTANT  K0807660
                          BSC  L  CV28,Z    BR NOT RIGHT PARENTHESIS    K0807670
                          STO  L  SW1       RESET GOTO STMNT SWITCH     K0807680
                    LMQZ  BSC  L  CV10      BR TO CONVERT OPERATOR      K0807690
                    CV28  LD    1 0         NEXT STMNT WORD             K0807700
                          BSC  L  CV5B,-    BR IF OPERATOR              K0807710
                          MDX     CV25A     BR CHK VALID STMNT NUMBER   K0807720
                    *                                                   K0807730
                    *             CHECK FOR LEFT PARENTHESIS OPERATOR   K0807740
                    *                                                   K0807750
                    CV29  LD    1 0         NEXT STMNT WORD             K0807760
                          S    L  LPAR      LEFT PARENTHESIS CONSTANT   K0807770
                          BSC  L  CV30,Z    BR IF NOT LEFT PARENTHESIS  K0807780
                          MDX  L  PAR,1     PARENTHESIS INDICATOR       K0807790
                          MDX     LMQZ      BR TO CONVERT OPERATOR      K0807800
                    *                                                   K0807810
                    *             CHECK FOR RIGHT PARENTHESIS OPERATOR  K0807820
                    *                                                   K0807830
                    CV30  S       MRPO      RIGHT PARENTHESIS CONSTANT  K0807840
                          BSC  L  CV5A,Z    BR IF NOT RIGHT PARENTHESIS K0807850
                          MDX  L  PAR,-1    PARENTHESIS INDICATOR       K0807860
                          MDX     LMQZ      BR TO CONVERT OPERATOR      K0807870
                          STX  L0 SW1       SET GOTO STMNT SW ON        K0807880
                          MDX     LMQZ      BR TO CONVERT OPERATOR      K0807890
                    *                                                   K0807900
                    *             CHECK FOR APOSTROPHE                  K0807910
                    *                                                   K0807920
                    CV31  LD    1 0         NEXT STMNT CHARACTER        K0807930
                          S       QMRK      QUOTE (APOSTROPHE) CONSTANT K0807940
                          BSC  L  CV31A,Z   BR IF NOT QUOTE CHARACTER   K0807950
                    NSW4  STO  L  SW4       ZERO READ-WRITE STMNT SW    K0807960
                          BSC  L  CV5A      BR TO CHK FOR OPERATOR      K0807970
                    *                                                   K0807980
                    *             CHECK FOR A FORMAT STMNT NUMBER IN A  K0807990
                    *             READ OR WRITE STATEMENT.              K0808000
                    *                                                   K0808010
                    CV31A LD    1 0         NEXT STMNT CHARACTER        K0808020
                          BSC  L  CV5A,-    BR TO CHK FOR OPERATOR      K0808030
                          LD    1 1         STMNT POINTER+1 CHARACTER   K0808040
                          S    L  RPAR      BRANCH IF RIGHT PARENTHESIS K0808050
                          BSC  L  CV32,+-   AT STMNT POINTER + 1.       K0808060
                          LD    1 2         STMNT POINTER+2 CHARACTER   K0808070
                          S    L  RPAR      BRANCH IF NO RIGHT PAREN-   K0808080
                          BSC  L  CV5A,Z    THESIS AT POINTER + 2.      K0808090
                    CV32  LD    1 -1        STMNT POINTER-1 CHARACTER   K0808100
                          S       CONVL     BRANCH IF LEFT PARENTHESIS  K0808110
                          BSC  L  NSW4,+-   AT STMNT POINTER - 1.       K0808120
                          SLA     16        CLEAR ACCUMULATOR           K0808130
                          STO  L  SW4       ZERO READ OR WRITE STMNT SW K0808140
                          LDX   3 46                                    K0808150
                          STX  L3 ERNO      SET UP ERROR NUMBER 46      K0808160
                          BSC  L  CV25A     BR CHK FOR VALID STMNT NO.  K0808170
                    *                                                   K0808180
                    *             CHECK FOR EQUAL CHARACTER             K0808190
                    *                                                   K0808200
                    CV33  LD    1 0         NEXT STMNT CHARACTER        K0808210
                          S       LXE       EQUAL CHAR                  K0808220
                          BSC  L  CV10,Z    BR IF NOT EQUAL             K0808230
                          STX  L0 SW3       SET SW3 ASF NOT POSSIBLE    K0808240
                          MDX     LMQZ      BR TO CONVERT OPERATOR      K0808250
                    *                                                   K0808260
                    *             CONSTANTS AND WORK AREA               K0808270
                    *                                                   K0808280
                    CONVL DC      /10       CONVERTED LEFT PARENTHESIS  K0808290
                    EQOP  DC      /003E     EQUAL SIGN                  K0808300
                    LXE   EQU     EQOP      EQUAL SIGN                  K0808310
                    DOCC  DC      /0B       DO STMNT CONSTANT           K0808320
                    QMRK  DC      /3D       QUOTE (APOSTROPHE) CONSTANT K0808330
                    PAR   DC      0         PARENTHESIS INDICATOR       K0808340
                    MRPO  DC      /001D-/000D  RIGHT PARENTHESIS CON    K0808350
                          BSS  E  0         MAKE ADDRESS EVEN           K0808360
                    ASFT  BSS     32        ARITH STMNT FUNC NAME TABLE K0808370
                    AFSNT DC      *-3       ADDR OF LAST TABLE ELEMENT  K0808380
                    ASFNT DC      0         TABLE ADDRESS TEMPORARY     K0808390
                    SIGN1 DC      /8001     NUMBERED STMNT INDICATOR    K0808400
                    SAVE  DC      0         INDEX REG 3 TEMPORARY       K0808410
                    THRE  DC      3         DECIMAL 3 ADDRESS CONSTANT  K0808420
                    SWCS  DC      0         SYMBOL TABLE OVERLAP SWITCH K0808430
                    SAVES DC      0         INDEX REG 3 TEMPORARY       K0808440
                    OLDEN DC      0         NON ZERO IF IN SYM TBL 2-10 K0808445
                    *                                                   K0808450
                    *             PLACE NAME AND ID WD IN SYMBOL TABLE  K0808460
                    *                                                   K0808470
                    STOOK DC      0         RETURN ADDRESS              K0808480
                          SLA     16                               2-10 K0808485
                          STO     OLDEN     RESET OLD ENTRY SWITCH 2-10 K0808486
                          LDX  I3 SOFNS     START OF NON-STMNT NUMBERS  K0808490
                          MDX     HACK      BR TO INITIALIZE            K0808500
                    LP    LD    3 1         FIRST WD OF NAME-NEXT ENTRY K0808510
                          S    L  WORD1     COMPARE FIRST WORD OF NAME  K0808520
                          BSC  L  HACK-1,Z  BR NOT EQUAL, LOOK AT NEXT  K0808530
                          LD    3 2         2ND WD OF NAME              K0808540
                          S    L  WORD2     COMPARE SECOND WORD OF NAME K0808550
                          BSC  L  HACK-1,Z  BR NOT EQUAL, LOOK AT NEXT  K0808560
                          STX     OLDEN     SET NON ZERO           2-10 K0808565
                          LD      SWCS                                  K0808570
                          BSC  L  PUTF,+-   BR CHK FOR OVERLAP          K0808580
                          LD    3 0         SYMBOL TBL ID WORD          K0808590
                          SLA     1         SHIFT INTEGER INDR TO SIGN  K0808600
                          BSC  L  PUT,+Z    BR IF INTEGER BIT SET ON    K0808610
                          MDX   3 -3        DECR SYMBOL TABLE ADDRESS   K0808620
                    HACK  STX   3 SAVES                                 K0808630
                          LD      SAVES     CURRENT SEARCH ADDRESS      K0808640
                          S    L  EOFST     END OF SYMBOL TABLE ADDRESS K0808650
                          BSC  L  LP,-Z     BR TO CONTINUE IF NOT END   K0808660
                    *                                                   K0808670
                    *             PUT NAME IN SYMBOL TABLE              K0808680
                    *                                                   K0808690
                          LD   L  IND       SYMBOL TBL ID WD TEMPORARY  K0808700
                          STO   3 0         STORE AS SYMBOL TBL ID WORD K0808710
                          LD   L  WORD1     FIRST HALF NAME             K0808720
                          STO   3 1         STORE IN SYMBOL TABLE       K0808730
                          LD   L  WORD2     SECOND HALF NAME            K0808740
                          STO   3 2         STORE IN SYMBOL TABLE       K0808750
                          MDX  L  EOFST,-3  NEW END OF SYMBOL TBL ADDR  K0808760
                          MDX  L  SOFGT,-3  NEW START OF GENERATED TEMP K0808770
                          MDX  L  SOFXT,-3  NEW START OF SUBSC TEMPS    K0808780
                    PUT   SLA     16        CLEAR ACCUMULATOR           K0808790
                          STO     SWCS      ZERO CHK FOR OVERLAP SWITCH K0808800
                    *                                                   K0808810
                    *             CHECK FOR SYMBOL TABLE OVERLAP        K0808820
                    *                                                   K0808830
                    PUTF  LD   L  EOFST     END OF SYMBOL TBL ADDR      K0808840
                          S    L  EOFS      END OF STRING               K0808850
                          BSC  L  JFF,+Z    BR IF OVERLAP               K0808860
                          BSC  I  STOOK     EXIT FROM PLACE NAME        K0808870
                    JFF   MDX  L  ERROR,1   SET UP OVERLAP ERROR        K0808880
                          BSC  L  WAIT      READ AND EXECUTE NEXT PHASE K0808890
                    *                                                   K0808900
                    *             PUT NAME POINTER ON STRING            K0808910
                    *                                                   K0808920
                    EXTRA DC      0         RETURN ADDRESS              K0808930
                          STX   3 SAVE      SYMBOL TABLE ADDRESS        K0808940
                          LD   L  SOFST     START OF SYMBOL TABLE ADDR  K0808950
                          S       SAVE      CURRENT SYMBOL TABLE ADDR   K0808960
                          SRT     16        FORM NORMAL DIVIDEND        K0808970
                          D       THRE      NO. OF WORDS PER ENTRY      K0808980
                          A       SIGN1     SYMBOL TABLE POINTER        K0808990
                          STO   1 0         STORE ON STRING             K0809000
                    *                                                   K0809010
                    *             CHK IF 1 WORD STMNT CLOSURE REQUIRED  K0809020
                    *                                                   K0809030
                          LD   L  SW10      TWO-WORD NAME SWITCH        K0809040
                          BSC  L  FRANK,+-  BR IF NO CLOSURE REQUIRED   K0809050
                          SLA     16        CLEAR ACCUMULATOR           K0809060
                          STO  L  SW10      RESET TWO-WORD NAME SWITCH  K0809070
                          MDX  L  SW5,1     SET STRING PACK SWITCH      K0809080
                          BSI  L  SXB1      BR TO CLOSE STMNT 1 WORD    K0809090
                          MDX  L  CNT,1     ADJUST CNT FOR CLOSURE      K0809100
                    FRANK BSC  I  EXTRA     EXIT                        K0809110
                    *             SUBROUTINE TO CLOSE STMNT BY ONE WORD K0809120
                    *                                                   K0809130
                    *                                                   K0809140
                    SXB1  DC      0         RETURN ADDRESS              K0809150
                          STX   1 FRAN+1    SAVE STMNT POINTER          K0809160
                          MDX   1 1         INCR STMNT CLOSE POINTER    K0809170
                          LD    1 1         NEXT WORD TO MOVE TO CLOSE  K0809180
                          STO   1 0         CLOSE STMNT ONE WORD        K0809190
                          S    L  SEMS      SEMICOLON                   K0809200
                          BSC  L  SXB1+2,Z  BR TO CONTINUE IF NON-ZERO  K0809210
                    FRAN  LDX  L1 0         RESTORE STMNT POINTER       K0809220
                          BSC  I  SXB1      EXIT                        K0809230
                    *                                                   K0809240
                    *             CHECK WORD1 AND WORD2 AGAINST         K0809250
                    *             ARITHMETIC STATEMENT FUNCTION TABLE.  K0809260
                    *             IF THEY ARE IN THE TABLE,             K0809270
                    *             BRANCH INDIRECT THROUGH FIRST DC,     K0809280
                    *             IF NOT- GO THROUGH SECOND DC.         K0809290
                    *                                                   K0809300
                    NASFT DC      0         RETURN ADDRESS              K0809310
                          LD      NASFT     RETURN ADDRESS              K0809320
                          STO     NAX1+1    SET UP EXIT                 K0809330
                          LDX  I3 ASFNT     ADDR ARITH STMNT FUNC TABLE K0809340
                    NAX2  MDX  L3 -ASFT     BASE OF TABLE ADDRESS       K0809350
                          MDX     *+4       BR TO SEARCH IF NON-ZERO    K0809360
                          MDX  L  NAX1+1,1  INCR EXIT ADDR POINTER      K0809370
                    NAX1  BSC  I  *-*       EXIT                        K0809380
                          MDX  L3 ASFT-2    ADDR OF NEXT ELEMENT        K0809390
                          LDD   3 0         TWO-WORD NAME OF TBL ENTRY  K0809400
                          SD   L  WORD1     COMPARE WITH TWO-WORD NAME  K0809410
                          BSC  L  NAX2,Z    BR IF NOT EQUAL             K0809420
                          SLT     16        SECOND HALF TO ACCUMULATOR  K0809430
                          BSC  L  NAX2,Z    BR IF NAME NOT FOUND        K0809440
                          MDX     NAX1      BR IF NAME FOUND            K0809450
                    *                                                   K0809460
                    PTCH1 DC      *-*       LINK                    2-3 K0809470
                          BSC  L  CV10,+-   BRANCH IF RIGHT PAR     2-3 K0809480
                          LD    1 0         BRANCH BACK             2-3 K0809490
                          BSC  I  PTCH1,-   IF OPERATOR             2-3 K0809500
                          SLA     2                                 2-3 K0809510
                          BSC  L  *+2,-                             2-3 K0809520
                          BSC  L  PTH1A,C   BRANCH IF NOT NAME      2-3 K0809530
                          STX     SW11      SET SUBSCRIPT SWITCH    2-3 K0809540
                          BSC  L  CV11+5    GO PROCESS NAME         2-3 K0809550
                    *                                                   K0809560
                    PTCH2 DC      *-*       LINK                    2-3 K0809570
                          BSI  L  STOOK     PUT NAME IN SYM TABLE   2-3 K0809580
                          LD      SW11      TEST SUBSCRIPT SWITCH   2-3 K0809590
                          BSC  I  PTCH2,+-  BRANCH BACK IF OFF      2-3 K0809600
                          LD   L  SW10      TEST SWITCH 10          2-3 K0809610
                          BSC     Z         SKIP IF OFF             2-3 K0809620
                          MDX   1 1         INCREMENT POINTER       2-3 K0809630
                          SRA     16        CLEAR                   2-3 K0809640
                          STO     SW11      BOTH SWITCH 11          2-3 K0809650
                          STO  L  SW10      AND SWITCH 10           2-3 K0809660
                          BSC  I  PTCH1     BRANCH BACK             2-3 K0809670
                    *                                                   K0809680
                    SW11  DC      *-*       SUBSCRIPT SWITCH        2-3 K0809690
                    *                                                   K0809700
                    PTH1A LD    1 1         LOAD NEXT WORD          2-3 K0809710
                          BSC     +Z        SKIP IF TWO WORD CONST  2-3 K0809720
                          MDX   1 1         MOVE POINTER            2-3 K0809730
                          BSC  I  PTCH1     RETURN                  2-3 K0809740
                    *                                                   K0809750
                          BSS     BPHAR+PHLEN*320-*-1  PATCH AREA       K0809760
                          DC      0                                     K0809770
                          END     BPHAR-2                               K0809780
