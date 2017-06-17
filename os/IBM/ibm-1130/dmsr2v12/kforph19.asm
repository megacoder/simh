                          HDNG    1130 FORTRAN COMPILER PHASE 19        K1900010
                    *************************************************** K1900020
                    *STATUS - VERSION 2, MODIFICATION 12              * K1900030
                    *                                                 * K1900040
                    *FUNCTION/OPERATION                               * K1900050
                    *   * LOADS THE SYSTEM PRINT SUBROUTINE FOR PHASES* K1900060
                    *     19-24. ALSO PROVIDES THE PRINT INTERFACE.   * K1900070
                    *     SUBROUTINE FOR THESE PHASES.                * K1900080
                    *   * ALLOCATES STORAGE FOR COMMON VARIABLES.     * K1900090
                    *   * ALLOCATES ALL STORAGE ASSIGNMENTS ALIGNED   * K1900100
                    *     ACCORDING TO EQUIVALENCE STATEMENTS.        * K1900110
                    *   * ASSIGNS ALL ALLOCATIONS ACCORDING TO THE    * K1900120
                    *     SPECIFIED PRECISION OF THE PROGRAM.         * K1900130
                    *   * PRINTS THE ALLOCATIONS OF THE VARIABLES AS  * K1900140
                    *     THEY ARE ASSIGNED IF REQUIRED.              * K1900150
                    *   * COMPUTES THE CORE REQUIREMENTS FOR CONSTANTS* K1900160
                    *     AFTER ALL DEFINED VARIABLES HAVE BEEN       * K1900170
                    *     ALLOCATED. THE CORE REQUIREMENTS FOR        * K1900180
                    *     VARIABLES AND FOR COMMON ARE THEN STORED IN * K1900190
                    *     THE FORTRAN COMMUNICATIONS AREA (FCOM).     * K1900200
                    *                                                 * K1900210
                    *ENTRY POINTS-                                    * K1900220
                    *   * NEQ  - ENTERED VIA A CALL TO THE              K1900230
                    *            ROL SUBROUTINE FROM PHASE 18.        * K1900240
                    *                                                 * K1900250
                    *INPUT-                                           * K1900260
                    *   * STRING AREA                                 * K1900270
                    *   * SYMBOL TABLE AREA                           * K1900280
                    *   * FCOM                                        * K1900290
                    *                                                 * K1900300
                    *OUTPUT-                                          * K1900310
                    *   * STRING AREA                                 * K1900320
                    *   * SYMBOL TABLE AREA                           * K1900330
                    *   * FCOM                                        * K1900340
                    *   * LISTING ON PRINCIPAL PRINTER                * K1900350
                    *                                                 * K1900360
                    *EXTERNAL REFERENCES-                             * K1900370
                    *   SUBROUTINES-                                  * K1900380
                    *      * DZ000                                    * K1900390
                    *      * ROL                                      * K1900400
                    *      * PRINCIPAL PRINT SUBR (AT OVERP)          * K1900410
                    *   COMMA/DCOM                                    * K1900420
                    *      * $CH12                                    * K1900430
                    *      * $PBSY                                    * K1900440
                    *      * $PHSE                                    * K1900450
                    *      * $DBSY                                    * K1900460
                    *                                                 * K1900470
                    *                                                 * K1900480
                    *EXITS-                                           * K1900490
                    *   NORMAL-                                       * K1900500
                    *      EXIT TO NEXT PHASE VIA ROL SUBROUTINE      * K1900510
                    *   ERROR-                                        * K1900520
                    *      N/A                                        * K1900530
                    *                                                 * K1900540
                    *TABLES/WORK AREAS                                * K1900550
                    *   * FCOM                                        * K1900560
                    *   * STRING AREA                                 * K1900570
                    *   * SYMBOL TABLE AREA                           * K1900580
                    *                                                 * K1900590
                    *ATTRIBUTES-                                      * K1900600
                    *   N/A                                           * K1900610
                    *                                                 * K1900620
                    *NOTES-                                           * K1900630
                    *   ERRORS DETECTED IN THIS PHASE -65,66,67,86,99 * K1900640
                    *                                                 * K1900650
                    *************************************************** K1900660
                          ABS                                           K1900670
                    *                                                   K1900680
                    *                  SYSTEM EQUATES                   K1900690
                    MEMRY EQU     /8000     MEMORY SIZE                 K1900700
                    OVERL EQU     MEMRY-1501 START OF FCOM          2-4 K1900710
                    PHID  EQU     49         PHASE ID                   K1900720
                    ROL   EQU     MEMRY-68   ENTRY TO PHASE ROLLER RTN  K1900730
                    *                                                   K1900740
                    *                  PRINT ROUTINE EQUATES            K1900750
                    HEAD  EQU     ROL-49     PAGE HEADER AREA           K1900760
                    OVERP EQU     HEAD-327-2 DEVICE PRINT RTN AREA      K1900770
                    DZ000 EQU     /F2        DISKZ ENTRY POINT          K1900780
                    $DBSY EQU     /EE        NON-ZERO WHEN DISKZ BUSY   K1900790
                    $CH12 EQU     /06        INDICATOR FOR CHANNEL 12   K1900800
                    *                                                   K1900810
                    $PBSY EQU     /36        NON-ZERO IF PRINTER BUSY   K1900820
                    *                        *NEGATIVE IF BUFFER FREE   K1900830
                    $PHSE EQU     /78       ID OF PHASE IN CORE         K1900840
                          HDNG    1130 FORTRAN COMPILER PHASE 19        K1900850
                    *************************************************** K1900860
                    *                                                 * K1900870
                    *                  FORTRAN COMMUNICATION AREA     * K1900880
                    *                                                 * K1900890
                    *************************************************** K1900900
                          ORG     OVERL     FCOM ORIGIN                 K1900910
                    ORG   BSS     1    ORIGIN ADDRESS               2-4 K1900915
                    SOFS  BSS     1          START OF STRING            K1900920
                    EOFS  BSS     1    END OF STRING                    K1900930
                    SOFST BSS     1    START OF SYMBOL TABLE            K1900940
                    SOFNS BSS     1    START OF NON-STATEMENT NUMBERS   K1900950
                    SOFXT BSS     1    SIZE OF WORK AREA                K1900960
                    SOFGT BSS     1    SIZE OF CONSTANT AREA            K1900970
                    EOFST BSS     1    END OF SYMBOL TABLE              K1900980
                    COMON BSS     1    HIGH CORE COMMON ADDRESS         K1900990
                    CSIZE BSS     1    SIZE OF COMMON                   K1901000
                    ERROR BSS     1    OVERLAP ERROR INDICATOR          K1901010
                    FNAME BSS     2    PROGRAM NAME                     K1901020
                    SORF  BSS     1    SUBROUTINE(-) OR FUNCTION(+)     K1901030
                    CCWD  BSS     1    CONTROL CARD WORD                K1901040
                    *                       BIT 15 TRANSFER TRACE       K1901050
                    *                       BIT 14 ARITHMETIC TRACE     K1901060
                    *                       BIT 13 EXTENDED PRECISION   K1901070
                    *                       BIT 12 LIST SYMBOL TABLE    K1901080
                    *                       BIT 11 LIST SUBP NAMES      K1901090
                    *                       BIT 10 LIST SOURCE PROGRAM  K1901100
                    *                       BIT  9 ONE WORD INTEGERS    K1901110
                    *                      BIT  8 ORIGIN            2-4 K1901120
                    *                      BIT  7-0 UNUSED          2-4 K1901125
                    *                                                   K1901130
                    IOCS  BSS     1    IOCS CONTROL CARD WORD           K1901140
                    *                       BIT 15 CARD                 K1901150
                    *                       BIT 14 PAPERTAPE            K1901160
                    *                       BIT 13 TYPEWRITER           K1901170
                    *                       BIT 12 1403 PRINTER         K1901180
                    *                       BIT 11 2501 READER          K1901190
                    *                       BIT 10 KEYBOARD             K1901200
                    *                       BIT  9 1442 PUNCH           K1901210
                    *                       BIT  8 DISK                 K1901220
                    *                       BIT  7 1132 PRINTER         K1901230
                    *                       BIT  6 UNASSIGNED           K1901240
                    *                       BIT  5 UNASSIGNED           K1901250
                    *                       BIT  4 UNASSIGNED           K1901260
                    *                       BIT  3 PLOTTER              K1901270
                    *                       BIT  2 UNASSIGNED           K1901280
                    *                       BIT  1 UNFORMATTED DISK     K1901290
                    *                       BIT  0 UNASSIGNED           K1901300
                    *                                                   K1901310
                    DFCNT BSS     1    DEFINE FILE COUNT                K1901320
                    *************************************************** K1901330
                    *                                                 * K1901340
                    *                  END OF FORTRAN COMMUNICATION   * K1901350
                    *                  AREA                           * K1901360
                    *                                                 * K1901370
                    *************************************************** K1901380
                          HDNG    1130 FORTRAN COMPILER PHASE 19        K1901390
                    *************************************************** K1901400
                    *                                                 * K1901410
                    *                  PRINT AREA                     * K1901420
                    *                                                 * K1901430
                    *************************************************** K1901440
                    *                                                   K1901450
                    *                  INFORMATION FOR SYSTEM LOADER    K1901460
                    BPHAR EQU     *+2       BEGIN PHASE AREA            K1901470
                          DC      0          WORK AREA FOR LOADER       K1901480
                          DC      -PHID      NEGATIVE PHASE ID          K1901490
                          DC      SSLET-*+1  DISPLACEMENT TO SLET STORE K1901500
                          DC      2          COUNT OF SLET ENTRIES      K1901510
                          ORG     *-2                                   K1901520
                    *                                                   K1901530
                    *                  THIS WORD IS USED TO HOLD THE    K1901540
                    *                  VALUE FOR INDEX REGISTER 3       K1901550
                    *                  SO AS TO ALLOW THE PRINT ROUTINE K1901560
                    *                  TO RESTORE INDEX REGISTER 3      K1901570
                    *                  AFTER CALLING THE SYSTEM PRINT   K1901580
                    *                  ROUTINE                          K1901590
                    NEQ   MDX     IP010     SAVE XR3 HERE               K1901600
                    *                                                   K1901610
                    *                  THE FOLLOWING IS THE PRINT       K1901620
                    *                  AREA PART OF WHICH IS USED FOR   K1901630
                    *                  INITIAL PROGRAM EXECUTED ONLY    K1901640
                    *                  ONCE AT THE START OF THE PHASE.  K1901650
                          DC      *-*        AVAILABLE                  K1901660
                    WDCNT DC      *-*       PRINT AREA WORD COUNT       K1901670
                    PAREA EQU     *         BEGINING OF PRINT AREA      K1901680
                    *                                                   K1901690
                    *                  SET INDEX REGISTER 3 TO POINT    K1901700
                    *                  AT THE LITERAL POOL AND          K1901710
                    *                  SUBROUTINES.                     K1901720
                    IP010 LDX   3 PHID                                  K1901730
                          STX  L3 $PHSE     STORE PHASE ID              K1901740
                    *                                                   K1901750
                          LDX  L3 X         LOAD XR3                    K1901760
                          STX   3 NEQ       SAVE FOR PRINT ROUTINE      K1901770
                    *                                                   K1901780
                    *             LOAD SYSTEM PRINT ROUTINE             K1901790
                    *                                                   K1901800
                    *                                                   K1901810
                          LDD  L  SSLET+2    LOAD PRINT RTN DISK ADR    K1901820
                          STD  L  OVERP      STORE INTO PRINT RTN AREA  K1901830
                          LDD     IP015      LOAD DISK READ PARAMETER   K1901840
                          BSI  L  DZ000      LOAD SYSTEM PRINT RTN      K1901850
                    IP014 LD   L  $DBSY      LOAD DISK BUSY INDICATOR   K1901860
                          BSC  L  IP016,+-   BRANCH IF NOT BUSY         K1901870
                          MDX     IP014      LOOP IF BUSY               K1901880
                    *                                                   K1901890
                          BSS  E  0                                     K1901900
                    IP015 DC      /7000      DISK READ PARAMETER        K1901910
                          DC      OVERP      ADDRESS OF PRINT RTN AREA  K1901920
                    *                                                   K1901930
                    IP016 EQU     *          CONTINUE                   K1901940
                    *                                                   K1901941
                          LD      CCWD       IS THIS AN             2-4 K1901942
                          SLA     8          ABSOLUTE PROGRAM       2-4 K1901943
                          BSC  L  IP018,-    NO - BRANCH            2-4 K1901944
                          STO   3 ORGSW-X    SET ORG SWITCH         2-4 K1901945
                          LD      SORF       IS IT A SUBPROGRAM     2-4 K1901946
                          BSC  L  IP018,+-   NO - BRANCH            2-4 K1901947
                          MDX  L  ERROR,16   YES - INDICATE ERR 85  2-4 K1901948
                    *                                                   K1901949
                    IP018 EQU     *          CONTINUE                   K1901950
                    *                                                   K1901951
                          LD      ERROR     LOAD ERROR INDICATOR    2-1 K1901960
                          BSC  L  EXIT,Z    BRANCH IF OVERLAP ERROR 2-1 K1901970
                    *                  INITIALIZE THE COMMA LIMITS.     K1901980
                          LD      COMON     INITIALIZE CSIZE WITH COMON K1901990
                          STO     CSIZE                                 K1902000
                    *                                                   K1902010
                    *                  INITIALIZE THE VARIABLE AREA     K1902020
                    *                  COUNT TO START ALLOCATION.       K1902030
                          LD      DFCNT     PLACE DEFINE FILE SIZE      K1902040
                          STO   3 VARCR-X   IN VARCR                    K1902050
                    *                                                   K1902060
                    *                  SET THE CORRECT REAL VARIABLE    K1902070
                    *                  SIZE IN RSIZE.                   K1902080
                          LD      CCWD      LOAD CONTROL CARD WORD      K1902090
                          SLA     13        PLACE PRECISION IN SIGN     K1902100
                          BSC  L  *+2,-     BRANCH IF STANDARD          K1902110
                          MDX  L  RSIZE,1   INCRAMENT RSIZE TO 3        K1902120
                    *                                                   K1902130
                    *                  SET THE CORRECT INTEGER VARIABLE K1902140
                    *                  SIZE IN ISIZE.                   K1902150
                          LD      CCWD      LOAD CONTROL CARD WORD      K1902160
                          SLA     9         PLACE ONE WORD INT IN SIGN  K1902170
                          BSC  L  *+2,+Z    BRANCH IF ONE WORD INTEGERS K1902180
                          LD    3 RSIZE-X   SET REAL AND INTEGER SAME   K1902190
                          STO   3 ISIZE-X                               K1902200
                    *                                                   K1902210
                    *                  LOAD INDEX REGISTE 1 TO LOOK FOR K1902220
                    *                  EQUIVALENCE STATEMENTS.          K1902230
                          LDX  I1 SOFS      LOAD XR1                    K1902240
                    *                                                   K1902250
                    *                  TEST TO SEE IF STATEMENT IS AN   K1902260
                    *                  EQUIVALENCE STATEMENT.           K1902270
                    IP020 LD    1 0         LOAD ID WORD                K1902280
                          AND   3 HF800-X   SAVE ONLY TYPE              K1902290
                          EOR   3 HA800-X   TEST FOR EQUIVALENCE        K1902300
                          BSC  L  IP030,+-  BRANCH IF EQUIVALENCE ST.   K1902310
                    *                                                   K1902320
                    *                  TEST TO SEE IF STATEMENT IS AN   K1902330
                    *                  END STATEMENT.                   K1902340
                          EOR   3 HB800-X   TEST FOR END                K1902350
                          BSC  L  ML010,+-  BRANCH IF END STATEMENT 2-1 K1902360
                    *                                                   K1902370
                    *                  MOVE INDEX REGISTER 1 TO THE     K1902380
                    *                  NEXT ID WORD.                    K1902390
                          LD    1 0         LOAD ID WORD                K1902400
                          AND   3 H07FC-X   SAVE STATEMENT NORM         K1902410
                          SRA     2         POSITION NORM               K1902420
                          STO     *+1       INITIALIZE MDX INSTRUCTION  K1902430
                          MDX  L1 *-*       ADJUST INDEX REGISTER 1     K1902440
                          MDX     IP020     BRANCH                      K1902450
                    *                                                   K1902460
                    *                  INITIALIZE THE START OF THE      K1902470
                    *                  EQUIVALENCE STATEMENTS IN INIT.  K1902480
                    IP030 MDX   1 2         INCREMENT XR1 BY 1          K1902490
                          STX  L1 IN01A+1   INITIALIZE INIT ROUTINE     K1902500
                    *                                                   K1902510
                    *                  SET ALLOCATION BITS TO REFLECT   K1902520
                    *                  COMMON FOR EQUIVALENCE STATEMENT K1902530
                    *             EVALUATION.                           K1902540
                          LD    3 H2022-X   PLACE ALLOCATION BITS       K1902550
                          STO   3 ALOCB-X   IN ALOCB                    K1902560
                    *                  BRANCH TO THE MAINLINE PROGRAM.  K1902570
                    IP999 MDX     ML010     BRANCH                      K1902580
                    *                                                   K1902590
                    *                  THIS IS THE HEADING -VARIABLE    K1902600
                    *                  ALLOCATION-.                     K1902610
                    TEXT  DC      /E500     V                           K1902620
                          DC      /C100     A                           K1902630
                          DC      /D900     R                           K1902640
                          DC      /C900     I                           K1902650
                          DC      /C100     A                           K1902660
                          DC      /C200     B                           K1902670
                          DC      /D300     L                           K1902680
                          DC      /C500     E                           K1902690
                          DC      /4000     BLANK                       K1902700
                          DC      /C100     A                           K1902710
                          DC      /D300     L                           K1902720
                          DC      /D300     L                           K1902730
                          DC      /D600     O                           K1902740
                          DC      /C300     C                           K1902750
                          DC      /C100     A                           K1902760
                          DC      /E300     T                           K1902770
                          DC      /C900     I                           K1902780
                          DC      /D600     O                           K1902790
                          DC      /D500     N                           K1902800
                          DC      /E200     S                           K1902810
                    *                                                   K1902820
                    *                  PRINT THE HEADING -VARIABLE      K1902830
                    *                  ALLOCATIONS-.                    K1902840
                    HD010 LDX  L3 TEXT      PLACE ADDRESS OF PRINT AREA K1902850
                          STX  L3 AREA                                  K1902860
                          LDX   3 10        PLACE WORD COUNT            K1902870
                          STX   3 WDCNT                                 K1902880
                          LD   I  $CH12     LOAD END OF PAGE IND    2-7 K1902882
                          BSI  I  NEWPG,Z   BRANCH IF END OF PAGE   2-7 K1902884
                          BSI  L  PRINT     CALL PRINT                  K1902890
                    *                                                   K1902900
                    *                  SET HTEST SWITCH TO INDICATE     K1902910
                    *                  THAT THE HEADING HAS BEEN        K1902920
                    *                  PRINTED.                         K1902930
                          STX   0 HTEST     INDICATE HEADING PRINTED    K1902940
                    *                                                   K1902950
                    *                  RESET THE PRINT AREA ADDRESS     K1902960
                    *                  AND WORD COUNT.                  K1902970
                          LD    3 H003C-X   PLACE FULL WORD COUNT       K1902980
                          STO     WDCNT                                 K1902990
                          LD    3 PAP-X     PLACE PRINT AREA ADDRESS    K1903000
                          STO  L  AREA                                  K1903010
                          BSC  L  BLKPA+1   BRANCH                      K1903020
                          ORG     PAREA+120-5                           K1903030
                    *************************************************** K1903040
                    *                                                 * K1903050
                    *                  END OF PRINT AREA              * K1903060
                    *                                                 * K1903070
                    *************************************************** K1903080
                          HDNG    1130 FORTRAN COMPILER PHASE 19        K1903090
                    *                                                   K1903100
                    *             SLET ENTRY STORAGE                    K1903110
                    *                                                   K1903120
                          BSS  E  0          GUARANTEE EVEN BOUNDARY    K1903130
                    *                                                   K1903140
                    SSLET DC      153        PRINICPAL PRINT SUBR ID    K1903150
                          DC      *-*        NOT USED                   K1903160
                          DC      *-*        WORD COUNT                 K1903170
                          DC      *-*        SECTOR ADDRESS             K1903180
                    *                                                   K1903190
                    *                                                   K1903200
                    OVRLY DC      50         ID FOR NEXT PHASE          K1903210
                    *                                                   K1903220
                    *             PRINT AREA ENDS HERE                  K1903230
                    *                                                   K1903240
                          DC      *-*        CORE ADDRESS NEXT PHASE    K1903250
                          DC      *-*        WORD COUNT                 K1903260
                          DC      *-*        SECTOR ADDRESS             K1903270
                    *                                                   K1903280
                    *                                                   K1903290
                          HDNG    1130 FORTRAN COMPILER PHASE 19        K1903300
                    *************************************************** K1903310
                    *                                                 * K1903320
                    *                  MAINLINE                       * K1903330
                    *                                                 * K1903340
                    *************************************************** K1903350
                    *                                                   K1903360
                    *                  CALL ALLOC TO ALLOCATE THE       K1903370
                    *                   BLANK COMMON VARIABLES          K1903380
                    ML010 BSI  L  ALLOC     CALL ALLOC                  K1903390
                    *                                                   K1903400
                    *                  TEST TO SEE IF ANY EQUIVALENCE   K1903410
                    *                  STATEMENTS WHERE FOUND AND       K1903420
                    *                  EVALUATE THEM IF THERE WERE.     K1903430
                          LD    3 IN01A+1-X  LOAD EQUIV NEST ADR   2-10 K1903440
                          BSI  L  EQUIV,Z   BRANCH IF EQUIV. STS.       K1903450
                    *                                                   K1903460
                    *                  CALL ALLOC ROUTINE TO ALLOCATE   K1903470
                    *                  THE REAL VARIABLES.              K1903480
                    ML020 BSI  L  ALLOC     CALL ALLOC                  K1903490
                    *                                                   K1903500
                    *                  CALL ALLOC ROUTINE TO ALLOCATE   K1903510
                    *                  THE INTEGER VARIABLES.           K1903520
                          BSI  L  ALLOC     CALL ALLOC                  K1903530
                    *                                                   K1903540
                    *                  CALCULATE COMMON SIZE AND MAKE   K1903550
                    *                  IT EVEN.                         K1903560
                    ML021 LD   L  COMON     LOAD UPPER COMMON ADDR 2-11 K1903570
                          S    L  CSIZE     SUBTRACT LOWER ADR          K1903580
                          BSC     E         SKIP IF EVEN                K1903590
                          A     3 H0001-X   MAKE EVEN                   K1903600
                          STO  L  CSIZE     STORE COMMON SIZE           K1903610
                    *                                                   K1903620
                    *                                                   K1903630
                    *                  INSERT THE WORK AREA SIZE INTO   K1903640
                    *                  THE COMMUNICATION AREA           K1903650
                          LD    3 VARCR-X   LOAD WORK AREA SIZE         K1903660
                          BSC     E         SKIP IF EVEN                K1903670
                          A     3 H0001-X   MAKE EVEN                   K1903680
                          STO  L  SOFXT     STORE EVEN WORK AREA SIZE   K1903690
                    *                                                   K1903700
                    *                  PLACE CONSTANT AREA SIZE IN      K1903710
                    *                  SOFGT.                           K1903720
                          LD    3 CAC-X     LOAD CONSTANT AREA SIZE     K1903730
                          STO  L  SOFGT     SAVE IN SOFGT               K1903740
                    *                                                   K1903750
                    *                  TEST TO SEE IF PARTIAL LINE      K1903760
                    *                  REMAINS TO BE PRINTED.           K1903770
                          LD    3 PAP-X     LOAD PRINT AREA POINTER     K1903780
                          S     3 RPAP-X    SUBTRACT START OF PRINT ARA K1903790
                          BSI  L  PRINT,Z   BRANCH TO PRINT PART LINE   K1903800
                    *                                                   K1903810
                    *                  CALL IN THE NEXT PHASE OF THE    K1903820
                    *                  COMPILER                         K1903830
                    EXIT  LDX  I1 OVRLY+1    LOAD XR1 WITH CORE ADR     K1903840
                          LDD     OVRLY+2    LOAD DISK ADDRESS          K1903850
                          BSC  L  ROL       BRANCH TO ROL ROUTINE       K1903860
                    *                                                   K1903870
                    *                  LOAD THE NUMBER 65 INTO          K1903880
                    *                  THE A REGISTER                   K1903890
                    ERR65 LD    3 H0041-X   LOAD 65                     K1903900
                          MDX     ERR       BRANCH                      K1903910
                    *                                                   K1903920
                    *                  LOAD THE NUMBER 66 INTO          K1903930
                    *                  THE A REGISTER.                  K1903940
                    ERR66 LD    3 H0042-X   LOAD 66                     K1903950
                          MDX     ERR       BRANCH                      K1903960
                    *                                                   K1903970
                    *                  LOAD THE NUMBER 67 INTO          K1903980
                    *                  THE A REGISTER.                  K1903990
                    ERR67 LD    3 H0043-X   LOAD 67                     K1904000
                    *                                                   K1904010
                    *                  PLACE THE ERROR NUMBER AND       K1904020
                    *                  INDICATOR.                       K1904030
                    ERR   LDX  I1 NRA       SET TO EQUIVALENCE STMT2-12 K1904040
                          STO   1 0         PLACE ERROR NUMBER          K1904050
                          LD    3 H0FFF-X   LOAD ERROR INDICATOR        K1904060
                          STO   1 -1        PLACE ERROR INDICATOR       K1904070
                    *                                                   K1904080
                    *                                                   K1904090
                    *                                                   K1904100
                          BSI  L  RMOVE     REMOVE SPECIAL INDICATORS   K1904110
                    *                                                   K1904120
                    *                                                   K1904130
                          LD    3 H0022-X                           2-7 K1904132
                          STO   3 ALOCB-X                           2-7 K1904134
                    *                                                   K1904140
                          MDX     ML021     BEGIN EXIT THIS PHASE  2-11 K1904150
                    *************************************************** K1904160
                    *                                                 * K1904170
                    *                  END OF MAINLINE PROGRAM        * K1904180
                    *                                                 * K1904190
                    *************************************************** K1904200
                          HDNG    1130 FORTRAN COMPILER PHASE 19        K1904210
                    *************************************************** K1904220
                    *                                                 * K1904230
                    *             LITERAL POOL                        * K1904240
                    *                                                 * K1904250
                    *************************************************** K1904260
                    X     EQU     *+128     INDEX REGISTER 3 VALUE      K1904270
                    SW1   DC      *-*       SWITCH 1                    K1904280
                    SW2   DC      *-*       SWITCH 2                    K1904290
                    SW3   DC      *-*       SWITCH 3                    K1904300
                    SW4   DC      *-*       SWITCH 4                    K1904310
                    ODDSW DC      *-*       ODD SWITCH                  K1904320
                    EVSW  DC      *-*       EVEN SWITCH                 K1904330
                    TRACK DC      -1        TRACK SWITCH                K1904340
                    LOW   DC      *-*       LOW ADR. OF NEST            K1904350
                    HIGH  DC      *-*       HIGH ADR. OF NEST           K1904360
                    DEFIN DC      *-*       DEFIN IND. FOR NEST         K1904370
                    RELAD DC      *-*       RELATIVE ADR. OF NEST       K1904380
                    D4    DC      *-*       OFFSET FOR SUBSCRIPT        K1904390
                    NRA   DC      *-*       NEST RETURN ADR.            K1904400
                    SNRA  DC      *-*       SAVE AREA FOR NRA           K1904410
                    BASE  DC      *-*       BASE ADR. OF NEST           K1904420
                    VARCR DC      *-*       ADR. OF VARIABLE CORE       K1904430
                    TAGLP DC      /0312     TAGED LEFT PARENTHESIS      K1904440
                    VSIZE DC      *-*       VARIABLE SIZE               K1904450
                    ISIZE DC      1         INTEGER SIZE                K1904460
                    RSIZE DC      2         REAL SIZE                   K1904470
                    ASIZE DC      *-*       ARRAY SIZE                  K1904480
                    CAC   DC      *-*       CONSTANT AREA COUNT         K1904490
                    PAP   DC      PAREA     PRINT AREA POINTER          K1904500
                    LNEND DC      PAREA+120 PRINT LINE END     (CONST.) K1904510
                    RPAP  DC      PAREA     PRINT AREA ADDRESS (CONST.) K1904520
                    SAVAD DC      *-*       SAVE HEXIDECIMAL ADDRESS    K1904530
                    SALOC DC      *-*       SAVE ALLOCATION             K1904540
                    ALOCB DC      /0022     ALLOCATION BITS             K1904550
                    COMSW DC      *-*       COMMON VARIABLE SWITCH  2-0 K1904551
                          BSS  E  0                                     K1904560
                    NAME  DC      *-*       PACKED NAME                 K1904570
                          DC      *-*                                   K1904580
                    HTEST DC      *-*       HEADER SWITCH               K1904590
                    ORGSW DC      0          ORIGIN SWITCH          2-4 K1904595
                    HFFFF DC      /FFFF     CONSTANT                    K1904600
                    HF800 DC      /F800     CONSTANT                    K1904610
                    HB800 DC      /B800     CONSTANT                    K1904620
                    HA800 DC      /A800     CONSTANT                    K1904630
                    H8000 DC      /8000     CONSTANT                    K1904640
                    H4000 DC      /4000     CONSTANT                    K1904650
                    H3FFF DC      /3FFF     CONSTANT                    K1904660
                    H2022 DC      /2022     CONSTANT                    K1904670
                    H1800 DC      /1800     CONSTANT                    K1904680
                    H0FFF DC      /0FFF     CONSTANT                    K1904690
                    H0C00 DC      /0C00     CONSTANT                    K1904700
                    H07FF DC      /07FF     CONSTANT                    K1904710
                    H07FC DC      /07FC     CONSTANT                    K1904720
                    H07F2 DC      /07F2     CONSTANT                    K1904730
                    H0300 DC      /0300     CONSTANT                    K1904740
                    H00D9 DC      /00D9     CONSTANT                    K1904750
                    H00C9 DC      /00C9     CONSTANT                    K1904760
                    H00C5 DC      /00C5     CONSTANT                    K1904770
                    H00C3 DC      /00C3     CONSTANT                    K1904780
                    H00C0 DC      /00C0     CONSTANT                    K1904790
                    H007E DC      /007E     CONSTANT                    K1904800
                    H0060 DC      /0060     CONSTANT                    K1904810
                    H005D DC      /005D     CONSTANT                    K1904820
                    H005C DC      /005C     CONSTANT                    K1904830
                    H004D DC      /004D     CONSTANT                    K1904840
                    H0041 DC      /0041     CONSTANT                    K1904850
                    H0042 DC      /0042     CONSTANT                    K1904860
                    H0043 DC      /0043     CONSTANT                    K1904870
                    H0040 DC      /0040     CONSTANT                    K1904880
                    H003F DC      /003F     CONSTANT                    K1904890
                    H003C DC      /003C     CONSTANT                    K1904900
                    H0039 DC      /0039     CONSTANT                    K1904910
                    H0028 DC      /0028     CONSTANT                    K1904920
                    H0022 DC      /0022     CONSTANT                    K1904930
                    H0020 DC      /0020     CONSTANT                    K1904940
                    H0012 DC      /0012     CONSTANT                    K1904950
                    H000F DC      /000F     CONSTANT                    K1904960
                    H000C DC      /000C     CONSTANT                    K1904970
                    H0009 DC      /0009     CONSTANT                    K1904980
                    H0003 DC      /0003     CONSTANT                    K1904990
                    H0002 DC      /0002     CONSTANT                    K1905000
                    H0001 DC      /0001     CONSTANT                    K1905010
                          HDNG    1130 FORTRAN COMPILER PHASE 19        K1905020
                    *************************************************** K1905030
                    *                                                 * K1905040
                    * ROUTINE NAME/ARRL                               * K1905050
                    *                                                 * K1905060
                    * FUNCTION    /PLACE IN VSIZE THE SIZE OF EACH    * K1905070
                    *              ELEMENT AN IN ASIZE THE TOTAL SIZE * K1905080
                    *              OF THE ARRAY.                      * K1905090
                    *                                                 * K1905100
                    * ENTRY       /ARRL                               * K1905110
                    *                                                 * K1905120
                    * INPUT       /NO SPECIAL INPUT OTHER THAN THE    * K1905130
                    *              SYMBOL TABLE.                      * K1905140
                    *                                                 * K1905150
                    * OUTPUT      /VSIZE AND ASIZE WILL BE SET.       * K1905160
                    *                                                 * K1905170
                    * EXTERNAL                                        * K1905180
                    * REFERANCES  /SUBROUTINES (VARFO) ARE CALLED AND * K1905190
                    *              REFERANCES TO (VSIZE,ASIZE,H1800)  * K1905200
                    *              ARE MADE.                          * K1905210
                    *                                                 * K1905220
                    * ERROR       /NONE                               * K1905230
                    *                                                 * K1905240
                    * NOTE        /CALLING SEQUENCE    BSI ARRL       * K1905250
                    *                                                 * K1905260
                    *************************************************** K1905270
                    *                                                   K1905280
                    *                  ENTRY-ARRL                       K1905290
                    ARRL  DC      *-*       LINK WORD                   K1905300
                    *                                                   K1905310
                    *                  CALL VARFO TO DETERMINE THE      K1905320
                    *                  SIZE OF THE PRESENT SYMBOL.      K1905330
                          BSI   3 VARFO-X   CALL VARFO                  K1905340
                    *                                                   K1905350
                    *                  PLACE THE SIZE OF THE SINGLE     K1905360
                    *                  ELEMENT IN ASIZE.                K1905370
                          LD    3 VSIZE-X   LOAD THE ELEMENT SIZE       K1905380
                          STO   3 ASIZE-X   PLACE IN ARRAY SIZE         K1905390
                    *                                                   K1905400
                    *                  TEST THE SYMBOL TO SEE IF IT     K1905410
                    *                  IS DIMENSIONED.                  K1905420
                          LD    2 0         LOAD INDICATOR WORD         K1905430
                          AND   3 H1800-X   SAVE DIMENSION IND. BITS    K1905440
                          BSC  I  ARRL,+-   BR IF NOT DIMENSIONED       K1905450
                    *                                                   K1905460
                    *                  CALCULATE THE SIZE OF THE        K1905470
                    *                  ARRAY.                           K1905480
                          LD    2 -3        LOAD NUMBER OF ELEMENTS     K1905490
                          M     3 VSIZE-X   MULTIPLY BY ELEMENT SIZE    K1905500
                          SLT     1         BRANCH TO ERROR 99 IF   2-7 K1905505
                          BSC  L  ARRL1,Z   *CORE REQ EXCESSIVE     2-7 K1905510
                          SLT     15        SHIFT INTO ACCUMULATOR  2-7 K1905515
                          STO   3 ASIZE-X   STORE ARRAY SIZE            K1905520
                    *                                                   K1905530
                    *                  RETURN                           K1905540
                          BSC  I  ARRL      RETURN                      K1905550
                    *                                                   K1905552
                    ARRL1 MDX  L  ERROR,8   INDICATE ERROR 99       2-7 K1905554
                          BSC  L  EXIT      EXIT FROM THIS PHASE    2-7 K1905556
                    *                                                   K1905558
                    *************************************************** K1905560
                    *                                                 * K1905570
                    *             END OF ARRL ROUTINE                 * K1905580
                    *                                                 * K1905590
                    *************************************************** K1905600
                          HDNG    1130 FORTRAN COMPILER PHASE 19        K1905610
                    *************************************************** K1905620
                    *                                                 * K1905630
                    * ROUTINE NAME/VARFO                              * K1905640
                    *                                                 * K1905650
                    * FUNCTION    /PLACE IN VSIZE THE SIZE OF THE     * K1905660
                    *              VARIABLE OR CONSTANT THAT IS BEING * K1905670
                    *              LOOKED AT.                         * K1905680
                    *                                                 * K1905690
                    * ENTRY       /VARFO                              * K1905700
                    *                                                 * K1905710
                    * INPUT       /NO SPECIAL INPUT OTHER THAN THE    * K1905720
                    *              SYMBOL TABLE.                      * K1905730
                    *                                                 * K1905740
                    * OUTPUT      /VSIZE WILL BE SET.                 * K1905750
                    *                                                 * K1905760
                    * EXTERNAL                                        * K1905770
                    * REFERANCES  /REFERANCES TO (ISIZE,VSIZE,RSIZE)  * K1905780
                    *              ARE MADE.                          * K1905790
                    *                                                 * K1905800
                    * ERROR       /NONE                               * K1905810
                    *                                                 * K1905820
                    * NOTE        /CALLING SEQUENCE    BSI VARFO      * K1905830
                    *                                                 * K1905840
                    *************************************************** K1905850
                    *                                                   K1905860
                    *                  ENTRY-VARFO                      K1905870
                    VARFO DC      *-*       LINK WORD                   K1905880
                    *                                                   K1905890
                    *                  SET VARIABLE SIZE TO THAT OF     K1905900
                    *                  THE INTEGER VARIABLES.           K1905910
                          LD    3 ISIZE-X   LOAD INTEGER SIZE           K1905920
                          STO   3 VSIZE-X   STORE IN VARIABLE SIZE      K1905930
                    *                                                   K1905940
                    *                  TEST TO SEE IF THE VARIABLE IS   K1905950
                    *                  REAL OR INTEGER.                 K1905960
                          LD    2 0         LOAD INDICATOR WORD         K1905970
                          SLA     1         PLACE REAL IND. IN SIGN     K1905980
                          BSC  I  VARFO,+Z  BR IF INTEGER               K1905990
                    *                                                   K1906000
                    *                  SET THE VARIABLE SIZE TO THAT OF K1906010
                    *                  THE REAL VARIABLES.              K1906020
                          LD    3 RSIZE-X   LOAD REAL SIZE              K1906030
                          STO   3 VSIZE-X   STORE IN VARIABLE SIZE      K1906040
                    *                                                   K1906050
                    *                  RETURN                           K1906060
                          BSC  I  VARFO     RETURN                      K1906070
                    *************************************************** K1906080
                    *                                                 * K1906090
                    *             END OF VARFO ROUTINE                * K1906100
                    *                                                 * K1906110
                    *************************************************** K1906120
                          HDNG    1130 FORTRAN COMPILER PHASE 19        K1906130
                    *************************************************** K1906140
                    *                                                 * K1906150
                    * ROUTINE NAME/RTN                                * K1906160
                    *                                                 * K1906170
                    * FUNCTION    /POINTS INDEX REGISTER 1 TO THE FIRS* K1906180
                    *              SYMBOL IN THE NEST NOW BEING WORKED* K1906190
                    *              ON. INDEX REGISTER 2 IS ALSO SET TO* K1906200
                    *              POINT AT SYMBOL TABLE.             * K1906210
                    *                                                 * K1906220
                    * ENTRY       /RTN                                * K1906230
                    *                                                 * K1906240
                    * INPUT       /NO SPECIAL INPUT.                  * K1906250
                    *                                                 * K1906260
                    * OUTPUT      /XR1 AND XR2 ARE SET.               * K1906270
                    *                                                 * K1906280
                    * EXTERNAL                                        * K1906290
                    * REFERENCES  /SUBROUTINES (XR2) AND REQUIRED AND * K1906300
                    *              REFERANCES TO (NRA) ARE MADE.      * K1906310
                    *                                                 * K1906320
                    * ERROR       /NONE                               * K1906330
                    *                                                 * K1906340
                    * NOTES       /NONE                               * K1906350
                    *                                                 * K1906360
                    *************************************************** K1906370
                    *                                                   K1906380
                    *                  ENTRY-RTN                        K1906390
                    RTN   DC      *-*       LINK WORD                   K1906400
                    *                                                   K1906410
                    *                  RESTORE INDEX REGISTER 1 TO      K1906420
                    *                  POINT AT THE FIRST VARIABLE      K1906430
                    *                  IN THE PRESENT NEST.             K1906440
                          LDX  I1 NRA       LOAD XR1 NEST RETURN ADR.   K1906450
                    *                                                   K1906460
                    *                  CALL XR2 TO SET INDEX REGISTER 2 K1906470
                    *                  TO POINT AT THE INDICATOR WORD   K1906480
                    *                  OF THE SYMBOL XR1 POINTS AT.     K1906490
                          BSI   3 XR2-X     CALL XR2                    K1906500
                    *                                                   K1906510
                    *                  RETURN                           K1906520
                          BSC  I  RTN       RETURN                      K1906530
                    *************************************************** K1906540
                    *                                                 * K1906550
                    *             END OF RTN ROUTINE                  * K1906560
                    *                                                 * K1906570
                    *************************************************** K1906580
                          HDNG    1130 FORTRAN COMPILER PHASE 19        K1906590
                    *************************************************** K1906600
                    *                                                 * K1906610
                    * ROUTINE NAME/XR2                                * K1906620
                    *                                                 * K1906630
                    * FUNCTION    /THIS ROUTINE PICKS UP THE WORD     * K1906640
                    *              SPECIFIED BY INDEX REGISTER 1,     * K1906650
                    *              COMPUTES THE SYMBOL TABLE ADDRESS, * K1906660
                    *              AND LOAD THAT ADDRESS INTO INDEX   * K1906670
                    *              REGISTER 2.                        * K1906680
                    *                                                 * K1906690
                    * ENTRY       /XR2                                * K1906700
                    *                                                 * K1906710
                    * INPUT       /NO SPECIAL INPUT OTHER THAN THE    * K1906720
                    *              STRING AND SYMBOL TABLE.           * K1906730
                    *                                                 * K1906740
                    * OUTPUT      /INDEX REGISTER 2 IS SET.           * K1906750
                    *                                                 * K1906760
                    * EXTERNAL                                        * K1906770
                    * REFERANCES  /REFERANCES TO (SOFST,H07FF) ARE    * K1906780
                    *              MADE.                              * K1906790
                    *                                                 * K1906800
                    * ERROR       /NONE                               * K1906810
                    *                                                 * K1906820
                    * NOTES       /CALLING SEQUENCE    BSI XR2        * K1906830
                    *                                                 * K1906840
                    *************************************************** K1906850
                    *                                                   K1906860
                    *                  ENTRY-XR2                        K1906870
                    XR2   DC      *-*       LINK WORD                   K1906880
                    *                                                   K1906890
                    *                  LOAD INDEX REGISTER 2 WITH THE   K1906900
                    *                  SYMBOL TABLE ADDRESS OF SYMBOL.  K1906910
                          LD    1 0         LOAD SYMBOL                 K1906920
                          AND   3 H07FF-X   SEPERATE OFSET              K1906930
                          STO     *+8       SAVE OFSET                  K1906940
                          LD   L  SOFST     CALCULATE                   K1906950
                          A     3 H0003-X                               K1906960
                          S       *+4             SOFST-3*OFSET+3       K1906970
                          S       *+3                                   K1906980
                          S       *+2                                   K1906990
                          STO     *+1       INITIALIZE LDX INSTRUCTION  K1907000
                          LDX  L2 *-*       LOAD XR2                    K1907010
                    *                                                   K1907020
                    *                  RETURN                           K1907030
                          BSC  I  XR2       RETURN                      K1907040
                    *************************************************** K1907050
                    *                                                 * K1907060
                    *             END OF XR2 ROUTINE                  * K1907070
                    *                                                 * K1907080
                    *************************************************** K1907090
                          HDNG    1130 FORTRAN COMPILER PHASE 19        K1907100
                    *************************************************** K1907110
                    *                                                 * K1907120
                    * ROUTINE NAME/HILO                               * K1907130
                    *                                                 * K1907140
                    * FUNCTION    /THE HIGH AND LOW VALUES AND THE    * K1907150
                    *              DEFINE INDICATORS ARE SAVE FOR     * K1907160
                    *              A SET OF NESTS OF EQUIVALENCE      * K1907170
                    *              STATEMENTS.                        * K1907180
                    *                                                 * K1907190
                    * ENTRY       /HILO                               * K1907200
                    *                                                 * K1907210
                    * INPUT       /THE VALUE OF THE VARIABLE BEING    * K1907220
                    *              LOOKED AT AS WELL AS THE SYMBOL    * K1907230
                    *              TABLE.                             * K1907240
                    *                                                 * K1907250
                    * OUTPUT      /LOW,HIGH AND DEFIN WILL BE SET.    * K1907260
                    *                                                 * K1907270
                    * EXTERNAL                                        * K1907280
                    * REFERANCES  /SUBROUTINES (ARRL,GETD4) ARE CALLED* K1907290
                    *              AND REFERANCES (RELAD,VSIZE,BASE,  * K1907300
                    *              ASIZE,LOW,H0001,HIGH,DEFIN) ARE    * K1907310
                    *              MADE.                              * K1907320
                    *                                                 * K1907330
                    * ERROR       /NONE                               * K1907340
                    *                                                 * K1907350
                    * NOTE        /CALLING SEQUENCE   BSI HILO        * K1907360
                    *                                                 * K1907370
                    *************************************************** K1907380
                    *                                                   K1907390
                    *                  ENTRY-HILO                       K1907400
                    HILO  DC      *-*       LINK WORD                   K1907410
                    *                                                   K1907420
                    *                  CALL ARRL TO OBTAIN THE VARIABLE K1907430
                    *                  SIZE AND THE ARRAY SIZE.         K1907440
                          BSI   3 ARRL-X    CALL ARRL                   K1907450
                    *                                                   K1907460
                    *                  CALL GETD4 TO OBTAIN THE OFFSET  K1907470
                    *                  FOR THE PRESENT VARIABLE.        K1907480
                          BSI     GETD4     CALL GETD4                  K1907490
                    *                                                   K1907500
                    *                  CALCULATE THE BASIS FOR          K1907510
                    *                  DETERMINING IF THIS ARRAY OR     K1907520
                    *                  ELEMENT WILL DEFINE A NEW        K1907530
                    *                  LOW OR HIGH FOR THIS NEST.       K1907540
                          A     3 RELAD-X   CALCULATE                   K1907550
                          A     3 VSIZE-X   BASE=D4+RELAD-VSIZE         K1907560
                          STO   3 BASE-X                                K1907570
                    *                                                   K1907580
                    *                                                   K1907620
                    *             TEST TO SEE IF REAL VARIABLES ARE     K1907630
                    *             STANDARD PRECISION.                   K1907640
                    *                                                   K1907650
                    *                             *1 INSTR REMOVED 2-11 K1907660
                          LD    3 RSIZE-X   LOAD REAL SIZE         2-11 K1907670
                          BSC  L  HILO7,E   BR IF EXTEND PRECISION 2-11 K1907680
                    *                                                   K1907690
                    *             TEST TO SEE IF REAL VARIABLE BEING    K1907700
                    *             LOOKED AT.                            K1907710
                    *                                                   K1907720
                          LD    2 0         LOAD INDICATOR WORD         K1907730
                          SLA     1         PLACE TYPE IN SIGN          K1907740
                          BSC  L  HILO7,+Z  BRANCH IF INTEGER       2-8 K1907750
                    *                                                   K1907760
                    *             TEST TO SEE IF THE LOW VALUE OF       K1907770
                    *             THE ARRAY OR VARIABLE IS EVEN.        K1907780
                    *                                                   K1907790
                          LD    3 BASE-X    COMPUTE LOW ADDRESS         K1907800
                          S     3 ASIZE-X                               K1907810
                          BSC  L  HILO6,E   BRANCH IF ODD               K1907820
                    *                                                   K1907830
                    *             TEST TO SEE IF THE ODD SWITCH IS      K1907840
                    *             SET ON.                               K1907850
                    *                                                   K1907860
                          LD    3 ODDSW-X   LOAD ODD SWITCH             K1907870
                          BSC  L  ERR67,Z   BRANCH IF ALLOCATION ERROR  K1907880
                    *                                                   K1907890
                    *             SET THE EVEN SWITCH ON.               K1907900
                    *                                                   K1907910
                          STX  L0 EVSW      SET EVEN SWITCH             K1907920
                    *                                                   K1907940
                    HILO7 LD    3 SW3-X     TEST IF COMMON          2-8 K1907941
                          BSC  L  HILO3,+-  BRANCH IF YES           2-8 K1907942
                          MDX     HILO5     BRANCH IF NO            2-8 K1907943
                    *                                                   K1907944
                    HILO6 LD    3 SW3-X     TEST IF COMMON          2-8 K1907945
                          BSC  L  ERR67,+-  BRANCH IF YES           2-8 K1907946
                    *                                                   K1907947
                    *             TEST TO SEE IF THE EVEN SWITCH IS     K1907950
                    *             SET ON.                               K1907960
                    *                                                   K1907970
                          LD    3 EVSW-X    LOAD EVEN SWITCH            K1907980
                          BSC  L  ERR67,Z   BRANCH IF ALLOCATION ERROR  K1907990
                    *                                                   K1908000
                    *             SET ODD SWITCH ON.                    K1908010
                    *                                                   K1908020
                          STX  L0 ODDSW                                 K1908030
                    *                                                   K1908040
                    *             TEST TO SEE IF THIS NEST WILL         K1908050
                    *                  PRODUCE A NEW LOW.               K1908060
                    HILO5 LD    3 BASE-X    LOAD PRESENT LOW            K1908070
                          S     3 ASIZE-X                               K1908080
                          S     3 LOW-X     TEST AGAINST TOTAL LOW      K1908090
                          BSC  L  HILO1,-   BR IF NOT NEW LOW           K1908100
                    *                                                   K1908110
                    *                  SAVE THE NEW LOW FOR ALLOCATION  K1908120
                    *                  PRUPOSES.                        K1908130
                          A     3 LOW-X     RESTORE NEW LOW             K1908140
                          STO   3 LOW-X     SAVE NEW LOW                K1908150
                    *                                                   K1908160
                    *                  TEST TO SEE IF THIS NEST WILL    K1908170
                    *                  PRODUCE A NEW HIGH.              K1908180
                    HILO1 LD    3 BASE-X    LOAD PRESENT HIGH           K1908190
                          S     3 H0001-X                               K1908200
                          S     3 HIGH-X    TEST AGAINST TOTAL HIGH     K1908210
                          BSC  L  HILO2,+   BR IF NOT NEW HIGH          K1908220
                    *                                                   K1908230
                    *                  SAVE THE NEW HIGH FOR ALLOCATION K1908240
                    *                  PURPOSES.                        K1908250
                          A     3 HIGH-X    RESTORE NEW HIGH            K1908260
                          STO   3 HIGH-X    SAVE NEW HIGH               K1908270
                    *                                                   K1908280
                    *                  SAVE THE INDICATOR WORDS FOR     K1908290
                    *                  THE SYMBOLS IN THE NESTS.        K1908300
                    HILO2 LD    3 DEFIN-X   LOAD ACCUMULATED IND. WORDS K1908310
                          OR    2 0         OR IN NEW IND. WORD         K1908320
                          STO   3 DEFIN-X   SAVE ACCUMULATED IND. WORDS K1908330
                    *                                                   K1908340
                    *                                                   K1908350
                    HILOX BSC  I  HILO      RETURN                      K1908360
                    *                                                   K1908370
                    HILO3 EQU     *                                     K1908380
                          STO   3 EVSW-X    MIGHT HAVE BEEN SET    2-10 K1908385
                    *                       *ABOVE WHEN IT SHOULDNT2-10 K1908386
                    *                                                   K1908390
                    *                  TEST TO SEE IF THE START OF      K1908400
                    *                  BLANK COMMON IS BEING EXTENDED.  K1908410
                    HILO4 LD    3 BASE-X    LOAD PRESENT HIGH           K1908420
                          S     3 H0001-X                               K1908430
                          S    L  COMON     TEST AGAINST COMMON HIGH    K1908440
                          BSC  L  ERR66,-Z  BRANCH IF EXTENDING COMMON  K1908450
                    *                                                   K1908460
                    *                  TEST TO SEE IF THE END OF BLANK  K1908470
                    *                  COMMON IS BEING EXTENDED.        K1908480
                          LD    3 BASE-X    LOAD PRESENT LOW            K1908490
                          S     3 ASIZE-X                               K1908500
                          S     3 H0001-X                           2-6 K1908505
                          S    L  CSIZE     TEST AGAINST COMMON LOW     K1908510
                          BSC  L  HILO2,-   BRANCH IF NOT NEW LOW       K1908520
                    *                                                   K1908530
                    *                  INDICATE THE NEW LOW FOR BLANK   K1908540
                    *                  COMMON.                          K1908550
                          A    L  CSIZE     RESTORE NEW LOW             K1908560
                          STO  L  CSIZE     SAVE NEW LOW                K1908570
                          MDX     HILO2     RETURN                      K1908580
                    *                                                   K1908590
                    *************************************************** K1908600
                    *                                                 * K1908610
                    *             END OF HILO ROUTINE                 * K1908620
                    *                                                 * K1908630
                    *************************************************** K1908640
                          HDNG    1130 FORTRAN COMPILER PHASE 19        K1908650
                    *************************************************** K1908660
                    *                                                 * K1908670
                    * ROUTINE NAME/GETD4                              * K1908680
                    *                                                 * K1908690
                    * FUNCTION    /PLACE IN D4 THE OFFSET INDICATED   * K1908700
                    *              BY THE SUBSCRIPT IN EQUIVALENCE.   * K1908710
                    *                                                 * K1908720
                    * ENTRY       /GETD4                              * K1908730
                    *                                                 * K1908740
                    * INPUT       /INDEX REGISTER 1 POINTING AT THE   * K1908750
                    *              STRING AND INDEX REGISTER 2        * K1908760
                    *              POINTING AT THE SYMBOL TABLE.      * K1908770
                    *                                                 * K1908780
                    * OUTPUT      /D4 WILL BE SET.                    * K1908790
                    *                                                 * K1908800
                    * EXTERNAL                                        * K1908810
                    * REFERANCES  /REFERANCES TO (D4,H1800,H8000)ARE  * K1908820
                    *              MADE.                              * K1908830
                    *                                                 * K1908840
                    * ERROR       /NONE                               * K1908850
                    *                                                 * K1908860
                    * NOTES       /CALLING SEQUENCE   BSI GETD4       * K1908870
                    *                                                 * K1908880
                    *************************************************** K1908890
                    *                                                   K1908900
                    *                  ENTRY-GETD4                      K1908910
                    GETD4 DC      *-*                                   K1908920
                    *                                                   K1908930
                    *                  PLACE A ZERO IN D4.              K1908940
                          SLA     16        ZERO A REGISTER             K1908950
                          STO   3 D4-X      STORE IN D4                 K1908960
                    *                                                   K1908970
                    *                  CHECK TO SEE IF THE SYMBOL IS    K1908980
                    *                  DIMENSIONED.                     K1908990
                          LD    2 0         LOAD INDICATOR WORD         K1909000
                          AND   3 H1800-X   SAVE DIMENSION IND. BITS    K1909010
                          BSC  I  GETD4,+-  BR IF NOT DIMENSIONED       K1909020
                    *                                                   K1909030
                    *                  PLACE THE OFFSET IN D4.          K1909040
                          LD    1 2         LOAD OFFSET                 K1909050
                          EOR   3 H8000-X   REMOVE LEADING BIT.         K1909060
                          STO   3 D4-X      STORE D4                    K1909070
                    *                                                   K1909080
                    *                  RETURN                           K1909090
                          BSC  I  GETD4     RETURN                      K1909100
                    *************************************************** K1909110
                    *                                                 * K1909120
                    *             END OF GETD4 ROUTINE                * K1909130
                    *                                                 * K1909140
                    *************************************************** K1909150
                          HDNG    1130 FORTRAN COMPILER PHASE 19        K1909160
                    *************************************************** K1909170
                    *                                                 * K1909180
                    * ROUTINE NAME/EVENA                              * K1909190
                    *                                                 * K1909200
                    * FUNCTION    /MAKE THE VALUE OF VARCR EVEN.      * K1909210
                    *                                                 * K1909220
                    * ENTRY       /EVENA                              * K1909230
                    *                                                 * K1909240
                    * INPUT       /THE VALUE TO BE MADE EVEN IN VARCR.* K1909250
                    *                                                 * K1909260
                    * OUTPUT      /VARCR IS EVEN.                     * K1909270
                    *                                                 * K1909280
                    * EXTERNAL                                        * K1909290
                    * REFERANCES  /REFERANCES TO (VARCR,H0001,RSIZE)  * K1909300
                    *              ARE MADE.                          * K1909310
                    *                                                 * K1909320
                    * ERROR       /NONE                               * K1909330
                    *                                                 * K1909340
                    * NOTE        /CALLING SEQUENCE   BSI EVENA       * K1909350
                    *                                                 * K1909360
                    *************************************************** K1909370
                    *                                                   K1909380
                    *                  ENTRY-EVENA                      K1909390
                    EVENA DC      *-*       LINK WORD                   K1909400
                    *                                                   K1909410
                    *                  TEST TO SEE IF THE SIZE OF THE   K1909420
                    *                  VARIABLES ARE STANDARD OR        K1909430
                    *                  EXTENDED PRECISION.              K1909440
                          LD    3 RSIZE-X   LOAD REAL SIZE              K1909450
                          BSC  I  EVENA,E   BR IF EXTEND. PRECISION     K1909460
                    *                                                   K1909470
                    *                  TEST VARCR FOR BEING EVEN.       K1909480
                          LD    3 VARCR-X   LOAD VARIABLE CORE ADR.     K1909490
                          BSC     E         SKIP IF EVEN                K1909500
                    *                                                   K1909510
                    *                  INCREMENT THE VARIABLE CORE ADR. K1909520
                    *                  BY 1 TO MAKE IT EVEN.            K1909530
                          A     3 H0001-X   INCREMENT VARCR BY 1        K1909540
                          STO   3 VARCR-X   STORE VARCR                 K1909550
                    *                                                   K1909560
                    *                  RETURN                           K1909570
                          BSC  I  EVENA     RETURN                      K1909580
                    *************************************************** K1909590
                    *                                                 * K1909600
                    *             END OF EVENA ROUTINE                * K1909610
                    *                                                 * K1909620
                    *************************************************** K1909630
                          HDNG    1130 FORTRAN COMPILER PHASE 19        K1909640
                    *************************************************** K1909650
                    *                                                 * K1909660
                    * ROUTINE NAME/INCR                               * K1909670
                    *                                                 * K1909680
                    * FUNCTION    /THIS ROUTINE POSTIONS INDEX        * K1909690
                    *              REGISTERS 1 AND 2 DURING HANDLING  * K1909700
                    *              OF EQUIVALENCE STATEMENTS          * K1909710
                    * ENTRY POINTS/INCR(MOVES INDEX REGISTER 1 TO THE * K1909720
                    *              NEXT SYMBOL IN THE EQUIVALENCE     * K1909730
                    *              STATEMENTS. SKIPS ANY DELETED      * K1909740
                    *              NESTS.)                            * K1909750
                    *                                                 * K1909760
                    *              INIT(PLACES INDEX REGISTER 1 TO THE* K1909770
                    *              FIRST NON-DELETED NEST.)           * K1909780
                    *                                                 * K1909790
                    * INPUT       /NO SPECIAL INPUT OTHER THAN THE    * K1909800
                    *              SYMBOL TABLE.                      * K1909810
                    *                                                 * K1909820
                    * OUTPUT      /INDEX REGISTER 1 WILL BE POINTING  * K1909830
                    *              AT THE STRING AND INDEX REGISTER 2 * K1909840
                    *              WILL POINT AT THE ENTRY IN THE     * K1909850
                    *              SYMBOL TABLE ASSOCIATED WITH THE   * K1909860
                    *              STRING SYMBOL.                     * K1909870
                    *                                                 * K1909880
                    * EXTERNAL                                        * K1909890
                    * REFERENCES  /SUBROUTINES (MOVE,XR2) ARE REQUIRED* K1909900
                    *              AND REFERENCES TO (NRA,H8000) ARE  * K1909910
                    *              MADE.                              * K1909920
                    *                                                 * K1909930
                    * ERROR       /NONE                               * K1909940
                    *                                                 * K1909950
                    * NOTES       /STORAGE CELL AT IN01A+1 IS FILLED I* K1909960
                    *              BY INITIALIZATION WITH THE ADDRESS * K1909970
                    *              OF THE FIRST EQUIVALENCE STATEMENT * K1909980
                    *              OF A DUMMY IF EQUIVALENCE ARE      * K1909990
                    *              PRESENT.                           * K1910000
                    *                                                 * K1910010
                    *************************************************** K1910020
                    *                                                   K1910030
                    *                  ENTRY-INCR                       K1910040
                    INCR  DC      *-*       LINK WORD                   K1910050
                    *                                                   K1910060
                    *                  CALL MOVE TO MOVE POINTER TO THE K1910070
                    *                  NEXT SYMBOL IN THE EQUIVALENCE   K1910080
                    *                  STATEMENTS.                      K1910090
                          BSI     MOVE      CALL MOVE                   K1910100
                          DC      IN01E     BR IF END OF ALL EQUIV      K1910110
                          DC      IN01B     BR IF END OF NEST           K1910120
                    *                                                   K1910130
                    *                  CALL XR2 TO POINT INDEX REGISTER K1910140
                    *                  2 AT THE INDICATOR WORD OF THE   K1910150
                    *                  SYMBOL TABLE ENTRY.              K1910160
                          BSI   3 XR2-X     CALL XR2                    K1910170
                    *                                                   K1910180
                    *                  RETURN LINK+2                    K1910190
                          MDX  L  INCR,2    INCREMENT LINK WORD BY 2    K1910200
                          BSC  I  INCR      RETURN                      K1910210
                    *                                                   K1910220
                    *                  ENTRY-INIT                       K1910230
                    INIT  DC      *-*       LINK WORD                   K1910240
                    *                                                   K1910250
                    *                  MOVE THE LINK WORD TO THE INCR   K1910260
                    *                  ENTRY POINT.                     K1910270
                          LD      INIT      LOAD LINK WORD-INIT         K1910280
                          STO     INCR      STORE LINK WORD-INCR        K1910290
                    *                                                   K1910300
                    *                  SET INDEX REGISTER 1 TO POINT AT K1910310
                    *                  THE FIRST NEST. (THIS ADDRESS IS K1910320
                    *                  COMPUTED IN THE INITIALIZATION   K1910330
                    *                  AN IS STORED HERE.)              K1910340
                    IN01A LDX  L1 *-*       LOAD XR1 WITH NEST ADDRESS  K1910350
                    *                                                   K1910360
                    *                  SAVE INDEX REGISTER 1 FOR THE    K1910370
                    *                  RTN ROUTINE.                     K1910380
                    IN01B STX  L1 NRA       SAVE XR1                    K1910390
                    *                                                   K1910400
                    *                  TEST THE LEFT PARENTHESIS TO SEE K1910410
                    *                  IF THE NEST HAS BEEN DELETED.    K1910420
                          LD    1 -1        LOAD LEFT PARENTHESIS       K1910430
                          EOR   3 H8000-X   CHECK FOR DELETE CODE       K1910440
                          BSC  L  IN01C,+-  BR IF DELETE CODE           K1910450
                    *                                                   K1910460
                    *                  CALL XR2 TO POINT INDEX REGISTER K1910470
                    *                  2 AT THE INDICATOR WORD OF THE   K1910480
                    *                  SYMBOL TABLE ENTRY.              K1910490
                          BSI   3 XR2-X     CALL XR2                    K1910500
                    *                                                   K1910510
                    *                  INCREMENT LINK WORD BY 1         K1910520
                          MDX  L  INCR,1    INCREMENT LINK WORD BY 1    K1910530
                    *                                                   K1910540
                    *                  RETURN C'(LINK)                  K1910550
                    *                                                   K1910560
                    IN01E LD      INCR      INITIALIZE BRANCH INST.     K1910570
                          STO     *+1                                   K1910580
                          BSC  I  *-*       RETURN                      K1910590
                    *                                                   K1910600
                    *                  CALL XR2 TO POINT INDEX REGISTER K1910610
                    *                  2 AT THE INDICATOR WORD OF THE   K1910620
                    *                  SYMBOL TABLE ENTRY.              K1910630
                    IN01C BSI   3 XR2-X     CALL XR2                    K1910640
                    *                                                   K1910650
                    *                  CALL MOVE TO MOVE POINTER TO THE K1910660
                    *                  NEXT SYMBOL IN THE EQUIVALENCE   K1910670
                    *                  STATEMENTS.                      K1910680
                          BSI     MOVE      CALL MOVE                   K1910690
                          DC      IN01E     BR IF END OF ALL EQUIV.     K1910700
                          DC      IN01B     BR IF END OF NEST           K1910710
                          MDX     IN01C                                 K1910720
                    *************************************************** K1910730
                    *                                                 * K1910740
                    *             END OF INCR ROUTINE                 * K1910750
                    *                                                 * K1910760
                    *************************************************** K1910770
                          HDNG    1130 FORTRAN COMPILER PHASE 19        K1910780
                    *************************************************** K1910790
                    *                                                 * K1910800
                    * ROUTINE NAME/MOVE                               * K1910810
                    *                                                 * K1910820
                    * FUNCTION    /MOVE INDEX REGISTER 1 TO THE NEXT  * K1910830
                    *              SYMBOL IN THE EQUIVALENCE STATEMENT* K1910840
                    *              PRESENT.                           * K1910850
                    *                                                 * K1910860
                    * ENTRY       /MOVE                               * K1910870
                    *                                                 * K1910880
                    * INPUT       /NO SPECIAL INPUT OTHER THAN THE    * K1910890
                    *              SYMBOL TABLE.                      * K1910900
                    *                                                 * K1910910
                    * OUTPUT      /INDEX REGISTER 1 WILL POINT AT THE * K1910920
                    *              NEXT SYMBOL IN THE EQUIVALENCE     * K1910930
                    *              STATEMENTS.                        * K1910940
                    *                                                 * K1910950
                    * EXTERNAL                                        * K1910960
                    * REFERENCES  /REFERENCES TO (H1800,H0012,HF800,  * K1910970
                    *              HA800) ARE MADE.                   * K1910980
                    *                                                 * K1910990
                    * ERROR       /NONE                               * K1911000
                    *                                                 * K1911010
                    * NOTES       /NONE                               * K1911020
                    *                                                 * K1911030
                    *************************************************** K1911040
                    *                                                   K1911050
                    *                  ENTRY-MOVE                       K1911060
                    MOVE  DC      *-*       LINK WORD                   K1911070
                    *                                                   K1911080
                    *                  CHECK TO SEE IF PRESENT SYMBOL   K1911090
                    *                  IS DIMENSIONED.                  K1911100
                          LD    2 0         LOAD INDICATOR WORD         K1911110
                          AND   3 H1800-X   SAVE DIMENSION BITS         K1911120
                          BSC  L  MV01A,+-  BR IF NOT DIMENSIONED       K1911130
                    *                                                   K1911140
                    *                  MOVE INDEX REGISTER 1 OVER THE   K1911150
                    *                  SUBSCRIPT.                       K1911160
                          MDX   1 3                                     K1911170
                    *                                                   K1911180
                    *                  MOVE INDEX REGISTER 1 OVER THE   K1911190
                    *                  SYMBOL.                          K1911200
                    MV01A MDX   1 2                                     K1911210
                    *                                                   K1911220
                    *                  TEST TO SEE IF THERE IS A SYMBOL K1911230
                    *                  AT LOCATION SPECIFIED BY XR1.    K1911240
                          LD    1 0         LOAD SYMBOL AT XR1          K1911250
                          BSC  L  MV01B,-   BR IF OPERATOR              K1911260
                    *                                                   K1911270
                    *                  RETURN TO LINK+2                 K1911280
                          MDX  L  MOVE,2    INCREMENT LINK WORD BY 2    K1911290
                          BSC  I  MOVE      RETURN                      K1911300
                    *                                                   K1911310
                    *                  TEST THE SEPERATOR TO SEE IF IT  K1911320
                    *                  IS A COMMA.                      K1911330
                    MV01B S     3 H0012-X   TEST FOR COMMA              K1911340
                          BSC  L  MV01C,Z   BR IF NOT A COMMA           K1911350
                    *                                                   K1911360
                    *                  MOVE INDEX REGISTER 1 TO THE     K1911370
                    *                  NEXT NEST.                       K1911380
                          MDX   1 2                                     K1911390
                    *                                                   K1911400
                    *                  INCREMENT LINK WORD BY 1         K1911410
                    MV01D MDX  L  MOVE,1                                K1911420
                    *                                                   K1911430
                    *                  RETURN C'(LINK WORD)             K1911440
                    MV01E LD      MOVE      LOAD LINK WORD              K1911450
                          STO     *+1       INITIALIZE BR INSTRUCTION   K1911460
                          BSC  I  *-*       RETURN                      K1911470
                    *                                                   K1911480
                    *                  TEST THE NEXT STATEMENT TO SEE   K1911490
                    *                  IF IT IS AN EQUIVALENCE          K1911500
                    *                  STATEMENT.                       K1911510
                    MV01C LD    1 1         LOAD NEXT ID WORD           K1911520
                          AND   3 HF800-X   SAVE TYPE BITS              K1911530
                          EOR   3 HA800-X   CHECK FOR EQUIVALENCE       K1911540
                          BSC  L  MV01E,Z   BR IF NOT EQUIV. STATEMENT  K1911550
                    *                                                   K1911560
                    *                  SKIP TO NEST IN NEXT STATEMENT.  K1911570
                          MDX   1 3                                     K1911580
                          MDX     MV01D                                 K1911590
                    *************************************************** K1911600
                    *                                                 * K1911610
                    *             END OF THE MOVE ROUTINE             * K1911620
                    *                                                 * K1911630
                    *************************************************** K1911640
                          HDNG    1130 FORTRAN COMPILER PHASE 19        K1911650
                    *************************************************** K1911660
                    *                                                 * K1911670
                    * ROUTINE NAME/RMOVE                              * K1911680
                    *                                                 * K1911690
                    * FUNCTION    /REMOVE BEING ALLOCATED BITS FROM   * K1911700
                    *              THE SYMBOL TABLE.                  * K1911710
                    *                                                 * K1911720
                    * ENTRY       /RMOVE                              * K1911730
                    *                                                 * K1911740
                    * INPUT       /THE SYMBOL TABLE IS INPUT.         * K1911750
                    *                                                 * K1911760
                    * OUTPUT      /THE SYMBOL TABLE WILL BE FREE      * K1911770
                    *              OF BEING ALLOCATED BITS.           * K1911780
                    * EXTERNAL                                        * K1911790
                    * REFERANCES  /REFERANCES TO (SOFST,H0300,H1800,  * K1911800
                    *              D4,EOFST) ARE MADE.                * K1911810
                    *                                                 * K1911820
                    * ERROR       /NONE                               * K1911830
                    *                                                 * K1911840
                    * NOTE        /CALLING SEQUENCE   BSI RMOVE       * K1911850
                    *                                                 * K1911860
                    *************************************************** K1911870
                    *                                                   K1911880
                    *                  ENTRY-RMOVE                      K1911890
                    RMOVE DC      *-*       LINK WORD                   K1911900
                    *                                                   K1911910
                    *                  POINT INDEX REGISTER 1 AT THE    K1911920
                    *                  START OF THE SYMBOL TABLE.       K1911930
                          LDX  I1 SOFST     LOAD XR1 WITH SOFST         K1911940
                    *                                                   K1911950
                    *                  THE SYMBOL TO SEE IF THE BEING   K1911960
                    *                  ALLOCATED BITS ARE ON.           K1911970
                    RM01A LD    1 0         LOAD INDICATOR WORD         K1911980
                          AND   3 H0300-X   TEST BEING ALLOCATED BITS   K1911990
                          EOR   3 H0300-X                               K1912000
                          BSC  L  RM01B,Z   BR IF NOT BEING ALLOCATED   K1912010
                    *                                                   K1912020
                    *                  CLEAR BEING ALLOCATED BITS FROM  K1912030
                    *                  SYMBOL TABLE.                    K1912040
                          LD    1 0         LOAD INDICATOR WORD         K1912050
                          EOR   3 H0300-X   CLEAR BEING ALLOCATED BITS  K1912060
                          STO   1 0         STORE INDICATOR WORD        K1912070
                    *                                                   K1912080
                    *                  TEST TO SEE IF SYMBOL IS         K1912090
                    *                  DIMENSIONED.                     K1912100
                    RM01B LD    1 0         LOAD INDICATOR WORD         K1912110
                          AND   3 H1800-X   SAVE DIMENSIONED BITS       K1912120
                          BSC     Z         SKIP IF NOT DIMENSIONED     K1912130
                    *                                                   K1912140
                    *                  MOVE INDEX REGISTER 1 OVER THE   K1912150
                    *                  DIMENSION INFORMATION.           K1912160
                          MDX   1 -3                                    K1912170
                    *                                                   K1912180
                    *                  MOVE TO NEXT SYMBOL              K1912190
                          MDX   1 -3                                    K1912200
                    *                                                   K1912210
                    *                  TEST TO SEE THE WHOLE SYMBOL     K1912220
                    *                  TABLE HAS BEEN CHECKED.          K1912230
                          STX  L1 D4        SAVE PRESENT POSITION       K1912240
                          LD    3 D4-X      LOAD PRESENT POSITION       K1912250
                          S    L  EOFST     TEST FOR END OF TABLE       K1912260
                          BSC  I  RMOVE,+   BR IF END OF TABLE          K1912270
                          MDX     RM01A                                 K1912280
                    *************************************************** K1912290
                    *                                                 * K1912300
                    *             END OF RMOVE ROUTINE                * K1912310
                    *                                                 * K1912320
                    *************************************************** K1912330
                          HDNG    1130 FORTRAN COMPILER PHASE 19        K1912340
                    *************************************************** K1912350
                    *                                                 * K1912360
                    * ROUTINE NAME/INSER                              * K1912370
                    *                                                 * K1912380
                    * FUNCTION    /INSERT THE ALLOCATION IN THE SYMBOL* K1912390
                    *              TABLE AND PRINT THE ALLOCATION.    * K1912400
                    *                                                 * K1912410
                    * ENTRY       /INSER                              * K1912420
                    *                                                 * K1912430
                    * INPUT       /ALLOCATION IN A REGISTER. INDEX    * K1912440
                    *              REGISTER 2 SET TO POINT AT SYMBOL  * K1912450
                    *              TABLE.                             * K1912460
                    *                                                 * K1912470
                    * OUTPUT      /ALLOCTION IN SYMBOL TABLE AN SYMBOL* K1912480
                    *              READIED FOR PRINTING.              * K1912490
                    *                                                 * K1912500
                    * EXTERNAL                                        * K1912510
                    * REFERANCES  /SUBROUTINES (TOPAU,TOPA,TOPAD,PRINT* K1912520
                    *              BLKPA,NEWPG) ARE CALLED AND        * K1912530
                    *              REFERANCES TO (SALOC,H0002,ALOCB,  * K1912540
                    *              NAME,CCWD,H000C,HFFFF,H0040,H0060, * K1912550
                    *              H00D9,H00C9,H00C3,H005C,H007E,VSIZE* K1912560
                    *              ASIZE,H1800,PAP,RPAP,LNEND,H003C,  * K1912570
                    *              WDCNT,PCHSK) ARE MADE.             * K1912580
                    *                                                 * K1912590
                    * ERROR       /NONE                               * K1912600
                    *                                                 * K1912610
                    * NOTE        /CALLING SEQUENCE    LD  ALLOCATION * K1912620
                    *                                  BSI INSER      * K1912630
                    *                                                 * K1912640
                    *************************************************** K1912650
                    *                                                   K1912660
                    *                  ENTRY-INSER                      K1912670
                    INSER DC      *-*       LINK WORD                   K1912680
                    *                                                   K1912690
                    *                  SAVE THE ALLOCATION IN SALOC.    K1912700
                          STO   3 SALOC-X   SAVE ALLOCATION             K1912710
                    *                                                   K1912720
                    *                  TEST TO SEE IF SYMBOL HAS BEEN   K1912730
                    *                  PREVIOUSLY ALLOCATED.            K1912740
                          LD    2 0         LOAD INDICATOR WORD         K1912750
                          AND   3 H0002-X   SAVE ALLOCATION BIT         K1912760
                          BSC  L  IS01A,+-  BR NOT PREVIOUSLY ALLOCATED K1912770
                    *                                                   K1912780
                    *                  TEST TO SEE THAT ALL ALLOCATIONS K1912790
                    *                  ARE THE SAME.                    K1912800
                          LD    2 1         LOAD PREVIOUS ALLOCATION    K1912810
                          S     3 SALOC-X   CHECK WITH THIS ONE         K1912820
                          BSC  L  ERR67,Z   BR IF NOT THE SAME          K1912830
                          MDX     IS01B     BRANCH                      K1912840
                    *                                                   K1912850
                    *                  PLACE ALLOCATION BITS IN THE     K1912860
                    *                  INDICATOR WORD OF THE SYMBOL     K1912870
                    *                  TABLE.                           K1912880
                    IS01A LD    2 0         LOAD INDICATOR WORD         K1912890
                          OR    3 ALOCB-X   OR IN ALLOCATION BITS       K1912900
                          STO   2 0         STORE INDICATOR WORD        K1912910
                    *                    CHECK IF STANDARD PRECISION    K1912914
                    *                    REAL VARIABLE IS ALLOCATED     K1912915
                    *                    TO AN ODD ADDRESS.             K1912916
                    *                                                   K1912920
                          SLA     1         PLACE REAL IND.IN SIGN 2-11 K1912922
                          BSC  L  IS01B,+Z  BRANCH IF INTEGER      2-11 K1912923
                          LD    3 RSIZE-X   LOAD REAL SIZE         2-11 K1912924
                          BSC  L  IS01B,E   BR IF EXTEND PRECISION 2-11 K1912925
                          LD    3 SALOC-X   LOAD ALLOCATION        2-11 K1912926
                          BSC  L  ERR67,E   ERROR IF NOT EVEN ADDR 2-11 K1912927
                    *                  SAVE THE VARIABLE NAME           K1912930
                    IS01B LD    2 1         LOAD 1ST WORD OF NAME       K1912940
                          STO   3 NAME-X    SAVE 1ST WORD OF NAME       K1912950
                          LD    2 2         LOAD 2ND WORD OF NAME       K1912960
                          STO   3 NAME-X+1  SAVE 2ND WORD OF NAME       K1912970
                    *                                                   K1912980
                    *                  INSERT THE ALLOCATION FOR THIS   K1912990
                    *                  VARIABLE IN THE 2ND WORD OF ITS  K1913000
                    *                  SYMBOL TABLE ENTRY.              K1913010
                          LD    3 SALOC-X   LOAD ALLOCATION             K1913020
                          STO   2 1         PLACE IN SYMBOL TABLE       K1913030
                    *                                                   K1913040
                    *                  TEST TO SEE LIST SYMBOL TABLE    K1913050
                    *                  IS REQUESTED.                    K1913060
                          LD   L  CCWD      LOAD CONTROL CARD WORD      K1913070
                          SLA     12        PLACE LIST S.T. BIT IN SIGN K1913080
                          BSC  I  INSER,-   BRANCH IF NO LISTIN REQUIRE K1913090
                    *                                                   K1913100
                    *                  TEST TO AVOID LISTING G.T. AND   K1913110
                    *                  S.G.T. ENTRY IN SYMBOL TABLE.    K1913120
                          LD    2 0         LOAD ID WORD                K1913130
                          AND   3 H000C-X   SAVE S.G.T. AN G.T. BITS    K1913140
                          BSC  I  INSER,Z   BRANCH IF G.T. OT S.G.T.    K1913150
                    *                                                   K1913160
                    *                  TEST TO AVOID LISTING PREVIOUSLY K1913170
                    *                  LISTED VARIABLE WHEN ALLOCATING  K1913180
                    *                  EQUIVALENCE STATEMENTS.          K1913190
                          LD    2 2         LOAD 2ND WORD IN SYMBOL TAB K1913200
                          EOR   3 HFFFF-X   TEST FOR LISTED             K1913210
                          BSC  I  INSER,+-  BRANCH IF LISTED            K1913220
                    *                                                   K1913230
                    *                  INDICATE THAT THIS VARIABLE HAS  K1913240
                    *                  BEEN LISTED.                     K1913250
                          LD    3 HFFFF-X   LOAD PRINTED INDICATOR      K1913260
                          STO   2 2         PLACE IN SYMBOL TABLE       K1913270
                    *                                                   K1913280
                    *                  TEST TO SEE IF THE HEADING HAS   K1913290
                    *                  BEEN PRINTED.                    K1913300
                          LD    3 HTEST-X   LOAD HEADER INDICATOR       K1913310
                          BSC  L  HD010,+-  BRANCH TO PRINT HEADING     K1913320
                    *                                                   K1913330
                    *                  PLACE THE NAME IN THE PRINTER    K1913340
                    *                  BUFFER.                          K1913350
                    IS01C LD    3 NAME+1-X                              K1913360
                          AND   3 H003F-X                               K1913370
                          BSC  L  GO1,Z                                 K1913380
                          LDD   3 NAME-X                                K1913390
                          RTE     6                                     K1913400
                          STD   3 NAME-X                                K1913410
                          MDX     IS01C                                 K1913420
                    GO1   LD    3 H0040-X   LOAD A BLANK                K1913430
                          BSI     TOPAU     CALL TOPAU                  K1913440
                          LD    3 NAME-X    LOAD NAME                   K1913450
                          SRA     8         SEPARATE 1ST CHARACTER      K1913460
                          BSI     TOPA      CALL TOPA                   K1913470
                          LD    3 NAME-X    LOAD NAME                   K1913480
                          SRA     2         SEPARATE 2ND CHARACTER      K1913490
                          BSI     TOPA      CALL TOPA                   K1913500
                          LDD   3 NAME-X    LOAD NAME                   K1913510
                          SLT     4         SEPARATE 3RD CHARACTER      K1913520
                          BSI     TOPA      CALL TOPA                   K1913530
                          LD    3 NAME+1-X  LOAD NAME                   K1913540
                          SRA     6         SEPARATE 4TH CHARACTER      K1913550
                          BSI     TOPA      CALL TOPA                   K1913560
                          LD    3 NAME+1-X  LOAD 5TH CHARACTER          K1913570
                          BSI     TOPA      CALL TOPA                   K1913580
                    *                                                   K1913590
                    *                  PLACE LEFT PAREN BETWEEN THE     K1913600
                    *                  NAME AND THE VARIABLE TYPES.     K1913610
                          LD    3 H004D-X   LOAD A HYPHEN               K1913620
                          BSI     TOPAU     CALL TOPAU                  K1913630
                    *                                                   K1913640
                    *                  TEST TO SEE IF THE VARIABLE IS   K1913650
                    *                  REAL OR INTEGER AND PLACE THE    K1913660
                    *                  FIRST LETTER IN THE PRINT AREA.  K1913670
                          LD    2 0         LOAD ID WORD                K1913680
                          SLA     2         PLACE TYPE IN CARRY         K1913690
                          LD    3 H00D9-X   LOAD R                      K1913700
                          BSC     C         SKIP IF REAL                K1913710
                          LD    3 H00C9-X   LOAD I                      K1913720
                          BSI     TOPAU     CALL TOPAU                  K1913730
                    *                                                   K1913740
                    *                  TEST TO SEE IF THE VARIABLE IS   K1913750
                    *                  IN COMMON.                       K1913760
                          LD    2 0         LOAD ID WORD                K1913770
                          SLA     2         PLACE COMMON IND. IN SIGN   K1913780
                          STO   3 COMSW-X   STORE IN COMMON SWITCH  2-6 K1913785
                          BSC  L  IS01D,+Z  BRANCH IF IN COMMON         K1913790
                    *                                                   K1913800
                    *                  PLACE A BLANK IN THE PRINT AREA. K1913810
                          LD    3 H0040-X   LOAD BLANK                  K1913820
                          BSI     TOPAU     CALL TOPAU                  K1913830
                          MDX     IS01E     BRANCH                      K1913840
                    *                                                   K1913850
                    *                   PLACE C IN PRINT AREA TO        K1913860
                    *                   INDICATE THE VARIABLE IS        K1913870
                    *                   IN COMMON                       K1913880
                    IS01D LD    3 H00C3-X   LOAD C                      K1913890
                          BSI     TOPAU     CALL TOPAU                  K1913900
                    *                                                   K1913910
                    IS01E LD    3 H005D-X                               K1913920
                          BSI     TOPAU     PUT RIGHT PAREN AFTER TYPE  K1913930
                    *                                                   K1913940
                    *                  PLACE AN EQUAL SIGN IN THE       K1913950
                    *                  PRINT AREA.                      K1913960
                          LD    3 H007E-X   LOAD =                      K1913970
                          BSI     TOPAU     CALL TOPAU                  K1913980
                    *                                                   K1913990
                    *                  PLACE THE ADDRESS OF THE FIRST   K1914000
                    *                  ELEMENT IN THE VARIABLE.         K1914010
                          LD    3 SALOC-X   LOAD ADDRESS                K1914020
                          BSI     TOPAD     CALL TOPAD                  K1914030
                    *                                                   K1914040
                    *                  TEST TO SEE IF THE VARIABLE IS   K1914050
                    *                  AN ARRAY.                        K1914060
                          LD    2 0         LOAD ID WORD                K1914070
                          AND   3 H1800-X   SEPEATE DIMENSION BITS      K1914080
                          BSC  L  IS01F,+-  BRANCH IF NOT DIMENSIONED   K1914090
                    *                                                   K1914100
                    *                  CALL ARRL AND GET THE DATA       K1914110
                    *                  ABOUT THE VARIABLE. COMPUTE      K1914120
                    *                  THE SECOND ADDRESS OF THE        K1914130
                    *                  ARRAY.                           K1914140
                          BSI   3 ARRL-X    CALCULATE ARRAY SIZE        K1914150
                          LD    3 VSIZE-X   LOAD VARIABLE SIZE          K1914160
                          S     3 ASIZE-X   SUBTRACT ARRAY SIZE         K1914170
                          A     3 SALOC-X   FIND LOW ADDRESS            K1914180
                          STO   3 SALOC-X   SAVE 2ND ADDRESS            K1914190
                    *                                                   K1914200
                    *                  PLACE THE HYPHEN BETWEEN THE     K1914210
                    *                  FIRST AND SECOND ADDRESS.        K1914220
                          LD    3 H0060-X   LOAD HYPHEN                 K1914230
                          BSI     TOPAU     CALL TOPAU                  K1914240
                    *                                                   K1914250
                    *                  PLACE THE SECOND ADDRESS IN THE  K1914260
                    *                  PRINT AREA.                      K1914270
                          LD    3 SALOC-X   LOAD 2ND ADDRESS            K1914280
                          BSI     TOPAD     CALL TOPAD                  K1914290
                          MDX     IS01G     BRANCH                      K1914300
                    *                                                   K1914310
                    *                  PLACE BLANKS FOR 2ND ADDRESS IN  K1914320
                    *                  THE PRINT AREA.                  K1914330
                    IS01F LD    3 H0040-X   LOAD A BLANK                K1914340
                          BSI     TOPAU     CALL TOPAU                  K1914350
                          LD    3 H0040-X   LOAD A BLANK                K1914360
                          BSI     TOPAU     CALL TOPAU                  K1914370
                          LD    3 H0040-X   LOAD A BLANK                K1914380
                          BSI     TOPAU     CALL TOPAU                  K1914390
                          LD    3 H0040-X   LOAD A BLANK                K1914400
                          BSI     TOPAU     CALL TOPAU                  K1914410
                          LD    3 H0040-X   LOAD A BLANK                K1914420
                          BSI     TOPAU     CALL TOPAU                  K1914430
                    *                                                   K1914440
                    *                  TEST TO SEE IF WE ARE AT THE     K1914450
                    *                  END OF THE PRINT LINE.           K1914460
                    IS01G LD    3 PAP-X     LOAD PRINT AREA POINTER     K1914470
                          S     3 LNEND-X   SUBTRACT LINE END           K1914480
                          BSC  I  INSER,Z+  BRANCH IF LINE NOT FULL     K1914490
                    *                                                   K1914500
                    *                  RESET THE LINE POINTER AND       K1914510
                          LD    3 RPAP-X    LOAD PRINT AREA ADDRESS     K1914520
                          STO   3 PAP-X     INITIALIZE PRINT AREA PTR.  K1914530
                    *                                                   K1914540
                    *                  PRINT THE LINE.                  K1914550
                          BSI  L  PRINT     CALL PRINT                  K1914560
                    *                                                   K1914570
                    *                  BLANK THE PRINT AREA             K1914580
                          BSI     BLKPA                                 K1914590
                    *                                                   K1914600
                    *                  TEST IF END OF PAGE AND HANDLE   K1914610
                    *                  HEADING.                         K1914620
                          LD   I  $CH12     LOAD END OF PAGE INDICATOR  K1914630
                          BSI  I  NEWPG,Z   BRANCH IF END OF PAGE       K1914640
                          BSC  I  INSER     BRANCH                      K1914650
                    *************************************************** K1914660
                    *                                                 * K1914670
                    *             END OF INSER ROUTINE                * K1914680
                    *                                                 * K1914690
                    *************************************************** K1914700
                          HDNG    1130 FORTRAN COMPILER PHASE 19        K1914710
                    *************************************************** K1914720
                    *                                                 * K1914730
                    * ROUTINE NAME/ TOPA                              * K1914740
                    *                                                 * K1914750
                    * FUNCTION    /CONVERT 6 BIT TRUNCATED EBCDIC     * K1914760
                    *              AND CHECK FOR BLANKS, PLACING THE  * K1914770
                    *              CHARACTER IN THE PRINT AREA.       * K1914780
                    *                                                 * K1914790
                    * ENTRY       /TOPA                               * K1914800
                    *                                                 * K1914810
                    * INPUT       /THE A REGISTER CONTAINS IN THE RIGH* K1914820
                    *              8 BITS THE CHARACTER TO BE PLACED  * K1914830
                    *              IN THE RIGHT AREA.                 * K1914840
                    *                                                 * K1914850
                    * OUTPUT      /CHARACTER IS PLACED.               * K1914860
                    *                                                 * K1914870
                    * EXTERNAL                                        * K1914880
                    * REFERANCES  /SUBROUTINES (TOPAU) ARE CALLED AND * K1914890
                    *              REFERANCES TO (H003F,H0040,H00C0)  * K1914900
                    *              ARE MADE.                          * K1914910
                    *                                                 * K1914920
                    * ERROR       /NONE                               * K1914930
                    *                                                 * K1914940
                    * NOTE        /CALLING SEQUENCE    LD  CHARACTER  * K1914950
                    *                                  BSI TOPA       * K1914960
                    *                                                 * K1914970
                    *************************************************** K1914980
                    *                                                   K1914990
                    *                  ENTRY-TOPA                       K1915000
                    TOPA  DC      *-*       LINK WORD                   K1915010
                    *                                                   K1915020
                    *                  SAVE THE RIGHT 6 BITS IN THE     K1915030
                    *                  A REGISTER. TEST TO SEE IF THE   K1915040
                    *                  CHARACTER IS BLANK.              K1915050
                          AND   3 H003F-X   SAVE 6 BITS                 K1915060
                          BSC  L  TA01A,Z   BRANCH IF NOT BLANK         K1915070
                    *                                                   K1915080
                    *                  LOAD A BLANK TO BE PLACED IN     K1915090
                    *                  PRINT AREA.                      K1915100
                          LD    3 H0040-X   LOAD BLANK                  K1915110
                          MDX     TA01B     BRANCH                      K1915120
                    *                                                   K1915130
                    *                  MAKE THE CHARACTERS EBCDIC.      K1915140
                    TA01A OR    3 H00C0-X   OR IN THE HIGH BITS         K1915150
                    *                                                   K1915160
                    *                  CALL TOPAU TO PLACE CHARACTER    K1915170
                    *                  IN PRINT AREA.                   K1915180
                    TA01B BSI     TOPAU     CALL TOPAU                  K1915190
                    *                                                   K1915200
                    *                  RETURN                           K1915210
                          BSC  I  TOPA      BRANCH                      K1915220
                    *************************************************** K1915230
                    *                                                 * K1915240
                    *             END OF TOPA ROUTINE                 * K1915250
                    *                                                 * K1915260
                    *************************************************** K1915270
                          HDNG    1130 FORTRAN COMPILER PHASE 19        K1915280
                    *************************************************** K1915290
                    *                                                 * K1915300
                    * ROUTINE NAME/TOPAU                              * K1915310
                    *                                                 * K1915320
                    * FUNCTION    /PLACE CHARACTER IN PRINT AREA.     * K1915330
                    *                                                 * K1915340
                    * ENTRY       /TOPAU                              * K1915350
                    *                                                 * K1915360
                    * INPUT       /CHARACTER IN A REGISTER THAT IS TO * K1915370
                    *              BE PLACED IN THE PRINT BUFFER.     * K1915380
                    *                                                 * K1915390
                    * OUTPUT      /CHARACTER IS PLACED.               * K1915400
                    *                                                 * K1915410
                    * EXTERNAL                                        * K1915420
                    * REFERANCES  /REFERANCES TO (PAP) AR MADE.       * K1915430
                    *                                                 * K1915440
                    * ERROR       /NONE                               * K1915450
                    *                                                 * K1915460
                    * NOTE        /CALLING SEQUENCE    LD  CHARACTER  * K1915470
                    *                                  BSI TOPAU      * K1915480
                    *                                                 * K1915490
                    *************************************************** K1915500
                    *                                                   K1915510
                    *                  ENTRY-TOPAU                      K1915520
                    TOPAU DC      *-*       LINK WORD                   K1915530
                    *                                                   K1915540
                    *                  MOVE THE CHARACTER TO THE LEFT   K1915550
                    *                  SIDE OF THE A REGISTER.          K1915560
                          SLA     8         MOVE LEFT CHARACTER         K1915570
                    *                                                   K1915580
                    *                  PLACE CHARACTER IN PRINT AREA.   K1915590
                          STO  I  PAP       PLACE CHARACTER             K1915600
                          MDX  L  PAP,1     INCREMENT POINTER           K1915610
                    *                                                   K1915620
                    *                  RETURN                           K1915630
                          BSC  I  TOPAU     BRANCH                      K1915640
                    *************************************************** K1915650
                    *                                                 * K1915660
                    *             END OF TOPAU ROUTINE                * K1915670
                    *                                                 * K1915680
                    *************************************************** K1915690
                          HDNG    1130 FORTRAN COMPILER PHASE 19        K1915700
                    *************************************************** K1915710
                    *                                                 * K1915720
                    * ROUTINE NAME/TOPAD                              * K1915730
                    *                                                 * K1915740
                    * FUNCTION    /PLACE HEXIDECIMAL ADDRESS IN THE   * K1915750
                    *              PRINT AREA.                        * K1915760
                    *                                                 * K1915770
                    * ENTRY       /TOPAD                              * K1915780
                    *                                                 * K1915790
                    * INPUT       /HEXIDECIMAL WORD IS IN THE A       * K1915800
                    *              REGISTER.                          * K1915810
                    *                                                 * K1915820
                    * OUTPUT      /THE FOUR HEXIDECIMAL CHARACTERS ARE* K1915830
                    *              PLACED IN THE PRINT AREA.          * K1915840
                    *                                                 * K1915850
                    * EXTERNAL                                        * K1915860
                    * REFERANCES  /SUBROUTINES (TOPAH) ARE CALLED AND * K1915870
                    *              REFERANCES TO (SAVAD,H4000) ARE    * K1915880
                    *              MADE.                              * K1915890
                    *                                                 * K1915900
                    * ERROR       /NONE                               * K1915910
                    *                                                 * K1915920
                    * NOTE        /CALLING SEQUENCE    LD  ADDRESS    * K1915930
                    *                                  BSI TOPAD      * K1915940
                    *                                                 * K1915950
                    *************************************************** K1915960
                    *                                                   K1915970
                    *                  ENTRY-TOPAD                      K1915980
                    TOPAD DC      *-*       LINK WORD                   K1915990
                    *                                                   K1916000
                    *                  SAVE ADDRESS TO BE PLACED IN     K1916010
                    *                  THE PRINT AREA.                  K1916020
                          STO   3 SAVAD-X   SAVE ADDRESS                K1916030
                    *                                                   K1916035
                          LD    3 ORGSW-X   IS IT AN ABS PROGRAM    2-4 K1916037
                          BSC  L  TD01A,+-  BRANCH IF NO            2-4 K1916040
                          LD    3 COMSW-X   BRANCH IF VARIABLE      2-6 K1916041
                          BSC  L  TD01A,+Z  *IN COMMON              2-6 K1916042
                          LD   L  ORG        YES - RELOCATE         2-4 K1916043
                          A     3 SAVAD-X    THE ADDRESS AND        2-4 K1916044
                          STO   3 SAVAD-X    STORE BACK             2-4 K1916045
                          BSC  L  TD01A,-    IF NEGATIVE            2-4 K1916046
                          MDX  L  ERROR,64   SET ERROR 86           2-4 K1916047
                          BSC  L  EXIT       AND EXIT               2-4 K1916048
                    *                                                   K1916050
                    *                  PLACE THE HEX ADDRESS IN THE     K1916060
                    *                  PRINT AREA.                      K1916070
                    TD01A LD    3 SAVAD-X   LOAD SAVED ADDRESS          K1916080
                          SRA     12        ISOLATE 1ST HEX CHARACTER   K1916090
                          BSI     TOPAH     CALL TOPAH                  K1916100
                          LD    3 SAVAD-X   LOAD SAVED ADDRESS          K1916110
                          SRA     8         ISOLATE 2ND HEX CHARACTER   K1916120
                          BSI     TOPAH     CALL TOPAH                  K1916130
                          LD    3 SAVAD-X   LOAD SAVED ADDRESS          K1916140
                          SRA     4         ISOLATE 3RD HEX CHARACTER   K1916150
                          BSI     TOPAH     CALL TOPAH                  K1916160
                          LD    3 SAVAD-X   LOAD 4TH HEX CHARACTER      K1916170
                          BSI     TOPAH     CALL TOPAH                  K1916180
                    *                                                   K1916190
                    *                  RETURN                           K1916200
                          BSC  I  TOPAD     BRANCH                      K1916210
                    *************************************************** K1916220
                    *                                                 * K1916230
                    *             END OF TOPAD ROUTINE                * K1916240
                    *                                                 * K1916250
                    *************************************************** K1916260
                          HDNG    1130 FORTRAN COMPILER PHASE 19        K1916270
                    *************************************************** K1916280
                    *                                                 * K1916290
                    * ROUTINE NAME/ TOPAH                             * K1916300
                    *                                                 * K1916310
                    * FUNCTION    /THIS ROUTINE CONVERTS A 4 BIT      * K1916320
                    *              HEXIDECIMAL DIGIT TO AN EBCDIC     * K1916330
                    *              CHARACTER AND PLACE IN PRINT AREA. * K1916340
                    *                                                 * K1916350
                    * ENTRY       /TOPAH                              * K1916360
                    *                                                 * K1916370
                    * INPUT       /HEXIDECIMAL DIGIT IN A REGISTER.   * K1916380
                    *                                                 * K1916390
                    * OUTPUT      /EBCDIC CHARACTER IS PLACED IN THE  * K1916400
                    *              PRINT AREA.                        * K1916410
                    *                                                 * K1916420
                    * EXTERNAL                                        * K1916430
                    * REFERANCES  /SUBROUTINES (TOPA) ARE CALLED AND  * K1916440
                    *              REFERANCES TO (H000F,H0009,H0039)  * K1916450
                    *              ARE MADE.                          * K1916460
                    *                                                 * K1916470
                    * ERROR       /NONE                               * K1916480
                    *                                                 * K1916490
                    * NOTE        /CALLING SEQUENCE    LD  DIGIT      * K1916500
                    *                                  BSI TOPAH      * K1916510
                    *                                                 * K1916520
                    *************************************************** K1916530
                    *                                                   K1916540
                    *                  ENTRY-TOPAH                      K1916550
                    TOPAH DC      *-*       LINK WORD                   K1916560
                    *                                                   K1916570
                    *                  SEPERATE THE LAST HEX CHARACTER  K1916580
                    *                  IN THE A REGISTER.               K1916590
                          AND   3 H000F-X   HOLD RIGHT HEX CHARACTER    K1916600
                    *                                                   K1916610
                    *                  TEST AND ADJUST 0-9 TO /30-/39   K1916620
                    *                  AND A-F TO /01-/06               K1916630
                          S     3 H0009-X   CHECK AGAINST 9             K1916640
                          BSC     +         SKIP IF A-F                 K1916650
                          A     3 H0039-X   ADJUST NUMBERS 0-9          K1916660
                    *                                                   K1916670
                    *                  CALL TOPAU TO PLACE THE          K1916680
                    *                  CHARACTER IN THE PRINT AREA.     K1916690
                          BSI     TOPA      CALL TOPA                   K1916700
                    *                                                   K1916710
                    *                  RETURN                           K1916720
                          BSC  I  TOPAH     BRANCH                      K1916730
                    *************************************************** K1916740
                    *                                                 * K1916750
                    *             END OF TOPAH ROUTINE                * K1916760
                    *                                                 * K1916770
                    *************************************************** K1916780
                          HDNG    1130 FORTRAN COMPILER PHASE 19        K1916790
                    *************************************************** K1916800
                    *                                                 * K1916810
                    * ROUTINE NAME/BLKPA                              * K1916820
                    *                                                 * K1916830
                    * FUNCTION    /CLEAR THE PRINT AREA TO BLANKS.    * K1916840
                    *                                                 * K1916850
                    * ENTRY       /BLKPA                              * K1916860
                    *                                                 * K1916870
                    * INPUT       /NONE                               * K1916880
                    *                                                 * K1916890
                    * OUTPUT      /PRINT AREA IS CLEARED.             * K1916900
                    *                                                 * K1916910
                    * EXTERNAL                                        * K1916920
                    * REFERANCES  /REFERANCES TO (H0040,PAREA) ARE    * K1916930
                    *              MADE.                              * K1916940
                    *                                                 * K1916950
                    * ERROR       /NONE                               * K1916960
                    *                                                 * K1916970
                    * NOTE        /CALLING SEQUENCE    BSI BLKPA      * K1916980
                    *                                                 * K1916990
                    *************************************************** K1917000
                    *                                                   K1917010
                    *                  ENTRY-BLKPA                      K1917020
                    BLKPA DC      IS01C     LINK WORD                   K1917030
                    *                                                   K1917040
                    *                  CLEAR THE PRINT AREA USING       K1917050
                    *                  INDEX REGISTER 3.                K1917060
                          LD    3 H4000-X   LOAD BLANK                  K1917070
                          LDX   3 -120      LOAD XR3 WITH -120          K1917080
                          STO  L3 PAREA+120 PLANK PRINT AREA            K1917090
                          MDX   3 1         INCREMENT XR3 BY 1          K1917100
                          MDX     *-4       BRANCH                      K1917110
                    *                                                   K1917120
                    *                  RESTORE INDEX REGISTER 3 TO      K1917130
                    *                  POINT LITERAL POOL.              K1917140
                          LDX  L3 X         LOAD XR3                    K1917150
                    *                                                   K1917160
                    *                  RETURN                           K1917170
                          BSC  I  BLKPA     BRANCH                      K1917180
                          HDNG    1130 FORTRAN COMPILER PHASE 19        K1917190
                    *************************************************** K1917200
                    *                                                 * K1917210
                    * ROUTINE NAME/ALLOC                              * K1917220
                    *                                                 * K1917230
                    * FUNCTION    /ALLOCATE ALL COMMON AND NON-       * K1917240
                    *              EQUIVALENCED VARIABLES.            * K1917250
                    *                                                 * K1917260
                    * ENTRY       /ALLOC                              * K1917270
                    *                                                 * K1917280
                    * INPUT       /NO SPECIAL INPUT OTHER THAN THE    * K1917290
                    *              SYMBOL TABLE.                      * K1917300
                    *                                                 * K1917310
                    * OUTPUT      /THE PART OF THE SYMBOL TABLE THIS  * K1917320
                    *              IS CONTROLED BY THE PRESENT SETTING* K1917330
                    *              OF TRACK SWITCH IS ALLOCATED.      * K1917340
                    *                                                 * K1917350
                    * EXTERNAL                                        * K1917360
                    * REFERANCES  /SUBROUTINES (ARRL,INSER,VARF0) ARE * K1917370
                    *              CALLED AN REFERANCES TO (TRACK,BASE* K1917380
                    *              SOFST,CSIZE,LCOMN,CCWD,VSIZE,RELAD,* K1917390
                    *              D4,H1800,EOFST,H0028,H07D2,H0001,  * K1917400
                    *              VARCR,CAC) ARE MADE.               * K1917410
                    *                                                 * K1917420
                    * ERROR       /NONE                               * K1917430
                    *                                                 * K1917440
                    * NOTES       /CALLING SEQUENCE    BSI ALLOC      * K1917450
                    *                                                 * K1917460
                    *              TRACK SWITCH CONTROLS THE ALLOCATIO* K1917470
                    *              OF PARTS OF THE SYMBOL TABLE AS    * K1917480
                    *              FOLLOWS                            * K1917490
                    *                   PLUS -COMMON                  * K1917500
                    *                   ZERO -REAL VARIABLES          * K1917510
                    *                   MINUS-INTEGER VARIABLES       * K1917520
                    *                                                 * K1917530
                    *************************************************** K1917540
                    *                                                   K1917550
                    *                  ENTRY-ALLOC                      K1917560
                    ALLOC DC      *-*       LINK WORD                   K1917570
                    *                                                   K1917580
                    *                  LOAD INDEX REGISTER 2 WITH THE   K1917590
                    *                  START OF THE SYMBOL TABLE.       K1917600
                          LDX  I2 SOFST     LOAD XR2                    K1917610
                    *                                                   K1917620
                    *                  TEST TRACK SWITCH TO DECIDE      K1917630
                    *                  THE ALLOCATION TO BE PREFORMED.  K1917640
                    AL01A LD    3 TRACK-X   LOAD TRACK SWITCH           K1917650
                          BSC  L  AL01B,-+  BR TO ALLOC. REAL SYMBOLS   K1917660
                          BSC  L  AL01C,-Z  BR TO ALLOC. INTEGER SYMBOL K1917670
                    *                                                   K1917680
                    *                  TEST TO SEE IF PRESENT SYMBOL IS K1917690
                    *                  A CONSTANT.                      K1917700
                          LD    2 0         LOAD INDICATOR WORD         K1917710
                          BSC  L  AL01D,+Z  BR IF CONSTANT              K1917720
                    *                                                   K1917730
                    *                  REPOSITION SYMBOL TABLE NAME TO  K1917740
                    *                  READY FOR LATER PRINTING.        K1917750
                          SLT     16        CLEAR EXTENSION REGISTER    K1917760
                          LD    2 2         LOAD RIGHT 2 CHARACTERS     K1917770
                          SRT     15        PLACE IN Q REGISTER         K1917780
                          LD    2 1         LOAD LEFT 3 CHARACTERS      K1917790
                          SLT     1         REMOVE LEADING BIT          K1917800
                          RTE     2         RE-POSITION NAME            K1917810
                          STO   2 1         STORE REPOSITIONED NAME     K1917820
                          RTE     16                                    K1917830
                          STO   2 2                                     K1917840
                    *                                                   K1917850
                    *                  TEST TO SEE IF VARIABLE IS IN    K1917860
                    *                  COMMON.                          K1917870
                          LD    2 0         LOAD INDICATOR WORD         K1917880
                          SLA     2         PLACE COMMON IND. IN SIGN   K1917890
                          BSC  L  AL01E,-   BR IF NOT IN COMMON         K1917900
                    *                                                   K1917910
                    *                                                   K1917920
                    *                  PLACE BLANK COMMON ADDRESS IN    K1917930
                    *                  BASE.                            K1917940
                          LD   L  CSIZE     LOAD BLANK COMMON ADDRESS   K1917950
                    *                                                   K1917960
                    *                  TEST THE ADDRESS IN BASE FOR     K1917970
                    *                  BEING ODD.                       K1917980
                    AL01G STO   3 BASE-X    SAVE BASE                   K1917990
                          BSC  L  AL01H,E   BR IF BASE IS ODD           K1918000
                    *                                                   K1918010
                    *                  TEST THIS SYMBOL FOR BEING       K1918020
                    *                  REAL.                            K1918030
                          LD    2 0         LOAD INDICATOR WOR          K1918040
                          SLA     1         PLACE REAL IND. IN SIGN     K1918050
                          BSC  L  AL01H,+Z  BR IF INTEGER               K1918060
                    *                                                   K1918070
                    *                  TEST TO SEE IF THIS PROGRAM IS   K1918080
                    *                  STANDARD PRECISION.              K1918090
                    *                             *1 INSTR REMOVED 2-11 K1918100
                          LD    3 RSIZE-X   LOAD REAL SIZE         2-11 K1918110
                          BSC  L  AL01H,E   BR IF EXTEND PRECISION 2-11 K1918120
                    *                                                   K1918130
                    *                  CORRECT BASE TO BE ODD FOR THE   K1918140
                    *                  RIGHT WORD OF STANDARD PRECISION K1918150
                    *                  REAL SYMBOLS.                    K1918160
                          MDX  L  BASE,-1   DECRAMENT BASE BY 1         K1918170
                    *                                                   K1918180
                    *                  CALL ARRL  TO DETERMINE THE SIZE K1918190
                    *                  OF THE SYMBOL ELEMENTS.          K1918200
                    AL01H BSI   3 ARRL-X    CALL ARRL                   K1918210
                    *                                                   K1918220
                    *                  UPDATE THE ADDRESS OF COMMON     K1918230
                    *                  BEING HANDLED.                   K1918240
                          LD    3 BASE-X    LOAD BASE ADDRESS OF SYMBOL K1918250
                          S     3 ASIZE-X   SUBTRACT ARRAY SIZE         K1918260
                          STO   3 BASE-X    SAVE ADJUSTED BASE          K1918270
                    *                                                   K1918280
                          STO  L  CSIZE     *                           K1918290
                    *                                                   K1918300
                    *                  COMPUTE THE ADDRESS OF THE       K1918310
                    *                  SYMBOL.                          K1918320
                    AL01J LD    3 BASE-X    LOAD BASE ADDRESS OF SYMBOL K1918330
                          A     3 ASIZE-X   ADD ARRAY SIZE              K1918340
                          S     3 VSIZE-X   COMPUTE ADDRESS OF LEFT     K1918350
                          A     3 H0001-X        WORD                   K1918360
                    *                                                   K1918370
                    *                  CALL INSER TO PLACE ALLOCATION   K1918380
                    *                  IN THE SYMBOL TABLE.             K1918390
                    AL01L BSI  L  INSER     CALL INSER                  K1918400
                    *                                                   K1918410
                    *                  TEST TO SEE IF PRESENT SYMBOL    K1918420
                    *                  TABLE ENTRY IS DIMENSIONED.      K1918430
                    AL01D LD    2 0         LOAD INDICATOR WORD         K1918440
                          AND   3 H1800-X   SAVE DIMENSION IND. BITS    K1918450
                          BSC     Z         SKIP IF NOT DIMENSIONED     K1918460
                    *                                                   K1918470
                    *                  MOVE SYMBOL TABLE POINTER OVER   K1918480
                    *                  THE DIMENSION INFORMATION.       K1918490
                          MDX   2 -3                                    K1918500
                    *                                                   K1918510
                    *                  MOVE SYMBOL TABLE POINTER TO     K1918520
                    *                  NEXT SYMBOL.                     K1918530
                          MDX   2 -3                                    K1918540
                    *                                                   K1918550
                    *                  TEST TO SEE IF POINTER HAS       K1918560
                    *                  PASSED OVER THE WHOLE SYMBOL     K1918570
                    *                  TABLE.                           K1918580
                          STX  L2 D4        SAVE PRESENT POINTER        K1918590
                          LD    3 D4-X      TEST FOR END OF TABLE       K1918600
                          S    L  EOFST                                 K1918610
                          BSC  L  AL01A,Z-  BR IF NOT END OF TABLE      K1918620
                    *                                                   K1918630
                    *                  MOVE THE TRACK SWITCH TO ITS     K1918640
                    *                  NEXT POSITION.                   K1918650
                          LD    3 TRACK-X   LOAD TRACK SWITCH           K1918660
                          A     3 H0001-X   MOVE TO NEXT POSITION       K1918670
                          STO   3 TRACK-X   STORE TRACK SWITCH          K1918680
                    *                                                   K1918690
                    *                  RETURN                           K1918700
                          BSC  I  ALLOC     RETURN                      K1918710
                    *                                                   K1918720
                    *                  TEST TO SEE IF THE PRESENT       K1918730
                    *                  SYMBOL IS A GENERATED TEMPERARY. K1918740
                    *                             *1 INSTR REMOVED 2-11 K1918750
                    AL01E SLA     10        PLACE G.T. IND IN SIGN 2-11 K1918760
                          BSC  L  AL01D,-   BR IF NOT G.T.              K1918770
                    *                                                   K1918780
                    *                  MAKE SURE ALL G.T.S ARE REAL     K1918790
                    *                  VARIABLES.                       K1918800
                          LD    3 H0028-X   LOAD NEW INDICATOR WORD     K1918810
                          STO   2 0         SAVE FOR G.T. IND. WORD     K1918820
                          MDX     AL01D                                 K1918830
                    *                                                   K1918840
                    *                  TEST TO SEE IF PRESENT SYMBOL    K1918850
                    *                  IS REAL.                         K1918860
                    AL01B LD    2 0          LOAD INDICATOR WORD        K1918870
                          SLA     1         PLACE REAL IND. IN SIGN     K1918880
                          BSC  L  AL01D,+Z  BR IF NOT REAL SYMBOL       K1918890
                          BSI   3 EVENA-X   MAKE ADDRESS EVEN           K1918900
                          MDX     AL01M                                 K1918910
                    *                                                   K1918920
                    *                  TEST TO SEE IF PRESENT SYMBOL    K1918930
                    *                  IS INTEGER.                      K1918940
                    AL01C LD    2 0         LOAD INDICATOR WORD         K1918950
                          SLA     1         PLACE INTEGER IND. IN SIGN  K1918960
                          BSC  L  AL01D,-   BR IF NOT INTEGER SYMBOL    K1918970
                    *                                                   K1918980
                    *                  TEST TO SEE IF PRESENT SYMBOL    K1918990
                    *                  IS CONSTANT.                     K1919000
                    *                                                   K1919002
                    AL01M LD    2 0                                 2-6 K1919004
                          BSC  L  AL01N,+Z  BRANCH IF CONSTANT      2-6 K1919010
                    *                                                   K1919020
                    *                  TEST TO SEE IF THE SYMBOL        K1919030
                    *                  SHOULD BE ALLOCATED NOW.         K1919040
                          LD    2 0         LOAD INDICATOR WORD         K1919050
                          AND   3 H07F2-X   SAVE SOME IND. BITS         K1919060
                          EOR   3 H0020-X                               K1919070
                          BSC  L  AL01D,Z   BR IF SHOULD NOT BE ALLOC.  K1919080
                    *                                                   K1919090
                    *                  TEST TO SEE IF THE PRESENT       K1919100
                    *                  SYMBOL IS A SUBSCRIPT GENERATED  K1919110
                    *                  TEMPERARY.                       K1919120
                          LD    2 0         LOAD INDICATOR WORD         K1919130
                          SLA     13        PLACE S.G.T. BIT IN SIGN    K1919140
                          BSC  L  AL01I,-   BR IF NOT S.G.T.            K1919150
                    *                                                   K1919160
                    *                  ADJUST THE VARIABLE AREA SIZE    K1919170
                    *                  BY 1.                            K1919180
                          LD    3 VARCR-X   LOAD VARIABLE ADDRESS       K1919190
                          A     3 H0001-X   INCRAMENT BY 1              K1919200
                          STO   3 VARCR-X   SAVE VARIABLE ADDRESS       K1919210
                          S     3 H0001-X   DECREMENT BY 1              K1919220
                          MDX     AL01L                                 K1919230
                    *                                                   K1919240
                    *                  CALL ARRL TO FIND THE AMOUNT OF  K1919250
                    *                  STORAGE REQUIRED FOR THIS        K1919260
                    *                  VARIABLE.                        K1919270
                    AL01I BSI   3 ARRL-X    CALL ARRL                   K1919280
                    *                                                   K1919290
                    *                  MODIFY THE SIZE OF VARIABLE      K1919300
                    *                  STORAGE AREA.                    K1919310
                          LD    3 VARCR-X   LOAD VARIABLE ADDRESS       K1919320
                          A     3 ASIZE-X   ADJUST FOR SIZE OF SYMBOL   K1919330
                          BSC  L  ARRL1,+   ERROR 99 IF NONPOSITIVE 2-7 K1919335
                          STO   3 VARCR-X   SAVE VARIABLE ADDRESS       K1919340
                    *                                                   K1919350
                    *                  COMPUTE ADDRESS OF SYMBOL        K1919360
                          S     3 VSIZE-X   REMOVE ELEMENT SIZE         K1919370
                          MDX     AL01L                                 K1919380
                    *                                                   K1919390
                    *                  CALL VARF0 TO COMPUTE SIZE OF    K1919400
                    *                  CONSTANT.                        K1919410
                    AL01N BSI   3 VARFO-X   CALL VARFO                  K1919420
                    *                                                   K1919430
                    *                  INCRAMENT THE SIZE OF THE        K1919440
                    *                  CONSTANT AREA.                   K1919450
                          LD    3 CAC-X     LOAD CONSTANT AREA COUNT    K1919460
                          A     3 VSIZE-X   INCRAMENT BY CONSTANT SIZE  K1919470
                          STO   3 CAC-X     SAVE CONSTANT AREA COUNT    K1919480
                          MDX     AL01D                                 K1919490
                    *************************************************** K1919500
                    *                                                 * K1919510
                    *             END OF ALLOC ROUTINE                * K1919520
                    *                                                 * K1919530
                    *************************************************** K1919540
                          HDNG    1130 FORTRAN COMPILER PHASE 19        K1919550
                    *************************************************** K1919560
                    *                                                 * K1919570
                    * ROUTINE NAME/EQUIV                              * K1919580
                    *                                                 * K1919590
                    * FUNCTION    /THIS ROUTINE HANDLES THE EQUIVALENC* K1919600
                    *              STATEMENT FOR BOTH COMMON AND NON- * K1919610
                    *              COMMON VARIABLES.                  * K1919620
                    *                                                 * K1919630
                    * ENTRY       /EQUIV                              * K1919640
                    *                                                 * K1919650
                    * INPUT       /NO SPECIAL INPUT OTHER THAN THE    * K1919660
                    *              STRING AND SYMBOL TABLE WITH ALL   * K1919670
                    *              COMMON VARIABLES ALLOCATED.        * K1919680
                    *                                                 * K1919690
                    * OUTPUT      /VARIABLES NOT IN EQUIVALENCE ARE   * K1919700
                    *              NOT ALLOCATED.                     * K1919710
                    *                                                 * K1919720
                    * EXTERNAL                                        * K1919730
                    * REFERENCES  /SUBROUTINES (INIT,INCR,EVENA,RMOVE,* K1919740
                    *              GETD4,RTN,HILO,INSER) ARE REQUIRED * K1919750
                    *              AND REFERENCES TO (SW1,SW2,SW3,SW4,* K1919760
                    *              LOW,HIGH,DEFIN,TAGLP,H0C00,CARCR,  * K1919770
                    *              BASE,H0300,NRA,SNRA,D4,RELAD,H0020,* K1919780
                    *              H8000) ARE REFERANCED.             * K1919790
                    *                                                 * K1919800
                    * ERROR       /ERROR C-65 IS DETECTED AND CONTROL * K1919810
                    *              IS TRANSFERED TO ERR65.            * K1919820
                    *                                                 * K1919830
                    *                                                 * K1919840
                    *************************************************** K1919850
                    *                                                   K1919860
                    *                  ENTRY - EQUIV                    K1919870
                    EQUIV DC      *-*       LINK WORD                   K1919880
                    *                                                   K1919890
                    *                                                   K1919900
                    *                                                   K1919910
                    *                                                   K1919920
                          SLA     16        CLEAR VARCR TO EQUIVALENCE  K1919930
                          STO   3 VARCR-X   COMMON VARIABLES.           K1919940
                    *                                                   K1919950
                    *                  INITIALIZE NEST LIMITS.          K1919960
                    *                             *1 INSTR REMOVED 2-11 K1919970
                    EQ01D STO   3 LOW-X     PLACE ZERO IN LOW      2-11 K1919980
                          STO   3 HIGH-X                  HIGH          K1919990
                          STO   3 ODDSW-X                 ODDSW         K1920000
                          STO   3 EVSW-X                  EVSW          K1920010
                          STO   3 DEFIN-X             AND DEFIN         K1920020
                    *                                                   K1920030
                    *                  SET SWITCH 4 TO NORMAL.          K1920040
                    *                             *1 INSTR REMOVED 2-11 K1920050
                          STO   3 SW4-X               AND SW4      2-11 K1920060
                    *                                                   K1920070
                    *                  CALL INIT TO FIND FIRST NON-     K1920080
                    *                  DELETED NEST IN EQUIVALENCE      K1920090
                    *                  STATEMENTS.                      K1920100
                    EQ01I BSI   3 INIT-X    CALL INIT                   K1920110
                          DC      EQ03B     BR IF END OF ALL EQUIV.     K1920120
                          DC      *         NORMAL RETURN               K1920130
                    *                                                   K1920140
                    *                  SET SWITCH 2 TO NORMAL           K1920150
                          SLA     16        PLACE ZERO IN SW2           K1920160
                          STO   3 SW2-X                                 K1920170
                    *                                                   K1920180
                    *                  TEST THE LEFT PARENTHESIS IN     K1920190
                    *                  NEST TO SEE IF VARIABLES IN      K1920200
                    *                  THIS NEST HAVE BEEN LOOKED AT.   K1920210
                    EQ01A LD    1 -1        LOAD LEFT PARENTHESIS       K1920220
                          S     3 TAGLP-X   TEST FOR TAGED PARENTHESIS  K1920230
                          BSC  L  EQ01G,Z   BR IF LEFT PARENTHESIS OK   K1920240
                    *                                                   K1920250
                    *                  INCRAMENT THE ITEM POINTER TO    K1920260
                    *                  THE NEXT SYMBOL.                 K1920270
                          BSI   3 INCR-X    CALL INCR                   K1920280
                          DC      EQ01F     BR IF END OF ALL EQUIV.     K1920290
                          DC      EQ01A     BR IF END OF NEST           K1920300
                          MDX     *-4                                   K1920310
                    *                                                   K1920320
                    *                  TEST THE SYMBOL BEING LOOKED     K1920330
                    *                  AT FOR BEING IN COMMON.          K1920340
                    EQ01G LD    2 0         LOAD INDICATOR WORD         K1920350
                          SLA     2         PLACE COMMON IND. IN SIGN   K1920360
                          BSC  L  EQ02B,+Z  BR IF SYMBOL IN COMMON      K1920370
                    *                                                   K1920380
                    *                  TEST THE SYMBOL BEING LOOKED     K1920390
                    *                  AT FOR BEING ALLOCATED.          K1920400
                          AND   3 H0C00-X                               K1920410
                          EOR   3 H0C00-X                               K1920420
                          BSC  L  EQ02A,+-  BR IF SYMBOL BEING ALOCATED K1920430
                    *                                                   K1920440
                    *                  INCRAMENT THE ITEM POINTER TO    K1920450
                    *                  THE NEXT SYMBOL.                 K1920460
                          BSI   3 INCR-X    CALL INCR                   K1920470
                          DC      EQ01F     BR IF END OF ALL EQUIV.     K1920480
                          DC      EQ01A     BR IF END OF NEST           K1920490
                          MDX     EQ01G                                 K1920500
                    *                                                   K1920510
                    *                  TAG SWITCH 4                     K1920520
                    EQ01E STO   3 SW4-X     PLACE NONZERO IN SW4        K1920530
                          MDX     EQ01I                                 K1920540
                    *                                                   K1920550
                    *                  TEST SWITCH 2                    K1920560
                    EQ01F LD    3 SW2-X     LOAD SWITCH 2               K1920570
                          BSC  L  EQ01E,Z   BR IF SWITCH 2 TRANSFER     K1920580
                    *                                                   K1920590
                    *                  TEST SWITCH 4                    K1920600
                          LD    3 SW4-X     LOAD SWITCH 4               K1920610
                          BSC  L  EQ03B,+-  BRANCH IF SWITCH 4 NORMAL   K1920620
                    *                                                   K1920630
                    *                  CALL EVENA TO MAKE VARCR EVEN    K1920640
                    *                                              2-11 K1920642
                    *                             *5 INSTR REMOVED 2-11 K1920644
                    *                                              2-11 K1920645
                          BSI   3 EVENA-X   CALL EVENA                  K1920650
                    *                                                   K1920660
                    *             TEST TO SEE IF THE LOW ADDRESS        K1920670
                    *             FOR THE NEST IS ODD.                  K1920680
                    *                                                   K1920690
                          LD    3 LOW-X     LOAD LOW ADDRESS            K1920700
                          BSC  L  EQ03G,E   BRANCH IF ODD               K1920710
                    *                                                   K1920720
                    *             TEST TO SEE IF THE ODD SWITCH IS      K1920730
                    *             SET ON.                               K1920740
                    *                                                   K1920750
                          LD    3 ODDSW-X   LOAD ODD SWITCH             K1920760
                          BSC  L  EQ03H,Z   BRANCH ODD SWITCH ON        K1920770
                          MDX     EQ03I     BRANCH                      K1920780
                    *                                                   K1920790
                    *             TEST TO SEE IF THE EVEN SWITCH IS     K1920800
                    *             SET ON.                               K1920810
                    *                                                   K1920820
                    EQ03G LD    3 EVSW-X    LOAD EVEN SWITCH            K1920830
                          BSC  L  EQ03I,+-  BRANCH IF EVEN SWITCH OFF   K1920840
                    *                                                   K1920850
                    *             SUBTRACT 1 FROM LOW                   K1920860
                    *                                                   K1920870
                    EQ03H LD    3 LOW-X     CALCULATE LOW=LOW-1         K1920880
                          S     3 H0001-X                               K1920890
                          STO   3 LOW-X                                 K1920900
                    *                                                   K1920910
                    *                  ADJUST VARIABLE AREA TO INCLUDE  K1920920
                    *                  THE PRESENT NEST. SAVE IN BASE   K1920930
                    *                  THE ADDRESS USED FOR ALLOCATION  K1920940
                    *                  OF THE NEST.                     K1920950
                    EQ03I LD    3 VARCR-X   LOAD VARIABLE ADDRESS       K1920960
                          S     3 LOW-X     SUBTRACT LOW ADDRESS        K1920970
                          STO   3 BASE-X    SAVE BASE FOR NEST          K1920980
                          A     3 HIGH-X    ADD HIGH ADDRESS            K1920990
                          A     3 H0001-X   INCREMENT               2-1 K1921000
                          STO   3 VARCR-X   STORE ADJUSTED ADDRESS      K1921010
                    *                                                   K1921020
                    *                  CALL INIT TO FIND FIRST NON-     K1921030
                    *                  DELETED NEST IN EQUIVALENCE      K1921040
                    *                  STATEMENTS.                      K1921050
                          BSI   3 INIT-X    CALL INIT                   K1921060
                          DC      *         BR IF END OF ALL EQUIV.     K1921070
                          DC      *         NORMAL RETURN               K1921080
                    *                                                   K1921090
                    *                  TEST SYMBOL BEING LOOKED AT      K1921100
                    *                  FOR BEING ALLOCATED.             K1921110
                    EQ01C LD    2 0         LOAD INDICATOR WORD         K1921120
                          AND   3 H0300-X                               K1921130
                          EOR   3 H0300-X                               K1921140
                          BSC  L  EQ03A,+-  BR IF SYMBOL BEING ALOCATED K1921150
                    *                                                   K1921160
                    *                  INCRAMENT THE ITEM POINTER TO    K1921170
                    *                  THE NEXT SYMBOL                  K1921180
                          BSI   3 INCR-X    CALL INCR                   K1921190
                          DC      EQ01B     BR IF END OF ALL EQUIV.     K1921200
                          DC      EQ01C     BR IF END OF NEST           K1921210
                          MDX     *-4                                   K1921220
                    *                                                   K1921230
                    *                  REMOVE BEING ALLOCATED BITS      K1921240
                    *                  FROM SYMBOL TABLE.               K1921250
                    EQ01B BSI  L  RMOVE     CALL RMOVE                  K1921260
                          MDX     EQ03B                                 K1921270
                    *                                                   K1921280
                    *                  TEST SWITCH 1                    K1921290
                    EQ02A LD    3 SW1-X     LOAD SW1                    K1921300
                          BSC  L  EQ02C,+-  BR IF SWITCH 1 NORMAL       K1921310
                    *                                                   K1921320
                    *                  SAVE THE PRESENT POSITION AND    K1921330
                    *                  READY FOR A SCAN TO FIND THE     K1921340
                    *                  ALLOCATION FOR THIS VARIABLE.    K1921350
                          STX   1 EQ02G+1   SAVE XR1                    K1921360
                          STX   2 EQ02G+3   SAVE XR2                    K1921370
                          LD    3 NRA-X     SAVE NEST RETURN ADDRESS    K1921380
                          STO   3 SNRA-X                                K1921390
                    *                                                   K1921400
                    *                  CALL INIT TO FIND FIRST NON-     K1921410
                    *                  DELETED NEST IN EQUIVALENCE      K1921420
                    *                  STATEMENTS.                      K1921430
                          BSI   3 INIT-X    CALL INIT                   K1921440
                          DC      *         BR IF END OF ALL EQUIV.     K1921450
                          DC      *         NORMAL RETURN               K1921460
                    *                                                   K1921470
                    *                  TEST THE LEFT PARENTHESIS IN     K1921480
                    *                  NEST TO SEE IF VARIABLES IN      K1921490
                    *                  THIS NEST HAVE BEEN LOOKED AT.   K1921500
                    EQ02D LD    1 -1        LOAD LEFT PARENTHESIS       K1921510
                          S     3 TAGLP-X   TEST FOR TAGED PARENTHESIS  K1921520
                          BSC  L  EQ02E,+-  BR IF PARENTHESIS TAGED     K1921530
                    *                                                   K1921540
                    *                  INCRAMENT THE ITEM POINTER TO    K1921550
                    *                  THE NEXT SYMBOL.                 K1921560
                          BSI   3 INCR-X                                K1921570
                          DC      EQ02D     BR IF END OF ALL EQUIF.     K1921580
                          DC      EQ02D     BR IF END OF NEST           K1921590
                          MDX     *-4                                   K1921600
                    *                                                   K1921610
                    *                  TEST SYMBOL BEING LOOKED AT      K1921620
                    *                  TO SEE IF IT IS SAME AS SAVED    K1921630
                    *                  ONE.                             K1921640
                    EQ02E LD   I  EQ02G+1   LOAD SAVE SYMBOL            K1921650
                          S     1 0         COMPARE PRESENT SYMBOL      K1921660
                          BSC  L  EQ02F,+-  BR IF SYMBOLS SAME          K1921670
                    *                                                   K1921680
                    *                  INCRAMENT THE ITEM POINTER TO    K1921690
                    *                  THE NEXT SYMBOL.                 K1921700
                          BSI   3 INCR-X    CALL INCR                   K1921710
                          DC      EQ02D     BR IF END OF ALL EQUIV.     K1921720
                          DC      EQ02D     BR IF END OF NEST           K1921730
                          MDX     EQ02E                                 K1921740
                    *                                                   K1921750
                    *                  GET THE D4 FOR THE VARIABLE      K1921760
                    *                  THAT IS BEING LOOKED AT.         K1921770
                    EQ02F BSI   3 GETD4-X   CALL GETD4                  K1921780
                    *                                                   K1921790
                    *                  RETURN POINTER TO THE BEGINNING  K1921800
                    *                  OF THE PRESENT NEST.             K1921810
                          BSI   3 RTN-X     CALL RTN                    K1921820
                    *                                                   K1921830
                    *                  CALCULATE RELATIVE ADDRESS       K1921840
                    *                  FOR VARIABLE FOUND IN SAVED      K1921850
                    *                  NEST.                            K1921860
                          LD    1 1         LOAD NEST ADDRESS           K1921870
                          A     3 D4-X      ADD D4 FOR VARIABLE IN NEST K1921880
                          STO   3 RELAD-X   SAVE RELATIVE ADDRESS       K1921890
                    *                                                   K1921900
                    *                  RESTORE POINTER TO SAVED         K1921910
                    *                  POSITION IN OTHER NEST.          K1921920
                    EQ02G LDX  L1 *-*       RESTORE XR1                 K1921930
                          LDX  L2 *-*       RESTORE XR2                 K1921940
                          LD    3 SNRA-X    REPLACE NEST RETURN ADDRESS K1921950
                          STO   3 NRA-X                                 K1921960
                          MDX     EQ02H                                 K1921970
                    *                                                   K1921980
                    *                  GET RELATIVE ADDRESS IN COMMON   K1921990
                    *                  FROM SYMBOL TABLE.               K1922000
                    EQ02B LD    2 1         LOAD VARIABLE BASE ADDRESS  K1922010
                          STO   3 RELAD-X   PLACE IN RELAD.             K1922020
                          MDX     EQ02I                                 K1922030
                    *                                                   K1922040
                    *                  PLACE ZERO IN RELATIVE ADDRESS   K1922050
                    *                             *1 INSTR REMOVED 2-11 K1922060
                    EQ02C STO   3 RELAD-X   STORE ZERO IN RELAD    2-11 K1922070
                    *                                                   K1922080
                    *                  TAG SWITCH 1                     K1922090
                    EQ02I STX  L0 SW1       PLACE XR0 IN SW1            K1922100
                    *                                                   K1922110
                    *                  GET THE D4 FOR THE VARIABLE      K1922120
                    *                  THAT IS BEING LOOKED AT.         K1922130
                    EQ02H BSI   3 GETD4-X   CALL GETD4                  K1922140
                    *                                                   K1922150
                    *                  REMOVE THE D4 FOR THE PRESENT    K1922160
                    *                  VARIABLE FROM THE RELATIVE       K1922170
                    *                  ADDRESS.                         K1922180
                          LD    3 RELAD-X   LOAD RELATIVE ADDRESS       K1922190
                          S     3 D4-X      REMOVE D4                   K1922200
                          STO   3 RELAD-X   STORE RELATIVE ADDRESS      K1922210
                    *                                                   K1922220
                    *                  RETURN POINTER TO THE BEGINNING  K1922230
                    *                  OF THE PRESENT NEST.             K1922240
                          BSI   3 RTN-X     CALL RTN                    K1922250
                    *                                                   K1922260
                    *                  PLACE THE ADDRESS FOR THE NEST   K1922270
                    *                  IN THE NEST.                     K1922280
                          LD    3 RELAD-X   LOAD RELATIVE ADDRESS       K1922290
                          STO   1 1         PLACE ADDRESS IN NEST       K1922300
                    *                                                   K1922310
                    *                  TAG THE LEFT PARENTHESIS IN THE  K1922320
                    *                  NEST BEING WORKED ON.            K1922330
                          LD    3 TAGLP-X   LOAD TAGED LEFT PARENTHESIS K1922340
                          STO   1 -1        PLACE OVER OTHER PAREN.     K1922350
                    *                                                   K1922360
                    *                  TAG SWITCH 2                     K1922370
                          STO   3 SW2-X     PLACE NON-ZERO IN SW2       K1922380
                    *                                                   K1922390
                    *                  SET THE BEING ALLOCATED BITS     K1922400
                    *                  IN THE SYMBOL TABLE INDICATOR    K1922410
                    *                  WORD AS (STATEMENT NUMBER AND    K1922420
                    *                  ARITHMETIC STATEMENT FUNCTION).  K1922430
                    EQ02J LD    2 0         LOAD INDICATOR WORD         K1922440
                          OR    3 H0300-X   ADD BEING ALLOCATED BITS    K1922450
                          STO   2 0         STORE INDICATOR WORD        K1922460
                    *                                                   K1922470
                    *                  CALL HILO TO ADJUST THE HIGH     K1922480
                    *                  AND LOW LIMITS ON THIS NEST      K1922490
                    *                  AS WELL AS DECIDE IF THIS NEST   K1922500
                    *                  IS DEFINED.                      K1922510
                          BSI   3 HILO-X    CALL HILO                   K1922520
                    *                                                   K1922530
                    *                  INCRAMENT THE ITEM POINTER TO    K1922540
                    *                  THE NEXT SYMBOL.                 K1922550
                          BSI   3 INCR-X    CALL INCR                   K1922560
                          DC      EQ01E     BR IF END OF ALL EQUIV      K1922570
                          DC      EQ01A     BR IF END OF NEST           K1922580
                          MDX     EQ02J                                 K1922590
                    *                                                   K1922600
                    *                  TEST TO SEE THAT THE NEST NOW    K1922610
                    *                  BEING ALLOCATED IS DEFINED.      K1922620
                    EQ03A LD    3 DEFIN-X   LOAD INDICATOR FOR NEST     K1922630
                          AND   3 H0020-X   SAVE ONLY DEFINED BIT       K1922640
                          BSC  L  ERR65,+-  BRANCH IF NOT DEFINED       K1922650
                    *                                                   K1922660
                    *                  PLACE RELATIVE ADDRESS FOR NEST  K1922670
                    *                  IN RELAD.                        K1922680
                          LD    1 1         LOAD NEST RELATIVE ADDRESS  K1922690
                          A     3 BASE-X                                K1922700
                          STO   3 RELAD-X   STORE IN RELAD              K1922710
                    *                                                   K1922720
                    *                  CHANGE THE LEFT PARENTHESIS FOR  K1922730
                    *                  THE NEST BEING ALLOCATED TO THE  K1922740
                    *                  CODE FOR DELETE.                 K1922750
                          LD    3 H8000-X   LOAD DELETE CODE            K1922760
                          STO   1 -1        STORE OVER LEFT PARENTHESIS K1922770
                    *                                                   K1922780
                    *                  CALL GETD4 TO GET D4 FOR THE     K1922790
                    *                  VARIABLE BEING LOOKED AT.        K1922800
                    EQ03D BSI   3 GETD4-X   CALL GETD4                  K1922810
                    *                                                   K1922820
                    *                  ALLOCATE VARIABLE AND CALL INSER K1922830
                    *                  TO PLACE ALLOCATION IN SYMBOL    K1922840
                    *                  TABLE AND PRINT IF REQUIRED      K1922850
                    *                             *1 INSTR REMOVED 2-11 K1922860
                          A     3 RELAD-X   ADD NEXT ADDR TO VARS  2-11 K1922870
                    *                       *D4--D4 IS IN ACC ON   2-11 K1922871
                    *                       *RETURN FROM GETD4     2-11 K1922872
                          BSI  L  INSER     INSERT AND PRINT            K1922880
                    *                                                   K1922890
                    *                  INCRAMENT THE ITEM POINTER TO    K1922900
                    *                  THE NEXT SYMBOL.                 K1922910
                    EQ03C BSI   3 INCR-X    CALL INCR                   K1922920
                          DC      EQ01B     BR IF END OF ALL EQUIV      K1922930
                          DC      EQ01C     BR IF END OF NEST           K1922940
                          MDX     EQ03D                                 K1922950
                    *                                                   K1922960
                    *                  TEST SWITCH 3                    K1922970
                    EQ03B LD    3 SW3-X     LOAD SWITCH 3               K1922980
                          BSC  L  EQ03E,Z   BR IF SWITCH 3 TRANSFER     K1922990
                    *                                                   K1923000
                    *                  INITIALIZE THE VARIABLE AREA     K1923010
                          LD   L  DFCNT     LOAD DEFINE FILE COUNT      K1923020
                          STO   3 VARCR-X   STORE IN VARIABLE CORE      K1923030
                    *                                                   K1923040
                    *                  ALTER THE ALLOCATION BITS SO AS  K1923050
                    *                  NOT TO REFLECT COMMON.           K1923060
                          LD    3 H0022-X                               K1923070
                          STO   3 ALOCB-X                               K1923080
                    *                                                   K1923090
                    *                  TAG SWITCH 3                     K1923100
                          STO   3 SW3-X     SET SWITCH 3 NON-ZERO       K1923110
                    *                                                   K1923120
                    *                  CALL INIT TO FIND THE FIRST      K1923130
                    *                  NON-DELETED NEST IN EQUIVALENCE  K1923140
                    *                  STATEMENTS                       K1923150
                    EQ03E BSI   3 INIT-X    CALL INIT                   K1923160
                          DC      EQ03F     BR IF END OF ALL EQUIV.     K1923170
                          DC      *         NORMAL RETURN               K1923180
                    *                                                   K1923190
                    *                  SET THE BEING ALLOCATED BITS IN  K1923200
                    *                  THE SYMBOL TABLE FOR THIS        K1923210
                    *                  VARIABLE. (SEE EQ02J)            K1923220
                          LD    2 0         LOAD INDICATOR WORD         K1923230
                          OR    3 H0300-X   ADD BEING ALLOCATED BITS    K1923240
                          STO   2 0         STOR INDICATOR WORD         K1923250
                    *                                                   K1923260
                    *                  NORMALIZE SWITCH 1               K1923270
                          SLA     16        PUT ZERO IN SW1             K1923280
                          STO   3 SW1-X                                 K1923290
                          BSC  L  EQ01D     BRANCH                      K1923300
                    *                                                   K1923310
                    *                  RETURN                           K1923320
                    EQ03F BSC  I  EQUIV                                 K1923330
                    *                                                   K1923335
                          BSS     OVERP-54-*  PATCH AREA                K1923340
                    *                                                   K1923345
                    *************************************************** K1923350
                    *                                                 * K1923360
                    *             END OF EQUIV ROUTINE                * K1923370
                    *                                                 * K1923380
                    *************************************************** K1923390
                    *                                                   K1923400
                    *                                                   K1923410
                          HDNG    1130 FORTRAN COMPILER PHASE 19        K1923420
                    *                                                   K1923430
                    *             PRINT ROUTINE FOR PHASE 20 THROUGH    K1923440
                    *             PHASE 25.                             K1923450
                    *                                                   K1923460
                          ORG     OVERP-54                              K1923470
                    *                                                   K1923480
                    RPAGE DC      PR100      RESTORE PAGE ENTRY         K1923490
                    NEWPG EQU     RPAGE                                 K1923500
                    *                                                   K1923510
                    AREA  DC      *-*        CONTAINS MESSAGE ADDRESS   K1923520
                    *                                                   K1923530
                    LSTPR EQU     OVERP+3    DEVICE PRINT RTN ENTRY     K1923540
                    *                                                   K1923550
                    Z     EQU     NEQ        XR3 STORAGE LOCATION       K1923560
                    *                                                   K1923570
                    *                                                   K1923580
                    PRINT DC      *-*        ENTRY TO PRINT A LINE      K1923590
                    *                                                   K1923600
                          STX   2 PR003      SAVE XR2                   K1923610
                          LDX  I2 AREA       LOAD ADDRESS OF MESSAGE    K1923620
                          LDX  I3 WDCNT      LOAD WORD COUNT            K1923630
                          STX   3 PR091      SAVE WORD COUNT IN WORK AR K1923640
                          LDX  L3 PAREA      POINT XR3 AT PRINT AREA    K1923650
                    *                                                   K1923660
                    *             PACK CHARACTERS INTO PRINT AREA       K1923670
                    *                                                   K1923680
                    PR001 LD    2 1          LOAD RIGHT CHARACTER       K1923690
                          SRA     8          SHIFT RIGHT                K1923700
                          OR    2 0          ADD LEFT CHARACTER         K1923710
                          STO   3 0          STORE INTO PRINT AREA      K1923720
                          MDX   2 2          INCREMENT INPUT POINTER    K1923730
                          MDX   3 1          INCREMENT OUTPUT POINTER   K1923740
                    *                        DECREMENT WORD COUNT BY 1, K1923750
                          MDX  L  PR091,-1   SKIP WHEN COMPLETE.        K1923760
                          MDX     PR001      CONTINUE PACKING           K1923770
                    *                                                   K1923780
                          LDD     PR093      LOAD PRINT PARAMETER       K1923790
                          BSI     LSTPR      GO PRINT LINE              K1923800
                          LD   L  $PBSY      LOOP IF THE PRINT BUFFER   K1923810
                          BSC  L  *-4,-Z     IS NOT AVAILABLE           K1923820
                          LDX  L2 *-*        RESTORE XR2                K1923830
                    PR003 EQU     *-1        XR2 SAVE AREA              K1923840
                          LDX  I3 Z          RESTORE XR3                K1923850
                          BSC  I  PRINT      EXIT                       K1923860
                    *                                                   K1923870
                    *                                                   K1923880
                    *                                                   K1923890
                          BSS  E  0                                     K1923900
                    PR091 DC      *-*        WORK AREA FOR WORD COUNT   K1923910
                    PR092 DC      /7002      LINE SPACE PARAMETER       K1923920
                    PR093 DC      /7001      PRINT PARAMETER            K1923930
                          DC      WDCNT      PRINT AREA ADDRESS         K1923940
                    PR094 DC      /7000      PAGE RESTORE PARAMETER     K1923950
                          DC      HEAD       PAGE HEADER STORAGE AREA   K1923960
                    *                                                   K1923970
                    *                                                   K1923980
                    *                                                   K1923990
                    PR100 DC      *-*        PAGE RESTORE ENTRY         K1924000
                    *                                                   K1924010
                          LDD     PR094      LOAD PAGE RESTORE PARAM    K1924020
                          BSI     LSTPR      RESTORE PAGE               K1924030
                          BSI     LSTPR      PRINT PAGE HEADER          K1924040
                          LD      PR092      LOAD LINE SPACE PARAMETER  K1924050
                          BSI     LSTPR      SPACE 1 LINE               K1924060
                          BSC  I  PR100      RETURN                     K1924070
                    *     SEE AREA PRECEEDING PRINT ROUTINE         2-1 K1924080
                    *     FOR PATCH AREA                            2-1 K1924090
                          END     BPHAR-2                               K1924100
