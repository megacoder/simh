                          HDNG    CARD INPUT SYSTEM LOADER - PHASE 2    FP200010
                    *************************************************** FP200020
                    *                                                 * FP200030
                    *STATUS - VERSION 2, MODIFICATION 11              * FP200040
                    *                                                 * FP200050
                    *FUNCTION/OPERATION-                              * FP200060
                    *   PHASE 2 WILL PERFORM THE FOLLOWING DURING     * FP200070
                    *   AN INITIAL LOAD-                              * FP200080
                    *   * LOAD THE SYSTEM PROGRAMS TO DISK AS         * FP200090
                    *     DIRECTED BY THE LOAD MODE AND PHID RECORDS. * FP200100
                    *   * ESTABLISH SLET.                             * FP200110
                    *   * ESTABLISH THE RELOAD TABLE.                 * FP200120
                    *   * INITIALIZE THE RESIDENT IMAGE AND DCOM.     * FP200130
                    *   * DEFINE PRINCIPAL PRINT AND I/O DEVICES.     * FP200140
                    *   * ESTABLISH ADDRESS OF AND INITIALIZE FIRST   * FP200150
                    *     LET SECTOR.                                 * FP200160
                    *   * PASS CONTROL TO AUXILIARY SUPERVISOR TO CALL* FP200170
                    *     DUP TO LOAD THE SUBROUTINE LIBRARY.         * FP200180
                    *                                                 * FP200190
                    *   A RELOAD-                                     * FP200200
                    *   * RELOAD ANY PHASE(S) CURRENTLY IN SLET.      * FP200210
                    *   * EXPAND RELOADED SYSTEMS PROGRAMS INTO       * FP200220
                    *     CUSHION AREA IF NECESSARY AND SPACE PERMITS.* FP200230
                    *   * COMPRESS OUT OLD OR NEW GAPS BETWEEN     2-4* FP200240
                    *     SYSTEM PROGRAMS (CAUSED BY REDUCED PHASE 2-4* FP200250
                    *     LENGTH DURING A RELOAD)                  2-4* FP200260
                    *   * ADD ONE OR MORE ADDITIONAL PHASES TO A      * FP200270
                    *     SYSTEM PROGRAM CURRENTLY IN SLET.           * FP200280
                    *   * ADD ONE OR MORE NEW PROGRAMS AS SPECIFIED   * FP200290
                    *     IN A SECOND PHID RECORD TO THE SYSTEM       * FP200300
                    *     PROGRAM AREA.                               * FP200310
                    *   * SHIFT THE SCRA, CIB, LET AND USER AREA TO   * FP200320
                    *     MAKE ROOM FOR ADDED PROGRAMS.               * FP200330
                    *   * UPDATE SLET.                                * FP200340
                    *   * UPDATE AND REPROCESS THE RELOAD TABLE.      * FP200350
                    *   * UPDATE THE RESIDENT IMAGE AND DCOM.         * FP200360
                    *   * UPDATE THE CHAIN ADDRESSES IN LET IF        * FP200370
                    *     PROGRAMS WERE ADDED.                        * FP200380
                    *   * REDEFINE PRINCIPAL PRINT AND I/O DEVICES AS * FP200390
                    *     DIRECTED BY THE CONFIGURATION RECORDS.      * FP200400
                    *   * PRINT 'END RELOAD' OR FETCH 'MODIF' AT      * FP200410
                    *     COMPLETION.                                 * FP200420
                    *                                                 * FP200430
                    *ENTRY POINT-                                     * FP200440
                    *   * ENTERED AT 'BA000' FROM PHASE 1.            * FP200450
                    *                                                 * FP200460
                    *INPUT-                                           * FP200470
                    *   * BINARY INPUT RECORDS ONLY.                  * FP200480
                    *                                                 * FP200490
                    *OUTPUT-                                          * FP200500
                    *   * OPERATIONAL SYSTEM CARTRIDGE, LOGICAL DRIVE * FP200510
                    *     ZERO.                                       * FP200520
                    *                                                 * FP200530
                    *EXTERNAL REFERENCES-                             * FP200540
                    *   * NONE.                                       * FP200550
                    *                                                 * FP200560
                    *EXIT-                                            * FP200570
                    *   * BRANCH TO $DUMP AT THE END OF INITIAL LOAD. * FP200580
                    *   * AT END OF A RELOAD BRANCH TO $DUMP IF TYPE  * FP200590
                    *     '81' RECORD FOLLWED BY A '// XEQ MODIF'     * FP200600
                    *     RECORD.  OTHERWISE BRANCH TO $EXIT.         * FP200610
                    *                                                 * FP200620
                    *TABLES/BUFFERS-                                  * FP200630
                    *   * CARD1- 80 WORD CARD INPUT BUFFER.           * FP200640
                    *   * CARD2- 80 WORD CARD INPUT BUFFER, USED TO   * FP200650
                    *            DOUBLE BUFFER WITH 'CARD1' WHEN THE  * FP200660
                    *            CARD READER IS THE 2501.             * FP200670
                    *   * PKBFR- 60 WORD BUFFER INTO WHICH DATA FROM  * FP200680
                    *            'CARD1' AND 'CARD2' IS COMPRESSED.   * FP200690
                    *   * BUFR1- 320 WORD AREA IN WHICH THE RELOAD    * FP200700
                    *            TABLE IS CONSTRUCTED.                * FP200710
                    *   * BUFR2- 320 WORD DISK I/O BUFFER USED        * FP200720
                    *            PRIMARILY FOR DATA.                  * FP200730
                    *   * BUFR3- 320 WORD DISK I/O BUFFER USED        * FP200740
                    *            PRIMARILY FOR SLET.                  * FP200750
                    *                                                 * FP200760
                    *ATTRIBUTES-                                      * FP200770
                    *   * N/A                                         * FP200780
                    *                                                 * FP200790
                    *NOTES-                                           * FP200800
                    *   * THIS PHASE IS ASSEMBLED IN RELOCATABLE-     * FP200810
                    *     ABSOLUTE FORMAT.                            * FP200820
                    *   * IN ADDITION TO THE FIRST CARD, SECTOR BREAK * FP200830
                    *     CARDS PRECEDE SUBPHASES 1, 2, AND 3.  PHASE * FP200840
                    *     1 USES ABSOLUTE SECTOR ADDRESSES TO LOAD    * FP200850
                    *     PHASE 2.                                    * FP200860
                    *  * PROGRAM REVISED IN MOD 2                    *  FP200870
                    *                                                 * FP200880
                    *************************************************** FP200890
                          HDNG    CARD INPUT SYSTEM LOADER - PHASE 2    FP200900
                          ABS                                           FP200910
                    *                                                   FP200920
                    * COMMA EQUATES                                     FP200930
                    *                                                   FP200940
                    $ACDE EQU     /9F  TABLE OF AREA CODES              FP200950
                    $CH12 EQU     /06  CHANNEL 12 INDICATOR             FP200960
                    $CILA EQU     /5A  ADDRESS OF END OF DISK SUBR      FP200970
                    $COMN EQU     /07  LENGTH OF COMMON (IN WORDS)      FP200980
                    $CORE EQU     /0E  SIZE OF CORE                     FP200990
                    $CPTR EQU     /7E  CNSL PTR CHANNEL 12 INDICATOR    FP201000
                    $CTSW EQU     /0F  CONTROL RECORD TRAP SWITCH       FP201010
                    $CIBA EQU     /05  SCTR ADDR OF CIB                 FP201020
                    $CYLN EQU     /9A  ARM POSITION                     FP201030
                    $DBSY EQU     /EE  NON-ZERO WHEN DISKZ BUSY         FP201040
                    $DADR EQU     /10  BLK ADDR OF PROG TO BE LOADED    FP201050
                    $DCDE EQU     /77  DRIVE CODE OF PROG IN WRK STG    FP201060
                    $DCYL EQU     /A4  TABLE OF DEFECTIVE CYLINDERS     FP201070
                    $DREQ EQU     /12  IND. FOR REQUESTED VERSION DKI/O FP201080
                    $DUMP EQU     /3F  CALL DUMP ENTRY POINT            FP201090
                    $DZIN EQU     /76  DISK SUBROUTINE IN CORE INDR     FP201100
                    $EXIT EQU     /38  CALL EXIT ENTRY POINT            FP201110
                    $FLSH EQU     /71  FLUSH JOB SWITCH                 FP201120
                    $FPAD EQU     /95  TABLE OF FILE PROTECT ADDRESSES  FP201130
                    $HASH EQU     /14  WORK AREA                        FP201140
                    $IBSY EQU     /13  NON-ZERO IF CD/PAP TP DEV. BUSY  FP201150
                    $IBT2 EQU     /B9  LEVEL 2 INTRPT BRANCH TABLE ADDR FP201160
                    $IBT4 EQU     /D4  ADDR OF THE IBT, LEVEL 4         FP201170
                    $IOCT EQU     /32  ZERO IF NO I/O IN PROGRESS       FP201180
                    $IREQ EQU     /2C  ADDR OF INT REQUEST SUBROUTINE   FP201190
                    $I200 EQU     /B3  ILS02 ENTRY POINT                FP201200
                    $I205 EQU     /B8  ILS02 INTERRUPT ENTRY POINT      FP201210
                    $I400 EQU     /C4  ILS04 ENTRY POINT                FP201220
                    $I403 EQU     /D0                                   FP201230
                    $KCSW EQU     /7C  1 IF KB,CP BOTH UTILIZED         FP201240
                    $LAST EQU     /33  LAST CARD INDICATOR              FP201250
                    $LEV0 EQU     /08  LEVEL 0 BRANCH ADDRESS           FP201260
                    $LEV1 EQU     /09  LEVEL 1 BRANCH ADDRESS           FP201270
                    $LEV2 EQU     /0A  LEVEL 2 BRANCH ADDRESS           FP201280
                    $LEV3 EQU     /0B  LEVEL 3 BRANCH ADDRESS           FP201290
                    $LEV4 EQU     /0C  LEVEL 4 BRANCH ADDRESS           FP201300
                    $LEV5 EQU     /0D  LEVEL 5 BRANCH ADDRESS           FP201310
                    $LINK EQU     /39  CALL LINK ENTRY POINT            FP201320
                    $NDUP EQU     /34  DO NOT DUP IF NON-ZERO           FP201330
                    $NXEQ EQU     /35  DO NOT EXECUTE IF NON-ZERO       FP201340
                    $PBSY EQU     /36  NON-ZERO WHEN PRINTER BUSY       FP201350
                    $PGCT EQU     /37  PAGE NO. FOR HEADINGS            FP201360
                    $PHSE EQU     /78  NO. OF PHASE NOW IN CORE         FP201370
                    $PRET EQU     /28  IOCS SOFT ERROR TRAP             FP201380
                    $PST1 EQU     /81  TRAP FOR I/O ERRORS, LEVEL 1     FP201390
                    $PST2 EQU     /85  TRAP FOR I/O ERRORS, LEVEL 2     FP201400
                    $PST3 EQU     /89  TRAP FOR I/O ERRORS, LEVEL 3     FP201410
                    $PST4 EQU     /8D  TRAP FOR I/O ERRORS, LEVEL 4     FP201420
                    $SNLT EQU     /EF  SENSE LIGHT INDICATOR            FP201430
                    $STOP EQU     /91  PROGRAM STOP KEY TRAP            FP201440
                    $SYSC EQU     /E0  MODIFICATION LEVEL               FP201450
                    $UFDR EQU     /7D  DRIVE CODE OF UNFORMATTED I/O    FP201460
                    $UFIO EQU     /79  UNFORMATTED I/O RECORD NO.       FP201470
                    $ULET EQU     /2D  TABLE OF LET ADDRESSES           FP201480
                    $WSDR EQU     /7A  WORKING STORAGE DRIVE CODE       FP201490
                    $WRD1 EQU     /7B  ADDR OF 1ST WD OF CORE LOAD      FP201500
                    $ZEND EQU     /1E0 END OF DISKZ                     FP201510
                    $1132 EQU     /7F  1132 PRINTER CHANNEL 12 INDR     FP201520
                    $1403 EQU     /80  1403 PRINTER CHANNEL 12 INDR     FP201530
                    *                                                   FP201540
                    * ABSOLUTE EQUATES                                  FP201550
                    *                                                   FP201560
                    @IDAD EQU     /0000     CART ID, COLD START SAD     FP201570
                    @DCOM EQU     /0001     DCOM SECTOR ADDRESS         FP201580
                    @RIAD EQU     /0002     RESIDENT IMAGE SECTOR ADDR  FP201590
                    @SLET EQU     /0003     FIRST SLET SECTOR ADDRESS   FP201600
                    @RLTB EQU     /0006     RELOAD TABLE SECTOR ADDRESS FP201610
                    @HDNG EQU     /0007     PAGE HEADING SECTOR ADDRESS FP201620
                    @P2AD EQU     /0630     SYS LDR - PHASE 2 SCTR ADDR FP201630
                    @MSCT EQU     /0658     MAXIMUM SECTOR ADDRESS - 1  FP201640
                    @COLD EQU     /0030     RLTV ADDR 1ST WD COLD START FP201650
                    @CSTR EQU     /00D0                                 FP201660
                    DZ000 EQU     /00F2     DISKZ ENTRY POINT           FP201670
                    @WDCT EQU     0         RLTV ADDR WORD COUNT IN BFR FP201680
                    @SADR EQU     1         RLTV ADDR SCTR ADDR IN BFR  FP201690
                    @NDCY EQU     3         MAX NO. OF DEF CYLINDERS    FP201700
                    @MXDR EQU     5         MAX NO. OF DISK CRIVES      FP201710
                    @CIDN EQU     3         RLTV ADDR OF CARTRIDGE ID   FP201720
                    @STAT EQU     7         RLTV ADDR CART STATUS WORD  FP201730
                    @PRWC EQU     60        PRINTER BUFFER LENGTH       FP201740
                    @CCOL EQU     80        NUMBER OF COLUMNS PER CARD  FP201750
                    @SCNT EQU     320       NUMBER OF WORDS PER SECTOR  FP201760
                    @MNCR EQU     4096      MINIMUM ALLOWABLE CORE SIZE FP201770
                    *                                                   FP201780
                    * SYSTEM DEVICE SUBROUTINE PHASE IDS                FP201790
                    *                                                   FP201800
                    P1403 EQU     140       PHASE ID OF SYS 1403 SUBR   FP201810
                    P1132 EQU     141       PHASE ID OF SYS 1132 SUBR   FP201820
                    PCPAD EQU     142       PHASE ID OF SYS C. P. SUBR  FP201830
                    I2501 EQU     143       PHASE ID OF SYS 2501 SUBR   FP201840
                    I1442 EQU     144       PHASE ID OF SYS 1442 SUBR   FP201850
                    I1134 EQU     145       PHASE ID OF SYS PAPT SUBR   FP201860
                    IKBRD EQU     146       PHASE ID OF SYS KEYBRD SUBR FP201870
                    CDCNV EQU     147       PH ID OF SYS 2501/1442 CONV FP201880
                    C1134 EQU     148       PHASE ID OF SYS 1134 CONV   FP201890
                    CKBRD EQU     149       PHASE ID OF SYS KEYBRD CONV FP201900
                    DISKZ EQU     150       PHASE ID OF DISKZ SUBR      FP201910
                    DISK1 EQU     151       PHASE ID OF DISK1 SUBR      FP201920
                    DISKN EQU     152       PHASE ID OF DISKN SUBR      FP201930
                    PRINT EQU     153       PH ID OF PRINC PRINT SUBR   FP201940
                    PINPT EQU     154       PH ID OF PRINC INPUT SUBR   FP201950
                    PIDEV EQU     155       PRINC INPUT EXCLUDING KEYBD FP201960
                    CNVRT EQU     156       PRINC SYS CONVERSION SUBR   FP201970
                    CVRT  EQU     157       PRINC CONV EXCLUDING KEYBRD FP201980
                    *                                                   FP201990
                    * SYSTEM LOADER COMMUNICATIONS AREA                 FP202000
                    *                                                   FP202010
                    CILWC EQU     /01F0     CORE IMAGE LOADER WORD CNT  FP202020
                    RINDR EQU     CILWC+2   CD RDR INDR- 0=2501,NZ=1442 FP202030
                    DCYL1 EQU     RINDR+1   SCTR ADDR OF 1ST DEF CYLIN  FP202040
                    DCYL2 EQU     DCYL1+1   SCTR ADDR OF 2ND DEF CYLIN  FP202050
                    DCYL3 EQU     DCYL2+1   SCTR ADDR OF 3RD DEF CYLIN  FP202060
                    LMODE EQU     DCYL3+1   LOAD MODE IMAGE             FP202070
                    CAREA EQU     LMODE+1   NO. SECTORS OF CUSHION AREA FP202080
                    T1442 EQU     CAREA+1   SET 1 IF 1442-6 OR 7 AVAIL  FP202090
                    DINDR EQU     T1442+1   ISS DEVICE INDICATOR        FP202100
                    VERSN EQU     DINDR+1   VERSION AND MODIFICATION NO FP202110
                    CIBFR EQU     VERSN+1   SCTR ADDR OF CORE IMAGE BFR FP202120
                    SCORE EQU     CIBFR+1   CORE SIZE                   FP202130
                    MAXPH EQU     SCORE+1   MAXIMUM PHASE ID            FP202140
                    ASCRA EQU     MAXPH+1   SECTOR ADDRESS OF SCRA      FP202150
                    CARID EQU     ASCRA+1   ID OF CARTRIDGE             FP202160
                    FLETI EQU     CARID+1   FIXED AREA INDICATOR        FP202170
                    FPADR EQU     FLETI+1   FILE PROTECT ADDRESS        FP202180
                    SSBFR EQU     FPADR+1   NO. OF SCTR FOR SLET BFR    FP202190
                    LET00 EQU     SSBFR+1   PRE-LOAD LET SECTOR ADDRESS FP202200
                    SHIFT EQU     LET00+1   NO. OF SCTRS TO SHIFT       FP202210
                    PTRID EQU     SHIFT+24  PH ID OF PRINC PRINT SUBR   FP202220
                    CHN12 EQU     PTRID+1   ADDRESS OF CHANNEL 12 INDR  FP202230
                    RDRID EQU     PTRID+2   PH ID OF PRINC I/O SUBR     FP202240
                    CNVID EQU     RDRID+1   PH ID OF PRINC CONV SUBR    FP202250
                    PRNRD EQU     CNVID+1   PRINCIPAL I/O DEVICE INDR   FP202260
                    PRNPR EQU     PRNRD+1   PRINCIPAL PRINT DEVICE INDR FP202270
                    PAIR1 EQU     PRNPR+1                               FP202280
                    PAIR2 EQU     PAIR1+2                               FP202290
                    PAIR3 EQU     PAIR2+2                               FP202300
                    PAIR4 EQU     PAIR3+2                               FP202310
                    PAIR5 EQU     PAIR4+2                               FP202320
                    PAIR6 EQU     PAIR5+2                               FP202330
                    PAIR7 EQU     PAIR6+2                               FP202340
                    PAIR8 EQU     PAIR7+2                               FP202350
                    PAIR9 EQU     PAIR8+2                               FP202360
                    PAIRA EQU     PAIR9+2                               FP202370
                    PAIRB EQU     PAIRA+2                               FP202380
                    PAIRC EQU     PAIRB+2                               FP202390
                    PAIRD EQU     PAIRC+2                               FP202400
                    PAIRE EQU     PAIRD+2                               FP202410
                    PAIRF EQU     PAIRE+2                               FP202420
                    LPHID EQU     PAIRF+1   LAST PH ID FOR INITIAL LOAD FP202430
                    LOLIM EQU     LPHID+1   LOWER PHASE ID BYPASS LIMIT FP202440
                    UPLIM EQU     LOLIM+1   UPPER PHASE ID BYPASS LIMIT FP202450
                    MSG01 EQU     UPLIM+10  E 01 CHECKSUM ERROR         FP202460
                    MSG02 EQU     MSG01+12  E 02 INVALID RCRD OR BLANK  FP202470
                    MSG03 EQU     MSG02+16  E 03 SEQ ERR OR MISSING RCD FP202480
                    MSG04 EQU     MSG03+19  E 04 ORG BACKWARD           FP202490
                    MSG05 EQU     MSG04+11  E 05 INITIALIZE THE CART    FP202500
                    INTPT EQU     MSG05+17  INHIBIT INTRPT REQ SUBR ENT FP202510
                    WRTYZ EQU     INTPT+7   CONSOLE PRINTER SUBR ENTRY  FP202520
                    TZ100 EQU     WRTYZ+2   CONSOLE PTR INTERRUPT ENTRY FP202530
                    CD000 EQU     WRTYZ+57  CARD READER SUBR ENTRY      FP202540
                    CD010 EQU     CD000+3   CARD READER INTERRUPT ENTRY FP202550
                          HDNG    PHASE 2 INITIALIZATION                FP202560
                          ORG     /0376     BEGIN AT END OF DEVICE SUBR FP202570
                    *                                                   FP202580
                    *                                                   FP202590
                          DC      BZ999-BA000+1  WORD COUNT OF PHASE 2  FP202600
                          DC      @P2AD          SCTR ADDR OF PHASE 2   FP202610
                    *                                                   FP202620
                    *                                                   FP202630
                    BA000 NOP               A WAIT MAY BE PATCHED HERE  FP202640
                          LDX  L1 BZ930-1   STORE ADDRESS OF INTERRUPT  FP202650
                          STX  L1 $IBT4     *BRANCH TABLE IN ILS04      FP202660
                          LDX  L3 X         XR3 POINTS TO CONSTANTS     FP202670
                          LD   L  LMODE     FETCH AND                   FP202680
                          STO   3 BY934-X   *STORE LOAD MODE INDICATOR  FP202690
                          BSC  L  BA010,-   BRANCH IF A RELOAD FUNC     FP202700
                          BSI  L  FTCH3     ZERO SLET BUFFER VIA  READ  FP202710
                          LD   L  PAIRF+1   FETCH AND                   FP202720
                          STO   3 BY924-X   *STORE LAST PHASE ID        FP202730
                          MDX     BB000     BRANCH TO READ A RECORD     FP202740
                    BA010 LD   L  CIBFR     FETCH AND                   FP202750
                          STO   3 BY935-X   *STORE CIB SECTOR ADDRESS   FP202760
                    * CLEAR SIGN BITS IN SLET TABLE SCTR ADDRESSES. 2-4 FP202770
                    * LOCATE LAST PH ID & LAST USED SCTR ADDRESS.   2-4 FP202780
                    * COMPRESS OUT EXISTING GAPS BETWEEN            2-4 FP202790
                    * SYSTEM PROGRAMS.                              2-4 FP202800
                          BSI  L  B0000     GO DO ABOVE 3 FUNCTIONS     FP202810
                          HDNG    READ A RECORD                         FP202820
                    BB000 LD   L  RINDR     TEST FOR AND BRANCH TO      FP202830
                          BSI  L  BB100,+-  *DOUBLE BUFFER IF RDR 2501  FP202840
                          LD      BB900     SET ADDRESS IN PACKING SUBR FP202850
                          A     3 BX901-X   *TO MATCH                   FP202860
                          STO  L  PK020     *ADDRESS READ INTO          FP202870
                          BSI     BB200     BRANCH TO READ A RECORD     FP202880
                          MDX  L  $IBSY,0   SKIP IF READ COMPLETE       FP202890
                          MDX     *-3       BR TO TEST READ COMPLETE    FP202900
                    BB020 LD    3 BY946-X   TEST FOR AND BRANCH         FP202910
                          BSI  L  PACK0,Z   *IF PACKING INDICATOR ON    FP202920
                          LD   L  PK020     FETCH ADDR OF CURRENT BFR   FP202930
                          S     3 BY949-X   TEST FOR                    FP202940
                          S     3 BX901-X   *AND BRANCH                 FP202950
                          BSC  L  BB040,+-  *IF 'CARD2'                 FP202960
                          SRA     16        SET                         FP202970
                          STO   3 BY929-X   *'CARD1' PACKED INDICATOR   FP202980
                          MDX     BB060     BR TO DETERMINE RECORD TYPE FP202990
                    BB040 STO   3 BY930-X   SET 'CARD2' PACKED INDR     FP203000
                    BB060 BSC  L  BC000     BR TO DETERMINE RECORD TYPE FP203010
                    *                                                   FP203020
                    *************************************************** FP203030
                    *                                                   FP203040
                    * 2501 DOUBLE BUFFERING SUBROUTINE                  FP203050
                    *                                                   FP203060
                    BB100 DC      0         ENTRY/RETURN ADDRESS        FP203070
                          LD    3 BZ909-X   TEST FOR AND BRANCH         FP203080
                          BSC  L  BB110,+-  *IF DOUBLE BUFFERING        FP203090
                          LD    3 BY966-X   FETCH 'NOP'                 FP203100
                          STO     BB120     *TO CHANGE                  FP203110
                          STO     BB160     *'BSI     BB200'S           FP203120
                          STO  L  RINDR     TURN OFF DOUBLE BUFFERING   FP203130
                    *                                                   FP203140
                    BB110 LD    3 BY929-X   TEST FOR AND                FP203150
                          BSC  L  BB140,Z   *BRANCH IF 'CARD1' BUSY     FP203160
                          LD    3 BY948-X   SET 'CARD1'                 FP203170
                          STO  L  BB900     *AS I/O AREA ADDRESS        FP203180
                          STO   3 BY929-X   SET 'CARD1' BUSY INDICATOR  FP203190
                    BB120 BSI     BB200     BRANCH TO READ A CARD       FP203200
                    *                                                   FP203210
                          LD    3 BY930-X   TEST FOR AND                FP203220
                          BSC  L  BB000,+-  *BRANCH IF 'CARD2' PACKED   FP203230
                          LD    3 BY949-X   FETCH ADDRESS OF 'CARD2'    FP203240
                          MDX     BB180     BRANCH TO PACK 'CARD2'      FP203250
                    *                                                   FP203260
                    BB140 LD    3 BY949-X   SET 'CARD2'                 FP203270
                          STO  L  BB900     *AS I/O AREA ADDRESS        FP203280
                          STO   3 BY930-X   SET 'CARD2' BUSY INDICATOR  FP203290
                    BB160 BSI     BB200     BRANCH TO READ A CARD       FP203300
                    *                                                   FP203310
                          LD    3 BY929-X   TEST FOR AND                FP203320
                          BSC  L  BB000,+-  *BRANCH IF 'CARD1' PACKED   FP203330
                          LD    3 BY948-X   FETCH ADDRESS OF 'CARD1'    FP203340
                    BB180 A     3 BX901-X   POINT TO FIRST DATA WORD    FP203350
                          STO  L  PK020     STORE ADDRESS TO PACK SUBR  FP203360
                          MDX     BB020     BRANCH TO PACK THE RECORD   FP203370
                    *                                                   FP203380
                    *************************************************** FP203390
                    *                                                   FP203400
                    * READ A RECORD                                     FP203410
                    *                                                   FP203420
                    BB200 DC      0         ENTRY/RETURN ADDRESS        FP203430
                          LD   L  $LAST     TEST FOR AND                FP203440
                          BSC  L  BB250,+-  *BRANCH IF NOT LAST CARD    FP203450
                          LD   L  BB904     FETCH FEED CONTROL PARAM    FP203460
                          BSI  L  CD000+1   BRANCH TO FEED LAST CARD    FP203470
                    BB250 LD      BB900     FETCH ADDRESS OF I/O BUFFER FP203480
                          SRT     16        SHIFT TO EXTENSION          FP203490
                          LD      BB902     FETCH READ CONTROL PARAM    FP203500
                          BSI  L  CD000+1   BRANCH TO READ A RECORD     FP203510
                          BSC  I  BB200     RETURN                      FP203520
                    *                                                   FP203530
                    * CONSTANTS AND WORK AREAS                          FP203540
                    *                                                   FP203550
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   FP203560
                    BB900 DC      CARD1-1   ADDRESS OF CURRENT I/O BFR  FP203570
                          DC      @CCOL     WORD COUNT                  FP203580
                    CARD1 BSS     @CCOL     FIRST CARD BUFFER           FP203590
                    BB902 DC      /7002     READ CONTROL PARAMETER      FP203600
                          DC      @CCOL     WORD COUNT                  FP203610
                    CARD2 BSS     @CCOL     SECOND CARD BUFFER          FP203620
                    BB904 DC      /7003     FEED CONTROL PARAMETER      FP203630
                    *                                                   FP203640
                    *************************************************** FP203650
                    *                                                   FP203660
                    * PACK 80 CARD IMAGE WORDS TO 60 BINARY WORDS       FP203670
                    *                                                   FP203680
                    PACK0 DC      0         ENTRY/RETURN ADDRESS        FP203690
                          STX  L3 PK060+1   SAVE XR3                    FP203700
                          LDX  L1 CARD1     XR1 POINTS TO               FP203710
                    PK020 EQU     *-1       *ADDRESS OF I/O AREA        FP203720
                          LDX  L2 PKBFR     XR2 PTS TO PACKED BUFFER    FP203730
                          LDX   3 20        XR3 = NUMBER OF LOOPS       FP203740
                    PK040 SLT     32        CLEAR  ACC AND  EXT         FP203750
                          LD    1 1               2220     0000         FP203760
                          RTE     12              0002     2200         FP203770
                          A     1 0               1112     2200         FP203780
                          STO   2 0         STORE WORD 1                FP203790
                          RTE     8               0011     1222         FP203800
                          LD    1 2               3330     1222         FP203810
                          RTE     8               2233     2333         FP203820
                          STO   2 1         STORE WORD 2                FP203830
                          RTE     12              0122     2333         FP203840
                          LD    1 3               4440     2333         FP203850
                          RTE     4               3444     0233         FP203860
                          STO   2 2         STORE WORD 3                FP203870
                          MDX   1 4         INCR UNPACKED ADDRESS       FP203880
                          MDX   2 3         INCR PACKED ADDRESS         FP203890
                          MDX   3 -1        DECR LOOP CNT, SKIP IF ZERO FP203900
                          MDX     PK040     BRANCH TO PACK NEXT 4 WORDS FP203910
                    PK060 LDX  L3 *-*       RESTORE XR3                 FP203920
                          BSC  I  PACK0     RETURN                      FP203930
                    *                                                   FP203940
                    * CONSTANTS AND WORK AREAS                          FP203950
                    *                                                   FP203960
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   FP203970
                    PKBFR BSS     @PRWC     BINARY RECORD BUFFER        FP203980
                          HDNG    DETERMINE RECORD TYPE                 FP203990
                    BC000 LDX  L1 PKBFR-1   XR1 PTS TO BINARY RCDR BFR  FP204000
                          LD    1 3         FETCH WORD 3 OF RECORD      FP204010
                          SRA     8         *TO DETERMINE RCRD TYPE     FP204020
                          S     3 BX901-X   TEST FOR AND BRANCH IF      FP204030
                    BC020 BSI  L  BD000,+-  *AN ABS HEADER RECORD - /01 FP204040
                          S     3 BX901-X   TEST FOR AND BRANCH IF      FP204050
                          BSI  L  MODIF,+-  *SCTR BK OR XEQ MODIF - /02 FP204060
                          S     3 BX908-X   TEST FOR AND BRANCH IF      FP204070
                          BSI  L  BE000,+-  *A DATA RECORD        - /0A FP204080
                          S     3 BX905-X   TEST FOR AND BRANCH IF      FP204090
                          BSI  L  BF000,+-  *AN 'F' RECORD        - /0F FP204100
                          S     3 BX912-X   TEST FOR AND BRANCH IF      FP204110
                          BSI  L  BG000,+-  *AN '81' RECORD       - /81 FP204120
                          LD    3 BZ909-X   IF TYPE 81 RCD HAS BEEN     FP204130
                          BSI  L  C3060,Z   *READ BR TO CK 'XEQ MODIF'  FP204140
                          BSI  L  ER002     SYS DECK ERROR, PRINT E 02  FP204150
                          HDNG    PROCESS A SECTOR BREAK RECORD         FP204160
                    BD000 DC      0         ENTRY                       FP204170
                    *                                                   FP204180
                    * IF TWO SECTOR BREAK RECORDS ARE READ IN           FP204190
                    * SUCCESSION PRINT ERROR MESSAGE E 03.              FP204200
                    *                                                   FP204210
                          LD    3 BY927-X   TEST TYPE /01 SWITCH        FP204220
                          BSI  L  ER003,Z   BR TO PRINT MESSAGE E 03    FP204230
                          LD    3 BZ911-X   TEST UNCONDITIONAL BYPASS   FP204240
                          BSC  L  BB000,Z   *SW AND GO READ RCD IF ON   FP204250
                          STX  L0 BY927     SET TYPE /01 SWITCH ON      FP204260
                          SRA     16                                    FP204270
                          STO   3 BY933-X   SET TYPE 'A' INDR OFF       FP204280
                          LD    3 BY981-X   ANY PROG DATA LEFT TO WRITE FP204290
                          BSI  L  WRIT2,Z   WRITE PROGRAM DATA TO DISK  FP204300
                          SRA     16        CLEAR                       FP204310
                          STO   3 BY941-X   *BYPASS THIS PHASE INDR AND FP204320
                          STO   3 BY981-X   *PROG DATA TO WRITE INDR    FP204330
                    *                                                   FP204340
                          STX  L0 BY939     SET SECTOR BREAK INDC ON    FP204350
                          LD    3 BY925-X   TEST NOW SKIPPING INDICATOR FP204360
                          BSC  L  BB000,Z   KEEP READING IF ON          FP204370
                          LD    3 BY937-X   PREVIOUS HIGH SCTR ADDR     FP204380
                          STO   3 BY983-X   SAVE FOR ERROR RECOVERY     FP204390
                          A     3 BX901-X   ESTABLISH ADDR FOR FIRST    FP204400
                          STO   3 BY910-X   *SECTOR OF THIS PHASE       FP204410
                    *                                                   FP204420
                    * NOW THAT THE PREVIOUS PHASE IS COMPLETELY         FP204430
                    * PROCESSED, SET THE LAST TWO WORDS IN ITS SLET     FP204440
                    * ENTRY                                             FP204450
                    *                                                   FP204460
                          LD    3 BY982-X   DOES SLET ENTRY NEED FINISH FP204470
                          BSC  L  BD045,+-  *BR IF ALREADY FINISHED     FP204480
                          LDX  I2 C1020+1   RESTORE XR2 POINTER TO SLET FP204490
                          LD    3 BY919-X   STORE WORD COUNT PREV PHASE FP204500
                          A     3 BX901-X   FORM CORRECT WORD COUNT     FP204510
                          STO   2 -2        *PROCESSED IN CURRENT SET   FP204520
                          STO   3 BY977-X   SAVE FOR SHRINK TEST    2-4 FP204530
                          LD    3 BY915-X   STORE SCTR ADDR OF FIRST    FP204540
                          STO   2 -1        *SECTOR IN SLET ENTRY       FP204550
                          SRA     16        RESET WORD COUNT FOR        FP204560
                          STO   3 BY919-X   *EACH PHASE                 FP204570
                    *                                                   FP204580
                    * ON RELOAD ALWAYS WRITE OUT SLET TO THE DISK.      FP204590
                    * ON INITIAL AND RELOAD, WRITE AND THEN READ THE    FP204600
                    * NEXT SLET SECTOR IF THE LAST SLET ENTRY WAS AT    FP204610
                    * THE END OF A SECTOR.                              FP204620
                    *                                                   FP204630
                    BD045 LD    3 BY934-X   TEST FOR INITIAL LOAD       FP204640
                          BSC  L  BD050,Z+  BR IF INITIAL LOAD          FP204650
                          LD    3 BY920-X   IF SLET SCTR FULL           FP204660
                          BSC  L  BD060,Z   *THEN WRITE AND READ SLET   FP204670
                          LD    3 BY982-X   DOES SLET NEED WRITING      FP204680
                          BSI  L  WRIT3,Z   ONLY WRITE SLET             FP204690
                          MDX     BD080     ALREADY TOOK CARE OF SLET   FP204700
                    BD050 LDX  I2 C1020+1   XR2 = NEXT SLET ENTRY  2-11 FP204705
                          BSI  L  C1400     BR TO INSERT PRIN I/O  2-11 FP204710
                          LD    3 BY920-X   IF SLET SCTR FULL           FP204720
                    *                       WRITE SLET SCTR TO DISK AND FP204730
                    BD060 BSI  L  BD200,Z   *READ NEXT SLET SECTOR      FP204740
                    BD080 LD    3 BY975-X   SET JUMP IN RECORD READ     FP204750
                          STO  L  CK060                                 FP204760
                          LD    3 BY973-X   SET INDC FOR REL SECTOR     FP204770
                          STO   3 BY939-X                               FP204780
                          SRA     16        CLEAR RCRD COUNT FOR CK-SUM FP204790
                          STO   3 BY944-X                               FP204800
                          STO   3 BY943-X                               FP204810
                    *                       SET INDC SO NEXT DATA RCRD  FP204820
                          STO  L  BE900     *SETS REL ADDR WORD IN SCTR FP204830
                          STO   3 BY942-X   SET INDC ON FOR SCTR BREAK  FP204840
                          LD    3 BX914-X                               FP204850
                          STO   3 BY938-X                               FP204860
                    *                                               2-4 FP204870
                    * CHECK IF PHASE SIZE HAS SHRUNK DURING RELOAD  2-4 FP204880
                    *                                               2-4 FP204890
                    BD090 LD    3 BY934-X   TEST FOR INITIAL LOAD   2-4 FP204900
                          BSC  L  BD095,Z+  BR IF INITIAL LOAD      2-4 FP204910
                          LD    3 BY982-X   WAS PHASE JUST STORED   2-4 FP204920
                          BSC  L  BD095,+-  BR IF NOT               2-4 FP204930
                          LD    3 BZ908-X   BR IF NEW PROGRAM ADD   2-4 FP204940
                          BSC  L  BD095,Z   *IN PROCESS             2-4 FP204950
                          LD    3 BY977-X   GET NEW WORD COUNT      2-4 FP204960
                          A     3 BX913-X   CALCULATE NUMBER OF     2-4 FP204970
                          SRT     16        *SECTORS IN             2-4 FP204980
                          D     3 BX914-X   *NEW RELOADED PHASE     2-4 FP204990
                          STO   3 BY902-X   SAVE NEW PHASE LENGTH   2-4 FP205000
                          S     3 BY947-X   SUB OLD PHASE LENGTH    2-4 FP205010
                          BSC  L  BD095,-   BR IF NOT NOW SMALLER   2-4 FP205020
                    *                                               2-4 FP205030
                    * SET UP PARAMTERS FOR SLET UPDATE AND          2-4 FP205040
                    * SYSTEM PROGRAM SHIFT                          2-4 FP205050
                    *                                               2-4 FP205060
                          STO   3 BY903-X   SAVE LENGTH DIFFERENCE  2-4 FP205070
                          LD    3 BY915-X   GET SCTR ADDR OF PHASE  2-4 FP205080
                          A     3 BY902-X   CALCULATE ADDR OF START 2-4 FP205090
                          STO   3 BY918-X   *OF NEW GAP, 'TO' ADDR  2-4 FP205100
                          S     3 BY903-X   CALCULATE ADDR OF PHASE 2-4 FP205110
                          STO   3 BY917-X   *AFTER GAP, 'FROM' ADDR 2-4 FP205120
                          BSI     BD099     GO TO UPDATE/SHIFT SUBR 2-4 FP205130
                    *                                               2-4 FP205140
                    BD095 SRA     16        INDICATE SLET DOESN'T   2-4 FP205150
                          STO   3 BY982-X   *NEED SETTING OR WRITING    FP205160
                          BSC  L  BB000     BR TO READ NEXT RECORD      FP205170
                    *                                               2-4 FP205180
                    ************************************************2-4 FP205190
                    *                                               2-4 FP205200
                    * UPDATE SLET TABLE ENTRIES AFFECTED BY LEFT    2-4 FP205210
                    * SHIFT                                         2-4 FP205220
                    *                                               2-4 FP205230
                    BD099 DC      0         ENTRY/RETURN ADDR       2-4 FP205240
                          NOP               WAIT MAY BE PATCHED HERE2-4 FP205250
                    BD100 STX   2 BD109     GET XR2 POINTER TO NEXT 2-4 FP205260
                          LD      BD109     *SLET ENTRY IN ACC, SUB 2-4 FP205270
                          S     3 BY914-X   *ADDR LAST ENTRY        2-4 FP205280
                    *                       IF BUFFER IS FULL,      2-4 FP205290
                    *                       WRITE SCTR BACK TO DISK 2-4 FP205300
                          BSI  L  BD200,-Z  *AND READ NEXT SECTOR   2-4 FP205310
                          LD   L  BUFR3+1   CHECK FOR END OF SLET   2-4 FP205320
                          S     3 BY956-X   *SLET TABLE SECTORS     2-4 FP205330
                          BSC  L  BD120,-Z  BR IF BEYOND END        2-4 FP205340
                          LD    2 3         GET OLD PHASE SCTR ADDR 2-4 FP205350
                          BSC  L  BD110,+-  BR IF NO MORE ENTRIES   2-4 FP205360
                          S     3 BY917-X   UPDATE PHASE SCTR ADDR  2-4 FP205370
                          A     3 BY918-X   *BY AMOUNT OF SHIFT     2-4 FP205380
                          STO   2 3         *DISPLACEMENT           2-4 FP205390
                          MDX   2 4         ADVANCE SLET ENTRY PTR  2-4 FP205400
                          MDX     BD100     BR TO TEST NEXT ENTRY   2-4 FP205410
                    BD109 DC      *-*       TEMP STORAGE FOR XR2    2-4 FP205420
                    BD110 BSI  L  WRIT3     WRITE BACK LAST SECTOR  2-4 FP205430
                    *                                               2-4 FP205440
                    * SHIFT REMAINDER OF SYSTEM PROGRAMS LEFT       2-4 FP205450
                    *                                               2-4 FP205460
                    BD120 LD    3 BY924-X   KNOWN ID OF LAST PHASE  2-4 FP205470
                          BSI  L  SSLET     SEARCH SLET FOR THIS ID 2-4 FP205480
                          BSI  L  ER027,+   BR IF SOMEHOW MISSING   2-4 FP205490
                          LD    2 2         CALCULATE NUMBER OF     2-4 FP205500
                          A     3 BX913-X   *SECTORS IN LAST        2-4 FP205510
                          SRT     16        *SYSTEM PROGRAM         2-4 FP205520
                          D     3 BX914-X   *PHASE                  2-4 FP205530
                          A     2 3         ADD STARTING SCTR ADDR  2-4 FP205540
                          S     3 BX901-X   SET NEW VALUE FOR       2-4 FP205550
                          STO   3 BY937-X   *LAST SECTOR USED       2-4 FP205560
                          A     3 BX901-X   ADD BACK 1              2-4 FP205570
                          S     3 BY918-X   NUMBER OF SCTRS TO SHIFT2-4 FP205580
                          STO   3 BY978-X   *IS DIFFERENCE FROM 'TO'2-4 FP205590
                          LD   L  CAREA     INCREMENT CUSHION SIZE  2-4 FP205600
                          A     3 BY917-X   *BY AMOUNT              2-4 FP205610
                          S     3 BY918-X   *OF SHIFT               2-4 FP205620
                          STO  L  CAREA     *DISPLACEMENT           2-4 FP205630
                          BSI  L  C0300     GO DO THE LEFT SHIFT    2-4 FP205640
                          BSC  I  BD099     RETURN FROM SUBROUTINE  2-4 FP205650
                    *                                                   FP205660
                    *************************************************** FP205670
                    *                                                   FP205680
                    * WRITE A SECTOR OF SLET AND READ NEXT SECTOR       FP205690
                    * OF SLET.                                          FP205700
                    *                                                   FP205710
                    BD200 DC      0         ENTRY/RETURN ADDRESS        FP205720
                          SRA     16        RESET SLET SCTR FULL        FP205730
                          STO   3 BY920-X   *INDICATOR                  FP205740
                          BSI  L  WRIT3     BR TO WRITE SLET SECTOR     FP205750
                          MDX  L  BUFR3+1,1 BUMP TO NEXT SLET SCTR ADDR FP205760
                          BSI  L  FTCH3     BR TO READ SLET SECTOR      FP205770
                          LDX  I2 BY913     SET XR2 ADDR 1ST SLET SET   FP205780
                          STX  L2 C1020+1   *AND SAVE IN 'C1020'+1      FP205790
                          BSC  I  BD200     RETURN                      FP205800
                          HDNG    PROCESS A TYPE 'A' DATA RECORD        FP205810
                    BE000 DC      0         ENTRY                       FP205820
                          SRA     16        SET                         FP205830
                          STO   3 BY928-X   *TYPE 'F' INDICATOR AND     FP205840
                          STO   3 BY927-X   *TYPE '1' INDICATOR OFF     FP205850
                          STX  L0 BY933     SET TYPE 'A' INDR ON        FP205860
                          LD    3 BY941-X   IF BAD PHASE BEING FLUSHED  FP205870
                          BSC  L  BB000,Z   *BR TO READ NEXT RECORD     FP205880
                          LD    3 BY925-X   IS SYS LDR BYPASSING PHASES FP205890
                          BSC  L  BE080,+-  BR IF NOT BYPASSING PHASE   FP205900
                    *                                                   FP205910
                    * SYSTEM LOADER IS BYPASSING PHASES                 FP205920
                    *                                                   FP205930
                          LD    3 BY939-X                               FP205940
                          BSC  L  BE560,-+  BR IF SCTR BREAK INDR OFF   FP205950
                          LD    1 11        PHASE ID FROM 1ST DATA RCD  FP205960
                          BSC  L  BE020,-   IF PHASE ID NEGATIVE        FP205970
                          SRA     16        *MAKE IT                    FP205980
                          S     1 11        *POSITIVE                   FP205990
                    BE020 S     3 BY926-X   PASS CARDS UNTIL PH ID TO   FP206000
                          BSC  L  BE560,+Z  *GO TO IS REACHED           FP206010
                    *                                                   FP206020
                    * A PROGRAM HAS JUST BEEN BYPASSED. INDICATORS  2-3 FP206030
                    * ARE CLEARED.  THE HANDLING OF BYPASS LIMITS   2-3 FP206040
                    * HAS BEEN MOVED TO BE086.                      2-3 FP206050
                    *                                                   FP206060
                          SRA     16                                    FP206070
                          STO   3 BY925-X   CLEAR INDICATOR             FP206080
                          STO   3 BY941-X   CLEAR PHASE BYPASS INDR     FP206090
                          STO   3 BY944-X   CLEAR CK-SUM RCD SEQ CTR    FP206100
                          LD    3 BY975-X   RE-INITIALIZE CKSUM SUBR    FP206110
                          STO  L  CK060                                 FP206120
                    *                                                   FP206130
                    *                       CODING REMOVED.         2-3 FP206140
                    *                                                   FP206150
                    BE080 LD    1 3         FETCH TYPE & WD COUNT       FP206160
                          AND   3 BY957-X   MASK OUT TYPE               FP206170
                          STO     BE240+1   SAVE WORD COUNT FROM RECORD FP206180
                          BSI  L  CKSUM     BR TO CHECK-SUM SUBROUTINE  FP206190
                          LD    3 BY939-X   TEST FOR NEW SCTR SIGNAL    FP206200
                          BSC  L  BE220,+-  BR IF NOT NEW SECTOR        FP206210
                    *                                                   FP206220
                    * PROCESS FIRST DATA RECORD AFTER SECTOR BREAK      FP206230
                    * RECORD.                                           FP206240
                    *                                                   FP206250
                          LD   L  BE240+1   FETCH WORD COUNT            FP206260
                          S     3 BX901-X   SUBTRACT 1                  FP206270
                          BSI  L  ER004,+   BR IF WORD COUNT 0 OR 1     FP206280
                          LD    3 BY911-X   PREVIOUS CURRENT PHASE NOW  FP206290
                          STO   3 BY912-X   *IS OLD PHASE               FP206300
                          LD    1 11        PHASE ID FROM FIRST RECORD  FP206310
                          BSC  L  BE085,-   IF PHASE ID NEGATIVE        FP206320
                          SRA     16        *MAKE                       FP206330
                          S     1 11        *POSITIVE                   FP206340
                    BE085 STO   3 BY911-X   SET NEW CURRENT PHASE ID    FP206350
                    *                                                   FP206360
                    * BYPASS TEST FOR INITIAL LOAD AND RELOAD.          FP206370
                    * PROGRAMS TO BE SKIPPED BY THIS TEST               FP206380
                    * WERE INDICATED ON LOAD MODE RECORD                FP206390
                    *                                                   FP206400
                    * THE SKIP TABLE IS SEARCHED AND CHECKED        2-3 FP206410
                    * ON EACH OCCASION UNTIL - THE END OF THE TABLE 2-3 FP206420
                    * IS REACHED OR THE CURRENT SLET ID IS FOUND TO 2-3 FP206430
                    * BE LESS THAN A LOWER LIMIT OR THE CURRENT     2-3 FP206440
                    * SLET ID FITS INTO A LIMIT PAIR.               2-3 FP206450
                    *                                                   FP206460
                          LDX  L2 LOLIM     LD ADDR OF SKIP TABLE   2-3 FP206470
                    BE086 LD    2 0         CHK IF NO MORE PAIRS    2-3 FP206480
                          S     3 BX915-X   *IN SKIP TABLE          2-3 FP206490
                          BSC  L  BE090,+-  *BR IF END OF SKIP TBL  2-3 FP206500
                          LD    3 BY911-X   IS CURRENT SLET ID      2-3 FP206510
                          S     2 0         *LESS THAN LOWER  LIMIT 2-3 FP206520
                          BSC  L  BE090,+Z  *BR ON YES              2-3 FP206530
                          LD    3 BY911-X   IS CURRENT SLET ID LESS 2-3 FP206540
                          S     2 1         *THAN OR EQU UPPER LIMIT2-3 FP206550
                          BSC  L  BE087,+   *BR IF YES              2-3 FP206560
                          MDX   2 2         POINT TO NEXT PAIR      2-3 FP206570
                          MDX     BE086     *AND CHECK AGAIN        2-3 FP206580
                    BE087 LD    2 1         GET UPPER LIMIT OF      2-3 FP206590
                          A     3 BX901-X   *BY-PASS PAIR, ADD ONE      FP206600
                          STO   3 BY926-X   PH ID BEING LOOKED FOR      FP206610
                          STO   3 BY925-X   SET BYPASSING INDR ON       FP206620
                          NOP               A WAIT MAY BE PATCHED HERE  FP206630
                          LD    3 BY934-X   IF RELOAD                   FP206640
                          BSI  L  C0720,-   *BR TO REMOVE ANY SLET REF  FP206650
                          BSC  L  BE560     BR TO FLUSH DATA RECORDS    FP206660
                    *                                                   FP206670
                    * THIS PHASE IS TO BE LOADED                        FP206680
                    *                                                   FP206690
                    * SAVE DATA FROM PHASES WITH NEGATIVE IDS FOR       FP206700
                    * SPECIAL RELOAD TABLE.                             FP206710
                    *                                                   FP206720
                    BE090 LD    1 11        LOAD PHASE ID               FP206730
                          BSC  L  BE100,+   BR IF RELOAD TABLE ENTRY    FP206740
                          LD    3 BY934-X   TEST FOR AND BR IF RELOAD   FP206750
                          BSI  L  C0720,-   *TO CHK FOR ID IN TABLE     FP206760
                          MDX     BE180     INITIAL LOAD, NO SLET REF   FP206770
                    *                                                   FP206780
                    * THIS PHASE MAKES SLET TABLE REFERENCE             FP206790
                    *                                                   FP206800
                    BE100 LD   L  BE240+1   VERIFY THAT WD CNT IS AT    FP206810
                          S     3 BX904-X   *LEAST 4, ELSE              FP206820
                          BSI  L  ER021,Z+  *BR TO DISPLAY ERROR E 21   FP206830
                          LD   L  BUFR1     TEST WD CNT NOW IN RELOAD   FP206840
                          S     3 BX914-X   *TABLE                      FP206850
                          A     3 BX902-X   IF 318 OR OVER,             FP206860
                          BSI  L  ER030,-   *BR TO DISPLAY ERROR E 30   FP206870
                          SRA     16        MAKE NEGATIVE               FP206880
                          S     1 11        *PHASE ID                   FP206890
                          STO   1 11        *POSITIVE                   FP206900
                    BE120 STO  L  BUFR1+2   ST IN RELOAD TABLE BUFFER   FP206910
                          LD    1 12                                    FP206920
                    BE140 STO  L  BUFR1+3   ST RLTV LOC IN SPEC PHASE   FP206930
                          LD    1 13                                    FP206940
                    BE160 STO  L  BUFR1+4   ST NO. OF SETS REQUIRED     FP206950
                          MDX  L  BE120+1,3 MODIFY STORAGE ADDRESS      FP206960
                          MDX  L  BE140+1,3 MODIFY STORAGE ADDRESS      FP206970
                          MDX  L  BE160+1,3 MODIFY STORAGE ADDRESS      FP206980
                          MDX  L  BUFR1,3   BUMP WD CNT FOR FILE BY 3   FP206990
                    BE180 BSC  L  OVLAY+3   BRANCH TO OVERLAY 0 OR 1    FP207000
                    *                                                   FP207010
                    * OVERLAY 0 OR 1 NORMALLY RETURNS HERE              FP207020
                    *                                                   FP207030
                    BE200 LD    3 BY910-X   1ST SCTR ADDR OF NEW PHASE  FP207040
                          STO   3 BY945-X                               FP207050
                          STO   3 BY915-X   SAVE FOR SLET               FP207060
                          STX  L0 BY981     INDICATE PROG DATA TO WRITE FP207070
                          LD      BE240+1   LOAD WORD COUNT             FP207080
                          S     3 BX902-X   MODIFY WD CNT FROM RECORD   FP207090
                          STO     BE240+1   SAVE TO SET IN XR2          FP207100
                          LD    3 BY966-X   FETCH NOP CODING            FP207110
                          STO     BE260     CANCEL SKIP PAST INST TO    FP207120
                          MDX     BE240     *ADD TWO.  BR TO LOAD XR2   FP207130
                    BE220 LD    3 BY969-X   NOP THE ADD 2 INSTRUCTION   FP207140
                          STO     BE260     *BY INSERTING A JUMP        FP207150
                    BE240 LDX  L2 *-*       WORD COUNT OF RECORD        FP207160
                          LD    1 1         SAVE CORE LOC OF 1ST WORD   FP207170
                    BE260 MDX     BE280     AT SCTR BREAKS, ADDR OF     FP207180
                          A    L  BX902     *FIRST DATA WD IS 2 LARGER  FP207190
                    BE280 MDX  L0 BE900,0   IF NOT 0 DONT SET RLTV ADDR FP207200
                          MDX     BE320     BR TO TEST LOAD ADDR OF WD  FP207210
                    *                                                   FP207220
                    * DETERMINE RELATIVE ADDRESS FROM                   FP207230
                    * ADDRESS OF FIRST WORD IN SECTOR                   FP207240
                    *                                                   FP207250
                    BE300 S     3 BX901-X   SUBTRACT ONE                FP207260
                          MDX  L  BY943,1   INCR CORR FACTOR CTR        FP207270
                          BSC  L  BE300,Z   LOOP UNTIL ZERO             FP207280
                          LD    3 BY943-X   *AND SAVE RESULTING ADDR    FP207290
                          STO   3 BY940-X   SET UP CORRECTION FACTOR    FP207300
                          STX  L0 BE900     TURN INDC OFF               FP207310
                          LD    1 1         RELOAD ORIGINAL ADDRESS     FP207320
                          A     3 BX902-X   1ST 2 WDS ARE NOT STORED    FP207330
                    *                                                   FP207340
                    BE320 S     3 BY940-X   SUBTRACT RLTV ADDR IN SCTR  FP207350
                          BSI  L  ER004,Z+  BR IF ORG BACKWARDS         FP207360
                    BE340 STO   3 BY936-X   DATA WORD ON RECORD         FP207370
                          S     3 BY919-X   COMPARE RLTV ADDR WITH THE  FP207380
                          BSC  L  BE380,+   *HIGHEST SO FAR.  BR IF LOW FP207390
                          LD    3 BY936-X   SAVE HIGHEST 'BY936' VALUE  FP207400
                          STO   3 BY919-X   *FOR SLET TABLE             FP207410
                    BE380 LD    3 BY936-X   'BY936' CLIMBS WITH EACH WD FP207420
                          SRT     16        SET UP FOR DIVIDE           FP207430
                          D     3 BX914-X   DIVIDE BY WDS PER SCTR      FP207440
                          STD   3 BY900-X   SAVE QUOTIENT & REMAINDER   FP207450
                          LD    3 BZ908-X   IF A PROGRAM IS BEING ADDED FP207460
                          BSC  L  BE400,Z   *BR AROUND LENGTH CHECK     FP207470
                          LDD   3 BY900-X   SECTORS AND WDS ADDITIONAL  FP207480
                          S     3 BY947-X   PHASE LENGTH IN SECTORS     FP207490
                          BSC  L  C0500,-   BRANCH IF A SHIFT REQUIRED  FP207500
                    BE400 LDD   3 BY900-X   SECTORS AND WDS ADDN'L  2-5 FP207510
                          S     3 BY938-X   BR IF NO SCTR CHANGE REQ    FP207520
                          BSC  L  BE480,+-  PROGRAM ALREADY IN CORE     FP207530
                          LD    3 BY942-X   TEST FOR AND BR IF          FP207540
                          BSC  L  BE440,Z   *END OF PROG INDR ON        FP207550
                          LD    3 BY900-X   SET INDR WITH               FP207560
                          STO   3 BY938-X   *SCTR COUNT FROM DIVIDE     FP207570
                          MDX  L  BY942,1   SET SCTR BREAK INDR OFF     FP207580
                          MDX     BE460     BR TO SET UP A SCTR ADDR    FP207590
                    BE440 LD    3 BY900-X   SET INDR FOR THIS SCTR      FP207600
                          STO   3 BY938-X   OF PHASE                    FP207610
                          BSI  L  WRIT2     WRITE A SECTOR              FP207620
                          LD    3 BY900-X   FETCH QUOTIENT              FP207630
                    BE460 A     3 BY945-X   ADD SECTOR ADDRESS          FP207640
                          STO   3 BY916-X   MAINTAIN CURR SCTR ADDR     FP207650
                          STO  L  BUFR2+1   SET SECTOR ADDR IN BUFFER   FP207660
                          BSI  L  FTCH2     READ INTO 'BUFR2' FROM DISK FP207670
                          LDD   3 BY900-X   FETCH SPECS FOR THIS PHASE  FP207680
                    BE480 SLT     16        LOAD DISP IN CORE BUFFER    FP207690
                          A     3 BX902-X   INCR BY 2                   FP207700
                          A     3 BY950-X   SET UP RLTV STORAGE LOC     FP207710
                          STO     BE520+1   *IN CORE BUFFER             FP207720
                          LD    3 BY939-X   TEST FOR SCTR BREAK         FP207730
                          BSC  L  BE500,+-  BR IF NO SCTR BREAK         FP207740
                          SRA     16        CLEAR NEW SCTR INDR         FP207750
                          STO   3 BY939-X                               FP207760
                          MDX   1 2         FETCH 3RD DATA WORD INSTEAD FP207770
                    BE500 LD    1 10        NO SCTR ADDR IN THIS RECORD FP207780
                          MDX   2 0         SKIP IF XR2 IS ZERO         FP207790
                          MDX     BE520     *ELSE STORE A WORD          FP207800
                          MDX     BE540     BR TO READ NEXT RECORD      FP207810
                    BE520 STO  L  *-*       DATA WORD TO DISK BUFFER    FP207820
                          LD    3 BY936-X   INCR RLTV ADDR POINTER      FP207830
                          A     3 BX901-X   *BY ONE                     FP207840
                          MDX   1 1         POINT TO NEXT WD OF RECORD  FP207850
                          MDX   2 -1        SKIP AFTER LAST DATA WORD   FP207860
                          MDX     BE340     BR TO PROCESS NEXT DATA WD  FP207870
                    BE540 BSC  L  BB000     BR TO READ NEXT RECORD      FP207880
                    *                                                   FP207890
                    * SYSTEM LOADER SKIPPING THIS PHASE                 FP207900
                    *                                                   FP207910
                    BE560 LD    3 BX903-X   SET                         FP207920
                          STO   3 BY941-X   *BYPASS RECORDS INDR ON     FP207930
                          SRA     16        CLEAR                       FP207940
                          STO   3 BY939-X   *SECTOR BREAK INDICATOR     FP207950
                          BSC  L  BB000     BRANCH TO READ NEXT RECORD  FP207960
                    *                                                   FP207970
                    * WORK AREAS                                        FP207980
                    *                                                   FP207990
                    BE900 DC      *-*       TO SET RLTV SCTR WD IN SCTR FP208000
                    *                                                   FP208010
                    *************************************************** FP208020
                    *                                                   FP208030
                    * PROCESS THE CHECKSUM                              FP208040
                    *                                                   FP208050
                    CKSUM DC      0         ENTRY/RETURN ADDRESS        FP208060
                    CK020 LD   L  PKBFR+1   FETCH WORD 2                FP208070
                          BSC  I  CKSUM,+-  RETURN IF NO CHECKSUM       FP208080
                          MDX  L  BY944,1   INCREMENT THE SEQ NO.       FP208090
                          NOP               AVOID POSSIBLE SKIP         FP208100
                          LDX   2 54        XR2 = NO. WORDS PER RECORD  FP208110
                          LD    3 BY944-X   FETCH SEQUENCE NUMBER       FP208120
                    CK040 A    L2 PKBFR-1   ADD A WORD                  FP208130
                          BSC     C         SKIP IF NO CARRY            FP208140
                          A     3 BX901-X   ADD ONE                     FP208150
                          MDX   2 -1        DECR WORD CNT, SKIP IF ZERO FP208160
                          MDX     CK040     BRANCH TO ADD NEXT WORD     FP208170
                          S     3 BX901-X   TEST FOR AND                FP208180
                          BSC  I  CKSUM,+-  *RETURN IF BLANK RECORD     FP208190
                    CK060 MDX     CK080     'NOP' IF SEQUENCE ERROR     FP208200
                    *                                                   FP208210
                          BSI  L  ER001     BR TO PRINT ERROR MSG E 01  FP208220
                          MDX  L  BY944,-1  DECREMENT SEQUENCE NUMBER   FP208230
                          NOP                                           FP208240
                          BSC  L  BB000     BRANCH TO READ NEXT RECORD  FP208250
                    *                                                   FP208260
                    CK080 EOR   3 BY965-X   COMPLIMENT AND              FP208270
                          STO   3 BY944-X   *STORE CHECKSUM             FP208280
                          LD    3 BY966-X   CANCEL                      FP208290
                          STO     CK060     *RESET ABILITY              FP208300
                          MDX     CK020     BRANCH TO PROCESS AGAIN     FP208310
                          HDNG    END OF PROGRAM - 'F' RCRD PROCESSING  FP208320
                    BF000 DC      0         ENTRY                       FP208330
                          STX  L0 BY928     SET TYPE F INDR ON          FP208340
                          LD    3 BY931-X   TEST SWITCH FOR LAST PH     FP208350
                          BSI  L  BF100,+-  ZERO CONDITION IS ON        FP208360
                          LD    3 BY925-X   TEST NOW SKIPPING INDICATOR FP208370
                          OR    3 BY941-X   *OR FLUSH THIS PHASE INDR   FP208380
                          BSC  L  BB000,Z   BR TO READ NEXT RCD IF ON   FP208390
                          LD    3 BY933-X   VERIFY THAT 'F' FOLLOWS 'A' FP208400
                          BSI  L  ER003,+-  BR IF IT DOES NOT           FP208410
                          SRA     16                                    FP208420
                          STO   3 BY933-X   SET TYPE 'A' INDR OFF       FP208430
                          STO   3 BY981-X   IND NO PROG DATA TO WRITE   FP208440
                          BSI  L  WRIT2     WRITE PROGRAM DATA TO DISK  FP208450
                          LDX  I2 C1020+1   RESTORE XR2 POINTER TO SLET FP208460
                          LD    3 BY919-X   FINISH THIS SLET SET        FP208470
                          A     3 BX901-X   *IN CASE THIS SHOULD        FP208480
                          STO   2 -2        *BE THE LAST OR ONLY        FP208490
                          STO   3 BY977-X   SAVE FOR SHRINK TEST    2-4 FP208500
                          LD    3 BY915-X   *PHASE LOADED               FP208510
                          STO   2 -1                                    FP208520
                          BSI  L  WRIT3     WRITE SLET SECTOR TO DISK   FP208530
                          SRA     16                                    FP208540
                          STO   3 BY919-X   RESET WORD COUNT EACH PHASE FP208550
                          BSC  L  BD090     BR TO CHECK FOR GAP     2-4 FP208560
                    *                                                   FP208570
                    *************************************************** FP208580
                    *                                                   FP208590
                    * IF THE 2501 IS THE CARD READER WHEN THE 'F' CARD  FP208600
                    * IS ENCOUNTERED THE '81' CARD IS IN THE SECOND     FP208610
                    * BUFFER.  THEREFORE A READ IS UNNECCESSARY.        FP208620
                    *                                                   FP208630
                    BF100 DC      0         ENTRY/RETURN ADDRESS        FP208640
                          LD      *-1       *PHASE.  INDICATE PRESENT.  FP208650
                          STO   3 BY932-X   TEST FOR 2501 READER        FP208660
                          STO   3 BZ909-X   STOP DOUBLE BFR IF 2501     FP208670
                          MDX  L  $IBSY,0   ENSURE THAT '81' RECORD     FP208680
                          MDX     *-3       *READ IS COMPLETED          FP208690
                          BSC  I  BF100     CONTINUE                    FP208700
                          HDNG    END OF SYSTEM DECK - PROCESS '81' RCD FP208710
                    BG000 DC      0         ENTRY/RETURN ADDRESS        FP208720
                          LD    3 BY928-X   IF 'F' RECORD WAS MISSING   FP208730
                          BSI  L  ER003,+-  *DISPLAY OUT OF SEQ ERROR   FP208740
                          STO   3 BZ909-X   NO 2501 DOUBLE BFR WHEN ON  FP208750
                          LD    3 BY934-X   IF RELOAD, BRANCH TO        FP208760
                          BSC  L  BG060,-   *TEST ADD PROGRAM INDICATOR FP208770
                          LD    3 BY931-X   TEST FOR LAST REQ PH DONE   FP208780
                          BSI  L  ER024,Z   ERROR IF ANY PH MISSING     FP208790
                    *                                                   FP208800
                    * WHEN 'ER024' RETURNS, PRETEND NOTHING IS MISSING  FP208810
                    *                                                   FP208820
                    * SET UP TO FETCH OVERLAY 2                         FP208830
                    *                                                   FP208840
                    BG040 LD    3 BY960-X   FETCH SECTOR ADDRESS OF,    FP208850
                          LDX  L2 C2000     *ENTRY POINT TO             FP208860
                          BSI  L  BH000     *AND BR TO FETCH OVERLAY 2  FP208870
                    *                                                   FP208880
                    BG060 LD    3 BZ908-X   TEST ADD PROGRAM SWITCH     FP208890
                          BSC  L  BG040,+-  BRANCH IF OFF               FP208900
                          LD   L  LPHID     TEST IF ALL PHASES IN   2-9 FP208910
                          S     3 BY911-X                               FP208920
                          BSI  L  ER024,-Z  ERROR IF PHASE MISSING  2-9 FP208930
                    *                                                   FP208940
                    * CALCULATE NEW LET ADDRESS                         FP208950
                    *                                                   FP208960
                          LD    3 BY937-X   FETCH LAST SCTR ADDR USED   FP208970
                          SRA     3         DECR TO LAST CYLINDER ADDR  FP208980
                          SLA     3         ADD 1 CYL MORE, AND 1 CYL   FP208990
                          A     3 BX910-X   *FOR CUSHION, 1 FOR SCRA,   FP209000
                          STO   3 BZ903-X   *AND 2 FOR CIB.  40 SCTRS.  FP209010
                          STO   3 BY918-X   SAVE ALSO AS 'TO' ADDR  2-4 FP209020
                          LD    3 BY958-X   CALCULATE               2-4 FP209030
                          S    L  SHIFT     *'FROM'                 2-4 FP209040
                          STO   3 BY917-X   *ADDR                   2-4 FP209050
                          LD   L  SHIFT     SET SECTORS TO SHIFT    2-4 FP209060
                          STO   3 BY978-X   *COUNT                  2-4 FP209070
                          BSI  L  C0300     GO SHIFT LET/UA LEFT    2-4 FP209080
                          MDX     BG040     SETUP PRINC DEVICE ENTRIES  FP209090
                          HDNG    FETCH AND BRANCH TO OVERLAYS          FP209100
                    BH000 DC      0         ENTRY                       FP209110
                          STX   2 BH020     STORE OVERLAY ENTRY ADDRESS FP209120
                          STO  L  OVLAY+1   STORE OVERLAY SCTR ADDRESS  FP209130
                          LD      BH902     FETCH AND                   FP209140
                          STO  L  OVLAY     *STORE OVERLAY WORD COUNT   FP209150
                          LDD     BH900     FETCH FUNC CODE/I/O AR ADDR FP209160
                          BSI  L  DZ000     BRANCH TO FETCH OVERLAY     FP209170
                    BH010 MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  FP209180
                          MDX     BH010     BR TO TEST READ COMPLETE    FP209190
                          BSC  L  *-*       BRANCH TO THE OVERLAY       FP209200
                    BH020 EQU     *-1       ADDRESS OF OVERLAY ENTRY    FP209210
                    *                                                   FP209220
                    * CONSTANTS AND WORK AREAS                          FP209230
                    *                                                   FP209240
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   FP209250
                    BH900 DC      /0000     READ FUNCTION CODE          FP209260
                          DC      OVLAY     ADDRESS OF OVERLAY I/O AREA FP209270
                    BH902 DC      2*@SCNT   WORD COUNT OF OVERLAYS      FP209280
                          HDNG    MISCELLANEOUS SUBROUTINES             FP209290
                    *************************************************** FP209300
                    *                                                   FP209310
                    * SET INDICATORS TO BYPASS PHASE                    FP209320
                    *                                                   FP209330
                    BYPAS DC      0         ENTRY                       FP209340
                          LD    3 BX901-X   SET                         FP209350
                          STO   3 BY941-X   *BYPASS PHASES INDICATOR ON FP209360
                          SRA     16        CLEAR                       FP209370
                          STO   3 BY939-X   *FIRST DATA RECORD INDR     FP209380
                          STO   3 BY981-X   IND NO PROG DATA TO STORE   FP209390
                          STO   3 BY982-X   IND NO SLET TO FINISH       FP209400
                          LD    3 BY983-X   REDUCE HIGHEST SCTR ADDR    FP209410
                          STO   3 BY937-X   *WRITTEN TO PREV VALUE      FP209420
                          BSC  L  BB000     BRANCH TO READ NEXT RECORD  FP209430
                    *                                                   FP209440
                    *************************************************** FP209450
                    *                                                   FP209460
                    * READ A SECTOR FROM DISK.                          FP209470
                    *                                                   FP209480
                    FTCH2 DC      0         ENTRY/RETURN ADDRESS        FP209490
                          LDD     F2900     FETCH FUNC CODE, I/O ADDR   FP209500
                          BSI  L  DZ000     BRANCH TO READ A SECTOR     FP209510
                          MDX  L  $DBSY,0   SKIP NEXT IF  READ COMPLETE FP209520
                          MDX     *-3       BR TO TEST READ COMPLETE    FP209530
                          BSC  I  FTCH2     RETURN                      FP209540
                    *                                                   FP209550
                    * CONSTANTS AND WORK AREAS                          FP209560
                    *                                                   FP209570
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   FP209580
                    F2900 DC      /0000     READ FUNCTION CODE          FP209590
                          DC      BUFR2     ADDRESS OF I/O AREA         FP209600
                    *                                                   FP209610
                    *************************************************** FP209620
                    *                                                   FP209630
                    * READ A SECTOR OF SLET.                            FP209640
                    *                                                   FP209650
                    FTCH3 DC      0         ENTRY/RETURN ADDRESS        FP209660
                          LDD     F3900     FETCH FUNC CODE, I/O ADDR   FP209670
                          BSI  L  DZ000     BRANCH TO READ A SECTOR     FP209680
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  FP209690
                          MDX     *-3       BR TO TEST READ COMPLETE    FP209700
                          BSC  I  FTCH3     RETURN                      FP209710
                    *                                                   FP209720
                    * CONSTANTS AND WORK AREAS                          FP209730
                    *                                                   FP209740
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   FP209750
                    F3900 DC      /0000     READ FUNCTION CODE          FP209760
                          DC      BUFR3     ADDRESS OF SLET I/O AREA    FP209770
                    *                                                   FP209780
                    *************************************************** FP209790
                    *                                                   FP209800
                    * DETERMINE IF RECORD IS // XEQ MODIF OR SCTR BREAK FP209810
                    *                                                   FP209820
                    MODIF DC      0         ENTRY                       FP209830
                          LD   L  OVLAY+2   FETCH OVERLAY INDICATOR     FP209840
                          S     3 BX903-X   TEST FOR AND BRANCH         FP209850
                          BSI  L  C3060,+-  *IF BEYOND TYPE '81' RECORD FP209860
                          BSI  L  BD000     BR TO PROCESS SCTR BRK RCD  FP209870
                    *                                                   FP209880
                    *************************************************** FP209890
                    *                                                   FP209900
                    * SLET SEARCH SUBROUTINE.                           FP209910
                    *                                                   FP209920
                    SSLET DC      0         ENTRY/RETURN ADDRESS        FP209930
                          STO     SS900     SAVE PHASE ID TO SEARCH FOR FP209940
                          STX   1 SS080+1   SAVE XR1                    FP209950
                          LD    3 BY955-X   STORE FIRST                 FP209960
                          STO  L  BUFR3+1   *SLET SCTR ADDR TO BUFFER   FP209970
                    SS020 BSI     FTCH3     BR TO FETCH A SLET SECTOR   FP209980
                          LDX  I2 BY913     XR2 POINT TO FIRST SLET SET FP209990
                          LDX   1 80        XR1 INDICATES SETS PER SCTR FP210000
                    SS040 LD      SS900     FETCH THE PHASE ID          FP210010
                          S     2 0         TEST FOR AND BRANCH         FP210020
                          BSC  L  SS060,+-  *IF MATCH FOUND IN SLET     FP210030
                          MDX   2 4         INCREMENT SLET SET POINTER  FP210040
                          MDX   1 -1        DECR SET CNT, SKIP IF ZERO  FP210050
                          MDX     SS040     BRANCH TO TEST NEXT SET     FP210060
                          LD   L  BUFR3+1   FETCH SLET SECTOR ADDRESS   FP210070
                          S     3 BY956-X   TEST FOR AND BRANCH IF LAST FP210080
                          BSC  L  SS080,+-  *SLET SCTR (RET PH ID = 0)  FP210090
                          MDX  L  BUFR3+1,1 INCR SLET SECTOR ADDRESS    FP210100
                          MDX     SS020     BR TO FETCH NEXT SLET SCTR  FP210110
                    SS060 LD      SS900     FETCH FOUND PHASE ID        FP210120
                    SS080 LDX  L1 *-*       RESTORE XR1                 FP210130
                          BSC  I  SSLET     RETURN                      FP210140
                    *                                                   FP210150
                    * CONSTANTS AND WORK AREAS                          FP210160
                    *                                                   FP210170
                    SS900 DC      *-*       PHASE ID BEING LOOKED FOR   FP210180
                    *                                                   FP210190
                    *************************************************** FP210200
                    *                                                   FP210210
                    * UPDATE CORE ADDRESS OF PHASE AND STORE IN SLET.   FP210220
                    *                                                   FP210230
                    UPCAD DC      0         ENTRY/RETURN ADDRESS        FP210240
                          LD    3 BY911-X   FETCH ID OF CURRENT PHASE   FP210250
                          STO   2 0         *AND STORE TO SLET          FP210260
                          LD   L  PKBFR     FETCH ADDR OF CURR PROGRAM  FP210270
                          STO   2 1         *AND STORE TO SLET          FP210280
                          STX   2 UP900     SAVE XR2                    FP210290
                          LD      UP900     FETCH SLET POINTER          FP210300
                          S     3 BY914-X   TEST FOR AND                FP210310
                          BSC  L  UP040,Z   *BRANCH IF NOT LAST SET     FP210320
                          STX  L0 BY920     SET SLET UPDATE INDR ON     FP210330
                    UP040 MDX   2 4         INCR TO NEXT SLET SET       FP210340
                          STX  L2 C1020+1   STORE NEW SLET SET POINTER  FP210350
                          LDX  L1 PKBFR-1   XR1 POINTS TO RECORD BUFFER FP210360
                          STX  L0 BY982     IND SLET ENTRY TO FINISH    FP210370
                          BSC  I  UPCAD     RETURN                      FP210380
                    *                                                   FP210390
                    UP900 DC      *-*       TEMPORARY XR2 STORAGE       FP210400
                    *                                                   FP210410
                    *************************************************** FP210420
                    *                                                   FP210430
                    * WRITE RELOAD TABLE TO DISK.                       FP210440
                    *                                                   FP210450
                    WRIT1 DC      0         ENTRY/RETURN ADDRESS        FP210460
                          LDD     W1900     FETCH FUNC CODE, I/O ADDR   FP210470
                          BSI  L  DZ000     BR TO WRITE RELOAD TABLE    FP210480
                    W1040 MDX  L  $DBSY,0   SKIP IF WRITE COMPLETE      FP210490
                          MDX     W1040     BR TO TEST WRITE COMPLETE   FP210500
                          BSC  I  WRIT1     RETURN                      FP210510
                    *                                                   FP210520
                    * CONSTANTS AND WORK AREAS.                         FP210530
                    *                                                   FP210540
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   FP210550
                    W1900 DC      /0001     WRITE FUNCTION CODE         FP210560
                          DC      BUFR1     ADDRESS OF RELOAD TABLE BFR FP210570
                    *                                                   FP210580
                    *************************************************** FP210590
                    *                                                   FP210600
                    * WRITE A SECTOR TO THE DISK.                       FP210610
                    *                                                   FP210620
                    WRIT2 DC      0         ENTRY/RETURN ADDRESS        FP210630
                          LD   L  BUFR2+1   FETCH SECTOR ADDRESS        FP210640
                          EOR  L  B2END     TEST FOR AND                FP210650
                          BSC  I  WRIT2,+-  *RETURN IF NOT SET          FP210660
                          LD      W2902     FETCH '81' RECORD INDR      FP210670
                          BSC  L  W2100,+-  BRANCH IF NOT SET           FP210680
                    W2040 LDD     W2900     FETCH FUNC CODE, I/O ADDR   FP210690
                          BSI  L  DZ000     BRANCH TO WRITE A SECTOR    FP210700
                          MDX  L  $DBSY,0   SPIP NEXT IF WRITE COMPLETE FP210710
                          MDX     *-3       BR TO TEST WRITE COMPLETE   FP210720
                          BSC  I  WRIT2     RETURN                      FP210730
                    *                                                   FP210740
                    * SAVE ADDRESS OF HIGHEST SECTOR TO WHICH A         FP210750
                    * PROGRAM WAS LOADED.                               FP210760
                    *                                                   FP210770
                    W2100 LD    3 BY937-X   FETCH PREVIOUS HIGH SECTOR  FP210780
                          S    L  BUFR2+1   TEST FOR AND                FP210790
                          BSC  L  W2140,-   *BRANCH IF GT THIS SECTOR   FP210800
                          LD   L  BUFR2+1   RESET                       FP210810
                          STO   3 BY937-X   *HIGH SECTOR ADDRESS        FP210820
                    W2140 LD    3 BY934-X   FETCH LOAD MODE INDICATOR   FP210830
                          BSC  L  W2040,+Z  BRANCH IF AN INITIAL LOAD   FP210840
                          LD    3 BZ908-X   TEST FOR AND                FP210850
                          BSC  L  W2040,Z   *BRANCH IF PROGRAM(S) ADDED FP210860
                          LD    3 BY935-X   FETCH SECTOR ADDRESS OF CIB FP210870
                          S     3 BX908-X   TEST FOR                    FP210880
                          S    L  BUFR2+1   *AND BRANCH IF              FP210890
                          BSC  L  W2040,Z-  *NO ATTEMPT TO OVERLAY SCRA FP210900
                          BSI  L  ER022     BR TO PRINT ERROR MSG E 22  FP210910
                    *                                                   FP210920
                    * CONSTANTS AND WORK AREAS                          FP210930
                    *                                                   FP210940
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   FP210950
                    W2900 DC      /0001     WRITE FUNCTION CODE         FP210960
                          DC      BUFR2     ADDRESS OF I/O BUFFER       FP210970
                    W2902 DC      *-*       '81' RECORD READ INDICATOR  FP210980
                    *                                                   FP210990
                    *************************************************** FP211000
                    *                                                   FP211010
                    * WRITE A SLET SECTOR.                              FP211020
                    *                                                   FP211030
                    WRIT3 DC      0         ENTRY/RETURN ADDRESS        FP211040
                          LDD     W3900     FETCH FUNC CODE, I/O ADDR   FP211050
                          BSI  L  DZ000     BRANCH TO WRITE A SLET SCTR FP211060
                          MDX  L  $DBSY,0   SKIP NEXT IF WRITE COMPLETE FP211070
                          MDX     *-3       BR TO TEST WRITE COMPLETE   FP211080
                          BSC  I  WRIT3     RETURN                      FP211090
                    *                                                   FP211100
                    * CONSTANTS AND WORK AREAS                          FP211110
                    *                                                   FP211120
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   FP211130
                    W3900 DC      /0001     WRITE FUNCTION CODE         FP211140
                          DC      BUFR3     ADDRESS OF SLET I/O AREA    FP211150
                          HDNG    PRINT ERROR MESSAGES                  FP211160
                    ER001 DC      0         ENTRY/RETURN ADDRESS        FP211170
                          LDX  L1 MSG01+1   POINT TO ERROR MESSAGE E 01 FP211180
                          LDX  I2 MSG01     FETCH WORD CNT OF MSG E 01  FP211190
                          BSI  L  CNPTR     PRINT THE MESSAGE           FP211200
                          BSC  I  ER001     RETURN                      FP211210
                    *                                                   FP211220
                    ER002 DC      0         ENTRY/RETURN ADDRESS        FP211230
                          LDX  L1 MSG02+1   POINT TO ERROR MESSAGE E 02 FP211240
                          LDX  I2 MSG02     FETCH WORD CNT OF MSG E 02  FP211250
                          MDX     ER100     BRANCH TO PRINT MESSAGE     FP211260
                    *                                                   FP211270
                    ER003 DC      0         ENTRY/RETURN ADDRESS        FP211280
                          LDX  L1 MSG03+1   POINT TO ERROR MESSAGE E 03 FP211290
                          LDX  I2 MSG03     FETCH WORD CNT OF MSG E 03  FP211300
                          MDX     ER100     BRANCH TO PRINT MESSAGE     FP211310
                    *                                                   FP211320
                    ER004 DC      0         ENTRY/RETURN ADDRESS        FP211330
                          LDX  L1 MSG04+1   POINT TO ERROR MESSAGE E 04 FP211340
                          LDX  I2 MSG04     FETCH WORD CNT OF MSG E 04  FP211350
                          MDX     ER100     BRANCH TO PRINT MESSAGE     FP211360
                    *                                                   FP211370
                    ER005 DC      0         ENTRY/RETURN ADDRESS        FP211380
                          LDX  L1 MSG05+1   POINT TO ERROR MESSAGE E 05 FP211390
                          LDX  I2 MSG05     FETCH WORD CNT OF MSG E 05  FP211400
                          MDX     ER620     PRINT ABORT MESSAGE         FP211410
                    *                                                   FP211420
                    ER020 DC      0         ENTRY/RETURN ADDRESS        FP211430
                          LDX  L1 MSG20+1   POINT TO ERROR MESSAGE E 20 FP211440
                          LDX  I2 MSG20     FETCH WORD CNT OF MSG E 20  FP211450
                          MDX     ER600     BRANCH TO PRINT THE MESSAGE FP211460
                    *                                                   FP211470
                    ER021 DC      0         ENTRY/RETURN ADDRESS        FP211480
                          LDX  L1 MSG21+1   POINT TO ERROR MESSAGE E 21 FP211490
                          LDX  I2 MSG21     FETCH WORD CNT OF MSG E 21  FP211500
                    ER100 BSI  L  CNPTR     PRINT THE MESSAGE           FP211510
                          BSC  L  BB000     BRANCH TO READ NEXT RECORD  FP211520
                    *                                                   FP211530
                    ER022 DC      0         ENTRY/RETURN ADDRESS        FP211540
                          LDX  L1 MSG22+1   POINT TO ERROR MESSAGE E 22 FP211550
                          LDX  I2 MSG22     FETCH WORD CNT OF MSG E 22  FP211560
                          MDX     ER600     BRANCH TO PRINT MESSAGE     FP211570
                    *                                                   FP211580
                    ER023 DC      0         ENTRY/RETURN ADDRESS        FP211590
                          LDX  L1 MSG23+1   POINT TO ERROR MESSAGE E 23 FP211600
                          LDX  I2 MSG23     FETCH WORD CNT OF MSG E 23  FP211610
                          LD   L  PKBFR-1+11 FETCH PHASE ID             FP211620
                          MDX     ER400     BRANCH TO STORE PHASE ID    FP211630
                    *                                                   FP211640
                    ER024 DC      0         ENTRY/RETURN ADDRESS        FP211650
                          LDX  L1 MSG24+1   POINT TO ERROR MESSAGE E 24 FP211660
                          LDX  I2 MSG24     FETCH WORD CNT OF MSG E 24  FP211670
                          LD   L  PKBFR-1+11 FETCH PHASE ID             FP211680
                          STO   3 BY906-X   STORE PHASE ID FOR DISPLAY  FP211690
                          BSI  L  CNPTR     PRINT THE MESSAGE           FP211700
                          BSC  I  ER024     RETURN                      FP211710
                    *                                                   FP211720
                    ER025 DC      0         ENTRY/RETURN ADDRESS        FP211730
                          LDX  L1 MSG25+1   POINT TO ERROR MESSAGE E 25 FP211740
                          LDX  I2 MSG25     FETCH WORD CNT OF MSG E 25  FP211750
                    ER300 LD    3 BY911-X   FETCH PHASE ID              FP211760
                    ER400 STO   3 BY906-X   STORE PHASE ID FOR DISPLAY  FP211770
                          BSI  L  CNPTR     PRINT THE MESSAGE           FP211780
                          BSI  L  BYPAS     BRANCH TO BYPASS THE PHASE  FP211790
                    *                                                   FP211800
                    ER026 DC      0         ENTRY/RETURN ADDRESS        FP211810
                          STX   1 ER510+1   SAVE XR1                    FP211820
                          STX   2 ER520+1   SAVE XR2                    FP211830
                          STD   3 BY906-X   STORE DISPLAY               FP211840
                          LDX  L1 MSG26+1   POINT TO ERROR MESSAGE E 26 FP211850
                          LDX  I2 MSG26     FETCH WORD CNT OF MSG E 26  FP211860
                          BSI  L  CNPTR     PRINT THE MESSAGE           FP211870
                    ER510 LDX  L1 *-*       RESTORE XR1                 FP211880
                    ER520 LDX  L2 *-*       RESTORE XR2                 FP211890
                          BSC  I  ER026     RETURN                      FP211900
                    *                                                   FP211910
                    ER027 DC      0         ENTRY/RETURN ADDRESS        FP211920
                          LDX  L1 MSG27+1   POINT TO ERROR MESSAGE E 27 FP211930
                          LDX  I2 MSG27     FETCH WORD CNT OF MSG E 27  FP211940
                          MDX     ER620     PRINT ABORT MESSAGE         FP211950
                    *                                                   FP211960
                    ER600 BSI  L  CNPTR     PRINT THE MESSAGE           FP211970
                          NOP               A WAIT MAY BE PATCHED HERE  FP211980
                    ER610 STX  L0 BZ909     STOP DOUBLE CARD BUFFERING  FP211990
                          BSC  L  BG040     BRANCH TO FETCH OVERLAY 2   FP212000
                    *                                                   FP212010
                    ER028 DC      0         ENTRY/RETURN ADDRESS        FP212020
                          LDX  L1 MSG28+1   POINT TO ERROR MESSAGE E 28 FP212030
                          LDX  I2 MSG28     FETCH WORD CNT OF MSG E 28  FP212040
                          MDX     ER300     BRANCH TO FETCH DISPLAY     FP212050
                    *                                                   FP212060
                    ER029 DC      0         ENTRY/RETURN ADDRESS        FP212070
                          LDX  L1 MSG29+1   POINT TO ERROR MESSAGE E 29 FP212080
                          LDX  I2 MSG29     FETCH WORD CNT OF MSG E 29  FP212090
                          MDX     ER300     BRANCH TO DISPLAY PHASE ID  FP212100
                    *                                                   FP212110
                    ER030 DC      0         ENTRY                       FP212120
                          LDX  L1 MSG30+1   POINT TO ERROR MESSAGE E 30 FP212130
                          LDX  I2 MSG30     FETCH WORD CNT OF MSG E 30  FP212140
                          MDX     ER300     BRANCH TO PRINT MESSAGE     FP212150
                    *                                                   FP212160
                    ER130 DC      0         ENTRY                       FP212170
                          LDX  L1 MSG30+1   POINT TO ERROR MESSAGE E 30 FP212180
                          LDX  I2 MSG30     FETCH WORD CNT OF MSG E 30  FP212190
                          MDX     ER620     PRINT ABORT MESSAGE         FP212200
                    *                                                   FP212210
                    ER031 DC      0         ENTRY                       FP212220
                          LDX  L1 MSG31+1   POINT TO ERROR MESSAGE E 31 FP212230
                          LDX  I2 MSG31     FETCH WORD CNT OF MSG E 31  FP212240
                          MDX     ER620     PRINT ABORT MESSAGE         FP212250
                    *                                                   FP212260
                    *                                                   FP212270
                    ER032 DC      0         ENTRY                       FP212280
                          LDX  L1 MSG32+1   POINT TO ERROR MSG E 32     FP212290
                          LDX  I2 MSG32     FETCH WD CNT OF MSG E 32    FP212300
                    ER620 STX   1 ER660+1   SAVE XR1                    FP212310
                          STX   2 ER670+1   SAVE XR2                    FP212320
                          LD   L  SS900     LOAD MISSING PHASE ID       FP212330
                          STO   3 BY906-X   SAVE FOR ACCUM DISPLAY      FP212340
                    ER640 BSI  L  CNPTR     PRINT THE MESSAGE           FP212350
                    ER660 LDX  L1 *-*       RESTORE XR1 FOR REPRINT     FP212360
                    ER670 LDX  L2 *-*       RESTORE XR2 FOR REPRINT     FP212370
                          MDX     ER640     NO RECOVERY, PRINT AGAIN    FP212380
                    *                                                   FP212390
                    * ERROR MESSAGES                                    FP212400
                    *                                                   FP212410
                    MSG20 DC      MSG21-*   WORD COUNT OF MESSAGE E 20  FP212420
                          DMES    'RE 20 FIXED AREA PRESENT'R'E         FP212430
                    MSG21 DC      MSG22-*   WORD COUNT OF MESSAGE E 21  FP212440
                          DMES    'RE 21 SYSTEM DECK ERROR'R'E          FP212450
                    MSG22 DC      MSG23-*   WORD COUNT OF MESSAGE E 22  FP212460
                          DMES    'RE 22 SCRA OVERLAY - STOP'R'E        FP212470
                    MSG23 DC      MSG24-*   WORD COUNT OF MESSAGE E 23  FP212480
                          DMES    'RE 23 PHASE ID OUT OF SEQUENCE'R'E   FP212490
                    MSG24 DC      MSG25-*   WORD COUNT OF MESSAGE E 24  FP212500
                          DMES    'RE 24 PHASE MISSING'R'E              FP212510
                    MSG25 DC      MSG26-*   WORD COUNT OF MESSAGE E 25  FP212520
                          DMES    'RE 25 PHASE ID NOT IN PHID RECORD 'R FP212530
                    MSG26 DC      MSG27-*   WORD COUNT OF MESSAGE E 26  FP212540
                          DMES    'RE 26 PHASE ID NOT IN SLET'R'E       FP212550
                    MSG27 DC      MSG28-*   WORD COUNT OF MESSAGE E 27  FP212560
                          DMES    'RE 27 DEFECTIVE SLET'R'E             FP212570
                    MSG28 DC      MSG29-*   WORD COUNT OF MESSAGE E 28  FP212580
                          DMES    'RE 28 SLET FULL'R'E                  FP212590
                    MSG29 DC      MSG30-*   WORD COUNT OF MESSAGE E 29  FP212600
                          DMES    'RE 29 PROGRAM NOT PRESENT'R'E        FP212610
                    MSG30 DC      MSG31-*   WORD COUNT OF MESSAGE E 30  FP212620
                          DMES    'RE 30 RELOAD TABLE FULL'R'E          FP212630
                    MSG31 DC      MSG32-*   WORD COUNT OF MESSAGE E 31  FP212640
                          DMES    'RE 31 MISSING PHASE ID DUE TO'       FP212650
                          DMES     DEFECTIVE SLET OR RELOAD TABLE'R'E   FP212660
                    MSG32 DC      MSG33-*   WORD COUNT OF MESSAGE E 32  FP212670
                          DMES    'RE 32 MISSING SYSTEM I/O PHASE'R'E   FP212680
                    MSG33 BSS     0                                     FP212690
                    *                                                   FP212700
                    * PRINT TO THE CONSOLE PRINTER AND WAIT.            FP212710
                    *                                                   FP212720
                    CNPTR DC      0         ENTRY/RETURN ADDRESS        FP212730
                          BSI  L  WRTYZ     BR TO CONSOLE PRINTER SUBR  FP212740
                          LDD   3 BY906-X   FETCH ACC, EXT TO DISPLAY   FP212750
                          BSI  L  $PRET     BRANCH TO PRE-OP TRAP       FP212760
                          SLT     32        CLEAR                       FP212770
                          STD   3 BY906-X   *DISPLAY WORDS              FP212780
                          BSC  I  CNPTR     RETURN                      FP212790
                          HDNG    PHASE 2 CONSTANTS AND WORK AREAS      FP212800
                    BX901 DC      1         CONSTANT ONE                FP212810
                    BX902 DC      2         CONSTANT TWO                FP212820
                    BX903 DC      3         CONSTANT THREE              FP212830
                    BX904 DC      4         CONSTANT FOUR               FP212840
                    BX905 DC      5         CONSTANT FIVE               FP212850
                    BX906 DC      6         CONSTANT SIX                FP212860
                    BX908 DC      8         CONSTANT EIGHT              FP212870
                    BX909 DC      16        NO. OF SCTRS IN 2 CYLINDERS FP212880
                    BX910 DC      40        NO. OF SCTRS IN 5 CYLINDERS FP212890
                    BX912 DC      /0072     USED TO DETERMINE RCD TYPE  FP212900
                    BX913 DC      @SCNT-1   NO. OF WORDS PER SECTOR - 1 FP212910
                    BX914 DC      @SCNT     NO. OF WORDS PER SECTOR     FP212920
                    BX915 DC      /0999     CON FOR END OF SKIP TBL 2-3 FP212930
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   FP212940
                    BY900 DC      *-*       USED TO DETERMINE SCTR ADDR FP212950
                          DC      *-*       *AND RLTV LOC OF DATA WORDS FP212960
                    BY902 DC      *-*       USED TO DETERMINE NO. OF    FP212970
                    BY903 DC      *-*       *SECTORS A PHASE OCCUPIES   FP212980
                    BY904 DC      *-*       CURRENT                     FP212990
                    BY905 DC      *-*       *PHASE ID LIMITS            FP213000
                    BY906 DC      *-*       DISPLAY                     FP213010
                          DC      *-*       *WORDS                      FP213020
                    BY909 DC      1         FIRST PHASE ID OF A PAIR    FP213030
                    BY910 DC      8         1ST SCTR ADDR OF NEW PHASE  FP213040
                    BY911 DC      *-*       CURRENT PHASE ID            FP213050
                    BY912 DC      *-*       PREVIOUS PHASE ID           FP213060
                    BY913 DC      BUFR3+2   ADDRESS OF FIRST SLET SET   FP213070
                    BY914 DC      BUFR3+2+316  ADDRESS OF LAST SLET SET FP213080
                    BY915 DC      *-*       1ST SCTR ADDR OF EACH PHASE FP213090
                    BY916 DC      *-*       CURRENT SECTOR ADDRESS      FP213100
                    BY917 DC      *-*       FROM ADDRESS FOR FETCH      FP213110
                    BY918 DC      *-*       TO ADDRESS FOR STORE        FP213120
                    BY919 DC      *-*       MAXIMUM WORD CNT PER PHASE  FP213130
                    BY920 DC      *-*       SLET UPDATE INDICATOR       FP213140
                    BY922 DC      @RLTB-@SLET  NO. OF SECTOR OF SLET    FP213150
                    BY923 DC      *-*       HIGHEST SCTR USED BY SYS    FP213160
                    BY924 DC      *-*       PHASE ID OF LAST SYS PROG   FP213170
                    BY925 DC      *-*       BYPASSING PHASES INDICATOR  FP213180
                    BY926 DC      *-*       PHASE ID TO BE BYPASSED     FP213190
                    BY927 DC      *-*       SECTOR BREAK RECORD INDR    FP213200
                    BY928 DC      1         TYPE 'F' RECORD INDICATOR   FP213210
                    BY929 DC      *-*       'CARD1' BUSY/PACKED INDR    FP213220
                    BY930 DC      *-*       'CARD2' BUSY/PACKED INDR    FP213230
                    BY931 DC      1         LAST PHASE INDICATOR        FP213240
                    BY932 DC      *-*       LAST TYPE 'F' RECORD INDR   FP213250
                    BY933 DC      *-*       TYPE 'A' RECORD INDICATOR   FP213260
                    X     DC      *-*       FOR EMERGENCY USE           FP213270
                    BY934 DC      *-*       LOAD MODE INDICATOR         FP213280
                    BY935 DC      /0333     SECTOR ADDRESS OF CIB       FP213290
                    BY936 DC      *-*       CORE ADDR OF CURR DATA WORD FP213300
                    BY937 DC      7         HIGHEST SCTR ADDR WRITTEN   FP213310
                    BY938 DC      *-*       SCTR ADDR OF SECTOR IN CORE FP213320
                    BY939 DC      *-*       FIRST DATA RECORD INDR      FP213330
                    BY940 DC      *-*       CORE ADDRESS CORRECTION     FP213340
                    BY941 DC      *-*       PHASE BYPASS INDICATOR      FP213350
                    BY942 DC      0         END OF PROGRAM INDICATOR    FP213360
                    BY943 DC      0         USED TO SET CORRECTION      FP213370
                    BY944 DC      0         CHECKSUM SEQUENCE COUNTER   FP213380
                    BY945 DC      1         1ST SCTR ADDR OF NEW PHASE  FP213390
                    BY946 DC      1         CARD BUFFER PACKING INDR    FP213400
                    BY947 DC      /7777     PHASE LENGTH IN SECTORS     FP213410
                    BY948 DC      CARD1-1   ADDRESS OF 'CARD1'          FP213420
                    BY949 DC      CARD2-1   ADDRESS OF 'CARD2'          FP213430
                    BY950 DC      BUFR2     ADDRESS OF DATA BUFFER      FP213440
                    BY951 DC      $ZEND-@CSTR-4-2  RLTV LOC OF CIL DATA FP213450
                    BY952 DC      @DCOM     DCOM SECTOR ADDRESS         FP213460
                    BY954 DC      @RIAD     SECTOR ADDRESS OF RES IMAGE FP213470
                    BY955 DC      @SLET     FIRST SLET SECTOR ADDRESS   FP213480
                    BY956 DC      @SLET+2   THIRD SLET SECTOR ADDRESS   FP213490
                    BY957 DC      /00FF     MASK OUT TYPE IN WORD 3     FP213500
                    BY958 DC      @P2AD     SCTR ADDR OF SYS LDR PH 2   FP213510
                    BY960 DC      @P2AD+5+2+3    SCTR ADDR OF OVERLAY 2 FP213520
                    BY961 DC      @P2AD+5+2+3+2  SCTR ADDR OF OVERLAY 3 FP213530
                    BY962 DC      /063F     MAXIMUM SECTOR ADDRESS      FP213540
                    BY963 DC      @MNCR-6   WORD COUNT OF CIB           FP213550
                    BY964 DC      /8000     NEGATIVE SIGN BIT           FP213560
                    BY965 DC      /FFFF     COMPLIMENTING MASK          FP213570
                    BY966 NOP               'NOP' INSTRUCTION           FP213580
                    BY967 MDX     *         SKIP INSTRUCTION            FP213590
                    BY969 MDX     *+2       SKIP INSTRUCTION            FP213600
                    BY970 MDX  X  C1050-C1030-1  SKIP INSTRUCTION       FP213610
                    BY972 DC      /3FFF     USED TO MASK FOR LEFT BITS  FP213620
                    BY973 S    L  /7FFF     SUBTRACT INSTRUCTION        FP213630
                    BY974 EQU     *-1       USED TO MASK OUT SIGN BIT   FP213640
                    BY975 MDX  X  CK080-CK060-1  CHECKSUM SKIP INST     FP213650
                    BY976 DC      /70FF     INST FOR LOOP IN LOC 0  2-8 FP213660
                    BY977 DC      *-*       PHASE FINAL WORD COUNT  2-4 FP213670
                    BY978 DC      *-*       NO. OF SCTRS TO SHIFT   2-4 FP213680
                    BY979 DC      *-*       AVAILABLE               2-4 FP213690
                    BY980 DC      *-*       AVAILABLE               2-4 FP213700
                    BY981 DC      *-*       PROG DATA TO WRITE INDR     FP213710
                    BY982 DC      *-*       SLET ENTRY HALF DONE INDR   FP213720
                    BY983 DC      7         HIGHEST SCTR ADDR RECOVERY  FP213730
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   FP213740
                    BZ900 DC      *-*       QUOTIENT FROM MOVE SUBR     FP213750
                    BZ901 DC      *-*       REMAINDER FROM MOVE SUBR    FP213760
                    BZ902 DC      *-*       AVAILABLE               2-4 FP213770
                    BZ903 DC      *-*       NEW LET SECTOR ADDRESS      FP213780
                    BZ904 DC      PAIRE     ADDR OF PAIR 14 (LAST PAIR) FP213790
                    BZ905 DC      PAIR8     ADDR OF PAIR 08             FP213800
                    BZ906 DC      *-*       NEW MINUS OLD LET SCTR ADDR FP213810
                    BZ907 DC      *-*       NO. OF SCTRS IN SHIFT BFR   FP213820
                    BZ908 DC      0         NEW PROGRAM RELOADED INDR   FP213830
                    BZ909 DC      *-*       2501 DOUBLE BUFFERING INDR  FP213840
                    BZ910 DC      @IDAD     CARTRIDGE ID SECTOR ADDRESS FP213850
                    BZ911 DC      *-*       LOAD NO MORE PHASES INDR    FP213860
                    BZ912 DC      *-*       PROGRAM MAY BE ADDED INDR   FP213870
                    BZ913 DC      *-*       PHASE ID OF NEXT PROG - 1   FP213880
                    *                                                   FP213890
                    * LEVEL 4 INTERRUPT BRANCH TABLE                    FP213900
                    *                                                   FP213910
                          DC      $PRET     PRE-OPERATIVE ERROR TRAP    FP213920
                    BZ930 BSS     4         RESERVED                    FP213930
                          DC      *-*       1403 PRINTER                FP213940
                          DC      CD010+1   2501 CARD READER            FP213950
                          DC      CD010+1   1442 CARD READER            FP213960
                          DC      TZ100     CONSOLE PRINTER             FP213970
                          DC      *-*       PAPER TAPE READER/PUNCH     FP213980
                    *                                                   FP213990
                    *                                                   FP214000
                          BSS     BA000+5*@SCNT-*-2  PATCH AREA         FP214010
                    *                                                   FP214020
                    *                                                   FP214030
                    BZ999 EQU     *-1       END OF PHASE 2 MAINLINE     FP214040
                          HDNG    OVERLAY 0 - EXPAND SYS PROG AREA      FP214050
                          ORG     BA000+5*@SCNT-2 ALLOW 5 SECTOR ML     FP214060
                    *                                                   FP214070
                    *                                                   FP214080
                    OVLAY DC      C0999-C0000+2  WORD CNT OF OVERLAY 0  FP214090
                          DC      @P2AD+5        SCTR ADDR OF OVERLAY 0 FP214100
                    *                                                   FP214110
                    *                                                   FP214120
                          DC      0         INDICATES OVERLAY 0         FP214130
                    C0000 MDX     C0020     BR AROUND MODIFIABLE PT     FP214140
                          LDX  L2 BUFR3+2   2ND HALF IS USED ELSEWHERE  FP214150
                    C0020 LD    3 BZ908-X   IF INDR ON, NEW PROG IS     FP214160
                          BSC  L  C0050,+-  *BEING ADDED.  BR IF OFF    FP214170
                          LD   L  C0610+1   FETCH A PAIR ADDRESS        FP214180
                          A     3 BX901-X   POINT TO 2ND OF PAIR        FP214190
                          STO     C0040+1   PLACE ADDR IN INSTRUCTION   FP214200
                          LD    1 11        WHEN LAST PHASE TO LOAD     FP214210
                          S    L  MAXPH     *IS REACHED, AN INDICATOR   FP214220
                          STO   3 BY931-X   *IS CLEARED                 FP214230
                          LD    3 BZ913-X   IF NON-ZERO, USE AS PH ID   FP214240
                          BSC     Z         *IN SEQUENCE TEST           FP214250
                          STO   3 BY912-X   REPLACE PREVIOUS PH ID      FP214260
                          LD    3 BY911-X   CURRENT PHASE               FP214270
                          S     3 BY912-X   PREVIOUS PHASE              FP214280
                          S     3 BX901-X   SEQUENCE TEST               FP214290
                          BSC  L  C0660,Z   BRANCH IF NOT IN SEQUENCE   FP214300
                          STO   3 BZ913-X   CLEAR SPECIAL PH ID         FP214310
                    C0040 LD   L  *-*       THIS PHASE SHOULD NOT       FP214320
                          S     3 BY911-X   *EXCEED PHID PAIR LIMIT     FP214330
                          BSC  L  C0670,+Z  GO TO OUT OF SEQ ERROR      FP214340
                          BSC  L  C0060,Z   BR AROUND SLET SEARCH       FP214350
                    *                                                   FP214360
                    * THIS PHASE IS LAST PHASE OF A PROGRAM PAIR        FP214370
                    *                                                   FP214380
                          LD    3 BX901-X   SET SW TO INDICATE A PROG   FP214390
                          STO   3 BZ912-X   *HAS BEEN ADDED & PREPARE   FP214400
                          BSI  L  C0600     *TO ADD ANOTHER IF REQ      FP214410
                    *                                                   FP214420
                    C0050 LD    1 11        RELOAD THE PH ID            FP214430
                          BSI  L  SSLET     SEARCH SLET FOR PHASE       FP214440
                    *                                                   FP214450
                    * IF PHASE FOUND XR2 POINTS TO THE ADDRESS OF SET   FP214460
                    * IN CORE BUFFER.  THE APPLICABLE SLET SECTOR IS    FP214470
                    * LOADED TO THE IN-CORE BUFFER DURING A SUCCESSFUL  FP214480
                    * SEARCH.                                           FP214490
                    *                                                   FP214500
                          BSI  L  C0600,+   BR TO SEE IF CAN RELOAD     FP214510
                          STX  L2 C0510+1   SAVE XR2 IN 'C0500' SUBR    FP214520
                          LD    2 2         FETCH WD CNT TO RUN CHECK   FP214530
                          A     3 BX913-X   ADD WORDS/SCTR-1        2-4 FP214540
                          SRT     16        PREPARE FOR DIVIDE          FP214550
                          D     3 BX914-X   DETERMINE HOW MANY SCTRS    FP214560
                          STO   3 BY947-X   *SAVE AS LENGTH IN SECTORS  FP214570
                          LD    2 3         LOAD THIS PHASE TO OLD SCTR FP214580
                    *                       STATMENT REMOVED        2-4 FP214590
                          STO   3 BY910-X   FIRST SCTR ADDR OF PHASE    FP214600
                    C0060 BSI  L  UPCAD     BR TO UPDATE OLD SLET ENTRY FP214610
                          SRA     16        CLEAR SW THAT IS SET        FP214620
                          STO   3 BZ912-X   *BETWEEN ADDED PROGRAMS     FP214630
                          BSC  L  BE200     RETURN FROM OVERLAY 0       FP214640
                    *                                                   FP214650
                    *************************************************** FP214660
                    *                                                   FP214670
                    * INSERT A 4 WORD ENTRY TO BE USED TO BUILD A NEW   FP214680
                    * PHASE IN SLET.                                    FP214690
                    *                                                   FP214700
                    C0100 DC      0         ENTRY/EXIT TO SUBROUTINE    FP214710
                          LD    1 11        PHASE ID TO BE INSERTED     FP214720
                          STO     C0912     STORE ID IN INSERTION PATCH FP214730
                          S     3 BX901-X   PHASE ID - 1                FP214740
                          BSI  L  SSLET     CALL SEARCH SLET FOR ID-1   FP214750
                          BSC  L  CO180,+-  BR IF ID-1 WAS NOT FOUND    FP214760
                          SLA     16        ZERO TWO WORDS IN NEW SLET  FP214770
                          STO     C0913     *ENTRY FOR NOW              FP214780
                          STO     C0914                                 FP214790
                          LD    2 2         WORD COUNT OF PH - 1        FP214800
                          A     3 BX913-X   ADD WORDS/SCTR-1        2-4 FP214810
                          SRT     16        SHIFT TO EXTENSION          FP214820
                          D     3 BX914-X   DIVIDE BY WORDS PER SECTOR  FP214830
                          A     2 3         ADD SECTOR ADDR OF ID-1     FP214840
                          STO     C0915     SAVE CALC SCTR ADDR OF PH   FP214850
                    *                                                   FP214860
                    * DETERMINE IF AN EMPTY SLET ENTRY EXISTS TO        FP214870
                    * ABSORD THE NEW SLET ENTRY.                        FP214880
                    *                                                   FP214890
                          MDX   2 4         ADVANCE 1 ENTRY IN SLET TBL FP214900
                          STX   2 C0911     TEST FOR BEYOND END OF SCTR FP214910
                          LD      C0911     CONTENTS OF XR2             FP214920
                          S     3 BY914-X   SUB ADDR LAST SLET ENTRY    FP214930
                          BSC  L  C0120,+   BR IF XR2 STILL IN SECTOR   FP214940
                          LD   L  BUFR3+1   SLET TABLE IS FULL IF THIS  FP214950
                          S     3 BY956-X   *IS LAST SLET SECTOR        FP214960
                          BSI  L  ER028,-   YES, BR IF LAST SLET SECTOR FP214970
                          MDX  L  BUFR3+1,1 INCREMENT SLET SECTOR ADDR  FP214980
                          BSI  L  FTCH3     READ NEXT SLET SECTOR       FP214990
                          LDX  I2 BY913     RESET PT TO FIRST SLET SET  FP215000
                    C0120 LD   I  BY914     TEST FOR EMPTY ENTRY IN     FP215010
                          BSC  L  C0150,+-  *THIS SLET SCTR,BR IF EMPTY FP215020
                          LD   L  BUFR3+1   SAVE SCTR ADDR THAT IS TO   FP215030
                          STO     C0911     *HAVE NEW PHASE ENTRY       FP215040
                          S     3 BY956-X   TEST IF SCTR ADDR ALREADY   FP215050
                          BSC  L  C0130,+-  *IN CORE, BR IF IN CORE     FP215060
                          LD    3 BY956-X   SET LAST SLET SCTR ADDR     FP215070
                          STO  L  BUFR3+1   *IN DISK I/O BUFFER         FP215080
                          BSI  L  FTCH3     READ LAST SCTR INTO CORE    FP215090
                    C0130 LD   I  BY914     TEST FOR EMPTY ENTRY IN     FP215100
                          BSI  L  ER028,Z   *LAST SLET SCTR, BR IF FULL FP215110
                          LD   L  BUFR3+1   IS SCTR TO HAVE PHASE ID    FP215120
                          S       C0911     *INSERTION ALREADY IN CORE  FP215130
                          BSC  L  C0150,+-  BR IF IT IS IN CORE         FP215140
                          LD      C0911     SET ADDR TO SCTR TO HAVE    FP215150
                          STO  L  BUFR3+1   *NEW PHASE ID INSERTED      FP215160
                    C0140 BSI  L  FTCH3     READ THE SECTOR OF SLET     FP215170
                    C0150 LDD   2 0         SAVE 4 WORDS OF SLET TABLE  FP215180
                          STD     C0916     *WHERE NEXT INSERT IS TO GO FP215190
                          LDD   2 2                                     FP215200
                          STD     C0918                                 FP215210
                          LDD     C0912     INSERT 4 WORDS IN SLET      FP215220
                          STD   2 0         *TABLE                      FP215230
                          LDD     C0914                                 FP215240
                          STD   2 2                                     FP215250
                          LDD     C0916     IS NEXT PHASE 0, IE EMPTY   FP215260
                          BSC  L  C0160,Z   NO, BR TO CONTINUE SHIFTING FP215270
                          BSI  L  WRIT3     YES,WRITE SCTR BACK TO DISK FP215280
                          MDX     C0170     BR TO RETURN                FP215290
                    C0160 STD     C0912                                 FP215300
                          LDD     C0918                                 FP215310
                          STD     C0914                                 FP215320
                          MDX   2 4         INCR POINTER ONE 4 WD ENTRY FP215330
                          STX   2 C0911     TEST FOR END OF SECTOR      FP215340
                          LD      C0911     CONTENTS OF XR2             FP215350
                          S     3 BY914-X   SUB ADDR LAST SLET ENTRY    FP215360
                          BSC  L  C0150,+   NO, BR TO LOOP ON ENTRIES   FP215370
                          BSI  L  WRIT3     WRITE SECTOR BACK TO DISK   FP215380
                          MDX  L  BUFR3+1,1 INCREMENT SLET SECTOR ADDR  FP215390
                          LDX  I2 BY913     RESET PT TO FIRST SLET SET  FP215400
                          MDX     C0140     BR TO PROCESS NEXT SECTOR   FP215410
                    C0170 BSC  I  C0100     RETURN                      FP215420
                    *                                                   FP215430
                    CO180 SRT     32        CLEAR ACCUM AND EXTENSION   FP215440
                          LD   L  SS900     FETCH MISSING PHASE ID      FP215450
                          BSI  L  ER026     DISPLAY PH ID NOT IN SLET   FP215460
                          BSC  L  ER610     FETCH OVERLAY 2 TO FINISH   FP215470
                    *                                                   FP215480
                    * CONSTANTS AND WORK AREAS                          FP215490
                    *                                                   FP215500
                    C0911 DC      *-*       TEMPORARY STORAGE           FP215510
                          BSS  E                                        FP215520
                    C0912 DC      *-*       STORAGE FOR 4 WORDS GOING   FP215530
                    C0913 DC      *-*       *TO                         FP215540
                    C0914 DC      *-*       *SLET                       FP215550
                    C0915 DC      *-*       *ENTRY                      FP215560
                    C0916 DC      *-*       STORAGE FOR 4 WORDS COMING  FP215570
                          DC      *-*       *FROM                       FP215580
                    C0918 DC      *-*       *SLET                       FP215590
                          DC      *-*       *ENTRY                      FP215600
                    *                                                   FP215610
                    *************************************************** FP215620
                    *                                                   FP215630
                    * THIS SUBROUTINE MOVES A BLOCK OF 1 TO 90 SECTORS, FP215640
                    * DEPENDING UPON CORE SIZE, FROM 1 PART OF DISK     FP215650
                    * STORAGE TO ANOTHER.                               FP215660
                    *                                                   FP215670
                    C0300 DC      0         ENTRY/RETURN ADDRESS        FP215680
                          NOP               A WAIT MAY BE PATCHEC HERE  FP215690
                          LD   L  SSBFR     RELOCATE BUFFER SIZE TO     FP215700
                          STO   3 BZ907-X   *MAIN CONSTANTS AREA        FP215710
                          LD    3 BY978-X   LOAD SCTRS TO SHIFT CNT 2-4 FP215720
                          SRT     16        SHIFT INTO EXTENSION        FP215730
                          D     3 BZ907-X   DIVIDE BY SCTRS IN BUFFER   FP215740
                          STD   3 BZ900-X   SAVE QUOTIENT AND REMAINDER FP215750
                    *                                               2-4 FP215760
                          LD    3 BY917-X   CALCULATE SHIFT         2-4 FP215770
                          S     3 BY918-X   *DIRECTION (FROM - TO)  2-4 FP215780
                          BSC  L  C0310,-   BR IF LEFT SHIFT        2-4 FP215790
                    *                                               2-4 FP215800
                          LD    3 BY917-X   ADD SECTORS             2-4 FP215810
                          A     3 BY978-X   *TO SHIFT COUNT         2-4 FP215820
                          STO   3 BY917-X   *TO 'FROM'              2-4 FP215830
                          LD    3 BY918-X   *AND TO                 2-4 FP215840
                          A     3 BY978-X   *'TO'                   2-4 FP215850
                          STO   3 BY918-X   *ADDRESSES              2-4 FP215860
                          MDX     C0400     BR TO START RIGHT SHIFT 2-4 FP215870
                    *                                               2-4 FP215880
                    C0310 MDX  L  BZ901,0   TEST REMAINDER FOR 0    2-4 FP215890
                          MDX     C0330     BR IF NOT                   FP215900
                    C0320 MDX  L  BZ900,0   TEST QUOTIENT FOR 0         FP215910
                          MDX     C0380     BR IF NOT                   FP215920
                          MDX     C0355     BR SHIFTING COMPLETED       FP215930
                    *                                                   FP215940
                    * SET UP A WORD COUNT LESS THAN FULL BUFFER SIZE    FP215950
                    *                                                   FP215960
                    C0330 LD    3 BZ901-X   SECTOR COUNT IN REMAINDER   FP215970
                          M     3 BX914-X   WORDS PER SECTOR            FP215980
                          SLT     16                                    FP215990
                          STO  L  BUFR3+0   WORD COUNT                  FP216000
                    *                                                   FP216010
                    C0340 LD    3 BY917-X   SET SCTR ADDR               FP216020
                          STO  L  BUFR3+1   *TO READ FROM               FP216030
                          BSI  L  FTCH3     READ                        FP216040
                          LD    3 BY918-X   SET SCTR ADDR               FP216050
                          STO  L  BUFR3+1   *TO WRITE TO                FP216060
                          BSI  L  WRIT3     WRITE                       FP216070
                          MDX  L  BZ901,0   TEST REMAINDER FOR 0        FP216080
                          MDX     C0410     BR IF NOT                   FP216090
                    *                       STATEMENTS REMOVED      2-4 FP216100
                    C0350 MDX  L  BZ900,0   TEST QUOTIENT FOR 0         FP216110
                          MDX     C0360     BR IF NOT                   FP216120
                    C0355 LD    3 BX914-X   RESET TO 1 SCTR WD COUNT    FP216130
                          STO  L  BUFR3+0                               FP216140
                          BSC  I  C0300     RETURN                      FP216150
                    *                                                   FP216160
                    C0360 LD    3 BY917-X   CALCULATE SHIFT         2-4 FP216170
                          S     3 BY918-X   *DIRECTION              2-4 FP216180
                          BSC  L  C0370,-   BR IF LEFT SHIFT        2-4 FP216190
                          LD    3 BY918-X   DECR SCTR ADDR'S BY SIZE    FP216200
                          S     3 BZ907-X   *OF BUFFER                  FP216210
                          STO   3 BY918-X   WRITE ADDRESS               FP216220
                          LD    3 BY917-X   DECR THE                    FP216230
                          S     3 BZ907-X   *READ ADDR                  FP216240
                          STO   3 BY917-X   *ALSO                       FP216250
                          MDX     C0380     SET NEW WD COUNT FOR I/O    FP216260
                    *                                                   FP216270
                    C0370 LD    3 BY918-X   INCREMENT SCTR              FP216280
                          A     3 BZ907-X   *ADDR TO                    FP216290
                          STO   3 BY918-X   *WRITE TO                   FP216300
                          LD    3 BY917-X   INCREMENT SCTR              FP216310
                          A     3 BZ907-X   *ADDR TO                    FP216320
                          STO   3 BY917-X   *READ FROM                  FP216330
                    *                                                   FP216340
                    C0380 LD    3 BZ907-X   MULTIPLY SCTR COUNT BY      FP216350
                          M     3 BX914-X   *WORDS PER SCTR             FP216360
                          SLT     16        *AND USE                    FP216370
                          STO  L  BUFR3+0   *FOR DISK I/O               FP216380
                          MDX  L  BZ900,-1  DECR QUOTIENT               FP216390
                          NOP               MAY SKIP                    FP216400
                          MDX     C0340     SET UP READ ADDR            FP216410
                    *                                                   FP216420
                    C0400 LD    3 BZ901-X   TEST REMAINDER FOR 0        FP216430
                          BSC  L  C0350,+-  BR IF YES                   FP216440
                          LD    3 BY917-X   DECR THE                    FP216450
                          S     3 BZ901-X   *READ                       FP216460
                          STO   3 BY917-X   *ADDRESS                    FP216470
                          LD    3 BY918-X   DECR THE                    FP216480
                          S     3 BZ901-X   *WRITE                      FP216490
                          STO   3 BY918-X   *ADDRESS                    FP216500
                          MDX     C0330     SET NEW WD COUNT FOR I/O    FP216510
                    *                                                   FP216520
                    C0410 LD    3 BY917-X   CALCULATE SHIFT         2-4 FP216530
                          S     3 BY918-X   *DIRECTION              2-4 FP216540
                          BSC  L  C0420,Z+  BR IF RIGHT SHIFT       2-4 FP216550
                          LD    3 BY918-X   INCR THE                    FP216560
                          A     3 BZ901-X   *WRITE                      FP216570
                          STO   3 BY918-X   *ADDRESS                    FP216580
                          LD    3 BY917-X   INCR THE                    FP216590
                          A     3 BZ901-X   *READ                       FP216600
                          STO   3 BY917-X   *ADDRESS                    FP216610
                          SRA     16        ZERO                        FP216620
                          STO   3 BZ901-X   *THE REMAINDER              FP216630
                          MDX     C0320     BR TO TEST QUOTIENT         FP216640
                    *                                                   FP216650
                    C0420 SRA     16        ZERO                        FP216660
                          STO   3 BZ901-X   *THE REMAINDER              FP216670
                          MDX     C0350     BR TO TEST QUOTIENT         FP216680
                    *                                                   FP216690
                    *************************************************** FP216700
                    *                                                   FP216710
                    * SHIFT SYSTEM PROGRAMS ON SECTOR                   FP216720
                    * OUTWARD TOWARDS THE CORE IMAGE BUFFER.            FP216730
                    *                                                   FP216740
                    C0500 NOP               A WAIT MAY BE PATCHED HERE  FP216750
                          STX  L2 C0580+1   SAVE XR2'S WD COUNT         FP216760
                    C0510 LDX  L2 *-*       RELATIVE LOCATION IN SLET   FP216770
                          LD    2 0         IF THIS IS LAST PHASE       FP216780
                          S     3 BY924-X   *NO SHIFT IS REQUIRED       FP216790
                          BSC  L  C0580,-   BR IF .GE. LAST PHASE   2-4 FP216800
                          LD   L  BUFR3+1   SAVE CURRENT SLET SCTR NO.  FP216810
                          STO     C0950     *FOR RE-READING LATER       FP216820
                    *                                                   FP216830
                    * DETERMINE SECTOR ADDRESS OF LAST SECTOR           FP216840
                    * TO BE MOVED                                       FP216850
                    *                                                   FP216860
                          LD    2 3         CURRENT PHASE SCTR ADDRESS  FP216870
                    *                       STATMENT REMOVED        2-4 FP216880
                          A     3 BY947-X   FORM SCTR ADDR OF SUCCEED-  FP216890
                          STO   3 BY917-X   *ING PHASE, 'FROM' ADDR 2-4 FP216900
                          A     3 BX901-X   'TO' ADDR = 'FROM' ADDR 2-4 FP216910
                          STO   3 BY918-X   * + 1                   2-4 FP216920
                          LD    3 BY935-X   SAVE THE SLET SCTR          FP216930
                          STO  L  BUFR3+1   *NOW IN THE SLET BUFFER     FP216940
                          BSI  L  WRIT3     WRITE TEMPORARILY TO CIB    FP216950
                    *                                                   FP216960
                    * DETERMINE SECTOR ADDRESS OF LAST SECTOR USED FOR  FP216970
                    * SYSTEM PROGRAMS AND VERIFY THAT THERE IS ENOUGH   FP216980
                    * CUSHION TO ABSORB A ONE SECTOR SHIFT.             FP216990
                    *                                                   FP217000
                          NOP                                           FP217010
                          LD    3 BY924-X   KNOWN ID OF LAST PHASE      FP217020
                          BSI  L  SSLET     SEARCH SLET FOR THIS ID     FP217030
                          BSI  L  ER027,+   BR IF SOMEHOW MISSING       FP217040
                          LD    2 2         LOAD WORD COUNT             FP217050
                          SRT     16                                    FP217060
                          D     3 BX914-X   CALC SECTORS INVOLVED       FP217070
                          STO   3 BY923-X   SAVE QUOTIENT               FP217080
                          RTE     16        TEST FOR REMAINDER          FP217090
                          BSC  L  C0520,+   EXACT MULT OF 320 IF ZERO   FP217100
                          MDX  L  BY923,1   SCTRS IN VERY LAST PHASE    FP217110
                    C0520 LD    2 3         SCTR ADDR OF THIS PHASE     FP217120
                    *                       STATMENT REMOVED        2-4 FP217130
                          A     3 BY923-X   FORM ADDR OF LAST SECTOR    FP217140
                          STO   3 BY937-X   *WITH DATA                  FP217150
                          S     3 BY935-X   COMPARE WITH                FP217160
                          A     3 BX901-X   *SCRA                       FP217170
                          S     3 BX908-X   *ADDRESS                    FP217180
                          BSI  L  ER022,-   BRANCH IF NO SPACE LEFT     FP217190
                          LD    3 BY937-X   NUMBER OF SECTORS TO    2-4 FP217200
                          S     3 BY917-X   *SHIFT = ADDR SCTR AFTER2-4 FP217210
                          STO   3 BY978-X   *LAST PHASE - FROM ADDR 2-4 FP217220
                          LD   L  CAREA     DECR BY 1 THS SECTORS       FP217230
                          S     3 BX901-X   *REMAINING IN CUSHION       FP217240
                          BSI  L  ER022,Z+  WHEN USED UP, DISPLAY       FP217250
                          STO  L  CAREA     *SCRA OVERLAY ERROR         FP217260
                          BSI  L  C0300     BR TO SHIFT AREA 1 SECTOR   FP217270
                    *                                                   FP217280
                          LD    3 BY935-X   PREPARE TO FETCH SAVED      FP217290
                          STO  L  BUFR3+1   *SLET SCTR FROM CIB AREA    FP217300
                          BSI  L  FTCH3     READ                        FP217310
                          LD      C0950     RESTORE THE SLET            FP217320
                          STO  L  BUFR3+1   *SCTR ADDR                  FP217330
                          LDX  I2 C0510+1   RESET RELATIVE LOC POINTER  FP217340
                    C0540 LD   L  2         TEST WHETHER THIS SET OF    FP217350
                          S     3 BY914-X   *SLET SCTR IS THE LAST      FP217360
                          BSC  L  C0550,+-  FALL THRU IF NOT LAST       FP217370
                          MDX   2 4         POINT TO NEXT SET           FP217380
                          LD    2 3         LOAD FROM NEXT SET          FP217390
                          BSC     Z         NO MODIFICATION IF ZERO     FP217400
                          A     3 BX901-X   INCR SECTOR ADDRESS         FP217410
                          STO   2 3         STORE BACK                  FP217420
                          LD    2 0         TEST FOR VERY LAST PH ID    FP217430
                          S     3 BY924-X                               FP217440
                          BSC  L  C0560,+-  FALL THRU IF NOT LAST       FP217450
                          MDX     C0540     REPEAT                      FP217460
                    C0550 BSI  L  WRFT3     WRITE UPDATED SLET SECTOR   FP217470
                          LD   L  BUFR3+1   STOP WHEN                   FP217480
                          S     3 BY922-X   *ALL SLET                   FP217490
                          S     3 BY955-X   *UPDATED                    FP217500
                          BSC  L  C0570,-   BR TO END OF THIS SUBR,     FP217510
                          LDX  L2 BUFR3+2-4 *ELSE POINT TO NEXT SCTR    FP217520
                          MDX     C0540     *OF SLET AND REPEAT         FP217530
                    C0560 BSI  L  WRIT3     WRITE UPDATED SLET          FP217540
                    *                                                   FP217550
                    C0570 LD      C0950                                 FP217560
                          STO  L  BUFR3+1   RESTORE IN-CORE SLET SCTR   FP217570
                          BSI  L  FTCH3     *TO CONTINUE LOAD           FP217580
                    C0580 LDX  L2 *-*       RESTORE WD CNT OF DATA RCD  FP217590
                          MDX  L  BY947,1   INCR OLD PHASE LENGTH       FP217600
                          BSC  L  BE380     EXIT BACK TO MAINLINE       FP217610
                    *                                                   FP217620
                    * CONSTANTS AND WORK AREAS                          FP217630
                    *                                                   FP217640
                    C0950 DC      *-*       SAVED SLET SECTOR ADDRESS   FP217650
                    *                                                   FP217660
                    *************************************************** FP217670
                    *                                                   FP217680
                    * WRITE A SLET SECTOR TO DISK AND READ NEXT SECTOR  FP217690
                    *                                                   FP217700
                    WRFT3 DC      0         ENTRY/RETURN ADDRESS        FP217710
                          BSI  L  WRIT3     FILE THIS SLET SECTOR       FP217720
                          MDX  L  BUFR3+1,1 INCR ADDR AND               FP217730
                          BSI  L  FTCH3     *FETCH NEXT SCTR            FP217740
                          BSC  I  WRFT3     RETURN                      FP217750
                    *                                                   FP217760
                    *************************************************** FP217770
                    *                                                   FP217780
                    * THIS SUBROUTINE IS ENTERED DURING RELOAD OF A     FP217790
                    * PHASE WHICH CANNOT BE FOUND IN SLET.              FP217800
                    *                                                   FP217810
                    C0600 DC      0         ENTRY                       FP217820
                    C0610 LDD  L  PAIR1     ESTABLISH CORRECT PH PAIR   FP217830
                          AND   3 BY972-X   REMOVE BITS 0 AND 1         FP217840
                          S     3 BY911-X   COMPARE TO BRACKET PH ID    FP217850
                          BSC  L  C0680,-Z  BRANCH IF PH ID SMALLER     FP217860
                          RTE     16        EXCHANGE ACCUM & EXTENSION  FP217870
                          AND   3 BY972-X   REMOVE BITS 0 AND 1         FP217880
                          S     3 BY911-X   COMPARE PH ID               FP217890
                          BSC  L  C0690,+Z  BRANCH IF PH ID GREATER     FP217900
                    *                                                   FP217910
                    * NEXT SECTION PROCESSES PH ID THAT IS IN BOUNDS    FP217920
                    * OF PHID RECORD PAIR POINTED TO IN 'CO610+1'.      FP217930
                    *                                                   FP217940
                          LDD  I  C0610+1   TEST FOR NEG BYPASS INDI-   FP217950
                          BSC  L  C0615,-Z  *CATION IN PAIR, BR IF OFF  FP217960
                          RTE     16        ELSE USE 2ND PH ID OF PAIR  FP217970
                          AND   3 BY972-X   *TO SET A PH ID TO GO TO.   FP217980
                          A     3 BX901-X   SET AN ID ONE GREATER       FP217990
                          STO   3 BY926-X   *THAN                       FP218000
                          STO   3 BY925-X   *LAST PH ID OF              FP218010
                          SRA     16        *CURRENT PAIR               FP218020
                          BSC  L  BE560     BR TO FLUSH RECORDS         FP218030
                    C0615 LD    3 BZ912-X   IF 'BETWEEN ADDED PROG' SW  FP218040
                          BSC  L  C0655,Z   *IS ON, BR TO SET SOME SWS  FP218050
                          LD   I  C0610+1   RELOAD ADDR FROM POINTER    FP218060
                    *                                                   FP218070
                          S     3 BY911-X   TEST FOR 1ST PH OF PROGRAM  FP218080
                          BSC  L  C0710,Z   BRANCH IF NOT               FP218090
                    C0622 LD      C0610+1   TEST FOR 8TH PAIR AND UP    FP218100
                          S     3 BZ905-X                               FP218110
                          BSC  L  C0700,+Z  BR IF NOT PAIR 8 OR HIGHER  FP218120
                          LD    3 BY911-X   COMPARE NEW PROG WITH LAST  FP218130
                          S     3 BY924-X   *ID IN SLET                 FP218140
                          BSC  L  C0695,+   BR IF NEW PHASE NOT LARGER  FP218150
                    *                                                   FP218160
                          LD    3 BZ912-X   TEST AND BR IF 'BETWEEN     FP218170
                          BSC  L  C0060,Z   *ADDED PROG' SW IS ON       FP218180
                          LD    3 BY966-X   PLACE NOP INST TO ALLOW     FP218190
                          STO  L  C0000     *XR2 TO BE SET              FP218200
                          LD    3 BY911-X                               FP218210
                          STO   3 BZ908-X   SET SW TO ADD PROG AT END   FP218220
                          STO   3 BY912-X                               FP218230
                    *                       STATEMENT REMOVED       2-4 FP218240
                          LD   L  FLETI     TEST FOR AND BR TO ERROR    FP218250
                          BSI  L  ER020,Z   *IF FIXED AREA PRESENT      FP218260
                          LD    3 BY924-X                               FP218270
                          BSI  L  SSLET     LOCATE LAST EXISTING PHASE  FP218280
                          BSI  L  ER027,+-  DEFECTIVE SLET IF MISSING   FP218290
                          MDX   2 4         POINT TO 1ST EMPTY SET      FP218300
                          STX   2 C0650     TEMPORARY STORAGE           FP218310
                          LD      C0650     TEST IF BEYOND LAST ENTRY   FP218320
                          S     3 BY914-X   *IN SLET SECTOR             FP218330
                          BSC  L  C0640,+   BR IF SPACE EXISTS          FP218340
                          LD   L  BUFR3+1   ELSE TEST FOR LAST SLET     FP218350
                          S     3 BY956-X   *SECTOR                     FP218360
                          BSI  L  ER028,-   DISPLAY SLET FULL IF YES    FP218370
                          BSI  L  BD200     FETCH NEXT SLET SECTOR      FP218380
                          STX   2 C0650     SAVE RLTV LOC IN SLET SCTR  FP218390
                    C0640 NOP               A WAIT MAY BE PATCHED HERE  FP218400
                          LD   L  BUFR3+1   SAVE PRESENT SLET SECTOR    FP218410
                          STO     C0950     *ADDRESS                    FP218420
                    *                                                   FP218430
                          LD   L  LET00     'FROM' ADDR IS START    2-4 FP218440
                          STO   3 BY917-X   *OF LET TABLE           2-4 FP218450
                          LD    3 BY958-X   'TO' ADDR IS SUCH THAT  2-4 FP218460
                          S    L  SHIFT     *LET/UA IS SHIFTED UP   2-4 FP218470
                          STO   3 BY918-X   *AGAINST SYSTEM LOADER  2-4 FP218480
                          LD   L  SHIFT     NUMBER OF SECTORS TO    2-4 FP218490
                          STO   3 BY978-X   *SHIFT IS LENGTH LET/UA 2-4 FP218500
                          BSI  L  C0300     SHIFT UA TOWARD END DISK    FP218510
                          LD      C0950     SAVED SLET SCTR ADDR        FP218520
                          STO  L  BUFR3+1   FETCH CURRENT               FP218530
                          BSI  L  FTCH3     *SLET SECTOR                FP218540
                          LDX  I2 C0650     RESTORE RLTV LOC POINTER    FP218550
                          BSC  L  C0060     BR TO PROCESS PHASE         FP218560
                    *                                                   FP218570
                    * CONSTANTS AND WORK AREAS                          FP218580
                    *                                                   FP218590
                    C0650 DC      *-*       TEMPORARY XR2 STORAGE       FP218600
                    *                                                   FP218610
                    C0655 MDX  L  C0610+1,2 ADVANCE POINTER NEXT PAIR   FP218620
                          LD   I  C0610+1   LOAD 1ST PH ID OF NEW PAIR  FP218630
                          S     3 BX901-X   SET UP AN ID ONE LESS TO    FP218640
                          STO   3 BZ913-X   *USE IN SEQUENCE TEST       FP218650
                          MDX     C0622     BR TO MAKE MORE CHECKS      FP218660
                    *                                                   FP218670
                    C0660 BSC  L  C0670,+Z  OUT OF SEQ OR MISSING PHASE FP218680
                          LD    3 BY912-X   RESET FOR RETRY             FP218690
                          STO   3 BY911-X   PREVIOUS PHASE ID           FP218700
                          BSI  L  ER024     PHASE MISSING FROM PROGRAM  FP218710
                          BSI  L  BYPAS     BR TO BYPASS THIS PHASE     FP218720
                    *                                                   FP218730
                    C0670 LD    3 BY912-X   RESET FOR RETRY             FP218740
                          STO   3 BY911-X                               FP218750
                          BSI  L  ER023     PH NO. OUT OF SEQUENCE      FP218760
                    *                                                   FP218770
                    C0680 LDD  I  C0610+1   CHECK PHASE ID PAIR         FP218780
                          BSI  L  ER025,Z   PH ID NOT IN PHID RECORD    FP218790
                    *                                                   FP218800
                    C0690 MDX  L  C0610+1,2 POINT TO NEXT PAIR          FP218810
                          LD      C0610+1                               FP218820
                          S     3 BZ904-X   TEST FOR PAIR NUMBER        FP218830
                          BSI  L  ER025,Z-  ERROR IF BEYOND LAST PAIR   FP218840
                          MDX     C0610     TEST IF PH ID IN THIS PAIR  FP218850
                    *                                                   FP218860
                    C0695 LDD  I  C0610+1   FETCH CURRENT PROG ID PAIR  FP218870
                    C0700 RTE     16        *OTHERWISE SET SW TO PASS   FP218880
                          A     3 BX901-X   *PHASES UNTIL               FP218890
                          STO   3 BY926-X   *NEXT PAIR                  FP218900
                          STO   3 BY925-X   *FROM PHASE ID RCD REACHED  FP218910
                          BSI  L  ER029     DISPLAY 'PROGRAM NOT FOUND' FP218920
                    *                                                   FP218930
                    C0710 LD    3 BZ908-X   THE SW FOR ADDING A PROG    FP218940
                          BSC  L  C0670,Z   *SHOULD BE OFF, ELSE ERROR  FP218950
                          BSI  L  C0100     FORCE A HOLE IN SLET        FP218960
                    *                                                   FP218970
                    * UPON RETURN SYSTEM WILL BE EXPANDED INTO CUSHION  FP218980
                    * TO MAKE ROOM FOR ADDED PHASE                      FP218990
                    *                                                   FP219000
                          LD    1 11        FETCH ID OF PHASE TO ADD    FP219010
                          BSI  L  SSLET     SEARCH FOR DUMMY SLET ENTRY FP219020
                          BSC  I  C0600     RETURN WITH SLET SET IN TOW FP219030
                    *                                                   FP219040
                    *************************************************** FP219050
                    *                                                   FP219060
                    * REMOVE A RELOAD TABLE ENTRY IF PRESENT            FP219070
                    * IN DISK RELOAD TABLE                              FP219080
                    *                                                   FP219090
                    C0720 DC      0         ENTRY/RETURN ADDRESS        FP219100
                          LD   L  BUFR2+1                               FP219110
                          STO     C0970     SAVE SECTOR ADDRESS         FP219120
                          LD    3 BX906-X                               FP219130
                          STO  L  BUFR2+1                               FP219140
                          BSI  L  FTCH2     READ RELOAD TBL INTO BUFR2  FP219150
                          STX   2 C0760+1   SAVE XR2                    FP219160
                          LDX  L2 BUFR2+2   ADDR FIRST DATA WORD        FP219170
                    C0730 LD    2 0         PHASE ID FROM RELOAD TABLE  FP219180
                          S     1 11        NEW PHASE ID                FP219190
                          BSC  L  C0740,+-  FOUND THE TABLE ENTRY       FP219200
                          LD    2 0         STOP SEARCH IF END OF       FP219210
                          EOR   3 BY965-X   *RELOAD TABLE               FP219220
                          BSC  L  C0760,+-  BR TO RETURN                FP219230
                          MDX   2 3         GO TRY NEXT 3 WORD ENTRY    FP219240
                          MDX     C0730     *IN RELOAD TABLE            FP219250
                    C0740 LD    2 3         SHIFT REST OF RELOAD TABLE  FP219260
                          STO   2 0         *3 PLACES LEFT              FP219270
                          EOR   3 BY965-X   IS IT /FFFF                 FP219280
                          BSC  L  C0750,+-  YES, END OF TABLE           FP219290
                          LD    2 4         THIS 3 WORD SHIFT REMOVES   FP219300
                          STO   2 1         *THE FOUND ENTRY FROM THE   FP219310
                          LD    2 5         *TABLE                      FP219320
                          STO   2 2                                     FP219330
                          MDX   2 3                                     FP219340
                          MDX     C0740     LOOP UNTIL END OF TABLE     FP219350
                    C0750 SRA     16        MAKE SURE 3 WORDS AFTER     FP219360
                          STO   2 1         */FFFF ARE ZEROES           FP219370
                          STO   2 2                                     FP219380
                          STO   2 3                                     FP219390
                    *                                                   FP219400
                    * NOTE.. CHECKSUM HAS NOT BEEN ALTERED              FP219410
                    *                                                   FP219420
                          BSI  L  WRIT2     WRITE BACK RELOAD TABLE     FP219430
                    C0760 LDX  L2 *-*       RESTORE XR2                 FP219440
                          LD      C0970     RETRIEVE AND RESTORE        FP219450
                          STO  L  BUFR2+1   *SECTOR ADDRESS             FP219460
                          LD    1 11        RELOAD PHASE ID             FP219470
                          BSC  I  C0720     RETURN                      FP219480
                    *                                                   FP219490
                    * CONSTANTS AND WORK AREAS                          FP219500
                    *                                                   FP219510
                    C0970 DC      *-*       SAVED SECTOR ADDRESS        FP219520
                    *                                                   FP219530
                    *                                                   FP219540
                          BSS     C0000+2*@SCNT-*-1  PATCH AREA         FP219550
                    *                                                   FP219560
                    *                                                   FP219570
                    C0999 EQU     *-1       END OF OVERLAY 0            FP219580
                          HDNG    BUFFER AREAS                          FP219590
                    *                                                   FP219600
                    * RELOAD TABLE BUFFER                               FP219610
                    *                                                   FP219620
                          ORG     @MNCR-3*@SCNT-8                       FP219630
                    BUFR1 DC      1         WORD COUNT                  FP219640
                          DC      @RLTB     SECTOR ADDRESS              FP219650
                    *                                                   FP219660
                    * SECTOR BUFFER                                     FP219670
                    *                                                   FP219680
                          ORG     @MNCR-2*@SCNT-6                       FP219690
                    BUFR2 DC      @SCNT     WORD COUNT                  FP219700
                          DC      /0F0F     SECTOR ADDRESS              FP219710
                    *                                               2-4 FP219720
                    * PERFORM 3 FUNCTIONS AT START OF PHASE 2.      2-4 FP219730
                    * THEN THIS IS OVERLAID BY DISK BUFFER.         2-4 FP219740
                    *                                               2-4 FP219750
                    B0000 DC      0         ENTRY/RETURN ADDRESS        FP219760
                    *                                               2-4 FP219770
                    * CLEAR SIGN BITS FROM SCTR ADDRS IN SLET TABLE 2-4 FP219780
                    *                                               2-4 FP219790
                          LD    3 BY955-X   FETCH AND                   FP219800
                          STO  L  BUFR3+1   *STORE 1ST SLET SCTR ADDR   FP219810
                    C3620 BSI  L  FTCH3     BR TO FETCH A SLET SECTOR   FP219820
                          LDX  I2 BY913     XR2 POINTS TO 1ST SLET WD   FP219830
                    C3640 LD    2 3         FETCH THE SECTOR ADDRESS    FP219840
                          AND   3 BY974-X   MASK OUT SIGN BIT           FP219850
                          STO   2 3         RESTORE SECTOR ADDRESS      FP219860
                          STX   2 C3960     PLACE POINTER               FP219870
                          LD      C3960     *IN ACCUMULATOR             FP219880
                          S     3 BY914-X   TEST FOR AND BR             FP219890
                          BSC  L  C3660,+-  *IF SECTOR COMPLETED        FP219900
                          MDX   2 4         INCREMENT FOR NEXT SET      FP219910
                          MDX     C3640     BRANCH FOR NEXT SET         FP219920
                    C3660 BSI  L  WRIT3     BRANCH TO WRITE SLET SCTR   FP219930
                          LD   L  BUFR3+1   FETCH SLET SCTOR ADDRESS    FP219940
                          S     3 BY956-X   TEST FOR AND BR             FP219950
                          BSC  L  B0010,-   *IF LAST SLET SECTOR    2-4 FP219960
                          MDX  L  BUFR3+1,1 INCREMENT SLET SCTR ADDRESS FP219970
                          MDX     C3620     BR TO FETCH NEXT SLET SCTR  FP219980
                    C3960 DC      *-*       TEMPORARY XR2 STORAGE       FP219990
                    *                                                   FP220000
                    * LOCATE HIGHEST PHASE ID IN SLET AND SAVE FOR      FP220010
                    * RELOAD PROCESSING.  THIS SUBR EXECUTED ONCE ONLY. FP220020
                    * THEN OVERLAID BY DISK BUFFER.                     FP220030
                    *                                                   FP220040
                    B0010 LD    3 BY955-X   FETCH AND STORE SLET        FP220050
                          STO  L  BUFR3+1   *SCTR ADDR IN I/O BUFFER    FP220060
                    B0020 BSI  L  FTCH3     BR TO FETCH A SLET SECTOR   FP220070
                          LDX  L2 -320      WORDS PER SECTOR            FP220080
                    B0040 LD   L2 BUFR3+322 FETCH PHASE ID FROM SLET    FP220090
                          BSC  L  C0800,+-  BR IF END OF SLET       2-4 FP220100
                          LD   L2 BUFR3+322 FETCH AND                   FP220110
                          STO   3 BY924-X   *STORE LARGEST PHASE ID     FP220120
                          LD   L2 BUFR3+324 WD COUNT OF LAST PHASE      FP220130
                          A     3 BX913-X   ADD WORDS/SECTOR - 1    2-4 FP220140
                          SRT     16        SHIFT INTO EXTENSION        FP220150
                          D     3 BX914-X   DIVIDE BY WORDS PER SECTOR  FP220160
                          A    L2 BUFR3+325 ADD BEGINNING SCTR ADDR     FP220170
                          STO   3 BY910-X   FIRST AVIALABLE SECTOR  2-4 FP220180
                          S     3 BX901-X   SUB 1                   2-4 FP220190
                          STO   3 BY937-X   LAST SECTOR USED        2-4 FP220200
                          MDX   2 4                                     FP220210
                          MDX     B0040     LOOP WITHIN SECTOR          FP220220
                          MDX  L  BUFR3+1,1 INCREMENT SLET SCTR ADDRESS FP220230
                          LD   L  BUFR3+1   CHECK IF THREE SLET         FP220240
                          S     3 BY955-X   *SECTORS HAVE BEEN          FP220250
                          S     3 BY922-X   *PROCESSED                  FP220260
                          BSC  L  B0020,+Z  IF NOT FETCH ANOTHER SECTOR FP220270
                    *                                               2-4 FP220280
                    * DURING START OF RELOAD, FIND EXISTING GAPS    2-4 FP220290
                    * BETWEEN SYSTEM PROGRAMS AND SHIFT THEM OUT    2-4 FP220300
                    *                                               2-4 FP220310
                    C0800 LD    3 BY955-X   SET SCTR ADDR TO FIRST  2-4 FP220320
                          STO  L  BUFR3+1   *SLET SECTOR            2-4 FP220330
                          LD    3 BX908-X   INITIALIZE EXPECTED SCTR2-4 FP220340
                          STO   3 BY915-X   *ADDR OF FIRST PHASE= 8 2-4 FP220350
                    C0810 LD   L  BUFR3+1   TEST FOR END OF SLET    2-4 FP220360
                          S     3 BY956-X   *TABLE SECTORS          2-4 FP220370
                          BSC  I  B0000,-Z  RETURN IF END OF SLET   2-4 FP220380
                          BSI  L  FTCH3     FETCH NEST SLET SECTOR  2-4 FP220390
                          LDX  I2 BY913     POINT XR2 TO FIRST ENTRY2-4 FP220400
                    C0820 LD    2 0         RETURN IF END OF SLET   2-4 FP220410
                          BSC  I  B0000,+-  *TABLE ENTRIES          2-4 FP220420
                    * TEST FOR AND SKIP 5 PRINCIPAL I/O SLET ENTRIES2-4 FP220430
                          S       C0841     COMPARE WITH PRINT PH ID2-4 FP220440
                          BSC  L  C0822,Z+  BR IF .LT. PRINT        2-4 FP220450
                          S     3 BX905-X   COMPARE WITH PRINT+5    2-4 FP220460
                          BSC  L  C0825,Z+  BR IF PRINCIPAL I/O     2-4 FP220470
                    C0822 LD    2 3         GET SCTR ADDR OF PHASE  2-4 FP220480
                          STO   3 BY917-X   SAVE AS 'FROM' ADDR     2-4 FP220490
                          S     3 BY915-X   TEST FOR GAP            2-4 FP220500
                          BSC  L  C0830,Z   BR IF GAP FOUND         2-4 FP220510
                          LD    2 2         CALCULATE NUMBER        2-4 FP220520
                          A     3 BX913-X   *OF SECTORS             2-4 FP220530
                          SRT     16        *IN THIS PHASE          2-4 FP220540
                          D     3 BX914-X   *FROM WORD COUNT        2-4 FP220550
                          STO   3 BY947-X   SAVE SCTR CNT THIS PHASE2-4 FP220560
                          LD    2 3         GET SCTR ADDR OF PHASE  2-4 FP220570
                          A     3 BY947-X   ADD LENGTH OF THIS PHASE2-4 FP220580
                          STO   3 BY915-X   *TO GET ADDR NEXT PHASE 2-4 FP220590
                    C0825 MDX   2 4         ADVANCE SLET POINTER    2-4 FP220600
                          STX   2 C0840     IS XR2 POINTER          2-4 FP220610
                          LD      C0840     *BEYOND ADDR LAST SLET  2-4 FP220620
                          S     3 BY914-X   *ENTRY IN SECTOR        2-4 FP220630
                          BSC  L  C0820,+   BR IF MORE IN SECTOR    2-4 FP220640
                          MDX  L0 BUFR3+1,1 INCR SLET SCTR ADDR BY 12-4 FP220650
                          MDX     C0810     BR TO READ NEXT SECTOR  2-4 FP220660
                    *                                               2-4 FP220670
                    C0830 LD    3 BY915-X   SET 'TO' ADDR TO ADDR   2-4 FP220680
                          STO   3 BY918-X   *OF GAP                 2-4 FP220690
                          BSI  L  BD099     GO TO UPDATE/SHIFT SUBR 2-4 FP220700
                          MDX     C0800     LOOP UNTIL NO GAPS LEFT 2-4 FP220710
                    C0840 DC      *-*       TEMP STORAGE FOR XR2    2-4 FP220720
                    C0841 DC      PRINT     PH ID OF PRINCIPAL PRINT2-4 FP220730
                    *                                                   FP220740
                          ORG     B0000+@SCNT  SECTOR BUFFER            FP220750
                    B2END DC      /0F0F     INDICATES END OF BUFFER     FP220760
                          DC      *-*       AVAILABLE                   FP220770
                    *                                                   FP220780
                    * SLET BUFFER                                       FP220790
                    *                                                   FP220800
                          ORG     @MNCR-@SCNT-2                         FP220810
                    BUFR3 DC      @SCNT     WORD COUNT                  FP220820
                          DC      @SLET     SECTOR ADDRESS              FP220830
