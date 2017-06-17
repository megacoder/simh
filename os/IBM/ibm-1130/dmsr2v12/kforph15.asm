                          HDNG    1130 FORTRAN COMPILER PHASE 15        K1500010
************************************************************************K1500020
                    *************************************************** K1500030
                    *STATUS- VERSION 2, MODIFICATION 4                * K1500040
                    *                                                 * K1500050
                    *FUNCTION/OPERATION                               * K1500060
                    *   * SCANS READ, WRITE, IF, CALL, AND ARITHMETIC * K1500070
                    *     STATEMENTS FOR SUBSCRIPT EXPRESSIONS.       * K1500080
                    *   * OPTIMIZES SUBSCRIPT CALCULATION BY MEANS OF * K1500090
                    *     THE SUBSCRIPT EXPRESSION TABLE.             * K1500100
                    *   * GENERATES THE SGT(SUBSCPIPTED GENERATED     * K1500110
                    *     TEMPORARY) IF NECESSARY.                    * K1500120
                    *                                                 * K1500130
                    *ENTRY POINTS                                     * K1500140
                    *   START- ENTERED VIA CALL TO THE ROL SUBROUTINE * K1500150
                    *          FROM THE PREVIOUS PHASE.               * K1500160
                    *                                                 * K1500170
                    *INPUT-                                           * K1500180
                    *   NONE IN THE USUAL SENSE.  HOWEVER THE STMNT   * K1500190
                    *   STRING AND SYMBOL TABLE SCANNED BY THE        * K1500200
                    *   COMPILER MAY BE CONSIDERED INPUT.             * K1500210
                    *                                                 * K1500220
                    *OUTPUT-                                          * K1500230
                    *   MODIFICATIONS TO THE STMNT STRING AND SYMBOL  * K1500240
                    *   TABLE MAY BE CONSIDERED OUTPUT.               * K1500250
                    *                                                 * K1500260
                    *EXTERNAL REFERENCES-                             * K1500270
                    **  $PHSE                                         * K1500280
                    *                                                 * K1500290
                    *EXITS-                                           * K1500300
                    *   EXIT FROM THIS PHASE IS MADE VIA THE ROL SUBR.* K1500310
                    *                                                 * K1500320
                    *TABLES/WORK AREAS-                               * K1500330
                    *   STATEMENT STRING                              * K1500340
                    *   SYMBOL TABLE                                  * K1500350
                    *   BOUND VARIABLE TABLE                          * K1500360
                    *   FCOM                                          * K1500370
                    *                                                 * K1500380
                    *ATTRIBUTES-                                      * K1500390
                    *   N/A                                           * K1500400
                    *                                                 * K1500410
                    *NOTES-                                           * K1500420
                    *   THE SWITCHES USED IN THIS PHASE FOLLOW.  IF   * K1500430
                    *   NON-ZERO, THE SWITCH IS TRANSFER T.  IF ZERO  * K1500440
                    *   THE SWITCH IS NORMAL N.                       * K1500450
                    *   SWITCH SW1-                                   * K1500460
                    *   SWITCH SW1 FLT PT NON-DIMENTIONED INTEGER VAR * K1500470
                    *       T-PURGE FLT PT NON-DIMENTIONED INTEGER VAR* K1500480
                    *   SWITCH SW2 I/O FOUND                          * K1500490
                    *       T-I/O FOUND                               * K1500500
                    *   SWITCH SW3 FLT PT NON-DIMENTIONED INTEGER VAR * K1500510
                    *       T-PUT FP NON-DIM INT VAR IN BOUND VAR TABL* K1500520
                    *   SWITCH SW4 IN FUNCTION CALL                   * K1500530
                    *       T-IN FUNCTION CALL                        * K1500540
                    *   SWITCH SW5                                    * K1500550
                    *       T-DO NOT OPTIMIZE                         * K1500560
                    *   SWITCH SW6 CLOSE STRING                       * K1500570
                    *       T-CLOSE STRING                            * K1500580
                    *                                                 * K1500590
                    *   ERRORS DETECTED BY THIS PHASE - 63            * K1500600
                    *************************************************** K1500610
                          ABS                                           K1500620
                    *                                                   K1500630
                    *                       SYSTEM EQUATES              K1500640
                    MEMRY EQU     /8000                                 K1500650
                    OVERL EQU     MEMRY-1501 START OF FCOM          2-4 K1500660
                    ROL   EQU     MEMRY-68   LOCN OF RTN TO READ NXT PH K1500670
                    $PHSE EQU     /78        NO. OF PHASE NOW IN CORE   K1500680
                          ORG     OVERL                                 K1500690
                    PHID  EQU     45         ID NUMBER THIS PHASE       K1500700
                    *                                                   K1500710
                    *                  FORTRAN COMMUNICATION AREA       K1500720
                    ORG   BSS     1    ORIGIN ADDRESS               2-4 K1500725
                    SOFS  BSS     1    START OF STRING                  K1500730
                    EOFS  BSS     1    END OF STRING                    K1500740
                    SOFST BSS     1    START OF SYMBOL TABLE            K1500750
                    SOFNS BSS     1    START OF NON-STATEMENT NUMBERS   K1500760
                    SOFXT BSS     1    START OF SUBSCRIPT TEMPORARIES   K1500770
                    SOFGT BSS     1    START OF GENERATED TEMPORARIES   K1500780
                    EOFST BSS     1    END OF SYMBOL TABLE              K1500790
                    COMON BSS     1    NEXT AVAILABLE COMMON            K1500800
                    CSIZE BSS     1    SIZE OF COMMON                   K1500810
                    ERROR BSS     1    OVERLAP ERROR                    K1500820
                    FNAME BSS     1         PROGRAM NAME                K1500830
                          BSS     1                                     K1500840
                    SORF  BSS     1    SUBROUTINE(-) OR FUNCTION(+)     K1500850
                    CCWD  BSS     1    CONTROL CARD WORD                K1500860
                    *                BIT 15 TRANSFER TRACE              K1500870
                    *                BIT 14 ARITHMETIC TRACE            K1500880
                    *                BIT 13 EXTENDED PRECISION          K1500890
                    *                BIT 12 LIST SYMBOL TABLE           K1500900
                    *                BIT 11 LIST SUBPROGRAM NAMES       K1500910
                    *                BIT 10 LIST SOURCE PROGRAM         K1500920
                    *                BIT  9 ONE WORD INTEGERS           K1500930
                    *                BIT  8 ORIGIN                  2-4 K1500935
                    IOCS  BSS     1    IOCS CONTROL CARD WORD           K1500940
                    *                BIT 15 CARD                        K1500950
                    *                BIT 14 PAPER TAPE                  K1500960
                    *                BIT 13 TYPEWRITER                  K1500970
                    *                BIT 12 1403 PRINTER                K1500980
                    *                BIT 11 2501 READER                 K1500990
                    *                BIT 10 KEYBOARD                    K1501000
                    *                BIT  9 1442 PUNCH                  K1501010
                    *                BIT  8 DISK                        K1501020
                    *                BIT  7 1132 PRINTER                K1501030
                    *                BIT  3 PLOTTER                     K1501040
                    DFCNT BSS     1                                     K1501050
                    *                                                   K1501060
                    *                                                   K1501070
                    *                  END OF FORTRAN COMMUNICATION     K1501080
                    *                  AREA                             K1501090
                    *************************************************** K1501100
                    *                                                   K1501260
                    *                                                   K1501270
                    BPHAR EQU     *+2       BEGIN PH AREA               K1501280
                          DC      0          LOADER WORK AREA.          K1501290
                          DC      -45        -PHASE ID FOR SLET LOOKUP  K1501300
                          DC      NXTPH-*+1  TABLE FOR NEXT PHASE ENTRY K1501310
                          DC      1          ONE ENTRY TO BE SET BY LDR K1501320
                          ORG     *-2                                   K1501330
                    START LDX   1 PHID       GET ID THIS PHASE          K1501340
                          STX  L1 $PHSE      STORE IN SYSTEM PHASE AREA K1501350
                    *                                                   K1501360
                    *                  OVERLAP ERROR                    K1501370
                    *                                                   K1501380
                          LD      ERROR                                 K1501390
                          BSC  L  OUT,Z                                 K1501400
                    *                                                   K1501410
                    *                  INITIALIZE PHASE                 K1501420
                          LDX  I1 SOFS                                  K1501430
                          LDX  L2 SETBL                                 K1501440
                          LDX   3 15                                    K1501450
                          SLA     16                                    K1501460
                          STO  L  SW1                                   K1501470
                          STO  L  SW2                                   K1501480
                          STO  L  SW3                                   K1501490
                    LOZZ  STO   2 7                                     K1501500
                          STO  L3 GTTAB-1                               K1501510
                          MDX   2 8                                     K1501520
                          MDX   3 -1                                    K1501530
                          MDX     LOZZ                                  K1501540
                          STO  L  BVTAB                                 K1501550
                    *                                                   K1501560
                    *                  END STATEMENT                    K1501570
                    TEST  LD    1 0                                     K1501580
                          SRA     1                                     K1501590
                          AND     IDTPE                                 K1501600
                          S       ENDC                                  K1501610
                          BSC  L  OUT,+-                                K1501620
                    *                                                   K1501630
                    *             FORMAT STATEMENT                      K1501640
                          S       FORMM                                 K1501650
                          BSC  L  MOVE,+-                               K1501660
                    *                                                   K1501670
                    *                       DEFINE FILE                 K1501680
                          S       DFL                                   K1501690
                          BSC  L  MOVE,+-                               K1501700
                    *                                                   K1501710
                    *                       CALL LINK OR CALL EXIT      K1501720
                          S       CLE                                   K1501730
                          BSC  L  MOVE,+-                               K1501740
                    *                                                   K1501750
                    *                       DATA STATEMENT              K1501760
                          S       DATAS                                 K1501770
                          BSC  L  MOVE,+-                               K1501780
                    *                                                   K1501790
                    *                  STATEMENT HAVE NUMBER            K1501800
                          LD    1 0                                     K1501810
                          BSC  L  TEST1,E                               K1501820
                    *                                                   K1501830
                    *                  SET PRIORITY STATUS              K1501840
                    TEST3 LDX  L2 SETBL                                 K1501850
                          LDX   3 15                                    K1501860
                    LOOP1 LD    2 7                                     K1501870
                          BSC  L  SK,+-                                 K1501880
                          OR   L  MASK1                                 K1501890
                          STO   2 7                                     K1501900
                    SK    MDX   2 8                                     K1501910
                          MDX   3 -1                                    K1501920
                          MDX     LOOP1                                 K1501930
                    *                                                   K1501940
                    *                  IS BOUND VARIABLE TABLE EMPTY    K1501950
                    TEST2 LD   L  BVTAB                                 K1501960
                          BSC  L  B1,+-                                 K1501970
                    *                                                   K1501980
                    *                  PURG ENTRY FROM BOUND VARIABLE   K1501990
                    *                          TABLE                    K1502000
                    *                                                   K1502010
                    B4    LD   I  EOFS                                  K1502020
                          BSI  L  PURG                                  K1502030
                          MDX  L  EOFS,-1                               K1502040
                          MDX  L  BVTAB,-1                              K1502050
                          MDX     B4                                    K1502060
                          MDX     TEST2                                 K1502070
                    *                                                   K1502080
                    *                  REFERENCED STATEMENT             K1502090
                    TEST1 LD    1 1                                     K1502100
                          BSI  L  CHECK                                 K1502110
                          AND  L  MASK2                                 K1502120
                          BSC  L  TLR,Z                                 K1502130
                    *                                                   K1502140
                    *             SPECIAL REFERENCED STATEMENT          K1502150
                          LD    1 0                                     K1502160
                          SRA     1                                     K1502170
                          BSC     E                                     K1502180
                          MDX     TLR1                                  K1502190
                          MDX     TEST3                                 K1502200
                    TLR1  LD    3 0                                     K1502210
                          OR   L  MASK2                                 K1502220
                          STO   3 0                                     K1502230
                          MDX     TEST3                                 K1502240
                    *                                                   K1502250
                    *                  CLEAR SUBSCRIPT EXPRESSION TABLE K1502260
                    CLSET DC      0         (SUBROUTINE)                K1502270
                          LDX  L2 SETBL                                 K1502280
                          LDX  I3 C15                                   K1502290
                          SLA     16                                    K1502300
                    LOOP  STO   2 7                                     K1502310
                          MDX   2 8                                     K1502320
                          MDX   3 -1                                    K1502330
                          MDX     LOOP                                  K1502340
                          BSC  I  CLSET     EXIT                        K1502350
                    *                                                   K1502360
                    *             NORMALIZE SWITCHES                    K1502370
                    TLR   BSI     CLSET     CLEAR SUBSCR EXPR TABLE     K1502380
                    B1    SLA     16                                    K1502390
                          STO  L  SW1                                   K1502400
                          STO  L  SW2                                   K1502410
                          STO  L  SW3                                   K1502420
                          STO  L  SW4                                   K1502430
                          STO  L  SW5                                   K1502440
                    *                                                   K1502450
                    *                  ARITHMETIC STATEMENT             K1502460
                    B     LD    1 0                                     K1502470
                          SRA     1                                     K1502480
                          AND     IDTPE                                 K1502490
                          BSC  L  TEST4,+-                              K1502500
                    *                                                   K1502510
                    *                  CALL STATEMENT                   K1502520
                          S       CALLC                                 K1502530
                          BSC  L  TEST5,+-                              K1502540
                    *                                                   K1502550
                    *                  READ STATEMENT                   K1502560
                          S       READC                                 K1502570
                          BSC  L  TEST8,+-                              K1502580
                    *                                                   K1502590
                    *                  WRITE STATEMENT                  K1502600
                          S       WRITC                                 K1502610
                          BSC  L  TEST7,+-                              K1502620
                    *                                                   K1502630
                    *                                                   K1502640
                          S       FINDC     IS IT A FIND STMNT          K1502650
                          BSC  L  TEST8,+-  BRANCH IF YES               K1502660
                    *                                                   K1502670
                    *                  IF STATEMENT                     K1502680
                          S       IFC                                   K1502690
                          BSC  L  C,+-                                  K1502700
                    *                                                   K1502710
                    *                       DO STATEMENT                K1502720
                          S       DOC                                   K1502730
                          BSC  L  MOVE,Z                                K1502740
                    *                                                   K1502750
                    *                       CLEAR SUBSCRIPT             K1502760
                          BSI     CLSET     EXPRESSION TABLE            K1502770
                    *                                                   K1502780
                    *                  MOVE TO NEXT STATEMENT           K1502790
                    MOVE  LD    1 0                                     K1502800
                          SRA     2                                     K1502810
                          AND  L  IDNRM                                 K1502820
                          STO     NXID+1                                K1502830
                    NXID  MDX  L1 0                                     K1502840
                          MDX     TEST                                  K1502850
                    *                                                   K1502860
                    *                  CONSTANTS                        K1502870
                    SW1   DC      0                                     K1502880
                    SW2   DC      0                                     K1502890
                    SW3   DC      0                                     K1502900
                    SW4   DC      0                                     K1502910
                    SW5   DC      0                                     K1502920
                    IDTPE DC      /7C00                                 K1502930
                    ENDC  DC      /0800                                 K1502940
                    FORMM DC      /3000-/0800                           K1502950
                    DFL   DC      /7800-/3000                           K1502960
                    CLE   DC      /7000-/7800                           K1502970
                    DATAS DC      /7C00-/7000                           K1502980
                    MASK1 DC      /8000                                 K1502990
                    MASK2 DC      /0020                                 K1503000
                    CALLC DC      /1800                                 K1503010
                    READC DC      /4800-/1800                           K1503020
                    WRITC DC      /4400-/4800                           K1503030
                    FINDC DC      /7400-/4400                           K1503040
                    IFC   DC      /3C00-/7400                           K1503050
                    DOC   DC      /2C00-/3C00                           K1503060
                    SETBL BSS     120       WORK AREA                   K1503070
                    C15   DC      15        CONSTANT                    K1503080
                    IDNRM DC      /01FF                                 K1503090
                    IDSAV DC      0                                     K1503100
                    DOAC  DC      /002A                                 K1503110
                    DIOOP DC      /0030     CONSTANT                    K1503120
                    DEFIL DC      /7800-/0800 DEFINI FILE TEST CNSTNT   K1503130
                    *                                                   K1503140
                    *                  TAG SW3                          K1503150
                    TEST4 MDX  L  SW3,1                                 K1503160
                    *                                                   K1503170
                    *                  TAG SW1                          K1503180
                          MDX  L  SW1,1                                 K1503190
                          MDX     C                                     K1503200
                    *                                                   K1503210
                    *                  TAG SW1                          K1503220
                    TEST8 MDX  L  SW1,1                                 K1503230
                    *                                                   K1503240
                    *                  TAG SW2                          K1503250
                    TEST7 MDX  L  SW2,1                                 K1503260
                          MDX     C                                     K1503270
                    *                                                   K1503280
                    *             TAG SW3                               K1503290
                    TEST5 MDX  L  SW3,1                                 K1503300
                    *                                                   K1503310
                    *                  INITIALIZE TO SCAN BODY          K1503320
                    C     STX   1 IDSAV                                 K1503330
                          LD    1 0                                     K1503340
                          BSC     E                                     K1503350
                          MDX   1 1                                     K1503360
                          MDX   1 1                                     K1503370
                          SLA     16                                    K1503380
                          STO  L  TOT                                   K1503390
                    *                                                   K1503400
                          LD    1 0                                     K1503410
                          S       DIOOP     IS IT DISK I/O              K1503420
                          BSC  L  F,Z        BRANCH IF NO           2-4 K1503430
                          LD   L  SORF       IS IT A SUBPROGRAM     2-4 K1503432
                          BSC  L  AVAR,+-    BRANCH IF NO           2-4 K1503434
                          STO  L  FILSW      SET FILE SWITCH ON     2-4 K1503436
                    *                                                   K1503440
                    *                  SEMI-COLON                       K1503450
                    F     LD    1 0                                     K1503460
                          BSC  L  JAY,+-                                K1503470
                    *                                                   K1503480
                    *                  TEST SW2                         K1503490
                          LD   L  SW2                                   K1503500
                          BSC  L  HEH,+-                                K1503510
                    *                                                   K1503520
                    *                  DOA                              K1503530
                          LD    1 0                                     K1503540
                          S       DOAC                                  K1503550
                          BSC  L  I,Z                                   K1503560
                    *                                                   K1503570
                    *                  PURG INDICY FROM S.E.TABLE       K1503580
                          LD    1 -1                                    K1503590
                          BSI  L  PURG                                  K1503600
                    *                                                   K1503610
                    *                  NORMALIZE SW3                    K1503620
                    EE    SLA     16                                    K1503630
                          STO  L  SW3                                   K1503640
                    *                                                   K1503650
                    *                  MOVE POINTER                     K1503660
                    E     MDX   1 1                                     K1503670
                          MDX     F                                     K1503680
                    *     PUT ASSOCIATED VARIABLE IN BOUND VAR TABLE    K1503690
                    *                                                   K1503700
                    AVAR  STX   1 AVARX+1   SAVE XR1                    K1503710
                          LDX  I1 SOFS      INITIALIZE TO SCAN STRING   K1503720
                    *                                                   K1503730
                    AVAR2 LD    1 0         LOAD STMNT ID               K1503740
                          SRA     1                                     K1503750
                          AND  L  IDTPE     MASK FOR TYPE CHECK         K1503760
                    *                                                   K1503770
                          S    L  ENDC      IS IT END                   K1503780
                          BSC  L  AVARX,+-  BRANCH IF YES               K1503790
                    *                                                   K1503800
                          S       DEFIL     IS IT DEFINE FILE           K1503810
                          BSC  L  AVAR4,Z   BRANCH IF NOT               K1503820
                    *                                                   K1503830
                          LD    1 4         GET ASSOCIATED VARIABLE     K1503840
                          BSI     PBVTB     PUT INTO BOUND VAR TABLE    K1503850
                    *                                                   K1503860
                    *                                                   K1503870
                    AVAR4 LD    1 0         LOAD STATEMENT ID           K1503880
                          SRA     2                                     K1503890
                          AND     IDNRM     GET STATEMENT NORM          K1503900
                          STO     AVAR6+1                               K1503910
                    AVAR6 MDX  L1 *-*       INCR TO NEXT STATEMENT      K1503920
                          MDX     AVAR2     CHECK NEXT STATEMENT        K1503930
                    *                                                   K1503940
                    AVARX LDX  L1 *-*       RESTORE XR1                 K1503950
                          MDX     F         CONTINUE                    K1503960
                    *                                                   K1503970
                    *                                                   K1503980
                    *                  CONSTANTS                        K1503990
                    MASK3 DC      /DBDE                                 K1504000
                    MASK4 DC      /4000                                 K1504010
                    *                                                   K1504020
                    *                  TEST SW3                         K1504030
                    I     LD   L  SW3                                   K1504040
                          BSC  L  B3,Z                                  K1504050
                    *                                                   K1504060
                    *                  TEST SW1                         K1504070
                          LD   L  SW1                                   K1504080
                          BSC  L  D,+-                                  K1504090
                    *                                                   K1504100
                    *             FIXED NON DIMED INTEGER VARIABLE      K1504110
                    B3    LD    1 0                                     K1504120
                          BSI  L  CHECK                                 K1504130
                          AND     MASK3                                 K1504140
                          EOR     MASK4                                 K1504150
                          BSC  L  D,Z                                   K1504160
                    *                                                   K1504170
                    *                  TEST SW3                         K1504180
                          LD   L  SW3                                   K1504190
                          BSC  L  PGSET,+-  BRANCH TO PURGE S.E. TABLE  K1504200
                          LD    1 0          LOAD NAME              2-4 K1504205
                          BSI     PBVTB     PUT NAME IN B.V. TABLE      K1504210
                          MDX     E         GO MOVE POINTER             K1504220
                    *                                                   K1504230
                    *                  PURG NAME FROM S.E.TABLE         K1504240
                    PGSET LD    1 0                                     K1504250
                          BSI  L  PURG                                  K1504260
                          MDX     E                                     K1504270
                    *                                                   K1504280
                    *                  PUT NAME IN B.V.TABLE            K1504290
                    PBVTB DC      *-*       LINK                        K1504300
                          MDX  L  EOFS,1                                K1504320
                          STO  I  EOFS                                  K1504330
                          MDX  L  BVTAB,1                               K1504340
                    *                                                   K1504350
                    *                  CHECK OVERLAP                    K1504360
                          LD   L  EOFST                                 K1504370
                          A    L  TWO                                   K1504380
                          S    L  EOFS                                  K1504390
                          BSC  L  WAR,+Z                                K1504400
                          BSC  I  PBVTB     RETURN                      K1504410
                    *                                                   K1504420
                    *                  CONSTANTS                        K1504430
                    SUBZ  DC      /0018                                 K1504440
                    SUB1  DC      /0002                                 K1504450
                    C7    DC      7                                     K1504460
                    C11   DC      11                                    K1504470
                    *                                                   K1504480
                    *                  SUB-ZERO                         K1504490
                    D     LD    1 0                                     K1504500
                          S       SUBZ                                  K1504510
                          BSC  L  TST,+-                                K1504520
                    *                                                   K1504530
                    *                  SUB-ONE                          K1504540
                          S       SUB1                                  K1504550
                          BSC  L  TST1,+-                               K1504560
                    *                                                   K1504570
                    *                  SUB-TWO                          K1504580
                          S       SUB1                                  K1504590
                          BSC  L  TST2,+-                               K1504600
                    *                                                   K1504610
                    *                  SUB-THREE                        K1504620
                          S       SUB1                                  K1504630
                          BSC  L  TST3,+-                               K1504640
                          MDX     E                                     K1504650
                    *                                                   K1504660
                    *                  Y=3                              K1504670
                    TST   LD   L  C3                                    K1504680
                          MDX     JED                                   K1504690
                    *                                                   K1504700
                    *                  Y=7                              K1504710
                    TST1  LD      C7                                    K1504720
                          MDX     JED                                   K1504730
                    *                                                   K1504740
                    *                  Y=11                             K1504750
                    TST2  LD      C11                                   K1504760
                          MDX     JED                                   K1504770
                    *                                                   K1504780
                    *                  Y=15                             K1504790
                    TST3  LD   L  C15                                   K1504800
                    JED   STO     Y                                     K1504810
                    *                                                   K1504820
                    *                  GET SUBSCRIPT EXPRESSION         K1504830
                    TST4  STX  L3 SAVE                                  K1504840
                          STX   1 SAVEM                                 K1504850
                          LDX   2 7                                     K1504860
                          LDX  L3 BUFF                                  K1504870
                          SLA     16                                    K1504880
                          STO  L2 BUFF-1                                K1504890
                          MDX   2 -1                                    K1504900
                          MDX     TST4+6                                K1504910
                          LDX  I2 Y                                     K1504920
                    FOX1  MDX   2 -2                                    K1504930
                          MDX     FOX                                   K1504940
                          MDX     FOX+5                                 K1504950
                    FOX   LD    1 1                                     K1504960
                          STO   3 0                                     K1504970
                          MDX   1 2                                     K1504980
                          MDX   3 1                                     K1504990
                          MDX     FOX1                                  K1505000
                    *                                                   K1505010
                    *                  TEST SW5                         K1505020
                          LD   L  SW5                                   K1505030
                          BSC  L  GOG1,Z                                K1505040
                    *                                                   K1505050
                    *                  SUBSCRIPT EXPRESSION IN TABLE    K1505060
                          LDX   3 15                                    K1505070
                          STX   3 SAVET                                 K1505080
                          LDX  L1 SETBL                                 K1505090
                    LUUP3 LD    1 7                                     K1505100
                          BSC  L  LUUP4,Z                               K1505110
                          MDX   1 8                                     K1505120
                          MDX     GOG+4                                 K1505130
                    LUUP4 LDX  L2 BUFF                                  K1505140
                          LDX   3 7                                     K1505150
                    LUUP  LD    2 0                                     K1505160
                          S     1 0                                     K1505170
                          BSC  L  GOG,Z                                 K1505180
                          MDX   2 1                                     K1505190
                          MDX   1 1                                     K1505200
                          MDX   3 -1                                    K1505210
                          MDX     LUUP                                  K1505220
                          LD      C16                                   K1505230
                          STO   1 0                                     K1505240
                          STX   1 TTA+1                                 K1505250
                          MDX     TST5                                  K1505260
                    GOG   STX   3 GOG+2                                 K1505270
                          MDX  L1 0                                     K1505280
                          MDX   1 1                                     K1505290
                          MDX  L  SAVET,-1                              K1505300
                          MDX     LUUP3                                 K1505310
                    GOG1  LDX  I1 SAVEM                                 K1505320
                          MDX     G                                     K1505330
                    *                                                   K1505340
                    *                  CONSTANTS                        K1505350
                    Y     DC      0                                     K1505360
                    SAVEM DC      0                                     K1505370
                    SAVET DC      0                                     K1505380
                    TOT   DC      0                                     K1505390
                    SAVEB DC      0                                     K1505400
                    C16   DC      16                                    K1505410
                    GTTAB BSS     15                                    K1505420
                    GTEMP DC      /8000                                 K1505430
                    GTPID DC      /4024                                 K1505440
                    SW6   DC      0                                     K1505450
                    *                                                   K1505460
                    *                  TAG NAME                         K1505470
                    TST5  LDX  I1 SAVEM                                 K1505480
                          S       SAVET                                 K1505490
                          SLA     11                                    K1505500
                          OR    1 -1                                    K1505510
                          STO   1 -1                                    K1505520
                    *                                                   K1505530
                    *             LITERAL SUBSCRIPT                     K1505540
                          LD    1 0                                     K1505550
                          S       SUBZ                                  K1505560
                          BSC  L  TST5A,Z                               K1505570
                    TTA   LDX  L3 0                                     K1505580
                          MDX   3 -7                                    K1505590
                          MDX     JAM+1                                 K1505600
                    *                                                   K1505610
                    *                  REMOVE Y SYMBOLS FROM STATEMENT  K1505620
                    TST5A STX   1 SAVET                                 K1505630
                          LD      SAVET                                 K1505640
                          A       Y                                     K1505650
                          STO     SAVEB                                 K1505660
                          LDX  I2 SAVEB                                 K1505670
                    HOG   LD    2 0                                     K1505680
                          STO   1 0                                     K1505690
                          BSC     +-                                    K1505700
                          MDX     HOG+7                                 K1505710
                          MDX   1 1                                     K1505720
                          MDX   2 1                                     K1505730
                          MDX     HOG                                   K1505740
                          LDX  I1 SAVET                                 K1505750
                    *                                                   K1505760
                    *                  TAG SW6                          K1505770
                          MDX  L  SW6,1                                 K1505780
                    *                                                   K1505790
                    *                  TOT=TOT+Y                        K1505800
                          LD      TOT                                   K1505810
                          A       Y                                     K1505820
                          STO     TOT                                   K1505830
                          BSC  L  F                                     K1505840
                    *                                                   K1505850
                    *                  USABLE SLOT IN TABLE             K1505860
                    G     LDX  L3 SETBL                                 K1505870
                          LDX   2 15                                    K1505880
                          LD    3 7                                     K1505890
                          BSC     +-                                    K1505900
                          MDX     JAM                                   K1505910
                          MDX   3 8                                     K1505920
                          MDX   2 -1                                    K1505930
                          MDX     G+3                                   K1505940
                          LDX  L3 SETBL                                 K1505950
                          LDX   2 15                                    K1505960
                    GG    LD    3 7                                     K1505970
                          BSC     +                                     K1505980
                          MDX     JAM                                   K1505990
                          MDX   3 8                                     K1506000
                          MDX   2 -1                                    K1506010
                          MDX     GG                                    K1506020
                          LDX  L  PIG                                   K1506030
                    *                                                   K1506040
                    *                  ADD EXPRESSION TO SE TABLE       K1506050
                    JAM   STX   2 SAVET                                 K1506060
                          LDX  L2 BUFF                                  K1506070
                          STX   1 SAVEB                                 K1506080
                          LDX   1 7                                     K1506090
                          LD    2 0                                     K1506100
                          STO   3 0                                     K1506110
                          MDX   2 1                                     K1506120
                          MDX   3 1                                     K1506130
                          MDX   1 -1                                    K1506140
                          MDX     JAM+5                                 K1506150
                          LD      C16                                   K1506160
                          STO   3 0                                     K1506170
                          LDX  I3 SAVE                                  K1506180
                    *                                                   K1506190
                    *                  TAG NAME                         K1506200
                          LDX  I1 SAVEB                                 K1506210
                          LD      C16                                   K1506220
                          S       SAVET                                 K1506230
                          STO     SAVEB                                 K1506240
                          SLA     11                                    K1506250
                          OR    1 -1                                    K1506260
                          STO   1 -1                                    K1506270
                    *                                                   K1506280
                    *                  GT GENERATED                     K1506290
                          LDX  L2 GTTAB-1                               K1506300
                          MDX  I2 SAVEB                                 K1506310
                          LD    2 0                                     K1506320
                          BSC  L  OPEN1,+-                              K1506330
                          STO     VINE                                  K1506340
                          MDX     OPEN                                  K1506350
                    *                                                   K1506360
                    *                  GENERATE GT                      K1506370
                    OPEN1 LDX  I3 EOFST                                 K1506380
                          STX   3 VINE                                  K1506390
                          LD   L  SOFST                                 K1506400
                          A    L  C3                                    K1506410
                          S       VINE                                  K1506420
                          SRT     16                                    K1506430
                          D    L  C3                                    K1506440
                          STO     VINE                                  K1506450
                          LD      SAVEB                                 K1506460
                          SLA     11                                    K1506470
                          OR      GTEMP                                 K1506480
                          OR      VINE                                  K1506490
                          STO   2 0                                     K1506500
                          STO     VINE                                  K1506510
                          LD      GTPID                                 K1506520
                          STO   3 0                                     K1506530
                          LD   L  SAVEB                                 K1506540
                          STO   3 1                                     K1506550
                          SLA     16                                    K1506560
                          STO   3 2                                     K1506570
                          MDX  L  EOFST,-3                              K1506580
                          MDX  L  SOFGT,-3                              K1506590
                    *                                                   K1506600
                    *                  CHECK FOR OVERLAP                K1506610
                          LD   L  EOFST                                 K1506620
                          A       TWO                                   K1506630
                          S    L  EOFS                                  K1506640
                          BSC  L  OPEN,-                                K1506650
                    *                                                   K1506660
                    *                  SET UP OVERLAP                   K1506670
                    WAR   MDX  L  ERROR,1                               K1506680
                          LDX  L  OUT                                   K1506690
                    *                                                   K1506700
                    *                  OPEN STRING TWO WORDS            K1506710
                    OPEN  STX   1 ZEMP                                  K1506720
                          LD   L  EOFS                                  K1506730
                          S       ZEMP                                  K1506740
                          STO     COVER+1                               K1506750
                    COVER LDX  L1 0                                     K1506760
                          MDX   1 1                                     K1506770
                          LDX  I2 EOFS                                  K1506780
                          MDX  L  EOFS,2                                K1506790
                          LD    2 0                                     K1506800
                          STO   2 2                                     K1506810
                          MDX   2 -1                                    K1506820
                          MDX   1 -1                                    K1506830
                          MDX     COVER+7                               K1506840
                          LDX  I1 ZEMP                                  K1506850
                    *                                                   K1506860
                    *             RE ADJUST NORM                        K1506870
                          LD   I  IDSAV                                 K1506880
                          A       EIGHT                                 K1506890
                          STO  I  IDSAV                                 K1506900
                    *                                                   K1506910
                    *                  CHECK FOR OVERLAP                K1506920
                          LD   L  EOFST                                 K1506930
                          A       TWO                                   K1506940
                          S    L  EOFS                                  K1506950
                          BSC  L  WAR,+Z                                K1506960
                    *                                                   K1506970
                    *                  INSERT S.G.T. IN STRING          K1506980
                          LD      VINE                                  K1506990
                          STO   1 1                                     K1507000
                          LD      COMMC                                 K1507010
                          STO   1 2                                     K1507020
                    *                                                   K1507030
                    *                  MOVE POINTER BY Y+2              K1507040
                          MDX  L  Y,2                                   K1507050
                          MDX  I1 Y                                     K1507060
                          LDX  L  F                                     K1507070
                    *                                                   K1507080
                    *                  CONSTANTS                        K1507090
                    VINE  DC      0                                     K1507100
                    ZEMP  DC      0                                     K1507110
                    COMMC DC      /0012                                 K1507120
                    TWO   DC      2                                     K1507130
                    EIGHT DC      8                                     K1507140
                    CALOP DC      /002E                                 K1507150
                    EQUAL DC      /000E-/002E                           K1507160
                    *                                                   K1507170
                    *             CALL OPERATOR                         K1507180
                    HEH   LD    1 0                                     K1507190
                          S       CALOP                                 K1507200
                          BSC  L  TOR,Z                                 K1507210
                    *                                                   K1507220
                    *                  TAG SW4                          K1507230
                          MDX  L  SW4,1                                 K1507240
                    *                                                   K1507250
                          LD    1 2         IS IT A SEMI- COLON         K1507260
                          BSC  L  A11,+-    BRANCH IF YES               K1507270
                    *                                                   K1507280
                    *                  TAG SW5                          K1507290
                    JOH   MDX  L  SW5,1                                 K1507300
                          LDX  L  E                                     K1507310
                    *                                                   K1507320
                    *             EQUAL                                 K1507330
                    TOR   S       EQUAL                                 K1507340
                          BSC  L  TOR1,Z                                K1507350
                    *                                                   K1507360
                    *             NORMALIZE SW1                         K1507370
                          STO  L  SW1                                   K1507380
                    *                                                   K1507390
                    *                  NORMALIZE SW3                    K1507400
                          SLA     16                                    K1507410
                          STO  L  SW3                                   K1507420
                          MDX     JOH+2                                 K1507430
                    *                                                   K1507440
                    *                  TEST SW4                         K1507450
                    TOR1  LD   L  SW4                                   K1507460
                          BSC  L  I,+-                                  K1507470
                    *                                                   K1507480
                    *                  LEFT PAREN                       K1507490
                          LD    1 0                                     K1507500
                          S       LPARN                                 K1507510
                          BSC  L  TOR2,Z                                K1507520
                    *                                                   K1507530
                    *                  COUNT=COUNT+1                    K1507540
                          MDX  L  COUNT,1                               K1507550
                          MDX     JOH+2                                 K1507560
                    *                                                   K1507570
                    *                  CONSTANTS                        K1507580
                    LPARN DC      /0010                                 K1507590
                    RPARN DC      /0002-/0010                           K1507600
                    COUNT DC      0                                     K1507610
                    MASKR DC      /2000                                 K1507620
                    SIMP  DC      0                                     K1507630
                    SIMP2 DC      0                                     K1507640
                    FILSW DC      0          FILE SWITCH            2-4 K1507645
                    *                                                   K1507650
                    *                                                   K1507660
                    TOR2  S       RPARN                                 K1507670
                          BSC  L  I,Z                                   K1507680
                    *                                                   K1507690
                    *                  COUNT=COUNT-1                    K1507700
                          MDX  L  COUNT,-1                              K1507710
                    *                                                   K1507720
                    *                  COUNT=0                          K1507730
                    *                                                   K1507740
                          MDX     JOH+2                                 K1507750
                    *                                                   K1507760
                    *             TEST SW3                              K1507770
                          LD   L  SW3                                   K1507780
                          BSC  L  DIE,+-                                K1507790
                    *                                                   K1507800
                    *                  PURG COMMON VARIABLES FROM S.E.  K1507810
                    *                        TABLE                      K1507820
                    A11   STX   1 OUTZ+1                                K1507830
                          LDX  L1 SETBL                                 K1507840
                          LD   L  C15                                   K1507850
                          STO     COUNT                                 K1507860
                    A1Z   LDX   2 6                                     K1507870
                          LD    1 0                                     K1507880
                          BSC  L  A2Z,+-                                K1507890
                          LD    1 1                                     K1507900
                          BSI  L  CHECK                                 K1507910
                          AND     MASKR                                 K1507920
                          BSC  L  A2Z,Z                                 K1507930
                          MDX   1 2                                     K1507940
                          MDX   2 -2                                    K1507950
                          MDX     A1Z+1                                 K1507960
                    A3Z   MDX   1 2                                     K1507970
                          MDX  L  COUNT,-1                              K1507980
                          MDX     A1Z                                   K1507990
                          MDX     OUTZ                                  K1508000
                    A2Z   STX   2 A2Z+2                                 K1508010
                          MDX  L1 0                                     K1508020
                          SLA     16                                    K1508030
                          STO   1 1                                     K1508040
                          MDX     A3Z                                   K1508050
                    OUTZ  LDX  L1 0                                     K1508060
                    *                                                   K1508070
                    *             PURG B.V. TABLE FROM S.E. TABLE       K1508080
                          BSI  L  ANIML                                 K1508090
                    *                                                   K1508100
                    *             NORMALIZE SW4                         K1508110
                    DIE   SLA     16                                    K1508120
                          STO  L  SW4                                   K1508130
                    *                                                   K1508140
                    *                  NORMALIZE SW5                    K1508150
                          STO  L  SW5                                   K1508160
                          BSC  L  E                                     K1508170
                    *                                                   K1508180
                    JAY   LD      FILSW      LOAD FILE SWITCH       2-4 K1508181
                          BSC  L  JAY3,+-    BRANCH IF OFF          2-4 K1508182
                          SLA     16         RESTORE THE            2-4 K1508183
                          STO     FILSW      FILE SWITCH            2-4 K1508184
                          MDX   1 -1         RESET POINTER          2-4 K1508185
                          MDX     A11        GO PURG COMMON VARIABL 2-4 K1508186
                    *                                                   K1508187
                    *                                                   K1508188
                    *             PURG B.V. TABLE FROM S.E. TABLE       K1508190
                    JAY3  BSI  L  ANIML                                 K1508200
                    *                                                   K1508210
                    *                  SPECIAL REFERENCED STATEMENT     K1508220
                          STX   1 HEMP+1                                K1508230
                          LDX  I1 IDSAV                                 K1508240
                          LD    1 0                                     K1508250
                          SRA     1                                     K1508260
                          BSC     E                                     K1508270
                          MDX     JAY2                                  K1508280
                    HEMP  LDX  L1 0                                     K1508290
                    *                                                   K1508300
                    *                  TEST SW6                         K1508310
                          LD   L  SW6                                   K1508320
                          BSC  L  JAY1,Z                                K1508330
                          MDX   1 1                                     K1508340
                          MDX     XYZ                                   K1508350
                    *                  CLOSE STRING BY TOT WORDS        K1508360
                    *                                                   K1508370
                    JAY1  MDX   1 1                                     K1508380
                          STX   3 SIMP1+1                               K1508390
                          STX   1 SIMP                                  K1508400
                          LD      SIMP                                  K1508410
                          A    L  TOT                                   K1508420
                          STO     SIMP2                                 K1508430
                          LDX  I2 SIMP2                                 K1508440
                          LD   L  EOFS                                  K1508450
                          S       SIMP2                                 K1508460
                          STO     SIMP2                                 K1508470
                          LDX  I3 SIMP2                                 K1508480
                          MDX   3 1                                     K1508490
                    LAME  LD    2 0                                     K1508500
                          STO   1 0                                     K1508510
                          MDX   1 1                                     K1508520
                          MDX   2 1                                     K1508530
                          MDX   3 -1                                    K1508540
                          MDX     LAME                                  K1508550
                          MDX   1 -1                                    K1508560
                          STX  L1 EOFS                                  K1508570
                          LDX  I1 SIMP                                  K1508580
                    SIMP1 LDX  L3 0                                     K1508590
                    *                                                   K1508600
                    *             RE ADJUST NORM                        K1508610
                          LD   I  IDSAV                                 K1508620
                          SRT     2                                     K1508630
                          S    L  TOT                                   K1508640
                          SLT     2                                     K1508650
                          STO  I  IDSAV                                 K1508660
                    XYZ   LDX  L  TEST                                  K1508670
                    *                                                   K1508680
                    *                  READ AND GO TO NEXT PHASE        K1508690
                    OUT   LDX  I1 NXTPH+1    LOAD PARAM FOR READING     K1508700
                          LDD     NXTPH+2    NEXT PHASE                 K1508710
                          BSC  L  ROL        GO TO READ NEXT PHASE      K1508720
                          BSS  E  0                                     K1508730
                    NXTPH DC      46         ID OF NEXT PHASE           K1508740
                          BSS     3          LOADER TABLE FOR NEXT PHS  K1508750
                    *                                                   K1508760
                    *                  CONSTANTS                        K1508770
                    ERR63 DC      63                                    K1508780
                    GETZ  DC      0                                     K1508790
                    ERRID DC      /A008                                 K1508800
                    ERRNO DC      0                                     K1508810
                    NRMSV DC      0                                     K1508820
                    ERIID DC      /A00D                                 K1508830
                    *                                                   K1508840
                    *             SET UP ERROR 63                       K1508850
                    PIG   LD      ERR63                                 K1508860
                          STO     ERRNO                                 K1508870
                    *                                                   K1508880
                    *                  REPLACE STATEMENT WITH ERROR     K1508890
                          LDX  I1 IDSAV                                 K1508900
                          LD    1 0                                     K1508910
                          SRA     2                                     K1508920
                          AND  L  IDNRM                                 K1508930
                          STO     NRMSV                                 K1508940
                          A    L  IDSAV                                 K1508950
                          STO     GETZ                                  K1508960
                          LDX  I2 GETZ                                  K1508970
                          LD    1 0                                     K1508980
                          BSC  L  CALD,E                                K1508990
                          MDX     CALD+4                                K1509000
                    CALD  LD      ERIID                                 K1509010
                          STO   1 0                                     K1509020
                          MDX   1 1                                     K1509030
                          MDX     CALD+6                                K1509040
                          LD      ERRID                                 K1509050
                          STO   1 0                                     K1509060
                          LD      ERRNO                                 K1509070
                          STO   1 1                                     K1509080
                          MDX   1 1                                     K1509090
                          LD   L  EOFS                                  K1509100
                          S    L  IDSAV                                 K1509110
                          S       NRMSV                                 K1509120
                          STO     GETZ                                  K1509130
                          LDX  I3 GETZ                                  K1509140
                          STX   1 GETZ                                  K1509150
                          MDX   3 1                                     K1509160
                    LIMB  LD    2 0                                     K1509170
                          STO   1 1                                     K1509180
                          MDX   1 1                                     K1509190
                          MDX   2 1                                     K1509200
                          MDX   3 -1                                    K1509210
                          MDX     LIMB                                  K1509220
                          STX  L1 EOFS                                  K1509230
                          LDX  I1 GETZ                                  K1509240
                          MDX   1 1                                     K1509250
                          BSC  L  TEST                                  K1509260
                    *                                                   K1509270
                    *                  CLEAR SUBSCRIPT EXPRESSION TABLE K1509280
                    JAY2  LDX  L2 SETBL                                 K1509290
                          LDX   3 15                                    K1509300
                          SLA     16                                    K1509310
                    LAAP  STO   2 7                                     K1509320
                          MDX   2 8                                     K1509330
                          MDX   3 -1                                    K1509340
                          MDX     LAAP                                  K1509350
                    *                                                   K1509360
                    *                  INDICATE REFERENCED STATEMENT NO K1509370
                          LD    1 1                                     K1509380
                          BSI     CHECK                                 K1509390
                          OR   L  MASK2                                 K1509400
                          STO   3 0                                     K1509410
                          LD    1 0                                     K1509420
                          AND     MC3                                   K1509430
                          STO   1 0                                     K1509440
                          BSC  L  HEMP                                  K1509450
                    *                                                   K1509460
                    *               SUBROUTINE TO PURG INDICIES FROM    K1509470
                    *               SUBSCRIPT EXPRESSION TABLE          K1509480
                    *                                                   K1509490
                    PURG  DC      0                                     K1509500
                          STO     TEMP                                  K1509510
                          LD   L  C15                                   K1509520
                          STO     CNT                                   K1509530
                          LDX  L2 SETBL                                 K1509540
                          STX   3 SAVE                                  K1509550
                          STX   2 TAP+4                                 K1509560
                    PURR  LD    2 7                                     K1509570
                          BSC  L  PURR+8,Z                              K1509580
                          MDX   2 8                                     K1509590
                          MDX  L  CNT,-1                                K1509600
                          MDX     PURR-1                                K1509610
                          MDX     OUT1                                  K1509620
                          LDX  I3 C3                                    K1509630
                    LOOP4 LD    2 1                                     K1509640
                          S       TEMP                                  K1509650
                          BSC  L  TAP,+-                                K1509660
                          MDX   2 2                                     K1509670
                          MDX   3 -1                                    K1509680
                          MDX     LOOP4                                 K1509690
                          MDX   2 2                                     K1509700
                          STX   2 TAP+4                                 K1509710
                          MDX  L  CNT,-1                                K1509720
                          MDX     PURR                                  K1509730
                          MDX     OUT1                                  K1509740
                    TAP   MDX  L  TAP+4,7                               K1509750
                          SLA     16                                    K1509760
                          STO  L  0                                     K1509770
                          MDX   2 2                                     K1509780
                          MDX   3 -1                                    K1509790
                          MDX     TAP+5                                 K1509800
                          MDX     LOOP4+7                               K1509810
                    OUT1  LDX  I3 SAVE                                  K1509820
                          BSC  I  PURG                                  K1509830
                    SAVE  DC      0                                     K1509840
                    CNT   DC      0                                     K1509850
                    C3    DC      3                                     K1509860
                    MC3   DC      /FFFD                                 K1509870
                    TEMP  DC      0                                     K1509880
                    BVTAB DC      0                                     K1509890
                    BUFF  BSS     7                                     K1509900
                    *                                                   K1509910
                    *        THIS IS A SUBROUTINE TO COMPUTE THE        K1509920
                    *     SYMBOL TABLE ADDRESS AND LOAD ACCUMULATOR     K1509930
                    *             WITH SYMBOL TABLE I.D. WORD           K1509940
                    *                                                   K1509950
                    CHECK DC      0                                     K1509960
                          BSC  L  SIM+3,-                               K1509970
                          AND     MAB                                   K1509980
                          M       MC3                                   K1509990
                          SLT     16                                    K1510000
                          A       C3                                    K1510010
                          A    L  SOFST                                 K1510020
                          STO     SIM+1                                 K1510030
                    SIM   LDX  L3 0                                     K1510040
                          LD    3 0                                     K1510050
                          BSC  I  CHECK                                 K1510060
                    MAB   DC      /07FF                                 K1510070
                    *                                                   K1510080
                    *             THIS SUBROUTINE PURGES THE BOUND      K1510090
                    *             VARIABLE TABLE FROM SUBSCRIPT         K1510100
                    *             EXPRESSION TABLE                      K1510110
                    *                                                   K1510120
                    ANIML DC      0                                     K1510130
                          LD   L  BVTAB                                 K1510140
                          BSC  L  DIE1,+-                               K1510150
                          LD   I  EOFS                                  K1510160
                          BSI  L  PURG                                  K1510170
                          MDX  L  EOFS,-1                               K1510180
                          MDX  L  BVTAB,-1                              K1510190
                          MDX     ANIML+5                               K1510200
                    DIE1  BSC  I  ANIML                                 K1510210
                          BSS     /7F36-1-*  PATCH AREA                 K1510220
                          DC       0                                    K1510230
                          END     BPHAR-2                               K1510240
