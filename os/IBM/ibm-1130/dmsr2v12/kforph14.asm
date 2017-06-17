                          HDNG    1130 FORTRAN COMPILER PHASE 14        K1400010
                    *************************************************** K1400020
                    *STATUS - VERSION 2  MODIFICATION 10              * K1400030
                    *                                                 * K1400040
                    *FUNCTION/OPERATION-                              * K1400050
                    *   * CHECKS FOR VALID SYNTAX IN DO STATEMENTS    * K1400060
                    *     AND IN NESTED DO-LOOPS                      * K1400070
                    *   * GENERATES THE CODING NEEDED TO PERFORM THE  * K1400080
                    *     DO-TEST.                                    * K1400090
                    *   * CHECKS THE SYNTAX OF DO, CONTINUE, BACK-    * K1400100
                    *     SPACE, REWIND, END FILE, STOP, PAUSE, AND   * K1400110
                    *     END STATEMENTS                              * K1400120
                    *   * CHECKS FOR A GO TO, IF, STOP, CALL LINK,    * K1400130
                    *     CALL EXIT, OR RETURN STATEMENT AS THE LAST  * K1400140
                    *     EXECUTABLE STATEMENT OF THE SOURCE PROGRAM. * K1400150
                    *                                                 * K1400160
                    *ENTRY POINTS-                                    * K1400170
                    *   START-PHASE 14 IS READ INTO CORE BY PHASE 13  * K1400180
                    *         AND EXECUTION BEGUN AT LOCATION START.  * K1400190
                    *                                                 * K1400200
                    *INPUT-                                           * K1400210
                    *   NONE IN THE USUAL SENSE. HOWEVER THE STMNT    * K1400220
                    *   STRING SCANNED BY THE COMPILER MAY BE         * K1400230
                    *   CONSIDERED INPUT                              * K1400240
                    *                                                 * K1400250
                    *OUTPUT-                                          * K1400260
                    *   NONE IN THE USUAL SENSE HOWEVER, THE STMNT    * K1400270
                    *   STRING AND THE SYMBOL TABLE ALTERED BY THE    * K1400280
                    *   COMPILER MAY BE CONSIDERED OUTPUT.            * K1400290
                    *                                                 * K1400300
                    *EXTERNAL REFERENCES-N/A                          * K1400310
                    *                                                 * K1400320
                    *EXITS-                                           * K1400330
                    *   NORMAL-                                       * K1400340
                    *      PHASE EXITS NORMALLY IF NO ERRORS ARE      * K1400350
                    *      FOUND. PHASE 15 IS LOADED AND EXECUTED     * K1400360
                    *   ERROR-                                        * K1400370
                    *      THE FLOW OF COMPILER PROCESSING IS NOT     * K1400380
                    *      INTERRUPTED WHEN AN ERROR IS ENCOUNTERED.  * K1400390
                    *      AN ERROR STMNT REPLACES THE FAULTY STMNT   * K1400400
                    *      ON THE STRING AND STMNT SCANNING PROCESS   * K1400410
                    *      CONTINUES. AN EXCEPTION OCCURS IN THE CASE * K1400420
                    *      OF AN OVERLAP ERROR. COMPILATION IS        * K1400430
                    *      ABORTED AND CONTROL IS PASSED FROM PHASE   * K1400440
                    *      TO SUCCEEDING PHASE UNTIL AN OUTPUT PHASE  * K1400450
                    *      IS REACHED WHICH CAN PRINT AN ERROR MESSAGE* K1400460
                    *      THE ERRORS DETECTED BY PHASE 14 ARE  51,   * K1400470
                    *      52, 53, 54, 55, 56, 57, 58, 59, 60, 61,    * K1400480
                    *      AND 62.                                    * K1400490
                    *                                                 * K1400500
                    *TABLES/WORK AREAS-                               * K1400510
                    *   NONE EXCEPT STATEMENT STRING AREA, SYMBOL     * K1400520
                    *   TABLE, AND FORTRAN COMMUNICATION AREA         * K1400530
                    *                                                 * K1400540
                    *ATTRIBUTES-N/A                                   * K1400550
                    *                                                 * K1400560
                    *NOTES-                                           * K1400570
                    *   THE SWITCHES USED IN PHASE 14 FOLLOW. IF NON- * K1400580
                    *   ZERO, THE SWITCH IS TRANSFER=T. IF ZERO, THE  * K1400590
                    *   SWITCH IS NORMAL=N.                           * K1400600
                    *      NORM2-PAUSE OR STOP STATEMENT              * K1400610
                    *            T#PAUSE OR STOP FOUND                * K1400620
                    *************************************************** K1400630
                          ABS                                           K1400640
                    *                                                   K1400650
                    *                       SYSTEM EQUATES              K1400660
                    MEMRY EQU     /8000                                 K1400670
                    OVERL EQU     MEMRY-1501 START OF FCOM              K1400680
                    ROL   EQU     MEMRY-68   LOCN OF RTN TO READ NXT PH K1400690
                    $PHSE EQU     /78        NO. OF PHASE NOW IN CORE   K1400700
                    PHLEN EQU     4          NO SECTORS THIS PHASE      K1400705
                          ORG     OVERL                                 K1400710
                    PHID  EQU     44         ID NUMBER THIS PHASE       K1400720
                    *                                                   K1400730
                    *                  FORTRAN COMMUNICATION AREA       K1400740
                    ORG   BSS     1    ORIGIN ADDRESS               2-4 K1400745
                    SOFS  BSS     1    START OF STRING                  K1400750
                    EOFS  BSS     1    END OF STRING                    K1400760
                    SOFST BSS     1    START OF SYMBOL TABLE            K1400770
                    SOFNS BSS     1    START OF NON-STATEMENT NUMBERS   K1400780
                    SOFXT BSS     1    START OF SUBSCRIPT TEMPORARIES   K1400790
                    SOFGT BSS     1    START OF GENERATED TEMPORARIES   K1400800
                    EOFST BSS     1    END OF SYMBOL TABLE              K1400810
                    COMON BSS     1    NEXT AVAILABLE COMMON            K1400820
                    CSIZE BSS     1    SIZE OF COMMON                   K1400830
                    ERROR BSS     1    OVERLAP ERROR                    K1400840
                    FNAME BSS     1    PROGRAM NAME                     K1400850
                          BSS     1                                     K1400860
                    SORF  BSS     1    SUBROUTINE(-) OR FUNCTION(+)     K1400870
                    CCWD  BSS     1    CONTROL CARD WORD                K1400880
                    *                BIT 15 TRANSFER TRACE              K1400890
                    *                BIT 14 ARITHMETIC TRACE            K1400900
                    *                BIT 13 EXTENDED PRECISION          K1400910
                    *                BIT 12 LIST SYMBOL TABLE           K1400920
                    *                BIT 11 LIST SUBPROGRAM NAMES       K1400930
                    *                BIT 10 LIST SOURCE PROGRAM         K1400940
                    *                BIT  9 ONE WORD INTEGERS           K1400950
                    *                BIT  8 ORIGIN                  2-4 K1400955
                    IOCS  BSS     1    IOCS CONTROL CARD WORD           K1400960
                    *                BIT 15 CARD                        K1400970
                    *                BIT 14 PAPER TAPE                  K1400980
                    *                BIT 13 TYPEWRITER                  K1400990
                    *                BIT 12 1403 PRINTER                K1401000
                    *                BIT 11 2501 READER                 K1401010
                    *                BIT 10 KEYBOARD                    K1401020
                    *                BIT  9 1442 PUNCH                  K1401030
                    *                BIT  8 DISK                        K1401040
                    *                BIT  7 1132 PRINTER                K1401050
                    *                BIT  3 PLOTTER                     K1401060
                    DFCNT BSS     1                                     K1401070
                    *                                                   K1401080
                    *                                                   K1401090
                    *                  END OF FORTRAN COMMUNICATION     K1401100
                    *                  AREA                             K1401110
                    *                                                   K1401120
                    *                                                   K1401130
                    BPHAR EQU     *+2                                   K1401140
                          DC      0          LOADER WORK AREA.          K1401150
                          DC      -44        -PHASE ID FOR SLET LOOKUP  K1401160
                          DC      NXTPH-*+1  TABLE FOR NEXT PHASE ENTRY K1401170
                          DC      1          ONE ENTRY TO BE SET BY LDR K1401180
                          ORG     *-2                                   K1401190
                    *                                                   K1401200
                    START LDX   1 PHID       GET ID THIS PHASE          K1401210
                          STX  L1 $PHSE      STORE IN SYSTEM PHASE AREA K1401220
                    *                  CHECKS FOR A SYM TBL OVERLAP     K1401230
                    *                  INITIALIZES THE STRING POINTER   K1401240
                    *                                                   K1401250
                    *                                                   K1401260
                          LD      ERROR      TEST FOR OVERLAP ERROR     K1401270
                          BSC  L  OUT,Z      BRANCH IF ERROR            K1401280
                    *                                                   K1401290
                    *                  INITIALIZE PHASE                 K1401300
                          LDX  I1 SOFS       INITIALIZE INPUT POINTER   K1401310
                          LDX  L3 TABLE-4    INITIALIZE DO TABLE PT     K1401320
                          SLA     16         CLEAR FIRST WORD           K1401330
                          STO   3 +4         OF DO TABLE                K1401340
                    *                                                   K1401350
                    *                                                   K1401360
                    *                  CHECKS FOR END, DO, STOP, AND    K1401370
                    *                  PAUSE STATEMENTS                 K1401380
                    ABEL  LD    1 0          LOAD STMNT ID WORD         K1401390
                          STX  L1 PAVE       SAVE ADDRESS OF ID WORD    K1401400
                          SRA     2                                     K1401410
                          AND     IDTPE      GET STMNT ID TYPE          K1401420
                          S       ENDC       IS IT END STMNT            K1401430
                          BSC  L  DOTBL,+-   BRANCH IF YES              K1401440
                    *                                                   K1401450
                    *                                                   K1401460
                          S       DOC        IS IT DO STMNT             K1401470
                          BSC  L  FULL,+-    BRANCH IF YES              K1401480
                    *                                                   K1401490
                    *                                                   K1401500
                          S       BACKC      IS IT BACKSPACE            K1401510
                          BSC  L  CALL1,+-   BRANCH IF YES              K1401520
                    *                                                   K1401530
                    *                                                   K1401540
                          S       WINDC      IS IT REWIND               K1401550
                          BSC  L  CALL2,+-   BRANCH IF YES              K1401560
                    *                                                   K1401570
                    *                                                   K1401580
                          S       FILEC      IS IT END FILE             K1401590
                          BSC  L  CALL3,+-   BRANCH IF YES              K1401600
                    *                                                   K1401610
                    *                                                   K1401620
                          S       STOPC      IS IT STOP                 K1401630
                          BSC  L  CALL4,+-   BRANCH IF YES              K1401640
                    *                                                   K1401650
                    *                                                   K1401660
                          S       PAUSC      IS IT PAUSE                K1401670
                          BSC  L  CALL5,+-   BRANCH IF YES              K1401680
                    *                                                   K1401690
                    *                                                   K1401700
                          S       CONTQ      IS IT CONTINUE             K1401710
                          BSC  L  CNTST,+-   BRANCH IF YES              K1401720
                    *                                                   K1401730
                    *                                                   K1401740
                    *                  CHECKS FOR NUMBERED STMNTS       K1401750
                    BAKER LD    1 0          DOES STMNT HAVE STMNT NO.  K1401760
                          BSC  L  TINUE,E    BRANCH IF YES              K1401770
                    *                                                   K1401780
                    *                                                   K1401790
                          BSI  L  MOVE       MOVE TO NEXT STATEMENT     K1401800
                          MDX     ABEL       START STMNT CHECK          K1401810
                    *                                                   K1401820
                    *                  CONSTANTS                        K1401830
                    IDTPE DC      /3E00      STMNT ID TYPE MASK         K1401840
                    IDNRM DC      /01FF      NORM MASK                  K1401850
                    ENDC  DC      /0400      END                        K1401860
                    DOC   DC      /1200      DO                         K1401870
                    BACKC DC      /EC00      BACK SPACE                 K1401880
                    WINDC DC      /0800      REWIND                     K1401890
                    FILEC DC      /FC00      END FILE                   K1401900
                    STOPC DC      /2800      STOP                       K1401910
                    PAUSC DC      /F800      PAUSE                      K1401920
                    CONTQ DC      /2C00-/2600   CONTINUE                K1401930
                    TWO   DC      2          TWO                        K1401940
                    ONE   DC      1          ONE                        K1401950
                    TABLE BSS     126        DO TABLE                   K1401960
                    ERR51 DC      51         ERROR NO. 51               K1401970
                    ERRID DC      /A008      ERROR STMNT ID WORD        K1401980
                    ERSID DC      /A00D      ERROR STMNT ID WITH NO.    K1401990
                    CNTOK DC      /B009      CONTINUE STMNT ID WORD     K1402000
                    ERQ53 DC      53         ERROR NO. 53               K1402010
                    *                                                   K1402020
                    *                                                   K1402030
                    CNTST LD    1 0          LOAD STMNT ID WORD         K1402040
                          S       CNTOK      IS ID WORD OK              K1402050
                          BSC  L  BAKER,+-   BRANCH IF YES              K1402060
                    *                                                   K1402070
                    *                                                   K1402080
                          LD      ERQ53      SET UP ERROR NO. 53        K1402090
                          MDX     CLOS1+1    PUT ERROR STMNT ON STRING  K1402100
                    *                                                   K1402110
                    *                                                   K1402120
                    *                  CHECKS TO INSURE THAT THE DO     K1402130
                    *                  TABLE IS EMPTY AT THE END        K1402140
                    *                  OF PHASE                         K1402150
                    DOTBL LD    3 +4         IS DO TABLE EMPTY          K1402160
                          BSC  L  OUT1,+-    BRANCH IF YES              K1402170
                    *                                                   K1402180
                    *                                                   K1402190
                          STO   1 1          STORE DO RANGE STMNT NO.   K1402200
                          LD    1 0          LOAD STMNT ID WORD         K1402210
                          STO   1 3          PUT BACK ON STRING         K1402220
                          LD      ERR51      LOAD ERROR NO. 51          K1402230
                          STO   1 2          PUT ON STRING              K1402240
                          LD      ERSID      LOAD ERROR STMNT ID WORD   K1402250
                          STO   1 0          PUT ON STRING              K1402260
                          MDX   1 3          MOVE INPUT PT              K1402270
                          MDX   3 -5         MOVE DO TABLE PT           K1402280
                          STX  L1 EOFS       NEW END OF STRING ADDRESS  K1402290
                    *                                                   K1402300
                    *                                                   K1402310
                          LD   L  EOFST      CHECK FOR OVERLAP          K1402320
                          A    L  TWO        BETWEEN STRING AND         K1402330
                          S    L  EOFS       SYMBOL TABLE               K1402340
                          BSC  L  DOTBL,-    BRANCH IF NO OVERLAP       K1402350
                    *                                                   K1402360
                    *                                                   K1402370
                    JIMY  LD   L  ONE        SET UP                     K1402380
                          STO  L  ERROR      OVERLAP ERROR              K1402390
                    *                                                   K1402400
                    *                  TRANSFERS TO THE ROL ROUTINE     K1402410
                    *                  TO LOAD THE NEXT PHASE           K1402420
                    OUT   LDX  I1 NXTPH+1    LOAD PARAM FOR READING     K1402430
                          LDD     NXTPH+2    NEXT PHASE                 K1402440
                          BSC  L  ROL        GO TO READ NEXT PHASE      K1402450
                          BSS  E  0                                     K1402460
                    NXTPH DC      45         ID OF NEXT PHASE           K1402470
                          BSS     3          LOADER TABLE FOR NEXT PHS  K1402480
                    *                                                   K1402490
                    *                  CONSTANTS                        K1402500
                    NRMSV DC      0          TEMPORARY STORGE FOR NORM  K1402510
                    ERRNO DC      0          ERROR NUMBER               K1402520
                    CONTC DC      /2C00      CONTINUE ID TYPE           K1402530
                    DIP   DC      0          TEMPORARY STORAGE          K1402540
                    DOTID DC      /C027      DO STMNT ID WORD - NORM 9  K1402550
                    ERR52 DC      52         ERROR NO. 52               K1402560
                    TBCN  DC      TABLE+121  END OF TABLE               K1402570
                    *                                                   K1402580
                    *                                                   K1402590
                    *                  CHECKS FOR MORE THAN 25 ENTRIES  K1402600
                    *                  IN THE DO TABLE                  K1402610
                    FULL  STX   3 DIP        STORE DO TABLE POINTER     K1402620
                          LD      DIP        IS DO TABLE                K1402630
                          S       TBCN       FULL                       K1402640
                          BSC  L  CEE,Z+     BRANCH NOT FULL            K1402650
                    *                                                   K1402660
                    *                                                   K1402670
                    CLOS1 LD      ERR52      SET UP                     K1402680
                          STO     ERRNO      ERROR NO. 52               K1402690
                          STX   3 SAVE3+1    SAVE DO TABLE PTR          K1402700
                    *                                                   K1402710
                    *                  REPLACES THE ERRONEOUS STMNT     K1402720
                    *                  WITH AN ERROR MESSAGE            K1402730
                    *                  CLOSES UP THE STRING             K1402740
                    CLOSE LDX  I1 PAVE       LOAD STMNT ID WORD ADDR    K1402750
                          LD    1 0          LOAD STMNT ID WORD         K1402760
                          SRA     2          GET STMNT                  K1402770
                          AND  L  IDNRM      NORM                       K1402780
                          STO     NRMSV      SAVE NORM                  K1402790
                          A    L  PAVE       GET ADDRESS OF NEXT STMNT  K1402800
                          STO     GET+1      ID WORD                    K1402810
                    GET   LDX  L2 0          INITIALIZE LOOP INPUT PT   K1402820
                          LD    1 0          LOAD STMNT ID WORD         K1402830
                          BSC  L  CALD,E     BRANCH IF HAVE STMNT NO.   K1402840
                          MDX     CALD+4                                K1402850
                    CALD  LD      ERIID      LOAD ERROR ID WORD         K1402860
                          STO   1 0          PUT ON STRING              K1402870
                          MDX   1 1          MOVE PT OVER STMNT NO.     K1402880
                          MDX     CALD+7     PUT ERROR NO. ON STRING    K1402890
                          LD   L  ERRID      LOAD ERROR ID WORD         K1402900
                          STO   1 0          PUT ON STRING              K1402910
                          LD      ERRNO      LOAD ERROR NO.             K1402920
                          STO   1 1          PUT ON STRING              K1402930
                          MDX   1 1          MOVE POINTER               K1402940
                          LD   L  EOFS       FIND RANGE                 K1402950
                          S    L  PAVE       OF STRING                  K1402960
                          S       NRMSV      TO BE                      K1402970
                          STO     RANGE+1    MOVED                      K1402980
                    RANGE LDX  L3 0          INITIALIZE RANGE CTR       K1402990
                          MDX   3 1                                     K1403000
                    LOOP1 LD    2 0          MOVE WORD DOWN             K1403010
                          STO   1 1          IN STRING                  K1403020
                          MDX   1 1          MOVE POINTERS              K1403030
                          MDX   2 1                                     K1403040
                          MDX   3 -1         DECREMENT RANGE COUNTER    K1403050
                          MDX     LOOP1      CONTINUE LOOP              K1403060
                          STX  L1 EOFS       NEW END OF STRING ADDRESS  K1403070
                          LDX  I1 PAVE       RESTORE INPUT PT           K1403080
                    SAVE3 LDX  L3 0          RESTORE DO TBL PT          K1403090
                          LDX  L  BAKER      CHECK FOR STMNT NO.        K1403100
                    *                                                   K1403110
                    *                  CONSTANTS                        K1403120
                    WHY   DC      0          TEMPORARY STORAGE FOR PT   K1403130
                    LOADI DC      /0800      LOAD INSTRUCTION           K1403140
                    ADDI  DC      /1800      ADD INSTRUCTION            K1403150
                    STOI  DC      /1000      STORE INSTRUCTION          K1403160
                    SUBTI DC      /2000      SUBTRACT INSTRUCTION       K1403170
                    BSCI  DC      /5008      BSC I  INSTRUCTION         K1403180
                    DOXID DC      /3000      DO STMNT ID                K1403190
                    ERIID DC      /A00D      ERROR STMNT ID WORD        K1403200
                    FIDWD DC      /C-/F      FORMAT                 2-6 K1403210
                    NO51E DC      51         ERROR NO 51                K1403220
                    *                                                   K1403230
                    *                                                   K1403240
                    *                  CHECKS FOR AN EQUIVALENCE STMNT  K1403250
                    *                  NO. IN THE DO TABLE              K1403260
                    *                  CHECKS FOR A TRANSFER STMNT      K1403270
                    TINUE LD    1 1          LOAD WORD                  K1403280
                          S     3 4          IS IT DO RANGE STMNT NO.   K1403290
                          BSC  L  BAKER+3,Z  BRANCH IF NOT              K1403300
                    *                                                   K1403310
                    *                                                   K1403320
                          BSI  L  TRCKS      CHECK IF TRANSFER STMNT    K1403330
                          DC      *+1        BRANCH IF TRANSFER         K1403340
                          DC      PPEM       BRANCH IF NO TRANSFER      K1403350
                    *                                                   K1403360
                    *                                                   K1403370
                    ER51  LD      NO51E      SET UP                     K1403380
                          MDX     CLOS1+1    ERROR NO. 51               K1403390
                    *                                                   K1403400
                    *                                                   K1403410
                    PPEM  S       FIDWD      IS IT FORMAT STMNT         K1403420
                    *                  CHECKS THE STMNT ID WORD FOR THE K1403430
                    *                  REFERENCED INDICATOR             K1403440
                    *                  CHECKS FOR A CONTINUE STMNT      K1403450
                          BSC  L  ER51,+-    BRANCH IF YES              K1403460
                    *                                                   K1403470
                    *                                                   K1403480
                          LD    1 0          PUT REFERENCED STMNT BIT   K1403490
                          OR   L  TWO        IN STMNT ID                K1403500
                          STO   1 0          PUT BACK ON STRING         K1403510
                    *                                                   K1403520
                    *                                                   K1403530
                          STX   1 WHY        SAVE INPUT PT              K1403540
                    *                                                   K1403550
                    *                                                   K1403560
                          LD    1 0          LOAD STMNT ID WORD         K1403570
                          SRA     2          GET STMNT                  K1403580
                          AND  L  IDTPE      ID TYPE                    K1403590
                          S       CONTC      IS IT CONTINUE             K1403600
                          BSC  L  MOVE1,+-   BRANCH IF YES              K1403610
                    *                                                   K1403620
                    *                                                   K1403630
                    LIZ1  BSI  L  MOVE       MOVE PT TO NEXT STMNT      K1403640
                          MDX     LIZ        OPEN UP STRING             K1403650
                    *                                                   K1403660
                    *                                                   K1403670
                    *                  CHANGES THE ID WORD OF CONTINUE  K1403680
                    *                  STMNTS DEFINING THE DO RANGE     K1403690
                    *                  TO THE DO TEST TYPE              K1403700
                    *                  OPENS THE STRING SIX MORE WORDS  K1403710
                    MOVE1 LD      DOTID      CHANGE ID WORD             K1403720
                          STO   1 0          TO DO TEST                 K1403730
                    *                                                   K1403740
                    *                                                   K1403750
                          MDX   1 2          MOVE POINTER               K1403760
                    *                                                   K1403770
                    *                  OPEN STRING 6 OR 7 WORDS         K1403780
                          STX   1 TEM        SAVE INPUT POINTER         K1403790
                          LD   L  EOFS       GET SIZE OF STRING         K1403800
                          S       TEM        TO BE MOVED                K1403810
                          STO     BOUND+1    STORE SIZE TO BE MOVED     K1403820
                    BOUND LDX  L1 0          INITIALIZE SIZE CTR        K1403830
                          MDX   1 1                                     K1403840
                          LDX  I2 EOFS       INITIALIZE LOOP INPUT PT   K1403850
                          LD    3 3          LOAD DO INCREMENT          K1403860
                          BSC  L  TRYMR,Z    BRANCH IF NOT ZERO         K1403870
                          MDX   2 7          MODIFY LOOP PT             K1403880
                          LD      LD7        LOAD INPUT INSTRUCTION     K1403890
                          MDX     ONWTH      MOVE STRING UP             K1403900
                    TRYMR LD   I  PAVE       LOAD STMNT ID WORD         K1403910
                          S       FRO        SUBTRACT ONE FROM NORM     K1403920
                          STO  I  PAVE       PUT BACK IN STRING         K1403930
                          LD      LD6        LOAD INPUT INSTRUCTION     K1403940
                          MDX   2 6          MODIFY LOOP POINTER        K1403950
                    ONWTH STO     LOOZ       PUT INSTRUCTION IN LOOP    K1403960
                          STX  L2 EOFS       NEW END OF STRING ADDRESS  K1403970
                    LOOZ  LD    2 -6         LOAD WORD ON STRING        K1403980
                          STO   2 0          PUT IN NEW LOCATION        K1403990
                          MDX   2 -1         MOVE PT                    K1404000
                          MDX   1 -1         DECREMENT CTR              K1404010
                          MDX     LOOZ       CONTINUE LOOP              K1404020
                          LDX  I1 TEM        RESTORE IN PUT PT          K1404030
                    *                                                   K1404040
                    *                                                   K1404050
                    *                  CHECKS FOR A SYM TBL OVERLAP     K1404060
                    *                  INSERTS THE DO TEST CODING       K1404070
                    *                  INTO THE STMNT STRING            K1404080
                    OVLAP LD   L  EOFST      IS THERE                   K1404090
                          A    L  TWO        OVERLAP BETWEEN            K1404100
                          S    L  EOFS       STRING AND SYMBOL TABLE    K1404110
                          BSC  L  JIMY,+Z    BRANCH IF YES              K1404120
                    *                                                   K1404130
                    *                                                   K1404140
                          LD    3 3          LOAD DO INCREMENT          K1404150
                          BSC  L  NASTY,+-   BRANCH IF ZERO             K1404160
                    *                                                   K1404170
                    *                  INSERT DO TEST                   K1404180
                          LD    3 0          LOAD DO INDEX - COMBINE    K1404190
                          AND     MASK5      WITH LOAD INSTRUCTION -    K1404200
                          OR      LOADI      PUT ON STRING              K1404210
                          STO   1 0          *****   LD      INDEX      K1404220
                          LD    3 3          LOAD INCREMENT - COMBINE   K1404230
                          AND     MASK5      WITH ADD INSTRUCTION - PUT K1404240
                          OR      ADDI       ON STRING                  K1404250
                          STO   1 1          *****   A       INCREMENT  K1404260
                          LD    3 0          LOAD INDEX - COMBINE WITH  K1404270
                          AND     MASK5      STORE INSTRUCTION - PUT    K1404280
                          OR      STOI       ON STRING                  K1404290
                          STO   1 2          *****   STO     INDEX      K1404300
                    XYZ   LD    3 2          LOAD TEST VALUE - COMBINE  K1404310
                          AND     MASK5      WITH SUBTRACT INSTRUCTION  K1404320
                          OR      SUBTI      - PUT ON STRING            K1404330
                          STO   1 3          *****   S       TEST VALUE K1404340
                          LD      BSCI       PUT BSC I ON STRING        K1404350
                          STO   1 4          PUT TEST STMNT NO.         K1404360
                          LD    3 1          ON STRING                  K1404370
                          STO   1 5          *****   BSC   I *-*,-      K1404380
                          MDX   3 -5         REMOVE DO TABLE ENTRY      K1404390
                    *                                                   K1404400
                    *                                                   K1404410
                          LDX  I1 WHY        RESTORE INPUT PT           K1404420
                          LDX  L  BAKER      CHECK FOR STMNT NO.        K1404430
                    *                                                   K1404440
                    *                  INSERTS THE SPECIAL DO TEST INTO K1404450
                    *                  THE STRING WHEN THE INCREMENT    K1404460
                    *                  IS IMPLIED                       K1404470
                    NASTY LD      MDXI       PUT MDX I ON STRING        K1404480
                          STO   1 0                                     K1404490
                          LD    3 0          LOAD INDEX - PUT ON STRING K1404500
                          STO   1 1          *****   MDX   I INDEX      K1404510
                          LD      NOPI       LOAD NOP - PUT ON STRING   K1404520
                          STO   1 2          *****   NOP                K1404530
                          MDX   1 1          MOVE INPUT POINTER         K1404540
                          LD    3 0          LOAD INDEX - COMBINE WITH  K1404550
                          AND     MASK5      LOAD INSTRUCTION - PUT ON  K1404560
                          OR      LOADI      STRING                     K1404570
                          STO   1 2          *****   LD      INDEX      K1404580
                          MDX     XYZ        INSERT REST OF TEST        K1404590
                    *                                                   K1404600
                    *                  CONSTANTS                        K1404610
                    TEM   DC      *-*        TEMPORARY STORAGE          K1404620
                    FRO   DC      4          ONE COUNT FOR NORM         K1404630
                    DOID  DC      /C024      DO ID WORD                 K1404640
                    COLON DC      /32        COLON                      K1404650
                    MASK  DC      /07FF      SYMBOL TABLE POINTER MASK  K1404660
                    THRE  DC      3          THREE                      K1404670
                    MASK4 DC      /0200      MASK TO CHECK IF STMNT NO. K1404680
                    NORM4 DC      0                                     K1404690
                    MASK5 DC      /87FF      INSTRUCTION MASK           K1404700
                    MDXI  DC      /5101      MDX I INSTRUCTION          K1404710
                    LD6   LD    2 -6         LOAD INSTRUCTION           K1404720
                    LD7   LD    2 -7         LOAD INSTRUCTION           K1404730
                    LD8   LD    2 -8         LOAD INSTRUCTION           K1404740
                    NOPI  DC      /6000      NO-OP INSTRUCTION          K1404750
                    M2S   DC      /C01C      BASIC DO TEST ID WORD      K1404760
                    H0600 DC      /0600      END OF CALL PDUMP LIST 2-9 K1404765
                    *                                                   K1404770
                    *                                                   K1404780
                    *                  CHECKS FOR A DO STMNT. IF NOT    K1404790
                    *                  FOUND, OPENS THE STRING SEVEN    K1404800
                    *                  WORDS - INSERTS THE DO TEST      K1404810
                    *                  ID WORD                          K1404820
                    LIZ   LD    1 0          LOAD STMNT ID WORD         K1404830
                          SRA     2          GET STMNT                  K1404840
                          AND  L  IDTPE      ID TYPE                    K1404850
                          S    L  DOXID      IS IT DO STMNT             K1404860
                          BSC  L  LIZ1,+-    BRANCH IF YES              K1404870
                    *                                                   K1404872
                          S       H0600      CHECK FOR END OF PDUMP 2-9 K1404874
                          BSC  L  LIZ1,+-    BRANCH IF YES          2-9 K1404876
                    *                                                   K1404880
                    *                  OPEN STRING 7 OR 8 WORDS         K1404890
                          STX   1 TEM        SAVE INPUT POINTER         K1404900
                          LD   L  EOFS       GET SIZE                   K1404910
                          S       TEM        OF STRING                  K1404920
                          A    L  ONE        TO BE                      K1404930
                          STO     BOUN+1     MOVED                      K1404940
                    BOUN  LDX  L1 0          INITIALIZE STRING SIZE CTR K1404950
                          LDX  I2 EOFS       INITIALIZE LOOP INPUT PT   K1404960
                          LD    3 3          LOAD DO LOOP INCREMENT     K1404970
                          BSC  L  MRXY,Z     BRANCH NOT ZERO            K1404980
                          MDX   2 8          MODIFY LOOP POINTER        K1404990
                          LD      LD8        LOAD INPUT INSTRUCTION     K1405000
                          MDX     ONON       GO STORE INPUT INSTRUCTION K1405010
                    MRXY  LD      LD7        LOAD INPUT INSTRUCTION     K1405020
                          MDX   2 7          MODIFY LOOP POINTER        K1405030
                    ONON  STO     LOOT       SAVE INPUT INSTRUCTION     K1405040
                          STX  L2 EOFS       NEW END OF STRING ADDRESS  K1405050
                    LOOT  LD    2 -7         MOVE WORD UP               K1405060
                          STO   2 0          TO NEW LOCATION            K1405070
                          MDX   2 -1         MOVE INPUT POINTER         K1405080
                          MDX   1 -1         DECREMENT COUNTER          K1405090
                          MDX     LOOT       CONTINUE LOOP              K1405100
                    *                                                   K1405110
                    *                  INSERT DO TEST ID WORD           K1405120
                          LDX  I1 TEM        RESET INPUT POINTER        K1405130
                          LD      LD7        GET SIZE OF INSTRUCTION    K1405140
                          S       LOOT       STRING TO BE OUTPUTTED     K1405150
                          SLA     2          COMBINE THIS SIZE WITH     K1405160
                          A       M2S        DO ID WORD                 K1405170
                          STO   1 0          PLACE ON STRING            K1405180
                    *                                                   K1405190
                    *                                                   K1405200
                          MDX   1 1          MOVE INPUT POINTER         K1405210
                          MDX     OVLAP      CHECK OVERLAP              K1405220
                    *                                                   K1405230
                    *                  CONSTANTS                        K1405240
                    ERR53 DC      53         ERROR NO. 53               K1405250
                    PAVE  DC      0          STORAGE FOR ID WORD ADDR   K1405260
                    X32   DC      32         DEFINED VARIABLE BIT       K1405270
                    *                                                   K1405280
                    *                  INITIALIZES TO SCAN THE STMNT    K1405290
                    *                  GETS THE STMNT NO. FROM THE      K1405300
                    *                  SYM TBL                          K1405310
                    CEE   MDX   3 5          MOVE TBL PTR TO NEXT POS   K1405320
                          LD    1 0          LOAD STMNT ID WORD         K1405330
                          BSC     E          SKIP IF NO STMNT NO.       K1405340
                          MDX   1 1          MOVE PT OVER STMNT NO.     K1405350
                          MDX   1 1          MOVE POINTER               K1405360
                    *                                                   K1405370
                    *                                                   K1405380
                          LD    1 0          LOAD WORD                  K1405390
                          BSI  L  CHECK      GET SYMBOL TABLE ID WORD   K1405400
                          AND     MASK4      IS IT                      K1405410
                          EOR     MASK4      STMNT NUMBER               K1405420
                          BSC  L  HAP,+-     BRANCH IF YES              K1405430
                    *                                                   K1405440
                    *                                                   K1405450
                    ER53  DC      *-*        ENTRY POINT                K1405460
                          EOR     H4080      CHECK IF SUBPROGRAM        K1405470
                          BSC  L  R53,+-     NO, GO INDICATE ERROR      K1405480
                          LD   L  SORF       IS IT FUNCTION SUBPROGRAM  K1405490
                          BSC  L  R53,+      BRANCH IF NOT              K1405500
                          LD   L  FNAME      IS IT THIS ONE             K1405510
                          S     1 0                                     K1405520
                          BSC  I  ER53,+-    RETURN IF OK           2-7 K1405530
                    R53   LD      ERR53      SET UP                     K1405540
                          BSC  L  CLOS1+1    ERROR NO. 53               K1405550
                    *                                                   K1405560
                    *                                                   K1405570
                    *                  PUTS THE DO RANGE STMNT NO. INT  K1405580
                    *                  WORD 5 OF THE DO TBL ENTRY       K1405590
                    *                  CHECKS FOR VALID VARIABLES       K1405600
                    *                  INDICATES DEFINITION OF ALL      K1405610
                    *                  DEFINED VARIABLES                K1405620
                    HAP   LD    1 0          LOAD STMNT NUMBER          K1405630
                          STO   3 4          PUT IN DO TABLE            K1405640
                    *                                                   K1405650
                    *                                                   K1405660
                          MDX   1 1          MOVE POINTER               K1405670
                    *                                                   K1405680
                    *                                                   K1405690
                          LD    1 0          LOAD WORD                  K1405700
                          S       COLON      IS CHARACTER COLON         K1405710
                          BSC  L  R53,Z      BRANCH IF NOT              K1405720
                    *                                                   K1405730
                    *                                                   K1405740
                          MDX   1 1          MOVE STRING POINTER        K1405750
                    *                                                   K1405760
                    *                  LEGAL VARIABLE                   K1405770
                          LD    1 0          LOAD WORD                  K1405780
                          BSI  L  CHECK      GET TBL ID WORD            K1405790
                          STO     SAVES      SAVE SYM TBL ID WORD       K1405800
                          AND  L  HDBDE      IS IT LEGAL,               K1405810
                          EOR     MASK1      INTEGER VARIABLE           K1405820
                          BSI  L  ER53,Z     BRANCH IF NOT              K1405830
                    *                                                   K1405840
                    *                                                   K1405850
                          LD      SAVES      LOAD STMNT ID WORD         K1405860
                          OR      X32        PUT IN DEFINED VAR BIT     K1405870
                          STO   2 0          PUT BACK IN SYMBOL TABLE   K1405880
                    *                                                   K1405890
                    *                                                   K1405900
                          LD   L  SORF       LOAD SORF                  K1405910
                          BSC     +          SKIP IF FUNCTION           K1405920
                          MDX     PEND       PUT VARIABLE IN DO TABLE   K1405930
                          LD      SAVES      LOAD SYM TBL ID WORD       K1405940
                          AND     MASK7      IS VAR IN COMMON OR DUMMY  K1405950
                          BSC  L  PEND,+-    ARGUMENT - BRANCH IF NO    K1405960
                    *                                                   K1405970
                    *                                                   K1405980
                          LD      ERR55      SET UP ERROR NO. 55        K1405990
                          BSC  L  CLOS1+1    PUT ERROR STMNT ON STRING  K1406000
                    *                                                   K1406010
                    *                                                   K1406020
                    *                  PLACES THE INDEX VARIABLE INTO   K1406030
                    *                  WORD 1 OF THE DO TBL ENTRY       K1406040
                    PEND  LD    1 0          LOAD VARIABLE              K1406050
                          STO   3 0          PUT IN DO TABLE            K1406060
                    *                                                   K1406070
                    *                                                   K1406080
                          MDX   1 1          MOVE STRING POINTER        K1406090
                    *                                                   K1406100
                    *                                                   K1406110
                          LD    1 0          LOAD WORD                  K1406120
                          S       EQAL       IS CHARACTER EQUAL SIGN    K1406130
                          BSC  L  R53,Z      BRANCH IF NOT              K1406140
                    *                                                   K1406150
                    *                                                   K1406160
                          MDX   1 1          MOVE POINTER               K1406170
                    *                                                   K1406180
                    *                                                   K1406190
                          LD    1 0          LOAD WORD                  K1406200
                          BSI  L  CHECK      GET SYMBOL TABLE ID WORD   K1406210
                          AND     MASK3      IS IT A VALID CONSTANT OR  K1406220
                          EOR     MASK1      VARIABLE INTEGER           K1406230
                          BSI  L  ER53,Z     BRANCH IF NOT              K1406240
                    *                                                   K1406250
                    *                                                   K1406260
                          LD    2 1          LOAD WORD                  K1406270
                          BSC     +-         SKIP IF NON-ZERO           K1406280
                          MDX     AA         ERROR IF ZERO              K1406290
                    *                                                   K1406300
                    *                  SAVE M1 FOR DO INITIALIZE        K1406310
                    AAA   LD    1 0          LOAD INITIAL VALUE         K1406320
                          STO     M1         OF INDEX                   K1406330
                    *                                                   K1406340
                    *                                                   K1406350
                          MDX   1 1          MOVE POINTER               K1406360
                          MDX     A          GET TEST VALUE             K1406370
                    *                                                   K1406380
                    *                                                   K1406390
                    AA    LD      ERR54      SET UP ERROR NO. 54        K1406400
                          BSC  L  CLOS1+1    PUT ERROR STMNT ON STRING  K1406410
                    *                                                   K1406420
                    *                  CONSTANTS                        K1406430
                    SAVES DC      0          STORAGE FOR SYM TBL ID     K1406440
                    H4080 DC      /4080      SUBR SYM TBL ID            K1406450
                    H8000 DC      /8000      USEFUL CONSTANT            K1406460
                    MASK1 DC      /4000      MASK TO TEST FOR INTEGER   K1406470
                    MASK7 DC      /2400      COMMON OR DUMMY ARG MASK   K1406480
                    M1    DC      0          INITIAL INDEX VALUE        K1406490
                    EQAL  DC      /000E      EQUAL SIGN                 K1406500
                    MASK3 DC      /5BDE      CON OR VAR INTEGER MASK    K1406510
                    COME  DC      /0012      COMMA                      K1406520
                    DOIID DC      /580C      DO ID TYPE - NORM 3        K1406530
                    CATOR DC      /0220      SYM TBL ID FOR STMNT NO.   K1406540
                    SIGN  DC      /8001      SIGN BITS                  K1406550
                    ERR54 DC      54         ERROR NO. 54               K1406560
                    ERR55 DC      55         ERROR NO. 55               K1406570
                    *                                                   K1406580
                    *                                                   K1406590
                    *                  PLACES A ZERO AS THE INCREMENT   K1406600
                    *                  INTO WORD 4 OF THE DO TBL ENTRY  K1406610
                    *                  PUTS THE TEST VALUE CONSTANT     K1406620
                    *                  INTO WORD 3 OF THE DO TBL ENTRY  K1406630
                    DEMP  SLA     16         PUT ZERO IN DO TABLE AS    K1406640
                          STO   3 3          VALUE OF INCREMENT         K1406650
                          MDX     SEM        GO TO END OF STMNT         K1406660
                    *                                                   K1406670
                    *                                                   K1406680
                    A     LD    1 0          LOAD WORD                  K1406690
                          S       COME       IS CHARACTER COMMA         K1406700
                          BSC  L  R53,Z      BRANCH IF NO               K1406710
                    *                                                   K1406720
                    *                                                   K1406730
                          MDX   1 1          MOVE STRING POINTER        K1406740
                    *                                                   K1406750
                    *                                                   K1406760
                          LD    1 0          LOAD WORD                  K1406770
                          BSI  L  CHECK      GET SYM TBL ID WORD        K1406780
                          AND     MASK3      IS IT VALID INTEGER        K1406790
                          EOR     MASK1      CONSTANT OR VARIABLE       K1406800
                          BSI  L  ER53,Z     BRANCH IF NO               K1406810
                    *                                                   K1406820
                    *                                                   K1406830
                          LD    1 0          PUT INTEGER IN DO TABLE    K1406840
                          STO   3 2          AS TEST VALUE              K1406850
                    *                                                   K1406860
                    *                                                   K1406870
                          MDX   1 1          MOVE STRING POINTER        K1406880
                    *                                                   K1406890
                    *                                                   K1406900
                          LD    1 0          LOAD CHARACTER             K1406910
                          S       COME       IS CHARACTER COMMA         K1406920
                          BSC  L  DEMP,Z     BRANCH IF NO               K1406930
                    *                                                   K1406940
                    *                                                   K1406950
                          MDX   1 1          MOVE STRING POINTER        K1406960
                    *                                                   K1406970
                    *                                                   K1406980
                          LD    1 0          LOAD INCREMENT             K1406990
                          BSI  L  CHECK      GET SYM TBL ID WORD        K1407000
                          AND     MASK3      IS IT VALID CONSTANT OR    K1407010
                          EOR     MASK1      VARIABLE INTEGER           K1407020
                          BSI  L  ER53,Z     BRANCH IF NOT              K1407030
                    *                                                   K1407040
                    *                                                   K1407050
                          LD    1 0          PUT INTEGER IN DO TABLE    K1407060
                          STO   3 3          AS INCREMENT               K1407070
                    *                                                   K1407080
                    *                                                   K1407090
                          MDX   1 1          MOVE STRING POINTER        K1407100
                    *                                                   K1407110
                    *                                                   K1407120
                    *                                                   K1407130
                    *                  PLACES THE DO INITIALIZE CODING  K1407140
                    *                  ON THE STRING                    K1407150
                    *                  CLOSES UP THE STRING             K1407160
                    SEM   LD    1 0          LOAD CHARACTER             K1407170
                          BSC  L  R53,Z      BRANCH IF NOT SEMI-COLON   K1407180
                    *                                                   K1407190
                    *                  PUT OUT DO INITIALIZE            K1407200
                          MDX   1 1          MOVE STRING PT TO NEXT     K1407210
                          STX   1 VEN+1      STMNT - SAVE ADDRESS       K1407220
                          LDX  I1 PAVE       LOAD PRESENT STMNT ID ADDR K1407230
                          LD    1 0          LOAD STMNT ID WORD         K1407240
                          SRA     2          GET STMNT NORM             K1407250
                          AND  L  IDNRM                                 K1407260
                          STO  L  NRMSV      SAVE NORM                  K1407270
                          LD    1 0          LOAD STMNT ID WORD         K1407280
                          BSC     E          SKIP IF NO STMNT NO.       K1407290
                          MDX     XYZ1       PUT IN CORRECT ID WORD     K1407300
                          LD      DOIID      LOAD DO STMNT ID WORD      K1407310
                          STO   1 0          PUT ON STRING              K1407320
                    XYZ2  LD      M1         LOAD INITIAL INDEX VALUE-  K1407330
                          OR   L  LOADI      COMBINE WITH LOAD INST     K1407340
                          STO   1 1          *****   LD     INITIAL     K1407350
                          LD    3 0          LOAD INDEX - COMBINE WITH  K1407360
                          OR   L  STOI       STORE INSTRUCTION - OUTPUT K1407370
                          STO   1 2          *****   STO    INDEX       K1407380
                          MDX   1 2          MOVE STRING POINTER        K1407390
                    *                                                   K1407400
                    *                  CLOSE UP STRING                  K1407410
                          STX   3 HEN+1      SAVE DO TABLE POINTER      K1407420
                    VEN   LDX  L2 0          LOAD ADDR OF NEXT STMNT    K1407430
                          LD   L  EOFS       GET SIZE                   K1407440
                          S    L  PAVE       OF STRING                  K1407450
                          S    L  NRMSV      TO BE MOVED                K1407460
                          STO     VEN1+1     PUT IN COUNTER             K1407470
                    VEN1  LDX  L3 0          INITIALIZE COUNTER         K1407480
                          MDX   3 1                                     K1407490
                    POOL  LD    2 0          MOVE WORD DOWN             K1407500
                          STO   1 1          IN STRING                  K1407510
                          MDX   1 1          MOVE POINTERS              K1407520
                          MDX   2 1                                     K1407530
                          MDX   3 -1         DECREMENT COUNTERS         K1407540
                          MDX     POOL       CONTINUE LOOP              K1407550
                          STX  L1 EOFS       NEW END OF STRING ADDRESS  K1407560
                          LDX  I1 PAVE       RESTORE INPUT POINTER      K1407570
                    HEN   LDX  L3 0          RESTORE DO TABLE POINTER   K1407580
                    *                                                   K1407590
                    *                                                   K1407600
                    *                  CHECKS FOR A NUMBERED STMNT      K1407610
                    *                  FOLLOWING THE DO STMNT           K1407620
                    *                  IF NUMBERED STMNT NOT FOUND,     K1407630
                    *                  GENERATES A LABEL AND INSERTS    K1407640
                    *                  IT IN THE SYM TBL                K1407650
                    MUIT  BSI  L  MOVE       MOVE TO NEXT STMNT         K1407660
                    *                                                   K1407670
                    *                                                   K1407680
                          LD    1 0          DOES STMNT HAVE STMNT NO.  K1407690
                          BSC  L  HOHO,E     BRANCH IF YES              K1407700
                    *                                                   K1407710
                    *                                                   K1407720
                          A       F5         ADD STMNT NO. BITS TO ID   K1407730
                          STO   1 0          PUT ON STRING              K1407740
                    *                                                   K1407750
                    *                                                   K1407760
                          MDX   1 1          MOVE STRING POINTER        K1407770
                    *                                                   K1407780
                    *                                                   K1407790
                          BSI  L  ROUT       OPEN STRING ONE WORD       K1407800
                    *                                                   K1407810
                    *                                                   K1407820
                          LDX  I2 EOFST      LOAD END OF SYM TBL ADDR   K1407830
                          SLT     16         CLEAR NEXT TWO             K1407840
                          STO   2 1          WORDS IN                   K1407850
                          STO   2 2          SYMBOL TABLE               K1407860
                          LD      CATOR      LOAD STMNT NO. SYM TBL ID  K1407870
                          STO   2 0          PUT IN SYM TBL             K1407880
                          LD   L  SOFST      GET SIZE OF                K1407890
                          S    L  EOFST      SYMBOL TABLE               K1407900
                          SRT     16         POSITION FOR DIVIDE        K1407910
                          D    L  THRE       GET NO. OF                 K1407920
                          A       SIGN       SYMBOL TABLE ENTRY         K1407930
                          STO   1 0          PUT IN STRING              K1407940
                          MDX   1 -1         MOVE PT TO STMNT ID WORD   K1407950
                          MDX  L  EOFST,-3   MOVE SYMBOL TABLE POINTERS K1407960
                          MDX  L  SOFXT,-3                              K1407970
                          MDX  L  SOFGT,-3                              K1407980
                    *                                                   K1407990
                    *                                                   K1408000
                          LD   L  EOFST      CHECK FOR                  K1408010
                          A    L  TWO        OVERLAP BETWEEN STRING     K1408020
                          S    L  EOFS       AND SYMBOL TABLE           K1408030
                          BSC  L  JIMY,+Z    BRANCH IF OVERLAP          K1408040
                    *                                                   K1408050
                    *                                                   K1408060
                    *                  PLACES THE GENERATED LABEL OR    K1408070
                    *                  STMNT NO. FOR THE DO TEST INTO   K1408080
                    *                  WORD 2 OF THE DO TABLE ENTRY     K1408090
                    HAH   LD    1 1          LOAD STMNT NO.             K1408100
                          STO   3 1          PUT IN SYMBOL TABLE        K1408110
                          LDX  L  ABEL       CHECK NEXT STMNT.          K1408120
                    *                                                   K1408130
                    *                                                   K1408140
                    XYZ1  LD   L  DOIID      LOAD DO STMNT ID           K1408150
                    *                  PLACES THE DO ID WORD INTO THE   K1408160
                    *                  STATEMENT STRING                 K1408170
                          A       F5         PUT IN STMNT NO. BITS      K1408180
                          STO   1 0          PUT ON STRING              K1408190
                          MDX   1 1          MOVE PT OVER STMNT NO.     K1408200
                          MDX     XYZ2       RETURN                     K1408210
                    *                                                   K1408220
                    *                                                   K1408230
                    *                  CHECKS FOR FORMAT STATEMENTS     K1408240
                    HOHO  SRA     11         GET STMNT ID TYPE          K1408250
                          S       HC         IS IT FORMAT STMNT         K1408260
                          BSC  L  MUIT,+-    BRANCH IF YES              K1408270
                          MDX     HAH        PUT STMNT NO. IN DO TBL    K1408280
                    *                                                   K1408290
                    *                  CONSTANTS                        K1408300
                    HC    DC      /C         FORMAT STMNT ID TYPE       K1408310
                    F5    DC      5          BITS FOR STMNT NO.         K1408320
                    CALN1 DC      /1A00      BACKSPACE CALL             K1408330
                    CALN2 DC      /1B00      REWIND CALL                K1408340
                    CALN3 DC      /1A80      END FILE CALL              K1408350
                    CALN4 DC      /1B80      STOP CALL                  K1408360
                    CALN5 DC      /1C00      PAUSE CALL                 K1408370
                    CALNO DC      0          CALL STORAGE               K1408380
                    NORM2 DC      0          PAUSE OR STOP SWITCH       K1408390
                    ERR56 DC      56         ERROR NO. 56               K1408400
                    ERR57 DC      57         ERROR NO.57                K1408410
                    ERR58 DC      58         ERROR NO. 58               K1408420
                    ERR59 DC      59         ERROR NO. 59               K1408430
                    ERR60 DC      60         ERROR NO. 60               K1408440
                    *                                                   K1408450
                    *                                                   K1408460
                    CALL1 LD      CALN1      STORE BACKSPACE CALL       K1408470
                          STO     CALNO      IN CALNO                   K1408480
                    *                                                   K1408490
                    *                                                   K1408500
                          LD      ERR56      SET UP                     K1408510
                          STO  L  ERRNO      ERROR NO. 56               K1408520
                          MDX     TED        PUT IN DEVICE NO.          K1408530
                    *                                                   K1408540
                    *                                                   K1408550
                    CALL2 LD      CALN2      PUT REWIND CALL            K1408560
                          STO     CALNO      IN CALNO                   K1408570
                    *                                                   K1408580
                    *                                                   K1408590
                          LD      ERR57      SET UP                     K1408600
                          STO  L  ERRNO      ERROR NO. 57               K1408610
                          MDX     TED        PUT IN DEVICE NO.          K1408620
                    *                                                   K1408630
                    *                                                   K1408640
                    CALL3 LD      CALN3      PUT END FILE               K1408650
                          STO     CALNO      CALL IN CALNO              K1408660
                    *                                                   K1408670
                    *                                                   K1408680
                          LD      ERR58      SET UP                     K1408690
                          STO  L  ERRNO      ERROR NO. 58               K1408700
                          MDX     TED        PUT IN DEVICE NO.          K1408710
                    *                                                   K1408720
                    *                                                   K1408730
                    CALL4 LD      CALN4      PUT STOP CALL              K1408740
                          STO     CALNO      IN CALNO                   K1408750
                    *                                                   K1408760
                    *                                                   K1408770
                          LD      ERR59      SET UP                     K1408780
                          STO  L  ERRNO      ERROR NO. 59               K1408790
                    *                                                   K1408800
                          MDX     FED        CHECK VALID NO.            K1408810
                    *                                                   K1408820
                    *                                                   K1408830
                    CALL5 LD      CALN5      PUT PAUSE CALL             K1408840
                          STO     CALNO      IN CALNO                   K1408850
                    *                                                   K1408860
                    *                                                   K1408870
                          LD      ERR60      SET UP                     K1408880
                          STO  L  ERRNO      ERROR NO. 60               K1408890
                    *                                                   K1408900
                    *                                                   K1408910
                    FED   MDX  L  NORM2,1    TAG PAUSE OR STOP SWITCH   K1408920
                    *                                                   K1408930
                    *                  INITIALIZES TO SCAN THE STMNT    K1408940
                    *                  CHECKS FOR THE SEMICOLON         K1408950
                    *                  OPENS THE STRING ONE WORD        K1408960
                    *                  ADJUSTS THE STMNT NORM           K1408970
                    *                  PLACES THE SYM TBL ADDR OF THE   K1408980
                    *                  CONSTANT ON THE STRING           K1408990
                    TED   LD    1 0          LOAD STMNT ID WORD         K1409000
                          BSC     E          SKIP IF NO STMNT NO.       K1409010
                          MDX   1 1                                     K1409020
                          MDX   1 1          MOVE POINTER               K1409030
                          LD    1 0          LOAD WORD                  K1409040
                          BSI  L  CHECK      GET SYM TBL ID WORD        K1409050
                          STO     HOBBS      SAVE ID WORD               K1409060
                    *                                                   K1409070
                    *                                                   K1409080
                          LD      NORM2      PAUSE OR STOP STMNT        K1409090
                          BSC  L  SHOT,+-    BRANCH IF NOT              K1409100
                    *                                                   K1409110
                    *                                                   K1409120
                          LD    1 0          LOAD WORD                  K1409130
                          BSC  L  SHOE,Z     BRANCH NOT SEMI-COLON      K1409140
                    *                                                   K1409150
                    *                                                   K1409160
                          BSI  L  ROUT       OPEN STRING ONE WORD       K1409170
                    *                                                   K1409180
                    *                                                   K1409190
                          LD   I  PAVE       LOAD STMNT ID WORD         K1409200
                          A       FOUR       ADD ONE TO NORM            K1409210
                          STO  I  PAVE       PUT BACK IN STRING         K1409220
                    *                                                   K1409230
                    *                                                   K1409240
                          BSI  L  BOXX       PUT SYM TBL ADDR ON STRING K1409250
                          MDX     AMIN2+2    PUT CALL ON STRING         K1409260
                    *                                                   K1409270
                    *                  LEGAL VARIABLE                   K1409280
                    SHOT  LD      HOBBS      LOAD SYM TBL ID WORD       K1409290
                          AND     HDBDE      IS IT VALID                K1409300
                          EOR  L  MASK1      INTEGER VARIABLE           K1409310
                          BSC  L  SHOE,Z     BRANCH IF NOT              K1409320
                    *                                                   K1409330
                    *                  PUT OUTPUT IN STRING             K1409340
                    AMIN2 LD    1 0          LOAD DEVICE NO.            K1409350
                          STO   1 1          PUT IN STRING              K1409360
                          LD      CALNO      LOAD CALL                  K1409370
                          STO   1 0          PUT IN STRING              K1409380
                    ZAMIN LDX  I1 PAVE       PLACE PT AT STMNT ID WORD  K1409390
                    *                                                   K1409400
                    *                                                   K1409410
                          SLA     16                                    K1409420
                          STO  L  DEC        CLEAR                      K1409430
                    *                                                   K1409440
                    *                                                   K1409450
                          STO     NORM2      CLEAR PAUSE OR STOP SWITCH K1409460
                          BSC  L  BAKER      CHECK FOR STMNT NO.        K1409470
                    *                                                   K1409480
                    *                  CONSTANTS                        K1409490
                    MASK2 DC      /C000      INTEGER CONSTANT MASK      K1409500
                    HOBBS DC      0          SYM TBL ID WORD            K1409510
                    FOUR  DC      4          CON TO ADD ONE TO NORM     K1409520
                    DEVIL DC      0          TEMPORARY STORAGE          K1409530
                    ZEMP  DC      0          TEMPORARY STORAGE          K1409540
                    C99   DC      9999       MAXIMUM VALUE OF PAUSE     K1409550
                    ERR61 DC      61         ERROR NO. 61               K1409560
                    CON5  DC      /0014-/000F    ERROR TYPE         2-2 K1409570
                    CON6  DC      /000C      FORMAT ID TYPE             K1409580
                    ER62  DC      62         ERROR NO. 62               K1409590
                    END   DC      /1004      END STMNT ID TYPE          K1409600
                    SAVE2 DC      0          TEMPORARY STORAGE          K1409610
                    SAVE1 DC      0          TEMPORARY STORAGE          K1409620
                    SAVE  DC      0          STORAGE FOR STRING POINTER K1409630
                    MASK6 DC      /01FF      NORM MASK                  K1409640
                    HDBDE DC      /DBDE      MASK FOR INTEGER VARIABLE  K1409650
                    *                                                   K1409660
                    *                                                   K1409670
                    SHOE  LD      HOBBS      LOAD SYM TBL ID WORD       K1409680
                          EOR     MASK2      IS IT VALID INTEGER CON    K1409690
                          BSC  L  CLOS1+2,Z  BRANCH IF NOT              K1409700
                    *                                                   K1409710
                    *                       SEMI-COLON                  K1409720
                          LD    1 1          LOAD NEXT WORD             K1409730
                          BSC  L  CLOS1+2,Z  BRANCH IF NOT SEMI-COLON   K1409740
                    *                                                   K1409750
                    *                                                   K1409760
                          LD    2 1          LOAD CONSTANT              K1409770
                          S       C99        IS IT GREATER THAN 9999    K1409780
                          BSC  L  ER61,Z-    BRANCH IF YES              K1409790
                    *                                                   K1409800
                    *                                                   K1409810
                          LD      NORM2      IS STMNT PAUSE OR STOP     K1409820
                          BSC  L  AMIN2,+-   BRANCH IF NOT              K1409830
                    *                                                   K1409840
                    *                                                   K1409850
                          LD    2 1          LOAD CONSTANT              K1409860
                          S    L  TEN        IS IT GREATER THAN 10      K1409870
                          BSC  L  AMIN2,+Z   BRANCH IF NOT              K1409880
                    *                                                   K1409890
                    *                                                   K1409900
                          LD    2 1          LOAD WORD                  K1409910
                          MDX     BTOD       CONVERT TO DECIMAL         K1409920
                    *                                                   K1409930
                    *                  CHECK FOR TRANSFER STMNT         K1409940
                    *                  PRIOR TO THE END STMNT           K1409950
                    OUT1  STX   1 SAVE       SAVE ADDR OF END STMNT     K1409960
                          LD   L  SOFS       IS END STMNT THE           K1409970
                          S       SAVE       FIRST STMNT IN STRING      K1409980
                          BSC  L  TEST,+-    BRANCH TO ERROR IF YES 2-1 K1409990
                          LDX  I2 SOFS       INITIALIZE CHECK POINTER   K1410000
                          STX   2 SAVE2      SAVE CHECK POINTER         K1410010
                          LD    2 0          LOAD STMNT ID WORD         K1410020
                          SRA     2          GET NORM                   K1410030
                          AND     MASK6      OF STATEMENT               K1410040
                          STO     OUT2+1     STORE NORM                 K1410050
                    OUT2  MDX  L2 0          MOVE PT TO NEXT STMNT      K1410060
                          STX   2 SAVE1      SAVE NEW PT ADDRESS        K1410070
                          LD      SAVE1      IS NEW ADDRESS THE ADDRESS K1410080
                          S       SAVE       OF THE END STATEMENT       K1410090
                          BSC     Z+         SKIP IF END            2-1 K1410100
                          MDX     OUT1+8     CHECK NEXT STMNT ON STRING K1410110
                          LDX  I1 SAVE2      ADDR OF STMNT BEFORE END   K1410120
                          LD    1 0          LOAD STMNT ID WORD         K1410130
                          SRA     11         GET STMNT ID TYPE          K1410140
                          S       CON6       IS IT FORMAT STMNT--IF YES K1410150
                          BSC  L  OUT1,+-    CHECK PREVIOUS STMNT       K1410160
                          BSI  L  TRCKS      CHECK FOR TRANSFER STMNT   K1410170
                          DC      OUT        GO TO NEXT PHASE           K1410180
                          DC      *          GO TO NEXT INSTRUCTION     K1410190
                          S       CON5       IS IT ERROR STMNT          K1410200
                          BSC  L  OUT,+-     BRANCH IF YES              K1410210
                    *                                                   K1410220
                    *                                                   K1410230
                    TEST  LDX  I1 EOFS       LOAD PT WITH END OF STRING K1410240
                          LD   L  ERRID      PUT ERROR STMNT ID WORD    K1410250
                          STO   1 0          AT END OF STRING           K1410260
                          LD      ER62       PUT ERROR NO. 62           K1410270
                          STO   1 1          ON STRING                  K1410280
                          LD      END        PUT END STMNT ID WORD      K1410290
                          STO   1 2          ON STRING                  K1410300
                          MDX   1 2          MOVE STRING POINTER        K1410310
                          STX  L1 EOFS       NEW END OF STRING ADDRESS  K1410320
                          BSC  L  OUT        GO TO NEXT PHASE           K1410330
                    *                                                   K1410340
                    *                                                   K1410350
                    ER61  SLA     16         SET UP ERROR NO. 61        K1410360
                          STO  L  NORM2      TURN OFF PAUSE             K1410370
                          LD      ERR61      OR STOP SWITCH             K1410380
                          BSC  L  CLOS1+1    PUT ERROR ON STRING        K1410390
                    *                                                   K1410400
                    *             THIS IS A SUBROUTINE TO GET SYMBOL    K1410410
                    *             TABLE ADDRESS ID AND LOAD ACCUMULATOR K1410420
                    *                                                   K1410430
                    CHECK DC      0          ENTRY POINT                K1410440
                          BSC  L  DEMPY+4,-  RETURN IF SPECIAL OPERATOR K1410450
                          LD    1 0          LOAD WORD                  K1410460
                          AND  L  MASK       GET SYM TBL ENTRY NO.      K1410470
                          M    L  THRE       GET ADDRESS OF ENTRY       K1410480
                          SLT     16         RELATIVE TO START          K1410490
                          STO     DEVIL      OF SYMBOL TABLE            K1410500
                    *                                                   K1410510
                          LD   L  SOFST      GET ABSOLUTE ADDRESS       K1410520
                          S       DEVIL      OF SYMBOL TABLE ENTRY - 3  K1410530
                          STO     DEMPY+1    STORE ABSOLUTE ADDRESS     K1410540
                    DEMPY LDX  L2 0          GET ADDRESS OF             K1410550
                          MDX   2 3          ENTRY ID WORD              K1410560
                          LD    2 0          LOAD SYM TBL ID WORD       K1410570
                          BSC  I  CHECK      RETURN                     K1410580
                    *                                                   K1410590
                    *             THIS IS A SUBROUTINE TO MOVE THE      K1410600
                    *             POINTER TO FOLLOWING STATEMENT        K1410610
                    MOVE  DC      0          ENTRY POINT                K1410620
                          LD    1 0          LOAD STMNT ID WORD         K1410630
                          SRA     2          GET NORM                   K1410640
                          AND  L  IDNRM      OF STATEMENT               K1410650
                          STO     NXID+1     GET ADDR OF NEXT           K1410660
                    NXID  MDX  L1            STMNT ID WORD              K1410670
                          BSC  I  MOVE       RETURN                     K1410680
                    *                                                   K1410690
                    *                                                   K1410700
                    *                  OPENS THE STRING ONE WORD FOR    K1410710
                    *                  INSERTION OF A GENERATED LABEL   K1410720
                    *                                                   K1410730
                    ROUT  DC      0          ENTRY POINT                K1410740
                          STX   1 ZEMP       SAVE STRING POINTER        K1410750
                          LD   L  EOFS       GET SIZE OF                K1410760
                          S    L  ZEMP       STRING TO                  K1410770
                          A    L  ONE        BE MOVED                   K1410780
                    *                                                   K1410790
                          STO     BOND+1     PUT IN COUNTER             K1410800
                    BOND  LDX  L1 0          LOAD COUNTER               K1410810
                          LDX  I2 EOFS       GET NEW SIZE               K1410820
                          MDX   2 1          OF STRING                  K1410830
                          STX  L2 EOFS       NEW END OF STRING ADDR     K1410840
                    PUZ   LD    2 -1         LOAD WORD AND MOVE         K1410850
                          STO   2 0          IT UP ONE WORD             K1410860
                          MDX   2 -1         MOVE POINTER               K1410870
                          MDX   1 -1         DECREMENT COUNTER          K1410880
                          MDX     PUZ        CONTINUE LOOP              K1410890
                          LDX  I1 ZEMP       RESET INPUT POINTER        K1410900
                          BSC  I  ROUT       RETURN                     K1410910
                    *                                                   K1410920
                    *             CONVERT BINARY TO DECIMAL             K1410930
                    BTOD  STX   1 BOX+1      SAVE STRING POINTER        K1410940
                          LDX   1 4                                     K1410950
                    REP   SRT     16         POSITION FOR DIVIDE        K1410960
                          D       TEN        DIVIDE BY TEN              K1410970
                          STO     WORK       SAVE QUOTIENT              K1410980
                          LD      DEC        LOAD DECIMAL NO.           K1410990
                          RTE     4          BRING REMAINDER TO ACC     K1411000
                          STO     DEC        SAVE DECIMAL NO.           K1411010
                          LD      WORK       LOAD QUOTIENT              K1411020
                          MDX   1 -1         DECREMENT COUNT OF DIVIDES K1411030
                          MDX     REP        GET NEXT NO. IN CONVERSION K1411040
                    BOX   LDX  L1 0          RESTORE INPUT POINTER      K1411050
                    *                                                   K1411060
                    *                                                   K1411070
                          BSI     BOXX       PUT SYM TBL ADDR ON STRING K1411080
                          BSC  L  AMIN2+2    PUT CALL ON STRING         K1411090
                    *                                                   K1411100
                    *                  PUTS THE POINTER TO A CONSTANT   K1411110
                    *                  IN THE STRING - PLACES THE       K1411120
                    *                  CONSTANT INTO THE SYMBOL TABLE   K1411130
                    *                  CHECKS FOR A SYM TBL OVERLAP     K1411140
                    *                                                   K1411141
                    TEMP3 DC      *-*                              2-10 K1411142
                    BOXX  DC      0          ENTRY POINT                K1411150
                          STX   3 ZEMP1+1    SAVE INDEX REGISTER 3      K1411160
                          LDX  I3 SOFNS      START OF NON-STMNT NRS2-10 K1411170
                          STX   3 WORK       PUT IN WORK                K1411180
                          MDX     LAB        BRANCH TO INITIALIZE  2-10 K1411190
                    CONT  LD    3 1          FIRST WD OF NEXT ENTR 2-10 K1411200
                          S       DEC        COMP WITH CONSTANT    2-10 K1411210
                          BSC  L  LAB-1,Z    BRANCH IF NOT EQUAL   2-10 K1411220
                          LD    3 0          GET SYMB TAB ID-WORD  2-10 K1411230
                          SLA     1          SHIFT INT INDR TO SIGN2-10 K1411240
                          BSC  L  PTSTR,+Z   BRANCH IF INT BIT SET 2-10 K1411250
                          MDX   3 -3         DECR SYMB TAB ADDRESS 2-10 K1411260
                    LAB   STX   3 TEMP3                            2-10 K1411270
                          LD      TEMP3      GET NEXT SEARCH ADDR  2-10 K1411280
                          S    L  EOFST      COMP TO END OF SYMB T 2-10 K1411290
                          BSC  L  CONT,-Z    BRANCH IF NOT END     2-10 K1411300
                          LD      DEC        PUT DECIMAL CONSTANT  2-10 K1411310
                          STO   3 1          *IN SYMBOL TABLE      2-10 K1411320
                          LD   L  MASK2      PUT SYMBOL TABLE ID   2-10 K1411330
                          STO   3 0          *WORD IN SYMB TABLE   2-10 K1411340
                          SLA     16         PUT ZEROES AT SECOND  2-10 K1411350
                          STO   3 2          *WORD OF ENTRY        2-10 K1411360
                          MDX  L  EOFST,-3   MODIFY                2-10 K1411370
                          MDX  L  SOFXT,-3   *SYMBOL TABLE         2-10 K1411380
                          MDX  L  SOFGT,-3   *ADDRESSES            2-10 K1411381
                    PTSTR STX   3 WORK       SAVE SYMB TAB POINTER 2-10 K1411382
                          LD   L  SOFST      GET SIZE OF           2-10 K1411383
                          S       WORK       *SYMBOL TABLE         2-10 K1411384
                          SRT     16         POSITION FOR DIVIDE   2-10 K1411385
                          D    L  THRE       GET ENTRY NO. FOR NEW 2-10 K1411386
                          A       SIGN1      *SYMBOL TABLE ENTRY   2-10 K1411387
                          STO   1 1          STORE IN STRING       2-10 K1411388
                    *                                                   K1411390
                          LD   L  EOFST      TEST FOR OVERLAP           K1411400
                          A    L  TWO        BETWEEN STRING AND         K1411410
                          S    L  EOFS       SYMBOL TABLE               K1411420
                          BSC  L  JIMY,+Z    BRANCH IF OVERLAP          K1411430
                    ZEMP1 LDX  L3 0          RESTORE XR3                K1411440
                          BSC  I  BOXX       RETURN                     K1411450
                    *                                                   K1411460
                    *             CONSTANTS                             K1411470
                    DEC   DC      0          DECIMAL CONVERSION WORD    K1411480
                    WORK  DC      0          TEMPORARY STORAGE          K1411490
                    TEN   DC      10         TEN                        K1411500
                    SIGN1 DC      /8001      SIGN FOR SYM TBL           K1411510
                    *                                                   K1411520
                    *             SUBROUTINE TO CHECK A STATEMENT       K1411530
                    *             ID WORD FOR A TRANSFER STATEMENT.     K1411540
                    *             ROUTINE BRANCHES INDIRECT THROUGH     K1411550
                    *             FIRST OPERAND IF TRANSFER, AND        K1411560
                    *             SECOND IF NOT.                        K1411570
                    *                                                   K1411580
                    TRCKS DC      0          ENTRY POINT                K1411590
                          LD      TRCKS      LOAD RETURN ADDRESS        K1411600
                          STO     WRT1+1     STORE IN TRANSFER EXIT     K1411610
                          A       WR111      ADD ONE                    K1411620
                          STO     WRT2+1     STORE IN NON-TRANSFER EXIT K1411630
                          LD    1 0          LOAD WORD                  K1411640
                          SRA     11         GET ID TYPE                K1411650
                          S       CON1       IS IT GO TO                K1411660
                          BSC  L  WRT1,+-    BRANCH IF YES              K1411670
                          S       CON2       IS IT STOP                 K1411680
                          BSC  L  WRT1,+-    BRANCH IF YES              K1411690
                          S       CON3       IS IT RETURN               K1411700
                          BSC  L  WRT1,+-    BRANCH IF YES              K1411710
                          S       NCON1      IS IT CALL LINK            K1411720
                          BSC  L  WRT1,-+    BRANCH IF YES              K1411730
                          S       CON4       IS IT IF                   K1411740
                          BSC  L  WRT1,+-    BRANCH IF YES              K1411750
                    WRT2  BSC  I  *-*        EXIT IF NOT TRANSFER STMNT K1411760
                    WRT1  BSC  I  *-*        EXIT IF TRANSFER STMNT     K1411770
                    *                                                   K1411780
                    *             CONSTANTS                             K1411790
                    WR111 DC      1          ONE                        K1411800
                    CON1  DC      /000E          GO TO                  K1411810
                    CON2  DC      /0017-/000E    STOP                   K1411820
                    CON3  DC      /0010-/0017    RETURN                 K1411830
                    NCON1 DC      /001C-/0010    CALL LINK              K1411840
                    CON4  DC      /000F-/001C    IF                     K1411850
                    *                                                   K1411860
                          BSS     BPHAR+PHLEN*320-*-1  PATCH AREA       K1411870
                          DC       0                                    K1411880
                          END     BPHAR-2                               K1411890
