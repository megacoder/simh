                          HDNG    PRINT CARTRIDGE ID- IDENT             U6F00010
                    *************************************************** U6F00020
                    * TITLE- PRINT CARTRIDGE ID  IDENT                * U6F00030
                    *                                                 * U6F00040
                    * STATUS - VERSION 2, MODIFICATION LEVEL 11       * U6F00050
                    *                                                 * U6F00060
                    * FUNCTION/OPERATION-                             * U6F00070
                    *    READ DCOM OF THE SYSTEMS CARTRIDGE, PRINT    * U6F00080
                    *    THE PHYSICAL DRIVE NUMBER AND CARTRIDGE ID   * U6F00090
                    *    OF EACH AVAILABLE CARTRIDGE.                 * U6F00100
                    * ENTRY POINTS-                                   * U6F00110
                    *    IT000-BEGINNING OF ROUTINE                   * U6F00120
                    *                                                 * U6F00130
                    * INPUT-                                          * U6F00140
                    *    DCOM OF SYSTEMS CARTRIDGE                    * U6F00150
                    *                                                 * U6F00160
                    * OUTPUT-                                         * U6F00170
                    *    CARTRIDGE IDS AND PHYSICAL DRIVE NUMBER ON   * U6F00180
                    *    PRINCIPAL PRINT DEVICE                       * U6F00190
                    *                                                 * U6F00200
                    * EXTERNAL REFERENCES-                            * U6F00210
                    *    SUBROUTINES-                                 * U6F00220
                    *       * CALPR- PRINT USING PRINCIPAL PRINT DEVC * U6F00230
                    *                                                 * U6F00240
                    *    COMMA/DCOM-                                  * U6F00250
                    *       * D2000-DISK READ                         * U6F00260
                    *       * DZBSY-DISK BUSY                         * U6F00270
                    *       * #PCID-TABLE OF CARTRIDGE IDS            * U6F00280
                    *                                                 * U6F00290
                    * EXITS                                           * U6F00300
                    *    NORMAL- CALL EXIT                            * U6F00310
                    *    ERROR- N/A                                   * U6F00320
                    *                                                 * U6F00330
                    * TABLES/WORK AREAS-                              * U6F00340
                    *    IT900-WORK AREA FOR NUMBER CONVERSION        * U6F00350
                    *                                                 * U6F00360
                    * ATTRIBUTES-                                     * U6F00370
                    *    RELOCATABLE                                  * U6F00380
                    *                                                 * U6F00390
                    * NOTES-                                          * U6F00400
                    *    N/A                                          * U6F00410
                    *************************************************** U6F00420
                          HDNG    IDENT- SYSTEM EQUATES                 U6F00430
                    $CIBA EQU     /5   ADDR OF CIB ON MASTER CARTRIDGE  U6F00440
                    $CH12 EQU     /6   CHANNEL 12 INDR,NON-ZERO=CHAN 12 U6F00450
                    $COMN EQU     /7   WORD COUNT OF COMMON             U6F00460
                    $LEV2 EQU     /000A     LEV.2 HARDWARE INT ADDR2-11 U6F00465
                    $CORE EQU     /E   CORE SIZE,/1000=4K,/2000=8K,ETC) U6F00470
                    $CTSW EQU     /F   MCR SW,NON-ZERO=// RECD TRAPPED  U6F00480
                    $DADR EQU     /10  SCTR ADDR OF PROG TO BE FETCHED  U6F00490
                    $DABL EQU     /11  IOCC FOR SCA RESET (ODD ADDR)    U6F00500
                    $DREQ EQU     /12  INDR FOR REQUESTED V. DISK I/O   U6F00510
                    $IBSY EQU     /13  PRINC I/O BUSY INDR,NON-ZERO=BSY U6F00520
                    $HASH EQU     /14  WORK AREA FOR MONITOR PROGRAMS   U6F00530
                    $LKNM EQU     $HASH SYSTEM WORK AREA                U6F00540
                    $RMSW EQU     $HASH+2 EXIT-LINK-DUMP SWITCH -1,0,+1 U6F00550
                    $CXR1 EQU     $HASH+3 CONTENTS OF XR1 ($DUMP ENTRY) U6F00560
                    $CLSW EQU     $HASH+4 CIL SW,-1=FETCH DISK I/O ONLY U6F00570
                    $DMPF EQU     $HASH+5 DUMP FORMAT ($DUMP ENTRY)     U6F00580
                    $ACEX EQU     $HASH+6 ACC,EXT ($DUMP ENTRY)         U6F00590
                    $PRET EQU     /28  ADDR PREOPERATIVE ERROR TRAP     U6F00600
                    $IREQ EQU     /2C  ADDR OF INT REQUEST SUBROUTINE   U6F00610
                    $ULET EQU     /2D  ADDR OF LET, LOGICAL DRIVE 0     U6F00620
                    $IOCT EQU     /32  IOCS CTR,0=NO I/O IN PROGRESS    U6F00630
                    $LAST EQU     /33  LAST CD INDR,NON-ZERO=LAST CARD  U6F00640
                    $NDUP EQU     /34  INHIBIT DUP SW,NON-ZERO=NO DUP   U6F00650
                    $NXEQ EQU     /35  INHIBIT EXEC SW,NON-ZERO=NO EXEQ U6F00660
                    $PBSY EQU     /36  PRINC PTR BUSY INDR,NON-ZERO=BSY U6F00670
                    $PGCT EQU     /37  PAGE NO. FOR PAGE HEADINGS       U6F00680
                    $EXIT EQU     /38  ADDR CALL EXIT ENTRY POINT       U6F00690
                    $LINK EQU     /39  ADDR CALL LINK ENTRY POINT       U6F00700
                    $S900 EQU     /3C                                   U6F00710
                    $S910 EQU     /3E                                   U6F00720
                    $DUMP EQU     /3F  ADDR CALL DUMP ENTRY POINT       U6F00730
                    $S000 EQU     /4D                                   U6F00740
                    $S100 EQU     /4E                                   U6F00750
                    $S150 EQU     /59                                   U6F00760
                    $CILA EQU     $S150+1 ADDR OF END OF DK I/O - 3     U6F00770
                    $DZ1N EQU     /76  DISKZ/1/N INDICATOR (-1,0,+1)    U6F00780
                    $DCDE EQU     /77  DRIVE CODE FOR CORE LOAD BLDR    U6F00790
                    $PHSE EQU     /78  NO. OF PHASE CURRENTLY IN CORE   U6F00800
                    $UFIO EQU     /79  ARM POSITION IN UNFORMATTED AREA U6F00810
                    $WSDR EQU     /7A  WORKING STORAGE DRIVE CODE       U6F00820
                    $WRD1 EQU     /7B  LOAD ADDR FOR CURR USER CORE LD  U6F00830
                    $KCSW EQU     /7C  INHIBIT INPUT/PRINT OVERLAP SW   U6F00840
                    $UFDR EQU     /7D  UNFORMATTED I/O DRIVE CODE       U6F00850
                    $CPTR EQU     /7E  CHANNEL 12 INDICATOR FOR CP      U6F00860
                    $1132 EQU     /7F  CHANNEL 12 INDICATOR FOR 1132    U6F00870
                    $1403 EQU     /80  CHANNEL 12 INDICATOR FOR 1403    U6F00880
                    $PST1 EQU     /81  ADDR POSTOP ERROR TRAP,LEVEL 1   U6F00890
                    $PST2 EQU     /85  ADDR POSTOP ERROR TRAP,LEVEL 2   U6F00900
                    $PST3 EQU     /89  ADDR POSTOP ERROR TRAP,LEVEL 3   U6F00910
                    $PST4 EQU     /8D  ADDR POSTOP ERROR TRAP,LEVEL 4   U6F00920
                    $STOP EQU     /91  ADDR PROGRAM STOP KEY TRAP       U6F00930
                    $FPAD EQU     /95  FILE PROTECT ADDR (ADJ),LOG DR 0 U6F00940
                    $CYLN EQU     /9A  ARM POSITION FOR LOGICAL DRIVE 0 U6F00950
                    $ACDE EQU     /9F  AREA CODE FOR LOGICAL DRIVE 0    U6F00960
                    $DCYL EQU     /A4  1ST DEF CYL ADDR, LOGICAL DR 0   U6F00970
                    $I200 EQU     /B3  ENTRY POINT TO ILS FOR LEVEL 2   U6F00980
                    $I205 EQU     /B8                                   U6F00990
                    $IBT2 EQU     $I205+1 ADDR OF IBT FOR LEVEL 2       U6F01000
                    $I210 EQU     /BA                                   U6F01010
                    $I290 EQU     /C2                                   U6F01020
                    $I400 EQU     /C4  ENTRY POINT TO ILS FOR LEVEL 4   U6F01030
                    $I403 EQU     /CF                                   U6F01040
                    $I405 EQU     /D3                                   U6F01050
                    $IBT4 EQU     $I405+1 ADDR OF IBT FOR LEVEL 4       U6F01060
                    $I410 EQU     /D6                                   U6F01070
                    $I415 EQU     /DE                                   U6F01080
                    $I490 EQU     /E8                                   U6F01090
                    $I491 EQU     /E9                                   U6F01100
                    $I492 EQU     /EA                                   U6F01110
                    $I494 EQU     /EC                                   U6F01120
                    $I495 EQU     /ED                                   U6F01130
                    $DBSY EQU     /EE  DISK BUSY INDR,NON-ZERO=DK BUSY  U6F01140
                    $SNLT EQU     $DBSY+1 SENSE LIGHT INDICATOR         U6F01150
                    $BYSW EQU     /1CB BYPASS SW,NOP IF FETCHING SOCAL  U6F01160
                    DZ000 EQU     /0F2 DISKZ ENTRY POINT                U6F01170
                    $PAUS EQU     DZ000-2 PAUSE INTERRUPT INDICATOR     U6F01180
                    $RWCZ EQU     DZ000-1 READ/WRITE SWITCH (CARDZ)     U6F01190
                    $ZEND EQU     /1E0 ADDR 1+LAST WORD OF DISKZ        U6F01200
                    $1END EQU     600  ADDR 1+LAST WORD OF DISK1        U6F01210
                    $NEND EQU     /370 ADDR OF END OF DISKN + 1         U6F01220
                    #IDAD EQU     /0000     SECT ADDR OF CART ID   2-11 U6F01225
                          HDNG    IDENT- PRINT CARTRIDGE IDS            U6F01230
                    * DETERMINE WHICH DRIVES HAVE CARTRIDGES MOUNTED    U6F01240
                    * AND READY, AND SAVE THEIR IDS IN PHYSICAL DRIVE   U6F01250
                    * ORDER.                                            U6F01260
                          SPAC    1                                     U6F01270
                    IT000 BSI  L  IT200                            2-11 U6F01280
                          SPAC    1                                     U6F01290
                    * PRINT HEADING ON PRINCIPAL PRINT DEVICE           U6F01300
                          SPAC    1                                     U6F01310
                          CALL    CALPR     PRINT HEADING               U6F01320
                          DC      IT920     ADDR OF PRINT LINE          U6F01330
                          DC      0                                     U6F01340
                          CALL    CALPR                                 U6F01350
                          DC      IT930     ADDR OF NEXT PRINT LINE     U6F01360
                          DC      1                                     U6F01370
                          SPAC    1                                     U6F01380
                    * FETCH CARTRIDGE READY INDICATOR. IF NOT ZERO      U6F01390
                    * FETCH CARTRIDGE ID. CONVERT TO EBCDIC, AND STORE  U6F01400
                    * IN PRINT BUFFER.                                  U6F01410
                          SPAC    1                                     U6F01420
                          LDX   1 -11       XR1 = MAX.NO. OF DRIVES2-11 U6F01430
                          LDX  L2 IT902     XR2 = ADDR OF AVAIL IND2-11 U6F01440
                    IT010 LDD   2 0         FETCH AVAIL CART IND   2-11 U6F01450
                          BSC  L  IT015,+-  BR IF CART NOT AVAIL ON     U6F01460
                    *                       *DRIVE  NOW BEING PROCESSED U6F01470
                          STD     IT910+9   *OTHERWISE SAVE PHY DR 2-11 U6F01480
                    *                       *NO. IN PRINT AREA     2-11 U6F01490
                          LD   L1 IT904+11  FETCH DR N CART ID     2-11 U6F01500
                          BSI  L  IT100     *AND GO CONVERT IT TO  2-11 U6F01510
                    *                       *EBCDIC AND STORE IN   2-11 U6F01520
                    *                       *PRINT AREA            2-11 U6F01530
                          SPAC    1                                     U6F01540
                    * PRINT PHYSICAL DRIVE NO. AND CARTRIDGE ID ON      U6F01550
                    * PRINCIPAL PRINT DEVICE                            U6F01560
                          SPAC    1                                     U6F01570
                          CALL    CALPR     PRINT ID AND PHY.DR.NO.     U6F01580
                          DC      IT910     ADDRESS OF PRINT LINE       U6F01590
                          DC      1         NO. OF LINES                U6F01600
                          SPAC    1                                     U6F01610
                          LD      IT914     BLANK                       U6F01620
                          STO     IT910+9   *PHYSICAL DR NO.       2-11 U6F01630
                          STO     IT910+10  *PHYSICAL DR NO.       2-11 U6F01640
                          STO     IT910+16  *AND CART. ID               U6F01650
                          STO     IT910+17  *AND CART. ID               U6F01660
                    IT015 MDX   2 2         INCRE CART AVAIL PNTR  2-11 U6F01670
                          MDX   1 1         DECRE CNT SKIP IF ZERO 2-11 U6F01680
                          MDX     IT010     GET NEXT ID                 U6F01690
                          SPAC    1                                     U6F01700
                          EXIT              E-O-J                       U6F01710
                          EJCT                                          U6F01720
                    *************************************************** U6F01730
                    * CONSTANTS, WORKAREA, AND PRINT LINES            * U6F01740
                    *************************************************** U6F01750
                          SPAC    1                                     U6F01760
                          BSS  E  0         ASSURE EVEN BOUNDARY        U6F01770
                    IT902 EBC     .000000010002000300040005.            U6F01780
                          EBC     .00060007000800090010.                U6F01790
                          BSS  E  1         ASSURE ODD BOUNDARY         U6F01800
                    IT910 DC      IT914-IT910    WORD COUNT             U6F01810
                          EBC     .                                   . U6F01820
                    IT914 DC      /4040     EBCDIC BLANKS               U6F01830
                    IT920 DC      IT925-IT920    WORD COUNT             U6F01840
                          EBC     .PAGE                               . U6F01850
                    IT925 DC      /4040                                 U6F01860
                    IT930 DC      IT935-IT930    WORD COUNT             U6F01870
                          EBC     .          PHYSICAL DRIVE    CART ID. U6F01880
                    IT935 DC      /4040                                 U6F01890
                          EJCT                                          U6F01900
                    *************************************************** U6F01910
                    * THIS SUBROUTINE CONVERTS A 16 BIT BINARY NUMBER * U6F01920
                    * TO FOUR EBCDIC VALUES THAT ARE THE EQUIVALENT   * U6F01930
                    * IN HEX.                                         * U6F01940
                    *  INPUT  - 16 BIT BINARY NUMBER IN ACCUMULATOR   * U6F01950
                    *  OUTPUT - FOUR EBCDIC VALUES PACKED TWO PER     * U6F01960
                    *           WORD AND STORED IN THE PRINT BUFFER.  * U6F01970
                    *                                                 * U6F01980
                    * XR1 AND XR2 ARE SAVED AND RESTORED              * U6F01990
                    *************************************************** U6F02000
                          SPAC    1                                     U6F02010
                    IT100 DC      *-*       ENTRY POINT/RETURN ADDR2-11 U6F02020
                          SPAC    1                                     U6F02030
                          SRT     16        NUMBER TO EXT          2-11 U6F02040
                          STX   1 IT190+1   SAVE XR1               2-11 U6F02050
                          STX   2 IT190+3   SAVE XR2               2-11 U6F02060
                          LDX   1 -2        SET OUTPUT WORD COUNT  2-11 U6F02070
                          SPAC    1                                     U6F02080
                    IT120 LDX   2 -2        SET CHAR PER WORD CNT  2-11 U6F02090
                          STO     IT183     STORE TEMPORARILY      2-11 U6F02100
                          SRA     16        CLEAR ACC TO ZERO      2-11 U6F02110
                          SLT     4         GET 4 BITS TO CONVT    2-11 U6F02120
                          S       IT180     SUB 9 TO CHK 0-9 OR A-F2-11 U6F02130
                          BSC     +         SKIP IF A-F            2-11 U6F02140
                          A       IT181     ADD /0039              2-11 U6F02150
                          A       IT182     ADD /00C0              2-11 U6F02160
                          SLA     8         SHIFT TO LEFT OF WORD  2-11 U6F02170
                          MDX   2 1         DECRE CHAR PER WD CNT  2-11 U6F02180
                          MDX     IT120+1   CONT IF WD NOT FULL    2-11 U6F02190
                          SPAC    1                                     U6F02200
                          SRA     8         OTHERWISE, SHIFT JUST  2-11 U6F02210
                          OR      IT183     *CNVTD WD TO RT,OR IN  2-11 U6F02220
                          STO  I  IT184     *1ST HALF,STO TO PRINT 2-11 U6F02230
                          MDX  L  IT184,1   INCRE PRINT AREA ADDR  2-11 U6F02240
                          SRA     16        SET TEMP STORE AREA    2-11 U6F02250
                          STO     IT183     *TO ZERO               2-11 U6F02260
                          SPAC    1                                     U6F02270
                          MDX   1 1         DECRE OUTPUT WD CNT    2-11 U6F02280
                          MDX     IT120     BR IF NOT FINISHED     2-11 U6F02290
                          SPAC    1                                     U6F02300
                    IT190 LDX  L1 *-*       *OTHERWISE, RESTORE    2-11 U6F02310
                          LDX  L2 *-*       *REGISTERS             2-11 U6F02320
                          MDX  L  IT184,-2  DECRE PRINT AREA ADDR  2-11 U6F02330
                          BSC  I  IT100     AND RETURN TO MAINLINE 2-11 U6F02340
                          SPAC    1                                     U6F02350
                    * CONSTANTS AND WORKAREA                            U6F02360
                          SPAC    1                                     U6F02370
                    IT180 DC      /0009     CONVERSION CONSTANTS   2-11 U6F02380
                    IT181 DC      /0039     *                      2-11 U6F02390
                    IT182 DC      /00C0     *                      2-11 U6F02400
                    IT183 DC      *-*       TEMP STOR FOR CNVT CHAR2-11 U6F02410
                    IT184 DC      IT910+16   PRINT AREA POINTER    2-11 U6F02420
                          EJCT                                          U6F02430
                    *************************************************** U6F02440
                    * THIS SUBROUTINE DETERMINES WHICH DRIVES HAVE    * U6F02450
                    * CARTRIDGES MOUNTED AND READY.  IT ALSO SAVES THE* U6F02460
                    * IDS IN PHYSICAL DRIVE ORDER.IF A DRIVE DOES NOT * U6F02470
                    * HAVE A CARTRIDGE MOUNTED AND READY, ITS ENTRY   * U6F02480
                    * IN THE PHYSICAL DRIVE LIST IS SET TO ZERO       * U6F02490
                    *************************************************** U6F02500
                          SPAC    1                                     U6F02510
                    IT200 DC      *-*       ENTRY/RETURN ADDRESS   2-11 U6F02520
                          SPAC    1                                     U6F02530
                    * SAVE VALUES OF $ACDE IN COMMA                     U6F02540
                          SPAC    1                                     U6F02550
                          LDX   2 -5        XR1 = $ACDE TABLE SIZE 2-11 U6F02560
                    IT205 LD   L2 $ACDE+5   LOAD FIRST ENTRY       2-11 U6F02570
                          STO  L2 IT926+5   *AND SAVE              2-11 U6F02580
                          MDX   2 1         SKIP IF FINISHED       2-11 U6F02590
                          MDX     IT205     *OTHERWISE, CONTINUE   2-11 U6F02600
                          SPAC    1                                     U6F02610
                          LDX  L2 IT902     XR2 = CART AVAIL IND   2-11 U6F02620
                          LDX   1 -11       DRIVE COUNT TO XR1     2-11 U6F02630
                          LD   L  $LEV2     SAVE CONTENTS          2-11 U6F02640
                          STO  L  IT923     *OF LOCATION 10        2-11 U6F02650
                          SPAC    1                                     U6F02660
                    IT210 LD   L  IT922     RESET INTERRUPT        2-11 U6F02670
                          STO  L  $LEV2     *BRANCH ADDRESS        2-11 U6F02680
                          LD   L1 IT924+11  FETCH AREA CODE        2-11 U6F02690
                          STO  L  $ACDE     STORE TO COMMA         2-11 U6F02700
                          OR      IT918     OR IN READ FUNC CODE   2-11 U6F02710
                          STO     IT911+1   STO TO 2ND WD OF IOCC  2-11 U6F02720
                          OR      IT921     OR IN SENSE FUNC CODE  2-11 U6F02730
                          STO     IT912+1   STO TO 2ND WD OF IOCC  2-11 U6F02740
                          XIO     IT911     INITIATE DISK READ     2-11 U6F02750
                          XIO     IT912     SENSE DISK             2-11 U6F02760
                          SLA     3         SHIFT BUSY BIT TO SIGN 2-11 U6F02770
                          BSC  L  IT230,+Z  BR IF DISK BUSY        2-11 U6F02780
                          SPAC    1                                     U6F02790
                    * DISK NOT BUSY, NO CARTRIDGE AVAILABLE             U6F02800
                          SPAC    1                                     U6F02810
                          SLA     16        SET PHY DR LIST ENTRY  2-11 U6F02820
                          STO   2 0         *TO ZERO               2-11 U6F02830
                          MDX     IT240     BR TO INCRE DR POINTER 2-11 U6F02840
                          SPAC    1                                     U6F02850
                    * OPERATION COMPLETE INTERRUPT PROCESSING           U6F02860
                          SPAC    1                                     U6F02870
                    IT220 DC      *-*       INT ENTRY POINT        2-11 U6F02880
                          XIO     IT912     SENSE WITH RESET       2-11 U6F02890
                          BOSC I  IT220     CONTINUE               2-11 U6F02900
                    IT918 DC      /0600     READ FUNC CODE         2-11 U6F02910
                          SPAC    1                                     U6F02920
                    * CARTRIDGE AVAILABLE, FETCH CARTRIDGE ID AND       U6F02930
                    * DEFECTIVE CYLINDER ADDRESS                        U6F02940
                          SPAC    1                                     U6F02950
                    IT230 LD      IT220     CHECK INT ENTRY POINT  2-11 U6F02960
                          BSC     +-        *FOR NON-ZERO, AND LOOP2-11 U6F02970
                          MDX     IT230     *UNTIL INTERRUPT OCCURS2-11 U6F02980
                          SLA     16        RESET INT ENTRY POINT  2-11 U6F02990
                          STO     IT220     *TO ZERO               2-11 U6F03000
                          LD      IT923     RESTORE CONTENTS       2-11 U6F03010
                          STO  L  $LEV2     *OF LOCATION 10        2-11 U6F03020
                          LD      IT915+1   SET ARM POSITION TO    2-11 U6F03030
                          STO  L  $CYLN     *SECTOR ADDR JUST READ 2-11 U6F03040
                          LD      IT917     FETCH ADDR OF I/O AREA 2-11 U6F03050
                          SRT     16        SHIFT TO EXT, ACC = 0  2-11 U6F03060
                          BSI  L  DZ000     BRANCH TO DISK READ    2-11 U6F03070
                          MDX  L  $DBSY,0   SKIP IF READ COMPLETE  2-11 U6F03080
                          MDX     *-3       LOOP IF NOT COMPLETE   2-11 U6F03090
                          SPAC    1                                     U6F03100
                          LD      IT908+3   FETCH CART ID AND      2-11 U6F03110
                          STO  L1 IT904+11  *STORE TO CART LIST    2-11 U6F03120
                    IT240 LD      IT923     RESTORE CONTENTS OF    2-11 U6F03130
                          STO  L  $LEV2     *LEVEL 2 INT ADDR      2-11 U6F03140
                          MDX   2 2         INCRE AVAIL CART PNTR  2-11 U6F03150
                          MDX   1 1         SKIP IF DR CNT = 0     2-11 U6F03160
                          MDX     IT210     *OTHERWISE, CONTINUE   2-11 U6F03170
                          SPAC    1                                     U6F03180
                    * RESTORE VALUES OF $ACDE IN COMMA, AND SINCE       U6F03190
                    * THIS SUBROUTINE HAS MOVED ALL ARMS TO CYL. 0      U6F03200
                    * TO READ THE CARTRIDGE ID, SET $CYLN TO ZERO       U6F03210
                          SPAC    1                                     U6F03220
                          LDX   2 -5        XR1 = TABLE LENGTH     2-11 U6F03230
                    IT250 LD   L2 IT926+5   RESTORE ORIGINAL       2-11 U6F03240
                          STO  L2 $ACDE+5   *CONTENTS OF $ACDE     2-11 U6F03250
                          SRA     16        SET CURRENT ARM        2-11 U6F03260
                          STO  L2 $CYLN+5   *POSITION TO ZERO      2-11 U6F03270
                          MDX   2 1         SKIP IF FINISHED       2-11 U6F03280
                          MDX     IT250     *OTHERWISE, CONTINUE   2-11 U6F03290
                          SPAC    1                                     U6F03300
                          BSC  I  IT200     RETURN TO MAINLINE     2-11 U6F03310
                          EJCT                                          U6F03320
                    * CONSTANTS AND WORK AREA                           U6F03330
                          SPAC    1                                     U6F03340
                          BSS  E  0         ASSURE EVEN BOUNDARY   2-11 U6F03350
                    IT904 BSS     11        CART LIST-PHY DR ORDER 2-11 U6F03360
                          DC      -1        CONSTANT OF -1         2-11 U6F03370
                    IT906 DC      4         WORD COUNT             2-11 U6F03380
                    IT907 DC      #IDAD     SECTOR ADDRESS         2-11 U6F03390
                    IT908 BSS  4  4         DEF CYL,ID I/O AREA    2-11 U6F03400
                    IT911 DC      IT915     ADDRESS OF I/O AREA    2-11 U6F03410
                          DC      *-*       2ND WORD OF READ IOCC  2-11 U6F03420
                    IT912 DC      /658      MAXIMUM ARM POSITION   2-11 U6F03430
                          DC      *-*       2ND WORD OF SENSE IOCC 2-11 U6F03440
                    IT915 DC      1         WORD COUNT             2-11 U6F03450
                          DC      *-*       I/O AREA               2-11 U6F03460
                    IT917 DC      IT906     ADDR OF ID I/O AREA    2-11 U6F03470
                    IT921 DC      /0701     SENSE W/RESET FUNC CODE2-11 U6F03480
                    IT922 DC      IT220     ADDR OF TEMP INT ROUTN 2-11 U6F03490
                    IT923 DC      *-*       $LEV2 SAVE AREA        2-11 U6F03500
                    IT924 DC      /2000     AREA CODE - PHY DR  0  2-11 U6F03510
                          DC      /8800     AREA CODE - PHY DR  1  2-11 U6F03520
                          DC      /9000     AREA CODE - PHY DR  2  2-11 U6F03530
                          DC      /9800     AREA CODE - PHY DR  3  2-11 U6F03540
                          DC      /A000     AREA CODE - PHY DR  4  2-11 U6F03550
                          DC      /B000     AREA CODE - PHY DR  5  2-11 U6F03560
                          DC      /B800     AREA CODE - PHY DR  6  2-11 U6F03570
                          DC      /B810     AREA CODE - PHY DR  7  2-11 U6F03580
                          DC      /B820     AREA CODE - PHY DR  8  2-11 U6F03590
                          DC      /B830     AREA CODE - PHY DR  9  2-11 U6F03600
                          DC      /B840     AREA CODE - PHY DR 10  2-11 U6F03610
                    IT926 BSS     5         $ACDE SAVE AREA        2-11 U6F03620
                          END     IT000                                 U6F03630
