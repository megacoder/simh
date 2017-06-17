                          HDNG    SCAT3 PROLOGUE                        W1I00010
                    *************************************************** W1I00020
                    * TITLE - SCAT3                                   * W1I00030
                    * STATUS - CHANGE LEVEL 9                         * W1I00040
                    * FUNCTION/OPERATION - SCAT3 CAN PERFORM THE      * W1I00050
                    *  FOLLOWING BINARY SYNCHRONOUS FUNCTIONS IN A    * W1I00060
                    *  MULTI-POINT    ENVIRONMENT                     * W1I00070
                    *  1. TEST - SCAT3 TESTS A PROGRAMMED DEVICE RTN. * W1I00080
                    *            BUSY INDICATOR .RTBSY.  WHEN .RTBSY. * W1I00090
                    *            IS ON, SCAT3 HAS NOT YET COMPLETED   * W1I00100
                    *            THE PREVIOUS OPERATION.              * W1I00110
                    *  2. MONITOR - MONITORS THE LINE FOR THE GIVEN   * W1I00120
                    *            POLLING ADDRESS AND SELECTION ADDRESS* W1I00130
                    *            AND TRANSMITS THE APPROPRIATE        * W1I00140
                    *            NEGATIVE REPLY -NAK OR EOT-.         * W1I00150
                    *  3. ALARM - SCAT3 TURNS ON OR OFF THE AUDIBLE   * W1I00160
                    *            ALARM DEPENDING UPON THE VALUE OF    * W1I00170
                    *            DIGIT 3 OF THE CONTROL PARAMETER,    * W1I00180
                    *            ZERO - ON.                           * W1I00190
                    *  4. CLOSE - SCAT3 ENDS ALL S.C.A. OPERATIONS AND* W1I00200
                    *            RESETS SOME PROGRAM INDICATORS TO    * W1I00210
                    *            THEIR INITIAL CONDITION.             * W1I00220
                    *  5. RECEIVE INITIAL - SCAT3 MONITORS THE LINE   * W1I00230
                    *            FOR THE GIVEN SELECTION ADDRESS      * W1I00240
                    *            FOLLOWED BY ENQ, TRANSMITS ACKO, AND * W1I00250
                    *            RECEIVES THE MESSAGE.                * W1I00260
                    *  6. RECEIVE CONTINUE - SCAT3 TRANSMITS THE      * W1I00270
                    *            CORRECT POSITIVE ACKNOWLEDGEMENT     * W1I00280
                    *            (ACK0 OR ACK1) FOR THE CURRENT       * W1I00290
                    *            MESSAGE AND RECEIVES THE NEXT MESSAGE* W1I00300
                    *  7. RECEIVE REPEAT - SCAT3 TRANSMITS NAK FOR THE* W1I00310
                    *            CURRENT MESSAGE AND RECEIVES THE NEXT* W1I00320
                    *            MESSAGE.                             * W1I00330
                    *  8. TRANSMIT INITIAL BLOCK/TEXT - SCAT3 MONITORS* W1I00340
                    *            THE LINE FOR THE GIVEN POLLING       * W1I00350
                    *            ADDRESS FOLLOWED BY ENQ, TRANSMITS   * W1I00360
                    *            MESSAGE, TRANSMITS CRC-16, AND       * W1I00370
                    *            RECEIVES ACK1.                       * W1I00380
                    *  9. TRANSMIT CONTINUE BLOCK/TEXT - SCAT3        * W1I00390
                    *            TRANSMITS THE MESSAGE, TRANSMITS THE * W1I00400
                    *            CRC-16, AND RECEIVES ACKNOWLEDGEMENT.* W1I00410
                    *  10. TRANSMIT INITIAL/CONTINUE TRANSPARENT      * W1I00420
                    *            BLOCK/TEXT - SAME FUNCTION AS        * W1I00430
                    *            NON-TRANSPARENT, EXCEPT THAT SCAT3   * W1I00440
                    *            SUPPLIES THE END CHARACTERS,         * W1I00450
                    *            DLE ETB/DLE ETX.                     * W1I00460
                    *  11. TRANSMIT EOT - SCAT3 TRANSMITS EOT         * W1I00470
                    *            AND RETURNS TO THE MONITORING OPER.  * W1I00480
                    *  12. ERROR STATISTICS - SCAT3 MAINTAINS AN   2-4* W1I00490
                    *            9-WORD LOG OF ERROR STATISTICS.   2-4* W1I00500
                    *            REFER TO SRL FOR COMPLETE         2-4* W1I00510
                    *            DESCRIPTION FORM C26-3706.        2-4* W1I00520
                    *  13. LOGGING - SCAT3 PROVIDES THE POSSIBILITY2-4* W1I00530
                    *            FOR A USER-WRITTEN PROGRAM TO LOG 2-4* W1I00540
                    *            ALL CHARACTERS RECEIVED OR TRANS- 2-4* W1I00550
                    *            MITTED,TIMEOUTS AND FUNCTION CODE.2-4* W1I00560
                    *            REFER TO SRL FOR COMPLETE         2-4* W1I00570
                    *            DESCRIPTION FORM C26-3706         2-4* W1I00580
                    * ENTRY POINTS - .SCAT3. CALL ENTRANCE, LIBF SCAT3* W1I00590
                    *                .INT1.  INTERRUPT ENTRANCE, BSI  * W1I00600
                    *                        FROM ILS01               * W1I00610
                    * INPUT - UNPACKED, LEFT-JUSTIFIED DATA OR        * W1I00620
                    *            PACKED DATA. EBCDIC IF            2-4* W1I00630
                    *            NOT TRANSPARENT. REFER TO SRL FOR A  * W1I00640
                    *            COMPLETE DESCRIPTION OF THE I/O AREA,* W1I00650
                    *            FORM C26-3706.                       * W1I00660
                    * OUTPUT - SAME AS INPUT                          * W1I00670
                    * EXTERNAL ROUTINES - IOLOG                       * W1I00680
                    * EXITS-NORMAL - .RET. RETURN TO MAINLINE AT      * W1I00690
                    *            LIBF+2, LIBF+3, OR LIBF+4 DEPENDING  * W1I00700
                    *            UPON THE FUNCTION                    * W1I00710
                    *       ERROR - WORD 41-PRE-OPERATIVE ERROR HALT, * W1I00720
                    *              .USERR. BSI TO USERS ERROR ROUTINE * W1I00730
                    *            ON ALL POST-OPERATIVE ERRORS.        * W1I00740
                    * TABLES/WORK AREAS - THE MAJORITY OF CONSTANTS   * W1I00750
                    *            AND INDICATORS USED BY SCAT3 FOLLOW  * W1I00760
                    *            .T. AND ARE ACCESSED IN REFERENCE    * W1I00770
                    *            TO .T.   THE EBCDIC CONTROL CHARACTER* W1I00780
                    *            ARE LOCATED IN TABLE .EBC.           * W1I00790
                    * ATTRIBUTES - REUSABLE                           * W1I00800
                    * NOTES - SCAT3 IS AN INTERRUPT SERVICE SUBROUTINE* W1I00810
                    *            THE CALLING SEQUENCE IS AS FOLLOWS   * W1I00820
                    *                   LIBF  SCAT3                   * W1I00830
                    *                   DC    /XXXX CONTROL PARAMETER * W1I00840
                    *                   DC    IOAR  I/O AREA PARAMETER* W1I00850
                    *                   DC    ERROR ERROR RTN. PARA.  * W1I00860
                    * REFERENCE DOCUMENTS -                           * W1I00870
                    *     SRL - IBM 1130 SYNCHRONOUS COMMUNICATIONS   * W1I00880
                    *           ADAPTER SUBROUTINES  C26-3706         * W1I00890
                    *     PLM - IBM 1130 MONITOR PROGRAMMING SYSTEM   * W1I00900
                    *           PROGRAM LOGIC MANUAL                  * W1I00910
                    *               Y26-3620                          * W1I00920
                    *           IBM 1130/1800 PROGRAMMING SYSTEM      * W1I00930
                    *           PROGRAM LOGIC MANUAL                  * W1I00940
                    *               Y26-3752                          * W1I00950
                    *************************************************** W1I00960
                          HDNG    ****  SCAT3 - CALL PROCESSING  ****   W1I00970
                          LIBR                                          W1I00980
                    1130  ISS  08 SCAT3     1                           W1I00990
                    *************************************************** W1I01000
                    *             CALL ENTRANCE FOR BI-SYNC           * W1I01010
                    *             MULTI-POINT                         * W1I01020
                    *************************************************** W1I01030
                    SCAT3 STX   1 XR1+1      SAVE XR1              (+0) W1I01040
                          LDX  I1 *-*        XR1 - LIBF+1          (+2) W1I01050
                          MDX     PROC       BR TO PROCESS CALL         W1I01060
                    *************************************************** W1I01070
                    *             INTERRUPT ENTRANCE                  * W1I01080
                    *             THE INTERRUPT LEVEL SUBROUTINE FOR  * W1I01090
                    *             LEVEL 1 WILL DO A BSI TO .INT1. WHEN* W1I01100
                    *             THERE IS AN ADAPTER INTERRUPT.      * W1I01110
                    *************************************************** W1I01120
                    INT1  DC      0                                (+4) W1I01130
                          BSC  L  INT2       BR TO PROCESS INTERRUPT    W1I01140
                    *************************************************** W1I01150
                    *             THIS PORTION OF THE SCAT3 SUBROUTINE* W1I01160
                    *             WILL PROCESS THE CALLING SEQUENCE   * W1I01170
                    *************************************************** W1I01180
                    TEMP  DC      0          TEMPORARY FUNCTION CODE    W1I01190
                    AQ    BSS  E  2          FOR SAVING ACC AND EXT     W1I01200
                    PROC  STD     AQ         SAVE A,Q                   W1I01210
                          STS     STAT            STATUS                W1I01220
                          STX   2 XR2+1           XR2                   W1I01230
                          LDX  L2 T          T=BASE ADDRS OF CONSTANTS  W1I01240
                          LD    1 0          CONTROL PARAMETER          W1I01250
                          SRA     12         FUNCTION CODE              W1I01260
                          BSC  L  NTEST,Z    BR IF NOT TEST FUNCTION    W1I01270
                    *                                                 * W1I01280
                    ****                     TEST FUNCTION         **** W1I01290
                          LD    2 RTBSY-T    ROUTINE BUSY INDICATOR     W1I01300
                          BSC     +-         SKIP IF BUSY (ON)          W1I01310
                    EXIT  MDX   1 +1         NOT BUSY, RETURN TO LIBF+3 W1I01320
                    EXIT1 MDX   1 1          BUSY, RETURNN TO LIBF+2    W1I01330
                          LDD     AQ         RESTORE A,Q                W1I01340
                          STX   1 RET+1      SET UP EXIT BRANCH         W1I01350
                    STAT  LDS     0          RESTORE STATUS             W1I01360
                    XR1   LDX  L1 *-*                XR1                W1I01370
                    XR2   LDX  L2 *-*                XR2                W1I01380
                    RET   BSC  L  *-*        RETURN TO MAINLINE OR 41   W1I01390
                    *                                                 * W1I01400
                    *************************************************** W1I01410
                    NTEST A     2 H6FFF-T    SET UP MDX TO FUNCTION     W1I01420
                          STO     MDX1            TYPE 1-3              W1I01430
                          S     2 H7007-T                           2-4 W1I01440
                          BSC  L  ER1,Z-     BR IF BAD FUNCTION CODE    W1I01450
                    *                                                 * W1I01460
                          BSC  L  SUPAD,+-   BR IF TABLE ADDR REQ   2-4 W1I01470
                          STO     TEMP       SAVE FOR USE AFTER BUSY    W1I01480
                          LD    1 0          PICK UP CONTROL PARAM  2-4 W1I01490
                          CALL    CPLOG      LOG CONTROL PARAMETER  2-4 W1I01500
                    *                                                 * W1I01510
                    MDX1  MDX     MDX1       MODIFIED BY FUNCTION CODE  W1I01520
                          MDX     TEST       MONITOR        CODE 1      W1I01530
                          MDX     ALARM      ALARM          CODE 2      W1I01540
                          MDX     CLOSE      CLOSE          CODE 3      W1I01550
                          BSC     +-Z        FALL THROUGH ON            W1I01560
                          BSC     +-Z             CODES 4,5,6,7         W1I01570
                          NOP                                           W1I01580
                          MDX     TEST                              2-3 W1I01590
                    *************************************************** W1I01600
                    *             AUDIBLE ALARM                       * W1I01610
                    *************************************************** W1I01620
                    ALARM AND   2 H00F0-T    PARAMETER FOR ON/OFF   2-4 W1I01630
                          BSC  L  OFF,Z      BR IF OFF REQUESTED        W1I01640
                          XIO   2 ALON-T     TURN ON ALARM          2-3 W1I01650
                          MDX     EXIT1      BR TO RESTORE AND EXIT     W1I01660
                    *                                                 * W1I01670
                    OFF   XIO   2 ALOFF-T    TURN OFF ALARM         2-3 W1I01680
                          MDX     EXIT1      BR TO RESTORE AND EXIT     W1I01690
                    *************************************************** W1I01700
                    *             CLOSE - END OPERATION               * W1I01710
                    *************************************************** W1I01720
                    CLOSE LD    2 MNBSY-T    LOOP IF RTN IS BUSY    2-5 W1I01730
                          BSC  L  CLOSE,Z     IN MONITOR MODE       2-5 W1I01740
                          XIO   2 ENDOP-T    END SCA OPERATION      2-3 W1I01750
                          LD    2 WD17I-T    IF WD 17 INDR NOT ON   2-4 W1I01760
                          BSC  L  *+3,+-     DO NOT DECREE IOCS CTR     W1I01770
                          MDX  L  $SCAT,-1   DECREMENT IOCS CTR     2-4 W1I01780
                          NOP                                           W1I01790
                          LDX   2 27                                2-7 W1I01800
                          SLA     16                                    W1I01810
                          STO  L2 TAB4-1     RESET INDICATORS           W1I01820
                          MDX   2 -1                                    W1I01830
                          MDX     *-4                                   W1I01840
                          MDX     EXIT1      BR TO RESTORE AND EXIT     W1I01850
                    *************************************************** W1I01860
                    TEST  LD    2 RTBSY-T                               W1I01870
                          BSC  L  TEST,Z     LOOP IF RTN IS BUSY        W1I01880
                    TEST1 LD    2 MNBSY-T    LOOP IF RTN IS BUSY    2-5 W1I01890
                          BSC  L  TEST1,Z     IN MONITOR MODE       2-5 W1I01900
                          STO   2 TRANS-T    RESET TRANS INDR       2-2 W1I01910
                          STO   2 PACK-T     RESET PACKED DATA INDR 2-4 W1I01920
                          LD    2 D0008-T                           2-6 W1I01930
                          STO   2 LGS-T      SET LEAD GRAPH COUNT   2-6 W1I01940
                          XIO   2 ENDOP-T    END SCA OPERATION      2-5 W1I01950
                    *                                                 * W1I01960
                          LD      TEMP                                  W1I01970
                          A     2 H0002-T    SET UP TBTX AND FCODE      W1I01980
                          A     2 H0001-T                           2-4 W1I01990
                          STO   2 TBTX-T     ZERO-BLOCK, ONE-TEXT       W1I02000
                          BSC  L  XCODE,-    BR IF TRANSMIT FUNCTION    W1I02010
                          STO   2 FCODE-T    FCODE NEGATIVE FOR RECEIVE W1I02020
                          A     2 H0001-T                           2-3 W1I02030
                          BSC  L  REC1,+-    BR IF RECEIVE FUNCTION     W1I02040
                    *                                                 * W1I02050
                          SLA     16         FOR MONITOR FUNCTION,      W1I02060
                          MDX     REC        GO SET FCODE ZERO          W1I02070
                    *                                                 * W1I02080
                    XCODE SRA     1                                     W1I02090
                          BSC  L  XBLTX,+-   BR IF XMIT BLOCK/TEXT      W1I02100
                          SLA     15                                    W1I02110
                          STO   2 TBTX-T     TBTX NEGATIVE FOR EOT      W1I02120
                    XBLTX LD      XCODE      MAKE ACC POSITIVE          W1I02130
                    REC   STO   2 FCODE-T    NEG-RCV, ZERO- MONITOR,    W1I02140
                    *                         POSITIVE- TRANSMIT      * W1I02150
                    *                                                 * W1I02160
                    REC1  XIO   2 LOAD-T     SYN INTO SYNC/IDLE REG     W1I02170
                          LD    2 D0008-T                               W1I02180
                          STO   2 RETRY-T    SET READY COUNTER TO 8     W1I02190
                          SLA     16         TURN OFF                   W1I02200
                          STO   2 LSDLE-T    LAST CHAR= DLE INDICATOR   W1I02210
                          LD    2 FCODE-T                               W1I02220
                          BSC  L  MONCL,+-   BR IF MONITOR              W1I02230
                    *                                                 * W1I02240
                          LD    1 1                                     W1I02250
                          STO   2 IOAR-T     SAVE I/O AREA ADDRESS      W1I02260
                          LD    1 2                                     W1I02270
                          STO   2 USERR-T    SAVE ERROR RTN. ADDRESS    W1I02280
                    *                                                 * W1I02290
                          LD    2 FCODE-T                               W1I02300
                          BSC  L  NOXM1,+    BR IF NOT TRANSMIT         W1I02310
                    *                                                   W1I02320
                          LD    2 TBTX-T                                W1I02330
                          BSC  L  XEND,+Z    BR IF TRANSMIT EOT         W1I02340
                    *                                                   W1I02350
                    NOXM1 LD    1 0          SAVE SUB-FUNCTION CODE     W1I02360
                          AND   2 H0F00-T         NEG - INITIAL         W1I02370
                          S     2 H0300-T                           2-4 W1I02380
                          BSC  L  D2OK1,Z+   BR IF CODE LESS THAN 3 2-4 W1I02390
                    *                                                 * W1I02400
                          BSC  L  D2OK2,+    BR IF CODE EQUAL TO 3  2-4 W1I02410
                          S     2 H0100-T                           2-4 W1I02420
                          BSC  L  SETPK,+    BR IF CODE EQUAL TO 4  2-4 W1I02430
                          S     2 H0100-T                           2-4 W1I02440
                          BSC  L  ER1,Z      BR IF CODE GT 5        2-4 W1I02450
                          LD    2 FCODE-T                           2-4 W1I02460
                          BSC  L  ER1,-      BR IF FUNC NOT RECEIVE 2-4 W1I02470
                          LD    2 H0200-T    SET CODE TO READ REPEAT2-4 W1I02480
                          MDX     SETPK+1                           2-4 W1I02490
                    *                                                 * W1I02500
                    D2OK1 A     2 H0300-T    ADJUST CODE            2-4 W1I02510
                          MDX     D2OK3                             2-4 W1I02520
                    D2OK2 LD      *          SET PACKED DATA        2-4 W1I02530
                          STO   2 PACK-T      INDR                  2-4 W1I02540
                          SLA     16         SET CODE TO INITIAL    2-4 W1I02550
                          MDX     D2OK3                             2-4 W1I02560
                    SETPK A     2 H0100-T    ADJUST CODE            2-4 W1I02570
                          STO   2 PACK-T     SET PACKED DATA INDR   2-4 W1I02580
                    *                                                 * W1I02590
                    D2OK3 S     2 H0100-T         ZERO - CONTINUE   2-4 W1I02600
                          STO   2 SUBF-T          POS - REPEAT      2-4 W1I02610
                          BSC  L  D2OK,+     BR IF CODE IS ZERO OR ONE  W1I02620
                          S     2 H0100-T                               W1I02630
                          BSC  L  ER1,Z      BR IF CODE GREATER THAN 2  W1I02640
                          LD    2 FCODE-T                               W1I02650
                          BSC  L  ER1,-      BR IF FUNCTION NOT RECEIVE W1I02660
                    *                                                 * W1I02670
                    *************************************************** W1I02680
                    *             ALL EXCEPT MONITOR AND TRANSMIT EOT * W1I02690
                    *************************************************** W1I02700
                    D2OK  LD   I  IOAR                                  W1I02710
                          BSC  L  ER1,+      BR IF WORD COUNT INVALID   W1I02720
                          STO   2 WDCNT-T    SAVE WORD COUNT            W1I02730
                          STO   2 FIRST-T    TURN ON FIRST CHAR. IND.   W1I02740
                          SLA     16                                2-4 W1I02750
                          STO   2 COUNT-T    CLEAR COUNT FIELD      2-4 W1I02760
                    *                                                 * W1I02770
                          LD    2 SUBF-T                                W1I02780
                          BSC  L  NOT1,-     BR IF NOT INITIAL          W1I02790
                    *                                                 * W1I02800
                    *************************************************** W1I02810
                    *             INITIAL                             * W1I02820
                    *************************************************** W1I02830
                          LDD   2 ACKS-T     INITIALIZE ALTERNATING     W1I02840
                          STD   2 ACK-T      ACKNOWLEDGEMENT TO ACK0    W1I02850
                          STO   2 MONIT-T    TURN ON MONITOR IND.       W1I02860
                    *                                                 * W1I02870
                          LD    2 FCODE-T                               W1I02880
                          BSC  L  SETMN,+Z   BR IF RECEIVE              W1I02890
                    *                                                   W1I02900
                          LDD   2 ACK-T      FIRST ACK TO BE            W1I02910
                          RTE     16         RECEIVED IS ACK1           W1I02920
                          STD   2 ACK-T      TO FIRST RECORD            W1I02930
                          MDX     NTRCV                                 W1I02940
                    *************************************************** W1I02950
                    *             RECEIVE INITIAL                     * W1I02960
                    *************************************************** W1I02970
                    SETMN LD      *                                     W1I02980
                          STO   2 RTBSY-T    TURN ON ROUTINE BUSY IND.  W1I02990
                          MDX     STMON      BR TO START MONITORING     W1I03000
                    *************************************************** W1I03010
                    *             EXIT                                * W1I03020
                    *************************************************** W1I03030
                    EXT   LD      *                                     W1I03040
                          STO   2 RTBSY-T    TURN ON ROUTINE BUSY IND.  W1I03050
                    EXTP2 LD    2 WD17I-T    IF WORD 17 INDR IS ON  2-4 W1I03060
                          BSC  L  NO50,Z     DO NOT INCRE IOCS CNT      W1I03070
                          LD      *                                     W1I03080
                          STO   2 WD17I-T    TURN ON WD 17 INDR     2-4 W1I03090
                          MDX  L  $SCAT,+1   INCREMENT IOCS CTR     2-4 W1I03100
                    $SCAT EQU     17         IOCS CTR IS IN WORD 17 2-4 W1I03110
                    NO50  LD    2 FCODE-T                               W1I03120
                          BSC  L  NOXM2,+    BR IF NOT TRANSMIT         W1I03130
                    *                                                   W1I03140
                          LD    2 TBTX-T                                W1I03150
                          BSC  L  EXIT+1,+Z  BR IF TRANSMIT EOT         W1I03160
                    *                                                   W1I03170
                    NOXM2 MDX   1 3          SET EXIT TO LIBF+4         W1I03180
                          BSC  L  EXIT+2     BR TO RESTORE AND EXIT 2-3 W1I03190
                    *************************************************** W1I03200
                    *             NOT INITIAL                         * W1I03210
                    *************************************************** W1I03220
                    NOT1  LD    2 FCODE-T                               W1I03230
                          BSC  L  RCV,+      BR IF FUNCITON IS RECEIVE  W1I03240
                    *************************************************** W1I03250
                    *             TRANSMIT INITIAL AND CONTINUE       * W1I03260
                    *             CHECK IF SOH,STX OR DLE STX      2-3* W1I03270
                    *             START CHARS, OTHERWISE           2-3* W1I03280
                    *             GO TO PRE-OP ERROR               2-3* W1I03290
                    *************************************************** W1I03300
                    NTRCV STO   2 XMESS-T    TURN ON XMIT MESSAGE IND.  W1I03310
                          LD    2 IOAR-T                            2-3 W1I03320
                          A     2 H0001-T                           2-3 W1I03330
                          STO   2 POINT-T                           2-3 W1I03340
                          LD   I  POINT      LOAD START CHAR        2-4 W1I03350
                          AND   2 HFF00-T                           2-4 W1I03360
                          EOR   2 SOH-T                             2-3 W1I03370
                          BSC  L  TMT,+-     BR IF SOH              2-3 W1I03380
                    *                                                 * W1I03390
                          EOR   2 DLSOH-T                           2-3 W1I03400
                          BSC  L  TMT3,+-    BR IF DLE              2-4 W1I03410
                    TMT1  LD   I  POINT                             2-4 W1I03420
                          AND   2 HFF00-T                           2-4 W1I03430
                    TMT2  EOR   2 STX-T                             2-4 W1I03440
                          BSC  L  TMT,+-     BR IF STX              2-3 W1I03450
                          LD    2 H8001-T                               W1I03458
                          A     2 H0001-T    DISPLAY ERROR /8002    2-7 W1I03459
                          MDX     ER11       GO TO PREOPRATIVE ERR  2-3 W1I03460
                    *                                                 * W1I03470
                    TMT3  LD    2 PACK-T                            2-4 W1I03480
                          BSC  L  TMT4,Z     BR IF PACKED DATA      2-4 W1I03490
                          LD    2 POINT-T                           2-4 W1I03500
                          A     2 H0001-T                           2-3 W1I03510
                          STO   2 POINT-T                           2-3 W1I03520
                          MDX     TMT1                              2-3 W1I03530
                    TMT4  LD   I  POINT                             2-4 W1I03540
                          SLA     8                                 2-4 W1I03550
                          MDX     TMT2                              2-4 W1I03560
                    *                                                 * W1I03570
                    TMT   STO   2 SYN2-T     TURN OFF SYN INSERT INDR   W1I03580
                          LD    1 0                                     W1I03590
                          SLA     12         DIGIT 4 - ZERO-NORMAL      W1I03600
                          STO   2 TEXTM-T       NON-ZERO -TRANSPARENT   W1I03610
                          LD    2 SUBF-T                                W1I03620
                          BSC  L  SETMN,+Z   BR IF INITIAL, SET MONITOR W1I03630
                    *                                                   W1I03640
                          MDX     SYNC1      BR TO BEGIN I/O OPERATION  W1I03650
                    *************************************************** W1I03660
                    *             RECEIVE CONTINUE OR REPEAT          * W1I03670
                    *************************************************** W1I03680
                    RCV   LD      SUBF       SUB-FUNCTION CODE          W1I03690
                          BSC     -Z           POSITIVE MEANS REPEAT    W1I03700
                          STO   2 XNAK-T     TURN ON XMIT NAK IND.      W1I03710
                    *************************************************** W1I03720
                    *             ALL EXCEPT MONITOR, RECEIVE INITIAL,* W1I03730
                    *             AND TRANSMIT INITIAL                * W1I03740
                    *************************************************** W1I03750
                    SYNC1 XIO     SYNC       WRITE WITH TIMEOUTS        W1I03760
                          LD      H0005      SET UP TO TRANSMIT 5   2-3 W1I03770
                          STO     SYN5        SYNS FOR PADDING      2-3 W1I03780
                          MDX     EXT        BR TO SET RTN. BUSY ON     W1I03790
                    *                                                 * W1I03800
                    *************************************************** W1I03810
                    *             TRANSMIT EOT                        * W1I03820
                    *************************************************** W1I03830
                    XEND  SLA     16                                2-6 W1I03840
                          STO   2 RVIRD-T    RESET RVI INDR         2-6 W1I03850
                          MDX     SYNC1      BR TO BEGIN I/O OPERATION  W1I03860
                    *************************************************** W1I03870
                    *             MONITOR                             * W1I03880
                    *************************************************** W1I03890
                    MONCL LD   I1 1                                     W1I03900
                          AND     HFF00                                 W1I03910
                          STO     POLLA      POLLING ADDRESS            W1I03920
                          LD    1 1                                     W1I03930
                          A     2 H0001-T                           2-3 W1I03940
                          STO  L  POLLI      ADDRS FOR POLLING IND.     W1I03950
                    *                                                 * W1I03960
                          LD   I1 2                                     W1I03970
                          AND     HFF00                                 W1I03980
                          STO     SELA       SELECTION ADDRESS          W1I03990
                          LD    1 2                                     W1I04000
                          A     2 H0001-T                           2-3 W1I04010
                          STO  L  SELI       ADDRS FOR SELECTION IND.   W1I04020
                    *                                                 * W1I04030
                    STMON SLT     32                                2-7 W1I04040
                          STD     XEOT       TURN OFF XMIT EOT INDR 2-7 W1I04050
                    *             XNAK       TURN OFF XMIT NAK INDR 2-7 W1I04060
                          STD     CMODE      RESET CONTROL MODE IND 2-7 W1I04070
                    *             MNBSY      RESET MONITOR BUSY IND 2-7 W1I04080
                          XIO     STRED      START READ                 W1I04090
                          XIO     RETIM      RESET TIMERS               W1I04100
                          MDX     EXT+2      EXIT WITHOUT RTN BUSY ON   W1I04110
                    *************************************************** W1I04120
                    *                PRE-OPERATIVE ERROR              * W1I04130
                    *************************************************** W1I04140
                    ER1   LD      H8001      ERROR IN CALLING SEQUENCE  W1I04150
                    ER11  MDX   1 -1                                    W1I04160
                          STX  L1 $PRET      ADDR OF LIBF INTO 40       W1I04170
                          LDX   1 $PRET+1    SYSTEM HALT IS AT 41       W1I04180
                    $PRET EQU     40         PRE-OPERATIVE ERROR TRAP   W1I04190
                          BSC  L  STAT-1     BR TO RESTORE AND EXIT     W1I04200
                    *************************************************** W1I04210
                    SUPAD LD      TABCT      GET STAT. TABLE ADDR   2-4 W1I04220
                          STO  I1 +1         PUT IN LOC PER CALL    2-4 W1I04230
                          BSC  L  EXIT                              2-4 W1I04240
                          HDNG    SCAT3- CALL PROCESSING SUMMARY        W1I04250
                    *************************************************** W1I04260
                    *                                                 * W1I04270
                    *  AT THE COMPLETION OF CALL PROCESSING, THE      * W1I04280
                    *  FOLLOWING INDICATORS HAVE BEEN SET FOR RECEIVE,* W1I04290
                    *  TRANSMIT T/B, TRANSMIT EOT, MONITOR            * W1I04300
                    *                  .FCODE. - NEGATIVE/RECEIVE     * W1I04310
                    *                          - ZERO/MONITOR         * W1I04320
                    *                          - POSITIVE/TRANSMIT    * W1I04330
                    *                  .RETRY. - 8                    * W1I04340
                    *                  SYNC REG- SYN                  * W1I04350
                    *                  .LSDLE. - ZERO  OFF            * W1I04360
                    *    FOR ALL EXCEPT MONITOR                       * W1I04370
                    *                  .IOAR.  - I/O AREA ADDRS       * W1I04380
                    *                  .USERR. - USER ERROR RTN ADDRS * W1I04390
                    *                  .SUBF.  - NEGATIVE/INITIAL     * W1I04400
                    *                          - ZERO/CONTINUE        * W1I04410
                    *                          - POSITIVE/REPEAT      * W1I04420
                    *                  .RTBSY. - NON-ZERO   ON        * W1I04430
                    *    FOR ALL EXCEPT TRANSMIT EOT AND MONITOR      * W1I04440
                    *                  .WDCNT. - AS SPECIFIED BY USER * W1I04450
                    *                  .FIRST. - POSITIVE   ON        * W1I04460
                    *       FOR ALL INITIAL                           * W1I04470
                    *                  .ACK.   - ACK0/ACK1            * W1I04480
                    *                  .XMENQ. - NON-ZERO   ON        * W1I04490
                    *       FOR TRANSMIT INITIAL/CONTINUE/EOT         * W1I04500
                    *                  .TBTX.  - ZERO/BLOCK           * W1I04510
                    *                          - POSITIVE/TEXT        * W1I04520
                    *                          - NEGATIVE/EOT         * W1I04530
                    *                  .TEXTM. - ZERO/NORMAL          * W1I04540
                    *                          - NON-ZERO/TRANSPARENT * W1I04550
                    *                  .XMESS. - NON-ZERO   ON        * W1I04560
                    *                  .SYN2.  - ZERO       OFF       * W1I04570
                    *       FOR RECEIVE INITIAL, TRANSMIT INITIAL     * W1I04580
                    *                  .MONIT. - NON-ZERO   ON        * W1I04590
                    *                  .XEOT.  - ZERO       OFF       * W1I04600
                    *                  .XNAK.  - ZERO       OFF       * W1I04610
                    *                  .CMODE. - ZERO       OFF       * W1I04620
                    *       RECEIVE REPEAT                            * W1I04630
                    *                  .XNAK.  - POSITIVE   ON        * W1I04640
                    *       TRANSMIT EOT                              * W1I04650
                    *                  .ACK.   - ACK0/ACK1            * W1I04660
                    *       MONITOR                                   * W1I04670
                    *                  .POLLA. - GIVEN POLLING ADDRS. * W1I04680
                    *                  .POLLI. - ADDRS FOR POLLING IND* W1I04690
                    *                  .SELA.  - GIVEN SELECTION ADDRS* W1I04700
                    *                  .SELI.  - ADDRS FOR SELECT. IND* W1I04710
                    *                  .XEOT.  - ZERO       OFF       * W1I04720
                    *                  .XNAK.  - ZERO       OFF       * W1I04730
                    *                  .CMODE. - ZERO       OFF       * W1I04740
                    *                                                 * W1I04750
                    *     AN XIO START READ IS ISSUED FOR MONITOR,    * W1I04760
                    *     RECEIVE INITIAL, AND TRANSMIT INITIAL BEFORE* W1I04770
                    *     RETURN TO LIBF+4                            * W1I04780
                    *                                                 * W1I04790
                    *     AN XIO SYNC IS ISSUED FOR RECEIVE CONTINUE/ * W1I04800
                    *     REPEAT, TRANSMIT CONTINUE, AND TRANSMIT EOT * W1I04810
                    *     BEFORE RETURN TO LIBF+4                     * W1I04820
                    *                                                 * W1I04830
                    *************************************************** W1I04840
                          HDNG     SCAT3 -  CONSTANTS, INDICATORS       W1I04850
                    *************************************************** W1I04860
                    *     CONSTANTS, INDICATORS, TEMPORARY STORAGE    * W1I04870
                    *************************************************** W1I04880
                    T     BSS  E  0     START OF IND, CONSTANTS         W1I04890
                    H6FFF DC      /6FFF      FOR MODIFYING MDX          W1I04900
                    H7007 DC      /7007      MAXIMUM MDX            2-4 W1I04910
                    ALON  DC      /0002      TURN ON ALARM              W1I04920
                          DC      /5102           IOCC                  W1I04930
                    H0002 EQU     ALON       CONSTANT 2                 W1I04940
                    ALOFF DC      /00F0      TURN OFF ALARM             W1I04950
                          DC      /5101           IOCC                  W1I04960
                    H00F0 EQU     ALOFF      TO ISOLATE DIGIT 3         W1I04970
                    ENDOP DC      /0F00      END OPERATION              W1I04980
                          DC      /5404           IOCC                  W1I04990
                    H0F00 EQU     ENDOP      TO ISOLATE DIGIT 2         W1I05000
                    LOAD  DC      SYN        LOAD SYN INTO SYNC REG     W1I05010
                          DC      /5104           IOCC                  W1I05020
                    ACK   DC      0          CURRENT ACK                W1I05030
                          DC      0          NEXT ACK                   W1I05040
                    SENSR DC      0          SENSE AND RESET DSW        W1I05050
                          DC      /5701           IOCC                  W1I05060
                    USERR EQU     SENSR      USER ERROR RTN. ADDRESS    W1I05070
                    STRED DC      /0100      START READ                 W1I05080
                          DC      /5600           IOCC                  W1I05090
                    H0100 EQU     STRED      CONSTANT /0100             W1I05100
                    READ  DC      BUF        READ                       W1I05110
                          DC      /5200           IOCC                  W1I05120
                    SYNC  DC      /FFFF      START WRITE WITH TIMEOUT   W1I05130
                          DC      /5410           IOCC                  W1I05140
                    WTEOT DC      EOT        WRITE EOT CHARACTER        W1I05150
                          DC      /5100           IOCC                  W1I05160
                    WTSYN DC      SYN        WRITE SYN CHARACTER        W1I05170
                          DC      /5100           IOCC                  W1I05180
                    WTDLE DC      DLE        WRITE DLE CHARACTER        W1I05190
                          DC      /5100           IOCC                  W1I05200
                    LDDLE DC      DLE        LOAD DLE INTO SYNC REG     W1I05210
                          DC      /5104           IOCC                  W1I05220
                    WTBUF DC      BUF        WRITE CHARACTER            W1I05230
                          DC      /5100           IOCC                  W1I05240
                    TIMER DC      /0A00      START/STOP TIMER           W1I05250
                          DC      /5420           IOCC                  W1I05260
                    RETIM DC      +5         RESET TIMERS           2-3 W1I05270
                          DC      /5702           IOCC                  W1I05280
                    H0005 EQU     RETIM      5 FOR PRECEEDING SYNS  2-3 W1I05290
                    *************************************************** W1I05300
                    EBC   BSS     0          EBCDIC CONTROL CHARACTERS  W1I05310
                    ACKS  DC      /7000      INITIALIZED          ACK0  W1I05320
                          DC      /6100        ACKNOWLEDGEMENTS   ACK1  W1I05330
                    SYN   DC      /3200      SYNCHRONOUS IDLE           W1I05340
                    DLE   DC      /1000      DATA LINK ESCAPE           W1I05350
                    NAK   DC      /3D00      NEGATIVE ACKNOWLEDGEMENT   W1I05360
                    ENQ   DC      /2D00      ENQUIRY CHARACTER          W1I05370
                    SOH   DC      /0100      START OF HEADING           W1I05380
                    STX   DC      /0200      START OF TEXT              W1I05390
                    ITB   DC      /1F00      INTERMEDIATE BLOCK CHECK   W1I05400
                    ETB   DC      /2600      END OF BLOCK               W1I05410
                    ETX   DC      /0300      END OF TEXT                W1I05420
                    EOT   DC      /3700      END OF TRANSMISSION        W1I05430
                    PAD   DC      /FF00      PAD CHARACTER          2-3 W1I05440
                    WACK  DC      /6B00      WACK                   2-6 W1I05450
                    HFF00 EQU     PAD        TO ISOLATE 1 CHARACTER 2-3 W1I05460
                    H1000 EQU     DLE        I/O AREA OVERFLOW CODE 2-3 W1I05470
                    H0200 EQU     STX        INVAL CONTROL SEQ ERR  2-3 W1I05480
                    H0300 EQU     ETX        CONSTANT /0300         2-4 W1I05490
                    RVICD DC      /FFFE      -2 FOR I/O AREA IF RVI 2-6 W1I05500
                    *************************************************** W1I05510
                    SYNDL DC      /2200      SYN AND DLE  EOR           W1I05520
                    ETBTX DC      /2500      ETB AND ETX  EOR           W1I05530
                    EQET  DC      /1A00      ENQ AND EOT    EOR         W1I05540
                    DLSOH DC      /1100      DLE AND SOH    EOR         W1I05550
                    STXEQ DC      /2F00      STX AND ENQ    EOR         W1I05560
                    WARVI DC      /1700      WACK AND RVI    EOR    2-6 W1I05570
                    DLSHX EQU     ETX        DLE, SOH AND STX EOR   2-3 W1I05580
                    DLNAK EQU     ENQ        DLE AND NAK EOR        2-3 W1I05590
                    BUF   DC      0          BUFFER FOR TRANSMIT/RCV    W1I05600
                    DSW   DC      0          SAVED DEVICE STATUS WORD   W1I05610
                    TBTX  DC      0          BLOCK OR TEXT              W1I05620
                    RETRY DC      0          RETRY COUNTER              W1I05630
                    IOAR  DC      0          I/O AREA ADDRESS           W1I05640
                    WDCNT DC      0          WORD COUNT                 W1I05650
                    SUBF  DC      0          INITIAL, CONTINUE, REPEAT  W1I05660
                    TEXTM DC      0          NORMAL OR TRANSPARENT      W1I05670
                    COUNT DC      0          COUNTER FOR WORDS          W1I05680
                    POINT DC      0          I/O AREA POINTER           W1I05690
                    BCCR  DC      0          BCC RECEIVED               W1I05700
                    SYN5  DC      0          NUMBER OF SYNS TO WRITE2-3 W1I05710
                    POLLA DC      0          POLLING ADDRESS       XX00 W1I05720
                    SELA  DC      0          SELECTION ADDRESS     XX00 W1I05730
                    PACK  DC      0          PACKED DATA INDR       2-4 W1I05740
                    NXTPD DC      0          PAD CHAR INDR          2-3 W1I05750
                    LGS   DC      0          LEAD GRAPHICS COUNT    2-6 W1I05760
                    H8001 DC      /8001      ERR CODE FOR BAD CALL SEQ. W1I05780
                    D0008 DC      +8         CONSTANT +8                W1I05790
                    H0007 DC      7          CONSTANT +7            2-6 W1I05800
                    H0080 DC      /0080      WACK ERROR CODE            W1I05805
                    H0400 DC      /0400      NAK ERROR CODE         2-6 W1I05806
                    H0800 DC      /0800      BCC ERROR CODE             W1I05810
                    H0001 DC      /0001      CONSTANT 1 FOR INCREMENTS  W1I05820
                    H2000 DC      /2000      TIMEOUT ERROR CODE FOR RCV W1I05830
                    *************************************************** W1I05840
                    TAB4  BSS  E  0     START OF IND CLEARED BY CLOSE   W1I05850
                    TOIND DC      0          TIMEOUT         INDR       W1I05860
                    WRACK DC      0          WRONG ACK       INDR       W1I05870
                    *                                                   W1I05875
                    RTBSY DC      0          ROUTINE BUSY    INDR       W1I05880
                    XMENQ DC      0          XMIT/MON ENQ    INDR       W1I05890
                    *                                                   W1I05895
                    XEOT  DC      0          XMIT EOT        INDR       W1I05900
                    XNAK  DC      0          XMIT NAK        INDR       W1I05910
                    *                                                   W1I05915
                    CMODE DC      0          CONTROL MODE    INDR       W1I05920
                    MNBSY DC      0          MONITOR BUSY    INDR       W1I05930
                    *                                                   W1I05935
                    TRANS DC      0          TRANSPARENT/BCC INDR       W1I05940
                    BCC1  DC      0          FIRST BCC       INDR       W1I05950
                    *                                                   W1I05955
                    ITBRD DC      0          ITB READ/BCC    INDR   2-6 W1I05960
                    BCCA  DC      0          BCC ACCUMULATED            W1I05970
                    *                                                   W1I05975
                    LSDLE DC      0          LAST CHAR DLE   INDR       W1I05980
                    SYN2  DC      0          INSERT 2 SYNS   INDR       W1I05990
                    *                                                   W1I05995
                    ITBER DC      0          ITB BCC ERROR   INDR   2-6 W1I06000
                    PADCK DC      0          PAD CHECK       INDR   2-6 W1I06010
                    *                                                   W1I06015
                    XMESS DC      0          XMIT MESSAGE    INDR       W1I06020
                    FIRST DC      0          FIRST CHARACTER INDR       W1I06030
                    *                                                   W1I06035
                    MONIT DC      0          MONITOR INDR FOR INITIALS  W1I06040
                    FCODE DC      0          RCV, XMIT, OR MONITOR      W1I06050
                    STXIN DC      0          STX             INDR       W1I06060
                    OVFLO DC      0          I/O OVERFLOW    INDR       W1I06070
                    BCC2  DC      0          SECOND BCC      INDR       W1I06080
                    TEND  DC      0          XMIT ETB/ETX    INDR       W1I06090
                    DLSTX DC      0          DLE STX         INDR       W1I06100
                    WD17I DC      0          SCAT COUNTER    INDR   2-4 W1I06110
                    RVIRD DC      0          RVI READ        INDR   2-6 W1I06111
                    *************************************************** W1I06120
                    TABCT DC      BCCER      ERR STATISTICS TBL ADDR2-4 W1I06130
                    BCCER DC      *-*        CRC-16 ERRORS          2-4 W1I06140
                    RETRS DC      *-*        RETRANSMISSION REQUESTS2-4 W1I06150
                    MASTO DC      *-*        MASTER RCV TIME-OUTS   2-4 W1I06160
                    SLVTO DC      *-*        SLAVE RCV TIME-OUTS    2-4 W1I06170
                    XMCHK DC      *-*        TRANSMIT CHECK ERRORS  2-4 W1I06180
                    RMCHK DC      *-*        RECEIVE CHECK ERRORS   2-4 W1I06190
                    MISRV DC      *-*        INVAL SEQ RCVD AS MSTR 2-4 W1I06200
                    SISRV DC      *-*        INVAL SEQ RCVD AS SLAVE2-4 W1I06210
                    TTDCT DC      *-*        TEMP TEXT DELAY COUNT  2-6 W1I06220
                    WACNT DC      *-*        WACKS RECEIVED         2-6 W1I06230
                    MONTO DC      *-*        MONITOR TIME-OUTS      2-4 W1I06240
                          HDNG    ***  SCAT3 - INTERRUPT PROCESSING *** W1I06250
                    *************************************************** W1I06260
                    *             INTERRUPT PROCESSING                * W1I06270
                    *************************************************** W1I06280
                    *               THE DEVICE STATUS WORD            * W1I06290
                    *                   BIT 0 - READ RESPONSE         * W1I06300
                    *                   BIT 1 - WRITE RESPONSE        * W1I06310
                    *                   BIT 2 - CHECK                 * W1I06320
                    *                   BIT 3 - TIMEOUT               * W1I06330
                    *                   BIT 4 - AUTO ANSWER REQUEST   * W1I06340
                    *                   BIT 5 - BUSY                  * W1I06350
                    *                   BIT 6 - ENABLED               * W1I06360
                    *                   BIT 7 - READY                 * W1I06370
                    *                   BIT 8 - RECEIVE RUN           * W1I06380
                    *************************************************** W1I06390
                    INT2  XIO     SENSR      SENSE AND RESET DSW        W1I06400
                          STO     DSW        SAVE DSW                   W1I06410
                          STO  L  $PAUS      SET $PAUS              2-4 W1I06420
                    $PAUS EQU     240        $PAUS IS IN WORD 240   2-4 W1I06430
                          LDX  L1 T          CONSTANT TABLE ADDRESS     W1I06440
                          SLA     7                                     W1I06450
                          BSC  L  NTRDY,-    BR IF NOT READY            W1I06460
                          LD      DSW                                   W1I06470
                          BSC  L  READI,+Z   BR IF READ RESPONSE        W1I06480
                          SLA     1                                     W1I06490
                          BSC  L  TIMEI,-    BR IF NOT WRITE RESPONSE   W1I06500
                    *************************************************** W1I06510
                    *                   WRITE RESPONSE                * W1I06520
                    *************************************************** W1I06530
                          SLA     1                                 2-4 W1I06540
                          BSC  L  NWRCH,-    BR IF NO WRITE CHECK   2-4 W1I06550
                          MDX  L  XMCHK,+1   COUNT CHECK            2-4 W1I06560
                          NOP                                       2-4 W1I06570
                    NWRCH LD    1 NXTPD-T    IS IT PAD TIME         2-4 W1I06580
                          BSC  L  WRPAD,Z    YES, BR TO SEND PAD    2-4 W1I06590
                          LD      FCODE                                 W1I06600
                          BSC  L  RCVWT,+Z   BR IF RECEIVE FUNCTION     W1I06610
                          BSC  L  MONWT,+    BR IF MONITOR FUNCTION     W1I06620
                    *                                                 * W1I06630
                          LD      DSW                                   W1I06640
                          SLA     3          CHECK TIMEOUT BIT          W1I06650
                    XMT   BSC  L  XMTWT,-    BR IF TRANSMIT, NO TIMEOUT W1I06660
                          LD    1 H0002-T                           2-4 W1I06670
                          STO     SYN2       TURN ON INSERT 2 SYN CHARS W1I06680
                          LD    1 TRANS-T    TRANSPARENT TEXT       2-5 W1I06690
                          BSC  L  XMT,+-     BR TO TRANSMIT IF NOT  2-5 W1I06700
                    *                                                 * W1I06710
                          XIO   1 TIMER-T    START THIRD TIMER      2-5 W1I06720
                          SLA     16                                2-5 W1I06730
                          MDX     XMT        BR TO TRANSMIT         2-5 W1I06740
                    *************************************************** W1I06750
                    *                   READ RESPONSE                 * W1I06760
                    *************************************************** W1I06770
                    READI LD      FCODE                             2-4 W1I06780
                          BSC  L  RDBUF,+-   BR IF MONITOR FUNCTION     W1I06790
                    *                                                   W1I06800
                          LD      RTBSY                                 W1I06810
                          BSC  L  CLBY3,+-   BR TO START READ IF NT BSY W1I06820
                    RDBUF LD      DSW                               2-4 W1I06830
                          SLA     2                                 2-4 W1I06840
                          BSC  L  NRDCH,-    BR IF NO READ CHECK    2-4 W1I06850
                          MDX  L  RMCHK,+1   COUNT CHECK            2-4 W1I06860
                          NOP                                       2-4 W1I06870
                    NRDCH SLA     1          CHECK FOR TIMEOUT      2-4 W1I06880
                          BSC  L  T2,+Z      BR IF TIMEOUT ALSO         W1I06890
                          XIO   1 READ-T     READ 1 CHAR INTO BUF   2-4 W1I06900
                          LD      BUF        LOG                    2-4 W1I06910
                          SRA     8          CHARACTER              2-4 W1I06920
                          CALL    IOLOG      RECEIVED               2-4 W1I06930
                    *                                                   W1I06940
                          LD    1 PADCK-T                           2-6 W1I06950
                          BSC  L  PDCK1,Z    BR IF PAD CHECK ON     2-6 W1I06960
                    *                                                   W1I06970
                          LD      FCODE                                 W1I06980
                          BSC  L  MONRD,+-   BR IF MONITOR FUNCTION     W1I06990
                          LD      MONIT                                 W1I07000
                          BSC  L  MONRD,Z    BR IF MONITORING           W1I07010
                          LD      FCODE                                 W1I07020
                          BSC  L  XMTRD,-    BR FOR TRANSMIT FUNCTION   W1I07030
                          MDX     RCVRD      BR IF RECEIVE FUNCTION     W1I07040
                    *************************************************** W1I07050
                    TIMEI SLA     2                                     W1I07060
                          BSC  I  INT1,-     EXIT IF NOT TIMEOUT        W1I07070
                    *************************************************** W1I07080
                    *                   TIMEOUT                       * W1I07090
                    *************************************************** W1I07100
                          LD      FCODE                                 W1I07110
                          BSC  L  T2,+-      BR IF MONITOR FUNCTION 2-4 W1I07120
                    *                                                   W1I07130
                          LD      RTBSY      CHECK ROUTINE BUSY INDR    W1I07140
                          BSC  L  CLBY3,+-   BR TO START READ IF NT BSY W1I07150
                    *                                                 * W1I07160
                    T2    LD      ZILCH      LOG                    2-4 W1I07170
                          CALL    IOLOG       TIMEOUT               2-4 W1I07180
                          SLA     16                                2-6 W1I07190
                          STO   1 PADCK-T    RESET PAD CHECK INDR   2-6 W1I07200
                          LD      MONIT                             2-4 W1I07210
                          BSC  L  MONTM,Z    BR IF MONITORING           W1I07220
                          LD      FCODE                                 W1I07230
                          BSC  L  RCVT,+Z    BR IF RECEIVE FUNCTION 2-4 W1I07240
                          BSC  L  MONTM,+    BR IF MONITOR FUNC     2-4 W1I07250
                          BSC  L  XMTTM      BR FOR TRANSMIT FUNCTION   W1I07260
                    ZILCH DC      /1111      T.O. LOG INDR          2-4 W1I07270
                    *************************************************** W1I07280
                    INTX  BSC  I  INT1       EXIT TO ILS                W1I07290
                    *************************************************** W1I07300
                          HDNG     SCAT3 - READ RESPONSE FOR RECEIVE    W1I07310
                    *************************************************** W1I07320
                    *             READ RESPONSE FOR RECEIVE           * W1I07330
                    *************************************************** W1I07340
                    STWT  XIO   1 SYNC-T     START WRITE WITH TIMER     W1I07350
                          LD    1 H0005-T    SET UP TO TRANSMIT 5   2-3 W1I07360
                          STO   1 SYN5-T      SYNS FOR PADDING      2-4 W1I07370
                          MDX     INTX       EXIT TO ILS                W1I07380
                    *************************************************** W1I07390
                    RCVRD LD    1 SYN2-T     CHECK 2 SYNS RECEIVED IND  W1I07400
                          S     1 H0002-T                               W1I07410
                          BSC  L  NOSY2,+Z   BR IF SYN2 LESS THAN 2     W1I07420
                    *                                                 * W1I07430
                          LD    1 BUF-T                                 W1I07440
                          EOR   1 SYN-T                                 W1I07450
                          BSC  L  NOSY2,+-   BR IF CHAR IS A SYN        W1I07460
                    *                                                 * W1I07470
                          SLA     16                                    W1I07480
                          STO   1 SYN2-T     TURN OFF 2 SYNS RCVED IND  W1I07490
                          XIO   1 RETIM-T    RESET TIMER                W1I07500
                    NOSY2 LD    1 TRANS-T                               W1I07510
                          BSC  L  CKBCC,Z    BR IF TRANS MODE OR BCC TM W1I07520
                    *                                                 * W1I07530
                          LD    1 FIRST-T                               W1I07540
                          BSC  L  NOFST,+-   BR IF NOT FIRST CHARACTER  W1I07550
                    *                                                 * W1I07560
                          LD    1 BUF-T                                 W1I07570
                          EOR   1 ENQ-T                                 W1I07580
                          BSC  L  STWT,+-    BR IF BUF = ENQ            W1I07590
                    *                                                 * W1I07600
                          EOR   1 EQET-T                                W1I07610
                          BSC  L  NOEOT,Z    BR IF CHAR NOT AN EOT      W1I07620
                          MDX     RDEOT     **  SKIP EOT PAD CHECK  2-6 W1I07630
                    *                                                 * W1I07640
                          BSI  L  PDCHK      SET UP FOR PAD CHECK   2-6 W1I07650
                          BSC  L  RCVTM,Z    BR IF INVALID PAD      2-6 W1I07660
                    *                                                   W1I07670
                    RDEOT SLT     32                                    W1I07680
                          STO  I  IOAR       SET USERS WORD CNT TO ZERO W1I07690
                          BSC  L  GOMO2      BR TO SET MONITOR INDR     W1I07700
                    *                                                 * W1I07710
                    CLBY2 STO  I  IOAR       SET USERS WORD COUNT   2-6 W1I07720
                    CLBSY SLA     16                                    W1I07730
                          STO   1 RTBSY-T    TURN OFF ROUTINE BUSY IND  W1I07740
                    CLBY3 XIO   1 RETIM-T    RESET TIMERS               W1I07750
                          MDX     INTX       EXIT TO ILS                W1I07760
                    *************************************************** W1I07770
                    NOEOT SLA     16                                    W1I07780
                          STO   1 FIRST-T    TURN OFF FIRST CHAR IND    W1I07790
                          XIO   1 RETIM-T    RESET TIMER                W1I07800
                    *                                                 * W1I07810
                          LD    1 BUF-T                                 W1I07820
                          EOR   1 DLE-T                                 W1I07830
                          BSC  L  NODLE,Z    BR IF NOT A DLE            W1I07840
                    *                                                 * W1I07850
                          LD      *          A DLE WAS RECEIVED         W1I07860
                          STO   1 STXIN-T    TURN ON STX INDICATOR      W1I07870
                    STDLE LD      *                                     W1I07880
                          STO   1 LSDLE-T    TURN ON LAST CHAR = DLE    W1I07890
                    *                                                 * W1I07900
                    ROOMQ LD    1 COUNT-T    IS THERE ROOM IN I/O AREA  W1I07910
                          EOR   1 WDCNT-T                               W1I07920
                          BSC  L  OFLOW,+-   BR IF NO ROOM              W1I07930
                    *                                                 * W1I07940
                          LD    1 PACK-T                            2-4 W1I07950
                          BSC  L  RDEVN,+-   BR IF DATA UNPACKED    2-4 W1I07960
                          LD    1 COUNT-T    CHECK CHARACTER COUNT  2-4 W1I07970
                          BSC  L  RDODD,E    IF ODD, SHIFT CHAR     2-4 W1I07980
                    RDEVN LD    1 BUF-T                             2-4 W1I07990
                          STO  I  POINT      STORE CHAR IN I/O AREA 2-4 W1I08000
                          LD    1 PACK-T                            2-4 W1I08010
                          BSC  L  RUPNT,+-   BR IF DATA UNPACKED    2-4 W1I08020
                    RDCNT MDX  L  COUNT,+1   UP CHARACTER COUNT     2-4 W1I08030
                          MDX     INTX       EXIT TO ILS            2-4 W1I08040
                    *                                                 * W1I08050
                    RDODD LD    1 BUF-T                             2-4 W1I08060
                          SRA     8          SHIFT CHAR             2-4 W1I08070
                          OR   I  POINT      OR IN FIRST CHAR       2-4 W1I08080
                          STO  I  POINT      STORE CHAR IN I/O AREA 2-4 W1I08090
                    RUPNT MDX  L  POINT,+1   UP I/O AREA POINTER    2-4 W1I08100
                          MDX     RDCNT                             2-4 W1I08110
                    *************************************************** W1I08120
                    NODLE EOR   1 DLSOH-T                               W1I08130
                          BSC     Z          SKIP IF BUF = SOH          W1I08140
                          EOR   1 DLSHX-T                               W1I08150
                          BSC  L  RCVTM,Z    BR IF NOT SOH OR STX   2-4 W1I08160
                    *                                                 * W1I08170
                    STXOF STO   1 STXIN-T    TURN OFF STX IND.          W1I08180
                          MDX     ROOMQ      BR TO STORE IN I/O AREA    W1I08190
                    *                                                 * W1I08200
                    OFLOW LD      *                                     W1I08210
                          STO   1 OVFLO-T    TURN ON OVERFLOW IND.      W1I08220
                          MDX     INTX       EXIT TO ILS                W1I08230
                    *************************************************** W1I08240
                    NOFST LD    1 SYN2-T                                W1I08250
                          BSC  L  CKIND,+    BR IF LAST CHAR NOT SYN    W1I08260
                    *                                                 * W1I08270
                          LD    1 BUF-T                                 W1I08280
                          EOR   1 SYN-T      IF BUF=SYN                 W1I08290
                          BSC  L  SYNUP,+-   BR TO INCRE 2 SYN IND.     W1I08300
                    *                                                 * W1I08310
                          SLA     16                                    W1I08320
                          STO   1 SYN2-T     TURN OFF 2 SYN INDICATOR   W1I08330
                    CKIND LD    1 STXIN-T                               W1I08340
                          BSC  L  NOBIN,+-   BR IF STX IND NOT ON       W1I08350
                    *                                                 * W1I08360
                          LD    1 BUF-T                                 W1I08370
                          EOR   1 STX-T                                 W1I08380
                          BSC  L  ONLIN,Z    BR IF CHAR NOT AN STX      W1I08390
                    *                                                 * W1I08400
                          LD      *          TURN ON TRANSPARENT        W1I08410
                          STO   1 TRANS-T    MODE INDICATOR             W1I08420
                          SLA     16                                    W1I08430
                          STO   1 LSDLE-T    TURN OFF LAST CHAR=DLE IND W1I08440
                          MDX     STXOF      BR TO TURN OFF STX IND.    W1I08450
                    *                                                 * W1I08460
                    NOBIN LD    1 LSDLE-T                               W1I08470
                          BSC  L  NTDLE,+-   BR IF LAST CHAR NOT DLE    W1I08480
                    *                                                 * W1I08490
                          BSI  L  CALC       GO CALCULATE BCC           W1I08500
                          MDX     CKIND+3    BR TO CHECK FOR STX        W1I08510
                    *                                                 * W1I08520
                    NTDLE LD    1 BUF-T                                 W1I08530
                          EOR   1 DLE-T                                 W1I08540
                          BSC  L  DLEN1,Z    BR IF NOT A DLE            W1I08550
                    *                                                   W1I08560
                          BSI  L  CALC       CALCULATE BCC              W1I08570
                          MDX     ROOMQ-2    BR TO TURN ON LSDLE        W1I08580
                    *                                                 * W1I08590
                    DLEN1 EOR   1 SYNDL-T                               W1I08600
                          BSC  L  NTSYN,Z    BR IF NOT A SYN            W1I08610
                    *                                                 * W1I08620
                    SYNUP MDX  L  SYN2,+1    UP 2 SYN INDICATOR         W1I08630
                          MDX     BCCTM-1    EXIT TO ILS                W1I08640
                    NTSYN BSI  L  CALC       GO CALCULATE BCC           W1I08650
                    *************************************************** W1I08660
                    *                        .CKEND. - CHECK FOR END  * W1I08670
                    *                        CHARACTER, ETB OR ETX    * W1I08680
                    *                        IF CHARACTER IS AN ETB OR* W1I08690
                    *                        ETX, SET INDICATORS TO   * W1I08700
                    *                        RECEIVE BCC CHARACTERS   * W1I08710
                    *                        NEXT                     * W1I08720
                    *************************************************** W1I08730
                    CKEND LD    1 BUF-T                                 W1I08740
                          EOR   1 ETB-T                                 W1I08750
                          BSC     Z          SKIP IF CHAR IS AN ETB     W1I08760
                          EOR   1 ETBTX-T                               W1I08770
                          BSC  L  CKABT,Z    BR IF NOT ETB OR ETX       W1I08780
                    *                                                 * W1I08790
                    SETBC STO   1 BCC2-T     TURN OFF/ON BCC2 INDR      W1I08800
                          LDD     *                                     W1I08810
                          STD   1 TRANS-T    TURN ON TRANSPARENT    2-7 W1I08820
                    *             BCC1       TURN ON FOR BCC TIME   2-7 W1I08830
                    ROMQ1 MDX     ROOMQ      BR TO PUT CHAR IN I/O AREA W1I08840
                    *                                                   W1I08850
                    CKABT LD    1 BUF-T                                 W1I08860
                          EOR   1 ENQ-T      ABORT RECORD ON ENQ        W1I08870
                    *                                                 * W1I08880
                          BSC  L  TTDCK,+-   BR TO CHECK FOR TTD    2-6 W1I08890
                          LD    1 BUF-T                             2-6 W1I08900
                          EOR   1 ITB-T      BUF = ITB              2-6 W1I08910
                          BSC  L  ROOMQ,Z    BR IF NOT ITB          2-6 W1I08920
                          LD      *                                 2-6 W1I08930
                          STO   1 ITBRD-T    SET ITB READ INDR      2-6 W1I08940
                          SLA     16                                2-6 W1I08950
                          MDX     SETBC                             2-6 W1I08960
                    *                                                 * W1I08970
                    TTDCK MDX  L  COUNT,-1   MORE THAN ONE CHAR     2-6 W1I08980
                          MDX     NAKTM      ALREADY RCVD - YES,BR  2-6 W1I08990
                          LD    1 PACK-T     PACKED DATA            2-6 W1I09000
                          BSC  L  TTDPA,Z    YES-BRANCH             2-6 W1I09010
                          MDX  L  POINT,-1   NO-BACKDATE POINTER    2-6 W1I09020
                    TTDPA LD   I  POINT      GET 1ST CHAR           2-6 W1I09030
                          AND   1 HFF00-T    MASK OUT 2ND CHAR      2-6 W1I09040
                          EOR   1 STX-T      WAS IT STX             2-6 W1I09050
                          BSC  L  NAKTM,Z    NO,BRANCH              2-6 W1I09060
                          MDX  L  TTDCT,1    YES,INCRE TTD RCVD     2-6 W1I09070
                          NOP                                       2-6 W1I09080
                    *                                                   W1I09090
                    NAKTM LD      *                                     W1I09100
                          STO   1 XNAK-T     TURN ON TRANSMIT NAK IND.  W1I09110
                          BSC  L  STWT       BR TO START WRITE          W1I09120
                    *************************************************** W1I09130
                    *                        .CKBCC. - IF BCC1 IS ON, * W1I09140
                    *                        SCAT3 IS EXPECTING TO    * W1I09150
                    *                        RECEIVE THE BCC CHARACTER* W1I09160
                    *                        OTHERWISE, SCAT3 IS STILL* W1I09170
                    *                        RECEIVING TRANSPARENT    * W1I09180
                    *                        DATA                     * W1I09190
                    *************************************************** W1I09200
                    CKBCC LD    1 BCC1-T                                W1I09210
                          BSC  L  BCCTM,Z    BR IF TIME TO CHECK BCC    W1I09220
                    *                                                 * W1I09230
                          LD    1 LSDLE-T                               W1I09240
                          BSC  L  YSDLE,Z    BR IF LAST CHAR WAS A DLE  W1I09250
                    *                                                 * W1I09260
                          LD    1 BUF-T                                 W1I09270
                          EOR   1 DLE-T                                 W1I09280
                          BSC  L  STDLE,+-   BR IF CHAR = DLE           W1I09290
                    *                                                 * W1I09300
                          BSI  L  CALC       GO CALCULATE BCC           W1I09310
                          MDX     ROMQ1      BR TO PUT CHAR IN I/O AREA W1I09320
                    *                                                 * W1I09330
                    YSDLE SLA     16                                    W1I09340
                          STO   1 LSDLE-T    TURN OFF LAST CHAR=DLE IND W1I09350
                          LD    1 BUF-T                                 W1I09360
                          EOR   1 SYN-T                                 W1I09370
                          BSC  L  YSSYN,+-   BR IF CHAR IS A SYN        W1I09380
                    *                                                 * W1I09390
                          BSI  L  CALC       GO CALCULATE BCC           W1I09400
                          LD    1 BUF-T                                 W1I09410
                          EOR   1 DLE-T                                 W1I09420
                          BSC  I  INT1,+-    EXIT TO ILS IF A DLE       W1I09430
                          MDX     CKEND      BR TO CHECK FOR ETB, ETX   W1I09440
                    *                                                 * W1I09450
                    YSSYN MDX  L  SYN2,+2    UP 2 SYN IND. BY 2         W1I09460
                          LD    1 PACK-T                            2-4 W1I09470
                          BSC  L  DRPNT,+-   BR IF NOT PACKED DATA  2-4 W1I09480
                          LD    1 COUNT-T                           2-4 W1I09490
                          BSC  L  DRCNT,E                           2-4 W1I09500
                    DRPNT MDX  L  POINT,-1   DECR POINT             2-4 W1I09510
                          LD   I  POINT      REMOVE DLE FROM BUFFER 2-4 W1I09520
                          AND   1 HFF00-T                           2-4 W1I09530
                          STO  I  POINT                             2-4 W1I09540
                    DRCNT MDX  L  COUNT,-1   DECR COUNT             2-4 W1I09550
                          MDX     STRD1      EXIT TO ILS            2-4 W1I09560
                    *************************************************** W1I09570
                    *             BLOCK CHECK CHARACTER               * W1I09580
                    *************************************************** W1I09590
                    BCCTM LD    1 BCC2-T                                W1I09600
                          BSC  L  GET1,+-    BR TO GET FIRST BCC CHAR   W1I09610
                    *                                                 * W1I09620
                          LD    1 BCCR-T                                W1I09630
                          EOR   1 BUF-T      COMBINE TWO CHAR BCC       W1I09640
                          STO   1 BCCR-T                                W1I09650
                    *                                                 * W1I09660
                          SLA     16                                    W1I09670
                          STO   1 BCC2-T     TURN OFF BCC2 IND          W1I09680
                          LD    1 ITBRD-T                           2-6 W1I09690
                          BSC  L  ITBBC,Z    BR IF ITB              2-6 W1I09700
                    *                                                   W1I09710
                          LD    1 OVFLO-T                               W1I09720
                          BSC  L  E1000,Z    BR IF OVERFLOW OCCURRED    W1I09730
                    *                                                 * W1I09740
                          LD    1 BCCR-T     IS BCC CORRECT             W1I09750
                          EOR   1 BCCA-T                                W1I09760
                          BSC  L  E0800,Z    BR TO ERROR IF NOT EQUAL   W1I09770
                    *                                                   W1I09780
                          LD    1 ITBER-T                           2-6 W1I09790
                          BSC  L  E0800,Z    BR IF ITB BCC ERROR    2-6 W1I09800
                    *                                                   W1I09810
                    CKALT XIO   1 ENDOP-T    END OPERATION          2-9 W1I09815
                          LD    1 SUBF-T                            2-9 W1I09820
                          BSC  L  RPEAT,Z-   BR IF RECEIVE REPEAT       W1I09830
                    *                                                   W1I09840
                          LDD   1 ACK-T                                 W1I09850
                          RTE     16         ALTERNATE ACKNOWLEDGEMENTS W1I09860
                          STD   1 ACK-T                                 W1I09870
                    RPEAT SLA     16                                    W1I09880
                          STO   1 XNAK-T     TURN OFF XMIT NAK IND.     W1I09890
                    *                                                 * W1I09900
                          XIO   1 STRED-T    START READ AGAIN       2-9 W1I09905
                          LD    1 COUNT-T    GIVE USER THE WORD COUNT   W1I09910
                          BSC  L  CLBSY,+     ONLY OF CHARS RECD    2-6 W1I09920
                          BSC  L  CLBY2                             2-6 W1I09930
                    *                                                   W1I09940
                    ITBBC SLT     32                                2-7 W1I09950
                          STO   1 ITBRD-T    RESET ITB READ INDR    2-6 W1I09960
                          STD   1 TRANS-T          TRANSPARENT      2-7 W1I09970
                    *             BCC1             BCC TIME         2-7 W1I09980
                          LD    1 BCCR-T     COMPARE BCC RCVD       2-6 W1I09990
                          EOR   1 BCCA-T        WITH BCC ACCD       2-6 W1I10000
                          OR    1 ITBER-T    SAVE PREV ERROR IF ANY 2-6 W1I10010
                          STO   1 ITBER-T    SET ERROR IF NOT EQUAL 2-6 W1I10020
                          SLA     16                                2-6 W1I10030
                          STO   1 BCCA-T     RESET BCC ACCUM        2-6 W1I10040
                          MDX     INT4       EXIT TO ILS            2-6 W1I10050
                    *                                                   W1I10060
                    E0800 LD    1 H0800-T    BAD BCC ERROR CODE         W1I10070
                          MDX  L  BCCER,+1   COUNT CRC-16 ERRORS    2-4 W1I10080
                          NOP                                       2-4 W1I10090
                          MDX     ERROR      GO DECRE RETRY             W1I10100
                    *                                                 * W1I10110
                    E1000 LD    1 H1000-T    OVERFLOW ERROR CODE        W1I10120
                    ERROR BSI     ERRCK      GO CHECK RETRY COUNTER     W1I10130
                    *                                                 * W1I10140
                          BSC  L  GOMON,+-   MONITOR IF ZERO            W1I10150
                    *                                                 * W1I10160
                          STO   1 XNAK-T     TURN ON TRANSMIT NAK IND.  W1I10170
                          BSC  L  STWT,-     RETRY IF POSITIVE          W1I10180
                    *                                                 * W1I10190
                          MDX     CKALT      BR TO ALTER ACKS, ETC.     W1I10200
                    *                                                 * W1I10210
                    GET1  LD    1 BUF-T      PICK UP FIRST 8 BITS       W1I10220
                          SRA     8          OF BCC                     W1I10230
                          STO   1 BCCR-T                                W1I10240
                          LD      *                                     W1I10250
                          STO   1 BCC2-T     TURN ON BCC2 IND.          W1I10260
                    STRD1 MDX     INT4       EXIT TO ILS            2-4 W1I10270
                    *                                                 * W1I10280
                    *                                                   W1I10290
                    ONLIN EOR   1 STXEQ-T    IS BUF = ENQ               W1I10300
                          BSC  L  RCVTM,Z    NO, GO LISTEN FOR ENQ  2-4 W1I10310
                    *                                                   W1I10320
                          MDX     NAKTM      YES, GO SEND NAK           W1I10330
                    *************************************************** W1I10340
                          HDNG     SCAT3 - WRITE RESPONSE FOR RECEIVE   W1I10350
                    *************************************************** W1I10360
                    *             WRITE RESPONSE FOR RECEIVE          * W1I10370
                    *************************************************** W1I10380
                    RCVWT BSI     PADIN      GO WRITE PADS IF NECESSARY W1I10390
                    *                                                 * W1I10400
                          LD    1 XEOT-T     IF XMIT-EOT IND IS ON,     W1I10410
                          BSC  L  CLEOT,Z    BR TO SEND EOT             W1I10420
                    *                                                 * W1I10430
                          LD    1 XNAK-T                                W1I10440
                          BSC  L  POS,+-     BR IF POSITIVE ACK TO SEND W1I10450
                    *                                                 * W1I10460
                          LD    1 NAK-T                             2-4 W1I10470
                    SETPD STO   1 BUF-T      LOG                    2-7 W1I10480
                          CALL    IOLOG      NAK OR CURRENT ACK     2-4 W1I10490
                          XIO   1 WTBUF-T    WRITE NAK OR CUR ACK   2-7 W1I10495
                          BSI     STPAD      BR TO SET PAD INDR     2-4 W1I10500
                    *                                                 * W1I10510
                    RESRT LD    1 IOAR-T     INITIALIZE I/O AREA        W1I10520
                          A     1 H0001-T     POINTER                   W1I10530
                          STO   1 POINT-T                               W1I10540
                          STO   1 FIRST-T    TURN ON FIRST CHAR. IND.   W1I10550
                    *                                                 * W1I10560
                          SLT     32                                2-7 W1I10570
                          STO   1 COUNT-T    CLEAR WORD COUNT           W1I10580
                          STD   1 ITBRD-T          ITB READ INDR    2-7 W1I10590
                    *             BCCA             BCC ACCUMULATED  2-7 W1I10600
                          STD   1 LSDLE-T          LAST CHAR DLE    2-7 W1I10610
                    *             SYN2             INSERT 2 SYN     2-7 W1I10620
                          STD   1 TRANS-T          TRANSPARENT IND  2-7 W1I10630
                    *             BCC1             BCC TIME FIRST   2-7 W1I10640
                          STO   1 OVFLO-T          I/O AREA OVERFLOW    W1I10650
                          STD   1 ITBER-T          ITB ERROR INDR   2-7 W1I10660
                    *             PADCK            PAD CHECK INDR   2-7 W1I10670
                          XIO   1 ENDOP-T    RESET CHAR PHASE           W1I10680
                          XIO   1 RETIM-T    RESET TIMERS               W1I10690
                          MDX     STRD       BR TO START READ           W1I10700
                    *                                                 * W1I10710
                    POS   LD    1 LSDLE-T                               W1I10720
                          BSC  L  WTDL,+-    BR IF DLE NOT YET WRITTEN  W1I10730
                    *                                                 * W1I10740
                          LD    1 ACK-T      LOG                    2-4 W1I10760
                          MDX     SETPD      SET PAD INDR           2-3 W1I10780
                    *                                                 * W1I10790
                    WTDL  XIO   1 WTDLE-T    WRITE DLE                  W1I10800
                          LD    1 DLE-T      LOG                    2-4 W1I10810
                          CALL    IOLOG      DLE                    2-4 W1I10820
                    WTDL1 LD      *                                 2-4 W1I10830
                          STO   1 LSDLE-T    TURN ON LAST CHAR=DLE      W1I10840
                    INT4  MDX     INT3       EXIT TO ILS                W1I10850
                    *                                                   W1I10860
                    CLEOT XIO   1 WTEOT-T    WRITE EOT              2-4 W1I10870
                          LD    1 EOT-T      LOG                    2-4 W1I10880
                          CALL    IOLOG      EOT                    2-4 W1I10890
                          BSI     STPAD      BR TO SET PAD INDR     2-4 W1I10900
                    *                                                 * W1I10910
                          STO   1 XEOT-T     TURN OFF XMIT-EOT INDR 2-3 W1I10920
                          STO   1 MNBSY-T    RESET MONITOR BUSY INDR2-5 W1I10930
                          MDX     STRD       BR TO START READ           W1I10940
                    *************************************************** W1I10950
                          HDNG    SCAT3 - TIMEOUT FOR RECEIVE           W1I10960
                    *************************************************** W1I10970
                    *             TIMEOUT INTERRUPT FOR RECEIVE       * W1I10980
                    *************************************************** W1I10990
                    RCVT  MDX  L  SLVTO,+1   COUNT SLAVE TIME OUTS  2-4 W1I11000
                          NOP                                       2-4 W1I11010
                          MDX     TMNIT                             2-4 W1I11020
                    RCVTM MDX  L  SISRV,+1   CNT SLV INVAL SEQ RCVD 2-4 W1I11030
                          NOP                                       2-4 W1I11040
                    TMNIT LD    1 H2000-T    ERROR CODE /2000       2-4 W1I11050
                          BSI     ERRCK      GO CHECK RETRY COUNTER     W1I11060
                    *                                                 * W1I11070
                          BSC  L  RESRT,Z    GO START READ IF A NOT 0   W1I11080
                    *                                                 * W1I11090
                          MDX     ERROR+1    BR TO CLOSE, TERMINATE     W1I11100
                    *************************************************** W1I11110
                    *             ERROR ROUTINE                       * W1I11120
                    *************************************************** W1I11130
                    ERRCK DC      0                                     W1I11140
                          STO     ERRU       SAVE ERROR CODE            W1I11150
                          LD    1 RETRY-T                               W1I11160
                          S     1 H0001-T                               W1I11170
                          STO   1 RETRY-T                               W1I11180
                          BSC  I  ERRCK,Z    EXIT FOR MORE TRYS         W1I11190
                    *                                                 * W1I11200
                          LD    1 H0007-T    SET RETRY COUNT TO SEVEN   W1I11210
                          STO   1 RETRY-T                               W1I11220
                          XIO   1 RETIM-T    RESET TIMERS               W1I11230
                          LD      ERRU       ERROR CODE TO A-REGISTER   W1I11240
                          BSI  I  USERR      GO TO USER ERROR ROUTINE   W1I11250
                          LDX  L1 T                                     W1I11260
                          BSC  I  ERRCK      EXIT TO CHECK OPTIONS      W1I11270
                    ERRU  DC      0          ERROR CODE HOLDER          W1I11280
                    *************************************************** W1I11290
                          HDNG     SCAT3 - TRANSMIT PAD CHARACTERS      W1I11300
                    *************************************************** W1I11310
                    *             TRANSMIT PAD CHARACTERS             * W1I11320
                    *                 5 SYN CHARACTERS BEFORE EVERY   * W1I11330
                    *                 TRANSMISSION                    * W1I11340
                    *************************************************** W1I11350
                    PADIN DC      0                                     W1I11360
                          LD    1 SYN5-T                            2-3 W1I11370
                          BSC  I  PADIN,+-   BR IF PRECEEDING SYNS SENT W1I11380
                    *                                                 * W1I11390
                          MDX  L  SYN5,-1    DECREE CTR FOR 5 SYNS  2-3 W1I11400
                          NOP                                           W1I11410
                          XIO   1 WTSYN-T    WRITE SYN CHARACTER        W1I11420
                          LD    1 SYN-T      LOG                    2-4 W1I11430
                          CALL    IOLOG      SYN                    2-4 W1I11440
                          MDX     INT3       EXIT TO ILS                W1I11450
                    *                                                 * W1I11460
                    STRD  XIO   1 STRED-T    START READ                 W1I11470
                    INT3  BSC  I  INT1       EXIT TO ILS                W1I11480
                    *************************************************** W1I11490
                    *             TRANSMIT ONE PAD CHARACTER AFTER 2-3* W1I11500
                    *              EACH TRANSMISSION               2-3* W1I11510
                    *************************************************** W1I11520
                    STPAD DC      0                                 2-4 W1I11530
                          LD      *                                 2-4 W1I11540
                          STO   1 NXTPD-T    TURN ON PAD INDR       2-4 W1I11550
                          MDX     INT3       EXIT TO ILS            2-4 W1I11560
                    WRPAD LD    1 PAD-T      LOG                    2-4 W1I11570
                          STO   1 BUF-T                             2-7 W1I11580
                          CALL    IOLOG      PAD                    2-4 W1I11590
                          XIO   1 WTBUF-T    WRITE PAD              2-7 W1I11595
                          SLA     16                                2-3 W1I11600
                          STO   1 NXTPD-T    TURN OFF PAD INDR      2-3 W1I11610
                          BSC  I  STPAD      RETURN TO NORMAL FLOW  2-4 W1I11620
                    *************************************************** W1I11630
                    *             ERP - 2 OPTIONS, RETRY OR MONITOR   * W1I11640
                    *************************************************** W1I11650
                    NTRDY LD    1 FCODE-T    IF MONITOR FUNCTION,       W1I11660
                          BSC  L  GOMON,+-   BR.  DO NOT GO TO ERR RTN. W1I11670
                    *                                                   W1I11680
                          LD    1 RTBSY-T    IF ROUTINE IS NOT BUSY,    W1I11690
                    CLBY4 BSC  L  CLBY3,+-   BR TO START READ           W1I11700
                    *                                                   W1I11710
                          LD      H8000      DATA SET FAIL ERROR CODE   W1I11720
                          BSI     ERRCK      GO DECRE RETRY             W1I11730
                    *                                                 * W1I11740
                          BSC  L  GOMON,+-   MONITOR IF ACC IS ZERO     W1I11750
                          SLA     16                                    W1I11760
                          STO   1 LSDLE-T    TURN OFF LAST CHAR = DLE   W1I11770
                          STO   1 TRANS-T    TURN OFF TRANSPARENT IND   W1I11780
                          MDX     CLBY4      BR TO CLBY3,RESET,EXIT     W1I11790
                    *                                                   W1I11800
                    *                                                   W1I11810
                    H8000 DC      /8000      DATA SET FAIL ERROR CODE   W1I11820
                    *                                                   W1I11830
                    *************************************************** W1I11840
                          HDNG     SCAT3 - CALCULATE BLOCK CHECK CHAR   W1I11850
                    *************************************************** W1I11860
                    *             CALCULATE BLOCK CHECK CHAR. CRC-16  * W1I11870
                    *************************************************** W1I11880
                    CALC  DC      0                                     W1I11890
                          LD    1 BUF-T                                 W1I11900
                          SRA     8                                     W1I11910
                          EOR   1 BCCA-T     ADD IN REMAINDER           W1I11920
                          BSC  L  EOR1,E     BR IF ONE                  W1I11930
                          SRA     1                                     W1I11940
                    B2    BSC  L  EOR2,E     BR IF ONE                  W1I11950
                          SRA     1                                     W1I11960
                    B3    BSC  L  EOR3,E     BR IF ONE                  W1I11970
                          SRA     1                                     W1I11980
                    B4    BSC  L  EOR4,E     BR IF ONE                  W1I11990
                          SRA     1                                     W1I12000
                    B5    BSC  L  EOR5,E     BR IF ONE                  W1I12010
                          SRA     1                                     W1I12020
                    B6    BSC  L  EOR6,E     BR IF ONE                  W1I12030
                          SRA     1                                     W1I12040
                    B7    BSC  L  EOR7,E     BR IF ONE                  W1I12050
                          SRA     1                                     W1I12060
                    B8    BSC  L  EOR8,E     BR IF ONE                  W1I12070
                          SRA     1                                     W1I12080
                    B9    STO   1 BCCA-T     STORE NEW REMAINDER        W1I12090
                          BSC  I  CALC                                  W1I12100
                    *                                                 * W1I12110
                    EOR1  SRA     1                                     W1I12120
                          EOR     POLY       ADD POLYNOMIAL             W1I12130
                          MDX     B2         BR TO TEST NEXT CHAR       W1I12140
                    EOR2  SRA     1                                     W1I12150
                          EOR     POLY       ADD POLYNOMIAL             W1I12160
                          MDX     B3         BR TO TEST NEXT CHAR       W1I12170
                    EOR3  SRA     1                                     W1I12180
                          EOR     POLY       ADD POLYNOMIAL             W1I12190
                          MDX     B4         BR TO TEST NEXT CHAR       W1I12200
                    EOR4  SRA     1                                     W1I12210
                          EOR     POLY       ADD POLYNOMIAL             W1I12220
                          MDX     B5         BR TO TEST NEXT CHAR       W1I12230
                    EOR5  SRA     1                                     W1I12240
                          EOR     POLY       ADD POLYNOMIAL             W1I12250
                          MDX     B6         BR TO TEST NEXT CHAR       W1I12260
                    EOR6  SRA     1                                     W1I12270
                          EOR     POLY       ADD POLYNOMIAL             W1I12280
                          MDX     B7         BR TO TEST NEXT CHAR       W1I12290
                    EOR7  SRA     1                                     W1I12300
                          EOR     POLY       ADD POLYNOMIAL             W1I12310
                          MDX     B8         BR TO TEST NEXT CHAR       W1I12320
                    EOR8  SRA     1                                     W1I12330
                          EOR     POLY       ADD POLYNOMIAL             W1I12340
                          MDX     B9         BR STORE REMAINDER         W1I12350
                    *                                                 * W1I12360
                    POLY  DC      /A001      POLYNOMIAL FOR CRC-16      W1I12370
                    *************************************************** W1I12380
                          HDNG     SCAT3 - WRITE RESPONSE FOR TRANSMIT  W1I12390
                    *************************************************** W1I12400
                    *             WRITE RESPONSE FOR TRANSMIT         * W1I12410
                    *************************************************** W1I12420
                    XMTWT BSI     PADIN      GO WRITE PADS IF NECESSARY W1I12430
                          LD    1 TBTX-T                                W1I12440
                          BSC  L  ENDWT,+Z   BR IF TRANSMIT EOT         W1I12450
                    *                                                   W1I12460
                          LD    1 XNAK-T                                W1I12470
                          BSC  L  CLNAK,Z    BR IF XMIT-NAK IND ON      W1I12480
                    *                                                   W1I12490
                          LD    1 SYN2-T     CK INSERT 2 SYNS           W1I12500
                          BSC  L  XMT1,+-    BR IF NOT INSERT TIME      W1I12510
                    *************************************************** W1I12520
                    *             INSERT SYNCHRONOUS IDLE ON A TIMEOUT* W1I12530
                    *              WITH A WRITE RESPONSE IN NORMAL    * W1I12540
                    *              TEXT. TIMEOUT OCCURS ALONE IN      * W1I12550
                    *              TRANSPARENT TEXT AND CAUSES INSERT * W1I12560
                    *              SYN SYN IN NORMAL TEXT             * W1I12570
                    *              DLE SYN IN TRANSPARENT TEXT        * W1I12580
                    *************************************************** W1I12590
                          LD    1 LSDLE-T    NO INSERT AFTER A DLE      W1I12600
                          BSC  L  XMT1,Z     BR AROUND INSERT           W1I12610
                    *                                                 * W1I12620
                          LD    1 XMESS-T    NO INSERT AFTER ETB OR ETX W1I12630
                          BSC  L  XMT1,+-    BR AROUND INSERT           W1I12640
                    *                                                 * W1I12650
                          LD    1 DSW-T                                 W1I12660
                          SLA     2          IF CHECK BIT IS ON         W1I12670
                          BSC  L  SYN1,+Z    BR TO SEND ONLY 1 SYN      W1I12680
                    *                                                 * W1I12690
                          MDX  L  SYN2,-1    DECRE 2 SYN COUNTER BY 1   W1I12700
                          MDX     CKDLE      CK TRANSPARENT ON FIRST    W1I12710
                    WSYN1 XIO   1 WTSYN-T    WRITE SYN              2-4 W1I12720
                          LD    1 SYN-T      LOG                    2-4 W1I12730
                          CALL    IOLOG      SYN                    2-4 W1I12740
                    INTX2 BSC  I  INT1       EXIT TO ILS                W1I12750
                    *                                                 * W1I12760
                    SYN1  SLA     16                                    W1I12770
                          STO   1 SYN2-T     TURN OFF SYN2 IND.         W1I12780
                          MDX     WSYN1      BR TO WRITE SYN        2-4 W1I12790
                    *                                                 * W1I12800
                    CKDLE LD    1 TRANS-T    CK TRANSPARENT MODE IND.   W1I12810
                          BSC  L  WSYN1,+-   BR TO WRITE SYN,NON TRANS  W1I12820
                    CKDL  XIO   1 WTDLE-T    WRITE DLE, TRANSPARENT 2-4 W1I12830
                          LD    1 DLE-T      LOG                    2-4 W1I12840
                          CALL    IOLOG      DLE                    2-4 W1I12850
                          MDX     INTX2      EXIT TO ILS                W1I12860
                    *************************************************** W1I12870
                    XMT1  LD    1 XMENQ-T                               W1I12880
                          BSC  L  ENQWT,Z    BR TO TRANSMIT ENQ         W1I12890
                    *                                                 * W1I12900
                          LD    1 XMESS-T    IF TRANSMIT MESS. IS OFF,  W1I12910
                          BSC  L  NOMES,+-   BR TO SEND END FUNCITON    W1I12920
                    *                                                 * W1I12930
                    *************************************************** W1I12940
                    *             SEND MESSAGE                        * W1I12950
                    *************************************************** W1I12960
                          LD    1 PACK-T     IS DATA UNPACKED       2-4 W1I12970
                          BSC  L  WTEVN,+-   BR IF IT IS            2-4 W1I12980
                          LD    1 COUNT-T    IS COUNT EVEN          2-4 W1I12990
                          BSC  L  WTODD,E    BR IF ODD              2-4 W1I13000
                    *                                                 * W1I13010
                    WTEVN LD   I  POINT      PUT CHAR FROM I/O      2-4 W1I13020
                          AND   1 HFF00-T                               W1I13030
                          STO   1 BUF-T       AREA INTO BUF             W1I13040
                          LD    1 FIRST-T                               W1I13050
                          BSC  L  NTFST,+-   BR IF NOT FIRST CHARACTER  W1I13060
                          MDX     FRST       BR TO PROC FIRST CHAR  2-4 W1I13070
                    *                                                 * W1I13080
                    WTODD LD   I  POINT      SHIFT 2ND CHAR IN WORD 2-4 W1I13090
                          SLA     8          TO HIGH ORDER END      2-4 W1I13100
                          STO   1 BUF-T      AND STORE IN BUFFER    2-4 W1I13110
                          MDX     NTFST                             2-4 W1I13120
                    *************************************************** W1I13130
                    *             FIRST CHARACTER TO BE SENT          * W1I13140
                    *************************************************** W1I13150
                    FRST  LD    1 IOAR-T     INITLZ I/O AREA PT     2-4 W1I13160
                          A     1 H0001-T                               W1I13170
                          STO   1 POINT-T                               W1I13180
                          STO   1 BCC1-T     TURN ON BCC1 IND.          W1I13190
                    *                                                 * W1I13200
                          SLA     16                                    W1I13210
                          STO   1 BCCA-T     CLEAR BCC ACCUMULATION     W1I13220
                          STO   1 LSDLE-T    TURN OFF LAST CHAR=DLE IND W1I13230
                          STO   1 FIRST-T             FIRST CHAR. IND.  W1I13240
                          LD   I  POINT      PUT CHARACTER FROM I/O     W1I13250
                          AND   1 HFF00-T                               W1I13260
                          STO   1 BUF-T      AREA INTO BUF              W1I13270
                    *                                                 * W1I13280
                          LD    1 TEXTM-T    CHECK TEXT MODE            W1I13290
                          BSC  L  NTRAN,+-   BR IF NORMAL TEXT          W1I13300
                    *                                                 * W1I13310
                          LD    1 BUF-T                                 W1I13320
                          EOR   1 DLE-T                                 W1I13330
                          BSC  L  NDLE,Z     BR IF BUF NOT DLE          W1I13340
                    *                                                 * W1I13350
                    *************************************************** W1I13360
                    *             .STXIN. ON IF DLE HAS BEEN FOUND    * W1I13370
                    *************************************************** W1I13380
                          LD      *                                     W1I13390
                          STO   1 STXIN-T    TURN ON STX INDICATOR      W1I13400
                          MDX     NTRAN                                 W1I13410
                    *                                                 * W1I13420
                    *************************************************** W1I13430
                    *             .DLSTX. ON IF DLE HAS NOT BEEN FOUND* W1I13440
                    *************************************************** W1I13450
                    NDLE  STO   1 DLSTX-T    TURN ON DLE STX INDICATOR  W1I13460
                    NTRAN LD    1 PACK-T     IS DATA UNPACKED       2-4 W1I13470
                          BSC  L  UPPTR,+-   BR IF IT IS            2-4 W1I13480
                          LD    1 COUNT-T    COUNT EVEN             2-4 W1I13490
                          BSC  L  UPPTR,E    BR IF ODD              2-4 W1I13500
                          MDX     UPCNT      INCR CHAR COUNT        2-4 W1I13510
                    *                                                 * W1I13520
                    UPPTR MDX  L  POINT,+1   INCR I/O AREA POINTER  2-4 W1I13530
                    *                                                 * W1I13540
                    UPCNT MDX  L  COUNT,+1   INCR CHAR COUNT        2-4 W1I13550
                          LD    1 COUNT-T                           2-4 W1I13560
                          EOR   1 WDCNT-T                           2-4 W1I13570
                          BSC  L  ITBCK,Z    BR IF NOT LAST CHAR    2-6 W1I13580
                    *                                                 * W1I13590
                    WTBF2 SLA     16                                    W1I13600
                          STO   1 XMESS-T    TURN OFF TRANSMIT MESS.IND W1I13610
                    WTBF  XIO   1 WTBUF-T    WRITE CONTENTS OF BUF  2-7 W1I13620
                          LD    1 BUF-T      LOG                    2-4 W1I13630
                          CALL    IOLOG      BUF CONTENTS           2-4 W1I13640
                    INTX3 MDX     INTX2      EXIT TO ILS            2-3 W1I13650
                    *                                                 * W1I13660
                    ITBCK LD    1 TRANS-T                           2-6 W1I13670
                          BSC  L  WTBF,Z     BR IF TRANSPARENT      2-6 W1I13680
                          LD    1 BUF-T                             2-6 W1I13690
                          EOR   1 ITB-T      BUF = ITB              2-6 W1I13700
                          BSC  L  WTBF,Z     BR IF NOT ITB          2-6 W1I13710
                          LD      *                                 2-6 W1I13720
                          STO   1 ITBRD-T    SET ITB BCC INDR       2-6 W1I13730
                          MDX     WTBF2      BR TO TURN OFF XMESS   2-6 W1I13740
                    *************************************************** W1I13750
                    *             FIRST CHARACTER HAS BEEN SENT       * W1I13760
                    *************************************************** W1I13770
                    NTFST LD    1 STXIN-T                               W1I13780
                          BSC  L  XMT2,+-    BR IF STX IND. NOT ON      W1I13790
                    *                                                 * W1I13800
                          SLA     16                                    W1I13810
                          STO   1 STXIN-T    TURN OFF STX INDICATOR     W1I13820
                    LDREG XIO   1 LDDLE-T    LOAD SYNC REG WITH DLE     W1I13830
                          LD      *                                     W1I13840
                          STO   1 TRANS-T    TURN ON IN TRANSPARENT IND W1I13850
                          XIO   1 TIMER-T    START THIRD TIMER          W1I13860
                          MDX     NTRAN      BR TO WRITE CHARACTER      W1I13870
                    *                                                 * W1I13880
                    XMT2  LD    1 DLSTX-T                               W1I13890
                          BSC  L  XMT3,+-    BR IF DLE STX IND. OFF     W1I13900
                    *                                                 * W1I13910
                          LD    1 LSDLE-T                               W1I13920
                          BSC  L  XMT4,+-    BR IF LAST CHAR NOT A DLE  W1I13930
                    *                                                 * W1I13940
                          SLA     16                                    W1I13950
                          STO   1 DLSTX-T    TURN OFF DLE STX IND.      W1I13960
                          STO   1 LSDLE-T    TURN OFF LAST CHAR=DLE IND W1I13970
                          BSI  L  CALC       GO CALCULATE BCC           W1I13980
                          MDX     LDREG      BR TO LOAD SYNC REGISTER   W1I13990
                    *                                                 * W1I14000
                    XMT4  LD    1 BUF-T                                 W1I14010
                          EOR   1 DLE-T                                 W1I14020
                          BSC  L  XMT4A,Z    BR IF BUF NOT A DLE        W1I14030
                    *                                                 * W1I14040
                          LD      *                                     W1I14050
                          STO   1 LSDLE-T    TURN ON LAST CHAR=DLE      W1I14060
                          MDX     XMT4B      BR TO CALC BCC             W1I14070
                    *                                                 * W1I14080
                    XMT4A LD    1 BUF-T                                 W1I14090
                          EOR   1 SYN-T      IF BUF = SYN,              W1I14100
                          BSC  L  NTRAN,+-   DO NOT CALCULATE BCC       W1I14110
                    *                                                   W1I14120
                    XMT4B BSI  L  CALC       GO CALCULATE BCC           W1I14130
                          MDX     NTRAN      BR TO WRITE CHARACTER      W1I14140
                    *                                                 * W1I14150
                    XMT3  LD    1 TRANS-T                               W1I14160
                          BSC  L  XMT4A,+-   BR IF NOT IN TRANSPARENT   W1I14170
                    *************************************************** W1I14180
                    *             TRANSPARENT TEXT                    * W1I14190
                    *************************************************** W1I14200
                          LD    1 DSW-T                                 W1I14210
                          SLA     2          IF CHECK BIT IS ON         W1I14220
                          BSC  L  WSYN1,+Z   BR TO WRITE SYN        2-4 W1I14230
                    *                                                 * W1I14240
                          LD    1 LSDLE-T                               W1I14250
                          BSC  L  XMT5,Z     BR IF LAST CHAR=DLE        W1I14260
                    *                                                 * W1I14270
                          LD    1 BUF-T                                 W1I14280
                          EOR   1 DLE-T                                 W1I14290
                          BSC  L  XMT4B,Z    BR IF CHAR NOT A DLE       W1I14300
                    *                                                 * W1I14310
                          LD      *                                     W1I14320
                          STO   1 LSDLE-T    TURN ON LAST CHAR=DLE IND  W1I14330
                          MDX     XMT4B      BR TO CALCULATE BCC        W1I14340
                    *                                                 * W1I14350
                    XMT5  SLA     16                                    W1I14360
                          STO   1 LSDLE-T    TURN OFF LAST CHAR=DLE IND W1I14370
                    CKDL1 BSC  L  CKDL       BR TO WRITE DLE        2-4 W1I14380
                    *************************************************** W1I14390
                    *             TRANSMIT ENDING CHARACTERS          * W1I14400
                    *************************************************** W1I14410
                    NOMES LD    1 TRANS-T                               W1I14420
                          BSC  L  XMT6,+-    BR IF NOT TRANSPARENT MODE W1I14430
                    *                                                 * W1I14440
                          LD    1 LSDLE-T                               W1I14450
                          BSC  L  XMT5,Z     BR IF LAST CHAR=DLE        W1I14460
                    *                                                 * W1I14470
                          XIO   1 TIMER-T    STOP  THIRD TIMER          W1I14480
                          LD    1 TEND-T                                W1I14490
                          BSC  L  XMT7,Z     BR IF XMIT ETX OR ETB ON   W1I14500
                    *                                                 * W1I14510
                          LD      *                                     W1I14520
                          STO   1 TEND-T     TURN ON TRANSMIT END IND   W1I14530
                          MDX     CKDL1      BR TO WRITE DLE        2-4 W1I14540
                    *                                                 * W1I14550
                    XMT7  SLA     16                                    W1I14560
                          STO   1 TRANS-T    TURN OFF IN TRANS MODE IND W1I14570
                          STO   1 TEND-T     TURN OFF XMIT END IND.     W1I14580
                          LD    1 TBTX-T                                W1I14590
                          BSC  L  XMT8,Z     BR TO WRITE ETX            W1I14600
                    *                                                 * W1I14610
                          LD    1 ETB-T                                 W1I14620
                    XMT84 STO   1 BUF-T      PUT ETB IN BUF             W1I14630
                          BSI  L  CALC       GO CALCULATE BCC           W1I14640
                          MDX     WTBF       BR TO WRITE ETB OR ETX     W1I14650
                    *                                                 * W1I14660
                    XMT8  LD    1 ETX-T      PUT ETX INTO BUF           W1I14670
                          MDX     XMT84      BR TO PUT ETX IN BUF       W1I14680
                    *************************************************** W1I14690
                    *             TRANSMIT BLOCK CHECK CHARACTERS     * W1I14700
                    *************************************************** W1I14710
                    XMT6  LD    1 BCC1-T                                W1I14720
                          BSC  L  LAST8,+-   BR TO WRITE LAST OF BCC    W1I14730
                    *                                                 * W1I14740
                          SLA     16                                    W1I14750
                          STO   1 BCC1-T     TURN OFF BCC1 IND.         W1I14760
                          LD    1 BCCA-T                                W1I14770
                          SLA     8                                     W1I14780
                          STO   1 BUF-T                                 W1I14790
                          MDX     WTBF       GO WRITE FIRST PART OF BCC W1I14800
                    *                                                 * W1I14810
                    LAST8 LD    1 BCCA-T                            2-4 W1I14820
                          STO   1 BUF-T      LOG                    2-7 W1I14830
                          SRA     8          LAST                   2-4 W1I14840
                          SLA     8          8 BITS                 2-4 W1I14850
                          CALL    IOLOG      OF BCC                 2-4 W1I14860
                          XIO   1 WTBUF-T    WRITE 8 LAST OF BCC    2-7 W1I14865
                          XIO   1 LOAD-T     LOAD SYN INTO SYNC REG.    W1I14870
                    *                                                 * W1I14880
                          LD    1 ITBRD-T                           2-6 W1I14890
                          BSC  L  STPD1,+-   BR IF NOT ITB BCC      2-6 W1I14900
                          SLT     32                                2-7 W1I14910
                          STD   1 ITBRD-T    CLEAR ITB READ INDR    2-7 W1I14920
                    *             BCCA             BCC ACCUMULATED  2-7 W1I14930
                          LD      *                                 2-6 W1I14940
                          STO   1 BCC1-T     TURN ON FIRST BCC INDR 2-6 W1I14950
                          STO   1 XMESS-T            XMESS          2-6 W1I14960
                          MDX     INTX3      EXIT TO ILS            2-6 W1I14970
                    *                                                 * W1I14980
                    ENQWT LD    1 ENQ-T                             2-4 W1I14990
                          STO   1 BUF-T      LOG                    2-7 W1I15000
                          CALL    IOLOG      ENQ                    2-4 W1I15010
                          XIO   1 WTBUF-T    WRITE ENQ              2-7 W1I15015
                    STPD1 BSI  L  STPAD      BR TO SET PAD INDR     2-4 W1I15020
                          LD    1 D0008-T                           2-6 W1I15030
                          STO   1 LGS-T      SET LEAD GRAPHS COUNT  2-6 W1I15040
                          BSC  L  STRD       BR TO START READ       2-4 W1I15050
                    *************************************************** W1I15060
                    DLNKT EQU     TIMER      CONSTANT FOR EOT CHECK     W1I15190
                    WACOD EQU     H0080      WACK RCVD ERROR CODE   2-6 W1I15210
                    *************************************************** W1I15220
                    *             TRANSMIT EOT, RETURN TO MONITORING  * W1I15230
                    *************************************************** W1I15240
                    ENDWT XIO   1 WTEOT-T    WRITE EOT              2-4 W1I15250
                          LD    1 EOT-T      LOG                    2-4 W1I15260
                          CALL    IOLOG      EOT                    2-4 W1I15270
                          BSI  L  STPAD      BR TO SET PAD INDR     2-4 W1I15280
                    *                                                   W1I15290
                    GOMON SLT     32                                2-7 W1I15300
                          STO   1 CMODE-T    TURN OFF CONTROL MODE IND. W1I15310
                    GOMO2 STO   1 FCODE-T    SET FCODE ZERO MONITOR     W1I15320
                          STD   1 RTBSY-T    TURN OFF ROUTINE BUSY  2-7 W1I15330
                    *             XMENQ      TURN OFF XMIT ENQ IND  2-7 W1I15340
                          BSC  L  RESYN      BR TO START READ, SET IND. W1I15350
                    *************************************************** W1I15360
                    *             LEADING GRAPHICS COUNT CHECK        * W1I15370
                    *************************************************** W1I15380
                    LGCHK DC      0                                 2-6 W1I15390
                          LD    1 LGS-T      CHECK IF LEADING GRAPH 2-6 W1I15400
                          S     1 D0008-T    WAS RECEIVED BEFORE    2-6 W1I15410
                          BSC  I  LGCHK,+-   NO - BRANCH BACK       2-6 W1I15420
                          MDX     TIMEX      YES - ERROR            2-6 W1I15430
                    *************************************************** W1I15432
                          HDNG     SCAT3- READ RESPONSE FOR TRANSMIT    W1I15440
                    *************************************************** W1I15450
                    *             READ RESPONSE FOR TRANSMIT          * W1I15460
                    *************************************************** W1I15470
                    XMTRD LD    1 LSDLE-T                               W1I15480
                          BSC  L  TRD1,+-    BR IF LAST CHAR NOT A DLE  W1I15490
                    *                                                 * W1I15500
                          SLA     16                                    W1I15510
                          STO   1 LSDLE-T    TURN OFF LAST CHAR=DLE IND W1I15520
                          LD    1 BUF-T      CHECK FOR CORRECT ACK      W1I15530
                          EOR   1 ACK-T                                 W1I15540
                          BSC  L  EOTCK,Z    BR IF NOT CORRECT ACK      W1I15550
                          STO   1 RVIRD-T    CLEAR RVI READ INDR    2-6 W1I15560
                    *                                                 * W1I15570
                    MESSQ LD    1 XMESS-T    CHECK TRANSMIT MESSAGE IND W1I15580
                          BSC  L  STWT2,Z    BR TO ST WRT FOR MESSAGE   W1I15590
                    *                                                 * W1I15600
                    MESQ3 STO   1 RTBSY-T    TURN OFF ROUTINE BUSY      W1I15610
                          XIO   1 ENDOP-T    END OPERATION          2-9 W1I15615
                          XIO   1 STRED-T    INITIATE READ AGAIN    2-9 W1I15616
                          XIO   1 RETIM-T    RESET TIMERS               W1I15620
                    ENQOF SLT     32                                2-7 W1I15630
                          STD   1 TOIND-T    TURN OFF TIMEOUT INDR  2-7 W1I15640
                    *             WRACK      TURN OFF WRONG ACK IND 2-7 W1I15650
                          STO   1 XMENQ-T    TURN OFF TRANSMIT ENQ IND. W1I15660
                          LDD   1 ACK-T                                 W1I15670
                          RTE     16         ALTERNATE                  W1I15680
                          STD   1 ACK-T       ACKNOWLEDGEMENTS          W1I15690
                          BSC  I  INT1       EXIT TO ILS                W1I15700
                    *                                                 * W1I15710
                    STWT2 XIO   1 SYNC-T     START WRITE WITH TIMER     W1I15720
                          LD    1 H0005-T    SET UP TO TRANSMIT     2-3 W1I15730
                          STO   1 SYN5-T      5 SYNS FOR PADDING    2-3 W1I15740
                          MDX     ENQOF      BR TO TURN OFF XMIT ENQ    W1I15750
                    *                                                 * W1I15760
                    EOTCK LDD   1 ACK-T      IS BUF EQUAL OTHER ACK     W1I15770
                          SLT     16                                    W1I15780
                          EOR   1 BUF-T                                 W1I15790
                          BSC  L  OTHER,+-   BR IF EQUAL OTHER ACK      W1I15800
                    *                                                 * W1I15810
                          LD    1 BUF-T                             2-6 W1I15820
                          EOR   1 WACK-T     IS BUF = WACK          2-6 W1I15830
                          BSC  L  RVICK,Z    NO,BRANCH              2-6 W1I15840
                          BSI     LGCHK      CHECK IF LGS BEFORE    2-6 W1I15850
                    *                                               2-6 W1I15860
                          MDX  L  WACNT,+1   INCREMENT WACKS RCVD   2-6 W1I15870
                          NOP                                       2-6 W1I15880
                          LD    1 H0001-T    NO RETRIES WHEN        2-6 W1I15890
                          STO   1 RETRY-T    WACK RECEIVED          2-6 W1I15900
                    *                                               2-6 W1I15910
                          LD    1 WACOD-T    GET WACK RCVD ERR CODE 2-6 W1I15920
                          MDX     TIME1      GO DECRE RETRY         2-6 W1I15930
                    *                                               2-6 W1I15935
                    RVICK EOR   1 WARVI-T                           2-6 W1I15940
                          BSC  L  TIMEX,Z    BR IF NOT RVI          2-6 W1I15950
                          BSI     LGCHK      CHECK IF LGS BEFORE    2-6 W1I15960
                    *                                               2-6 W1I15970
                          LD    1 RVIRD-T    WAS RVI READ BEFORE    2-6 W1I15980
                          BSC  L  OTHER,Z    YES,BR-TREAT AS WR ACK 2-6 W1I15990
                          LD    1 RVICD-T                           2-6 W1I16000
                          STO  I  IOAR       GIVE USER -2           2-6 W1I16010
                          STO   1 RVIRD-T    SET RVI READ INDR      2-6 W1I16020
                          MDX     MESSQ                             2-6 W1I16030
                    *                                               2-6 W1I16035
                    GRAPH LD    1 BUF-T                             2-6 W1I16040
                          EOR   1 SYN-T      BUF = SYN              2-6 W1I16050
                          BSC  I  INT1,+-    ACCEPT SYN IN LG       2-6 W1I16060
                          MDX  L  LGS,-1     NO,DECRE GRAPH COUNT   2-6 W1I16070
                          MDX     INTX4      EXIT TO ILS            2-6 W1I16080
                    *                                               2-6 W1I16085
                    TIMEX MDX  L  MISRV,+1   CNT MSTR INVAL SEQ     2-4 W1I16090
                          NOP                                       2-4 W1I16100
                    TIME0 LD    1 H0200-T    INVALID SEQ ERR CODE   2-4 W1I16110
                    TIME1 STO   1 XMENQ-T    TURN ON TRANSMIT ENQ INDR  W1I16120
                          MDX     ERP2       GO DECRE RETRY COUNTER     W1I16130
                    *                                                 * W1I16140
                    TRD1  LD    1 BUF-T      IS BUF=DLE                 W1I16150
                          EOR   1 DLE-T                                 W1I16160
                          BSC  L  WTDL1,+-   YES, BR TO TURN ON LSDLE   W1I16170
                    *                                                 * W1I16180
                          EOR   1 DLNAK-T    IS BUF = NAK           2-3 W1I16190
                          BSC  L  NONAK,Z    BR IF NOT NAK              W1I16200
                    *                                                 * W1I16210
                          BSI     PDCHK      SET UP FOR PAD CHECK   2-6 W1I16220
                          BSC  L  TIMEX,Z    BR IF PAD NOT OKEY     2-6 W1I16230
                    *                                                 * W1I16240
                    MESOK SLT     32                                2-7 W1I16250
                          STD   1 TOIND-T    TURN OFF TIMEOUT INDR  2-7 W1I16260
                    *             WRACK      TURN OFF WRONG ACK IND 2-7 W1I16270
                          LD    1 XMESS-T                               W1I16280
                          BSC     +-         BR IF XMIT MESSAGE IS ON   W1I16290
                    *                                                 * W1I16300
                          STO   1 XMENQ-T    TURN OFF TRANSMIT ENQ IND  W1I16310
                          LDD     *                                 2-7 W1I16320
                          STD   1 XMESS-T    TURN ON XMIT MESSAGE   2-7 W1I16330
                    *             FIRST      TURN ON FIRST CHAR     2-7 W1I16340
                          SLA     16                                2-4 W1I16350
                          STO   1 COUNT-T    CLEAR CHAR COUNT       2-4 W1I16360
                    *                                                 * W1I16370
                          LD    1 H0400-T    GET NAK RCVD ERROR CODE    W1I16380
                          MDX  L  RETRS,+1   CNT RETRANSMIT REQS    2-4 W1I16390
                          NOP                                       2-4 W1I16400
                    ERP2  BSI  L  ERRCK      GO DECRE RETRY COUNTER     W1I16410
                          BSC  L  GOMON,+-   MONITOR   IF A-REG IS ZERO W1I16420
                          BSC  L  STWT,-     RETRY IF POSITIVE          W1I16430
                    *                                                 * W1I16440
                          LDD   1 ACK-T      ALTERNATE ACKS HERE SO     W1I16450
                          RTE     16         THAT THEY WILL NOT BE OUT  W1I16460
                          STD   1 ACK-T      OF STEP AT EXIT TO ILS TIM W1I16470
                          SLA     16                                    W1I16480
                          STO   1 XMESS-T    TURN OFF XMIT MESSAGE IND  W1I16490
                          MDX     MESQ3      BR TO ACCEPT ERROR         W1I16500
                    *                                                 * W1I16510
                    NONAK EOR   1 DLNKT-T    IS BUF = EOT               W1I16520
                          BSC  L  GRAPH,Z    BR TO CHECK LG IF ANY  2-6 W1I16530
                          BSI     LGCHK      CHECK IF LGS BEFORE    2-6 W1I16540
                    *                                               2-6 W1I16550
                          MDX     SEPC2     **  SKIP EOT PAD CHECK  2-6 W1I16560
                          BSI     PDCHK      SET UP FOR PAD CHECK   2-6 W1I16570
                          BSC  L  TIMEX,Z    BR IF PAD NOT OKEY     2-6 W1I16580
                    *                                                 * W1I16590
                    SEPC2 STO   1 TOIND-T    TURN OFF TIMEOUT INDR      W1I16600
                          STO   1 WRACK-T    TURN OFF WRONG ACK IND     W1I16610
                          STO   1 RVIRD-T    CLEAR RVI READ INDR    2-6 W1I16620
                          BSC  L  RDEOT      BR IF CHAR IS AN EOT       W1I16630
                    *                                                   W1I16640
                    OTHER LD    1 TOIND-T    IF TIMEOUT IND ON,         W1I16650
                          BSC  L  TOION,Z    BR TO CHECK FOR WRONG ACK  W1I16660
                    OTHR3 LD    1 H0100-T    GET WRONG ACK ERR CODE     W1I16670
                          STO   1 WRACK-T    TURN ON WRONG ACK IND      W1I16680
                          MDX     TIME1      BR TO TURN ON XMIT ENQ IND W1I16690
                    *                                                   W1I16700
                    TOION LD    1 WRACK-T    IF NOT WRONG ACK FIRST     W1I16710
                          BSC  L  MESOK,+-   BR TO SEND MESSAGE         W1I16720
                          MDX     OTHR3      BR TO TURN ON XMIT ENQ     W1I16730
                    *************************************************** W1I16740
                          HDNG    SCAT3 - CHECK PAD AFTER EOT/NAK       W1I16750
                    *************************************************** W1I16760
                    *             CHECK PAD AFTER EOT/NAK          2-6* W1I16770
                    *************************************************** W1I16780
                    PDCHK DC      *-*                               2-6 W1I16790
                          LD      *                                 2-6 W1I16800
                          STO   1 PADCK-T    SET PAD CHECK INDR     2-6 W1I16810
                          MDX     INTX4      EXIT TO ILS            2-6 W1I16820
                    *************************************************** W1I16830
                    PDCK1 SLA     16                                2-6 W1I16840
                          STO   1 PADCK-T    TURN OFF PAD CHECK IND 2-6 W1I16850
                          LD    1 BUF-T                             2-6 W1I16860
                          EOR   1 HFF00-T                           2-6 W1I16870
                          SLA     4          CHECK FOR 4 1-BITS     2-6 W1I16880
                          BSC  I  PDCHK      PAD OKEY - RETURN TO   2-6 W1I16890
                    *                        EOT/NAK PROCESS WITH   2-6 W1I16900
                    *                        ZERO IN ACCUMULATOR    2-6 W1I16910
                    *************************************************** W1I16920
                          HDNG    SCAT3 - TIMEOUT FOR TRANSMIT          W1I16930
                    *************************************************** W1I16940
                    *             TIMEOUT INTERRUPT FOR TRANSMIT      * W1I16950
                    *************************************************** W1I16960
                    XMTTM LD    1 TRANS-T                               W1I16970
                          BSC  L  RECTI,+-   BR IF RECEIVE TIMEOUT      W1I16980
                    *                                                   W1I16990
                          XIO   1 TIMER-T    START TIMER            2-6 W1I17000
                          LD    1 H0002-T                               W1I17010
                          STO   1 SYN2-T     TURN ON INSERT 2 SYN IND   W1I17020
                    INTX4 BSC  I  INT1       EXIT TO ILS                W1I17030
                    *                                                   W1I17040
                    RECTI SLA     16                                    W1I17050
                          STO   1 LSDLE-T    TURN OFF LAST CHAR = DLE   W1I17060
                          LD      *                                     W1I17070
                          STO   1 TOIND-T    TURN ON TIMEOUT IND        W1I17080
                          MDX  L  MASTO,+1   COUNT MASTER TIME-OUTS 2-4 W1I17090
                          NOP                                       2-4 W1I17100
                          MDX     TIME0      BR TO SET UP ERR CODE  2-4 W1I17110
                    *************************************************** W1I17120
                          HDNG    SCAT3 - READ RESPONSE FOR MONITOR     W1I17130
                    *************************************************** W1I17140
                    *             READ RESPONSE FOR MONITOR           * W1I17150
                    *************************************************** W1I17160
                    MONRD LD    1 CMODE-T                               W1I17170
                          BSC  L  CNTRL,Z    BR IF IN CONTROL MODE      W1I17180
                    *************************************************** W1I17190
                    *             SCAT3 NOT IN CONTROL MODE           * W1I17200
                    *************************************************** W1I17210
                          LD      ITBSK      IS ITB SKIP ON             W1I17220
                          BSC  L  NOSKP,+-   NO, BR TO CHECK DATA       W1I17230
                    *                                                   W1I17240
                    *             IGNORE 2 CHARACTERS AFTER ITB       * W1I17250
                    *                                                   W1I17260
                          MDX  L  ITBSK,-1   YES, DECRE SKIP COUNT BY 1 W1I17270
                          NOP                                           W1I17280
                    ILS1  BSC  I  INT1       EXIT TO ILS                W1I17290
                    *                                                   W1I17300
                    NOSKP LD      TRNSP                                 W1I17310
                          BSC  L  TDATA,Z    BR TO CHECK TRANS. DATA    W1I17320
                    *************************************************** W1I17330
                    *             NORMAL DATA IS.ON THE LINE          * W1I17340
                    *************************************************** W1I17350
                          LD    1 BUF-T                                 W1I17360
                          EOR   1 SYN-T                                 W1I17370
                          BSC  L  SYNOF,Z    BR IF BUF NOT A SYN        W1I17380
                    *                                                   W1I17390
                    *             SYN SYN MEANS RESET TIMER           * W1I17400
                    *                                                   W1I17410
                          LD      LSSYN      IF LAST CHAR=SYN           W1I17420
                          BSC  L  RTIME,Z    BR TO RESET TIMER          W1I17430
                    *                                                   W1I17440
                          STO   1 LSDLE-T    TURN OFF LAST CHAR=DLE     W1I17450
                          LD      *                                     W1I17460
                          STO     LSSYN      TURN ON LAST CHAR=SYN      W1I17470
                          MDX     ILS1       EXIT TO ILS            2-6 W1I17480
                    *                                                   W1I17490
                    SYNOF SLA     16                                    W1I17500
                          STO     LSSYN      TURN OFF LAST CHAR=SYN     W1I17510
                          LD    1 BUF-T                                 W1I17520
                          EOR   1 STX-T                                 W1I17530
                          BSC  L  CMOF2,+-   BR IF STX                  W1I17540
                    *                                                   W1I17550
                          EOR     H1200      IS BUF=DLE                 W1I17560
                          BSC  L  WTDL1,+-   YES, BR TO TURN ON LSDLE   W1I17570
                    *                                                   W1I17580
                          MDX     TURNQ      NO, BR TO CHECK TURNAROUND W1I17590
                    *************************************************** W1I17600
                    *             TRANSPARENT DATA ON THE LINE        * W1I17610
                    *************************************************** W1I17620
                    TDATA LD    1 LSDLE-T                               W1I17630
                          BSC  L  DLEX,+-    BR IF LAST CHAR NOT DLE    W1I17640
                    *                                                   W1I17650
                    *             IN TRANSPARENT TEXT ALL CONTROL SEQ.* W1I17660
                    *                START WITH DLE                   * W1I17670
                    *                                                   W1I17680
                          LD    1 BUF-T                                 W1I17690
                          EOR   1 SYN-T                                 W1I17700
                          BSC  L  RTIME,+-   DLE SYN, RESET TIMERS      W1I17710
                    *************************************************** W1I17720
                    *             CHECK FOR TURN-AROUND CHARACTER     * W1I17730
                    *************************************************** W1I17740
                    TURNQ LD    1 BUF-T                                 W1I17750
                          EOR   1 EOT-T      IS BUF=EOT                 W1I17760
                          BSC  L  EOTN1,Z    BRANCH IF NOT EOT      2-6 W1I17770
                          MDX     SEPC3     **  SKIP EOT PAD CHECK  2-6 W1I17780
                          BSI     PDCHK      GO SET PAD CHECK INDR  2-6 W1I17790
                          BSC  L  EOTN1,Z    BR IF INVALID PAD      2-6 W1I17800
                    *                                                   W1I17810
                    *             EOT PUTS SCAT3 INTO CONTROL MODE    * W1I17820
                    *                                                   W1I17830
                    SEPC3 LD      *          CHAR = EOT                 W1I17840
                          STO   1 CMODE-T    TURN ON CONTROL MODE       W1I17850
                          MDX     RESYN      BR TO RE-SYNC              W1I17860
                    *                                                   W1I17870
                    EOTN1 LD    1 BUF-T                             2-6 W1I17880
                          EOR   1 NAK-T      IS BUF = NAK           2-6 W1I17890
                          BSC  L  NAKN1,Z    BRANCH IF NOT NAK      2-6 W1I17900
                    *                                                   W1I17910
                          BSI     PDCHK      GO SET PAD CHECK INDR  2-6 W1I17920
                          BSC     +-         SKIP IF INVALID PAD    2-6 W1I17930
                          MDX     RESYN      PAD OK - BR TO RE-SYNC 2-6 W1I17940
                    *                                                   W1I17950
                    NAKN1 LD    1 BUF-T                             2-6 W1I17960
                          EOR   1 ENQ-T      IS BUF = ENQ           2-6 W1I17970
                          BSC  L  RESYN,+-   YES, BR TO RE-SYNC         W1I17980
                    *                                                   W1I17990
                          EOR     H0B00      IS BUF=ETB                 W1I18000
                          BSC  L  RESYN,+-   YES, BR TO RE-SYNC         W1I18010
                    *                                                   W1I18020
                          EOR   1 H2500-T    IS BUF=ETX                 W1I18030
                          BSC  L  RESYN,+-   YES, BR TO RE-SYNC         W1I18040
                    *                                                   W1I18050
                          LD    1 LSDLE-T                               W1I18060
                          BSC  L  ITBQ,+-    BR IF LAST CHAR NOT A DLE  W1I18070
                    *                                                   W1I18080
                          LD    1 BUF-T                                 W1I18090
                          EOR   1 ACKS-T     IS BUF=ACK0                W1I18100
                          BSC  L  RESYN,+-   YES, BR TO RE-SYNC         W1I18110
                    *                                                   W1I18120
                          EOR   1 H1100-T    IS BUF=ACK1                W1I18130
                          BSC  L  RESYN,+-   YES, BR TO RE-SYNC         W1I18140
                    *                                                   W1I18150
                          EOR     H0A00      IS BUF = WACK          2-6 W1I18160
                          BSC  L  RESYN,+-   YES, BR TO RE-SYNC         W1I18170
                    *                                                   W1I18180
                          EOR   1 WARVI-T    IS BUF = RVI           2-6 W1I18190
                          BSC  L  RESYN,+-   YES,BR TO RE-SYNC      2-6 W1I18200
                    *************************************************** W1I18210
                    *             NOT A TURN-AROUND CHARACTER         * W1I18220
                    *************************************************** W1I18230
                    ITBQ  LD    1 BUF-T                                 W1I18240
                          EOR   1 ITB-T      IS BUF=ITB                 W1I18250
                          BSC  L  NOITB,Z    NO,BR AROUND ITB SKIP CNT  W1I18260
                    *                                                   W1I18270
                    *             SKIP 2 CHARACTERS AFTER ITB         * W1I18280
                    *                                                   W1I18290
                          LD    1 H0002-T                           2-3 W1I18300
                          STO     ITBSK      SET ITB SKIP TO 2          W1I18310
                    NOITB MDX     RTIM1      BR TO TURN OFF LSDLE,LSSYN W1I18320
                    *                                                   W1I18330
                    *************************************************** W1I18340
                    NOTME DC      0          ADDRS NOT MEANT FOR ME IND W1I18350
                    LSSYN DC      0          LAST CHAR = SYN IND        W1I18360
                    TRNSP DC      0          TRANSPARENT DATA IND       W1I18370
                    ADDR  DC      0          ADDRS. RCVED IND.          W1I18380
                    ITBSK DC      0          ITB SKIP COUNTER           W1I18390
                    H1100 EQU     DLSOH      CONSTANT FOR ACK1 CHECK    W1I18400
                    H2F00 EQU     STXEQ      CONSTANT FOR ENQ CHECK 2-3 W1I18410
                    H0A00 DC      /0A00      CONSTANT FOR EOT CHECK     W1I18420
                    H1200 DC      /1200      CONSTANT FOR DLE CHECK     W1I18430
                    H0B00 DC      /0B00      CONSTANT FOR ETB CHECK     W1I18440
                    H2500 EQU     ETBTX      CONSTANT FOR ETX CHECK     W1I18450
                    *************************************************** W1I18460
                    *                                                   W1I18470
                    *************************************************** W1I18480
                    *             CONTROL MODE                        * W1I18490
                    *************************************************** W1I18500
                    CNTRL LD    1 BUF-T                                 W1I18510
                          EOR   1 SOH-T      IS BUF = SOH               W1I18520
                          BSC  L  CMOFF,+-   YES, BR TO TURN OFF CMODE  W1I18530
                    *                                                   W1I18540
                          EOR   1 ETX-T      IS BUF = STX               W1I18550
                          BSC  L  CMOF2,+-   YES,BR TO TURN OFF CMODE   W1I18560
                    *                                                   W1I18570
                          EOR   1 H2F00-T    IS BUF = ENQ           2-3 W1I18580
                          BSC  L  CKADR,+-   YES, BR TO CHECK ADDRS.    W1I18590
                    *                                                   W1I18600
                          LD      ADDR       IS ADDR RCVED IND. ON      W1I18610
                          BSC  L  CKPOL,+-   NO, BR TO CHECK POLL, SEL. W1I18620
                    *                                                   W1I18630
                    NTME  STO     NOTME     TURN ON NOT ME IND.         W1I18640
                    *************************************************** W1I18650
                    *             CHECK FOR TURN-AROUND CHARACTER     * W1I18660
                    *************************************************** W1I18670
                          LD    1 BUF-T                                 W1I18680
                          EOR   1 NAK-T      IS BUF =NAK                W1I18690
                          BSC  L  NAKN2,Z    BRANCH IF NOT          2-6 W1I18700
                          BSI  L  PDCHK      GO SET PAD CHECK INDR  2-6 W1I18710
                          BSC     +-         SKIP IF INVALID PAD    2-6 W1I18720
                          MDX     RESYN      PAD OK - BR TO RE-SYNC 2-6 W1I18730
                    *                                                   W1I18740
                    NAKN2 LD    1 BUF-T                             2-6 W1I18750
                          EOR   1 EOT-T      IS BUF = EOT           2-6 W1I18760
                          BSC  L  EOTN2,Z    BR IF NOT EOT          2-6 W1I18770
                          MDX     RESYN     **  SKIP EOT PAD CHECK  2-6 W1I18780
                          BSI  L  PDCHK      GO SET PAD CHECK INDR  2-6 W1I18790
                          BSC     +-         SKIP IF INVALID PAD    2-6 W1I18800
                          MDX     RESYN      PAD OK - BR TO RE-SYNC 2-6 W1I18810
                    *                                                   W1I18820
                    EOTN2 LD    1 LSDLE-T                               W1I18830
                          BSC  L  DLEX,+-    BR IF LAST CHAR NOT A DLE  W1I18840
                    *                                                   W1I18850
                          LD    1 BUF-T                                 W1I18860
                          EOR   1 ACKS-T     IS BUF=ACK0                W1I18870
                          BSC  L  RESYN,+-   YES, BR TO RE-SYNC         W1I18880
                    *                                                   W1I18890
                          EOR   1 H1100-T    IS BUF=ACK1                W1I18900
                          BSC  L  RESYN,+-   YES, BR TO RE-SYNC         W1I18910
                    *                                                   W1I18920
                          EOR     H0A00      IS BUF = WACK          2-6 W1I18930
                          BSC  L  RESYN,+-   YES, BR TO RE-SYNC         W1I18940
                    *                                                   W1I18950
                          EOR   1 WARVI-T    IS BUF = RVI           2-6 W1I18960
                          BSC  L  RESYN,+-   YES,BR TO RE-SYNC      2-6 W1I18970
                    *                                                   W1I18980
                    *             NOT A TURN-AROUND CHARACTER         * W1I18990
                    *                                                   W1I19000
                    DLEX  LD    1 BUF-T                                 W1I19010
                          EOR   1 DLE-T      IS BUF=DLE                 W1I19020
                    *                                                   W1I19030
                          BSC  L  WTDL1,+-   YES, BR TO TURN ON LSDLE   W1I19040
                    *                                                   W1I19050
                          SLA     16                                    W1I19060
                          STO   1 LSDLE-T    TURN OFF LAST CHAR=DLE     W1I19070
                    ILS   BSC  I  INT1       EXIT TO ILS                W1I19080
                    *                                                   W1I19090
                    *************************************************** W1I19100
                    *             DROP CHARACTER PHASE, RE-SYNC       * W1I19110
                    *************************************************** W1I19120
                    RESYN XIO   1 ENDOP-T    END OP                     W1I19130
                          XIO   1 STRED-T    START READ                 W1I19140
                          SLA     16                                    W1I19150
                          STO     TRNSP      TURN OFF TRANSPARENT IND.  W1I19160
                          MDX     CMOP2      BR TO TURN OFF MORE INDRS  W1I19170
                    *                                                   W1I19180
                    CMOF2 LD    1 LSDLE-T    IF LAST CHAR = DLE         W1I19190
                          STO     TRNSP      TURN ON TRANSPARENT IND.   W1I19200
                    *************************************************** W1I19210
                    *             TURN OFF CONTROL MODE               * W1I19220
                    *************************************************** W1I19230
                    CMOFF SLA     16                                    W1I19240
                          STO   1 CMODE-T    TURN OFF CONTROL MODE IND. W1I19250
                    CMOP2 STO     ITBSK      TURN OFF ITB SKIP INDR     W1I19260
                          STO     ADDR       TURN OFF ADDR RCVED IND.   W1I19270
                          STO     NOTME      TURN OFF NOT ME IND.       W1I19280
                    RTIME XIO   1 RETIM-T    RESET TIMERS               W1I19290
                    RTIM1 SLA     16                                    W1I19300
                          STO   1 LSDLE-T    TURN OFF LAST CHAR=DLE IND W1I19310
                          STO     LSSYN      TURN OFF LAST CHAR=SYN IND W1I19320
                          MDX     ILS        EXIT TO ILS                W1I19330
                    *************************************************** W1I19340
                    *             CHECK FOR POLLING, SELECTION ADDRESS* W1I19350
                    *************************************************** W1I19360
                    CKPOL LD    1 BUF-T                                 W1I19370
                          EOR   1 POLLA-T    IS BUF = POLLING ADDRESS   W1I19380
                          BSC  L  YSPOL,+-   YES, BR TO TURN ON ADDRS.  W1I19390
                    *                                                   W1I19400
                          LD    1 BUF-T                                 W1I19410
                          EOR   1 SELA-T     IS BUF=SELECTION ADDRESS   W1I19420
                          BSC  L  NTME,Z     NO, BR TO CHECK TURNAROUND W1I19430
                    *                                                   W1I19440
                          LD      *                                     W1I19450
                    POLEX STO     ADDR       SET ADDR NEGATIV FOR SELA  W1I19460
                          MDX     ILS        EXIT TO ILS                W1I19470
                    *                                                   W1I19480
                    YSPOL LD      *          SET ADDR POSITIVE FOR POLL W1I19490
                          MDX     POLEX      BR TO STORE AND EXIT       W1I19500
                    *************************************************** W1I19510
                    *             ENQ JUST RECEIVED                   * W1I19520
                    *************************************************** W1I19530
                    CKADR LD      NOTME      IF NOT ME IS ON,           W1I19540
                          BSC  L  RESYN,Z    BR TO RE-SYNC              W1I19550
                    *                                                   W1I19560
                          LD      ADDR       IF ADDR NOT ON, + OR -     W1I19570
                          BSC  L  RESYN,+-   BR TO RE-SYNC              W1I19580
                    *                                                   W1I19590
                          BSC  L  ADDRP,-    BR TO ADDR IS POSITIVE     W1I19600
                    *************************************************** W1I19610
                    *             SELECTION ADDRESS WAS RECEIVED      * W1I19620
                    *************************************************** W1I19630
                          MDX  L  *-*,+1     ADD 1 TO SELECT IND        W1I19640
                    SELI  EQU     *-1        TELL USER OF SELECTION     W1I19650
                          LD    1 FCODE-T    IF FCODE FOR RECEIVE,      W1I19660
                          BSC  L  NOTMN,+Z   BR TO DISCONTINUE MONITOR  W1I19670
                    *                                                   W1I19680
                          LD      *                                     W1I19690
                          STO   1 XNAK-T     TURN ON XMIT NAK IND.      W1I19700
                    ADDRS STO   1 MNBSY-T    SET MONITOR BUSY INDR  2-5 W1I19710
                    ADRS1 SLA     16                                    W1I19720
                          STO     ADDR       CLEAR ADDR RCVED IND.      W1I19730
                          BSC  L  STWT       BR TO START WRITE          W1I19740
                    *************************************************** W1I19750
                    *             POLLING ADDRESS WAS RECEIVED        * W1I19760
                    *************************************************** W1I19770
                    ADDRP MDX  L  *-*,+1     ADD 1 TO POLL IND          W1I19780
                    POLLI EQU     *-1        TELL USER OF POLLING       W1I19790
                          LD    1 FCODE-T                               W1I19800
                          BSC  L  NOTMN,-Z   BR TO DISCONTINUE MONITOR  W1I19810
                    *                                                   W1I19820
                          LD      *                                     W1I19830
                          STO   1 XEOT-T     TURN ON XMIT EOT IND       W1I19840
                          MDX     ADDRS      BR TO CLEAR ADDR AND WRITE W1I19850
                    *                                                   W1I19860
                    NOTMN SLA     16                                    W1I19870
                          STO   1 MONIT-T    TURN OFF MONIT IND         W1I19880
                          MDX     ADRS1      BR TO CLEAR ADDR AND WRITE W1I19890
                    *************************************************** W1I19900
                          HDNG    SCAT3 - WRITE RESPONSE FOR MONITOR    W1I19910
                    *************************************************** W1I19920
                    *             WRITE RESPONSE FOR MONITOR          * W1I19930
                    *************************************************** W1I19940
                    MONWT BSI  L  PADIN      GO WRITE PRECEEDING SYNS   W1I19950
                          LD    1 XNAK-T                                W1I19960
                          BSC  L  CLEOT,+-   BR IF XMIT-NAK NOT ON      W1I19970
                    *                                                   W1I19980
                    CLNAK LD    1 NAK-T                             2-4 W1I19990
                          STO   1 BUF-T      LOG                    2-7 W1I20000
                          CALL    IOLOG      NAK                    2-4 W1I20010
                          XIO   1 WTBUF-T    WRITE NAK              2-7 W1I20015
                          BSI  L  STPAD                             2-4 W1I20020
                          STO   1 XNAK-T     TURN OFF XMIT-NAK INDR 2-3 W1I20030
                          STO   1 MNBSY-T    RESET MONITOR BUSY INDR2-5 W1I20040
                          BSC  L  STRD       BR TO START READ       2-3 W1I20050
                    *************************************************** W1I20060
                          HDNG    SCAT3 - TIMEOUT FOR MONITOR           W1I20070
                    *************************************************** W1I20080
                    *             TIMEOUT FOR MONITOR                 * W1I20090
                    *************************************************** W1I20100
                    MONTM SLA     16                                    W1I20110
                          STO   1 CMODE-T    TURN OFF CONTROL MODE      W1I20120
                          MDX  L  MONTO,+1   COUNT MONITOR T.O.     2-4 W1I20130
                          NOP                                       2-4 W1I20140
                          MDX     RESYN      BR TO RE-SYNC, TURN OFF    W1I20150
                    *************************************************** W1I20160
                          END                                           W1I20170
