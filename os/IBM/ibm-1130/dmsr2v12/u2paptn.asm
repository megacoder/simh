                          HDNG    LIBF PAPTN                            U2E00005
                    *************************************************** U2E00010
                    *                                                 * U2E00020
                    *   SUBROUTINE NAME-                              * U2E00030
                    *      FULL NAME- N/A                             * U2E00040
                    *      CODE NAME- PAPTN                           * U2E00050
                    *   PURPOSE- THIS SUBROUTINE  OPERATES BOTH THE   * U2E00060
                    *      IBM 1134 PAPER TAPE READER AND THE IBM     * U2E00070
                    *      1055 PAPER TAPE PUNCH. IT IS ABLE TO       * U2E00080
                    *      OPERATE THEM SIMULTANEOUSLY.               * U2E00090
                    *   METHOD-                                       * U2E00100
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U2E00110
                    *   CAPABILITIES AND LIMITATIONS-                 * U2E00120
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U2E00130
                    *   SPECIAL FEATURES- THE READ AND PUNCH CAN BE   * U2E00140
                    *      OPERATED AT THE SAME TIME.                 * U2E00150
                    *   ADDITIONAL INFORMATION-                       * U2E00160
                    *      ESTIMATED EXECUTION TIME-                  * U2E00170
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U2E00180
                    *                                                 * U2E00190
                    *************************************************** U2E00200
                          LIBR                                          U2E00220
                          ISS  03 PAPTN     4                           U2E00230
                    PAPTN STX   1 XR1+1     CALL  ENTRANCE       (+0)   U2E00240
                          LDX  I1 0         LOADER STORES TV ADDR (+2)  U2E00250
                          MDX     PT1       BR W/LIBF+1 IN XR1          U2E00260
                    INTN  DC      0         INTERRUPT  ENTRANCE  (+4)   U2E00270
                          BSC  L  IPRG                                  U2E00280
                    AREA  DC      /1800                                 U2E00290
                    PT1   STX   2 XR2+1     SAVE XR2                    U2E00300
                          STS     XR2+2     SAVE STATUS                 U2E00310
                          STO     SAVA      SAVE A REG                  U2E00320
                          LD    1 0         GET THE CONTROL WORD        U2E00330
                          SRA     12        IS FUNCTION = TEST          U2E00340
                          BSC  L  PT3,Z     NO, BR TO CONTINUE          U2E00350
                          LD    1 0         YES, WHAT IS THE DEVICE     U2E00360
                          SLA     12                                    U2E00370
                          BSC  L  RD,+-     READER                      U2E00380
                          S       H1000                                 U2E00390
                          BSC  L  PT36,Z    NOT READER,PUNCH- BAD CALL  U2E00400
                          LD   L  BUSY      DEVICE IS PUNCH             U2E00410
                    PT2   BSC     +-        IS  DEVICE BUSY             U2E00420
                          MDX   1 1         NO,RET TO LIBF+3            U2E00430
                          MDX   1 1         NO,RET TO LIBF+2            U2E00440
                    RESET LD      SAVA      RESTORE  ACCUMULATOR        U2E00450
                          STX   1 RET+1     SET UP RETURN               U2E00460
                    XR1   LDX  L1 *-*       RESTORE XR1                 U2E00470
                    XR2   LDX  L2 *-*       RESTORE XR2                 U2E00480
                          LDS     *-*       RESTORE STATUS              U2E00490
                    RET   BSC  L  *-*       RETURN TO MAINLINE          U2E00500
                    RD    LD   L  RBUSY     TEST  READER                U2E00510
                          MDX     PT2       *BUSY                       U2E00520
                    SAVA  DC      0         SAVE A REG                  U2E00530
                    H1000 DC      /1000     CON TO TEST FOR PNCH DVC    U2E00540
                    *                                                   U2E00550
                    *THIS SECTION  CONTINUES THE CALL PROCESSING        U2E00560
                    *                                                   U2E00570
                    PT3   LDX  L2 RDTBL     TABLE  FOR READ CONSTANTS   U2E00580
                          S       D0002                                 U2E00590
                          BSC  L  PT4+2,+Z  READ                        U2E00600
                          BSC  L  PT4,+     PUNCH                       U2E00610
                    *                                                   U2E00620
                    *ILLEGAL CALL                                       U2E00630
                    *                                                   U2E00640
                    PT36  LD      H3001     PUT ERROR CODE IN A REG     U2E00650
                          MDX   1 -1        XR1 PTS TO LIBF             U2E00660
                          STX  L1 40        SET UP RET FROM ERROR EXIT  U2E00670
                          LDX   1 41        SET XR1 FOR ERROR EXIT      U2E00680
                          MDX     RESET+1   GO TO EXIT                  U2E00690
                    D0002 DC      2         CONSTANT TO TEST FUNCTION   U2E00700
                    H3001 DC      /3001     ILLEGAL CALL ERROR CODE     U2E00710
                    PT4   LDX  L2 PNTBL     FUNC IS PUNCH,SO REF PNCH   U2E00720
                          LD    2 BUSY-TBL  GET BUSY INDR               U2E00730
                          BSC  L  PT4+2,Z   IF BUSY,LOOP                U2E00740
                          LD    1 0         GET CHECK DIGIT             U2E00750
                          AND     H0F00                                 U2E00760
                          S       H0100     IS IT VALID                 U2E00770
                          BSC  L  PT36,-Z   NO,TAKE ERROR EXIT          U2E00780
                          STO   2 CHECK-TBL ZERO MEANS NO CHECK         U2E00790
                          LD   I1 1         IS  WORD COUNT VALID        U2E00800
                          BSC  L  PT36,+    NO,TAKE ERROR EXIT          U2E00810
                          STO   2 WDCNT-TBL YES,SAVE                    U2E00820
                          LD    2 SFT-TBL   GET SHIFT TO NOT-RDY BIT    U2E00830
                          STO     SHIFT     INST  FOR PNCH OR RD        U2E00840
                          XIO     SENSE-1   SENSE                       U2E00850
                    SHIFT SLA     5          IS DEVICE READY            U2E00860
                          BSC  L  PT37,+Z   NO, EXIT TO CORE LOC 41     U2E00870
                          LD    1 1         I/O  AREA ADDRESS           U2E00880
                          A       D0001     BYPASS WD CNT               U2E00890
                          STO   2 IOAR-TBL  SAVE I/O AREA ADDR          U2E00900
                          LD    1 2         GET ADDR OF USER ERROR RTN  U2E00910
                          STO   2 USER1-TBL SAVE                        U2E00920
                          LD    2 FC-TBL    FUNCTION  CODE              U2E00930
                          OR      AREA      +  AREA = IOCC+1            U2E00940
                          STO   2 IOCC+1-TBL  ST IOCC CONTROL WD        U2E00950
                          STO     IOCC2+1   SET IOCC FOR USE W/DELETE   U2E00960
                          STO   2 BUSY-TBL  SET DEVICE BUSY INDR        U2E00970
                          SLA     16                                    U2E00980
                          STO   2 CHAR-TBL  ZERO THE CHAR COUNT         U2E00990
                          MDX  L  +50,1     INCR ISS COUNTER            U2E01000
                          NOP               MAY SKIP                    U2E01010
                          BSC  I2 WRIT-TBL  BR TO INITIATE OP           U2E01020
                    RDS   XIO     READS-1   START   READER              U2E01030
                          MDX   1 3         SET UP EXIT TO SKIP 3 PARAM U2E01040
                          MDX     RESET     GO TO RET TO MAINLINE       U2E01050
                    WRT   LD   I2 IOAR-TBL                              U2E01060
                          STO   2 BUF-TBL   STORE  FIRST WORD TO PUNCH  U2E01070
                          LD      D0001     ADD  1 TO CHARACTER COUNT   U2E01080
                          STO   2 CHAR-TBL                              U2E01090
                          XIO   2 IOCC-TBL  PUNCH  1 CHARACTER          U2E01100
                          MDX     RDS+1     GO TO EXIT                  U2E01110
                    PT37  LD      H3000     DEVICE  NOT READY ERROR     U2E01120
                          MDX     PT36+1    TO ERROR EXIT               U2E01130
                    *                                                   U2E01140
                    *CONSTANTS AND BUFFER AREA                          U2E01150
                    *                                                   U2E01160
                    BUF2  DC      0         I/O BUFFER FOR USE W/DELETE U2E01170
                    D0001 DC      0001      SET CHAR CNT TO 1           U2E01180
                          BSS  E  0                                     U2E01190
                    IOCC2 DC      BUF2      IOCC WORD FOR DELETE        U2E01200
                          DC      0                                     U2E01210
                    H0F00 DC      /0F00     MASK ALL BUT CHK DIGIT      U2E01220
                    SENSE DC      /1F00     SENSE                       U2E01230
                    H3000 DC      /3000     DVC NOT RDY ERROR CODE      U2E01240
                    READS DC      /1C10     START  READER  O            U2E01250
                    H0100 DC      /0100     CON TO CHK THE CHK MODE     U2E01260
                    SENSR DC      0         SENSE,  RESET  O            U2E01270
                    SDSW  DC      /1F01     SENSE DSW  AREA CODE    2-2 U2E01275
                    $PST4 EQU     /8D       POST-OPERATIVE ERROR TRAP   U2E01280
                    *                                                   U2E01290
                    *   THIS PORTION OF THE PROGRAM IS ENTERED FROM     U2E01300
                    *   INTERRUPT LEVEL 04. IT SERVICES THE OP COMPLETE U2E01310
                    *   INTERRUPTS FROM BOTH THE READ AND PUNCH DEVICE. U2E01320
                    *                                                   U2E01330
                    IPRG  LD      SDSW                              2-2 U2E01335
                          STO     SENSR                                 U2E01340
                          XIO     SENSR-1   SENSE  AND RESET            U2E01350
                          STO     SENSR     SAVE DSW                    U2E01360
                    *             READ ERROR HANDLED AFTER XIO READ     U2E01370
                          SLA     1                                     U2E01380
                          STX   2 IXR2+1    SAVE XR2                    U2E01390
                          BSC  L  READI,+Z  READER  SERVICE REQUEST     U2E01400
                    PNQ   LD      SENSR                                 U2E01410
                          SLA     3                                     U2E01420
                          BSC  L  PNERR,C   TEST FOR PUNCH ERROR        U2E01430
                          BSC  L  IXR2,-    IS IT PUNCH SERVICE REQUEST U2E01440
                    PN1   LDX  L2 PNTBL     XR2 SET TO REF PNCH TBL     U2E01450
                          SLA     16        ZERO THE IOCC SENSE WD      U2E01460
                          STO     SENSR                                 U2E01470
                          BSI     CHKS      IS PREVIOUS CHAR= STOP      U2E01480
                          LD    2 CHAR-TBL                              U2E01490
                          BSC  L  PNODD,E   COMPLETE WD WAS PNCHED      U2E01500
                          SLA     16        IF EVEN, ZERO CHAR CNT      U2E01510
                          STO   2 CHAR-TBL                              U2E01520
                          MDX  L  WDCNT,-1  DECREMENT  WORD COUNT       U2E01530
                          MDX     NEXT      GO GET NEXT WD TO BE PNCHED U2E01540
                    *                                                   U2E01550
                    *THIS SECTION PREPARES THE FINAL EXIT               U2E01560
                    *                                                   U2E01570
                    IRET  SLA     16                                    U2E01580
                          STO   2 BUSY-TBL  TURN OFF BUSY INDR IN PROG  U2E01590
                          MDX  L  +50,-1    DECR ISS COUNTER            U2E01600
                          NOP               MAY SKIP                    U2E01610
                          MDX     PNQ       GO TO EXIT                  U2E01620
                    IXR2  LDX  L2 0         RESTORE XR2 BEFORE EXIT     U2E01630
                          BSC  I  INTN      RETURN  TO ILS ROUTINE      U2E01640
                    NEXT  MDX  L  IOAR,1    INCR I/O AREA ADDR          U2E01650
                          LD   I  IOAR      GET NEXT WORD               U2E01660
                          STO   2 BUF-TBL   NEXT  WORD IS IN BUF        U2E01670
                    PN2   XIO     SENSE-1   SENSE W/NO RESET            U2E01680
                          SLA     7         IS PUNCH READY              U2E01690
                          BSC  L  PN3,-     YES,GO PNCH NEXT CHAR       U2E01700
                          LD      H0004     NO,EXIT TO USER ERROR RTN   U2E01710
                          BSI     USERR     WITH ERROR CODE IN ACC      U2E01720
                          LD      H3000     ERROR CODE INTO A REG       U2E01730
                          BSI  L  $PST4     TO ERROR TRAP               U2E01740
                          MDX     PN2       RETRY--SENSE PNCH AGAIN     U2E01750
                    H0004 DC      /0004     PNCH NOT RDY ERROR CODE     U2E01760
                    PN3   MDX  L  CHAR,1    INCR CHAR CNT               U2E01770
                          XIO   2 IOCC-TBL  PUNCH  1 CHARACTER          U2E01780
                          MDX     IXR2      RETURN  TO ILS ROUTINE      U2E01790
                    *                                                   U2E01800
                    *THIS SECTION GETS SECOND CHAR OF WD TO PNCH        U2E01810
                    *                                                   U2E01820
                    PNODD LD    2 BUF-TBL   GET SAME WD AS FOR LAST     U2E01830
                          SLA     8         PUT 2ND CHAR IN 1ST HALF    U2E01840
                          MDX     NEXT+4    GO PUT IN O/P BUFFER        U2E01850
                    *                                                   U2E01860
                    *THIS SECTION TAKES CARE OF A PUNCH ERROR (NOT      U2E01870
                    *RECOGNIZED ON THE 1130, BUT IS ON 1800).           U2E01880
                    *                                                   U2E01890
                    PNERR LD      D0002     GET ERROR CODE INTO A REG   U2E01900
                          BSI     USERR     GO TO USER ERROR RTN        U2E01910
                          BSC  L  MOCK1,+   IF RETRY,ACC NEG,O/P DELETE U2E01920
                          LD    2 CHECK-TBL IS IT CHECK MODE            U2E01930
                          BSC  L  PN3+2,Z   YES,GO REPNCH CHAR          U2E01940
                          MDX     PN1       NO,GO GET NEXT CHAR         U2E01950
                    *                                                   U2E01960
                    *THIS SECTION SERVICES A READER REQUEST INTERRUPT   U2E01970
                    *                                                   U2E01980
                    READI LDX  L2 RDTBL     READER  SERVICE REQUEST     U2E01990
                          SLA     16                                    U2E02000
                          STO   2 BUF-TBL   CLEAR BUFFER WORD           U2E02010
                          XIO   2 IOCC-TBL  READ  1 CHARACTER           U2E02020
                          XIO     SENSE-1   IS THERE A READER ERROR     U2E02030
                          BSC  L  RD2,-     NO,GO CHK FOR DELETE CHAR   U2E02040
                          LD      THREE     YES,LD READER ERROR CODE    U2E02050
                          BSI     USERR     EXIT TO USER ERROR RTN      U2E02060
                          BSC  L  RD5,-     RETRY,ACC PTV, RD CHAR OVER U2E02070
                          LD    2 CHECK-TBL IS IT CHK MODE              U2E02080
                          BSC  L  RD3,+-    NO,GO READ NEXT CHAR        U2E02090
                          LD      BLANK     YES, INPUT BLANK            U2E02100
                          STO     BUF                                   U2E02110
                          MDX     RD3       GO READ NEXT CHAR           U2E02120
                    BLANK DC      /1000     PTTC/8 BLANK                U2E02130
                    *                                                   U2E02140
                    *THIS SECTION OUTPUTS A DELETE IF CHK MODE AND RETS U2E02150
                    *                                                   U2E02160
                    MOCK1 LD    2 CHECK-TBL IS IT CHK MODE              U2E02170
                          BSC  L  PN1,+-    NO,GO TO READ NEXT CHAR     U2E02180
                          LD      DEL       YES,OUTPUT A DELETE CHAR    U2E02190
                          STO     BUF2                                  U2E02200
                          XIO     IOCC2     START READER                U2E02210
                          MDX     IXR2      RTN TO ILS ROUTINE          U2E02220
                    THREE DC      +3        READER ERROR CODE           U2E02230
                    RD2   LD    2 CHECK-TBL IF CHECK MODE,              U2E02240
                          BSC  L  RD3,+-                                U2E02250
                          LD    2 BUF-TBL   CHECK  FOR DELETE CHARACTER U2E02260
                          S       DEL                                   U2E02270
                          BSC  L  RD5,+-    YES                         U2E02280
                    RD3   MDX  L  RCHAR,1   NO,  ADD 1 TO CHAR. COUNT   U2E02290
                          LD    2 CHAR-TBL  IS CHAR COUNT EVEN          U2E02300
                          BSC  L  RDODD,E   NO,FIRST CHAR OF WD         U2E02310
                          SLA     16        YES,SECOND CHAR OF WD       U2E02320
                          STO   2 CHAR-TBL  ZERO CHAR COUNT             U2E02330
                          LD    2 BUF-TBL   COMBINE  2 CHARACTERS       U2E02340
                          SRA     8         *INTO ONE WORD              U2E02350
                          OR   I2 IOAR-TBL                              U2E02360
                          STO  I2 IOAR-TBL                              U2E02370
                          MDX  L  RWDCT,-1  DECREMENT  WORD COUNT       U2E02380
                          MDX     *+1       MAY SKIP                    U2E02390
                          MDX     IRET      EXIT  ON ZERO WORD COUNT    U2E02400
                          MDX  L  RIOAR,1   NEXT  WORD                  U2E02410
                    RD4   BSI     CHKS      CHK FOR STOP CHAR           U2E02420
                    *                                                   U2E02430
                    *THIS SECTION TESTS FOR READER READY                U2E02440
                    *                                                   U2E02450
                    RD5   XIO  L  SENSE-1   SENSE W/O RESET             U2E02460
                          SLA     5         IS READER READY             U2E02470
                          BSC  L  RD6,-     YES,GO START READER         U2E02480
                          LD      H0005     NO,LOAD ERROR CODE AND      U2E02490
                          BSI     USERR     EXIT TO USERS ERROR ROUTINE U2E02500
                          LD   L  H3000     ERROR CODE INTO A REG       U2E02510
                          BSI  L  $PST4     TO ERROR TRAP               U2E02520
                          MDX     RD5       RETRY REQUEST, TEST AGAIN   U2E02530
                    H0005 DC      /0005     READER NOT READY ERROR CODE U2E02540
                    RD6   XIO  L  READS-1   START  READER               U2E02550
                          BSC  L  PNQ       GO TEST FOR REQUEST AND RET U2E02560
                    *                                                   U2E02570
                    *ODD CHAR COUNT, PUT IN FIRST HALF OF WORD          U2E02580
                    *                                                   U2E02590
                    RDODD LD    2 BUF-TBL   GET CHAR JUST READ AND      U2E02600
                          STO  I2 IOAR-TBL  STORE IN I/O AREA           U2E02610
                          MDX     RD4       RET TO SENSE READER         U2E02620
                    *                                                   U2E02630
                    *CHECK IF STOP CHAR WAS LAST READ                   U2E02640
                    *                                                   U2E02650
                    CHKS  DC      0         SAVE RET ADDR               U2E02660
                          LD    2 CHECK-TBL IS IT CHECK MODE            U2E02670
                          BSC  I  CHKS,+-   NO,RET                      U2E02680
                          LD    2 BUF-TBL   YES, WAS LAST CHAR = STOP   U2E02690
                          SRA     8                                     U2E02700
                          S       STOP                                  U2E02710
                          BSC  I  CHKS,Z    NOT STOP CHAR,RET           U2E02720
                          MDX     IRET      STOP CHAR,DO FINAL EXIT     U2E02730
                    *                                                   U2E02740
                    *SETS UP EXIT TO USER ERROR ROUTINE                 U2E02750
                    *                                                   U2E02760
                    USERR DC      0         SAVE RET ADDR               U2E02770
                          BSI  I2 USER1-TBL EXIT TO USER ERROR RTN      U2E02780
                          BSC  I  USERR,Z   TRY  AGAIN                  U2E02790
                          BSC  L  IRET      TERMINATE                   U2E02800
                    *                                                   U2E02810
                    *CONSTANTS AND BUFFER AREA.-- THERE ARE TWO PARA-   U2E02820
                    *LLEL TABLES FOR READING AND PUNCHING OPERATIONS,   U2E02830
                    *SO THAT BOTH CAN BE DONE AT THE SAME TIME.         U2E02840
                    *                                                   U2E02850
                    DEL   DC      /7F00     PTTC/8 DELETE CHAR          U2E02860
                    STOP  DC      /00DD     PTTC/8 STOP CHAR            U2E02870
                    * TABLE OF PUNCH CONSTANTS                          U2E02880
                    TBL   BSS  E  0                                     U2E02890
                    PNTBL BSS     0         ADDR OF TBL                 U2E02900
                    IOCC  DC      BUF       IOCC WORDS FOR PUNCHING     U2E02910
                          DC      0                                     U2E02920
                    BUSY  DC      0         BUSY INDR WORD              U2E02930
                    CHECK DC      0         CHK MODE INDR (0= NO CHK)   U2E02940
                    WDCNT DC      0         WORD COUNT                  U2E02950
                    IOAR  DC      0         I/O AREA ADDR               U2E02960
                    USER1 DC      0         USER ERROR RTN ADDR         U2E02970
                    FC    DC      /0100     FUNCTION CODE TEST CON      U2E02980
                    SFT   SLA     7         SHIFT FOR NOT RDY INDR      U2E02990
                    CHAR  DC      0         BUFFER TO PACK CHARS        U2E03000
                    WRIT  DC      WRT       SET UP BR TO PUNCH A CD     U2E03010
                    BUF   DC      0         I/O BUFFER FOR PUNCH        U2E03020
                    * TABLE OF READ CONSTANTS                           U2E03030
                    RDTBL BSS  E  0         ADDR OF TBL                 U2E03040
                    RIOCC DC      RBUF      IOCC WORDS FOR READING      U2E03050
                          DC      0                                     U2E03060
                    RBUSY DC      0         BUSY INDR WORD              U2E03070
                    RCHEK DC      0         CHECK MODE INDR (0= NO CHK) U2E03080
                    RWDCT DC      0         WORD COUNT                  U2E03090
                    RIOAR DC      0         I/O AREA ADDR               U2E03100
                    RUSE1 DC      0         ADDR OF USER ERROR RTN      U2E03110
                    RFC   DC      /0200     FUNCTION CODE TEST CON      U2E03120
                    RSFT  SLA     5         SHIFT FOR NOT RDY INDR      U2E03130
                    RCHAR DC      0         BUFFER TO PACK CHARS        U2E03140
                    RWRT  DC      RDS       SET UP BR TO READ           U2E03150
                    RBUF  DC      0         I/O BUFFER FOR READ         U2E03160
                          END                                           U2E03170
