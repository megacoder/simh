                          ABS                                           DKN00010
                          ORG     /00F0                                 DKN00020
                    *************************************************** DKN00030
                    *                                                 * DKN00040
                    * STATUS - VERSION 1, MODIFICATION LEVEL 3        * DKN00050
                    *                                                 * DKN00060
                    *THIS IS A SPECIAL VERSION OF DISKN FOR 2311 DISK * DKN00070
                    **DRIVE ATTACHMENT TO THE 1133 MULTIPLEXER        * DKN00080
                    *                                                 * DKN00090
                    *FUNCTION/OPERATION-                              * DKN00100
                    *     DISKN HAS THE FOLLOWING SIX DISK FUNCTIONS- * DKN00110
                    *     *TEST  (TEST FOR 2311 UNIT BUSY)            * DKN00120
                    *     *READ                                       * DKN00130
                    *     *WRITE WITHOUT READ-BACK-CHECK              * DKN00140
                    *     *WRITE WITH READ-BACK-CHECK                 * DKN00150
                    *     *WRITE IMMEDIATE                            * DKN00160
                    *     *SEEK                                       * DKN00170
                    *ENTRY POINTS-                                    * DKN00180
                    *     DISKN IS ENTERED                            * DKN00190
                    *     *FROM THE MONITOR AT DN000  (00F2)          * DKN00200
                    *     *FROM THE TRANSFER VECTOR AT DN030 - 3      * DKN00210
                    *     AS FOLLOWS-                                 * DKN00220
                    *     LIBF     DISKN     (OR BSI  L  DZ000)       * DKN00230
                    *     DC       /WXYZ     CONTROL                  * DKN00240
                    *     DC       AREA     I/O AREA ADDRESS          * DKN00250
                    *     DC       ERROR     ERROR ROUTINE            * DKN00260
                    *     WHERE-   W = I/O FUNCTION CODE              * DKN00270
                    *              X = NOT USED                       * DKN00280
                    *              Y = SEEK OPTION                    * DKN00290
                    *              Z = DISPLACEMENT OPTION            * DKN00300
                    *                                                 * DKN00310
                    *EXTERNAL REFERENCES-  (ALL IN COMMA)             * DKN00320
                    *     $ACDE                                       * DKN00330
                    *     $CYLN                                       * DKN00340
                    *     $DBSY                                       * DKN00350
                    *     $DCYL                                       * DKN00360
                    *     $EXIT                                       * DKN00370
                    *     $FPAD                                       * DKN00380
                    *     $IOCT                                       * DKN00390
                    *     $PST2                                       * DKN00400
                    *     $PRET                                       * DKN00410
                    *                                                 * DKN00420
                    *EXITS- NORMAL                                    * DKN00430
                    *     *RETURN TO CALL + 3 ON TEST AND WRITE       * DKN00440
                    *      IMMEDIATE FUNCTIONS.                       * DKN00450
                    *     *RETURN TO CALL + 4 ON ALL OTHER FUNCTIONS. * DKN00460
                    *                                                 * DKN00470
                    *EXITS- ERROR                                     * DKN00480
                    *     *BRANCH TO $PRET WITH /5000 IN ACCUMULATOR  * DKN00490
                    *      WHEN DISK NOT READY.                       * DKN00500
                    *     *BRANCH TO $PRET WITH /5001 IN ACCUMULATOR  * DKN00510
                    *      ON BAD CALL.                               * DKN00520
                    *     *BRANCH TO $PST2 WITH /5003 IN ACCUMULATOR  * DKN00530
                    *      ON WRITE SELECT OR POWER UNSAFE.           * DKN00540
                    *     ***DRIVE CODE AND SECTOR ADDRESS IN EXT.    * DKN00550
                    *     *BRANCH TO $EXIT ON DISK OVERFLOW.          * DKN00560
                    *     *BRANCH TO CALLER ERROR ROUTINE ON POST-    * DKN00570
                    *      OPERATIVE ERROR.                           * DKN00580
                    *                                                 * DKN00590
                    *ATTRIBUTES-                                      * DKN00600
                    *     *DISKN MAY BE CALLED FROM THE MONITOR OR BY * DKN00610
                    *      A LIBF.                                    * DKN00620
                    *     *DISKN WILL OPERATE ON THE 2311 AND THE HOME* DKN00630
                    *      FILE SIMULTANEOUSLY.                       * DKN00640
                    *     *DISKN ACCEPTS I/O AREAS BEGINNING ON UNEVEN* DKN00650
                    *      BOUNDARIES.                                * DKN00660
                    *      *DISKN IS NOT RELOCATABLE.                 * DKN00670
                    *      *DISKN WILL NOT ALLOW OVERLAP WITH THE 2311* DKN00680
                    *      *DISKN IS REUSABLE.                        * DKN00690
                    *      DRIVE AND WILL TRAP THE SECOND OPERATION   * DKN00700
                    *      DIRECTED TO THE 2311 UNTIL THE FIRST OPER- * DKN00710
                    *      TION IS COMPLETED.                         * DKN00720
                    *      *A SEEK IS NOT PHYSICALLY PERFORMED UNTIL  * DKN00730
                    *      A XIO READ OR WRITE IS ISSUED TO THE 2311. * DKN00740
                    *                                                 * DKN00750
                    *NOTES- NONE                                      * DKN00760
                    *                                                 * DKN00770
                    *************************************************** DKN00780
                          DC      $NEND-*   DISKN WORD COUNT            DKN00790
                          DC      /FF68     -'DNID                      DKN00800
                          DC      $NEND-6-*+1  ADDR OF SLET EXTRACT     DKN00810
                          DC      1         NO ENTRIES IN SLET EXTRACT  DKN00820
                          ORG     *-2                                   DKN00830
                    DN000 DC      *-*       ENTRY PT FOR MONITOR PROGS. DKN00840
                          STX   2 DN110+3   SAVE CONTENTS OF XR2.       DKN00850
                          LDX  L2 DN902     FETCH ADDR OF PSEUDO CALL.  DKN00860
                          MDX     DN210     BRANCH AROUND ENTRY POINTS. DKN00870
                    DN020 DC      *-*       ENTRY POINT FOR INTERRUPTS. DKN00880
                          MDX     DN240     BR TO INTERRUPT PROCESSING. DKN00890
                          STX   2 DN110+3   SAVE CONTENTS OF XR2.       DKN00900
                          LDX  I2 *-*       PUT LINK WD FROM TV IN XR2. DKN00910
                    DN030 STX   1 DN110+1   SAVE CONTENTS OF XR1        DKN00920
                          STX   2 DN230+1   SAVE ADDRESS OF CALL+1.     DKN00930
                          STD     DN902     SAVE CONTENTS OF ACC/EXT.   DKN00940
                          STS     DN100     SAVE STATUS OF INDICATORS.  DKN00950
                    DN040 LD    2 0         LOAD CONTROL PARAMETER 2-11 DKN00960
                          SRT     12        ISOLATE FIRST DIGIT    2-11 DKN00970
                          BSC  L  DN050-3,+-  BR IF FUNC IS TEST   2-11 DKN00980
                          LD    2 1         LOAD ADDR OF USERS BUFFER   DKN00990
                          STO  L  DNXR1     POINT XR1 TO USERS     2-11 DKN01000
                    *                       *BUFFER                2-11 DKN01010
                          LD    1 1         LOAD USERS SECTOR ADDRESS.  DKN01020
                          SRT     16        SHIFT TO EXTENSION.         DKN01030
                          SLT     5         SET UP XR1                  DKN01040
                          SRA     1         * WITH THE             2-11 DKN01045
                          STO     DN050+1   *  LOGICAL             2-11 DKN01050
                    DN050 LDX  L1 *-*       *   DRIVE CODE NUMBER.      DKN01060
                          MDX   1 -4        SKIP IF DR CODE LEGAL  2-11 DKN01100
                          MDX     DN200     BR TO PRE-OP ERROR EXIT.    DKN01110
                          MDX   1 4         RESET XR1 TO DR CODE   2-11 DKN01120
                    DN060 NOP               IN CASE OF SKIP.            DKN01130
                    DN070 LDS     0         TURN OFF OVERFLOW INDICATOR DKN01140
                          LD    2 0         LOAD CONTROL PARAMETER.     DKN01150
                          SRA     12        ISOLATE FUNCTION CODE.      DKN01160
                          BSC  L  DN250,Z   BRANCH IF NOT TEST FUNCTION DKN01170
                    *                                                   DKN01180
                    * PERFORM THE TEST FUNCTION.                        DKN01190
                    *                                                   DKN01200
                          LD   L1 $ACDE     LOAD AREA CODE OF DR N 2-11 DKN01210
                          BSI  L  DN700     UPON RETURN FR DN700   2-11 DKN01220
                    *                       *ACC = 0, IF HOME FILE 2-11 DKN01230
                    *                       *ACC = 2, IF 1ST 2311  2-11 DKN01240
                    *                       *ACC = 4, IF 2ND 2311  2-11 DKN01250
                          BSC     +         SKIP IF NOT HOME FILE  2-11 DKN01255
                          A       DN914     ADD 1                  2311 DKN01260
                          AND     $DBSY     COMPARE WITH BUSY IND  2311 DKN01270
                          BSC     Z         SKIP IF NOT BUSY       2311 DKN01280
                          MDX   2 -1        SET UP FOR RETURN TO CALL+3 DKN01290
                    DN090 MDX   2 3         SET UP FOR RETURN TO CALL+4 DKN01300
                    *                                                   DKN01310
                    * RESTORE REGISTERS AND INDICATORS                  DKN01320
                    * AND SET UP FOR RETURN TO CALLING PROGRAM.         DKN01330
                    *                                                   DKN01340
                          LDD     DN902     RESTORE CONTENTS OF ACC/EXT DKN01350
                    DN100 LDS     0         RESTORE CARRY AND OVERFLOW. DKN01360
                          STX   2 DN120     STORE RETURN ADDRESS.       DKN01370
                    DN110 LDX  L1 *-*       RESET XR1 TO ORIG CONTENTS. DKN01380
                          LDX  L2 *-*       RESET XR2 TO ORIG CONTENTS. DKN01390
                          BSC  L  *-*       RETURN TO USER.             DKN01400
                    DN120 EQU     *-1                                   DKN01410
                    *                                                   DKN01420
   9                * CONSTANTS AND WORK AREAS.                         DKN01430
                    *                                                   DKN01440
                    DN900 DC      /5000     DISK NOT READY ERROR CODE.  DKN01450
                    DN901 DC      /5001     BAD CALL ERROR CODE.        DKN01460
                    *                                                   DKN01470
                    DN903 DC      5         CONSTANT                    DKN01480
                    *                                                   DKN01490
                    * PREPARE TO MAKE PRE-OPERATIVE ERROR EXIT.         DKN01500
                    *                                                   DKN01510
                    DN170 LD      DN900     LOAD DISK NOT RDY ERR CODE. DKN01520
                          MDX     DN200+1   BRANCH TO EXIT TO $PRET.    DKN01530
                    DN180 LD    1 DN982-D   IS IT A MONITOR CALL        DKN01540
                          S       DN902+2                               DKN01550
                          BSC  L  DN610,+-  BRANCH IF YES               DKN01560
                    DN190 BSC  L  DN380,O   BR IF IT IS A POST-OP ERR.  DKN01570
                    DN200 LD      DN901     FETCH PREOP ERROR CODE.     DKN01580
                          LDX  I2 DN230+1   LD XR2 WITH ADDR OF CALL+1. DKN01590
                          BSI  L  $PRET     BR TO PREOPERATIVE ERR TRAP DKN01600
                          MDX     DN040     BRANCH TO RE-ENTER DISKN.   DKN01610
                    *                                                   DKN01620
                    *   SET UP CONTROL PARAMETER FOR MONITOR CALL.      DKN01630
                    *                                                   DKN01640
                    DN210 SLA     8                                     DKN01650
                          BSC     Z         BRANCH IF READ OPERATION.   DKN01660
                          LD      DN070     SET UP FUNCTION             DKN01670
                          A       DN060     *INDICATOR.                 DKN01680
                          MDX     DN030     BR TO CONT PROCESSING CALL. DKN01690
                    *                                                   DKN01700
                    *    SET THE BIT FOR DRIVE N IN THE DISK BUSY       DKN01710
                    * INDICATOR AND INCREMENT THE SYSTEM I/O COUNTER.   DKN01720
                    *                                                   DKN01730
                    DN220 LD   L  DNXR1     LOAD VALUE IN XR1      2-11 DKN01740
                          S       DN260+1   SET TO                 2-11 DKN01750
                    *                       * 0, IF HOME FILE      2-11 DKN01760
                    *                       * 2, IF 1ST 2311       2-11 DKN01770
                    *                       * 4, IF 2ND 2311       2-11 DKN01780
                          BSC     +         SKIP IF POSITIVE       2-11 DKN01790
                          A       DN914     ADD 1                  2-11 DKN01800
                          OR      $DBSY     SET APPROPRIATE BIT ON 2-11 DKN01810
                          STO     $DBSY     *IN DISK BUSY INDICATOR2-11 DKN01820
                          MDX  L  $IOCT,1   INCREMENT SYS I/O COUNTER.  DKN01830
                          NOP               IN CASE OF SKIP             DKN01840
                    DN230 LDX  L2 *-*       XR2 = ADDRESS OF CALL+1.    DKN01850
                          LD    1 DN983-D   LOAD SEEK FLAG         2311 DKN01860
                          BSC  L  DN235,-   BR IF NO SEEK NEEDED    212 DKN01870
                          XIO  L  DN952     OTHERWISE INITIATE SEEK2311 DKN01880
                          MDX     DN090     TO RETN TO CALL +4          DKN01881
                    DN235 LD    1 DN970-D   LOAD RD-AFTER-SEEK FLAG 212 DKN01882
                          BSC  L  DN236,Z-  RETURN                  212 DKN01883
                          LD    1 DN978+1-D HAS SEEK BEEN CHECKED   212 DKN01884
                          BSC  L  DN236,-   YES, RETURN             212 DKN01885
                          LD      *-1       LOAD NEGATIVE NUMBER    212 DKN01890
                    *                                                   DKN01891
                          STO   1 DN983-D   STORE IN SEEK FLAG      212 DKN01892
                          STX   1 DN904                             212 DKN01893
                          LD   L  DN912     LOAD /0101              212 DKN01894
                          EOR   1 DN968-D   EXCLUSIVE OR WITH SENSE 212 DKN01895
                          STO     DN904+1   WD 2 OF READ IOCC       212 DKN01896
                          XIO     DN904     ISSUE READ COMMAND      212 DKN01897
                    DN236 MDX     DN090                             212 DKN01898
                    *                                                   DKN01900
                    DN240 BSC  L  DN440     BR TO INTERRUPT PROCESSING. DKN01910
                    DN914 DC      /0001     WORD USED TO SET $DBSY  2-9 DKN01920
                    *                                                   DKN01940
                    *        PSEUDO CALL TO DISKN FOR MONITOR.          DKN01950
                    *                                                   DKN01960
                    DN904 BSS  E  2         READ-CHECK IOCC         212 DKN01965
                          BSS  E  0                                     DKN01970
                    DN902 DC      *-*       WD TO SAVE CONTENTS OF ACC. DKN01980
                          DC      *-*       WD TO SAVE CONTENTS OF EXT. DKN01990
                          DC      $PST2     ADDR POSTOPERATIVE ERR TRAP DKN02000
                          BSC  I  DN000     BRANCH TO RETURN TO MONITOR DKN02010
                    *                                                   DKN02020
                    * PROCESS ALL  FUNCTIONS EXCEPT TEST.               DKN02030
                    *                                                   DKN02040
                    DN250 LD   L1 $ACDE     LOAD DR N AREA CODE    2-11 DKN02050
                          BSC  L  DN200,+-  BR IF DR NOT ON SYSTEM 2-11 DKN02055
                          BSI  L  DN700     UPON RETURN FR DN700   2-11 DKN02060
                    *                       *ACC = 0, IF HOME FILE 2-11 DKN02070
                    *                       *ACC = 2, IF 1ST 2311  2-11 DKN02080
                    *                       *ACC = 4, IF 2ND 2311  2-11 DKN02085
                          STO     DN255+1   SAVE FOR XR1 SETTING   2-11 DKN02090
                          BSC     +         SKIP IF NOT HOME FILE  2-11 DKN02095
                          A       DN914      SET BIT FOR DRIVE N   2311 DKN02100
                          AND  L  $DBSY     COMPARE WITH BUSY IND   212 DKN02110
                          BNZ     DN250     BRANCH ON BUSY         2311 DKN02120
                    DN255 LDX  L1 *-*       XR1 = 2*PHY DEVICE     2-11 DKN02125
                    DN260 MDX  L1 D         POINT XR1 TO APPROPRIATE    DKN02130
                          LD    2 1         LOAD AND SAVE ADDRESS  2-11 DKN02132
                          STO   1 DN994-D   *OF USERS I/O AREA     2-11 DKN02134
                          LD    2 2         LOAD AND SAVE ADDRESS  2-11 DKN02136
                          STO   1 DN982-D   *OF USERS ERROR SUBR   2-11 DKN02138
                          LD    2 0         LOAD CONTROL PARAMETER.     DKN02140
                          LDX  I2 DN050+1   XR2 = LOGICAL DR NO.   2-11 DKN02142
                          STO   1 DN984-D   SAVE CONTROL PARAMETER 2-11 DKN02144
                          SLA     12        ISOLATE FOURTH DIGIT.       DKN02150
                          BSC  L  DN270,+-  BR IF SECT ADDR IS ABSOLUTE DKN02160
                          SLT     11        SHIFT IN USERS SECTOR ADDR. DKN02170
                          A    L2 $FPAD     ADD IN FILE PROT ADDR  2-11 DKN02180
                          SRT     11        SHIFT SECTOR ADDR INTO EXT. DKN02190
                    DN270 SLT     15        SHIFT SCT ADDR INTO ACC     DKN02200
                          SRA     4         *AND SHIFT OUT DR NO        DKN02210
                          STO   1 DN990-D   STORE INITIAL SECTOR ADDR.  DKN02220
                          STO   1 DN991-D   STORE WORKING SECTOR ADDR.  DKN02230
                          LD    1 DN984-D   LOAD CONTROL PARAMETER 2-11 DKN02280
                          RTE     12        ISOLATE FUNCTION CODE       DKN02290
                          STO   1 DN984-D   SAVE FUNCTION CDE           DKN02300
                          LD   L  DNXR2     LOAD LOGICAL DR NO.    2-11 DKN02310
                          STO   1 DN976-D   *AND SAVE FOR USE IN   2-11 DKN02320
                    *                       *INTERRUPT PROCESSING  2-11 DKN02330
                          LD   L2 $ACDE     LOAD AREA CODE OF DR N 2-11 DKN02420
                          OR      DN931     OR IN 2ND WD OF SENSE IOCC. DKN02430
                          STO   1 DN968-D   STORE IN SENSE IOCC    2-11 DKN02440
                          XIO   1 DN968-1-D SENSE DR N W/RESET     2-11 DKN02450
                          BSC  L  DN300,Z+  BR IF WR/SEL OR PWR/UNSAFE. DKN02460
                          SLA     2         TEST NOT READY BIT OF DSW.  DKN02470
                          BSC  L  DN170,Z+  BRANCH IF DRIVE N NOT READY DKN02480
                    DN280 LD    1 DN984-D   LOAD FUNCTION CODE.         DKN02490
                          S       DN903     SUBTRACT FIVE.              DKN02500
                          STO   1 DN970-D                               DKN02510
                          BSC  L  DN200,Z-  BR IF FUNCTION CODE ILLEGAL DKN02520
                          BSC  L  DN560,Z   BR IF FUNCTION IS NOT SEEK. DKN02530
                          SLT     8         ISOLATE THIRD DIGIT         DKN02540
                          SLA     12        *OF CONTROL PARAMETER.      DKN02550
                          BSC  L  DN580,+-  BR IF SEEK OPTION NOT USED. DKN02560
                          BSC  L  DN570+1   SET UP SCTR ADDR FOR SK-OPT DKN02570
                    *                                                   DKN02580
                    * RESET THE BIT FOR DRIVE N IN THE DISK BUSY        DKN02590
                    * INDICATOR AND DECREMENT THE SYSTEM I/O COUNTER.   DKN02600
                    *                                                   DKN02610
                    DN290 DC      *-*                                   DKN02620
                          LD   L  DNXR1     LOAD VALUE IN XR1      2-11 DKN02630
                          S       DN260+1   SET TO                 2-11 DKN02640
                    *                       * 0, IF HOME FILE      2-11 DKN02650
                    *                       * 2, IF 1ST 2311       2-11 DKN02660
                    *                       * 4, IF 2ND 2311       2-11 DKN02670
                          BSC     +         SKIP IF POSITIVE       2-11 DKN02680
                          A       DN914     ADD 1                  2-11 DKN02690
                          MDX  L  $IOCT,-1  DECREMENT I/O COUNTER  2-11 DKN02700
                          NOP               IN CASE OF SKIP        2-11 DKN02710
                          EOR  L  $DBSY     SET OFF BUSY BIT FOR        DKN02720
                          STO  L  $DBSY     *DR N AND SAVE              DKN02730
                          BSC  I  DN290                                 DKN02740
                    *                                                   DKN02750
                    DN300 LD      DN911     LD WR/SEL-PWR UNSAFE ERR CD DKN02760
                          BSC  L  DN200+1   BR TO SET UP ERROR EXIT 212 DKN02770
                    *                                                   DKN02780
                    * CONSTANTS AND WORK AREAS.                         DKN02790
                    *                                                   DKN02800
                    *                                                   DKN02810
                    *                                                   DKN02820
                    * SET UP FOR AND THEN BRANCH TO ERROR               DKN02830
                    * SUBROUTINE OF THE CALLING PROGRAM.                DKN02840
                    *                                                   DKN02850
                    DN340 DC      *-*                                   DKN02860
                          SRT     16        SHIFT ERROR CODE TO EXT.    DKN02870
                          LD    1 DN982-D   TEST FOR MONITOR CALL       DKN02880
                          S       DN902+2                               DKN02890
                          BSC  L  DN345,Z   BR IF NOT MONITOR CALL      DKN02900
                          LD      DN934     LD ER DISP FOR MON CALL 2-9 DKN02910
                          SRT     16        SHIFT ERROR CODE TO EXT.    DKN02920
                    DN345 LD      DN930     RESET RETRY                 DKN02930
                          STO   1 DN985-D   *COUNTER TO 16.             DKN02940
                          LD    1 DN976-D   LOAD LOGICAL DRIVE NO. 2-11 DKN02950
                          SLA     12        PUT DRIVE CODE IN BITS 0-3. DKN02970
                          OR    1 DN991-D   OR IN SECTOR ADDRESS.       DKN02980
                          RTE     16                                    DKN02990
                          BSI  I1 DN982-D   BR TO USERS ERROR ROUTINE.  DKN03000
                          BSC  I  DN340     RETURN TO WHERE ERROR FOUND DKN03010
                    *                                                   DKN03020
                    DN350 SLA     2         BR IF NOT WRITE         2-8 DKN03030
                          BSC  L  DN356,-   *SELECT ERROR           2-8 DKN03040
                          LD      DN911     ERROR CODE TO ACC       2-8 DKN03050
                          BSI  L  $PST2     BR TO POST ERR TRAP     2-8 DKN03060
                          BSI     DN290     RESET $IOCT,$DBSY       2-8 DKN03070
                          MDX     DN382     BR TO CONTINUE TO EXIT  2-8 DKN03080
                    DN356 LD    1 DN984-D   LOAD FUNCTION CODE          DKN03090
                          SRA     2         SEE IF FUNC WRITE IMMEDIATE DKN03100
                          BSC  L  DN460,Z   BR IF FUNC WRITE IMMEDIATE. DKN03110
                          LD    1 DN995-D   SEE IF ERROR IN RDBCK CHECK DKN03120
                          BSC  L  DN400,E   BRANCH IF READBACK CHECK.   DKN03130
                          LD    1 DN985-D   LOAD AND                    DKN03140
                          S       DN933     * DECREMENT                 DKN03150
                          STO   1 DN985-D   *   RETRY COUNTER.          DKN03160
                          BSC  L  DN370,Z   BRANCH TO TRY AGAIN.        DKN03170
                    DN360 LD    1 DN984-D   LOAD FUNCTION CODE.         DKN03180
                          SRA     1         SET UP                      DKN03190
                          A       DN933     *ERROR CODE.                DKN03200
                          BSI     DN340     BRANCH TO SET UP ERROR EXIT DKN03210
                          BSC  L  DN460,+-  BRANCH TI IGNORE ERROR.     DKN03220
                    DN370 XIO   1 DN986-D   RETRY READ OR WRITE.        DKN03230
                          MDX     DN450-1   BR TO RETRN TO INT LEV 2311 DKN03240
                    *                                                   DKN03250
                    * SET UP FOR POST-OPERATIVE DISK OVFLO ERROR EXIT.  DKN03260
                    *                                                   DKN03270
                    DN380 LD   L  DN963     LOAD ERROR CODE             DKN03280
                          BSI     DN340     BRANCH TO SET UP ERROR EXIT DKN03290
                          BSI     DN290     BR TO RESET BUSY INDRS      DKN03300
                    DN382 BOSC L  *         TURN OFF INTERRUPT LEVEL.   DKN03310
                          MDX  L  $DBSY,0   LOOP UNTIL ALL DISK         DKN03320
                          MDX     *-3       *OPERATIONS COMPLETE.       DKN03330
                          EXIT              EXECUTE A CALL EXIT         DKN03340
                    *                                                   DKN03350
                    * CONSTANTS AND WORK AREAS.                         DKN03360
                    *                                                   DKN03370
                    DN920 DC      /0680     READBACK CHECK IOCC WORD.   DKN03380
                    DN921 DC      /2028     CONSTANT OF HEX 2028.       DKN03390
                    DN931 DC      /0701     2ND WORD OF SENSE W/RESET   DKN03400
                    *                                                   DKN03410
                    DN390 LD    1 DN984-D   LOAD FUNCTION CODE.         DKN03420
                          S       DN932     SUBTRACT THREE.             DKN03430
                          BSC  L  DN430,Z   BR IF NOT WR W/RDBCK CHECK. DKN03440
                          LD    1 DN995-D   SEE IF READBACK CHECK DONE. DKN03450
                          BSC  L  DN420,E   BR IF READBACK CHECK DONE.  DKN03460
                    DN400 S       DN933     DECREMENT READBACK          DKN03470
                          STO   1 DN995-D   *CHECK RETRY COUNTER.       DKN03480
                          BSC  L  DN415,+-  BRANCH IF 16 RETRIES MADE.  DKN03490
                          BSC  L  DN410,E   BRANCH TO READBACK CHECK.   DKN03500
                          LD    1 DN986-D   RESTORE                 2-6 DKN03510
                          STO  L  DNXR2     *FIRST TWO WORDS        2-9 DKN03520
                          LD    1 DN980-D   * IF                    2-6 DKN03530
                          STO   2 0         * ERROR                 2-6 DKN03540
                          LD    1 DN980+1-D * IN                    2-6 DKN03550
                          STO   2 1         * READ BACK CHECK       2-6 DKN03560
                          LD      DN941     LD WD TO SET UP WRITE IOCC. DKN03570
                          MDX     *+1       SKIP OVER NEXT INSTRUCTION. DKN03580
                    DN410 LD      DN920     LD WD TO SET UP RDBK/CHK.   DKN03590
                          STO   1 DN986+1-D STORE IN 2ND WORD OF IOCC.  DKN03600
                          LD    1 DN990-D   LOAD ORIGINAL SECTOR ADDR.  DKN03610
                          STO   1 DN991-D   STORE AS WORKING SECT ADDR. DKN03620
                          LDS     1         SET OVERFLOW INDICATOR.     DKN03630
                          MDX     DN280     BR TO SET UP FOR RDBACK/CHK DKN03640
                    *                                                   DKN03650
                    * CONSTANTS AND WORK AREAS.                         DKN03660
                    *                                                   DKN03670
                    DN930 DC      @TCNT     NUMBER OF RETRIES TO MAKE.  DKN03680
                    DN911 DC      /5002     WR/SEL-PWR UNSAFE ERROR CODEDKN03690
                          BSS  E  0                                     DKN03700
                    DN912 DC      /0101     MASK FOR BUILDING READ IOCC DKN03710
                          DC      /0300     2ND WD OF SENSE INTRPT IOCC DKN03720
                    DN933 DC      1         CONSTANT OF DECIMAL ONE.    DKN03730
                    DN934 DC      /5003     MONITOR CALL DISK ERROR CD. DKN03740
                    DN932 DC      3         WRITE W/RDBCK FUNCTION CODE DKN03750
                    *                                                   DKN03760
                    DN415 LD      DN940     RESET READBACK CHECK        DKN03770
                          STO   1 DN995-D   *RETRY COUNTER TO 32.       DKN03780
                          MDX     DN360     BRANCH TO ERROR EXIT.       DKN03790
                    *                                                   DKN03800
                    * SET UP FOR RETURN TO INTERRUPT LEVEL.             DKN03810
                    *                                                   DKN03820
                    DN420 LD      DN940     RESTORE READBACK CHECK      DKN03830
                          STO   1 DN995-D   *RETRY COUNTER TO 32.       DKN03840
                    DN430 BSI     DN290     BRANCH TO RESET $DBSY       DKN03850
                          MDX     DN450-1   BR TO RETRN TO INT LEV*2311 DKN03860
                    *                                                   DKN03870
                    DN440 LDX   1 0                                2-11 DKN03880
                          XIO     DN912     SENSE THE ILSW              DKN03890
                    DN445 LDX   2 5                                2-11 DKN03895
                          BSC  L  DN446,+Z  SET XR1 AS FOLLOWS     2-11 DKN03900
                          SLCA  2           * 0,IF HOME FILE INT.  2-11 DKN03910
                          MDX   1 2         * 2,IF 1ST 2311 INTRPT 2-11 DKN03920
                          MDX     DN445     * 4,IF 2ND 2311 INTRPT 2-11 DKN03930
                    DN446 MDX  L1 D         INCRE POINT. TO TABLES 2-11 DKN03940
                          LD    1 DN976-D   LOAD LOGICAL DR NO.    2-11 DKN03945
                          STO  L  DNXR2     XR2 = LOG DR NO.       2-11 DKN03950
                          LDD  L  DN952     SAVE CONTENTS OF      *2311 DKN03960
                          STD  L  DN942     *WORDS IN CALL PORTION.     DKN03970
                          XIO   1 DN968-1-D SENSE DR N W/RESET     2-11 DKN03980
                          OR    1 DN983-D   OR IN SEEK FLAG TO DSW.     DKN03990
                          BSC  L  DN460,-   BR IF NOT SEEK OR NO ERROR. DKN04000
                          EOR   1 DN983-D   EXCLUSIVE OR OUT SEEK FLAG. DKN04010
                          BSC  L  DN350,Z+  BR IF THERE WAS AN ERROR.   DKN04020
                          LD    1 DN970-D   LOAD RD-AFTER-SEEK CHK FLAG DKN04030
                          BSC  L  DN490-1,Z- BRANCH IF NO CHECK NEEDED. DKN04040
                          LD    1 DN978+1-D SEE IF SEEK HAS BEEN CHKD.  DKN04050
                          BSC  L  DN490,-   BRANCH IF RD HAS BEEN DONE. DKN04060
                          STX   1 DN952     SET UP BFR ADDR FOR READ.   DKN04070
                          LD      DN912     SET UP 2ND                  DKN04080
                          EOR   1 DN968-D   * WORD OF              2-11 DKN04090
                          STO     DN952+1   *   READ IOCC.              DKN04100
                          XIO     DN952     INITIATE READ-AFTER-SEEK.   DKN04110
                          MDX     *+3       BRANCH AROUND SEEK     2311 DKN04120
                    DN450 LD    1 DN983-D   LOAD SEEK FLAG         2311 DKN04130
                          BSC     +Z        SKIP IF SEEK NOT NEEDED2311 DKN04140
                          XIO     DN952     OTHERWISE INITIATE SEEK2311 DKN04150
                          LDD     DN942     RESTORE TWO WORDS      2311 DKN04160
                          STD     DN952     *IN CALL PORTION.           DKN04170
                          BSC  I  DN020     RETURN TO INTERRUPT LEVEL.  DKN04180
                    *                                                   DKN04190
                    DN460 LDD   1 DN986-D   LOAD IOCC OF LAST OPERATION DKN04200
                          RTE     3         ADD ONE TO SECTOR NUMBER,   DKN04210
                          A       DN921     *AND 320 TO I/O ADDRESS.    DKN04220
                          RTE     29                                    DKN04230
                          STD   1 DN986-D   STO IOCC FOR NEXT OPERATION DKN04240
                          STO  L  DNXR2     SET XR2 TO ADDR OF I/O B2-9 DKN04250
                          LD    2 0         LOAD AND SAVE FIRST         DKN04260
                          STO     DN952     *WORD OF I/O BUFFER.        DKN04270
                          LD    2 1         LOAD AND SAVE SECOND        DKN04280
                          STO     DN952+1   *WORD OF I/O BUFFER.        DKN04290
                          LD    1 DN993-D   LOAD WD CNT FOR NEXT OPER.  DKN04300
                          BSC     +         SKIP IF POSITIVE.           DKN04310
                          MDX     DN470      ALL DONE - BRANCH TO EXIT. DKN04320
                          STO   2 0         STORE WORD COUNT IN BUFFER. DKN04330
                          BSC     C         SKIP IF NO SEEK NEEDED.     DKN04340
                          STO   1 DN983-D   MAKE SEEK FLAG POSITIVE.    DKN04350
                          LD    1 DN991-D   LOAD AND                    DKN04360
                          A       DN933     * INCREMENT WORKING         DKN04370
                          STO   1 DN991-D   *   SECTOR ADDRESS.         DKN04380
                          STO   2 1         STORE SECT ADDR IN I/O BUFR DKN04390
                    DN470 LD    1 DN980-D   RESTORE FIRST WORD OF       DKN04430
                          STO  L2 -320      *LAST I/O BUFFER.           DKN04440
                          LD    1 DN980+1-D RESTORE SECOND WORD OF      DKN04450
                          STO  L2 -319      *LAST I/O BUFFER.           DKN04460
                          LDS     0         RESET OVERFLOW INDICATOR.   DKN04470
                          LDD     DN952     LOAD AND SAVE FIRST TWO     DKN04480
                          STD   1 DN980-D   *WORDS OF NEW I/O BUFFER.   DKN04490
                    DN480 LD      DN930     RESTORE READ/WRITE          DKN04500
                          STO   1 DN985-D   *RETRY COUNTER TO 16.       DKN04510
                          LD    1 DN986-D   SET XR2 TO THE              DKN04520
                          STO     DN952     * ADDRESS OF THE            DKN04530
                          LDX  I2 DN952     *   DISK BUFFER.            DKN04540
                          LDD   1 DN993-D   LOAD WD CNT FOR THIS OPER.  DKN04550
                          BSC  L  DN390,+   BR IF ENTIRE OPERATION DONE DKN04560
                          STO   2 0         ST WORD CNT IN THE BFR AREA DKN04570
                          LD    1 DN991-D   SET UP SECTOR ADDRESS       DKN04580
                          STO   2 1         *FOR THIS OPERATION.        DKN04590
                          LD    1 DN983-D   LOAD SEEK FLAG.             DKN04600
                          BSC  L  DN570,Z-  BRANCH IF SEEK NECESSARY.   DKN04610
                          XIO   1 DN968-1-D SENSE DR N W/RESET     2-11 DKN04620
                          SLA     3         SEE IF DISK N IS BUSY.      DKN04630
                          BSC     -         SKIP IF DISK N IS BUSY.     DKN04640
                          XIO   1 DN986-D   INITIATE NEXT OPERATION.    DKN04650
                          MDX     DN520     BR TO SET UP FOR NEXT OPER. DKN04660
                    *                                                   DKN04670
                    * CONSTANTS AND WORK AREAS.                         DKN04680
                    *                                                   DKN04690
                    DN940 DC      2*@TCNT   TWICE NO OF RETRIES TO MAKE DKN04700
                    DN941 DC      /0500     WRITE IOCC WORD.            DKN04710
                    *                                                   DKN04720
                          EJCT                                          DKN04721
                    *************************************************** DKN04722
                    *                                                 * DKN04723
                    *IF A DUMP OPERATION IS REQUIRED, CORE LOCATIONS  * DKN04724
                    *   /0284 AND /0285 ARE USED FOR WORD COUNT AND   * DKN04725
                    *   SECTOR ADDRESS WHEN WRITING TO THE CORE IMAGE * DKN04726
                    *   BUFFER. THESE LOCATIONS MUST NOT CONTAIN CODE * DKN04727
                    *   WHICH IS EXECUTED IN THAT OPERATION. THUS, THE* DKN04728
                    *   BSS OF 2 WHICH IS SHOWN BELOW MUST RESIDE AT  * DKN04729
                    *   THOSE ADDRESSES.                              * DKN04730
                    *                                                 * DKN04731
                    *************************************************** DKN04732
                          SPAC                                          DKN04733
                          MDX     *+2       BRANCH AROUND BSS       212 DKN04734
                          BSS     2         SAVE AREA FOR WC AND SA 212 DKN04735
                          LD    1 DN991-D                               DKN04736
                    DN490 STO  L2 $CYLN     SAVE CURRENT ARM POS   2-11 DKN04740
                          LD      *                                     DKN04750
                          STO   1 DN978+1-D                             DKN04760
                          LD    1 DN985-D   LOAD AND                    DKN04770
                          S       DN933     * DECREMENT                 DKN04780
                          STO   1 DN985-D   RESTORE RETRY COUNTER   212 DKN04796
                          BSC  L  DN550,Z   BRANCH TO TRY AGAIN.        DKN04800
                          LD      DN932     LOAD ERROR CODE.            DKN04810
                          BSI  L  DN340                                 DKN04820
                          BSC  L  DN550,Z   BRANCH TO TRY AGAIN.        DKN04830
                          STO   1 DN983-D   CLEAR SEEK FLAG.            DKN04840
                    DN500 SLT     16        CLEAR EXTENSION.            DKN04850
                          LD    1 DN986+1-D LOAD 2ND WORD OF IOCC.      DKN04860
                          SRA     12        BRANCH IF IOCC AND BUFFER   DKN04870
                          BSC  L  DN530,Z   *AREA ALREADY SET UP.       DKN04880
                    DN510 LD    1 DN976-D   LOAD LOGICAL DRIVE NO. 2-11 DKN04886
                          STO  L  DNXR2     *AND STORE IN XR2      2-11 DKN04888
                          LD    1 DN991-D   LOAD WORKING SECT ADDR 2-11 DKN04890
                          AND     DN954     AND OUT ALL BUT SECTOR NO.  DKN04900
                          OR    1 DN986+1-D OR IN 2ND WORD OF IOCC.     DKN04910
                          OR   L2 $ACDE     OR IN AREA CODE        2-11 DKN04950
                          STO   1 DN986+1-D STORE IN 2ND WORD OF IOCC.  DKN04960
                          SLT     16        CLEAR EXTENSION.            DKN04970
                    DN520 LD    1 DN992-D   LOAD AND SAVE               DKN04980
                          STO   1 DN993-D   *REMAINING WORD COUNT.      DKN04990
                          BSC     +         SKIP IF POSITIVE.           DKN05000
                          MDX     DN530     BR IF OPERATION COMPLETE.   DKN05010
                          S       DN951     SUBTRACT DECIMAL 320.       DKN05020
                          STO   1 DN992-D   STORE REMAINING WORD COUNT. DKN05030
                    DN525 BSC     Z-        SKIP IF NOT POSITIVE.       DKN05040
                          SRA     16        CLEAR ACCUMULATOR.          DKN05050
                          A       DN953     ADD DECIMAL 321.            DKN05060
                          STO   1 DN993-D   STORE WORD CNT FOR NEXT OP. DKN05070
                    DN530 SLT     16        SHIFT EXTENSION INTO ACC.   DKN05080
                          OR    1 DN983-D   OR IN SEEK FLAG.            DKN05090
                          BSC  L  DN220,O   BRANCH IF CALL PROC.    212 DKN05100
                          BSC  L  DN450,Z   BRANCH IF SEEK IN PROGRESS. DKN05110
                          MDX     DN480     BRANCH TO SET UP READ/WRITE DKN05120
                    *                                                   DKN05130
                    * CONSTANTS AND WORK AREAS.                         DKN05140
                    *                                                   DKN05150
                    DN942 BSS  E  2         TWO WORD WORK AREA          DKN05160
                    DN952 BSS  E  2         WORK AREA                   DKN05170
                    DN953 DC      321       1 PLUS NO. WDS PER SECTOR   DKN05180
                    DN951 DC      320       NO OF WORDS PER SECTOR      DKN05190
                    *                                                   DKN05200
                    DN550 LDS     1         SET OVERFLOW INDICATOR.     DKN05210
                          MDX     DN610     BRANCH TO SET UP SEEK.      DKN05220
                    *                                                   DKN05230
                    DN560 LD    1 DN994-D   LOAD ADDR OF USERS I/O AREA DKN05240
                          STO   1 DN986-D   STORE IN 1ST WORD OF IOCC.  DKN05250
                          STO     DN952                                 DKN05260
                          LDX  I2 DN952                                 DKN05270
                          LD    2 0         LOAD WORD COUNT.            DKN05280
                          BSC  L  DN200,+   BR TO PRE-OP ERR IF NOT +.  DKN05290
                          STO   1 DN980-D   SAVE 1ST WORD OF I/O BUFFER DKN05300
                          STO   1 DN992-D   SAVE WORD COUNT.            DKN05310
                          LD    2 1         LOAD AND SAVE SECOND        DKN05320
                          STO   1 DN980+1-D *WORD OF I/O BUFFER.        DKN05330
                          LD    1 DN984-D   LOAD FUNCTION CODE.         DKN05340
                          SRA     2         SEE IF WRITE IMMEDIATE.     DKN05350
                          BSC  L  DN580,+   BR IF NOT WRITE IMMEDIATE.  DKN05360
                          LD    1 DN976-D   LOAD LOGICAL DR NO.    2-11 DKN05364
                          STO  L  DNXR2     *AND STORE IN XR2      2-11 DKN05365
                          LD    1 DN991-D   LOAD USERS SECTOR ADDRESS.  DKN05370
                          AND     DN954     AND OUT ALL BUT SECTOR NO.  DKN05380
                          OR   L2 $CYLN     OR IN CURRENT ARM POS. 2-11 DKN05390
                          STO   1 DN991-D   STORE AS WORKING SCTR ADDR. DKN05400
                          MDX  L  DN230+1,-1 SET FOR RETURN TO CALL+3.  DKN05410
                          LD      DN941     LD 2ND WORD OF WRITE IOCC.  DKN05420
                          MDX     DN630     BRANCH TO SET UP FOR WRITE. DKN05430
                    *                                                   DKN05440
                    DN954 DC      /0007     MASK TO OBTAIN SCTR NO.     DKN05450
                    *                                                   DKN05470
                    DN570 LDS     1         SET OVERFLOW INDICATOR.     DKN05480
                          LD    1 DN976-D   LOAD LOGICAL DR NO.    2-11 DKN05486
                          STO  L  DNXR2     *AND STORE IN XR2      2-11 DKN05488
                          LD   L2 $CYLN     LOAD CURRENT ARM POS.  2-11 DKN05490
                          A       DN960     ADD TO IT ONE CYLINDER.     DKN05500
                          STO   1 DN991-D   STORE AS WORKING SECT ADDR. DKN05510
                          LD    1 DN984-D   LOAD FUNCTION CODE.         DKN05520
                          SRA     2                                     DKN05530
                          STO   1 DN970-D                               DKN05540
                    DN580 LDD   1 DN970-D   LOAD FUNCTION CODE     2311 DKN05580
                          A       DN960                                 DKN05590
                          AND     DN960                                 DKN05600
                          STD     DN952                                 DKN05610
                    *                                                   DKN05616
                    * SET UP XR2 WITH ADDR OF DR N DEF CYLN TABLE       DKN05618
                    *                                                   DKN05620
                          LDX  L2 $DCYL     XR2 = BASE DEF CYL TBL 2-11 DKN05622
                          MDX  I2 DN952+1   *ADDR.  ADD THREE TIMES2-11 DKN05624
                          MDX  I2 DN952+1   *THE LOGICAL DRIVE     2-11 DKN05626
                          MDX  I2 DN952+1   *NUMBER                2-11 DKN05628
                          LD      DN961                                 DKN05630
                          SRT     16                                    DKN05640
                          STO     DN961                                 DKN05650
                          LD    1 DN991-D   LD WORKING SCTR ADDR        DKN05660
                          STX   1 DN952+1   SAVE CONTENTS OF XR1.       DKN05670
                          LDX   1 3                                     DKN05680
                    *                                                   DKN05690
                    * CHECK FOR DEFECTIVE CYLINDERS.                    DKN05700
                    *                                                   DKN05710
                    DN590 S     2 0         SUB A DEFECTIVE CYL LIMIT.  DKN05720
                          BSC  L  DN600,Z+  BR IF NOT DEF CYLN          DKN05730
                          MDX  L  DN961,8   COUNTER FOR UNUSED SCTRS    DKN05740
                          BSC     Z                                     DKN05750
                          S       DN952                                 DKN05760
                          A       DN960     INCREMENT SCTR ADDR BY 8    DKN05770
                    DN600 A     2 0         ADD THE DEFECTIVE CYL LIMIT DKN05780
                          MDX   2 1                                     DKN05790
                          MDX   1 -1                                    DKN05800
                          MDX     DN590     CHECK NEXT DEFECTIVE ADDR.  DKN05810
                          LDX  I1 DN952+1   RESTORE CONTENTS OF XR1.    DKN05820
                          STO   1 DN991-D   LOAD WORKING SECTOR ADDRESS DKN05830
                          S       DN961     CHECK FOR ADDR ABOVE        DKN05840
                          S       DN965     *1600                       DKN05850
                          BSC  L  DN190,-   BR IF OVERFLOW              DKN05860
                          SLT     16                                    DKN05870
                          STO     DN961                                 DKN05880
                          LD    1 DN976-D   LOAD LOGICAL DRIVE NO. 2-11 DKN05885
                          STO  L  DNXR2     *AND STORE IN XR2      2-11 DKN05890
                          LD   L2 $FPAD     LOAD FILE PROTECT ADDR 2-11 DKN05895
                          SLA     4         SHIFT OUT DR NO             DKN05900
                          SRA     4                                     DKN05910
                          S     1 DN991-D                               DKN05920
                          BSC  L  DN610,+   BR IF ABOVE FILE PROT ADDR  DKN05930
                          LD    1 DN984-D   LOAD FUNCTION CODE.         DKN05940
                          SRA     1         SEE IF FUNCTION IS WRITE.   DKN05950
                          BSC  L  DN180,E   BRANCH IF FUNCTION IS WRITE DKN05960
                    *                                                   DKN05970
                    * CHECK TO SEE IF A SEEK IS NECESSARY.              DKN05980
                    *                                                   DKN05990
                    DN610 XIO   1 DN968-1-D  SENSE DR N W/RESET    2-11 DKN05992
                          SLA     4         HOME BIT TO SIGN       2-11 DKN05994
                          BSC     +Z        SKIP IF NOT HOME       2-11 DKN05996
                          MDX   1 0         SKIP IF PHY DR 0       2-11 DKN05998
                          MDX     DN615     BR TO CHECK FOR SEEK   2-11 DKN06000
                          SLA     16        PHY DR 0 IS HOME. ZERO 2-11 DKN06002
                          STO  L2 $CYLN     *CURRENT ARM POSITION  2-11 DKN06004
                    DN615 LD    1 DN991-D   LOAD WORKING SECT ADDR 2-11 DKN06006
                          S    L2 $CYLN     SUB CURRENT ARM POSITIN2-11 DKN06010
                          SRT     3         SHIFT IN NO OF CYLS TO SEEK DKN06020
                          BSC  L  DN620,+-  BR IF NO SEEK NEEDED        DKN06030
                    *                                                   DKN06040
                    * SEEK                                              DKN06050
                    *                                                   DKN06060
                          SRT     16        NO OF CYLS INTO EXT    2311 DKN06100
                          AND     DN963     AND WITH BIT 13.            DKN06110
                          OR      DN964     OR IN SEEK IOCC WORD.       DKN06120
                          OR   L2 $ACDE     OR IN AREA CODE        2-11 DKN06130
                          RTE     16                                    DKN06140
                          BSC     -         SKIP IF SEEK TOWARD HOME.   DKN06150
                          MDX     *+2       SKIP NEXT TWO INSTRUCTIONS. DKN06160
                          EOR     DN962     COMPLEMENT NO. CYLINDERS TO DKN06170
                          S       DN962     *BE SOUGHT TO GET POS. NO.  DKN06180
                          STD     DN952     STORE IOCC WORDS.           DKN06190
                          LD      DN962     LOAD NEGATIVE NUMBER.       DKN06230
                    DN620 STO   1 DN983-D   STORE IN SEEK FLAG          DKN06240
                          BSC  L  DN500,O   BR IF IN INTERRUPT PROCESS  DKN06250
                          LD    1 DN984-D   LOAD FUNCTION CODE.         DKN06260
                          SRA     1                                     DKN06270
                          A       DN978                                 DKN06280
                          EOR     DN954                                 DKN06290
                          SLA     8                                     DKN06300
                    DN630 STO   1 DN986+1-D STORE IN 2ND WORD OF IOCC.  DKN06310
                          LDS     1         SET OVERFLOW INDICATOR.     DKN06320
                          LD    1 DN992-D   LOAD REMAINING WORD COUNT.  DKN06330
                          BSC  L  DN510,Z-  BR IF OPERATION NOT SEEK.   DKN06340
                          LD    1 DN983-D   LOAD SEEK FLAG.             DKN06350
                          BSC  L  DN220,+-  BR IF SEEK NOT NECESSARY212 DKN06360
                    DN640 BSC  L  DN220,Z   BRANCH IF SEEK NECESSARY.   DKN06370
                          LDS     1         SET OVERFLOW INDICATOR.     DKN06380
                          BSC  L  DN480                                 DKN06390
                    DN700 DC      *-*       ENTRY/RETURN ADDR      2-11 DKN06400
                          STX   2 DN720+1   SAVE XR2               2-11 DKN06402
                          LDX   2 0         SET XR2 TO 0           2-11 DKN06404
                          BSC  L  DN710,-   BR IF HOME FILE        2-11 DKN06406
                          AND     DN957     AND WITH /B800         2-11 DKN06408
                          EOR     DN957     EOR WITH /B800         2-11 DKN06410
                          LDX   2 4         SET XR2 TO 4           2-11 DKN06412
                          BSC     Z         SKIP IF 2ND 2311       2-11 DKN06414
                          MDX   2 -2        IF 1ST 2311 MAKE XR2=2 2-11 DKN06416
                    DN710 LD   L  DNXR2     LOAD XRE VAL TO ACC    2-11 DKN06418
                    DN720 LDX  L2 *-*       RESTORE XR2            2-11 DKN06420
                          BSC  I  DN700     RETURN TO MAINLINE     2-11 DKN06422
                          EJCT                                          DKN06426
                    *                                                   DKN06427
                    * CONSTANTS AND WORK AREAS                          DKN06428
                    *                                                   DKN06429
                    *                                                   DKN06430
                    DN957 DC      /B800     MASK FOR PHY DR DETER  2-11 DKN06437
                    DN960 DC      8         NO. SECTORS PER CYLINDER .  DKN06440
                    DN961 DC      *-*       TEMPORARY STORAGE           DKN06450
                    DN962 DC      -1        CONSTANT OF MINUS ONE.      DKN06460
                          BSS  E  0         ASSURE EVEN BOUNDARY   2-11 DKN06465
                    DN963 DC      4         SEEK HOME BIT.              DKN06470
                    DN968 DC      *-*       2ND WD SENSE IOCC DR 0 2-11 DKN06475
                    DN964 DC      /0400     SEEK IOCC WORD.             DKN06480
                          DC      *-*       2ND WD SENSE IOCC DR 1 2-11 DKN06485
                    DN965 DC      1600      1+MAX SCTR ADDR             DKN06490
                          DC      *-*       2ND WD SENSE IOCC DR 2 2-11 DKN06500
                          BSS  E  0                                     DKN06510
                    DN970 DC      *-*       FUNCTION CODE FOR DRIVE 0   DKN06520
                    DN976 DC      *-*       LOG DR = OF HOME FILE  2-11 DKN06530
                          DC      *-*       FUNCTION CODE FOR DRIVE 1   DKN06540
                          DC      *-*       LOG DR = OF 1ST 2311   2-11 DKN06550
                          DC      *-*       FUNCTION CODE FOR DRIVE 2   DKN06560
                          DC      *-*       LOG DR = OF 2ND 2311   2-11 DKN06570
                    DN978 DC      1                                     DKN06820
                          DC      -1   CURRENT ARM POSITION - DRIVE 0   DKN06830
                          DC      1                                     DKN06840
                          DC      -1   CURRENT ARM POSITION - DRIVE 1   DKN06850
                          DC      1                                     DKN06860
                          DC      -1   CURRENT ARM POSITION - DRIVE 2   DKN06870
                    DN980 BSS     6         1ST 2 WDS OF I/O AREA  2-11 DKN06920
                    DN982 DC      *-*  ADDR OF USERS ERR SUBR - DRIVE 0 DKN06930
                    DN983 DC      *-*  SEEK FLAG - DRIVE 0.             DKN06940
                          DC      *-*  ADDR OF USERS ERR SUBR - DRIVE 1 DKN06950
                          DC      *-*  SEEK FLAG - DRIVE 1.             DKN06960
                          DC      *-*  ADDR OF USERS ERR SUBR - DRIVE 2 DKN06970
                          DC      *-*  SEEK FLAG - DRIVE 2.             DKN06980
                    DN984 DC      *-*  FUNCTION CODE - DRIVE 0.         DKN07030
                    DN985 DC      50   READ/WRITE RETRY CTR - DRIVE 0.  DKN07040
                          DC      *-*  FUNCTION CODE - DRIVE 1.         DKN07050
                          DC      50   READ/WRITE RETRY CTR - DRIVE 1.  DKN07060
                          DC      *-*  FUNCTION CODE - DRIVE 2.         DKN07070
                          DC      50   READ/WRITE RETRY CTR - DRIVE 2.  DKN07080
                    DN986 BSS     6         IOCC FOR NEXT OPER.    2-11 DKN07130
                    DN990 DC      *-*  ORIGINAL SECTOR ADDR - DRIVE 0.  DKN07140
                    DN991 DC      *-*  WORKING SECTOR ADDRESS - DRIVE 0 DKN07150
                          DC      *-*  ORIGINAL SECTOR ADDR - DRIVE 1.  DKN07160
                          DC      *-*  WORKING SECTOR ADDRESS - DRIVE 1 DKN07170
                          DC      *-*  ORIGINAL SECTOR ADDR - DRIVE 2.  DKN07180
                          DC      *-*  WORKING SECTOR ADDRESS - DRIVE 2 DKN07190
                    DN992 DC      *-*  INTERMEDIATE WORD CNT - DRIVE 0. DKN07240
                    DN993 DC      *-*  WORD COUNT FOR NEXT OP - DRIVE 0 DKN07250
                          DC      *-*  INTERMEDIATE WORD CNT - DRIVE 1. DKN07260
                          DC      *-*  WORD COUNT FOR NEXT OP - DRIVE 1 DKN07270
                          DC      *-*  INTERMEDIATE WORD CNT - DRIVE 2. DKN07280
                          DC      *-*  WORD COUNT FOR NEXT OP - DRIVE 2 DKN07290
                    DN994 DC      *-*  ADDR OF USERS I/O AREA - DRIVE 0 DKN07340
                    DN995 DC      100  READBACK CHECK COUNTER - DRIVE 0 DKN07350
                          DC      *-*  ADDR OF USERS I/O AREA - DRIVE 1 DKN07360
                          DC      100  READBACK CHECK COUNTER - DRIVE 1 DKN07370
                          DC      *-*  ADDR OF USERS I/O AREA - DRIVE 2 DKN07380
                          DC      100  READBACK CHECK COUNTER - DRIVE 2 DKN07390
                    $NEND EQU     /03A2     1 + END OF DISKN       2-11 DKN07440
                    *                                                   DKN07450
                          BSS     $NEND-*-6   PATCH AREA           2-11 DKN07460
                    *                                                   DKN07470
                          DC      @CIL1     CORE IMAGE LDR-PH 1, PH ID  DKN07480
                          DC      *-*       CORE ADDRESS                DKN07490
                          DC      *-*       WORD COUNT                  DKN07500
                          DC      *-*       SECTOR ADDRESS              DKN07510
                          DC      *-*       WORD COUNT OF CORE LOAD     DKN07520
                          DC      *-*       SCTR ADDR OF CORE LOAD      DKN07530
                    D     EQU     DN978                                 DKN07540
                    DNXR1 EQU     /0001     POINT TO XR1            2-9 DKN07550
                    DNXR2 EQU     /0002     POINT TO XR2            2-9 DKN07560
                    $PRET EQU     /0028                                 DKN07580
                    $IOCT EQU     /0032                                 DKN07590
                    $PST2 EQU     /0085                                 DKN07600
                    $DBSY EQU     /00EE                                 DKN07610
                    @TCNT EQU     /0011                                 DKN07620
                    @CIL1 EQU     /00A0                                 DKN07630
                    $ACDE EQU     /009F                                 DKN07640
                    $CYLN EQU     /009A                                 DKN07650
                    $DCYL EQU     /00A4                                 DKN07660
                    $FPAD EQU     /0095                                 DKN07670
                          END     DN000                                 DKN07680