*SBRK    XX         *SYS LDR - PHASE 2 - OVERLAY 1                      FP220840
                          HDNG    OVERLAY 1 - INITIAL LOAD              FP220850
                          ORG     OVLAY     BEGIN IN OVERLAY AREA       FP220860
                    *                                                   FP220870
                    *                                                   FP220880
                          DC      C1999-C1000+2  WORD CNT OF OVERLAY 1  FP220890
                          DC      @P2AD+5        SCTR ADDR OF OVERLAY 1 FP220900
                    *                                                   FP220910
                    * DECK TO BE LOADED MUST INCLUDE ALL PHASES         FP220920
                    * INDICATED ON PHID RECORD.                         FP220930
                    *                                                   FP220940
                          DC      1         INDICATES OVERLAY 1         FP220950
                    C1000 NOP               A WAIT MAY BE PATCHED HERE  FP220960
                    *                                                   FP220970
                    * THE ADDR IN NEXT INST HAS BEEN MODIFIED SO THAT   FP220980
                    * XR2 WILL POINT TO LOC OF THIS PH IN SLET SECTOR   FP220990
                    *                                                   FP221000
                    C1020 LDX  L2 BUFR3+2   MODIFIABLE ADDRESS          FP221010
                          LD    1 11        OBTAIN PHASE ID             FP221020
                          S     3 BY924-X   IF LAST PH OF LAST PAIR     FP221030
                          BSC     +-        *IS PROCESSED, SWITCH       FP221040
                          STO   3 BY931-X   *WILL BE SET ON, TO ZERO    FP221050
                          LD    1 11        PHASE ID NUMBER             FP221060
                          S     3 BY909-X   COMPARE WITH 1ST PROG PH    FP221070
                    *                                                   FP221080
                    * FOLLOWING 'NOP' MAY BE MODIFIED TO 'MDX    C1050' FP221090
                    *                                                   FP221100
                    C1030 NOP               BR TO NEXT INST OR 'C1050'  FP221110
                          BSC  L  C1050,+-  BR IF STARTING PH PRESENT   FP221120
                          LD    3 BY909-X   IF 1ST PH ID OF PAIR IS     FP221130
                          BSC  L  C1064,-   *NEG, MATCH NOT REQUIRED    FP221140
                    C1050 LD    3 BY970-X   CANCEL FIRST PHASE TRAP     FP221150
                          STO     C1030     SETUP SKIP TO 'C1050'       FP221160
                          BSI     C1200     TO TEST PH ID LIMITS        FP221170
                    *                                                   FP221180
                          LD   L  BUFR3+1   IF CURRENT SLET SECTOR      FP221190
                          S     3 BY956-X   *ADDR .GT. END SLET ADDR    FP221200
                          BSI  L  ER028,-Z  *BR TO ERROR E 28 SLET FULL FP221210
                          BSI  L  UPCAD     SET UP CORE ADDR IN SLET    FP221220
                          BSC  L  BE200     RETURN FROM OVERLAY 1       FP221230
                    *                                                   FP221240
                    C1064 LD    1 11        IF THE CURRENT PH IS LESS   FP221250
                          S     3 BY909-X   *THAN 1ST PH OF NEXT PROG,  FP221260
                          BSI  L  ER025,+Z  *IT MUST BE EXTRANEOUS      FP221270
                          BSI     C1070     *OTHERWISE A PH IS MISSING  FP221280
                    *                                                   FP221290
                    *************************************************** FP221300
                    *                                                   FP221310
                    * IF LAST PH ID PHID RCRD HAS BEEN STORED DISPLAY   FP221320
                    * PH ID NOT IN PHID RECORD AND SET SW TO PASS ALL   FP221330
                    * ADDITIONAL PHASES.                                FP221340
                    *                                                   FP221350
                    C1070 DC      0         ENTRY                       FP221360
                          LD    3 BY931-X   TEST FOR LAST PH STORED     FP221370
                          BSC  L  C1080,Z   BR IF NOT                   FP221380
                          LD    3 BX901-X                               FP221390
                          SLA     14        SET VERY LARGE NUMBER IN    FP221400
                          STO   3 BY926-X   *SWITCHES                   FP221410
                          STO   3 BY925-X   *TO BYPASS                  FP221420
                          STO   3 BZ911-X   *SUCCEEDING PHASES          FP221430
                          BSI  L  ER025     PH ID NOT IN PHID RCD       FP221440
                    *                                                   FP221450
                    C1080 LD    3 BY912-X   RESET PH ID NUMBERS         FP221460
                          STO   3 BY911-X   *TO PREVIOUS VALUE          FP221470
                          BSI  L  ER024     BR TO PRINT MESSAGE E 14    FP221480
                          BSI  L  BYPAS     BR TO BYPASS THIS PHASE     FP221490
                    *                                                   FP221500
                    *************************************************** FP221510
                    *                                                   FP221520
                    * DETERMINE IF PHASE ID IS WITHIN ONE OF THE        FP221530
                    * RANGES SPECIFIED ON PHID RECORD.                  FP221540
                    *                                                   FP221550
                    C1200 DC      0         WHEN INDR IS NEG, THIS PAIR FP221560
                          LD    3 BY905-X   *OF LIMITS IS COMPLETED     FP221570
                          BSC  L  C1220,-                               FP221580
                    C1210 MDX  L  C1220+1,2 MODIFY ADDR TO NEXT PAIR    FP221590
                          LD   I  C1220+1   TEST FOR BLANK PHID PAIR    FP221600
                          BSC  L  C1210,+-  ADVANCE BY 2 IF BLANK       FP221610
                          LD    3 BY967-X   FETCH A SKIP INSTRUCTION    FP221620
                          STO     C1230-1   RESET MDX TO 7000           FP221630
                    C1220 LDD  L  PAIR1     MODIFIABLE LOAD ADDRESS     FP221640
                          STD   3 BY904-X   STORE THE CURRENT ID PAIR   FP221650
                          MDX     C1230     GO TO 'C1230' OR C1290'     FP221660
                    *                                                   FP221670
                    C1230 MDX  L  C1230-1,C1290-C1230 MODIFY BRANCH     FP221680
                          AND   3 BY972-X   MASK BITS 0 AND 1           FP221690
                          S     3 BY911-X   DOES PH ID MATCH 'BY904'    FP221700
                          BSC  L  C1270,+-  BRANCH IF YES               FP221710
                    *                                                   FP221720
                    * A PHASE OF A SYSTEM PROGRAM (ASM AND/OR FOR)      FP221730
                    * MAY BE BYPASSED.                                  FP221740
                    *                                                   FP221750
                    C1240 LD   L  PAIR1+1   LD 2ND ENTRY OF 1ST PAIR    FP221760
                          AND   3 BY972-X   MASK BITS 0 AND 1           FP221770
                          S     3 BY911-X   ESTABLISH WHICH PAIR THIS   FP221780
                          BSC  L  C1260,-   PH IS IN.  BR IF WITHIN     FP221790
                          LD    3 BY904-X   IF THIS PAIR IS TO BE       FP221800
                          BSI  L  C1070,-   *BYPASSED, PREPARE TO       FP221810
                          MDX  L  C1240+1,2 LOOK FOR ID IN NEXT PAIR    FP221820
                          MDX  L  C1260+1,2 POINT TO NEXT PAIR          FP221830
                          MDX  L  C1310+1,2 POINT TO NEXT PAIR          FP221840
                          STO     C1920     SET SEQ CHECK SW NEG.       FP221850
                          MDX     C1210     BR TO ESTABLISH BOUNDS      FP221860
                    *                                                   FP221870
                    C1260 LD   L  PAIR1     TRY THIS PAIR               FP221880
                          AND   3 BY972-X   MASK OUT BITS 0 AND 1       FP221890
                          S     3 BY911-X   COMPARE CURRENT PHASE ID    FP221900
                          BSI  L  ER025,-Z  BR IF ID NOT IN PHID RECORD FP221910
                          LD   I  C1260+1   TEST IF 'BY904' IS NEG      FP221920
                          BSI  L  C1070,-   MISSING PHASE IF NOT        FP221930
                          BSI  L  BYPAS     BR TO BYPASS THIS PHASE     FP221940
                    *                                                   FP221950
                    C1270 LD    3 BY904-X   COMPARE THE HIGH AND LOW ID FP221960
                          S     3 BY905-X   IF ONLY 1 PH IN PH ID PAIR  FP221970
                          BSC  L  C1360,Z   *DO NOT BRANCH              FP221980
                          LD      *-1       SET SEQ CHECK SW ON         FP221990
                          STO     C1920                                 FP222000
                    C1290 LD    3 BY905-X   COMPARE CURRENT PH WITH     FP222010
                          S     3 BY911-X   *HIGH ID OF PAIR            FP222020
                          BSC  L  C1320,Z   BR IF DIFFERENT             FP222030
                    C1300 LD      *-1       SET 'BY905' NEGATIVE        FP222040
                          STO   3 BY905-X   *TO INDICATE PAIR COMPLETED FP222050
                          STO     C1920     SET SEQ CHECK SW ON         FP222060
                          LD    3 BY966-X   REINSTATE 1ST PH TEST       FP222070
                          STO  L  C1030     *FOR NEXT PAIR              FP222080
                    C1310 LD   L  PAIR2     RESET TO BEGINNING PH ID    FP222090
                          STO   3 BY909-X   *OF NEXT PAIR               FP222100
                          MDX  L  C1310+1,2 ADVANCE THE POINTER         FP222110
                          MDX     C1360     TEST FOR BYPASS             FP222120
                    *                                                   FP222130
                    C1320 BSI  L  C1380,Z+  BR IF EXTRANEOUS PHASE      FP222140
                          LD      C1920     NO SEQUENCE CHECK IF        FP222150
                          BSC  L  C1350,+Z  *INDICATOR IS NEGATIVE      FP222160
                          LD    3 BY911-X   TEST FOR SEQUENCE WITH      FP222170
                          S     3 BY912-X   *PREVIOUS PHASE ID UNLESS   FP222180
                          S     3 BX901-X   *THIS PHASE FOLLOWS A       FP222190
                          BSC  L  C1350,+-  *BYPASSED PROGRAM           FP222200
                          BSI  L  C1380,+Z  DISPLAY PH OUT OF SEQ       FP222210
                          BSI  L  C1070     DISPLAY PHASE MISSING       FP222220
                    C1350 SRA     16        RE-INSTATE SEQ CHECK        FP222230
                          STO     C1920     *FOR CONSECUTIVE PHASES     FP222240
                          LD    3 BY911-X   COMPARE CURRENT PH ID WITH  FP222250
                          S     3 BY905-X   *THE NON-NEG UPPER ID.  IF  FP222260
                          BSC  L  C1300,+-  *NOT =, CONTINUE UNTIL =.   FP222270
                    C1360 LD    3 BY904-X                               FP222280
                          BSI  L  BYPAS,+Z  BR TO BYPASS THIS PHASE     FP222290
                          BSC  I  C1200     RETURN                      FP222300
                    *                                                   FP222310
                    C1380 DC      0         ENTRY                       FP222320
                          LD    3 BY912-X   RESET PHASE ID              FP222330
                          STO   3 BY911-X   *TO PREVIOUS PHASE ID       FP222340
                          BSI  L  ER023     BRANCH TO PRINT MSG E 23    FP222350
                    *                                                   FP222360
                    * CONSTANTS AND WORK AREAS                          FP222370
                    *                                                   FP222380
                    C1920 DC      *-*       SEQ CHECK INDICATOR         FP222390
                    *                                                   FP222400
                    *************************************************** FP222410
                    *                                                   FP222420
                    * ENTERED ON INITIAL LOADS FROM SCTR BK PROCESSING  FP222430
                    *                                                   FP222440
                    * ON INITIAL LOAD SETS THE 5 PHASE IDS FOR THE      FP222450
                    * PRINCIPAL I/O SUBROUTINES AFTER THE DISKN ID.     FP222460
                    *                                                   FP222470
                    C1400 DC      0         ENTRY/RETURN ADDR TO SUBR   FP222480
                          LD   L  PAIR6+1   TEST IF DISKN WAS LAST      FP222490
                          S     3 BY911-X   *PHASE ID TO BE STORED      FP222500
                          BSC  L  C1460,Z   IF NOT DISKN, RETURN        FP222510
                          LD    3 BX905-X   SET COUNTER TO 5 I/O PHA    FP222520
                          STO     C1942     *TO HAVE PRINC IO PH ID SET FP222530
                    C1440 STX   2 C1941     TEST IF SLET SECTOR FULL    FP222540
                          LD      C1941                                 FP222550
                          S     3 BY914-X   LAST VALID SLET SET ADDRESS FP222560
                          BSC  L  C1450,+   BR IF SECTOR NOT FULL       FP222570
                    *                       WRITE SLET SECTOR TO DISK   FP222580
                          BSI  L  BD200     *AND BR TO READ NEXT SECTOR FP222590
                    C1450 LD      C1943     STORE PRINCIPLE I/O PHASE   FP222600
                          STO   2 0         *ID IN SLET SET             FP222610
                          MDX   2 4         INCR POINTER ONE SLET SET   FP222620
                          MDX  L  C1943,1   INCR I/O PHASE ID           FP222630
                          MDX  L  C1942,-1  DECR AND TEST LOOP COUNTER  FP222640
                          MDX     C1440     LOOP FOR 5 I/O PHASE IDS    FP222650
                          STX  L2 C1020+1   SAVE ADDR OF NEXT SLET SET  FP222660
                          LD   L  C1020+1                               FP222670
                          S     3 BY914-X   LAST VALID SLET SET ADDRESS FP222680
                          BSC  L  C1460,+   BR IF SECTOR NOT FULL       FP222690
                          STX  L0 BY920     SET SLET SCTR FULL INDC ON  FP222700
                    C1460 BSC  I  C1400     RETURN                      FP222710
                    *                                                   FP222720
                    * WORK AREAS                                        FP222730
                    *                                                   FP222740
                    C1941 DC      *-*       WORD TO HOLD XR2 FOR CALC   FP222750
                    C1942 DC      *-*       LOOP COUNTER                FP222760
                    C1943 DC      153       PRINCIPLE I/O PH IDS        FP222770
                    *                                                   FP222780
                    *                                                   FP222790
                          BSS     C1000+2*@SCNT-*-1  PATCH AREA         FP222800
                    *                                                   FP222810
                    *                                                   FP222820
                    C1999 EQU     *-1       END OF OVERLAY 1            FP222830
