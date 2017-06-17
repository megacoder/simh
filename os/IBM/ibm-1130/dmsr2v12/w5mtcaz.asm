                          HDNG    MTCAZ - MTCA FORTRAN BUFFER           W5C00010
                    *************************************************** W5C00020
                    *STATUS - VERSION 2, MODIFICATION 9               * W5C00030
                    *                                                 * W5C00040
                    *SUBROUTINE NAME -                                * W5C00050
                    *   FULL NAME - MTCA FORTRAN BUFFERRING ROUTINE   * W5C00060
                    *   CODE NAME - MTCAZ                             * W5C00070
                    *                                                 * W5C00080
                    *PURPOSE -                                        * W5C00090
                    *   THIS SUBROUTINE ACTS AS A BUFFER BETWEEN THE  * W5C00100
                    *   FORTRAN LANGUAGE USER AND THE ASSEMBLER       * W5C00110
                    *   LANGUAGE ORIENTED MTCA BASE SECTION (MTCA0).  * W5C00120
                    *                                                 * W5C00130
                    *METHOD -                                         * W5C00140
                    *   THE ROUTINE CONSISTS OF TWO BASIC SECTIONS    * W5C00150
                    *      * THE CALL SECTION PROCESSES THE           * W5C00160
                    *        PARAMETERS AND RE-ASSEMBLES THEM IN THE  * W5C00170
                    *        FORM OF A LIBF INSTRUCTION CAUSING A     * W5C00180
                    *        BRANCH TO THE MTCA BASE SECTION (MTCA0). * W5C00190
                    *        WHERE APPROPRIATE AN ERROR RETURN        * W5C00200
                    *        ADDRESS IS SUPPLIED.                     * W5C00210
                    *                                                 * W5C00220
                    *CAPABILITIES AND LIMITATIONS - N/A               * W5C00230
                    *                                                 * W5C00240
                    *SPECIAL FEATURES -                               * W5C00250
                    *   CONTROL IS RETURNED FOLLOWING INITIATION OF   * W5C00260
                    *   THE REQUESTED OPERATION.                      * W5C00270
                    *                                                 * W5C00280
                    *ADDITIONAL INFORMATION -                         * W5C00290
                    *   ERROR PROCEDURES -                            * W5C00300
                    *      ERRORS OCCURRING DURING THE EXECUTION OF A * W5C00310
                    *      COMMAND ARE PROCESSED AND DEALT WITH IN    * W5C00320
                    *      ONE OF TWO WAYS -                          * W5C00330
                    *         * RECOVERABLE ERRORS, E.G. LINE ERRORS  * W5C00340
                    *           CAUSE A LINE ERROR FLAG TO BE SET     * W5C00350
                    *           APPROPRIATELY.                        * W5C00360
                    *         * NON-RECOVERABLE ERRORS CAUSE THE      * W5C00370
                    *           PROGRAM TO LOOP IN $PRET DISPLAYING   * W5C00380
                    *           AN APPROPRIATE ERROR CODE IN THE ACC. * W5C00390
                    *   CALLING SEQUENCE -                            * W5C00400
                    *      CALL MTCAZ(A,B,C)  WHERE                   * W5C00410
                    *         * A IS THE COMMAND (0 TO 8)             * W5C00420
                    *            0 - TEST                             * W5C00430
                    *            1 - READ                             * W5C00440
                    *            2 - WRITE                            * W5C00450
                    *            3 - CONNECT                          * W5C00460
                    *            4 - DISCONNECT                       * W5C00470
                    *            5 - PASS AND RESET LINE STATISTICS   * W5C00480
                    *            6 - DIAGNOSE                         * W5C00490
                    *            7 - INITIALIZE                       * W5C00500
                    *            8 - DISABLE MTCA                     * W5C00510
                    *         * B IS THE LINE NUMBER (1 TO 16)        * W5C00520
                    *         * C IS AN INTEGER VARIABLE DEPENDENT ON * W5C00530
                    *           THE COMMAND                           * W5C00540
                    *                                                 * W5C00550
                    *************************************************** W5C00560
                    *                                                   W5C00570
                    *                                                   W5C00580
                    *************************************************** W5C00590
                    *                                                 * W5C00600
                    *     ENTRY AND HOUSEKEEPING                      * W5C00610
                    *                                                 * W5C00620
                    *************************************************** W5C00630
                    *                                                   W5C00640
                          ENT     MTCAZ                                 W5C00650
                    *                                                   W5C00660
                    $PRET EQU     40                                    W5C00670
                    *                                                   W5C00680
                    MTCAZ DC      *-*       ENTRY POINT                 W5C00690
                          STD     FB902     SAVE ACC AND EXT            W5C00700
                          STS     FB160     SAVE STATUS                 W5C00710
                          STX   1 FB170+1   SAVE XR1                    W5C00720
                          STX   2 FB180+1   SAVE XR2                    W5C00730
                          LDX  I1 MTCAZ     SET XR1 AS PARAM PT         W5C00740
                    *                                                   W5C00750
                    *                                                   W5C00760
                    *************************************************** W5C00770
                    *                                                 * W5C00780
                    *     TRANSFER PARAMETERS FROM CALL TO            * W5C00790
                    *                   SUBROUTINE                    * W5C00800
                    *                                                 * W5C00810
                    *************************************************** W5C00820
                    *                                                   W5C00830
                          LD   I1 0         GET FIRST PARAMETER         W5C00840
                          STO     FB901     *(COMMAND)                  W5C00850
                          BN      FB330     BR IF COMMAND NEG           W5C00860
                          S       FB911                                 W5C00870
                          BP      FB330     BR IF INVALID               W5C00880
                          LD   I1 1         GET SECOND PARAMETER        W5C00890
                          STO     FB900     *(LINE NUMBER)              W5C00900
                          LD    1 2         GET THIRD PARAMETER         W5C00910
                          STO     FB903     *(AREA OR FLAG)             W5C00920
                    *                                                   W5C00930
                    FB900 EQU     *+1       SAVE LOCN FOR LINE NO.      W5C00940
                    *                                                   W5C00950
                          LDX  L2 *-*       SET XR2 AS LINE PT          W5C00960
                    *                                                   W5C00970
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5C00980
                    * SELECT ROUTINE ACCORDING TO COMMAND             * W5C00990
                    * * * * * * * * * * * * * * * * * * * * * * * * * * W5C01000
                    *                                                   W5C01010
                    FB901 EQU     *+1       SAVE LOCN FOR COMMAND       W5C01020
                    *                                                   W5C01030
                          LDX  L1 *-*       SET XR1 AS TABLE PT         W5C01040
                          B    I1 FB912     BR TO REQUIRED ROUTINE      W5C01050
                    *                                                   W5C01060
                    *                                                   W5C01070
                    *************************************************** W5C01080
                    *                                                 * W5C01090
                    *     TEST ROUTINE                                * W5C01100
                    *                                                 * W5C01110
                    *************************************************** W5C01120
                    *                                                   W5C01130
                    FB010 LD      FB900     FETCH LINE NUMBER           W5C01140
                          STO     FB020     SET UP CONTROL PARAM        W5C01150
                    *                       *IN LIBF                    W5C01160
                          LIBF    MTCA0     INITIATE LIBF TO            W5C01170
                    FB020 DC      *-*       *PERFORM TEST               W5C01180
                    *                                                   W5C01190
                          B       FB030     BR IF LINE BUSY             W5C01200
                          LD   L2 FB929     FETCH ERROR CODE            W5C01210
                          AND     FB910     EDIT ERROR CODE             W5C01220
                          STO  I  FB903     SET TEST FLAG IF ERR        W5C01230
                          SLA     16                                    W5C01240
                          STO  L2 FB929     RESET LINE FLAG             W5C01250
                          B       FB160     BR TO EXIT                  W5C01260
                    *                                                   W5C01270
                    FB030 LD      FB904                                 W5C01280
                          STO  I  FB903     SET TEST FLAG               W5C01290
                          B       FB160     BR TO EXIT                  W5C01300
                    *                                                   W5C01310
                    *                                                   W5C01320
                    *************************************************** W5C01330
                    *                                                 * W5C01340
                    *     READ ROUTINE                                * W5C01350
                    *                                                 * W5C01360
                    *************************************************** W5C01370
                    *                                                   W5C01380
                    FB040 LD      FB903     FETCH AREA ADDRESS          W5C01390
                          STO     FB140     SET UP LIBF AREA PARAM      W5C01400
                          LD      FB923     FETCH ERROR ADDRESS         W5C01410
                          B       FB120     BR TO ST ERR PARAM          W5C01420
                    *                                                   W5C01430
                    *                                                   W5C01440
                    *************************************************** W5C01450
                    *                                                 * W5C01460
                    *     WRITE ROUTINE                               * W5C01470
                    *                                                 * W5C01480
                    *************************************************** W5C01490
                    *                                                   W5C01500
                    FB050 LD      FB903     FETCH POINTER TO AREA       W5C01510
                          STO     FB140     SET UP LIBF AREA PARAM      W5C01520
                          LD      FB924     FETCH ERROR ADDRESS         W5C01530
                          B       FB120     BR TO SET UP ERR PARAM      W5C01540
                    *                                                   W5C01550
                    *                                                   W5C01560
                    *************************************************** W5C01570
                    *                                                 * W5C01580
                    *     CONNECT OR DISCONNECT ROUTINE               * W5C01590
                    *                                                 * W5C01600
                    *************************************************** W5C01610
                    *                                                   W5C01620
                    FB060 LD   I  FB903     GET CONTROL PARAMETER       W5C01630
                          SLA     15        SET BIT 0 TO CONTROL        W5C01640
                          STO  L2 FB929     SAVE IN LINE FLAG           W5C01650
                          LD      FB925     FETCH ERROR ADDRESS         W5C01660
                    *                                                   W5C01670
                    FB070 STO     FB140     SET UP PARAMETER            W5C01680
                          LD      FB913     FETCH NOP                   W5C01690
                          B       FB120     BR TO STORE NOP             W5C01700
                    *                                                   W5C01710
                    *                                                   W5C01720
                    *************************************************** W5C01730
                    *                                                 * W5C01740
                    *     PASS LINE STATISTICS ROUTINE                * W5C01750
                    *                                                 * W5C01760
                    *************************************************** W5C01770
                    *                                                   W5C01780
                    FB080 LD      FB903     FETCH AREA ADDRESS          W5C01790
                          B       FB070     BR TO ST AREA PARAM         W5C01800
                    *                                                   W5C01810
                    *                                                   W5C01820
                    *************************************************** W5C01830
                    *                                                 * W5C01840
                    *     DIAGNOSE ROUTINE                            * W5C01850
                    *                                                 * W5C01860
                    *************************************************** W5C01870
                    *                                                   W5C01880
                    FB090 LD      FB924     FETCH ERROR RTN ADDR        W5C01890
                          B       FB070     BR TO ST ERR PARAM          W5C01900
                    *                                                   W5C01910
                    *                                                   W5C01920
                    *************************************************** W5C01930
                    *                                                 * W5C01940
                    *     INITIALIZE ROUTINE                          * W5C01950
                    *                                                 * W5C01960
                    *************************************************** W5C01970
                    *                                                   W5C01980
                    FB100 LIBF    MTCA0     INITIALIZE                  W5C01990
                          DC      /7000     *COMMAND                    W5C02000
                    *                                                   W5C02010
                          B       FB160     BR TO EXIT                  W5C02020
                    *                                                   W5C02030
                    *                                                   W5C02040
                    *************************************************** W5C02050
                    *                                                 * W5C02060
                    *     STOP ROUTINE                                * W5C02070
                    *                                                 * W5C02080
                    *************************************************** W5C02090
                    *                                                   W5C02100
                    FB110 LIBF    MTCA0     STOP                        W5C02110
                          DC      /8000     *COMMAND                    W5C02120
                    *                                                   W5C02130
                          B       FB160     BR TO EXIT                  W5C02140
                    *                                                   W5C02150
                    *                                                   W5C02160
                    *************************************************** W5C02170
                    *                                                 * W5C02180
                    *     RESTORE AND RETURN ROUTINE                  * W5C02190
                    *                                                 * W5C02200
                    *************************************************** W5C02210
                    *                                                   W5C02220
                    FB120 STO     FB150     ST LIBF PARAMETER           W5C02230
                          LD      FB900     FETCH LINE NUMBER           W5C02240
                          A    L1 FB913-1   SET UP APPROP. COMMAND      W5C02250
                          STO     FB130     SET UP LIBF COMMAND         W5C02260
                    *                                                   W5C02270
                          LIBF    MTCA0     *                           W5C02280
                    FB130 DC      *-*       *   INITIATE                W5C02290
                    FB140 DC      *-*       *     LIBF                  W5C02300
                    FB150 DC      *-*       *                           W5C02310
                    *                                                   W5C02320
                    FB160 LDS     0         RESTORE STATUS              W5C02330
                    FB170 LDX  L1 *-*       RESTORE XR1                 W5C02340
                    FB180 LDX  L2 *-*       RESTORE XR2                 W5C02350
                          LDD     FB902     RESTORE ACC AND EXT         W5C02360
                          MDM     MTCAZ,3   SET PROGRAM RETURN ADDR     W5C02370
                          B    I  MTCAZ     RETURN TO CALLER            W5C02380
                    *                                                   W5C02390
                    *                                                   W5C02400
                    *************************************************** W5C02410
                    *                                                 * W5C02420
                    *     CONSTANTS AND DATA AREAS                    * W5C02430
                    *                                                 * W5C02440
                    *************************************************** W5C02450
                    *                                                   W5C02460
                    FB902 BSS  E  2         CONTENTS OF ACC & EXT       W5C02470
                    FB903 DC      *-*       AREA OR FLAG PARAMETER      W5C02480
                    FB904 DC      1         CONSTANT 1                  W5C02490
                    FB905 DC      2         CONSTANT 2                  W5C02500
                    FB906 DC      3         CONSTANT 3                  W5C02510
                    FB907 DC      4         CONSTANT 4                  W5C02520
                    FB910 DC      7         CONSTANT 7                  W5C02530
                    FB911 DC      8         CONSTANT 8                  W5C02540
                    *                                                   W5C02550
                    FB912 DC      FB010     TEST ROUTINE ADDR           W5C02560
                          DC      FB040     READ ROUTINE ADDR           W5C02570
                          DC      FB050     WRITE ROUTINE ADDR          W5C02580
                          DC      FB060     CONNECT ROUTINE ADDR        W5C02590
                          DC      FB060     DISCONNECT ROUTINE ADDR     W5C02600
                          DC      FB080     PASS STAT ROUTINE ADDR      W5C02610
                          DC      FB090     DIAGNOSE ROUTINE ADDR       W5C02620
                          DC      FB100     INITIALIZE ROUTINE ADDR     W5C02630
                          DC      FB110     STOP ROUTINE ADDR           W5C02640
                    *                                                   W5C02650
                    FB913 DC      /1000     READ COMMAND                W5C02660
                          DC      /2000     WRITE COMMAND               W5C02670
                          DC      /3000     CONNECT COMMAND             W5C02680
                          DC      /4000     DISCONNECT COMMAND          W5C02690
                          DC      /5000     PASS STATISTICS COMMAND     W5C02700
                          DC      /6000     DIAGNOSE COMMAND            W5C02710
                    *                                                   W5C02720
                    FB915 DC      /FF0B     INVALID COUNT ERROR         W5C02730
                    FB917 DC      /E009     OVERRUN ERROR               W5C02740
                    FB918 DC      /E00F     LINK NOT ACTIVE ERROR       W5C02750
                    FB919 DC      /E022     INTERRUPT  (ATTENTION)      W5C02760
                    FB920 DC      /0029     TIMEOUT ERROR MASK          W5C02770
                    FB921 DC      /002A     WRITE, LINK NOT ACTIVE      W5C02780
                    FB922 DC      /002F     LOST DATA ERROR MASK        W5C02790
                    *                                                   W5C02800
                    FB923 DC      FB190     READ ERR RTN ADDR           W5C02810
                    FB924 DC      FB260     WRITE/DIAGNOSE ERR RTN      W5C02820
                    FB925 DC      FB300     CONNECT ERR RTN ADDR        W5C02830
                    FB927 DC      *-*       SAVE LOCN FOR ERR CODE      W5C02840
                    *                                                   W5C02850
                    FB928 DC      *-*       ERROR RETURN CODE           W5C02860
                    *                       0 - ENDS THE OPERATION      W5C02870
                    *                           IN PROGRESS.            W5C02880
                    *                       1 - REQUESTS THE OP         W5C02890
                    *                           BE CONTINUED.           W5C02900
                    *                                                   W5C02910
                    *************************************************** W5C02920
                    *     LINE ERROR FLAGS                            * W5C02930
                    *************************************************** W5C02940
                    *                                                 * W5C02950
                    * FOR READ, WRITE AND DIAGNOSE COMMANDS -         * W5C02960
                    *    0 - NO ERROR                                 * W5C02970
                    *    2 - BAD DATA ERROR                           * W5C02980
                    *    3 - TIMEOUT ERROR                            * W5C02990
                    *    4 - ATTENTION FEATURE (2741)                 * W5C03000
                    *    5 - TMT ATTEMPTED WITH LINK NOT ACTIVE       * W5C03010
                    *    6 - TMT ATTEMPTED WHILE IN RCV MODE          * W5C03020
                    *    7 - ADAPTER FAILED                           * W5C03030
                    *                                                 * W5C03040
                    * FOR CONNECT,  BIT 0 IS USED -                   * W5C03050
                    *    0 - IGNORE LINK NOT ACTIVE ERROR             * W5C03060
                    *    1 - RESTORE CONNECT TIMEOUT                  * W5C03070
                    *                                                 * W5C03080
                    *************************************************** W5C03090
                    FB929 DC      FB929     ADDR OF LINE ERR FLAGS      W5C03100
                          DC      *-*       LINE  1 ERROR FLAG          W5C03110
                          DC      *-*       LINE  2 ERROR FLAG          W5C03120
                          DC      *-*       LINE  3 ERROR FLAG          W5C03130
                          DC      *-*       LINE  4 ERROR FLAG          W5C03140
                          DC      *-*       LINE  5 ERROR FLAG          W5C03150
                          DC      *-*       LINE  6 ERROR FLAG          W5C03160
                          DC      *-*       LINE  7 ERROR FLAG          W5C03170
                          DC      *-*       LINE  8 ERROR FLAG          W5C03180
                          DC      *-*       LINE  9 ERROR FLAG          W5C03190
                          DC      *-*       LINE 10 ERROR FLAG          W5C03200
                          DC      *-*       LINE 11 ERROR FLAG          W5C03210
                          DC      *-*       LINE 12 ERROR FLAG          W5C03220
                          DC      *-*       LINE 13 ERROR FLAG          W5C03230
                          DC      *-*       LINE 14 ERROR FLAG          W5C03240
                          DC      *-*       LINE 15 ERROR FLAG          W5C03250
                          DC      *-*       LINE 16 ERROR FLAG          W5C03260
                    *                                                   W5C03270
                    *                                                   W5C03280
                    *************************************************** W5C03290
                    *                                                 * W5C03300
                    *     READ ERROR ROUTINE                          * W5C03310
                    *                                                 * W5C03320
                    *************************************************** W5C03330
                    *                                                   W5C03340
                    FB190 DC      *-*       ENTRY POINT                 W5C03350
                          EOR     FB917                                 W5C03360
                          SKP     Z         SKIP IF OVERRUN             W5C03370
                          EOR     FB910                                 W5C03380
                          BZ      FB210     BR IF PARITY ERROR          W5C03390
                          EOR     FB922                                 W5C03400
                          BZ      FB200     BR IF LOST DATA             W5C03410
                          EOR     FB920                                 W5C03420
                          BZ      FB250     BR IF TIMEOUT               W5C03430
                    *                                                   W5C03440
                          B       FB240     BR TO RETURN                W5C03450
                    *                                                   W5C03460
                    FB200 LD      FB904     SET ERROR RETURN CODE       W5C03470
                    *                                                   W5C03480
                    FB210 STO     FB928                                 W5C03490
                          LD      FB905     FETCH ERROR CODE  2         W5C03500
                    *                                                   W5C03510
                    FB220 XCH               FETCH LINE NUMBER           W5C03520
                          A       FB929     SET UP POINTER TO LINE      W5C03530
                          STO     FB230+1   *ERROR FLAG                 W5C03540
                          XCH               RESTORE ERROR CODE          W5C03550
                    FB230 STO  L  *-*       SET LINE ERROR FLAG         W5C03560
                    FB240 LD      FB928     FETCH ERROR RETURN CODE     W5C03570
                          B    I  FB190     RETURN TO RESP HANDLER      W5C03580
                    *                                                   W5C03590
                    FB250 STO     FB928     CLEAR ERROR RETURN CODE     W5C03600
                          LD      FB906     FETCH ERROR CODE  3         W5C03610
                          B       FB220     BR TO CONTINUE              W5C03620
                    *                                                   W5C03630
                    *                                                   W5C03640
                    *************************************************** W5C03650
                    *                                                 * W5C03660
                    *     WRITE/DIAGNOSE ERROR ROUTINE                * W5C03670
                    *                                                 * W5C03680
                    *************************************************** W5C03690
                    *                                                   W5C03700
                    FB260 DC      *-*       ENTRY POINT                 W5C03710
                          STO     FB927     SAVE ERROR CODE             W5C03720
                          LD      FB260     GET RETURN ADDRESS          W5C03730
                    FB270 STO     FB190     ST IN EXIT ADDRESS          W5C03740
                          SLA     16                                    W5C03750
                          STO     FB928     CLEAR RETURN CODE           W5C03760
                          LD      FB927     RESTORE ERROR CODE          W5C03770
                          EOR     FB919                                 W5C03780
                          BZ      FB280+1   BR IF ATTENTION             W5C03790
                          EOR     FB905                                 W5C03800
                          BZ      FB280-1   BR IF IN RCV MODE           W5C03810
                          EOR     FB921                                 W5C03820
                          BZ      FB280     BR IF LINK NOT ACTIVE       W5C03830
                          EOR     FB904                                 W5C03840
                          BZ      FB340-1   BR IF INVALID COUNT         W5C03850
                    *                                                   W5C03860
                          LD      FB904     GENERATE       7            W5C03870
                          A       FB904     *APPROPRIATE   6            W5C03880
                    FB280 A       FB904     *ERROR         5            W5C03890
                          A       FB907     *CODE          4            W5C03900
                          B       FB220     BR TO CONTINUE              W5C03910
                    *                                                   W5C03920
                    *                                                   W5C03930
                    *                                                   W5C03940
                    *************************************************** W5C03950
                    *                                                 * W5C03960
                    *     CONNECT OR DISCONNECT ERROR ROUTINE         * W5C03970
                    *                                                 * W5C03980
                    *************************************************** W5C03990
                    *                                                   W5C04000
                    FB300 DC      *-*       ENTRY POINT                 W5C04010
                          STO     FB927     SAVE ERROR CODE             W5C04020
                          EOR     FB918     LINK NOT ACTIVE ERROR       W5C04030
                          BNZ     FB310     *NO, BR TO CONTINUE         W5C04040
                          XCH               FETCH LINE NUMBER           W5C04050
                          A       FB929     GET ADDR OF LINE FLAG       W5C04060
                          STO     *+1                                   W5C04070
                          LD   L  *-*       GET CONTENTS OF FLAG        W5C04080
                          B    I  FB300     RETURN TO RESP HANDLER      W5C04090
                    *                                                   W5C04100
                    FB310 LD      FB300     GET RETURN ADDRESS          W5C04110
                          B       FB270     GO SET UP RETURN            W5C04120
                    *                                                   W5C04130
                    *                                                   W5C04140
                    *************************************************** W5C04150
                    *                                                 * W5C04160
                    *     INVALID COMMAND ERROR ROUTINE               * W5C04170
                    *                                                 * W5C04180
                    *************************************************** W5C04190
                    *                                                   W5C04200
                    FB330 LD   I1 1         FETCH LINE NUMBER           W5C04210
                          SRT     16        STORE IN EXTENSION          W5C04220
                          LD      FB911     SET ERROR CODE IN ACC       W5C04230
                          EOR     FB904     *                           W5C04240
                    *                                                   W5C04250
                    *                                                   W5C04260
                    *************************************************** W5C04270
                    *                                                 * W5C04280
                    *     PREOPERATIVE ERROR TRAP                     * W5C04290
                    *                                                 * W5C04300
                    *************************************************** W5C04310
                    *                                                   W5C04320
                          EOR     FB915     MASK ERROR CODE             W5C04330
                    FB340 BSI  L  $PRET     BR TO PREOP ERROR TRAP      W5C04340
                          B       FB340     LOOP ON $PRET               W5C04350
                    *                                                   W5C04360
                    *                                                   W5C04370
                          END                                           W5C04380
