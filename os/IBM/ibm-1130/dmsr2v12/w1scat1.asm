                          HDNG    SCAT1 **** CALL PROCESSING *********  W1F00010
                    *************************************************** W1F00020
                    *     1130 SYNCHRONOUS COMMUNICATIONS ADAPTER     * W1F00030
                    * TITLE - SCAT1                                   * W1F00040
                    * STATUS-VERSION 2, MODIFICATION 9                * W1F00050
                    * FUNCTION/OPERATION - SCAT1 CAN PERFORM THE      * W1F00060
                    *  FOLLOWING FUNCTIONS                            * W1F00070
                    *  1. TEST - SCAT1 TESTS A PROGRAMMED DEVICE RTN. * W1F00080
                    *            BUSY INDICATOR.                      * W1F00090
                    *  2. OPEN WITH DATA OUT - SCAT1 ESTABLISHES SYNCH* W1F00100
                    *            RONISM BY HANDSHAKING, TRANSMITS THE * W1F00110
                    *            INQUIRY SEQUENCE. RECEIPT OF POSITIVE* W1F00120
                    *            ACKNOWLEDGEMENT COMPLETES FUNCTION.  * W1F00130
                    *  3. OPEN WITH DATA IN - SCAT1 ESTABLISHES SYNCH-* W1F00140
                    *            RONISM BY HANDSHAKING, AND CONTINUES * W1F00150
                    *            HANDSHAKING UNTIL AN INQUIRY IS RCVED* W1F00160
                    *            RECEIPT OF INQUIRY COMPLETES FUNCTION* W1F00170
                    *  4. TRANSMIT DATA - SCAT1 TRANSMITS A START-OF- * W1F00180
                    *            RECORD SEQUENCE FOLLOWED BY THE      * W1F00190
                    *            MESSAGE IN THE I/O AREA AND THE      * W1F00200
                    *            PROGRAM GENERATED LONGITUDINAL       * W1F00210
                    *            REDUNDANCY CHECK. RECEIPT OF THE     * W1F00220
                    *            PROPER POSITIVE ACKNOWLEDGEMENT COMP-* W1F00230
                    *            LETES FUNCTION.                      * W1F00240
                    *  5. TRANSMIT EOT - SCAT1 TRANSMITS EOT. RECEIPT * W1F00250
                    *            OF EOT COMPLETES FUNCTION.           * W1F00260
                    *  6. TRANSMIT TEL - SCAT1 TRANSMITS TEL. RECEIPT * W1F00270
                    *            OF TEL COMPLETES FUNCTION.           * W1F00280
                    *  7. ACKNOWLEDGE AND RECEIVE - SCAT1 TRANSMITS   * W1F00290
                    *            AN ACKNOWLEDGEMENT AND RCVES A DATA  * W1F00300
                    *            RECORD,A TEL SEQUENCE, OR AN EOT SEQ.* W1F00310
                    *            IF TEL OR EOT IS RECEIVED, TEL OR EOT* W1F00320
                    *            IS TRANSMITTED. RECEIPT OF DATA REC. * W1F00330
                    *            OR EOT COMPLETES FUNCTION.           * W1F00340
                    *  8. AUTO ANSWER ENABLE - SCAT1 ENABLES THE AUTO * W1F00350
                    *            ANSWER INTERRUPT.                    * W1F00360
                    *  9. AUTO ANSWER DISABLE - SCAT1 DISABLES AUTO   * W1F00370
                    *            ANSWER INTERRUPT.                    * W1F00380
                    *  10. ALARM ON - SCAT1 TURNS ON THE AUDIBLE ALARM* W1F00390
                    *  11. ALARM OFF - SCAT1 TURN OFF AUDIBLE ALARM.  * W1F00400
                    *  12. CLOSE - SCAT1 ENDS ALL S.C.A. OPERATIONS,  * W1F00410
                    *            RESETS SOME PROGRAM INDICATORS TO    * W1F00420
                    *            THEIR INITIAL CONDITION.             * W1F00430
                    *  13. ERROR STATISTICS - SCAT1 MAINTAINS AN   2-4* W1F00431
                    *            8-WORD LOG OF ERROR STATISTICS.   2-4* W1F00432
                    *            REFER TO SRL FOR COMPLETE         2-4* W1F00433
                    *            DESCRIPTION FORM C26-3706         2-4* W1F00434
                    *  14. LOGGING -SCAT1 PROVIDES THE POSSIBILITY 2-4* W1F00435
                    *            FOR A USER-WRITTEN PROGRAM TO LOG 2-4* W1F00436
                    *            ALL CHARACTERS RECEIVED OR TRANS- 2-4* W1F00437
                    *            MITTED,TIMEOUTS AND FUNCTION CODE 2-4* W1F00438
                    *            REFER TO SRL FOR COMPLETE         2-4* W1F00439
                    *            DESCRIPTION FORM C26-3706         2-4* W1F00440
                    * ENTRY POINTS - .SCAT1.CALL ENTRANCE,LIBF SCAT1  * W1F00441
                    *                .INT1. INTERRUPT ENTRANCE, BSI   * W1F00450
                    *            FROM INTERRUPT LEVEL 1 SUBROUTINE.   * W1F00460
                    * INPUT - FOUR-OF-EIGHT CODE, UNPACKED, LEFT-JUSTI* W1F00470
                    *            FIED STARTING AT IOAR+1.             * W1F00480
                    * OUTPUT - SAME AS INPUT.                         * W1F00490
                    * EXTERNAL ROUTINES - IOLOG/CPLOG              2-4* W1F00500
                    * EXITS-NORMAL - .RET. RETURN TO MAINLINE LIBF+2  * W1F00510
                    *            LIBF+3, OR LIBF+4 DEPENDING UPON     * W1F00520
                    *            FUNCTION.                            * W1F00530
                    *                .INT1. INDIRECT, RETURN TO ILS01.* W1F00540
                    *      -ERROR  - WORD 41 -PRE-OPERATIVE ERROR HALT* W1F00550
                    *                 .USERR. BSI TO USERS ERROR RTN. * W1F00560
                    *            ON ALL POST-OPERATIVE ERRORS.        * W1F00570
                    * TABLES/WORK AREAS - THE MAJORITY OF CONSTANTS   * W1F00580
                    *            AND SWITCHES USED IN SCAT1 FOLLOW .T.* W1F00590
                    *            AND ARE ACCESSED IN REFERENCE TO .T. * W1F00600
                    * ATTRIBUTES - REUSABLE                           * W1F00610
                    * NOTES -                                         * W1F00620
                    *             SCAT1 IS AN INTERRUPT SERVICE SUBR. * W1F00630
                    *             IT IS CALLED BY .LIBF SCAT1.        * W1F00640
                    *             THESE FUNCTIONS ARE AVAILABLE       * W1F00650
                    *                     1. TEST                     * W1F00660
                    *                     2. OPEN WITH DATA OUT       * W1F00670
                    *                     3. OPEN WITH DATA IN        * W1F00680
                    *                     4. TRANSMIT DATA            * W1F00690
                    *                     5. TRANSMIT EOT SEQUENCE    * W1F00700
                    *                     6. TRANSMIT TEL SEQUENCE    * W1F00710
                    *                     7. ACKNOWLEDGE AND RECEIVE  * W1F00720
                    *                     8. AUTO ANSWER ENABLE       * W1F00730
                    *                     9. AUTO ANSWER DISABLE      * W1F00740
                    *                    10. ALARM ON                 * W1F00750
                    *                    11. ALARM OFF                * W1F00760
                    *                    12. CLOSE                    * W1F00770
                    *                    13. ERROR STATISTICS      2-4* W1F00775
                    *************************************************** W1F00780
                    *                                                   W1F00790
                          LIBR                                          W1F00800
                    1130  ISS  08 SCAT1     1                           W1F00810
                    *                                                   W1F00820
                    *************************************************** W1F00830
                    *             CALL ENTRANCE                         W1F00840
                    *             THE GENERAL CALLING SEQUENCE IS       W1F00850
                    *                    LIBF  SCAT1                    W1F00860
                    *                    DC    /XXXX   CONTROL PARAM.   W1F00870
                    *                    DC    IOAR    I/O AREA ADDRESS W1F00880
                    *                    DC    ERROR   ERROR RTN. ADDR. W1F00890
                    *             REFER TO THE SRL TO FIND WHICH PARA-  W1F00900
                    *                   METERS ARE NECESSARY WITH       W1F00910
                    *                   WHICH FUNCTIONS.                W1F00920
                    *************************************************** W1F00930
                    *                                                   W1F00940
                    SCAT1 STX   1 XR1+1      CALL ENTRANCE         (+0) W1F00950
                          LDX  I1 *-*        XR1= CALL ADDRESS+1   (+2) W1F00960
                          MDX     PROC       BR. TO PROCESS CALL        W1F00970
                    *                                                   W1F00980
                    *************************************************** W1F00990
                    *             INTERRUPT ENTRANCE                    W1F01000
                    *             THE INTERRUPT LEVEL SUBROUTINE FOR    W1F01010
                    *             LEVEL 1 WILL DO A BSI TO .INT1. WHEN  W1F01020
                    *             THERE IS AN ADAPTER INTERRUPT.        W1F01030
                    *************************************************** W1F01040
                    *                                                   W1F01050
                    INT1  DC      0          INTERRUPT ENTRANCE    (+4) W1F01060
                          BSC  L  INT2       GO PROCESS INTERRUPT       W1F01070
                    *                                                   W1F01080
                    *************************************************** W1F01090
                    *             CONSTANTS   ************              W1F01100
                    *************************************************** W1F01110
                    *                                                   W1F01120
                    H6FFF DC      /6FFF      FOR MODIFYING MDX          W1F01130
                    AQ    BSS  E  2          FOR ACC AND EXT            W1F01140
                    H7005 DC      /7005      MAXIMUM MDX                W1F01150
                    H7002 DC      /7002      FOR MODIFYING MDX          W1F01160
                    RCVR  DC      RCR        ADDR OF RCV READ PROCESS   W1F01170
                    RCVW  DC      RCW                    WRITE PROCESS  W1F01180
                    RCVT  DC      RCTIM                  TIMEOUT PROC   W1F01190
                    *                                                   W1F01200
                    *************************************************** W1F01210
                    *             THIS PORTION OF THE SCAT1 SUBROUTINE  W1F01220
                    *             WILL PROCESS THE CALLING SEQUENCE.    W1F01230
                    *************************************************** W1F01240
                    *                                                   W1F01250
                    PROC  STD     AQ         SAVE                       W1F01260
                          STS     STAT                                  W1F01270
                          STX   2 XR2B+1                                W1F01280
                          LDX  L2 T          T=BASE ADDR OF CONSTANTS   W1F01290
                          LD    1 0          CONTROL PARAMETER          W1F01300
                          SRA     12         FUNCTION CODE              W1F01310
                          BSC  L  NTEST,Z    BRANCH IF NOT TEST         W1F01320
                          LD    2 RTBSY-T    TEST FUNCTION              W1F01330
                          BSC     +-         SKIP IF BUSY               W1F01340
                    EXIT  MDX   1 +1         0=NOT BUSY, LIBF+3         W1F01350
                          MDX   1 +1         +-=BUSY, LIBF+2            W1F01360
                          LDD     AQ         RESTORE                    W1F01370
                          STX   1 RET+1      SET UP EXIT BRANCH         W1F01380
                    STAT  LDS     0          RESTORE                    W1F01390
                    XR1   LDX  L1 *-*                                   W1F01400
                    XR2B  LDX  L2 *-*                                   W1F01410
                    RET   BSC  L  *-*        RETURN TO MAINLINE         W1F01420
                    *                                                   W1F01430
                    CKTAB SRA     1          IS IT FUNCTION CODE 7  2-2 W1F01440
                          BSC  L  ER1,Z      *IF NOT BRANCH         2-2 W1F01450
                          LD    2 TABCT-T    GET STATISTIC TBL ADDR 2-2 W1F01460
                          STO  I1 1          ADDR FOR ST IN PARAM 2 2-2 W1F01470
                          MDX     EXIT       EXIT TO LIBF+3         2-2 W1F01480
                    *                                                   W1F01490
                    *************************************************** W1F01500
                    *             PRE-OPERATIVE ERRORS                  W1F01510
                    *                CAUSE AN EXIT TO CORE LOCATION 41. W1F01520
                    *************************************************** W1F01530
                    *                                                   W1F01540
                    ER1   LD      H8001      ERROR IN CALLING SEQUENCE  W1F01550
                          MDX   1 -1                                    W1F01560
                          STX  L1 $PRET      ADDR OF LIBF INTO 40       W1F01570
                          LDX   1 $PRET+1    SYSTEM HALT IS AT 41       W1F01580
                    $PRET EQU     40         PRE-OPERATIVE ERROR TRAP   W1F01590
                          MDX     STAT-1     RESTORE AND EXIT           W1F01600
                    *                                                   W1F01610
                    ER2   LD      H8002      RCV OR XMIT NOT CMPLT      W1F01620
                          MDX     ER1+1      SET UP EXIT TO 41          W1F01630
                    *                                                   W1F01640
                    ER3   LD      H8003      SYNC NOT ESTABLISHED YET   W1F01650
                          MDX     ER1+1      SET UP EXIT TO 41          W1F01660
                    *                                                   W1F01670
                    *                                                   W1F01680
                    *                                                   W1F01690
                    H8001 DC      /8001      ERR CODE - BAD CALL        W1F01700
                    H8002 DC      /8002      ERR CODE - NOT CMPLT       W1F01710
                    H8003 DC      /8003      ERR CODE - NO SYNC, INQ    W1F01720
                    *                                                   W1F01730
                    *************************************************** W1F01740
                    *             CONTINUE CALL PROCESSING              W1F01750
                    *************************************************** W1F01760
                    *                                                   W1F01770
                    NTEST A       H6FFF      SET UP MDX TO FUNCTION     W1F01780
                          STO     BRNCH           TYPE 1-3              W1F01790
                          S       H7005                                 W1F01800
                          BSC  L  CKTAB,Z-   BR TO CHECK FOR CODE 7 2-2 W1F01810
                          A       H7002                                 W1F01820
                          STO     BRAN       MDX TO FUNCTION  4-6       W1F01830
                    *                                                   W1F01840
                          LD    1 0          CONTROL PARAMETER          W1F01850
                          CALL    CPLOG      LOG CONTROL PARAMETER  2-2 W1F01860
                          SLA     12         DIGIT 4                    W1F01870
                    *                          FOR AUTOA ENABLE/DISABLE W1F01880
                    *                          FOR ALARM ON/OFF         W1F01890
                    BRNCH MDX     BRNCH      MODIFIED BY FUNCTION CODE  W1F01900
                          MDX     AUTOA      AUTO ANSWER     CODE 1     W1F01910
                          MDX     ALARM      ALARM           CODE 2     W1F01920
                          MDX     CLOSE      CLOSE           CODE 3     W1F01930
                          BSC     +-Z        FALL THROUGH               W1F01940
                          NOP                     ON CODES 4, 5, 6      W1F01950
                    TEST  LD    2 RTBSY-T                               W1F01960
                          BSC  L  TEST,Z     LOOP IF RTN IS BUSY        W1F01970
                          LD    1 1                                     W1F01980
                          STO   2 IOAR-T     SAVE I/O AREA ADDRESS      W1F01990
                          LD    1 2          SAVE ERROR ADDRESS         W1F02000
                          STO     USERR                                 W1F02010
                          LD    1 0          CONTROL PARAMETER          W1F02020
                          AND     H00F0      DIGIT 3 FOR ILRC           W1F02030
                          STO   2 ILRC-T     TURN ON ILRC IF REQUESTED  W1F02040
                          LD   I  IOAR                                  W1F02050
                          STO   2 WDCNT-T    SAVE WORD COUNT            W1F02060
                    BRAN  MDX     BRAN       MODIFIED BY FUNCTION CODE  W1F02070
                          MDX     OPEN       OPEN            CODE 4     W1F02080
                          MDX     XMIT       TRANSMIT        CODE 5     W1F02090
                    *                                                   W1F02100
                    *************************************************** W1F02110
                    *                                                   W1F02120
                    *             ACKNOWLEDGE AND RECEIVE FUNCTION      W1F02130
                    *                                                   W1F02140
                    *************************************************** W1F02150
                          LD    2 INQR-T                                W1F02160
                          BSC  L  ER3,+-     BR IF NO INQ YET           W1F02170
                          LD    2 WDCNT-T                               W1F02180
                          BSC  L  ER1,+      BR IF WORD COUNT INVALID   W1F02190
                    *             SET UP RESPONSE ADDRESSES FOR         W1F02200
                    *                SERVICING INTERRUPTS               W1F02210
                          LD      RCVR                                  W1F02220
                          STO   2 RDF-T                                 W1F02230
                          LD      RCVW                                  W1F02240
                          STO   2 WTF-T                                 W1F02250
                          LD      RCVT                                  W1F02260
                          STO   2 TIMF-T                                W1F02270
                    *                                                   W1F02280
                          SLA     16                                    W1F02290
                          STO   2 TOIND-T    CLEAR TIMEOUT INDICATOR    W1F02300
                          STO   2 TOCNT-T    CLEAR TIMEOUT COUNTER      W1F02310
                          LD    1 0                                     W1F02320
                          AND     H0F00      WHAT TYPE OF RESPONSE      W1F02330
                          BSC  L  POS,+-     BR IF POSITIVE RESPONSE    W1F02340
                          STO   2 XERR-T     TURN ON XMIT-ERR           W1F02350
                          LD    2 D000X-T   NUMBER OF IDLES TO      2-2 W1F02360
                          STO   2 IDLCT-T   PROCEED TRANSMISSION    2-2 W1F02370
                    RCVX  LD    2 NOCOD-T    GET CHG. OF DIR. IND.  2-2 W1F02380
                          BSC     Z          SKIP ON XMIT           2-2 W1F02390
                          MDX     RCVX       LOOP ON NON-XMIT       2-2 W1F02400
                          XIO   2 STWRT-T    START WRITE            2-2 W1F02410
                          LD    2 D0007-T    7 RETRYS                   W1F02420
                          STO   2 RETRY-T    RETRY = 7                  W1F02430
                          STO   2 RTBSY-T    TURN ON ROUTINE BUSY       W1F02440
                          STO   2 FAIL-T     TURN ON FAIL IND           W1F02450
                          SLA     16                                    W1F02460
                          STO   2 CLTM-T     TURN OFF LOAD CL IND       W1F02470
                          MDX   1 +3         EXIT TO LIBF+4             W1F02480
                          MDX     EXIT+2     GO TO RESTORE AND EXIT     W1F02490
                    *                                                   W1F02500
                    POS   LD      *                                     W1F02510
                          STO   2 XACK-T     TURN ON XMIT-ACK           W1F02520
                          LDD   2 ACK-T      NEXT SOR TO RECEIVE        W1F02530
                          RTE     16                                    W1F02540
                          STD   2 ACK-T      NEXT ACK TO TRANSMIT       W1F02550
                          MDX     RCVX-2    GOTO START WRITE        2-2 W1F02560
                    *************************************************** W1F02570
                    *             AFTER PROCESSING THE CALLING SEQUENCE W1F02580
                    *             FOR THE .RECEIVE. FUNCTION, THE       W1F02590
                    *             FOLLOWING INDICATORS ARE SET          W1F02600
                    *                                                   W1F02610
                    *                   .WDCNT. ON   MAX. RECORD LENGTH W1F02620
                    *                   .RTBSY. ON   ROUTINE BUSY       W1F02630
                    *                   .ILRC.  ON/OFF                  W1F02640
                    *                  .RETRY.   SET TO 3               W1F02650
                    *               FOR POSITIVE ACKNOWLEDGMENT,        W1F02660
                    *                   .XACK.  ON   TRANSMIT ACK       W1F02670
                    *                  .ACK.     SWITCH FR 1-2 OR 2-1   W1F02680
                    *               FOR NEGATIVE ACKNOWLEDGEMENT,       W1F02690
                    *                   .XERR.  ON   TRANSMIT ERR       W1F02700
                    *************************************************** W1F02710
                    *************************************************** W1F02720
                    *                                                   W1F02730
                    *                        AUTO ANSWER                W1F02740
                    *                                                   W1F02750
                    *************************************************** W1F02760
                    AUTOA BSC  L  ENABL,+-   BR IF ENABLE               W1F02770
                          XIO     DISAA      DISABLE                    W1F02780
                          MDX     EXIT+1     GOTO RESTORE AND EXIT      W1F02790
                    ENABL LD    1 1                                     W1F02800
                          STO     ANS        FOR INDICATION OF AUTO ANS W1F02810
                          XIO     ENAA       ENABLE                     W1F02820
                          MDX     EXIT       GOTO RESTORE AND EXIT      W1F02830
                    *************************************************** W1F02840
                    *                                                   W1F02850
                    *                        AUDIBLE ALARM              W1F02860
                    *                                                   W1F02870
                    *************************************************** W1F02880
                    ALARM BSC  L  OFF,Z      BRANCH IF OFF              W1F02890
                          XIO     ALON       ALARM ON                   W1F02900
                          MDX     EXIT+1     GOTO RESTORE AND EXIT      W1F02910
                    OFF   XIO     ALOFF      ALARM OFF                  W1F02920
                          MDX     EXIT+1     GOTO RESTORE AND EXIT      W1F02930
                    *                                                   W1F02940
                    *************************************************** W1F02950
                    *             CONSTANTS                             W1F02960
                    *************************************************** W1F02970
                          BSS  E  0                                     W1F02980
                    ALON  DC      0          ALARM ON                   W1F02990
                          DC      /5102          IOCC                   W1F03000
                    USERR EQU     ALON       USER ERROR ADDRESS         W1F03010
                    ALOFF DC      /00F0      ALARM OFF                  W1F03020
                          DC      /5101          IOCC                   W1F03030
                    H00F0 EQU     ALOFF      CONSTANT  00F0             W1F03040
                    ENAA  DC      0          ENABLE AUTO ANSWER         W1F03050
                          DC      /5480          IOCC                   W1F03060
                    ANS   EQU     ENAA       ADDR FOR ANSWER INDICATOR  W1F03070
                    SEND  DC      /0F00      SEND-RCV RUN TR. ON        W1F03080
                          DC      /5601          IOCC                   W1F03090
                    H0F00 EQU     SEND       CONSTANT  0F00             W1F03100
                    RCVTR DC      XMR        SEND-RCV RUN TR. OFF       W1F03110
                          DC      /5602          IOCC                   W1F03120
                    *                                                   W1F03130
                    *                                                   W1F03140
                    *************************************************** W1F03150
                    *                                                   W1F03160
                    *                        END OPERATION              W1F03170
                    *                                                   W1F03180
                    *************************************************** W1F03190
                    CLOSE XIO     ENDOP      END SCA OPERATION          W1F03200
                          LD    2 WD17-T                            2-4 W1F03210
                          BSC  L  CL4A-2,+-  BR IF 17 HAS BEEN DECRE.   W1F03220
                          MDX  L  $SCAT,-1   DECREMENT IOCT COUNTER 2-4 W1F03230
                          NOP                                           W1F03240
                          SLA     16                                    W1F03250
                          STO   2 WD17-T     TURN OFF IND. FOR 17   2-4 W1F03260
                          LDX   2 +15                               2-9 W1F03270
                          SLA     16                                    W1F03280
                    CL4A  STO  L2 TAB4-1     RESET INDICATORS           W1F03290
                          MDX   2 -1                                    W1F03300
                          MDX     CL4A                                  W1F03310
                          MDX     OFF+1      GOTO RESTORE AND EXIT      W1F03320
                    *                                                   W1F03330
                    *                                                   W1F03340
                    *************************************************** W1F03350
                    *                                                   W1F03360
                    *                        OPEN                       W1F03370
                    *                                                   W1F03380
                    *************************************************** W1F03390
                    OPEN  LD    2 RCVCM-T                               W1F03400
                          BSC  L  ER2,Z      BR IF RCV OR XMIT NOT COMP W1F03410
                          LDD     ACKS                                  W1F03420
                          STD     ACK        INIT. TO SOR2, ACK2        W1F03430
                          LD    1 0          CONTROL PARAMETER          W1F03440
                          SLA     12         DIGIT 4 FOR DATA IN/OUT    W1F03450
                          STO   2 TYPE-T     IN OR OUT                  W1F03460
                          BSC  L  DIN,+-     BRANCH IF DATA IN          W1F03470
                          STO   2 XINQ-T     TURN ON XMIT-INQ           W1F03480
                          XIO     SEND       TURN ON SEND-RCV RUN TR.   W1F03490
                    DIN2  XIO   2 ENDOP-T    END OPERATION              W1F03500
                          SLA     16                                    W1F03510
                          STO   2 SYNCI-T    SYNC. IND. OFF             W1F03520
                          STO   2 INQR-T     INQ RECEIVED OFF           W1F03530
                    *             SET UP RESPONSE ADDRESSES FOR         W1F03540
                    *                SERVICING INTERRUPTS               W1F03550
                          LD    2 OPENR-T                               W1F03560
                          STO     RDF                                   W1F03570
                          LD    2 OPENW-T                               W1F03580
                          STO     WTF                                   W1F03590
                          LD    2 OPENT-T                               W1F03600
                          STO     TIMF                                  W1F03610
                          STD   2 LCNTL-T    TURN ON LEADER CONTROL 2-9 W1F03620
                    *             XEOI       TURN ON XMIT-EOI       2-9 W1F03630
                          XIO     LOAD       LOAD IDLE TO SYNC-REG      W1F03640
                          XIO     SYNC       SEND IDLES                 W1F03650
                          LD    2 WD17-T                            2-4 W1F03660
                          BSC  L  RCVX+4,Z   BR IF 17 HAS BEEN DECRE.   W1F03670
                          MDX  L  $SCAT,+1   INCREMENT IOCT COUNTER 2-4 W1F03680
                          NOP                                           W1F03690
                          MDX  L  WD17,+1    TURN ON IND.FOR 17     2-4 W1F03700
                          MDX     RCVX+4     GO TO SET RETRY TO 3   2-2 W1F03720
                    *                                                   W1F03730
                    DIN   XIO     RCVTR      TURN OFF SEND-RCV RUN TR.  W1F03740
                          LDD     ACK                                   W1F03750
                          RTE     16         RECEIVE TRANSMITS ACK2     W1F03760
                          STD     ACK        FIRST                      W1F03770
                          MDX     DIN2       CONTINUE PROCESSING OPEN   W1F03780
                    *                                                   W1F03790
                    *************************************************** W1F03800
                    *                                                   W1F03810
                    *             AFTER PROCESSING THE CALLING SEQUENCE W1F03820
                    *             FOR THE OPEN FUNCTION, THE FOLLOWING  W1F03830
                    *             INDICATORS ARE SET                    W1F03840
                    *             --NOTE--                              W1F03850
                    *                ON CONDITION IS NON-ZERO.          W1F03860
                    *                OFF CONDITION IS ZERO.             W1F03870
                    *                                                   W1F03880
                    *             .OPEN, DATA OUT.                      W1F03890
                    *                   .TYPE.  ON     DATA OUT         W1F03900
                    *                   .XINQ.  ON     TRANSMIT INQ     W1F03910
                    *                  .ACK.     ACK2/ACK1              W1F03920
                    *             .OPEN, DATA IN                        W1F03930
                    *                   .TYPE.  OFF    DATA IN          W1F03940
                    *                  .ACK.     ACK1/ACK2              W1F03950
                    *             .OPEN.                                W1F03960
                    *                   .SYNCI. OFF    SYNC ESTABLISHED W1F03970
                    *                   .INQR.  OFF   INQ RECEIVED      W1F03980
                    *                   .RTBSY. ON     ROUTINE BUSY     W1F03990
                    *                   .XEOI.  ON     TRANSMIT EOI     W1F04000
                    *                   .LCNTL. ON     LEADER CONTROL   W1F04010
                    *                   .FAIL.  ON     DATA SET FAIL CK W1F04020
                    *                  .RETRY.   SET TO 7               W1F04030
                    *                  .ICNT.    INCREMENTED BY 1       W1F04040
                    *                                                   W1F04050
                    *************************************************** W1F04060
                    *                                                   W1F04070
                    *************************************************** W1F04080
                    *                                                   W1F04090
                    *             TRANSMIT FUNCTION                     W1F04100
                    *                                                   W1F04110
                    *************************************************** W1F04120
                    XMIT  LD      SYNCI      IS SYNC. IND. ON           W1F04130
                          BSC  L  ER3,+-     NO - ERROR - BRANCH        W1F04140
                          LD      XMITR      SET UP RESPONSE BRANCHES   W1F04150
                          STO     RDF                                   W1F04160
                          LD      XMITW                                 W1F04170
                          STO     WTF                                   W1F04180
                          LD      XMITT                                 W1F04190
                          STO     TIMF                                  W1F04200
                          SLA     16                                    W1F04210
                          STO   2 XEOI-T     TURN OFF XMIT-EOI          W1F04220
                          LD    1 0          CONTROL PARAMETER          W1F04230
                          AND     H0F00      DIGIT 2 FOR EOT/TEL/DATA   W1F04240
                          BSC  L  SEOT,Z     BR IF EOT OR TEL SEQUENCE  W1F04250
                          LD    2 WDCNT-T                               W1F04260
                          BSC  L  ER1,+      BR IF WORD COUNT INVALID   W1F04270
                          STO     XSOR       TURN ON XMIT-SOR           W1F04280
                          MDX     POS+2      GO SWITCH ACKS AND SORS    W1F04290
                    *                        AND START WRITE            W1F04300
                    SEOT  S       H0200                                 W1F04310
                          BSC  L  ER1,-Z     ERROR IF NOT EOT OR TEL    W1F04320
                          BSC  L  NEOT,-     BRANCH IF TEL              W1F04330
                          STO     XEOT       TURN ON XMIT-EOT           W1F04340
                          MDX     RCVX+4     GO TO SET RETRY TO 3   2-2 W1F04350
                    NEOT  LD      *                                     W1F04360
                          STO     XTEL       TURN ON XMIT-TEL           W1F04370
                          STO     TEL        TURN ON TEL                W1F04380
                          MDX     NEOT-1     GO TO SET RETRY TO 3   2-2 W1F04390
                    *                                                   W1F04400
                    *                        CONSTANTS                  W1F04410
                    *             RESPONSE BRANCH ADDRESSES             W1F04420
                    *                                                   W1F04430
                    XMITR EQU     RCVTR      TRANSMIT  READ RESPONSE    W1F04440
                    XMITW DC      XMW                  WRITE RESPONSE   W1F04450
                    XMITT DC      XMT                  TIMEOUT          W1F04460
                    *************************************************** W1F04470
                    *             AFTER PROCESSING THE CALLING SEQUENCE W1F04480
                    *             FOR THE .TRANSMIT. FUNCTION, THE      W1F04490
                    *             FOLLOWING INDICATORS ARE SET          W1F04500
                    *                                                   W1F04510
                    *              FOR DATA                             W1F04520
                    *                   .WDCNT. ON   ACTUAL RECORD SIZE W1F04530
                    *                   .XSOR.  ON   TRANSMIT SOR       W1F04540
                    *                   .ILRC.  ON/OFF                  W1F04550
                    *                   .ACK.   SWITCH FR 1-2 OR 2-1    W1F04560
                    *              FOR EOT                              W1F04570
                    *                   .XEOT.  ON  TRANSMIT EOT        W1F04580
                    *              FOR TEL                              W1F04590
                    *                   .XTEL.  ON   TRANSMIT TEL       W1F04600
                    *                   .TEL.   ON   EXPECT TEL RECEIVE W1F04610
                    *              FOR DATA, EOT, AND TEL               W1F04620
                    *                   .RTBSY. ON   ROUTINE BUSY       W1F04630
                    *                  .RETRY.   SET TO 3               W1F04640
                    *************************************************** W1F04650
                          HDNG    SCAT1 ********** CONSTANTS *********  W1F04660
                    *************************************************** W1F04670
                    *             CONSTANTS AND INDICATORS              W1F04680
                    *************************************************** W1F04690
                    T     BSS  E  0          BEGIN CONSTANT TABLE       W1F04700
                    READ  DC      BUF        READ                       W1F04710
                          DC      /5200          IOCC                   W1F04720
                    ACK   DC      0          CURRENT ACK/SOR            W1F04730
                          DC      0          NEXT ACK/SOR               W1F04740
                    ACKS  DC      /3300      ACK2 - SOR2                W1F04750
                          DC      /5300      ACK1 - SOR1                W1F04760
                    DISAA DC      0          DISABLE AUTO ANSWER        W1F04770
                          DC      /5440          IOCC                   W1F04780
                    SENSR DC      0          SENSE AND RESET DSW        W1F04790
                          DC      /5701          IOCC                   W1F04800
                    STRED DC      0          START READ                 W1F04810
                          DC      /5600          IOCC                   W1F04820
                    SYNC  DC      0          SYNCHRONIZE                W1F04830
                          DC      /5410          IOCC                   W1F04840
                    ENDOP DC      0          END OPERATION              W1F04850
                          DC      /5404          IOCC                   W1F04860
                    STWRT DC      0          START WRITE                W1F04870
                          DC      /5500          IOCC                   W1F04880
                    WTBUF DC      BUF        WRITE                      W1F04890
                          DC      /5100          IOCC                   W1F04900
                    LOAD  DC      IDLE       LOAD SYNC/IDLE REGISTER    W1F04910
                          DC      /5104          IOCC                   W1F04920
                    WTINQ DC      INQC       WRITE INQ, ERR             W1F04930
                          DC      /5100                                 W1F04940
                    LDCL  DC      CLC        LOAD SYNC REG WITH CL      W1F04950
                          DC      /5104          IOCC                   W1F04960
                    RESET DC      0                                     W1F04970
                          DC      /5540      RESET IOCC                 W1F04980
                    $SCAT EQU     17         IOCT COUNTER           2-4 W1F04981
                    $PAUS EQU     /F0        PAUS INDICATOR         2-2 W1F04982
                    RDF   EQU     DISAA      BR ADDR FOR READ           W1F04990
                    WTF   EQU     SENSR      BR ADDR FOR WRITE          W1F05000
                    TIMF  EQU     STRED      BR ADDR FOR TIMEOUT        W1F05010
                    IOAR  EQU     SYNC       I/O AREA ADDRESS           W1F05020
                    ERRU  EQU     ENDOP      ERROR CODE                 W1F05030
                    POINT EQU     RESET      I/O AREA POINTER           W1F05040
                    DSW   EQU     STWRT      DEVICE STATUS WORD         W1F05050
                    RM    DC      /AA00      4/8 FOR RECORD MARK        W1F05060
                    GMC   DC      /2700      CONSTANT 2700 FOR GM CHECK W1F05070
                    H1F00 DC      /1F00      CONSTANT 1F00              W1F05080
                    INQC  DC      /5900      4/8 FOR INQ                W1F05090
                    ERRC  EQU     INQC       4/8 FOR ERR                W1F05100
                    IDLE  DC      /3900      4/8 FOR IDLE               W1F05110
                    H0200 DC      /0200      CONSTANT 0200              W1F05120
                    TLC   DC      /3500      4/8 FOR TL                 W1F05130
                    CLC   DC      /5500      4/8 FOR CL                 W1F05140
                    TELC  DC      /5C00      4/8 FOR TEL                W1F05150
                    D1    DC      +1         CONSTANT 0001              W1F05170
                    XACK  DC      0          TRANSMIT ACK INDICATOR     W1F05180
                    BUF   DC      0          4/8 BUFFER FOR RCV/XMIT    W1F05190
                    CLSW  DC      0          CONTROL LEADER IND.        W1F05200
                    EOTC  DC      /5A00      4/8 FOR EOT                W1F05210
                    LRC   DC      0          LRC ACCUMULATOR            W1F05220
                    COUNT DC      0          ACTUAL WORD COUNT          W1F05230
                    ILRC  DC      0          ILRC IN RECORD IND.        W1F05240
                    TYPE  DC      0          DATA IN OR OUT             W1F05245
                          BSS  E  0                                 2-9 W1F05246
                    LCNTL DC      0          LEADER CONTROL INDR   EVEN W1F05250
                    *************************************************** W1F05260
                    *                        WHEN LEADER CONTROL IS ON, W1F05270
                    *                        THE PROGRAM EITHER EXPECTS W1F05280
                    *                        TO RCV/XMIT DATA OR THE    W1F05290
                    *                        FIRST CHARACTER OF A TWO   W1F05300
                    *                        CHARACTER CONTROL SEQUENCE W1F05310
                    *                        WHEN LEADER CONTROL IS OFF W1F05320
                    *                        THE PROGRAM EXPECTS TO     W1F05330
                    *                        RCV/XMIT THE SECOND        W1F05340
                    *                        CHARACTER OF A TWO CHAR.   W1F05350
                    *                        CONTROL SEQUENCE           W1F05360
                    *************************************************** W1F05370
                    XEOI  DC      0          TRANSMIT EOI INDR     ODD  W1F05390
                    WDCNT DC      0          WORD COUNT FROM USER       W1F05400
                    RETRY DC      0          RETRY COUNTER              W1F05410
                    OPENR DC      OPR        OPEN - READ RESPONSE       W1F05420
                    OPENW DC      OPW        OPEN - WRITE RESPONSE      W1F05430
                    OPENT DC      CKOPR      OPEN - TIMEOUT             W1F05440
                    FAIL  DC      0          DATA SET FAIL CHECK        W1F05450
                    *                                                   W1F05460
                    *                                                   W1F05470
                    TAB4  BSS  E  0          BEGIN TABLE TO CLEAR   2-9 W1F05474
                    INQR  DC      0          INQ RECEIVED          EVEN W1F05475
                    RCVCM DC      0          RCV COMPLETE INDR     ODD  W1F05476
                    XMITC EQU     RCVCM      TRANSMIT COMPLETE IND      W1F05477
                    *                                                   W1F05478
                    DATA  DC      0          RCV DATA INDR         EVEN W1F05479
                    RCVER DC      0          ERROR ON RCV          ODD  W1F05480
                    *                                                   W1F05481
                    RTBSY DC      0          ROUTINE BUSY INDR     EVEN W1F05482
                    OKBSY DC      0          ON WHEN PAD AFT EOT   ODD  W1F05483
                    *                                                   W1F05484
                    XERR  DC      0          TRANSMIT ERR IND.          W1F05490
                    XTEL  DC      0          TRANSMIT TEL IND.          W1F05500
                    TEL   DC      0          INITIATE TRANSMIT TEL      W1F05510
                    XINQ  DC      0          TRANSMIT INQ IND.          W1F05540
                    SYNCI DC      0          SYNC ESTABLISHED IND.      W1F05550
                    XSOR  DC      0          TRANSMIT SOR IND.          W1F05560
                    XEOT  DC      0          TRANSMIT EOT IND.          W1F05580
                    XRLRC DC      0          TRANSMIT/RCV ILRC IND.     W1F05590
                    DATER DC      0          DATA ERROR                 W1F05630
                    *                                                   W1F05640
                    *                                                   W1F05650
                    H6000 DC      /6000      CONSTANT 6000 FOR TL CHECK W1F05660
                    WD17  DC      0          WORD 17 INC/DEC IND.   2-4 W1F05670
                    TOIND DC      0          TIMEOUT INDICATOR          W1F05680
                    TOCNT DC      0          TIMEOUT COUNTER            W1F05690
                    D0003 DC      +3         CONSTANT 0003              W1F05695
                    D0007 DC      +7         7 RETRYS                   W1F05700
                    CLTM  DC      0          LOAD CL IND.               W1F05710
                    *                                                   W1F05720
                    D000X DC      6          TOTAL NUMBER OF IDLES  2-3 W1F05730
                    IDLCT DC      *-*        XMIT THIS NUMB OF IDLS 2-2 W1F05740
                    NOCOD DC      *-*        CHG OF DIR (Z=XMIT)    2-2 W1F05750
                    TABCT DC      LRCNT      ERROR STATISTICS ADDR  2-2 W1F05760
                    LRCNT DC      *-*        LRC ERRORS             2-2 W1F05770
                    ERRCT DC      *-*        RE TRANSMISSION REQUEST2-2 W1F05780
                    XMTTO DC      *-*        TIMEOUTS IN TMT FUNC   2-2 W1F05790
                    RCVTO DC      *-*        TIMEOUTS IN RCV FUNC   2-2 W1F05800
                    WTCHK DC      *-*        WRITE RESPONSE W/CHECK 2-2 W1F05810
                    RDCHK DC      *-*        READ RESPONSE W/CHECK  2-2 W1F05820
                    WTSEQ DC      *-*        INVALID SEQUENCE IN TMT2-2 W1F05830
                    RCSEQ DC      *-*        INVALID SEQUENCE IN RCV2-2 W1F05840
                    XPAD  DC      0          XMIT PAD INDR          2-3 W1F05841
                          HDNG    SCAT1 ****** INTERRUPT PROCESSING **  W1F05850
                    *************************************************** W1F05860
                    *                                                   W1F05870
                    *                   INTERRUPT PROCESSING            W1F05880
                    *                                                   W1F05890
                    *************************************************** W1F05900
                    *               THE DEVICE STATUS WORD              W1F05910
                    *                   BIT 0 - READ RESPONSE           W1F05920
                    *                   BIT 1 - WRITE RESPONSE          W1F05930
                    *                   BIT 2 - CHECK                   W1F05940
                    *                   BIT 3 - TIMEOUT                 W1F05950
                    *                   BIT 4 - AUTO ANSWER REQUEST     W1F05960
                    *                   BIT 5 - BUSY                    W1F05970
                    *                   BIT 6 - ENABLED                 W1F05980
                    *                   BIT 7 - READY                   W1F05990
                    *                   BIT 8 - RECEIVE RUN             W1F06000
                    *************************************************** W1F06010
                    INT2  XIO     SENSR                                 W1F06020
                          STX  L0 $PAUS      SET PAUS INDICATOR     2-2 W1F06025
                          STO     DSW        SENSE, RESET, SAVE DSW     W1F06030
                          LDX  L1 T          XR1 CONSTANT TABLE ADDR.   W1F06040
                          SLA     4                                     W1F06050
                          BSC  L  ANSI,+Z    BR IF AUTO ANSWER          W1F06060
                          SLA     3                                     W1F06070
                          BSC  L  TMCHK+4,-  BR IF NOT READY            W1F06080
                          LD      DSW                                   W1F06090
                          BSC  L  READI,+Z   BR IF READ RESPONSE        W1F06100
                          SLA     1                                     W1F06110
                          BSC  L  FAILC,+Z   BR IF WRITE RESPONSE       W1F06120
                          SLA     3                                     W1F06130
                          BSC  L  SVTIM,C    LOG TIME OUT INDICATOR 2-2 W1F06140
                          BSC  I  INT1,-     EXIT IF NOT AUTO ANSWER    W1F06150
                    *                                                   W1F06160
                    *************************************************** W1F06170
                    *             AUTO ANSWER REQUEST                   W1F06180
                    *************************************************** W1F06190
                    ANSI  SLA     2                                     W1F06200
                          BSC  I  INT1,-     BR IF AUTO ANSWER DISABLED W1F06210
                          LD      ANSI                                  W1F06220
                          STO  I  ANS        STORE INDICATION FOR USER  W1F06230
                          XIO     DISAA      DISABLE AUTO ANSWER REQ.   W1F06240
                    INTX  LD      *                                     W1F06250
                          STO     FAIL       TURN ON FAIL IND           W1F06260
                          BSC  I  INT1       EXIT TO ILS                W1F06270
                    *                                                   W1F06280
                    *************************************************** W1F06290
                    *             READ RESPONSE                         W1F06300
                    *************************************************** W1F06310
                    READI SLA     3                                     W1F06320
                          BSC  L  SVTIM,+Z   LOG TIME OUT INDICATOR 2-2 W1F06330
                          XIO     READ       READ CHARACTER INTO BUF    W1F06340
                          LD      BUF        TRAP CHAR. READ        2-2 W1F06350
                          SRA     8          SHFT CHAR TO RGHT OF A 2-2 W1F06360
                          CALL    IOLOG      LOG CHAR. RECEIVED     2-2 W1F06370
                          LD      DSW                                   W1F06380
                          SLA     2          PUT CHECK BIT INTO BIT 0   W1F06390
                          BSC  I  RDF,-      BR IF NO READ CHECK    2-2 W1F06400
                    *                                               2-2 W1F06410
                          MDX  L  RDCHK,+1   CNT NO. OF READ CHECKS 2-2 W1F06420
                          BSC  I  RDF        GO PROCESS READ RESPONSE   W1F06430
                    *                                                   W1F06440
                    FAILC SLA     16                                    W1F06450
                          STO     FAIL       TURN OFF FAIL IND          W1F06460
                          LD      DSW                               2-2 W1F06470
                          SLA     2          LOOK FOR TMT CHECK     2-2 W1F06480
                          BSC  L  NOCHK,-    BR IF NONE             2-2 W1F06490
                    *                                               2-2 W1F06500
                          MDX  L  WTCHK,+1   COUNT NO OF TMT CHECKS 2-2 W1F06510
                    *                                                   W1F06520
                    NOCHK LD    1 XPAD-T     IS IT PAD TIME         2-3 W1F06530
                          BSC  L  GOPAD,Z    YES, GO SEND PAD       2-3 W1F06531
                          LD      IDLCT      IF NO IDLES TO WRITE   2-3 W1F06532
                          BSC  I  WTF,+      BR TO SERVICE WRT RESP 2-2 W1F06540
                          S       D1         DECR NBR OF IDLES BY 1 2-2 W1F06550
                          STO     IDLCT                             2-2 W1F06560
                          XIO  L  WTIDL      WRITE IDLE             2-2 W1F06570
                    INTX2 MDX     INTX+2     EXIT TO ILS            2-2 W1F06580
                          HDNG    SCAT1 **** OPEN - WRITE RESPONSE ***  W1F06590
                    *************************************************** W1F06600
                    *                                                   W1F06610
                    *              WRITE RESPONSE FOR OPEN              W1F06620
                    *                                                   W1F06630
                    *************************************************** W1F06640
                    OPW   SLA     16                                    W1F06650
                          STO     FAIL       NO FAILURE IN DATA SET     W1F06660
                          LD      LCNTL                                 W1F06670
                          BSC  L  XEOTQ,+-   BR IF LEADER CONTROL OFF   W1F06680
                          LD      TYPE       IS DATA IN                 W1F06690
                          BSC  L  WTCL,+-    YES, BR TO WRITE CL        W1F06700
                          LD      RTBSY                                 W1F06710
                          BSC  L  NTBSY,Z    BR IF ROUTINE IS BUSY      W1F06720
                    *                                                   W1F06730
                          LD      *          IF ROUTINE NOT BUSY,       W1F06740
                          STO     XEOI       TURN ON XMIT-EOI IND.      W1F06750
                          MDX     WTCL       BR TO WRITE CL             W1F06760
                    *                                                   W1F06770
                    NTBSY LD      XEOI       NO, DATA OUT               W1F06780
                          OR      XEOT                                  W1F06790
                          OR      XTEL                                  W1F06800
                    *             WRITE CL IF XEOI, XEOT, OR XTEL ON    W1F06810
                          BSC  L  WTCL,Z                                W1F06820
                    WTTL  LD    1 TLC-T      SET UP WRITE TL            W1F06830
                          MDX     WTCL+1     GOTO WRITE IT              W1F06840
                    WTCL  LD    1 CLC-T      SET UP WRITE CL            W1F06850
                          STO   1 BUF-T                                 W1F06860
                          STO   1 NOCOD-T    TURN ON COD INDICATOR  2-2 W1F06870
                          CALL    IOLOG      LOG CL TO BE XMITTED   2-2 W1F06880
                          XIO   1 WTBUF-T    WRITE                      W1F06890
                          SLA     16                                    W1F06900
                          STO   1 LCNTL-T    SET LEADER CONTROL OFF     W1F06910
                          MDX     INTX       EXIT TO ILS                W1F06920
                    *                                                   W1F06930
                    XEOTQ LD      XEOT                                  W1F06940
                          BSC  L  XTELQ,+-   BR IF XEOT NOT ON          W1F06950
                    EOT1  SLA     16         XMIT-EOT IS ON             W1F06960
                          STO   1 XEOT-T     TURN OFF XMIT-EOT          W1F06970
                    C4    LD    1 EOTC-T     WRITE EOT                  W1F06980
                          STO   1 BUF-T                             2-2 W1F06990
                          CALL    IOLOG      LOG CL TO BE XMITTED   2-2 W1F07000
                          XIO   1 WTBUF-T                               W1F07010
                          BSI  L  PAD        GO SET UP FOR PAD      2-3 W1F07011
                          LD    1 OKBSY-T    RTBSY TO BE TURNED OFF 2-9 W1F07012
                          BSC  L  C45,+-     NO - BRANCH            2-9 W1F07013
                          SLT     32                                2-9 W1F07014
                          STD   1 RTBSY-T    TURN OFF ROUTINE BUSY  2-9 W1F07015
                    *             OKBSY      TURN OFF OKBSY         2-9 W1F07016
                    C45   LD    1 CLTM-T                                W1F07020
                          BSC  L  CLREG,Z    GO LOAD CL TO SYNC REG 2-3 W1F07030
                    OPW2  LD      *                                     W1F07040
                          STO   1 LCNTL-T    TURN ON LEADER CONTROL 2-2 W1F07050
                          XIO   1 STRED-T    START READ                 W1F07060
                          MDX     INTX+2     EXIT TO ILS                W1F07070
                    *                                                   W1F07080
                    XTELQ LD    1 XTEL-T                                W1F07090
                          BSC  L  XEOIQ,+-   BR IF XTEL NOT ON          W1F07100
                    B4    SLA     16         XMIT-TEL IS ON             W1F07110
                          STO   1 XTEL-T     TURN IT OFF                W1F07120
                          LD    1 TELC-T     SETUP WRITE TEL            W1F07130
                          MDX  L  TEL,0     IF TEL SW OFF, SKIP     2-9 W1F07133
                          MDX     C4+1      ELSE WRITE TEL CHAR     2-9 W1F07135
                          STO   1 OKBSY-T   SW TO TURN OFF BUSY     2-9 W1F07137
                          MDX     C4+1      *AFTER TRANSMIT TEL     2-9 W1F07140
                    *                                                   W1F07150
                    XEOIQ LD    1 XEOI-T                                W1F07160
                          BSC  L  NTEOI,+-   BR IF XEOI NOT ON          W1F07170
                          SLA     16         XMIT-EOI                   W1F07180
                          STO   1 XEOI-T     TURN OFF XMIT-EOI          W1F07190
                    WTDLE LD    1 IDLE-T     SET UP WRITE IDLE          W1F07200
                          MDX     C4+1       GO WRITE IT                W1F07210
                    *                                                   W1F07220
                    NTEOI LD    1 TYPE-T                                W1F07230
                          BSC  L  WTDLE,+-   GO WRITE IDLE IF DATA IN   W1F07240
                    E4    XIO   1 WTINQ-T    WRITE INQ                  W1F07250
                          LD    1 INQC-T                            2-2 W1F07260
                          CALL    IOLOG      LOG INQ XMITTED        2-2 W1F07270
                    WTPAD BSI  L  PAD        GO SET UP FOR PAD      2-3 W1F07271
                    CLREG XIO   1 LDCL-T     LOAD CL TO SYNC REG    2-3 W1F07280
                          LD      *                                     W1F07290
                    CLRE2 STO   1 CLSW-T     TURN ON CL SWITCH      2-3 W1F07300
                          SLA     16         TURN OFF LEADER CONTROL    W1F07310
                          STO   1 CLTM-T     TURN OFF LOAD CL IND       W1F07320
                          MDX     OPW2+1     GO START READ              W1F07330
                    *                                                   W1F07340
                          HDNG    SCAT1 **** OPEN - READ RESPONSE ****  W1F07350
                    *************************************************** W1F07360
                    *                                                   W1F07370
                    *              READ RESPONSE FOR OPEN               W1F07380
                    *                                                   W1F07390
                    *************************************************** W1F07400
                    OPR   BSC  L  CKOPR,+Z   BR IF CHECK BIT ON         W1F07410
                          LD    1 LCNTL-T                               W1F07420
                          BSC  L  OPR2,+-    BR IF LEADER CONTROL OFF   W1F07430
                    LCON  LD    1 BUF-T                                 W1F07440
                          STO   1 CLSW-T     BUF = CL, CL SWITCH ON     W1F07450
                          EOR   1 CLC-T                                 W1F07460
                          BSC  L  NOCL,Z     BR IF BUF NOT = CL         W1F07470
                          STO   1 LCNTL-T    TURN OFF LEADER CONTROL    W1F07480
                          MDX     INTX2      EXIT TO ILS            2-9 W1F07490
                    *                                                   W1F07500
                    *                                                   W1F07510
                    NOCL  EOR   1 H6000-T    BUF = TL                   W1F07520
                          STO   1 LCNTL-T    IGNORE TL OR CL AS ERR 2-2 W1F07530
                          SLA     16                                    W1F07540
                          STO   1 CLSW-T     CL SWITCH OFF IF TL        W1F07550
                          MDX     LCON+6     EXIT TO ILS            2-2 W1F07560
                    *                                                   W1F07570
                    OPR2  LD      *                                     W1F07580
                          STO   1 LCNTL-T    TURN ON LEADER CONTROL     W1F07590
                          LD    1 RCVER-T                               W1F07600
                          BSC  L  CKOPR,Z    BR IF RCV-ERR ON           W1F07610
                          LD    1 CLSW-T     NO                         W1F07620
                          BSC  L  INQQ,+-    BR IF LAST CHAR. WAS TL    W1F07630
                          LD    1 BUF-T      BUF = EOT                  W1F07640
                          EOR   1 EOTC-T                                W1F07650
                          BSC  L  DLEQ,Z     BR IF BUF NOT = EOT        W1F07660
                          LD      *          TURN ON XMIT-EOT           W1F07670
                          STO   1 XEOT-T                                W1F07680
                    ALH   SLA     16         ZERO ACCUM             2-2 W1F07690
                          MDX     XMITI      SEND 1.5 SEC. OF IDLES     W1F07700
                    STWT2 XIO   1 LOAD-T     LOAD IDLE TO SYNC-REG      W1F07710
                          LD    1 D000X-T    NUMBER OF IDLES TO     2-2 W1F07720
                          STO   1 IDLCT-T    PROCEED TRANSMISSION   2-2 W1F07730
                          XIO   1 STWRT-T    START WRITE                W1F07740
                          MDX     INQQ-2     EXIT TO ILS            2-2 W1F07750
                    *                                                   W1F07760
                    H6300 DC      /6300      CONSTANT 6300 FOR IDLE CHK W1F07770
                    H6500 DC      /6500      CONSTANT 6500 FOR TEL CHK  W1F07780
                    *                                                   W1F07790
                    DLEQ  EOR     H6300      BUF = IDLE                 W1F07800
                          BSC  L  XMITI,+-   BR IF BUF = IDLE           W1F07810
                          EOR     H6500      BUF = TEL                  W1F07820
                          BSC  L  NOTEL,Z    BR IF BUF NOT = TEL        W1F07830
                    TELUS LD      *          TURN ON XMIT-TEL           W1F07840
                          STO   1 XTEL-T                                W1F07850
                          XIO   1 LOAD-T     LOAD IDLE TO SYNC-REG      W1F07860
                          XIO   1 SYNC-T     SEND IDLES                 W1F07870
                          LD      TELU       TEL RECEIVED - CODE 1000   W1F07880
                          BSI  I  USERR      GO TO USER ERROR ROUTINE   W1F07890
                          MDX     XMITI+3    EXIT TO ILS            2-2 W1F07900
                    *                                                   W1F07910
                    TELU  DC      /1000      CONSTANT 1000              W1F07920
                    *                                                   W1F07930
                    NOTEL LD    1 TYPE-T                                W1F07940
                          BSC  L  OPERR,+-   BR IF DATA IN, ERROR       W1F07950
                          LD    1 BUF-T                                 W1F07960
                          EOR   1 ACKS-T     CHECK FOR                  W1F07970
                          BSC     Z          EITHER                     W1F07980
                          EOR   1 GMC-T      ACK1 OR ACK2               W1F07990
                          BSC  L  OPERR,Z    BR IF NEITHER              W1F08000
                          STO   1 RTBSY-T    CLEAR RTN. BUSY            W1F08010
                          LD      *                                     W1F08020
                          STO   1 SYNCI-T    TURN ON SYNC. IND.         W1F08030
                          STO   1 XMITC-T    SET TRANSMIT NOT COMPLETE  W1F08040
                          SLA     16         DATA OUT                   W1F08050
                          STO   1 XINQ-T     TURN OFF XMIT-INQ          W1F08060
                    XMITI STO   1 NOCOD-T    TURN OFF COD INDICATOR 2-2 W1F08070
                          XIO   1 LOAD-T     LOAD IDLE TO SYNC REG  2-2 W1F08080
                          XIO   1 SYNC-T     SEND IDLES FOR 1.5 SECONDS W1F08090
                          BSC  L  INTX       EXIT TO ILS                W1F08100
                    *                                                   W1F08110
                    INQQ  LD    1 BUF-T      LAST CHAR. WAS TL          W1F08120
                          EOR   1 INQC-T     BUF= INQ                   W1F08130
                          BSC  L  OPERR,Z    BR IF BUF NOT = INQ        W1F08140
                          LD    1 TYPE-T                                W1F08150
                          BSC  L  OPER1,Z    BR IF DATA OUT, INQ RCVED  W1F08160
                          STO   1 RTBSY-T    TURN OFF ROUTINE BUSY      W1F08170
                          LD      *                                     W1F08180
                          STO   1 INQR-T     TURN ON INQ RECEIVED       W1F08190
                          MDX     XMITI-3    GO SEND IDLES              W1F08200
                    *                                                   W1F08210
                    *                                                   W1F08220
                    SYNCU DC      /2000      ERROR CODE - NO SYNCHRONIZ W1F08230
                    FAILU DC      /8000      ERR CODE - DATA SET FAIL   W1F08240
                    INQU  DC      /4000      ERR CODE - DATA OUT, INQ   W1F08250
                    *                                                   W1F08260
                    *                                                   W1F08270
                          HDNG    SCAT1 ***** OPEN - TIMEOUT *********  W1F08280
                    *************************************************** W1F08290
                    *                                                   W1F08300
                    *              TIMEOUT FOR OPEN                     W1F08310
                    *                                                   W1F08320
                    *************************************************** W1F08330
                    CKOPR LDD     *                                 2-9 W1F08340
                          STD   1 LCNTL-T    TURN ON LEADER CONTROL 2-9 W1F08350
                    *             XEOI       TURN ON XMIT-EOI       2-9 W1F08360
                          SLA     16                                    W1F08370
                          STO   1 RCVER-T    TURN OFF RCV-ERR           W1F08380
                    OPERR LD      SYNCU      NO SYNCHRONIZATION         W1F08390
                    OPER2 STO   1 ERRU-T                                W1F08400
                          MDX  L  RETRY,-1   DECREMENT SYNC-TRY         W1F08410
                          MDX     ALH        BR IF NOT 7 RETRIES    2-2 W1F08420
                    *                                                   W1F08430
                          XIO   1 LOAD-T     LOAD IDLE TO SYNC-REG      W1F08440
                          XIO   1 SYNC-T     SEND IDLES                 W1F08450
                          LD    1 ERRU-T     ERROR CODE IN A-REG        W1F08460
                          BSI  I  USERR      GO TO USER ERROR ROUTINE   W1F08470
                          LDX  L1 T          RESTORE XR1                W1F08480
                          BSC  L  RTRY,Z     BR IF RETRY REQUESTED      W1F08490
                    *                                                   W1F08500
                    *                   RESET INDICATORS - TABLE 4      W1F08510
                    AEZ1  XIO   1 RESET-T    END SCA OPERATION          W1F08520
                          LD    1 WD17-T                            2-4 W1F08530
                          BSC  L  CL4-2,+-   BR IF 17 HAS BEEN DECRE.   W1F08540
                          MDX  L  $SCAT,-1   DECREMENT IOCT COUNTER 2-4 W1F08550
                          NOP                                           W1F08560
                          SLA     16                                    W1F08570
                          STO   1 WD17-T     TURN OFF IND. FOR 17   2-4 W1F08580
                          LDX   1 +15        15 INDICATORS          2-9 W1F08590
                          SLA     16                                    W1F08600
                    CL4   STO  L1 TAB4-1     ARE CLEARED                W1F08610
                          MDX   1 -1                                    W1F08620
                          MDX     CL4                                   W1F08630
                          BSC  I  INT1       EXIT TO ILS            2-2 W1F08640
                    *                                                   W1F08650
                    *                                                   W1F08660
                    OPER1 LD      INQU       INQ SEQUENCE RECEIVED      W1F08670
                          MDX     OPER2      GOTO USER ERROR ROUTINE    W1F08680
                    *                                                   W1F08690
                    TMCHK XIO   1 ENDOP-T    RESET ALL TAGS             W1F08700
                          LD    1 FAIL-T     IS FAILURE CHECK ON        W1F08710
                          BSC  I  TIMF,+-    NO, GO SERVICE TIMEOUT     W1F08720
                          XIO   1 STWRT-T    START WRITE TO RESET TRIG  W1F08730
                          LD      FAILU      YES                        W1F08740
                          MDX     OPER2      GOTO USER ERROR ROUTINE    W1F08750
                    *                                                   W1F08760
                          HDNG    SCAT1 ** TRANSMIT - WRITE RESPONSE *  W1F08770
                    *************************************************** W1F08780
                    *                                                   W1F08790
                    *              WRITE RESPONSE FOR TRANSMIT          W1F08800
                    *                                                   W1F08810
                    *************************************************** W1F08820
                    XMW   LD    1 XTEL-T     IS XMIT-TEL ON             W1F08830
                          BSC  L  TEL7,Z     YES , BRANCH               W1F08840
                          LD    1 XEOT-T     IS XMIT-EOT ON             W1F08850
                          BSC  L  EOT7,Z     YES, BRANCH                W1F08860
                          LD    1 XEOI-T     IS XMIT-EOI ON             W1F08870
                          BSC  L  EOI7,Z     YES , BRANCH               W1F08880
                          LD    1 XINQ-T     IS XMIT-INQ ON             W1F08890
                          BSC  L  INQ7,Z     YES, BRANCH                W1F08900
                          LD    1 XSOR-T     IS XMIT-SOR ON             W1F08910
                          BSC  L  SOR7,Z     YES, BRANCH                W1F08920
                          LD    1 XRLRC-T    IS XR-ILRC ON              W1F08930
                          BSC  L  ILRC7,Z    YES, BRANCH                W1F08940
                          LD    1 COUNT-T    IS WD CNT ZERO             W1F08950
                          BSC  L  QLRC,+-    YES, SEND TL LRC           W1F08960
                    *                                                   W1F08970
                          LD   I  POINT      PICK UP CHARACTER          W1F08980
                          STO   1 BUF-T                                 W1F08990
                          BSI  L  CHECK      CHECK FOR VALID CHARACTER  W1F09000
                          MDX     SORRY      CONTROL OR 4/8 ERROR       W1F09010
                    *                                                   W1F09020
                          LD    1 BUF-T                                 W1F09030
                          EOR   1 LRC-T      BUILD LRC                  W1F09040
                          STO   1 LRC-T                                 W1F09050
                    *                                                   W1F09060
                          LD    1 BUF-T                                 W1F09070
                          EOR   1 RM-T       IS CHARACTER A RECORD MARK W1F09080
                          BSC     Z                                     W1F09090
                          EOR   1 GMC-T      NO, IS IT A GROUP MARK     W1F09100
                          BSC     Z                                     W1F09110
                          MDX     UPDAT      NO, BYPASS ILRC CHECK      W1F09120
                    *                                                   W1F09130
                          LD    1 ILRC-T     YES, IF AN ILRC REQUESTED  W1F09140
                          STO   1 XRLRC-T         TURN ON XR-ILRC       W1F09150
                    *                                                   W1F09160
                    UPDAT MDX  L  POINT,+1   UP I/O AREA POINTER        W1F09170
                          MDX  L  COUNT,-1   DECREMENT WORD COUNT       W1F09180
                          NOP                                           W1F09190
                    *                                                   W1F09200
                          XIO   1 WTBUF-T    TRANSMIT CHARACTER IN BUF  W1F09210
                          LD    1 BUF-T      LOG CHARACTER          2-3 W1F09215
                          CALL    IOLOG      *TRANSMITTED           2-3 W1F09216
                          MDX     XMITI+3    EXIT TO ILS            2-2 W1F09220
                    *                                                   W1F09230
                    SORRY LD    1 H1F00-T    TO FORCE RECEIVE CHECK     W1F09240
                          STO   1 DATER-T    TURN ON DATA ERR           W1F09250
                          STO   1 BUF-T      XMIT A BAD CHARACTER       W1F09260
                          MDX     UPDAT      CONTINUE AS IF GOOD DATA   W1F09270
                    *                                                   W1F09280
                    *                                                   W1F09290
                    TEL7  LD    1 LCNTL-T                               W1F09300
                          BSC  L  B4,+-      GOTO SEND TEL              W1F09310
                    XCL   BSC  L  WTCL       GOTO SEND CL               W1F09320
                    *                                                   W1F09330
                    EOT7  LD    1 LCNTL-T                               W1F09340
                          BSC  L  C4,+-      GOTO SEND EOT              W1F09350
                          MDX     XCL        GOTO SEND CL               W1F09360
                    *                                                   W1F09370
                    INQ7  LD    1 LCNTL-T                               W1F09380
                          BSC  L  E4,+-      GOTO SEND INQ              W1F09390
                          MDX     SOR7+1     GOTO SEND TL               W1F09400
                    *                                                   W1F09410
                    SOR7  LD    1 LCNTL-T                               W1F09420
                          BSC  L  WTTL,Z     GOTO SEND TL               W1F09430
                          STO   1 XSOR-T     TURN OFF XMIT-SOR          W1F09440
                          LD    1 WDCNT-T                               W1F09450
                          STO   1 COUNT-T    SET UP WORD COUNT,         W1F09460
                          LD    1 IOAR-T     SET UP I/O AREA POINTER    W1F09470
                          A     1 D1-T                                  W1F09480
                          STO   1 POINT-T                               W1F09490
                          STO   1 LCNTL-T    TURN ON LEADER CONTROL     W1F09500
                          XIO     WTSOR      WRITE SOR                  W1F09510
                          LD    1 ACK-T                             2-2 W1F09520
                          CALL    IOLOG      LOG SOR XMITTED        2-2 W1F09530
                          MDX     ILRC4      GO TO CLEAR LRC        2-7 W1F09540
                    *                                                   W1F09550
                    ILRC7 XIO     WTLRC      WRITE LRC                  W1F09560
                          LD    1 LRC-T      LOG                    2-7 W1F09561
                          CALL    IOLOG      LRC                    2-7 W1F09562
                    ILRC4 SLA     16                                2-7 W1F09570
                          STO   1 LRC-T      CLEAR LRC                  W1F09580
                          STO   1 XRLRC-T    TURN OFF XR-ILRC           W1F09590
                          BSC  L  INTX       EXIT TO ILS                W1F09600
                    *                                                   W1F09610
                    QLRC  LD    1 RTBSY-T    IF NOT BUSY,               W1F09620
                          BSC  L  FILL,+-    BR TO SEND EOI             W1F09630
                          LD    1 LCNTL-T                               W1F09640
                          BSC  L  WTTL,Z     GOTO SEND TL               W1F09650
                          XIO     WTLRC      GOTO SEND LRC              W1F09660
                          LD    1 LRC-T      LOG                    2-7 W1F09661
                          CALL    IOLOG      LRC                    2-7 W1F09662
                          SLA     16                                    W1F09670
                          STO   1 LRC-T      CLEAR LRC                  W1F09680
                          BSC  L  WTPAD      WRITE PAD, CL TO SYNC R2-3 W1F09690
                    *                                                   W1F09700
                    *                                                   W1F09710
                    *                                                   W1F09720
                          BSS  E  0                                     W1F09730
                    WTSOR DC      ACK        WRITE ACK/SOR              W1F09740
                          DC      /5100          IOCC                   W1F09750
                    WTLRC DC      LRC        WRITE LRC                  W1F09760
                          DC      /5100          IOCC                   W1F09770
                    *                                                   W1F09780
                    FILL  LD      *                                     W1F09790
                          STO   1 XEOI-T     TURN ON XMIT-EOI           W1F09800
                          MDX     XCL        BR TO SEND CL              W1F09810
                    *                                                   W1F09820
                    EOI7  STO   1 CLTM-T     TURN ON LOAD CL IND        W1F09830
                          LD    1 LCNTL-T                               W1F09840
                          BSC  L  XEOIQ+3,+- BR TO SEND IDLE            W1F09850
                          MDX     XCL        BR TO SEND CL              W1F09860
                          HDNG    SCAT1 *** TRANSMIT - READ RESPONSE *  W1F09870
                    *************************************************** W1F09880
                    *                                                   W1F09890
                    *              READ RESPONSE TO TRANSMIT FUNCTION   W1F09900
                    *                                                   W1F09910
                    *************************************************** W1F09920
                    XMR   BSC  L  XMT,+Z     BR IF CHECK BIT IS ON      W1F09930
                          LD    1 LCNTL-T                               W1F09940
                          BSC  L  LCON,Z     BR IF LEADER CONTROL IS ON W1F09950
                    *                                                   W1F09960
                    XMR1  STO   1 RCVER-T    TURN OFF RCV-ERR           W1F09970
                          LD      *                                     W1F09980
                          STO   1 LCNTL-T    TURN ON LEADER CONTROL     W1F09990
                    *                                                   W1F10000
                          LD    1 CLSW-T                                W1F10010
                          BSC  L  SWOFF,+-   BR IF LAST CHAR NOT CL     W1F10020
                    *                                                   W1F10030
                          LD    1 BUF-T                                 W1F10040
                          EOR   1 TELC-T     BUF = TEL                  W1F10050
                          BSC  L  ALTER,+-   YES, BRANCH                W1F10060
                          LD    1 TEL-T      NO                         W1F10070
                          BSC  L  A8,Z       TEL SWITCH ON, TRY AGAIN   W1F10080
                    *                                                   W1F10090
                          LD    1 XEOT-T                                W1F10100
                          BSC  L  CKACK,+-   GO CHECK ACK IF XEOT OFF   W1F10110
                          LD    1 BUF-T      XMIT-EOT IS ON, IS BUF=EOT W1F10120
                          EOR   1 EOTC-T                                W1F10130
                          BSC  L  A8+1,Z     ERROR IF NOT EOT           W1F10140
                    *                        EOT WAS RECEIVED           W1F10150
                          STO   1 SYNCI-T    TURN OFF SYNC INDR         W1F10160
                          STO   1 XEOT-T     TURN OFF XMIT-EOT          W1F10170
                    *                                                   W1F10180
                          STO   1 XMITC-T    SET TRANSMIT COMPLETE      W1F10190
                          LDD   1 ACKS-T                                W1F10200
                          STD   1 ACK-T      RESET ACK, SOR             W1F10210
                          LD    1 OPENR-T                               W1F10220
                          STO   1 RDF-T      SET BRANCHES TO OPEN RTN.  W1F10230
                          LD    1 OPENW-T                               W1F10240
                          STO   1 WTF-T                                 W1F10250
                          LD    1 OPENT-T                               W1F10260
                          STO   1 TIMF-T                                W1F10270
                          SLA     16                                    W1F10280
                          STO   1 TEL-T      TURN OFF TEL SWITCH        W1F10290
                          STO   1 RTBSY-T    CLEAR    ROUTINE BUSY      W1F10300
                    *                                                   W1F10310
                    D8    BSC  L  ALH        GO SEND IDLES          2-2 W1F10320
                    *                                                   W1F10330
                    CKACK LD    1 BUF-T      IS CORRECT ACK IN BUF      W1F10340
                          EOR   1 ACK-T                                 W1F10350
                          BSC  L  NOACK,Z    NO, BRANCH                 W1F10360
                          STO   1 XINQ-T     YES, TURN OFF XMIT-INQ     W1F10370
                          MDX     D8-1       GO CLEAR ROUTINE BUSY      W1F10380
                    *                                                   W1F10390
                    INCU  DC      /0200      INVALID SEQUENCE CODE 0200 W1F10400
                    DATU  DC      /0100      DATA ERROR       CODE 0100 W1F10410
                    RESPU DC      /0400      ERR SEQ RCVED    CODE 0400 W1F10420
                    *                                                   W1F10430
                    NOACK LD    1 BUF-T                                 W1F10440
                          EOR   1 IDLE-T     IS CHAR AN IDLE            W1F10450
                          BSC  L  INQON,+-   BR IF YES                  W1F10460
                          LD    1 DATER-T                               W1F10470
                          BSC  L  DAT,Z      BR IF DATA ERROR ON        W1F10480
                          LD    1 BUF-T                                 W1F10490
                          EOR   1 ERRC-T                                W1F10500
                          BSC  L  C8,Z       BR IF NOT ERR RESP EITHER  W1F10510
                          MDX  L  ERRCT,+1   RE-TRANSMISSION REQUEST2-2 W1F10520
                          LD      RESPU      ERR RESPONSE RECEIVED      W1F10530
                    DAT2  STO   1 ERRU-T     STORE ERROR CODE           W1F10540
                          SLA     16                                    W1F10550
                          STO   1 DATER-T    TURN OFF DATA ERR          W1F10560
                          STO   1 XINQ-T     TURN OFF XMIT-INQ          W1F10570
                          LD      *                                     W1F10580
                          STO   1 XSOR-T     TURN ON XMIT-SOR           W1F10590
                          MDX     B8         GOTO DECRE RETRY           W1F10600
                    *                                                   W1F10610
                    DAT   LD    1 D1-T       DATA ERROR IN RECORD       W1F10620
                          STO   1 RETRY-T    TELL USER IMMEDIATELY      W1F10630
                          LD      DATU       DATA ERROR                 W1F10640
                          MDX     DAT2       GO SET INDICATORS          W1F10650
                    *                                                   W1F10660
                    ALTER LD    1 TEL-T                                 W1F10670
                          BSC  L  TELUS,+-   TEL SWITCH OFF, TELL USER  W1F10680
                          MDX     D8-3       GO TURN OFF TEL SWITCH     W1F10690
                    *                                                   W1F10700
                    SWOFF LD    1 TEL-T      IF TEL SWITCH IS ON,       W1F10710
                          BSC  L  A8,Z       TRY SENDING TEL AGAIN      W1F10720
                          LD    1 XEOT-T                                W1F10730
                          BSC  L  A8+1,Z     BR IF XMIT-EOT IS ON       W1F10740
                    *                                                   W1F10750
                    *                                                   W1F10760
                    C8    LDD   1 ACK-T                                 W1F10770
                          SLT     16         CHECK FOR OTHER ACK        W1F10780
                          EOR   1 BUF-T                                 W1F10790
                          BSC  L  C8A,Z                                 W1F10800
                          LD      INCU       WRONG ACK RECEIVED         W1F10810
                          MDX     DAT2                                  W1F10820
                    C8A   LD      *                                     W1F10830
                          STO   1 XINQ-T     TURN ON XMIT-INQ           W1F10840
                          MDX     A8+1       GO DECRE RETRY             W1F10850
                    *                                                   W1F10860
                    A8    STO   1 XTEL-T     TURN ON XMIT-TEL           W1F10870
                          MDX  L  WTSEQ,+1   INVAL RESPONSE FOR TMT 2-2 W1F10880
                          LD      INCU       INCORRECT RESPONSE         W1F10890
                          STO   1 ERRU-T     ERROR CODE                 W1F10900
                    *                                                   W1F10910
                    B8    XIO   1 LOAD-T     LOAD IDLE TO SYNC-REG      W1F10920
                          MDX  L  RETRY,-1   DECREMENT RETRY            W1F10930
                          MDX     D8         SEND IDLES                 W1F10940
                          XIO   1 SYNC-T     SEND IDLES                 W1F10950
                          LD    1 ERRU-T     LOAD ERROR CODE            W1F10960
                          BSI  I  USERR      GO TO USER ERROR ROUTINE   W1F10970
                          LDX  L1 T          RESTORE XR1                W1F10980
                          BSC  L  AEZ1,+-    A-REG EQUAL ZERO, END OP   W1F10990
                          BSC  L  NXT,+      A-REG IS NEGATIVE          W1F11000
                    RTRY  LD    1 D0007-T    7 RETRYS                   W1F11010
                          STO   1 RETRY-T                               W1F11020
                          BSC  L  INTX       EXIT TO ILS                W1F11030
                    *                                                   W1F11040
                    *                        PREPARE FOR USER TO        W1F11050
                    *                        TRANSMIT NEXT RECORD       W1F11060
                    *                                                   W1F11070
                    NXT   LD    1 TYPE-T     DO NOT SWITCH ACKS         W1F11080
                          BSC  L  *+3,+-     FOR RCV                    W1F11090
                          LDD   1 ACK-T      SWITCH ACKS SO THEY WILL   W1F11100
                          RTE     16         STILL BE IN PHASE FOR      W1F11110
                          STD   1 ACK-T      NEXT RECORD                W1F11120
                          SLA     16                                    W1F11130
                          STO   1 XERR-T     TURN OFF XMIT-ERR          W1F11140
                          MDX     CKACK+4    GO CLEAR BUSY, XINQ        W1F11150
                    *                                                   W1F11160
                    INQON LD    1 RTBSY-T                               W1F11170
                          BSC  L  QTEL1,+-   BR TO SEND IDLE, NOT BSY   W1F11180
                          LD      *                                     W1F11190
                          STO   1 XINQ-T     TURN ON XMIT-INQ           W1F11200
                          MDX     D8         BR TO SEND IDLES           W1F11210
                          HDNG    SCAT1 **** TRANSMIT - TIMEOUT ******  W1F11220
                    *************************************************** W1F11230
                    *                                                   W1F11240
                    *              TIMEOUT FOR TRANSMIT FUNCTION        W1F11250
                    *                                                   W1F11260
                    *************************************************** W1F11270
                    XMT   SLA     16                                    W1F11280
                          STO   1 CLSW-T     TURN OFF CL SWITCH         W1F11290
                          MDX  L  XMTTO,+1   TIME OUT IN TRANSMIT   2-2 W1F11300
                          BSC  L  XMR1                                  W1F11310
                    *                                                   W1F11320
                          HDNG    SCAT1 *** RECEIVE - WRITE RESPONSE *  W1F11330
                    *************************************************** W1F11340
                    *                                                   W1F11350
                    *              WRITE RESPONSE TO RECEIVE FUNCTION   W1F11360
                    *                                                   W1F11370
                    *************************************************** W1F11380
                    RCW   LD    1 LCNTL-T                               W1F11390
                          BSC  L  WTCL,Z     SEND CL IF LEAD. CNTRL ON  W1F11400
                          LD    1 TOIND-T                               W1F11410
                          BSC  L  TLTM,Z     BR IF TIMEOUT OCCURRED     W1F11420
                          LD    1 XTEL-T                                W1F11430
                          BSC  L  B4,Z       BR IF XMIT-TEL ON          W1F11440
                          LD    1 XEOT-T                                W1F11450
                          BSC  L  ERRQ,+-    BR IF XMIT-EOT NOT ON      W1F11460
                    *                        XMIT-EOT ON                W1F11470
                          STO   1 OKBSY-T    TURN ON INDR FOR FUTURE2-9 W1F11475
                    *                       *TURNING OFF .RTBSY.    2-9 W1F11476
                    *                       *WHEN PAD XMITTED       2-9 W1F11477
                          SLT     32                                2-9 W1F11480
                          STO   1 XERR-T     TURN OFF XMIT-ERR          W1F11500
                          STO   1 XACK-T     TURN OFF XMIT-ACK          W1F11510
                          STD   1 INQR-T     TURN OFF INQ-RECEIVED  2-9 W1F11520
                    *             RCVCM      TURN OFF RCV COMPLETE  2-9 W1F11530
                          LD    1 OPENR-T                               W1F11540
                          STO   1 RDF-T      SET BRANCHES TO OPEN RTN.  W1F11550
                          LD    1 OPENW-T                               W1F11560
                          STO   1 WTF-T                                 W1F11570
                          LD    1 OPENT-T                               W1F11580
                          STO   1 TIMF-T                                W1F11590
                          BSC  L  EOT1       GO SEND EOT                W1F11600
                    *                                                   W1F11610
                    ERRQ  LD    1 XEOI-T                                W1F11620
                          BSC  L  XEOIQ+3,Z  BR TO SEND IDLE            W1F11630
                          LD    1 XERR-T                                W1F11640
                          BSC  L  ACKQ,+-    BR IF XMIT-ERR NOT ON      W1F11650
                          XIO   1 WTINQ-T    WRITE ERR                  W1F11660
                          LD    1 INQC-T                            2-2 W1F11670
                          CALL    IOLOG      LOG ERR XMITTED        2-2 W1F11680
                    PAD1  BSI  L  PAD        GO SET UP FOR PAD      2-3 W1F11681
                          XIO     LDTL       LOAD TL TO SYNC-REG        W1F11690
                          SLA     16         TURN OFF CL SWITCH         W1F11700
                          BSC  L  CLRE2      SET UP FOR TL IN SYNC R2-3 W1F11710
                    *                                                   W1F11720
                    ACKQ  LD    1 XACK-T                                W1F11730
                          BSC  L  ID,+-      BR IF XMIT-ACK NOT ON      W1F11740
                          XIO  L  WTSOR      WRITE ACK                  W1F11750
                          LD    1 ACK-T                             2-2 W1F11760
                          CALL    IOLOG      LOG ACK XMITTED        2-2 W1F11770
                          MDX     PAD1       WRITE PAD, TL TO SYNC R2-3 W1F11780
                    *                                                   W1F11790
                    ID    BSC  L  WTDLE      GO SEND IDLE               W1F11800
                    *                                                   W1F11810
                    TLTM  SLA     16                                    W1F11820
                          STO   1 TOIND-T    TURN OFF TIMEOUT IND.      W1F11830
                          LD    1 TOCNT-T                               W1F11840
                          A     1 D1-T       ALTERNATE TL AND IDLE      W1F11850
                          STO   1 TOCNT-T                               W1F11860
                          BSC  L  *+1,E      BR TO SET UP TL            W1F11870
                          MDX     RCW+3      BR TO SEND CL IDLE         W1F11880
                          XIO     WTIDL      WRITE IDLE                 W1F11890
                          LD    1 IDLE-T                            2-2 W1F11900
                          CALL    IOLOG      LOG IDLE XMITTED       2-2 W1F11910
                          SLA     16                                    W1F11920
                          STO   1 XEOI-T     TURN OFF XMIT EOI IND      W1F11930
                          MDX     PAD1       WRITE PAD, TL TO SYNC R2-3 W1F11940
                    *                                                   W1F11950
                          HDNG    SCAT1 *** RECEIVE - READ RESPONSE **  W1F11960
                    *************************************************** W1F11970
                    *                                                   W1F11980
                    *              READ RESPONSE FOR RECEIVE FUNCTION   W1F11990
                    *                                                   W1F12000
                    *************************************************** W1F12010
                    RCR   BSC  L  RCRCK,+Z   BR IF CHECK BIT IS ON      W1F12020
                          LD    1 DATA-T                                W1F12030
                          BSC  L  RECRD,Z    BR IF RECEIVING A RECORD   W1F12040
                          LD    1 LCNTL-T                               W1F12050
                          BSC  L  LCON,Z     BR IF LEADER CONTROL IS ON W1F12060
                    *                                                   W1F12070
                          LD      *                                     W1F12080
                          STO   1 LCNTL-T    TURN ON LEADER CONTROL     W1F12090
                          LD    1 RCVER-T                               W1F12100
                          BSC  L  STATX,Z    BR IF RCV-ERR IS ON    2-2 W1F12110
                    *                                                   W1F12120
                          LD    1 CLSW-T                                W1F12130
                          BSC  L  SWON,Z     BR IF LAST CHAR WAS CL     W1F12140
                    *                                                   W1F12150
                          XIO   1 LOAD-T     LOAD SYNC REG WITH IDLE2-2 W1F12160
                          LD    1 BUF-T      IS BUF = INQ               W1F12170
                          EOR   1 INQC-T                                W1F12180
                          BSC  L  CKBSY,+-   BR TO CHECK RTN BUSY       W1F12190
                    *                                                   W1F12200
                          LDD   1 ACK-T      IS BUF = CORRECT SOR       W1F12210
                          SLT     16                                    W1F12220
                          EOR   1 BUF-T                                 W1F12230
                          BSC  L  STATX,Z    BR IF NOT RIGHT SOR    2-2 W1F12240
                    *                                                   W1F12250
                          STO   1 XERR-T     TURN OFF XMIT-ERR          W1F12260
                          STO   1 XACK-T     TURN OFF XMIT-ACK          W1F12270
                          STO   1 COUNT-T    CLEAR WORD COUNT           W1F12280
                          STO   1 LRC-T      CLEAR LRC                  W1F12290
                          LD    1 IOAR-T                                W1F12300
                          A     1 D1-T                                  W1F12310
                          STO   1 POINT-T    SET UP I/O AREA POINTER    W1F12320
                          STO   1 DATA-T     TURN ON DATA SWITCH        W1F12330
                          STO     TMOUT      SET TIMEOUT INDICATOR      W1F12340
                          XIO     TIME       *** STOP TIMEOUT           W1F12350
                          BSC  I  INT1       EXIT TO ILS            2-2 W1F12360
                    *             THE TIMEOUT IS STOPPED TO ALLOW       W1F12370
                    *             RECORDS WHICH EXCEED 3 SECONDS        W1F12380
                    *             TO BE RECEIVED                        W1F12390
                    *                                                   W1F12400
                    *                                                   W1F12410
                    CKBSY LD    1 RTBSY-T                               W1F12420
                          BSC  L  STWT2,Z    START WRITE IF BUSY        W1F12430
                          MDX     QTEL-2     BR TO SEND IDLES, NOT BSY  W1F12440
                    *                                                   W1F12450
                          BSS  E  0                                     W1F12460
                    TIME  DC      0          STOP/START TIMEOUT         W1F12470
                          DC      /5420          IOCC                   W1F12480
                    TMOUT EQU     TIME       ON WHEN TIMEOUT STOPPED    W1F12490
                    LDTL  DC      TLC        LOAD SYNC REG WITH TL      W1F12500
                          DC      /5104          IOCC                   W1F12510
                    WTIDL DC      IDLE       WRITE IDLE                 W1F12520
                          DC      /5100           IOCC                  W1F12530
                    H0600 DC      /0600      CONSTANT 0600              W1F12540
                    *                                                   W1F12550
                    *                                                   W1F12560
                    SWON  LD    1 BUF-T                                 W1F12570
                          EOR   1 EOTC-T     BUF = EOT                  W1F12580
                          BSC  L  QTEL,Z     NO, BRANCH                 W1F12590
                          STO  I  IOAR       CLEAR WORD COUNT           W1F12600
                          LD      *                                     W1F12610
                          STO   1 XEOT-T     TURN ON XMIT-EOT           W1F12620
                          BSC  L  ALH        GO SEND 1.5 SEC IDLES  2-2 W1F12630
                    *                                                   W1F12640
                    QTEL  EOR     H0600                                 W1F12650
                          BSC  L  TELUS,+-   BUF = TEL, GO TELL USER    W1F12660
                          EOR  L  H6500                                 W1F12670
                          BSC  L  STATX,Z    BR IF NOT IDLE         2-2 W1F12680
                    QTEL1 LD      *                                     W1F12690
                          STO   1 XEOI-T     TURN ON XMIT-EOI           W1F12700
                          MDX     QTEL-2     GO SEND IDLES              W1F12710
                    *                                                   W1F12720
                    *                        PROCESS DATA PORTION       W1F12730
                    *                        OF RECORD                  W1F12740
                    RECRD LD    1 RCVER-T                               W1F12750
                          BSC  L  RCT,Z      BR IF RCV-ERR ON           W1F12760
                          LD      ABRT1                                 W1F12770
                          BSC  L  CKSEQ,Z    BR IF POSSIBLE ABORT       W1F12780
                          LD    1 LCNTL-T                               W1F12790
                          BSC  L  VALID,Z    BR IF LEADER CONTROL ON    W1F12800
                          LD      *                                     W1F12810
                          STO   1 LCNTL-T    TURN ON LEADER CONTROL     W1F12820
                          LD    1 XRLRC-T                               W1F12830
                          BSC  L  LAST,+-    BR IF NO ILRC              W1F12840
                          LD    1 BUF-T      COMPARE LRC S              W1F12850
                          EOR   1 LRC-T                                 W1F12860
                          OR    1 XERR-T                            2-5 W1F12865
                          STO   1 XERR-T     TURN ON XMIT-ERR IF NOT 0  W1F12870
                          SLA     16                                    W1F12880
                          STO   1 XRLRC-T    CLEAR XR-ILRC              W1F12890
                          STO   1 LRC-T      CLEAR LRC BUCKET           W1F12900
                          MDX     Z          EXIT TO ILS                W1F12910
                    *                                                   W1F12920
                    LAST  STO   1 DATA-T     TURN OFF DATA SWITCH       W1F12930
                          LD    1 COUNT-T                               W1F12940
                          STO  I  IOAR       STORE CNT OF WDS RCVED     W1F12950
                          LD    1 BUF-T                                 W1F12960
                          EOR   1 LRC-T      COMPARE LRC S              W1F12970
                          BSC  L  CLEAR,Z    BR IF NO EQUAL COMPARE     W1F12980
                          STO   1 LRC-T      CLEAR LRC BUCKET           W1F12990
                    *                                                   W1F13000
                          LD    1 XERR-T                                W1F13010
                          BSC  L  B10,Z      XMIT-ERR ON, BRANCH        W1F13020
                          STO   1 RTBSY-T    CLEAR ROUTINE BUSY         W1F13030
                          MDX     QTEL-2     GOTO SEND IDLES            W1F13040
                    *                                                   W1F13050
                    CLEAR SLA     16                                    W1F13060
                          STO   1 LRC-T      CLEAR LRC BUCKET           W1F13070
                          MDX  L  LRCNT,+1   NO. OF LRC ERRORS      2-2 W1F13080
                          MDX     B10        GO TURN ON XMIT-ERR        W1F13090
                    *                                                   W1F13100
                    VALID LD    1 BUF-T      CHECK FOR VALID DATA CHAR. W1F13110
                          BSI     CHECK                                 W1F13120
                          MDX     INVAL      CONTROL CHAR OR 4/8 ERROR  W1F13130
                    *                                                   W1F13140
                    ROOMQ LD    1 COUNT-T    IS THERE ROOM IN I/O AREA  W1F13150
                          EOR   1 WDCNT-T                               W1F13160
                          BSC  L  RCRCK,+-   NO, BRANCH                 W1F13170
                          MDX  L  COUNT,+1   UP COUNT OF WORDS          W1F13180
                          LD    1 BUF-T                                 W1F13190
                          STO  I  POINT      STORE CHAR IN I/O AREA     W1F13200
                          EOR   1 LRC-T                                 W1F13210
                          STO   1 LRC-T      BUILD LRC                  W1F13220
                          MDX  L  POINT,+1   UP I/O AREA POINTER        W1F13230
                    *                                                   W1F13240
                          LD    1 BUF-T                                 W1F13250
                          EOR   1 RM-T       IS CHARACTER A RECORD MARK W1F13260
                          BSC     Z                                     W1F13270
                          EOR   1 GMC-T      OR A GROUP MARK            W1F13280
                          BSC     Z                                     W1F13290
                          MDX     NZ         NO, EXIT TO ILS            W1F13300
                    *                                                   W1F13310
                          LD    1 ILRC-T     YES, IF AN ILRC REQUESTED  W1F13320
                          STO   1 XRLRC-T         TURN ON XR-ILRC       W1F13330
                    Z     BSC  I  INT1,+-    EXIT TO ILS            2-2 W1F13340
                    TLTIM SLA     16         IF ILRC IS ON,             W1F13350
                          STO   1 LCNTL-T    TURN OFF LEADER CONTROL    W1F13360
                          MDX     Z          EXIT TO ILS                W1F13370
                    *                                                   W1F13380
                    *                                                   W1F13390
                    RCRCK LD      TMOUT      HAS TIMEOUT BEEN STOPPED   W1F13400
                          BSC     Z          NO, BRANCH                 W1F13410
                          XIO     TIME       START TIMEOUT              W1F13420
                    SPEFL SLA     16                                    W1F13430
                          STO     TMOUT      TURN OFF TIMEOUT IND.      W1F13440
                          HDNG    SCAT1 **** RECEIVE - TIMEOUT *******  W1F13450
                    *************************************************** W1F13460
                    *                                                   W1F13470
                    *             TIMEOUT FOR RECEIVE                   W1F13480
                    *                                                   W1F13490
                    *************************************************** W1F13500
                    RCT   LDD     *                                 2-9 W1F13510
                          STD   1 DATA-T     TURN ON DATA SWITCH    2-9 W1F13520
                    *             RCVER      TURN ON RCV-ERROR      2-9 W1F13530
                          STO   1 LCNTL-T    TURN ON LEADER CONTROL     W1F13540
                          LD    1 BUF-T                                 W1F13550
                          EOR     HFF00      IS BUF = ALL ONES          W1F13560
                    NZ    BSC  I  INT1,Z     NO, EXIT TO ILS        2-2 W1F13570
                          LD      *          RESET SCA ON MARKING LN2-2 W1F13580
                          STO   1 XEOI-T     FORCE TMT OF IDLES BACK2-2 W1F13590
                          XIO   1 ENDOP-T    RESET CP MEMORY AND SCA2-2 W1F13600
                    *                                                   W1F13610
                    B10   SLT     32                                2-9 W1F13620
                          STD   1 DATA-T     TURN OFF DATA SWITCH   2-9 W1F13630
                    *             RCVER      TURN OFF RCV-ERROR     2-9 W1F13640
                          LD    1 RTBSY-T    DO NOT SET ERROR IF NOT2-2 W1F13650
                          BSC  L  RCTIM,+-   *BUSY OR IF AN ACK HAS 2-2 W1F13660
                          LD    1 XACK-T     *NOT BEEN SENT YET FROM2-2 W1F13670
                          BSC  L  RCTIM,Z    *LAST GOOD TRANSMISSION2-2 W1F13680
                          LD      SPEFL      GET SPECIAL FLAG       2-5 W1F13690
                          CALL    IOLOG                             2-5 W1F13700
                          LD      RCVU       RECEIVE ERROR          2-5 W1F13710
                          STO   1 XERR-T     TURN ON XMIT-ERR.      2-5 W1F13720
                          BSC  L  B8-1       GO DECRE RETRY             W1F13730
                    *                                                   W1F13740
                    RCTIM LD    1 RCVER-T    IF RCV ERROR,          2-2 W1F13750
                          BSC  L  B10,Z      XMIT ERR, RESET IND.   2-2 W1F13760
                          MDX  L  RCVTO,+1   TIME OUT IN RECEIVE    2-2 W1F13770
                          LDD     RCVU       FOR TIMEOUT,           2-9 W1F13780
                          STD   1 LCNTL-T    TURN ON LEADER CONTROL 2-9 W1F13790
                    *             XEOI       TURN ON XMIT-EOI       2-9 W1F13800
                          STO   1 TOIND-T    TURN ON TIMEOUT IND.       W1F13810
                          MDX     RCTIM-2    GO DECRE RETRY         2-5 W1F13820
                    *                                                   W1F13830
                    *                                                   W1F13840
                    *                                                   W1F13850
                    RCVU  DC      /0800      RECEIVE ERROR   CODE 0800  W1F13860
                    HFF00 DC      /FF00      CONSTANT FF00              W1F13870
                    H0C00 DC      /0C00      CONSTANT 0C00              W1F13880
                    D6    DC      +6         CONSTANT 0006              W1F13900
                    CNT48 DC      0          BIT BUCKET 4/8             W1F13910
                    H0004 DC      /0004      CONSTANT 0004              W1F13920
                    HF000 DC      /F000      CONSTANT F000              W1F13930
                    ABRT1 DC      0          ABORT IND ON IF CL IN DATA W1F13940
                    HA600 DC      /A600      CONSTANT A600              W1F13950
                    H6C00 DC      /6C00                                 W1F13960
                    *                                                   W1F13970
                    *                                                   W1F13980
                    INVAL LD    1 BUF-T                                 W1F13990
                          EOR   1 IDLE-T                                W1F14000
                          BSC  I  INT1,+-    EXIT IF IDLE IN BUF    2-2 W1F14010
                    *                                                   W1F14020
                          EOR     H0C00      IS BUF = TL                W1F14030
                          BSC  L  TLTIM,+-   BR IF BUF = TL             W1F14040
                          EOR     H6C00      IS BUF = CL                W1F14050
                          BSC  L  ABORT,+-   BR IF YES                  W1F14060
                          EOR     HA600      IF BUF = FF                W1F14070
                          BSC  L  RCRCK,+-   GO DECRE RETRY, TURN AROND W1F14080
                    *                                                   W1F14090
                    ABRT  LD      HF000      SET CHARACTER TO F0        W1F14100
                          STO   1 BUF-T                                 W1F14110
                          STO   1 XERR-T     TURN ON XMIT-ERR           W1F14120
                          MDX     ROOMQ      CONTINUE AS IF GOOD DATA   W1F14130
                    *                                                   W1F14140
                    ABORT LD      *                                     W1F14150
                          STO     ABRT1      TURN ON ABORT IND.         W1F14160
                          MDX     ABRT                                  W1F14170
                    *                                                   W1F14180
                    CKSEQ SLA     16                                    W1F14190
                          STO     ABRT1      TURN OFF ABORT IND         W1F14200
                          LD    1 BUF-T                                 W1F14210
                          EOR   1 IDLE-T                                W1F14220
                          BSC  L  XMITI,+-   BR IF BUF = IDLE           W1F14230
                          MDX     VALID      NOT ABORT, SO CONTINUE     W1F14240
                    *                                               2-2 W1F14250
                    STATX MDX  L  RCSEQ,+1   INVALID SEQ IN RECEIVE     W1F14260
                          MDX     RCT        BR TO PROCESS ERROR        W1F14270
                          HDNG    SCAT1 ** CHECK ON 4/8 AND CONTROL **  W1F14280
                    CHECK DC      0                                     W1F14290
                          SRA     8          IS IT A VALID DATA CHAR.   W1F14300
                          BSC  L  *+1,E                                 W1F14310
                          MDX     CK48       CHECK FOR CONTROL CHAR.    W1F14320
                          SRA     4                                     W1F14330
                          EOR   1 D0003-T                               W1F14340
                          BSC  L  ER48,+-                               W1F14350
                          EOR     D6                                    W1F14360
                          BSC  L  ER48,+-                               W1F14370
                    *                                                   W1F14380
                    CK48  LD    1 BUF-T      CHECK 4/8 CODE             W1F14390
                          STX   2 XR2+1                                 W1F14400
                          LDX   2 0                                     W1F14410
                          BSC     +Z         BIT 0                      W1F14420
                          MDX   2 +1                                    W1F14430
                          SLA     1                                     W1F14440
                          BSC     +Z         BIT 1                      W1F14450
                          MDX   2 +1                                    W1F14460
                          SLA     1                                     W1F14470
                          BSC     +Z         BIT 2                      W1F14480
                          MDX   2 +1                                    W1F14490
                          SLA     1                                     W1F14500
                          BSC     +Z         BIT 3                      W1F14510
                          MDX   2 +1                                    W1F14520
                          SLA     1                                     W1F14530
                          BSC     +Z         BIT 4                      W1F14540
                          MDX   2 +1                                    W1F14550
                          SLA     1                                     W1F14560
                          BSC     +Z         BIT 5                      W1F14570
                          MDX   2 +1                                    W1F14580
                          SLA     1                                     W1F14590
                          BSC     +Z         BIT 6                      W1F14600
                          MDX   2 +1                                    W1F14610
                          SLA     1                                     W1F14620
                          BSC     +Z         BIT 7                      W1F14630
                          MDX   2 +1                                    W1F14640
                          STX   2 CNT48                                 W1F14650
                    XR2   LDX  L2 *-*        RESTORE REGISTER 2         W1F14660
                          LD      CNT48                                 W1F14670
                          EOR     H0004      WERE 4 BITS ON             W1F14680
                          BSC  L  ER48,Z                                W1F14690
                          MDX  L  CHECK,+1   NO ERRORS                  W1F14700
                    ER48  BSC  I  CHECK                                 W1F14710
                    SVTIM LD      ZILCH      GET TIME-OUT INDICATOR 2-2 W1F14720
                          CALL    IOLOG      LOG TIME OUT           2-2 W1F14730
                          BSC  L  TMCHK      GO BACK TO SCAT        2-2 W1F14740
                    ZILCH DC      /1111                             2-2 W1F14750
                    PAD   DC      0          ENTER PAD SET UP       2-3 W1F14751
                          LD      *                                 2-3 W1F14752
                          STO   1 XPAD-T     TURN ON XMIT PAD INDR  2-3 W1F14753
                          BSC  I  INT1       EXIT TO ILS            2-3 W1F14754
                    *                                               2-3 W1F14755
                    GOPAD XIO  L  WTIDL      WRITE PAD  -IDLE-      2-3 W1F14756
                          SLA     16                                2-3 W1F14757
                          STO   1 XPAD-T     TURN OFF XMIT PAD ENDR 2-3 W1F14758
                          LD    1 IDLE-T                            2-3 W1F14759
                          CALL    IOLOG      LOG PAD -IDLE- XMITTED 2-3 W1F14760
                          BSC  I  PAD        RETURN TO NORMAL FLOW  2-3 W1F14761
                          END                                       2-3 W1F14771
