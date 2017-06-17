                    *************************************************** ZD200010
                    *                                                 * ZD200020
                    *   STATUS- VERSION 2, MODIFICATION 11            * ZD200024
                    *                                                 * ZD200026
                    *   PROGRAM NAME- 1403/1132 STAND ALONE CORE DUMP,* ZD200030
                    *      PHASE 2.                                   * ZD200040
                    *                                                 * ZD200050
                    *   FUNCTION/OPERATION-                           * ZD200060
                    *      THIS PHASE OVERLAYS PHASE 1 WHEN LOADED,   * ZD200070
                    *      AND USES THE INFORMATION FROM THE FIRST    * ZD200080
                    *      PHASE (CORE SIZE, AND ON-LINE PRINTER).    * ZD200090
                    *      IT DUMPS CORE TO THE PRINTER,STARTING AT   * ZD200100
                    *      HEX 1E0. WORDS /20 THROUGH /27 ARE USED    * ZD200110
                    *      AS THE PRINTER SCAN FIELD.                 * ZD200120
                    *                                                 * ZD200130
                    *   INPUT- CORE-SIZE-DEPENDANT PRINTER LINE CNT   * ZD200140
                    *      IN LOC /04                                 * ZD200150
                    *      PRINTER INDR IN LOC /26-- 0=1403           * ZD200160
                    *                                NON-ZERO=1132    * ZD200170
                    *                                                 * ZD200180
                    *   OUTPUT-                                       * ZD200190
                    *      EACH LINE PRINTED IS MADE UP OF AN ADDRESS * ZD200200
                    *      OF THE FIRST WD ON THE LEFT,THEN 16 CORE   * ZD200210
                    *      WORDS OUTPUT IN BLOCKS OF 4.               * ZD200220
                    *                                                 * ZD200230
                    *   EXTERNAL REFERENCES-                          * ZD200240
                    *      LOC /04 -- PRINTER LINE COUNT              * ZD200250
                    *      LOC /26 -- PRINT DVC INDR                  * ZD200260
                    *                                                 * ZD200270
                    *   ERROR CONDITIONS- NONE                        * ZD200280
                    *                                                 * ZD200290
                    *   NOTES-                                        * ZD200300
                    *      *THIS PROGRAM MUST BE CONVERTED TO 8/8     * ZD200302
                    *       FORMAT WITH DATA IN COLUMNS 1 THRU 72.    * ZD200304
                    *       COLUMNS 73 THRU 80 ARE TO CONTAIN THE     * ZD200306
                    *       SEQUENCE NUMBERS.                         * ZD200308
                    *      *THE PROGRAM IS LOADED INTO CORE BY THE    * ZD200310
                    *       2-CARD BOOTSTRAP LOADER.                  * ZD200312
                    *                                                 * ZD200315
                    *************************************************** ZD200320
                          HDNG    1403/1132 STAND ALONE CORE DUMP,PH 2  ZD200330
                          ABS                                           ZD200340
                          ORG     /74                                   ZD200350
                    START LDX   3 0          XR3=0--FOR SHORT INSTR     ZD200360
                    *                                                   ZD200370
                    *RESTORE WORDS /1E0-/1E3 WHICH WERE OVERLAYED WHEN  ZD200380
                    *LOADING THIS PHASE.THEY WERE SAVED BY FIRST PHASE  ZD200390
                    *IN THE BOOTSTRAP AREA.                             ZD200400
                    *                                                   ZD200410
                          LDD     /1E                                   ZD200420
                          STD  L  /1E0                                  ZD200430
                          LDD     /20                                   ZD200440
                          STD  L  /1E2                                  ZD200450
                    *                                                   ZD200460
                    * TEST FOR 1403 OR 1132 PRINTER--IF PRNSW ZERO,     ZD200470
                    * DUMP IS ON 1403,OTHERWISE ON 1132                 ZD200480
                    *                                                   ZD200490
                          LD    3 PRNSW     IS INDR WD NON-ZERO         ZD200500
                          BSC  L  D1132,Z   YES,BR FOR 1132.OTHERWISE   ZD200510
                    D1403 LD      INTA4     *SET UP 1403 INTERRUPT SUB- ZD200520
                          STO   3 TWLVE     *ROUTINE ADDR IN WD. 12     ZD200530
                    *                                                   ZD200540
                    LDX1  LDX   1 -60       SET CTR TO SET 120 CHARS    ZD200550
                          LD      BLNK      *TO BLANKS FOR 1403         ZD200560
                    CLRR  STO   1 BUFER+60  STORE 2 BLANKS              ZD200570
                          MDX   1 1         DECR CTR                    ZD200580
                          MDX     CLRR      IF NOT DONE,REPEAT          ZD200590
                          MDX  L  ADDRS,16  *INCREMENT ADDRESS          ZD200600
                          NOP                                           ZD200610
                          MDX  L  CTR,-1    SKIP  IF ALL LINES PRINTED  ZD200620
                          MDX     CONP      CONTINUE  PRINTING          ZD200630
                          WAIT              END  OF DUMP                ZD200640
                          MDX     *-2                                   ZD200650
                    *                                                   ZD200660
                    *PRINTER INTERRUPT ROUTINE                          ZD200670
                    *                                                   ZD200680
                    INT4  DC      0         SAVE RET ADDR               ZD200690
                          STO     SAV       SAVE ACC                    ZD200700
                          XIO     SENS3     SENSE  WITH RESET           ZD200710
                          SLA     12        CHANNEL 12 INDR TO SIGN BIT ZD200720
                          STO     SKPIN     SET  SKIP SWITCH            ZD200730
                          LD      SAV       RESTORE ACC                 ZD200740
                          BOSC I  INT4      TURN OFF INTRPT AND RET     ZD200750
                    *                                                   ZD200760
                    *CONSTANTS AND BUFFER AREA                          ZD200770
                    *                                                   ZD200780
                    SAV   EQU     START     TEMP STG TO SAVE ACC        ZD200790
                    SKPIN EQU     START+1   SKIP-TO-CHANNEL-1 SWITCH    ZD200800
                    *                                              2-11 ZD200804
                    INTA4 DC      INT4      ADDR OF ILS04          2-11 ZD200808
                          BSS  E  0                                     ZD200810
                    SPAC3 DC      /7F7F     SPACE CHARS FOR 1403        ZD200820
                          DC      /AC00     IOCC TO SPACE 1403          ZD200830
                    PRNT  DC      14        USED FOR O/P BUFFER(LOC 14) ZD200840
                          DC      /AD00     IOCC TO PR ON 1403          ZD200850
                    SENS3 DC      0                                     ZD200860
                          DC      /AF01     IOCC TO SENSE 1403 W/RESET  ZD200870
                    SKP   DC      SKON                                  ZD200880
                          DC      /A900     IOCC TO SKIP TO CHAN 1      ZD200890
                    SKON  DC      /0800                                 ZD200900
                    * 1 CONSTANT MOVED                             2-11 ZD200910
                    COREL DC      /1001     CORE LOC BUFFER (NOW 4097)  ZD200920
                    LTRT  EQU     SENS3     ADDR OF LEFT-RT CHAR INDR   ZD200930
                    BLNK  EQU     SPAC3     ADDR OF 1403 BLANK CHARS    ZD200940
                    *                                                   ZD200950
                    *THIS SECTION DOES THE SPACE OPERATIONS             ZD200960
                    *                                                   ZD200970
                    DOSPC DC      256       SAVE RET ADDR               ZD200980
                          XIO     SENS3     CHECK  FOR READY            ZD200990
                          SLA     13                                    ZD201000
                          BSC  L  DOSPC+1,Z IF NOT READY,LOOP           ZD201010
                          LD      SKPIN                                 ZD201020
                          BSC     -         SHALL  WE SKIP              ZD201030
                          XIO     SPAC3     NO,  DO ONE SPACE           ZD201040
                          BSC     +Z        *AND EXIT                   ZD201050
                          XIO     SKP       YES,  SKIP TO CHANNEL 1     ZD201060
                          STX     SKPIN     TURN  OFF SKIP SWITCH       ZD201070
                          BSC  I  DOSPC     RETURN                      ZD201080
                    CTR   EQU     /0004     ADDR OF NO. OF LINES TO PR  ZD201090
                    PRNSW EQU     /26       ADDR OF PR DVC INDR         ZD201100
                    READ  DC      1         CTR FOR EXTRA SP            ZD201110
                    *                                                   ZD201120
                    *THIS SECTION SETS UP THE PRINT FOR THE 1403        ZD201130
                    *                                                   ZD201140
                    CONP  LD      BUFFR     INITIALIZE ADDRESS TO       ZD201150
                          STO     BUFAD     *OUTPUT BUFFER              ZD201160
                          MDX  L  LOOP+1,16 INCREMENT  FOR NEXT LINE    ZD201170
                          NOP                                           ZD201180
                          LDX   3 -17       SEVENTEEN  WORDS PER LINE   ZD201190
                          LD   L  ADDRS     DUMP  THE ADDRESS FIRST     ZD201200
                          MDX     *+2                                   ZD201210
                    LOOP  LD   L3 /01E0     FIRST  WORD TO BE DUMPED    ZD201220
                          LDX   1 4         SET  TO GET FOUR CHARACTERS ZD201230
                          SRT     16        PUT THE WD INTO Q REG       ZD201240
                    CHAR1 SLA     16        ZERO  ACCUMULATOR AND       ZD201250
                          LDX   2 0         *XR2 AS A CTR               ZD201260
                          SLT     4         GET ONE CHAR INTO A REG     ZD201270
                          BSC     E         IS THE NUMBER ODD           ZD201280
                          MDX   2 8         YES, SET XR2 TO GET RIGHT   ZD201290
                    *     CHARACTER IN TABLE. OTHERWISE LEFT CHARACTER  ZD201300
                          SRA     1         SET UP REF TO TBL           ZD201310
                          A       TABAD                                 ZD201320
                          STO     *+1                                   ZD201330
                          LD   L  *-*       GET PROPER WD FROM TBL      ZD201340
                          SLA   2 0         SHIFT LEFT 8 IF RT CHAR     ZD201350
                          AND     XFF00     SAVE ONLY LEFT 8 BITS       ZD201360
                          MDX  L  LTRT,0    DOES CHAR BELONG ON RIGHT   ZD201370
                          MDX     RIGHT     YES,GO TO SHIFT IT RIGHT    ZD201380
                          STO     KEEP      NO,SAVE TO PUT W/NEXT CHAR  ZD201390
                          STX     LTRT      SET INDR TO RIGHT CHAR      ZD201400
                          MDX     CHAR2     GET  NEXT CHARACTER         ZD201410
                    RIGHT SRA     8         DO SHIFT IF RIGHT CHAR      ZD201420
                          OR      KEEP      PUT  TWO CHARS TOGETHER     ZD201430
                          STO  I  BUFAD     INTO  THE OUTPUT BUFFER     ZD201440
                          MDX  L  BUFAD,1   UP  BUFFER ADDRESS BY 1     ZD201450
                          SLA     16        SET LEFT-RT INDR TO LEFT    ZD201460
                          STO     LTRT                                  ZD201470
                    CHAR2 MDX   1 -1        ARE 4 CHARS OUTPUT          ZD201480
                          MDX     CHAR1     NO,  GET NEXT CHARACTER     ZD201490
                          MDX  L  BUFAD,1   YES,  UP BUFFER FOR SPACE   ZD201500
                          MDX  L  READ,-1   EXTRA SPACE                 ZD201510
                          MDX     OUTX      *AFTER EVERY                ZD201520
                          MDX  L  BUFAD,1   *FOUR                       ZD201530
                          MDX  L  READ,4    *WORDS                      ZD201540
                    OUTX  MDX   3 1         POINT   AT NEXT WORD        ZD201550
                          MDX     LOOP      NOT DONE WITH PRINT LINE    ZD201560
                          MDX  L  READ,-3   DONE,SET EXTRA SPACE INDR   ZD201570
                    D4096 NOP               *MAY SKIP                   ZD201580
                          MDX  L  FURST,0   WAS LAST LINE A DUPLICATE   ZD201590
                          BSI     DOSPC     YES,DO CARRIAGE SPACE       ZD201600
                          MDX     DOPRN     NO,GO DO PRINT              ZD201610
                    SPCE  BSI     DOSPC     *AND THEN DO SPACE          ZD201620
                    *                                                   ZD201630
                          BSI     COMP      GO CHECK FOR LIKE LINES     ZD201640
                          DC      LOOP+1    1403 DUMP PARAMETER         ZD201650
                          MDX     LDX1      GO CLEAR THE PRINT BUFFER   ZD201660
                    *                                                   ZD201670
                    DOPRN XIO     SENS3     SENSE 1403 W/RESET          ZD201680
                          SLA     15                                    ZD201690
                          BSC     -         LOOP  IF BUSY               ZD201700
                          BSC     C         LOOP  IF NOT READY          ZD201710
                          MDX     DOPRN     LOOP IF NOT READY OR BUSY   ZD201720
                          XIO     PRNT      DO PRINT                    ZD201730
                          MDX     SPCE      RETURN                      ZD201740
                    *                                                   ZD201750
                    *EQUATE STATEMENTS, AND 1403 CODE HEXADECIMAL       ZD201760
                    *CHARACTER TABLE.                                   ZD201770
                    *                                                   ZD201780
                    TABAD DC      TABL      TABLE ADDRESS               ZD201790
                    *                                                   ZD201800
                    BUFFR EQU     PRNT      ADDR OF O/P BUFFER          ZD201810
                    BUFER EQU     14        O/P BUFFER                  ZD201820
                    TWLVE EQU     12        INTRPT LEVEL 4 BR WD        ZD201830
                    *                                                   ZD201840
                    XFF00 DC      /FF00     LOW BIT MASK                ZD201850
                    *1403 CODE HEX DIGITS    LEFT HALF      RIGHT HALF  ZD201860
                    TABL  DC      /4940       0               1         ZD201870
                          DC      /0102       2               3         ZD201880
                          DC      /4304       4               5         ZD201890
                          DC      /4546       6               7         ZD201900
                          DC      /0708       8               9         ZD201910
                          DC      /6425       A               B         ZD201920
                          DC      /2667       C               D         ZD201930
                          DC      /6829       E               F         ZD201940
                    *                                                   ZD201950
                    *CLEAR THE PRINT BUFFER (WORDS /20 TO /27)          ZD201960
                    *                                                   ZD201970
                    CLEAR DC      256       SAVE RETURN ADDRESS         ZD201980
                          LDX   3 0         XR3=0 FOR SHORT INST        ZD201990
                          SLT     32        CLEAR A AND Q REGS          ZD202000
                          STD   3 /20       CLERA  /20-/21              ZD202010
                          STD   3 /22       CLEAR  /22-/23              ZD202020
                          STD   3 /24       CLEAR  /24-/25              ZD202030
                          STD   3 /26       CLEAR  /26-/27              ZD202040
                          MDX  L  /27,+1    SET SCAN BUFFER CMPLT  2-11 ZD202045
                          BSC  I  CLEAR     RETURN                      ZD202050
                    *                                                   ZD202060
                    *CONSTANTS AND EQUATE STATEMENTS                    ZD202070
                    *                                                   ZD202080
                    INTAD DC      INT       ADDR OF INTRPT LEVEL 2      ZD202090
                    *                       *SERVICING ROUTINE          ZD202100
                    PACK  DC      0         TEMPORARY STORAGE           ZD202110
                    NINE  EQU     9         ADDR OF INTRPT LEVEL BR WD  ZD202120
                    BUFAD EQU     START+2   BUFFER FOR O/P AREA ADDR    ZD202130
                    KEEP  EQU     START+3   TEMP STG FOR HEX CHARS      ZD202140
                    *                                                   ZD202150
                    *THIS SECTION DOES THE DUMP ON THE 1132             ZD202160
                    *                                                   ZD202170
                    D1132 LD      INTAD     SET  UP 1132 INTERRUPT SUB- ZD202180
                          STO   3 NINE      *ROUTINE ADDR IN WD. 9      ZD202190
                          BSI     CLEAR     CLEAR WDS /20-/27           ZD202200
                          XIO     ADDRS     START PRINTER               ZD202210
                    MASK1 EQU     /0020     PRINTER SCAN FIELD ADDR     ZD202220
                    CTR16 EQU     D1132                                 ZD202230
                    *                                                   ZD202240
                    * INTERRUPT LEVEL 1 SERVICING ROUTINE  (1132)       ZD202250
                    *                                                   ZD202260
                    INT   DC      1         INTRPT ADDR SAVED HERE      ZD202270
                          XIO     SENS2     SENSE DEVICE WITH RESET     ZD202280
                          BSC  L  INT1,+Z   BR IF READ EMITTER INTRPT   ZD202290
                          MDX  L  JOHN,0    SHALL  WE SPACE             ZD202300
                          XIO     SPACE     YES, GO AHEAD AND SPACE     ZD202310
                          SLA     16        NO, SET SPACE               ZD202320
                          STO     JOHN      *SWITCH                     ZD202330
                          BOSC I  INT       TURN OFF INTRPT LEVEL,EXIT  ZD202340
                    JOHN  DC      0         DO SPACE INDR (0=YES)       ZD202350
                    *                                                   ZD202360
                    *          CLEAR SCAN AREA                          ZD202370
                    *                                                   ZD202380
                    INT1  BSI     CLEAR     GO CLEAR SCAN AREA          ZD202390
                          XIO     RDMT      READ EMITTER                ZD202400
                    *                                                   ZD202410
                    *          TEST IF  E  REQUIRED                     ZD202420
                    *          STRSW = 0 IF WAITING FOR  E              ZD202430
                    *                                                   ZD202440
                          LD      STRSW     ARE WE WAITING FOR E        ZD202450
                          BSC  L  YES,+-    YES,GO CHK EMITTED CHARS    ZD202460
                    *                                                   ZD202470
                    * E IS NOT REQUIRED (NOT BEGINNING OF PRINT CYCLE)  ZD202480
                    *                                                   ZD202490
                          MDX  L  STRSW,-1  DECR CHAR PR CNT.IS IT ZERO ZD202500
                          MDX     WOOD      NO,CHK EMITTED CHAR         ZD202510
                          BSI     COMP      YES,GO CHK FOR LIKE LINES   ZD202520
                          DC      LOOPO+1   1132 PARAMETER              ZD202530
                    INT2  BSC  L  BO        GO TURN OFF INTRPT     2-11 ZD202540
                    *                                                   ZD202550
                    *          TEST IF 0-9, A-D, F                      ZD202560
                    *                                                   ZD202570
                    WOOD  LD      EMIT      GET PRESENT WHEEL CHAR      ZD202580
                          SRA     12        ISOLATE THE 1ST 4 BITS 2-11 ZD202590
                          SLA     12        *OF THE CHAR CODE      2-11 ZD202600
                          S       SENS2                            2-11 ZD202605
                          BSC  L  COMON,+-  BR IF NUMERIC CHAR     2-11 ZD202610
                          A       STPPR                            2-11 ZD202615
                          BSC  L  COMON,+-  BR IF CHAR = A THRU I  2-11 ZD202620
                          MDX     INT2      BR TO EXIT INTRPT LVL  2-11 ZD202630
                    *************************************************** ZD202640
                    *THIS SECTION COMPARES CORE WDS FOR LIKE LINES. IF* ZD202650
                    *THE SAME, IT DOES A PTR SPACE,THEN WAITS TO PR   * ZD202660
                    *NEXT LINE THATS DIFFERENT.                       * ZD202670
                    *************************************************** ZD202680
                    COMP  DC      *-*       SAVE RETURN ADDR            ZD202690
                          LDX  I1 ADDR      LD ADDR OF LAST LINE TO XR1 ZD202700
                          LD   I  COMP      INITLZ INST TO MODIFY LAST  ZD202710
                          STO     INKAD+1   *LINE DUMP ADDR             ZD202720
                          SLA     16                                    ZD202730
                          STO     FURST     ZERO THE LIKE LINE INDR     ZD202740
                          LDX   2 16        SET LINE ADDR DIFFERENCE    ZD202750
                          STX   2 TEST+1    *TO 16 IF ONLY 1 LINE SAME  ZD202760
                    MORE  EQU     *                                     ZD202770
                          LDX   2 16        SET WD CTR FOR LINE         ZD202780
                          STX   2 CTR16     *TO 16                      ZD202790
                    TEST  EQU     *                                     ZD202800
                          LD   L1 16        CHANGED IF MORE THAN 1 SAME ZD202810
                    *                       LINE                        ZD202820
                          EOR  L1           DO CMP W/LAST LINE WD       ZD202830
                          BSC  L  RETRN,Z   EXIT  IF NOT SAME           ZD202840
                          MDX   1 1         OTHERWISE,INCR PTR          ZD202850
                          MDX  L  CTR16,-1  DECR WD CNT FOR CHK         ZD202860
                          MDX     TEST      RET TO TEST NEXT WD         ZD202870
                    *                                                   ZD202880
                    *          ALL 16 WORDS ARE THE SAME                ZD202890
                    *                                                   ZD202900
                          STX     FURST     SET LIKE LINE INDR NON-ZERO ZD202910
                    SAME  EQU     *                                     ZD202920
                          MDX  L  CTR,-1    IS IT THE FINAL LINE        ZD202930
                          MDX     MEXT      NO,GO SET UP NEXT CMP       ZD202940
                          MDX     STOP      YES,GO STOP PTR             ZD202950
                    MEXT  EQU     *                                     ZD202960
                          MDX  L  ADDR,16   INCR FIRST LIKE LINE ADDR   ZD202970
                    INKAD MDX  L  *-*,16    INCR COMPARE ADDR           ZD202980
                          NOP               MAY SKIP                    ZD202990
                          MDX     MORE      RET TO CMP NEXT WD          ZD203000
                    RETRN MDX  L  COMP,1    SET UP EXIT ADDRESS         ZD203010
                          BSC  I  COMP      EXIT                        ZD203020
                    *                                                   ZD203030
                    *     ROUTINE TO INSERT MASK WORD                   ZD203040
                    *                                                   ZD203050
                    EXIT  BSC  L  *-*       RETURN TO GET ANOTHER BIT   ZD203060
                    OVER  EQU     *-1       ENTRY BY BSI                ZD203070
                          SLT     1         POSITION WD FOR NEXT BIT    ZD203080
                          MDX   2 -1        DECR BIT CNT. IS IT ZERO    ZD203090
                          MDX     EXIT      NO,RETURN                   ZD203100
                          LDX   2 16        YES,RESET XR2 FOR 16 BITS   ZD203110
                          RTE     17        PUT MASK WD IN A REG        ZD203120
                    STO   STO  L  MASK1     STORE MASK WORD             ZD203130
                          MDX  L  STO+1,1   AUGMENT FOR NEXT  MASK WORD ZD203140
                          RTE     15        RESTORE ACCUMULATOR         ZD203150
                          MDX     EXIT      RETURN                      ZD203160
                    *                                                   ZD203170
                    *CONSTANTS,IOCC WDS,AND EQUATE STATEMENTS           ZD203180
                    *                                                   ZD203190
                    BLOCK DC      0         CTR FOR BLOCKS OF 4 WDS O/P ZD203200
                    FURST DC      1         LIKE LINE INDR (0=OFF)      ZD203210
                    K9000 DC      /9000     CON TO CHK CHARS            ZD203220
                          BSS  E  0                                     ZD203230
                    ADDRS DC      /01E0-/0010  STARTING ADDRESS - /0010 ZD203240
                          DC      /3480     START PRINTER               ZD203250
                    SENS2 DC      /F000     CARRY SET IF DIGIT NOT CMP  ZD203260
                          DC      /3701     SENSE DEVICE WITH RESET     ZD203270
                    SPACE DC      /C500     CODE FOR  E                 ZD203280
                          DC      /3401     1 LINE FEED                 ZD203290
                    *                                                   ZD203300
                    STPPR DC      /3000     USED TO CHK FOR 0-9    2-11 ZD203310
                          DC      /3440     STOP PRINTER                ZD203320
                    * 1 IOCC MOVED                                 2-11 ZD203330
                    KON1  DC      0         DOYBLE WD ONE TO SET UP     ZD203350
                    ONE   DC      1         *BITS IN Q REG FOR SCAN     ZD203360
                    RDMT  DC      EMIT      LOC OF EMITTED CHAR    2-11 ZD203364
                          DC      /3200     READ EMITTER           2-11 ZD203366
                    STRSW DC      0         PR CYCLE INDR (0=WAITING)   ZD203370
                    ADDR  EQU     ADDRS     ADDR BUFFER                 ZD203380
                    EMIT  EQU     ADDRS+1   STG FOR EMITTED WHEEL CHAR  ZD203390
                    *                                                   ZD203400
                    *WAITING FOR E CHAR ON WHEEL TO START PR CYCLE      ZD203410
                    *                                                   ZD203420
                    YES   LD      EMIT      GET CHAR JUST EMITTED       ZD203430
                          EOR     SPACE     IS IT E (C5)                ZD203440
                          BSC  L  BO,Z      NO,GO TURN OFF INTRPT       ZD203450
                          MDX  L  FURST,0   YES,IS LIKE LINE INDR SET   ZD203460
                          STX     JOHN      *NO,SET INDR FOR NO SPACE   ZD203470
                    YES1  MDX  L  STRSW,+47  *YES, RESET CYCLE CTR 2-11 ZD203480
                          MDX  L  ADDRS,16  INCR ADDR FOR NEXT LINE     ZD203490
                          NOP               *MAY SKIP                   ZD203500
                    NOCHG EQU     *                                     ZD203510
                          MDX  L  CTR,-1    SKIP IF ALL LINES PRINTED   ZD203520
                          MDX     SPCOP     CONT TO PRINT MORE LINES    ZD203530
                    STOP  XIO     STPPR     STOP PRINTER   END OF DUMP  ZD203540
                          WAIT                                          ZD203550
                    SPCOP XIO     SPACE     INITIATE SPACE OPERATION    ZD203560
                          MDX  L  LOOPO+1,+16 INCREMENT FOR NEXT LINE   ZD203570
                          NOP               *IN CASE OF SKIP            ZD203580
                    *                                                   ZD203590
                    *     CHARACTER EMITTED WAS 0-9, A-D, F             ZD203600
                    *                                                   ZD203610
                    COMON LDX   3 -17       ADDR WD + 16 DATA WDS PER L ZD203620
                          LDX   2 16        SET 16 BITS PER MASK WORD   ZD203630
                          LD      EMIT      GET EMITTED CHAR            ZD203640
                          SLT     4         IS CHAR NUMERIC             ZD203650
                          BSC  L  JUMP1,C   YES,BR(TEST SETS CARRY OFF) ZD203660
                          A       K9000     NO    ADD 9                 ZD203670
                          BSC  L  BO,C      GO WAIT IF CHAR IS G,H,I    ZD203680
                    *                                                   ZD203690
                    JUMP1 STO     EMIT      FILL                        ZD203700
                          SRA     4         *EMIT                       ZD203710
                          OR      EMIT      *WITH                       ZD203720
                          STO     EMIT      *CHARACTER CODE             ZD203730
                          SRA     8                                     ZD203740
                          OR      EMIT      EXAMPEL                     ZD203750
                          STO     EMIT      *(EMIT)=EEEE FOR E CHAR     ZD203760
                          LD      ONE       SET BLOCK INDR              ZD203770
                          STO     BLOCK     *FOR ADDR                   ZD203780
                          LD      ADDRS     GET PRESENT DUMP ADDR       ZD203790
                    MDXFI MDX     FIRST-1   GO SET SCAN FOR ADDR FIELD  ZD203800
                    *                                                   ZD203810
                    *LOOP TO SET UP THE PRINT SCAN FIELD                ZD203820
                    *                                                   ZD203830
                    LOOPO LD   L3 /1E0      FIRST WORD TO BE DUMPED     ZD203840
                          LDX   1 4         SET FOR 4 CHARS PER WD      ZD203850
                    FIRST EOR     EMIT      COMPARE WITH EMITTED CHAR   ZD203860
                    LOOPI A       SENS2     DID CHAR COMPARE            ZD203870
                          BSC  L  SKIP,C    NO, SKIP                    ZD203880
                          AD      KON1      YES,INSERT BIT IN Q REG     ZD203890
                    SKIP  BSI     OVER      GO TO POSITION BIT          ZD203900
                          SLA     3         POSITION NEXT CHAR FOR CHK  ZD203910
                          MDX   1 -1        DECR CHAR CNT(SKIP IF DONE) ZD203920
                          MDX     LOOPI     NOT DONE,CHK NEXT CHAR      ZD203930
                    *                                                   ZD203940
                    *          END OF SCAN FOR WORD                     ZD203950
                    *                                                   ZD203960
                    CONTU BSI     OVER      SPACE BETWEEN WORDS         ZD203970
                          MDX  L  BLOCK,-1  DECR BLOCK WD CNT           ZD203980
                          MDX     MDX31     NOT DONE WITH BLOCK,CONT    ZD203990
                          BSI     OVER      DONE W/BLOCK--EXTRA SPACE   ZD204000
                          MDX  L  BLOCK,4   SET NEXT BLOCK TO 4 WDS     ZD204010
                    MDX31 MDX   3 1         POINT AT NEXT WORD          ZD204020
                          MDX     LOOPO     GET NEXT WORD               ZD204030
                    *                                                   ZD204040
                    *      END  OF  LINE                                ZD204050
                    *                                                   ZD204060
                    SLT   EQU     *                                     ZD204070
                          SLT     21        POSITION LAST 10 SCAN BITS  ZD204080
                          STO  L  MASK1+5   STORE LAST SCAN BITS        ZD204090
                          MDX  L  STO+1,-5  RESET STORE INSTRUCTION     ZD204100
                    BO    BOSC L  KON1      TURN OFF INTRPT,WAIT UNTIL  ZD204110
                    *                       NEXT INTRPT OCCURS          ZD204120
                          END     START                                 ZD204130
