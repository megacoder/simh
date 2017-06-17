                          HDNG    RDREC- READ *ID RECORD                U7C00010
                    *             JUNE 20,1967                          U7C00020
                    *************************************************** U7C00030
                    * ENTRY POINT                                     * U7C00040
                    *************************************************** U7C00050
                          ENT     RDREC                                 U7C00060
                    *************************************************** U7C00070
                    *                                                 * U7C00080
                    * STATUS - VERSION 2 MOD LEVEL 9.                 * U7C00090
                    *                                                 * U7C00100
                    * FUNCTION/OPERATION-                             * U7C00110
                    *    READ THE *ID RECORD USED BY SEVERAL SUBRS.   * U7C00120
                    *      * CALLS THE FSLEN SUBR TO FETCH            * U7C00130
                    *         PRINCIPAL SYSTEM DEVICE PH. ENTRY FROM  * U7C00140
                    *         SLET.                                   * U7C00150
                    *       * CALLS FSYSU TO BRING IN REQUEST SYSTEM  * U7C00160
                    *         DEVICE ROUTINE.                         * U7C00170
                    *      * CADDR OF USER,S TABLE FOR STORING THE    * U7C00180
                    *         CONVERTED AND PACKED NUMBERS IS PLACED  * U7C00190
                    *         IN THE ACCUMULATOR BEFORE CALLING RDREC * U7C00200
                    *       * USING THE REGUESTED SUBROUTINES THE *ID * U7C00210
                    *         RECORD IS READ,CONVERT AND STORED IN A  * U7C00220
                    *         USER@S AREA                             * U7C00230
                    *       * THE USER'S TABLE CONTAINS A BINARY TABLE* U7C00240
                    *         A FROM-TO ENTRY COUNT AND A FROM-TO     * U7C00250
                    *         TABLE IN PACKED EBCDIC FOR PRINTING.    * U7C00260
                    *       * INVALID *ID RECORDS ARE CHECKED         * U7C00270
                    *       * THE FROM-TO NUMBERS ARE CHECKED FOR     * U7C00280
                    *         VALIDITY.                               * U7C00290
                    *       * PRINT *ID RECORD USING PRINCIPAL PRINT  * U7C00300
                    *         SUBROUTINES.                            * U7C00310
                    *       * THE ADDRESS OF THE ENTRY POINT TO THE   * U7C00320
                    *         PRINCIPAL PRINT SUBROUTINE IS PLACE IN  * U7C00330
                    *         THE ACCUMULATOR FOR THE USER.           * U7C00340
                    *                                                 * U7C00350
                    *                                                 * U7C00360
                    * ENTRY POINTS-                                   * U7C00370
                    *    *RDREC-USER ENTRY                            * U7C00380
                    *                                                 * U7C00390
                    * INPUT-                                          * U7C00400
                    *    **ID RECORD                                  * U7C00410
                    *                                                 * U7C00420
                    * OUTPUT-                                         * U7C00430
                    *    * ERROR MESSAGE                              * U7C00440
                    *    * *ID RECORD PRINT-OUT                       * U7C00450
                    *    * SIGNOFF MESSAGE.                           * U7C00460
                    *                                                 * U7C00470
                    * EXTERNAL REFERENCES-                            * U7C00480
                    *    SUBROUTINES                                  * U7C00490
                    *       *  FSLEN                                  * U7C00500
                    *       *  FSYSU                                  * U7C00510
                    *    COMMA/DCOM-                                  * U7C00520
                    *       * DZ000                                   * U7C00530
                    *       * $PBSY                                   * U7C00540
                    *       * $IBSY                                   * U7C00550
                    *       * $LAST                                   * U7C00560
                    *       * $DBSY                                   * U7C00570
                    *       * $EXIT                                 2-9 U7C00575
                    * EIXTS                                           * U7C00580
                    *    NORMAL -RM440                                * U7C00590
                    *    ERROR -BRANCH TO $EXIT                     2-9 U7C00595
                    *                                                 * U7C00600
                    * TABLES/WORK AREAS-                              * U7C00610
                    *    * RR950- *IO RECORD AREA                     * U7C00620
                    *      RR900-                                     * U7C00630
                    *      RR901-                                     * U7C00640
                    *                                                 * U7C00650
                    *                                                 * U7C00660
                    * ATTRIBUTES-                                     * U7C00670
                    *    RELOCATABLE                                  * U7C00680
                    *                                                 * U7C00690
                    *NOTES-N/A                                        * U7C00700
                    *                                                 * U7C00710
                    *                                                 * U7C00720
                    *************************************************** U7C00730
                          HDNG    SYSTEMS  EQUATES                      U7C00740
                    DZ000 EQU     /0F2 DISK ENTRY POINT                 U7C00750
                    $IBSY EQU     /13  PRINC I/O BUSY INDR,NON-ZERO=BSY U7C00760
                    $LAST EQU     /33  LAST CD INDR,NON-ZERO=LAST CARD  U7C00770
                    $DBSY EQU     /EE  DISK BUSY INDR,NON-ZERO=DK BUSY  U7C00780
                    $PBSY EQU     /36  PRINC PTR BUSY INDR,NON-ZERO=BSY U7C00790
                          HDNG    -RDREC- READ *ID RECORD               U7C00800
                    RDREC DC      *-*                                   U7C00810
                          STX  L1 RM430+1   SAVE XR1                    U7C00820
                          STX  L2 RM440+1   SAVE XR2                    U7C00830
                          STO  L  RM280     STORE USER'S TABLE ADDR.    U7C00840
                          STO  L  RM075+1                               U7C00850
                          STO  L  RM085+1                               U7C00860
                          STO  L  RM086+1                               U7C00870
                          STO  L  RM425+1                               U7C00880
                          LDX   2 RM160                                 U7C00890
                    *************************************************** U7C00900
                    * FETCH THE WORD COUNT AND SECTOR ADDRESS OF THE  * U7C00910
                    * PRINCIPAL INPUT DEVICE.                         * U7C00920
                    *************************************************** U7C00930
                    RM010 CALL    FSLEN     FETCH WD CNT-SECTOR ADDRESS U7C00940
                          DC      154                                   U7C00950
                          BSC     +-        SKIP IF FOUND               U7C00960
                          MDX     RM010     TRY AGAIN                   U7C00970
                    *                                                   U7C00980
                    *************************************************** U7C00990
                    * CALL IN THE PRINCIPAL INPUT DEVICE SUBROUTINE   * U7C01000
                    *************************************************** U7C01010
                    *                                                   U7C01020
                    RM020 CALL    FSYSU                                 U7C01030
                          STO  L  RM270     STORE SUBR ENTRY POINT      U7C01040
                          MDX  L  $LAST,0                               U7C01050
                          MDX     RM021                                 U7C01060
                          MDX     RM025                                 U7C01070
                    RM021 LD      RM170                                 U7C01080
                          SRT     16                                    U7C01090
                          LD      RM185     FEED REQUEST FOR 1442       U7C01100
                          BSI  I  RM270                                 U7C01110
                    RM025 LD      RM170     FETCH WD CNT ADDRESS        U7C01120
                          SRT     16                                    U7C01130
                          LD      RM180     FETCH FUNCTION CODE         U7C01140
                          BSI  I  RM270     GO TO GET *ID RCD           U7C01150
                          MDX  L  $IBSY,0                               U7C01160
                          MDX     *-3                                   U7C01170
                    *                                                   U7C01180
                    *************************************************** U7C01190
                    * FETCH WORD COUNT AND SLET ADDRESS OF CONV SUBR  * U7C01200
                    *************************************************** U7C01210
                    *                                                   U7C01220
                    RM030 CALL    FSLEN                                 U7C01230
                          DC      156       PHASE ID                    U7C01240
                          BSC     +-        SKIP IF FOUND               U7C01250
                          MDX     RM030     TRY AGAIN                   U7C01260
                    *                                                   U7C01270
                    *************************************************** U7C01280
                    * CALL PRINCIPAL CONVERSION SUBR                  * U7C01290
                    *************************************************** U7C01300
                    *                                                   U7C01310
                          CALL    FSYSU                                 U7C01320
                          STO     RM270     SAVE ENTRY POINT            U7C01330
                          LD      RM170     LOAD WD CNT ADDR            U7C01340
                          BSI  I  RM270     TO CONVRT SUBR              U7C01350
                    *************************************************** U7C01360
                    * TEST FOR VALID *ID RECORD                       * U7C01370
                    *************************************************** U7C01380
                    *                                                   U7C01390
                          LD      RM320     LD * OF ID RCD              U7C01400
                          S       RM190                                 U7C01410
                          BSC     Z         SKIP IF *                   U7C01420
                          MDX     RM120     ERROR                       U7C01430
                          LD      RM320+1   LD I                        U7C01440
                          S       RM200                                 U7C01450
                          BSC     Z         SKIP IF I                   U7C01460
                          MDX     RM120     ERROR                       U7C01470
                          LD      RM320+2   LD 3RD CHAR IN RCD      2-9 U7C01472
                          S       RM260     CHECK FOR CHAR=D        2-9 U7C01474
                          BSC     Z         SKIP IF D               2-9 U7C01476
                          MDX     RM120     BR TO PR ERROR AND EXIT 2-9 U7C01478
                    *                                                   U7C01480
                    *************************************************** U7C01490
                    * CHECK FOR END OF FROM-TO FIELDS                 * U7C01500
                    * PACK THE  EBCDIC NO. AND STORE IN THE USER PRINT* U7C01510
                    * TABLE.                                          * U7C01520
                    * CONVERT EBCDIC NO. TO BINARY AND STORE IN USER'A* U7C01530
                    * BINARY FROM-TO TABLE. PLACE COUNT OF FROM-TO    * U7C01540
                    * FIELDS IN USER'S TABLE                          * U7C01550
                    *                                                 * U7C01560
                    *************************************************** U7C01570
                    *                                                   U7C01580
                          LDX   1 RM140     FETCH FROM FIELD ADDR       U7C01590
                    RM040 LD   L1 RM330     FETCH FROM NO.              U7C01600
                          EOR     RM210     TEST IF BLANK               U7C01610
                          BSC     +-        NOT BLANK, SKIP             U7C01620
                          MDX     RM130     END OF FROM-TO FIELDS       U7C01630
                    *                                                   U7C01640
                          LD      RM290     FETCH COUNT                 U7C01650
                          S       RM220     SUB FOUR                    U7C01660
                          BSC     -                                     U7C01670
                          MDX     RM130     END OF FROM-TO FIELDS       U7C01680
                          A    L  RM740     ADD FIVE                    U7C01690
                          STO     RM290                                 U7C01700
                    *                                                   U7C01710
                    *************************************************** U7C01720
                    * PACK AND STORE FROM-TO FIELDS                   * U7C01730
                    *************************************************** U7C01740
                    *                                                   U7C01750
                          STX   2 RM060+1   SAVE XR2                    U7C01760
                    RM050 LDX  L2 RM150                                 U7C01770
                          BSI     RM070     PACK AND STORE FROM FIELD   U7C01780
                          MDX   2 +1                                    U7C01790
                          MDX   1 +2                                    U7C01800
                          BSI     RM070                                 U7C01810
                          MDX   2 4         PACK AND STORE TO FIELD     U7C01820
                          MDX   1 3                                     U7C01830
                          BSI     RM070                                 U7C01840
                          MDX   2 1                                     U7C01850
                          MDX   1 2                                     U7C01860
                          BSI     RM070                                 U7C01870
                          MDX   2 10        SET FOR NEXT FROM FIELD     U7C01880
                          STX  L2 RM050+1   SAVE FOR NEXT 'FROM' PROC.  U7C01890
                    RM060 LDX  L2 *-*       SET XR2 FOR BINARY TABLE    U7C01900
                          MDX   1 -7        RESET XR1 FOR BINARY CONVRT U7C01910
                          MDX     *         DUMMY                       U7C01920
                          MDX     RM080                                 U7C01930
                    *                                                   U7C01940
                    RM070 DC      *-*       ENTRY FOR PACK AND STORE    U7C01950
                          LD   L1 RM340     PACK                        U7C01960
                          SRT     8                                     U7C01970
                          LD   L1 RM330                                 U7C01980
                          SLT     8                                     U7C01990
                    RM075 STO  L2 *-*       STORE TO USER'S AREA        U7C02000
                          BSC  I  RM070     RETURN                      U7C02010
                    *************************************************** U7C02020
                    * BINARY CONVERSION AND STORE                     * U7C02030
                    *************************************************** U7C02040
                    *                                                   U7C02050
                    RM080 BSI     RM090     TO CONVERT FROM FIELD       U7C02060
                    RM085 STO  L2 *-*       STORE FOR USER              U7C02070
                          MDX   1 +5        SETUP FOR TO FIELD          U7C02080
                          MDX   2 +1                                    U7C02090
                          BSI     RM090     CONVERT TO FIELD            U7C02100
                    RM086 STO  L2 *-*                                   U7C02110
                          MDX     RM110                                 U7C02120
                    *                                                   U7C02130
                    RM090 DC      *-*       ENTRY/EXIT                  U7C02140
                          LD   L1 RM330     FETCH NO. TO BE CONVERTED   U7C02150
                          STO     RM100                                 U7C02160
                          LD   L1 RM340                                 U7C02170
                          STO     RM100+1                               U7C02180
                          LD   L1 RM350                                 U7C02190
                          STO     RM100+2                               U7C02200
                          LD   L1 RM360                                 U7C02210
                          STO     RM100+3                               U7C02220
                    *                                                   U7C02230
                    *************************************************** U7C02240
                    * GO TO CONVERSION SUBROUTINE                     * U7C02250
                    *************************************************** U7C02260
                          BSI  L  RM500                                 U7C02270
                    RM100 DC      *-*       NO. TO BE CONVRT.           U7C02280
                          DC      *-*                                   U7C02290
                          DC      *-*                                   U7C02300
                          DC      *-*                                   U7C02310
                          MDX     RM120                                 U7C02320
                          BSC  I  RM090     RETURN                      U7C02330
                    *************************************************** U7C02340
                    * SETUP FOR NEXT FROM-TO FIELDS                   * U7C02350
                    *************************************************** U7C02360
                    *                                                   U7C02370
                    RM110 MDX   1 5         TO NEXT FROM FIELD          U7C02380
                          MDX   2 1         INCR BINARY TABLE CNT       U7C02390
                          MDX     RM040     GET NEXT NUMBER             U7C02400
                    RM120 BSC  L  RM480                                 U7C02410
                    *                                                   U7C02420
                    RM130 MDX     RM420     BR PR RCD AND BACK TO ML    U7C02430
                    *                                                   U7C02440
                          HDNG    RDREC- EQUATES                        U7C02450
                    *************************************************** U7C02460
                    RM140 EQU     0                                     U7C02470
                    RM150 EQU     12                                    U7C02480
                    RM160 EQU     2                                     U7C02490
                    *                                                   U7C02500
                          HDNG    RDREC- CONSTANTS                      U7C02510
                    *************************************************** U7C02520
                          BSS  E  0                                     U7C02530
                    RM170 DC      RM310     ADDRESS OF *ID WD CNT       U7C02540
                    RM180 DC      /7002     FUNCTION CODE-INPUT RTN     U7C02550
                    RM185 DC      /7003                                 U7C02560
                    RM190 DC      /005C     * CODE                      U7C02570
                    RM200 DC      /00C9     I                           U7C02580
                    RM210 DC      /0040     BLANK                       U7C02590
                    RM220 DC      4         FOUR                        U7C02600
                    RM230 DC      1         ONE                         U7C02610
                    RM240 DC      40                                    U7C02620
                    RM250 DC      /7001     PRINT FUNCTION CODE         U7C02630
                    RM260 DC      /00C4     EBCDIC D                2-9 U7C02640
                    RM265 DC      /00C5     E                           U7C02650
                          DC      /00D9     R                           U7C02660
                          DC      /00D9     R                           U7C02670
                          DC      /00D6     0                           U7C02680
                          DC      /00D9     R                           U7C02690
                          HDNG    RDREC -WORKING STORAGE                U7C02700
                    *************************************************** U7C02710
                    *                                                   U7C02720
                          BSS  E  0                                     U7C02730
                    RM270 DC      *-*       SYSTEM SUBR ENTRY POINT     U7C02740
                    RM280 DC      *-*       USER'S TABLE ADDRESS        U7C02750
                    RM290 DC      *-*       FIELD COUNT                 U7C02760
                    RM300 DC                                            U7C02770
                          HDNG    RDREC- I/O AREAS                      U7C02780
                    *************************************************** U7C02790
                    *                                                   U7C02800
                          BSS  E  1                                     U7C02810
                    RM310 DC      80        WD CNT OF *ID RECORD        U7C02820
                    RM320 BSS     3         AREA                        U7C02830
                    RM330 DC      *-*       FROM FIELD 1                U7C02840
                    RM340 DC      *-*                                   U7C02850
                    RM350 DC      *-*                                   U7C02860
                    RM360 DC      *-*                                   U7C02870
                    RM370 DC      *-*       COMMA                       U7C02880
                    RM380 DC      *-*       TO FIELD 1                  U7C02890
                    RM390 DC      *-*                                   U7C02900
                    RM400 DC      *-*                                   U7C02910
                    RM410 DC      *-*                                   U7C02920
                          DC      *-*       COMMA                       U7C02930
                          BSS     35        FROM-TO FIELDS 2-4          U7C02940
                    RM415 BSS     32                                    U7C02950
                          HDNG    FROM-TO FIELD PROCESSING              U7C02960
                    *************************************************** U7C02970
                    * END OF FROM-TO FIELDS                           * U7C02980
                    * STORE FROM-TO CNT IN USER TABLE                 * U7C02990
                    * CHECK FOR MISSING FROM NO. IN FIRST FIELD       * U7C03000
                    *                                                 * U7C03010
                    *************************************************** U7C03020
                    *                                                   U7C03030
                    RM420 LD      RM290     TEST FIRST FROM FIELD       U7C03040
                          BSC     +                                     U7C03050
                          MDX     RM480     ERROR                       U7C03060
                          LDX   2 1                                     U7C03070
                    RM425 STO  L2 *-*       STORE CNT FOR USER          U7C03080
                          BSI     RM450     PRINT *ID RECORD            U7C03090
                    RM430 LDX  L1 *-*       RESET USER'A XR             U7C03100
                    RM440 LDX  L2 *-*                                   U7C03110
                          LD      RM270     ENTRY POINT                 U7C03120
                          BSC  I  RDREC     RETURN                      U7C03130
                    *                                                   U7C03140
                    *                                                   U7C03150
                          HDNG    RDREC PRINT AND CONVERSION SUBRS      U7C03160
                    *************************************************** U7C03170
                    RM450 DC      *-*       ENTRY FOR PRINT             U7C03180
                          LDX   2 0                                     U7C03190
                    *                                                   U7C03240
                    RM452 LDX   1 -80        COLUMN CNT                 U7C03250
                    RM460 LD   L1 RM320+81  PACKED *ID RECD FOR PRINT   U7C03260
                          SRT     8                                     U7C03270
                          LD   L1 RM320+80                              U7C03280
                          SLT     8                                     U7C03290
                          STO  L2 RM320                                 U7C03300
                          MDX   2 1                                     U7C03310
                          MDX   1 +2        SKIP WHEN RECD PACKED       U7C03320
                          MDX     RM460     GET NEXT CHAR               U7C03330
                    *************************************************** U7C03340
                    * CALL FSLEN TO GET WD CNT AND SECT ASSR FOR PTR    U7C03350
                    *************************************************** U7C03360
                    RM470 CALL    FSLEN                                 U7C03370
                          DC      153                                   U7C03380
                          BSC     +-        SKIP IF FOUND               U7C03390
                          MDX     RM470     TRY AGAIN                   U7C03400
                    *                                                   U7C03410
                    *************************************************** U7C03420
                    * CALL IN PRINCIPAL PRINT SUBROUTINE              * U7C03430
                    *************************************************** U7C03440
                    *                                                   U7C03450
                    *                                                   U7C03460
                          CALL    FSYSU     CALL PRINT SUBROUTINE       U7C03470
                          STO     RM270     STORE ENTRY POINT           U7C03480
                          LD   L  RM240     FETCH WD CNT                U7C03490
                          STO     RM310                                 U7C03500
                          LD   L  RM170     FETCH WD CNT ADDRESS        U7C03510
                          SRT     16                                    U7C03520
                          LD   L  RM250                                 U7C03530
                          BSI  I  RM270     GO TO PRINT *ID RECORD      U7C03540
                          MDX  L  $PBSY,0                               U7C03550
                          MDX     *-3                                   U7C03560
                          BSC  I  RM450     RETURN                      U7C03570
                    *                                                   U7C03580
                    RM267 DC      /006B      COMMA                      U7C03660
                    *                                                   U7C03670
                    RM480 LDX   1 -5                                    U7C03680
                    RM490 LD   L1 RM265+5   SETUP ERROR                 U7C03690
                          STO  L1 RM415                                 U7C03700
                          MDX   1 +1        SKIP IF ZERO                U7C03710
                          MDX     RM490                                 U7C03720
                          BSI     RM450     PRINT                       U7C03730
                          EXIT              EXIT TO TERMINATE OP    2-9 U7C03740
                          HDNG    NUMBER CONVERSION SUBROUTINE          U7C03750
                    *************************************************** U7C03760
                    *                                                 * U7C03770
                    *                 BSI  L  RM500                   * U7C03780
                    *                DC      A                        * U7C03790
                    *                DC      B                        * U7C03800
                    *                DC      C                        * U7C03810
                    *                DC      D                        * U7C03820
                    *                MDX     BR TO ERROR ROUTINE      * U7C03830
                    *             WHERE A,B,C,D ARE THE 4 NUMBERS TO  * U7C03840
                    *             BE CONVERTED.                       * U7C03850
                    *      THE CONVERTED BINARY NUMBER IS RETURNING IN* U7C03860
                    *       THE ACCUMULATOR.                          * U7C03870
                    *                                                 * U7C03880
                    *                                                 * U7C03890
                    *************************************************** U7C03900
                    *                                                   U7C03910
                    *                                                   U7C03920
                    RM500 DC      *-*       ENTRY                       U7C03930
                          STX   1 RM590+1                               U7C03940
                          LD      RM500     SET RETURN EXITS            U7C03950
                          A       RM730     ERROR                       U7C03960
                          STO     RM640                                 U7C03970
                          A       RM680     NORMAL                      U7C03980
                          STO     RM650                                 U7C03990
                          LDX   1 -4                                    U7C04000
                          STX   0 RM530+1   SETUP UNPACKED LOCATION     U7C04010
                    RM510 LD      RM530+1                               U7C04020
                          A       RM660                                 U7C04030
                          STO     RM530+1                               U7C04040
                          S       RM740     SETUP UNPACKED ADDRESS      U7C04050
                          STO     RM570+1   *AND STORE                  U7C04060
                          STO     RM560+1                               U7C04070
                          STO     RM550+1                               U7C04080
                          STO     RM540+1                               U7C04090
                          STO     RM542+1   STO ADDR OF RM620       2-9 U7C04092
                          STO     RM545+1                           2-9 U7C04094
                          LD      RM500     SETUP SENDING FIELD ADDR    U7C04100
                          STO     *+1                                   U7C04110
                    RM520 LD   L  *-*       FETCH UNPACKED NO.          U7C04120
                    RM530 STO  L1 *-*                                   U7C04130
                          LD      RM520+1   INCR SENDING FIELD ADDR.    U7C04140
                          A       RM680                                 U7C04150
                          STO     RM520+1                               U7C04160
                          MDX   1 1         SKIP WHEN 4 DIGITS STORED   U7C04170
                          MDX     RM520     GET NEXT DIGIT              U7C04180
                    *                                                   U7C04190
                    *************************************************** U7C04200
                    * THE FOLLOWING ROUTINE CONVERTS 4 UNPACKED EBCDIC* U7C04210
                    * WORDS OF DATA TO ONE WORD OF BINARY DATA WITHIN * U7C04220
                    * THE LIMITS OF /0000 TO /FFFF.                   * U7C04230
                    *************************************************** U7C04240
                          LDX   1 4                                     U7C04250
                    RM540 LD   L1 *-*       FETCH DIGIT                 U7C04260
                          S       RM750     CHECK IF EBCDIC BLANK   2-9 U7C04261
                          BSC  L  RM545,Z   BR IF NOT BLANK         2-9 U7C04262
                          LD      RM690     FETCH EBCDIC ZERO       2-9 U7C04263
                    RM542 STO  L1 *-*       REPLACE BL WITH ZERO    2-9 U7C04264
                    RM545 LD   L1 *-*       FETCH CHAR AGAIN        2-9 U7C04265
                          EOR     RM690     GT THAN 9                   U7C04270
                          SRT     4                                     U7C04280
                          BSC     +-                                    U7C04290
                          MDX     RM580     GET NEXT WORD               U7C04300
                    *                                                   U7C04310
                    *************************************************** U7C04320
                    * IF THE NUMBER IS GT /0009 IT IS CHECKED FOR A   * U7C04330
                    * VALID EBCDIC CHAR TO DENOTE THE HEX VALUES OF   * U7C04340
                    * A THRU F.                                       * U7C04350
                    *************************************************** U7C04360
                          SLT     4                                     U7C04370
                          LD      RM670     FETCH /F MASK               U7C04380
                    RM550 S    L1 *-*                                   U7C04390
                          BSC     Z+                                    U7C04400
                          MDX     RM600     HIGH VALUE EXCEEDED         U7C04410
                    *                                                   U7C04420
                          LD      RM700                                 U7C04430
                    RM560 S    L1 *-*                                   U7C04440
                          BSC     Z-                                    U7C04450
                          MDX     RM600     VALUE LESS THAN /A          U7C04460
                    *                                                   U7C04470
                    RM570 LD   L1 *-*                                   U7C04480
                          A       RM710     CONVERT HEX TO BINARY       U7C04490
                          RTE     4         SAVE IN QREG                U7C04500
                    RM580 MDX   1 -1                                    U7C04510
                          MDX     RM540     NEXT NO.                    U7C04520
                    *                                                   U7C04530
                          RTE     16        FETCH BINARY NO.            U7C04540
                    RM590 LDX  L1 *-*       RESTORE XR1                 U7C04550
                          BSC  I  RM650                                 U7C04560
                    *                                                   U7C04570
                    RM600 LDX  L1 *-*       RESTORE XR1                 U7C04580
                          HDNG    CONVERSION CONSTANTS AND WORK AREA    U7C04590
                    RM610 BSC  I  RM640     RETURN TO ERROR EXIT        U7C04600
                    RM620 BSS  E  4         UNPACKED NO.                U7C04610
                    RM630 DC      *-*       PACKED NO.                  U7C04620
                    RM640 DC      *-*       ERROR RETURN ADDRESS        U7C04630
                    RM650 DC      *-*       NORMAL RETURN               U7C04640
                    RM660 DC      RM630-RM510 ADDRESS OF UNPACK NO.     U7C04650
                    RM670 DC      /00C6     HIGH LIMIT MASK             U7C04660
                    RM680 DC      1         ADDRESS MODIFIER            U7C04670
                    RM690 DC      /00F0     GT 9 MASK                   U7C04680
                    RM700 DC      /00C1     LOW LIMIT MASK              U7C04690
                    RM710 DC      /0009     USED FOR CONVERTING.        U7C04700
                    RM720 DC      /00F9     MASK FOR LAST WORD          U7C04710
                    RM730 DC      4         ADDRESS COMPUTING FACTOR    U7C04720
                    RM740 DC      5                                     U7C04730
                    RM750 DC      /0040     EBCDIC BLANK            2-9 U7C04745
                          END                                           U7C04755
