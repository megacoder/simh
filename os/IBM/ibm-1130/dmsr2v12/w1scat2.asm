                          HDNG    SCAT2 PROLOGUE                        W1H00010
                    *************************************************** W1H00020
                    * TITLE - SCAT2                                   * W1H00030
                    * STATUS - CHANGE LEVEL 10                        * W1H00040
                    * FUNCTION/OPERATION - SCAT2 CAN PERFORM THE      * W1H00050
                    *  FOLLOWING BINARY SYNCHRONOUS FUNCTIONS IN A    * W1H00060
                    *  POINT-TO-POINT ENVIRONMENT                     * W1H00070
                    *                                                 * W1H00080
                    *  1. TEST - SCAT2 TESTS A PROGRAMMED DEVICE RTN. * W1H00090
                    *            BUSY INDICATOR .RTBSY.  WHEN .RTBSY. * W1H00100
                    *            IS ON, SCAT2 HAS NOT YET COMPLETED   * W1H00110
                    *            THE PREVIOUS OPERATION.              * W1H00120
                    *  2. AUTO ANSWER - SCAT2 ENABLES OR DISABLES THE * W1H00130
                    *            AUTO ANSWER INTERRUPT DEPENDING UPON * W1H00140
                    *            THE VALUE OF DIGIT 3 OF THE CONTROL  * W1H00150
                    *            PARAMETER, ZERO - ENABLE.            * W1H00160
                    *  3. ALARM - SCAT2 TURNS ON OR OFF THE AUDIBLE   * W1H00170
                    *            ALARM DEPENDING UPON THE VALUE OF    * W1H00180
                    *            DIGIT 3 OF THE CONTROL PARAMETER,    * W1H00190
                    *            ZERO - ON.                           * W1H00200
                    *  4. CLOSE - SCAT2 ENDS ALL S.C.A. OPERATIONS AND* W1H00210
                    *            RESETS SOME PROGRAM INDICATORS TO    * W1H00220
                    *            THEIR INITIAL CONDITION.             * W1H00230
                    *  5. RECEIVE INITIAL - SCAT2 MONITORS THE LINE   * W1H00240
                    *            FOR ENQ, TRANSMITS ACK0, AND RECEIVES* W1H00250
                    *            THE MESSAGE.                         * W1H00260
                    *  6. RECEIVE CONTINUE - SCAT2 TRANSMITS THE      * W1H00270
                    *            CORRECT POSITIVE ACKNOWLEDGEMENT     * W1H00280
                    *            (ACK0 OR ACK1) FOR THE CURRENT       * W1H00290
                    *            MESSAGE AND RECEIVES THE NEXT MESSAGE* W1H00300
                    *  7. RECEIVE REPEAT - SCAT2 TRANSMITS NAK FOR THE* W1H00310
                    *            CURRENT MESSAGE AND RECEIVES THE NEXT* W1H00320
                    *            MESSAGE.                             * W1H00330
                    *  8. TRANSMIT INITIAL BLOCK/TEST - SCAT2 TRANSMIT* W1H00340
                    *            ENQ, RECEIVES ACK0, TRANSMITS MESSAGE* W1H00350
                    *            TRANSMITS CRC-16, AND RECEIVES ACK1. * W1H00360
                    *  9. TRANSMIT CONTINUE BLOCK/TEXT - SCAT2        * W1H00370
                    *            TRANSMITS THE MESSAGE, TRANSMITS THE * W1H00380
                    *            CRC-16, AND RECEIVES ACKNOWLEDGEMENT.* W1H00390
                    *  10. TRANSMIT INITIAL/CONTINUE TRANSPARENT      * W1H00400
                    *            BLOCK/TEXT - SAME FUNCTION AS        * W1H00410
                    *            NON-TRANSPARENT, EXCEPT THAT SCAT2   * W1H00420
                    *            SUPPLIES THE END CHARACTERS,         * W1H00430
                    *            DLE ETB/DLE ETX.                     * W1H00440
                    *  11. TRANSMIT END - SCAT2 TRANSMITS EOT OR      * W1H00450
                    *            DLE EOT DEPENDING UPON THE VALUE OF  * W1H00460
                    *            DIGIT 2 OF THE CONTROL PARAMETER,    * W1H00470
                    *            ZERO - EOT.                          * W1H00480
                    *  12. ERROR STATISTICS - SCAT2 MAINTAINS AN   2-3* W1H00490
                    *            10-WORD LOG OF ERROR STATISTICS.  2-6* W1H00500
                    *            REFER TO SRL FOR COMPLETE         2-3* W1H00510
                    *            DESCRIPTION FORM C26-3706.        2-3* W1H00520
                    *  13. LOGGING - SCAT2 PROVIDES THE POSSIBILITY2-3* W1H00530
                    *            FOR A USER-WRITTEN PROGRAM TO LOG 2-3* W1H00540
                    *            ALL CHARACTERS RECEIVED OR TRANS- 2-3* W1H00550
                    *            MITTED,TIMEOUTS AND FUNCTION CODE.2-3* W1H00560
                    *            REFER TO SRL FOR COMPLETE         2-3* W1H00570
                    *            DESCRIPTION FORM C26-3706.        2-3* W1H00580
                    *  14. READ ENQ - SCAT2 MONITORS THE LINE      2-5* W1H00590
                    *            FOR ENQ.                          2-5* W1H00600
                    *  15. ID SEQUENCE - SCAT2 ALLOWS A MAXIMUM NO 2-6* W1H00610
                    *            OF 15 ID CHARACTERS PRECEDING ENQ 2-6* W1H00620
                    *            ACK0 OR NAK ON RECEIVE INITIAL,   2-6* W1H00630
                    *            TRANSMIT INITIAL BLOCK OR TEXT.   2-6* W1H00640
                    *                                                 * W1H00650
                    * ENTRY POINTS - .SCAT2. CALL ENTRANCE, LIBF SCAT2* W1H00660
                    *                .INT1.  INTERRUPT ENTRANCE, BSI  * W1H00670
                    *                        FROM ILS01               * W1H00680
                    * INPUT - UNPACKED, LEFT-JUSTIFIED DATA OR        * W1H00690
                    *            PACKED DATA. EBCDIC IF            2-4* W1H00700
                    *            NOT TRANSPARENT. REFER TO SRL FOR A  * W1H00710
                    *            COMPLETE DESCRIPTION OF THE I/O AREA,* W1H00720
                    *            FORM C26-3706.                       * W1H00730
                    * OUTPUT - SAME AS INPUT                          * W1H00740
                    * EXTERNAL ROUTINES - IOLOG                    2-3* W1H00750
                    * EXITS-NORMAL - .RET. RETURN TO MAINLINE AT      * W1H00760
                    *            LIBF+2, LIBF+3, OR LIBF+4 DEPENDING  * W1H00770
                    *            UPON THE FUNCTION                    * W1H00780
                    *       ERROR - WORD 41-PRE-OPERATIVE ERROR HALT, * W1H00790
                    *              .USERR. BSI TO USERS ERROR ROUTINE * W1H00800
                    *            ON ALL POST-OPERATIVE ERRORS.        * W1H00810
                    * TABLES/WORK AREAS - THE MAJORITY OF CONSTANTS   * W1H00820
                    *            AND INDICATORS USED BY SCAT2 FOLLOW  * W1H00830
                    *            .T. AND ARE ACCESSED IN REFERENCE    * W1H00840
                    *            TO .T.   THE EBCDIC CONTROL CHARACTER* W1H00850
                    *            ARE LOCATED IN TABLE .EBC.           * W1H00860
                    * ATTRIBUTES - REUSABLE                           * W1H00870
                    * NOTES - SCAT2 IS AN INTERRUPT SERVICE SUBROUTINE* W1H00880
                    *            THE CALLING SEQUENCE IS AS FOLLOWS   * W1H00890
                    *                   LIBF  SCAT2                   * W1H00900
                    *                   DC    /XXXX CONTROL PARAMETER * W1H00910
                    *                   DC    IOAR  I/O AREA ADDRESS  * W1H00920
                    *                   DC    ERROR ERROR RTN. ADDRS. * W1H00930
                    * REFERENCE DOCUMENTS -                           * W1H00940
                    *     SRL - IBM 1130 SYNCHRONOUS COMMUNICATIONS   * W1H00950
                    *           ADAPTER SUBROUTINES C26-3706          * W1H00960
                    *     PLM - IBM 1130 MONITOR PROGRAMMING SYSTEM   * W1H00970
                    *           PROGRAM LOGIC MANUAL                  * W1H00980
                    *               Y26-3620                          * W1H00990
                    *           IBM 1130/1800 PROGRAMMING SYSTEM      * W1H01000
                    *           PROGRAM LOGIC MANUAL                  * W1H01010
                    *               Y26-3752                          * W1H01020
                    *************************************************** W1H01030
                          HDNG    ****  SCAT2 - CALL PROCESSING  ****   W1H01040
                          LIBR                                          W1H01050
                    1130  ISS  08 SCAT2     1                           W1H01060
                    *************************************************** W1H01070
                    *             CALL ENTRANCE FOR BI-SYNC           * W1H01080
                    *             POINT-TO-POINT                      * W1H01090
                    *************************************************** W1H01100
                    SCAT2 STX   1 XR1+1      SAVE XR1              (+0) W1H01110
                          LDX  I1 *-*        XR1 - LIBF+1          (+2) W1H01120
                          MDX     PROC       BR TO PROCESS CALL         W1H01130
                    *************************************************** W1H01140
                    *             INTERRUPT ENTRANCE                  * W1H01150
                    *             THE INTERRUPT LEVEL SUBROUTINE FOR  * W1H01160
                    *             LEVEL 1 WILL DO A BSI TO .INT1. WHEN* W1H01170
                    *             THERE IS AN ADAPTER INTERRUPT.      * W1H01180
                    *************************************************** W1H01190
                    INT1  DC      0                                (+4) W1H01200
                          BSC  L  INT2       BR TO PROCESS INTERRUPT    W1H01210
                    *************************************************** W1H01220
                    *             THIS PORTION OF THE SCAT2 SUBROUTINE* W1H01230
                    *             WILL PROCESS THE CALLING SEQUENCE   * W1H01240
                    *************************************************** W1H01250
                    PROC  STD     AQ         SAVE A,Q                   W1H01260
                          STS     STAT            STATUS                W1H01270
                          STX   2 XR2+1           XR2                   W1H01280
                          LDX  L2 T          T=BASE ADDRS OF CONSTANTS  W1H01290
                          LD    1 0          CONTROL PARAMETER          W1H01300
                          SRA     12         FUNCTION CODE              W1H01310
                          BSC  L  NTEST,Z    BR IF NOT TEST FUNCTION    W1H01320
                    *                                                 * W1H01330
                    ****                     TEST FUNCTION         **** W1H01340
                          LD    2 RTBSY-T    ROUTINE BUSY INDICATOR     W1H01350
                          BSC     +-         SKIP IF BUSY (ON)          W1H01360
                    EXIT  MDX   1 +1         NOT BUSY, RETURN TO LIBF+3 W1H01370
                          MDX   1 +1         BUSY, RETURN TO LIBF+2     W1H01380
                          LDD     AQ         RESTORE A,Q                W1H01390
                          STX   1 RET+1      SET UP EXIT BRANCH         W1H01400
                    STAT  LDS     0          RESTORE STATUS             W1H01410
                    XR1   LDX  L1 *-*                XR1                W1H01420
                    XR2   LDX  L2 *-*                XR2                W1H01430
                    RET   BSC  L  *-*        RETURN TO MAINLINE OR 41   W1H01440
                    *************************************************** W1H01450
                    NTEST A     2 H6FFF-T    SET UP MDX TO FUNCTION     W1H01460
                          STO     MDX1            TYPE 1-D              W1H01470
                          S     2 H700D-T                           2-6 W1H01480
                          BSC  L  ER1,-      BR IF BAD FUNC CODE    2-6 W1H01490
                    *                                                 * W1H01500
                          STO     TEMP       SAVE FOR USE AFTER BUSY    W1H01510
                          LD    1 0          PICK UP DIGIT 3 OF CONTROL W1H01520
                          CALL    CPLOG      LOG CONTROL PARAMETER  2-3 W1H01530
                          AND   2 H00F0-T    PARA FOR AUTO ANS, ALARM   W1H01540
                    *                                                 * W1H01550
                    MDX1  MDX     MDX1       MODIFIED BY FUNCTION CODE  W1H01560
                          MDX     AUTOA      AUTO ANSWER    CODE 1      W1H01570
                          MDX     ALARM      ALARM          CODE 2      W1H01580
                          MDX     CLOS       CLOSE          CODE 3      W1H01590
                          BSC     +-Z        RECEIVE        CODE 4      W1H01600
                          BSC     +-Z        XMIT BLOCK     CODE 5      W1H01610
                          NOP                XMIT TEXT      CODE 6      W1H01620
                          MDX     TEST       XMIT END       CODE 7  2-3 W1H01630
                          MDX     SUPD       STATISTICS     CODE 8  2-5 W1H01640
                          MDX     RENQ       READ ENQ       CODE 9  2-5 W1H01650
                          MDX     IDCAL      ID CALL        CODE A  2-6 W1H01660
                          NOP                RCV ID         CODE B  2-6 W1H01670
                          NOP                XMIT BL ID     CODE C  2-6 W1H01680
                          MDX     IDCL2      XMIT TX ID     CODE D  2-6 W1H01690
                    *************************************************** W1H01700
                    TEMP  DC      0         TEMPORARY FUNCTION CODE     W1H01710
                    AQ    BSS  E  2          FOR SAVING ACC AND EXT     W1H01720
                    *************************************************** W1H01730
                    *             AUTO ANSWER                         * W1H01740
                    *************************************************** W1H01750
                    AUTOA BSC  L  ENABL,+-   BR IF ENABLE REQUESTED     W1H01760
                          XIO   2 DISAA-T    DISABLE AUTO ANSWER    2-3 W1H01770
                    EXIT1 MDX     EXIT+1     BR TO RESTORE AND EXIT 2-3 W1H01780
                    *                                                 * W1H01790
                    ENABL LD    1 1                                     W1H01800
                          STO   2 ANS-T      SAVE I/O AREA ADDR     2-3 W1H01810
                          XIO   2 ENAA-T     ENABLE AUTO ANSWER     2-3 W1H01820
                          MDX   1 -1                                2-4 W1H01830
                          BSC  L  EXT2       BR TO SET $SCAT        2-4 W1H01840
                    *************************************************** W1H01850
                    *             AUDIBLE ALARM                       * W1H01860
                    *************************************************** W1H01870
                    ALARM BSC  L  OFF,Z      BR IF OFF REQUESTED        W1H01880
                          XIO   2 ALON-T     TURN ON ALARM          2-3 W1H01890
                          MDX     EXIT1      BR TO RESTORE AND EXIT 2-3 W1H01900
                    *                                                 * W1H01910
                    OFF   XIO   2 ALOFF-T    TURN OFF ALARM         2-3 W1H01920
                          MDX     EXIT1      BR TO RESTORE AND EXIT 2-3 W1H01930
                    *************************************************** W1H01940
                    *             CLOSE - END OPERATION               * W1H01950
                    *************************************************** W1H01960
                    CLOS  XIO   2 ENDOP-T    END SCA OPERATION      2-4 W1H01970
                          LD    2 WD17I-T    IF WD 17 INDR NOT ON   2-4 W1H01980
                          BSC  L  NODEC,+-   DO NOT DECR IOCS CTR       W1H01990
                          MDX  L  $SCAT,-1   DECREMENT IOCS CTR     2-4 W1H02000
                          NOP                                           W1H02010
                    NODEC LDX   2 28                                2-6 W1H02020
                          SLA     16                                    W1H02030
                    LOOP1 STO  L2 TAB4-1     RESET INDICATORS           W1H02040
                          MDX   2 -1                                    W1H02050
                          MDX     LOOP1                                 W1H02060
                          MDX     EXIT1      BR TO RESTORE AND EXIT 2-3 W1H02070
                    *************************************************** W1H02080
                    *             ID CALL    CODE A                2-6* W1H02090
                    *************************************************** W1H02100
                    IDCAL LD    2 RTBSY-T                           2-6 W1H02110
                          BSC  L  IDCAL,Z    LOOP IF ROUTINE BUSY   2-6 W1H02120
                    *                                                   W1H02130
                          LD    1 1          GET LOCAL ID ADDR      2-6 W1H02140
                          A     2 H0001-T                           2-6 W1H02150
                          STO   2 LOCID-T                           2-6 W1H02160
                          LD   I1 1          GET LOCAL ID LENGTH    2-6 W1H02170
                          BSC  L  ER3,Z+     BR IF NEG ID LENGTH    2-7 W1H02180
                          STO   2 LOCLG-T                           2-6 W1H02190
                          S     2 H000F-T    IS ID GREATER THAN 15  2-6 W1H02200
                          BSC  L  ER3,-Z     BR IF YES              2-7 W1H02210
                    *                                                   W1H02220
                          LD    1 2          GET REMOTE ID ADDR     2-6 W1H02230
                          A     2 H0001-T                           2-6 W1H02240
                          STO   2 REMID-T                           2-6 W1H02250
                          LD   I1 2          GET REMOTE ID LENGTH   2-6 W1H02260
                          BSC  L  ER3,Z+     BR IF NEG ID LENGTH    2-7 W1H02270
                          STO   2 REMLG-T                           2-6 W1H02280
                          S     2 H000F-T    IS ID GREATER THAN 15  2-6 W1H02290
                          BSC  L  ER3,-Z     BR IF YES              2-7 W1H02300
                    *                                                   W1H02310
                          MDX   1 1          EXIT TO LIBF+4         2-6 W1H02320
                          MDX     EXIT       BR TO EXIT             2-6 W1H02330
                    *************************************************** W1H02340
                    *             ID CALLS   CODE B,C AND D        2-6* W1H02350
                    *************************************************** W1H02360
                    IDCL2 LD    2 RTBSY-T                           2-6 W1H02370
                          BSC  L  IDCL2,Z    LOOP IF ROUTINE BUSY   2-6 W1H02380
                    *                                                   W1H02390
                          LD    1 0          CHECK SUBFUNCTION      2-6 W1H02400
                          AND   2 H0F00-T    INITIAL UNPACKED       2-6 W1H02410
                          BSC  L  OKSUB,+-   BR IF YES              2-6 W1H02420
                          S     2 H0300-T    INITIAL PACKED         2-6 W1H02430
                          BSC  L  ER1,Z      BR IF NO               2-6 W1H02440
                    OKSUB LD      TEMP       -3 RCV,-2 XMBL,-1 XMTX 2-6 W1H02450
                          S     2 H0007-T    SUBTRACT SEVEN         2-6 W1H02460
                          STO     TEMP       ADJUST CODE            2-6 W1H02470
                          STO   2 IDSEQ-T    SET ID SEQUENCE INDR   2-6 W1H02480
                          A     2 H0009-T                           2-6 W1H02490
                          BSC  L  RCVID,Z+   BR IF RECEIVE W/ID     2-6 W1H02500
                          LD    2 LOCID-T                           2-6 W1H02510
                          STO   2 IDPNT-T    XM INIT ID POINTER     2-6 W1H02520
                          LD    2 LOCLG-T                           2-6 W1H02530
                    SIDCT STO   2 IDCNT-T    REC/XM INIT ID LENGTH  2-6 W1H02540
                          MDX     TEST       BR TO NORMAL FLOW      2-6 W1H02550
                    *                                               2-6 W1H02560
                    RCVID LD    2 REMID-T                           2-6 W1H02570
                          STO   2 IDPNT-T    RCV INIT ID POINTER    2-6 W1H02580
                          LD    2 REMLG-T                           2-6 W1H02590
                          MDX     SIDCT      GO SET ID COUNT        2-6 W1H02600
                    *************************************************** W1H02610
                    SUPD  BSC  L  SUPAD      BR TO STATISTICS       2-5 W1H02620
                    *************************************************** W1H02630
                    *             READ ENQ ONLY                    2-5* W1H02640
                    *************************************************** W1H02650
                    RENQ  LD    2 RTBSY-T                           2-5 W1H02660
                          BSC  L  RENQ,Z     LOOP IF RTN BUSY       2-5 W1H02670
                    *                                                 * W1H02680
                          LD    1 0                                 2-5 W1H02690
                          SLA     4                                 2-5 W1H02700
                          BSC  L  ER1,Z      BR IF INVALID CODE     2-5 W1H02710
                          LD    2 HFFF6-T    LOAD MINUS TEN         2-6 W1H02720
                          STO   2 RDENQ-T    SET READ ENQ INDR      2-5 W1H02730
                          STO     TEMP       ADJUST CODE            2-5 W1H02740
                    *************************************************** W1H02750
                    TEST  LD    2 RTBSY-T                               W1H02760
                          BSC  L  TEST,Z     LOOP IF RTN BUSY           W1H02770
                    *                                                 * W1H02780
                          STO   2 TRANS-T    RESET TRANS            2-4 W1H02790
                          STO   2 PACK-T     RESET PACKED DATA INDR 2-4 W1H02800
                          LD    2 D0008-T                           2-6 W1H02810
                          STO   2 LGS-T      SET LEAD GRAPHS COUNT  2-6 W1H02820
                          LD      TEMP                                  W1H02830
                          A     2 H0009-T    SET UP TBTX AND FCODE  2-6 W1H02840
                          STO   2 TBTX-T     ZERO-BLOCK, ONE-TEXT       W1H02850
                          BSC  L  REC,+Z     BR IF FUNCTION IS RECEIVE  W1H02860
                          S     2 H0002-T                           2-4 W1H02870
                          BSC     Z          BR IF FUNCTION IS XMIT END W1H02880
                          SRA     1          MAKE ACCUMULATOR POSITIVE  W1H02890
                    REC   STO   2 FCODE-T    NEG-RCV, ZERO-END, POS-    W1H02900
                    *                         BLOCK OR TEXT           * W1H02910
                    *                                                 * W1H02920
                          XIO   2 LOAD-T     SYN INTO SYNC/IDLE REG 2-3 W1H02930
                          LD    2 D0008-T                               W1H02940
                          STO   2 RETRY-T    SET RETRY COUNTER TO 8     W1H02950
                          SLA     16         TURN OFF                   W1H02960
                          STO   2 LSDLE-T    LAST CHAR= DLE INDICATOR   W1H02970
                          LD    1 1                                     W1H02980
                          STO   2 IOAR-T     SAVE I/O AREA ADDRESS      W1H02990
                          LD    1 2                                     W1H03000
                          STO   2 USERR-T    SAVE ERROR RTN ADDR    2-4 W1H03010
                    *                                                 * W1H03020
                          LD    1 0          SAVE SUB-FUNCTION CODE     W1H03030
                          AND   2 H0F00-T         NEG -INITIAL      2-4 W1H03040
                          S     2 H0300-T                           2-4 W1H03050
                          BSC  L  D2OK1,Z+   BR IF CODE LESS THAN 3 2-4 W1H03060
                    *                                                 * W1H03070
                          BSC  L  D2OK2,+    BR IF CODE EQUAL TO 3  2-4 W1H03080
                          S     2 H0100-T                           2-4 W1H03090
                          BSC  L  SETPK,+    BR IF CODE EQUAL TO 4  2-4 W1H03100
                          S     2 H0100-T                           2-4 W1H03110
                          BSC  L  ER1,Z      BR IF CODE GT 5        2-4 W1H03120
                          LD    2 FCODE-T                           2-4 W1H03130
                          BSC  L  ER1,-      BR IF FUNC NOT RECEIVE 2-4 W1H03140
                          LD    2 H0200-T    SET CODE TO READ REPEAT2-4 W1H03150
                          MDX     SETPK+1                           2-4 W1H03160
                    *                                                 * W1H03170
                    D2OK1 A     2 H0300-T    ADJUST CODE            2-4 W1H03180
                          MDX     D2OK3                             2-4 W1H03190
                    D2OK2 LD      *          SET PACKED DATA        2-4 W1H03200
                          STO   2 PACK-T     INDR                   2-4 W1H03210
                          SLA     16         SET CODE TO INITIAL    2-4 W1H03220
                          MDX     D2OK3                             2-4 W1H03230
                    SETPK A     2 H0100-T    ADJUST CODE            2-4 W1H03240
                          STO   2 PACK-T     SET PACKED DATA INDR   2-4 W1H03250
                    *                                                 * W1H03260
                    D2OK3 S     2 H0100-T         ZERO - CONTINUE   2-4 W1H03270
                          STO   2 SUBF-T          POS - REPEAT          W1H03280
                          BSC  L  D2OK,+     BR IF CODE IS ZERO OR ONE  W1H03290
                          S     2 H0100-T                           2-4 W1H03300
                          BSC  L  ER1,Z      BR IF CODE GREATER THAN 2  W1H03310
                          LD    2 FCODE-T                               W1H03320
                          BSC  L  ER1,-      BR IF FUNCTION NOT RECEIVE W1H03330
                    *                                                 * W1H03340
                    D2OK  LD    2 FCODE-T                               W1H03350
                          BSC  L  XEND,+-    BR IF TRANSMIT END         W1H03360
                    *************************************************** W1H03370
                    *             ALL EXCEPT TRANSMIT END             * W1H03380
                    *************************************************** W1H03390
                          LD    2 RDENQ-T    READ ENQ FUNCTION      2-5 W1H03400
                          BSC  L  SETFT,Z    BRANCH IF YES          2-5 W1H03410
                          LD   I  IOAR                                  W1H03420
                          BSC  L  ER1,+      BR IF WORD COUNT INVALID   W1H03430
                          STO   2 WDCNT-T    SAVE WORD COUNT            W1H03440
                    SETFT STO   2 FIRST-T    TURN ON FIRST CHAR IND 2-5 W1H03450
                          SLA     16                                2-4 W1H03460
                          STO   2 COUNT-T    CLEAR COUNT FIELD      2-4 W1H03470
                    *                                                 * W1H03480
                          LD    2 SUBF-T                                W1H03490
                          BSC  L  NOT1,-     BR IF NOT INITIAL          W1H03500
                    *                                                 * W1H03510
                    *************************************************** W1H03520
                    *             INITIAL                             * W1H03530
                    *************************************************** W1H03540
                          LDD   2 ACKS-T     INITIALIZE ALTERNATING 2-4 W1H03550
                          STD   2 ACK-T      ACKNOWLEDGEMENTS TO ACK0   W1H03560
                          STO   2 XMENQ-T    TURN ON XMIT/MONITOR ENQ   W1H03570
                    *                                                 * W1H03580
                          LD    1 0                                     W1H03590
                          AND     H00F0      ZERO - MASTER              W1H03600
                          STO   2 SLVMS-T    NON-ZERO - SLAVE           W1H03610
                    *                                                 * W1H03620
                          LD    2 FCODE-T                               W1H03630
                          BSC  L  NTRCV,-    BR IF NOT RECEIVE          W1H03640
                    *************************************************** W1H03650
                    *             RECEIVE INITIAL                     * W1H03660
                    *************************************************** W1H03670
                          XIO   2 ENDOP-T    DROP CHAR PHASE            W1H03680
                          XIO   2 STRED-T    START READ                 W1H03690
                          XIO   2 RETIM-T    RESET TIMERS               W1H03700
                          LD    2 OPTSW-T                           2-4 W1H03710
                          SLA     14         THIRD TIMER USED       2-4 W1H03720
                          BSC  L  EXT,-      BR IF NOT              2-4 W1H03730
                    *                                               2-4 W1H03740
                          XIO   2 TIMER-T    START THIRD TIMER      2-4 W1H03750
                    *************************************************** W1H03760
                    *             EXIT                                * W1H03770
                    *************************************************** W1H03780
                    EXT   LD      *                                     W1H03790
                          STO   2 RTBSY-T    TURN ON ROUTINE BUSY IND.  W1H03800
                    EXT2  LD    2 WD17I-T    IF WD 17 INDR IS ON    2-4 W1H03810
                          BSC  L  NO50,Z     DO NOT INCRE IOCS CNT      W1H03820
                          LD      *                                     W1H03830
                          STO   2 WD17I-T    TURN ON WD 17 INDR     2-4 W1H03840
                          MDX  L  $SCAT,+1   INCREMENT IOCS CTR     2-4 W1H03850
                    $SCAT EQU     17         IOCS CTR IS IN WORD 17 2-4 W1H03860
                    NO50  MDX   1 +2         SET EXIT TO LIBF+4     2-4 W1H03870
                          MDX     EXIT3      BR TO RESTORE AND EXIT 2-4 W1H03880
                    *************************************************** W1H03890
                    *             NOT INITIAL                         * W1H03900
                    *************************************************** W1H03910
                    NOT1  LD    2 FCODE-T                           2-4 W1H03920
                          BSC  L  RCV,+      BR IF FUNCITON IS RECEIVE  W1H03930
                    *************************************************** W1H03940
                    *             TRANSMIT INITIAL AND CONTINUE       * W1H03950
                    *                       CHECK IF SOH, STX OR   2-3* W1H03960
                    *                       DLE STX START CHARS,   2-3* W1H03970
                    *                       OTHERWISE PRE-OP ERROR 2-3* W1H03980
                    *************************************************** W1H03990
                    NTRCV STO   2 XMESS-T    TURN ON XMIT MESSAGE IND.  W1H04000
                          LD    2 IOAR-T                            2-3 W1H04010
                          A     2 H0001-T                           2-3 W1H04020
                          STO   2 POINT-T                           2-3 W1H04030
                          LD   I  POINT      LOAD START CHAR        2-4 W1H04040
                          AND   2 HFF00-T                           2-4 W1H04050
                          EOR   2 SOH-T                             2-3 W1H04060
                          BSC  L  TMT,+-     BR IF SOH              2-3 W1H04070
                    *                                                 * W1H04080
                          EOR   2 DLSOH-T                           2-3 W1H04090
                          BSC  L  TMT3,+-    BR IF DLE              2-4 W1H04100
                    TMT1  LD   I  POINT                             2-4 W1H04110
                          AND   2 HFF00-T                           2-4 W1H04120
                    TMT2  EOR   2 STX-T                             2-4 W1H04130
                          BSC  L  TMT,+-     BR IF STX              2-3 W1H04140
                          LD    2 H8001-T                           2-7 W1H04148
                          A     2 H0001-T    GET ERROR /8002        2-7 W1H04149
                          MDX     ER11       GO TO PREOPERATIVE ERR 2-7 W1H04150
                    *                                                 * W1H04160
                    TMT3  LD    2 PACK-T                            2-4 W1H04170
                          BSC  L  TMT4,Z     BR IF PACKED DATA      2-4 W1H04180
                          LD    2 POINT-T                           2-4 W1H04190
                          A     2 H0001-T                           2-3 W1H04200
                          STO   2 POINT-T                           2-3 W1H04210
                          MDX     TMT1       TEST IF STX            2-3 W1H04220
                    TMT4  LD   I  POINT                             2-4 W1H04230
                          SLA     8                                 2-4 W1H04240
                          MDX     TMT2                              2-4 W1H04250
                    *                                                 * W1H04260
                    TMT   STO   2 SYN2-T     TURN OFF SYN INSERT INDR   W1H04270
                          LD    1 0                                     W1H04280
                          SLA     12         DIGIT 4 - ZERO-NORMAL      W1H04290
                          STO     TEXTM       NON-ZERO - TRANSPARENT    W1H04300
                          MDX     SYNC1      BR TO BEGIN I/O OPERATION  W1H04310
                    *************************************************** W1H04320
                    *             RECEIVE CONTINUE OR REPEAT          * W1H04330
                    *************************************************** W1H04340
                    RCV   LD      SUBF       SUB-FUNCTION CODE          W1H04350
                          BSC     -Z           POSITIVE MEANS REPEAT    W1H04360
                          STO   2 XNAK-T     TURN ON XMIT NAK IND.      W1H04370
                    *************************************************** W1H04380
                    *             ALL EXCEPT RECEIVE INITIAL          * W1H04390
                    *************************************************** W1H04400
                    SYNC1 XIO     SYNC       WRITE WITH TIMEOUTS        W1H04410
                          LD      H0005      SET UP TO TRANSMIT 5   2-3 W1H04420
                          STO     SYN5        SYNS FOR PADDING      2-3 W1H04430
                          MDX     EXT        BR TO SET RTN. BUSY ON     W1H04440
                    *                                                 * W1H04450
                    *************************************************** W1H04460
                    *             TRANSMIT EOT OR DLE EOT             * W1H04470
                    *************************************************** W1H04480
                    XEND  LDD     ACKS       INITIALIZE ALTERNATING     W1H04490
                          STD     ACK        ACKNOWLEDGEMENTS           W1H04500
                          LD    1 0          DIGIT 4 OF CONTROL PARA.   W1H04510
                          SLA     12         CLOSE IF ZERO              W1H04520
                          STO     CLOSE      DO NOT CLOSE IF NOT ZERO   W1H04530
                          LD    1 0          DIGIT 3 OF CTRL PARAM  2-4 W1H04540
                          AND     H00F0      READ RESPONSE IF ZERO  2-4 W1H04550
                          STO     EOTRP                             2-4 W1H04560
                          MDX     SYNC1      BR TO BEGIN I/O OPERATION  W1H04570
                    *************************************************** W1H04580
                    *                PRE-OPERATIVE ERROR              * W1H04590
                    *************************************************** W1H04600
                    ER3   LD    2 H8001-T                           2-7 W1H04605
                          A     2 H0002-T    GET ERROR /8003        2-7 W1H04606
                          MDX     ER11                              2-7 W1H04607
                    ER1   LD      H8001      ERROR IN CALLING SEQUENCE  W1H04610
                    ER11  MDX   1 -1                                    W1H04620
                          STX  L1 $PRET      ADDR OF LIBF INTO 40       W1H04630
                          LDX   1 $PRET+1    SYSTEM HALT IS AT 41       W1H04640
                    $PRET EQU     40         PRE-OPERATIVE ERROR TRAP   W1H04650
                          BSC  L  STAT-1     BR TO RESTORE AND EXIT     W1H04660
                    *************************************************** W1H04670
                    *             ERROR STATISTICS                 2-4* W1H04680
                    *************************************************** W1H04690
                    SUPAD LD    1 0                                 2-4 W1H04700
                          AND   2 H0F00-T    ISOLATE PARAM          2-4 W1H04710
                          BSC  L  OPTN,Z     BR IF OPTIONS DESIRED  2-4 W1H04720
                          LD    2 TABCT-T    GET STAT TABLE ADDR    2-4 W1H04730
                          STO  I1 +1         PUT IN LOC PER CALL    2-3 W1H04740
                    EXIT2 BSC  L  EXIT       BR TO RESTORE AND EXIT 2-4 W1H04750
                    *************************************************** W1H04760
                    *             ENABLE/DISABLE OPTIONS              * W1H04770
                    *************************************************** W1H04780
                    OPTN  S     2 H0100-T                           2-4 W1H04790
                          BSC  L  ENAB,+-    BR TO ENABLE OPTIONS   2-4 W1H04800
                          S     2 H0100-T                           2-4 W1H04810
                          BSC  L  ER1,Z      BR IF GREATER THAN 2   2-4 W1H04820
                          LD    1 0                                 2-4 W1H04830
                          AND   2 H000F-T                           2-4 W1H04840
                          AND   2 OPTSW-T    DISABLE                2-4 W1H04850
                          EOR   2 OPTSW-T     OPTIONS               2-4 W1H04860
                          STO   2 OPTSW-T                           2-4 W1H04870
                    EXIT3 BSC  L  EXIT+1     BR TO RESTORE AND EXIT 2-4 W1H04880
                    *                                                 * W1H04890
                    ENAB  LD    1 0                                 2-4 W1H04900
                          AND   2 H000F-T    ENABLE                 2-4 W1H04910
                          STO   2 OPTSW-T     OPTIONS               2-4 W1H04920
                          LD    1 1          SAVE OPTIONAL EXIT     2-4 W1H04930
                          STO   2 OPERR-T     ADDRESS               2-4 W1H04940
                          MDX     EXIT2                             2-4 W1H04950
                    *************************************************** W1H04960
                          HDNG    SCAT2 - CALL PROCESSING SUMMARY   2-4 W1H04970
                    *************************************************** W1H04980
                    *                                                 * W1H04990
                    *  AT THE COMPLETION OF CALL PROCESSING, THE      * W1H05000
                    *  FOLLOWING INDICATORS HAVE BEEN SET FOR RECEIVE,* W1H05010
                    *  TRANSMIT T/B, TRANSMIT END                     * W1H05020
                    *                  .FCODE. - NEGATIVE/RECEIVE     * W1H05030
                    *                          - ZERO/TRANSMIT END    * W1H05040
                    *                          - POSITIVE/TRANSMIT T/B* W1H05050
                    *                  .RETRY. - 8                    * W1H05060
                    *                  SYNC REG- SYN                  * W1H05070
                    *                  .LSDLE. - ZERO  OFF            * W1H05080
                    *                  .IOAR.  - I/O AREA ADDRS       * W1H05090
                    *                  .USERR. - USER ERROR RTN ADDRS * W1H05100
                    *                  .SUBF.  - NEGATIVE/INITIAL/EOT * W1H05110
                    *                          - ZERO/CONTINUE/DLE EOT* W1H05120
                    *                          - POSITIVE/REPEAT      * W1H05130
                    *                  .RTBSY. - NON-ZERO   ON        * W1H05140
                    *    FOR ALL, EXCEPT TRANSMIT END                 * W1H05150
                    *                  .WDCNT. - AS SPECIFIED BY USER * W1H05160
                    *                  .FIRST. - POSITIVE   ON        * W1H05170
                    *                  .PACK.  - ON IF PACKED DATA    * W1H05180
                    *                            SPECIFIED BY USER    * W1H05190
                    *                  .IDSEQ. - ON IF ID SEQUENCE    * W1H05200
                    *                            SPECIFIED BY USER    * W1H05210
                    *       FOR ALL INITIAL                           * W1H05220
                    *                  .ACK.   - ACK0/ACK1            * W1H05230
                    *                  .XMENQ. - NON-ZERO   ON        * W1H05240
                    *                  .SLVMS. - ZERO/MASTER          * W1H05250
                    *                          - NON-ZERO/SLAVE       * W1H05260
                    *       TRANSMIT INITIAL/CONTINUE                 * W1H05270
                    *                  .TBTX.  - ZERO/BLOCK           * W1H05280
                    *                          - ONE/TEXT             * W1H05290
                    *                  .TEXTM. - ZERO/NORMAL          * W1H05300
                    *                          - NON-ZERO/TRANSPARENT * W1H05310
                    *                  .XMESS. - NON-ZERO   ON        * W1H05320
                    *                  .SYN2.  - ZERO       OFF       * W1H05330
                    *       RECEIVE REPEAT                            * W1H05340
                    *                  .XNAK.  - POSITIVE   ON        * W1H05350
                    *       TRANSMIT END/EOT                          * W1H05360
                    *                  .ACK.   - ACK0/ACK1            * W1H05370
                    *                  .CLOSE. - ZERO-CLOSE           * W1H05380
                    *                          - NONZERO-DO NOT CLOSE * W1H05390
                    *                  .EOTRP. - ZERO-READ RESPONSE   * W1H05400
                    *                          - NONZERO-DO NOT READ  * W1H05410
                    *                                    RESPONSE     * W1H05420
                    *      RECEIVE ENQ ONLY                           * W1H05430
                    *                  .RDENQ. - ON                   * W1H05440
                    *                                                 * W1H05450
                    *     AN XIO START READ IS ISSUED FOR RECEIVE     * W1H05460
                    *     INITIAL BEFORE RETURN TO LIBF+4.            * W1H05470
                    *                                                 * W1H05480
                    *     AN XIO SYNC IS ISSUED FOR ALL OTHER RECEIVE * W1H05490
                    *     OR TRANSMIT FUNCTIONS                       * W1H05500
                    *                                                 * W1H05510
                    *************************************************** W1H05520
                          HDNG     SCAT2 -  CONSTANTS, INDICATORS       W1H05530
                    *************************************************** W1H05540
                    *     CONSTANTS, INDICATORS, TEMPORARY STORAGE    * W1H05550
                    *************************************************** W1H05560
                    T     BSS  E  0     START OF IND, CONSTANTS         W1H05570
                    DISAA DC      /6FFF      DISABLE AUTO ANSWER        W1H05580
                          DC      /5440           IOCC                  W1H05590
                    H6FFF EQU     DISAA      FOR MODIFYING MDX          W1H05600
                    ENAA  DC      /700D      ENABLE AUTO ANSWER     2-6 W1H05610
                          DC      /5480           IOCC                  W1H05620
                    H700D EQU     ENAA       MAXIMUM MDX            2-6 W1H05630
                    ALON  DC      /0002      TURN ON ALARM              W1H05640
                          DC      /5102           IOCC                  W1H05650
                    H0002 EQU     ALON       CONSTANT 2                 W1H05660
                    ALOFF DC      /00F0      TURN OFF ALARM             W1H05670
                          DC      /5101           IOCC                  W1H05680
                    H00F0 EQU     ALOFF      TO ISOLATE DIGIT 3         W1H05690
                    ENDOP DC      /0F00      END OPERATION              W1H05700
                          DC      /5404           IOCC                  W1H05710
                    H0F00 EQU     ENDOP      TO ISOLATE DIGIT 2         W1H05720
                    TIMER DC      /1A00      START/STOP THIRD TIMER     W1H05730
                          DC      /5420      IOCC                       W1H05740
                    LOAD  DC      SYN        LOAD SYN INTO SYNC REG     W1H05750
                          DC      /5104           IOCC                  W1H05760
                    ACK   DC      0          CURRENT ACK                W1H05770
                          DC      0          NEXT ACK                   W1H05780
                    SENSR DC      0          SENSE AND RESET DSW        W1H05790
                          DC      /5701           IOCC                  W1H05800
                    USERR EQU     SENSR      USER ERROR RTN. ADDRESS    W1H05810
                    STRED DC      /0100      START READ                 W1H05820
                          DC      /5600           IOCC                  W1H05830
                    H0100 EQU     STRED      CONSTANT /0100             W1H05840
                    READ  DC      BUF        READ                       W1H05850
                          DC      /5200           IOCC                  W1H05860
                    SYNC  DC      /FFFF      START WRITE WITH TIMEOUT   W1H05870
                          DC      /5410           IOCC                  W1H05880
                    WTBUF DC      BUF        WRITE CONTENTS OF BUF      W1H05890
                          DC      /5100           IOCC                  W1H05900
                    WTSYN DC      SYN        WRITE SYN CHARACTER        W1H05910
                          DC      /5100           IOCC                  W1H05920
                    WTDLE DC      DLE        WRITE DLE CHARACTER        W1H05930
                          DC      /5100           IOCC                  W1H05940
                    LDDLE DC      DLE        LOAD DLE TO SYNC REG       W1H05950
                          DC      /5104           IOCC                  W1H05960
                    RETIM DC      /0005      RESET TIMER            2-3 W1H05970
                          DC      /5702           IOCC                  W1H05980
                    H0005 EQU     RETIM      5 FOR PRECEEDING SYNS  2-3 W1H05990
                    *************************************************** W1H06000
                    EBC   BSS     0          EBCDIC CONTROL CHARACTERS  W1H06010
                    ACKS  DC      /7000      INITIALIZED          ACK0  W1H06020
                          DC      /6100        ACKNOWLEDGEMENTS   ACK1  W1H06030
                    SYN   DC      /3200      SYNCHRONOUS IDLE           W1H06040
                    DLE   DC      /1000      DATA LINK ESCAPE           W1H06050
                    NAK   DC      /3D00      NEGATIVE ACKNOWLEDGEMENT   W1H06060
                    ENQ   DC      /2D00      ENQUIRY CHARACTER          W1H06070
                    SOH   DC      /0100      START OF HEADING           W1H06080
                    STX   DC      /0200      START OF TEXT              W1H06090
                    ETB   DC      /2600      END OF BLOCK               W1H06100
                    ETX   DC      /0300      END OF TEXT                W1H06110
                    EOT   DC      /3700      END OF TRANSMISSION        W1H06120
                    PAD   DC      /FF00      PAD CHARACTER          2-3 W1H06130
                    WACK  DC      /6B00      WACK                   2-6 W1H06140
                    ITB   DC      /1F00      ITB                    2-6 W1H06150
                    HFF00 EQU     PAD                               2-3 W1H06160
                    H1000 EQU     DLE        I/O AREA OVERFLOW CODE 2-3 W1H06170
                    H0200 EQU     STX        INVAL CTRL SEQ ERROR   2-3 W1H06180
                    H0300 EQU     ETX        CONSTANT /0300         2-4 W1H06190
                    RVICD DC      /FFFE      -2 FOR I/O AREA IF RVI 2-6 W1H06200
                    *************************************************** W1H06210
                    SYNDL DC      /2200      SYN AND DLE     EOR        W1H06220
                    ETBTX DC      /2500      ETB AND ETX     EOR        W1H06230
                    DLEOT DC      /2700      DLE AND EOT     EOR        W1H06240
                    DLSOH DC      /1100      DLE AND SOH     EOR    2-3 W1H06250
                    STXET DC      /3500      STX AND EOT     EOR        W1H06260
                    WARVI DC      /1700     WACK AND RVI     EOR    2-6 W1H06270
                    EQET  EQU     TIMER      ENQ AND EOT     EOR        W1H06280
                    DLSHX EQU     ETX        DLE,SOH AND STX EOR    2-3 W1H06290
                    ANS   DC      0          ADDR FOR ANSWER INDICATOR  W1H06300
                    BUF   DC      0          BUFFER FOR TRANSMIT/RCV    W1H06310
                    DSW   DC      0          SAVED DEVICE STATUS WORD   W1H06320
                    TBTX  DC      0          BLOCK OR TEXT              W1H06330
                    FCODE DC      0          RECEIVE, TRANSMIT, OR END  W1H06340
                    RETRY DC      0          RETRY COUNTER              W1H06350
                    IOAR  DC      0          I/O AREA ADDRESS           W1H06360
                    WDCNT DC      0          WORD COUNT                 W1H06370
                    OPERR DC      0          OPTIONAL EXIT ADDRESS  2-4 W1H06380
                    SUBF  DC      0          INITIAL, CONTINUE, REPEAT  W1H06390
                    SLVMS DC      0          SLAVE OR MASTER            W1H06400
                    TEXTM DC      0          NORMAL OR TRANSPARENT      W1H06410
                    COUNT DC      0          COUNTER FOR WORDS          W1H06420
                    POINT DC      0          I/O AREA POINTER           W1H06430
                    BCCR  DC      0          BCC RECEIVED               W1H06440
                    SYN5  DC      0          NUMBER OF SYNS TO WRITE2-3 W1H06450
                    CLOSE DC      0          CLOSE ON EOT INDICATOR     W1H06460
                    EOTRP DC      0          READ RESPONSE EOT INDR 2-4 W1H06470
                    PACK  DC      0          PACKED DATA INDR       2-4 W1H06480
                    NXTPD DC      0          NEXT CHAR PAD INDR     2-3 W1H06490
                    LOCID DC      0          LOCAL ID ADDRESS       2-6 W1H06500
                    REMID DC      0          REMOTE ID ADDRESS      2-6 W1H06510
                    IDPNT DC      0          ID POINTER             2-6 W1H06520
                    LGS   DC      0          LEAD GRAPHICS COUNT    2-6 W1H06530
                    OPTSW DC      0          OPTIONS INDR           2-4 W1H06540
                    H8001 DC      /8001      ERR CODE FOR BAD CALL SEQ. W1H06550
                    D0008 DC      +8         CONSTANT +8                W1H06560
                    H4000 DC      /4000      CONTENTION ERROR CODE      W1H06570
                    H0800 DC      /0800      BCC ERROR CODE             W1H06580
                    H0400 DC      /0400      NAK RECEIVED ERROR CODE    W1H06590
                    H0080 DC      /0080      WACK RCVD ERROR CODE   2-6 W1H06600
                    H0001 DC      /0001      CONSTANT 1 FOR INCREMENTS  W1H06610
                    H2000 DC      /2000      TIMEOUT ERROR CODE FOR RCV W1H06620
                    H2001 DC      /2001      ID ERROR CODE   RCV    2-6 W1H06630
                    H0201 DC      /0201      ID ERROR CODE   XMT    2-6 W1H06640
                    H0020 DC      /0020      ERROR CODE 0020        2-4 W1H06650
                    H000F DC      /000F      ISOLATE DIGIT 4        2-4 W1H06660
                    H0007 DC      /0007      RETRY COUNT SEVEN      2-6 W1H06670
                    H0009 DC      /0009      ADJUST CODE CONSTANT   2-6 W1H06680
                    HFFF6 DC      /FFF6      -10,ADJUST CODE CONST  2-6 W1H06690
                    *************************************************** W1H06700
                    TAB4  BSS  E  0     START OF IND CLEARED BY CLOSE   W1H06710
                    *                                                   W1H06720
                    TOIND DC      0          TIMEOUT         INDR       W1H06730
                    WRACK DC      0          WRONG ACK       INDR       W1H06740
                    *                                                   W1H06750
                    TRANS DC      0          TRANSPARENT/BCC INDR       W1H06760
                    BCC1  DC      0          FIRST BCC       INDR       W1H06770
                    *                                                   W1H06780
                    LSDLE DC      0          LAST CHAR DLE   INDR       W1H06790
                    PADCK DC      0          PAD CHECK       INDR   2-6 W1H06800
                    *                                                   W1H06810
                    BCCA  DC      0          BCC ACCUMULATED            W1H06820
                    ITBRD DC      0          ITB READ/BCC    INDR   2-6 W1H06830
                    *                                                   W1H06840
                    FIRST DC      0          FIRST CHARACTER INDR       W1H06850
                    XMESS DC      0          XMIT MESSAGE    INDR       W1H06860
                    *                                                   W1H06870
                    SYN2  DC      0          INSERT 2 SYNS   INDR       W1H06880
                    OVFLO DC      0          IOAR OVERFLOW   INDR       W1H06890
                    *                                                   W1H06900
                    XNAK  DC      0          XMIT NAK        INDR       W1H06910
                    XMENQ DC      0          XMIT/MON ENQ    INDR       W1H06920
                    *                                                   W1H06930
                    STXIN DC      0          STX             INDR       W1H06940
                    RIDOK DC      0          REMOTE ID OK    INDR   2-6 W1H06950
                    *                                                   W1H06960
                    RTBSY DC      0          ROUTINE BUSY    INDR       W1H06970
                    RDENQ DC      0          READ ENQ        INDR   2-5 W1H06980
                    *                                                   W1H06990
                    BCC2  DC      0          SECOND BCC      INDR       W1H07000
                    TEND  DC      0          XMIT ETB/ETX    INDR       W1H07010
                    DLSTX DC      0          DLE STX         INDR       W1H07020
                    WD17I DC      0          SCAT COUNTER           2-4 W1H07030
                    RVIRD DC      0          RVI READ        INDR   2-6 W1H07040
                    ITBER DC      0          ITB BCC ERROR   INDR   2-6 W1H07050
                    LOCLG DC      0          LOCAL ID LENGTH        2-6 W1H07060
                    REMLG DC      0          REMOTE ID LENGTH       2-6 W1H07070
                    IDCNT DC      0          ID COUNT               2-6 W1H07080
                    IDSEQ DC      0          ID SEQUENCE     INDR   2-6 W1H07090
                    *************************************************** W1H07100
                    TABCT DC      BCCER      ERR STATISTICS TBL ADDR2-3 W1H07110
                    BCCER DC      *-*        CRC-16 ERRORS          2-3 W1H07120
                    RETRS DC      *-*        RETRANSMISSION REQUESTS2-3 W1H07130
                    MASTO DC      *-*        MASTER RCV TIME-OUTS   2-3 W1H07140
                    SLVTO DC      *-*        SLAVE RCV TIME-OUTS    2-3 W1H07150
                    XMCHK DC      *-*        TRANSMIT CHECK ERRORS  2-3 W1H07160
                    RMCHK DC      *-*        RECEIVE CHECK ERRORS   2-3 W1H07170
                    MISRV DC      *-*        INVAL SEQ RCVD AS MSTR 2-3 W1H07180
                    SISRV DC      *-*        INVAL SEQ RCVD AS SLAVE2-3 W1H07190
                    TTDCT DC      *-*        TEMP TEXT DELAY RCVD   2-6 W1H07200
                    WACNT DC      *-*        WACKS RECEIVED         2-6 W1H07210
                          HDNG    ***  SCAT2 - INTERRUPT PROCESSING **  W1H07220
                    *************************************************** W1H07230
                    *             INTERRUPT PROCESSING                * W1H07240
                    *************************************************** W1H07250
                    *               THE DEVICE STATUS WORD            * W1H07260
                    *                   BIT 0 - READ RESPONSE         * W1H07270
                    *                   BIT 1 - WRITE RESPONSE        * W1H07280
                    *                   BIT 2 - CHECK                 * W1H07290
                    *                   BIT 3 - TIMEOUT               * W1H07300
                    *                   BIT 4 - AUTO ANSWER REQUEST   * W1H07310
                    *                   BIT 5 - BUSY                  * W1H07320
                    *                   BIT 6 - ENABLED               * W1H07330
                    *                   BIT 7 - READY                 * W1H07340
                    *                   BIT 8 - RECEIVE RUN           * W1H07350
                    *************************************************** W1H07360
                    INT2  XIO     SENSR      SENSE AND RESET DSW        W1H07370
                          STO     DSW        SAVE DSW                   W1H07380
                          STO  L  $PAUS      SET $PAUS              2-4 W1H07390
                    $PAUS EQU     240        $PAUS IS IN WORD 240   2-4 W1H07400
                          LDX  L1 T          CONSTANT TABLE ADDRESS     W1H07410
                          SLA     6          IS AUTO ANS ENABLED        W1H07420
                          BSC  L  BUSYX,-    NO, BR TO CHECK RTN. BUSY  W1H07430
                          LD      DSW                                   W1H07440
                          SLA     4                                     W1H07450
                          BSC  L  ANSI,+Z    BR IF AUTO ANS REQUEST     W1H07460
                    BUSYX LD      RTBSY                                 W1H07470
                          BSC  L  DSCRD,+-   BR TO START READ IF NT BSY W1H07480
                          LD      DSW                                   W1H07490
                          SLA     7          CHECK READY BIT            W1H07500
                          BSC  L  NTRDY,-    BR IF NOT READY            W1H07510
                          LD      DSW                                   W1H07520
                          BSC  L  READI,+Z   BR IF READ RESPONSE        W1H07530
                          SLA     1                                     W1H07540
                          BSC  L  TIMEI,-    BR IF NOT WRITE RESPONSE   W1H07550
                    *************************************************** W1H07560
                    *                   WRITE RESPONSE                * W1H07570
                    *************************************************** W1H07580
                          SLA     1                                 2-3 W1H07590
                          BSC  L  NWRCH,-    BR IF NO WRITE CHECK   2-3 W1H07600
                          MDX  L  XMCHK,+1   COUNT CHECK            2-3 W1H07610
                          NOP                                       2-3 W1H07620
                    NWRCH LD    1 NXTPD-T    IS IT PAD TIME         2-4 W1H07630
                          BSC  L  WRPAD,Z    YES, BR TO SEND PAD    2-4 W1H07640
                          LD      FCODE                                 W1H07650
                          BSC  L  RCVWT,+Z   BR IF RECEIVE FUNCTION     W1H07660
                          BSC  L  ENDWT,+    BR IF TRANSMIT END FUNC.   W1H07670
                    *                                                 * W1H07680
                          LD      DSW                                   W1H07690
                          SLA     3          CHECK TIMEOUT BIT          W1H07700
                    XMT   BSC  L  XMTWT,-    BR IF TRANSMIT, NO TIMEOUT W1H07710
                          LD    1 H0002-T                           2-3 W1H07720
                          STO     SYN2       TURN ON INSERT 2 SYN CHARS W1H07730
                          LD    1 TRANS-T    TRANSPARENT TEXT       2-5 W1H07740
                          BSC  L  XMT,+-     BR TO TRANSMIT IF NOT  2-5 W1H07750
                    *                                                 * W1H07760
                          XIO   1 TIMER-T    START TIMER            2-5 W1H07770
                          SLA     16                                2-5 W1H07780
                          MDX     XMT        BR TO TRANSMIT         2-5 W1H07790
                    *************************************************** W1H07800
                    *                   READ RESPONSE                 * W1H07810
                    *************************************************** W1H07820
                    READI SLA     2                                 2-3 W1H07830
                          BSC  L  NRDCH,-    BR IF NO READ CHECK    2-3 W1H07840
                          MDX  L  RMCHK,+1   COUNT CHECK            2-3 W1H07850
                          NOP                                       2-3 W1H07860
                    NRDCH SLA     1                                 2-3 W1H07870
                          BSC  L  T2,+Z      BR IF TIMEOUT ALSO         W1H07880
                          XIO   1 READ-T     READ 1 CHAR INTO BUF   2-3 W1H07890
                          LD    1 BUF-T      LOG                    2-3 W1H07900
                          SRA     8          CHARACTER              2-3 W1H07910
                          CALL    IOLOG      RECEIVED               2-3 W1H07920
                          LD    1 PADCK-T                           2-6 W1H07930
                          BSC  L  PDCK1,Z    BR IF PAD CK ON        2-6 W1H07940
                          LD    1 FCODE-T                               W1H07950
                          BSC  L  RCVRD,+Z   BR IF RECEIVE FUNCTION     W1H07960
                          BSC  L  ENDRD,+    BR IF TRANSMIT END FUNC.   W1H07970
                          BSC  L  XMTRD      BR FOR TRANSMIT FUNCTION   W1H07980
                    *************************************************** W1H07990
                    TIMEI SLA     2                                     W1H08000
                          BSC  I  INT1,-     EXIT IF NOT TIMEOUT        W1H08010
                    *************************************************** W1H08020
                    *                   TIMEOUT                       * W1H08030
                    *************************************************** W1H08040
                    T2    LD      ZILCH      LOG                    2-3 W1H08050
                          CALL    IOLOG      TIMEOUT                2-3 W1H08060
                          LD    1 FCODE-T                           2-3 W1H08070
                          BSC  L  RCVT,+Z    BR IF RECEIVE FUNCTION 2-3 W1H08080
                          BSC  L  ENDTM,+    BR IF TRANSMIT END FUNC.   W1H08090
                          BSC  L  XMTTM      BR FOR TRANSMIT FUNCTION   W1H08100
                    ZILCH DC      /1111      T.O. LOG INDR          2-3 W1H08110
                    *************************************************** W1H08120
                    *                   AUTO ANSWER REQUEST           * W1H08130
                    *************************************************** W1H08140
                    ANSI  STO  I  ANS        STORE INDICATION FOR USER  W1H08150
                          XIO   1 DISAA-T    DISABLE AUTO ANSWER        W1H08160
                    INTX  LD    1 RTBSY-T    IS OPERATION COMPLETE  2-4 W1H08170
                          BSC  I  INT1,Z     NO, RETURN TO ILS      2-4 W1H08180
                    *                                                 * W1H08190
                          LD    1 OPTSW-T                           2-4 W1H08200
                          SLA     13         EXIT OPTION ACTIVE     2-4 W1H08210
                          BSC  I  INT1,-     NO, EXIT TO ILS        2-4 W1H08220
                          SLA     16         YES, BR TO ERROR RTN   2-4 W1H08230
                          BSI  I  OPERR       WITH ACC=0            2-4 W1H08240
                    *                                                 * W1H08250
                    DCRD2 BSC  I  INT1       EXIT TO ILS            2-4 W1H08260
                    DSCRD XIO   1 RETIM-T    RESET TIMERS           2-4 W1H08270
                          MDX     DCRD2                             2-4 W1H08280
                          HDNG     SCAT2 - READ RESPONSE FOR RECEIVE    W1H08290
                    *************************************************** W1H08300
                    *             READ RESPONSE FOR RECEIVE           * W1H08310
                    *************************************************** W1H08320
                    ENQIN STO   1 XMENQ-T    TURN OFF MONITOR INDR  2-4 W1H08330
                          LD    1 RDENQ-T    TEST IF READ ENQ ONLY  2-5 W1H08340
                          BSC  L  STWT,+-    BR IF NOT              2-5 W1H08350
                          LD    1 ENQ-T      ENQ TO USERS AREA      2-5 W1H08360
                          MDX     RDEOT      GO TURN OP OFF/ON     2-10 W1H08370
                    *                                                 * W1H08380
                    STWT  XIO   1 SYNC-T     START WRITE WITH TIMER     W1H08390
                          LD    1 H0005-T    SET UP TO TRANSMIT 5   2-3 W1H08400
                          STO   1 SYN5-T      SYNS FOR PADDING      2-4 W1H08410
                          MDX     INTX       EXIT TO ILS                W1H08420
                    *************************************************** W1H08430
                    RCVRD LD    1 SYN2-T     CHECK 2 SYNS RECEIVED IND  W1H08440
                          S     1 H0002-T                               W1H08450
                          BSC  L  NOSY2,+Z   BR IF SYN2 LESS THAN 2     W1H08460
                    *                                                 * W1H08470
                          LD    1 BUF-T                                 W1H08480
                          EOR   1 SYN-T                                 W1H08490
                          BSC  L  NOSY2,+-   BR IF CHAR IS A SYN        W1H08500
                    *                                                 * W1H08510
                          SLA     16                                    W1H08520
                          STO   1 SYN2-T     TURN OFF 2 SYNS RCVED IND  W1H08530
                          XIO   1 RETIM-T    RESET TIMER                W1H08540
                    NOSY2 LD    1 TRANS-T                               W1H08550
                          BSC  L  CKBCC,Z    BR IF TRANS MODE OR BCC TM W1H08560
                    *                                                 * W1H08570
                          LD    1 FIRST-T                               W1H08580
                          BSC  L  NOFST,+-   BR IF NOT FIRST CHARACTER  W1H08590
                    *                                                 * W1H08600
                          LD    1 BUF-T                                 W1H08610
                          EOR   1 ENQ-T                                 W1H08620
                          BSC  L  NTENQ,Z    BR IF NOT ENQ          2-6 W1H08630
                    *                                                 * W1H08640
                          LD    1 IDSEQ-T    REMOTE ID SPECIFIED    2-6 W1H08650
                          BSC  L  ENQIN,+-   BRANCH IF NOT          2-6 W1H08660
                          LD    1 IDCNT-T    ALL IDS RECEIVED       2-6 W1H08670
                          BSC  L  ID3,Z      BR IF NO               2-6 W1H08680
                          LD    1 LOCID-T    INITLZ LOCAL ID ADDR   2-6 W1H08690
                          STO   1 IDPNT-T                           2-6 W1H08700
                          LD    1 LOCLG-T    INITLZ LOCAL ID LENGTH 2-6 W1H08710
                          STO   1 IDCNT-T                           2-6 W1H08720
                          LD      *                                 2-6 W1H08730
                    ID32  STO   1 RIDOK-T    TURN ON/OFF REMOT ID OK2-6 W1H08740
                          SLA     16                                2-6 W1H08750
                          MDX     ENQIN                             2-6 W1H08760
                    *                                                 * W1H08770
                    ID3   EOR   1 REMLG-T    ONLY ENQ RECEIVED      2-6 W1H08780
                          BSC  L  RCVTM,Z    BR IF NO               2-6 W1H08790
                          LD    1 RIDOK-T    REM ID READ OK BEFORE  2-6 W1H08800
                          BSC  L  RCVTM,+-   BR IF NO               2-6 W1H08810
                          SLA     16                                2-6 W1H08820
                          STO   1 IDSEQ-T    TURN OFF ID INDR       2-6 W1H08830
                          MDX     ID32       GO TURN OFF RIDOK      2-6 W1H08840
                    *                                                 * W1H08850
                    NTENQ EOR   1 EQET-T                                W1H08860
                          BSC  L  NOEOT,Z    BR IF CHAR NOT AN EOT      W1H08870
                          BSI  L  PDCHK      SET UP FOR PAD CK      2-6 W1H08880
                          BSC  L  RCVTM,Z    BR IF INVALID PAD      2-6 W1H08890
                    *                                                   W1H08900
                          LD    1 RDENQ-T    TEST IF READ ENQ ONLY  2-5 W1H08910
                          BSC     Z          SKIP IF NOT,0 TO USER 2-10 W1H08920
                          LD    1 EOT-T      EOT TO USERS AREA      2-5 W1H08930
                    *                                                 * W1H08950
                    RDEOT STO  I  IOAR       STO BEFORE XIO        2-10 W1H08960
                    LABX1 XIO   1 ENDOP-T   TURN OP OFF             2-9 W1H08965
                          XIO   1 STRED-T   RESTART READ            2-9 W1H08966
                          MDX     BY2        (XIO DESTROYS ACC)    2-10 W1H08968
                    CLBY2 STO  I  IOAR       SET USERS WORD COUNT       W1H08970
                    BY2   SLT     32                               2-10 W1H08980
                          STO   1 IDSEQ-T    TURN OFF ID INDR       2-6 W1H08990
                          STO   1 RIDOK-T            REMOTE ID OK   2-6 W1H09000
                    *                                                 * W1H09010
                    CLBSY SLT     32                                2-6 W1H09020
                          STD   1 RTBSY-T    RESET ROUTINE BUSY IND 2-6 W1H09030
                    *             RDENQ            READ ENQ INDR    2-6 W1H09040
                    CLBY3 XIO   1 RETIM-T    RESET TIMERS           2-5 W1H09050
                    INTX6 MDX     INTX       EXIT TO ILS                W1H09060
                    *************************************************** W1H09070
                    NOEOT XIO   1 RETIM-T    RESET TIMER                W1H09080
                    *                                                 * W1H09090
                          LD    1 BUF-T                                 W1H09100
                          EOR   1 DLE-T                                 W1H09110
                          BSC  L  NODLE,Z    BR IF NOT A DLE            W1H09120
                          STO   1 FIRST-T    TURN OFF 1ST CHAR INDR 2-6 W1H09130
                    *                                                 * W1H09140
                          LD      *          A DLE WAS RECEIVED         W1H09150
                          STO   1 STXIN-T    TURN ON STX INDICATOR      W1H09160
                    STDLE LD      *                                     W1H09170
                          STO   1 LSDLE-T    TURN ON LAST CHAR = DLE    W1H09180
                          LD    1 RDENQ-T    READ ENQ FUNCTION      2-5 W1H09190
                          BSC  L  INTX,Z     YES - EXIT TO ILS      2-5 W1H09200
                    *                                                 * W1H09210
                    ROOMQ LD    1 COUNT-T    IS THERE ROOM IN I/O AREA  W1H09220
                          EOR   1 WDCNT-T                               W1H09230
                          BSC  L  OFLOW,+-   BR IF NO ROOM              W1H09240
                    *                                                 * W1H09250
                          LD    1 PACK-T                            2-4 W1H09260
                          BSC  L  RDEVN,+-   BR IF DATA UNPACKED    2-4 W1H09270
                          LD    1 COUNT-T    CHECK CHARACTER COUNT  2-4 W1H09280
                          BSC  L  RDODD,E    IF ODD,SHIFT CHAR      2-4 W1H09290
                    RDEVN LD    1 BUF-T                             2-4 W1H09300
                          STO  I  POINT      STORE CHAR IN I/O AREA 2-4 W1H09310
                          LD    1 PACK-T                            2-4 W1H09320
                          BSC  L  RUPNT,+-   BR IF DATA UNPACKED    2-4 W1H09330
                    RDCNT MDX  L  COUNT,+1   UP CHARACTER COUNT     2-4 W1H09340
                          MDX     INTX       EXIT TO ILS            2-4 W1H09350
                    *                                                 * W1H09360
                    RDODD LD    1 BUF-T                             2-4 W1H09370
                          SRA     8          SHIFT CHAR             2-4 W1H09380
                          OR   I  POINT      OR IN FIRST CHAR       2-4 W1H09390
                          STO  I  POINT      STORE CHAR IN I/O AREA 2-4 W1H09400
                    RUPNT MDX  L  POINT,+1   UP I/O AREA POINTER    2-4 W1H09410
                          MDX     RDCNT                             2-4 W1H09420
                    *************************************************** W1H09430
                    NODLE LD    1 XMENQ-T                               W1H09440
                          BSC  L  ENQRD,+-   BR IF ENQ RCVD         2-6 W1H09450
                    RMON  LD    1 IDSEQ-T    REMOTE ID SPECIFIED    2-6 W1H09460
                          BSI  L  RREID,Z    YES - GO REC REMOTE ID 2-6 W1H09470
                    RMON2 BSC  L  RCVTM      ID ERROR               2-6 W1H09480
                    *                                                 * W1H09490
                    ENQRD LD    1 BUF-T                                 W1H09500
                          EOR   1 SOH-T      IS BUF = SOH               W1H09510
                          BSC     Z          SKIP IF BUF = SOH          W1H09520
                          EOR   1 DLSHX-T                               W1H09530
                          BSC  L  RMON,Z     BR IF NOT STX OR SOH   2-6 W1H09540
                    *                                                 * W1H09550
                    STXOF SLT     32                                2-6 W1H09560
                          STD   1 STXIN-T    RESET STX INDR         2-6 W1H09570
                    *             RIDOK            REMOTE ID OK IND 2-6 W1H09580
                          STO   1 FIRST-T          1ST CHAR INDR    2-6 W1H09590
                          STO   1 IDSEQ-T    TURN OFF ID INDR       2-6 W1H09600
                    ROMQ2 MDX     ROOMQ      BR TO STORE IN I/O AREA    W1H09610
                    *                                                 * W1H09620
                    OFLOW LD      *                                     W1H09630
                          STO   1 OVFLO-T    TURN ON OVERFLOW IND.      W1H09640
                    INTX1 MDX     INTX6      EXIT TO ILS                W1H09650
                    *************************************************** W1H09660
                    NOFST LD    1 SYN2-T                                W1H09670
                          BSC  L  CKIND,+    BR IF LAST CHAR NOT SYN    W1H09680
                    *                                                 * W1H09690
                          LD    1 BUF-T                                 W1H09700
                          EOR   1 SYN-T      IF BUF=SYN                 W1H09710
                          BSC  L  SYNUP,+-   BR TO INCRE 2 SYN IND.     W1H09720
                    *                                                 * W1H09730
                          SLA     16                                    W1H09740
                          STO   1 SYN2-T     TURN OFF 2 SYN INDICATOR   W1H09750
                    CKIND LD    1 STXIN-T                               W1H09760
                          BSC  L  NOBIN,+-   BR IF STX IND NOT ON       W1H09770
                    *                                                 * W1H09780
                    CKIN3 LD    1 BUF-T                                 W1H09790
                          EOR   1 STX-T                                 W1H09800
                          BSC  L  ONLIN,Z    BR IF CHAR NOT AN STX      W1H09810
                    *                                                 * W1H09820
                          LD    1 XMENQ-T                               W1H09830
                          BSC  L  RCVTM,Z    BR DECRE RETRY IF INITIAL  W1H09840
                    *                                                   W1H09850
                          LD      *          TURN ON TRANSPARENT        W1H09860
                          STO   1 TRANS-T    MODE INDICATOR             W1H09870
                    DLOFF SLA     16                                2-4 W1H09880
                          STO   1 LSDLE-T    TURN OFF LAST CHAR=DLE IND W1H09890
                          MDX     STXOF      BR TO TURN OFF STX IND.    W1H09900
                    *                                                 * W1H09910
                    ONLIN EOR   1 STXET-T                               W1H09920
                          BSC  L  TERMT,Z    BR IF BUF NOT EOT          W1H09930
                    *                                                 * W1H09940
                          LD    1 RDENQ-T                           2-5 W1H09950
                          BSC  L  DISCO,Z    BR IF READ ENQ FUNC    2-5 W1H09960
                          LD    1 COUNT-T                           2-4 W1H09970
                          S     1 H0001-T                           2-4 W1H09980
                          BSC  L  DLOFF,Z    BR IF DLE EOT IN MSG   2-4 W1H09990
                    *                                                 * W1H10000
                    DISCO LD    1 SYNC-T     DISCONNECT SIGNAL RECEIVED W1H10010
                          STO  I  IOAR       /FFFF IN FIRST WD OF I/O   W1H10020
                    DISC  XIO   1 ENDOP-T    END SCA OPERATION      2-6 W1H10030
                    *                                                 * W1H10040
                          MDX  L  $SCAT,-1   DECREMENT IOCS CTR     2-4 W1H10050
                          NOP                                           W1H10060
                          LDX   1 28                                2-6 W1H10070
                          SLA     16         RESET INDICATORS           W1H10080
                    LOOP2 STO  L1 TAB4-1                                W1H10090
                          MDX   1 -1                                    W1H10100
                          MDX     LOOP2                                 W1H10110
                          LDX  L1 T          CONSTANT TABLE ADDRESS 2-4 W1H10120
                          MDX     INTX1      EXIT TO ILS                W1H10130
                    *                                                 * W1H10140
                    NOBIN LD    1 LSDLE-T                               W1H10150
                          BSC  L  NTDLE,+-   BR IF LAST CHAR NOT A DLE  W1H10160
                    *                                                 * W1H10170
                          BSI  L  CALC       GO CALCULATE BCC           W1H10180
                          MDX     CKIN3      BR TO CHECK FOR STX        W1H10190
                    *                                                 * W1H10200
                    NTDLE LD    1 BUF-T                                 W1H10210
                          EOR   1 DLE-T                                 W1H10220
                          BSC  L  DLEN1,Z    BR IF NOT A DLE            W1H10230
                    *                                                   W1H10240
                          BSI  L  CALC       CALCULATE BCC              W1H10250
                          MDX     STDLE      BR TO TURN ON LSDLE    2-5 W1H10260
                    *                                                 * W1H10270
                    DLEN1 EOR   1 SYNDL-T                               W1H10280
                          BSC  L  NTSYN,Z    BR IF CHAR NOT A SYN       W1H10290
                    *                                                 * W1H10300
                    SYNUP MDX  L  SYN2,+1    UP 2 SYN INDICATOR         W1H10310
                          BSC  I  INT1       EXIT TO ILS                W1H10320
                    NTSYN BSI  L  CALC       GO CALCULATE BCC           W1H10330
                    *************************************************** W1H10340
                    *                        .CKEND. - CHECK FOR END  * W1H10350
                    *                        CHARACTER, ETB OR ETX    * W1H10360
                    *                        IF CHARACTER IS AN ETB OR* W1H10370
                    *                        ETX, SET INDICATORS TO   * W1H10380
                    *                        RECEIVE BCC CHARACTERS   * W1H10390
                    *                        NEXT                     * W1H10400
                    *************************************************** W1H10410
                    CKEND LD    1 BUF-T                                 W1H10420
                          EOR   1 ETB-T                                 W1H10430
                          BSC     Z          SKIP IF CHAR IS AN ETB     W1H10440
                          EOR   1 ETBTX-T                               W1H10450
                          BSC  L  CKABT,Z    BR IF NOT ETB OR ETX       W1H10460
                    *                                                 * W1H10470
                    SETBC STO   1 BCC2-T     RESET BCC2 INDR            W1H10480
                          LDD     *                                 2-6 W1H10490
                          STD   1 TRANS-T    TURN ON TRANSPAR MODE  2-6 W1H10500
                    *             BCC1               BCC TIME INDR  2-6 W1H10510
                    ROMQ1 MDX     ROMQ2      BR TO PUT CHAR IN I/O AREA W1H10520
                    *                                                   W1H10530
                    CKABT LD    1 BUF-T                                 W1H10540
                          EOR   1 ENQ-T      ABORT RECORD ON ENQ        W1H10550
                          BSC  L  TTDCK,+-   BR TO CHECK FOR TTD    2-6 W1H10560
                          LD    1 BUF-T                             2-6 W1H10570
                          EOR   1 ITB-T      BUF = ITB              2-6 W1H10580
                          BSC  L  ROOMQ,Z    BR IF NOT ITB          2-6 W1H10590
                          LD      *                                 2-6 W1H10600
                          STO   1 ITBRD-T    SET ITB READ INDR      2-6 W1H10610
                          SLA     16                                2-6 W1H10620
                          MDX     SETBC                             2-6 W1H10630
                    *                                               2-6 W1H10640
                    TTDCK MDX  L  COUNT,-1   MORE THAN ONE CHAR     2-6 W1H10650
                          MDX     NAKTM      ALREADY RCVD-YES,BR    2-6 W1H10660
                          LD    1 PACK-T     PACKED DATA            2-6 W1H10670
                          BSC  L  TTDPA,Z    YES-BRANCH             2-6 W1H10680
                          MDX  L  POINT,-1   NO-BACKDATE POINTER    2-6 W1H10690
                    TTDPA LD   I  POINT      GET 1ST CHAR           2-6 W1H10700
                          AND   1 HFF00-T    MASK OUT 2ND CHAR      2-6 W1H10710
                          EOR   1 STX-T      WAS IT STX             2-6 W1H10720
                          BSC  L  NAKTM,Z    NO,BRANCH              2-6 W1H10730
                          MDX  L  TTDCT,1    YES,INCR TTD RCVD      2-6 W1H10740
                          NOP                                       2-6 W1H10750
                    *                                                   W1H10760
                    NAKTM LD      *                                     W1H10770
                          STO   1 XNAK-T     TURN ON TRANSMIT NAK IND.  W1H10780
                          BSC  L  STWT       BR TO START WRITE          W1H10790
                    *************************************************** W1H10800
                    *                        .CKBCC. - IF BCC1 IS ON, * W1H10810
                    *                        SCAT2 IS EXPECTING TO    * W1H10820
                    *                        RECEIVE THE BCC CHARACTER* W1H10830
                    *                        OTHERWISE, SCAT2 IS STILL* W1H10840
                    *                        RECEIVING TRANSPARENT    * W1H10850
                    *                        DATA                     * W1H10860
                    *************************************************** W1H10870
                    CKBCC LD    1 BCC1-T                                W1H10880
                          BSC  L  BCCTM,Z    BR IF TIME TO CHECK BCC    W1H10890
                    *                                                 * W1H10900
                          LD    1 LSDLE-T                               W1H10910
                          BSC  L  YSDLE,Z    BR IF LAST CHAR WAS A DLE  W1H10920
                    *                                                 * W1H10930
                          LD    1 BUF-T                                 W1H10940
                          EOR   1 DLE-T                                 W1H10950
                          BSC  L  STDLE,+-   BR IF CHAR IS A DLE    2-5 W1H10960
                    *                                                 * W1H10970
                          BSI  L  CALC       GO CALCULATE BCC           W1H10980
                          MDX     ROMQ1      BR TO PUT CHAR IN I/O AREA W1H10990
                    *                                                 * W1H11000
                    YSDLE SLA     16                                    W1H11010
                          STO   1 LSDLE-T    TURN OFF LAST CHAR=DLE IND W1H11020
                          LD    1 BUF-T                                 W1H11030
                          EOR   1 SYN-T                                 W1H11040
                          BSC  L  YSSYN,+-   BR IF CHAR IS A SYN        W1H11050
                    *                                                 * W1H11060
                          BSI  L  CALC       GO CALCULATE BCC           W1H11070
                          LD    1 BUF-T                                 W1H11080
                          EOR   1 DLE-T                                 W1H11090
                          BSC  I  INT1,+-    EXIT TO ILS IF A DLE       W1H11100
                          MDX     CKEND      BR TO CHECK FOR ETB, ETX   W1H11110
                    *                                                 * W1H11120
                    YSSYN MDX  L  SYN2,+2    UP 2 SYN IND. BY 2         W1H11130
                          LD    1 PACK-T                            2-4 W1H11140
                          BSC  L  DRPNT,+-   BR IF NOT PACKED DATA  2-4 W1H11150
                          LD    1 COUNT-T                           2-4 W1H11160
                          BSC  L  DRCNT,E                           2-4 W1H11170
                    DRPNT MDX  L  POINT,-1   DECR COUNT             2-4 W1H11180
                          LD   I  POINT      REMOVE DLE FROM BUFFER 2-4 W1H11190
                          AND   1 HFF00-T                           2-4 W1H11200
                          STO  I  POINT                             2-4 W1H11210
                    DRCNT MDX  L  COUNT,-1   DECR COUNT             2-4 W1H11220
                          MDX     INT5       EXIT TO ILS            2-3 W1H11230
                    *************************************************** W1H11240
                    *             BLOCK CHECK CHARACTER               * W1H11250
                    *************************************************** W1H11260
                    BCCTM LD    1 BCC2-T                                W1H11270
                          BSC  L  GET1,+-    BR TO GET FIRST BCC CHAR   W1H11280
                    *                                                 * W1H11290
                          LD    1 BCCR-T                                W1H11300
                          EOR   1 BUF-T      COMBINE TWO CHAR BCC       W1H11310
                          STO   1 BCCR-T                                W1H11320
                    *                                                 * W1H11330
                          SLA     16                                    W1H11340
                          STO   1 BCC2-T     TURN OFF BCC2 IND          W1H11350
                          LD    1 ITBRD-T                           2-6 W1H11360
                          BSC  L  ITBBC,Z    BR IF ITB READ         2-6 W1H11370
                    *                                                   W1H11380
                          LD    1 OVFLO-T                               W1H11390
                          BSC  L  E1000,Z    BR IF OVERFLOW OCCURRED    W1H11400
                    *                                                 * W1H11410
                          LD    1 BCCR-T     IS BCC CORRECT             W1H11420
                          EOR   1 BCCA-T                                W1H11430
                          BSC  L  E0800,Z    BR TO ERROR IF NOT EQUAL   W1H11440
                    *                                                   W1H11450
                          LD    1 ITBER-T                           2-6 W1H11460
                          BSC  L  E0800,Z    BR IF ITB BCC ERROR    2-6 W1H11470
                    *                                                   W1H11480
                    CKALT XIO   1 ENDOP-T   END OPERATION           2-9 W1H11485
                          LD    1 SUBF-T                            2-9 W1H11490
                          BSC  L  RPEAT,Z-   BR IF RECEIVE REPEAT       W1H11500
                    *                                                   W1H11510
                          LDD   1 ACK-T                                 W1H11520
                          RTE     16         ALTERNATE ACKNOWLEDGEMENTS W1H11530
                          STD   1 ACK-T                                 W1H11540
                    RPEAT SLT     32                                2-6 W1H11550
                          STO   1 PADCK-T    CLEAR PAD CHECK INDR   2-6 W1H11560
                          STD   1 XNAK-T     RESET XMIT NAK INDR    2-6 W1H11570
                    *             XMENQ            MON ENQ INDR     2-6 W1H11580
                    *                                                 * W1H11590
                          XIO   1 STRED-T   START READ AGAIN        2-9 W1H11595
                          LD    1 COUNT-T    GIVE USER THE WORD COUNT   W1H11600
                          BSC  L  CLBSY,+    ONLY IF CHARS RCVD     2-5 W1H11610
                          BSC  L  CLBY2      BR TO TURN OFF BUSY IND.   W1H11620
                    *                                                   W1H11630
                    ITBBC SLT     32                                2-6 W1H11640
                          STO   1 ITBRD-T    TURN OFF ITB READ      2-6 W1H11650
                          STD   1 TRANS-T             TRANSPARENT   2-6 W1H11660
                    *             BCC1                BCC TIME      2-6 W1H11670
                          LD    1 BCCR-T     COMPARE BCC RCVD       2-6 W1H11680
                          EOR   1 BCCA-T        WITH BCC ACCD       2-6 W1H11690
                          OR    1 ITBER-T    SAVE PREV ERROR IF ANY 2-6 W1H11700
                          STO   1 ITBER-T    SET ERROR IF NOT EQUAL 2-6 W1H11710
                          SLA     16                                2-6 W1H11720
                          STO   1 BCCA-T     RESET BCC ACCD         2-6 W1H11730
                          MDX     INT4       EXIT TO ILS            2-6 W1H11740
                    E0800 LD    1 H0800-T    BAD BCC ERROR CODE         W1H11750
                          MDX  L  BCCER,+1   COUNT CRC-16 ERRORS    2-3 W1H11760
                          NOP                                       2-3 W1H11770
                          MDX     ERROR      GO DECRE RETRY             W1H11780
                    *                                                 * W1H11790
                    E1000 LD    1 H1000-T    OVERFLOW ERROR CODE        W1H11800
                    ERROR BSI     ERRCK      GO CHECK RETRY COUNTER     W1H11810
                    *                                                 * W1H11820
                    ERRO1 BSC  L  DISC,+-    TERMINATE IF ZERO          W1H11830
                    *                                                 * W1H11840
                          STO   1 XNAK-T     TURN ON TRANSMIT NAK IND.  W1H11850
                          BSC  L  STWT,-     RETRY IF POSITIVE          W1H11860
                    *                                                 * W1H11870
                          MDX     CKALT      ACCEPT WHEN NEGATIVE       W1H11880
                    *                                                 * W1H11890
                    GET1  LD    1 BUF-T      PICK UP FIRST 8 BITS       W1H11900
                          SRA     8          OF BCC                     W1H11910
                          STO   1 BCCR-T                                W1H11920
                          LD      *                                     W1H11930
                          STO   1 BCC2-T     TURN ON BCC2 IND.          W1H11940
                    INT5  MDX     INT4       EXIT TO ILS            2-6 W1H11950
                    *                                                 * W1H11960
                    *                                                   W1H11970
                    TERMT EOR   1 EQET-T     IS BUF = ENQ               W1H11980
                          BSC  L  RCVTM,Z    NO, GO LISTEN FOR ENQ  2-4 W1H11990
                    *                                                   W1H12000
                          MDX     NAKTM      YES, GO SEND NAK           W1H12010
                    *                                                 * W1H12020
                    *************************************************** W1H12030
                          HDNG     SCAT2 - WRITE RESPONSE FOR RECEIVE   W1H12040
                    *************************************************** W1H12050
                    *             WRITE RESPONSE FOR RECEIVE          * W1H12060
                    *************************************************** W1H12070
                    RCVWT BSI     PADIN      GO WRITE PAD IF NECESSARY  W1H12080
                    *                                                 * W1H12090
                          LD    1 XNAK-T                                W1H12100
                          BSC  L  POS,+-     BR IF POSITIVE ACK TO SEND W1H12110
                    *                                                 * W1H12120
                          LD    1 NAK-T      LOG                    2-3 W1H12130
                    SETPD STO   1 BUF-T      LOG                    2-6 W1H12140
                          CALL    IOLOG      NAK OR CURRENT ACK     2-3 W1H12150
                          XIO   1 WTBUF-T    WRITE NAK OR CUR ACK   2-6 W1H12160
                          BSI     STPAD      BR TO SET PAD INDR     2-6 W1H12170
                          BSI     RESRT      BR TO RESET            2-4 W1H12180
                          MDX     STRD2      BR TO START READ       2-4 W1H12190
                    *                                                 * W1H12200
                    RESRT DC      0                                 2-4 W1H12210
                          LD    1 IOAR-T     INITIALIZE I/O AREA    2-4 W1H12220
                          A     1 H0001-T     POINTER                   W1H12230
                          STO   1 POINT-T                               W1H12240
                          STO   1 FIRST-T    TURN ON FIRST CHAR. IND.   W1H12250
                    *                                                 * W1H12260
                          SLT     32                                2-6 W1H12270
                          STO   1 COUNT-T    CLEAR WORD COUNT           W1H12280
                          STD   1 BCCA-T           BCC ACCUMULATION 2-6 W1H12290
                    *             ITBRD            ITB READ INDR    2-6 W1H12300
                          STD   1 LSDLE-T          LAST CHAR = DLE  2-6 W1H12310
                    *             PADCK            PAD CHECK INDR   2-6 W1H12320
                          STD   1 TRANS-T          TRANSPARENT MODE 2-6 W1H12330
                    *             BCC1             BCC TIME         2-6 W1H12340
                          STD   1 SYN2-T           INSERT 2 SYN IND 2-6 W1H12350
                    *             OVFLO            I/O AREA OVFLOW  2-6 W1H12360
                          STO   1 ITBER-T          ITB BCC ERROR    2-6 W1H12370
                          XIO   1 ENDOP-T    RESET CHAR PHASE           W1H12380
                          BSC  I  RESRT      RETURN                 2-4 W1H12390
                    *                                                 * W1H12400
                    POS   BSI  L  WLOID      GO WRITE LOC ID IF ANY 2-6 W1H12410
                          LD    1 LSDLE-T                               W1H12420
                          BSC  L  WTDL,+-    BR IF DLE NOT YET WRITTEN  W1H12430
                    *                                                 * W1H12440
                          LD    1 REMID-T    REINITIALIZE           2-6 W1H12450
                          STO   1 IDPNT-T         REMOTE ID ADDR    2-6 W1H12460
                          LD    1 REMLG-T    REINITIALIZE           2-6 W1H12470
                          STO   1 IDCNT-T         REMOTE ID LENGTH  2-6 W1H12480
                    *                                                 * W1H12490
                          LD    1 ACK-T      LOG ACK                2-3 W1H12500
                          MDX     SETPD      SET PAD INDR           2-3 W1H12510
                    *                                                 * W1H12520
                    WTDL  XIO   1 WTDLE-T    WRITE DLE                  W1H12530
                          LD    1 DLE-T      LOG                    2-3 W1H12540
                          CALL    IOLOG      DLE                    2-3 W1H12550
                    WTDL1 LD      *                                 2-3 W1H12560
                          STO   1 LSDLE-T    TURN ON LAST CHAR=DLE      W1H12570
                          MDX     INT3       EXIT TO ILS                W1H12580
                    *************************************************** W1H12590
                          HDNG    SCAT2 - TIMEOUT FOR RECEIVE           W1H12600
                    *************************************************** W1H12610
                    *             TIMEOUT INTERRUPT FOR RECEIVE       * W1H12620
                    *************************************************** W1H12630
                    RCVT  MDX  L  SLVTO,+1   COUNT SLAVE TIME OUTS  2-3 W1H12640
                          NOP                                       2-3 W1H12650
                          XIO   1 RETIM-T    RESET TIMERS           2-4 W1H12660
                          LD    1 OPTSW-T                           2-4 W1H12670
                          SLA     15                                2-4 W1H12680
                          BSC  L  TMNIT,-    BR IF NO ERROR EXIT    2-4 W1H12690
                          LD    1 SUBF-T                            2-4 W1H12700
                          BSC  L  TMNIT,-    BR IF NOT INITIAL      2-4 W1H12710
                          LD    1 XMENQ-T                           2-4 W1H12720
                          BSC  L  TMNIT,+-   BR IF ENQ RECEIVED     2-4 W1H12730
                          LD    1 H0020-T    ERROR CODE 0020        2-4 W1H12740
                          BSI  I  OPERR      BR TO ERROR RTN        2-4 W1H12750
                    *                                                 * W1H12760
                          LDX  L1 T          INSURE XR1             2-4 W1H12770
                          BSC  L  CKALT,Z+   ACCEPT WHEN NEGATIVE   2-4 W1H12780
                    *                                                 * W1H12790
                          BSC  L  ERRO1,+    CLOSE IF ZERO          2-4 W1H12800
                    *                                                 * W1H12810
                          BSI     RESRT      BR TO RESET AND RESTART2-4 W1H12820
                          XIO   1 STRED-T    START READ             2-4 W1H12830
                          LD    1 OPTSW-T                           2-4 W1H12840
                          SLA     14         THIRD TIMER USED       2-4 W1H12850
                          BSC  I  INT1,-     BR IF NOT              2-4 W1H12860
                    *                                                 * W1H12870
                          XIO   1 TIMER-T    RESTART THIRD TIMER    2-4 W1H12880
                    INT4  MDX     INT3       EXIT TO ILS            2-4 W1H12890
                    RCVTM MDX  L  SISRV,+1   CNT SLV INVAL SEQ RCVD 2-4 W1H12900
                          NOP                                       2-4 W1H12910
                    TMNIT LD    1 IDSEQ-T    REMOTE ID SPECIFIED    2-6 W1H12920
                          BSC  L  NTID1,+-   BR IF NOT              2-6 W1H12930
                          LD    1 REMID-T    REINITIALIZE           2-6 W1H12940
                          STO   1 IDPNT-T         REMOTE ID ADDR    2-6 W1H12950
                          LD    1 REMLG-T    REINITIALIZE           2-6 W1H12960
                          STO   1 IDCNT-T         REMOTE ID LENGTH  2-6 W1H12970
                          LD    1 H2001-T    ID ERROR CODE          2-6 W1H12980
                          MDX     NTID3                             2-6 W1H12990
                    *                                                 * W1H13000
                    NTID1 LD    1 H2000-T    ERROR CODE /2000           W1H13010
                    NTID3 BSI     ERRCK      GO CHECK RETRY COUNTER 2-4 W1H13020
                    *                                                 * W1H13030
                          BSC  L  CKALT,Z+   ACCEPT WHEN NEGATIVE   2-4 W1H13040
                    *                                                 * W1H13050
                          BSC  L  ERRO1,+    CLOSE IF ZERO          2-4 W1H13060
                          BSI     RESRT      RESET                  2-4 W1H13070
                    STRD2 MDX     STRD       BR TO START READ       2-4 W1H13080
                    *************************************************** W1H13090
                    *             ERROR ROUTINE                       * W1H13100
                    *************************************************** W1H13110
                    ERRCK DC      0                                     W1H13120
                          STO     ERRU       SAVE ERROR CODE            W1H13130
                          LD    1 RETRY-T                               W1H13140
                          S     1 H0001-T                               W1H13150
                          STO   1 RETRY-T                               W1H13160
                          BSC  I  ERRCK,Z    EXIT FOR MORE TRYS         W1H13170
                    *                                                 * W1H13180
                          LD    1 H0007-T    SET RETRY COUNT TO SEVEN   W1H13190
                          STO   1 RETRY-T                               W1H13200
                          XIO   1 RETIM-T    RESET TIMERS               W1H13210
                          LD      ERRU       ERROR CODE TO A-REGISTER   W1H13220
                          BSI  I  USERR      GO TO USER ERROR ROUTINE   W1H13230
                          LDX  L1 T                                     W1H13240
                          BSC  I  ERRCK      EXIT TO CHECK OPTIONS      W1H13250
                    ERRU  DC      0          ERROR CODE HOLDER          W1H13260
                          HDNG     SCAT2 - TRANSMIT PAD CHARACTERS      W1H13270
                    *************************************************** W1H13280
                    *             TRANSMIT PAD CHARACTERS             * W1H13290
                    *                  5 SYN CHARACTERS BEFORE EVERY  * W1H13300
                    *                 TRANSMISSION                    * W1H13310
                    *************************************************** W1H13320
                    PADIN DC      0                                     W1H13330
                          LD    1 SYN5-T                            2-3 W1H13340
                          BSC  I  PADIN,+-   BR IF PRECEEDING SYNS SENT W1H13350
                    *                                                 * W1H13360
                          MDX  L  SYN5,-1    DECREE CR FOR 5 SYNS   2-3 W1H13370
                          NOP                                           W1H13380
                          XIO   1 WTSYN-T    WRITE SYN CHARACTER        W1H13390
                          LD    1 SYN-T      LOG                    2-3 W1H13400
                          CALL    IOLOG      SYN                    2-3 W1H13410
                          MDX     INT3       EXIT TO ILS                W1H13420
                    *                                                 * W1H13430
                    STRD  XIO   1 STRED-T    START READ                 W1H13440
                          LD    1 OPTSW-T   THIRD TIMER            2-10 W1H13442
                          SLA     14        *OPTION CHECK          2-10 W1H13444
                          BSC  L  INT3,-    BR IF NOT              2-10 W1H13446
                          XIO   1 TIMER-T   RESTART THIRD TIMER    2-10 W1H13448
                    INT3  BSC  I  INT1       EXIT TO ILS                W1H13450
                    *************************************************** W1H13460
                    *             TRANSMIT ONE PAD CHARACTER AFTER 2-3* W1H13470
                    *              EACH TRANSMISSION               2-3* W1H13480
                    *************************************************** W1H13490
                    STPAD DC      0                                 2-4 W1H13500
                          LD      *                                 2-4 W1H13510
                          STO   1 NXTPD-T    TURN ON PAD INDR       2-4 W1H13520
                          MDX     INT3       EXIT TO ILS            2-4 W1H13530
                    *                                                 * W1H13540
                    WRPAD LD    1 PAD-T                             2-6 W1H13550
                          STO   1 BUF-T                             2-6 W1H13560
                          CALL    IOLOG      LOG PAD                2-3 W1H13570
                          XIO   1 WTBUF-T    WRITE PAD              2-6 W1H13580
                          SLA     16                                2-6 W1H13590
                          STO   1 NXTPD-T    TURN OFF NEXT PAD INDR 2-6 W1H13600
                          BSC  I  STPAD      RETURN TO NORMAL FLOW  2-4 W1H13610
                          HDNG    SCAT2 - WRITE RESPONSE TRANSMIT END   W1H13620
                    *************************************************** W1H13630
                    *             WRITE RESPONSE FOR TRANSMIT END     * W1H13640
                    *************************************************** W1H13650
                    ENDWT BSI     PADIN      GO WRITE SYN CHARS         W1H13660
                    *                                                   W1H13670
                          LD    1 SUBF-T                            2-4 W1H13680
                          BSC  L  ET,+Z      BR TO WT EOT IF NEGATIVE   W1H13690
                    *                                                 * W1H13700
                          LD    1 LSDLE-T                               W1H13710
                          BSC  L  WTDL,+-    BR TO WRITE DLE            W1H13720
                    *                                                 * W1H13730
                    ET    LD    1 EOT-T                             2-6 W1H13740
                          STO   1 BUF-T                             2-6 W1H13750
                          CALL    IOLOG      EOT                    2-3 W1H13760
                          XIO   1 WTBUF-T    WRITE EOT              2-6 W1H13770
                    *                                                 * W1H13780
                          BSI     STPAD      BR TO SET PAD INDR     2-4 W1H13790
                          LD    1 SUBF-T     BR TO TEST             2-4 W1H13800
                          BSC  L  RDTST,+Z    WRITE EOT FUNC        2-4 W1H13810
                    *                                                 * W1H13820
                          BSC  L  DISC       BRANCH TO CLOSE        2-4 W1H13830
                    *                                                 * W1H13840
                    RDTST LD    1 EOTRP-T    TEST IF READ RESPONSE  2-4 W1H13850
                          BSC  L  STRD,+-     YES, BR TO START READ 2-4 W1H13860
                          LD      *         MAKE COUNT TEMP NEG    2-10 W1H13865
                          STO   1 COUNT-T   *FOR BRANCH TO CLBY2    2-9 W1H13866
                    *                         NO, BR TO TURN          * W1H13870
                          BSC  L  CKALT      OFF RTN BUSY           2-9 W1H13880
                          HDNG     SCAT2 - READ RESPONSE- TRANSMIT END  W1H13890
                    *************************************************** W1H13900
                    *             READ RESPONSE FOR TRANSMIT END      * W1H13910
                    *************************************************** W1H13920
                    ENDRD LD    1 LSDLE-T                               W1H13930
                          BSC  L  DIS,Z      BR IF LAST CHAR = DLE      W1H13940
                    *                                                 * W1H13950
                          LD    1 BUF-T                                 W1H13960
                          EOR   1 DLE-T                                 W1H13970
                          BSC  L  WTDL1,+-   BR IF CHAR IS A DLE    2-3 W1H13980
                    *                                                 * W1H13990
                          EOR   1 DLEOT-T                               W1H14000
                          BSC  L  NEOT,Z     BR IF CHAR NOT AN EOT      W1H14010
                    *                                                 * W1H14020
                          BSI  L  PDCHK      SET UP FOR PAD CK      2-6 W1H14030
                          BSC  L  NENQ,Z     BR IF INVALID PAD      2-6 W1H14040
                    *                                                 * W1H14050
                          LD    1 EOT-T      EOT IN FIRST WD OF I/O     W1H14060
                          MDX     DISM2      BR TO TURN OFF BUSY        W1H14070
                    *                                                 * W1H14080
                    NEOT  EOR   1 EQET-T                                W1H14090
                          BSC  L  NENQ,Z     BR IF NOT AN ENQ           W1H14100
                    *                                                 * W1H14110
                          LD    1 ENQ-T      ENQ IN FIRST WD OF I/O     W1H14120
                    DISM2 BSC  L  CLBY2      BR TO TURN OFF BUSY        W1H14130
                    *                                                 * W1H14140
                    DIS   LD    1 BUF-T                                 W1H14150
                          EOR   1 EOT-T                                 W1H14160
                          BSC  L  DISCO,+-   BR TO DISCONNECT IF EOT    W1H14170
                    *                                                 * W1H14180
                    NENQ  LD    1 H0200-T    ERROR CODE                 W1H14190
                          MDX  L  MISRV,1    INCR MSTR INV SEQ RCVD 2-6 W1H14200
                          NOP                                       2-6 W1H14210
                    NENQ1 BSI     ERRCK      GO DECRE RETRY             W1H14220
                    *                                                 * W1H14230
                          BSC  L  CLBSY,Z+   RESET AND CONTINUE     2-4 W1H14240
                    *                                                 * W1H14250
                    ERP1  BSC  L  DISC,+-    DISCONNECT IF A-REG IS 0   W1H14260
                          SLT     32                                2-6 W1H14270
                          STO   1 TRANS-T    RESET TRANSPARENT      2-6 W1H14280
                          STD   1 LSDLE-T          LAST CHAR = DLE  2-6 W1H14290
                    *             PADCK            PAD CHECK INDR   2-6 W1H14300
                          LD      ERRU                                  W1H14310
                          EOR     H8000      DO NOT ST WRITE IF NOT RDY W1H14320
                          BSC  L  STWT,Z     BR TO START WRITE          W1H14330
                    *                                                   W1H14340
                          BSC  L  CLBY3      BR TO RESET TIMER,EXIT 2-5 W1H14350
                    *                                                   W1H14360
                    *                                                   W1H14370
                    NTRDY LD      H8000      DATA SET FAIL ERROR CODE   W1H14380
                          MDX     NENQ1      GO DECRE RETRY             W1H14390
                    H8000 DC      /8000      DATA SET FAIL ERROR CODE   W1H14400
                    *************************************************** W1H14410
                          HDNG     SCAT2 - TIMEOUT - TRANSMIT END       W1H14420
                    *************************************************** W1H14430
                    *             TIMEOUT INTERRUPT FOR TRANSMIT END  * W1H14440
                    *                 IF A TIMEOUT OCCURS AFTER SCAT2 * W1H14450
                    *                 TRANSMITS AN EOT, SCAT2 WILL    * W1H14460
                    *                 PERFORM A CLOSE IF REQUESTED    * W1H14470
                    *************************************************** W1H14480
                    ENDTM LD    1 CLOSE-T                               W1H14490
                          BSC  L  CLBSY,Z    BR TO TURN OFF RTN. BUSY   W1H14500
                    *                                                   W1H14510
                          MDX     ERP1       CLOSE IF REQUESTED ON EOT  W1H14520
                    *************************************************** W1H14530
                          HDNG     SCAT2 - CALCULATE BLOCK CHECK CHAR   W1H14540
                    *************************************************** W1H14550
                    *             CALCULATE BLOCK CHECK CHAR. CRC-16  * W1H14560
                    *************************************************** W1H14570
                    CALC  DC      0                                     W1H14580
                          LD    1 BUF-T                                 W1H14590
                          SRA     8                                     W1H14600
                          EOR   1 BCCA-T     ADD IN REMAINDER           W1H14610
                          BSC  L  EOR1,E     BR IF ONE                  W1H14620
                          SRA     1                                     W1H14630
                    B2    BSC  L  EOR2,E     BR IF ONE                  W1H14640
                          SRA     1                                     W1H14650
                    B3    BSC  L  EOR3,E     BR IF ONE                  W1H14660
                          SRA     1                                     W1H14670
                    B4    BSC  L  EOR4,E     BR IF ONE                  W1H14680
                          SRA     1                                     W1H14690
                    B5    BSC  L  EOR5,E     BR IF ONE                  W1H14700
                          SRA     1                                     W1H14710
                    B6    BSC  L  EOR6,E     BR IF ONE                  W1H14720
                          SRA     1                                     W1H14730
                    B7    BSC  L  EOR7,E     BR IF ONE                  W1H14740
                          SRA     1                                     W1H14750
                    B8    BSC  L  EOR8,E     BR IF ONE                  W1H14760
                          SRA     1                                     W1H14770
                    B9    STO   1 BCCA-T     STORE NEW REMAINDER        W1H14780
                          BSC  I  CALC                                  W1H14790
                    *                                                 * W1H14800
                    EOR1  SRA     1                                     W1H14810
                          EOR     POLY       ADD POLYNOMIAL             W1H14820
                          MDX     B2         BR TO TEST NEXT CHAR       W1H14830
                    EOR2  SRA     1                                     W1H14840
                          EOR     POLY       ADD POLYNOMIAL             W1H14850
                          MDX     B3         BR TO TEST NEXT CHAR       W1H14860
                    EOR3  SRA     1                                     W1H14870
                          EOR     POLY       ADD POLYNOMIAL             W1H14880
                          MDX     B4         BR TO TEST NEXT CHAR       W1H14890
                    EOR4  SRA     1                                     W1H14900
                          EOR     POLY       ADD POLYNOMIAL             W1H14910
                          MDX     B5         BR TO TEST NEXT CHAR       W1H14920
                    EOR5  SRA     1                                     W1H14930
                          EOR     POLY       ADD POLYNOMIAL             W1H14940
                          MDX     B6         BR TO TEST NEXT CHAR       W1H14950
                    EOR6  SRA     1                                     W1H14960
                          EOR     POLY       ADD POLYNOMIAL             W1H14970
                          MDX     B7         BR TO TEST NEXT CHAR       W1H14980
                    EOR7  SRA     1                                     W1H14990
                          EOR     POLY       ADD POLYNOMIAL             W1H15000
                          MDX     B8         BR TO TEST NEXT CHAR       W1H15010
                    EOR8  SRA     1                                     W1H15020
                          EOR     POLY       ADD POLYNOMIAL             W1H15030
                          MDX     B9         BR STORE REMAINDER         W1H15040
                    *                                                 * W1H15050
                    POLY  DC      /A001      POLYNOMIAL FOR CRC-16      W1H15060
                    *************************************************** W1H15070
                          HDNG     SCAT2 - WRITE RESPONSE FOR TRANSMIT  W1H15080
                    *************************************************** W1H15090
                    *             WRITE RESPONSE FOR TRANSMIT         * W1H15100
                    *************************************************** W1H15110
                    XMTWT BSI  L  PADIN      GO WRITE PADS IF NECESSARY W1H15120
                          LD    1 SYN2-T     CK INSERT 2 SYNS           W1H15130
                          BSC  L  XMT1,+-    BR IF NOT INSERT TIME      W1H15140
                    *************************************************** W1H15150
                    *             INSERT SYNCHRONOUS IDLE ON A TIMEOUT* W1H15160
                    *              WITH A WRITE RESPONSE IN NORMAL    * W1H15170
                    *              TEXT. TIMEOUT OCCURS ALONE IN      * W1H15180
                    *              TRANSPARENT TEXT AND CAUSES INSERT * W1H15190
                    *              SYN SYN IN NORMAL TEXT             * W1H15200
                    *              DLE SYN IN TRANSPARENT TEXT        * W1H15210
                    *************************************************** W1H15220
                          LD    1 LSDLE-T    NO INSERT AFTER A DLE      W1H15230
                          BSC  L  XMT1,Z     BR AROUND INSERT           W1H15240
                    *                                                 * W1H15250
                          LD    1 XMESS-T    NO INSERT AFTER ETB OR ETX W1H15260
                          BSC  L  XMT1,+-    BR AROUND INSERT           W1H15270
                    *                                                 * W1H15280
                          LD    1 DSW-T                                 W1H15290
                          SLA     2          IF CHECK BIT IS ON         W1H15300
                          BSC  L  SYN1,+Z    BR TO SEND ONLY 1 SYN      W1H15310
                    *                                                 * W1H15320
                          MDX  L  SYN2,-1    DECRE 2 SYN COUNTER BY 1   W1H15330
                          MDX     CKDLE      CK TRANSPARENT ON FIRST    W1H15340
                    WSYN1 XIO   1 WTSYN-T    WRITE SYN              2-3 W1H15350
                          LD    1 SYN-T      LOG                    2-3 W1H15360
                    INTXC CALL    IOLOG      SYN OR DLE             2-3 W1H15370
                    INTX2 BSC  I  INT1       EXIT TO ILS                W1H15380
                    *                                                 * W1H15390
                    SYN1  SLA     16                                    W1H15400
                          STO   1 SYN2-T     TURN OFF SYN2 IND.         W1H15410
                          MDX     WSYN1      BR TO WRITE SYN        2-3 W1H15420
                    *                                                 * W1H15430
                    CKDLE LD    1 TRANS-T    CK TRANSPARENT MODE IND.   W1H15440
                          BSC  L  WSYN1,+-   BR TO WRITE SYN, NON TRANS W1H15450
                    CKDL  XIO   1 WTDLE-T    WRITE DLE, TRANSPARENT 2-4 W1H15460
                          LD    1 DLE-T      LOG DLE                2-3 W1H15470
                          MDX     INTXC      GO LOG AND EXIT            W1H15480
                    *************************************************** W1H15490
                    XMT1  LD    1 XMENQ-T                               W1H15500
                          BSC  L  ENQWT,Z    BR TO TRANSMIT ENQ         W1H15510
                    *                                                 * W1H15520
                          LD    1 XMESS-T    IF TRANSMIT MESS. IS OFF,  W1H15530
                          BSC  L  NOMES,+-   BR TO SEND END FUNCITON    W1H15540
                    *************************************************** W1H15550
                    *             SEND MESSAGE                        * W1H15560
                    *************************************************** W1H15570
                          LD    1 PACK-T     IS DATA UNPACKED       2-4 W1H15580
                          BSC  L  WTEVN,+-   BR IF IT IS            2-4 W1H15590
                          LD    1 COUNT-T    IS COUNT EVEN          2-4 W1H15600
                          BSC  L  WTODD,E    BR IF ODD              2-4 W1H15610
                    *                                                 * W1H15620
                    WTEVN LD   I  POINT      PUT CHAR FROM I/O      2-4 W1H15630
                          AND   1 HFF00-T                           2-3 W1H15640
                          STO   1 BUF-T       AREA INTO BUF             W1H15650
                          LD    1 FIRST-T                               W1H15660
                          BSC  L  NTFST,+-   BR IF NOT FIRST CHARACTER  W1H15670
                          MDX     FRST       BR TO PROC FIRST CHAR  2-4 W1H15680
                    *                                                 * W1H15690
                    WTODD LD   I  POINT      SHIFT 2ND CHAR IN WORD 2-4 W1H15700
                          SLA     8          TO HIGH ORDER END      2-4 W1H15710
                          STO   1 BUF-T      AND STORE IN BUFFER    2-4 W1H15720
                          MDX     NTFST                             2-4 W1H15730
                    *************************************************** W1H15740
                    *             FIRST CHARACTER TO BE SENT          * W1H15750
                    *************************************************** W1H15760
                    FRST  LD    1 IOAR-T     INITLZ I/O AREA PT     2-4 W1H15770
                          A     1 H0001-T                               W1H15780
                          STO   1 POINT-T                               W1H15790
                          STO   1 BCC1-T     TURN ON BCC1 IND.          W1H15800
                    *                                                 * W1H15810
                          SLA     16                                    W1H15820
                          STO   1 BCCA-T     CLEAR BCC ACCUMULATION     W1H15830
                          STO   1 LSDLE-T    TURN OFF LAST CHAR=DLE IND W1H15840
                          STO   1 FIRST-T             FIRST CHAR. IND.  W1H15850
                          LD   I  POINT      PUT CHARACTER FROM I/O     W1H15860
                          AND   1 HFF00-T                           2-3 W1H15870
                          STO   1 BUF-T      AREA INTO BUF              W1H15880
                    *                                                 * W1H15890
                          LD    1 TEXTM-T    CHECK TEXT MODE            W1H15900
                          BSC  L  NTRAN,+-   BR IF NORMAL TEXT          W1H15910
                    *                                                 * W1H15920
                          LD    1 BUF-T                                 W1H15930
                          EOR   1 DLE-T                                 W1H15940
                          BSC  L  NDLE,Z     BR IF BUF NOT DLE          W1H15950
                    *                                                 * W1H15960
                    *************************************************** W1H15970
                    *             .STXIN. ON IF DLE HAS BEEN FOUND    * W1H15980
                    *************************************************** W1H15990
                          LD      *                                     W1H16000
                          STO   1 STXIN-T    TURN ON STX INDICATOR      W1H16010
                          MDX     NTRAN                                 W1H16020
                    *                                                 * W1H16030
                    *************************************************** W1H16040
                    *             .DLSTX. ON IF DLE HAS NOT BEEN FOUND* W1H16050
                    *************************************************** W1H16060
                    NDLE  STO   1 DLSTX-T    TURN ON DLE STX INDICATOR  W1H16070
                    NTRAN LD    1 PACK-T     IS DATA UNPACKED       2-4 W1H16080
                          BSC  L  UPPTR,+-   BR IF IT IS            2-4 W1H16090
                          LD    1 COUNT-T    COUNT EVEN             2-4 W1H16100
                          BSC  L  UPPTR,E    BR IF ODD              2-4 W1H16110
                          MDX     UPCNT      INCR CHAR COUNT        2-4 W1H16120
                    *                                                 * W1H16130
                    UPPTR MDX  L  POINT,+1   INCR I/O AREA POINTER  2-4 W1H16140
                    *                                                 * W1H16150
                    UPCNT MDX  L  COUNT,+1   INCR CHAR COUNT        2-4 W1H16160
                          LD    1 COUNT-T    LAST CHARACTER         2-4 W1H16170
                          EOR   1 WDCNT-T                           2-4 W1H16180
                          BSC  L  ITBCK,Z    BR IF NOT LAST CHAR    2-6 W1H16190
                    *                                                 * W1H16200
                    WTBF2 SLA     16                                    W1H16210
                          STO   1 XMESS-T    TURN OFF TRANSMIT MESS.IND W1H16220
                    WTBF  XIO   1 WTBUF-T    WRITE CONTENTS OF BUF      W1H16230
                          LD    1 BUF-T      LOG                    2-3 W1H16240
                          CALL    IOLOG      BUF CONTENTS           2-3 W1H16250
                    INTX3 MDX     INTX2      EXIT TO ILS            2-3 W1H16260
                    *                                                   W1H16270
                    ITBCK LD    1 TRANS-T                           2-6 W1H16280
                          BSC  L  WTBF,Z     BR IF TRANSPARENT      2-6 W1H16290
                          LD    1 BUF-T                             2-6 W1H16300
                          EOR   1 ITB-T      BUF = ITB              2-6 W1H16310
                          BSC  L  WTBF,Z     BR IF NOT ITB          2-6 W1H16320
                          LD      *                                 2-6 W1H16330
                          STO   1 ITBRD-T    SET ITB BCC INDR       2-6 W1H16340
                          MDX     WTBF2      BR TO TURN OFF XMESS   2-6 W1H16350
                    *************************************************** W1H16360
                    *             FIRST CHARACTER HAS BEEN SENT       * W1H16370
                    *************************************************** W1H16380
                    NTFST LD    1 STXIN-T                               W1H16390
                          BSC  L  XMT2,+-    BR IF STX IND. NOT ON      W1H16400
                    *                                                 * W1H16410
                          SLA     16                                    W1H16420
                          STO   1 STXIN-T    TURN OFF STX INDICATOR     W1H16430
                    LDREG XIO   1 LDDLE-T    LOAD SYNC WITH DLE         W1H16440
                          LD      *                                     W1H16450
                          STO   1 TRANS-T    TURN ON IN TRANSPARENT IND W1H16460
                          XIO   1 TIMER-T    START THIRD TIMER          W1H16470
                          MDX     NTRAN      BR TO WRITE CHARACTER      W1H16480
                    *                                                 * W1H16490
                    XMT2  LD    1 DLSTX-T                               W1H16500
                          BSC  L  XMT3,+-    BR IF DLE STX IND. OFF     W1H16510
                    *                                                 * W1H16520
                          LD    1 LSDLE-T                               W1H16530
                          BSC  L  XMT4,+-    BR IF LAST CHAR NOT A DLE  W1H16540
                    *                                                 * W1H16550
                          SLA     16                                    W1H16560
                          STO   1 DLSTX-T    TURN OFF DLE STX IND.      W1H16570
                          STO   1 LSDLE-T    TURN OFF LAST CHAR=DLE IND W1H16580
                          BSI  L  CALC       GO CALCULATE BCC           W1H16590
                          MDX     LDREG      BR TO LOAD SYNC REGISTER   W1H16600
                    *                                                 * W1H16610
                    XMT4  LD    1 BUF-T                                 W1H16620
                          EOR   1 DLE-T                                 W1H16630
                          BSC  L  XMT4A,Z    BR IF BUF NOT A DLE        W1H16640
                    *                                                 * W1H16650
                          LD      *                                     W1H16660
                          STO   1 LSDLE-T    TURN ON LAST CHAR=DLE      W1H16670
                          MDX     XMT4B      BR TO CALC BCC             W1H16680
                    *                                                 * W1H16690
                    XMT4A LD    1 BUF-T                                 W1H16700
                          EOR   1 SYN-T      IF BUF = SYN,              W1H16710
                          BSC  L  NTRAN,+-   DO NOT CALCULATE BCC       W1H16720
                    *                                                   W1H16730
                    XMT4B BSI  L  CALC       GO CALCULATE BCC           W1H16740
                          MDX     NTRAN      BR TO WRITE CHARACTER      W1H16750
                    *                                                 * W1H16760
                    XMT3  LD    1 TRANS-T                               W1H16770
                          BSC  L  XMT4A,+-   BR IF NOT IN TRANSPARENT   W1H16780
                    *************************************************** W1H16790
                    *             TRANSPARENT TEXT                    * W1H16800
                    *************************************************** W1H16810
                          LD    1 DSW-T                                 W1H16820
                          SLA     2          IF CHECK BIT IS ON         W1H16830
                          BSC  L  WSYN1,+Z   BR TO WRITE SYN        2-3 W1H16840
                    *                                                 * W1H16850
                          LD    1 LSDLE-T                               W1H16860
                          BSC  L  XMT5,Z     BR IF LAST CHAR=DLE        W1H16870
                    *                                                 * W1H16880
                          LD    1 BUF-T                                 W1H16890
                          EOR   1 DLE-T                                 W1H16900
                          BSC  L  XMT4B,Z    BR IF CHAR NOT A DLE       W1H16910
                    *                                                 * W1H16920
                          LD      *                                     W1H16930
                          STO   1 LSDLE-T    TURN ON LAST CHAR=DLE IND  W1H16940
                          MDX     XMT4B      BR TO CALCULATE BCC        W1H16950
                    *                                                 * W1H16960
                    XMT5  SLA     16                                    W1H16970
                          STO   1 LSDLE-T    TURN OFF LAST CHAR=DLE IND W1H16980
                    CKDL1 BSC  L  CKDL       BR TO WRITE DLE        2-4 W1H16990
                    *************************************************** W1H17000
                    *             TRANSMIT ENDING CHARACTERS          * W1H17010
                    *************************************************** W1H17020
                    NOMES LD    1 TRANS-T                               W1H17030
                          BSC  L  XMT6,+-    BR IF NOT TRANSPARENT MODE W1H17040
                    *                                                 * W1H17050
                          LD    1 LSDLE-T                               W1H17060
                          BSC  L  XMT5,Z     BR IF LAST CHAR=DLE        W1H17070
                    *                                                 * W1H17080
                          XIO   1 TIMER-T    STOP THIRD TIMER           W1H17090
                          LD    1 TEND-T                                W1H17100
                          BSC  L  XMT7,Z     BR IF XMIT ETX OR ETB ON   W1H17110
                    *                                                 * W1H17120
                          LD      *                                     W1H17130
                          STO   1 TEND-T     TURN ON TRANSMIT END IND   W1H17140
                          MDX     CKDL1      BR TO WRITE DLE        2-4 W1H17150
                    *                                                 * W1H17160
                    XMT7  SLA     16                                    W1H17170
                          STO   1 TRANS-T    TURN OFF IN TRANS MODE IND W1H17180
                          STO   1 TEND-T     TURN OFF XMIT END IND.     W1H17190
                          LD    1 TBTX-T                                W1H17200
                          BSC  L  XMT8,Z     BR TO WRITE ETX            W1H17210
                    *                                                 * W1H17220
                          LD    1 ETB-T                                 W1H17230
                    XMT84 STO   1 BUF-T      PUT ETB INTO BUF           W1H17240
                          BSI  L  CALC       GO CALCULATE BCC           W1H17250
                          MDX     WTBF       BR TO WRITE ETB OR ETX     W1H17260
                    *                                                 * W1H17270
                    XMT8  LD    1 ETX-T      PUT ETX INTO BUF           W1H17280
                          MDX     XMT84      BR TO STORE ETX            W1H17290
                    *************************************************** W1H17300
                    *             TRANSMIT BLOCK CHECK CHARACTERS     * W1H17310
                    *************************************************** W1H17320
                    XMT6  LD    1 BCC1-T                                W1H17330
                          BSC  L  LAST8,+-   BR TO WRITE LAST OF BCC    W1H17340
                    *                                                 * W1H17350
                          SLA     16                                    W1H17360
                          STO   1 BCC1-T     TURN OFF BCC1 IND.         W1H17370
                          LD    1 BCCA-T                                W1H17380
                          SLA     8                                     W1H17390
                          STO   1 BUF-T                                 W1H17400
                          MDX     WTBF       GO WRITE FIRST PART OF BCC W1H17410
                    *                                                 * W1H17420
                    LAST8 LD    1 BCCA-T                            2-6 W1H17430
                          STO   1 BUF-T                             2-6 W1H17440
                          SRA     8          LAST                   2-3 W1H17450
                          SLA     8          8 BITS                 2-3 W1H17460
                          CALL    IOLOG      OF BCC                 2-3 W1H17470
                          XIO   1 WTBUF-T    WRITE 8 LAST BITS      2-6 W1H17480
                          XIO   1 LOAD-T     LOAD SYN INTO SYNC REG.2-3 W1H17490
                    *                                                   W1H17500
                          LD    1 ITBRD-T                           2-6 W1H17510
                          BSC  L  STPD1,+-   BR IF NOT ITB BCC      2-6 W1H17520
                          SLT     32                                2-6 W1H17530
                          STD   1 BCCA-T     CLEAR BCC ACCUM        2-6 W1H17540
                    *             ITBRD            ITB BCC ACCUM    2-6 W1H17550
                          LD      *                                 2-6 W1H17560
                          STO   1 BCC1-T     TURN ON BCC1           2-6 W1H17570
                          STO   1 XMESS-T    TURN ON XMESS          2-6 W1H17580
                    INTX5 MDX     INTX3      EXIT TO ILS            2-6 W1H17590
                    *                                                 * W1H17600
                    ENQWT BSI     WLOID      GO WRITE LOC ID IF ANY 2-6 W1H17610
                          LD    1 ENQ-T                             2-6 W1H17620
                          STO   1 BUF-T                             2-6 W1H17630
                          CALL    IOLOG      ENQ                    2-3 W1H17640
                          XIO   1 WTBUF-T    WRITE ENQ              2-6 W1H17650
                          LD    1 REMID-T    INITIALIZE             2-6 W1H17660
                          STO   1 IDPNT-T         REMOTE ID ADDR    2-6 W1H17670
                          LD    1 REMLG-T    INITIALIZE             2-6 W1H17680
                          STO   1 IDCNT-T         REMOTE ID LENGTH  2-6 W1H17690
                    STPD1 BSI  L  STPAD      BR TO SET PAD INDR     2-4 W1H17700
                          LD    1 D0008-T                           2-6 W1H17710
                          STO   1 LGS-T      SET LEAD GRAPHS COUNT  2-6 W1H17720
                          BSC  L  STRD       BR TO START READ       2-4 W1H17730
                    *************************************************** W1H17740
                    *                                                 * W1H17750
                    DLNQT EQU     TIMER      CONSTANT FOR EOT CHECK     W1H17760
                    DLNAK EQU     ENQ        DLE AND NAK EOR        2-3 W1H17770
                    WACOD EQU     H0080      WACK RCVD ERROR CODE   2-6 W1H17780
                    *************************************************** W1H17790
                          HDNG    SCAT2 - ID SUBROUTINES                W1H17800
                    *************************************************** W1H17810
                    *             WRITE LOCAL ID                      * W1H17820
                    *************************************************** W1H17830
                    WLOID DC      *-*                               2-6 W1H17840
                          LD    1 IDSEQ-T    LOCAL ID SPECIFIED     2-6 W1H17850
                          BSC  I  WLOID,+-   BRANCH IF NOT          2-6 W1H17860
                          LD    1 IDCNT-T    ALL ID WORDS WRITTEN   2-6 W1H17870
                          BSC  I  WLOID,+-   BRANCH IF NOT          2-6 W1H17880
                    *                                                 * W1H17890
                          LD   I  IDPNT      GET NEXT ID WORD       2-6 W1H17900
                          AND   1 HFF00-T    MASK OUT RIGHT 8 BITS  2-6 W1H17910
                          STO   1 BUF-T                             2-6 W1H17920
                          CALL    IOLOG      LOG ID                 2-6 W1H17930
                          XIO   1 WTBUF-T    WRITE ID               2-6 W1H17940
                          MDX  L  IDCNT,-1   DECR LOCAL ID COUNT    2-6 W1H17950
                          NOP                                       2-6 W1H17960
                          MDX  L  IDPNT,+1   INCR LOCAL ID POINTER  2-6 W1H17970
                          MDX     INTX5      EXIT TO ILS            2-6 W1H17980
                    *************************************************** W1H17990
                    *             READ REMOTE ID                      * W1H18000
                    *************************************************** W1H18010
                    RREID DC      *-*                               2-6 W1H18020
                          LD    1 BUF-T                             2-6 W1H18030
                          EOR   1 SYN-T      ACCEPT SYN IN ID       2-6 W1H18040
                          BSC  I  INT1,+-    EXIT IF SYN IN ID      2-6 W1H18050
                          LD    1 IDCNT-T                           2-6 W1H18060
                          BSC  I  RREID,+-   BR IF ID COUNT ZERO    2-6 W1H18070
                          LD   I  IDPNT      GET NEXT ID WORD AND   2-6 W1H18080
                          AND   1 HFF00-T    CHECK ONLY LEFT 8 BITS 2-6 W1H18090
                          EOR   1 BUF-T      COMPARE WITH ID READ   2-6 W1H18100
                          BSC  I  RREID,Z    BR IF NO MATCH         2-6 W1H18110
                          MDX  L  IDCNT,-1   DECR REMOT ID COUNT    2-6 W1H18120
                          NOP                                       2-6 W1H18130
                          MDX  L  IDPNT,+1   INCR REMOT ID POINTER  2-6 W1H18140
                          MDX     INTX5      EXIT TO ILS            2-6 W1H18150
                    *                                                 * W1H18160
                    CREID DC      *-*                               2-6 W1H18170
                          LD    1 IDSEQ-T    REMOTE ID SPECIFIED    2-6 W1H18180
                          BSC  I  CREID,+-   BRANCH IF NOT          2-6 W1H18190
                          LD    1 IDCNT-T    CORRECT ID RCVD        2-6 W1H18200
                          BSC  I  CREID,+-   YES - BRANCH           2-6 W1H18210
                          MDX     TIMEX      NO, INVAL SEQ          2-6 W1H18220
                    *************************************************** W1H18230
                    *             LEADING GRAPHICS COUNT CHECK     2-6* W1H18240
                    *************************************************** W1H18250
                    LGCHK DC      0                                 2-6 W1H18260
                          LD    1 LGS-T      CHECK IF LEADING GRAPH 2-6 W1H18270
                          S     1 D0008-T    WAS RECEIVED BEFORE    2-6 W1H18280
                          BSC  I  LGCHK,+-   NO - BRANCH BACK       2-6 W1H18290
                          MDX     TIMEX      YES - ERROR            2-6 W1H18300
                    *************************************************** W1H18310
                          HDNG     SCAT2- READ RESPONSE FOR TRANSMIT    W1H18320
                    *************************************************** W1H18330
                    *             READ RESPONSE FOR TRANSMIT          * W1H18340
                    *************************************************** W1H18350
                    XMTRD LD    1 LSDLE-T                               W1H18360
                          BSC  L  TRD1,+-    BR IF LAST CHAR NOT A DLE  W1H18370
                    *                                                 * W1H18380
                          SLA     16                                    W1H18390
                          STO   1 LSDLE-T    TURN OFF LAST CHAR=DLE IND W1H18400
                          LD    1 BUF-T      CHECK FOR CORRECT ACK      W1H18410
                          EOR   1 ACK-T                                 W1H18420
                          BSC  L  EOTCK,Z    BR IF NOT CORRECT ACK      W1H18430
                          BSI     CREID      CHECK REM ID IF ANY    2-6 W1H18440
                          STO   1 RVIRD-T    CLEAR RVI READ INDR    2-6 W1H18450
                    *                                                 * W1H18460
                    MESSQ LD    1 XMESS-T    CHECK TRANSMIT MESSAGE IND W1H18470
                          BSC  L  STWT2,Z    BR TO ST WRT FOR MESSAGE   W1H18480
                    *                                                 * W1H18490
                    MESQ3 STO   1 RTBSY-T    TURN OFF ROUTINE BUSY      W1H18500
                          XIO   1 ENDOP-T   END OPERATION           2-9 W1H18505
                          XIO   1 STRED-T   INITIATE READ           2-9 W1H18506
                          XIO   1 RETIM-T    RESET TIMERS               W1H18510
                    ENQOF SLT     32                                2-6 W1H18520
                          STD   1 TOIND-T    RESET TIMEOUT   INDR   2-6 W1H18530
                    *             WRACK            WRONG ACK INDR   2-6 W1H18540
                          STO   1 IDSEQ-T    TURN OFF ID INDR       2-6 W1H18550
                          STO   1 XMENQ-T          XMIT ENQ  INDR   2-6 W1H18560
                          LDD   1 ACK-T                                 W1H18570
                          RTE     16         ALTERNATE                  W1H18580
                          STD   1 ACK-T       ACKNOWLEDGEMENTS          W1H18590
                          BSC  L  INTX       EXIT TO ILS            2-4 W1H18600
                    *                                                 * W1H18610
                    STWT2 XIO   1 SYNC-T     START WRITE WITH TIMER     W1H18620
                          LD    1 H0005-T    SET UP TO TRANSMIT     2-3 W1H18630
                          STO   1 SYN5-T      5 SYNS FOR PADDING    2-3 W1H18640
                          MDX     ENQOF      BR TO TURN OFF XMIT ENQ    W1H18650
                    *                                                 * W1H18660
                    EOTCK LD    1 BUF-T      IS BUFF=EOT                W1H18670
                          EOR   1 EOT-T                                 W1H18680
                          BSC  L  EOTN1,Z    BR IF NOT DLE EOT      2-6 W1H18690
                          BSI     LGCHK      CHECK IF LGS BEFORE    2-6 W1H18700
                          BSC  L  DISCO      NO,BR TO DISCONNECT    2-6 W1H18710
                    *                                                 * W1H18720
                    EOTN1 LDD   1 ACK-T      IS BUF EQUAL OTHER ACK     W1H18730
                          SLT     16                                    W1H18740
                          EOR   1 BUF-T                                 W1H18750
                          BSC  L  OTHER,+-   BR IF EQUAL OTHER ACK      W1H18760
                    *                                                   W1H18770
                          LD    1 BUF-T                             2-6 W1H18780
                          EOR   1 WACK-T     IS BUF = WACK          2-6 W1H18790
                          BSC  L  RVICK,Z    NO,BRANCH              2-6 W1H18800
                          BSI     LGCHK      CHECK IF LGS BEFORE    2-6 W1H18810
                          MDX  L  WACNT,1    INCRE WACKS RCVD       2-6 W1H18820
                          NOP                                       2-6 W1H18830
                          LD    1 H0001-T    NO RETRIES WHEN        2-6 W1H18840
                          STO   1 RETRY-T    WACK IS RECEIVED       2-6 W1H18850
                          MDX     REIID                             2-6 W1H18860
                    *                                                 * W1H18870
                    RVICK EOR   1 WARVI-T                           2-6 W1H18880
                          BSC  L  TIMEX,Z    BR IF NOT RVI          2-6 W1H18890
                          BSI     LGCHK      CHECK IF LGS BEFORE    2-6 W1H18900
                          LD    1 RVIRD-T    WAS RVI READ BEFORE    2-6 W1H18910
                          BSC  L  OTHER,Z    YES,BR-TREAT AS WR ACK 2-6 W1H18920
                          LD    1 RVICD-T                           2-6 W1H18930
                          STO  I  IOAR       /FFFE IN I/O AREA WC   2-6 W1H18940
                          STO   1 RVIRD-T    TURN ON RVI READ INDR  2-6 W1H18950
                          MDX     MESSQ      BR TO CONTINUE         2-6 W1H18960
                    *                                               2-6 W1H18970
                    TIMEX MDX  L  MISRV,+1   CNT MSTR INVAL SEQ RCVD2-3 W1H18980
                          NOP                                       2-3 W1H18990
                    REIID LD    1 IDSEQ-T    LOCAL ID SPECIFIED     2-6 W1H19000
                          BSC  L  NTID2,+-   BR IF NOT              2-6 W1H19010
                          LD    1 LOCID-T    REINITIALIZE           2-6 W1H19020
                          STO   1 IDPNT-T         LOCAL ID ADDRESS  2-6 W1H19030
                          LD    1 LOCLG-T    REINITIALIZE           2-6 W1H19040
                          STO   1 IDCNT-T         LOCAL ID LENGTH   2-6 W1H19050
                    *                                                 * W1H19060
                    NTID2 SLA     16                                2-6 W1H19070
                          STO   1 PADCK-T    CLEAR PAD CK INDR      2-6 W1H19080
                          LD    1 D0008-T                           2-6 W1H19090
                          STO   1 LGS-T      SET LEAD GRAPH COUNT   2-6 W1H19100
                    *                                                 * W1H19110
                          LD    1 BUF-T                             2-6 W1H19120
                          EOR   1 WACK-T     BUF = WACK             2-6 W1H19130
                          BSC  L  NWACK,Z    BR IF NOT              2-6 W1H19140
                          LD    1 WACOD-T    ERROR CODE /0080       2-6 W1H19150
                          MDX     TIME1                             2-6 W1H19160
                    NWACK LD    1 IDSEQ-T    REMOTE ID SPECIFIED    2-6 W1H19170
                          BSC  L  TIME0,+-   BR IF NO               2-6 W1H19180
                          LD    1 H0201-T    ID ERROR CODE          2-6 W1H19190
                          MDX     TIME1                             2-6 W1H19200
                    TIME0 LD    1 H0200-T    INVAL SEQ ERROR CODE   2-3 W1H19210
                    TIME1 STO   1 XMENQ-T    TURN ON TRANSMIT ENQ INDR  W1H19220
                          MDX     ERP2       GO DECRE RETRY COUNTER     W1H19230
                    *                                                 * W1H19240
                    TRD1  LD    1 BUF-T      IS BUF=DLE                 W1H19250
                          EOR   1 DLE-T                                 W1H19260
                          BSC  L  WTDL1,+-   YES, TURN ON LSDLE     2-3 W1H19270
                    *                                                 * W1H19280
                          EOR   1 DLNAK-T    IS BUF=NAK             2-3 W1H19290
                          BSC  L  NONAK,Z    BR IF NOT NAK              W1H19300
                    *                                                 * W1H19310
                          BSI     PDCHK      SET UP FOR PAD CK      2-6 W1H19320
                          BSC  L  TIMEX,Z    BR IF INVALID PAD      2-6 W1H19330
                          BSI     CREID      CHECK REM ID IF ANY    2-6 W1H19340
                    *                                                 * W1H19350
                    MESOK SLT     32                                2-6 W1H19360
                          STD   1 TOIND-T    RESET TIMEOUT   INDR   2-6 W1H19370
                    *             WRACK            WRONG ACK INDR   2-6 W1H19380
                          LD    1 XMESS-T                               W1H19390
                          BSC     +-         BR IF XMIT MESSAGE IS ON   W1H19400
                    *                                                 * W1H19410
                          STO   1 XMENQ-T    TURN OFF TRANSMIT ENQ IND  W1H19420
                          LDD     *                                 2-6 W1H19430
                          STD   1 FIRST-T    TURN ON FIRST CHAR IND 2-6 W1H19440
                    *             XMESS              XMIT MESSAGE   2-6 W1H19450
                          SLA     16                                2-4 W1H19460
                          STO   1 COUNT-T    CLEAR CHAR COUNT       2-4 W1H19470
                    *                                                 * W1H19480
                          LD    1 H0400-T    NAK RECEIVED ERROR CODE    W1H19490
                          MDX  L  RETRS,+1   CNT RETRANSMIT REQS    2-3 W1H19500
                          NOP                                       2-3 W1H19510
                    ERP2  BSI  L  ERRCK      GO DECRE RETRY COUNTER     W1H19520
                          BSC  L  DISC,+-    DISCONNECT IF A-REG IS 0   W1H19530
                          BSC  L  STWT,-     RETRY IF POSITIVE          W1H19540
                    *                                                 * W1H19550
                          LDD   1 ACK-T      ALTERNATE ACKS HERE SO     W1H19560
                          RTE     16         THAT THEY WILL NOT BE OUT  W1H19570
                          STD   1 ACK-T      OF STEP AT EXIT TO ILS TIM W1H19580
                          SLA     16                                    W1H19590
                          STO   1 XMESS-T    TURN OFF TRANSMIT MESS IND W1H19600
                          MDX     MESQ3      BR TO ACCEPT ERROR         W1H19610
                    *                                                 * W1H19620
                    NONAK EOR   1 DLE-T      IS BUF=ENQ                 W1H19630
                          BSC  L  NOTEQ,Z    BR IF NOT ENQ              W1H19640
                          BSI  L  LGCHK      CHECK IF LGS BEFORE    2-6 W1H19650
                          SLT     32                                2-6 W1H19660
                          STD   1 TOIND-T    RESET TIMEOUT   INDR   2-6 W1H19670
                    *             WRACK            WRONG ACK INDR   2-6 W1H19680
                          LD    1 XMENQ-T                               W1H19690
                          BSC  L  TIMEX,+-   BR IF XMIT ENQ NOT ON      W1H19700
                    *                                                 * W1H19710
                          LD    1 SLVMS-T                               W1H19720
                          BSC  L  E4000,+-   BR TO ERROR IF MASTER      W1H19730
                    *                                                 * W1H19740
                          LD    1 H0001-T                               W1H19750
                          STO   1 RETRY-T    SET RETRY TO ONE           W1H19760
                          LD    1 H4000-T    CONTENTION ERROR CODE      W1H19770
                          BSI  L  ERRCK      GO TELL USER               W1H19780
                          BSC  L  CLBSY,Z+   RESET AND CONTINUE     2-4 W1H19790
                    *                                                 * W1H19800
                          BSC  L  DISC       BR TO DISCONNECT           W1H19810
                    *                                                 * W1H19820
                    E4000 LD    1 H4000-T    CONTENTION ERROR CODE      W1H19830
                          BSC  L  NENQ1      GO DECRE RETRY             W1H19840
                    *                                                 * W1H19850
                    NOTEQ EOR   1 DLNQT-T    IS BUF = EOT               W1H19860
                          BSC  L  EOTRT,+-   BRANCH IF EOT          2-6 W1H19870
                          LD    1 IDSEQ-T    REMOTE ID SPECIFIED    2-6 W1H19880
                          BSC  L  RIDSP,Z    YES - BRANCH           2-6 W1H19890
                          LD    1 XMESS-T    * THIS PART OF PROGRAM 2-6 W1H19900
                          BSC  L  GRAPH,+-   * TESTS IF LEADING GRA 2-6 W1H19910
                          LD    1 XMENQ-T    * PHICS WERE RECEIVED  2-6 W1H19920
                          BSC  L  GRAPH,+-   * IN ANSWER TO A LINE  2-6 W1H19930
                          LD    1 SUBF-T     * BID ENQ              2-6 W1H19940
                          BSC  L  TIMEX,Z+   * BRANCH IF YES        2-6 W1H19950
                    *                                                 * W1H19960
                    GRAPH LD    1 BUF-T                             2-6 W1H19970
                          EOR   1 SYN-T      BUF = SYN              2-6 W1H19980
                          BSC  I  INT1,+-    YES,ACCEPT SYN IN LGS  2-6 W1H19990
                          MDX  L  LGS,-1     NO,DECR GRAPH COUNT    2-6 W1H20000
                          MDX     INTX4      EXIT IF LGS STILL POS  2-6 W1H20010
                          MDX     TIMEX      RETURN - LGS OVERFLOW  2-6 W1H20020
                    *                                                 * W1H20030
                    RIDSP BSI  L  RREID      GO CHECK REMOTE ID     2-6 W1H20040
                          MDX     TIMEX      ID ERROR               2-6 W1H20050
                    *                                                   W1H20060
                    EOTRT BSI     PDCHK      SET UP FOR PAD CHECK   2-6 W1H20070
                          BSC  L  TIMEX,Z    BR IF INVALID PAD      2-6 W1H20080
                          BSI  L  LGCHK      CHECK IF LGS BEFORE    2-6 W1H20090
                          SLT     32                                2-6 W1H20100
                          STD   1 TOIND-T    RESET TIMEOUT INDR     2-6 W1H20110
                    *             WRACK            WRONG ACK INDR   2-6 W1H20120
                          STO   1 RVIRD-T    CLEAR RVI READ INDR    2-6 W1H20130
                          BSC  L  RDEOT      BR IF CHAR IS AN EOT       W1H20140
                    *                                                   W1H20150
                    OTHER LD    1 TOIND-T    IF TIMEOUT IND ON,         W1H20160
                          BSC  L  TOION,Z    BR TO CHECK WRACK          W1H20170
                    OTHR3 LD    1 H0100-T    WRONG ACK ERROR CODE       W1H20180
                          STO   1 WRACK-T    TURN ON WRONG ACK IND      W1H20190
                          MDX     TIME1      BR TO TURN ON XMIT ENQ IND W1H20200
                    *                                                   W1H20210
                    TOION LD    1 WRACK-T    IF NOT WRONG ACK FIRST,    W1H20220
                          BSC  L  MESOK,+-   BR TO SEND MESSAGE         W1H20230
                          MDX     OTHR3      BR TO TURN ON XMENQ INDR   W1H20240
                    *************************************************** W1H20250
                          HDNG    SCAT2 - CHECK PAD AFTER EOT/NAK       W1H20260
                    *************************************************** W1H20270
                    *             SET PAD CHECK INDICATOR             * W1H20280
                    *************************************************** W1H20290
                    PDCHK DC      *-*                               2-6 W1H20300
                          LD      *                                 2-6 W1H20310
                          STO   1 PADCK-T    SET PAD CHECK INDR     2-6 W1H20320
                          MDX     INTX4      EXIT TO ILS            2-6 W1H20330
                    *************************************************** W1H20340
                    *             CHECK IF PAD WAS INVALID            * W1H20350
                    *************************************************** W1H20360
                    PDCK1 SLA     16                                2-6 W1H20370
                          STO   1 PADCK-T    RESET PAD CHECK INDR   2-6 W1H20380
                          LD    1 BUF-T                             2-6 W1H20390
                          EOR   1 HFF00-T                           2-6 W1H20400
                          SLA     4          CHECK FOR 4 1-BITS     2-6 W1H20410
                          BSC  I  PDCHK      PAD OKEY - RETURN TO   2-6 W1H20420
                    *                        EOT/NAK PROCESS WITH   2-6 W1H20430
                    *                        ZERO IN ACCUMULATOR    2-6 W1H20440
                    *************************************************** W1H20450
                          HDNG    SCAT2 - TIMEOUT FOR TRANSMIT          W1H20460
                    *************************************************** W1H20470
                    *             TIMEOUT INTERRUPT FOR TRANSMIT      * W1H20480
                    *************************************************** W1H20490
                    XMTTM LD    1 TRANS-T                               W1H20500
                          BSC  L  RECTO,+-   BR IF RECEIVE TIMEOUT      W1H20510
                    *                                                   W1H20520
                          XIO   1 TIMER-T    START TIMER                W1H20530
                          LD    1 H0002-T                               W1H20540
                          STO   1 SYN2-T     TURN ON INSERT 2 SYNS IND  W1H20550
                    INTX4 BSC  I  INT1       EXIT TO ILS                W1H20560
                    *                                                   W1H20570
                    RECTO SLA     16                                    W1H20580
                          STO   1 LSDLE-T    TURN OFF LAST CHAR = DLE   W1H20590
                          LD      *                                     W1H20600
                          STO   1 TOIND-T    TURN ON TIMEOUT IND        W1H20610
                          MDX  L  MASTO,+1   COUNT MASTER TIME OUTS 2-3 W1H20620
                          NOP                                       2-3 W1H20630
                          BSC  L  REIID      BR TO SET UP ERR CODE  2-3 W1H20640
                    *************************************************** W1H20650
                          END                                           W1H20660
