                          HDNG    1130 FORTRAN COMPILER PHASE 21        K2100010
                    **************************************************  K2100020
                    *                                                 * K2100030
                    *STATUS - VERSION 2, MODIFICATION 11              * K2100040
                    *                                                 * K2100050
                    *FUNCTION/OPERATION-                              * K2100060
                    *   *  ASSIGNS THE RELATIVE ADDRESSES TO STMNT    * K2100070
                    *      FUNCTIONS AND NUMBERED STATEMENTS          * K2100080
                    *   *  INSERTS ALLOCATIONS INTO THE STRING        * K2100090
                    *   *  CREATES THE SUBROUTINE INITIALIZATION CALL-* K2100100
                    *      .CALL SUBIN. ALONG WITH ITS DUMMY ARGUMENTS* K2100110
                    *   *  GENERATES THE STMNT FUNCTION RETURN CODE   * K2100120
                    *                                                 * K2100130
                    *ENTRY POINTS-                                    * K2100140
                    *   *  NEQ-THIS PHASE IS ENTERED VIA A CALL TO    * K2100150
                    *         THE ROL SUBROUTINE BY THE PREVIOUS PHASE* K2100160
                    *                                                 * K2100170
                    *INPUT-                                           * K2100180
                    *   * STATEMENT STRING                            * K2100190
                    *   * SYMBOL TABLE                                * K2100200
                    *   * FCOM                                        * K2100210
                    *                                                 * K2100220
                    *OUTPUT-                                          * K2100230
                    *   * STATEMENT STRING                            * K2100240
                    *   * SYMBOL TABLE                                * K2100250
                    *   * FCOM                                        * K2100260
                    *                                                 * K2100270
                    *EXTERNAL REFERENCES-                             * K2100280
                    *    SUBROUTINES-                                 * K2100290
                    *      * ROL                                      * K2100300
                    *      * NEWPG                                    * K2100310
                    *      * PRINT                                    * K2100320
                    *      * LSTPR                                    * K2100330
                    *    COMMA/DCOM                                   * K2100340
                    *      * $PHSE                                    * K2100350
                    *      * $CH12                                    * K2100360
                    *                                                 * K2100370
                    *EXITS-                                           * K2100380
                    *    NORMAL-                                      * K2100390
                    *      * EXIT IS MADE VIA A CALL TO THE ROL SUBR  * K2100400
                    *    ERROR-                                       * K2100410
                    *      * TEST IS MADE FOR OVERLAP ERROR EXCEPT    * K2100420
                    *        FOR ARITH STMNT FUNCTIONS AND EXIT MADE  * K2100430
                    *        VIA THE ROL SUBR WHEN OVERLAP FOUND.     * K2100440
                    *                                                 * K2100450
                    *TABLES/WORK AREAS-                               * K2100460
                    *   *  FCOM                                       * K2100470
                    *   *  STRING AREA                                * K2100480
                    *   *  SYMBOL TABLE AREA                          * K2100490
                    *                                                 * K2100500
                    * ATTRIBUTES-NONE                                 * K2100510
                    *                                                 * K2100520
                    *NOTES-                                           * K2100530
                    *   * ASF IS AN ABBREVIATION FOR ARITH STMNT FUNC * K2100540
                    *   * COMMENTS START IN COL 44                    * K2100550
                    *   * THE SWITCHES USED BY THIS PHASE FOLLOW.     * K2100560
                    *     IF POSITIVE, THE SWITCH IS TRANSFER=T       * K2100570
                    *     IF ZERO, THE SWITCH IS NORMAL = N           * K2100580
                    *        TEMP5-                                   * K2100590
                    *           N=NOT FIRST ASF STATEMENT             * K2100600
                    *           T=ADDR OF FIRST ASF STATEMENT         * K2100610
                    *        ASFSW-                                   * K2100620
                    *           T=POINTER NOT PAST ASF STATEMENTS     * K2100630
                    *        TR-                                      * K2100640
                    *           N=SUBP INITIALIZE FOR ASF STATEMENTS  * K2100650
                    *           T=1=SUBP INITIALIZE FOR SUBP          * K2100660
                    *           T=2=STATEMENT ALLOCATION              * K2100670
                    *                                                 * K2100680
                    *************************************************** K2100690
                          HDNG    1130 FORTRAN COMPILER PHASE 21        K2100700
                          ABS                                           K2100710
                    *                                                   K2100720
                    *                      SYSTEM EQUATES               K2100730
                    MEMRY EQU     /8000    CORE SIZE                    K2100740
                    OVERL EQU     MEMRY-1500 START OF FCOM              K2100750
                    ROL   EQU     MEMRY-68 LOC OF SUBR TO READ NXT PH   K2100760
                    $PHSE EQU     /78      PHASE NOW IN CORE            K2100770
                    *                                                   K2100780
                    PHID  EQU     51       ID NUMBER THIS PHASE         K2100790
                    *                      PRINT SUBROUTINE             K2100800
                    *                                                   K2100810
                    HEAD  EQU     ROL-49   PAGE HEADER AREA             K2100820
                    OVERP EQU     HEAD-327-2 DEVICE PRINT ROUTINE AREA  K2100830
                    NEWPG EQU     OVERP-54 INDIRECT ENTRY PAGE EJECT    K2100840
                    $CH12 EQU     /06      CHANNEL 12 INDICATOR         K2100850
                    AREA  EQU     NEWPG+1  MESSAGE ADDRESS              K2100860
                    PRINT EQU     NEWPG+2  PRINT INTERFACE SUBR ENTRY   K2100870
                    LSTPR EQU     OVERP+3  DEVICE PRINT SUBR ENTRY      K2100880
                    *                                                   K2100890
                          ORG     OVERL                                 K2100900
                    *                                                   K2100910
                    *                  FORTRAN COMMUNICATION AREA       K2100920
                    SOFS  BSS     1    START OF STRING                  K2100930
                    EOFS  BSS     1    END OF STRING                    K2100940
                    SOFST BSS     1    START OF SYMBOL TABLE            K2100950
                    SOFNS BSS     1    LENGTH OF PROGRAM                K2100960
                    SOFXT BSS     1    SIZE OF WORK AREA (VAR AREA)     K2100970
                    SOFGT BSS     1    SIZE OF CONSTANTS AREA           K2100980
                    EOFST BSS     1    END OF SYMBOL TABLE              K2100990
                    COMON BSS     1    RELATIVE ENTRY POINT             K2101000
                    CSIZE BSS     1    SIZE OF COMMON                   K2101010
                    ERROR BSS     1    ERROR FLAG                       K2101020
                    *               BIT 15 OVERLAP ERROR                K2101030
                    *               BIT 14 OTHER ERROR                  K2101040
                    *               BIT 13 SUBIN TOO LARGE          2-3 K2101050
                    *               BIT 10 OVERLAP IN THIS PHASE    2-3 K2101060
                    FNAME BSS     1    PROGRAM NAME                     K2101070
                          BSS     1                                     K2101080
                    SORF  BSS     1    SUBROUTINE(-) OR FUNCTION(+)     K2101090
                    CCWD  BSS     1    CONTROL CARD WORD                K2101100
                    *                BIT 15 TRANSFER TRACE              K2101110
                    *                BIT 14 ARITHMETIC TRACE            K2101120
                    *                BIT 13 EXTENDED PRECISION          K2101130
                    *                BIT 12 LIST SYMBOL TABLE           K2101140
                    *                BIT 11 LIST SUBPROGRAM NAMES       K2101150
                    *                BIT 10 LIST SOURCE PROGRAM         K2101160
                    *                BIT  9 ONE WORD INTEGERS           K2101170
                    IOCS  BSS     1    IOCS CONTROL CARD WORD           K2101180
                    *                BIT 15 CARD                        K2101190
                    *                BIT 14 PAPER TAPE                  K2101200
                    *                BIT 13 TYPEWRITER                  K2101210
                    *                BIT 12 1403 PRINTER                K2101220
                    *                BIT 11 2501 READER                 K2101230
                    *                BIT 10 KEYBOARD                    K2101240
                    *                BIT  9 1442 PUNCH                  K2101250
                    *                BIT  8 DISK                        K2101260
                    *                BIT  7 1132 PRINTER                K2101270
                    *                BIT  3 PLOTTER                     K2101280
                    *                                                   K2101290
                    DFCNT BSS     1         DEFINE FILE COUNT           K2101300
                    *                                                   K2101310
                    *                                                   K2101320
                    *                  END OF FORTRAN COMMUNICATION     K2101330
                    *                  AREA                             K2101340
                    *************************************************** K2101350
                          HDNG    1130 FORTRAN COMPILER PHASE 21        K2101360
                    *                                                   K2101370
                    BPHAR EQU     *+2                                   K2101380
                          DC      0        LOADER WORK AREA             K2101390
                          DC      -51      -PHASE ID FOR SLET LOOPUP    K2101400
                          DC      NXTPH-*+1  TBL FOR NEXT PHASE ENTRY   K2101410
                          DC      1        ONE ENTRY TO BE SET BY LDR   K2101420
                          ORG     *-2                                   K2101430
                    NEQ   BSC  L  ENT      BR TO INITIALIZATION         K2101440
                    *                                                   K2101450
                    *                                                   K2101460
                    *             TEST ROUTINE FOR SUBROUTINE           K2101470
                    *                  IN CALL ARGUMENTS                K2101480
                    *                                                   K2101490
                    SUBPR DC      0        SUBR ENTRY POIN              K2101500
                          SLA     8        SHIFT INDICATOR BIT TO SIGN  K2101510
                          BSC  I  SUBPR,-  RETURN IF NOT ON             K2101520
                          SLA     16       CLEAR ACC                    K2101530
                          BSI   3 OUTP-Z   O/P 0 TO O/P STRING          K2101540
                          MDX  L  LISTL,1  INCR LIST LENGTH             K2101550
                          BSC  I  SUBPR    RETURN TO CALLING PROGRAM    K2101560
                    *                                                   K2101570
                    *                                                   K2101580
                    INCPT DC      0        LINK ENTRY POINT             K2101590
                          MDX   1 1        INCR XR1 (POINTER)           K2101600
                          MDX  L  NORM,-4  DECR STMNT LENGTH COUNTER    K2101610
                          SLA     0        NOP IN CASE OF SKIP          K2101620
                          BSC  I  INCPT    RETURN                       K2101630
                    *                                                   K2101640
                    *                                                   K2101650
                    H6200 DC      /6200    CONSTANT                     K2101660
                    H7000 DC      /7000    CONSTANT                     K2101670
                    H7800 DC      /7800    CONSTANT                     K2101680
                    H0400 DC      /0400    (DUMMY VAR( EXTRACTOR        K2101690
                    H5E00 DC      /5E00    GENERATED LABEL TEST CON     K2101700
                    ZERO  DC      0        CONSTANT                     K2101710
                    Z     EQU     ZERO                                  K2101720
                    ONE   DC      /0001    CONSTANT                     K2101730
                    TWO   DC      /0002    CONSTANT                     K2101740
                    THREE DC      /0003    CONSTANT                     K2101750
                    FOUR  DC      /0004    CONSTANT                     K2101760
                    NORM  DC      0        NORM COUNTER                 K2101770
                    H07FC DC      /07FC    MASK FOR NORM                K2101780
                    HF800 DC      /F800    MASK FOR STMNT TYPE          K2101790
                    H6000 DC      /6000    .FORMAT.-TYPE                K2101800
                    HD000 DC      /D000    ARITH STMNT FUNC STMNT TYPE  K2101810
                    LOCC1 DC      0        LOC CTR 1                    K2101820
                    LOCC2 DC      0        LOC CTR 2                    K2101830
                    H5F00 DC      /5F00    .BLANK. AT OUTPUT            K2101840
                    DUMVC DC      0        DUMMY VAR CTR                K2101850
                    H1800 DC      /1800    DIMENSION BIT MASK SYM TBL   K2101860
                    TR    DC      0        TRACKSWITCH                  K2101870
                    DUMVP DC      0        DUMMY VAR PT IN SYM TBL      K2101880
                    H6008 DC      /6008    MASK                         K2101890
                    SUBIN DC      /1D00    CALL SUBIN                   K2101900
                    STADR DC      0        SYM TBL ADDR COUNTER         K2101910
                          DC      /8000    MASK                         K2101920
                    TESTN DC      0        .TESTNAME.                   K2101930
                    TINP  DC      0        TEMP I/P POINTER             K2101940
                    LISTL DC      0        LIST LENGTH                  K2101950
                    OUTID DC      0        ADDR OF O/P ID               K2101960
                    HF803 DC      /F803    MASK F ELIMINATING NORM      K2101970
                    H1000 DC      /1000    STMNT TYPE END               K2101980
                    H07FF DC      /07FF    MASK TO GET SYM TBL ADDR     K2101990
                    H7FFF DC      /7FFF    CONSTANT                     K2102000
                    HF300 DC      /F300    CONSTANT                     K2102010
                    H0680 DC      /0680    CONSTANT                     K2102020
                    H0880 DC      /0880    CONSTANT                     K2102030
                    LDXL1 DC      /5B00    .LDX L1.                     K2102040
                    SUBSC DC      /1900    .CALL SUBSC.                 K2102050
                    HFF80 DC      /FF80    MASK FOR .CALL SUBPROG.      K2102060
                    *                      ALSO, .CALL IFIX. MINUS      K2102070
                    *                      .CALL FLT.                   K2102080
                    HFFFD DC      /FFFD    CONSTANT                     K2102090
                    H007F DC      /007F    CONSTANT                     K2102100
                    GLTBO DC      GLABT-1  GENERATED LABEL TBL ORIGIN   K2102110
                    TEMP1 DC      0        TEMPORARY STORAGE            K2102120
                    SBSCL DC      /5D00    CONSTANT                     K2102130
                    H500C DC      /500C    STMNT-ID FOR .SUBIN.         K2102140
                    *                      (FORMER ID OF INTEGER STMNT) K2102150
                    *                                                   K2102160
                    HD800 DC      /D800    CONSTANT                     K2102170
                    HD004 DC      /D004    CONSTANT                     K2102180
                    H8000 DC      /8000    CONSTANT                     K2102190
                    H4F80 DC      /4F80    CONSTANT                     K2102200
                    H0220 DC      /0220    CONSTANT                     K2102210
                    HF000 DC      /F000    STMNT ID DEFN FILE STMNT     K2102220
                    HFFFF DC      /FFFF    CONSTANT                     K2102230
                    TEMP3 DC      0        TEMPORARY STORAGE            K2102240
                    TEMP4 DC      /8000    TEMP4 INITIALLY NEGATIVE     K2102250
                    *                                                   K2102260
                    *             TEMPORARIES AND SWITCH FOR SUBPR-INIT K2102270
                    *             WHEN PROGRAM INCLUDES ASF-STATEMNTS   K2102280
                    TEMP5 DC      0                                     K2102290
                    TEMP6 DC      0                                     K2102300
                    TEMP7 DC      0                                     K2102310
                    ASFSW DC      0                                     K2102320
                    SNTSW DC      0                                     K2102330
                    ASFN  DC      0        TEMP STORAGE OF ARITH        K2102340
                    *                      *STMNT FUNC NAME             K2102350
                    *                                                   K2102360
                    *             SUBR .GET SYM TABL ID-WORD.           K2102370
                    *                                                   K2102380
                    GETST DC      0        SUBROUTINE ENTRY POINT       K2102390
                          AND   3 H07FF-Z  GET SYM TBL POINTER          K2102400
                          STO     GETS1+1  SAVE                         K2102410
                          LD   L  SOFST    GET START OF SYM TBL         K2102420
                          S       GETS1+1  SUBTRACT SYM TBL PT 1 TIME   K2102430
                          S       GETS1+1  *2 TIMES                     K2102440
                          S       GETS1+1  *3 TIMES                     K2102450
                          A     3 THREE-Z  INCR BY 3                    K2102460
                          STO     GETS1+1  SAVE SYM TBL LOC OF ID WD    K2102470
                    GETS1 LD   L  *-*      LOAD SYM TBL ID WORD         K2102480
                          BSC  I  GETST    RETURN TO CALLING PROGRAM    K2102490
                    *                                                   K2102500
                    *             SUBR. TRACKSWITCH                     K2102510
                    *             SET UP BR TO LOC SPECIFIED IN THE     K2102520
                    *             SUBROUTINE CALLING SEQUENCE DEPENDENT K2102530
                    *             ON THE VALUE IN TR (=1,2 OR 3)        K2102540
                    *                                                   K2102550
                    TRSW  DC      0        LINK                         K2102560
                          LD      TRSW     GET ADDR OF LOC TO BR TO     K2102570
                          A     3 TR-Z     STORED TRACKSW VALUE         K2102580
                          STO     TRSW1+1  SAVE IN LINK RETURN ADDR     K2102590
                    TRSW1 BSC  I  0        RETURN TO DESIRED LOC.       K2102600
                    *                                                   K2102610
                    *             SUBR .NAMETEST.                       K2102620
                    NAMT  DC      0        LINK                 76      K2102630
                          S     3 TESTN-Z  TESTNAME                     K2102640
                          AND   3 H07FF-Z                               K2102650
                          BSC     Z        SKIP IF SAME                 K2102660
                          MDX     NAMT1    BR IF DIFFERENT              K2102670
                          MDX  L  LISTL,1  INCR LISTLENGTH              K2102680
                    *                                                   K2102690
                    *             TEST IF SUBPROGRAM NAME TRANSFER      K2102700
                    *             SWITCH (SNTSW) SET                    K2102710
                    *             IF SET, OUTPUT LOCTR2,                K2102720
                    *             OTHERWISE OUTPUT LOCTR2 + 1           K2102730
                    *                                                   K2102740
                          LD      SNTSW    LD SW                        K2102750
                          BSC     Z        SKIP IF SWITCH NO SET        K2102760
                          LD    3 HFFFF-Z  LOAD MINUS ONE               K2102770
                          A     3 ONE-Z    ADD 1                        K2102780
                          A     3 LOCC2-Z  LOCCTR2                      K2102790
                          OR    3 H8000-Z  TAG TO FACILITATE HANDLING   K2102800
                          BSI   3 OUTP-Z   OUTPUT                       K2102810
                    NAMT1 BSC  I  NAMT     RETURN                       K2102820
                    *                                                   K2102830
                    *             OUTPUT SUBROUTINE                     K2102840
                    OUTP  DC      0        LINK                         K2102850
                          STO   2 1        MOCE CONTENTS ACC            K2102860
                    *                      *TO OUTPUT STRING            K2102870
                          MDX   2 1        INCR O/P POINTER             K2102880
                          LD   I  OUTID      GET ID-WD              2-1 K2102890
                          AND   3 H07FF-Z    GET NORM               2-1 K2102900
                          A     3 FOUR-Z     INCR BY ONE            2-1 K2102910
                          SLA     4          CHECK NORM TOO LARGE   2-3 K2102920
                          BSC  L  SUBER,+Z   BRANCH IF TOO LARGE    2-1 K2102930
                          LD   I  OUTID    INCR NORM IN                 K2102940
                          A     3 FOUR-Z   *ID-WD                       K2102950
                          STO  I  OUTID    *OF OUTPUT STRING            K2102960
                    *                                                   K2102970
                    *             TEST IF OSAVE I/P STRING ADDR         K2102980
                          STX  L1 TIN      SAVE O/P STRING ADDR         K2102990
                          STX  L2 TOUT                                  K2103000
                          LD    3 ASFSW-Z  AVOID OVERLAP TEST IF        K2103010
                          BSC  I  OUTP,Z   *ASF SWITCH SET              K2103020
                          LD      TIN      GET I/P STRING ADDR          K2103030
                          S       TOUT     SUBTRACT O/P STRING ADDR     K2103040
                          BSC  I  OUTP,Z-  RETURN IF NO OVERLAP ERROR   K2103050
                    *                                                   K2103060
                    *             SET OVERLAP ERROR, DISCONTINUE        K2103070
                    OVERR MDX  L  ERROR,32 SET OVERLAP ERROR        2-3 K2103080
                          BSC  L  EXIT     BR TO EXIT THIS PHASE        K2103090
                    *                                                   K2103100
                    TIN   DC      0        TEMP STO OF I/P POINTER XR1  K2103110
                    TOUT  DC      0        TEMP STO OF O/P POINTER XR2  K2103120
                    *                                                   K2103130
                    *                                                   K2103140
                    TEMP2 DC      0        TEMP STO I/P POINTER         K2103150
                    *                                                   K2103160
                    XIN   DC      0        I/P LOCATION POINTER         K2103170
                    XOUT  DC      0        O/P LOCATION POINTER         K2103180
                    *                                                   K2103190
                    ENT   LDX   1 PHID     LOAD ID THIS PHASE           K2103200
                          STX  L1 $PHSE    STORE IN SYSTEM PHASE AREA   K2103210
                          LD   L  ERROR    LOAD OVERLAP ERR FLAG        K2103220
                          BSC  L  EXIT,Z   BR TO EXIT IF OVERLAP ERROR  K2103230
                    *                                                   K2103240
                          LDX  L3 ZERO     INITIALIZE TRANSFER VECTOR   K2103250
                    *                                                   K2103260
                    *             MOVE STRING TO HIGHER CORE            K2103270
                    *             (ADJACENT TO SYMBOL TABLE)            K2103280
                    *                                                   K2103290
                          LD   L  EOFS     LD END OF STRING             K2103300
                          S    L  SOFS     -START OF STRING             K2103310
                          A     3 ONE-Z    PLUS ONE                     K2103320
                          STO     MOVCT    SAVE IN CNT OF NO. WDS       K2103330
                          LDX  I1 EOFST    FIND LOC NXT TO SYM TBL      K2103340
                          MDX   1 -6       BUT SIX POSITIONS AWAY       K2103350
                          LDX  I2 EOFS     PUT ENDO OF STRING PT XR2    K2103360
                    *                                                   K2103370
                    *             TEST OVERLAP                          K2103380
                          STX  L1 XOUT     SAVE NEW O/P LOC POINTER     K2103390
                          STX  L2 XIN      SAVE NEW I/P LOC POINTER     K2103400
                          LD      XOUT     LD OUTPUT LOC PT             K2103410
                          S       XIN      LESS INPUT LOC PT            K2103420
                          BSC  L  MOVST,-Z BR IF NOT OVERLAP            K2103430
                          MDX  L  ERROR,32 SET OVERLAP ERROR        2-3 K2103440
                          BSC  L  EXIT     EXIT FROM THIS PHASE         K2103450
                    *                                                   K2103460
                    MOVST LD    2 0        MOVE STRING ITEM             K2103470
                          STO   1 0        *FROM I/P STRING TO O/P      K2103480
                          MDX   2 -1       DECR I/P POINTER             K2103490
                          MDX   1 -1       DECR O/P POINTER             K2103500
                          MDX  L  MOVCT,-1 DECR WD CNT                  K2103510
                          MDX     MOVST    BR IF NO SKIP TO             K2103520
                    *                      MOVING OF NEXT ITEM          K2103530
                          LDX  I2 SOFS     SET XR2 = START OF ORIGINAL  K2103540
                          MDX   2 -1       *STRING-1 (NOW O/P AREA)     K2103550
                    *                                                   K2103560
                    *             IF DEFINE FILE OR DATA STATEMENT,     K2103570
                    *             MOVE STATEMENT WITHOUT COUNTING       K2103580
                    *             LOCATIONS                             K2103590
                    *                                                   K2103600
                    LDR   LD    1 1        LOAD STRING WORD             K2103610
                          AND   3 HF800-Z  GET ID BITS                  K2103620
                          S     3 HF000-Z  SUBTRACT DEFN FILE ID)       K2103630
                          BSC     Z        SKIP IF ZERO (DEFN FILE)     K2103640
                          S       DATA     SUBTRACT DATA TEST ID        K2103650
                          BSC  L  M1011,Z  BR IF NOT DEFN FILE OR DATA  K2103660
                    *                                                   K2103670
                    *             MOVE STATEMENT                        K2103680
                          LD    1 1        LD STMNT ID                  K2103690
                          AND   3 H07FC-Z  GET NORM COUNT               K2103700
                          STO     MOVCT    SAVE WD COUNT                K2103710
                    LDR1  MDX   2 1        INCR INPUT CTR               K2103720
                          MDX   1 1        INCR O/P CTR                 K2103730
                          LD    1 0        MOVE WD FROM INPUT AREA      K2103740
                          STO   2 0        * TO OUTPUT AREA             K2103750
                          MDX  L  MOVCT,-4 DECR WD CNT BY ONE           K2103760
                          MDX     LDR1     BR IF NO SKIP                K2103770
                          MDX     LDR      BR BACK TO TEST NXT STMNT    K2103780
                    *                                                   K2103790
                    MOVCT DC      0        COUNT ON NO. WDS MOVED       K2103800
                    DATA  DC      /F800-/F000 DATA TEST CONSTANT        K2103810
                    *                                                   K2103820
                    *                                                   K2103830
                    *             INSERT SIZE OF WORK AREA PLUS         K2103840
                    *             SIZE OF CONSTANTS AREA AS INITIAL     K2103850
                    *             VALUE OF LOCATION COUNTER             K2103860
                    *             (DEFINEFILE AREA IS INCLUDED IN       K2103870
                    *             WORK AREA (SOFXT))                    K2103880
                    *                                                   K2103890
                    M1011 LD   L  SOFXT    LD SIZE OF WORK AREA         K2103900
                          A    L  SOFGT    ADD SIZE OF CONSTANTS AREA   K2103910
                          STO   3 LOCC1-Z  SAVE IN LOC COUNTER          K2103920
                    *                                                   K2103930
                    M1021 MDX   1 1        INCR INPUT POINTER           K2103940
                          LD    1 0        LD STIRNG WORD               K2103950
                          AND   3 H07FC-Z  STORE NORM                   K2103960
                          STO   3 NORM-Z   (STMNT LENGTH COUNTER)       K2103970
                          LD    1 0        GET STMNT TYPE               K2103980
                          AND   3 HF800-Z  MASK TO GET STMNT ID         K2103990
                          S     3 H6000-Z  FORMAT-TYPE                  K2104000
                          BSC  L  M1031,+- BR IF FORMAT                 K2104010
                          LD    1 0        LOAD STRING WORD             K2104020
                          AND   3 HF800-Z  MASK TO GET STMNT ID         K2104030
                          S     3 HD800-Z  SUBTRACT CALL INTERNAL O/P   K2104040
                          BSC  L  M1051,Z  BR IF NOT CALL IO            K2104050
                    *                                                   K2104060
                    *             STORE LOCCOUNTER1 FOR LATER USAGE     K2104070
                    *             AS ENTRY POINT                        K2104080
                    *             (FIRST ENCOUNTERED CALL IO STMT)      K2104090
                    *                                                   K2104100
                          LD      SW       LD CALL I/O INITLZ SW        K2104110
                          BSC  L  M1022,Z  BR IF SWITCH SET             K2104120
                          LD    3 LOCC1-Z  LOAD LOC CTR                 K2104130
                          STO   3 TEMP4-Z  SAVE IN TEMP STO             K2104140
                          STX   3 SW       SET SWITCH                   K2104150
                    *                                                   K2104160
                    M1022 MDX   2 1        INCR O/P POINTER             K2104170
                          MDX     M1042    BR TO MOVE WD TO O/P STRING  K2104180
                    *                                                   K2104190
                    SW    DC      0        SWITCH (INITIALLY ZERO)      K2104200
                    *                                                   K2104210
                    *             MOVE FORMAT-STMNT OR CALL-I/O-STMNT   K2104220
                    *             UNALTERED TO OUTPUT                   K2104230
                    *             STRING. ALLOCATE STATEMENT            K2104240
                    *                                                   K2104250
                    M1031 LD    1 1        LD STMNT NUMBER              K2104260
                          STO   2 2        SAVE IN O/P STRING           K2104270
                          BSI   3 GETST-Z  GET SYM TBL ID WORD          K2104280
                          OR    3 2        .ALLOCATED.                  K2104290
                          STO  I  GETS1+1  SAVE IN SYM TBL              K2104300
                          LD    1 0        LOAD STRING ID WORD          K2104310
                          A     3 FOUR-Z   INCR NORM CNT                K2104320
                          STO   2 1        SAVE IN O/P STRING           K2104330
                          LD    3 LOCC1-Z  LD LOC COUNTER WD 1          K2104340
                          STO   2 3        SAVE IN O/P STRING           K2104350
                          MDX   1 1        INCR I/P POINTER             K2104360
                          MDX   2 3        INCR O/P POINTER             K2104370
                          MDX  L  NORM,-8  DECR NORM COUNT              K2104380
                    *                                                   K2104390
                    M1041 MDX   1 1        INCR I/P POINTER             K2104400
                          MDX   2 1        INCR O/P POINTER             K2104410
                          MDX  L  LOCC1,1  INCR LOCCOUNTER1             K2104420
                    M1042 LD    1 0        MOVE WORD AT INPUT POINTER   K2104430
                          STO   2 0        *TO OUTPUT STRING            K2104440
                          MDX  L  NORM,-4  DECR STATEMENTLENGTHCOUNTER  K2104450
                          MDX     M1041    BR IF NO SKIP                K2104460
                          MDX     M1021    BR IF SKIP                   K2104470
                    *                                                   K2104480
                    *             PROCESS A STATEMENT OTHER THAN        K2104490
                    *             FORMAT-STATEMENT                      K2104500
                    *                                                   K2104510
                    M1051 LD    1 0        LD I/P STRING ID WD          K2104520
                          AND   3 HF800-Z  GET ID TYPE                  K2104530
                          S     3 HD000-Z  TEST ARITH STMNT FUNC TYPE   K2104540
                          BSC     Z        SKIP IF ARITH STMNT FUNC     K2104550
                          MDX     M1071    BR IF NOT                    K2104560
                    **                                                  K2104570
                    *             PROCESS AN ARITHMETIC STATEMENT       K2104580
                    *             FUNCTION STATEMENT                    K2104590
                    *                                                   K2104600
                    *                                                   K2104610
                    *             STORE POINTERS IN ORDER TO            K2104620
                    *             ESTABLISH LATER A PSEUDO STMT-ID-WORD K2104630
                    *                                                   K2104640
                          LD    3 HD004-Z  PUT ARITH STMNT FUNC ID WD   K2104650
                          STO   2 1        *PLUS 1WD NORM IN O/P        K2104660
                          MDX   2 1        INCR O/P STRING PT           K2104670
                          STX  L2 OUTID    SAVE O/P STRING ID WD PT     K2104680
                          STX  L1 TEMP2    SAVE I/P STRING POINTER      K2104690
                    *                                                   K2104700
                    *             TEST IF FIRST FOUND ARITH STMNT FUNC  K2104710
                    *             IF SO, STORE PT AND LOC FOR USE       K2104720
                    *             IN SUBPROG. INITIALIZE STRING CNT     K2104730
                    *                                                   K2104740
                          LD    3 TEMP5-Z  LD ARITH STMNT FUNC FOUND SW K2104750
                          BSC  L  M1052,Z  BR IF SET BEFORE             K2104760
                          STX  L2 TEMP5    STORE POINTER                K2104770
                          LD    3 LOCC1-Z  STORE LOCCTR                 K2104780
                          S     3 ONE-Z    SUBTRACT 1                   K2104790
                          STO   3 TEMP6-Z  SAVE IN TEMP STORAGE         K2104800
                    M1052 LD    1 1        LD STRING WD                 K2104810
                          BSI   3 OUTP-Z   PUT ON O/P STRING            K2104820
                          LD    3 LOCC1-Z  LD LOC COUNTER               K2104830
                          BSI   3 OUTP-Z   PUT ON O/P STRING            K2104840
                    *                                                   K2104850
                          LD    1 1        LD ARITH STMNT FUNC NAME     K2104860
                          STO   3 ASFN-Z   SAVE                         K2104870
                    *                                                   K2104880
                          BSI   3 GETST-Z  GET SYM TBL ID WORD          K2104890
                          OR    3 TWO-Z    CON TWO (ALLOCATION BIT)     K2104900
                          STO  I  GETS1+1  SAVE IN SYM TBL ID WORD      K2104910
                    M1061 LD    3 H5F00-Z  LD CONSTANT BLANK WD         K2104920
                          BSI   3 OUTP-Z   OUTPUT BLANK                 K2104930
                          MDX  L  LOCC1,1  INCR LOCCTR1                 K2104940
                          NOP              TO AVOID SKIPPING       2-10 K2104945
                          LD    3 ZERO-Z   ZERO TO TRACKSWITCH          K2104950
                    *                      (0=.ARITH STMNT FUNCTION.)   K2104960
                          BSI  L  S2011    STRING COUNT                 K2104970
                          LD    3 LOCC2-Z  LOCCTR2 TO                   K2104980
                          STO   3 LOCC1-Z  *LOCCTR1                     K2104990
                          STO   3 TEMP7-Z  SAVE IN  TEMP LOC            K2105000
                          BSC  L  M1021    BR TO GET NXT LOC            K2105010
                    *                                                   K2105020
                    *                                                   K2105030
                    *             PROCESS A STATEMENT OTHER THAN        K2105040
                    *             ARITHMETIC STATEMENT FUNCTION OR      K2105050
                    *             FORMAT                                K2105060
                    M1071 LD    3 LOCC1-Z  LOCCTR1                      K2105070
                          STO  L  COMON    SAVE AS RELATIVE ENTRY PT    K2105080
                    *                                                   K2105090
                    *             SAVE XR1 FOR LATER REINITIALIZATION   K2105100
                          STX  L1 TINP     SAVE XR1                     K2105110
                    *                                                   K2105120
                    *                                                   K2105130
                    *             IF TEMP4 SET, ADDRESS THERE REPLACES  K2105140
                    *             ENTRY POINT                           K2105150
                    *                                                   K2105160
                          LD    3 TEMP4-Z  LD TEMP4 (=LOCC1 IF SET)     K2105170
                          BSC  L  M1072,+Z BR IF NOT SET (INITLZ TO -)  K2105180
                          STO  L  COMON    SAVE AS RELATIVE ENTRY PT    K2105190
                    *                                                   K2105200
                    M1072 MDX   1 1        INCR I/P POINTER             K2105210
                          LD   L  SORF     GET SUBR/FUNC FLAG           K2105220
                          BSC     +-       SKIP IF THIS IS A SUBPROGRAM K2105230
                          MDX     M1092    BR IF NOT                    K2105240
                    *                                                   K2105250
                    *             OUTPUT .CALL SUBIN. WITH ITS          K2105260
                    *             ARGUMENTS IF THIS A SUBPROGRAM WITH   K2105270
                    *             DUMMY VARIABLES                       K2105280
                    *                                                   K2105290
                    *             TEST IF DUMMY VAIABLES IN SYM TBL     K2105300
                    *                                                   K2105310
                    M1081 LD    3 0        ZERO TO DUMMY                K2105320
                          STO   3 DUMVC-Z  *VARIABLE COUNTER            K2105330
                          LD   L  SOFST    GET START OF SYMBOL TABLE    K2105340
                          STO     M1082+1  SAVE                         K2105350
                    M1082 LD   L  *-*      GET FIRST SYM TBL ID WD      K2105360
                          RTE     27       SHIFT DUMMY VAR BIT TO SIGN  K2105370
                          BSC     -        SKIP IF DUMMY VAR            K2105380
                          MDX     M1083    BR IF NOT                    K2105390
                          MDX  L  DUMVC,1  INCR DUMMY VAR COUNTER       K2105400
                    M1083 RTE     5        SHIFT TO GET SYM TBL ID ACC  K2105410
                          AND   3 H1800-Z  MASK FOR DIMENSION BITS      K2105420
                          BSC     -Z       SKIP IF NOT DIMENSIONED      K2105430
                          LD    3 HFFFD-Z  LD -3 CONSTANT FOR DIM VAR   K2105440
                          A     3 HFFFD-Z  ADD -3 CON FOR SYM TBL ENTRY K2105450
                          A       M1082+1  ADD CURRENT SYM TBL ID ADDR  K2105460
                          STO     M1082+1  SAVE ID ADDR OF NXT ID       K2105470
                          S    L  EOFST    SUBTRACT END OF SYM TBL      K2105480
                          BSC     -Z       SKIP IF END OF SYM TBL       K2105490
                          MDX     M1082    BR IF NOT                    K2105500
                          LD    3 DUMVC-Z  DUMMY VAR COUNTER            K2105510
                          BSC     Z        SKIP IF SUBP HAS NO DUMMY    K2105520
                    *                      *VARIABLES                   K2105530
                          MDX     M1085    BR IF IT HAS                 K2105540
                    *             OUTPUT .BLANK. STATEMENT              K2105550
                    *             STMNT-ID SAME AS FORMAT,              K2105560
                    *             SSTMNT BODY ONE ZERO-WORD             K2105570
                    *             (WHICH IS LINK WORD AT OBJECT         K2105580
                    *             TEME)                                 K2105590
                          LD    3 H6008-Z  LD ID WD W/ NORM =2          K2105600
                          STO   2 1        PUT ON O/P STRING            K2105610
                          LD    3 ZERO-Z   LD ZERO WD                   K2105620
                          STO   2 2        PUT ON O/P STRING            K2105630
                          MDX   2 2        INCR OUTPUT POINTER          K2105640
                          MDX  L  LOCC1,1  INCR LOCATION COUNTER        K2105650
                          NOP              TO AVOID SKIPPING       2-10 K2105655
                          MDX     M1092    BR TO CONTINUE               K2105660
                    M1085 A     3 TWO-Z    PUT NO. DUMMY VAR +2         K2105670
                          STO   3 LISTL-Z  *IN LIST LENGTH              K2105680
                    M1091 LD    3 ONE-Z    .ONE. TO TRACKSWITCH         K2105690
                    *                      (1=.SUBPROGR. INITIALIZ..)   K2105700
                          BSI     S2011     STRING COUNT SUBR           K2105710
                          LD    3 LOCC1-Z  GET LOC COUNTER              K2105720
                          A     3 ONE-Z    INCR BY 1                    K2105730
                          A     3 LISTL-Z  INCR BY LIST LENGTH          K2105740
                          STO   3 LOCC1-Z  SAVE IN LOC COUNTER          K2105750
                    M1092 LD    3 TWO-Z    TWO TO TRACKSWITCH           K2105760
                    *                      (2=.STATEMENT ALLOC..)       K2105770
                          BSI     S2011     STRING COUNT SUBR           K2105780
                    *                                                   K2105790
                    *             STORE PROGRAM LENGTH                  K2105800
                    *                      MAKING IT EVEN               K2105810
                          LD    3 LOCC2-Z  LD LOC CTR                   K2105820
                          BSC     E        SKIP IF EVEN                 K2105830
                          A     3 ONE-Z    ADD 1                        K2105840
                          STO  L  SOFNS    SAVE IN PROG LENGTH          K2105850
                          BSC  L  EXIT     BR TO EXIT FR THIS PHASE     K2105860
                    *                                                   K2105870
                    *                                                   K2105880
                    *************************************************** K2105890
                    *                                                   K2105900
                    *             SUBR .STRING COUNT.                   K2105910
                    *                                                   K2105920
                    *             THIS SUBROUTINE PERFORMS THREE        K2105930
                    *             DIFFERENT TASKS DEPENDING ON THE      K2105940
                    *             SETTING OF TRACKSWITCH                K2105950
                    *                                                   K2105960
                    *             IF TRACKSWITCH = 0                    K2105970
                    *               IT INITIALIZES AN ARITHMETIC STATE- K2105980
                    *               MENT FUNCTION STATEMENT             K2105990
                    *               (OUTPUTS .CALL SUBIN. WITH          K2106000
                    *               ARGUMENTS)                          K2106010
                    *                                                   K2106020
                    *             IF TRACKSWITCH = 1                    K2106030
                    *               IT INITIALIZES SUBPROGRAM           K2106040
                    *               (OUTPUTS .CALL SUBIN. WITH          K2106050
                    *               ARGUMENTS)                          K2106060
                    *                                                   K2106070
                    *             IF TRACKSWITCH = 2                    K2106080
                    *               IT ALLOCATES STATEMENTS             K2106090
                    *               AND MOVES THE STRING                K2106100
                    *             INSERTING ALLOCATIONS TO FOLLOW       K2106110
                    *             STATEMENT NUMBERS IN LABELED STMNTS   K2106120
                    *                                                   K2106130
                    *************************************************** K2106140
                    S2011 DC      0        LINK                         K2106150
                          STO   3 TR-Z     STORE TRACKSWITCH            K2106160
                          LD    3 LOCC1-Z  LOCCTR1                      K2106170
                          STO   3 LOCC2-Z  *TO LOCCTR2                  K2106180
                          BSI   3 TRSW-Z   TRACKSWITCH                  K2106190
                          DC      S2061    ARITH STMNT FUNCTION         K2106200
                          DC      S2021    SUBPROGRAM INITILIZATION     K2106210
                          DC      S2091    STMNT ALLOCATION             K2106220
                    *                                                   K2106230
                    S2021 LD   L  SOFST    INITLZ DUMMY VAR POINTER     K2106240
                          STO   3 DUMVP-Z  *IN SYMBOL TABLE             K2106250
                          LD    3 0        *AND SYM TBL ADDR            K2106260
                          STO   3 STADR-Z  *COUNTER                     K2106270
                          LDX  I1 TINP     INITIALIZE INPUT POINTER     K2106280
                    *                                                   K2106290
                    *             INITIALIZE OUTPUT STMNT               K2106300
                          LD    3 H500C-Z  MOVE STMNT ID 'SUBR INITLZ'  K2106310
                          STO   2 1        * TO OUTPUT ID WORD          K2106320
                          MDX   2 1        INCR OUTPUT POINTER          K2106330
                          STX  L2 OUTID    STORE ADDR OF OUTPUT-ID      K2106340
                          LD    3 SUBIN-Z  .CALL SUBIN.                 K2106350
                          STO   2 2          TO OUTPUT STRING           K2106360
                          LD    3 H5F00-Z  * TO OUTPUT STRING           K2106370
                          STO   2 1                                     K2106380
                          MDX   2 3        INCR OUTPUT POINTER          K2106390
                          STX  L2 S2052+1  STORE ADDR OF BEGINNING OF   K2106400
                    *                      *LIST ON OUTPUT STRING       K2106410
                          MDX   2 -1                                    K2106420
                          MDX  L  LOCC2,2  DECR O/P POINTER             K2106430
                          NOP              TO AVOID SKIPPING       2-10 K2106435
                    S2031 LD    3 DUMVC-Z  INCR LOC COUNTER             K2106440
                          BSC     +        SKIP IF NOT ZERO             K2106450
                          MDX     S2051    BR IF ZERO                   K2106460
                          S     3 ONE-Z                                 K2106470
                          STO   3 DUMVC-Z  DUMMY VAR COUNTER            K2106480
                    S2032 MDX  L  STADR,1  INCR SYM TBL ADDR COUNTER    K2106490
                          LD   I  DUMVP    LD DUMMY VAR PT FR SYM TBL   K2106500
                          RTE     27       SHIFT BIT TO SIGN POS        K2106510
                          BSC     -        SKIP IF DUMMY VAR            K2106520
                          MDX     S2041    BR IF NOT                    K2106530
                          RTE     5        SHIFT ID WD TO ORIGINAL POS  K2106540
                    *                                                   K2106550
                          SLA     8        SHIFT SUBP NAME BIT TO SIGN  K2106560
                          BSC  L  S203Y,-  BR IF NOT SUBPROGRAM NAME    K2106570
                          MDX  L  LISTL,1  INCR LIST LENGTH             K2106580
                          MDX  L  SNTSW,1  SET SWITCH                   K2106590
                    *                                                   K2106600
                    S203Y LD    3 STADR-Z  LD SYM TBL ADDR COUNTER      K2106610
                          STO   3 TESTN-Z  TESTNAME                     K2106620
                    *                                                   K2106630
                    *             TEST IF PROGRAM INCLUDES ASF STMNTS   K2106640
                    *             IF IT DOES, SPECIAL-INITIALIZE        K2106650
                    *                                                   K2106660
                    S203X LD    3 TEMP6-Z                               K2106670
                          BSC  L  S2033,+- BR IF PROGR INCLUDES NO ASF  K2106680
                          STO   3 LOCC2-Z  INITIALIZE LOCCTR            K2106690
                          LDX  I1 TEMP5    INITIALIZE POINTER           K2106700
                          MDX  L  ASFSW,1  SET SWITCH                   K2106710
                          BSC  L  S2093    BR TO PROCESS ASF            K2106720
                    *                                                   K2106730
                    S2033 LD    3 LOCC1-Z  LOCCTR1                      K2106740
                          STO   3 LOCC2-Z  *TO LOCCTR2                  K2106750
                          BSC  L  S2092    BR TO ALLOCATE STMNT         K2106760
                    *                                                   K2106770
                    S2041 RTE     5        PUT SYM TBL ID WD ALL IN ACC K2106780
                          AND   3 H1800-Z  TEST FOR DIMENSIONED VAR     K2106790
                          BSC  L  S2042,+- BR IF NONE                   K2106800
                          MDX  L  STADR,1  INCR SYM TBL ADDR COUNTER    K2106810
                          LD    3 HFFFD-Z  GET -3 FOR DIM VAR IN SYMTBL K2106820
                    S2042 A     3 HFFFD-Z  INCR BY -3 SYM TBL CONSTANTS K2106830
                          A     3 DUMVP-Z  ADD DUMMY VAR PT             K2106840
                          STO   3 DUMVP-Z  SAVE IN DUMMY VAR PT         K2106850
                          MDX     S2032    BR TO PROCESS NXT VAR        K2106860
                    S2051 LD    3 LOCC2-Z  INCR LOCCTR2 BY LIST LENGTH  K2106870
                          A     3 LISTL-Z  LISTLENGTH                   K2106880
                          STO   3 LOCC2-Z  SAVE                         K2106890
                          LD    3 ONE-Z    OUTPUT CONSTANT ONE          K2106900
                          BSI   3 OUTP-Z   BR TO O/P SUBR               K2106910
                    *                                                   K2106920
                    *             NOTE                                  K2106930
                    *             XR2 IS NOT RESTORED, SINCE IT         K2106940
                    *             WILL GET CORRECT VALUE IN             K2106950
                    *             THE PROCESS OF CORRECTING             K2106960
                    *             ARGUMENTS OF .SUBIN.                  K2106970
                    *                                                   K2106980
                    S2052 LDX  L2 *-*      XR2=START OF LIST-O/P STRING K2106990
                    *                                                   K2107000
                    S205X LD    2 0        LD LIST ITEM                 K2107010
                          BSC     +-       SKIP IF LIST ITEM NONZERO    K2107020
                          MDX     S2053    BR IF ZERO                   K2107030
                          SRT     1        SHIFT OUT 1 BIT              K2107040
                          BSC  L  S205Y,Z  BR IF LISTITEM NOT .ONE.     K2107050
                    *                                                   K2107060
                    *             END OF SUBIN ARGUMENTS                K2107070
                          BSI   3 TRSW-Z   TRACKSWITCH                  K2107080
                          DC      S2054    ARITH STMNT FUNCTION         K2107090
                          DC      S2059    SUBPROGRAM INITIALIZE        K2107100
                    *                                                   K2107110
                    *             INCR .SUBIN. ARGUMENTS IF GT TEMP7    K2107120
                    S205Y LD    2 0        LD ARGUMENT                  K2107130
                          AND   3 H7FFF-Z  REMOVE SIGN BIT              K2107140
                          S     3 TEMP7-Z  SUBTRACT TEMP7               K2107150
                          BSC  L  S2053,+Z BR IF LT TEMP7               K2107160
                          LD    3 LISTL-Z  INCR VALUE                   K2107170
                          A     2 0        *IN ARGUMENT LIST            K2107180
                          STO   2 0        *BY LIST LENGTH              K2107190
                    *                                                   K2107200
                    S2053 MDX   2 1        INCR ARGUMENT POINTER        K2107210
                          MDX     S205X    BR TO TEST NXT LIST ITEM     K2107220
                    *                                                   K2107230
                    *             MOVE THE BODY OF                      K2107240
                    *             ARITH STMNT FUNCTION                  K2107250
                    *                                                   K2107260
                    S2054 LDX  I1 TINP     LD START OF STMNT XR1        K2107270
                          LD    1 0        LD STMNT ID WD               K2107280
                          AND   3 H07FC-Z  MASK TO GET NORM             K2107290
                          S     3 FOUR-Z   DECR BY 1                    K2107300
                          STO   3 NORM-Z   SAVE NORM                    K2107310
                    S2057 BSI   3 INCPT-Z  BR TO INCR I/P POINTER       K2107320
                          LD    1 0        LOAD STRING WORD             K2107330
                          BSI   3 OUTP-Z   BR TO PUT ON O/P STRING      K2107340
                    *                                                   K2107350
                    S2058 LD    3 NORM-Z   LD NORM                      K2107360
                          BSC  L  S2057,Z- BR IF NORM POSITIVE          K2107370
                          LD    3 H4F80-Z  LD CODE FOR BSC I W/NAME     K2107380
                          BSI   3 OUTP-Z   BR TO O/P CODE               K2107390
                          LD    3 ASFN-Z   LD ARITH STMNT FUNC NAME     K2107400
                          BSI   3 OUTP-Z   BR TO O/P NAME               K2107410
                          MDX  L  LOCC2,2  INCR LOCATION COUNTER        K2107420
                          NOP              TO AVOID SKIPPING       2-10 K2107425
                    *                                                   K2107430
                    S2059 BSC  I  S2011    RETURN                       K2107440
                    *                                                   K2107450
                    *                                                   K2107460
                    *             ARITHMETIC STATEMENT FUNCTION INIT.   K2107470
                    *                                                   K2107480
                    S2061 MDX   1 1        INCR I/P POINTER             K2107490
                          STX  L1 DUMVP    INITIAL DUMMY VAR POINTER    K2107500
                          LD    3 ZERO-Z   CLEAR                        K2107510
                          STO   3 DUMVC-Z  *DUMMY VAR COUNTER           K2107520
                    S2062 MDX   1 1        INCR I/P POINTER             K2107530
                    *                                                   K2107540
                    *             MOVE DUMMY ARGUMENTS ONE STEP         K2107550
                    *             TO MAKE ROOM FOR PSEUDO STMNT-ID      K2107560
                    *                                                   K2107570
                          LD    1 0        LD STRING WD                 K2107580
                          STO   1 -1       MOVE TO CURRENT LOC-1        K2107590
                    *                                                   K2107600
                          BSC     -        SKIP IF (DUMMY ARGUMENT)     K2107610
                    *                      *NAME OR PACKED INSTRUCTION  K2107620
                          MDX     S2063    BR IF NOT                    K2107630
                          AND   3 H7800-Z  MASK NAME ID BITS            K2107640
                          BSC     Z        SKIP IF DUMMY ARGUMENT NAME  K2107650
                          MDX     S2063    BR IF NOT                    K2107660
                          MDX  L  DUMVC,1  INCR DUMMY VAR COUNT         K2107670
                          MDX     S2062    BR TO GET NXT VAR            K2107680
                    *                                                   K2107690
                    S2063 LD    3 DUMVC-Z  DUMMY VAR COUNTER + 1        K2107700
                          A     3 ONE-Z    *TO LIST                     K2107710
                          STO   3 LISTL-Z  *LENGTH                      K2107720
                          MDX   1 -1       DECR I/P COUNTER             K2107730
                          STX  L1 TINP     INSERT STORED INITIAL VALUE  K2107740
                    *                      *OF TEMPORARY I/P POINTER    K2107750
                    *                                                   K2107760
                    *             PRODUCE PSEUDO-STMNT-ID WHICH IS      K2107770
                    *             REQUIRED BY OTHER PARTS OF THIS       K2107780
                    *             ROUTINE                               K2107790
                    *             (FOR HANDLING NORM PROPERLY           K2107800
                    *                                                   K2107810
                          LD    3 TEMP2-Z  LD START OF STMNT PT         K2107820
                          S     3 TINP-Z   SUBTRACT VAL OF I/P POINTER  K2107830
                          SLA     2        SHIFT TO INCR NORM COUNT     K2107840
                          A    I  TEMP2    INCR NORM COUNT OF STMNT ID  K2107850
                          STO   1 0        SAVE IN I/P STRING           K2107860
                    *                                                   K2107870
                          LD    3 SUBIN-Z  LD .SUBIN. ID WD             K2107880
                          BSI   3 OUTP-Z   OUTPUT .CALL SUBIN.          K2107890
                    *                                                   K2107900
                    *             STORE LOCATION COUNTER FOR REINITIAL  K2107910
                          LD    3 LOCC2-Z  LD LOC COUNTER               K2107920
                          STO   3 TEMP3-Z  SAVE                         K2107930
                    *                                                   K2107940
                    *             INSERT ADDR F BEGINNING OF            K2107950
                    *             ARGUMENT LIST                         K2107960
                    *                                                   K2107970
                          MDX   2 1        INCR O/P POINTER             K2107980
                          STX  L2 S2052+1  SAVE O/P ADDR                K2107990
                          MDX   2 -1       DECR O/P POINTER             K2108000
                    *                                                   K2108010
                    S2081 LD    3 DUMVC-Z  DUMMY VAR COUNTER            K2108020
                          BSC     +        SKIP IF NOT ZERO             K2108030
                          MDX     S2051    BR IF ZERO (=END OF LIST)    K2108040
                          S     3 ONE-Z    DECR DUMMY VAR COUNTER       K2108050
                          STO   3 DUMVC-Z  SAVE                         K2108060
                          LD   I  DUMVP    DUMMY VAR TO .TESTNAME.      K2108070
                          STO   3 TESTN-Z  SAVE                         K2108080
                          BSI   3 GETST-Z  BR TO GET SYM TBL ID WD.     K2108090
                          BSI   3 SUBPR-Z  TEST IF SUBP NAME            K2108100
                    *                                                   K2108110
                    *             'ERASE' DUMMY VAR NAME IN SYM TBL TO  K2108120
                    *             AVOID MIXUP WITH SUBPROGRAM DUMMIES   K2108130
                    *                                                   K2108140
                          LD    3 H0220-Z  LD STMNT NO, DEFN VAR FLAG   K2108150
                          STO  I  GETS1+1  SAVE AS SYM TBL ID WD.       K2108160
                    *                                                   K2108170
                          MDX  L  DUMVP,1  INCR DUMMY VAR.POINTER       K2108180
                    *                                                   K2108190
                    *             RESET LOCATION COUNTER                K2108200
                          LD    3 TEMP3-Z  LD WD FROM TEMP STORAGE      K2108210
                          STO   3 LOCC2-Z  SAVE                         K2108220
                    *                                                   K2108230
                          MDX     S2092    CONTINUE                     K2108240
                    *                                                   K2108241
                    *        TEST OVERLAP ROUTINE                       K2108242
                    *                                                   K2108243
                    OVTST DC      *-*        LINK                   2-4 K2108244
                          LD    3 TINP-Z     CHECK IF               2-4 K2108245
                          S     3 TOUT-Z     OVERLAP                2-4 K2108246
                          BSC  L  OVERR,+    BRANCH IF YES          2-4 K2108247
                          BSC  I  OVTST      RETURN IF NO           2-4 K2108248
                    *                                                   K2108249
                    *                                                   K2108250
                    S2091 LDX  I1 TINP     SET INPUT POINTER            K2108260
                    *                                                   K2108270
                    *             TEST IF FIRST STATEMENT IS AN         K2108280
                    *             .END.-STATEMENT                       K2108290
                    *                                                   K2108300
                          BSI     OVTST      TEST OVERLAP           2-4 K2108305
                          LD    1 0        LD STMNT ID WD               K2108310
                          AND   3 HF800-Z  MASK TO GET TYPE BITS.       K2108320
                          S     3 H1000-Z  SUBTRACT END STMNT ID        K2108330
                          BSC  L  S2132,+-  BR IF END STATEMENT         K2108340
                    *                                                   K2108350
                          LD    1 0        OUTPUT ID-WD (NORM=4)        K2108360
                          AND   3 HF803-Z  MASK ID BITS                 K2108370
                          A     3 FOUR-Z   COMPUTE NORM = 4             K2108380
                          MDX   2 1        INCR O/P POINTER             K2108390
                          STO   2 0        STORE IN OUTPUT STRING       K2108400
                          STX  L2 OUTID    STORE ADDR OF OUTPUT-ID      K2108410
                    S2092 LDX  I1 TINP     INITIAL I/P POINTER          K2108420
                          BSI     OVTST      TEST OVERLAP           2-4 K2108425
                    S2093 LD    1 0        INITIALIZE STMNT LENGTH      K2108430
                          AND   3 H07FC-Z  *COUNTER                     K2108440
                          STO   3 NORM-Z   *(NORM)                      K2108450
                          BSI   3 TRSW-Z   TRACKSWITCH                  K2108460
                          DC      S2106    ARITH STMNT FUNC             K2108470
                          DC      S2101    SUBP INITIALIZATION          K2108480
                          DC      S2101    STMNT ALLOCATION             K2108490
                    S2101 LD    3 ASFSW-Z  GET ASF SW                   K2108500
                          BSC  L  S2115,Z   BR IF ASF SW SET            K2108510
                          LD    1 0        LD STMNT ID WD               K2108520
                          BSC     E        SKIP IF STMNT HAS NO LABEL   K2108530
                          MDX     S2102    BR IF IT HAS                 K2108540
                          MDX     S2106    BR TO INCR I/P POINTER       K2108550
                    S2102 BSI   3 TRSW-Z   TRACKSWITCH                  K2108560
                          DC      S2104    ARITH STMNT FUNC             K2108570
                          DC      S2104    SUBP INITIALIZATION          K2108580
                          DC      S2103    STMNT ALLOCATION             K2108590
                    S2103 LD    1 1        GET STMNT ID                 K2108600
                          BSI   3 OUTP-Z   PUT IN O/P STRING            K2108610
                          LD    1 1        GET SYM TBL ID OF STMNT NAME K2108620
                          BSI   3 GETST-Z  INSERT ALLOCATION BIT        K2108630
                          OR    3 2                                     K2108640
                          STO  I  GETS1+1  SAVE BACK IN SYM TBL         K2108650
                          LD    3 LOCC2-Z  GET LOC CTR                  K2108660
                          BSI   3 OUTP-Z   PUT ON O/P STRING            K2108670
                    S2104 BSI   3 INCPT-Z  INCR INPUT POINTER           K2108680
                    S2106 BSI   3 INCPT-Z  INCR INPUT POINTER           K2108690
                    S2111 LD    3 NORM-Z   STMNT COUNTER (FR NORM)      K2108700
                          BSC     Z-       SKIP IF END OF STMNT         K2108710
                          MDX     S2141    BR IF NOT                    K2108720
                          BSI   3 TRSW-Z   TRACKSWITCH                  K2108730
                          DC      S2112    ARITH STMNT FUNC             K2108740
                          DC      S2121    SUBP INITIALIZATION          K2108750
                          DC      S2121    STATEMENT ALLOCATION         K2108760
                    S2112 LD    3 0        LD A CONSTANT ZERO           K2108770
                          BSI   3 OUTP-Z   PUT IN O/P STRING            K2108780
                          MDX  L  LOCC2,1  INCR LOC COUNTER             K2108790
                          NOP              TO AVOID SKIPPING       2-10 K2108795
                          MDX     S2081    BR TO TEST DUMMY VAR COUNTER K2108800
                    *                                                   K2108810
                    *             ASF SWITCH SET, INCR INPUT POINTER    K2108820
                    *             ONE EXTRA WORD (ALLOCATION IS ON STR) K2108830
                    *                                                   K2108840
                    S2115 BSI   3 INCPT-Z  BR TO INCR I/P POINTER ONCE  K2108850
                          MDX     S2104    BR TO CONTINUE TO INCR PT    K2108860
                    *                                                   K2108870
                    *             TEST IF SWITCH SET (IF I/P PT REFERS  K2108880
                    *             TO ASF-STTMNT IN OUTPUT STRING)       K2108890
                    *                                                   K2108900
                    S2121 LD    3 ASFSW-Z  GET ASF SW                   K2108910
                          BSC  L  S2124,Z  BR IF SWITCH SET             K2108920
                    *                                                   K2108930
                          LD    1 0        LD STMNT ID WD               K2108940
                          AND   3 HF800-Z  GET STMNT TYPE               K2108950
                          S     3 H1000-Z  SUBTRACT.END.STMNT CON       K2108960
                          BSC     +-       SKIP IF NXT STMNT NOT .END.  K2108970
                          MDX     S2131    BR IF .END.                  K2108980
                          LD    1 0        INITIALIZE STMNT LENGTH      K2108990
                          AND   3 H07FC-Z  *COUNTER                     K2109000
                          STO   3 NORM-Z   *(NORM)                      K2109010
                          BSI   3 TRSW-Z   TRACKSWITCH                  K2109020
                          DC      S2101    ARITH STMNT FUNC             K2109030
                          DC      S2101    SUBPR INITIALIZATION         K2109040
                          DC      S2122    STATEMENT ALLOCATION         K2109050
                    S2122 LD    1 0        O/P NXT ID                   K2109060
                          AND   3 HF803-Z  INITIALIZE NORM              K2109070
                          A     3 FOUR-Z   COMPUTE NORM = 4             K2109080
                          STO   2 1        SAVE IN O/P STRING           K2109090
                          MDX   2 1        INCR O/P STRING POINTER      K2109100
                          STX  L2 OUTID    SAVE OUTPUT ID WORD          K2109110
                          MDX     S2101    BR TO CONTINUE               K2109120
                    *                                                   K2109130
                    *             HANDLE ASF- AND FORMAT STAEMENTS      K2109140
                    *             AT SUBPROGRAM INITIALIZE STRING COUNT K2109150
                    *                                                   K2109160
                    S2124 LD    1 0        LD I/P STRING ID WORD        K2109170
                          AND   3 HF800-Z  MASK TYPE BITS               K2109180
                          S     3 H6000-Z  SUBTRACT FORMAT TYPE CON     K2109190
                          BSC  L  S2126,Z  BR IF STMNT NOT FORMAT       K2109200
                    *                                                   K2109210
                    *             MOVE POINTER TO NEXT STATEMENT        K2109220
                    *             AND COUNT IN LOCATION COUNTER         K2109230
                    *                                                   K2109240
                          LD    1 0        LD ID WORD                   K2109250
                          AND   3 H07FC-Z  MASK TO GET STMNT NORM       K2109260
                          SRA     2        RIGHT JUSTIFY                K2109270
                          STO     S2125+1  SAVE NORM COUNT              K2109280
                          S     3 THREE-Z  DO NOT COUNT ID WORD,        K2109290
                    *                      STMNT NO. AND ALLOCATION     K2109300
                          A     3 LOCC2-Z  INCR LOC COUNTER             K2109310
                          STO   3 LOCC2-Z  SAVE IN LOC COUNTER          K2109320
                    S2125 MDX  L1 *-*      TEST FOR ZERO NORM           K2109330
                          MDX     S2124    BR IF NOT ZERO               K2109340
                    *                                                   K2109350
                    S2126 S     3 H7000-Z  'D000' - '6000'              K2109360
                          BSC  L  S2093,+- BR IF ASF                    K2109370
                    *                                                   K2109380
                    *             SWITCH POINTER TO REFER TO INPUT      K2109390
                    *             STRING, CHANGE SWITCH                 K2109400
                    *                                                   K2109410
                          LD    3 ZERO-Z   CLEAR                        K2109420
                          STO   3 ASFSW-Z  *ASF SW                      K2109430
                          LD    3 LOCC1-Z  MOVE LOC                     K2109440
                          STO   3 LOCC2-Z  *COUNTER                     K2109450
                          LDX  I1 TINP     LD INPUT POINTER             K2109460
                          MDX     S2093    BR                           K2109470
                    *                                                   K2109480
                    S2131 BSI   3 TRSW-Z   TRACKSWITCH                  K2109490
                          DC      S2133    *SHOULD NEVER USE            K2109500
                          DC      S2133    SUBP INITIALIZATION          K2109510
                          DC      S2132    STMNT ALLOCATION             K2109520
                    *                                                   K2109530
                    *             OUTPUT .END.-STATEMENT                K2109540
                    S2132 LD    1 0        LD .END. WORD                K2109550
                          STO   2 1        PUT IN O/P STRING            K2109560
                          MDX   2 2        INCR O/P POINTER             K2109570
                          STX  L2 EOFS     INSERT END-OF-STRING         K2109580
                          BSC  I  S2011    RETURN                       K2109590
                    *                                                   K2109600
                    S2133 LD    3 ZERO-Z   OUTPUT                       K2109610
                          BSI   3 OUTP-Z   CONSTANT ZERO                K2109620
                    *                                                   K2109630
                    *             IF SUBPROG NAME TRANSFER SWITCH       K2109640
                    *             (SNTSW) SET, RUN SAME DUMMY VARIABLE  K2109650
                    *             NAME ONCE MORE                        K2109660
                          LD    3 SNTSW-Z  LD TRANSFER SW               K2109670
                          BSC  L  S2134,+- BR IF SW NOT SET             K2109680
                          LD    3 ZERO-Z   ZERO TO SWITCH               K2109690
                          STO   3 SNTSW-Z                               K2109700
                          BSC  L  S203X    BR BACK                      K2109710
                    S2134 LD    3 DUMVC-Z  DUMMY VAR COUNTER            K2109720
                          BSC  L  S2051,+- BR IF COUNT IS ZERO          K2109730
                          S     3 ONE-Z    DECR DUMMY VAR COUNTER       K2109740
                          STO   3 DUMVC-Z                               K2109750
                          LD   I  DUMVP    GET DUMMY VAR NAME           K2109760
                          BSC  L  S2041+1  TO BRANCH TO S2031 PRECEDED  K2109770
                    *                      BY MOVING DUMMY VAR POINTER  K2109780
                    S2141 LD    1 0        LD STRING I/P WORD           K2109790
                          BSC     -        SKIP IF WORD AT PT PACKED    K2109800
                    *                      *OR NAME ONLY                K2109810
                          MDX     S2151    BR IF NOT                    K2109820
                          AND   3 H7800-Z  MASK TO GET NAME BITS        K2109830
                          BSC  L  S2143,+- BR IF NAME ONLY              K2109840
                    *                                                   K2109850
                          MDX  L  LOCC2,1  COUNT EXTRA FOR PACKED INSTR K2109860
                          NOP              TO AVOID SKIPPING       2-10 K2109865
                    *                                                   K2109870
                    S2143 BSI   3 TRSW-Z   TRACKSWITCH                  K2109880
                          DC      S2144    ARITH STMNT FUNC             K2109890
                          DC      S2144    SUBP INITLZ                  K2109900
                          DC      S2145    STMNT ALLOCATION             K2109910
                    S2144 LD    1 -1       LD STRING WD                 K2109920
                          S     3 H6200-Z  TEST IF                      K2109930
                          BSC  L  S2146,+- BR IF YES                    K2109940
                          LD    1 0        LD NXT STRING WD             K2109950
                          BSI   3 NAMT-Z   NAMETEST                     K2109960
                          MDX     S2146    BR TO INCR LOCCTR            K2109970
                    *                                                   K2109980
                    S2145 LD    1 0        LD STRING WORD               K2109990
                          BSI   3 OUTP-Z   OUTPUT WORD AT POINTER       K2110000
                    S2146 MDX  L  LOCC2,1  INCR LOC CTR                 K2110010
                          NOP              TO AVOID SKIPPING       2-10 K2110015
                          MDX     S2106    BR TO CONTINUE               K2110020
                    *                                                   K2110030
                    *             OPERATOR .LDX L1. HAS BEEN            K2110040
                    *             ENCOUNTERED                           K2110050
                    *                                                   K2110060
                    S2151 LD    1 0        LD STRING WD                 K2110070
                          S     3 LDXL1-Z  TEST FOR .LDX L1.            K2110080
                          BSC     Z        SKIP IF .LDX L1.             K2110090
                          MDX     S2161    BR IF NOT                    K2110100
                          MDX  L  LOCC2,1  INCR LOCCOUNTER2             K2110110
                          NOP              TO AVOID SKIPPING       2-10 K2110115
                          BSI   3 INCPT-Z  INCR I/P POINTER             K2110120
                          BSI   3 TRSW-Z   TRACKSWITCH                  K2110130
                          DC      S2146    ARITH STMNT FUNC             K2110140
                          DC      S2146    SUBP INITLZ                  K2110150
                          DC      S2152    STMNT ALLOCATION             K2110160
                    S2152 LD    1 -1       LD .LDX L1 WD FR STRING      K2110170
                          BSI   3 OUTP-Z   OUTPUT .LDX L1.              K2110180
                          MDX     S2145    BR TO O/P NXT WD IN STRING   K2110190
                    *                                                   K2110200
                    *                                                   K2110210
                    S2161 LD    1 0        LD STRING WORD               K2110220
                          S     3 SUBSC-Z                               K2110230
                          BSC     +-       TEST FOR .CALL SUBSC.        K2110240
                          MDX     S2171    BR IF .CALL SUBSC.           K2110250
                          LD    1 0        LD STRING WD                 K2110260
                          AND   3 HFF80-Z  TEST FOR .CALL  SUBPROGRAM.  K2110270
                          BSC  L  S3011,+- BR IF .CALL SUBPROGRAM.      K2110280
                    *                      * (2-WD CALL)                K2110290
                    *                                                   K2110300
                    *             TEST IF GENERATED LABEL OPERATOR      K2110310
                    *                                                   K2110320
                          LD    1 0        LD STRING WD                 K2110330
                          AND   3 HFF80-Z  MASK TO GET ONLY OPERATOR    K2110340
                          S     3 H5E00-Z  TEST IF GENERATED LABEL      K2110350
                          BSC     +-       SKIP IF NO                   K2110360
                          MDX     S2201    BR IF YES                    K2110370
                    *                                                   K2110380
                    *             TEST IF 'CALL SUBIN'                  K2110390
                          LD    1 0        LD STRING WD                 K2110400
                          S     3 SUBIN-Z  TEST FOR  'CALL SUBIN'       K2110410
                          BSC  L  S2165,+- BR IF 'CALL SUBIN'           K2110420
                    *                                                   K2110430
                          S     3 H0680-Z  TEST FOR SDAF                K2110440
                          BSC     Z        SKIP IF SDAF                 K2110450
                          S     3 HFF80-Z  TEST FOR SDAT                K2110460
                          BSC     Z        SKIP IF SDAI OR SDAF         K2110470
                          S     3 HF300-Z  TEST FOR FIOAF               K2110480
                          BSC     Z        SKIP IF ANY OF ABOVE 3       K2110490
                          S     3 HFF80-Z  TEST FOR FIOAI               K2110500
                          BSC     Z        SKIP IF ANY OF ABOVE 4       K2110510
                          S     3 H0880-Z  TEST FOR UIOAF               K2110520
                          BSC     Z        SKIP IF ANY OF ABOVE 5       K2110530
                          S     3 HFF80-Z  TEST FOR VIOAI               K2110540
                          BSC  L  S2162,Z  BR IF NOT ANY OF ABOVE       K2110550
                          BSI   3 INCPT-Z  INCR I/P POINTER             K2110560
                          MDX  L  LOCC2,1  INCR LOC CTR                 K2110570
                          NOP              TO AVOID SKIPPING       2-10 K2110575
                          BSI   3 TRSW-Z   TRACKSWITCH                  K2110580
                          DC      TINE     ASF                          K2110590
                          DC      FORK     SUBP INITLZ                  K2110600
                          DC      PRONG    STMNT ALLOCATION             K2110610
                    PRONG LD    1 -1       LD STRING WD                 K2110620
                          BSI   3 OUTP-Z   PUT OUT LIBF                 K2110630
                          LD    1 0        LD NXT STRING WD             K2110640
                          BSI   3 OUTP-Z   PUT OUT LIBF                 K2110650
                          LD    1 1        LD NXT STRING WD             K2110660
                          BSI   3 OUTP-Z   PUT OUT ALLOCATION           K2110670
                    TINE  MDX  L  LOCC2,2  INCR LOC CTR                 K2110680
                          NOP              TO AVOID SKIPPING       2-10 K2110685
                          BSC  L  S2104    CONTINUE THROUGH STMNT       K2110690
                    FORK  LD    1 0        LD STRING WD (SUBP INITLZ)   K2110700
                          BSI   3 NAMT-Z   TEST FOR NAME                K2110710
                          MDX     TINE     BR TO INCR LOC CTR           K2110720
                    S2162 BSI   3 TRSW-Z   TRACK SW                     K2110730
                          DC      S2146    ASF                          K2110740
                          DC      S2146    SUBP INITLZ                  K2110750
                          DC      S2145    STMNT ALLOCATION             K2110760
                    *                                                   K2110770
                    *             'CALL SUBIN' HAS BEEN ENCOUNTERED     K2110780
                    *             MOVE POINTER PAST ARG LIST, COUNT LOC K2110790
                    *                                                   K2110800
                    S2165 MDX  L  LOCC2,1  INCR LOC CTR                 K2110810
                          NOP              TO AVOID SKIPPING       2-10 K2110815
                          LD    1 0        LD STRING PTR                K2110820
                          S     3 ONE-Z    TEST FOR END OF ARGUMENTLIST K2110830
                          BSC  L  S2106,+- BR IF END                    K2110840
                          BSI   3 INCPT-Z  BR TO INCR I/P PT            K2110850
                          MDX     S2165    BR TO CONTINUE THROUGH LIST  K2110860
                    *                                                   K2110870
                    *             .CALL SUBSC. HAS BEEN ENCOUNTERED     K2110880
                    S2171 BSI   3 TRSW-Z   TRACKSWITCH                  K2110890
                          DC      S2173    ASF                          K2110900
                          DC      S2173    SUBP INITLZ                  K2110910
                          DC      S2172    STMNT ALLOCATION             K2110920
                    *                                                   K2110930
                    *             PROCESS .CALL SUBSC., SGT, D4         K2110940
                    *                                                   K2110950
                    S2172 LD    1 0        LD STRING WD 0               K2110960
                          BSI   3 OUTP-Z   BR TO O/P WD                 K2110970
                          LD    1 1        LD STRING WD 1               K2110980
                          BSI   3 OUTP-Z   BR TO O/P WD                 K2110990
                          LD    1 2        LD STRING WD 2               K2111000
                          BSI   3 OUTP-Z   BR TO O/P WD                 K2111010
                    *                                                   K2111020
                    S2173 BSI   3 INCPT-Z  INCR I/P POINTER ONCE        K2111030
                          BSI   3 INCPT-Z  INCR I/P POINTER AGAIN       K2111040
                          MDX  L  LOCC2,3  INCR LOC CTR BY 3            K2111050
                          NOP              TO AVOID SKIPPING       2-10 K2111055
                    S2181 BSI   3 TRSW-Z   TRACKSWITCH                  K2111060
                          DC      S2182    ASF                          K2111070
                          DC      S2182    SUBP INITLZ                  K2111080
                          DC      S2183    STMNT ALLOCATION             K2111090
                    *                                                   K2111100
                    *             PROCESS D1 (OR D2 OR D3)              K2111110
                    *             AND A VARIABLE                        K2111120
                    *                                                   K2111130
                    S2182 LD    1 1        LD STRING WD.                K2111140
                          BSI   3 NAMT-Z   NAMETEST                     K2111150
                          MDX     S2184    BR TO CONTINUE               K2111160
                    S2183 LD    1 1        LD STRING WD1                K2111170
                          BSI   3 OUTP-Z   PUT ON O/P STRING            K2111180
                          LD    1 2        LD STRING WD2                K2111190
                          BSI   3 OUTP-Z   BR TO PUT ON STRING          K2111200
                    S2184 BSI   3 INCPT-Z  INCR I/P POINTER ONCE        K2111210
                          BSI   3 INCPT-Z  INCR I/P POINTER TWICE       K2111220
                          MDX  L  LOCC2,2  INCR LOC CTR BY 2            K2111230
                          NOP              TO AVOID SKIPPING       2-10 K2111235
                    *                                                   K2111240
                    *             TEST IF LAST (TAGGED) ARGUMENT        K2111250
                          LD    1 0                                     K2111260
                          BSC  L  S2106,+Z LD NXT STRING WD             K2111270
                          MDX     S2181    BR IF WD NEGATIVE            K2111280
                    *                      BR TO CONTINUE THROUGH STRIN K2111290
                    *                                                   K2111300
                    *             GENERATED LABEL OPERATOR HAS BEEN     K2111310
                    *             ENCOUNTERED                           K2111320
                    *                                                   K2111330
                    S2201 LD    1 0        LD STRING WD                 K2111340
                    *  1 INSTRUCTION REMOVED                       2-11 K2111350
                          AND   3 THREE-Z   DETERMINE IF TBL DISP  2-11 K2111352
                    *                       *IS TOO LARGE          2-11 K2111354
                          BSC     +         SKIP IF NO             2-11 K2111356
                          A     3 ONE-Z     MAKE DISP = 1          2-11 K2111358
                          A     3 GLTBO-Z  TABLE ORIGIN ADDRESS         K2111360
                          STO     S2202+1  SAVE ADDR                    K2111370
                    S2202 LD   L  *-*      LD TABLE WD                  K2111380
                          BSC     Z        SKIP IF NOT IN TABLE         K2111390
                          MDX     S2203    BR IF IN TABLE               K2111400
                    *                                                   K2111410
                    *             INSERT INTO TABLE                     K2111420
                          LD    3 LOCC2-Z  INSERT LOCCTR2 AS            K2111430
                          STO  I  S2202+1  * TABLE VALUE                K2111440
                          BSC  L  S2106    BR TO CONTINUE               K2111450
                    *                                                   K2111460
                    *             ELIMINATE FROM TABLE                  K2111470
                    S2203 STO   3 TEMP1-Z  STORE TABLE VALUE            K2111480
                          LD    3 0        ZERO TO TABLE                K2111490
                          STO  I  S2202+1                               K2111500
                          BSI   3 TRSW-Z   TRACKSWITCH                  K2111510
                          DC      S2216    ASF                          K2111520
                          DC      S2216    SUBP INITLZ                  K2111530
                          DC      S2211    STMNT ALLOCATION             K2111540
                    *                                                   K2111550
                    *                                                   K2111560
                    *             OUTPUT SPECIAL BSC L                  K2111570
                    *                                                   K2111580
                    S2211 LD    3 SBSCL-Z  OUTP .SPEC BSC L.            K2111590
                          BSI   3 OUTP-Z   BR TO O/P SUBR               K2111600
                          LD    3 TEMP1-Z  OUTPUT VALUE FR GENERATED    K2111610
                          BSI   3 OUTP-Z   * LABEL TABLE                K2111620
                    S2216 MDX  L  LOCC2,2  INCR LOC CTR BY 2            K2111630
                          NOP              TO AVOID SKIPPING       2-10 K2111635
                          BSC  L  S2106    BR TO CONTINUE               K2111640
                    *                                                   K2111650
                    *                                                   K2111660
                    *             .CALL.-OPERATOR HAS BEEN ENCOUNTERED  K2111670
                    *                                                   K2111680
                    *             INCR INPUT POINTER AND LOCCOUNTER 2   K2111690
                    *                                                   K2111700
                    S3011 BSI   3 INCPT-Z  BR TO INCR I/P POINTER       K2111710
                          MDX  L  LOCC2,1  INCR LOC CTR                 K2111720
                          NOP              TO AVOID SKIPPING       2-10 K2111725
                    *                                                   K2111730
                          BSI   3 TRSW-Z   TRACKSWITCH                  K2111740
                          DC      S3012    ASF                          K2111750
                          DC      S3012    SUBP INITLZ                  K2111760
                          DC      S3013    STMNT ALLOC                  K2111770
                    *                                                   K2111780
                    S3012 LD    1 0        LD STRING WD                 K2111790
                          BSI   3 NAMT-Z   TEST IF NAME                 K2111800
                          BSC  L  S2146    BR TO INCR LOC CTR           K2111810
                    *                                                   K2111820
                    *                                                   K2111830
                    *             TEST IF NAME                          K2111840
                    *             DUMMY VARIABLE                        K2111850
                    *                                                   K2111860
                    S3013 LD    1 0        LD STRING WD                 K2111870
                          BSI   3 GETST-Z  BR TO GET SYM TBL ID WD      K2111880
                          AND   3 H0400-Z  MASK FOR DUMMY VAR BIT       K2111890
                          BSC  L  S3015,Z  BR IF DUMMY VARIABLE         K2111900
                    *                                                   K2111910
                    *                                                   K2111920
                    *             OUTPUT .CALL SUBPROGRAM. AND          K2111930
                    *             NAME                                  K2111940
                    *             (WORDS AT POINTER - 1 AND             K2111950
                    *             AT POINTER)                           K2111960
                    *                                                   K2111970
                          LD    1 -1       LD WD AT POINTER-1           K2111980
                          BSI   3 OUTP-Z   BR TO O/P                    K2111990
                          LD    1 0        LD WD AT POINTER             K2112000
                          BSI   3 OUTP-Z   BR TO O/P                    K2112010
                          BSC  L  S2146    BR TO CONTINUE THROUGH STMNT K2112020
                    *                                                   K2112030
                    *                                                   K2112040
                    *             NAME IS BOTH DUMMY VARIABLE AND       K2112050
                    *             EXTERNAL                              K2112060
                    *             OUTPUT BSI I, NAME AT POINTER         K2112070
                    *                                                   K2112080
                    S3015 LD      H4780    LD .BSI I. CONSTANT          K2112090
                          BSI   3 OUTP-Z   PUT ON O/P STRING            K2112100
                          LD    1 0        LD NAME FR I/P STRING        K2112110
                          BSI   3 OUTP-Z   PUT ON O/P STRING            K2112120
                          BSC  L  S2146    BR TO CONTINUE               K2112130
                    *                                                   K2112140
                    H4780 DC      /4780    .BSI I.                      K2112150
                    *                                                   K2112160
                    *                                                   K2112170
                    *************************************************** K2112180
                    *                                                   K2112190
                    GLABT DC      0        GENERATED LABEL TABLE        K2112200
                          DC      0                                     K2112210
                          DC      0                                     K2112220
                          DC      0                                     K2112230
                    SUBER MDX  L  ERROR,4  SET SUBIN TOO LARGE      2-3 K2112240
                    *                                                   K2112250
                    EXIT  LDX  I1 NXTPH+1  LOAD PARAMETER FOR READING   K2112260
                          LDD     NXTPH+2  *NXT PHASE                   K2112270
                          BSC  L  ROL      GO TO READ NEXT PHASE        K2112280
                          BSS  E  0                                     K2112290
                    NXTPH DC      52       ID OF NXT PHASE              K2112300
                          DC      *-*      CORE ADDR NEXT PHASE         K2112310
                          DC      *-*        WORD COUNT NEXT PHASE      K2112320
                          DC      *-*        SECTOR ADDRESS NEXT PHASE  K2112330
                    *                                                   K2112335
                          BSS     /7DF5-*   PATCH AREA             2-10 K2112340
                          DC       0                                    K2112350
                          END     BPHAR-2                               K2112360
