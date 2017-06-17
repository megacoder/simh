                          HDNG    LIBF  CARD0                           U2A00010
                    *************************************************** U2A00020
                    *                                                 * U2A00030
                    *   SUBROUTINE NAME-                              * U2A00040
                    *      FULL NAME- N/A                             * U2A00050
                    *      CODE NAME- CARD0                           * U2A00060
                    *   PURPOSE-                                      * U2A00070
                    *     THIS 1130 SUBROUTINE OPERATES THE 1442 CARD * U2A00080
                    *     READER PUNCH. IT INITIATES REQUESTED OPERA- * U2A00090
                    *     TIONS, PROCESSES ANY COLUMN OR OPERATION    * U2A00100
                    *     COMPLETE INTERRUPTS, AND AUTOMATICALLY      * U2A00110
                    *     INITIATES ERROR RECOVERY PROCEDURES.        * U2A00120
                    *   METHOD- N/A                                   * U2A00130
                    *   CAPABILITIES AND LIMITATIONS- N/A             * U2A00140
                    *   SPECIAL FEATURES- NO ERROR PARAMETER          * U2A00150
                    *   ADDITIONAL INFORMATION-                       * U2A00160
                    *      ESTIMATED EXECUTION TIME-                  * U2A00170
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL. * U2A00180
                    *                                                 * U2A00190
                    *************************************************** U2A00200
                          LIBR                                          U2A00210
                    1130  ISS  01 CARD0     0    4                      U2A00220
                    *************************************************** U2A00230
                    *             LOADER DEFINED LOCATIONS            * U2A00240
                    *************************************************** U2A00250
                    CARD0 STX   1 CA30+1     LIBF ENTRANCE         (+0) U2A00260
                    LINK  LDX  I1 0          LOADER STORES TV ADDR (+2) U2A00270
                          MDX     CA10       START CALL PROCESSING      U2A00280
                    INT1  DC      0          COLUMN INTERRUPT      (+4) U2A00290
                          BSC  L  NT14       PROCESS COL INTERRUPT      U2A00300
                    INT2  DC      0          OP CMPLTE INTERRUPT   (+7) U2A00310
                          BSC  L  NT10       PROCESS OP COMPLETE INTRP  U2A00320
                    *************************************************** U2A00330
                    *             LIBF PROCESSING                     * U2A00340
                    *************************************************** U2A00350
                    *     THIS PORTION STORES CALLING SEQUENCE INFO   * U2A00360
                    *     AND CHECKS THE DEVICE STATUS BEFORE ANY I/O * U2A00370
                    *     OPERATION IS INITIATED. A CALLING ERROR OR  * U2A00380
                    *     NOT READY 1442 CAUSES AN ERROR EXIT TO      * U2A00390
                    *     LOCATION 41. IF THE OPERATION WILL CAUSE    * U2A00400
                    *     INTERRUPTS, THE ROUTINE IS SET BUSY AND THE * U2A00410
                    *     IOCS COUNTER IS INCREMENTED TO INDICATE     * U2A00420
                    *     INTERRUPT(S) PENDING.                       * U2A00430
                    *************************************************** U2A00440
                    CA10  STO     TEMP      SAVE A REG                  U2A00450
                          STS     CA32      SAVE STATUS                 U2A00460
                          STX   2 CA31+1    SAVE XR2                    U2A00470
                          LD    1 0         GET FIRST PARAM AT CALL+1   U2A00480
                          SRA     12        NO,GO CHK FUNCTION          U2A00490
                          BSC  L  CA14,Z    NO                          U2A00500
                          LD      BUSY      YES,IS ROUTINE BUSY         U2A00510
                          BSC     +-                                    U2A00520
                          MDX   1 +1        NO,EXIT TO CALL+3           U2A00530
                          MDX     CA28      YES,EXIT TO CALL+2          U2A00540
                    CA14  S       D0004     IS FUNCTION LEGAL           U2A00550
                          BSC  L  CA40,Z-   NO,PRE-OPERATIVE ERROR EXIT U2A00560
                          A       H7003     YES,CONSTRUCT PROPER MDX TO U2A00570
                          STO     CA20      BRANCH TABLE.               U2A00580
                          A       CONST     CONSTRUCT CON TO REFERENCE  U2A00590
                          STO     CA18      IOCC TABLE.                 U2A00600
                    CA15  LD      BUSY      IS ROUTINE BUSY             U2A00610
                          BSC  L  CA15,Z    YES,WAIT UNTIL NOT BUSY     U2A00620
                    CA17  XIO     SENSE-1   IS DEVICE READY             U2A00630
                          BSC  L  CA42,E    NO,ERROR                    U2A00640
                          LD      SENSE     SET UP IOCC TO INITIATE I/O U2A00650
                    CA18  S       SETUP                                 U2A00660
                          STO     INIT                                  U2A00670
                    CA20  MDX     CA20+1    WHAT IS FUNCTION            U2A00680
                          MDX     CA21      =GET                        U2A00690
                          MDX     CA36      =PUT                        U2A00700
                          MDX     CA25      =FEED                       U2A00710
                          MDX     CA26      =STACKER SELECT             U2A00720
                    CA21  S       SETUP+4   GET FUNCTION                U2A00730
                          STO     COLM+1    SET UP READ I/O             U2A00740
                    CA21B LD   I1 1         OBTAIN THE WORD COUNT       U2A00750
                          BSC  L  CA40,+    ERROR IF ZERO OR NEGATIVE   U2A00760
                          STO     CA22+1    COUNTER TO INITLZ DATA AREA U2A00770
                          A       D0001     SAVE WORD COUNT +1          U2A00780
                          STO     COUNT     *BECAUSE OF DECREMENT       U2A00790
                          STO     RSTRT     *BEFORE COLUMN READ         U2A00800
                          S       D0081     CHK WORD COUNT              U2A00810
                          BSC  L  CA40,Z-   ERROR IF OVER 81            U2A00820
                          LD    1 1         I/O AREA ADDR               U2A00830
                          STO     CA23+1    ST FOR USE                  U2A00840
                    CA22  LDX  L2 *-*                                   U2A00850
                          LD      D0001                                 U2A00860
                    CA23  STO  L2 *-*       STORE +1 IN DATA AREA       U2A00870
                          MDX   2 -1        (INDICATES NOT YET READ FOR U2A00880
                          MDX     CA23      THE SPEED CONVERSION SUBR   U2A00890
                    CA24  LD    1 1         SAVE DATA AREA ADDR         U2A00900
                          STO     COLM                                  U2A00910
                          STO     RSTRT+1                               U2A00920
                          MDX   1 +1        SET XR1 TO SKIP SECOND      U2A00930
                    *                       PARAMETER                   U2A00940
                    CA25  XIO     SENSE-1   SENSE IOCC                  U2A00950
                          SLA     3         IS LAST CARD INDR ON        U2A00960
                          BSC  L  CA25B,-   NO,ENTER JOB                U2A00970
                          LD      CA20      YES,IS FUNCTION GET OR FEED U2A00980
                          BSC  L  CA25B,E   NO,ENTER JOB                U2A00990
                          SLA     8         YES,IS FUNCTION GET         U2A01000
                          BSC     +                                     U2A01010
                          MDX   1 -1        YES,SET XR1=LIBF+1          U2A01020
                          XIO     FEED-1    EJECT CARD                  U2A01030
                          MDX     CA43      TO ERROR EXIT               U2A01040
                    CA25B XIO     SENSE-1   IS DEVICE STILL READY   2-9 U2A01050
                          BSC  L  CA50,E    NO, ERROR               2-9 U2A01060
                          MDX  L  $IOCT,1   INCR IOCS CTR               U2A01070
                          NOP               MAY SKIP                    U2A01080
                          LD      D0001                                 U2A01090
                          STO     BUSY      SET ROUTINE BUSY            U2A01100
                    CA26  LD      ERROR     DO DEVICE ERROR CONDS EXIST U2A01110
                          BSC  L  CA27,Z    YES,ATTEMPT TO FEED A CARD  U2A01120
                    *                       TO GET ERROR RET            U2A01130
                          XIO     INIT-1    OTHERWISE INITIATE I/O      U2A01140
                          MDX     CA28      SKIP FEED OP                U2A01150
                    CA27  XIO     FEED-1                                U2A01160
                    CA28  MDX   1 +1        SET RET ADDR                U2A01170
                          LD      TEMP      RESTORE ACC                 U2A01180
                    CA29  STX   1 CA34+1    SET EXIT TO SKIP 1ST PARAM  U2A01190
                    CA30  LDX  L1 *-*       RESTORE XR1                 U2A01200
                    CA31  LDX  L2 *-*       RESTORE XR2                 U2A01210
                    CA32  LDS     *-*       RESTORE STATUS              U2A01220
                    CA34  BSC  L  *-*       EXIT                        U2A01230
                    CA36  S       SETUP+5   CONSTRUCT PUNCH IOCC        U2A01240
                          STO     COLM+1    SET UP PUNCH I/O            U2A01250
                          LD   I1 1         GET WORD COUNT              U2A01260
                          BSC  L  CA40,+    IF ZERO OR NEG,ERROR EXIT   U2A01270
                          STO     COUNT                                 U2A01280
                          STO     RSTRT     SAVE WORD COUNT             U2A01290
                          S       D0080     DO NOT PUNCH OVER 80 CC     U2A01300
                          BSC     +         IF GT 80, ERROR EXIT        U2A01310
                          MDX     CA24      OTHERWISE,GO TO START I/O   U2A01320
                    CA40  LD      H1001     ERROR CODE - ILLEGAL CALL   U2A01330
                          MDX     CA44      TAKE ERROR EXIT             U2A01340
                    CA42  SRA     1         IS DEVICE BUSY              U2A01350
                          BSC  L  CA17,E    YES,WAIT UNTIL NOT          U2A01360
                          SLA     3         IS DSW ERROR INDR ON        U2A01370
                          BSC  L  CA43,-    NO,--NOT READY EXIT         U2A01380
                          LD      CA20      IS FUNCTION GET/FEED        U2A01390
                          BSC  L  CA43,E    NO,NOT READY EXIT           U2A01400
                          STO     ERROR     YES SET INDICATOR TO SKIP   U2A01410
                    CA43  LD      H1000     ERROR CODE,DEVICE NOT READY U2A01420
                    CA44  MDX   1 -1                                    U2A01430
                          STX  L1 $PRET     STORE CALL ADDR IN $PRET    U2A01440
                          LDX   1 $PRET+1   SET EXIT FOR $PRET+1        U2A01450
                          MDX     CA29      TO PREOPERATIVE ER TRAP     U2A01460
                    *************************************************** U2A01470
                    *             CONSTANTS                           * U2A01480
                    *************************************************** U2A01490
                    ERROR DC      0         SKIP ONE CD INDR            U2A01500
                          BSS  E  0                                     U2A01510
                    TEMP  DC      *-*       TEMPORARY STORAGE           U2A01520
                    INIT  DC      /0400     IOCC TO INITIATE I/O        U2A01530
                    SENSR DC      0                                     U2A01540
                          DC      /1702     OP COMPLETE SENSE-RESET     U2A01550
                    ADDR  DC      CHAR-1    ADDR TO REPLACE O/P AREA    U2A01560
                    CHAR  DC      /1701     SENSE-RESET FOR CC INTERPT  U2A01570
                    COLM  DC      0         IOCC FOR COL I/O            U2A01580
                          DC      0                                     U2A01590
                    BUSY  DC      0         PROGRAM BUSY INDICATOR      U2A01600
                    FEED  DC      /1402     IOCC TO FEED 1 CARD         U2A01610
                    CONST DC      SETUP-CA18-1+/2000                    U2A01620
                    SENSE DC      /1700     SENSE DSW WITH RESET        U2A01630
                    D0001 DC      +1        DECIMAL CONSTANTS           U2A01640
                    D0004 DC      +4        FOR CHECKS.                 U2A01650
                    D0008 DC      +8                                    U2A01660
                    D0080 DC      +80                                   U2A01670
                    D0081 DC      +81                                   U2A01680
                    H7003 DC      /7003     INSTRUCTION =MDX X +3       U2A01690
                    H1000 DC      /1000     DEVICE NOT READY CODE       U2A01700
                    H1001 DC      /1001     ILLEGAL CALL CODE           U2A01710
                    COUNT EQU     SENSR     NO. OF WDS TO TRANSFER      U2A01720
                    INDIC DC      0         FEED CHECK--READ STATION    U2A01730
                    RSTRT DC      0         RESTART INFO--WORD COUNT    U2A01740
                          DC      0                         DATA ADDR   U2A01750
                    SETUP DC      /02FC     INITIATE  IOCC SETUP - GET  U2A01760
                          DC      /02FF                          - PUT  U2A01770
                          DC      /02FE                          - FEED U2A01780
                          DC      /0280                          - STK  U2A01790
                          DC      /0204     COLUMN  IOCC SETUP   - GET  U2A01800
                          DC      /0301                          - PUT  U2A01810
                    SDSW  DC      /1701     SENSE DSW  AREA CODE    2-2 U2A01820
                    $PST4 EQU     /8D       POST-OPERATIVE ERROR TRAP   U2A01830
                    $IOCT EQU     /32                               2-9 U2A01840
                    $PRET EQU     /28                               2-9 U2A01850
                    *                                               2-9 U2A01860
                    CA50  LD      CA20      GET FUNCTION            2-9 U2A01870
                          SLA     4         IS FUNC GET             2-9 U2A01880
                          BSC     +-        THEN DO NOT SKIP        2-9 U2A01890
                          MDX   1 -1        RESET RETURN ADDR       2-9 U2A01900
                          MDX     CA42      GO TO DISPLAY ERROR     2-9 U2A01910
                    *                                               2-9 U2A01920
                    *************************************************** U2A01930
                    *             OP COMPLETE INTERRUPT PROCESSING    * U2A01940
                    *************************************************** U2A01950
                    *     THIS PORTION IS ENTERED FROM INTRPT LEVEL   * U2A01960
                    *     SROUTINE 04. IF NO ERROR HAS BEEN DETECTED, * U2A01970
                    *     THE ROUTINE IS SET NOT BUSY AND THE IOCS    * U2A01980
                    *     COUNTER IS DECREMENTED TO INDICATE          * U2A01990
                    *     INTERRUPT PROCESSING COMPLETED. OTHERWISE   * U2A02000
                    *     THE SUBROUTINE WAITS AT THE POST-OPERATIVE *  U2A02010
                    *     ERROR TRAP.THE OPERATOR MUST READY THE     *  U2A02020
                    *     DEVICE AND PUSH START TO GET OUT OF THE    *  U2A02030
                    *     WAIT.                                      *  U2A02040
                    *************************************************** U2A02050
                    NT10  XIO     SENSR     SENSE    DSW WITH RESET     U2A02060
                          SLA     3         IS OPERATION OK             U2A02070
                          BSC  L  NT11,C    NO,ERROR                    U2A02080
                    NT10B BSC  L  NT10X,Z+  NO,LAST CARD                U2A02090
                          LD      ERROR                                 U2A02100
                          SLA     2         YES,  WAS A SKIP OF DESIRED U2A02110
                    *                       IF SO,CARRY IND IS SET ON   U2A02120
                          SRA     16                                    U2A02130
                          STO     ERROR     CLEAR ERROR COND INDRS      U2A02140
                          BSC  L  NT12,C    IS SKIP OP,INITIATE FUNC    U2A02150
                    NT10E MDX  L  $IOCT,-1  IF NOT,TERMINATE FUNC AND   U2A02160
                          NOP               DECR IOCS CTR               U2A02170
                          SRA     16                                    U2A02180
                          STO     BUSY      CLEAR PROGRAM BUSY INDR     U2A02190
                          BSC  I  INT2      EXIT                        U2A02200
                    *                                                   U2A02210
                    *SECTION TO HANDLE LAST CARD CONDITION              U2A02220
                    *                                                   U2A02230
                    NT10X LD      ADDR                                  U2A02240
                          A       D0001                                 U2A02250
                          EOR     COLM      IS FUNCTION PUT             U2A02260
                          BSC     +-        NO                          U2A02270
                          XIO     FEED-1    YES,EJECT LAST CARD         U2A02280
                          MDX     NT10E     GO TERMINATE FUNC           U2A02290
                    *                                                   U2A02300
                    *SECTION TO HANDLE ERROR CONDITION                  U2A02310
                    *                                                   U2A02320
                    NT11  SLA     5         SAVE FEED CHK(RD STA) INDR  U2A02330
                          LD      INIT      IS FUNC PUNCH               U2A02340
                          BSC  L  NT12,E    YES,DONT SKIP               U2A02350
                          SRA     1         IS FUNC FEED                U2A02360
                          BSC  L  NT13B,E   YES,GO CHK FEED CHK INDR    U2A02370
                          LD      RSTRT+1   WAS ONE CC READ IN          U2A02380
                          EOR     COLM                                  U2A02390
                          BSC  L  NT13E,+-  NO,SKIP FIRST CARD          U2A02400
                    *                                                   U2A02410
                    *SECTION TO SKIP FIRST CARD ON ERROR CONDITION      U2A02420
                    *                                                   U2A02430
                    NT12  XIO     SENSE-1                           2-5 U2A02440
                          BSC  L  NT13F,E   TO ERROR TRAP IF NOT RDY    U2A02450
                          LD      ERROR     IS CARD SKIP NECESSARY      U2A02460
                          BSC  L  NT13,+-   NO,GO SET UP RETRY          U2A02470
                          XIO     FEED-1    SKIP FIRST CARD             U2A02480
                          BSC  I  INT2      EXIT                        U2A02490
                    NT13  LD      RSTRT                                 U2A02500
                          STO     COUNT     SET UP WD COUNT FOR RETRY   U2A02510
                          LD      RSTRT+1                               U2A02520
                          STO     COLM      RESET DATA ADDR             U2A02530
                          XIO     INIT-1    INITIATE I/O OPERATION      U2A02540
                          BSC  I  INT2      EXIT                        U2A02550
                    NT13B BSC  L  NT12,C    NO SKIP IF FEED CHK (RD)    U2A02560
                    NT13E LD      H7003                                 U2A02570
                          STO     ERROR     SET BIT 1 OF INDR           U2A02580
                          MDX     NT12                                  U2A02590
                    *                                                   U2A02600
                    *EXIT TO POST-OPERATIVE ERROR TRAP WITH NOT READY   U2A02610
                    *ERROR CODE IN THE ACCUMULATOR.                     U2A02620
                    *                                                   U2A02630
                    NT13F LD      H1000                                 U2A02640
                          BSI  L  $PST4     EXIT TO ERROR TRAP          U2A02650
                          MDX     NT12      TRY AGAIN                   U2A02660
                    *************************************************** U2A02670
                    *             COLUMN INTERRUPT PROCESSING         * U2A02680
                    *************************************************** U2A02690
                    *     THIS PORTION IS ENTERED FROM INTRPT LEVEL   * U2A02700
                    *     SUBROUTINE 00. AFTER THE REQUESTED NO. OF   * U2A02710
                    *     COLUMNS HAS BEEN READ, THE REMAINING COLUMN * U2A02720
                    *     INTERRUPTS ARE MERELY TURNED OFF AS THEY    * U2A02730
                    *     OCCUR. WHEN THE LAST COLUMN REQUESTED IS    * U2A02740
                    *     PUNCHED, AN INDICATION IS GIVEN TO THE 1442 * U2A02750
                    *     TO INITIATE AN OP COMPLETE INTERRUPT.       * U2A02760
                    *************************************************** U2A02770
                    NT14  LD      SDSW                              2-2 U2A02780
                          STO     CHAR      RESTORE SENSE IOCC          U2A02790
                          XIO     CHAR-1    SENSE DSW WITH RESET        U2A02800
                          MDX  L  COUNT,-1  ANY MORE COLS TO PROCESS    U2A02810
                          MDX     NT18      YES,CONTINUE                U2A02820
                          BSC  L  NT16,-    IS THIS A READ CC INTRPT    U2A02830
                          MDX  L  COUNT,+1  YES,SET TO SKIP             U2A02840
                          MDX     NT22      NEXT COLUMN                 U2A02850
                    NT16  MDX  L  COLM,+1   NO,STORE STOP PUNCH         U2A02860
                          LD   I  COLM      BIT,BIT 12, IN CC           U2A02870
                          OR      D0008     DATA                        U2A02880
                          STO     CHAR                                  U2A02890
                          LD      ADDR      PUNCH FROM TEMPERORY        U2A02900
                          STO     COLM      LOCATION                    U2A02910
                    NT18  MDX  L  COLM,+1   SET ADDR FOR NEXT COLUMN    U2A02920
                    NT20  XIO     COLM      EXECUTE COLUMN I/O          U2A02930
                    NT22  BSC  I  INT1      EXIT                        U2A02940
                          END                                           U2A02950
