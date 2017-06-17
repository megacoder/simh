                          HDNG    1130 FORTRAN COMPILER PHASE 6         K0600010
                    *************************************************** K0600020
                    *STATUS - VERSION 2, MODIFICATION 9               * K0600030
                    *                                                 * K0600040
                    *FUNCTION/OPERATION-                              * K0600050
                    *   * SCANS ALL IF, CALL, AND ARITHMETIC STMNTS   * K0600060
                    *     FOR VALID REAL CONSTANTS.                   * K0600070
                    *   * CONVERTS REAL CONSTANTS TO STANDARD OR      * K0600080
                    *     EXTENDED PRECISION FORMAT, AS SPECIFIED BY  * K0600090
                    *     THE FORTRAN COMMUNICATIONS AREA INDICATORS  * K0600100
                    *     DERIVED FROM THE CONTROL RECORDS IN PHASE 1.* K0600110
                    *   * CHECKS SYMBOL TABLE FOR PREVIOUS ENTRY OF   * K0600120
                    *     CONSTANT. IF FOUND, NO NEW ENTRY IS MADE.   * K0600130
                    *     THE SYMBOL TABLE ADDRESS OF THE CONSTANT AND* K0600140
                    *     THE CONSTANT OPERATOR REPLACE THE CONSTANT  * K0600150
                    *     IN THE STATEMENT STRING. IF NOT FOUND, THE  * K0600160
                    *     CONVERTED CONSTANT IS ADDED TO THE SYMBOL   * K0600170
                    *     TABLE.  THE CONSTANT OPERATOR FOLLOWED BY   * K0600180
                    *     THE SYMBOL TABLE ADDRESS REPLACES THE       * K0600190
                    *     CONSTANT IN THE STATEMENT STRING. THE STRING* K0600200
                    *     IS CLOSED UP AFTER ALTERATION.              * K0600210
                    *                                                 * K0600220
                    *ENTRY POINTS-                                    * K0600230
                    *   * START-PHASE 6 IS READ INTO CORE BY THE ROL  * K0600240
                    *     PROGRAM AND EXECUTION BEGINS AT THIS ADDRESS* K0600250
                    *                                                 * K0600260
                    *INPUT-                                           * K0600270
                    *   * THE STATEMENT STRING FROM PREVIOUS PHASES   * K0600280
                    *   * THE SYMBOL TABLE FROM PREVIOUS PHASES       * K0600290
                    *   * FCOM                                        * K0600300
                    *                                                 * K0600310
                    *OUTPUT-                                          * K0600320
                    *   * THE MODIFIED STATEMENT STRING               * K0600330
                    *   * THE MODIFIED SYMBOL TABLE                   * K0600340
                    *   * FCOM                                        * K0600350
                    *                                                 * K0600360
                    *EXTERNAL REFERENCES-                             * K0600370
                    *   SUBROUTINES-                                  * K0600380
                    *      * ROL                                      * K0600390
                    *   COMMA/DCOM                                    * K0600400
                    *      * $PHSE                                    * K0600410
                    *                                                 * K0600420
                    *EXITS-                                           * K0600430
                    *   NORMAL-                                       * K0600440
                    *      * EXITS VIA A CALL TO THE ROL SUBROUTINE TO* K0600450
                    *        READ IN THE NEXT PHASE                   * K0600460
                    *                                                 * K0600470
                    *   ERROR-                                        * K0600480
                    *      * AN OVERLAP ERROR CAUSES THE PROGRAM TO   * K0600490
                    *        EXIT TO THE ROL ROUTINE WITHOUT          * K0600500
                    *        PROCESSING THE STRING                    * K0600510
                    *      * ERRORS 23,50 DETECTED BY THIS PHASE        K0600520
                    *                                                 * K0600530
                    *TABLES/WORK AREAS-N/A                            * K0600540
                    *                                                 * K0600550
                    *ATTRIBUTES- NONE.                                  K0600560
                    *                                                 * K0600570
                    *NOTES- THE SWITCHES USED IN PHASE 6 FOLLOW.  IF    K0600580
                    *   NON-ZERO, THE SWITCH IS TRANSFER=T.  IF ZERO,   K0600590
                    *   THE SWITCH IS NORMAL=N.                         K0600600
                    *      SW1 - DECIMAL POINT                          K0600610
                    *          N= DECIMAL POINT ALLOWABLE               K0600620
                    *      SW2 - E IN EXPONENT                          K0600630
                    *          N= E IN EXPONENT ALLOWABLE               K0600640
                    *      SW3 - SIGN                                   K0600650
                    *          T= SIGN ALLOWABLE                        K0600660
                    *      SW4 - SIGN                                   K0600670
                    *          T= SIGN WAS MINUS                        K0600680
                    *      SW5 - NON-ZERO CHARACTER                     K0600690
                    *          T= NON-ZERO CHARACTER ENCOUNTERED        K0600700
                    *      SW6 - STRING CLOSURE                         K0600710
                    *          T= STRING CLOSURE REQUIRED               K0600720
                    *      SW12- CHARACTER BUFFER                       K0600730
                    *          T= BUFFER EMPTY                          K0600740
                    *      SW14- FIRST OF TWO WORDS                     K0600750
                    *          N= WORKING ON FIRST OF TWO WORDS         K0600760
                    *      SW16- FIRST CONSTANT                         K0600770
                    *          N= FIRST CONSTANT OF STATEMENT           K0600780
                    *                                                   K0600790
                    *************************************************** K0600800
                          HDNG    1130 FORTRAN COMPILER PHASE 6         K0600810
                          ABS                                           K0600820
                    *                                                   K0600830
                    *                       SYSTEM EQUATES              K0600840
                    MEMRY EQU     /8000     CORE SIZE                   K0600850
                    OVERL EQU     MEMRY-1501  PHASE OVERLAY AREA SIZE   K0600860
                    ROL   EQU     MEMRY-68  LOC OF RTN TO READ NEXT PH  K0600870
                    $PHSE EQU     /78       NO. OF PHASE NOW IN CORE    K0600880
                    PHLEN EQU     3         NO. OF SECTORS THIS PH  2-9 K0600885
                          ORG     OVERL                                 K0600890
                    PHID  EQU     36        ID NUMBER THIS PHASE        K0600900
                    *                                                   K0600910
                    *                  FORTRAN COMMUNICATION AREA       K0600920
                    ORG   BSS     1    ORIGIN ADDRESS               2-9 K0600925
                    SOFS  BSS     1    START OF STRING                  K0600930
                    EOFS  BSS     1    END OF STRING                    K0600940
                    SOFST BSS     1    START OF SYMBOL TABLE            K0600950
                    SOFNS BSS     1    START OF NON-STATEMENT NUMBERS   K0600960
                    SOFXT BSS     1    START OF SUBSCRIPT TEMPORARIES   K0600970
                    SOFGT BSS     1    START OF GENERATED TEMPORARIES   K0600980
                    EOFST BSS     1    END OF SYMBOL TABLE              K0600990
                    COMON BSS     1    NEXT AVAILABLE COMMON            K0601000
                    CSIZE BSS     1    SIZE OF COMMON                   K0601010
                    ERROR BSS     1    OVERLAP ERROR                    K0601020
                    FNAME BSS     1     PROGRAM NAME                    K0601030
                          BSS     1     *                               K0601040
                    SORF  BSS     1    SUBROUTINE(-) OR FUNCTION(+)     K0601050
                    CCWD  BSS     1    CONTROL CARD WORD                K0601060
                    *                BIT 15 TRANSFER TRACE              K0601070
                    *                BIT 14 ARITHMETIC TRACE            K0601080
                    *                BIT 13 EXTENDED PRECISION          K0601090
                    *                BIT 12 LIST SYMBOL TABLE           K0601100
                    *                BIT 11 LIST SUBPROGRAM NAMES       K0601110
                    *                BIT 10 LIST SOURCE PROGRAM         K0601120
                    *                BIT  9 ONE WORD INTEGERS           K0601130
                    *                BIT  8 ORIGIN                  2-9 K0601140
                    IOCS  BSS     1    IOCS CONTROL CARD WORD           K0601160
                    *                BIT 15 CARD                        K0601170
                    *                BIT 14 PAPER TAPE                  K0601180
                    *                BIT 13 TYPEWRITER                  K0601190
                    *                BIT 12 1443 PRINTER                K0601200
                    *                BIT 11 MAGNETIC TAPE               K0601210
                    *                BIT 10 KEYBOARD                    K0601220
                    *                BIT  8 DISK                        K0601230
                    *                BIT  3 PLOTTER                     K0601240
                    *                BIT  1 UNFORMATTED DISK            K0601250
                    DFCNT BSS     1    NUMBER OF WORDS IN FILE TABLE    K0601260
                    *                                                   K0601270
                    *                                                   K0601280
                    *                                                   K0601290
                    *                  END OF FORTRAN COMMUNICATION     K0601300
                    *                  AREA                             K0601310
                    *                                                   K0601320
                    BPHAR EQU     *+2       BEGINNING CORE PHASE ADDR   K0601330
                          DC      0         LOADER WORK AREA            K0601340
                          DC      -36       -PHASE ID FOR SLET LOOKUP   K0601350
                          DC      NXTPH-*+1 TABLE FOR NEXT PHASE ENTRY  K0601360
                          DC      1         ONE ENTRY TO BE SET BY LDR  K0601370
                          ORG     *-2                                   K0601380
                    START LDX   1 PHID      LOAD ID NUMBER THIS PHASE   K0601390
                          STX  L1 $PHSE     STORE IN SYS PHASE AREA     K0601400
                          LD      ERROR     IF OVERLAP ERROR THEN BR TO K0601410
                          BSC  L  OUT,Z     READ IN NEXT PH AND EXECUTE K0601420
                    *                                                   K0601430
                    *             INITIALIZE PHASE                      K0601440
                    *                                                   K0601450
                    ORGIN LDX  I1 SOFS      START OF FIRST STMNT ADDR   K0601460
                          STX   1 IDSAV                                 K0601470
                    *                                                   K0601480
                    *             CHECK STATEMENT TYPE                  K0601490
                    *                                                   K0601500
                    CAP   LD    1 0         FIRST WD OF STMNT           K0601510
                          SRA     1         POSITION TO TEST STMNT TYPE K0601520
                          AND     IDTPE     STMNT TYPE (BITS 1-5)       K0601530
                          S       ENDC      END STMNT CONSTANT          K0601540
                          BSC  L  OUT,+-    BR TO RD NEXT PHASE         K0601550
                          S       ARITC     ARITH STMNT CONSTANT        K0601560
                          BSC     Z         SKIP NEXT IF ARITH STMNT    K0601570
                          S       IFC       IF STMNT CONSTANT           K0601580
                          BSC     Z         SKIP NEXT ON IF STMNT       K0601590
                          S       CALLC     CALL STMNT CONSTANT         K0601600
                          BSC     Z         SKIP NEXT IF CALL STMNT     K0601610
                          S       READC     READ STMNT CONSTANT         K0601620
                          BSC     Z         SKIP NEXT IF READ STMNT     K0601630
                          S       WRITC     WRITE STMNT CONSTANT        K0601640
                          BSC     Z         SKIP NEXT IF WRITE STMNT    K0601650
                          S       FINDC     FIND STMNT CONSTANT         K0601660
                          BSC  L  RCC,+-    BR IF FIND STMNT            K0601670
                          S       DATAC     DATA STMNT CONSTANT         K0601680
                          BSC  L  MOVE,Z    BR TO NEXT STMNT NOT DATA   K0601690
                          STX  L0 SW7       SET DATA STMNT SW ON        K0601700
                          MDX     RCCSS     BR TO INITIALIZE STMNT      K0601710
                    *                                                   K0601720
                    *             MOVE TO NEXT STATEMENT                K0601730
                    *                                                   K0601740
                    MOVE  LDX  I1 IDSAV     RESTORE START OF STMNT ADDR K0601750
                          LD    1 0         STMNT ID WORD               K0601760
                          SRA     2                                     K0601770
                          AND     IDNRM     WORD COUNT MASK             K0601780
                          STO     NXID+1    STMNT WORD COUNT            K0601790
                    NXID  MDX  L1 0         INCR START ADDR BY WD CNT   K0601800
                          MDX     ORGIN+2   BR TO CHECK STMNT TYPE      K0601810
                    *                                                   K0601820
                    *             CONSTANTS AND WORK AREA               K0601830
                    *                                                   K0601840
                    IDSAV DC      0         START OF STMNT ADDR TEMP    K0601850
                    ARITC DC      0-/0800   ARITH STMNT CONSTANT        K0601860
                    IFC   DC      /3C00     IF STMNT CONSTANT           K0601870
                    CALLC DC      /1800-/3C00  CALL  STMNT CONSTANT     K0601880
                    READC DC      /4800-/1800  READ  STMNT CONSTANT     K0601890
                    WRITC DC      /4400-/4800  WRITE STMNT CONSTANT     K0601900
                    FINDC DC      /7400-/4400  FIND  STMNT CONSTANT     K0601910
                    DATAC DC      /7C00-/7400  DATA  STMNT CONSTANT     K0601920
                    IDNRM DC      /01FF     STMNT WD COUNT MASK         K0601930
                    DECP  DC      /000B     DECIMAL POINT CONSTANT      K0601940
                    IDTPE DC      /7C00     STATEMENT TYPE MASK         K0601950
                    ENDC  DC      /0800     END STMNT CONSTANT          K0601960
                    SW6   DC      0         STRING CLOSURE SWITCH       K0601970
                    T     DC      0         INDEX REG 1 TEMPORARY       K0601980
                    SW16  DC      0         FIRST CONSTANT OF STMNT SW  K0601990
                    *                                                   K0602000
                    *             INITIALIZE STATEMENT                  K0602010
                    *                                                   K0602020
                    RCC   SLA     16        CLEAR ACCUMULATOR           K0602030
                          STO  L  SW7       RESET DATA STMNT SWITCH     K0602040
                    RCCSS STO     SW16      RESET FIRST CONSTANT SWITCH K0602050
                          STO  L  CNT       ZERO STMNT WORD COUNT       K0602060
                    *                                                   K0602070
                    *                                                   K0602080
                    *             TEST FOR CALL PDUMP                   K0602090
                    *             OUTPUT ERROR NUMBER 50 IF NOT A       K0602100
                    *             SUBROUTINE OR FUNCTION, OR IF A       K0602110
                    *             MAINLINE PROGRAM WITH NO CALLED       K0602120
                    *             IOCS.                                 K0602130
                    *                                                   K0602140
                          STX   1 *+1       SET XR3 TO POINT AT         K0602150
                          LDX  L3 *-*       *STMNT ID.                  K0602160
                          LD    3 0         LOAD STMNT ID           2-7 K0602170
                          BSC     E         SKIP IF NON-NUMBERED STMNT  K0602180
                          MDX   3 1         INCR PT IF NUMBERED STMNT   K0602190
                          SRA     1         DETERMINE IF STMNT IS CALL  K0602200
                          AND     IDTPE     *                           K0602210
                          S       CALLP     *                           K0602220
                          BSC  L  ZNCPD,Z   BRANCH IF NOT A CALL STMNT  K0602230
                          LD    3 1         LOAD NAME WORD 1            K0602240
                          S       CPDN1     IS WD 1 PART OF .PDUMP.     K0602250
                          BSC  L  ZNCPD,Z   BRANCH IF NOT               K0602260
                          LD    3 2         LOAD NAME WORD 2            K0602261
                          S       CPDN2     IS WD 2 PART OF .PDUMP.     K0602262
                          BSC  L  ZNCPD,Z   BRANCH IF NOT               K0602263
                    *                                                   K0602264
                    *             CHECK THE PDUMP FORMAT            2-9 K0602265
                    *                                                   K0602266
                    BACK  MDX   3 +1                                2-9 K0602267
                          LD    3 3         SCAN PDUMP STMNT        2-9 K0602268
                          S       H001E     CHECK IF END OF PDUMP   2-9 K0602269
                          BSC  L  ZNCPD,+-  BRANCH IF YES TO CONTIN 2-9 K0602270
                          S       LPAR      CHECK IF LEFT PARENTH   2-9 K0602271
                          BSC  L  L1,Z      BRANCH IF NOT           2-9 K0602272
                          LD      *         IF LEFT PAR WAS FOUND   2-9 K0602273
                          STO     SWTCH     *SET SWTCH              2-9 K0602274
                          MDX     BACK      *AND CONT SCANNING      2-9 K0602275
                    L1    S       RPAR      CHECK IF RIGHT PARENTH  2-9 K0602276
                          BSC  L  L2,Z      BRANCH IF NO            2-9 K0602277
                          STO     SWTCH     RESET SWTCH IF YES      2-9 K0602278
                          MDX     BACK      *AND CONT SCANNING      2-9 K0602279
                    L2    S       COMMA     CHECK IF COMMA          2-9 K0602280
                          BSC  L  BACK,Z    BRANCH IF NO            2-9 K0602281
                          LD      SWTCH     IS THIS ARRAY SUBSCRIPT 2-9 K0602282
                          BSC  L  BACK,Z    BRANCH IF YES           2-9 K0602283
                          LD    3 +4        CHECK NEXT WORD         2-9 K0602284
                          S       HE800     IS PDUMP FORMAT = 4     2-9 K0602285
                          BSC  L  GOON,+-   IF YES TEST IOCS        2-9 K0602286
                          S       H0200     IS PDUMP FORMAT = 5     2-9 K0602287
                          BSC     Z         IF YES TEST IOCS        2-9 K0602288
                          MDX     BACK      IF NO CONT SCANNING     2-9 K0602289
                    *                                                   K0602290
                    GOON  LD      SORF      TEST IF SUBROUTINE,IF   2-9 K0602300
                          OR      IOCS      FUNCTION, OR IOCS           K0602310
                          BSC  L  ZNCPD,Z   BRANCH IF YES               K0602320
                          LDX   2 50        SET UP ERROR 50             K0602330
                          BSC  L  REP       GO OUTPUT ERRORS            K0602340
                    *                                                   K0602350
                    *             CONSTANTS                             K0602360
                    *                                                   K0602370
                    CALLP DC      /1800     CALL TEST WORD              K0602380
                    CPDN1 DC      /AE24     .PDUMP. WORD 1              K0602390
                    CPDN2 DC      /C517     .PDUMP. WORD 2              K0602400
                    LPAR  DC      /000D-/001E LEFT PARENTHESIS      2-9 K0602401
                    RPAR  DC      /001D-/000D RIGHT PARENTHESIS     2-9 K0602402
                    COMMA DC      /002B-/001D COMMA                 2-9 K0602403
                    H0200 DC      /0200       PDUMP FORMAT 5 CONST  2-9 K0602404
                    SWTCH DC      *-*         SWITCH SET WITHIN PAR 2-9 K0602405
                    H001E DC      /001E       END PDUMP STMNT CONST 2-9 K0602406
                    HE800 DC      /E800       PDUMP FORMAT 4 CONST  2-9 K0602407
                    *                                                   K0602410
                    *                                                   K0602420
                    ZNCPD EQU     *         CONTINUE                    K0602430
                    *                                                   K0602440
                    *          MOVE POINTER                             K0602450
                          MDX   1 1         MOVE STMNT POINTER          K0602460
                    Z3    LD    1 0         CHECK FOR OPERATOR          K0602470
                          BSC     -         SKIP NEXT IF NOT OPERATOR   K0602480
                          MDX     RC        BR IF OPERATOR              K0602490
                    Z     MDX   1 1         MOVE STMNT POINTER          K0602500
                          MDX     Z3        BR TO CHECK FOR OPERATOR    K0602510
                    RC    S    L  SEMIC     SEMICOLON CONSTANT          K0602520
                          BSC     Z         SKIP NEXT IF SEMICOLON      K0602530
                          MDX     Z1        BR TO CHECK FOR DECIMAL PT  K0602540
                          LD      SW6       STRING CLOSURE SWITCH       K0602550
                          BSC  L  CLSUP,Z   BR TO CLOSE STRING          K0602560
                          MDX   1 1         MOVE STMNT POINTER          K0602570
                          BSC  L  ORGIN+2   BR TO CHECK STMNT TYPE  2-9 K0602580
                    Z1    LD    1 0         CHECK FOR DECIMAL POINT     K0602590
                          S       DECP      DECIMAL POINT CONSTANT      K0602600
                          BSC  L  ZZ,+-     BR IF DECIMAL POINT         K0602610
                          MDX     Z         BR TO MOVE POINTER          K0602620
                    ZZ    LD      SW16      FIRST CONSTANT SWITCH       K0602630
                          BSC  L  Z33,+-    BR IF FIRST CONSTANT        K0602640
                          STX   1 T         CHECK FOR LEGAL CONSTANT    K0602650
                          LD      T         CURRENT STMNT POINTER       K0602660
                          S    L  TT        POINTER BEFORE COLLECT REAL K0602670
                          BSC  L  JBR,+-    BR TO SET INVALID CON ERROR K0602680
                    Z33   MDX   1 -1        MOVE PT BACK TO OPERATOR    K0602690
                          LD    1 0         IF SIGN POSITION IS ZERO    K0602700
                          BSC     +         SKIP TO SAVE STMNT POINTER  K0602710
                          MDX     *-4       BR TO MOVE BACK POINTER     K0602720
                          STX  L1 TT        SAVE STMNT PT AT OPERATOR   K0602730
                    *                                                   K0602740
                    *             INITIALIZE TO COLLECT REAL CONSTANT   K0602750
                    *                                                   K0602760
                          SLA     16                                    K0602770
                          LDX   2 5         COUNTER= 5                  K0602780
                    AMP   STO  L2 JANS-5    ZERO FIVE WORDS OF BUFFER   K0602790
                          MDX   2 -1        DECR COUNTER                K0602800
                          MDX     AMP       BR TO CONTINUE CLEARING     K0602810
                          LDX   2 5         COUNTER= 5                  K0602820
                          STO  L2 SW5-5     ZERO SW1 TO SW5             K0602830
                          MDX   2 -1        DECR COUNTER                K0602840
                          MDX     *-4       BR TO CONTINUE CLEARING SWS K0602850
                          STO  L  SW12      ZERO SWITCH 12              K0602860
                          MDX   1 1         MOVE STMNT POINTER          K0602870
                          STO     GCNT      ZERO CHAR COUNT             K0602880
                          STO  L  SW14      ZERO FIRST OF 2 WDS SWITCH  K0602890
                          STO  L  BIN       ZERO BIN                    K0602900
                    RC1   BSI  L  GET       BR TO GET NEXT ELEMENT      K0602910
                          S    L  JCON1     LEAVES DIGIT ONLY           K0602920
                          STO     X         SAVE CHARACTER              K0602930
                          BSC  L  RC7,+-    BR IF ZERO                  K0602940
                          BSC  L  SW1T,+    BR NOT A DIGIT              K0602950
                          S       JCON2     DECIMAL NINE                K0602960
                          BSC  L  RC5,+     BR IF DIGIT                 K0602970
                    SW1T  LD      SW1       DECIMAL POINT ALLOWABLE SW  K0602980
                          BSC  L  RC2,Z     BR IF DECML PT NOT ALLOWED  K0602990
                          LD      X         CHARACTER                   K0603000
                          S       JCON3     DECIMAL POINT CONSTANT      K0603010
                          BSC  L  RC8,+-    BR IF DECIMAL POINT         K0603020
                    RC2   LD      SW2                                   K0603030
                          BSC  L  RC3,Z     BR IF E NOT ALLOWABLE       K0603040
                          LD      X         CHARACTER                   K0603050
                          S       JCON4     ALPHABETIC E CONSTANT       K0603060
                          BSC  L  RC9,+-    BR IF ALPHA E               K0603070
                    RC3   LD      SW3                                   K0603080
                          BSC  L  RC10,+-   BR IF SIGN NOT ALLOWABLE    K0603090
                          LD      X         CHARACTER                   K0603100
                          S       JCON5     PLUS SIGN CONSTANT          K0603110
                          BSC  L  RC4,+-    BR IF PLUS SIGN             K0603120
                          S       JCON6     MINUS SIGN CONSTANT         K0603130
                          BSC  L  RC10,Z    BR IF SIGN NOT MINUS        K0603140
                          STX   0 SW4       SET SW4 ON. SIGN WAS MINUS  K0603150
                    RC4   STO     SW3       SET SW3= SIGN NOT ALLOWED   K0603160
                          MDX     RC1       BR TO GET NEXT CHARACTER    K0603170
                    *                                                   K0603180
                    *             CONSTANTS AND WORK AREA               K0603190
                    *                                                   K0603200
                    X     DC      0         CHARACTER TEMPORARY         K0603210
                    JCON1 DC      /0030     HIGH 2 BITS CONSTANT        K0603220
                    JCON2 DC      9         DECIMAL NINE CONSTANT       K0603230
                    JCON3 DC      /000B-/0030  DECIMAL POINT CONSTANT   K0603240
                    JCON4 DC      /0005-/0030  ALPHA E CONSTANT         K0603250
                    JCON5 DC      /000E-/0030  PLUS SIGN CONSTANT       K0603260
                    JCON6 DC      /0020-/000E  MINUS SIGN CONSTANT      K0603270
                    JCON7 DC      100       DECIMAL 100 CONSTANT        K0603280
                    JCON8 DC      192       DECIMAL 192 CONSTANT        K0603290
                    JCON9 DC      1         DECIMAL   1 CONSTANT        K0603300
                    LCON1 DC      5         DECIMAL   5 CONSTANT        K0603310
                    TILL  DC      0         NO. OF EXPONENT DIGITS TEMP K0603320
                    SW1   DC      0         DECIMAL POINT ALLOWABLE SW  K0603330
                    SW2   DC      0         E IN EXPONENT ALLOWABLE SW  K0603340
                    SW3   DC      0         SIGN ALLOWABLE SWITCH       K0603350
                    SW4   DC      0         MINUS SIGN SWITCH           K0603360
                    SW5   DC      0         NON-ZERO SWITCH             K0603370
                    EXP   DC      0         EXPONENT TEMPORARY          K0603380
                    JCO11 DC      10        DECIMAL TEN CONSTANT        K0603390
                    ERRNO DC      0         ERROR NUMBER TEMPORARY      K0603400
                    ERID  DC      /A008     ERROR ID CONSTANT           K0603410
                    GCNT  DC      0         CONSTANT CHARACTER COUNT    K0603420
                    RC5   LD      SW2                                   K0603430
                          BSC  L  RC6,Z     BR E NOT ALLOWABLE          K0603440
                          STX   0 SW5       SET SW5 NON-ZERO ENCOUNTER  K0603450
                    RC5A  LD      X         MPY ANSWER BY 10 AND ADD X  K0603460
                          BSI  L  MULT      BR TO MULTIPLY SUBROUTINE   K0603470
                    RC5B  LD      SW1                                   K0603480
                          BSC  L  RC1,+-    BR IF DECML PT ALLOWABLE    K0603490
                          MDX  L  DEC,1     ADD 1 TO DEC                K0603500
                          MDX     RC1       BR TO GET NEXT CHARACTER    K0603510
                    RC6   LD      EXP       MPY EXPONENT BY 10, ADD X   K0603520
                          M       JCO11     TEN                         K0603530
                          SLT     16        SHIFT PRODUCT TO A REG      K0603540
                          A       X         ADD X                       K0603550
                          STO     EXP       RESTORE EXPONENT            K0603560
                          SLA     16                                    K0603570
                          STO     SW3       RESET SIGN ALLOWABLE SWITCH K0603580
                          LD      EXP       CHECK EXPONENT FOR LESS     K0603590
                          S       JCON7     THAN 100.                   K0603600
                          BSC  L  JBR,-     BR IF 100 OR GREATER        K0603610
                          MDX  L  TILL,1    ADD 1 TO TILL               K0603620
                          MDX     RC1       BR TO GET NEXT CHARACTER    K0603630
                    JBR   LDX   2 23        SET UP ERROR 23             K0603640
                    REP   STX   2 ERRNO     SET ERROR NUMBER            K0603650
                          LDX  I1 IDSAV     START OF STMNT ADDRESS      K0603660
                          LD    1 0         STMNT ID WORD               K0603670
                          SRA     2                                     K0603680
                          AND  L  IDNRM     EXTRACT STMNT WORD COUNT    K0603690
                          A    L  IDSAV     START OF NEXT STMNT ADDRESS K0603700
                          STO     *+1                                   K0603710
                          LDX  L2 0         NEXT STMNT ADDR             K0603720
                          LD   L  EOFS      END OF STRING ADDRESS       K0603730
                          S       *-4       NEXT STMNT ADDR             K0603740
                          STO     *+1                                   K0603750
                          LDX  L3 0         RANGE                       K0603760
                          MDX   3 1         NUMBER OF WDS TO MOVE       K0603770
                          LD    1 0         STMNT ID WORD               K0603780
                          AND     JCON9     TURN ON ERROR INDICATORS    K0603790
                          OR      ERID                                  K0603800
                          STO   1 0         RESTORE ID WORD             K0603810
                          EOR     JCON9                                 K0603820
                          BSC  L  *+3,E     BR IF ODD                   K0603830
                          A       LCON1                                 K0603840
                          STO   1 0         STORE IN ID WORD            K0603850
                          MDX   1 1         INCREMENT STMNT POINTER     K0603860
                          LD      ERRNO     ERROR NUMBER                K0603870
                          STO   1 1         REPLACE STMNT WITH ERROR NO K0603880
                          LD    2 0         NEXT WORD TO MOVE           K0603890
                          STO   1 2         CLOSE UP STRING             K0603900
                          MDX   2 1         INCR NEXT WD TO MOVE ADDR   K0603910
                          MDX   1 1         INCR ADDR TO STORE NEXT WD  K0603920
                          MDX   3 -1        DECR WORDS TO MOVE COUNTER  K0603930
                          MDX     *-6       BR TO CONTINUE CLOSING      K0603940
                          MDX   1 1         INCR ADDR TO STORE NEXT WD  K0603950
                          STX  L1 EOFS      NEW END OF STRING ADDRESS   K0603960
                          BSC  L  MOVE      BR TO EXAMINE NEXT STMNT    K0603970
                    RC7   LD      SW2       E IN EXPONENT SWITCH        K0603980
                          BSC  L  RC6,Z     BR IF E NOT ALLOWABLE       K0603990
                          LD      SW5       NON-ZERO CHARACTER SWITCH   K0604000
                          BSC  L  RC5A,Z    BR IF NON-ZERO TO MPY BY 10 K0604010
                          MDX     RC5B      BR IF TEST SWITCH 1         K0604020
                    RC8   MDX  L  SW1,1     TURN ON SWITCH 1            K0604030
                          SLA     16        CLEAR ACCUMULATOR           K0604040
                          STO     DEC       ZERO DIGIT COUNTER          K0604050
                          BSC  L  RC1       BR TO GET NEXT CHARACTER    K0604060
                    RC9   MDX  L  SW2,1     SET SW 2, E NOT ALLOWABLE   K0604070
                          MDX  L  SW3,1     SET SW 3, SIGN ALLOWABLE    K0604080
                          MDX  L  SW1,1     SET SW 1 = NO DECML POINT   K0604090
                          SLA     16        CLEAR ACCUMULATOR           K0604100
                          STO     TILL      ZERO TILL                   K0604110
                          STO     EXP       ZERO EXPONENT               K0604120
                          BSC  L  RC1       BR TO GET NEXT CHARACTER    K0604130
                    *                                                   K0604140
                    *             CHECK FOR VALID CONSTANT              K0604150
                    *                                                   K0604160
                    RC10  LD    1 -1        STMNT ID WORD               K0604170
                          BSC  L  JBR,+Z    BR IF NEG TO SET ERROR 23   K0604180
                          LD      GCNT      CONSTANT CHARACTER COUNT    K0604190
                          S    L  TWO       DECIMAL TWO                 K0604200
                          BSC  L  JBR,+     BR IF LESS THAN 3 TO ERROR  K0604210
                          STX  L1 S         SAVE INDEX REGISTER 1       K0604220
                          LD      SW5       NON-ZERO SWITCH             K0604230
                          BSC  L  RC19,+-   BR TO CHECK PRECISION       K0604240
                          LD      JCON8     MAXIMUM 4 WORD EXPONENT     K0604250
                          STO  L  BIN       SET EXPONENT TO +64         K0604260
                          LD      SW2       E IN EXPONENT ALLOWABLE SW  K0604270
                          BSC  L  RC13,+-   BR IF E ALLOWABLE           K0604280
                          LD      TILL      NO. OF EXPONENT CHARACTERS  K0604290
                          S       JCON9     ONE                         K0604300
                          BSC  L  RC11,+-   BR IF ONE EXPONENT CHAR     K0604310
                          S    L  JCON9     ONE                         K0604320
                          BSC  L  JBR,Z     BR MORE THAN 2 CHARS- ERROR K0604330
                    RC11  LD   L  SW4       EXPONENT SIGN SWITCH        K0604340
                          BSC  L  RC12,+-   BR IF SIGN POSITIVE         K0604350
                          LD      DEC       CALCULATE DECIMAL POINT     K0604360
                          A    L  EXP       E EXPONENT VALUE            K0604370
                          STO     DEC       NO. PLACES AFTER DECML PT   K0604380
                          MDX     RC13      BR TO CHECK FOR NORMALIZE   K0604390
                    RC12  LD      DEC       CALCULATE DECIMAL POINT     K0604400
                          S    L  EXP       E EXPONENT VALUE            K0604410
                          STO     DEC       NO. PLACES AFTER DECML PT   K0604420
                    RC13  LD   L  JANS-4    CHECK FOR NORMALIZED RIGHT  K0604430
                          BSC  L  RC17,Z    BR IF SHIFT RIGHT NEEDED    K0604440
                          LD   L  JANS-3    CHECK FOR NORMALIZED LEFT   K0604450
                          BSC  L  RC15,-    BR IF SHIFT LEFT NEEDED     K0604460
                          LD      DEC       NO. PLACES AFTER DECML PT   K0604470
                          BSC  L  RC14,+Z   BR TO MPY BY 10 IF NEGATIVE K0604480
                          BSC  L  RC18,+    BR TO CHK EXPONENT IF ZERO  K0604490
                          MDX  L  DEC,-1    DECR PLACES AFTER DECML PT  K0604500
                          NOP                                           K0604510
                    *                                                   K0604520
                    *             DIVIDE CONSTANT BY 10                 K0604530
                    *                                                   K0604540
                          LDX   2 -4        WORD LENGTH OF CONSTANT     K0604550
                          SLT     32                                    K0604560
                    JDIV  LD   L2 JANS+1    NEXT WORD OF CON TO DIVIDE  K0604570
                          RTE     16        PREVIOUS REMAINDER INTO ACC K0604580
                          LDX   3 1         INITLZ SIGN FLAG TO PLUS    K0604590
                          S       JCO10     DIVIDEND IN RANGE +4 TO -5  K0604600
                          BSC     -         SKIP NEXT IF RANGE WAS OK   K0604610
                          MDX   3 -2        SET SIGN FLAG NEG AND SKIP  K0604620
                          A       JCO10     ADD BACK 5 IF RANGE WAS OK  K0604630
                          D    L  JCO11     DIVIDE BY TEN               K0604640
                          MDX   3 -2        TEST SIGN FLAG,SKIP IF PLUS K0604650
                          EOR     JCO12     RESTORE SIGN BIT TO RESULT  K0604660
                          STO  L2 JANS+1    REPLACE PARTIAL QUOTIENT    K0604670
                          MDX   2 1         INCR DIVIDE COUNTER         K0604680
                          MDX     JDIV      BR TO CONTINUE 4-WD DIVIDE  K0604690
                          MDX     RC13      BR TO NORMALIZE CONSTANT    K0604700
                    *                                                   K0604710
                    *             CONSTANT AND WORK AREA                K0604720
                    *                                                   K0604730
                    JCO10 DC      5         RANGE CHANGE CONSTANT       K0604740
                    JCO12 DC      /8000     SIGN CONSTANT               K0604750
                    DEC   DC      0         DECIMAL POINT TEMPORARY     K0604760
                    *                                                   K0604770
                    RC14  MDX  L  DEC,1     INCR PLACES AFTER DECML PT  K0604780
                    *                                                   K0604790
                    *             MULTIPLY CONSTANT BY 10               K0604800
                    *                                                   K0604810
                          SLA     16                                    K0604820
                          BSI  L  MULT      BR TO MULTIPLY SUBROUTINE   K0604830
                          MDX     RC13      BR TO NORMALIZE CONSTANT    K0604840
                    *                                                   K0604850
                    RC15  BSC  L  RC16,Z    BR TO NORMALIZE LEFT 1 BIT  K0604860
                          LDX   2 -3        NORMALIZE LEFT ONE WORD     K0604870
                          LD   L2 JANS+1    WORD TO MOVE LEFT           K0604880
                          STO  L2 JANS      STORE ONE WORD LEFT         K0604890
                          MDX   2 1         INCR MOVE COUNTER           K0604900
                          MDX     RC15+3    BR TO MOVE NEXT WORD        K0604910
                          SLA     16                                    K0604920
                          STO  L  JANS      ZERO LEAST SIGNIFICANT WORD K0604930
                          MDX  L  BIN,-16   DECR EXPONENT FOR WD SHIFT  K0604940
                          MDX     RC13      BR TO NORMALIZE CONSTANT IF K0604950
                          MDX     RC13      SKIP OR IF NO SKIP.         K0604960
                    *                                                   K0604970
                    *             NORMALIZE LEFT ONE BIT                K0604980
                    *                                                   K0604990
                    RC16  LDX   2 4         NUMBER OF WORDS TO SHIFT    K0605000
                          SLT     32        CLEAR ACC AND EXTENSION     K0605010
                          LD   L2 JANS-4    NEXT LEAST SIGNIFICANT WORD K0605020
                          RTE     31        EFFECTIVE SHIFT ONE LEFT    K0605030
                          STO  L2 JANS-4    RESTORE                     K0605040
                          SLT     15        ATTACH HIGH BIT TO NEXT WD  K0605050
                          MDX   2 -1        DECR CNT AND SKIP IF ZERO   K0605060
                          MDX     RC16+2    BR TO LOAD NEXT WD TO SHIFT K0605070
                          MDX  L  BIN,-1    DECR BINARY EXPONENT AND    K0605080
                          MDX     RC13      BRANCH TO NORMALIZE IF SKIP K0605090
                          MDX     RC13      OR NO SKIP.                 K0605100
                    *                                                   K0605110
                    *             NORMALIZE RIGHT ONE BIT               K0605120
                    *                                                   K0605130
                    RC17  LDX   2 -5        MINUS NO. OF WDS TO SHIFT   K0605140
                          SLT     32        CLEAR ACC AND EXTENSION     K0605150
                          LD   L2 JANS+1    NEXT MOST SIGNIFICANT WORD  K0605160
                          RTE     1         SHIFT ONE RIGHT             K0605170
                          STO  L2 JANS+1    RESTORE                     K0605180
                          RTE     15        ATTACH LOW BIT TO NEXT WORD K0605190
                          MDX   2 1         INCT CNT AND SKIP IF ZERO   K0605200
                          MDX     RC17+2    BR TO LOAD NEXT WD TO SHIFT K0605210
                          MDX  L  BIN,1     INCR BINARY EXPONENT AND    K0605220
                          MDX     RC13      BRANCH TO NORMALIZE IF SKIP K0605230
                          MDX     RC13      OR NO SKIP.                 K0605240
                    *                                                   K0605250
                    *             BINARY EXPONENT RANGE CHECK           K0605260
                    *                                                   K0605270
                    RC18  LD      BIN       BINARY EXPONENT             K0605280
                          BSC  L  JBR,+Z    BR ERR IF LESS THAN ZERO    K0605290
                          S       JCO14     DECIMAL 256                 K0605300
                          BSC  L  JBR,-     BR ERR GREATER THAN 255     K0605310
                    *                                                   K0605320
                    *             CHECK IF EXTENDED PRECISION REQUIRED  K0605330
                    *                                                   K0605340
                    RC19  LD   L  CCWD      CONTROL CARD WORD           K0605350
                          SLA     13        EXTENDED INDR INTO SIGN POS K0605360
                          BSC  L  RC20,-    BR NOT EXTENDED PRECISION   K0605370
                    *                                                   K0605380
                    *             COMBINE EXTENDED CONSTANT             K0605390
                    *                                                   K0605400
                          LDD     JANS-3    TWO MOST SIGNIFICANT WORDS  K0605410
                          SRT     1         VACATE SIGN POSITION        K0605420
                          BSC     Z         MAKE SIGN PLUS              K0605430
                          EOR     MASK                                  K0605440
                          STD     JANS-3    RESTORE MANTISSA PORTION    K0605450
                          LD      BIN       BINARY EXPONENT             K0605460
                          OR      MASK      REAL CONSTANT INDICATOR     K0605470
                          STO     JANS-1    STORE EXPONENT-ID WORD      K0605480
                          MDX     RC21      BR TO CHECK DATA STMNT SW   K0605490
                    *                                                   K0605500
                    *             COMBINE STANDARD CONSTANT             K0605510
                    *                                                   K0605520
                    RC20  LDD     JANS-3    TWO MOST SIGNIFICANT WORDS  K0605530
                          SRT     1         VACATE SIGN POSITION        K0605540
                          BSC     Z         MAKE SIGN PLUS              K0605550
                          EOR     MASK                                  K0605560
                          RTE     16        LEAST SIGNIFICANT WD TO ACC K0605570
                          AND     MASK1     CUT OFF LOWER EIGHT BITS    K0605580
                          OR      BIN       EXPONENT INTO LOW 8 BITS    K0605590
                          RTE     16        MOST SIGNIFICANT WD TO ACC  K0605600
                          STD     JANS-3    COMPLETED STANDARD CONSTANT K0605610
                          LD      MASK      REAL CONSTANT INDICATOR     K0605620
                          STO     JANS-1    SYMBOL TABLE ID WORD        K0605630
                    *                                                   K0605640
                    *             CHECK FOR OPEN STRING                 K0605650
                    *                                                   K0605660
                    RC21  LD      SW7       DATA STMNT SWITCH           K0605670
                          BSC  L  RC22,Z    BR TO OPEN STRING           K0605680
                    *                                                   K0605690
                    *             CHECK FOR CONSTANT IN SYMBOL TABLE    K0605700
                    *                                                   K0605710
                          LDX  I3 SOFNS     START OF NON-STMNT NUMBERS  K0605720
                          MDX     HACK      BR TO CHECK END OF SEARCH   K0605730
                    LOOP  LD    3 1         NEXT SYMBOL TABLE ENTRY     K0605740
                          S       JANS-3    FIRST HALF OF CONSTANT      K0605750
                          BSC     Z         SKIP NEXT IF EQUAL          K0605760
                          MDX     EAT       BR NOT EQUAL - CONTINUE     K0605770
                          LD    3 2         SECOND HALF OF TABLE ENTRY  K0605780
                          S       JANS-2    SECOND HALF OF CONSTANT     K0605790
                          BSC  L  EAT,Z     BR NOT EQUAL - CONTINUE     K0605800
                          LD    3 0         SYMBOL TABLE ID WORD        K0605810
                          S       JANS-1    CHK LOW 8 EQUAL (EXPONENT   K0605820
                          SLA     8         IF EXTENDED PRECISION).     K0605830
                          BSC  L  RC22,+-   BR IF CONSTANT FOUND        K0605840
                    EAT   MDX   3 -3        DECR TABLE SEARCH ADDRESS   K0605850
                    HACK  STX   3 SAVE      INDEX REGISTER 3 TEMPORARY  K0605860
                          LD      SAVE      CURRENT SEARCH ADDRESS      K0605870
                          S    L  EOFST     END OF SYMBOL TABLE ADDRESS K0605880
                          BSC     Z         SKIP NEXT IF END OF SEARCH  K0605890
                          MDX     LOOP      BR TO CONTINUE SEARCH       K0605900
                    *                                                   K0605910
                    *             PUT CONSTANT IN SYMBOL TABLE          K0605920
                    *                                                   K0605930
                          LD      JANS-1    ID WORD                     K0605940
                          STO   3 0         SYMBOL TABLE ID WORD        K0605950
                          LD      JANS-2    LEAST SIGNIFICANT HALF CON  K0605960
                          STO   3 2                                     K0605970
                          LD      JANS-3    MOST SIGNIFICANT HALF CON   K0605980
                          STO   3 1                                     K0605990
                          MDX  L  EOFST,-3  DECR END OF STRING ADDRESS  K0606000
                          MDX  L  SOFXT,-3  DECR START OF SUBSC TEMPS   K0606010
                          MDX  L  SOFGT,-3  DECR START GENERATED TEMPS  K0606020
                    *                                                   K0606030
                    *             CHECK FOR SYMBOL TABLE OVERLAP        K0606040
                    *                                                   K0606050
                          LD   L  EOFST     END OF SYMBOL TABLE ADDRESS K0606060
                          A    L  TWO       TWO                         K0606070
                          S    L  EOFS      END OF STRING ADDRESS       K0606080
                          BSC  L  RC22,-    BR IF NO ERROR              K0606090
                          MDX  L  ERROR,1   SET OVERLAP ERROR ON        K0606100
                    *                                                   K0606110
                    *             GO TO NEXT PHASE                      K0606120
                    *                                                   K0606130
                    OUT   LDX  I1 NXTPH+1   LOAD PARAM FOR READING      K0606140
                          LDD     NXTPH+2   NEXT PHASE                  K0606150
                          BSC  L  ROL       BR TO READ NEXT PHASE       K0606160
                          BSS  E  0         MAKE ADDR BOUNDARY EVEN     K0606170
                    NXTPH DC      37        ID OF NEXT PHASE            K0606180
                          BSS     3         LOADER TABLE FOR NEXT PHASE K0606190
                    *                                                   K0606200
                    *             CONSTANTS AND WORK AREA               K0606210
                    *                                                   K0606220
                    TT    DC      0         STATEMENT POINTER TEMPORARY K0606230
                          BSS  E  0         MAKE ADDR BOUNDARY EVEN     K0606240
                    MASK  DC      /8000     SIGN BIT CONSTANT           K0606250
                    MASK1 DC      /FF00     EXPONENT BIT MASK           K0606260
                    JCO14 DC      256       EXPONENT LIMIT CONSTANT     K0606270
                    JCO16 DC      3         SYMBOL TABLE MULTIPLE CON   K0606280
                    BIN   DC      0         BINARY EXPONENT             K0606290
                          DC      0         FIVE                        K0606300
                          DC      0             WORD                    K0606310
                          DC      0                 REAL                K0606320
                          DC      0                     CONSTANT        K0606330
                    JANS  DC      0                             BUFFER  K0606340
                    S     DC      0         STMNT POINTER TEMPORARY     K0606350
                    SW7   DC      *-*       OPEN STRING SWITCH          K0606360
                    SAVE  DC      0         INDEX REGISTER 3 TEMPORARY  K0606370
                    *                                                   K0606380
                    *             CHECK TO OPEN STRING                  K0606390
                    *                                                   K0606400
                    RC22  LD      TT        CURRENT STMNT POINTER       K0606410
                          STO     RC22A+1                               K0606420
                          MDX  L  TT,4      INCR STMNT POINTER          K0606430
                          LD      SW7       DATA STMNT SWITCH           K0606440
                          BSC  L  RC22A,+-  BR IF NOT DATA STMNT        K0606450
                          MDX  L  TT,1      ADJUST IT FOR 5 OR 6 WORDS  K0606460
                          LD   L  CCWD      DEPENDING ON WHETHER        K0606470
                          SLA     13        PRECISION IS EXTENDED OR    K0606480
                          BSC  L  *+2,-     STANDARD.                   K0606490
                          MDX  L  TT,1      INCR ONE MORE FOR EXTENDED  K0606500
                          LD      TT        CURRENT STRING POINTER      K0606510
                          S       S         NEXT STMNT ADDR             K0606520
                          BSC  L  OPEN,-Z   BR TO OPEN STRING IF PLUS   K0606530
                    RC22A LDX  L1 *-*       CURRENT STMNT POINTER       K0606540
                          LD      SW7       DATA STMNT SWITCH           K0606550
                          BSC  L  DATA,Z    BR IF DATA STMNT            K0606560
                    *                                                   K0606570
                    *             PUT CONSTANT AND OPERATOR ON STRING   K0606580
                    *                                                   K0606590
                          LD      CONOP     OPERATOR                    K0606600
                          STO   1 1         STORE ON STRING             K0606610
                          STX   3 SAVE      REGISTER 3 TO TEMPORARY     K0606620
                          LD   L  SOFST     START OF SYMBOL TABLE ADDR  K0606630
                          S       SAVE      CURRENT SYMBOL TBL ADDRESS  K0606640
                          SRT     16        FORM NORMAL DIVIDEND        K0606650
                          D    L  JCO16     THREE                       K0606660
                          A       SIGN1     SYMBOL TABLE POINTER        K0606670
                          STO   1 2         STORE ON STRING             K0606680
                          MDX   1 3         MOVE STMNT POINTER          K0606690
                    *                                                   K0606700
                    *             CHECK IF STATEMENT CLOSURE REQUIRED   K0606710
                    *                                                   K0606720
                    RC22B LD      TT        CURRENT STMNT POINTER       K0606730
                          S       S         NEXT STMNT ADDRESS          K0606740
                          BSC  L  REDOS,-   BR IF NO CLOSURE REQUIRED   K0606750
                    *                                                   K0606760
                    *             CLOSE UP STATEMENT                    K0606770
                    *                                                   K0606780
                          STO     NUMB      NUMBER OF WORDS TO CLOSE    K0606790
                    NUMM  LDX  I2 S         ADDR FIRST WD AFTER GAP     K0606800
                          LD    2 -1        NEXT WD TO MOVE BACK        K0606810
                          S       SEMIC     SEMICOLON                   K0606820
                          BSC  L  OUTT,+-   BR TO END CLOSURE IF ZERO   K0606830
                          LD    2 -1        MOVE WORD TO CLOSE STMNT    K0606840
                          STO   1 0                                     K0606850
                          MDX   1 1         INCR STMNT POINTER          K0606860
                          MDX   2 1         INCR CLOSE POINTER          K0606870
                          MDX     NUMM+2    BR TO CONTINUE CLOSING      K0606880
                    OUTT  A       SEMIC     SEMICOLON                   K0606890
                          STO   1 0         MOVE LAST WORD              K0606900
                          MDX  L  SW6,1     SET STRING CLOSURE SW ON    K0606910
                          LD      CNT       ADJUST STMNT WORD COUNT     K0606920
                          S       NUMB      BY THE AMOUNT OF CLOSURE    K0606930
                          STO     CNT       AND RESTORE.                K0606940
                    *                                                   K0606950
                    *             INITIALIZE POINTER                    K0606960
                    *                                                   K0606970
                    REDOS LDX  I1 TT        CURRENT STMNT POINTER       K0606980
                          MDX   1 -1                                    K0606990
                          STX   1 TT        SAVE IN TEMPORARY           K0607000
                          MDX  L  SW16,1    SET SW16 NOT FIRST CONSTANT K0607010
                          BSC  L  Z3        BR TO LOOK FOR OPERATOR     K0607020
                    *                                                   K0607030
                    *             OPEN STATEMENT                        K0607040
                    *                                                   K0607050
                    OPEN  LDX  I1 EOFS      END OF STRING ADDRESS       K0607060
                          LDX  I2 EOFS                                  K0607070
                          STO     *+1       NUMBER OF WORDS TO OPEN     K0607080
                          MDX  L2 *-*       INCR BY NO. OF WDS TO OPEN  K0607090
                    OPAMT EQU     *-1       LABEL FOR ADDR LAST COMMAND K0607100
                          STX  L2 EOFS      NEW END OF STRING ADDRESS   K0607110
                          LD   L  EOFS                                  K0607120
                          S       TT        CURRENT STMNT POINTER       K0607130
                          STO     *+1       NUMBER OF WORDS TO MOVE     K0607140
                          LDX  L3 *-*                                   K0607150
                          MDX   3 2                                     K0607160
                          LD    1 0         MOVE STRING TO OPEN         K0607170
                          STO   2 0                                     K0607180
                          MDX   1 -1        DECR MOVE FROM ADDR         K0607190
                          MDX   2 -1        DECR MOVE TO ADDR           K0607200
                          MDX   3 -1        DECR NO. OF WDS TO MOVE     K0607210
                          MDX     *-6       BR TO CONTINUE OPENING      K0607220
                          LD   I  IDSAV     STMNT ID WORD               K0607230
                          SRT     2                                     K0607240
                          A       OPAMT     NO. WDS ADDED TO STMNT      K0607250
                          SLT     2                                     K0607260
                          STO  I  IDSAV     UPDATED STMNT ID WORD       K0607270
                    *                                                   K0607280
                    *             CHECK FOR OVERLAP ERROR               K0607290
                    *                                                   K0607300
                          LD   L  EOFS      END OF STRING ADDRESS       K0607310
                          S    L  EOFST     END OF SYMBOL TABLE         K0607320
                          BSC  L  RC22A,+   BR IF NO OVERLAP ERROR      K0607330
                          MDX  L  ERROR,1   SET OVERLAP ERROR ON        K0607340
                          BSC  L  OUT       BR TO READ NEXT PHASE       K0607350
                    *                                                   K0607360
                    *             CHECK PRECISION OF CONSTANT           K0607370
                    *                                                   K0607380
                    DATA  LD   L  CCWD      CONTROL CARD WORD           K0607390
                          SLA     13        PRECISION BIT TO SIGN POS   K0607400
                          BSC  L  DATA1,-   BR IF STANDARD PRECISION    K0607410
                    *                                                   K0607420
                    *             PLACE EXTENDED CONSTANT ON STRING     K0607430
                    *                                                   K0607440
                          LD      JANS-1    BINARY EXPONENT AND ID      K0607450
                          EOR     MASK      REMOVE REAL CONSTANT TAG    K0607460
                          STO   1 2         BINARY EXPONENT ONLY        K0607470
                          LD      JANS-3    MOST SIGNIFICANT HALF CON   K0607480
                          STO   1 3                                     K0607490
                          LD      JANS-2    LEAST SIGNIFICANT HALF CON  K0607500
                          STO   1 4                                     K0607510
                          LD      CONOP     OPERATOR                    K0607520
                          STO   1 1         PLACE ON STRING             K0607530
                          MDX   1 5         INCR STMNT POINTER          K0607540
                          MDX     RC22B     BR TO CHK IF CLOSE REQUIRED K0607550
                    *                                                   K0607560
                    *             PLACE STANDARD CONSTANT ON STRING     K0607570
                    *                                                   K0607580
                    DATA1 LD   L  JANS-3    MOST SIGNIFICANT HALF CON   K0607590
                          STO   1 2                                     K0607600
                          LD   L  JANS-2    LEAST SIGNIFICANT HALF CON  K0607610
                          STO   1 3                                     K0607620
                          LD      CONOP     OPERATOR                    K0607630
                          STO   1 1         PLACE ON STRING             K0607640
                          MDX   1 4         INCR STMNT POINTER          K0607650
                          MDX     RC22B     BR TO CHK IF CLOSE REQUIRED K0607660
                    *                                                   K0607670
                    *             CONSTANTS AND WORK AREA               K0607680
                    *                                                   K0607690
                    CONOP DC      /5E       CONSTANT OPERATOR           K0607700
                    SIGN1 DC      /8001     SYMBOL TABLE PT CONSTANT    K0607710
                    NUMB  DC      0         NO. OF WDS TO CLOSE TEMP    K0607720
                    CNT   DC      0         NO. OF WDS IN STMNT TEMP    K0607730
                    TWO   DC      2         DECIMAL TWO CONSTANT        K0607740
                    SEMIC DC      /001E     SEMICOLON CONSTANT          K0607750
                    *                                                   K0607760
                    *             CLOSE UP STRING                       K0607770
                    *                                                   K0607780
                    CLSUP STX   1 NUMB      CURRENT STMNT ADDRESS       K0607790
                          LD      NUMB                                  K0607800
                          A       CNT       NO. OF WORDS IN STMNT       K0607810
                          STO     *+1                                   K0607820
                    X2    LDX  L2 0         ADDR NEXT STMNT ON STRING   K0607830
                          LD   L  EOFS      END OF STRING ADDR          K0607840
                          S       X2+1      ADDR OF NEXT STMNT          K0607850
                          STO     *+1                                   K0607860
                          LDX  L3 0                                     K0607870
                          MDX   3 1         NO. OF WORDS TO MOVE        K0607880
                    LOOPY LD    2 0         NEXT WD TO MOVE TO CLOSE    K0607890
                          STO   1 0         CLOSE UP STRING             K0607900
                          MDX   2 1         INCR MOVE FROM ADDR         K0607910
                          MDX   1 1         INCR MOVE TO ADDR           K0607920
                          MDX   3 -1        DECR WDS TO MOVE COUNTER    K0607930
                          MDX     LOOPY     BR TO CONTINUE CLOSING      K0607940
                          STX  L1 EOFS      NEW END OF STRING ADDRESS   K0607950
                          LDX  I1 NUMB      RESTORE CURRENT STMNT ADDR  K0607960
                          MDX  L  EOFS,-1   ADJUST END OF STRING ADDR   K0607970
                          LD   I  IDSAV     STMNT ID WORD- ADJUST NORM  K0607980
                          SRT     2         RIGHT JUSTIFY NORM          K0607990
                          S       CNT       REDUCE NORM BY CLOSE AMOUNT K0608000
                          SLT     2         REPOSITION TO NORMAL FORM   K0608010
                          STO  I  IDSAV     RESTORE STMNT ID WORD       K0608020
                          MDX   1 1         INCR STMNT POINTER          K0608030
                          SLA     16        CLEAR ACCUMULATOR           K0608040
                          STO     CNT       ZERO CNT                    K0608050
                          STO  L  SW6       ZERO STRING CLOSURE SWITCH  K0608060
                          BSC  L  ORGIN+2   BR TO INITIALIZE PHASE      K0608070
                    *                                                   K0608080
                    *             CONSTANTS AND WORK AREA               K0608090
                    *                                                   K0608100
                    JN7   DC      10        DECIMAL TEN MPY CONSTANT    K0608110
                          BSS  E  0         MAKE ADDRESS BOUNDARY EVEN  K0608120
                    JCO20 DC      0         PARTIAL PRODUCT TEMPORARY   K0608130
                          DC      0         PARTIAL PRODUCT TEMPORARY   K0608140
                    QCON1 DC      0         CHARACTER UNPACK TEMPORARY  K0608150
                          DC      0         CHARACTER UNPACK TEMPORARY  K0608160
                    QCON2 DC      0         NEXT CHARACTER TEMPORARY    K0608170
                    QSIGN DC      /7E00     6 BIT CHARACTER MASK        K0608180
                    QCON3 EQU     QSIGN                                 K0608190
                    SW12  DC      0         WORD IN BUFFER SWITCH       K0608200
                    SW14  DC      0         FIRST OF TWO WDS SWITCH     K0608210
                    ABT   DC      0         CHARACTER POSITION POINTER  K0608220
                    *                                                   K0608230
                    *             SUBROUTINE TO GET CHARACTERS          K0608240
                    *                                                   K0608250
                    GET   DC      0         RETURN ADDRESS              K0608260
                          MDX  L  GCNT,1    INCR CONSTANT CHARACTER CNT K0608270
                          LD      SW12      WORDS IN BUFFER SWITCH      K0608280
                          BSC  L  QAA,Z     BR IF WORDS IN BUFFER       K0608290
                    QAB   LDX   2 2         SET INDEX REG TO 2          K0608300
                          STX   2 ABT       CHARACTER POINTER EQUAL 2   K0608310
                          LD    1           NEXT STMNT WORD             K0608320
                          BSC  L  QAC,-     BR IF OPERATOR              K0608330
                          MDX  L  SW12,1    SET SW12 ON, GET NEXT 2 WD  K0608340
                          LD    1 1         LAST HALF OF NEXT 2 WD      K0608350
                          RTE     16        SHIFT TO EXTENSION          K0608360
                          SLT     1         SHIFT OUT NON-CHARACTER BIT K0608370
                          LD    1           FIRST HALF OF NEXT 2 WD     K0608380
                          STD     QCON1     TEMPORARY                   K0608390
                          MDX   1 1         MOVE POINTER                K0608400
                    QAE   LDD     QCON1     CHARACTER BUFFER            K0608410
                          AND     QSIGN     EXTRACT NEXT CHARACTER      K0608420
                          BSC  L  QAG,+-    BR IF NO CHARACTER          K0608430
                    SQAG  LDD     QCON1     CHARACTER BUFFER            K0608440
                          STO     QCON2     HIGH WORD                   K0608450
                          SLT     6         SHIFT OFF HIGH CHARACTER    K0608460
                          STD     QCON1     RESTORE TO BUFFER           K0608470
                          LD      QCON2     HIGH WORD                   K0608480
                          AND     QCON3     EXTRACT NEXT CHARACTER      K0608490
                          SRA     9         RIGHT JUSTIFY CHARACTER     K0608500
                    QAD   BSC  I  GET       RETURN WITH CHAR IN ACC     K0608510
                    QAC   MDX   1 1         MOVE STMNT POINTER          K0608520
                          MDX     QAD       BR TO RETURN                K0608530
                    QAA   MDX  L  ABT,-1    DECR CHAR POINTER           K0608540
                          MDX     QAE       BR TO GET NEXT CHAR IF ANY  K0608550
                          MDX   1 1         MOVE POINTER                K0608560
                          LD      SW14      FIRST OF 2 WORD SWITCH      K0608570
                          BSC  L  QAF,+-    BR IF WORKING ON FIRST OF 2 K0608580
                    QAH   MDX   1 -1        DECR STMNT POINTER          K0608590
                    QAG   SLA     16        CLEAR ACC                   K0608600
                          STO     SW14      SET SW14 TO FIRST OF TWO    K0608610
                          STO     SW12      SET SW12 NO WDS IN BUFFER   K0608620
                          MDX     QAB       BR TO SET CHAR POINTER =2   K0608630
                    QAF   LD    1 -1        BACK UP PT TO OPERATOR      K0608640
                          BSC  L  QAH,-     BR TO BACK UP POINTER       K0608650
                          LDX   2 3                                     K0608660
                          STX   2 ABT       SET CHAR PT =3              K0608670
                          MDX  L  SW14,1    SET SW14 TO SECOND OF TWO   K0608680
                          MDX     QAE       BR TO GET NEXT CHAR IF ANY  K0608690
                    *                                                   K0608700
                    *             SUBROUTINE TO MULTIPLY 5 WORD         K0608710
                    *             CONSTANT BY 10 AND ADD CONTENT OF ACC K0608720
                    *                                                   K0608730
                    MULT  DC      0         RETURN ADDRESS              K0608740
                          STO     JCO20+1   NUMBER TO ADD TO PRODUCT    K0608750
                          LDX   2 5         NO. WDS TO MPY COUNTER      K0608760
                          LD   L2 JANS-5    NEXT LEAST SIGNIFICANT WORD K0608770
                          M       JN7       MPY BY 10                   K0608780
                          BSC     +Z        SKIP NEXT IF PLUS OR ZERO   K0608790
                          A       JN7       ADD 10                      K0608800
                          AD      JCO20     ADD MOST HSLF LAST PRODUCT  K0608810
                          STO     JCO20+1   STORE MOST SIGNIFICANT 16   K0608820
                          SLT     16        LEAST SIGNIFICANT 16 BITS   K0608830
                          STO  L2 JANS-5    RESTORE CONSTANT            K0608840
                          MDX   2 -1        DECR COUNTER                K0608850
                          MDX     MULT+3    BR TO CONTINUE MPY          K0608860
                          BSC  I  MULT      RETURN                      K0608870
                    *                                                   K0608880
                    *             END OF PHASE 06                       K0608890
                    *                                                   K0608900
                          BSS     BPHAR+PHLEN*320-*-1 PATCH AREA    2-9 K0608910
                          DC      0                                     K0608920
                          END     BPHAR-2                               K0608930
