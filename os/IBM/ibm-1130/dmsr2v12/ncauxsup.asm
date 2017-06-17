                          HDNG    AUXILIARY SUPERVISOR                  N0300010
                    *************************************************** N0300020
                    *                                                 * N0300030
                    *STATUS - VERSION 2, MODIFICATION LEVEL 11        * N0300040
                    *                                                 * N0300050
                    *FUNCTION/OPERATION-                              * N0300060
                    *   * STORE MONITOR CONTROL RECORDS IN THE        * N0300070
                    *     SUPERVISOR BUFFER AND CALL THE SUPERVISOR.  * N0300080
                    *   * ABORT A JOB.                                * N0300090
                    *   * PRINT ERROR MESSAGES FOR THE CORE LOAD      * N0300100
                    *     BUILDER.                                    * N0300110
                    *                                                 * N0300120
                    *ENTRY POINT-                                     * N0300130
                    *   * AS000  ENTERED FROM THE CORE IMAGE LOADER   * N0300140
                    *            WHEN A CALL DUMP HAS A NEGATIVE      * N0300150
                    *            FORMAT AS FOLLOWS-                   * N0300160
                    *               BSI  L  $DUMP                     * N0300170
                    *               DC      -X                        * N0300180
                    *            WHERE X = 1  STORES A // JOB RECORD. * N0300190
                    *                      2  ABORTS THE JOB.         * N0300200
                    *                      3  PRINTS .S 01 XXXXX IS   * N0300210
                    *                         NOT IN LET/FLET.        * N0300220
                    *                      4  PRINTS .S 02 XXXXX IS A * N0300230
                    *                         DATA FILE.              * N0300240
                    *                      5  STORES A // DUP RECORD. * N0300250
                    *                                                 * N0300260
                    *INPUT-                                           * N0300270
                    *   * THE FORMAT CODE AS SHOWN ABOVE.             * N0300280
                    *   * THE NAME (XXXXX) STORED IN $LKNM IN COMMA   * N0300290
                    *                                                 * N0300300
                    *OUTPUT-                                          * N0300310
                    *   * $CTSW SET -1 TO INDICATE THE PRESENCE OF A  * N0300320
                    *     RECORD IN THE SUPERVISOR BUFFER.            * N0300330
                    *   * $FLSH SET NON-ZERO TO TELL THE SUPERVISOR   * N0300340
                    *     TO ABORT THE JOB.                           * N0300350
                    *   * A PRINTED ERROR MESSAGE FOR THE CORE LOAD   * N0300360
                    *     BUILDER.                                    * N0300370
                    *                                                 * N0300380
                    *EXTERNAL REFERENCES                              * N0300390
                    *   * DZ000  SUBROUTINE TO PERFORM DISK I/O.      * N0300400
                    *   * SBUFR  SUPERVISOR BUFFER.                   * N0300410
                    *   * IN COMMA-                                   * N0300420
                    *     $CIBA                                       * N0300430
                    *     $CH12                                       * N0300440
                    *     $CIDN                                       * N0300450
                    *     $DBSY                                       * N0300460
                    *     $DUMP                                       * N0300470
                    *     $EXIT                                       * N0300480
                    *     $HASH                                       * N0300490
                    *     $IBSY                                       * N0300500
                    *     $IBT4                                       * N0300510
                    *     $IOCT                                       * N0300520
                    *     $NDUP                                       * N0300530
                    *     $NXEQ                                       * N0300540
                    *     $PBSY                                       * N0300550
                    *     $PHSE                                       * N0300560
                    *     $LKNM                                       * N0300570
                    *     $DMPF                                       * N0300580
                    *                                                 * N0300590
                    *EXITS-                                           * N0300600
                    *   * NORMAL-                                     * N0300610
                    *     BRANCH TO THE MONITOR CONTROL RECORD        * N0300620
                    *     ANALYZER BY A CALL EXIT.                    * N0300630
                    *   * ERROR-                                      * N0300640
                    *     BRANCH TO THE MONITOR CONTROL RECORD        * N0300650
                    *     ANALYZER BY A CALL EXIT AFTER PRINTING      * N0300660
                    *     .S 00 INVALID FUNCTION CODE.                * N0300670
                    *                                                 * N0300680
                    *TABLES/WORK AREAS-                               * N0300690
                    *   * PSLET  TABLE OF SLET ENTRIES FOR THE        * N0300700
                    *            PRINCIPAL PRINT SUBROUTINE WHICH IS  * N0300710
                    *            FILLED IN BY THE SYSTEM LOADER.      * N0300720
                    *   * TABLE  INTERRUPT LEVEL 4 BRANCH ADDRESS     * N0300730
                    *            TABLE.                               * N0300740
                    *                                                 * N0300750
                    *ATTRIBUTES- N/A                                  * N0300760
                    *                                                 * N0300770
                    *NOTES- N/A                                       * N0300780
                    *                                                 * N0300790
                    *************************************************** N0300800
                          HDNG    AUXILIARY SUPERVISOR                  N0300810
                          ABS                                           N0300820
                          ORG     /400                              2-3 N0300830
                    *                                                   N0300840
                          DC      ASEND-*   AUX SUPERVISOR WORD COUNT   N0300850
                          DC      -116      AUX SUPERVISOR PHASE ID     N0300860
                          DC      PSLET-*+1                             N0300870
                          DC      1                                     N0300880
                          ORG     *-2                                   N0300890
                    *                                                   N0300900
                    *     EXTERNAL EQUATE STATEMENTS                    N0300910
                    *                                                   N0300920
                    $CIBA EQU     /0005                                 N0300930
                    $CH12 EQU     /0006                                 N0300940
                    $CIDN EQU     /01DB                                 N0300950
                    $CTSW EQU     /000F                                 N0300960
                    $DBSY EQU     /00EE                                 N0300970
                    $DUMP EQU     /003F                                 N0300980
                    $EXIT EQU     /0038                                 N0300990
                    $FLSH EQU     /0071                                 N0301000
                    $HASH EQU     /0014                                 N0301010
                    $IBSY EQU     /0013                                 N0301020
                    $IBT4 EQU     /00D4                                 N0301030
                    $IOCT EQU     /0032                                 N0301040
                    $NDUP EQU     /0034                                 N0301050
                    $NXEQ EQU     /0035                                 N0301060
                    $PBSY EQU     /0036                                 N0301070
                    $PHSE EQU     /0078                                 N0301080
                    $LKNM EQU     $HASH                                 N0301090
                    $DMPF EQU     $HASH+5                               N0301100
                    #HDNG EQU     /0007                                 N0301110
                    DZ000 EQU     /00F2                                 N0301120
                    @SBFR EQU     /0FB0                                 N0301130
                          HDNG    AUXILIARY SUPERVISOR                  N0301140
                    AS000 NOP                                           N0301150
                          LDX   1 116       SET PHASE ID           2-11 N0301160
                          STX  L1 $PHSE     *IN COMMA                   N0301170
                          SRA     16        CLEAR                       N0301180
                          STO  L  $DUMP     *RETURN ADDRESS             N0301190
                    *                                                   N0301200
                          LDX  I1 $DMPF     FETCH FUNCTION CODE TO XR1  N0301210
                          MDX   1 1         INCR FUNC CODE, SKIP IF Z   N0301220
                          MDX     AS180                                 N0301230
                    *                                                   N0301240
                    *     FUNCTION CODE = -1   DUMMY UP // JOB RECORD   N0301250
                    *                                                   N0301260
                    *                       TWO STATEMENTS REMOVED  2-4 N0301270
                    AS100 LD   L  $CIDN     FETCH CARTRIDGE ID          N0301290
                          SRT     16        SHIFT TO EXTENSION          N0301300
                          LDX   1 4         CHARACTER COUNT TO XR1      N0301310
                    AS120 SRA     16        CLEAR ACC (ID A 32-BIT WD)  N0301320
                          D       AS913     DIVIDE OUT A CHARACTER      N0301330
                          RTE     16        EXC. QUOTIENT AND REMAINDER N0301340
                          S       AS914     TEST FOR AND                N0301350
                          BSC  L  AS140,+   *BRANCH IF NUMERIC          N0301360
                    *                                                   N0301370
                          A       AS915     CONVERT TO EBCDIC           N0301380
                          MDX     AS140+1                               N0301390
                    *                                                   N0301400
                    AS140 A       AS916     CONVERT TO EBCDIC           N0301410
                          STO  L1 AS912-1   STORE TO CARTRIDGE ID AREA  N0301420
                    *                                                   N0301430
                          MDX   1 -1        DECR CHAR CNT, SKIP IF ZERO N0301440
                          MDX     AS120     BR TO FETCH NEXT CHARACTER  N0301450
                    *                                                   N0301460
                          LDX  L2 AS910     FETCH ADDRESS OF (// JOB)   N0301470
                          BSC  L  STORE     BRANCH TO STORE TO SBUFR    N0301480
                    *                                                   N0301490
                    AS180 MDX   1 1         INCR FUNC CODE, SKIP IF Z   N0301500
                          MDX     AS250                                 N0301510
                    *                                                   N0301520
                    *     FUNCTION CODE = -2  PREPARE TO ABORT JOB      N0301530
                    *                                                   N0301540
                    AS200 XIO     AS920     SENSE INTERRUPT WITH RESET  N0301550
                          BOSC L  *         TURN OFF INTERRUPT LEVEL    N0301560
                          LD      AS920     SET                         N0301570
                          STO  L  $FLSH     *INDICATOR TO ABORT JOB     N0301580
                          SRA     16        SET                         N0301590
                          STO  L  $IBSY     *INPUT BUSY INDICATOR,      N0301600
                          STO  L  $IOCT     *I/O BUSY INDICATOR AND     N0301610
                          STO  L  $PBSY     *PRINT BUSY INDICATOR OFF   N0301620
                          XIO     AS925     READ KEY BRD TO TURN OFF2-3 N0301625
                          BSC  L  $EXIT     FETCH MON CTRL RCD ANALYZER N0301630
                    *                                                   N0301640
                    AS250 MDX   1 1         INCR FUNC CODE, SKIP IF Z   N0301650
                          MDX     AS350                                 N0301660
                    *                                                   N0301670
                    *     FUNCTION CODE = -3   PROGRAM NOT IN LET/FLET  N0301680
                    *                                                   N0301690
                    AS300 LDX   2 1         POINT TO ERROR MESSAGE      N0301700
                          BSC  L  PRINT     BRANCH TO PRINT THE MESSAGE N0301710
                    *                                                   N0301720
                    AS350 MDX   1 1         INCR FUNC CODE, SKIP IF Z   N0301730
                          MDX     AS450                                 N0301740
                    *                                                   N0301750
                    *     FUNCTION CODE = -4   NAME IS A DATA FILE      N0301760
                    *                                                   N0301770
                    AS400 LDX   2 2         POINT TO ERROR MESSAGE      N0301780
                          BSC  L  PRINT     BRANCH TO PRINT THE MESSAGE N0301790
                    *                                                   N0301800
                    AS450 MDX   1 1         INCR FUNC CODE, SKIP IF Z   N0301810
                          MDX     AS550                                 N0301820
                    *                                                   N0301830
                    *     FUNCTION CODE = -5   DUMMY UP // DUP RECORD   N0301840
                    *                                                   N0301850
                    AS500 LDX  L2 AS950     FETCH ADDRESS OF (// DUP)   N0301860
                          BSC  L  STORE     BRANCH TO STORE TO SBUFR    N0301870
                    *                                               2-2 N0301871
                    AS550 MDX   1 1         INCR FUNC CODE, SKIP IF 2-2 N0301872
                          MDX     ASERR                             2-2 N0301873
                    *                                               2-2 N0301874
                    *     FUNCTION CODE = -6   DUMMY UP // XEQ MODIF2-2 N0301875
                    *                                               2-2 N0301876
                    AS600 LDX  L2 AS960     FETCH ADDR OF (// XEQ MO2-2 N0301877
                          BSC  L  STORE     BRANCH TO STORE TO SBUFR2-2 N0301878
                    *                                                   N0301880
                    *     INVALID FUNCTION CODE                         N0301890
                    *                                                   N0301900
                    ASERR LDX   2 0         POINT TO ERROR MESSAGE      N0301910
                          BSC  L  PRINT     BRANCH TO PRINT THE MESSAGE N0301920
                    *                                                   N0301930
                    *     CONSTANTS AND WORK AREA                       N0301940
                    *                                                   N0301950
                    AS912 DC      /0040     X 16 TO THE 3 POWER         N0301970
                          DC      /0040     X 16 TO THE 2 POWER         N0301980
                          DC      /0040     X 16 TO THE 1 POWER         N0301990
                          DC      /0040     X 16 TO THE 0 POWER         N0302000
                    AS913 DC      16        CONSTANT SIXTEEN            N0302010
                    AS914 DC      /0009     TEST FOR ALPHA OR NUMERIC   N0302020
                    AS915 DC      /00C0     ALPHABETIC TO EBCDIC MASK   N0302030
                    AS916 DC      /00F9     NUMERIC TO EBCDIC MASK      N0302040
                          BSS  E  0                                     N0302050
                    AS920 DC      *         NON-ZERO                    N0302060
                          DC      /0F01     SENSE WITH RESET IOCC       N0302070
                    AS925 DC      AS920     READ IOCC               2-3 N0302074
                          DC      /0A00     *FOR KEY BOARD          2-3 N0302076
                    *                                                   N0302080
                    *     UNPACKED EBCDIC CONTROL NAMES                 N0302090
                    *                                                   N0302100
                    AS910 DC      /0061     // JOB                      N0302110
                          DC      /0061                                 N0302120
                          DC      /0040                                 N0302130
                          DC      /00D1                                 N0302140
                          DC      /00D6                                 N0302150
                          DC      /00C2                                 N0302160
                          DC      /0040                             2-2 N0302161
                          DC      /0040                             2-2 N0302162
                          DC      /0040                             2-2 N0302163
                          DC      /0040                             2-2 N0302164
                          DC      /0040                             2-2 N0302165
                          DC      /0040                             2-2 N0302166
                    AS950 DC      /0061     // DUP                      N0302170
                          DC      /0061                                 N0302180
                          DC      /0040                                 N0302190
                          DC      /00C4                                 N0302200
                          DC      /00E4                                 N0302210
                          DC      /00D7                                 N0302220
                          DC      /0040                             2-2 N0302221
                          DC      /0040                             2-2 N0302222
                          DC      /0040                             2-2 N0302223
                          DC      /0040                             2-2 N0302224
                          DC      /0040                             2-2 N0302225
                          DC      /0040                             2-2 N0302226
                    AS960 DC      /0061     // XEQ MODIF            2-2 N0302227
                          DC      /0061                             2-2 N0302228
                          DC      /0040                             2-2 N0302229
                          DC      /00E7                             2-2 N0302230
                          DC      /00C5                             2-2 N0302231
                          DC      /00D8                             2-2 N0302232
                          DC      /0040                             2-2 N0302233
                          DC      /00D4                             2-2 N0302234
                          DC      /00D6                             2-2 N0302235
                          DC      /00C4                             2-2 N0302236
                          DC      /00C9                             2-2 N0302237
                          DC      /00C6                             2-2 N0302238
                    *                                               2-2 N0302239
                    *                                                   N0302240
                          BSS     11        PATCH AREA                  N0302250
                    *                                                   N0302260
                    *                                                   N0302270
                          HDNG    AUXILLIARY SUPERVISOR                 N0302280
                    *                                                   N0302290
                    *     STORE AN UNPACKED EBCDIC MONITOR CONTROL      N0302300
                    *     NAME TO THE SUPERVISOR BUFFER                 N0302310
                    *                                                   N0302320
                    STORE MDX   2 12        INCREMENT AND               N0302330
                          STX   2 AS700+1   *STORE FETCH ADDRESS        N0302340
                    *                                                   N0302350
                          LDX   1 -12       WORD COUNT TO XR1           N0302360
                    AS700 LD   L1 *-*       FETCH AND STORE CONTROL     N0302370
                          STO  L1 @SBFR+12  *NAME TO SUPERVISOR BUFFER  N0302380
                          MDX   1 1         INCR WORD CNT, SKIP IF ZERO N0302390
                          MDX     AS700                                 N0302400
                    *                                                   N0302410
                          LDX   1 -68       WORD COUNT TO XR1           N0302420
                          LD      AS970     FETCH AND STORE BLANKS      N0302430
                    AS720 STO  L1 @SBFR+80  *TO SUPERVISOR BUFFER       N0302440
                          MDX   1 1         INCR WORD CNT, SKIP IF ZERO N0302450
                          MDX     AS720                                 N0302460
                    *                                               2-2 N0302462
                          LDX  I1 $DMPF     FETCH FUNCTION CODE TO X2-2 N0302464
                          MDX   1 1         TEST FOR AND            2-2 N0302466
                          MDX     AS750     *BRANCH IF NOT EQUAL TO 2-2 N0302468
                    *                                                   N0302470
                          LDX   1 -4        WORD COUNT TO XR1           N0302480
                    AS740 LD   L1 AS912+4   FETCH AND STORE CARTRIDGE   N0302490
                          STO  L1 @SBFR+14  *ID (OR BLANKS) TO @SBFR    N0302500
                          MDX   1 1         INCR WORD CNT, SKIP IF ZERO N0302510
                          MDX     AS740                                 N0302520
                    *                                                   N0302530
                    AS750 LD      AS971     INDICATE PRESENCE OF        N0302540
                          STO  L  $CTSW     *RECORD IN @SBFR TO MCRA    N0302550
                          BSC  L  $EXIT     FETCH MON CTRL RCD ANALYZER N0302560
                    *                                                   N0302570
                    *     CONSTANTS                                     N0302580
                    *                                                   N0302590
                    AS970 DC      /0040     UNPACKED EBCDIC BLANK       N0302600
                    AS971 DC      -1        NEGATIVE NUMBER             N0302610
                    *                                                   N0302620
                    *                                                   N0302630
                          BSS     11        PATCH AREA                  N0302640
                    *                                                   N0302650
                    *                                                   N0302660
                          HDNG    AUXILLIARY SUPERVISOR                 N0302670
                    *                                                   N0302680
                    *     PRINT ERROR MESSAGES                          N0302690
                    *                                                   N0302700
                    PRINT NOP                                           N0302710
                    *                                                   N0302720
                    *     FETCH THE PRINCIPAL PRINT SUBROUTINE          N0302730
                    *                                                   N0302740
                          LDD     PSLET+2   FETCH AND STORE WORD COUNT  N0302750
                          STD  I  PADDR     *AND SCTR ADDR TO I/O AREA  N0302760
                          LD      PADDR     FETCH ADDRESS OF I/O AREA   N0302770
                          SRT     16        SHIFT TO EXT, ACC = 0       N0302780
                          BSI  L  DZ000     BRANCH TO DISK READ         N0302790
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  N0302800
                          MDX     *-3       BR TO TEST READ COMPLETE    N0302810
                    *                                                   N0302820
                          LD      PADDR     SET UP                      N0302830
                          A    L  AS988     *INTERRUPT ENTRY            N0302840
                          STO     TABLE+4   *AND STORE TO               N0302850
                          STO     TABLE+7   *ILS04 BRANCH TABLE         N0302860
                          STO  L  9         *AND LEVEL 1 BRANCH ADDRESS N0302870
                    *                                                   N0302880
                          LDX  L1 TABLE-1   STORE ADDRESS OF INTERRUPT  N0302890
                          STX  L1 $IBT4     *BR TABLE TO ILS04 SUBR     N0302900
                          MDX     AS800                                 N0302910
                    *                                                   N0302920
                    *     SLET FOR PRINCIPAL PRINT SUBROUTINE           N0302930
                    *                                                   N0302940
                          BSS  E  0                                     N0302950
                    PSLET DC      153       PHASE ID                    N0302960
                          DC      *-*       CORE ADDRESS                N0302970
                          DC      *-*       WORD COUNT                  N0302980
                          DC      *-*       SECTOR ADDRESS              N0302990
                    TABLE BSS     3         RESERVED                    N0303000
                          DC      *-*       1231 OPT. MARK PAGE READER  N0303010
                          DC      *-*       1403 PRINTER                N0303020
                          DC      *-*       2501 CARD READER            N0303030
                          DC      *-*       1442 CARD READER/PUNCH      N0303040
                          DC      *-*       KEYBOARD/CONSOLE PRINTER    N0303050
                          DC      *-*       1134/1055 P/T READER-PUNCH  N0303060
                    PADDR DC      ASEND     ADDRESS OF PRIN PRINT SUBR  N0303070
                    PRNT  DC      ASEND+3   ENTRY TO PRIN PRINT SUBR    N0303080
                    *                                                   N0303090
                    *     CONVERT NAME TO FIVE EBCDIC CHARACTERS        N0303100
                    *                                                   N0303110
                    AS800 MDX   2 0         SKIP NEXT IF XR2 EQUAL ZERO N0303120
                          MDX     *+1                                   N0303130
                          MDX     AS840     BR AS NO NAME TO CONVERT    N0303140
                    *                                                   N0303150
                          LD   L2 AS989     FETCH AND STORE             N0303160
                          STO     AS820+1   *ADDRESS OF MESSAGE         N0303170
                    AS820 LDX  L1 *-*       *TO BE PICKED UP BY XR1     N0303180
                    *                                                   N0303190
                          LDD  L  $LKNM     FETCH NAME                  N0303200
                          STD     AS980                                 N0303210
                          SLA     2                                     N0303220
                          SRA     2                                     N0303230
                          SRT     8                                     N0303240
                          BSI     AS830                                 N0303250
                          STO   1 3         STORE FIRST CHARACTER       N0303260
                          SRA     10                                    N0303270
                          SLT     6                                     N0303280
                          BSI     AS830                                 N0303290
                          SLA     8                                     N0303300
                          STO     AS981                                 N0303310
                          SLA     2                                     N0303320
                          SLT     6                                     N0303330
                          BSI     AS830                                 N0303340
                          OR      AS981                                 N0303350
                          STO   1 4         STORE SECOND AND THIRD CHAR N0303360
                          LDD     AS980                                 N0303370
                          SLT     4                                     N0303380
                          SRA     16                                    N0303390
                          SLT     6                                     N0303400
                          BSI     AS830                                 N0303410
                          SLA     8                                     N0303420
                          STO     AS981                                 N0303430
                          SLA     2                                     N0303440
                          SLT     6                                     N0303450
                          BSI     AS830                                 N0303460
                          OR      AS981                                 N0303470
                          STO   1 5         STORE FORTH AND FIFTH CHAR  N0303480
                          MDX     AS840                                 N0303490
                    *                                                   N0303500
                    *     CONVERT A CHARACTER TO EBCDIC                 N0303510
                    *                                                   N0303520
                    AS830 DC      *-*       ENTRY/RETURN ADDRESS        N0303530
                          STO     AS981+1   SAVE THE CHARACTER          N0303540
                          AND     AS982+1   MASK OUT BITS 0 - 11        N0303550
                          S       AS982     TEST FOR AND BRANCH IF      N0303560
                          BSC  L  AS835,Z+  *NOT A SPECIAL CHARACTER    N0303570
                          LD      AS982+2   FETCH MASK                  N0303580
                          MDX     AS835+1                               N0303590
                    AS835 LD      AS982+3   FETCH MASK                  N0303600
                          OR      AS981+1   MASK IN THE CHARACTER       N0303610
                          BSC  I  AS830     RETURN                      N0303620
                    *                                                   N0303630
                    *     CONSTANTS AND WORK AREA                       N0303640
                    *                                                   N0303650
                    AS980 DEC     0.0       SAVE FOR NAME               N0303660
                    AS981 DC      *-*       TEMPORARY STORAGE           N0303670
                          DC      *-*       TEMPORARY STORAGE           N0303680
                    AS982 DC      /000A     MASK                        N0303690
                          DC      /000F     MASK                        N0303700
                          DC      /0040     MASK FOR SPECIAL CHARACTERS N0303710
                          DC      /00C0     MASK FOR ALPHA-NUMERIC CHAR N0303720
                    *                                                   N0303730
                    *     PRINT THE MESSAGE                             N0303740
                    *                                                   N0303750
                    AS840 LD   I  $CH12     FETCH CHANNEL 12 INDICATOR  N0303760
                          BSC  L  AS850,+-  BRANCH IF ZERO          2-3 N0303770
                    *                                                   N0303780
                    *     RESTORE PAGE AND PRINT HEADING                N0303790
                    *                                                   N0303800
                          LD      AS984     FETCH ADDR OF DISK I/O AREA N0303810
                          SRT     16        SHIFT TO EXT, ACC = O       N0303820
                          BSI  L  DZ000     BRANCH TO DISK READ     2-5 N0303830
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  N0303840
                          MDX     *-3       BR TO TEST READ COMPLETE    N0303850
                    *                                                   N0303860
                          LD      AS986     MOVE WORD COUNT             N0303870
                          STO     AS986+1   *FOR PRINT BUFFER           N0303880
                          LD      AS985     FETCH ADDR OF PRINT BUFFER  N0303890
                          SRT     16        SHIFT TO EXTENSION          N0303900
                          LD      AS983     FETCH RESTORE PAGE CODE     N0303910
                          BSI  I  PRNT      BRANCH TO RESTORE PAGE      N0303920
                          BSI  I  PRNT      BRANCH TO PRINT HEADING     N0303930
                    AS850 LD      AS983+2   FETCH SPACE ONE LINE CODE   N0303940
                          BSI  I  PRNT      BRANCH TO SPACE ONE LINE    N0303950
                          MDX     AS860                                 N0303960
                    *                                                   N0303970
                    *     CONSTANTS AND WORK AREA                       N0303980
                    *                                                   N0303990
                    AS983 DC      /7000     RESTORE PAGE FUNCTION CODE  N0304000
                          DC      /7001     PRINT FUNCTION CODE         N0304010
                          DC      /7002     SPACE ONE LINE FUNC CODE    N0304020
                    AS984 DC      AS986     ADDRESS OF DISK I/O AREA    N0304030
                    AS985 DC      AS986+1   ADDRESS OF PRINT BUFFER     N0304040
                          BSS  E  0                                     N0304050
                    AS986 DC      10        WORD COUNT                  N0304060
                          DC      #HDNG     SECTOR ADDRESS              N0304070
                          BSS     10        HEADING BUFFER              N0304080
                    *                                                   N0304090
                    *     PRINT THE ERROR MESSAGE                       N0304100
                    *                                                   N0304110
                    AS860 LD   L2 AS989     FETCH ADDRESS OF MESSAGE    N0304120
                          SRT     16        SHIFT TO EXTENSION          N0304130
                          LD      AS983+1   FETCH PRINT FUNCTION CODE   N0304140
                          BSI  I  PRNT      BRANCH TO PRINT THE MESSAGE N0304150
                          MDX  L  $PBSY,0   SKIP NEXT IF PRINT COMPLETE N0304160
                          MDX     *-3       BR TO TEST PRINT COMPLETE   N0304170
                    *                                                   N0304180
                          LD      AS988                                 N0304190
                          STO  L  $NXEQ     SET DO-NOT-EXECUTE SWITCH   N0304200
                          BSC  L  $EXIT     FETCH MON CTRL RCD ANALYZER N0304210
                    *                                                   N0304220
                    *     CONSTANTS AND WORK AREA                       N0304230
                    *                                                   N0304240
                    AS988 DC      6         CONSTANT SIX                N0304250
                    *                                                   N0304260
                    *     ADDRESSES OF ERROR MESSAGES                   N0304270
                    *                                                   N0304280
                          BSS  E  0                                     N0304290
                    AS989 DC      AS990     ADDRESS OF S 00             N0304300
                          DC      AS991     ADDRESS OF S 01             N0304310
                          DC      AS992     ADDRESS OF S 02             N0304320
                    *                                                   N0304330
                    *     ERROR MESSAGES                                N0304340
                    *                                                   N0304350
                    AS990 DC      13        S00 WORD COUNT              N0304360
                          EBC     .S 00 INVALID FUNCTION CODE.          N0304370
                    AS991 DC      15        S 01 WORD COUNT             N0304380
                          EBC     .S 01 XXXXX IS NOT IN LET/FLET .      N0304390
                    AS992 DC      13        S 02 WORD COUNT             N0304400
                          EBC     .S 02 XXXXX IS A DATA FILE .          N0304410
                    *                                                   N0304420
                    *                                                   N0304430
                          BSS  E  10        PATCH AREA                  N0304440
                    *                                                   N0304450
                    *                                                   N0304460
                          BSS  E  0                                     N0304470
                    ASEND DC      /7777                                 N0304480
                          END     AS000                                 N0304490
