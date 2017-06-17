                          HDNG    TSM41 - MTCA 2741 TERMINAL MODULE     W5D00010
                    *************************************************** W5D00020
                    *STATUS - VERSION 2, MODIFICATION 9               * W5D00030
                    *                                                 * W5D00040
                    *SUBROUTINE NAME -                                * W5D00050
                    *   FULL NAME - 2741 TERMINAL SELECT MODULE (TSM) * W5D00060
                    *               FOR THE MULTIPLE TERMINAL         * W5D00070
                    *               COMMUNICATIONS ADAPTER (MTCA)     * W5D00080
                    *   CODE NAME - TSM41                             * W5D00090
                    *                                                 * W5D00100
                    *PURPOSE -                                        * W5D00110
                    *   THIS SUBROUTINE, IN CONJUNCTION WITH MTCA0    * W5D00120
                    *   PROVIDES THE NECESSARY FUNCTIONS TO CONTROL   * W5D00130
                    *   COMMUNICATIONS LINES CONNECTED BETWEEN THE    * W5D00140
                    *   MTCA AND 2741 TERMINALS                       * W5D00150
                    *   DATA IS ASSEMBLED/DISASSEMBLED INTO OR FROM   * W5D00160
                    *   THE USERS AREA                                * W5D00170
                    *   ON-LINE DIAGNOSTICS ARE PROVIDED              * W5D00180
                    *                                                 * W5D00190
                    *METHOD -                                         * W5D00200
                    *   THE SUBROUTINE HAS TWO ENTRY POINTS -         * W5D00210
                    *      * INITIATE WRITE - A MESSAGE IS            * W5D00220
                    *        TRANSMITTED TO A SPECIFIC TERMINAL       * W5D00230
                    *      * INTERRUPT SERVICE - THE ADAPTER STATUS   * W5D00240
                    *        IS EXAMINED FOR THE REQUESTED SERVICE,   * W5D00250
                    *        (TMT AND/OR RCV)                         * W5D00260
                    *   THE DIAGNOSE FUNCTION (WRAP MODE) IS          * W5D00270
                    *   CONTINUED BY TSM41 ONCE MTCA0 HAS TRANSMITTED * W5D00280
                    *   THE FIRST WRAP CHARACTER                      * W5D00290
                    *   UPON RECOGNITION OF AN I/P MESSAGE BEGINNING  * W5D00300
                    *   WITH TWO LOWER CASE D'S, TSM41 ENTERS ITS     * W5D00310
                    *   ON-LINE DIAGNOSTICS MODULE WHICH SETS UP A    * W5D00320
                    *   BUFFER INTO WHICH THE DIAGNOSTIC REQUEST      * W5D00330
                    *   MESSAGE IS READ. THE MESSAGE IS THEN INTER-   * W5D00340
                    *   ROGATED AND THE REQUESTED FUNCTION INITIATED  * W5D00350
                    *                                                 * W5D00360
                    *CAPABILITIES AND LIMITATIONS -                   * W5D00370
                    *   TSM41 IS ONLY ENTERED BY MTCA0                * W5D00380
                    *                                                 * W5D00390
                    *SPECIAL FEATURES -                               * W5D00400
                    *   NONE                                          * W5D00410
                    *                                                 * W5D00420
                    *ADDITIONAL INFORMATION -                         * W5D00430
                    *   ERROR PROCEDURES -                            * W5D00440
                    *      ERRORS ARE REPORTED TO THE USER PROGRAM    * W5D00450
                    *      SUBSEQUENT ACTION BY TSM41 MAY DEPEND UPON * W5D00460
                    *      THE CONTENTS OF THE ACCUMULATOR ON RETURN  * W5D00470
                    *      FROM THE USERS ERROR SUBROUTINE            * W5D00480
                    *      THE ADDRESS OF THE USERS ERROR SUBROUTINE  * W5D00490
                    *      IS PLACED IN THE LINE CONTROL BLOCK (LCB)  * W5D00500
                    *      BY MTCA0 WHEN INITIATING A CALL            * W5D00510
                    *   CALLING SEQUENCE -                            * W5D00520
                    *      TSM41 IS NOT ENTERED IN THE NORMAL MANNER. * W5D00530
                    *      ITS STARTING ADDRESS IS PLACED IN THE LCB  * W5D00540
                    *      FOR ALL LINES OF THAT TYPE DURING          * W5D00550
                    *      INITIALIZATION.  MTCA0 ENTERS TSM41 BY     * W5D00560
                    *      MEANS OF A BSI INSTUCTION AT TSM41+0 FOR   * W5D00570
                    *      INTERRUPT SERVICE, AND AT TSM41+2 FOR      * W5D00580
                    *      INITIATE WRITE SERVICE.                    * W5D00590
                    *      LOCATION TSM41+4 CONTAINS THE FIRST WRAP   * W5D00600
                    *      CHARACTER (USED BY MTCA0 DURING DIAGNOSE)  * W5D00610
                    *                                                 * W5D00620
                    *************************************************** W5D00630
                    *                                                   W5D00640
                    *                                                   W5D00650
                    *************************************************** W5D00660
                    *                                                 * W5D00670
                    *          USE OF 'CNTRL' BY TSM41                * W5D00680
                    *                                                 * W5D00690
                    *************************************************** W5D00700
                    *                                                 * W5D00710
                    *     BIT  0  WRAP MODE                           * W5D00720
                    *          1  RCV MODE (ELSE TMT)                 * W5D00730
                    *          2  TMT IDLES                           * W5D00740
                    *          3  INSPECT FOR DIAGNOSTIC              * W5D00750
                    *          4  ONE D ALREADY RCVD                  * W5D00760
                    *          5  TMT CRLF CHARACTER                  * W5D00770
                    *          6  ONE SPACE RCVD (ATTN FEATURE)       * W5D00780
                    *          7  TMT CIRCLE C                        * W5D00790
                    *          8  BAD MESSAGE INDICATOR               * W5D00800
                    *          9  NOT USED                            * W5D00810
                    *         10  NOT USED                            * W5D00820
                    *         11  NOT USED                            * W5D00830
                    *         12  RCV INTERRUPT RCVD IN WRAP MODE     * W5D00840
                    *         13  TMT INTERRUPT RCVD IN WRAP MODE     * W5D00850
                    *         14  NOT USED                            * W5D00860
                    *         15  WRAP REQUESTED FROM A TERMINAL      * W5D00870
                    *                                                 * W5D00880
                    *************************************************** W5D00890
                    *                                                   W5D00900
                    *                                                   W5D00910
                    *************************************************** W5D00920
                    *                                                 * W5D00930
                    *          USE OF 'DIAGN' BY TSM41                * W5D00940
                    *                                                 * W5D00950
                    *************************************************** W5D00960
                    *                                                 * W5D00970
                    *     BIT  0  IGNORE DATA                         * W5D00980
                    *          1  DIAGNOSTIC WRITE                    * W5D00990
                    *          2  DIAGNOSTIC READ                     * W5D01000
                    *          3  DIAGNOSTIC TIMEOUTS                 * W5D01010
                    *       4-14  NOT USED                            * W5D01020
                    *         15  REPEAT MESSAGE                      * W5D01030
                    *                                                 * W5D01040
                    *************************************************** W5D01050
                    *                                                   W5D01060
                    *                                                   W5D01070
                    *************************************************** W5D01080
                    *                                                 * W5D01090
                    *          USE OF 'STATC' BY TSM41                * W5D01100
                    *                                                 * W5D01110
                    *************************************************** W5D01120
                    *                                                 * W5D01130
                    *                 '0XXY'                          * W5D01140
                    *     WHERE -                                     * W5D01150
                    *         XX IS THE NO OF IDLES FOR TMN           * W5D01160
                    *            WHEN THE TMT IDLE BIT OF CNTRL       * W5D01170
                    *            IS SET TO ONE.                       * W5D01180
                    *          Y IS THE STATISTICS COUNT (3)          * W5D01190
                    *                                                 * W5D01200
                    *************************************************** W5D01210
                    *                                                   W5D01220
                    *                                                   W5D01230
                    *************************************************** W5D01240
                    *                                                 * W5D01250
                    *           USE OF 'TIMER' BY TSM41               * W5D01260
                    *                                                 * W5D01270
                    *************************************************** W5D01280
                    *                                                 * W5D01290
                    *                 'X00Y'                          * W5D01300
                    *     WHERE -                                     * W5D01310
                    *          X IS THE FUNCTION DIGIT,               * W5D01320
                    *            1  RCV DATA TIMEOUT                  * W5D01330
                    *            2  TMT DATA TIMEOUT                  * W5D01340
                    *            3  CONNECT ADAPTER TIMEOUT           * W5D01350
                    *            4  DISCONNECT ADAPTER TIMEOUT        * W5D01360
                    *            5  REQUEST WRAP AND TEST ADAPTER     * W5D01370
                    *            6  WRAP ADAPTER TIMEOUT              * W5D01380
                    *            7  WRAP DATA TIMEOUT                 * W5D01390
                    *            8  RECONNECT ADAPTER TIMEOUT         * W5D01400
                    *            9  REPORT PRE-TMT ERROR              * W5D01410
                    *          Y IS THE COUNT IN TIMER UNITS          * W5D01420
                    *                                                 * W5D01430
                    *************************************************** W5D01440
                    *                                                   W5D01450
                    *                                                   W5D01460
                    *************************************************** W5D01470
                    *                                                 * W5D01480
                    *     LINE CONTROL BLOCK FORMAT  (2741)           * W5D01490
                    *                                                 * W5D01500
                    *************************************************** W5D01510
                    *                                                   W5D01520
                          ENT     TSM41                                 W5D01530
                    *                                                   W5D01540
                    LNBSY EQU     0         LINE BUSY FLAG              W5D01550
                    TSMAD EQU     1         TSM ADDRESS                 W5D01560
                    IPPTR EQU     2         INPUT POINTER               W5D01570
                    IPCNT EQU     3         INPUT COUNT                 W5D01580
                    OPPTR EQU     4         OUTPUT POINTER              W5D01590
                    OPCNT EQU     5         OUTPUT COUNT                W5D01600
                    ERROR EQU     6         USER'S ERROR ROUTINE        W5D01610
                    CNTRL EQU     7         CONTROL FLAGS               W5D01620
                    DIAGN EQU     8         DIAGNOSTIC CONTROL          W5D01630
                    TIMER EQU     9         INTERVAL TIMER CONTROL      W5D01640
                    RXPTR EQU     10        RCV DATA LOCATION           W5D01650
                    TXPTR EQU     11        TMT DATA LOCATION           W5D01660
                    STATC EQU     12        STATISTICS COUNT            W5D01670
                    STAT1 EQU     13        VRC ERRORS                  W5D01680
                    STAT2 EQU     14        GOOD MEESAGES COUNT         W5D01690
                    STAT3 EQU     15        TOTAL MESSAGES COUNT        W5D01700
                    LPDAT EQU     OPPTR     LOOP DATA ON WRAP           W5D01710
                    *                                                   W5D01720
                    *                                                   W5D01730
                    *************************************************** W5D01740
                    *                                                 * W5D01750
                    *             ENTRY POINTS                        * W5D01760
                    *                                                 * W5D01770
                    *************************************************** W5D01780
                    *                                                   W5D01790
                    TSM41 DC      *-*       INTERRUPT ENTRY POINT       W5D01800
                          B       TM100     BRANCH TO SERVICE           W5D01810
                    *                                                   W5D01820
                    TM002 DC      *-*       INITIATE WRITE ENTRY        W5D01830
                          B       TM010     BRANCH TO INITIATE          W5D01840
                    *                                                   W5D01850
                    TM004 DC      /0004     FIRST WRAP CHARACTER        W5D01860
                    *                                                   W5D01870
                    *                                                   W5D01880
                    *************************************************** W5D01890
                    *                                                 * W5D01900
                    *          INITIATE WRITE ROUTINE                 * W5D01910
                    *                                                 * W5D01920
                    *************************************************** W5D01930
                    *                                                   W5D01940
                    TM010 BNZ     TM020     BR IF LINK NOT ACTIVE       W5D01950
                    *                                                   W5D01960
                          LD    2 CNTRL     CHECK FOR                   W5D01970
                          SLA     1         *TRANSMIT MODE              W5D01980
                          BN      TM030     BRANCH IF NO                W5D01990
                    *                                                   W5D02000
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D02010
                    *     LINK ACTIVE - GO TMT AN IDLE                * W5D02020
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D02030
                    *                                                   W5D02040
                          SLA     16        CLEAR ACC                   W5D02050
                          STO   2 CNTRL     RESET CONTROL WORD          W5D02060
                          LD      TM903     TRANSMIT AN                 W5D02070
                          STO  I2 TXPTR     *IDLE CHARACTER             W5D02080
                          LD      TM905     GET TMT TIMEOUT CODE        W5D02090
                          B       TM040-1   GO SET UP                   W5D02100
                    *                                                   W5D02110
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D02120
                    *     SET UP ERROR CODES                          * W5D02130
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D02140
                    *                                                   W5D02150
                    TM020 LD      TM906     LOAD ERROR CODE             W5D02160
                          B       *+1       GO REPORT                   W5D02170
                    *                                                   W5D02180
                    TM030 LD      TM902     LOAD ERROR CODE             W5D02190
                          STO   2 OPPTR     *AND SAVE                   W5D02200
                          LD      TM907     GET TIMEOUT CODE            W5D02210
                          STO   2 TIMER     SET UP TIMEOUT              W5D02220
                    TM040 B    I  TM002     RETURN TO USER              W5D02230
                    *                                                   W5D02240
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D02250
                    *   WRAP TEST COMPLETED - RECONNECT LINE          * W5D02260
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D02270
                    *                                                   W5D02280
                    TM080 LD      TM904     SET UP CONNECT              W5D02290
                          STO   2 TIMER     *TIMEOUT                    W5D02300
                          LD    2 TXPTR     GENERATE                    W5D02310
                          SLA     12        *CONNECT                    W5D02320
                          SRA     8         *ADAPTER                    W5D02330
                          OR      TM901     *IOCC FOR                   W5D02340
                          STO     TM914+1   *THIS LINE                  W5D02350
                          XIO     TM914     CONNECT LINE                W5D02360
                          B       TM120     RETURN                      W5D02370
                    *                                                   W5D02380
                    *                                                   W5D02390
                    *************************************************** W5D02400
                    *                                                 * W5D02410
                    *     IOCC'S AND CONSTANTS  (BLOCK 1)             * W5D02420
                    *                                                 * W5D02430
                    *************************************************** W5D02440
                    *                                                   W5D02450
                    TM901 DC      /FC04     CONNECT IOCC                W5D02460
                    TM902 DC      /E020     ATTEMPTIG TO TMT TO A       W5D02470
                    *                       *2741 WHEN IN RCV MODE      W5D02480
                    TM903 DC      /02F4     ASSEMBLED IDLE              W5D02490
                    TM904 DC      /8002     CONNECT TIMEOUT             W5D02500
                    TM905 DC      /2002     TMT TIMEOUT CONTROL         W5D02510
                    TM906 DC      /E00A     LINK NOT ACTIVE ERROR       W5D02520
                    TM907 DC      /9001     REPORT ERROR TIMEOUT        W5D02530
                    TM908 DC      /0001     CONSTANT AND BIT 15         W5D02540
                    TM909 DC      /2100     EOR OF TAB AND CRLF         W5D02550
                    TM910 DC      /1800     PRINTER CONTROL BITS        W5D02560
                    TM911 DC      /0010     SIXTEEN                     W5D02570
                    *                                                   W5D02580
                    *     STATC LOCATION FOR TMT IDLES                  W5D02590
                    *                                                   W5D02600
                    TM912 DC      /0103     SIXTEEN                     W5D02610
                    TM913 DC      /FFB0     MINUS FIVE                  W5D02620
                    *                                                   W5D02630
                          BSS  E  0         FORCE EVEN BOUNDARY         W5D02640
                    TM914 DC      /FF01     SENSE/RESET DSW 2         E W5D02650
                          DC      *-*       UTILITY IOCC                W5D02660
                    *                                                   W5D02670
                    *                                                   W5D02680
                    *************************************************** W5D02690
                    *                                                 * W5D02700
                    *       INTERRUPT SERVICE ROUTINE                 * W5D02710
                    *                                                 * W5D02720
                    *************************************************** W5D02730
                    *                                                   W5D02740
                    TM100 LD    2 RXPTR     GENERATE SENSE/RESET        W5D02750
                          SLA     4         *DSW2 IOCC                  W5D02760
                          OR      TM914     *FOR THIS LINE              W5D02770
                          STO     TM914+1   *AND SAVE                   W5D02780
                          LD   I2 RXPTR     SAVE RCV LOCATION           W5D02790
                          STO  L  TM931     *CYCLE STEAL DATA           W5D02800
                          LD    2 CNTRL     CHECK FOR WRAP MODE         W5D02810
                          BN      TM300     BR IF YES                   W5D02820
                    *                                                   W5D02830
                          XIO     TM914     SENSE/RESET DSW2            W5D02840
                          STO  L  TM937     *AND SAVE                   W5D02850
                          BN      TM400     BRANCH IF RCV SERVICE       W5D02860
                    *                                                   W5D02870
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D02880
                    *     CHECK FOR A TRANSMIT INTERRUPT              * W5D02890
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D02900
                    *                                                   W5D02910
                    TM110 SLA     1         CHECK FOR TRANSMIT          W5D02920
                          SKP     -         *BIT PRESENT                W5D02930
                    TM120 B       TM260     EXIT IF ZERO                W5D02940
                    *                                                   W5D02950
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D02960
                    *     SERVICE TRANSMIT INTERRUPT                  * W5D02970
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D02980
                    *                                                   W5D02990
                          LD    2 CNTRL     CHECK CONTROL FLAGS         W5D03000
                          BZ      TM130     BR IF NONE SET              W5D03010
                    *                                                   W5D03020
                          SLA     2         CHECK TMT IDLE BIT          W5D03030
                          BN      TM160     GO SERVICE IF SET           W5D03040
                    *                                                   W5D03050
                          SLA     3         CHECK FOR TMT CRLF          W5D03060
                          BN      TM210     BR IF SET                   W5D03070
                    *                                                   W5D03080
                          SLA     2         CHECK TMT CIRCLE C          W5D03090
                          BN      TM220     BRANCH IF YES               W5D03100
                    *                                                   W5D03110
                    TM130 LD    2 OPCNT                                 W5D03120
                          BZ      TM250     BR IF ZERO O/P COUNT        W5D03130
                    *                                                   W5D03140
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D03150
                    *          UNPACK OUTPUT DATA                     * W5D03160
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D03170
                    *                                                   W5D03180
                    TM140 LD   I2 OPPTR     GET O/P COUNT               W5D03190
                          S     2 OPCNT     CALCULATE ADDRESS           W5D03200
                          SRT     1         *OF NEXT O/P                W5D03210
                          A       TM908     *CHARACTER                  W5D03220
                          A     2 OPPTR     SIGN OF EXTENSION           W5D03230
                          STO     TM150+1   *SHOWS WHICH BYTE           W5D03240
                          LD    2 OPCNT     DECREMENT                   W5D03250
                          S       TM908     *OUTPUT                     W5D03260
                          STO   2 OPCNT     *COUNT                      W5D03270
                    TM150 LD   L  *-*       GET O/P DATA                W5D03280
                          SLT     1         FIND WHICH BYTE             W5D03290
                          SKP     E         SKIP FOR LEFT               W5D03300
                          SLA     8         MOVE RIGHT BYTE             W5D03310
                          SRA     1         POSITION                    W5D03320
                          AND     TM923     CLEAR RIGHT HAND            W5D03330
                          STO     TM924     *BITS AND SAVE              W5D03340
                          AND     TM910     CHECK FOR CONTROL           W5D03350
                          EOR     TM910     *CHARACTERS BITS            W5D03360
                          BNZ     TM180     BR IF NO                    W5D03370
                    *                                                   W5D03380
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D03390
                    *     TRANSMIT PRINTER FUNCTION CHARACTER         * W5D03400
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D03410
                    *                                                   W5D03420
                          LD      TM924     RESTORE CHARACTER           W5D03430
                          EOR     TM926     CHECK FOR CIRCLE C          W5D03440
                          BZ      TM230     BR IF YES                   W5D03450
                    *                                                   W5D03460
                          LD      TM924                                 W5D03470
                          EOR     TM925     TEST FOR CRLF               W5D03480
                          BZ      TM200     BRANCH IF YES               W5D03490
                    *                                                   W5D03500
                          EOR     TM909     CHECK FOR TAB               W5D03510
                          SKP     Z         SKIP IF YES                 W5D03520
                          LD      TM913     SET UP COUNT                W5D03530
                          A       TM933     *FOR PR FUNCTION            W5D03540
                          B       TM200+1   GO SET IN STATC             W5D03550
                    *                                                   W5D03560
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D03570
                    *          TRANSMIT AN IDLE                       * W5D03580
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D03590
                    *                                                   W5D03600
                    TM160 LD      TM928     LOAD AN IDLE CHAR           W5D03610
                          STO     TM924     *INTO SAVE LOCATION         W5D03620
                          LD    2 STATC                                 W5D03630
                          S       TM911     DECR IDLE COUNT             W5D03640
                          STO   2 STATC     RESTORE                     W5D03650
                          SRA     4         CLEAR STAT COUNT            W5D03660
                          BNZ     TM180     GO TRANSMIT                 W5D03670
                    *                                                   W5D03680
                          LD    2 CNTRL                                 W5D03690
                          EOR     TM929     RESET TMT IDLE BIT          W5D03700
                    TM170 STO   2 CNTRL                                 W5D03710
                    *                                                   W5D03720
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D03730
                    *          TRANSMIT A CHARACTER                   * W5D03740
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D03750
                    *                                                   W5D03760
                    TM180 LD      TM905     SET UP TMT TIMEOUT          W5D03770
                          STO   2 TIMER                                 W5D03780
                    *                                                   W5D03790
                    TM190 LD      TM920     SET UP A CONSTANT           W5D03800
                          CALL    MTCAM     *OF VALUE TWO               W5D03810
                          ORG     *-2       *IN THE TRANSFER            W5D03820
                          DC      /D400     *VECTOR OF                  W5D03830
                          ORG     *+1       *MTCAM ENTRY POINT          W5D03840
                          XIO     TM920     ENABLE TMT                  W5D03850
                    *                                                   W5D03860
                          LD      TM924     FORMAT CHARACTER            W5D03870
                          SRA     5         *FOR TRANSMISSION           W5D03880
                          OR      TM927     INCLUDE STOP BIT            W5D03890
                          STO  I2 TXPTR     TRANSMIT                    W5D03900
                          B       TM260     RETURN TO MTCA0             W5D03910
                    *                                                   W5D03920
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D03930
                    *          TRANSMIT A CRLF (NORMAL)               * W5D03940
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D03950
                    *                                                   W5D03960
                    TM200 LD      TM912     SET UP COUNT OF 16          W5D03970
                          STO   2 STATC     STORE IN STAT COUNT WD      W5D03980
                          LD    2 CNTRL                                 W5D03990
                          OR      TM929     SET TMT IDLE BIT            W5D04000
                          B       TM170     GO TRANSMIT CHARACTER       W5D04010
                    *                                                   W5D04020
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D04030
                    *          TRANSMIT A CRLF (FORCED)               * W5D04040
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D04050
                    *                                                   W5D04060
                    TM210 LD      TM925     LOAD A CRLF CHAR            W5D04070
                          STO     TM924     *INTO SAVE LOCATION         W5D04080
                          LD    2 CNTRL     RESET TMT CRLF BIT          W5D04090
                          EOR     TM922     *SET TMT CIRCLE C BIT       W5D04100
                          B       TM240     GO PUT IN CNTRL             W5D04110
                    *                                                   W5D04120
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D04130
                    *          TRANSMIT A CIRCLE C                    * W5D04140
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D04150
                    *                                                   W5D04160
                    TM220 LD      TM926     LOAD CIRCLE C CHAR          W5D04170
                          STO     TM924     INTO SAVE LOCATION          W5D04180
                    *                                                   W5D04190
                    TM230 SLA     16        CLEAR OUTPUT COUNT          W5D04200
                          STO   2 OPCNT                                 W5D04210
                          LD    2 CNTRL     RESET                       W5D04220
                          AND     TM930     *TMT CIRCLE C BIT           W5D04230
                    TM240 STO   2 CNTRL     *IN CONTROL WORD            W5D04240
                          LD    2 DIAGN     CHECK IGNORE BIT            W5D04250
                          BN      TM190     BR IF SET                   W5D04260
                    *                                                   W5D04270
                          B       TM180     GO TMT CHARACTER            W5D04280
                    *                                                   W5D04290
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D04300
                    *          OUTPUT COUNT ZERO                      * W5D04310
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D04320
                    *                                                   W5D04330
                    TM250 LD    2 DIAGN     CHECK FOR DIAGNOSTIC        W5D04340
                          BNN     TM320     BR IF NOT IGNORE BIT        W5D04350
                    *                                                   W5D04360
                          SLA     16        CLEAR                       W5D04370
                          STO   2 CNTRL     *CONTROL WORD               W5D04380
                          STO   2 DIAGN     *DIAGNOSTIC CONTROL         W5D04390
                    *                                                   W5D04400
                    TM260 B    I  TSM41     RETURN TO MTCA0             W5D04410
                    *                                                   W5D04420
                    *                                                   W5D04430
                    *************************************************** W5D04440
                    *                                                 * W5D04450
                    *          WRAP MODE SERVICE                      * W5D04460
                    *                                                 * W5D04470
                    *************************************************** W5D04480
                    *                                                   W5D04490
                    *                                                   W5D04500
                    TM300 XIO     TM914     SENSE/RESET DSW2            W5D04510
                          SRA     12        ISOLATE RCV/TMT BITS        W5D04520
                          OR    2 CNTRL     SET INTO CONTROL WD         W5D04530
                          STO   2 CNTRL                                 W5D04540
                          AND     TM935     CHECK FOR BOTH BITS         W5D04550
                          EOR     TM935     *RECEIVED                   W5D04560
                          BNZ     TM260     BR IF NO                    W5D04570
                    *                                                   W5D04580
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D04590
                    *     COMPARE LOOPED DATA                         * W5D04600
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D04610
                    *                                                   W5D04620
                          LD    2 CNTRL     RESET BOTH TMT AND          W5D04630
                          EOR     TM935     *RCV INTERRUPT BITS         W5D04640
                          STO   2 CNTRL                                 W5D04650
                          LD      TM931     GET RCV LOCATION            W5D04660
                          SRA     7         REMOVE ASSEMBLY AREA        W5D04670
                          LDX   1 1         SET UP BIT COUNT            W5D04680
                    TM310 SKP     E         SKIP IF NO BIT THERE        W5D04690
                          MDX   1 1         INCR BIT COUNT              W5D04700
                          SRA     1         MOVE TO NEXT BIT            W5D04710
                          SKP     Z         EXIT IF ALL DONE            W5D04720
                          B       TM310     GO TEST THIS BIT            W5D04730
                    *                                                   W5D04740
                          STX   1 TM924     CHECK PARITY                W5D04750
                          LD      TM924     *OF XR1                     W5D04760
                          BOD     TM260     BR IF BAD PARITY            W5D04770
                    *                                                   W5D04780
                          LD      TM931     GET RCVD CHARACTER          W5D04790
                          SLA     1         DROP VRC BIT                W5D04800
                          SRA     8                                     W5D04810
                          EOR   2 LPDAT     COMPARE WITH TMT DATA       W5D04820
                          BNZ     TM260     BRANCH IF BAD COMPARE       W5D04830
                    *                                                   W5D04840
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D04850
                    *     GOOD COMPARE - TMT NEXT CHAR                * W5D04860
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D04870
                    *                                                   W5D04880
                          LD    2 LPDAT     INCREMENT                   W5D04890
                          A       TM932     *TRANSMIT                   W5D04900
                          STO   2 LPDAT     *DATA                       W5D04910
                          SLA     8         FORMAT                      W5D04920
                          STO     TM924     PUT INTO O/P SAVE           W5D04930
                    *                       ALL 128 CHARS LOOPED        W5D04940
                          BN      TM080     BR IF YES                   W5D04950
                    *                                                   W5D04960
                          LD      TM934     SET UP TMT TIMEOUT          W5D04970
                          B       TM180+1   GO TMT NEXT CHAR            W5D04980
                    *                                                   W5D04990
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D05000
                    *          NORMAL EXIT PATH                       * W5D05010
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D05020
                    *                                                   W5D05030
                    TM320 BNZ     TD040     BR IF ANY DIAGN BITS        W5D05040
                    *                                                   W5D05050
                          LD    2 TIMER     CHECK DIAGNOSTIC MODE       W5D05060
                          SRA     14        *TIMER CONTROL              W5D05070
                          BNZ     TM260     RETURN IF YES               W5D05080
                    *                                                   W5D05090
                          STO   2 LNBSY     CLEAR LINE BUSY             W5D05100
                          STO   2 TIMER     *AND TIMER                  W5D05110
                          B       TM260     BR TO EXIT                  W5D05120
                    *                                                   W5D05130
                    *                                                   W5D05140
                    *************************************************** W5D05150
                    *                                                 * W5D05160
                    *     IOCC'S AND CONSTANTS  (BLOCK 2)             * W5D05170
                    *                                                 * W5D05180
                    *************************************************** W5D05190
                    *                                                   W5D05200
                          BSS  E  0         FORCE ALIGNMENT             W5D05210
                    TM920 DC      2         CONSTANT - TWO            E W5D05220
                          DC      /FC0A     ENABLE TMT IOCC             W5D05230
                    TM922 DC      /0500     BITS 5 AND 7                W5D05240
                    TM923 DC      /FF00     MASK LEFT BYTE              W5D05250
                    TM924 DC      *-*       SAVE TMT CHAR AND           W5D05260
                    *                       *ALSO PARITY ON WRAP        W5D05270
                    TM925 DC      /5B00     CRLF                        W5D05280
                    TM926 DC      /1F00     CIRCLE C                    W5D05290
                    TM927 DC      /0004     BIT 13                      W5D05300
                    TM928 DC      /5E00     IDLE                        W5D05310
                    TM929 DC      /2000     BIT 2                       W5D05320
                    TM930 DC      /FEFF     NOT BIT 7                   W5D05330
                    TM931 DC      *-*       SAVE RCV DATA               W5D05340
                    TM932 DC      1         CONSTANT - ONE              W5D05350
                    TM933 DC      /0063     6 IDLES                     W5D05360
                    TM934 DC      /7002     WRAP DATA TIMEOUT           W5D05370
                    TM935 DC      /000C     BITS 12 AND 13              W5D05380
                    TM936 DC      /5000     BITS 1 AND 3                W5D05390
                    TM937 DC      *-*       SAVE DSW 2                  W5D05400
                    *                                                   W5D05410
                    *                                                   W5D05420
                    *************************************************** W5D05430
                    *                                                 * W5D05440
                    *          RECEIVE CHARACTER SERVICE              * W5D05450
                    *                                                 * W5D05460
                    *************************************************** W5D05470
                    *                                                   W5D05480
                    TM400 LD      TM931     GET RCV DATA                W5D05490
                          SLA     1         FORMAT                      W5D05500
                          AND     TM923     *CHARACTER AND              W5D05510
                          STO     TM940     *SAVE                       W5D05520
                          LD    2 CNTRL                                 W5D05530
                          SLA     1         TEST FOR TMT MODE           W5D05540
                          BNN     TM660     BRANCH IF YES               W5D05550
                    *                                                   W5D05560
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D05570
                    *     CHECK IF TEST FOR DIAGNOSTIC REQD           * W5D05580
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D05590
                    *                                                   W5D05600
                          SLA     2         IS TEST FOR D REQD          W5D05610
                          BN      TM560     BRANCH IF YES TO TEST       W5D05620
                    *                       *FOR ON LINE DIAG CALL      W5D05630
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D05640
                    *          CHECK FOR CIRCLE C                     * W5D05650
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D05660
                    *                                                   W5D05670
                    TM410 LD      TM940     GET RCVD CHARACTER          W5D05680
                          EOR     TM926     IS IT CIRCLE C              W5D05690
                          BZ      TM440     BRANCH IF YES               W5D05700
                    *                                                   W5D05710
                          LD    2 DIAGN     IGNORE DATA                 W5D05720
                          BN      TM430     YES GO TEST FOR             W5D05730
                    *                       *TMT SERVICE                W5D05740
                          LD    2 IPCNT     CHECK ZERO I/P COUNT        W5D05750
                          BZ      TM430     YES GO TEST FOR             W5D05760
                    *                       *TMT SERVICE                W5D05770
                          LD      TM931     CHECK FOR VRC ERROR         W5D05780
                          BN      TM520     BRANCH IF YES               W5D05790
                    *                                                   W5D05800
                    TM420 LD      TM937     LOAD DSW 2                  W5D05810
                          BOD     TM550     BRANCH IF OVERRUN           W5D05820
                    *                                                   W5D05830
                          LD      TM940     LOAD RCV DATA               W5D05840
                          EOR     TM925     TEST FOR CRLF               W5D05850
                          BZ      TM510     BRANCH IF YES               W5D05860
                    *                                                   W5D05870
                          BSI     TM600     GO PACK I/P CHARACTER       W5D05880
                    *                                                   W5D05890
                          LD      TM942     SET UP RCV TIMEOUT          W5D05900
                          STO   2 TIMER                                 W5D05910
                          LD    2 IPCNT     BRANCH IF I/P COUNT         W5D05920
                          BZ      TM710     *IS ZERO                    W5D05930
                    *                                                   W5D05940
                    TM430 LD      TM937     LOAD DSW 2                  W5D05950
                          B    L  TM110     GO CHECK FOR TMT            W5D05960
                    *                                                   W5D05970
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D05980
                    *          CIRCLE C RECEIVED                      * W5D05990
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D06000
                    *                                                   W5D06010
                    TM440 LD    2 CNTRL     RESET RCV MODE              W5D06020
                          AND     TM944     *BIT IN CNTRL               W5D06030
                          STO   2 CNTRL                                 W5D06040
                          SLA     16        CLEAR OUTPUT COUNT          W5D06050
                          STO   2 OPCNT                                 W5D06060
                    *                                                   W5D06070
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D06080
                    *          SET UP DISABLE TMT TIMEOUT             * W5D06090
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D06100
                    *                                                   W5D06110
                          LD      TM920     SET UP A CONSTANT           W5D06120
                          CALL    MTCAM     *OF VALUE TWO               W5D06130
                          ORG     *-2       *IN THE TRANSFER            W5D06140
                          DC      /D400     *VECTOR OF                  W5D06150
                          ORG     *+1       *MTCAM ENTRY POINT          W5D06160
                    *                                                   W5D06170
                          XIO     TM920     ENABLE TMT                  W5D06180
                    *                                                   W5D06190
                          LD      TM946     TMT PADDED                  W5D06200
                          STO  I2 TXPTR     *CIRCLE D CHAR              W5D06210
                          LD    2 DIAGN     TEST FOR IGNORE DATA        W5D06220
                          BN      TM430     BRANCH IF SET               W5D06230
                    *                                                   W5D06240
                          BNZ     TM460     BR IF ANY BIT SET           W5D06250
                    *                                                   W5D06260
                          LD    2 IPPTR     HAVE WE HAD FIRST READ      W5D06270
                          BZ      TM700     BR IF NO                    W5D06280
                    *                                                   W5D06290
                          LD    2 CNTRL     TEST FOR BAD                W5D06300
                          SLA     8         *MESSAGE                    W5D06310
                          BN      TM450     BRANCH IF YES               W5D06320
                    *                                                   W5D06330
                          LD    2 STAT2     INCREMENT                   W5D06340
                          A       TM941     *GOOD MESSAGES              W5D06350
                          STO   2 STAT2     *READ COUNT                 W5D06360
                    *                                                   W5D06370
                    TM450 LD    2 STAT3     INCREMENT                   W5D06380
                          A       TM941     *TOTAL MESSAGES             W5D06390
                          STO   2 STAT3     *READ COUNT                 W5D06400
                    TM460 LD    2 CNTRL                                 W5D06410
                          AND     TM956     RESET BAD MESSAGE           W5D06420
                          STO   2 CNTRL     *INDICATOR BIT              W5D06430
                          LD      TM945     SET UP TMT TIMEOUT          W5D06440
                          STO   2 TIMER                                 W5D06450
                          LD    2 IPCNT     TEST ZERO I/P COUNT         W5D06460
                          BNZ     TM470     BRANCH IF NON ZERO          W5D06470
                    *                                                   W5D06480
                          LD      TM933     SET UP IDLE COUNT           W5D06490
                          STO   2 STATC     *IN I/P POINTER             W5D06500
                          LD    2 CNTRL     SET ON TMT                  W5D06510
                          OR      TM929     *IDLE BIT IN CONTROL        W5D06520
                          STO   2 CNTRL     *WORD                       W5D06530
                          B       TM430     GO TEST FOR TMT             W5D06540
                    *                                                   W5D06550
                    TM470 BSI     TM600     GO PACK I/P CHAR            W5D06560
                    *                                                   W5D06570
                    TM480 LD   I2 IPPTR     CHANGE I/P COUNT IN         W5D06580
                          S     2 IPCNT     *USER AREA FOR ACTUAL       W5D06590
                          STO  I2 IPPTR     *CHARS RCVD COUNT           W5D06600
                          SLA     16                                    W5D06610
                          STO   2 IPCNT     CLEAR I/P COUNT             W5D06620
                    TM490 B       TM430     RETURN                      W5D06630
                    *                                                   W5D06640
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D06650
                    *          CIRCLE D RECEIVED                      * W5D06660
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D06670
                    *                                                   W5D06680
                    TM500 LD      TM936     SET RCV MODE BITS           W5D06690
                          STO   2 CNTRL     *IN CONTROL WORD            W5D06700
                          LD    2 DIAGN                                 W5D06710
                          SLA     1         TEST FOR DIAG WRITE         W5D06720
                          BN      TD460     BRANCH IF YES               W5D06730
                    *                                                   W5D06740
                          B       TM430     RETURN                      W5D06750
                    *                                                   W5D06760
                    TM510 LD      TM942     SET RCV TIMEOUT, GO         W5D06770
                          STO   2 TIMER     *CHANGE COUNT IN            W5D06780
                          B       TM480     *USERS I/P AREA             W5D06790
                    *                                                   W5D06800
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D06810
                    *          VRC ERROR ROUTINE                      * W5D06820
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D06830
                    *                                                   W5D06840
                    TM520 LD    2 DIAGN     CHECK FOR DIAG MODE         W5D06850
                          BNZ     TM530     BR IF YES                   W5D06860
                    *                                                   W5D06870
                          LD    2 STAT1     INCREMENT                   W5D06880
                          A       TM941     *VRC ERROR                  W5D06890
                          STO   2 STAT1     *COUNT                      W5D06900
                    *                                                   W5D06910
                    TM530 BSI     TM630     CALCULATE LINE              W5D06920
                    *                                                   W5D06930
                          LD      TM952     LOAD ERROR CODE             W5D06940
                    TM540 BSI  I2 ERROR     GO TO USER                  W5D06950
                    *                                                   W5D06960
                          LD    2 CNTRL                                 W5D06970
                          OR      TM954     SET ERROR BIT               W5D06980
                          STO   2 CNTRL                                 W5D06990
                          B       TM420     CONTINUE                    W5D07000
                    *                                                   W5D07010
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D07020
                    *          DATA OVERRUN ERROR                     * W5D07030
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D07040
                    *                                                   W5D07050
                    TM550 EOR     TM941     RESET OVERRUN BIT           W5D07060
                          STO     TM937     *AND RESTORE                W5D07070
                          BSI     TM630     CALCLUATE LINE              W5D07080
                    *                                                   W5D07090
                          LD      TM953     LOAD ERROR CODE             W5D07100
                          B       TM540     GO REPORT ERROR             W5D07110
                    *                                                   W5D07120
                    *                                                   W5D07130
                    *************************************************** W5D07140
                    *                                                 * W5D07150
                    *     IOCC'S AND CONSTANTS  (BLOCK 3)             * W5D07160
                    *                                                 * W5D07170
                    *************************************************** W5D07180
                    *                                                   W5D07190
                    TM940 DC      *-*       SAVE RCV CHARACTER          W5D07200
                    TM941 DC      1         CONSTANT - ONE              W5D07210
                    TM942 DC      /100F     RCV TIMEOUT CONTROL         W5D07220
                    TM943 DC      /1600     CIRCLE D                    W5D07230
                    TM944 DC      /BFFF     NOT BIT 1                   W5D07240
                    TM945 DC      /2002     TMT CHAR TIMEOUT            W5D07250
                    TM946 DC      /062D     ASSMBLD CIRCLE D            W5D07260
                    TM947 DC      /0200     BIT 6                       W5D07270
                    TM948 DC      /0100     BIT 7                       W5D07280
                    TM949 DC      /6800     CHARACTER D                 W5D07290
                    TM950 DC      /0800     BIT 4                       W5D07300
                    TM951 DC      /000F     MASK LAST DIGIT             W5D07310
                    TM952 DC      /E00E     VRC ERROR CODE              W5D07320
                    TM953 DC      /E009     DATA OVERRUN ERROR          W5D07330
                    TM954 DC      /0080     BIT 8                       W5D07340
                    TM955 DC      /FF00     MASK LEFT BYTE              W5D07350
                    TM956 DC      /FF7F     NOT BIT 8                   W5D07360
                    *                                                   W5D07370
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D07380
                    *     TEST FOR DIAGNOSTIC FROM A TERMINAL         * W5D07390
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D07400
                    *                                                   W5D07410
                    TM560 LD      TM940     GET RCV CHAR                W5D07420
                          EOR     TM949     IS IT A D                   W5D07430
                          BZ      TM580     BRANCH IF YES               W5D07440
                    *                                                   W5D07450
                          LD      TM963     RESET BITS 3 AND 4          W5D07460
                          AND   2 CNTRL     *OF CONTROL WORD            W5D07470
                    TM570 STO   2 CNTRL                                 W5D07480
                          B    L  TM410     RETURN TO COMPLETE          W5D07490
                    *                       *SERVICE                    W5D07500
                    TM580 LD    2 CNTRL     ONE D ALREADY               W5D07510
                          SLA     4                                     W5D07520
                          BN      TD010     BRANCH IF YES               W5D07530
                    *                                                   W5D07540
                          LD      TM950     SET BIT 4                   W5D07550
                          OR    2 CNTRL     *IN CONTROL WORD            W5D07560
                          B       TM570     BR TO STORE                 W5D07570
                    *                                                   W5D07580
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D07590
                    *     PACK I/P DATA ROUTINE                       * W5D07600
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D07610
                    *                                                   W5D07620
                    TM600 DC      *-*                                   W5D07630
                          LD    2 IPCNT     DECREMENT                   W5D07640
                          S       TM941     *INPUT                      W5D07650
                          STO   2 IPCNT     *COUNT                      W5D07660
                          LD   I2 IPPTR     CALCULATE                   W5D07670
                          S     2 IPCNT     *STORAGE ADDR               W5D07680
                          A       TM941     *FOR THE CHARACTER          W5D07690
                          SRT     1         SIGN OF THE EXT             W5D07700
                          A     2 IPPTR     *INDICATES WHICH            W5D07710
                          STO     TM610+1   *HALF OF THE WORD           W5D07720
                          LD      TM940     GET THE RCV CHARACTER       W5D07730
                          SRA     7         CLEAR EXTRA                 W5D07740
                          SLA     6         *INFORMATION                W5D07750
                          SLT     1         MOVE INDICATOR INTO ACC     W5D07760
                          SKP     E         SKIP IF LEFT PACKING        W5D07770
                          B       TM620     BRANCH FOR RIGHT PACKING    W5D07780
                    *                                                   W5D07790
                    TM610 STO  L  *-*       STORE IN I/P AREA           W5D07800
                          B    I  TM600     RETURN                      W5D07810
                    *                                                   W5D07820
                    TM620 SRA     8         MOVE TO RIGHT PORTION       W5D07830
                          STO     TM940     *AND SAVE                   W5D07840
                          LD   I  TM610+1   GET PREVIOUS CHAR           W5D07850
                          AND     TM955     REMOVE RIGHT BYTE           W5D07860
                          OR      TM940     *ADD THIS CHARACTER         W5D07870
                          B       TM610     GO STORE IN USER'S AREA     W5D07880
                    *                                                   W5D07890
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D07900
                    *     CALCULATE LINE NUMBER SUBROUTINE            * W5D07910
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D07920
                    *                                                   W5D07930
                    TM630 DC      *-*       SAVE RETURN ADDR            W5D07940
                          LD    2 ERROR     GET ERROR ADDRESS           W5D07950
                          BNZ     TM640     BRANCH IF VALID             W5D07960
                    *                                                   W5D07970
                          MDM  L  TM630,3   INCR RETURN ADDR            W5D07980
                    *                                                   W5D07990
                          B       TM650     RETURN WITH ZERO            W5D08000
                    *                                                   W5D08010
                    TM640 LD    2 TXPTR     CALCULATE                   W5D08020
                          AND     TM951     *LINE                       W5D08030
                          A       TM941     *NUMBER                     W5D08040
                          XCH               PUT INTO EXT                W5D08050
                    TM650 B    I  TM630     RETURN                      W5D08060
                    *                                                   W5D08070
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D08080
                    *     CHARACTER RECEIVED WHEN IN TMT MODE         * W5D08090
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D08100
                    *                                                   W5D08110
                    TM660 LD      TM940     IS IT A SPACE               W5D08120
                          BZ      TM690     BR IF YES                   W5D08130
                    *                                                   W5D08140
                          LD    2 OPCNT     WRITE IN PROGRESS           W5D08150
                          BNZ     TM430     BR IF YES                   W5D08160
                    *                                                   W5D08170
                          LD      TM940     CHECK CIRCLE D              W5D08180
                          EOR     TM943                                 W5D08190
                          BZ      TM500     BR IF YES                   W5D08200
                    *                                                   W5D08210
                          LD    2 CNTRL     IS THIS END OF              W5D08220
                          SLA     6         *INTERRUPT FEATURE          W5D08230
                          BN      TM670     BR IF YES                   W5D08240
                    *                                                   W5D08250
                          LD      TM940     RESTORE RCV DATA            W5D08260
                          EOR     TM966     CHECK CIRCLE C              W5D08270
                          BZ      TM440     BR IF YES                   W5D08280
                    *                                                   W5D08290
                          B       TM490     GO CHECK FOR TMT            W5D08300
                    *                                                   W5D08310
                    TM670 LD      TM947     RESET OR SET                W5D08320
                          EOR   2 CNTRL     *BIT SIX                    W5D08330
                    TM680 STO   2 CNTRL                                 W5D08340
                          B       TM490     GO CHECK FOR TMT            W5D08350
                    *                                                   W5D08360
                    TM690 LD    2 CNTRL     HAVE WE ALREADY HAD         W5D08370
                          SLA     6         *ONE SPACE                  W5D08380
                          BNN     TM670     BR IF NO                    W5D08390
                    *                                                   W5D08400
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D08410
                    *     REPORT INTERRUPT FEATURE RECOGNISED         * W5D08420
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D08430
                    *                                                   W5D08440
                          LD    2 OPCNT     IS WRITE IN PROGRESS        W5D08450
                          BZ      TM430     BR IF NO                    W5D08460
                    *                                                   W5D08470
                          BSI     TM630     GO GET LINE NUMBER          W5D08480
                    *                                                   W5D08490
                          LD      TM962     LOAD ERROR CODE             W5D08500
                          BSI  I2 ERROR     GO TO USER                  W5D08510
                    *                                                   W5D08520
                          BNZ     TM430     BRANCH IF USER WISHES       W5D08530
                    *                       *TO IGNORE INTERRUPTION     W5D08540
                          STO   2 OPCNT     CLEAR O/P COUNT             W5D08550
                          LD      TM969     LOAD BIT 5                  W5D08560
                          OR    2 CNTRL     *(TMT CRLF, CIRC C)         W5D08570
                          B       TM680     GO SET INTO CNTRL           W5D08580
                    *                                                   W5D08590
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D08600
                    *     DATA RCVD PRIOR TO FIRST READ               * W5D08610
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D08620
                    *                                                   W5D08630
                    TM700 LD    2 TIMER     HOLD OFF                    W5D08640
                          SKP     Z         *ANY PENDING                W5D08650
                          A       TM941     *TIMEOUT CONDITION          W5D08660
                          STO   2 TIMER                                 W5D08670
                          LD      TM948     GET TMT CIRCLE C BIT        W5D08680
                          B       TM680     SET BIT INTO CONTROL        W5D08690
                    *                                                   W5D08700
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D08710
                    *          REPORT LOST DATA ERROR                 * W5D08720
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D08730
                    *                                                   W5D08740
                    TM710 BSI     TM630     CALCULATE LINE NUMBER       W5D08750
                    *                                                   W5D08760
                          LD      TM961     LOAD ERROR CODE             W5D08770
                          BSI  I2 ERROR     REPORT ERROR                W5D08780
                    *                       BRANCH IF USER              W5D08790
                          BNZ     TM430     *WISHES TO IGNORE           W5D08800
                    *                                                   W5D08810
                          STO   2 LNBSY     CLEAR LINE BUSY FLAG        W5D08820
                          STO   2 TIMER     *AND TIMER                  W5D08830
                          B       TM680+1   GO CHECK FOR TMT            W5D08840
                    *                                                   W5D08850
                    *                                                   W5D08860
                    *************************************************** W5D08870
                    *                                                 * W5D08880
                    *     IOCC'S AND CONSTANTS (BLOCK 4)              * W5D08890
                    *                                                 * W5D08900
                    *************************************************** W5D08910
                    *                                                   W5D08920
                    TM961 DC      /E021     2741 LOST DATA ERROR        W5D08930
                    TM962 DC      /E022     2741 INTERRUPT ERROR        W5D08940
                    TM963 DC      /E7FF     NOT BITS 3 AND 4            W5D08950
                    TM964 DC      TD909     I/P BUFFER AREA             W5D08960
                    TM965 DC      46        I/P DATA COUNT              W5D08970
                    TM966 DC      /1F00     CIRCLE C                    W5D08980
                    TM967 DC      /100F     RCV DATA TIMEOUT            W5D08990
                    TM968 DC      /2000     BIT 2                       W5D09000
                    TM969 DC      /0400     TMT NL BIT                  W5D09010
                    TM970 DC      5         CONSTANT - FIVE             W5D09020
                    *                                                 * W5D09030
                    *     ROUTINE BRANCH ADDRESS TABLE                * W5D09040
                    *                                                 * W5D09050
                    TM971 DC      TM972+4                               W5D09060
                    TM972 DC      TD200     MESSAGE RETURN              W5D09070
                          DC      TD600     ROCK,ROLL AND TWIST         W5D09080
                          DC      TD610     PRINTER FUNCTION TEST       W5D09090
                          DC      TD700     ADAPTER WRAP TEST           W5D09100
                    *                                                   W5D09110
                          HDNG    TSM41 - ON-LINE DIAGNOSTICS           W5D09120
                    *************************************************** W5D09130
                    *                                                 * W5D09140
                    *     ON-LINE DIAGNOSTICS MODULE                  * W5D09150
                    *                                                 * W5D09160
                    *************************************************** W5D09170
                    *                                                   W5D09180
                    TD010 LD    2 IPCNT     WAS A READ IN PROGRESS      W5D09190
                          SKP     Z         SKIP IF NO                  W5D09200
                          A       TD903     ADD ONE TO RESTORE TO       W5D09210
                          STO   2 IPCNT     *ORIGINAL VALUE             W5D09220
                          LD    2 CNTRL     RESET CONTROL BITS 3+4      W5D09230
                          AND     TM963     - CHECK FOR DIAGNOSTIC      W5D09240
                          STO   2 CNTRL     - ONE D ALREADY RCVD        W5D09250
                          MDM  L  TD901,0   TEST FOR MODULE BUSY        W5D09260
                          B       TD110     BRANCH IF YES               W5D09270
                    *                                                   W5D09280
                          LD    2 LNBSY     LINE ABOUT TO BE BUSY       W5D09290
                          BN      TD110     BR IF YES                   W5D09300
                    *                                                   W5D09310
                          STX     TD901     SET MODULE BUSY FLAG        W5D09320
                    *                                                   W5D09330
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D09340
                    *               SAVE LCB WORDS                    * W5D09350
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D09360
                    *                                                   W5D09370
                          LDX   1 9         SET UP INDEX                W5D09380
                          STX   2 *+1       SET UP BASE ADDR            W5D09390
                    TD020 LD   L1 *-*       SAVE AN LCB WORD            W5D09400
                          STO  L1 TD990-1   *IN SAVE BLOCK              W5D09410
                          MDX   1 -1        DECREMENT INDEX             W5D09420
                          B       TD020     RETURN FOR NEXT WORD        W5D09430
                    *                                                   W5D09440
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D09450
                    *          SET UP DIAGNOSTIC READ                 * W5D09460
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D09470
                    *                                                   W5D09480
                          LD      TM964     SET UP AN INPUT BUFFER      W5D09490
                          STO   2 IPPTR     *FOR THE INCOMING DATA      W5D09500
                          LD      TM965     SET UP A COUNT IN           W5D09510
                          STO     TD909     *INPUT BUFFER               W5D09520
                          S       TD903     SUBTRACT ONE                W5D09530
                          STO   2 IPCNT     PUT INTO I/P COUNT          W5D09540
                          LD      TD904     SET UP AN ERROR             W5D09550
                          STO   2 ERROR     *ROUTINE                    W5D09560
                          LD      TM967     SET UP A READ               W5D09570
                          STO   2 TIMER     *DATA TIMEOUT               W5D09580
                          LD      TM968     SET UP                      W5D09590
                          STO   2 DIAGN     *DIAGNOSTIC READ            W5D09600
                          B       TD120     RETURN TO MTCA0             W5D09610
                    *                                                   W5D09620
                    *                                                   W5D09630
                    *************************************************** W5D09640
                    *                                                 * W5D09650
                    *          DIAGNOSTIC READ COMPLETED              * W5D09660
                    *                                                 * W5D09670
                    *************************************************** W5D09680
                    *                                                   W5D09690
                    TD030 LD      TD909     CHECK COUNT OF              W5D09700
                          SRA     2         *CHARACTERS RCVD            W5D09710
                          BZ      TD230     BR IF TOO LOW               W5D09720
                    *                                                   W5D09730
                          LD      TD909+1   GET FIRST CHARACTER         W5D09740
                          SRA     1         CHECK VALID                 W5D09750
                          SKP     Z         SKIP IF ZERO                W5D09760
                          S       TM970     SUBTRACT FIVE               W5D09770
                          BNN     TD230     BR IF INVALID               W5D09780
                    *                                                   W5D09790
                          A       TM971     SET UP BR ADDRESS           W5D09800
                          STO     *+1       *IN NEXT INSTRUCTION        W5D09810
                          B    I  *-*       BR TO HANDLE REQUEST        W5D09820
                    *                                                   W5D09830
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D09840
                    *          OUTPUT COUNT ZERO                      * W5D09850
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D09860
                    *                                                   W5D09870
                    TD040 BOD     TD630     BR IF REPEAT MESSAGE        W5D09880
                    *                                                   W5D09890
                          SLA     2         CHECK DIAG READ             W5D09900
                          BN      TD030     BR IF YES                   W5D09910
                    *                                                   W5D09920
                          B       TD120     WAIT FOR CIRCLE D           W5D09930
                    *                                                   W5D09940
                    *                                                   W5D09950
                    *************************************************** W5D09960
                    *                                                 * W5D09970
                    *     NORMAL ERROR HANDLING ROUTINE               * W5D09980
                    *                                                 * W5D09990
                    *************************************************** W5D10000
                    *                                                   W5D10010
                    TD100 DC      *-*                                   W5D10020
                          EOR     TM962     CHECK FOR INT FEATURE       W5D10030
                          XCH               SAVE ACC                    W5D10040
                          BSI     TD300     RESTORE LCB                 W5D10050
                    *                                                   W5D10060
                          LD      TD902     SET IGNORE DATA BIT         W5D10070
                          STO   2 DIAGN     *IN DIAGNOSTIC FLAGS        W5D10080
                          LD      TM969     SET TMT CRLF BIT            W5D10090
                          OR    2 CNTRL     *INTO CONTROL WORD          W5D10100
                          STO   2 CNTRL                                 W5D10110
                          XCH               RESTORE ACC                 W5D10120
                          B    I  TD100     RETURN                      W5D10130
                    *                                                   W5D10140
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D10150
                    *     MODULE BUSY - SEND CIRCLE C                 * W5D10160
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D10170
                    *                                                   W5D10180
                    TD110 LD    2 CNTRL                                 W5D10190
                          OR      TM969     SET ON TMT NL AND           W5D10200
                          STO   2 CNTRL     *CIRCLE C BIT               W5D10210
                          LD      TD902     SET ON IGNORE               W5D10220
                          STO   2 DIAGN     *DATA BIT                   W5D10230
                    TD120 B    I  TSM41     RETURN TO MTCA0             W5D10240
                    *                                                   W5D10250
                    *************************************************** W5D10260
                    *                                                 * W5D10270
                    *          RETURN MESSAGE ROUTINE                 * W5D10280
                    *                                                 * W5D10290
                    *************************************************** W5D10300
                    *                                                   W5D10310
                    TD200 BSI     TD400     CHECK ADAPTER NUMBER        W5D10320
                    *                                                   W5D10330
                          BNZ     TD230     BR IF NOT THIS ONE          W5D10340
                    *                                                   W5D10350
                          LD      TD909     GET I/P COUNT               W5D10360
                          S       TD903     CALCULATE                   W5D10370
                          SRA     1         *END OF                     W5D10380
                          A       TD905     *I/P DATA                   W5D10390
                          STO     TD210+1   *AND SAVE                   W5D10400
                          LD      TM965                                 W5D10410
                          STO     TD909+2   SET UP O/P COUNT            W5D10420
                          STO   2 OPCNT     *ALSO IN LCB                W5D10430
                          LD      TD912     SET UP END OF               W5D10440
                    TD210 STO  L  *-*       *O/P BUFFER                 W5D10450
                          LD      TD905     SET UP                      W5D10460
                          STO   2 OPPTR     *O/P POINTER                W5D10470
                          LD      TD910     SET UP                      W5D10480
                          STO   2 DIAGN     *DIAGNOSTIC WRITE           W5D10490
                    TD220 B    L  TM140     GO SEND MESSAGE             W5D10500
                    *                                                   W5D10510
                    *                                                   W5D10520
                    *************************************************** W5D10530
                    *                                                 * W5D10540
                    *     INVALID DIAGNOSTIC REQUEST - TMT CIR C      * W5D10550
                    *                                                 * W5D10560
                    *************************************************** W5D10570
                    *                                                   W5D10580
                    TD230 BSI     TD300     GO RESTORE LCB              W5D10590
                          LD      TD902     SET IGNORE                  W5D10600
                          STO   2 DIAGN     *DATA BIT ON                W5D10610
                          LD      TM969     SET TMT NL BIT              W5D10620
                          STO   2 CNTRL                                 W5D10630
                          B    L  TM210     GO TMT CRLF                 W5D10640
                    *                                                   W5D10650
                    *                                                   W5D10660
                    *************************************************** W5D10670
                    *                                                 * W5D10680
                    *        IOCC'S AND CONSTANTS  (BLOCK 5)          * W5D10690
                    *                                                 * W5D10700
                    *************************************************** W5D10710
                    *                                                   W5D10720
                    TD901 DC      *-*       MODULE BUSY FLAG            W5D10730
                    TD902 DC      /8000     BIT 0                       W5D10740
                    TD903 DC      /0001     CONSTANT - ONE              W5D10750
                    TD904 DC      TD100     ERROR SUBROUTINE            W5D10760
                    TD905 DC      TD909+2   O/P BUFFER                  W5D10770
                    TD906 DC      /5000     CIRCLE D RCVD - CNTRL       W5D10780
                    TD907 DC      10        CONSTANT - TEN              W5D10790
                    TD908 DC      42        O.K. MESSAGE COUNT          W5D10800
                    TD909 DC      46        I/P BUFFER                  W5D10810
                          DC      0         *                           W5D10820
                          BSS     23        *                           W5D10830
                    TD910 DC      /4000     BIT 1                       W5D10840
                    TD911 DC      /5B1C     CRLF AND UC CHARS           W5D10850
                    TD912 DC      /5B1F     CRLF AND CIRCLE C           W5D10860
                    TD913 DC      /7C5D     LC    BS                    W5D10870
                    TD914 DC      /5E5D     IDLE  BS                    W5D10880
                    *                                                   W5D10890
                    *                                                   W5D10900
                    *************************************************** W5D10910
                    *                                                 * W5D10920
                    *          RESTORE LCB                            * W5D10930
                    *                                                 * W5D10940
                    *************************************************** W5D10950
                    *                                                   W5D10960
                    TD300 DC      *-*       ENTRY POINT                 W5D10970
                          LDX   1 9         SET UP INDEX                W5D10980
                          STX   2 TD320+1   SET BASE ADDR               W5D10990
                    TD310 LD   L1 TD990-1   GET SAVED WORD              W5D11000
                    *                                                   W5D11010
                    TD320 STO  L1 *-*       PUT INTO LCB                W5D11020
                          MDX   1 -1        DECR INDEX                  W5D11030
                          B       TD310     RETURN FOR NEXT WORD        W5D11040
                    *                                                   W5D11050
                          SLA     16        CLEAR                       W5D11060
                          STO     TD901     *MODULE BUSY FLAG           W5D11070
                          STO   2 DIAGN     *AND DIAGNOSTIC FLAG        W5D11080
                          B    I  TD300     RETURN TO CALLER            W5D11090
                    *                                                   W5D11100
                    *                                                   W5D11110
                    *************************************************** W5D11120
                    *                                                 * W5D11130
                    *     CALCULATE ADAPTER FOR DIAGNOSTIC            * W5D11140
                    *                                                 * W5D11150
                    *************************************************** W5D11160
                    *                                                   W5D11170
                    TD400 DC      *-*       ENTRY POINT                 W5D11180
                          LD      TD909+2   GET ADAPTER NUMBER          W5D11190
                          SRA     9         EXAMINE FIRST DIGIT         W5D11200
                          S       TD907     SUBTRACT TEN                W5D11210
                          BP      TD420     BR IF INVALID CHAR          W5D11220
                    *                                                   W5D11230
                          SKP     Z         SKIP IF ZERO                W5D11240
                          A       TD907     RESTORE IF NOT ZERO         W5D11250
                          M       TD907     MULTIPLY BY TEN             W5D11260
                          XCH               GET PRODUCT                 W5D11270
                          STO     TD931     SAVE FIRST DIGIT            W5D11280
                          LD      TD909+2   GET NUMBER AGAIN            W5D11290
                          SLA     8         CLEAR TOP HALF              W5D11300
                          SRA     9         EXAMINE SECOND DIGIT        W5D11310
                          BZ      TD420     BRANCH IF SPACE CHAR        W5D11320
                    *                                                   W5D11330
                          S       TD907     SUBTRACT TEN                W5D11340
                          BP      TD420     BR IF INVALID CHAR          W5D11350
                    *                                                   W5D11360
                          SKP     Z         SKIP IF ZERO                W5D11370
                          A       TD907     RESTORE                     W5D11380
                          A       TD931     ADD TENS DIGIT              W5D11390
                          STO     TD931     *AND SAVE                   W5D11400
                          BZ      TD410     EXIT IF ZERO                W5D11410
                    *                                                   W5D11420
                          LD    2 TXPTR     GENERATE                    W5D11430
                          SLA     12        *NUMBER                     W5D11440
                          SRA     12        *FOR THIS                   W5D11450
                          A       TD903     *LINE                       W5D11460
                          EOR     TD931     COMPARE                     W5D11470
                    TD410 B    I  TD400     RETURN TO CALLER            W5D11480
                    *                                                   W5D11490
                    TD420 LD      TD925     SET ANY INVALID             W5D11500
                          STO     TD931     *NUMBER IN SAVE WORD        W5D11510
                          B       TD410     RETURN                      W5D11520
                    *                                                   W5D11530
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D11540
                    *      DIAGNOSTIC WRITE COMPLETED                 * W5D11550
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D11560
                    *                                                   W5D11570
                    TD460 BSI     TD300     RESTORE LCB                 W5D11580
                    *                                                   W5D11590
                          LD      TD906     SET UP NEW                  W5D11600
                          STO   2 CNTRL     *CONTROL WORD               W5D11610
                          B       TD120     RETURN TO MTCA0             W5D11620
                    *                                                   W5D11630
                    *                                                   W5D11640
                    *************************************************** W5D11650
                    *                                                 * W5D11660
                    *     WRAP DIAGNOSTIC ERROR ROUTINE               * W5D11670
                    *                                                 * W5D11680
                    *************************************************** W5D11690
                    *                                                   W5D11700
                    TD500 DC      *-*       ENTRY POINT                 W5D11710
                          BZ      TD510     BR IF GOOD TEST             W5D11720
                    *                                                   W5D11730
                          LD      TD937     GET FAULTY MESSAGE          W5D11740
                          B       *+1       *AND SKIP TO STORE          W5D11750
                    TD510 LD      TD908     GET O.K. MESSAGE            W5D11760
                          STO     TD926     *AND STORE                  W5D11770
                          LD      TD922+1   RESTORE TIMER               W5D11780
                          STO   2 TIMER                                 W5D11790
                          LD      TD930     RESTORE ERROR               W5D11800
                          STO   2 ERROR                                 W5D11810
                          SLA     16                                    W5D11820
                          STO   2 DIAGN     RESET DIAGN WORD            W5D11830
                    TD520 LDX  L2 *-*       RESTORE LCB POINTER         W5D11840
                          LD      TD500     GET RETURN ADDRESS          W5D11850
                          STO  L  TSM41     *ADDRESS                    W5D11860
                    TD530 LD      TD935     SET UP O/P BUFFER           W5D11870
                          STO   2 OPPTR                                 W5D11880
                          LD      TD936     SET UP O/P COUNT            W5D11890
                          STO   2 OPCNT                                 W5D11900
                          LD      TD932     SET DIAGNOSTIC WRITE        W5D11910
                          STO   2 DIAGN     *AND REPEAT BITS            W5D11920
                          LD      TD904     SET UP                      W5D11930
                          STO   2 ERROR     *NEW ERROR ROUTINE          W5D11940
                    TD540 B       TD220     GO SEND MESSAGE             W5D11950
                    *                                                   W5D11960
                    *                                                   W5D11970
                    *************************************************** W5D11980
                    *                                                 * W5D11990
                    *     RETURN PRINTER DIAGNOSTIC TESTS             * W5D12000
                    *                                                 * W5D12010
                    *************************************************** W5D12020
                    *                                                   W5D12030
                    TD600 LDD     TD924     GET ROCK,ROLL AND           W5D12040
                          SKP     +         *TWIST BUFFER DATA          W5D12050
                    TD610 LDD     TD928     GET PR FUNCTION DATA        W5D12060
                          STD     TD926     SAVE                        W5D12070
                          BSI     TD400     CHECK ADAPTER NUMBER        W5D12080
                    *                                                   W5D12090
                          BNZ     TD230     BR IF NOT THIS ONE          W5D12100
                    *                                                   W5D12110
                          LD      TD913     RESTORE CASE SHIFT          W5D12120
                          STO     TD941     *IN DD3 MESSAGE             W5D12130
                    *                                                   W5D12140
                          LD      TD926     SET UP O/P BUFFER           W5D12150
                          STO   2 OPPTR                                 W5D12160
                          LD   I  TD926     GET O/P COUNT               W5D12170
                          STO     TD926     SAVE FOR REPEAT             W5D12180
                          LD      TD932     SET BITS 1 & 15             W5D12190
                          STO   2 DIAGN     IN DIAG FLAGS               W5D12200
                          LD      TD911     GET UC AND CRLF CHARS       W5D12210
                    TD620 STO  I  TD927     PUT AT END OF MESSAGE       W5D12220
                          LD      TD926     SET UP O/P COUNT            W5D12230
                          STO   2 OPCNT                                 W5D12240
                          B       TD540     GO SEND MESSAGE             W5D12250
                    *                                                   W5D12260
                    TD630 LD      TD914     DELETE CASE SHIFT           W5D12270
                          STO     TD941     *IN DD3 MESSAGE             W5D12280
                          LD      TD910     SET OFF REPEAT BIT          W5D12290
                          STO   2 DIAGN                                 W5D12300
                          LD      TD912     GET CRLF/EOT CHARS          W5D12310
                          B       TD620     GO SET IN MESSAGE           W5D12320
                    *                                                   W5D12330
                    *                                                   W5D12340
                    *************************************************** W5D12350
                    *                                                 * W5D12360
                    *     IOCCS AND CONTANTS (BLOCK 6)                * W5D12370
                    *                                                 * W5D12380
                    *************************************************** W5D12390
                    *                                                   W5D12400
                    TD921 DC      /0001     BIT 15                      W5D12410
                          BSS  E  0         FORCE EVEN BOUNDARY         W5D12420
                    TD922 DC      /FF00     SENSE DSW2 IOCC           E W5D12430
                          DC      *-*                                   W5D12440
                    TD924 DC      TD962     ROCK,ROLL AND TWIST       E W5D12450
                    TD925 DC      TD963     *O/P INFORMATION            W5D12460
                    TD926 DC      *-*       O/P POINTER AND ALSO      E W5D12470
                    *                       *O/P COUNT FOR REPEAT       W5D12480
                    TD927 DC      TD942     EOM INDICATOR               W5D12490
                    TD928 DC      TD940     PRINTER FUNCTION TEST     E W5D12500
                    TD929 DC      TD942     *O/P INFORMATION            W5D12510
                    TD930 DC      *-*       SAVE ERROR                  W5D12520
                    TD931 DC      *-*       SAVE ADAPTER NUMBER         W5D12530
                    TD932 DC      /4001     BITS 1 AND 15               W5D12540
                    TD933 DC      /5001     REQUEST DIAGNOSE            W5D12550
                    TD934 DC      /1000     DIAGNOSE TIMEOUT BIT        W5D12560
                    TD935 DC      TD960     WRAP RESULT MESSAGE         W5D12570
                    TD936 DC      14        O/P COUNT                   W5D12580
                    TD937 DC      38        FAULTY MESSAGE COUNT        W5D12590
                    TD938 DC      TD500     WRAP ERROR ROUTINE          W5D12600
                    *                                                   W5D12610
                    *                                                   W5D12620
                    *************************************************** W5D12630
                    *                                                 * W5D12640
                    *     WRAP ADAPTER TEST REQUESTED                 * W5D12650
                    *                                                 * W5D12660
                    *************************************************** W5D12670
                    *                                                   W5D12680
                    TD700 LD   L  TD909+2   SET UP ADAPTER              W5D12690
                          STO     TD961     *NUMBER FOR MESSAGE         W5D12700
                          BSI     TD400     GO CHECK ADAPTER            W5D12710
                    *                                                   W5D12720
                          BZ      TD230     BR IF THIS LINE             W5D12730
                    *                                                   W5D12740
                          LD   I  TD951+1   GET ADDRESS OF              W5D12750
                          STO     TD951     *SYSTEM PARAMETERS          W5D12760
                          LD   I  TD951     GET HIGHEST LINE NUMB       W5D12770
                          S       TD931     CHECK VALID REQUEST         W5D12780
                          BN      TD720     BR IF INVALID               W5D12790
                    *                                                   W5D12800
                          LD      TD951     CALCULATE LCB               W5D12810
                          A       TD931     *ADDRESS FOR THE LINE       W5D12820
                          STO     *+1       PUT INTO                    W5D12830
                          LDX  I1 *-*       *XR1                        W5D12840
                          MDX   1 0         CHECK VALID                 W5D12850
                          B       *+1       SKIP IF VALID               W5D12860
                    *                                                   W5D12870
                          B       TD720     BR IF INVALID               W5D12880
                    *                                                   W5D12890
                          STX   2 TD520+1   SAVE LCB ADDR               W5D12900
                          LD    1 TXPTR     GENERATE                    W5D12910
                          SLA     4         *SENSE DSW2                 W5D12920
                          OR      TD922     *IOCC FOR THIS LINE         W5D12930
                          STO     TD922+1                               W5D12940
                          XIO     TD922     SENSE DSW2                  W5D12950
                          SLA     5         INSPECT FOR USE             W5D12960
                          SKP     C+Z       SKIP IF NOT BUSY            W5D12970
                          B       TD710     GO SEND BUSY MESSAGE        W5D12980
                    *                                                   W5D12990
                          LD    1 LNBSY     CHECK FOR ABOUT TO          W5D13000
                    *                       *BE BUSY                    W5D13010
                          SKP     -         SKIP IF YES                 W5D13020
                          LD    1 CNTRL     CHECK FOR WRAP              W5D13030
                          BN      TD710     BR IF LINE IS BUSY          W5D13040
                    *                                                   W5D13050
                          SLA     16                                    W5D13060
                          STO   2 TIMER     CLEAR TIMER                 W5D13070
                          LD      TD950     SET UP INTERIM              W5D13080
                          STO   2 ERROR     *EROR ROUTINE               W5D13090
                          LD    1 TIMER     SAVE TIMER WORD             W5D13100
                          STO     TD922+1                               W5D13110
                          LD    1 ERROR     SAVE ERROR ROUTINE          W5D13120
                          STO     TD930                                 W5D13130
                          LD      TD933     SET UP REQUEST              W5D13140
                          STO   1 TIMER     *FOR WRAP TEST              W5D13150
                          LD      TD938     SET UP ERROR                W5D13160
                          STO   1 ERROR     *ROUTINE ADDRESS            W5D13170
                          LD      TD934     SET UP DIAGNOSE             W5D13180
                          STO   1 DIAGN     *TIMEOUTS ON                W5D13190
                          STO   2 DIAGN     *BOTH LINES                 W5D13200
                          LD    1 CNTRL     SET UP WRAP                 W5D13210
                          OR      TD921     *REQUEST FROM               W5D13220
                          STO   1 CNTRL     *A TERMINAL BIT             W5D13230
                          B    I  TSM41     RETURN TO MTCA0             W5D13240
                    *                                                   W5D13250
                    TD710 LD      TD954     SET UP BUSY MESSAGE         W5D13260
                          SKP     +                                     W5D13270
                    TD720 LD      TD953     SET UP INVALID              W5D13280
                          STO     TD926     *ADAPTER MESSAGE            W5D13290
                          B       TD530     GO SEND                     W5D13300
                    *                                                   W5D13310
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D13320
                    *          PRINTER FUNCTION TEST DATA             * W5D13330
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D13340
                    *                                                   W5D13350
                    TD940 DC      74        OUTPUT COUNT                W5D13360
                          DC      /5B67     CRLF C                      W5D13370
                          DC      /5246     R    L                      W5D13380
                          DC      /6D7A     F    TAB                    W5D13390
                          DC      /2662     T    A                      W5D13400
                          DC      /647A     B    TAB                    W5D13410
                          DC      /2662     T    A                      W5D13420
                          DC      /645B     B    CRLF                   W5D13430
                          DC      /6752     C    R                      W5D13440
                          DC      /466D     L    F                      W5D13450
                          DC      /0173     SP   I                      W5D13460
                          DC      /5D3B     BS   LF                     W5D13470
                          DC      /4A5D     N    BS                     W5D13480
                          DC      /3B68     LF   D                      W5D13490
                          DC      /5D3B     BS   LF                     W5D13500
                          DC      /6B5D     E    BS                     W5D13510
                          DC      /3B2F     LF   X                      W5D13520
                          DC      /5D5D     BS   BS                     W5D13530
                          DC      /3B5E     LF   IDLE                   W5D13540
                          DC      /254F     S    P                      W5D13550
                          DC      /6267     A    C                      W5D13560
                          DC      /6B01     E    SP                     W5D13570
                          DC      /0101     SP   SP                     W5D13580
                          DC      /0101     SP   SP                     W5D13590
                          DC      /1C10     UC   *                      W5D13600
                    TD941 DC      /7C5D     LC   BS                     W5D13610
                          DC      /5D5D     BS   BS                     W5D13620
                          DC      /5D5D     BS   BS                     W5D13630
                          DC      /5D5D     BS   BS                     W5D13640
                          DC      /5D5D     BS   BS                     W5D13650
                          DC      /5D5D     BS   BS                     W5D13660
                          DC      /5D45     BS   K                      W5D13670
                          DC      /5D5D     BS   BS                     W5D13680
                          DC      /675D     C    BS                     W5D13690
                          DC      /5D62     BS   A                      W5D13700
                          DC      /5D5D     BS   BS                     W5D13710
                          DC      /645E     B    IDLE                   W5D13720
                    TD942 DC      *-*       LAST CHARACTERS             W5D13730
                    *                                                   W5D13740
                    *                                                   W5D13750
                    *************************************************** W5D13760
                    *                                                 * W5D13770
                    *     IOCC'S AND CONSTANTS  (BLOCK 7)             * W5D13780
                    *                                                 * W5D13790
                    *************************************************** W5D13800
                    *                                                   W5D13810
                    TD950 DC      TD800     INTERIM ERROR ROUTINE       W5D13820
                    TD951 CALL    MTCAP     FIND SYSTEM PARAMETERS      W5D13830
                    TD953 DC      30        INVALID MESSAGE COUNT       W5D13840
                    TD954 DC      20        BUSY MESSAGE COUNT          W5D13850
                    *                                                   W5D13860
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D13870
                    *     WRAP DIAGNOSTIC RESULT MESSAGES             * W5D13880
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D13890
                    *                                                   W5D13900
                    TD960 DC      42        O/P COUNT                   W5D13910
                          DC      /4C45     O    K                      W5D13920
                          DC      /5B1F     CRLF EOT                    W5D13930
                    *                                                   W5D13940
                          DC      /6D62     F    A                      W5D13950
                          DC      /2946     U    L                      W5D13960
                          DC      /2631     T    Y                      W5D13970
                          DC      /5B1F     CRLF EOT                    W5D13980
                    *                                                   W5D13990
                          DC      /734A     I    N                      W5D14000
                          DC      /2A62     V    A                      W5D14010
                          DC      /4673     L    I                      W5D14020
                          DC      /685E     D    IDLE                   W5D14030
                          DC      /5B1F     CRLF EOT                    W5D14040
                    *                                                   W5D14050
                          DC      /6429     B    U                      W5D14060
                          DC      /2531     S    Y                      W5D14070
                          DC      /5B1F     CRLF EOT                    W5D14080
                    *                                                   W5D14090
                          DC      /1C62     UC   A                      W5D14100
                          DC      /6862     D    A                      W5D14110
                          DC      /4F26     P    T                      W5D14120
                          DC      /6B52     E    R                      W5D14130
                          DC      /7C01     LC   SP                     W5D14140
                    TD961 DC      /2F2F     X    X                      W5D14150
                          DC      /1C01     UC   SP                     W5D14160
                    *                                                   W5D14170
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D14180
                    *          ROCK, ROLL AND TWIST DATA              * W5D14190
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5D14200
                    *                                                   W5D14210
                    TD962 DC      152       OUTPUT COUNT                W5D14220
                          DC      /524C     R    O                      W5D14230
                          DC      /6745     C    K                      W5D14240
                          DC      /5B13     CRLF 9                      W5D14250
                          DC      /642C     B    W                      W5D14260
                          DC      /4031     -    Y                      W5D14270
                          DC      /2570     S    H                      W5D14280
                          DC      /150C     0    6                      W5D14290
                          DC      /4573     K    I                      W5D14300
                          DC      /514F     Q    P                      W5D14310
                          DC      /166B     #    E                      W5D14320
                          DC      /0B04     5    2                      W5D14330
                          DC      /4A76     N    .                      W5D14340
                          DC      /6143     &    J                      W5D14350
                          DC      /2026     @    T                      W5D14360
                          DC      /3208     Z    4                      W5D14370
                          DC      /464C     L    O                      W5D14380
                          DC      /2337     /    ,                      W5D14390
                          DC      /6267     A    C                      W5D14400
                          DC      /100E     8    7                      W5D14410
                          DC      /6852     D    R                      W5D14420
                          DC      /576D     $    F                      W5D14430
                          DC      /2A29     V    U                      W5D14440
                          DC      /0702     3    1                      W5D14450
                          DC      /2F49     X    M                      W5D14460
                          DC      /6E5B     G    CRLF                   W5D14470
                          DC      /524C     R    O                      W5D14480
                          DC      /4646     L    L                      W5D14490
                          DC      /5B6E     CRLF G                      W5D14500
                          DC      /6D57     F    $                      W5D14510
                          DC      /3723     ,    /                      W5D14520
                          DC      /4361     J    &                      W5D14530
                          DC      /4F51     P    Q                      W5D14540
                          DC      /3140     Y    -                      W5D14550
                          DC      /2C25     W    S                      W5D14560
                          DC      /7316     I    #                      W5D14570
                          DC      /7620     .    @                      W5D14580
                          DC      /4C62     O    A                      W5D14590
                          DC      /522A     R    V                      W5D14600
                          DC      /492F     M    X                      W5D14610
                          DC      /2968     U    D                      W5D14620
                          DC      /6746     C    L                      W5D14630
                          DC      /264A     T    N                      W5D14640
                          DC      /6B45     E    K                      W5D14650
                          DC      /7064     H    B                      W5D14660
                          DC      /1315     9    0                      W5D14670
                          DC      /0C0B     6    5                      W5D14680
                          DC      /0432     2    Z                      W5D14690
                          DC      /0810     4    8                      W5D14700
                          DC      /0E07     7    3                      W5D14710
                          DC      /025B     1    CRLF                   W5D14720
                          DC      /262C     T    W                      W5D14730
                          DC      /7325     I    S                      W5D14740
                          DC      /265B     T    CRLF                   W5D14750
                          DC      /6E13     G    9                      W5D14760
                          DC      /6D15     F    0                      W5D14770
                          DC      /570C     $    6                      W5D14780
                          DC      /370B     ,    5                      W5D14790
                          DC      /2304     /    2                      W5D14800
                          DC      /4332     J    Z                      W5D14810
                          DC      /6108     &    4                      W5D14820
                          DC      /4F10     P    8                      W5D14830
                          DC      /510E     Q    7                      W5D14840
                          DC      /3107     Y    3                      W5D14850
                          DC      /4002     -    1                      W5D14860
                          DC      /2C2F     W    X                      W5D14870
                          DC      /2529     S    U                      W5D14880
                          DC      /7368     I    D                      W5D14890
                          DC      /1667     #    C                      W5D14900
                          DC      /7646     .    L                      W5D14910
                          DC      /2026     @    T                      W5D14920
                          DC      /4C4A     O    N                      W5D14930
                          DC      /686B     D    E                      W5D14940
                          DC      /5245     R    K                      W5D14950
                          DC      /2A70     V    H                      W5D14960
                          DC      /4964     M    B                      W5D14970
                    TD963 DC      *-*       LAST CHARACTERS             W5D14980
                    *                                                   W5D14990
                    TD990 BSS     9         SAVE LCB WORDS              W5D15000
                    *                                                   W5D15010
                    *                                                   W5D15020
                    *************************************************** W5D15030
                    *                                                 * W5D15040
                    *          INTERIM ERROR DURING WRAP              * W5D15050
                    *                                                 * W5D15060
                    *************************************************** W5D15070
                    *                                                   W5D15080
                    TD800 DC      *-*        ENTRY POINT                W5D15090
                          B    I  TD800      RETURN                     W5D15100
                    *                                                   W5D15110
                          END                                           W5D15120