*SBRK    XX         *SYS LDR - PHASE 2 - OVERLAY 2                      FP222840
                          HDNG    OVERLAY 2 - INITLZ RES MON/IMAGE,DCOM FP222850
                    *                                                   FP222860
                    * DCOM RELATIVE EQUATES                             FP222870
                    *                                                   FP222880
                    #SYSC EQU     8         SYS/NON-SYS CART INDR       FP222890
                    #RP67 EQU     17        1442 MODEL 6 OR 7 INDICATOR FP222900
                    #PIOD EQU     25        PRINCIPLE I/O DEVICE INDR   FP222910
                    #PPTR EQU     26        PRINCIPLE PRINT DEVICE INDR FP222920
                    #CIAD EQU     27        RLTV LOC OF CIL SCTR ADDR   FP222930
                    #ANDU EQU     35        ADJUSTED END OF USER AREA   FP222940
                    #BNDU EQU     40        BASE END OF USER AREA       FP222950
                    #FPAD EQU     45        FILE PROTECT ADDRESS        FP222960
                    *                                                   FP222970
                    #CIDN EQU     55        CARTRIDGE ID                FP222980
                    #CIBA EQU     60        SECTOR ADDRESS OF CIB       FP222990
                    #SCRA EQU     65        SECTOR ADDRESS OF SCRA      FP223000
                    #ULET EQU     80        SECTOR ADDRESS OF LET       FP223010
                    #CSHN EQU     90        CUSHION SECTOR COUNT        FP223020
                    *                                                   FP223030
                    * OTHER EQUATES                                     FP223040
                    *                                                   FP223050
                    Y     EQU     80        MIDDLE OF RESIDENT IM/MON   FP223060
                    @DKIP EQU     DZ000+5   DISKZ INTERRUPT ENTRY POINT FP223070
                    *                                                   FP223080
                    *                                                   FP223090
                          ORG     OVLAY     BEGIN IN OVERLAY AREA       FP223100
                    *                                                   FP223110
                    *                                                   FP223120
                          DC      C2999-C2000+2  WORD CNT OF OVERLAY 2  FP223130
                          DC      @P2AD+5+2+3    SCTR ADDR OF OVERLAY 2 FP223140
                    *                                                   FP223150
                    *                                                   FP223160
                          DC      2         INDICATES OVERLAY 2         FP223170
                    C2000 NOP               A WAIT MAY BE PATCHED HERE  FP223180
                    *                                                   FP223190
                    * FILL IN RESERVED SLET AREA WITH PRINCIPAL PRINT,  FP223200
                    * I/O AND CONVERSION ENTRIES.                       FP223210
                    *                                                   FP223220
                    C2010 LD   I  C2900     FETCH ADDR OF PHASE ID ENT  FP223230
                          STO     C2020+1   *INDIRECTLY, SET BY REQ CRD FP223240
                          BSC  L  C2040,+-  WHEN COMPLETE BR TO CONT    FP223250
                    C2020 LD   L  *-*       FETCH I/O SUBR PHASE ID     FP223260
                          BSI  L  SSLET     BRANCH TO SEARCH SLET       FP223270
                          BSI  L  ER032,+-  BR IF NOT IN SLET TABLE     FP223280
                          LD    2 1         SAVE LAST                   FP223290
                          STO     C2903     *3 WORDS                    FP223300
                          LDD   2 2         *OF SLET                    FP223310
                          STD     C2904     *ENTRY                      FP223320
                          MDX  L  C2900,1   INCR POINTER TO PH ID TABLE FP223330
                    C2030 LD   I  C2900     PH ID OF PRINCIPAL IO ENTRY FP223340
                          MDX  L  C2900,1   INCR POINTER TO PH ID TABLE FP223350
                          BSC  L  C2010,+-  IF 0 NO MORE STORES THIS ID FP223360
                          BSI  L  SSLET     FIND ID TO RECEIVE ENTRY    FP223370
                          BSI  L  ER032,+-  BR IF NO PLACE RESERVED     FP223380
                          LD      C2903     INSERT PREVIOUSLY           FP223390
                          STO   2 1         *SAVED 3 WORDS IN           FP223400
                          LDD     C2904     *PRINCIPLE I/O              FP223410
                          STD   2 2         *SLET ENTRY                 FP223420
                          BSI  L  WRIT3     BRANCH TO WRITE SLET SECTOR FP223430
                          MDX     C2030     BRANCH TO STORE ENTRY TWICE FP223440
                    *                                                   FP223450
                    * CONSTANTS AND WORK AREAS                          FP223460
                    *                                                   FP223470
                    C2900 DC      C2901     POINTER TO PH ID TABLE      FP223480
                    C2901 DC      PTRID     PH ID OF PRINC PRINT SUBR   FP223490
                          DC      PRINT     POINT TO ID OF PRINC PRINT  FP223500
                          DC      0         TO INDICATE END OF STORES   FP223510
                          DC      RDRID     POINT TO ID OF PRINC I/O    FP223520
                          DC      PINPT     PH ID OF PRINC INPUT SUBR   FP223530
                          DC      PIDEV     PRINC INPUT EXCLUDING KEYBD FP223540
                          DC      0         TO INDICATE END OF STORES   FP223550
                          DC      CNVID     POINT TO ID OF PRINC CONV   FP223560
                          DC      CNVRT     PRINC SYS CONVERSION SUBR   FP223570
                          DC      CVRT      PRINC CONV EXCLUDING KEYBRD FP223580
                          DC      0         TO INDICATE END OF STORES   FP223590
                          DC      0         TO INDICATE END OF TABLE    FP223600
                    C2903 DC      *-*       AREA TO SAVE LAST 3 WORDS   FP223610
                          BSS  E            FORCE NEXT LOC TO BE EVEN   FP223620
                    C2904 DC      *-*       *OF A SLET                  FP223630
                          DC      *-*       *ENTRY                      FP223640
                    *                                                   FP223650
                    * CANCEL RECORDS NO LONGER PERMITTED                FP223660
                    *                                                   FP223670
                    C2040 STX  L0 W2902     CANCEL HIGH SCTR ADDR CHECK FP223680
                          LDX  L1 BC020+1   XR1 PTS TO RCRD TYPE BRANCH FP223690
                          LD   L  C2906     FETCH ADDR OF ERR SUBR E 21 FP223700
                          STO   1 0         SECTOR                      FP223710
                          STO   1 2*3       *BREAK,                     FP223720
                          STO   1 3*3       *'F' AND                    FP223730
                          STO   1 4*3       *'81' RECORDS NOT PERMITTED FP223740
                    *                                                   FP223750
                    * FETCH CORE IMAGE LOADER SLET FOR DISKZ.           FP223760
                    *                                                   FP223770
                          LD   L  PAIR6+2   FETCH PHASE ID OF CIL       FP223780
                          BSI  L  SSLET     BRANCH TO SEARCH SLET       FP223790
                          BSI  L  ER027,+-  BRANCH IF CIL MISSING       FP223800
                          LDD   2 2         SAVE WORD COUNT             FP223810
                          STD  L  CILWC     *AND SECTOR ADDRESS OF CIL  FP223820
                    *                                                   FP223830
                    * UPDATE SINGLE ENTRIES IN DCOM                     FP223840
                    * (DCOM IS READ INTO 'BUFR3')                       FP223850
                    *                                                   FP223860
                          BSI  L  C2400     BRANCH TO READ DCOM         FP223870
                          LDX  L2 BUFR3+2   XR2 PTS TO 1ST WORD OF DCOM FP223880
                          LD   L  T1442     STORE                       FP223890
                          STO   2 #RP67     *1442-6 OR 7 INDICATOR      FP223900
                          LDD  L  PRNRD     STORE                       FP223910
                          STO   2 #PIOD     *PRINCIPLE I/O              FP223920
                          RTE     16        *AND PRINCIPAL PRINT        FP223930
                          STO   2 #PPTR     *INDICATORS                 FP223940
                          LD   L  VERSN     SAVE VERSION                FP223950
                          STO   2 #SYSC     *AND MODIFICATION NUMBER    FP223960
                          STO  L  $SYSC      *IN RESIDENT MONITOR   2-4 FP223970
                          LD    3 BY951-X   STORE RLTV LOC OF CIL SCTR  FP223980
                          STO   2 #CIAD     *ADDR IN @IDAD FOR DUP-DEF  FP223990
                    *                                                   FP224000
                    * INITIALIZE RESIDENT IMAGE AND RESIDENT MONITOR.   FP224010
                    * (RESIDENT IMAGE IS READ INTO 'BUFR2')             FP224020
                    *                                                   FP224030
                          LD    3 BY954-X   STORE SCTR ADDR OF RESIDENT FP224040
                          STO  L  BUFR2+1   *IMAGE IN BUFFER I/O AREA   FP224050
                          BSI  L  FTCH2     BRANCH TO READ RES IMAGE    FP224060
                          LDX  L2 BUFR2+2-6 XR2 PTS TO PSEUDO WORD 0    FP224070
                    *                                                   FP224080
                          LD    3 BY976-X   FETCH 70FF                  FP224090
                          STO  L  /0000     *INSTR AND STORE TO LOC 0   FP224100
                          LD   L  CHN12     SAVE CHANNEL 12 INDICATOR   FP224110
                          STO   2 $CH12     *IN RESIDENT IMAGE          FP224120
                          STO  L  $CH12     *AND RESIDENT MONITOR       FP224130
                          LD   L  SCORE     SAVE CORE SIZE              FP224140
                          STO   2 $CORE     *IN RESIDENT IMAGE          FP224150
                          STO  L  $CORE     *AND RESIDENT MONITOR       FP224160
                          LD   L  C2908     SAVE END OF DISKZ ADDRESS   FP224170
                          STO   2 $CILA     *IN RESIDENT IMAGE          FP224180
                          STO  L  $CILA     *AND RESIDENT MONITOR       FP224190
                    *                                                   FP224200
                          STX   2 C2060     SAVE XR2                    FP224210
                          BSI  L  C2100     BRANCH TO INITIALIZE DCOM   FP224220
                          LDX  L2 *-*       RESTORE                     FP224230
                    C2060 EQU     *-1       *XR2                        FP224240
                    *                                                   FP224250
                          LD    3 BY965-X   SAVE DISK SUBR INDICATOR    FP224260
                          STO   2 $DREQ     *IN RESIDENT IMAGE          FP224270
                          STO  L  $DREQ     *AND RESIDENT MONITOR,      FP224280
                          STO   2 $DZIN     *IN RESIDENT IMAGE          FP224290
                          STO  L  $DZIN     *AND RESIDENT MONITOR       FP224300
                          LD    3 BZ903-X   SAVE LET SECTOR ADDRESS     FP224310
                          STO   2 $ULET     *IN RESIDENT IMAGE          FP224320
                          STO  L  $ULET     *AND RESIDENT MONITOR       FP224330
                          MDX   2 Y         XR2 PTS TO 2ND HALF OF RES  FP224340
                          LD   L  DCYL1     SAVE                        FP224350
                          STO   2 $DCYL+0-Y *DEFECTIVE                  FP224360
                          LD   L  DCYL2     *CYLINDERS                  FP224370
                          STO   2 $DCYL+1-Y *ADDRESSES                  FP224380
                          LD   L  DCYL3     *IN                         FP224390
                          STO   2 $DCYL+2-Y *RESIDENT IMAGE             FP224400
                          LD   L  FPADR     SAVE FILE PROTECT ADDRESS   FP224410
                          STO   2 $FPAD-Y   *IN RESIDENT IMAGE          FP224420
                          STO  L  $FPAD     *AND RESIDENT MONITOR       FP224430
                          LD      C2909     SAVE DISKZ INTRPT ENTRY PT  FP224440
                          STO   2 $IBT2-Y   *IN RESIDENT IMAGE          FP224450
                          LD      C2907     SAVE DUMP ENTRY POINT       FP224460
                          STO   2 $IREQ-Y   *IN RESIDENT IMAGE          FP224470
                          LD   L  CIBFR     FETCH SECTOR ADDRESS OF CIB FP224480
                          SRT     16        SHIFT TO EXTENSION          FP224490
                          LD    3 BY963-X   FETCH WORD COUNT OF CIB     FP224500
                          STD  L  $CIBA-1   *AND STORE TO LOWER CORE    FP224510
                    *                                                   FP224520
                          BSI  L  WRIT2     BRANCH TO WRITE RES IMAGE   FP224530
                    *                                                   FP224540
                          LD    3 BY961-X   FETCH SECTOR ADDRESS OF,    FP224550
                          LDX  L2 C3000     *ENTRY POINT TO             FP224560
                          BSI  L  BH000     *AND BR TO FETCH OVERLAY 3  FP224570
                    *                                                   FP224580
                    * CONSTANTS AND WORK AREAS                          FP224590
                    *                                                   FP224600
                    C2906 DC      ER021     ADDRESS OF ERROR SUBR E 21  FP224610
                    C2907 DC      $DUMP     DUMP ENTRY POINT            FP224620
                    C2908 DC      $ZEND-4   END OF DISKZ - 4            FP224630
                    C2909 DC      @DKIP     DISKZ INTERRUPT ENTRY POINT FP224640
                    *                                                   FP224650
                    *************************************************** FP224660
                    *                                                   FP224670
                    * INITIALIZE OR UPDATE THE CARTRIDGE                FP224680
                    * DEPENDENT TABLES IN DCOM.                         FP224690
                    *                                                   FP224700
                    C2100 DC      0         ENTRY/RETURN ADDRESS        FP224710
                          LDX  L2 BUFR3+2   XR2 PTS TO 1ST WORD OF DCOM FP224720
                    *                                                   FP224730
                          LDX   1 -5        SET CARTRIDGE ID COUNT      FP224740
                    C2120 LD   L  CARID     FETCH CARTRIDGE ID          FP224750
                          EOR   2 #CIDN     TEST FOR AND BRANCH IF      FP224760
                          BSC  L  C2140,+-  *MATCH FOUND IN DCOM        FP224770
                          MDX   2 1         POINT TO NEXT DCOM WORD     FP224780
                          MDX   1 1         INCR ID COUNT, SKIP IF ZERO FP224790
                          MDX     C2120     BRANCH TO TEST NEXT CART ID FP224800
                          BSI  L  ER005     NO MATCH, BR TO PRINT MSG   FP224810
                    *             ER005                                 FP224820
                    C2140 LD    3 BY934-X   TEST FOR AND BRANCH         FP224830
                          BSC  L  C2180,Z+  *IF AN INITIAL LOAD         FP224840
                          MDX  L  BZ908,0   TEST FOR AND BRANCH         FP224850
                          MDX     C2160     *IF SYSTEM PROGRAMS ADDED   FP224860
                          LD    2 #ULET     FETCH AND SAVE              FP224870
                          STO   3 BZ903-X   *ADDRESS OF USER AREA       FP224880
                          LD   L  CAREA     STORE NEW CUSHION SIZE      FP224890
                          STO   2 #CSHN     *TO DCOM                    FP224900
                          BSI  L  WRIT3     BRANCH TO WRITE DCOM        FP224910
                          MDX     C2190     BRANCH TO RETURN            FP224920
                    *                                                   FP224930
                    * UPDATE DCOM ON SYS PROGRAMS ADDED RELOAD          FP224940
                    *                                                   FP224950
                    C2160 LD    3 BY937-X   FETCH LAST SAD OF SYS PROGS FP224960
                          A     3 BX908-X   POINT                       FP224970
                          SRA     3         *TO NEXT                    FP224980
                          SLA     3         *CYLINDER                   FP224990
                          STO     C2912     SAVE TEMPORARLY             FP225000
                          S     3 BY937-X   CALCULATE                   FP225010
                          A     3 BX908-X   *NUMBER OF SECTORS          FP225020
                          S     3 BX901-X   *IN CUSHION AREA            FP225030
                          STO   2 #CSHN     *AND STORE TO DCOM          FP225040
                          LD      C2912     CALCULATE DIFFERENCE        FP225050
                          A     3 BX908-X   *BETWEEN OLD SCRA SCTR ADDR FP225060
                          S     2 #SCRA     *AND NEW SCRA SCTR ADDRESS  FP225070
                          STO     C2912     *AND SAVE                   FP225080
                          LD    2 #SCRA     UPDATE                      FP225090
                          A       C2912     *ADDRESS OF                 FP225100
                          STO   2 #SCRA     *SCRA IN DCOM               FP225110
                          STO  L  ASCRA     *AND COMM AREA              FP225120
                          LD    2 #CIBA     UPDATE                      FP225130
                          A       C2912     *ADDRESS OF                 FP225140
                          STO   2 #CIBA     *CIB IN DCOM                FP225150
                          STO  L  CIBFR     *AND COMM AREA              FP225160
                          LD    2 #ULET     UPDATE                      FP225170
                          A       C2912     *ADDRESS OF                 FP225180
                          STO   2 #ULET     *USER AREA IN DCOM          FP225190
                          NOP               A WAIT MAY BE PATCHED HERE  FP225200
                          STO   3 BZ903-X   *AND COMM AREA              FP225210
                          LD    2 #FPAD     UPDATE                      FP225220
                          A       C2912     *FILE PROTECT               FP225230
                          STO   2 #FPAD     *ADDRESS IN DCOM            FP225240
                          STO  L  FPADR     *AND COMM AREA              FP225250
                          LD    2 #ANDU     UPDATE                      FP225260
                          RTE     4         *ADJUSTED                   FP225270
                          A       C2912     *END OF                     FP225280
                          SLT     4         *USER AREA                  FP225290
                          STO   2 #ANDU     *IN DCOM                    FP225300
                          LD    2 #BNDU     UPDATE                      FP225310
                          RTE     4         *BASE                       FP225320
                          A       C2912     *END OF                     FP225330
                          SLT     4         *USER AREA                  FP225340
                          STO   2 #BNDU     *IN DCOM                    FP225350
                          BSI  L  WRIT3     BRANCH TO WRITE DCOM        FP225360
                          BSI  L  C2200     BR TO UPDATE LET CHAIN ADDR FP225370
                          MDX     C2190     BRANCH TO RETURN            FP225380
                    *                                                   FP225390
                    * INITIALIZE DCOM ON AN INITIAL LOAD                FP225400
                    *                                                   FP225410
                    C2180 LD    3 BY937-X   FETCH LAST SAD OF SYS PROGS FP225420
                          A     3 BX908-X   POINT                       FP225430
                          SRA     3         *TO NEXT                    FP225440
                          SLA     3         *CYLINDER                   FP225450
                          STO     C2912     SAVE TEMPORARLY             FP225460
                          S     3 BY937-X   CALCULATE                   FP225470
                          A     3 BX908-X   *NUMBER OF                  FP225480
                          S     3 BX901-X   *SECTORS IN CUSHION AREA    FP225490
                          STO   2 #CSHN     *AND SAVE IN DCOM           FP225500
                          LD      C2912     CALCULATE                   FP225510
                          A     3 BX908-X   *ADDRESS OF SCRA            FP225520
                          STO   2 #SCRA     *AND SAVE IN DCOM           FP225530
                          STO  L  ASCRA     *AND COMM AREA              FP225540
                          A     3 BX908-X   CALCULATE                   FP225550
                          STO   2 #CIBA     *ADDRESS OF CIB AND STORE   FP225560
                          STO  L  CIBFR     *ST IN DCOM AND COMM AREA   FP225570
                          A     3 BX909-X   CALCULATE                   FP225580
                          STO   2 #ULET     *ADDRESS OF USER AREA AND   FP225590
                          STO   3 BZ903-X   *ST IN DCOM AND COMM AREA   FP225600
                          A     3 BX908-X   CALCULATE                   FP225610
                          STO   2 #FPAD     *FILE PROTECT ADDRESS AND   FP225620
                          STO  L  FPADR     *ST IN DCOM AND COMM AREA   FP225630
                          SLA     4         CALCULATE AND STORE IN DCOM FP225640
                          STO   2 #ANDU     *ADJUSTED END UF USER AREA  FP225650
                          STO   2 #BNDU     *AND BASE END OF USER AREA  FP225660
                          BSI  L  WRIT3     BRANCH TO WRITE DCOM        FP225670
                    *                                                   FP225680
                    * INITIALIZE LET SECTOR ON AN INITIAL LOAD.         FP225690
                    * (LET IS BUILT IN 'BUFR3')                         FP225700
                    *                                                   FP225710
                          BSI     C2300     BRANCH TO CLEAR BUFFER      FP225720
                          LDX  L2 BUFR3+2   XR2 PTS TO 1ST WORD OF LET  FP225730
                          LD    3 BZ903-X   FETCH NEW 1ST LET SCTR ADDR FP225740
                          STO   2 -1        *AND STORE TO LET I/O BFR   FP225750
                          LD      C2910     FETCH AND STORE NUMBER OF   FP225760
                          STO   2 3         *WORDS AVAILABLE IN SECTOR  FP225770
                          LD      C2911     FETCH                       FP225780
                          STO   2 5         *AND STORE                  FP225790
                          LD      C2911+1   *DUMMY                      FP225800
                          STO   2 6         *ENTRY NAME                 FP225810
                          LD    3 BY962-X   CALCULATE                   FP225820
                          S    L  FPADR     *AND STORE                  FP225830
                          A     3 BX901-X   *SIZE OF                    FP225840
                          SLA     4         *WORKING STORAGE            FP225850
                          STO   2 7         *IN DISK BYTES              FP225860
                          LD   L  FPADR     FETCH AND STORE             FP225870
                          STO   2 1         *SECTOR ADDRESS OF UA       FP225880
                          BSI  L  WRIT3     BRANCH TO WRITE LET SECTOR  FP225890
                    *                                                   FP225900
                    C2190 BSC  I  C2100     RETURN                      FP225910
                    *                                                   FP225920
                    * CONSTANTS AND WORK AREAS                          FP225930
                    *                                                   FP225940
                    C2910 DC      @SCNT-8   NO. OF WORDS AVAILABLE      FP225950
                    C2911 DC      /7112     '1DUMY' IN                  FP225960
                          DC      /4528     *TRUNCATED EBCDIC NAME CODE FP225970
                    C2912 DC      *-*       TEMPORARY STORAGE           FP225980
                    *                                                   FP225990
                    *************************************************** FP226000
                    *                                                   FP226010
                    * IF LET AND UA HAVE BEEN RELOCATED THE UA ADDRESS  FP226020
                    * (WD 2 IN EACH LET SCTR) AND THE CHAIN ADDR (WD 5  FP226030
                    * IN EACH LET SCTR) MUST BE ADJUSTED.               FP226040
                    *                                                   FP226050
                    C2200 DC      0         ENTRY/RETURN ADDRESS        FP226060
                          LD    3 BZ908-X   TEST FOR AND RETURN         FP226070
                          BSC  I  C2200,+-  *IF NO NEW PROGRAMS ADDED   FP226080
                          LD    3 BZ903-X   FETCH NEW LET SCTR ADDRESS  FP226090
                          S    L  LET00     TEST FOR AND RETURN IF      FP226100
                          BSC  I  C2200,+-  *SAME AS OLD LET SCTR ADDR  FP226110
                          STO   3 BZ906-X   SAVE THE DIFFERENCE         FP226120
                          LDX  L1 BUFR3+2   XR1 POINT TO FIRST LET WORD FP226130
                          LD    3 BZ903-X   FETCH AND STORE             FP226140
                          STO   1 -1        *NEW LET SECTOR ADDRESS     FP226150
                    C2240 BSI  L  FTCH3     BRANCH TO READ A LET SECTOR FP226160
                    *                                                   FP226170
                    * WHEN CHAIN ADDRESS IS 0 THIS IS LAST LET SCTR     FP226180
                    *                                                   FP226190
                          LD    1 1         FETCH,                      FP226200
                          A     3 BZ906-X   *INCREMENT AND STORE        FP226210
                          STO   1 1         *SECTOR ADDRESS OF UA       FP226220
                          LD    1 4         FETCH THE CHAIN ADDRESS     FP226230
                          BSC  L  C2280,+-  BRANCH IF ZERO              FP226240
                          A     3 BZ906-X   INCREMENT AND               FP226250
                          STO   1 4         *STORE THE CHAIN ADDRESS    FP226260
                          BSI  L  WRIT3     BR TO WRITE THE LET SECTOR  FP226270
                          MDX  L  BUFR3+1,1 INCR ADDR FOR NEXT LET SCTR FP226280
                          MDX     C2240     BR TO READ NEXT LET SECTOR  FP226290
                    *                                                   FP226300
                    C2280 LD    3 BX913-X   GET CONSTANT HEX 13F    2-5 FP226301
                          S     1 3         SUB NO. WDS AVAILABLE   2-5 FP226302
                          STO     C2282+1   SET 2ND WD OF LD INSTR  2-5 FP226303
                          STO     C2284+1   SET 2ND WD OF STO INSTR 2-5 FP226304
                    C2282 LD   L1 *-*       LOAD 1DUMY DB COUNT     2-5 FP226305
                          SRT     4         SECTOR COUNT IN ACC     2-5 FP226306
                          S     3 BZ906-X   SUBTRACT DIFFERENCE     2-5 FP226307
                          SLT     4         GET NEW DB COUNT IN ACC 2-5 FP226308
                    C2284 STO  L1 *-*       STORE BACK IN LET SCTR  2-5 FP226309
                          BSI  L  WRIT3     BR TO WR LAST LET SCTR      FP226310
                          BSC  I  C2200     RETURN                      FP226320
                    *                                                   FP226330
                    *                                                   FP226340
                    *************************************************** FP226350
                    *                                                   FP226360
                    * CLEAR 'BUFR3' TO BUILD LET INTO.                  FP226370
                    *                                                   FP226380
                    C2300 DC      0         ENTRY/RETURN ADDRESS        FP226390
                          LDX  L1 @SCNT     XR1 = BUFFER WORD COUNT     FP226400
                          SRA     16        FETCH ZERO                  FP226410
                    C2340 STO  L1 BUFR3+1   STORE TO BUFFER             FP226420
                          MDX   1 -1        DECR WORD CNT, SKIP IF ZERO FP226430
                          MDX     C2340     BRANCH TO CLEAR NEXT WORD   FP226440
                          BSC  I  C2300     RETURN                      FP226450
                    *                                                   FP226460
                    *************************************************** FP226470
                    *                                                   FP226480
                    * READ DCOM INTO 'BUFR3'                            FP226490
                    *                                                   FP226500
                    C2400 DC      0         ENTRY/RETURN ADDRESS        FP226510
                          LD    3 BY952-X   FETCH SECTOR ADDR OF DCOM   FP226520
                          STO  L  BUFR3+1   *AND STORE TO I/O BFR AREA  FP226530
                          BSI  L  FTCH3     BRANCH TO READ DCOM         FP226540
                          BSC  I  C2400     RETURN                      FP226550
                    *                                                   FP226560
                    *                                                   FP226570
                          BSS     C2000+2*@SCNT-*-1  PATCH AREA         FP226580
                    *                                                   FP226590
                    *                                                   FP226600
                    C2999 EQU     *-1       END OF OVERLAY 2            FP226610
