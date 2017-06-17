                          HDNG    LIBF PRNT1                            U2J00005
                    *************************************************** U2J00010
                    *                                                 * U2J00020
                    * TITLE - PRNT1                                   * U2J00030
                    *                                                 * U2J00040
                    *STATUS - VERSION 2, MODIFICATION 12              * U2J00050
                    *                                                 * U2J00060
                    * FUNCTION/OPERATION - PRNT1 CAN PERFORM THE      * U2J00070
                    *   FOLLOWING FUNCTIONS                           * U2J00080
                    *      1. TEST                                    * U2J00090
                    *      2. PRINT                                   * U2J00100
                    *      3. CONTROL CARRIAGE                        * U2J00110
                    *      4. PRINT NUMERICAL                         * U2J00120
                    *                                                 * U2J00130
                    * ENTRY POINTS -                                  * U2J00140
                    *      1. PRNT1  CALL ENTRANCE, LIBF PRNT1        * U2J00150
                    *      2. INT1   INTERRUPT ENTRANCE FROM ILS01    * U2J00160
                    *                                                 * U2J00170
                    * INPUT - THE I/O AREA CONTAINS EBCDIC CHARACTERS * U2J00180
                    *   PACKED TWO PER WORD                           * U2J00190
                    *                                                 * U2J00200
                    * OUTPUT - PRINTED ON 1132 PRINTER                * U2J00210
                    *                                                 * U2J00220
                    * EXTERNAL SUBROUTINES - NONE                     * U2J00230
                    *                                                 * U2J00240
                    * EXITS -                                         * U2J00250
                    *   NORMAL                                        * U2J00260
                    *      1. CALL PORTION - FC58, BACK TO USER.      * U2J00270
                    *      2. INTERRUPT PORTION - OUT, BACK TO ILS01  * U2J00280
                    *   ERROR                                         * U2J00290
                    *      1. CALL PORTION - IF PRE-OP ERROR IS DETECT* U2J00300
                    *         *ED, SUBROUTINE BRANCHES TO $PRET AND   * U2J00310
                    *         DISPLAYS 6000 OR 6001 IN ACCUMULATOR.   * U2J00320
                    *      2. INTERRUPT PORTION - IF CARRIAGE CHANNEL * U2J00330
                    *         9 OR 12 IS DETECTED, SUBROUTINE PERFORMS* U2J00340
                    *         BSI TO USER'S ERROR SUBROUTINE WITH 0003* U2J00350
                    *         OR 0004 RESPECTIVELY IN ACCUMULATOR.    * U2J00360
                    *                                                 * U2J00370
                    * TABLES/WORK AREAS - NONE                        * U2J00380
                    *                                                 * U2J00390
                    * ATTRIBUTES - REUSABLE                           * U2J00400
                    *                                                 * U2J00410
                    * NOTES - EBCDIC CHARACTERS NOT INCLUDED IN 1132  * U2J00420
                    *   CHARACTER SET ARE PRINTED AS BLANKS.          * U2J00430
                    *                                                 * U2J00440
                    *************************************************** U2J00450
                    *     EJCT        BLK REMOVED                       U2J00460
                          LIBR                                          U2J00470
                    1130  ISS  06 PRNT1     1                           U2J00480
                    PRNT1 STX   1 FC58+1    CALL ENTRANCE         (+0)  U2J00490
                          LDX  I1 *-*       ADDR OF 1ST PARAM      +2   U2J00500
                          MDX     FC10      TO PROCESS CALL             U2J00510
                    INT1  DC      *-*       INTERRUPT ENTRANCE     +4   U2J00520
                          BSC  L  FC50      TO INTRPT PROCESSING        U2J00530
                    *                                                   U2J00540
                    *CONSTANTS AND BUFFER AREA                          U2J00550
                    *                                                   U2J00560
                    WHEEL DC      *-*       STORAGE FOR WHEEL CHAR      U2J00570
                          BSS  E                                        U2J00580
                    AQ    DC      0         SAVE ACC AND EXT            U2J00590
                          DC      0                                   * U2J00600
                    H6001 DC      /6001     ERROR CODE                  U2J00610
                    *                                                   U2J00620
                    *THIS SECTION DOES THE SHIFT TO POSITION SCAN BITS, U2J00630
                    *STORES THEM IN THE SCAN FIELD AND KEEPS TRACK OF   U2J00640
                    *THE WORD COUNT.                                    U2J00650
                    *                                                   U2J00660
                    CKLPS SLT     2         POSITION FOR 2 MORE BITS    U2J00670
                          MDX  L  QTEST,-4  IF A WD IS DONE,BR          U2J00680
                          MDX     SCAN      *ELSE RET TO GET 2 BITS     U2J00690
                          SLT     14        WHEN EXT FULL,MOVE TO ACC   U2J00700
                          MDX  L  QTEST,32  RESET FOR NEXT WD           U2J00710
                          MDX  L  NEGW2,8   MODIFY WD CNT               U2J00720
                    PARTM STO  L  32        STORE 1 WD IN SCAN FIELD    U2J00730
                          MDX  L  PARTM+1,1 INCR SCAN FIELD ADDR        U2J00740
                          MDX     SCAN      RET TO SET UP NEXT WD       U2J00750
                    *                                                   U2J00790
                    *END OF FORMS ERROR EXIT                            U2J00800
                    *                                                   U2J00810
                    ILGL2 LD      STRTP     GET ERROR CODE              U2J00820
                          MDX     ILLGL+1   EXIT TO CORE LOC 41         U2J00830
                    *                                                   U2J00840
                    *ERROR EXIT TO CORE LOC 41 W/CALL ADDR IN LOC 40    U2J00850
                    *                                                   U2J00860
                    ILLGL LD      H6001     GET ERROR CODE              U2J00870
                          LDX  L1 *-*       GET CALL ADDR AND STORE IN  U2J00880
                          MDX   1 -1        CORE LOC 40                 U2J00890
                          STX  L1 40                                    U2J00900
                          LDX   1 41        SET TO EXIT TO CORE LOC 41  U2J00910
                          MDX     STXIT                                 U2J00920
                    *                                                   U2J00930
                    *CONSTANTS AND BUFFER AREA                          U2J00940
                    *                                                   U2J00950
                    $PRET EQU     /28                                   U2J00952
                    $SCAN EQU     /20                              2-10 U2J00955
                    $1132 EQU     /007F     SYSTEM 1132 INDICATOR  2-12 U2J00956
                    QTEST DC      32        16 BITS CTR FOR SCAN ST2-12 U2J00957
                          BSS  E                                        U2J00960
                    READE DC      WHEEL                               * U2J00970
                          DC      /3200     READ EMITTER IOCC WDS       U2J00980
                    *                                                   U2J01060
                    *THIS SECTION SETS UP THE BITS FOR THE SCAN FIELD   U2J01070
                    *                                                   U2J01080
                    *                                                   U2J01090
                    EMIT  XIO     READE     WHEEL CHAR TO EMITTER       U2J01100
                          LD      NUM       IS NUMERIC INDR ON          U2J01110
                          BSC  L  FC75,+    NO,GO START SCAN SETUP      U2J01120
                          LD      WHEEL     GET PRESENT WHEEL CHAR      U2J01150
                          BSC  L  FC74A,-   BR IF SPECIAL CHAR     2-12 U2J01155
                          S       KNUM                                  U2J01160
                          BSC  L  OUT,Z+    NO CMP, BR TO WAIT FOR  212 U2J01170
                    *                       * INTRPT ON NEXT WHEEL CHAR U2J01180
                    FC74A MDX  L  NUM,-1    DO CMP, DECR NUM CTR   2-12 U2J01182
                          MDX     FC75      BR IF CTR NOT = 0      2-12 U2J01184
                          LD      BIN1      SET SCAN COUNTER       2-12 U2J01186
                          STO  L  CTR48     * = 1 IF CMPLT         2-12 U2J01190
                    FC75  LD      K32                              2-10 U2J01192
                          STO     PARTM+1   RESET SCAN FIELD ADDR  2-10 U2J01194
                          STO     QTEST     RESET Q REQ FULL CTR   2-10 U2J01196
                          LD      NEGWD     RESET MODIFIED WD CNT  2-10 U2J01198
                          STO     NEGW2     *TO STARTING VALUE     2-10 U2J01200
                          SLT     32        CLEAR A & Q            2-11 U2J01203
                          LD      WHEEL     LOAD CHARACTER         2-11 U2J01205
                          SRA     8         MOVE CHAR TO RT SIDE ACC    U2J01210
                          OR      WHEEL     OR CHAR INTO LEFT SIDE      U2J01220
                          STO     WHEEL     2 CHARS NOW AT WHEEL        U2J01230
                          LDX   1 0         RESET CHAR COUNTER     2-10 U2J01235
                          STX  L1 $SCAN+7   CLEAR THE SCAN CK BIT  2-10 U2J01240
                          LDX  L2 *-*       NEG WD CNT TO XR2      2-10 U2J01250
                    NEGWD EQU     *-1       NEG WD CNT OF MSG      2-10 U2J01255
                    SCAN  LD   L2 *-*       GET NEXT WD TO BE O/P       U2J01260
                          EOR     WHEEL     CMP W/PRESENT WHEEL CHAR    U2J01270
                          A       FF        DID LEFT CHAR CMP           U2J01280
                          BSC  L  SCAN1,C   NO,BR                  2-10 U2J01290
                          AD      BIN2-1    YES,SET 2 BIT IN Q REG      U2J01300
                          MDX   1 1         BUMP CHAR CNT          2-10 U2J01305
                    SCAN1 SLA     8         DID RT CHAR CMP        2-10 U2J01310
                          BSC  L  SCANX,Z   NO,BR                  2-10 U2J01320
                          AD      BIN1-1    YES,SET 1 BIT IN Q REG      U2J01330
                          MDX   1 1         BUMP CHAR CNT          2-10 U2J01335
                    SCANX MDX   2 1         DECR WD CNT            2-10 U2J01340
                          MDX     CKLPS     IF NOT ZERO,GO DO SHIFT     U2J01350
                    *                                                   U2J01360
                    *WD CNT ZERO, DO FINAL SHIFT AND STORE              U2J01370
                    *                                                   U2J01380
                          LD      K32       RESET CTR THAT TESTS    212 U2J01390
                          A       NEGW2     ADD MODIFIED WD CNT         U2J01410
                          A       NEGW2     *TWICE TO SET Q SHIFT       U2J01420
                          STO     SETSH+1   *LEFT-JUSTIFIED             U2J01430
                    SETSH LDX  L2 *-*       SET UP XR2 FOR SLC          U2J01440
                          SRA     16        CLEAR ACC BEFORE SHIFT      U2J01450
                          SLC   2           COUNT XR2                   U2J01460
                          STO  I  PARTM+1   STORE FINAL PART OF SCAN    U2J01470
                          LD   L  $SCAN+7   SET SCAN COMPLETE      2-12 U2J01475
                          OR      BIN1      *INDR                  2-12 U2J01476
                          STO  L  $SCAN+7                          2-12 U2J01478
                          LD      CTR48                                 U2J01480
                          S       BIN1      DECR CTR48                  U2J01490
                          STO     CTR48                                 U2J01500
                          LD      CTRWD     UPDATE THE CHAR CTR    2-10 U2J01510
                          STX   1 CTRX      *TO EQUAL REMAINING    2-10 U2J01520
                          S       CTRX      *NUMBER OF CHARS TO BE 2-10 U2J01530
                          STO     CTRWD     *PRINTED               2-10 U2J01540
                          BSC  L  OUT       BR TO EXIT INTRPT RTN  2-10 U2J01550
                          EJCT                                          U2J01580
                    *************************************************** U2J01700
                    *                                                 * U2J01710
                    *THIS PORTION SERVICES A CALL ENTRANCE            * U2J01720
                    *                                                 * U2J01730
                    *************************************************** U2J01740
                          SPAC                                          U2J01750
                    FC10  STX   1 ILLGL+2   ADDR OF CALL+1 STORED       U2J01760
                          STX   2 FC58+3    SAVE XR2                    U2J01770
                          STS     FC58+4    SAVE STATUS                 U2J01780
                          STD     AQ        SAVE A AND Q REGS           U2J01790
                          XIO     SENSE     SENSE PRINTER               U2J01800
                          SLA     5         END OF FORMS TEST           U2J01810
                          BSC  L  ILGL2,+Z  IF END, TAKE ERROR EXIT     U2J01820
                          LD    1 0         FETCH 1ST PARAMETER    2-10 U2J01830
                          SRT     12        WHAT IS THE FUNCTION        U2J01840
                          BSC     Z         BR IF TEST FUNC             U2J01850
                          MDX     FC13      NOT TEST,GO CHK PR OF CTRL  U2J01860
                          XIO     SENSE     CHK FOR PTR OR CARRIAGE     U2J01870
                          SRA     8         BUSY.                       U2J01880
                          BSC     +-                                    U2J01890
                          MDX   1 1         NOT BUSY,EXIT AL CALL+3     U2J01900
                          MDX   1 1         BUSY, EXIT AT CALL+2        U2J01910
                          LDD     AQ        RESTORE A AND Q REGS        U2J01920
                    STXIT STX   1 EXIT+1    SET UP EXIT                 U2J01930
                    FC58  LDX  L1 *-*       RESTORE XR1                 U2J01940
                          LDX  L2 *-*       RESTORE XR2                 U2J01950
                          LDS     *-*       RESTORE STATUS              U2J01960
                    EXIT  BSC  L  *-*       EXIT TO MAINLINE            U2J01970
                    *                                              2-10 U2J01972
                    *CONSTANTS AND BUFFER AREA                     2-10 U2J01974
                    *                                              2-10 U2J01976
                          BSS  E                                   2-10 U2J01978
                    STRTP DC      /6000     END OF FORMS ERROR CODE2-10 U2J01980
                          DC      /3480     START PRINTER IOCC WD  2-10 U2J01982
                    K48   DC      48        CON TO SET 48 PR CYCLES2-10 U2J01984
                    *                       OR 16 IDLE CYCLES.     2-10 U2J01986
                    K12   DC      12        CON TO SET 2 CYCLES    2-10 U2J01988
                    FF    DC      /FF00     SETS CARRY IF NOT CMP  2-10 U2J01990
                    BIN2  DC      2         SET 1ST CHAR CMP BIT   2-10 U2J01992
                    KNUM  DC      /F000     USED TO CHK FOR NUMERIC2-12 U2J01994
                    BIN1  DC      1         SET 2ND CHAR CMP BIT   2-10 U2J01996
                    NEG60 DC      -60       WD CNT ERROR CHK CON   2-10 U2J01998
                    NEGW2 DC      *-*       WD CNT BUFFER USED BY S2-10 U2J02000
                    K32   DC      32        Q REG FULL CON         2-10 U2J02002
                    NUM   DC      *-*        PTV=NUMERIC,NEG=ALPHA 2-12 U2J02003
                    *                                              2-10 U2J02004
                    *NOT TEST FUNCTION,CHECK PRINT OR CARRIAGE CTL 2-10 U2J02006
                    *                                              2-10 U2J02008
                    FC13  S       BIN1      IS FUNCTION LEGAL      2-11 U2J02040
                          BSC  L  ILLGL,+   NO,BR                       U2J02050
                          S       BIN2      TEST IF CONTROL             U2J02060
                          BSC     +-        NOT,SKIP                    U2J02070
                          MDX     FC20      IS, TO CTRL PROCESSING      U2J02080
                          STO     NIND      SAVE TO SET NUMERIC IND2-10 U2J02090
                          SLT     32        CLEAR Q REG                 U2J02100
                    *                                                   U2J02110
                    *THIS SECTION SETS UP THE ROUTINE TO PRINT          U2J02120
                    *                                                   U2J02130
                    FC14X XIO     SENSE     ANY RESPONSE,BUSY,OR ERROR  U2J02140
                          SLA     5         IS 1132 READY           2-6 U2J02141
                          BSC  L  FC14Y,-   BR IF YES               2-6 U2J02142
                          LD      STRTP     LOAD ERROR CODE         2-6 U2J02143
                          BSI  L  $PRET     BR TO PRE-OP ERROR      2-6 U2J02144
                          MDX     FC14X     TEST AGAIN              2-6 U2J02145
                    FC14Y XIO     SENSE     SENSE DSW               2-6 U2J02146
                          SRA     8         BITS ON.                    U2J02150
                          BSC  L  FC14X,Z   YES,SENSE PTR AGAIN         U2J02160
                          LD      NIND      IF PREVIOUS LN NUMERIC 2-10 U2J02170
                          BSC     Z-        *SKIP DOESN'T OCCUR    2-12 U2J02172
                          LD      K13       SET NUMERIC CTR        2-12 U2J02174
                          STO     NUM       INDR WAS SET OFF WHEN       U2J02180
                    *                       1ST NUMERIC CHAR FOUND      U2J02190
                          LD    1 0         LOAD CALL+1 (1ST PARM) 2-11 U2J02193
                          STO     SENSE     SAVE CONTROL WORDPARM) 2-11 U2J02195
                          MDX   1 1         INCR XR1 TO CALL+2 ADDR     U2J02200
                          STX   1 FC16+1    ST CALL+2 ADDR              U2J02210
                          MDX   1 1         INCR XR1 TO CALL+3 ADR 2-11 U2J02220
                          STX  L1 STRE3+6   STORE CALL +6 ADDRESS   212 U2J02230
                    *                                              2-10 U2J02250
                          SRT     12        GET FUNC DIGIT              U2J02260
                          S       K1        SUB 1                       U2J02270
                          SRA     2         IF ANY BIT REMAINS, PARAM   U2J02280
                    FC14C BSC  L  ILLGL,Z   WAS OVER 4.TAKE ERROR EXIT  U2J02290
                    FC16  S    I  *-*       SUB WD CNT FROM ZERO        U2J02300
                          BSC  L  ILLGL,-   RESULT SHOULD BE NEG        U2J02310
                          STO     NEGWD     SAVE MINUS WD CNT           U2J02320
                          STO     NEGW2                                 U2J02330
                          S       NEG60     CHECK RANGE AND DISPLAY     U2J02340
                          BSC  L  ILLGL,+Z  *6001 IF ERROR              U2J02350
                          LD   I  FC16+1    LD ADDR OF I/O AREA         U2J02360
                          A       K1        AVOID STORED WD CNT         U2J02370
                          S    L  NEGWD     SUB NEG WDCNT-PT TO END2-12 U2J02380
                          STO     SCAN+1    SAVE IN SCAN RTN            U2J02390
                          STO     TOTL+1    SAVE PRINTABLE CHAR CNT2-10 U2J02392
                          SLT     32        CLEAR Q REG            2-10 U2J02394
                          LDX  I2 NEGWD     FETCH MSG WD CNT       2-10 U2J02396
                    TOTL  LD   L2 *-*       FETCH NEXT CHAR PAIR   2-10 U2J02398
                          EOR     BLANK     CHECK FOR BLANK CHARS  2-10 U2J02400
                          A       FF        IS LEFT CHAR BLANK     2-10 U2J02402
                          BSC     C         YES,SKIP               2-10 U2J02404
                          AD      BIN1-1    ADD 1 TO Q REG         2-10 U2J02406
                          SLA     8         IS RT BLK              2-10 U2J02408
                          BSC     Z         YES,SKIP               2-10 U2J02410
                          AD      BIN1-1    ADD 1 TO Q REG         2-10 U2J02412
                          MDX   2 1         SKIP WHEN COMPLETED    2-10 U2J02414
                          MDX     TOTL      DO NEXT WD             2-10 U2J02416
                          RTE     16                               2-10 U2J02418
                          STO     CTRWD     SAVE PRINTABLE CNT     2-10 U2J02420
                          LDD     K48       SET CTRS 48, 16, +2         U2J02422
                          STO     CTR48     *FOR A TOTAL OF 66 CYCLES   U2J02425
                          STD     CTR16                                 U2J02427
                          BSI  L  CLEAR     CLEAR SCAN FIELD (32-39)    U2J02430
                          XIO     STRTP     START THE PRINTER           U2J02450
                    CNTUP MDX  L  50,1      INCR ISS CTR (I/O OP CTR)   U2J02460
                          NOP               MAY SKIP                    U2J02470
                          MDX     STXIT-2   EXIT TO CALLING PROG        U2J02480
                    *                                              2-10 U2J02482
                          BSS  E  0                                2-10 U2J02483
                    SENSE DC      *-*       STORAGE FOR CALL +1    2-10 U2J02484
                          DC      /3700     SENSE PRT IOCC WD      2-10 U2J02485
                    CTR48 DC      *-*       PTR SCAN CNT BUFFER    2-10 U2J02486
                    CTRWD DC      *-*       PRINTABLE CHAR CNT     2-10 U2J02487
                    CTRX  DC      *-*       PRINTABLE CHAR THIS LN 2-10 U2J02488
                    NIND  DC      *-*       NUMERIC INDICATOR      2-10 U2J02489
                    K13   DC      22        CTR IF NUMERIC MODE    2-12 U2J02490
                    *                                              2-12 U2J02495
                    *THIS SECTION DOES THE CARRIAGE CONTROL FUNCTION    U2J02500
                    * PROCESSING                                        U2J02510
                    *                                                   U2J02520
                    FC20  LD      CTR16     WAIT FOR 16 IDLE SCANS      U2J02530
                          BSC     Z-                                    U2J02540
                          MDX     FC20                                  U2J02550
                    FC20A XIO     SENSE                                 U2J02560
                          SRA     12        IS THE CARRIAGE BUSY        U2J02570
                          BSC  L  FC20A,Z   YES,SENSE PTR AGAIN         U2J02580
                          LD      K12       NO, SET 6-CTR FOR CHAN CHK  U2J02590
                          STO  L  STOPC                            2-12 U2J02600
                          SRA     16        CLEAR ACC                   U2J02610
                          SLT     4         GET 2ND HEX DIGIT FROM Q    U2J02620
                          STO     AFTIN     NOT ZERO--IMMEDIATE CTRL    U2J02630
                    *                       ZERO--CTRL AFTER PRINT      U2J02640
                          BSC  L  FC25,Z    IS IT ZERO                  U2J02650
                          SLT     4         YES,TRY 3RD HEX DIGIT       U2J02660
                          BSC  L  ILLGL,+-  IS IT ZERO ALSO,ERROR EXIT  U2J02670
                    FC25  S       K12       NO,SUB 12                   U2J02680
                          BSC  L  FC44,-Z   IS THIS A SKIP              U2J02690
                          LDX   2 0         YES                         U2J02700
                          BSC  L  FC39,-    IS IT A SKIP TO CHAN 12     U2J02710
                          A       K3        NO                          U2J02720
                          LDX   2 1         SET XR2 FOR SHIFT & COUNT   U2J02730
                          BSC  L  FC39,+-   IS IT CHAN 9                U2J02740
                          A       K3        NO, INCR XR2                U2J02750
                          MDX   2 1                                     U2J02760
                    FC38  BSC  L  FC39,+-   TEST FOR NEXT CHANNEL       U2J02770
                          A       K1        NO, LOOP & TRY FOR 5,4,3,   U2J02780
                          MDX   2 1         *2,1                        U2J02790
                          MDX  L  STOPC,-1  CTR TO LIMIT LOOPS          U2J02800
                          MDX     FC38      RET TO CHK CHAN             U2J02810
                          MDX     FC14C     ILLEGAL CALL-TAKE ERROR     U2J02820
                    *                       EXIT.(ACC NEG BY NOW)       U2J02830
                    *                                                   U2J02840
                    *CONSTANTS AND BUFFER AREA                          U2J02850
                    *                                                   U2J02860
                    DSW   DC      *-*       DVC STATUS WD          2-10 U2J02865
                          BSS  E                                        U2J02870
                    CTR16 DC      *-*       CTR FOR 16 IDLE SCANS (48)  U2J02880
                    CTR2  DC      *-*       CTR FOR 2 IDLE SCANS  (12)  U2J02890
                    *                                                   U2J02920
                    *SET UP SKIP MASK,AND EXECUTE SKIP OR EXIT          U2J02930
                    *                                                   U2J02940
                    FC39  LD      K1        SET UP BIT FOR SKIP MASK    U2J02950
                          SLCA  2                                       U2J02960
                          OR      SIGNB     SET SIGN BIT ON             U2J02970
                    FC44  STO     SPSK      PTV=SPACE, NEG= SKIP        U2J02980
                          LD      AFTIN     SHOULD EXECUTION WAIT       U2J02990
                          BSC  L  STXIT-2,+- GO TO EXIT IF YES,ELSE     U2J03000
                          LD      SPSK      DETERMINE IF SKIP OR SPACE. U2J03010
                          BSC  L  SPACE,-   IS IT A SKIP                U2J03020
                          XIO     STRTC     YES,START CARRIAGE          U2J03030
                          MDX     CNTUP     GO INCR ISS CTR, RET        U2J03040
                    K3    DC      3         CON OF 3                    U2J03050
                    *                                                   U2J03060
                    *SPACE CARRIAGE CONTROL PROCESSING                  U2J03070
                    *                                                   U2J03080
                    SPACE XIO     CARSP     START SPACES THAT INTRPT    U2J03090
                    *                       *SERVICE PART WILL FINISH   U2J03100
                          MDX     CNTUP     INCR ISS CTR, RET TO USER   U2J03110
                    *                                                   U2J03120
                    *CONSTANTS AND BUFFER AREA                          U2J03130
                    *                                                   U2J03140
                    AFTIN DC      *-*       CTRL BEFORE OR AFTER PR     U2J03150
                    SPSK  DC      *-*       SKIP OR SPACE INDR     2-10 U2J03155
                    K1    DC      1         CON OF 1               2-10 U2J03157
                          BSS  E                                        U2J03160
                    STRTC DC      /4040     BLK CHAR FOR COMPARE   2-10 U2J03170
                          DC      /3404     START CARRIAGE              U2J03180
                    BLANK EQU     *-2       BLK CHARS              2-10 U2J03190
                          EJCT                                          U2J03200
                    *************************************************** U2J03210
                    *                                                 * U2J03220
                    * THIS SECTION SERVICES THE INTERRUPTS WHICH      * U2J03230
                    * OCCUR ON INTERRUPT LEVEL 01, THAT COME FROM     * U2J03240
                    * THE 1132 PRINTER.                               * U2J03250
                    *                                                 * U2J03260
                    *************************************************** U2J03270
                          SPAC                                          U2J03275
                    FC50  STX   2 OUT+1     SAVE XR2                    U2J03280
                          STX   1 OUT+3     SAVE XR1               2-10 U2J03285
                          XIO  L  SENSR-1   SENSE WITH RESET       2-12 U2J03290
                          STO     DSW       HOLD DSW                    U2J03300
                          SLA     1         IS IT A SKIP REQUEST        U2J03310
                          BSC  L  FC56,-    NO,BR TO CONT CHK           U2J03320
                          SLA     7         YES,GET CARRIAGE CHAN NO.   U2J03330
                          SRA     8         RIGHT JUSTIFY               U2J03340
                          OR      SIGNB     SET UP DSW FOR COMPARE      U2J03350
                          EOR     SPSK      CMP W/COMMAND               U2J03360
                          BSC     Z         DO THEY MATCH               U2J03370
                          MDX     FC60      NO,GO CONT CHK              U2J03380
                          STO  L  $1132     ZERO SYSTEM 1132 INDR  2-12 U2J03385
                          STO     SPSK      CLEAR MASK                  U2J03400
                          XIO     STOPC     STOP CARRIAGE               U2J03410
                    FC54  MDX  L  50,-1     DECR ISS CTR                U2J03420
                          NOP               MAY SKIP                    U2J03430
                          MDX     FC60      CONTINUE                    U2J03440
                          SPAC                                          U2J03442
                    *************************************************** U2J03444
                    *                                                 * U2J03450
                    *THIS SECTION SERVICES CARRIAGE RESPONSE REQUESTS * U2J03460
                    *                                                 * U2J03470
                    *************************************************** U2J03472
                          SPAC                                          U2J03474
                    FC56  SLA     1         IS IT A SPACE REQUES        U2J03480
                          BSC     -         IS CARR SPACE DONE          U2J03490
                          MDX     FC60      NO                          U2J03500
                          LD      DSW       YES,GET DSW                 U2J03510
                          OR   L  $1132     OR IN SYSTEM INDICATOR 2-12 U2J03512
                          BSC  L  *+1,E     SKIP IF CHANNEL 12 ONR 2-12 U2J03514
                          MDX     *+2       NO CHANNEL 12 BIT ON   2-12 U2J03516
                          STO  L  $1132     SET SYSTEM INDICATOR   2-12 U2J03518
                    *                       *FOR CHANNEL 12 FOUND  2-12 U2J03519
                          LD      SPSK                                  U2J03540
                          S       K1        DECR SPACE CNT              U2J03550
                          STO     SPSK      STORE BACK NEW CNT          U2J03560
                          BSC  L  FC54,+    DECR ISS CTR+EXIT IF ZERO,  U2J03570
                          XIO     CARSP     *ELSE KEEP SPACING          U2J03580
                    *                                                   U2J03590
                    *CONTINUE CHK IF NOT SKIP OR SPACE REQUEST          U2J03600
                    *                                                   U2J03610
                    FC60  LD      DSW       PUT DSW IN PASS             U2J03620
                          BSC  L  OUT,-     IS 11.2 MS PTR INTPRT BIT=1 U2J03650
                          LD      CTR46     YES,CHK IF DOING 47 IDLES   U2J03660
                          BSC  L  FC63,Z    YES,GO DECR CNT AND EXIT    U2J03670
                          BSI     CLEAR     CLEAR SCAN FIELD       2-10 U2J03674
                          LD      DSW       NO                          U2J03680
                          SLA     4         DID PRESENT SCAN FINISH     U2J03690
                          BSC  L  FC70,-    YES,BR                      U2J03700
                          LD   L  CTRWD     RESTORE PREVIOUS       2-12 U2J03702
                          A    L  CTRX      *CHARACTER COUNT       2-12 U2J03704
                          STO  L  CTRWD     *FOR REMAINING CHARS   2-12 U2J03706
                          LD      K46       NO, SET UP FOR IDLES        U2J03710
                          STO     CTR46                                 U2J03720
                          LD   L  $SCAN+7   SET SCAN COMPLETE      2-12 U2J03740
                          OR      K1        *INDICATOR             2-12 U2J03742
                          STO  L  $SCAN+7                          2-12 U2J03744
                    OUT   LDX  L2 *-*       RESTORE XR2                 U2J03750
                          LDX  L1 *-*       RESTORE XR1            2-10 U2J03755
                          BSC  I  INT1      TO USER VIA ILS SUBR        U2J03760
                    *                                                   U2J03770
                    *IF INCOMPLETE SCAN OCCURRED, DO 47 IDLES TO GET    U2J03780
                    *THE PRINT WHEEL BACK TO TRY SAME CHAR AGAIN.       U2J03790
                    *                                                   U2J03800
                    FC63  S       K1        DECR CTR46                  U2J03810
                          STO     CTR46                                 U2J03820
                          MDX     OUT       EXIT VIA ILS 01.            U2J03830
                    *                                                   U2J03840
                    *CONSTANTS AND BUFFER AREA                          U2J03850
                    *                                                   U2J03860
                    SIGNB DC      /8000     SIGN BIT                    U2J03870
                          BSS  E                                        U2J03880
                    CARSP DC      /8080     STG FOR CHAN 1 MASK CON     U2J03890
                          DC      /3401     CARRIAGE SPACE IOCC         U2J03900
                    STOPC DC      *-*       CTR TO LIMIT LOOPS-CHAN CHK U2J03910
                          DC      /3402     STOP CARRIAGE IOCC          U2J03920
                    *                                                   U2J03930
                    *BEGIN PRINT MASK SET UP                            U2J03940
                    *                                                   U2J03950
                    FC70  LDD  L  CTR48     ANY UNPRNTED CHARS     2-10 U2J03960
                          BSC     Z         BR IF 48 SCANS COMPLETE2-10 U2J03970
                          RTE     16        CK IF CHARS ALL PRT    2-10 U2J03980
                          BSC  L  EMIT,-Z   NO,BRCH                2-11 U2J03990
                    *                                              2-10 U2J04000
                          LD      CTR16     ARE IDLE CYCLES DONE        U2J04010
                          BSC  L  FC81,Z    NO,GO DECR IDLE CNT         U2J04020
                          MDX  L  CTR2,-6   DECR 2-CTR                  U2J04040
                          MDX     OUT       TO USER IF NOT ZERO YET     U2J04050
                          XIO     STOPP     IF ZERO,CUT OFF INTRPTS     U2J04060
                          MDX  L  50,-1     DECR LOC 50                 U2J04070
                          MDX     OUT       TO USER                     U2J04080
                          MDX     OUT       TO USER IF SKIP             U2J04090
                    *                                                   U2J04100
                    *TAKE CARE OF 16 IDLES CNT AFTER PRINT COMPLETE     U2J04110
                    *                                                   U2J04120
                    FC81  MDX  L  CTR16,-3  DECR IDLE CNT FOR 1 IDLE    U2J04130
                          MDX     OUT       EXIT IF NOT DONE            U2J04140
                          LD      SPSK      DONE,GET SPACE/SKIP INDR    U2J04150
                          BSC  L  FC91,Z    IS POST-PR SPACE/SKIP ASKED U2J04160
                          LD   L  SENSE     NO, GET THE CONTROL WORD    U2J04170
                          SLA     11        ALL ZERO IF SPACE 1 LINE    U2J04180
                          SRA     15        ALL ONES IF SUPPRESS SPACE  U2J04190
                          EOR     K1        CHANGE 0 TO 1-1 TO 0   2-11 U2J04200
                          STO     SPSK      PTV--SET SPACE.NEG--INHIBIT U2J04210
                    *                                                   U2J04220
                    *THIS SECTION SETS UP THE SPACE OR SKIP AFTER PRINT U2J04230
                    *                                                   U2J04240
                    FC91  STO  L  AFTIN     SET INDR OFF (+ OR -)  2-12 U2J04250
                          LD   L  $1132     SYSTEM CHANNEL 12 INDR  212 U2J04265
                          BSC  L  STRE4,E   IF ODD,CHAN 12 WAS PASSED   U2J04270
                          SRA     1                                     U2J04280
                          BSC  L  STRE3,E   IF ODD,CHAN 9 WAS PASSED    U2J04290
                    FC84  LD   L  SPSK      IF 9/12 NOT FOUND,START2-12 U2J04300
                          BSC     +-        AFTER SPACE/SKIP IF PRESENT U2J04310
                          MDX     OUT       TO USER IF NO SPACE/SKIP    U2J04320
                          BSC  L  FC86,+Z   IS A SPACE CALLED FOR       U2J04330
                          XIO     CARSP     YES,START THE CARRIAGE      U2J04340
                    UP7   MDX  L  50,1      INCR THE ISS CTR            U2J04350
                          NOP               MAY SKIP                    U2J04360
                          MDX     OUT       EXIT TO USER                U2J04370
                          EJCT                                          U2J04372
                    *************************************************** U2J04374
                    *                                                 * U2J04376
                    *A SKIP TO CHANNEL 9 OR CHANNEL 12 IS INDICATED.  * U2J04378
                    *   ZERO THE SYSTEM CHANNEL 12 INDICATOR ($1132)  * U2J04380
                    *   AND BRANCH TO THE USER'S ERROR ROUTINE.  LOAD * U2J04382
                    *   ACCUMULATOR WITH A /0003 FOR A SKIP TO CHAN-  * U2J04384
                    *   NEL 9 OR WITH A /0004 FOR A SKIP TO CHANNEL 12* U2J04386
                    *                                                 * U2J04387
                    *************************************************** U2J04388
                          SPAC                                          U2J04389
                    STRE4 SLA     16        ZERO ACCUMULATOR AND    212 U2J04390
                          STO  L  $1132     STORE IN CH 12 INDR     212 U2J04392
                          LD      STOPP     LOAD CONSTANT OF 4      212 U2J04394
                          MDX     STRE3+5   GO TO USER ERROR RTN    212 U2J04400
                    STRE3 SLA     16        ZERO ACCUMULATOR AND    212 U2J04410
                          STO  L  $1132     *STORE IN CH 12 INDR    212 U2J04412
                          LD   L  K3        LOAD CONSTANT OF 3      212 U2J04414
                          BSI  I  *-*       GO TO USER ERROR RTN        U2J04420
                          BSC  L  FC84,+-   TAKE NO ACTION IF CLEARED,  U2J04430
                          LD      CARSP     ELSE SET UP SKIP TO CHAN 1  U2J04440
                          STO  L  SPSK                             2-12 U2J04450
                    FC86  XIO  L  STRTC     START CARRIAGE         2-12 U2J04460
                          MDX     UP7       GO INCR ISS CTR,EXIT        U2J04470
                    *                                                   U2J04480
                    *CONSTANTS AND BUFFER AREA                          U2J04490
                    *                                                   U2J04500
                          BSS  E                                        U2J04520
                    STOPP DC      4         ERROR CODE FOR CHAN 12 PASS U2J04530
                          DC      /3440     STOP PRINTER IOCC           U2J04540
                    K46   DC      46        CTR CON FOR 47 IDLES        U2J04550
                    SENSR DC      /3701     SENSE W/RESET IOCC          U2J04560
                    CTR46 DC      0         CTR FOR IDLES               U2J04570
                    *                                                   U2J04590
                    *THIS SECTION CLEARS THE PRINT SCAN FIELD   (32-39) U2J04600
                    *                                                   U2J04610
                    CLEAR DC      *-*       SAVE RET ADDR               U2J04620
                          SLT     32        CLEAR A AND Q REGS          U2J04630
                          LDX   2 -8        SET CTR FOR 4 PASSES        U2J04640
                    CL2   STD  L2 40        CLEAR 2 WDS                 U2J04650
                          MDX   2 2         DECR XR2 BY 2               U2J04660
                          MDX     CL2       RET IF NOT ZERO             U2J04670
                          MDX  L  $SCAN+7,1  SET SCAN CMPLT INDR   2-12 U2J04675
                          BSC  I  CLEAR     RET                         U2J04680
                          END                                           U2J04690
