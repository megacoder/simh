                    *************************************************** ZD400010
                    *                                                   ZD400020
                    *STATUS- VERSION 2,MODIFICATION 0                 * ZD400030
                    *                                                 * ZD400040
                    *FUNCTION/OPERATION-                              * ZD400050
                    *   * THIS PAPER TAPE SYSTEM STAND-ALONE PROGRAM  * ZD400060
                    *     WILL DUMP ANY SIZE CORE, STARTING AT 1E0,   * ZD400070
                    *     TO EITHER THE 1403 PRINTER OR THE 1132      * ZD400080
                    *     PRINTER.                                    * ZD400090
                    *                                                 * ZD400100
                    *ENTRY POINTS-                                    * ZD400110
                    *   * THIS PROGRAM IS ENTERED DIRECTLY FROM ITS   * ZD400120
                    *    LOADER, WITH AN MDX TO LOCATION /40.         * ZD400130
                    *                                                 * ZD400140
                    *INPUT- N/A                                       * ZD400150
                    *                                                 * ZD400160
                    *OUTPUT-                                          * ZD400170
                    *   * CORE IS DUMPED TO THE FASTEST ONLINE PRINTER* ZD400180
                    *    ,THE DUMP STARTING AT 1E0.  THE ADDRESS OF   * ZD400190
                    *     THE FIRST OF THE 16 CORE WORDS ON A PRINT   * ZD400200
                    *     LINE IS PRINTED ON THE LEFT OF THE LINE.    * ZD400210
                    *   * MACHINE STATUS HAS ALREADY BEEN CHANGED BY  * ZD400220
                    *     THE LOADER, SO IT IS NOT SAVED.             * ZD400230
                    *                                                 * ZD400240
                    *EXTERNAL REFERENCES-                             * ZD400250
                    *   SUBROUTINES- N/A                              * ZD400260
                    *   COMMA/DCOM- N/A                               * ZD400270
                    *                                                 * ZD400280
                    *EXITS-                                           * ZD400290
                    *   NORMAL- N/A                                   * ZD400300
                    *   ERROR- N/A                                    * ZD400310
                    *                                                 * ZD400320
                    *TABLES/WORK AREAS- N/A                           * ZD400330
                    *                                                 * ZD400340
                    *ATTRIBUTES- N/A                                  * ZD400350
                    *                                                 * ZD400360
                    *NOTES- N/A                                       * ZD400370
                    *                                                 * ZD400380
                    *************************************************** ZD400390
                          HDNG    PAPER TAPE STAND-ALONE DUMP-1403/1132 ZD400400
                          ABS                                           ZD400410
                          ORG     /40                                   ZD400420
                    START LDX   1 1                                     ZD400430
                          LD      INTA4      SET UP 1403 INTERRUPT SUB- ZD400440
                          STO  L  TWLVE      ROUTINE ADDR IN WD. 12     ZD400450
                    *                                                   ZD400460
                          LD   L  INTAD      SET UP 1132 INTERRUPT SUB- ZD400470
                          STO  L  NINE       ROUTINE ADDR IN WD. 9      ZD400480
                    *                                                   ZD400490
                    *TEST FOR WHICH PRINTER IS ON SYSTEM,1403 OR 1132   ZD400500
                    *IFBOTH ARE ON SYSTEM AND BOTH ARE READY,DUMP IS    ZD400510
                    *ON 1403.                                           ZD400520
                    *                                                   ZD400530
                    PTEST XIO     SENS3      CHK.1403 READY             ZD400540
                          BSC     E          YES,SKIP                   ZD400550
                          MDX     PT010      *NO,CHECK 1132             ZD400560
                    STSPC XIO     SPAC3      ONE SPACE ON 1403          ZD400570
                          XIO     SENS3      SENSE FOR CARRIAGE BUSY    ZD400580
                          SRA     2                                     ZD400590
                          BSC  L  D1403,E    BUSY,START DUMP ON 1403    ZD400600
                    PT010 XIO  L  SENS2      NOT BUSY ,CHECK 1132 READY ZD400610
                          SLA     5          NOT READY BIT TO SIGN      ZD400620
                          BSC  L  PTEST,+Z   IF NOT RDY RET TO 1403 TST ZD400630
                          XIO  L  SPACE      1132 READY,DO 1 SPACE      ZD400640
                          XIO  L  SENS2      TEST 1132 BUSY             ZD400650
                          SLA     3          CARRIAGE BUSY TO SIGN BIT  ZD400660
                          BSC  L  D1132,+Z   BUSY,START DUMP ON 1132    ZD400670
                          MDX     PTEST      NOT BUSY,BACK TO 1403 TEST ZD400680
                    *                                                   ZD400690
                    *                                                   ZD400700
                    * DUMP USING 1403 PRINTER                           ZD400710
                    *                                                   ZD400720
                    D1403 BSI  L  CORE1      GO DO CORE SIZE TEST       ZD400730
                    *                                                   ZD400740
                    LDX1  LDX   1 -60        CLEAR THE BUFFER           ZD400750
                          LD      BLNK       *TO 1443 OUTPUT            ZD400760
                    CLRR  STO   1 BUFER+60   *BLANKS                    ZD400770
                          MDX   1 1                                     ZD400780
                          MDX     CLRR       NEXT WORD                  ZD400790
                          MDX  L  ADDRS,16   INCREMENT ADDRESS          ZD400800
                          NOP                IN CASE OF SKIP            ZD400810
                          MDX  L  CTR,-1     SKIP IF ALL LINES PRINTED  ZD400820
                          MDX     CONP       CONTINUE PRINTING          ZD400830
                          WAIT               END OF DUMP                ZD400840
                          MDX     *-2        HARD WAIT                  ZD400850
                    *                                                   ZD400860
                    *1403 PRINTER INTERRUPT SERVICE SUBROUTINE          ZD400870
                    *                                                   ZD400880
                    INT4  DC      0                                     ZD400890
                          STO     SAV        SAVE ACCUM                 ZD400900
                          XIO     SENS3      SENSE WITH RESET           ZD400910
                          SLA     12         CHANNEL 12 IND TO SIGN     ZD400920
                          STO     SKPIN      SET SKIP SWITCH            ZD400930
                          LD      SAV        RESTORE ACCUM              ZD400940
                          BOSC I  INT4       TURN OFF LEVEL AND EXIT    ZD400950
                    BLNK  DC      /7F7F      1403 BLANKS                ZD400960
                    SAV   DC      0          TO SAV/RESTORE ACC         ZD400970
                    SKPIN DC      /FFFF      SKIP-TO CH-1-SWITCH        ZD400980
                          BSS  E  0                                     ZD400990
                    SPAC3 DC      1          1403 SPACE                 ZD401000
                          DC      /AC00      *IOCC                      ZD401010
                    PRNT  DC      14         1403 PRINT                 ZD401020
                          DC      /AD00      *IOCC                      ZD401030
                    SENS3 DC      0          1403 SENSE WITH            ZD401040
                          DC      /AF01      *RESET IOCC                ZD401050
                    SKP   DC      SKON       1403 SKIP                  ZD401060
                          DC      /A900      *IOCC                      ZD401070
                    SKON  DC      /0800      SKIP-TO-CHANNEL-1 CONST    ZD401080
                    INTA4 DC      INT4       ADDR OF 1403 INTRP SUBR    ZD401090
                    COREL DC      /1001      USED FOR CORE SIZE CHECK   ZD401100
                    LTRT  EQU     SENS3      LEFT/RIGHT INDICATOR       ZD401110
                    *                                                   ZD401120
                    DOSPC DC      256                                   ZD401130
                          XIO     SENS3      CHECK FOR READY            ZD401140
                          BSC  L  DOSPC+1,E  *LOOP ON 1403 NOT READY    ZD401150
                          SLA     13         KEEP LOOPING               ZD401160
                          BSC  L  DOSPC+1,Z  *IF BUSY                   ZD401170
                          LD      SKPIN      CHK SKIP-TO-CHANNEL-1 SW   ZD401180
                          BSC     -          SHALL WE SKIP              ZD401190
                          XIO     SPAC3      NO, DO ONE SPACE           ZD401200
                          BSC     +Z         AND EXIT                   ZD401210
                          XIO     SKP        YES, SKIP TO CHANNEL 1     ZD401220
                          STX     SKPIN      TURN OFF SKIP SWITCH       ZD401230
                          BSC  I  DOSPC      EXIT                       ZD401240
                    CTR   DC      227        NO. OF LINES TO PRINT      ZD401250
                    READ  DC      1          EXTRA SPACE INDICATOR      ZD401260
                    *                                                   ZD401270
                    CONP  LD      BUFFR      INITIALIZE BUFFER          ZD401280
                          STO     BUFAD      *ADDRESS                   ZD401290
                          MDX  L  LOOP+1,16  INCREMENT FOR NEXT LINE    ZD401300
                          NOP                IN CASE OF SKIP            ZD401310
                          LDX   3 -17        SEVENTEEN WORDS PER LINE   ZD401320
                          LD   L  ADDRS      DUMP THE ADDRESS FIRST     ZD401330
                          MDX     *+2        SKIP AROUND                ZD401340
                    LOOP  LD   L3 /01E0      FIRST WORD TO BE DUMPED    ZD401350
                          LDX   1 4          SET TO GET FOUR CHARACTERS ZD401360
                          SRT     16         GET ONE CHARACTER INTO     ZD401370
                    CHAR1 SLA     16         ZERO ACCUMULATOR AND       ZD401380
                          LDX   2 0          INITIALIZE XR2             ZD401390
                          SLT     4          MOVE IN ONE HEX DIGIT      ZD401400
                          BSC     E          SKIP IF HEX CHAR IS EVEN   ZD401410
                          MDX   2 8          GET CHAR FROM RT HALF OF   ZD401420
                          SRA     1          *TABLE,NOW COMPUTE ADDR OF ZD401430
                          A       TABAD      *REQUIRED CHARACTER        ZD401440
                          STO     *+1                                   ZD401450
                          LD   L  *-*        LOAD 2 1403 CHARS          ZD401460
                          SLA   2 0          SHIFT IF NESSARY           ZD401470
                          AND     XFF00      ELIMINATE RT SIDE          ZD401480
                          MDX  L  LTRT,0     LEFT-RIGHT IND ZERO        ZD401490
                          MDX     RIGHT      NO, LEAVE CHAR ON RIGHT    ZD401500
                          STO     KEEP       SAVE CHARACTER FOR NEXT    ZD401510
                          STX     LTRT       REVERSE LEFT-RIGHT IND.    ZD401520
                          MDX     CHAR2      GET NEXT CHARACTER         ZD401530
                    RIGHT SRA     8          MOVE CHAR TO RT            ZD401540
                          OR      KEEP       PUT TWO CHARS TOGETHER     ZD401550
                          STO  I  BUFAD      INTO THE OUTPUT BUFFER     ZD401560
                          MDX  L  BUFAD,1    UP BUFFER ADDRESS BY 1     ZD401570
                          SLA     16         REVERSE LEFT-RIGHT IND     ZD401580
                          STO     LTRT       *INDICATOR                 ZD401590
                    CHAR2 MDX   1 -1         FOUR CHARACTERS OUTPUT     ZD401600
                          MDX     CHAR1      NO, GET NEXT CHARACTER     ZD401610
                          MDX  L  BUFAD,1    YES, UP BUFFER FOR SPACE   ZD401620
                          MDX  L  READ,-1    *EXTRA SPACE  *            ZD401630
                          MDX     OUTX       *AFTER EVERY  *            ZD401640
                          MDX  L  BUFAD,1    *FOUR         *            ZD401650
                          MDX  L  READ,4     *WORDS        *            ZD401660
                    OUTX  MDX   3 1          POINT  AT NEXT WORD        ZD401670
                          MDX     LOOP       NXT WD IF 1 LINE NOT DONE  ZD401680
                          MDX  L  READ,-3    RESET EXTRA SPACE INDR     ZD401690
                    D4096 NOP                IN CASE OF SKIP            ZD401700
                          MDX  L  FURST,0    CHK LIKE-LINE INDR         ZD401710
                          BSI     DOSPC      *LINE SPACE IF NONZERO     ZD401720
                          MDX     DOPRN      GO PRINT A LINE            ZD401730
                    SPCE  BSI     DOSPC      ONE SPACE AFTER PRINT      ZD401740
                    *                                                   ZD401750
                          BSI     COMP       GO CHECK FOR LIKE LINES    ZD401760
                          DC      LOOP+1     1403 DUMP PARAMETER        ZD401770
                          MDX     LDX1       GO CLEAR PRINT BUFFER      ZD401780
                    *                                                   ZD401790
                    DOPRN XIO     SENS3      SENSE THE 1403             ZD401800
                          SLA     15                                    ZD401810
                          BSC     -          LOOP IF BUSY               ZD401820
                          BSC     C          LOOP IF NOT READY          ZD401830
                          MDX     DOPRN      LOOP IF NOT READY OR BUSY  ZD401840
                          XIO     PRNT       INITIATE PRINT             ZD401850
                          MDX     SPCE       TO SPACE ROUTINE           ZD401860
                    TABAD DC      TABL       ADDR OF 1403 CODE TABLE    ZD401870
                    BUFFR EQU     PRNT       FOR INITIALIZING BUFR ADDR ZD401880
                    BUFER EQU     14         PRINT BUFFER STARTS AT /E  ZD401890
                    TWLVE EQU     12         LEVEL 4 INTERRUPT WORD     ZD401900
                    *                                                   ZD401910
                    XFF00 DC      /FF00      CONST FOR CLEARING HALF-WD ZD401920
                    *                                                   ZD401930
                    *1403 CODE TABLE.TWO CHARACTERS PACKED PER WORD,    ZD401940
                    *EVEN NUMBERS ON THE LEFT,ODD NUMBERS ON THE RIGHT. ZD401950
                    *                                                   ZD401960
                    TABL  DC      /4940      01                         ZD401970
                          DC      /0102      23                         ZD401980
                          DC      /4304      45                         ZD401990
                          DC      /4546      67                         ZD402000
                          DC      /0708      89                         ZD402010
                          DC      /6425      AB                         ZD402020
                          DC      /2667      CD                         ZD402030
                          DC      /6829      EF                         ZD402040
                    *                                                   ZD402050
                    * SUBROUTINE TO DETERMINE THE SIZE OF CORE AND SET  ZD402060
                    * UP THE LINE-COUNTER--CTR-- ACCORDING TO THE       ZD402070
                    * CORE-SIZE,227 LINES FOR 1ST  4K AND 256 LINES FOR ZD402080
                    * EVERY ADDITIONAL 4K.                              ZD402090
                    *                                                   ZD402100
                    CORE1 DC      *-*        RETURN                     ZD402110
                          LD   I  COREL      SAVE CONTENTS OF 4001      ZD402120
                          STO     PACK                                  ZD402130
                          SLA     16         PUT A ZERO IN              ZD402140
                          STO  I  COREL      *4001                      ZD402150
                          MDX   1 0          FOUND MACHINE SIZE IF XR1  ZD402160
                          MDX     GR4K       *GOES ZERO,EXIT WITH LINE  ZD402170
                          BSC  I  CORE1      * COUNT IN CTR.            ZD402180
                    GR4K  LD      D256       XR1 NOT ZERO,ADD 256       ZD402190
                          A       CTR        *TO LINE COUNT             ZD402200
                          STO     CTR                                   ZD402210
                    *                                                   ZD402220
                          LD      PACK       RESTORE 4001               ZD402230
                          STO  I  COREL                                 ZD402240
                          LD      D4096      INCR CORE ADDR             ZD402250
                          A       COREL      * BY 4K                    ZD402260
                          STO     COREL                                 ZD402270
                          MDX     CORE1+1    KEEP LOOKING               ZD402280
                    *                                                   ZD402290
                    *          CLEAR WORDS  /20  -  /27                 ZD402300
                    *                                                   ZD402310
                    CLEAR DC      256        NO.OF LINES PER 4K         ZD402320
                          SLT     32         CLEAR ACCUM AND EXT        ZD402330
                          STD  L  /20        CLEAR THE                  ZD402340
                          STD  L  /22        *1132 PRINT                ZD402350
                          STD  L  /24        *SCAN                      ZD402360
                          STD  L  /26        *AREA                      ZD402370
                          BSC  I  CLEAR      EXIT                       ZD402380
                    INTAD DC      INT        ADDR OF 1132 INTERRUPT RTN ZD402390
                    PACK  DC      0          TEMPERORY STORAGE          ZD402400
                    NINE  EQU     9          LEVEL 2 INTERRUPT WORD     ZD402410
                    D256  EQU     CLEAR      NO. OF LINES PER 4K        ZD402420
                    BUFAD EQU     CORE1      CORE-SIZE ROUTINE          ZD402430
                    KEEP  EQU     CORE1+1    *USED FOR                  ZD402440
                    CTR16 EQU     CORE1+3    *WORK-AREAS                ZD402450
                    *                                                   ZD402460
                    *                                                   ZD402470
                    *DUMP ON 1132 PRINTER                               ZD402480
                    *                                                   ZD402490
                    D1132 BSI     CORE1      CHK MACHINE CORE SIZE      ZD402500
                          BSI     CLEAR      CLEAR 1132 PRINT SCAN AREA ZD402510
                    *                                                   ZD402520
                    TSP   XIO     SENS2      LOOP TILL CARRIAGE IS      ZD402530
                          SLA     3          *DONE SPACING,BUSY BIT IS  ZD402540
                          BSC  L  TSP,+Z     *OFF,THEN---               ZD402550
                    *                                                   ZD402560
                          XIO     ADDRS      START THE PRINTER          ZD402570
                    *                                                   ZD402580
                    *                                                   ZD402590
                    MASK1 EQU     /0020      PRINTER OUTPUT             ZD402600
                    *                                                   ZD402610
                    *                                                   ZD402620
                    *                                                   ZD402630
                    *                                                   ZD402640
                    *             INTERRUPT LEVEL 2 ENTRY               ZD402650
                    *                                                   ZD402660
                    INT   DC      1          INTRP ADDR STORED HERE     ZD402670
                          XIO     SENS2      SENSE DEVICE WITH RESET    ZD402680
                          BSC  L  INT1,+Z    BR IF PRINT RESPONSE       ZD402690
                          MDX  L  JOHN,0     SHALL WE SPACE             ZD402700
                          XIO     SPACE      YES,GO AHEAD AND SPACE     ZD402710
                          SLA     16         NO,SET SPACE               ZD402720
                          STO     JOHN       *SWITCH                    ZD402730
                          BOSC I  INT        TURN OFF INT LVL,EXIT      ZD402740
                    JOHN  DC      0                                     ZD402750
                    *                                                   ZD402760
                    *          CLEAR SCAN AREA                          ZD402770
                    INT1  BSI     CLEAR                                 ZD402780
                          XIO     RDMT       READ THE EMITTER           ZD402790
                    *                                                   ZD402800
                    *          TEST IF  E  REQUIRED                     ZD402810
                    *          STRSW = 0 IF WAITING FOR  E              ZD402820
                    *                                                   ZD402830
                          LD      STRSW                                 ZD402840
                          BSC  L  YES,+-     BR IF E REQUIRED           ZD402850
                    *                                                   ZD402860
                    *          E  NOT REQUIRED                          ZD402870
                    *                                                   ZD402880
                          MDX  L  STRSW,-1                              ZD402890
                          MDX     WOOD       CHECK EMITTED CHARACTER    ZD402900
                          BSI     COMP       CHECK FOR LIKE LINES       ZD402910
                          DC      LOOPO+1    1132 DUMP PARAMETER        ZD402920
                          BSC  L  BO         GO TURN OFF INTERRUPT      ZD402930
                    *                                                   ZD402940
                    *          TEST IF 0-9, A-D, F                      ZD402950
                    *                                                   ZD402960
                    WOOD  LD      EMIT                                  ZD402970
                          A       STPPR      /1000                      ZD402980
                          BSC  L  COMON,C    OK IF CARRY ON             ZD402990
                          SLA     2                                     ZD403000
                          BSC  L  COMON,-    OK IF NON-NEG              ZD403010
                          BSC  L  BO         NO,WAIT                    ZD403020
                    *                                                   ZD403030
                    *          TEST FOR LIKE LINES                      ZD403040
                    *                                                   ZD403050
                    *                                                   ZD403060
                    COMP  DC      *-*                                   ZD403070
                          LDX  I1 ADDR       XR1=WORD IN CORE           ZD403080
                          LD   I  COMP       INITIALIZE                 ZD403090
                          STO     INKAD+1    *INSTRUCTION               ZD403100
                          SLA     16         CLEAR THE LIKE-            ZD403110
                          STO     FURST      *LINE SWITCH               ZD403120
                          LDX   2 16         INITIALIZE TEST+1          ZD403130
                          STX   2 TEST+1     *TO 16                     ZD403140
                    *                                                   ZD403150
                    *                                                   ZD403160
                    MORE  EQU     *                                     ZD403170
                          LDX   2 16         NO OF DATA WORDS           ZD403180
                          STX   2 CTR16      *PER LINE =16              ZD403190
                    *                                                   ZD403200
                    *                                                   ZD403210
                    TEST  EQU     *                                     ZD403220
                          LD   L1 16         LOAD DATA WORD             ZD403230
                          EOR  L1            CHK WITH WD IN NEXT LINE   ZD403240
                          BSC  L  RETRN,Z    EXIT IF NOT SAME           ZD403250
                    *                                                   ZD403260
                          MDX   1 1          INCREMENT POINTER          ZD403270
                          MDX  L  CTR16,-1   INCREMENT WORD COUNTER     ZD403280
                          MDX     TEST       CONTINE IF NOT FINISHED    ZD403290
                    *                                                   ZD403300
                    *                                                   ZD403310
                    *          ALL 16 WORDS ARE THE SAME                ZD403320
                    *                                                   ZD403330
                    *                                                   ZD403340
                          STX     FURST      SET LIKE-LINE SWITCH       ZD403350
                    SAME  EQU     *                                     ZD403360
                          MDX  L  CTR,-1     SKIP IF LAST LINE          ZD403370
                          MDX     MEXT       KEEP CHECKING IF NOT       ZD403380
                          MDX     STOP       GO STOP THE PRINTER        ZD403390
                    *                                                   ZD403400
                    *                                                   ZD403410
                    MEXT  EQU     *                                     ZD403420
                    *                                                   ZD403430
                          MDX  L  ADDR,16    NEXT LINE                  ZD403440
                    INKAD MDX  L  *-*,16     INCREMENT ADDRESS          ZD403450
                          NOP                IN CASE OF SKIP            ZD403460
                          MDX     MORE       KEEP CHECKING LIKE LINES   ZD403470
                    RETRN MDX  L  COMP,1     SET UP EXIT ADDRESS        ZD403480
                          BSC  I  COMP       EXIT                       ZD403490
                    *                                                   ZD403500
                    *                                                   ZD403510
                    *     ROUTINE TO INSERT MASK WORD                   ZD403520
                    *                                                   ZD403530
                    EXIT  BSC  L  *-*                                   ZD403540
                    OVER  EQU     *-1                                   ZD403550
                          SLT     1                                     ZD403560
                          MDX   2 -1         SKIP WHEN MASK WD FULL     ZD403570
                          MDX     EXIT                                  ZD403580
                          LDX   2 16         RESET XR2,16 BITS/MASK WD  ZD403590
                          RTE     17                                    ZD403600
                    STO   STO  L  MASK1      STORE MASK WORD            ZD403610
                          MDX  L  STO+1,1    AUGMENT FOR NEXT MASK WD   ZD403620
                          RTE     15         RESTORE ACC                ZD403630
                          MDX     EXIT       RETURN                     ZD403640
                    *                                                   ZD403650
                    *                                                   ZD403660
                    *                                                   ZD403670
                    BLOCK DC      0          EXTRA SPACE SWITCH         ZD403680
                    FURST DC      1          LIKE-LINE SWITCH           ZD403690
                    K9000 DC      /9000      CONST FOR EMITTED CHAR     ZD403700
                          BSS  E  0                                     ZD403710
                    ADDRS DC      /01E0-/0010  STARTING ADDRESS - /0010 ZD403720
                          DC      /3480      START PRINTER IOCC         ZD403730
                    SENS2 DC      /F000      USE FOR MASKING CONST      ZD403740
                          DC      /3701      SENSE WITH RESET           ZD403750
                    *                                                   ZD403760
                    SPACE DC      /C500      CODE FOR E                 ZD403770
                          DC      /3401      1 LINE FEED                ZD403780
                    *                                                   ZD403790
                    STPPR DC      /1000                                 ZD403800
                          DC      /3440      STOP PRINTER               ZD403810
                    *                                                   ZD403820
                    RDMT  DC      EMIT                                  ZD403830
                          DC      /3200      READ EMITTER               ZD403840
                    KON1  DC      0          TWO-WORD CONST TO          ZD403850
                    ONE   DC      1          *INSERT 1 BIT IN EXT       ZD403860
                    STRSW DC      0          SWITCH FOR E CHARACTER     ZD403870
                    ADDR  EQU     ADDRS                                 ZD403880
                    EMIT  EQU     ADDRS+1                               ZD403890
                    *                                                   ZD403900
                    *                                                   ZD403910
                    YES   LD      EMIT                                  ZD403920
                          EOR     SPACE      CHECK IF E EMITTED         ZD403930
                          BSC  L  BO,Z       BR IF E NOT EMITTED        ZD403940
                          MDX  L  FURST,0    CHECK LIKE-LINE-SW         ZD403950
                          STX     JOHN       SET SPACE INDICATOR        ZD403960
                    YES1  MDX  L  STRSW,+27  RESET STRSW                ZD403970
                    *                                                   ZD403980
                    *                                                   ZD403990
                    *                                                   ZD404000
                    *                                                   ZD404010
                    *                                                   ZD404020
                    *          INCREMENT ADDRESS                        ZD404030
                          MDX  L  ADDRS,16                              ZD404040
                          NOP                IN CASE OF SKIP            ZD404050
                    *                                                   ZD404060
                    NOCHG EQU     *                                     ZD404070
                          MDX  L  CTR,-1     SKIP IF ALL LINES PRINTED  ZD404080
                          MDX     SPCOP      CONT TO PRINT MORE LINES   ZD404090
                    STOP  XIO     STPPR      STOP PRINTER  END OF DUMP  ZD404100
                          WAIT               FINISHED                   ZD404110
                    *                                                   ZD404120
                    *                                                   ZD404130
                    *                                                   ZD404140
                    SPCOP XIO     SPACE      LINE SPACE                 ZD404150
                          MDX  L  LOOPO+1,+16 INCREMENT FOR NEXT LINE   ZD404160
                          NOP                IN CASE OF SKIP            ZD404170
                    *                                                   ZD404180
                    *     CHARACTER EMITTED WAS 0-9, A-D, F             ZD404190
                    *                                                   ZD404200
                    COMON LDX   3 -17        ADDR WD + 16 DATA WORDS    ZD404210
                          LDX   2 16         16 BITS PER MASK WD        ZD404220
                          LD      EMIT       GET EMITTED CHARACTER      ZD404230
                          SLT     4                                     ZD404240
                          BSC  L  JUMP1,C                               ZD404250
                          A       K9000                                 ZD404260
                          BSC  L  BO,C       WAIT IF CARRY ON           ZD404270
                    *                                                   ZD404280
                    JUMP1 STO     EMIT       FILL                       ZD404290
                          SRA     4          *   EMIT                   ZD404300
                          OR      EMIT       *        WITH              ZD404310
                          STO     EMIT       CHARACTER                  ZD404320
                          SRA     8                                     ZD404330
                          OR      EMIT       *E.G.                      ZD404340
                          STO     EMIT       *        5555  FOR  E      ZD404350
                          LD      ONE        EXTRA SPACE                ZD404360
                          STO     BLOCK      *INDICATOR                 ZD404370
                          LD      ADDRS                                 ZD404380
                    MDXFI MDX     FIRST-1    GO DO ADDRESS OF LINE      ZD404390
                    *                                                   ZD404400
                    LOOPO LD   L3 /1E0       FIRST WORD TO BE DUMPED    ZD404410
                          LDX   1 4          SET FOR 4 CHARACTERS/WORD  ZD404420
                    FIRST EOR     EMIT       COMPARE WITH EMITTED CHAR  ZD404430
                    LOOPI A       SENS2      /F000                      ZD404440
                          BSC  L  SKIP,C     SKIP IF CARRY ON           ZD404450
                    *                                                   ZD404460
                          AD      KON1       INSERT BIT IN Q REGISTER   ZD404470
                    *                        ONLY IF CARRY OFF          ZD404480
                    SKIP  BSI     OVER       INSERT MASK WD             ZD404490
                    *                                                   ZD404500
                          SLA     3          *FOR NEXT CHARACTER        ZD404510
                          MDX   1 -1         4 CHARACTERS DONE          ZD404520
                          MDX     LOOPI      *NO,DO NEXT                ZD404530
                    *                                                   ZD404540
                    *          END OF SCAN FOR WORD                     ZD404550
                    *                                                   ZD404560
                    CONTU BSI     OVER       SPACE BETWEEN WORDS        ZD404570
                          MDX  L  BLOCK,-1   NEED SPACE BETWEEN WORDS   ZD404580
                          MDX     MDX31      *NO,NEXT WORD              ZD404590
                          BSI     OVER       *YES,GO SPACE              ZD404600
                          MDX  L  BLOCK,4    RESET INDICATOR            ZD404610
                    MDX31 MDX   3 1          POINT AT NEXT WORD         ZD404620
                          MDX     LOOPO      GET NEXT WORD              ZD404630
                    *                                                   ZD404640
                    *      END  OF  LINE                                ZD404650
                    SLT   EQU     *                                     ZD404660
                          SLT     21                                    ZD404670
                          STO  L  MASK1+5    LAST PRINT POSITIONS       ZD404680
                          MDX  L  STO+1,-5   RESET STORE INSTRUCTION    ZD404690
                    *                                                   ZD404700
                    BO    BOSC L  KON1       TURN OFF INT,WAIT FOR MORE ZD404710
                    *                                                   ZD404720
                    *                                                   ZD404730
                          END     START                                 ZD404740
