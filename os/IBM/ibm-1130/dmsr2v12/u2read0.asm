                    *     HDNG    READ0,2501 CARD READ ROUTINE        * U2L00010
                    *************************************************** U2L00020
                    *TITLE- READ0                                     * U2L00030
                    *STATUS- CHANGE LEVEL 000                         * U2L00040
                    *FUNCTION/OPERATION-                              * U2L00050
                    *     THIS 1130 SUBROUTINE OPERATES THE PRIMARY   * U2L00060
                    *     2501 CARD READER.       IT INITIATES REQSTD * U2L00070
                    *     OPERATIONS, PROCESSES OPERATION COMPLETE    * U2L00080
                    *     INTERRUPTS, AND AUTOMATICALLY INITIATES     * U2L00090
                    *     ERROR RECOVERY PROCEDURES.                  * U2L00100
                    *                                                 * U2L00110
                    *     IDENTIFYING FEATURES                        * U2L00120
                    *       1) NO ERROR PARAMETER                     * U2L00130
                    *       2) PRIMARY 2501 ONLY                      * U2L00140
                    *ENTRY POINTS-                                    * U2L00150
                    *     1. READ0  CALL ENTRANCE FOR TEST OR READ    * U2L00160
                    *               OPERATIONS.  E.G.  LIBF    READ0  * U2L00170
                    *                                  DC      /1000  * U2L00180
                    *                                  DC      IOBUF  * U2L00190
                    *     2. RE048  OPERATION COMPLETE INTERRUPT ENTRY* U2L00200
                    *               POINT.                            * U2L00210
                    *INPUT- NONE OTHER THAN FROM THE PARAMETERS IN    * U2L00220
                    *     LIBF CALLING SEQUENCE.                      * U2L00230
                    *OUTPUT- ROUTINE WILL TRANSFER 0 TO 80 COLS FROM  * U2L00240
                    *     CARD TO I/O BUFFER AS SPECIFIED BY CALLING  * U2L00250
                    *     SEQUENCE.  FORMAT IS 12 BITS PER BUFFER WORD* U2L00260
                    *     LEFT JUSTIFIED.                             * U2L00270
                    *EXTERNAL SUBROUTINES- NONE.                      * U2L00280
                    *EXITS-                                           * U2L00290
                    *  NORMAL-                                        * U2L00300
                    *     1. RE180  IF NO PRE-OP ERROR HAS BEEN DE-   * U2L00310
                    *               TECTED, THE EXIT FROM RE180 IS    * U2L00320
                    *               TO THE CALLER AFTER THE REQUESTED * U2L00330
                    *               2501 OPERATION HAS BEEN INITIATED * U2L00340
                    *     2. RE348  THE EXIT FROM RE348 IS BACK TO THE* U2L00350
                    *               CALLER VIA ILS04 AFTER OP COMPLETE* U2L00360
                    *               PROCESSING HAS BEEN FINISHED.     * U2L00370
                    *  ERROR-                                         * U2L00380
                    *     1. RE180  IF A PRE-OP ERROR OR NOT READY    * U2L00390
                    *               CONDITION IS DETECTED, SUBROUTINE * U2L00400
                    *               WILL BRANCH TO HEX 0029 VIA RE180 * U2L00410
                    *               AND DISPLAY ONE OF TWO CODES IN   * U2L00420
                    *               ACCUMULATOR.                      * U2L00430
                    *               4000 IS DISPLAYED IF 2501 IS NOT  * U2L00440
                    *               READY.  4001 IS DISPLAYED IF AN   * U2L00450
                    *               ERROR IS DISCOVERED IN CALLING    * U2L00460
                    *               PARAMETERS OR AREAS REFERENCED BY * U2L00470
                    *               THEM.                             * U2L00480
                    *TABLES/WORK AREAS- NONE.                         * U2L00490
                    *ATTRIBUTES- REUSABLE, CAN READ UP TO 80 COLUMNS  * U2L00500
                    *               OF BINARY DATA.  IF A WORD COUNT  * U2L00510
                    *               OF ZERO IS SPECIFIED, THE READ    * U2L00520
                    *               OPERATION ACTS AS A FEED.         * U2L00530
                    *NOTES- THIS SUBR CONTAINS NO WAIT INSTRUCTIONS.  * U2L00540
                    *       THE 'SPEED' SUBR SHOULD NOT BE USED WITH  * U2L00550
                    *       READ0, AS I/O BUFFER IS NOT FILLED WITH   * U2L00560
                    *       INDICATOR BITS AS READING BEGINS.         * U2L00570
                    *************************************************** U2L00580
                          LIBR                                          U2L00590
                    1130  ISS  04 READ0     4                           U2L00600
                    *************************************************** U2L00610
                    *             LOADER DEFINED LOCATIONS            * U2L00620
                    *************************************************** U2L00630
                    READ0 STX   1 RE144+1    LIBF ENTRANCE              U2L00640
                    RE036 LDX  I1 0          LOADER STORES TV ADDR (+2) U2L00650
                          MDX     RE060      BR TO PROCESS CALL         U2L00660
                    RE048 DC      0          OP CMPLTE INTERRUPT   (+4) U2L00670
                          BSC  L  RE336      BR TO PROCESS INT          U2L00680
                    *************************************************** U2L00690
                    *             LIBF PROCESSING                     * U2L00700
                    *************************************************** U2L00710
                    *     THIS PORTION STORES CALLING SEQUENCE INFO   * U2L00720
                    *     AND CHECKS THE DEVICE STATUS BEFORE ANY I/O * U2L00730
                    *     OPERATION IS INITIATED. A CALLING ERROR OR  * U2L00740
                    *     NOT READY 2501 CAUSES AN ERROR EXIT TO      * U2L00750
                    *     LOCATION 41. IF THE OPERATION WILL CAUSE    * U2L00760
                    *     INTERRUPT , THE ROUTINE IS SET BUSY AND THE * U2L00770
                    *     IOCS COUNTER IS INCREMENTED TO INDICATE     * U2L00780
                    *     INTERRUPT    PENDING.                       * U2L00790
                    *************************************************** U2L00800
                    RE060 STO     RE324      SAVE ACC                   U2L00810
                          STS     RE168      SAVE STATUS                U2L00820
                          STX   2 RE156+1    SAVE XR2                   U2L00830
                          LD    1 0          X1= ADDR OF CALL+1         U2L00840
                          SRA     12         IS FUNCTION TEST           U2L00850
                          BSC  L  RE072,Z    BR IF NOT                  U2L00860
                          LD      RE228      IS SUBR BUSY               U2L00870
                          BSC     +-         SKIP IF YES                U2L00880
                          MDX   1 +1         NO, EXIT TO CALL+3         U2L00890
                          MDX     RE120      EXIT TO CALL +2            U2L00900
                    RE072 S       RE240      IS FUNCTION LEGAL          U2L00910
                          BSC  L  RE192,Z    BR IF NOT                  U2L00920
                    RE084 LD      RE228      IS SUBR BUSY               U2L00930
                          BSC  L  RE084,Z    YES, LOOP                  U2L00940
                    RE096 XIO     RE288-1    IS DEVICE READY            U2L00950
                          BSC  L  RE204,E    BR IF NOT                  U2L00960
                          LD   I1 1          OBTAIN WORD COUNT          U2L00970
                          BSC     +-                                    U2L00980
                          MDX     RE108      BR ON Z WD CNT             U2L00990
                          BSC  L  RE192,Z+   BR IF WD CNT NEG           U2L01000
                          S       RE276      0 THRU 80 IS LEGAL         U2L01010
                          BSC  L  RE192,Z-   BR IF OVER 80              U2L01020
                    RE108 MDX   1 +1         SET XR1 TO SKIP 2ND PARAM  U2L01030
                          LD    1 0          SAVE DATA ADDR             U2L01040
                          STO     RE264                                 U2L01050
                          MDX  L  50,+1      INCREMENT IOCS COUNTER     U2L01060
                          NOP                                           U2L01070
                          STX   0 RE228      SET SUBR BUSY INDR         U2L01080
                          XIO     RE264      READ                       U2L01090
                    RE120 MDX   1 +1                                    U2L01100
                          LD      RE324      RESTORE ACC                U2L01110
                    RE132 STX   1 RE180+1    SET EXIT TO SKIP 1ST PARAM U2L01120
                    RE144 LDX  L1 *-*        RESTORE STATUS             U2L01130
                    RE156 LDX  L2 *-*        AND INDEX REGISTERS        U2L01140
                    RE168 LDS     *-*                                   U2L01150
                    RE180 BSC  L  *-*        EXIT                       U2L01160
                    RE192 LD      RE312      ERROR CODE - ILLEGAL CALL  U2L01170
                          MDX     RE216      BR TO SET RETURN ADRS      U2L01180
                    RE204 SRA     1          IS DEVICE BUSY             U2L01190
                          BSC  L  RE096,E    BR IF YES                  U2L01200
                          LD      RE300      ERROR CODE - DVCE NOT RDY  U2L01210
                    RE216 MDX   1 -1                                    U2L01220
                          STX  L1 40         STORE CALL ADDR IN 40      U2L01230
                          LDX   1 41         SET EXIT                   U2L01240
                          MDX     RE132      BR TO EXIT                 U2L01250
                    *************************************************** U2L01260
                    *             CONSTANTS                             U2L01270
                    *************************************************** U2L01280
                    RE228 DC      0          SUBR BUSY INDR             U2L01290
                          BSS  E  0                                     U2L01300
                    RE240 DC      +1         CONSTANT                   U2L01310
                    RE252 DC      /4F01      SENSE  WITH RESET          U2L01320
                    RE264 DC      *-*        I/O BUFFER ADDRESS       E U2L01330
                          DC      /4E00      IOCC TO INITIATE READ    O U2L01340
                    RE276 DC      +80        CONSTANT                   U2L01350
                    RE288 DC      /4F00      SENSE DSW WITHOUT RESET  O U2L01360
                    RE300 DC      /4000      CONSTANT FOR DVC NR        U2L01370
                    RE312 DC      /4001      CST FOR BAD CALL           U2L01380
                    RE324 DC      *-*        SAVED ACC                  U2L01390
                    $PST4 EQU     /8D        POST-OPERATIVE ERROR TRAP  U2L01400
                    *************************************************** U2L01410
                    *             OP COMPLETE INTERRUPT PROCESSING    M U2L01420
                    *************************************************** U2L01430
                    *     THIS PORTION IS ENTERED FROM AN INTERRUPT   * U2L01440
                    *     LEVEL SUBRT. IF NO ERROR HAS BEEN DETECTED  * U2L01450
                    *     THE ROUTINE IS SET NOT BUSY AND THE IOCS    * U2L01460
                    *     COUNTER IS DECREMENTED TO INDICATE          * U2L01470
                    *     INTERRUPT PROCESSING COMPLETED. OTHERWISE   * U2L01480
                    *     THE SUBR.GOES TO THE POST-OPERATIVE ERROR-  * U2L01490
                    *     TRAP AND WAITS UNTIL THE OPERATOR HAS       * U2L01500
                    *     INTERVENED AND THE 2501 BECOMES READY, AT   * U2L01510
                    *     WHICH TIME THE CARDS ARE POSITIONED AND THE * U2L01520
                    *     I/O OPERATION IS RE-INITIATED.              * U2L01530
                    *************************************************** U2L01540
                    RE336 XIO     RE252-1    SENSE DSW WITH RESET       U2L01550
                          SLA     3          IS OPERATION OK            U2L01560
                          BSC  L  RE360,C    BR IF ERROR                U2L01570
                          MDX  L  50,-1      ELSE TERMINATE             U2L01580
                          NOP                DECREMENT IOCS COUNT       U2L01590
                          SRA     16                                    U2L01600
                          STO     RE228      CLEAR ROUT BUSY INDIC      U2L01610
                    RE348 BSC  I  RE048      EXIT                       U2L01620
                    RE360 XIO     RE252-1    SENSE DSW FOR READY        U2L01630
                          BSC  L  RE365,E    TO ERROR EXIT IF NOT READY U2L01640
                          XIO     RE264      RE-INITIATE FUNCTION       U2L01650
                          MDX     RE348      BR TO EXIT                 U2L01660
                    RE365 LD      RE300      LD NOT READY ERROR CODE    U2L01670
                          BSI  L  $PST4      POST-OPERATIVE ERROR TRAP  U2L01680
                          MDX     RE360      TRY AGAIN                  U2L01690
                          END                                           U2L01700
