                          HDNG    SYSTEM CORE DUMP                      N0200010
                    *************************************************** N0200020
                    *                                                 * N0200030
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * N0200040
                    *                                                 * N0200050
                    *FUNCTION/OPERATION-                              * N0200060
                    *    *DUMP CORE BETWEEN LIMITS OR IN ITS ENTIRITY * N0200070
                    *     TO THE PRINCIPAL PRINT DEVICE.              * N0200080
                    *                                                 * N0200090
                    *    *RESTORE CORE FROM THE CIB AND RETURN TO THE * N0200100
                    *     CALLING PROGRAM.                            * N0200110
                    *                                                 * N0200120
                    *ENTRY POINTS-                                    * N0200130
                    *    SD000  ENTERED VIA THE RESIDENT MONITOR BY A * N0200140
                    *           CALL $DUMP.                           * N0200150
                    *                                                 * N0200160
                    *INPUT-                                           * N0200170
                    *    ARGUMENTS MAY BE PROVIDED AS FOLLOWS         * N0200180
                    *     BSI  L  DUMP                                * N0200190
                    *     DC      FORMAT CODE                         * N0200200
                    *     DC      LOWER LIMIT                         * N0200210
                    *     DC      UPPER LIMIT                         * N0200220
                    *                                                 * N0200230
                    *OUTPUT-                                          * N0200240
                    *    THE FOLLOWING ARE PRINTED VIA THE PRINCIPAL  * N0200250
                    *    PRINT DEVICE                                 * N0200260
                    *    *THE CONTENTS OF THE ACCUMULATOR, EXTENSION, * N0200270
                    *     INDEX REGISTERS 1, 2 AND 3, CARRY AND       * N0200280
                    *     OVERFLOW.                                   * N0200290
                    *                                                 * N0200300
                    *    *ENTIRE CONTENTS OF CORE OR THE CONTENTS OF  * N0200310
                    *     CORE BETWEEN GIVEN LIMITS.                  * N0200320
                    *                                                 * N0200330
                    *EXTERNAL SUBROUTINES-                            * N0200340
                    *    DSKIO  DISK SUBROUTINE CURRENTLY IN CORE     * N0200350
                    *           (DISKZ, DISK1, DISKN) USED TO PERFORM * N0200360
                    *           DISK I/O.                             * N0200370
                    *                                                 * N0200380
                    *EXTERNAL REFERENCES-   (ALL IN COMMA)            * N0200390
                    *    $ACEX                                        * N0200400
                    *    $CH12                                        * N0200410
                    *    $CIBA                                        * N0200420
                    *    $CILA                                        * N0200430
                    *    $CORE                                        * N0200440
                    *    $DBSY                                        * N0200450
                    *    $DUMP                                        * N0200460
                    *    $EXIT                                        * N0200470
                    *    $HASH                                        * N0200480
                    *    $IBY4                                        * N0200490
                    *    $IREQ                                     2-6* N0200492
                    *    $LEV1                                     2-8* N0200493
                    *    $LEV2                                     2-6* N0200494
                    *    $LEV4                                     2-6* N0200496
                    *    $LEV5                                     2-9* N0200498
                    *    $PBSY                                        * N0200500
                    *    $PGCT                                        * N0200510
                    *    $PHSE                                        * N0200520
                    *    $SSTS                                     2-6* N0200525
                    *                                                 * N0200530
                    *EXITS- NORMAL                                    * N0200540
                    *    *WHEN A RETURN ADDRESS HAS BEEN PLACED IN    * N0200550
                    *     $DUMP CORE IS RESTORED FROM THE CIB AND A   * N0200560
                    *     TRANSFER IS MADE TO THE CALLING PROGRAM.    * N0200570
                    *                                                 * N0200580
                    *    *WHEN NO RETURN ADDRESS HAS BEEN PROVIDED A  * N0200590
                    *     TRANSFER IS MADE TO EXIT.                   * N0200600
                    *                                                 * N0200610
                    *EXITS- ERROR   NONE                              * N0200620
                    *                                                 * N0200630
                    *TABLES/WORK AREA-                                * N0200640
                    *    *CORE LOCATIONS 2560 - 4095 ARE USED AS A    * N0200650
                    *     BUFFER INTO WHICH THE CIB IS READ AND FROM  * N0200660
                    *     WHICH IT IS PRINTED.  THIS OPERATION IS     * N0200670
                    *     PERFORMED IN THREE BLOCKS.                  * N0200680
                    *                                                 * N0200690
                    *    *THE $HASH AREA IN COMMA IS STORED WITH THE  * N0200700
                    *     LAST 15 WORDS OF THE DUMP IN ORDER TO       * N0200710
                    *     COMPLETE THE DUMP AS CORE IS BEING RESTORED.* N0200720
                    *                                                 * N0200730
                    *ATTRIBUTES- NONE                                 * N0200740
                    *                                                 * N0200750
                    *NOTES- NONE                                      * N0200760
                    *                                                 * N0200770
                    *************************************************** N0200780
                          HDNG    SYSTEM CORE DUMP                      N0200790
                          ABS                                           N0200800
                          ORG     /0506                                 N0200810
                    *                                                   N0200820
                    *     PROVIDE PARAMETERS FOR THE SYSTEM LOADER      N0200830
                    *                                                   N0200840
                          DC      SDEND-*        SYSTEM DUMP WORD COUNT N0200850
                          DC      -115           SYSTEM DUMP PHASE ID   N0200860
                          DC      PSLET-*+1      PRINT SUBROUTINE SLET  N0200870
                          DC      1                                     N0200880
                          ORG     *-2                                   N0200890
                    *                                                   N0200900
                    *     EXTERNAL EQUATE STATEMENTS                    N0200910
                    *                                                   N0200920
                    $ACEX EQU     /001A                                 N0200930
                    $CH12 EQU     /0006                                 N0200940
                    $CIBA EQU     /0005                                 N0200950
                    $CILA EQU     /005A                                 N0200960
                    $CORE EQU     /000E                                 N0200970
                    $DBSY EQU     /00EE                                 N0200980
                    $DUMP EQU     /003F                                 N0200990
                    $EXIT EQU     /0038                                 N0201000
                    $HASH EQU     /0014                                 N0201010
                    $IBT4 EQU     /00D4                                 N0201020
                    $IREQ EQU     /002C                             2-6 N0201022
                    $LEV1 EQU     /0009                             2-8 N0201023
                    $LEV2 EQU     /000A                             2-6 N0201024
                    $LEV3 EQU     /000B                            2-11 N0201025
                    $LEV4 EQU     /000C                             2-6 N0201026
                    $LEV5 EQU     /000D                             2-9 N0201028
                    $PBSY EQU     /0036                                 N0201030
                    $PGCT EQU     /0037                                 N0201040
                    $PHSE EQU     /0078                                 N0201050
                    $SSTS EQU     /006D                             2-7 N0201055
                    #HDNG EQU     /0007                                 N0201060
                    @SCTR EQU     /0140                             2-4 N0201065
                    *                                                   N0201070
                    DSKIO EQU     /00F2                                 N0201080
                    PRINT EQU     /03C9                                 N0201090
                          HDNG    SYSTEM CORE DUMP                      N0201100
                    SD000 NOP               PERMIT BSC AND BSI ENTRY    N0201110
                          LDD  L  $ACEX     FETCH ACC AND EXT           N0201120
                          STD  L  SD350     SAVE ACC AND EXT            N0201130
                          STD  L  SD900     SAVE ACC AND EXT            N0201140
                    *                       SAVE NEW                2-6 N0201150
                          LD   L  $SSTS     *STATUS                 2-6 N0201156
                          STO  L  SD055     *FROM                   2-6 N0201158
                          STO  L  SD340     *RESIDENT MONITOR       2-6 N0201160
                          STX  L1 SD900+2   SAVE XR1                    N0201170
                          STX  L2 SD900+3   SAVE XR2                    N0201180
                          STX  L3 SD900+4   SAVE XR3                    N0201190
                          LDX   1 115       STORE PHASE ID         2-11 N0201200
                          STX  L1 $PHSE     *OF DUMP IN COMMA           N0201210
                    *                                                   N0201220
                    *     FETCH THE PRINT SUBROUTINE FROM THE DISK      N0201230
                    *                                                   N0201240
                          LDX  I1 $CORE     CORE SIZE TO XR1            N0201250
                          MDX   1 -1        DECREMENT                   N0201260
                          NOP                                           N0201270
                          STX  L1 SD911     STORE AS HI CORE ADDRESS    N0201280
                    *                                                   N0201290
                          LDX  L2 PRINT     PRINT SUBR ENTRY TO XR2     N0201300
                          MDX   2 -3        DECREMENT ADDRESS BY 3      N0201310
                          STX   2 PSLET+1   STORE TO PRINT SUBR SLET    N0201320
                          LDD     PSLET+2   FETCH WORD COUNT/SCTR ADDR  N0201330
                          STD  I  PSLET+1   STORE TO PRINT SUBR AREA    N0201340
                          LD      PSLET+1   FETCH PRINT SUBR ADDRESS    N0201350
                          SRT     16        SHIFT TO EXT, ACC = 0       N0201360
                          BSI  L  DSKIO     BRANCH TO DISK READ         N0201370
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  N0201380
                          MDX     *-3       BR TO TEST READ COMPLETE    N0201390
                    *                                                   N0201400
                          LD      PSLET+1   FETCH NEW PRINT SUBR ADDR   N0201410
                          A    L  SD944+1   ADD SIX                     N0201420
                          STO  L  TABLE+4   STORE TO ILS04 BRANCH TABLE N0201430
                          STO  L  $LEV1     STORE TO LEVEL 1 BR ADDRESS N0201440
                          LDX  L1 TABLE-1   FETCH ADDR OF ILS04 BRANCH  N0201450
                          STX  L1 $IBT4     *TABLE AND STORE TO COMMA   N0201460
                          MDX     SD005                                 N0201470
                    *                                                   N0201480
                          BSS  E  0                                     N0201490
                    PSLET DC      153       PRINCIPAL PRINT SUBR ID     N0201500
                          DC      *-*       CORE ADDRESS                N0201510
                          DC      *-*       WORD COUNT                  N0201520
                          DC      *-*       SECTOR ADDRESS              N0201530
                    *                                                   N0201540
                    *     ILS04 BRANCH TABLE                            N0201550
                    *                                                   N0201560
                    TABLE BSS     3         RESERVED                    N0201570
                          DC      *-*       1231 OPT. MARK PAGE READER  N0201580
                          DC      *-*       1403 PRINTER                N0201590
                          DC      *-*       2501 CARD READER            N0201600
                          DC      *-*       1442 CARD READER/PUNCH      N0201610
                          DC      *-*       KEYBOARD/CONSOLE PRINTER    N0201620
                          DC      *-*       1134/1055 P/T READER/PUNCH  N0201630
                    *                                                   N0201640
                    *     SAVE FORMAT AND SET DUMP LIMITS               N0201650
                    *                                                   N0201660
                    SD005 MDX  L  $DUMP,0   SKIP IF NO RETURN ADDRESS   N0201670
                          MDX     SD015     BRANCH IF RETURN ADDR GIVEN N0201680
                          SLA     16        CLEAR ACCUMULATOR           N0201690
                          STO  L  SD901     SET FORMAT                  N0201700
                          STO  L  SD902     SET LOWER LIMIT = 0         N0201710
                    SD010 LD   L  SD911     FETCH HI CORE ADDRESS       N0201720
                          STO  L  SD903     SAVE UPPER LIMIT            N0201730
                          MDX     SD035     BRANCH TO CONTINUE          N0201740
                    *                                                   N0201750
                    SD015 LDX  I2 $DUMP     ADDR OF CALL DUMP+1 TO XR2  N0201760
                          MDX  L2 -4095     SUBTRACT 4095, SKIP IF Z,-  N0201770
                          MDX     SD030     BRANCH IF ADDRESS GT 4-K    N0201780
                    *                                                   N0201790
                          LDX  I1 $CIBA     SECTOR ADDR OF CIB TO XR1   N0201800
                          LDX  I2 $DUMP     ADDR OF CALL DUMP+1 TO XR2  N0201810
                          MDX   2 -5        ADJUST XR2                  N0201820
                    SD020 MDX  L2 -320      DECREMENT XR2, SKIP IF 0,-  N0201830
                          MDX     *+1       SKIP NEXT INSTRUCTION       N0201840
                          MDX     SD025     BRANCH TO READ CIB          N0201850
                          MDX   1 1         INCREMENT SECTOR ADDRESS    N0201860
                          MDX     SD020     BRANCH TO DECREMENT XR2     N0201870
                    *                                                   N0201880
                    SD025 STX  L1 2561      STORE XR1 TO BUFFER AREA    N0201890
                          LDX  L1 640       FETCH WORD COUNT TO XR1     N0201900
                          STX  L1 2560      STORE XR1 TO BUFFER AREA    N0201910
                          LD   L  SD942+1   FETCH ADDR OF BUFFER AREA   N0201920
                          SRT     16        SHIFT TO EXT, ACC = 0       N0201930
                          BSI  L  DSKIO     BRANCH TO DISK READ         N0201940
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  N0201950
                          MDX     *-3                                   N0201960
                          MDX  L2 320       SET XR2 POSITIVE            N0201970
                          NOP                                           N0201980
                          MDX  L2 2561      ADD ADDRESS OF BUFFER AREA  N0201990
                          MDX     *+2       SKIP NEXT INSTRUCTION       N0202000
                    *                                                   N0202010
                    SD030 LDX  I2 $DUMP     ADDR OF CALL DUMP+1 TO XR2  N0202020
                    *                                                   N0202030
                          LD   L2 0         FETCH FORMAT                N0202040
                          STO     SD901     SAVE FORMAT                 N0202050
                          LD   L2 1         FETCH LOWER LIMIT           N0202060
                          STO     SD902     SAVE LOWER LIMIT            N0202070
                          LD   L2 2         FETCH UPPER LIMIT           N0202080
                          BSC     +         SKIP IF LIMIT NOT ZERO      N0202090
                          MDX     SD010     BRANCH TO FETCH UPPER LIMIT N0202100
                          STO     SD903     SAVE UPPER LIMIT            N0202110
                    *                                                   N0202120
                    SD035 LD      SD902     FETCH LOWER LIMIT           N0202130
                          AND  L  SD911     SET LOWER LIMIT MODULO HI   N0202140
                          STO     SD902     *CORE ADDRESS AND SAVE      N0202150
                          LD      SD903     FETCH UPPER LIMIT           N0202160
                          AND     SD911     SET UPPER LIMIT MODULO HI   N0202170
                          STO     SD903     *CORE ADDRESS AND SAVE      N0202180
                          S       SD902     SUBTRACT LOWER LIMIT        N0202190
                          BSC  L  SD040,-   BR IF UP LIMIT GT LO LIMIT  N0202200
                          LD      SD903     FETCH UPPER LIMIT           N0202210
                          STO  L  SD912     SAVE ORIGINAL UPPER LIMIT   N0202220
                          STO     SD905+1   SET WRAP-AROUND SWITCH ON   N0202230
                          LD      SD911     FETCH HI CORE ADDRESS       N0202240
                          STO     SD903     SAVE AS NEW UPPER LIMIT     N0202250
                    *                                                   N0202260
                    *     RESTORE PAGE AND PRINT DATE AND PAGE NUMBER   N0202270
                    *                                                   N0202280
                    SD040 LD   L  SD915     FETCH HEADING SECTOR ADDR   N0202290
                          STO  L  SD920-1   STORE TO I/O AREA           N0202300
                          LD   L  SD919     FETCH I/O AREA ADDRESS      N0202310
                          SRT     16        SHIFT TO EXT, ACC = 0       N0202320
                          BSI  L  DSKIO     BRANCH TO DISK READ         N0202330
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  N0202340
                          MDX     *-3       BR TO TEST READ COMPLETE    N0202350
                          LD   L  SD920-2   STORE WORD COUNT            N0202360
                          STO  L  SD920-1   *TO PRINT AREA              N0202370
                          LD   L  SD918     FETCH PRINT AREA ADDRESS    N0202380
                          SRT     16        SHIFT TO EXTENSION          N0202390
                          LD      SD904     FETCH PAGE RESTORE CODE     N0202400
                          BSI  L  PRINT     BRANCH TO RESTORE PAGE      N0202410
                          BSI  L  PRINT     BRANCH TO PRINT PAGE NUMBER N0202420
                          LD      SD904+2   FETCH SPACE CODE            N0202430
                          BSI  L  PRINT     BRANCH TO SPACE ONE LINE    N0202440
                          BSI     SD060     BRANCH TO CLEAR PRINT AREA  N0202450
                          MDX  L  SD905+2,0 SKIP IF FIRST PAGE SW ON    N0202460
                          MDX     SD070     BRANCH TO PRINT HEADING     N0202470
                    *                                                   N0202480
                    *     PRINT CONTENTS OF ACCUMULATOR, EXTENSION,     N0202490
                    *     XR1, XR2, XR3, OVERFLOW AND CARRY             N0202500
                    *                                                   N0202510
                          LDX   2 -5                                    N0202520
                    SD050 SLA     16                                    N0202530
                          STO     SD905     CLEAR LEFT-RIGHT SWITCH     N0202540
                          LD   L2 SD906+5   FETCH PRINT ADDRESS         N0202550
                          STO  L  SD933     STORE TO CONVERT SUBROUTINE N0202560
                          LD   L2 SD900+5   FETCH WORD TO CONVERT       N0202570
                          BSI  L  SD150     BR TO CONVERT SUBROUTINE    N0202580
                          MDX   2 1         INCREMENT XR2, SKIP IF ZERO N0202590
                          MDX     SD050     BR TO CONTINUE CONVERTING   N0202600
                    SD055 LDS     *-*       FETCH STATUS                N0202610
                          LDD     SD908     EBC "OFF"                   N0202620
                          BSC     O         SKIP IF OVERFLOW OFF        N0202630
                          LDD     SD910     EBC "ON"                    N0202640
                          STD  L  SD924+44  STORE TO PRINT AREA         N0202650
                          LDD     SD908     EBC "OFF"                   N0202660
                          BSC     C         SKIP IF CARRY OFF           N0202670
                          LDD     SD910     EBC "ON"                    N0202680
                          STD  L  SD924+52  STORE TO PRINT AREA         N0202690
                          LD   L  SD922     FETCH PRINT AREA ADDRESS    N0202700
                          SRT     16        SHIFT TO EXTENSION          N0202710
                          LD      SD904+1   FETCH PRINT CODE            N0202720
                          BSI  L  PRINT     PRINT FIRST LINE OF DUMP    N0202730
                          LD      SD904+2   FETCH SPACE CODE            N0202740
                          BSI  L  PRINT     BRANCH TO SPACE ONE LINE    N0202750
                          MDX     SD070     BRANCH TO PRINT HEADING     N0202760
                    *                                                   N0202770
                    *     CLEAR PRINT BUFFER                            N0202780
                    *                                                   N0202790
                    SD060 DC      *-*       RETURN ADDRESS              N0202800
                          LDX   2 -60       WORD COUNT TO XR2           N0202810
                          SLA     16        CLEAR ACCUMULATOR           N0202820
                    SD065 STO  L2 SD920+60  STORE TO PRINT AREA         N0202830
                          MDX   2 1         ADD 1 TO XR2, SKIP IF ZERO  N0202840
                          MDX     SD065     BRANCH THRU LOOP AGAIN      N0202850
                          BSC  I  SD060     RETURN                      N0202860
                    *                                                   N0202870
                    *     PRINT HEADING AND SPACE                       N0202880
                    *                                                   N0202890
                    SD070 LD   L  SD926     FETCH PRINT AREA ADDRESS    N0202900
                          SRT     16        SHIFT TO EXTENSION          N0202910
                          LD      SD904+1   FETCH PRINT CODE            N0202920
                          BSI  L  PRINT     BRANCH TO PRINT HEADING     N0202930
                          LD      SD904+2   FETCH SPACE CODE            N0202940
                          BSI  L  PRINT     BRANCH TO SPACE ONE LINE    N0202950
                          MDX  L  SD905+2,0 SKIP IF FIRST PAGE SW ON    N0202960
                          MDX     SD080     BRANCH TO CONTINUE DUMP     N0202970
                          BSC  L  SD200     BRANCH TO FETCH CIB         N0203000
                    *                                                   N0203010
                          BES  E  0                                     N0203020
                    SD900 DEC     0.0       TEMPORARY FOR ACC AND EXT   N0203030
                          DC      *-*       TEMPORARY XR1               N0203040
                          DC      *-*       TEMPORARY XR2               N0203050
                          DC      *-*       TEMPORARY XR3               N0203060
                    SD901 DC      *-*       FORMAT                      N0203070
                    SD902 DC      *-*       LOWER LIMIT                 N0203080
                    SD903 DC      *-*       UPPER LIMIT                 N0203090
                    SD904 DC      /7000     RESTORE PAGE CODE           N0203100
                          DC      /7001     PRINT ONE LINE CODE         N0203110
                          DC      /7002     SPACE ONE LINE CODE         N0203120
                    SD905 DC      *-*       LEFT-RIGHT SWITCH           N0203130
                          DC      *-*       WRAP-AROUND DUMP SWITCH     N0203140
                          DC      *-*       FIRST PAGE SWITCH           N0203150
                          DC      *-*       ONE LINE SPACED SWITCH      N0203170
                    SD906 DC      SD924+6   ACCUMULATOR PRINT ADDRESS   N0203180
                          DC      SD924+16  EXTENSION PRINT ADDRESS     N0203190
                          DC      SD924+22  XR1 PRINT ADDRESS           N0203200
                          DC      SD924+28  XR2 PRINT ADDRESS           N0203210
                          DC      SD924+34  XR3 PRINT ADDRESS           N0203220
                    SD907 DC      *-*       ADDRESS TO PRINT FROM       N0203230
                          BSS  E  0                                 2-5 N0203235
                    SD908 EBC     .OFF .                                N0203240
                    SD910 EBC     .ON  .                                N0203250
                    SD911 DC      *-*       HIGHEST CORE ADDRESS        N0203260
                    *                                                   N0203270
                    *     CONVERT AND DUMP SIXTEEN WORDS                N0203280
                    *                                                   N0203290
                    SD080 LD   L  $PBSY     FETCH PRINT BUSY INDICATOR  N0203300
                          BSC  L  SD080,Z-  BRANCH IF PRINTER BUSY      N0203310
                          LD   I  $CH12     FETCH CHANNEL 12 INDICATOR  N0203320
                          BSC  L  SD040,Z   BR TO RESTORE PAGE IF SW ON N0203330
                    *                                                   N0203340
                          LD      SD907     FETCH PRINT AREA ADDR   2-4 N0203350
                          A    L  SD944+3   ADD SIXTEEN             2-4 N0203360
                          STO     SD090+2   STORE ADDRESS           2-4 N0203370
                          STO     SD100+2   STORE ADDRESS           2-4 N0203380
                          STO     SD110+1   STORE ADDRESS           2-4 N0203390
                          MDX  L  SD905+2,0 TEST FOR AND            2-4 N0203400
                          MDX     SD090     *BR IF NOT FIRST LINE   2-4 N0203410
                          STX     SD905+2   SET PAGE/LINE INDR OFF  2-4 N0203420
                          MDX     SD100     BRANCH TO STORE LINE    2-4 N0203430
                    *                                               2-4 N0203440
                    SD090 LDX   1 -16       XR1 = LINE WORD COUNT   2-4 N0203450
                          LD   L1 *-*       FETCH A WORD            2-4 N0203460
                          S    L1 SD929+16  TEST FOR AND BR IF NOT  2-4 N0203470
                          BSC  L  SD100,Z   *SAME A LAST LINE WORD  2-4 N0203480
                          MDX   1 1         INCR WD CNT, SK IF ZERO 2-4 N0203490
                          MDX     SD090+1   BR TO TEST NEXT WORD    2-4 N0203500
                    *                                               2-4 N0203510
                          MDX  L  SD905+3,0 TEST FOR AND BRANCH     2-4 N0203520
                          MDX     SD115     *IF ALREADY SPACED      2-4 N0203530
                          STX     SD905+3   SET SPACED INDR ON      2-4 N0203540
                          LD      SD904+2   FETCH SPACE FUNC CODE   2-4 N0203550
                          BSI  L  PRINT     BR TO SPACE A LINE      2-4 N0203560
                          MDX     SD115     BR TO FETCH NEXT LINE   2-4 N0203570
                    *                                               2-4 N0203580
                    SD100 LDX   1 -16       XR1 = LINE WORD COUNT   2-4 N0203590
                          LD   L1 *-*       FETCH A WORD            2-4 N0203600
                          STO  L1 SD929+16  *AND SAVE               2-4 N0203610
                          MDX   1 1         INCR WD CNT, SK IF ZERO 2-4 N0203620
                          MDX     SD100+1   BR TO STORE NEXT WORD   2-4 N0203630
                    *                                               2-4 N0203640
                          SLA     16        SET                     2-4 N0203650
                          STO     SD905+3   *SPACED INDICATOR OFF   2-4 N0203660
                    * 1 STATEMENT REMOVED 2-12                        * N0203670
                    *                                                   N0203680
                    SD105 BSI     SD060     BR TO CLEAR PRINT BUFFER    N0203690
                          LD      SD913     FETCH ADDR OF PRINT BUFFER  N0203700
                          STO  L  SD933     STORE TO CONVERT SUBROUTINE N0203710
                          STO     SD970     SET SWITCHES EACH TIME  212 N0203712
                          STO     SD971     *AN ADDRESS IN CORE     212 N0203714
                          SLA     16        *IS BEING               212 N0203716
                          STO     SD972     * CONVERTED             212 N0203718
                          LD      SD902     FETCH LOWER DUMP ADDRESS    N0203720
                          BSI  L  SD150     BR TO CONVERT SUBROUTINE    N0203730
                          LD      SD957     RE-ESTABLISH            212 N0203740
                          STO     SD947     *TRANSLATION ADDRESS    212 N0203745
                          LD      SD955     LOAD AN ASTERISK (/005C)212 N0203746
                          STO  I  SD947     STORE AS TERMINATOR     212 N0203747
                          MDX  L  SD947,1   INCREMENT BUFFER        212 N0203748
                    *                       *POINTER TO NEXT WORD   212 N0203749
                          LDX   1 -16       WORD COUNT TO XR1           N0203750
                          LDX   2 -4        SET DOUBLE SPACE COUNT      N0203760
                    SD110 LD   L1 *-*       FETCH A WORD                N0203770
                          BSI  L  SD150     BR TO CONVERT SUBROUTINE    N0203780
                          MDX   1 1         INCREMENT XR1, SKIP IF ZERO N0203790
                          MDX     SD110     FETCH ANOTHER WORD      212 N0203800
                          LD      SD955     LOAD ASTERISK (/005C)   212 N0203802
                          SLA     8         LEFT JUSTIFY            212 N0203805
                          STO  I  SD947     PLACE AS TRANSLATION    212 N0203806
                    *                       *TERMINATOR             212 N0203808
                          LD   L  SD918     FETCH PRINT AREA ADDRESS    N0203810
                          SRT     16        SHIFT TO EXTENSION          N0203820
                          LD      SD904+1   FETCH PRINT CODE            N0203830
                          BSI  L  PRINT     PRINT A LINE OF DUMP        N0203840
                    *                                                   N0203850
                    SD115 MDX  L  SD902,16  INCREMENT LOWER LIMIT BY 16 N0203860
                          MDX     *+1       SKIP IF LIMIT NOT ZERO      N0203870
                          MDX     SD140     BRANCH IF LIMIT = 0         N0203880
                          MDX  L  SD907,16  INCREMENT PRINT AREA ADDR   N0203890
                          MDX     *+1       SKIP IF ADDRESS NOT ZERO    N0203900
                          MDX     SD140     BRANCH IF ADDRESS = 0       N0203910
                          LD      SD902     FETCH LOWER LIMIT           N0203920
                          S       SD903     SUBTRACT UPPER LIMIT        N0203930
                          BSC  L  SD140,-Z  BRANCH IF DUMP COMPLETED2-3 N0203940
                    *                                                   N0203950
                    *     TEST FOR END OF DUMP BUFFER                   N0203960
                    *                                                   N0203970
                          LD      SD902     FETCH LOWER LIMIT           N0203980
                          S    L  SD948     SUBTRACT BUFFER LIMIT       N0203990
                          BSC  L  SD080,Z+  BRANCH TO CONTINUE DUMPING  N0204000
                          BSC  L  *-*       BRANCH TO FETCH NEW BUFFER  N0204010
                    SD120 EQU     *-1       BRANCH ADDRESS              N0204020
                    *                                                   N0204030
                    * 4 STATEMENTS REMOVED 2-12                       * N0204040
                    *                                                   N0204080
                    *     TEST FOR WRAP-AROUND DUMP                     N0204090
                    *                                                   N0204100
                    SD140 LD      SD905+1   FETCH WRAP-AROUND DUMP SW   N0204110
                          BSC  L  SD300,+-  BRANCH IF SWITCH OFF        N0204120
                          SLA     16        CLEAR ACCUMULATOR           N0204130
                          STO     SD902     SET LOWER LIMIT TO ZERO     N0204140
                          STO     SD905+1   SET WRAP-AROUND DUMP SW OFF N0204150
                          LD      SD912     FETCH ORIGINAL UPPER LIMIT  N0204160
                          STO     SD903     STORE AS NEW UPPER LIMIT    N0204170
                          BSC  L  SD200     BRANCH TO FETCH CIB         N0204180
                    *                                                   N0204190
                    *     CONSTANTS AND WORK AREA                       N0204200
                    *                                                   N0204210
                    SD954 DC      /0040     SPACE FOR TRANSLATION   212 N0204211
                    SD955 DC      /005C     TRANSLATION TERMINATOR  212 N0204212
                    SD947 DC      SD920+42  TRANSLATION ADDRESSTOR  212 N0204214
                    SD957 DC      SD920+42  TRANSLATION ADDRESSTOR  212 N0204215
                    SD958 DC      /FF00     FOR EXCLUSIVE OR'ING    212 N0204216
                    SD970 DC      0         SWITCHES USED FOR       212 N0204217
                    SD971 DC      0         *SHIFTING INFORMATION   212 N0204218
                    SD972 DC      0         * IN THE PRINT BUFFER   212 N0204219
                          BSS  E  0                                     N0204220
                    SD912 DC      *-*       ORIGINAL UPPER LIMIT        N0204230
                    SD913 DC      SD920     ADDRESS OF PRINT BUFFER     N0204240
                    SD914 DC      *-*       WORD OF LAST ABNORMAL LINE  N0204250
                    SD915 DC      #HDNG     SCTR ADDR OF HEADING SECTOR N0204260
                    SD918 DC      SD920-1   ADDRESS OF PRINT AREA       N0204270
                    SD919 DC      SD920-2   ADDRESS OF DISK I/O AREA    N0204280
                          DC      60        WORD COUNT                  N0204290
                          DC      *-*       WORD COUNT/SECTOR ADDRESS   N0204300
                    SD920 BSS     60        I/O AREA                    N0204310
                    SD922 DC      SD924-1                               N0204320
                          DC      SD926-SD924                           N0204330
                    SD924 EBC     .ACCUMULATOR           EXTENSION    . N0204340
                          EBC     .    XR1         XR2         XR3    . N0204350
                          EBC     .       OVERFLOW           CARRY    . N0204360
                          EBC     .            .                        N0204370
                    SD926 DC      SD928-1                               N0204380
                          DC      SD929-SD928                       2-4 N0204390
                    SD928 EBC     .ADDR ***0 ***1 ***2 ***3 ***4 .  212 N0204400
                          EBC     .***5 ***6 ***7 ***8 ***9 ***A .  212 N0204410
                          EBC     .***B ***C ***D ***E ***F      .  212 N0204420
                          EBC     .                              .  212 N0204430
                    SD929 BSS     16        SAVE AREA FOR LAST LINE 2-4 N0204435
                    *                                                   N0204440
                    *     CONVERT BINARY WORD TO EBCDIC AND PACK        N0204450
                    *                                                   N0204460
                    SD150 DC      *-*       RETURN ADDRESS              N0204470
                          MDX  L  SD901,0   SKIP IF FORMAT = 0          N0204480
                          MDX     SD190     BR IF NOT HEXEDECIMAL FMT   N0204490
                          STX   1 SD180+1   SAVE XR1                    N0204500
                          STO  L  TEMP1     SAVE FOR TRANSLATION    212 N0204502
                          LDX   1 -2        SET CHARACTER COUNT         N0204510
                          RTE     16        SHIFT TO EXTENSION          N0204520
                          SLA     16        CLEAR ACCUMULATOR           N0204530
                          STD  L  SD980     SAVE FOR RETURN         212 N0204536
                    SD160 SLT     4         ONE CHARACTER INTO ACC      N0204540
                          S       SD930     SUBTRACT NINE               N0204550
                          BSC     +         SKIP IF ACC POSITIVE        N0204560
                          A       SD931     ADD HEXADECIMAL 39          N0204570
                          A       SD932     ADD HEXADECIMAL C0          N0204580
                          MDX  L  SD905,0   SKIP IF LEFT-RIGHT SW ON    N0204590
                          MDX     SD170     BR IF NO SHIFT REQUIRED     N0204600
                          SLA     8         SHIFT TO LEFT HALF          N0204610
                          STO     SD934     STORE TEMPORARLY            N0204620
                          STX  L1 SD905     TURN LEFT-RIGHT SW ON       N0204630
                          SLA     4         CLEAR ACCUMULATOR           N0204640
                          MDX     SD160     PICK UP NEXT CHARACTER      N0204650
                    SD170 OR      SD934     "OR" IN TEMPORARY STORAGE   N0204660
                          MDX  L  SD970,0   SWITCH 1 SET?           212 N0204661
                          MDX     SD173     YES, SEE IF SWITCH 3 ON 212 N0204662
                          MDX  L  SD971,0   SWITCH 2 SET?           212 N0204663
                          MDX     SD171     YES, GO STORE WORD      212 N0204664
                          SRT     16        NO, SHIFT TO EXTENSION  212 N0204665
                          LD   L  SD954     LOAD BLANK              212 N0204666
                          SLT     8         BLANK PLUS FIRST CHAR   212 N0204667
                          BSI     SD177     GO STORE WORD           212 N0204668
                          SLT     8         LEFT JUSTIFY OTHER      212 N0204669
                          SLA     8         *CHARACTER              212 N0204670
                          STO  L  SD971     SET SWITCH 2 ON         212 N0204671
                          MDX     SD175     CONTINUE                212 N0204672
                    SD171 SRT     8         ISOLATE FIRST CHARACTER 212 N0204673
                          EOR  L  SD958     ZERO LEFTMOST 8 BITS    212 N0204674
                          OR   L  SD971     OR WITH CHARACTER SAVED 212 N0204675
                          BSI     SD177     STORE WORD AND UPDATE   212 N0204676
                    *                       *BUFFER POINTER         212 N0204677
                          SLT     8         ISOLATE SECOND          212 N0204678
                          SLA     8         *CHARACTER AND          212 N0204679
                          OR   L  SD954     OR WITH BLANK           212 N0204680
                          STO  L  SD970     SET SWITCH 1 ON         212 N0204681
                          BSI     SD177     STORE WORD              212 N0204682
                    SD172 SLA     16        ZERO ACCUMULATOR        212 N0204690
                          STO  L  SD971     SET SWITCH 2 TO 0       212 N0204693
                          MDX     SD175     CONTINUE                212 N0204694
                    SD173 BSI     SD177     GO STORE WORD           212 N0204695
                          MDX  L  SD972,0   SWITCH 3 ON?            212 N0204696
                          MDX     SD174     YES, SET SWITCH 3       212 N0204697
                          STX  L  SD972     SET SWITCH 3 ON         212 N0204698
                          MDX     SD172     CONTINUE                212 N0204699
                    SD174 SLA     16        ZERO ACCUMULATOR        212 N0204700
                          STO  L  SD970     * SWITCH 1 AND          212 N0204701
                          STO  L  SD972     * SWITCH 3              212 N0204702
                    SD175 LDD  L  SD980     RELOAD WORD             212 N0204703
                          SLT     8         SHIFT OUT 1ST CHARACTER 212 N0204704
                          SLA     16        ZERO ACC                212 N0204705
                          STO  L  SD905     RESET LEFT-RIGHT SWITCH 212 N0204706
                          MDX   1 1         SKIP IF WORD COMPLETED      N0204710
                          MDX     SD160     PICK UP NEXT CHARACTER      N0204720
                    * 1 STATEMENT REMOVED 2-12                        * N0204730
                    SD180 LDX  L1 *-*       RESTORE XR1                 N0204740
                          BSI  L  SD410     GO DO TRANSLATION       212 N0204745
                          BSC  I  SD150     RETURN                      N0204750
                    *                                                   N0204760
                    SD177 DC      *-*       ENTRY POINT             212 N0204762
                          STO  I  SD933     STORE WORD IN BUFFER.   212 N0204764
                          MDX  L  SD933,1   INCREMENT POINTER       212 N0204766
                          BSC  I  SD177     RETURN TO CALLER        212 N0204768
                    SD190 WAIT              ILLEGAL FORAMT              N0204770
                          SRA     16        SET FORMAT FOR              N0204780
                          STO  L  SD901     *HEXADECIMAL DUMP           N0204790
                          MDX     SD150+4   BR FOR HEXADECIMAL CONVERT  N0204800
                    *                                                   N0204810
                    SD930 DC      /0009                                 N0204820
                    SD931 DC      /0039                                 N0204830
                    SD932 DC      /00C0                                 N0204840
                    SD933 DC      *-*       PRINT AREA ADDRESS          N0204850
                    SD934 DC      *-*       TEMPORARY PACKED STORAGE    N0204860
                    *                                                   N0204870
                    *     SET LOWER LIMIT MODULO 16                     N0204880
                    *                                                   N0204890
                    SD200 LD   L  SD902     FETCH LOWER LIMIT           N0204900
                          SRA     4         DIVIDE BY 16                N0204910
                          SLA     4         MULTIPLY BY 16              N0204920
                          STO  L  SD902     STORE LOWER LIMIT MODULO 16 N0204930
                    *                                                   N0204940
                          S    L  SD942     SUBTRACT 1285               N0204950
                          BSC  L  SD220,-   BR IF LOWER LIMIT GT 1285   N0204960
                    *                                                   N0204970
                    *     READ WORDS 6 - 1285 FROM THE CORE IMAGE       N0204980
                    *     BUFFER INTO THE DUMP BUFFER                   N0204990
                    *                                                   N0205000
                          LD   L  $CIBA     FETCH SECTOR ADDRESS OF CIB N0205010
                          SRT     16        SHIFT TO EXTENSION          N0205020
                          LD   L  SD940     FETCH WORD COUNT (4 SCTRS)  N0205030
                          STD  L  BUFFR+4   STORE TO INPUT BUFFER       N0205040
                          LD   L  SD942+2   FETCH INPUT BUFFER ADDRESS  N0205050
                          SRT     16        SHIFT TO EXT, ACC = 0       N0205060
                          BSI  L  DSKIO     BRANCH TO DISK READ         N0205070
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  N0205080
                          MDX     *-3       BR TO TEST READ COMPLETE    N0205090
                    *                                                   N0205100
                    *     STORE LOW SIX WORDS OF CORE TO DUMP BUFFER    N0205110
                    *                                                   N0205120
                          LDX   1 -6        SET WORD COUNT              N0205130
                    SD210 LD    1 0+6       FETCH A WORD                N0205140
                          STO  L1 BUFFR+6   STORE TO DUMP BUFFER        N0205150
                          MDX   1 1         INCREMENT XR1, SKIP IF ZERO N0205160
                          MDX     SD210     BRANCH TO FETCH NEXT WORD   N0205170
                          LD   L  SD942+1   FETCH ADDR OF DUMP BUFFR212 N0205180
                          A    L  SD902     ADD LOWER LIMIT             N0205190
                          STO  L  SD907     SAVE AS ADDR TO PRINT FROM  N0205200
                          LD      SD940     FETCH 1280                  N0205210
                          STO  L  SD948     SAVE AS CORE BUFFER LIMIT   N0205220
                          S    L  SD902                             2-7 N0205222
                          BSC  L  SD225,+                           2-7 N0205224
                          LDX  L1 SD225     ADDR OF NEXT SECTION TO XR1 N0205230
                          STX  L1 SD120     STORE TO BRANCH ADDRESS     N0205240
                          BSC  L  SD080     BRANCH TO PRINT THE BUFFER  N0205250
                    *                                                   N0205260
                    *     LOWER LIMIT GREATER THAN 1285                 N0205270
                    *                                                   N0205280
                    SD220 S       SD940     SUBTRACT 1280               N0205290
                          BSC  L  SD230,-   BR IF LOWER LIMIT GT 2565   N0205300
                    *                                                   N0205310
                    *     READ WORDS 1286 - 2565 FROM THE CORE IMAGE    N0205320
                    *     BUFFER INTO THE DUMP BUFFER                   N0205330
                    *                                                   N0205340
                    SD225 BSI     SD250     BRANCH TO SAVE LAST 6 WORDS N0205350
                          LD   L  $CIBA     FETCH SECTOR ADDRESS OF CIB N0205360
                          A    L  SD944     ADD FOUR                212 N0205370
                          SRT     16        SHIFT TO EXTENSION          N0205380
                          LD      SD940     FETCH WORD COUNT (4 SCTRS)  N0205390
                          STD  L  BUFFR+4   STORE TO INPUT BUFFER       N0205400
                          LD      SD942+2   FETCH INPUT BUFFER ADDRESS  N0205410
                          SRT     16        SHIFT TO EXT, ACC = 0       N0205420
                          BSI  L  DSKIO     BRANCH TO DISK READ         N0205430
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  N0205440
                          MDX     *-3       BR TO TEST READ COMPLETE    N0205450
                          BSI     SD270     BRANCH TO RESTORE 6 WORDS   N0205460
                    *                                                   N0205470
                          LD   L  SD902     FETCH LOWER LIMIT           N0205480
                          S       SD940     SUBTRACT 1280               N0205490
                          A       SD942+1   ADD ADDRESS OF DUMP BUFFER  N0205500
                          STO  L  SD907     SAVE AS ADDR TO PRINT FROM  N0205510
                          LD      SD942+1   FETCH 2560                  N0205520
                          STO     SD948     SAVE AS DUMP BUFFER LIMIT   N0205530
                          S    L  SD902                             2-7 N0205532
                          BSC  L  SD235,+                           2-7 N0205534
                          LDX  L1 SD235     ADDR OF NEXT SECTION TO XR1 N0205540
                          STX  L1 SD120     STORE TO BRANCH ADDRESS     N0205550
                          BSC  L  SD080     BRANCH TO PRINT THE BUFFER  N0205560
                    *                                                   N0205570
                    *     LOWER LIMIT GREATER THAN 2565                 N0205580
                    *                                                   N0205590
                    SD230 S       SD940+1   SUBTRACT 1530               N0205600
                          BSC  L  SD240,-   BR IF LOWER LIMIT GT 4095   N0205610
                    *                                                   N0205620
                    *     READ WORDS 2566 - 4095 FROM THE CORE IMAGE    N0205630
                    *     BUFFER INTO THE DUMP BUFFER                   N0205640
                    *                                                   N0205650
                    SD235 BSI     SD250     BRANCH TO SAVE LAST 6 WORDS N0205660
                          LD   L  $CIBA     FETCH SECTOR ADDRESS OF CIB N0205670
                          A    L  SD944+2   ADD EIGHT               212 N0205680
                          SRT     16        SHIFT TO EXTENSION          N0205690
                          LD      SD940+1   FETCH WORD COUNT (4+ SCTRS) N0205700
                          STD  L  BUFFR+4   STORE TO INPUT BUFFER       N0205710
                          LD      SD942+2   FETCH INPUT BUFFER ADDRESS  N0205720
                          SRT     16        SHIFT TO EXT, ACC = 0       N0205730
                          BSI  L  DSKIO     BRANCH TO DISK READ         N0205740
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  N0205750
                          MDX     *-3       BR TO TEST READ COMPLETE    N0205760
                          BSI     SD270     BRANCH TO RESTORE 6 WORDS   N0205770
                    *                                                   N0205780
                          LD   L  SD902     FETCH LOWER LIMIT           N0205790
                          STO  L  SD907     SAVE AS ADDR TO PRINT FROM  N0205800
                          LD      SD940+2   FETCH 4095                  N0205810
                          STO     SD948     SAVE AS DUMP BUFFER LIMIT   N0205820
                          LDX  L1 SD240     ADDR OF NEXT SECTION TO XR1 N0205830
                          STX  L1 SD120     STORE TO BRANCH ADDRESS     N0205840
                          BSC  L  SD080     BRANCH TO PRINT THE BUFFER  N0205850
                    *                                                   N0205860
                    *     LOWER DUMP LIMIT GREATER THAN 4095            N0205870
                    *                                                   N0205880
                    SD240 LD   L  SD911     FETCH HIGH CORE ADDRESS     N0205890
                          S       SD940+2   SUBTRACT 4095               N0205900
                          BSC  L  SD140,+   BRANCH IF CORE SIZE IS 4-K  N0205910
                          LD   L  SD902     FETCH LOWER LIMIT           N0205920
                          STO  L  SD907     SAVE AS ADDR TO PRINT FROM  N0205930
                          LD   L  SD911     FETCH HI CORE ADDRESS       N0205940
                          STO     SD948     SAVE AS CORE BUFFER LIMIT   N0205950
                          LDX  L1 SD140     ADDR OF NEXT SECTION TO XR1 N0205960
                          STX  L1 SD120     STORE TO BRANCH ADDRESS     N0205970
                          BSC  L  SD080     BRANCH TO PRINT THE BUFFER  N0205980
                    *                                                   N0205990
                    *     SAVE THE LAST SIX WORDS OF THE DUMP BUFFER    N0206000
                    *                                                   N0206010
                    SD250 DC      *-*       ENTRY/RETURN                N0206020
                          LDX   1 -6        SET WORD COUNT              N0206030
                    SD260 LD   L1 BUFFR+1286  FETCH ONE OF LAST 6 WORDS N0206040
                          STO  L1 SD946+6   SAVE IN TEMPORARY STORAGE   N0206050
                          MDX   1 1         INCREMENT XR1, SKIP IF ZERO N0206060
                          MDX     SD260     BRANCH TO FETCH NEXT WORD   N0206070
                          BSC  I  SD250     RETURN                      N0206080
                    *                                                   N0206090
                    *     STORE LAST SIX WORDS OF OLD BUFFER TO FIRST   N0206100
                    *     SIX POSITIONS OF NEW BUFFER                   N0206110
                    *                                                   N0206120
                    SD270 DC      *-*       ENTRY/RETURN                N0206130
                          LDX   1 -6        SET WORD COUNT              N0206140
                    SD280 LD   L1 SD946+6   FETCH WORD FROM TEMP STG    N0206150
                          STO  L1 BUFFR+6   STORE TO DUMP BUFFER        N0206160
                          MDX   1 1         INCREMENT XR1, SKIP IF ZERO N0206170
                          MDX     SD280     BRANCH TO FETCH NEXT WORD   N0206180
                          BSC  I  SD270     RETURN                      N0206190
                    *                                                   N0206200
                    PREDP EQU     3*320+6                               N0206210
                    SD940 DC      1280      WD CNT OF 4 SCTRS           N0206220
                          DC      1530      WD CNT OF 4 SCTRS + 250 WDS N0206230
                          DC      4095      WD CNT OF FIRST 4-K         N0206240
                    SD942 DC      1285      HIGH ADDR OF FIRST BUFFER   N0206250
                          DC      BUFFR     ADDRESS OF DUMP BUFFER      N0206260
                          DC      BUFFR+4   ADDRESS OF INPUT BUFFER     N0206270
                    SD944 DC      4         CONSTANT FOUR               N0206280
                          DC      6         CONSTANT SIX                N0206290
                          DC      8         CONSTANT EIGHT              N0206300
                          DC      16        CONSTANT SIXTEEN            N0206310
                          DC      640       WORD COUNT OF 2 SECTORS     N0206320
                    SD945 DC      960       WORD COUNT OF 3 SECTORS 2-6 N0206325
                    SD946 BSS     6         TEMPORARY STORAGE FOR 6 WDS N0206330
                    SD948 DC      *-*       LIMIT OF DUMP BUFFER        N0206340
                    SD949 DC      *-*       SAVE PAGE COUNT             N0206350
                    *                                                   N0206360
                    *     DUMP COMPLETED                                N0206370
                    *                                                   N0206380
                    SD300 MDX  L  $PBSY,0   SKIP NEXT IF PRINT COMPLETE N0206390
                          MDX     *-3       BR TO TEST PRINT COMPLETE   N0206400
                          MDX  L  $DUMP,0   SKIP IF NO RETURN ADDRESS   N0206410
                          MDX     SD310     BR TO RESTORE CORE AND EXIT N0206420
                          BSC  L  $EXIT     RETURN TO SUPERVISOR        N0206430
                    *                                               2-6 N0206440
                    *     READ 3 SECTORS OF CIB                     2-6 N0206450
                    *                                               2-6 N0206460
                    SD310 LD   L  $CIBA     FETCH SECTOR ADDR OF CIB2-6 N0206470
                          SRT     16                                2-6 N0206480
                          LD   L  SD945     FETCH WORD COUNT        212 N0206490
                          STD  L  BUFFR+4   STORE TO INPUT BUFFER   2-6 N0206500
                          LD      SD942+2   FETCH ADDR OF INPUT BUFF2-6 N0206510
                          SRT     16                                2-6 N0206520
                          BSI  L  DSKIO     BRANCH TO DISK READ     2-6 N0206530
                          MDX  L  $DBSY,0   SKIP IF READ COMPLETE   2-6 N0206540
                          MDX     *-3       BR TEST READ COMPLETE   2-6 N0206550
                    *                                               2-6 N0206560
                    *     RESTORE CORE BELOW DISKIO SUBR            2-6 N0206570
                    *                                               2-6 N0206580
                          LD   L  $DUMP     SET UP                  2-6 N0206590
                          A       SD962+1   *ADDRESS AT WHICH       2-6 N0206600
                          STO     SD370     *TO RETURN TO USER      2-6 N0206610
                    *                                                   N0206620
                          SRA     16        CLEAR PHASE 1D AND      2-6 N0206630
                          STO  L  $PHSE     *ADDR OF                2-6 N0206640
                          STO  L  $DUMP     *CALL   DUMP IN COMMA   2-6 N0206650
                          LD   L  BUFFR+$LEV1 RESTORE INTRPT LEV 1  2-9 N0206652
                          STO  L  $LEV1     *BRANCH ADDR            2-8 N0206654
                          LD   L  BUFFR+$LEV2 SAVE LEVEL 2          2-6 N0206660
                          STO  L  SD365     *ADDR                   2-6 N0206670
                          LD   L  BUFFR+$LEV3  RESTORE INTRPT LVL  2-11 N0206680
                          STO  L  $LEV3     * 3 BR ADDR            2-11 N0206690
                          LDD  L  BUFFR+$LEV4  RESTORE INTRPT LVL  2-11 N0206692
                          STD  L  $LEV4     * 4 + 5 BR ADDRESSES   2-11 N0206694
                          LD   L  BUFFR+$IBT4 RESTORE IBT FOR       2-6 N0206700
                          STO  L  $IBT4     *INTRPT LEVEL 4         2-6 N0206710
                          LD   L  BUFFR+$IREQ RESTORE INT REQ       2-6 N0206720
                          STO  L  $IREQ     *BR ADDR                2-6 N0206730
                    *                                               2-6 N0206740
                    *     RESTORE CORE BETWEEN END OF DISK SUBR     2-6 N0206750
                    *     AND BEGINNING OF DUMP PROGRAM             2-6 N0206760
                    *                                               2-6 N0206770
                          LDX  I1 $CILA     ADDR OF END OF DISK SUBR-1  N0206830
                          MDX  L1 -PREDP+2  MODIFY BY END OF AREA ADDR  N0206840
                          NOP                                           N0206850
                    SD320 LD   L1 BUFFR+966 FETCH A ND FROM INPT BUF2-6 N0206860
                          STO  L1 PREDP     RESTORE TO CORE CELOW DUMP  N0206870
                          MDX   1 1         DECR WORD COUNT, SK IF ZERO N0206880
                          MDX     SD320     BR TO FETCH NEXT WORD       N0206890
                          LDD  L  PREDP-2   FETCH WORDS 964 AND 965     N0206900
                          STD     SD360     *AND STORE                  N0206910
                    *                                                   N0206920
                    *     RESTORE CORE FROM BEGINNING OF DUMP PROGRAM   N0206930
                    *     TO END OF FIRST 4-K                           N0206940
                    *                                                   N0206950
                          LDX   1 -19       WORD COUNT TO XR1       2-6 N0206960
                    SD330 LD   L1 SD350+19  FETCH A WORD                N0206970
                          STO  L1 $HASH+19  STORE TO LOWER CORE         N0206980
                          MDX   1 1         INCREMENT XR1, SKIP IF ZERO N0206990
                          MDX     SD330     BRANCH TO FETCH NEXT WORD   N0207000
                    *                                                   N0207010
                          LD      SD964     FETCH WORD COUNT            N0207020
                          STO  L  PREDP-2   STORE TO CORE RESTORE AREA  N0207030
                          LD   L  $CIBA     FETCH SECTOR ADDRESS OF CIB N0207040
                          A       SD962+1   ADD THREE                   N0207050
                          STO  L  PREDP-1   STORE TO CORE RESTORE AREA  N0207060
                    SD340 LDS     *-*       RESTORE STATUS              N0207070
                          LDX  I1 SD900+2   RESTORE XR1                 N0207080
                          LDX  I2 SD900+3   RESTORE XR2                 N0207090
                          LDX  I3 SD900+4   RESTORE XR3                 N0207100
                          LD      SD963     FETCH CORE RESTORE AREA ADR N0207110
                          SRT     16        SHIFT TO EXT, ACC = 0       N0207120
                          BSC  L  $HASH+5   BRANCH TO LOWER CORE        N0207130
                    *                                                   N0207140
                    *     THE FOLLOWING 15 WORDS ARE STORED IN LOWER    N0207150
                    *     CORE AND A TRANSFER IS MADE TO THE FIRST ONE  N0207160
                    *     IN ORDER THAT WORDS 966-4095 MAY BE READ FROM N0207170
                    *     THE CORE IMAGE BUFFER OVER THE PRESENT        N0207180
                    *     LOCATION OF THE DUMP PROGRAM                  N0207190
                    *                                                   N0207200
                          BSS  E  0                                     N0207210
                    SD350 DC      *-*       ACCUMULATOR                 N0207220
                          DC      *-*       EXTENSION                   N0207230
                    SD360 DC      *-*       SAVE FOR LOCATION 964       N0207240
                          DC      *-*       SAVE FOR LOCATION 965       N0207250
                    SD365 DC      *-*       SAVE FOR USER $LEV2     2-6 N0207255
                          BSI  L  DSKIO     BRANCH TO DISK READ         N0207260
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  N0207270
                          MDX     *-3       BR TO TEST READ COMPLETE    N0207280
                          LDD     SD360     FETCH ORIGINAL CONTENTS OF  N0207290
                          STD  L  PREDP-2   *LOC 964-965 AND RESTORE    N0207300
                          LD      SD365     RESTORE INTRPT LEV 2    2-6 N0207304
                          STO  L  $LEV2     *ADDR                   2-6 N0207306
                          LDD     SD350     FETCH ACC AND EXT           N0207310
                          BSC  L  *-*       RETURN TO USERS PROGRAM     N0207320
                    SD370 EQU     *-1                                   N0207330
                    *                                                   N0207340
                    SD960 DC      *-*       SAVE FOR WORD COUNT OF CIB  N0207350
                    SD962 DC      1         CONSTANT ONE                N0207360
                          DC      3         CONSTANT THREE              N0207370
                    SD963 DC      PREDP-2   RESTORE CORE ADDRESS        N0207380
                    SD964 DC      3130      CORE RESTORE WORD COUNT     N0207390
                    SD965 DC      $CIBA-1   ADDRESS OF CIB I/O AREA     N0207400
                          EJCT                                          N0207401
                    **************************************************  N0207402
                    *                                                 * N0207403
                    *THE FOLLOWING ROUTINE PLACES A TRANSLATION OF    * N0207404
                    *   THE CONTENTS OF CORE IN THE RIGHT HAND        * N0207405
                    *   MARGIN OF THE DUMP.                           * N0207406
                    *                                                 * N0207407
                    *************************************************** N0207408
                          SPAC                                          N0207409
                    SD410 DC      *-*       ENTRY POINT             212 N0207410
                          STX  L1 SD470+1   SAVE XR1 FOR CALLER     212 N0207411
                          LDX  L3 TABL1     SET XR3 TO CONVERSION TB212 N0207412
                          LDX   1 -49       SET XR1 FOR SEARCH.     212 N0207420
                    SD420 LD      TEMP1     RELOAD WORD             212 N0207440
                          SRA     8         RIGHT JUSTIFY CHARACTER 212 N0207450
                          EOR   3 0         SEE IF A MATCH.         212 N0207460
                          BSC  L  SD430,+-  FOUND, SAVE IN TEMP2    212 N0207470
                          MDX   3 1         INCREMENT TABLE POINTER 212 N0207480
                          MDX   1 1         INCREMENT XR1           212 N0207490
                          MDX     SD420     GO RELAOD WORD          212 N0207500
                          LD      TABL1     LOAD PERIOD             212 N0207510
                          SLA     8         LEFT-JUSTIFY            212 N0207520
                          STO     TEMP2     STORE TEMPORARILY       212 N0207530
                          MDX     SD440     GO CHECK 2ND CHARACTER  212 N0207540
                    SD430 LD      TEMP1     RELOAD WORD PASSED      212 N0207550
                          SRA     8         ISOLATE FIRST           212 N0207560
                          SLA     8         CHARACTER               212 N0207570
                          STO     TEMP2     SAVE TEMPORARILY        212 N0207580
                    SD440 LDX  L3 TABL1     SET XR3 TO CHAR TABLE   212 N0207585
                          LDX   1 -49       SET XR1 FOR SEARCH.     212 N0207590
                    SD445 LD      TEMP1     RELOAD CHARACTER        212 N0207600
                          SLA     8         ISOLATE 2ND CHARACTER   212 N0207610
                          SRA     8         * BY THESE SHIFTS       212 N0207620
                          EOR   3 0         COMPARE WITH TABLE ENTRY212 N0207630
                          BSC  L  SD450,+-  FOUND, GO SAVE          212 N0207640
                          MDX   3 1         INCREMENT TBL POINTER   212 N0207650
                          MDX   1 1         INCREMENT POINTER       212 N0207660
                          MDX     SD445     CHECK NEXT TABLE ENTRY  212 N0207670
                          LD      TABL1     LOAD PERIOD             212 N0207680
                          OR      TEMP2     OR WITH 1ST CHARACTER   212 N0207690
                          MDX     SD460     RETURN                  212 N0207720
                    SD450 LD      TEMP1     LOAD 1ST CHARACTER      212 N0207730
                          SLA     8         LEFT JUSTIFY            212 N0207735
                          SRA     8         *AND ISOLATE            212 N0207740
                          OR      TEMP2     OR WITH 1ST CHAR        212 N0207744
                    SD460 STO  I  SD947     STORE IN TRANSLATION    212 N0207746
                          MDX  L  SD947,1   INCREMENT POINTER       212 N0207748
                    SD470 LDX  L1 *-*       RESTORE XR1             212 N0207749
                          BSC  I  SD410     RETURN                  212 N0207750
                    TEMP1 DC      *-*       SAVE FOR CONVERSION WORD212 N0207760
                    TEMP2 DC      *-*       SAVE FOR CONVERSION WORD212 N0207770
                          EJCT                                          N0207771
                    *************************************************** N0207772
                    *                                                 * N0207773
                    *THE FOLLOWING 49-WORD TABLE IS TO DETERMINE      * N0207774
                    *   WHICH EBCDIC CONFIGURATIONS ARE PRINTABLES.   * N0207775
                    *   CODES NOT FOUND HERE ARE REPLACED WITH PERIODS* N0207776
                    *                                                 * N0207777
                    *************************************************** N0207778
                          SPAC                                          N0207779
                    TABL1 DC      /004B     PERIOD                  212 N0207780
                          DC      /004D     LEFT PARENTHESIS        212 N0207790
                          DC      /004E     PLUS SIGN               212 N0207800
                          DC      /0050     AMPERSAND               212 N0207810
                          DC      /005B     DOLLAR SIGN    -        212 N0207820
                          DC      /005C     ASTERISK                212 N0207830
                          DC      /005D     RIGHT PARENTHESIS       212 N0207840
                          DC      /0060     MINUS SIGN              212 N0207850
                          DC      /0061     SLASH                   212 N0207860
                          DC      /006B     COMMA                   212 N0207870
                          DC      /007D     APOSTROPHE              212 N0207880
                          DC      /007E     EQUAL SIGN              212 N0207890
                          DC      /00C1     A                       212 N0207900
                          DC      /00C2     B                       212 N0207910
                          DC      /00C3     C                       212 N0207920
                          DC      /00C4     D                       212 N0207930
                          DC      /00C5     E                       212 N0207940
                          DC      /00C6     F                       212 N0207950
                          DC      /00C7     G                       212 N0207960
                          DC      /00C8     H                       212 N0207970
                          DC      /00C9     I                       212 N0207980
                          DC      /00D1     J                       212 N0207990
                          DC      /00D2     K                       212 N0208000
                          DC      /00D3     L                       212 N0208010
                          DC      /00D4     M                       212 N0208020
                          DC      /00D5     N                       212 N0208030
                          DC      /00D6     O                       212 N0208040
                          DC      /00D7     P                       212 N0208050
                          DC      /00D8     Q                       212 N0208060
                          DC      /00D9     R                       212 N0208070
                          DC      /00E2     S                       212 N0208080
                          DC      /00E3     T                       212 N0208090
                          DC      /00E4     U                       212 N0208100
                          DC      /00E5     V                       212 N0208110
                          DC      /00E6     W                       212 N0208120
                          DC      /00E7     X                       212 N0208130
                          DC      /00E8     Y                       212 N0208140
                          DC      /00E9     Z                       212 N0208150
                          DC      /00F0     ZERO                    212 N0208160
                          DC      /00F1     ONE                     212 N0208170
                          DC      /00F2     TWO                     212 N0208180
                          DC      /00F3     THREE                   212 N0208190
                          DC      /00F4     FOUR                    212 N0208200
                          DC      /00F5     FIVE                    212 N0208210
                          DC      /00F6     SIX                     212 N0208220
                          DC      /00F7     SEVEN                   212 N0208230
                          DC      /00F8     EIGHT                   212 N0208240
                          DC      /00F9     NINE                    212 N0208250
                          DC      /0040     BLANK                   212 N0208251
                          BSS  E  0                                 212 N0208252
                    SD980 DC      *-*       SAVE AREA FOR           212 N0208254
                          DC      *-*       *CONVERSION ROUTINE     212 N0208256
                          BSS     SD000+4*@SCTR-8-*-1 PATCH AREA    212 N0208260
                          DC      /FFFF     END OF PATCH AREA       212 N0208270
                    BUFFR EQU     *         CORE IMAGE I/O AREA     212 N0208280
                    SDEND EQU     BUFFR-1   END OF SYSTEM CORE DUMP 212 N0208290
                          END     SD000                                 N0208300
