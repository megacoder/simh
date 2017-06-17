                    *************************************************** U2N00010
                    *                                                 * U2N00020
                    *TITLE- TYPE0                                     * U2N00030
                    *                                                 * U2N00040
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * U2N00050
                    *                                                 * U2N00060
                    *FUNCTION/OPERATION-                              * U2N00070
                    *    THIS 1130/18OO SUBROUTINE OPERATES THE PRIME * U2N00080
                    *    KEYBOARD/PRINTER (1816/1053). IT INITIATES   * U2N00090
                    *    REQUESTED OPERATIONS AND PROCESSES ANY       * U2N00100
                    *    KEYBOARD, PRINTER, OR OPERATOR REQUEST       * U2N00110
                    *    INTERRUPTS. IT IGNORES ANY KEYBOARD/PRINTER  * U2N00120
                    *    ERRORS.                                      * U2N00130
                    *                                                 * U2N00140
                    *ENTRY POINTS-                                    * U2N00150
                    *   * TYPE0-CALL ENTRANCE FOR READ, WRITE, OR     * U2N00160
                    *           TEST OPERATIONS.                      * U2N00170
                    *                                                 * U2N00180
                    *   * INT1- ENTRY POINT FOR KEYBOARD, CONSOLE     * U2N00190
                    *           PRINTER, OR INTERRUPT REQUEST         * U2N00200
                    *          PKEY INTERRUPTS                        * U2N00210
                    *                                                 * U2N00220
                    *INPUT- FROM KEYBOARD OR LIBF PARAMETERS          * U2N00230
                    *                                                 * U2N00240
                    *OUTPUT- PRINTED                                  * U2N00250
                    *                                                 * U2N00260
                    *EXTERNAL SUBROUTINES-                            * U2N00270
                    *   * HOLL                                        * U2N00280
                    *   *PRTY                                         * U2N00290
                    *                                                 * U2N00300
                    *EXITS-                                           * U2N00310
                    *   NORMAL-                                       * U2N00320
                    *      * CALL PORTION-EXIT BACK TO USER PROGRAM.  * U2N00330
                    *      * INTERRUPT PORTION-BACK TO ILS04          * U2N00340
                    *   * ERROR-                                      * U2N00350
                    *      * CALL PORTION-TO $PRET                    * U2N00360
                    *      * INTERRUPT PORTION-TO $PST4               * U2N00370
                    *                                                 * U2N00380
                    *TABLES/WORK AREAS- LIBF TO HOLL TABLE SUBROUTINE * U2N00390
                    *                                                 * U2N00400
                    *ATTRIBUTES- REUSABLE                             * U2N00410
                    *                                                 * U2N00420
                    *NOTES-                                           * U2N00430
                    *                                                 * U2N00440
                    *************************************************** U2N00450
                    ***   HDNG    LIBF TYPE0-V1.                        U2N00460
                          LIBR                                          U2N00470
                          ISS  02 TYPE0     4                           U2N00480
                    $PRET EQU     40        ADDR OF PREOPERATIVE TRAP   U2N00490
                    $IREQ EQU     /002C                                 U2N00500
                    $I420 EQU     /00E6     INTREQ ADDR IN RESMON  2-11 U2N00505
                    $IOCT EQU     50        IOCS COUNTER                U2N00510
                    TYPE0 STX   1 SAV1+1    LIBF  ENTRANCE         (+0) U2N00520
                    LINK  LDX  I1 0         CLB     STORES TV ADDR (+2) U2N00530
                          MDX     TY10      BR TO PROCESS THE CALL      U2N00540
                    INT1  DC      0         INTERRUPT  ENTRANCE    (+4) U2N00550
                          BSC  L  TY60      BR TO PROCESS INTERRUPT     U2N00560
                          EJCT                                          U2N00565
                    *************************************************** U2N00570
                    *             LIBF PROCESSING                     * U2N00580
                    *************************************************** U2N00590
                    *    THIS PORTION STORES CALLING SEQUENCE INFO    * U2N00600
                    *    AND CHECKS THE DEVICE STATUS BEFORE ANY I/O  * U2N00610
                    *    OPERATION IS INITIATED.  A CALLING ERROR     * U2N00620
                    *    CAUSES AN ERROR EXIT TO LOC 41.  NOT READY   * U2N00630
                    *    1053 CAUSES ERROR EXIT TO LOC /8D.  OTHERWISE* U2N00640
                    *    THE ROUTINE IS SET BUSY AND IOCS CTR INCREMEN* U2N00650
                    *    TED TO INDICATE INTERRUPT(S) PENDING.        * U2N00660
                    *************************************************** U2N00670
                    *                                                   U2N00720
                    *                                                   U2N00730
                    TY10  STX   2 SAV2+1    SAVE XR2                    U2N00740
                          STS     SAVST     SAVE STATUS                 U2N00750
                          STD     SAVAQ     SAVE ACC AND EXT            U2N00760
                          LD    1 0         GET THE CONTROL PARAM   212 U2N00770
                          SRA     12        IS  FUNCTION TEST           U2N00780
                          BSC  L  TY14,Z    *  NO                       U2N00790
                          LD      BUSY      *  YES, IS SUBR BUSY        U2N00800
                          BSC     +-        IF                          U2N00810
                    TY11  MDX   1 +1        *    NO, EXIT TO CALL+3     U2N00820
                          LDD     SAVAQ                                 U2N00830
                    TY12  MDX   1 +1        IF YES,   EXIT TO CALL+2    U2N00840
                          STX   1 EXIT+1    SET UP EXIT                 U2N00850
                    SAV1  LDX  L1 *-*       RESTORE XR1                 U2N00860
                    SAV2  LDX  L2 *-*       RESTORE XR2                 U2N00870
                    SAVST LDS     *-*       RESTORE STATUS              U2N00880
                    EXIT  BSC  L  *-*       EXIT                        U2N00890
                    TY14  LD      BUSY      IS SUBROUTINE BUSY          U2N00900
                          BSC  L  TY14,Z    *  YES, WAIT                U2N00910
                          LD    1 0                                2-11 U2N00927
                          SRA     12                                    U2N00930
                          S       D2        IS FUNCTION LEGAL       2-4 U2N00940
                          BSC  L  TY30,Z-   *  NO, ERROR                U2N00950
                    TY20  A       H7001     *YES, SET UP JUMP TABLE     U2N00960
                          STO     TY24                                  U2N00970
                    TY22  XIO     SENSE-1   IS THE DEVICE READY         U2N00980
                          SLA     5                                     U2N00990
                          BSC  L  TY32,Z+   NO,LOOP UNTIL READY         U2N01000
                          SRA     16        READY, CLEAR STORAGE AREAS, U2N01010
                          STO     RSTRT     * RESTART INDR              U2N01020
                          STO     BACK      * BACKSPACE INDR            U2N01030
                          STO     SLASH     * SLASH INDR                U2N01040
                          STO     RIGHT     * SET INDR FOR RIGHT CHAR   U2N01050
                          LD    1 1         GET DATA ADDR               U2N01060
                          A       D1        AVOID STORED WD CNT     2-4 U2N01070
                          STO     READ      SAVE I/O AREA ADDR          U2N01080
                          STO     RSTRT+1                               U2N01090
                          LD   I1 1         SAVE    WORD COUNT          U2N01100
                          BSC  L  TY30,+    ERROR IF ZERO OR NEGATIVE   U2N01110
                    TY24  MDX     TY24+1    INITIATE  FUNCTION          U2N01120
                          MDX     TY40      *          = GET            U2N01130
                          MDX     TY56      *          = PUT            U2N01140
                    TY30  LD      H2001     ERROR  HANDLING             U2N01150
                          MDX     TY34      *  = ILLEGAL CALL           U2N01160
                    TY32  BSC  L  TY22,C    *  = NOT READY & BUSY       U2N01170
                    TY33  LD      H2000     * = NOT READY & NOT BUSY    U2N01180
                    TY34  MDX   1 -1                                    U2N01190
                          STX  L1 $PRET     STORE LIBF ADDR             U2N01200
                          LDX   1 $PRET                                 U2N01210
                          MDX     TY12                                  U2N01220
                    BUSY  DC      0         SUBR BUSY INDR              U2N01230
                    BUSY1 DC      0         $IREQ SAVED HERE DURING 212 U2N01236
                    *             FIRST NON-TEST OP                 212 U2N01237
                    SAVAQ BSS  E  2         SAVE ACC AND EXT            U2N01240
                    H2000 DC      /2000     DEVICE NOT READY CODE       U2N01245
                    SENSE DC      /0F00     IOCC TO SENSE DSW           U2N01250
                    H2001 DC      /2001     ILLEGAL CALL ERROR          U2N01255
                    SENS1 DC      /0F01     SENSE DSW IOCC (RESET)      U2N01270
                    *************************************************** U2N01280
                    *             TYPE0 FUNCTION INITIATION             U2N01290
                    *************************************************** U2N01300
                    TY40  STO     COUNT     READ  FUNCTION INITIATION   U2N01310
                          STO     RSTRT+2   SAVE WD CNT FOR RESTART     U2N01320
                          XIO     SENSE-1                               U2N01330
                          SLA     6         IS    KEYBOARD READY        U2N01340
                          BSC  L  TY33,Z+   *    NO, ERROR              U2N01350
                          BSC  L  SBRTB     SET UP CONVERSION TBL ADDR  U2N01360
                    TY42  STO     BUSY      SET SUBROUTINE BUSY         U2N01370
                          MDM     BUSY1,0   $IREQ SAVED?            212 U2N01371
                          B       TY43      YES, SKIP SAVING        212 U2N01372
                          STX     BUSY1     SET SAVED INDR          212 U2N01373
                          LD   L  $IREQ     SAVE INT REQ ADDR       212 U2N01374
                          STO  L  TY97      *TEMPORARILY            212 U2N01375
                    TY43  LDX  L2 IRRTN     LOAD TYPE0 INT REQ RTN  212 U2N01376
                          STX  L2 $IREQ     *ADDR AND STORE IN SYS  212 U2N01377
                          MDX  L  $IOCT,+1  INCR IOCS CTR               U2N01380
                          NOP               AVOID SKIP PROBLEM          U2N01390
                    TY44  XIO     INIT-1    RELEASE    KEYBOARD         U2N01400
                          MDX     TY11      GO TO EXIT                  U2N01410
                    TY56  SLA     1         PUT  FUNCTION INITIATION    U2N01420
                          STO     COUNT     SAVE    WORD COUNT *2       U2N01430
                          STO     BUSY      SET SUBROUTINE BUSY         U2N01440
                          MDX  L  $IOCT,+1  INCR IOCS CTR               U2N01450
                          NOP               AVOID SKIP PROBLEM          U2N01460
                          LD   I  READ      GET 1ST O/P CHAR            U2N01470
                          STO     TEMP1     STORE THECHAR IN TEMP AREA  U2N01480
                          XIO     PRINT     PRINT ONE  CHARACTER        U2N01490
                          MDX     TY11      GO TO EXIT                  U2N01500
                          EJCT                                          U2N01505
                    *************************************************** U2N01510
                    *             GENERAL INTERRUPT PROCESSING        * U2N01520
                    *************************************************** U2N01530
                    *    THIS PORTION IS ENTERED FROM AN INTERRUPT    * U2N01540
                    *    LEVEL SUBROUTINE (04 IN 1130). IT DETERMINES * U2N01550
                    *    THE CAUSE OF THE INTERRUPT. IF THE REQUESTED * U2N01560
                    *    NUMBER OF CHARACTERS HAS BEEN READ AND/OR    * U2N01570
                    *    PRINTED, THE ROUTINE IS SET NOT BUSY AND THE * U2N01580
                    *    IOCS COUNTER DECREMENTED TO INDICATE INTERR  * U2N01590
                    *    PROCESSING COMPLETED. IF AN OPERATOR REQUEST * U2N01600
                    *    INTERRUPT IS DETECTED, THE SUBROUTINE EXITS, * U2N01610
                    *    VIA THE ADDRESS IN LOCN $IREQ , TO THE USER  * U2N01620
                    *    BEFORE RETURNING CONTROL TO  THE INTERRUPT   * U2N01630
                    *    LEVEL SUBROUTINE.                            * U2N01640
                    *************************************************** U2N01650
                    TY60  XIO     SENS1-1   WHAT  CAUSED INTERRUPT      U2N01660
                          STO     DSWRD                                 U2N01670
                          SLA     1                                     U2N01680
                          BSC  L  TY86,Z+   KEYBOARD SERVICE REQUEST    U2N01690
                          BSC     C                                     U2N01700
                    * LOOK UP-ASM CODE FOR NEXT INSTR MUST BE /7001 2-4 U2N01701
                    H7001 MDX     TY62      PRINTER SERVICE REQST   2-4 U2N01710
                          MDX     TY70      IF NOT THESE,CONT CHK       U2N01720
                    TY62  LD      RSTRT     WAS      RE-ENTRY LAST READ U2N01730
                          BSC  L  XT14,Z    *      YES                  U2N01740
                          LD      BACK      WAS    BACKSPACE  LAST READ U2N01750
                          BSC  L  XT10,Z    *      YES                  U2N01760
                          LD      TY24      IS THEFUNCTION = PUT        U2N01770
                          BSC     E         *    NO                     U2N01780
                          MDX     TY80      *    YES                    U2N01790
                          MDX  L  COUNT,0   ANY   MORE CHARS TO PRINT   U2N01800
                          MDX     TY70      *      YES                  U2N01810
                    TY68  SRA     16        CLEAR SUBROUTINE BUSY INDR  U2N01820
                          STO     BUSY                                  U2N01830
                          MDX  L  $IOCT,-1       DECREMENT IOCS COUNTER U2N01840
                          NOP                                           U2N01850
                    TY70  BSC  I  INT1      RETURN TO ILS 04            U2N01860
                    *                                                   U2N01900
                    *CONSTANTS AND BUFFER AREA                          U2N01910
                    *                                                   U2N01920
                    TEMP1 BSS  E  1         TEMPORARY  STORAGE          U2N01930
                    INIT  DC      /0C00     IOCC  TO READY KEYBOARD   O U2N01940
                    PRINT DC      TEMP1     IOCC  TO PRINT 1 CHAR     E U2N01950
                          DC      /0900                                 U2N01960
                    READ  DC      0         IOCC  TO READ 1 CHAR      E U2N01970
                          DC      /0A00                               O U2N01980
                    BACK  DC      0         BACKSPACE INDR              U2N01990
                    COUNT DC      0         LENGTH  OF I/O AREA         U2N02000
                    DSWRD DC      0         DEVICE  STATUS WORD         U2N02010
                    RIGHT DC      0         CHAR INDR (0 IF RIGHT)      U2N02020
                    RSTRT DC      0         RE-ENTRY  INFO - INDICATOR  U2N02030
                          DC      0                          IOAR ADDR  U2N02040
                          DC      0                          WORD COUNT U2N02050
                    SLASH DC      0         SLASH CHAR INDR             U2N02060
                    D1    DC      1                                 2-4 U2N02061
                    D2    DC      2                                 2-4 U2N02062
                    $PST4 EQU     /8D       POST-OPERATIVE ERROR TRAP   U2N02070
                          EJCT                                          U2N02075
                    *************************************************** U2N02080
                    *             PRINT FUNCTION INTERRUPT PROCESSING * U2N02090
                    *************************************************** U2N02100
                    *    DATA IS PRINTED FROM A TEMPORARY REGISTER AS * U2N02110
                    *    THE DATA AREA IS UNPACKED, ONE CHARACTER     * U2N02120
                    *    AT A TIME.                                   * U2N02130
                    *************************************************** U2N02140
                    TY80  MDX  L  COUNT,-1  ANY  MORE CHARS TO PRINT    U2N02150
                          MDX     TY81      *  YES                      U2N02160
                          MDX     TY68      *  NO, EXIT                 U2N02170
                    TY81  LD      RIGHT     IS    THIS RIGHT CHAR       U2N02180
                          BSC  L  TY82,+-   *   YES,GO TO PRINT         U2N02190
                          SRA     16        *    NO, IS LEFT CHAR       U2N02200
                          STO     RIGHT     ZERO RIGHT HAND CHAR INDR   U2N02210
                          MDX  L  READ,+1   INCR I/O AREA ADDR          U2N02220
                          LD   I  READ      GET NEXT O/P WD             U2N02230
                          MDX     TY84      GO PRINT LEFT CHAR          U2N02240
                    TY82  LD      D1        IF RIGHT CHAR,SET INDR FOR  U2N02250
                          STO     RIGHT     NEXT CHAR TO BE LEFT CHAR.  U2N02260
                          LD   I  READ      GET RIGHT CHAR,LEFT JUSTIFY U2N02270
                          SLA     8                                     U2N02280
                    TY84  STO     TEMP1     STO CHAR IN O/P BUFFER      U2N02290
                    TY85  XIO     SENSE-1   IS THE DEVICE READY         U2N02300
                          SLA     5                                     U2N02310
                          BSC  L  TY85A,Z+  NO,  GO TO ERROR TRAP       U2N02320
                          XIO     SENSE-1   DEVICE STILL READY          U2N02330
                          SLA     5                                     U2N02340
                          BSC  L  TY85A,Z+  NO,  WAS CONTACT BOUNCE     U2N02350
                          XIO     PRINT     PRINT 1 CHARACTER*****      U2N02360
                    BTY70 MDX     TY70      CHK INTERRUPT REQST     2-4 U2N02370
                    *                                                   U2N02380
                    *EXIT TO POST-OPERATIVE ERROR TRAP WITH NOT READY   U2N02390
                    *ERROR CODE IN THE ACCUMULATOR.                     U2N02400
                    *                                                   U2N02410
                    TY85A LD   L  H2000     ERROR CODE INTO ACC         U2N02420
                          BSI  L  $PST4     EXIT TO ERROR TRAP          U2N02430
                          MDX     TY85      TRY AGAIN                   U2N02440
                          EJCT                                          U2N02445
                    *************************************************** U2N02450
                    *             KEYBOARD INTERRUPT PROCESSING       * U2N02460
                    *************************************************** U2N02470
                    *    THE INPUT CHARACTER IS READ, ANALYZED, AND   * U2N02480
                    *    PROCESSED. IF A GRAPHIC, IT IS PRINTED AND,  * U2N02490
                    *    IF THE REQUESTED NO. OF CHARACTERS HAS NOT   * U2N02500
                    *    BEEN READ, THE KEYBOARD IS RELEASED FOR THE  * U2N02510
                    *    NEXT ENTRY.                                  * U2N02520
                    *************************************************** U2N02530
                    TY86  XIO     READ      READ 1 CHAR FROM KEYBOARD   U2N02540
                          LD   I  READ                                  U2N02550
                          SLA     13        WHAT IS CHAR JUST READ      U2N02560
                          BSC  L  TY93,C    *    CHAR = END MESSAGE     U2N02570
                          BSC  L  TY94,Z-   *    CHAR = RE-ENTRY        U2N02580
                          BSC  L  TY96,Z    *    CHAR = BACKSPACE       U2N02590
                          LDX   1 +75       CHAR=HOLLERITH.SET TBL CTR  U2N02600
                    *                       FOR CONVERSION              U2N02610
                    TY88  LD   I  READ                                  U2N02620
                    TY90  EOR  L1 0         CHK W/HOLL TBL ENTRY        U2N02630
                          BSC  L  TY92,+-   MATCH ,GET PRTY TBL ENTRY   U2N02640
                          MDX   1 -1        IF NOT,CHK NEXT TBL ENTRY   U2N02650
                          MDX     TY88                                  U2N02660
                    TY92  LD   L1 0         GET PRTY CHAR               U2N02670
                          STO     TEMP1     PUT IN O/P BUFFER           U2N02680
                          MDX  L  READ,+1   GET  SET TO READ NEXT CHAR  U2N02690
                          MDX  L  COUNT,-1  ANY MORE CHARACTERS         U2N02700
                          XIO     INIT-1    * YES,ENABLE THE KEYBOARD   U2N02710
                          LD      COUNT     IS COUNT ZERO?          212 U2N02720
                          BNZ     TY85      NO, CONTINUE TO PRINT CH212 U2N02721
                          LD   L  TY97      RESTORE SYSTEM INT REQ  212 U2N02722
                          STO  L  $IREQ     *ADDR                   212 U2N02723
                          B       TY85      CONTINUE TO PRINT CHAR  212 U2N02724
                          EJCT                                          U2N02725
                    *************************************************** U2N02730
                    *             SPECIAL CHARACTER SETUP/PROCESSING  * U2N02740
                    *************************************************** U2N02750
                    *    IF A RE-ENTRY CHARACTER IS READ, TWO SLASHES * U2N02760
                    *    ARE PRINTED, THE CARRIER RESTORED, AND THE   * U2N02770
                    *    KEYBOARD RELEASED FOR THE NEXT (FIRST)       * U2N02780
                    *    ENTRY. IF A BACKSPACE CHARACTER IS READ, A   * U2N02790
                    *    BACKSPACE IS EXECUTED, A SLASH PRINTED, AND  * U2N02800
                    *    THE KEYBOAD RELEASED FOR THE NEXT (PREVIOUS) * U2N02810
                    *    ENTRY.                                       * U2N02820
                    *************************************************** U2N02830
                    TY93  LD      H4110     END OF FIELD CHAR INPUT     U2N02840
                          STO  I  READ      STORE A    NEW LINE CHAR    U2N02850
                          LD      TY97      RESTORE SYSTEM INT REQ  212 U2N02854
                          STO  L  $IREQ     *ADDRESS                212 U2N02855
                          MDX     TY68      GO TO EXIT                  U2N02860
                    TY94  STO     RSTRT                                 U2N02870
                          LD      RSTRT+1   CHARACTER = RE-ENTRY        U2N02880
                          STO     READ                                  U2N02890
                          LD      RSTRT+2   RESTORE ADDRESS & COUNT   T U2N02900
                          STO     COUNT                                 U2N02910
                          LD      HBC00     CHAR   = SLASH              U2N02920
                          MDX     TY84      GO TO PRINT SLASH           U2N02930
                    TY96  STO     BACK      SET BACKSPACE INDR NON-ZERO U2N02940
                          LD      RSTRT+2   CHECK IF THIS IS        2-4 U2N02941
                          S       COUNT     FIRST WORD OF BUFFER    2-4 U2N02942
                          BSC  L  FIRST,+   BRANCH IF YES           2-4 U2N02943
                          MDX  L  READ,-1   REFERENCE PREVIOUS WORD     U2N02950
                          MDX  L  COUNT,+1  INCR THE WD CNT             U2N02960
                    FIRST LD      H1100     CHAR = BACKSPACE        2-4 U2N02970
                          MDX     TY84      EXECUTE A BACKSPACE         U2N02980
                    XT10  LD      SLASH     BKSP INDR SET,IS SLASH INDR U2N02990
                          BSC  L  XT12,Z    * YES,ENABLE KB AND EXIT    U2N03000
                    XT11  LD      D1        * NO,SET SLASH INDR         U2N03010
                          STO     SLASH                                 U2N03020
                          LD      HBC00     CHAR = SLASH                U2N03030
                          MDX     TY84      GO TO PRINT SLASH           U2N03040
                    XT12  SRA     16        CLEAR INDICATORS         &  U2N03050
                    XT13  STO     BACK      RELEASE THE KEYBOARD        U2N03060
                          STO     SLASH                                 U2N03070
                          STO     RSTRT                                 U2N03080
                          MDM     BUSY,0    IF ABORTED, SKIP ENABLE 212 U2N03085
                          XIO     INIT-1                                U2N03090
                          MDX     BTY70                             2-4 U2N03100
                    XT14  LD      SLASH     RESTART INDR SET,IS SLASH   U2N03110
                          BSC  L  XT11,+-   *  NO, SET & PRINT SLASH    U2N03120
                          LD      BACK      * YES,IS BKSP INDR SET      U2N03130
                          BSC  L  XT12,Z    CLEAR ALL INDICATORS        U2N03140
                          LD      D1        *   NO,SET BKSP INDR = 0    U2N03150
                          STO     BACK                                  U2N03160
                          LD      H8100     =CARRIAGE RET (NEW LINE)    U2N03170
                          MDX     TY84      GO TO SPACE CARRIAGE        U2N03180
                    *                                                   U2N03190
                    *CONSTANTS AREA                                     U2N03200
                    *                                                   U2N03210
                    D3    DC      +3                                    U2N03240
                    H1100 DC      /1100     BACKSPACE (CONSOLE PTR)     U2N03250
                    H4110 DC      /4110     HOLLERITH NEW LINE CHAR     U2N03260
                    H8100 DC      /8100     NEW LINE (CONSOLE PTR)      U2N03270
                    HBC00 DC      /BC00     SLASH (CONSOLE PTR)         U2N03280
                    *************************************************** U2N03290
                    *             SBRTA - OBTAIN ENTRY POINT +3 ADDR  * U2N03300
                    *************************************************** U2N03310
                    SBRTA NOP               SAVE RET ADDR               U2N03320
                          SLA     8         GET JUST TV TBL ADDR        U2N03330
                          SRT     8         DUPLICATE    SIGN BIT       U2N03340
                          STX   3 SBA12+1                               U2N03350
                          A       SBA12+1   ADD TV DISPLACEMENT         U2N03360
                          A    L  D2        REF 3RD WD TV TBL ENTRY 212 U2N03370
                          STO     SBA12+1   STORE LOC OF SUBR ADDR      U2N03380
                    SBA12 LD   L  0         OBTAIN SUBR ADDR            U2N03390
                          A       D3        SKIP    FIRST THREE WORDS   U2N03400
                          BSC  I  SBRTA     RET TO CALL                 U2N03410
                    *************************************************** U2N03420
                    *             SBRTB- STORE CONVERSION TBL ADDRS   * U2N03430
                    *************************************************** U2N03440
                    SBRTB LD      CALL1     GET LIBF HOLL WD            U2N03450
                          BSI     SBRTA     GO TO GET HOLL TBL LD ADDR  U2N03460
                          STO     TY90+1    SETUP ADDR FOR CONVERSIONS  U2N03470
                          LD      CALL2     GET LIBF PRTY WD            U2N03480
                          BSI     SBRTA     GO TO GET PRTY TBL LD ADDR  U2N03490
                          STO     TY92+1    SETUP ADDR FOR CONVERSIONS  U2N03500
                          BSC  L  TY42      RET TO CALL SERVICE PORTION U2N03510
                    IRRTN DC      *-*       ENTEY POINT            2-11 U2N03511
                          LD      TY97      RESTORE INT REQ ADDR    212 U2N03526
                          STO  L  $IREQ     *                       212 U2N03527
                          SLA     16        SET ABORT INDR FOR      212 U2N03529
                          STO  L  BUSY      *KYBD ROUTINE           212 U2N03530
                          XIO  L  READ      RESET KYBD ENABLE       212 U2N03531
                          MDM     $IOCT,-1  DECR $IOCT              212 U2N03533
                          NOP               IN CASE OF SKIP         212 U2N03535
                    IROUT BSI  I  $IREQ     ABORT JOB               212 U2N03536
                    TY97  DC      $I420                             212 U2N03539
                    CALL1 LIBF    HOLL      THESE LIBFS NEVER EXECUTED  U2N03540
                    CALL2 LIBF    PRTY      USED TO OBTAIN LD ADDR      U2N03550
                          END                                           U2N03560
