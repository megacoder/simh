                          HDNG    COPY- DISKCOPY, PROLOGUE              U6B00010
                    *************************************************** U6B00030
                    *                                                 * U6B00040
                    * STATUS - VERSION 2, MODIFICATION LEVEL 11       * U6B00050
                    *                                                 * U6B00060
                    * FUNCTION/OPERATION-                             * U6B00070
                    *    COPY COPIES THE CONTENTS OF 1 OR 2 DISK      * U6B00080
                    *    CARTRIDGE(S) ON TO FROM 1 TO 4 DISK CARTRIDGE* U6B00090
                    *    (S). THIS IS SPECIFIED BY USING THE *ID      * U6B00100
                    *    RECORD. THE CARTRIDGE SPECIFIED IN THE FROM  * U6B00110
                    *    FIELD OF THE *ID RECORD IS COPY TO THE DISK  * U6B00120
                    *    CARTRIDGE SPECIFIED IN THE TO FIELD OF THE   * U6B00130
                    *    *ID RECORD. THESE FIELDS CONTAIN THE         * U6B00140
                    *    CARTRIDGE ID NUMBERS.                        * U6B00150
                    *                                                 * U6B00160
                    *    THE *ID RECORD IS READ ON THE PRINCIPAL INPUT* U6B00170
                    *    DEVICE BY THE SUBROUTINE RDREC. RDREC ALSO   * U6B00180
                    *    CHECKS FOR THE NUMBER OF FROM-TO FIELDS      * U6B00190
                    *    CHECKS FOR VALID NUMBERS AND CONVERTS THESE  * U6B00200
                    *    NUMBER TO BINARY AND PACKED EBCDIC. THESE    * U6B00210
                    *    CONVERTED NUMBERS ARE STORED IN TABLES. THE  * U6B00220
                    *    BINARY TABLE IS USED TO FIND THE SPECIFIED   * U6B00230
                    *    CARTRIDGES IN THE SYSTEM. THE PACKED EBCDIC  * U6B00240
                    *    TABLE IS USED FOR PRINTING OUTPUT.           * U6B00250
                    *                                                 * U6B00260
                    *    THE DCOM OF THE SYSTEM CARTRIDGE IS READ     * U6B00270
                    *    AND ALTERED TO REFLECT THE CHANGES MADE BY   * U6B00280
                    *    COPY. RESIDENT MONITOR IS ALSO ALTERED.      * U6B00290
                    *    COPY CHECKS THE ID OF EACH CARTRIDGE.        * U6B00300
                    *                                                 * U6B00310
                    *    FOR THE DEFECTIVE CYLINDER ADDRS AND ID.     * U6B00320
                    *     THAT IS ALL REFERENCE IN DCOM AND RESIDENT  * U6B00330
                    *     MONITOR ARE DELETED.                        * U6B00340
                    *                                                 * U6B00350
                    *    THE KEYBOARD IS LOCKED DURING THE COPING OF  * U6B00360
                    *    A CARTRIDGE.  IT IS RESTORED AND TEST AFTER  * U6B00370
                    *    EACH COPY PROCEDURE.                         * U6B00380
                    *                                                 * U6B00390
                    * ENTRY POINTS-                                   * U6B00400
                    *     CY010-BEGINNING OF PROGRAM.                 * U6B00410
                    * INPUT-                                          * U6B00420
                    *    * *ID RECORD                                 * U6B00430
                    *    * ALL DISK CARTRIDGE SPECIFIED IN *ID RECORD * U6B00440
                    * OUTPUT                                          * U6B00450
                    *    * SIGN-OFF MESSAGE                           * U6B00460
                    *    * ALL TO CARTRIDGES SPECIFIED IN *ID RECORD  * U6B00470
                    *                                                 * U6B00480
                    *                                                 * U6B00490
                    * EXTERNAL REFERENCES-                            * U6B00500
                    *    *RDREC                                       * U6B00510
                    *    *DZ000                                       * U6B00520
                    *    *$DBSY                                       * U6B00530
                    *    *#CIDN                                       * U6B00540
                    *    *$IREQ                                       * U6B00550
                    *    *$DCYL                                       * U6B00560
                    *    *$I410                                       * U6B00570
                    *    *DISKN                                       * U6B00580
                    * EXITS                                           * U6B00590
                    *    *NORMAL- CALL EXIT WHEN JOB COMPLETE         * U6B00600
                    * TABLES/WORK AREA-                               * U6B00610
                    *    *CY900-CY912  BINARY TABLE                   * U6B00620
                    *    *CY916                                       * U6B00630
                    *    *CY917                                       * U6B00640
                    *    *CY918                                       * U6B00650
                    *    *CY919                                       * U6B00660
                    *    *CY920                                       * U6B00670
                    *    *CY924                                       * U6B00680
                    *    *CY925                                       * U6B00690
                    *    *CY930-CY938- PRINT TABLE                    * U6B00700
                    *    *CY980   I/O                                 * U6B00710
                    *    *CY990   I/O                                 * U6B00720
                    * ATTRIBUTES-RELOCATABLE                          * U6B00730
                    * NOTES-PROGRAM REVISED IN MOD 2                 *  U6B00740
                    *************************************************** U6B00750
                          HDNG    COPY- SYSTEM EQUATES                  U6B00760
                    $CIBA EQU     /5   ADDR OF CIB ON MASTER CARTRIDGE  U6B00770
                    $CH12 EQU     /6   CHANNEL 12 INDR,NON-ZERO=CHAN 12 U6B00780
                    $COMN EQU     /7   WORD COUNT OF COMMON             U6B00790
                    $CORE EQU     /E   CORE SIZE,/1000=4K,/2000=8K,ETC) U6B00800
                    $CTSW EQU     /F   MCR SW,NON-ZERO=// RECD TRAPPED  U6B00810
                    $DADR EQU     /10  SCTR ADDR OF PROG TO BE FETCHED  U6B00820
                    $DABL EQU     /11  IOCC FOR SCA RESET (ODD ADDR)    U6B00830
                    $DREQ EQU     /12  INDR FOR REQUESTED V. DISK I/O   U6B00840
                    $IBSY EQU     /13  PRINC I/O BUSY INDR,NON-ZERO=BSY U6B00850
                    $HASH EQU     /14  WORK AREA FOR MONITOR PROGRAMS   U6B00860
                    $LKNM EQU     $HASH SYSTEM WORK AREA                U6B00870
                    $RMSW EQU     $HASH+2 EXIT-LINK-DUMP SWITCH -1,0,+1 U6B00880
                    $CXR1 EQU     $HASH+3 CONTENTS OF XR1 ($DUMP ENTRY) U6B00890
                    $CLSW EQU     $HASH+4 CIL SW,-1=FETCH DISK I/O ONLY U6B00900
                    $DMPF EQU     $HASH+5 DUMP FORMAT ($DUMP ENTRY)     U6B00910
                    $ACEX EQU     $HASH+6 ACC,EXT ($DUMP ENTRY)         U6B00920
                    $PRET EQU     /28  ADDR PREOPERATIVE ERROR TRAP     U6B00930
                    $IREQ EQU     /2C  ADDR OF INT REQUEST SUBROUTINE   U6B00940
                    $ULET EQU     /2D  ADDR OF LET, LOGICAL DRIVE 0     U6B00950
                    $IOCT EQU     /32  IOCS CTR,0=NO I/O IN PROGRESS    U6B00960
                    $LAST EQU     /33  LAST CD INDR,NON-ZERO=LAST CARD  U6B00970
                    $NDUP EQU     /34  INHIBIT DUP SW,NON-ZERO=NO DUP   U6B00980
                    $NXEQ EQU     /35  INHIBIT EXEC SW,NON-ZERO=NO EXEQ U6B00990
                    $PBSY EQU     /36  PRINC PTR BUSY INDR,NON-ZERO=BSY U6B01000
                    $PGCT EQU     /37  PAGE NO. FOR PAGE HEADINGS       U6B01010
                    $EXIT EQU     /38  ADDR CALL EXIT ENTRY POINT       U6B01020
                    $LINK EQU     /39  ADDR CALL LINK ENTRY POINT       U6B01030
                    $S900 EQU     /3C                                   U6B01040
                    $S910 EQU     /3E                                   U6B01050
                    $DUMP EQU     /3F  ADDR CALL DUMP ENTRY POINT       U6B01060
                    $S000 EQU     /4D                                   U6B01070
                    $S100 EQU     /4E                                   U6B01080
                    $S150 EQU     /59                                   U6B01090
                    $CILA EQU     $S150+1 ADDR OF END OF DK I/O - 3     U6B01100
                    $DZ1N EQU     /76  DISKZ/1/N INDICATOR (-1,0,+1)    U6B01110
                    $DCDE EQU     /77  DRIVE CODE FOR CORE LOAD BLDR    U6B01120
                    $PHSE EQU     /78  NO. OF PHASE CURRENTLY IN CORE   U6B01130
                    $UFIO EQU     /79  ARM POSITION IN UNFORMATTED AREA U6B01140
                    $WSDR EQU     /7A  WORKING STORAGE DRIVE CODE       U6B01150
                    $WRD1 EQU     /7B  LOAD ADDR FOR CURR USER CORE LD  U6B01160
                    $KCSW EQU     /7C  INHIBIT INPUT/PRINT OVERLAP SW   U6B01170
                    $UFDR EQU     /7D  UNFORMATTED I/O DRIVE CODE       U6B01180
                    $CPTR EQU     /7E  CHANNEL 12 INDICATOR FOR CP      U6B01190
                    $1132 EQU     /7F  CHANNEL 12 INDICATOR FOR 1132    U6B01200
                    $1403 EQU     /80  CHANNEL 12 INDICATOR FOR 1403    U6B01210
                    $PST1 EQU     /81  ADDR POSTOP ERROR TRAP,LEVEL 1   U6B01220
                    $PST2 EQU     /85  ADDR POSTOP ERROR TRAP,LEVEL 2   U6B01230
                    $PST3 EQU     /89  ADDR POSTOP ERROR TRAP,LEVEL 3   U6B01240
                    $PST4 EQU     /8D  ADDR POSTOP ERROR TRAP,LEVEL 4   U6B01250
                    $STOP EQU     /91  ADDR PROGRAM STOP KEY TRAP       U6B01260
                    $FPAD EQU     /95  FILE PROTECT ADDR (ADJ),LOG DR 0 U6B01270
                    $CYLN EQU     /9A  ARM POSITION FOR LOGICAL DRIVE 0 U6B01280
                    $ACDE EQU     /9F  AREA CODE FOR LOGICAL DRIVE 0    U6B01290
                    $DCYL EQU     /A4  1ST DEF CYL ADDR, LOGICAL DR 0   U6B01300
                    $I200 EQU     /B3  ENTRY POINT TO ILS FOR LEVEL 2   U6B01310
                    $I205 EQU     /B8                                   U6B01320
                    $IBT2 EQU     $I205+1 ADDR OF IBT FOR LEVEL 2       U6B01330
                    $I210 EQU     /BA                                   U6B01340
                    $I290 EQU     /C2                                   U6B01350
                    $I400 EQU     /C4  ENTRY POINT TO ILS FOR LEVEL 4   U6B01360
                    $I403 EQU     /CF                                   U6B01370
                    $I405 EQU     /D3                                   U6B01380
                    $IBT4 EQU     $I405+1 ADDR OF IBT FOR LEVEL 4       U6B01390
                    $I410 EQU     /D6                                   U6B01400
                    $I415 EQU     /DE                                   U6B01410
                    $I490 EQU     /E8                                   U6B01420
                    $I491 EQU     /E9                                   U6B01430
                    $I492 EQU     /EA                                   U6B01440
                    $I494 EQU     /EC                                   U6B01450
                    $I495 EQU     /ED                                   U6B01460
                    $DBSY EQU     /EE  DISK BUSY INDR,NON-ZERO=DK BUSY  U6B01470
                    $SNLT EQU     $DBSY+1 SENSE LIGHT INDICATOR         U6B01480
                    $BYSW EQU     /1CB BYPASS SW,NOP IF FETCHING SOCAL  U6B01490
                    DZ000 EQU     /0F2 DISKZ ENTRY POINT                U6B01500
                    $PAUS EQU     DZ000-2 PAUSE INTERRUPT INDICATOR     U6B01510
                    $RWCZ EQU     DZ000-1 READ/WRITE SWITCH (CARDZ)     U6B01520
                    $ZEND EQU     /1E0 ADDR 1+LAST WORD OF DISKZ        U6B01530
                    $1END EQU     600  ADDR 1+LAST WORD OF DISK1        U6B01540
                    $NEND EQU     /370 ADDR OF END OF DISKN + 1         U6B01550
                    #NAME EQU     4    NAME OF PROGRAM                  U6B01560
                    #DBCT EQU     6    DISK BLOCK COUNT OF PROGRAM      U6B01570
                    #WSSW EQU     7    WS SW,NON-ZERO=DSF PROG IN WS    U6B01580
                    #SYSC EQU     8    SYS/NON-SYS CARTRIDGE INDR       U6B01590
                    #JBSW EQU     9    JOB SW,NON-ZERO='T' MODE         U6B01600
                    #CBSW EQU     10   CLB SW,NON-ZERO=STORECI          U6B01610
                    #LCNT EQU     11   NO. OF LOCALS                    U6B01620
                    #MPSW EQU     12   MAP SW,NON-ZERO=CORE MAP DESIRED U6B01630
                    #MDF1 EQU     13   NO. DUP CONTROL RECDS (MODIF)    U6B01640
                    #MDF2 EQU     14   ADDR OF MODIF BUFFER             U6B01650
                    #NCNT EQU     15   NO. OF NOCALS                    U6B01660
                    #ENTY EQU     16   RELATIVE ENTRY ADDR OF PROGRAM   U6B01670
                    #TODR EQU     18   'TO' WORKING STORAGE DR CODE     U6B01680
                    #FRDR EQU     19   'FROM' WORKING STORAGE DR CODE   U6B01690
                    #FHOL EQU     20   ADDR LARGEST HOLE IN FIXED AREA  U6B01700
                    #FSZE EQU     21   BLK CNT LARGEST HOLE IN FXA      U6B01710
                    #UHOL EQU     22   ADDR LARGEST HOLE IN USER AREA   U6B01720
                    #USZE EQU     23   BLK CNT LARGEST HOLE IN UA       U6B01730
                    #DCSW EQU     24   DUP CALL SW. NON-ZERO=DUP CALL   U6B01740
                    #ANDU EQU     35   1+BLK ADDR END UA (ADJ),LOG DR 0 U6B01750
                    #BNDU EQU     40   1+BLK ADDR END UA (BASE)LOG DR 0 U6B01760
                    #FPAD EQU     45   FILE PROTECT ADDR (BASE)LOG DR 0 U6B01770
                    #PCID EQU     50   CARTRIDGE ID, PHYSICAL DR 0      U6B01780
                    #CIDN EQU     55   CARTRIDGE ID FOR LOGICAL DRIVE 0 U6B01790
                    #CIBA EQU     60   ADDR OF CIB FOR LOGICAL DRIVE 0  U6B01800
                    #SCRA EQU     65   SCRA, LOGICAL DR 0               U6B01810
                    #FMAT EQU     70   FORMAT OF PROG IN WS,LOG DRIVE 0 U6B01820
                    #FLET EQU     75   ADDR OF FLET, LOGICAL DRIVE 0    U6B01830
                    #ULET EQU     80   ADDR OF  LET, LOGICAL DRIVE 0    U6B01840
                    #WSCT EQU     85   BLK CNT OF PROG IN WS,LOG DR 0   U6B01850
                    #CSHN EQU     90   SCTR CNT CUSHION, LOGICAL DR 0   U6B01860
                    #IDAD EQU     0    SCTR WITH CART ID,DEF CYL ADDR   U6B01870
                    #DCOM EQU     1    SCTR CONTAINING DCOM             U6B01880
                    #RIAD EQU     2    SCTR CONTAINING RESIDENT IMAGE   U6B01890
                    #SLET EQU     3    SCTR CONTAINING SLET             U6B01900
                    #STRT EQU     5    SCTR CONTAINING COLD START PROG  U6B01910
                    #RTBL EQU     6    SCTR CONTAINING RELOAD TABLE     U6B01920
                    #HDNG EQU     7    SCTR CONTAINING PAGE HEADING     U6B01930
                          HDNG    DISK COPY- MAINLINE                   U6B01940
                    *************************************************** U6B01950
                    * USE  RDREC SUBROUTINE TO READ *ID RECORD AND    * U6B01960
                    * SETUP FROM-TO TABLES.                           * U6B01970
                    *************************************************** U6B01980
                    *                                                   U6B01990
                    CY000 DC      CY924     TABLE ADDRESS               U6B02000
                    CY010 LD      CY000                                 U6B02010
                          CALL    RDREC                                 U6B02020
                          STO     CY000     STORE SYSTEM SUBR ENT POINT U6B02030
                          LDX  L2 C                                     U6B02040
                          LDX  L1 C                                     U6B02050
                          LD    2 CY925-C   FETCH FROM-TO COUNT         U6B02060
                          A     2 CY801-C                               U6B02070
                          STO   2 CY916-C                               U6B02080
                    CY020 LD    2 CY926-C   FETCH NO.                   U6B02090
                          STO   1 CY900-C   STORE IN TABLE              U6B02100
                          BSC     -Z        SKIP IF INVALID             U6B02110
                          MDX     CY025                                 U6B02120
                          LD      CY850     SET ERROR FLAG              U6B02130
                          STO   1 CY901-C                               U6B02140
                    CY025 MDX   1 2                                     U6B02150
                          MDX   2 1                                     U6B02160
                          MDX  L  CY851,-1  LAST FROM-TO FIELD          U6B02170
                          MDX     CY020     NEXT NO.                    U6B02180
                    *                                                   U6B02190
                          MDX     CY100     ALL NOS. STORED             U6B02200
                    *                                                   U6B02210
                    CY850 DC      1         ERROR CODE                  U6B02220
                    CY851 DC      8         ENT COUNTER                 U6B02230
                    *                                                   U6B02240
                    *************************************************** U6B02250
                    * FETCH DCOM                                      * U6B02260
                    *************************************************** U6B02270
                    *                                                   U6B02280
                    CY100 LDX  L2 C                                     U6B02290
                          LD    2 CY812-C   FETCH I/O ADDRESS           U6B02300
                          SRT     16                                    U6B02310
                          LD    2 CY813-C   FETCH FUNCTION CODE         U6B02320
                          BSI  L  DZ000     READ DCOM                   U6B02330
                    CY105 MDX  L  $DBSY,0   SKIP IF READ COMPLETED      U6B02340
                          MDX     CY105                                 U6B02350
                          BSI  L  CY600     TO SAVE CIDN ENTRIES        U6B02360
                    *                                                   U6B02370
                          LDX  L2 C                                     U6B02380
                    CY304 MDX  L  CY916,-1  LAST CART COPIED TEST       U6B02390
                          MDX     CY305                                 U6B02400
                          BSI  L  CY350                                 U6B02405
                    CY303 MDX  L  $PBSY,0   TEST IF PRINTER BUSY    2-8 U6B02410
                          MDX     CY303     IF BUSY TEST AGAIN      2-8 U6B02411
                          CALL    SYSUP     UPDATE DCOM             2-6 U6B02412
                          DC      KCIDN                             2-6 U6B02414
                          EXIT                                          U6B02420
                    *                                                   U6B02430
                    CY305 LDX   1 +5                                    U6B02440
                          LD    2 CY901-C   FETCH ID ERROR WD           U6B02450
                          S    L  CY801     VALID ID                    U6B02460
                          BSC     +-                                    U6B02470
                          MDX     CY308     INVALID ID                  U6B02480
                    *                                                   U6B02490
                          LD    2 CY903-C   FETCH TO ID ERROR WD        U6B02500
                          S    L  CY801                                 U6B02510
                          BSC     +-                                    U6B02520
                          MDX     CY309     INVALID TO ID               U6B02530
                    *                                                   U6B02540
                    CY307 LD    2 CY900-C   CART AVAILABLE TEST         U6B02550
                          S    L1 SCIDN-1                               U6B02560
                          BSC  L  CY310,+-  CART IS AVAILABLE           U6B02570
                          MDX   1 -1                                    U6B02580
                          MDX     CY307     CHECK NEXT DRIVE            U6B02590
                    *                                                   U6B02600
                          LD   L  CY802     SET NOT AVAIL FLAG          U6B02610
                          STO   2 CY901-C   *IN ERROR WORD              U6B02620
                          MDX   2 4                                     U6B02630
                    CY308 MDX     CY304                                 U6B02640
                    *************************************************** U6B02650
                    * COMPUTE LOGICAL DRIVE NO. FOR FROM CARTRIDGE    * U6B02660
                    *************************************************** U6B02670
                    CY310 STX  L1 CY917                                 U6B02680
                          LD   L  CY917                                 U6B02690
                          S    L  CY801                                 U6B02700
                          SLA     12                                    U6B02710
                          OR   L  CY800                                 U6B02720
                          STO  L  CY918                                 U6B02730
                          LDX   1 +5                                    U6B02740
                          STO   2 CY901-C                               U6B02750
                          MDX   2 +2        INCR TO TO FIELD            U6B02760
                    *************************************************** U6B02770
                    * CHECK FOR AVAILABLE TO CARTRIDGE                * U6B02780
                    *************************************************** U6B02790
                    CY311 LD    2 CY900-C                               U6B02800
                          S    L1 SCIDN-1                               U6B02810
                          BSC  L  CY312,+-  CART IS AVAILABLE           U6B02820
                          MDX   1 -1                                    U6B02830
                          MDX     CY311     CHECK NEXT DRIVE            U6B02840
                    *                                                   U6B02850
                          LD   L  CY802     CART. NOT AVAILABLE         U6B02860
                          STO   2 CY901-C   FLAG NOT AVAILABLE          U6B02870
                    CY309 MDX   2 2                                     U6B02880
                          MDX     CY304     TEST NEXT ENTRY             U6B02890
                    *                                                   U6B02900
                    *************************************************** U6B02910
                    * COMPUTE LOGICAL DRIVE NO. FOR TO CARTRIDGE      * U6B02920
                    *************************************************** U6B02930
                    *                                                   U6B02940
                    CY312 STX  L1 CY917                                 U6B02950
                          LD    2 CY900-C   SAVE TO ID                  U6B02960
                          STO  L  CY971                                 U6B02970
                          LD   L  CY917                                 U6B02980
                          S    L  CY801     SUB 1                       U6B02990
                          SLA     12                                    U6B03000
                          STO  L  CY919                                 U6B03010
                          STO   2 CY901-C                               U6B03020
                    *                                                   U6B03030
                    *************************************************** U6B03040
                    * SETUP FOR  COPY PROCESSING                        U6B03050
                    *************************************************** U6B03060
                          LD   L  $IREQ     SAVE KB ENTRY POINT         U6B03070
                          STO  L  CY953                                 U6B03080
                          LD   L  CY952     SET KB INTERRUPT            U6B03090
                          STO  L  $IREQ                                 U6B03100
                          LD   L  CY800     ZERO ENTRY POINT            U6B03110
                          STO  L  CY500                                 U6B03120
                    *                                               2-3 U6B03122
                          LD   L  CY919     FETCH SCTR ADDR OF 'TO' 2-3 U6B03124
                          SRT     16        *CART AND SHIFT TO EXT  2-3 U6B03126
                          LD   L  CY809     FETCH ONE SECTORWD COUNT2-3 U6B03130
                          STD  L  CY990     STORE TO I/O AREA       2-3 U6B03134
                          BSI  L  CY400     BR TO FETCH 'TO' ID SECT2-3 U6B03136
                          LD   L  CY990+9   FETCH STATUS WORD (WD 7)2-3 U6B03138
                          A    L  CY802     TEST FOR AND BR IF NOT  2-3 U6B03140
                          BSI  L  CY700,Z   *A FRESHLY INITIALIZCART2-3 U6B03142
                    *                                               2-3 U6B03144
                          LD   L  CY680     SET I/O BUFFER WD COUNT 2-3 U6B03146
                          STO  L  CY990     *TO ONE CYLINDER        2-3 U6B03148
                          LD   L  CY918                                 U6B03150
                          STO  L  CY991                                 U6B03160
                          BSI  L  CY400      TO DISK READ               U6B03170
                          STX   1 CY322+1   SAVE XR 1                   U6B03180
                    *                                               2-3 U6B03185
                    * FIND THE  DEFECTIVE CYLINDER ADDRESSES OF 'TO'    U6B03190
                    * CARTRIDGE IN THE RESIDENT MONITOR                 U6B03200
                    *                                                   U6B03210
                          LD   L  CY919     DRIVE NO.                   U6B03220
                          SRA     12                                    U6B03230
                          M    L  CY803     MUL BY 3                    U6B03240
                          SLT     16                                    U6B03250
                          STO     CY320+1                               U6B03260
                    CY320 LDX  L1 *-*                                   U6B03270
                          LD   L1 $DCYL+1   DEFECTIVE CYL ADDR          U6B03280
                          SRT     16        *TO I/O AREA                U6B03290
                          LD   L1 $DCYL                                 U6B03300
                          STD  L  CY991+1                               U6B03310
                          LD   L  CY991+8                           2-3 U6B03311
                          S    L  CY802                             2-4 U6B03312
                          BSC  L  CY318,Z+  BR IF SOURCE NON-SYST   2-4 U6B03313
                          LDD  L  CY991+1                           2-3 U6B03314
                          STD  L  CY990+640+160  DEF CYL SET UP IN RES  U6B03320
                    CY318 LD   L1 $DCYL+2                               U6B03330
                          STO  L  CY991+3                               U6B03340
                          LD   L  CY991+8                           2-3 U6B03341
                          S    L  CY802                             2-4 U6B03342
                          BSC  L  CY319,Z+  BR IF SOURCE NON-SYST   2-4 U6B03343
                          LD   L  CY991+3                           2-3 U6B03344
                          STO  L  CY990+640+162  DEF CYL SET UP IN RES  U6B03350
                    *************************************************** U6B03360
                    * STORE THE 'TO' CART ID IN THE CORRECT FIELD OF  * U6B03370
                    * DCOM                                              U6B03380
                    *                                                   U6B03390
                    CY319 LDX   1 -5                                2-4 U6B03400
                    CY321 LD   L1 LCIDN+5   SEARCH CIDN FOR ID      2-4 U6B03410
                          S    L  CY991+4                               U6B03420
                          BSC  L  CY329,+-  BR WHEN FOUND               U6B03430
                          SLA     16                                2-4 U6B03434
                          STO  L1 LCIDN+5                           2-4 U6B03436
                          MDX   1 1                                 2-4 U6B03440
                          MDX     CY321                                 U6B03450
                    *                                                   U6B03460
                    CY329 LD   L  CY971                                 U6B03470
                          STO  L  CY991+4                               U6B03480
                          STO  L1 LCIDN+5                           2-4 U6B03490
                    *                                                   U6B03500
                    *                                                   U6B03510
                    CY322 LDX  L1 *-*       RESET XR                    U6B03520
                          LD   L  CY919     FETCH OUTPUT CART NO.       U6B03530
                          STO  L  CY991                                 U6B03540
                          BSI  L  CY450     DISK WRITE                  U6B03550
                    *                                                   U6B03560
                          LD   L  CY810     RESET DISK READ-WRITE CNT   U6B03570
                          STO  L  CY920                                 U6B03580
                    CY325 LD   L  CY918     INCR SECTOR ADDRESS         U6B03590
                          A       CY804                                 U6B03600
                          STO  L  CY918                                 U6B03610
                          STO  L  CY991                                 U6B03620
                          BSI  L  CY400     READ FROM CART.             U6B03630
                    *                                                   U6B03640
                          LD   L  CY919     INCR OUTPUT SECTOR ADD      U6B03650
                          A       CY804                                 U6B03660
                          STO  L  CY919                                 U6B03670
                          STO  L  CY991                                 U6B03680
                          BSI  L  CY450     WRITE DISK                  U6B03690
                    *                                                   U6B03700
                          MDX  L  CY920,-1  DECR READ-WRITE CNT SKP  0  U6B03710
                          MDX     CY325     READ NEXT CYL.              U6B03720
                          LD   L  CY953     RESTORE KB INTERRUPT        U6B03730
                          STO  L  $IREQ                                 U6B03740
                          LD      CY500                                 U6B03750
                          BSC     Z         SKIP IF NO KB INTRPT        U6B03760
                          MDX     CY501     SERVICE INTRPT              U6B03770
                    *                                                   U6B03780
                          BSC  L  CY309     PROC NEXT 'FROM-TO'FIELD2-3 U6B03790
                          HDNG    COPY- PRINT SUBROUTINE                U6B03800
                    *************************************************** U6B03810
                    * PRINT TABLE AND ERROR MESSAGES                  * U6B03820
                    *************************************************** U6B03830
                    *                                                   U6B03840
                    CY350 DC      *-*                                   U6B03850
                          LDX  L1 C                                     U6B03860
                          LDX  L2 CY        LD XR2 FOR PRINT TABLE      U6B03870
                          LD    2 CY925-CY                              U6B03880
                          STO  L  CY916                                 U6B03890
                    CY355 LD    1 CY901-C   FETCH ERROR WORD            U6B03900
                          OR    1 CY903-C   TO LABEL ERROR WORD         U6B03910
                          BSC     E                                     U6B03920
                          MDX     CY360     NUMBER ERROR                U6B03930
                    *                                                   U6B03940
                          SRA     1                                     U6B03950
                          BSC     E                                     U6B03960
                          MDX     CY365     CART NOT PRESENT            U6B03970
                    *                                                   U6B03980
                          LD      CY814     FETCH COMPETE MESSAGE       U6B03990
                          STO   2 CY940-CY  CO                          U6B04000
                          LD      CY814+1                               U6B04010
                          STO   2 CY941-CY  MP                          U6B04020
                          LD      CY814+2                               U6B04030
                          STO   2 CY942-CY  LE                          U6B04040
                          LD      CY814+3                               U6B04050
                          STO   2 CY943-CY  TE                          U6B04060
                          MDX     CY370     TO PRINT                    U6B04070
                    *                                                   U6B04080
                    CY360 LD      CY822     NO                          U6B04090
                          STO   2 CY940-CY                              U6B04100
                          LD      CY822+1   .                           U6B04110
                          STO   2 CY941-CY                              U6B04120
                          LD      CY822+2   ER                          U6B04130
                          STO   2 CY942-CY                              U6B04140
                          LD      CY822+3   R                           U6B04150
                          STO   2 CY943-CY                              U6B04160
                          MDX     CY370     TO PRINT                    U6B04170
                    *                                                   U6B04180
                    *************************************************** U6B04190
                    * MOVE 'NOT PRES' TO PRINT FOR UNAVAILABLE CARTS. * U6B04200
                    *************************************************** U6B04210
                    *                                                   U6B04220
                    CY365 LD      CY818     NO                          U6B04230
                          STO   2 CY940-CY                              U6B04240
                          LD      CY818+1   T                           U6B04250
                          STO   2 CY941-CY                              U6B04260
                          LD      CY818+2   PR                          U6B04270
                          STO   2 CY942-CY                              U6B04280
                          LD      CY818+3   ES                          U6B04290
                          STO   2 CY943-CY                              U6B04300
                    CY370 BSI  L  CY380     TO PRINT                    U6B04310
                          MDX   1 4                                     U6B04320
                          MDX   2 16                                    U6B04330
                          MDX  L  CY916,-1  SKIP IF LAST LINE PRINTED   U6B04340
                          MDX     CY355                                 U6B04350
                    *                                                   U6B04360
                          BSC  I  CY350                                 U6B04370
                    *                                                   U6B04380
                    *************************************************** U6B04390
                    * PRINT A LIN  OF SIGN OFF MESSAGE                * U6B04400
                    *************************************************** U6B04410
                    CY380 DC      *-*       ENTRY                       U6B04420
                          LD   L  CY950     FETCH I/O ADDRESS           U6B04430
                          SRT     16                                    U6B04440
                          LD   L  CY951     FETCH FUNCTION CODE         U6B04450
                          BSI  I  CY000     TO SYSTEM PRINT SUBR.       U6B04460
                          LD   L  CY950     INCR LINE CNT               U6B04470
                          A    L  CY931                                 U6B04480
                          A       CY801                                 U6B04490
                          STO  L  CY950                                 U6B04500
                          BSC  I  CY380                                 U6B04510
                    *                                                   U6B04520
                    CY500 DC      *-*       KB ENTRY                    U6B04530
                          BSC  L  $I410     TO ISL04 RTN                U6B04540
                    *                                                   U6B04550
                    CY501 BSI  L  CY350                                 U6B04560
                          BSI  I  $IREQ     SERVICE INTRPT REQUEST      U6B04570
                          DC      -2        ERROR CODE                  U6B04580
                    *                                                   U6B04590
                          HDNG    COPY- CONSTANTS                       U6B04600
                    *************************************************** U6B04610
                    * CONSTANTS                                       * U6B04620
                    *************************************************** U6B04630
                    C     DC      *-*       DUMMY BUMPER                U6B04640
                          BSS  E  0                                     U6B04650
                    CY800 DC      0         ZERO                        U6B04660
                    CY801 DC      1         TEST CODE-INVALID ID        U6B04670
                    CY802 DC      2         ERROR CODE  ID NOT AVAIL    U6B04680
                    CY803 DC      3                                     U6B04690
                    CY804 DC      4                                     U6B04700
                    CY809 DC      320       SECTOR WORD COUNT       2-3 U6B04705
                    CY810 DC      399       DISK WRITE CNT              U6B04710
                    CY811 DC                                            U6B04720
                    CY812 DC      CY990     I/O AREA ADDR               U6B04730
                    CY813 DC      /7000                                 U6B04740
                    CY814 EBC     .COMPLETE.                            U6B04750
                    CY818 EBC     .NOT PRES.                            U6B04760
                    CY822 EBC     .NO. ERR .                            U6B04770
                          HDNG    COPY- WORKING STORAGE                 U6B04780
                    *************************************************** U6B04790
                    * WORKING STORAGE                                 * U6B04800
                    *************************************************** U6B04810
                          BSS  E  0                                     U6B04820
                    * FROM-TO TABLE IN BINARY-4 WORDS FOR EACH FIELD    U6B04830
                    CY900 DC      *-*       FROM FIELD OF 1ST ENTRY     U6B04840
                    CY901 DC      *-*       ERROR-INDR OR LOGICAL DR-NO U6B04850
                    CY902 DC      *-*       TO FIELD OF 1ST ENTRY       U6B04860
                    CY903 DC      *-*       ERROR-INDR OF LOGICAL DR-NO U6B04870
                    CY904 DC      *-*       SECOND FROM-TO ENTRY        U6B04880
                          DC      *-*                                   U6B04890
                          DC      *-*                                   U6B04900
                          DC      *-*                                   U6B04910
                    CY908 DC      *-*       THIRD FROM-TO ENTRY         U6B04920
                          DC      *-*                                   U6B04930
                          DC      *-*                                   U6B04940
                          DC      *-*                                   U6B04950
                    CY912 DC      *-*       FOURTH FROM TO ENTRY        U6B04960
                          DC      *-*                                   U6B04970
                          DC      *-*                                   U6B04980
                          DC      *-*                                   U6B04990
                    CY916 DC      *-*       NO OF FROM-TO ITEMS         U6B05000
                    CY917 DC      *-*       SAVE XR1 FOR DETM DRIVE NO. U6B05010
                    CY918 DC      *-*       INPUT DRIVE CODE STORAGE    U6B05020
                    CY919 DC      *-*       OUTPUT DRIVE CODE           U6B05030
                    CY920 DC      *-*       DISK READ-WRITE CNT         U6B05040
                          BSS  E  0                                     U6B05050
                    CY924 DC      *-*       SPACER                      U6B05060
                    CY925 DC      *-*       FROM-TO COUNT               U6B05070
                    CY926 DC      *-*                                   U6B05080
                          DC      *-*                                   U6B05090
                          DC      *-*                                   U6B05100
                          DC      *-*                                   U6B05110
                          DC      *-*                                   U6B05120
                          DC      *-*                                   U6B05130
                          DC      *-*                                   U6B05140
                          DC      *-*                                   U6B05150
                    *************************************************** U6B05160
                    * FROM-TO TABLE FOR RDREC ROUTINE                 * U6B05170
                    *************************************************** U6B05180
                    *                                                   U6B05190
                    CY930 BSS  E  1                                     U6B05200
                    CY931 DC      CY932-CY931 WD CNT                    U6B05210
                          EBC     .    .                                U6B05220
                          EBC     .      .                              U6B05230
                          EBC     .    .                                U6B05240
                          EBC     .      .                              U6B05250
                          EBC     .NOT DONE.                            U6B05260
                    CY932 EBC     .  .                                  U6B05270
                    CY933 DC      CY934-CY933 WD CNT                    U6B05280
                          EBC     .    .                                U6B05290
                          EBC     .      .                              U6B05300
                          EBC     .    .                                U6B05310
                          EBC     .      .                              U6B05320
                          EBC     .NOT DONE.                            U6B05330
                    CY934 EBC     .  .                                  U6B05340
                    CY935 DC      CY936-CY935  WD CNT                   U6B05350
                          EBC     .    .                                U6B05360
                          EBC     .      .                              U6B05370
                          EBC     .    .                                U6B05380
                          EBC     .      .                              U6B05390
                          EBC     .NOT DONE.                            U6B05400
                    CY936 EBC     .  .                                  U6B05410
                    CY937 DC      CY938-CY937 WD CNT                    U6B05420
                          EBC     .    .                                U6B05430
                          EBC     .      .                              U6B05440
                          EBC     .    .                                U6B05450
                          EBC     .      .                              U6B05460
                          EBC     .NOT DONE.                            U6B05470
                    CY938 EBC     .  .                                  U6B05480
                    CY949 DC      *-*       INDIRECT ADDRESS-BR NO.     U6B05490
                    CY950 DC      CY931                                 U6B05500
                    *                                                   U6B05510
                    CY951 DC      /7001     PRINT FUNCTION CODE         U6B05520
                    CY952 DC      CY500     KB SURPRESS ROUTINE         U6B05530
                    CY953 DC      *-*       KB ENTRY                    U6B05540
                    *                                                   U6B05550
                    CY    EQU     CY924                                 U6B05560
                    CY940 EQU     CY932-4                               U6B05570
                    CY941 EQU     CY932-3                               U6B05580
                    CY942 EQU     CY932-2                               U6B05590
                    CY943 EQU     CY932-1                               U6B05600
                    CY971 DC      *-*                                   U6B05610
                    * INPUT-OUTPUT AREAS                                U6B05620
                    *                                                   U6B05630
                          BSS  E  0                                     U6B05640
                    CY990 DC      320                                   U6B05650
                    CY991 DC      /0001                                 U6B05660
                          BSS     1280                                  U6B05670
                          DC      *-*                                   U6B05680
                    DCIDN EQU     CY990+57                              U6B05690
                    LCIDN EQU     DCIDN+320                             U6B05700
                          HDNG    COPY- DISK SUBROUTINES                U6B05710
                    *************************************************** U6B05720
                    * DISK READ                                       * U6B05730
                    *************************************************** U6B05740
                    CY400 DC      *-*       ENTRY/EXIT                  U6B05750
                          LD      CY490                                 U6B05760
                          RTE     16                                    U6B05770
                          LD      CY491                                 U6B05780
                          BSI  L  DZ000                                 U6B05790
                    CY401 MDX  L  $DBSY,0                               U6B05800
                          MDX     CY401                                 U6B05810
                          BSC  I  CY400                                 U6B05820
                    *                                                   U6B05830
                          BSS  E  0                                     U6B05840
                    CY490 DC      CY990                                 U6B05850
                    CY491 DC      /7000                                 U6B05860
                    CY492 DC      /7001                                 U6B05870
                    *                                                   U6B05880
                    *************************************************** U6B05890
                    *     DISK WRITE                                  * U6B05900
                    *************************************************** U6B05910
                    *                                                   U6B05920
                    CY450 DC      *-*       ENTRY/EXIT                  U6B05930
                          LD      CY490                                 U6B05940
                          RTE     16                                    U6B05950
                          LD      CY492                                 U6B05960
                          BSI  L  DZ000                                 U6B05970
                    CY451 MDX  L  $DBSY,0                               U6B05980
                          MDX     CY451                                 U6B05990
                          BSC  I  CY450                                 U6B06000
                    *                                                   U6B06010
                          HDNG    COPY                                  U6B06020
                    * SAVE CIDN TABLE OF DCOM                           U6B06030
                    CY600 DC      *-*       ENTRY/EXIT                  U6B06040
                          LD   L  DCIDN+1   ID  CART 1                  U6B06050
                          SRT     16                                    U6B06060
                          LD   L  DCIDN              0                  U6B06070
                          STD     SCIDN                                 U6B06080
                          STD     KCIDN                             2-6 U6B06082
                          LD   L  DCIDN+3            3                  U6B06090
                          SRT     16                                    U6B06100
                          LD   L  DCIDN+2            2                  U6B06110
                          STD     SCIDN+2                               U6B06120
                          STD     KCIDN+2                           2-6 U6B06122
                          LD   L  DCIDN+4            4                  U6B06130
                          STO     SCIDN+4                               U6B06140
                          STO     KCIDN+4                           2-6 U6B06142
                          BSC  I  CY600     RETURN                      U6B06170
                    *                                                   U6B06180
                    SCIDN BSS  E  6         TABLE FOR SAVE CIDN OF DCOM U6B06190
                    KCIDN BSS  E  6         TABLE FOR SYSUP         2-6 U6B06192
                    *                                                   U6B06200
                    CY680 DC      1280      CYLINDER WD CNT             U6B06210
                    *                                                   U6B06220
                    ***********************************************2-3* U6B06230
                    * PRINT 'XXXX NOT FRESHLY INITIALIZED ' MESSAGE 2-6 U6B06240
                    ***********************************************2-3* U6B06250
                    *                                               2-3 U6B06260
                    CY700 DC      0         ENTRY/RETURN ADDRESS    2-3 U6B06270
                          STX   1 CY730+1   SAVE XR1                2-3 U6B06280
                          STX   2 CY740+1   SAVE XR2                2-3 U6B06290
                          LDX  L1 CY902     XR1 PTS TO BINARY 'TO'ID2-3 U6B06300
                          LDX  L2 CY931+6   XR2 PTS TO EBCDIC 'TO'ID2-3 U6B06310
                    CY710 LD   L  CY971     FETCH CURRENT 'TO' ID   2-3 U6B06320
                          S     1 0         TEST FOR AND BRANCH IF  2-3 U6B06330
                          BSC  L  CY720,+-  *MATCH FOUND IN BIN TBL 2-3 U6B06340
                          MDX   1 4         INCR BINARY POINTER     2-3 U6B06350
                          MDX   2 16        INCR EBCDIC POINTER     2-3 U6B06360
                          MDX     CY710     BRANCH TO TEST AGAIN    2-3 U6B06370
                    *                                               2-3 U6B06380
                    CY720 LD    2 1         FETCH LAST HALF OF EBCID2-3 U6B06390
                          SRT     16        SHIFT TO EXT            2-3 U6B06400
                          LD    2 0         FETCH FIRST HALF OFEBCID2-3 U6B06410
                          STD     CY974     STORE TO PRINT AREA     2-3 U6B06420
                          LD      CY972     FETCH ADDR OF I/O AREA  2-3 U6B06430
                          SRT     16        SHIFT TO EXT            2-3 U6B06440
                          LD   L  CY951     FETCH PRINT FUNCT CODE  2-3 U6B06450
                          BSI  I  CY000     BRANCH TO PRINT MESSAGE 2-3 U6B06460
                    CY725 MDX  L  $PBSY,0   SKIP NEXT IF PRINT COMPL2-3 U6B06464
                          MDX     CY725     BR TO TEST PRINT COMPLET2-3 U6B06466
                          BSI  L  $PRET     BRANCH TO WAIT,MAYRETURN2-3 U6B06470
                    CY730 LDX  L1 *-*       RESTORE XR1             2-3 U6B06480
                    CY740 LDX  L2 *-*       RESTORE XR2             2-3 U6B06490
                          BSC  I  CY700     RETURN                  2-3 U6B06500
                    *                                               2-3 U6B06510
                    * CONSTANTS AND WORK AREAS                      2-3 U6B06520
                    *                                               2-3 U6B06530
                          BSS  E  0         FORCE NEXT LOC TO BEEVEN2-3 U6B06540
                    CY972 DC      CY973     ADDRESS OF PRINT I/O ARE2-3 U6B06550
                    CY973 DC      CY975-*   WD CNT  OF PRINT I/O ARE2-3 U6B06560
                    CY974 EBC     .XXXX NOT FRESHLY INITIALIZED.    2-6 U6B06570
                    CY975 BSS     0                                 2-3 U6B06580
                    *                                               2-3 U6B06590
                    *                                               2-3 U6B06600
                          BSS     50        PATCH AREA              2-3 U6B06610
                    *                                               2-O U6B06620
                    *                                               2-3 U6B06630
                          END     CY010     COPY ENTRY POINT        2-3 U6B06640
