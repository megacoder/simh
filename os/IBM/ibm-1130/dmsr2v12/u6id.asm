                          HDNG    ID                                    U6G00010
                    *************************************************** U6G00020
                    *                                                 * U6G00030
                    * STATUS-VERSION 1                                * U6G00040
                    *                                                 * U6G00050
                    * FUNCTION/OPERATION                              * U6G00060
                    *   *ID IS USED TO CHANGE THE CART ID ON UP TO    * U6G00070
                    *    FOUR DISK CARTS.                             * U6G00080
                    *   *THE NEW IDS ARE SPECIFIED IN A *ID RECORD.   * U6G00090
                    *    THIS RECORD IS READ BY THE RDREC SUBROUTINE. * U6G00100
                    *    AFTER CHECKING FOR INVALID DATA THE DATA     * U6G00110
                    *    IS TRANSFERRED TO ID.                        * U6G00120
                    *   *DCOM OF THE MASTER CARTRIDGE IS FETCHED TO   * U6G00130
                    *    OBTAIN THE CART ID TABLE (#CIDN).            * U6G00140
                    *   *A TEST IS MADE TO DETERMINE IF THE LAST CART * U6G00150
                    *    ID HAS BEEN PROCESSED) IF SO DCOM IS UPDATED * U6G00160
                    *    AND THE SIGN/OFF MESSAGE IS PRINTED.         * U6G00170
                    *   *DCOM IS UPDATED BY CALLING THE SYSUP SUBR.   * U6G00180
                    *   *THE SIGN/OFF MESSAGE IS PRINTED USING CALPR. * U6G00190
                    *   *AFTER PRINTING THE SIGN/OFF EXIT             * U6G00200
                    *   *ALSO BEFORE CHANGING THE IDS THE KEYBOARD    * U6G00210
                    *    REQUEST IS LOCKED OUT AND THEN RESTORED      * U6G00220
                    *    AFTER THE IDS ARE CHANGED.                   * U6G00230
                    *ENTRY POINTS -ID001 ENTRY TO MAINLINE            * U6G00240
                    *INPUT-IDS FROM ALL AVAILABLE DISK DRIVE 1-4.     * U6G00250
                    *      DECOM OF SYSTEMS CARTRIDGE.                * U6G00260
                    *OUTPUT-SAME AS INPUT                             * U6G00270
                    *EXTERNAL REFERENCES-                             * U6G00280
                    *  *SUBROUTINES-                                  * U6G00290
                    *      CALPR                                      * U6G00300
                    *      SYSUP                                      * U6G00310
                    *   *DCOM/COMMA-                                  * U6G00320
                    *      DZ000                                      * U6G00330
                    *      $ACDE                                      * U6G00340
                    *      $DBSY                                      * U6G00350
                    *      $IREQ                                      * U6G00360
                    *      $I410                                      * U6G00370
                    *EXIT                                             * U6G00380
                    *     *NORMAL   CALL EXIT WHEN JOB COMPLETE       * U6G00390
                    *     *ERROR-N/A                                  * U6G00400
                    *TABLES/WORK AREAS                                * U6G00410
                    *   * ID900                                       * U6G00420
                    *   * ID912                                       * U6G00430
                    *   * ID916                                       * U6G00440
                    *   * ID920                                       * U6G00450
                    *   * ID950                                       * U6G00460
                    *   * ID963                                       * U6G00470
                    *   * ID930                                       * U6G00480
                    *   * ID931                                       * U6G00490
                    *   * ID934                                       * U6G00500
                    *   * ID946                                       * U6G00510
                    *   * ID973                                       * U6G00520
                    *   * ID976                                       * U6G00530
                    *ATTRIBUTES- RELOCATABLE                          * U6G00540
                    *NOTES-N/A                                        * U6G00550
                    *                                                 * U6G00560
                    *************************************************** U6G00570
                          HDNG    ID- SYSTEM EQUATES                    U6G00580
                    DZ000 EQU     /0F2 DISK ENTRY POINT                 U6G00590
                    $ACDE EQU     /9F  AREA CODE FOR LOGICAL DRIVE 0    U6G00600
                    $DBSY EQU     /EE  DISK BUSY INDR,NON-ZERO=DISK BSY U6G00610
                    $IREQ EQU     /2C  ADDR OF INT REQUEST SUBROUTINE   U6G00620
                    $I410 EQU     /D6                                   U6G00630
                          HDNG    ID- MAINLINE                          U6G00640
                    *                                                   U6G00650
                    *GET PRINCIPAL INPUT PRINCIPAL PRINT, AND           U6G00660
                    *PRINCIPAL CONVERSION SUBR IOAR HEADERS FROM SLET   U6G00670
                    *                                                   U6G00680
                    *                                                   U6G00690
                    *                                                   U6G00700
                    *************************************************** U6G00710
                    ID000 DC      ID920                                 U6G00720
                    ID001 LD      ID000                                 U6G00730
                          CALL    RDREC     RD *ID RECORD               U6G00740
                          STO     ID000     SAVE SUBR ENTRY POINT       U6G00750
                    *                                                   U6G00760
                    *************************************************** U6G00770
                    * LOCKOUT KEYBOARD REQUEST                        * U6G00780
                    *************************************************** U6G00790
                    *                                                   U6G00800
                          BSI     ID200                                 U6G00810
                    *                                                   U6G00820
                    *************************************************** U6G00830
                    * CHANGE ID                                       * U6G00840
                    *************************************************** U6G00850
                    *                                                   U6G00860
                          BSI  L  ID510                                 U6G00870
                    *************************************************** U6G00880
                    *                                                   U6G00890
                          BSI  L  ID400     SIGN-OFF AND UPDATE DCOM    U6G00900
                          BSI  L  ID225     RESET KB                    U6G00910
                          EXIT                                          U6G00920
                          HDNG    ID- KEYBOARD                          U6G00930
                    *************************************************** U6G00940
                    * KEYBOARD LOCKOUT                                * U6G00950
                    *************************************************** U6G00960
                    *                                                   U6G00970
                    ID200 DC      *-*       ENTRY/EXIT                  U6G00980
                          LD   L  $IREQ     SAVE KB INTRPT RTN ENTRY    U6G00990
                          STO     ID290                                 U6G01000
                          LD      ID291     LOAD MASK                   U6G01010
                          STO  L  $IREQ                                 U6G01020
                          LD      ID292     ZERO ENTRY POINT            U6G01030
                          STO     ID250                                 U6G01040
                          BSC  I  ID200     RETURN                      U6G01050
                    *                                                   U6G01060
                    *************************************************** U6G01070
                    * RESET KB REQ ENTRY POINT                        * U6G01080
                    *************************************************** U6G01090
                    ID225 DC      *-*       ENTRY/EXIT                  U6G01100
                          LD      ID290     RESET KB                    U6G01110
                          STO  L  $IREQ                                 U6G01120
                          LD      ID250                                 U6G01130
                          BSC     Z                                     U6G01140
                          MDX     ID275                                 U6G01150
                          BSC  I  ID225                                 U6G01160
                    *                                                   U6G01170
                    *                                                   U6G01180
                    *                                                   U6G01190
                    *************************************************** U6G01200
                    * INTERRUPT                                       * U6G01210
                    *************************************************** U6G01220
                    *                                                   U6G01230
                    ID250 DC      *-*                                   U6G01240
                          BSC  L  $I410     TO ILS04 RTN                U6G01250
                    *                                                   U6G01260
                    *                                                   U6G01270
                    ID275 BSI  I  $IREQ     SERVICE INTRPT REQUEST      U6G01280
                          DC      -2        ERROR CODE                  U6G01290
                    *                                                   U6G01300
                    * KEYBOARD CONSTANTS                                U6G01310
                    *                                                   U6G01320
                    ID290 DC      *-*                                   U6G01330
                    ID291 DC      ID250                                 U6G01340
                    ID292 DC      /0000                                 U6G01350
                    *                                                   U6G01360
                          HDNG    ID- ERROR MESSAGE                     U6G01370
                    ************************************************    U6G01380
                    *  SET UP ERROR MESSAGE  FOR MISSING CART           U6G01390
                    *  AND PRINT THE MESSAGE WITH THE REST OF THE       U6G01400
                    * TABLE.   PRINT MESSAGE NOTING JOB TERM.           U6G01410
                    **************************************************  U6G01420
                    *                                                   U6G01430
                    ID300 DC      *-*       ENTRY  EXIT                 U6G01440
                          LD      ID979                                 U6G01450
                          STO  L1 ID935                                 U6G01460
                          LD      ID979+1                               U6G01470
                          STO  L1 ID935+1                               U6G01480
                          LD      ID979+2                               U6G01490
                          STO  L1 ID935+2                               U6G01500
                          LD      ID979+3                               U6G01510
                          STO  L1 ID935+3                               U6G01520
                          BSI  L  ID400                                 U6G01530
                          LD   L  ID791                                 U6G01540
                          STO  L  ID790+1                               U6G01550
                          STO  L  ID790+2                               U6G01560
                          CALL    CALPR                                 U6G01570
                          DC      ID790                                 U6G01580
                          DC      1                                     U6G01590
                          BSC  I  ID300                                 U6G01600
                    ID979 EBC     .UNVAILAB.                            U6G01610
                          HDNG    ID- COMPLETION AND SIGN-OFF           U6G01620
                    *************************************************** U6G01630
                    * PRINT SIGN-OFF MESSAGE AND UPDATE SYSTEM DCOM   * U6G01640
                    *************************************************** U6G01650
                    ID400 DC      *-*       ENTRY/EXIT                  U6G01660
                          CALL    CALPR     PRINT HEADING               U6G01670
                          DC      ID942                                 U6G01680
                          DC      1                                     U6G01690
                          LD   L  ID921                                 U6G01700
                          STO     ID410                                 U6G01710
                    *                                                   U6G01720
                          CALL    CALPR     PRINT CART IDS              U6G01730
                          DC      ID933                                 U6G01740
                    ID410 DC      *-*       NO OF PRINT LINES           U6G01750
                    *                                                   U6G01760
                          CALL    SYSUP                                 U6G01770
                          DC      ID90I                                 U6G01780
                    *                                                   U6G01790
                          BSC  I  ID400     RETURN                      U6G01800
                          HDNG    ID- CHECK AND CHANGE ID               U6G01810
                    *************************************************** U6G01820
                    *                                                   U6G01830
                    * THE FOLLOWING CHECKS FOR,                       * U6G01840
                    *    *WAS LAST CARTRIDGE PROCESSED,               * U6G01850
                    *    * IS THE DRIVE BE REQUESTED PRESENT          * U6G01860
                    *    *FETCH ID FROM CARTRIDGE                     * U6G01870
                    *    *CHECK ID OF THE CARTRIDGE WITH SYSTEM CARID * U6G01880
                    *    *CHECK FOR END OF THE TABLE                  * U6G01890
                    *    *IF LAST CARTRIDGE PROC GO TO PRINT TABLE    * U6G01900
                    *    *IF CART ID UNEQUAL GO TO ERROR PRINT        * U6G01910
                    *                                                 * U6G01920
                    *************************************************** U6G01930
                    ID510 DC      *-*       ENTRY/EXIT                  U6G01940
                          BSI  L  ID700     RD SYSTEM DCOM              U6G01950
                          LDX   2 1         LOAD TABLE CNT              U6G01960
                          LDX   1 1         LOAD DISK DRIVE CNT         U6G01970
                    ID511 MDX  L  ID971,-1  LAST DRIVE                  U6G01980
                          MDX     ID512     *NO                         U6G01990
                    *                                                   U6G02000
                          BSC  I  ID510     *YES                        U6G02010
                    *                                                   U6G02020
                    ID512 LD   L1 $ACDE     FETCH AREA CODE FROM COMMA  U6G02030
                          BSC  L  ID515,+-  CARTRIDGE PRESENT           U6G02040
                    *                                                   U6G02050
                          LD   L  ID973     MODIFY DRIVE NO             U6G02060
                          A    L  ID974                                 U6G02070
                          STO  L  ID973                                 U6G02080
                          A    L  ID975     SETUP DCOM ADDR             U6G02090
                          STO  L  ID900+1                               U6G02100
                          LDD  L  ID972     MOVE TO I/O AREA            U6G02110
                          STD  L  ID950                                 U6G02120
                          LD      ID722                                 U6G02130
                          SRT     16                                    U6G02140
                          LD      ID720                                 U6G02150
                          BSI  L  DZ000                                 U6G02160
                          MDX  L  $DBSY,0                               U6G02170
                          MDX     *-3                                   U6G02180
                          LD   L  ID950+5   FETCH ID                    U6G02190
                          S    L1 ID90I     IF NOT EQUAL SYSTEM DECOM   U6G02200
                          BSC  L  ID519,Z   * ID GO TO ERROR            U6G02210
                          STX  L2 ID976     STORE XR2                   U6G02220
                          LD   L  ID930     END OF TABLE                U6G02230
                          S    L  ID976                                 U6G02240
                          BSC  L  ID515,Z+                              U6G02250
                    *                                                   U6G02260
                          LD   L  ID950+5   TEST CART ID TO ID          U6G02270
                          S    L2 ID921     *IN TABLE                   U6G02280
                          BSC  L  ID515,Z                               U6G02290
                          LD   L2 ID922     CHANGE CART ID              U6G02300
                          STO  L  ID950+5                               U6G02310
                          STO  L1 ID90I     NEW ID TO SYSTEMS DECOM     U6G02320
                          STX   1 ID514+1                               U6G02330
                    ID513 LDX  L1 *-*                                   U6G02340
                          LD   L  ID978     MOVE 'COMPLETE' TO          U6G02350
                          STO  L1 ID935     *FROM-TO TABLE              U6G02360
                          LD   L  ID978+1                               U6G02370
                          STO  L1 ID935+1                               U6G02380
                          LD   L  ID978+2                               U6G02390
                          STO  L1 ID935+2                               U6G02400
                          LD   L  ID978+3                               U6G02410
                          STO  L1 ID935+3                               U6G02420
                          MDX   1 16        INCR TABLE CNT              U6G02430
                          STX   1 ID513+1                               U6G02440
                    ID514 LDX  L1 *-*                                   U6G02450
                          MDX   2 2         INCR TABLE POINTER          U6G02460
                          HDNG    ID- WRITE NEW ID ON CARTRIDGE         U6G02470
                    * WRITE NEW ID ON CARTRIDGE                         U6G02480
                    *                                                   U6G02490
                          LD      ID722                                 U6G02500
                          SRT     16                                    U6G02510
                          LD      ID721                                 U6G02520
                          BSI  L  DZ000                                 U6G02530
                          MDX  L  $DBSY,0                               U6G02540
                          MDX     *-3                                   U6G02550
                          LD   L  ID900+1   SAVE DRIVE NO.              U6G02560
                          STO     ID723                                 U6G02570
                          BSI  L  ID650     DCOM TO SYSTEM CART         U6G02580
                          LD      ID723     RESTORE DRIVE NO.           U6G02590
                          STO  L  ID900+1                               U6G02600
                          LD      ID724     35 TO WD CNT                U6G02610
                          STO  L  ID900                                 U6G02620
                          BSI  L  ID675     READ FIRST 35 WD OF DCOM    U6G02630
                          LD   L  ID972                                 U6G02640
                          STO  L  ID900     RESTORE WD CNT TO 320       U6G02650
                          BSI  L  ID600     WRITE DCOM TO CHANGED CART  U6G02660
                          LD   L  ID975     RESET I/O FOR SYSTEM CART   U6G02670
                          STO  L  ID900+1                               U6G02680
                          BSI  L  ID700     READ SYSTEM DCOM            U6G02690
                    *                                                   U6G02700
                    ID515 LD   L  ID250     CHECK KB INTRPT             U6G02710
                          BSC     Z                                     U6G02720
                          MDX     ID550                                 U6G02730
                          MDX   1 1         INCR DISK DRIVE CNT         U6G02740
                          BSC  L  ID511     PROCESS NEXT NO             U6G02750
                    *                                                   U6G02760
                    ID519 BSI  L  ID300                                 U6G02770
                          BSI  L  ID225                                 U6G02780
                          EXIT              ERROR EXIT                  U6G02790
                    ID719 DC      ID900                                 U6G02800
                    ID720 DC      /7000                                 U6G02810
                    ID721 DC      /7001                                 U6G02820
                    ID722 DC      ID950                                 U6G02830
                    ID723 DC      *-*       SAVE DRIVE NO.              U6G02840
                    ID724 DC      35        WD CNT FOR DCOM READ        U6G02850
                          HDNG    ID- KEYBOARD INTRPT REQUESTED         U6G02860
                    *************************************************** U6G02870
                    * KEYBOARD INTRPT REQUESTED                       * U6G02880
                    *************************************************** U6G02890
                    ID550 BSI  L  ID400     PRINT SIGN-OFF              U6G02900
                          BSI  L  ID225     RESET KB                    U6G02910
                    *                                                   U6G02920
                          BSC  I  ID510     RETURN                      U6G02930
                    *                                                   U6G02940
                    *************************************************** U6G02950
                    *                                                   U6G02960
                          HDNG    ID- DCOM TO CHANGEED CARTRIDGE        U6G02970
                    *************************************************** U6G02980
                    * WRITE NEW DCOM TO CHANGED CARTRIDGE             * U6G02990
                    *************************************************** U6G03000
                    *                                                   U6G03010
                    ID600 DC      *-*       ENTRY/EXIT                  U6G03020
                          LD      ID719                                 U6G03030
                          SRT     16                                    U6G03040
                          LD      ID721                                 U6G03050
                          BSI  L  DZ000                                 U6G03060
                          MDX  L  $DBSY,0                               U6G03070
                          MDX     *-3                                   U6G03080
                          BSC  I  ID600     RETURN                      U6G03090
                    *************************************************** U6G03100
                          HDNG    ID- DCOM TO SYSTEM CARTRIDGE          U6G03110
                    *************************************************** U6G03120
                    * WRITE DCOM TO SYSTEMS CARTRIDGE                 * U6G03130
                    *************************************************** U6G03140
                    *                                                   U6G03150
                    ID650 DC      *-*       ENTRY/EXIT                  U6G03160
                          LD   L  ID975     DRIVE NO TO SYSTEMS CART    U6G03170
                          STO  L  ID900+1                               U6G03180
                          BSI  L  ID600     TO DISK WRITE               U6G03190
                          BSC  I  ID650     RETURN                      U6G03200
                    *                                                   U6G03210
                    ID675 DC      *-*       READ DCOM OF CHANGED CART   U6G03220
                          LD      ID719                                 U6G03230
                          SRT     16                                    U6G03240
                          LD      ID720                                 U6G03250
                          BSI  L  DZ000     TO DISK ROUTINE             U6G03260
                          MDX  L  $DBSY,0   READ COMPLETE               U6G03270
                          MDX     *-3                                   U6G03280
                          BSC  I  ID675     RETURN                      U6G03290
                          HDNG    ID- DISK READ                         U6G03300
                    *************************************************** U6G03310
                    *READ DCOM FROM SYSTEMS CARTRIDGE                 * U6G03320
                    *************************************************** U6G03330
                    *                                                   U6G03340
                    ID700 DC      *-*       ENTRY/EXIT                  U6G03350
                          LD      ID719                                 U6G03360
                          SRT     16                                    U6G03370
                          LD      ID720                                 U6G03380
                          BSI  L  DZ000                                 U6G03390
                          MDX  L  $DBSY,0                               U6G03400
                          MDX     *-3                                   U6G03410
                          BSC  I  ID700     RETURN                      U6G03420
                    *************************************************** U6G03430
                    * DISK ERROR ROUTINE                              * U6G03440
                    *************************************************** U6G03450
                    *                                                   U6G03460
                    ID750 DC      *-*       ENTRY/EXIT                  U6G03470
                          CALL    CALPR     PRINT ERROR MESSAGE         U6G03480
                          DC      ID790                                 U6G03490
                          DC      1                                     U6G03500
                          EXIT              ERROR EXIT                  U6G03510
                    *                                                   U6G03520
                          BSS  E  1                                     U6G03530
                    ID790 DC      ID791-ID790  WD CNT                   U6G03540
                          EBC     .DISK ERROR    JOB TERMINATED.        U6G03550
                    ID791 DC      /4040                                 U6G03560
                    *                                                   U6G03570
                          HDNG    ID- CONSTANT AND WORKING STORAGE      U6G03580
                    *************************************************** U6G03590
                    * CONSTANTS AND WORKING STORAGE                   * U6G03600
                    *************************************************** U6G03610
                    ID970 BSS  E  1                                     U6G03620
                    ID971 DC      /0005     DISK COUNTER                U6G03630
                    ID972 DC      320        DISK WD CNT                U6G03640
                    ID973 DC      /0000     MODIFIED I/O AREA CODE      U6G03650
                    ID974 DC      /1000     I/O CODE MODIFIER           U6G03660
                    ID975 DC      /0001                                 U6G03670
                    ID976 DC      *-*                                   U6G03680
                    ID977 BSS     1                                     U6G03690
                    ID978 EBC     .COMPLETE.                            U6G03700
                    *                                                   U6G03710
                    ID930 DC      /0008     CNTER CONSTANT              U6G03720
                    ID931 DC      /0004                                 U6G03730
                    ID932 DC      /0040     BLANK TEST MASK             U6G03740
                    *                                                   U6G03750
                    *                                                   U6G03760
                          BSS  E  0         BINARY TABLE                U6G03770
                    ID920 DC      *-*       SPACER                      U6G03780
                    ID921 DC      *-*       FROM-TO COUNT               U6G03790
                    ID922 DC      *-*                                   U6G03800
                          DC      *-*                                   U6G03810
                          DC      *-*                                   U6G03820
                          DC      *-*                                   U6G03830
                          DC      *-*                                   U6G03840
                          DC      *-*                                   U6G03850
                          DC      *-*                                   U6G03860
                          DC      *-*                                   U6G03870
                    *                                                   U6G03880
                          BSS  E  1                                     U6G03890
                    ID933 DC      ID936-ID933  WD CNT                   U6G03900
                    ID934 EBC     .    .                                U6G03910
                          EBC     .      .                              U6G03920
                          EBC     .    .                                U6G03930
                          EBC     .      .                              U6G03940
                    ID935 EBC     .NOT DONE.                            U6G03950
                    ID936 DC      /0040                                 U6G03960
                    ID937 DC      ID938-ID937  WD CNT                   U6G03970
                          EBC     .    .                                U6G03980
                          EBC     .      .                              U6G03990
                          EBC     .    .                                U6G04000
                          EBC     .      .                              U6G04010
                          EBC     .NOT DONE.                            U6G04020
                    ID938 DC      /0040                                 U6G04030
                    ID939 DC      ID940-ID939  WD CNT                   U6G04040
                          EBC     .    .                                U6G04050
                          EBC     .      .                              U6G04060
                          EBC     .    .                                U6G04070
                          EBC     .      .                              U6G04080
                          EBC     .NOT DONE.                            U6G04090
                    ID940 DC      /0040                                 U6G04100
                    ID94A DC      ID941-ID94A WD CNT                    U6G04110
                          EBC     .    .                                U6G04120
                          EBC     .      .                              U6G04130
                          EBC     .    .                                U6G04140
                          EBC     .      .                              U6G04150
                          EBC     .NOT DONE.                            U6G04160
                    ID941 DC      /0040                                 U6G04170
                    *************************************************** U6G04180
                    * HEADING LINE                                    * U6G04190
                    *************************************************** U6G04200
                    ID942 DC      ID943-ID942                           U6G04210
                          EBC     .FROM.                                U6G04220
                          EBC     .      .                              U6G04230
                          EBC     . TO .                                U6G04240
                    ID943 DC      /0040                                 U6G04250
                    ID945 DC      *-*       TEST CNT FOR NO OF ITEMS    U6G04260
                    *                                                   U6G04270
                    ID998 DC      /0002                                 U6G04280
                    ID999 DC      /0000     ERROR FLAG WORD             U6G04290
                          BSS  E  0                                     U6G04300
                    ID900 DC      /0140                                 U6G04310
                          DC      /0001                                 U6G04320
                    ID902 BSS     320       DISK I/O AREA               U6G04330
                    ID927 DC      ID902+2   BUFFER ADDRESS              U6G04340
                    ID928 DC      /7002     INPUT FUNCTION CODE         U6G04350
                          DC      ID902+1   ADDRESS OF INPUT AREA       U6G04360
                    ID907 EQU     ID902+5   FIRST NO OF FROM FIELD      U6G04370
                    ID908 EQU     ID902+6   2ND NO                      U6G04380
                    ID90I EQU     ID902+55                              U6G04390
                    ID950 BSS  E  322                                   U6G04400
                    *************************************************** U6G04410
                          DC      *-*                                   U6G04420
                          END     ID001                                 U6G04430
