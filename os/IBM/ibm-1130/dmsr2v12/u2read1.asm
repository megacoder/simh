                          HDNG    READ1,2501 CARD READ ROUTINE          U2M00010
                    *************************************************** U2M00020
                    *TITLE- READ1                                     * U2M00030
                    *STATUS- CHANGE LEVEL 000                         * U2M00040
                    *FUNCTION/OPERATION-                              * U2M00050
                    *     THIS 1130 SUBROUTINE OPERATES THE PRIMARY   * U2M00060
                    *     2501 CARD READER.       IT INITIATES REQSTD * U2M00070
                    *     OPERATIONS, PROCESSES OPERATION COMPLETE    * U2M00080
                    *     INTERRUPTS,INITIATES EXITS TO USERS ERR.RTN.* U2M00090
                    *     WHEN AN ERROR OR LAST CARD IS ENCOUNTERED   * U2M00100
                    *                                                 * U2M00110
                    *     IDENTIFYING FEATURES                        * U2M00120
                    *       1)    ERROR PARAMETER                     * U2M00130
                    *       2) PRIMARY 2501 ONLY                      * U2M00140
                    *ENTRY POINTS-                                    * U2M00150
                    *     1. READ1  CALL ENTRANCE FOR TEST OR READ    * U2M00160
                    *               OPERATIONS.  E.G.  LIBF    READ1  * U2M00170
                    *                                  DC      /1000  * U2M00180
                    *                                  DC      IOBUF  * U2M00190
                    *                                  DC      ERROR    U2M00200
                    *     2. RE048  OPERATION COMPLETE INTERRUPT ENTRY* U2M00210
                    *               POINT.                            * U2M00220
                    *INPUT- NONE OTHER THAN FROM THE PARAMETERS IN    * U2M00230
                    *     LIBF CALLING SEQUENCE.                      * U2M00240
                    *OUTPUT- ROUTINE WILL TRANSFER 0 TO 80 COLS FROM  * U2M00250
                    *     CARD TO I/O BUFFER AS SPECIFIED BY CALLING  * U2M00260
                    *     SEQUENCE.  FORMAT IS 12 BITS PER BUFFER WORD* U2M00270
                    *     LEFT JUSTIFIED.                             * U2M00280
                    *EXTERNAL SUBROUTINES- NONE.                      * U2M00290
                    *EXITS-                                           * U2M00300
                    *  NORMAL-                                        * U2M00310
                    *     1. RE180  IF NO PRE-OP ERROR HAS BEEN DE-   * U2M00320
                    *               TECTED, THE EXIT FROM RE180 IS    * U2M00330
                    *               TO THE CALLER AFTER THE REQUESTED * U2M00340
                    *               2501 OPERATION HAS BEEN INITIATED * U2M00350
                    *     2. RE348  THE EXIT FROM RE348 IS BACK TO THE* U2M00360
                    *               CALLER VIA ILS04 AFTER OP COMPLETE* U2M00370
                    *               PROCESSING HAS BEEN FINISHED.     * U2M00380
                    *  ERROR-                                         * U2M00390
                    *     1. RE180  IF A PRE-OP ERROR OR NOT READY    * U2M00400
                    *               CONDITION IS DETECTED, SUBROUTINE * U2M00410
                    *               WILL BRANCH TO HEX 0029 VIA RE180 * U2M00420
                    *               AND DISPLAY ONE OF TWO CODES IN   * U2M00430
                    *               ACCUMULATOR.                      * U2M00440
                    *               4000 IS DISPLAYED IF 2501 IS NOT  * U2M00450
                    *               READY.  4001 IS DISPLAYED IF AN   * U2M00460
                    *               ERROR IS DISCOVERED IN CALLING    * U2M00470
                    *               PARAMETERS OR AREAS REFERENCED BY * U2M00480
                    *               THEM.                             * U2M00490
                    *               IF A POST-OPERATIVE ERROR OR LAST * U2M00500
                    *               CARD INDR IS DETECTED, THIS SUBR  * U2M00510
                    *               EXITS TO THE USERS ERROR SUBR.    * U2M00520
                    *               VIA RE360+1 AND RE370+1 RESPEC-   * U2M00530
                    *               TIVELY                            * U2M00540
                    *TABLES/WORK AREAS- NONE.                         * U2M00550
                    *ATTRIBUTES- REUSABLE, CAN READ UP TO 80 COLUMNS  * U2M00560
                    *               OF BINARY DATA.  IF A WORD COUNT  * U2M00570
                    *               OF ZERO IS SPECIFIED, THE READ    * U2M00580
                    *               OPERATION ACTS AS A FEED.         * U2M00590
                    *NOTES- THIS SUBR CONTAINS NO WAIT INSTRUCTIONS.  * U2M00600
                    *       THE 'SPEED' SUBR SHOULD NOT BE USED WITH  * U2M00610
                    *       READ1, AS I/O BUFFER IS NOT FILLED WITH   * U2M00620
                    *       INDICATOR BITS AS READING BEGINS.         * U2M00630
                    *************************************************** U2M00640
                          LIBR                                          U2M00650
                    1130  ISS  04 READ1     4                           U2M00660
                    *************************************************** U2M00670
                    *             LOADER DEFINED LOCATIONS            * U2M00680
                    *************************************************** U2M00690
                    READ1 STX   1 RE144+1    LIBF ENTRANCE              U2M00700
                    RE036 LDX  I1 0          LOADER STORES TV ADDR (+2) U2M00710
                          MDX     RE060      BR TO PROCESS CALL         U2M00720
                    RE048 DC      0          OP CMPLTE INTERRUPT   (+4) U2M00730
                          BSC  L  RE336      BR TO PROCESS INT          U2M00740
                    *************************************************** U2M00750
                    *             LIBF PROCESSING                     * U2M00760
                    *************************************************** U2M00770
                    *     THIS PORTION STORES CALLING SEQUENCE INFO   * U2M00780
                    *     AND CHECKS THE DEVICE STATUS BEFORE ANY I/O * U2M00790
                    *     OPERATION IS INITIATED. A CALLING ERROR OR  * U2M00800
                    *     NOT READY 2501 CAUSES AN ERROR EXIT TO      * U2M00810
                    *     LOCATION 41. IF THE OPERATION WILL CAUSE    * U2M00820
                    *     INTERRUPT , THE ROUTINE IS SET BUSY AND THE * U2M00830
                    *     IOCS COUNTER IS INCREMENTED TO INDICATE     * U2M00840
                    *     INTERRUPT    PENDING.                       * U2M00850
                    *************************************************** U2M00860
                    RE060 STO     RE324      SAVE ACC                   U2M00870
                          STS     RE168      SAVE STATUS                U2M00880
                          STX   2 RE156+1    SAVE XR2                   U2M00890
                          LD    1 0          XR1 HAS ADDR OF CALL+1     U2M00900
                          SRA     12         IS FUNCTION TEST           U2M00910
                          BSC  L  RE072,Z    BR IF NOT                  U2M00920
                          LD      RE228      TEST SUBR BUSY             U2M00930
                          BSC     +-         SKIP IF BUSY               U2M00940
                          MDX   1 +1         *ELSE EXIT TO CALL+3       U2M00950
                          MDX     RE120      EXIT TO CALL+2             U2M00960
                    RE072 S       RE240      IS FUNCTION LEGAL          U2M00970
                          BSC  L  RE192,Z    BR IF NOT                  U2M00980
                    RE084 LD      RE228      IS SUBR BUSY               U2M00990
                          BSC  L  RE084,Z    YES, LOOP                  U2M01000
                    RE096 XIO     RE288-1    IS DEVICE READY            U2M01010
                          BSC  L  RE204,E    BR IF NOT                  U2M01020
                          LD   I1 1          OBTAIN WORD COUNT          U2M01030
                          BSC     +-                                    U2M01040
                          MDX     RE108      BR ON Z WD CNT             U2M01050
                          BSC  L  RE192,Z+   BR IF WD CNT NEG           U2M01060
                          S       RE276      0 THRU 80 IS LEGAL         U2M01070
                          BSC  L  RE192,Z-   BR IF OVER 80              U2M01080
                    RE108 MDX   1 +2         SET XR1 TO SKIP PARAMS     U2M01090
                          LD    1 -1         SAVE DATA ADDRESS          U2M01100
                          STO     RE264                                 U2M01110
                          LD    1 0          LOAD ERROR PARAMETER       U2M01120
                          STO     RE360+2    STORE IN INTERRUPT ROUTINE U2M01130
                          STO     RE370+2    ERROR AND LAST CARD EXITS  U2M01140
                          MDX  L  50,+1      INCREMENT IOCS COUNTER     U2M01150
                          NOP                                           U2M01160
                          STX   0 RE228      SET BUSY INDR ON           U2M01170
                          XIO     RE264      READ                       U2M01180
                    RE120 MDX   1 +1                                    U2M01190
                          LD      RE324      RESTORE ACC                U2M01200
                    RE132 STX   1 RE180+1    SET TO SKIP 1ST PARAMETER  U2M01210
                    RE144 LDX  L1 *-*        RESTORE STATUS             U2M01220
                    RE156 LDX  L2 *-*        AND INDEX REGISTERS        U2M01230
                    RE168 LDS     *-*                                   U2M01240
                    RE180 BSC  L  *-*        EXIT                       U2M01250
                    RE192 LD      RE312      ERROR CODE - ILLEGAL CALL  U2M01260
                          MDX     RE216      BR TO SET RETURN ADDR      U2M01270
                    RE204 SRA     1          IS DEVICE BUSY             U2M01280
                          BSC  L  RE096,E    BR IF YES                  U2M01290
                          LD      RE300      ERROR CODE - DVCE NOT RDY  U2M01300
                    RE216 MDX   1 -1                                    U2M01310
                          STX  L1 40         STORE CALL ADDR IN 40      U2M01320
                          LDX   1 41         SET EXIT                   U2M01330
                          MDX     RE132      BR TO EXIT                 U2M01340
                    *************************************************** U2M01350
                    *             CONSTANTS                             U2M01360
                    *************************************************** U2M01370
                    RE228 DC      0          ROUTINE BUSY INDICATOR     U2M01380
                          BSS  E  0                                     U2M01390
                    RE240 DC      +1         CONSTANT                   U2M01400
                    RE252 DC      /4F01      SENSE WITH RESET           U2M01410
                    RE264 DC      *-*        I/O BUFFER ADDRESS       E U2M01420
                          DC      /4E00      IOCC TO INITIATE READ    O U2M01430
                    RE276 DC      +80        CONSTANT                   U2M01440
                    RE288 DC      /4F00      SENSE DSW WITHOUT RESET  O U2M01450
                    RE300 DC      /4000      CONSTANT FOR DVC NOT RDY   U2M01460
                    RE312 DC      /4001      CST FOR BAD CALL           U2M01470
                    RE324 DC      *-*        SAVED ACC                  U2M01480
                    $PST4 EQU     /8D        POST-OP ERROR TRAP         U2M01490
                    *************************************************** U2M01500
                    *             OP COMPLETE INTERRUPT PROCESSING    * U2M01510
                    *************************************************** U2M01520
                    *     THIS PORTION IS ENTERED FROM AN INTERRUPT   * U2M01530
                    *     LVL.SUBRT.IF NO ERROR OR LAST CARD IS FOUND,* U2M01540
                    *     THE ROUTINE IS SET NOT BUSY AND THE IOCS    * U2M01550
                    *     COUNTER IS DECREMENTED TO INDICATE          * U2M01560
                    *     INTERRUPT PROCESSING COMPLETED. OTHERWISE   * U2M01570
                    *     THE ROUTINE EXITS TO THE USER VIA RE360+1   * U2M01580
                    *     WITH THE READ ERROR CODE--0001,ON RETURN IF * U2M01590
                    *     ACC.=0,THE FUNCTION IS TERMINATED,IF NON-ZERO U2M01600
                    *     WAIT AT THE POST-OPERATIVE  ERROR TRAP TILL * U2M01610
                    *     THE READER IS READY AND THEN RE-INITIATE    * U2M01620
                    *     THE FUNCTION.IF THE DSW INDICATED LAST CARD * U2M01630
                    *     EXIT TO USER WITH ZERO CODE IN ACC.,UPON    * U2M01640
                    *     RETURN,TERMINATE FUNCTION.                  * U2M01650
                    *************************************************** U2M01660
                    RE336 XIO     RE252-1    SENSE WITH RESET           U2M01670
                          SLA     3          CHECK FOR READ ERROR       U2M01680
                          BSC  L  RE360,C    YES,GOTO ERROR EXIT        U2M01690
                          BSC     +Z         CHECK FOR LAST CARD INDIC  U2M01700
                          MDX     RE370      YES,GO TELL USER           U2M01710
                    *TERMINATE OPERATION AND EXIT TO ILS                U2M01720
                    RE340 MDX  L  50,-1      DECREMENT IOCS COUNTER     U2M01730
                          NOP                                           U2M01740
                          SRA     16         CLEAR ROUTINE              U2M01750
                          STO     RE228      BUSY INDICATOR             U2M01760
                    RE348 BSC  I  RE048      RETURN TO ILS              U2M01770
                    *                                                   U2M01780
                    *EXIT TO USERS ERROR ROUTINE WITH READ ERROR CODE   U2M01790
                    *                                                   U2M01800
                    RE360 LD      RE240      LOAD READ ERROR CODE--0001 U2M01810
                          BSI  L  *-*        EXIT TO USERS ERROR RTN.   U2M01820
                          BSC     +-         UPON RETURN,TEST ACCUM.    U2M01830
                          MDX     RE340      ZERO,TERMINATE OPERATION   U2M01840
                    * IF ACCUM.NON-ZERO,CHECK READER FOR READY AND      U2M01850
                    * RE-INITIATE OPERATION                             U2M01860
                    RE362 XIO     RE288-1    SENSE WITHOUT RESET,       U2M01870
                          BSC  L  RE375,E    TO ERROR EXIT IF NOT READY U2M01880
                          XIO     RE264      RE-INITIATE OPERATION      U2M01890
                          MDX     RE348      EXIT,BUT DONT CLEAR BUSY   U2M01900
                    *                                                   U2M01910
                    *EXIT TO USER WITH LAST CARD INDICATION             U2M01920
                    *                                                   U2M01930
                    RE370 SRA     16         LAST CARD ERROR CODE,A=0   U2M01940
                          BSI  L  *-*        EXIT TO USERS ERROR RTN    U2M01950
                          MDX     RE340      UPON RETURN,GO TERMINATE   U2M01960
                    RE375 LD      RE300      NOT READY ERROR CODE       U2M01970
                          BSI  L  $PST4      POST-OP ERROR TRAP         U2M01980
                          MDX     RE362      TRY AGAIN                  U2M01990
                          END                                           U2M02000
