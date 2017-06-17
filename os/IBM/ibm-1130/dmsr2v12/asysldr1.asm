                          HDNG    P.T. INPUT SYSTEM LOADER - PHASE 1    AP100010
                    *************************************************** AP100020
                    *                                                 * AP100030
                    *STATUS - VERSION 2, MODIFICATION 9               * AP100040
                    *                                                 * AP100050
                    *FUNCTION/OPERATION-                              * AP100060
                    *   PHASE 1 WILL PERFORM THE FOLLWING DURING A    * AP100070
                    *   SYSTEM LOAD-                                  * AP100080
                    *   * READ AND PROCESS THE LOAD MODE RECORD.      * AP100090
                    *   * READ THE RESIDENT MONITOR, DISKZ AND THE    * AP100100
                    *     COLD START PROGRAM AND ROLL THE RESIDENT    * AP100110
                    *     MONITOR AND DISKZ TO THEIR PROPER CORE      * AP100120
                    *     LOCATIONS FOR USE.                          * AP100130
                    *   * CHECK THE CHECKSUM OF SLET AND THE RELOAD   * AP100140
                    *     TABLE FOR VALIDITY AND PACK SLET IF PREVIOUS* AP100150
                    *     CHECKSUM IS ZERO ON A RELOAD FUNCTION.      * AP100160
                    *   * WRITE THE COLD START PROGRAM AND RESIDENT   * AP100170
                    *     IMAGE TO DISK.                              * AP100180
                    *   * READ PHASE 2 AND WRITE IT TEMPORARILY TO    * AP100190
                    *     DISK.                                       * AP100200
                    *   * READ AND CONDENSE THE SYSTEM CONFIGURATION  * AP100210
                    *     RECORDS.                                    * AP100220
                    *   * READ AND PROCESS THE PHID RECORD(S).        * AP100230
                    *   * READ PHASE 2 INTO CORE AND BRANCH TO IT.    * AP100240
                    *                                                 * AP100250
                    *ENTRY POINT-                                     * AP100260
                    *   * ENTERED AT 'AA000' FROM THE CORE IMAGE      * AP100270
                    *     LOADER.                                     * AP100280
                    *                                                 * AP100290
                    *INPUT-                                           * AP100300
                    *   * LOAD MODE TAPE, SYSTEM CONFIGURATION TAPE,  * AP100310
                    *     AND PHID TAPE ARE IN PTTC/8.                * AP100320
                    *   * ALL OTHER INPUT TAPES ARE BINARY, ASSEMBLED * AP100330
                    *     IN RELOCATABLE-ABSOLUTE FORMAT.             * AP100340
                    *                                                 * AP100350
                    *OUTPUT-                                          * AP100360
                    *   * PARTIAL CARTRIDGE LOAD.                     * AP100370
                    *                                                 * AP100380
                    *EXTERNAL REFERENCES-                             * AP100390
                    *   NONE                                          * AP100400
                    *                                                 * AP100410
                    *EXIT-                                            * AP100420
                    *   * EXITS FROM 'LDPH2' TO ENTER PHASE 2 AT      * AP100430
                    *     'BA000' AFTER THE PHID RECORD IS READ       * AP100440
                    *     AND PROCESSED.                              * AP100450
                    *                                                 * AP100460
                    *TABLES/BUFFERS-                                  * AP100470
                    *   * CONFG- TABLE INTO WHICH DATA FROM SYSTEM    * AP100480
                    *     CONFIGURATION RECORDS IS ACCUMULATED        * AP100490
                    *   * AA908- 1 WORD BUFFER FOR DELETE CHAR TEST.  * AP100500
                    *   * AA904- 80 WORD INPUT BUFFER FOR PTTC/8 RCDS.* AP100510
                    *   * AA906- 108 WORD BUFFER FOR 108 FRAMES OF    * AP100520
                    *     BINARY PAPER TAPE DATA, LEFT JUSTIFIED.     * AP100530
                    *   * AA902- 60 WORD BUFFER INTO WHICH BINARY DATA* AP100540
                    *     FROM AA906 IS PACKED.                       * AP100550
                    *   * BUFFR- 320 (OR 640) WORD DISK I/O BUFFER.   * AP100560
                    *                                                 * AP100570
                    *ATTRIBUTES-                                      * AP100580
                    *   * N/A                                         * AP100590
                    *                                                 * AP100600
                    *NOTES-                                           * AP100610
                    *   * THIS PHASE MUST BE ASSEMBLED IN, OR CONVERT-* AP100620
                    *     ED TO, CORE IMAGE FORMAT FOR LOADING BY THE * AP100630
                    *     PAPER TAPE CORE IMAGE BOOTSTRAP LOADER.     * AP100640
                    *   * THE SYSTEM LOAD IS PERFORMED ON DRIVE WHOSE * AP100650
                    *     PHYSICAL NUMBER IS SET IN BIT SWITCHES 12-15* AP100660
                    *                                                 * AP100670
                    *************************************************** AP100680
                          HDNG    CARD INPUT SYSTEM LOADER - PHASE 1    AP100690
                          ABS                                           AP100700
                    *                                                   AP100710
                    * COMMA EQUATES                                     AP100720
                    *                                                   AP100730
                    $ACDE EQU     /9F  TABLE OF AREA CODES              AP100740
                    $CH12 EQU     /06  CHANNEL 12 INDICATOR             AP100750
                    $CILA EQU     /5A  ADDRESS OF END OF DISK SUBR      AP100760
                    $COMN EQU     /07  LENGTH OF COMMON (IN WORDS)      AP100770
                    $CORE EQU     /0E  SIZE OF CORE                     AP100780
                    $CPTR EQU     /7E  CNSL PTR CHANNEL 12 INDICATOR    AP100790
                    $CTSW EQU     /0F  CONTROL RECORD TRAP SWITCH       AP100800
                    $CIBA EQU     /05  SCTR ADDR OF CIB                 AP100810
                    $CYLN EQU     /9A  ARM POSITION                     AP100820
                    $DBSY EQU     /EE  NON-ZERO WHEN DISKZ BUSY         AP100830
                    $DADR EQU     /10  BLK ADDR OF PROG TO BE LOADED    AP100840
                    $DCDE EQU     /77  DRIVE CODE OF PROG IN WRK STG    AP100850
                    $DCYL EQU     /A4  TABLE OF DEFECTIVE CYLINDERS     AP100860
                    $DREQ EQU     /12  IND. FOR REQUESTED VERSION DKI/O AP100870
                    $DUMP EQU     /3F  CALL DUMP ENTRY POINT            AP100880
                    $DZIN EQU     /76  DISK SUBROUTINE IN CORE INDR     AP100890
                    $EXIT EQU     /38  CALL EXIT ENTRY POINT            AP100900
                    $FLSH EQU     /71  FLUSH JOB SWITCH                 AP100910
                    $FPAD EQU     /95  TABLE OF FILE PROTECT ADDRESSES  AP100920
                    $HASH EQU     /14  WORK AREA                        AP100930
                    $IBSY EQU     /13  NON-ZERO IF CD/PAP TP DEV. BUSY  AP100940
                    $IBT2 EQU     /B9  LEVEL 2 INTRPT BRANCH TABLE ADDR AP100950
                    $IBT4 EQU     /D4  ADDR OF THE IBT, LEVEL 4         AP100960
                    $IOCT EQU     /32  ZERO IF NO I/O IN PROGRESS       AP100970
                    $IREQ EQU     /2C  ADDR OF INT REQUEST SUBROUTINE   AP100980
                    $I200 EQU     /B3  ILS02 ENTRY POINT                AP100990
                    $I205 EQU     /B8  ILS02 INTERRUPT ENTRY POINT      AP101000
                    $I400 EQU     /C4  ILS04 ENTRY POINT                AP101010
                    $I403 EQU     /D0                                   AP101020
                    $KCSW EQU     /7C  1 IF KB,CP BOTH UTILIZED         AP101030
                    $LAST EQU     /33  LAST CARD INDICATOR              AP101040
                    $LEV0 EQU     /08  LEVEL 0 BRANCH ADDRESS           AP101050
                    $LEV1 EQU     /09  LEVEL 1 BRANCH ADDRESS           AP101060
                    $LEV2 EQU     /0A  LEVEL 2 BRANCH ADDRESS           AP101070
                    $LEV3 EQU     /0B  LEVEL 3 BRANCH ADDRESS           AP101080
                    $LEV4 EQU     /0C  LEVEL 4 BRANCH ADDRESS           AP101090
                    $LEV5 EQU     /0D  LEVEL 5 BRANCH ADDRESS           AP101100
                    $LINK EQU     /39  CALL LINK ENTRY POINT            AP101110
                    $NDUP EQU     /34  DO NOT DUP IF NON-ZERO           AP101120
                    $NXEQ EQU     /35  DO NOT EXECUTE IF NON-ZERO       AP101130
                    $PBSY EQU     /36  NON-ZERO WHEN PRINTER BUSY       AP101140
                    $PGCT EQU     /37  PAGE NO. FOR HEADINGS            AP101150
                    $PHSE EQU     /78  NO. OF PHASE NOW IN CORE         AP101160
                    $PRET EQU     /28  IOCS SOFT ERROR TRAP             AP101170
                    $PST1 EQU     /81  TRAP FOR I/O ERRORS, LEVEL 1     AP101180
                    $PST2 EQU     /85  TRAP FOR I/O ERRORS, LEVEL 2     AP101190
                    $PST3 EQU     /89  TRAP FOR I/O ERRORS, LEVEL 3     AP101200
                    $PST4 EQU     /8D  TRAP FOR I/O ERRORS, LEVEL 4     AP101210
                    $SNLT EQU     /EF  SENSE LIGHT INDICATOR            AP101220
                    $STOP EQU     /91  PROGRAM STOP KEY TRAP            AP101230
                    $SYSC EQU     /E0  MODIFICATION LEVEL               AP101240
                    $UFDR EQU     /7D  DRIVE CODE OF UNFORMATTED I/O    AP101250
                    $UFIO EQU     /79  UNFORMATTED I/O RECORD NO.       AP101260
                    $ULET EQU     /2D  TABLE OF LET ADDRESSES           AP101270
                    $WSDR EQU     /7A  WORKING STORAGE DRIVE CODE       AP101280
                    $WRD1 EQU     /7B  ADDR OF 1ST WD OF CORE LOAD      AP101290
                    $ZEND EQU     /1E0 END OF DISKZ                     AP101300
                    $1132 EQU     /7F  1132 PRINTER CHANNEL 12 INDR     AP101310
                    $1403 EQU     /80  1403 PRINTER CHANNEL 12 INDR     AP101320
                    *                                                   AP101330
                    * DCOM RELATIVE EQUATES                             AP101340
                    *                                                   AP101350
                    #SYSC EQU     08        SYS/NON-SYS CARTRIDGE INDR  AP101360
                    #FPAD EQU     45        FILE PROTECT ADDRESS        AP101370
                    #CIDN EQU     55        CARTRIDGE ID                AP101380
                    #CIBA EQU     60        SECTOR ADDRESS OF CIB       AP101390
                    #SCRA EQU     65        SECTOR ADDRESS OF SCRA      AP101400
                    #FLET EQU     75        FLET SECTOR ADDRESS         AP101410
                    #ULET EQU     80        LET SECTOR ADDRESS          AP101420
                    #CSHN EQU     90        SECTOR COUNT OF CUSHION     AP101430
                    *                                                   AP101440
                    * ABSOLUTE EQUATES                                  AP101450
                    *                                                   AP101460
                    @IDAD EQU     /0000     CART ID, COLD START SAD     AP101470
                    @DCOM EQU     /0001     DCOM SECTOR ADDRESS         AP101480
                    @RIAD EQU     /0002     RESIDENT IMAGE SECTOR ADDR  AP101490
                    @SLET EQU     /0003     FIRST SLET SECTOR ADDRESS   AP101500
                    @RLTB EQU     /0006     RELOAD TABLE SECTOR ADDRESS AP101510
                    @HDNG EQU     /0007     PAGE HEADING SECTOR ADDRESS AP101520
                    @P2AD EQU     /0630     SYS LDR - PHASE 2 SCTR ADDR AP101530
                    @MSCT EQU     /0658     MAXIMUM SECTOR ADDRESS - 1  AP101540
                    @COLD EQU     /0030     RLTV ADDR 1ST WD COLD START AP101550
                    @CSTR EQU     /00D0                                 AP101560
                    DZ000 EQU     /00F2     DISKZ ENTRY POINT           AP101570
                    @WDCT EQU     0         RLTV ADDR WORD COUNT IN BFR AP101580
                    @SADR EQU     1         RLTV ADDR SCTR ADDR IN BFR  AP101590
                    @NDCY EQU     3         MAX NO. OF DEF CYLINDERS    AP101600
                    @MXDR EQU     5         MAX NO. OF DISK DRIVES      AP101610
                    @CIDN EQU     3         RLTV ADDR OF CARTRIDGE ID   AP101620
                    @STAT EQU     7         RLTV ADDR CART STATUS WORD  AP101630
                    @PRWC EQU     60        PRINTER BUFFER LENGTH       AP101640
                    @CCOL EQU     80        NUMBER OF COLUMNS PER CARD  AP101650
                    @SCNT EQU     320       NUMBER OF WORDS PER SECTOR  AP101660
                    @MNCR EQU     4096      MINIMUM ALLOWABLE CORE SIZE AP101670
                    *                                                   AP101680
                    * SYSTEM DEVICE SUBROUTINE PHASE IDS                AP101690
                    *                                                   AP101700
                    P1403 EQU     140       PHASE ID OF SYS 1403 SUBR   AP101710
                    P1132 EQU     141       PHASE ID OF SYS 1132 SUBR   AP101720
                    PCPAD EQU     142       PHASE ID OF SYS C. P. SUBR  AP101730
                    I2501 EQU     143       PHASE ID OF SYS 2501 SUBR   AP101740
                    I1442 EQU     144       PHASE ID OF SYS 1442 SUBR   AP101750
                    @1134 EQU     145       PHASE ID OF SYS PAPT SUBR   AP101760
                    IKBRD EQU     146       PHASE ID OF SYS KEYBRD SUBR AP101770
                    CDCNV EQU     147       PH ID OF SYS 2501/1442 CONV AP101780
                    C1134 EQU     148       PHASE ID OF SYS 1134 CONV   AP101790
                    CKBRD EQU     149       PHASE ID OF SYS KEYBRD CONV AP101800
                    DISKZ EQU     150       PHASE ID OF DISKZ SUBR      AP101810
                    DISK1 EQU     151       PHASE ID OF DISK1 SUBR      AP101820
                    DISKN EQU     152       PHASE ID OF DISKN SUBR      AP101830
                    PRINT EQU     153       PH ID OF PRINC PRINT SUBR   AP101840
                    PINPT EQU     154       PH ID OF PRINC INPUT SUBR   AP101850
                    PIDEV EQU     155       PRINC INPUT EXCLUDING KEYBD AP101860
                    CNVRT EQU     156       PRINC SYS CONVERSION SUBR   AP101870
                    CVRT  EQU     157       PRINC CONV EXCLUDING KEYBRD AP101880
                    *                                                   AP101890
                    * DEVICE CODES                                      AP101900
                    *                                                   AP101910
                    @I510 EQU     /2000     AREA CODE FOR DISK DRIVE 0  AP101920
                    @I511 EQU     /8800     AREA CODE FOR DISK DRIVE 1  AP101930
                    @I512 EQU     /9000     AREA CODE FOR DISK DRIVE 2  AP101940
                    @I513 EQU     /9800     AREA CODE FOR DISK DRIVE 3  AP101950
                    @I514 EQU     /A000     AREA CODE FOR DISK DRIVE 4  AP101960
                    @I208 EQU     /0900     CNSL PTR PRINT IOCC         AP101970
                    @I206 EQU     /0F01     CNSL PTR SENSE DSW W/RESET  AP101980
                    @D100 EQU     /1000     1442 NOT READY DISPLAY CODE AP101990
                    @I102 EQU     /1100     1442 PUNCH A COLUMN IOCC    AP102000
                    @I103 EQU     /1200     1442 READ A COLUMN IOCC     AP102010
                    @I104 EQU     /1401     1442 START PUNCH IOCC       AP102020
                    @I105 EQU     /1402     1442 FEED A CARD IOCC       AP102030
                    @I106 EQU     /1404     1442 START READER IOCC      AP102040
                    @I108 EQU     /1701     1442 SEN DSW W/RESET HI PRI AP102050
                    @I109 EQU     /1702     1442 SEN DSW W/RESET LO PRI AP102060
                    @D200 EQU     /2000     CNSL PTR NOT READY DISPLAY  AP102070
                    @I000 EQU     /3A00     READ DATA SWITCHES IOCC     AP102080
                    @I402 EQU     /4E00     2501 INITIATE READ IOCC     AP102090
                    @I404 EQU     /4F01     2501 SENSE DSW WITH RESET   AP102100
                          HDNG    FETCH AND BRANCH TO PHASE 2           AP102110
                          ORG     $ZEND     BEGIN AT END OF DISKZ       AP102120
                    *                                                   AP102130
                    *                                                   AP102140
                    LDPH2 LDD     LD900     FETCH AND STORE             AP102150
                          STD  L  PHAS2     *WORD COUNT AND SCTR ADDR   AP102160
                          LDD     LD902     FETCH FUNC CODE, I/O ADDR   AP102170
                          BSI  L  DZ000     BRANCH TO DISK READ         AP102180
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  AP102190
                          MDX     *-3       BR TO TEST READ COMPLETE    AP102200
                          BSC  L  PHAS2+2   BRANCH TO PHASE 2           AP102210
                    *                                                   AP102220
                    * CONSTANTS AND WORK AREAS                          AP102230
                    *                                                   AP102240
                          BSS  E  0                                     AP102250
                    LD900 DC      @MNCR-PHAS2-2  WORD COUNT OF PHASE 2  AP102260
                          DC      @P2AD          SCTR ADDR OF PHASE 2   AP102270
                    LD902 DC      /0000     READ FUNCTION CODE          AP102280
                          DC      PHAS2     PHASE 2 I/O AREA            AP102290
                          HDNG    SYSTEM LOADER COMMUNICATIONS AREA     AP102300
                    CILWC DC      *-*       CORE IMAGE LOADER WORD CNT  AP102310
                          DC      *-*       CORE IMAGE LOADER SCTR ADDR AP102320
                    DCYL1 DC      /0658     SCTR ADDR OF 1ST DEF CYLIN  AP102330
                    DCYL2 DC      /0658     SCTR ADDR OF 2ND DEF CYLIN  AP102340
                    DCYL3 DC      /0658     SCTR ADDR OF 3RD DEF CYLIN  AP102350
                    LMODE DC      *-*       LOAD MODE IMAGE             AP102360
                    CAREA DC      *-*       NO. SECTORS OF CUSHION AREA AP102370
                    T1442 DC      *-*       SET 1 IF 1442-6 OR 7 AVAIL  AP102380
                    DINDR DC      *-*       ISS DEVICE INDICATOR        AP102390
                    VERSN DC      *-*       VERSION AND MODIFICATION NO AP102400
                    CIBFR DC      *-*       SCTR ADDR OF CORE IMAGE BFR AP102410
                    SCORE DC      *-*       CORE SIZE                   AP102420
                    MAXPH DC      *-*       MAXIMUM PHASE ID            AP102430
                    ASCRA DC      *-*       SECTOR ADDRESS OF SCRA      AP102440
                    CARID DC      *-*       ID OF CARTRIDGE             AP102450
                    FLETI DC      *-*       FIXED AREA INDICATOR        AP102460
                    FPADR DC      *-*       FILE PROTECT ADDRESS        AP102470
                    SSBFR DC      *-*       NO. OF SCTRS FOR SLET BFR   AP102480
                    LET00 DC      *-*       PRE-LOAD LET SECTOR ADDRESS AP102490
                    SHIFT DC      *-*       NO. OF SCTRS TO SHIFT       AP102500
                    *                                                   AP102510
                          BSS     2         COMMUNICATIONS PATCH AREA   AP102520
                    *                                                   AP102530
                          BSS  E  0         FORCE EVEN ADDRESS          AP102540
                    PTRID DC      *-*       PH ID OF PRINC PRINT SUBR   AP102550
                    CHN12 DC      *-*       ADDRESS OF CHANNEL 12 INDR  AP102560
                    RDRID DC      *-*       PH ID OF PRINC I/O SUBR     AP102570
                    CNVID DC      *-*       PH ID OF PRINC CONV SUBR    AP102580
                    PRNRD DC      *-*       PRINCIPLE I/O DEVICE INDR   AP102590
                    PRNPR DC      *-*       PRINCIPLE PRINT DEVICE INDR AP102600
                    *                                                   AP102610
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   AP102620
                    PAIR1 DC      *-*       LOWER PHASE ID RANGE     E  AP102630
                          DC      *-*       UPPER PHASE ID RANGE     O  AP102640
                    PAIR2 DC      *-*       LOWER PHASE ID RANGE     E  AP102650
                          DC      *-*       UPPER PHASE ID RANGE     O  AP102660
                    PAIR3 DC      *-*       LOWER PHASE ID RANGE     E  AP102670
                          DC      *-*       UPPER PHASE ID RANGE     O  AP102680
                    PAIR4 DC      *-*       LOWER PHASE ID RANGE     E  AP102690
                          DC      *-*       UPPER PHASE ID RANGE     O  AP102700
                    PAIR5 DC      *-*       LOWER PHASE ID RANGE     E  AP102710
                          DC      *-*       UPPER PHASE ID RANGE     O  AP102720
                    PAIR6 DC      *-*       LOWER PHASE ID RANGE     E  AP102730
                          DC      *-*       UPPER PHASE ID RANGE     O  AP102740
                    PAIR7 DC      *-*       LOWER PHASE ID RANGE     E  AP102750
                          DC      *-*       UPPER PHASE ID RANGE     O  AP102760
                    PAIR8 DC      *-*       LOWER PHASE ID RANGE     E  AP102770
                          DC      *-*       UPPER PHASE ID RANGE     O  AP102780
                    PAIR9 DC      *-*       LOWER PHASE ID RANGE     E  AP102790
                          DC      *-*       UPPER PHASE ID RANGE     O  AP102800
                    PAIRA DC      *-*       LOWER PHASE ID RANGE     E  AP102810
                          DC      *-*       UPPER PHASE ID RANGE     O  AP102820
                    PAIRB DC      *-*       LOWER PHASE ID RANGE     E  AP102830
                          DC      *-*       UPPER PHASE ID RANGE     O  AP102840
                    PAIRC DC      *-*       LOWER PHASE ID RANGE     E  AP102850
                          DC      *-*       UPPER PHASE ID RANGE     O  AP102860
                    PAIRD DC      *-*       LOWER PHASE ID RANGE     E  AP102870
                          DC      *-*       UPPER PHASE ID RANGE     O  AP102880
                    PAIRE DC      *-*       LOWER PHASE ID RANGE     E  AP102890
                          DC      *-*       UPPER PHASE ID RANGE     O  AP102900
                    PAIRF DC      0         ZERO INDIC END OF PAIRS  E  AP102910
                    LPHID DC      *-*       LAST PH ID FOR INITIAL LOAD AP102920
                    *                                                   AP102930
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   AP102940
                    LOLIM DC      /0333     LOWER PHASE ID BYPASS LIMIT AP102950
                    UPLIM DC      /0999     UPPER PHASE ID BYPASS LIMIT AP102960
                          DC      *-*                                   AP102970
                          DC      *-*                                   AP102980
                          DC      *-*                                   AP102990
                          DC      *-*                                   AP103000
                          DC      *-*                                   AP103010
                          DC      *-*                                   AP103020
                          DC      *-*                                   AP103030
                          DC      *-*                                   AP103040
                          DC      *-*                                   AP103050
                    *                                                   AP103060
                    * ERROR MESSAGES                                    AP103070
                    *                                                   AP103080
                    MSG01 DC      MSG02-*   WORD COUNT OF MESSAGE E 01  AP103090
                          DMES    'RE 01 CHECKSUM ERROR'R'E             AP103100
                    *                                                   AP103110
                    MSG02 DC      MSG03-*   WORD COUNT OF MESSAGE E 02  AP103120
                          DMES    'RE 02 INVALID RECORD OR BLANK'R'E    AP103130
                    *                                                   AP103140
                    MSG03 DC      MSG04-*   WORD COUNT OF MESSAGE E 03  AP103150
                          DMES    'RE 03 SEQ ERROR OR MISSING RECORDS'R AP103160
                    *                                                   AP103170
                    MSG04 DC      MSG05-*   WORD COUNT OF MESSAGE E 04  AP103180
                          DMES    'RE 04 ORG BACKWARD'R'E               AP103190
                    *                                                   AP103200
                    MSG05 DC      INTPT-*   WORD COUNT OF MESSAGE E 05  AP103210
                          DMES    'RE 05 INITIALIZE THE CARTRIDGE'R'E   AP103220
                    *                                                   AP103230
                    * INHIBIT INTERRUPT REQUEST                         AP103240
                    *                                                   AP103250
                    INTPT DC      0         ENTRY                       AP103260
                          XIO     IN901-1   SENSE INTRPT DSW WITH RESET AP103270
                          BSC  L  $I403+5   BRANCH TO ILS04 SUBROUTINE  AP103280
                    *                                                   AP103290
                    * CONSTANTS AND WORK AREAS                          AP103300
                    *                                                   AP103310
                          BSS  E  1         FORCE NEXT LOC TO BE ODD    AP103320
                    IN901 DC      /0F01     SEN INTRPT DSW W/RESET IOCC AP103330
                          DC      0         AVAILABLE                   AP103340
                          HDNG    CONSOLE PRINTER SUBROUTINE - WRTYZ    AP103350
                    *                                                   AP103360
                    * PROGRAM ENTRY                                     AP103370
                    *                                                   AP103380
                    WRTYZ DC      0         ENTRY/RETURN ADDRESS        AP103390
                          MDX     TZ200     BRANCH TO START             AP103400
                    *                                                   AP103410
                    * INTERRUPT ENTRY -  ILS04 BRANCHES TO 'TZ100'      AP103420
                    * WHEN AN INTERRUPT OCCURS.  THIS SECTION           AP103430
                    * PROCESSES INTERRUPTS AND RETURNS TO THE POINT     AP103440
                    * FROM WHICH THE INTERRUPT OCCURED THROUGH          AP103450
                    * THE ILS04 SUBROUTINE                              AP103460
                    *                                                   AP103470
                    TZ100 DC      0         INTERRUPT ENTRY             AP103480
                          XIO     TZ900     SENSE DSW WITH RESET        AP103490
                          STX     TZ906     SET FLAG TO INDICATE INTRPT AP103500
                          BSC  I  TZ100     RETURN TO ILS04             AP103510
                    *                                                   AP103520
                    * 'WRTYZ' MAINLINE SECTION                          AP103530
                    * INITIALIZE SUBROUTINE                             AP103540
                    *                                                   AP103550
                    TZ200 STX   2 TZ907     SAVE I/O BUFFER WORD COUNT  AP103560
                          SRA     16        SET INDICATOR TO PRINT      AP103570
                          STO     TZ905     *FROM LEFT HALF OF WORD     AP103580
                          BSI     TZ400     BR TO TEST IF DEVICE READY  AP103590
                    *                                                   AP103600
                    * MAIN LOOP                                         AP103610
                    * DETERMINE WHICH HALF OF WORD FROM WHICH TO        AP103620
                    * FETCH CHARACTER, SAVE CHARACTER TO BE             AP103630
                    * PRINTED AND UPDATE LEFT-RIGHT INDICATOR           AP103640
                    *                                                   AP103650
                    TZ300 LD      TZ905     FETCH LEFT-RIGHT INDICATOR  AP103660
                          BSC  L  TZ310,Z   BRANCH TO FETCH RIGHT HALF  AP103670
                          STX     TZ905     SET INDR FOR RIGHT HALF     AP103680
                          LD    1 0         FETCH A WORD FROM I/O BFR   AP103690
                          MDX     TZ320                                 AP103700
                    TZ310 SRA     16        SET INDICATOR               AP103710
                          STO     TZ905     *FOR LEFT HALF NEXT         AP103720
                          LD    1 0         FETCH A WORD FROM I/O BFR   AP103730
                          SLT     8         SHIFT TO LEFT HALF          AP103740
                    TZ320 AND     TZ904     MASK OUT RIGHT HALF OF WORD AP103750
                    *                                                   AP103760
                    * PRINT THE CHARACTER                               AP103770
                    *                                                   AP103780
                          STO     TZ908     STORE IN OUTPUT BUFFER WORD AP103790
                          XIO     TZ902     PRINT CHARACTER             AP103800
                    *                                                   AP103810
                    * WAIT FOR INTERRUPT TO OCCUR                       AP103820
                    *                                                   AP103830
                    TZ340 LD      TZ906     FETCH INTERRUPT INDICATOR   AP103840
                          BSC  L  TZ340,+-  BRANCH IF INDR = 0          AP103850
                          SLA     16        CLEAR INDICATOR FOR         AP103860
                          STO     TZ906     *NEXT INTERRUPT             AP103870
                    *                                                   AP103880
                    * TEST FOR FORMS CHECK                              AP103890
                    *                                                   AP103900
                          BSI     TZ400     BR TO TEST IF DEVICE READY  AP103910
                          MDX  L  TZ905,0   SKIP IF LEFT HALF NEXT      AP103920
                          MDX     TZ300     BRANCH TO FETCH NEXT CHAR   AP103930
                          MDX   1 1         INCREMENT I/O BUFFER ADDR   AP103940
                          MDX   2 -1        DECR WORD CNT, SKIP IF ZERO AP103950
                          MDX     TZ300     BRANCH TO FETCH NEXT CHAR   AP103960
                          BSC  I  WRTYZ     RETURN                      AP103970
                    *                                                   AP103980
                    * CONSTANTS AND WORK AREAS                          AP103990
                    *                                                   AP104000
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   AP104010
                    TZ900 DC      @D200     ERROR INDICATOR             AP104020
                          DC      @I206     SENSE DSW WITH RESET IOCC   AP104030
                    TZ902 DC      TZ908     ADDRESS OF CHARACTER BUFFER AP104040
                          DC      @I208     PRINT IOCC                  AP104050
                    TZ904 DC      /FF00     MASK OUT RIGHT HALF OF WORD AP104060
                    TZ905 DC      *-*       LEFT-RIGHT CHARACTER INDR   AP104070
                    TZ906 DC      *-*       INTERRUPT WAIT INDICATOR    AP104080
                    TZ907 DC      *-*       I/O BUFFER WORD COUNT       AP104090
                    TZ908 DC      *-*       CHARACTER PRINT BUFFER      AP104100
                    TZ909 EQU     TZ900     ADDRESS OF ERROR INDICATOR  AP104110
                    *                                                   AP104120
                    * CHECK FOR CONSOLE PRINTER READY                   AP104130
                    * IF CONSOLE PRINTER                                AP104140
                    * NOT READY                                         AP104150
                    * FETCH ERROR CODE TO ACCUMULATOR AND               AP104160
                    * BRANCH TO SYSTEM PRE OPERATIVE ERROR TRAP         AP104170
                    *                                                   AP104180
                    TZ400 DC      0         ENTRY POINT                 AP104190
                          XIO     TZ900     SENSE DSW WITH RESET        AP104200
                          SLA     5         SHIFT DEV BUSY BIT TO SIGN  AP104210
                          BSC  I  TZ400,-   RETURN IF NOT BUSY          AP104220
                          LD      TZ909     FETCH ERROR INDICATOR       AP104230
                          BSI  L  $PRET     BR TO PRE-OP ERROR TRAP     AP104240
                          MDX     TZ400+1   BRANCH TO TEST BUSY AGAIN   AP104250
                          HDNG    SYSTEM 1134/1055 SUBROUTINE           AP104260
                    *************************************************** AP104270
                    *                                                 * AP104280
                    *STATUS- VERSION 2, MODIFICATION LEVEL 2          * AP104290
                    *                                                 * AP104300
                    *FUNCTION/OPERATION-                              * AP104310
                    *     *READ WITHOUT CONVERSION   (EBCDIC)         * AP104320
                    *     *READ WITH CONVERSION   (PTTC/8)            * AP104330
                    *     *PUNCH   (EBCDIC)                           * AP104340
                    *                                                 * AP104350
                    *ENTRY POINTS-                                    * AP104360
                    *     *PI000+1 IS THE USER ENTRY.                 * AP104370
                    *     *PT010+1 IS THE INTERRUPT ENTRY.            * AP104380
                    *                                                 * AP104390
                    *INPUT-                                           * AP104400
                    *     *READ WITHOUT CONVERSION                    * AP104410
                    *      ACC = 7000                                 * AP104420
                    *      EXT = ADDRESS OF I/O AREA                  * AP104430
                    *     *READ WITH CONVERSION                       * AP104440
                    *      ACC = 7002                                 * AP104450
                    *      EXT = ADDRESS OF I/O AREA                  * AP104460
                    *     *PUNCH                                      * AP104470
                    *      ACC = 7001                                 * AP104480
                    *      EXT = ADDRESS OF I/O AREA                  * AP104490
                    *     **THE I/O AREA CONSISTS OF ONE WORD OF WORD * AP104500
                    *       COUNT FOLLOW BY THAT NUMBER OF WORDS OF   * AP104510
                    *       PACKED EBCDIC.                            * AP104520
                    *                                                 * AP104530
                    *OUTPUT-                                          * AP104540
                    *     *I/O AREA IN UNPACKED EBCDIC.               * AP104550
                    *     *PUNCHED EBCDIC TAPE.                       * AP104560
                    *                                                 * AP104570
                    *EXTERNAL REFERENCES-                             * AP104580
                    *     $CTSW                                       * AP104590
                    *     $IBSY                                       * AP104600
                    *     $IOCT                                   2-2 * AP104610
                    *     $PRET                                       * AP104620
                    *     $PST4                                       * AP104630
                    *                                                 * AP104640
                    *EXITS- NORMAL                                    * AP104650
                    *     *SUBROUTINE RETURNS TO USER AFTER FUNCTION  * AP104660
                    *      HAS BEEN INITIATED.                        * AP104670
                    *     *SUBROUTINE RETURNS TO INTERRUPT LEVEL      * AP104680
                    *      SUBROUTINE AFTER A INTERRUPT HAS BEEN      * AP104690
                    *      SERVICED.                                  * AP104700
                    *                                                 * AP104710
                    *EXITS- ERROR                                     * AP104720
                    *     *$PRET WITH 3000 IN THE ACCUMULATOR WHEN    * AP104730
                    *      DEVICE NOT READY.                          * AP104740
                    *                                                 * AP104750
                    *TABLES/WORK AREAS-                               * AP104760
                    *     PT780 IS A 119 WORD TABLE OF PTTC/8 TO      * AP104770
                    *     EBCDIC CONVERSION WITH PTTC/8 IN BITS 0-7   * AP104780
                    *     AND EBCDIC IN BITS 8-16.                    * AP104790
                    *                                                 * AP104800
                    *ATTRIBUTES-                                      * AP104810
                    *     *NATURALLY RELOCATABLE.                     * AP104820
                    *     *REUSABLE.                                  * AP104830
                    *************************************************** AP104840
                          HDNG    SYSTEM 1134/1055 SUBROUTINE           AP104850
                          DC      PT790-*-1  WORD CNT OF SYS 1134 SUBR  AP104860
                          DC      @1134      PHASE ID OF SYS 1134 SUBR  AP104870
                    PT000 BSC  L  *-*        ENTRY FROM MAIN (+2)       AP104880
                          ORG     *-1                                   AP104890
                          DC      PT780      ADDR OF CONV TBL FOR ASM   AP104900
                          MDX     PT040      GO TO SERVICE              AP104910
                    PT010 BSC  L  *-*        ENTRY FROM INTRPT   (+5)   AP104920
                          LD      PT020      INITLZ SYST TRAP ADDR      AP104930
                          STO     PT160+1    TO 'TEST DEV RDY' SUBR     AP104940
                          MDX     PT170      GO TO SERVICE INTRPT       AP104950
                    *                                                 * AP104960
                    PT015 DC      1          CHANGED BY THE ASM         AP104970
                    PT020 DC      $PST4      ADDR OF INTRPT TRAP ADDR   AP104980
                    PT030 DC      $PRET      ADDR OF CALL TRAP ADDR     AP104990
                    *                                                 * AP105000
                    PT040 STO     PT060      SET UP FOR FUNCTION BRANCH AP105010
                          LD   L  $IBSY      TEST SUBR BUSY INDR.       AP105020
                          BSC     Z                                     AP105030
                          MDX     *-4        LOOP UNTIL NOT BUSY        AP105040
                    *                                                 * AP105050
                          STO     PT310      INITLZ THE CASE SWITCH     AP105060
                          STO     PT300      AND FILL-MODE SWITCH       AP105070
                    *                        TO ZERO                  * AP105080
                          LD      PT030      CALL SYSTEM TRAP ADDR      AP105090
                          STO     PT160+1    TO 'TEST DEV RDY' SUBR     AP105100
                          RTE     16                                    AP105110
                          STO     *+3        FETCH THE WORD COUNT       AP105120
                          A       PT015      AND I/O AREA ADDR          AP105130
                          STO     PT340      AND ASSIGN THEM            AP105140
                          LD   L  *-*        TO IN-LINE STORAGE         AP105150
                          STO     PT360                                 AP105160
                          STX   0 PT200+1                               AP105170
                    PT050 LD      PT200+1    COMPUTE RELATIVE ADDR      AP105180
                          A       PT320      OF I/O AREA POINTER.       AP105190
                          STO     PT200+1    INITLZ IN-LINE             AP105200
                          STO     PT130+1    CODING                     AP105210
                          STO     PT270+1                               AP105220
                    *                                                 * AP105230
                    PT060 DC      0          FUNCTION BR (MDX *+ )      AP105240
                          MDX     PT080      *TO HERE FOR READ EBC      AP105250
                          MDX     PT090      *TO HERE FOR PUNCH,AND     AP105260
                    PT070 STO     PT380      *TO HERE FOR READ PTTC/8   AP105270
                    PT080 LD      PT350      SET READ INDR              AP105280
                          MDX     PT090+1                               AP105290
                    *                                                 * AP105300
                    PT090 LD      PT330                                 AP105310
                          STO     PT370                                 AP105320
                          STO  L  $IBSY      TURN ON SUBR BUSY INDR     AP105330
                          BSI     PT140      GO TO SENSE DEVICE RDY     AP105340
                          MDX  L  $IOCT,1    INCREMENT IOCS CNTR    2-2 AP105350
                    *                                                 * AP105360
                    PT100 LD      PT370      SET UP IOCC WORD           AP105370
                          SLA     8          FOR READ/PUNCH             AP105380
                          OR      PT390                                 AP105390
                          STO     PT460+1                               AP105400
                    *                                                 * AP105410
                          STX   0 PT460      COMPUTE THE BUFFER         AP105420
                    PT110 LD      PT460      ADDRESS FOR THE            AP105430
                          A       PT400      IOCC INST                  AP105440
                          STO     PT460                                 AP105450
                    *                                                 * AP105460
                          LD      PT370      DETERMINE WHAT SERVICE     AP105470
                          BSC     E          REQUESTED                  AP105480
                          MDX     PT130      GO TO PUNCH                AP105490
                    *                                                 * AP105500
                          XIO     PT450      EXEC A READER START        AP105510
                    *                                                 * AP105520
                          LD      PT510      SET TO COUNT FIRST 3 CHAR  AP105530
                          STO     PT500      AS THEY ARE READ IN        AP105540
                    *                                                 * AP105550
                          LD      PT520      INITLZ SLASH CTR           AP105560
                          STO     PT540      TO 3                       AP105570
                    *                                                 * AP105580
                    PT120 MDX     PT000      EXIT                       AP105590
                    *                                                 * AP105600
                    PT130 LD   I  *-*                                   AP105610
                          STO     PT480                                 AP105620
                    *                                                 * AP105630
                          XIO     PT460      PUNCH FIRST WORD           AP105640
                          MDX     PT120      RETURN TO MAIN             AP105650
                    *                                                 * AP105660
                          DC      /4C00      BRANCH BACK TO CALLER      AP105670
                    PT140 DC      *-*        ENT HERE TO TEST DEVICE    AP105680
                          LD      PT370      DETM DEVICE REQUESTED      AP105690
                          BSC     E                                     AP105700
                          MDX     *+1        SKIP TO SENSE PUNCH        AP105710
                          MDX     PT150-1    GO TO SENSE READER         AP105720
                    *                                                 * AP105730
                          LD      PT410      MODIFY SHIFT INSTR TO      AP105740
                          STO     PT150      SENSE FOR PUNCH            AP105750
                    *                                                 * AP105760
                          XIO     PT430      SENSE AND RESET            AP105770
                    PT150 SLA     5          TEST FOR I/O               AP105780
                          BSC     -          DEVICE READY               AP105790
                    *                                                 * AP105800
                          MDX     PT140-1    GO TO RETURN FROM TEST     AP105810
                    *                                                 * AP105820
                          LD      PT420      ERROR CD TO ACC AND        AP105830
                    PT160 BSI  L  *-*        GO TO WAIT IF NOT RDY      AP105840
                          MDX     PT150-1    TRY AGAIN                  AP105850
                    *************************************************** AP105860
                    *                                                 * AP105870
                    *    THIS BLOCK OF CODING SERVICES                * AP105880
                    *    AN INTERRUPT FOR READ/PUNCH                  * AP105890
                    *                                                 * AP105900
                    *************************************************** AP105910
                    PT170 XIO     PT430      SENSE AND RESET            AP105920
                          SLA     1                                     AP105930
                          BSC     -          DETM SERVICE REQUEST       AP105940
                          MDX     PT260      PUNCH REQUEST              AP105950
                    PT180 XIO     PT460      READ A WORD                AP105960
                    *                                                 * AP105970
                    PT190 LD      PT380                                 AP105980
                          BSC     Z          BRANCH IF NO CONV REQUEST  AP105990
                          MDX     PT670      OTHERWISE, GO TO CONVERT   AP106000
                          LD      PT480                                 AP106010
                    PT200 STO  I  *-*        STORE THE WORD             AP106020
                          LD      PT340      INCR THE I/O AREA POINTER  AP106030
                          A       PT330                                 AP106040
                          STO     PT340                                 AP106050
                          LD      PT360      DECR THE WORD COUNT        AP106060
                          S       PT330                                 AP106070
                          STO     PT360                                 AP106080
                          BSC     -Z                                    AP106090
                          MDX     PT230      CHECK FILL-MODE SWITCH     AP106100
                    *                                                 * AP106110
                    PT210 SLA     16                                    AP106120
                          STO     PT380                                 AP106130
                          STO  L  $IBSY      TURN OFF SUBR BUSY INDR    AP106140
                          MDX  L  $IOCT,-1   DECREMENT IOCS CNTR    2-2 AP106150
                          NOP                IN CASE OF SKIP        2-2 AP106160
                    PT220 MDX     PT010      EXIT                       AP106170
                    *                                                 * AP106180
                    PT230 LD      PT300                                 AP106190
                          BSC     +-         TEST FILL-MODE SWITCH      AP106200
                          MDX     *+2        BRANCH IF OFF              AP106210
                          LD      PT640      OTHERWISE, FILL OUT        AP106220
                    PT240 MDX     PT200      RECORD WITH BLANKS         AP106230
                    *                                                 * AP106240
                    PT250 BSI     PT140      GO TO TEST DEVC RDY        AP106250
                          XIO     PT450      START THE READER           AP106260
                          MDX     PT220      GO TO RETURN FROM INTRPT   AP106270
                    *                                                 * AP106280
                    *                                                 * AP106290
                    PT260 LD      PT360      DECR THE WORD COUNT        AP106300
                          S       PT330                                 AP106310
                          STO     PT360                                 AP106320
                          BSC     +                                     AP106330
                          MDX     PT210      GO TO EXIT                 AP106340
                          LD      PT340      INCR THE I/O AREA POINTER  AP106350
                          A       PT330                                 AP106360
                          STO     PT340                                 AP106370
                    *                                                 * AP106380
                    PT270 LD   I  *-*        FETCH WORD INTO BUFFER     AP106390
                          STO     PT480                                 AP106400
                    PT280 BSI     PT140      GO TO SENSE DEVICE RDY     AP106410
                    *                                                 * AP106420
                    PT290 XIO     PT460      PUNCH A WORD               AP106430
                          MDX     PT220      GO TO EXIT                 AP106440
                    *                                                 * AP106450
                    PT300 DC      0          FILL-MODE SWITCH           AP106460
                    PT310 DC      0          PTTC/8 CASE IND            AP106470
                    *************************************************** AP106480
                    *                                                 * AP106490
                    *         FOLLOWING IS A TABLE OF                 * AP106500
                    *         CONSTANTS AND STORAGE LOCATIONS         * AP106510
                    *                                                 * AP106520
                    *************************************************** AP106530
                    PT320 DC      PT340-PT050  ADDR DISPLACEMENT        AP106540
                    PT330 DC      /0001      PUNCH FUNC INDR            AP106550
                    PT340 DC      0          STORAGE FOR I/O ADDRESS    AP106560
                    PT350 DC      /0002      RD FUNC INDR               AP106570
                    PT360 DC      0          STORAGE FOR WD CNT         AP106580
                    PT370 DC      0          RD/PNCH IND SWTCH          AP106590
                    PT380 DC      0          CONVERSION SWITCH          AP106600
                    PT390 DC      /1800      PAPER TAPE AREA CODE       AP106610
                    PT400 DC      PT480-PT110  ADDR DISPLACEMENT        AP106620
                    PT410 DC      /1007      SHFT INSTR FOR PNCH SENSE  AP106630
                          BSS  E  0                                     AP106640
                    PT420 DC      /3000      DEVICE NOT RDY ERROR CODE  AP106650
                    PT430 EQU     PT420                                 AP106660
                          DC      /1F01      SENSE AND RESET            AP106670
                    PT490 DC      /1000      PTTC/8 CODE FOR SPACE      AP106680
                    PT450 EQU     PT490                                 AP106690
                          DC      /1C10      THE READER                 AP106700
                    PT460 DC      *-*        I/O CONTROL COMMAND        AP106710
                          DC      0          PUNCH OR READ              AP106720
                    PT470 DC      /3100      PTTC/8 CODE FOR SLASH      AP106730
                    PT480 DC      *-*        STORAGE FOR I/O DATA       AP106740
                    PT500 DC      0          INITIAL INPUT CNTR         AP106750
                    PT510 DC      4          CONSTANT FOUR              AP106760
                    PT520 DC      3          CONSTANT 3                 AP106770
                    *************************************************** AP106780
                    *         ENTER HERE TO CHECK INPUT               * AP106790
                    *         FOR A MONITOR CONTROL RECORD            * AP106800
                    *************************************************** AP106810
                    PT530 DC      /700B      BR TO * +11                AP106820
                    PT540 DC      0          SLASH COUNTER              AP106830
                    *                                                   AP106840
                    PT550 LD      PT540      ENTER HERE TO CHK FOR      AP106850
                          S       PT330      A CONTROL RECORD           AP106860
                          STO     PT540      DECR SLASH INDR            AP106870
                          BSC     Z          SKIP IF TWO SLASHES CHEKED AP106880
                    *                                                 * AP106890
                          MDX     PT570      GO CHK FOR A SLASH         AP106900
                    *                                                 * AP106910
                          LD      PT480                                 AP106920
                          S       PT490      IS 3RD CHAR A BLANK        AP106930
                          BSC     Z          YES - SKIP                 AP106940
                          MDX     PT560      NO - GO TO EXIT            AP106950
                          LD      PT330                                 AP106960
                          STO  L  $CTSW      IND INPUT IS CTRL RECORD   AP106970
                    *                                                 * AP106980
                    PT560 MDX     PT730-1    EXIT                       AP106990
                    *                                                 * AP107000
                    PT570 LD      PT480                                 AP107010
                          S       PT470      CHECK FOR A SLASH          AP107020
                          BSC     +-         SKIP IF NOT A SLASH        AP107030
                          MDX     PT560      GO TO EXIT                 AP107040
                    *                                                 * AP107050
                    *                                                 * AP107060
                          SLA     16         SET CNT TO AVOID           AP107070
                          STO     PT500      FURTHER CHECKING           AP107080
                          MDX     PT560      CHECKING AND EXIT          AP107090
                    *                                                   AP107100
                    *************************************************** AP107110
                    *                                                 * AP107120
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   AP107130
                    PHAS2 DC      *-*       PHASE 2 WORD COUNT          AP107140
                          DC      *-*       PHASE 2 SECTOR ADDRESS      AP107150
                    *                                                   AP107160
                    *************************************************** AP107170
                    *                                                   AP107180
                    *************************************************** AP107190
                    *                                                 * AP107200
                    *    THIS BLOCK OF CODING PROVIDES                * AP107210
                    *    FOR CONVERSION FROM PTTC/8 TO EBC.           * AP107220
                    *    ALL OF THE CODING WHICH FOLLOWS IS           * AP107230
                    *    CONCERNED WITH, AND ONLY WITH,               * AP107240
                    *    THIS CONVERSION.                             * AP107250
                    *************************************************** AP107260
                    PT580 DC      /00FF      CONSTANT TO MASK BITS 0-7  AP107270
                    PT582 DC      /FF00      PTTC/8  SUPERDELETE    2-8 AP107280
                    PT590 DC      /7F00-/FF00                       2-8 AP107290
                    PT600 DC      /0E00-/7F00  *CODE                    AP107300
                    PT610 DC      /6E00-/0E00  *FOR                     AP107310
                    PT620 DC      /8000        *SPECIAL                 AP107320
                    PT630 DC      /DD00-/6E00  *CHARACTERS              AP107330
                    PT640 DC      /0040      EBC BLANK                  AP107340
                    PT660 DC      PT780-PT730  ADDR HELP FOR CONV       AP107350
                    *                                                 * AP107360
                    PT670 LD      PT480      COME HERE ON CONV REQ      AP107370
                          S       PT582      IS CHAR SUPERDELETE    2-8 AP107380
                          BSC  L  PT250,+-   YES, GO TO EXIT        2-8 AP107390
                          S       PT590      IS CHAR A DELETE           AP107400
                          BSC     +-         NO, BRANCH                 AP107410
                          MDX     PT250      YES, GO TO EXIT            AP107420
                          S       PT600      IS CHAR AN UP CASE         AP107430
                          BSC     Z          YES, SKIP                  AP107440
                          MDX     PT690      NO, BRANCH                 AP107450
                          LD      PT620      INDICATE CASE AND          AP107460
                    PT680 STO     PT310      SET CASE SWITCH            AP107470
                          MDX     PT250      GO TO EXIT                 AP107480
                    *                                                 * AP107490
                    PT690 S       PT610      IS CHAR A LOW CASE         AP107500
                          BSC     +-         NO, SKIP                   AP107510
                          MDX     PT680      YES, GO TO SET INDR        AP107520
                    PT700 S       PT630      IS CHAR A NEW LINE         AP107530
                          BSC     +-         NO, SKIP                   AP107540
                          MDX     PT710      YES, GO TO SET INDR        AP107550
                          MDX     PT720      NO, GO TO TABLE LOOK-UP    AP107560
                    *                                                 * AP107570
                    *                                                 * AP107580
                    PT710 LD      PT500      TEST FOR FIRST CHAR A NEW  AP107590
                          EOR     PT510      * LINE                     AP107600
                          BSC     +-         NO, SKIP                   AP107610
                          MDX     PT250      GO TO EXIT                 AP107620
                    *                                                 * AP107630
                          LD      *-1        SET FILL SWITCH            AP107640
                          STO     PT300      TO ON                      AP107650
                          MDX     PT230+3    BR TO FILL RECORD W/BLANKS AP107660
                    PT715 MDX     PT240                                 AP107670
                    *                                                 * AP107680
                    PT720 LD      PT500                                 AP107690
                          S       PT330      DECR CHAR CNT              AP107700
                          STO     PT500                                 AP107710
                          BSC     -Z         SKIP TO CONVERT            AP107720
                    *                                                 * AP107730
                          MDX     PT550      BR TO SAVE FIRST 3 CHAR    AP107740
                          STX     PT750+1    INITILZ TBL ADDR FOR       AP107750
                    PT730 LD      PT750+1    *LOOPING TO SCAN THE       AP107760
                          A       PT660      *CONV TABLE                AP107770
                          STO     PT750+1                               AP107780
                          STO     PT760+1                               AP107790
                          LDX  L1 PT785-PT780  SIZE OF CONVERSION TABLE AP107800
                    PT740 LD      PT480      FETCH WORD                 AP107810
                          OR      PT310      DETM UPPER/LOWER CASE FOR  AP107820
                    PT750 EOR  L1 *-*        COMPARE WITH TBL ENTRY     AP107830
                          SRA     8          SHIFT OUT EBC              AP107840
                          BSC     +-         SKIP IF NON ZERO RESULT    AP107850
                          MDX     PT760      GO TO TREAT CONV CHAR      AP107860
                          MDX   1 -1         DECR LOOP COUNTER          AP107870
                          MDX     PT740      LOOP THRU SCAN             AP107880
                    *                                                 * AP107890
                          LD      PT780      INVALID CHAR DETECTED, GO  AP107900
                          MDX     PT770      TO ST FF IN STRING         AP107910
                    *                                                 * AP107920
                    PT760 LD   L1 *-*        FETCH CONV CHAR            AP107930
                    PT770 AND     PT580      CLEAR OUT PTTC/8 HALF      AP107940
                          MDX     PT715                                 AP107950
                    *************************************************** AP107960
                    *                                                 * AP107970
                    *    FOLLOWING IS A TABLE WITH                    * AP107980
                    *    119 ACCEPTABLE PTTC/8 CODES                  * AP107990
                    *    IN BITS 0-7, AND THEIR CORRESPONDING         * AP108000
                    *    EBCDIC REPRESENTATION IN BITS 8-15.          * AP108010
                    *                                                 * AP108020
                    *************************************************** AP108030
                    PT780 DC      /0050      INVAL CHAR CODE            AP108040
                          DC      /704E      AMPERSAND                  AP108050
                          DC      /0B7E      POUND                      AP108060
                          DC      /207D      AT                         AP108070
                          DC      /954D      PERCENT                    AP108080
                          DC      /825D      LESS THAN                  AP108090
                          DC      /6D05      HORIZONTAL TAB             AP108100
                          DC      /5E16      BACKSPACE                  AP108110
                          DC      /4C14      RESTORE                    AP108120
                          DC      /3D25      LINE FEED                  AP108130
                          DC      /3E26      END OF BLOCK               AP108140
                          DC      /1040      SPACE                      AP108150
                          DC      /01F1      1                          AP108160
                          DC      /02F2      2                          AP108170
                          DC      /13F3      3                          AP108180
                          DC      /04F4      4                          AP108190
                          DC      /15F5      5                          AP108200
                          DC      /16F6      6                          AP108210
                          DC      /07F7      7                          AP108220
                          DC      /08F8      8                          AP108230
                          DC      /19F9      9                          AP108240
                          DC      /1AF0      0 (NUMERIC)                AP108250
                          DC      /E1C1      A                          AP108260
                          DC      /E2C2      B                          AP108270
                          DC      /F3C3      C                          AP108280
                          DC      /E4C4      D                          AP108290
                          DC      /F5C5      E                          AP108300
                          DC      /F6C6      F                          AP108310
                          DC      /E7C7      G                          AP108320
                          DC      /E8C8      H                          AP108330
                          DC      /F9C9      I                          AP108340
                          DC      /D1D1      J                          AP108350
                          DC      /D2D2      K                          AP108360
                          DC      /C3D3      L                          AP108370
                          DC      /D4D4      M                          AP108380
                          DC      /C5D5      N                          AP108390
                          DC      /C6D6      O (ALPHA)                  AP108400
                          DC      /D7D7      P                          AP108410
                          DC      /D8D8      Q                          AP108420
                          DC      /C9D9      R                          AP108430
                          DC      /B2E2      S                          AP108440
                          DC      /A3E3      T                          AP108450
                          DC      /B4E4      U                          AP108460
                          DC      /A5E5      V                          AP108470
                          DC      /A6E6      W                          AP108480
                          DC      /B7E7      X                          AP108490
                          DC      /B8E8      Y                          AP108500
                          DC      /A9E9      Z                          AP108510
                          DC      /EB5F      LOGICAL NOT                AP108520
                          DC      /F04E      PLUS                       AP108530
                          DC      /DB5A      EXCLAMATION MARK           AP108540
                          DC      /C06D      UNDERSCORE                 AP108550
                          DC      /BB4F      LOGICAL OR                 AP108560
                          DC      /A04A      CENT                       AP108570
                          DC      /B16F      QUESTION MARK              AP108580
                          DC      /994D      LEFT PARENTHESIS           AP108590
                          DC      /9A5D      RIGHT PARENTHESIS          AP108600
                          DC      /8B7F      QUOTE                      AP108610
                          DC      /817E      EQUAL                      AP108620
                          DC      /935E      SEMICOLON                  AP108630
                          DC      /847A      COLON                      AP108640
                          DC      /967D      APOSTROPHE                 AP108650
                          DC      /876E      GREATER THAN               AP108660
                          DC      /885C      ASTERISK                   AP108670
                          DC      /6B4B      PERIOD                     AP108680
                          DC      /5B5B      DOLLAR SIGN                AP108690
                          DC      /4060      DASH                       AP108700
                          DC      /3B6B      COMMA                      AP108710
                          DC      /3161      SLASH                      AP108720
                          DC      /ED05      NO GRAPHIC                 AP108730
                          DC      /FC04      NO GRAPHIC                 AP108740
                          DC      /FA79      NO GRAPHIC                 AP108750
                          DC      /DE16      NO GRAPHIC                 AP108760
                          DC      /CF17      NO GRAPHIC                 AP108770
                          DC      /CC14      NO GRAPHIC                 AP108780
                          DC      /CA49      NO GRAPHIC                 AP108790
                          DC      /AC24      NO GRAPHIC                 AP108800
                          DC      /B025      NO GRAPHIC                 AP108810
                          DC      /BE26      NO GRAPHIC                 AP108820
                          DC      /AF27      NO GRAPHIC                 AP108830
                          DC      /AA69      NO GRAPHIC                 AP108840
                          DC      /9C34      NO GRAPHIC                 AP108850
                          DC      /9F37      NO GRAPHIC                 AP108860
                          DC      /9040      NO GRAPHIC                 AP108870
                          DC      /7C04      NO GRAPHIC                 AP108880
                          DC      /6181      NO GRAPHIC                 AP108890
                          DC      /6282      NO GRAPHIC                 AP108900
                          DC      /7383      NO GRAPHIC                 AP108910
                          DC      /6484      NO GRAPHIC                 AP108920
                          DC      /7585      NO GRAPHIC                 AP108930
                          DC      /7686      NO GRAPHIC                 AP108940
                          DC      /6787      NO GRAPHIC                 AP108950
                          DC      /6889      NO GRAPHIC                 AP108960
                          DC      /79C0      NO GRAPHIC                 AP108970
                          DC      /7A4B      NO GRAPHIC                 AP108980
                          DC      /4F17      NO GRAPHIC                 AP108990
                          DC      /5797      NO GRAPHIC                 AP109000
                          DC      /5898      NO GRAPHIC                 AP109010
                          DC      /4999      NO GRAPHIC                 AP109020
                          DC      /4AD0      NO GRAPHIC                 AP109030
                          DC      /5191      NO GRAPHIC                 AP109040
                          DC      /5292      NO GRAPHIC                 AP109050
                          DC      /4393      NO GRAPHIC                 AP109060
                          DC      /5494      NO GRAPHIC                 AP109070
                          DC      /4595      NO GRAPHIC                 AP109080
                          DC      /4696      NO GRAPHIC                 AP109090
                          DC      /2F27      NO GRAPHIC                 AP109100
                          DC      /2C24      NO GRAPHIC                 AP109110
                          DC      /32A0      NO GRAPHIC                 AP109120
                          DC      /23A1      NO GRAPHIC                 AP109130
                          DC      /34A2      NO GRAPHIC                 AP109140
                          DC      /25A3      NO GRAPHIC                 AP109150
                          DC      /26A4      NO GRAPHIC                 AP109160
                          DC      /37A5      NO GRAPHIC                 AP109170
                          DC      /38A6      NO GRAPHIC                 AP109180
                          DC      /29A7      NO GRAPHIC                 AP109190
                          DC      /2AE0      NO GRAPHIC                 AP109200
                          DC      /1F37      NO GRAPHIC                 AP109210
                          DC      /1C34      NO GRAPHIC                 AP109220
                    PT785 DC      /0D35                                 AP109230
                          BSS     4          PATCH AREA             2-2 AP109240
                    PT790 DC      0          *AREA                      AP109250
                    *                                                   AP109260
                          HDNG    BEGIN SYSTEM LOAD/RELOAD              AP109270
                    *                                                   AP109280
                    * ROLL NEEDED PARTS OF RESIDENT IMAGE               AP109290
                    * TEMPORARLY STORED IN BUFFR TO LOWER CORE          AP109300
                    *                                                   AP109310
                    AA000 NOP               ENTER PHASE1 FROM C.I.L.    AP109320
                          LDX  L1 $I494-BUFFR  ROLL RESIDENT IMAGE      AP109330
                    AA010 LD   L1 BUFFR+1   *FROM 'BUFFR'               AP109340
                          STO  L1 $IBSY-8   *TO                         AP109350
                          MDX   1 -1        *LOWER                      AP109360
                          MDX     AA010     *CORE                       AP109370
                          LDX  L1 AA060-1   STORE ADDRESS OF INTERRUPT  AP109380
                          STX  L1 $IBT4     *BRANCH TABLE TO ILS04      AP109390
                          LDX  L1 CONFG-BUFFR-1                         AP109400
                          SRA     16                                    AP109410
                    AA020 STO  L1 BUFFR+2   CLEAR                       AP109420
                          MDX   1 -1        *THE                        AP109430
                          MDX     AA020     *BUFFER                     AP109440
                          LDX  L3 E         XR3 BASE ADDR TO CONSTANTS  AP109450
                          LD    3 AZ912-E   DOUBLE                      AP109460
                          SLA     1         *THE                        AP109470
                          STO   3 AZ912-E   *BUFFER SIZE (640)          AP109480
                          STO   3 AZ938-E   SET 'FETCH' INHIBIT INDR    AP109490
                          STO   3 AZ942-E   *AND RES IMAGE INDR ON      AP109500
                          LDX  L1 INTPT     STORE ADDR OF INTRPT SUBR   AP109510
                          STX  L1 $IREQ     *TO INTERRUPT REQUEST       AP109520
                    *                                                   AP109530
                    * READ A RECORD                                     AP109540
                    *                                                   AP109550
                    AA040 LD      AA900     SET COLUMNS TO READ INDR    AP109560
                          STO     AA903     *TO 80 COLUMNS              AP109570
                          MDX     AA042     BEGIN READING               AP109580
                    *                                                   AP109590
                    * CONSTANTS AND WORK AREAS                          AP109600
                    *                                                   AP109610
                    AA900 DC      @CCOL     NUMBER OF COLUMNS PER CARD  AP109620
                          BSS  E            FORCE EVEN ADDRESS          AP109630
                    AA914 DC      /7002     READ PTTC/8 AND CVRT        AP109640
                          DC      AA904-1   WD CNT LOC OF 80-WD BUFFER  AP109650
                    AA918 DC      /7000     READ BINARY TO 1-WD BUFFER  AP109660
                          DC      AA908                                 AP109670
                    AA916 DC      /7000     READ BINARY                 AP109680
                          DC      AA906                                 AP109690
                    *                                                   AP109700
                    AA912 DC      /7F00     DELETE CODE CONSTANT        AP109710
                    AA913 DC      /3600     MAXIMUM VALID WORD COUNT    AP109720
                    *                                                   AP109730
                    *                                                   AP109740
                    AA050 DC      0         ENTRY/RETURN                AP109750
                          LD   L  $IBSY     TEST FOR BUSY               AP109760
                          BSC  L  *-4,Z                                 AP109770
                          BSC  I  AA050     RETURN                      AP109780
                    *                                                   AP109790
                    ERR21 BSI  L  ER018     PAPER TAPE WD CNT ERROR     AP109800
                    *                       FALL THRU TO RETRY AFTER    AP109810
                    *                       *RETURN FROM $PRET          AP109820
                    *                                                   AP109830
                    AA042 BSI     AA050     TEST FOR BUSY               AP109840
                          LD    3 AZ952-E   INDICATES READ-IN FORMAT    AP109850
                          BSC  L  AA046,+-  READ PTTC/8 IF OFF          AP109860
                    *                                                   AP109870
                    AA044 LDD     AA918     TEST 1 FRAME FOR DELETE     AP109880
                          BSI  L  PT000+1                               AP109890
                          BSI     AA050     WAIT FOR OP COMPLETE        AP109900
                          LD   L  AA908+1   TEST FRAME READ IN          AP109910
                          EOR     AA912     *AGAINST DELETE CODE AND    AP109920
                          BSC  L  AA044,+-  *READ AGAIN IF YES          AP109930
                    *                                                   AP109940
                          LD   L  AA908+1   TEST FOR VALID WORD COUNT   AP109950
                          S       AA913     TEST FOR VALID WD CNT       AP109960
                          BSC  L  ERR21,Z-  BR IF OVER 54               AP109970
                    *                                                   AP109980
                          LD      AA908+1                               AP109990
                          SRA     7         FORM FRAME COUNT            AP110000
                          STO  L  AA906     *AHEAD OF BUFFER            AP110010
                          SRA     1         FORM WORD COUNT             AP110020
                          STO  L  CK200+1   *FOR CHECKSUM PROCESSING    AP110030
                    *                                                   AP110040
                          LDD     AA916                                 AP110050
                          BSI  L  PT000+1   READ BINARY                 AP110060
                          BSI     AA050     WAIT FOR OP COMPLETE        AP110070
                    *                                                   AP110080
                          MDX     AA048     TEST PACKING INDICATOR      AP110090
                    *                                                   AP110100
                    AA046 LDD     AA914     READ PTTC/8 AND CVRT        AP110110
                          BSI  L  PT000+1                               AP110120
                          BSI     AA050     WAIT FOR OP COMPLETE        AP110130
                    *                                                   AP110140
                    *                                                   AP110150
                          LDX  L3 E         RESET XR3                   AP110160
                    AA048 LD    3 AZ952-E   TEST FOR PACKING            AP110170
                          BSI  L  PACK0,Z   *BR TO PACK RECORD          AP110180
                          BSC  L  AA070     BRANCH TO PROCESS RECORD    AP110190
                    *                                                   AP110200
                    *************************************************** AP110210
                    *                                                   AP110220
                    *             TAPE INPUT BUFFERS                    AP110230
                    *                                                   AP110240
                    AA908 DC      1         1-WORD BUFFER               AP110250
                          DC      *-*                                   AP110260
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   AP110270
                    AA902 DC      0         PACKED BINARY DATA          AP110280
                    AA903 DC      @CCOL     WORD COUNT                  AP110290
                    AA904 BSS     @CCOL     INPUT BUFFER, PTTC/8        AP110300
                    AA906 BSS     109       108-FRAME BUFFER            AP110310
                    *                                                   AP110320
                    * LEVEL 4 INTERRUPT BRANCH TABLE                    AP110330
                    *                                                   AP110340
                          DC      $PRET     PRE-OPERATIVE ERROR TRAP    AP110350
                    AA060 BSS     4         RESERVED                    AP110360
                          DC      *-*       1403 PRINTER                AP110370
                          DC      *-*       2501 CARD READER            AP110380
                          DC      *-*       1442 CARD READER            AP110390
                          DC      TZ100     CONSOLE PRINTER             AP110400
                          DC      PT000+4   PAPER TAPE READER/PUNCH     AP110410
                    *                                                   AP110420
                    * DETERMINE RECORD TYPE                             AP110430
                    * IF THE INDICATOR 'AZ949' IS POSITIVE A            AP110440
                    * CERTAIN TYPE IS EXPECTED                          AP110450
                    *                                                   AP110460
                    AA070 LD    3 AZ949-E   FETCH NEXT RECORD TYPE INDR AP110470
                          BSC  L  AA080,+-  BR TO REGULAR PROC IF ZERO  AP110480
                          LDX  L1 AA904     POINT TO INPUT BUFFER       AP110490
                          LD    3 AZ933-E   FETCH TYPE EXPECTED INDR    AP110500
                          BSI  L  AB000,+-  BR TO TEST FOR LOAD MODE    AP110510
                          BSI  L  AC000,+   BR TO TEST FOR SCON RECORD  AP110520
                          BSI  L  AD000     BR TO TEST FOR PHID RECORD  AP110530
                    *                                                   AP110540
                    AA080 LD    3 AZ952-E   TEST FOR AND BRANCH IF SCON AP110550
                          BSI  L  AE000,+-  *RCRDS ARE TO BE CONVERTED  AP110560
                          LDX  L1 AA902-1   XR1 PTS TO BINARY RCD BFR   AP110570
                          LD    1 3         FETCH WORD 3                AP110580
                          SRT     8         SAVE LEFT HALF OF WORD      AP110590
                          AND   3 AZ914-E   *RIGHT JUSTIFIED            AP110600
                          S     3 AZ901-E   TEST FOR AND BRANCH IF      AP110610
                          BSI  L  AH000,+-  *AN ABS HEADER RECORD - /01 AP110620
                          S     3 AZ901-E   TEST FOR AND BRANCH IF      AP110630
                          BSC  L  AH020,+-  *A RLTV HEADER RECORD - /02 AP110640
                          S     3 AZ907-E   TEST FOR AND BRANCH IF      AP110650
                          BSC  L  AH030,+-  *REL TO LAST ABS RCRD - /09 AP110660
                          S     3 AZ901-E   TEST FOR AND BRANCH IF      AP110670
                          BSI  L  AJ000,+-  *A DATA RECORD        - /0A AP110680
                          S     3 AZ905-E   TEST FOR AND BRANCH IF      AP110690
                          BSI  L  AK000,+-  *AN 'F' RECORD        - /0F AP110700
                          BSI  L  ER002     INVALID RCRD, PRINT MESSAGE AP110710
                          HDNG    TEST FOR LOAD MODE RECORD             AP110720
                    *                                                   AP110730
                    * RECORD MUST BE LOAD MODE TYPE                     AP110740
                    *                                                   AP110750
                    AB000 DC      0         ENTRY                       AP110760
                          BSI  L  COM34     TEST WORDS 3 AND 4 OF RCD   AP110770
                          S     3 AZ919-E   *AGAINST EBCDIC 'DE'        AP110780
                          BSI  L  ER017,Z   BRANCH IF MODE RCRD MISSING AP110790
                          STO   3 AZ949-E   CLEAR MODE RCRD TEST INDR   AP110800
                          BSI  L  AI000     BRANCH TO PROCESS RECORD    AP110810
                          HDNG    TEST FOR SCON RECORD                  AP110820
                    *                                                   AP110830
                    * RECORD MUST BE SCON TYPE                          AP110840
                    *                                                   AP110850
                    AC000 DC      0         ENTRY                       AP110860
                          BSI  L  COM34     TEST WORDS 3 AND 4 OF RCD   AP110870
                          S     3 AZ927-E   *AGAINST EBCDIC 'ON'        AP110880
                          BSI  L  ER003,Z   BR IF 'SCON' RCRD MISSING   AP110890
                          STO   3 AZ952-E   INDC NO PACK OF 'REQ' RCRDS AP110900
                          STO   3 AZ949-E   CLEAR INDR FOR SPEC RCRD    AP110910
                          BSC  L  AA040     BRANCH TO READ NEXT RECORD  AP110920
                          HDNG    PROCESS PHASE ID RECORD(S)            AP110930
                    *                                                   AP110940
                    * PHASE ID RECORD(S) PROCESS ON                     AP110950
                    * BOTH INITIAL LOAD AND RELOAD                      AP110960
                    *                                                   AP110970
                    AD000 DC      0         ENTRY                       AP110980
                          BSI  L  COM34     TEST WORDS 3 AND 4 OF RCD   AP110990
                          S     3 AZ971-E   *AGAINST EBCDIC 'ID'        AP111000
                          BSI  L  ER015,Z   *IF NOT AN 'I'              AP111010
                    *                                                   AP111020
                    * FETCH A 3-DIGIT NUMBER IN EBCDIC FROM PHID RECORD AP111030
                    * AND CONVERT IT TO BINARY                          AP111040
                    *                                                   AP111050
                    *                                                   AP111060
                    AD010 LDX  L1 AA904+5   1ST ID STARTS IN COL 5      AP111070
                          LDX   2 3                                     AP111080
                          BSI  L  EBTDC     EBCDIC TO DECIMAL           AP111090
                    *                                                   AP111100
                          LD    3 AZ972-E   FETCH RESULTS               AP111110
                          S     3 AZ974-E   TEST FOR CONVERSION OF A    AP111120
                          BSC  L  AD040,+-  *BLANK & STORE ZERO IF YES  AP111130
                          LD    3 AZ972-E   DECIMAL OUTPUT              AP111140
                          SLA     4         REMOVE 1ST 4 BITS           AP111150
                          SRA     4         RIGHT JUSTIFY               AP111160
                    *                                                   AP111170
                    *                                                   AP111180
                    AD040 STO  L  PAIR1     SAVE PHASE ID RANGE         AP111190
                          LD      AD900     FETCH INDICATOR AND         AP111200
                          BSI  L  AD050,Z   *BRANCH IF END OF RECORD    AP111210
                          MDX  L  AD040+1,1 INCREMENT PH ID STORE ADDR  AP111220
                          MDX  L  AD010+1,4 INCR HUNDREDS COLUMN ADDR   AP111230
                          MDX  L  AD901,-1  DECR PH ID CNT, SK IF ZERO  AP111240
                          MDX     AD010     BR TO CONVERT NEXT PH ID    AP111250
                          BSI  L  MODNO     BR TO PROCESS MOD NUMBER    AP111260
                          STX   0 AD900     SET TO TEST FOR 2ND RECORD  AP111270
                          MDX     AD010     BR TO CONVERT NEXT PH ID    AP111280
                    *                                                   AP111290
                    AD050 DC      0         ENTRY                       AP111300
                          LD   I  AD040+1   TEST FOR AND BRANCH IF      AP111310
                          BSC  L  AD060,+-  *LAST PH ID WAS ZERO        AP111320
                          LDX  L1 AA904+5   RESET                       AP111330
                          STX   1 AD010+1   *HUNDREDS COLUMN ADDRESS,   AP111340
                          MDX  L  AD901,14  RESET PHASE ID/RECORD COUNT AP111350
                          SRA     16        CLEAR                       AP111360
                          STO     AD900     *END OF RECORD INDICATOR    AP111370
                          BSC  L  AA040     BRANCH TO READ NEXT RECORD  AP111380
                    *                                                   AP111390
                    * CHECK VALIDITY OF PHID RECORD INPUT               AP111400
                    *                                                   AP111410
                    AD060 LDX  I1 AZ958     XR1 POINTS TO PHID PAIRS    AP111420
                          LD    1 0         FETCH 1ST ENT OF 1ST PAIR   AP111430
                          S     3 AZ901-E   TEST FOR AND                AP111440
                          MDX   1 -2                                    AP111450
                          BSI  L  ER015,Z   *BRANCH IF NOT '001'        AP111460
                    AD070 MDX   1 2         POINT TO NEXT PAIR          AP111470
                          LD    1 1         FETCH AND                   AP111480
                          STO     AD903     *SAVE UPPER LIMIT OF RANGE  AP111490
                          LD    1 0         FETCH AND                   AP111500
                          STO     AD902     *SAVE LOWER LIMIT OF RANGE  AP111510
                          BSC  L  AD080,+-  BRANCH IF NO MORE PAIRS     AP111520
                          S       AD903     TEST FOR AND BRANCH IF      AP111530
                          BSI  L  ER015,-Z  *UPPER LT LOWER LIMIT       AP111540
                          LD    1 2         FETCH NEXT LOWER LIMIT AND  AP111550
                          BSC  L  AD080,+-  *BRANCH IF ZERO             AP111560
                          S       AD903     TEST FOR AND BRANCH IF LESS AP111570
                          BSI  L  ER015,+   *THAN PREVIOUS UPPER LIMIT  AP111580
                          MDX     AD070     BRANCH TO CHECK NEXT PAIR   AP111590
                    AD080 LD    1 1         FETCH AND                   AP111600
                          STO  L  MAXPH     *STORE MAXIMUM PHASE ID     AP111610
                          SRA     16        CLEAR                       AP111620
                          STO   3 AZ949-E   *SPEC RECORD NEXT INDICATOR AP111630
                          MDX     AD100     BR TO TEST IF PAIRS VOIDED  AP111640
                    *                                                   AP111650
                    * CONSTANTS AND WORK AREAS                          AP111660
                    *                                                   AP111670
                    AD900 DC      *-*       END OF A 'PHID' RECORD INDR AP111680
                    AD901 DC      14        NO. OF PHASE IDS PER RECORD AP111690
                    AD902 DC      *-*       TEMP STORAGE FOR LOWER LIM  AP111700
                    AD903 DC      *-*       TEMP STORAGE FOR UPPER LIM  AP111710
                    *                                                   AP111720
                    * IF ASM, FOR, PH ID PAIR 8, 9 AND/OR 10 NOT TO     AP111730
                    * BE LOADED THE PHASE ID PAIRS WILL BE PLACED IN    AP111740
                    * A SKIP TABLE AND BITS 0 AND 1 IN THE NORMAL       AP111750
                    * PAIR TABLE WILL BE SET ON                         AP111760
                    *                                                   AP111770
                    AD100 STX   2 AD120+1   SAVE XR2                    AP111780
                          LDX   2 5         5 ID PAIRS MAY BE SKIPPED   AP111790
                    AD105 LD    3 AZ940-E   BITS INDICATE PAIRS TO SKIP AP111800
                          SLA     10        SHIFT BIT TO BE TESTED      AP111810
                          SLA   2 0         *TO BIT 0                   AP111820
                          BSC  L  AD110,-   BR IF BIT 0 NOT ON          AP111830
                          LDD  I2 AD910-1   LOAD PAIR TO BE SKIPPED     AP111840
                          STD  I  AD920     STORE IN SKIP TABLE         AP111850
                          OR    3 AZ929-E   SET BITS 0,1 ON IN FIRST    AP111860
                          STO  I2 AD910-1   *WORD OF PAIR IN PAIR TABLE AP111870
                          MDX  L  AD920,2   INCR POINTER TO SKIP TABLE  AP111880
                    AD110 MDX   2 -1        DECR BIT SHIFT COUNTER      AP111890
                          MDX     AD105     LOOP UNTIL 5 PAIRS TESTED   AP111900
                          LDX  L2 /0999     TERMINATE SKIP TABLE        AP111910
                          STX  I2 AD920     *WITH /0999 WORD            AP111920
                    AD120 LDX  L2 *-*       RESTORE XR2                 AP111930
                    *                                                   AP111940
                    * EXTRACT THE LAST PHASE ID THAT MUST BE LOADED     AP111950
                    * DURING AN INITIAL LOAD                            AP111960
                    *                                                   AP111970
                    AD122 LDD  L  PAIR1     PAIR ADDR WILL BE MODIFIED  AP111980
                          NOP               A WAIT MAY BE PATCHED HERE  AP111990
                          BSC  L  LDPH2,+-  BR TO LD PH 2 IF END OF JOB AP112000
                          BSC  L  AD128,Z-  BRANCH TO SAVE ID           AP112010
                    AD124 MDX  L  AD122+1,2 MODIFY ADDR UNTIL 0 FOUND   AP112020
                          MDX     AD122                                 AP112030
                    *                                                   AP112040
                    AD128 RTE     16        SAVE 2ND ID OF THIS PAIR    AP112050
                          STO  L  LPHID     *FOR SYSTEM LOADER PHASE 2  AP112060
                          MDX     AD124     BRANCH TO TEST NEXT PAIR    AP112070
                    *                                                   AP112080
                    * CONSTANTS AND WORK AREAS                          AP112090
                    *                                                   AP112100
                    AD910 DC      PAIRB     POINTER USED IF BIT 11 ON   AP112110
                          DC      PAIRA     PTR USED IF BIT 12 ON   2-9 AP112120
                          DC      PAIR8     POINTER USED IF BIT 13 ON   AP112130
                          DC      PAIR3     PTR USED IF BIT 14 ON   2-9 AP112140
                          DC      PAIR2     POINTER USED IF BIT 15 ON   AP112150
                    AD920 DC      LOLIM     MODIFIABLE PTR TO SKIP TBL  AP112160
                          HDNG    PROCESS SYSTEM CONFIG RECORDS         AP112170
                    AE000 DC      0         ENTRY                       AP112180
                          BSI  L  COM34     TEST WORDS 3 AND 4 OF RCD   AP112190
                          S       AE904     *AGAINST EBCDIC 'RE'        AP112200
                          BSC  L  AF000,+-  BR IF A 'CORE' RECORD       AP112210
                          A       AE904     TEST FOR                    AP112220
                          S       AE902     *AND                        AP112230
                          BSC  L  AG000,+-  *BR IF 'TERM' RECORD        AP112240
                          A       AE902     TEST FOR AND                AP112250
                          S       AE903     *BR IF NOT 'REQ' RECORD     AP112260
                          BSI  L  ER013,Z   CONFIG TAPE ERROR BRANCH    AP112270
                    *                                                   AP112280
                    * PROCESS 'REQ' RECORDS                             AP112290
                    *                                                   AP112300
                          MDX  L  AE905,-1  DECR 'REQ' CNT, SK IF ZERO  AP112310
                          MDX     AE010     BRANCH TO PROCESS 'REQ' RCD AP112320
                          BSI  L  ER013     BR IF MORE THAN 20 'REQ'S   AP112330
                    AE010 LDX  L1 AA904+8   FETCH 2 DIGIT ISS           AP112340
                          LDX   2 2         *NUMBER AND CONVERT         AP112350
                          BSI  L  EBTDC     *TO DECIMAL                 AP112360
                          NOP               DEBUG STOP                  AP112370
                          LD    3 AZ972-E   FETCH RESULT                AP112380
                          AND   3 AZ973-E   MASK OUT LEFT 11 BITS       AP112390
                    AE040 STO  L  CONFG     SAVE ISS NO. IN CONFIG TBL  AP112400
                          MDX  L  AE040+1,1 INCR CONFIG TBL STORE ADDR  AP112410
                          MDX  L  AE010+1,5 INCR TO NEXT RECORD FIELD   AP112420
                          MDX  L  AE906,-1  DECR DATA SETS COUNT        AP112430
                          MDX     AE010     FETCH NEXT DATA SET         AP112440
                          MDX  L  AE906,3   RESET DATA SETS COUNT       AP112450
                          MDX  L  AE010+1,-15 RESET REL LOC IN INPUT    AP112460
                          LD    3 AZ939-E   INCREMENT                   AP112470
                          A     3 AZ901-E   *THE 'REQ'                  AP112480
                          STO   3 AZ939-E   *RECORD COUNT               AP112490
                          BSC  L  AA040     BRANCH TO READ NEXT RECORD  AP112500
                    *                                                   AP112510
                    * CONSTANTS AND WORK AREAS                          AP112520
                    *                                                   AP112530
                    AE902 EBC     .RM.      TO TEST FOR 'TERM'          AP112540
                    AE903 EBC     .Q .      TO TEST FOR 'REQ '          AP112550
                    AE904 EBC     .RE.      TO TEST FOR 'CORE'          AP112560
                    AE905 DC      20+1      'REQ' RECORDS LIMIT         AP112570
                    AE906 DC      3         NO. OF GROUPS/'REQ' RECORD  AP112580
                          HDNG    SET CORE SIZE                         AP112590
                    *************************************************** AP112600
                    *                                                   AP112610
                    *                                                   AP112620
                    AF000 LDX  L1 AA904+5   POINT XR1 TO WORD 6         AP112630
                          LDX   2 2                                     AP112640
                          BSI  L  EBTDC     EBCDIC TO DECIMAL           AP112650
                    *                                                   AP112660
                          LD    3 AZ972-E   TEST RESULT FOR             AP112670
                          SLA     10                                    AP112680
                          BSC  L  AF032,+Z  *32K                        AP112690
                          SLA     1                                     AP112700
                          BSC  L  AF016,+Z  *OR 16K                     AP112710
                          SLA     1                                     AP112720
                          BSC  L  AF008,+Z  *OR  8K                     AP112730
                          SLA     1                                     AP112740
                          BSC  L  AF004,+Z  *OR  4K                     AP112750
                          BSI  L  ER013     INVALID CORE RECORD         AP112760
                    *                                                   AP112770
                    *                                                   AP112780
                    AF032 LD    3 AZ926-E   SET 32K                     AP112790
                          STO  L  SCORE     *CORE SIZE                  AP112800
                          BSC  L  AA040     BR TO READ NEXT RECORD      AP112810
                    *                                                   AP112820
                    AF016 LD    3 AZ926-E   SET 16K                     AP112830
                          SRA     1         *CORE SIZE                  AP112840
                          MDX     AF032+1   READ NEXT RECORD            AP112850
                    *                                                   AP112860
                    AF008 LD    3 AZ926-E   SET  8K                     AP112870
                          SRA     2         *CORE SIZE                  AP112880
                          MDX     AF032+1   READ NEXT RECORD            AP112890
                    *                                                   AP112900
                    AF004 LD      AF901     SET  4K CORE SIZE           AP112910
                          MDX     AF032+1   READ NEXT RECORD            AP112920
                    *                                                   AP112930
                    AF901 DC      /1000     CONSTANT FOR 4K             AP112940
                    *                                                   AP112950
                    *************************************************** AP112960
                          HDNG    PROCESS TERM RECORD                   AP112970
                    AG000 BSI  L  SAVXR     BR TO SAVE INDEX REGISTERS  AP112980
                    AG010 LDX  L1 CONFG-1   XR1 PTS TO 'REQ' STG AREA   AP112990
                          LD    1 1         FETCH AN ISS NUMBER         AP113000
                          BSI  L  ER013,+   BRANCH IF NOT POSITIVE      AP113010
                          S     3 AZ909-E   TEST FOR AND BRANCH IF      AP113020
                          BSI  L  ER013,Z-  *GREATER THAN MAXIMUM (20)  AP113030
                          LD    1 1         FETCH ISS NUMBER AGAIN      AP113040
                          S     3 AZ901-E   TEST FOR AND BRANCH IF      AP113050
                          BSC  L  AG030,Z-  *GREATER THAN 1  (NOT 1442) AP113060
                          LD    1 3         TEST FOR AND BRANCH IF      AP113070
                          BSI  L  ER013,+   *NO MOD (5, 6 OR 7) NUMBER  AP113080
                          MDX  L  AG913,1   INCREMENT ISS 1 INDICATOR   AP113090
                          S     3 AZ905-E   TEST FOR AND                AP113100
                          BSC  L  AG020,+-  *BRANCH IF A 1442-5         AP113110
                          S     3 AZ901-E   TEST FOR AND                AP113120
                          BSC  L  AG040,+-  *BRANCH IF A 1442-6         AP113130
                          S     3 AZ901-E   TEST FOR AND                AP113140
                          BSC  L  AG040,+-  *BRANCH IF A 1442-7         AP113150
                          BSI  L  ER013     BRANCH, MODEL UNKNOWN       AP113160
                    *                                                   AP113170
                    AG020 LD      AG913     FETCH INDICATOR             AP113180
                          S     3 AZ902-E   TEST FOR AND                AP113190
                          BSI  L  ER013,Z   *BRANCH IF NOT EQUAL TO 2   AP113200
                    AG030 LD    1 1         FETCH ISS NUMBER            AP113210
                          MDX     AG050     BR TO PROCESS NEXT 'REQ'    AP113220
                    AG040 LD    3 AZ901-E   INDICATE                    AP113230
                          STO  L  T1442     *1442-6 OR 7                AP113240
                    AG050 SLT     32        CLEAR ACC AND EXT           AP113250
                          LD    1 1         FETCH ISS NUMBER            AP113260
                          S     3 AZ908-E   TEST FOR AND                AP113270
                          BSC  L  AG060,Z-  *BRANCH IF GREATER THAN 15  AP113280
                          LD    1 1         FETCH ISS NUMBER            AP113290
                          STO     AG054+1   *AND SAVE TO SET XR2        AP113300
                    AG054 LDX  L2 *-*       SET XR2 FOR SHIFT           AP113310
                          LD    3 AZ926-E   FETCH SIGN BIT              AP113320
                          RTE   2 0         SHIFT TO APPROPRIATE POS    AP113330
                          OR   L  DINDR     'OR' IN REST OF INDICATOR   AP113340
                          STO  L  DINDR     *AND SAVE                   AP113350
                    AG060 MDX  L  AG010+1,3 POINT TO NEXT 'REQ' RCRD    AP113360
                          BSI  L  RSTXR     RESTORE INDEX REGISTERS     AP113370
                          MDX  L  AZ939,-1  DECR 'REQ' CNT, SK IF ZERO  AP113380
                          MDX     AG010     BR TO PROCESS NEXT 'REQ'    AP113390
                    *                                                   AP113400
                    * SET INDICATOR TO PROCESS PHASE ID RECORD(S) NEXT  AP113410
                    *                                                   AP113420
                          NOP               A WAIT MAY BE PATCHED HERE  AP113430
                          LD   L  DINDR     FETCH ISS INDICATOR         AP113440
                          STO     AG912     *AND SAVE TEMPORARLY        AP113450
                          SRA     6         TEST FOR AND                AP113460
                          BSC  L  AG120,E   *BRANCH IF 1403             AP113470
                          SRA     3         TEST FOR AND                AP113480
                          BSC  L  AG130,E   *BRANCH IF 1132             AP113490
                          LD    3 AZ926-E   SET CONSOLE PRINTER         AP113500
                          STO  L  PRNPR     *AS PRINCIPAL PRINT DEVICE  AP113510
                          LDD     AG910     SAVE PHASE ID AND CHAN 12   AP113520
                    AG080 STD  L  PTRID     *INDR OF PRINC PRINT DEVICE AP113530
                          MDX  L  AG914,0   SKIP IF BRANCH INDR ZERO    AP113540
                          MDX     AG140     BR IF END OF REQ PROCESS    AP113550
                          STX   0 AG914     SET BRANCH INDR NON-ZERO    AP113560
                          MDX  L  AG080+1,2 INCREMENT STORE ADDRESS     AP113570
                          LD      AG912     FETCH ISS SUMMARY WORD      AP113580
                          SRA     11        TEST FOR AND                AP113590
                          BSC  L  AG090,E   *BRANCH IF 2501             AP113600
                          SRA     3         TEST FOR AND                AP113610
                          BSC  L  AG100,E   *BRANCH IF 1442-6 OR 7      AP113620
                          LD      AG912     FETCH ISS SUMMARY WORD      AP113630
                          SRA     12        TEST FOR AND                AP113640
                          BSC  L  AG110,E   *BRANCH IF 1134 (PAP  TAPE) AP113650
                          BSI  L  ER013     BRANCH, NO INPUT DEVICE     AP113660
                    AG090 LD    3 AZ901-E   SET 2501/1442               AP113670
                          STO  L  PRNRD     *AS PRINCIPAL I/O DEVICE    AP113680
                          LDD     AG900     SAVE PHASE ID OF PRINC I/O  AP113690
                          MDX     AG080     *DEVICE AND CONVERSION SUBR AP113700
                    AG100 SRA     16        SET 1442/1442               AP113710
                          STO  L  PRNRD     *AS PRINCIPAL I/O DEVICE    AP113720
                          LDD     AG902     SAVE PHASE ID OF PRINC I/O  AP113730
                          MDX     AG080     *DEVICE AND CONVERSION SUBR AP113740
                    AG110 LD    3 AZ926-E   SET 1134/1055               AP113750
                          STO  L  PRNRD     *AS PRINCIPAL I/O DEVICE    AP113760
                          LDD     AG904     SAVE PHASE ID OF PRINC I/O  AP113770
                          MDX     AG080     *DEVICE AND CONVERSION SUBR AP113780
                    AG120 LD    3 AZ901-E   SET 1403                    AP113790
                          STO  L  PRNPR     *AS PRINCIPAL PRINT DEVICE  AP113800
                          LDD     AG906     SAVE PHASE ID AND CHAN 12   AP113810
                          MDX     AG080     *INDR OF PRINC PRINT DEVICE AP113820
                    AG130 SRA     16        SET 1132                    AP113830
                          STO  L  PRNPR     *AS PRINCIPAL PRINT DEVICE  AP113840
                          LDD     AG908     SAVE PHASE ID AND CHAN 12   AP113850
                          MDX     AG080     *INDR OF PRINC PRINT DEVICE AP113860
                    AG140 STO   3 AZ949-E   INDICATE SPEC RECORD NEXT   AP113870
                          LD    3 AZ901-E   INDICATE                    AP113880
                          STO   3 AZ933-E   *'PHID' RECORD NEXT         AP113890
                          BSC  L  AA040     BRANCH TO READ NEXT RECORD  AP113900
                    *                                                   AP113910
                    * CONSTANTS AND WORK AREAS                          AP113920
                    *                                                   AP113930
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   AP113940
                    AG900 DC      I2501     PHASE ID 2501 RDR SUBR      AP113950
                          DC      CDCNV     PHASE ID 2501 CNV SUBR      AP113960
                    AG902 DC      I1442     PHASE ID 1442 RDR SUBR      AP113970
                          DC      CDCNV     PHASE ID 1442 CNV SUBR      AP113980
                    AG904 DC      @1134     PHASE ID 1134 RDR SUBR      AP113990
                          DC      C1134     PHASE ID 1134 CNV SUBR      AP114000
                    AG906 DC      P1403     PHASE ID 1403 PTR SUBR      AP114010
                          DC      $1403     1403 PTR CHANNEL 12 INDR    AP114020
                    AG908 DC      P1132     PHASE ID 1132 PTR SUBR      AP114030
                          DC      $1132     1132 PTR CHANNEL 12 INDR    AP114040
                    AG910 DC      PCPAD     PHASE ID CNSL PTR SUBR      AP114050
                          DC      $CPTR     CNSL PTR CHANNEL 12 INDR    AP114060
                    AG912 DC      *-*       DEVICE INDR TEMPORARY STG   AP114070
                    AG913 DC      1         INDR TO CHECK ISS 1 RECORDS AP114080
                    AG914 DC      0         BRANCH INDICATOR            AP114090
                          HDNG    VERIFY PRESENCE OF F RECORD           AP114100
                    AH000 DC      0         ENTRY                       AP114110
                          LD    3 AZ950-E   TEST FOR AND BRANCH         AP114120
                          BSI  L  ER003,+-  *IF TYPE 'F' INDR NOT SET   AP114130
                          SLA     16        CLEAR                       AP114140
                    AH010 STO   3 AZ950-E   *TYPE 'F' INDICATOR         AP114150
                          LD    3 AZ901-E   INDICATE                    AP114160
                          STO   3 AZ944-E   *ABSOLUTE PROGRAM           AP114170
                          MDX     AH050     BRANCH TO WRITE SECTOR      AP114180
                    AH020 LD   L  BUFFR+1   FETCH AND STORE             AP114190
                          STO   3 AZ941-E   *CURRENT SECTOR ADDRESS     AP114200
                          MDX     AH040     BR TO INDICATE REL PROGRAM  AP114210
                    AH030 LD    3 AZ932-E   FETCH AND STORE             AP114220
                          STO   3 AZ941-E   *LAST SECTOR ADDRESS        AP114230
                    AH040 LD    3 AZ928-E   INDICATE                    AP114240
                          STO   3 AZ944-E   *RELOCATABLE PROGRAM        AP114250
                    AH050 LD    3 AZ961-E   RESET                       AP114260
                          STO  L  CK300     *CHECKSUM PROCESSING        AP114270
                          BSI  L  WRITE     BR TO WRITE PREVIOUS SECTOR AP114280
                          SRA     16        CLEAR                       AP114290
                          STO  L  CK900     *CHECKSUM SEQUENCE NUMBER   AP114300
                          STO   3 AZ934-E   *AND CORRELATION FACTOR     AP114310
                          LD    3 AZ956-E   SET BRANCH ADDRESS          AP114320
                          STO  L  AJ040+1   *IN DATA RECORD PROCESSING  AP114330
                          LD    3 AZ922-E   SET OPERATION               AP114340
                          STO  L  AJ040     *IN DATA RECORD PROCESSING  AP114350
                          SRA     16        CLEAR                       AP114360
                          STO   3 AZ948-E   *SECTOR BREAK INDICATOR     AP114370
                          LD    3 AZ912-E   FORCE NEXT PROGRAM TO BE    AP114380
                          STO   3 AZ943-E   *STORED ON A NEW SECTOR     AP114390
                    *                                                   AP114400
                    * SAVE COMMA WORDS ON RELOAD FUNCTION               AP114410
                    *                                                   AP114420
                          LD    3 AZ942-E   TEST FOR AND BRANCH IF      AP114430
                          BSC  L  AH060,+-  *NOT READING THE RES IMAGE  AP114440
                          LD   L  LMODE     FETCH LOAD MODE INDICATOR   AP114450
                          BSC  L  AH060,Z+  BRANCH IF AN INITIAL LOAD   AP114460
                          LD    3 AZ959-E   FETCH RES IMAGE SCTR ADDR   AP114470
                          STO  L  BUFFR+1   *AND STORE TO I/O AREA      AP114480
                          BSI  L  FETCH     BRANCH TO FETCH RES IMAGE   AP114490
                          LDX  L2 BUFFR+2-6 POINT TO PSEUDO WORD 0      AP114500
                          LD    2 $DREQ                                 AP114510
                          STO   3 AZ966-E                               AP114520
                          LD    2 $ULET                                 AP114530
                          STO   3 AZ967-E   SAVE WORDS TO BE RESTORED   AP114540
                          LD    2 $DZIN     *AFTER THE RESIDENT IMAGE   AP114550
                          STO   3 AZ968-E   *DECK HAS BEEN READ         AP114560
                          LD   L  BUFFR+2-6+$FPAD                       AP114570
                          STO   3 AZ969-E                               AP114580
                          LD   L  BUFFR+2-6+$DCYL                       AP114590
                          STO   3 AZ970-E                               AP114600
                    AH060 BSC  L  AA040     BRANCH TO READ NEXT RECORD  AP114610
                          HDNG    PROCESS LOAD MODE RECORD              AP114620
                    *                                                   AP114630
                    * DETERMINE LOAD MODE                               AP114640
                    *                                                   AP114650
                    AI000 DC      0         ENTRY                       AP114660
                          LD    1 7         FETCH WORD 7                AP114670
                          EOR     AI900     TEST FOR AND                AP114680
                          BSC  L  AI010,+-  *BRANCH IF AN 'R'           AP114690
                          LD    1 7         FETCH WORD 7 AGAIN          AP114700
                          EOR     AI901     TEST FOR AND                AP114710
                          BSI  L  ER017,Z   *BRANCH IF NOT AN 'I'       AP114720
                          LD    3 AZ926-E   SET SIGN FOR INIT LOAD      AP114730
                    AI010 STO     AI902     *RELOAD=0, INIT LOAD=NON-Z  AP114740
                    *                                                   AP114750
                    * INDICATE PH ID PAIRS TO BE BYPASSED               AP114760
                    *                                                   AP114770
                          LD    1 11        FETCH WORD 12           2-5 AP114780
                          EOR     AI903     TEST FOR BLANK          2-5 AP114790
                          BSC  L  AI020,+-  BRANCH IF BLANK         2-5 AP114800
                          LD    1 11        FETCH WORD 12           2-5 AP114810
                          EOR     AI904     TEST FOR 'A'            2-5 AP114820
                          BSC  L  ER017,Z   BRANCH IF NOT           2-5 AP114830
                          MDX  L  AI902,8   SET INT BIT 12          2-9 AP114840
                    AI020 LD    1 12        FETCH WORD 13           2-5 AP114850
                          EOR     AI903     TEST FOR BLANK          2-5 AP114860
                          BSC  L  AI030,+-  BRANCH IF BLANK         2-5 AP114870
                          LD    1 12        FETCH WORD 13           2-5 AP114880
                          EOR     AI905     TEST FOR 'F'            2-5 AP114890
                          BSC  L  ER017,Z   BRANCH IF NOT           2-5 AP114900
                          MDX  L  AI902,1   SET IND BIT 15          2-5 AP114910
                    AI030 LD    1 13        FETCH WORD 14           2-5 AP114920
                          EOR     AI903     TEST FOR BLANK          2-5 AP114930
                          BSC  L  AI040,+-  BRANCH IF BLANK         2-5 AP114940
                          LD    1 13        FETCH WORD 14           2-5 AP114950
                          EOR     AI900     TEST FOR 'R'            2-5 AP114960
                          BSC  L  ER017,Z   BRANCH IF NOT           2-5 AP114970
                          MDX  L  AI902,4   SET IND BIT 13          2-5 AP114980
                    AI040 LD    1 14        FETCH WORD 15           2-5 AP114990
                          EOR     AI903     TEST FOR BLANK          2-5 AP115000
                          BSC  L  AI045,+-  BRANCH IF BLANK         2-8 AP115010
                          LD    1 14        FETCH WORD 15           2-5 AP115020
                          EOR     AI906     IF 'C', LOAD COBOL      2-9 AP115030
                          BSC  L  ER017,Z   BRANCH IF NOT           2-5 AP115040
                          MDX     AI050     DO NOT SET BIT 14 ON    2-9 AP115050
                    AI045 MDX  L  AI902,2   SET INT BIT 14 ON       2-9 AP115060
                    AI050 LD      AI902     SAVE                    2-5 AP115070
                          STO  L  LMODE     *THE                    2-5 AP115080
                          STO  L3 AZ940-E   *INDICATORS             2-5 AP115090
                          STX  L0 AZ952     SET INDR FOR BINARY INPUT   AP115100
                          BSC  L  AA040     BRANCH TO READ NEXT RECORD  AP115110
                    *                                                   AP115120
                    * CONSTANTS AND WORK AREAS                          AP115130
                    *                                                   AP115140
                    AI900 DC      /00D9     EBCDIC 'R'                  AP115150
                    AI901 DC      /00C9     EBCDIC 'I'                  AP115160
                    AI902 DC      *-*       TEMPORARY STORAGE           AP115170
                    AI903 DC      /0040     EBCDIC BLANK            2-5 AP115180
                    AI904 DC      /00C1     EBCDIC 'A'              2-5 AP115190
                    AI905 DC      /00C6     EBCDIC 'F'              2-5 AP115200
                    AI906 DC      /00C3     EBCDIC 'C'              2-9 AP115210
                          HDNG    PROCESS TYPE A DATA RECORD            AP115220
                    AJ000 DC      0         ENTRY                       AP115230
                          RTE     16        ISOLATE WORD COUNT          AP115240
                          SRA     8                                     AP115250
                          STO     AJ020+1   WD CNT FROM RCD TO XR2      AP115260
                          BSI  L  CKSUM     PROCESS CHK-SUM IF PRESENT  AP115270
                          LD    3 AZ944-E   TEST NEW SCTR INDR & IF ON  AP115280
                          BSC  L  AJ140,Z   *BR TO VERIFY WD CNT OVER 1 AP115290
                    AJ010 BSC  L  AJ110,Z-  BR TO ABS SCTR BREAK SUBR   AP115300
                          BSC  L  AJ120,Z+  BR TO RELATIVE BREAK SUBR   AP115310
                          LD    3 AZ925-E   AVOID LONG ADD INSTRUCTION  AP115320
                          STO     AJ030     *BY INSERTING A SKIP        AP115330
                    AJ020 LDX  L2 *-*       SET XR2 WITH WD CNT OF RCD  AP115340
                          LD    1 1         FETCH CORE LOADING ADDR     AP115350
                    AJ030 MDX     *+2       AT SCTR BREAKS, ADDR OF     AP115360
                          A    L  AZ902     *1ST WD TO STORE IS UP BY 2 AP115370
                    AJ040 BSI  L  RELAD     CALC RELOCATION FACTOR      AP115380
                          S    L  AZ945     MAINTAIN LONG FORMAT INST   AP115390
                          BSI  L  ER004,Z+  ORG BACKWARD MSG            AP115400
                    AJ050 STO   3 AZ937-E   SAVE RELATIVE ADDR          AP115410
                          SRT     16        SHIFT TO EXTENSION          AP115420
                          D     3 AZ912-E   DIVIDE BY WDS PER SECTOR    AP115430
                          STD   3 AZ964-E   SAVE QUOTIENT & REMAINDER   AP115440
                          S     3 AZ943-E   BR IF SCTR FOR THIS PART OF AP115450
                          BSC  L  AJ070,+-  *PROGRAM ALREADY IN CORE    AP115460
                          LD    3 AZ948-E   THIS INDR CLEARED ON SCTR   AP115470
                          BSC  L  AJ160,+-  *BREAKS                     AP115480
                          LD    3 AZ964-E   FETCH QUOTIENT              AP115490
                          STO   3 AZ943-E   SET POINTER                 AP115500
                          BSI  L  WRITE     WRITE A SECTOR              AP115510
                          LD    3 AZ964-E   FETCH QUOTIENT              AP115520
                    AJ060 A     3 AZ935-E   ADD SCTR ADDR               AP115530
                          STO  L  BUFFR+1   SET SCTR ADDR IN BUFFER     AP115540
                          BSI  L  FETCH     READ A SECTOR FROM DISK     AP115550
                          LDD   3 AZ964-E   FETCH REMAINDER             AP115560
                    AJ070 SLT     16        REL LOC IN CORE BUFFER      AP115570
                          A    L  AZ902     INCR BY 2                   AP115580
                          A     3 AZ954-E   ADD BUFFER ADDR             AP115590
                          STO     AJ090+1   SET ADDR IN STORE INST      AP115600
                          LD    3 AZ944-E   TEST FOR SECTOR BREAK       AP115610
                          BSC  L  AJ080,+-  BR IF NOT                   AP115620
                          SRA     16        INDICATE NEW SCTR REQ       AP115630
                          STO   3 AZ944-E                               AP115640
                          MDX   1 2         FETCH 3RD DATA WORD         AP115650
                    AJ080 LD    1 10        NO SCTR ADDR IN THIS CARD   AP115660
                          MDX   2 0         TEST XR2 FOR 0              AP115670
                          MDX     AJ090     STORE A WORD                AP115680
                          MDX     AJ100     READ NEXT RECORD            AP115690
                    AJ090 STO  L  *-*       DATA WD TO DISK BUFFER      AP115700
                          LD    3 AZ937-E   CORE ADDR OF DATA WD        AP115710
                          A     3 AZ901-E   MODIFY POINTER              AP115720
                          MDX   1 1                                     AP115730
                          MDX   2 -1        SKIP AFTER LAST WD DONE     AP115740
                          MDX     AJ050     *ELSE PROCESS NEXT WORD     AP115750
                    AJ100 BSC  L  AA040     READ NEXT RECORD            AP115760
                    *                                                   AP115770
                    AJ110 LD    1 11        FETCH FROM 1ST DATA RECORD  AP115780
                          STO   3 AZ935-E   SAVE SCTR ADDR              AP115790
                          STO   3 AZ932-E   SAVE BASE SCTR ADDR         AP115800
                          MDX     AJ130     TO FETCH WD CNT             AP115810
                    *                                                   AP115820
                    AJ120 LD    1 11        SECTOR ADDR                 AP115830
                          A     3 AZ941-E   PREVIOUS SCTR ADDR          AP115840
                          STO   3 AZ935-E                               AP115850
                    *                                                   AP115860
                    AJ130 LD      AJ020+1   FETCH WORD COUNT            AP115870
                          S    L  AZ902     DECR BY 2                   AP115880
                          STO     AJ020+1   STORE BACK                  AP115890
                          LD    3 AZ921-E   FETCH 'NOP' INST            AP115900
                          STO     AJ030     *TO CANCEL 'MDX    *+2'     AP115910
                          MDX     AJ020     TO PROCESS DATA RCD         AP115920
                    *                                                   AP115930
                    AJ140 LD   L  AJ020+1   FETCH WD COUNT              AP115940
                          S     3 AZ901-E   DECR BY 1                   AP115950
                          BSC     Z-        SKIP IF WD CNT 0 OR 1       AP115960
                          MDX     AJ150     CONTINUE IF POSITIVE        AP115970
                          BSI  L  ER004     ORG BACKWARD ERROR          AP115980
                    AJ150 LD    3 AZ944-E   RELOAD SCTR INDICATOR       AP115990
                          BSC  L  AJ010     RETURN                      AP116000
                    *                                                   AP116010
                    AJ160 LD    3 AZ964-E   FETCH NEW SCTR INDR         AP116020
                          STO   3 AZ943-E                               AP116030
                          MDX  L  AZ948,1   TEST FOR AND                AP116040
                          MDX     AJ060     *BR IF NOT SCTR BREAK       AP116050
                          BSI  L  AH000     BRANCH TO FETCH NEXT SECTOR AP116060
                          HDNG    INITIALIZE RES MON AND DISKZ          AP116070
                    *                                                   AP116080
                    * ROLL RESIDENT IMAGE AND DISKZ TO LOWER CORE       AP116090
                    *                                                   AP116100
                    AK000 DC      0         ENTRY                       AP116110
                          LD    3 AZ942-E   TEST FOR AND BRANCH IF      AP116120
                          BSC  L  AK080,+-  *PROG JUST READ NOT RES IMG AP116130
                          STO   3 AZ950-E   SET 'F' RECORD INDR ON      AP116140
                          LDX  L1 6-$ZEND   WORD COUNT = -(-6+$ZEND)    AP116150
                    AK010 LD   L1 BUFFR+$ZEND-4  FETCH WORD FROM BUFFER AP116160
                          STO  L1 $ZEND     STORE TO LOWER CORE         AP116170
                          MDX   1 1         INCR WORD CNT, SKIP IF ZERO AP116180
                          MDX     AK010     BRANCH TO FETCH NEXT WORD   AP116190
                          LDX  L1 DZ000+5   STORE ADDRESS OF DISKZ      AP116200
                          STX  L1 $I205+1   *INTERRUPT TO ILS02         AP116210
                          LDX  L1 INTPT     STORE ADDR OF INTRPT SUBR   AP116220
                          STX  L1 $IREQ     *TO INTERRUPT REQUEST       AP116230
                          LDX  L1 AA060-1   STORE ADDRESS OF INTERRUPT  AP116240
                          STX  L1 $IBT4     *BRANCH TABLE TO ILS04      AP116250
                    *                                                   AP116260
                    * FETCH DRIVE CODE FROM BIT SWITCHES                AP116270
                    *                                                   AP116280
                    AK020 XIO     AK900     READ THE BIT SWITCHES       AP116290
                          LD      AK907     TEST FOR                    AP116300
                          BSC  L  AK030,Z+  *AND BRANCH                 AP116310
                          S     3 AZ904-E   *IF DRIVE CODE              AP116320
                          BSC  L  AK030,Z-  *NOT 0-1-2-3-4              AP116330
                          LDX  I1 AK907     FETCH DRIVE CODE TO XR1     AP116340
                          LD   L1 AK904     FETCH AREA CODE             AP116350
                          STO  L  $ACDE     *AND STORE TO COMMA         AP116360
                          LD      AK906     INITIALIZE                  AP116370
                          STO  L  $DCYL     *DEFECTIVE CYLINDER         AP116380
                          STO  L  $DCYL+1   *ADDRESSES IN COMMA         AP116390
                          STO  L  $DCYL+2   FORCE DISKZ TO SEEK         AP116400
                          STO  L  $CYLN     *BEFORE FIRST OPERATION     AP116410
                          LD    3 AZ912-E   RESET                       AP116420
                          SRA     1         *BUFFER SIZE                AP116430
                          STO   3 AZ912-E   *TO 320                     AP116440
                          SRA     16        SET                         AP116450
                          STO   3 AZ938-E   *INHIBIT SWITCH OFF         AP116460
                          STO   3 AZ942-E   *AND RES IMAGE SWITCH OFF   AP116470
                          LD    3 AZ921-E   CANCEL INSTRUCTION TO       AP116480
                          STO  L  AH010     *SET 'F' RECORD INDICATOR   AP116490
                    *                                                   AP116500
                    * IF RELOAD CHECK SLET/RELOAD TABLE CHECKSUM        AP116510
                    * BEFORE WRITING TO THE DISK                        AP116520
                    *                                                   AP116530
                          LD   L  LMODE     FETCH LOAD MODE INDICATOR   AP116540
                          BSI  L  CK600,-   BRANCH IF A RELOAD          AP116550
                    *                                                   AP116560
                    *                                                   AP116570
                    * UPDATE THE RESIDENT IMAGE ON RELOAD FUNCTION      AP116580
                    *                                                   AP116590
                          LD   L  LMODE     FETCH LOAD MODE INDICATOR   AP116600
                          BSC  L  AK025,Z+  BRANCH IF AN INITIAL LOAD   AP116610
                          LDX  L2 BUFFR+2-6 POINT TO PSEUDO WORD 0      AP116620
                          LD    3 AZ966-E                               AP116630
                          STO   2 $DREQ                                 AP116640
                          LD    3 AZ967-E   RESTORE SAVED WORDS TO      AP116650
                          STO   2 $ULET     *TO RESIDENT IMAGE BEFORE   AP116660
                          LD    3 AZ968-E   *WRITING IT TO DISK         AP116670
                          STO   2 $DZIN                                 AP116680
                          LD    3 AZ969-E                               AP116690
                          STO  L  BUFFR+2-6+$FPAD                       AP116700
                          LD    3 AZ970-E                               AP116710
                          STO  L  BUFFR+2-6+$DCYL                       AP116720
                    *                                                   AP116730
                    * WRITE RESIDENT IMAGE TO DISK                      AP116740
                    *                                                   AP116750
                    AK025 LD    3 AZ960-E   FETCH AND STORE SECTOR ADDR AP116760
                          STO  L  BUFFR+1   *OF RES IMAGE TO I/O BUFFER AP116770
                          BSI  L  WRITE     BRANCH TO WRITE RES. IMAGE  AP116780
                    *                                                   AP116790
                    * FETCH FIRST THIRTY WORDS OF ID SECTOR             AP116800
                    *                                                   AP116810
                          LDX  L1 BUFFR+@CSTR-4  SET UP ADDRESS OF      AP116820
                          STX  L1 AK905     *COLD START BUFFER          AP116830
                          LDD     AK902     STORE WORD COUNT AND SECTOR AP116840
                          STD  I  AK905     *ADDR TO COLD START BUFFER  AP116850
                          LD      AK905     FETCH ADDR OF C. S. BUFFER  AP116860
                          SRT     16        SHIFT TO EXT, ACC = 0       AP116870
                          BSI  L  DZ000     BRANCH TO READ DISK         AP116880
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  AP116890
                          MDX     *-3       BR TO TEST READ COMPLETE    AP116900
                    *                                                   AP116910
                    * WRITE NEW ID SECTOR (30 WDS & DISKZ & COLD START) AP116920
                    *                                                   AP116930
                          LD    3 AZ912-E   SET WORD COUNT TO WRITE     AP116940
                          STO  I  AK905     *COMPLETE SECTOR            AP116950
                          LD      AK905     FETCH ADDR OF C. S. BUFFER  AP116960
                          SRT     16        SHIFT TO EXTENSION          AP116970
                          LD    3 AZ901-E   FETCH WRITE FUNCTION CODE   AP116980
                          BSI  L  DZ000     BRANCH TO WRITE DISK        AP116990
                          MDX  L  $DBSY,0   SKIP NEXT IF WRITE COMPLETE AP117000
                          MDX     *-3       BR TO TEST WRITE COMPLETE   AP117010
                    *                                                   AP117020
                    * HISTORIC COMPATABILITY.....                       AP117030
                    * IF SLET/RELOAD TABLE CHECKSUM WAS ZERO, UPDATE    AP117040
                    * SLET TO SPECIFICATIONS OF NEW SYSTEM LOADER.      AP117050
                    *                                                   AP117060
                          LD   L  LMODE     FETCH LOAD MODE INDICATOR   AP117070
                          BSC  L  AK029,Z+  BR IF INITIAL LOAD          AP117080
                          LD   L  CK913     FETCH OLD CHECKSUM          AP117090
                          BSI  L  CK630,+-  BRANCH TO PACK SLET TABLE   AP117100
                    *                                                   AP117110
                    AK029 MDX     AK040     TEST CARTRIDGE STATUS       AP117120
                    *                                                   AP117130
                    * ILLEGAL DRIVE CODE - PRINT MESSAGE E 11           AP117140
                    *                                                   AP117150
                    AK030 LDX  L1 MSG11+1   POINT TO ERROR MESSAGE E 11 AP117160
                          LDX  I2 MSG11     FETCH WORD CNT OF MSG E 11  AP117170
                          BSI  L  CNPTR     BRANCH TO PRINT THE MESSAGE AP117180
                          MDX     AK020     BRANCH TO RETRY             AP117190
                    *                                                   AP117200
                    * CONSTANTS AND WORK AREAS                          AP117210
                    *                                                   AP117220
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   AP117230
                    AK900 DC      AK907     ADDRESS OF DRIVE CODE       AP117240
                          DC      @I000     2ND WD OF READ BIT SW IOCC  AP117250
                    AK902 DC      $DBSY-@CSTR  WORD COUNT               AP117260
                          DC      @IDAD        SECTOR ADDRESS           AP117270
                    AK904 DC      @I510     AREA CODE OF PHY DRIVE 0    AP117280
                          DC      @I511     AREA CODE OF PHY DRIVE 1    AP117290
                          DC      @I512     AREA CODE OF PHY DRIVE 2    AP117300
                          DC      @I513     AREA CODE OF PHY DRIVE 3    AP117310
                          DC      @I514     AREA CODE OF PHY DRIVE 4    AP117320
                    AK905 DC      *-*       ADDR OF COLD AA040 BUFFER   AP117330
                    AK906 DC      @MSCT     MAXIMUM ARM POSITION        AP117340
                    AK907 DC      *-*       DRIVE CODE                  AP117350
                    AK908 DC      /0800     HALF MIN CORE SIZE (2K)     AP117360
                    AK909 DC      @MNCR     MINIMUM CORE SIZE  (4K)     AP117370
                    *                                                   AP117380
                    * DETERMINE STATUS OF CARTRIDGE                     AP117390
                    *                                                   AP117400
                    AK040 LD    3 AZ959-E   FETCH ID SECTOR ADDRESS     AP117410
                          STO  L  BUFFR+1   *AND STORE TO I/O BUFFER    AP117420
                          BSI  L  FETCH     BRANCH TO FETCH ID SECTOR   AP117430
                    *                                                   AP117440
                          LD   L  BUFFR+2+@STAT  FETCH STATUS (WORD 7)  AP117450
                          S     3 AZ902-E   BR IF CARTRIDGE NOT ALREADY AP117460
                          BSC  L  AK045,Z   *DM2 INITIAL LOADED         AP117470
                          LD   L  LMODE     FETCH LOAD MODE INDICATOR   AP117480
                          BSI  L  ER005,Z+  BRANCH IF NOT A RELOAD FUNC AP117490
                          MDX     AK050                                 AP117500
                    *                                                   AP117510
                    AK045 A     3 AZ904-E   BR IF CARTRIDGE NOT JUST    AP117520
                          BSI  L  ER005,Z   *INITIALIZED                AP117530
                          LD   L  LMODE     FETCH LOAD MODE INDICATOR   AP117540
                          BSI  L  ER016,-   BRANCH IF NOT AN INIT LOAD  AP117550
                    *                                                   AP117560
                    * DETERMINE VALIDITY OF CARTRIDGE INITIALIZATION    AP117570
                    *                                                   AP117580
                    AK050 LD   L  BUFFR+2+@CIDN  FETCH CART ID (WORD 3) AP117590
                          BSI  L  ER012,+   BRANCH IF INVALID ID        AP117600
                          STO  L  CARID     SAVE CART ID FOR PHASE 2    AP117610
                          LDX   2 -3        SET DEF CYL ADDRESSES COUNT AP117620
                    AK055 LD   L2 BUFFR+5   FETCH A DEF CYL ADDRESS     AP117630
                          S     3 AZ918-E   TEST FOR AND BRANCH IF      AP117640
                          BSC  L  ER012,Z-  *INVALID  (GT /0658)        AP117650
                          MDX   2 1         INCR CYL CNT, SKIP IF ZERO  AP117660
                          MDX     *+1                                   AP117670
                          MDX     AK060     LAST DEF CYL ADDRESS BRANCH AP117680
                          LD   L2 BUFFR+4   FETCH DEF CYL ADDRESS AGAIN AP117690
                          S    L2 BUFFR+5   TEST FOR AND BRANCH IF      AP117700
                          BSC  L  ER012,Z-  *GT NEXT DEF CYL ADDRESS    AP117710
                    AK060 LD   L2 BUFFR+4   FETCH DEF CYL ADDRESS       AP117720
                          STO  L2 $DCYL+2   *AND STORE TO COMMA         AP117730
                          STO  L2 DCYL1+2   *AND SYS LOADER COMM AREA   AP117740
                          MDX   2 0         SKIP IF LAST ADDR PROCESSED AP117750
                          MDX     AK055     BR TO FETCH NEXT DEF CYL    AP117760
                    *                                                   AP117770
                    * SAVE DCOM ITEMS FOR PHASE 2                       AP117780
                    *                                                   AP117790
                          LD    3 AZ957-E   FETCH DCOM SECTOR ADDRESS   AP117800
                          STO  L  BUFFR+1   *AND STORE TO I/O BUFFER    AP117810
                          BSI  L  FETCH     BRANCH TO FETCH DCOM SECTOR AP117820
                    *                                                   AP117830
                          LDX   1 -5        SET CARTRIDGE ID COUNT      AP117840
                          LDX  L2 BUFFR+2   XR2 PTS TO 1ST WD OF BFR2-3 AP117850
                    AK065 LD   L  CARID     FETCH CARTRIDGE ID          AP117860
                    *                                               2-3 AP117870
                          EOR  L2 #CIDN     TEST FOR AND BRANCH IF      AP117880
                          BSC  L  AK070,+-  *MATCH FOUND IN DCOM        AP117890
                          MDX   2 1         POINT TO NEXT DCOM WORD     AP117900
                          MDX   1 1         INCR ID COUNT, SKIP IF ZERO AP117910
                          MDX     AK065     BR TO TEST NEXT CART ID     AP117920
                          BSI  L  ER012     NO MATCH, BR TO  PRINT MSG  AP117930
                    *                                                   AP117940
                    AK070 LD    2 #CIBA     SAVE                        AP117950
                          STO  L  CIBFR     *SECTOR ADDR OF CIB         AP117960
                          LD    2 #FPAD     FETCH FILE PROTECT ADDRESS  AP117970
                          S     2 #ULET     SAVE                        AP117980
                          STO  L  SHIFT     *NO. OF SECTORS TO SHIFT,   AP117990
                          LD    2 #ULET                                 AP118000
                          STO  L  LET00     *OLD LET SECTOR ADDRESS,    AP118010
                          LD    2 #SCRA                                 AP118020
                          STO  L  ASCRA     *SCRA SECTOR ADDRESS,       AP118030
                          LD    2 #FLET                                 AP118040
                          SLA     4                                     AP118050
                          SRA     4                                     AP118060
                          STO  L  FLETI     *FIXED AREA INDICATOR       AP118070
                          LD    2 #CSHN                                 AP118080
                          STO  L  CAREA     *AND CUSHION SIZE FOR PH 2  AP118090
                          LD   L  LMODE     TEST FOR AND BRANCH         AP118100
                          BSC  L  AA040,-   *IF A RELOAD FUNCTION       AP118110
                    *                                                   AP118120
                    * CLEAR DCOM AND SLET SECTORS ON INITIAL LOAD ONLY  AP118130
                    *                                                   AP118140
                          BSI  L  AK074     BRANCH TO CLEAR 'BUFFR'     AP118150
                          LDX  L1 @SLET     SET SECTOR ADDRESS          AP118160
                          STX  L1 BUFFR+1   *OF FIRST SLET SECTOR       AP118170
                          BSI  L  WRITE     BR TO WRITE 1ST SLET SECTOR AP118180
                          MDX  L  BUFFR+1,1 SET SAD OF 2ND SLET SECTOR  AP118190
                          BSI  L  WRITE     BR TO WRITE 2ND SLET SECTOR AP118200
                          MDX  L  BUFFR+1,1 SET SAD OF 3RD SLET SECTOR  AP118210
                          BSI  L  WRITE     BR TO WRITE 3RD SLET SECTOR AP118220
                          BSC  L  AA040     BRANCH TO READ PHASE 2      AP118230
                    *                                                   AP118240
                    AK074 DC      0         ENTRY/RETURN ADDRESS        AP118250
                          LDX  L1 320       *LOOP                       AP118260
                          SRA     16        *CLEARS                     AP118270
                    AK076 STO  L1 BUFFR+1   *'BUFFR'                    AP118280
                          MDX   1 -1        *TO                         AP118290
                          MDX     AK076     *ZEROS                      AP118300
                          BSC  I  AK074     RETURN                      AP118310
                    *                                                   AP118320
                    * 'F' RECORD OF PHASE 2 RECOGNIZED                  AP118330
                    *                                                   AP118340
                    AK080 BSI  L  WRITE     BR TO WRITE PHASE 2 TO DISK AP118350
                          NOP               A WAIT MAY BE PATCHED HERE  AP118360
                          LD      *-1       SET                         AP118370
                          STO   3 AZ949-E   *'SCON' RECORD              AP118380
                          STO   3 AZ933-E   *NEXT INDICATORS ON         AP118390
                          SRA     16        SET INDR TO READ PTTC/8     AP118400
                          STO   3 AZ952-E   *FROM NEXT TAPE             AP118410
                    *                                                   AP118420
                    * DETERMINE SYSTEM CORE SIZE                        AP118430
                    *                                                   AP118440
                          LDX   2 0         SET ADDRESS OF LOCATION 0   AP118450
                          STX  L2 0         *IN LOCATION 0              AP118460
                          LD   L  AK908     FETCH MAX ADDR OF MIN CORE  AP118470
                          MDX     AK100+1   SKIP NEXT INSTRUCTION       AP118480
                    AK100 LD      AK110+1   FETCH NEXT CORE SIZE ADDR   AP118490
                          SLA     1         MULTIPLY BY TWO             AP118500
                          STO     AK110+1   *AND STORE THE ADDRESS      AP118510
                    AK110 STO  L  *-*       STORE CORE ADDR IN ADDRESS  AP118520
                          STO  L  SCORE     SAVE ACTUAL CORE SIZE       AP118530
                          BSC  L  AK120,-   BRANCH IF CORE SIZE LT 32K  AP118540
                          LD    3 AZ911-E   FETCH NO. OF SECTORS        AP118550
                          MDX     AK130     BRANCH TO STORE             AP118560
                    AK120 S    L  AK909     SUBTRACT MINIMUM CORE SIZE  AP118570
                          SRT     16        SHIFT TO EXTENSION          AP118580
                          D     3 AZ920-E   DIVIDE BY SECTOR SIZE       AP118590
                    AK130 A     3 AZ901-E   INCREMENT BY ONE AND        AP118600
                          STO  L  SSBFR     *SAVE NO. OF SCTRS/FLET BFR AP118610
                          LD   L  0         FETCH CONTENTS OF LOC 0     AP118620
                          BSC     +-        SKIP IF NON-ZERO            AP118630
                          MDX     AK100     BR TO TRY NEXT CORE INCR    AP118640
                          BSC  L  AA040     BRANCH TO READ NEXT RECORD  AP118650
                          HDNG    MISCELLANEOUS SUBROUTINES             AP118660
                    *************************************************** AP118670
                    *                                                   AP118680
                    * PROCESS THE CHECKSUM                              AP118690
                    *                                                   AP118700
                    CKSUM DC      0         ENTRY/RETURN ADDRESS        AP118710
                    CK100 LD   L  AA902+1   FETCH WORD 2                AP118720
                          BSC  I  CKSUM,+-  RETURN IF NO CHECKSUM       AP118730
                          MDX  L  CK900,1   INCREMENT THE SEQUENCE NO.  AP118740
                    CK200 LDX  L2 *-*       XR2 = NO. WORDS PER RECORD  AP118750
                          LD      CK900     FETCH SEQUENCE NUMBER       AP118760
                    CK250 A    L2 AA902-1   ADD A WORD                  AP118770
                          BSC     C         SKIP IF NO CARRY            AP118780
                          A     3 AZ901-E   ADD ONE                     AP118790
                          MDX   2 -1        DECR WORD CNT, SKIP IF ZERO AP118800
                          MDX     CK250     BRANCH TO ADD NEXT WORD     AP118810
                          S     3 AZ901-E   TEST FOR AND                AP118820
                          BSC  I  CKSUM,+-  *RETURN IF BLANK RECORD     AP118830
                    CK300 MDX     CK400     'NOP' IF SEQUENCE ERROR     AP118840
                    *                                                   AP118850
                          LDX  L1 MSG01+1   POINT TO ERROR MESSAGE E 01 AP118860
                          LDX  I2 MSG01     FETCH WORD CNT OF MSG E 01  AP118870
                          LD      CK200+1   GET WORDCOUNT           2-9 AP118871
                          SLA     1         GET FRAMECOUNT          2-9 AP118872
                          A     3 AZ902-E   ADD 2 FRAMES FOR WC     2-9 AP118873
                          STO   3 AZ913-E   STORE FOR DISPLAY       2-9 AP118874
                          BSI  L  CNPTR     BRANCH TO PRINT THE MESSAGE AP118880
                          MDX  L  CK900,-1  DECREMENT SEQUENCE NUMBER   AP118890
                          NOP               AVOID POSSIBLE SKIP         AP118900
                          BSC  L  AA040     BRANCH TO READ NEXT RECORD  AP118910
                    *                                                   AP118920
                    CK400 EOR   3 AZ931-E   COMPLIMENT AND STORE        AP118930
                          STO     CK900     *STORE CHECKSUM             AP118940
                          LD    3 AZ921-E   CANCEL                      AP118950
                          STO     CK300     *RESET ABILITY              AP118960
                          MDX     CK100     BRANCH TO PROCESS AGAIN     AP118970
                    *                                                   AP118980
                    * CONSTANTS AND WORK AREAS                          AP118990
                    *                                                   AP119000
                    CK900 DC      *-*       SEQUENCE NUMBER             AP119010
                    *                                                   AP119020
                    *************************************************** AP119030
                    *                                                   AP119040
                    * SUBROUTINE TO CALCULATE CHECKSUM OF SLET AND      AP119050
                    * RELOAD TABLE (EXCLUDING LAST WORD OF RELOAD TBL)  AP119060
                    *                                                   AP119070
                    CK500 DC      0         ENTRY/RETURN ADDRESS        AP119080
                          LDD     CK910     SET UP BUFFER TO START      AP119090
                          STD  L  BUFR1     *READING AT 1ST SCTR SLET   AP119100
                          SLA     16        CLEAR CALCULATED            AP119110
                          STO     CK912     *CHECKSUM                   AP119120
                          LDX   1 -4        4 SECTORS TO CHECKSUM       AP119130
                          STX   1 CK914                                 AP119140
                    CK510 MDX  L0 BUFR1+1,1 INCREMENT SECTOR ADDRESS    AP119150
                          BSI  L  FTCH1     READ SECTOR FROM DISK       AP119160
                          LDX  L1 @SCNT-1   WORDS - 1 PER SECTOR        AP119170
                          LD      CK912     RESTORE CHECKSUM TO ACC     AP119180
                    CK520 A    L1 BUFR1+1   CALCULATE CHECKSUM          AP119190
                          BSC     C         IF CARRY                    AP119200
                          A     3 AZ901-E   *ADD 1 TO CHECK SUM         AP119210
                          MDX   1 -1        STEP THROUGH SECTOR         AP119220
                          MDX     CK520     BR TO LOOP IN SECTOR        AP119230
                          STO     CK912     SAVE CHECK SUM              AP119240
                          MDX  L0 CK914,1   INCREMENT SECTOR LOOP COUNT AP119250
                          MDX     CK530     BR, IS NOT RELOAD SECTOR    AP119260
                          BSC  I  CK500     RETURN                      AP119270
                    *                                                   AP119280
                    * INCLUDE LAST WORD OF SECTOR IN ALL BUT RELOAD     AP119290
                    * SECTOR                                            AP119300
                    *                                                   AP119310
                    CK530 A    L  BUFR1+1+@SCNT LAST WORD OF SECTOR     AP119320
                          BSC     C         IF CARRY                    AP119330
                          A     3 AZ901-E   *ADD 1 TO CHECK SUM         AP119340
                          STO     CK912     SAVE CHECK SUM              AP119350
                          MDX     CK510     BR TO LOOP 4 SECTORS        AP119360
                    *                                                   AP119370
                    * CONSTANTS AND WORK AREAS                          AP119380
                    *                                                   AP119390
                          BSS  E  0         FORCE EVEN ADDRESS          AP119400
                    CK902 DC      @SCNT     WORD COUNT 1 SECTOR         AP119410
                          DC      @DCOM     SECTOR ADDRESS OF DCOM      AP119420
                          BSS  E  0                                     AP119430
                    CK910 DC      @SCNT     WORD COUNT 1 SECTOR         AP119440
                          DC      @SLET-1   SECTOR ADDRESS OF SLET - 1  AP119450
                    CK912 DC      *-*       CALCULATED CHECKSUM         AP119460
                    CK913 DC      *-*       OLD CHECKSUM FROM TABLE     AP119470
                    CK914 DC      *-*       SECTOR LOOP COUNTER         AP119480
                    CK915 DC      -160      NUMBER ENTRIES IN OLD SLET  AP119490
                    CK916 DC      @SCNT     WORD COUNT 1 SECTOR         AP119500
                          DC      @SLET+2   LAST SCTR ADDR SLET TABLE   AP119510
                    CK918 DC      *-*       SAVE MAINLINE BUFFER        AP119520
                          DC      *-*       *PARAMETERS HERE            AP119530
                    CK920 DC      2*@SCNT   WORDS IN 2 SLET SECTORS     AP119540
                          DC      @SLET     SECTOR ADDRESS OF SLET      AP119550
                    CK922 DC      *-*       STORAGE FOR XR1 'TO'   ADDR AP119560
                    CK923 DC      *-*       STORAGE FOR XR2 'FROM' ADDR AP119570
                    *************************************************** AP119580
                    *                                                   AP119590
                    * ENTERED ON RELOAD. CALCULATE AND CHECK            AP119600
                    * SLET/RELOAD TABLE CHECKSUM                        AP119610
                    * AND FILE PROTECT ADDRESS.                         AP119620
                    *                                                   AP119630
                    CK600 DC      0         ENTRY/RETURN ADDRESS        AP119640
                          LDD     CK902     FETCH DCOM                  AP119650
                          STD  L  BUFR1     *FROM                       AP119660
                          BSI  L  FTCH1     *DISK                       AP119670
                          LDX  L2 BUFR1+2   POINT TO FIRST WORD         AP119680
                          LD    2 #FPAD     SAVE FILE                   AP119690
                          STO  L  FPADR     *PROTECT ADDRESS            AP119700
                          S     3 AZ916-E   TEST FOR AND BR IF INADEQ   AP119710
                          BSI  L  ER014,-   *DISK AREA TO SAVE PHASE 2  AP119720
                          BSI  L  CK500     BR TO CALCULATE CHECKSUM    AP119730
                          LD   L  BUFR1+1+@SCNT LOAD OLD CHECKSUM       AP119740
                          STO     CK913     SAVE OLD CHECKSUM           AP119750
                          BSC  I  CK600,+-  RETURN IF NOT CHECKSUM      AP119760
                          EOR     CK912     COMPARE WITH CALC CHECKSUM  AP119770
                          BSI  L  ER019,Z   BR IF INVALID CHECKSUM      AP119780
                          BSC  I  CK600     RETURN                      AP119790
                    *                                                   AP119800
                    *************************************************** AP119810
                    *                                                   AP119820
                    * HISTORIC COMPATABILITY.....                       AP119830
                    * COMPRESS OUT GAPS IN SLET TABLE AND ZERO NEW      AP119840
                    * THIRD SECTOR OF SLET.                             AP119850
                    *                                                   AP119860
                    CK630 DC      0         ENTRY/RETURN ADDRESS        AP119870
                          LDD  L  BUFFR     SAVE 'BUFFR' WORD COUNT     AP119880
                          STD     CK918     *AND SECTOR ADDRESS         AP119890
                          LDD     CK920     SET WORD COUNT AND SECTOR   AP119900
                          STD  L  BUFFR     *ADDR TO TWO SLET SECTORS   AP119910
                          BSI  L  FETCH     BR TO READ 1ST 2 SLET SCTRS AP119920
                    *                                                   AP119930
                          LDX  L1 BUFFR+2   PT TO 'TO' ADDRESS IN SLET  AP119940
                          LDX  L2 BUFFR+2   PT TO 'FROM' ADDR IN SLET   AP119950
                    CK640 LDD   2 0         FETCH 1ST 2 WDS OF SLET ENT AP119960
                          BSC  L  CK650,+-  BRANCH IF EMPTY ENTRY       AP119970
                          STD   1 0         SHIFT TO BOTTOM OF TABLE    AP119980
                          LDD   2 2         *(MAY OVERLAY ITSELF)       AP119990
                          STD   1 2                                     AP120000
                          MDX   1 4         ADVANCE TO   ADDR 1 ENTRY   AP120010
                    CK650 MDX   2 4         ADVANCE FROM ADDR 1 ENTRY   AP120020
                          MDX  L0 CK915,1   INCR ENTRY COUNTER          AP120030
                          MDX     CK640     LOOP UNTIL 2 SECTORS TESTED AP120040
                    *                                                   AP120050
                          STX   2 CK923     SAVE FROM ADDR              AP120060
                    CK660 STX   1 CK922     SAVE TO   ADDR              AP120070
                          LD      CK922     LOAD TO   ADDR              AP120080
                          S       CK923     SUB  FROM ADDR              AP120090
                          BSC  L  CK670,-   BR IF END OF SLET REACHED   AP120100
                          SLT     32        ZERO TAIL                   AP120110
                          STD   1 0         *OF SLET                    AP120120
                          STD   1 2         *TABLE                      AP120130
                          MDX   1 4         ADVANCE TO POINTER 1 ENTRY  AP120140
                          MDX     CK660     LOOP UNTIL END OF 2 SECTORS AP120150
                    *                                                   AP120160
                    CK670 BSI  L  WRITE     UPDATE SLET TABLE           AP120170
                          LDD     CK918     RESTORE 'BUFFR' WORD COUNT  AP120180
                          STD  L  BUFFR     *AND SECTOR ADDRESS         AP120190
                    *                                                   AP120200
                          LDD     CK916     SET WORD COUNT AND SCTR     AP120210
                          STD  L  BUFFR     *ADDR FOR END SLET TABLE    AP120220
                          LDX  L1 @SCNT     CLEAR                       AP120230
                          SRA     16        *'BUFFR'                    AP120240
                    CK680 STO  L1 BUFFR+1   *TO                         AP120250
                          MDX   1 -1        *ZEROS                      AP120260
                          MDX     CK680                                 AP120270
                          BSI  L  WRITE     WRITE LAST SLET SECTOR      AP120280
                          BSC  I  CK630     RETURN                      AP120290
                    *                                                   AP120300
                    *************************************************** AP120310
                    *                                                   AP120320
                    * READ A SECTOR FROM DISK INTO 'BUFR1'              AP120330
                    *                                                   AP120340
                    FTCH1 DC      0         ENTRY/RETURN ADDRESS        AP120350
                          LDD     F1900     FETCH FUNC CODE, I/O ADDR   AP120360
                          BSI  L  DZ000     BRANCH TO READ A SECTOR     AP120370
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  AP120380
                          MDX     *-3       BR TO TEST READ COMPLETE    AP120390
                          BSC  I  FTCH1     RETURN                      AP120400
                    *                                                   AP120410
                    * CONSTANTS AND WORK AREAS                          AP120420
                    *                                                   AP120430
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   AP120440
                    F1900 DC      /0000     READ FUNCTION CODE          AP120450
                          DC      BUFR1     ADDRESS OF I/O AREA         AP120460
                    *                                                   AP120470
                    *************************************************** AP120480
                    *                                                   AP120490
                    * READ FROM DISK INTO BUFFR                         AP120500
                    *                                                   AP120510
                    FETCH DC      0         ENTRY/RETURN ADDRESS        AP120520
                          LD    3 AZ938-E   RETURN                      AP120530
                          BSC  I  FETCH,Z   *IF INHIBIT SWITCH ON       AP120540
                          LDD     FE900     FETCH FUNC CODE/I/O ADDRESS AP120550
                          BSI  L  DZ000     BRANCH TO DISK SUBROUTINE   AP120560
                          MDX  L  $DBSY,0   SKIP NEXT IF OP COMPLETE    AP120570
                          MDX     *-3       BRANCH TO TEST OP COMPLETE  AP120580
                          BSC  I  FETCH     RETURN                      AP120590
                    *                                                   AP120600
                    * CONSTANTS AND WORK AREAS                          AP120610
                    *                                                   AP120620
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   AP120630
                    FE900 DC      /0000     READ FUNCTION CODE          AP120640
                          DC      BUFFR     ADDRESS OF I/O BUFFER       AP120650
                    *                                                   AP120660
                    *************************************************** AP120670
                    *                                                   AP120680
                    * PROCESS MOD NUMBER ON PHASE ID RECORD             AP120690
                    *                                                   AP120700
                    MODNO DC      0         ENTRY/RETURN ADDRESS        AP120710
                          LD      MO900     IF VERSION AND MOD NUMBER   AP120720
                          BSC  I  MODNO,Z   *ALREADY SET, RETURN        AP120730
                    MO090 LDX  L1 AA904+66  VERSION NUMBER              AP120740
                          LDX   2 2          FROM COLUMNS 67 AND 68     AP120750
                          BSI  L  EBTDC      EBCDIC TO DECIMAL          AP120760
                    *                                                   AP120770
                          NOP                FOR DEBUG STOP             AP120780
                          LD    3 AZ972-E    LOAD RESULT                AP120790
                    MO200 NOP               MAY BE AN 'MDX     M0300'   AP120800
                          SLA     8         SHIFT VERSION TO LEFT HALF  AP120810
                          STO  L  VERSN     *AND SAVE                   AP120820
                          S     3 AZ915-E   TEST FOR AND                AP120830
                          BSI  L  ER015,+Z  *BR IF VERSION INVALID      AP120840
                          MDX  L  MO090+1,4 POINT TO COLUMN 71          AP120850
                          LD    3 AZ962-E   SET INSTRUCTION             AP120860
                          STO     MO200     *TO STORE MOD NUMBER        AP120870
                          MDX     MODNO+1   BRANCH TO FETCH MOD NUMBER  AP120880
                    *                                                   AP120890
                    MO300 OR   L  VERSN     'OR' IN VERSION NUMBER      AP120900
                          STO  L  VERSN     STORE VERSION-MOD NUMBER    AP120910
                          STX     MO900     INDICATE VERSION-MOD DONE   AP120920
                          BSC  I  MODNO     RETURN                      AP120930
                    *                                                   AP120940
                    * CONSTANTS AND WORK AREAS                          AP120950
                    *                                                   AP120960
                    MO900 DC      *-*       INDICATES VERSION NO. SET   AP120970
                    *                                                   AP120980
                    *************************************************** AP120990
                    *                                                   AP121000
                    *     THIS SECTION CONVERTS SELECTED EBCDIC INPUT   AP121010
                    *     TO HEXADECIMAL NUMBERS.  UP TO 4 EBC CHARS    AP121020
                    *     CAN BE CONTAINED IN 1 WORD OF OUTPUT.         AP121030
                    *                                                   AP121040
                    *     XR1 POINTS TO WORDS TO CONVERT.  XR2 IS LOOP  AP121050
                    *     COUNTER.  OUTPUT IS CONTAINED IN AZ972.       AP121060
                    *                                                   AP121070
                    *************************************************** AP121080
                    *                                                   AP121090
                    EBTDC DC      0          ENTRY/RETURN               AP121100
                          SLA     16                                    AP121110
                          STO   3 AZ972-E    CLEAR BEFORE USING         AP121120
                    EB020 LD    1 0                                     AP121130
                          S       EB901      SUBTRACT EBCDIC ZERO       AP121140
                          STO     EB902      TEMPORARY STORAGE          AP121150
                          LD    3 AZ910-E    MULTIPLY BY 10 FOR HEX     AP121160
                          M     3 AZ972-E                               AP121170
                          SLT     16                                    AP121180
                          A       EB902                                 AP121190
                          STO   3 AZ972-E                               AP121200
                          MDX   1 1          BUMP IOAR ADDRESS          AP121210
                          MDX   2 -1         DECR LOOP COUNTER          AP121220
                          MDX     EB020      REPEAT                     AP121230
                          BSC  I  EBTDC                                 AP121240
                    *                                                   AP121250
                    EB901 DC      /00F0      EBCDIC ZERO                AP121260
                    EB902 DC      *-*        WORK AREA                  AP121270
                    *                                                   AP121280
                    *************************************************** AP121290
                    *                                                   AP121300
                    *     THIS SECTION PACKS THE EBCDIC CODE FROM WDS   AP121310
                    *     3 AND 4 OF BUFFER AA904.  THEY WILL BE        AP121320
                    *     COMPARED WITH A CONSTANT TO FIND RCD TYPE.    AP121330
                    *                                                   AP121340
                    *************************************************** AP121350
                    COM34 DC      *-*                                   AP121360
                          LDD  L  AA904+2    EVEN ADDRESS               AP121370
                          SLA     8          DATE COMES RIGHT JUSTIFIED AP121380
                          STO     TEM        WORK AREA                  AP121390
                          RTE     16                                    AP121400
                          OR      TEM        RETURN WITH 2 EBCDIC       AP121410
                          BSC  I  COM34      *CHARACTERS IN ACCUMULATOR AP121420
                    *                                                   AP121430
                    TEM   DC      *-*        SHARED WORK AREA           AP121440
                    *                                                   AP121450
                    *************************************************** AP121460
                    *                                                   AP121470
                    *     THIS SUBROUTINE PACKS LEFT-JUSTIFIED 8-BIT    AP121480
                    *     BINARY DATA FROM PAPER TAPE FRAMES INTO 16    AP121490
                    *     BITS PER WORD.                                AP121500
                    *     XR3 CONTAINS FRAME COUNT                      AP121510
                    *     XR2 POINTS TO COMPRESSED BUFFER               AP121520
                    *     XR1 POINTS TO SOURCE BUFFER                   AP121530
                    *                                                   AP121540
                    *************************************************** AP121550
                    PACK0 DC      *-*                                   AP121560
                          STX   3 PA030+1                               AP121570
                          LDX  I3 AA906      FRAME COUNT -ALWAYS EVEN-  AP121580
                          LDX  L1 AA906+1    ADDRESS OF 1ST DATA LOC    AP121590
                          LDX  L2 AA902                                 AP121600
                    PA020 LD    1 1          LOAD 2ND HALF OF 16-BIT WD AP121610
                          SRA     8                                     AP121620
                          STO     TEM                                   AP121630
                          LD    1 0                                     AP121640
                          OR      TEM                                   AP121650
                          STO   2 0          STORE A PACKED WORD        AP121660
                          MDX   2 1                                     AP121670
                          MDX   1 2                                     AP121680
                          MDX   3 -2                                    AP121690
                          MDX     PA020      LOOP                       AP121700
                    PA030 LDX  L3 *-*        RESTORE POINTER            AP121710
                          BSC  I  PACK0      RETURN                     AP121720
                    *************************************************** AP121730
                    *                                                   AP121740
                    * DETERMINE RELATIVE ADDRESS FROM ADDRESS           AP121750
                    * OF FIRST WORD IN A SECTOR                         AP121760
                    *                                                   AP121770
                    RELAD DC      0         ENTRY/RETURN ADDRESS        AP121780
                    RE100 S     3 AZ901-E   SUBTRACT ONE FROM ADDRESS   AP121790
                          MDX  L  AZ934,1   INCR CORRELATION FACTOR     AP121800
                          BSC  L  RE100,Z   BR IF ADDR NOT REDUCED TO Z AP121810
                          LD    3 AZ934-E   FETCH AND SAVE              AP121820
                          STO   3 AZ945-E   *NEW CORRELATION FACTOR     AP121830
                          LD    3 AZ924-E   STORE SKIP INSTRUCTION      AP121840
                          STO  L  AJ040     *IN TYPE 'A' PROC SUBR      AP121850
                          LD    1 1         FETCH ORIGINAL ADDRESS      AP121860
                          A    L  AZ902     ADD TWO                     AP121870
                          BSC  I  RELAD     RETURN                      AP121880
                    *                                                   AP121890
                    *************************************************** AP121900
                    *                                                   AP121910
                    * SAVE INDEX REGISTERS                              AP121920
                    *                                                   AP121930
                    SAVXR DC      0         ENTRY/RETURN ADDRESS        AP121940
                          STX   1 RS100+1   SAVE XR1                    AP121950
                          STX   2 RS200+1   SAVE XR2                    AP121960
                          STX   3 RS300+1   SAVE XR3                    AP121970
                          BSC  I  SAVXR     RETURN                      AP121980
                    *                                                   AP121990
                    * RESTORE INDEX REGISTERS                           AP122000
                    *                                                   AP122010
                    RSTXR DC      0         ENTRY/RETURN ADDRESS        AP122020
                    RS100 LDX  L1 *-*       RESTORE XR1                 AP122030
                    RS200 LDX  L2 *-*       RESTORE XR2                 AP122040
                    RS300 LDX  L3 *-*       RESTORE XR3                 AP122050
                          BSC  I  RSTXR     RETURN                      AP122060
                    *                                                   AP122070
                    *************************************************** AP122080
                    *                                                   AP122090
                    * WRITE THE RESIDENT IMAGE AND                      AP122100
                    * THE SYSTEM LOADER PHASE 2 TO THE DISK             AP122110
                    *                                                   AP122120
                    WRITE DC      0         ENTRY/RETURN ADDRESS        AP122130
                          LD   L  BUFFR+1   RETURN IF                   AP122140
                          BSC  I  WRITE,+-  *SECTOR ADDRESS = @IDAD     AP122150
                          LD    3 AZ940-E   TEST FOR AND                AP122160
                          BSC  L  WR100,+Z  *BRANCH IF AN INITIAL LOAD  AP122170
                          LD   L  BUFFR+1   FETCH SECTOR ADDRESS        AP122180
                          S     3 AZ917-E   TEST FOR AND BRANCH         AP122190
                          BSC  L  WR100,Z   *IF NOT OVERLAY 0/1 SECTOR  AP122200
                          LD   L  BUFFR+2   FETCH OVERLAY IDENTIFIER    AP122210
                          S     3 AZ901-E   TEST FOR AND RETURN         AP122220
                          BSC  I  WRITE,+-  *IF OVERLAY 1               AP122230
                    *                                                   AP122240
                    * WRITE TO DISK FROM BUFFR                          AP122250
                    *                                                   AP122260
                    WR100 NOP               A WAIT MAY BE PATCHED HERE  AP122270
                          LDD     WR900     FETCH FUNC CODE/I/O ADDRESS AP122280
                          BSI  L  DZ000     BRANCH TO DISK SUBROUTINE   AP122290
                          MDX  L  $DBSY,0   SKIP NEXT IF OP COMPLETE    AP122300
                          MDX     *-3       BRANCH TO TEST OP COMPLETE  AP122310
                          BSC  I  WRITE     RETURN                      AP122320
                    *                                                   AP122330
                    * CONSTANTS AND WORK AREAS                          AP122340
                    *                                                   AP122350
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   AP122360
                    WR900 DC      /0001     WRITE FUNCTION CODE         AP122370
                          DC      BUFFR     ADDRESS OF I/O BUFFER       AP122380
                          HDNG    PRINT ERROR MESSAGES                  AP122390
                    *                                                   AP122400
                    * PRINT ERROR MESSAGE AND BRANCH TO READ            AP122410
                    * THE NEXT RECORD                                   AP122420
                    *                                                   AP122430
                    ER002 DC      0         ENTRY/RETURN ADDRESS        AP122440
                          LDX  L1 MSG02+1   POINT TO ERROR MESSAGE E 02 AP122450
                          LDX  I2 MSG02     FETCH WORD CNT OF MSG E 02  AP122460
                          MDX     ER100     BRANCH TO PRINT THE MESSAGE AP122470
                    *                                                   AP122480
                    ER003 DC      0         ENTRY/RETURN ADDRESS        AP122490
                          LDX  L1 MSG03+1   POINT TO ERROR MESSAGE E 03 AP122500
                          LDX  I2 MSG03     FETCH WORD CNT OF MSG E 03  AP122510
                          MDX     ER100     BRANCH TO PRINT THE MESSAGE AP122520
                    *                                                   AP122530
                    ER004 DC      0         ENTRY/RETURN ADDRESS        AP122540
                          LDX  L1 MSG04+1   POINT TO ERROR MESSAGE E 04 AP122550
                          LDX  I2 MSG04     FETCH WORD CNT OF MSG E 04  AP122560
                          MDX     ER100     BRANCH TO PRINT THE MESSAGE AP122570
                    *                                                   AP122580
                    ER015 DC      0         ENTRY/RETURN ADDRESS        AP122590
                          LDX  L1 MSG15+1   POINT TO ERROR MESSAGE E 15 AP122600
                          LDX  I2 MSG15     FETCH WORD CNT OF MSG E 15  AP122610
                          MDX     ER100     BRANCH TO PRINT THE MESSAGE AP122620
                    *                                                   AP122630
                    ER017 DC      0         ENTRY/RETURN ADDRESS        AP122640
                          LDX  L1 MSG17+1   POINT TO ERROR MESSAGE E 17 AP122650
                          LDX  I2 MSG17     FETCH WORD CNT OF MSG E 17  AP122660
                    ER100 BSI  L  CNPTR     PRINT THE MESSAGE           AP122670
                          NOP               A WAIT MAY BE PATCHED HERE  AP122680
                          BSC  L  AA040     BRANCH TO READ NEXT RECORD  AP122690
                    *                                                   AP122700
                    ER018 DC      0         ENTRY/RETURN ADDRESS        AP122710
                          LDX  L1 MSG18+1   POINT TO ERROR MESSAGE E 18 AP122720
                          LDX  I2 MSG18     FETCH WORD CNT OF MSG E 18  AP122730
                          BSI  L  CNPTR     PRINT THE MESSAGE           AP122740
                          BSC  I  ER018     RETURN                      AP122750
                    *                                                   AP122760
                    ER019 DC      0         ENTRY/RETURN ADDRESS        AP122770
                          LDX  L1 MSG19+1   POINT TO ERROR MESSAGE E 19 AP122780
                          LDX  I2 MSG19     FETCH WORD CNT OF MSG E 19  AP122790
                          BSI  L  CNPTR     PRINT THE MESSAGE           AP122800
                          BSC  I  ER019     RETURN                      AP122810
                    *                                                   AP122820
                    * ERROR MESSAGES FROM SYSTEM LOADER PHASE 1 ONLY    AP122830
                    *                                                   AP122840
                    MSG11 DC      MSG12-*   WORD COUNT OF MESSAGE E 11  AP122850
                          DMES    'RE 11 INVALID DRIVE NO.'R'E          AP122860
                    MSG12 DC      MSG13-*   WORD COUNT OF MESSAGE E 12  AP122870
                          DMES    'RE 12 ID SECTOR DATA INVALID'R'E     AP122880
                    MSG13 DC      MSG14-*   WORD COUNT OF MESSAGE E 13  AP122890
                          DMES    'RE 13 CONFIG TAPE ERROR'R'E          AP122900
                    MSG14 DC      MSG15-*   WORD COUNT OF MESSAGE E 14  AP122910
                          DMES    'RE 14 FILE PROTECT ADDR TOO HIGH'R'E AP122920
                    MSG15 DC      MSG16-*   WORD COUNT OF MESSAGE E 15  AP122930
                          DMES    'RE 15 PHID RECORD ERROR'R'E          AP122940
                    MSG16 DC      MSG17-*   WORD COUNT OF MESSAGE E 16  AP122950
                          DMES    'RE 16 INITIAL LOAD THE CARTRIDGE'R'E AP122960
                    MSG17 DC      MSG18-*   WORD COUNT OF MESSAGE E 17  AP122970
                          DMES    'RE 17 ERROR IN LOAD MODE RECORD'R'E  AP122980
                    MSG18 DC      MSG19-*   WORD COUNT OF MESSAGE E 18  AP122990
                          DMES    'RE 18 PAPER TAPE ERROR'R'E           AP123000
                    MSG19 DC      MSG20-*   WORD COUNT OF MESSAGE E 19  AP123010
                          DMES    'RE 19 INVALID SLET/RELOAD TABLE '    AP123020
                          DMES    CHECKSUM'R'E                          AP123030
                    MSG20 DC      0         E 20 USED BY SYS LDR PH 2   AP123040
                    *                                                   AP123050
                    * PRINT ERROR MESSAGES WITH NO RECOVERY             AP123060
                    *                                                   AP123070
                    ER005 DC      0         ENTRY/RETURN ADDRESS        AP123080
                          LDX  L1 MSG05+1   POINT TO ERROR MESSAGE E 05 AP123090
                          LDX  I2 MSG05     FETCH WORD CNT OF MSG E 05  AP123100
                          MDX     ER200     BRANCH TO PRINT THE MESSAGE AP123110
                    *                                                   AP123120
                    ER012 DC      0         ENTRY/RETURN ADDRESS        AP123130
                          LDX  L1 MSG12+1   POINT TO ERROR MESSAGE E 12 AP123140
                          LDX  I2 MSG12     FETCH WORD CNT OF MSG E 12  AP123150
                          MDX     ER200     BRANCH TO PRINT THE MESSAGE AP123160
                    *                                                   AP123170
                    ER013 DC      0         ENTRY/RETURN ADDRESS        AP123180
                          LDX  L1 MSG13+1   POINT TO ERROR MESSAGE E 13 AP123190
                          LDX  I2 MSG13     FETCH WORD CNT OF MSG E 13  AP123200
                          MDX     ER200     BRANCH TO PRINT THE MESSAGE AP123210
                    *                                                   AP123220
                    ER014 DC      0         ENTRY/RETURN ADDRESS        AP123230
                          LDX  L1 MSG14+1   POINT TO ERROR MESSAGE E 14 AP123240
                          LDX  I2 MSG14     FETCH WORD CNT OF MSG E 14  AP123250
                          MDX     ER200     BRANCH TO PRINT THE MESSAGE AP123260
                    *                                                   AP123270
                    ER016 DC      0         ENTRY/RETURN ADDRESS        AP123280
                          LDX  L1 MSG16+1   POINT TO ERROR MESSAGE E 16 AP123290
                          LDX  I2 MSG16     FETCH WORD CNT OF MSG E 16  AP123300
                    ER200 STX   1 ER310+1   SAVE XR1                    AP123310
                          STX   2 ER320+1   SAVE XR2                    AP123320
                    ER300 BSI     CNPTR     PRINT THE MESSAGE           AP123330
                          NOP               A WAIT MAY BE PATCHED HERE  AP123340
                    ER310 LDX  L1 *-*       RESTORE XR1                 AP123350
                    ER320 LDX  L2 *-*       RESTORE XR2                 AP123360
                          MDX     ER300     NO RECOVERY, PRINT AGAIN    AP123370
                    *                                                   AP123380
                    * BRANCH TO CONSOLE PRINTER SUBROUTINE              AP123390
                    *                                                   AP123400
                    CNPTR DC      0         ENTRY/RETURN ADDRESS        AP123410
                          BSI  L  WRTYZ     BR TO CONSOLE PRINTER SUBR  AP123420
                          LD      CNPTR     FETCH RETURN ADDRESS        AP123430
                          SRT     16        *AND SHIFT TO EXTENSION     AP123440
                          LD    3 AZ913-E   FETCH DISPLAY CODE AND      AP123450
                          BSI  L  $PRET     *BRANCH TO PRE-OP TRAP      AP123460
                          BSC  I  CNPTR     RETURN                      AP123470
                          HDNG    PHASE 1 CONSTANTS AND WORK AREAS      AP123480
                    E     DC      0         FOR EMERGENCY USE ONLY      AP123490
                    AZ901 DC      1         CONSTANT ONE                AP123500
                    AZ902 DC      2         CONSTANT TWO                AP123510
                    AZ903 DC      3         CONSTANT THREE              AP123520
                    AZ904 DC      4         CONSTANT FOUR               AP123530
                    AZ905 DC      5         CONSTANT FIVE               AP123540
                    AZ906 DC      6         CONSTANT SIX                AP123550
                    AZ907 DC      7         CONSTANT SEVEN              AP123560
                    AZ910 DC      10        CONSTANT 10                 AP123570
                    AZ908 DC      15        MAX SYS DEVICE ISS NUMBER   AP123580
                    AZ909 DC      20        MAXIMUM ISS NUMBER          AP123590
                    AZ912 DC      @SCNT     NO. OF WORDS PER SECTOR     AP123600
                    AZ911 DC      89        NO. OF SCTR IN 32K - 4K     AP123610
                    AZ913 DC      -2        DISPLAY CODE                AP123620
                    AZ914 DC      /00FF     MASK OUT LEFT HALF OF WORD  AP123630
                    AZ915 DC      /0200     MASK TO TEST VALID VER/MOD  AP123640
                    AZ916 DC      @P2AD     SECTOR ADDRESS OF PHASE 2   AP123650
                    AZ917 DC      @P2AD+5   SECTOR ADDRESS OF OVERLAY   AP123660
                    AZ918 DC      /658      MAXIMUM DISK ADDRESS        AP123670
                    AZ919 EBC     .DE.      FOR MODE RECORD TEST        AP123680
                    AZ920 DC      /0AA0     MASK                        AP123690
                    AZ921 NOP               'NOP' INSTRUCTION           AP123700
                    AZ922 BSI  L  /7002     'BSI  L' INSTRUCTION        AP123710
                    AZ923 EQU     *-1       READ FUNCTION CODE          AP123720
                    AZ924 MDX     *+1       SKIP INSTRUCTION            AP123730
                    AZ925 MDX     *+2       SKIP INSTRUCTION            AP123740
                    AZ926 DC      /8000     MINUS SIGN MASK             AP123750
                    AZ927 EBC     .ON.      USE TO CK FOR 'SCON' RECORD AP123760
                    AZ928 S    L  /C000     'S    L' INSTRUCTION        AP123770
                    AZ929 EQU     *-1       PHASE ID PROCESSING INDR    AP123780
                    AZ931 DC      /FFFF     MASK TO COMPLEMENT          AP123790
                    AZ932 DC      *-*       BASE SECTOR ADDRESS         AP123800
                    AZ933 DC      *-*       NEXT RCRD EXPECTED INDR     AP123810
                    AZ934 DC      0         CORRELATION FACTOR          AP123820
                    AZ935 DC      *-*       SCTR ADDR OF CURRENT PHASE  AP123830
                    AZ937 DC      *-*       CORE ADDRESS OF DATA WORD   AP123840
                    AZ938 DC      *-*       'FETCH' INHIBIT INDICATOR   AP123850
                    AZ939 DC      *-*       'REQ' RECORD COUNT          AP123860
                    AZ940 DC      *-*       LOAD MODE INDICATOR         AP123870
                    AZ941 DC      *-*       PREVIOUS SECTOR ADDRESS     AP123880
                    AZ942 DC      *-*       RESIDENT IMAGE INDICATOR    AP123890
                    AZ943 DC      *-*       SCTR ADDR OF SCTR IN CORE   AP123900
                    AZ944 DC      *-*       ABS/REL PROGRAM INDICATOR   AP123910
                    AZ945 DC      *-*       CORE ADDRESS CORRELATION    AP123920
                    AZ948 DC      0         SECTOR BREAK INDICATOR      AP123930
                    AZ949 DC      1         NEXT RECORD TYPE INDICATOR  AP123940
                    AZ950 DC      1         'F' RECORD INDICATOR        AP123950
                    AZ952 DC      0         PACKED/UNPACKED BFR INDR    AP123960
                    AZ954 DC      BUFFR     ADDRESS OF DISK I/O BUFFER  AP123970
                    AZ956 DC      RELAD     ADDRESS OF RLTV ADDR SUBR   AP123980
                    AZ957 DC      @DCOM     SECTOR ADDRESS OF DCOM      AP123990
                    AZ958 DC      PAIR1     ADDR OF FIRST PHASE ID PAIR AP124000
                    AZ959 DC      @IDAD     ID SECTOR ADDRESS           AP124010
                    AZ960 DC      @RIAD     RES IMAGE SECTOR ADDRESS    AP124020
                    AZ961 MDX  X  CK400-CK300-1  SKIP INSTRUCTION       AP124030
                    AZ962 MDX  X  MO300-MO200-1  SKIP INSTRUCTION       AP124040
                    *                                                   AP124050
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   AP124060
                    AZ964 DC      *-*       USED TO CALCULATE RELATIVE  AP124070
                          DC      *-*       *DATA WORD LOC IN SCTR BFR  AP124080
                    *                                                   AP124090
                    * RESTORED COMMA WORDS ON RELOAD FUNCTION           AP124100
                    *                                                   AP124110
                    AZ966 DC      *-*       $DREQ                       AP124120
                    AZ967 DC      *-*       $ULET                       AP124130
                    AZ968 DC      *-*       $DZIN                       AP124140
                    AZ969 DC      *-*       $FPAD                       AP124150
                    AZ970 DC      *-*       $DCYL                       AP124160
                    AZ971 EBC     .ID.      TO TEST FOR PHID RECORD     AP124170
                    AZ972 DC      *-*       DEC OUTPUT FROM EBTDC       AP124180
                    AZ973 DC      /000F     MASK BITS 0-11              AP124190
                    AZ974 DC      /B3B0     RESULT OF PTTC BLANK CVRT   AP124200
                    *                                                   AP124210
                    *                                                   AP124220
                          BSS     96        PATCH AREA              2-9 AP124230
                    *                                                   AP124240
                    *                                                   AP124250
                          HDNG    BUFFER AREAS                          AP124260
                    *                                                   AP124270
                          BSS  E  0         START WD CNT ON EVEN LOC    AP124280
                    BUFFR DC      @SCNT     WORD COUNT                  AP124290
                          DC      *-*       SECTOR ADDRESS              AP124300
                    *                                                   AP124310
                    * TEMPORARY LOWER CORE TO BE                        AP124320
                    * OVER-LAYED BY RESIDENT IMAGE                      AP124330
                    *                                                   AP124340
                          DC      $I400                              0C AP124350
                          DC      $STOP                                 AP124360
                          BSS     5                                     AP124370
                          DC      *-*                                13 AP124380
                          BSS     20                                    AP124390
                          DC      *-*                                28 AP124400
                          WAIT                                          AP124410
                          BSC  I  $PRET                                 AP124420
                          DC      $IREQ+1                               AP124430
                          DC      *-*                                   AP124440
                          WAIT                                          AP124450
                          MDX     *-2                                   AP124460
                          BOSC I  $IREQ+1                               AP124470
                          DC      *-*                                32 AP124480
                          BSS     90                                    AP124490
                          DC      *-*                                8D AP124500
                          WAIT                                          AP124510
                          BSC  I  $PST4                                 AP124520
                          DC      *-*                                   AP124530
                          WAIT                                          AP124540
                          BOSC I  $STOP                                 AP124550
                          BSS     47                                    AP124560
                          DC      *-*                                C4 AP124570
                          STD     $I490                                 AP124580
                          STS     $I410                                 AP124590
                          STX   1 $I410+2                               AP124600
                          STX   2 $I410+4                               AP124610
                          XIO     $I492                                 AP124620
                          SLA     2                                     AP124630
                          BSC  L  $I403,-                               AP124640
                          BSI  I  $IREQ                                 AP124650
                          DC      -2                                    AP124660
                          LDX   1 9                                     AP124670
                          XIO     $I494                                 AP124680
                          SLCA  1 9                                     AP124690
                    $I405 BSI  I1 *-*                                   AP124700
                    $I410 LDS     0                                     AP124710
                          LDX  L1 *-*                                   AP124720
                          LDX  L2 *-*                                   AP124730
                          LDD     $I490                                 AP124740
                          BOSC I  $I400                                 AP124750
                    $I490 BSS  E  2                                     AP124760
                    $I492 BSS     1                                     AP124770
                          DC      /0F00                                 AP124780
                    $I494 BSS     1                                     AP124790
                          DC      /0300                              E3 AP124800
                    CONFG EQU     BUFFR+2*@SCNT-@PRWC+1                 AP124810
                          BSS     @PRWC                                 AP124820
                          ORG     BUFFR+2+2*@SCNT                       AP124830
                    BUFR1 BSS  E  1         WORD COUNT                  AP124840
                          BSS     1         SECTOR ADDRESS              AP124850
                          BSS     @SCNT     BUFFER FOR CHECKSUM CALC    AP124860
                    *                                                   AP124870
                    *                                                   AP124880
                          BSS     @MNCR-*   PATCH AREA                  AP124890
                          END     AA000                                 AP124900
