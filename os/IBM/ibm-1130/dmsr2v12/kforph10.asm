                          HDNG    1130 FORTRAN COMPILER PHASE 10        K1000010
                    *************************************************** K1000020
                    *                                                 * K1000030
                    *STATUS - VERSION 2  MODIFICATION 8               * K1000040
                    *                                                 * K1000050
                    *FUNCTION/OPERATION-                              * K1000060
                    *   * CONVERTS FORMAT STATEMENTS INTO A CHAIN OF  * K1000070
                    *     FORMAT SPECIFICATIONS FOR INTERPERTATION BY * K1000080
                    *     THE FORTRAN I/O SUBROUTINE.                 * K1000090
                    *   * CHECKS THAT ALL FORMAT STATEMENTS HAVE A    * K1000100
                    *     STATEMENT NUMBER.                           * K1000110
                    *   * CHECKS FORMAT STATEMENTS FOR SYNTAX AND     * K1000120
                    *     VALID STATEMENT TYPES.                      * K1000130
                    *   * CONVERTS QUOTE TYPE FORMAT TO H TYPE.       * K1000140
                    *                                                 * K1000150
                    *ENTRY POINTS                                     * K1000160
                    *   * START-ENTERED BY ROL SUBPROGRAM FR PREV PHS * K1000170
                    *                                                 * K1000180
                    *INPUT-                                           * K1000190
                    *   * STRING AREA                                 * K1000200
                    *   * SYMBOL TABLE AREA                           * K1000210
                    *   * FCOM                                        * K1000220
                    *                                                 * K1000230
                    *OUTPUT-                                          * K1000240
                    *   * STRING AREA                                 * K1000250
                    *   * SYMBOL TABLE AREA                           * K1000260
                    *   * FCOM                                        * K1000270
                    *                                                 * K1000280
                    *EXTERNAL REFERENCES                              * K1000290
                    *   SUBROUTINES-                                  * K1000300
                    *      * ROL                                      * K1000310
                    *   COMMA/DCOM-                                   * K1000320
                    *      * $PHSE                                    * K1000330
                    *                                                 * K1000340
                    *EXITS-                                           * K1000350
                    *   NORMAL-A CALL TO ROL LOADS IN THE NEXT PHASE  * K1000360
                    *   ERROR-                                        * K1000370
                    *      * OVERLAP ERROR CAUSES PHASE TO STOP       * K1000380
                    *        PROCESSING AND AN EXIT TO THE NEXT PHASE * K1000390
                    *      * COMPILATION ERRORS DETECTED BY THIS PHASE* K1000400
                    *        ARE 27, 28, 29, 30                       * K1000410
                    *                                                 * K1000420
                    *TABLES/WORK AREAS-                               * K1000430
                    *   * FCOM                                        * K1000440
                    *   * SYMBOL TABLE                                * K1000450
                    *   * STRING AREA                                 * K1000460
                    *                                                 * K1000470
                    *ATTRIBUTES-N/A                                   * K1000480
                    *                                                 * K1000490
                    *NOTES-                                           * K1000500
                    *   THE SWITCHES USED IN THIS PHASE FOLLOW        * K1000510
                    *   IF NON-ZERO, THE SWITCH IS TRANSFER =T.       * K1000520
                    *   IF ZERO, THE SWITCH IS NORMAL = N.            * K1000530
                    *      SW1-BEGINNING OF SPECIFICATION             * K1000540
                    *         N=BEGINNING OF SPECIFICATION            * K1000550
                    *      SW2-I TYPE SPECIFICATION                   * K1000560
                    *         T=I TYPE SPECIFICATION                  * K1000570
                    *      SW3-SECOND NUMBER OF SPECIFICATION         * K1000580
                    *         T=SECOND NUMBER OF SPECIFICATION        * K1000590
                    *      SW4-LEFT/RIGHT SW FOR INPUT DATA (GET SUBR)* K1000600
                    *         N=LEFT                                  * K1000610
                    *      SW5-END OF STMNT SW (GET SUBR)             * K1000620
                    *         T=END OF STATEMENT                      * K1000630
                    *      SW6-COMMA ALLOWABLE                        * K1000640
                    *         N=COMMA ALLOWABLE                       * K1000650
                    *      SW7-LEFT/RIGHT SW FOR HOLL O/P SPEC        * K1000660
                    *         N=LEFT                                  * K1000670
                    *      SW8-COMMA MANDATORY                        * K1000680
                    *         T=COMMA NOT MANDATORY                   * K1000690
                    *      SW9-REDO OUTPUT                            * K1000700
                    *         T=OK TO PUT OUT REDO COUNT              * K1000710
                    *      SW11-H OR QUOTE TYPE SPECIFICATION         * K1000720
                    *         T=H OR QUOTE TYPE SPECIFICATION         * K1000730
                    *      SW12-QUOTE TYPE SPECIFICATION              * K1000740
                    *         T=QUOTE TYPE SPECIFICATION              * K1000750
                    *      SW15-DIGIT ENCOUNTERED                     * K1000760
                    *         T=DIGIT ENCOUNTERED                     * K1000770
                    *      SW16-INCOMPLETE SPECIFICATION              * K1000780
                    *         T=INCOMPLETE SPECIFICATION              * K1000790
                    *                                                 * K1000800
                    *************************************************** K1000810
                          HDNG    1130 FORTRAN COMPILER PHASE 10        K1000820
                          ABS                                           K1000830
                    *                                                   K1000840
                    *                       SYSTEM EQUATES              K1000850
                    MEMRY EQU     /8000                                 K1000860
                    OVERL EQU     MEMRY-1501 START OF FCOM          2-4 K1000870
                    ROL   EQU     MEMRY-68   LOCN OF RTN TO READ NXT PH K1000880
                    $PHSE EQU     /78        NO. OF PHASE NOW IN CORE   K1000890
                          ORG     OVERL                                 K1000900
                    PHID  EQU     40         ID NUMBER THIS PHASE       K1000910
                    PHLEN EQU     3          NO. SECTORS THIS PHASE     K1000915
                    *                                                   K1000920
                    *                  FORTRAN COMMUNICATION AREA       K1000930
                    ORG   BSS     1    ORIGIN ADDRESS               2-4 K1000935
                    SOFS  BSS     1    START OF STRING                  K1000940
                    EOFS  BSS     1    END OF STRING                    K1000950
                    SOFST BSS     1    START OF SYMBOL TABLE            K1000960
                    SOFNS BSS     1    START OF NON-STATEMENT NUMBERS   K1000970
                    SOFXT BSS     1    START OF SUBSCRIPT TEMPORARIES   K1000980
                    SOFGT BSS     1    START OF GENERATED TEMPORARIES   K1000990
                    EOFST BSS     1    END OF SYMBOL TABLE              K1001000
                    COMON BSS     1    NEXT AVAILABLE COMMON            K1001010
                    CSIZE BSS     1    SIZE OF COMMON                   K1001020
                    ERROR BSS     1    OVERLAP ERROR                    K1001030
                    FNAME BSS     1         PROGRAM NAME                K1001040
                          BSS     1                                     K1001050
                    SORF  BSS     1    SUBROUTINE(-) OR FUNCTION(+)     K1001060
                    CCWD  BSS     1    CONTROL CARD WORD                K1001070
                    *                BIT 15 TRANSFER TRACE              K1001080
                    *                BIT 14 ARITHMETIC TRACE            K1001090
                    *                BIT 13 EXTENDED PRECISION          K1001100
                    *                BIT 12 LIST SYMBOL TABLE           K1001110
                    *                BIT 11 LIST SUBPROGRAM NAMES       K1001120
                    *                BIT 10 LIST SOURCE PROGRAM         K1001130
                    *                BIT  9 ONE WORD INTEGERS           K1001140
                    *                BIT  8 ORIGIN                  2-4 K1001145
                    IOCS  BSS     1    IOCS CONTROL CARD WORD           K1001150
                    *                BIT 15 CARD                        K1001160
                    *                BIT 14 PAPER TAPE                  K1001170
                    *                BIT 13 TYPEWRITER                  K1001180
                    *                BIT 12 1403 PRINTER                K1001190
                    *                BIT 11 2501 READER                 K1001200
                    *                BIT 10 KEYBOARD                    K1001210
                    *                BIT  9 1442 PUNCH                  K1001220
                    *                BIT  8 DISK                        K1001230
                    *                BIT  7 1132 PRINTER                K1001240
                    *                BIT  3 PLOTTER                     K1001250
                    *                BIT  1 UNFORMATTED DISK            K1001260
                    DFCNT BSS     1                                     K1001270
                    *                                                   K1001280
                    *                                                   K1001290
                    *                  END OF FORTRAN COMMUNICATION     K1001300
                    *                  AREA                             K1001310
                    *************************************************** K1001320
                          HDNG    1130 FORTRAN COMPILER PHASE 10        K1001330
                    *                                                   K1001340
                    BPHAR EQU     *+2                                   K1001350
                          DC      0         LOADER WORK AREA            K1001360
                          DC      -40       PHASE  ID FOR SLET LOOKUP   K1001370
                          DC      NXTPH-*+1 TABLE FOR NEXT PHASE ENTRY  K1001380
                          DC      1         ONE ENTRY TO BE SET BY LDR  K1001390
                          ORG     *-2                                   K1001400
                    *                                                   K1001410
                    START LDX   1 PHID      GET ID THIS PHASE           K1001420
                          STX  L1 $PHSE     SAVE IN SYSTEM PHASE AREA   K1001430
                    *                  OVERLAP ERROR ON                 K1001440
                    *                                                   K1001450
                          LD      ERROR     LD OVERLAP ERROR FLAG       K1001460
                          BSC  L  LXQ,+-    BR IF NO ERROR              K1001470
                    *                                                   K1001480
                    *                                                   K1001490
                    OUT   LDX  I1 NXTPH+1   LOAD PARAM FOR READING      K1001500
                          LDD     NXTPH+2   *NEXT PHASE                 K1001510
                          BSC  L  ROL       GO TO READ NEXT PHASE       K1001520
                          BSS  E  0                                     K1001530
                    NXTPH DC      41        ID OF NEXT PHASE            K1001540
                          BSS     3         LOADER TABLE FOR NXT PHS    K1001550
                    *                                                   K1001560
                    *             MOVE STRING TO SYMBOL TABLE           K1001570
                    LXQ   LDX  I2 EOFST     GET POINTER TO O/P STRING   K1001580
                          LDX  I1 EOFS      GET POINTER TO I/P STRING   K1001590
                          LD      EOFS      COMPUTE NUMBER OF WORDS IN  K1001600
                          S       SOFS      *THE STRING-1               K1001610
                          STO     XX+1      SAVE STRING LENGTH-1        K1001620
                    XX    LDX  L3 0         PUT STRING LENGTH-1 IN XR3  K1001630
                          MDX   3 1         INCR STRING LENGTH-1 BY 1   K1001640
                    LOOPP LD    1 0         LD WD FROM I/P STRING       K1001650
                          STO   2 -1        SAVE IN O/P STRING          K1001660
                          MDX   1 -1        DECR I/P POINTER            K1001670
                          MDX   2 -1        DECR O/P POINTER            K1001680
                          MDX   3 -1        DECR STRING LENGTH COUNT    K1001690
                          MDX     LOOPP     LOOP UNLESS FINISHED        K1001700
                          STX   2 ORIG+1    SAVE START LOC O/P STRING   K1001710
                          LDX  I2 SOFS      GET START LOC I/P STRING    K1001720
                          STX   2 NEOFS     SAVE TEMPORARILY            K1001730
                    *                                                   K1001740
                    *                  INITIALIZE PHASE                 K1001750
                    ORIG  LDX  L1 0         PREV O/P STRING PT NOW I/P  K1001760
                    *                                                   K1001770
                    *                  END STATEMENT                    K1001780
                    ABEL  LD    1 0         GET ID WD FR I/P STRING     K1001790
                          SRA     1         SHIFT OUT LOW ORDER BIT     K1001800
                          AND     IDTPE     MASK IN ID TYPE BITS (1-5)  K1001810
                          S       ENDC      TEST FOR END STMNT          K1001820
                          BSC  L  CBEL,Z    BR IF NOT END               K1001830
                          LD    1 0         MOVE END STMNT FR I/P       K1001840
                          STO   2 0         *STRING TO O/P STRING       K1001850
                          STX   2 EOFS      SAVE END OF O/P STRING PT   K1001860
                          MDX     OUT       BR TO EXIT FR THIS PHASE    K1001870
                    *                                                   K1001880
                    *                  FORMAT STATEMENT                 K1001890
                    CBEL  S       FORMC     TEST FOR FORMAT STMNT       K1001900
                          BSC  L  DECEM,+-  BRANCH IF FOUND             K1001910
                    *                                                   K1001920
                    *                  MOVE NON FORMAT STATEMENT        K1001930
                          STX   1 VENT      SAVE I/P STRING POINTER     K1001940
                          LD    1 0         LD ID WD FR STRING          K1001950
                          SRA     2         RIGHT JUSTIFY STMNT NORM    K1001960
                          AND     IDNRM     MASK STMNT NORM             K1001970
                          STO     VENT1+1   SAVE AS WORD COUNT          K1001980
                    VENT1 LDX  L3 0         GET WD CNT THIS STMNT       K1001990
                    LUP   LD    1 0         LD WD I/P STRING            K1002000
                          STO   2 0         SAVE IN O/P STRING          K1002010
                          MDX   1 1         INCR. I/P STRING PT         K1002020
                          MDX   2 1         INCR O/P STRING PT          K1002030
                          MDX   3 -1        DECR WD COUNT               K1002040
                          MDX     LUP       LOOP UNLESS FINISHED        K1002050
                          STX   2 NEOFS     SAVE END OF O/P STRING      K1002060
                          MDX     ABEL      BR TO PROCESS NXT STMNT     K1002070
                    *                                                   K1002080
                    *                  STATEMENT NUMBER                 K1002090
                    DECEM STX   1 IDSAV     SAVE LOC OF I/P ID WD       K1002100
                          LD    1 0         GET ID WORD                 K1002110
                          STO     IDSTO     SAVE IN TEMP STORAGE        K1002120
                          BSC  L  INDIC,E   BR IF STMNT NUMBERED        K1002130
                    *                                                   K1002140
                    *                  SET UP ERROR NO = 28             K1002150
                          LD      ERRA      LOAD ERROR NO. CON = 28     K1002160
                          STO     ERRNO     SAVE FOR OUTPUT PURPOSE     K1002170
                    *                                                   K1002180
                    *                  REPLACE STATEMENT WITH ERROR     K1002190
                    BAKER LD      IDSTO     LD ID WORD                  K1002200
                          SRA     2         RIGHT JUSTIFY NORM          K1002210
                          AND     IDNRM     MASK NORM BITS              K1002220
                          STO     NRMSV     SAVE NORM                   K1002230
                          A       IDSAV     INCR BY LOC OF ID           K1002240
                          STO     GET1      SAVE AS START OF NXT STMNT  K1002250
                          LDX  I2 NEOFS     PUT END O/P STRING PT XR2   K1002260
                          LD      IDSTO     LD ID WD                    K1002270
                          BSC  L  JAM,E     BR IF STMNT NUMBERED        K1002280
                          MDX     JAM+4     BR TO CONTINUE              K1002290
                    JAM   LD      ERIID     LD ERR ID WD +STMNT NO.FLAG K1002300
                          STO   2 0         SAVE IN O/P STRING          K1002310
                          MDX   2 1         INCR O/P STRING PT          K1002320
                          MDX     JAM+6     SKIP NXT 2 INSTRUCTIONS     K1002330
                          LD      ERRID     LD ERR ID WD W/O STMNT NO.  K1002340
                          STO   2 0         SAVE IN O/P STRING          K1002350
                          LD      ERRNO     GET ERROR NUMBER            K1002360
                          STO   2 1         SAVE IN O/P STRING          K1002370
                          MDX   2 2         INCR O/P STRING PT          K1002380
                          STX   2 NEOFS     SAVE POINTER                K1002390
                          LDX  I1 GET1      GET LOC OF NXT STMNT        K1002400
                          MDX     ABEL      BR TO PROCESS NXT STMNT     K1002410
                    *                                                   K1002420
                    *                  CONSTANTS                        K1002430
                    VENT  DC      0         LOC I/P STRING ID WD        K1002440
                    ERIID DC      /A00D     ERR ID W/ STMNT NO. FLAG    K1002450
                          BSS  E  0                                     K1002460
                    SUM   DC      0         SUM TABLE                   K1002470
                    SW1   DC      0         BEGINNING OF SPEC SW        K1002480
                    SW2   DC      0         I TYPE SPEC SW              K1002490
                    SW3   DC      0         2ND NO. OF SPEC SW          K1002500
                    SW4   DC      0         LEFT/RIGHT CHAR SW FOR GET  K1002510
                    SW5   DC      0         END OF STMNT SW FOR GET     K1002520
                    SW6   DC      0         COMMA ALLOWABLE SW          K1002530
                    SW7   DC      0         LEFT/RIGHT SW FOR H SPEC    K1002540
                    SW8   DC      0         COMMA MANDATORY SW          K1002550
                    SW9   DC      0         REDO SW                     K1002560
                    IDTPE DC      /7C00     MASK FOR STRING ID WORD     K1002570
                    ENDC  DC      /0800     END STMNT CONSTANT          K1002580
                    FORMC DC      /3000-/0800 FORMAT TYPE CONSTANT      K1002590
                    ERRA  DC      28        CONSTANT ERR 28             K1002600
                    IDSTO DC      0         ID WD STORAGE               K1002610
                    NEOFS DC      0         END OF OUTPUT STRING        K1002620
                    ERRNO DC      0         ERROR NO. FOR O/P           K1002630
                    IDSAV DC      0         LOC OF ID WORD              K1002640
                    IDNRM DC      /01FF     MASK TO GET NORM            K1002650
                    NRMSV DC      0         NORM CURRENT STMNT          K1002660
                    ERRID DC      /A008     ERROR ID NO STMNT NO.       K1002670
                    GET1  DC      0         LOC. OF NXT STMNT IN STRING K1002680
                    MASK  DC      /07FF     STMNT NO. MASK              K1002690
                    MASK1 DC      /0040     FORMAT FLAG FOR SYM TBL     K1002700
                    MASKK DC      /00FF     RIGHT CHAR MASK.            K1002710
                    SAVE  DC      0         SYM TBL POINTER             K1002720
                    THREE DC      /FFFD     MINUS THREE CONSTANT        K1002730
                    MASK2 DC      /00F0     NUMERIC EBC CONSTANT MASK   K1002740
                    TEN   DC      10        CONSTANT TEN                K1002750
                    N145  DC      145       MAX LENGTH FMT STRING       K1002760
                    ERRB  DC      27        ERR 27 CONSTANT             K1002770
                    MONE  DC      /FFFF     MINUS ONE CONSTANT          K1002780
                    REDO  DC      0         REDO INDICATOR              K1002790
                    NORM  DC      0         NORM O/P STMNT-2            K1002800
                    NCNT  DC      0         NORM O/P STMNT-2            K1002810
                    TWO   DC      2         CONSTANT                    K1002820
                    NINE  DC      9         CONSTANT                    K1002830
                    SW15  DC      0         DIGIT ENCOUNTERED SW        K1002840
                    *                                                   K1002850
                    *                  INDICATE FORMAT STATEMENT        K1002860
                    *                  IN SYMBOL TABLE ID WORD          K1002870
                    *                                                   K1002880
                    INDIC LD    1 1         MOVE SYM TBL POINTER FR I/P K1002890
                          STO   2 1         *STRING TO O/P STRING       K1002900
                          AND     MASK      MASK OUT HIGH ORDER BITS    K1002910
                          M       THREE     SYM TBL PT TO STMNT NO.     K1002920
                          SLT     16        *BY -3                      K1002930
                          S       THREE     SUBTRACT -3                 K1002940
                          A    L  SOFST     ADD TO START OF SYM TBL     K1002950
                          STO     SAVE      SAVE SYM TBL ADDR STMNT NO. K1002960
                          LDX  I3 SAVE      PUT SYM TBL ADDR XR3        K1002970
                          LD    3 0         LD SYM TBL ID WD            K1002980
                          OR      MASK1     FLAG BIT 9 OF SYM TBL ID WD K1002990
                          STO   3 0         *TO INDICATE FMT STMNT      K1003000
                    *                                                   K1003010
                    *                  INITIALIZE TO SCAN BODY OF       K1003020
                    *                    STATEMENT                      K1003030
                          LD    1 0         MOVE STRING ID WD FR I/P    K1003040
                          STO   2 0         *TO O/P STRING              K1003050
                          STX  L2 VIGG      SAVE LOC O/P STRING ID WD   K1003060
                          SRA     2         RIGHT JUSTIFY NORM          K1003070
                          AND     IDNRM     MASK TO GET NORM BITS ONLY  K1003080
                          STO     NRMSV     SAVE NORM                   K1003090
                          S       TWO       DECR BY 2 WDS (ID+STMNT NO) K1003100
                          STO     NCNT      SAVE WD CNT                 K1003110
                          STO     NORM      SAVE WD CNT                 K1003120
                          LD      MONE      LD -1                       K1003130
                          STO  L  LOOP      INITIALIZE NO. REPEATS.     K1003140
                          MDX   1 2         MOVE PTR PAST ID & STMNT NO K1003150
                          LDX   3 10        SET UP TO CLEAR SUM AND SWS K1003160
                          SLA     16        CLEAR ACC                   K1003170
                          STO  L  TABC      CLEAR WD CNT O/P STRING     K1003180
                          MDX   2 2         INCR O/P STRING PT          K1003190
                          STO  L3 SUM-1     ZERO SUM & SWITCH AREA.     K1003200
                          MDX   3 -1        DECR TABLE COUNT            K1003210
                          MDX     *-4       LOOP IF NOT DONE            K1003220
                          STO  L  SW11      ZERO H OR QUOTE SW          K1003230
                          STO     SW12      ZERO QUOTE TYPE SPEC SW     K1003240
                          STO     REDO      ZERO REDO SW                K1003250
                          STO  L  REP       ZERO REPEAT SW              K1003260
                          STO  L  GREP      ZERO GROUP REPEAT SW        K1003270
                          STO     SW15      ZERO DIGIT ENCOUNTERED SW   K1003280
                    *                                                   K1003290
                    *                       GET CHAR FROM FORMAT STRING K1003300
                          BSI  L  GET       BR TO SUBR TO GET CHAR      K1003310
                    *                                                   K1003320
                    *                  X=LEFT PARENTHESIS               K1003330
                          S       PARNL     TEST FOR LEFT PARENTHESIS.  K1003340
                          BSC  L  J,Z       BR IF NOT FOUND (ERR 27)    K1003350
                    *                                                   K1003360
                    *                  GET X                            K1003370
                    DOG   BSI  L  GET       GET NXT CHAR FR FMT STMNT   K1003380
                          STO     X         SAVE CHAR                   K1003390
                    *                                                   K1003400
                    *                  IS X NUMERIC                     K1003410
                          S       MASK2     SUBTRACT NUMERIC EBC CON F0 K1003420
                          BSC  L  TST,+Z    BR IF NOT NUMERIC           K1003430
                          S       NINE      TEST IF NO. GT 9            K1003440
                          BSC  L  TST,Z-    BR IF YES                   K1003450
                    *                                                   K1003460
                    *                  SUM=SUM*10+X                     K1003470
                          LD      SUM       GET PREV SUM                K1003480
                          M       TEN       MPY BY 10                   K1003490
                          SLT     16        SHIFT ANS TO ACC            K1003500
                          S       MASK2     REMOVE BITS 0-3 FR PRODUCT  K1003510
                          A       X         ADD CHAR                    K1003520
                          STO     SUM       SAVE                        K1003530
                    *                                                   K1003540
                    *             TAG SW15  DIGIT ENCOUNTERED SW        K1003550
                    *                       SET SW NON ZERO             K1003560
                          STX   0 SW15                                  K1003570
                    *                  SUM GREATER THAN 145             K1003580
                          S       N145      SUBTRACT CON 145            K1003590
                          BSC  L  ERR29,-Z  BR IF SUM GT 145 (ERR 29)   K1003600
                    *                                                   K1003610
                    *             NORMALIZE SW16                        K1003620
                          SLA     16        CLEAR INCOMPLETE SPEC       K1003630
                          STO     SW16      *SWITCH                     K1003640
                          MDX     DOG       BR TO GET ANOTHER CHAR      K1003650
                    *                                                   K1003660
                    *             SET UP ERROR 27                       K1003670
                    J     LD      ERRB      LD ERR CON (=27)            K1003680
                          STO     ERRNO     SAVE IN ERR NO. BFR         K1003690
                          LDX  L  BAKER     BR TO ERROR O/P SUBR        K1003700
                    *                                                   K1003710
                    *             SET UP ERROR 30                       K1003720
                    ERR30 LD      ER30      LD ERR CON (=30)            K1003730
                          STO     ERRNO     SAVE IN ERR BFR             K1003740
                          BSC  L  BAKER     BR TO ERROR O/P SUBR        K1003750
                    *                                                   K1003760
                    *                  CONSTANTS                        K1003770
                    PARNL DC      /004D     (                           K1003780
                    X     DC      0         CHAR FR FMT STRING          K1003790
                    FEF   DC      /00C6     F (TEST CONSTANT)           K1003800
                    EE    DC      /00C5-/00C6 E (TEST CONSTANT)         K1003810
                    EYE   DC      /00C9-/00C5 E (TEST CONSTANT)         K1003820
                    ACH   DC      /00C8-/00C9 H (TEST CONSTANT)         K1003830
                    XEX   DC      /00E7-/00C8 X (TEST CONSTANT)         K1003840
                    AA    DC      /00C1-/00E7 A (TEST CONSTANT)         K1003850
                    LP    DC      /004D     (   (TEST CONSTANT)         K1003860
                    DIV   DC      /0061     / (TEST CONSTANT)           K1003870
                    RPET  DC      /005D-/0061 ) (TEST CONSTANT)         K1003880
                    GREP  DC      0         GROUP REPEAT SW             K1003890
                    TENC  DC      /B000     REDO COUNT CON              K1003900
                    ER30  DC      30        ERROR 30 CONSTANT           K1003910
                    SW12  DC      0         QUOTE TYPE SPEC SW          K1003920
                    SW16  DC      0         INCOMPLETE SPEC SW          K1003930
                    *                                                   K1003940
                    *                  TEST SW1                         K1003950
                    TST   LD   L  SW1       TEST FOR BEGINNING OF SPEC  K1003960
                          BSC  L  TST1,Z    BR IF NOT BEGINNING         K1003970
                    *                                                   K1003980
                    *                  X=F                              K1003990
                          LD      X         LD STRING CHAR              K1004000
                          S       FEF       TEST FOR F                  K1004010
                          BSC  L  B,+-      BR IF CHAR = F              K1004020
                    *                                                   K1004030
                    *                  X=E                              K1004040
                          S       EE        TEST FOR E                  K1004050
                          BSC  L  C,+-      BR IF CHAR = E              K1004060
                    *                                                   K1004070
                    *                  X=I                              K1004080
                          S       EYE       TEST FOR I                  K1004090
                          BSC  L  D,+-      BR IF CHAR = I              K1004100
                    *                                                   K1004110
                    *                  X=H                              K1004120
                          S       ACH       TEST FOR H                  K1004130
                          BSC  L  E,+-      BR IF CHAR = H              K1004140
                    *                                                   K1004150
                    *                  X=X                              K1004160
                          S       XEX       TEST FOR X                  K1004170
                          BSC  L  ZX,+-     BR IF CHAR = X              K1004180
                    *                                                   K1004190
                    *                  X=A                              K1004200
                          S       AA        TEST FOR A                  K1004210
                          BSC  L  I,+-      BR IF CHAR = A              K1004220
                    *                                                   K1004230
                    *                  X=LEFT PARENTHESIS (             K1004240
                          LD      X         LOAD STRING CHAR            K1004250
                          S       LP        TEST FOR (                  K1004260
                          BSC  L  GRP1,+-   BR IF CHAR = (              K1004270
                    *                                                   K1004280
                    *                  X=DIVIDE                         K1004290
                    ECHO  LD      X         LOAD STRING CHAR            K1004300
                          S       DIV       TEST FOR /                  K1004310
                          BSC  L  RP,+-     BR IF CHAR = /              K1004320
                    *                                                   K1004330
                    *                  X=RIGHT PARENTHESIS)             K1004340
                          S       RPET      TEST FOR )                  K1004350
                          BSC  L  MAN,+-    BR IF CHAR = )              K1004360
                    *                                                   K1004370
                    *                  X=T                              K1004380
                          S       TCON1     TEST FOR T                  K1004390
                          BSC  L  INK,Z     BR IF CHAR NOT = T          K1004400
                    *                                                   K1004410
                    *                  INDICATE T TYPE                  K1004420
                          LD   L  TTYPE     LD T INDICATOR CON          K1004430
                          STO  L  COMTP     SAVE IN O/P INDR AREA       K1004440
                          BSI  L  SUBR      BR TO TEST SW15 AND SUM     K1004450
                          BSC  L  POP       BR TO PROCESS T FORMAT      K1004460
                    *                                                   K1004470
                    *                  QUOTES                           K1004480
                    INK   LD      X         TEST CHAR FOR QUOTE         K1004490
                          S    L  QUOTC     *MARK                       K1004500
                          BSC  L  J,Z       BR TO O/P ERR 27 IF NOT     K1004510
                          LD   L  SUM        REPEAT ON LITERAL      2-8 K1004511
                          BSC  L  J,Z        YES,BRANCH TO ERR 27   2-8 K1004512
                    *                                                   K1004520
                    *                  TAG SW12                         K1004530
                          MDX  L  SW12,1    TAG QUOTE TYPE SPEC SW      K1004540
                    *                                                   K1004550
                    *                  WW=0                             K1004560
                          SLA     16        CLEAR ACC                   K1004570
                          STO  L  WW        CLEAR TOTAL FIELD WIDTH     K1004580
                          BSC  L  O         BR TO PROCESS QUOTE         K1004590
                    *                                                   K1004600
                    *                       RIGHT PARENTHESES FOUND     K1004610
                    *             SW15 AND SW16 NORMAL                  K1004620
                    MAN   LD   L  SW15      TEST IF DIGIT ENCOUNTERED   K1004630
                          OR      SW16      *AND INCOMPLETE SPEC SW OFF K1004640
                          BSC  L  J,Z       BR IF EITHER SW ON (ERR 27) K1004650
                    *                                                   K1004660
                    *                  GREP=0                           K1004670
                          LD      GREP      TEST GROUP REPEAT SW        K1004680
                          BSC  L  FOX,Z     BR IF NON-ZERO              K1004690
                    *                                                   K1004700
                    *                  PUT REDO                         K1004710
                          LD   L  REDO      GET REDO INDICATOR          K1004720
                          OR      TENC      ADD COUNT MASK              K1004730
                          BSI  L  PUT       PUT REDO IN O/P STRING      K1004740
                    *                                                   K1004750
                    *                  SET SW9 TO TRANSFER              K1004760
                          MDX  L  SW9,1     INDICATES OK TO PUT REDO    K1004770
                    *                                                   K1004780
                    *                  GET X                            K1004790
                          BSI  L  GET       BR TO GET NXT CHAR          K1004800
                          MDX     J         BR IF RETURN FR GET-ERR 27  K1004810
                    *                                                   K1004820
                    *                  CONSTANTS                        K1004830
                    PERD  DC      /004B     EBC DECML PT                K1004840
                    EITC  DC      /8000     GROUP REPEAT CONSTANT       K1004850
                    ONE   DC      1         USEFUL CONSTANT             K1004860
                    *                                                   K1004870
                    *                  GROUP REPEAT SW NON ZERO         K1004880
                    *                  OUTPUT GROUP REPEAT COUNT        K1004890
                    *                                                   K1004900
                    *                  GREP=1                           K1004910
                    FOX   LD      GREP      LD GROUP REPEAT SW          K1004920
                          S       ONE       TEST FOR GROUP REPEAT =1    K1004930
                          BSC  L  XENO,+-   BR IF =                     K1004940
                    *                                                   K1004950
                    *                  PUT GROUP REPEAT                 K1004960
                          LD      EITC      LD GROUP REPEAT CON         K1004970
                          OR      GREP      ADD TO GROUP REPEAT COUNT   K1004980
                          BSI  L  PUT       PUT ON O/P STRING           K1004990
                          LD      LOOP      GET -NO. WDS TO REPEAT      K1005000
                          A       ONE       ADD 1                       K1005010
                          BSI  L  PUT       PUT ON O/P STRING           K1005020
                    *                                                   K1005030
                    *                  GREP=0                           K1005040
                    XENO  SLA     16        RESET GROUP REPEAT CON      K1005050
                          STO     GREP      *TO 0                       K1005060
                    *                                                   K1005070
                    *                  GET X                            K1005080
                          BSI  L  GET       BR TO GET NXT CHAR          K1005090
                          STO  L  X         *FROM I/P STRING            K1005100
                    *                                                   K1005110
                    *                  TAG SW8                          K1005120
                          MDX  L  SW8,1     SET COMMA MANDATORY SW      K1005130
                          BSC  L  QUAD      BR TO PROCESS NEW SPEC TYPE K1005140
                    *                                                   K1005150
                    *                  TEST SW3                         K1005160
                    TST1  LD   L  SW3       LD 2ND NO. OF SPEC SW       K1005170
                          BSC  L  M,+-      BR IF NO 2ND NO.            K1005180
                    *                                                   K1005190
                    *                  SUM=0                            K1005200
                          LD   L  SUM       TEST FIELD WIDTH            K1005210
                          BSC  L  J,+-      BR IF ZERO                  K1005220
                    *                                                   K1005230
                    *                  WW=SUM                           K1005240
                          STO     WW        SAVE TOTAL FIELD WIDTH      K1005250
                    *                                                   K1005260
                    *                  SUM=0                            K1005270
                          BSI  L  NLIZE     BR TO CLEAR SUM AND SW15    K1005280
                    *                                                   K1005290
                    *                  TEST SW2                         K1005300
                          LD   L  SW2       TEST FOR I TYPE SPEC        K1005310
                          BSC  L  K,+-      BR IF NOT I TYPE SPEC       K1005320
                    *                                                   K1005330
                    *                  WW LESS THAN 127                 K1005340
                          LD      WW        TEST TOTAL FIELD WIDTH      K1005350
                          S       N127      *VS 127                     K1005360
                          BSC  L  ERR30,-Z  BR IF GT 127                K1005370
                    *                                                   K1005380
                    *                  X=PERIOD                         K1005390
                          LD   L  WALT      GET RIGHT CHAR FR TEMP STO  K1005400
                          S       PERD      TEST FOR PERIOD             K1005410
                          BSC  L  J,Z       BR IF NOT PERIOD (ERR 27)   K1005420
                    *                                                   K1005430
                    *             TAG SW16                              K1005440
                          MDX  L  SW16,1    SET INCOMPLETE SPEC SW      K1005450
                    *                                                   K1005460
                    *                  NORMALIZE SW2                    K1005470
                          SLA     16        CLEAR ACC                   K1005480
                          STO  L  SW2       SET SW TO IND NON I TYPE    K1005490
                    *                                                   K1005500
                    *                  NORMALIZE SW3                    K1005510
                          STO  L  SW3       SET SW TO IND NO 2ND NO.    K1005520
                          LDX  L  DOG       BR TO PROCESS NXT CHAR      K1005530
                    *                  CONSTANTS                        K1005540
                    *                                                   K1005550
                    LOOP  DC      0         -NO. WDS BACK TO GROUP REP  K1005560
                    WW    DC      0         TOTAL FIELD WIDTH           K1005570
                    DD    DC      0         DECIMAL WIDTH               K1005580
                    N127  DC      127       MAX TOTAL FIELD WIDTH       K1005590
                    N7    DC      /7000     SLASH FLAG                  K1005600
                    N31   DC      31        MAX DECML WIDTH             K1005610
                    REP   DC      0         REPEAT COUNT                K1005620
                    BOX   DC      0         SPECIAL TYPE CODE STORAGE   K1005630
                    OPA   DC      /A035     SPECIAL TYPE CODE CHAR = A  K1005640
                    OPB   DC      /A014     SPECIAL TYPE CODE CHAR = B  K1005650
                    OPS   DC      /A040     SPECIAL TYPE CODE CHAR = S  K1005660
                    OPT   DC      /A005     SPECIAL TYPE CODE CHAR = T  K1005670
                    OPD   DC      /A016     SPECIAL TYPE CODE CHAR = D  K1005680
                    OPL   DC      /A025     SPECIAL TYPE CODE CHAR = L  K1005690
                    OPR   DC      /A015     SPECIAL TYPE CODE CHAR = R  K1005700
                    V1S1  DC      0         STMNT NORM-2                K1005710
                    ACON  DC      /00C1     A TEST CONSTANT             K1005720
                    BCON  DC      /00C2-/00C1 B TEST CONSTANT           K1005730
                    SCON  DC      /00E2-/00C2 S TEST CONSTANT           K1005740
                    TCON  DC      /00E3-/00E2 T TEST CONSTANT           K1005750
                    DCON  DC      /00C4-/00E3 D TEST CONSTANT           K1005760
                    LCON  DC      /00D3-/00C4 L TEST CONSTANT           K1005770
                    RCON  DC      /00D9-/00D3 R TEST CONSTANT           K1005780
                    RPARN DC      /005D     ) TEST CONSTANT             K1005790
                    TCON1 DC      /00E3-/005D T TEST CONSTANT           K1005800
                    TTYPE DC      /6000     T INDICATOR CONSTANT        K1005810
                    *                                                   K1005820
                    *                  SAVE POINTER AND SAVE SW4        K1005830
                    *                  X=LEFT PARENTHESIS               K1005840
                    GRP   STX   1 BK+1      SAVE I/P STRING PT          K1005850
                          LDD  L  SW4       GET CONTENTS SW4 AND SW5    K1005860
                          STD  L  SW45H     SAVE IN TEMPORARY STORAGE   K1005870
                          LD   L  NCNT      GET STMNT NORM-2            K1005880
                          STO     V1S1      SAVE                        K1005890
                    *                                                   K1005900
                    *                  GET X                            K1005910
                          BSI  L  GET       GET STRING CHAR             K1005920
                          MDX     BK        BR TO PROCESS               K1005930
                    *                                                   K1005940
                    *                  X=A                              K1005950
                          S       ACON      TEST CHAR FOR A             K1005960
                          BSC  L  BOY,+-    BR IF = A                   K1005970
                    *                                                   K1005980
                    *                  X=B                              K1005990
                          S       BCON      TEST CHAR FOR B             K1006000
                          BSC  L  BOY1,+-   BR IF = B                   K1006010
                    *                                                   K1006020
                    *                  X=S                              K1006030
                          S       SCON      TEST CHAR FOR S             K1006040
                          BSC  L  BOY2,+-   BR IF = S                   K1006050
                    *                                                   K1006060
                    *                  X=T                              K1006070
                          S       TCON      TEST CHAR FOR T             K1006080
                          BSC  L  BOY3,+-   BR IF = T                   K1006090
                    *                                                   K1006100
                    *                  X=D                              K1006110
                          S       DCON      TEST CHAR FOR D             K1006120
                          BSC  L  BOY4,+-   BR IF = D                   K1006130
                    *                                                   K1006140
                    *                  X=L                              K1006150
                          S       LCON      TEST CHAR FOR L             K1006160
                          BSC  L  BOY5,+-   BR IF = L                   K1006170
                    *                                                   K1006180
                    *                  X=R                              K1006190
                          S       RCON      TEST CHAR FOR R             K1006200
                          BSC  L  BOY6,+-   BR IF = R                   K1006210
                    *                                                   K1006220
                    *                  BACK UP                          K1006230
                    BK    LDX  L1 *-*       RESET I/P STRING POINTER    K1006240
                          LDD  L  SW45H     RELOAD SW4 AND SW5          K1006250
                          STD  L  SW4       RESTORE TO PREV STATE       K1006260
                          LD      V1S1      RESET STMNT NORM-2          K1006270
                          STO  L  NCNT      SAVE                        K1006280
                          MDX     GRP1      BR TO PROCESS PREV CHAR     K1006290
                    *                                                   K1006300
                    *                  INDICATE A SPECIAL TYPE          K1006310
                    BOY   LD      OPA       CHAR=A, LD SPECIAL TYPE CDE K1006320
                          MDX     BOY3+1    BR TO STORE                 K1006330
                    *                                                   K1006340
                    *                  INDICATE B SPECIAL TYPE          K1006350
                    BOY1  LD      OPB       CHAR=B, LD SPECIAL TYPE CDE K1006360
                          MDX     BOY6+1    BR TO STORE                 K1006370
                    *                                                   K1006380
                    *                  INDICATE S SPECIAL TYPE          K1006390
                    BOY2  LD      OPS       CHAR=S, LD SPECIAL TYPE CDE K1006400
                          MDX     BOY6+1    BR TO STORE                 K1006410
                    *                                                   K1006420
                    *                  INDICATE T SPECIAL TYPE          K1006430
                    BOY3  LD      OPT       CHAR=T, LD SPECIAL TYPE CDE K1006440
                          MDX     BOY6+1    BR TO STORE                 K1006450
                    *                                                   K1006460
                    *                  INDICATED D SPECIAL TYPE         K1006470
                    BOY4  LD      OPD       CHAR=D, LD SPECIAL TYPE CDE K1006480
                          MDX     BOY6+1    BR TO STORE                 K1006490
                    *                                                   K1006500
                    *                  INDICATE L SPECIAL TYPE          K1006510
                    BOY5  LD      OPL       CHAR=L, LD SPECIAL TYPE CDE K1006520
                          MDX     BOY6+1    BR TO STORE                 K1006530
                    *                                                   K1006540
                    *                  INDICATE R SPECIAL TYPE          K1006550
                    BOY6  LD      OPR       CHAR=R, LD SPECIAL TYPE CDE K1006560
                          STO     BOX       SAVE SPECIAL TYPE CODE      K1006570
                    *                                                   K1006580
                    *                  GET X                            K1006590
                    BTEST BSI  L  GET       BR TO GET ANOTHER CHAR      K1006600
                    *                                                   K1006610
                    *                  RIGHT PARENTHESIS                K1006620
                          S       RPARN     TEST CHAR FOR )             K1006630
                          BSC  L  BK,Z      BR IF NOT                   K1006640
                    *                                                   K1006650
                    *             PUT SPECIFICATION                     K1006660
                          LD      BOX       GET SPECIAL TYPE CODE       K1006670
                          BSI  L  PUT       PUT  ON O/P STRING          K1006680
                    *                                                   K1006690
                    *             SUM = 0                               K1006700
                          BSI  L  SUBR      BR TO SEE IF DIGIT FOUND    K1006710
                          LD   L  SUM       GET FIELD WIDTH             K1006720
                          BSC  L  BT11A,+-  BR IF FIELD WIDTH = 0       K1006730
                    *                                                   K1006740
                    *             PUT FIELD REPEAT                      K1006750
                          LD      N9        GET FIELD REPEAT FLAG       K1006760
                          OR   L  SUM       ADD FIELD WIDTH             K1006770
                          BSI  L  PUT       PUT ON O/P STRING           K1006780
                    *                                                   K1006790
                    *             CALL NLIZE                            K1006800
                    BT11A BSI  L  NLIZE     CLEAR SW15 AND SUM          K1006810
                    *                  GET X                            K1006820
                    BT11  BSC  L  LIMA      BR TO PROCESS NXT CHAR      K1006830
                    *                                                   K1006840
                    *                  GREP=0                           K1006850
                    GRP1  LD   L  GREP      LD GROUP REPEAT CNT         K1006860
                          BSC  L  J,Z       BR TO ERR IF 0, ERR 27      K1006870
                    *                                                   K1006880
                    *                 INITIALIZE RE DO                  K1006890
                          STO  L  REDO      SAVE IN REDO COUNT          K1006900
                    *                                                   K1006910
                    *             SUM = 0                               K1006920
                          BSI  L  SUBR      BR TO TEST SW15 AND SUM     K1006930
                    *                                                   K1006940
                    *                  GREP = SUM OR 1 IF SUM = 0       K1006950
                          LD   L  SUM       LD SUM                      K1006960
                          BSC  L  *+2,Z     BR IF NOT = 0               K1006970
                          LD   L  ONE       SET GROUP REPEAT CONSTANT   K1006980
                          STO  L  GREP      *TO 1                       K1006990
                    *                                                   K1007000
                    *             CALL NLIZE                            K1007010
                          BSI  L  NLIZE     CLEAR SW15 AND SUM          K1007020
                    *                                                   K1007030
                    *                  LOOP=-1                          K1007040
                          LD   L  MONE      GET -1 CONSTANT             K1007050
                          STO     LOOP      SAVE                        K1007060
                          LDX  L  DOG       BR TO PROCESS NXT CHAR      K1007070
                    *                                                   K1007080
                    *                  SUM=0                        2-1 K1007090
                    RP    LD   L  SUM                               2-1 K1007100
                          BSC  L  J,Z       BR TO ERR IF NE 0 (ERR 27)  K1007110
                    *                                                   K1007120
                    *                  PUT SLASH                        K1007130
                          LD   L  N7        GET SLASH INDICATOR         K1007140
                          BSI  L  PUT       PUT ON O/P STRING           K1007150
                          BSC  L  LIMA      BR TO GET ANOTHER CHAR      K1007160
                    *                                                   K1007170
                    *                  TEST INDICATORS AND GET NEXT     K1007180
                    *                  CHAR AND FIELD WIDTH             K1007190
                    *                                                   K1007200
                    *                  REP=0                            K1007210
                    F     LD   L  REP       GET REPEAT FLAG             K1007220
                          BSC  L  J,Z       BR TO ERR IF NE 0 (ERR 27)  K1007230
                    *                                                   K1007240
                    *                  SUM=0                            K1007250
                          LD   L  SUM       TEST SUM FIELD WIDTH        K1007260
                          BSC  L  J,+-      BR TO ERR IF = 0  (ERR 27)  K1007270
                    *                                                   K1007280
                    *                  WW=SUM                           K1007290
                          LD   L  SUM                                   K1007300
                          STO  L  WW        SAVE SUM IN TOT FLD WIDTH   K1007310
                    *                                                   K1007320
                    *             CALL NLIZE                            K1007330
                          BSI  L  NLIZE     CLEAR SUM AND SW15          K1007340
                    *                                                   K1007350
                    *                  TEST SW6                         K1007360
                          LD   L  SW6       TEST FOR COMMA ALLOWABLE    K1007370
                          BSC  L  O,Z       BR IF NOT ALLOWABLE         K1007380
                    *                                                   K1007390
                    *                  TAG SW8                          K1007400
                          MDX  L  SW8,1     SET COMMA NOT MANDATORY SW  K1007410
                    *                                                   K1007420
                    *                  GET X                            K1007430
                          BSI  L  GET       GET NEXT CHAR               K1007440
                          STO  L  X         SAVE                        K1007450
                          BSC  L  K         BR TO BUILD SPECIFICATIONS  K1007460
                    *                                                   K1007470
                    *             TEST SW15                             K1007480
                    M     LD   L  SW15      LD DIGIT ENCOUNTERED SW     K1007490
                          BSC  L  J,+-      BR IF NO DIGIT FOUND        K1007500
                    *                                                   K1007510
                    *                  DD LESS THAN 32                  K1007520
                          LD   L  SUM       GET FIELD WIDTH             K1007530
                          S    L  N31       SUBTRACT CONSTANT =31       K1007540
                          BSC  L  ERR30,Z-  BR IF WIDTH GT 31           K1007550
                    *                                                   K1007560
                    *                  DD=SUM                           K1007570
                          LD   L  SUM       GET FIELD WITH              K1007580
                          STO  L  DD        SAVE AS DECML WIDTH         K1007590
                    *                                                   K1007600
                    *             WW G.T. DD                            K1007610
                          S    L  WW        COMPARE WITH TOT FLD WIDTH  K1007620
                          BSC  L  ERR30,-Z  BR ERR IF TOT LT DECML      K1007630
                    *                                                   K1007640
                    *             CALL NLIZE                            K1007650
                          BSI  L  NLIZE     BR TO CLEAR SUM AND SW15    K1007660
                          BSC  L  K         BR TO BUILD SPECIFICATIONS  K1007670
                    *                                                   K1007680
                    *                  TAG SW6                          K1007690
                    E     MDX  L  SW6,1     SET COMMA NOT ALLOWABLE SW  K1007700
                          MDX     F         BR TO TEST IF GET NXT CHAR  K1007710
                    *                                                   K1007720
                    *                  CONSTANTS                        K1007730
                    BLANK DC      /0040     EBC BLANK                   K1007740
                    Y     DC      0         LEFT CHAR TO PACK O/P AREA  K1007750
                    COMMA DC      /006B     EBC COMMA                   K1007760
                    N5    DC      /5000     HOLLERITH MASK              K1007770
                    N9    DC      /9000     FIELD REPEAT FLAG           K1007780
                    QUOTC DC      /007D     QUOTE MASK                  K1007790
                    CT    DC      0         NO. CHARS HOLL FMT          K1007800
                    JAMEY DC      0         O/P STRING WD CNT           K1007810
                    ER29  DC      29        ERROR 29 CONSTANT           K1007820
                    C146  DC      146       MAX HOLL CHAR CNT           K1007830
                    SW11  DC      0         H OR QUOTE TYPE SPEC SW     K1007840
                          BSS  E  0                                     K1007850
                    SW45H DC      *-*       TEMP STO SW4                K1007860
                          DC      *-*       TEMP STO SW5                K1007870
                    NCNTH DC      *-*       TEMP STO NORM COUNT         K1007880
                    *                                                   K1007890
                    *                  NORMALIZE SW6 (COMMA ALLOWABLE)  K1007900
                    O     SLA     16        CLEAR ACC                   K1007910
                          STO  L  SW6       SET COMMA ALLOWABLE FLAG    K1007920
                    *                                                   K1007930
                    *                  SET UP COUNT                     K1007940
                          STO     CT        CLEAR CNT OF NO. HOLL CHARS K1007960
                    *                                                   K1007970
                    *                  PUT H SPEC.                      K1007980
                          STX   2 JAMEY     SAVE O/P STRING POINTER     K1007990
                          LD      N5        LD HOLL SPEC MASK           K1008000
                          OR   L  WW        ADD TO TOTAL FIELD WIDTH    K1008010
                          BSI  L  PUT       PUT SPEC ON O/P STRING      K1008020
                    *                                                   K1008030
                    *                  TAG SW11                         K1008040
                          MDX  L  SW11,1                                K1008050
                    *                       SET H OR QUOTE SPEC FLAG    K1008060
                    *                  GET X                            K1008070
                    KILO  BSI  L  GET       GET NEXT CHAR               K1008080
                          STO  L  X         SAVE                        K1008090
                    *                                                   K1008100
                    *                  TEST SW12-QUOTE TYPE SPEC        K1008110
                          LD   L  SW12      LD SWITCH                   K1008120
                          BSC  L  LOB,+-    BR IF NOT QUOTE TYPE SPEC   K1008130
                    *                                                   K1008140
                    *             X = QUOTE                             K1008150
                          LD   L  X         LD STRING CHAR              K1008160
                          S       QUOTC     TEST FOR QUOTE CONSTANT     K1008170
                          BSC  L  LOB3,+-   BR IF QUOTE FOUND           K1008180
                    *                                                   K1008190
                    *                  CHAR NOT QUOTE, PROCESS AS       K1008200
                    *                  HOLLERITH CHAR                   K1008210
                    *             NCNT = 0                              K1008220
                          LD   L  NCNT      TEST NORM COUNT             K1008230
                          BSC  L  ERR29,+-  BR IF COUNT = 0             K1008240
                    *                                                   K1008250
                    LOB2  LD   L  TWO       GET A CONSTANT = 2          K1008260
                    *                  WW=2                             K1008270
                          STO  L  WW        SET TOTAL FIELD WIDTH =2    K1008280
                    *                                                   K1008290
                    *                  CT=CT+1                          K1008300
                          MDX  L  CT,1      INCR HOLL CHAR COUNT        K1008310
                          MDX     LOB       BR TO O/P CHAR              K1008320
                    *                                                   K1008330
                    *                  SECOND QUOTE FOUND IN QUOTE TYPE K1008340
                    *                  SPECIFICATION                    K1008350
                    *                                                   K1008360
                    *             SAVE STATUS OF GET ROUTINE            K1008370
                    LOB3  LDD  L  SW4       GET SW4 AND SW5             K1008380
                          STD     SW45H     SAVE IN TEMP STO            K1008390
                          LD   L  NCNT      GET NORM COUNT              K1008400
                          STO     NCNTH     SAVE IN TEMP STO            K1008410
                          STX   1 RXR1H+1   SAVE I/P STRING POINTER     K1008420
                    *                                                   K1008430
                    *             GET X                                 K1008440
                          BSI  L  GET       GET ANOTHER CHAR            K1008450
                    *                                                   K1008460
                    *             X = QUOTE                             K1008470
                          S       QUOTC     TEST CHAR FOR QUOTE         K1008480
                          BSC  L  LOB2,+-   BR TO O/P HOLL QUOTE IF YES K1008490
                    *                                                   K1008500
                    *             RESTORE STATUS OF GET ROUTINE         K1008510
                          LDD     SW45H     LOAD SW4 AND SW5 FR TEMP    K1008520
                          STD  L  SW4       RESTORE SW4 AND SW5         K1008530
                          LD      NCNTH     LD TEMP NORM COUNT          K1008540
                          STO  L  NCNT      SAVE                        K1008550
                    RXR1H LDX  L1 *-*       RESTORE I/P STRING POINTER  K1008560
                    *                                                   K1008570
                    *                  PUT OUT SPECIAL QUOTE            K1008580
                          STX   2 JAMES+1   SAVE O/P STRING POINTER     K1008590
                          LDX  I2 JAMEY     LD START OF QUOTE AREA PT   K1008600
                          LD    2 0         LD FIRST WD OF QUOTE AREA   K1008610
                          OR      CT        ADD NO CHARS                K1008620
                          STO   2 0         SAVE IN FIRST WORD          K1008630
                    JAMES LDX  L2 0         RESTORE O/P STRING POINTER  K1008640
                    *                                                   K1008650
                    *                  CT LESS THAN 146                 K1008660
                          LD      CT        LD HOLL CHAR CNT            K1008670
                          BSC  L  NZER,Z    BR IF CNT NON-ZERO          K1008680
                          MDX   2 -1        DECREMENT OUTPUT POINTER    K1008690
                          MDX  L  TABC,-1   IF ZERO LENGTH LITERAL      K1008700
                          NOP               (MAY SKIP)                  K1008710
                          MDX  L  REDO,-1   DECR REDO                   K1008720
                          NOP               (MAY SKIP)                  K1008730
                          MDX  L  LOOP,1    INCR LOOP                   K1008740
                          NOP               (MAY SKIP)                  K1008750
                    NZER  EQU     *                                     K1008760
                          S       C146      SUBTRACT MAX SIZE LITERAL   K1008770
                          BSC  L  JILL,+Z   BR IF LITERAL LT 146        K1008780
                    *                                                   K1008790
                    *             SET UP ERROR 29                       K1008800
                    ERR29 LD      ER29      LD ERR 29 CON               K1008810
                          STO  L  ERRNO     SAVE IN ERR NO.             K1008820
                          BSC  L  BAKER     BR TO OUTPUT ERR            K1008830
                    *                                                   K1008840
                    *                  NORMALIZE SW12                   K1008850
                    JILL  SLA     16        CLEAR ACC                   K1008860
                          STO  L  SW12      SET NON-QUOTE TYPE SPEC.    K1008870
                          MDX     HILO+3    BR TO CONT WITH STRING      K1008880
                    *                                                   K1008890
                    *                  OUTPUT HOLLERITH CHARACTERS      K1008900
                    *                  PACKED 2 TO A WORD               K1008910
                    *                  TEST SW7                         K1008920
                    LOB   LD   L  SW7       LD LEFT/RIGHT SW            K1008930
                          BSC  L  GAM,+-    BR IF LEFT                  K1008940
                    *                                                   K1008950
                    *                  NORMALIZE SW7                    K1008960
                          SLA     16        CLEAR ACC                   K1008970
                          STO  L  SW7       SET SW TO LEFT FOR NXT CHAR K1008980
                    *                                                   K1008990
                    *                  PUT Y X                          K1009000
                          LD      Y         LD LEFT HOLL CHAR TO BE O/P K1009010
                          SLA     8         SHIFT TO LEFT HALF OF WD    K1009020
                          OR   L  X         ADD PRESENT CHAR RIGHT HALF K1009030
                          BSI  L  PUT       BR TO PUT PACKED WD IN O/P  K1009040
                    *                                                   K1009050
                    *                  WW=WW-1                          K1009060
                    HILO  MDX  L  WW,-1     DECR TOTAL FIELD WIDTH      K1009070
                    *                                                   K1009080
                    *                  WW=0                             K1009090
                          MDX     KILO      BR TO GET NXT CHAR IF ANY   K1009100
                    *                                                   K1009110
                    *                  TEST SW7                         K1009120
                          LD   L  SW7       TEST FOR LEFT CHAR TO O/P   K1009130
                          BSC  L  LIMA,+-   BR IF LEFT CHAR TO O/P      K1009140
                    *                                                   K1009150
                    *                  PUT Y BLANK                      K1009160
                          LD      Y         LD LEFT CHAR                K1009170
                          SLA     8         SHIFT TO LEFT HALF OF WD    K1009180
                          OR   L  BLANK     ADD EBC BLANK IN RIGHT HALF K1009190
                          BSI  L  PUT       PUT WD ON O/P STRING        K1009200
                    *                                                   K1009210
                    *                  NORMALIZE SW7                    K1009220
                          SLA     16        CLEAR ACC TO SET LEFT HALF  K1009230
                          STO  L  SW7       *O/P SW FOR NEXT HOLL O/P   K1009240
                    *                                                   K1009250
                    *                  TAG SW8                          K1009260
                    LIMA  MDX  L  SW8,1     SET COMMA MANDATORY SW      K1009270
                    *                                                   K1009280
                    *                  NORMALIZE SW11                   K1009290
                          SLA     16        CLEAR ACC TO SET NOT H OR   K1009300
                          STO  L  SW11      *QUOTE SPEC SW              K1009310
                    *                                                   K1009320
                    *                  GET X                            K1009330
                          BSI  L  GET       GET NXT CHAR                K1009340
                          STO  L  X         SAVE                        K1009350
                          MDX     QUAD      BR TO PROCESS NEW SPEC      K1009360
                    *                                                   K1009370
                    *                  Y=X                              K1009380
                    GAM   LD   L  X         GET STRING CHAR FOR LEFT    K1009390
                          STO  L  Y         *HAND O/P OF PACKED WD      K1009400
                    *                                                   K1009410
                    *                  TAG SW7                          K1009420
                          MDX  L  SW7,1     SET SW FOR RIGHT CHAR NXT   K1009430
                          MDX     HILO      CONTINUE PROCESSING STRING  K1009440
                    *                                                   K1009450
                    *                  TAG SW2                          K1009460
                    OLD   MDX  L  SW2,1     SET I TYPE SPEC SW          K1009470
                    *                                                   K1009480
                    *                  TAG SW3                          K1009490
                    POP   MDX  L  SW3,1     SET 2ND NO. OF SPEC SW      K1009500
                    *                                                   K1009510
                    *                  REP=SUM                          K1009520
                          LD   L  SUM       LD FIELD WIDTH              K1009530
                          STO  L  REP       SAVE IN REPEAT              K1009540
                    *                                                   K1009550
                    *             CALL NLIZE                            K1009560
                          BSI  L  NLIZE     CLEAR SUM, SW15             K1009570
                    *                                                   K1009580
                    *                  TAG SW1                          K1009590
                          MDX  L  SW1,1     SET END OF SPEC SW          K1009600
                          LDX  L  DOG       BR FOR NXT SPEC TYPE        K1009610
                    *                                                   K1009620
                    *                  BUILD SPECIFICATIONS             K1009630
                    K     LD   L  DD        LD DECML FIELD WIDTH        K1009640
                          SLA     7         LEFT JUSTIFY                K1009650
                          OR   L  WW        ADD TOT FIELD WIDTH-RIGHT   K1009660
                          OR      COMTP     ADD O/P TYPE INDICATOR      K1009670
                    *                                                   K1009680
                    *                  PUT SPECIFICATION                K1009690
                          BSI  L  PUT       PUT SPEC ON O/P STRING      K1009700
                    *                                                   K1009710
                    *                  DD=0                             K1009720
                          SLA     16        CLEAR ACC                   K1009730
                          STO  L  DD        CLEAR DECML FIELD WIDTH     K1009740
                    *                                                   K1009750
                    *                  WW=0                             K1009760
                          STO  L  WW        CLEAR TOTAL FIELD WIDTH     K1009770
                    *                                                   K1009780
                    *                  REP=0                            K1009790
                          LD   L  REP       TEST REPEAT COUNT           K1009800
                          BSC  L  QUAD,+-   BR IF 0 FOR NXT SPEC        K1009810
                    *                                                   K1009820
                    *                  REP=1                            K1009830
                          S    L  ONE       SUBTRACT 1                  K1009840
                          BSC  L  ZEBRA,+-  BR IF = 1                   K1009850
                    *                                                   K1009860
                    *                  PUT REPEAT                       K1009870
                          LD   L  N9        LD REPEAT INDICATOR         K1009880
                          OR   L  REP       ADD REPEAT COUNT            K1009890
                          BSI  L  PUT       PUT ON O/P STRING           K1009900
                    *                                                   K1009910
                    *                  REP=0                            K1009920
                    ZEBRA SLA     16        CLEAR ACC                   K1009930
                          STO  L  REP       CLEAR REPEAT COUNT          K1009940
                    *                                                   K1009950
                    *                  NEW SPECIFICATION TYPE TO BE     K1009960
                    *                  PROCESSED                        K1009970
                    *                  NORMALIZE SW1                    K1009980
                    QUAD  SLA     16        CLEAR ACC TO SET BEGINNING  K1009990
                          STO  L  SW1       *OF SPEC SW                 K1010000
                    *                                                   K1010010
                    *                  X=COMMA                          K1010020
                          LD   L  X         LD STRING WD                K1010030
                          S    L  COMMA     SUBTRACT EBC COMMA          K1010040
                          BSC  L  CATT,Z    BR IF COMMA NOT FOUND       K1010050
                    *                                                   K1010060
                    *             NORMALIZE SW15 (DIGIT ENCOUNTERED SW) K1010070
                          STO  L  SW15      SET DIGIT NOT ENCOUNTERED   K1010080
                    *                                                   K1010090
                    *                  NORMALIZE SW8 (MANDATORY COMMA)  K1010100
                          STO  L  SW8       SET COMMA MANDATORY         K1010110
                          BSC  L  DOG       BR TO CALC FIELD WIDTH      K1010120
                    *                                                   K1010130
                    *                  TEST SW8                         K1010140
                    CATT  LD   L  SW8       LD COMMA MANDATORY SW       K1010150
                          BSC  L  ECHO,+-   BR IF COMMA MANDATORY       K1010160
                    *                                                   K1010170
                    *                  NORMALIZE SW8                    K1010180
                          SLA     16        CLEAR ACC                   K1010190
                          STO  L  SW8       SET COMMA MANDATORY SW      K1010200
                          LD   L  X         LD STRING CHAR              K1010210
                          LDX  L  DOG+3     BR TO PROCESS               K1010220
                    *                                                   K1010230
                    *                  CONSTANTS                        K1010240
                    XTYPE DC      /4000     X TYPE SPEC CONSTANT        K1010250
                    FTYPE DC      /1000     F TYPE SPEC CONSTANT        K1010260
                    ETYPE DC      0         E TYPE SPEC CONSTANT        K1010270
                    ITYPE DC      /2000     I TYPE SPEC CONSTANT        K1010280
                    ATYPE DC      /3000     A TYPE SPEC CONSTANT        K1010290
                    COMTP DC      0         CON INDICATING O/P TYPE     K1010300
                    *                                                   K1010310
                    *                  SET INDICATORS FOR VARIOUS TYPE  K1010320
                    *                  SPECIFICATIONS                   K1010330
                    *                  INDICATE X TYPE                  K1010340
                    ZX    LD      XTYPE     LD X TYPE CONSTANT          K1010350
                          STO     COMTP     SAVE IN CONSTANT TYPE       K1010360
                          BSC  L  F         BR TO CALC FIELD WIDTH      K1010370
                    *                                                   K1010380
                    *                  INDICATE F TYPE                  K1010390
                    B     LD      FTYPE     LD F TYPE SPEC CONSTANT     K1010400
                          STO     COMTP     SAVE CONSTANT TYPE          K1010410
                    BB    BSI  L  SUBR      CLEAR SUM AND SW15          K1010420
                          MDX     OLD       BR TO CONTINUE              K1010430
                    *                                                   K1010440
                    *                  INDICATE E TYPE                  K1010450
                    C     LD      ETYPE     LD E TYPE SPEC CONSTANT     K1010460
                          STO     COMTP     SAVE CONSTANT TYPE          K1010470
                          MDX     BB        BR TO CONTINUE              K1010480
                    *                                                   K1010490
                    *                  INDICATE I TYPE                  K1010500
                    D     LD      ITYPE     LD I TYPE SPEC CONSTANT     K1010510
                          STO     COMTP     SAVE CONSTANT TYPE          K1010520
                    DD2   BSI  L  SUBR      CLEAR SW15 AND SUM          K1010530
                          MDX     POP       BR TO CONTINUE              K1010540
                    *                                                   K1010550
                    *                  INDICATE A TYPE                  K1010560
                    I     LD      ATYPE     LD A TYPE SPEC CONSTANT     K1010570
                          STO     COMTP     SAVE                        K1010580
                          MDX     DD2       BR TO CONTINUE              K1010590
                    *                                                   K1010600
                    *             SUBROUTINE TO GET A WORD FROM A       K1010610
                    *             FORMAT STATEMENT FOR ANALYSIS         K1010620
                    *             TAKES PACKED EBC CHARS FROM INPUT     K1010630
                    *             STRING AND EMITS ONE CHAR AT A TIME   K1010640
                    *             RIGHT JUSTIFIED IN THE ACCUMULATOR    K1010650
                    *                                                   K1010660
                    GET   DC      0         BSI ENTRY POINT             K1010670
                    *                                                   K1010680
                    *                  TEST SW5 FOR END OF STMNT        K1010690
                    GETY  LD   L  SW5       LD END OF STMNT SW          K1010700
                          BSC  L  MAT,+-    BR IF NOT END OF STMNT      K1010710
                    *                                                   K1010720
                    *                  TEST SW9                         K1010730
                          LD   L  SW9       LD REDO SW                  K1010740
                          BSC  L  FAT,+-    BR IF NOT OK TO O/P REDO    K1010750
                    *                                                   K1010760
                    *                  RE-ADJUST ID NORM                K1010770
                          STX   2 ZR+1      SAVE O/P STRING POINTER     K1010780
                          LDX  I2 VIGG      LD I/D LOC OF O/P STRING    K1010790
                          LD      TABC      LD NO. WDS O/P STRING       K1010800
                          A    L  TWO       ADD 2 FOR STMNT NO. AND ID  K1010810
                          SLA     2         SHIFT TO NORM (BITS 6-13)   K1010820
                          STO     TABC      SAVE IN COUNT AREA          K1010830
                          LD    2 0         LD ID WD O/P STRING         K1010840
                          AND     MATB      MASK OUT PREV STMNT NORM    K1010850
                          OR      TABC      MASK IN NEW NORM            K1010860
                          STO   2 0         SAVE NEW ID WD O/P STRING   K1010870
                    ZR    LDX  L2 0         LD ACTUAL O/P STRING PT     K1010880
                          STX  L2 NEOFS     SAVE AS END OF STRING       K1010890
                          BSC  L  ABEL      BR TO PROCESS NXT STMNT     K1010900
                    *                                                   K1010910
                    *                  PUT BLANK IN A REGISTER          K1010920
                    FAT   LD   L  BLANK     LD EBC BLANK                K1010930
                          BSC  I  GET       RETURN TO CALLING PROGRAM   K1010940
                    *                                                   K1010950
                    *                  TEST SW4                         K1010960
                    MAT   LD   L  SW4       LD LEFT/RIGHT CHAR SW       K1010970
                          BSC  L  LUKE,Z    BR IF RIGHT CHAR            K1010980
                    *                                                   K1010990
                    *                  TAG SW4                          K1011000
                          MDX  L  SW4,1     SET SW TO PROCESS RIGHT NXT K1011010
                    *                                                   K1011020
                    *                  PUT LEFT CHAR. IN A REGISTER     K1011030
                          LD    1 0         LD WD I/P STRING            K1011040
                          SRA     8         CHAR IN BITS 8-15           K1011050
                          AND  L  MASK      MASK OUT BIS 0-7            K1011060
                          STO     WALT      SAVE IN TEMP STORAGE        K1011070
                    *                                                   K1011080
                    *                  TEST SW11                        K1011090
                    ABIT  LD   L  SW11      LD QUOTE TYPE SPEC SW       K1011100
                          BSC  L  LARR,+-   BR IF NOT QUOTE TYPE        K1011110
                          LD      WALT      LD O/P WD                   K1011120
                          MDX     LARR+7    BR TO EXIT                  K1011130
                    *                                                   K1011140
                    *                  IS CHARACTER BLANK               K1011150
                    LARR  LD      WALT      LD CHAR FROM TEMP STO       K1011160
                          S    L  BLANK     TEST FOR EBC BLANK          K1011170
                          BSC  L  GETY,+-   BR IF BLANK TO GET NXT CHAR K1011180
                          A    L  BLANK     ELSE, RESTORE CHAR          K1011190
                          BSC  I  GET       RETURN TO CALLING PROGRAM   K1011200
                    *                                                   K1011210
                    *                  NORMALIZE SW4                    K1011220
                    LUKE  SLA     16        SET LEFT/RIGHT CHAR SW FOR  K1011230
                          STO  L  SW4       *LEFT CHAR NEXT TIME        K1011240
                    *                                                   K1011250
                    *                  PUT RIGHT CHAR IN A REGISTER     K1011260
                          LD    1 0         LD WD FR I/P STRING         K1011270
                          AND  L  MASKK     MASK OUT BITS 0-7           K1011280
                          STO     WALT      SAVE IN TEMPORARY STORAGE   K1011290
                    *                                                   K1011300
                    *                  MOVE POINTER  1                  K1011310
                          MDX   1 1         INCR INPUT STRING POINTER   K1011320
                    *                                                   K1011330
                    *                  NCNT=NCNT-1                      K1011340
                          MDX  L  NCNT,-1   DECR COUNT OF WDS IN STMNT  K1011350
                    *                                                   K1011360
                    *                  NCNT=0                           K1011370
                          MDX     ABIT      BR IF COUNT NOT FINISHED    K1011380
                    *                                                   K1011390
                    *                  TAG SW5                          K1011400
                          MDX  L  SW5,1     SET END OF STMNT SW         K1011410
                          MDX     ABIT      BR TO TEST CHAR             K1011420
                    *                                                   K1011430
                    *                  CONSTANTS                        K1011440
                    WALT  DC      0         TEMP STO FOR CHAR OBTAINED  K1011450
                    VIGG  DC      0         LOC OF STMNT ID             K1011460
                    TABC  DC      0         NO. WDS O/P STRING STMNT    K1011470
                    MATB  DC      /F803     MASK TO CLEAR NORM ID WD    K1011480
                    VAB   DC      0         TEMP STO I/P STRING PT      K1011490
                    VAB1  DC      0         TEMP STO O/P STRING PT      K1011500
                    *                                                   K1011510
                    *             SUBROUTINE TO PUT WORD ON OUTPUT      K1011520
                    *             STRING. ACC CONTAINS WORD TO BE       K1011530
                    *             OUTPUT ON ENTRY TO THIS SUBROUTINE.   K1011540
                    *                                                   K1011550
                    PUT   DC      0         SUBROUTINE ENTRY POINT      K1011560
                    *                                                   K1011570
                    *                  PUT A REGISTER IN BUILD BUFFER   K1011580
                          STO   2 0         SAVE O/P WD IN STRING       K1011590
                          MDX  L  TABC,1    INCR O/P WD CNT             K1011600
                    *                                                   K1011610
                    *                  MOVE POINTER                     K1011620
                          MDX   2 1         INCR O/P STRING PT          K1011630
                    *                                                   K1011640
                    *                  CHECK OVERLAP                    K1011650
                          STX   1 VAB1      SAVE I/P STRING PT          K1011660
                          STX   2 VAB       SAVE O/P STRING PT          K1011670
                          LD      VAB1      COMPARE I/P POINTER         K1011680
                          S       VAB       * WITH OUTPUT POINTER       K1011690
                          BSC  L  VAB2,-    BR IF I/P GE O/P            K1011700
                    *                                                   K1011710
                    *                  SET UP OVERLAP ERROR             K1011720
                          MDX  L  ERROR,1   SET SYSTEM OVERLAP ERR FLAG K1011730
                          BSC  L  OUT       BR TO EXIT FR COMPILER      K1011740
                    *                                                   K1011750
                    *                  REDO=REDO + 1                    K1011760
                    VAB2  MDX  L  REDO,1    INCR REDO COUNT             K1011770
                    *                                                   K1011780
                    *                  LOOP=LOOP-1                      K1011790
                          MDX  L  LOOP,-1   INCR LOOP COUNT             K1011800
                          BSC  I  PUT       RETURN TO CALLING PROGRAM   K1011810
                    *                                                   K1011820
                    *             THIS SUBR NORMALIZES SUM AND SW15     K1011830
                    *                                                   K1011840
                    NLIZE DC      0         SUBROUTINE ENTRY POINT      K1011850
                    *                                                   K1011860
                    *             SUM = 0                               K1011870
                          SLA     16        CLEAR ACC                   K1011880
                          STO  L  SUM       CLEAR FIELD WIDTH           K1011890
                    *                                                   K1011900
                    *             NORMALIZE SW15                        K1011910
                          STO  L  SW15      CLEAR DIGIT ENCOUNTERED SW  K1011920
                          BSC  I  NLIZE     RETURN TO CALLING PROG      K1011930
                    *                                                   K1011940
                    *             THIS ROUTINE TESTS SW15 AND SUM       K1011950
                    *                                                   K1011960
                    SUBR  DC      0         SUBROUTINE ENTRY POINT      K1011970
                    *                                                   K1011980
                    *             SW15 TAGED                            K1011990
                          LD   L  SW15      TEST FOR DIGIT ENCOUNTERED  K1012000
                          BSC     +-        SKIP IF YES                 K1012010
                          MDX     OUT2      RETURN TO CALLING PROG IF N K1012020
                    *                                                   K1012030
                    *             SUM=0                                 K1012040
                          LD   L  SUM       LD FIELD WIDTH              K1012050
                          BSC  L  J,+-      BR TO ERR IF = 0 (ERR 27)   K1012060
                    OUT2  BSC  I  SUBR      RETURN TO CALLING PROG IF N K1012070
                          BSS     BPHAR+PHLEN*320-1-*  PATCH AREA       K1012080
                          DC      0                                     K1012090
                          END     BPHAR-2                               K1012100
