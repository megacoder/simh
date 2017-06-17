                          HDNG    PRNTZ - FORTRAN 1132 PRINTER I/O SUBR T5H00000
                    *************************************************** T5H00010
                    *STATUS - VERSION 2, MODIFICATION 11              * T5H00020
                    *                                                 * T5H00030
                    *PROGRAM NAME -                                   * T5H00040
                    *   FULL NAME - FORTRAN 1132 PRINTER I/O SUBR     * T5H00050
                    *   CODE NAME - PRNTZ                             * T5H00060
                    *                                                 * T5H00070
                    *FUNCTION/OPERATION-                              * T5H00080
                    *   THIS SUBROUTINE PRINTS UNPACKED EBCDIC DATA ON* T5H00090
                    *   THE 1132 PRINTER. SPACING IS DONE ON THE BASIS* T5H00100
                    *   OF USING THE FIRST CHARACTER OF THE BUFFER.   * T5H00110
                    *                                                 * T5H00120
                    *ENTRY POINTS-                                    * T5H00130
                    *   * PRNTZ-CALL PORTION FROM FORTRAN SIFO PROGRAM* T5H00140
                    *   * AZ100-INTERRUPT ENTRY FROM ILS01            * T5H00150
                    *   THE SUBROUTINE IS ENTERED BY A LIBF    PRNTZ  * T5H00160
                    *                                                 * T5H00170
                    *INPUT-                                           * T5H00180
                    *   * XR1 CONTAINS THE OUTPUT BUFFER ADDRESS      * T5H00190
                    *   * XR2 CONTAINS THE WORD COUNT                 * T5H00200
                    *                                                 * T5H00210
                    *OUTPUT-                                          * T5H00220
                    *   * PRINTER SPACING AND A LINE OF PRINT.        * T5H00230
                    *                                                 * T5H00240
                    *EXTERNAL REFERENCES                              * T5H00250
                    *   * $SCAN                                       * T5H00260
                    *   * $PRET                                       * T5H00270
                    *   * $IOCT                                       * T5H00280
                    *   * $1132                                       * T5H00290
                    *                                                 * T5H00300
                    *EXITS-                                           * T5H00310
                    *   NORMAL-                                       * T5H00320
                    *      * CALL PORTION-PRNTZ+1, BACK TO SFIO       * T5H00330
                    *      * INTERRUPT PORTION-AZ100, BACK TO ILS01   * T5H00340
                    *   ERROR-                                        * T5H00350
                    *      * $PRET-MOINTOR PRE-OPERATIVE ERROR TRAP   * T5H00360
                    *        WHEN NOT IN READY STATUS.                * T5H00370
                    *                                                 * T5H00380
                    *TABLE/WORK AREAS-N/A                             * T5H00390
                    *                                                 * T5H00400
                    *ATTRIBUTES-RELOCATABLE                           * T5H00410
                    *                                                 * T5H00420
                    *SPEED -                                          * T5H00430
                    *  *THE SLOWEST THAT THIS SUBROUTINE PRINTS IS 80 * T5H00440
                    *   LINES PER MINUTE.                             * T5H00450
                    *  *NUMERICAL PRINTING IS AT 110 LINES PER MINUTE.* T5H00460
                    *  *THE NUMBER OF PRINT SCAN CYCLES NEED TO PRINT * T5H00470
                    *   A LINE IS THE NUMBER OF CHARACTERS FROM THE   * T5H00480
                    *   PRESENT POSITON OF THE PRINT WHEELS TO THE    * T5H00490
                    *   POSITON OF THE LAST ENCOUNTERED CHARACTER TO  * T5H00500
                    *   BE PRINTED, PLUS 17 IDLE CYCLES.              * T5H00510
                    *  *THE PRINT SPEED IN LPM = 110*(48/SCAN CYCLES) * T5H00520
                    *  *IF THE INPUT BUFFER CONTAINS A CHARACTER NOT  * T5H00530
                    *   IN THE 1132 PRINTER CHARACTER SET, THE LINE   * T5H00540
                    *   PRINTS AT THE SLOWEST SPEED AND THE CHARACTER * T5H00550
                    *   PRINTS AS A BLANK.                            * T5H00560
                    *  *SINGLE AND DOUBLE SPACING IS OVERLAPED WITH   * T5H00570
                    *   PRINTING TIME.                                * T5H00580
                    *  *PRINT LINES CONTAINING ONLY 1 CHARACTER, OR   * T5H00590
                    *   ONLY BLANKS AFTER THE FIRST CHARACTER, DO NOT * T5H00600
                    *   TAKE ANY PRINT SCAN CYCLES.  THEREFORE CONTROL* T5H00610
                    *   RETURNS TO THE MAINLINE IMMEDIATELY.          * T5H00620
                    *   THE PRINTER IS BUSY FOR THE TIME THE CARRIAGE * T5H00630
                    *   CONTROL TAKES.  A SINGLE SPACE TAKES ABOUT 3-4* T5H00640
                    *   SCAN CYCLES OF TIME.                          * T5H00650
                    *   A DOUBLE SPACE TAKES ABOUT 7 SCAN CYCLES OF   * T5H00660
                    *   TIME.                                         * T5H00670
                    *                                                 * T5H00680
                    *NOTES -                                          * T5H00690
                    *  *REGISTERS NOT SAVED.                          * T5H00700
                    *  *NO PROVISION MADE FOR SCAN CHECK DETECTION OR * T5H00710
                    *   RECOVERY.                                     * T5H00720
                    *  *SPACING IS DONE PRIOR TO PRINTING.            * T5H00730
                    *  *UNRECOGNIZABLE CARRIAGE CONTROL CHARACTERS    * T5H00740
                    *   CAUSE SINGLE SPACING.                         * T5H00750
                    *  *CONTROL IS RETURNED AS SOON AS THE EBCDIC DATA* T5H00760
                    *   BUFFER IS NO LONGER NEEDED.  THUS, ABOUT      * T5H00770
                    *   193 MILLISECONDS IS AVAILABLE FOR COMPUTATION * T5H00780
                    *   BETWEEN PRINT LINES DURING THE 17 IDLE CYCLES.* T5H00790
                    *  *INTERRUPTS CONTINUE UNTIL ALL PRINTING FOR A  * T5H00800
                    *   CALL IS DONE.                                 * T5H00810
                    *  *USE OF $IOCT PREVENTS OVERLAY BEFORE I/O IS   * T5H00820
                    *   COMPLETED.                                    * T5H00830
                    *  *IF CALLED AGAIN BEFORE I/O IS COMPLETED,      * T5H00840
                    *   CONTROL LOOPS AT THE BEGINNING OF SUBROUTINE  * T5H00850
                    *   UNTIL I/O IS COMPLETE.                        * T5H00860
                    *                                                 * T5H00870
                    *  *THE ORDER OF THE CHARACTERS ON THE 1132       * T5H00880
                    *   PRINT WHEELS IS AS FOLLOWS BY COLUMN --       * T5H00890
                    *                                                 * T5H00900
                    *         A         2         '         M         * T5H00910
                    *         B         3         ,         N         * T5H00920
                    *         C         4         )         O         * T5H00930
                    *         D         5         -         P         * T5H00940
                    *         F         6         (         Q         * T5H00950
                    *         H         7         +         R         * T5H00960
                    *         I         8         /         E         * T5H00970
                    *         S         9         *         G         * T5H00980
                    *         T         0         &         W         * T5H00990
                    *         U         =         J         X         * T5H01000
                    *         V         $         K         Y         * T5H01010
                    *         1         .         L         Z         * T5H01020
                    *                                                 * T5H01030
                    *                                                 * T5H01040
                    *************************************************** T5H01050
                    *     EJCT        BLK REMOVED                       T5H01060
                          LIBR                                          T5H01070
                          ISS  06 PRNTZ     1                           T5H01080
                    *                                                   T5H01090
                    *  SYSTEM COMMUNICATION WORDS                       T5H01100
                    *                                                   T5H01110
                    $SCAN EQU     /20       1132 PRINT SCAN FIELD       T5H01120
                    $PRET EQU     /28       PRE-OPERATIVE ERROR TRAP    T5H01130
                    $IOCT EQU     /32       ZERO IF NO I/O IN PROGRESS  T5H01140
                    $1132 EQU     /7F       1132 PRINTER CHANNEL12 INDR T5H01150
                    *                                                   T5H01160
                    *  SUBROUTINE ENTRY POINTS                          T5H01170
                    *                                                   T5H01180
                    PRNTZ MDX     AZ205     MAINLINE ENTRY          2-7 T5H01190
                          BSC  I  *-*       RETURN                      T5H01200
                    AZ010 DC      *-*       TEMPORARY STORAGE COUNT WD  T5H01210
                    *                                                   T5H01220
                    *************************************************** T5H01230
                    *  INTERRUPT PROCESSING PART OF SUBROUTINE        * T5H01240
                    *************************************************** T5H01250
                    *                                                   T5H01260
                    AZ100 DC      *-*       INTERRUPT ENTRY AND RETURN  T5H01270
                          LDX   2 $SCAN     LOAD XR2 WITH BASE ADDR TO  T5H01280
                    *                       *1132 PRINTER SCAN FIELD    T5H01290
                    *                                                   T5H01300
                          XIO     AZ900     SENSE WITH RESET            T5H01310
                          STO     AZ914     SAVE SENSE DSW WORD         T5H01320
                    *                                                   T5H01330
                    *  TEST IF SPACING COMPLETED                        T5H01340
                    *                                                   T5H01350
                          SLA     1         SHIFT SKIP INDICATOR        T5H01360
                          BSC  L  AZ140,+Z  BR IF SKIP INTERRUPT        T5H01370
                          SLA     1         SHIFT SPACE INDICATOR       T5H01380
                          BSC  L  AZ145,+Z  BR IF SPACE INTERRUPT       T5H01390
                    *                                                   T5H01400
                          LD      AZ906     IS CARRIAGE SKIP GOING ON   T5H01410
                          BSC  L  AZ195,Z+  BR TO RETURN IF YES         T5H01420
                    *                                                   T5H01430
                    AZ110 LD      AZ914     IS THIS EMITTER INTERRUPT   T5H01440
                          BSC  L  AZ195,-   BR TO RETURN IF NOT         T5H01450
                    *                                                   T5H01460
                          BSI     AZ260     CLEAR 32-39 TO ZEROES       T5H01470
                    *                                                   T5H01480
                    *  STOP SCANNING IF ALL PRINT POSITIONS ARE         T5H01490
                    *  EITHER BLANK OR ALREADY PRINTED,                 T5H01500
                    *  OR 48 PRINT SCAN CYCLES HAVE BEEN TAKEN.         T5H01510
                    *                                                   T5H01520
                          LD      AZ922     GET CHARS LEFT TO PRINT CNT T5H01530
                          S       AZ920+1   SUB 2 BASE VALUE        2-7 T5H01535
                          BSC  L  AZ130,+   BR IF ALL PRINTED           T5H01540
                    *                                                   T5H01550
                          MDX  L  AZ924,-1  DECR SCAN COUNTER           T5H01560
                          MDX     AZ148     GO SCAN FOR NEXT CHAR       T5H01570
                    *                                                   T5H01580
                    *  LAST CHARACTER TO BE PRINTED HAS ALREADY BEEN    T5H01590
                    *  SCANED, INPUT DATA BUFFER IS NOT NEEDED ANY      T5H01600
                    *  MORE.  ALLOW RETURN TO CALLER FROM PRNTZ WHILE   T5H01610
                    *  17 IDLE SCANS ARE TAKEN.                         T5H01620
                    *                                                   T5H01630
                    AZ130 SRA     16        ZERO ACC                    T5H01640
                          STO     AZ924     SET SCAN COUNTER = 0        T5H01650
                          MDX  L  AZ925,-1  DECR IDLE COUNTER           T5H01660
                          MDX     AZ195     RETURN, MORE IDLES NEEDED   T5H01670
                          XIO     AZ902     STOP PRINTER                T5H01680
                          MDX  L0 $IOCT,-1  INDICATE 1132 I/O DONE      T5H01690
                          MDX     AZ195     TWICE BECAUSE MAY SKIP      T5H01700
                          MDX     AZ195     BR OUT OF INTERRUPT         T5H01710
                    *                                                   T5H01720
                    *  CARRIAGE SKIP COMPLETE TEST                      T5H01730
                    *                                                   T5H01740
                    AZ140 SLA     7         TEST FOR CHANNEL 1          T5H01750
                          BSC  L  AZ195,-   BR OUT OF INTERRUPT IF NOT  T5H01760
                          XIO     AZ904     STOP CARRIAGE               T5H01770
                          SRA     16        ZERO ACC                    T5H01780
                          STO     AZ906     ZERO SPACE COUNTER          T5H01790
                          STO   2 $1132-$SCAN  CLEAR CHANNEL 12 SWITCH  T5H01800
                    *                                                   T5H01810
                    *  ALL CARRIAGE CONTROL COMPLETED                   T5H01820
                    *                                                   T5H01830
                    AZ142 MDX  L0 $IOCT,-1  INDICATE CARIAGE OP COMPLT  T5H01840
                          NOP               MAY SKIP                    T5H01850
                          MDX     AZ110     BR TO SEE IF EMITTER INTRPT T5H01860
                    *                                                   T5H01870
                    *  SPACE COUNTER TEST (NOTE, ONLY SINGLE AND        T5H01880
                    *  DOUBLE SPACE ALLOWED BECAUSE OF OVERLAP WITH     T5H01890
                    *  PRINTING)                                        T5H01900
                    *                                                   T5H01910
                    AZ145 LD      AZ914     LOAD DSW FROM SENSE         T5H01920
                          AND     AZ916+1   MASK OUT ALL BUT BIT 15     T5H01930
                          OR    2 $1132-$SCAN  OR WITH PREV CHANNEL 12  T5H01940
                          STO   2 $1132-$SCAN  SAVE CHANNEL 12 SWITCH   T5H01950
                          MDX  L0 AZ906,-1  DECREMENT SPACE COUNTER     T5H01960
                          MDX     AZ146     BR IF COUNTER NOT 0         T5H01970
                          MDX     AZ142     BR LAST REQUIRED SPACE DONE T5H01980
                    AZ146 XIO     AZ906     DO ANOTHER CARRIAGE SPACE   T5H01990
                          MDX     AZ110     BR TO SEE IF EMITTER INTRPT T5H02000
                    *                                                   T5H02010
                    *  READ 1132 PRINTER EMITTER AND SCAN BUFFER        T5H02020
                    *  FOR MATCHING CHARACTERS.  SET BITS IN            T5H02030
                    *  CORRESPONDING POSITIONS IN WORDS 32-39 OF CORE.  T5H02040
                    *                                                   T5H02050
                    AZ148 STX   2 AZ180+1   RESET STORE ADDR TO START   T5H02060
                    *                       *1132 PRINTER SCAN FIELD    T5H02070
                          XIO     AZ912     READ EMITTER                T5H02080
                          LD      AZ908     LOAD EMITTED CHARACTER  2-7 T5H02082
                          SRA     8         PUT IN RIGHT HALF ACC   2-7 T5H02084
                          OR      AZ908     ADD CHAR TO LEFT HALF   2-7 T5H02086
                          STO     AZ908     STORE IN COMPARE WORD   2-7 T5H02088
                    *                                                   T5H02090
                    AZ150 LDX  L1 *-*       PUT START OF BUFR IN XR1    T5H02100
                          LD      AZ910     LOAD CHARACTER COUNT        T5H02110
                          STO     AZ010     SAVE IN TEMPORARY STORAGE   T5H02120
                          LDX   2 16        SET BITS/WORD COUNTER TO 16 T5H02130
                    AZ160 SLT     2         SHIFT BITS LEFT IN EXT  2-7 T5H02140
                          LD    1 1         LOAD NEXT CHAR IN ACC   2-7 T5H02150
                          SLA     8         SHIFT CHAR TO LEFT ACC  2-7 T5H02160
                          OR    1 2         OR 2ND CHAR IN RIGHT ACC2-7 T5H02165
                          EOR     AZ908     COMPARE WITH EMITTED CHAR   T5H02170
                          BSC  L  AZ163,Z   NO BR IF BOTH MATCH     2-7 T5H02173
                          AD      AZ926     SET ON LAST 2 BITS EXT  2-7 T5H02176
                          MDX  L0 AZ922,-2  DECR CHAR TO PRINT BY 2 2-7 T5H02180
                          MDX     AZ170                             2-7 T5H02183
                    AZ163 A       AZ926     ADD /FF00 TO FORCE CARRY2-7 T5H02186
                    *                       *IF ANY BITS DIFFERENT  2-7 T5H02190
                          BSC  L  AZ165,C   BR IF FIRST CHAR NOT    2-7 T5H02193
                    *                       *EMITTED CHAR           2-7 T5H02196
                          AD      AZ920     SET ON LAST-1 BIT IN EXT2-7 T5H02200
                          MDX     AZ166                             2-7 T5H02202
                    AZ165 SLA     8         REMOVE 1ST CHAR FROM ACC2-7 T5H02204
                          BSC  L  AZ170,Z   BR IF 2ND CHAR NOT      2-7 T5H02206
                    *                       *EMITTED CHAR           2-7 T5H02208
                          AD      AZ916     SET LAST BIT IN EXT ON      T5H02210
                    AZ166 MDX  L0 AZ922,-1  DECR CHARS TO PRINT CNT 2-7 T5H02215
                    AZ170 MDX   2 -2        DECR BIT/WD COUNT BY 2  2-7 T5H02220
                          MDX     AZ190     BR IF SCAN WORD NOT FULL    T5H02230
                          LDX   2 16        SET BITS/WORD COUNTER TO 16 T5H02240
                          RTE     16        MOVE SCAN BIT WORD TO ACC   T5H02250
                    AZ180 STO  L  $SCAN     STORE IN 1132 SCAN FIELD    T5H02260
                          MDX  L0 AZ180+1,1 INCR SCAN FIELD STORE ADDR  T5H02270
                    AZ190 MDX   1 2         INCR INPUT BUFFER ADDR  2-7 T5H02280
                          MDX  L0 AZ010,-2  DECR BUFFER CHAR COUNTER2-7 T5H02290
                          MDX     AZ160     BR IF MORE CHARS IN BUFFER  T5H02300
                          SLT     16        MOVE ANY SCAN BITS TO ACC   T5H02310
                          SLT   2 0         SHIFT BITS LEFT BY REMAINDR T5H02320
                          STO  I  AZ180+1   STORE IN NEXT WD SCAN FIELD T5H02330
                          LD   L  $SCAN+7   LOAD SCAN WORD 8,      2-11 T5H02332
                          OR      SCAN1     *TURN ON BIT 16, AND   2-11 T5H02335
                          STO  L  $SCAN+7   *RESTORE IN SCAN FIELD 2-11 T5H02338
                    *                                                   T5H02340
                    AZ195 BSC  I  AZ100     RETURN FROM INTERRUPT       T5H02350
                    *                                               2-7 T5H02354
                    AZ205 MDX     AZ210     BOOST ON TO MAINLINE    2-7 T5H02356
                    *                                                   T5H02360
                    *             CONSTANTS AND WORK AREAS              T5H02370
                    *                                                   T5H02380
                    AZ922 DC      *-*       CHARS LEFT TO PRINT COUNTER T5H02390
                          BSS  E  0                                     T5H02400
                    AZ900 DC      /6000     ERROR DISPLAY CONSTANT      T5H02410
                          DC      /3701     *AND SENSE W/ RESET IOCC    T5H02420
                    AZ914 DC      *-*       DSW AND SENSE WITH NO       T5H02430
                          DC      /3700     *RESET IOCC                 T5H02440
                    AZ902 DC      .1-.+     CHAN1 CON AND PRINTER STOP  T5H02450
                          DC      /3440     *IOCC                       T5H02460
                    AZ904 DC      .+        SPACE SUPPRESS CON AND      T5H02470
                          DC      /3402     *STOP CARRIAGE IOCC         T5H02480
                    AZ906 DC      *-*       SPACE COUNTER               T5H02490
                          DC      /3401     *AND SPACE IOCC             T5H02500
                    AZ908 DC      *-*       EMITTER STORAGE AND         T5H02510
                          DC      /3404     *START CARRIAGE IOCC        T5H02520
                    AZ910 DC      *-*       CHARACTER COUNT STORAGE AND T5H02530
                          DC      /3480     *PRINTER IOCC               T5H02540
                    AZ912 DC      AZ908     READ EMITTER INTO CORE      T5H02550
                          DC      /3200     *IOCC                       T5H02560
                    AZ916 DEC     1         CONSTANT 1                  T5H02570
                    AZ917 EQU     *-1       SPACE CONSTANT -(.0-.1) =   T5H02580
                    *                       * -(-1) = 1                 T5H02590
                    AZ920 DC      .         EBCDIC BLANK FOR SCAN   2-7 T5H02594
                          DC      2         *AND DOUBLE WD CONST 2  2-7 T5H02596
                    AZ918 DC      49        PRINT SCAN CONSTANT AND     T5H02600
                          DC      17        *IDLE SCAN CONSTANT         T5H02610
                    AZ924 DC      *-*       PRINT SCAN COUNTER          T5H02620
                    *                       *+ TEMP BLANK SCAN COUNTER  T5H02630
                    AZ925 DC      *-*       IDLE COUNTER                T5H02640
                    AZ926 DC      /FF00     FIRST CHAR MASK AND     2-7 T5H02644
                          DC      3         *DOUBLE WD CONSTANT 3   2-7 T5H02650
                    SCAN1 DC      1         CONSTANT TO SET SCAN   2-11 T5H02655
                    *                       *FIELD BIT ON          2-11 T5H02657
                    *                                                   T5H02660
                    *  SUBROUTINE TO CLEAR WORDS 32-39 TO ZEROES        T5H02670
                    *                                                   T5H02680
                    AZ260 DC      *-*       BSI ENTRY POINT             T5H02690
                          SLT     32        CLEAR ACC AND EXTENSION     T5H02700
                          LDX   1 0         SET XR1 = 0                 T5H02710
                          STD   1 $SCAN     ZERO                        T5H02720
                          STD   1 $SCAN+2   *1132                       T5H02730
                          STD   1 $SCAN+4   *PRINT SCAN                 T5H02740
                          STD   1 $SCAN+6   *FIELD                      T5H02750
                          MDX  L  $SCAN+7,1 SET ON BIT 16          2-11 T5H02755
                          BSC  I  AZ260     RETURN                      T5H02760
                    *                                                   T5H02770
                    *************************************************** T5H02780
                    *  MAINLINE PORTION OF SUBROUTINE                 * T5H02790
                    *************************************************** T5H02800
                    *                                                   T5H02810
                    *  TEST FOR NOT READY AND CARRIAGE OR PRINTER BUSY  T5H02820
                    *                                                   T5H02830
                    AZ210 XIO     AZ914     SENSE DSW WITHOUT RESET     T5H02840
                          SLA     3         SHIFT TO SIGN               T5H02850
                          BSC     -         BR IF CARRIAGE BUSY         T5H02860
                          RTE     29        SHIFT TO SIGN               T5H02870
                          BSC  L  AZ210,+Z  BR IF PRINTER BUSY          T5H02880
                          RTE     1         SHIFT TO SIGN               T5H02890
                          BSC  L  AZ215,-   BR IF PRINTER READY         T5H02900
                    *                                                   T5H02910
                    *  NOT READY OR FORMS CHECK.                        T5H02920
                    *  BR TO PRE-OPERATIVE ERROR TRAP.                  T5H02930
                    *                                                   T5H02940
                          LD      AZ900     LOAD ERROR INDICATOR        T5H02950
                          BSI  L  $PRET     BR TO PRE-OP ERROR          T5H02960
                          MDX     AZ210     TRY FORMS TEST AGAIN        T5H02970
                    *                                                   T5H02980
                    *  DOUBLE CHECK CARRIAGE BUSY.  SOMEHOW THE DSW BIT T5H02990
                    *  TEST IS NOT RELIABLE.  HOWEVER, IT IS STILL      T5H03000
                    *  NEEDED TO DETECT MANUALLY INITIATED SPACING.     T5H03010
                    *  THIS SECOND TEST METHOD IS EXPLICIT FOR SPACES   T5H03020
                    *  INITIATED BY THIS SUBROUTINE.                    T5H03030
                    *                                                   T5H03040
                    AZ215 MDX  L0 AZ906,0   IS SPACING COMPLETED        T5H03050
                          MDX     AZ210     NO, BR TO LOOP UNTIL DONE   T5H03060
                    *                                                   T5H03070
                          STX   2 AZ910     SAVE COUNT OF CHARACTERS    T5H03080
                          STX   1 AZ150+1   SAVE BUFFER ADDR            T5H03090
                          LD    1 0         LOAD CONTROL CHARACTER      T5H03100
                          S       AZ904     TEST IF SUPPRESS SPACE '+'  T5H03110
                          BSC  L  AZ220,+-  BR TO PRINT IF SUPPRESS     T5H03120
                          MDX  L0 $IOCT,1   IND CARRIAGE I/O IN PROGRES T5H03130
                          S       AZ902     TEST IF SKIP CHANNEL 1 '1'  T5H03140
                          BSC  L  AZ218,+-  BRANCH IF SKIP              T5H03150
                          MDX  L0 $1132,0   TEST IF CH 12 SWITCH IS ON  T5H03160
                          MDX     AZ218     BR TO SKIP IF ON            T5H03170
                          LDX   2 1         ASSUME SINGLE SPACE         T5H03180
                          A       AZ917     TEST IF DOUBLE SPACE '0'    T5H03190
                          BSC     +-        SKIP IF NOT DOUBLE SPACE    T5H03200
                          LDX   2 2         SET FOR DOUBLE SPACE        T5H03210
                          STX   2 AZ906     SAVE SPACE COUNTER          T5H03220
                          XIO     AZ906     START CARRIAGE SPACE        T5H03230
                          MDX     AZ220     BR TO PRINT LINE            T5H03240
                    *                                                   T5H03250
                    *  SKIP TO CHANNEL 1                                T5H03260
                    *                                                   T5H03270
                    AZ218 LDX   2 -1        SET SPACE COUNT NEG (TO     T5H03280
                          STX   2 AZ906     *INHIBIT CHAR SCANS)        T5H03290
                          LD   L  $SCAN+7   LOAD SCAN WORD 8,      2-11 T5H03293
                          OR      SCAN1     *TURN ON BIT 16, AND   2-11 T5H03295
                          STO  L  $SCAN+7   *RESTORE IN SCAN FIELD 2-11 T5H03297
                          XIO     AZ908     START CARRIAGE SKIP         T5H03300
                    *  TEST IF MORE THAN JUST CARRIAGE CONTROL          T5H03310
                    *  CHARACTER IN INPUT BUFFER                        T5H03320
                    *                                                   T5H03330
                    AZ220 LD      AZ910     DECR COUNT OF CHARS IN      T5H03340
                          S       AZ916+1   *IN BUFFER BY 1             T5H03350
                          BSC  L  PRNTZ+1,+ BR TO RETURN IF ONLY        T5H03360
                    *                       *CARRIAGE CONTROL CHARACTER T5H03370
                    *                                                   T5H03380
                    *  CHECK IF REST OF LINE IS ALL BLANKS              T5H03390
                    *                                                   T5H03400
                          STO     AZ910     SAVE DECR CHAR COUNT        T5H03410
                          STO     AZ924     SAVE FOR COUNT BLANK SCAN   T5H03420
                          RTE     16        SET IN EXT AS CHARS LEFT    T5H03430
                    *                       *TO PRINT COUNTER           T5H03440
                    *                                                   T5H03450
                    AZ245 LD    1 1         GET NEXT CHAR IN BUFFER     T5H03460
                          EOR     AZ920     IS IT A BLANK           2-7 T5H03470
                          BSC     +-        SKIP IF NOT A BLANK         T5H03480
                          SD      AZ916     DECR CHARS LEFT TO PRINT    T5H03490
                    *                       *COUNTER IN EXT BY 1        T5H03500
                          MDX   1 1         ADVANCE BUFFER PINTER       T5H03510
                          MDX  L0 AZ924,-1  DECR CHAR COUNTER BY 1      T5H03520
                          MDX     AZ245     BR IF MORE CHARS IN BUFFER  T5H03530
                    *                                                   T5H03540
                          RTE     16        GET  CHARS LEFT TO      2-7 T5H03550
                    *                       *PRINT COUNTER FROM EXT 2-7 T5H03560
                          BSC  L  PRNTZ+1,+ BR RETURN IF ALL BLANKS     T5H03570
                    *                                                   T5H03580
                    *  PRINTING REQUIRED.                               T5H03590
                    *  SET INDICATORS AND START PRINTER.                T5H03600
                    *                                                   T5H03610
                          A       AZ920+1   ADD 2 TO CHARS LEFT SO  2-7 T5H03614
                          STO     AZ922     *SCAN MDX CAN NOT SKIP  2-7 T5H03616
                          BSI     AZ260     CLEAR 32-39 TO ZEROES       T5H03620
                          LDD     AZ918     SET PRINT SCAN COUNTER=49   T5H03630
                          STD     AZ924     *SET IDLE COUNTER = 17      T5H03640
                          MDX  L0 $IOCT,1   IND CHAR I/O IN PROGRESS    T5H03650
                          XIO     AZ910     START PRINTER               T5H03660
                    *                                                   T5H03670
                    * LOOP UNTIL PRINT BUFFER NO LONGER NEEDED          T5H03680
                    *                                                   T5H03690
                    AZ250 MDX  L0 AZ925,0   NEED MORE IDLE CYCLES? 2-11 T5H03708
                          MDX     AZ250     YES, BR UNTIL NOT NEEDED    T5H03710
                          BSC  L  PRNTZ+1   BR TO RETURN TO CALLER      T5H03720
                          END                                           T5H03730
