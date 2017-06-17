                          HDNG    1130 FORTRAN COMPILER PHASE 20        K2000010
                    *************************************************** K2000020
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * K2000030
                    *                                                 * K2000040
                    *FUNCTION/OPERATION-                              * K2000050
                    *   * INSERTS ERRORS 65, 66, AND/OR 67 ONTO    2-11 K2000060
                    *     INPUT STRING, IF ANY WERE DETECTED IN    2-11 K2000070
                    *     PH19 AND CARRIED FORWARD                 2-11 K2000080
                    *   * SEARCHES INPUT STRING FOR DATA STATEMENTS2-11 K2000090
                    *     IN ERROR                                 2-11 K2000100
                    *   * INSERTS A LINE COUNT VALUE(LEFT JUST-    2-11 K2000110
                    *     IFIED) IN THE ERROR NUMBER OF A STATE-   2-11 K2000120
                    *     MENT IN ERROR - UNTIL A LABLED STATEMENT 2-11 K2000130
                    *     IS ENCOUNTERED                           2-11 K2000140
                    *   * LISTS ANY ERROR THAT WERE DETECTED DURING   * K2000160
                    *     THE COMPILATION PROCESS.                    * K2000170
                    *   * REARRANGING THE STATEMENT STRING IF THERE   * K2000180
                    *     WERE NO ERRORS DETECTED.                    * K2000190
                    *                                                 * K2000200
                    *ENTRY POINTS-                                    * K2000210
                    *   * NEQ  -THIS PHASE IS ENTERED VIA A CALL TO   * K2000220
                    *           THE ROL SUBROUTINE FROM PHASE 19.     * K2000230
                    *                                                 * K2000240
                    *INPUT-                                           * K2000250
                    *   * STATEMENT STRING                            * K2000260
                    *   * SYMBOL TABLE                                * K2000270
                    *   * FCOM                                        * K2000280
                    *                                                 * K2000290
                    *OUTPUT-                                          * K2000300
                    *   * PRINTED ERROR MESSAGES IF ANY               * K2000310
                    *   * STATEMENT STRING                            * K2000320
                    *   * SYMBOL TABLE                                * K2000330
                    *   * FCOM                                        * K2000340
                    *                                                 * K2000350
                    *EXTERNAL REFERENCES-                             * K2000360
                    *   SUBROUTINES                                   * K2000370
                    *      * ROL  - INTERPHASE ROLLER SUBR ENTRY      * K2000380
                    *      * NEWPG- PAGE EJECT SUBR INDIRECT ENTRY    * K2000390
                    *      * PRINT- PRINT CONTROL SUBR ENTRY          * K2000400
                    *      * LSTPR- PRINCIPAL PRINT SUBR ENTRY        * K2000410
                    *   COMMA/DCOM                                    * K2000420
                    *      * PHASE- NO.OF PHASE NOW IN CORE           * K2000430
                    *      * CHN12- CHANNEL 12 INDICATOR              * K2000440
                    *                                                 * K2000450
                    *EXITS-                                           * K2000460
                    *   NORMAL-                                       * K2000470
                    *      EXIT IS MADE VIA A CALL TO THE ROL SUBR    * K2000480
                    *   ERROR-                                        * K2000490
                    *      NONE                                       * K2000500
                    *                                                 * K2000510
                    *TABLES/WORK AREAS                                * K2000520
                    *   * FCOM                                        * K2000530
                    *   * STRING AREA                                 * K2000540
                    *   * SYMBOL TABLE AREA                           * K2000550
                    *   * AREA                                        * K2000560
                    *   * PAREA                                       * K2000570
                    *                                                 * K2000580
                    *ATTRIBUTES-                                      * K2000590
                    *   NONE                                          * K2000600
                    *                                                 * K2000610
                    *NOTES-                                           * K2000620
                    *   ERRORS DETECTED BY THIS PHASE - 81 ALSO    2-11 K2000630
                    *   ERRORS 65, 66, AND 67 WHICH WERE DETECTED  2-11 K2000640
                    *   BY PHASE 19 ARE INSERTED INTO THE STRING   2-11 K2000650
                    *                                                 * K2000660
                    *************************************************** K2000670
                          ABS                                           K2000680
                    *                                                   K2000690
                    *                       SYSTEM EQUATES              K2000700
                    MEMRY EQU     /8000                                 K2000710
                    OVERL EQU     MEMRY-1501 START OF FCOM          2-4 K2000720
                    ROL   EQU     MEMRY-68   LOCN OF RTN TO READ NXT PH K2000730
                    $PHSE EQU     /78        NO. OF PHASE NOW IN CORE   K2000740
                    *                                                   K2000750
                    PHID  EQU     50         ID NUMBER THIS PHASE       K2000760
                    *                       PRINT ROUTINE               K2000770
                    HEAD  EQU     ROL-49     PAGE HEADER AREA           K2000780
                    OVERP EQU     HEAD-327-2 DEVICE PRINT ROUTINE AREA  K2000790
                    NEWPG EQU     OVERP-54   INDIRECT ENTRY PAGE EJECT  K2000800
                    AREA  EQU     NEWPG+1    MESSAGE ADDRESS            K2000810
                    $CH12 EQU     /06        CHANNEL 12 INDICATOR       K2000820
                    *                                                   K2000830
                    PRINT EQU     NEWPG+2    PRINT INTERFACE RTN ENTRY  K2000840
                    LSTPR EQU     OVERP+3    DEVICE PRINT ROUTINE ENTRY K2000850
                          ORG     OVERL                                 K2000860
                    *                                                   K2000870
                    *                  FORTRAN COMMUNICATION AREA       K2000880
                    ORG   BSS     1    ORIGIN ADDRESS               2-4 K2000890
                    SOFS  BSS     1    START OF STRING                  K2000900
                    EOFS  BSS     1    END OF STRING                    K2000910
                    SOFST BSS     1    START OF SYMBOL TABLE            K2000920
                    SOFNS BSS     1    START OF NON-STATEMENT NUMBERS   K2000930
                    SOFXT BSS     1    SIZE OF WORK AREA (VAR AREA)     K2000940
                    SOFGT BSS     1    SIZE OF CONSTANTS AREA           K2000950
                    EOFST BSS     1    END OF SYMBOL TABLE              K2000960
                    COMON BSS     1                                     K2000970
                    CSIZE BSS     1    SIZE OF COMMON                   K2000980
                    ERROR BSS     1    ERROR FLAG                       K2000990
                    *               BIT 15 OVERLAP ERROR                K2001000
                    *               BIT 14 OTHER ERROR                  K2001010
                    *               BIT 11 ORIGIN IN SUBPROGRAM     2-4 K2001020
                    *               BIT  9 INVALID ORIGIN           2-4 K2001030
                    FNAME BSS     1    PROGRAM NAME                     K2001040
                          BSS     1                                     K2001050
                    SORF  BSS     1    SUBROUTINE(-) OR FUNCTION(+)     K2001060
                    CCWD  BSS     1    CONTROL CARD WORD                K2001070
                    *                BIT 15 TRANSFER TRACE              K2001080
                    *                BIT 14 ARITHMETIC TRACE            K2001090
                    *                BIT 13 EXTENDED PRECISION          K2001100
                    *                BIT 12 LIST SYMBOL TABLE           K2001110
                    *                BIT 11 LIST SUBPROGRAM NAMES       K2001120
                    *                BIT 10 LIST SOURCE PROGRAM         K2001130
                    *                BIT  9 ONE WORD INTEGERS           K2001140
                    *                BIT  8 ORIGIN                  2-4 K2001150
                    IOCS  BSS     1    IOCS CONTROL CARD WORD           K2001160
                    *                BIT 15 CARD                        K2001170
                    *                BIT 14 PAPER TAPE                  K2001180
                    *                BIT 13 TYPEWRITER                  K2001190
                    *                BIT 12 1403 PRINTER                K2001200
                    *                BIT 11 2501 READER                 K2001210
                    *                BIT 10 KEYBOARD                    K2001220
                    *                BIT  9 1442 PUNCH                  K2001230
                    *                BIT  8 DISK                        K2001240
                    *                BIT  7 1132 PRINTER                K2001250
                    *                BIT  3 PLOTTER                     K2001260
                    *                BIT  0 NOT AVAILABLE               K2001270
                    DFCNT BSS     1         DEFINE FILE COUNT           K2001280
                    *                                                   K2001290
                    *                                                   K2001300
                    *                  END OF FORTRAN COMMUNICATION     K2001310
                    *                  AREA                             K2001320
                    *************************************************** K2001330
                    *             THE SWITCHES USED IN PHASE 21 FOLLOW  K2001340
                    *             IF POSITIVE, THE SWITCH IS TRANSFER=T K2001350
                    *             IF ZERO, THE SWITCH IS NORMAL=N       K2001360
                    *             SWITCH OUTFL                          K2001370
                    *               N= HEADER NOT PRINTED               K2001380
                    *               T= HEADER ALREADY PRINTED           K2001390
                    *                                                   K2001400
                    BPHAR EQU     *+2                                   K2001410
                          DC      0          LOADER WORK AREA.          K2001420
                          DC      -50        -PHASE ID FOR SLET LOOKUP  K2001430
                          DC      NXTPH-*+1  TABLE FOR NEXT PHASE ENTRY K2001440
                          DC      1          ONE ENTRY TO BE SET BY LDR K2001450
                          ORG     *-2                                   K2001460
                    *                                                   K2001470
                    *             OUTPUT STRING ERROR MESSAGES          K2001480
                    *             PHASE                                 K2001490
                    *                                                   K2001500
                    **************************************************  K2001510
                    NEQ   BSC  L  ENT      ENTRY, GO INITIALIZE         K2001520
                    *                                                   K2001530
                    *                                                   K2001540
                    WDCNT DC      *-*      WORD COUNT FOR PRINT LINE    K2001550
                    PAREA DC      0        PRINT AREA START             K2001560
                    *                                                   K2001570
                    ENT   NOP                                      2-11 K2001580
                          LDX   1 PHID     GET ID THIS PHASE       2-11 K2001590
                          STX  L1 $PHSE    STORE INTO COMMA             K2001600
                    *                                                   K2001610
                    *             INITIALIZE TRANSFERVECTOR             K2001620
                          LDX  L3 ZERO     LOAD WORK AREA POINTER       K2001630
                          STX  L3 NEQ      SAVE FOR RE-INITIALIZATION   K2001640
                    *                                                   K2001650
                    *             CHECK FOR OVERLAP ERROR               K2001660
                          LD   L  ERROR                                 K2001670
                          BSC  L  E2020,E   BR IF OVERLAP ERROR         K2001680
                          BSC  L  E2015,Z    BRANCH IF ORG ERRORS   2-4 K2001690
                    *                                                   K2001700
                    *             MAKE SIZE OF WORK AREA EVEN ADDRESS   K2001710
                          LD   L  SOFXT    LOAD WORK AREA START ADDR    K2001720
                          BSC     E        SKIP IF EVEN                 K2001730
                          A     3 ONE-Z    ADJUST TO AN EVEN ADDRESS    K2001740
                          STO  L  SOFXT    STORE IN WORK AREA POINTER   K2001750
                    *                                                   K2001760
                    *             SET HEADER TEST FOR                   K2001770
                    *             UNREFERENCED STATEMENT                K2001780
                    *                                                   K2001790
                          LDX  L2 TEXT5    INITIALIZE TO PRINT PROPER   K2001800
                          STX  L2 HTES1+1  *HEADER                      K2001810
                          LD    3 ZERO-Z                                K2001820
                          STO   3 OUTFL-Z  ZERO TO HEADER OUTP FLAG     K2001830
                    *************************************************** K2001840
                    *                                                   K2001850
                    *     PROCESS INPUT STRING FOR DATA            2-11 K2001860
                    *     STATEMENTS IN ERROR AND REMOVE           2-11 K2001870
                    *                                                   K2001880
                    *************************************************** K2001890
                          SPAC    1                                2-11 K2001900
                          LD   L  SOFS      INITIALIZE POINTER     2-11 K2001910
                          STO     IDADR     SAVE AT ID ADRS        2-11 K2001920
                    *                                                   K2001930
                    DTA10 NOP                                      2-11 K2001940
                          LDX  I1 IDADR     START OF STRING        2-11 K2001950
                          LD    1 0        LOAD STMNT ID WORD      2-11 K2001960
                          AND   3 IDMSK-Z  MASK TO SAVE STMNT ID   2-11 K2001970
                          STO   3 STSID-Z  SAVE ID                 2-11 K2001980
                          LD    1 0        LOAD STMNT ID WORD      2-11 K2001990
                          AND   3 NRMSK-Z  EXTRACT NORM            2-11 K2002000
                          SRA     2         RE-ALIGN NORM          2-11 K2002010
                          STO   3 NORM-Z   SAVE NORM               2-11 K2002020
                    *                                                   K2002030
                    *     TEST IF DATA OR END STATEMENT            2-11 K2002040
                    *                                                   K2002050
                          LD    3 STSID-Z  LOAD STMNT ID           2-11 K2002060
                          S     3 HF800-Z  TEST IF DATA STMNT           K2002070
                          BSC  L  DTA11,+-  BRCH IF DATA ID        2-11 K2002080
                          SPAC    1                                     K2002090
                          LD    3 STSID-Z   CHECK FOR              2-11 K2002100
                          S     3 ENDID-Z   AND BRCH IF            2-11 K2002110
                          BSC  L  REPAK,+-  END STMNT              2-11 K2002120
                          MDX     DTA21     CONTINUE SCAN          2-11 K2002130
                    *                                                   K2002140
                    *             CHECK THAT DATASTATEMENT DOES NOT     K2002150
                    *             CONTAIN COMMON VARIABLES              K2002160
                    *                                                   K2002170
                    DTA11 LD    3 NORM-Z   STORE NORM              2-11 K2002180
                          STO     STONO                                 K2002190
                    *                                                   K2002200
                    *             MOVE POINTER TO NEXT DATAGROUP IF ANY K2002210
                    *                                                   K2002220
                    DTA12 MDX   1 1        MOVE POINTER                 K2002230
                          MDX  L  STONO,-1  DECREMENT WORD COUNT   2-11 K2002240
                    DTA13 LD    1 0         INSERT CONSTANT LENGTH      K2002250
                          AND     H0007    *                            K2002260
                          STO     CONSC    *                            K2002270
                    *                                                   K2002280
                    *             MOVE POINTER PAST THE CONSTANT        K2002290
                    *                                                   K2002300
                    DTA14 MDX   1 1        INCR STRING POINTER          K2002310
                          MDX  L  STONO,-1  DECREMENT WORD COUNT   2-11 K2002320
                          MDX  L  CONSC,-1 SKIP WHEN CON MV COMPLETE    K2002330
                          MDX     DTA14                                 K2002340
                    *                                                   K2002350
                    *             MOVE POINTER TO NEXT NAME             K2002360
                    *                                                   K2002370
                    DTA15 MDX   1 1        INCR STRING POINTER          K2002380
                          MDX  L  STONO,-1  DECREMENT WORD COUNT   2-11 K2002390
                    *                                                   K2002400
                    *             TEST IF NAME IN COMMON                K2002410
                    *                                                   K2002420
                          LD    1 0        GET NAME FROM SYM TBL        K2002430
                          BSI   3 GNAME-Z  *                            K2002440
                          LD    3 GNAM4-Z  GET SYM TBL ID WORD          K2002450
                          SLA     2                                     K2002460
                          BSC  L  DTAER,Z+ BR IF IN COMMON              K2002470
                    *                                                   K2002480
                    *             MOVE POINTER TO NEXT NAME IF ANY      K2002490
                    *                                                   K2002500
                          LD    1 0        LOAD NAME POINTER            K2002510
                          SLA     1                                     K2002520
                          BSC  L  DTA17,-  BR IF NO DISPLACEMENT AFTER  K2002530
                          MDX   1 1        INCR STRING POINTER          K2002540
                          MDX  L  STONO,-1  DECREMENT WORD COUNT   2-11 K2002550
                    *                                                   K2002560
                    DTA17 LD      STONO                                 K2002570
                          SRA     1                                 212 K2002580
                          BSC  L  DTA21,+-  BRANCH END OF STATEMENT     K2002590
                          LD    1 1                                     K2002600
                          BSC  L  DTA12,-   BRANCH END OF VARIABLES     K2002610
                          MDX     DTA15    GO MOVE TO NEXT NAME         K2002620
                    *                                                   K2002630
                    DTA21 LD      IDADR     LOAD STMNT ADRS        2-11 K2002640
                          A     3 NORM-Z    ADD NORM               2-11 K2002650
                          STO     IDADR     STORE AS NEXT ADRS     2-11 K2002660
                          MDX     DTA10     CONTINUE SCAN          2-11 K2002670
                    *                                                   K2002680
                    STONO DC      0        STORED NORM                  K2002690
                    CONSC DC      0        CONSTANT LENGTH              K2002700
                    ERTYP DC      81       ERROR TYPE CODE              K2002710
                    ERID  DC      /A008    ERROR ID                     K2002720
                    H0007 DC      /0007    CONSTANT                     K2002730
                    *                                                   K2002740
                    *     REPLACE ERROR DATA STMNT ID WITH         2-11 K2002750
                    *     ERROR STMNT ID AND CLOSE STRING          2-11 K2002760
                    *                                                   K2002770
                    DTAER LDX  I1 IDADR     STMNT ADRS             2-11 K2002780
                          LD      ERID      ERROR STMNT ID         2-11 K2002790
                          STO   1 0         OVERLAY DATA ID        2-11 K2002800
                          LD      ERTYP     LOAD AND STORE         2-11 K2002810
                          STO   1 1         ERROR NUMBR            2-11 K2002820
                    *                                              2-11 K2002830
                          MDX  L  IDADR,+2  ADJ ADRS FOR ERROR     2-11 K2002840
                          MDX  L  NORM,-2   ADJ NORM FOR ERROR     2-11 K2002850
                          SPAC    1                                2-11 K2002860
                          LDX  I1 IDADR     SET XR1 TO STMNT ADRS  2-11 K2002870
                          LD      IDADR     LOAD STMNT ADRS        2-11 K2002880
                          A     3 NORM-Z    ADD STMNT NORM         2-11 K2002890
                          STO     *+1       AND SET XR2            2-11 K2002900
                          LDX  L2 *-*       TO NEXT STMNT ADRS     2-11 K2002910
                          SPAC    1                                2-11 K2002920
                          LD   L  EOFS      LOAD END OF STRING ADRS2-11 K2002930
                          S    L  /0002     SUB VALUE IN XR2       2-11 K2002940
                          STO     *+1       AND STORE AS           2-11 K2002950
                          LDX  L3 *-*       RANGE IN XR3           2-11 K2002960
                          MDX   3 +1        ADJ XR3 BY ONE         2-11 K2002970
                          SPAC    1                                2-11 K2002980
                    DTA25 LD    2 0         NEXT WORD TO MOVE      2-11 K2002990
                          STO   1 0         TO NEW ADRS            2-11 K2003000
                          MDX   1 1         INCREMENT TO NEXT WORD 2-11 K2003010
                          MDX   2 1         INCREMENT NEW ADRS     2-11 K2003020
                          MDX   3 -1        DECREMENT RANGE        2-11 K2003030
                          MDX     DTA25     LOOP UNTILL RANGE ZERO 2-11 K2003040
                          SPAC    1                                2-11 K2003050
                          STX  L1 EOFS      NEW END OF STRING      2-11 K2003060
                          LDX  L3 ZERO      WORK AREA POINTER      2-11 K2003070
                          MDX     DTA10     CONTINUE SCAN          2-11 K2003080
                    *************************************************** K2003090
                    *                                                   K2003100
                    *     THIS ROUTINE SCANS THE INPUT STRING      2-11 K2003110
                    *     REMOVING EQUIV STMNTS, DUMMY ERROR       2-11 K2003120
                    *     STMNTS, AND INSERT LINE COUNT IN         2-11 K2003130
                    *     VALID ERROR STMNTS                       2-11 K2003140
                    *                                                   K2003150
                    *************************************************** K2003160
                    *                                              2-11 K2003170
                    ***   CONSTANT'S AREA                          2-11 K2003180
                    *                                              2-11 K2003190
                    LNCNT DC      0         LINE COUNT VALUE       2-11 K2003200
                    RANGE DC      0         RANGE OF REPACK        2-11 K2003210
                    IDADR DC      *-*       STMNT ID ADRS          2-11 K2003220
                    K0FFF DC      /0FFF     EQUIV ERROR MASK       2-11 K2003230
                    KA008 DC      /A008     ERROR STMNT ID         2-11 K2003240
                    K0800 DC      /0800     CONSTANT               2-11 K2003250
                    K7000 DC      /7000     CONSTANT               2-11 K2003260
                    KB000 DC      /B000     CONSTANT               2-11 K2003270
                    WDCT1 DC      *-*       SAVE AREA FOR WORD COUNT212 K2003275
                          SPAC    1                                2-11 K2003280
                    REPAK EQU     *                                2-11 K2003290
                          LD   L  SOFS      LOAD START OF STRING   2-11 K2003300
                          STO     IDADR     SAVE STMNT ID ADRS     2-11 K2003310
                          SPAC    1                                2-11 K2003320
                    CONT  NOP                                      2-11 K2003330
                          LDX  I1 IDADR     SET XR1 TO IDADR       2-11 K2003340
                          LD    1 0        LOAD STMNT ID WORD      2-11 K2003350
                          BSC  L  A1011,E   BRCH IF STMNT NUMBERED 2-11 K2003360
                          AND   3 NRMSK-Z  EXTRACT NORM            2-11 K2003370
                          SRA     2        RE-ALIGN NORM           2-11 K2003380
                          STO   3 NORM-Z   SAVE NORM               2-11 K2003390
                          SPAC    1                                     K2003400
                          LD    1 0        LOAD STMNT ID WORD      2-11 K2003410
                          AND   3 IDMSK-Z  MASK TO SAVE STMNT ID   2-11 K2003420
                          MDX     RPK02     GO CHECK STMNT ID      2-11 K2003430
                          SPAC    1                                2-11 K2003440
                    RPK01 LD      IDADR     ADD STMNT ADRS         2-11 K2003450
                          A     3 NORM-Z    AND NORM-STORE AS      2-11 K2003460
                          STO     IDADR     ADRS FOR NEXT STMNT    2-11 K2003470
                          MDX     CONT      CONTINUE SCAN          2-11 K2003480
                          SPAC    1                                2-11 K2003490
                    RPK02 EOR   3 HD800-Z                          2-11 K2003500
                          BSC  L  RPK01,+-  BRCH IF IOCS           2-11 K2003510
                    *                                                   K2003520
                          MDX  L  LNCNT,+1  INCREMENT LINE COUNT   2-11 K2003530
                    *                                                   K2003540
                          EOR     K7000                            2-11 K2003550
                          BSC  L  RPK10,+-  BRCH IF EQUIV          2-11 K2003560
                    *                                                   K2003570
                          EOR     K0800                            2-11 K2003580
                          BSC  L  RPK05,+-  BRCH IF ERROR          2-11 K2003590
                    *                                                   K2003600
                          EOR     KB000                            2-11 K2003610
                          BSC  L  A1011,+-  BRCH IF END            2-11 K2003620
                    *                                                   K2003630
                          MDX     RPK01     CONTINUE SCAN          2-11 K2003640
                          SPAC    1                                2-11 K2003650
                    *                                              2-11 K2003660
                    ***   CHECK TYPE OF ERROR STMNT                2-11 K2003670
                    *                                              2-11 K2003680
                          SPAC    1                                2-11 K2003690
                    RPK05 LD    1 1         CHECK ERROR STMNT      2-11 K2003700
                          SLA     9         FOR ERROR NUMBR        2-11 K2003710
                          BSC  L  RPK06,Z   BRCH IF NUMBR          2-11 K2003720
                          LD    1 1         LOAD AND SAVE          2-11 K2003730
                          SRA     7         LINE COUNT             2-11 K2003740
                          STO     LNCNT     BRANCH TO REMOVE       2-11 K2003750
                          MDX     RPK15     FROM STRING            2-11 K2003760
                          SPAC    1                                2-11 K2003770
                    RPK06 LD    1 1         LOAD ERROR NUMBER      2-11 K2003780
                          SRA     7         CHECK FOR LNCNT        2-11 K2003790
                          BSC  L  RPK01,Z   BRCH IF PRESENT        2-11 K2003800
                          LD      LNCNT     IF NOT-LOAD AND        2-11 K2003810
                          SLA     7         POSITION LNCNT FIELD   2-11 K2003820
                          OR    1 1         'OR' ERROR NUMBR       2-11 K2003830
                          STO   1 1         STORE BACK ON STRING   2-11 K2003840
                          MDX     RPK01     CONTINUE SCAN          2-11 K2003850
                          SPAC    1                                2-11 K2003860
                    *     EQUIVALENCE STMNT ENCOUNTERED            2-11 K2003870
                    *     TEST FOR ERROR MARK                      2-11 K2003880
                    RPK10 LD    1 0         LOAD STATEMENT ID       212 K2003882
                          AND   3 NRMSK-Z   GET NORM                212 K2003884
                          SRA     2         ALIGN STMT WORK COUNT   212 K2003886
                          S     3 ONE-Z     SAVE STMT               212 K2003888
                          STO     WDCT1     *WORD COUNT-1           212 K2003890
                    RPK12 MDX   1 1         POINT TO NEXT WORD      212 K2003892
                          LD    1 0         LOAD NEXT WORD          212 K2003894
                          EOR     K0FFF     CHECK FOR ERROR INDR    212 K2003896
                          BZ      RPK13     BRANCH IF ERROR         212 K2003898
                          MDX  L  WDCT1,-1  DECREMENT WORD COUNT    212 K2003900
                          MDX     RPK12     CONTINUE CHECKING       212 K2003902
                          MDX     RPK15     FINISHED, NO ERRORS     212 K2003904
                    RPK13 LD    1 1         LOAD ERROR              212 K2003905
                          LDX  I1 IDADR     POINT TO FIRST WD IN STM212 K2003910
                          STO   1 2         STORE ERROR NO IN WD 3TM212 K2003920
                          SPAC    1                                2-11 K2003930
                          MDX  L  IDADR,+2  ADVANCE ADRS POINTER   2-11 K2003940
                          MDX  L  NORM,-2   DECREASE NORM          2-11 K2003950
                          SPAC    1                                2-11 K2003960
                          LD      KA008     LOAD ERROR ID          2-11 K2003970
                          STO   1 0         AND STORE ON STRING    2-11 K2003980
                          LD      LNCNT     LOAD AND POSITION      2-11 K2003990
                          SLA     7         LINE COUNT FIELD       2-11 K2004000
                          OR    1 2         'OR' ERROR NUMBR       2-11 K2004010
                          STO   1 1         STORE BACK ON STRING   2-11 K2004020
                          SPAC    1                                2-11 K2004030
                    *                                              2-11 K2004040
                    *     THIS ROUTINE REMOVES DUMMY ERROR         2-11 K2004050
                    ***   STMNTS AND EQUIV STMNTS FROM THE INPUT   2-11 K2004060
                    *     STRING AND CLOSES UP THE STRING          2-11 K2004070
                    *                                              2-11 K2004080
                          SPAC    1                                2-11 K2004090
                    RPK15 LDX  I1 IDADR     SET XR1 TO STMNT ADRS  2-11 K2004100
                          LD      IDADR     LOAD STMNT ADRS        2-11 K2004110
                          A     3 NORM-Z    ADD STMNT NORM         2-11 K2004120
                          STO     *+1       AND SET XR2            2-11 K2004130
                          LDX  L2 *-*       TO NEXT STMNT ADRS     2-11 K2004140
                          SPAC    1                                2-11 K2004150
                          LD   L  EOFS      LOAD END OF STRING ADRS2-11 K2004160
                          S    L  /0002     SUB VALUE IN XR2       2-11 K2004170
                          STO     RANGE     AND STORE AS RANGE     2-11 K2004180
                          MDX  L  RANGE,+1  ADJ RANGE BY ONE       2-11 K2004190
                          SPAC    1                                2-11 K2004200
                    RPK20 LD    2 0         NEXT WORD TO MOVE      2-11 K2004210
                          STO   1 0         TO NEW ADRS            2-11 K2004220
                          MDX   1 1         INCREMENT TO NEXT WORD 2-11 K2004230
                          MDX   2 1         INCREMENT NEW ADRS     2-11 K2004240
                          MDX  L  RANGE,-1  DECREMENT RANGE        2-11 K2004250
                          MDX     RPK20     LOOP UNTILL RANGE ZERO 2-11 K2004260
                          SPAC    1                                2-11 K2004270
                          STX  L1 EOFS      NEW END OF STRING      2-11 K2004280
                          MDX     CONT      CONTINUE SCAN          2-11 K2004290
                          SPAC    1                                2-11 K2004300
                    *                                                   K2004310
                    *             SEARCH FOR UNREFERENCED STATEMENTS    K2004320
                    *             INITIALIZE SYMBOL TABLE POINTER       K2004330
                    *                                                   K2004340
                    A1011 NOP                                      2-11 K2004350
                          BSI  L  BLKPA     BLANK PRINT AREA       2-11 K2004360
                          LD   L  SOFST    INITLZ SYMBOL TABLE PT       K2004370
                          STO   3 STPTR-Z                               K2004380
                          LDX  I1 SOFST      INITIALIZE XR1         2-4 K2004390
                          S    L  EOFST    TEST FOR SYMBOL TBL ENTRIES  K2004400
                          BSC  L  E1011,+  BRANCH IF NONE               K2004410
                    *                                                   K2004420
                    A1012 LD    1 0        LOAD SYM TBL ID WORD         K2004430
                          AND   3 H0200-Z  TEST IF STMNT NO             K2004440
                          BSC     +-       SKIP IF STATEMENT NUMBER     K2004450
                          MDX     A1013    BR IF NOT                    K2004460
                          LD    1 0                                     K2004470
                          AND   3 H0020-Z  TEST IF REFERENCED           K2004480
                          BSC  L  A1013,Z   BR IF REFERENCED            K2004490
                          LD    1 1        LOAD NAME WORD 1             K2004500
                    *                                                   K2004510
                    *             TEST HEADER AND PRINT                 K2004520
                          BSI  L  MNAME,Z  BR IF NOT GENERATED LABEL    K2004530
                    *                                                   K2004540
                    A1013 BSI  L  INCSP    INCR SYM TBL POINTER         K2004550
                          DC      A1012    BR IF NOT END OF SYM TBL     K2004560
                          BSI   3 HFILL-Z  PRINT IF BUFFER HALF FILLED  K2004570
                    *                                                   K2004580
                    *             SET HEADER TEST FOR                   K2004590
                    *             UNDEFINED VARIABLES                   K2004600
                    *                                                   K2004610
                    A1021 LDX  L2 TEXT6    INITIALIZE TO PRINT PROPER   K2004620
                          STX  L2 HTES1+1  *HEADER.                     K2004630
                          LD    3 ZERO-Z                                K2004640
                          STO   3 OUTFL-Z  SET HEADER INDICATOR         K2004650
                    *                                                   K2004660
                          LDX  I1 SOFST    INITLZ SYMBOL TABLE PT       K2004670
                          STX  L1 STPTR                                 K2004680
                    *                                                   K2004690
                    *             SEARCH FOR UNDEFINED VARIABLES        K2004700
                    *                                                   K2004710
                    A1022 LD    1 0        LD SYM TBL ID WORD           K2004720
                          AND   3 HA7FC-Z  MASK TO LEAVE DEFINE BITS    K2004730
                    *                                                   K2004740
                    *             SKIP IF UNDEFINED VARIABLE            K2004750
                    *                                                   K2004760
                          BSC     Z        SKIP IF UNDEFINED            K2004770
                    *                                                   K2004780
                          MDX     A1023    BR IF NOT                    K2004790
                    *                                                   K2004800
                    *             IF NOT, TEST FOR HEADER               K2004810
                    *             MOVE NAME TO PRINT AREA               K2004820
                    *                                                   K2004830
                          BSI   3 MNAME-Z  MOVE NAME TO PRINT AREA      K2004840
                    *                                                   K2004850
                    *             INSERT ERRORSWITCH TO PREVENT         K2004860
                    *             FINAL OUTPUT                          K2004870
                    *                                                   K2004880
                          BSI   3 ERRSW-Z  SET ERROR SWITCH             K2004890
                    *                                                   K2004900
                    A1023 BSI  L  INCSP    INCR SYM TBL POINTER         K2004910
                          DC      A1022    BR IF NOT END OF SYM TBL     K2004920
                          BSI   3 HFILL-Z  PRINT IF BUFFER HALF FILLED  K2004930
                    *                                                   K2004940
                    *             SEARCH FOR ERROR-STATEMENTS ON STRING K2004950
                    *                                                   K2004960
                    E1011 EQU     *                                2-11 K2004970
                    *                                                   K2004980
                    *             SET HEADER FOR                        K2004990
                    *             .INVALID STATEMENTS.                  K2005000
                    *                                                   K2005010
                          LDX  L2 TEXT7    INITIALIZE TO PRINT PROPER   K2005020
                          STX  L2 HTES1+1  *HEADER.                     K2005030
                    *                                                   K2005040
                    *             INITIALIZATION FOR SCAN OF STRING     K2005050
                    *                                                   K2005060
                          LD   L  SOFS      LOAD AND STORE         2-11 K2005070
                          STO  L  IDADR     STARTING ADRS          2-11 K2005080
                          LDX  I1 IDADR     SET INPUT POINTER      2-11 K2005090
                    *                                                   K2005100
                          LD    3 ZERO-Z   ZERO OUT                     K2005110
                          STO   3 STLAB-Z  *STORED LABEL,               K2005120
                          STO   3 STCNT-Z  *STORED COUNT,               K2005130
                          STO   3 OUTFL-Z  *AND HEADER FLAG             K2005140
                    *                                                   K2005150
                    *             PROCESS ONE STATEMENT IN SEARCH FOR   K2005160
                    *             ERROR STATEMENTS                      K2005170
                    *                                                   K2005180
                    E1021 NOP                                      2-11 K2005190
                          LD    1 0        LOAD STMNT ID WORD      2-11 K2005200
                          AND   3 IDMSK-Z  MASK TO SAVE STMNT ID   2-11 K2005210
                          STO   3 STSID-Z  SAVE ID                 2-11 K2005220
                          LD    1 0        LOAD STMNT ID WORD      2-11 K2005230
                          AND   3 NRMSK-Z  EXTRACT NORM            2-11 K2005240
                          SRA     2        RE-ALIGN NORM           2-11 K2005250
                          STO   3 NORM-Z   SAVE NORM               2-11 K2005260
                          SPAC    1                                     K2005270
                          LD    3 ZERO-Z    SET OFF STMNT          2-11 K2005280
                          STO   3 LBLSW-Z   LABLE SW               2-11 K2005290
                          SPAC    1                                     K2005300
                          LD    1 0                                     K2005310
                          BSC     E        SKIP IF STMT HAS NO LABEL    K2005320
                          MDX     E1022    BR IF IT HAS LABEL           K2005330
                          MDX     E1024    BR IF NO LABEL               K2005340
                    *                                                   K2005350
                    *             IGNORE STATEMENT NUMBER               K2005360
                    *             IF IT IS GENERATED BY THE             K2005370
                    *             COMPILER (HAS NAME = 0)               K2005380
                    *                                                   K2005390
                    E1022 LD    1 1        GET NAME FR SYMBOL TABLE     K2005400
                          BSI   3 GNAME-Z  *                            K2005410
                          LD    3 NAME-Z   *                            K2005420
                          BSC  L  E1023,+- BR IF NAME = 0               K2005430
                    *                                                   K2005440
                    *             STORE STATEMENT NUMBER                K2005450
                    *             AND INITIALIZE  REFERENCE COUNT TO    K2005460
                    *             THAT STATEMENT                        K2005470
                    *                                                   K2005480
                          LD    1 1        SAVE STMNT NUMBER            K2005490
                          STO   3 STLAB-Z                               K2005500
                          LD    3 ZERO-Z   ZERO TO STORED COUNT         K2005510
                          STO   3 STCNT-Z                               K2005520
                          STX  L  LBLSW     SET LABLE SW ON        2-11 K2005530
                          SPAC    1                                     K2005540
                    E1023 MDX   1 1        INCREMENT STRING POINTERS    K2005550
                          SPAC    1                                2-11 K2005560
                    E1024 LD    3 STSID-Z   LOAD STMNT ID          2-11 K2005570
                          S     3 ENDID-Z   CHK FOR END            2-11 K2005580
                          BSC  L  E2011,+-  BRCH IF END            2-11 K2005590
                          SPAC    1                                     K2005600
                          LD    3 STSID-Z   LOAD STMNT ID          2-11 K2005610
                          S     3 HD800-Z   CHK FOR IOCS CALL      2-11 K2005620
                          BSC  L  E1038,+-  BRCH IF IOCS CALL      2-11 K2005630
                          SPAC    1                                     K2005640
                          LD    3 STSID-Z   LOAD STMNT ID          2-11 K2005650
                          S     3 HC000-Z   CHK FOR DO TEST        2-11 K2005660
                          BSC  L  E1038,+-  BRCH IF DO TEST        2-11 K2005670
                          SPAC    1                                     K2005680
                          LD    3 LBLSW-Z   LOAD LABLE SW          2-11 K2005690
                          BSC  L  E1028,Z   BRCH IF SET            2-11 K2005700
                          SPAC    1                                     K2005710
                          MDX  L  STCNT,+1  INCREMENT STMNT COUNT  2-11 K2005720
                          SPAC    1                                     K2005730
                    E1028 LD    3 STSID-Z   LOAD STMNT ID          2-11 K2005740
                          S     3 ERRID-Z   CHK FOR ERROR          2-11 K2005750
                          BSC  L  E1038,Z   BRCH IF NOT ERROR      2-11 K2005760
                          SPAC    1                                2-11 K2005770
                    E1030 SLT     32        CLEAR ACCM/EXT         2-11 K2005780
                          LD    1 1         LOAD ERROR CODE        2-11 K2005790
                          RTE     7         SAVE ERRNO IN EXT      2-11 K2005800
                          BSC  L  E1031,+-  BRCH IF NO LNCNT       2-11 K2005810
                          STO   3 STCNT-Z   STORE LNCNT            2-11 K2005820
                          SLA     16        CLEAR ACCM             2-11 K2005830
                          SPAC    1                                     K2005840
                    E1031 SLT     7         RESTORE ERRNO          2-11 K2005850
                          STO   3 ERRNO-Z   AND SAVE               2-11 K2005860
                          MDX     E1051     GO PRINT ERROR         2-11 K2005870
                          SPAC    1                                2-11 K2005880
                    E1038 LD   L  IDADR     LOAD STMNT ADRS        2-11 K2005890
                          A     3 NORM-Z    ADD NORM               2-11 K2005900
                          STO  L  IDADR     SET XR1 TO             2-11 K2005910
                          LDX  I1 IDADR     NEXT STMNT ADRS        2-11 K2005920
                          BSC  L  E1021     CONTINUE SCAN          2-11 K2005930
                          SPAC    1                                2-11 K2005940
                    *                                                   K2005950
                    *             SET ERRORSWITCH TO PREVENT            K2005960
                    *             FINAL OUTPUT                          K2005970
                    *                                                   K2005980
                    E1051 LD    3 TWO-Z                                 K2005990
                          BSI   3 ERRSW-Z  SET ERROR SWITCH ON          K2006000
                    *                                                   K2006010
                    *             TEST IF HEADER IS PRINTED             K2006020
                    *                                                   K2006030
                          BSI   3 HTEST-Z  PRINT HEADER IF FIRST TIME   K2006040
                    *                                                   K2006050
                    *             MOVE ERROR MESSAGE TO PRINT AREA      K2006060
                    *                                                   K2006070
                          BSI   3 TOPAB-Z  OUTPUT BLANK                 K2006080
                          LD    3 C-Z                                   K2006090
                          BSI   3 TOPAU-Z  OUTPUT C                     K2006100
                    *                                                   K2006110
                    *             ERROR TYPE TO PRINT AREA              K2006120
                    *                                                   K2006130
                          LD    3 ERRNO-Z   LOAD ERROR NUMBR       2-11 K2006140
                          BSI   3 CON3D-Z  GO OUTPUT AS 3 DECML DIGITS  K2006150
                          MDX  L  PAP,-3   BACK UP PRINT AREA POINTER   K2006160
                          BSI   3 TOPAB-Z  BLANK OUT LEADING ZERO       K2006170
                    E1052 LD    3 STLAB-Z  LOAD STORED LABEL            K2006180
                          BSC     Z        SKIP IF STORED LABEL IS ZERO K2006190
                          MDX     E1061    BR IF NOT                    K2006200
                    *                                                   K2006210
                    *             EBC ZEROS TO                          K2006220
                    *                     LABEL SPACE IN PRINT AREA     K2006230
                    *                                                   K2006240
                          LDD   3 FZERO-Z   FIVE ZEROS                  K2006250
                          STD   3 NAME-Z   ZERO OUT NAME                K2006260
                          MDX     E1061+1  GO OUTPUT BLANK NAME         K2006270
                    *                                                   K2006280
                    *             LAST ENCOUNTERED STATEMENT NUMBER     K2006290
                    *             TO PRINT AREA                         K2006300
                    *                                                   K2006310
                    E1061 BSI   3 GNAME-Z  PUT LAST STMNT NO. IN NAME   K2006320
                          STX   1 STXR1+1  SAVE I/P STRING POINTER      K2006330
                          LDX  L1 NAME-1   SET POINTER TO NAME-1        K2006340
                          LD    3 PAR31-Z                               K2006350
                          STO   3 PAP-Z    SET PRNT AREA PT TO 31 POS   K2006360
                          BSI   3 MNAME-Z  LAST STMNT NO. TO PRNT AREA  K2006370
                    STXR1 LDX  L1 *-*      RESTORE I/P STRING POINTER   K2006380
                          LD    3 STCNT-Z  LOAD REFERENCE COUNT         K2006390
                          BSC  L  E1073,+- BR IF REFERENCE COUNT ZERO   K2006400
                    *                                                   K2006410
                    *             STATEMENT NUMBER REFERENCE COUNT      K2006420
                    *             TO PRINT AREA                         K2006430
                    *                                                   K2006440
                          MDX  L  PAP,-2   DECR PRINT AREA PT BY 2      K2006450
                          LD    3 PLUS-Z                                K2006460
                          BSI   3 TOPAU-Z  OUTPUT &                     K2006470
                          LD    3 STCNT-Z                               K2006480
                          BSI  L  CON3D    OUTPUT REFERENCE COUNT       K2006490
                    E1073 LDX   2 0                                     K2006500
                          LDX   3 -13      SET TO OUTPUT 26 CHARS       K2006510
                    LOOPP LD   L3 TEXT8+13 'ERROR AT STATEMENT NUMBER'  K2006520
                          SRT     8                                     K2006530
                          SLA     8                                     K2006540
                          STO  L2 PAREA+5  OUTPUT LEFT CHARACTER        K2006550
                          SLT     16                                    K2006560
                          STO  L2 PAREA+6  OUTPUT RIGHT CHARACTER       K2006570
                          MDX   2 2                                     K2006580
                          MDX   3 1        SKIP WHEN MSG COMPLETE       K2006590
                          MDX     LOOPP    LOOP UNTIL ALL OUTPUT        K2006600
                          LDX  L3 Z                                     K2006610
                          BSI   3 HFILL-Z  PRINT ERROR MESSAGE          K2006620
                          SPAC    1                                     K2006630
                    E1082 BSC  L  E1038     PROCESS NEXT STMNT     2-11 K2006640
                          SPAC    1                                     K2006650
                    E2011 NOP                                      2-11 K2006660
                    *                                                   K2006670
                    *             TEST IF OVERLAP ERROR                 K2006680
                    *                                                   K2006690
                          LD   L  ERROR    LOAD ERROR SW FROM FCOM      K2006700
                          BSC  L  E2020,E  BR IF OVERLAP ERROR          K2006710
                          MDX     E2021    BR IF NOT                    K2006720
                          SPAC    1                                     K2006730
                    E2015 SLA     11         IS IT ERROR 85         2-4 K2006740
                          BSC  L  EXIT,-     NO - EXIT              2-4 K2006750
                          BSI  L  BLKPA      YES - SET UP TO        2-4 K2006760
                          LDX  L2 TEXT4      PRINT ERROR 85         2-4 K2006770
                          MDX     E2022      MESSAGE                2-4 K2006780
                    *                                                   K2006790
                    *             PRINT OVERLAP ERROR MESSAGE           K2006800
                    *                                                   K2006810
                    E2020 BSI  L  BLKPA    BLANK PRINT AREA             K2006820
                          LDX  L2 TEXT3    SET UP OVERLAP MESSAGE       K2006830
                    E2022 STX  L2 HTES1+1                               K2006840
                          LD    3 ZERO-Z   FORCE MESSAGE OUTPUT         K2006850
                          STO   3 OUTFL-Z                               K2006860
                          BSI   3 HTEST-Z  PRINT OVERLAP MESSAGE        K2006870
                    *                                                   K2006880
                    *             TEST IF OUTPUT SUPPRESSED             K2006890
                    *                                                   K2006900
                    E2021 LD   L  ERROR    LOAD ERROR SW FROM FCOM      K2006910
                          BSC  L  R1011,+- BRANCH IF NO ERRORS          K2006920
                    *                                                   K2006930
                          BSC  L  EXIT     EXIT TO NEXT PHASE           K2006940
                    **************************************************  K2006950
                          SPAC    1                                     K2006960
                    *             REARRANGE THE STRING BY PLACING       K2006970
                    *             FORMAT-STATEMENTS AND ARITH           K2006980
                    *             STMT-FUNCTION-STATEMENTS IN THE       K2006990
                    *             LOW-ADDRESS END OF THE STRING         K2007000
                    *                                                   K2007010
                    **************************************************  K2007020
                    R1011 LD   L  SOFS                                  K2007030
                          STO   3 PTR-Z    INITIALIZE POINTER           K2007040
                          LD   I  PTR                                   K2007050
                          AND   3 HF800-Z  EXTRACT ID                   K2007060
                          STO   3 STSID-Z  SAVE ID                      K2007070
                          LD    3 ZERO-Z   SET PASS SWITCH FOR          K2007080
                          STO     SWITC    *FIRST PASS                  K2007090
                    *                                                   K2007100
                    R1012 LD    3 STSID-Z  TEST FOR END STATEMENT       K2007110
                          S     3 ENDID-Z                               K2007120
                          BSC  L  D1099,+- BR IF END-STATEMENT          K2007130
                          LD      SWITC    LOAD PASS SWITCH             K2007140
                          BSC  L  D1015,+- BR IF FIRST PASS             K2007150
                    *                                                   K2007160
                    *             SECOND PASS                           K2007170
                    *                                                   K2007180
                    *             TEST IF FORMAT OR ARITH-STMT-FUNCT    K2007190
                    *                                                   K2007200
                          LD    3 STSID-Z  TEST FOR FORMAT STATEMENT    K2007210
                          S       FORMT                                 K2007220
                          BSC  L  R1013,+- BR IF FORMAT                 K2007230
                          LD    3 STSID-Z  TEST FOR ARITH STMNT FUNC    K2007240
                          S     3 HD000-Z                               K2007250
                          BSC  L  R1013,+- BR IF ARITH STMNT FUNC       K2007260
                    *                                                   K2007270
                    *             NOT IN CARD SYSTEM                    K2007280
                    *                                                   K2007290
                          MDX     R1021    GO TEST IF END STMNT         K2007300
                    *                                                   K2007310
                    *             FIRST PASS                            K2007320
                    *                                                   K2007330
                    D1015 LD    3 STSID-Z  TEST FOR DEFINE FILE STMNT   K2007340
                          S       DFILE                                 K2007350
                          BSC  L  R1013,+- BR IF DEFINE FILE            K2007360
                          S       DATA     TEST FOR DATA STMNT          K2007370
                          BSC  L  R1013,+- BR IF DATA STMNT             K2007380
                    *                                                   K2007390
                    *             IF SUBPROGRAM, ALSO DISREGARD         K2007400
                    *             LOADER-OVERLAY STATEMENTS             K2007410
                    *                                                   K2007420
                          LD    3 STSID-Z  LOAD STORED ID               K2007430
                          S     3 HD800-Z  TEST FOR INTERVAL O/P FMT    K2007440
                          BSC     Z        SKIP IF POSSIBLE LDR STMNT   K2007450
                          MDX     R1021    BR IF NOT                    K2007460
                          LD   L  SORF     TEST IF SUBR OR FUNCTION     K2007470
                          BSC     +-       SKIP IF SUBPROGRAM           K2007480
                          MDX     R1021    BR IF NOT                    K2007490
                    *                                                   K2007500
                    R1013 BSI     MOVP     MOVE POINTER TO NEXT STMT    K2007510
                          MDX     R1012    GO CHECK IF END STATEMENT    K2007520
                    *                                                   K2007530
                    R1021 LD    3 PTR-Z    LOAD POINTER                 K2007540
                          STO   3 RALO-Z   INSERT REARRANGEMENT AREA    K2007550
                    *                        LOW ADDRESS                K2007560
                    R1022 BSI     MOVP     MOVE POINTER TO NEXT STMNT   K2007570
                          S     3 ENDID-Z  TEST IF END STATEMENT        K2007580
                          BSC  L  D1099,+- BR IF END-STATEMENT          K2007590
                    *                                                   K2007600
                    *             NOT IN CARD SYSTEM                    K2007610
                    *                                                   K2007620
                          LD      SWITC    TEST PASS SWITCH             K2007630
                          BSC  L  D1026,Z  BR IF SECOND PASS            K2007640
                    *                                                   K2007650
                    *             FIRST PASS                            K2007660
                    *                                                   K2007670
                    D1025 LD    3 STSID-Z  TEST,FIRST PASS              K2007680
                          S       DFILE    TEST IF DEFINE FILE STMNT    K2007690
                          BSC  L  R1023,+- BR IF DEFINE FILE            K2007700
                          S       DATA     TEST IF DATA STATEMENT       K2007710
                          BSC  L  R1023,+- BR IF DATA STATEMENT         K2007720
                          MDX     R1022    GO MOVE TO NEXT STATEMENT    K2007730
                    *                                                   K2007740
                    *             SECOND PASS                           K2007750
                    *                                                   K2007760
                    D1026 SLA     0        TEST, SECOND PASS            K2007770
                    *                                                   K2007780
                          LD    3 STSID-Z                               K2007790
                          S       FORMT    TEST IF FORMAT STATEMENT     K2007800
                          BSC  L  R1023,+- BR IF FORMAT STATEMENT       K2007810
                          LD    3 STSID-Z                               K2007820
                          S     3 HD000-Z  TEST IF ARITH STMNT FUNCT    K2007830
                          BSC  L  R1022,Z  BR IF NOT ARITH STMNT FUNCT  K2007840
                    *                                                   K2007850
                    *             FORMAT OR ARITH STMT FUNCT            K2007860
                    *             ENCOUNTERED, PREPARE REARRANGEMENT    K2007870
                    *                                                   K2007880
                    R1023 LD    3 NORM-Z   INSERT ROTATE COUNT          K2007890
                          STO     R1031+1                               K2007900
                          A     3 PTR-Z    INSERT REARR-AREA HIGH ADR+1 K2007910
                          STO     R1034+1                               K2007920
                          STO     R1035+1                               K2007930
                          S     3 ONE-Z    INSERT REARR-AREA HIGH ADDR  K2007940
                          STO     R1033+1                               K2007950
                          A     3 ONE-Z                                 K2007960
                          S     3 RALO-Z   INSERT REARR-AREA LENGTH     K2007970
                          STO     R1032+1  (NEGATIVE)                   K2007980
                          LD    3 0                                     K2007990
                          S       R1032+1  SET LENGTH POSITIVE          K2008000
                          STO     R1032+1                               K2008010
                    *                                                   K2008020
                    *             ROTATE REARRANGEMENT AREA             K2008030
                    *                                                   K2008040
                    R1031 LDX  L2 *-*      INITIALIZE ROTATE COUNT      K2008050
                    R1032 LDX  L1 *-*      INITIALIZE .ROTATE ONE.      K2008060
                    *                                                   K2008070
                    *             ROTATE REARR AREA BY ONE WORD         K2008080
                    *                                                   K2008090
                    R1033 LD   L  *-*      REARR AREA HIGH ADDR         K2008100
                          RTE     16                                    K2008110
                    R1034 LD   L1 *-*      REARR AREA HIGH ADDR + 1     K2008120
                          RTE     16                                    K2008130
                    R1035 STO  L1 *-*      REARR AREA HIGH ADDR + 1     K2008140
                          MDX   1 1                                     K2008150
                          MDX     R1034    BR IF .ROTATE ONE. NOT COMPL K2008160
                    *                                                   K2008170
                          MDX   2 -1       ROTATE COUNT                 K2008180
                          MDX     R1032    IF NOT ZERO, BR TO .ROTATE   K2008190
                    *                        ONE.                       K2008200
                    *                                                   K2008210
                    *             ROTATE COMPLETED                      K2008220
                    *                                                   K2008230
                          LD    3 RALO-Z   INCR REARR AREA LOW ADDR     K2008240
                          A     3 NORM-Z     BY LENGTH OF FORMAT STMT   K2008250
                          STO   3 RALO-Z                                K2008260
                          STO   3 PTR-Z    REARR-AREA LOW ADDR TO PTR   K2008270
                          MDX     R1022    GO MOVE TO NEXT STATEMENT    K2008280
                    *                                                   K2008290
                    FORMT DC      /6000    CONSTANT                     K2008300
                    *                                                   K2008310
                    *             NOT IN CARD SYSTEM                    K2008320
                    *                                                   K2008330
                    D1099 LD      SWITC    LOAD PASS SWITCH             K2008340
                          BSC  L  EXIT,Z   BR IF SECOND PASS            K2008350
                          MDX  L  SWITC,1  CHANGE PASS SWITCH           K2008360
                          LD    3 RALO-Z   REARRANGEMENT AREA LOW       K2008370
                          STO   3 PTR-Z    *ADDRESS TO POINTER          K2008380
                          LD      LINK     SET LINK ADDR IN SUBROUTINE  K2008390
                          STO     MOVP                                  K2008400
                          MDX     MOVP1    BR TO SUBR                   K2008410
                    *                                                   K2008420
                    LINK  DC      R1012    CONSTANT                     K2008430
                    DFILE DC      /F000    STMT ID DEFINE FILE          K2008440
                    DATA  DC      /F800-/F000 CONSTANT                  K2008450
                    SWITC DC      0        PASS SWITCH                  K2008460
                    *                                                   K2008470
                    *     MOVE POINTER TO NEXT STATEMENT                K2008480
                    *             STORE STATEMENT-ID AND NORM           K2008490
                    *             STATEMENT-ID TO A-REGISTER            K2008500
                    *                                                   K2008510
                    MOVP  DC      0        LINK                         K2008520
                          LD   I  PTR      GET ID WORD THIS STATEMENT   K2008530
                          AND   3 H07FC-Z  EXTRACT NORM                 K2008540
                          SRA     2        RIGHT JUSTIFY                K2008550
                          A     3 PTR-Z    ADVANCE PT TO NEXT STMNT     K2008560
                          STO   3 PTR-Z                                 K2008570
                    MOVP1 LD   I  PTR      GET ID WORD NEXT STATEMENT   K2008580
                          AND   3 H07FC-Z  EXTRACT AND STORE NORM       K2008590
                          SRA     2                                     K2008600
                          STO   3 NORM-Z                                K2008610
                          LD   I  PTR                                   K2008620
                          AND   3 HF800-Z  EXTRACT AND STORE ID         K2008630
                          STO   3 STSID-Z                               K2008640
                          BSC  I  MOVP     RETURN                       K2008650
                    *                                                   K2008660
                    TEXT3 DC      19         WORD COUNT             2-4 K2008670
                          EBC     . C 97 PROGRAM LENGTH EXCEEDS.    2-4 K2008680
                          EBC     . CAPACITY .                      2-4 K2008690
                    TEXT4 DC      13         WORD COUNT             2-4 K2008700
                          EBC     . C 85 ORIGIN IN SUBPROGRAM.      2-4 K2008710
                    TEXT5 DC      12       WORD COUNT                   K2008720
                          EBC     .UNREFERENCED STATEMENTS .            K2008730
                    TEXT6 DC      10       WORD COUNT                   K2008740
                          EBC     .UNDEFINED VARIABLES .                K2008750
                    TEXT7 DC      9        WORD COUNT                   K2008760
                          EBC     .INVALID STATEMENTS.                  K2008770
                    TEXT8 EBC     . ERROR AT STATEMENT NUMBER.          K2008780
                    *                                                   K2008790
                    *             SUBROUTINE                            K2008800
                    *             INCREMENT SYMBOL TABLE POINTER        K2008810
                    *                                                   K2008820
                    INCSP DC      0        LINK                         K2008830
                          LD   I  STPTR    GET ID WD IN SYMBOL TABLE    K2008840
                          AND   3 H1800-Z  EXTRACT DIMENSION BITS       K2008850
                          BSC     Z        SKIP IF NOT DIMENSIONED      K2008860
                          LD    3 HFFFD-Z  MINUS THREE                  K2008870
                          A     3 HFFFD-Z                               K2008880
                          A     3 STPTR-Z  POSITION SYMBOL TB POINTER   K2008890
                          STO   3 STPTR-Z  *PAST DIMENSIONED VARIABLE   K2008900
                          S    L  EOFST    TEST FOR END OF SYMBOL TBL   K2008910
                          BSC  L  INCS2,+  BR IF END OF SYMBOL TABLE    K2008920
                          LD   I  INCSP    IF NOT,RETURN TO ADDRESS     K2008930
                    *                      *SPECIFIED IN LINK           K2008940
                          STO     INCS1+1                               K2008950
                          LDX  I1 STPTR    POINTER TO X1                K2008960
                    INCS1 BSC  L  *-*      RETURN                       K2008970
                    INCS2 MDX  L  INCSP,1  IF END OF SYMT,RETURN TO     K2008980
                    *                        ADDR = LINK + 1            K2008990
                          BSC  I  INCSP    RETURN                       K2009000
                    *                                                   K2009010
                    *             SUBROUTINE                            K2009020
                    *             CONVERT BINARY VALUE TO               K2009030
                    *             THREE DECIMAL DIGITS                  K2009040
                    *                                                   K2009050
                    CON3D DC      0        LINK                         K2009060
                          SRT     16       SHIFT ARGUMENT TO EXTENSION  K2009070
                          D     3 C100-Z  FGET FIRST DIGIT              K2009080
                          BSI     GOSTO    STORE FIRST DIGIT            K2009090
                          LD    3 Z-Z                                   K2009100
                          D     3 C10-Z    GET SECOND DIGIT             K2009110
                          BSI     GOSTO    STORE SECOND DIGIT           K2009120
                          SLT     16       GET THIRD DIGIT              K2009130
                          BSI     GOSTO    STORE THIRD DIGIT            K2009140
                          BSC  I  CON3D    RETURN                       K2009150
                    GOSTO DC      0        LINK                         K2009160
                          SLA     8        LEFT JUSTIFY DIGIT           K2009170
                          OR    3 HF000-Z  CONVERT TO EBC               K2009180
                          STO  I  PAP      STORE INTO PRINT AREA        K2009190
                          MDX  L  PAP,1    INCREMENT PR AREA POINTER    K2009200
                          BSC  I  GOSTO    RETURN                       K2009210
                    *                                                   K2009220
                    *             SUBROUTINE                            K2009230
                    *             HEADER TEST                           K2009240
                    *             PRINTS HEADER TO ERROR                K2009250
                    *             MESSAGES IF FIRST MESSAGE             K2009260
                    *                                                   K2009270
                    HTEST DC      0        LINK                         K2009280
                          LD    3 OUTFL-Z  LOAD HEADER PRINTED SW       K2009290
                          BSC  L  HTES3,Z  BR IF HEADER NOT REQUIRED    K2009300
                          MDX  L  OUTFL,1  SET SWITCH TO PREVENT        K2009310
                    *                      ADDITIONAL HEADERS           K2009320
                          LD      HTES2      LOAD LINE SPACE PARAMETER  K2009330
                          BSI  L  LSTPR      SPACE PRINTER ONE SPACE    K2009340
                    *                                                   K2009350
                          LD   I  $CH12      LOAD CHANNEL 12 INDICATOR  K2009360
                          BSI  I  NEWPG,Z    EJECT PAGE IF SET          K2009370
                    *                                                   K2009380
                          LDD     HTES1      LOAD PRINT PARAMETERS      K2009390
                          BSI  L  LSTPR      CO PRINT SECTION HEADER    K2009400
                    *                                                   K2009410
                    HTES3 BSC  I  HTEST      RETURN                     K2009420
                    *                                                   K2009430
                          BSS  E  0                                     K2009440
                    HTES1 DC      /7001      PRINT PARAMETER            K2009450
                          DC      *-*        SECTION HEADER ADDRESS     K2009460
                    *                                                   K2009470
                    HTES2 DC      /7002      SPACE PRINTER PARAMETER    K2009480
                    *                                                   K2009490
                    *             GET SYM.T. NAME OF LABEL              K2009500
                    *                                                   K2009510
                    GNAME DC      0        LINK                         K2009520
                          AND     GNAM3    EXTRACT DISPLACEMENT         K2009530
                          STO     GNAM1+1  SAVE                         K2009540
                          LD   L  SOFST    LOAD START OF SYMBOL TB ADDR K2009550
                          S       GNAM1+1  COMPUTE SYMBOL TBL ENT ADDR  K2009560
                          S       GNAM1+1  *                            K2009570
                          S       GNAM1+1  *                            K2009580
                          A     3 THREE-Z  *                            K2009590
                          STO     GNAM0+1  STORE ID WORD ADDRESS        K2009600
                          A     3 ONE-Z                                 K2009610
                          STO     GNAM1+1  STORE FIRST NAME WORD ADDR   K2009620
                          A     3 ONE-Z                                 K2009630
                          STO     GNAM2+1  STORE SECOND NAME WORD ADDR  K2009640
                    GNAM0 LD   L  *-*      LOAD ID WORD                 K2009650
                          STO     GNAM4    STORE ID WORD                K2009660
                    GNAM1 LD   L  *-*      LOAD FIRST NAME WORD         K2009670
                          STO     NAME     STORE FIRST NAME WORD        K2009680
                    GNAM2 LD   L  *-*      LOAD SECOND NAME WORD        K2009690
                          STO     NAME+1   STORE SECOND NAME WORD       K2009700
                          BSC  I  GNAME    RETURN                       K2009710
                    NAME  DEC     0        2 WORD STORAGE FOR NAME      K2009720
                    GNAM3 DC      /07FF    CONSTANT                     K2009730
                    GNAM4 DC      0        SYMBOL TABLE ID WORD         K2009740
                    *                                                   K2009750
                    H07FC DC      /07FC    CONSTANT                     K2009760
                    RALO  DC      0        REARR AREA LOW ADDR          K2009770
                    PTR   DC      0        POINTER                      K2009780
                    *                                                   K2009790
                    *                                                   K2009800
                    C10   DC      10       CONSTANT                     K2009810
                    C100  DC      100      CONSTANT                     K2009820
                    C120  DC      120      CONSTANT                     K2009830
                    HFFFD DC      /FFFD    CONSTANT                     K2009840
                    H0008 DC      /0008    CONSTANT                     K2009850
                    H0020 DC      /0020    CONSTANT                     K2009860
                    PAP   DC      PAREA    PRINT AREA POINTER           K2009870
                    PAPIN DC      PAREA    INIT VALUE OF PAP            K2009880
                    H1800 DC      /1800    CONSTANT                     K2009890
                    STOOI DC      0        STORED OUTPUT INDEX          K2009900
                    HA7FC DC      /A7FC    CONSTANT                     K2009910
                    H0200 DC      /0200    CONSTANT                     K2009920
                    ZERO  DC      0        CONSTANT                     K2009930
                    Z     EQU     ZERO     TRANSFER VECTOR PT ADDR      K2009940
                    ONE   DC      /0001    CONSTANT                     K2009950
                    TWO   DC      /0002    CONSTANT                     K2009960
                    THREE DC      /0003    CONSTANT                     K2009970
                    FOUR  DC      /0004    CONSTANT                     K2009980
                    STLAB DC      0        STORED LABEL                 K2009990
                    STCNT DC      0        STORED COUNT                 K2010000
                    *                      (NUMBER OF STATEMENTS        K2010010
                    *                      FROM LAST LABEL)             K2010020
                    LBLSW DC      0         LABLE SW               2-11 K2010030
                    ERRNO DC      0         ERROR NUMBR STG        2-11 K2010040
                    HF800 DC      /F800     DATA CONSTANT          2-11 K2010050
                    HF000 DC      /F000     DEFINE FILE CONST      2-11 K2010060
                    OUTFL DC      0        OUTPUT FLAG                  K2010070
                    STSID DC      0        STORED STMNT-ID              K2010080
                    NORM  DC      0        STORED NORM                  K2010090
                    IDMSK DC      /F800    MASK FOR EXTR STMNT-ID       K2010100
                    NRMSK DC      /07FC    MASK FOR EXTR NORM           K2010110
                    ERRID DC      /A000    ERROR ID                     K2010120
                    ENDID DC      /1000    END ID                       K2010130
                          BSS  E  0                                     K2010140
                    FZERO DC      /30C3    CONSTANT FOR FIVE ZEROS      K2010150
                          DC      /0C30    *                            K2010160
                    STPTR DC      0        SYMBOL TABLE POINTER         K2010170
                    HD000 DC      /D000    CONSTANT                     K2010180
                    HD800 DC      /D800    CONSTANT                     K2010190
                    H4000 DC      /4000    CONSTANT                     K2010200
                    HC000 DC      /C000                                 K2010210
                    PAR31 DC      PAREA+31 CONSTANT                     K2010220
                    H3F00 DC      /3F00    CONSTANT                     K2010230
                    PLUS  DC      /4E00    CONSTANT                     K2010240
                    C     DC      /C300    CONSTANT                     K2010250
                    D60   DC      60       CONSTANT                     K2010260
                    PCNT  DC      *-*      PRINT COUNT                  K2010270
                    *                                                   K2010280
                    *             SET ERROR SWITCH IN COMMUN AREA       K2010290
                    *             TO PREVENT FINAL OUTPUT               K2010300
                    *                                                   K2010310
                    ERRSW DC      0        LINK                         K2010320
                    *                                                   K2010330
                          LD   L  ERROR    SET ERROR SWITCH             K2010340
                          OR    3 TWO-Z    *                            K2010350
                          STO  L  ERROR    *                            K2010360
                          BSC  I  ERRSW    RETURN                       K2010370
                    *                                                   K2010380
                    *             SUBROUTINE                            K2010390
                    *             MOVE NAME TO PRINT AREA               K2010400
                    *                                                   K2010410
                    MNAME DC      0        LINK                         K2010420
                          BSI   3 HTEST-Z  TEST IF HEADER PRINTED       K2010430
                          BSI     TOPAB    BLANK TO PRINT AREA          K2010440
                          LD    1 1        GET FIRST CHARACTER          K2010450
                          BSI     TOPA     OUTPUT FIRST CHARACTER       K2010460
                          LD    1 1        GET SECOND CHARACTER         K2010470
                          SLA     6                                     K2010480
                          BSI     TOPA     OUTPUT SECOND CHARACTER      K2010490
                          LD    1 2        GET THIRD CHARACTER          K2010500
                          RTE     16                                    K2010510
                          LD    1 1                                     K2010520
                          SLT     12                                    K2010530
                          BSI     TOPA     OUTPUT THIRD CHARACTER       K2010540
                          LD    1 2        GET FOURTH CHARACTER         K2010550
                          SLA     2                                     K2010560
                          BSI     TOPA     OUTPUT FOURTH CHARACTER      K2010570
                          LD    1 2        GET FIFTH CHARACTER          K2010580
                          SLA     8                                     K2010590
                          BSI     TOPA     OUTPUT FIFTH CHARACTER       K2010600
                          BSI     TOPAB    OUTPUT ONE BLANK             K2010610
                          BSI     TOPAB    OUTPUT ANOTHER BLANK         K2010620
                    *                                                   K2010630
                    *             INCREMENT PRINT COUNT                 K2010640
                    *                                                   K2010650
                          LD    3 PCNT-Z   INCREMENT PRINT COUNT        K2010660
                          A     3 H0008-Z  *BY 8                        K2010670
                          STO   3 PCNT-Z                                K2010680
                    *                                                   K2010690
                    *     TEST IF LINE FULL                             K2010700
                          S     3 C120-Z   SEE IF LINE FULL             K2010710
                          BSC  I  MNAME,+Z RETURN IF LINE NOT FULL      K2010720
                          BSI   3 HFILL-Z  PRINT THIS LINE              K2010730
                          BSC  I  MNAME    RETURN                       K2010740
                    *                                                   K2010750
                    *             SUBROUTINE                            K2010760
                    *             CHAR IN A-REG TO PRINT AREA UNCHANGED K2010770
                    *                                                   K2010780
                    TOPAU DC      0        LINK                         K2010790
                          STO     STOCH    SAVE CHARACTER               K2010800
                    TOPAX LD      STOCH    LOAD CHARACTER               K2010810
                          STO  I  PAP      SET INTO PR AREA UNCHANGED   K2010820
                          MDX  L  PAP,1    INCR PRINT AREA POINTER      K2010830
                          BSC  I  TOPAU    RETURN                       K2010840
                    *                                                   K2010850
                    *             SUBROUTINE                            K2010860
                    *             CONVERT CHAR IN A-REG INTO            K2010870
                    *             EBC-CODE, THEN MOVE TO PRINT AREA     K2010880
                    *                                                   K2010890
                    TOPA  DC      0        LINK                         K2010900
                          AND   3 H3F00-Z  MASK TO LEAVE CHARACTER      K2010910
                          BSC  L  TOPA2,+- BR IF BLANK                  K2010920
                    *                                                   K2010930
                    *             NOTE                                  K2010940
                    *             IF OTHER SPECIAL CHARACTERS THAN      K2010950
                    *             BLANK ARE EXPECTED, TESTING SHOULD    K2010960
                    *             BE HERE                               K2010970
                    *                                                   K2010980
                          OR    3 HC000-Z  CONVERT TO EBCDIC            K2010990
                    TOPA1 STO     STOCH    STORE CHARACTER              K2011000
                          LD      TOPA     SET UP TO RETURN FROM        K2011010
                          STO     TOPAU    *TOPAU                       K2011020
                          MDX     TOPAX    GO OUTPUT CHARACTER          K2011030
                    TOPA2 LD    3 H4000-Z  LOAD EBCDIC BLANK            K2011040
                          MDX     TOPA1    GO OUTPUT                    K2011050
                    *                                                   K2011060
                    TOPAB DC      0        LINK                         K2011070
                          SLA     16       LOAD DUMMY BLANK             K2011080
                          BSI     TOPA     GO OUTPUT A BLANK            K2011090
                          BSC  I  TOPAB    RETURN                       K2011100
                    STOCH DC      *-*      STORED CHARACTER             K2011110
                    *                                                   K2011120
                    *             SUBROUTINE                            K2011130
                    *             BLANK TO PRINT AREA                   K2011140
                    *                                                   K2011150
                    BLKPA DC      0        LINK                         K2011160
                          LD    3 H4000-Z  LOAD EBCDIC BLANK            K2011170
                          LDX   3 -120     SET UP TO BLANK PRINT AREA   K2011180
                    BLKP1 STO  L3 PAREA+120 BLANK PRINT AREA            K2011190
                          MDX   3 1        *                            K2011200
                          MDX     BLKP1    *                            K2011210
                          LDX  L3 Z        SET TRANSFER VECTOR POINTER  K2011220
                          BSC  I  BLKPA    RETURN                       K2011230
                    *                                                   K2011240
                    *             TEST IF HALF FILLED LINE              K2011250
                    *             IN PRINT AREA                         K2011260
                    *                                                   K2011270
                    HFILL DC      *-*      LINK                         K2011280
                          LD    3 PCNT-Z   LOAD PRINT COUNT             K2011290
                          BSC  L  XHF,+-   RETURN IF ZERO               K2011300
                          LD    3 PAPIN-Z  LOAD PRINT AREA ORIGIN       K2011310
                          STO   3 PAP-Z    RESET PRINT AREA POINTER     K2011320
                          STO  L  AREA     SET MESSAGE ADDRESS          K2011330
                          LD    3 D60-Z                                 K2011340
                          STO  L  WDCNT    SET WORD COUNT               K2011350
                          BSI  L  PRINT    PRINT LINE                   K2011360
                          BSI     BLKPA    BLANK PRINT AREA             K2011370
                          LD   I  $CH12    TEST CHANNEL 12 SWITCH       K2011380
                          BSI  I  NEWPG,Z  EJECT PAGE IF ON             K2011390
                          SLA     16                                    K2011400
                          STO   3 PCNT-Z   ZERO PRINT COUNT             K2011410
                    XHF   BSC  I  HFILL    RETURN                       K2011420
                    *                                                   K2011430
                    EXIT  SLA     0        EXIT ROUTINE                 K2011440
                          LD   I  $CH12    TEST CHANNEL 12 SWITCH       K2011450
                          BSI  I  NEWPG,Z  EJECT PAGE IF ON             K2011460
                          LDX  I1 NXTPH+1  SET UP TO GO TO              K2011470
                          LDD     NXTPH+2  *NEXT PHASE                  K2011480
                          BSC  L  ROL      GO TO NEXT PHASE             K2011490
                          BSS  E  0                                     K2011500
                    NXTPH DC      51         ID OF NEXT PHASE           K2011510
                          DC      *-*        CORE ADDRESS NEXT PHASE    K2011520
                          DC      *-*        WORD COUNT NEXT PHASE      K2011530
                          DC      *-*        SECTOR ADDRESS NEXT PHASE  K2011540
                    PATCH BSS     /7DF5-*   PATCH AREA             2-11 K2011550
                          DC       0                                    K2011560
                          END     BPHAR-2                               K2011570
