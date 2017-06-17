                          HDNG    PRNT3,LIBRARY SUBR FOR 1403 PRINTER   U2K00010
                    *************************************************** U2K00020
                    *STATUS - VERSION 2  MODIFICATION 11              * U2K00030
                    *                                                 * U2K00035
                    *FUNCTION/OPERATION- THIS IS A LIBRARY SUBROUTINE * U2K00040
                    *FOR THE 1130 DISK MONITOR VERSION 2.THIS SUBR.   * U2K00050
                    *SUPPORTS THE 1403 PRINTER. ALL 1403 PRINTER      * U2K00060
                    *FUNCTION SUCH AS PRINTING,SPACING AND SKIPPING   * U2K00070
                    *INTERRUPT SERVICE SUBROUTINE(ISS) AND IS         * U2K00080
                    *ORGANIZED IN TWO SECTIONS-- A CALL PORTION AND AN* U2K00090
                    *INTERRUPT PORTION.IN THE CALL PORTION THE FUNC-  * U2K00100
                    *TION IS ANALYZED AND THE REQUIRED OPERATION(S)   * U2K00110
                    *INITIATED.THE INTERRUPT PORTION THE THREE 1403   * U2K00120
                    *INTERRUPTS,TRANSFER COMPLETE,PRINT COMPLETE AND  * U2K00130
                    *CARRIAGE,ARE SERVICED                            * U2K00140
                    *                                                 * U2K00150
                    *ENTRY POINTS-                                    * U2K00160
                    *     *PRNT3,THIS IS THE ENTRY FOR THE CALL       * U2K00170
                    *      PORTION,THE CALLING SEQUENCE USED BY THE   * U2K00180
                    *      USER IS THE STANDARD ISS LIBF STATEMENT.FOR* U2K00190
                    *      A PRINT FUNCTION THE CALLING SEQUENCE IS-  * U2K00200
                    *          *LIBF    PRNT3                         * U2K00210
                    *           DC      /2000 (CONTROL PARAMETER)     * U2K00220
                    *           DC      /AREA (ADDRESS OF I/O AREA)   * U2K00230
                    *           DC      ERROR (ADDRESS OF ERROR SUBR) * U2K00240
                    *     *W3020--THIS IS THE INTERRUPT ENTRANCE FROM * U2K00250
                    *      THE SYSTEM ILS SUBROUTINE.                 * U2K00260
                    *                                                 * U2K00270
                    *INPUT-A WORD-COUNT PRECEDING DATA TO BE PRINTED  * U2K00280
                    *ARRANGED IN 1403 PRINTER CODE.                   * U2K00290
                    *                                                 * U2K00300
                    *OUTPUT-A PRINTED LINE AND ONE SPACE(PRINT FUNC)  * U2K00310
                    *                                                 * U2K00320
                    *EXTERNAL REFERENCES-THE FOLLOWING WORDS IN COMMA * U2K00330
                    *ARE REFERENCED--                                 * U2K00340
                    *     $PRET   PRE-OPERATIVE ERROR TRAP            * U2K00350
                    *     $IOCT   IOCS COUNTER                        * U2K00360
                    *     $PST4   LEVEL 4 POST-OPERATIVE ERROR TRAP   * U2K00370
                    *                                                 * U2K00380
                    *EXITS- NORMAL                                    * U2K00390
                    *     *CALL PORTION-- W3160 RETURN TO USER PROGRAM* U2K00400
                    *     *INTERRUPT PORTION--W3800 RETURN TO ILS     * U2K00410
                    *     - ERROR                                     * U2K00420
                    *     *CALL PORTION--W3420 AND W3440 PRE-OPERATIVE* U2K00430
                    *      ERROR EXITS TO $PRET.                      * U2K00440
                    *     *INTERRUPT PORTION--W3780,TO USER ERROR SUBR* U2K00450
                    *                                                 * U2K00460
                    *TABLES,WORK AREAS- W3920,A 60-WORD OUTPUT BUFFER * U2K00470
                    *INTO WHICH THE USERS MESSAGE IS TRANSFERRED.     * U2K00480
                    *ALL PRINTING IS DONE FROM THIS OUTPUT BUFFER.    * U2K00490
                    *                                                 * U2K00500
                    *ATTRIBUTES-REUSABLE                              * U2K00510
                    *                                                 * U2K00520
                    *NOTES--SINCE THE 1403 ALWAYS PRINTS A FULL LINE  * U2K00530
                    *OF 120 CHARACTERS,THIS SUBROUTINE STORES THE     * U2K00540
                    *USERS MESSAGE INTO ITS OWN BUFFER TO THE LIMIT   * U2K00550
                    *OF THE USERS WORD-COUNT,THE REMAINDER OF THE     * U2K00560
                    *BUFFER IS PADDED WITH 1403 BLANK CHARACTERS.     * U2K00570
                    *                                                 * U2K00580
                    *************************************************** U2K00590
                          LIBR                                          U2K00600
                          ISS  09 PRNT3     4                           U2K00610
                    *     *                                             U2K00620
                    PRNT3 STX   1 W3060+1   SAVE CONTENTS OF XR1.       U2K00630
                          LDX  I1 *-*       LOADER STORES TV ADDRESS.   U2K00640
                          MDX     W3020     BRANCH TO CALL PROCESSING.  U2K00650
                    W3010 DC      *-*       INTERRUPT ENTRANCE.         U2K00660
                          BSC  L  W3500     BR. TO INTRPT PROCESSING.   U2K00670
                    *************************************************** U2K00680
                    *                                                 * U2K00690
                    *     PRINT3 CALL PROCESSING.                     * U2K00700
                    *                                                 * U2K00710
                    *************************************************** U2K00720
                    W3020 STX   2 W3050+1   SAVE CONTENTS OF XR2.       U2K00730
                          STS     W3070     SAVE STATUS OF INDICATORS.  U2K00740
                          STD     W3905     SAVE CONTENTS OF ACC/EXT.   U2K00750
                    **                                              2-4 U2K00760
                    * CHECK PRINTER READY                           2-4 U2K00770
                    **                                              2-4 U2K00780
                          XIO     W3920     SENSE DSW WITHOUT RESET 2-4 U2K00790
                          BSC  L  W3210,E   BR IF NOT READY         2-4 U2K00800
                    **                                                  U2K00810
                    * CHECK TO SEE IF FUNCTION IS TEST.                 U2K00820
                    **                                                  U2K00830
                          LD    1 0         LOAD CONTROL PARAMETER.     U2K00840
                          SRT     12        EXAMINE FUNCTION CODE.      U2K00850
                          BSC  L  W3090,Z   BR IF FUNCTION IS NOT TEST. U2K00860
                          MDX  L  W3935,0   SKIP IF ROUTINE IS NOT BUSY U2K00870
                    W3030 MDX   1 -1                                    U2K00880
                          MDX   1 2                                     U2K00890
                    **                                                  U2K00900
                    * THE FOLLOWING INSTRUCTIONS RESET THE REGISTERS    U2K00910
                    * PRIOR TO RETURNING TO THE USERS MAINLINE.         U2K00920
                    **                                                  U2K00930
                          LDD     W3905     RESTORE ACCUMULATOR AND EXT U2K00940
                    W3040 STX   1 W3080+1   STORE RETURN ADDRESS.       U2K00950
                    W3050 LDX  L2 *-*       RESET XR2 TO ORIG CONTENTS. U2K00960
                    W3060 LDX  L1 *-*       RESET XR1 TO ORIG CONTENTS. U2K00970
                    W3070 LDS     *-*       RESTORE OVERFLOW AND CARRY. U2K00980
                    W3080 BSC  L  *-*       RETURN TO USER.             U2K00990
                    **                                              2-3 U2K00991
                    * CHECK PRINTER READY AND ROUTINE BUSY          2-3 U2K00992
                    **                                              2-3 U2K00993
                    W3085 DC      *-*                               2-3 U2K00994
                    W3087 XIO     W3920     SENSE THE DSW           2-3 U2K00995
                          BSC  L  W3210,E   BR IF PRINTER NOT READY 2-3 U2K00996
                          MDX  L  W3935,0   SKIP IF RTN IS NOT BUSY 2-3 U2K00997
                          MDX     W3087     RTN BUSY GO CHECK READY 2-3 U2K00998
                          BSC  I  W3085     RETURN                  2-3 U2K00999
                    **                                                  U2K01000
                    * CHECK TO SEE IF FUNCTION IS LEGAL.                U2K01010
                    **                                                  U2K01020
                    W3090 LDX   2 16                                    U2K01030
                          SLCA  2                                       U2K01040
                          MDX   2 -1        SKIP IF FUNCTION CODE IS 1. U2K01050
                          MDX   2 -1        SKIP IF FUNCTION CODE LEGAL U2K01060
                          MDX     W3200     BRANCH TO PRE-OP ERROR EXIT U2K01070
                    *                       CHECK ROUTINE BUSY MOVED2-3 U2K01080
                          SLA     2                                     U2K01140
                          BSI     W3085     CHECK RDY AND RTN BUSY  2-3 U2K01145
                          BSC     C         SKIP IF FUNCTION IS PRINT.  U2K01150
                          MDX     W3190     BR TO CONTROL PROCESSING.   U2K01160
                    **                                                  U2K01170
                    * SET UP AND INITIATE THE PRINT OPERATION.          U2K01180
                    **                                                  U2K01190
                          LD    1 1         LOAD ADDR OF USERS I/O AREA U2K01200
                          STO     W3130+1                               U2K01210
                          STO     W3120+1                               U2K01220
                          RTE     12        ISOLATE AND SAVE            U2K01230
                    W3100 SRA     12        * THIRD DIGIT OF            U2K01240
                          STO     W3920     *   CONTROL PARAMETER.      U2K01250
                          SRA     1         SHIFT OUT LOW ORDER BIT.    U2K01260
                          BSC  L  W3200,Z   BR IF ILLEGAL CHARACTER.    U2K01270
                          LDX   2 60        LOAD XR2 WITH BUFFER WD CNT U2K01280
                          LDD     W3915     FILL                        U2K01290
                    W3110 STD  L2 W3990-2   * OUTPUT                    U2K01300
                          MDX   2 -2        *   BUFFER                  U2K01310
                          MDX     W3110     *     WITH SPACES.          U2K01320
                    **                                                  U2K01330
                    * CHECK USERS WORD COUNT                            U2K01340
                    **                                                  U2K01350
                    W3120 LDX  I2 *-*       LOAD XR2 WITH WORD COUNT.   U2K01360
                          MDX   2 0         SKIP IF WORD COUNT IS ZERO. U2K01370
                          MDX   2 -60       SKIP IF WORD COUNT IS LEGAL U2K01380
                          MDX     W3200     BRANCH TO PRE-OP ERROR EXIT U2K01390
                          MDX   2 60        RESTORE XR2 TO WORD COUNT.  U2K01400
                          NOP               IN CASE OF SKIP.            U2K01410
                    *     *                                             U2K01420
                    W3130 LD   L2 *-*       MOVE USERS                  U2K01430
                          STO  L2 W3990-1   * MESSAGE                   U2K01440
                          MDX   2 -1        *   TO OUTPUT               U2K01450
                          MDX     W3130     *     BUFFER.               U2K01460
                    *     *                                             U2K01470
                          LD    1 2         STORE ADDR OF USERS ERR RTN U2K01480
                          STO  L  W3580+1   *IN INTRPT PROCESSING AREA. U2K01490
                          BSI     W3085     CHK RDY AND RTN BSY     2-4 U2K01500
                          BSI     W3300     BR TO INCR BUSY/IOCT CNT2-3 U2K01505
                          XIO     W3940     INITIATE PRINT OPERATION.   U2K01510
                          MDX   1 2         SET TO EXIT AT LIBF +4      U2K01515
                          LD      W3930     IS THERE CONTROL AFTER PRNT U2K01520
                    W3140 BSC  L  W3030,+-  BR IF NO CONTROL AFTER PRNT U2K01540
                          LD      W3930     THIRD DIGIT TO ACC      2-4 U2K01560
                    **                                                  U2K01570
                    * SET UP THE CARRIAGE CONTROL FUNCTION REQUESTED BY U2K01580
                    * THE USER IN THE CARRIAGE CONTROL IOCC WORD - THEN U2K01590
                    * EXECUTE THE CONTROL FUNCTION.                     U2K01600
                    **                                                  U2K01610
                    W3150 A       W3985     SET UP FOR POSSIBLE         U2K01620
                          STO     W3160     *CARRIAGE SKIP.             U2K01630
                          S       W3100                                 U2K01640
                          BSC  L  W3170,Z-  BR IF CONTROL IS SPACING.   U2K01650
                          LD      W3980     SET UP                      U2K01660
                    W3160 SRA     *-*       * IOCC WORD                 U2K01670
                          STO     W3950     *   FOR SKIP.           2-2 U2K01680
                          S       W3925     SET                     2-5 U2K01682
                          BSC     +-        *SWITCH IF              2-5 U2K01684
                          STX     W3979     *SKIP TO CHANNEL 1      2-5 U2K01686
                          LDX   2 -2        SKIP OVER NEXT WORD.        U2K01690
                          LD      W3900     SET CARRIAGE CONTROL        U2K01700
                    W3170 STO     W3930     *COUNTER TO ONE.            U2K01710
                    * PREPARE RETURN FROM $PRET IF PRINTER NOT READY    U2K01711
                    W3180 STX   1 W3184+1   SAVE XR1                2-4 U2K01712
                          STX   2 W3185+1   SAVE XR2 TEMPORARY      2-9 U2K01714
                          STX     W3182+1   SET UP RETURN ADDRESS   2-9 U2K01715
                    W3182 LDX  L1 *-*       *FROM $PRET IF PRINTER  2-9 U2K01717
                          MDX   1 1         *SHOULD BE NOT READY    2-9 U2K01718
                          BSI     W3085     CHECK RDY AND RTN BUSY  2-4 U2K01720
                    W3184 LDX  L1 *-*       RESTORE XR1             2-4 U2K01725
                    W3185 LDX  L2 *-*       RESTORE XR2             2-5 U2K01726
                    *     *                                             U2K01730
                          BSI     W3300     BR TO INCR BUSY/IOCT CNT2-2 U2K01750
                          XIO  L2 W3950     INITIATE THE CONTROL FUNC.  U2K01760
                          MDX  L  W3930,-1  SKIP IF NO MORE CONTROL.    U2K01770
                          MDX     W3180     BRANCH FOR MORE CONTROL.    U2K01780
                          MDX     W3030     BRANCH TO RETURN TO USER    U2K01790
                    *     *                                             U2K01800
                    W3190 SLA     16         CLEAR ACC              2-3 U2K01805
                          SLT     4                                     U2K01810
                          BSC  L  W3150,Z   BR IF CONTROL IS IMMEDIATE. U2K01820
                          SLT     4         MOVE IN AND SAVE THIRD      U2K01830
                          STO     W3930     *DIGIT OF CONTROL PARAMETER U2K01840
                          MDX     W3030     BRANCH TO RETURN TO USER.   U2K01850
                    **                                                  U2K01860
                    * SET UP FOR PRE-OPERATIVE ERROR EXIT.              U2K01870
                    **                                                  U2K01880
                    W3200 LD      W3955     LOAD BAD CALL ERROR CODE.   U2K01890
                          MDX     *+1       SKIP OVER NEXT INSTRUCTION. U2K01900
                    W3210 LD      W3960     LOAD NOT READY ERROR CODE.  U2K01910
                          MDX   1 -1        PUT ADDRESS OF CALL IN XR1. U2K01920
                          STX  L1 $PRET     STORE CALL ADDR AT $PRET.   U2K01930
                          LDX   1 $PRET+1   SET UP EXIT TO $PRET+1.     U2K01940
                          MDX     W3040     BRANCH TO EXIT TO $PRET.    U2K01950
                    *     *                                             U2K01960
                    W3905 BSS  E  2         WORDS FOR SAVING ACC/EXT.   U2K01980
                    W3910 DC      /8600     POSSIBLE PRINT ERROR BITS.  U2K01990
                    W3915 DC      /7F7F     SPACE - 1403 CODE.          U2K02000
                    W3920 DC      *-*       SENSE                       U2K02010
                          DC      /AF00     *IOCC.                      U2K02020
                    W3925 DC      /0800     SKIP TO CH 1 CONTROL WORD.  U2K02030
                          DC      /AF01     WRD 2 OF SENSE W/RESET IOCC U2K02040
                    W3930 DC      *-*       AFTER PRINT CONTROL FLAG.   U2K02050
                    W3935 DC      *-*       ROUTINE BUSY INDICATOR.     U2K02060
                    W3940 DC      W3990     PRINT                       U2K02070
                          DC      /AD00     *IOCC.                      U2K02080
                    W3945 DC      W3950     CARRIAGE                    U2K02090
                          DC      /A900     *SKIP IOCC.                 U2K02100
                    W3950 DC      *-*       CARRIAGE                    U2K02110
                          DC      /AC00     *SPACE IOCC.                U2K02120
                    W3900 DC      1         CONSTANT OF DECIMAL ONE     U2K02125
                    W3955 DC      /9001     BAD CALL ERROR CODE.        U2K02130
                    W3960 DC      /9000     PRINTER NOT RDY ERROR CODE. U2K02140
                    W3970 DC      *-*       DSW TO CHECK AN INTRPT  2-3 U2K02160
                    W3975 DC      *-*       DSW SAVED FOR ERR CHECK 2-2 U2K02170
                    W3979 DC      *-*       CHANNEL 1 SWITCH        2-5 U2K02172
                    *                                               2-2 U2K02180
                    * SUBROUTINE FOR INCREMENTING BUSY AND IOCT CNTR2-2 U2K02190
                    *                                               2-2 U2K02200
                    W3300 DC      *-*       ENTRY POINT             2-2 U2K02210
                          MDX  L  W3935,1   INCREMENT RTN BUSY COUNTER. U2K02220
                          MDX  L  $IOCT,1   INCREMENT SYS I/O COUNTER.  U2K02230
                          BSC  I  W3300     RETURN                  2-2 U2K02240
                    *************************************************** U2K02250
                    *                                                 * U2K02260
                    *     PRNT3 INTERRUPT PROCESSING.                 * U2K02270
                    *                                                 * U2K02280
                    *************************************************** U2K02290
                    W3500 XIO     W3920     SENSE WITHOUT RESET     2-3 U2K02300
                          OR      W3975     COMBINE AND SAVE DSW    2-2 U2K02310
                          STO     W3975     *FOR ERR CHECKING       2-2 U2K02320
                          XIO     W3925     SENSE WITH RESET        2-3 U2K02324
                          STO     W3970     SAVE CURRENT DSW        2-3 U2K02325
                    *                                               2-2 U2K02330
                    * TRANSFER COMPLETE INTERRUPT                   2-2 U2K02340
                    *                                               2-2 U2K02350
                          SLA     1         CHECK IF TRANS COMP INTRPT. U2K02360
                          BSC  L  W3510,-   BR IF NOT TRANS COMP INTRPT U2K02370
                          LDX   2 1                                 2-2 U2K02380
                          LD   L  $1403     GET CHAN 9/12 INDIC    2-11 U2K02390
                          BSC  L  W3580,Z   *BR IF SENSED IN PREV OP2-2 U2K02400
                    W3505 LD      W3930     SEE IF USER WANTED TO       U2K02410
                          OR      W3920     *PRINT WITH SPACE SUPPRESS. U2K02420
                          BSC  L  W3510,Z   BR IF SPACE SUPPRESSED  2-2 U2K02430
                          LDX   2 3                                 2-2 U2K02440
                          MDX     W3590     BRANCH TO SPACE         2-2 U2K02450
                    *                                               2-2 U2K02460
                    * PRINT COMPLETE INTERRUPT                      2-2 U2K02470
                    *                                               2-2 U2K02480
                    W3510 LD      W3970     CHECK IF PR COMP INTRPT 2-3 U2K02490
                          SLA     2                                     U2K02500
                          BSC  L  W3550,-   BR IF NOT PRINT COMP INTRPT U2K02510
                          LDX   2 -1                                2-2 U2K02520
                          LD      W3975     GET THE DSW             2-2 U2K02530
                          AND     W3910     CHECK FOR ANY ERRORS.       U2K02540
                          BSC  L  W3570,Z   BR IF THERE WAS AN ERROR.   U2K02550
                    *                                                   U2K02560
                    W3520 MDX  L  W3935,-1  DECREMENT RTN BUSY COUNTER. U2K02570
                    W3980 NOP               IN CASE OF SKIP.            U2K02580
                          MDX  L  $IOCT,-1  DECREMENT SYS I/O COUNTER.  U2K02590
                    W3985 SRA     0         NOP - IN CASE OF SKIP.      U2K02600
                    *     *                                             U2K02610
                    *                                               2-2 U2K02620
                    * CARRAGE COMPLETE INTERRUPT                    2-2 U2K02630
                    *                                               2-2 U2K02640
                    W3550 LD      W3970     GET CURRENT DSW         2-3 U2K02650
                          SLA     3         CHECK IF CARRIAGE INT       U2K02680
                          BSC  I  W3010,-   BR IF NO CARRIAGE INT   2-2 U2K02690
                          LDX   2 3                                     U2K02700
                          STX   2 W3970     CLEAR CURRENT DSW       2-3 U2K02710
                          SLA     9         CHECK IF CH 9 OR 12 FOUND.  U2K02720
                          BSC  L  W3560,C   BRANCH IF CHANNEL 9 FOUND.  U2K02730
                          BSC  L  W3565,-   BR IF CHANNEL 12 NOT FOUND. U2K02740
                          MDX   2 1         SET W3965 WITH 3 IF CHAN2-2 U2K02750
                    W3560 STX  L2 $1403     *9, WITH 4 IF CHAN 12  2-11 U2K02760
                    W3565 LD      W3979                             2-5 U2K02762
                          BSC  L  W3520,+-                          2-5 U2K02764
                          SLA     16        IF SKIP TO CHANNEL 1 WAS2-5 U2K02766
                          STO     W3979     *THE LAST CARRIAGE OP   2-5 U2K02768
                          STO  L  $1403     *THEN RESET CH1, CH12  2-11 U2K02769
                          MDX     W3520     RETURN                      U2K02770
                    *                                               2-2 U2K02780
                    * SET UP ACK WITH  ERROR CODE AND BRANCH TO USER2-2 U2K02790
                    * ERROR ROUTINE.                                2-2 U2K02800
                    *                                               2-2 U2K02810
                    W3570 EOR     W3975     CLEAR THE ERROR BITS    2-2 U2K02820
                          STO     W3975     *AND SAVE THE DSW       2-2 U2K02830
                          LD      W3900     GET ERROR CODE          2-2 U2K02840
                    W3580 BSI  L  *-*       BR TO USERS ERROR ROUTINE.  U2K02850
                          BSC  L  W3600,+-  BRANCH IF IGNORE ERROR.     U2K02860
                    W3590 XIO     W3920     SENSE THE PRINTER.          U2K02870
                          BSC  L  W3610,E   BRANCH IF PRINTER NOT READY U2K02880
                          SRA     2         CHECK IF CARRIAGE BUSY  2-2 U2K02890
                          BSC  L  W3590,E    *BR IF YES             2-2 U2K02900
                          LD      W3925     LOAD SKIP TO CH 1 CNTRL WRD U2K02910
                          STO     W3950     *AND STORE IN CNTRL IOCC.   U2K02920
                    *                                               2-2 U2K02930
                    * EXECUTE A SKIP IF XR2=1, SPACE IF XR2=2,      2-2 U2K02940
                    * PRINT IF XR2=-1                               2-2 U2K02950
                    *                                               2-2 U2K02960
                          BSI     W3300     BR TO INCT BUSY/IOCT CNT2-3 U2K02965
                          XIO  L2 W3945-1   INITIATE SKIP OR PRINT.     U2K02970
                    *                                                   U2K02990
                          MDX   2 -1        IF A SKIP TO CHAN 1 WAS 2-2 U2K03000
                          MDX     W3510     *EXEC ABOVE, RESET      2-2 U2K03010
                          STX  L2 $1403     *CHAN 9/12 INDICATOR   2-11 U2K03020
                          MDX     W3510     *TO ZERO                2-2 U2K03040
                    *                                                   U2K03041
                    W3600 MDX   2 -1        DID USER SUPPRESS SKIP  2-3 U2K03043
                          MDX     W3510     *BR IF NO               2-3 U2K03045
                          STX  L2 $1403     *RESET CH 9/12 SWITCH  2-11 U2K03047
                          MDX     W3505     GO TEST IF SPACE AFTER P2-3 U2K03049
                    *                                                   U2K03050
                    W3610 LD      W3960     LOAD NOT READY ERROR CODE.  U2K03060
                          BSI  L  $PST4     BR TO POST-OP NT RDY WAIT.  U2K03070
                          MDX     W3590     BRANCH TO SENSE PRINTER.    U2K03080
                    *     *                                             U2K03090
                    *     *                                             U2K03100
                    $PRET EQU     /0028     ADDR OF $PRET IN COMMA.     U2K03110
                    $IOCT EQU     /0032     ADDR OF $IOCT IN COMMA.     U2K03120
                    $PST4 EQU     /008D     ADDR OF $PST4 IN COMMA.     U2K03130
                    $1403 EQU     /0080     ADDR OF 1403 CH12 IND  2-11 U2K03135
                    *                                                   U2K03140
                          BSS  E  0                                     U2K03150
                    W3990 BSS     60        OUTPUT BUFFER.              U2K03160
                          END     PRNT3                                 U2K03170
