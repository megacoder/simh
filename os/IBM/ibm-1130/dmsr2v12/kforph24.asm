                          HDNG    1130 FORTRAN COMPILER PHASE 24        K2400010
                    *************************************************** K2400020
                    *                                                 * K2400030
                    *STATUS- VERSION 2, MODIFICATION 4                * K2400040
                    *                                                 * K2400050
                    *FUNCTION/OPERATION-                              * K2400060
                    *   * LIST CORE REQUIREMENTS                      * K2400070
                    *   * CONVERT CONSTANTS TO DECIMAL AND LIST       * K2400080
                    *     CONSTANTS AND THEIR ADDRESSES AT USER'S     * K2400090
                    *     REQUEST. REAL CONSTANTS ARE LISTED FIRST,   * K2400100
                    *     FOLLOWED BY INTEGER CONSTANTS               * K2400110
                    *                                                 * K2400120
                    *ENTRY POINTS-                                    * K2400130
                    *   * NEQ ENTERED FROM ROL SUBROUTINE             * K2400140
                    *                                                 * K2400150
                    *INPUT-                                           * K2400160
                    *   * CONSISTS OF THE SYMBOL TABLE GENERATED IN   * K2400170
                    *     PREVIOUS PHASES AND THE FORTRAN             * K2400180
                    *     COMMUNICATION AREA FROM PREVIOUS PHASES     * K2400190
                    *                                                 * K2400200
                    *OUTPUT-                                          * K2400210
                    *   * LISTING OF REAL AND INTEGER CONSTANTS       * K2400220
                    *   * LISTING OF CORE REQUIREMENTS                * K2400230
                    *                                                 * K2400240
                    *EXTERNAL REFERENCES-                             * K2400250
                    *   SUBROUTINES-                                  * K2400260
                    *      * ROL-ROUTINE TO READ NEXT PHASE           * K2400270
                    *      * PRINT-ROUTINE TO PRINT A LINE            * K2400280
                    *      * LSTPR-ROUTINE TO PRINT                   * K2400290
                    *                                                 * K2400300
                    *   COMMA/DCOM                                    * K2400310
                    *      * $PHSE                                    * K2400320
                    *      * $CHN12                                   * K2400330
                    *                                                 * K2400340
                    *EXITS-                                           * K2400350
                    *   NORMAL-                                       * K2400360
                    *      * EXIT-THE INTERPHASE ROL ROUTINE IS CALLED* K2400370
                    *       TO READ IN THE NEXT PHASE.                * K2400380
                    *                                                 * K2400390
                    *   ERROR-N/A                                     * K2400400
                    *                                                 * K2400410
                    *TABLES/WORK AREAS                                * K2400420
                    *   PROGRAMMED SWITCHES-                          * K2400430
                    *      THE SWITCHES USED IN PHASE 24 FOLLOW.      * K2400440
                    *      IF POSITIVE, THE SWITCH IS TRANSFER=T      * K2400450
                    *      IF ZERO, THE SWITCH IS NORMAL=N            * K2400460
                    *      * SWITCH HDRSW                             * K2400470
                    *        N= HEADER NOT PERMITTED                  * K2400480
                    *        T= HEADER ALREADY PRINTED                * K2400490
                    *      * SWITCH STPS                              * K2400500
                    *        N= SYMBOL TABLE SCAN FOR LISTING REAL    * K2400510
                    *           CONSTANTS                             * K2400520
                    *        T0 SYMBOL TABLE SCAN FOR LISTING INTEGER * K2400530
                    *           CONSTANTS                             * K2400540
                    *                                                 * K2400550
                    *ATTRIBUTES-N/A                                   * K2400560
                    *                                                 * K2400570
                    *NOTES-N/A                                        * K2400580
                    *                                                 * K2400590
                    *************************************************** K2400600
                          ABS                                           K2400610
                    *                                                   K2400620
                    *                       SYSTEM EQUATES              K2400630
                    MEMRY EQU     /8000                                 K2400640
                    OVERL EQU     MEMRY-1501 START OF FCOM          2-4 K2400650
                    ROL   EQU     MEMRY-68   LOCN OF RTN TO READ NXT PH K2400660
                    $PHSE EQU     /78        NO. OF PHASE NOW IN CORE   K2400670
                    *                                                   K2400680
                    PHID  EQU     54         ID NUMBER THIS PHASE       K2400690
                    *                       PRINT ROUTINE               K2400700
                    *                                                   K2400710
                    HEAD  EQU     ROL-49     PAGE HEADER AREA           K2400720
                    OVERP EQU     HEAD-327-2 DEVICE PRINT ROUTINE AREA  K2400730
                    NEWPG EQU     OVERP-54   INDIRECT ENTRY PAGE EJECT  K2400740
                    $CH12 EQU     /06        CHANNEL 12 INDICATOR       K2400750
                    PRINT EQU     NEWPG+2    PRINT INTERFACE RTN ENTRY  K2400760
                    LSTPR EQU     OVERP+3    DEVICE PRINT RTN ENTRY     K2400770
                    AREA  EQU     NEWPG+1    MESSAGE ADDRESS            K2400780
                    *                                                   K2400790
                          ORG     OVERL                                 K2400800
                    *                                                   K2400810
                    *                  FORTRAN COMMUNICATION AREA       K2400820
                    ORG   BSS     1    ORIGIN ADDRESS               2-4 K2400825
                    SOFS  BSS     1    START OF STRING                  K2400830
                    EOFS  BSS     1    END OF STRING                    K2400840
                    SOFST BSS     1    START OF SYMBOL TABLE            K2400850
                    SOFNS BSS     1    LENGTH OF PROGRAM                K2400860
                    SOFXT BSS     1    SIZE OF WORK AREA (VAR AREA)     K2400870
                    SOFGT BSS     1    SIZE OF CONSTANTS AREA           K2400880
                    EOFST BSS     1    END OF SYMBOL TABLE              K2400890
                    COMON BSS     1    RELATIVE ENTRY POINT             K2400900
                    CSIZE BSS     1    SIZE OF COMMON                   K2400910
                    ERROR BSS     1    ERROR FLAG                       K2400920
                    *               BIT 15 OVERLAP ERROR                K2400930
                    *               BIT 14 OTHER ERROR                  K2400940
                    *               BIT 13 SUBIN TOO LARGE          2-4 K2400942
                    *               BIT 12 CORE REQUIREMENTS EXCESS 2-4 K2400944
                    *               BIT 11 ORIGIN IN SUBPROGRAM     2-4 K2400945
                    *               BIT 10 OVERLAP IN PHASE 21      2-4 K2400946
                    *               BIT  9 INVALID ORIGIN           2-4 K2400947
                    FNAME BSS     1    PROGRAM NAME                     K2400950
                          BSS     1                                     K2400960
                    SORF  BSS     1    SUBROUTINE(-) OR FUNCTION(+)     K2400970
                    CCWD  BSS     1    CONTROL CARD WORD                K2400980
                    *                BIT 15 TRANSFER TRACE              K2400990
                    *                BIT 14 ARITHMETIC TRACE            K2401000
                    *                BIT 13 EXTENDED PRECISION          K2401010
                    *                BIT 12 LIST SYMBOL TABLE           K2401020
                    *                BIT 11 LIST SUBPROGRAM NAMES       K2401030
                    *                BIT 10 LIST SOURCE PROGRAM         K2401040
                    *                BIT  9 ONE WORD INTEGERS           K2401050
                    *                BIT  8 ORIGIN                  2-4 K2401055
                    IOCS  BSS     1    IOCS CONTROL CARD WORD           K2401060
                    *                BIT 15 CARD                        K2401070
                    *                BIT 14 PAPER TAPE                  K2401080
                    *                BIT 13 TYPEWRITER                  K2401090
                    *                BIT 12 1403 PRINTER                K2401100
                    *                BIT 11 2501 READER                 K2401110
                    *                BIT 10 KEYBOARD                    K2401120
                    *                BIT  9 1442 PUNCH                  K2401130
                    *                BIT  8 DISK                        K2401140
                    *                BIT  7 1132 PRINTER                K2401150
                    *                BIT  3 PLOTTER                     K2401160
                    *                BIT  1 UNFORMATTED DISK            K2401170
                    DFCNT BSS     1                                     K2401180
                    *                                                   K2401190
                    *                  END OF FORTRAN COMMUNICATION     K2401200
                    *                  AREA                             K2401210
                    *                                                   K2401220
                    BPHAR EQU     *+2      BEGIN PHASE AREA             K2401230
                          DC      0        LOADER WORK AREA             K2401240
                          DC      -54      -PHASE ID FOR SLET LOOKUP    K2401250
                          DC      NXTPH-*+1  TBL FOR NEXT PHASE ENTRY   K2401260
                          DC      1        ONE ENTRY TO BE SET BY LDR   K2401270
                          ORG     *-2                                   K2401280
                    *                                                   K2401290
                    NEQ   BSC  L  ENT      BRANCH TO INITLZ PROGRAM     K2401300
                    WDCNT DC      *-*      WORD COUNT OF PRINT BUFFER   K2401310
                    PAREA DC      /4000    BLANK                        K2401320
                          DC      /4000    BLANK                        K2401330
                          DC      /4000    BLANK                        K2401340
                          DC      /4000    BLANK                        K2401350
                          DC      /4000    BLANK                        K2401360
                          DC      /4000    BLANK                        K2401370
                          DC      /4000    BLANK                        K2401380
                          DC      /4000    BLANK                        K2401390
                          DC      /4000    BLANK                        K2401400
                          DC      /4000    BLANK                        K2401410
                          DC      /4000    BLANK                        K2401420
                          DC      /4000    BLANK                        K2401430
                          DC      /4000    BLANK                        K2401440
                          DC      /4000    BLANK                        K2401450
                          DC      /4000    BLANK                        K2401460
                          DC      /4000    BLANK                        K2401470
                          DC      /4000    BLANK                        K2401480
                    TEXT1 DC      /D900    R                            K2401490
                          DC      /C500    E                            K2401500
                          DC      /C100    A                            K2401510
                          DC      /D300    L                            K2401520
                          DC      /4000    BLANK                        K2401530
                          DC      /C300    C                            K2401540
                          DC      /D600    O                            K2401550
                          DC      /D500    N                            K2401560
                          DC      /E200    S                            K2401570
                          DC      /E300    T                            K2401580
                          DC      /C100    A                            K2401590
                          DC      /D500    N                            K2401600
                          DC      /E300    T                            K2401610
                          DC      /E200    S                            K2401620
                    *                                                   K2401630
                    PTEX1 LD    3 PAPIN-Z  GET INT VALUE OF PR AREA PT  K2401640
                          STO  L  AREA     SAVE IN MESSAGE ADDRESS      K2401650
                          LDX   3 1        XR3 = 1                      K2401660
                          STX  L3 WDCNT    SAVE IN WD CNT TO PR BLNK LN K2401670
                          BSI  L  PRINT    BR TO PRINT BLANK LINE       K2401680
                          LDX  L3 TEXT1    PUT ADDR OF 'REAL CONSTANTS' K2401690
                          STX  L3 AREA     *MESSAGE IN PRINT LOC        K2401700
                          LDX   3 7        XR3 = 7                      K2401710
                          STX  L3 WDCNT    SAVE MESSAGE WD CNT          K2401720
                          BSI  L  PRINT    PRINT MESSAGE                K2401730
                          LDX  L3 PHEAD+2  SET UP PHEAD ROUTINE TO      K2401740
                          STX   3 PHEAD+1  *CONTINUE RATHER THAN BR OUT K2401750
                          STX  L3 BLKPA    SET BLKPA TO RET TO PHEAD+2  K2401760
                          LDX  L3 Z        RESET TRANSFER VECTOR        K2401770
                          BSC  L  BLKPA+1  BR TO BLANK OUT PRINT AREA   K2401780
                    *                                                   K2401790
                    *             INITIALIZE PHASE                      K2401800
                    *             CHECK FOR SYMBOL TABLE OVERLAP        K2401810
                    *                                                   K2401820
                    ENT   LDX   1 PHID     GET PHASE ID                 K2401830
                          STX  L1 $PHSE    STORE IN SYSTEM PHASE AREA   K2401840
                    *                                                   K2401850
                    *             INITIALIZE TRANSFERVECTOR             K2401860
                          LDX  L3 Z        GET ADDR OF CONSTANT AREA    K2401870
                          STX  L3 NEQ      SAVE ADDR                    K2401880
                    *                                                   K2401890
                          LD   L  ERROR    TEST ERROR SW FR PREV PHASES K2401900
                          BSC  L  EXIT,Z   BR TO EXIT IF OVERLAP ERROR  K2401910
                    *                                                   K2401911
                          LD      CCWD       IS THIS AN ABSOLUTE    2-4 K2401912
                          SLA     8          COMPILATION            2-4 K2401914
                          BSC     +Z         NO  - SKIP             2-4 K2401916
                          STO   3 ORGSW-Z    YES - SET ORIGIN SW    2-4 K2401918
                    *                                                   K2401920
                    *             PRINT CORE REQUIREMENTS IF REQUESTED. K2401930
                    *             SET UP TO LIST CONSTANTS.             K2401940
                    *             CHECK FOR EXTENDED PRECISION.         K2401950
                    *             MAKE MODIFICATIONS TO CONSTANTS IF    K2401960
                    *             *EXTENDED PRECISION.                  K2401970
                    *                                                   K2401980
                    L4011 LD    3 0        PUT ZERO IN                  K2401990
                          STO   3 STPS-Z   *SYMBOL TABLE PASS SWITCH    K2402000
                    *                                                   K2402010
                    *             BR TO .STATE CORE REQUIREMENTS.       K2402020
                    *             IF NO LISTING REQUIRED                K2402030
                    *                                                   K2402040
                          LD   L  CCWD     LOAD CONTROL CARD WORD       K2402050
                          SLA     12       SHIFT LIST SYM TBL BIT       K2402060
                          BSC  L  COREQ,-  BR IF NO LIST REQUESTED      K2402070
                    *                                                   K2402080
                    *                                                   K2402090
                    *             TEST IF EXTENDED PRECISION            K2402100
                    *                                                   K2402110
                          SLA     1        SHIFT EXTENDED PREC BIT      K2402120
                          BSC  L  L4012,-  BR IF NO EXTENDED PRECISION  K2402130
                    *                                                   K2402140
                    *             MODIFY PROGRAM IF                     K2402150
                    *             EXTENDED PRECISION                    K2402160
                    *                                                   K2402170
                          MDX  L  RVARF,1  INCR REAL VARIABLE FORMAT    K2402180
                          MDX  L  INCR,4   INCR FLT POINT FORMAT FROM   K2402190
                    *                      20 TO 24                     K2402200
                          MDX  L  L4024,3  INCR NO. DIGITS PAST DECML   K2402210
                          MDX  L  L4025,4  INCR FIELD WIDTH             K2402220
                    *                                                   K2402230
                          MDX     PAREA+120 BR OUT OF OVERLAY PRINT BFR K2402240
                          ORG     PAREA+120                             K2402250
                    *                                                   K2402260
                    L4012 LD   L  SOFXT    INITIALIZE LOCATION          K2402270
                          STO   3 CLOC-Z   OF CURRENT CONSTANT          K2402280
                    L401X LDX  I1 SOFST    INITLZ SYM TBL POINTER       K2402290
                          STX  L1 STP                                   K2402300
                    L4013 LD    3 STP-Z    LOAD SYM TBL POINTER         K2402310
                          S    L  EOFST    TEST FOR END OF SYMBOL TABLE K2402320
                          BSC  L  L4033,+  BR IF END OF SYMBOL TABLE    K2402330
                    L4021 LD    1 0        LOAD SYMBOL TABLE ID WORD    K2402340
                          BSC  L  L4032,-  BR IF NOT CONSTANT           K2402350
                          SLA     1                                     K2402360
                          BSC  L  L4031,+Z BR IF INTEGER CONSTANT       K2402370
                          LD    3 STPS-Z   LD SYMBOL TABLE PASS SWITCH  K2402380
                    *                                                   K2402390
                          BSC  L  L4032,Z  BR IF SWITCH NONZERO         K2402400
                    **************************************************  K2402410
                    *                                                   K2402420
                    *             CONVERT REAL CONSTANT AND PRINT       K2402430
                    *             THE CONSTANT AND ITS LOCATION         K2402440
                    *                                                   K2402450
                    **************************************************  K2402460
                    *                                                   K2402470
                    *             PRINT HEADER IF NOT PRINTED BEFORE    K2402480
                    *             NOTE--NEXT INSTRUCTION IS REPLACED BY K2402490
                    *             *A  BSC  L  PHEAD+2 AFTER THE HEADER  K2402500
                    *             *IS PRINTED.                          K2402510
                    *                                                   K2402520
                    PHEAD BSC  L  PTEX1                                 K2402530
                    *                                                   K2402540
                    *                                                   K2402550
                    *             INSERT PARAMETERS FOR CONVERTING      K2402560
                    *             OF FLOATING POINT CONST TO            K2402570
                    *             E-TYPE, EBC-CODE                      K2402580
                    *                                                   K2402590
                          LD    3 RVARF-Z  INSERT VARIABLE FORMAT       K2402600
                          AND   3 1        MASK OUT ALL BUT BIT 15      K2402610
                          STO  L  PREC     SAVE PRECISION               K2402620
                          BSC  L  L4022,E  BR IF EXTENDED PRECISION     K2402630
                    *                                                   K2402640
                    *             INSERT NORMAL PREC CONSTANT           K2402650
                    *             FROM SYMBOL TABLE                     K2402660
                    *                                                   K2402670
                          LD    1 1        GET 1/2 OF CON FR SYM TBL    K2402680
                          STO  L  CONVT-3  SAVE IN CONVERT BUFFER       K2402690
                          LD    1 2        GET 2ND PART OF CONSTANT     K2402700
                          SRT     8        SHIFT OFF BITS 8-15          K2402710
                          SLA     8        SHIFT BITS 0-7 BACK          K2402720
                          STO  L  CONVT-2  SAVE IN CONVERT BUFFER       K2402730
                          SLT     8        SHIFT BITS 8-15 BACK TO ACC  K2402740
                          STO  L  BIN      SAVE BINARY POINT            K2402750
                          MDX     L4024    BR TO CONTINUE               K2402760
                    *                                                   K2402770
                    *             INSERT EXTENDED PRECISION CONSTANT    K2402780
                    *             FROM SYMBOL TABLE                     K2402790
                    *                                                   K2402800
                    L4022 LD    1 0        GET SYM TBL ID WORD          K2402810
                          SLA     8        SHIFT OFF BITS 0-7           K2402820
                          SRA     8        RIGHT JUSTIFY REMAINDER      K2402830
                          STO  L  BIN      SAVE IN BINARY POINT         K2402840
                          LD    1 1        GET 1/2 OF CON FR SYM TBL    K2402850
                          STO  L  CONVT-3  SAVE IN CONVERT BUFFER       K2402860
                          LD    1 2        GET 2ND PART OF CONSTANT     K2402870
                          STO  L  CONVT-2  SAVE IN CONVERT BUFFER       K2402880
                    *                                                   K2402890
                    *             INSERT OTHER PARAMETERS FOR CONVERT   K2402900
                    L4024 LDX   2 6        NUMBER OF DIGITS AFTER DECML K2402910
                          STX  L2 DD       *POINT (6 OR 9)              K2402920
                    L4025 LDX   2 13       FIELD WIDTH                  K2402930
                          STX  L2 WW       *(13 OR 17)                  K2402940
                          LD    3 1        GET A CONSTANT = 1           K2402950
                          STO  L  FRMAI    SET FLT PT INDICATOR         K2402960
                          SLA     16       CLEAR ACC                    K2402970
                          STO  L  FORTP    SET DATA TYPE O/P = E TYPE   K2402980
                          BSI  L  BINRY    BR TO CONVERT DATA TO DECML  K2402990
                          LD    3 H7E00-Z  LOAD AN EQUAL SIGN           K2403000
                          BSI   3 TOPAU-Z  BR TO PUT OUT EQUAL          K2403010
                    *                                                   K2403020
                    *             CONVERT ADDRESS                       K2403030
                    *             AND MOVE TO PRINTAREA                 K2403040
                    *                                                   K2403050
                          BSI   3 ATPA-Z   BR TO CONVERT AND MOVE SUBR  K2403060
                          BSI   3 TOPAB-Z  BR TO PUT OUT EXTRA BLANK    K2403070
                    *                                                   K2403080
                          LD    3 CLOC-Z   LOAD CONSTANT LOCATION       K2403090
                          A     3 RVARF-Z  INCR BY REAL VAR FMT BITS    K2403100
                          STO   3 CLOC-Z   SAVE BACK IN CONSTANT LOC    K2403110
                    *                                                   K2403120
                    *             INCREMENT PRINT AREA POINTER          K2403130
                    *             AND TEST IF LINE IS FULL              K2403140
                    *                                                   K2403150
                    CKEND LD    3 PAP-Z    LD PRINT AREA POINTER        K2403160
                          S     3 LNEND-Z  SUBTRACT END OF LINE         K2403170
                          BSC  L  L4032,+Z BR IF LINE NOT FULL          K2403180
                          BSI   3 PRINN-Z  PRINT A LINE                 K2403190
                          LD   I  $CH12    TEST CHANNEL 12 SWITCH       K2403200
                          BSI  I  NEWPG,Z  PAGE EJECT IF NON-ZERO       K2403210
                          MDX     L4032    BR TO CONTINUE               K2403220
                    *                                                   K2403230
                    **************************************************  K2403240
                    HTES  DC      *-*      HEADER TEST SWITCH           K2403250
                    *                                                   K2403260
                    L4031 LD    3 STPS-Z   LD SYMBOL TABLE PASS SWITCH  K2403270
                          BSC  L  L4032,+- BR IF SWITCH ZERO            K2403280
                          LD      HTES     LD HEADER TEST SWITCH        K2403290
                          BSC  L  INTC,Z   BR IF NON-ZERO               K2403300
                          BSI   3 BLKPA-Z  BLANK OUT PRINT AREA         K2403310
                          BSI   3 PRINN-Z  PRINT BLANK LINE             K2403320
                          LD   I  $CH12    TEST FOR CHANNEL 12 SW ON    K2403330
                          BSI  I  NEWPG,Z  IF PAGE END, RESTORE PAGE    K2403340
                          LD    3 TEX2A-Z  GET ADDR .INTEGER CONSTANTS. K2403350
                          BSI   3 PTEXT-Z  BR TO MOVE TEXT TO PR AREA   K2403360
                          MDX  L  HTES,1   SET HEADER TEST SW NON-ZERO  K2403370
                          BSI   3 PRINN-Z  PRINT HEADER                 K2403380
                    INTC  BSI   3 INTLS-Z  BR TO CONVERT INTEGER CONS   K2403390
                          LD    1 1        GET WORD FROM SYMBOL TABLE   K2403400
                          STO  L  CONVT-3  SAVE IN CONVERSION AREA      K2403410
                          EOR   3 H8000-Z  REMOVE BIT 0                 K2403420
                          BSC  L  INTD,Z   BR IF WD NOT ZERO            K2403430
                          LD    3 H8000-Z  LOAD BIT 0 = 1               K2403440
                          SRT     1        PUT 1'S IN BITS 0 AND 1      K2403450
                          MDX  L  BIN,1    INCREMENT BINARY POINTER     K2403460
                          STO   3 CONVT-3-Z SAVE CONVERT WORD           K2403470
                    INTD  BSI  L  BINRY    BR TO CONVERT DATA TO DECIML K2403480
                          LD    3 H7E00-Z  LD = SIGN                    K2403490
                          BSI   3 TOPAU-Z  BR TO PUT IN PRINT BUFFER    K2403500
                          BSI   3 ATPA-Z   MOVE ADDR OF CON TO PR AREA  K2403510
                          MDX  L  CLOC,1   INCR CONSTANT LOCATION       K2403520
                          MDX     CKEND    BR TO TEST IF PR LINE FULL   K2403530
                    *                                                   K2403540
                    *             GET NEXT CONSTANT.                    K2403550
                    *             MOVE SYMBOL TABLE POINTER             K2403560
                    *                                                   K2403570
                    L4032 BSI     MSTP     MOVE SYMBOL TABLE POINTER    K2403580
                          BSC  L  L4013    BR TO TEST FOR SYM TBL END   K2403590
                    *                                                   K2403600
                    *             END OF SYMBOL TABLE ENCOUNTERED       K2403610
                    *                                                   K2403620
                    L4033 LD    3 PAP-Z    GET PRINT AREA POINTER       K2403630
                          S     3 PAPIN-Z  SUBTRACT INITIAL VAL PR AREA K2403640
                          BSI  L  PRINN,Z  PR LN IF DIFFERENCE GT ZERO  K2403650
                          LD   I  $CH12    TEST FOR END OF PAGE         K2403660
                          BSI  I  NEWPG,Z  IF END OF PAGE, RESTORE PAGE K2403670
                    *                                                   K2403680
                    *             IF SYMBOL TABLE PASS SW IS NONZERO    K2403690
                    *             GO TO LISTING OF CORE REQUIREMENTS    K2403700
                    *                                                   K2403710
                          LD    3 STPS-Z   LD SYM TBL PASS SWITCH       K2403720
                          BSC  L  COREQ,Z  BR IF NONZERO                K2403730
                    *                                                   K2403740
                    *                                                   K2403750
                          LD    3 1        SET SYM TBL PASS SWITCH      K2403760
                          STO   3 STPS-Z   *TO NONZERO                  K2403770
                    *                                                   K2403780
                          BSC  L  L401X    GO TO SECOND PASS OF         K2403790
                    *                      SYM TBL (FOR LISTING OF      K2403800
                    *                      *INTEGER CONSTANTS)          K2403810
                    *                                                   K2403820
                    *             LIST CORE REQUIREMENTS                K2403830
                    *                                                   K2403840
                    COREQ BSI   3 BLKPA-Z  BLANK PRINT AREA             K2403850
                          BSI   3 PRINN-Z  PRINT BLANK LINE             K2403860
                          LD    3 CORA-Z   GET ADDR .CORE REQUIREMENTS. K2403870
                          BSI   3 PTEXT-Z  BR TO MOVE TEXT TO PR AREA   K2403880
                          LDX  L1 FNAME-1  LD PROGRAM NAME POINTER      K2403890
                          LD    1 1        LD WD1 OF PROG NAME          K2403900
                          BSI   3 TOPA-Z   CONVERT CHAR 1-MOVE TO PRINT K2403910
                          LD    1 1        LD WD1 OF PROG NAME          K2403920
                          SLA     6        SHIFT TO POSITION            K2403930
                          BSI   3 TOPA-Z   CONVERT CHAR 2-MOVE TO PRINT K2403940
                          LD    1 2        LD WD2 OF PROG NAME          K2403950
                          RTE     16       SHIFT TO EXTENSION           K2403960
                          LD    1 1        LOAD WD1 OF PROG NAME        K2403970
                          SLT     12       SHIFT ACC AND EXTENSION      K2403980
                          BSI   3 TOPA-Z   CONVERT CHAR 3-MOVE TO PRINT K2403990
                          LD    1 2        LOAD WD2 OF PROG NAME        K2404000
                          SLA     2        SHIFT TO POSITION            K2404010
                          BSI   3 TOPA-Z   CONVERT CHAR 4-MOVE TO PRINT K2404020
                          LD    1 2        LOAD WD2 OF PROG NAME        K2404030
                          SLA     8        SHIFT TO POSITION            K2404040
                          BSI   3 TOPA-Z   CONVERT CHAR 5-MOVE TO PRINT K2404050
                          BSI   3 PRINN-Z  PRINT A LINE                 K2404060
                    *                                                   K2404070
                    *             COMMON SIZE TO PRINT AREA             K2404080
                          LD    3 COMA-Z   GET ADDR .COMMON.            K2404090
                          BSI   3 PTEXT-Z  BR TO MOVE TEXT TO PR AREA   K2404100
                          BSI   3 INTLS-Z  INITLZ INTEGER CON CONVERT   K2404110
                          LD   L  CSIZE    GET SIZE OF COMMON           K2404120
                          STO  L  CONVT-3  SAVE IN CONVERSION AREA      K2404130
                          BSI  L  PTCH1     GO CONVERT NUMBER       2-2 K2404140
                    *                                                   K2404150
                    *             SIZE OF WORK AREA TO PRINT AREA       K2404160
                          LD    3 VARA-Z   GET ADDR .VARIABLES.         K2404170
                          BSI   3 PTEXT-Z  MOVE TEXT TO PRINT AREA      K2404180
                          BSI   3 INTLS-Z  INITLZ INTEGER CON CONVERT   K2404190
                          LD   L  SOFXT    GET SIZE OF WORK AREA        K2404200
                          STO  L  CONVT-3  SAVE IN CONVERT WORD         K2404210
                          BSI  L  PTCH1     GO CONVERT NUMBER       2-2 K2404220
                    *                                                   K2404230
                    *             CONSTANTS AND PROGRAM AREA SIZE       K2404240
                    *             TO PRINT AREA                         K2404250
                    *                                                   K2404260
                          LD    3 PROA-Z   GET ADDR .PROGRAM.           K2404270
                          BSI   3 PTEXT-Z  MOVE TEXT TO PRINT AREA      K2404280
                          BSI   3 INTLS-Z  INITLZ INTEGER CON CONVERT   K2404290
                          LD   L  SOFNS    COMPUTE LENGTH OF PROGRAM    K2404300
                    *                      AREA                         K2404310
                          S    L  SOFXT    SUBTRACT SIZE OF WORK AREA   K2404320
                          STO  L  SOFNS    SAVE LENGTH OF PROGRAM AREA  K2404330
                          STO  L  CONVT-3  SAVE IN CONVERSION AREA      K2404340
                          BSI  L  PTCH1     GO CONVERT NUMBER       2-2 K2404350
                          BSI   3 PRINN-Z  PRINT OUTPUT                 K2404360
                    *                                                   K2404370
                    *             CHECK FOR CORE SIZE ERRORS            K2404380
                    *                                                   K2404390
                          SLA     16                                    K2404400
                          STO     MSTP     CLEAR TEMPORARY ACCUMULATOR  K2404410
                    *                                                   K2404420
                          LD   L  CSIZE    CHECK COMMON AREA SIZE       K2404430
                          BSI     CS000                                 K2404440
                    *                                                   K2404450
                          LD   L  SOFXT    CHECK VARIABLE AREA SIZE     K2404460
                          BSI     CS000                                 K2404470
                    *                                                   K2404480
                          LD   L  SOFNS    CHECK PROGRAM AREA SIZE      K2404490
                          BSI     CS000                                 K2404500
                    *                                                   K2404510
                          BSC  L  EXIT     EXIT                         K2404520
                    *                                                   K2404530
                    *                                                   K2404540
                    CS000 DC      *-*      LINK                         K2404550
                    *                                                   K2404560
                          BSC  L  CS050,+Z ERROR IF SIZE NEGATIVE       K2404570
                    *                                                   K2404580
                          A       MSTP                                  K2404590
                          STO     MSTP                                  K2404600
                          BSC  L  CS050,+Z BRANCH IF OVERFLOW           K2404610
                    *                                                   K2404620
                    CS010 BSC  I  CS000    RETURN                       K2404630
                    *                                                   K2404640
                    *             INDICATE SIZE ERROR                   K2404650
                    *                                                   K2404660
                    CS050 MDX  L  ERROR,8    INDICATE ERROR         2-4 K2404670
                          MDX     CS010    RETURN                       K2404700
                    *                                                   K2404710
                    *                                                   K2404720
                    *                                                   K2404730
                    *             SUBR. MOVE SYMBOL TABLE POINTER       K2404740
                    MSTP  DC      0        LINK                         K2404750
                          LD    1 0        GET SYM TBL ID WORD          K2404760
                          AND   3 MASK3-Z  TEST FOR DIMENSION           K2404770
                          BSC     Z        SKIP IF NOT DIMENSIONED      K2404780
                          LD    3 CM3-Z    LD MINUS 3 IF DIMENSIONED    K2404790
                          S     3 3        DECR BY 3                    K2404800
                          A     3 STP-Z    DECR SYM TBL PT BY 3 OR 6    K2404810
                          STO   3 STP-Z    SAVE SYM TBL POINTER         K2404820
                          LDX  I1 STP      PUT SYM TBL PT IN XR1        K2404830
                          BSC  I  MSTP     RETURN                       K2404840
                    *                                                   K2404850
                    *             MOVE ADDRESS TO PAREA                 K2404860
                    ATPA  DC      *-*      LINK ENTRY POINT             K2404870
                          LD    3 ORGSW-Z    IS IT ABSOLUTE         2-4 K2404871
                          BSC  L  ATPA1,+-   NO  - BRANCH           2-4 K2404872
                          LD    3 CLOC-Z     YES - RELOCATE         2-4 K2404873
                          A    L  ORG        THE                    2-4 K2404874
                          BSC  L  ATPA2,-    BRANCH IF POSITIVE     2-4 K2404876
                          MDX  L  ERROR,64   SET UP ERROR 86        2-4 K2404877
                          BSC  L  EXIT       EXIT                   2-4 K2404878
                    *                                                   K2404879
                    ATPA1 LD    3 CLOC-Z   GET HEX LOC OF CURRENT CON   K2404880
                    ATPA2 SRT     12       SHIFT OFF LOWER 3 HEX CHARS  K2404890
                          BSI     TOPAH    BR TO PUT HEX CHAR PR AREA   K2404900
                          SLT     4        SHIFT NXT CHAR FR EXTENSION  K2404910
                          BSI     TOPAH    BR TO PUT HEX CHAR PR AREA   K2404920
                          SLT     4        SHIFT NXT CHAR FR EXTENSION  K2404930
                          BSI     TOPAH    BR TO PUT HEX CHAR PR AREA   K2404940
                          SLT     4        SHIFT LAST CHAR FR EXTENSION K2404950
                          BSI     TOPAH    BR TO PUT HEX CHAR PR AREA   K2404960
                          BSI     TOPAB    PUT BLANK IN PRINT AREA      K2404970
                          BSC  I  ATPA     RETURN                       K2404980
                    *                                                   K2404990
                    *             SET UP CONVERSION ROUTINE FOR         K2405000
                    *                  INTEGER CONSTANTS.               K2405010
                    *                                                   K2405020
                    INTLS DC      *-*      ENTRY POINT                  K2405030
                          LDX   2 6        SET FIELD WIDTH              K2405040
                          STX  L2 WW       *TO 6                        K2405050
                          SLA     16       CLEAR 2ND WD OF CONVERSION   K2405060
                          STO  L  CONVT-2  *AREA                        K2405070
                          STO  L  FRMAI    SET INTEGER CONVERSION CODE  K2405080
                          LD    3 D143-Z   SET BINARY DECIMAL POINT     K2405090
                          STO  L  BIN      *FOR INCREMENTING            K2405100
                          LDX   2 2        SET DATA TYPE TO             K2405110
                          STX  L2 FORTP    *I FORMAT                    K2405120
                          BSC  I  INTLS    RETURN                       K2405130
                    *                                                   K2405140
                    *             PUT TEXT IN PRINT AREA.               K2405150
                    *             ADDRESS OF TEXT IN A-REG ON ENTRY     K2405160
                    *                                                   K2405170
                    PTEXT DC      0        ENTRY POINT                  K2405180
                          STO     HTES1+1  SAVE ADDR OF TEXT            K2405190
                    HTES1 LDX  I2 *-*      PUT WD COUNT IN XR2          K2405200
                          SLT     16       CLEAR ACC                    K2405210
                          LDX  I3 PAP      PUT PR AREA POINTER XR3      K2405220
                    LOOPP MDX  L  HTES1+1,1 INCR ADDR POINTER           K2405230
                          LD   I  HTES1+1  LD PACKED CHARACTER          K2405240
                          SRT     8        SHIFT RIGHT CHAR EXTENSION   K2405250
                          SLA     8        SHIFT LEFT TO PRINT POSITION K2405260
                          STO   3 0        SAVE IN PRINT LINE           K2405270
                          SLT     16       SHIFT RIGHT CHAR TO POSITION K2405280
                          STO   3 1        SAVE IN PRINT LINE           K2405290
                          MDX   3 2        INCR PRINT LINE POINTER      K2405300
                          MDX   2 -1       DECR WORD COUNT              K2405310
                          MDX     LOOPP    LOOP IF COUNT NOT FINISHED   K2405320
                          STX   3 PAP      SAVE NEW PRINT AREA POINTER  K2405330
                          LDX  L3 Z        RESET XR3 FOR CONSTANTS      K2405340
                    HTES3 BSC  I  PTEXT    RETURN                       K2405350
                    *                                                   K2405360
                    *                                                   K2405370
                    *             SUBROUTINE                            K2405380
                    *             MOVE CHAR IN ACC TO PR AREA UNCHANGED K2405390
                    *                                                   K2405400
                    TOPAU DC      0        LINK                         K2405410
                          STO     STOCH    SAVE CHAR TO BE PRINTED      K2405420
                    TOPAX LD      STOCH    LD CHAR TO BE PRINTED        K2405430
                          STO  I  PAP      SAVE IN PRINT AREA           K2405440
                          MDX  L  PAP,1    MOVE PRINT AREA POINTER      K2405450
                          BSC  I  TOPAU    RETURN                       K2405460
                    *                                                   K2405470
                    STOCH DC      *-*      CHARACTER TO BE PRINTED      K2405480
                    H000F DC      /000F    CONSTANT                     K2405490
                    H000A DC      /000A    CONSTANT                     K2405500
                    H0039 DC      /0039    CONSTANT                     K2405510
                    *                                                   K2405520
                    *             SUBROUTINE                            K2405530
                    *             CONVERT CHAR IN ACC INTO              K2405540
                    *             EBC-CODE, THEN MOVE TO PRINT AREA     K2405550
                    *                                                   K2405560
                    TOPA  DC      0        LINK                         K2405570
                          AND   3 H3F00-Z  MASK BITS 2-7                K2405580
                          BSC  L  TOPA2,+- BR IF BLANK                  K2405590
                    *                                                   K2405600
                    *             NOTE                                  K2405610
                    *             IF OTHER SPECIAL CHARACTERS THAN      K2405620
                    *             BLANK ARE EXPECTED, TESTING SHOULD    K2405630
                    *             BE HERE                               K2405640
                          OR      HC000    ADD FIRST 2 BITS ALPHA-NOS   K2405650
                    TOPA1 STO     STOCH    SAVE IN CHAR STORAGE WD      K2405660
                          LD      TOPA     MOVE LINK                    K2405670
                          STO     TOPAU    *TO OUTPUT                   K2405680
                          MDX     TOPAX    BR TO PRINT CHAR IN EBC      K2405690
                    TOPA2 LD    3 H4000-Z  LOAD EBC BLANK               K2405700
                          MDX     TOPA1    BR TO PUT IN BUFFER          K2405710
                    *                                                   K2405720
                    *                                                   K2405730
                    *             SUBROUTINE                            K2405740
                    *             MOVE HEX CHAR TO PRINT AREA           K2405750
                    *                                                   K2405760
                    TOPAH DC      0        LINK                         K2405770
                          AND     H000F    SAVE ONLY BITS 12-15         K2405780
                          S       H000A    TEST FOR CON LT A            K2405790
                          BSC     Z+       SKIP IF GT 9                 K2405800
                          A       H0039    RESTORE CON & EBC BITS       K2405810
                          A     3 1        ADD 1                        K2405820
                          SLA     8        SHIFT TO EBC FORMAT          K2405830
                          BSI     TOPA     CONVERT AND MOVE             K2405840
                          BSC  I  TOPAH    RETURN                       K2405850
                    *                                                   K2405860
                    *             PUT ONE BLANK IN PRINT AREA           K2405870
                    TOPAB DC      0        ENTRY POINT                  K2405880
                          SLA     16       CLEAR ACC                    K2405890
                          BSI     TOPA     PUT OUT BLANK                K2405900
                          BSC  I  TOPAB    RETURN                       K2405910
                    *                                                   K2405920
                    *             SUBROUTINE                            K2405930
                    *             BLANK TO PRINT AREA                   K2405940
                    *                                                   K2405950
                    BLKPA DC      0        LINK                         K2405960
                          LD    3 H4000-Z  PUT EBC BLANK ACC            K2405970
                          LDX  L3 121      LD BFR SIZE IN XR3           K2405980
                    BLKP1 STO  L3 PAREA-1  SAVE BLANK IN PR AREA        K2405990
                          MDX   3 -1       DECR BUFFER COUNT            K2406000
                          MDX     BLKP1    CONTINUE IF CNT NOT 0        K2406010
                          LDX  L3 Z        RESET XR3 WITH CON ADDR      K2406020
                          BSC  I  BLKPA    RETURN                       K2406030
                    *                                                   K2406040
                    *             CONSTANTS AREA                        K2406050
                    *             NOTE--GREAT CARE SHOULD BE USED       K2406060
                    *             IN CHANGING CONSTANTS AROUND AS SOME  K2406070
                    *             OF THE LOCATIONS ARE REFERENCED RLTV  K2406080
                    *             TO THE START OD THE AREA.             K2406090
                    *             XR3 IS LOADED WITH THE ADDRESS OF Z   K2406100
                    *             FOR REFERENCE TO THE CONSTANTS        K2406110
                    *                                                   K2406120
                    Z     DC      0        CONSTANT0                    K2406130
                          DC      1        CONSTANT ONE                 K2406140
                          DC      2        CONSTANT TWO                 K2406150
                          DC      3        CONSTANT THREE               K2406160
                          DC      4        CONSTANT FOUR                K2406170
                    PAPIN DC      PAREA    INITIAL VALUE OF PAP         K2406180
                    PAP   DC      PAREA    PRINT AREA POINTER           K2406190
                    INCR  DC      20       INCREMENT OF PRINT AREA      K2406200
                    *                      (IS CHANGED INTO 24 WHEN     K2406210
                    *                      EXTENDED PRECISION)          K2406220
                    HC000 DC      /C000    CONSTANT MASK                K2406230
                    RVARF DC      /0002    REAL VARIABLE FORMAT         K2406240
                    STPS  DC      0        SYMBOL TABLE PASS SWITCH     K2406250
                    CLOC  DC      0        LOCATION OF CURRENT CONSTANT K2406260
                    STP   DC      0        SYMBOL TABLE POINTER         K2406270
                    MASK3 DC      /1800    CONSTANT MASK                K2406280
                    CM3   DC      /FFFD    CONSTANT = MINUS 3           K2406290
                    H7E00 DC      /7E00    EQUAL SIGN                   K2406300
                    LNEND DC      PAREA+120 LINE END CONSTANT           K2406310
                    D143  DC      143      CONSTANT                     K2406320
                    H3F00 DC      /3F00    CONSTANT MASK                K2406330
                    H4000 DC      /4000    CONSTANT MASK                K2406340
                    TEX2A DC      TEXT2    ADDR OF MSG TO PRINT         K2406350
                    CORA  DC      CORTX    ADDR OF MSG TO PRINT         K2406360
                    COMA  DC      COMTX    ADDR OF MSG TO PRINT         K2406370
                    VARA  DC      VARTX    ADDR OF MSG TO PRINT         K2406380
                    PROA  DC      PROTX    ADDR OF MSG TO PRINT         K2406390
                    D60   DC      60       CONSTANT                     K2406400
                    ORGSW DC      0          ORIGIN SWITCH          2-4 K2406405
                    *                                                   K2406410
                    *             SUBROUTINE                            K2406420
                    *             SET UP TO PRINT A LINE AND GO PRINT   K2406430
                    *             *THE LINE                             K2406440
                    *                                                   K2406450
                    PRINN DC      *-*      ENTRY POINT                  K2406460
                          LD    3 PAPIN-Z  GET INT VALUE OF PAP         K2406470
                          STO   3 PAP-Z    RESET PAP                    K2406480
                          STO  L  AREA     SAVE PRINT AREA              K2406490
                          LD    3 D60-Z    SET WORD COUNT               K2406500
                          STO  L  WDCNT    *=60                         K2406510
                          BSI  L  PRINT    BR TO PRINT A LINE           K2406520
                          BSI   3 BLKPA-Z  CLEAR PRINT AREA             K2406530
                          BSC  I  PRINN    RETURN                       K2406540
                    *                                                   K2406550
                    *                                                   K2406560
                    C128  DC      128      CONSTANT                     K2406570
                    MONE  DC      -1       CONSTANT                     K2406580
                    TEN   DC      10       CONSTANT                     K2406590
                    H00C5 DC      /00C5    CONSTANT MASK                K2406600
                    MULT  DC      *-*      RETURN ADDRESS               K2406610
                          BSC  L  MULT1    GO TO MULTIPLY SUBROUTINE    K2406620
                    NORM  DC      *-*      RETURN ADDRESS               K2406630
                          BSC  L  NORM1    GO TO NORMALIZE ROUTINE      K2406640
                    FIVE  DC      5        CONSTANT                     K2406650
                    H8000 DC      /8000    CONSTANT MASK                K2406660
                    MINUS DC      /0060    EBC MINUS RIGHT JUSTIFIED    K2406670
                    BLANK DC      /0040    EBC BLANK RIGHT JUSTIFIED    K2406680
                    SIX   DC      6        CONSTANT                     K2406690
                    *                                                   K2406700
                    *             DATA STORAGE AREA FOR BINARY-DECIMAL  K2406710
                    *             CONVERSION SUBROUTINE                 K2406720
                    *                                                   K2406730
                    CHAR  DC      0        CHARACTER STORAGE            K2406740
                    FRMAI DC      0        INTEGER OR DECML FLAG        K2406750
                    FORTP DC      0        TYPE OF DATA TO BE OUTPUT    K2406760
                    LKTYP DC      0        TEMPORARY STORAGE AREA       K2406770
                    X     EQU     CHAR     REFERENCE PT FOR DATA AREA   K2406780
                          BSS  E  0                                     K2406790
                    TWO   DC      2        CONSTANT          (EVEN LOC) K2406800
                    ONE   DC      1        CONSTANT          (ODD  LOC) K2406810
                    H004B DC      /004B    CONSTANT          (EVEN LOC) K2406820
                    H00F0 DC      /00F0    CONSTANT          (ODD  LOC) K2406830
                    JCON  DC      0        CHAR STO MULTIPLY (EVEN LOC) K2406840
                          DC      0        *SUBROUTINE       (ODD  LOC) K2406850
                    BB    DC      0        EBC REPRESENTATION(EVEN LOC) K2406860
                          DC      0        *OF EXPONENT      (ODD  LOC) K2406870
                    EENCT DC      0        EXPONENT SIGN     (EVEN LOC) K2406880
                          DC      0        FIVE              (ODD  LOC) K2406890
                          DC      0        *WORD             (EVEN LOC) K2406900
                          DC      0        *CONVERSION       (ODD  LOC) K2406910
                          DC      0        *AREA             (EVEN LOC) K2406920
                    CONVT DC      0        *                 (ODD  LOC) K2406930
                    SIGN  DC      0        SIGN COUNT        (EVEN LOC) K2406940
                    DIVCT DC      0        DIVIDE COUNT      (ODD  LOC) K2406950
                    MANSN DC      0        MANTISSA SIGN     (EVEN LOC) K2406960
                    TEMP  DC      0        TEMPORARY STORAGE (ODD  LOC) K2406970
                    WW    DC      0        FIELD WIDTH       (EVEN LOC) K2406980
                    DD    DC      0        DECIMAL COUNT     (ODD  LOC) K2406990
                    PREC  DC      0        PRECISION         (EVEN LOC) K2407000
                    BIN   DC      0        BINARY POINT CNT  (ODD  LOC) K2407010
                    *                                                   K2407020
                    *             SUBROUTINE                            K2407030
                    *             MULTIPLY 5 CONVERSION CHARACTERS BY   K2407040
                    *             10                                    K2407050
                    *                                                   K2407060
                    MULT1 STO   2 JCON+1-X STORE CHARACTER              K2407070
                          LDX   1 5        SET UP INDEX LOOP FOR 5      K2407080
                    MULT3 LD   L1 EENCT    GET WDS TO CONVERT           K2407090
                          M     2 TEN-X    MULTIPLY BY 10               K2407100
                          BSC     +Z       SKIP IF RESULT NOT -         K2407110
                          A     2 TEN-X    ADD 10 TO RESULT             K2407120
                          AD    2 JCON-X   ADD PRESENT CHARACTER        K2407130
                          STO   2 JCON+1-X STORE MOST SIGNIFICANT BIT   K2407140
                          SLT     16       SHIFT LEAST SIGNIFICANT TO   K2407150
                          STO  L1 EENCT    *ACC AND SAVE                K2407160
                          MDX   1 -1       DECR WD CNT BY 1             K2407170
                          MDX     MULT3    LOOP UNLESS CNT EXHAUSTED    K2407180
                          BSC  I  MULT     RETURN TO CALLER             K2407190
                    *                                                   K2407200
                    *             NORMALIZATION SUBROUTINE              K2407210
                    *                                                   K2407220
                    NORM1 LD    2 CONVT-4-X IS LEFTMOST WORD OF NO. = 0 K2407230
                          BSC  L  NORMT,+- YES, GO CHECK FURTHER        K2407240
                          BSI     NORRT    NO, GO NORMALIZE RIGHT       K2407250
                          MDX     NORM1    BRANCH BACK TO CHECK NORM    K2407260
                    NORMT LD    2 CONVT-3-X IS 2ND WORD FROM LEFT NEG.  K2407270
                          BSC  I  NORM,+Z  YES, RETURN TO CALLING PROG  K2407280
                          BSI     NORLT    NO, GO TO NORM LEFT          K2407290
                          MDX     NORM1    BRANCH BACK TO CHECK NORM    K2407300
                    *                                                   K2407310
                    *             NORMALIZE LEFT SUBROUTINE             K2407320
                    *                                                   K2407330
                    NORLT DC      *-*      NORMALIZE LEFT               K2407340
                          SLT     32       SHIFT                        K2407350
                          LDX   1 5        *ANSWER                      K2407360
                    NORM7 LD   L1 EENCT    *LEFT                        K2407370
                          RTE     31       *ONE                         K2407380
                          STO  L1 EENCT    *BIT                         K2407390
                          SLT     15       THIS MEANS ALL 5             K2407400
                          MDX   1 -1       *WORDS OF                    K2407410
                          MDX     NORM7    *CONVERSION AREA             K2407420
                          LD    2 BIN-X    DECR BINARY                  K2407430
                          S     2 ONE-X    *POINT COUNTER               K2407440
                          STO   2 BIN-X    *BY 1                        K2407450
                          BSC  I  NORLT    RETURN                       K2407460
                    *                                                   K2407470
                    *             NORMALIZE RIGHT SUBROUTINE            K2407480
                    *                                                   K2407490
                    NORRT DC      *-*      NORMALIZE RIGHT ENTRY        K2407500
                    NORM4 LDX   1 -5       SHIFT                        K2407510
                          SLT     32       *ALL                         K2407520
                          LD   L1 SIGN     *FIVE                        K2407530
                          RTE     1        *WORDS                       K2407540
                          STO  L1 SIGN     *OF CONVERSION               K2407550
                          RTE     15       *AREA                        K2407560
                          MDX   1 1        *RIGHT                       K2407570
                          MDX     NORM4+2  *ONE BIT                     K2407580
                          LD    2 BIN-X    INCR BINARY POIN             K2407590
                          A     2 ONE-X    *COUNTER                     K2407600
                          STO   2 BIN-X    *BY ONE                      K2407610
                          BSC  I  NORRT    RETURN                       K2407620
                    *                                                   K2407630
                    *                DIVIDE 5 WORD ANSWER BY 10         K2407640
                    *                                                   K2407650
                    DIVID DC      *-*      ENTRY POINT                  K2407660
                          LDX   1 -4       LOAD INDEX FOR FOUR DIVIDES  K2407670
                          SLT     32       CLEAR ACC AND EXTENSION      K2407680
                    DIV1  LD    2 ONE-X    LD CONSTANT ONE              K2407690
                          STO   2 LKTYP-X  SAVE LKTYP                   K2407700
                          LD   L1 SIGN     LD NO.TO BE DIVIDED          K2407710
                          RTE     16       EXCHANGE ACC AND EXTENSION   K2407720
                          S     2 FIVE-X   SUBTRACT 5 FOR ROUNDING      K2407730
                          BSC  L  *+2,+Z   BR IF NEGATIVE               K2407740
                          MDX  L  LKTYP,-2 SET LKTYP = -1 AND SKIP      K2407750
                          A     2 FIVE-X   RESTORE 5 PREVIOUSLY DELETED K2407760
                          D     2 TEN-X    DIVIDE BY 10                 K2407770
                          MDX  L  LKTYP,-2 SET LKTYP =-1,SKIP OR-3,CONT K2407780
                          OR    2 H8000-X  MASK IN NEGATIVE SIGN        K2407790
                          STO  L1 SIGN     SAVE NO BACK IN AREA         K2407800
                          MDX   1 1        INCR AREA POINTER            K2407810
                          MDX     DIV1     BR IF LOOP NOT FINISHED      K2407820
                    RETZY BSC  I  DIVID    RETURN TO CALLING PROGRAM    K2407830
                    *                                                   K2407840
                    *             ENTRY POINT TO BINARY-DECIMAL         K2407850
                    *             CONVERSION SUBROUTINE                 K2407860
                    *                                                   K2407870
                    BINRY DC      *-*      ENTRY POINT                  K2407880
                          STX  L1 IR13+1   SAVE XR1                     K2407890
                          STX  L2 IR13+3   SAVE XR2                     K2407900
                          LDX  L2 X        GET CON AREA POINTER         K2407910
                          LDX  I1 FORTP    GET TYPE OF DATA TO BE O/P   K2407920
                          BSC  I1 *        BR TO CORRESPONDING PROG LOC K2407930
                          DC      BIN4     E TYPE FORMAT                K2407940
                          DC      BIN7     F TYPE FORMAT                K2407950
                          DC      BIN3     I TYPE FORMAT                K2407960
                    BIN14 LD    2 BIN-X    NORM BINARY PT TO 128        K2407970
                          S     2 C128-X   IS POINT GR 128              K2407980
                          BSC     +Z       SKIP IF YES                  K2407990
                          MDX     BIN17    NO,GO TO NORM RIGHT          K2408000
                          BSC  L  BIN19,+  BR IF BINARY PT = 128        K2408010
                          BSI     NORLT    BINARY PT GT 128, NORM LEFT  K2408020
                          MDX     BIN14    BR BACK TO CHECK BINARY PT   K2408030
                    BIN17 BSI     NORRT    BR TO NORMALIZE RIGHT        K2408040
                          MDX     BIN14    BR BACK TO CHECK BINARY PT   K2408050
                    *                                                   K2408060
                    *             E TYPE DATA OUTPUT                    K2408070
                    *                                                   K2408080
                    BIN4  LD    2 SIX-X    SET UP COUNT FOR 2 SIGNS     K2408090
                          MDX     BIN7+1   GO CHECK INPUT MODE          K2408100
                    *                                                   K2408110
                    *             I TYPE DATA OUTPUT                    K2408120
                    *                                                   K2408130
                    BIN3  LD    2 MONE-X   SET UP A FALSE DECIMAL       K2408140
                          STO   2 DD-X     *COUNT FOR                   K2408150
                    BIN7  LD    2 TWO-X    *COMMON CALCULATION FOR      K2408160
                          STO   2 TEMP-X   *AVAILABLE PR POSITIONS      K2408170
                    BIN5  LD    2 WW-X     LOAD FIELD WIDTH             K2408180
                          S     2 DD-X     *LESS DECIMAL COUNT          K2408190
                          S     2 TEMP-X   *LESS NO. SIGNS TO GET       K2408200
                          STO   2 TEMP-X   *NO. AVAIL PRINT POSITIONS   K2408210
                          SLT     32       CLEAR ACC AND EXTENSION      K2408220
                          STO   2 CONVT-4-X CLR 1ST WD CONVERSION AREA  K2408230
                          STD   2 CONVT-1-X CLR  4TH AND 5TH WORDS      K2408240
                          STO   2 DIVCT-X  CLEAR DIVIDE COUNT           K2408250
                          LD    2 BLANK-X  PUT BLANKS IN                K2408260
                          STO   2 EENCT-X  *EXPONENT AND                K2408270
                          STO   2 MANSN-X  *MANTISSA SIGNS              K2408280
                          LDX   1 2        SET XR1 TO NO. WDS TO CHK    K2408290
                    BIN52 LD   L1 EENCT+1  CHECK CONVERSION WD          K2408300
                          BSC     Z        SKIP IF ZERO                 K2408310
                          MDX     BIN51    BR OUT IF NOT                K2408320
                          MDX   1 -1       DECR WD COUNT                K2408330
                          MDX     BIN52    BR BACK IF MORE WDS TO CHECK K2408340
                          LDD   2 H00F0-X  LOOP FINISHED, PUT EBC 0     K2408350
                          STD   2 BB-X     *IN O/P EXPONENT             K2408360
                          LD    2 FORTP-X  CHECK FOR I TYPE FORMAT TO   K2408370
                          S     2 TWO-X    *OUTPUT ZEROS INSTEAD OF     K2408380
                          BSC     Z        *BLANKS FOR A REAL           K2408390
                          MDX     BIN19    *ZERO COMPUTATION            K2408400
                          LD    2 ONE-X    SET FLAG TO OUTPUT           K2408410
                          STO   2 DIVCT-X  *ZEROS                       K2408420
                          MDX     BIN19    BRANCH TO OUTPUT             K2408430
                    BIN51 LDD   2 CONVT-3-X LD MANTISSA (ACC EXTENSION) K2408440
                          BSC     -        SKIP IF NEGATIVE             K2408450
                          MDX     BIN9     BR TO NORMALIZE              K2408460
                          MDX  L  MANSN,32 SET MANTISSA SIGN NEGATIVE   K2408470
                          SLT     32       CLEAR ACC-EXTENSION TO GET   K2408480
                          SD    2 CONVT-3-X *ABSOLUTE VALUE OF MANTISSA K2408490
                    BIN9  SLT     1        SHIFT OUT SIGN BIT           K2408500
                          STD   2 CONVT-3-X SAVE ABS VALUE W/O SIGN     K2408510
                          LD    2 FRMAI-X  TEST FOR INTEGERS            K2408520
                          BSC  L  BIN13,+- BR IF INTEGERS               K2408530
                          LD    2 ONE-X    SET UP FOR ROUNDING,ACC=1    K2408540
                          MDX  L  PREC     IS PRECISION EXTENDED        K2408550
                          SRT     8        YES, SHIFT TOTAL OF 15       K2408560
                          SRT     7        NO, SHIFT 7                  K2408570
                          AD    2 CONVT-3-X ADD 2WDS TO BE CONVERTED    K2408580
                          BSC     C        TEST FOR OVERFLOW            K2408590
                          MDX     *+1      OVERFLOW,BRANCH OVER NXT WD  K2408600
                          MDX     IR11     NO OVERFLOW, BRANCH OUT      K2408610
                          SRT     1        SHIFT 1 MORE TO ROUND        K2408620
                          OR    2 H8000-X  PUT BIT IN SIGN POSITION     K2408630
                          STD   2 CONVT-3-X SAVE   CONVERSION WD        K2408640
                          LD    2 BIN-X    INCR BINARY                  K2408650
                          A     2 ONE-X    *POINT COUNTER               K2408660
                          STO   2 BIN-X    *BY 1                        K2408670
                          MDX     BIN13+1  BR PAST NXT 2 WDS            K2408680
                    IR11  STD   2 CONVT-3-X STORE IN CONVERSION         K2408690
                    BIN13 LD    2 BIN-X    IS BINARY PT GE 128          K2408700
                          S     2 C128-X   GREATER THAN 128             K2408710
                          BSC     +Z       SKIP IF GE 128               K2408720
                          MDX     BIN10    GO HANDLE                    K2408730
                          BSC  L  BIN11,+  BR IF = 128                  K2408740
                    BIN12 BSI     DIVID    GO DIVIDE ANSWER BY 10       K2408750
                          BSI   2 NORM-X   GO NORMALIZE ANSWER          K2408760
                          MDX  L  DIVCT,+1 INCR DIVIDE COUNT BY 1       K2408770
                          NOP                                           K2408780
                          LD    2 BIN-X    TEST IF BINARY PT LE 128     K2408790
                          S     2 C128-X   *AFTER DIVISION              K2408800
                          BSC     -Z       SKIP IF YES                  K2408810
                          MDX     BIN12    NO, DIVIDE AGAIN             K2408820
                    BIN11 LD    2 FORTP-X  TEST OUTPUT E TYPE           K2408830
                          BSC     Z        SKIP IF E TYPE               K2408840
                          MDX     BIN14    NOT E TYPE, BR TO NORM       K2408850
                          LD    2 DIVCT-X  TEST DIVIDE COUNT            K2408860
                          BSC  L  BIN16,-  IF POSITIVE OR ZERO, BR OUT  K2408870
                    BIN15 LD    2 MINUS-X  PUT NEGATIVE SIGN OUT FOR    K2408880
                          STO   2 EENCT-X  *EXPONENT SIGN               K2408890
                          SLA     16       CLEAR ACC                    K2408900
                          S     2 DIVCT-X  GET ABS VALUE OF DIVIDE CNT  K2408910
                    BIN16 RTE     16       PUT DIVIDE CNT IN EXTENSION  K2408920
                          SLA     16       CLEAR ACC                    K2408930
                          STO   2 DIVCT-X  CLEAR DIVIDE COUNT WORD      K2408940
                          D     2 TEN-X    DIVIDE DIVIDE CNT BY 10      K2408950
                          AD    2 H00F0-X  ADD EBC 0 TO CONVERT TO EBC  K2408960
                          STD   2 BB-X     SAVE EBC EXPONENT            K2408970
                          MDX     BIN14    BRANCH TO NORMALIZE          K2408980
                    BIN10 LD    2 FORTP-X  TEST FOR E TYPE OUTPUT       K2408990
                          BSC     Z        SKIP IF YES                  K2409000
                          MDX     BIN14    NO, GO HANDLE NEG F TYPE     K2409010
                          BSI   2 MULT-X   MULTIPLY ANSWER BY 10        K2409020
                          BSI   2 NORM-X   GO NORMALIZE ANSWER          K2409030
                          MDX  L  DIVCT,-1 DECR DIVIDE COUNT BY 1       K2409040
                          MDX     BIN13    GO CHECK BINARY POINT        K2409050
                          MDX     BIN13    *AGAIN AFTER MULTIPLYING     K2409060
                    *                                                   K2409070
                    *             SUBROUTINE                            K2409080
                    *             OUTPUT CHARACTER TO PRINT BUFFER      K2409090
                    *                                                   K2409100
                    CHARO DC      *-*      ENTRY POINT                  K2409110
                          SLA     8        SHIFT CHAR TO LEFT HALF OF   K2409120
                          STO  I  PAP      *WD AND STORE IN PRINT BFR   K2409130
                          MDX  L  PAP,1    INCR BUFFER POINTER          K2409140
                    CHAR3 BSC  I  CHARO    RETURN TO CALLING PROGRAM    K2409150
                    *                                                   K2409160
                    *             OUTPUT CONVERTED DECIMAL NUMBER       K2409170
                    *                                                   K2409180
                    BIN19 LD    2 TEMP-X   GET NO. AVAILABLE POSITIONS  K2409190
                          S     2 DIVCT-X  COMPARE WITH DIVIDE COUNT    K2409200
                          BSC     +        SKIP IF NO. POSITIONS BIGGER K2409210
                          MDX     BIN18    BR TO PUT OUT CHARACTERS     K2409220
                          STO   2 TEMP-X   STORE EXCESS NO. POSITIONS   K2409230
                    BIN20 LD    2 BLANK-X  PUT OUT NO. OF               K2409240
                          BSI     CHARO    *BLANK CHARACTERS EQUAL      K2409250
                          MDX  L  TEMP,-1  *TO EXCESS                   K2409260
                          MDX     BIN20    CONTINUE UNTIL LOOP DONE     K2409270
                    BIN18 LD    2 MANSN-X  LD MANTISSA SIGN             K2409280
                          BSI     CHARO    PUT IN PRINT BUFFER          K2409290
                          LD    2 FRMAI-X  CHECK FOR INTEGER            K2409300
                          BSC     Z        SKIP IF IT IS AN INTEGER     K2409310
                          MDX     *+2      ELSE,BRANCH AHEAD            K2409320
                          LD    2 MONE-X   SET LARGE VALUE IN LAST      K2409330
                          STO   2 CONVT-X  *WORD OF CONVERSION AREA     K2409340
                          LD    2 DIVCT-X  LD DIVIDE COUNT              K2409350
                          BSC     +        SKIP IF NOT = ZERO           K2409360
                          MDX     BIN23    GO HANDLE ZERO               K2409370
                    BIN28 SLA     16       CLEAR ACC                    K2409380
                          STO   2 CONVT-4-X CLEAR CONVERSION WORD 1     K2409390
                          BSI   2 MULT-X   MULTIPLY BY 10               K2409400
                          OR    2 H00F0-X  ADD EBC 0 TO CONVERT         K2409410
                          BSI     CHARO    *OVERFLOW, O/P CHAR          K2409420
                          MDX  L  DIVCT,-1 DECR DIVIDE COUNT BY 1       K2409430
                          MDX     BIN28    BR TO HANDLE MULTIPLY        K2409440
                    BIN23 LD    2 DD-X     TEST DECIMAL COUNT OF FMT    K2409450
                          BSC     +Z       SKIP IF 0 OR POSITIVE        K2409460
                          MDX     BIN25    IF NOT, BR TO HANDLE I TYPE  K2409470
                          LD    2 H004B-X  GET EBC DECIMAL POINT        K2409480
                          BSI     CHARO    MOVE TO PRINT BUFFER         K2409490
                          LD    2 DD-X     LD DECIMAL COUNT             K2409500
                          BSC     +        SKIP IF GT 0                 K2409510
                          MDX     BIN25    ZERO, BRANCH AHEAD           K2409520
                          STO   2 DIVCT-X  PUT NO. DECML DIGITS-DIVCT   K2409530
                          LD    2 MONE-X   PUT -1 IN                    K2409540
                          STO   2 DD-X     *NO. OF DECML DIGITS         K2409550
                          MDX     BIN28    GO PROCESS                   K2409560
                    BIN25 LD    2 FORTP-X  GET OUTPUT TYPE              K2409570
                          BSC     Z        SKIP IF R TYPE               K2409580
                          MDX     IR13     GO RETURN TO CALLER          K2409590
                          LD    2 H00C5-X  LOAD EBC E                   K2409600
                          BSI     CHARO    PUT IN PRINT BUFFER          K2409610
                          LD    2 EENCT-X  LOAD EXPONENT SIGN           K2409620
                          BSI     CHARO    PUT IN PRINT BUFFER          K2409630
                          LD    2 BB-X     LOAD 1 WD OF EXPONENT VALUE  K2409640
                          BSI     CHARO    PUT IN PRINT BUFFER          K2409650
                          LD    2 BB+1-X   LOAD 2 WD OF EXPONENT VALUE  K2409660
                          BSI     CHARO    PUT IN PRINT BUFFER          K2409670
                    IR13  LDX  L1 *-*      RESTORE XR1                  K2409680
                          LDX  L2 *-*      RESTORE XR2                  K2409690
                          BSC  I  BINRY    RETURN TO CALLER             K2409700
                    *                                                   K2409710
                    *             MESSAGES TO BE PRINTED THIS PHASE     K2409720
                    *                                                   K2409730
                    *                                                   K2409740
                    TEXT2 DC      9                                     K2409750
                          EBC     .INTEGER CONSTANTS .                  K2409760
                    CORTX DC      11                                    K2409770
                          EBC     .CORE REQUIREMENTS FOR .              K2409780
                    COMTX DC      4                                     K2409790
                          EBC     . COMMON .                            K2409800
                    VARTX DC      6                                     K2409810
                          EBC     .  VARIABLES .                        K2409820
                    PROTX DC      5                                     K2409830
                          EBC     .  PROGRAM .                          K2409840
                    *                                                   K2409850
                    *             PHASE EXIT                            K2409860
                    *                                                   K2409870
                    HTES2 DC      /7002    LINE SPACE PARAMETER         K2409880
                    EXIT  LD      HTES2    LOAD LINE SPACE PARAM        K2409890
                          BSI  L  LSTPR    BR TO SPACE LINE             K2409900
                          LDX  I1 NXTPH+1  LOAD PARAMETER FOR READING   K2409910
                          LDD     NXTPH+2  *NEXT PHASE                  K2409920
                          BSC  L  ROL      GO TO READ NEXT PHASE        K2409930
                          BSS  E  0                                     K2409940
                    NXTPH DC      55       ID OF NEXT PHASE             K2409950
                          DC      *-*      CORE ADDRESS NEXT PHASE      K2409960
                          DC      *-*        WORD COUNT NEXT PHASE      K2409970
                          DC      *-*        SECTOR ADDRESS NEXT PHASE  K2409980
                    PTCH1 DC      *-*       LINK                    2-2 K2409990
                          EOR   3 H8000-Z   IS NUMBER /8000         2-2 K2410000
                          BSC  L  INTD1,Z   BRANCH IF NO            2-2 K2410010
                          LD    3 H8000-Z   IF YES - GO HANDLE      2-2 K2410020
                          SRT     1         *THAT                   2-2 K2410030
                          MDX  L  BIN,1     *SPECIAL                2-2 K2410040
                          STO   3 CONVT-3-Z *NUMBER                 2-2 K2410050
                    INTD1 BSI  L  BINRY     GO CONVERT TO DECIMAL   2-2 K2410060
                          BSC  I  PTCH1     RETURN                  2-2 K2410070
                          BSS     66         PATCH AREA             2-4 K2410080
                          DC      0                                     K2410090
                          END     BPHAR-2                           2-2 K2410100
