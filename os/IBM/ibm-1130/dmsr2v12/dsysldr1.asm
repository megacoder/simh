                          HDNG    CARD INPUT SYSTEM LOADER - PHASE 1    DP100010
                    *************************************************** DP100020
                    *STATUS - VERSION 2, MODIFICATION 12              * DP100030
                    *                                                 * DP100040
                    *FUNCTION/OPERATION-                              * DP100050
                    *   PHASE 1 WILL PERFORM THE FOLLWING DURING A    * DP100060
                    *   SYSTEM LOAD-                                  * DP100070
                    *   * READ AND PROCESS THE LOAD MODE RECORD.      * DP100080
                    *   * READ THE RESIDENT MONITOR, DISKZ AND THE    * DP100090
                    *     COLD START PROGRAM AND ROLL THE RESIDENT    * DP100100
                    *     MONITOR AND DISKZ TO THEIR PROPER CORE      * DP100110
                    *     LOCATIONS FOR USE.                          * DP100120
                    *   * CHECK THE CHECKSUM OF SLET AND THE RELOAD   * DP100130
                    *     TABLE FOR VALIDITY AND PACK SLET IF PREVIOUS* DP100140
                    *     CHECKSUM IS ZERO ON A RELOAD FUNCTION.      * DP100150
                    *   * WRITE THE COLD START PROGRAM AND RESIDENT   * DP100160
                    *     IMAGE TO DISK.                              * DP100170
                    *   * READ PHASE 2 AND WRITE IT TEMPORARLY TO     * DP100180
                    *     DISK.                                       * DP100190
                    *   * READ AND CONDENSE THE SYSTEM CONFIGURATION  * DP100200
                    *     RECORDS.                                    * DP100210
                    *   * READ AND PROCESS THE PHID RECORD(S).        * DP100220
                    *   * READ PHASE 2 INTO CORE AND BRANCH TO IT.    * DP100230
                    *                                                 * DP100240
                    *ENTRY POINT-                                     * DP100250
                    *   * ENTERED AT 'AA000' FROM THE CORE IMAGE      * DP100260
                    *     LOADER.                                     * DP100270
                    *                                                 * DP100280
                    *INPUT-                                           * DP100290
                    *   * LOAD MODE CARD, SYSTEM CONFIGURATION CARDS, * DP100300
                    *     AND PHID CARD ARE IN HOLLERITH              * DP100310
                    *   * ALL OTHER INPUT CARDS ARE BINARY, ASSEMBLED * DP100320
                    *     IN RELOCATABLE-ABSOLUTE FORMAT.             * DP100330
                    *                                                 * DP100340
                    *OUTPUT-                                          * DP100350
                    *   * PARTIAL CARTRIDGE LOAD.                     * DP100360
                    *                                                 * DP100370
                    *EXTERNAL REFERENCES-                             * DP100380
                    *   NONE                                          * DP100390
                    *                                                 * DP100400
                    *EXIT-                                            * DP100410
                    *   * EXITS FROM 'LDPH2' TO ENTER PHASE 2 AT      * DP100420
                    *     'BA000' AFTER THE PHID RECORD IS READ       * DP100430
                    *     AND PROCESSED.                              * DP100440
                    *                                                 * DP100450
                    *TABLES/BUFFERS-                                  * DP100460
                    *   * CONFG- TABLE INTO WHICH DATA FROM SYSTEM    * DP100470
                    *     CONFIGURATION RECORDS IS ACCUMULATED        * DP100480
                    *   * AA904- 80 WORD CARD INPUT BUFFER            * DP100490
                    *   * AA902- 60 WORD CARD BUFFER INTO WHICH DATA  * DP100500
                    *     FROM AA904 IS COMPRESSED.                   * DP100510
                    *   * BUFFR- 320 (OR 640) WORD DISK I/O BUFFER.   * DP100520
                    *                                                 * DP100530
                    *ATTRIBUTES-                                      * DP100540
                    *   * N/A                                         * DP100550
                    *                                                 * DP100560
                    *NOTES-                                           * DP100570
                    *   * THIS PHASE MUST BE IN CORE IMAGE FORMAT TO  * DP100580
                    *     BE LOADED BY 2501/1442 CORE IMAGE LOADER.   * DP100590
                    *   * THE SYSTEM LOAD IS PERFORMED ON DRIVE WHOSE * DP100600
                    *     PHYSICAL NUMBER IS SET IN BIT SWITCHES 12-15* DP100610
                    *                                                 * DP100620
                    *************************************************** DP100630
                          HDNG    CARD INPUT SYSTEM LOADER - PHASE 1    DP100640
                          ABS                                           DP100650
                    *                                                   DP100660
                    * COMMA EQUATES                                     DP100670
                    *                                                   DP100680
                    $ACDE EQU     /9F  TABLE OF AREA CODES              DP100690
                    $CH12 EQU     /06  CHANNEL 12 INDICATOR             DP100700
                    $CILA EQU     /5A  ADDRESS OF END OF DISK SUBR      DP100710
                    $COMN EQU     /07  LENGTH OF COMMON (IN WORDS)      DP100720
                    $CORE EQU     /0E  SIZE OF CORE                     DP100730
                    $CPTR EQU     /7E  CNSL PTR CHANNEL 12 INDICATOR    DP100740
                    $CTSW EQU     /0F  CONTROL RECORD TRAP SWITCH       DP100750
                    $CIBA EQU     /05  SCTR ADDR OF CIB                 DP100760
                    $CYLN EQU     /9A  ARM POSITION                     DP100770
                    $DBSY EQU     /EE  NON-ZERO WHEN DISKZ BUSY         DP100780
                    $DADR EQU     /10  BLK ADDR OF PROG TO BE LOADED    DP100790
                    $DCDE EQU     /77  DRIVE CODE OF PROG IN WRK STG    DP100800
                    $DCYL EQU     /A4  TABLE OF DEFECTIVE CYLINDERS     DP100810
                    $DREQ EQU     /12  IND. FOR REQUESTED VERSION DKI/O DP100820
                    $DUMP EQU     /3F  CALL DUMP ENTRY POINT            DP100830
                    $DZIN EQU     /76  DISK SUBROUTINE IN CORE INDR     DP100840
                    $EXIT EQU     /38  CALL EXIT ENTRY POINT            DP100850
                    $FLSH EQU     /71  FLUSH JOB SWITCH                 DP100860
                    $FPAD EQU     /95  TABLE OF FILE PROTECT ADDRESSES  DP100870
                    $HASH EQU     /14  WORK AREA                        DP100880
                    $IBSY EQU     /13  NON-ZERO IF CD/PAP TP DEV. BUSY  DP100890
                    $IBT2 EQU     /B9  LEVEL 2 INTRPT BRANCH TABLE ADDR DP100900
                    $IBT4 EQU     /D4  ADDR OF THE IBT, LEVEL 4         DP100910
                    $IOCT EQU     /32  ZERO IF NO I/O IN PROGRESS       DP100920
                    $IREQ EQU     /2C  ADDR OF INT REQUEST SUBROUTINE   DP100930
                    $I200 EQU     /B3  ILS02 ENTRY POINT                DP100940
                    $I205 EQU     /B8  ILS02 INTERRUPT ENTRY POINT      DP100950
                    $I400 EQU     /C4  ILS04 ENTRY POINT                DP100960
                    $I403 EQU     /D0                                   DP100970
                    $KCSW EQU     /7C  1 IF KB,CP BOTH UTILIZED         DP100980
                    $LAST EQU     /33  LAST CARD INDICATOR              DP100990
                    $LEV0 EQU     /08  LEVEL 0 BRANCH ADDRESS           DP101000
                    $LEV1 EQU     /09  LEVEL 1 BRANCH ADDRESS           DP101010
                    $LEV2 EQU     /0A  LEVEL 2 BRANCH ADDRESS           DP101020
                    $LEV3 EQU     /0B  LEVEL 3 BRANCH ADDRESS           DP101030
                    $LEV4 EQU     /0C  LEVEL 4 BRANCH ADDRESS           DP101040
                    $LEV5 EQU     /0D  LEVEL 5 BRANCH ADDRESS           DP101050
                    $LINK EQU     /39  CALL LINK ENTRY POINT            DP101060
                    $NDUP EQU     /34  DO NOT DUP IF NON-ZERO           DP101070
                    $NXEQ EQU     /35  DO NOT EXECUTE IF NON-ZERO       DP101080
                    $PBSY EQU     /36  NON-ZERO WHEN PRINTER BUSY       DP101090
                    $PGCT EQU     /37  PAGE NO. FOR HEADINGS            DP101100
                    $PHSE EQU     /78  NO. OF PHASE NOW IN CORE         DP101110
                    $PRET EQU     /28  IOCS SOFT ERROR TRAP             DP101120
                    $PST1 EQU     /81  TRAP FOR I/O ERRORS, LEVEL 1     DP101130
                    $PST2 EQU     /85  TRAP FOR I/O ERRORS, LEVEL 2     DP101140
                    $PST3 EQU     /89  TRAP FOR I/O ERRORS, LEVEL 3     DP101150
                    $PST4 EQU     /8D  TRAP FOR I/O ERRORS, LEVEL 4     DP101160
                    $SNLT EQU     /EF  SENSE LIGHT INDICATOR            DP101170
                    $STOP EQU     /91  PROGRAM STOP KEY TRAP            DP101180
                    $SYSC EQU     /E0  MODIFICATION LEVEL               DP101190
                    $UFDR EQU     /7D  DRIVE CODE OF UNFORMATTED I/O    DP101200
                    $UFIO EQU     /79  UNFORMATTED I/O RECORD NO.       DP101210
                    $ULET EQU     /2D  TABLE OF LET ADDRESSES           DP101220
                    $WSDR EQU     /7A  WORKING STORAGE DRIVE CODE       DP101230
                    $WRD1 EQU     /7B  ADDR OF 1ST WD OF CORE LOAD      DP101240
                    $ZEND EQU     /1E0 END OF DISKZ                     DP101250
                    $1132 EQU     /7F  1132 PRINTER CHANNEL 12 INDR     DP101260
                    $1403 EQU     /80  1403 PRINTER CHANNEL 12 INDR     DP101270
                    *                                                   DP101280
                    * DCOM RELATIVE EQUATES                             DP101290
                    *                                                   DP101300
                    #SYSC EQU     08        SYS/NON-SYS CARTRIDGE INDR  DP101310
                    #FPAD EQU     45        FILE PROTECT ADDRESS        DP101320
                    #CIDN EQU     55        CARTRIDGE ID                DP101330
                    #CIBA EQU     60        SECTOR ADDRESS OF CIB       DP101340
                    #SCRA EQU     65        SECTOR ADDRESS OF SCRA      DP101350
                    #FLET EQU     75        FLET SECTOR ADDRESS         DP101360
                    #ULET EQU     80        LET SECTOR ADDRESS          DP101370
                    #CSHN EQU     90        SECTOR COUNT OF CUSHION     DP101380
                    *                                                   DP101390
                    * ABSOLUTE EQUATES                                  DP101400
                    *                                                   DP101410
                    @IDAD EQU     /0000     CART ID, COLD START SAD     DP101420
                    @DCOM EQU     /0001     DCOM SECTOR ADDRESS         DP101430
                    @RIAD EQU     /0002     RESIDENT IMAGE SECTOR ADDR  DP101440
                    @SLET EQU     /0003     FIRST SLET SECTOR ADDRESS   DP101450
                    @RLTB EQU     /0006     RELOAD TABLE SECTOR ADDRESS DP101460
                    @HDNG EQU     /0007     PAGE HEADING SECTOR ADDRESS DP101470
                    @P2AD EQU     /0630     SYS LDR - PHASE 2 SCTR ADDR DP101480
                    @MSCT EQU     /0658     MAXIMUM SECTOR ADDRESS - 1  DP101490
                    @COLD EQU     /0030     RLTV ADDR 1ST WD COLD START DP101500
                    @CSTR EQU     /00D0                                 DP101510
                    DZ000 EQU     /00F2     DISKZ ENTRY POINT           DP101520
                    @WDCT EQU     0         RLTV ADDR WORD COUNT IN BFR DP101530
                    @SADR EQU     1         RLTV ADDR SCTR ADDR IN BFR  DP101540
                    @NDCY EQU     3         MAX NO. OF DEF CYLINDERS    DP101550
                    @MXDR EQU     5         MAX NO. OF DISK DRIVES      DP101560
                    @CIDN EQU     3         RLTV ADDR OF CARTRIDGE ID   DP101570
                    @STAT EQU     7         RLTV ADDR CART STATUS WORD  DP101580
                    @PRWC EQU     60        PRINTER BUFFER LENGTH       DP101590
                    @CCOL EQU     80        NUMBER OF COLUMNS PER CARD  DP101600
                    @SCNT EQU     320       NUMBER OF WORDS PER SECTOR  DP101610
                    @MNCR EQU     4096      MINIMUM ALLOWABLE CORE SIZE DP101620
                    *                                                   DP101630
                    * SYSTEM DEVICE SUBROUTINE PHASE IDS                DP101640
                    *                                                   DP101650
                    P1403 EQU     140       PHASE ID OF SYS 1403 SUBR   DP101660
                    P1132 EQU     141       PHASE ID OF SYS 1132 SUBR   DP101670
                    PCPAD EQU     142       PHASE ID OF SYS C. P. SUBR  DP101680
                    I2501 EQU     143       PHASE ID OF SYS 2501 SUBR   DP101690
                    I1442 EQU     144       PHASE ID OF SYS 1442 SUBR   DP101700
                    I1134 EQU     145       PHASE ID OF SYS PAPT SUBR   DP101710
                    IKBRD EQU     146       PHASE ID OF SYS KEYBRD SUBR DP101720
                    CDCNV EQU     147       PH ID OF SYS 2501/1442 CONV DP101730
                    C1134 EQU     148       PHASE ID OF SYS 1134 CONV   DP101740
                    CKBRD EQU     149       PHASE ID OF SYS KEYBRD CONV DP101750
                    DISKZ EQU     150       PHASE ID OF DISKZ SUBR      DP101760
                    DISK1 EQU     151       PHASE ID OF DISK1 SUBR      DP101770
                    DISKN EQU     152       PHASE ID OF DISKN SUBR      DP101780
                    PRINT EQU     153       PH ID OF PRINC PRINT SUBR   DP101790
                    PINPT EQU     154       PH ID OF PRINC INPUT SUBR   DP101800
                    PIDEV EQU     155       PRINC INPUT EXCLUDING KEYBD DP101810
                    CNVRT EQU     156       PRINC SYS CONVERSION SUBR   DP101820
                    CVRT  EQU     157       PRINC CONV EXCLUDING KEYBRD DP101830
                    *                                                   DP101840
                    * DEVICE CODES                                      DP101850
                    *                                                   DP101860
                    @I510 EQU     /2000     AREA CODE FOR DISK DRIVE 0  DP101870
                    @I511 EQU     /8800     AREA CODE FOR DISK DRIVE 1  DP101880
                    @I512 EQU     /9000     AREA CODE FOR DISK DRIVE 2  DP101890
                    @I513 EQU     /9800     AREA CODE FOR DISK DRIVE 3  DP101900
                    @I514 EQU     /A000     AREA CODE FOR DISK DRIVE 4  DP101910
                    @I515 EQU     /B000     AREA CODE FO PHY DR  5 2-11 DP101911
                    @I516 EQU     /B800     AREA CODE FO PHY DR  6 2-11 DP101912
                    @I517 EQU     /B810     AREA CODE FO PHY DR  7 2-11 DP101913
                    @I518 EQU     /B820     AREA CODE OF PHY DR  8 2-11 DP101914
                    @I519 EQU     /B830     AREA CODE OF PHY DR  9 2-11 DP101915
                    @I520 EQU     /B840     AREA CODE OF PHY DR 10 2-11 DP101916
                    @I208 EQU     /0900     CNSL PTR PRINT IOCC         DP101920
                    @I206 EQU     /0F01     CNSL PTR SENSE DSW W/RESET  DP101930
                    @D100 EQU     /1000     1442 NOT READY DISPLAY CODE DP101940
                    @I102 EQU     /1100     1442 PUNCH A COLUMN IOCC    DP101950
                    @I103 EQU     /1200     1442 READ A COLUMN IOCC     DP101960
                    @I104 EQU     /1401     1442 START PUNCH IOCC       DP101970
                    @I105 EQU     /1402     1442 FEED A CARD IOCC       DP101980
                    @I106 EQU     /1404     1442 START READER IOCC      DP101990
                    @I108 EQU     /1701     1442 SEN DSW W/RESET HI PRI DP102000
                    @I109 EQU     /1702     1442 SEN DSW W/RESET LO PRI DP102010
                    @D200 EQU     /2000     CNSL PTR NOT READY DISPLAY  DP102020
                    @I000 EQU     /3A00     READ DATA SWITCHES IOCC     DP102030
                    @I402 EQU     /4E00     2501 INITIATE READ IOCC     DP102040
                    @I404 EQU     /4F01     2501 SENSE DSW WITH RESET   DP102050
                          HDNG    FETCH AND BRANCH TO PHASE 2           DP102060
                          ORG     $ZEND     BEGIN AT END OF DISKZ       DP102070
                    *                                                   DP102080
                    *                                                   DP102090
                    LDPH2 LDD     LD900     FETCH AND STORE             DP102100
                          STD  L  PHAS2     *WORD COUNT AND SCTR ADDR   DP102110
                          LDD     LD902     FETCH FUNC CODE, I/O ADDR   DP102120
                          BSI  L  DZ000     BRANCH TO DISK READ         DP102130
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  DP102140
                          MDX     *-3       BR TO TEST READ COMPLETE    DP102150
                          BSC  L  PHAS2+2   BRANCH TO PHASE 2           DP102160
                    *                                                   DP102170
                    * CONSTANTS AND WORK AREAS                          DP102180
                    *                                                   DP102190
                          BSS  E  0                                     DP102200
                    LD900 DC      @MNCR-PHAS2-2  WORD COUNT OF PHASE 2  DP102210
                          DC      @P2AD          SCTR ADDR OF PHASE 2   DP102220
                    LD902 DC      /0000     READ FUNCTION CODE          DP102230
                          DC      PHAS2     PHASE 2 I/O AREA            DP102240
                          HDNG    SYSTEM LOADER COMMUNICATIONS AREA     DP102250
                    CILWC DC      *-*       CORE IMAGE LOADER WORD CNT  DP102260
                          DC      *-*       CORE IMAGE LOADER SCTR ADDR DP102270
                    RINDR DC      *-*       CD RDR INDR- 0=2501,NZ=1442 DP102280
                    DCYL1 DC      /0658     SCTR ADDR OF 1ST DEF CYLIN  DP102290
                    DCYL2 DC      /0658     SCTR ADDR OF 2ND DEF CYLIN  DP102300
                    DCYL3 DC      /0658     SCTR ADDR OF 3RD DEF CYLIN  DP102310
                    LMODE DC      *-*       LOAD MODE IMAGE             DP102320
                    CAREA DC      *-*       NO. SECTORS OF CUSHION AREA DP102330
                    T1442 DC      *-*       SET 1 IF 1442-6 OR 7 AVAIL  DP102340
                    DINDR DC      *-*       ISS DEVICE INDICATOR        DP102350
                    VERSN DC      *-*       VERSION AND MODIFICATION NO DP102360
                    CIBFR DC      *-*       SCTR ADDR OF CORE IMAGE BFR DP102370
                    SCORE DC      *-*       CORE SIZE                   DP102380
                    MAXPH DC      *-*       MAXIMUM PHASE ID            DP102390
                    ASCRA DC      *-*       SECTOR ADDRESS OF SCRA      DP102400
                    CARID DC      *-*       ID OF CARTRIDGE             DP102410
                    FLETI DC      *-*       FIXED AREA INDICATOR        DP102420
                    FPADR DC      *-*       FILE PROTECT ADDRESS        DP102430
                    SSBFR DC      *-*       NO. OF SCTRS FOR SLET BFR   DP102440
                    LET00 DC      *-*       PRE-LOAD LET SECTOR ADDRESS DP102450
                    SHIFT DC      *-*       NO. OF SCTRS TO SHIFT       DP102460
                    *                                                   DP102470
                          BSS     23        COMMUNICATIONS PATCH AREA   DP102480
                    *                                                   DP102490
                    PTRID DC      *-*       PH ID OF PRINC PRINT SUBR   DP102500
                    CHN12 DC      *-*       ADDRESS OF CHANNEL 12 INDR  DP102510
                    RDRID DC      *-*       PH ID OF PRINC I/O SUBR     DP102520
                    CNVID DC      *-*       PH ID OF PRINC CONV SUBR    DP102530
                    PRNRD DC      *-*       PRINCIPLE I/O DEVICE INDR   DP102540
                    PRNPR DC      *-*       PRINCIPLE PRINT DEVICE INDR DP102550
                    *                                                   DP102560
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   DP102570
                    PAIR1 DC      *-*       LOWER PHASE ID RANGE     E  DP102580
                          DC      *-*       UPPER PHASE ID RANGE     O  DP102590
                    PAIR2 DC      *-*       LOWER PHASE ID RANGE     E  DP102600
                          DC      *-*       UPPER PHASE ID RANGE     O  DP102610
                    PAIR3 DC      *-*       LOWER PHASE ID RANGE     E  DP102620
                          DC      *-*       UPPER PHASE ID RANGE     O  DP102630
                    PAIR4 DC      *-*       LOWER PHASE ID RANGE     E  DP102640
                          DC      *-*       UPPER PHASE ID RANGE     O  DP102650
                    PAIR5 DC      *-*       LOWER PHASE ID RANGE     E  DP102660
                          DC      *-*       UPPER PHASE ID RANGE     O  DP102670
                    PAIR6 DC      *-*       LOWER PHASE ID RANGE     E  DP102680
                          DC      *-*       UPPER PHASE ID RANGE     O  DP102690
                    PAIR7 DC      *-*       LOWER PHASE ID RANGE     E  DP102700
                          DC      *-*       UPPER PHASE ID RANGE     O  DP102710
                    PAIR8 DC      *-*       LOWER PHASE ID RANGE     E  DP102720
                          DC      *-*       UPPER PHASE ID RANGE     O  DP102730
                    PAIR9 DC      *-*       LOWER PHASE ID RANGE     E  DP102740
                          DC      *-*       UPPER PHASE ID RANGE     O  DP102750
                    PAIRA DC      *-*       LOWER PHASE ID RANGE     E  DP102760
                          DC      *-*       UPPER PHASE ID RANGE     O  DP102770
                    PAIRB DC      *-*       LOWER PHASE ID RANGE     E  DP102780
                          DC      *-*       UPPER PHASE ID RANGE     O  DP102790
                    PAIRC DC      *-*       LOWER PHASE ID RANGE     E  DP102800
                          DC      *-*       UPPER PHASE ID RANGE     O  DP102810
                    PAIRD DC      *-*       LOWER PHASE ID RANGE     E  DP102820
                          DC      *-*       UPPER PHASE ID RANGE     O  DP102830
                    PAIRE DC      *-*       LOWER PHASE ID RANGE     E  DP102840
                          DC      *-*       UPPER PHASE ID RANGE     O  DP102850
                    PAIRF DC      0         ZERO INDIC END OF PAIRS  E  DP102860
                    LPHID DC      *-*       LAST PH ID FOR INITIAL LOAD DP102870
                    *                                                   DP102880
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   DP102890
                    LOLIM DC      /0333     LOWER PHASE ID BYPASS LIMIT DP102900
                    UPLIM DC      /0999     UPPER PHASE ID BYPASS LIMIT DP102910
                          DC      *-*                                   DP102920
                          DC      *-*                                   DP102930
                          DC      *-*                                   DP102940
                          DC      *-*                                   DP102950
                          DC      *-*                                   DP102960
                          DC      *-*                                   DP102970
                          DC      *-*                                   DP102980
                          DC      *-*                                   DP102990
                          DC      *-*                                   DP103000
                    *                                                   DP103010
                    * ERROR MESSAGES                                    DP103020
                    *                                                   DP103030
                    MSG01 DC      MSG02-*   WORD COUNT OF MESSAGE E 01  DP103040
                          DMES    'RE 01 CHECKSUM ERROR'R'E             DP103050
                    *                                                   DP103060
                    MSG02 DC      MSG03-*   WORD COUNT OF MESSAGE E 02  DP103070
                          DMES    'RE 02 INVALID RECORD OR BLANK'R'E    DP103080
                    *                                                   DP103090
                    MSG03 DC      MSG04-*   WORD COUNT OF MESSAGE E 03  DP103100
                          DMES    'RE 03 SEQ ERROR OR MISSING RECORDS'R DP103110
                    *                                                   DP103120
                    MSG04 DC      MSG05-*   WORD COUNT OF MESSAGE E 04  DP103130
                          DMES    'RE 04 ORG BACKWARD'R'E               DP103140
                    *                                                   DP103150
                    MSG05 DC      INTPT-*   WORD COUNT OF MESSAGE E 05  DP103160
                          DMES    'RE 05 INITIALIZE THE CARTRIDGE'R'E   DP103170
                    *                                                   DP103180
                    * INHIBIT INTERRUPT REQUEST                         DP103190
                    *                                                   DP103200
                    INTPT DC      0         ENTRY                       DP103210
                          XIO     IN901-1   SENSE INTRPT DSW WITH RESET DP103220
                          BSC  L  $I403+5   BRANCH TO ILS04 SUBROUTINE  DP103230
                    *                                                   DP103240
                    * CONSTANTS AND WORK AREAS                          DP103250
                    *                                                   DP103260
                          BSS  E  1         FORCE NEXT LOC TO BE ODD    DP103270
                    IN901 DC      /0F01     SEN INTRPT DSW W/RESET IOCC DP103280
                          DC      0         AVAILABLE                   DP103290
                          HDNG    CONSOLE PRINTER SUBROUTINE - WRTYZ    DP103300
                    *                                                   DP103310
                    * PROGRAM ENTRY                                     DP103320
                    *                                                   DP103330
                    WRTYZ DC      0         ENTRY/RETURN ADDRESS        DP103340
                          MDX     TZ200     BRANCH TO START             DP103350
                    *                                                   DP103360
                    * INTERRUPT ENTRY -  ILS04 BRANCHES TO 'TZ100'      DP103370
                    * WHEN AN INTERRUPT OCCURS.  THIS SECTION           DP103380
                    * PROCESSES INTERRUPTS AND RETURNS TO THE POINT     DP103390
                    * FROM WHICH THE INTERRUPT OCCURED THROUGH          DP103400
                    * THE ILS04 SUBROUTINE                              DP103410
                    *                                                   DP103420
                    TZ100 DC      0         INTERRUPT ENTRY             DP103430
                          XIO     TZ900     SENSE DSW WITH RESET        DP103440
                          STX     TZ906     SET FLAG TO INDICATE INTRPT DP103450
                          BSC  I  TZ100     RETURN TO ILS04             DP103460
                    *                                                   DP103470
                    * 'WRTYZ' MAINLINE SECTION                          DP103480
                    * INITIALIZE SUBROUTINE                             DP103490
                    *                                                   DP103500
                    TZ200 STX   2 TZ907     SAVE I/O BUFFER WORD COUNT  DP103510
                          SRA     16        SET INDICATOR TO PRINT      DP103520
                          STO     TZ905     *FROM LEFT HALF OF WORD     DP103530
                          BSI     TZ400     BR TO TEST IF DEVICE READY  DP103540
                    *                                                   DP103550
                    * MAIN LOOP                                         DP103560
                    * DETERMINE WHICH HALF OF WORD FROM WHICH TO        DP103570
                    * FETCH CHARACTER, SAVE CHARACTER TO BE             DP103580
                    * PRINTED AND UPDATE LEFT-RIGHT INDICATOR           DP103590
                    *                                                   DP103600
                    TZ300 LD      TZ905     FETCH LEFT-RIGHT INDICATOR  DP103610
                          BSC  L  TZ310,Z   BRANCH TO FETCH RIGHT HALF  DP103620
                          STX     TZ905     SET INDR FOR RIGHT HALF     DP103630
                          LD    1 0         FETCH A WORD FROM I/O BFR   DP103640
                          MDX     TZ320                                 DP103650
                    TZ310 SRA     16        SET INDICATOR               DP103660
                          STO     TZ905     *FOR LEFT HALF NEXT         DP103670
                          LD    1 0         FETCH A WORD FROM I/O BFR   DP103680
                          SLT     8         SHIFT TO LEFT HALF          DP103690
                    TZ320 AND     TZ904     MASK OUT RIGHT HALF OF WORD DP103700
                    *                                                   DP103710
                    * PRINT THE CHARACTER                               DP103720
                    *                                                   DP103730
                          STO     TZ908     STORE IN OUTPUT BUFFER WORD DP103740
                          XIO     TZ902     PRINT CHARACTER             DP103750
                    *                                                   DP103760
                    * WAIT FOR INTERRUPT TO OCCUR                       DP103770
                    *                                                   DP103780
                    TZ340 LD      TZ906     FETCH INTERRUPT INDICATOR   DP103790
                          BSC  L  TZ340,+-  BRANCH IF INDR = 0          DP103800
                          SLA     16        CLEAR INDICATOR FOR         DP103810
                          STO     TZ906     *NEXT INTERRUPT             DP103820
                    *                                                   DP103830
                    * TEST FOR FORMS CHECK                              DP103840
                    *                                                   DP103850
                          BSI     TZ400     BR TO TEST IF DEVICE READY  DP103860
                          MDX  L  TZ905,0   SKIP IF LEFT HALF NEXT      DP103870
                          MDX     TZ300     BRANCH TO FETCH NEXT CHAR   DP103880
                          MDX   1 1         INCREMENT I/O BUFFER ADDR   DP103890
                          MDX   2 -1        DECR WORD CNT, SKIP IF ZERO DP103900
                          MDX     TZ300     BRANCH TO FETCH NEXT CHAR   DP103910
                          BSC  I  WRTYZ     RETURN                      DP103920
                    *                                                   DP103930
                    * CONSTANTS AND WORK AREAS                          DP103940
                    *                                                   DP103950
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   DP103960
                    TZ900 DC      @D200     ERROR INDICATOR             DP103970
                          DC      @I206     SENSE DSW WITH RESET IOCC   DP103980
                    TZ902 DC      TZ908     ADDRESS OF CHARACTER BUFFER DP103990
                          DC      @I208     PRINT IOCC                  DP104000
                    TZ904 DC      /FF00     MASK OUT RIGHT HALF OF WORD DP104010
                    TZ905 DC      *-*       LEFT-RIGHT CHARACTER INDR   DP104020
                    TZ906 DC      *-*       INTERRUPT WAIT INDICATOR    DP104030
                    TZ907 DC      *-*       I/O BUFFER WORD COUNT       DP104040
                    TZ908 DC      *-*       CHARACTER PRINT BUFFER      DP104050
                    TZ909 EQU     TZ900     ADDRESS OF ERROR INDICATOR  DP104060
                    *                                                   DP104070
                    * CHECK FOR CONSOLE PRINTER READY                   DP104080
                    * IF CONSOLE PRINTER                                DP104090
                    * NOT READY                                         DP104100
                    * FETCH ERROR CODE TO ACCUMULATOR AND               DP104110
                    * BRANCH TO SYSTEM PRE OPERATIVE ERROR TRAP         DP104120
                    *                                                   DP104130
                    TZ400 DC      0         ENTRY POINT                 DP104140
                          XIO     TZ900     SENSE DSW WITH RESET        DP104150
                          SLA     5         SHIFT DEV BUSY BIT TO SIGN  DP104160
                          BSC  I  TZ400,-   RETURN IF NOT BUSY          DP104170
                          LD      TZ909     FETCH ERROR INDICATOR       DP104180
                          BSI  L  $PRET     BR TO PRE-OP ERROR TRAP     DP104190
                          MDX     TZ400+1   BRANCH TO TEST BUSY AGAIN   DP104200
                          HDNG    SYSTEM 1442/1442 SUBROUTINE           DP104210
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   DP104220
                    CD000 BSC  L  *-*       EXIT/ENTRY                  DP104230
                          MDX     CD080     GO TO CALL PROCESSING       DP104240
                    *                                                   DP104250
                    * END OF CARD INTERRUPT   (LEVEL 4)                 DP104260
                    *                                                   DP104270
                    CD010 BSC  L  *-*       EXIT/ENTRY                  DP104280
                          MDX     CD020                                 DP104290
                    *                                                   DP104300
                    * COLUMN INTERRUPT        (LEVEL 0)                 DP104310
                    *                                                   DP104320
                    CD016 BOSC L  *-*       EXIT (LEVEL 0 OFF)/ENTER    DP104330
                          STD     CD190     SAVE ACC AND EXTENSION      DP104340
                          STS     CD018     SAVE STATUS INDICATORS      DP104350
                          XIO     CD210     RESET LEVEL 0 DSW           DP104360
                          XIO     CD250     READ OR PUNCH COLUMN        DP104370
                          LD      CD250     ADD 1 TO COLUMN ADDRESS     DP104380
                          A       CD240     OF READ OR PUNCH COLUMN     DP104390
                          STO     CD250     IOCC FOR NEXT COLUMN        DP104400
                          LDD     CD190     RELOAD ACC AND EXTENSION    DP104410
                    CD018 LDS     0         RELOAD STATUS INDICATORS    DP104420
                          MDX     CD016     GO TO LEVEL 0 EXIT          DP104430
                    *                                                   DP104440
                    CD020 LDX  L1 $PRET     ADDRESS OF SOFTWARE TRAP    DP104450
                          XIO     CD215                                 DP104460
                          SLA     3         SAVE ERROR BIT IN CARRY     DP104470
                          BSC     C         IF NO ERROR CHECK LAST CARD DP104480
                          MDX     CD050     ERROR  CONTINUE AT CD050    DP104490
                          BSC     +Z        NOT LAST CARD IF NOT MINUS  DP104500
                          MDX     CD040     LAST CARD CONTINUE AT CD040 DP104510
                          SLT     16        SET ZEROS IN EXTENSION      DP104520
                          LD      CD188     AFTER LOADING CARD SKIP     DP104530
                          RTE     16        INDICATOR, UNCONDITIONALLY  DP104540
                          STO     CD188     CLEAR IT ZERO.              DP104550
                          RTE     16        IF LAST OPERATION WAS A     DP104560
                          BSC     Z         SKIP, INITIATE FUNCTION     DP104570
                          MDX     CD060     AT CD060.                   DP104580
                    *                                                   DP104590
                    * NO ERRORS IN CARD JUST COMPLETED                  DP104600
                    *                                                   DP104610
                    CD030 SLA     16                                    DP104620
                          STO   1 $IBSY-X1  SET I/O BUSY SW = ZERO      DP104630
                          LD      CD210     FETCH ADDR OF 1ST COLUMN    DP104640
                          STO     CD034+1   AND INITLZ LDX INSTRUCTION  DP104650
                    CD034 LDX  L2 *-*                                   DP104660
                          LD    2 +1                                    DP104670
                          RTE     16        PLACE FIRST TWO COLUMNS     DP104680
                          LD    2 0         IN ACC AND EXTENSION        DP104690
                          SD      CD280                                 DP104700
                          BSC     +-                                    DP104710
                          RTE     16        CHECK 1ST TWO COLUMNS       DP104720
                          BSC     Z         FOR DOUBLE SLASH (//)       DP104730
                          MDX     CD010     EXIT IF NOT EQUAL           DP104740
                          LD    2 +2        IF EQUAL CHECK 3RD          DP104750
                          BSC     Z         COLUMN FOR BLANK            DP104760
                          MDX     CD010     EXIT IF NOT EQUAL           DP104770
                          STX  L0 $CTSW     SET RECORD TRAP SW NON-ZERO DP104780
                          MDX     CD010     GO TO LEVEL 4 EXIT          DP104790
                    CD040 STO   1 $LAST-X1  SET LAST CARD INDICATOR     DP104800
                          MDX     CD030                                 DP104810
                    *                                                   DP104820
                    * CARD JUST COMPLETED WITH ERROR INDICATOR ON       DP104830
                    *                                                   DP104840
                    CD050 LD      CD230     IF FUNCTION WAS PUNCH,      DP104850
                          EOR     CD204     DO NOT SKIP 1ST CARD        DP104860
                          BSC     +-                                    DP104870
                          MDX     CD060     FUNCTION IS PUNCH           DP104880
                          LD      CD250     IF FUNCTION IS READ, AND    DP104890
                          EOR     CD210     NO COLUMNS HAVE BEEN READ,  DP104900
                          BSC     +-        SET INDICATOR TO SKIP       DP104910
                          STX   0 CD188     FIRST CARD                  DP104920
                    CD060 XIO     CD210     TEST FOR 1442 READY         DP104930
                          BSC     E         IF BIT 15 OF ACC = 1,       DP104940
                          MDX     CD070     1442 IS NOT READY           DP104950
                    *                                                   DP104960
                    * 1442 IS READY FOR RE-INITTIATION OF OPERATION     DP104970
                    *                                                   DP104980
                          LD      CD188     IF SKIP 1ST CARD INDICATOR  DP104990
                          BSC     +-        IS ON, TAKE O5E FEED CYCLE  DP105000
                          MDX     CD066     SKIP IND IS NOT ON          DP105010
                          XIO     CD240     INITIATE FEED OPERATION     DP105020
                          MDX     CD010     GO TO LEVEL 4 EXIT          DP105030
                    CD066 LD      CD210     RESET COLUMN IOCC           DP105040
                          STO     CD250     FOR FIRST COLUMN            DP105050
                          XIO     CD220     RESTART LAST OPERATION      DP105060
                          MDX     CD010     GO TO LEVEL 4 EXIT          DP105070
                    *                                                   DP105080
                    * 1442 IS NOT READY TO REPEAT LAST OPERATION        DP105090
                    *                                                   DP105100
                    CD070 LD      CD220     1442 NOT READY CODE = 1000  DP105110
                          BSI   1 $PST4-X1  WAIT AT INTRPT 4 TRAP       DP105120
                          MDX     CD060     REPEAT TEST FOR 1442 READY  DP105130
                    *                                                   DP105140
                    * CONTINUE CALL PROCESSING                          DP105150
                    *                                                   DP105160
                    CD080 STS     CD120     SAVE STATUS INDICATORS      DP105170
                    *                                                   DP105180
                    * DECODE FUNCTION IN ACCUMULATOR                    DP105190
                    *                                                   DP105200
                          STO     CD090                                 DP105210
                    CD090 DC      *-*       BRANCH TO PROPER FUNCTION   DP105220
                          MDX     CD100     7000 = READ W/O CONVERSION  DP105230
                          MDX     CD130     7001 = PUNCH                DP105240
                          MDX     CD100     7002 = READ WITH CONV.      DP105250
                    *                                                   DP105260
                    * FEED A CARD                                       DP105270
                    *                                                   DP105280
                          BSI     CD140+1   COMMON INITLZ SUBROUTINE    DP105290
                          XIO     CD240     FEED CARD                   DP105300
                          LD   L  $LAST     IF LAST CARD, NO EOC        DP105310
                          BSC     +-        INTRPT AFTER CARD FEED.     DP105320
                          MDX     CD110+1   THEREFORE CLEAR LAST CARD   DP105330
                          SLA     16        IND, BUT DO NOT SET I/O     DP105340
                          STO  L  $LAST     BUSY SWITCH NON-ZERO.       DP105350
                          MDX     CD120     GO TO LOAD STATUS           DP105360
                    *                                                   DP105370
                    CD100 BSI     CD140+1   COMMON INITLZ SUBROUTINE    DP105380
                          LDD     CD200     SET-UP CONTROL 1442 IOCC    DP105390
                    CD102 STO     CD230     TO START READER OR PUNCH    DP105400
                          RTE     16        SET-UP COLUMN 1442 IOCC     DP105410
                          STO     CD260     TO READ OR PUNCH A COLUMN   DP105420
                    CD110 XIO     CD220     START READER OR PUNCH       DP105430
                          STX  L0 $IBSY     SET I/O BUSY SW NON-ZERO    DP105440
                    CD120 LDS     0         RELOAD STATUS INDICATORS    DP105450
                          MDX     CD000     GO TO CALL EXIT             DP105460
                    *                                                   DP105470
                    * PUNCH                                             DP105480
                    *                                                   DP105490
                    CD130 BSI     CD140+1   COMMON INITLZ SUBROUTINE    DP105500
                          LDD     CD204     SET-UP PUNCH IOCC'S         DP105510
                          MDX     CD102     CONTINUE FIXING IOCC'S      DP105520
                    *                                                   DP105530
                    * COMMON INITIALIZATION SUBROUTINE                  DP105540
                    *                                                   DP105550
                    CD140 BSC  L  *-*       EXIT/ENTRY                  DP105560
                    CD150 MDX  L  $IBSY,0   LOOP UNTIL LAST FUNCTION    DP105570
                          MDX     CD150     COMPLETE AND IBUSY = ZERO   DP105580
                    CD160 XIO     CD210     TEST FOR 1442 READY         DP105590
                          BSC     E         IF BIT 15 OF ACC = 1,       DP105600
                          MDX     CD180     1442 IS NOT READY           DP105610
                    *                                                   DP105620
                    * 1442 READY TO INITIATE OPERATION                  DP105630
                    *                                                   DP105640
                          RTE     16        PUT I/O AREA ADDR IN ACC    DP105650
                          A       CD240     ADD 1 TO FORM COL. 1 ADDR   DP105660
                          STO     CD250     SET-UP ADDR OF COLUMN IOCC  DP105670
                          STO     CD210     FOR 1ST COLUMN              DP105680
                          MDX     CD140     GO TO EXIT COMMON SUBRTNE   DP105690
                    *                                                   DP105700
                    * 1442 NOT READY TO INITIATE OPERATION              DP105710
                    *                                                   DP105720
                    CD180 SLA     3         SAVE ERROR BIT IN CARRY     DP105730
                          LD      CD090     NO SKIP OF 1ST CARD         DP105740
                          EOR     CD240     WHEN FUNCTION IS PUNCH      DP105750
                          BSC     +-        FUNCTION = PUNCH IF NOT 0   DP105760
                          MDX     CD184     PUNCH                       DP105770
                          BSC     C         FUNCTION = READ. IF CARRY   DP105780
                          STX   0 CD188     SET, SKIP 1ST CARD          DP105790
                    CD184 LD      CD220     DISPLAY 1442 NOT READY CODE DP105800
                          BSI  L  $PRET     WAIT AT PREOPERATIVE TRAP   DP105810
                          MDX     CD160     REPEAT TEST FOR 1442 READY  DP105820
                    *                                                   DP105830
                    * IOCCS AND CONSTANTS                               DP105840
                    *                                                   DP105850
                          BSS  E  0         ADJUST IC TO EVEN           DP105860
                    CD190 BSS     2         SAVE OF ACC AND EXTENSION   DP105870
                    CD210 DC      *-*       RESET 1ST COLUMN ADDR       DP105880
                          DC      @I108     SENSE 1442 DSW (RESET 0)    DP105890
                    CD215 DC      0         1ST WORD OF SENSE DSW IOCC  DP105900
                          DC      @I109     SENSE DSW , LEVEL 4 W/RESET DP105910
                    CD250 DC      *-*       CURRENT COLUMN ADDRESS      DP105920
                    CD260 DC      *-*       READ OR PUNCH COLUMN IOCC   DP105930
                    CD240 DC      1         INCREMENTS COL. ADDR        DP105940
                          DC      @I105     IOCC FEED CARD              DP105950
                    CD200 DC      @I106     START READER WHEN AT CD230  DP105960
                          DC      @I103     READ COLUMN WHEN AT CD260   DP105970
                    CD204 DC      @I104     START PUNCH WHEN AT CD230   DP105980
                          DC      @I102     PUNCH COLUMN WHEN AT CD260  DP105990
                    CD220 DC      @D100     1442 NOT READY DISPLAY      DP106000
                    CD230 DC      *-*       START READER OR PUNCH IOCC  DP106010
                    CD280 DC      /3000     DOUBLE SLASH IN   (/)       DP106020
                          DC      /3000     COLUMN IMAGE      (/)       DP106030
                    CD188 DC      *-*       SKIP 1ST CARD INDICATOR     DP106040
                    X1    EQU     $PRET     XR1 INSTRUCTION POINTER     DP106050
                          BSS     8         PATCH                       DP106060
                    CD990 DC      /FFFF     *AREA                       DP106070
                          HDNG    SYSTEM 2501/1442 SUBROUTINE           DP106080
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   DP106090
                    PHAS2 DC      *-*       PHASE 2 WORD COUNT          DP106100
                          DC      *-*       PHASE 2 SECTOR ADDRESS      DP106110
                    *                                                   DP106120
                    *                                                   DP106130
                    RP000 BSC  L  *-*        ENTER 2ND WORD OF INSTR    DP106140
                          MDX     RP320      BR TO PROCESS CALL         DP106150
                    *                                                   DP106160
                    RP020 BSC  L  *-*        END OF CARD INTERRUPT      DP106170
                          MDX     RP080      PROCESS END OF CARD INTRP  DP106180
                    *************************************************** DP106190
                    *                                                   DP106200
                    * PROCESS PUNCH REQUEST INTERRUPT                   DP106210
                    *                                                   DP106220
                    RP040 BOSC L  *-*        LEVEL 0 INT -1442 ONLY-    DP106230
                          STD     RP480      SAVE ACC AND EXT           DP106240
                          STS     RP060      SAVE STATUS                DP106250
                          XIO     RP500      PUNCH A COLUMN             DP106260
                          LD      RP500      INCR COLUMN ADDRESS        DP106270
                          A       RP640      *FOR PUNCH                 DP106280
                          STO     RP500                                 DP106290
                          XIO     RP540-1    SENSE WITH RESET LEVEL 0   DP106300
                          LDD     RP480      RELOAD ACC AND EXT         DP106310
                    RP060 LDS     0          RESET STATUS               DP106320
                          MDX     RP040      TURN OFF INTERRUPT         DP106330
                    *                                                   DP106340
                    *************************************************** DP106350
                    RP080 XIO     RP200-1    SENSE DSW WITH RESET       DP106360
                          SLA     2                                     DP106370
                          BSC     +Z         ERROR INDICATOR ON         DP106380
                          MDX     RP140      BRANCH IF YES              DP106390
                          SLA     1          NO ERROR.  IS LAST CARD    DP106400
                          BSC     +Z         *INDICATOR ON.             DP106410
                          MDX     RP220      BRANCH IF YES              DP106420
                    RP100 SLA     16                                    DP106430
                          STO  L  $IBSY      CLEAR PROGRAM BUSY INDIC   DP106440
                    *                                                   DP106450
                    * BEFORE EXIT TEST IF THE CARD READ IN IS A CONTROL DP106460
                    * CARD, INDICATED BY '// ' IN COLUMNS 1-3.  IF SO,  DP106470
                    * SET THE CONTROL RECORD INDR '$CTSW' IN LOW CORE.  DP106480
                    *                                                   DP106490
                          LD      RP520      LOAD ADDRESS OF I/O AREA   DP106500
                          STO     RP120+1    STORE IN                   DP106510
                    RP120 LDX  L2 *-*        INDEX REGISTER 2           DP106520
                          LD    2 2          LOAD SECOND WORD           DP106530
                          RTE     16         PLACE IN EXTENSION         DP106540
                          LD    2 1          FIRST WORD IN ACC          DP106550
                          SD      RP720      TEST FOR //                DP106560
                          BSC     +-         SKIP IF ACC NON-ZERO       DP106570
                          RTE     16         ACC = 0, CHECK IF EXT = 0  DP106580
                          BSC     Z          NO,RETURN TO ILS04         DP106590
                          MDX     RP020                                 DP106600
                          LD    2 3          CHECK THIRD WORD FOR       DP106610
                          BSC     Z          ZERO--BLANK COL.IN CARD    DP106620
                          MDX     RP020      NO,RETURN TO ILS04         DP106630
                          STX  L0 $CTSW      FOUND //BLANK,SET SWITCH   DP106640
                          MDX     RP020      RETURN TO ILS04            DP106650
                    RP140 LD      RP520                                 DP106660
                          STO     RP500      RESET ADDRESSES TO FIRST   DP106670
                          STO     RP600      RESET TO ADDRESS OF WD CNT DP106680
                          LD      RP200      WHICH DVC IS IN USE        DP106690
                          BSC     E          SKIP IF 1442               DP106700
                          MDX     RP160-1    *ELSE TEST 2501            DP106710
                          BSI     RP240+1    TEST 1442 READY            DP106720
                          MDX     RP160      TO REPEAT LAST FUNCTION    DP106730
                          BSI     RP280+1    TEST 2501 READY            DP106740
                    RP160 XIO     RP620-1    REPEAT LAST FUNCTION       DP106750
                          MDX     RP020      RETURN TO ILS04            DP106760
                    *                                                   DP106770
                          BSS  E  0                                     DP106780
                    RP180 DC      /1401      START 1442 PCH IOCC      E DP106790
                    RP200 DC      /1702      SNS LEV 4 WITH RESET     O DP106800
                    *************************************************** DP106810
                    *                                                   DP106820
                    * LAST CARD SUBROUTINE                              DP106830
                    *                                                   DP106840
                    RP220 LD      RP200      DETERMINE WHICH DEVICE     DP106850
                          BSC     E          SKIP IF 1442               DP106860
                          MDX     RP100      CLEAR BUSY AND EXIT        DP106870
                          STO  L  $LAST      SET LAST CARD INDICATOR    DP106880
                          MDX     RP100      CLEAR BUSY AND EXIT        DP106890
                    *                                                   DP106900
                    * 1442-5 READY TEST                                 DP106910
                    *                                                   DP106920
                    RP240 BSC  L  *-*                                   DP106930
                          XIO     RP700-1    SENSE 1442 W/RESET         DP106940
                          BSC     E          FALL THRU IF NR            DP106950
                          MDX     RP260      TO DISPLAY ERROR CODE      DP106960
                          LD      RP700      CHANGE 2501 SENSE W/RESET  DP106970
                          STO     RP200      *TO 1442 SENSE W/RESET     DP106980
                          MDX     RP240      1442 IS READY              DP106990
                    RP260 LD      RP680      FETCH DISPLAY CODE         DP107000
                          BSI  L  $PRET      TO PREOPERATIVE ERROR TRAP DP107010
                          MDX     RP240+2    RETEST                     DP107020
                    *                                                   DP107030
                    * 2501 READY TEST                                   DP107040
                    RP280 BSC  L  *-*                                   DP107050
                          XIO     RP580-1    SENSE 2501 W/RESET         DP107060
                          BSC     E          FALL THRU IF NOT READY     DP107070
                          MDX     RP300      TO SETUP ERROR CODE        DP107080
                          LD      RP580      CHANGE 1442 SENSE W/RESET  DP107090
                          STO     RP200      *TO 2501 SENSE W/RESET     DP107100
                          MDX     RP280      2501 IS READY              DP107110
                    RP300 LD      RP740      FETCH DISPLAY CODE         DP107120
                          BSI  L  $PRET      TO PREOPERATIVE ERROR TRAP DP107130
                          MDX     RP280+2    RETEST FOR READY           DP107140
                    *                                                   DP107150
                    *************************************************** DP107160
                    *                                                   DP107170
                    * GENERAL CALL PROCESSING                           DP107180
                    *                                                   DP107190
                    RP320 STS     RP440      SAVE STATUS                DP107200
                          STO     RP360      DECODE CALLING FUNCTION    DP107210
                    RP340 MDX  L  $IBSY,0    TEST PROGRAM BUSY          DP107220
                          MDX     RP340      LOOP UNTIL NOT BUSY        DP107230
                    RP360 DC      *-*        TO CONTAIN MDX INSTRUC     DP107240
                          MDX     RP400      READ                       DP107250
                          MDX     RP460      PUNCH                      DP107260
                          MDX     RP400      READ                       DP107270
                          MDX     RP380      FEED    -1442 ONLY-        DP107280
                    *                                                   DP107290
                    *************************************************** DP107300
                    *                                                   DP107310
                    * 1442 FEED CALL PROCESSING                         DP107320
                    *                                                   DP107330
                    RP380 BSI     RP240+1    TEST READY ON 1442-5       DP107340
                          LD      RP660      SETUP FEED IOCC            DP107350
                          STO     RP620                                 DP107360
                          LD   L  $LAST      TEST LAST CARD INDICATOR   DP107370
                          BSC     +-         SKIP IF ON                 DP107380
                          MDX     RP420+1    GO SET BUSY & START FEED   DP107390
                          SLA     16                                    DP107400
                          STO  L  $LAST      CLEAR LAST CARD INDICATOR  DP107410
                          MDX     RP420+3    DO NOT SET BUSY ON         DP107420
                    *                                                   DP107430
                    *************************************************** DP107440
                    *                                                   DP107450
                    * 2501 READER CALL PROCESSING                       DP107460
                    *                                                   DP107470
                    RP400 BSI     RP280+1    TO TEST 2501 READY         DP107480
                          LD      RP560      SET UP CTRL IOCC TO START  DP107490
                          STO     RP620      *2501 READER               DP107500
                          RTE     16         ROTATE I/O AREA ADDR IN    DP107510
                          STO     RP600      WORD COUNT                 DP107520
                    RP420 STO     RP520      SAVE FOR RESTART PROC      DP107530
                          STX  L0 $IBSY      TURN ON BUSY INDICATOR     DP107540
                          XIO     RP620-1    START DEVICE               DP107550
                    RP440 LDS     0          RESET STATUS               DP107560
                          MDX     RP000      RETURN TO CALLING PROGRAM  DP107570
                    *                                                   DP107580
                    *************************************************** DP107590
                    *                                                   DP107600
                    * 1442 PUNCH CALL PROCESSING                        DP107610
                    *                                                   DP107620
                    RP460 BSI     RP240+1    TO TEST 1442 READY         DP107630
                          LD      RP180      SETUP CONTROL IOCC TO      DP107640
                          STO     RP620      START CARD PUNCH           DP107650
                          RTE     16                                    DP107660
                          A       RP640      BUMP TO ADDR OF DATA WD 1  DP107670
                          STO     RP500      SET UP ADDR OF FIRST COL   DP107680
                          MDX     RP420      TO SET BUSY AND START      DP107690
                    *                                                   DP107700
                    *************************************************** DP107710
                    *                                                   DP107720
                    * CONSTANTS AND WORK AREAS                          DP107730
                    *                                                   DP107740
                          BSS  E  0                                     DP107750
                    RP480 DC      *-*        SAVE ACCUMULATOR         E DP107760
                          DC      *-*        SAVE EXTENSION           O DP107770
                    RP500 DC      *-*        CURRENT COL ADDRESS      E DP107780
                          DC      @I102      PUNCH A COLUMN           O DP107790
                    RP520 DC      *-*        RESTART INFORMATION      E DP107800
                    RP540 DC      @I108      SENSE LEVEL 0 WITH RESET O DP107810
                    RP560 DC      @I402      INITIATE 2501 READ       E DP107820
                    RP580 DC      @I404      SENSE 2501 WITH RESET    O DP107830
                    RP600 DC      *-*        WD CNT ADRS FOR 2501     E DP107840
                    RP620 DC      *-*        PRESET CONTROL FUNCTION  O DP107850
                    RP640 DC      1          CONSTANT                 E DP107860
                    RP660 DC      @I105      FEED CARD FROM 1442      O DP107870
                    RP680 DC      @D100      CONSTANT                 E DP107880
                    RP700 DC      @I109      SENSE LEV 4 W/RESET 1442 O DP107890
                    RP720 DC      /3000      CONSTANTS,REPRESENT SLASH  DP107900
                          DC      /3000      IN IBM CARD CODE           DP107910
                    *                                                   DP107920
                    *                                                   DP107930
                    RP740 DC      /4000      CONSTANT                   DP107940
                    *                                                   DP107950
                    *                                                   DP107960
                    * PATCH AREA                                        DP107970
                    *                                                   DP107980
                          BSS     8          PATCH                      DP107990
                    RP750 DC      /2542      *AREA                      DP108000
                          HDNG    BEGIN SYSTEM LOAD/RELOAD              DP108010
                    *                                                   DP108020
                    * ROLL NEEDED PARTS OF RESIDENT IMAGE               DP108030
                    * TEMPORARLY STORED IN BUFFR TO LOWER CORE          DP108040
                    *                                                   DP108050
                    AA000 NOP               ENTER PHASE1 FROM C.I.L.    DP108060
                          LDX  L1 $I494-BUFFR  ROLL RESIDENT IMAGE      DP108070
                    AA010 LD   L1 BUFFR+1   *FROM 'BUFFR'               DP108080
                          STO  L1 $IBSY-8   *TO                         DP108090
                          MDX   1 -1        *LOWER                      DP108100
                          MDX     AA010     *CORE                       DP108110
                          LDX  L1 AA060-1   STORE ADDRESS OF INTERRUPT  DP108120
                          STX  L1 $IBT4     *BRANCH TABLE TO ILS04      DP108130
                          LDX  L1 CONFG-BUFFR-1                         DP108140
                          SRA     16                                    DP108150
                    AA020 STO  L1 BUFFR+2   CLEAR                       DP108160
                          MDX   1 -1        *THE                        DP108170
                          MDX     AA020     *BUFFER                     DP108180
                          LDX  L3 E         XR3 BASE ADDR TO CONSTANTS  DP108190
                          LD    3 AZ912-E   DOUBLE                      DP108200
                          SLA     1         *THE                        DP108210
                          STO   3 AZ912-E   *BUFFER SIZE (640)          DP108220
                          STO   3 AZ938-E   SET 'FETCH' INHIBIT INDR    DP108230
                          STO   3 AZ942-E   *AND RES IMAGE INDR ON      DP108240
                          LDX  L1 INTPT     STORE ADDR OF INTRPT SUBR   DP108250
                          STX  L1 $IREQ     *TO INTERRUPT REQUEST       DP108260
                          LDX  L1 CD016+1   INITIATE COLUMN INTERRUPT   DP108270
                          STX  L1 $LEV0     *BRANCH ADDRESS TO ILS00    DP108280
                    *                                                   DP108290
                    * DETERMINE WHICH CARD READ SUBROUTINE IS REQUIRED  DP108300
                    *                                                   DP108310
                          LD   L  /0005     FETCH INDR WORD FROM C.I.L. DP108320
                          SLA     8                                     DP108330
                          STO  L  RINDR     SET INDR FOR TYPE OF READER DP108340
                          BSC  L  AA040,Z   BR IF USING 1442 READER     DP108350
                    *                                                   DP108360
                    * OVERLAY 1442 CARD READ SUBROUTINE                 DP108370
                    * WITH 2501 CARD READ SUBROUTINE                    DP108380
                    *                                                   DP108390
                          LDX  L1 RP750-RP000+1  XR1 = 2501 SUBR WD CNT DP108400
                    AA030 LD   L1 RP000-1   FETCH A WORD OF 2501 SUBR   DP108410
                          STO  L1 CD000-1   AND MOVE  TO 1442 SUBR AREA DP108420
                          MDX   1 -1        DECR WORD CNT, SKIP IF ZERO DP108430
                          MDX     AA030     BRANCH TO FETCH NEXT WORD   DP108440
                    *                                                   DP108450
                    * READ A RECORD                                     DP108460
                    *                                                   DP108470
                    AA040 LD      AA900     SET COLUMNS TO READ INDR    DP108480
                          STO     AA903     *TO 80 COLUMNS              DP108490
                    *                                                   DP108500
                          LD    3 AZ955-E   FETCH ADDR OF RECORD BUFFER DP108510
                          SRT     16        SHIFT TO EXTENSION          DP108520
                          LD    3 AZ923-E   FETCH READ FUNCTION CODE    DP108530
                          BSI  L  CD000+1   BRANCH TO READ A RECORD     DP108540
                    AA050 MDX  L  $IBSY,0   SKIP IF READ COMPLETE       DP108550
                          MDX     AA050     BR TO TEST READ COMPLETE    DP108560
                    *                                                   DP108570
                          LD    3 AZ952-E   IF INDICATOR IS NON-ZERO    DP108580
                          BSI  L  PACK0,Z   *BR TO PACK RECORD          DP108590
                          LDX  L1 AA902-1   XR1 PTS TO BINARY RCD BFR   DP108600
                          MDX     AA070     BRANCH TO PROCESS RECORD    DP108610
                    *                                                   DP108620
                    * CONSTANTS AND WORK AREAS                          DP108630
                    *                                                   DP108640
                    AA900 DC      @CCOL     NUMBER OF COLUMNS PER CARD  DP108650
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   DP108660
                    AA902 DC      0         PACKED CARD BUFFER          DP108670
                    AA903 DC      @CCOL     NUMBER OF COLUMNS PER CARD  DP108680
                    AA904 BSS     @CCOL     CARD BUFFER                 DP108690
                    *                                                   DP108700
                    * LEVEL 4 INTERRUPT BRANCH TABLE                    DP108710
                    *                                                   DP108720
                          DC      $PRET     PRE-OPERATIVE ERROR TRAP    DP108730
                    AA060 BSS     4         RESERVED                    DP108740
                          DC      *-*       1403 PRINTER                DP108750
                          DC      CD010+1   2501 CARD READER            DP108760
                          DC      CD010+1   1442 CARD READER            DP108770
                          DC      TZ100     CONSOLE PRINTER             DP108780
                          DC      *-*       PAPER TAPE READER/PUNCH     DP108790
                    *                                                   DP108800
                    * DETERMINE RECORD TYPE                             DP108810
                    * IF THE INDICATOR 'AZ949' IS POSITIVE A            DP108820
                    * CERTAIN TYPE IS EXPECTED                          DP108830
                    *                                                   DP108840
                    AA070 LD    3 AZ949-E   FETCH NEXT RECORD TYPE INDR DP108850
                          BSC  L  AA080,+-  BR TO REGULAR PROC IF ZERO  DP108860
                          LD    3 AZ933-E   FETCH TYPE EXPECTED INDR    DP108870
                          BSI  L  AB000,+-  BR TO TEST FOR LOAD MODE    DP108880
                          BSI  L  AC000,+   BR TO TEST FOR SCON RECORD  DP108890
                          BSI  L  AD000     BR TO TEST FOR PHID RECORD  DP108900
                    *                                                   DP108910
                    AA080 LD    3 AZ952-E   TEST FOR AND BRANCH IF SCON DP108920
                          BSI  L  AE000,+-  *RCRDS ARE TO BE CONVERTED  DP108930
                          LD    1 3         FETCH WORD 3                DP108940
                          SRT     8         SAVE LEFT HALF OF WORD      DP108950
                          AND   3 AZ914-E   *RIGHT JUSTIFIED            DP108960
                          S     3 AZ901-E   TEST FOR AND BRANCH IF      DP108970
                          BSI  L  AH000,+-  *AN ABS HEADER RECORD - /01 DP108980
                          S     3 AZ901-E   TEST FOR AND BRANCH IF      DP108990
                          BSC  L  AH020,+-  *A RLTV HEADER RECORD - /02 DP109000
                          S     3 AZ907-E   TEST FOR AND BRANCH IF      DP109010
                          BSC  L  AH030,+-  *REL TO LAST ABS RCRD - /09 DP109020
                          S     3 AZ901-E   TEST FOR AND BRANCH IF      DP109030
                          BSI  L  AJ000,+-  *A DATA RECORD        - /0A DP109040
                          S     3 AZ905-E   TEST FOR AND BRANCH IF      DP109050
                          BSI  L  AK000,+-  *AN 'F' RECORD        - /0F DP109060
                          BSI  L  ER002     INVALID RCRD, PRINT MESSAGE DP109070
                          HDNG    TEST FOR LOAD MODE RECORD             DP109080
                    *                                                   DP109090
                    * RECORD MUST BE LOAD MODE TYPE                     DP109100
                    *                                                   DP109110
                    AB000 DC      0         ENTRY                       DP109120
                          LD   L  AA902+2   FETCH WORD 3 OF RECORD      DP109130
                          S     3 AZ919-E   TEST FOR 'E' IN 'MODE' RCRD DP109140
                          BSI  L  ER017,Z   BRANCH IF MODE RCRD MISSING DP109150
                          STO   3 AZ949-E   CLEAR MODE RCRD TEST INDR   DP109160
                          BSI  L  AI000     BRANCH TO PROCESS RECORD    DP109170
                          HDNG    TEST FOR SCON RECORD                  DP109180
                    *                                                   DP109190
                    * RECORD MUST BE SCON TYPE                          DP109200
                    *                                                   DP109210
                    AC000 DC      0         ENTRY                       DP109220
                          LD   L  AA902+2   FETCH WORD 3 OF RECORD      DP109230
                          S     3 AZ927-E   TEST FOR 'N' IN 'SCON' RCRD DP109240
                          BSI  L  ER003,Z   BR IF 'SCON' RCRD MISSING   DP109250
                          STO   3 AZ952-E   INDC NO PACK OF 'REQ' RCRDS DP109260
                          STO   3 AZ949-E   CLEAR INDR FOR SPEC RCRD    DP109270
                          BSC  L  AA040     BRANCH TO READ NEXT RECORD  DP109280
                          HDNG    PROCESS PHASE ID RECORD(S)            DP109290
                    *                                                   DP109300
                    * PHASE ID RECORD(S) PROCESS ON                     DP109310
                    * BOTH INITIAL LOAD AND RELOAD                      DP109320
                    *                                                   DP109330
                    AD000 DC      0         ENTRY                       DP109340
                          LD   L  AA904+2   FETCH COLUMN 3              DP109350
                          EOR     AD904     TEST FOR AND BRANCH         DP109360
                          BSI  L  ER015,Z   *IF NOT AN 'I'              DP109370
                    *                                                   DP109380
                    * PICK UP A 3-DIGIT DECIMAL NUMBER FROM PHID RECORD DP109390
                    * AND CONVERT IT TO BINARY                          DP109400
                    *                                                   DP109410
                    AD010 LD   L  AA904+5   FETCH HUNDREDS COLUMN       DP109420
                          AND  L  AE901     MASK OUT ZONE PUNCHES       DP109430
                          STO  L  AE900+3   STORE DIGIT FOR CONVERSION  DP109440
                    AD020 LD   L  AA904+6   FETCH TENS COLUMN           DP109450
                          AND  L  AE901     MASK OUT ZONE PUNCHES       DP109460
                          STO  L  AE900+4   STORE DIGIT FOR CONVERSION  DP109470
                    AD030 LD   L  AA904+7   FETCH UNITS COLUMN          DP109480
                          AND  L  AE901     MASK OUT ZONE PUNCHES       DP109490
                          STO  L  AE900+5   STORE DIGIT FOR CONVERSION  DP109500
                    *                                                   DP109510
                          BSI  L  DCBIN     BR TO CONVERT PH ID TO BIN  DP109520
                          DC      AE900     ADDRESS OF INPUT AREA       DP109530
                    *                                                   DP109540
                    AD040 STO  L  PAIR1     SAVE PHASE ID RANGE         DP109550
                          LD      AD900     FETCH INDICATOR AND         DP109560
                          BSI  L  AD050,Z   *BRANCH IF END OF RECORD    DP109570
                          MDX  L  AD040+1,1 INCREMENT PH ID STORE ADDR  DP109580
                          MDX  L  AD010+1,4 INCR HUNDREDS COLUMN ADDR   DP109590
                          MDX  L  AD020+1,4 INCR TENS COLUMN ADDRESS    DP109600
                          MDX  L  AD030+1,4 INCR UNITS COLUMN ADDRESS   DP109610
                          MDX  L  AD901,-1  DECR PH ID CNT, SK IF ZERO  DP109620
                          MDX     AD010     BR TO CONVERT NEXT PH ID    DP109630
                          BSI  L  MODNO     BR TO PROCESS MOD NUMBER    DP109640
                          STX   0 AD900     SET TO TEST FOR 2ND RECORD  DP109650
                          MDX     AD010     BR TO CONVERT NEXT PH ID    DP109660
                    *                                                   DP109670
                    AD050 DC      0         ENTRY                       DP109680
                          LD   I  AD040+1   TEST FOR AND BRANCH IF      DP109690
                          BSC  L  AD060,+-  *LAST PH ID WAS ZERO        DP109700
                          LDX  L1 AA904+5   RESET                       DP109710
                          STX   1 AD010+1   *HUNDREDS COLUMN ADDRESS,   DP109720
                          MDX   1 1                                     DP109730
                          STX   1 AD020+1   *TENS COLUMN ADDRESS        DP109740
                          MDX   1 1                                     DP109750
                          STX   1 AD030+1   *AND UNITS COLUMN ADDRESS   DP109760
                          MDX  L  AD901,14  RESET PHASE ID/RECORD COUNT DP109770
                          SRA     16        CLEAR                       DP109780
                          STO     AD900     *END OF RECORD INDICATOR    DP109790
                          BSC  L  AA040     BRANCH TO READ NEXT RECORD  DP109800
                    *                                                   DP109810
                    * CHECK VALIDITY OF PHID RECORD INPUT               DP109820
                    *                                                   DP109830
                    AD060 LDX  I1 AZ958     XR1 POINTS TO PHID PAIRS    DP109840
                          LD    1 0         FETCH 1ST ENT OF 1ST PAIR   DP109850
                          S     3 AZ901-E   TEST FOR AND                DP109860
                          MDX   1 -2                                    DP109870
                          BSI  L  ER015,Z   *BRANCH IF NOT '001'        DP109880
                    AD070 MDX   1 2         POINT TO NEXT PAIR          DP109890
                          LD    1 1         FETCH AND                   DP109900
                          STO     AD903     *SAVE UPPER LIMIT OF RANGE  DP109910
                          LD    1 0         FETCH AND                   DP109920
                          STO     AD902     *SAVE LOWER LIMIT OF RANGE  DP109930
                          BSC  L  AD080,+-  BRANCH IF NO MORE PAIRS     DP109940
                          S       AD903     TEST FOR AND BRANCH IF      DP109950
                          BSI  L  ER015,-Z  *UPPER LT LOWER LIMIT       DP109960
                          LD    1 2         FETCH NEXT LOWER LIMIT AND  DP109970
                          BSC  L  AD080,+-  *BRANCH IF ZERO             DP109980
                          S       AD903     TEST FOR AND BRANCH IF LESS DP109990
                          BSI  L  ER015,+   *THAN PREVIOUS UPPER LIMIT  DP110000
                          MDX     AD070     BRANCH TO CHECK NEXT PAIR   DP110010
                    AD080 LD    1 1         FETCH AND                   DP110020
                          STO  L  MAXPH     *STORE MAXIMUM PHASE ID     DP110030
                          SRA     16        CLEAR                       DP110040
                          STO   3 AZ949-E   *SPEC RECORD NEXT INDICATOR DP110050
                          MDX     AD100     BR TO TEST IF PAIRS VOIDED  DP110060
                    *                                                   DP110070
                    * CONSTANTS AND WORK AREAS                          DP110080
                    *                                                   DP110090
                    AD900 DC      *-*       END OF A 'PHID' RECORD INDR DP110100
                    AD901 DC      14        NO. OF PHASE IDS PER RECORD DP110110
                    AD902 DC      *-*       TEMP STORAGE FOR LOWER LIM  DP110120
                    AD903 DC      *-*       TEMP STORAGE FOR UPPER LIM  DP110130
                    AD904 DC      /8010     BINARY 'I'                  DP110140
                    *                                                   DP110150
                    * IF FOR, COB, RPG, PHID PAIR 9, OR ASM NOT TO  2-9 DP110160
                    * BE LOADED THE PHASE ID PAIRS WILL BE PLACED IN    DP110170
                    * A SKIP TABLE AND BITS 0 AND 1 IN THE NORMAL       DP110180
                    * PAIR TABLE WILL BE SET ON                         DP110190
                    *                                                   DP110200
                    AD100 STX   2 AD120+1   SAVE XR2                    DP110210
                          LDX   2 5         5 ID PAIRS MAY BE SKIPPED   DP110220
                    AD105 LD    3 AZ940-E   BITS INDICATE PAIRS TO SKIP DP110230
                          SLA     10        SHIFT BIT TO BE TESTED      DP110240
                          SLA   2 0         *TO BIT 0                   DP110250
                          BSC  L  AD110,-   BR IF BIT 0 NOT ON          DP110260
                          LDD  I2 AD910-1   LOAD PAIR TO BE SKIPPED     DP110270
                          STD  I  AD920     STORE IN SKIP TABLE         DP110280
                          OR    3 AZ929-E   SET BITS 0,1 ON IN FIRST    DP110290
                          STO  I2 AD910-1   *WORD OF PAIR IN PAIR TABLE DP110300
                          MDX  L  AD920,2   INCR POINTER TO SKIP TABLE  DP110310
                    AD110 MDX   2 -1        DECR BIT SHIFT COUNTER      DP110320
                          MDX     AD105     LOOP UNTIL 5 PAIRS TESTED   DP110330
                          LDX  L2 /0999     TERMINATE SKIP TABLE        DP110340
                          STX  I2 AD920     *WITH /0999 WORD            DP110350
                    AD120 LDX  L2 *-*       RESTORE XR2                 DP110360
                    *                                                   DP110370
                    * EXTRACT THE LAST PHASE ID THAT MUST BE LOADED     DP110380
                    * DURING AN INITIAL LOAD                            DP110390
                    *                                                   DP110400
                    AD122 LDD  L  PAIR1     PAIR ADDR WILL BE MODIFIED  DP110410
                          BSC  L  LDPH2,+-  BR TO LD PH 2 IF END OF JOB DP110420
                          BSC  L  AD128,Z-  BRANCH TO SAVE ID           DP110430
                    AD124 MDX  L  AD122+1,2 MODIFY ADDR UNTIL 0 FOUND   DP110440
                          MDX     AD122                                 DP110450
                    *                                                   DP110460
                    AD128 RTE     16        SAVE 2ND ID OF THIS PAIR    DP110470
                          STO  L  LPHID     *FOR SYSTEM LOADER PHASE 2  DP110480
                          MDX     AD124     BRANCH TO TEST NEXT PAIR    DP110490
                    *                                                   DP110500
                    * CONSTANTS AND WORK AREAS                          DP110510
                    *                                                   DP110520
                    AD910 DC      PAIRB     POINTER USED IF BIT 11 ON   DP110530
                          DC      PAIRA     PTR USED IF BIT 12 ON   2-9 DP110540
                          DC      PAIR8     POINTER USED IF BIT 13 ON   DP110550
                          DC      PAIR3     PTR USED IF BIT 14 ON   2-9 DP110560
                          DC      PAIR2     POINTER USED IF BIT 15 ON   DP110570
                    AD920 DC      LOLIM     MODIFIABLE PTR TO SKIP TBL  DP110580
                          HDNG    PROCESS SYSTEM CONFIG RECORDS         DP110590
                    AE000 DC      0         ENTRY                       DP110600
                          LD   L  AA904+3   FETCH COLUMN 4              DP110610
                          EOR     AE904     TEST FOR AND                DP110620
                          BSC  L  AF000,+-  *BRANCH IF A 'CORE' RECORD  DP110630
                          LD   L  AA904+2   FETCH COLUMN 3              DP110640
                          EOR     AE902     TEST FOR AND                DP110650
                          BSC  L  AG000,+-  *BRANCH IF A 'TERM' RECORD  DP110660
                          LD   L  AA904+2   FETCH COLUMN 3              DP110670
                          EOR     AE903     TEST FOR AND                DP110680
                          BSI  L  ER013,Z   *BRANCH IF NOT AN 'REQ' RCD DP110690
                    *                                                   DP110700
                    * PROCESS 'REQ' RECORDS                             DP110710
                    *                                                   DP110720
                          MDX  L  AE905,-1  DECR 'REQ' CNT, SK IF ZERO  DP110730
                          MDX     AE010     BRANCH TO PROCESS 'REQ' RCD DP110740
                          BSI  L  ER013     BR IF MORE THAN 15 'REQ'S   DP110750
                    AE010 LD   L  AA904+8   FETCH COLUMN 9  (ISS NO.)   DP110760
                          AND     AE901     MASK OUT ZONE PUNCHES       DP110770
                          STO     AE900+4   SAVE AS TENS DIGIT          DP110780
                    AE020 LD   L  AA904+9   FETCH COLUMN 10  (ISS NO.)  DP110790
                          AND     AE901     MASK OUT ZONE PUNCHES       DP110800
                          STO     AE900+5   SAVE AS UNITS DIGIT         DP110810
                    *                                                   DP110820
                          BSI  L  DCBIN     BRANCH TO CONVERT TO BINARY DP110830
                          DC      AE900     ADDRESS OF INPUT AREA       DP110840
                    *                                                   DP110850
                    AE040 STO  L  CONFG     SAVE ISS NO. IN CONFIG TBL  DP110860
                          MDX  L  AE040+1,1 INCR CONFIG TBL STORE ADDR  DP110870
                          MDX  L  AE010+1,5 INCR TENS COLUMN ADDRESS    DP110880
                          MDX  L  AE020+1,5 INCR UNITS COLUMN ADDRESS   DP110890
                          MDX  L  AE906,-1  DECR NO. OF DATA SETS       DP110900
                          MDX     AE010     BR TO FETCH NEXT DATA SET   DP110910
                    *                                                   DP110920
                          MDX  L  AE906,3   RESET DATA SET COUNT        DP110930
                          MDX  L  AE010+1,-15  RESET TENS COLUMN ADDR   DP110940
                          MDX  L  AE020+1,-15  RESET UNITS COLUMN ADDR  DP110950
                          LD    3 AZ939-E   INCREMENT                   DP110960
                          A     3 AZ901-E   *THE 'REQ'                  DP110970
                          STO   3 AZ939-E   *RECORD COUNT               DP110980
                          BSC  L  AA040     BRANCH TO READ NEXT RECORD  DP110990
                    *                                                   DP111000
                    * CONSTANTS AND WORK AREAS                          DP111010
                    *                                                   DP111020
                    AE900 DC      /80A0     SIGN DIGIT                  DP111030
                          DC      0         TEN-THOUSANDS DIGIT         DP111040
                          DC      0         THOUSANDS DIGIT             DP111050
                          DC      0         HUNDREDS DIGIT              DP111060
                          DC      0         TENS DIGIT                  DP111070
                          DC      0         UNITS DIGIT                 DP111080
                    AE901 DC      /3FF0     MASK OUT ZONE PUNCHES       DP111090
                    AE902 DC      /4010     CARD IMAGE 'R'              DP111100
                    AE903 DC      /4020     CARD IMAGE 'Q'              DP111110
                    AE904 DC      /8100     CARD IMAGE 'E'              DP111120
                    AE905 DC      20+1      'REQ' RECORDS LIMIT         DP111130
                    AE906 DC      3         NO. OF GROUPS/'REQ' RECORD  DP111140
                          HDNG    SET CORE SIZE                         DP111150
                    AF000 LDX   2 -4        4 CORE SIZES TO TEST FOR    DP111160
                    AF010 LD   L  AA904+6   FETCH COL 7 OF 'CORE' RCRD  DP111170
                          EOR  L2 AF900+4   TEST FOR 4, 8, 6, 2         DP111180
                          BSC  L  AF020,+-  BR IF COL 7 IDENTIFIED      DP111190
                          MDX   2 1         LOOP TO                     DP111200
                          MDX     AF010     *TRY AGAIN                  DP111210
                          BSI  L  ER013     BRANCH, COLUMN 7 INVALID    DP111220
                    AF020 LD   L  AA904+5   LOAD COL 6 TO DOUBLE CHECK  DP111230
                          EOR  L2 AF910+4   TEST FOR 0, 0, 1, 3         DP111240
                          BSC  L  AF030,+-  BR IF COL 6 MATCHES         DP111250
                          BSI  L  ER013     BRANCH, COLUMN 6 INVALID    DP111260
                    AF030 LD   L2 AF920+4   SET BIT FOR                 DP111270
                          STO  L  SCORE     *CORE SIZE                  DP111280
                          BSC  L  AA040     BR TO READ NEXT RECORD      DP111290
                    *                                                   DP111300
                    * CONSTANTS                                         DP111310
                    *                                                   DP111320
                    AF900 DC      /0200     4 IN CARD CODE              DP111330
                          DC      /0020     8 IN CARD CODE              DP111340
                          DC      /0080     6 IN CARD CODE              DP111350
                          DC      /0800     2 IN CARD CODE              DP111360
                    AF910 DC      /2000     0 IN CARD CODE              DP111370
                          DC      /2000     0 IN CARD CODE              DP111380
                          DC      /1000     1 IN CARD CODE              DP111390
                          DC      /0400     3 IN CARD CODE              DP111400
                    AF920 DC      /1000     BIT 3 INDICATES 04K CORE    DP111410
                          DC      /2000     BIT 2 INDICATES 08K CORE    DP111420
                          DC      /4000     BIT 1 INDICATES 16K CORE    DP111430
                          DC      /8000     BIT 0 INDICATES 32K CORE    DP111440
                          HDNG    PROCESS TERM RECORD                   DP111450
                    AG000 BSI  L  SAVXR     BR TO SAVE INDEX REGISTERS  DP111460
                    AG010 LDX  L1 CONFG-1   XR1 PTS TO 'REQ' STG AREA   DP111470
                          LD    1 1         FETCH AN ISS NUMBER         DP111480
                          BSI  L  ER013,+   BRANCH IF NOT POSITIVE      DP111490
                          S     3 AZ909-E   TEST FOR AND BRANCH IF      DP111500
                          BSI  L  ER013,Z-  *GREATER THAN MAXIMUM (20)  DP111510
                          LD    1 1         FETCH ISS NUMBER AGAIN      DP111520
                          S     3 AZ901-E   TEST FOR AND BRANCH IF      DP111530
                          BSC  L  AG030,Z-  *GREATER THAN 1  (NOT 1442) DP111540
                          LD    1 3         TEST FOR AND BRANCH IF      DP111550
                          BSI  L  ER013,+   *NO MOD (5, 6 OR 7) NUMBER  DP111560
                          MDX  L  AG913,1   INCREMENT ISS 1 INDICATOR   DP111570
                          S     3 AZ905-E   TEST FOR AND                DP111580
                          BSC  L  AG020,+-  *BRANCH IF A 1442-5         DP111590
                          S     3 AZ901-E   TEST FOR AND                DP111600
                          BSC  L  AG040,+-  *BRANCH IF A 1442-6         DP111610
                          S     3 AZ901-E   TEST FOR AND                DP111620
                          BSC  L  AG040,+-  *BRANCH IF A 1442-7         DP111630
                          BSI  L  ER013     BRANCH, MODEL UNKNOWN       DP111640
                    *                                                   DP111650
                    AG020 LD      AG913     FETCH INDICATOR             DP111660
                          S     3 AZ902-E   TEST FOR AND                DP111670
                          BSI  L  ER013,Z   *BRANCH IF NOT EQUAL TO 2   DP111680
                    AG030 LD    1 1         FETCH ISS NUMBER            DP111690
                          MDX     AG050     BR TO PROCESS NEXT 'REQ'    DP111700
                    AG040 LD    3 AZ901-E   INDICATE                    DP111710
                          STO  L  T1442     *1442-6 OR 7                DP111720
                    AG050 SLT     32        CLEAR ACC AND EXT           DP111730
                          LD    1 1         FETCH ISS NUMBER            DP111740
                          S     3 AZ908-E   TEST FOR AND                DP111750
                          BSC  L  AG060,Z-  *BRANCH IF GREATER THAN 15  DP111760
                          LD    1 1         FETCH ISS NUMBER            DP111770
                          STO     AG054+1   *AND SAVE TO SET XR2        DP111780
                    AG054 LDX  L2 *-*       SET XR2 FOR SHIFT           DP111790
                          LD    3 AZ926-E   FETCH SIGN BIT              DP111800
                          RTE   2 0         SHIFT TO APPROPRIATE POS    DP111810
                          OR   L  DINDR     'OR' IN REST OF INDICATOR   DP111820
                          STO  L  DINDR     *AND SAVE                   DP111830
                    AG060 MDX  L  AG010+1,3 POINT TO NEXT 'REQ' RCRD    DP111840
                          BSI  L  RSTXR     RESTORE INDEX REGISTERS     DP111850
                          MDX  L  AZ939,-1  DECR 'REQ' CNT, SK IF ZERO  DP111860
                          MDX     AG010     BR TO PROCESS NEXT 'REQ'    DP111870
                    *                                                   DP111880
                    * SET INDICATOR TO PROCESS PHASE ID RECORD(S) NEXT  DP111890
                    *                                                   DP111900
                          NOP               A WAIT MAY BE PATCHED HERE  DP111910
                          LD   L  DINDR     FETCH ISS INDICATOR         DP111920
                          STO     AG912     *AND SAVE TEMPORARLY        DP111930
                          SRA     6         TEST FOR AND                DP111940
                          BSC  L  AG120,E   *BRANCH IF 1403             DP111950
                          SRA     3         TEST FOR AND                DP111960
                          BSC  L  AG130,E   *BRANCH IF 1132             DP111970
                          LD    3 AZ926-E   SET CONSOLE PRINTER         DP111980
                          STO  L  PRNPR     *AS PRINCIPAL PRINT DEVICE  DP111990
                          LDD     AG910     SAVE PHASE ID AND CHAN 12   DP112000
                    AG080 STD  L  PTRID     *INDR OF PRINC PRINT DEVICE DP112010
                          MDX  L  AG914,0   SKIP IF BRANCH INDR ZERO    DP112020
                          MDX     AG140     BR IF END OF REQ PROCESS    DP112030
                          STX   0 AG914     SET BRANCH INDR NON-ZERO    DP112040
                          MDX  L  AG080+1,2 INCREMENT STORE ADDRESS     DP112050
                          LD      AG912     FETCH ISS SUMMARY WORD      DP112060
                          SRA     11        TEST FOR AND                DP112070
                          BSC  L  AG090,E   *BRANCH IF 2501             DP112080
                          SRA     3         TEST FOR AND                DP112090
                          BSC  L  AG100,E   *BRANCH IF 1442-6 OR 7      DP112100
                          LD      AG912     FETCH ISS SUMMARY WORD      DP112110
                          SRA     12        TEST FOR AND                DP112120
                          BSC  L  AG110,E   *BRANCH IF 1134 (PAP  TAPE) DP112130
                          BSI  L  ER013     BRANCH, NO INPUT DEVICE     DP112140
                    AG090 LD    3 AZ901-E   SET 2501/1442               DP112150
                          STO  L  PRNRD     *AS PRINCIPAL I/O DEVICE    DP112160
                          LDD     AG900     SAVE PHASE ID OF PRINC I/O  DP112170
                          MDX     AG080     *DEVICE AND CONVERSION SUBR DP112180
                    AG100 SRA     16        SET 1442/1442               DP112190
                          STO  L  PRNRD     *AS PRINCIPAL I/O DEVICE    DP112200
                          LDD     AG902     SAVE PHASE ID OF PRINC I/O  DP112210
                          MDX     AG080     *DEVICE AND CONVERSION SUBR DP112220
                    AG110 LD    3 AZ926-E   SET 1134/1055               DP112230
                          STO  L  PRNRD     *AS PRINCIPAL I/O DEVICE    DP112240
                          LDD     AG904     SAVE PHASE ID OF PRINC I/O  DP112250
                          MDX     AG080     *DEVICE AND CONVERSION SUBR DP112260
                    AG120 LD    3 AZ901-E   SET 1403                    DP112270
                          STO  L  PRNPR     *AS PRINCIPAL PRINT DEVICE  DP112280
                          LDD     AG906     SAVE PHASE ID AND CHAN 12   DP112290
                          MDX     AG080     *INDR OF PRINC PRINT DEVICE DP112300
                    AG130 SRA     16        SET 1132                    DP112310
                          STO  L  PRNPR     *AS PRINCIPAL PRINT DEVICE  DP112320
                          LDD     AG908     SAVE PHASE ID AND CHAN 12   DP112330
                          MDX     AG080     *INDR OF PRINC PRINT DEVICE DP112340
                    AG140 STO   3 AZ949-E   INDICATE SPEC RECORD NEXT   DP112350
                          LD    3 AZ901-E   INDICATE                    DP112360
                          STO   3 AZ933-E   *'PHID' RECORD NEXT         DP112370
                          BSC  L  AA040     BRANCH TO READ NEXT RECORD  DP112380
                    *                                                   DP112390
                    * CONSTANTS AND WORK AREAS                          DP112400
                    *                                                   DP112410
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   DP112420
                    AG900 DC      I2501     PHASE ID 2501 RDR SUBR      DP112430
                          DC      CDCNV     PHASE ID 2501 CNV SUBR      DP112440
                    AG902 DC      I1442     PHASE ID 1442 RDR SUBR      DP112450
                          DC      CDCNV     PHASE ID 1442 CNV SUBR      DP112460
                    AG904 DC      I1134     PHASE ID 1134 RDR SUBR      DP112470
                          DC      C1134     PHASE ID 1134 CNV SUBR      DP112480
                    AG906 DC      P1403     PHASE ID 1403 PTR SUBR      DP112490
                          DC      $1403     1403 PTR CHANNEL 12 INDR    DP112500
                    AG908 DC      P1132     PHASE ID 1132 PTR SUBR      DP112510
                          DC      $1132     1132 PTR CHANNEL 12 INDR    DP112520
                    AG910 DC      PCPAD     PHASE ID CNSL PTR SUBR      DP112530
                          DC      $CPTR     CNSL PTR CHANNEL 12 INDR    DP112540
                    AG912 DC      *-*       DEVICE INDR TEMPORARY STG   DP112550
                    AG913 DC      1         INDR TO CHECK ISS 1 RECORDS DP112560
                    AG914 DC      0         BRANCH INDICATOR            DP112570
                          HDNG    VERIFY PRESENCE OF F RECORD           DP112580
                    AH000 DC      0         ENTRY                       DP112590
                          LD    3 AZ950-E   TEST FOR AND BRANCH         DP112600
                          BSI  L  ER003,+-  *IF TYPE 'F' INDR NOT SET   DP112610
                          SLA     16        CLEAR                       DP112620
                    AH010 STO   3 AZ950-E   *TYPE 'F' INDICATOR         DP112630
                          LD    3 AZ901-E   INDICATE                    DP112640
                          STO   3 AZ944-E   *ABSOLUTE PROGRAM           DP112650
                          MDX     AH050     BRANCH TO WRITE SECTOR      DP112660
                    AH020 LD   L  BUFFR+1   FETCH AND STORE             DP112670
                          STO   3 AZ941-E   *CURRENT SECTOR ADDRESS     DP112680
                          MDX     AH040     BR TO INDICATE REL PROGRAM  DP112690
                    AH030 LD    3 AZ932-E   FETCH AND STORE             DP112700
                          STO   3 AZ941-E   *LAST SECTOR ADDRESS        DP112710
                    AH040 LD    3 AZ928-E   INDICATE                    DP112720
                          STO   3 AZ944-E   *RELOCATABLE PROGRAM        DP112730
                    AH050 LD    3 AZ961-E   RESET                       DP112740
                          STO  L  CK300     *CHECKSUM PROCESSING        DP112750
                          BSI  L  WRITE     BR TO WRITE PREVIOUS SECTOR DP112760
                          SRA     16        CLEAR                       DP112770
                          STO  L  CK900     *CHECKSUM SEQUENCE NUMBER   DP112780
                          STO   3 AZ934-E   *AND CORRELATION FACTOR     DP112790
                          LD    3 AZ956-E   SET BRANCH ADDRESS          DP112800
                          STO  L  AJ040+1   *IN DATA RECORD PROCESSING  DP112810
                          LD    3 AZ922-E   SET OPERATION               DP112820
                          STO  L  AJ040     *IN DATA RECORD PROCESSING  DP112830
                          SRA     16        CLEAR                       DP112840
                          STO   3 AZ948-E   *SECTOR BREAK INDICATOR     DP112850
                          LD    3 AZ912-E   FORCE NEXT PROGRAM TO BE    DP112860
                          STO   3 AZ943-E   *STORED ON A NEW SECTOR     DP112870
                    *                                                   DP112880
                    * SAVE COMMA WORDS ON RELOAD FUNCTION               DP112890
                    *                                                   DP112900
                          LD    3 AZ942-E   TEST FOR AND BRANCH IF      DP112910
                          BSC  L  AH060,+-  *NOT READING THE RES IMAGE  DP112920
                          LD   L  LMODE     FETCH LOAD MODE INDICATOR   DP112930
                          BSC  L  AH060,Z+  BRANCH IF AN INITIAL LOAD   DP112940
                          LD    3 AZ959-E   FETCH RES IMAGE SCTR ADDR   DP112950
                          STO  L  BUFFR+1   *AND STORE TO I/O AREA      DP112960
                          BSI  L  FETCH     BRANCH TO FETCH RES IMAGE   DP112970
                          LDX  L2 BUFFR+2-6 POINT TO PSEUDO WORD 0      DP112980
                          LD    2 $DREQ                                 DP112990
                          STO   3 AZ966-E                               DP113000
                          LD    2 $ULET                                 DP113010
                          STO   3 AZ967-E   SAVE WORDS TO BE RESTORED   DP113020
                          LD    2 $DZIN     *AFTER THE RESIDENT IMAGE   DP113030
                          STO   3 AZ968-E   *DECK HAS BEEN READ         DP113040
                          LD   L  BUFFR+2-6+$FPAD                       DP113050
                          STO   3 AZ969-E                               DP113060
                          LD   L  BUFFR+2-6+$DCYL                       DP113070
                          STO   3 AZ970-E                               DP113080
                    AH060 BSC  L  AA040     BRANCH TO READ NEXT RECORD  DP113090
                          HDNG    PROCESS LOAD MODE RECORD              DP113100
                    *                                                   DP113110
                    * DETERMINE LOAD MODE                               DP113120
                    *                                                   DP113130
                    AI000 DC      0         ENTRY                       DP113140
                          LD    1 6         FETCH WORD 6  (COLUMN 8)    DP113150
                          EOR     AI900     TEST FOR AND                DP113160
                          BSC  L  AI010,+-  *BRANCH IF AN 'R'           DP113170
                          LD    1 6         FETCH WORD 6 AGAIN          DP113180
                          EOR     AI901     TEST FOR AND                DP113190
                          BSI  L  ER017,Z   *BRANCH IF NOT AN 'I'       DP113200
                    AI010 LD    1 6         FETCH WORD 6                DP113210
                          SRA     11        SET UP                      DP113220
                          SLA     15        *LOAD MODE INDICATOR,       DP113230
                          STO     AI902     *RELOAD=0, INIT LOAD=NON-Z  DP113240
                    *                                                   DP113250
                    * INDICATE PH ID PAIRS TO BE BYPASSED               DP113260
                    *                                                   DP113270
                          LD    1 12        CHECK COLUMN 15         2-5 DP113280
                          RTE     16        *'C' SAYS LOAD COBOL    2-9 DP113290
                          LD    1 11        *                       2-5 DP113300
                          RTE     24        *                       2-5 DP113310
                          SRA     4         *                       2-5 DP113320
                          BSC  L  AI015,+-  BRANCH IF BLANK         2-8 DP113330
                          EOR     AI906     CHECK IF 'C'            2-9 DP113340
                          BSI  L  ER017,Z   BRANCH IF NOT           2-5 DP113350
                          MDX     AI020     DO NOT SET BIT 14 ON    2-9 DP113360
                    AI015 MDX  L  AI902,2   SET BIT 14 ON           2-9 DP113370
                    AI020 RTE     24        CHECK COLUMN 14         2-5 DP113380
                          LD    1 10        *BYPASS RPG COMPILER    2-5 DP113390
                          RTE     20        *                       2-5 DP113400
                          SRA     4         *                       2-5 DP113410
                          BSC  L  AI030,+-  BRANCH IF BLANK         2-5 DP113420
                          EOR     AI900     CHECK IF 'R'            2-5 DP113430
                          BSI  L  ER017,Z   BRANCH IF NOT           2-5 DP113440
                          MDX  L  AI902,4   SET BIT 13 ON           2-5 DP113450
                    AI030 RTE     12        CHECK COLUMN 13         2-5 DP113460
                          SRA     4         *BYPASS FORTRAN COMPILR 2-5 DP113470
                          BSC  L  AI040,+-  BRANCH IF BLANK         2-5 DP113480
                          EOR     AI904     CHECK IF 'F'            2-5 DP113490
                          BSI  L  ER017,Z   BRANCH IF NOT           2-5 DP113500
                          MDX  L  AI902,1   SET BIT 15 ON           2-5 DP113510
                    AI040 LD    1 9         CHECK COLUMN 12         2-5 DP113520
                          SLA     4         *BYPASS ASSEMBLER       2-5 DP113530
                          BSC  L  AI050,+-  BRANCH IF BLANK         2-5 DP113540
                          EOR     AI905     CHECK IF 'A'            2-5 DP113550
                          BSI  L  ER017,Z   BRANCH IF NOT           2-5 DP113560
                          MDX  L  AI902,8   SET BIT 12 ON           2-9 DP113570
                    AI050 LD      AI902     SAVE                    2-5 DP113580
                          STO  L  LMODE     *THE                    2-5 DP113590
                          STO   3 AZ940-E   *INDICATORS             2-5 DP113600
                          BSC  L  AA040     BRANCH TO READ NEXT RECORD  DP113610
                    *                                                   DP113620
                    * CONSTANTS AND WORK AREAS                          DP113630
                    *                                                   DP113640
                    AI900 DC      /0401     BINARY 'R'                  DP113650
                    AI901 DC      /0801     BINARY 'I'                  DP113660
                    AI902 DC      *-*       TEMPORARY STORAGE           DP113670
                    AI903 DC      /FFFF     DUMMY ENTRY             2-5 DP113680
                    AI904 DC      /0808     BINARY 'F'              2-5 DP113690
                    AI905 DC      /9000     BINARY 'A'              2-5 DP113700
                    AI906 DC      /0840     BINARY 'C'              2-9 DP113710
                    AJ000 DC      0         ENTRY                       DP113720
                          RTE     16        ISOLATE WORD COUNT          DP113730
                          SRA     8                                     DP113740
                          STO     AJ020+1   WD CNT FROM RCD TO XR2      DP113750
                          BSI  L  CKSUM     PROCESS CHK-SUM IF PRESENT  DP113760
                          LD    3 AZ944-E   TEST NEW SCTR INDR & IF ON  DP113770
                          BSC  L  AJ140,Z   *BR TO VERIFY WD CNT OVER 1 DP113780
                    AJ010 BSC  L  AJ110,Z-  BR TO ABS SCTR BREAK SUBR   DP113790
                          BSC  L  AJ120,Z+  BR TO RELATIVE BREAK SUBR   DP113800
                          LD    3 AZ925-E   AVOID LONG ADD INSTRUCTION  DP113810
                          STO     AJ030     *BY INSERTING A SKIP        DP113820
                    AJ020 LDX  L2 *-*       SET XR2 WITH WD CNT OF RCD  DP113830
                          LD    1 1         FETCH CORE LOADING ADDR     DP113840
                    AJ030 MDX     *+2       AT SCTR BREAKS, ADDR OF     DP113850
                          A    L  AZ902     *1ST WD TO STORE IS UP BY 2 DP113860
                    AJ040 BSI  L  RELAD     CALC RELOCATION FACTOR      DP113870
                          S    L  AZ945     MAINTAIN LONG FORMAT INST   DP113880
                          BSI  L  ER004,Z+  ORG BACKWARD MSG            DP113890
                    AJ050 STO   3 AZ937-E   SAVE RELATIVE ADDR          DP113900
                          SRT     16        SHIFT TO EXTENSION          DP113910
                          D     3 AZ912-E   DIVIDE BY WDS PER SECTOR    DP113920
                          STD   3 AZ964-E   SAVE QUOTIENT & REMAINDER   DP113930
                          S     3 AZ943-E   BR IF SCTR FOR THIS PART OF DP113940
                          BSC  L  AJ070,+-  *PROGRAM ALREADY IN CORE    DP113950
                          LD    3 AZ948-E   THIS INDR CLEARED ON SCTR   DP113960
                          BSC  L  AJ160,+-  *BREAKS                     DP113970
                          LD    3 AZ964-E   FETCH QUOTIENT              DP113980
                          STO   3 AZ943-E   SET POINTER                 DP113990
                          BSI  L  WRITE     WRITE A SECTOR              DP114000
                          LD    3 AZ964-E   FETCH QUOTIENT              DP114010
                    AJ060 A     3 AZ935-E   ADD SCTR ADDR               DP114020
                          STO  L  BUFFR+1   SET SCTR ADDR IN BUFFER     DP114030
                          BSI  L  FETCH     READ A SECTOR FROM DISK     DP114040
                          LDD   3 AZ964-E   FETCH REMAINDER             DP114050
                    AJ070 SLT     16        REL LOC IN CORE BUFFER      DP114060
                          A    L  AZ902     INCR BY 2                   DP114070
                          A     3 AZ954-E   ADD BUFFER ADDR             DP114080
                          STO     AJ090+1   SET ADDR IN STORE INST      DP114090
                          LD    3 AZ944-E   TEST FOR SECTOR BREAK       DP114100
                          BSC  L  AJ080,+-  BR IF NOT                   DP114110
                          SRA     16        INDICATE NEW SCTR REQ       DP114120
                          STO   3 AZ944-E                               DP114130
                          MDX   1 2         FETCH 3RD DATA WORD         DP114140
                    AJ080 LD    1 10        NO SCTR ADDR IN THIS CARD   DP114150
                          MDX   2 0         TEST XR2 FOR 0              DP114160
                          MDX     AJ090     STORE A WORD                DP114170
                          MDX     AJ100     READ NEXT RECORD            DP114180
                    AJ090 STO  L  *-*       DATA WD TO DISK BUFFER      DP114190
                          LD    3 AZ937-E   CORE ADDR OF DATA WD        DP114200
                          A     3 AZ901-E   MODIFY POINTER              DP114210
                          MDX   1 1                                     DP114220
                          MDX   2 -1        SKIP AFTER LAST WD DONE     DP114230
                          MDX     AJ050     *ELSE PROCESS NEXT WORD     DP114240
                    AJ100 BSC  L  AA040     READ NEXT RECORD            DP114250
                    *                                                   DP114260
                    AJ110 LD    1 11        FETCH FROM 1ST DATA RECORD  DP114270
                          STO   3 AZ935-E   SAVE SCTR ADDR              DP114280
                          STO   3 AZ932-E   SAVE BASE SCTR ADDR         DP114290
                          MDX     AJ130     TO FETCH WD CNT             DP114300
                    *                                                   DP114310
                    AJ120 LD    1 11        SECTOR ADDR                 DP114320
                          A     3 AZ941-E   PREVIOUS SCTR ADDR          DP114330
                          STO   3 AZ935-E                               DP114340
                    *                                                   DP114350
                    AJ130 LD      AJ020+1   FETCH WORD COUNT            DP114360
                          S    L  AZ902     DECR BY 2                   DP114370
                          STO     AJ020+1   STORE BACK                  DP114380
                          LD    3 AZ921-E   FETCH 'NOP' INST            DP114390
                          STO     AJ030     *TO CANCEL 'MDX    *+2'     DP114400
                          MDX     AJ020     TO PROCESS DATA RCD         DP114410
                    *                                                   DP114420
                    AJ140 LD   L  AJ020+1   FETCH WD COUNT              DP114430
                          S     3 AZ901-E   DECR BY 1                   DP114440
                          BSC     Z-        SKIP IF WD CNT 0 OR 1       DP114450
                          MDX     AJ150     CONTINUE IF POSITIVE        DP114460
                          BSI  L  ER004     ORG BACKWARD ERROR          DP114470
                    AJ150 LD    3 AZ944-E   RELOAD SCTR INDICATOR       DP114480
                          BSC  L  AJ010     RETURN                      DP114490
                    *                                                   DP114500
                    AJ160 LD    3 AZ964-E   FETCH NEW SCTR INDR         DP114510
                          STO   3 AZ943-E                               DP114520
                          MDX  L  AZ948,1   TEST FOR AND                DP114530
                          MDX     AJ060     *BR IF NOT SCTR BREAK       DP114540
                          BSI  L  AH000     BRANCH TO FETCH NEXT SECTOR DP114550
                          HDNG    INITIALIZE RES MON AND DISKZ          DP114560
                    *                                                   DP114570
                    * ROLL RESIDENT IMAGE AND DISKZ TO LOWER CORE       DP114580
                    *                                                   DP114590
                    AK000 DC      0         ENTRY                       DP114600
                          LD    3 AZ942-E   TEST FOR AND BRANCH IF      DP114610
                          BSC  L  AK080,+-  *PROG JUST READ NOT RES IMG DP114620
                          STO   3 AZ950-E   SET 'F' RECORD INDR ON      DP114630
                          LDX  L1 6-$ZEND   WORD COUNT = -(-6+$ZEND)    DP114640
                    AK010 LD   L1 BUFFR+$ZEND-4  FETCH WORD FROM BUFFER DP114650
                          STO  L1 $ZEND     STORE TO LOWER CORE         DP114660
                          MDX   1 1         INCR WORD CNT, SKIP IF ZERO DP114670
                          MDX     AK010     BRANCH TO FETCH NEXT WORD   DP114680
                          LDX  L1 DZ000+5   STORE ADDRESS OF DISKZ      DP114690
                          STX  L1 $I205+1   *INTERRUPT TO ILS02         DP114700
                          LDX  L1 INTPT     STORE ADDR OF INTRPT SUBR   DP114710
                          STX  L1 $IREQ     *TO INTERRUPT REQUEST       DP114720
                          LDX  L1 AA060-1   STORE ADDRESS OF INTERRUPT  DP114730
                          STX  L1 $IBT4     *BRANCH TABLE TO ILS04      DP114740
                          LDX  L1 CD016+1   SET UP COLUMN INTERRUPT     DP114750
                          STX  L1 $LEV0     *BRANCH ADDRESS             DP114760
                    *                                                   DP114770
                    * FETCH DRIVE CODE FROM BIT SWITCHES                DP114780
                    *                                                   DP114790
                    AK020 XIO     AK900     READ THE BIT SWITCHES       DP114800
                          LD      AK907     TEST FOR                    DP114810
                          BSC  L  AK030,Z+  *AND BRANCH                 DP114820
                          S     3 AZ910-E   *IF DRIVE CODE         2-11 DP114830
                          BSC  L  AK030,-Z  *NOT LEGAL                  DP114840
                          LDX  I1 AK907     FETCH DRIVE CODE TO XR1     DP114850
                          LD   L1 AK904     FETCH AREA CODE             DP114860
                          STO  L  $ACDE     *AND STORE TO COMMA         DP114870
                          LD      AK906     INITIALIZE                  DP114880
                          STO  L  $DCYL     *DEFECTIVE CYLINDER         DP114890
                          STO  L  $DCYL+1   *ADDRESSES IN COMMA         DP114900
                          STO  L  $DCYL+2   FORCE DISKZ TO SEEK         DP114910
                          STO  L  $CYLN     *BEFORE FIRST OPERATION     DP114920
                          LD    3 AZ912-E   RESET                       DP114930
                          SRA     1         *BUFFER SIZE                DP114940
                          STO   3 AZ912-E   *TO 320                     DP114950
                          SRA     16        SET                         DP114960
                          STO   3 AZ938-E   *INHIBIT SWITCH OFF         DP114970
                          STO   3 AZ942-E   *AND RES IMAGE SWITCH OFF   DP114980
                          LD    3 AZ921-E   CANCEL INSTRUCTION TO       DP114990
                          STO  L  AH010     *SET 'F' RECORD INDICATOR   DP115000
                    *                                                   DP115010
                    * IF RELOAD CHECK SLET/RELOAD TABLE CHECKSUM        DP115020
                    * BEFORE WRITING TO THE DISK                        DP115030
                    *                                                   DP115040
                          LD   L  LMODE     FETCH LOAD MODE INDICATOR   DP115050
                          BSI  L  CK600,-   BRANCH IF A RELOAD          DP115060
                    *                                                   DP115070
                    *                                                   DP115080
                    * UPDATE THE RESIDENT IMAGE ON RELOAD FUNCTION      DP115090
                    *                                                   DP115100
                          LD   L  LMODE     FETCH LOAD MODE INDICATOR   DP115110
                          BSC  L  AK025,Z+  BRANCH IF AN INITIAL LOAD   DP115120
                          LDX  L2 BUFFR+2-6 POINT TO PSEUDO WORD 0      DP115130
                          LD    3 AZ966-E                               DP115140
                          STO   2 $DREQ                                 DP115150
                          LD    3 AZ967-E   RESTORE SAVED WORDS TO      DP115160
                          STO   2 $ULET     *TO RESIDENT IMAGE BEFORE   DP115170
                          LD    3 AZ968-E   *WRITING IT TO DISK         DP115180
                          STO   2 $DZIN                                 DP115190
                          LD    3 AZ969-E                               DP115200
                          STO  L  BUFFR+2-6+$FPAD                       DP115210
                          LD    3 AZ970-E                               DP115220
                          STO  L  BUFFR+2-6+$DCYL                       DP115230
                    *                                                   DP115240
                    * WRITE RESIDENT IMAGE TO DISK                      DP115250
                    *                                                   DP115260
                    AK025 LD    3 AZ960-E   FETCH AND STORE SECTOR ADDR DP115270
                          STO  L  BUFFR+1   *OF RES IMAGE TO I/O BUFFER DP115280
                          BSI  L  WRITE     BRANCH TO WRITE RES. IMAGE  DP115290
                    *                                                   DP115300
                    * FETCH FIRST THIRTY WORDS OF ID SECTOR             DP115310
                    *                                                   DP115320
                          LDX  L1 BUFFR+@CSTR-4  SET UP ADDRESS OF      DP115330
                          STX  L1 AK905     *COLD START BUFFER          DP115340
                          LDD     AK902     STORE WORD COUNT AND SECTOR DP115350
                          STD  I  AK905     *ADDR TO COLD START BUFFER  DP115360
                          LD      AK905     FETCH ADDR OF C. S. BUFFER  DP115370
                          SRT     16        SHIFT TO EXT, ACC = 0       DP115380
                          BSI  L  DZ000     BRANCH TO READ DISK         DP115390
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  DP115400
                          MDX     *-3       BR TO TEST READ COMPLETE    DP115410
                    *                                                   DP115420
                    * WRITE NEW ID SECTOR (30 WDS & DISKZ & COLD START) DP115430
                    *                                                   DP115440
                          LD    3 AZ912-E   SET WORD COUNT TO WRITE     DP115450
                          STO  I  AK905     *COMPLETE SECTOR            DP115460
                          LD      AK905     FETCH ADDR OF C. S. BUFFER  DP115470
                          SRT     16        SHIFT TO EXTENSION          DP115480
                          LD    3 AZ901-E   FETCH WRITE FUNCTION CODE   DP115490
                          BSI  L  DZ000     BRANCH TO WRITE DISK        DP115500
                          MDX  L  $DBSY,0   SKIP NEXT IF WRITE COMPLETE DP115510
                          MDX     *-3       BR TO TEST WRITE COMPLETE   DP115520
                    *                                                   DP115530
                    * HISTORIC COMPATABILITY.....                       DP115540
                    * IF SLET/RELOAD TABLE CHECKSUM WAS ZERO, UPDATE    DP115550
                    * SLET TO SPECIFICATIONS OF NEW SYSTEM LOADER.      DP115560
                    *                                                   DP115570
                          LD   L  LMODE     FETCH LOAD MODE INDICATOR   DP115580
                          BSC  L  AK029,Z+  BR IF INITIAL LOAD          DP115590
                          LD   L  CK913     FETCH OLD CHECKSUM          DP115600
                          BSI  L  CK630,+-  BRANCH TO PACK SLET TABLE   DP115610
                    *                                                   DP115620
                    AK029 MDX     AK040     BR TO TEST FILE PROT ADDRS  DP115630
                    *                                                   DP115640
                    * ILLEGAL DRIVE CODE - PRINT MESSAGE E 11           DP115650
                    *                                                   DP115660
                    AK030 LDX  L1 MSG11+1   POINT TO ERROR MESSAGE E 11 DP115670
                          LDX  I2 MSG11     FETCH WORD CNT OF MSG E 11  DP115680
                          BSI  L  CNPTR     BRANCH TO PRINT THE MESSAGE DP115690
                          MDX     AK020     BRANCH TO RETRY             DP115700
                    *                                                   DP115710
                    * CONSTANTS AND WORK AREAS                          DP115720
                    *                                                   DP115730
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   DP115740
                    AK900 DC      AK907     ADDRESS OF DRIVE CODE       DP115750
                          DC      @I000     2ND WD OF READ BIT SW IOCC  DP115760
                    AK902 DC      $DBSY-@CSTR  WORD COUNT               DP115770
                          DC      @IDAD        SECTOR ADDRESS           DP115780
                    AK904 DC      @I510     AREA CODE OF PHY DRIVE 0    DP115790
                          DC      @I511     AREA CODE OF PHY DRIVE 1    DP115800
                          DC      @I512     AREA CODE OF PHY DRIVE 2    DP115810
                          DC      @I513     AREA CODE OF PHY DRIVE 3    DP115820
                          DC      @I514     AREA CODE OF PHY DRIVE 4    DP115830
                          DC      @I515     AREA CODE OF PHY DR  5 2-11 DP115831
                          DC      @I516     AREA CODE OF PHY DR  6 2-11 DP115832
                          DC      @I517     AREA CODE OF PHY DR  7 2-11 DP115833
                          DC      @I518     AREA CODE OF PHY DR  8 2-11 DP115834
                          DC      @I519     AREA CODE OF PHY DR  9 2-11 DP115835
                          DC      @I520     AREA CODE OF PHY DR 10 2-11 DP115836
                    AK905 DC      *-*       ADDR OF COLD AA040 BUFFER   DP115840
                    AK906 DC      @MSCT     MAXIMUM ARM POSITION        DP115850
                    AK907 DC      *-*       DRIVE CODE                  DP115860
                    AK908 DC      /0800     HALF MIN CORE SIZE (2K)     DP115870
                    AK909 DC      @MNCR     MINIMUM CORE SIZE  (4K)     DP115880
                    *                                                   DP115890
                    * DETERMINE STATUS OF CARTRIDGE                     DP115900
                    *                                                   DP115910
                    AK040 LD    3 AZ959-E   FETCH ID SECTOR ADDRESS     DP115920
                          STO  L  BUFFR+1   *AND STORE TO I/O BUFFER    DP115930
                          BSI  L  FETCH     BRANCH TO FETCH ID SECTOR   DP115940
                    *                                                   DP115950
                          LD   L  BUFFR+2+@STAT  FETCH STATUS (WORD 7)  DP115960
                          S     3 AZ902-E   BR IF CARTRIDGE NOT ALREADY DP115970
                          BSC  L  AK045,Z   *DM2 INITIAL LOADED         DP115980
                          LD   L  LMODE     FETCH LOAD MODE INDICATOR   DP115990
                          BSI  L  ER005,Z+  BRANCH IF NOT A RELOAD FUNC DP116000
                          MDX     AK050                                 DP116010
                    *                                                   DP116020
                    AK045 A     3 AZ904-E   BR IF CARTRIDGE NOT JUST    DP116030
                          BSI  L  ER005,Z   *INITIALIZED                DP116040
                          LD   L  LMODE     FETCH LOAD MODE INDICATOR   DP116050
                          BSI  L  ER016,-   BRANCH IF NOT AN INIT LOAD  DP116060
                    *                                                   DP116070
                    * DETERMINE VALIDITY OF CARTRIDGE INITIALIZATION    DP116080
                    *                                                   DP116090
                    AK050 LD   L  BUFFR+2+@CIDN  FETCH CART ID (WORD 3) DP116100
                          BSI  L  ER012,+   BRANCH IF INVALID ID        DP116110
                          STO  L  CARID     SAVE CART ID FOR PHASE 2    DP116120
                          LDX   2 -3        SET DEF CYL ADDRESSES COUNT DP116130
                    AK055 LD   L2 BUFFR+5   FETCH A DEF CYL ADDRESS     DP116140
                          S     3 AZ918-E   TEST FOR AND BRANCH IF      DP116150
                          BSC  L  ER012,Z-  *INVALID  (GT /0658)        DP116160
                          MDX   2 1         INCR CYL CNT, SKIP IF ZERO  DP116170
                          MDX     *+1                                   DP116180
                          MDX     AK060     LAST DEF CYL ADDRESS BRANCH DP116190
                          LD   L2 BUFFR+4   FETCH DEF CYL ADDRESS AGAIN DP116200
                          S    L2 BUFFR+5   TEST FOR AND BRANCH IF      DP116210
                          BSC  L  ER012,Z-  *GT NEXT DEF CYL ADDRESS    DP116220
                    AK060 LD   L2 BUFFR+4   FETCH DEF CYL ADDRESS       DP116230
                          STO  L2 $DCYL+2   *AND STORE TO COMMA         DP116240
                          STO  L2 DCYL1+2   *AND SYS LOADER COMM AREA   DP116250
                          MDX   2 0         SKIP IF LAST ADDR PROCESSED DP116260
                          MDX     AK055     BR TO FETCH NEXT DEF CYL    DP116270
                    *                                                   DP116280
                    * SAVE DCOM ITEMS FOR PHASE 2                       DP116290
                    *                                                   DP116300
                          LD    3 AZ957-E   FETCH DCOM SECTOR ADDRESS   DP116310
                          STO  L  BUFFR+1   *AND STORE TO I/O BUFFER    DP116320
                          BSI  L  FETCH     BRANCH TO FETCH DCOM SECTOR DP116330
                    *                                                   DP116340
                          LDX   1 -5        SET CARTRIDGE ID COUNT      DP116350
                          LDX  L2 BUFFR+2   XR2 PTS TO 1ST WD OF BFR2-3 DP116360
                    AK065 LD   L  CARID     FETCH CARTRIDGE ID          DP116370
                    *                                               2-3 DP116380
                          EOR  L2 #CIDN     TEST FOR AND BRANCH IF      DP116390
                          BSC  L  AK070,+-  *MATCH FOUND IN DCOM        DP116400
                          MDX   2 1         POINT TO NEXT DCOM WORD     DP116410
                          MDX   1 1         INCR ID COUNT, SKIP IF ZERO DP116420
                          MDX     AK065     BR TO TEST NEXT CART ID     DP116430
                          BSI  L  ER012     NO MATCH, BR TO  PRINT MSG  DP116440
                    *                                                   DP116450
                    AK070 LD    2 #CIBA     SAVE                        DP116460
                          STO  L  CIBFR     *SECTOR ADDR OF CIB         DP116470
                    *                                               2-3 DP116480
                    *   CODING TO CHECK FILE PROTECT ADDRESS MOVED  2-3 DP116490
                    *                                               2-3 DP116500
                          LD    2 #FPAD     FETCH FILE PROTECT ADDRESS  DP116510
                          S     2 #ULET     SAVE                        DP116520
                          STO  L  SHIFT     *NO. OF SECTORS TO SHIFT,   DP116530
                          LD    2 #ULET                                 DP116540
                          STO  L  LET00     *OLD LET SECTOR ADDRESS,    DP116550
                          LD    2 #SCRA                                 DP116560
                          STO  L  ASCRA     *SCRA SECTOR ADDRESS,       DP116570
                          LD    2 #FLET                                 DP116580
                          SLA     4                                     DP116590
                          SRA     4                                     DP116600
                          STO  L  FLETI     *FIXED AREA INDICATOR       DP116610
                          LD    2 #CSHN                                 DP116620
                          STO  L  CAREA     *AND CUSHION SIZE FOR PH 2  DP116630
                          LD   L  LMODE     TEST FOR AND BRANCH         DP116640
                          BSC  L  AA040,-   *IF A RELOAD FUNCTION       DP116650
                    *                                                   DP116660
                    * CLEAR DCOM AND SLET SECTORS ON INITIAL LOAD ONLY  DP116670
                    *                                                   DP116680
                          BSI  L  AK074     BRANCH TO CLEAR 'BUFFR'     DP116690
                          LDX  L1 @SLET     SET SECTOR ADDRESS          DP116700
                          STX  L1 BUFFR+1   *OF FIRST SLET SECTOR       DP116710
                          BSI  L  WRITE     BR TO WRITE 1ST SLET SECTOR DP116720
                          MDX  L  BUFFR+1,1 SET SAD OF 2ND SLET SECTOR  DP116730
                          BSI  L  WRITE     BR TO WRITE 2ND SLET SECTOR DP116740
                          MDX  L  BUFFR+1,1 SET SAD OF 3RD SLET SECTOR  DP116750
                          BSI  L  WRITE     BR TO WRITE 3RD SLET SECTOR DP116760
                          BSC  L  AA040     BRANCH TO READ PHASE 2      DP116770
                    *                                                   DP116780
                    AK074 DC      0         ENTRY/RETURN ADDRESS        DP116790
                          LDX  L1 320       *LOOP                       DP116800
                          SRA     16        *CLEARS                     DP116810
                    AK076 STO  L1 BUFFR+1   *'BUFFR'                    DP116820
                          MDX   1 -1        *TO                         DP116830
                          MDX     AK076     *ZEROS                      DP116840
                          BSC  I  AK074     RETURN                      DP116850
                    *                                                   DP116860
                    * 'F' RECORD OF PHASE 2 RECOGNIZED                  DP116870
                    *                                                   DP116880
                    AK080 BSI  L  WRITE     BR TO WRITE PHASE 2 TO DISK DP116890
                          NOP               A WAIT MAY BE PATCHED HERE  DP116900
                          LD      *-1       SET                         DP116910
                          STO   3 AZ949-E   *'SCON' RECORD              DP116920
                          STO   3 AZ933-E   *NEXT INDICATORS ON         DP116930
                    *                                                   DP116940
                    * DETERMINE SYSTEM CORE SIZE                        DP116950
                    *                                                   DP116960
                          LDX   2 0         SET ADDRESS OF LOCATION 0   DP116970
                          STX  L2 0         *IN LOCATION 0              DP116980
                          LD   L  AK908     FETCH MAX ADDR OF MIN CORE  DP116990
                          MDX     AK100+1   SKIP NEXT INSTRUCTION       DP117000
                    AK100 LD      AK110+1   FETCH NEXT CORE SIZE ADDR   DP117010
                          SLA     1         MULTIPLY BY TWO             DP117020
                          STO     AK110+1   *AND STORE THE ADDRESS      DP117030
                    AK110 STO  L  *-*       STORE CORE ADDR IN ADDRESS  DP117040
                          STO  L  SCORE     SAVE ACTUAL CORE SIZE       DP117050
                          BSC  L  AK120,-   BRANCH IF CORE SIZE LT 32K  DP117060
                          LD    3 AZ911-E   FETCH NO. OF SECTORS        DP117070
                          MDX     AK130     BRANCH TO STORE             DP117080
                    AK120 S    L  AK909     SUBTRACT MINIMUM CORE SIZE  DP117090
                          SRT     16        SHIFT TO EXTENSION          DP117100
                          D     3 AZ920-E   DIVIDE BY SECTOR SIZE       DP117110
                    AK130 A     3 AZ901-E   INCREMENT BY ONE AND        DP117120
                          STO  L  SSBFR     *SAVE NO. OF SCTRS/FLET BFR DP117130
                          LD   L  0         FETCH CONTENTS OF LOC 0     DP117140
                          BSC     +-        SKIP IF NON-ZERO            DP117150
                          MDX     AK100     BR TO TRY NEXT CORE INCR    DP117160
                          BSC  L  AA040     BRANCH TO READ NEXT RECORD  DP117170
                          HDNG    DECIMAL TO BINARY CONVERSION          DP117180
                    *                                                   DP117190
                    * CONVERT A DECIMAL NUMBER IN THE FIRST PARAMETER   DP117200
                    * TO BINARY AND RETURN IT IN THE ACCUMULATOR        DP117210
                    *                                                   DP117220
                    DCBIN DC      0         ENTRY/RETURN ADDRESS        DP117230
                          STD     DC900     SAVE ACC AND EXT            DP117240
                          STX   1 DC080+1   SAVE XR1                    DP117250
                          STX   2 DC090+1   SAVE XR2                    DP117260
                          STS     DC060     SAVE STATUS                 DP117270
                          LDX  I1 DCBIN     XR1 POINTS TO PARAMETER     DP117280
                          LD    1 0         FETCH AND STORE             DP117290
                          STO     DC010+1   *INPUT PARAMETER            DP117300
                          MDX   1 +1        INCREMENT FOR               DP117310
                          STX   1 DC100+1   *AND SAVE RETURN ADDRESS    DP117320
                    DC010 LDX  L1 *-*       XR1 POINTS TO INPUT PARAM   DP117330
                          LD      DC904     FETCH AND                   DP117340
                          STO     DC903     *STORE DIGIT COUNT (5)      DP117350
                          SRA     16        CLEAR                       DP117360
                          STO     DC900     *OUTPUT REGISTER            DP117370
                    DC020 LD    1 1         FETCH A DIGIT               DP117380
                          BSC  L  DC030,+-  BRANCH IF ZERO              DP117390
                          AND     DC910     TEST FOR AND BRANCH IF      DP117400
                          BSC  L  DC050,Z   *BITS 0, 1, 12-15 ON        DP117410
                          LD    1 1         FETCH DIGIT AGAIN           DP117420
                          LDX   2 12        XR2 = BIT COUNT (+, -, 0-9) DP117430
                          SLCA  2 0         COUNT NUMBER OF BITS SET    DP117440
                          S       DC909     TEST FOR AND BR IF NO. OF   DP117450
                          BSC  L  DC050,Z   *BITS EQUALS ZERO OR GT ONE DP117460
                          STX   2 DC902     SAVE VALUE OF DIGIT         DP117470
                          LD      DC905     FETCH FIVE                  DP117480
                          S       DC902     SUBTRACT VALUE              DP117490
                    DC030 A       DC900     ADD ACCUMULATED VALUE       DP117500
                          MDX  L  DC903,-1  DECR DIGIT CNT, SK IF ZERO  DP117510
                          MDX     DC120     BRANCH TO FETCH NEXT DIGIT  DP117520
                          STO     DC900     STORE BINARY VALUE          DP117530
                          BSC  L  DC130,O   BRANCH IF OVERFLOW          DP117540
                          LD    1 -4        FETCH SIGN CHARACTER        DP117550
                          BSC  L  DC060,+-  BRANCH IF BLANK (POSITIVE)  DP117560
                          S       DC908     TEST FOR AND                DP117570
                          BSC  L  DC110,+-  *BRANCH IF SIGN NEGATIVE    DP117580
                          S       DC908     TEST FOR AND                DP117590
                          BSC  L  DC060,+-  *BRANCH IF SIGN AMPERSAND   DP117600
                          S       DC907     TEST FOR AND                DP117610
                    DC040 BSC  L  DC060,+-  *BRANCH IF SIGN POSITIVE    DP117620
                    DC050 LDS     1         SET OVERFLOW ON, CARRY OFF  DP117630
                          MDX     DC070     BRANCH TO RETURN            DP117640
                    DC060 LDS     0         RESTORE STATUS              DP117650
                    DC070 LDD     DC900     RESTORE ACC AND EXT         DP117660
                    DC080 LDX  L1 *-*       RESTORE XR1                 DP117670
                    DC090 LDX  L2 *-*       RESTORE XR2                 DP117680
                    DC100 BSC  L  *-*       RETURN                      DP117690
                    DC110 S       DC900     COMPLEMENT AND              DP117700
                          STO     DC900     *SAVE BINARY VALUE          DP117710
                          MDX     DC060     BRANCH TO RETURN            DP117720
                    DC120 M       DC906     MULTIPLY BY TEN SCALED      DP117730
                          BSC  L  DC050,Z   BRANCH IF GT 32760          DP117740
                          SLT     15        SHIFT PRODUCT TO EXTENSION  DP117750
                          STO     DC900     *AND SAVE VALUE             DP117760
                          MDX   1 +1        POINT TO NEXT DIGIT         DP117770
                          MDX     DC020     BRANCH TO FETCH NEXT DIGIT  DP117780
                    DC130 EOR     DC909     TEST FOR AND BRANCH         DP117790
                          BSC  L  DC050,Z   *IF BINARY VALUE NOT -32768 DP117800
                          LD    1 -4        FETCH SIGN CHARACTER        DP117810
                          EOR     DC908     TEST FOR AND                DP117820
                          MDX     DC040     *BRANCH IF SIGN NEGATIVE    DP117830
                    *                                                   DP117840
                    * CONSTANTS AND WORK AREAS                          DP117850
                    *                                                   DP117860
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   DP117870
                    DC900 DC      *-*       CONTENTS OF ACCUMULATOR     DP117880
                          DC      *-*       CONTENTS OF EXTENSION       DP117890
                    DC902 DC      0         TEMP STG FOR DIGIT VALUE    DP117900
                    DC903 DC      0         DIGIT COUNT                 DP117910
                    DC904 DC      +5        CONSTANT FIVE               DP117920
                    DC905 DC      +10       CONSTANT TEN                DP117930
                    DC906 DC      /0014     TEN SCALED                  DP117940
                    DC907 DC      /00A0     MASK FOR SIGN CHARACTER     DP117950
                    DC908 DC      /4000     MASK FOR SIGN CHARACTER     DP117960
                    DC909 DC      /8000     MASK FOR BITS ON AFTER SLCA DP117970
                    DC910 DC      /C00F     MASK FOR ILLEGAL BITS       DP117980
                          HDNG    MISCELLANEOUS SUBROUTINES             DP117990
                    *************************************************** DP118000
                    *                                                   DP118010
                    * PROCESS THE CHECKSUM                              DP118020
                    *                                                   DP118030
                    CKSUM DC      0         ENTRY/RETURN ADDRESS        DP118040
                    CK100 LD   L  AA902+1   FETCH WORD 2                DP118050
                          BSC  I  CKSUM,+-  RETURN IF NO CHECKSUM       DP118060
                          MDX  L  CK900,1   INCREMENT THE SEQUENCE NO.  DP118070
                          LDX   2 54        XR2 = NO. WORDS PER RECORD  DP118080
                          LD      CK900     FETCH SEQUENCE NUMBER       DP118090
                    CK200 A    L2 AA902-1   ADD A WORD                  DP118100
                          BSC     C         SKIP IF NO CARRY            DP118110
                          A     3 AZ901-E   ADD ONE                     DP118120
                          MDX   2 -1        DECR WORD CNT, SKIP IF ZERO DP118130
                          MDX     CK200     BRANCH TO ADD NEXT WORD     DP118140
                          S     3 AZ901-E   TEST FOR AND                DP118150
                          BSC  I  CKSUM,+-  *RETURN IF BLANK RECORD     DP118160
                    CK300 MDX     CK400     'NOP' IF SEQUENCE ERROR     DP118170
                    *                                                   DP118180
                          LDX  L1 MSG01+1   POINT TO ERROR MESSAGE E 01 DP118190
                          LDX  I2 MSG01     FETCH WORD CNT OF MSG E 01  DP118200
                          BSI  L  CNPTR     BRANCH TO PRINT THE MESSAGE DP118210
                          MDX  L  CK900,-1  DECREMENT SEQUENCE NUMBER   DP118220
                          NOP               AVOID POSSIBLE SKIP         DP118230
                          BSC  L  AA040     BRANCH TO READ NEXT RECORD  DP118240
                    *                                                   DP118250
                    CK400 EOR   3 AZ931-E   COMPLIMENT AND STORE        DP118260
                          STO     CK900     *STORE CHECKSUM             DP118270
                          LD    3 AZ921-E   CANCEL                      DP118280
                          STO     CK300     *RESET ABILITY              DP118290
                          MDX     CK100     BRANCH TO PROCESS AGAIN     DP118300
                    *                                                   DP118310
                    * CONSTANTS AND WORK AREAS                          DP118320
                    *                                                   DP118330
                    CK900 DC      *-*       SEQUENCE NUMBER             DP118340
                    *                                                   DP118350
                    *************************************************** DP118360
                    *                                                   DP118370
                    * SUBROUTINE TO CALCULATE CHECKSUM OF SLET AND      DP118380
                    * RELOAD TABLE (EXCLUDING LAST WORD OF RELOAD TBL)  DP118390
                    *                                                   DP118400
                    CK500 DC      0         ENTRY/RETURN ADDRESS        DP118410
                          LDD     CK910     SET UP BUFFER TO START      DP118420
                          STD  L  BUFR1     *READING AT 1ST SCTR SLET   DP118430
                          SLA     16        CLEAR CALCULATED            DP118440
                          STO     CK912     *CHECKSUM                   DP118450
                          LDX   1 -4        4 SECTORS TO CHECKSUM       DP118460
                          STX   1 CK914                                 DP118470
                    CK510 MDX  L0 BUFR1+1,1 INCREMENT SECTOR ADDRESS    DP118480
                          BSI  L  FTCH1     READ SECTOR FROM DISK       DP118490
                          LDX  L1 @SCNT-1   WORDS - 1 PER SECTOR        DP118500
                          LD      CK912     RESTORE CHECKSUM TO ACC     DP118510
                    CK520 A    L1 BUFR1+1   CALCULATE CHECKSUM          DP118520
                          BSC     C         IF CARRY                    DP118530
                          A     3 AZ901-E   *ADD 1 TO CHECK SUM         DP118540
                          MDX   1 -1        STEP THROUGH SECTOR         DP118550
                          MDX     CK520     BR TO LOOP IN SECTOR        DP118560
                          STO     CK912     SAVE CHECK SUM              DP118570
                          MDX  L0 CK914,1   INCREMENT SECTOR LOOP COUNT DP118580
                          MDX     CK530     BR, IS NOT RELOAD SECTOR    DP118590
                          BSC  I  CK500     RETURN                      DP118600
                    *                                                   DP118610
                    * INCLUDE LAST WORD OF SECTOR IN ALL BUT RELOAD     DP118620
                    * SECTOR                                            DP118630
                    *                                                   DP118640
                    CK530 A    L  BUFR1+1+@SCNT LAST WORD OF SECTOR     DP118650
                          BSC     C         IF CARRY                    DP118660
                          A     3 AZ901-E   *ADD 1 TO CHECK SUM         DP118670
                          STO     CK912     SAVE CHECK SUM              DP118680
                          MDX     CK510     BR TO LOOP 4 SECTORS        DP118690
                    *                                                   DP118700
                    * CONSTANTS AND WORK AREAS                          DP118710
                    *                                                   DP118720
                          BSS  E  0                                     DP118730
                    CK902 DC      @SCNT     WORD COUNT 1 SECTOR     2-3 DP118740
                          DC      @DCOM     SECTOR ADDRESS OF DCOM  2-3 DP118750
                    CK910 DC      @SCNT     WORD COUNT 1 SECTOR         DP118760
                          DC      @SLET-1   SECTOR ADDRESS OF SLET - 1  DP118770
                    CK912 DC      *-*       CALCULATED CHECKSUM         DP118780
                    CK913 DC      *-*       OLD CHECKSUM FROM TABLE     DP118790
                    CK914 DC      *-*       SECTOR LOOP COUNTER         DP118800
                    CK915 DC      -240      # OF ENTRIES IN SLET.  2-11 DP118810
                    * 4 WORDS OF WORK AREA REMOVED 2-11                 DP118820
                    CK920 DC      3*@SCNT   # OF WORDS IN 3 SECTORS2-11 DP118860
                          DC      @SLET     SECTOR ADDRESS OF SLET      DP118870
                    CK922 DC      *-*       STORAGE FOR XR1 'TO'   ADDR DP118880
                    CK923 DC      *-*       STORAGE FOR XR2 'FROM' ADDR DP118890
                    *************************************************** DP118900
                    *                                                   DP118910
                    * ENTERED ON RELOAD. CALCULATE AND CHECK            DP118920
                    * SLET/RELOAD TABLE CHECKSUM                        DP118930
                    * AND FILE PROTECT ADDRESS.                     2-3 DP118940
                    *                                                   DP118950
                    CK600 DC      0         ENTRY/RETURN ADDRESS        DP118960
                          LDD     CK902     FETCH DCOM              2-3 DP118970
                          STD  L  BUFR1     *FROM                   2-3 DP118980
                          BSI  L  FTCH1     *DISK                   2-3 DP118990
                          LDX  L2 BUFR1+2   POINT TO FIRST WORD     2-3 DP119000
                          LDX   1 -5        SET CARTRIDGE ID COUNT 2-12 DP119001
                    CK610 LD   L  CARID     FETCH CARTRIDGE ID     2-12 DP119002
                          EOR  L2 #CIDN     TEST FOR AND BRANCH IF 2-12 DP119003
                          BSC  L  CK620,+-  *MATCH FOUND IN DCOM   2-12 DP119004
                          MDX   2 1         POINT TO NEXT DCOM WORD2-12 DP119005
                          MDX   1 1         INCR ID CNT SKP IF ZERO2-12 DP119006
                          MDX     CK610     BR TO TST NXT CART ID  2-12 DP119007
                          BSI  L  ER012     NO MATCH PRNT MSG      2-12 DP119008
                    CK620 LD    2 #FPAD     SAVE FILE              2-12 DP119010
                          STO  L  FPADR     *PROTECT ADDRESS        2-3 DP119020
                          S     3 AZ916-E   TEST AND BR IF INADEQ   2-3 DP119030
                          BSI  L  ER014,-   *DISK AREA FOR PHASE 2  2-3 DP119040
                          BSI  L  CK500     BR TO CALCULATE CHECKSUM    DP119050
                          LD   L  BUFR1+1+@SCNT LOAD OLD CHECKSUM       DP119060
                          STO     CK913     SAVE OLD CHECKSUM           DP119070
                          BSC  I  CK600,+-  RETURN IF NOT CHECKSUM      DP119080
                          EOR     CK912     COMPARE WITH CALC CHECKSUM  DP119090
                          BSI  L  ER019,Z   BR IF INVALID CHECKSUM      DP119100
                          BSC  I  CK600     RETURN                      DP119110
                    *                                                   DP119120
                    *************************************************** DP119130
                    *                                                   DP119140
                    * HISTORIC COMPATABILITY.....                       DP119150
                    * COMPRESS OUT GAPS IN SLET TABLE AND ZERO NEW      DP119160
                    * THIRD SECTOR OF SLET.                             DP119170
                    *                                                   DP119180
                    CK630 DC      0         ENTRY/RETURN ADDRESS        DP119190
                    * 2 INSTRUCTIONS REMOVED 2-11                       DP119200
                          LDD     CK920     SET WORD COUNT AND SECTOR   DP119220
                          STD  L  BUFFR     *ADDR TO TWO SLET SECTORS   DP119230
                          BSI  L  FETCH     BR TO READ 1ST 2 SLET SCTRS DP119240
                    *                                                   DP119250
                          LDX  L1 BUFFR+2   PT TO 'TO' ADDRESS IN SLET  DP119260
                          LDX  L2 BUFFR+2   PT TO 'FROM' ADDR IN SLET   DP119270
                    CK640 LDD   2 0         FETCH 1ST 2 WDS OF SLET ENT DP119280
                          BSC  L  CK650,+-  BRANCH IF EMPTY ENTRY       DP119290
                          STD   1 0         SHIFT TO BOTTOM OF TABLE    DP119300
                          LDD   2 2         *(MAY OVERLAY ITSELF)       DP119310
                          STD   1 2                                     DP119320
                          MDX   1 4         ADVANCE TO   ADDR 1 ENTRY   DP119330
                    CK650 MDX   2 4         ADVANCE FROM ADDR 1 ENTRY   DP119340
                          MDX  L0 CK915,1   INCR ENTRY COUNTER          DP119350
                          MDX     CK640     LOOP UNTIL 2 SECTORS TESTED DP119360
                    *                                                   DP119370
                          STX   2 CK923     SAVE FROM ADDR              DP119380
                    CK660 STX   1 CK922     SAVE TO   ADDR              DP119390
                          LD      CK922     LOAD TO   ADDR              DP119400
                          S       CK923     SUB  FROM ADDR              DP119410
                          BSC  L  CK670,-   BR IF END OF SLET REACHED   DP119420
                          SLT     32        ZERO TAIL                   DP119430
                          STD   1 0         *OF SLET                    DP119440
                          STD   1 2         *TABLE                      DP119450
                          MDX   1 4         ADVANCE TO POINTER 1 ENTRY  DP119460
                          MDX     CK660     LOOP UNTIL END OF 2 SECTORS DP119470
                    *                                                   DP119480
                    CK670 BSI  L  WRITE     UPDATE SLET TABLE           DP119490
                    *10 INSTRUCTIONS REMOVED 2-11                       DP119500
                          BSC  I  CK630     RETURN                      DP119620
                          BSS     22        PATCH AREA.            2-11 DP119625
                    *                                                   DP119630
                    *************************************************** DP119640
                    *                                                   DP119650
                    * READ A SECTOR FROM DISK INTO 'BUFR1'              DP119660
                    *                                                   DP119670
                    FTCH1 DC      0         ENTRY/RETURN ADDRESS        DP119680
                          LDD     F1900     FETCH FUNC CODE, I/O ADDR   DP119690
                          BSI  L  DZ000     BRANCH TO READ A SECTOR     DP119700
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  DP119710
                          MDX     *-3       BR TO TEST READ COMPLETE    DP119720
                          BSC  I  FTCH1     RETURN                      DP119730
                    *                                                   DP119740
                    * CONSTANTS AND WORK AREAS                          DP119750
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   DP119760
                    F1900 DC      /0000     READ FUNCTION CODE          DP119770
                          DC      BUFR1     ADDRESS OF I/O AREA         DP119780
                    *                                                   DP119790
                    *************************************************** DP119800
                    *                                                   DP119810
                    * READ FROM DISK INTO BUFFR                         DP119820
                    *                                                   DP119830
                    FETCH DC      0         ENTRY/RETURN ADDRESS        DP119840
                          LD    3 AZ938-E   RETURN                      DP119850
                          BSC  I  FETCH,Z   *IF INHIBIT SWITCH ON       DP119860
                          LDD     FE900     FETCH FUNC CODE/I/O ADDRESS DP119870
                          BSI  L  DZ000     BRANCH TO DISK SUBROUTINE   DP119880
                          MDX  L  $DBSY,0   SKIP NEXT IF OP COMPLETE    DP119890
                          MDX     *-3       BRANCH TO TEST OP COMPLETE  DP119900
                          BSC  I  FETCH     RETURN                      DP119910
                    *                                                   DP119920
                    * CONSTANTS AND WORK AREAS                          DP119930
                    *                                                   DP119940
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   DP119950
                    FE900 DC      /0000     READ FUNCTION CODE          DP119960
                          DC      BUFFR     ADDRESS OF I/O BUFFER       DP119970
                    *                                                   DP119980
                    *************************************************** DP119990
                    *                                                   DP120000
                    * PROCESS MOD NUMBER ON PHASE ID RECORD             DP120010
                    *                                                   DP120020
                    MODNO DC      0         ENTRY/RETURN ADDRESS        DP120030
                          LD      MO900     IF VERSION AND MOD NUMBER   DP120040
                          BSC  I  MODNO,Z   *ALREADY SET, RETURN        DP120050
                          LD   L  AA904+66  FETCH COLUMN 67             DP120060
                          AND  L  AE901     MASK OUT ZONE PUNCHES AND   DP120070
                          STO  L  AE900+4   *STORE TO CONVERSION AREA   DP120080
                    MO100 LD   L  AA904+67  FETCH COLUMN 68             DP120090
                          AND  L  AE901     MASK OUT ZONE PUNCHES AND   DP120100
                          STO  L  AE900+5   *STORE TO CONVERSION AREA   DP120110
                          SRA     16        CLEAR                       DP120120
                          STO  L  AE900+3   *REMAINING POSITION         DP120130
                    *                                                   DP120140
                          BSI  L  DCBIN     BRANCH TO CONVERT TO BINARY DP120150
                          DC      AE900     ADDRESS OF INPUT AREA       DP120160
                    *                                                   DP120170
                    MO200 NOP               MAY BE AN 'MDX     M0300'   DP120180
                          SLA     8         SHIFT VERSION TO LEFT HALF  DP120190
                          STO  L  VERSN     *AND SAVE                   DP120200
                          S     3 AZ915-E   TEST FOR AND                DP120210
                          BSI  L  ER015,+Z  *BR IF VERSION INVALID      DP120220
                          MDX  L  MODNO+5,4 POINT TO COLUMN 71     2-10 DP120230
                          MDX  L  MO100+1,4 POINT TO COLUMN 72          DP120240
                          LD    3 AZ962-E   SET INSTRUCTION             DP120250
                          STO     MO200     *TO STORE MOD NUMBER        DP120260
                          MDX     MODNO+1   BRANCH TO FETCH MOD NUMBER  DP120270
                    *                                                   DP120280
                    MO300 OR   L  VERSN     'OR' IN VERSION NUMBER      DP120290
                          STO  L  VERSN     STORE VERSION-MOD NUMBER    DP120300
                          STX     MO900     INDICATE VERSION-MOD DONE   DP120310
                          BSC  I  MODNO     RETURN                      DP120320
                    *                                                   DP120330
                    * CONSTANTS AND WORK AREAS                          DP120340
                    *                                                   DP120350
                    MO900 DC      *-*       INDICATES VERSION NO. SET   DP120360
                    *                                                   DP120370
                    *************************************************** DP120380
                    *                                                   DP120390
                    * PACK AN 80 WD CARD IMAGE BUFFER TO 60 BINARY WDS  DP120400
                    *                                                   DP120410
                    PACK0 DC      0         ENTRY/RETURN ADDRESS        DP120420
                          STX  L3 PK200+1   SAVE XR3                    DP120430
                          LDX  L1 AA904     XR1 PTS TO 1ST UNPACKED WD  DP120440
                          LDX  L2 AA902     XR2 PTS TO 1ST PACKED WD    DP120450
                          LDX   3 20        XR3 = NUMBER OF LOOPS       DP120460
                    PK100 SLT     32        CLEAR  ACC AND  EXT         DP120470
                          LD    1 1               2220     0000         DP120480
                          RTE     12              0002     2200         DP120490
                          A     1 0               1112     2200         DP120500
                          STO   2 0         STORE WORD 1                DP120510
                          RTE     8               0011     1222         DP120520
                          LD    1 2               3330     1222         DP120530
                          RTE     8               2233     3012         DP120540
                          STO   2 1         STORE WORD 2                DP120550
                          RTE     12              0122     2333         DP120560
                          LD    1 3               4440     2333         DP120570
                          RTE     4               3444     0233         DP120580
                          STO   2 2         STORE WORD 3                DP120590
                          MDX   1 4         INCR UNPACKED ADDRESS       DP120600
                          MDX   2 3         INCR PACKED ADDRESS         DP120610
                          MDX   3 -1        DECR LOOP CNT, SKIP IF ZERO DP120620
                          MDX     PK100     BRANCH TO PACK NEXT 4 WORDS DP120630
                    PK200 LDX  L3 *-*       RESET XR3                   DP120640
                          BSC  I  PACK0                                 DP120650
                    *                                                   DP120660
                    *************************************************** DP120670
                    *                                                   DP120680
                    * DETERMINE RELATIVE ADDRESS FROM ADDRESS           DP120690
                    * OF FIRST WORD IN A SECTOR                         DP120700
                    *                                                   DP120710
                    RELAD DC      0         ENTRY/RETURN ADDRESS        DP120720
                    RE100 S     3 AZ901-E   SUBTRACT ONE FROM ADDRESS   DP120730
                          MDX  L  AZ934,1   INCR CORRELATION FACTOR     DP120740
                          BSC  L  RE100,Z   BR IF ADDR NOT REDUCED TO Z DP120750
                          LD    3 AZ934-E   FETCH AND SAVE              DP120760
                          STO   3 AZ945-E   *NEW CORRELATION FACTOR     DP120770
                          LD    3 AZ924-E   STORE SKIP INSTRUCTION      DP120780
                          STO  L  AJ040     *IN TYPE 'A' PROC SUBR      DP120790
                          LD    1 1         FETCH ORIGINAL ADDRESS      DP120800
                          A    L  AZ902     ADD TWO                     DP120810
                          BSC  I  RELAD     RETURN                      DP120820
                    *                                                   DP120830
                    *************************************************** DP120840
                    *                                                   DP120850
                    * SAVE INDEX REGISTERS                              DP120860
                    *                                                   DP120870
                    SAVXR DC      0         ENTRY/RETURN ADDRESS        DP120880
                          STX   1 RS100+1   SAVE XR1                    DP120890
                          STX   2 RS200+1   SAVE XR2                    DP120900
                          STX   3 RS300+1   SAVE XR3                    DP120910
                          BSC  I  SAVXR     RETURN                      DP120920
                    *                                                   DP120930
                    * RESTORE INDEX REGISTERS                           DP120940
                    *                                                   DP120950
                    RSTXR DC      0         ENTRY/RETURN ADDRESS        DP120960
                    RS100 LDX  L1 *-*       RESTORE XR1                 DP120970
                    RS200 LDX  L2 *-*       RESTORE XR2                 DP120980
                    RS300 LDX  L3 *-*       RESTORE XR3                 DP120990
                          BSC  I  RSTXR     RETURN                      DP121000
                    *                                                   DP121010
                    *************************************************** DP121020
                    *                                                   DP121030
                    * WRITE THE RESIDENT IMAGE AND                      DP121040
                    * THE SYSTEM LOADER PHASE 2 TO THE DISK             DP121050
                    *                                                   DP121060
                    WRITE DC      0         ENTRY/RETURN ADDRESS        DP121070
                          LD   L  BUFFR+1   RETURN IF                   DP121080
                          BSC  I  WRITE,+-  *SECTOR ADDRESS = @IDAD     DP121090
                          LD    3 AZ940-E   TEST FOR AND                DP121100
                          BSC  L  WR100,+Z  *BRANCH IF AN INITIAL LOAD  DP121110
                          LD   L  BUFFR+1   FETCH SECTOR ADDRESS        DP121120
                          S     3 AZ917-E   TEST FOR AND BRANCH         DP121130
                          BSC  L  WR100,Z   *IF NOT OVERLAY 0/1 SECTOR  DP121140
                          LD   L  BUFFR+2   FETCH OVERLAY IDENTIFIER    DP121150
                          S     3 AZ901-E   TEST FOR AND RETURN         DP121160
                          BSC  I  WRITE,+-  *IF OVERLAY 1               DP121170
                    *                                                   DP121180
                    * WRITE TO DISK FROM BUFFR                          DP121190
                    *                                                   DP121200
                    WR100 NOP               A WAIT MAY BE PATCHED HERE  DP121210
                          LDD     WR900     FETCH FUNC CODE/I/O ADDRESS DP121220
                          BSI  L  DZ000     BRANCH TO DISK SUBROUTINE   DP121230
                          MDX  L  $DBSY,0   SKIP NEXT IF OP COMPLETE    DP121240
                          MDX     *-3       BRANCH TO TEST OP COMPLETE  DP121250
                          BSC  I  WRITE     RETURN                      DP121260
                    *                                                   DP121270
                    * CONSTANTS AND WORK AREAS                          DP121280
                    *                                                   DP121290
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   DP121300
                    WR900 DC      /0001     WRITE FUNCTION CODE         DP121310
                          DC      BUFFR     ADDRESS OF I/O BUFFER       DP121320
                          HDNG    PRINT ERROR MESSAGES                  DP121330
                    *                                                   DP121340
                    * PRINT ERROR MESSAGE AND BRANCH TO READ            DP121350
                    * THE NEXT RECORD                                   DP121360
                    *                                                   DP121370
                    ER002 DC      0         ENTRY/RETURN ADDRESS        DP121380
                          LDX  L1 MSG02+1   POINT TO ERROR MESSAGE E 02 DP121390
                          LDX  I2 MSG02     FETCH WORD CNT OF MSG E 02  DP121400
                          MDX     ER100     BRANCH TO PRINT THE MESSAGE DP121410
                    *                                                   DP121420
                    ER003 DC      0         ENTRY/RETURN ADDRESS        DP121430
                          LDX  L1 MSG03+1   POINT TO ERROR MESSAGE E 03 DP121440
                          LDX  I2 MSG03     FETCH WORD CNT OF MSG E 03  DP121450
                          MDX     ER100     BRANCH TO PRINT THE MESSAGE DP121460
                    *                                                   DP121470
                    ER004 DC      0         ENTRY/RETURN ADDRESS        DP121480
                          LDX  L1 MSG04+1   POINT TO ERROR MESSAGE E 04 DP121490
                          LDX  I2 MSG04     FETCH WORD CNT OF MSG E 04  DP121500
                          MDX     ER100     BRANCH TO PRINT THE MESSAGE DP121510
                    *                                                   DP121520
                    ER015 DC      0         ENTRY/RETURN ADDRESS        DP121530
                          LDX  L1 MSG15+1   POINT TO ERROR MESSAGE E 15 DP121540
                          LDX  I2 MSG15     FETCH WORD CNT OF MSG E 15  DP121550
                          MDX     ER100     BRANCH TO PRINT THE MESSAGE DP121560
                    *                                                   DP121570
                    ER017 DC      0         ENTRY/RETURN ADDRESS        DP121580
                          LDX  L1 MSG17+1   POINT TO ERROR MESSAGE E 17 DP121590
                          LDX  I2 MSG17     FETCH WORD CNT OF MSG E 17  DP121600
                    ER100 BSI  L  CNPTR     PRINT THE MESSAGE           DP121610
                          NOP               A WAIT MAY BE PATCHED HERE  DP121620
                          BSC  L  AA040     BRANCH TO READ NEXT RECORD  DP121630
                    *                                                   DP121640
                    ER018 DC      0         ENTRY/RETURN ADDRESS        DP121650
                          LDX  L1 MSG18+1   POINT TO ERROR MESSAGE E 18 DP121660
                          LDX  I2 MSG18     FETCH WORD CNT OF MSG E 18  DP121670
                          BSI  L  CNPTR     PRINT THE MESSAGE           DP121680
                          BSC  I  ER018     RETURN                      DP121690
                    *                                                   DP121700
                    ER019 DC      0         ENTRY/RETURN ADDRESS        DP121710
                          LDX  L1 MSG19+1   POINT TO ERROR MESSAGE E 19 DP121720
                          LDX  I2 MSG19     FETCH WORD CNT OF MSG E 19  DP121730
                          BSI  L  CNPTR     PRINT THE MESSAGE           DP121740
                          BSC  I  ER019     RETURN                      DP121750
                    *                                                   DP121760
                    * ERROR MESSAGES FROM SYSTEM LOADER PHASE 1 ONLY    DP121770
                    *                                                   DP121780
                    MSG11 DC      MSG12-*   WORD COUNT OF MESSAGE E 11  DP121790
                          DMES    'RE 11 INVALID DRIVE NO.'R'E          DP121800
                    MSG12 DC      MSG13-*   WORD COUNT OF MESSAGE E 12  DP121810
                          DMES    'RE 12 ID SECTOR DATA INVALID'R'E     DP121820
                    MSG13 DC      MSG14-*   WORD COUNT OF MESSAGE E 13  DP121830
                          DMES    'RE 13 CONFIG DECK ERROR'R'E          DP121840
                    MSG14 DC      MSG15-*   WORD COUNT OF MESSAGE E 14  DP121850
                          DMES    'RE 14 FILE PROTECT ADDR TOO HIGH'R'E DP121860
                    MSG15 DC      MSG16-*   WORD COUNT OF MESSAGE E 15  DP121870
                          DMES    'RE 15 PHID RECORD ERROR'R'E          DP121880
                    MSG16 DC      MSG17-*   WORD COUNT OF MESSAGE E 16  DP121890
                          DMES    'RE 16 INITIAL LOAD THE CARTRIDGE'R'E DP121900
                    MSG17 DC      MSG18-*   WORD COUNT OF MESSAGE E 17  DP121910
                          DMES    'RE 17 ERROR IN LOAD MODE RECORD'R'E  DP121920
                    MSG18 DC      MSG19-*   WORD COUNT OF MESSAGE E 18  DP121930
                          DMES    'RE 18 PAPER TAPE ERROR'R'E           DP121940
                    MSG19 DC      MSG20-*   WORD COUNT OF MESSAGE E 19  DP121950
                          DMES    'RE 19 INVALID SLET/RELOAD TABLE '    DP121960
                          DMES    CHECKSUM'R'E                          DP121970
                    MSG20 DC      0         E 20 USED BY SYS LDR PH 2   DP121980
                    *                                                   DP121990
                    * PRINT ERROR MESSAGES WITH NO RECOVERY             DP122000
                    *                                                   DP122010
                    ER005 DC      0         ENTRY/RETURN ADDRESS        DP122020
                          LDX  L1 MSG05+1   POINT TO ERROR MESSAGE E 05 DP122030
                          LDX  I2 MSG05     FETCH WORD CNT OF MSG E 05  DP122040
                          MDX     ER200     BRANCH TO PRINT THE MESSAGE DP122050
                    *                                                   DP122060
                    ER012 DC      0         ENTRY/RETURN ADDRESS        DP122070
                          LDX  L1 MSG12+1   POINT TO ERROR MESSAGE E 12 DP122080
                          LDX  I2 MSG12     FETCH WORD CNT OF MSG E 12  DP122090
                          MDX     ER200     BRANCH TO PRINT THE MESSAGE DP122100
                    *                                                   DP122110
                    ER013 DC      0         ENTRY/RETURN ADDRESS        DP122120
                          LDX  L1 MSG13+1   POINT TO ERROR MESSAGE E 13 DP122130
                          LDX  I2 MSG13     FETCH WORD CNT OF MSG E 13  DP122140
                          MDX     ER200     BRANCH TO PRINT THE MESSAGE DP122150
                    *                                                   DP122160
                    ER014 DC      0         ENTRY/RETURN ADDRESS        DP122170
                          LDX  L1 MSG14+1   POINT TO ERROR MESSAGE E 14 DP122180
                          LDX  I2 MSG14     FETCH WORD CNT OF MSG E 14  DP122190
                          MDX     ER200     BRANCH TO PRINT THE MESSAGE DP122200
                    *                                                   DP122210
                    ER016 DC      0         ENTRY/RETURN ADDRESS        DP122220
                          LDX  L1 MSG16+1   POINT TO ERROR MESSAGE E 16 DP122230
                          LDX  I2 MSG16     FETCH WORD CNT OF MSG E 16  DP122240
                    ER200 STX   1 ER310+1   SAVE XR1                    DP122250
                          STX   2 ER320+1   SAVE XR2                    DP122260
                    ER300 BSI     CNPTR     PRINT THE MESSAGE           DP122270
                          NOP               A WAIT MAY BE PATCHED HERE  DP122280
                    ER310 LDX  L1 *-*       RESTORE XR1                 DP122290
                    ER320 LDX  L2 *-*       RESTORE XR2                 DP122300
                          MDX     ER300     NO RECOVERY, PRINT AGAIN    DP122310
                    *                                                   DP122320
                    * BRANCH TO CONSOLE PRINTER SUBROUTINE              DP122330
                    *                                                   DP122340
                    CNPTR DC      0         ENTRY/RETURN ADDRESS        DP122350
                          BSI  L  WRTYZ     BR TO CONSOLE PRINTER SUBR  DP122360
                          LD      CNPTR     FETCH RETURN ADDRESS        DP122370
                          SRT     16        *AND SHIFT TO EXTENSION     DP122380
                          LD    3 AZ913-E   FETCH DISPLAY CODE AND      DP122390
                          BSI  L  $PRET     *BRANCH TO PRE-OP TRAP      DP122400
                          BSC  I  CNPTR     RETURN                      DP122410
                          HDNG    PHASE 1 CONSTANTS AND WORK AREAS      DP122420
                    E     DC      0         FOR EMERGENCY USE ONLY      DP122430
                    AZ901 DC      1         CONSTANT ONE                DP122440
                    AZ902 DC      2         CONSTANT TWO                DP122450
                    AZ903 DC      3         CONSTANT THREE              DP122460
                    AZ904 DC      4         CONSTANT FOUR               DP122470
                    AZ905 DC      5         CONSTANT FIVE               DP122480
                    AZ910 DC      10        CONSTANT OF TEN        2-11 DP122490
                    AZ907 DC      7         CONSTANT SEVEN              DP122500
                    AZ908 DC      15        MAX SYS DEVICE ISS NUMBER   DP122510
                    AZ909 DC      20        MAXIMUM ISS NUMBER          DP122520
                    AZ911 DC      89        NO. OF SCTR IN 32K-4K       DP122530
                    AZ912 DC      @SCNT     NO. OF WORDS PER SECTOR     DP122540
                    AZ913 DC      -2        DISPLAY CODE                DP122550
                    AZ914 DC      /00FF     MASK OUT LEFT HALF OF WORD  DP122560
                    AZ915 DC      /0200     MASK TO TEST VALID VER/MOD  DP122570
                    AZ916 DC      @P2AD     SECTOR ADDRESS OF PHASE 2   DP122580
                    AZ917 DC      @P2AD+5   SECTOR ADDRESS OF OVERLAY   DP122590
                    AZ918 DC      /658      MAXIMUM DISK ADDRESS        DP122600
                    AZ919 DC      /0810     BINARY 'A'                  DP122610
                    AZ920 DC      /0AA0     MASK                        DP122620
                    AZ921 NOP               'NOP' INSTRUCTION           DP122630
                    AZ922 BSI  L  /7002     'BSI  L' INSTRUCTION        DP122640
                    AZ923 EQU     *-1       READ FUNCTION CODE          DP122650
                    AZ924 MDX     *+1       SKIP INSTRUCTION            DP122660
                    AZ925 MDX     *+2       SKIP INSTRUCTION            DP122670
                    AZ926 DC      /8000     MINUS SIGN MASK             DP122680
                    AZ927 DC      /8410     USE TO CK FOR 'SCON' RECORD DP122690
                    AZ928 S    L  /C000     'S    L' INSTRUCTION        DP122700
                    AZ929 EQU     *-1       PHASE ID PROCESSING INDR    DP122710
                    AZ931 DC      /FFFF     MASK TO COMPLEMENT          DP122720
                    AZ932 DC      *-*       BASE SECTOR ADDRESS         DP122730
                    AZ933 DC      *-*       NEXT RCRD EXPECTED INDR     DP122740
                    AZ934 DC      0         CORRELATION FACTOR          DP122750
                    AZ935 DC      *-*       SCTR ADDR OF CURRENT PHASE  DP122760
                    AZ937 DC      *-*       CORE ADDRESS OF DATA WORD   DP122770
                    AZ938 DC      *-*       'FETCH' INHIBIT INDICATOR   DP122780
                    AZ939 DC      *-*       'REQ' RECORD COUNT          DP122790
                    AZ940 DC      *-*       LOAD MODE INDICATOR         DP122800
                    AZ941 DC      *-*       PREVIOUS SECTOR ADDRESS     DP122810
                    AZ942 DC      *-*       RESIDENT IMAGE INDICATOR    DP122820
                    AZ943 DC      *-*       SCTR ADDR OF SCTR IN CORE   DP122830
                    AZ944 DC      *-*       ABS/REL PROGRAM INDICATOR   DP122840
                    AZ945 DC      *-*       CORE ADDRESS CORRELATION    DP122850
                    AZ948 DC      0         SECTOR BREAK INDICATOR      DP122860
                    AZ949 DC      1         NEXT RECORD TYPE INDICATOR  DP122870
                    AZ950 DC      1         'F' RECORD INDICATOR        DP122880
                    AZ952 DC      1         PACKED/UNPACKED BFR INDR    DP122890
                    AZ954 DC      BUFFR     ADDRESS OF DISK I/O BUFFER  DP122900
                    AZ955 DC      AA903     ADDRESS OF RECORD BUFFER    DP122910
                    AZ956 DC      RELAD     ADDRESS OF RLTV ADDR SUBR   DP122920
                    AZ957 DC      @DCOM     SECTOR ADDRESS OF DCOM      DP122930
                    AZ958 DC      PAIR1     ADDR OF FIRST PHASE ID PAIR DP122940
                    AZ959 DC      @IDAD     ID SECTOR ADDRESS           DP122950
                    AZ960 DC      @RIAD     RES IMAGE SECTOR ADDRESS    DP122960
                    AZ961 MDX  X  CK400-CK300-1  SKIP INSTRUCTION       DP122970
                    AZ962 MDX  X  MO300-MO200-1  SKIP INSTRUCTION       DP122980
                    *                                                   DP122990
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   DP123000
                    AZ964 DC      *-*       USED TO CALCULATE RELATIVE  DP123010
                          DC      *-*       *DATA WORD LOC IN SCTR BFR  DP123020
                    *                                                   DP123030
                    * RESTORED COMMA WORDS ON RELOAD FUNCTION           DP123040
                    *                                                   DP123050
                    AZ966 DC      *-*       $DREQ                       DP123060
                    AZ967 DC      *-*       $ULET                       DP123070
                    AZ968 DC      *-*       $DZIN                       DP123080
                    AZ969 DC      *-*       $FPAD                       DP123090
                    AZ970 DC      *-*       $DCYL                       DP123100
                    *                                                   DP123110
                    *                                                   DP123120
                          BSS     100       PATCH AREA                  DP123130
                    *                                                   DP123140
                    *                                                   DP123150
                          HDNG    BUFFER AREAS                          DP123160
                    *                                                   DP123170
                          BSS  E  0         START WD CNT ON EVEN LOC    DP123180
                    BUFFR DC      @SCNT     WORD COUNT                  DP123190
                          DC      *-*       SECTOR ADDRESS              DP123200
                    *                                                   DP123210
                    * TEMPORARY LOWER CORE TO BE                        DP123220
                    * OVER-LAYED BY RESIDENT IMAGE                      DP123230
                    *                                                   DP123240
                          DC      $I400                              0C DP123250
                          DC      $STOP                                 DP123260
                          BSS     5                                     DP123270
                          DC      *-*                                13 DP123280
                          BSS     20                                    DP123290
                          DC      *-*                                28 DP123300
                          WAIT                                          DP123310
                          BSC  I  $PRET                                 DP123320
                          DC      $IREQ+1                               DP123330
                          DC      *-*                                   DP123340
                          WAIT                                          DP123350
                          MDX     *-2                                   DP123360
                          BOSC I  $IREQ+1                               DP123370
                          DC      *-*                                32 DP123380
                          BSS     90                                    DP123390
                          DC      *-*                                8D DP123400
                          WAIT                                          DP123410
                          BSC  I  $PST4                                 DP123420
                          DC      *-*                                   DP123430
                          WAIT                                          DP123440
                          BOSC I  $STOP                                 DP123450
                          BSS     47                                    DP123460
                          DC      *-*                                C4 DP123470
                          STD     $I490                                 DP123480
                          STS     $I410                                 DP123490
                          STX   1 $I410+2                               DP123500
                          STX   2 $I410+4                               DP123510
                          XIO     $I492                                 DP123520
                          SLA     2                                     DP123530
                          BSC  L  $I403,-                               DP123540
                          BSI  I  $IREQ                                 DP123550
                          DC      -2                                    DP123560
                          LDX   1 9                                     DP123570
                          XIO     $I494                                 DP123580
                          SLCA  1 9                                     DP123590
                    $I405 BSI  I1 *-*                                   DP123600
                    $I410 LDS     0                                     DP123610
                          LDX  L1 *-*                                   DP123620
                          LDX  L2 *-*                                   DP123630
                          LDD     $I490                                 DP123640
                          BOSC I  $I400                                 DP123650
                    $I490 BSS  E  2                                     DP123660
                    $I492 BSS     1                                     DP123670
                          DC      /0F00                                 DP123680
                    $I494 BSS     1                                     DP123690
                          DC      /0300                              E3 DP123700
                    CONFG EQU     BUFFR+2*@SCNT-@PRWC+1                 DP123710
                          BSS     @PRWC                                 DP123720
                          ORG     BUFFR+2+2*@SCNT                       DP123730
                    BUFR1 BSS  E  1         WORD COUNT                  DP123740
                          BSS     1         SECTOR ADDRESS              DP123750
                          BSS     @SCNT     BUFFER FOR CHECKSUM CALC    DP123760
                          BSS     @MNCR-*   PATCH AREA                  DP123770
                          END     AA000                                 DP123780
