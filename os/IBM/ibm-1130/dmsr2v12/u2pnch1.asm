                          HDNG    PNCH1,1442-5 CARD PUNCH IOCS ROUTINE* U2I00010
                    *************************************************** U2I00020
                    *TITLE- PNCH1,1442-5 CARD PUNCH IOCS ROUTINE      * U2I00030
                    *STATUS- CHANGE LEVEL 000                         * U2I00040
                    *FUNCTION/OPERATION-                              * U2I00050
                    *     THIS 1130 SUBROUTINE OPERATES THE 1442-5    * U2I00060
                    *     CARD PUNCH.   IT INITIATES REQUESTED OPERA- * U2I00070
                    *     TIONS, PROCESSES ANY COLUMN OR OPERATION    * U2I00080
                    *     COMPLETE INTERRUPTS,AND EXITS TO THE USERS  * U2I00090
                    *     ERROR SUBROUTINE WITH ERROR AND LAST CARD   * U2I00100
                    *     INDICATIONS                                   U2I00110
                    *                                                 * U2I00120
                    *     IDENTIFYING FEATURE -    ERROR PARAMETER    * U2I00130
                    *ENTRY POINTS-                                    * U2I00140
                    *     1. PNCH1  CALL ENTRANCE FOR TEST, PUNCH     * U2I00150
                    *               OR FEED OPERATIONS.               * U2I00160
                    *                            E.G.  LIBF    PNCH1  * U2I00170
                    *                                  DC      /2000  * U2I00180
                    *                                  DC      IOBUF  * U2I00190
                    *                                  DC      ERROR  * U2I00200
                    *     2. INT1   COLUMN INTERRUPT ENTRY POINT.     * U2I00210
                    *     3. INT2   OPERATION COMPLETE INTERRUPT ENTRY* U2I00220
                    *               POINT.                            * U2I00230
                    *INPUT- NONE OTHER THAN FROM THE PARAMETERS IN    * U2I00240
                    *     LIBF CALLING SEQUENCE.                      * U2I00250
                    *     VALID PARAMETERS ARE-                       * U2I00260
                    *       /0000  TEST                               * U2I00270
                    *       /2000  PUNCH                              * U2I00280
                    *       /3000  FEED                               * U2I00290
                    *OUTPUT- SUBR WILL PUNCH UP TO 80 COLUMNS FROM    * U2I00300
                    *     I/O BUFFER TO CARD AS SPECIFIED BY CALL.    * U2I00310
                    *     THE LEFT 12 BITS FROM EACH I/O BUFFER WORD  * U2I00320
                    *     ARE PUNCHED INTO THE CARD COLUMNS.          * U2I00330
                    *EXTERNAL SUBROUTINES- NONE.                      * U2I00340
                    *EXITS-                                           * U2I00350
                    *  NORMAL-                                        * U2I00360
                    *     1. CA34   IF NO PRE-OP ERROR HAS BEEN DE-   * U2I00370
                    *               TECTED, THE EXIT FROM CA34 IS BACK* U2I00380
                    *               TO THE CALLER AFTER THE REQUESTED * U2I00390
                    *               1442 OPERATION HAS BEEN INITIATED * U2I00400
                    *     2. CR22   THE EXIT FROM CR22  IS BACK TO THE* U2I00410
                    *               CALLER VIA ILS00 AFTER THE COLUMN * U2I00420
                    *               INTERRUPT IS SERVICED.            * U2I00430
                    *     3. CR66     CONTROL RETURNS TO CALLERS PRO- * U2I00440
                    *               GRAM VIA ILS04 AFTER OP COMPLETE  * U2I00450
                    *               PROCESSING HAS BEEN FINISHED.     * U2I00460
                    *  ERROR-                                         * U2I00470
                    *     1. CA34   IF A PRE-OP ERROR OR NOT READY    * U2I00480
                    *               CONDITION IS DETECTED, THE SUBR   * U2I00490
                    *               WILL BRANCH TO HEX 0029 VIA CA34  * U2I00500
                    *               AND DISPLAY ONE OF TWO CODES IN   * U2I00510
                    *               ACCUMULATOR.                      * U2I00520
                    *               1000 IS DISPLAYED IF 1442 IS NOT  * U2I00530
                    *               READY.  1001 IS DISPLAYED IF AN   * U2I00540
                    *               ERROR IS DISCOVERED IN CALLING    * U2I00550
                    *               PARAMETERS OR AREAS REFERENCED BY * U2I00560
                    *               THEM.                             * U2I00570
                    *     2. CR71A  IF A POST-OPERATIVE HARDWARE ERROR* U2I00580
                    *               IS DETECTED, THE SUBR EXITS VIA   * U2I00590
                    *               CR71A TO THE USERS ERROR SUBR     * U2I00600
                    *               WITH AN ERROR CODE,0001,IN THE ACC* U2I00610
                    *               UPON RETURN,THE FUNCTION IS TERM- * U2I00620
                    *               INATED OR REINITIATED DEPENDING ON* U2I00630
                    *               WHETHER OR NOT THE ACC. IS CLEARED* U2I00640
                    *     3.  CR61A IF A LAST CARD CONDITION IS       * U2I00650
                    *               DETECTED, THE SUBR EXITS TO THE   * U2I00660
                    *               USER VIA CR61A WITH CODE 0000 IN  * U2I00670
                    *               THE ACCUMULATOR.                  * U2I00680
                    *TABLES/WORK AREAS- NONE.                         * U2I00690
                    *ATTRIBUTES- REUSABLE.                            * U2I00700
                    *NOTES- THIS SUBR CONTAINS NO WAIT INSTRUCTIONS.  * U2I00710
                    *************************************************** U2I00720
                          LIBR                                          U2I00730
                    1130  ISS  01 PNCH1     0    4                      U2I00740
                    *************************************************** U2I00750
                    *             LOADER DEFINED LOCATIONS            * U2I00760
                    *************************************************** U2I00770
                    PNCH1 STX   1 CA30+1     LIBF ENTRANCE         (+0) U2I00780
                    LINK  LDX  I1 0          LOADER STORES TV ADDR (+2) U2I00790
                          MDX     CA10       TO PROCESS CALL            U2I00800
                    INT1  DC      0          COLUMN INTERRUPT      (+4) U2I00810
                          BSC  L  CR14                                  U2I00820
                    INT2  DC      0          OP COMPLETE INTERRUPT (+7) U2I00830
                          BSC  L  CR60                                  U2I00840
                    *************************************************** U2I00850
                    *             LIBF PROCESSING                     * U2I00860
                    *************************************************** U2I00870
                    *     THIS PORTION STORES CALLING SEQUENCE INFO   * U2I00880
                    *     AND CHECKS THE DEVICE STATUS BEFORE ANY I/O * U2I00890
                    *     OPERATION IS INITIATED. A CALLING ERROR OR  * U2I00900
                    *     NOT READY 1442 CAUSES AN ERROR EXIT TO      * U2I00910
                    *     LOCATION 41. IF THE OPERATION WILL CAUSE    * U2I00920
                    *     INTERRUPTS, THE ROUTINE IS SET BUSY AND THE * U2I00930
                    *     IOCS COUNTER IS INCREMENTED TO INDICATE     * U2I00940
                    *     INTERRUPT(S) PENDING.                       * U2I00950
                    *************************************************** U2I00960
                    CA10  STO     TEMP       SAVE STATUS                U2I00970
                          STS     CA32                                  U2I00980
                          STX   2 CA31+1                                U2I00990
                          LD    1 0          X1= ADDR OF CALL+1         U2I01000
                          SRA     12         IS FUNCTION TEST           U2I01010
                          BSC  L  CA14,Z     NO                         U2I01020
                          LD      BUSY       YES, IS SUBROUTINE BUSY    U2I01030
                          BSC     +-         SKIP IF YES                U2I01040
                          MDX   1 +1         NO, EXIT TO CALL+3         U2I01050
                          MDX     CA28       YES, EXIT TO CALL+2        U2I01060
                    CA14  S       D0004      IS FUNCTION LEGAL          U2I01070
                          BSC  L  CA40,Z-    NO, ERROR                  U2I01080
                          A       H7003      RESULT WILL BE 7003, 7002  U2I01090
                          STO     CA20       *7001, OR 7000             U2I01100
                          A       CONST      MODIFY THE COMMAND         U2I01110
                          STO     CA18       *AT CA18                   U2I01120
                    CA15  LD      BUSY       IS SUBROUTINE BUSY         U2I01130
                          BSC  L  CA15,Z     YES, WAIT TIL NOT          U2I01140
                    CA17  XIO     SENSE-1    IS DEVICE READY            U2I01150
                          BSC  L  CA42,E     NO, ERROR                  U2I01160
                          LD      SENSE      SETUP CONTROL IOCC         U2I01170
                    CA18  S       SETUP      MODIFIED INSTRUCTION       U2I01180
                          STO     INIT                                  U2I01190
                    CA20  MDX     CA20+1     WHAT IS FUNCTION           U2I01200
                          MDX     CA40       READ IS ILLEGAL            U2I01210
                          MDX     CA36       = PUT  -- PUNCH--          U2I01220
                          MDX     CA25       = FEED                     U2I01230
                          MDX     CA40       STK IS ILLEGAL             U2I01240
                    CA24  LD    1 1          SAVE DATA ADDRESS          U2I01250
                          STO     COLM                                  U2I01260
                          STO     RSTRT+1                               U2I01270
                          MDX   1 1                                     U2I01280
                    CA25  MDX   1 +1         SET X1 TO SKIP 2ND PARAM   U2I01290
                          LD    1 0                                     U2I01300
                          STO     RSTRT+2                               U2I01310
                          XIO     SENSE-1                               U2I01320
                          SLA     3          IS LAST CARD IND ON        U2I01330
                          BSC  L  CA25B,-    NO                         U2I01340
                          LD      CA20       IS FUNCTION A FEED         U2I01350
                          BSC  L  CA25B,E    NO, PUNCH                  U2I01360
                          XIO     FEED-1     EJECT CARD                 U2I01370
                          MDX     CA43       TO DISPLAY NR CODE         U2I01380
                    CA25B MDX  L  50,+1      INCREMENT IOCS COUNTER     U2I01390
                          NOP                                           U2I01400
                          LD      D0001                                 U2I01410
                          STO     BUSY       SET ROUTINE BUSY           U2I01420
                    CA26  LD      ERROR                                 U2I01430
                          BSC  L  CA27,Z                                U2I01440
                          XIO     INIT-1     INITIATE I/O               U2I01450
                          MDX     CA28       SKIP FEED OPERATION        U2I01460
                    CA27  XIO     FEED-1                                U2I01470
                    CA28  MDX   1 +1                                    U2I01480
                          LD      TEMP                                  U2I01490
                    CA29  STX   1 CA34+1     SET EXIT TO SKIP 1ST PARAM U2I01500
                    CA30  LDX  L1 0          RESTORE STATUS             U2I01510
                    CA31  LDX  L2 0          *AND INDEX REGISTERS       U2I01520
                    CA32  LDS     0                                     U2I01530
                    CA34  BSC  L  0          EXIT                       U2I01540
                    CA36  S       SETUP+5                               U2I01550
                          STO     COLM+1     SETUP PUNCH I/O            U2I01560
                          LD   I1 1                                     U2I01570
                          BSC  L  CA40,+     = ERROR IF ZERO OR NEG     U2I01580
                          STO     COUNT                                 U2I01590
                          STO     RSTRT      SAVE WORD COUNT            U2I01600
                          S       D0080      DO NOT PUNCH OVER 80 COL   U2I01610
                          BSC     +          SKIP ON ERROR              U2I01620
                          MDX     CA24       GO GET DATA                U2I01630
                    CA40  LD      H1001      ERROR CODE - ILLEGAL CALL  U2I01640
                          MDX     CA44       TO ERROR EXIT  --LOC 41    U2I01650
                    CA42  SRA     1          IS DEVICE BUSY             U2I01660
                          BSC  L  CA17,E     YES, WAIT TIL NOT          U2I01670
                          SLA     3          IS DSW ERROR INDIC ON      U2I01680
                          BSC  L  CA43,-     NO                         U2I01690
                          LD      CA20       YES, IS FUNCTION FEED      U2I01700
                          BSC  L  CA43,E     NO                         U2I01710
                          STO     ERROR      YES, INDIC SKIP 1ST CD     U2I01720
                    CA43  LD      H1000      ERROR CODE - DVCE NOT RDY  U2I01730
                    CA44  MDX   1 -1                                    U2I01740
                          STX  L1 40         STORE CALL ADDR IN 40      U2I01750
                          LDX   1 41         SET EXIT FOR 41            U2I01760
                          MDX     CA29       TO SOFT ERROR TRAP         U2I01770
                    *************************************************** U2I01780
                    *             CONSTANTS                           * U2I01790
                    *************************************************** U2I01800
                          BSS  E  0                                     U2I01810
                    SENSR DC      0                                   E U2I01820
                          DC      /1702      SENSE-RESET LEVEL 4      O U2I01830
                    ADDR  DC      PLC-1      ADDR TO REPLACE O/P AREA E U2I01840
                    CHAR  DC      /1701      SENSE-RESET LEVEL 0      O U2I01850
                    COLM  DC      0          IOCC FOR COLUMN I/O      E U2I01860
                          DC      0          IOCC FOR PUNCH           O U2I01870
                    TEMP  DC      0          TEMPORARY STORAGE          U2I01880
                    INIT  DC      /0400      IOCC TO INITIATE I/O     O U2I01890
                    CONST DC      SETUP-CA18-1+/2000                    U2I01900
                    SENSE DC      /1700      SENSE DSW WITHOUT RESET  O U2I01910
                    BUSY  DC      0          ROUTINE BUSY INDICATOR     U2I01920
                    FEED  DC      /1402      IOCC TO FEED 1 CARD      O U2I01930
                    D0001 DC      +1         CONSTANT                   U2I01940
                    D0004 DC      +4         CONSTANT                   U2I01950
                    D0008 DC      +8         CONSTANT                   U2I01960
                    D0080 DC      +80        CONSTANT                   U2I01970
                    H7003 DC      /7003      INSTRUCTIONS = MDX X +3    U2I01980
                    COUNT DC      0          NO. WORDS TO XFER          U2I01990
                    ERROR DC      0          SKIP ONE CARD INDIC        U2I02000
                    INDIC DC      0          RD STATION FEED CHK IND    U2I02010
                    RSTRT DC      0          RESTART INFO - WORD COUNT  U2I02020
                          DC      0                         DATA ADDR   U2I02030
                          DC      0                       - ERROR PARAM U2I02040
                    SETUP DC      /02FC      INITIATE IOCC SETUP - GET  U2I02050
                          DC      /02FF                          - PUT  U2I02060
                          DC      /02FE                          - FEED U2I02070
                    H1000 DC      /1000      CONSTANT                   U2I02080
                    H1001 DC      /1001      CONSTANT                   U2I02090
                          DC      /0301                          - PUT  U2I02100
                    PLC   DC      *-*        WD FOR LAST CHAR PUNCHED   U2I02110
                    $PST4 EQU     /8D        POST-OPERATIVE ERROR TRAP  U2I02120
                    *************************************************** U2I02130
                    *             COLUMN INTERRUPT PROCESSING         * U2I02140
                    *************************************************** U2I02150
                    *     THIS PORTION IS ENTERED FROM INTERR LEVEL   * U2I02160
                    *     SUBROUTINE 00.                              * U2I02170
                    *            WHEN THE LAST COLUMN REQUESTED IS    * U2I02180
                    *     PUNCHED, AN INDICATION IS GIVEN TO THE 1442 * U2I02190
                    *     TO INITIATE AN OP COMPLETE INTERRUPT.       * U2I02200
                    *************************************************** U2I02210
                    CR14  XIO     CHAR-1     SENSE DSW WITH RESET       U2I02220
                          MDX  L  COUNT,-1   ANY MORE COLS TO PROCESS   U2I02230
                          MDX     CR18       YES                        U2I02240
                    CR16  MDX  L  COLM,+1    NO, STORE STOP PUNCH       U2I02250
                          LD   I  COLM       *BIT (BIT 12) IN COL       U2I02260
                          OR      D0008      *DATA                      U2I02270
                          STO     PLC                                   U2I02280
                          LD      ADDR       PUNCH FROM TEMPORARY       U2I02290
                          STO     COLM       *LOCATION                  U2I02300
                    CR18  MDX  L  COLM,+1    SET ADDR FOR NEXT COLUMN   U2I02310
                    CR20  XIO     COLM       EXECUTE COLUMN I/O         U2I02320
                    CR22  BSC  I  INT1       EXIT                       U2I02330
                    *************************************************** U2I02340
                    *             OP COMPLETE INTERRUPT PROCESSING    * U2I02350
                    *************************************************** U2I02360
                    *     THIS PORTION IS ENTERED FROM INTERR LEVEL   * U2I02370
                    *     SUBROUTINE 04. IF AN ERROR IS DETECTED,     * U2I02380
                    *     THE SUBROUTINE EXITS TO THE USERS ERROR     * U2I02390
                    *     ROUTINE VIA THE ERROR PARAMETER, AND        * U2I02400
                    *     GIVES THE USER THE OPTION OF TERMINATING    * U2I02410
                    *     OR RETRYING THE OPERATION. IF TERMINATION   * U2I02420
                    *     IS SELECTED OR IF NO ERROR IS DETECTED, THE * U2I02430
                    *     ROUTINE IS SET NOT BUSY AND THE IOCS        * U2I02440
                    *     COUNTER IS DECREMENTED TO INDICATE INTERR   * U2I02450
                    *     PROCESSING COMPLETED. OTHERWISE THE SUBRT   * U2I02460
                    *     WAITS AT POST-OPERATIVE ERROR TRAP UNTIL    * U2I02470
                    *     THE OPERATOR HAS INTERVENED                 * U2I02480
                    *     AND THE 1442 BECOMES READY, AT WHICH TIME   * U2I02490
                    *     THE CARDS ARE POSITIONED AND THE I/O OPERA- * U2I02500
                    *     TION IS RE-INITIATED.                       * U2I02510
                    *************************************************** U2I02520
                    CR60  XIO     SENSR      SENSE WITH RESET           U2I02530
                          SLA     3          IS OPERATION OK            U2I02540
                          BSC  L  CR70,C     NO, ERROR                  U2I02550
                    CR61  BSC  L  CR62,-     YES, CHK FOR LAST CARD     U2I02560
                          SRA     16         GO TO USER WITH            U2I02570
                    CR61A BSI  I  RSTRT+2    LAST CARD CODE             U2I02580
                          LD      ADDR       RETURN FROM USER           U2I02590
                          A       D0001      CHECK FUNCTION             U2I02600
                          EOR     COLM       IS FUNCTION PUT            U2I02610
                          BSC  L  CR62,Z     NO, GO TO CR62             U2I02620
                          MDX  L  INIT,+1                               U2I02630
                          XIO     INIT-1     YES, EJECT LAST CD         U2I02640
                    CR62  LD      ERROR      WAS THIS A SKIP OPERATION  U2I02650
                          SLA     16                                    U2I02660
                          STO     ERROR                                 U2I02670
                          BSC  L  CR72,C     YES, INITIATE FUNCTION     U2I02680
                    CR64  STO     BUSY       NO, CLEAR ROUTINE BUSY IND U2I02690
                          MDX  L  50,-1      DECREMENT IOCS COUNTER     U2I02700
                          NOP                                           U2I02710
                    CR66  BSC  I  INT2       RETURN TO INTERRUPT LEVEL  U2I02720
                    CR70  STO     INDIC      SAVE FD CHK (RD STAT) IND  U2I02730
                          LD      D0001                                 U2I02740
                    CR71A BSI  I  RSTRT+2    EXIT TO USER               U2I02750
                          BSC  L  CR64,+-    RESTART NOT REQUESTED      U2I02760
                          LD      INIT       IS FUNCTION PUNCH          U2I02770
                          BSC  L  CR72,E     YES, DONT SKIP             U2I02780
                          MDX     CR73B      NO, GO CHK FEED CHECK ERRO U2I02790
                    CR72  XIO     SENSE-1    IS DEVICE READY            U2I02800
                          BSC  L  CR75,E     TO ERROR-TRAP IF NOT READY U2I02810
                          LD      ERROR      IS CARD SKIP NECESSARY     U2I02820
                          BSC  L  CR73,+-    NO                         U2I02830
                          XIO     FEED-1     SKIP 1ST CARD              U2I02840
                          MDX     CR66       RETURN TO INTRP.LVL. TRN   U2I02850
                    CR73  LD      RSTRT      REINITIATE I/O             U2I02860
                          STO     COUNT      *OPERATION FROM            U2I02870
                          LD      RSTRT+1    *SAVED INFO                U2I02880
                          STO     COLM                                  U2I02890
                          XIO     INIT-1     REINITIATE AND EXIT        U2I02900
                          MDX     CR66       WITHOUT CLEARING BUSY      U2I02910
                    CR73B LD      INDIC      WAS ERROR FD CHK (RD ST)   U2I02920
                          SLA     4                                     U2I02930
                          BSC  L  CR72,Z+    YES, DONT SKIP             U2I02940
                    CR73E LD      D0001                                 U2I02950
                          STO     ERROR      SET BIT 1 OF INDIC         U2I02960
                          MDX     CR72                                  U2I02970
                    CR75  LD      H1000      LD NOT READY ERROR CODE    U2I02980
                          BSI  L  $PST4      POST-OPERATIVE ERROR TRAP  U2I02990
                          MDX     CR72       TRY AGAIN                  U2I03000
                          END                                           U2I03010
