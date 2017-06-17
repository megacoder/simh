                    *     HDNG    1442-5 CARD PUNCH IOCS ROUTINE        U2H00010
                    *************************************************** U2H00020
                    *STATUS- CHANGE LEVEL 000                         * U2H00030
                    *FUNCTION/OPERATION-                              * U2H00040
                    *     THIS 1130 SUBROUTINE OPERATES THE 1442-5    * U2H00050
                    *     CARD PUNCH.   IT INITIATES REQUESTED OPERA- * U2H00060
                    *     TIONS, PROCESSES ANY COLUMN OR OPERATION    * U2H00070
                    *     COMPLETE INTERRUPTS, AND AUTOMATICALLY      * U2H00080
                    *     INITIATES ERROR RECOVERY PROCEDURES.        * U2H00090
                    *                                                 * U2H00100
                    *     IDENTIFYING FEATURE - NO ERROR PARAMETER    * U2H00110
                    *ENTRY POINTS-                                    * U2H00120
                    *     1. PNCH0  CALL ENTRANCE FOR TEST, PUNCH     * U2H00130
                    *               OR FEED OPERATIONS.               * U2H00140
                    *                            E.G.  LIBF    PNCH0  * U2H00150
                    *                                  DC      /2000  * U2H00160
                    *                                  DC      IOBUF  * U2H00170
                    *     2. INT1   COLUMN INTERRUPT ENTRY POINT.     * U2H00180
                    *     3. INT2   OPERATION COMPLETE INTERRUPT ENTRY* U2H00190
                    *               POINT.                            * U2H00200
                    *INPUT- NONE OTHER THAN FROM THE PARAMETERS IN    * U2H00210
                    *     LIBF CALLING SEQUENCE.                      * U2H00220
                    *     VALID PARAMETERS ARE-                       * U2H00230
                    *       /0000  TEST                               * U2H00240
                    *       /2000  PUNCH                              * U2H00250
                    *       /3000  FEED                               * U2H00260
                    *OUTPUT- SUBR WILL PUNCH UP TO 80 COLUMNS FROM    * U2H00270
                    *     I/O BUFFER TO CARD AS SPECIFIED BY CALL.    * U2H00280
                    *     THE LEFT 12 BITS FROM EACH I/O BUFFER WORD  * U2H00290
                    *     ARE PUNCHED INTO THE CARD COLUMNS.          * U2H00300
                    *EXTERNAL SUBROUTINES- NONE.                      * U2H00310
                    *EXITS-                                           * U2H00320
                    *  NORMAL-                                        * U2H00330
                    *     1. CA34   IF NO PRE-OP ERROR HAS BEEN DE-   * U2H00340
                    *               TECTED, THE EXIT FROM CA34 IS BACK* U2H00350
                    *               TO THE CALLER AFTER THE REQUESTED * U2H00360
                    *               1442 OPERATION HAS BEEN INITIATED * U2H00370
                    *     2. NT22   THE EXIT FROM NT22  IS BACK TO THE* U2H00380
                    *               CALLER VIA ILS00 AFTER THE COLUMN * U2H00390
                    *               INTERRUPT IS SERVICED.            * U2H00400
                    *     3. NT10X-1  CONTROL RETURNS TO CALLERS PRO- * U2H00410
                    *               GRAM VIA ILS04 AFTER OP COMPLETE  * U2H00420
                    *               PROCESSING HAS BEEN FINISHED.     * U2H00430
                    *  ERROR-                                         * U2H00440
                    *     1. CA34   IF A PRE-OP ERROR OR NOT READY    * U2H00450
                    *               CONDITION IS DETECTED, THE SUBR   * U2H00460
                    *               WILL BRANCH TO HEX 0029 VIA CA34  * U2H00470
                    *               AND DISPLAY ONE OF TWO CODES IN   * U2H00480
                    *               ACCUMULATOR.                      * U2H00490
                    *               1000 IS DISPLAYED IF 1442 IS NOT  * U2H00500
                    *               READY.  1001 IS DISPLAYED IF AN   * U2H00510
                    *               ERROR IS DISCOVERED IN CALLING    * U2H00520
                    *               PARAMETERS OR AREAS REFERENCED BY * U2H00530
                    *               THEM.                             * U2H00540
                    *TABLES/WORK AREAS- NONE.                         * U2H00550
                    *ATTRIBUTES- REUSABLE.                            * U2H00560
                    *NOTES- THIS SUBR CONTAINS NO WAIT INSTRUCTIONS.  * U2H00570
                    *************************************************** U2H00580
                          LIBR                                          U2H00590
                    1130  ISS  01 PNCH0     0    4                      U2H00600
                    *************************************************** U2H00610
                    *             LOADER DEFINED LOCATIONS            * U2H00620
                    *************************************************** U2H00630
                    PNCH0 STX   1 CA30+1     LIBF ENTRANCE         (+0) U2H00640
                    LINK  LDX  I1 0          LOADER STORES TV ADDR (+2) U2H00650
                          MDX     CA10       TO PROCESS CALL            U2H00660
                    INT1  DC      0          COLUMN INTERRUPT      (+4) U2H00670
                          BSC  L  NT14                                  U2H00680
                    INT2  DC      0          OP CMPLTE INTERRUPT   (+7) U2H00690
                          BSC  L  NT10                                  U2H00700
                    *************************************************** U2H00710
                    *             LIBF PROCESSING                     * U2H00720
                    *************************************************** U2H00730
                    *     THIS PORTION STORES CALLING SEQUENCE INFO   * U2H00740
                    *     AND CHECKS THE DEVICE STATUS BEFORE ANY I/O * U2H00750
                    *     OPERATION IS INITIATED. A CALLING ERROR OR  * U2H00760
                    *     NOT READY 1442 CAUSES AN ERROR EXIT TO      * U2H00770
                    *     LOCATION 41. IF THE OPERATION WILL CAUSE    * U2H00780
                    *     INTERRUPTS, THE ROUTINE IS SET BUSY AND THE * U2H00790
                    *     IOCS COUNTER IS INCREMENTED TO INDICATE     * U2H00800
                    *     INTERRUPT(S) PENDING.                       * U2H00810
                    *************************************************** U2H00820
                    CA10  STO     TEMP       SAVE STATUS                U2H00830
                          STS     CA32                                  U2H00840
                          STX   2 CA31+1                                U2H00850
                          LD    1 0          X1= ADDR OF CALL+1         U2H00860
                          SRA     12         IS FUNCTION TEST           U2H00870
                          BSC  L  CA14,Z     NO                         U2H00880
                          LD      BUSY       YES, IS ROUTINE BUSY       U2H00890
                          BSC     +-         SKIP IF YES                U2H00900
                          MDX   1 +1         NO, EXIT TO CALL+3         U2H00910
                          MDX     CA28       YES, EXIT TO CALL+2        U2H00920
                    CA14  S       D0004      IS FUNCTION LEGAL          U2H00930
                          BSC  L  CA40,Z-    NO, ERROR                  U2H00940
                          A       H7003      RESULT WILL BE 7003, 7002  U2H00950
                          STO     CA20       *7001, OR 7000             U2H00960
                          A       CONST      MODIFY THE COMMAND         U2H00970
                          STO     CA18       *AT CA18                   U2H00980
                    CA15  LD      BUSY       IS ROUTINE BUSY            U2H00990
                          BSC  L  CA15,Z     YES, WAIT TIL NOT          U2H01000
                    CA17  XIO     SENSE-1    IS DEVICE READY            U2H01010
                          BSC  L  CA42,E     NO, ERROR                  U2H01020
                          LD      SENSE      SETUP CONTROL IOCC         U2H01030
                    CA18  S       SETUP      MODIFIED INSTRUC           U2H01040
                          STO     INIT                                  U2H01050
                    CA20  MDX     CA20+1     WHAT IS FUNCTION           U2H01060
                          MDX     CA40       READ IS ILLEGAL            U2H01070
                          MDX     CA36       = PUT  --PUNCH--           U2H01080
                          MDX     CA25       = FEED                     U2H01090
                          MDX     CA40       STK IS ILLEGAL             U2H01100
                    CA24  LD    1 1          SAVE DATA ADDRESS          U2H01110
                          STO     COLM                                  U2H01120
                          STO     RSTRT+1                               U2H01130
                          MDX   1 +1         SET X1 TO SKIP 2ND PARAM   U2H01140
                    CA25  XIO     SENSE-1                               U2H01150
                          SLA     3          IS LAST CARD IND ON        U2H01160
                          BSC  L  CA25B,-    NO                         U2H01170
                          LD      CA20       IS FUNCTION A FEED         U2H01180
                          BSC  L  CA25B,E    NO, PUNCH                  U2H01190
                          XIO     FEED-1     EJECT CARD                 U2H01200
                          MDX     CA43       TO DISPLAY NR CODE         U2H01210
                    CA25B MDX  L  50,+1      INCREMENT IOCS COUNTER     U2H01220
                          NOP                                           U2H01230
                          LD      D0001                                 U2H01240
                          STO     BUSY       SET ROUTINE BUSY           U2H01250
                    CA26  LD      ERROR                                 U2H01260
                          BSC  L  CA27,Z                                U2H01270
                          XIO     INIT-1     INITIATE I/O               U2H01280
                          MDX     CA28       SKIP FEED OPERATION        U2H01290
                    CA27  XIO     FEED-1                                U2H01300
                    CA28  MDX   1 +1                                    U2H01310
                          LD      TEMP                                  U2H01320
                    CA29  STX   1 CA34+1     SET EXIT TO SKIP 1ST PARAM U2H01330
                    CA30  LDX  L1 0          RESTORE STATUS             U2H01340
                    CA31  LDX  L2 0          *AND INDEX REGISTERS       U2H01350
                    CA32  LDS     0                                     U2H01360
                    CA34  BSC  L  0          EXIT                       U2H01370
                    CA36  S       SETUP+5                               U2H01380
                          STO     COLM+1     SETUP PUNCH I/O            U2H01390
                          LD   I1 1                                     U2H01400
                          BSC  L  CA40,+     = ERROR IF ZERO OR NEG     U2H01410
                          STO     COUNT                                 U2H01420
                          STO     RSTRT      SAVE WORD COUNT            U2H01430
                          S       D0080      DO NOT PUNCH OVER 80 COL   U2H01440
                          BSC     +          SKIP ON ERROR              U2H01450
                          MDX     CA24       GO GET DATA                U2H01460
                    CA40  LD      H1001      ERROR CODE - ILLEGAL CALL  U2H01470
                          MDX     CA44       TO ERROR EXIT  --LOC 41    U2H01480
                    CA42  SRA     1          IS DEVICE BUSY             U2H01490
                          BSC  L  CA17,E     YES, WAIT TIL NOT          U2H01500
                          SLA     3          IS DSW ERROR INDIC ON      U2H01510
                          BSC  L  CA43,-     NO                         U2H01520
                          LD      CA20       YES, IS FUNCT FEED         U2H01530
                          BSC  L  CA43,E     NO                         U2H01540
                          STO     ERROR      YES, INDIC SKIP 1ST CD     U2H01550
                    CA43  LD      H1000      ERROR CODE - DVCE NOT RDY  U2H01560
                    CA44  MDX   1 -1                                    U2H01570
                          STX  L1 40         STORE CALL ADDR IN 40      U2H01580
                          LDX   1 41           SET EXIT FOR 41          U2H01590
                          MDX     CA29         TO SOFT ERROR TRAP       U2H01600
                    *************************************************** U2H01610
                    *             CONSTANTS                           * U2H01620
                    *************************************************** U2H01630
                          BSS  E  0                                     U2H01640
                    SENSR DC      0                                   O U2H01650
                          DC      /1702      SENSE-RESET OP.COMPL.INT.E U2H01660
                    ADDR  DC      PLC-1      ADDR TO REPLACE O/P AREA E U2H01670
                    CHAR  DC      /1701      SENSE-RESET COL.INTRP.   O U2H01680
                    COLM  DC      0          IOCC FOR COLUMN I/O      E U2H01690
                          DC      0          IOCC FOR PUNCH           O U2H01700
                    TEMP  DC      0          TEMPORARY STORAGE          U2H01710
                    INIT  DC      /0400      IOCC TO INITIATE I/O     O U2H01720
                    CONST DC      SETUP-CA18-1+/2000                    U2H01730
                    SENSE DC      /1700      SENSE DSW WITHOUT RESET  O U2H01740
                    BUSY  DC      0          ROUTINE BUSY INDICATOR     U2H01750
                    FEED  DC      /1402      IOCC TO FEED 1 CARD      O U2H01760
                    D0001 DC      +1         CONSTANT                   U2H01770
                    D0004 DC      +4         CONSTANT                   U2H01780
                    D0008 DC      +8         CONSTANT                   U2H01790
                    D0080 DC      +80        CONSTANT                   U2H01800
                    H7003 DC      /7003      INSTRUCTIONS = MDX X +3    U2H01810
                    COUNT DC      0          NO. WORDS TO XFER          U2H01820
                    ERROR DC      0          SKIP ONE CARD INDIC        U2H01830
                    RSTRT DC      0          RESTART INFO - WORD COUNT  U2H01840
                          DC      0                         DATA ADDR   U2H01850
                    SETUP DC      /02FC      INITIATE IOCC SETUP - GET  U2H01860
                          DC      /02FF                          - PUT  U2H01870
                          DC      /02FE                          - FEED U2H01880
                    H1000 DC      /1000      CONSTANT                   U2H01890
                    H1001 DC      /1001      CONSTANT                   U2H01900
                          DC      /0301                          - PUT  U2H01910
                    PLC   DC      *-*        WD FOR LAST CHAR PUNCHED   U2H01920
                    $PST4 EQU     /8D        POST-OPERATIVE ERROR TRAP  U2H01930
                    *************************************************** U2H01940
                    *             OP COMPLETE INTERRUPT PROCESSING    * U2H01950
                    *************************************************** U2H01960
                    *     THIS PORTION IS ENTERED FROM INTERR LEVEL   * U2H01970
                    *     SROUTINE 04. IF NO ERROR HAS BEEN DETECTED, * U2H01980
                    *     THE ROUTINE IS SET NOT BUSY AND THE IOCS    * U2H01990
                    *     COUNTER IS DECREMENTED TO INDICATE          * U2H02000
                    *     INTERRUPT PROCESSING COMPLETED. OTHERWISE   * U2H02010
                    *     THE SUBR.WAITS AT THE POST-OPERATIVE ERROR- * U2H02020
                    *     TRAP UNTIL THE OPERATOR HAS                 * U2H02030
                    *     INTERVENED AND THE 1442 BECOMES READY, AT   * U2H02040
                    *     WHICH TIME THE CARDS ARE POSITIONED AND THE * U2H02050
                    *     I/O OPERATION IS RE-INITIATED.              * U2H02060
                    *************************************************** U2H02070
                    NT10  XIO     SENSR      SENSE DSW WITH RESET       U2H02080
                          SLA     3          IS OPERATION OK            U2H02090
                          BSC  L  NT11,C     NO, ERROR                  U2H02100
                    NT10B BSC  L  NT10X,Z+   NO, LAST CARD              U2H02110
                          LD      ERROR      TEST THE SKIP CARD INDIC   U2H02120
                          SLA     2          SET CARRY ON IF BITS 0     U2H02130
                          SRA     16         *OR 1 ARE ON               U2H02140
                          STO     ERROR                                 U2H02150
                          BSC  L  NT12,C     YES, INITIATE FUNCT        U2H02160
                    NT10E MDX  L  50,-1      NO, TERMINATE FUNCT        U2H02170
                          NOP                DECREMENT IOCS COUNT       U2H02180
                          SRA     16                                    U2H02190
                          STO     BUSY       CLEAR ROUTINE BUSY         U2H02200
                          BSC  I  INT2       EXIT                       U2H02210
                    NT10X LD      ADDR       ENTERED WHEN LAST CARD     U2H02220
                          A       D0001      *INDICATOR IS ON           U2H02230
                          EOR     COLM       IS FUNCTION PUT            U2H02240
                          BSC     +-         NO                         U2H02250
                          XIO     FEED-1     YES, EJECT LAST CD         U2H02260
                          MDX     NT10E      TO TERMINATE               U2H02270
                    NT11  LD      INIT       IS FUNCT PUNCH             U2H02280
                          BSC  L  NT12,E     YES, DONT SKIP             U2H02290
                          MDX     NT13B      FUNCT IS FEED              U2H02300
                    NT12  XIO     CHAR-1                                U2H02310
                          BSC  L  NT13C,E    TO ERROR TRAP IF NOT READY U2H02320
                          LD      ERROR      IS CARD SKIP NECESSARY     U2H02330
                          BSC  L  NT13,+-    NO                         U2H02340
                          XIO     FEED-1     SKIP 1ST CARD              U2H02350
                          BSC  I  INT2       EXIT THROUGH ILS04         U2H02360
                    NT13  LD      RSTRT      GET I/O WD CNT             U2H02370
                          STO     COUNT      SETUP FOR RETRY            U2H02380
                          LD      RSTRT+1    SET UP BUFFER ADDR         U2H02390
                          STO     COLM                                  U2H02400
                          XIO     INIT-1     INITIATE I/O OPERATION     U2H02410
                          BSC  I  INT2       EXIT                       U2H02420
                    NT13B BSC  L  NT12,C     MO SKIP IF FD CHK (RD)     U2H02430
                          LD      H7003                                 U2H02440
                          STO     ERROR                                 U2H02450
                          MDX     NT12                                  U2H02460
                    *                                                   U2H02470
                    NT13C LD      H1000      NOT READY ERROR CODE       U2H02480
                          BSI  L  $PST4     POST-OPERATIVE ERROR TRAP   U2H02490
                          MDX     NT12       TRY AGAIN                  U2H02500
                    *************************************************** U2H02510
                    *             COLUMN INTERRUPT PROCESSING         * U2H02520
                    *************************************************** U2H02530
                    *     THIS PORTION IS ENTERED FROM INTERR LEVEL   * U2H02540
                    *     SUBROUTINE 00.                              * U2H02550
                    *            WHEN THE LAST COLUMN REQUESTED IS    * U2H02560
                    *     PUNCHED, AN INDICATION IS GIVEN TO THE 1442 * U2H02570
                    *     TO INITIATE AN OP COMPLETE INTERRUPT.       * U2H02580
                    *************************************************** U2H02590
                    NT14  XIO     CHAR-1     SENSE WITH RESET           U2H02600
                          MDX  L  COUNT,-1   ANY MORE COLS TO PROCESS   U2H02610
                          MDX     NT18       YES                        U2H02620
                    NT16  MDX  L  COLM,+1    NO, STORE STOP PUNCH       U2H02630
                          LD   I  COLM       *BIT  (BIT 12) IN COL      U2H02640
                          OR      D0008      DATA                       U2H02650
                          STO     PLC                                   U2H02660
                          LD      ADDR       PUNCH FROM TEMPORARY       U2H02670
                          STO     COLM       *LOCATION                  U2H02680
                    NT18  MDX  L  COLM,+1    SET ADDR FOR NEXT COLUMN   U2H02690
                    NT20  XIO     COLM       EXECUTE COLUMN I/O         U2H02700
                    NT22  BSC  I  INT1       EXIT                       U2H02710
                          END                                           U2H02720
