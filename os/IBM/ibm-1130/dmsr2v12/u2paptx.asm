                          HDNG    LIBF  PAPTX                           U2F00010
                    *************************************************** U2F00020
                    *     SUBROUTINE NAME-                            * U2F00030
                    *          FULL NAME- N/A                         * U2F00040
                    *          CODE NAME- PAPTX                       * U2F00050
                    *     PURPOSE- THIS SUBROUTINE IS A MODIFICATION  * U2F00060
                    *          OF PAPTN,THUS IT OPERATES BOTH THE     * U2F00070
                    *          PAPERTAPE READER AND THE PAPERTAPE     * U2F00080
                    *          PUNCH.IN ADDITION, IT HAS THE ABILITY  * U2F00090
                    *          TO READ AND PUNCH STARTING FROM EITHER * U2F00100
                    *          THE RIGHT OR LEFT HALF OF THE FIRST    * U2F00110
                    *          WORD OF I/O.                           * U2F00120
                    *     METHOD-                                     * U2F00130
                    *             SEE IBM 1130 SUBROUTINE MANUAL      * U2F00140
                    *     CAPABILITIES AND LIMITATIONS-               * U2F00150
                    *             SEE IBM SUBROUTINE LIBRARY MANUAL   * U2F00160
                    *     SPECIAL FEATURES- CAN READ AND PUNCH        * U2F00170
                    *          INTO/FROM EITHER THE RIGHT OR LEFT     * U2F00180
                    *          SIDE OF THE FIRST WORD OF I/O          * U2F00190
                    *     ADDITIONAL INFORMATION-                     * U2F00200
                    *          ESTIMATED EXECUTION TIME-              * U2F00210
                    *             SEE IBM 1130 SUBROUTINE LIBRARY     * U2F00220
                    *             MANUAL.                             * U2F00230
                    *                                                 * U2F00240
                    *************************************************** U2F00250
                          LIBR                                          U2F00260
                    1130  ISS  03 PAPTX     4                           U2F00270
                    PAPTX STX   1 XR1+1     CALL  ENTRANCE       (+0)   U2F00280
                          LDX  I1 0         LOADER STORES TV ADDR(+2)   U2F00290
                    *                                                   U2F00300
                    *THIS PORTION SERVICES A LIBF                       U2F00310
                    *                                                   U2F00320
                          MDX     PT1       DO CALL PROCESSING          U2F00330
                    INTN  DC      0         INTERRUPT  ENTRANCE  (+4)   U2F00340
                          BSC  L  IPRG      DO INTERRUPT PROCESSING     U2F00350
                    AREA  DC      /1800     PAPER TAPE AREA CODE        U2F00360
                    PT1   STX   2 XR2+1     SAVE XR2                    U2F00370
                          STS     XR2+2     SAVE STATUS                 U2F00380
                          STO     SAVA      SAVE A REG                  U2F00390
                          LD    1 0         GET THE CONTROL WD          U2F00400
                          SRA     12                                    U2F00410
                          BSC  L  PT3,Z     NO,BR TO CONTINUE           U2F00420
                          LD    1 0         YES,WHAT IS DEVICE          U2F00430
                          SLA     12                                    U2F00440
                          BSC  L  RD,+-     READER                      U2F00450
                          S       H1000                                 U2F00460
                          BSC  L  PT36,Z    NOT READER,PUNCH-BAD CALL   U2F00470
                          LD   L  BUSY      DEVICE IS PUNCH             U2F00480
                    PT2   BSC     +-        IS  DEVICE BUSY             U2F00490
                          MDX   1 1         NO,RET TO LIBF+3            U2F00500
                          MDX   1 1         NO,RET TO LIBF+2            U2F00510
                    RESET LD      SAVA      RESTORE  ACCUMULATOR        U2F00520
                          STX   1 RET+1     SET UP RETURN               U2F00530
                    XR1   LDX  L1 0         RESTORE XR1                 U2F00540
                    XR2   LDX  L2 0         RESTORE XR2                 U2F00550
                          LDS     0         RESTORE STATUS              U2F00560
                    RET   BSC  L  0         RETURN TO MAINLINE          U2F00570
                    RD    LD   L  RBUSY     TEST  READER                U2F00580
                          MDX     PT2                                   U2F00590
                    SAVA  DC      0         SAVE A REG                  U2F00600
                    H1000 DC      /1000     CON TO TEST FOR PNCH DVC    U2F00610
                    *                                                   U2F00620
                    *THIS SECTION CONTINUES THE CALL PROCESSING         U2F00630
                    *                                                   U2F00640
                    PT3   LDX  L2 RDTBL     TABLE  FOR READ CONSTANTS   U2F00650
                          S       D0002                                 U2F00660
                          BSC  L  PT4+2,+Z  READ                        U2F00670
                          BSC  L  PT4,+     PUNCH                       U2F00680
                    *                                                   U2F00690
                    *ILLEGAL CALL                                       U2F00700
                    *                                                   U2F00710
                    PT36  LD      H3001     PUT ERROR CODE IN A REG     U2F00720
                          MDX   1 -1        XR1 PTS TO LIBF             U2F00730
                          STX  L1 40        SET UP RET FROM ERROR EXIT  U2F00740
                          LDX   1 41        SET XR1 FOR ERROR EXIT      U2F00750
                          MDX     RESET+1   GO TO EXIT                  U2F00760
                    HFFF0 DC      /FFF0     HIGH BIT MASK               U2F00770
                    H00F0 DC      /00F0     2ND CHAR MASK               U2F00780
                    H3001 DC      /3001     ILLEGAL CALL ERROR CODE     U2F00790
                    PT4   LDX  L2 PNTBL     FUNC IS PUNCH, SO REF PNCH  U2F00800
                          LD    2 BUSY-TBL  GET BUSY INDR               U2F00810
                          BSC  L  PT4+2,Z   IF BUSY,LOOP                U2F00820
                          LD    1 0         GET CHECK DIGIT             U2F00830
                          AND     H0F00                                 U2F00840
                          S       H0100     IS IT VALID                 U2F00850
                          BSC  L  PT36,-Z   NO,TAKE ERROR EXIT          U2F00860
                          STO   2 CHECK-TBL ZERO MEANS NO CHECK         U2F00870
                          LD    1 0         GET CONTROL WD              U2F00880
                          AND     H00F0     SAVE  CHAR COUNT DIGIT      U2F00890
                          STO     INDIC                                 U2F00900
                          A       HFFF0     SET CARRY IF CHAR MODE      U2F00910
                          LD   I1 1         GET WD CNT                  U2F00920
                          BSC     C         NO,DOUBLE WORD COUNT        U2F00930
                          MDX     *+1       YES,DONT DOUBLE WORD COUNT  U2F00940
                          SLA     1                                     U2F00950
                          BSC  L  PT36,+    COUNT NOT PTV--ERROR EXIT   U2F00960
                          STO   2 WDCNT-TBL SAVE WD OR CHAR CNT         U2F00970
                          LD    2 SFT-TBL   SHIFT  TO NOT READY BIT     U2F00980
                          STO     SHIFT     INST TO PUNCH OR READ       U2F00990
                          XIO     SENSE-1   SENSE                       U2F01000
                    SHIFT SLA     5         IS  DEVICE READY            U2F01010
                          BSC  L  PT37,+Z   NO,EXIT TO CORE LOC 41      U2F01020
                          LD    1 1         I/O  AREA ADDRESS           U2F01030
                          A       D0001     AVOID STORED WD OR CHAR CNT U2F01040
                          STO   2 IOAR-TBL  SAVE I/O AREA ADDR          U2F01050
                          LD    1 2         ADDR OF USER ERROR RTN      U2F01060
                          STO   2 USER1-TBL                             U2F01070
                          LD    2 FC-TBL    FUNC CODE PUT INTO AREA TO  U2F01080
                          OR      AREA      CONSTRUCT PROPER IOCC WD    U2F01090
                          STO   2 IOCC+1-TBL                            U2F01100
                          STO     IOCC2+1                               U2F01110
                          STO   2 BUSY-TBL  SET ROUTINE BUSY INDR       U2F01120
                          MDX  L  +50,1     INCR IOCS CTR               U2F01130
                          NOP               MAY SKIP                    U2F01140
                          LD      INDIC     TURN CARRY ON IF FIRST CHAR U2F01150
                          SLA     12        IS IN BITS 8-15 OF WD.      U2F01160
                          BSC  I2 WRIT-TBL  BR TO INITIATE OP.          U2F01170
                    RDS   BSC     C         IS  1ST CHAR IN BITS 8-15   U2F01180
                          LD      D0001     YES,SET TO READ RIGHT       U2F01190
                          STO   2 CHAR-TBL  NO,SET TO READ LEFT         U2F01200
                          XIO     READS-1   START  READER               U2F01210
                    RDS1  MDX   1 3         SET UP EXIT                 U2F01220
                          MDX     RESET     GO TO EXIT                  U2F01230
                    WRT   LD      D0001                                 U2F01240
                          BSC     C         IS  1ST CHAR IN BITS 8-15   U2F01250
                          SRA     1         YES,SET NEXT CHAR LEFT      U2F01260
                          STO   2 CHAR-TBL  NO,  SET FOR RIGHT CHAR     U2F01270
                          LD   I2 IOAR-TBL  GET THE I/O AREA WD         U2F01280
                          BSC     C         IS 1ST CHAR IN BITS 8-15    U2F01290
                          SLA     8         YES,SHIFT CHAR LEFT         U2F01300
                          STO   2 BUF-TBL   STORE  FIRST WORD TO PUNCH  U2F01310
                          XIO   2 IOCC-TBL  PUNCH  1 CHARACTER          U2F01320
                          MDX     RDS1      GO TO EXIT                  U2F01330
                    PT37  LD      H3000     DEVICE  NOT READY ERROR     U2F01340
                          MDX     PT36+1    GO TAKE ERROR EXIT          U2F01350
                    BUF2  DC      0         I/O BUFFER FOR USE W/DELETE U2F01360
                    D0001 DC      0001      SET CHAR CNT TO 1           U2F01370
                    D0002 DC      2         DECIMAL TWO                 U2F01380
                    *                                                   U2F01390
                    *CONSTANTS AND BUFFER AREA                          U2F01400
                    *                                                   U2F01410
                          BSS  E  0                                     U2F01420
                    IOCC2 DC      BUF2      IOCC WORD FOR DELETE        U2F01430
                          DC      0                                     U2F01440
                    H0F00 DC      /0F00     MASK ALL BUT CHK DIGIT      U2F01450
                    SENSE DC      /1F00     SENSE          O            U2F01460
                    H3000 DC      /3000     DVC NOT READY ERROR CODE    U2F01470
                    READS DC      /1C10     IOCC TO START READER        U2F01480
                    H0100 DC      /0100     CON TO CHK THE CHK MODE     U2F01490
                    SENSR DC      /1F01     IOCC TO SENSE W/RESET       U2F01500
                    INDIC DC      0         = 1 FOR READ 1 CHAR W/CHK   U2F01510
                    SVDSW DC      *-*       WD TO SAVE DSW              U2F01520
                    $PST4 EQU     /8D                                   U2F01530
                    *************************************************** U2F01540
                    *   INTERRUPT SERVICING--                         * U2F01550
                    *   THIS PORTION OF THE PROGRAM IS ENTERED FROM   * U2F01560
                    *   THE INTERRUPT LEVEL SUBROUTINE 04. IT SERVICES* U2F01570
                    *   OP COMPLETE OR SERVICE REQUEST INTERRUPTS     * U2F01580
                    *   FROM BOTH THE PAPER TAPE READER AND THE PAPER * U2F01590
                    *   TAPE PUNCH. A NOT READY ERROR CAUSES A BRANCH * U2F01600
                    *   TO LOC /8D.                                   * U2F01610
                    *************************************************** U2F01620
                    IPRG  XIO     SENSR-1   SENSE AND RESET             U2F01630
                          STO     SVDSW     SAVE DVC STATUS WD          U2F01640
                    *             READ ERROR HANDLED AFTER XIO READ     U2F01650
                          SLA     1         IS IT READER SERVICE        U2F01660
                          STX   2 IXR2+1        (SAVE XR2)              U2F01670
                          BSC  L  READI,+Z  YES                         U2F01680
                    PNQ   LD      SVDSW     NO,GET DVC STATUS WD AGAIN  U2F01690
                          LDX  L2 PNTBL     PUT PUNCH TBL ADDR IN XR2   U2F01700
                          SLA     3                                     U2F01710
                          BSC  L  PNERR,C   TEST FOR PUNCH ERROR        U2F01720
                          BSC  L  IXR2,-    TEST FOR PUNCH SERVICE REQ. U2F01730
                          SLA     16                                    U2F01740
                          STO     SVDSW                                 U2F01750
                          MDX  L  WDCNT,-1  ANY  MORE CHARS TO PUNCH    U2F01760
                          MDX     PN1       YES                         U2F01770
                    *                                                   U2F01780
                    *THIS SECTION PREPARES THE FINAL EXIT               U2F01790
                    *                                                   U2F01800
                    IRET  SLA     16        NO                          U2F01810
                          STO   2 BUSY-TBL  TURN  OFF BUSY              U2F01820
                          MDX  L  +50,-1    DECR IOCS CTR               U2F01830
                          NOP               MAY SKIP                    U2F01840
                          MDX     PNQ       GO TO EXIT                  U2F01850
                    IXR2  LDX  L2 0         RESTORE XR2 AND             U2F01860
                          BSC  I  INTN      RETURN  TO ILS ROUTINE      U2F01870
                    PN1   BSI     CHKS      CHECK  FOR STOP CHARACTER   U2F01880
                          LD    2 CHAR-TBL  GET CHAR CNT                U2F01890
                          BSC  L  PNODD,E   EVEN  = 1 WORD WAS PUNCHED  U2F01900
                          SLA     16        IF ODD, ZERO CTR SO NEXT    U2F01910
                          STO   2 CHAR-TBL  CHAR WILL BE EVEN           U2F01920
                    NEXT  MDX  L  IOAR,1    GET THE NEXT O/P WD         U2F01930
                          LD   I  IOAR                                  U2F01940
                          STO   2 BUF-TBL   NEXT WD IS IN O/P BUFFER    U2F01950
                    PN2   XIO     SENSE-1   SENSE WITHOUT RESET         U2F01960
                          SLA     7         IS THE PUNCH READY          U2F01970
                          BSC  L  PN3,-     YES,GO PUNCH NEXT CHAR      U2F01980
                          LD      H0004     NO,LD ERROR CODE AND        U2F01990
                          BSI     USERR     EXIT TO USER ERROR RTN      U2F02000
                          LD      H3000                                 U2F02010
                          BSI  L  $PST4                                 U2F02020
                          MDX     PN2       RET TO CHK PUNCH AGAIN      U2F02030
                    H0004 DC      /0004     PUNCH NOT RDY ERROR CODE    U2F02040
                    PN3   MDX  L  CHAR,1    INCR CHAR CNT               U2F02050
                          XIO   2 IOCC-TBL  PUNCH  1 CHARACTER          U2F02060
                          MDX     IXR2      RETURN  TO ILS ROUTINE      U2F02070
                    *                                                   U2F02080
                    *THIS SECTION GETS SECOND CHAR OF WD TO PUNCH       U2F02090
                    *                                                   U2F02100
                    PNODD LD    2 BUF-TBL   GET SAME WD AS BEFORE.      U2F02110
                          SLA     8         POSITION TO PUNCH RT CHAR   U2F02120
                          MDX     NEXT+4    GO TO PUNCH                 U2F02130
                    *                                                   U2F02140
                    *THIS SECTION TAKES CARE OF A PUNCH ERROR (NOT      U2F02150
                    *RECOGNIZED ON 1130, BUT IS ON 1800).               U2F02160
                    *                                                   U2F02170
                    PNERR LD      D0002     GET ERROR CODE INTO A REG   U2F02180
                          BSI     USERR     GO TO USER ERROR RTN        U2F02190
                          BSC  L  MOCK1,+   IF RETRY,ACC NEG,O/P DELETE U2F02200
                          LD    2 CHECK-TBL IS IT CHECK MODE            U2F02210
                          BSC  L  PN3+2,Z   YES,GO REPUNCH CHAR         U2F02220
                          MDX     PN1       NO,GO GET NEXT CHAR         U2F02230
                    *                                                   U2F02240
                    *THIS SECTION SERVICES A READER REQUEST INTERRUPT   U2F02250
                    *                                                   U2F02260
                    READI LDX  L2 RDTBL     SET XR2 TO READ TBL ADDR    U2F02270
                          SLA     16                                    U2F02280
                          STO   2 BUF-TBL   CLEAR I/P BUFFER            U2F02290
                          XIO   2 IOCC-TBL  READ  1 CHARACTER           U2F02300
                          XIO     SENSE-1   SENSE READER (NO RESET)     U2F02310
                          BSC  L  RD2,-     NO READER ERROR,CONT        U2F02320
                          LD      THREE     READER  ERROR               U2F02330
                          BSI     USERR     GO  TO USERS EXIT           U2F02340
                          BSC  L  RD5,-     GO TO RETRY LAST CHAR       U2F02350
                          LD    2 CHECK-TBL IS IT CHK MODE              U2F02360
                          BSC  L  RD3,+-    NO,GO READ NEXT CHAR        U2F02370
                          LD      BLANK     YES,INPUT BLANK             U2F02380
                          STO     BUF                                   U2F02390
                          MDX     RD3       GO READ NEXT CHAR           U2F02400
                    BLANK DC      /1000     PTTC/8 BLANK                U2F02410
                    *                                                   U2F02420
                    *THIS SECTION OUTPUTS A DELETE IF CHK MODE AND RETS U2F02430
                    *                                                   U2F02440
                    MOCK1 LD    2 CHECK-TBL IS IT CHECK MODE            U2F02450
                          BSC  L  PN1,+-    NO,GO TO READ NEXT CHAR     U2F02460
                          LD      DEL       YES,OUTPUT A DELETE CHAR    U2F02470
                          STO     BUF2                                  U2F02480
                          XIO     IOCC2     PUNCH DELETE FRAME          U2F02490
                          MDX     IXR2      RETURN TO ILS               U2F02500
                    THREE DC      +3        CONST USED FOR ERROR CODE   U2F02510
                    RD2   LD    2 CHECK-TBL IF CHECK MODE,              U2F02520
                          BSC  L  RD3,+-                                U2F02530
                          LD    2 BUF-TBL   CHECK  FOR DELETE CHARACTER U2F02540
                          S       DEL                                   U2F02550
                          BSC  L  RD5,+-    YES                         U2F02560
                    RD3   MDX  L  RCHAR,1   NO,  ADD 1 TO CHAR. COUNT   U2F02570
                          LD    2 CHAR-TBL  IS CHAR COUNT EVEN          U2F02580
                          BSC  L  RDODD,E   NO,FIRST CHAR OF WD         U2F02590
                          SLA     16        YES,SECOND CHAR OF WD       U2F02600
                          STO   2 CHAR-TBL  ZERO CHAR CNT               U2F02610
                          LD   I2 IOAR-TBL                              U2F02620
                          SRT     24                                    U2F02630
                          LD    2 BUF-TBL   COMBINE  2 CHARACTERS       U2F02640
                          RTE     8         * INTO ONE WORD             U2F02650
                          STO  I2 IOAR-TBL                              U2F02660
                          MDX  L  RIOAR,1   NEXT  WORD                  U2F02670
                    RD4   MDX  L  RWDCT,-1  DECREMENT  CHAR COUNT       U2F02680
                          MDX     *+1                                   U2F02690
                          MDX     IRET      EXIT  ON ZERO WORD COUNT    U2F02700
                          BSI     CHKS      CHECK  FOR STOP CHARACTER   U2F02710
                    RD5   XIO  L  SENSE-1   SENSE READER (NO RESET)     U2F02720
                          SLA     5         IS THE READER READY         U2F02730
                          BSC  L  RD6,-     YES,GO START READER         U2F02740
                          LD      H0005     NO,LOAD ERROR CODE AND      U2F02750
                          BSI     USERR     EXIT TO USER ERROR RTN      U2F02760
                          LD   L  H3000                                 U2F02770
                          BSI  L  $PST4     EXIT TO ERROR TRAP          U2F02780
                          MDX     RD5       GO SENSE READER AGAIN       U2F02790
                    H0005 DC      /0005     READER NOT READY ERROR CODE U2F02800
                    H00FF DC      /00FF     HIGH BIT MASK               U2F02810
                    RD6   XIO  L  READS-1   START  READER               U2F02820
                          BSC  L  PNQ                                   U2F02830
                    *                                                   U2F02840
                    *ODD CHAR CNT,PUT CHAR IN FIRST HALF OF WORD,       U2F02850
                    *LEAVING SECOND HALF UNCHANGED.                     U2F02860
                    *                                                   U2F02870
                    RDODD LD   I2 IOAR-TBL  GET I/P AREA WD             U2F02880
                          AND     H00FF     SAVE SECOND HALF OF WD      U2F02890
                          OR    2 BUF-TBL   PUT NEW CHAR IN FIRST HALF  U2F02900
                          STO  I2 IOAR-TBL  AND RESTORE.                U2F02910
                          MDX     RD4       GO DECR WD CNT              U2F02920
                    *                                                   U2F02930
                    *THIS SECTION EXITS IF STOP CHAR WAS LAST READ      U2F02940
                    *                                                   U2F02950
                    CHKS  DC      0         SAVE RET ADDR               U2F02960
                          LD    2 CHECK-TBL IS IT CHK MODE              U2F02970
                          BSC  I  CHKS,+-   NO,RET                      U2F02980
                          LD    2 BUF-TBL   YES,WAS LAST CHAR=STOP      U2F02990
                          SRA     8                                     U2F03000
                          S       STOP                                  U2F03010
                          BSC  I  CHKS,Z    NOT STOP CHAR,RET           U2F03020
                          BSC  L  IRET      STOP CHAR,DO FINAL.EXIT     U2F03030
                    *                                                   U2F03040
                    *THIS SECTION SETS UP EXIT TO,+ RET FROM USER ERROR U2F03050
                    *RTN                                                U2F03060
                    *                                                   U2F03070
                    USERR DC      0         SAVE RET ADDR               U2F03080
                          BSI  I2 USER1-TBL EXIT TO USER ERROR RTN      U2F03090
                          BSC  I  USERR,Z   TRY  AGAIN                  U2F03100
                          BSC  L  IRET      TERMINATE                   U2F03110
                    *                                                   U2F03120
                    *CONSTANTS AND BUFFER AREA.--THERE ARE TWO PARA-    U2F03130
                    *LLEL TABLES FOR READING AND PUNCHING OPERATIONS,   U2F03140
                    *SO THAT BOTH CAN BE DONE AT THE SAME TIME.         U2F03150
                    *                                                   U2F03160
                    DEL   DC      /7F00     PTTC/8 DELETE CHAR          U2F03170
                    STOP  DC      /00DD     PTTC/8 STOP CHAR            U2F03180
                    *TABLE OF PUNCH CONSTANTS                           U2F03190
                    TBL   BSS  E  0                                     U2F03200
                    PNTBL BSS     0         ADDR  OF TABLE              U2F03210
                    IOCC  DC      BUF       IOCC  WORDS FOR PUNCHING    U2F03220
                          DC      0                                     U2F03230
                    BUSY  DC      0         BUSY INDR WORD              U2F03240
                    CHECK DC      0         CHK MODE INDR (0=NO CHK)    U2F03250
                    WDCNT DC      0         WORD COUNT                  U2F03260
                    IOAR  DC      0         I/O AREA ADDR               U2F03270
                    USER1 DC      0         USER ERROR RTN ADDR         U2F03280
                    FC    DC      /0100     FUNCTION CODE TEST CON      U2F03290
                    SFT   SLA     7         SHIFT FOR NOT READY INDR    U2F03300
                    CHAR  DC      0         BUFFER TO PACK CHARS        U2F03310
                    WRIT  DC      WRT       SET UP BR TO PUNCH A CHAR   U2F03320
                    BUF   DC      0         I/O BUFFER FOR PUNCH        U2F03330
                    *TABLE OF READ CONSTANTS                            U2F03340
                    RDTBL BSS  E  0         ADDR OF TBL                 U2F03350
                    RIOCC DC      RBUF      IOCC WDS FOR READING        U2F03360
                          DC      0                                     U2F03370
                    RBUSY DC      0         BUSY INDR WD                U2F03380
                    RCHEK DC      0         CHK MODE INDR (0= NO CHK)   U2F03390
                    RWDCT DC      0         WORD COUNT                  U2F03400
                    RIOAR DC      0         I/O AREA ADDR               U2F03410
                    RUSE1 DC      0         ADDR OF USER ERROR RTN      U2F03420
                    RFC   DC      /0200     FUNCTION CODE TEST CON      U2F03430
                    RSFT  SLA     5         SHIFT FOR NOT RDY INDR      U2F03440
                    RCHAR DC      0         BUFFER TO PACK CHARS        U2F03450
                    RWRT  DC      RDS       SET UP BR TO READ A CHAR    U2F03460
                    RBUF  DC      0         I/O BUFFER FOR READ         U2F03470
                          END                                           U2F03480
