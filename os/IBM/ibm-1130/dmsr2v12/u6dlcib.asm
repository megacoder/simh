                          HDNG    DLCIB-DELETE CIB  FROM NON-SYST CARTS U6D00010
                    *************************************************** U6D00020
                    * STATUS- VERSION 2, MODIFICATION LEVEL 12        * U6D00030
                    *                                                 * U6D00040
                    * FUNCTION/OPERATION-                             * U6D00050
                    *    THIS PROGRAM DELETES THE CORE IMAGE BUFFER   * U6D00060
                    *    FROM A NON-SYSTEMS CARTRIDGE. THE CARTRIDGE  * U6D00070
                    *    TO HAVE THE CIB DELETED IS SPECIFIED BY A    * U6D00080
                    *    *ID RECORD. THE *ID RECORD IS READ BY THE    * U6D00090
                    *    PRINCIPAL INPUT DEVICE USING THE CALLED      * U6D00100
                    *    SUBROUTINE RDREC. THE SUBROUTINE ALSO PRINTS * U6D00110
                    *    THE *ID RECORD, CONVERTS THE CARTRIDGE ID    * U6D00120
                    *    NUMBER FROM HEX TO BINARY.                   * U6D00130
                    *                                                 * U6D00140
                    *    THE KEYBOARD REQUEST INTERRUPT IS LOCKOUT    * U6D00150
                    *    UNTIL THE DELETION HAS BEEN COMPLETED. AT    * U6D00160
                    *    THAT TIME IT IS RESTORED.                    * U6D00170
                    *                                                 * U6D00180
                    *    WHEN THE CORE IMAGE IS DELETED THE           * U6D00190
                    *    USERS AREA AND WORKING STORAGE IS MOVE DOWN  * U6D00200
                    *    TO REPLACE THE CIB. ALL THE ENTRIES IN THE   * U6D00210
                    *    RESIDENT MONITOR FOR THIS CARTRIDGE ARE      * U6D00220
                    *    ALTERED ACORDINGLY. THE DCOMS OF THE         * U6D00230
                    *    SPECIFIED CARTRIDGE AND THE SYSTEM CARTRIDGE * U6D00240
                    *   ARE ALSO ALTERED.                             * U6D00250
                    *                                                 * U6D00260
                    *    THE SIGN-OFF MESSAGE IS PRINTED ON THE       * U6D00270
                    *    SYSTEM PRINT DEVICE.                         * U6D00280
                    *                                                 * U6D00290
                    * ENTRY POINTS-                                   * U6D00300
                    *    *DL001 -BEGINNING OF THE PROGRAM             * U6D00310
                    *                                                 * U6D00320
                    * INPUT-                                          * U6D00330
                    *    * *ID RECORD FROM PRINCIPAL INPUT DEVICE     * U6D00340
                    *    * DISK CARTRIDGE SPECIFIED                   * U6D00350
                    *    * SYSTEM CARTRIDGE DECOM                     * U6D00360
                    *                                                 * U6D00370
                    * OUTPUT-                                         * U6D00380
                    *    * SYSTEM CARTRIDGE DECOM                     * U6D00390
                    *    * SPECIFIED CARTRIDGE                        * U6D00400
                    *    * MESSAGES ON PRINCIPAL PRINT DEVICE         * U6D00410
                    *                                                 * U6D00420
                    * EXTERNAL REFERENCES-                            * U6D00430
                    *    SUBROUTINES                                  * U6D00440
                    *    *RDREC- READ AND CONVERT *ID RECORD          * U6D00450
                    *    COMMA/DCOM-                                  * U6D00460
                    *    *$FPAD                                       * U6D00470
                    *    *#FPAD                                       * U6D00480
                    *    *DZ000                                       * U6D00490
                    *    *$DBSY                                       * U6D00500
                    *    *#CIBA                                       * U6D00510
                    *    *$ACDE                                       * U6D00520
                    *    *#CIDN                                       * U6D00530
                    *    *#ULET                                       * U6D00540
                    *    *$IREQ                                       * U6D00550
                    *    *$I410                                       * U6D00560
                    *    *$PBSY                                       * U6D00570
                    *                                                 * U6D00580
                    * EXITS-                                          * U6D00590
                    *    NORMAL- CALL EXIT                            * U6D00600
                    *                                                 * U6D00610
                    *    ERROR-N/A                                    * U6D00620
                    *                                                 * U6D00630
                    * TABLES/WORK AREAS-                              * U6D00640
                    *    *DL921-DL925   WORK ARE FOR BINARY TO HEX    * U6D00650
                    *    *DL900-DL910   WORK AREAS                    * U6D00660
                    *    *DL940         TABLE FOR CART IDS            * U6D00670
                    *    *DL951         PRINT LINE                    * U6D00680
                    *    *DL964         DCOM AREA                     * U6D00690
                    *    *DL970         DISK I/O                      * U6D00700
                    *                                                 * U6D00710
                    * ATTRIBUTES-                                     * U6D00720
                    *    *RELOCATABLE                                 * U6D00730
                    *                                                 * U6D00740
                    * NOTES-                                          * U6D00750
                    *    N/A                                          * U6D00760
                    *                                                 * U6D00770
                    *                                                 * U6D00780
                    *                                                 * U6D00790
                    *************************************************** U6D00800
                          HDNG    DLCIB- DELETE CIB OF NON-SYTEM CARTS. U6D00810
                    $IREQ EQU     /2C  ADDR OF INT REQUEST SUBROUTINE   U6D00820
                    $PBSY EQU     /36  PRINC PTR BUSY INDR,NON-ZERO=BSY U6D00830
                    $FPAD EQU     /95  FILE PROTECT ADDR (ADJ),LOG DR 0 U6D00840
                    $ACDE EQU     /9F  AREA CODE FOR LOGICAL DRIVE 0    U6D00850
                    $I410 EQU     /D6                                   U6D00860
                    $DBSY EQU     /EE  DISK BUSY INDR,NON-ZERO=DK BUSY  U6D00870
                    DZ000 EQU     /0F2 DISKZ ENTRY POINT                U6D00880
                    #ANDU EQU     35   ADDR OF END OF UA (ADJUSTED) 2-4 U6D00886
                    #BNDU EQU     40   ADDR OF END OF UA (BASE)     2-4 U6D00888
                    #FPAD EQU     45   FILE PROTECT ADDR (BASE)LOG DR 0 U6D00890
                    #CIDN EQU     55   CARTRIDGE ID FOR LOGICAL DRIVE 0 U6D00900
                    #CIBA EQU     60   ADDR OF CIB FOR LOGICAL DRIVE 0  U6D00910
                    #ULET EQU     80   ADDR OF  LET, LOGICAL DRIVE 0    U6D00920
                    #DCOM EQU     1    SCTR CONTAINING DCOM             U6D00930
                    *************************************************** U6D00940
                    * FETCH *ID RECORD USING RDREC SUBROUTINE         * U6D00950
                    *************************************************** U6D00960
                    *                                                   U6D00970
                    DL000 DC      DL940     TABLE ADDRESS               U6D00980
                    DL001 LD      DL000                                 U6D00990
                          CALL    RDREC     READ *ID RECORD             U6D01000
                          LDX  L1 DX                                    U6D01010
                          STO     DL000     STORE SYSTEM SUBR ENTRY     U6D01020
                    DL010 LD   L  $IREQ     SAVE KB INTRPT RTN ENTRY    U6D01030
                    *************************************************** U6D01040
                    * LOCKOUT KEYBOARD REQUEST                          U6D01050
                    *************************************************** U6D01060
                          STO   1 DL900-DX                              U6D01070
                          LD    1 DL901-DX                              U6D01080
                          STO  L  $IREQ                                 U6D01090
                          LD    1 DL800-DX                              U6D01100
                          STO  L  DL500     ZERO ENTRY POINT            U6D01110
                    *                                                   U6D01120
                    *************************************************** U6D01130
                    * FETCH SYSTEM CARTRIDGE DCOM                     * U6D01140
                    *************************************************** U6D01150
                    *                                                   U6D01160
                    DL020 LD    1 DL810-DX  FETCH I/P ADDR              U6D01170
                          SRT     16                                    U6D01180
                          LD    1 DL811-DX  FETCH FUNCTION CODE         U6D01190
                          BSI  L  DZ000                                 U6D01200
                    DL021 MDX  L  $DBSY,0                               U6D01210
                          MDX     DL021     BUSY                        U6D01220
                    *************************************************** U6D01230
                    * SEARCH DCOM AND THE AVAILABLE CARTRIDGES FOR    * U6D01240
                    * THE SPECIFIED CARTRIDGE                         * U6D01250
                    *************************************************** U6D01260
                    *                                                   U6D01270
                          LD    1 DL804-DX                              U6D01280
                          STO  L  DL049                                 U6D01290
                          LDX  L2 DC        DCOM ADDRESS                U6D01300
                    DL030 LD   L2 #CIDN     FETCH CARTRIDGE ID          U6D01310
                          S     1 DL942-DX                              U6D01320
                          BSC     +-        CART ID NOT FOUND-SKIP      U6D01330
                          MDX     DL050                                 U6D01340
                    *                                                   U6D01350
                          MDX   2 +1                                    U6D01360
                          MDX  L  DL049,-1                              U6D01370
                          MDX     DL030     NEXT CARTRIDGE              U6D01380
                    *                                                   U6D01390
                    *************************************************** U6D01400
                    *IF THE CART ID IS NOT IN DCOM  SEARCH THE CARTS. * U6D01410
                    *************************************************** U6D01420
                    *                                                   U6D01430
                          LDX   2 4                                     U6D01440
                    DL035 LD   L2 $ACDE     FETCH DISK DRIVE AREA CODE  U6D01450
                          BSC     Z                                     U6D01460
                          MDX     DL040     DRIVE AVAILABLE             U6D01470
                    *                                                   U6D01480
                    DL036 MDX   2 -1        ALL DRIVE TESTED IF ZERO    U6D01490
                          MDX     DL035     NEXT DRIVE                  U6D01500
                    *                                                   U6D01510
                          BSI  L  DL300     TO ERROR PRINT              U6D01520
                    *                                                   U6D01530
                          BSI  L  DL450     TO KB RESET RTN             U6D01540
                    *                                                   U6D01550
                          EXIT              E O J  ERROR CONDITION      U6D01560
                    *************************************************** U6D01570
                    * SETUP TO READ AND CHECK ID OF AVAILABLE CARTS   * U6D01580
                    *************************************************** U6D01590
                    *                                                   U6D01600
                    DL920 DC      *-*       SAVE DRIVE NO.              U6D01610
                    DL040 STX   2 DL920     XR2 CONTAINS DRIVE NO.      U6D01620
                          LD      DL920                                 U6D01630
                          SLA     12        PLACE IN DRIVE NO POSITION  U6D01640
                          STO  L  DL971     STORE IN I/O HEADER         U6D01650
                          STO   1 DL902-DX  SAVE DRIVE NO.              U6D01660
                          LD    1 DL817-DX  FETCH I/O HEADER            U6D01670
                          SRT     16                                    U6D01680
                          LD    1 DL811-DX  FETCH FUNCTION CODE         U6D01690
                          BSI  L  DZ000                                 U6D01700
                    DL041 MDX  L  $DBSY,0   SKIP IF COMPLETE            U6D01710
                          MDX     DL041                                 U6D01720
                    *                                                   U6D01730
                    *                                                   U6D01740
                          LD   L  DL972+3   FETCH CART ID               U6D01750
                          S     1 DL942-DX                              U6D01760
                          BSC     Z                                     U6D01770
                          MDX     DL036     ID NOT SAME-GET NEXT CART   U6D01780
                    *                                                   U6D01790
                    DL045 BSI  L  DL100     TO DELETE                   U6D01800
                    *                                                   U6D01810
                          BSI  L  DL200     TO PRINT END MESSAGE        U6D01820
                    *                                                   U6D01830
                          EXIT              END OF PROGRAM              U6D01840
                    *                                                   U6D01850
                    *************************************************** U6D01860
                    *SETUP FOR DELETE OF CART FOUND IN DCOM           * U6D01870
                    *************************************************** U6D01880
                    DL049 DC      *-*                                   U6D01890
                    DL050 LD    1 DL804-DX                              U6D01900
                          S       DL049                                 U6D01910
                          STO   1 DL910-DX                              U6D01920
                          SLA     12                                    U6D01930
                          STO  L  DL971                                 U6D01940
                          STO   1 DL902-DX                              U6D01950
                          MDX     DL045     DELETE CIB                  U6D01960
                    *                                                   U6D01970
                    *                                                   U6D01980
                          HDNG    DLCIB- DELETE CIB                     U6D01990
                    *************************************************** U6D02000
                    * DELETE CIB FROM SPECIFIED CARTRIDGE             * U6D02010
                    * UPDATE COMMA AND DCOM                           * U6D02020
                    *************************************************** U6D02030
                    *                                                   U6D02040
                    DL100 DC      *-*       ENTRY/EXIT                  U6D02050
                          LD    1 DL819-DX  FETCH WD COUNT              U6D02060
                          STO  L  DL970                                 U6D02070
                          LD    1 DL902-DX  FETCH DRIVE NO.             U6D02080
                          A     1 DL801-DX  INCR TO SCTR 1              U6D02090
                          STO  L  DL971                                 U6D02100
                          LD    1 DL817-DX  FETCH WD CNT-SCTR ADDR      U6D02110
                          SRT     16                                    U6D02120
                          LD    1 DL811-DX  FUNCTION CODE               U6D02130
                          BSI  L  DZ000                                 U6D02140
                    *                                                   U6D02150
                    DL105 MDX  L  $DBSY,0                               U6D02160
                          MDX     DL105                                 U6D02170
                    *                                                   U6D02180
                          LD   L  DL972+8                               U6D02190
                          BSC     +-                                    U6D02200
                          MDX     DL110                                 U6D02210
                    DL107 BSI  L  DL300                                 U6D02220
                          BSI  L  DL450     KB RESET                    U6D02230
                          EXIT              ERROR EXIT***************   U6D02240
                    *                                                   U6D02250
                    *************************************************** U6D02260
                    * FETCH THE SECTOR ADDRESS OF THE CIB FROM DCOM   * U6D02270
                    * FETCH THE FILE PROTECT ADDRESS FROM DCOM        * U6D02280
                    *************************************************** U6D02290
                    *                                                   U6D02300
                    DL110 LD    1 DL902-DX  FETCH DRIVE NO.             U6D02310
                          SRA     12                                    U6D02320
                          A     1 DL820-DX  ADD DCOM ADDRESS            U6D02330
                          STO     DL115+1                               U6D02340
                    DL115 LDX  L2 *-*       XR2 CONTAINS DCOM           U6D02350
                          LD   L2 #CIBA     FETCH CIB SCTR ADDRESS      U6D02360
                          STO   1 DL903-DX                              U6D02370
                          SLA     4         CHECK FOR ALREADY       2-7 U6D02372
                          BSC  L  DL107,+-  *DELETED.BR IF YES      2-7 U6D02374
                          LD   L2 #FPAD     FETCH PFAD SCTR ADDRESS     U6D02380
                          STO   1 DL904-DX                              U6D02390
                          LD   L2 #ULET     FETCH LET SCTR ADDR         U6D02400
                          STO   1 DL905-DX                              U6D02410
                          LD   L2 #ANDU                             2-4 U6D02412
                          STO   1 DL911-DX  SAVE #ANDU              2-4 U6D02414
                          LD   L2 #BNDU                             2-4 U6D02416
                          STO   1 DL912-DX  SAVE #BNDU              2-4 U6D02418
                    *************************************************** U6D02420
                    * GET LET TO FIND THE SCTR ADDR OF THE USERS AREA * U6D02430
                    *************************************************** U6D02440
                          LD    1 DL902-DX  FETCH DRIVE NO.             U6D02450
                          OR    1 DL905-DX  OR SECTOR ADDR OF LET       U6D02460
                          STO  L  DL971     PLACE IN I/O HEADER         U6D02470
                          LD    1 DL817-DX                              U6D02480
                          SRT     16                                    U6D02490
                          LD    1 DL811-DX  FETCH FUNCTION CODE         U6D02500
                          BSI  L  DZ000                                 U6D02510
                    DL117 MDX  L  $DBSY,0   SKIP IF COMPLETE            U6D02520
                          MDX     DL117                                 U6D02530
                          LD   L  DL972+1   FETCH UA SCTR ADDR          U6D02540
                          OR    1 DL902-DX                              U6D02550
                          STO   1 DL906-DX                              U6D02560
                    *************************************************** U6D02570
                    * COMPUTE THE NUMBER OF SCTRS IN THE UA             U6D02580
                    *************************************************** U6D02590
                          LD    1 DL904-DX  FETCH FPAD                  U6D02600
                          S     1 DL906-DX  UA                          U6D02610
                          STO   1 DL907-DX  NUMBER SCTR IN UA           U6D02620
                    *************************************************** U6D02630
                    * SETUP THE FROM-TO ADDRESS FOR MOVE THE UA       * U6D02640
                    *************************************************** U6D02650
                          LD    1 DL902-DX  FETCH DRIVE NO              U6D02660
                          OR    1 DL903-DX  SET TO SCTR ADDRESS         U6D02670
                          STO   1 DL909-DX                              U6D02680
                          LD    1 DL902-DX                              U6D02690
                          OR    1 DL906-DX  SET FROM SCTR ADDRESS       U6D02700
                          STO   1 DL908-DX                              U6D02710
                          LD    1 DL907-DX  FETCH NO SCTR TO MOVE       U6D02720
                          BSC     +-        IF NON-ZERO MOVE USERS AREA U6D02730
                          MDX     DL127     IF ZERO BYPASS              U6D02740
                          HDNG    DLCIB- DELETE CIB                     U6D02750
                          STX   3 DL123+1                               U6D02760
                          LDX  I3 DL910     DRIVE NUMBER                U6D02770
                          LD    1 DL800-DX  ZERO TO FPAD OF SPEC. CART  U6D02780
                          STO  L3 $FPAD                                 U6D02790
                    DL123 LDX  L3 *-*       RESTORE XR3                 U6D02800
                    *                                                   U6D02810
                    *************************************************** U6D02820
                    *DELETE CIB AND MOVE THE UA DOWN                  * U6D02830
                    *************************************************** U6D02840
                    *                                                   U6D02850
                    DL120 LD    1 DL908-DX  SECTOR TO I/O HEADER        U6D02860
                          STO  L  DL971                                 U6D02870
                          A     1 DL801-DX  INCR SCTR ADDR              U6D02880
                          STO   1 DL908-DX                              U6D02890
                          LD    1 DL817-DX  I/O HEADER                  U6D02900
                          SRT     16                                    U6D02910
                          LD    1 DL811-DX  FUNCTION CODE               U6D02920
                          BSI  L  DZ000     TO DISK READ                U6D02930
                    DL122 MDX  L  $DBSY,0                               U6D02940
                          MDX     DL122     BUSY                        U6D02950
                    *                                                   U6D02960
                    *                                                   U6D02970
                    *     WRITE UA                                      U6D02980
                    *                                                   U6D02990
                          LD    1 DL909-DX  GET SCTR ADDR               U6D03000
                          STO  L  DL971                                 U6D03010
                          A     1 DL801-DX  INCR TO SCTR ADDR           U6D03020
                          STO   1 DL909-DX                              U6D03030
                          LD    1 DL817-DX  I/O HEADER                  U6D03040
                          SRT     16                                    U6D03050
                          LD    1 DL821-DX  FUNCTION CODE               U6D03060
                          BSI  L  DZ000     TO DISK WRITE               U6D03070
                    *                                                   U6D03080
                    DL126 MDX  L  $DBSY,0                               U6D03090
                          MDX     DL126     BUSY                        U6D03100
                    *                                                   U6D03110
                          MDX  L  DL907,-1  LAST UA SCTR MOVED          U6D03120
                          MDX     DL120     MOVE NEXT SCTR              U6D03130
                    *                                                   U6D03140
                    *************************************************** U6D03150
                    * ALTER $FPAD IN RESIDENT MONITOR                 * U6D03160
                    *************************************************** U6D03170
                    *                                                   U6D03180
                    DL127 LD    1 DL800-DX  ZREO CIB SCTR ADDR IN DCOM  U6D03190
                          STO  L2 #CIBA                                 U6D03200
                    *                                                   U6D03210
                          STX   3 DL129+1   SAVE XR3                    U6D03220
                          LDX  I3 DL910     LD DR NO FOR STORING $FPAD  U6D03230
                          LD    1 DL909-DX                              U6D03240
                          STO  L2 #FPAD     CHANGE DECOM FPAD           U6D03250
                          STO  L3 $FPAD     FILE PROTECT ADDR TO COMMA  U6D03260
                          LD    1 DL911-DX                          2-4 U6D03262
                          S     1 DL825-DX  UPDATE #ANDU            2-4 U6D03263
                          STO  L2 #ANDU     *IN DCOM                2-4 U6D03264
                          LD    1 DL912-DX                          2-4 U6D03265
                          S     1 DL825-DX  UPDATE #BNDU            2-4 U6D03266
                          STO  L2 #BNDU     *IN DCOM                2-4 U6D03267
                    DL129 LDX  L3 *-*       RESTORE XR3                 U6D03270
                    *                                                   U6D03280
                    *                                                   U6D03290
                    *************************************************** U6D03300
                    * WRITE UPDATED DCOM BACK ON SYSTEM CARTRIDGE     * U6D03310
                    * AND ON THE CARTRIDGE FROM WHICH THE CIB WAS     * U6D03320
                    * DELETED.                                        * U6D03330
                    *************************************************** U6D03340
                    DL130 LD    1 DL810-DX  I/O HDR ADDR                U6D03350
                          SRT     16                                    U6D03360
                          LD    1 DL821-DX                              U6D03370
                          BSI  L  DZ000                                 U6D03380
                    DL132 MDX  L  $DBSY,0   DCOM TO MASTER CARTRIDGE    U6D03390
                          MDX     DL132                                 U6D03400
                          LD    1 DL800-DX                              U6D03410
                          STO  L  DL966+8                               U6D03420
                          LD    1 DL965-DX                              U6D03430
                          OR    1 DL902-DX  OR IN DRIVE NO              U6D03440
                          STO   1 DL965-DX                              U6D03450
                          LD    1 DL810-DX                              U6D03460
                          SRT     16                                    U6D03470
                          LD    1 DL821-DX  FUNCTION CODE               U6D03480
                          BSI  L  DZ000     WRITE DCOM TO CHANGE CART   U6D03490
                    DL135 MDX  L  $DBSY,0                               U6D03500
                          MDX     DL135                                 U6D03510
                    *                                                   U6D03520
                    *                                                   U6D03530
                    *************************************************** U6D03540
                    *CHANGE USER AREA SECTOR ADDR IN LET              * U6D03550
                    *************************************************** U6D03560
                    DL150 LD    1 DL902-DX  DRIVE NO                    U6D03570
                          OR    1 DL905-DX  LET SCTR ADDR               U6D03580
                          STO  L  DL971     PUT IN I/O HDR              U6D03590
                    *                                                   U6D03600
                    * READ LET OF  SPECIFIED CARTRIDGE                  U6D03610
                    *                                                   U6D03620
                    DL152 LD    1 DL817-DX  FETCH HDR                   U6D03630
                          SRT     16                                    U6D03640
                          LD    1 DL811-DX                              U6D03650
                          BSI  L  DZ000     READ LET                    U6D03660
                    DL155 MDX  L  $DBSY,0                               U6D03670
                          MDX     DL155     BUSY                        U6D03680
                    *                                                   U6D03690
                    * STORE UA SCTR ADDR IN SECOND WORD OF LET SCTR     U6D03700
                    *                                                   U6D03710
                    DL160 LD    1 DL903-DX  FETCH SCTR ADDR             U6D03720
                          SLA     4                                     U6D03730
                          SRA     4                                     U6D03740
                          STO  L  DL972+1   PLACE IN LET                U6D03750
                    *                                                   U6D03760
                    *                                                   U6D03770
                    *                                                   U6D03780
                    * WRITE LET SECTOR                                  U6D03790
                    *                                                   U6D03800
                    DL161 LD    1 DL817-DX  I/O HDR                     U6D03810
                          SRT     16                                    U6D03820
                          LD    1 DL821-DX  FUNCTION CODE               U6D03830
                          BSI  L  DZ000     WRITE LET SCTR              U6D03840
                    DL162 MDX  L  $DBSY,0                               U6D03850
                          MDX     DL162     BUSY                        U6D03860
                    *                                                   U6D03870
                    *************************************************** U6D03880
                    * TEST FOR ANOTHER LET SECTOR                     * U6D03890
                    *************************************************** U6D03900
                    *                                                   U6D03910
                          LD   L  DL972+4                               U6D03920
                          BSC     +-                                    U6D03930
                          MDX     DL170     NO MORE LET SECTORS         U6D03940
                    *                                                   U6D03950
                          S     1 DL808-DX  CHAIN ADDR EQUAL FLET       U6D03960
                          BSC     +-                                    U6D03970
                          MDX     DL170     NO MORE LET SECTORS         U6D03980
                    *                                                   U6D03990
                          LD   L  DL972+4   GET NEXT LET SECT ADDR 2-12 U6D03995
                          OR    1 DL902-DX  *AND ADD DRIVE NO.     2-12 U6D04000
                          STO  L  DL971                                 U6D04010
                          MDX     DL152                                 U6D04020
                    *                                                   U6D04030
                    DL170 LD    1 DL819-DX  FETCH SECTOR COUNT          U6D04040
                          S    L  DL972+3   SUBTRACT WORDS AVAIL        U6D04050
                          A     1 DL824-DX  ADD ADDR OF I/O AREA        U6D04060
                          STO     DL172+1   SET-UP DB CNT ADDRESS       U6D04070
                          STO     DL173+1                               U6D04080
                    DL172 LD   L  *-*       FETCH 1DUMY DB CNT FROM LET U6D04090
                          A     1 DL825-DX  ADD SIZE OF CIB             U6D04100
                    DL173 STO  L  *-*       NEW DB CNT TO LET           U6D04110
                          LD    1 DL817-DX  I/O HEADER                  U6D04120
                          SRT     16                                    U6D04130
                          LD    1 DL821-DX  FUNCTION CODE               U6D04140
                          BSI  L  DZ000     WRITE LAST LET SECTOR       U6D04150
                    DL174 MDX  L  $DBSY,0   WRITE COMPLETE              U6D04160
                          MDX     DL174     NO                          U6D04170
                    *                                                   U6D04180
                          BSC  I  DL100     RETURN                      U6D04190
                    *                                                   U6D04200
                          HDNG    DLCIB- PRINT SIGN OFF MESSAGE         U6D04210
                    *************************************************** U6D04220
                    * SIGN OFF MESSAGE PRINTING                       * U6D04230
                    *************************************************** U6D04240
                    *                                                 * U6D04250
                    DL200 DC      *-*       ENTRY POINT                 U6D04260
                          LD    1 DL823-DX  I/O HEADER                  U6D04270
                          SRT     16                                    U6D04280
                          LD    1 DL816-DX  FUNCTION CODE               U6D04290
                          BSI  I  DL000     PRINT                       U6D04300
                    DL202 MDX  L  $PBSY,0                               U6D04310
                          MDX     DL202     BUSY                        U6D04320
                          LD    1 DL903-DX  FETCH UA SCTR ADDR          U6D04330
                          STO  L  DL921                                 U6D04340
                          BSI  L  DL400     TO CONVERT TO EBCDIC        U6D04350
                          LD   L  DL922     STORE IN PRINT LINE         U6D04360
                          STO  L  DL957                                 U6D04370
                          LD   L  DL922+1                               U6D04380
                          STO  L  DL957+1                               U6D04390
                    *                                                   U6D04400
                          LD    1 DL909-DX  FPAD SCTR ADDR              U6D04410
                          STO  L  DL921                                 U6D04420
                          BSI  L  DL400                                 U6D04430
                    *                                                   U6D04440
                          LD   L  DL922     FPAD  TO PRINT              U6D04450
                          STO  L  DL959+6                               U6D04460
                          LD   L  DL922+1                               U6D04470
                          STO  L  DL959+7                               U6D04480
                    *                                                   U6D04490
                    *                                                   U6D04500
                    * FETCH PRINT SUBROUTINE AND PRINT MESSAGE        * U6D04510
                    *                                                   U6D04520
                          LD    1 DL815-DX                              U6D04530
                          SRT     16                                    U6D04540
                          LD    1 DL816-DX  FUNCTION CODE               U6D04550
                          BSI  I  DL000     PRINT                       U6D04560
                    DL215 MDX  L  $PBSY,0                               U6D04570
                          MDX     DL215     BUSY                        U6D04580
                    *                                                   U6D04590
                          BSI  L  DL450                                 U6D04600
                    *                                                   U6D04610
                          BSC  I  DL200     RETURN                      U6D04620
                    *                                                   U6D04630
                    DL300 DC      *-*                                   U6D04640
                          LD    1 DL812-DX  ERROR TO PRINT LINE         U6D04650
                          STO   1 DL959-DX                              U6D04660
                          LD    1 DL813-DX                              U6D04670
                          STO   1 DL959+1-DX                            U6D04680
                          LD    1 DL814-DX                              U6D04690
                          STO   1 DL959+2-DX                            U6D04700
                          LD    1 DL815-DX  FETCH O/P ADDRESS           U6D04710
                          SRT     16                                    U6D04720
                          LD    1 DL816-DX  FETCH FUNCTION CODE         U6D04730
                          BSI  I  DL000     TO SYSTEMS PRT SUBR         U6D04740
                          BSC  I  DL300     RETURN                      U6D04750
                          HDNG    DLCIB - BINARY TO PACK EBCDIC         U6D04760
                    *************************************************** U6D04770
                    DL400 DC      *-*                                   U6D04780
                          LDX   2 4                                     U6D04790
                    DL403 LD      DL921     FETCH BINARY NO.            U6D04800
                          SRT     4         SET-UP FOR HEX              U6D04810
                          STO     DL921                                 U6D04820
                          SLT     16                                    U6D04830
                          SRA     12                                    U6D04840
                          STO     DL925                                 U6D04850
                          S       DL899                                 U6D04860
                          BSC     +         GREATER THAN 9              U6D04870
                          MDX     DL408                                 U6D04880
                          STO     DL925                                 U6D04890
                          LD      DL898     FETCH /00C0                 U6D04900
                    DL404 OR      DL925     OR IN NUMBER                U6D04910
                          STO  L2 DL926-1   SAVE NO                     U6D04920
                          MDX   2 -1        RETURN IF ZERO              U6D04930
                          MDX     DL403                                 U6D04940
                          LD      DL926+3   PACK                        U6D04950
                          SRT     8         CONVERTED                   U6D04960
                          LD      DL926+2   NUMBER                      U6D04970
                          SLT     8         FOR                         U6D04980
                          STO     DL922+1   PRINT                       U6D04990
                          LD      DL926+1   *SUBROUTINE                 U6D05000
                          SRT     8                                     U6D05010
                          LD      DL926                                 U6D05020
                          SLT     8                                     U6D05030
                          STO     DL922                                 U6D05040
                          BSC  I  DL400     RETURN                      U6D05050
                    *                                                   U6D05060
                    *                                                   U6D05070
                    DL408 LD      DL897     FETCH /00F0                 U6D05080
                          MDX     DL404                                 U6D05090
                    *                                                   U6D05100
                    *                                                   U6D05110
                    *                                                   U6D05120
                    *                                                   U6D05130
                    *                                                   U6D05140
                    *************************************************** U6D05150
                    * CONVERT CONSTANTS                               * U6D05160
                    *************************************************** U6D05170
                    *                                                   U6D05180
                    DL921 DC      *-*                                   U6D05190
                    DL922 DC      *-*                                   U6D05200
                          DC      *-*                                   U6D05210
                    DL925 DC      *-*                                   U6D05220
                    DL899 DC      9                                     U6D05230
                    DL898 DC      /00C0                                 U6D05240
                    DL926 BSS     4                                     U6D05250
                    DL897 DC      /00F0                                 U6D05260
                          HDNG    DLCIB- RESET KB INTERRUPT             U6D05270
                    DL450 DC      *-*                                   U6D05280
                          LD    1 DL900-DX                              U6D05290
                          STO  L  $IREQ                                 U6D05300
                          LD      DL500                                 U6D05310
                          BSC     Z                                     U6D05320
                          MDX     DL501                                 U6D05330
                          BSC  I  DL450                                 U6D05340
                    *************************************************** U6D05350
                    * KEYBOARD INTERRUPT TESTING AND RESET            * U6D05360
                    *************************************************** U6D05370
                    *                                                   U6D05380
                    DL500 DC      *-*                                   U6D05390
                          BSC  L  $I410     TO ISL04 RTN                U6D05400
                    *                                                   U6D05410
                    DL501 BSI  I  $IREQ     SERVICE INTRPT REQUEST      U6D05420
                          DC      -2        ERROR CODE                  U6D05430
                    *                                                   U6D05440
                          HDNG    DLCIB- CONSTANTS                      U6D05450
                    *************************************************** U6D05460
                    * CONSTANTS                                       * U6D05470
                    *************************************************** U6D05480
                    DX    DC      *-*                                   U6D05490
                          BSS  E  0         POINTER WORD FOR XR3        U6D05500
                    DL800 DC      0         ZERO                        U6D05510
                    DL801 DC      1                                     U6D05520
                    DL804 DC      4                                     U6D05530
                    DL808 DC      /0008     FLET SECTOR ADDR            U6D05540
                    DL810 DC      DL964     DCOM I/P ADDR               U6D05550
                    DL811 DC      /7000     FUNCTION CODE               U6D05560
                    DL812 EBC     .ER.                                  U6D05570
                    DL813 EBC     .RO.                                  U6D05580
                    DL814 EBC     .R .                                  U6D05590
                    DL815 DC      DL951     PRINT LINE ADDRESS          U6D05600
                    DL816 DC      /7001     FUNCTION CODE               U6D05610
                    DL817 DC      DL970     DISK I/O AREA ADDRESS       U6D05620
                    DL818 DC      /0010     WD CNT FOR SCTR ZERO        U6D05630
                    DL819 DC      /0140     WD CNT FOR DELETING CIB     U6D05640
                    DL820 DC      DL966     I/O ADDR                    U6D05650
                    DL821 DC      /7001     FUNCTION CODE               U6D05660
                    DL822 DC      $FPAD                                 U6D05670
                    DL823 DC      DL975                                 U6D05680
                    DL824 DC      DL971     ADDR OF I/O AREA+1          U6D05690
                    DL825 DC      /0100     DB CNT OF CIB               U6D05700
                    *************************************************** U6D05710
                    * WORKING STORAGE                                 * U6D05720
                    *************************************************** U6D05730
                          BSS  E  0                                     U6D05740
                    DL900 DC      *-*       NORMAL KP ENTRY STORAGE     U6D05750
                    DL901 DC      DL500                                 U6D05760
                    DL902 DC      *-*       COMPUTE DRIVE NO. AREA      U6D05770
                    DL903 DC      *-*       ADDRESS OF CIB              U6D05780
                    DL904 DC      *-*       FILE PROTECT ADDR           U6D05790
                    DL905 DC      *-*       LET SCTR ADDR               U6D05800
                    DL906 DC      *-*       UA SCTR ADDR                U6D05810
                    DL907 DC      *-*       NUMBER OF UA SECTORS        U6D05820
                    DL908 DC      *-*       FROM SCTR ADDR FOR UA       U6D05830
                    DL909 DC      *-*       TO SCTR ADDR FOR UA         U6D05840
                    DL910 DC      *-*       DRIVE NO RIGHT JUSTIFIED    U6D05850
                    DL911 DC      *-*       #ANDU TEMP STORAGE      2-4 U6D05851
                    DL912 DC      *-*       #BNDU TEMP STORAGE      2-4 U6D05852
                          HDNG    DLCIB- WORKING STORAGE AND I/O AREAS  U6D05860
                    *************************************************** U6D05870
                    * INPUT/OUTPUT AREAS                              * U6D05880
                    *************************************************** U6D05890
                    *             CONVERTED *ID RECORD                  U6D05900
                          BSS  E  0                                     U6D05910
                    DL940 DC      *-*       SPACER                      U6D05920
                          DC      *-*       COUNT                       U6D05930
                    DL942 DC                                            U6D05940
                          DC                                            U6D05950
                          DC                                            U6D05960
                          DC                                            U6D05970
                          DC                                            U6D05980
                          DC                                            U6D05990
                          DC                                            U6D06000
                          DC                                            U6D06010
                          BSS  E  1                                     U6D06020
                    DL951 DC      DL963-DL951 WORD COUNT                U6D06030
                    DL952 EBC     .    .                                U6D06040
                    DL954 EBC     .      .    PRINT LINE                U6D06050
                    DL957 EBC     .    .                                U6D06060
                    DL959 EBC     .                .                    U6D06070
                    DL963 EBC     .  .                                  U6D06080
                          BSS  E  0                                     U6D06090
                    DL964 DC      320       WD CNT                      U6D06100
                    DL965 DC      /0001     SCTR ADDR                   U6D06110
                    DL966 BSS     320       DCOM AREA                   U6D06120
                          BSS  E  0                                     U6D06130
                    DL970 DC      16                                    U6D06140
                    DL971 DC      *-*                                   U6D06150
                    DL972 BSS     320       I/O AREA                    U6D06160
                          DC      *-*                                   U6D06170
                    DC    EQU     DL966                                 U6D06180
                    DD    EQU     DL972                                 U6D06190
                          BSS  E  1         HEADING LINE                U6D06200
                    DL975 DC      DL979-DL975                           U6D06210
                          EBC     .CART#     UA/FX           FPAD.      U6D06220
                    DL979 EBC     .  .                                  U6D06230
                          DC      *-*                                   U6D06240
                          END     DL001                                 U6D06250
