                          HDNG    PLOT1 SUBROUTINE                      U2G00010
                    *************************************************** U2G00020
                    *STATUS - VERSION 2, MODIFICATION 8               * U2G00022
                    *                                                 * U2G00024
                    *SUBROUTINE NAME -                                * U2G00026
                    *   FULL NAME - N/A                               * U2G00028
                    *   CODE NAME - PLOT1                             * U2G00030
                    *                                                 * U2G00032
                    *PURPOSE-                                         * U2G00034
                    *   THIS SUBROUTINE OPERATES THE IBM 1627 PLOTTER.* U2G00036
                    *   IT CAN DO A TEST OR A PLOT FUNCTION.          * U2G00038
                    *                                                 * U2G00040
                    *METHOD - N/A                                     * U2G00043
                    *                                                 * U2G00046
                    *CAPABILITIES AND LIMITATIONS -                   * U2G00050
                    *   SEE IBM 1130 SUBROUTINE LIBRARY MANUAL        * U2G00053
                    *                                                 * U2G00056
                    *SPECIAL FEATURES -                               * U2G00060
                    *   THIS SUBROUTINE IS CALLED WITH THE DATA IN A  * U2G00063
                    *   USER BUFFER.  DATA MAY HAVE A REPETITION COUNT* U2G00066
                    *   ISS SUBROUTINE PLOTX MAY ONLY BE CALLED WITH A* U2G00070
                    *   SINGLE DATA ITEM, BUT IT ACCUMULATES THEM IN  * U2G00073
                    *   ITS OWN SMALL BUFFER.                         * U2G00076
                    *EXTERNAL REFERENCES -                            * U2G00080
                    *   $IOCT                                         * U2G00081
                    *   $PRET                                         * U2G00083
                    *   $PST3                                         * U2G00084
                    *                                                 * U2G00090
                    *ADDITIONAL INFORMATION -                         * U2G00093
                    *   ERROR PROCEDURES -                            * U2G00096
                    *      PAUSE AT $PRET OR $PST3 IF PLOTTER NOT     * U2G00100
                    *      READY.                                     * U2G00103
                    *      THE ERROR SUBROUTINE PARAMETER IS NOT USED,* U2G00106
                    *      BUT IS REQUIRED FOR COMPATABILITY WITH THE * U2G00110
                    *      IBM 1800 VERSION OF THIS SUBROUTINE.       * U2G00113
                    *                                                 * U2G00116
                    *   CALLING SEQUENCE -                            * U2G00120
                    *     LIBF    PLOT1     CALL PLOTTER BUSY TEST    * U2G00123
                    *     DC      /0000     CONTROL PARAMETER         * U2G00126
                    *     .                 RETURNS HERE IF BUSY      * U2G00130
                    *     .                 RETURNS HERE IF NOT BUSY  * U2G00133
                    *                                                 * U2G00136
                    *     LIBF    PLOT1     CALL PLOTTER OUTPUT       * U2G00140
                    *     DC      /X000     CONTROL PARAMETER         * U2G00143
                    *     DC      IOAR      I/O AREA PARAMETER        * U2G00146
                    *     DC      ERROR     ERROR PARAMETER (NOT USED)* U2G00150
                    *     .                                           * U2G00160
                    *     .                                           * U2G00170
                    *IOAR DC      F         WORD COUNT                * U2G00180
                    *     BSS     H         I/O AREA                  * U2G00181
                    *                                                 * U2G00185
                    *NOTES -                                          * U2G00186
                    *                                                 * U2G00190
                    *      THE MAINLINE FLOW MAY BE ALTERED BY THE    * U2G00192
                    *   USER AT $PRET WITHOUT AFFECTING THE           * U2G00193
                    *   POSSIBILITY OF AN ENTIRELY NEW LIBF PLOT1 AT  * U2G00194
                    *   SOME LATER TIME.                              * U2G00195
                    *************************************************** U2G00200
                    *     EJCT        BLK REMOVED                       U2G00205
                          LIBR                                          U2G00210
                    1130  ISS  07 PLOT1     3                           U2G00220
                    PLOT1 STX   1 XR1+1     CALL ENTRANCE          (+0) U2G00250
                          LDX  I1 *-*       LIBF+1 INTO XR1             U2G00260
                          MDX     STAR      BR TO PROCESS LIBF          U2G00270
                    INT1  DC      0         INTERRUPT ENTRANCE     (+4) U2G00280
                          MDX     IPRG      BR TO SERVICE INTERRUPT     U2G00290
                    STAR  STS     STAT      SAVE STATUS                 U2G00320
                          STD     SAVAQ     SAVE A AND Q REGS           U2G00330
                          LD    1 0         GET THE CONTROL WORD        U2G00340
                          SRA     12        IS FUNCTION TEST            U2G00350
                          BSC  L  LEGAL,Z   NO, CONTINUE AT LEGAL       U2G00360
                          LD      BUSY      YES, IS ROUTINE BUSY        U2G00370
                          BSC     +-                                    U2G00380
                    RETRN MDX   1 1         NO, RETURN TO LIBF+3        U2G00390
                          MDX   1 1         YES, RETURN TO LIBF+2       U2G00400
                    RESET LDD     SAVAQ     RESTORE ACC AND EXT         U2G00410
                          STX   1 RET+1     SET UP RETURN               U2G00420
                    XR1   LDX  L1 *-*       RESTORE XR1                 U2G00430
                    STAT  LDS     *-*       RESTORE STATUS              U2G00440
                    RET   BSC  L  *-*       RETURN                      U2G00450
                    LEGAL SRA     1         IS FUNCTION = WRITE         U2G00460
                          BSC  L  WRT,+-    YES                         U2G00470
                    ILLGL LD      C7001     NO, LD ILLEGAL CALL CODE    U2G00480
                    ERRET MDX   1 -1                                    U2G00490
                          STX  L1 $PRET     LIBF ADDR INTO CORE LOC 40  U2G00500
                          LDX   1 $PRET+1   SET TO EXIT TO CORE LOC 41  U2G00510
                          MDX     RESET+1   GO EXIT                     U2G00520
                    *                                                   U2G00530
                    *THIS SECTION SETS UP THE ROUTINE TO PLOT THE       U2G00540
                    *FIRST CHARACTER.                                   U2G00550
                    WRT   LD      BUSY      IS ROUTINE BUSY             U2G00560
                          BSC  L  WRT,Z     LOOP IF BUSY                U2G00570
                          STX   0 BUSY      SET BUSY INDR               U2G00580
                          STX   0 FIRST     SET FIRST CHAR INDR         U2G00590
                          LD      C0005     SET HEX DIGIT COUNTER       U2G00740
                          STO     DIGIT     TO 5 FOR FIRST TIME         U2G00750
                          LD   I1 1         SET UP WORD COUNT           U2G00760
                          BSC  L  ILLGL,+   BR IF WORD COUNT BAD        U2G00770
                          STO     WDCNT                                 U2G00780
                          LD    1 1         AND I/O AREA                U2G00790
                          A       C0001                                 U2G00800
                          STO     IOAR                                  U2G00810
                          LD   I  IOAR      PUT FIRST WORD IN BUF       U2G00820
                          STO     BUF                                   U2G00830
                          MDX  L  $IOCT,1   INCR MONITOR I/O COUNTER    U2G00880
                          NOP                                           U2G00890
                          MDX   1 1         XR1 PTS TO ERROR RTN ADDR   U2G00900
                          MDX     ALPHA     BR TO SERVICE FIRST CHAR    U2G00950
                    *                                                   U2G00990
                    *CONSTANTS AND BUFFER AREA                          U2G01000
                    *                                                   U2G01010
                    C7001 DC      /7001     ILLEGAL CALL ERROR CODE     U2G01020
                    BUSY  DC      *-*       DEVICE BUSY INDR            U2G01060
                    BUF   DC      *-*       O/P BUFFER                  U2G01080
                          BSS  E  0                                     U2G01090
                    IOCC  DC      *-*       WRITE 1627 PLOTTER IOCC     U2G01100
                          DC      /2900                                 U2G01110
                    SENSE DC      *-*                                   U2G01120
                    WDCNT EQU     *-1       I/O AREA WORD COUNT         U2G01130
                          DC      /2F00     SENSE PLOTTER IOCC          U2G01140
                    SENSR DC      *-*                                   U2G01142
                    DIGIT EQU     *-1       HEX DIGIT COUNTER           U2G01144
                          DC      /2F01     SENSE PLOTTER RESET IOCC    U2G01146
                    SAVAQ DC      *-*       SAVE ACC AND EXT            U2G01150
                          DC      *-*       *                           U2G01160
                    IOAR  DC      *-*       I/O ADDR STG                U2G01170
                    C0001 DC      /0001     PARITY ERROR CODE           U2G01180
                    C0005 DC      /0005     CON FOR SETTING HEX CTR     U2G01190
                    C7000 DC      /7000     DVC NOT RDY ERROR CODE      U2G01200
                    $PRET EQU     40        PRE-OPERATIVE ERROR TRAP    U2G01210
                    $IOCT EQU     50        ISS COUNTER                 U2G01220
                    $PST3 EQU     /89       POST-OPERATIVE ERROR TRAP   U2G01230
                    *                                                   U2G01240
                    *THIS PORTION THE PROGRAM SERVICES THE OP COMPLETE  U2G01250
                    *INTERRUPTS FROM THE PLOTTER ON LEVEL 03.           U2G01260
                    *                                                   U2G01270
                    IPRG  XIO     SENSR     SENSE WITH RESET DSW        U2G01290
                          MDX  L  DUPCT,-1  ANY MORE DUPLICATES         U2G01360
                          MDX     PLOTC     YES,GO PLOT AGAIN           U2G01370
                    ALPHA SLA     16        NO,ZERO DUPLICATE COUNT     U2G01380
                          STO     DUPCT                                 U2G01390
                    ALPH2 BSI     GET       SUBROUTINE TO GET DIGIT     U2G01400
                          S       C000D     IS DIGIT D, E, OR F         U2G01410
                          BSC  L  ALPH2,-   YES.NOT USED.GET NEXT DIGIT U2G01420
                          A       C0003     NO, IS DIGIT A,B,C          U2G01430
                          BSC  L  LOOK,+Z   NO, IS 0-9.SINGLE INST      U2G01440
                          BSC  L  BC,Z      YES, MEANS DUPLICATE        U2G01450
                    *                       CHAR IS B OR C ,BR          U2G01460
                          BSI     GET       CHAR IS A --GET COUNT       U2G01470
                    BCM5  STO     DUPCT                                 U2G01480
                          BSC  L  PLOTC,Z   BR IF DUPLICATE TO PLOT     U2G01510
                          MDX     ALPHA     DO NOT PLOT IF COUNT = 0    U2G01520
                    *                                                   U2G01530
                    *THIS SECTION DUPLICATES UP TO 255 TIMES  (B)       U2G01540
                    *                                                   U2G01550
                    BC    S       C0001     IS CHAR C                   U2G01560
                          BSC  L  C,Z       YES,BR                      U2G01570
                          BSI     GET       NO, CHAR IS B               U2G01580
                    CM5   SLA     4         GET A DIGIT                 U2G01590
                          STO     DUPCT     SHIFT TO ALLOW FOR NEXT     U2G01600
                          BSI     GET       GET LAST DIGIT              U2G01610
                          OR      DUPCT                                 U2G01620
                          MDX     BCM5      PUT COUNT IN DUPCT          U2G01630
                    *                                                   U2G01640
                    *THIS SECTION DUPLICATES UP TO 4095 TIMES  (C)      U2G01650
                    *                                                   U2G01660
                    C     BSI     GET       GET FIRST DIGIT             U2G01670
                          SLA     4                                     U2G01680
                          STO     DUPCT                                 U2G01690
                          BSI     GET       AND SECOND DIGIT.           U2G01700
                          OR      DUPCT                                 U2G01710
                          MDX     CM5       GO TO OTHER AREA TO GET 3RD U2G01720
                    LOOK  LD      CTRL      DIGIT IS FROM 0-9           U2G01730
                          A       WORK                                  U2G01740
                          STO     IOCC      ADDR FOR CONTROL            U2G01750
                    *                                                   U2G01760
                    *THIS SECTION ACTIVATES THE PLOTTER                 U2G01770
                    *                                                   U2G01780
                    PLOTC XIO     SENSE     SENSE DSW WITHOUT RESET     U2G01790
                          SLA     14                                    U2G01800
                          BSC  L  NR,Z      NOT RDY BUSY-TO ERROR TRAP  U2G01810
                          LD      FIRST     IS THE CHAR THE FIRST       U2G01820
                          BSC  L  FST,Z     YES, GO TO RET TO CALL      U2G01830
                    *                       *      ENTRANCE PORTION     U2G01840
                          XIO     IOCC      **** PLOT ****              U2G01850
                    EXIT  BSC  I  INT1      RET TO ILS 03               U2G01860
                    *                                                   U2G01870
                    *EXIT TO POST-OPERATIVE ERROR TRAP WITH NOT READY   U2G01880
                    *ERROR CODE IN THE ACCUMULATOR.                     U2G01890
                    *                                                   U2G01900
                    NR    LD      C7000     ERROR CODE INTO ACC         U2G01910
                          MDX  L0 FIRST,0   IS THIS THE FIRST DIGIT     U2G01914
                          MDX     NRPRT     YES, BR MAINLINE            U2G01916
                          BSI  L  $PST3     BR TO LEVEL 3 TRAP          U2G01920
                          MDX     PLOTC     TRY AGAIN                   U2G01930
                    *                                                   U2G01931
                    *SET UP TO START LIBF PLOT1 AGAIN AFTER $PRET TRAP  U2G01932
                    *                                                   U2G01933
                    NRPRT MDX  L0 $IOCT,-1  CANCEL MONITOR I/O          U2G01934
                          NOP               *COUNTER INCREMENT          U2G01935
                          SRA     16        CANCEL THIS SUBROUTINE      U2G01936
                          STO     BUSY      *BUSY INDICATOR             U2G01937
                          MDX   1 -1        DECR POINTER TO LIBF        U2G01938
                          LD      C7000     ERROR CODE INTO ACC         U2G01939
                          MDX     ERRET     BR $PRET, THEN LIBF PLOT1   U2G01940
                    *                                                   U2G01941
                    *CHAR IS THE FIRST TO BE O/P.DONT RET TO ILS 03,    U2G01950
                    *BUT TO MAINLINE.                                   U2G01960
                    *                                                   U2G01970
                    FST   SLA     16        ZERO THE FIRST INDR         U2G01980
                          STO     FIRST                                 U2G01990
                          XIO     IOCC      PLOT                        U2G02000
                          MDX     RETRN     RETURN TO MAINLINE          U2G02010
                    FIRST DC      *-*       FIRST CHAR INDR             U2G02020
                    GET   DC      0         SAVE RET ADDR               U2G02030
                    *                                                   U2G02040
                    *THIS SUBROUTINE  GETS A HEXADECIMAL DIGIT          U2G02050
                    *                                                   U2G02060
                          MDX  L  DIGIT,-1  DECR DIGIT COUNT            U2G02070
                          MDX     SHIFT     IF NOT ZERO,GO GET DIGIT    U2G02080
                          MDX  L  DIGIT,4   IF ZERO,RESET TO 4          U2G02090
                          MDX  L  WDCNT,-1  DECRE WORD COUNT            U2G02100
                          MDX     IOBUF     IF WD CNT NOT ZERO,GET WD   U2G02110
                          MDX  L  $IOCT,-1  IF ZERO, DECRE ISS CTR      U2G02120
                          NOP                                           U2G02130
                          SLA     16        ZERO ROUTINE BUSY INDR      U2G02140
                          STO     BUSY                                  U2G02150
                          LD      FIRST                                 U2G02160
                          BSC  L  RETRN,Z   RETURN TO MAINLINE IF FIRST U2G02170
                          MDX     EXIT      RET TO ILS03 IF NOT FIRST   U2G02180
                    *                                                   U2G02190
                    *THIS SECTION GETS THE NEXT WORD, AND DOES A SHIFT  U2G02200
                    *TO ISOLATE THE NEXT HEX DIGIT.                     U2G02210
                    *                                                   U2G02220
                    IOBUF MDX  L  IOAR,1    NEXT WORD IN I/O AREA       U2G02230
                          LD   I  IOAR                                  U2G02240
                          STO     BUF       PUT NEXT WD IN O/P BUFFER   U2G02250
                    SHIFT LD      BUF       GET BUFFER WD               U2G02260
                          SRT     16        PUT IN EXT.                 U2G02270
                          SLA     16        CLEAR ACC.                  U2G02280
                          SLT     4         4 BITS FOR HEX DIGIT        U2G02290
                          STO     WORK      SAVE THE DIGIT              U2G02300
                          SLT     16        SET UP BUFFER FOR NEXT LOOP U2G02310
                          STO     BUF                                   U2G02320
                          LD      WORK      PUT DIGIT IN ACC            U2G02330
                          BSC  I  GET       RET TO CALL                 U2G02340
                    *                                                   U2G02350
                    *CONSTANTS AND BUFFER AREA                          U2G02360
                    *                                                   U2G02370
                    WORK  DC      *-*       BUFFER TO SAVE DIGIT        U2G02380
                    DUPCT DC      *-*       DUPLICATE COUNT BUFFER      U2G02390
                    C000D DC      /000D     TEST FOR CHAR D,E, OR F     U2G02400
                    C0003 DC      /0003     CON OF 3                    U2G02410
                    *TABLE OF CONTROL WORDS                             U2G02420
                    CTRL  DC      CONTL     CONTROL TABLE ADDR          U2G02430
                    CONTL DC      /8000     PEN DOWN                    U2G02440
                          DC      /0800     +Y                          U2G02450
                          DC      /4800     +Y+Y                        U2G02460
                          DC      /4000     +X                          U2G02470
                          DC      /5000     +X-Y                        U2G02480
                          DC      /1000     -Y                          U2G02490
                          DC      /3000     -X-Y                        U2G02500
                          DC      /2000     -X                          U2G02510
                          DC      /2800     -X+Y                        U2G02520
                          DC      /0400     PEN UP                      U2G02530
                          END                                           U2G02540
