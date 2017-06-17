                          HDNG    PAPT1,PAPERTAPE LIBRARY SUBROUTINE    U2D00010
                    *************************************************** U2D00020
                    *                                                 * U2D00030
                    *   VERSION 2,MODIFICATION LEVEL 10               * U2D00035
                    *   SUBROUTINE NAME-                              * U2D00040
                    *      FULL NAME- N/A                             * U2D00050
                    *      CODE NAME- PAPT1                           * U2D00060
                    *   PURPOSE-THIS PROGRAM OPERATES THE IBM 1134    * U2D00070
                    *      PAPER TAPE READER OR THE IBM 1055 PAPER    * U2D00080
                    *      TAPE PUNCH,BUT ONLY ONE DEVICE AT A TIME.  * U2D00090
                    *   METHOD-                                       * U2D00100
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U2D00110
                    *   CAPABILITIES AND LIMITATIONS-                 * U2D00120
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U2D00130
                    *   SPECIAL FEATURES- N/A                         * U2D00140
                    *   ADDITIONAL INFORMATION-                       * U2D00150
                    *      ESTIMATED EXECUTION TIME-                  * U2D00160
                    *         SEE IBM 1130 SUBROUTINE LIBRARY MANUAL  * U2D00170
                    *                                                 * U2D00180
                    *************************************************** U2D00190
                          LIBR                                          U2D00200
                          ISS  03 PAPT1     4                           U2D00210
                    PAPT1 STX   1 XR1+1      CALL ENTRANCE         (+0) U2D00220
                          LDX  I1 *-*       LOADER STORES TV ADDR (+2)  U2D00230
                          MDX     STAR                                  U2D00240
                    INT1  DC      0         INTERRUPT   ENTRANCE   (+4) U2D00250
                          MDX     IPRG      GO SERVICE THE INTERRUPT    U2D00260
                    STOP  DC      /00DD     PTTC/8 STOP CHAR            U2D00270
                    DEL   DC      /7F00     PTTC/8 DELETE CHAR          U2D00280
                    SAVA  DC      0         USED  TO SAVE ACCUMULATOR   U2D00290
                    AREA  DC      /1800     AREA CODE                   U2D00300
                    STAR  STS     XR1+2     SAVE STATUS                 U2D00310
                          STO     SAVA      SAVE A REG                  U2D00320
                          LD      CSLA5     SET- UP FOR READER READY    U2D00330
                          STO     SHIFT                                 U2D00340
                          LD    1 *-*       GET CONTROL PARAM           U2D00350
                          SRA     12                                    U2D00360
                          BSC  L  LEGAL,Z   IS  FUNCTION TEST           U2D00370
                          LD      BUSY      IS  ROUTINE BUSY            U2D00380
                          BSC     +-                                    U2D00390
                          MDX   1 1         NO,  RET TO LIBF+2          U2D00400
                          MDX   1 1         YES,   RET TO LIBF+3        U2D00410
                    RESET LD      SAVA      RESTORE A REG               U2D00420
                          STX   1 RET+1     SET UP RETURN               U2D00430
                    XR1   LDX  L1 0         RESTORE XR1                 U2D00440
                          LDS     *-*       RESTORE STATUS              U2D00450
                    RET   BSC  L  0         RETURN  TO MAINLINE         U2D00460
                    CSLA5 SLA     5         TEST  READER/PUNCH READY    U2D00470
                    LEGAL S       TWO                                   U2D00480
                          BSC     +Z        IS FUNCTION READ            U2D00490
                          MDX     READ      YES,GO TEST ROUTINE BUSY    U2D00500
                          BSC     +         NO, IS FUNCTION PUNCH       U2D00510
                          MDX     PUNCH     YES,GO TEST ROUTINE BUSY    U2D00520
                          LD      C3001     NO , ILLEGAL FUNCTION       U2D00530
                    ERRET MDX   1 -1                                    U2D00540
                          STX  L1 40                                    U2D00550
                          LDX   1 41        EXIT TO $PRET+1             U2D00560
                          MDX     RESET+1                               U2D00570
                    C3001 DC      /3001      ILLEGAL CALL ERROR CODE    U2D00580
                    READ  LD      FCRD       READ FUNCTION = 010  EVEN  U2D00590
                          MDX     PUNCH+3                               U2D00600
                    PUNCH LD      FCPN      PUNCH FUNCTION = 001  ODD   U2D00610
                          MDX  L  SHIFT,2   SHIFT TWO EXTRA FOR PUNCH   U2D00620
                          STO     DEVIC                                 U2D00630
                          LD      BUSY      IS   ROUTINE BUSY           U2D00640
                          BSC  L  *-3,Z     YES,LOOP TIL NOT            U2D00650
                          LD      DEVIC     NOT BUSY, CONSTRUCT IOCC    U2D00660
                          SLA     8         WORD TO CORRESPOND TO       U2D00670
                          OR      AREA      FUNCTION.                   U2D00680
                          STO     IOCC+1    STORE PROPER IOCC WORD      U2D00690
                          STO     IOCC2+1                               U2D00700
                          XIO     SENSE     SENSE  AND RESET            U2D00710
                    SHIFT SLA     5                                     U2D00720
                          BSC     +Z        IS DEVICE READY             U2D00730
                          MDX     ERRD      NO,IT IS NOT                U2D00740
                          LD    1 0         GET CONTROL PARAM           U2D00750
                          AND     H0F00     IS CHECK DIGIT VALID        U2D00760
                          S       H0100                                 U2D00770
                          BSC  L  ERRET-1,-Z NOT VALID,ERROR EXIT       U2D00780
                          STO     CHECK     ZERO  MEANS NO CHECK        U2D00790
                          LD   I1 1         I/O  AREA PARAMETER         U2D00800
                          BSC  L  ERRET-1,+ ERROR EXIT IF WD CNT NOT    U2D00810
                          STO     WDCNT     PTV.IF PTV,SAVE.            U2D00820
                          LD    1 1         GET I/O AREA ADDR           U2D00830
                          A       FCPN      ADD 1 TO SKIP WD CNT        U2D00840
                          STO     IOAR      ST I/O AREA ADDR            U2D00850
                          LD    1 2         STORE  ERROR PARAMETER      U2D00860
                          STO     USERR+2                               U2D00870
                          SLA     16                                    U2D00880
                          STO     CHAR      SET CHAR CNT TO ZERO        U2D00890
                          MDX  L  +50,1     INCR THE ISS COUNTER        U2D00900
                          NOP               MAY SKIP                    U2D00910
                    *                       INITIATE  I/O OPERATION     U2D00920
                          LD      DEVIC                                 U2D00930
                          STO     BUSY      SET  ROUTINE BUSY INDICATOR U2D00940
                          BSC     E                                     U2D00950
                          MDX     WRIT                                  U2D00960
                          XIO     READS     START  READER               U2D00970
                    MAINR MDX   1 3         SET XR1 TO SKIP 3 PARAMS    U2D00980
                          MDX     RESET     RETURN TO MAINLINE          U2D00990
                    *                                                   U2D01000
                    *CONSTANTS                                          U2D01010
                    *                                                   U2D01020
                    FCRD  DC      /0002     READ  FUNCTION              U2D01030
                    TWO   EQU     FCRD      DEFINE A CONSTANT OF 2      U2D01040
                    FCPN  DC      /0001     PUNCH  FUNCTION             U2D01050
                    DEVIC DC      0         ODD  = PUNCH, EVEN = READ   U2D01060
                    H0F00 DC      /0F00     ISOLATE CHECK DIGIT         U2D01070
                    H0100 DC      /0100     ONE AS THIRD HEX DIGIT      U2D01080
                    *                                                   U2D01090
                    *INITIATE THE PUNCH OPERATION                       U2D01100
                    *                                                   U2D01110
                    WRIT  LD   L  *-*       GET FIRST WD FROM I/O AREA  U2D01120
                    IOAR  EQU     *-1                                   U2D01130
                          STO     BUF       PUT IN BUFFER FOR O/P       U2D01140
                          MDX  L  CHAR,1    ADD  1 TO CHARACTER COUNT   U2D01150
                          XIO     IOCC       PUNCH FIRST CHARACTER      U2D01160
                          MDX     MAINR     RETURN TO MAINLINE          U2D01170
                    ERRD  LD      C3000     DEVICE  NOT READY ERROR     U2D01180
                          MDX     ERRET     EXIT TO CORE LOC 41         U2D01190
                    *                                                   U2D01200
                    *CONSTANTS AND BUFFER AREA                          U2D01210
                    *                                                   U2D01220
                    WDCNT DC      0         WORD  COUNT                 U2D01230
                    CHAR  DC      0         CHARACTER  COUNT            U2D01240
                    BUF   DC      0         CONTAINS  WORD FOR I/O      U2D01250
                          BSS  E  0                                     U2D01260
                    SENSE DC      0         SENSE DEVICE STATUS WD WITH U2D01270
                          DC      /1F01     RESET- CONTROL WD           U2D01280
                    READS DC      0         START READER CONTROL WORD   U2D01290
                          DC      /1C10                                 U2D01300
                    IOCC  DC      BUF       READ  OR PUNCH CONTROL WORD U2D01310
                          DC      0                                     U2D01320
                    IOCC2 DC      BUF2                                  U2D01330
                          DC      0                                     U2D01340
                    BUSY  EQU     SENSE     ZERO=NOT BUSY,NON-ZERO=BUSY U2D01350
                    CHECK EQU     READS     ZERO=NO CHECK MODE          U2D01360
                    *                       NON-ZERO= CHECK MODE        U2D01370
                    $PST4 EQU     /8D       POST-OPERATIVE ERROR TRAP   U2D01380
                    C3000 DC      /3000     DVC  NOT RDY ERROR CODE     U2D01390
                    *************************************************** U2D01400
                    *                                                 * U2D01410
                    *   THIS PORTION OF THE PROGRAM IS CALLED BY      * U2D01420
                    *   INTERPT LEVEL 4, AND SERVICES THE OP COMPLETE * U2D01430
                    *   INTERPTS WHICH OCCUR AFTER THE DEVICE HAS     * U2D01440
                    *   READ OR PUNCHED ONE CHAR. IF AN ERROR HAS     * U2D01450
                    *   OCCURRED,THE PROGRAM EXITS TO THE USER-WRITTEN* U2D01460
                    *   ERROR ROUTINE.                                * U2D01470
                    *                                                   U2D01480
                    *************************************************** U2D01490
                    *THIS SECTION CALLS THE USERS ERROR RTN. IF HE      U2D01500
                    *RETURNS ZERO IN THE A REG, TERMINATE IMMEDIATELY.  U2D01510
                    *                                                   U2D01520
                    USERR DC      0                                     U2D01530
                          BSI  L  0         USERS  ERROR EXIT           U2D01540
                          BSC  I  USERR,Z   RETURN TO TRY AGAIN         U2D01550
                          MDX     IRET      TERMINATE IF A REG=ZERO     U2D01560
                    IPRG  XIO     SENSE     SENSE  AND RESET            U2D01570
                    *        READ ERROR WAS HANDLED RIGHT AFTER         U2D01580
                    *        CHARACTER WAS READ                         U2D01590
                          SLA     1                                     U2D01600
                          BSC  L  READI,+Z  READER  SERVICE REQUEST     U2D01610
                    *                                                   U2D01700
                    *THIS SECTION IS ENTERED ASSUMING A PUNCH SERVICE   U2D01710
                    *REQUEST. IT IS ASSUMED THAT ALL IS READY TO        U2D01720
                    *INITIATE ANOTHER PUNCH OPERATION.                  U2D01730
                    *                                                   U2D01740
                          BSI     CHKS      CHECK FOR STOP CHAR         U2D01750
                          LD      CHAR      GET CHARACTER COUNT         U2D01760
                          BSC  L  ODDC,E    BR IF ODD TO PNCH 2ND CHAR  U2D01770
                    *                                                   U2D01780
                    *AN EVEN CHAR COUNT MEANS A COMPLETE WD HAS BEEN    U2D01790
                    *PUNCHED.                                           U2D01800
                    *                                                   U2D01810
                          SLA     16        ZERO THE CHAR CNT           U2D01820
                          STO     CHAR                                  U2D01830
                          MDX  L  WDCNT,-1  DECREMENT  WORD COUNT       U2D01840
                          MDX     NEXT      GO PNCH NEXT CHAR           U2D01850
                    *                                                   U2D01860
                    *THIS SECTION DOES A FINAL EXIT ON ZERO WD CNT OR   U2D01870
                    *ON A STOP CHAR.                                    U2D01880
                    *                                                   U2D01890
                    IRET  SLA     16        TURN OFF BUSY INDR          U2D01900
                          STO     BUSY      TURN  OFF BUSY              U2D01910
                          MDX  L  +50,-1    DECR ISS COUNTER            U2D01920
                          NOP               MAY SKIP                    U2D01930
                          BSC  I  INT1      RETURN  TO MAINLINE         U2D01940
                    *                                                   U2D01950
                    *THIS SECTION INITIATES THE NEXT PUNCH              U2D01960
                    *                                                   U2D01970
                    NEXT  MDX  L  IOAR,1    INCR I/O AREA ADDR TO       U2D01980
                          LD   I  IOAR      GET NEXT WORD               U2D01990
                          STO     BUF       NEXT  WORD IS IN BUF        U2D02000
                          XIO     SENSE     IS  PUNCH READY             U2D02010
                          SLA     7                                     U2D02020
                          BSC  L  X2,-      YES,GO PUNCH                U2D02030
                          LD      H0004     NO,LD ERROR CODE AND EXIT   U2D02040
                          BSI     USERR     TO USERS ERROR RTN          U2D02050
                          LD      C3000                                 U2D02060
                          BSI  L  $PST4                                 U2D02070
                          MDX     NEXT+5    IF RETRY,GO SENSE PUNCH     U2D02080
                    H0004 DC      /0004     PUNCH NOT READY ERROR CODE  U2D02090
                    X2    MDX  L  CHAR,1    INCR CHAR COUNT             U2D02100
                          XIO     IOCC      PUNCH  1 CHARACTER          U2D02110
                          MDX     IRET+5    RETURN  TO MAINLINE         U2D02120
                    *                                                   U2D02130
                    *CHAR COUNT IS ODD,SO PUNCH SECOND CHAR OF WORD     U2D02140
                    *                                                   U2D02150
                    ODDC  LD      BUF       PUT SECOND CHAR IN POSITION U2D02160
                          SLA     8         TO BE PUNCHED               U2D02170
                          MDX     NEXT+4    RET TO PUT INTO BUF         U2D02180
                    *                                                   U2D02190
                    *THIS SECTION IS ENTERED IN RESPONSE TO A READER    U2D02200
                    *SERVICE REQUEST. NO READ ERRORS CAN BE DETECTED.   U2D02210
                    *                                                   U2D02220
                    *                       READ  SERVICE REQUEST       U2D02230
                    READI SLA     16        CLEAR BUFFER WORD           U2D02240
                          STO     BUF                                   U2D02250
                          XIO     IOCC      READ  1 CHARACTER           U2D02260
                          XIO     SENSE     SENSE  AND RESET            U2D02270
                          LD      CHECK     IS IT CHK MODE              U2D02360
                          BSC  L  NODEL,+-  NO,GO STORE CHAR            U2D02370
                          LD      BUF       YES,CHK FOR DELETE CODE     U2D02380
                          S    L  DEL       IF DELETE,DO NOT STORE.     U2D02390
                          BSC  L  ODDCR+1,+-                            U2D02400
                    NODEL MDX  L  CHAR,1    ADD  1 TO CHARACTER COUNT   U2D02410
                          LD      CHAR      CHK PARITY OF CHAR CNT TO   U2D02420
                          BSC  L  ODDC2,E   REF 1ST OR 2ND HALF OF WD.  U2D02430
                    *                                                   U2D02440
                    *EVEN CHAR COUNT MEANS SECOND CHAR OD THE WORD WAS  U2D02450
                    *JUST READ.                                         U2D02460
                    *                                                   U2D02470
                          SLA     16        SET CHAR CNT TO ZERO        U2D02480
                          STO     CHAR                                  U2D02490
                          LD      BUF       GET CHAR JUST READ          U2D02500
                          SRA     8         PUT IN RT HALF OF A REG     U2D02510
                          OR   I  IOAR      COMBINE  2 CHARACTERS INTO  U2D02520
                          STO  I  IOAR      * ONE WORD                  U2D02530
                          MDX  L  WDCNT,-1  DECREMENT  WORD COUNT       U2D02540
                          MDX     *+1                                   U2D02550
                          MDX     IRET      RETURN  ON ZERO WORD COUNT  U2D02560
                          MDX  L  IOAR,1    INCR I/O AREA ADDR-NEXT WD  U2D02570
                    *                                                   U2D02580
                    *THIS SECTION STARTS THE READER.                    U2D02590
                    *                                                   U2D02600
                    ODDCR BSI     CHKS      CHK FOR STOP CHAR           U2D02610
                          XIO     SENSE     IS  READER READY            U2D02620
                          SLA     5                                     U2D02630
                          BSC  L  X1,-      YES,GO START READER         U2D02640
                          LD      H0005                                 U2D02650
                          BSI     USERR     NO, EXIT TO USERS ERROR RTN U2D02660
                          LD      C3000                                 U2D02670
                          BSI  L  $PST4                                 U2D02680
                          MDX     ODDCR+1   RETRY-- GO SENSE READER     U2D02690
                    H0005 DC      /0005     READER NOT RDY ERROR CODE   U2D02700
                    X1    XIO     READS     START  READER               U2D02710
                          MDX     IRET+5    RETURN  TO MAINLINE         U2D02720
                    *                                                   U2D02730
                    *ODD CHAR CNT MEANS FIRST CHAR OF WD WAS JUST READ. U2D02740
                    *                                                   U2D02750
                    ODDC2 LD      BUF       STORE CHAR IN FIRST HALF    U2D02760
                          STO  I  IOAR      OF THE O/P WD.              U2D02770
                          MDX     ODDCR     GO START READER             U2D02780
                    *                                                   U2D02790
                    *THIS SECTION DOES A CHECK FOR A STOP CHARACTER.    U2D02800
                    *                                                   U2D02810
                    CHKS  DC      0         SAVE RET ADDR               U2D02820
                          LD      CHECK     IS IT CHK MODE              U2D02830
                          BSC  I  CHKS,+-   NO, RETURN                  U2D02840
                          LD   L  BUF       YES,CONTINUE WITH CHK       U2D02850
                          SRA     8                                     U2D02860
                          S    L  STOP      IS IT A STOP CHAR           U2D02870
                          BSC  I  CHKS,Z    NO, RETURN                  U2D02880
                          MDX     IRET      YES, TERMINATE              U2D02890
                    BUF2  DC      0         DELETE O/P BUFFER           U2D02900
                    *                                                   U2D02920
                    *THIS SECTION PUNCHES A DELETE CHAR IF CHK MODE.    U2D02930
                    *                                                   U2D02940
                          END                                           U2D02950
