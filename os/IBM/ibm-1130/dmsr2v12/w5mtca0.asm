                          HDNG    MTCA0 - ISS FOR THE MTCA              W5B00010
                          LIBR                                          W5B00020
                          ISS  14 MTCA0     3                           W5B00030
                    *                                                   W5B00040
                    *                                                   W5B00050
                    *************************************************** W5B00060
                    *STATUS - VERSION 2, MODIFICATION 9               * W5B00070
                    *                                                 * W5B00080
                    *SUBROUTINE NAME                                  * W5B00090
                    *   FULL NAME - BASE SECTION OF THE MULTIPLE      * W5B00100
                    *               TERMINAL COMMUNICATIONS ADAPTER   * W5B00110
                    *               (MTCA) IOCS PACKAGE               * W5B00120
                    *   CODE NAME - MTCA0                             * W5B00130
                    *                                                 * W5B00140
                    *PURPOSE -                                        * W5B00150
                    *   MTCA0 IS THE INTERFACE FOR ASSEMBLER LANGUAGE * W5B00160
                    *   USERS OF THE MTCA IOCS PACKAGE                * W5B00170
                    *   IN CONJUCTION WITH ITS TERMINAL SELECT        * W5B00180
                    *   MODULES AND THE PARAMETER SUBROUTINE MTCAP,   * W5B00190
                    *   MTCA0 PROVIDES THOSE FUNCTIONS NECESSARY FOR  * W5B00200
                    *   CONTROL OF A COMMUNICATIONS NETWORK SUPPORTED * W5B00210
                    *   BY THE MTCA                                   * W5B00220
                    *                                                 * W5B00230
                    *METHOD -                                         * W5B00240
                    *   MTCA0 ANALYSES AND INITIATES THE FUNCTIONS    * W5B00250
                    *   REQUESTED BY THE USER. SHOULD AN ERROR OCCUR  * W5B00260
                    *   OR THE CALLING SEQUENCE BE INVALID, AN ERROR  * W5B00270
                    *   PROCEDURE IS INITIATED. WHERE THE REQUESTED   * W5B00280
                    *   FUNCTION IS DEPENDENT UPON THE PARTICULAR     * W5B00290
                    *   TERMINAL TYPE, MTCA0 ENTERS THE TERMINAL SEL- * W5B00300
                    *   ECT MODULE FOR THAT LINE.                     * W5B00310
                    *   INFORMATION REQUIRED BY MTCA0 AND THE T.S.    * W5B00320
                    *   MODULES IN ORDER TO KEEP A CORRECT CONTROL OF * W5B00330
                    *   EACH LINE IS STORED IN THE FORM OF LINE CON-  * W5B00340
                    *   TROL BLOCKS. DURING INITIALIZATION MTCA0 SETS * W5B00350
                    *   UP THESE BLOCKS FROM INFORMATION CONTAINED IN * W5B00360
                    *   THE PARAMETER SUBROUTINE MTCAP.               * W5B00370
                    *   MTCA HARDWARE RESPONSES (LEVEL 3) ARE HANDLED * W5B00380
                    *   BY MTCA0 AS FOLLOWS -                         * W5B00390
                    *      BIT 8 - MTCA ADAPTER BASE                  * W5B00400
                    *              DSW1 IS SENSED AND THE RELEVANT    * W5B00410
                    *              TSM IS ENTERED FOR SERVICE         * W5B00420
                    *      BIT 9 - MTCA INTERRUPT GENERATOR           * W5B00430
                    *              THE TIMER WORD IN EACH LCB IS      * W5B00440
                    *              EXAMINED FOR ANY REQUESTED TIMEOUT * W5B00450
                    *              CONDITION. WHERE NECESSARY THE     * W5B00460
                    *              APPROPRIATE TIMEOUT SUBROUTINE IS  * W5B00470
                    *              ENTERED TO CARRY OUT THE REQUESTED * W5B00480
                    *              FUNCTION                           * W5B00490
                    *                                                 * W5B00500
                    *CAPABILITIES AND LIMITATIONS - N/A               * W5B00510
                    *                                                 * W5B00520
                    *ADDITIONAL INFORMATION-                          * W5B00530
                    *   ERROR PROCEDURES -                            * W5B00540
                    *      INVALID CALLING PARAMETERS CAUSE A WAIT AT * W5B00550
                    *      $PRET, AN INVALID DSW1 WILL CAUSE A WAIT   * W5B00560
                    *      AT $PST3                                   * W5B00570
                    *      THE USER WILL BE NOTIFIED OF RECOVERABLE   * W5B00580
                    *      ERRORS BY MEANS OF A BSI INTO HIS ERROR    * W5B00590
                    *      SUBROUTINE. IN CERTAIN CASES, SUBSEQUENT   * W5B00600
                    *      ACTION WILL DEPEND UPON THE STATE OF THE   * W5B00610
                    *      ACCUMULATOR ON RETURN FROM THE USER        * W5B00620
                    *   CALLING SEQUENCE -                            * W5B00630
                    *      LIBF    MTCA0                              * W5B00640
                    *      DC      CTRL      CONTROL PARAMETER        * W5B00650
                    *      DC      AREA      USERS I/O AREA           * W5B00660
                    *      DC      ERROR     USERS ERROR SUBROUTINE   * W5B00670
                    *     WHERE CTRL IS OF THE FORM /X0YY AND         * W5B00680
                    *      DETAILS THE REQUESTED FUNCTION -           * W5B00690
                    *         X IS THE FUNCTION DIGIT                 * W5B00700
                    *            0 - TEST                             * W5B00710
                    *            1 - READ  (RCV)                      * W5B00720
                    *            2 - WRITE (TMT)                      * W5B00730
                    *            3 - CONNECT LINE                     * W5B00740
                    *            4 - DISCONNECT LINE                  * W5B00750
                    *            5 - PASS/RESET LINE STATISTICS       * W5B00760
                    *            6 - DIAGNOSE TERMINAL ADAPTER        * W5B00770
                    *            7 - INITIALIZE                       * W5B00780
                    *            8 - HALT (DISABLE MTCA)              * W5B00790
                    *         YY IS THE LINE NUMBER (IN HEX)          * W5B00800
                    *                                                 * W5B00810
                    *************************************************** W5B00820
                    *                                                   W5B00830
                    *                                                   W5B00840
                    *************************************************** W5B00850
                    *                                                 * W5B00860
                    *           USE OF 'TIMER' BY MTCA0               * W5B00870
                    *                                                 * W5B00880
                    *************************************************** W5B00890
                    *                                                 * W5B00900
                    *                 'X00Y'                          * W5B00910
                    *     WHERE -                                     * W5B00920
                    *          X IS THE FUNCTION DIGIT,               * W5B00930
                    *            1  RCV DATA TIMEOUT                  * W5B00940
                    *            2  TMT DATA TIMEOUT                  * W5B00950
                    *            3  CONNECT ADAPTER TIMEOUT           * W5B00960
                    *            4  DISCONNECT ADAPTER TIMEOUT        * W5B00970
                    *            5  REQUEST WRAP AND TEST ADAPTER     * W5B00980
                    *            6  WRAP ADAPTER TIMEOUT              * W5B00990
                    *            7  WRAP DATA TIMEOUT                 * W5B01000
                    *            8  RECONNECT ADAPTER TIMEOUT         * W5B01010
                    *            9  REPORT PRE-TMT ERROR              * W5B01020
                    *          Y IS THE COUNT IN TIMER UNITS          * W5B01030
                    *                                                 * W5B01040
                    *************************************************** W5B01050
                    *                                                   W5B01060
                    *                                                   W5B01070
                    *************************************************** W5B01080
                    *                                                 * W5B01090
                    *        EQUIVALENCES FOR LCB PARAMETERS          * W5B01100
                    *                                                 * W5B01110
                    *************************************************** W5B01120
                    *                                                   W5B01130
                    LNBSY EQU     0         LINE BUSY FLAG              W5B01140
                    TSMAD EQU     1         TERM SEL MOD ADDRESS        W5B01150
                    IPPTR EQU     2         INPUT DATA POINTER          W5B01160
                    IPCNT EQU     3         INPUT DATA COUNT            W5B01170
                    OPPTR EQU     4         OUTPUT DATA POINTER         W5B01180
                    OPCNT EQU     5         OUTPUT DATA COUNT           W5B01190
                    ERROR EQU     6         ERROR ROUTINE ADDRESS       W5B01200
                    CNTRL EQU     7         LINE CONTROL FLAGS          W5B01210
                    DIAGN EQU     8         DIAGNOSTIC CONTROL          W5B01220
                    TIMER EQU     9         TIMER CONTROL               W5B01230
                    RXPTR EQU     10        RCV DATA LOCATION           W5B01240
                    TXPTR EQU     11        TMT DATA LOCATION           W5B01250
                    STATC EQU     12        STATISTICS DATA COUNT       W5B01260
                    *                                                 * W5B01270
                    *      EQUIVALENCE FOR ERROR TRAP ENTRIES         * W5B01280
                    *                                                 * W5B01290
                    $PRET EQU     /28       PREOPERATIVE ERR TRAP       W5B01300
                    $PST3 EQU     /89       INT LEVEL 3 ERR TRAP        W5B01310
                    *                                                   W5B01320
                    *                                                   W5B01330
                    *************************************************** W5B01340
                    *                                                 * W5B01350
                    *             ENTRY POINTS                        * W5B01360
                    *                                                 * W5B01370
                    *************************************************** W5B01380
                    *                                                 * W5B01390
                    *             CALL HANDLER ENTRY                  * W5B01400
                    *                                                 * W5B01410
                    MTCA0 STX   1 MT240+1   STORE INDEX REG 1           W5B01420
                          LDX  I1 *-*       LOAD ADDR OF PARAM LIST     W5B01430
                          B       MT010     BR TO CALL HANDLER          W5B01440
                    *                                                 * W5B01450
                    *        END OF OPERATION INTERRUPT ENTRY         * W5B01460
                    *                                                 * W5B01470
                    MT004 DC      *-*                                   W5B01480
                          B    L  MT500     GO SERVICE INTERRUPT        W5B01490
                    *                                                 * W5B01500
                    *           TIMER INTERRUPT ENTRY                 * W5B01510
                    *                                                 * W5B01520
                    MT007 DC      *-*                                   W5B01530
                          B    L  MT600     GO SERVICE INTERRRUPT       W5B01540
                    *                                                   W5B01550
                    *                                                   W5B01560
                    *************************************************** W5B01570
                    *                                                 * W5B01580
                    *             CALL HANDLER                        * W5B01590
                    *                                                 * W5B01600
                    *************************************************** W5B01610
                    *                                                   W5B01620
                    MT010 STX   1 MT270+1   SAVE RETURN ADDRESS         W5B01630
                          STX   2 MT250+1   STORE INDEX REG 2           W5B01640
                          STD     MT900     STORE ACC & EXT             W5B01650
                          STS     MT260     STORE STATUS                W5B01660
                          LD    1 0         LOAD CONTROL WORD           W5B01670
                          BN      MT060     BR TO TEST FOR HALT         W5B01680
                    *                                                   W5B01690
                          EOR     MT904     TEST FOR INITIALIZE         W5B01700
                          BZ      MT400     BR IF INITIALIZE            W5B01710
                    *                                                   W5B01720
                          LD      MT908     TEST INITIALIZE SWITCH      W5B01730
                          BZ      MT070     BR IF NOT INITIALIZED       W5B01740
                    *                                                   W5B01750
                          LDX  I2 MT940     LOAD ADDR OF MTCAP          W5B01760
                          LD    1 0         LOAD CONTROL WORD           W5B01770
                          AND     MT906     GET LINE NO.                W5B01780
                          BZ      MT090     BR IF INVALID LINE NO.      W5B01790
                    *                                                   W5B01800
                          S     2 0         SUB HIGHEST LINE NO.        W5B01810
                          BP      MT090     BR IF INVALID LINE NO.      W5B01820
                    *                                                   W5B01830
                          A     2 0         RESTORE LINE NUMBER         W5B01840
                          STX   2 MT020+1   CALCULATE LCB ADDRESS       W5B01850
                          A       MT020+1   *FOR THIS LINE              W5B01860
                          STO     MT020+1                               W5B01870
                    MT020 LDX  I2 *-*       PUT INTO XR2                W5B01880
                          MDX   2 0         CHECK FOR NON ZERO          W5B01890
                          SKP     +         VALID - THEREFORE SKIP      W5B01900
                          B       MT090     BR FOR INVALID LINE         W5B01910
                    *                                                   W5B01920
                          LD    1 0         LOAD CONTROL WORD           W5B01930
                          AND     MT904     EXAMINE COMMAND             W5B01940
                          BZ      MT110     BR IF TEST COMMAND          W5B01950
                    *                                                   W5B01960
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B01970
                    *          CHECK STATE OF LINE                    * W5B01980
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B01990
                    *                                                   W5B02000
                    MT030 LD    2 LNBSY     TEST BUSY FLAG              W5B02010
                          BNZ     MT030     BR IF LINE IS BUSY          W5B02020
                    *                                                   W5B02030
                          OR      MT914     SET LINE ABOUT TO           W5B02040
                          STO   2 LNBSY     *BE BUSY FLAG               W5B02050
                    MT040 LD    2 DIAGN     TEST FOR DIAGNOSTIC         W5B02060
                          BNZ     MT040     LOOP IF YES                 W5B02070
                    *                                                   W5B02080
                          LD    1 0         LOAD CONTROL WORD           W5B02090
                          SRA     12                                    W5B02100
                          A       MT912     SET UP COMMAND ADDRESS      W5B02110
                          STO     MT050+1                               W5B02120
                          LD    1 2         GET THIRD PARAMETER         W5B02130
                    MT050 B    I  *-*       BR TO EXECUTE COMMAND       W5B02140
                    *                                                   W5B02150
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B02160
                    *          TEST FOR STOP CYCLE STEAL              * W5B02170
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B02180
                    *                                                   W5B02190
                    MT060 SLA     1         TEST FOR HALT COMMAND       W5B02200
                          BNZ     MT080     BR IF INVALID COMMAND       W5B02210
                    *                                                   W5B02220
                          STO     MT908     CLEAR INITIALIZE FLAG       W5B02230
                          XIO     MT904     STOP CYCLE STEAL            W5B02240
                          B       MT120     GO SET RETURN ADDRESS       W5B02250
                    *                                                   W5B02260
                    *                                                   W5B02270
                    *************************************************** W5B02280
                    *                                                 * W5B02290
                    *          ERROR REPORTING                        * W5B02300
                    *                                                 * W5B02310
                    *************************************************** W5B02320
                    *                                                 * W5B02330
                    *          NOT INITIALIZED ERROR                  * W5B02340
                    *                                                 * W5B02350
                    MT070 SLT     16        ZEROISE EXTENSION           W5B02360
                          LD      MT914     SET FLAG IN ACCUMULATOR     W5B02370
                          B       MT100     GO TO ERROR TRAP            W5B02380
                    *                                                 * W5B02390
                    *        INVALID COMMAND ERROR                    * W5B02400
                    *                                                 * W5B02410
                    MT080 LD    1 0         LOAD CONTROL WORD           W5B02420
                          XCH               STORE IN EXT                W5B02430
                          LD      MT915     SET FLAG IN ACC             W5B02440
                          B       MT100     GO TO ERROR TRAP            W5B02450
                    *                                                 * W5B02460
                    *         INVALID LINE ERROR                      * W5B02470
                    *                                                 * W5B02480
                    MT090 LD    1 0         LOAD CONTROL WORD           W5B02490
                          XCH               STORE IN EXT                W5B02500
                          LD      MT916     SET FLAG IN ACC             W5B02510
                    MT100 BSI  L  $PRET     BR TO ERROR TRAP            W5B02520
                          B       MT100     LOOP IN TRAP                W5B02530
                    *                                                   W5B02540
                    *                                                   W5B02550
                    *************************************************** W5B02560
                    *                                                 * W5B02570
                    *             TEST COMMAND                        * W5B02580
                    *                                                 * W5B02590
                    *************************************************** W5B02600
                    *                                                   W5B02610
                    MT110 LD    2 LNBSY     LOAD BUSY FLAG              W5B02620
                          BSC     +-        BR IF BUSY                  W5B02630
                          MDX   1 1         SELECT RETURN ADDRESS       W5B02640
                    MT120 MDX   1 1         *ACCORDING TO FLAG          W5B02650
                          STX   1 MT270+1   SET RETURN ADDR             W5B02660
                          B       MT240     BR TO RESTORE               W5B02670
                    *                                                   W5B02680
                    *                                                   W5B02690
                    *************************************************** W5B02700
                    *                                                 * W5B02710
                    *             READ COMMAND                        * W5B02720
                    *                                                 * W5B02730
                    *************************************************** W5B02740
                    *                                                   W5B02750
                    MT200 STO   2 ERROR     SET ERROR ADDR              W5B02760
                          LD      MT919                                 W5B02770
                          STO   2 TIMER     SET TIME OUT FOR LINE       W5B02780
                          LD    1 1         GET BUFFER ADDRESS          W5B02790
                          STO   2 IPPTR     STORE IN LCB                W5B02800
                          LD      MT917     SET LINE BUSY               W5B02810
                          STO   2 LNBSY                                 W5B02820
                          LD   I1 1         LOAD COUNT                  W5B02830
                          STO   2 IPCNT     STORE IN LCB                W5B02840
                          MDX   1 3                                     W5B02850
                          B       MT120+1   RETURN TO CALLER            W5B02860
                    *                                                   W5B02870
                    *                                                   W5B02880
                    *************************************************** W5B02890
                    *                                                 * W5B02900
                    *             WRITE COMMAND                       * W5B02910
                    *                                                 * W5B02920
                    *************************************************** W5B02930
                    *                                                   W5B02940
                    MT210 STO   2 ERROR     SET ERROR ADDR              W5B02950
                          LD   I1 1         LOAD COUNT                  W5B02960
                          STO   2 OPCNT     STORE IN LCB                W5B02970
                          LD    1 1         LOAD COUNT ADDRESS          W5B02980
                          STO   2 OPPTR     STORE IN LCB                W5B02990
                          MDX   1 3                                     W5B03000
                          STX   1 MT270+1   SET RETURN ADDRESS          W5B03010
                          LD    2 TSMAD     SET ENTRY                   W5B03020
                          A       MT918     *INTO TERMINAL              W5B03030
                          STO     MT220+1   *SELECT MODULE              W5B03040
                    *                                                   W5B03050
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B03060
                    *          SET UP DISABLE TMT TIMEOUT             * W5B03070
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B03080
                    *                                                   W5B03090
                          LD      MT918     SET A CONSTANT              W5B03100
                          CALL    MTCAM     *OF VALUE TWO               W5B03110
                          ORG     *-2       *INTO THE TRANSFER          W5B03120
                          DC      /D400     *VECTOR OF                  W5B03130
                          ORG     *+1       *MTCAM ENTRY POINT          W5B03140
                          XIO     MT906     ENABLE TMT                  W5B03150
                    *                                                   W5B03160
                          LD      MT911     SET UP SENSE                W5B03170
                          STO     MT902     *DSW2 COMMAND               W5B03180
                          BSI     MT300     GO ISSUE XIO                W5B03190
                    *                                                   W5B03200
                          EOR     MT924     CHECK VALID FOR TMT         W5B03210
                          SRA     1         REMOVE OVERRUN BIT          W5B03220
                    MT220 BSI  L  *-*       BR TO TERMINAL SELECT       W5B03230
                    *                                                   W5B03240
                    *                                                   W5B03250
                    *************************************************** W5B03260
                    *                                                 * W5B03270
                    *        RETURN TO CALLING ROUTINE                * W5B03280
                    *                                                 * W5B03290
                    *************************************************** W5B03300
                    *                                                   W5B03310
                    MT230 LD    2 LNBSY     SET OFF CALLING             W5B03320
                          AND     MT917     *BITS IN                    W5B03330
                          STO   2 LNBSY     *LINE BUSY FLAG             W5B03340
                    MT240 LDX  L1 *-*       RESTORE REG 1               W5B03350
                    MT250 LDX  L2 *-*       RESTORE REG 2               W5B03360
                    MT260 LDS     0         RESTORE STATUS              W5B03370
                          LDD     MT900     RESTORE ACC & EXT           W5B03380
                    MT270 B    L  *-*       RETURN TO CALLER            W5B03390
                    *                                                   W5B03400
                    *                                                   W5B03410
                    *************************************************** W5B03420
                    *                                                 * W5B03430
                    *             CONSTANTS                           * W5B03440
                    *                                                 * W5B03450
                    *************************************************** W5B03460
                    *                                                   W5B03470
                    MT900 BSS  E  2         SAVE ACC AND EXT          E W5B03480
                    MT902 DC      *-*       UTILITY                   E W5B03490
                          DC      *-*       *IOCC                       W5B03500
                    MT904 DC      /7000     INITIALISE COMMAND        E W5B03510
                          DC      /FC9C     HALT CYCLE STEAL            W5B03520
                    MT906 DC      /00FF     LINE NUMB MASK            E W5B03530
                          DC      /FC0A     ENABLE TMT IOCC             W5B03540
                    MT908 DC      0         NOT INITIALIZED SWITCH      W5B03550
                    MT909 DC      /FC02     DISCONNECT IOCC             W5B03560
                    MT910 DC      /FC04     CONNECT IOCC                W5B03570
                    MT911 DC      /FF00     SENSE DSW2 IOCC             W5B03580
                    *                                                 * W5B03590
                    *          SERVICE COMMAND BRANCH TABLE           * W5B03600
                    *                                                 * W5B03610
                    MT912 DC      MT913-1                               W5B03620
                    MT913 DC      MT200     READ ENTRY                  W5B03630
                          DC      MT210     WRITE ENTRY                 W5B03640
                          DC      MT310     CONNECT ENTRY               W5B03650
                          DC      MT340     DISCONNECT ENTRY            W5B03660
                          DC      MT350     PASS STATISTICS             W5B03670
                          DC      MT390     DIAGNOSE ENTRY              W5B03680
                    *                                                   W5B03690
                    MT914 DC      /E001     NOT INITIALISED CODE        W5B03700
                    MT915 DC      /E002     INVALID COMMAND CODE        W5B03710
                    MT916 DC      /E003     INVALID LINE NO. CODE       W5B03720
                    MT917 DC      1         CONSTANT - ONE              W5B03730
                    MT918 DC      2         CONSTANT - TWO              W5B03740
                    MT919 DC      /100F     READ TIME OUT               W5B03750
                    MT920 DC      /3002     CONNECT TIME OUT            W5B03760
                    MT921 DC      /4002     DISCONNECT TIME OUT         W5B03770
                    MT922 DC      /5002     DIAGNOSE TIMEOUT            W5B03780
                    MT923 DC      /000F     MASK LAST DIGIT             W5B03790
                    MT924 DC      /0C00     CONNCTD & LNK ACTVE         W5B03800
                    *                                                   W5B03810
                    *                                                   W5B03820
                    *************************************************** W5B03830
                    *                                                 * W5B03840
                    *     XIO SUBROUTINE - OUT OF INTERRUPT           * W5B03850
                    *                                                 * W5B03860
                    *************************************************** W5B03870
                    *                                                   W5B03880
                    MT300 DC      *-*       ENTRY                       W5B03890
                          LD    2 TXPTR     CALCULATE                   W5B03900
                          SLA     12        *LINE                       W5B03910
                          SRA     8         *NUMBER                     W5B03920
                          EOR     MT902     BUILD UP IOCC               W5B03930
                          STO     MT902+1                               W5B03940
                          XIO     MT902     ISSUE XIO                   W5B03950
                          B    I  MT300     RETURN TO USER              W5B03960
                    *                                                   W5B03970
                    *                                                   W5B03980
                    *************************************************** W5B03990
                    *                                                 * W5B04000
                    *             CONNECT COMMAND                     * W5B04010
                    *                                                 * W5B04020
                    *************************************************** W5B04030
                    *                                                   W5B04040
                    MT310 LD      MT910     SET UP                      W5B04050
                          STO     MT902     *CONNECT IOCC               W5B04060
                          LD      MT920                                 W5B04070
                    MT320 STO   2 TIMER     SET TIME OUT FOR LINE       W5B04080
                    *                                                   W5B04090
                    *                                                   W5B04100
                    *************************************************** W5B04110
                    *                                                 * W5B04120
                    *     SBRTN FOR CONNECT/DISCONNECT                * W5B04130
                    *                                                 * W5B04140
                    *************************************************** W5B04150
                    *                                                   W5B04160
                          LD    1 1         LOAD ERROR ADDRESS          W5B04170
                          STO   2 ERROR     STORE IN LCB                W5B04180
                          BSI     MT300     GO ISSUE XIO                W5B04190
                          MDX   1 2                                     W5B04200
                    MT330 STX   1 MT270+1   SET RETURN ADDRESS          W5B04210
                          B       MT230     RETURN TO CALLER            W5B04220
                    *                                                   W5B04230
                    *                                                   W5B04240
                    *************************************************** W5B04250
                    *                                                 * W5B04260
                    *             DISCONNECT COMMAND                  * W5B04270
                    *                                                 * W5B04280
                    *************************************************** W5B04290
                    *                                                   W5B04300
                    MT340 LD      MT909     SET UP                      W5B04310
                          STO     MT902     *DISCONNECT IOCC            W5B04320
                          LD      MT921     GET TIME OUT FOR LINE       W5B04330
                          B       MT320     GO ISSUE XIO                W5B04340
                    *                                                   W5B04350
                    *                                                   W5B04360
                    *************************************************** W5B04370
                    *                                                 * W5B04380
                    *     PASS AND RESET LINE STATISTICS              * W5B04390
                    *                                                 * W5B04400
                    *************************************************** W5B04410
                    *                                                   W5B04420
                    MT350 LD    1 1         STORE THE STATISTICS        W5B04430
                          STO     MT370+1   *AREA ADDRESS               W5B04440
                          MDX   1 2         INCR POINTER                W5B04450
                          STX   1 MT270+1   SET RETURN ADDRESS          W5B04460
                          SLA     16        SET OFF                     W5B04470
                          STO   2 LNBSY     *LINE FLAG                  W5B04480
                          LD    2 STATC     LOAD NO. OF STATISTICS      W5B04490
                          AND     MT923     ISOLATE LAST DIGIT          W5B04500
                          BZ      MT240     EXIT IF ZERO                W5B04510
                    *                                                   W5B04520
                          STO     *+1                                   W5B04530
                          LDX  L1 *-*       PUT INTO XR1                W5B04540
                    MT360 LD    2 STATC+1   LOAD STATISTIC              W5B04550
                    MT370 STO  L  *-*       STORE                       W5B04560
                          SLA     16                                    W5B04570
                          STO   2 STATC+1   SET STATISTIC ZERO          W5B04580
                          MDX   2 1                                     W5B04590
                          MDM     MT370+1,1 INCR O/P POINTER            W5B04600
                          MDX   1 -1        SKIP AFTER LAST STAT.       W5B04610
                          B       MT360     BR FOR NEXT STATISTIC       W5B04620
                    MT380 B       MT240     BR TO RESTORE               W5B04630
                    *                                                   W5B04640
                    *                                                   W5B04650
                    *************************************************** W5B04660
                    *                                                 * W5B04670
                    *             DIAGNOSE COMMAND                    * W5B04680
                    *                                                 * W5B04690
                    *************************************************** W5B04700
                    *                                                   W5B04710
                    MT390 LD    1 1         LOAD ERROR ADDRESS          W5B04720
                          STO   2 ERROR     STORE IN LCB                W5B04730
                          LD      MT922     SET UP INITIATE             W5B04740
                          STO   2 TIMER     *DIAGNOSE TIMEOUT           W5B04750
                          MDX   1 2         SET RETURN ADDRESS          W5B04760
                          B       MT330     BR TO RESTORE               W5B04770
                          HDNG    MTCA0 - INITIALIZATION SUBROUTINE     W5B04780
                    *************************************************** W5B04790
                    *                                                 * W5B04800
                    *          INITIALIZATION SUBROUTINE              * W5B04810
                    *                                                 * W5B04820
                    *************************************************** W5B04830
                    *                                                 * W5B04840
                    * ON FIRST EXECUTION -                            * W5B04850
                    *   *  MTCA MODULES LINKED                        * W5B04860
                    *   *  LINE CONTROL BLOCKS SET UP                 * W5B04870
                    *   *  CYCLE STEAL BLOCK CALCULATED               * W5B04880
                    *   *  C/S LOCATIONS SET TO HEX 8000              * W5B04890
                    *   *  C/S IS ENABLED                             * W5B04900
                    * ON SUBSEQUENT EXECUTIONS                        * W5B04910
                    *   *  C/S LOCATIONS SET TO HEX 8000              * W5B04920
                    *   *  C/S IS ENABLED                             * W5B04930
                    *                                                 * W5B04940
                    * NOTE.  THE C/S BLOCK OVERLAYS PART OF THIS      * W5B04950
                    *        SUBROUTINE                               * W5B04960
                    *                                                 * W5B04970
                    *************************************************** W5B04980
                    *                                                   W5B04990
                    MT400 MDM  L  MT270+1,1 SET RETURN ADDRESS          W5B05000
                          STX     MT908     SET INITIALIZE FLAG         W5B05010
                          MDM  L  MT942,0   BEEN HERE BEFORE            W5B05020
                          B       MT460     *YES - RESTART ONLY         W5B05030
                    *                       *NO  - PERFORM LINKAGES     W5B05040
                    MT410 LD   I  MT940+1   PICK UP ADDRESS OF          W5B05050
                          STO     MT940     *USERS PARAMETER LIST       W5B05060
                          STO     MT610+1   *SAVE FOR TIMER USE         W5B05070
                    *                                                   W5B05080
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B05090
                    *   CALCULATE ADDRESS FOR CYCLE STEAL BLOCK       * W5B05100
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B05110
                    *                                                   W5B05120
                          LD      MT930     CALCULATE THE CYCLE         W5B05130
                          SRA     5         *STEAL BLOCK                W5B05140
                          A       MT948     *STARTING ADDRESS           W5B05150
                          SLA     5         *ON FIRST AVAILABLE         W5B05160
                          STO     MT942     *20 HEX BOUNDARY            W5B05170
                          S       MT948     SUBTRACT ONE AND            W5B05180
                          STO     MT470+1   *SAVE FOR LATER USE         W5B05190
                    *                                                   W5B05200
                          LDX  I1 MT940     SET XR1 AS POINTER TO       W5B05210
                    *                       *USER'S PARAM SBRTN         W5B05220
                          LD    1 0         PICK UP HIGHEST LINE        W5B05230
                          STO     MT420+1   *NUMBER AND SAVE            W5B05240
                          STO     MT944                                 W5B05250
                          BNP     MT450     BR IF INVALID               W5B05260
                    *                                                   W5B05270
                          S       MT931     CHECK NOT GREATER THAN      W5B05280
                          BP      MT450     *SIXTEEN - ELSE ERROR       W5B05290
                    *                                                   W5B05300
                    MT420 LD   L1 *-*       GET LCB ADDRESS             W5B05310
                          BZ      MT440     *EXIT IF ZERO               W5B05320
                    *                                                   W5B05330
                          STO     MT430+1   STORE LCB ADDRESS           W5B05340
                          A       MT948     ADD ONE                     W5B05350
                          STO     *+1       SET IN NEXT INSTRUCTION     W5B05360
                          LD   L  *-*       GET CALL TRANSFER           W5B05370
                          STO     MT940+1   *VECTOR AND SAVE            W5B05380
                    *                                                   W5B05390
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B05400
                    *          SET UP LINE CONTROL BLOCKS             * W5B05410
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B05420
                    *                                                   W5B05430
                          LDX   2 9         SET UP INDEX                W5B05440
                          SLA     16        CLEAR                       W5B05450
                    MT430 STO  L2 *-*       *ALL LINE                   W5B05460
                          MDX   2 -1        *CONTROL WORDS              W5B05470
                          B       MT430     GO CLEAR NEXT WORD          W5B05480
                    *                                                   W5B05490
                          LDX  I2 MT430+1   LCB ADDRESS IN XR2          W5B05500
                          STO   2 LNBSY     CLEAR BUSY FLAG             W5B05510
                          LD   I  MT940+1   SET ADDRESS OF TERM SEL     W5B05520
                          STO   2 TSMAD     *MODULE IN THE LCB          W5B05530
                          LD      MT420+1   GET HIGHEST LINE NO.        W5B05540
                          S       MT948     SET UP THE                  W5B05550
                          A       MT942     *RECEIVE AND                W5B05560
                          STO   2 RXPTR     *TRANSMIT CYCLE             W5B05570
                          A       MT931     *STEAL LOCATIONS            W5B05580
                          STO   2 TXPTR     *IN THE LCB                 W5B05590
                    *                                                   W5B05600
                    MT440 MDM  L  MT420+1,-1 DECREMENT DISPLACEMENT     W5B05610
                          B       MT420     *RETURN FOR NEXT LCB        W5B05620
                    *                                                   W5B05630
                          B       MT460     GO ENABLE CYCLE STEAL       W5B05640
                    *                                                   W5B05650
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B05660
                    *     INVALID LINE COUNT ERROR                    * W5B05670
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B05680
                    *                                                   W5B05690
                    MT450 SLT     16        CLEAR EXTENSION             W5B05700
                          LD      MT932     INSERT ERROR CODE           W5B05710
                          BSI  L  $PRET     GO REPORT                   W5B05720
                          B       MT450     LOOP ON ERROR               W5B05730
                    *                                                   W5B05740
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B05750
                    *    CONSTANTS USED FOR INITIALIZATION            * W5B05760
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B05770
                    *                                                   W5B05780
                    MT930 DC      MT410-1   FIRST AVAILABLE             W5B05790
                    *                       *LOCATION MINUS 1           W5B05800
                    MT931 DC      16        MAXIMUM LINE COUNT          W5B05810
                    MT932 DC      /E004     INVALID LINE COUNT          W5B05820
                    *                                                   W5B05830
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B05840
                    *   RESERVE ENOUGH STORAGE FOR C/S BLOCKS         * W5B05850
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B05860
                    *                                                   W5B05870
                          BSS     63-*+MT410                            W5B05880
                    *                                                   W5B05890
                    *                                                   W5B05900
                    *************************************************** W5B05910
                    *                                                 * W5B05920
                    *          ENABLE CYCLE STEAL                     * W5B05930
                    *                                                 * W5B05940
                    *************************************************** W5B05950
                    *                                                   W5B05960
                    MT460 LDX   1 32        SET UP INDEX                W5B05970
                          LD      MT948     PUT HEX 8000                W5B05980
                          SLA     15        *INTO ALL CYCLE             W5B05990
                    MT470 STO  L1 *-*       *STEAL LOCATIONS            W5B06000
                          MDX   1 -1        DECREMENT INDEX             W5B06010
                          B       MT470     RETURN                      W5B06020
                    *                                                   W5B06030
                          XIO     MT942     ENABLE CYCLE STEAL          W5B06040
                          B       MT380     BR TO RESTORE               W5B06050
                    *                                                   W5B06060
                          HDNG    MTCA0 - INTERRUPT SERVICE SUBROUTINES W5B06070
                    *************************************************** W5B06080
                    *                                                 * W5B06090
                    *    MTCA ADAPTER BASE RESPONSE HANDLER           * W5B06100
                    *                                                 * W5B06110
                    *************************************************** W5B06120
                    *                                                   W5B06130
                    MT500 LDX  I1 MT944     LINE COUNT IN XR1           W5B06140
                          XIO     MT944     SENSE DSW1                  W5B06150
                          STO     MT946+1   *AND SAVE                   W5B06160
                          SLCA  1           FIND ADAPTER                W5B06170
                          BNN     MT520     BR IF ERROR                 W5B06180
                    *                                                   W5B06190
                          STX   1 MT510+1   SAVE XR1                    W5B06200
                          LD      MT944     GET HIGHEST LINE            W5B06210
                          A       MT948     CALCULATE THIS              W5B06220
                          S       MT510+1   *LINE NUMBER                W5B06230
                          STO     MT510+1   *AND SAVE                   W5B06240
                          LD      MT940     GET LCB ADDRESS             W5B06250
                          A       MT510+1   FOR THIS LINE               W5B06260
                          STO     *+1                                   W5B06270
                    MT510 LDX  I2 *-*       PUT INTO XR2                W5B06280
                          MDX   2 0         CHECK NON ZERO ADDR         W5B06290
                          B       MT530     BR IF GOOD                  W5B06300
                    *                                                   W5B06310
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B06320
                    *          INVALID DSW1 SENSED                    * W5B06330
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B06340
                    *                                                   W5B06350
                    MT520 LDD     MT946     GET ERROR CODE              W5B06360
                          BSI  L  $PST3     REPORT ERROR                W5B06370
                    *                                                   W5B06380
                          B       MT540     RETURN TO MAINLINE          W5B06390
                    *                                                   W5B06400
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B06410
                    *     GO TO TERMINAL MODULE FOR SERVICE           * W5B06420
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B06430
                    *                                                   W5B06440
                    MT530 BSI  I2 TSMAD     BR TO T.S.M.                W5B06450
                    *                                                   W5B06460
                    MT540 B    I  MT004     RETURN TO ILS03             W5B06470
                    *                                                   W5B06480
                    *************************************************** W5B06490
                    *                                                 * W5B06500
                    *          IOCC'S AND CONSTANTS                   * W5B06510
                    *                                                 * W5B06520
                    *************************************************** W5B06530
                    *                                                   W5B06540
                    *                                                   W5B06550
                          BSS  E  0         FORCE EVEN ALIGNMENT        W5B06560
                    MT940 CALL    MTCAP     PICK UP USERS PARM RTN      W5B06570
                    MT942 DC      *-*       ENABLE MTCA               E W5B06580
                          DC      /FC48     *IOCC                       W5B06590
                    MT944 DC      *-*       SAVE LOCATION             E W5B06600
                          DC      /FF08     SENSE DSW1 IOCC             W5B06610
                    MT946 DC      /E005     INVALID DSW1 ERROR        E W5B06620
                          DC      *-*       SAVE DSW1                   W5B06630
                    MT948 DC      1         CONSTANT - ONE            E W5B06640
                          DC      /FC0C     DISABLE TMT IOCC            W5B06650
                    MT950 DC      /E008     ERROR CODE FOR RCV T/O      W5B06660
                    *                                                   W5B06670
                    *                                                   W5B06680
                    *************************************************** W5B06690
                    *                                                 * W5B06700
                    *          TIMER RESPONSE HANDLER                 * W5B06710
                    *                                                 * W5B06720
                    *************************************************** W5B06730
                    *                                                   W5B06740
                    MT600 LDX  I1 MT944     SET LINE COUNT IN XR1       W5B06750
                    *                                                   W5B06760
                    MT610 LD   L1 *-*       GET LCB ADDRESS AND         W5B06770
                          BZ      MT630     EXIT IF ZERO                W5B06780
                    *                                                   W5B06790
                          STO     *+1                                   W5B06800
                          LDX  L2 *-*       PUT INTO XR2                W5B06810
                          LD    2 DIAGN     EXIT IF LINE UNDER          W5B06820
                          BN      MT630     *DIAGNOSTIC CONTROL         W5B06830
                    *                                                   W5B06840
                          LD    2 TIMER     GET TIMER CONTROL           W5B06850
                          BZ      MT630     EXIT IF ZERO                W5B06860
                    *                                                   W5B06870
                          S       MT960     SUBTRACT ONE AND            W5B06880
                          STO   2 TIMER     *RESTORE                    W5B06890
                          SLA     12        ISOLATE COUNT DIGIT         W5B06900
                          BNZ     MT630     EXIT IF NON ZERO            W5B06910
                    *                                                   W5B06920
                          STX   1 MT620+1   SAVE XR1                    W5B06930
                          LD    2 TIMER     GET TIMER WORD              W5B06940
                          SRA     12        SET UP THE COMMAND          W5B06950
                          STO     *+1       *AS AN INDEX                W5B06960
                          LDX  L1 *-*       PUT INTO XR1                W5B06970
                          SRA     4                                     W5B06980
                          STO   2 TIMER     CLEAR TIMER CONTROL         W5B06990
                          LDD     MT620     LINE NO. INTO EXT           W5B07000
                          B    I1 MT983-1   BR TO SERVICE TIMEOUT       W5B07010
                    *                                                   W5B07020
                          BSS  E  0         FORCE EVEN BOUNDARY         W5B07030
                    MT620 LDX  L1 *-*       RESTORE XR1               E W5B07040
                    MT630 MDX   1 -1        DECREMENT LINE COUNT        W5B07050
                          B       MT610     RETURN FOR NEXT LINE        W5B07060
                    *                                                   W5B07070
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B07080
                    *      RESET TIMER AND TMT IF NECESSARY           * W5B07090
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B07100
                    *                                                   W5B07110
                          CALL    MTCAM     DECREMENT TMT TIMEOUT       W5B07120
                          ORG     *-2       *COUNT BY ONE               W5B07130
                          DC      /74FF     *TO CHECK FOR A             W5B07140
                          ORG     *+1       *DISABLE CONDITION          W5B07150
                          B       *+1       SKIP NEXT INSTRUCTION       W5B07160
                    *                                                   W5B07170
                          XIO     MT948     DISABLE TMT                 W5B07180
                          XIO     MT960     RESET TIMER COMMAND         W5B07190
                          B    I  MT007     RETURN TO ILS03             W5B07200
                    *                                                   W5B07210
                    *                                                   W5B07220
                    *************************************************** W5B07230
                    *                                                 * W5B07240
                    *          RECEIVE DATA TIMEOUT                   * W5B07250
                    *                                                 * W5B07260
                    *************************************************** W5B07270
                    *                                                   W5B07280
                    MT640 LD      MT950     SET UP ERROR CODE           W5B07290
                          BSI  I2 ERROR     GO TELL USER                W5B07300
                    *                                                   W5B07310
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B07320
                    *            RETURN FROM USER                     * W5B07330
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B07340
                    *                                                   W5B07350
                          BZ      MT650     BRANCH IF TERMINATE         W5B07360
                    *                                                   W5B07370
                          LD      MT967     SET UP FURTHER              W5B07380
                          STO   2 TIMER     *RCV DATA TIMEOUT           W5B07390
                          B       MT620     GO SERVICE NEXT LINE        W5B07400
                    *                                                   W5B07410
                    MT650 STO   2 IPCNT     CLEAR I/P COUNT             W5B07420
                          B       MT670     GO CLEAR BUSY FLAG          W5B07430
                    *                                                   W5B07440
                    *                                                   W5B07450
                    *************************************************** W5B07460
                    *                                                 * W5B07470
                    *          WRITE INTERRUPT TIMEOUT                * W5B07480
                    *                                                 * W5B07490
                    *************************************************** W5B07500
                    *                                                   W5B07510
                    MT660 LD      MT968     SET UP TMT TIMEOUT          W5B07520
                          STO   2 TIMER                                 W5B07530
                          LD      MT976     SET UP ERROR CODE           W5B07540
                          BSI  I2 ERROR     GO TELL USER                W5B07550
                    *                                                   W5B07560
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B07570
                    *          RETURN FROM USER                       * W5B07580
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B07590
                    *                                                   W5B07600
                          BNZ     MT620     BR IF IGNORE REQUESTED      W5B07610
                    *                                                   W5B07620
                          STO   2 OPCNT     CLEAR O/P COUNT             W5B07630
                          STO   2 TIMER     CLEAR TIMER                 W5B07640
                    MT670 SLA     16                                    W5B07650
                          STO   2 LNBSY     CLEAR BUSY FLAG             W5B07660
                          B       MT620     GO SERVICE NEXT LINE        W5B07670
                    *                                                   W5B07680
                    *                                                   W5B07690
                    *************************************************** W5B07700
                    *                                                 * W5B07710
                    *       CONNECT ADAPTER TIMEOUT                   * W5B07720
                    *                                                 * W5B07730
                    *************************************************** W5B07740
                    *                                                   W5B07750
                    MT680 LD      MT966     SET UP                      W5B07760
                          STO     MT962     *SENSE DSW2 IOCC            W5B07770
                          BSI     MT750     TEST DSW2                   W5B07780
                    *                                                   W5B07790
                          SLA     4         CHECK LINK ACTIVE           W5B07800
                          BNN     MT700     BRANCH IF NO                W5B07810
                    *                                                   W5B07820
                          SLA     1         CHECK CONNECTED             W5B07830
                          BN      MT670     RETURN IF CONNECTED         W5B07840
                    *                                                   W5B07850
                    MT690 LDD     MT620     *NO  - SET UP ERROR         W5B07860
                          LD      MT973     *CODES AND                  W5B07870
                          BSI  I2 ERROR     *GO TO USER                 W5B07880
                    *                                                   W5B07890
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B07900
                    *            RETURN FROM USER                     * W5B07910
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B07920
                    *                                                   W5B07930
                          BZ      MT670     BR IF NO RETRY              W5B07940
                    *                                                   W5B07950
                          LD      MT969     SET UP A                    W5B07960
                          STO   2 TIMER     *CONNECT TIMEOUT            W5B07970
                          LD      MT964     SET UP                      W5B07980
                          STO     MT962     *CONNECT IOCC               W5B07990
                          BSI     MT750     GO CONNECT LINE             W5B08000
                    *                                                   W5B08010
                          B       MT620     GO SERVICE NEXT LINE        W5B08020
                    *                                                   W5B08030
                    MT700 SLA     1         TEST FOR CONNECTED          W5B08040
                          BNN     MT690     BRANCH IF NO                W5B08050
                    *                                                   W5B08060
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B08070
                    *     CONNECTED BUT NOT LINK ACTIVE               * W5B08080
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B08090
                    *                                                   W5B08100
                          LDD     MT620     GET LINE NUMBER             W5B08110
                          LD      MT977     AND ERROR CODE              W5B08120
                          BSI  I2 ERROR     GO TELL USER                W5B08130
                    *                                                   W5B08140
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B08150
                    *        RETURN FROM USER                         * W5B08160
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B08170
                    *                                                   W5B08180
                          BZ      MT670     BRANCH IF USER WISHES       W5B08190
                    *                       *TO IGNORE ERROR            W5B08200
                          LD      MT969     RESTORE T/O CONTROL         W5B08210
                          STO   2 TIMER                                 W5B08220
                          B       MT620     AND RETURN                  W5B08230
                    *                                                   W5B08240
                    *                                                   W5B08250
                    *************************************************** W5B08260
                    *                                                 * W5B08270
                    *     DISCONNECT ADAPTER TIMEOUT                  * W5B08280
                    *                                                 * W5B08290
                    *************************************************** W5B08300
                    *                                                   W5B08310
                    MT710 LD      MT966     SET UP                      W5B08320
                          STO     MT962     *SENSE DSW2 IOCC            W5B08330
                          BSI     MT750     TEST DSW2                   W5B08340
                          SLA     5         TEST FOR WRAPPED            W5B08350
                    *                                                   W5B08360
                          BNN     MT740     RETURN IF WRAPPED           W5B08370
                    *                                                   W5B08380
                          LDD     MT620     SET UP                      W5B08390
                          LD      MT974     *ERROR CODES                W5B08400
                          BSI  I2 ERROR     GO TELL USER                W5B08410
                    *                                                   W5B08420
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B08430
                    *       RETURN FROM USER                          * W5B08440
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B08450
                    *                                                   W5B08460
                          BZ      MT740     BR IF NO RETRY              W5B08470
                    *                                                   W5B08480
                          LD      MT970     SET UP FOR A                W5B08490
                    MT720 STO   2 TIMER     *DISCONNECT T/O             W5B08500
                          LD      MT965     SET UP                      W5B08510
                          STO     MT962     *DISCONNECT IOCC            W5B08520
                          BSI     MT750     GO DISCONNECT LINE          W5B08530
                    *                                                   W5B08540
                    MT730 B       MT620     RETURN FOR NEXT LINE        W5B08550
                    *                                                   W5B08560
                    MT740 SLA     16                                    W5B08570
                          STO   2 CNTRL     CLEAR CONTROL FLAGS         W5B08580
                          B       MT670     GO CLEAR LINE BUSY          W5B08590
                    *                                                   W5B08600
                    *                                                   W5B08610
                    *************************************************** W5B08620
                    *                                                 * W5B08630
                    *          XIO SUBROUTINE                         * W5B08640
                    *                                                 * W5B08650
                    *************************************************** W5B08660
                    *                                                   W5B08670
                    MT750 DC      *-*                                   W5B08680
                          LD      MT620+1   BUILD                       W5B08690
                          S       MT960     *UP                         W5B08700
                          SLA     4         *APPROPRIATE                W5B08710
                          EOR     MT962     *IOCC                       W5B08720
                          STO     MT962+1   *FOR THAT ADAPTER           W5B08730
                          XIO     MT962     ISSUE XIO                   W5B08740
                          B    I  MT750     RETURN                      W5B08750
                    *                                                   W5B08760
                    *                                                   W5B08770
                    *************************************************** W5B08780
                    *                                                 * W5B08790
                    *     IOCC'S AND CONSTANTS                        * W5B08800
                    *                                                 * W5B08810
                    *************************************************** W5B08820
                    *                                                   W5B08830
                          BSS  E  0         FORCE EVEN BOUNDARY         W5B08840
                    MT960 DC      1         CONSTANT - ONE            E W5B08850
                          DC      /FC18     RESET TIMER IOCC            W5B08860
                    MT962 DC      *-*       UTILITY                   E W5B08870
                          DC      *-*       *IOCC                       W5B08880
                    MT964 DC      /FC04     CONNECT ADAPTER IOCC        W5B08890
                    MT965 DC      /FC02     DISCONNECT ADAPTER IOCC     W5B08900
                    MT966 DC      /FF00     SENSE DSW2                  W5B08910
                    MT967 DC      /100F     TIMER CONTROL FOR RX T/O    W5B08920
                    MT968 DC      /2002     TMT TIMEOUT                 W5B08930
                    MT969 DC      /3002     CONNECT ADAPTER CONTROL     W5B08940
                    MT970 DC      /4002     D/CNNCT ADAPTER CONTROL     W5B08950
                    MT971 DC      /6001     DISCONNECT TIMEOUT          W5B08960
                    MT972 DC      /7002     WRAP DATA TIMEOUT           W5B08970
                    MT973 DC      /E006     CONNECT TIME OUT ERROR      W5B08980
                    MT974 DC      /E007     D/CNNCT TIME OUT ERROR      W5B08990
                    MT975 DC      /E00C     ADAPTER FAIL ON WRAP        W5B09000
                    MT976 DC      /E00D     TMT TIMEOUT ERROR           W5B09010
                    MT977 DC      /E00F     LINK NOT ACTIVE ERROR       W5B09020
                    MT978 DC      4         CONSTANT - FOUR             W5B09030
                    MT979 DC      /8000     BIT 0                       W5B09040
                    MT980 DC      /0800     BIT 4                       W5B09050
                    MT981 DC      /7FF0     NOT DIAGNOSE BITS           W5B09060
                    MT982 DC      /FFF3     NOT BITS 12 AND 13          W5B09070
                    *                                                 * W5B09080
                    *       TIME/OUT SERVICE BRANCH TABLE             * W5B09090
                    *                                                 * W5B09100
                    MT983 DC      MT640     READ INTERRUPT              W5B09110
                          DC      MT660     WRITE INTERRUPT             W5B09120
                          DC      MT680     CONNECT ADAPTER             W5B09130
                          DC      MT710     DISCONNECT ADAPTER          W5B09140
                          DC      MT760     REQUEST WRAP TEST           W5B09150
                          DC      MT770     WRAP COMPLETED              W5B09160
                          DC      MT780     TMT/RCV TIMEOUT             W5B09170
                          DC      MT830     RECONNECT TIMEOUT           W5B09180
                          DC      MT850     REPORT PRE-TMT ERROR        W5B09190
                    *                                                   W5B09200
                    *                                                   W5B09210
                    *************************************************** W5B09220
                    *                                                 * W5B09230
                    *     REQUEST TO WRAP AND TEST A LINE             * W5B09240
                    *                                                 * W5B09250
                    *************************************************** W5B09260
                    *                                                   W5B09270
                    MT760 LD    2 CNTRL     RESET BITS 12               W5B09280
                          AND     MT982     *AND 13                     W5B09290
                          OR      MT979     SET BIT 0                   W5B09300
                          STO   2 CNTRL     *IN CONTROL                 W5B09310
                          SLA     16        CLEAR                       W5B09320
                          STO   2 OPPTR     *O/P POINTER                W5B09330
                          LD      MT971     SET UP WRAP TIMEOUT         W5B09340
                          B       MT720     GO WRAP LINE                W5B09350
                    *                                                   W5B09360
                    *                                                   W5B09370
                    *************************************************** W5B09380
                    *                                                 * W5B09390
                    *     DISCONNECT COMPLETED - BEGIN TEST           * W5B09400
                    *                                                 * W5B09410
                    *************************************************** W5B09420
                    *                                                   W5B09430
                    MT770 LD      MT966     SET UP SENSE                W5B09440
                          STO     MT962     *DSW2 IOCC                  W5B09450
                          BSI     MT750     GO ISSUE XIO                W5B09460
                    *                                                   W5B09470
                          EOR     MT980     CHECK VALID DSW2            W5B09480
                          BNZ     MT780     GO REPORT ERR IF NO         W5B09490
                    *                                                   W5B09500
                          LD      MT972     SET UP                      W5B09510
                          STO   2 TIMER     *TMT/RCV TIMEOUT            W5B09520
                    *                                                   W5B09530
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B09540
                    *          SET UP DISABLE TMT TIMEOUT             * W5B09550
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B09560
                    *                                                   W5B09570
                          LD      MT978     SET A CONSTANT              W5B09580
                          CALL    MTCAM     *OF VALUE FOUR              W5B09590
                          ORG     *-2       *INTO THE TRANSFER          W5B09600
                          DC      /D400     *VECTOR OF                  W5B09610
                          ORG     *+1       *MTCAM ENTRY POINT          W5B09620
                          XIO  L  MT906     ENABLE TMT                  W5B09630
                    *                                                   W5B09640
                          LD    2 TSMAD     FIND                        W5B09650
                          A       MT978     *FIRST                      W5B09660
                          STO     *+1       *WRAP                       W5B09670
                          LD   L  *-*       *CHARACTER                  W5B09680
                          STO  I2 TXPTR     TRANSMIT                    W5B09690
                          B       MT730     RETURN FOR NEXT LINE        W5B09700
                    *                                                   W5B09710
                    *                                                   W5B09720
                    *************************************************** W5B09730
                    *                                                 * W5B09740
                    *     TMT/RCV TIMEOUT - ON DIAGNOSE               * W5B09750
                    *                                                 * W5B09760
                    *************************************************** W5B09770
                    *                                                   W5B09780
                    MT780 LD      MT975     GET ERROR CODE              W5B09790
                          STX   2 MT790+1   SAVE XR2                    W5B09800
                    *                                                   W5B09810
                    *     XR2 USED IN TSM41 ONLINE DIAGNOSTICS          W5B09820
                    *                                                   W5B09830
                          BSI  I2 ERROR     GO TELL USER                W5B09840
                    *                                                   W5B09850
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B09860
                    *     CHECK FOR ON LINE DIAGNOSTIC USE            * W5B09870
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B09880
                    *                                                   W5B09890
                    MT790 LDX  L2 *-*       RESTORE XR2                 W5B09900
                          LD    2 CNTRL     CHECK BIT 15                W5B09910
                          BOD     MT820     BR IF SET                   W5B09920
                    *                                                   W5B09930
                    MT800 SLA     16        CLEAR -                     W5B09940
                          STO   2 OPPTR     *O/P POINTER                W5B09950
                          STO   2 LNBSY     *LINE BUSY FLAG             W5B09960
                    MT810 STO   2 CNTRL     *CONTROL WORD               W5B09970
                          B       MT730     RETURN FOR NEXT LINE        W5B09980
                    *                                                   W5B09990
                    MT820 AND     MT981     RESET DIAGNOSE BITS         W5B10000
                          B       MT810     GO RESET CNTRL              W5B10010
                    *                                                   W5B10020
                    *                                                   W5B10030
                    *************************************************** W5B10040
                    *                                                 * W5B10050
                    *     RECONNECT - TEST COMPLETED                  * W5B10060
                    *                                                 * W5B10070
                    *************************************************** W5B10080
                    *                                                   W5B10090
                    MT830 LD      MT966     SET UP                      W5B10100
                          STO     MT962     *SENSE DSW 2 IOCC           W5B10110
                          BSI     MT750     GO ISSUE XIO                W5B10120
                    *                                                   W5B10130
                          SLA     5         CHECK CONNECTED             W5B10140
                          BNN     MT780     ERROR IF NO                 W5B10150
                    *                                                   W5B10160
                          LD    2 CNTRL     CHECK BIT 15                W5B10170
                          BOD     MT840     BR IF SET                   W5B10180
                    *                                                   W5B10190
                          B       MT800     GO CLEAR BUSY FLAG          W5B10200
                    *                                                   W5B10210
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B10220
                    *    SUCCESSFUL TEST CALLED FROM A TERMINAL       * W5B10230
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5B10240
                    *                                                   W5B10250
                    MT840 AND     MT981     RESET DIAGNOSE BITS         W5B10260
                          STO   2 CNTRL                                 W5B10270
                          SLA     16        CLEAR ACC                   W5B10280
                          BSI  I2 ERROR     GO TO T.S.M.                W5B10290
                    *                                                   W5B10300
                          B       MT730     GO SERVICE NEXT LINE        W5B10310
                    *                                                   W5B10320
                    MT850 LD    2 OPPTR     GET ERROR CODE              W5B10330
                          BSI  I2 ERROR     GO TELL USER                W5B10340
                    *                                                   W5B10350
                          SLA     16        CLEAR                       W5B10360
                          STO   2 OPCNT     *OUTPUT COUNT               W5B10370
                          STO   2 LNBSY     *AND BUSY FLAG              W5B10380
                          B       MT730     GO SERVICE NEXT LINE        W5B10390
                    *                                                   W5B10400
                          END                                           W5B10410
