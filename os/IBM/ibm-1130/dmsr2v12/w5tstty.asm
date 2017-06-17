                          HDNG    TSTTY - MTCA TELETYPE TERMINAL MODULE W5E00010
                    *************************************************** W5E00020
                    *STATUS - VERSION 2, MODIFICATION 9               * W5E00030
                    *                                                 * W5E00040
                    *SUBROUTINE NAME -                                * W5E00050
                    *   FULL NAME - TELETYPE TERMINAL SELECT MODULE   * W5E00060
                    *               FOR THE MULTIPLE TERMINAL         * W5E00070
                    *               COMMUNICATIONS ADAPTER (MTCA)     * W5E00080
                    *   CODE NAME - TSTTY                             * W5E00090
                    *                                                 * W5E00100
                    *PURPOSE -                                        * W5E00110
                    *   THIS SUBROUTINE, IN CONJUNCTION WITH MTCA0    * W5E00120
                    *   PROVIDES THE NECESSARY FUNCTIONS TO CONTROL   * W5E00130
                    *   COMMUNICATIONS LINES CONNECTED BETWEEN THE    * W5E00140
                    *   MTCA AND TELETYPE TERMINALS                   * W5E00150
                    *   DATA IS TRANSFERED ON A PER CHARACTER BASIS   * W5E00160
                    *                                                 * W5E00170
                    *METHOD -                                         * W5E00180
                    *   THE SUBROUTINE HAS TWO ENTRY POINTS -         * W5E00190
                    *      * INITIATE WRITE - A CHARACTER IS          * W5E00200
                    *        TRANSMITTED TO A SPECIFIC TERMINAL       * W5E00210
                    *      * INTERRUPT SERVICE - THE ADAPTER STATUS   * W5E00220
                    *        IS EXAMINED FOR THE REQUESTED SERVICE    * W5E00230
                    *        (TMT AND/OR RCV)                         * W5E00240
                    *   THE DIAGNOSE FUNCTION (WRAP MODE) IS          * W5E00250
                    *   CONTINUED BY TSTTY ONCE MTCA0 HAS TRANSMITTED * W5E00260
                    *   THE FIRST WRAP CHARACTER                      * W5E00270
                    *                                                 * W5E00280
                    *CAPABILITIES AND LIMITATIONS -                   * W5E00290
                    *   TSTTY IS ONLY ENTERED BY MTCA0                * W5E00300
                    *                                                 * W5E00310
                    *SPECIAL FEATURES -                               * W5E00320
                    *   NONE                                          * W5E00330
                    *                                                 * W5E00340
                    *ADDITIONAL INFORMATION -                         * W5E00350
                    *   ERROR PROCEDURES -                            * W5E00360
                    *      ANY DATA RCVD WILL NOT BE PASSED ON TO THE * W5E00370
                    *      USER UNLESS A VALID INPUT COUNT (UNITY)    * W5E00380
                    *      IS PRESENT IN THE LCB (LINE CONTROL BLOCK) * W5E00390
                    *      FOR THAT LINE                              * W5E00400
                    *      DATA OVERRUN AND VRC (BAD PARITY) ERRORS   * W5E00410
                    *      ARE REPORTED TO THE USER                   * W5E00420
                    *   CALLING SEQUENCE -                            * W5E00430
                    *      TSTTY IS NOT ENTERED IN THE NORMAL MANNER. * W5E00440
                    *      ITS STARTING ADDRESS IS PLACED IN THE LCB  * W5E00450
                    *      FOR ALL LINES OF THAT TYPE DURING          * W5E00460
                    *      INITIALIZATION.  MTCA0 ENTERS TSTTY BY     * W5E00470
                    *      MEANS OF A BSI INSTRUCTION AT TSTTY+0 FOR  * W5E00480
                    *      INTERRUPT SERVICE, AND AT TSTTY+2 FOR      * W5E00490
                    *      INITIATE WRITE SERVICE.                    * W5E00500
                    *      LOCATION TSTTY+4 CONTAINS THE FIRST WRAP   * W5E00510
                    *      CHARACTER (USED BY MTCA0 DURING DIAGNOSE)  * W5E00520
                    *                                                 * W5E00530
                    *************************************************** W5E00540
                    *                                                   W5E00550
                    *                                                   W5E00560
                    *************************************************** W5E00570
                    *                                                 * W5E00580
                    *          USE OF 'CNTRL' BY TSTTY                * W5E00590
                    *                                                 * W5E00600
                    *************************************************** W5E00610
                    *                                                 * W5E00620
                    *     BIT  0  WRAP MODE                           * W5E00630
                    *         12  RCV INTERRUPT RCVD IN WRAP MODE     * W5E00640
                    *         13  TMT INTERRUPT RCVD IN WRAP MODE     * W5E00650
                    *         15  WRAP CALLED FROM A TERMINAL         * W5E00660
                    *                                                 * W5E00670
                    *************************************************** W5E00680
                    *                                                   W5E00690
                    *                                                   W5E00700
                    *************************************************** W5E00710
                    *                                                 * W5E00720
                    *           USE OF 'TIMER' BY TSTTY               * W5E00730
                    *                                                 * W5E00740
                    *************************************************** W5E00750
                    *                                                 * W5E00760
                    *                 'X00Y'                          * W5E00770
                    *     WHERE -                                     * W5E00780
                    *          X IS THE FUNCTION DIGIT,               * W5E00790
                    *            1  RCV DATA TIMEOUT                  * W5E00800
                    *            2  TMT DATA TIMEOUT                  * W5E00810
                    *            3  CONNECT ADAPTER TIMEOUT           * W5E00820
                    *            4  DISCONNECT ADAPTER TIMEOUT        * W5E00830
                    *            5  REQUEST WRAP AND TEST ADAPTER     * W5E00840
                    *            6  WRAP ADAPTER TIMEOUT              * W5E00850
                    *            7  WRAP DATA TIMEOUT                 * W5E00860
                    *            8  RECONNECT ADAPTER TIMEOUT         * W5E00870
                    *            9  REPORT PRE-TMT ERROR              * W5E00880
                    *          Y IS THE COUNT IN TIMER UNITS          * W5E00890
                    *                                                 * W5E00900
                    *************************************************** W5E00910
                    *                                                   W5E00920
                    *                                                   W5E00930
                    *************************************************** W5E00940
                    *                                                 * W5E00950
                    *          EQUATE STATEMENTS                      * W5E00960
                    *                                                 * W5E00970
                    *************************************************** W5E00980
                    *                                                   W5E00990
                          ENT     TSTTY                                 W5E01000
                    *                                                   W5E01010
                    LNBSY EQU     0         LINE BUSY FLAG              W5E01020
                    TSMAD EQU     1         T.S.M. ADDRESS              W5E01030
                    IPPTR EQU     2         INPUT POINTER               W5E01040
                    IPCNT EQU     3         INPUT COUNT                 W5E01050
                    OPPTR EQU     4         OUTPUT POINTER              W5E01060
                    LPDAT EQU     OPPTR     LOOPED DATA                 W5E01070
                    OPCNT EQU     5         OUTPUT COUNT                W5E01080
                    ERROR EQU     6         ERROR ADDRESS               W5E01090
                    CNTRL EQU     7         CONTROL FLAGS               W5E01100
                    DIAGN EQU     8         DIAGNOSTIC CONTROL          W5E01110
                    TIMER EQU     9         TIMER CONTROL WORD          W5E01120
                    RXPTR EQU     10        RCV DATA LOCATION           W5E01130
                    TXPTR EQU     11        TMT DATA LOCATION           W5E01140
                    STATC EQU     12        STATISTICS COUNT            W5E01150
                    *                                                   W5E01160
                    *                                                   W5E01170
                    *************************************************** W5E01180
                    *                                                 * W5E01190
                    *     TERMINAL SELECT ENTRY POINTS                * W5E01200
                    *                                                 * W5E01210
                    *************************************************** W5E01220
                    *                                                   W5E01230
                    TSTTY DC      *-*       INTERRUPT SERVICE ENTRY     W5E01240
                          B       TT300     BR TO CONTINUE              W5E01250
                    *                                                   W5E01260
                    TT002 DC      *-*       INITIATE WRITE ENTRY        W5E01270
                          B       TT100     BR TO CONTINUE              W5E01280
                    *                                                   W5E01290
                    TT004 DC      /0003     FIRST WRAP CHARACTER        W5E01300
                    *                                                   W5E01310
                    *                                                   W5E01320
                    *************************************************** W5E01330
                    *                                                 * W5E01340
                    *          INITIATE WRITE ROUTINE                 * W5E01350
                    *                                                 * W5E01360
                    *************************************************** W5E01370
                    *                                                   W5E01380
                    TT100 BNZ     TT110     BR IF LINK NOT ACTIVE       W5E01390
                    *                                                   W5E01400
                          LD    2 OPCNT     CHECK UNITY O/P COUNT       W5E01410
                          S       TT905                                 W5E01420
                          BNZ     TT120     BR IF NOT                   W5E01430
                    *                                                   W5E01440
                          LD    2 OPPTR     CALCULATE USER'S            W5E01450
                          A       TT905     *DATA AREA                  W5E01460
                          STO     *+1                                   W5E01470
                          LD   L  *-*       GET O/P CHARACTER           W5E01480
                          SRA     6         POSITION AND                W5E01490
                          OR      TT004     *ADD STOP BITS              W5E01500
                          STO  I2 TXPTR     TRANSMIT                    W5E01510
                          LD      TT906     GET TMT TIMEOUT CODE        W5E01520
                          B       TT130-1   GO SET UP                   W5E01530
                    *                                                   W5E01540
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5E01550
                    *     INITIATE WRITE ERROR REPORTING              * W5E01560
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5E01570
                    *                                                   W5E01580
                    TT110 LD      TT910     GET LINK NOT ACTIVE         W5E01590
                          B       *+1       *ERROR CODE                 W5E01600
                    TT120 LD      TT911     ILLEGAL COUNT ERROR         W5E01610
                          STO   2 OPPTR     SAVE                        W5E01620
                          LD      TT918     GET ERROR TIMEOUT           W5E01630
                          STO   2 TIMER     SET UP TIMEOUT              W5E01640
                    TT130 B    I  TT002     RETURN TO MTCA0             W5E01650
                    *                                                   W5E01660
                    *                                                   W5E01670
                    *************************************************** W5E01680
                    *                                                 * W5E01690
                    *          IOCC'S AND CONSTANTS                   * W5E01700
                    *                                                 * W5E01710
                    *************************************************** W5E01720
                    *                                                   W5E01730
                          BSS  E  0         FORCE EVEN BOUNDARY         W5E01740
                    TT900 DC      /FF01     SENSE AND RESET           E W5E01750
                          DC      *-*       *DSW2 IOCC                  W5E01760
                    TT902 DC      2         CONSTANT - TWO            E W5E01770
                          DC      /FC0A     ENABLE MTCA FOR TMT         W5E01780
                    TT904 DC      /FC04     CONNECT IOCC                W5E01790
                    TT905 DC      1         CONSTANT - ONE              W5E01800
                    TT906 DC      /2002     TMT TIMEOUT                 W5E01810
                    TT907 DC      /7002     WRAP TIMEOUT                W5E01820
                    TT908 DC      /8002     RECONNECT TIMEOUT           W5E01830
                    TT909 DC      /E009     DATA OVERRUN ERROR          W5E01840
                    TT910 DC      /E00A     LINK NOT ACTIVE ERROR       W5E01850
                    TT911 DC      /E00B     INVALID COUNT ERROR         W5E01860
                    TT912 DC      /E00E     PARITY (VRC) ERROR          W5E01870
                    TT913 DC      /000C     BITS 12 AND 13              W5E01880
                    TT914 DC      /000F     MASK LAST DIGIT             W5E01890
                    TT915 DC      *-*       SAVE RCV LOCATION           W5E01900
                    TT916 DC      *-*       SAVE DSW2                   W5E01910
                    TT917 DC      *-*       SAVE RCV DATA               W5E01920
                    TT918 DC      /9001     PRE-TMT ERROR TIMEOUT       W5E01930
                    *                                                   W5E01940
                    *                                                   W5E01950
                    *************************************************** W5E01960
                    *                                                 * W5E01970
                    *          WRAP MODE SERVICE                      * W5E01980
                    *                                                 * W5E01990
                    *************************************************** W5E02000
                    *                                                   W5E02010
                    TT200 XIO     TT900     SENSE/RESET DSW2            W5E02020
                          SRA     12        ISOLATE RCV/TMT BITS        W5E02030
                          OR    2 CNTRL     SET INTO CONTROL            W5E02040
                          STO   2 CNTRL                                 W5E02050
                          AND     TT913     CHECK FOR BOTH              W5E02060
                          EOR     TT913     *INTERRUPTS IN              W5E02070
                          BNZ     TT320     BR IF NO                    W5E02080
                    *                                                   W5E02090
                          LD    2 CNTRL     RESET INTERRUPTS            W5E02100
                          EOR     TT913     *IN BITS                    W5E02110
                          STO   2 CNTRL                                 W5E02120
                    *                                                   W5E02130
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5E02140
                    *          COMPARE LOOPED DATA                    * W5E02150
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5E02160
                    *                                                   W5E02170
                          LD      TT915     GET RCV DATA                W5E02180
                          SRA     7         REMOVE ASSEMBLY AREA        W5E02190
                          LDX   1 1         SET UP INDEX                W5E02200
                    TT210 SKP     E         SKIP IF NO BIT 15           W5E02210
                          MDX   1 1         INCREMENT INDEX             W5E02220
                          SRA     1         MOVE ALONG DATA             W5E02230
                          SKP     Z         SKIP IF ALL DONE            W5E02240
                          B       TT210     COUNT FURTHER BITS          W5E02250
                    *                                                   W5E02260
                          STX   1 TT917     EXAMINE STATE               W5E02270
                          LD      TT917     *OF XR1                     W5E02280
                          BOD     TT320     BR IF BAD PARITY            W5E02290
                    *                                                   W5E02300
                          LD      TT915     GET RCV DATA                W5E02310
                          SLA     1         FORMAT                      W5E02320
                          SRA     8                                     W5E02330
                          EOR   2 LPDAT     COMPARE WITH TMT DATA       W5E02340
                          BNZ     TT320     BR IF BAD COMPARE           W5E02350
                    *                                                   W5E02360
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5E02370
                    *          SET UP DISABLE TMT TIMEOUT             * W5E02380
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5E02390
                    *                                                   W5E02400
                          LD      TT902     SET A CONSTANT              W5E02410
                          CALL    MTCAM     *OF VALUE TWO               W5E02420
                          ORG     *-2       *INTO THE TRANSFER          W5E02430
                          DC      /D400     *VECTOR FOR                 W5E02440
                          ORG     *+1       *MTCAM SUBROUTINE           W5E02450
                    *                                                   W5E02460
                          XIO     TT902     ENABLE TMT                  W5E02470
                    *                                                   W5E02480
                          LD    2 LPDAT     INCREMENT LOOP DATA         W5E02490
                          A       TT905     *BY ONE                     W5E02500
                          STO   2 LPDAT                                 W5E02510
                          SLA     8         ALL DATA WRAPPED            W5E02520
                          BZ      TT220     BR IF YES                   W5E02530
                    *                                                   W5E02540
                          SRA     6         FORMAT                      W5E02550
                          OR      TT004     ADD STOP BITS               W5E02560
                          STO  I2 TXPTR     TRANSMIT                    W5E02570
                    *                                                   W5E02580
                          LD      TT907     SET UP TMT                  W5E02590
                          STO   2 TIMER     *TIMEOUT CONDITION          W5E02600
                          B       TT320     RETURN TO MTCA0             W5E02610
                    *                                                   W5E02620
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5E02630
                    *      WRAP COMPLETED - RECONNECT LINE            * W5E02640
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5E02650
                    *                                                   W5E02660
                    TT220 LD      TT908     SET UP CONNECT              W5E02670
                          STO   2 TIMER     *TIMEOUT                    W5E02680
                          LD    2 TXPTR     GENERATE                    W5E02690
                          SLA     12        *CONNECT                    W5E02700
                          SRA     8         *ADAPTER                    W5E02710
                          OR      TT904     *IOCC                       W5E02720
                          STO     TT900+1   *FOR THIS LINE              W5E02730
                          XIO     TT900     CONNECT LINE                W5E02740
                          B       TT320     RETURN TO MTCA0             W5E02750
                    *                                                   W5E02760
                    *                                                   W5E02770
                    *************************************************** W5E02780
                    *                                                 * W5E02790
                    *          INTERRUPT SERVICE ROUTINE              * W5E02800
                    *                                                 * W5E02810
                    *************************************************** W5E02820
                    *                                                   W5E02830
                    TT300 LD    2 RXPTR     GENERATE                    W5E02840
                          SLA     4         *SENSE AND                  W5E02850
                          OR      TT900     *RESET DSW2                 W5E02860
                          STO     TT900+1   *IOCC AND SAVE              W5E02870
                          LD   I2 RXPTR     GET RCV DATA                W5E02880
                          STO     TT915     SAVE FOR LATER USE          W5E02890
                          LD    2 CNTRL     CHECK FOR WRAP MODE         W5E02900
                          BN      TT200     BR IF YES                   W5E02910
                    *                                                   W5E02920
                          XIO     TT900     SENSE/RESET DSW2            W5E02930
                          STO     TT916     SAVE DSW2                   W5E02940
                          BN      TT330     BR IF RCV SERVICE           W5E02950
                    *                                                   W5E02960
                    TT310 SLA     1         CHECK FOR TMT SERVICE       W5E02970
                          BNN     TT320     BR IF NO                    W5E02980
                    *                                                   W5E02990
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5E03000
                    *          TMT CHARACTER SERVICE                  * W5E03010
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5E03020
                    *                                                   W5E03030
                          SLA     16        CLEAR                       W5E03040
                          STO   2 TIMER     *TIMER WORD                 W5E03050
                          STO   2 LNBSY     *LINE BUSY FLAG             W5E03060
                    TT320 B    I  TSTTY     RETURN TO MTCA0             W5E03070
                    *                                                   W5E03080
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5E03090
                    *          RCV CHARACTER SERVICE                  * W5E03100
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5E03110
                    *                                                   W5E03120
                    TT330 LD      TT915     FETCH RCV LOCATION          W5E03130
                          SLA     1         REMOVE VRC CHECK BIT        W5E03140
                          AND     TT900     REMOVE ASSEMBLY AREA        W5E03150
                          STO     TT917     SAVE THE CHARACTER          W5E03160
                          LD    2 IPCNT     GET I/P COUNT               W5E03170
                          S       TT905     CHECK FOR UNITY             W5E03180
                          BNZ     TT360     BR IF NO                    W5E03190
                    *                                                   W5E03200
                          LD      TT916     GET DSW2                    W5E03210
                          BOD     TT380     BR IF OVERRUN               W5E03220
                    *                                                   W5E03230
                          LD      TT915     CHECK VRC                   W5E03240
                          BNN     TT370     BR IF ODD                   W5E03250
                    *                                                   W5E03260
                    TT340 LD    2 IPPTR     CALCULATE USER'S            W5E03270
                          A       TT905     *I/P LOCATION               W5E03280
                          STO     TT350+1   *AND SAVE                   W5E03290
                          LD      TT917     GET RCV DATA                W5E03300
                    TT350 STO  L  *-*       PUT IN USER AREA            W5E03310
                    *                                                   W5E03320
                          SLA     16        CLEAR                       W5E03330
                          STO   2 LNBSY     *LINE BUSY FLAG             W5E03340
                          STO   2 TIMER     *TIMER WORD                 W5E03350
                          STO   2 IPCNT     *I/P COUNT                  W5E03360
                    *                                                   W5E03370
                    TT360 LD      TT916     GET DSW2                    W5E03380
                          B       TT310     GO TEST FOR TMT             W5E03390
                    *                                                   W5E03400
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5E03410
                    *          RCV ERROR HANDLING                     * W5E03420
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5E03430
                    *                                                   W5E03440
                    TT370 LD      TT912     FETCH VRC ERROR CODE        W5E03450
                          B       *+1                                   W5E03460
                    TT380 LD      TT909     FETCH OVERRUN ERR CODE      W5E03470
                          XCH               SAVE                        W5E03480
                          LD    2 TXPTR     GENERATE LINE               W5E03490
                          AND     TT914     *NUMBER                     W5E03500
                          A       TT905     PUT INTO                    W5E03510
                          XCH               *EXTENSION                  W5E03520
                          BSI  I2 ERROR     GO TELL USER                W5E03530
                    *                                                   W5E03540
                          B       TT340     CONTINUE SERVICE            W5E03550
                    *                                                   W5E03560
                          END                                           W5E03570
