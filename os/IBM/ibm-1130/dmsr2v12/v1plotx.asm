                          HDNG    PLOTX, FORTRAN PLOTTING I/O SUBR      V1L00010
                    *************************************************** V1L00020
                    *STATUS - VERSION 2, MODIFICATION 7               * V1L00030
                    *SUBROUTINE REWRITTEN IN MOD 7                    * V1L00040
                    *                                                 * V1L00050
                    *SUBROUTINE NAME -                                * V1L00060
                    *   FULL NAME - IBM 1627 PLOTTER I/O SUBROUTINE   * V1L00070
                    *               FOR USE INDIRECTLY FROM FORTRAN   * V1L00080
                    *   CODE NAME - PLOTX                             * V1L00090
                    *                                                 * V1L00100
                    *PURPOSE -                                        * V1L00110
                    *   THIS ISS SUBROUTINE DRIVES THE IBM 1627       * V1L00120
                    *   PLOTTER.                                      * V1L00130
                    *                                                 * V1L00140
                    *METHOD -                                         * V1L00150
                    *   PLOTX MAINTAINS A CIRCULAR BUFFER TO          * V1L00160
                    *   ACCUMULATE PLOTTER COMMANDS.  PIN IS THE      * V1L00170
                    *   ADDRESS OF THE NEXT WORD TO RECEIVE A COMMAND * V1L00180
                    *   AND POUT IS THE ADDRESS OF THE NEXT COMMAND   * V1L00190
                    *   TO BE OUTPUT TO THE PLOTTER.                  * V1L00200
                    *   IF PIN = POUT, THEN THE BUFFER IS EMPTY.      * V1L00210
                    *   ALTHOUGH ALL WORDS OF THE BUFFER ARE USED, AT * V1L00220
                    *   LEAST 1 WORD MUST BE UNUSED AT ANY TIME (OR   * V1L00230
                    *   ELSE THE BUFFER WOULD APPEAR TO BE EMPTY WHEN * V1L00240
                    *   PIN CIRCLES AROUND AND CATCHES UP WITH POUT). * V1L00250
                    *   THE MAINLINE AND INTERRUPT PORTIONS OF THIS   * V1L00260
                    *   SUBROUTINE WORK ASYNCHRONOUSLY.  IF ALL       * V1L00270
                    *   PREVIOUS ACTION IN THE INTERRUPT PORTION HAS  * V1L00280
                    *   CEASED, THEN THE MAINLINE ENTERS THE INTERRUPT* V1L00290
                    *   PORTION AND INITIATES THE FIRST NEW PLOTTER   * V1L00300
                    *   COMMAND.                                      * V1L00310
                    *                                                 * V1L00320
                    *CAPABILITIES AND LIMITATIONS -                   * V1L00330
                    *   VALID ARGUMENTS -                             * V1L00340
                    *      ANY NUMBER FROM 0 TO 9 IN BITS 12-15.      * V1L00350
                    *      ANY OTHER NUMBER IS COMPLETELY IGNORED.    * V1L00360
                    *                                                 * V1L00370
                    *SPECIAL FEATURES -                               * V1L00380
                    *   INTERNAL CIRCULAR BUFFER THAT SAVES DATA FROM * V1L00390
                    *   MANY CALLS AND SO SMOOTHS OPERATION OF PLOTTER* V1L00400
                    *                                                 * V1L00410
                    *EXTERNAL REFERENCES -                            * V1L00420
                    *   $IOCT                                         * V1L00430
                    *   $PRET                                         * V1L00440
                    *   $PST3                                         * V1L00450
                    *                                                 * V1L00460
                    *ADDITIONAL INFORMATION -                         * V1L00470
                    *   ERROR PROCEDURES -                            * V1L00480
                    *      BRANCH TO $PRET OR $PST3 IF PLOTTER        * V1L00490
                    *      NOT READY                                  * V1L00500
                    *   CALLING SEQUENCE -                            * V1L00510
                    *      LIBF    PLOTX    SUBROUTINE CALL           * V1L00520
                    *      DC      /XXXD    D IS 0 TO 9, X IS IGNORED * V1L00530
                    *************************************************** V1L00540
                    *     EJCT        BLK REMOVED                       V1L00550
                          LIBR                                          V1L00560
                    1130  ISS  07 PLOTX     3                           V1L00570
                    $PRET EQU     /0028     PRE-OP ERROR TRAP           V1L00580
                    $IOCT EQU     /0032     MONITOR I/O COUNTER         V1L00590
                    $PST3 EQU     /0089     LEVEL 3 ERROR TRAP          V1L00600
                    *                                                   V1L00610
                    PLOTX STX   1 XR1+1     LIBF ENTRANCE               V1L00620
                          LDX  I1 *-*       LIBF+1 INTO XR1             V1L00630
                          MDX     START                                 V1L00640
                    INT   DC      *-*       INTERRUPT ENTRANCE          V1L00650
                          MDX     INTR      BRANCH TO HANDLE INTERRUPT  V1L00660
                    *                                                   V1L00670
                    *                                                   V1L00680
                    *************************************************** V1L00690
                    *                                                   V1L00700
                    *     PERFORM HOUSEKEEPING AND ACCEPT               V1L00710
                    *     INPUT PARAMETER                               V1L00720
                    *                                                   V1L00730
                    *************************************************** V1L00740
                    *                                                   V1L00750
                    *                                                   V1L00760
                    START STS     XR1+2     SAVE STATUS                 V1L00770
                          STO     SAVA      SAVE ACCUMULATOR            V1L00780
                    *                                                   V1L00790
                          MDX   1 1                                     V1L00800
                          STX   1 RETML+1   STORE RETURN ADDRESS        V1L00810
                    *                                                   V1L00820
                          LD    1 -1        LOAD INPUT PARAMETER        V1L00830
                          AND     H000F     IGNORE 1ST 12 BITS          V1L00840
                    *                                                   V1L00850
                          STO     PARA      STORE PARAMETER             V1L00860
                          S       H0009     IS IT LEGAL                 V1L00870
                          BSC  L  PUT,+     YES, BRANCH                 V1L00880
                    *                                                   V1L00890
                    *                                                   V1L00900
                    *************************************************** V1L00910
                    *                                                   V1L00920
                    *                  EXIT ROUTINE                     V1L00930
                    *                                                   V1L00940
                    *************************************************** V1L00950
                    *                                                   V1L00960
                    *                                                   V1L00970
                    EXITM LD      SAVA      RESTORE ACCUMULATOR         V1L00980
                    XR1   LDX  L1 *-*       RESTORE XR1                 V1L00990
                          LDS     0         RESTORE STATUS              V1L01000
                    RETML BSC  L  *-*       RETURN TO CALLER            V1L01010
                    *                                                   V1L01020
                    *                                                   V1L01030
                    *************************************************** V1L01040
                    *                                                   V1L01050
                    *             MAINLINE OF PLOTX                     V1L01060
                    *                                                   V1L01070
                    *************************************************** V1L01080
                    *                                                   V1L01090
                    *                                                   V1L01100
                    PUT   LD      PIN       SET PIN TEMPORARY           V1L01110
                          A       H0001     *TO                         V1L01120
                          STO     PINT      *PIN + 1                    V1L01130
                    *                                                   V1L01140
                          S       PEND      IS PINT BEYOND END OF       V1L01150
                          BSC  L  FULL,+    *BUFFER, BR IF NOT          V1L01160
                    *                                                   V1L01170
                          LD      PSTRT     SET PINT TO ADDR OF         V1L01180
                          STO     PINT      *START OF I/O BUFFER        V1L01190
                    *                                                   V1L01200
                    FULL  LD      PINT      IS CIRCULAR BUFFER          V1L01210
                          S       POUT      *ALREADY FULL               V1L01220
                          BSC  L  FULL,+-   YES, BR TO WAIT FOR ROOM    V1L01230
                    *                                                   V1L01240
                          LD      PARA      GET 1627 PLOTTER            V1L01250
                          A       TABLE     *CONTROL WORD               V1L01260
                          STO     *+1       *CORRESPONDING TO           V1L01270
                          LD   L  *-*       *ARGUMENT DIGIT             V1L01280
                          STO  I  PIN       STORE IN BUFFER AT PIN ADDR V1L01290
                    *                                                   V1L01300
                          LD      PINT      ADVACE PIN ADDR TO SHOW NEW V1L01310
                          STO     PIN       *DATA NOW IN BUFFER         V1L01320
                    *                                                   V1L01330
                          MDX  L0 BUSY,0    IS THIS SUBROUTINE BUSY     V1L01340
                          MDX     EXITM     YES, BR TO RETURN           V1L01350
                          MDX     SCAN      NO, BR TO INITIATE I/O      V1L01360
                    *                                                   V1L01370
                    *                                                   V1L01380
                    *************************************************** V1L01390
                    *                                                   V1L01400
                    *           INTERRUPT SERVICING ROUTINE             V1L01410
                    *                                                   V1L01420
                    *************************************************** V1L01430
                    *                                                   V1L01440
                    *                                                   V1L01450
                    INTR  SRA     16        RESET THIS SUBROUTINE BUSY  V1L01460
                          STO     BUSY      *INDICATOR TO 0             V1L01470
                    *                                                   V1L01480
                          XIO     SENSR-1   SENSE PLOTTER DSW RESET     V1L01490
                          STO     INTER     SET INTERRUPT ENTRY INDR    V1L01500
                    *                                                   V1L01510
                          MDX  L  $IOCT,-1  DECREMENT MONITOR I/O CNT   V1L01520
                          NOP               MAY SKIP                    V1L01530
                    *                                                   V1L01540
                          LD      POUT      IS BUFFER                   V1L01550
                          S       PIN       *EMPTY                      V1L01560
                          BSC  L  CONT,+-   YES, BR TO RETURN           V1L01570
                    *                                                   V1L01580
                    SCAN  LD      POUT      SAVE OLD POUT ADDR WHICH    V1L01590
                          STO     WRITE     *ALSO SETS SUBR BUSY ON     V1L01600
                    *                                                   V1L01610
                          A       H0001     INCREMENT POUT ADDR         V1L01620
                          STO     POUT      *BY 1                       V1L01630
                    *                                                   V1L01640
                          S       PEND      POUT ADDY BEYOND END BUFFER V1L01650
                          BSC  L  LOOPS,+   NO, BR TO CONTINUE          V1L01660
                    *                                                   V1L01670
                          LD      PSTRT     RESET POUT ADDR TO START    V1L01680
                          STO     POUT      *OF CIRCULAR BUFFER         V1L01690
                    *                                                   V1L01700
                    LOOPS XIO     SENSE-1   SENSE PLOTTER DSW           V1L01710
                          BSC  L  NTRDY,E   BR IF NOT READY             V1L01720
                    *                                                   V1L01730
                          MDX  L0 $IOCT,1   INCREMENT MONITOR I/O CNT   V1L01740
                          NOP               MAY SKIP IF VALUE INVALID   V1L01750
                    *                                                   V1L01760
                          XIO     WRITE     EXECUTE PLOTTING COMMAND    V1L01770
                    *                                                   V1L01780
                    CONT  LD      INTER     IS THIS INTERRUPT ENTRY     V1L01790
                          BSC  L  EXITM,+-  NO, BR TO MAINLINE RETURN   V1L01800
                    *                                                   V1L01810
                          SRA     16        RESET INTERRUPT ENTRY       V1L01820
                          STO     INTER     *INDICATOR                  V1L01830
                    *                                                   V1L01840
                          BSC  I  INT       RETURN FROM INTERRUPT       V1L01850
                    *                                                   V1L01860
                    NTRDY LD      INTER     IS THIS INTERRUPT ENTRY     V1L01870
                          BSC  L  PREOP,+-  NO, BR TO MAINLINE TRAP     V1L01880
                    *                                                   V1L01890
                          LD      H7000     LOAD NOT READY ERROR CODE   V1L01900
                          BSI  L  $PST3     BR TO POST-OP ERROR TRAP    V1L01910
                          MDX     LOOPS     BR TO TRY AGAIN             V1L01920
                    *                                                   V1L01930
                    PREOP LD      H7000     LOAD NOT READY ERROR CODE   V1L01940
                          BSI  L  $PRET     BR TO PRE-OP ERROR TRAP     V1L01950
                          MDX     LOOPS     BR TO TRY AGAIN             V1L01960
                    *                                                   V1L01970
                    *                                                   V1L01980
                    *************************************************** V1L01990
                    *                                                   V1L02000
                    *       CONSTANTS AND WORKING STORAGE               V1L02010
                    *                                                   V1L02020
                    *************************************************** V1L02030
                    *                                                   V1L02040
                    *                                                   V1L02050
                          BSS  E  0                                     V1L02060
                    SAVA  DC      0         HOLDS SAVED ACCUMULATOR     V1L02070
                    SENSE DC      /2F00     SENSE PLOTTER IOCC          V1L02080
                    PARA  DC      *-*       HOLDS PARAMETER             V1L02090
                    SENSR DC      /2F01     SENSE PLOTTER DSW RESET     V1L02100
                    WRITE DC      *-*       PUT POUT IN HERE            V1L02110
                    BUSY  EQU     *-1       THIS SUBROUTINE BUSY INDR   V1L02120
                          DC      /2900     WRITE PLOTTER IOCC          V1L02130
                    H0001 DC      /0001     CONSTANT                    V1L02140
                    H0009 DC      /0009     CONSTANT                    V1L02150
                    H000F DC      /000F     CONSTANT                    V1L02160
                    H7000 DC      /7000     PLOTTER NOT READY CODE      V1L02170
                    INTER DC      *-*       INTERRUPT ENTRY INDICATOR   V1L02180
                    *                                                   V1L02190
                    CNT   EQU     11        SIZE OF BUFFER              V1L02200
                    PINT  DC      *-*       PIN TEMPORARY STORAGE       V1L02210
                    PSTRT DC      BUF       ADDR START OF BUFFER        V1L02220
                    PIN   DC      BUF       ADDR NEXT WORD INPUT        V1L02230
                    POUT  DC      BUF       ADDR NEXT WORD OUTPUT       V1L02240
                    PEND  DC      BUF+CNT-1 ADDR LAST WORD OF BUFFER    V1L02250
                    BUF   BSS     CNT       CIRCULAR I/O BUFFER         V1L02260
                    *                                                   V1L02270
                    *                       CONTROL CODES FOR PLOTTER   V1L02280
                    *                                                   V1L02290
                    TABLE DC      CNTRL     BASE ADDR TO CONTROL TABLE  V1L02300
                    CNTRL DC      /8000     0     PEN DOWN              V1L02310
                          DC      /0800     1     +Y                    V1L02320
                          DC      /4800     2     +X +Y                 V1L02330
                          DC      /4000     3     +X                    V1L02340
                          DC      /5000     4     +X -Y                 V1L02350
                          DC      /1000     5     -Y                    V1L02360
                          DC      /3000     6     -X -Y                 V1L02370
                          DC      /2000     7     -X                    V1L02380
                          DC      /2800     8     -X +Y                 V1L02390
                          DC      /0400     9     PEN UP                V1L02400
                          END                                           V1L02410
