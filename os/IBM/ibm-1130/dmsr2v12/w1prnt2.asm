                          HDNG    PRNT2- FAST SCAN VERSION FOR SCA USE  W1E00020
                    *************************************************** W1E00030
                    * TITLE - PRNT2                                   * W1E00040
                    * STATUS - VERSION 2 MODIFICATION 4               * W1E00050
                    * FUNCTION/OPERATION - PRNT2 CAN PERFORM THE      * W1E00060
                    *  FOLLOWING FUNCTIONS                            * W1E00070
                    *     1. TEST                                     * W1E00080
                    *     2. PRINT                                    * W1E00090
                    *     3. CONTROL CARRIAGE                         * W1E00100
                    *     4. PRINT NUMERICAL                          * W1E00110
                    * ENTRY POINTS - .PRNT2. CALL ENTRANCE LIBF PRNT2 * W1E00120
                    *  .INT1. INTERRUPT ENTRANCE FROM ILS01           * W1E00130
                    * INPUT - THE I/O AREA CONTAINS EBCDIC CHARACTERS * W1E00140
                    *  PACKED TWO PER WORD                            * W1E00150
                    * OUTPUT - NONE                                   * W1E00160
                    *EXTERNAL SUBROUTINES- NONE                       * W1E00170
                    * EXITS-NORMAL - .EXIT. RETURN TO MAINLINE AT     * W1E00180
                    *  LIBF+2, LIBF+3, OR LIBF+4 DEPENDING ON THE     * W1E00190
                    *  FUNCTION.  .XR1+2. RETURN TO USER VIA ILS RTN. * W1E00200
                    *      -ERROR - WORD 41 -PRE-OPERATIVE ERROR HALT * W1E00210
                    *               .STR(3+1. BSI TO USERS ERROR RTN. * W1E00220
                    * TABLES/WORK AREAS - NONE                        * W1E00230
                    * ATTRIBUTES - REUSABLE                           * W1E00240
                    * NOTES - NONE                                    * W1E00250
                    *************************************************** W1E00260
                          LIBR                                          W1E00270
                    1130  ISS  06 PRNT2     1                           W1E00280
                    *************************************************** W1E00290
                    $PRET EQU     40         ADDR PREOPERATIVE TRAP     W1E00300
                    $IOCT EQU     50         ADDR IOCS COUNTER          W1E00310
                    $1132 EQU     /7F        ADDR 1132 CH12 IND     2-4 W1E00315
                    *                                                   W1E00320
                    *************************************************** W1E00330
                    PRNT2 STX   1 FC58+1     CALL ENTRANCE         (+0) W1E00340
                          LDX  I1 *-*        ADDR OF 1ST PARAMETER (+2) W1E00350
                          MDX     FC10       TO CALL PROCESSING         W1E00360
                    INT1  DC      *-*        ENTRANCE FROM ISS     (+4) W1E00370
                          BSC  L  FC50       TO INTERR PROCESSING       W1E00380
                    WHEEL DC      *-*        STORAGE FOR WHEEL CHAR   * W1E00390
                          BSS  E                                        W1E00400
                    AQ    DC      0          ACC                      * W1E00410
                          DC      0          *AND EXT                 * W1E00420
                    H6001 DC      /6001      BAD CALL DISPLAY         * W1E00430
                    *************************************************** W1E00440
                    *     ILLEGAL PARAMETER TRAP. SUBR    SETS ERROR  * W1E00450
                    *     INDICATOR IN ACCUM AND GOES TO WAIT AT LOCN * W1E00460
                    *     40 THENCE BACK TO INITIAL CALL              * W1E00470
                    *************************************************** W1E00480
                    ILGL2 LD      STRTP      END OF FORMS               W1E00490
                          MDX     ILLGL+1    RETURN TO USER             W1E00500
                    *                                                   W1E00510
                    *                                                   W1E00520
                    ILLGL LD      H6001                                 W1E00530
                          LDX  L1 *-*        SET XR1 TO CALL ADDR+1     W1E00540
                          MDX   1 -1         SET XR1 TO CALL ADDR       W1E00550
                          STX  L1 $PRET      SAVE CALL ADDR             W1E00560
                          LDX   1 $PRET+1                               W1E00570
                          MDX     STXIT      RETURN TO $PRET+1          W1E00580
                    *                                                   W1E00590
                    KNUM  DC      /F100      1ST NUM CHAR ON PRT WHEEL* W1E00600
                          BSS  E                                        W1E00610
                    READE DC      WHEEL                               * W1E00620
                          DC      /3200                               * W1E00630
                    K13   DC      22                                  * W1E00640
                    BIN1  DC      1          MUST BE ODD              * W1E00650
                    NUM   DC      *-*        + = NUM, NEG = ALPHA     * W1E00660
                    *************************************************** W1E00670
                    *     SCAN ROUTINE FOR PRNT2. THE CHAR IS READ    * W1E00680
                    *     FROM THE EMITTER AND CONVERTED TO A TABLE   * W1E00690
                    *     ADDRESS.  THE MASK AREA OF 32-39 IS SET TO  * W1E00700
                    *     ZEROES AND THE TABLE ADDRESS IS USED TO     * W1E00710
                    *     SELECT A WORD FROM THE TABLE .TABLE. WHICH  * W1E00720
                    *     CONTAINS THE RELATIVE LOCATION IN THE PRNT2 * W1E00730
                    *     BUFFER WHERE THE MASK WORDS FOR THIS CHAR   * W1E00740
                    *     ARE CONTAINED AND THE RELATIVE LOCATIONS IN * W1E00750
                    *     32-39 WHICH ARE TO HAVE MASK WORDS          * W1E00760
                    *************************************************** W1E00770
                    EMIT  XIO     READE      WHEEL CHAR TO EMITTER      W1E00780
                          LD      NUM                                   W1E00790
                          BSC  L  FC75,+     IS NUM INDR ON             W1E00800
                          LD      K13        YES, SET CTR48 TO 22       W1E00810
                          STO     CTR48                                 W1E00820
                          LD      WHEEL      STORE PRESENT WHEEL        W1E00830
                          EOR     KNUM       COMP W/1ST NUMERIC CHAR    W1E00840
                    FC74  BSC  L  OUT,Z      MATCH   TO USER IF NOT     W1E00850
                          STO     NUM        YES, SET NUM IND OFF       W1E00860
                    FC75  LD      WHEEL      GET  CHAR JUST READ AND    W1E00870
                          SLA     2          *CONVERT TO ADDRESS IN THE W1E00880
                          SRA     10         *CHARACTER TBL TO INSERT   W1E00890
                          A       KTBL       *APPROPRIATE MASK WORDS    W1E00900
                          STO     FC77+2     *FROM .BUFR. TO 32-39      W1E00910
                          BSI  L  CLEAR      GO  CLEAR LOC!NS 32-39     W1E00920
                    FC77  LDX   1 -8                                    W1E00930
                          LD   L  *-*        GET  TABLE ENTRY AND       W1E00940
                          SRT     8          *STORE BUFFER ADDRESS TO   W1E00950
                          STO     *+1        *XR2 FOR MASK WORDS        W1E00960
                          LDX  L2 *-*        *FOR THIS CHARACTER        W1E00970
                          MDX  L2 BUFR                                  W1E00980
                          SRT     8                                     W1E00990
                    LOOP  RTE     1          STORE MASK WORD            W1E01000
                          BSC  L  UPIT,-     *INTO APPROPRIATE          W1E01010
                          LD    2 0          *LOCATIONS IN 32-39        W1E01020
                          STO   1 $SCAN+8                               W1E01030
                          MDX   2 1                                     W1E01040
                    UPIT  MDX   1 1                                     W1E01050
                          MDX     LOOP                                  W1E01060
                          LD      CTR48      REDUCE NO.   OF SCANS CTR  W1E01070
                          S       BIN1       *BY ONE                    W1E01080
                          STO     CTR48                                 W1E01090
                          BSC  L  OUT-2      INSERT SCAN COMPLETE BIT   W1E01100
                          BSS  E  0                                     W1E01110
                    STRTP DC      /6000      1132 ERROR INDR          * W1E01120
                          DC      /3480                              O* W1E01130
                    K48   DC      48         MUST BE EVEN ADDR       E* W1E01140
                    K12   DC      12         MUST FOLLOW K48         O* W1E01150
                    SENSE DC      *-*        STOR FOR CALL+1 PAR   EVEN W1E01152
                          DC      /3700      SENSE IOCC             ODD W1E01154
                    NEG60 DC      -60        CON FOR USER WDCNT ERROR * W1E01160
                    BIN2  DC      2          RIGHT   8 BITS ARE Z     * W1E01180
                    CTR48 DC      *-*                                 * W1E01190
                    PAR1  DC      *-*                                   W1E01200
                    KTBL  DC      TABL                                  W1E01210
                    *************************************************** W1E01220
                    *     CALL PROCESSING- CHECK FOR TEST FUNCTION AND* W1E01230
                    *     IF YES- SET THE APPROPRIATE RETURN ADDR     * W1E01240
                    *     AND EXIT BACK TO USER                       * W1E01250
                    *************************************************** W1E01260
                    FC10  STX   1 ILLGL+2    ADDR OF CALL+1 STORED      W1E01270
                          STX   2 FC58+3     STORE USERS XR2            W1E01280
                          STS     FC58+4     SAVE STATUS                W1E01290
                          STD     AQ         SAVE ACC AND EXT           W1E01300
                    EOF   XIO     SENSE                                 W1E01310
                          SLA     5          END  OF FORMS TEST         W1E01320
                          BSC  L  ILGL2,+Z   BR IF YES                  W1E01330
                          LD   I  ILLGL+2    FETCH 1ST PARAM            W1E01340
                          SRT     12                                    W1E01350
                          BSC     Z          ALL Z                      W1E01360
                          MDX     FC13       NO, TEST FOR PRT OR CTRL   W1E01370
                          XIO     SENSE      CHECK FOR PRINTER OR       W1E01380
                          SRA     8          * CARRIAGE BUSY            W1E01390
                          BSC     +-         IS IT Z                    W1E01400
                          MDX   1 1          YES, BUMP EXIT             W1E01410
                          MDX   1 1          NO, LEAVE AT CALL+2 EXIT   W1E01420
                          LDD     AQ                                    W1E01430
                    STXIT STX   1 EXIT+1     SET RESTORE SUBR EXIT      W1E01440
                    FC58  LDX  L1 *-*        RESTORE XR1                W1E01450
                          LDX  L2 *-*        RESTORE XR2                W1E01460
                          LDS     0          RESTORE  STATUS            W1E01470
                    EXIT  BSC  L  *-*        EXIT TO USER               W1E01480
                    *                                                   W1E01490
                    *************************************************** W1E01500
                    *     CHECK FOR PRINT OR PRINT NUMERIC FUNCTION   * W1E01510
                    *     IF YES- BRING IN ASSOCIATED PARAMETERS AND  * W1E01520
                    *     CHECK VALID FUNCTION,WORD COUNT AND BRANCH  * W1E01530
                    *     TO PRESCAN LINE TO SET UP MASK WORDS        * W1E01540
                    *************************************************** W1E01550
                    FC13  RTE     20         GET CONTROL PARAMATER AND  W1E01560
                          STO     PAR1       *SAVE                      W1E01570
                          SRT     12         ISOLATE LEFT 4 BITS        W1E01580
                          S       BIN1       CHECK FOR INVALID FUNCTION W1E01590
                          BSC  L  ILLGL,+    *OF 1                      W1E01600
                          S       BIN2       TEST IF CTRL               W1E01610
                          BSC     +-         SKIP IF NOT CONTROL FUNCT. W1E01620
                          MDX     FC20       TO CTRL PROCESSING         W1E01630
                          STO     STRTC      HOLD TO SET NUM INDR LATER W1E01640
                          SLT     32         CLEAR ACC AND EXT          W1E01650
                    FC14X LD      CTR48      CHK IF WE CAN PRESCAN      W1E01660
                          BSC  L  FC14X,Z                               W1E01670
                          LD      STRTC      IF PREVIOUS LINE WAS NUM,  W1E01680
                          STO     NUM        *THE INDR WAS TURNED OFF   W1E01690
                          MDX   1 1          BUMP XR1 TO CALL+2 ADDR    W1E01700
                          STX   1 FC16+1     STORE CALL+2 ADDR          W1E01710
                          MDX   1 1                                     W1E01720
                          STX  L1 STRE3+2    STORE CALL+3 ADDR FOR 9/12 W1E01730
                          LD      PAR1       CHECK FOR FUNCTION CODE    W1E01740
                          SRT     12         GREATER THAN 4             W1E01750
                          S       K1                                    W1E01760
                          SRA     2          IF ANY BIT REMAINS, PARAM  W1E01770
                    FC14C BSC  L  ILLGL,Z    * WAS OVER 4               W1E01780
                    FC16  S    I  *-*        SUB  WD CNT FROM Z         W1E01790
                          BSC  L  ILLGL,-    RESULT SHOULD BE NEG       W1E01800
                          STO  L  NEGWD      STORE WD COUNT IN NEGATIVE W1E01810
                          STO     NEG2       *FORM FOR LATER USE        W1E01820
                          S       NEG60      CHECK RANGE--DISPLAY       W1E01830
                          BSC  L  ILLGL,+Z   */6001 IF ERROR            W1E01840
                    FC16B LD   I  FC16+1     LOAD ADDR IN CALL+2        W1E01850
                          A       K1         POINT TO FIRST DATA CHAR   W1E01860
                          BSC  L  PRSCN      GO PRESCAN LINE            W1E01870
                    *************************************************** W1E01880
                    *     RETURN FROM PRESCAN- SET UP CTRS, CLEAR 32- * W1E01890
                    *     39 , START PRINTER. TURN ON IOCS CTR & EXIT * W1E01900
                    *     BACK TO USER                                * W1E01910
                    *************************************************** W1E01920
                    FC16C XIO     SENSE      CK IF WE CAN START PRINT   W1E01930
                          SLA     6                                     W1E01940
                          BSC  L  EOF,C      TO E.O.FORMS IF C ON       W1E01950
                          BSC  L  FC16C,+Z   NO PRNTER STILL BUSY       W1E01960
                    FC16D LD      SPSK       CHK IF SKIP OP INCOMPLETE  W1E01970
                          BSC  L  FC16E,-    NOT BUSY OK TO PROCESS     W1E01980
                          LD      AFTIN                                 W1E01990
                          BSC  L  FC16D,Z    WAIT FOR SKIP COMPLETE     W1E02000
                    FC16E LD      PAR1       SAVE CTRL  PARAM FOR LATER W1E02010
                          STO     SENSE      CHK IF SPACE               W1E02020
                    FC17  LDD     K48        SET COUNTERS               W1E02030
                          STO     CTR48      * FOR A TOTAL OF 66        W1E02040
                    FC18  STD     CTR16      * PRINT CYCLES             W1E02050
                          BSI  L  CLEAR      CLEAR 32-39                W1E02060
                          MDX  L  $SCAN+7,1  INSERT SCAN COMPLETE BIT   W1E02070
                          XIO     STRTP      START PRINTER              W1E02080
                          LDX  I1 ILLGL+2    RESTORE XR1 TO RETURN      W1E02090
                          MDX   1 2          *TO USER                   W1E02100
                    CNTUP MDX  L  $IOCT,1    INCR IOCS COUNTER          W1E02110
                          MDX     STXIT-2    TO USER                    W1E02120
                          MDX     STXIT-2    TO USER                    W1E02130
                    NEG2  DC                 HOLDS WD CT IN NEG. FORM   W1E02140
                    *************************************************** W1E02150
                    *     PROCESS CONTROL FUNCTIONS OF SPACE AND SKIP * W1E02160
                    *     WAIT FOR ANY PREVIOUS PRINTING,SPACING OR   * W1E02170
                    *     SKIPPING TO END. DETERMINE IF IMMEDIATE OR  * W1E02180
                    *     AFTER PRNT SPACE OR SKIP, AND CK FOR VALID  * W1E02190
                    *     CONTROL FUNCTION.  .SPSK. INDICATES OP AND  * W1E02200
                    *     .AFTIN. INDICATES IMMED. OR AFTER OP. IF A  * W1E02210
                    *     SPACE OR SKIP IMMEDIATE, EXECUTE I/O ELSE   * W1E02220
                    *     WAIT FOR PRINT TO FINISH                    * W1E02230
                    *************************************************** W1E02240
                    FC20  LD      CTR16      CHK IF RESTORE CYCLES      W1E02250
                          BSC     Z-         *ARE COMPLETE              W1E02260
                          MDX     FC20       16-CTR NOT Z, WAIT         W1E02270
                    FC20A XIO     SENSE      CHECK IF EXECUTING         W1E02280
                          SRA     12         * ANY CARRIAGE OP          W1E02290
                          BSC  L  FC20A,Z    LOOP IF YES                W1E02300
                    FC22  LD      K12        SET LIMITING COUNTER       W1E02310
                          STO     STOPC                                 W1E02320
                          SRA     16         CLEAR ACC                  W1E02330
                          SLT     4          BRING 2ND HEX DIG FROM EXT W1E02340
                          STO     AFTIN      SET TO Z FOR ON            W1E02350
                          BSC  L  FC25,Z     IS IT Z                    W1E02360
                          SLT     4          TRY 3RD HEX DIGIT          W1E02370
                          BSC  L  ILLGL,+-   IS IT Z ALSO               W1E02380
                    FC25  S       K12        NO                         W1E02390
                          BSC  L  FC44,-Z    IS THIS A SKIP             W1E02400
                          LDX   2 0          YES                        W1E02410
                          BSC  L  FC39,-     IS IT A SKIP TO CH 12      W1E02420
                          A       K3         NO                         W1E02430
                          LDX   2 1          SET XR1 FOR SHIFT & COUNT  W1E02440
                          BSC  L  FC39,+-    TRY FOR CH 9               W1E02450
                          A       K3         NO                         W1E02460
                          MDX   2 1                                     W1E02470
                    FC38  BSC  L  FC39,+-    TEST FOR CH 6              W1E02480
                          A       K1         NO, LOOP & TRY FOR 5,4,3,  W1E02490
                          MDX   2 1           2,1                       W1E02500
                          MDX  L  STOPC,-1   CTR TO LIMIT LOOPS         W1E02510
                          MDX     FC38                                  W1E02520
                          MDX     FC14C      TO ILLGL VIA STEP          W1E02530
                    K1    DC      1                                   * W1E02540
                          BSS  E  0                                     W1E02550
                    CTR16 DC      *-*        CENTRAL LOCN REQUIRED    * W1E02560
                    CTR2  DC      *-*        MUST FOLLOW CTR16 & ODD  * W1E02570
                    FC39  LD      K1         SET UP BIT FOR SKIP MASK   W1E02580
                          SLCA  2                                       W1E02590
                          OR      SIGNB      SET SIGN BIT ON            W1E02600
                    FC44  STO     SPSK       LOAD INFO INTO MASK        W1E02610
                          LD      AFTIN      SHOULD EXECUTION WAIT      W1E02620
                          BSC  L  STXIT-2,+- BRANCH IF YES, ELSE        W1E02630
                          LD      SPSK       *DETERMINE IF SKIP OR SPAC W1E02640
                          BSC  L  SPACE,-    IS IT A SKIP               W1E02650
                          XIO     STRTC      YES                        W1E02660
                          MDX     CNTUP      BUMP LOC 50, RTRN TO USER  W1E02670
                    *                                                   W1E02680
                    *                                                   W1E02700
                    *                             SPACE PROCESSING      W1E02710
                    SPACE XIO     CARSP      START SPACES               W1E02720
                          MDX     CNTUP      RETURN TO USER             W1E02730
                    *                                                   W1E02740
                    *                        END CALL PROCESSING        W1E02750
                    *                                                   W1E02760
                    K3    DC      3          CONSTANT 3                 W1E02765
                    AFTIN DC      *-*        Z=ON, PLUS=OFF           * W1E02770
                          BSS  E  0                                     W1E02780
                    STRTC DC      *-*        WORK AREA FOR FC14A      * W1E02810
                          DC      /3404      MUST BE ODD              * W1E02820
                    *************************************************** W1E02840
                    *     1132 INTERRUPT PROCESSING ROUTINE. SAVE XR1 * W1E02850
                    *     AND 2 GET DSW CHECK FOR SKIP COMPLETE OP AND* W1E02860
                    *     IF YES DETERMINE IF WE HAVE REACHED DESIRED * W1E02870
                    *     CHANNEL. IF YES STOP CARRIAGE. IN EITHER    * W1E02880
                    *     CASEGO CHECK FOR PRINTER EMMITTER INTERRUPT * W1E02890
                    *************************************************** W1E02900
                    FC50  STX   2 OUT+1      SAVE XR2                   W1E02910
                          STX   1 XR1+1                                 W1E02920
                          XIO     SENSR-1    SENSE AND RESET            W1E02930
                          STO     DSW        HOLD DSW                   W1E02940
                          AND     K1         MASK OUT CH 12 BIT     2-4 W1E02942
                          OR   L  $1132      OR WITH CH 12 IND      2-4 W1E02944
                          STO  L  $1132      SET 1132 CH 12 IND     2-4 W1E02946
                          LD      DSW        LOAD THE DSW AGAIN     2-4 W1E02948
                          SLA     1          TEST BIT  1                W1E02950
                          BSC  L  FC56,-     IS A SKIP DONE             W1E02960
                          SLA     7          CHOP OFF LEFT 8            W1E02970
                          SRA     8          RIGHT JUSTIFY              W1E02980
                          OR      SIGNB      SET UP DSW FOR COMPARE     W1E02990
                          EOR     SPSK                                  W1E03000
                          BSC     Z          MATCH                      W1E03010
                          MDX     FC60       NO                         W1E03020
                          STO     PASS       CLEAR PASS                 W1E03030
                          STO     SPSK       CLEAR MASK                 W1E03040
                          STO  L  $1132      RESET 1132 CH 12 IND   2-4 W1E03045
                          XIO     STOPC      YES                        W1E03050
                    FC54  MDX  L  $IOCT,-1   DECR LOC 50                W1E03060
                          NOP                MAY SKIP                   W1E03070
                          MDX     FC60                                  W1E03080
                    *                                                   W1E03090
                    SPSK  DC      *-*                                   W1E03095
                    *************************************************** W1E03100
                    *     SPACE COMPLETE INTERRUPT.  CHECK IF ANY     * W1E03110
                    *     MORE SPACES REQ!D. IF YES EXECUTE I/O SPACE * W1E03120
                    *     THEN GO CHECK PRINTER EMITTER INTERRUPT.    * W1E03130
                    *************************************************** W1E03140
                    FC56  SLA     1          CHK DSW BIT 2              W1E03150
                          BSC     -          IS CARRIAGE SPACE DONE     W1E03160
                          MDX     FC60       NO                         W1E03170
                          LD      SPSK                                  W1E03180
                          S       K1         DECR SPACE CNT             W1E03190
                          STO     SPSK       STORE BACK                 W1E03200
                          BSC  L  FC54,+     FINISHED IF Z,             W1E03210
                          XIO     CARSP      * ELSE KEEP SPACING        W1E03220
                    *************************************************** W1E03230
                    *     CHECK IF PRINTER EMITTER INT. IF NO RETURN  * W1E03240
                    *     TO USER VIA ILS EXIT. IF YES CHECK IF WE ARE* W1E03250
                    *     IN A RE-SCAN WAIT LOOP. IF NO - CHECK IF    * W1E03260
                    *     LAST PRINT SCAN WAS COMPLETED- RESTART IF NO* W1E03270
                    *     IF PRNT INTERPT, CK IF ALL 48 SCANS COMPLETE* W1E03280
                    *     IF NO- GO SCAN FOR NXT CHAR. IF YES CK IF   * W1E03290
                    *     RESTORE CYCLES COMPLETE. IF YES  GO TO FC81 * W1E03300
                    *     CK IF LAST 2 CYCLES DONE, IF YES STOP PRNTR * W1E03310
                    *     AND RETURN TO USER                          * W1E03320
                    *************************************************** W1E03330
                    FC60  LD      DSW        SAVE CHANNEL INDICATOR     W1E03340
                          OR      PASS       FOR LATER CHECK OF SKIP    W1E03350
                          STO     PASS       TO CHANNEL ONE             W1E03360
                          LD      DSW                                   W1E03370
                          BSC  L  OUT,-      IS 1132 BIT ON             W1E03380
                          LD      CTR46      CHECK IF RESCAN            W1E03390
                          BSC  L  FC63,Z     LOOP- BRANCH IF YES        W1E03400
                          LD      DSW        CHECK IF LAST              W1E03410
                          SLA     4          SCAN NOT COMPLETED         W1E03420
                          BSC  L  FC70,-     BRANCH IF COMPLETE         W1E03430
                          LD      K46        NO- SET WAIT LOOP          W1E03440
                          STO     CTR46      AND THEN RESUME            W1E03450
                          BSI     CLEAR      SCAN FROM LAST GOOD SCAN   W1E03460
                          MDX  L  $SCAN+7,1                             W1E03470
                    OUT   LDX  L2 *-*        RESTORE XR2                W1E03480
                    XR1   LDX  L1 *-*        RESTORE XR1                W1E03490
                          BSC  I  INT1       TO USER VIA ILS01          W1E03500
                    *                                                   W1E03510
                    FC63  S       K1         REDUCE RESCAN COUNTER      W1E03520
                          STO     CTR46      *BY ONE                    W1E03530
                          MDX     OUT                                   W1E03540
                    SIGNB DC      /8000                                 W1E03545
                          BSS  E  0                                     W1E03550
                    CARSP DC      /8080      STORAGE FOR CH 1 MASK    * W1E03560
                          DC      /3401                               * W1E03570
                    STOPC DC      *-*        LEGALITY CK ON CTRL PARAM* W1E03580
                          DC      /3402      MUST BE ODD              * W1E03590
                    K46   DC      46         CONSTANT 46                W1E03592
                    SENSR DC      /3701      SENSE AND RESET            W1E03594
                    *                                                   W1E03610
                    FC70  LD   L  CTR48                                 W1E03620
                          BSC  L  EMIT,Z     IS FORMAL PART FINISHED    W1E03630
                          BSI     CLEAR      DONE- CLEAR 32-39          W1E03640
                          MDX  L  $SCAN+7,1  INSERT SCAN COMPLETE BIT   W1E03650
                          LD      CTR16      CHK RESTORE COUNTER        W1E03660
                          BSC  L  FC81,Z     IS 16-CTR Z                W1E03670
                          STO     PASS       CLEAR PASS                 W1E03680
                          MDX  L  CTR2,-6    YES, DECR 2-CTR            W1E03690
                          MDX     OUT        TO USER IF NOT Z YET       W1E03700
                          XIO     STOPP                                 W1E03710
                          MDX  L  $IOCT,-1   DECR LOC 50                W1E03720
                          MDX     OUT        TO USER                    W1E03730
                          MDX     OUT                                   W1E03740
                    *                                                   W1E03750
                    *************************************************** W1E03760
                    *     RESTORE CYCLES ARE COMPLETED CK IF ANY SKIP * W1E03770
                    *     OR SPACE AFTER OP REQ!D. IF YES START  THE  * W1E03780
                    *     APPROPRIATE OPERATION. IF NO CK ORIGINAL    * W1E03790
                    *     FUNCTION PARAM TO SEE IF SPACE OR SUPPRESS  * W1E03800
                    *     SPACE TO BE INITIATED.  CK IF CHANNEL 9 OR  * W1E03810
                    *     12 WAS PASSED AND IF YES GO TO USERS ERROR  * W1E03820
                    *     ROUTINE WITH INDICATION. UPON RETURN SKIP TO* W1E03830
                    *     CHANNEL 1 IF REQUESTED                      * W1E03840
                    *************************************************** W1E03850
                    FC81  MDX  L  CTR16,-3                              W1E03860
                          MDX     OUT                                   W1E03870
                          LD      SPSK       YES                        W1E03880
                          BSC  L  FC91,Z     IS IT A SPACE OR SKIP      W1E03890
                    FC82  LD   L  SENSE      NO, FETCH PUT/WRITE PARAM  W1E03900
                          SLA     11         TRIM EACH END              W1E03910
                          SRA     15                                    W1E03920
                          EOR     K1         REVERSE 01 TO 00 OR 00 -01 W1E03930
                          STO     SPSK       SET SPACE OR INHIBIT SPACE W1E03940
                    *                                                   W1E03950
                    FC91  STX   0 AFTIN      SET INDR OFF(+ OR -)       W1E03960
                          LD      PASS       YES                        W1E03970
                          BSC  L  STRE4,E    IF ODD, CH 12 WAS PASSED   W1E03980
                          SRA     1                                     W1E03990
                          BSC  L  STRE3,E    IF ODD, CH 9  WAS PASSED   W1E04000
                    FC84  LD      SPSK       NO 9/12 PASSED START AFTER W1E04010
                          BSC     +-         *SPACE/SKIP IF PRESENT     W1E04020
                          MDX     OUT        TO USER                    W1E04030
                          BSC  L  FC86,+Z    SPACE   CALLED FOR         W1E04040
                          XIO     CARSP      YES                        W1E04050
                    UP7   MDX  L  $IOCT,1    INCR IOCS COUNTER          W1E04060
                    *     NOP REMOVED, SINCE SKIP IS NOT EXPECTED   2-4 W1E04070
                          MDX     OUT        TO USER                    W1E04080
                    *                                                   W1E04090
                    STRE4 LD      STOPP      LD ACC W/ A FOUR           W1E04100
                          MDX     STRE3+1                               W1E04110
                    STRE3 LD      K3                                    W1E04120
                          BSI  I  *-*        TO USERS ERROR SUBR        W1E04130
                    FC91A BSC  L  FC84,+-    TAKE NO ACTION IF CLEARED, W1E04140
                          LD      CARSP      * ELSE SET UP SKIP TO CH 1 W1E04150
                          STO     SPSK                                  W1E04160
                    FC86  XIO  L  STRTC      SKIP WAS CALLED FOR        W1E04170
                          MDX     UP7        INCR $IOCT, GO TO USER     W1E04180
                    *                  END OF INTERRUPT PROCESSING      W1E04190
                    DSW   DC      *-*                                 * W1E04200
                    PASS  DC      0                                     W1E04205
                          BSS  E  0                                     W1E04210
                    STOPP DC      4          CON FOR USERS ERROR        W1E04220
                          DC      /3440      *EXIT                    * W1E04230
                    *************************************************** W1E04280
                    *     ROUTINE TO CLEAR LOCATIONS 32-39 TO ZEROES  * W1E04290
                    *************************************************** W1E04300
                    CLEAR DC      *-*                                   W1E04310
                          LDX   2 0          CLE AR LOCATIONS           W1E04320
                          SLT     32         32 THROUGH                 W1E04330
                          STD   2 $SCAN      39 TO                      W1E04340
                          STD   2 $SCAN+2    ZEROES                     W1E04350
                          STD   2 $SCAN+4                               W1E04360
                          STD   2 $SCAN+6                               W1E04370
                          BSC  I  CLEAR      RETURN TO CALLER           W1E04380
                    CTR46 DC      *-*                                   W1E04385
                    TABL  BSS  E  64                                    W1E04390
                    BUFR  BSS     120        INTERNAL PRINT BUFFER      W1E04400
                    *************************************************** W1E04410
                    *     START OF PRESCAN- CLEAR INTERNAL PRINT BUFFR* W1E04420
                    *     AND CHARACTER TABLE TO ZEROES               * W1E04430
                    *************************************************** W1E04440
                    PRSCN STO     FROM+1     SET TO SCAN PRINT LINE     W1E04450
                          STO     SECND      *OF USER                   W1E04460
                    *             CLEAR BUFFER,TABLE & COUNTERS         W1E04470
                          LDX  L2 184                                   W1E04480
                          SLT     32         ZERO OUT TABLE AND         W1E04490
                    LOOP1 STD  L2 TABL-2     *BUFFER, SAVE XR3          W1E04500
                          MDX   2 -2         *AND CLEAR 'CTRSF'         W1E04510
                          MDX     LOOP1                                 W1E04520
                          STO     CTRSF                                 W1E04540
                    *************************************************** W1E04550
                    *     LOOK AT EACH CHAR IN USERS PRNT BUFFR AND   * W1E04560
                    *     BUILD UP THE CHARACTER TABLE TO INDICATE FOR* W1E04570
                    *     EACH OF THE 48 PRINTABLE CHARACTERS THE NMBR* W1E04580
                    *     OF MASK WORDS REQUIRED AND THEIR RELATIVE   * W1E04590
                    *     LOCATIONS IN 32-39 IN THE RIGHT HALF OF EACH* W1E04600
                    *     TABLE ENTRY                                 * W1E04610
                    *             XR2 IS SHIFT COUNT                  * W1E04620
                    *************************************************** W1E04630
                    LOOP2 LDX   1 16                                    W1E04640
                    LOOP3 BSI     GET        GET CHARACTER TABLE ADDR   W1E04650
                          LD   I  TAENT      GET CHAR TABLE ENTRY   2-2 W1E04660
                          SRT   2 0          CHECK RELATIVE WORD        W1E04670
                          BSC  L  CK,E       ANY OTHER CHARS IN THIS    W1E04680
                          OR      KN1        *GROUP OF 16, NO, SET      W1E04690
                          SLT   2 0          *INDICATOR +, ADD 1 TO     W1E04700
                          A       K0100      *CNT OF MASK WDS REQUIRED  W1E04710
                          STO  I  TAENT      *FOR CHAR-STORE BACK   2-2 W1E04720
                    CK    LD      NEGWD      CHECK IF SCAN DONE         W1E04730
                          BSC  L  LOOP4-1,+- EXIT IF DONE               W1E04740
                          MDX   1 -1         ADJUST COUNTERS            W1E04750
                          MDX     LOOP3      *TO GO THRU                W1E04760
                          MDX   2 1          *LOOP AGAIN                W1E04770
                          MDX     LOOP2                                 W1E04780
                    *************************************************** W1E04790
                    *     AFTER SCAN OF USERS PRINT BUFFER, SCAN THE  * W1E04800
                    *     CONSTRUCTED TABLE AND DETERMINE THE STARTING* W1E04810
                    *     RELATIVE LOCATION FOR THE MASK WORDS TO BE  * W1E04820
                    *     STORED IN THE INTERNAL PRINT BUFFER         * W1E04830
                    *************************************************** W1E04840
                          LDX   2 64                                    W1E04850
                    LOOP4 LD   L2 TABL-1     GET TABLE ENTRY            W1E04860
                          SRT     8                                     W1E04870
                          STO     TEMP                                  W1E04880
                          A       CTRSF      UPDATE RELATIVE ADDR       W1E04890
                          STO     CTRSF      *IN BFR FOR THIS           W1E04900
                          S       TEMP       *CHARACTER                 W1E04910
                          SLT     8                                     W1E04920
                          STO  L2 TABL-1     STORE BACK                 W1E04930
                          MDX   2 -1                                    W1E04940
                          MDX     LOOP4      REPEAT LOOP                W1E04950
                    *************************************************** W1E04960
                    *     SCAN THE USERS BUFFER AGAIN TO NOW CONSTRUCT* W1E04970
                    *     THE ACTUAL MASK WORDS THAT ARE REQUIRED FOR * W1E04980
                    *     INSERTING INTO LOCATIONS 32- 39 AT          * W1E04990
                    *     EACH CHARACTER INTERRUPT CYCLE              * W1E05000
                    *************************************************** W1E05010
                          LD   L  NEG2       SET TO SCAN PRINT LINE     W1E05020
                          STO     NEGWD      TO CONSTRUCT MASK WORDS    W1E05030
                          LD      SECND      *IN BUFFER                 W1E05040
                          STO     FROM+1                                W1E05050
                    LOOP6 LDX   1 16                                    W1E05060
                    LOOP5 BSI     GET        GET CHARACTER TBL  ADDRESS W1E05070
                          LD   I  TAENT      GET CHAR TABLE ENTRY   2-2 W1E05080
                          SRT     8          RELATIVE BUFFER ADDR       W1E05090
                          A       BADDR      GET ACTUAL BUFFER ADDR 2-2 W1E05100
                          STO     BUENT      *AND STORE IT          2-2 W1E05110
                          S       BADDR                             2-2 W1E05120
                          SRT     8          ISOLATE PART OF ENTRY THAT W1E05130
                          RTE   2 0          *HAS RLTV MASK WDS REQD    W1E05140
                    LOOP7 BSC  L  *+2,-      LOOP TO FIND RLTV MASK 2-2 W1E05150
                          MDX  L  BUENT,1    *WD IN BUFFER WHICH    2-2 W1E05160
                          SLA     1          *CORRESPONDS TO THIS CHAR  W1E05170
                          BSC  L  LOOP7,Z    *IN THIS PRINT POSITION    W1E05180
                          LDD     KN1        *OR IN A BIT INTO THE      W1E05190
                          SRT     1          *APPROPRIATE MASK WORD     W1E05200
                          SLT   1 0          *AND STORE BACK IN THE     W1E05210
                          OR   I  BUENT      *TO PROPER SLOT IN THE 2-2 W1E05220
                          STO  I  BUENT      *BUFFER                2-2 W1E05230
                          LD      NEGWD      ARE WE DONE                W1E05240
                          BSC  L  FC16C,+-   YES GO CHK START PRINT     W1E05260
                          MDX   1 -1         NO UP COUNTERS             W1E05270
                          MDX     LOOP5      *FOR NEXT                  W1E05280
                          MDX   2 1          *CHARACTER SCAN            W1E05290
                          MDX     LOOP6                                 W1E05300
                          BSS  E  0                                     W1E05310
                    SECND DC      *-*                                   W1E05320
                    CTRSF DC      *-*                                   W1E05330
                    K0100 DC      /0100                                 W1E05340
                    KN1   DC      1        M MOST HAVE ODD ADDR         W1E05350
                    LFTRT DC      *-*                                   W1E05360
                    TEMP  DC      *-*                                   W1E05370
                    TADDR DC      TABL                              2-2 W1E05374
                    TAENT DC      *-*                               2-2 W1E05375
                    BADDR DC      BUFR                              2-2 W1E05376
                    BUENT DC      *-*                               2-2 W1E05377
                    NEGWD DC      *-*       SOURCE NEG WD CNT           W1E05378
                    *************************************************** W1E05380
                    *     SUBROUTINE TO CONVERT A PACKED EBC CHARACTER* W1E05390
                    *     INTO A TABLE ADDRESS OF 0-63 PLUS THE ADDR  * W1E05400
                    *     OF THE BEGINNING OF THE TABLE               * W1E05410
                    *************************************************** W1E05420
                    GET   DC      *-*                                   W1E05430
                    FROM  LD   L  *-*        GET WORD WITH 2 EBC CHARS  W1E05440
                          MDX  L  LFTRT,0    CHK LEFT OR RIGHT          W1E05450
                          SLA     8          *CHARACTER DESIRED         W1E05460
                          SLA     2          FOLD INTO 6 BITS           W1E05470
                          SRA     10         *AND CREATE TABLE ENTRY    W1E05480
                          A       TADDR      *ADDRESS               2-2 W1E05490
                          STO     TAENT                             2-2 W1E05500
                          LD      LFTRT      ADJUST USER BUFFER ADDR    W1E05520
                          A       FROM+1     *BY ZERO OR ONE FOR NEXT   W1E05530
                          STO     FROM+1     *CHARACTER FETCH           W1E05540
                          LD      NEGWD      REDUCE WORD COUNT          W1E05550
                          A       LFTRT      *BY ZERO OR ONE            W1E05560
                          STO     NEGWD      *AND STORE BACK            W1E05570
                          LD      LFTRT      REVERSE INTERNAL LEFT-     W1E05580
                          EOR     KN1        *RIGHT INDICATOR           W1E05590
                          STO     LFTRT      *FOR NEXT CHARACTER        W1E05600
                          BSC  I  GET        RETURN TO CALLING PROGRAM  W1E05610
                    $SCAN EQU     32         PRINT SCAN                 W1E05620
                          END                                           W1E05630