*SBRK    XX         *SYS LDR - PHASE 2 - OVERLAY 3                      FP226620
                          HDNG    OVERLAY 3 - SET UP RELOAD TABLE       FP226630
                          ORG     OVLAY     BEGIN IN OVERLAY AREA       FP226640
                    *                                                   FP226650
                    *                                                   FP226660
                          DC      C3999-C3000+2  WORD CNT OF OVERLAY 3  FP226670
                          DC      @P2AD+5+2+2+3  SCTR ADDR OF OVERLAY 3 FP226680
                    *                                                   FP226690
                    *                                                   FP226700
                          DC      3         INDICATES OVERLAY 3         FP226710
                    C3000 NOP               A WAIT MAY BE PATCHED HERE  FP226720
                    *                       STATEMENT REMOVED       2-4 FP226730
                          BSI  L  C3800+1   TEST FOR DEVICES NOT HERE   FP226740
                          LD    3 BY965-X   SET FIRST WORD FOLLOWING    FP226750
                          STO  I  BE120+1   *RELOAD TABLE TO /FFFF      FP226760
                          LD    3 BY934-X   IF RELOAD, BR TO UNITE      FP226770
                          BSI  L  C3400,-   *CORE & DISK RELOAD TABLES  FP226780
                          BSI  L  WRIT1     UPDATE RELOAD TABLE ON DISK FP226790
                          BSI  L  CK500     BR TO CALCULATE CHECKSUM    FP226800
                          STO  L  BUFR1+1+@SCNT STORE IN RELOAD TABLE   FP226810
                          BSI  L  WRIT1     UPDATE RELOAD TABLE ON DISK FP226820
                          BSI  L  RLTBL     PROCESS RELOAD TBL IN CORE  FP226830
                    *                                                   FP226840
                    * SET THE WORD COUNT AND SECTOR ADDRESS AT THE      FP226850
                    * END OF DISKZ ON THE COLD START SECTOR.            FP226860
                    *                                                   FP226870
                          LDD  L  CILWC     FETCH AND STORE WORD COUNT  FP226880
                          STD  L  $ZEND-4   *AND SECTOR ADDRESS OF CIL  FP226890
                          LDD     C3902     FETCH AND STORE WD CNT AND  FP226900
                          STD  L  BUFR2     *SCTR ADDR OF COLD START    FP226910
                          BSI  L  FTCH2     BRANCH TO FETCH COLD START  FP226920
                          LDD  L  CILWC     ST WD CNT AND SCTR ADDR OF  FP226930
                          STD  L  BUFR2+$ZEND-@CSTR-4  *CIL TO C.S. END FP226940
                          LDD  L  W2900     FETCH FUNC CODE/I/O AR ADDR FP226950
                          BSI  L  DZ000     BRANCH TO WRITE COLD START  FP226960
                          MDX  L  $DBSY,0   SKIP NEXT IF WRITE COMPLET  FP226970
                          MDX     *-3       BR TO TEST WRITE COMPLETE   FP226980
                          BSI  L  C3200     BR TO CLEAR SYS LDR FR DISK FP226990
                          LDX  L1 $DUMP     SET $IREQ                   FP227000
                          STX  L1 $IREQ     *POINTING TO $DUMP          FP227010
                          LD    3 BY934-X   TEST FOR AND BRANCH TO READ FP227020
                    *                                                   FP227030
                    * ON RELOAD, TEST FOR XEQ MODIF, ELSE SET UP        FP227040
                    * PAGE HEADING SECTOR.                              FP227050
                    *                                                   FP227060
                          BSC  L  BB000,-   *NEXT RECORD IF A RELOAD    FP227070
                    *                                                   FP227080
                    * CLEAR THE PAGE HEADING BUFFER.                    FP227090
                    *                                                   FP227100
                          LDX  L1 @SCNT     XR1 = SECTOR WORD COUNT     FP227110
                          LD      C3926     FETCH AN EBCDIC BLANK /4040 FP227120
                    C3040 STO  L1 BUFR2+1   STORE TO BUFFER             FP227130
                          MDX   1 -1        DECR WORD CNT, SKIP IF ZERO FP227140
                          MDX     C3040     BRANCH TO STORE NEXT WORD   FP227150
                          LDD     C3924     FETCH AND STORE             FP227160
                          STD  L  BUFR2+2   *'PAGE' TO BUFFER           FP227170
                          LD      C3927     FETCH AND STORE             FP227180
                          STO  L  BUFR2+5   *PAGE COUNT (1) TO BUFFER   FP227190
                          LD    3 BX901-X   INITIALIZE                  FP227200
                          STO  L  $PGCT     *PAGE COUNT IN COMMA        FP227210
                          LD      C3922     FETCH AND STORE             FP227220
                          STO  L  BUFR2+1   *HEADING SECTOR ADDRESS     FP227230
                          BSI  L  WRIT2     BR TO WRITE HEADING SECTOR  FP227240
                    *                                                   FP227250
                    * UPDATE STATUS WORD IN ID SECTOR                   FP227260
                    *                                                   FP227270
                          LD    3 BZ910-X   FETCH AND STORE SECTOR      FP227280
                          STO  L  BUFR2+1   *ADDRESS OF ID SECTOR       FP227290
                          BSI  L  FTCH2     BRANCH TO FETCH ID SECTOR   FP227300
                          LD    3 BX902-X   UPDATE                      FP227310
                          STO  L  BUFR2+2+@STAT  *STATUS (WORD 7 = +2)  FP227320
                          BSI  L  WRIT2     BRANCH TO WRITE ID SECTOR   FP227330
                    *                                                   FP227340
                    * CALL THE AUXILIARY SUPERVISOR TO PLACE A DUMMY    FP227350
                    * 'DUP' RECORD IN THE SUPERVISOR BUFFER.            FP227360
                    *                                                   FP227370
                          WAIT              A WAIT MAY BE PATCHED HERE  FP227380
                          SRA     16        CLEAR                       FP227390
                          STO  L  $IOCT     *I/O COUNTER                FP227400
                          BSI  L  $DUMP     BRANCH TO FETCH AUX SUPV    FP227410
                          DC      -5        INDICATES A DUMMY 'DUP'     FP227420
                    *                                                   FP227430
                    * CONSTANTS AND WORK AREAS.                         FP227440
                    *                                                   FP227450
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   FP227460
                    C3902 DC      320       WORD COUNT                  FP227470
                          DC      @IDAD     SECTOR ADDRESS              FP227480
                    C3903 DC      /76AF     CON TO FIND '// XEQ MODIF'  FP227490
                    *                                                   FP227500
                    * TEST WORDS 1, 3, 6 AND 7 FOR // XEQ MODIF         FP227510
                    *                                                   FP227520
                    C3060 DC      0         ENTRY                       FP227530
                          LD    1 1         FETCH WORD 1                FP227540
                          A     1 3         ADD WORD 3                  FP227550
                          A     1 6         ADD WORD 6                  FP227560
                          A     1 7         ADD WORD 7                  FP227570
                          EOR     C3903     TEST FOR AND BRANCH         FP227580
                          BSC  L  C3900,Z   *IF NOT '// XEQ MODIF' RCD  FP227590
                    *                                                   FP227600
                    * SET UP CALLING SEQUENCE TO AUX SUPERVISOR         FP227610
                    *                                                   FP227620
                          NOP               A WAIT MAY BE PATCHED HERE  FP227630
                          SRA     16        CLEAR                       FP227640
                          STO  L  $IOCT     *I/O COUNTER                FP227650
                          BSI  L  $DUMP     BRANCH TO FETCH AUX SUPV    FP227660
                          DC      -6        INDIC A DUMMY 'XEQ MODIF'   FP227670
                    *                                                   FP227680
                    *************************************************** FP227690
                    *                                                   FP227700
                    * CLEAR SYSTEM LOADER FROM DISK.                    FP227710
                    *                                                   FP227720
                    C3200 DC      0         ENTRY/RETURN ADDRESS        FP227730
                          LDX  L1 @SCNT     XR1 = SECTOR WORD COUNT     FP227740
                          SRA     16        CLEAR ACCUMULATOR           FP227750
                    C3220 STO  L1 BUFR2+1   STORE TO BUFFER             FP227760
                          MDX   1 -1        DECR WORD CNT, SKIP IF ZERO FP227770
                          MDX     C3220     BRANCH TO CLEAR NEXT WORD   FP227780
                          LD      C3921     FETCH AND STORE             FP227790
                          STO  L  BUFR2+1   *SECTOR ADDRESS             FP227800
                    C3260 MDX  L  BUFR2+1,1 INCREMENT SECTOR ADDRESS    FP227810
                          BSI  L  WRIT2     BRANCH TO WRITE A SECTOR    FP227820
                          MDX  L  C3920,-1  DECR SCTR CNT, SKIP IF ZERO FP227830
                          MDX     C3260     BRANCH TO WRITE NEXT SECTOR FP227840
                          BSC  I  C3200     RETURN                      FP227850
                    *                                                   FP227860
                    * CONSTANTS AND WORK AREAS.                         FP227870
                    *                                                   FP227880
                    C3920 DC      15        NO. SCTRS OCCUPIED BY PH 2  FP227890
                    C3921 DC      @P2AD-1   SCTR ADDR OF PHASE 2 - 1    FP227900
                    C3922 DC      @HDNG     PAGE HEADING SECTOR         FP227910
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   FP227920
                    C3924 EBC     .PAGE.                                FP227930
                    C3926 DC      /4040     EBCDIC BLANKS               FP227940
                    C3927 DC      /40F1     EBCDIC FOR BLANK, ONE       FP227950
                    *                                                   FP227960
                    *************************************************** FP227970
                    *                                                   FP227980
                    * COMPARE THE RELOAD TABLE CONSTRUCTED IN CORE TO   FP227990
                    * THE RELOAD TABLE RESIDING ON DISK.                FP228000
                    *                                                   FP228010
                    C3400 DC      0         ENTRY/RETURN ADDRESS        FP228020
                          LD   I  C3940     ADVANCE IN-CORE RELOAD      FP228030
                          EOR   3 BY965-X   *TABLE POINTER TO LOCATION  FP228040
                          BSC  L  C3410,+-  *OF 'FFFF' ENTRY            FP228050
                          MDX  L  C3940,3   PASS GROUP OF 3             FP228060
                          MDX     C3400+1   TEST FOR 'FFFF' AGAIN       FP228070
                    C3410 LD   L  BUFR1+1   PREPARE TO FETCH            FP228080
                          STO  L  BUFR2+1   *RELOAD TABLE               FP228090
                          BSI  L  FTCH2     BR TO FETCH RELOAD TABLE    FP228100
                          LDX  L1 BUFR2+2   XR1 POINTS TO RELOAD TABLE  FP228110
                    C3420 LDX  L2 BUFR1+2   XR2 POINTS TO IN-CORE TABLE FP228120
                          LD    1 0         IF NO MORE ENTRIES ARE IN   FP228130
                          EOR   3 BY965-X   *THE DISK RELOAD TABLE      FP228140
                          BSC  I  C3400,+-  *RETURN                     FP228150
                    C3430 LD    2 0         IF END OF IN-CORE TABLE     FP228160
                          EOR   3 BY965-X   *BEFORE MATE WAS FOUND      FP228170
                          BSC  L  C3450,+-  *BR TO PLACE AT END OF TBL  FP228180
                          LD    1 0         TEST FOR RELOAD PHASE       FP228190
                          S     2 0         *MATE                       FP228200
                          BSC  L  C3440,+-  *BR IF FOUND                FP228210
                          MDX   2 3         ADVANCE 1 SET IN IN-CORE    FP228220
                          MDX     C3430     *TABLE, TRY FOR MATE AGAIN  FP228230
                    *                                                   FP228240
                    * PLACE AN UNMATCHED ENTRY AT END OF IN-CORE TABLE  FP228250
                    *                                                   FP228260
                    C3450 LD   L  BUFR1     FETCH WD CNT IN RELOAD TBL  FP228270
                          S     3 BX914-X   TEST FOR                    FP228280
                          A     3 BX902-X   *AND BRANCH                 FP228290
                          BSI  L  ER130,-   *IF EQ TO/GREATER THAN 318  FP228300
                          LDX  I2 C3940     XR2 = CURRENT POINTER       FP228310
                          LD    1 0         MOVE                        FP228320
                          STO   2 0         *DISK RELOAD TABLE ENTRY    FP228330
                          LD    1 1         *TO END OF                  FP228340
                          STO   2 1         *IN-CORE TABLE              FP228350
                          LD    1 2         *TO BE                      FP228360
                          STO   2 2         *PROCESSED                  FP228370
                          MDX  L  C3940,3   INCR END OF STRING POINTER  FP228380
                          MDX  L  BUFR1,3   INCREMENT STRING WORD COUNT FP228390
                          LD    3 BY965-X   STORE 'FFFF'                FP228400
                          STO  I  C3940     *AT END OF STRING           FP228410
                    *                                                   FP228420
                    C3440 MDX   1 3         STEP THRU RELOAD TABLE FROM FP228430
                          MDX     C3420     *DISK THAT IS NOW IN BUFFER FP228440
                    *                                                   FP228450
                    * CONSTANTS AND WORK AREAS                          FP228460
                    *                                                   FP228470
                    C3940 DC      BUFR1+2   RELOAD TABLE POINTER        FP228480
                    *                                                   FP228490
                    *             STATEMENTS MOVED TO MAINLINE      2-4 FP228500
                    *                                                   FP228510
                    *************************************************** FP228520
                    *                                                   FP228530
                    * DETERMINE WHICH DEVICES WERE NOT INCLUDED IN THE  FP228540
                    * CONFIGURATION DECK.  THE SIGN BIT OF THE SECTOR   FP228550
                    * ADDRESSES OF THE DEVICES NOT PRESENT WILL BE SET  FP228560
                    * ON.  THE SAME WILL BE DONE FOR UNUSED CONVERSION  FP228570
                    * SUBROUTINES.                                      FP228580
                    *                                                   FP228590
                    C3800 BSC  L  *-*       ENTRY/RETURN ADDRESS        FP228600
                    C3810 MDX  L  C3984,-2  DECR LOOP COUNTER           FP228610
                          BSC     +-Z       CONTINUE UNTIL ZERO         FP228620
                          MDX     C3800     RETURN                      FP228630
                    C3820 LDD  L  C3980     FETCH A PAIR OF ENTRIES     FP228640
                          AND  L  DINDR     TEST FOR AND                FP228650
                          BSC  L  C3860,+-  *BRANCH IF BIT IS SET       FP228660
                    C3840 MDX  L  C3820+1,2 INCREMENT THE PAIR POINTER  FP228670
                          MDX     C3810     BRANCH TO TEST NEXT DEVICE  FP228680
                    *                                                   FP228690
                    C3860 RTE     16        ROTATE PHASE ID TO ACC      FP228700
                          BSI  L  SSLET     BRANCH TO SEARCH SLET       FP228710
                          BSI  L  ER032,+-  BR IF PHASE ID MISSING      FP228720
                          LD    3 BY964-X   FETCH SIGN BIT              FP228730
                          OR    2 3         MASK IN PHASE ID            FP228740
                          STO   2 3         *AND RESTORE TO SLET        FP228750
                          BSI  L  WRIT3     BRANCH TO WRITE SLET        FP228760
                          MDX     C3840     BRANCH TO TEST NEXT DEVICE  FP228770
                    *                                                   FP228780
                    * CONSTANTS AND WORK AREAS                          FP228790
                    *                                                   FP228800
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   FP228810
                    C3980 DC      /0040     MASK FOR BIT 9     ISS 9    FP228820
                          DC      P1403     1403 PRINTER                FP228830
                          DC      /0200     MASK FOR BIT 6     ISS 6    FP228840
                          DC      P1132     1132 PRINTER                FP228850
                          DC      /0800     MASK FOR BIT 4     ISS 4    FP228860
                          DC      I2501     2501 READER                 FP228870
                          DC      /4000     MASK FOR BIT 1     ISS 1    FP228880
                          DC      I1442     1442 READER/PUNCH           FP228890
                          DC      /1000     MASK FOR BIT 3     ISS 3    FP228900
                          DC      I1134     PAPER TAPE READ/PUNCH       FP228910
                          DC      /4800     MASK FOR BITS 1 AND 4       FP228920
                          DC      CDCNV     CARD CONVERSION             FP228930
                    C3982 DC      /1000     MASK FOR BIT 3              FP228940
                          DC      C1134     PAPER TAPE CONVERSION       FP228950
                    *                                                   FP228960
                    C3984 DC      C3982+4-C3980 SIZE OF TABLE + 2       FP228970
                    *                                                   FP228980
                    *************************************************** FP228990
                    *                                                   FP229000
                    * SUBROUTINE TO CALCULATE CHECKSUM OF SLET AND      FP229010
                    * RELOAD TABLE (EXCLUDING LAST WORD OF RELOAD TBL)  FP229020
                    *                                                   FP229030
                    CK500 DC      0         ENTRY/RETURN ADDRESS        FP229040
                          LDD     CK910     SET UP BUFFER TO START      FP229050
                          STD  L  BUFR1     *READING AT 1ST SCTR SLET   FP229060
                          SLA     16        CLEAR CALCULATED            FP229070
                          STO     CK912     *CHECKSUM                   FP229080
                          LDX   1 -4        4 SECTORS TO CHECKSUM       FP229090
                          STX   1 CK914                                 FP229100
                    CK510 MDX  L0 BUFR1+1,1 INCREMENT SECTOR ADDRESS    FP229110
                          BSI  L  FTCH1     READ SECTOR FROM DISK       FP229120
                          LDX  L1 @SCNT-1   WORDS - 1 PER SECTOR        FP229130
                          LD      CK912     RESTORE CHECKSUM TO ACC     FP229140
                    CK520 A    L1 BUFR1+1   CALCULATE CHECKSUM          FP229150
                          BSC     C         IF CARRY                    FP229160
                          A     3 BX901-X   *ADD 1 TO CHECKSUM          FP229170
                          MDX   1 -1        STEP THROUGH SECTOR         FP229180
                          MDX     CK520     BR TO LOOP IN SECTOR        FP229190
                          STO     CK912     SAVE CHECK SUM              FP229200
                          MDX  L0 CK914,1   INCREMENT SECTOR LOOP COUNT FP229210
                          MDX     CK530     BR, IS NOT RELOAD SECTOR    FP229220
                          BSC  I  CK500     RETURN                      FP229230
                    *                                                   FP229240
                    * INCLUDE LAST WORD OF SECTOR IN ALL BUT RELOAD     FP229250
                    * SECTOR                                            FP229260
                    *                                                   FP229270
                    CK530 A    L  BUFR1+1+@SCNT LAST WORD OF SECTOR     FP229280
                          BSC     C         IF CARRY                    FP229290
                          A     3 BX901-X   *ADD 1 TO CHECKSUM          FP229300
                          STO     CK912     SAVE CHECK SUM              FP229310
                          MDX     CK510     BR TO LOOP 4 SECTORS        FP229320
                    *                                                   FP229330
                    * CONSTANTS AND WORK AREAS                          FP229340
                    *                                                   FP229350
                          BSS  E  0                                     FP229360
                    CK910 DC      @SCNT     WORD COUNT 1 SECTOR         FP229370
                          DC      @SLET-1   SECTOR ADDRESS OF SLET - 1  FP229380
                    CK912 DC      *-*       CALCULATED CHECKSUM         FP229390
                    CK914 DC      *-*       SECTOR LOOP COUNTER         FP229400
                    *                                                   FP229410
                    *************************************************** FP229420
                    *                                                   FP229430
                    * READ A SECTOR FROM DISK INTO 'BUFR1'              FP229440
                    *                                                   FP229450
                    FTCH1 DC      0         ENTRY/RETURN ADDRESS        FP229460
                          LDD     F1900     FETCH FUNC CODE, I/O ADDR   FP229470
                          BSI  L  DZ000     BRANCH TO READ A SECTOR     FP229480
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  FP229490
                          MDX     *-3       BR TO TEST READ COMPLETE    FP229500
                          BSC  I  FTCH1     RETURN                      FP229510
                    *                                                   FP229520
                    * CONSTANTS AND WORK AREAS                          FP229530
                    *                                                   FP229540
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   FP229550
                    F1900 DC      /0000     READ FUNCTION CODE          FP229560
                          DC      BUFR1     ADDRESS OF I/O AREA         FP229570
                    *                                                   FP229580
                    *************************************************** FP229590
                    *                                                   FP229600
                    * PROCESS RELOAD TABLE TO DETERMINE PHASES WHICH    FP229610
                    * REQUIRE SLET TABLE ENTRIES.                       FP229620
                    *                                                   FP229630
                    RLTBL DC      0         ENTRY/RETURN ADDRESS        FP229640
                    RL020 LD   L  BUFR1+2   FETCH A SLET PHASE ID       FP229650
                          EOR   3 BY965-X   TEST FOR AND                FP229660
                          BSC  I  RLTBL,+-  *RETURN IF END OF TABLE     FP229670
                          EOR   3 BY965-X   RESET PHASE ID              FP229680
                          BSI  L  SSLET     BRANCH TO SEARCH SLET       FP229690
                          BSI  L  ER031,+-  BR IF DEF SLET OR RL TBL    FP229700
                          BSC  L  RL150,+-  BR TO SKIP BAD ENTRY        FP229710
                          LDX  I1 RL020+1   XR1 PTS TO POS IN RL TABLE  FP229720
                          LD    1 1         FETCH SECTOR ADDRESS        FP229730
                          SRT     16        DETERMINE WHICH             FP229740
                          D     3 BX914-X   *SECTOR OF THE PHASE        FP229750
                          A     2 3         *TO WHICH THE               FP229760
                          STO  L  BUFR2+1   *CORRECTIONS WILL BE MADE   FP229770
                          RTE     16        FETCH AND STORE RLTV        FP229780
                          STO     RL900     *LOCATION IN SECTOR         FP229790
                          LD    1 2         FETCH AND SAVE              FP229800
                          STO     RL901     *NO. OF SETS TO BE FILLED   FP229810
                          BSI  L  FTCH2     BRANCH TO FETCH THE PHASE   FP229820
                    RL060 LD      RL900     FETCH SET LOCATION          FP229830
                          S     3 BX914-X   TEST FOR AND BRANCH         FP229840
                          BSC  L  RL080,Z+  *IF NOT END OF SECTOR       FP229850
                          BSI  L  WRIT2     BRANCH TO WRITE THE SECTOR  FP229860
                          SRA     16        CLEAR                       FP229870
                          STO     RL900     *SECTOR LOCATION            FP229880
                          MDX  L  BUFR2+1,1 INCREMENT SECTOR ADDRESS    FP229890
                          BSI  L  FTCH2     BR TO FETCH NEXT SECTOR     FP229900
                    RL080 LDX  I1 RL900     RESET XR1 WITH THE REM      FP229910
                          LD   L1 BUFR2+2   FETCH PH ID TO LOOK UP      FP229920
                          BSI  L  SSLET     BRANCH TO SEARCH SLET       FP229930
                          BSC  L  RL120,Z   BRANCH IF PHASE ID FOUND    FP229940
                    *                                                   FP229950
                    * CONTINUE IF THE PHASE REQUESTED IS FIRST PHASE OF FP229960
                    * A PROGRAM THAT HAS BEEN BYPASSED OR VOIDED.  IF   FP229970
                    * YES, INSERT ZEROS IN REMAINDER OF SLET ENTRY IN   FP229980
                    * THE REQUESTING PHASE.                             FP229990
                    *                                                   FP230000
                          LDX   2 5         XR2 = NO. POSS PROGS VOIDED FP230010
                    RL100 LD   I2 RL906-1   FETCH PHASE ID              FP230020
                          AND   3 BY972-X   TEST FOR AND                FP230030
                          EOR  L  SS900     *BRANCH IF A                FP230040
                          BSC  L  RL110,+-  *BYPASSED OR VOIDED PROGRAM FP230050
                          LD   I2 RL908-1   FETCH PHASE ID, TEST    2-5 FP230052
                          AND   3 BY972-X   *FOR AND BRANCH IF LAST 2-5 FP230054
                          EOR  L  SS900     *PHASE OF A BYPASSED OR 2-5 FP230056
                          BSC  L  RL110,+-  *VOIDED PROGRAM         2-5 FP230058
                          MDX   2 -1        DECR PROG CNT, SKIP IF ZERO FP230060
                          MDX     RL100     BRANCH TO TEST NEXT PROGRAM FP230070
                    *                                                   FP230080
                          LD   I  RL020+1   FETCH PH ID OF REQUESTING   FP230090
                          RTE     16        *PHASE AND SHIFT TO EXT     FP230100
                          LD   L  SS900     FETCH MISSING PHASE ID      FP230110
                          BSI  L  ER026     BR TO ERROR E 26, RETURN    FP230120
                    RL110 LDX  L2 RL903-1   XR2 POINTS TO ZEROS         FP230130
                    RL120 MDX   1 1         INCR LOCATION POINTER       FP230140
                          STX   1 RL907     *AND SAVE                   FP230150
                          MDX  L  RL900,1   INCREMENT REMAINDER         FP230160
                          LD      RL907     FETCH LOCATION POINTER      FP230170
                          S     3 BX913-X   TEST FOR AND BRANCH         FP230180
                          BSC  L  RL200+1,-Z  *IF SECTOR COMPLETE       FP230190
                    RL140 LD    2 1         FETCH AN ENTRY              FP230200
                          STO  L1 BUFR2+2   *AND STORE TO BUFFER        FP230210
                          MDX  L  RL900,1   INCREMENT REMAINDER         FP230220
                          NOP               AVOID POSSIBLE SKIP         FP230230
                          MDX  L  RL902,-1  DECR CNTR, SKIP IF ZERO     FP230240
                          MDX     RL180     BRANCH TO STORE NEXT WORD   FP230250
                          LD    3 BX903-X   RESET                       FP230260
                          STO     RL902     *COUNTER                    FP230270
                          MDX  L  RL901,-1  DECR SET CNT, SKIP IF ZERO  FP230280
                          MDX     RL060     BRANCH TO PROCESS NEXT SET  FP230290
                          BSI  L  WRIT2     BRANCH TO WRITE THE SECTOR  FP230300
                    RL150 MDX  L  RL020+1,3 POINT TO NEXT RELOAD ENTRY  FP230310
                          MDX     RL020     BR TO CHECK NEXT ENTRY      FP230320
                    *                                                   FP230330
                    RL160 SRA     16        CLEAR                       FP230340
                          STO     RL900     *REMAINDER                  FP230350
                          MDX  L  BUFR2+1,1 INCREMENT SECTOR ADDRESS    FP230360
                          BSI  L  FTCH2     BRANCH TO FETCH NEXT SECTOR FP230370
                          LDX  I1 RL900     XR1 = NEW REMAINDER         FP230380
                          MDX     RL140     BRANCH TO STORE SLET INFO   FP230390
                    *                                                   FP230400
                    RL180 LD      RL900     FETCH REMAINDER             FP230410
                          S     3 BX914-X   TEST FOR AND BRANCH         FP230420
                          BSC  L  RL200,+-  *IF SECTOR COMPLETED        FP230430
                          MDX   2 1         INCR TO NEXT SLET WORD      FP230440
                          LDX  I1 RL900     POINT TO NEXT BUFFER WORD   FP230450
                          MDX     RL140     BRANCH TO STORE NEXT WORD   FP230460
                    *                                                   FP230470
                    RL200 MDX   2 1         INCR TO NEXT SLET WORD      FP230480
                          BSI  L  WRIT2     BRANCH TO WRITE A SECTOR    FP230490
                          MDX     RL160     BRANCH TO FETCH NEXT SECTOR FP230500
                    *                                                   FP230510
                    * CONSTANTS AND WORK AREAS                          FP230520
                    *                                                   FP230530
                    RL900 DC      *-*       SAVED REMAINDER             FP230540
                    RL901 DC      *-*       SAVED SET CNT TO PATCH      FP230550
                    RL902 DC      3         CTR TO UPDATE 3 WDS/SET     FP230560
                    RL903 DC      0         ZEROES TO PLACE IN A        FP230570
                          DC      0         *REQUESTING PHASE WHEN      FP230580
                          DC      0         *PROG REQUESTED NOT PRESENT FP230590
                    *                                                   FP230600
                    RL906 DC      PAIR2     FIRST ID                    FP230610
                          DC      PAIR3     *OF                         FP230620
                          DC      PAIR8     *PROGRAMS THAT              FP230630
                          DC      PAIR9     *MAY BE                     FP230640
                          DC      PAIRA     *PASSED OR VOIDED           FP230650
                    RL907 DC      *-*       TEMPORARY XR1 STORAGE       FP230660
                    RL908 DC      PAIR2+1   LAST ID                 2-5 FP230662
                          DC      PAIR3+1   *OF                     2-5 FP230663
                          DC      PAIR8+1   *PROGRAMS THAT MAY      2-5 FP230665
                          DC      PAIR9+1   *BE BYPASSED            2-5 FP230667
                          DC      PAIRA+1   *OR VOIDED              2-5 FP230669
                    *                                                   FP230670
                    *************************************************** FP230680
                    *                                                   FP230690
                    * PRINT 'END OF RELOAD' MESSAGE                 2-9 FP230700
                    *                                                   FP230710
                    C3900 LDX  L1 MSGXX+1   POINT TO END MESSAGE        FP230720
                          LDX  I2 MSGXX     FETCH WORD CNT OF END MSG   FP230730
                          BSI  L  CNPTR     BRANCH TO PRINT MESSAGE     FP230740
                          STX  L  $FLSH     SET 'JOB' RCD REQUIRED INDR FP230750
                          BSC  L  $EXIT     BRANCH TO FETCH SUPV        FP230760
                    *                                                   FP230770
                    * 'END OF RELOAD' MESSAGE                       2-9 FP230780
                    *                                                   FP230790
                    MSGXX DC      C3998-*   WORD COUNT OF END MESSAGE   FP230800
                          DMES    'REND OF RELOAD 'R'E              2-9 FP230810
                    *                                                   FP230820
                    *                                                   FP230830
                    C3998 BSS     C3000+2*@SCNT-*-1  PATCH AREA         FP230840
                    *                                                   FP230850
                    *                                                   FP230860
                    C3999 EQU     *-1       END OF OVERLAY 3            FP230870
                    *                                                   FP230880
                          END     BA000     END OF PHASE 2              FP230890
