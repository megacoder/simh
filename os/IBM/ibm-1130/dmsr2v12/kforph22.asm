                          HDNG    LIST STATEMENT ALLOCATION             K2200010
                    *************************************************** K2200020
                    *STATUS- VERSION 2, MODIFICATION 4                * K2200030
                    *                                                 * K2200040
                    *                                                 * K2200050
                    *FUNCTION/OPERATION                               * K2200060
                    *   * INSERTS THE STATEMENT ALLOCATIONS INTO THE  * K2200070
                    *     SYMBOL TABLE.                               * K2200080
                    *   * LISTS THE STATEMENT ALLOCATIONS ON THE      * K2200090
                    *     PRINCIPAL PRINT DEVICE.                     * K2200100
                    *   * PRINTS ERROR MESSAGES C 97 AND C 98 IF REQ  * K2200105
                    *                                                 * K2200110
                    *ENTRY POINTS                                     * K2200120
                    *   * NEQ  -THIS PHASE IS ENTERED VIA A CALL TO   * K2200130
                    *           THE ROL SUBROUTINE FROM PHASE 20.     * K2200140
                    *                                                 * K2200150
                    *INPUT-                                           * K2200160
                    *   * STATEMENT STRING                            * K2200170
                    *   * SYMBOL TABLE                                * K2200180
                    *   * FCOM                                        * K2200190
                    *                                                 * K2200200
                    *OUTPUT                                           * K2200210
                    *   * PRINTED LIST OF STATEMENT ALLOCATIONS IF ANY* K2200220
                    *   * STATEMENT STRING                            * K2200230
                    *   * SYMBOL TABLE                                * K2200240
                    *   * FCOM                                        * K2200250
                    *                                                 * K2200260
                    *EXTERNAL REFERENCES-                             * K2200270
                    *   SUBROUTINES-                                  * K2200280
                    *      * ROL  - INTERPHASE ROLLER SUBR ENTRY      * K2200290
                    *      * NEWPG- PAGE EJECT SUBR INDIRECT ENTRY    * K2200300
                    *      * PRINT- PRINT CONTROL SUBR ENTRY          * K2200310
                    *      * LSTPR- PRINCIPAL PRINT SUBR ENTRY        * K2200320
                    *   COMMA/DCOM                                    * K2200330
                    *      * $PHSE- NO. OF PHASE NOW IN CORE          * K2200340
                    *      * $CH12- CHANNEL 12 INDICATOR              * K2200350
                    *                                                 * K2200360
                    *EXITS-                                           * K2200370
                    *   NORMAL-                                       * K2200380
                    *      EXIT IS MADE VIA A CALL TO THE ROL SUBR.   * K2200390
                    *   ERROR-                                        * K2200400
                    *      NONE                                       * K2200410
                    *                                                 * K2200420
                    *TABLES/WORK AREAS                                * K2200430
                    *   * FCOM                                        * K2200440
                    *   * STRING AREA                                 * K2200450
                    *   * SYMBOL TABLE AREA                           * K2200460
                    *   * AREA                                        * K2200470
                    *   * PAREA                                       * K2200480
                    *                                                 * K2200490
                    *ATTRIBUTES-                                      * K2200500
                    *   NONE                                          * K2200510
                    *                                                 * K2200520
                    *NOTES-                                           * K2200530
                    *   ERRORS DETECTED BY THIS PHASE - NONE          * K2200540
                    *************************************************** K2200550
                          ABS                                           K2200560
                    *                                                   K2200570
                    *                      SYSTEM EQUATES               K2200580
                    *                                                   K2200590
                    MEMRY EQU     /8000    MODULO CORE SIZE             K2200600
                    *                                                   K2200610
                    $CH12 EQU     /06      CHANNEL 12 INDICATOR         K2200620
                    $PBSY EQU     /36      - OR 0 IF PRINT BUFFER FREE  K2200630
                    $PHSE EQU     /78      NO. OF PHASE NOW IN CORE     K2200640
                    *                                                   K2200650
                    PHID  EQU     52       ID NO. THIS PHASE            K2200660
                    *                                                   K2200670
                    *                                                   K2200680
                    *                      FORTRAN EQUATES              K2200690
                    *                                                   K2200700
                    OVERL EQU     MEMRY-1501 START OF FCOM          2-4 K2200710
                    ROL   EQU     MEMRY-68 ROL SUBR ENTRY POINT         K2200720
                    HEAD  EQU     ROL-49   PAGE HEADER AREA             K2200730
                    OVERP EQU     HEAD-329 DEVICE PRINT SUBR AREA       K2200740
                    NEWPG EQU     OVERP-54 INDIRECT ENTRY FOR PG EJECT  K2200750
                    AREA  EQU     NEWPG+1  MESSAGE ADDRESS              K2200760
                    PRINT EQU     NEWPG+2  PRINT INTERFACE SUBR ENTRY   K2200770
                    LSTPR EQU     OVERP+3  DEVICE PRINT SUBR ENTRY      K2200780
                          ORG     OVERL                                 K2200790
                    *                                                   K2200800
                    *                                                   K2200810
                    *                      FORTRAN COMMUNICATION AREA   K2200820
                    *                      FCOM                         K2200830
                    *                                                   K2200840
                    ORG   BSS     1        ORIGIN ADDRESS           2-4 K2200845
                    SOFS  BSS     1        START OF STRING              K2200850
                    EOFS  BSS     1        END OF STRING                K2200860
                    SOFST BSS     1        START OF SYMBOL TABLE        K2200870
                    SOFNS BSS     1        LENGTH OF PROGRAM            K2200880
                    SOFXT BSS     1        SIZE OF WORK AREA (VAR AREA) K2200890
                    SOFGT BSS     1        SIZE OF CONSTANTS AREA       K2200900
                    EOFST BSS     1        END OF SYMBOL TABLE          K2200910
                    COMON BSS     1        RELATIVE ENTRY POINT         K2200920
                    CSIZE BSS     1        SIZE OF COMMON               K2200930
                    ERROR BSS     1        ERROR FLAG                   K2200940
                    *                      BIT 15 - OVERLAP ERROR       K2200950
                    *                      BIT 14 - OTHER ERROR         K2200960
                    *                      BIT 13 SUBIN TOO LARGE   2-3 K2200970
                    *                      BIT 11 ORIGIN IN SUBPROG 2-4 K2200975
                    *                      BIT 10 OVLAP IN PHASE 21 2-3 K2200980
                    *                      BIT  9 INVALID ORIGIN    2-4 K2200985
                    FNAME BSS     1        PROGRAM NAME WD 1            K2200990
                          BSS     1        *            WD 2            K2201000
                    SORF  BSS     1        SUBROUTINE(-) OR FUNCTION(+) K2201010
                    CCWD  BSS     1        CONTROL CARD WORD            K2201020
                    *                      BIT 15- TRANSFER TRACE       K2201030
                    *                      BIT 14- ARITHMETIC TRACE     K2201040
                    *                      BIT 13- EXTENDED PRECISION   K2201050
                    *                      BIT 12- LIST SYMBOL TABLE    K2201060
                    *                      BIT 11- LIST SUBP NAMES      K2201070
                    *                      BIT 10- LIST SOURCE PROGRAM  K2201080
                    *                      BIT  9- ONE  WORD INTEGERS   K2201090
                    *                      BIT  8- ORIGIN           2-4 K2201095
                    *                      BITS 7-0 NOT USED            K2201100
                    IOCS  BSS     1        IOCS CONTROL CARD WORD       K2201110
                    *                      BIT 15- CARD                 K2201120
                    *                      BIT 14- PAPERTAPE            K2201130
                    *                      BIT 13- TYPEWRITER           K2201140
                    *                      BIT 12- 1403 PRINTER         K2201150
                    *                      BIT 11- 2501 READER          K2201160
                    *                      BIT 10- KEYBOARD             K2201170
                    *                      BIT  9- 1442 PUNCH           K2201180
                    *                      BIT  8- DISK                 K2201190
                    *                      BIT  7- 1132 PRINTER         K2201200
                    *                      BIT  3- PLOTTER              K2201210
                    *                      BIT  1- UNFORMATTED DISK     K2201220
                    DFCNT BSS     1        DEFINE FILE COUNT            K2201230
                    *                                                   K2201240
                    *                                                   K2201250
                    *                  END OF FORTRAN COMMUNICATION     K2201260
                    *                  AREA                             K2201270
                    *************************************************** K2201280
                    *             THE SWITCHES USED IN PHASE 23 FOLLOW  K2201290
                    *             IF POSITIVE, THE SWITCH IS TRANSFER=T K2201300
                    *             IF ZERO, THE SWITCH IS NORMAL=N       K2201310
                    *             SWITCH HTEST                          K2201320
                    *               N= HEADER NOT PRINTED               K2201330
                    *               T= HEADER ALREADY PRINTED           K2201340
                    *                                                   K2201350
                    *                                                   K2201360
                    BPHAR EQU     *+2      ENTRY ADDRESS                K2201370
                          DC      0        WORK AREA FOR LOADER         K2201380
                          DC      -52      -PHASE ID FOR SLET LOOKUP    K2201390
                          DC      NXTPH-*+1 TABLE FOR SLET ENTRIES      K2201400
                          DC      1        NO. OF SLET ENTRIES          K2201410
                          ORG     *-2      ENTRY ADDRESS                K2201420
                    NEQ   BSC  L  ENT      GO TO ENTRY                  K2201430
                    *                                                   K2201440
                    *             PRINT AREA                            K2201450
                    *                                                   K2201460
                    WDCNT DC      11       WORD COUNT                   K2201470
                    PAREA DC      /E2E3    ST                           K2201480
                          DC      /C1E3    AT                           K2201490
                          DC      /C5D4    EM                           K2201500
                          DC      /C5D5    EN                           K2201510
                          DC      /E340    T                            K2201520
                          DC      /C1D3    AL                           K2201530
                          DC      /D3D6    LO                           K2201540
                          DC      /C3C1    CA                           K2201550
                          DC      /E3C9    TI                           K2201560
                          DC      /D6D5    ON                           K2201570
                          DC      /E240    S                            K2201580
                    *                                                   K2201590
                    *             THIS SUBROUTINE PRINTS THE HEADER     K2201600
                    *             'STATEMENT ALLOCATIONS' AND IS THEN   K2201610
                    *             WIPED OUT WHEN THE PRINT AREA IS      K2201620
                    *             CLEARED.                              K2201630
                    *                                                   K2201640
                    PRTHD LD      PRTH1    LOAD LINE SPACE PARAMETER    K2201650
                          BSI  L  LSTPR    SPACE PRINTER ONE SPACE      K2201660
                    *                                                   K2201670
                          LD   I  $CH12    TEST CHANNEL 12 INDICATOR    K2201680
                          BSI  I  NEWPG,Z  EJECT PAGE IF SET            K2201690
                    *                                                   K2201700
                          LDD     PRTH2    LOAD PRINT PARAMETERS        K2201710
                          BSI  L  LSTPR    GO PRINT SECTION HEADER      K2201720
                          LD   L  $PBSY                                 K2201730
                          BSC  L  *-4,-Z   LOOP IF PRINT BUFFER BUSY    K2201740
                    *                                                   K2201750
                    *                                                   K2201760
                          LDX  L3 PTHD+2   CRIPPLE ENTRY TO THIS SUBR   K2201770
                          STX  L3 PTHD+1   *                            K2201780
                          STX  L3 BLKPA    DUMMY EXIT FROM BLANK SUBR   K2201790
                          LDX  L3 Z        LOAD WORK AREA POINTER       K2201800
                          BSC  L  BLKPA+1  GO BLANK PRINT AREA          K2201810
                    *                                                   K2201820
                    PRTH1 DC      /7002    PRINT SPACE PARAMETER        K2201830
                          BSS  E  0                                     K2201840
                    PRTH2 DC      /7001    PRINT PARAMETER              K2201850
                          DC      WDCNT    MESSAGE ADDRESS              K2201860
                    *                                                   K2201870
                    *                                                   K2201880
                    ENT   LDX   1 PHID     GET ID THIS PHASE            K2201890
                          STX  L1 $PHSE    STORE IN SYSTEM PHASE AREA   K2201900
                          LDX  L3 Z        INITIALIZE WK AREA PT        K2201910
                          LD   L  ERROR    TEST FOR ERRORS              K2201920
                          BSC  L  SERCK,Z    BRANCH IF ANY ERROR    2-1 K2201930
                    *                       INITIALIZE                  K2201940
                          LDX  I1 SOFS     INITIALIZE I/P STRING PT     K2201950
                          LDX  I2 SOFS     INITIALIZE O/P STRING PT     K2201960
                          STX  L3 NEQ      SAVE WORK AREA POINTER       K2201970
                    *                                                   K2201972
                          LD      CCWD       IS THIS AN ABSOLUTE    2-4 K2201974
                          SLA     8          COMPILATION            2-4 K2201976
                          BSC     +Z         NO  - SKIP             2-4 K2201978
                          STO   3 ORGSW-Z    YES - SET ORIGIN SW    2-4 K2201980
                          MDX     M1000      CONTINUE               2-4 K2201982
                    *                                                   K2201984
                          ORG     PAREA+120 GET OUTSIDE OF PRINT AREA   K2201990
                    *                                                   K2202000
                    *             CHECK FOR STATEMENT NUMBER            K2202010
                    M1000 LD    1 0        IS STATEMENT NUMBERED        K2202020
                          BSC  L  ALOC,E   BRANCH IF YES                K2202030
                    *                                                   K2202040
                    *             CHECK FOR ARITH STMNT FUNCTN          K2202050
                          AND   3 HF800-Z  IS STATEMENT AN ARITHMETIC   K2202060
                          S     3 HD000-Z  *STATEMENT FUNCTION          K2202070
                          BSC  L  ALOC,+-  BRANCH IF YES                K2202080
                          STO   3 IDM-Z    SAVE MODIFIED ID             K2202090
                    *                                                   K2202100
                    *             MOVE UNALTERED                        K2202110
                    MOVE  LD    1 0        GET STATEMENT NORM           K2202120
                          AND   3 H07FC-Z  *                            K2202130
                          STO   3 NORM-Z   SAVE STATEMENT NORM          K2202140
                    MOVE1 LD    1 0        MOVE ONE WORD OF STATEMENT   K2202150
                          STO   2 0        *                            K2202160
                          MDX   2 1        INCREMENT I/P POINTER        K2202170
                          MDX   1 1        INCREMENT O/P POINTER        K2202180
                          MDX  L  NORM,-4  SKIP IF MOVE COMPLETE        K2202190
                          MDX     MOVE1    GO MOVE NEXT WORD            K2202200
                          LD    3 IDM-Z    RELOAD MODIFIED ID           K2202210
                          S     3 ENDID-Z  TEST IF -END-                K2202220
                          BSC  L  EXIT,+-  BRANCH IF YES                K2202230
                          MDX     M1000    GO CHECK NEXT STMNT          K2202240
                    *                                                   K2202250
                    *             FIND SYMBOL TABLE ENTRY               K2202260
                    ALOC  LD    1 1        LD SYMBOL TABLE PT WD        K2202270
                          AND   3 H07FF-Z  MASK TO EXPOSE ENTRY NO.     K2202280
                          STO   3 STENT-Z  SAVE IN WORK AREA            K2202290
                          LD   L  SOFST    LOAD START OF SYMBOL TABLE   K2202300
                          S     3 STENT-Z  SUBTRACT  3*ENTRY NO.        K2202310
                          S     3 STENT-Z  *                            K2202320
                          S     3 STENT-Z  *                            K2202330
                          A     3 FOUR-Z   +4 = STMNT NO. ENTRY ADDR    K2202340
                          STO   3 STENT-Z  SAVE ADDRESS OF ENTRY        K2202350
                    *                                                   K2202360
                    *             CHECK IF LIST DESIRED                 K2202370
                          LD   L  CCWD     LOAD CONTROL CARD WORD       K2202380
                          SLA     12       TEST IF LIST SYMBOLS REQ     K2202390
                          BSC  L  TKOFF,-  BRANCH IF NOT                K2202400
                          LD    1 2        LOAD ADDRESS                 K2202410
                          STO   3 LOCC2-Z  SAVE IN WORK AREA            K2202420
                    *                                                   K2202430
                    *             GET NAME FROM SYM. TABLE              K2202440
                          LD   I  STENT    GET NAME WORD 1              K2202450
                          STO   3 STONA-Z  STORE NAME WORD 1            K2202460
                          MDX  L  STENT,1                               K2202470
                          LD   I  STENT    GET NAME WORD 2 AND STORE    K2202480
                          STO   3 STONA-Z+1                             K2202490
                          MDX  L  STENT,-1                              K2202500
                    *                                                   K2202510
                    *                                                   K2202520
                    *             LIST ALLOCATED STATEMENT NUMBER       K2202530
                    *                                                   K2202540
                    *                                                   K2202550
                    *             TEST IF GENERATED STATEMENT NUMBER    K2202560
                    *             (GENER STMT NUMBER HAS NAME = 0)      K2202570
                    *             IF GENERATED STMT NUMBER, DO NOT      K2202580
                    *             PRINT                                 K2202590
                    *                                                   K2202600
                          LD    3 STONA-Z  LOAD NAME WORD 1             K2202610
                          BSC  L  TKOFF,+- BRANCH IF ZERO(NOT PRINTED)  K2202620
                    *                                                   K2202630
                    *             TEST IF HEADER PRINTED                K2202640
                    PTHD  BSC  L  PRTHD                                 K2202650
                    *                                                   K2202660
                          LD    3 H4000-Z  BLANK TO PRINT AREA          K2202670
                          BSI     TOPAU    *                            K2202680
                          LD    3 STONA-Z  STORED NAME                  K2202690
                          BSI     TOPA     O/P FIRST CHAR OF NAME       K2202700
                          LD    3 STONA-Z                               K2202710
                          SLA     6                                     K2202720
                          BSI     TOPA     O/P SECOND CHAR OF NAME      K2202730
                          LDD   3 STONA-Z                               K2202740
                          SLT     12                                    K2202750
                          BSI     TOPA     O/P THIRD CHAR OF NAME       K2202760
                          LD    3 STONA+1-Z                             K2202770
                          SLA     2                                     K2202780
                          BSI     TOPA     O/P FOURTH CHAR OF NAME      K2202790
                          LD    3 STONA+1-Z                             K2202800
                          SLA     8                                     K2202810
                          BSI     TOPA     O/P FIFTH CHAR OF NAME       K2202820
                          LD      H7E00    O/P EQUAL SIGN TO            K2202830
                          BSI     TOPAU    *PRINT AREA                  K2202840
                    *                                                   K2202850
                          LD    3 ORGSW-Z    IS IT ABSOLUTE         2-4 K2202851
                          BSC  L  PTHD1,+-   NO  - CONTINUE         2-4 K2202852
                          LD    3 LOCC2-Z    YES - RELOCATE THE     2-4 K2202853
                          A    L  ORG        ADDRESS                2-4 K2202854
                          STO   3 LOCC2-Z    STORE BACK             2-4 K2202855
                          BSC  L  PTHD1,-    BRANCH IF POSITIVE     2-4 K2202856
                          MDX  L  ERROR,64   INDICATE ERROR 86      2-4 K2202857
                          BSC  L  EXIT+2     EXIT                   2-4 K2202858
                    *                                                   K2202859
                    *             CONVERSION OF ADDRESS BEGINS          K2202860
                    PTHD1 LD    3 LOCC2-Z  STORED ALLOCATION            K2202870
                          SRA     12                                    K2202880
                          BSI     TOPAH    FIRST CHAR TO PRINT AREA     K2202890
                          LD    3 LOCC2-Z                               K2202900
                          SRA     8                                     K2202910
                          BSI     TOPAH    SECOND CHAR                  K2202920
                          LD    3 LOCC2-Z                               K2202930
                          SRA     4                                     K2202940
                          BSI     TOPAH    THIRD CHAR                   K2202950
                          LD    3 LOCC2-Z                               K2202960
                          BSI     TOPAH    FOURTH CHAR                  K2202970
                          LD    3 H4000-Z                               K2202980
                          BSI     TOPAU    FIFTH CHAR                   K2202990
                    *                                                   K2203000
                    *             TEST IF PRINT AREA FULL               K2203010
                    *             IF FULL, PRINT A LINE                 K2203020
                    *                                                   K2203030
                          LD    3 PAP-Z    LOAD PRINT AREA POINTER      K2203040
                          S       LNEND    TEST IF END OF LINE          K2203050
                          BSC  L  TKOFF,+Z RETURN IF LINE UNFILLED      K2203060
                    *                                                   K2203070
                    *             LINE FULL, PRINT IT                   K2203080
                          LD      PAPOR    LOAD PRINT AREA START ADDR   K2203090
                          STO  L  PAP      RESET PRINT AREA POINTER     K2203100
                          STO  L  AREA     SET INTO INTERFACE SUBR      K2203110
                          LD      D60                                   K2203120
                          STO  L  WDCNT    SET WORD COUNT IN PRINT AREA K2203130
                          BSI  L  PRINT    PRINT LINE                   K2203140
                          BSI     BLKPA    BLANK THE PRINT AREA         K2203150
                    *                                                   K2203160
                    *             TEST IF END OF PAGE                   K2203170
                          LD   I  $CH12     LOAD CHANNEL 12 SWITCH      K2203180
                          BSI  I  NEWPG,Z  EJECT PAGE IF ON             K2203190
                    TKOFF LD    1 2        LOAD SYMBOL ALLOCATION       K2203200
                          STO  I  STENT    PLACE INTO SYMBOL TABLE      K2203210
                          LD    1 0                                     K2203220
                          S     3 EIGHT-Z  ADJUST STATEMENT NORM BY 2   K2203230
                          MDX   1 2        INCREMENT I/P POINTER BY 2   K2203240
                          STO   1 0        STORE ADJ ID INTO I/P STRING K2203250
                          MDX     MOVE     GO MOVE STMNT TO O/P STRING  K2203260
                    *                                                   K2203270
                    *             CONSTANTS, TEMP STORAGE               K2203280
                    ORGSW DC      0          ORIGIN SWITCH          2-4 K2203285
                          BSS  E  0                                     K2203290
                    Z     EQU     *        WORK AREA POINTER ADDRESS    K2203300
                    STONA DC      0        STORE NAME WORD 1            K2203310
                          DC      0        STORED NAME WORD 2           K2203320
                    ENDID DC      /1000-/D000 END ID TEST CONSTANT      K2203330
                    PAPOR DC      PAREA    PRINT AREA START ADDR        K2203340
                    PAP   DC      PAREA    PRINT AREA POINTER           K2203350
                    LNEND DC      PAREA+118  TESTVALUE FOR END OF LINE  K2203360
                    STOCH DC      0        STORED CHARACTER             K2203370
                    HC000 DC      /C000    CONSTANT                     K2203380
                    H7E00 DC      /7E00    CONSTANT                     K2203390
                    H000A DC      /000A    CONSTANT                     K2203400
                    H0039 DC      /0039    CONSTANT                     K2203410
                    IDM   DC      *-*      MODIFIED ID                  K2203420
                    NORM  DC      *-*      STATEMENT NORM               K2203430
                    STENT DC      *-*      WORK AREA                    K2203440
                    LOCC2 DC      *-*      ALLOCATION STORAGE           K2203450
                    EIGHT DC      8        CONSTANT                     K2203460
                    ONE   DC      1        CONSTANT                     K2203470
                    HF800 DC      /F800    CONSTANT                     K2203480
                    HD000 DC      /D000    CONSTANT                     K2203490
                    H07FC DC      /07FC    CONSTANT                     K2203500
                    H07FF DC      /07FF    CONSTANT                     K2203510
                    FOUR  DC      4        CONSTANT                     K2203520
                    H4000 DC      /4000    CONSTANT                     K2203530
                    H3F00 DC      /3F00    CONSTANT                     K2203540
                    H000F DC      /000F    CONSTANT                     K2203550
                    D60   DC      60       CONSTANT                     K2203560
                    *                                                   K2203570
                    *             SUBROUTINE                            K2203580
                    *             CHAR IN A-REG TO PRINT AREA UNCHANGED K2203590
                    *                                                   K2203600
                    TOPAU DC      0        LINK                         K2203610
                          STO     STOCH    STORE CHARACTER              K2203620
                    TOPAX LD      STOCH    LOAD CHARACTER               K2203630
                          STO  I  PAP      PLACE CHAR INTO PRINT AREA   K2203640
                          MDX  L  PAP,1    MOVE PRINT AREA POINTER      K2203650
                          BSC  I  TOPAU    RETURN                       K2203660
                    *                                                   K2203670
                    *             SUBROUTINE                            K2203680
                    *             CONVERT CHAR IN A-REG INTO            K2203690
                    *             EBC-CODE, THEN MOVE TO PRINT AREA     K2203700
                    *                                                   K2203710
                    TOPA  DC      0        LINK                         K2203720
                          AND   3 H3F00-Z  MASK TO LEAVE CHAR           K2203730
                          BSC  L  TOPA2,+- BR IF BLANK                  K2203740
                    *                                                   K2203750
                    *             NOTE                                  K2203760
                    *             IF OTHER SPECIAL CHARACTERS THAN      K2203770
                    *             BLANK ARE EXPECTED, TESTING SHOULD    K2203780
                    *             BE HERE                               K2203790
                          OR      HC000    CONVERT TO EBCDIC            K2203800
                    TOPA1 STO     STOCH    STORE CHARACTER              K2203810
                          LD      TOPA     SET UP TO RETURN FROM        K2203820
                          STO     TOPAU    *TOPAU SUBR.                 K2203830
                          MDX     TOPAX    GO OUTPUT CHARACTER          K2203840
                    TOPA2 LD    3 H4000-Z  LOAD BLANK CHARACTER         K2203850
                          MDX     TOPA1    GO OUTPUT                    K2203860
                    *                                                   K2203870
                    *                                                   K2203880
                    *             SUBROUTINE                            K2203890
                    *             MOVE HEXADEC CHAR TO PRINT AREA       K2203900
                    *                                                   K2203910
                    TOPAH DC      0        LINK                         K2203920
                          AND  L  H000F    MASK ALL BUT NUMERIC DIGIT   K2203930
                          S       H000A    TEST IF GT NINE              K2203940
                          BSC     Z+       SKIP IF GT NINE              K2203950
                          A       H0039    START NUMERIC CONVERSION     K2203960
                          A     3 ONE-Z    START ALPHA CONVERSION       K2203970
                          SLA     8        SHIFT TO HIGH ORDER BITS     K2203980
                          BSI     TOPA     FINISH EBC CNVT AND MOVE     K2203990
                          BSC  I  TOPAH    RETURN                       K2204000
                    *                                                   K2204010
                    *                                                   K2204020
                    *             SUBROUTINE                            K2204030
                    *             BLANK TO PRINT AREA                   K2204040
                    *                                                   K2204050
                    BLKPA DC      0        LINK                         K2204060
                          LD    3 H4000-Z  LOAD EBCDIC BLANK            K2204070
                          LDX   3 -120     INITLZ TO CLEAR PRINT AREA   K2204080
                    BLKP1 STO  L3 PAREA+120 ST BLANK IN PRINT AREA      K2204090
                          MDX   3 1        SKIP WHEN COMPLETE           K2204100
                          MDX     BLKP1    CONTINUE                     K2204110
                          LDX  L3 Z        RE-INITIALIZE WORK AREA PT   K2204120
                          BSC  I  BLKPA    RETURN                       K2204130
                    *                                               2-1 K2204140
                    *             MAKE CHECK FOR ERRORS WHICH MAY HAVE  K2204150
                    *             OCCURRED SINCE THE ERROR PHASE    2-1 K2204160
                    *                                               2-1 K2204170
                    SERCK LD   L  ERROR      GET ERROR WORD         2-1 K2204180
                          SRA     2          SHIFT OUT NORMAL ERROR 2-1 K2204190
                          BSC  L  EXIT+2,+-  BRANCH IF NORMAL ERROR 2-1 K2204200
                          BSC  L  SUBIN,E    BRANCH IF SUBIN TOO LG 2-3 K2204210
                          SLA     12         BRANCH IF NOT          2-4 K2204212
                          BSC  L  EXIT+2,-   OVERLAP ERROR          2-4 K2204214
                          LDX  L1 TEXT2      LOAD OVLAP MESSAGE     2-3 K2204220
                          MDX     *+2        SKIP                   2-1 K2204230
                    SUBIN LDX  L1 TEXT1      LOAD SUBIN MESSAGE     2-3 K2204240
                          STX   1 EMES1+1    SET MESSAGE 1          2-1 K2204250
                          LD   L  PRTH1      LOAD SPACE PARAMETER   2-1 K2204260
                          BSI  L  LSTPR      GO SKIP A LINE         2-1 K2204270
                          LD   I  $CH12      CHECK CHANNEL 12       2-1 K2204280
                          BSI  L  NEWPG,Z    BRANCH FOR SKIP        2-1 K2204290
                          LDD     EMES1      LOAD PRINT PARAMETERS  2-1 K2204300
                          BSI  L  LSTPR      GO PRINT               2-1 K2204310
                          MDX     EXIT+2     EXIT                   2-1 K2204360
                          BSS  E                                    2-1 K2204370
                    EMES1 DC      /7001      PRINT PARAMETERS       2-1 K2204380
                          DC      *-*                               2-1 K2204390
                    TEXT1 DC      19         WORD COUNT             2-4 K2204420
                          EBC     . C 98 SUBROUTINE INITIALIZE .    2-4 K2204430
                          EBC     .TOO LARGE .                      2-4 K2204440
                    TEXT2 DC      19         WORD COUNT             2-4 K2204450
                          EBC     . C 97 PROGRAM LENGTH EXCEEDS.    2-4 K2204460
                          EBC     . CAPACITY .                      2-4 K2204470
                    *                                               2-1 K2204480
                    *                                               2-1 K2204490
                    EXIT  STX  L2 EOFS       STORE END OF STRING ADDR   K2204500
                          LD    3 PAP-Z    TEST IF PRINT AREA IS        K2204510
                          S     3 PAPOR-Z  *PARTIALLY FILLED.           K2204520
                          BSC  L  EXIT1,+- EXIT IF NOT                  K2204530
                          LD    3 PAPOR-Z  SET UP TO PRINT PARTIALLY    K2204540
                          STO  L  AREA     *FILLED LINE.                K2204550
                          LD    3 D60-Z    *                            K2204560
                          STO  L  WDCNT    *                            K2204570
                          BSI  L  PRINT    PRINT PARTIALLY FILLED LINE  K2204580
                    EXIT1 LD   I  $CH12     LOAD CHANNEL 12 SWITCH      K2204590
                          BSI  I  NEWPG,Z  EJECT PAGE IF ON             K2204600
                          LDX  I1 NXTPH+1  LOAD PARAM FOR READING       K2204610
                          LDD     NXTPH+2  NEXT PHASE                   K2204620
                          BSC  L  ROL      GO TO READ NEXT PHASE        K2204630
                          BSS  E  0                                     K2204640
                    NXTPH DC      53         ID OF NEXT PHASE           K2204650
                          DC      *-*        CORE ADDRESS NEXT PHASE    K2204660
                          DC      *-*        WORD COUNT NEXT PHASE      K2204670
                          DC      *-*        SECTOR ADDRESS NEXT PHASE  K2204680
                          BSS     223        PATCH AREA             2-4 K2204690
                          DC       0                                    K2204700
                          END     BPHAR-2                               K2204710
