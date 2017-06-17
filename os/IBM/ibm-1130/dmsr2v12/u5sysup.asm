                          HDNG    SYSUP - UPDATE SYSTEM DCOM            U5E00010
                    *************************************************** U5E00020
                    *                                                 * U5E00030
                    *STATUS - VERSION 2, MODIFICATION 12              * U5E00040
                    *                                                 * U5E00050
                    *FUNCTION/OPERATION-                              * U5E00060
                    *   * UPDATE DCOM OF THE SYSTEM CARTRIDGE FROM    * U5E00070
                    *     THE DCOMS OF ALL THE REQUESTED CARTRIDGES.  * U5E00080
                    *     THE DCOM TABLES UPDATED ARE-                * U5E00090
                    *     #ANDU                                       * U5E00100
                    *     #BNDU                                       * U5E00110
                    *     #FPAD                                       * U5E00120
                    *     #PCID                                       * U5E00130
                    *     #CIDN                                       * U5E00140
                    *     #CIBA                                       * U5E00150
                    *     #SCRA                                       * U5E00160
                    *     #FMAT                                       * U5E00170
                    *     #FLET                                       * U5E00180
                    *     #ULET                                       * U5E00190
                    *     #WSCT                                       * U5E00200
                    *     #CSHN                                       * U5E00210
                    *                                                 * U5E00220
                    *   * UPDATE $ACDE IN COMMA TO REFLECT THE        * U5E00230
                    *     PHYSICAL DEFINITION OF EACH REQUESTED       * U5E00240
                    *     LOGICAL DRIVE.                              * U5E00250
                    *                                                 * U5E00260
                    *   * SET DEFECTIVE CYLINDER ADDRESSES IN COMMA   * U5E00270
                    *     FROM SECTOR 0 OF EACH CARTRIDGE.            * U5E00280
                    *                                                 * U5E00290
                    *   * UPDATE $FPAD AND $ULET IN COMMA FROM DCOM.  * U5E00300
                    *                                                 * U5E00310
                    *ENTRY POINTS-                                    * U5E00320
                    *   * SYSUP-UPDATE SYSTEM DCOM.  THE CALLING      * U5E00330
                    *           SEQUENCE IS-                          * U5E00340
                    *              BSI  L  SYSUP                      * U5E00350
                    *              DC      ADDR                       * U5E00360
                    *            WHERE ADDR IS THE ADDRESS OF THE     * U5E00370
                    *            TABLE OF REQUESTED CARTRIDGE IDS.    * U5E00380
                    *                                                 * U5E00390
                    *INPUT-                                           * U5E00400
                    *   * A TABLE OF THE FIVE REQUESTED CARTRIDGE IDS.* U5E00410
                    *     THE LAST ITEMS OF THE TABLE MAY BE BLANK.   * U5E00420
                    *                                                 * U5E00430
                    *OUTPUT-                                          * U5E00440
                    *   * IN DCOM-                                    * U5E00450
                    *     #ANDU                                       * U5E00460
                    *     #BNDU                                       * U5E00470
                    *     #CIBA                                       * U5E00480
                    *     #CIDN                                       * U5E00490
                    *     #CSHN                                       * U5E00500
                    *     #FLET                                       * U5E00510
                    *     #FMAT                                       * U5E00520
                    *     #FPAD                                       * U5E00530
                    *     #PCID                                       * U5E00540
                    *     #SCRA                                       * U5E00550
                    *     #ULET                                       * U5E00560
                    *     #WSCT                                       * U5E00570
                    *     #ACIN                                       * U5E00580
                    *                                                 * U5E00590
                    *   * IN COMMA-                                   * U5E00600
                    *     $ACDE                                       * U5E00610
                    *     $CIBA                                    2-3* U5E00614
                    *     $CILA                                    2-3* U5E00616
                    *     $DCYL                                       * U5E00620
                    *     $FPAD                                       * U5E00630
                    *     $ULET                                       * U5E00640
                    *                                                 * U5E00650
                    *EXTERNAL REFERENCES-                             * U5E00660
                    *   *SUBROUTINES-                                 * U5E00670
                    *     DZ000   SUBROUTNE TO PERFORM DISK I/O.      * U5E00680
                    *                                                 * U5E00690
                    *   * COMMA/DCOM-                                 * U5E00700
                    *     $CH12                                       * U5E00710
                    *     $CYLN                                       * U5E00720
                    *     $DBSY                                       * U5E00730
                    *     $DUMP                                       * U5E00740
                    *     $EXIT                                       * U5E00750
                    *     $FLSH                                       * U5E00760
                    *     $IBT4                                       * U5E00770
                    *     $IOCT                                    2-12 U5E00775
                    *     $IREQ                                       * U5E00780
                    *     $LEV0                                     2-2 U5E00784
                    *     $LEV1                                     2-2 U5E00785
                    *     $LEV2                                     2-2 U5E00786
                    *     $PBSY                                       * U5E00790
                    *     $PRET                                       * U5E00800
                    *     $SYSC                                       * U5E00810
                    *     #SYSC                                       * U5E00820
                    *                                                 * U5E00830
                    *EXITS-                                           * U5E00840
                    *   * NORMAL-                                     * U5E00850
                    *     RETURN TO CALL + 3 UPON SUCCESSFUL          * U5E00860
                    *     COMPLETION OF UPDATE.                       * U5E00870
                    *   * ERROR-                                      * U5E00880
                    *     A BRANCH IS MADE TO $EXIT AFTER SETTING THE * U5E00890
                    *     ABORT JOB SWITCH AND PRINTING ONE OF THE    * U5E00900
                    *     FOLLOWING MESSAGES-                         * U5E00910
                    *     XXXX IS NOT AN AVAILABLE CARTRIDGE ID       * U5E00920
                    *     XXXX IS A DUPLICATED SPECIFIED CARTRIDGE ID * U5E00930
                    *     XXXX IS A DUPLICATED AVAILABLE CARTRIDGE ID * U5E00940
                    *                                                 * U5E00950
                    *TABLES/WORK AREAS-                               * U5E00960
                    *   * DCOMX IS A BUFFER FOR THE STORAGE OF A      * U5E00970
                    *     SATELLITE (NON-SYSTEM) CARTRIDGE DCOM.      * U5E00980
                    *                                                 * U5E00990
                    *ATTRIBUTES-                                      * U5E01000
                    *   * REUSABLE.                                   * U5E01010
                    *                                                 * U5E01020
                    *NOTES-N/A                                        * U5E01030
                    *                                                 * U5E01040
                    *************************************************** U5E01050
                          HDNG    SYSUP - UPDATE SYSTEM DCOM          3 U5E01060
                          ENT     SYSUP                                 U5E01070
                    *                                                   U5E01080
                    *     EXTERNAL EQUATE STATEMENTS                    U5E01090
                    *                                                   U5E01100
                    $ACDE EQU     /9F                                   U5E01110
                    $CH12 EQU     /06                                   U5E01120
                    $CIBA EQU     /05                               2-3 U5E01125
                    $CILA EQU     /5A                               2-3 U5E01126
                    $CYLN EQU     /9A                                   U5E01130
                    $DBSY EQU     /EE                                   U5E01140
                    $DCYL EQU     /A4                                   U5E01150
                    $DUMP EQU     /3F                                   U5E01160
                    $EXIT EQU     /38                                   U5E01170
                    $FLSH EQU     /71                              2-10 U5E01180
                    $FPAD EQU     /95                                   U5E01190
                    $IBT4 EQU     /D4                                   U5E01200
                    $IOCT EQU     /32                              2-12 U5E01205
                    $IREQ EQU     /2C                                   U5E01210
                    $LEV0 EQU     /8        INTERUPT ADDR LEV 0     2-2 U5E01214
                    $LEV1 EQU     /9        INTERUPT ADDR LEV 1     2-2 U5E01215
                    $LEV2 EQU     /A        INTERUPT ADDR LEV 2     2-2 U5E01216
                    $LEV4 EQU     /C        INTERRUPT LEVEL 4      2-12 U5E01217
                    $PBSY EQU     /36                                   U5E01220
                    $PRET EQU     /28                                   U5E01230
                    $SYSC EQU     /E0                                   U5E01240
                    $ULET EQU     /2D                                   U5E01250
                    $ZEND EQU     /1E0                              2-3 U5E01255
                    #DCOM EQU     /01                                   U5E01260
                    #HDNG EQU     /07                                   U5E01270
                    #IDAD EQU     /00                                   U5E01280
                    DZ000 EQU     /F2                                   U5E01290
                    DSIZE EQU     110                               2-3 U5E01292
                    @CSTR EQU     /00D0                             2-3 U5E01294
                          HDNG    SYSUP - UPDATE SYSTEM DCOM            U5E01300
                    *                                                   U5E01310
                    *     UPDATE THE SYSTEM DCOM FROM ALL               U5E01320
                    *     REQUESTED CARTRIDGES                          U5E01330
                    *                                                   U5E01340
                    SYSUP DC      *-*       ENTRY/RETURN ADDRESS        U5E01350
                    *                                                   U5E01360
                          MDX  L  $IOCT,0   LOOP UNTIL ALL I/O     2-12 U5E01364
                          MDX     *-3       *IS COMPLETED          2-12 U5E01366
                          STD  L  SU939     SAVE ACCUMULATOR, EXTENSION U5E01370
                          STS  L  SU360     SAVE STATUS                 U5E01380
                          STX  L1 SU360+2   SAVE XR1                    U5E01390
                          STX  L2 SU360+4   SAVE XR2                    U5E01400
                          STX  L3 SU360+6   SAVE XR3                    U5E01410
                          LD   L  $LEV4     SAVE INTERRUPT ADDR    2-12 U5E01414
                          STO  L  SU939+4   FOR LEV 4               212 U5E01415
                          LD   L  $IBT4     SAVE ADDRESS OF USERS       U5E01420
                          STO  L  SU938     *INTERRUPT BRANCH TABLE     U5E01430
                          LD   L  $LEV0     SAVE INTERUPT ADDR      2-2 U5E01433
                          STO  L  SU939+2   *FOR LEV 0              2-2 U5E01434
                          LD   L  $LEV1     SAVE INTERUPT ADDR      2-2 U5E01435
                          STO  L  SU939+3   *FOR LEV 1              2-2 U5E01436
                    *                                               2-9 U5E01437
                    *  FETCH DEF CYLN TABLE FOR LOG DR 0            2-9 U5E01438
                    *                                               2-9 U5E01439
                          LD   L  SU917     FETCH I/O ADDRESS       2-9 U5E01440
                          SRT     16        SHIFT TO EXT            2-9 U5E01441
                          BSI  L  DZ000     BR TO READ DEF CYLN TB  2-9 U5E01442
                    SU005 MDX  L  $DBSY,0   TEST DISK BUSY          2-9 U5E01443
                          MDX     SU005     BR TO TEST AGAIN        2-9 U5E01444
                    *                                               2-9 U5E01445
                          LDX   1 -3        XR1=TABLE LENGTH        2-9 U5E01446
                    SU007 LD   L1 SU908+3   LD DEF CYL SCT ADDR     2-9 U5E01447
                          STO  L1 $DCYL+3   STO IN COMMA            2-9 U5E01448
                          MDX   1 1         INCR CNT SKIP IF ZERO   2-9 U5E01449
                          MDX     SU007     FETCH NEXT              2-9 U5E01450
                    *                                               2-9 U5E01451
                          CALL    FSLEN     GET SCT ADDR FOR PRIN PR    U5E01452
                          DC      /0099     PHASE ID OF PRIN PR SUBR    U5E01453
                    PRET  BSI  L  $PRET,+   BR TO POST-OP TRAP IF ACC Z U5E01460
                          BSC     +         SKIP IF PH ID FOUND     2-9 U5E01462
                          MDX     PRET      BR TO $PRET IF NOT FOUND2-9 U5E01464
                          CALL    FSYSU     FETCH AND STORE ADDRESS     U5E01470
                          STO  L  PRINT     *OF PRIN PRINT SUBROUTINE   U5E01480
                    *                                                   U5E01490
                    *     INITIALIZE                                    U5E01500
                    *                                                   U5E01510
                          LDX  L1 $DCYL     INITIALIZE ADDRESS AT WHICH U5E01520
                          STX  L1 SU620     *TO STORE DEF CYL ADDRESSES U5E01530
                          SRA     16        SET SYSTEM                  U5E01540
                          STO  L  SU919     *CARTRIDGE SWITCH OFF AND   U5E01550
                          STO  L  SU915     *AVAIL CART INDICATOR ZERO  U5E01560
                          LD   L  $ACDE     SAVE                        U5E01570
                          SRT     16        *AREA CODE                  U5E01580
                          LD   L  $IREQ     *AND ADDRESS OF             U5E01590
                          STD  L  SU936     *INTERRUPT REQUEST SUBR     U5E01600
                          LD   L  SU935     POINT INTERRUPT REQUEST     U5E01610
                          STO  L  $IREQ     *ADDRESS TO SYSUP SUBR      U5E01620
                    *                                                   U5E01630
                    *     FETCH ID LIST                             2-3 U5E01640
                    *                                               2-3 U5E01650
                          LD   I  SYSUP     FETCH ADDRESS OF ID LIST2-3 U5E01660
                          A    L  SU916     INCREMENT ADDRESS BY 5  2-3 U5E01670
                          STO     SU010+1   STORE AS FETCH ADDRESS      U5E01700
                    *                                                   U5E01710
                          LDX   1 -5        ID LIST COUNT TO XR1        U5E01720
                    SU010 LD   L1 *-*       FETCH AN ID FROM USERS PROG U5E01730
                          STO  L1 SU902+5   STORE ID TO ID LIST         U5E01740
                          MDX   1 1         INCR ID COUNT, SKIP IF ZERO U5E01750
                          MDX     SU010     BRANCH TO FETCH NEXT ID     U5E01760
                    *                                                   U5E01890
                    *     FETCH DCOM FROM PREVIOUS MASTER CARTRIDGE     U5E01900
                    *                                                   U5E01910
                    SU030 LD      SU902     FETCH 1ST ID OF ID LIST2-11 U5E01920
                          BSC  L  SU040,Z   BRANCH IF ID NON-BLANK      U5E01930
                          LD   L  ADCOM     FETCH ADDR OF DCOM I/O AREA U5E01940
                          SRT     16        SHIFT TO EXT, ACC = 0       U5E01950
                          BSI  L  DZ000     BRANCH TO DISK READ         U5E01960
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  U5E01970
                          MDX     *-3       BR TO TEST READ COMPLETE    U5E01980
                          LD   L  #CIDN     FETCH SYSTEM CARTRIDGE ID   U5E01990
                          STO     SU902     STORE TO ID LIST            U5E02000
                          STO  L  SU919     SET SYTEM CARTRIDGE SW ON   U5E02010
                    *                                                   U5E02020
                    *     CHECK FOR DUPLICATE CARTRIDGE IDS             U5E02030
                    *                                                   U5E02040
                    SU040 SLT     32        CLEAR THE SWITCH            U5E02050
                          LDX   2 0         ID LIST COUNT TO XR2        U5E02060
                    SU050 LD   L2 SU902     FETCH A CARTRIDGE ID        U5E02070
                          BSC  L  SU070,+-  BRANCH IF ID BLANK          U5E02080
                          BSI  L  SU400     BR TO CK FOR A DUPLICATE ID U5E02090
                          MDX   2 1         INCREMENT ID COUNT          U5E02100
                          NOP                                           U5E02110
                          MDX     SU050     BRANCH TO CHECK NEXT ID     U5E02120
                    *                                                   U5E02130
                    *     FETCH CART LIST                               U5E02140
                    *                                                   U5E02150
                    SU070 LDX   1 -11       DRIVE COUNT TO XR1     2-11 U5E02160
                          LDX   2 0         DEF CYL ADDR COUNT TO XR2   U5E02170
                          LD   L  $LEV2     SAVE THE CONTENTS           U5E02180
                          STO     SU923     *OF LOCATION 10        2-11 U5E02190
                    *                                                   U5E02200
                    SU080 LD      SU922     RESET INTERRUPT        2-11 U5E02210
                          STO  L  $LEV2     *BRANCH ADDRESS             U5E02220
                          LD   L1 SU924+11  FETCH AREA CODE        2-11 U5E02230
                          STO  L  $ACDE     STORE TO COMMA              U5E02240
                          OR      SU920     "OR" IN READ FUNCTION CODE  U5E02250
                          STO     SU910+1   STORE TO 2ND WORD OF IOCC   U5E02260
                          OR      SU921     "OR" IN SENSE FUNCTION CODE U5E02270
                          STO     SU912+1   STORE TO 2ND WORD OF IOCC   U5E02280
                          XIO     SU910     INITIATE DISK READ          U5E02290
                          XIO     SU912     SENSE DISK                  U5E02300
                          SLA     3         SHIFT BUSY BIT TO 0-BIT     U5E02310
                          BSC  L  SU100,Z+  BRANCH IF DISK BUSY         U5E02320
                    *                                                   U5E02330
                    *     DISK NOT BUSY, NO CARTRIDGE AVAILABLE         U5E02340
                    *                                                   U5E02350
                          SRA     16        SET CART LIST               U5E02360
                          STO  L1 SU904+11  *TO ZERO               2-11 U5E02370
                          LD      SU915     FETCH AVAIL CART INDICATOR  U5E02380
                          MDX     SU120     BR TO INCREMENT DRIVE COUNT U5E02390
                    *                                                   U5E02400
                    *     OPERATION COMPLETE INTERRUPT PROCESSING       U5E02410
                    *                                                   U5E02420
                    SU090 DC      *-*                                   U5E02430
                          XIO     SU912     SENSE WITH RESET            U5E02440
                          BOSC I  SU090     CONTINUE                    U5E02450
                    *                                                   U5E02460
                    *     CARTRIDGE AVAILABLE, FETCH CARTRIDGE ID AND   U5E02470
                    *     DEFECTIVE CYLINDER ADDRESSES                  U5E02480
                    *                                                   U5E02490
                    SU100 LD      SU090     LD INT ENTRY POINT     2-11 U5E02500
                          BSC     +-        SKIP IF OP-COMPLETE    2-11 U5E02502
                          MDX     SU100     *OTHERWISE, LOOP       2-11 U5E02504
                          SLA     16        RESET INTERRUPT ENTRY  2-11 U5E02506
                          STO     SU090     *POINT TO ZERO         2-11 U5E02508
                          LD      SU923     RESTORE CONTENTS            U5E02510
                          STO  L  $LEV2     *OF LOCATION 10             U5E02520
                          LD      SU914+1   SET ARM POSITION TO    2-11 U5E02530
                          STO  L  $CYLN     *SECTOR ADDR JUST READ      U5E02540
                          LD      SU917     FETCH ADDRESS OF I/O AREA   U5E02550
                          SRT     16        SHIFT TO EXT, ACC = 0       U5E02560
                          BSI  L  DZ000     BRANCH TO DISK READ         U5E02570
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  U5E02580
                          MDX     *-3       BR TO TEST READ COMPLETE    U5E02590
                    *                                                   U5E02600
                          LD      SU908+3   FETCH CART ID AND           U5E02610
                          STO  L1 SU904+11  *STORE TO CART LIST    2-11 U5E02620
                          LD      SU908     FETCH                       U5E02630
                          STO  L2 SU925     *AND                        U5E02640
                          LD      SU908+1   *STORE                      U5E02650
                          STO  L2 SU925+1   *DEFECTIVE                  U5E02660
                          LD      SU908+2   *CYLINDER                   U5E02670
                          STO  L2 SU925+2   *ADDRESSES                  U5E02680
                          LD      SU915     FETCH AVAIL CART INDICATOR  U5E02690
                          OR      SU915+1   MASK IN BIT FOR THIS DRIVE  U5E02700
                    *                                                   U5E02710
                    SU120 SLA     1         SHIFT AND                   U5E02720
                          STO     SU915     *SAVE AVAIL CART INDICATOR  U5E02730
                          MDX   2 3         INCR DEF CYLIN ADDR COUNT   U5E02740
                          NOP                                           U5E02750
                          MDX   1 1         INCR DR COUNT, SKIP IF ZERO U5E02760
                          MDX     SU080                                 U5E02770
                    *                                                   U5E02780
                          LD      SU923     RESTORE CONTENTS            U5E02790
                          STO  L  $LEV2     *OF LOCATION 10             U5E02800
                    *                                                   U5E02810
                    *     PRINT HEADING                                 U5E02820
                    *                                                   U5E02830
                          LD   L  SU937     RESTORE AREA CODE FOR  2-11 U5E02832
                          STO  L  $ACDE     *OLD MASTER            2-11 U5E02834
                          LD   I  $CH12     FETCH CHANNEL 12 INDICATOR  U5E02840
                          BSI  L  RSTOR,Z   BR TO RESTORE PAGE IF NON-Z U5E02850
                          LD      SU926     FETCH PRINT AREA ADDRESS    U5E02860
                          SRT     16        SHIFT TO EXTENTION          U5E02870
                          LD   L  SU973     FETCH PRINT FUNCTION CODE   U5E02880
                          BSI  I  PRINT     BRANCH TO PRINT THE LINE    U5E02890
                          MDX  L  $PBSY,0   SKIP NEXT IF PRINT COMPLETE U5E02900
                          MDX     *-3       BR TO TEST PRINT COMPLETE   U5E02910
                    *                                                   U5E02920
                    *     FIND  FIRST CARTRIDGE ID OF ID LIST IN        U5E02930
                    *     CART LIST                                     U5E02940
                    *                                                   U5E02950
                          LDX   1 0         ID LIST COUNT TO XR1        U5E02960
                          BSI  L  SU279     BR TO FIND ID          2-11 U5E02970
                          MDX     SU180     ON RETRN GO UPDTE DCOM 2-11 U5E02980
                    *                       * AND COMMA            2-11 U5E02990
                    *                                                   U5E03100
                    *     CONSTANTS AND WORK AREA                       U5E03110
                    *                                                   U5E03120
                          BSS  E  0                                     U5E03130
                    SU902 BSS     5         ID LIST                     U5E03160
                          DC      0                                     U5E03170
                    SU904 BSS     11        CART LIST-PHY DR ORDER 2-11 U5E03180
                          DC      -1                                    U5E03190
                    SU906 DC      4         WORD COUNT                  U5E03200
                    SU907 DC      #IDAD     SECTOR ADDRESS          2-3 U5E03210
                    SU908 BSS     4         DEF CYL, CART ID I/O AREA   U5E03220
                    SU910 DC      SU914     ADDRESS OF I/O AREA         U5E03230
                          DC      *-*       SECOND WORD OF READ IOCC    U5E03240
                    SU912 DC      /658      MAXIMUM ARM POSITION        U5E03250
                          DC      *-*       SECOND WORD OF SENSE IOCC   U5E03260
                    SU914 DC      1         WORD COUNT                  U5E03270
                          DC      *-*       I/O AREA                    U5E03280
                    SU915 DC      *-*       AVAIL CARTRIDGE INDICATOR   U5E03290
                          DC      /0001                                 U5E03300
                    SU916 DC      5         MAXIMUM NUMBER OF DRIVES2-3 U5E03310
                    SU917 DC      SU906     ADDR OF CART ID I/O AREA    U5E03320
                    SU918 DC      DCOMX-2   ADDR OF DCOM I/O AREA       U5E03330
                    SU919 DC      *-*       SYSTEM CARTRIDGE SWITCH     U5E03340
                    SU920 DC      /0600     READ FUNCTION CODE          U5E03350
                    SU921 DC      /0701     SENSE FUNCTION CODE         U5E03360
                    SU922 DC      SU090     INTERRUPT SERVICE ADDRESS   U5E03370
                    SU923 DC      *-*       SAVE FOR LOCATION 10        U5E03380
                    SU924 DC      /2000     AREA CODE FOR PHY DRIVE 0   U5E03390
                          DC      /8800     AREA CODE FOR PHY DRIVE 1   U5E03400
                          DC      /9000     AREA CODE FOR PHY DRIVE 2   U5E03410
                          DC      /9800     AREA CODE FOR PHY DRIVE 3   U5E03420
                          DC      /A000     AREA CODE FOR PHY DRIVE 4   U5E03430
                          DC      /B000     AREA CODE-PHY DR  5    2-11 U5E03431
                          DC      /B800     AREA CODE-PHY DR  6    2-11 U5E03432
                          DC      /B810     AREA CODE-PHY DR  7    2-11 U5E03433
                          DC      /B820     AREA CODE-PHY DR  8    2-11 U5E03434
                          DC      /B830     AREA CODE-PHY DR  9    2-11 U5E03436
                          DC      /B840     AREA CODE-PHY DR 10    2-11 U5E03438
                    SU925 BSS     33        DEF CYLINDER ADDRS     2-11 U5E03440
                    SU926 DC      SU928-1   ADDRESS OF PRINT AREA       U5E03450
                          DC      23                                    U5E03460
                    SU928 EBC     .LOG DRIVE   CART SPEC   CART AVAIL.  U5E03470
                          EBC     .  PHY DRIVE .                        U5E03480
                    ADCOM DC      DCOM-2    ADDRESS OF SYSTEM DCOM      U5E03490
                    PRINT DC      *-*       ENTRY TO PRINT SUBROUTINE   U5E03500
                    *                                                   U5E03510
                    *     READ SYSTEM CARTRIDGE DCOM                    U5E03520
                    *                                                   U5E03530
                    SU180 BSI  L  SU600     BR TO STORE $ACDE, DEF CYLS U5E03540
                          LD      SU926     SET SWITCH                  U5E03550
                          SRT     16        *NON-ZERO                   U5E03560
                          LD   L2 SU904     FETCH CARTRIDGE ID          U5E03570
                          BSI  L  SU400     BR TO CK FOR DUPLICATE IDS  U5E03580
                    *                                                   U5E03590
                          LD      SU919     BRANCH IF THE SYSTEM        U5E03600
                          BSC  L  SU220,Z   *CARTRIDGE HAS NOT CHANGED  U5E03610
                    *                                                   U5E03620
                          LD   L  ADCOM     FETCH ADDR OF DCOM I/O AREA U5E03630
                          SRT     16        SHIFT TO EXT, ACC = 0       U5E03640
                          BSI  L  DZ000     BRANCH TO DISK READ         U5E03650
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  U5E03660
                          MDX     *-3       BR TO TEST READ COMPLETE    U5E03670
                    *                                                   U5E03680
                    *     UPDATE MODIFICATION LEVEL IN COMMA            U5E03690
                    *                                                   U5E03700
                          LD   L  #SYSC     FETCH MOD LEVEL FROM DCOM   U5E03710
                          STO  L  $SYSC     *AND STORE TO COMMA         U5E03720
                    *                                                   U5E03730
                          LDX   2 -DSIZE    SET DCOM WORD COUNT     2-3 U5E03740
                    SU200 LD   L2 DCOM+DSIZE FETCHA WD FROM SYS DCOM2-3 U5E03750
                          STO  L2 DCOMX+DSIZE  STORE TO NON-SYS DCOM2-3 U5E03760
                          MDX   2 1         INCR WORD CNT, SKIP IF ZERO U5E03770
                          MDX     SU200     BRANCH TO FETCH NEXT WORD   U5E03780
                          BSI  L  SU500     BRANCH TO UPDATE SYS DCOM   U5E03790
                    *                                                   U5E03800
                    *     SAVE THE CARTRIDGE IDS IN PHYSICAL ORDER IN   U5E03810
                    *     DCOM                                          U5E03820
                    *                                                   U5E03830
                    SU220 LDX   2 -5        WORD COUNT TO XR2           U5E03840
                          LD   L2 SU904+5   FETCH A CARTRIDGE ID        U5E03850
                          STO  L2 #PCID+5   STORE TO DCOM               U5E03860
                          MDX   2 1         INCR WORD CNT, SKIP IF ZERO U5E03870
                          MDX     SU220+1   BRANCH TO FETCH NEXT ID     U5E03880
                          LDX  I2 SU977     FETCH THE CARTRIDGE ID      U5E03890
                          LD   L1 SU902     *THAT WAS ZEROED OUT        U5E03900
                          MDX   2 -4        *CHECK IF PHY DR G.T.4 2-11 U5E03902
                          MDX     SU230     *BR IF YES             2-11 U5E03904
                          MDX   2 4         *OTHERWISE RESTORE XR2 2-11 U5E03906
                          NOP               IN CASE OF SKIP        2-11 U5E03908
                          STO  L2 #PCID     *AND STORE ID TO DCOM  2-11 U5E03910
                    SU230 LD   L  SU915     FETCH AVAIL CART IND   2-11 U5E03920
                          SLA     4         SHIFT TO LEFT 11 BITS  2-11 U5E03930
                          STO  L  #ACIN     *AND STORE TO DCOM          U5E03940
                    *                                                   U5E03950
                    *     ZERO OUT TABLES IN COMMA AND DCOM             U5E03960
                    *                                                   U5E03970
                          LDX   2 -4        WORD COUNT TO XR2           U5E03980
                          SRA     16        CLEAR ACCUMULATOR           U5E03990
                    SU240 STO  L2 $ACDE+5   SET                         U5E04000
                          STO  L2 $CYLN+5   *TO                         U5E04010
                          STO  L2 #ANDU+5   *ZERO                       U5E04020
                          STO  L2 #BNDU+5   *ITEMS 1-4 OF               U5E04030
                          STO  L2 #FPAD+5   *CARTRIDGE                  U5E04040
                          STO  L2 #CIDN+5   *DEPENDENT                  U5E04050
                          STO  L2 #CIBA+5   *TABLES                     U5E04060
                          STO  L2 #FMAT+5   *IN                         U5E04070
                          STO  L2 #FLET+5   *COMMA                      U5E04080
                          STO  L2 #ULET+5   *AND                        U5E04090
                          STO  L2 #WSCT+5   *DCOM                       U5E04100
                          MDX   2 1         INCR WORD CNT, SKIP IF ZERO U5E04110
                          MDX     SU240     BR TO ZERO OUT NEXT ITEM    U5E04120
                    *                                                   U5E04130
                          LDX   2 -12       WORD COUNT TO XR2           U5E04140
                    * 1 INSTRUCTION REMOVED                        2-11 U5E04150
                    SU260 STO  L2 $DCYL+15  STORE TO $DCYL IN COMMA     U5E04160
                          MDX   2 1         INCR WORD CNT, SKIP IF ZERO U5E04170
                          MDX     SU260     BR TO STORE NEXT DEF CYL    U5E04180
                    *                                                   U5E04190
                    *     PRINT CARTRIDGE ID AND DRIVE                  U5E04200
                    *                                                   U5E04210
                    MORE  LD      SU928-1   SET TO PRINT COMPLETE LINE  U5E04220
                          BSI  L  SU700     BRANCH TO PRINT A LINE      U5E04230
                    *                                                   U5E04240
                    *     INCREMENT LOGICAL DRIVE COUNT                 U5E04250
                    *                                                   U5E04260
                          MDX   1 1         INCREMENT DRIVE COUNT       U5E04270
                          NOP                                           U5E04280
                          LD   L1 SU902     FETCH NEXT ID FROM ID LIST  U5E04290
                          BSC  L  NOMOR,+-  BRANCH IF ID BLANK          U5E04300
                          BSI     SU279     BR TO FIND ID          2-11 U5E04302
                          MDX     SU300     ON RETRN GO UPDTE DCOM 2-11 U5E04304
                    *                                                   U5E04310
                    *     FIND CARTRIDGE ID IN CART LIST                U5E04320
                    *                                                   U5E04330
                    SU279 DC      *-*       ENTRY/RETURN ADDRESS   2-11 U5E04338
                          LDX  L2 SU925     FETCH AND SAVE ADDRESS OF   U5E04340
                          STX  L2 SU960     *DEF CYL ADDRESSES          U5E04350
                          LDX   2 0         CART LIST COUNT TO XR2      U5E04360
                    SU280 LD   L2 SU904     FETCH AN ID FROM CART LIST  U5E04370
                          BSC  L  SU390,+Z  BR IF ID NEGATIVE       2-2 U5E04380
                          BSC  L  SU290,+   BRANCH IF ID BLANK          U5E04390
                          S    L1 SU902     SUBTRACT ID FROM ID LIST    U5E04400
                          BSC  I  SU279,+-  BR IF IDS EQUAL        2-11 U5E04410
                    SU290 MDX   2 1         INCREMENT CART LIST COUNT   U5E04420
                          NOP                                           U5E04430
                          MDX  L  SU960,3   INCR ADDR OF DEF CYL ADDRS  U5E04440
                          MDX     SU280     BRANCH TO TEST NEXT ID      U5E04450
                    *                                                   U5E04460
                    SU300 BSI  L  SU600     BR TO STORE $ACDE, DEF CYLS U5E04470
                          LD      *+1       SET SWITCH                  U5E04480
                          SRT     16        *NON-ZERO                   U5E04490
                          LD   L2 SU904     FETCH CARTRIDGE ID          U5E04500
                          BSI  L  SU400     BR TO CK FOR DUPLICATE IDS  U5E04510
                    *                                                   U5E04520
                    *     READ NON-SYSTEM CARTRIDGE DCOM                U5E04530
                    *                                                   U5E04540
                          LD   L  SU976     FETCH DRIVE NUMBER          U5E04550
                          SLA     12        SHIFT NUMBER TO BITS 0-3    U5E04560
                          A    L  DCOM-1    ADD SECTOR ADDRESS          U5E04570
                          STD  L  DCOMX-1   STORE TO DCOM I/O AREA      U5E04580
                          LD   L  SU918     FETCH ADDR OF DCOM I/O AREA U5E04590
                          SRT     16        SHIFT TO EXT, ACC = 0       U5E04600
                          BSI  L  DZ000     BRANCH TO DISK READ         U5E04610
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  U5E04620
                          MDX     *-3       BR TO TEST READ COMPLETE    U5E04630
                    *                                                   U5E04640
                          BSI  L  SU500     BRANCH TO UPDATE DCOM       U5E04650
                          MDX     MORE                                  U5E04660
                    *                                                   U5E04670
                    *     ALL REQUESTED CARTRIDGE IDS HAVE BEEN FOUND   U5E04680
                    *     AND ALL COMMA AND DCOM TABLES HAVE BEEN       U5E04690
                    *     UPDATED                                       U5E04700
                    *                                                   U5E04710
                    NOMOR LDX   1 -11       CART LIST COUNT TO XR2 2-11 U5E04720
                    *                                                   U5E04730
                    SU310 LD   L1 SU904+11  FETCH ID FR CART LIST  2-11 U5E04740
                          BSC  L  SU320,+-  BRANCH IF ID BLANK          U5E04750
                    *                                                   U5E04760
                          STX  L1 SU977     SAVE XR1 VALUE         2-11 U5E04770
                          MDX  L  SU977,11  CONVERT TO PHY DR NO.  2-11 U5E04780
                          NOP               IN CASE OF SKIP        2-11 U5E04790
                          STO  L  SU978     STORE TO PRINT SUBR         U5E04800
                          SRA     16        SET TO PRINT HALF LINE      U5E04810
                          BSI  L  SU700     BRANCH TO PRINT A LINE      U5E04820
                    *                                                   U5E04830
                    SU320 MDX   1 1         INCR CART LIST CNT, SK IF Z U5E04840
                          MDX     SU310     BRANCH TO FETCH NEXT ID     U5E04850
                    *                                                   U5E04860
                          LDX   1 -5        WORD COUNT TO XR1           U5E04870
                    SU330 LD   L1 #ULET+5   STORE LET SECTOR ADDRESS    U5E04880
                          STO  L1 $ULET+5   *TO COMMA                   U5E04890
                          LD   L1 #FPAD+5   STORE FILE PROTECTED ADDR   U5E04900
                          STO  L1 $FPAD+5   *TO COMMA                   U5E04910
                          MDX   1 1         INCR WORD CNT, SKIP IF ZERO U5E04920
                          MDX     SU330     BRANCH TO FETCH NEXT WORD   U5E04930
                    *                                                   U5E04940
                    *     WRITE UPDATED DCOM TO SYSTEM CARTRIDGE        U5E04950
                    *                                                   U5E04960
                          LD   L  ADCOM     FETCH ADDR OF DCOM I/O AREA U5E04970
                          SRT     16        SHIFT TO EXTENTION          U5E04980
                          LD   L  SU914     FETCH WRITE FUNCTION CODE   U5E04990
                          BSI  L  DZ000     BRANCH TO DISK WRITE        U5E05000
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  U5E05010
                          MDX     *-3       BR TO TEST WRITE COMPLETE   U5E05020
                    *                                               2-3 U5E05021
                    * UPDATE $CIBA AND $CILA IN COMMA               2-3 U5E05022
                    *                                               2-3 U5E05023
                          LD   L  #CIBA     SET SECTOR ADDRESS OF   2-3 U5E05024
                          STO  L  $CIBA     *CIB IN COMMA           2-3 U5E05025
                          LD   L  SU907     FETCH AND STORE         2-3 U5E05026
                          SRT     16        *ID SECTOR              2-3 U5E05027
                          LD      SU929+1   *WORD COUNT             2-3 U5E05028
                          STD  L  DCOM-2    *AND SECTOR ADDRESS     2-3 U5E05029
                          LD   L  ADCOM     FETCH ADDRESS OF I/OAREA2-3 U5E05030
                          SRT     16        SHIFT TO EXT, ACC = 0   2-3 U5E05031
                          BSI  L  DZ000     BRANCH TO DISK READ     2-3 U5E05032
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLE2-3 U5E05033
                          MDX     *-3       BR TO TEST READ COMPLETE2-3 U5E05034
                          LDD  L  DCOM+$ZEND-@CSTR-6  FETCH ANDSTORE2-3 U5E05036
                          STD  I  $CILA       *WCNT/SCTR ADDR OF CIL2-3 U5E05038
                    *                                               2-3 U5E05039
                          BSI     SU380     BR TO TEST FOR INTRPT REQ   U5E05040
                    *                                                   U5E05050
                          LD   L  SU939+2   RESTORE INTERUPT ADDR   2-2 U5E05053
                          STO  L  $LEV0     *FOR LEV 0              2-2 U5E05054
                          LD   L  SU939+3   RESTORE INTERUPT ADDR   2-2 U5E05055
                          STO  L  $LEV1     *FOR LEV 1              2-2 U5E05056
                          LD   L  SU939+4   RESTORE INTERRUPT ADDR  212 U5E05057
                          STO  L  $LEV4     *FOR LEV 4             2-12 U5E05058
                          LD   L  SU938     RESTORE ADDRESS OF USERS    U5E05060
                          STO  L  $IBT4     *INTERRUPT BRANCH TABLE     U5E05070
                          LD   L  SU929     *RESTORE                2-3 U5E05071
                          STO  L  DCOM-1    *TO                     2-3 U5E05072
                          LD   L  SU944     *MAKE                   2-3 U5E05073
                          STO  L  DCOM-2    *SYSUP                  2-3 U5E05074
                          STO  L  DCOMX-2   *REUSABLE               2-3 U5E05075
                          LDD  L  SU939     RESTORE ACC AND EXT         U5E05080
                    SU360 LDS     0         RESTORE STATUS              U5E05090
                          LDX  L1 *-*       RESTORE XR1                 U5E05100
                          LDX  L2 *-*       RESTORE XR2                 U5E05110
                          LDX  L3 *-*       RESTORE XR3                 U5E05120
                          MDX  L  SYSUP,1   INCREMENT RETURN ADDRESS    U5E05130
                          BSC  I  SYSUP     RETURN                      U5E05140
                    *                                                   U5E05150
                    *     TEMPORARY INTERRUPT REQUEST SUBROUTINE        U5E05160
                    *                                                   U5E05170
                    SU370 DC      *-*       ENTRY                       U5E05180
                          XIO  L  SU938     SENSE INT REQ W/RESET  2-11 U5E05190
                          BSC  L  $IBT4+1   BRANCH TO ILS04 SUBR    2-2 U5E05200
                    *                                                   U5E05210
                    *     TEST FOR THE OCCURANCE OF AN INTERRUPT        U5E05220
                    *     REQUEST DURING SYSUP                          U5E05230
                    *                                                   U5E05240
                    SU380 DC      *-*       ENTRY                       U5E05250
                          LD      SU936     RESTORE ADDRESS OF          U5E05260
                          STO  L  $IREQ     *INTERRUPT REQUEST SUBR     U5E05270
                          LD      SU370     TEST FOR AND RETURN IF      U5E05280
                          BSC  I  SU380,+-  *INTRPT REQ SUBR NOT ENTER  U5E05290
                          BSI  L  $DUMP     BRANCH TO PROCESS           U5E05300
                          DC      -2        *INTERRUPT REQUEST          U5E05310
                    *                                                   U5E05320
                    *     PRINT ERROR MESSAGES                          U5E05330
                    *                                                   U5E05340
                    SU390 A       SU929     CHECK IF ID = -1        2-2 U5E05344
                          BSC  L  ERRUP,+-  *IF YES DO NOT PR ID IN 2-2 U5E05345
                          S       SU929     *ACC, IF NO ID IN ACC   2-2 U5E05346
                          STO  L1 SU902     *SHOULD BE PRINTED      2-2 U5E05350
                    *                                                   U5E05360
                    ERRUP LDX   2 1         POINT TO ERROR MESSAGE      U5E05365
                          LD   L2 SU930     FETCH ADDR OF ERROR MESSAGE U5E05370
                          A       SU929     INCREMENT AND               U5E05380
                          STO  L  SU984     *STORE TO CONVERSION SUBR   U5E05390
                          LD   L1 SU902     FETCH CARTRIDGE ID          U5E05400
                          BSI  L  SU800     BRANCH TO CONVERT TO EBCDIC U5E05410
                    *                                                   U5E05420
                          LD   I  $CH12     FETCH CHANNEL 12 INDICATOR  U5E05430
                          BSI  L  RSTOR,Z   BR TO RESTORE PAGE IF NON-Z U5E05440
                    *                                                   U5E05450
                          LD   L2 SU930     FETCH ADDR OF ERROR MESSAGE U5E05460
                          SRT     16        SHIFT TO EXTENSION          U5E05470
                          LD      SU930     FETCH PRINT FUNCTION CODE   U5E05480
                          BSI  I  PRINT     BRANCH TO PRINT THE MESSAGE U5E05490
                          MDX  L  $PBSY,0   SKIP NEXT IF PRINT COMPLETE U5E05500
                          MDX     *-3       BR TO TEST PRINT COMPLETE   U5E05510
                    *                                                   U5E05520
                          LD      SU937     RESTORE                     U5E05530
                          STO  L  $FLSH     SET FLUSH JOB SWITCH        U5E05550
                          BSI     SU380     BR TO TEST FOR INTRPT REQ   U5E05560
                          EXIT              BR TO MCRA             2-11 U5E05570
                    *                                                   U5E05580
                    *     CONSTANTS AND WORK AREA                       U5E05590
                    *                                                   U5E05600
                          BSS  E  1         FORCE NEXT LOC TO BE ODD2-3 U5E05610
                    SU929 DC      1         CONSTANT ONE                U5E05620
                          DC      320       SECTOR WORD COUNT       2-3 U5E05625
                    SU930 DC      /7001                                 U5E05630
                          DC      SU931                                 U5E05640
                          DC      SU932                                 U5E05650
                          DC      SU933                                 U5E05660
                    SU931 DC      19                                    U5E05670
                          EBC     .XXXX IS NOT AN AVAILABLE CARTRIDGE.  U5E05680
                          EBC     . ID .                                U5E05690
                    SU932 DC      23                                    U5E05700
                          EBC     .XXXX IS A DUPLICATED SPECIFIED CAR.  U5E05710
                          EBC     .TRIDGE ID   .                        U5E05720
                    SU933 DC      23                                    U5E05730
                          EBC     .XXXX IS A DUPLICATED AVAILABLE CAR.  U5E05740
                          EBC     .TRIDGE ID   .                        U5E05750
                    SU935 DC      SU370     ADDR OF SYSUP INTRPT REQ    U5E05760
                    SU936 DC      *-*       ADDR OF NORMAL INTRPT REQ   U5E05770
                    SU937 DC      *-*       AREA CODE OF PREV SYS CART  U5E05780
                    SU938 DC      *-*       ADDRESS OF USERS IBT        U5E05790
                          DC      /0F01     SENSE INTERRUPT WITH RESET  U5E05800
                    SU939 DC      *-*       SAVE ACCUMULATOR            U5E05810
                          DC      *-*       SAVE EXTENSION              U5E05820
                          DC      *-*       SAVE INTERPT ADDR LEV 0 2-2 U5E05821
                          DC      *-*       SAVE INTERPT ADDR LEV 1 2-2 U5E05822
                          DC      *-*       SAVE INTRPT ADDR LEV 4 2-12 U5E05823
                          HDNG    UPDATE SYSTEM DCOM                    U5E05830
                    *                                                   U5E05840
                    *     CHECK FOR DUPLICATE CARTRIDGE IDS             U5E05850
                    *                                                   U5E05860
                    SU400 DC      *-*       ENTRY/RETURN ADDRESS        U5E05870
                    *                                                   U5E05880
                          STD     SU940     SAVE CARTRIDGE ID AND SW    U5E05890
                          STX   1 SU941     SAVE XR1                    U5E05900
                          STX   2 SU942     SAVE XR2                    U5E05910
                          LD      SU940+1   FETCH SWITCH                U5E05930
                          BSC  L  SU440,Z   BRANCH IF NON-ZERO          U5E05940
                    *                                                   U5E05950
                    *     CHECK ID LIST FOR DUPLICATE CARTRIDGE IDS     U5E05960
                    *                                                   U5E05970
                    SU420 LDX   2 5         ID LIST CNT TO XR2     2-11 U5E05975
                          LD   L2 SU902-1   FETCH A CART ID        2-11 U5E05980
                          BSC  L  SU480,+-  BR IF ID BLANK          2-6 U5E05990
                          S       SU940     TEST FOR AND                U5E06000
                          BSI  L  SU460,+-  *BRANCH IF IDENTICAL IDS    U5E06010
                    SU430 MDX   2 -1        DECR ID CNT,SKIP IF=0  2-11 U5E06020
                          MDX     SU420+1   BR TO TEST NEXT ID     2-11 U5E06030
                          MDX     SU480     BRANCH TO RETURN            U5E06040
                    *                                                   U5E06050
                    *     CHECK CART LIST FOR DUPLICATE CARTRIDGE IDS   U5E06060
                    *                                                   U5E06070
                    SU440 LDX   2 11        CART LIST CNT TO XR2   2-11 U5E06075
                          LD   L2 SU904-1   FETCH A CART ID        2-11 U5E06080
                          BSC  L  SU450,+-  BRANCH IF ID BLANK          U5E06090
                          S       SU940     TEST FOR AND                U5E06100
                          BSI  L  SU460,+-  *BRANCH IF IDENTICAL IDS    U5E06110
                    SU450 MDX   2 -1        DECR ID CNT,SKIP IF=0  2-11 U5E06120
                          MDX     SU440+1   BR TO TEST NEXT ID     2-11 U5E06130
                          MDX     SU480     BRANCH TO RETURN            U5E06140
                    *                                                   U5E06150
                    *     CHECK IF IDENTICAL CARTRIDGE IDS THE SAME ID  U5E06160
                    *                                                   U5E06170
                    SU460 DC      *-*       ENTRY/RETURN ADDRESS        U5E06180
                          STX   2 SU943     SAVE COUNTER           2-11 U5E06190
                          MDX  L  SU943,-1  ADJUST TO BE LIST PNTR 2-11 U5E06200
                          NOP               IN CASE OF SKIP        2-11 U5E06210
                          LD      SU942     FETCH EXTERNAL COUNTER      U5E06220
                          S       SU943     TEST FOR AND                U5E06230
                          BSC  I  SU460,+-  *RETURN IF COUNTERS EQUAL   U5E06240
                    *                                                   U5E06250
                          LD      SU940+1   FETCH SWITCH                U5E06260
                          BSC  L  SU470,Z   BRANCH IF NON-ZERO          U5E06270
                          LDX  I1 SU942     POINT TO CARTRIDGE ID       U5E06280
                          LDX   2 2         POINT TO ERROR MESSAGE      U5E06290
                          BSC  L  ERRUP+1   BRANCH TO PRINT THE MESSAGE U5E06300
                    SU470 LDX  I1 SU941     POINT TO CARTRIDGE ID       U5E06310
                          LDX   2 3         POINT TO ERROR MESSAGE      U5E06320
                          BSC  L  ERRUP+1   BRANCH TO PRINT THE MESSAGE U5E06330
                    *                                                   U5E06340
                    *     RESTORE AND RETURN                            U5E06350
                    *                                                   U5E06360
                    SU480 LDX  I1 SU941     RESTORE XR1                 U5E06370
                          LDX  I2 SU942     RESTORE XR2                 U5E06380
                          SRA     16        SET CARTRIDGE ID            U5E06390
                          STO  L2 SU904     *IN CART LIST BLANK         U5E06400
                          LDD     SU940     RESTORE ACC AND EXT         U5E06410
                          BSC  I  SU400     RETURN                      U5E06420
                    *                                                   U5E06430
                    *     WORK AREA                                     U5E06440
                    *                                                   U5E06450
                    SU940 DEC     0.0       CARTRIDGE ID AND SWITCH     U5E06460
                    SU941 DC      *-*       SAVE FOR XR1                U5E06470
                    SU942 DC      *-*       SAVE FOR XR2                U5E06480
                    SU943 DC      *-*       TEMPORARY COUNTER           U5E06490
                    SU944 DC      /6E                                   U5E06491
                          HDNG    UPDATE SYSTEM DCOM                    U5E06500
                    *                                                   U5E06510
                    *     UPDATE SYSTEM CARTRIDGE DCOM                  U5E06520
                    *                                                   U5E06530
                    SU500 DC      *-*       ENTRY/RETURN ADDRESS        U5E06540
                    *                                                   U5E06550
                    *     FIND THE POSITION OF THE CARTRIDGE ID         U5E06560
                    *     IN #CIDN OF DCOM                              U5E06570
                    *                                                   U5E06580
                          LDX   2 -5        #CIDN COUNT TO XR1          U5E06590
                    SU520 LD   L1 SU902     FETCH CART ID FROM ID LIST  U5E06600
                          S    L2 DCOMX+60  SUBTRACT #CIDN              U5E06610
                          BSC  L  SU540,+-  BR IF THE TWO IDS ARE EQUAL U5E06620
                          MDX   2 1         INCR #CIDN CNT, SKIP IF Z   U5E06630
                          MDX     SU520     BRANCH TO TEST NEXT CARID   U5E06640
                          BSC  L  ERRUP     BRANCH TO ERROR RETURN      U5E06650
                    *                                                   U5E06660
                    *     MOVE ITEMS FROM XR2 POSITION IN NON-SYSTEM    U5E06670
                    *     DCOM TO XR1 POSITION IN SYSTEM DCOM           U5E06680
                    *                                                   U5E06690
                    SU540 MDX   2 5         SET CARID COUNT POSITIVE    U5E06700
                          NOP                                           U5E06710
                          STX   1 SU950     STORE AS DRIVE CODE         U5E06720
                          LD      SU950     FETCH DRIVE CODE TO ACC     U5E06730
                          SLA     12        SHIFT DR CODE TO BITS 0-3   U5E06740
                          STO     SU950     SAVE AS DRIVE CODE MASK     U5E06750
                    *                                                   U5E06760
                          LD   L2 DCOMX+35  FETCH ADDR OF END OF UA-ADJ U5E06770
                          STO  L1 #ANDU     STORE TO SYSTEM DCOM        U5E06780
                    *                                                   U5E06790
                          LD   L2 DCOMX+40  FETCH ADDR OF END OF UA-BAS U5E06800
                          STO  L1 #BNDU     STORE TO SYSTEM DCOM        U5E06810
                    *                                                   U5E06820
                          LD   L2 DCOMX+45  FETCH FILE PROTECT ADDRESS  U5E06830
                          BSI     SU550     UPDATE DRIVE CODE           U5E06840
                          STO  L1 #FPAD     STORE TO SYSTEM DCOM        U5E06850
                    *                                                   U5E06860
                          LD   L2 DCOMX+55  FETCH CARTRIDGE ID          U5E06870
                          STO  L1 #CIDN     STORE TO SYSTEM DCOM        U5E06880
                    *                                                   U5E06890
                          LD   L2 DCOMX+60  FETCH SECTOR ADDRESS OF CIB U5E06900
                          BSI     SU550     UPDATE DRIVE CODE           U5E06910
                          STO  L1 #CIBA     STORE TO SYSTEM DCOM        U5E06920
                    *                                                   U5E06930
                          LD   L2 DCOMX+65  FETCH SCTR ADDRESS OF SCRA  U5E06940
                          BSI     SU550     UPDATE DRIVE CODE           U5E06950
                          STO  L1 #SCRA     STORE TO SYSTEM DCOM        U5E06960
                    *                                                   U5E06970
                          LD   L2 DCOMX+70  FETCH FORMAT OF PROG IN WS  U5E06980
                          STO  L1 #FMAT     STORE TO SYSTEM DCOM        U5E06990
                    *                                                   U5E07000
                          LD   L2 DCOMX+75  FETCH FLET SECTOR ADDRESS   U5E07010
                          BSI     SU550     UPDATE DRIVE CODE           U5E07020
                          STO  L1 #FLET     STORE TO SYSTEM DCOM        U5E07030
                    *                                                   U5E07040
                          LD   L2 DCOMX+80  FETCH LET SECTOR ADDRESS    U5E07050
                          BSI     SU550     UPDATE DRIVE CODE           U5E07060
                          STO  L1 #ULET     STORE TO SYSTEM DCOM        U5E07070
                    *                                                   U5E07080
                          LD   L2 DCOMX+85  FETCH BLK CNT OF PROG IN WS U5E07090
                          STO  L1 #WSCT     STORE TO SYSTEM DCOM        U5E07100
                    *                                                   U5E07110
                          LD   L2 DCOMX+90  FETCH SCTR ADDR OF CUSHION  U5E07120
                          STO  L1 #CSHN     STORE TO SYSTEM DCOM        U5E07130
                    *                                                   U5E07140
                          BSC  I  SU500     RETURN                      U5E07150
                    *                                                   U5E07160
                    *     UPDATE DRIVE CODE OF SECTOR ADDRESS           U5E07170
                    *                                                   U5E07180
                    SU550 DC      *-*       ENTRY/RETURN ADDRESS        U5E07190
                          SLA     4         SHIFT OUT PRESENT DR CODE   U5E07200
                          SRA     4         SHIFT SECTOR ADDRESS BACK   U5E07210
                          OR      SU950     MASK IN NEW DRIVE CODE      U5E07220
                          BSC  I  SU550     RETURN                      U5E07230
                    *                                                   U5E07240
                    SU950 DC      *-*       DRIVE CODE                  U5E07250
                          HDNG    SYSUP - UPDATE SYSTEM DCOM            U5E07260
                    *                                                   U5E07270
                    *     STORE AREA CODE AND DEFECTIVE CYLINDER        U5E07280
                    *     ADDRESSES TO COMMA                            U5E07290
                    *                                                   U5E07300
                    SU600 DC      *-*       ENTRY/RETURN ADDRESS        U5E07310
                    *                                                   U5E07320
                          STX   1 SU976     SAVE LOG DR NO.        2-11 U5E07330
                          STX   2 SU977     SAVE PHY DR NO.        2-11 U5E07340
                          LD   L2 SU904     FETCH AND STORE             U5E07350
                          STO     SU978     *CART LIST ID TO PRINT SUBR U5E07360
                    *                                                   U5E07370
                          LD   L2 SU924     FETCH AREA CODE             U5E07380
                          STO  L1 $ACDE     STORE TO COMMA              U5E07390
                    *                                                   U5E07400
                          LDX  I1 SU960     FETCH ADDR OF DEF CYL ADDR  U5E07410
                          LDX  L2 *-*       FETCH ADDRESS IN COMMA AT   U5E07420
                    SU620 EQU     *-1       *WHICH TO STORE DEF CYL     U5E07430
                          LD    1 0         STORE                       U5E07440
                          STO   2 0         *DEFECTIVE                  U5E07450
                          LD    1 1         *CYLINDER                   U5E07460
                          STO   2 1         *ADDRESSES                  U5E07470
                          LD    1 2         *TO                         U5E07480
                          STO   2 2         *COMMA                      U5E07490
                    *                                                   U5E07500
                          MDX  L  SU620,3   INCR STORE ADDR OF DEF CYL  U5E07510
                          LDX  I1 SU976     RESTORE XR1                 U5E07520
                          LDX  I2 SU977     RESTORE XR2                 U5E07530
                    *                                                   U5E07540
                          BSC  I  SU600     RETURN                      U5E07550
                    *                                                   U5E07560
                    SU960 DC      *-*       ADDR OF DEF CYL ADDRESSES   U5E07570
                          HDNG    SYSUP - UPDATE SYSTEM DCOM            U5E07580
                    *                                                   U5E07590
                    *     PRINT LOG DRIVE, SPEC CART, AVAIL CART AND    U5E07600
                    *     PHY DRIVE                                     U5E07610
                    *                                                   U5E07620
                    SU700 DC      *-*       ENTRY/RETURN ADDRESS        U5E07630
                    *                                                   U5E07640
                          RTE     16        MOVE ID TO Q-REG        2-2 U5E07645
                          SLA     16        ZERO THE A-REG          2-2 U5E07650
                          LD      SU970     FETCH AND STORE INITIAL     U5E07660
                          STO     SU984     *PRINT AREA ADDRESS         U5E07670
                    *                                                   U5E07680
                    *     CLEAR THE PRINT AREA                          U5E07690
                    *                                                   U5E07700
                          LDX   2 -22       WORD COUNT TO XR2           U5E07710
                          LD      SU974     FETCH BLANK WORD            U5E07720
                    SU710 STO  L2 SU972+22  STORE TO PRINT AREA         U5E07730
                          MDX   2 1         INCR WORD CNT, SKIP IF ZERO U5E07740
                          MDX     SU710     BRANCH TO STORE NEXT WORD   U5E07750
                    *                                                   U5E07760
                          SLT     16        LINE SWITCH TO ACCUMULATOR  U5E07770
                          BSC  L  SU720,+-  BRANCH TO PRINT HALF LINE   U5E07780
                    *                                                   U5E07790
                    *     CONVERT AND STORE LOGICAL DRIVE               U5E07800
                    *                                                   U5E07810
                          MDX  L  SU984,2   INCREMENT PRINT AREA ADDR   U5E07820
                          LD      SU976     FETCH LOGICAL DRIVE         U5E07830
                          BSI     SU800     BR TO CONVT TO EBCDIC  2-11 U5E07840
                    *                                                   U5E07850
                    *     CONVERT AND STORE SPECIFIED CARTRIDGE ID      U5E07860
                    *                                                   U5E07870
                          MDX  L  SU984,4   INCREMENT PRINT AREA ADDR   U5E07880
                          LD   L1 SU902     FETCH SPEC CARTRIDGE ID     U5E07890
                          BSI     SU800     BR TO CONVT TO EBCDIC  2-11 U5E07900
                          MDX     SU740                                 U5E07910
                    *                                                   U5E07920
                    *     CONVERT AND STORE AVAILABLE CARTRIDGE ID      U5E07930
                    *                                                   U5E07940
                    SU720 MDX  L  SU984,10  INCREMENT PRINT AREA ADDR   U5E07950
                    *                                                   U5E07960
                    SU740 MDX  L  SU984,4   INCREMENT PRINT AREA ADDR   U5E07970
                          LD      SU978     FETCH AVAIL CARTRIDGE ID    U5E07980
                          BSI     SU800     BR TO CONVT TO EBCDIC  2-11 U5E07990
                    *                                                   U5E08000
                    *     CONVERT AND STORE PHYSICAL DRIVE              U5E08010
                    *                                                   U5E08020
                          MDX  L  SU984,4   INCREMENT PRINT AREA ADDR   U5E08030
                          LD      SU977     FETCH PHYSICAL DRIVE        U5E08040
                          BSI     SU800     BR TO CONVT TO EBCDIC  2-11 U5E08050
                    *                                                   U5E08060
                    *     PRINT THE PRINT AREA                          U5E08070
                    *                                                   U5E08080
                          LD   I  $CH12     FETCH CHANNEL 12 INDICATOR  U5E08090
                          BSI  L  RSTOR,Z   BR TO RESTORE PAGE IF NON-Z U5E08100
                          LD      SU970     FETCH PRINT AREA ADDRESS    U5E08110
                          SRT     16        SHIFT TO EXTENTION          U5E08120
                          LD      SU973     FETCH PRINT FUNCTION CODE   U5E08130
                          BSI  I  PRINT     BRANCH TO PRINT THE LINE    U5E08140
                          MDX  L  $PBSY,0   SKIP NEXT IF PRINT COMPLETE U5E08150
                          MDX     *-3       BR TO TEST PRINT COMPLETE   U5E08160
                    *                                                   U5E08170
                          BSC  I  SU700     RETURN                      U5E08180
                    *                                                   U5E08190
                    *     CONSTANTS AND WORK AREA                       U5E08200
                    *                                                   U5E08210
                          BSS  E  0                                     U5E08220
                    SU970 DC      SU972-1   ADDRESS OF PRINT AREA       U5E08230
                          DC      22        WORD COUNT OF PRINT AREA    U5E08240
                    SU972 BSS     22        PRINT AREA                  U5E08250
                    SU973 DC      /7001     PRINT FUNCTION CODE         U5E08260
                    SU974 DC      /4040     EBCDIC BLANK WORD           U5E08270
                    SU976 DC      *-*       LOGICAL DRIVE               U5E08280
                    SU977 DC      *-*       PHYSICAL DRIVE              U5E08290
                    SU978 DC      *-*       AVAILABLE CARTRIDGE ID      U5E08300
                          HDNG    SYSUP - UPDATE SYSTEM DCOM            U5E08310
                    *************************************************** U5E08320
                    * THIS SUBROUTINE CONVERTS A 16 BIT BINARY NUMBER * U5E08330
                    * TO FOUR EBCDIC VALUES THAT ARE THE EQUIVALENT IN* U5E08340
                    * HEX.                                            * U5E08350
                    *  INPUT  - 16 BIT BINARY NUMBER IN ACCUMULATOR   * U5E08360
                    *  OUTPUT - FOUR EBCDIC VALUES PACKED TWO PER WORD* U5E08370
                    *           AND STORED IN THE PRINT BUFFER        * U5E08380
                    *                                                 * U5E08390
                    * XR1 AND XR2 ARE SAVED AND RESTORED              * U5E08400
                    *************************************************** U5E08410
                    *                                                   U5E08420
                    SU800 DC      *-*       ENTRY/RETURN ADDR      2-11 U5E08430
                    *                                              2-11 U5E08440
                          SRT     16        NUMBER TO EXT          2-11 U5E08450
                          STX   1 SU890+1   SAVE XR1               2-11 U5E08460
                          STX   2 SU890+3   SAVE XR2               2-11 U5E08470
                          LDX   1 -2        SET OUTPUT WORD CNT    2-11 U5E08480
                    *                                                   U5E08490
                    SU820 LDX   2 -2        SET CHAR PER WORD CNT  2-11 U5E08500
                          STO     SU983     STORE TEMPORARILY      2-11 U5E08510
                          SRA     16        CLEAR ACC TO ZERO      2-11 U5E08520
                          SLT     4         GET 4 BITS TO CONVT    2-11 U5E08530
                          S       SU980     SUB 9 TO CHK 0-9 OR A-F2-11 U5E08540
                          BSC     +         SKIP IF A-F            2-11 U5E08550
                          A       SU981     ADD /0039              2-11 U5E08560
                          A       SU982     ADD /00C0              2-11 U5E08570
                          SLA     8         SHIFT TO LEFT OF WORD  2-11 U5E08580
                          MDX   2 1         DECRE CHAR PER WD CNT  2-11 U5E08590
                          MDX     SU820+1   CONT IF WD NOT FULL    2-11 U5E08600
                    *                                                   U5E08610
                          SRA     8         OTHERWISE, SHIFT JUST  2-11 U5E08620
                          OR      SU983     *CNVTD WD TO RT,OR IN  2-11 U5E08630
                          STO  I  SU984     *1ST HALF,STO TO PRINT 2-11 U5E08640
                          MDX  L  SU984,1   INCRE PRINT AREA ADDR  2-11 U5E08650
                          SRA     16        SET TEMP STORE AREA    2-11 U5E08660
                          STO     SU983     *TO ZERO               2-11 U5E08670
                    *                                                   U5E08680
                          MDX   1 1         DECRE OUTPUT WD CNT    2-11 U5E08690
                          MDX     SU820     IF TWO WORDS NOT OUTPUT2-11 U5E08700
                    *                       *CONTINUE CONVERSION   2-11 U5E08710
                    *                                              2-11 U5E08720
                    SU890 LDX  L1 *-*       *OTHERWISE, RESTORE    2-11 U5E08730
                          LDX  L2 *-*       *REGISTERS             2-11 U5E08740
                          BSC  I  SU800     *AND RETURN TO CONTINUE2-11 U5E08750
                    *                                              2-11 U5E08754
                    *     CONSTANTS AND WORKAREA                   2-11 U5E08755
                    *                                              2-11 U5E08760
                    SU980 DC      /0009     CONVERSION CONSTANTS   2-11 U5E08770
                    SU981 DC      /0039     *                      2-11 U5E08780
                    SU982 DC      /00C0     *                      2-11 U5E08790
                    SU983 DC      *-*       TEMP STOR FOR CNVT CHAR2-11 U5E08800
                    SU984 DC      *-*       PRINT AREA ADDRESS     2-11 U5E08810
                          HDNG    SYSUP - UPDATE SYSTEM DCOM            U5E08820
                    *                                                   U5E08830
                    *     RESTORE THE PAGE AND PRINT THE HEADING        U5E08840
                    *                                                   U5E08850
                    RSTOR DC      *-*       ENTRY/RETURN ADDRESS        U5E08860
                          LD      RST91     STORE HEADING SECTOR ADDR   U5E08870
                          STO     RST94+1   *TO HEADING I/O AREA        U5E08880
                          LD      RST92     FETCH ADDRESS OF I/O AREA   U5E08890
                          SRT     16        SHIFT TO EXT, ACC = 0       U5E08900
                          BSI  L  DZ000     BRANCH TO DISK READ         U5E08910
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  U5E08920
                          MDX     *-3       BR TO TEST READ COMPLETE    U5E08930
                    *                                                   U5E08940
                          LD      RST94     STORE HEADING WORD COUNT    U5E08950
                          STO     RST94+1   *TO HEADING I/O AREA        U5E08960
                          LD      RST93     FETCH ADDRESS OF I/O AREA   U5E08970
                          SRT     16        SHIFT TO EXTENSION          U5E08980
                          LD      RST90     FETCH RESTORE PAGE CODE     U5E08990
                          BSI  I  PRINT     BRANCH TO RESTORE PAGE      U5E09000
                          BSI  I  PRINT     BRANCH TO PRINT HEADING     U5E09010
                          LD      RST90+1   FETCH SPACE ONE LINE CODE   U5E09020
                          BSI  I  PRINT     BRANCH TO SPACE ONE LINE    U5E09030
                          BSC  I  RSTOR     RETURN                      U5E09040
                    *                                                   U5E09050
                    *     CONSTANTS AND WORK AREA                       U5E09060
                    *                                                   U5E09070
                    RST90 DC      /7000     RESTORE PAGE FUNCTION CODE  U5E09080
                          DC      /7002     SPACE ONE LINE FUNC CODE    U5E09090
                    RST91 DC      #HDNG     SCTR ADDR OF HEADING BUFFER U5E09100
                    RST92 DC      RST94     ADDRESS OF DISK I/O AREA    U5E09110
                    RST93 DC      RST94+1   ADDRESS OF PRINT AREA       U5E09120
                          BSS  E  0                                     U5E09130
                    RST94 DC      10        WORD COUNT                  U5E09140
                          DC      *-*       SECTOR ADDRESS/WORD COUNT   U5E09150
                    RST96 BSS     10        HEADING I/O AREA            U5E09160
                    *                                                   U5E09170
                    *     DCOM I/O AREAS                                U5E09180
                    *                                                   U5E09190
                          DC      DSIZE     SYSTEM DCOM WORD COUNT  2-3 U5E09200
                          DC      #DCOM     SYSTEM DCOM SECTOR ADDR 2-3 U5E09210
                    DCOM  BSS     DSIZE     SYSTEM DCOM I/O AREA    2-3 U5E09220
                          DC      DSIZE     NON-SYS DCOM WORD COUNT 2-3 U5E09230
                          DC      *-*       NON-SYS DCOM SCTR ADDR  2-3 U5E09240
                    DCOMX BSS     DSIZE     NON-SYSTEM DCOM I/O AREA2-3 U5E09250
                          BSS     320-2*DSIZE-2  COMPLET A DSK BFR  2-3 U5E09255
                    #SYSC EQU     DCOM+8                                U5E09260
                    #ACIN EQU     DCOM+28   AVAIL CARTRIDGE INDICATOR   U5E09270
                    #ANDU EQU     DCOM+35                               U5E09280
                    #BNDU EQU     DCOM+40                               U5E09290
                    #FPAD EQU     DCOM+45                               U5E09300
                    #PCID EQU     DCOM+50                               U5E09310
                    #CIDN EQU     DCOM+55                               U5E09320
                    #CIBA EQU     DCOM+60                               U5E09330
                    #SCRA EQU     DCOM+65                               U5E09340
                    #FMAT EQU     DCOM+70                               U5E09350
                    #FLET EQU     DCOM+75                               U5E09360
                    #ULET EQU     DCOM+80                               U5E09370
                    #WSCT EQU     DCOM+85                               U5E09380
                    #CSHN EQU     DCOM+90                               U5E09390
                    *                                                   U5E09400
                    *                                                   U5E09410
                          BSS               PATCH AREA              2-2 U5E09430
                    *                                                   U5E09440
                          END                                           U5E09450
