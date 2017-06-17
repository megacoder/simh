                          HDNG    SUPV PHASE 1 - MON CTRL RCD ANALYZER  N0100010
                          ABS                                           N0100020
                    *************************************************** N0100030
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * N0100040
                    *                                                 * N0100050
                    *FUNCTION/OPERATION -                             * N0100060
                    *   * THE MONITOR CONTROL RECORD ANALYZER (MCRA)  * N0100070
                    *     READS MONITOR CONTROL RECORDS FROM THE      * N0100080
                    *     PRINCIPAL INPUT DEVICE OR FETCHES THE       * N0100090
                    *     RECORD FROM THE SUPERVISOR BUFFER (@SBFR).  * N0100100
                    *   * THE MCRA PRINTS THE MONITOR CONTROL RECORDS.* N0100110
                    *   * THE MCRA RECOGNIZES AND PROCESSES THE       * N0100120
                    *     FOLLOWING MONITOR CONTROL RECORDS -         * N0100130
                    *       * JOB   FETCHES AND TRANSFERS TO          * N0100140
                    *               SUPERVISOR PHASE 2 FOR JOB        * N0100150
                    *               PROCESSING.                       * N0100160
                    *       * EJE   RESTORES THE PAGE, PRINTS THE     * N0100170
                    *               HEADING AND BRANCHES TO READ THE  * N0100180
                    *               NEXT RECORD.                      * N0100190
                    *       * PAU   WAITS FOR 'PROGRAM START' AND     * N0100200
                    *               BRANCHES TO READ THE NEXT RECORD. * N0100210
                    *       * CPR   CAUSES THE CONSLE PRINTER TO BE   * N0100220
                    *               THE PRINCIPAL PRINT DEVICE AND    * N0100230
                    *               BRANCHES TO READ THE NEXT RECORD. * N0100240
                    *       * TYP   CAUSES THE KEYBOARD TO BE THE     * N0100250
                    *               PRINCIPAL INPUT DEVICE AND        * N0100260
                    *               BRANCHES TO READ THE NEXT RECORD. * N0100270
                    *       * TEN   CAUSES THE PRINCIPAL INPUT DEVICE * N0100280
                    *               (NOT THE KEYBOARD) TO BE THE      * N0100290
                    *               PRINCIPAL INPUT DEVICE AND        * N0100300
                    *               BRANCHES TO READ THE NEXT RECORD. * N0100310
                    *       * XEQ   FETCHES AND TRANSFERS TO          * N0100320
                    *               SUPERVISOR PHASE 4 FOR XEQ        * N0100330
                    *               PROCESSING.                       * N0100340
                    *       * DUP   FETCHES AND TRANSFERS TO DISK     * N0100350
                    *               UTILITY PROGRAM PHASE 0.          * N0100360
                    *       * ASM   FETCHES AND TRANSFERS TO ASSEMBLER* N0100370
                    *               PHASE 0.                          * N0100380
                    *       * FOR   FETCHES AND TRANSFERS TO FORTRAN  * N0100390
                    *               COMPILER PHASE 1.                 * N0100400
                    *       * RPG   FETCHES AND TRANSFERS TO          * N0100410
                    *               RPG COMPILER PHASE  .             * N0100420
                    *       * CEN   RESTORES PRINCIPAL PRINT DEVICE TO* N0100430
                    *               STATUS BEFORE EXECUTION OF // CPR * N0100440
                    *               AND BRANCHES TO READ NEXT RECORD. * N0100450
                    *       * COB   FETCHES AND TRANSFERS TO COBOL 2-9* N0100452
                    *               COMPILER PHASE 1.              2-9* N0100454
                    *                                                 * N0100460
                    *ENTRY POINTS  -                                  * N0100470
                    *     PROGRAM START - RA000                       * N0100480
                    *                                                 * N0100490
                    *INPUT -                                          * N0100500
                    *     THE INPUT IS THE ABOVE LISTED MONITOR       * N0100510
                    *     CONTROL RECORDS.                            * N0100520
                    *                                                 * N0100530
                    *OUTPUT -                                         * N0100540
                    *     THE MONITOR CONTROL RECORDS ARE PRINTED TO  * N0100550
                    *     THE PRINCIPAL PRINT DEVICE.                 * N0100560
                    *                                                 * N0100570
                    *EXTERNAL REFERENCES                              * N0100580
                    *   * IN COMMA-                                   * N0100590
                    *     $CH12                                       * N0100600
                    *     $CTSW                                       * N0100610
                    *     $DBSY                                       * N0100620
                    *     $FLSH                                       * N0100630
                    *     $GRIN                                       * N0100640
                    *     $HASH                                       * N0100650
                    *     $IBSY                                       * N0100660
                    *     $IBT4                                       * N0100670
                    *     $IOCT                                       * N0100680
                    *     $KCSW                                       * N0100690
                    *     $LEV0                                       * N0100700
                    *     $LEV1                                       * N0100710
                    *     $LINK                                       * N0100720
                    *     $NDUP                                       * N0100730
                    *     $NXEQ                                       * N0100740
                    *     $PBSY                                       * N0100750
                    *     $PHSE                                       * N0100760
                    *     $PRET                                       * N0100770
                    *   * SUBROUTINES -                               * N0100780
                    *     CONVT   PRINCIPAL INPUT DEVICE CONVERSION   * N0100790
                    *             SUBROUTINE.                         * N0100800
                    *     DZ000   RESIDENT DISK I/O SUBROUTINE.       * N0100810
                    *     INPUT   PRINCIPAL INPUT DEVICE SUBROUTINE.  * N0100820
                    *     OUTPT   PRINCIPAL PRINT DEVICE SUBROUTINE.  * N0100830
                    *                                                 * N0100840
                    *EXITS -                                          * N0100850
                    *   * NORMAL -                                    * N0100860
                    *     AN EXIT IS MADE TO ANOTHER PHASE OF THE     * N0100870
                    *     SUPERVISOR TO CONTINUE PROCESSING OR TO THE * N0100880
                    *     FIRST PHASE OF ONE OF THE FOLLOWING SYSTEM  * N0100890
                    *     PROGRAMS -                                  * N0100900
                    *       * THE ASSEMBLER                           * N0100910
                    *       * THE DISK UTILITY PROGRAM                * N0100920
                    *       * THE FORTRAN COMPILER                    * N0100930
                    *       * THE RPG COMPILER.                       * N0100940
                    *       * THE COBOL COMPILER.                  2-9* N0100945
                    *   * ERROR - SEE NOTES.                          * N0100950
                    *                                                 * N0100960
                    *TABLES/WORK AREAS -                              * N0100970
                    *   * @SBFR   AN 80 WORD BUFFER INTO WHICH MONITOR* N0100980
                    *             CONTROL RECORDS ARE READ.           * N0100990
                    *   * DCOM    A 320 WORD BUFFER USED FOR DISK     * N0101000
                    *             COMMUNICATIONS AREA (DCOM) I/O.     * N0101010
                    *                                                 * N0101020
                    *ATTRIBUTES -                                     * N0101030
                    *   * ABSOLUTE.                                   * N0101040
                    *   * REUSABLE.                                   * N0101050
                    *                                                 * N0101060
                    *NOTES -                                          * N0101070
                    *   * ALL I/O DEVICE ERRORS RESULT IN A WAIT AT   * N0101080
                    *     $PRET WITH THE CONTENTS OF THE ACCUMULATOR  * N0101090
                    *     INDICATING THE DEVICE AND TYPE OF ERROR.    * N0101100
                    *   * ALL MONITOR CONTROL RECORD ANALYZER ERRORS  * N0101110
                    *     ARE FLAGGED WITH A MESSAGE AND PROCESSING   * N0101120
                    *     CONTINUES.                                  * N0101130
                    *       * M 11 INVALID MONITOR CONTROL RECORD     * N0101140
                    *       * M 12 EXECUTION SUPPRESSED               * N0101150
                    *       * M 13 DUP SUPPRESSED                     * N0101160
                    *       * M 14 SYSTEM PROGRAM DETECTED MONITOR    * N0101170
                    *              CONTROL RECORD                     * N0101180
                    *       * M 15 ILLEGAL CARTRIDGE ID               * N0101190
                    *       * M 16 PROGRAM VOIDED                     * N0101200
                    *                                                 * N0101210
                    *************************************************** N0101220
                          HDNG    SUPV PHASE 1 - MON CTRL RCD ANALYZER  N0101230
                    *                                                   N0101240
                    *     COMMA EQUATE STATEMENTS                       N0101250
                    *                                                   N0101260
                    $ACDE EQU     /9F  TABLE OF AREA CODES              N0101270
                    $CH12 EQU     /06  CHANNEL 12 INDICATOR             N0101280
                    $COMN EQU     /07  LENGTH OF COMMON (IN WORDS)      N0101290
                    $CORE EQU     /0E  CORE SIZE                        N0101300
                    $CTSW EQU     /0F  CONTROL RECORD TRAP SWITCH       N0101310
                    $CIBA EQU     /05  SCTR ADDR OF CIB                 N0101320
                    $CYLN EQU     /9A  ARM POSITION                     N0101330
                    $DADR EQU     /10  BLK ADDR OF PROG TO BE LOADED    N0101340
                    $DBSY EQU     /EE  NON-ZERO WHEN DISKZ BUSY         N0101350
                    $DCDE EQU     /77  DRIVE CODE OF PROG IN WRK STG    N0101360
                    $DCYL EQU     /A4  TABLE OF DEFECTIVE CYLINDERS     N0101370
                    $DREQ EQU     /12  IND. FOR REQUESTED VERSION DKI/O N0101380
                    $DUMP EQU     /3F  CALL DUMP ENTRY POINT            N0101390
                    $EXIT EQU     /38  CALL EXIT ENTRY POINT            N0101400
                    $FLSH EQU     /71  FLUSH JOB SWITCH                 N0101410
                    $FPAD EQU     /95  TABLE OF FILE PROTECT ADDRESSES  N0101420
                    $GCOM EQU     /63  G2250 SUBROUTINE INDICATOR   2G2 N0101430
                    $GRIN EQU     /64  GRAPHICS INIT PROGRAM INDR   2G2 N0101440
                    $HASH EQU     /14  WORK AREA                        N0101450
                    $IBSY EQU     /13  NON-ZERO IF CD/PAP TP DEV. BUSY  N0101460
                    $IBT4 EQU     /D4  ADDR OF THE IBT, LEVEL 4         N0101470
                    $IOCT EQU     /32  ZERO IF NO I/O IN PROGRESS       N0101480
                    $IREQ EQU     /2C  ADDR OF INT REQUEST SUBROUTINE   N0101490
                    $I420 EQU     /E6  FLUSH JOB ENTRY POINT        2-2 N0101500
                    $KCSW EQU     /7C  1 IF KB,CP BOTH UTILIZED         N0101510
                    $LAST EQU     /33  LAST CARD INDICATOR              N0101520
                    $LEV0 EQU     /08  LEVEL 0 BRANCH ADDRESS       2-3 N0101530
                    $LEV1 EQU     /09  LEVEL 1 BRANCH ADDRESS       2-3 N0101540
                    $LEV2 EQU     /0A  LEVEL 2 BRANCH ADDRESS       2-3 N0101550
                    $LEV3 EQU     /0B  LEVEL 3 BRANCH ADDRESS       2-3 N0101560
                    $LEV4 EQU     /0C  LEVEL 4 BRANCH ADDRESS       2-3 N0101570
                    $LEV5 EQU     /0D  LEVEL 5 BRANCH ADDRESS       2-3 N0101580
                    $LINK EQU     /39  CALL LINK ENTRY POINT            N0101590
                    $NDUP EQU     /34  DO NOT DUP IF NON-ZERO           N0101600
                    $NXEQ EQU     /35  DO NOT EXECUTE IF NON-ZERO       N0101610
                    $PBSY EQU     /36  NON-ZERO WHEN PRINTER BUSY       N0101620
                    $PGCT EQU     /37  PAGE NO. FOR HEADINGS            N0101630
                    $PHSE EQU     /78  NO. OF PHASE NOW IN CORE         N0101640
                    $PRET EQU     /28  IOCS SOFT ERROR TRAP             N0101650
                    $PST1 EQU     /81  TRAP FOR I/O ERRORS, LEVEL 1     N0101660
                    $PST2 EQU     /85  TRAP FOR I/O ERRORS, LEVEL 2     N0101670
                    $PST3 EQU     /89  TRAP FOR I/O ERRORS, LEVEL 3     N0101680
                    $PST4 EQU     /8D  TRAP FOR I/O ERRORS, LEVEL 4     N0101690
                    $SNLT EQU     /EF  SENSE LIGHT INDICATOR            N0101700
                    $STOP EQU     /91  PROGRAM STOP KEY TRAP            N0101710
                    $SYSC EQU     /E0  MODIFICATION LEVEL               N0101720
                    $UFDR EQU     /7D  DRIVE CODE OF UNFORMATTED I/O    N0101730
                    $UFIO EQU     /79  UNFORMATTED I/O RECORD NO.       N0101740
                    $ULET EQU     /2D  TABLE OF LET ADDRESSES           N0101750
                    $WSDR EQU     /7A  WORKING STORAGE DRIVE CODE       N0101760
                    $WRD1 EQU     /7B  ADDR OF 1ST WD OF CORE LOAD      N0101770
                    $ZEND EQU     /1E0 END OF DISKZ SUBROUTINE      2-3 N0101780
                    $CPTR EQU     /007E     CONS PTR CH 12 INDR     212 N0101782
                    $1132 EQU     /007F     1132 CHANNEL 12 INDR    212 N0101785
                    $1403 EQU     /0080     1403 CHANNEL 12 INDR    212 N0101787
                    *                                                   N0101790
                    *     GENERAL EQUATE STATEMENTS                     N0101800
                    *                                                   N0101810
                    #IDAD EQU     /0000     CART ID-DEF CYL SCTR ADDR   N0101820
                    #RIAD EQU     /0002     RESIDENT IMAGE SECTOR ADDR  N0101830
                    #DCOM EQU     /0001     DCOM SECTOR ADDRESS         N0101840
                    #HDNG EQU     /0007     DATE-PAGE COUNT SECTOR ADDR N0101850
                    @NMCR EQU     13        NO OF MONITR CNTRL RCDS 2-9 N0101860
                    @HDWC EQU     10        HEADING BUFFER WORD COUNT   N0101870
                    @PBWC EQU     40        PACKED BUFFER WORD COUNT    N0101880
                    @CCOL EQU     80        NO. OF CHARACTERS/RECORD    N0101890
                    @SCTR EQU     320       NO. OF WORDS PER SECTOR     N0101900
                    @MNCR EQU     /1000     MINIMUM CORE SIZE           N0101910
                    @CSTR EQU     /00D0                             2-3 N0101920
                    @PROC EQU     /0800     PROCESSING PHASES AREA      N0101930
                    @SBFR EQU     /0FB0     ADDRESS OF SUPV BUFFER      N0101940
                    DCOM  EQU     @SBFR-@SCTR-2  SYSTEM DCOM I/O BUFFER N0101950
                    BUFFR EQU     DCOM-@SCTR-2   COMMON DISK I/O BUFFER N0101960
                    DZ000 EQU     $DBSY+4   DISKZ ENTRY POINT           N0101970
                    OUTPT EQU     $ZEND+1   PRINT SUBROUTINE ENTRY      N0101980
                    INPUT EQU     OUTPT+@SCTR  INPUT SUBROUTINE ENTRY   N0101990
                    *                                                   N0102000
                    *     PHASE ID EQUATE STATEMENTS                    N0102010
                    *                                                   N0102020
                    @DUPC EQU     1                                     N0102030
                    @FOR1 EQU     31                                    N0102040
                    @MCRA EQU     110                                   N0102050
                    @JOBP EQU     111                                   N0102060
                    @DELT EQU     112                                   N0102070
                    @XEQP EQU     113                                   N0102080
                    @SCRP EQU     114                                   N0102090
                    @CLB0 EQU     120                                   N0102100
                    @CPTR EQU     142                                   N0102110
                    @KBCP EQU     146                                   N0102120
                    @KBCV EQU     149                                   N0102130
                    @PRNT EQU     153                                   N0102140
                    @PINP EQU     154                                   N0102150
                    @PIDV EQU     155                                   N0102160
                    @CNVT EQU     156                                   N0102170
                    @CVRT EQU     157                                   N0102180
                    @RG00 EQU     176                              2-10 N0102190
                    @ASM0 EQU     207                                   N0102200
                    @YYYY EQU     0                                     N0102210
                    @COB1 EQU     81                                2-9 N0102220
                    *                                                   N0102230
                    *     DCOM EQUATE STATEMENTS                        N0102240
                    *                                                   N0102250
                    #NAME EQU     DCOM+4    NAME OF PROGRAM             N0102260
                    #DBCT EQU     DCOM+6    DISK BLOCK COUNT OF PROGRAM N0102270
                    #FCNT EQU     DCOM+7    FILES INDICATOR             N0102280
                    #SYSC EQU     DCOM+8    SYSTEM CARTRIDGE SWITCH     N0102290
                    #JBSW EQU     DCOM+9    TEMPORARY JOB SWITCH        N0102300
                    #CBSW EQU     DCOM+10   CLB SWITCH                  N0102310
                    #LCNT EQU     DCOM+11   LOCAL INDICATOR             N0102320
                    #MPSW EQU     DCOM+12   MAP SWITCH                  N0102330
                    #MDF1 EQU     DCOM+13   NO. DUP CTRL RCDS (MODIF)   N0102340
                    #MDF2 EQU     DCOM+14   ADDR OF MODIF BUFFER        N0102350
                    #NCNT EQU     DCOM+15   NOCAL INDICATOR             N0102360
                    #ENTY EQU     DCOM+16   REL ENTRY ADDR OF PROGRAM   N0102370
                    #RP67 EQU     DCOM+17   1442-5 SWITCH               N0102380
                    #TODR EQU     DCOM+18   -TO- WK STG DRIVE CODE      N0102390
                    #FRDR EQU     DCOM+19   -FROM- WK STG DRIVE CODE    N0102400
                    #FHOL EQU     DCOM+20   ADDR LARGEST HOLE IN FXA    N0102410
                    #FSZE EQU     DCOM+21   BLK CNT LARGEST HOLE IN FXA N0102420
                    #UHOL EQU     DCOM+22   ADDR LARGEST HOLE IN UA     N0102430
                    #USZE EQU     DCOM+23   BLK CNT LARGEST HOLE IN UA  N0102440
                    #DCSW EQU     DCOM+24   DUP CALL SWITCH             N0102450
                    #PIOD EQU     DCOM+25   PRINCIPAL I/O DEVICE INDIC  N0102460
                    #PPTR EQU     DCOM+26   PRINC PRINT DEVICE INDIC    N0102470
                    #CIAD EQU     DCOM+27   SCTR 0 LOC OF CIL SCTR ADDR N0102480
                    #ACIN EQU     DCOM+28   AVAIL CARTRIDGE INDICATOR   N0102490
                    #GRPH EQU     DCOM+29   2250 INDICATOR          2-8 N0102500
                    #GCNT EQU     DCOM+30   G2250 COUNT             2-8 N0102510
                    #LOSW EQU     DCOM+31   LOCALS CALL LOCALS SW   2-2 N0102520
                    #X3SW EQU     DCOM+32   SPECIAL ILS SWITCH      2-3 N0102530
                    #ECNT EQU     DCOM+33   EQUAT COUNT             2-4 N0102540
                    #ANDU EQU     DCOM+35   END OF UA ADDRESS (ADJ)     N0102550
                    #BNDU EQU     DCOM+40   END OF UA ADDRESS (BASE)    N0102560
                    #FPAD EQU     DCOM+45   FILE PROTECTED ADDRESS      N0102570
                    #PCID EQU     DCOM+50   AVAILABLE CARTRIDGE IDS     N0102580
                    #CIDN EQU     DCOM+55   CARTRIDGE ID                N0102590
                    #CIBA EQU     DCOM+60   SECTOR ADDRESS OF CIB       N0102600
                    #SCRA EQU     DCOM+65   SECTOR ADDRESS OF SCRA      N0102610
                    #FMAT EQU     DCOM+70   FORMAT OF PROGRAM IN WS     N0102620
                    #FLET EQU     DCOM+75   FLET SECTOR ADDRESS         N0102630
                    #ULET EQU     DCOM+80   LET SECTOR ADDRESS          N0102640
                    #WSCT EQU     DCOM+85   BLK CNT OF PROGRAM IN WS    N0102650
                    #CSHN EQU     DCOM+90   1+SCTR ADDR OF END OF CUSN. N0102660
                          HDNG    SUPV PHASE 1 - MON CTRL RCD ANALYZER  N0102670
                          ORG     4*@SCTR-2  SUPV PH 1 (MCRA) I/O AREA  N0102680
                    *                                                   N0102690
                    *     PROVIDE PARAMETERS FOR SYSTEM LOADER          N0102700
                    *                                                   N0102710
                          DC      RA999-*   WORD COUNT OF SUPV PHASE 1  N0102720
                          DC      -@MCRA    PHASE ID OF SUPV PHASE 1    N0102730
                          DC      PRINT-*+1 RLTV ADDR OF SLET TABLE     N0102740
                          DC      @NMCR+6   NO. OF ITEMS IN SLET TABLE  N0102750
                          ORG     *-2                                   N0102760
                          HDNG    SUPV PHASE 1 - MON CTRL RCD ANALYZER  N0102770
                    RA000 LD   L  $GRIN     FETCH GRAPHICS INDICATOR    N0102780
                          BSC  L  RA010,-   TEST FOR AND                N0102790
                          LINK    SGJP      *BRANCH IF 'SGJP'           N0102800
                    RA010 BSC  L  RA020,+   TEST FOR AND                N0102810
                          LINK    GRIN      *BRANCH IF 'GRIN'           N0102820
                    *                                                   N0102830
                    *     INITIALIZATION                                N0102840
                    *                                                   N0102850
                    RA020 LDX   1 @MCRA     SET                         N0102860
                          STX  L1 $PHSE     *SUPERVISOR PHASE 1 INDR    N0102870
                          NOP               A WAIT MAY BE PATCHED HERE  N0102880
                          LDX  L1 TABLE-1   SET ADDRESS OF              N0102890
                          STX  L1 $IBT4     *ILSO4 INTERRUPT BRANCH TBL N0102900
                    *                                                   N0102910
                    *     FETCH PRINCIPAL PRINT SUBROUTINE              N0102920
                    *                                                   N0102930
                    RA040 LDD     PRINT+2   FETCH WD CNT AND SCTR ADDR  N0102940
                          LDX   1 0         INDICATE PRINT SUBROUTINE   N0102950
                          BSI     RA080     BRANCH TO FETCH SUBROUTINE  N0102960
                          LD      TABLE+4   STORE PRINT SUBR INTERRUPT  N0102970
                          STO  L  $LEV1     *ADDR TO LEVEL 1 BR ADDRESS N0102980
                    *                                                   N0102990
                    *     FETCH PRINCIPAL INPUT SUBROUTINE              N0103000
                    *                                                   N0103010
                    RA060 LDX  L1 IKBRD     XR1 = KEYBRD SUBR SLET ADDR N0103020
                          LD   L  $KCSW     TEST FOR AND                N0103030
                          BSC  L  RA480,Z   *BRANCH IF IN KEYBOARD MODE N0103040
                          LDX  L1 PIDEV     FETCH PRINCIPAL INPUT   2-6 N0103050
                          BSC  L  RA480     *DEVICE OTHER THAN KB   2-6 N0103060
                    RA070 LDD     PINPT+2   FETCH WD CNT AND SCTR ADDR  N0103070
                          LDX   1 1         INDICATE INPUT SUBROUTINE   N0103080
                          BSI     RA080     BRANCH TO FETCH SUBROUTINE  N0103090
                          LD      TABLE+6   STORE COLUMN INTERRUPT      N0103100
                          A       RA903     *ENTRY ADDRESS              N0103110
                          STO  L  $LEV0     *TO LEVEL 0 BRANCH ADDRESS  N0103120
                          BSI     RA100     BRANCH TO SET $KCSW         N0103130
                    *                                                   N0103140
                    *     FETCH CONVERSION SUBROUTINE                   N0103150
                    *                                                   N0103160
                          LD      RA905     FETCH ADDR OF INPUT SUBR    N0103170
                          A       PINPT+2   ADD INPUT SUBR WORD COUNT   N0103180
                          A       RA903     MAKE                        N0103190
                          SRA     1         *ADDRESS OF                 N0103200
                          SLA     1         *CONVERSION SUBROUTINE      N0103210
                          STO     RA906     *EVEN AND SAVE              N0103220
                          A       RA903     CALCULATE AND STORE         N0103230
                          STO  L  CONVT     *CONVERSION SUBR ENTRY ADDR N0103240
                          LDD     CNVRT+2   FETCH WD CNT AND SCTR ADDR  N0103250
                          LDX   1 2         INDICATE CONVERSION SUBR    N0103260
                          BSI     RA080     BRANCH TO FETCH SUBROUTINE  N0103270
                          MDX     RA200     BRANCH TO CONTINUE          N0103280
                    *                                                   N0103290
                    *************************************************** N0103300
                    *                                                   N0103310
                    *     FETCH A SUBROUTINE INTO CORE                  N0103320
                    *                                                   N0103330
                    RA080 DC      0         ENTRY/RETURN ADDRESS        N0103340
                          STD  I1 RA904     ST WD CNT/SAD TO I/O AREA   N0103350
                          LD   L1 RA904     FETCH ADDRESS OF I/O AREA   N0103360
                          SRT     16        SHIFT TO EXTENSION, ACC = 0 N0103370
                          BSI  L  DZ000     BRANCH TO DISK READ         N0103380
                    RA090 MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  N0103390
                          MDX     RA090     BR TO TEST READ COMPLETE    N0103400
                          BSC  I  RA080     RETURN                      N0103410
                    *                                                   N0103420
                    *     CONSTANTS AND WORK AREAS                      N0103430
                    *                                                   N0103440
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   N0103450
                    RA901 DC      1         CONSTANT ONE                N0103460
                    RA903 DC      3         CONSTANT THREE              N0103470
                    RA904 DC      OUTPT-3   ADDR OF PRINT SUBR I/O AREA N0103480
                    RA905 DC      INPUT-3   ADDR OF INPUT SUBR I/O AREA N0103490
                    RA906 DC      *-*       ADDR OF CNVRT SUBR I/O AREA N0103500
                    *                                                   N0103510
                    *     INTERRUPT LEVEL 4 BRANCH TABLE                N0103520
                    *                                                   N0103530
                    TABLE BSS     3         RESERVED                    N0103540
                          DC      *-*       1231 OPT. MARK PAGE READER  N0103550
                          DC      OUTPT+3   1403 PRINTER                N0103560
                          DC      INPUT+3   2501 CARD READER            N0103570
                          DC      INPUT+3   1442 CARD READER/PUNCH      N0103580
                          DC      *-*       KEYBOARD/CONSOLE PRINTER    N0103590
                          DC      INPUT+3   1134/1055 PAPT READER/PUNCH N0103600
                    *                                                   N0103610
                    *     INTERNAL SLET INFORMATION                     N0103620
                    *                                                   N0103630
                    PRINT DC      @PRNT     PRINC PRINT SUBR PHASE ID   N0103640
                          BSS     3                                     N0103650
                    *                                                   N0103660
                    PINPT DC      @PINP     PRINC INPUT SUBR PHASE ID   N0103670
                          BSS     3                                     N0103680
                    *                                                   N0103690
                    CNVRT DC      @CNVT     PRINC CONVERSION SUBR PH ID N0103700
                          BSS     3                                     N0103710
                    *                                                   N0103720
                    SUPV3 DC      @DELT     SUPV PHASE 3 PHASE ID       N0103730
                          BSS     3                                     N0103740
                    *                                                   N0103750
                    SUPV5 DC      @SCRP     SUPV PHASE 5 PHASE ID       N0103760
                          BSS     3                                     N0103770
                    *                                                   N0103780
                    CLBP1 DC      @CLB0     CORE LD BLDR PH 0 PHASE ID  N0103790
                          BSS     3                                     N0103800
                    *                                                   N0103810
                    SUPV2 DC      @JOBP     SUPV PHASE 2 PHASE ID       N0103820
                          BSS     3                                     N0103830
                    *                                                   N0103840
                    CKBRD DC      @KBCV     KYBRD CONVERSION SUBR PH ID N0103850
                          BSS     3                                     N0103860
                    *                                                   N0103870
                    CVRT  DC      @CVRT     PRINC CONV (NOT KB) PH ID   N0103880
                          BSS     3                                     N0103890
                    *                                                   N0103900
                    PCPAD DC      @CPTR     CONSOLE PRINTER SUBR PH ID  N0103910
                          BSS     3                                     N0103920
                    *                                                   N0103930
                    IKBRD DC      @KBCP     KEYBOARD SUBR PHASE ID      N0103940
                          BSS     3                                     N0103950
                    *                                                   N0103960
                    PIDEV DC      @PIDV     PRINC INPUT (NOT KB) PH ID  N0103970
                          BSS     3                                     N0103980
                    *                                                   N0103990
                    SUPV4 DC      @XEQP     SUPV PHASE 4 PHASE ID       N0104000
                          BSS     3                                     N0104010
                    *                                                   N0104020
                    DUPCO DC      @DUPC     DUP COMMON PHASE ID         N0104030
                          BSS     3                                     N0104040
                    *                                                   N0104050
                    PHS0  DC      @ASM0      ASM PHASE 0 PHASE ID     * N0104060
                          BSS     3                                     N0104070
                    *                                                   N0104080
                    FOR01 DC      @FOR1     FORTRAN PHASE 1 PHASE ID    N0104090
                          BSS     3                                     N0104100
                    *                                                   N0104110
                    RPG00 DC      @RG00     RPG PHASE 0 PHASE ID   2-10 N0104120
                          BSS     3                                 2-5 N0104130
                    *                                                   N0104140
                    SVPRT DC      @PRNT     SAVE PRINC PRT          2-8 N0104150
                          DC      0                                     N0104160
                          DC      0                                     N0104170
                          DC      0                                     N0104180
                    *                                                   N0104190
                    COB01 DC      @COB1     COBOL PHASE 1 PHASE ID  2-9 N0104200
                          DC      0                                     N0104210
                          DC      0                                     N0104220
                          DC      0                                     N0104230
                    *                                                   N0104240
                    *************************************************** N0104250
                    *                                                   N0104260
                    *     SET KEYBOARD-CONSOLE PRINTER SWITCH           N0104270
                    *                                                   N0104280
                    *             -, KEYBOARD ONLY UTILIZED             N0104290
                    *     $KCSW = 0, CONSOLE PTR OR NEITHER UTILIZED    N0104300
                    *             +, KEYBOARD AND CONSOLE PTR UTILIZED  N0104310
                    *                                                   N0104320
                    RA100 DC      0         ENTRY/RETURN ADDRESS        N0104330
                          LD      PCPAD+3   TEST IF CONSOLE PRINTER     N0104340
                          S       PRINT+3   *IS PRINCIPAL PRINT DEVICE  N0104350
                          BSC  L  RA120,Z   *AND BRANCH IF NOT          N0104360
                          LD      IKBRD+3   TEST IF KEYBOARD            N0104370
                          S       PINPT+3   *IS PRINCIPAL INPUT DEVICE  N0104380
                          BSC  L  RA140,Z   *AND BRANCH IF NOT          N0104390
                          LD      RA901     FETCH A POSITIVE NUMBER     N0104400
                          MDX     RA160     BRANCH TO SET SWITCH        N0104410
                    RA120 LD      IKBRD+3   TEST IF KEYBOARD            N0104420
                          S       PINPT+3   *IS PRINCIPAL INPUT DEVICE  N0104430
                          BSC  L  RA140,Z   *AND BRANCH IF NOT          N0104440
                          LD   L  RA942     FETCH A NEGATIVE NUMBER     N0104450
                          MDX     RA160     BRANCH TO SET SWITCH        N0104460
                    RA140 SRA     16        FETCH ZERO                  N0104470
                    RA160 STO  L  $KCSW     STORE TO KEYBRD-CNSL PTR SW N0104480
                          BSC  I  RA100     RETURN                      N0104490
                    *                                                   N0104500
                    *     TEST CONTROL RECORD INDICATOR                 N0104510
                    *                                                   N0104520
                    *             +, RECORD TRAPPED BY SYSTEM PROGRAM   N0104530
                    *     $CTSW = 0, NO RECORD TRAPPED                  N0104540
                    *             -, RECORD TRAPPED BY DUP (NO ERROR)   N0104550
                    *                                                   N0104560
                    RA200 LD   L  $CTSW     FETCH MON CTRL RCD INDR     N0104570
                          BSC  L  RA240,Z+  BR IF RCD TRAPPED IN BUFFER N0104580
                          BSC  L  RA220,+   BRANCH IF NO RCD TRAPPED    N0104590
                    RA210 LD   L  RA990+3   FETCH ADDR OF MESSAGE M 14  N0104600
                          BSI  L  RA850     BRANCH TO PRINT THE MESSAGE N0104610
                          MDX     RA240     BRANCH TO PACK SUPV BUFFER  N0104620
                    *                                                   N0104630
                    *     READ A MONITOR CONTROL RECORD                 N0104640
                    *                                                   N0104650
                    RA220 BSI  L  RA800     BRANCH TO READ A RECORD     N0104660
                    *                                                   N0104670
                    *     PACK THE SUPV BUFFER  (2 EBCDIC CHARS/WORD)   N0104680
                    *                                                   N0104690
                    RA240 SLA     16        SET                         N0104700
                          STO  L  $CTSW     *MON CTRL RCD INDR OFF      N0104710
                          LD      RA932     SET                         N0104720
                          STO  I  SBADR     *PACKED BUFFER WORD COUNT   N0104730
                    *                                                   N0104740
                          LDX  L1 @SBFR     XR1 = SUPV BUFFER ADDRESS   N0104750
                          LDX   2 -@PBWC    XR2 = PACKED BUFFER WD CNT  N0104760
                    RA260 LD    1 0         FETCH A CHARACTER           N0104770
                          SLA     8         SHIFT TO LEFT HALF OF WORD  N0104780
                          OR    1 1         FETCH NEXT CHARACTER        N0104790
                          STO  L2 @SBFR+@PBWC  STORE TO BUFFER PACKED   N0104800
                          MDX   1 2         INCRMENT BUFFER ADDRESS     N0104810
                          MDX   2 1         DECR WORD CNT, SKIP IF ZERO N0104820
                          MDX     RA260     BRANCH TO PACK NEXT PAIR    N0104830
                    *                                                   N0104840
                    *     TEST FOR MONITOR CONTROL RECORD TYPE          N0104850
                    *                                                   N0104860
                    RA300 LD   L  @SBFR+2   FETCH SECOND HALF OF NAME   N0104870
                          SRT     16        *AND SHIFT TO EXTENSION     N0104880
                          LD   L  @SBFR+1   FETCH FIRST HALF OF NAME    N0104890
                          STD     RA930     *AND SAVE NAME              N0104900
                          S       RA933     TEST FOR AND                N0104910
                          BSC  L  RA340,Z   *BR IF NOT A COMMENTS RCD   N0104920
                          LDX   3 -@NMCR-1  PT TO COMMENTS RCD RETURN  NN0104930
                          MDX     RA370     BRANCH TO PRINT COMMENT RCD N0104940
                    *                                                   N0104950
                    RA340 LDX  L1 SUPV2       XR1 POINTS TO SLET        N0104960
                          LDX   2 -2*@NMCR-1  XR2 = NO. WDS IN NAME TBL N0104970
                          LDX   3 -@NMCR      XR3 = NO. MON CTRL NAMES  N0104980
                    RA360 LDD     RA930       FETCH CONTROL NAME        N0104990
                          SD   L2 RA934+2*@NMCR+1  TEST FOR AND BRANCH  N0105000
                          BSC  L  RA390,Z   *IF FIRST HALF NOT THE SAME N0105010
                          SLT     16        TEST FOR AND BRANCH IF      N0105020
                          BSC  L  RA390,Z   *SECOND HALF NOT THE SAME   N0105030
                          MDX   2 2*@NMCR   SKIP IF NOT A 'JOB' RECORD  N0105040
                          MDX     RA380     BRANCH TO PROCESS 'JOB' RCD N0105050
                    RA370 MDX  L  $FLSH,0   TEST FOR AND BRANCH TO READ N0105060
                          MDX     RA220     *NEXT RCD IF ABORT INDR ON  N0105070
                          LD   L  SBADR     FETCH ADDR OF SUPV BUFFER   N0105080
                          BSI  L  RA850     BRANCH TO PRINT THE RECORD  N0105090
                    RA380 BSC  I3 RA936+@NMCR  BRANCH TO PROCESS RCD    N0105100
                    *                                                   N0105110
                    RA390 MDX   1 4         INCREMENT SLET POINTER      N0105120
                          MDX   2 2         INCREMENT NAME POINTER      N0105130
                          MDX   3 1         INCR NAME CNT, SKIP IF ZERO N0105140
                          MDX     RA360     BRANCH TO TEST NEXT NAME    N0105150
                          LD   L  SBADR     FETCH ADDR OF SUPV BUFFER   N0105160
                          BSI  L  RA850     BRANCH TO PRINT THE RECORD  N0105170
                          LDX   3 1         POINT TO ERROR MESSAGE M 11 N0105180
                          BSI  L  RA900     BRANCH TO PRINT THE MESSAGE N0105190
                    *                                                   N0105200
                    *     CONSTANTS AND WORK AREAS                      N0105210
                    *                                                   N0105220
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   N0105230
                    RA930 BSS     2         CONTROL NAME                N0105240
                    RA932 DC      @PBWC     PACKED I/O BUFFER WORD CNT  N0105250
                    *                                                   N0105260
                    RA933 EBC     . *.      COMMENTS CONTROL RECORD     N0105270
                    RA934 EBC     . JOB.    JOB   CONTROL RECORD        N0105280
                          EBC     . EJE.    EJECT CONTROL RECORD        N0105290
                          EBC     . PAU.    PAUSE CONTROL RECORD        N0105300
                          EBC     . CPR.    CPRT  CONTROL RECORD        N0105310
                          EBC     . TYP.    TYPE  CONTROL RECORD        N0105320
                          EBC     . TEN.    TEND  CONTROL RECORD        N0105330
                          EBC     . XEQ.    XEQ   CONTROL RECORD        N0105340
                          EBC     . DUP.    DUP   CONTROL RECORD        N0105350
                          EBC     . ASM.    ASM   CONTROL RECORD        N0105360
                          EBC     . FOR.    FOR   CONTROL RECORD        N0105370
                          EBC     . RPG.    RPG   CONTROL RECORD    2-5 N0105380
                          EBC     . CEN.    CEN   CONTROL RECORD    2-8 N0105390
                          EBC     . COB.    COB   CONTROL RECORD    2-9 N0105400
                    *                                                   N0105410
                          DC      RA220     COMMENTS RECORD RETURN      N0105420
                    RA936 DC      RA600     JOB   PROCESSING            N0105430
                          DC      RA440     EJECT PROCESSING            N0105440
                          DC      RA460     PAUSE PROCESSING            N0105450
                          DC      RA400     CPRNT PROCESSING            N0105460
                          DC      RA480     TYPE  PROCESSING            N0105470
                          DC      RA480     TEND  PROCESSING            N0105480
                          DC      RA500     XEQ   PROCESSING            N0105490
                          DC      RA520     DUP   PROCESSING            N0105500
                          DC      RA560     ASM   PROCESSING            N0105510
                          DC      RA560     FOR   PROCESSING            N0105520
                          DC      RA560     RPG   PROCESSING        2-5 N0105530
                          DC      RA400     CEN   PROCESSING        2-8 N0105540
                          DC      RA560     COB   PROCESSING        2-9 N0105550
                    *                                                   N0105560
                    *     SET CONSOLE PRINTER AS PRINCIPAL PRINT DEVICE N0105570
                    *                                                   N0105580
                    RA400 LDD   1 2         STORE WD CNT/SCTR ADDR OF   N0105590
                          STD  L  PRINT+2   *CNSL PTR TO PRINC PR DEV   N0105600
                    *                                                   N0105610
                          LDD     RA940     FETCH FUNC CODE/I/O AR ADDR N0105620
                          BSI  L  DZ000     BR TO WRITE SUPV TO DISK    N0105630
                    RA420 MDX  L  $DBSY,0   SKIP NEXT IF WRITE COMPLETE N0105640
                          MDX     RA420     BR TO TEST WRITE COMPLETE   N0105650
                          BSC  L  RA040     BR TO FETCH CNSL PTR SUBR   N0105660
                    *                                                   N0105670
                    *     THE NEXT INSTRUCTION SHOULD NOT OCCUR AFTER   N0105680
                    *     LOCATION /0500 + @SCTR - 2.                   N0105690
                    *                                                   N0105700
                    *     EJECT THE PAGE                                N0105710
                    RA440 LDD  L  PRINT+2   IS CONSOLE PRINTER =    212 N0105720
                          SD   L  PCPAD+2   *TO PRINCIPAL PRINTER?  212 N0105722
                          BSC  L  RA442,Z   NO, BRANCH              212 N0105724
                          STX  I  $CH12     SET CHANNEL 12 INDICATOR212 N0105730
                          B       RA443                             212 N0105737
                    RA442 BSI  L  RSTOR     GO DO EJECT             212 N0105738
                    RA441 MDX  L  $PBSY,0                           2-7 N0105740
                          MDX     RA441                             2-7 N0105750
                          SLA     16                               2-10 N0105754
                          STO  I  $CH12     CLEAR CH 12 INDICATOR  2-10 N0105755
                    RA443 BSC  L  RA220     BR TO READ NEXT             N0105760
                    *                                                   N0105770
                    *     PAUSE UNTIL 'PROGRAM START' KEY PRESSED       N0105780
                    *                                                   N0105790
                    RA460 MDX  L  $IOCT,0   SKIP NEXT IF I/O COMPLETE   N0105800
                          MDX     RA460     BRANCH TO TEST I/O COMPLETE N0105810
                          LD      RA942     FETCH DISPLAY WORD          N0105820
                          BSI  L  $PRET     BRANCH TO WAIT              N0105830
                          BSC  L  RA220     BRANCH TO READ NEXT RECORD  N0105840
                    *                                                   N0105850
                    *     RESET PRINCIPAL INPUT DEVICE                  N0105860
                    *                                                   N0105870
                    RA480 LDD   1 2         STORE WORD CNT/SCTR ADDR    N0105880
                          STD  L  PINPT+2   *OF PRINCIPAL INPUT SUBR    N0105890
                          LDD   1 -10       STORE WORD CNT/SCTR ADDR    N0105900
                          STD  L  CNVRT+2   *OF PRINC CONVERSION SUBR   N0105910
                          BSC  L  RA070     BR TO FETCH PRINC INPUT     N0105920
                    *                                                   N0105930
                    *     CONSTANTS AND WORK AREAS                      N0105940
                    *                                                   N0105950
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   N0105960
                    RA940 DC      /0001     WRITE FUNCTION CODE         N0105970
                          DC      RA000-2   SUPV PHASE 1 I/O AREA ADDR  N0105980
                    RA942 DC      /FFFF     'PAUSE' DISPLAY/NEGATIVE NO N0105990
                    *                                                   N0106000
                    *     PROCESS XEQ CONTROL RECORD                    N0106010
                    *                                                   N0106020
                    RA500 LD   L  $NXEQ     TEST NON-EXECUTE SWITCH     N0106030
                          BSC  L  RA600,+-  *AND BRANCH IF OFF          N0106040
                          LDX   3 2         POINT TO ERROR MESSAGE M 12 N0106050
                          BSI     RA900     BRANCH TO PRINT THE MESSAGE N0106060
                    *                                                   N0106070
                    *     PROCESS DUP CONTROL RECORD                    N0106080
                    *                                                   N0106090
                    RA520 LD   L  $NDUP     TEST NON-DUP SWITCH         N0106100
                          BSC  L  RA600,+-  *AND BRANCH IF OFF          N0106110
                          LDX   3 3         POINT TO ERROR MESSAGE M 13 N0106120
                          BSI     RA900     BRANCH TO PRINT THE MESSAGE N0106130
                    *                                                   N0106140
                    *     PROCESS ASM, FOR, RPG, AND COB CTRL RCDS  2-9 N0106150
                    *                                                   N0106160
                    RA560 SRA     16        SET                     2-3 N0106170
                          STO  L  $NDUP     *NON-DUP SWITCH OFF     2-3 N0106180
                    *                                                   N0106190
                    *     FETCH AND TRANSFER TO A NEW PHASE             N0106200
                    *                                                   N0106210
                    RA600 LDD   1 2         FETCH WORD CNT/SCTR ADDRESS N0106220
                          BSC  L  RA700,+   BRANCH IF WORD COUNT ZERO   N0106230
                          STD     RA660     STORE WORD CNT/SCTR ADDRESS N0106240
                          LD    1 1         FETCH AND                   N0106250
                          STO     RA680     *STORE I/O AREA ADDRESS     N0106260
                          LDX  I1 RA680     XR1 = I/O AREA ADDRESS      N0106270
                    *                                                   N0106280
                    *     MOVE 'FETCH' AND 'TRANSFER' INSTRUCTIONS      N0106290
                    *     TO $HASH                                      N0106300
                    *                                                   N0106310
                          LDX   2 -@INST       XR2 = WORD COUNT         N0106320
                    RA640 LD   L2 RA660+@INST  FETCH AND STORE          N0106330
                          STO  L2 $HASH+@INST  *A WORD TO $HASH AREA    N0106340
                          MDX   2 1         INCR WORD CNT, SKIP IF ZERO N0106350
                          MDX     RA640     BRANCH TO FETCH NEXT WORD   N0106360
                          BSC  L  $HASH+3   BRANCH TO FETCH NEW PHASE   N0106370
                    *                                                   N0106380
                    *     THE FOLLOWING BLOCK IS MOVED TO THE $HASH     N0106390
                    *     AREA TO FETCH AND TRANSFER TO A NEW PHASE     N0106400
                    *                                                   N0106410
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   N0106420
                    RA660 DC      *-*       PHASE WORD COUNT            N0106430
                          DC      *-*       PHASE SECTOR ADDRESS        N0106440
                    RA680 DC      *-*       PHASE I/O AREA ADDRESS      N0106450
                          LDD     RA660     FETCH WD CNT AND SCTR ADDR  N0106460
                          STD   1 0         *AND STORE TO I/O AREA      N0106470
                          LD      RA680     FETCH ADDRESS OF I/O AREA   N0106480
                          SRT     16        SHIFT TO EXT, ACC = 0       N0106490
                          BSI  L  DZ000     BRANCH TO READ A PHASE      N0106500
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  N0106510
                          MDX     *-3       BR TO TEST READ COMPLETE    N0106520
                          BSC  L1 2         BRANCH TO THE NEXT PHASE    N0106530
                    *                                                   N0106540
                    *     REQUESTED PROGRAM IS NOT AVAILABLE            N0106550
                    *                                                   N0106560
                    RA700 LD      RA980     SET                         N0106570
                          STO  L  $NDUP     *NON-DUP SWITCH AND         N0106580
                          STO  L  $NXEQ     *NON-EXECUTE SWITCH ON      N0106590
                          LDX   3 6         POINT TO ERROR MESSAGE M 16 N0106600
                          BSI     RA900     BRANCH TO PRINT THE MESSAGE N0106610
                    *                                                   N0106620
                    *     FETCH CORE IMAGE LOADER VIA CALL $LINK        N0106630
                    *                                                   N0106631
                    RA740 LD      RA942     SET FLAG -1 TO TELL CIL 2-9 N0106633
                          STO  L  $HASH+7   *$LNXQ SHOULD BE SET +1 2-9 N0106635
                          MDX     RA745     BR OVER POSSIBLE BSS WD 2-9 N0106638
                          BSS  E  0         FORCE NEXT LOC EVEN     2-9 N0106640
                    RA745 BSI  L  $LINK     BRANCH TO $LINK         2-9 N0106650
                    NAMEP BSS     2         MAINLINE NAME               N0106670
                    *                                                   N0106680
                    *     FETCH CORE LOAD BUILDER                       N0106690
                    *                                                   N0106700
                    RA760 LDX  L1 CLBP1     XR1 PTS TO CLB PH 1 SLET    N0106710
                          MDX     RA600     BRANCH TO FETCH CLB PH 1    N0106720
                    *                                                   N0106730
                    *     CONSTANTS AND WORK AREAS                      N0106740
                    *                                                   N0106750
                    @INST EQU     RA700-RA660  WORD COUNT               N0106760
                    NORCD DC      *-*       NO. OF SUPV CONTROL RECORDS N0106770
                    NINDR DC      *-*       MAINLINE NAME INDICATOR     N0106780
                    JOBXQ DC      *-*       ZERO=EQUAT RCDS ONLY    2-4 N0106790
                    *                                                   N0106800
                    *************************************************** N0106810
                    *                                                   N0106820
                    *     READ A RECORD AND CONVERT TO EBCDIC           N0106830
                    *                                                   N0106840
                    RA800 DC      0         ENTRY/RETURN ADDRESS        N0106850
                    RA810 LD      RA985     SET BUFFER WORD COUNT AT212 N0106920
                          STO  I  SBADR     *BEGINNING OF SUPV BUFFER   N0106930
                          LDD     RA980     FETCH FUNC CODE/I/O AREA    N0106940
                          BSI  L  INPUT     BRANCH TO READ A RECORD     N0106950
                    RA840 MDX  L  $IBSY,0   SKIP NEXT IF READ COMPLETE  N0106960
                          MDX     RA840     BR TO TEST READ COMPLETE    N0106970
                          LD   L  $KCSW     KEYBOARD UTILIZED?      212 N0106975
                          BSC  L  RA845,Z   BRANCH IF YES           212 N0106980
                          LD   L  @SBFR     READ 1ST COL IN RD BUF  212 N0106981
                          S       RA986     SUB REP OF SLASH        212 N0106982
                          BSC     Z         SKIP IF IT IS A SLASH   212 N0106983
                          MDX     RA810     ELSE, LOOP              212 N0106984
                          LD   L  @SBFR+1   CHECK SECOND COLUMN FOR 212 N0106985
                          S       RA986     *A SLASH                212 N0106986
                          BSC     Z         SKIP IF SLASH           212 N0106987
                          MDX     RA810     ELSE LOOP               212 N0106988
                    RA845 LD      SBADR     BR TO CONVERSION SUBR       N0106990
                          BSI  I  CONVT     *TO CONVERT RCD TO EBCDIC   N0107000
                    *                                                   N0107010
                          LD   L  $CTSW     TEST FOR AND RETURN IF RCD  N0107020
                          BSC  I  RA800,Z   *JUST READ A MON CTRL RCD   N0107030
                          MDX     RA810     BRANCH TO READ NEXT RECORD  N0107040
                    *                                                   N0107050
                    *     CONSTANTS AND WORK AREAS                      N0107060
                    *                                                   N0107070
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   N0107080
                    RA980 DC      /7002     READ/SPACE A LINE FUNC CODE N0107090
                    SBADR DC      @SBFR-1   ADDR OF SUPV BFR I/O AREA   N0107100
                    RA982 DC      /7001     PRINT FUNCTION CODE         N0107110
                    RA983 DC      *-*       I/O AREA ADDRESS            N0107120
                    CONVT DC      *-*       CONVERSION SUBR ENTRY ADDR  N0107130
                    RA985 DC      @CCOL     SUPV BUFFER WORD COUNT      N0107140
                    RA986 DC      /3000     REPRESENTATION OF SLASH 212 N0107145
                    *                                                   N0107150
                    *************************************************** N0107160
                    *                                                   N0107170
                    *     PRINT A MONITOR CONTROL RECORD OR MESSAGE     N0107180
                    *                                                   N0107190
                    RA850 DC      0         ENTRY/RETURN ADDRESS        N0107200
                          STO     RA983     STORE I/O AREA ADDRESS      N0107210
                          LD   L  PCPAD+3   TEST IF CP IS PRINC PR  2-8 N0107220
                          S    L  PRINT+3                           2-8 N0107230
                          BSC  L  RA855,+-  BRANCH IF CP PRINC PR   2-8 N0107240
                          LD   I  $CH12     FETCH CHANNEL 12 INDICATOR  N0107250
                          BSI  L  RSTOR,Z   BR TO RESTORE PAGE IF NON-Z N0107260
                    RA855 LD      RA980     FETCH SPACE FUNCTION CODE   N0107270
                          BSI  L  OUTPT     BRANCH TO SPACE A LINE      N0107280
                          LDD     RA982     FETCH FUNC CODE/I/O AR ADDR N0107290
                          BSI  L  OUTPT     BRANCH TO PRINT A LINE      N0107300
                    RA860 MDX  L  $PBSY,0   SKIP NEXT IF PRINT COMPLETE N0107310
                          MDX     RA860     BR TO TEST PRINT COMPLETE   N0107320
                          BSC  I  RA850     RETURN                      N0107330
                    *                                                   N0107340
                    *************************************************** N0107350
                    *                                                   N0107360
                    *     PRINT THE ERROR MESSAGES                      N0107370
                    *                                                   N0107380
                    RA900 DC      0         ENTRY/RETURN ADDRESS        N0107390
                          LD   L3 RA990-1   FETCH ADDR OF ERROR MESSAGE N0107400
                          BSI     RA850     BRANCH TO PRINT THE MESSAGE N0107410
                          BSC  L  RA220     BRANCH TO READ NEXT RECORD  N0107420
                    *                                                   N0107430
                    *     ERROR MESSAGES                                N0107440
                    *                                                   N0107450
                    RA990 DC      RA991     ADDRESS OF MESSAGE M 11     N0107460
                          DC      RA992     ADDRESS OF MESSAGE M 12     N0107470
                          DC      RA993     ADDRESS OF MESSAGE M 13     N0107480
                          DC      RA994     ADDRESS OF MESSAGE M 14     N0107490
                          DC      RA995     ADDRESS OF MESSAGE M 15     N0107500
                          DC      RA996     ADDRESS OF MESSAGE M 16     N0107510
                    *                                                   N0107520
                    RA991 DC      RA992-*   WORD COUNT OF MESSAGE M 11  N0107530
                          EBC     .M 11 INVALID MONITOR CONTROL RECORD. N0107540
                    RA992 DC      RA993-*   WORD COUNT OF MESSAGE M 12  N0107550
                          EBC     .M 12 EXECUTION SUPPRESSED.           N0107560
                    RA993 DC      RA994-*   WORD COUNT OF MESSAGE M 13  N0107570
                          EBC     .M 13 DUP SUPPRESSED.                 N0107580
                    RA994 DC      RA995-*   WORD COUNT OF MESSAGE M 14  N0107590
                          EBC     .M 14 SYSTEM PROGRAM DETECTED MONIT.  N0107600
                          EBC     .OR CONTROL RECORD.                   N0107610
                    RA995 DC      RA996-*   WORD COUNT OF MESSAGE M 15  N0107620
                          EBC     .M 15 ILLEGAL CARTRIDGE ID.           N0107630
                    RA996 DC      RA997-*   WORD COUNT OF MESSAGE M 16  N0107640
                          EBC     .M 16 PROGRAM VOIDED.                 N0107650
                    RA997 BSS     0                                     N0107660
                    *                                                   N0107670
                    *************************************************** N0107680
                    *                                                   N0107690
                    *     RESTORE THE PAGE AND PRINT THE HEADING        N0107700
                    *                                                   N0107710
                    RSTOR DC      0         ENTRY/RETURN ADDRESS        N0107720
                          LD      RS903     FETCH HEADING SCTR ADDRESS  N0107730
                          STO     RS905     *AND STORE TO HEADING BFR   N0107740
                          LD      RS902     FETCH ADDR OF HEADING BFR   N0107750
                          SRT     16        SHIFT TO EXT, ACC = 0       N0107760
                          BSI  L  DZ000     BRANCH TO READ HEADING SCTR N0107770
                    RS100 MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  N0107780
                          MDX     RS100     BR TO TEST READ COMPLETE    N0107790
                    *                                                   N0107800
                          LD      RS904     FETCH HEADING WORD COUNT    N0107810
                          STO     RS905     *AND STORE TO PRINT BUFFER  N0107820
                          LDD     RS900     FETCH FUNC CODE/I/O AR ADDR N0107830
                          BSI  L  OUTPT     BRANCH TO RESTORE PAGE      N0107840
                          BSI  L  OUTPT     BRANCH TO PRINT HEADING     N0107850
                          BSC  I  RSTOR     RETURN                      N0107860
                    *                                                   N0107870
                    *     CONSTANTS AND WORK AREAS                      N0107880
                    *                                                   N0107890
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   N0107900
                    RS900 DC      /7000     RESTORE PAGE FUNCTION CODE  N0107910
                    RS901 DC      RS905     ADDR OF HEADING PRINT BFR   N0107920
                    RS902 DC      RS904     ADDR OF HEADING DISK BUFFER N0107930
                    RS903 DC      #HDNG     HEADING SECTOR ADDRESS      N0107940
                    RS904 DC      @HDWC     HEADING DISK BUFFER WD CNT  N0107950
                    RS905 DC      *-*       SECTOR ADDRESS/WORD COUNT   N0107960
                    RS906 BSS     @HDWC     HEADING BUFFER              N0107970
                    *                                                   N0107980
                    RS908 DC      /0000     READ FUNCTION CODE          N0107990
                          DC      DCOM-2    ADDRESS OF DCOM I/O AREA    N0108000
                    RS910 DC      /0001     WRITE FUNCTION CODE         N0108010
                          DC      DCOM-2    ADDRESS OF DCOM I/O AREA    N0108020
                    RS912 DC      @SCTR     WORD COUNT OF DCOM I/O AREA N0108030
                          DC      #DCOM     SECTOR ADDRESS OF DCOM      N0108040
                    *                                                   N0108050
                    *************************************************** N0108060
                    *                                                   N0108070
                    *     READ DCOM FROM DISK                           N0108080
                    *                                                   N0108090
                    RDCOM DC      0         ENTRY/RETURN ADDRESS        N0108100
                          LD      RDCOM     FETCH AND                   N0108110
                          STO     WDCOM     *STORE RETURN ADDRESS       N0108120
                          LDD     RS912     FETCH AND                   N0108130
                          STD  L  DCOM-2    *STORE DCOM WORD COUNT      N0108140
                          LDD     RS908     FETCH FUNC CODE/I/O AR ADDR N0108150
                          MDX     WD010     BRANCH TO READ DCOM         N0108160
                    *                                                   N0108170
                    *************************************************** N0108180
                    *                                                   N0108190
                    *     WRITE UPDATED DCOM TO DISK                    N0108200
                    *                                                   N0108210
                    WDCOM DC      0         ENTRY/RETURN ADDRESS        N0108220
                          LDD     RS910     FETCH FUNC CODE/I/O AR ADDR N0108230
                    WD010 BSI  L  DZ000     BRANCH TO READ OR WRITE     N0108240
                    WD020 MDX  L  $DBSY,0   SKIP NEXT IF OP COMPLETE    N0108250
                          MDX     WD020     BRANCH TO TEST OP COMPLETE  N0108260
                          BSC  I  WDCOM     RETURN                      N0108270
                          HDNG    LABCK   SUBR TO CONVERT TO NAME CODE  N0108280
                    *     CONVERT NAME FROM UNPACKED FORM (1 CHARACTER/ N0108290
                    *     WORD TO COMPRESSED FORM (5 6-BIT CHARACTERS   N0108300
                    *     TO 30 RIGHT JUSTIFIED BITS IN TWO WORDS.)  IF N0108310
                    *     IS INVALID, PSEUDO-SKIP AND RETURN ZEROS      N0108320
                    *     EQUIVALENT TO 5 BLANKS) IN ACCUMULATOR AND    N0108330
                    *     EXTENTION.                                    N0108340
                    *                                                   N0108350
                    LABCK DC      0         ENTRY/RETURN ADDRESS        N0108360
                          LD    2 0                                     N0108370
                          S       LAB06     FIRST CHARACTER MUST NOT    N0108380
                          BSC  L  LAB04,-   *BE NUMERIC                 N0108390
                          STX   1 LAB09+1   SAVE XR1                    N0108400
                          STX   3 LAB09+3   SAVE XR3                    N0108410
                          LDX   3 -5                                    N0108420
                          LD    2 0                                     N0108430
                          S       LAB06+1                               N0108440
                          BSC  L  LAB12,+-  BRANCH IF FIRST CHAR. BLANK N0108450
                    LAB01 LDX  L1 LAB05                                 N0108460
                          LD    2 0         CHECK EACH CHARACTER FOR    N0108470
                          S       LAB06+1   *BLANK                      N0108480
                          BSC  L  LAB10,+-                              N0108490
                    LAB02 S     1 0         *AND VALID 8-BIT CHARACTER  N0108500
                          BSC  L  LAB04,Z+                              N0108510
                          S     1 1                                     N0108520
                          BSC  L  LAB03,+                               N0108530
                          MDX   1 2                                     N0108540
                          MDX     LAB02                                 N0108550
                    LAB03 MDX   2 1         INCREMENT POINTER           N0108560
                          MDX   3 1         COUNT AND TEST CHARACTERS   N0108570
                          MDX     LAB01     GO TEST NEXT CHARACTER      N0108580
                          MDX     LAB07                                 N0108590
                    LAB04 LDX  I1 LAB09+1   LABEL ERROR                 N0108600
                          SLT     32        RETURN BLANKS               N0108610
                          MDX  L  LABCK,1   PSEUDO-SKIP                 N0108620
                          MDX     LAB09                                 N0108630
                    *                                                   N0108640
                    LAB05 DC      .$-.      TABLE OF VALID CHARACTERS   N0108650
                          DC      .$-.$     (INCLUSIVE LIMITS)          N0108660
                    *     DC      .@-.$     A-I,J-R,S-Z,0-9,$,#,@       N0108670
                    * changed these lines to match microfiche           knittel 
                    * as it was it did not work                         knittel 
                          DC      .#-.$     A-I,J-R,S-Z,0-9,$,#,@       knittel 
                    *     DC      /0001     .@-.# APOSTR IS AT SIGN 2-8 N0108680
                          DC      /0001     .'-.# APOSTR IS AT SIGN 2-8 knittel 
                    *     DC      /0045     .A-.@ APOSTR IS AT SIGN 2-8 N0108690
                          DC      /0045     .A-.' APOSTR IS AT SIGN 2-8 knittel 
                          DC      .I-.A                                 N0108700
                          DC      .J-.I                                 N0108710
                          DC      .R-.J                                 N0108720
                          DC      .S-.R                                 N0108730
                          DC      .Z-.S                                 N0108740
                          DC      .0-.Z                                 N0108750
                          DC      .9-.0                                 N0108760
                          DC      /3FFF-.9  (FORCE END CHECK LOOP)      N0108770
                    LAB06 DC      .0                                    N0108780
                          DC      /0040                                 N0108790
                          DC      /003F                                 N0108800
                    *                                                   N0108810
                    LAB07 MDX   2 -5        LABEL IS VALID              N0108820
                          LDX   3 -5        COLLECT IT                  N0108830
                          SLT     32                                    N0108840
                    LAB08 STD     LAB13                                 N0108850
                          LD    2 0                                     N0108860
                          AND     LAB06+2                               N0108870
                          SLA     10                                    N0108880
                          OR      LAB13                                 N0108890
                          RTE     32-6                                  N0108900
                          MDX   2 1                                     N0108910
                          MDX   3 1                                     N0108920
                          MDX     LAB08                                 N0108930
                          MDX   2 -5                                    N0108940
                    LAB09 LDX  L1 *-*       RESTORE XR1                 N0108950
                          LDX  L3 *-*       RESTORE XR3                 N0108960
                          BSC  I  LABCK     EXIT                        N0108970
                    LAB10 LD    2 0         CHECK LABEL FOR EMBEDDED    N0108980
                          S       LAB06+1   *BLANKS                     N0108990
                          BSC  L  LAB04,Z                               N0109000
                          MDX   2 1                                     N0109010
                          MDX   3 1                                     N0109020
                          MDX     LAB10                                 N0109030
                          MDX     LAB07                                 N0109040
                    *                                                   N0109050
                    LAB11 LD    2 0                                     N0109060
                          S       LAB06+1                               N0109070
                          BSC  L  LAB04,Z   BRANCH IF CHAR. NOT BLANK   N0109080
                    LAB12 MDX   2 1                                     N0109090
                          MDX   3 1                                     N0109100
                          MDX     LAB11                                 N0109110
                          SLT     32        SET NAME CODE TO ZERO       N0109120
                          MDX     LAB09                                 N0109130
                    *                                                   N0109140
                    LAB13 BSS  E  2                                     N0109150
                    *                                                   N0109160
                    *                                                   N0109170
                          BSS     @PROC-LAB13-5  PATCH AREA             N0109180
                    *                                                   N0109190
                    *                                                   N0109200
                    RA999 DC      0         END OF PHASE 1 - MCRA       N0109210
                          HDNG    SUPV PHASE 2 - JOB PROCESSING         N0109220
                    *************************************************** N0109230
                    *STATUS - VERSION 2, MODIFICATION 10              * N0109240
                    *                                                 * N0109250
                    *FUNCTION/OPERATION -                             * N0109260
                    *   * RESTORE THE PAGE AND PRINT THE JOB RECORD.  * N0109270
                    *   * CONVERT THE CARTRIDGE IDS TO BINARY AND     * N0109280
                    *     CALL SYSUP TO UPDATE TABLES IN SYSTEM DCOM. * N0109290
                    *   * INITIALIZE THE HEADING SECTOR -             * N0109300
                    *       * WORDS 0-3 CONTAIN 'PAGE   1'            * N0109310
                    *       * WORDS 6-9 CONTAIN COLUMNS 51-58 OF THE  * N0109320
                    *         JOB RECORD                              * N0109330
                    *       * WORDS 10-319 CONTAIN BLANKS.            * N0109340
                    *   * INITIALIZE COMMA.                           * N0109350
                    *   * INITIALIZE DCOM.                            * N0109360
                    *   * PRINT THE SYSTEM VERSION AND MODIFICATION   * N0109370
                    *     LEVEL AND THE ACTUAL AND CONFIGURED CORE    * N0109380
                    *     SIZES.                                      * N0109390
                    *                                                 * N0109400
                    *ENTRY POINTS -                                   * N0109410
                    *     PROGRAM START - JB000                       * N0109420
                    *                                                 * N0109430
                    *INPUT - N/A                                      * N0109440
                    *                                                 * N0109450
                    *OUTPUT -                                         * N0109460
                    *   * THE JOB CONTROL RECORD IS PRINTED.          * N0109470
                    *   * THE SYSTEM VERSION AND MODIFICATION LEVEL   * N0109480
                    *     ARE PRINTED.                                * N0109490
                    *   * THE ACTUAL AND CONFIGURED CORE SIZES ARE    * N0109500
                    *     PRINTED.                                    * N0109510
                    *                                                 * N0109520
                    *EXTERNAL REFERENCES -                            * N0109530
                    *   * IN COMMA -                                  * N0109540
                    *     $CIBA                                       * N0109550
                    *     $COMN                                       * N0109560
                    *     $CORE                                       * N0109570
                    *     $CTSW                                       * N0109580
                    *     $DADR                                       * N0109590
                    *     $DUMP                                       * N0109600
                    *     $FLSH                                       * N0109610
                    *     $I420                                       * N0109620
                    *     $IBSY                                       * N0109630
                    *     $IOCT                                       * N0109640
                    *     $IREQ                                       * N0109650
                    *     $LEV5                                       * N0109660
                    *     $LINK                                       * N0109670
                    *     $NDUP                                       * N0109680
                    *     $NXEQ                                       * N0109690
                    *     $PBSY                                       * N0109700
                    *     $PGCT                                       * N0109710
                    *     $PHSE                                       * N0109720
                    *     $PRET                                       * N0109730
                    *     $PST1                                       * N0109740
                    *     $PST2                                       * N0109750
                    *     $PST3                                       * N0109760
                    *     $PST4                                       * N0109770
                    *     $SNLT                                       * N0109780
                    *     $STOP                                       * N0109790
                    *     $SYSC                                       * N0109800
                    *     $UFDR                                       * N0109810
                    *     $UFIO                                       * N0109820
                    *     $WRD1                                       * N0109830
                    *     $WSDR                                       * N0109840
                    *   * IN DCOM -                                   * N0109850
                    *     #CBSW                                       * N0109860
                    *     #CIBA                                       * N0109870
                    *     #CIDN                                       * N0109880
                    *     #DBCT                                       * N0109890
                    *     #DCSW                                       * N0109900
                    *     #ECNT                                    2-4* N0109910
                    *     #ENTY                                       * N0109920
                    *     #FCNT                                       * N0109930
                    *     #FHOL                                       * N0109940
                    *     #FMAT                                       * N0109950
                    *     #FRDR                                       * N0109960
                    *     #FSZE                                       * N0109970
                    *     #GCNT                                       * N0109980
                    *     #JBSW                                       * N0109990
                    *     #LCNT                                       * N0110000
                    *     #MDF1                                       * N0110010
                    *     #MDF2                                       * N0110020
                    *     #MPSW                                       * N0110030
                    *     #NAME                                       * N0110040
                    *     #NCNT                                       * N0110050
                    *     #TODR                                       * N0110060
                    *     #UHOL                                       * N0110070
                    *     #USZE                                       * N0110080
                    *     #WSCT                                       * N0110090
                    *   * IN MCRA -                                   * N0110100
                    *     NORCD                                    2-4* N0110110
                    *     PIDEV                                       * N0110120
                    *     PINPT                                       * N0110130
                    *     RA600                                       * N0110140
                    *     RA850                                       * N0110150
                    *     RA900                                       * N0110160
                    *     RSTOR                                       * N0110170
                    *     SBADR                                       * N0110180
                    *     SUPV3                                       * N0110190
                    *   * SUBROUTINES -                               * N0110200
                    *     DZ000   RESIDENT DISK I/O SUBROUTINE.       * N0110210
                    *                                                 * N0110220
                    *EXITS -                                          * N0110230
                    *   * NORMAL -                                    * N0110240
                    *     AN EXIT IS MADE TO SUPERVISOR PHASE 3 TO    * N0110250
                    *     DELETE TEMPORARY LET ENTRIES.               * N0110260
                    *   * ERROR -                                     * N0110270
                    *     AN EXIT IS MADE TO THE MCRA (PHASE 1) TO    * N0110280
                    *     PRINT THE ERROR MESSAGE AND ABORT THE JOB.  * N0110290
                    *                                                 * N0110300
                    *TABLES/WORK AREAS -                              * N0110310
                    *   * @SBFR   AN 80 WORD BUFFER WHICH CONTAINS THE* N0110320
                    *             JOB MONITOR CONTROL RECORD.         * N0110330
                    *   * DCOM    A 320 WORD BUFFER USED FOR DISK     * N0110340
                    *             COMMUNICATIONS AREA (DCOM) I/O.     * N0110350
                    *   * BUFFR   A 320 WORD BUFFER USED FOR HEADING  * N0110360
                    *             SECTOR INITIALIZATION AND RESIDENT  * N0110370
                    *             IMAGE SECTOR INPUT.                 * N0110380
                    *                                                 * N0110390
                    *ATTRIBUTES -                                     * N0110400
                    *   * ABSOLUTE.                                   * N0110410
                    *   * REUSABLE.                                   * N0110420
                    *                                                 * N0110430
                    *NOTES - N/A                                      * N0110440
                    *                                                 * N0110450
                    *************************************************** N0110460
                          HDNG    SUPV PHASE 2 - JOB PROCESSING         N0110470
                          ORG     @PROC-2   PHASE 2 I/O AREA ADDRESS    N0110480
                    *                                                   N0110490
*SBRKMET 6F          *SUP PHASE 2 - JOB PROCESSING                V2M04 N0110500
                          DC      JB999-*   WORD COUNT                  N0110510
                          DC      @JOBP     PHASE ID                    N0110520
                          HDNG    SUPV PHASE 2 - JOB PROCESSING         N0110530
                    JB000 LDX   1 @JOBP     SET                         N0110540
                          STX  L1 $PHSE     *SUPERVISOR PHASE 2 INDR    N0110550
                          NOP               A WAIT MAY BE PATCHED HERE  N0110560
                    *                                                   N0110570
                    *     SET TEMPORARY MODE SWITCH                     N0110580
                    *                                                   N0110590
                          LD   L  @SBFR+3   FETCH COLUMNS 7-8           N0110600
                          S       JB900     TEST FOR AND                N0110610
                          BSC  L  JB040,+-  *BRANCH IF 'T' IN COLUMN 8  N0110620
                          SRA     16        CLEAR ACCUMULATOR           N0110630
                          MDX     JB060     SKIP NEXT INSTRUCTION       N0110640
                    JB040 LD      JB900     FETCH NON-ZERO              N0110650
                    JB060 STO     JB901     SAVE THE JOB SWITCH         N0110660
                    *                                                   N0110670
                    *     FETCH AND CONVERT HEXADECIMAL CARTRIDGE IDS   N0110680
                    *                                                   N0110690
                    JB100 LDX   1 -8        CARTRIDGE ID COUNT TO XR1   N0110700
                          LDX   2 4         WD CNT OF FIRST ID-1 TO XR2 N0110710
                    *                                                   N0110720
                    JB110 LDX   3 -4        CHARACTER COUNT TO XR3      N0110730
                    JB120 MDX   2 1         INCREMENT WORD COUNT        N0110740
                          LD   L2 @SBFR     FETCH TWO CHARACTERS OF ID  N0110750
                          SRT     16        SHIFT CHARACTERS TO EXT     N0110760
                          SRA     16        CLEAR ACCUMULATOR           N0110770
                          SLT     8         FETCH LEFT HALF OF WORD     N0110780
                          STO  L3 JB922+4   STORE TO CONVERSION SUBR    N0110790
                          MDX   3 1         INCR CHAR CNT, SKIP IF ZERO N0110800
                          MDX     JB130     BR TO FETCH RIGHT HALF      N0110810
                    *                                                   N0110820
                          BSI     JB200     BR TO CONVERSION SUBR       N0110830
                          STO  L1 JB902+8   STORE BINARY CARTRIDGE ID   N0110840
                          MDX   1 1         INCREMENT CARTRIDGE ID CNT  N0110850
                          MDX     JB110     BRANCH TO FETCH NEXT ID     N0110860
                          MDX     JB140                                 N0110870
                    *                                                   N0110880
                    JB130 SRA     16        CLEAR ACCUMULATOR           N0110890
                          SLT     8         FETCH RIGHT HALF OF WORD    N0110900
                          STO  L3 JB922+4   STORE TO CONVERSION SUBR    N0110910
                          MDX   3 1         INCR CHAR CNT, SKIP IF ZERO N0110920
                          MDX     JB120     BR TO FETCH NEXT TWO CHAR   N0110930
                    *                                                   N0110940
                          BSI     JB200     BR TO CONVERSION SUBR       N0110950
                          STO  L1 JB902+8   STORE BINARY CARTRIDGE ID   N0110960
                          MDX   2 1         INCREMENT WORD COUNT        N0110970
                          LD   L2 @SBFR     FETCH A CHARACTER           N0110980
                          SRT     8         SHIFT TO EXTENTION          N0110990
                          LDX   3 -4        CHARACTER COUNT TO XR3      N0111000
                          MDX   1 1         INCR CART CNT, SKIP IF ZERO N0111010
                          MDX     JB130     BR TO STORE CHARACTER       N0111020
                    *                                                   N0111030
                    JB140 BSI  L  SYSUP     BRANCH TO UPDATE DCOM       N0111040
                          DC      JB902     ADDR OF CARTRIDGE ID TABLE  N0111050
                    *                                                   N0111060
                    *     DEFINE SECTOR ADDRESS OF CIB, DRIVE CODE OF   N0111070
                    *     WORKING STORAGE AND DRIVE CODE OF UNFORMATTED N0111080
                    *     I/O                                           N0111090
                    *                                                   N0111100
                          LDX  L1 CIBID     ADDRESS OF FIRST ID TO XR1  N0111110
                          LDX   3 -3        CARTRIDGE ID COUNT TO XR3   N0111120
                    *                                                   N0111130
                    JB150 LDX   2 -5        ID LIST COUNT TO XR2        N0111140
                          LD    1 0         FETCH A CARTRIDGE ID        N0111150
                          BSC  L  JB180,+-  BRANCH IF BLANK             N0111160
                    JB160 LD   L2 #CIDN+5   FETCH CART ID FROM ID LIST  N0111170
                          BSC  L  JB170,+-  BRANCH IF BLANK             N0111180
                          S     1 0         SUBTRACT THE CARTRIDGE ID   N0111190
                          BSC  L  JB180,+-  BRANCH IF THE IDS ARE EQUAL N0111200
                          MDX   2 1         INCR ID LIST CNT, SKIP IF Z N0111210
                          MDX     JB160     BR TO TEST NEXT IN ID LIST  N0111220
                    *                                                   N0111230
                    JB170 LDX   2 -5        RESET XR2                   N0111240
                    *                                                   N0111250
                    JB180 MDX   2 5         SET XR2 POSITIVE            N0111260
                          NOP                                           N0111270
                          STX   2 JB905     *AND SAVE AS                N0111280
                          LD      JB905     *THE DRIVE CODE             N0111290
                          STO  L3 JB904+3                               N0111300
                    *                                                   N0111310
                          MDX   1 1         INCR CARTRIDGE ID ADDRESS   N0111320
                          MDX   3 1         INCR ID COUNT, SKIP IF ZERO N0111330
                          MDX     JB150     BRANCH TO FIND NEXT ID      N0111340
                    *                                                   N0111350
                          LDX  I1 JB904     DRIVE CODE TO XR1           N0111360
                          LD   L1 #CIBA     FETCH SECTOR ADDRESS OF     N0111370
                          SLA     4         CHECK IF CIB DLETED     2-6 N0111380
                          BSC  L  JB185,+-  BR IF YES               2-6 N0111390
                          LD   L1 #CIBA                             2-6 N0111400
                          MDX     JB186                             2-6 N0111410
                    JB185 LD   L  #CIBA     USE MASTER CIB IF       2-6 N0111420
                    *                       SPECIFIED CIB DELETED   2-6 N0111430
                    JB186 STO  L  $CIBA     *CIB AND STORE TO COMMA     N0111440
                          LD      JB906     STORE WORD COUNT OF     2-4 N0111450
                          STO  L  $CIBA-1   *THE CIB TO COMMA       2-4 N0111460
                          LD      JB904+1   FETCH DRIVE CODE OF WORKING N0111470
                          STO  L  $WSDR     *STORAGE AND STORE TO COMMA N0111480
                          LD      JB904+2   FETCH UNFORMATTED I/O DRIVE N0111490
                          STO  L  $UFDR     *CODE AND STORE TO COMMA    N0111500
                          MDX     JB600     CONTINUE                    N0111510
                    *                                                   N0111520
                    *     CONSTANTS AND WORK AREAS                      N0111530
                    *                                                   N0111540
                    JB900 EBC     . T.      EBCDIC BLANK - T            N0111550
                    JB901 DC      *-*       NEW JOB SWITCH              N0111560
                    JB902 BSS     5         CARTRIDGE IDS (ID LIST)     N0111570
                    CIBID DC      *-*       CARTRIDGE ID OF CIB         N0111580
                    WSCID DC      *-*       CARTRIDGE ID OF WS          N0111590
                    UNFIO DC      *-*       CARTRIDGE ID OF UNFMTED I/O N0111600
                    JB904 DC      *-*       DRIVE CODE OF CIB           N0111610
                          DC      *-*       DRIVE CODE OF WS            N0111620
                          DC      *-*       DRIVE CODE OF UNFMTED I/O   N0111630
                    JB905 DC      *-*       TEMPORARY STORAGE           N0111640
                    JB906 DC      4095-$CIBA  WD COUNT OF CIB       2-4 N0111650
                    *                                                   N0111660
                    *************************************************** N0111670
                    *                                                   N0111680
                    *     CONVERT FOUR HEXADECIMAL CHARACTERS           N0111690
                    *     TO A BINARY NUMBER                            N0111700
                    *                                                   N0111710
                    JB200 DC      0         ENTRY/RETURN ADDRESS        N0111720
                          SLT     32        CLEAR ACC AND EXT           N0111730
                          STD     JB920     SET TEMPORARY SUM ZERO      N0111740
                          LDX   3 -4        CHARACTER COUNT TO XR3      N0111750
                    JB220 LD   L3 JB922+4   FETCH A CHARACTER           N0111760
                          S       JB926     SUBTRACT EBCDIC BLANK       N0111770
                          BSC  L  JB240,+-  BRANCH IF BLANK             N0111780
                          A       JB926     RESET                       N0111790
                          S       JB927     TEST FOR ALPHABETIC/NUMERIC N0111800
                          BSC  L  JB240,-   SKIP IF NUMERIC             N0111810
                          A       JB928     CONVERT ALPHA TO BINARY     N0111820
                          S       JB929     TEST FOR AND                N0111830
                          BSC  L  JB260,Z-  *BRANCH IF GREATER THAN F   N0111840
                          A       JB929     RESET                       N0111850
                    JB240 M    L3 JB924+4   MULTIPLY BY A POWER OF 16   N0111860
                          AD      JB920     ADD IN PREVIOUS SUM         N0111870
                          STD     JB920     SAVE NEW SUM                N0111880
                          MDX   3 1         INCR CHAR CNT, SKIP IF ZERO N0111890
                          MDX     JB220     BR TO FETCH NEXT CHARACTER  N0111900
                          SLT     16        SHIFT SUM TO ACCUMULATOR    N0111910
                          BSC  I  JB200,-   RETURN IF LEGAL             N0111920
                    *                                                   N0111930
                    JB260 LDX   3 5         POINT TO ERROR MESSAGE M 15 N0111940
                    JB280 STO  L  $FLSH     SET ABORT JOB INDR ON       N0111950
                          BSI  L  RA900     BRANCH TO PRINT THE MESSAGE N0111960
                    *                                                   N0111970
                    *     CONSTANTS AND WORK AREA                       N0111980
                    *                                                   N0111990
                          BSS  E  0                                     N0112000
                    JB920 DC      *-*       TEMPORARY STORAGE FOR A     N0112010
                          DC      *-*       *32 BIT BINARY NUMBER       N0112020
                    JB922 DC      *-*       FOUR                        N0112030
                          DC      *-*       *HEXADECIMAL                N0112040
                          DC      *-*       *CHARACTERS                 N0112050
                          DC      *-*       *OF CARTRIDGE ID            N0112060
                    JB924 DC      /1000     THIRD POWER OF 16           N0112070
                          DC      /0100     SECOND POWER OF 16          N0112080
                          DC      /0010     FIRST POWER OF 16           N0112090
                          DC      /0001     ZERO POWER OF 16            N0112100
                    JB926 DC      /0040     EBCDIC BLANK                N0112110
                    JB927 DC      /00F0     ALPHA/NUMERIC TEST MASK     N0112120
                    JB928 DC      /0039     ALPHA TO BINARY MASK        N0112130
                    JB929 DC      /000F     MAXIMUM ALLOWABLE CHARACTER N0112140
                    *                                                   N0112150
                    *     MASTER CARTRIDGE MAY HAVE CHANGED             N0112160
                    *     UPDATE HEADING BUFFER AGAIN                   N0112170
                    *                                                   N0112180
                    *                                                   N0112190
                    *     INITIALIZE COMMA                              N0112200
                    *                                                   N0112210
                    JB600 LDX   1 X1        XR1 PTS TO MIDDLE OF COMMA  N0112220
                          SLT     32        CLEAR ACC AND EXT           N0112230
                          STO   1 $COMN-X1  $COMN = 0                   N0112240
                          STO   1 $CTSW-X1  $CTSW = 0                   N0112250
                          STO   1 $DADR-X1  $DADR = 0                   N0112260
                          STO   1 $DUMP-X1  $DUMP = 0                   N0112270
                          STO   1 $FLSH-X1  $FLSH = 0                   N0112280
                          STO   1 $IBSY-X1  $IBSY = 0                   N0112290
                          STO   1 $IOCT-X1  $IOCT = 0                   N0112300
                          STO   1 $LINK-X1  $LINK = 0                   N0112310
                          STO   1 $NDUP-X1  $NDUP = 0                   N0112320
                          STO   1 $NXEQ-X1  $NXEQ = 0                   N0112330
                          STO   1 $PBSY-X1  $PBSY = 0                   N0112340
                          STO   1 $PRET-X1  $PRET = 0                   N0112350
                          STO   1 $PST1-X1  $PST1 = 0                   N0112360
                          STO   1 $PST2-X1  $PST2 = 0                   N0112370
                          STO   1 $PST3-X1  $PST3 = 0                   N0112380
                          STO   1 $PST4-X1  $PST4 = 0                   N0112390
                          STO   1 $STOP-X1  $STOP = 0                   N0112400
                          STO   1 $WRD1-X1  $WRD1 = 0                   N0112410
                          STO  L  $SNLT     $SNLT = 0                   N0112420
                          LD      JB962                                 N0112430
                          STO   1 $UFIO-X1  $UFIO = 1                   N0112440
                          LDD     JB960     RESET LEVEL 2 POST      2-2 N0112450
                          STD   1 $PST2+1-X1  *OPERATIVE ERROR TRAP 2-2 N0112460
                          STO   1 $PRET+1-X1  *AND PRE-OP ERROR TRAP2-4 N0112470
                          LD      JB960+1                          2-10 N0112472
                          STO   1 $PRET+2-X1                       2-10 N0112474
                          LD      JB960+2                          2-10 N0112476
                          STO   1 $PRET+3-X1                       2-10 N0112478
                          LD      JB963     RESET INTERRUPT         2-2 N0112480
                          STO   1 $IREQ-X1  *REQUEST KEY TRAP       2-2 N0112490
                          LD      JB964     RESET LEVEL 5 INTERRUPT 2-2 N0112500
                          STO   1 $LEV5-X1  *ADDR TO STOP KEY TRAP  2-2 N0112510
                    *                                                   N0112520
                          LD      JB965     STORE SECTOR ADDRESS        N0112530
                          STO  L  BUFFR-1   *OF RESIDENT IMAGE          N0112540
                          BSI  L  JB850     BR TO FETCH RESIDENT IMAGE  N0112550
                          LD   L  BUFFR+$CORE-6  FETCH AND STORE        N0112560
                          STO  L  $CORE     *CONFIGURED CORE SIZE       N0112570
                    *                                                   N0112580
                    *     INITIALIZE DCOM                               N0112590
                    *                                                   N0112600
                    JB640 SLT     32        CLEAR ACC AND EXT           N0112610
                    *                                                   N0112620
                          LDX   1 -5        WORD COUNT TO XR1           N0112630
                    JB660 STO  L1 #FMAT+5                               N0112640
                          STO  L1 #WSCT+5                               N0112650
                          MDX   1 1         INCR WORD CNT, SKIP IF ZERO N0112660
                          MDX     JB660     BRANCH TO CLEAR NEXT WORD   N0112670
                    *                                                   N0112680
                          LDX  L1 DCOM                                  N0112690
                          STD   1 #NAME-DCOM                            N0112700
                          STO   1 #DBCT-DCOM                            N0112710
                          STO   1 #FCNT-DCOM                            N0112720
                          STO   1 #CBSW-DCOM                            N0112730
                          STO   1 #LCNT-DCOM                            N0112740
                          STO   1 #MPSW-DCOM                            N0112750
                          STO   1 #MDF1-DCOM                            N0112760
                          STO   1 #MDF2-DCOM                            N0112770
                          STO   1 #NCNT-DCOM                            N0112780
                          STO   1 #GCNT-DCOM                        2G2 N0112790
                          STO   1 #ENTY-DCOM                            N0112800
                          STO   1 #TODR-DCOM                            N0112810
                          STO   1 #FRDR-DCOM                            N0112820
                          STO   1 #FHOL-DCOM                            N0112830
                          STO   1 #FSZE-DCOM                            N0112840
                          STO   1 #UHOL-DCOM                            N0112850
                          STO   1 #USZE-DCOM                            N0112860
                          STO   1 #DCSW-DCOM                            N0112870
                          LD   L  JB901       SET                       N0112880
                          STO   1 #JBSW-DCOM  *TEMPORARY MODE INDICATOR N0112890
                    *                                               2-4 N0112900
                    *     SET NUMBER OF EQUATE RECORDS              2-4 N0112910
                    *                                               2-4 N0112920
                          LD   L  @SBFR+29  FETCH COLUMNS 59-60     2-4 N0112930
                          AND     JB966     SAVE NO. IN COLUMN 60   2-4 N0112940
                          M       JB967     MULTIPLY BY TEN         2-4 N0112950
                          SLT     16        SHIFT PRODUCT TO        2-4 N0112960
                          STO     JB968     *ACCUMULATOR AND SAVE   2-4 N0112970
                          LD   L  @SBFR+30  FETCH COLUMNS 61-62     2-4 N0112980
                          SRA     8         SHIFT OUT COLUMN 62     2-4 N0112990
                          AND     JB966     SAVE NO. IN COLUMN 61   2-4 N0113000
                          A       JB968     ADD TENS COLUMN         2-4 N0113010
                          STO  L  #ECNT     SET NO OF EQUAT RCDS    2-4 N0113020
                          STO  L  NORCD     *AND HERE TO            2-4 N0113030
                          SLA     16                                2-4 N0113040
                          STO  L  JOBXQ     SET SW TO EQUATS ONLY   2-4 N0113050
                          MDX     JB700     BRANCH TO CONTINUE          N0113060
                    *                                                   N0113070
                    *     CONSTANTS AND WORK AREAS                      N0113080
                    *                                                   N0113090
                    X1    EQU     $DUMP+3   MIDDLE OF COMMA             N0113100
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   N0113110
                    JB960 WAIT              USED TO RESTORE LEVEL 2     N0113120
                          BSC  I  $PRET     *POST+PRE OP ERROR TRAP2-10 N0113130
                    JB962 DC      1         CONSTANT ONE           2-10 N0113140
                    JB963 DC      $I420     ADDR OF FLUSH JOB ENTRY PT  N0113150
                    JB964 DC      $STOP     ADDRESS OF STOP KEY TRAP    N0113160
                    JB965 DC      #RIAD     ADDR OF RESIDENT IMAGE SCTR N0113170
                    JB966 DC      /000F     MASK                    2-4 N0113180
                    JB967 DC      10        CONSTANT TEN            2-4 N0113190
                    JB968 DC      *-*       TEMPORY STORAGE         2-4 N0113200
                    *                                                   N0113210
                    *     FETCH AND PRINT VERSION AND MOD LEVEL,        N0113220
                    *     ACTUAL AND CONFIGURED CORE SIZE               N0113230
                    *                                                   N0113240
                    JB700 LD   L  $SYSC     FETCH VERSION AND MOD LEVEL N0113250
                          SRT     16        SHIFT TO EXTENSION          N0113260
                          SLA     16        CONVERT                     N0113270
                          SLT     8         *VERSION TO EBCDIC          N0113280
                          OR      JB972     *AND STORE                  N0113290
                          STO     JB972     *TO I/O AREA                N0113300
                    *                                                   N0113310
                          SLA     16        CONVERT                     N0113320
                          SRT     8         *MODIFICATION               N0113330
                          D       JB973     *LEVEL                      N0113340
                          SLT     8         *TO EBCDIC                  N0113350
                          SRA     8         *AND                        N0113360
                          SLT     8         *STORE TO                   N0113370
                          OR      JB972+2   *I/O                        N0113380
                          STO     JB972+2   *AREA                       N0113390
                    *                                                   N0113400
                          LD      JB974     FETCH 32K                   N0113410
                          STO  L  8*@MNCR-1 *AND STORE TO HIGH ADDRESS  N0113420
                          SRA     1         HALF                        N0113430
                          STO  L  4*@MNCR-1 *AND STORE TO HIGH ADDRESS  N0113440
                          SRA     1         HALF                        N0113450
                          STO  L  2*@MNCR-1 *AND STORE TO HIGH ADDRESS  N0113460
                          SRA     1         HALF                        N0113470
                          STO  L  1*@MNCR-1 *AND STORE TO HIGH ADDRESS  N0113480
                    *                                                   N0113490
                          LD   L  8*@MNCR-1 FETCH,                      N0113500
                          BSI     JB780     *CONVERT AND                N0113510
                          STO     JB972+8   *STORE ACTUAL CORE SIZE     N0113520
                    *                                                   N0113530
                          LD   L  $CORE     FETCH,                      N0113540
                          BSI     JB780     *CONVERT AND                N0113550
                          STO     JB972+14  *STORE CONFIG CORE SIZE     N0113560
                    *                                                   N0113570
                          LD      JB970     FETCH ADDRESS OF I/O AREA   N0113580
                          BSI  L  RA850     BRANCH TO PRINT LINE        N0113590
                    *                                                   N0113600
                    *     IF THE MASTER CARTRIDGE HAS CHANGED THE       N0113610
                    *     SLET INFORMATION FOR SUPV PHASE 3 MAY         N0113620
                    *     HAVE CHANGED ALSO.                            N0113630
                    *                                                   N0113640
                          LDX   1 -3        XR1 = NO. OF SLET SECTORS   N0113650
                    JB720 MDX  L  BUFFR-1,1  INCREMENT SECTOR ADDRESS   N0113660
                          BSI     JB850     BRANCH TO READ THE SECTOR   N0113670
                          LDX  L2 -@SCTR    XR2 = SECTOR WORD COUNT     N0113680
                    JB740 LD   L  SUPV3     FETCH SUPV PHASE 3 PHASE ID N0113690
                          S    L2 BUFFR+@SCTR  TEST FOR AND BRANCH      N0113700
                          BSC  L  JB760,+-  *IF MATCH FOUND IN SLET     N0113710
                          MDX   2 4         DECR WORD CNT, SKIP IF ZERO N0113720
                          MDX     JB740     BR TO TEST NEXT PHASE ID    N0113730
                          MDX   1 1         DECR SCTR CNT, SKIP IF ZERO N0113740
                          MDX     JB720     BR TO FETCH NEXT SLET SCTR  N0113750
                          LDX   3 6         POINT TO ERROR MESSAGE M 16 N0113760
                          BSC  L  JB280     BRANCH TO PRINT THE MESSAGE N0113770
                    JB760 LDX  L1 SUPV3     XR1 PTS TO SUPV PH 3 SLET   N0113780
                          LDD  L2 BUFFR+@SCTR+2  FETCH AND STORE WORD   N0113790
                          STD   1 2         *COUNT AND SECTOR ADDRESS   N0113800
                          BSC  L  RA600     BRANCH TO FETCH PHASE 3     N0113810
                    *                                                   N0113820
                    *     CONSTANTS AND WORK AREAS                      N0113830
                    *                                                   N0113840
                    JB970 DC      JB971     ADDRESS OF I/O AREA         N0113850
                    JB971 DC      JB973-*   WORD COUNT                  N0113860
                    JB972 EBC     .V0 M00   ACTUAL 00K  CONFIG 00K .    N0113870
                    JB973 DC      10        CONSTANT TEN                N0113880
                    JB974 DC      /8000     MAXIMUM CORE SIZE           N0113890
                    JB975 EBC     .  .      CORE SIZE = INVALID         N0113900
                          EBC     . 4.      CORE SIZE =  4K             N0113910
                          EBC     . 8.      CORE SIZE =  8K             N0113920
                          EBC     .16.      CORE SIZE = 16K             N0113930
                          EBC     .32.      CORE SIZE = 32K             N0113940
                    *                                                   N0113950
                    *************************************************** N0113960
                    *                                                   N0113970
                    *     CONVERT CORE SIZE TO EBCDIC                   N0113980
                    *                                                   N0113990
                    JB780 DC      0         ENTRY/RETURN ADDRESS        N0114000
                          LDX   1 4         XR1 = CORE SIZE COUNT       N0114010
                          SLCA  1           XR1 = NO. OF ZEROS SHIFTED  N0114020
                          LD   L1 JB975     FETCH EBCDIC CORE SIZE      N0114030
                          BSC  I  JB780     *AND RETURN                 N0114040
                    *                                                   N0114050
                    *************************************************** N0114060
                    *                                                   N0114070
                    *     INITIALIZE THE HEADING BUFFER                 N0114080
                    *                                                   N0114090
                    JB800 DC      0         ENTRY/RETURN ADDRESS        N0114100
                          LDX  L2 -@SCTR    XR2 = SECTOR WORD COUNT     N0114110
                          LD      JB982     FETCH BLANK WORD            N0114120
                    JB820 STO  L2 BUFFR+@SCTR  STORE TO HEADING BUFFER  N0114130
                          MDX   2 1         INCR WORD CNT, SKIP IF ZERO N0114140
                          MDX     JB820     BRANCH TO STORE NEXT WORD   N0114150
                    *                                                   N0114160
                          LDX   2 -4        XR2 = WORD COUNT            N0114170
                    JB840 LD   L2 JB983+4   FETCH A WORD OF 'PAGE   1'  N0114180
                          STO  L2 BUFFR+4   *AND STORE TO HEADING BFR   N0114190
                          LD   L2 @SBFR+29  FETCH A WORD OF HEADING     N0114200
                          STO  L2 BUFFR+10  *AND STORE TO HEADING BFR   N0114210
                          MDX   2 1         INCR WORD CNT, SKIP IF ZERO N0114220
                          MDX     JB840     BRANCH TO STORE NEXT WORD   N0114230
                    *                                                   N0114240
                          LD      JB980     INITIALIZE                  N0114250
                          STO  L  $PGCT     *PAGE COUNT                 N0114260
                    *                                                   N0114270
                          LD      JB981     STORE HEADING               N0114280
                          STO  L  BUFFR-1   *SECTOR ADDRESS TO I/O AREA N0114290
                          BSI     JB860     BRANCH TO WRITE HDNG SECTOR N0114300
                          BSC  I  JB800     RETURN                      N0114310
                    *                                                   N0114320
                    *     CONSTANTS AND WORK AREAS                      N0114330
                    *                                                   N0114340
                    JB980 DC      1         INITIAL PAGE COUNT          N0114350
                    JB981 DC      #HDNG     HEADING SECTOR ADDRESS      N0114360
                    JB982 EBC     .  .      EBCDIC BLANK - BLANK        N0114370
                    JB983 EBC     .PAGE   1.                            N0114380
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   N0114390
                    JB984 DC      /0000     READ FUNCTION CODE          N0114400
                          DC      BUFFR-2   I/O BUFFER ADDRESS          N0114410
                    JB986 DC      /0001     WRITE FUNCTION CODE         N0114420
                          DC      BUFFR-2   I/O BUFFER ADDRESS          N0114430
                    *                                                   N0114440
                    *************************************************** N0114450
                    *                                                   N0114460
                    *     READ OR WRITE THE BUFFER                      N0114470
                    *                                                   N0114480
                    JB850 DC      0         READ ENTRY                  N0114490
                          LD      JB850     FETCH RETURN ADDRESS        N0114500
                          STO     JB860     *AND STORE                  N0114510
                          LDD     JB984     FETCH FUNC CODE/I/O AR ADDR N0114520
                          MDX     JB870     BRANCH TO READ              N0114530
                    *                                                   N0114540
                    JB860 DC      0         WRITE ENTRY/RETURN ADDRESS  N0114550
                          LDD     JB986     FETCH FUNC CODE/I/O AR ADDR N0114560
                    JB870 BSI  L  DZ000     BRANCH TO READ OR WRITE     N0114570
                    JB880 MDX  L  $DBSY,0   SKIP NEXT IF OP COMPLETE    N0114580
                          MDX     JB880     BR TO TEST OP COMPLETE      N0114590
                          BSC  I  JB860     RETURN                      N0114600
                          HDNG    SYSUP - UPDATE SYSTEM DCOM            N0114610
                    *************************************************** N0114620
                    *STATUS - VERSION 2, MODIFICATION LEVEL 12        * N0114630
                    *                                                 * N0114640
                    *FUNCTION/OPERATION -                             * N0114650
                    *   * UPDATE THE AREA CODE ($ACDE) IN COMMA TO    * N0114660
                    *     REFLECT THE PHYSICAL DEFINITION OF EACH     * N0114670
                    *     REQUESTED LOGICAL DRIVE.                    * N0114680
                    *   * UPDATE THE DEFECTIVE CYLINDER TABLE ($DCYL) * N0114690
                    *     IN COMMA FROM THE DEFECTIVE CYLINDER TABLE  * N0114700
                    *     ON EACH REQUESTED CARTRIDGE.                * N0114710
                    *   * UPDATE THE SYSTEM CARTRIDGE DCOM FROM DCOM  * N0114720
                    *     OF EACH REQUESTED CARTRIDGE.  THE TABLES    * N0114730
                    *     UPDATED ARE -                               * N0114740
                    *     #ANDU                                       * N0114750
                    *     #BNDU                                       * N0114760
                    *     #FPAD                                       * N0114770
                    *     #CIDN                                       * N0114780
                    *     #CIBA                                       * N0114790
                    *     #SCRA                                       * N0114800
                    *     #FMAT                                       * N0114810
                    *     #FLET                                       * N0114820
                    *     #ULET                                       * N0114830
                    *     #WSCT                                       * N0114840
                    *     #CSHN                                       * N0114850
                    *   * ADDITIONALLY, $CIBA, $FPAD AND $ULET IN     * N0114860
                    *     COMMA AS WELL AS THE WORD COUNT AND SECTOR  * N0114870
                    *     ADDRESS OF THE CORE IMAGE LOADER STORED AT  * N0114880
                    *     THE END OF DISKZ ARE UPDATED.               * N0114890
                    *                                                 * N0114900
                    *ENTRY POINTS -                                   * N0114910
                    *     SUBROUTINE ENTRY - SYSUP                    * N0114920
                    *                                                 * N0114930
                    *INPUT -                                          * N0114940
                    *   * THE ADDRESS OF A 5 WORD TABLE CONTAINING THE* N0114950
                    *     REQUESTED CARTRIDGE IDS IN LOGICAL ORDER    * N0114960
                    *     IS THE ARGUMENT OF THE CALL.                * N0114970
                    *                                                 * N0114980
                    *OUTPUT -                                         * N0114990
                    *   * THE REQUESTED CARTRIDGE IDS AND THEIR       * N0115000
                    *     LOGICAL AND PHYSICAL DEFINITION ARE PRINTED * N0115010
                    *     ON THE PRINCIPAL PRINT DEVICE.              * N0115020
                    *                                                 * N0115030
                    *EXTERNAL REFERENCES -                            * N0115040
                    *   * IN COMMA -                                  * N0115050
                    *     $ACDE                                       * N0115060
                    *     $CIBA                                       * N0115070
                    *     $CYLN                                       * N0115080
                    *     $DBSY                                       * N0115090
                    *     $DCYL                                       * N0115100
                    *     $DUMP                                       * N0115110
                    *     $EXIT                                       * N0115120
                    *     $FLSH                                       * N0115130
                    *     $FPAD                                       * N0115140
                    *     $IBT4                                       * N0115150
                    *     $IREQ                                       * N0115160
                    *     $LEV2                                       * N0115170
                    *     $PBSY                                       * N0115180
                    *     $SYSC                                       * N0115190
                    *     $ULET                                       * N0115200
                    *     $ZEND                                       * N0115210
                    *   *IN DCOM -                                    * N0115220
                    *     #ACIN                                       * N0115230
                    *     #ANDU                                       * N0115240
                    *     #BNDU                                       * N0115250
                    *     #CIBA                                       * N0115260
                    *     #CIDN                                       * N0115270
                    *     #CSHN                                       * N0115280
                    *     #FLET                                       * N0115290
                    *     #FMAT                                       * N0115300
                    *     #FPAD                                       * N0115310
                    *     #PCID                                       * N0115320
                    *     #SCRA                                       * N0115330
                    *     #SYSC                                       * N0115340
                    *     #ULET                                       * N0115350
                    *     #WSCT                                       * N0115360
                    *   * IN MCRA -                                   * N0115370
                    *     RA850                                       * N0115380
                    *     RDCOM                                       * N0115390
                    *   * SUBROUTINES -                               * N0115400
                    *     DZ000   RESIDENT DISK I/O SUBROUTINE.       * N0115410
                    *     OUTPT   PRINCIPAL PRINT DEVICE SUBROUTINE.  * N0115420
                    *                                                 * N0115430
                    *EXITS -                                          * N0115440
                    *   * NORMAL -                                    * N0115450
                    *     RETURN TO SUPERVISOR PHASE 2 AT CALL+3 TO   * N0115460
                    *     TO COMPLETE JOB PROCESSING.                 * N0115470
                    *   * ERROR -                                     * N0115480
                    *     BRANCH TO MCRA TO ABORT JOB AFTER PRINTING  * N0115490
                    *     ERROR MESSAGE. (SEE NOTES.)                 * N0115500
                    *                                                 * N0115510
                    *TABLES/WORK AREAS -                              * N0115520
                    *   * DCOM    A 320 WORD BUFFER USED FOR SYSTEM   * N0115530
                    *             DCOM I/O.                           * N0115540
                    *   * DCOMX   A 320 WORD BUFFER USED FOR SATELLITE* N0115550
                    *             DCOM INPUT. (EQUIVALENT TO 'BUFFR') * N0115560
                    *                                                 * N0115570
                    *ATTRIBUTES -                                     * N0115580
                    *   * ABSOLUTE.                                   * N0115590
                    *   * REUSABLE.                                   * N0115600
                    *                                                 * N0115610
                    *NOTES -                                          * N0115620
                    *   * THE ERROR MESSAGES PRINTED FROM SYSUP ARE-  * N0115630
                    *       * XXXX IS NOT AN AVAILABLE CARTRIDGE ID   * N0115640
                    *       * XXXX IS A DUPLICATED SPECIFIED          * N0115650
                    *              CARTRIDGE ID                       * N0115660
                    *       * XXXX IS A DUPLICATED AVAILABLE          * N0115670
                    *              CARTRIDGE ID                       * N0115680
                    *       * XXXX IS NOT A SYSTEM CARTRIDGE          * N0115690
                    *                                                 * N0115700
                    *************************************************** N0115710
                          HDNG    SYSUP - UPDATE SYSTEM DCOM            N0115720
                    *                                                   N0115730
                    *     UPDATE THE SYSTEM DCOM FROM ALL               N0115740
                    *     REQUESTED CARTRIDGES                          N0115750
                    *                                                   N0115760
                    SYSUP DC      *-*       ENTRY/RETURN ADDRESS        N0115770
                    *                                                   N0115780
                    *     INITIALIZE                                    N0115790
                    *                                                   N0115800
                          LDX  L1 $DCYL     INITIALIZE ADDRESS AT WHICH N0115810
                          STX  L1 SU620     *TO STORE DEF CYL ADDRESSES N0115820
                          LDD   1 0         SAVE                    2-8 N0115830
                          STD  L  SU944     *DEFECTIVE              2-8 N0115840
                          LD    1 2         *CYLINDER               2-8 N0115850
                          STO  L  SU944+2   *TABLE                  2-8 N0115860
                          SRA     16        SET SYSTEM                  N0115870
                          STO  L  SU919     *CARTRIDGE SWITCH OFF AND   N0115880
                          STO  L  SU915     *AVAIL CART INDICATOR ZERO  N0115890
                          LD   L  $ACDE     SAVE                        N0115900
                          SRT     16        *AREA CODE                  N0115910
                          LD   L  $IREQ     *AND ADDRESS OF             N0115920
                          STD  L  SU936     *INTERRUPT REQUEST SUBR     N0115930
                          LD   L  SU935     POINT INTERRUPT REQUEST     N0115940
                          STO  L  $IREQ     *ADDRESS TO SYSUP SUBR      N0115950
                    *                                                   N0115960
                    *     FETCH ID LIST                                 N0115970
                    *                                                   N0115980
                          LD   I  SYSUP     FETCH ADDRESS OF ID LIST    N0115990
                          A    L  SU916     INCREMENT ADDRESS BY 5      N0116000
                          STO     SU010+1   STORE AS FETCH ADDRESS      N0116010
                    *                                                   N0116020
                          LDX   1 -5        ID LIST COUNT TO XR1        N0116030
                    SU010 LD   L1 *-*       FETCH AN ID FROM USERS PROG N0116040
                          STO  L1 SU902+5   STORE ID TO ID LIST         N0116050
                          MDX   1 1         INCR ID COUNT, SKIP IF ZERO N0116060
                          MDX     SU010     BRANCH TO FETCH NEXT ID     N0116070
                    *                                                   N0116080
                    *     FETCH DCOM FROM PREVIOUS SYSTEM CARTRIDGE     N0116090
                    *                                                   N0116100
                    SU030 LD      SU902     FETCH 1ST ID OF ID LIST2-11 N0116110
                          BSC  L  SU040,Z   BRANCH IF ID NON-BLANK      N0116120
                          BSI  L  RDCOM     BRANCH TO FETCH DCOM        N0116130
                          LD   L  #CIDN     FETCH SYSTEM CARTRIDGE ID   N0116140
                          STO     SU902     STORE TO ID LIST            N0116150
                          STO  L  SU919     SET SYTEM CARTRIDGE SW ON   N0116160
                    *                                                   N0116170
                    *     CHECK FOR DUPLICATE CARTRIDGE IDS             N0116180
                    *                                                   N0116190
                    SU040 SLT     32        CLEAR THE SWITCH            N0116200
                          LDX   2 0         ID LIST COUNT TO XR2        N0116210
                    SU050 LD   L2 SU902     FETCH A CARTRIDGE ID        N0116220
                          BSC  L  SU070,+-  BRANCH IF ID BLANK          N0116230
                          BSI  L  SU400     BR TO CK FOR A DUPLICATE ID N0116240
                          MDX   2 1         INCREMENT ID COUNT          N0116250
                          NOP                                           N0116260
                          MDX     SU050     BRANCH TO CHECK NEXT ID     N0116270
                    *                                                   N0116280
                    *     FETCH CART LIST                               N0116290
                    *                                                   N0116300
                    SU070 LDX   1 -11       DRIVE COUNT TO XR1     2-11 N0116310
                          LDX   2 0         DEF CYL ADDR COUNT TO XR2   N0116320
                          LD   L  $LEV2     SAVE THE CONTENTS           N0116330
                          STO     SU923     *OP LOCATION 10        2-11 N0116340
                    *                                                   N0116350
                    SU080 LD      SU922     RESET INTERRUPT        2-11 N0116360
                          STO  L  10        *BRANCH ADDRESS             N0116370
                          LD   L1 SU924+11  FETCH AREA CODE        2-11 N0116380
                          STO  L  $ACDE     STORE TO COMMA              N0116390
                          OR      SU920     "OR" IN READ FUNCTION CODE  N0116400
                          STO     SU910+1   STORE TO 2ND WORD OF IOCC   N0116410
                          OR      SU921     "OR" IN SENSE FUNCTION CODE N0116420
                          STO     SU912+1   STORE TO 2ND WORD OF IOCC   N0116430
                          XIO     SU910     INITIATE DISK READ          N0116440
                          XIO     SU912     SENSE DISK                  N0116450
                          SLA     3         SHIFT BUSY BIT TO 0-BIT     N0116460
                          BSC  L  SU100,Z+  BRANCH IF DISK BUSY         N0116470
                    *                                                   N0116480
                    *     DISK NOT BUSY, NO CARTRIDGE AVAILABLE         N0116490
                    *                                                   N0116500
                          SRA     16        SET CART LIST               N0116510
                          STO  L1 SU904+11  TO ZERO                2-11 N0116520
                          LD      SU915     FETCH AVAIL CART INDICATOR  N0116530
                          MDX     SU120     BR TO INCREMENT DRIVE COUNT N0116540
                    *                                                   N0116550
                    *     OPERATION COMPLETE INTERRUPT PROCESSING       N0116560
                    *                                                   N0116570
                    SU090 DC      *-*                                   N0116580
                          XIO     SU912     SENSE WITH RESET            N0116590
                          BOSC I  SU090     CONTINUE                    N0116600
                    *                                                   N0116610
                    *     CARTRIDGE AVAILABLE, FETCH CARTRIDGE ID AND   N0116620
                    *     DEFECTIVE CYLINDER ADDRESSES                  N0116630
                    *                                                   N0116640
                    SU100 LD      SU090     LD INT. ENTRY POINT    2-11 N0116650
                          BSC     +-        SKIP IF OP-COMPLETE    2-11 N0116652
                          MDX     SU100     *OTHERWISE, LOOP       2-11 N0116654
                          SLA     16        RESET INTERRUPT ENTRY  2-11 N0116656
                          STO     SU090     *POINT TO ZERO         2-11 N0116658
                          LD      SU923     RESTORE CONTENTS            N0116660
                          STO  L  10        *OF LOCATION 10             N0116670
                          LD      SU914+1   SET ARM POSITION TO    2-11 N0116680
                          STO  L  $CYLN     SECTOR ADDR JUST READ       N0116690
                          LD      SU917     FETCH ADDRESS OF I/O AREA   N0116700
                          SRT     16        SHIFT TO EXT, ACC = 0       N0116710
                          BSI  L  DZ000     BRANCH TO DISK READ         N0116720
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  N0116730
                          MDX     *-3       BR TO TEST READ COMPLETE    N0116740
                    *                                                   N0116750
                          LD      SU908+3   FETCH CART ID AND           N0116760
                          STO  L1 SU904+11  *STORE TO CART LIST    2-11 N0116770
                          LD      SU908     FETCH                       N0116780
                          STO  L2 SU925     *AND                        N0116790
                          LD      SU908+1   *STORE                      N0116800
                          STO  L2 SU925+1   *DEFECTIVE                  N0116810
                          LD      SU908+2   *CYLINDER                   N0116820
                          STO  L2 SU925+2   *ADDRESSES                  N0116830
                          LD      SU915     FETCH AVAIL CART INDICATOR  N0116840
                          OR      SU915+1   MASK IN BIT FOR THIS DRIVE  N0116850
                    *                                                   N0116860
                    SU120 SLA     1         SHIFT AND                   N0116870
                          STO     SU915     *SAVE AVAIL CART INDICATOR  N0116880
                          MDX   2 3         INCR DEF CYLIN ADDR COUNT   N0116890
                          NOP                                           N0116900
                          MDX   1 1         INCR DR COUNT, SKIP IF ZERO N0116910
                          MDX     SU080                                 N0116920
                    *                                                   N0116930
                          LD      SU923     RESTORE CONTENTS            N0116940
                          STO  L  $LEV2     *OF LOCATION 10             N0116950
                    *                                                   N0116960
                    *     FIND  FIRST CARTRIDGE ID OF ID LIST IN        N0116970
                    *     CART LIST                                     N0116980
                    *                                                   N0116990
                          LDX   1 0         ID LIST COUNT TO XR1        N0117000
                          BSI  L  SU279     BR TO FIND ID          2-11 N0117010
                          MDX     SU180     ON RETRN GO UPDTE DCOM 2-11 N0117020
                    *                       * AND COMMA            2-11 N0117030
                    *                                                   N0117140
                    *     CONSTANTS AND WORK AREA                       N0117150
                    *                                                   N0117160
                    DCOMX EQU     BUFFR     NON-SYS DCOM I/O AREA ADDR  N0117170
                    DSIZE EQU     @SCTR     WORD COUNT OF DCOM I/O AREA N0117180
                          BSS  E  0                                     N0117190
                    SU902 BSS     5         ID LIST                     N0117200
                          DC      0                                     N0117210
                    SU904 BSS     11        CART LIST-PHY DR ORDER 2-11 N0117220
                          DC      -1                                    N0117230
                    SU906 DC      4         WORD COUNT                  N0117240
                    SU907 DC      #IDAD     SECTOR ADDRESS          2-3 N0117250
                    SU908 BSS     4         DEF CYL, CART ID I/O AREA   N0117260
                    SU910 DC      SU914     ADDRESS OF I/O AREA         N0117270
                          DC      *-*       SECOND WORD OF READ IOCC    N0117280
                    SU912 DC      /658      MAXIMUM ARM POSITION        N0117290
                          DC      *-*       SECOND WORD OF SENSE IOCC   N0117300
                    SU914 DC      1         WORD COUNT                  N0117310
                          DC      *-*       I/O AREA                    N0117320
                    SU915 DC      *-*       AVAIL CARTRIDGE INDICATOR   N0117330
                          DC      /0001                                 N0117340
                    SU916 DC      5         MAXIMUM NUMBER OF DRIVES    N0117350
                    SU917 DC      SU906     ADDR OF CART ID I/O AREA    N0117360
                    SU918 DC      DCOMX-2   ADDR OF DCOM I/O AREA       N0117370
                    SU919 DC      *-*       SYSTEM CARTRIDGE SWITCH     N0117380
                    SU920 DC      /0600     READ FUNCTION CODE          N0117390
                    SU921 DC      /0701     SENSE FUNCTION CODE         N0117400
                    SU922 DC      SU090     INTERRUPT SERVICE ADDRESS   N0117410
                    SU923 DC      *-*       SAVE FOR LOCATION 10        N0117420
                    SU924 DC      /2000     AREA CODE FOR PHY DRIVE 0   N0117430
                          DC      /8800     AREA CODE FOR PHY DRIVE 1   N0117440
                          DC      /9000     AREA CODE FOR PHY DRIVE 2   N0117450
                          DC      /9800     AREA CODE FOR PHY DRIVE 3   N0117460
                          DC      /A000     AREA CODE FOR PHY DRIVE 4   N0117470
                          DC      /B000     AREA CODE-PHY DR  5    2-11 N0117471
                          DC      /B800     AREA CODE-PHY DR  6    2-11 N0117472
                          DC      /B810     AREA CODE-PHY DR  7    2-11 N0117473
                          DC      /B820     AREA CODE-PHY DR  8    2-11 N0117474
                          DC      /B830     AREA CODE-PHY DR  9    2-11 N0117476
                          DC      /B840     AREA CODE-PHY DR 10    2-11 N0117478
                    SU925 BSS     33        DEF CYLINDER ADDRS     2-11 N0117480
                    SU926 DC      SU928-1   ADDRESS OF PRINT AREA       N0117490
                          DC      23                                    N0117500
                    SU928 EBC     .LOG DRIVE   CART SPEC   CART AVAIL.  N0117510
                          EBC     .  PHY DRIVE .                        N0117520
                    *                                                   N0117530
                    *     READ SYSTEM CARTRIDGE DCOM                    N0117540
                    *                                                   N0117550
                    SU180 BSI  L  SU600     BR TO STORE $ACDE, DEF CYLS N0117560
                          LD      SU926     SET SWITCH                  N0117570
                          SRT     16        *NON-ZERO                   N0117580
                          LD   L2 SU904     FETCH CARTRIDGE ID          N0117590
                          BSI  L  SU400     BR TO CK FOR DUPLICATE IDS  N0117600
                    *                                                   N0117610
                          LD      SU919     BRANCH IF THE SYSTEM        N0117620
                          BSC  L  SU220,Z   *CARTRIDGE HAS NOT CHANGED  N0117630
                          BSI  L  RDCOM     BRANCH TO FETCH DCOM        N0117640
                    *                                                   N0117650
                    *     UPDATE MODIFICATION LEVEL IN COMMA            N0117660
                    *                                                   N0117670
                          LD   L  #SYSC     FETCH MOD LEVEL FROM DCOM   N0117680
                          BSC  L  SU190,Z   BR IF A VALID SYS CARTRIDGE N0117690
                          LDX   2 4         POINT XR2 TO ERROR MESSAGE  N0117700
                          BSC  L  ERRUP+1   BRANCH TO PRINT THE MESSAGE N0117710
                    SU190 STO  L  $SYSC     STORE MOD LEVEL TO COMMA    N0117720
                    *                                                   N0117730
                          LDX  L2 -DSIZE    SET DCOM WORD COUNT         N0117740
                    SU200 LD   L2 DCOM+DSIZE   STORE SYSTEM DCOM        N0117750
                          STO  L2 DCOMX+DSIZE  *TO NON-SYSTEM DCOM      N0117760
                          MDX   2 1         INCR WORD CNT, SKIP IF ZERO N0117770
                          MDX     SU200     BRANCH TO FETCH NEXT WORD   N0117780
                          BSI  L  SU500     BRANCH TO UPDATE SYS DCOM   N0117790
                    *                                                   N0117800
                    *     SAVE THE CARTRIDGE IDS IN PHYSICAL ORDER IN   N0117810
                    *     DCOM                                          N0117820
                    *                                                   N0117830
                    SU220 LDX   2 -5        WORD COUNT TO XR2           N0117840
                          LD   L2 SU904+5   FETCH A CARTRIDGE ID        N0117850
                          STO  L2 #PCID+5   STORE TO DCOM               N0117860
                          MDX   2 1         INCR WORD CNT, SKIP IF ZERO N0117870
                          MDX     SU220+1   BRANCH TO FETCH NEXT ID     N0117880
                          LDX  I2 SU977     FETCH THE CARTRIDGE ID      N0117890
                          LD   L1 SU902     *THAT WAS ZEROED OUT        N0117900
                          MDX   2 -4        *CHECK IF PHY DR G.T.4 2-11 N0117902
                          MDX     SU230     *BR IF YES             2-11 N0117904
                          MDX   2 4         *OTHERWISE RESTORE XR2 2-11 N0117906
                          NOP               IN CASE OF SKIP        2-11 N0117908
                          STO  L2 #PCID     *AND STORE ID TO DCOM  2-11 N0117910
                    SU230 LD   L  SU915     FETCH AVAIL CART IND.  2-11 N0117920
                          SLA     4         SHIFT TO LEFT 11 BITS  2-11 N0117930
                          STO  L  #ACIN     *AND STORE TO DCOM          N0117940
                    *                                                   N0117950
                    *     ZERO OUT TABLES IN COMMA AND DCOM             N0117960
                    *                                                   N0117970
                          LDX   2 -4        WORD COUNT TO XR2           N0117980
                          SRA     16        CLEAR ACCUMULATOR           N0117990
                    SU240 STO  L2 $ACDE+5   SET                         N0118000
                          STO  L2 $CYLN+5   *TO                         N0118010
                          STO  L2 #ANDU+5   *ZERO                       N0118020
                          STO  L2 #BNDU+5   *ITEMS                      N0118030
                          STO  L2 #FPAD+5   *1-4                        N0118040
                          STO  L2 #CIDN+5   *OF                         N0118050
                          STO  L2 #CIBA+5   *CARTRIDGE                  N0118060
                          STO  L2 #SCRA+5   *DEPENDENT                  N0118070
                          STO  L2 #FMAT+5   *TABLES                     N0118080
                          STO  L2 #FLET+5   *IN                         N0118090
                          STO  L2 #ULET+5   *COMMA                      N0118100
                          STO  L2 #WSCT+5   *AND                        N0118110
                          STO  L2 #CSHN+5   *DCOM                       N0118120
                          MDX   2 1         INCR WORD CNT, SKIP IF ZERO N0118130
                          MDX     SU240     BR TO ZERO OUT NEXT ITEM    N0118140
                    *                                                   N0118150
                          LDX   2 -12       WORD COUNT TO XR2           N0118160
                    * 1 INSTRUCTION REMOVED                        2-11 N0118170
                    SU260 STO  L2 $DCYL+15  STORE TO $DCYL IN COMMA     N0118180
                          MDX   2 1         INCR WORD CNT, SKIP IF ZERO N0118190
                          MDX     SU260     BR TO STORE NEXT DEF CYL    N0118200
                    *                                                   N0118210
                    *     INITLZ HDNG BFR, RESTORE, AND PR JOB RCD      N0118220
                    *                                                   N0118230
                          BSI  L  JB800     INITIALIZE HEADING BUFFER   N0118240
                          BSI  L  RSTOR     SKIP TO NEW PAGE AND PR     N0118250
                          SLA     16                                2-5 N0118260
                          STO  I  $CH12                             2-5 N0118270
                          LD   L  SBADR     *HDNG, PRINT                N0118280
                          BSI  L  RA850     *JOB CNTRL RCD              N0118290
                    *                                                   N0118300
                    *     PRINT CARTRIDGE/DRIVE HEADING                 N0118310
                    *                                                   N0118320
                          SLA     16                                2-5 N0118330
                          STO  I  $CH12                             2-5 N0118340
                          LD   L  SU926     PRINT HEADING          2-11 N0118350
                          BSI  L  RA850     *FOR LIST OF CAR ID AND DR  N0118360
                    *                                                   N0118370
                    *     PRINT CARTRIDGE ID AND DRIVE                  N0118380
                    *                                                   N0118390
                    MORE  LD   L  SU928-1   SET TO PRNT WHOLE LINE 2-11 N0118400
                          BSI  L  SU700     BRANCH TO PRINT A LINE      N0118410
                    *                                                   N0118420
                    *     INCREMENT LOGICAL DRIVE COUNT                 N0118430
                    *                                                   N0118440
                          MDX   1 1         INCREMENT DRIVE COUNT       N0118450
                          NOP                                           N0118460
                          LD   L1 SU902     FETCH NEXT ID FROM ID LIST  N0118470
                          BSC  L  NOMOR,+-  BRANCH IF ID BLANK          N0118480
                          BSI     SU279     BR TO FIND ID          2-11 N0118485
                          MDX     SU300     ON RETRN GO UPDTE DCOM 2-11 N0118486
                    *                                                   N0118490
                    *     FIND CARTRIDGE ID IN CART LIST                N0118500
                    *                                                   N0118510
                    SU279 DC      *-*       ENTRY/RETURN ADDRESS   2-11 N0118515
                          LDX  L2 SU925     FETCH AND SAVE ADDRESS OF   N0118520
                          STX  L2 SU960     *DEF CYL ADDRESSES          N0118530
                          LDX   2 0         CART LIST COUNT TO XR2      N0118540
                    SU280 LD   L2 SU904     FETCH AN ID FROM CART LIST  N0118550
                          BSC  L  SU390,+Z  BR IF ID NEGATIVE       2-2 N0118560
                          BSC  L  SU290,+   BRANCH IF ID BLANK          N0118570
                          S    L1 SU902     SUBTRACT ID FROM ID LIST    N0118580
                          BSC  I  SU279,+-  BR IF IDS EQUAL        2-11 N0118590
                    SU290 MDX   2 1         INCREMENT CART LIST COUNT   N0118600
                          NOP                                           N0118610
                          MDX  L  SU960,3   INCR ADDR OF DEF CYL ADDRS  N0118620
                          MDX     SU280     BRANCH TO TEST NEXT ID      N0118630
                    *                                                   N0118640
                    SU300 BSI  L  SU600     BR TO STORE $ACDE, DEF CYLS N0118650
                          LD      *+1       SET SWITCH                  N0118660
                          SRT     16        *NON-ZERO                   N0118670
                          LD   L2 SU904     FETCH CARTRIDGE ID          N0118680
                          BSI  L  SU400     BR TO CK FOR DUPLICATE IDS  N0118690
                    *                                                   N0118700
                    *     READ NON-SYSTEM CARTRIDGE DCOM                N0118710
                    *                                                   N0118720
                          LD   L  SU976     FETCH DRIVE NUMBER          N0118730
                          SLA     12        SHIFT NUMBER TO BITS 0-3    N0118740
                          A    L  DCOM-1    ADD SECTOR ADDRESS          N0118750
                          STO  L  DCOMX-1   STORE TO DCOM I/O AREA      N0118760
                          LD   L  SU918     FETCH ADDR OF DCOM I/O AREA N0118770
                          SRT     16        SHIFT TO EXT, ACC = 0       N0118780
                          BSI  L  DZ000     BRANCH TO DISK READ         N0118790
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  N0118800
                          MDX     *-3       BR TO TEST READ COMPLETE    N0118810
                    *                                                   N0118820
                          BSI  L  SU500     BRANCH TO UPDATE DCOM       N0118830
                          MDX     MORE                                  N0118840
                    *                                                   N0118850
                    *     ALL REQUESTED CARTRIDGE IDS HAVE BEEN FOUND   N0118860
                    *     AND ALL COMMA AND DCOM TABLES HAVE BEEN       N0118870
                    *     UPDATED                                       N0118880
                    *                                                   N0118890
                    NOMOR LDX   1 -11       CART LIST COUNT TO XR2 2-11 N0118900
                    *                                                   N0118910
                    SU310 LD   L1 SU904+11  FETCH ID FR CART LIST  2-11 N0118920
                          BSC  L  SU320,+-  BRANCH IF ID BLANK          N0118930
                    *                                                   N0118940
                          STX  L1 SU977     SAVE XR1 AND CONVERT IT     N0118950
                          MDX  L  SU977,11  *TO BE THE PHY DR NO.  2-11 N0118960
                          NOP               IN CASE OF SKIP             N0118970
                          STO  L  SU978     STORE TO PRINT SUBR         N0118980
                          SRA     16        SET TO PRINT HALF LINE      N0118990
                          BSI  L  SU700     BRANCH TO PRINT A LINE      N0119000
                    *                                                   N0119010
                    SU320 MDX   1 1         INCR CART LIST CNT, SK IF Z N0119020
                          MDX     SU310     BRANCH TO FETCH NEXT ID     N0119030
                    *                                                   N0119040
                          LDX   1 -5        WORD COUNT TO XR1           N0119050
                    SU330 LD   L1 #ULET+5   STORE LET SECTOR ADDRESS    N0119060
                          STO  L1 $ULET+5   *TO COMMA                   N0119070
                          LD   L1 #FPAD+5   STORE FILE PROTECTED ADDR   N0119080
                          STO  L1 $FPAD+5   *TO COMMA                   N0119090
                          MDX   1 1         INCR WORD CNT, SKIP IF ZERO N0119100
                          MDX     SU330     BRANCH TO FETCH NEXT WORD   N0119110
                    *                                                   N0119120
                    *     UPDATE $CIBA AND WD CNT/SCTR ADDR OF CIL  2-3 N0119130
                    *                                                   N0119140
                          LD   L  #CIBA     SET SECTOR ADDRESS OF       N0119150
                          STO  L  $CIBA     *CIB IN COMMA               N0119160
                          LD   L  SU907     FETCH AND STORE             N0119170
                          STO  L  BUFFR-1   *ID SECTOR ADDRESS          N0119180
                          LD   L  SU918     FETCH ADDRESS OF I/O AREA   N0119190
                          SRT     16        SHIFT TO EXT, ACC = 0       N0119200
                          BSI  L  DZ000     BRANCH TO DISK READ         N0119210
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  N0119220
                          MDX     *-3       BR TO TEST READ COMPLETE    N0119230
                          LDD  L  BUFFR+$ZEND-@CSTR-6  FETCH AND STORE  N0119240
                          STD  L  $ZEND-4   *WD CNT/SCTR ADDRESS OF CIL N0119250
                    *                                                   N0119260
                          BSI     SU380     BR TO TEST FOR INTRPT REQ   N0119270
                          MDX  L  SYSUP,1   INCREMENT RETURN ADDRESS    N0119280
                          BSC  I  SYSUP     RETURN                      N0119290
                    *                                                   N0119300
                    *     TEMPORARY INTERRUPT REQUEST SUBROUTINE        N0119310
                    *                                                   N0119320
                    SU370 DC      *-*       ENTRY                       N0119330
                          XIO  L  SU938     SENSE INTRPT REQ WITH RESET N0119340
                          BSC  L  $IBT4+1   BRANCH TO ILSO4 SUBR    2-2 N0119350
                    *                                                   N0119360
                    *     TEST FOR THE OCCURANCE OF AN INTERRUPT        N0119370
                    *     REQUEST DURING SYSUP                          N0119380
                    *                                                   N0119390
                    *                                                   N0119400
                    SU380 DC      *-*       ENTRY                       N0119410
                          LD   L  SU936     RESTORE ADDRESS OF          N0119420
                          STO  L  $IREQ     *INTERRUPT REQUEST SUBR     N0119430
                          LD      SU370     TEST FOR AND RETURN IF      N0119440
                          BSC  I  SU380,+-  *INTRPT REQ SUBR NOT ENTER  N0119450
                          BSI  L  $DUMP     BRANCH TO PROCESS           N0119460
                          DC      -2        *INTERRUPT REQUEST          N0119470
                    *                                                   N0119480
                    *     PRINT ERROR MESSAGES                          N0119490
                    *                                                   N0119500
                    SU390 A       SU938     CHECK IF ID = -1       2-11 N0119510
                          BSC  L  ERRUP,+-  *IF YES DO NOT PR ID IN 2-2 N0119520
                          S       SU938     *ACC, IF NO ID IN ACC   2-2 N0119530
                          STO  L1 SU902     *SHOULD BE PRINTED      2-2 N0119540
                    ERRUP LDX   2 1         POINT TO ERROR MESSAGE      N0119550
                    *                                                   N0119560
                          LD   L2 SU930     FETCH ADDR OF ERROR MESSAGE N0119570
                          A       SU938     INCREMENT AND          2-11 N0119580
                          STO  L  SU984     *STORE TO CONVERSION SUBR   N0119590
                          LD   L1 SU902     FETCH CARTRIDGE ID          N0119600
                          BSI  L  SU800     BRANCH TO CONVERT TO EBCDIC N0119610
                          LD   L2 SU930     FETCH ADDR OF ERROR MESSAGE N0119620
                          BSI  L  RA850     BRANCH TO PRINT THE MESSAGE N0119630
                    *                                                   N0119640
                          LD      SU937     RESTORE                     N0119650
                          STO  L  $FLSH     SET FLUSH JOB SWITCH        N0119670
                          LDD     SU944     RESTORE                 2-8 N0119680
                          STD  L  $DCYL     DEFECTIVE               2-8 N0119690
                          LD      SU944+2   *CYLINDER               2-8 N0119700
                          STO  L  $DCYL+2                           2-8 N0119710
                          BSI     SU380     BR TO TEST FOR INTRPT REQ   N0119720
                          EXIT              BR TO MCRA             2-11 N0119730
                    *                                                   N0119740
                    *     CONSTANTS AND WORK AREA                       N0119750
                    *                                                   N0119760
                          BSS  E  0                                     N0119770
                    SU930 DC      /7001                                 N0119780
                          DC      SU931                                 N0119790
                          DC      SU932                                 N0119800
                          DC      SU933                                 N0119810
                          DC      SU934                                 N0119820
                    SU931 DC      19                                    N0119830
                          EBC     .XXXX IS NOT AN AVAILABLE CARTRIDGE.  N0119840
                          EBC     . ID .                                N0119850
                    SU932 DC      23                                    N0119860
                          EBC     .XXXX IS A DUPLICATED SPECIFIED CAR.  N0119870
                          EBC     .TRIDGE ID   .                        N0119880
                    SU933 DC      23                                    N0119890
                          EBC     .XXXX IS A DUPLICATED AVAILABLE CAR.  N0119900
                          EBC     .TRIDGE ID   .                        N0119910
                    SU934 DC      15                                    N0119920
                          EBC     .XXXX IS NOT A SYSTEM CARTRIDGE.      N0119930
                    SU935 DC      SU370     ADDR OF SYSUP INTRPT REQ    N0119940
                    SU936 DC      *-*       ADDR OF NORMAL INTRPT REQ   N0119950
                    SU937 DC      *-*       AREA CODE OF PREV SYS CART  N0119960
                    SU938 DC      1         CONSTANT ONE                N0119970
                    SU939 DC      /0F01     SENSE INTERRUPT WITH RESET  N0119980
                    SU944 BSS  E  3         TEMP STORAGE FOR DEF CYL2-8 N0119990
                          HDNG    UPDATE SYSTEM DCOM                    N0120000
                    *                                                   N0120010
                    *     CHECK FOR DUPLICATE CARTRIDGE IDS             N0120020
                    *                                                   N0120030
                    SU400 DC      *-*       ENTRY/RETURN ADDRESS        N0120040
                    *                                                   N0120050
                          STD     SU940     SAVE CARTRIDGE ID AND SW    N0120060
                          STX   1 SU941     SAVE XR1                    N0120070
                          STX   2 SU942     SAVE XR2                    N0120080
                          LD      SU940+1   FETCH SWITCH                N0120100
                          BSC  L  SU440,Z   BRANCH IF NON-ZERO          N0120110
                    *                                                   N0120120
                    *     CHECK ID LIST FOR DUPLICATE CARTRIDGE IDS     N0120130
                    *                                                   N0120140
                    SU420 LDX   2 5         ID LIST CNT TO XR2     2-11 N0120145
                          LD   L2 SU902-1   FETCH A CART ID        2-11 N0120150
                          BSC  L  SU430,+-  BRANCH IF ID BLANK          N0120160
                          S       SU940     TEST FOR AND                N0120170
                          BSI  L  SU460,+-  *BRANCH IF IDENTICAL IDS    N0120180
                    SU430 MDX   2 -1        DECR ID CNT,SKIP IF=0  2-11 N0120190
                          MDX     SU420+1   BR TO TEST NEXT ID     2-11 N0120200
                          MDX     SU480     BRANCH TO RETURN            N0120210
                    *                                                   N0120220
                    *     CHECK CART LIST FOR DUPLICATE CARTRIDGE IDS   N0120230
                    *                                                   N0120240
                    SU440 LDX   2 11        CART LIST CNT TO XR2   2-11 N0120245
                          LD   L2 SU904-1   FETCH A CART ID        2-11 N0120250
                          BSC  L  SU450,+-  BRANCH IF ID BLANK          N0120260
                          S       SU940     TEST FOR AND                N0120270
                          BSI  L  SU460,+-  *BRANCH IF IDENTICAL IDS    N0120280
                    SU450 MDX   2 -1        DECR ID CNT,SKIP IF=0  2-11 N0120290
                          MDX     SU440+1   BR TO TEST NEXT ID     2-11 N0120300
                          MDX     SU480     BRANCH TO RETURN            N0120310
                    *                                                   N0120320
                    *     CHECK IF IDENTICAL CARTRIDGE IDS THE SAME ID  N0120330
                    *                                                   N0120340
                    SU460 DC      *-*       ENTRY/RETURN ADDRESS        N0120350
                          STX   2 SU943     SAVE COUNTER           2-11 N0120360
                          MDX  L  SU943,-1  ADJUST TO BE LIST PNTR 2-11 N0120370
                          NOP               IN CASE OF SKIP        2-11 N0120380
                          LD      SU942     FETCH EXTERNAL COUNTER      N0120390
                          S       SU943     TEST FOR AND                N0120400
                          BSC  I  SU460,+-  *RETURN IF COUNTERS EQUAL   N0120410
                    *                                                   N0120420
                          LD      SU940+1   FETCH SWITCH                N0120430
                          BSC  L  SU470,Z   BRANCH IF NON-ZERO          N0120440
                          LDX  I1 SU942     POINT TO CARTRIDGE ID       N0120450
                          LDX   2 2         POINT TO ERROR MESSAGE      N0120460
                          BSC  L  ERRUP+1   BRANCH TO PRINT THE MESSAGE N0120470
                    SU470 LDX  I1 SU941     POINT TO CARTRIDGE ID       N0120480
                          LDX   2 3         POINT TO ERROR MESSAGE      N0120490
                          BSC  L  ERRUP+1   BRANCH TO PRINT THE MESSAGE N0120500
                    *                                                   N0120510
                    *     RESTORE AND RETURN                            N0120520
                    *                                                   N0120530
                    SU480 LDX  I1 SU941     RESTORE XR1                 N0120540
                          LDX  I2 SU942     RESTORE XR2                 N0120550
                          SRA     16        SET CARTRIDGE ID            N0120560
                          STO  L2 SU904     *IN CART LIST BLANK         N0120570
                          LDD     SU940     RESTORE ACC AND EXT         N0120580
                          BSC  I  SU400     RETURN                      N0120590
                    *                                                   N0120600
                    *     WORK AREA                                     N0120610
                    *                                                   N0120620
                    SU940 DEC     0.0       CARTRIDGE ID AND SWITCH     N0120630
                    SU941 DC      *-*       SAVE FOR XR1                N0120640
                    SU942 DC      *-*       SAVE FOR XR2                N0120650
                    SU943 DC      *-*       TEMPORARY COUNTER           N0120660
                          HDNG    UPDATE SYSTEM DCOM                    N0120670
                    *                                                   N0120680
                    *     UPDATE SYSTEM CARTRIDGE DCOM                  N0120690
                    *                                                   N0120700
                    SU500 DC      *-*       ENTRY/RETURN ADDRESS        N0120710
                    *                                                   N0120720
                    *     FIND THE POSITION OF THE CARTRIDGE ID         N0120730
                    *     IN #CIDN OF DCOM                              N0120740
                    *                                                   N0120750
                          LDX   2 -5        #CIDN COUNT TO XR1          N0120760
                    SU520 LD   L1 SU902     FETCH CART ID FROM ID LIST  N0120770
                          S    L2 DCOMX+60  SUBTRACT #CIDN              N0120780
                          BSC  L  SU540,+-  BR IF THE TWO IDS ARE EQUAL N0120790
                          MDX   2 1         INCR #CIDN CNT, SKIP IF Z   N0120800
                          MDX     SU520     BRANCH TO TEST NEXT CARID   N0120810
                          BSC  L  ERRUP     BRANCH TO ERROR RETURN      N0120820
                    *                                                   N0120830
                    *     MOVE ITEMS FROM XR2 POSITION IN NON-SYSTEM    N0120840
                    *     DCOM TO XR1 POSITION IN SYSTEM DCOM           N0120850
                    *                                                   N0120860
                    SU540 MDX   2 5         SET CARID COUNT POSITIVE    N0120870
                          NOP                                           N0120880
                          STX   1 SU950     STORE AS DRIVE CODE         N0120890
                          LD      SU950     FETCH DRIVE CODE TO ACC     N0120900
                          SLA     12        SHIFT DR CODE TO BITS 0-3   N0120910
                          STO     SU950     SAVE AS DRIVE CODE MASK     N0120920
                    *                                                   N0120930
                          LD   L2 DCOMX+35  FETCH ADDR OF END OF UA-ADJ N0120940
                          STO  L1 #ANDU     STORE TO SYSTEM DCOM        N0120950
                    *                                                   N0120960
                          LD   L2 DCOMX+40  FETCH ADDR OF END OF UA-BAS N0120970
                          STO  L1 #BNDU     STORE TO SYSTEM DCOM        N0120980
                    *                                                   N0120990
                          LD   L2 DCOMX+45  FETCH FILE PROTECT ADDRESS  N0121000
                          BSI     SU550     UPDATE DRIVE CODE           N0121010
                          STO  L1 #FPAD     STORE TO SYSTEM DCOM        N0121020
                    *                                                   N0121030
                          LD   L2 DCOMX+55  FETCH CARTRIDGE ID          N0121040
                          STO  L1 #CIDN     STORE TO SYSTEM DCOM        N0121050
                    *                                                   N0121060
                          LD   L2 DCOMX+60  FETCH SECTOR ADDRESS OF CIB N0121070
                          BSI     SU550     UPDATE DRIVE CODE           N0121080
                          STO  L1 #CIBA     STORE TO SYSTEM DCOM        N0121090
                    *                                                   N0121100
                          LD   L2 DCOMX+65  FETCH SCTR ADDRESS OF SCRA  N0121110
                          BSI     SU550     UPDATE DRIVE CODE           N0121120
                          STO  L1 #SCRA     STORE TO SYSTEM DCOM        N0121130
                    *                                                   N0121140
                          LD   L2 DCOMX+70  FETCH FORMAT OF PROG IN WS  N0121150
                          STO  L1 #FMAT     STORE TO SYSTEM DCOM        N0121160
                    *                                                   N0121170
                          LD   L2 DCOMX+75  FETCH FLET SECTOR ADDRESS   N0121180
                          BSI     SU550     UPDATE DRIVE CODE           N0121190
                          STO  L1 #FLET     STORE TO SYSTEM DCOM        N0121200
                    *                                                   N0121210
                          LD   L2 DCOMX+80  FETCH LET SECTOR ADDRESS    N0121220
                          BSI     SU550     UPDATE DRIVE CODE           N0121230
                          STO  L1 #ULET     STORE TO SYSTEM DCOM        N0121240
                    *                                                   N0121250
                          LD   L2 DCOMX+85  FETCH BLK CNT OF PROG IN WS N0121260
                          STO  L1 #WSCT     STORE TO SYSTEM DCOM        N0121270
                    *                                                   N0121280
                          LD   L2 DCOMX+90  FETCH SCTR ADDR OF CUSHION  N0121290
                          STO  L1 #CSHN     STORE TO SYSTEM DCOM        N0121300
                    *                                                   N0121310
                          BSC  I  SU500     RETURN                      N0121320
                    *                                                   N0121330
                    *     UPDATE DRIVE CODE OF SECTOR ADDRESS           N0121340
                    *                                                   N0121350
                    SU550 DC      *-*       ENTRY/RETURN ADDRESS        N0121360
                          SLA     4         SHIFT OUT PRESENT DR CODE   N0121370
                          SRA     4         SHIFT SECTOR ADDRESS BACK   N0121380
                          OR      SU950     MASK IN NEW DRIVE CODE      N0121390
                          BSC  I  SU550     RETURN                      N0121400
                    *                                                   N0121410
                    SU950 DC      *-*       DRIVE CODE                  N0121420
                          HDNG    SYSUP - UPDATE SYSTEM DCOM            N0121430
                    *                                                   N0121440
                    *     STORE AREA CODE AND DEFECTIVE CYLINDER        N0121450
                    *     ADDRESSES TO COMMA                            N0121460
                    *                                                   N0121470
                    SU600 DC      *-*       ENTRY/RETURN ADDRESS        N0121480
                    *                                                   N0121490
                          STX   1 SU976     SAVE LOG DR NO.        2-11 N0121500
                          STX   2 SU977     SAVE PHY DR NO.        2-11 N0121510
                          LD   L2 SU904     FETCH AND STORE             N0121520
                          STO  L  SU978     *CART LIST ID TO PRINT SUBR N0121530
                    *                                                   N0121540
                          LD   L2 SU924     FETCH AREA CODE             N0121550
                          STO  L1 $ACDE     STORE TO COMMA              N0121560
                    *                                                   N0121570
                          LDX  I1 SU960     FETCH ADDR OF DEF CYL ADDR  N0121580
                          LDX  L2 *-*       FETCH ADDRESS IN COMMA AT   N0121590
                    SU620 EQU     *-1       *WHICH TO STORE DEF CYL     N0121600
                          LD    1 0         STORE                       N0121610
                          STO   2 0         *DEFECTIVE                  N0121620
                          LD    1 1         *CYLINDER                   N0121630
                          STO   2 1         *ADDRESSES                  N0121640
                          LD    1 2         *TO                         N0121650
                          STO   2 2         *COMMA                      N0121660
                    *                                                   N0121670
                          MDX  L  SU620,3   INCR STORE ADDR OF DEF CYL  N0121680
                    * 1 REDUNDANT INSTRUCTION REMOVED              2-11 N0121690
                          LDX  I1 SU976     RESTORE XR1                 N0121700
                          LDX  I2 SU977     RESTORE XR2                 N0121710
                    *                                                   N0121720
                          BSC  I  SU600     RETURN                      N0121730
                    *                                                   N0121740
                    SU960 DC      *-*       ADDR OF DEF CYL ADDRESSES   N0121750
                          HDNG    SYSUP - UPDATE SYSTEM DCOM            N0121760
                    *                                                   N0121770
                    *     PRINT LOG DRIVE, SPEC CART, AVAIL CART AND    N0121780
                    *     PHY DRIVE                                     N0121790
                    *                                                   N0121800
                    SU700 DC      *-*       ENTRY/RETURN ADDRESS        N0121810
                    *                                                   N0121820
                          SRT     16        LINE SWITCH TO EXTENTION    N0121830
                          LD      SU971     FETCH AND STORE INITIAL     N0121840
                          STO     SU984     *PRINT AREA ADDRESS         N0121850
                    *                                                   N0121860
                    *     CLEAR THE PRINT AREA                          N0121870
                    *                                                   N0121880
                          LDX   2 -22       WORD COUNT TO XR2           N0121890
                          LD      SU974     FETCH BLANK WORD            N0121900
                    SU710 STO  L2 SU973+22  STORE TO PRINT AREA         N0121910
                          MDX   2 1         INCR WORD CNT, SKIP IF ZERO N0121920
                          MDX     SU710     BRANCH TO STORE NEXT WORD   N0121930
                    *                                                   N0121940
                          SLT     16        LINE SWITCH TO ACCUMULATOR  N0121950
                          BSC  L  SU720,+-  BRANCH TO PRINT HALF LINE   N0121960
                    *                                                   N0121970
                    *     CONVERT AND STORE LOGICAL DRIVE               N0121980
                    *                                                   N0121990
                          MDX  L  SU984,2   INCREMENT PRINT AREA ADDR   N0122000
                          LD      SU976     FETCH LOGICAL DRIVE         N0122010
                          BSI     SU800     BR TO CONVT TO EBCDIC  2-11 N0122020
                    *                                                   N0122030
                    *     CONVERT AND STORE SPECIFIED CARTRIDGE ID      N0122040
                    *                                                   N0122050
                          MDX  L  SU984,4   INCREMENT PRINT AREA ADDR   N0122060
                          LD   L1 SU902     FETCH SPEC CARTRIDGE ID     N0122070
                          BSI     SU800     BR TO CONVT TO EBCDIC  2-11 N0122080
                          MDX     SU740                                 N0122090
                    *                                                   N0122100
                    *     CONVERT AND STORE AVAILABLE CARTRIDGE ID      N0122110
                    *                                                   N0122120
                    SU720 MDX  L  SU984,10  INCREMENT PRINT AREA ADDR   N0122130
                    *                                                   N0122140
                    SU740 MDX  L  SU984,4   INCREMENT PRINT AREA ADDR   N0122150
                          LD      SU978     FETCH AVAIL CARTRIDGE ID    N0122160
                          BSI     SU800     BR TO CONVT TO EBCDIC  2-11 N0122170
                    *                                                   N0122180
                    *     CONVERT AND STORE PHYSICAL DRIVE              N0122190
                    *                                                   N0122200
                          MDX  L  SU984,4   INCREMENT PRINT AREA ADDR   N0122210
                          LD      SU977     FETCH PHYSICAL DRIVE        N0122220
                          BSI     SU800     BR TO CONVT TO EBCDIC  2-11 N0122230
                    *                                                   N0122240
                    *     PRINT THE PRINT AREA                          N0122250
                    *                                                   N0122260
                          LDD     SU970     FETCH FUNC CODE/I/O AR ADDR N0122270
                          BSI  L  OUTPT     BRANCH TO PRINT THE LINE    N0122280
                          MDX  L  $PBSY,0   SKIP NEXT IF PRINT COMPLETE N0122290
                          MDX     *-3       BR TO TEST PRINT COMPLETE   N0122300
                    *                                                   N0122310
                          BSC  I  SU700     RETURN                      N0122320
                    *                                                   N0122330
                    *     CONSTANTS AND WORK AREA                       N0122340
                    *                                                   N0122350
                          BSS  E  0                                     N0122360
                    SU970 DC      /7001     PRINT FUNCTION CODE         N0122370
                    SU971 DC      SU972     ADDRESS OF PRINT AREA       N0122380
                    SU972 DC      22        WORD COUNT OF PRINT AREA    N0122390
                    SU973 BSS     22        PRINT AREA                  N0122400
                    SU974 DC      /4040     EBCDIC BLANK WORD           N0122410
                    SU976 DC      *-*       LOGICAL DRIVE               N0122420
                    SU977 DC      *-*       PHYSICAL DRIVE              N0122430
                    SU978 DC      *-*       AVAILABLE CARTRIDGE ID      N0122440
                          HDNG    SYSUP - UPDATE SYSTEM DCOM            N0122450
                    *************************************************** N0122460
                    * THIS SUBROUTINE CONVERTS A 16 BIT BINARY NUMBER * N0122470
                    * TO FOUR EBCDIC VALUES THAT ARE THE EQUIVALENT IN* N0122480
                    * HEX.                                            * N0122490
                    *  INPUT  - 16 BIT BINARY NUMBER IN ACCUMULATOR   * N0122500
                    *  OUTPUT - FOUR EBCDIC VALUES PACKED TWO PER WORD* N0122510
                    *           AND STORED IN THE PRINT BUFFER        * N0122520
                    *                                                 * N0122530
                    * XR1 AND XR2 ARE SAVED AND RESTORED              * N0122540
                    *************************************************** N0122550
                    *                                                   N0122560
                    SU800 DC      *-*       ENTRY/RETURN ADDR      2-11 N0122570
                    *                                              2-11 N0122580
                          SRT     16        NUMBER TO EXT          2-11 N0122590
                          STX   1 SU890+1   SAVE XR1               2-11 N0122600
                          STX   2 SU890+3   SAVE XR2               2-11 N0122610
                          LDX   1 -2        SET OUTPUT WORD CNT    2-11 N0122620
                    *                                              2-11 N0122630
                    SU820 LDX   2 -2        SET CHAR PER WORD CNT  2-11 N0122640
                          STO     SU983     STORE TEMPORARILY      2-11 N0122650
                          SRA     16        CLEAR ACC TO ZERO      2-11 N0122660
                          SLT     4         GET 4 BITS TO CONVT    2-11 N0122670
                          S       SU980     SUB 9 TO CHK 0-9 OR A-F2-11 N0122680
                          BSC     +         SKIP IF A-F            2-11 N0122690
                          A       SU981     ADD /0039              2-11 N0122700
                          A       SU982     ADD /00C0              2-11 N0122710
                          SLA     8         SHIFT TO LEFT OF WORD  2-11 N0122720
                          MDX   2 1         DECRE CHAR PER WD CNT  2-11 N0122730
                          MDX     SU820+1   CONT IF WD NOT FULL    2-11 N0122740
                    *                                              2-11 N0122750
                          SRA     8         OTHERWISE, SHIFT JUST  2-11 N0122760
                          OR      SU983     *CNVTD WD TO RT,'OR'IN 2-11 N0122770
                          STO  I  SU984     *1ST HALF,STO TO PRINT 2-11 N0122780
                          MDX  L  SU984,1   INCRE PRINT AREA ADDR  2-11 N0122790
                          SRA     16        SET TEMP STORE AREA    2-11 N0122800
                          STO     SU983     *TO ZERO               2-11 N0122810
                    *                                              2-11 N0122820
                          MDX   1 1         DECRE OUTPUT WD COUNT  2-11 N0122830
                          MDX     SU820     IF TWO WORDS NOT OUTPUT2-11 N0122840
                    *                       *CONTINUE CONVERSION   2-11 N0122850
                    *                                              2-11 N0122860
                    SU890 LDX  L1 *-*       *OTHERWISE, RESTORE    2-11 N0122870
                          LDX  L2 *-*       *REGISTERS             2-11 N0122875
                          BSC  I  SU800     *AND RETURN TO CONTINUE2-11 N0122880
                    *                                              2-11 N0122890
                    *     CONSTANTS AND WORKAREA                   2-11 N0122900
                    *                                              2-11 N0122910
                    SU980 DC      /0009     CONVERSION CONSTANTS   2-11 N0122920
                    SU981 DC      /0039     *                      2-11 N0122930
                    SU982 DC      /00C0     *                      2-11 N0122940
                    SU983 DC      *-*       TEMP STOR FOR CNVT CHAR2-11 N0122950
                    SU984 DC      *-*       PRINT AREA ADDRESS     2-11 N0122960
                    *                                                   N0122970
                    *                                                   N0122980
                          BSS     BUFFR-2-*  PATCH AREA                 N0122990
                    *                                                   N0123000
                    *                                                   N0123010
                    JB999 DC      @SCTR     END OF PHASE 2 - JOB PROC   N0123020
                          HDNG    SUPV PHASE 3 - DELETE TEMPORARY LET   N0123030
                    *************************************************** N0123040
                    *STATUS - VERSION 2, MODIFICATION 5               * N0123050
                    *                                                 * N0123060
                    *FUNCTION/OPERATION -                             * N0123070
                    *   * DELETE ALL TEMPORARY LET ENTRIES FROM ALL   * N0123080
                    *     DISK CARTRIDGES DEFINED FOR THE JOB.        * N0123090
                    *                                                 * N0123100
                    *ENTRY POINTS -                                   * N0123110
                    *     PROGRAM START - JB300-4                     * N0123120
                    *                                                 * N0123130
                    *INPUT - N/A                                      * N0123140
                    *                                                 * N0123150
                    *OUTPUT - N/A                                     * N0123160
                    *                                                 * N0123170
                    *EXTERNAL REFERENCES -                            * N0123180
                    *   * IN COMMA -                                  * N0123190
                    *     $DBSY                                       * N0123200
                    *     $EXIT                                       * N0123210
                    *     $FLSH                                       * N0123220
                    *     $PHSE                                       * N0123230
                    *     $ULET                                       * N0123240
                    *   * IN DCOM -                                   * N0123250
                    *     #ANDU                                       * N0123260
                    *     #BNDU                                       * N0123270
                    *     #CIDN                                       * N0123280
                    *     #ECNT                                    2-4* N0123290
                    *   * IN MCRA -                                   * N0123300
                    *     RA900                                       * N0123310
                    *     WDCOM                                       * N0123320
                    *   * SUBROUTINES -                               * N0123330
                    *     DZ000   RESIDENT DISK I/O SUBROUTINE.       * N0123340
                    *                                                 * N0123350
                    *EXITS -                                          * N0123360
                    *   * NORMAL -                                    * N0123370
                    *     AN EXIT IS MADE TO SUPV PHASE 5 TO       2-4* N0123380
                    *     PROCESS *EQUAT RECORDS IF THEY FOLLOW    2-4* N0123390
                    *     THE JOB RECORD.  OTHERWISE, AN EXIT IS   2-4* N0123400
                    *     MADE TO THE MCRA (PHASE 1) TO READ THE   2-4* N0123410
                    *     NEXT RECORD.                             2-4* N0123420
                    *   * ERROR -                                     * N0123430
                    *     AN EXIT IS MADE TO THE MCRA TO PRINT THE    * N0123440
                    *     ERROR MESSAGE AND ABORT THE JOB.            * N0123450
                    *                                                 * N0123460
                    *TABLES/WORK AREAS -                              * N0123470
                    *   * DCOM    A 320 WORD BUFFER USED FOR SYSTEM   * N0123480
                    *             DISK COMMUNICATIONS AREA (DCOM) I/O.* N0123490
                    *   * BUFFER  A 320 WORD BUFFER USED FOR LET AND  * N0123500
                    *             SATELLITE DCOM I/O.                 * N0123510
                    *   * JB936   AN 8 WORD TABLE USED TO STORE THE   * N0123520
                    *             SECTOR ADDRESSES OF SECTORS         * N0123530
                    *             CONTAINING TEMPORARY LET ITEMS.     * N0123540
                    *                                                 * N0123550
                    *ATTRIBUTES -                                     * N0123560
                    *   * ABSOLUTE                                    * N0123570
                    *   * REUSABLE                                    * N0123580
                    *                                                 * N0123590
                    *NOTES - N/A                                      * N0123600
                    *                                                 * N0123610
                    *************************************************** N0123620
                          HDNG    SUPV PHASE 3 - DELETE TEMPORARY LET   N0123630
                          ORG     @PROC-2   PHASE 3 I/O AREA ADDRESS    N0123640
                    *                                                   N0123650
*SBRKMET 70          *SUP PHASE 3 - DELETE TEMPORARY LET          V2M04 N0123660
                          DC      JB599-*   WORD COUNT                  N0123670
                          DC      @DELT     PHASE ID                    N0123680
                          HDNG    SUPV PHASE 3 - DELETE TEMPORARY LET   N0123690
                          LDX   1 @DELT     SET                         N0123700
                          STX  L1 $PHSE     *SUPERVISOR PHASE 3 INDR    N0123710
                          NOP               A WAIT MAY BE PATCHED HERE  N0123720
                    *                                                   N0123730
                    *     DELETE TEMPORARY ITEMS FROM LET               N0123740
                    *                                                   N0123750
                    JB300 LDX   1 -5        SET CARTRIDGE COUNT TO XR1  N0123760
                    *                                                   N0123770
                    JB310 LD   L1 #ANDU+5   FETCH ADJUSTED ADDRESS      N0123780
                          S    L1 #BNDU+5   SUBTRACT BASE ADDRESS       N0123790
                          BSC  L  JB500,+-  BR IF ADJ AND BASE EQUAL    N0123800
                          LD   L1 $ULET+5   FETCH SECTOR ADDRESS OF LET N0123810
                          STO  L  BUFFR-1   STORE TO LET I/O AREA       N0123820
                          LD   L  JB943     FETCH ADDR OF LET I/O AREA  N0123830
                          SRT     16        SHIFT TO EXT, ACC = 0       N0123840
                          STO  L  JB939     CLEAR BRANCH SWITCH         N0123850
                          BSI  L  DZ000     BRANCH TO DISK READ         N0123860
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  N0123870
                          MDX     *-3       BR TO TEST READ COMPLETE    N0123880
                          LD   L  BUFFR+1   FETCH ADDR OF USER AREA     N0123890
                          SLA     4         MULTIPLY BY SIXTEEN         N0123900
                          STO  L  JB933     INITIALIZE DB SUM           N0123910
                          S    L1 #BNDU+5   TEST FOR                2-4 N0123920
                          LDX  L2 -318      *AND BRANCH IF          2-4 N0123930
                          BSC  L  JB340,-   *EQUAL TO BASE ADDRESS  2-4 N0123940
                    *                                                   N0123950
                    JB320 LDX  L2 -315      WORD COUNT TO XR2           N0123960
                    JB330 LD   L  JB933     FETCH DB SUM                N0123970
                          A    L2 BUFFR+322 ADD DB COUNT                N0123980
                          STO  L  JB933     STORE NEW DB SUM            N0123990
                          S    L1 #BNDU+5   SUBTRACT BASE ADDRESS       N0124000
                          BSC  L  JB340,-   BR IF DB SUM EQ BASE ADDR   N0124010
                          MDX   2 3         INCREMENT XR2, SKIP IF ZERO N0124020
                          MDX     JB330     BR TO FETCH NEXT DB COUNT   N0124030
                          LD   L  BUFFR-1   FETCH LET SECTOR ADDRESS    N0124040
                          AND  L  JB932     MASK OUT ALL BUT DRIVE CODE N0124050
                          OR   L  BUFFR+4   MASK IN NEXT LET SCTR ADDR  N0124060
                          STO  L  BUFFR-1   STORE TO LET I/O AREA       N0124070
                          LD   L  JB943     FETCH ADDR OF LET I/O AREA  N0124080
                          SRT     16        SHIFT TO EXT, ACC = 0       N0124090
                          BSI  L  DZ000     BRANCH TO DISK READ         N0124100
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  N0124110
                          MDX     *-3       BR TO TEST READ COMPLETE    N0124120
                          MDX     JB320     BRANCH TO CONTINUE SEARCH   N0124130
                    *                                                   N0124140
                    *     END OF PERMANENT LET FOUND                    N0124150
                    *     SEARCH FOR END OF TEMPORARY LET               N0124160
                    *                                                   N0124170
                    JB340 LDX   3 1         SET TEMP LET SECTORS COUNT  N0124180
                          LD   L  BUFFR-1   FETCH THIS LET SCTR ADDRESS N0124190
                          STO  L3 JB936-1   SAVE FOR FUTURE REFERENCE   N0124200
                    JB350 MDX   2 3         DECREMENT XR2, SKIP IF ZERO N0124210
                          MDX     JB360     BR TO CALCULATE NEW DB SUM  N0124220
                    JB355 LD   L  BUFFR-1   FETCH LET SECTOR ADDRESS    N0124230
                          AND  L  JB932     MASK OUT ALL BUT DRIVE CODE N0124240
                          OR   L  BUFFR+4   MASK IN NEXT LET SCTR ADDR  N0124250
                          STO  L  BUFFR-1   STORE TO LET I/O AREA       N0124260
                          LD   L  JB943     FETCH ADDR OF LET I/O AREA  N0124270
                          SRT     16        SHIFT TO EXT, ACC = 0       N0124280
                          BSI  L  DZ000     BRANCH TO DISK READ         N0124290
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  N0124300
                          MDX     *-3       BR TO TEST READ COMPLETE    N0124310
                          MDX   3 1         INCREMENT TEMP LET SCTR CNT N0124320
                          LD   L  BUFFR-1   FETCH THIS LET SCTR ADDRESS N0124330
                          STO  L3 JB936-1   SAVE FOR FUTURE REFERENCE   N0124340
                          LDX  L2 -315      WORD COUNT TO XR2           N0124350
                          MDX  L  JB939,0   SKIP IF BRANCH SWITCH ZERO  N0124360
                          MDX     JB365     BRANCH                      N0124370
                    *                                                   N0124380
                    JB360 LD      JB933     FETCH DB SUM                N0124390
                          A    L2 BUFFR+322 ADD DB COUNT                N0124400
                          STO     JB933     STORE NEW DB SUM            N0124410
                          S    L1 #ANDU+5   SUBTRACT ADJUSTED ADDRESS   N0124420
                          BSC  L  JB350,Z   BR IF DB SUM LT ADJ ADDRESS N0124430
                    *                                                   N0124440
                    *     END OF TEMPORARY LET FOUND                    N0124450
                    *     DELETE TEMPORARY ITEMS                        N0124460
                    *                                                   N0124470
                    JB363 MDX   2 3         POINT TO DUMMY ENTRY        N0124480
                          MDX     JB365     BRANCH IF IN SAME SECTOR    N0124490
                          LD      JB932     SET BRANCH                  N0124500
                          STO     JB939     *SWITCH NON-ZERO            N0124510
                          MDX     JB355     BRANCH TO READ NEXT SECTOR  N0124520
                    JB365 LD   L  BUFFR+4   FETCH SCTR ADDR OF NEXT 2-5 N0124530
                          STO     JB937     *LET/FLET AND SAVE      2-5 N0124540
                          LD   L2 BUFFR+320  SEARCH LET FOR         2-5 N0124550
                          S       JB930     *LAST DUMMY ENTRY       2-5 N0124560
                          BSC     Z         SKIP IF FOUND           2-5 N0124570
                          MDX     JB363     BRANCH IF NOT FOUND     2-5 N0124580
                          LD   L2 BUFFR+322 FETCH SIZE OF WORKING STG   N0124590
                          STO     JB934     SAVE NEW SIZE OF WRK STG    N0124600
                          LD   L1 #ANDU+5   FETCH ADJUSTED ADDRESS      N0124610
                          STO     JB934+1   SAVE NEW ADJUSTED ADDRESS   N0124620
                    *                                                   N0124630
                          MDX  L2 318       RESET WORD COUNT POSITIVE   N0124640
                          NOP                                           N0124650
                    *                                                   N0124660
                    JB370 SRA     16        CLEAR ACCUMULATOR           N0124670
                          STO  L2 BUFFR+2   SET FIRST HALF OF NAME ZERO N0124680
                          STO  L2 BUFFR+3   SET SECND HALF OF NAME ZERO N0124690
                          STO  L2 BUFFR+4   SET DB COUNT ZERO           N0124700
                          MDX   2 -3        DECREMENT XR2, SKIP IF ZERO N0124710
                          MDX     JB380     BR FOR NEW ADJ ADDR,WS SIZE N0124720
                    *                                                   N0124730
                          LDX   2 -5        CLEAR                       N0124740
                          SRA     16        *FIRST                      N0124750
                    JB375 STO  L2 BUFFR+5   *FIVE                       N0124760
                          MDX   2 1         *WORDS                      N0124770
                          MDX     JB375     *OF SECTOR                  N0124780
                          LDD  L  JB942     FETCH FUNC CODE/I/O AR ADDR N0124790
                          BSI  L  DZ000     BRANCH TO DISK WRITE        N0124800
                          MDX  L  $DBSY,0   SKIP NEXT IF WRITE COMPLETE N0124810
                          MDX     *-3       BR TO TEST WRITE COMPLETE   N0124820
                          MDX   3 -1        DECREMENT TEMP LET SCTR CNT N0124830
                          NOP                                           N0124840
                    *                                                   N0124850
                          LD   L3 JB936-1   FETCH ADDR OF PREV LET SCTR N0124860
                          STO  L  BUFFR-1   STORE TO LET I/O AREA       N0124870
                          LD   L  JB943     FETCH ADDR OF LET I/O AREA  N0124880
                          SRT     16        SHIFT TO EXT, ACC = 0       N0124890
                          BSI  L  DZ000     BRANCH TO DISK READ         N0124900
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  N0124910
                          MDX     *-3       BR TO TEST READ COMPLETE    N0124920
                          LDX  L2 315       WORD COUNT TO XR2           N0124930
                    *                                                   N0124940
                    JB380 LD      JB934     FETCH SIZE OF WRK STG       N0124950
                          A    L2 BUFFR+4   ADD DB COUNT                N0124960
                          STO     JB934     SAVE NEW SIZE OF WRK STG    N0124970
                          LD      JB934+1   FETCH ADJUSTED ADDRESS      N0124980
                          S    L2 BUFFR+4   SUBTRACT DB COUNT           N0124990
                          STO     JB934+1   SAVE NEW ADJUSTED ADDRESS   N0125000
                          S    L1 #BNDU+5   SUBTRACT BASE ADDRESS       N0125010
                          BSC  L  JB400,+-  BR IF BASE AND ADJ EQUAL    N0125020
                          MDX     JB370     BRANCH TO TEST BASE AND ADJ N0125030
                    *                                                   N0125040
                    *     CONSTANTS AND WORK AREA                       N0125050
                    *                                                   N0125060
                          BSS  E  0         FORCE NEXT LOC TO BE EVEN   N0125070
                    JB930 DC      /7112     DUMMY PROGRAM NAME          N0125080
                          DC      /4528     *IN NAME CODE               N0125090
                    JB932 DC      /F000     MASK TO SAVE DRIVE CODE     N0125100
                    JB933 DC      *-*       DB SUM                      N0125110
                    JB934 DC      *-*       SIZE OF WORKING STORAGE     N0125120
                          DC      *-*       ADDR OF ADJ END OF UA       N0125130
                    JB936 BSS     8         TEMPORARY LET SECTOR ADDRS  N0125140
                    JB937 DC      *-*       SCTR ADDR OF NEXT LET/FLET  N0125150
                    JB938 DC      *-*       NO. OF WORDS AVAILABLE      N0125160
                    JB939 DC      *-*       BRANCH SWITCH               N0125170
                    JB940 DC      @SCTR     LET SECTOR WORD COUNT       N0125180
                    JB942 DC      /0001     WRITE FUNCTION CODE         N0125190
                    JB943 DC      BUFFR-2   DISK BUFFER I/O AREA ADDR   N0125200
                    JB944 DC      2         FIRST SLET SCTR ADDR-1  2-4 N0125210
                    *                                                   N0125220
                    *     TEMPORARY ITEMS DELETED                       N0125230
                    *                                                   N0125240
                    JB400 STX   2 JB938     STORE NO. OF WORDS USED     N0125250
                          LD      JB380-1   FETCH NO. OF WORDS  (315)   N0125260
                          S       JB938     SUBTRACT NO. OF WORDS USED  N0125270
                          STO     JB938     SAVE NO. OF WORDS AVAILABLE N0125280
                          BSC  L  JB420,-   BRANCH IF NOT NEGATIVE      N0125290
                    *                                                   N0125300
                          LD   L  BUFFR+4   FETCH ADDR OF NEXT LET SCTR N0125310
                          STO  L  BUFFR-1   STORE TO LET I/O AREA       N0125320
                          LD      JB943     FETCH ADDR OF LET I/O AREA  N0125330
                          SRT     16        SHIFT TO EXT, ACC = 0       N0125340
                          BSI  L  DZ000     BRANCH TO DISK READ         N0125350
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  N0125360
                          MDX     *-3       BR TO TEST READ COMPLETE    N0125370
                          LDX  L2 313       FETCH WORD COUNT TO XR2     N0125380
                          STX   2 JB938     SAVE NO. OF WDS AVAILABLE   N0125390
                          LDX   2 3         WORK COUNT TO XR2           N0125400
                    *                                                   N0125410
                    JB420 LD      JB934     FETCH NEW SIZE OF WRK STG   N0125420
                          STO  L2 BUFFR+4   STORE TO LET I/O AREA       N0125430
                          LD      JB930     FETCH 1ST HALF DUMMY NAME   N0125440
                          STO  L2 BUFFR+2   STORE TO LET I/O AREA       N0125450
                          LD      JB930+1   FETCH 2ND HALF DUMMY NAME   N0125460
                          STO  L2 BUFFR+3   STORE TO LET I/O AREA       N0125470
                          LD      JB937     FETCH SCTR ADDR OF NEXT     N0125480
                          STO  L  BUFFR+4   *LET/FLET, STORE TO LET I/O N0125490
                          LD      JB938     FETCH NO. OF WDS AVAILABLE  N0125500
                          STO  L  BUFFR+3   *IN SCTR, STORE TO LET I/O  N0125510
                          LD   L1 #BNDU+5   SET ADDR OF ADJ END OF UA   N0125520
                          STO  L1 #ANDU+5   *EQUAL TO ADDR OF BASE END  N0125530
                    *                                                   N0125540
                          LDD  L  JB942     FETCH FUNC CODE/I/O AR ADDR N0125550
                          BSI  L  DZ000     BRANCH TO DISK WRITE        N0125560
                          MDX  L  $DBSY,0   SKIP NEXT IF WRITE COMPLETE N0125570
                          MDX     *-3       BR TO TEST WRITE COMPLETE   N0125580
                    *                                                   N0125590
                    *     UPDATE #ANDU ON THE SATELLITE CARTRIDGE       N0125600
                    *                                                   N0125610
                          LD   L1 $ULET+5   FETCH LET SECTOR ADDRESS    N0125620
                          AND     JB932     MASK OUT ALL BUT DRIVE CODE N0125630
                          BSC  L  JB500,+   BRANCH IF MASTER CARTRIDGE  N0125640
                          OR   L  DCOM-1    MASK IN DCOM SECTOR ADDRESS N0125650
                          STO  L  BUFFR-1   STORE TO DCOM I/O AREA      N0125660
                          LD   L  JB943     FETCH ADDR OF DCOM I/O AREA N0125670
                          SRT     16        SHIFT TO EXT, ACC = 0       N0125680
                          BSI  L  DZ000     BRANCH TO DISK READ         N0125690
                          MDX  L  $DBSY,0   SKIP NEXT IF READ COMPLETE  N0125700
                          MDX     *-3       BR TO TEST READ COMPLETE    N0125710
                    *                                                   N0125720
                          LDX   2 -5        CARTRIDGE COUNT TO XR2      N0125730
                    JB460 LD   L1 #CIDN+5   FETCH ID OF SATELLITE CART  N0125740
                          S    L2 BUFFR+60  TEST FOR AND                N0125750
                          BSC  L  JB480,+-  *BRANCH IF IDS ARE THE SAME N0125760
                          MDX   2 1         INCR CART CNT, SKIP IF ZERO N0125770
                          MDX     JB460     BRANCH TO TEST NEXT ID      N0125780
                          STO  L  $FLSH     SET ABORT JOB INDICATOR     N0125790
                          LDX   3 5         POINT TO ERROR MESSAGE M 15 N0125800
                          BSI  L  RA900     BRANCH TO PRINT THE MESSAGE N0125810
                    JB480 LD   L2 BUFFR+45  FETCH #BNDU AND             N0125820
                          STO  L2 BUFFR+40  *STORE TO #ANDU             N0125830
                    *                                                   N0125840
                          LDD  L  JB942     FETCH FUNC CODE/I/O AR ADDR N0125850
                          BSI  L  DZ000     BRANCH TO DISK WRITE        N0125860
                          MDX  L  $DBSY,0   SKIP NEXT IF WRITE COMPLETE N0125870
                          MDX     *-3       BR TO TEST WRITE COMPLETE   N0125880
                    *                                                   N0125890
                    JB500 MDX   1 1         INCR CART CNT, SKIP IF ZERO N0125900
                          MDX     *+1                                   N0125910
                          MDX     *+2                                   N0125920
                          BSC  L  JB310     BR TO ADJUST NEXT CARTRIDGE N0125930
                    *                                                   N0125940
                          BSI  L  WDCOM     BRANCH TO WRITE DCOM        N0125950
                          LD   L  #ECNT     FETCH NO. OF EQUAT RCDS 2-4 N0125960
                          BSC  L  $EXIT,+   BR TO FETCH MCRA IF Z   2-4 N0125970
                    *                                               2-4 N0125980
                    *     IF THE MASTER CARTRIDGE HAS CHANGED THE   2-4 N0125990
                    *     SLET INFORMATION FOR SUPV PHASE 5 MAY     2-4 N0126000
                    *     HAVE CHANGED ALSO.                        2-4 N0126010
                    *                                               2-4 N0126020
                          LDX   1 -3        XR1 = NO. OF SLET SCTRS 2-4 N0126030
                          LD   L  JB944     FETCH AND STORE         2-4 N0126040
                          STO  L  BUFFR-1   *SLET SECTOR -1         2-4 N0126050
                    JB520 MDX  L  BUFFR-1,1 INCREMENT SECTOR ADDR   2-4 N0126060
                          LD   L  JB943     FETCH I/O AREA ADDRESS  2-4 N0126070
                          SRT     16        SHIFT TO EXT, ACC = 0   2-4 N0126080
                          BSI  L  DZ000     BR TO READ A SLET SCTR  2-4 N0126090
                    JB540 MDX  L  $DBSY,0   SK NEXT IF RD COMPLETE  2-4 N0126100
                          MDX     JB540     BR TO TEST RD COMPLETE  2-4 N0126110
                    *                                               2-4 N0126120
                          LDX  L2 -@SCTR    XR2 = SECTOR WORD COUNT 2-4 N0126130
                    JB560 LD   L  SUPV5     FETCH SUPV PH 5 PH ID   2-4 N0126140
                          S    L2 BUFFR+@SCTR  TEST FOR AND BRANCH  2-4 N0126150
                          BSC  L  JB580,+-  *IF MATCH FOUND IN SLET 2-4 N0126160
                          MDX   2 4         DECR WD CNT, SK IF ZERO 2-4 N0126170
                          MDX     JB560     BR TO TEST NEXT PH ID   2-4 N0126180
                          MDX   1 1         DECR SCTR CNT, SK IF Z  2-4 N0126190
                          MDX     JB520     BR TO FETCH NEXT SLET   2-4 N0126200
                          STO  L  $FLSH     SET ABORT JOB INDR ON   2-4 N0126210
                          LDX   3 6         POINT TO ERROR MSG M 16 2-4 N0126220
                          BSI  L  RA900     BR TO PRINT THE MESSAGE 2-4 N0126230
                    *                                               2-4 N0126240
                    JB580 LDX  L1 SUPV5     XR1 PTS TO PHASE 5 SLET 2-4 N0126250
                          LDD  L2 BUFFR+@SCTR+2  FETCH AND STORE    2-4 N0126260
                          STD   1 2         *WD CNT AND SCTR ADDR   2-4 N0126270
                          BSC  L  RA600     BR TO FETCH PHASE 5     2-4 N0126280
                    *                                                   N0126290
                    *                                                   N0126300
                          BSS     @PROC+2*@SCTR-*-1  PATCH AREA     2-4 N0126310
                    *                                                   N0126320
                    *                                                   N0126330
                    JB599 DC      0         END OF PHASE 3 - DELETE T   N0126340
                          HDNG    SUPV PHASE 4 - XEQ PROCESSING         N0126350
                    *************************************************** N0126360
                    *STATUS - VERSION 2, MODIFICATION 9               * N0126370
                    *                                                 * N0126380
                    *FUNCTION/OPERATION -                             * N0126390
                    *   * UNPACK THE MAINLINE NAME IN COLUMNS 8-12 OF * N0126400
                    *     THE XEQ RECORD AND CONVERT TO NAMECODE.     * N0126410
                    *   * SET THE CORE MAP INDICATOR.                 * N0126420
                    *   * SET THE NUMBER OF SUPERVISOR CONTROL RECORDS* N0126430
                    *   * SET THE REQUESTED DISK SUBROUTINE INDICATOR.* N0126440
                    *   * CONVERT THE CARTRIDGE ID IN COLUMN 21-24 OF * N0126450
                    *     THE XEQ RECORD TO BINARY.                   * N0126460
                    *   * SET THE SPECIAL ILS INDICATOR.              * N0126470
                    *   * SET THE LOCALS-CALL-LOCALS INDICATOR.       * N0126480
                    *                                                 * N0126490
                    *ENTRY POINTS -                                   * N0126500
                    *     PROGRAM START - XQ000                       * N0126510
                    *                                                 * N0126520
                    *INPUT - N/A                                      * N0126530
                    *                                                 * N0126540
                    *OUTPUT - N/A                                     * N0126550
                    *                                                 * N0126560
                    *EXTERNAL REFERENCES -                            * N0126570
                    *   * IN COMMA -                                  * N0126580
                    *     $COMN                                       * N0126590
                    *     $DADR                                       * N0126600
                    *     $DCDE                                       * N0126610
                    *     $DREQ                                       * N0126620
                    *     $FPAD                                       * N0126630
                    *     $NDUP                                       * N0126640
                    *     $NXEQ                                       * N0126650
                    *     $PHSE                                       * N0126660
                    *     $WSDR                                       * N0126670
                    *   * IN DCOM -                                   * N0126680
                    *     #CIDN                                       * N0126690
                    *     #DCSW                                       * N0126700
                    *     #FCNT                                       * N0126710
                    *     #GCNT                                       * N0126720
                    *     #LCNT                                       * N0126730
                    *     #LOSW                                       * N0126740
                    *     #MPSW                                       * N0126750
                    *     #NAME                                       * N0126760
                    *     #NCNT                                       * N0126770
                    *     #X3SW                                       * N0126780
                    *   * IN MCRA -                                   * N0126790
                    *     LABCK                                       * N0126800
                    *     NAMEP                                       * N0126810
                    *     NINDR                                       * N0126820
                    *     NORCD                                       * N0126830
                    *     RA220                                       * N0126840
                    *     RA600                                       * N0126850
                    *     RA740                                       * N0126860
                    *     RA760                                       * N0126870
                    *     RA850                                       * N0126880
                    *     RDCOM                                       * N0126890
                    *     SUPV5                                       * N0126900
                    *     WDCOM                                       * N0126910
                    *                                                 * N0126920
                    *EXITS -                                          * N0126930
                    *   * NORMAL -                                    * N0126940
                    *       * FETCH SUPERVISOR PHASE 5 TO PROCESS THE * N0126950
                    *         SUPERVISOR CONTROL RECORDS IF THEY      * N0126960
                    *         FOLLOW THE XEQ CONTROL RECORD.          * N0126970
                    *       * FETCH THE CORE LOAD BUILDER TO EXECUTE  * N0126980
                    *         THE PROGRAM IN WORKING STORAGE IF THE   * N0126990
                    *         PROGRAM NAME IS BLANK.                  * N0127000
                    *       * FETCH THE CORE IMAGE LOADER WITH A CALL * N0127010
                    *         LINK TO EXECUTE THE NAMED PROGRAM IN    * N0127020
                    *         THE USER AREA.                          * N0127030
                    *   * ERROR -                                     * N0127040
                    *       * BRANCH TO THE MCRA TO READ THE NEXT     * N0127050
                    *                                                 * N0127060
                    *TABLES/WORK AREAS -                              * N0127070
                    *   * @SBFR   AN 80 WORD BUFFER CONTAINING THE    * N0127080
                    *             XEQ MONITOR CONTROL RECORD.         * N0127090
                    *   * DCOM    A 320 WORD BUFFER USED FOR DISK     * N0127100
                    *             COMMUNICATION AREA (DCOM) I/O.      * N0127110
                    *                                                 * N0127120
                    *ATTRIBUTES -                                     * N0127130
                    *   * ABSOLUTE.                                   * N0127140
                    *   * REUSABLE.                                   * N0127150
                    *                                                 * N0127160
                    *NOTES -                                          * N0127170
                    *   * THE ERROR MESSAGES PRINTED FROM PHASE 4 ARE-* N0127180
                    *       * M 26 ILLEGAL NAME                       * N0127190
                    *       * M 27 ILLEGAL CARTRIDGE ID               * N0127200
                    *       * M 29 ILLEGAL DISK ROUTINE REQUESTED     * N0127210
                    *       * M 31 REQUESTED W.S. DR NOT AVAIL        * N0127220
                    *                                                 * N0127230
                    *************************************************** N0127240
                          HDNG    SUPV PHASE 4 - XEQ PROCESSING         N0127250
                          ORG     @PROC-2   PHASE 4 I/O AREA ADDRESS    N0127260
                    *                                                   N0127270
*SBRKMET 71          *SUP PHASE 4 - XEQ PROCESSING                V2M04 N0127280
                          DC      XQ999-*   WORD COUNT                  N0127290
                          DC      @XEQP     PHASE ID                    N0127300
                          HDNG    SUPV PHASE 4 - XEQ PROCESSING         N0127310
                    XQ000 LDX   1 @XEQP     SET                         N0127320
                          STX  L1 $PHSE     *SUPERVISOR PHASE 4 INDR    N0127330
                          NOP               A WAIT MAY BE PATCHED HERE  N0127340
                    *                                                   N0127350
                    *     FETCH DCOM   (DISK COMMUNICATIONS AREA)       N0127360
                    *                                                   N0127370
                          BSI  L  RDCOM     BRANCH TO FETCH DCOM        N0127380
                    *                                                   N0127390
                    *     UNPACK MAINLINE NAME AND CONVERT FROM EBCDIC  N0127400
                    *     TO NAME CODE                                  N0127410
                    *                                                   N0127420
                          LDX  L1 @SBFR     SUPV BUFFER ADDRESS TO XR1  N0127430
                          LDX   2 -6        CHAR COUNT + 1 TO XR2       N0127440
                          LD    1 3         FETCH FIRST WORD OF NAME    N0127450
                          SRT     8         SHIFT TO EXTENTION          N0127460
                          MDX     XQ020     CONVERT RIGHT HALF ONLY     N0127470
                    XQ010 LD    1 3         FETCH NEXT WORD OF NAME     N0127480
                          SRT     16        SHIFT TO EXTENTION          N0127490
                          SRA     16        CLEAR ACCUMULATOR           N0127500
                          SLT     8         SHIFT LEFT HALF TO ACC      N0127510
                          STO  L2 XQ900+5   STORE TO UNPACKED BUFFER    N0127520
                    XQ020 SRA     16        CLEAR ACCUMULATOR           N0127530
                          SLT     8         SHIFT RIGHT HALF TO ACC     N0127540
                          STO  L2 XQ900+6   STORE TO UNPACKED BUFFER    N0127550
                          MDX   1 1         INCREMENT SUPV BUFFER ADDR  N0127560
                          MDX   2 2         INCR CHAR COUNT, SKIP IF 0  N0127570
                          MDX     XQ010     BR TO UNPACK NEXT WORD      N0127580
                    *                                                   N0127590
                          LDX  L2 XQ900     UNPACKED BUFFER ADDR TO XR2 N0127600
                          BSI  L  LABCK     BR TO CONVERSION SUBROUTINE N0127610
                          MDX     XQ025     BRANCH ON NORMAL RETURN     N0127620
                    *                                                   N0127630
                          LDX   2 1         POINT TO ERROR MESSAGE M 26 N0127640
                          BSI  L  XQERR     BRANCH TO PRINT THE MESSAGE N0127650
                    *                                                   N0127660
                    XQ025 STD  L  NAMEP     SAVE NAME IN NAME CODE      N0127670
                          STD  L  #NAME     STORE TO DCOM               N0127680
                    *                                                   N0127690
                    *     SET #MPSW FOR A CORE MAP WHEN COLUMN 14 = L   N0127700
                    *                                                   N0127710
                          LD   L  @SBFR+6   FETCH COLUMNS 13-14         N0127720
                          S       XQ901     TEST FOR EBCDIC L           N0127730
                          BSC  L  XQ030,Z   BR IF COLUMN 14 NOT AN L    N0127740
                          LD      XQ901     FETCH NON-ZERO              N0127750
                          MDX     *+1       BRANCH                      N0127760
                    XQ030 SRA     16        CLEAR ACCUMULATOR           N0127770
                          STO  L  #MPSW     STORE TO CORE MAP SWITCH    N0127780
                    *                                                   N0127790
                    *     FETCH NO. OF LOCAL,NOCAL,FILES AND G2250 RCDS N0127800
                    *                                                   N0127810
                          LD   L  @SBFR+7   FETCH COLUMNS 15-16     2-1 N0127820
                          AND  L  XQ902     MASK OUT ALL BUT NUMBER 2-1 N0127830
                    XQ040 M       XQ903     MULTIPLY BY TEN         2-1 N0127840
                          SLT     16        SHIFT PRODUCT TO ACC    2-1 N0127850
                          STO  L  NORCD     SAVE                        N0127860
                          LD   L  @SBFR+8   FETCH COLUMNS 17-18         N0127870
                          SRA     8         RIGHT JUSTIFY               N0127880
                          AND     XQ902     MASK OUT ALL BUT NUMBER     N0127890
                          A    L  NORCD     ADD TENS DIGIT              N0127900
                          STO  L  NORCD     SAVE NO. OF SUPV CTRL RCDS  N0127910
                          STO  L  JOBXQ     NON ZERO NO EQUATS ALLOW2-4 N0127920
                    *                                                   N0127930
                    *     DETERMINE DESIRED DISK ROUTINE                N0127940
                    *                                                   N0127950
                          LDX   2 -5                                    N0127960
                    XQ050 LD   L  @SBFR+9   FETCH COLUMNS 19-20         N0127970
                          S    L2 XQ905+5   SUBTRACT EBCDIC CODE        N0127980
                          BSC  L  XQ060,+-  BRANCH IF ZERO              N0127990
                          MDX   2 1         INCREMENT XR2, SKIP IF ZERO N0128000
                          MDX     XQ050     BRANCH TO TRY AGAIN         N0128010
                          LDX   2 3         POINT TO ERROR MESSAGE M 29 N0128020
                          BSI  L  XQERR     BRANCH TO PRINT THE MESSAGE N0128030
                    XQ060 LD   L2 XQ906+5   FETCH CODE                  N0128040
                          STO  L  $DREQ     SAVE DISK ROUTINE CODE      N0128050
                          MDX     XQ070                                 N0128060
                    *                                                   N0128070
                    *     CONSTANTS AND WORK AREA                       N0128080
                    *                                                   N0128090
                    XQ900 BSS     5         5 CHAR NAME IN EBCDIC       N0128100
                    XQ901 EBC     . L.      EBCDIC L                    N0128110
                    XQ902 DC      /000F     MASK                        N0128120
                    XQ903 DC      10        CONSTANT TEN                N0128130
                    XQ905 EBC     .  .      EBCDIC BLANK                N0128140
                          EBC     .0 .      EBCDIC ZERO                 N0128150
                          EBC     .1 .      EBCDIC ONE                  N0128160
                          EBC     .N .      EBCDIC N                    N0128170
                          EBC     .Z .      EBCDIC Z                    N0128180
                    XQ906 DC      -1        DISKZ CODE                  N0128190
                          DC      +0        DISK1 CODE                  N0128200
                          DC      +0        DISK1 CODE                  N0128210
                          DC      +1        DISKN CODE                  N0128220
                          DC      -1        DISKZ CODE                  N0128230
                    XQ910 DC      *-*       ID OF PROGRAM CARTRIDGE     N0128240
                    XQ911 DC      /005D     EBCDIC RIGHT PARENTHESIS    N0128250
                    XQ912 DC      /0040     EBCDIC BLANK                N0128260
                    *                                                   N0128270
                    *     FETCH AND CONVERT CARTRIDGE ID                N0128280
                    *                                                   N0128290
                    XQ070 LDX   1 -6                                    N0128300
                          LDX   2 -2                                    N0128310
                          LDX   3 4         CHARACTER COUNT TO XR3      N0128320
                    XQ075 SLT     32        CLEAR ACC AND EXT           N0128330
                          LD   L2 @SBFR+12  FETCH TWO CHAR OF CART ID   N0128340
                          SRT     8         SEPARATE                    N0128350
                          SLA     8         *THE CHARACTERS             N0128360
                          RTE     8         *AND STORE TO               N0128370
                          STD  L1 XQ962+6   *CHARACTER STORAGE AREA     N0128380
                          S       XQ912     TEST FOR AND                N0128390
                          BSC     +-        *SKIP IF NOT A BLANK        N0128400
                          MDX   3 -1        DECREMENT CHARACTER COUNT   N0128410
                          SLT     16        FETCH NEXT CHARACTER        N0128420
                          S       XQ912     TEST FOR AND                N0128430
                          BSC     +-        *SKIP IF NOT A BLANK        N0128440
                          MDX   3 -1        DECR CHAR CNT, SKIP IF ZERO N0128450
                          MDX     *+1                                   N0128460
                          MDX     XQ090     BR TO SET CARTRIDGE ID ZERO N0128470
                          MDX   1 2         INCREMENT CHARACTER COUNT   N0128480
                          MDX   2 1         INCR WORD CNT, SKIP IF ZERO N0128490
                          MDX     XQ075     BR TO SEPERATE NEXT WORD    N0128500
                    *                                                   N0128510
                          MDX   3 -3        DECR CHAR CNT, SK IF 1-2-3  N0128520
                          MDX     XQ085                                 N0128530
                    *                                                   N0128540
                    XQ080 LDX   2 2         POINT TO ERROR MESSAGE M 27 N0128550
                          BSI  L  XQERR     BRANCH TO PRINT THE MESSAGE N0128560
                    *                                                   N0128570
                    XQ085 BSI  L  XQ600     BR TO CONVERT ID TO BIN 2-2 N0128580
                    XQ090 STO     XQ910     STORE BINARY CART ID    2-2 N0128590
                    *                                               2-2 N0128600
                          BSC  L  XQ100,Z-  BRANCH IF CART ID GIVEN 2-2 N0128610
                          LD   L  $WSDR     FETCH SYS W. S. DR NO.  2-2 N0128620
                          STO     XQ300+1   SAVE                    2-2 N0128630
                          MDX     XQ140     BR TO STORE TO COMMA    2-2 N0128640
                    *                                               2-2 N0128650
                    XQ100 LDX   1 -5        CART ID COUNT TO XR1    2-2 N0128660
                    XQ110 LD   L1 #CIDN+5   FETCH AN ID FROM DCOM   2-2 N0128670
                          BSC  L  XQ120,+   BRANCH IF ID BLANK      2-2 N0128680
                          S       XQ910     SUBTRACT PROG CART ID   2-2 N0128690
                          BSC  L  XQ130,+-  BRANCH IF IDS ARE EQUAL 2-2 N0128700
                          MDX   1 1         INCR ID CNT, SK IF ZERO 2-2 N0128710
                          MDX     XQ110     BRANCH TO FETCH NEXT ID 2-2 N0128720
                    *                                               2-2 N0128730
                    XQ120 LD      *         SET                     2-2 N0128740
                          STO  L  $NDUP     NO-DUP AND              2-2 N0128750
                          STO  L  $NXEQ     NO-EXECUTION INDICATORS 2-2 N0128760
                          LDX   2 4         POINT TO ERROR MSG M 31 2-2 N0128770
                          BSI  L  XQERR     BRANCH TO PRINT THE MSG 2-2 N0128780
                    *                                               2-2 N0128790
                    XQ130 MDX   1 5         SET XR1 POSITIVE        2-2 N0128800
                          NOP                                       2-2 N0128810
                          STX   1 XQ300+1   PLACE                   2-2 N0128820
                          LD      XQ300+1   *DRIVE CODE             2-2 N0128830
                    XQ140 SLA     12        *IN BITS 1 - 3          2-2 N0128840
                          STO  L  $DCDE     *AND STORE TO COMMA     2-2 N0128850
                    *                                               2-2 N0128860
                          LD   L  @SBFR+12  FETCH COLUMN 26         2-2 N0128870
                          SLA     8         SHIFT OUT LEFT HALF     2-2 N0128880
                          SRA     8         AND RETURN              2-2 N0128890
                          EOR     XQ912     TEST FOR AND            2-2 N0128900
                          BSC  L  XQ150,+-  BR IF COLUMN 26 BLANK   2-2 N0128910
                          LD      XQ906+3   SET                     2-2 N0128920
                    XQ150 STO  L  #LOSW     *LOCALS-CALL-LOCALS SW  2 2 N0128930
                    *                                               2-3 N0128940
                    *     SET SPECIAL ILS SWITCH                    2-3 N0128950
                    *                                               2-3 N0128960
                          LD   L  @SBFR+13  FETCH COLUMNS 27 AND 28 2-3 N0128970
                          EOR     XQ912     TEST FOR BLNK IN COL 28 2-3 N0128980
                          SLA     8         SHIFT OUT COLUMN 27     2-3 N0128990
                          BSC  L  XQ160,+-  BR IF COLUMN 28 BLANK   2-3 N0129000
                          LD      XQ906+3   FETCH CONSTANT ONE      2-3 N0129010
                    XQ160 STO  L  #X3SW     SET SPECIAL ILS SWITCH  2-3 N0129020
                    *                                                   N0129030
                          SRA     16        CLEAR THE ACCUMULATOR       N0129040
                          STO  L  #LCNT     SET LOCAL INDICATOR,        N0129050
                          STO  L  #NCNT     *NOCAL INDICATOR,           N0129060
                          STO  L  #FCNT     *FILES INDICATOR,           N0129070
                          STO  L  #DCSW     *DUP-CALL-SWITCH AND        N0129080
                          STO  L  #GCNT     **G2250 COUNT OFF       2G2 N0129090
                    *                                                   N0129100
                    *     WRITE THE NEW DCOM TO DISK                    N0129110
                    *                                                   N0129120
                    XQ200 BSI  L  WDCOM     BRANCH TO WRITE DCOM        N0129130
                    *                                                   N0129140
                    *     TEST THE MAINLINE NAME                        N0129150
                    *                                                   N0129160
                          LDD  L  NAMEP     FETCH MAINLINE NAME         N0129170
                          BSC  L  XQ400,Z   BR IF FIRST HALF NON-BLANK  N0129180
                          SLT     16        SHIFT SECOND HALF TO ACC    N0129190
                          BSC  L  XQ400,Z   BR IF SECOND HALF NON-BLANK N0129200
                    *                                                   N0129210
                    *     PROGRAM NAME BLANK                            N0129220
                    *     PREPARE TO FETCH CORE LOAD BUILDER            N0129230
                    *                                                   N0129240
                          STO  L  $COMN     SET COMMON WC ZERO      2-9 N0129245
                          STO  L  NINDR     SET NAME INDICATOR ZERO     N0129250
                    XQ300 LDX  L2 *-*       DRIVE NO. OF W. S. TO XR2   N0129260
                          LD   L2 $FPAD     FETCH W. S. SECTOR ADDRESS  N0129270
                          SLA     4         CONVERT TO BLOCK ADDRESS    N0129280
                          STO  L  $DADR     *AND STORE                  N0129290
                          MDX     XQ500     CONTINUE                    N0129300
                    *                                                   N0129310
                    *     PROGRAM NAME NON-BLANK                        N0129320
                    *     PREPARE TO FETCH CORE IMAGE LOADER            N0129330
                    *                                                   N0129340
                    XQ400 STO  L  NINDR     SET NAME INDICATOR NON-ZERO N0129350
                          SLA     16        SET                         N0129360
                          STO  L  $COMN     *LENGTH OF COMMON AND       N0129370
                          STO  L  $DCDE     *PROG W. S. DRIVE NO. ZERO  N0129380
                    *                                                   N0129390
                    *     FETCH SUPV PHASE 5 IF SUPV CONTROL RECORDS    N0129400
                    *                                                   N0129410
                    XQ500 LD   L  NORCD     FETCH NO. OF SUPV CTRL RCDS N0129420
                          BSC  L  XQ520,+   BRANCH IF ZERO              N0129430
                          LDX  L1 SUPV5     XR1 PTS TO SUPV PH 5 SLET   N0129440
                          BSC  L  RA600     BRANCH TO FETCH PHASE 5     N0129450
                    *                                                   N0129460
                    XQ520 LD   L  NINDR     FETCH NAME INDICATOR        N0129470
                          BSC  L  RA740,Z   BRANCH IF NAME NON-BLANK    N0129480
                          BSC  L  RA760     BRANCH IF NAME BLANK        N0129490
                    *                                                   N0129500
                    *************************************************** N0129510
                    *                                                   N0129520
                    *     CONVERT CARTRIDGE ID TO BINARY                N0129530
                    *                                                   N0129540
                    XQ600 DC      0         ENTRY/RETURN ADDRESS        N0129550
                          SLT     32        CLEAR                       N0129560
                          STD     XQ960     *TEMPORARY SUM              N0129570
                          LDX   3 -4        XR3 = CHARACTER COUNT       N0129580
                    XQ620 LD   L3 XQ962+4   FETCH A CHARACTER           N0129590
                          S       XQ966     SUBTRACT EBCDIC BLANK       N0129600
                          BSC  L  XQ640,+-  BRANCH IF BLANK             N0129610
                          A       XQ966     RESET                       N0129620
                          S       XQ967     TEST FOR ALPHABETIC/NUMERIC N0129630
                          BSC  L  XQ640,-   SKIP IF NUMERIC             N0129640
                          A       XQ968     CONVERT ALPHA TO BINARY     N0129650
                          S       XQ969     TEST FOR AND                N0129660
                          BSC  L  XQ080,Z-  *BRANCH IF GREATER THAN 'F' N0129670
                          A       XQ969     RESET                       N0129680
                    XQ640 M    L3 XQ964+4   MULTIPLY BY POWER OF 16     N0129690
                          AD      XQ960     ADD PREVIOUS SUM            N0129700
                          STD     XQ960     SAVE NEW SUM                N0129710
                          MDX   3 1         INCR CHAR CNT, SKIP IF ZERO N0129720
                          MDX     XQ620     BR TO FETCH NEXT CHARACTER  N0129730
                          SLT     16        SHIFT SUM TO ACCUMULATOR    N0129740
                          BSC  L  XQ080,+   BRANCH IF ILLEGAL           N0129750
                          BSC  I  XQ600     RETURN                      N0129760
                    *                                                   N0129770
                    *     CONSTANTS AND WORK AREAS                      N0129780
                    *                                                   N0129790
                    XQ960 BSS  E  2         32 BIT TEMPORARY SUM        N0129800
                    XQ962 BSS     4         4 CHARACTER CHARTIDGE ID    N0129810
                    XQ964 DC      /1000     THIRD  POWER OF 16          N0129820
                          DC      /0100     SECOND POWER OF 16          N0129830
                          DC      /0010     FIRST  POWER OF 16          N0129840
                          DC      /0001     ZERO   POWER OF 16          N0129850
                    XQ966 DC      /0040     EBCDIC BLANK                N0129860
                    XQ967 DC      /00F0     ALPHA/NUMERIC TEST MASK     N0129870
                    XQ968 DC      /0039     ALPHA TO BINARY MASK        N0129880
                    XQ969 DC      /000F     MAXIMUM ALLOWABLE CHARACTER N0129890
                    *                                                   N0129900
                    *************************************************** N0129910
                    *                                                   N0129920
                    *     PRINT THE ERROR MESSAGE                       N0129930
                    *                                                   N0129940
                    XQERR DC      0         ENTRY                       N0129950
                          LD      *         SET                         N0129960
                          STO  L  $NXEQ     *NON-EXECUTE INDR ON        N0129970
                          LD   L2 XQ980-1   FETCH ADDR OF MESSAGE       N0129980
                          BSI  L  RA850     BRANCH TO PRINT THE MESSAGE N0129990
                          BSC  L  RA220     BRANCH TO READ NEXT RECORD  N0130000
                    *                                                   N0130010
                    *     ERROR MESSAGES                                N0130020
                    *                                                   N0130030
                    XQ980 DC      XQ986     ADDRESS OF MESSAGE M 26     N0130040
                          DC      XQ987     ADDRESS OF MESSAGE M 27     N0130050
                          DC      XQ989     ADDRESS OF MESSAGE M 29     N0130060
                          DC      XQ991     ADDRESS OF MESSAGE M 31 2-2 N0130070
                    *                                                   N0130080
                    XQ986 DC      XQ987-*   WORD COUNT                  N0130090
                          EBC     .M 26 ILLEGAL NAME.                   N0130100
                    XQ987 DC      XQ989-*   WORD COUNT                  N0130110
                          EBC     .M 27 ILLEGAL CARTRIDGE ID.           N0130120
                    XQ989 DC      XQ991-*   WORD COUNT                  N0130130
                          EBC     .M 29 ILLEGAL DISK ROUTINE REQUESTED. N0130140
                    XQ991 DC      XQ992-*   WORD COUNT                  N0130150
                          EBC     .M 31 REQUESTED W.S. DR NOT AVAIL.    N0130160
                    XQ992 BSS     0                                     N0130170
                    *                                                   N0130180
                    *                                                   N0130190
                          BSS     @PROC+2*@SCTR-*-1  PATCH AREA         N0130200
                    *                                                   N0130210
                    *                                                   N0130220
                    XQ999 DC      0         END OF PHASE 4 - XEQ PROC   N0130230
                          HDNG    SUPV PHASE 5 - SUPV CTRL RCD PROC     N0130240
                    *************************************************** N0130250
                    *STATUS - VERSION 2, MODIFICATION 10                N0130260
                    *                                                 * N0130270
                    *FUNCTION/OPERATION -                             * N0130280
                    *   * READ, PRINT AND PROCESS SUPERVISOR CONTROL  * N0130290
                    *     RECORDS AS FOLLOWS -                        * N0130300
                    *       * LOCAL   CONVERT EACH MAINLINE AND       * N0130310
                    *                 SUBROUTINE NAME TO NAMECODE AND * N0130320
                    *                 STORE TO THE SCRA.              * N0130330
                    *       * NOCAL   CONVERT EACH MAINLINE AND       * N0130340
                    *                 SUBROUTINE NAME TO NAMECODE AND * N0130350
                    *                 STORE TO THE SCRA.              * N0130360
                    *       * FILES   CONVERT EACH FILE NAME TO       * N0130370
                    *                 NAMECODE AND EACH FILE NUMBER   * N0130380
                    *                 AND CARTRIDGE ID TO BINARY AND  * N0130390
                    *                 STORE TO THE SCRA.              * N0130400
                    *       * G2250   CONVERT THE MAINLINE NAME TO    * N0130410
                    *                 NAMECODE AND STORE IT AND THE   * N0130420
                    *                 REQUESTED SUBROUTINE NAMES TO   * N0130430
                    *                 THE SCRA.                       * N0130440
                    *       * EQUAT   CONVERT SUBROUTINE NAMES TO  2-4* N0130450
                    *                 NAMECODE AND STORE TO THE    2-4* N0130460
                    *                 SCRA.                        2-4* N0130470
                    *                                                 * N0130480
                    *ENTRY POINTS -                                   * N0130490
                    *     PROGRAM START - LF000                       * N0130500
                    *                                                 * N0130510
                    *INPUT -                                          * N0130520
                    *   * SUPERVISOR CONTROL RECORDS ARE READ FROM    * N0130530
                    *     THE PRINCIPAL INPUT DEVICE.                 * N0130540
                    *       * *LOCALMLNME,SUBR1,SUBR2,...,SUBRN       * N0130550
                    *       * *NOCALMLNME,SUBR1,SUBR2,...,SUBRN       * N0130560
                    *       * *FILES(NO1,NM1,CID1),...,(NON,NMN,CIDN) * N0130570
                    *       * *G2250MLNME X X X X X                   * N0130580
                    *       * *EQUAT(SUBR1,SUBR2),..,(SUBRM,SURBN) 2-4* N0130590
                    *     #ECNT                                    2-4* N0130600
                    *                                                 * N0130610
                    *OUTPUT -                                         * N0130620
                    *     THE SUPERVISOR CONTROL RECORDS ARE PRINTED  * N0130630
                    *     FROM THE PRINCIPAL PRINT DEVICE.            * N0130640
                    *                                                 * N0130650
                    *EXTERNAL REFERENCES -                            * N0130660
                    *   * IN COMMA -                                  * N0130670
                    *     $DBSY                                       * N0130680
                    *     $GCOM                                       * N0130690
                    *     $IBSY                                       * N0130700
                    *     $NXEQ                                       * N0130710
                    *     $PHSE                                       * N0130720
                    *   * IN DCOM -                                   * N0130730
                    *     #FCNT                                       * N0130740
                    *     #GCNT                                       * N0130750
                    *     #LCNT                                       * N0130760
                    *     #NCNT                                       * N0130770
                    *     #SCRA                                       * N0130780
                    *   * IN MCRA -                                   * N0130790
                    *     LABCK                                       * N0130800
                    *     NINDR                                       * N0130810
                    *     NORCD                                       * N0130820
                    *     RA220                                       * N0130830
                    *     RA740                                       * N0130840
                    *     RA760                                       * N0130850
                    *     RA850                                       * N0130860
                    *     SBADR                                       * N0130870
                    *     WDCOM                                       * N0130880
                    *   * SUBROUTINES -                               * N0130890
                    *     CONVT   PRINCIPAL INPUT DEVICE CONVERSION   * N0130900
                    *             SUBROUTINE.                         * N0130910
                    *     DZ000   RESIDENT DISK I/O SUBROUTINE.       * N0130920
                    *     INPUT   PRINCIPAL INPUT DEVICE SUBROUTINE.  * N0130930
                    *                                                 * N0130940
                    *EXITS -                                          * N0130950
                    *   * NORMAL -                                    * N0130960
                    *       * FETCH THE CORE LOAD BUILDER TO EXECUTE  * N0130970
                    *         THE PROGRAM IN WORKING STORAGE IF THE   * N0130980
                    *         PROGRAM NAME IS BLANK.                  * N0130990
                    *       * FETCH THE CORE IMAGE LOADER WITH A CALL * N0131000
                    *         LINK TO EXECUTE THE NAMED PROGRAM IN    * N0131010
                    *         THE USER AREA.                          * N0131020
                    *       * BRANCH TO FETCH THE MCRA IF          2-4* N0131030
                    *         PROCESSING *EQUAT RECORDS.           2-4* N0131040
                    *   * ERROR -                                     * N0131050
                    *       * BRANCH TO THE MCRA (PHASE 1) TO READ    * N0131060
                    *         THE NEXT RECORD AFTER PRINTING THE      * N0131070
                    *         ERROR MESSAGE. (SEE NOTES.)             * N0131080
                    *       * // CONTROL RECORD DETECTED RESULTS   2-8* N0131090
                    *         IN A BRANCH TO MCRA AND ERROR MSG 14 2-8* N0131100
                    *         IS PRINTED                           2-8* N0131110
                    *                                                 * N0131120
                    *TABLES/WORK AREAS -                              * N0131130
                    *   * @SBFR   AN 80 WORD BUFFER INTO WHICH SUPER- * N0131140
                    *             VISOR CONTROL RECORDS ARE READ.     * N0131150
                    *   * PBUFR   A 40 WORD BUFFER FROM WHICH A       * N0131160
                    *             PACKED EBCDIC SUPERVISOR CONTROL    * N0131170
                    *             RECORD IS PRINTED.                  * N0131180
                    *   * DCOM    A 320 WORD BUFFER USED FOR DISK     * N0131190
                    *             COMMUNICATION AREA (DCOM) I/O.      * N0131200
                    *   * SCRAB   A 640 WORD BUFFER USED TO BUILD AND * N0131210
                    *             WRITE 2 SECTORS OF THE SCRA.        * N0131220
                    *             (EQUIVALENT TO 'BUFFR-320').        * N0131230
                    *                                                 * N0131240
                    *ATTRIBUTES -                                     * N0131250
                    *   * ABSOLUTE.                                   * N0131260
                    *   * REUSABLE.                                   * N0131270
                    *                                                 * N0131280
                    *NOTES -                                          * N0131290
                    *   * THE ERROR MESSAGES PRINTED FROM PHASE 5 ARE-* N0131300
                    *       * M 21 ABOVE RECORD NOT A SUPERVISOR      * N0131310
                    *              CONTROL RECORD                     * N0131320
                    *       * M 22 SUPERVISOR CONTROL RECORDS         * N0131330
                    *              INCORRECTLY ORDERED                * N0131340
                    *       * M 23 INCORRECT CONTINUATION             * N0131350
                    *       * M 24 ILLEGAL CHARACTER IN RECORD        * N0131360
                    *       * M 25 ILLEGAL FILE NUMBER                * N0131370
                    *       * M 26 ILLEGAL NAME                       * N0131380
                    *       * M 27 ILLEGAL CARTRIDGE ID               * N0131390
                    *       * M 28 SCRA BUFFER OVERFLOW               * N0131400
                    *       * M 30 INVALID CHAR IN G2250 OPTION COLUMN* N0131410
                    *                                                 * N0131420
                    *************************************************** N0131430
                          HDNG    SUPV PHASE 5 - SUPV CTRL RCD PROC     N0131440
                          ORG     @PROC-2   PHASE 5 I/O AREA ADDRESS    N0131450
                    *                                                   N0131460
*SBRKMET 72          *SUP PHASE 5 - SUPV CONTROL REC PROCESSING   V2M04 N0131470
                          DC      LF999-*   WORD COUNT                  N0131480
                          DC      @SCRP     PHASE ID                    N0131490
                          HDNG    SUPV PHASE 5 - SUPV CTRL RCD PROC     N0131500
                    LF000 LDX   1 @SCRP     SET                         N0131510
                          STX  L1 $PHSE     *SUPERVISOR PHASE 5 INDR    N0131520
                          NOP               A WAIT MAY BE PATCHED HERE  N0131530
                          LDX  L3 X35       SET XR3 TO POINT AT     2-4 N0131540
                    *                       *PHASE 5 COMMON AREA    2-4 N0131550
                    *                                                   N0131560
                    *     INITIALIZE                                    N0131570
                    *                                                   N0131580
                          SRA     16        SET TYPE                    N0131590
                          STO     TYPE2     *OF LAST RECORD ZERO        N0131600
                          LD   L  #SCRA     SET THE SECTOR ADDRESSES OF N0131610
                          STO     ASCRA     *LOCALS,                    N0131620
                          A       LF903+1                               N0131630
                          STO     ASCRA+1   *NOCALS,                    N0131640
                          A       LF903+1                               N0131650
                          STO     ASCRA+2   *FILES,                     N0131660
                          A       LF903+1                               N0131670
                          STO     ASCRA+3   *G2250 AND                  N0131680
                          A       LF903                             2-4 N0131690
                          STO     ASCRA+4   *EQUAT AREAS OF SCRA    2-4 N0131700
                    *                                                   N0131710
                    *     READ AND PRINT A RECORD                       N0131720
                    *                                                   N0131730
                    LF120 BSI  L  RR000                                 N0131740
                    *                                                   N0131750
                    *     DETERMINE TYPE OF SUPERVISOR CONTROL RECORD   N0131760
                    *                                                   N0131770
                    LF130 BSI  L  DT000                                 N0131780
                    *                                                   N0131790
                          LD      TYPE1     IF THIS RECORD OF SAME TYPE N0131800
                          S       TYPE2     *AS LAST RECORD BRANCH TO   N0131810
                          BSC  I1 LF902-1,+- *PROCESS THE RECORD        N0131820
                    *                                                   N0131830
                          BSI  L  WR000     BRANCH TO WRITE THE SCRA    N0131840
                    *                                                   N0131850
                          LD   I1 LF900-1   FETCH INDICATOR             N0131860
                          BSC  L  LF240,Z   BRANCH IF INDICATOR ON      N0131870
                    *                                                   N0131880
                          LD      LF903     FETCH NON-ZERO              N0131890
                          STO  I1 LF900-1   SET INDICATOR ON            N0131900
                          LD      TYPE1     SET TYPE OF                 N0131910
                          STO     TYPE2     *LAST RECORD                N0131920
                          LD   L1 ASCRA-1   FETCH THE SECTOR ADDRESS    N0131930
                          SRT     16        *AND SHIFT TO EXTENSION     N0131940
                          LD   L1 LF905-1   FETCH THE WORD COUNT    2-4 N0131950
                          STD  L  SCRAB-2   *AND STORE TO SCRA I/O AREA N0131960
                          BSC  I1 LF902-1   BRANCH TO PROCESS RECORD    N0131970
                    *                                                   N0131980
                    *     PREPARE TO READ NEXT SUPV CTRL RECORD         N0131990
                    *                                                   N0132000
                    LF140 LD      WDCNT     INCREMENT                   N0132010
                          STO  L  LWDCT     SAVE ADDR OF LAST WORD CNT  N0132020
                          A    I  WDCNT     *ADDRESS                    N0132030
                          STO     WDCNT     *OF WORD COUNT              N0132040
                          MDX  L  BFCNT,1   INCREMENT BUFFER COUNT      N0132050
                          NOP                                           N0132060
                          MDX     LF120     BRANCH TO READ NEXT RECORD  N0132070
                    *                                                   N0132080
                    *     CLEAR THE SECTORS OF TYPES NOT SPECIFIED      N0132090
                    *                                                   N0132100
                    LF200 LDX   1 -4        TYPE COUNT TO XR1       2G2 N0132110
                          LD   I1 LF900+4   FETCH INDICATOR         2G2 N0132120
                          BSC  L  LF220,Z   BRANCH IF INDICATOR SET     N0132130
                          LD   L1 ASCRA+4   FETCH THE SECTOR ADDR   2G2 N0132140
                          SRT     16        *AND SHIFT TO EXTENSION     N0132150
                          LD   L1 LF905+4   FETCH THE WORD COUNT    2-4 N0132160
                          STD  L  SCRAB-2   *AND STORE TO SCRA I/O AREA N0132170
                          BSI  L  WR000     BRANCH TO CLEAR DISK        N0132180
                    LF220 MDX   1 1         INCR TYPE CNT, SKIP IF ZERO N0132190
                          MDX     LF200+1   BRANCH TO TEST NEXT TYPE    N0132200
                    *                                                   N0132210
                    *     FETCH AND BRANCH TO CIL OR CLB                N0132220
                    *                                                   N0132230
                          BSI  L  WDCOM     BRANCH TO WRITE DCOM        N0132240
                          LD   L  NINDR     FETCH NAME INDICATOR        N0132250
                          BSC  L  RA740,Z   BRANCH IF NAME NON-BLANK    N0132260
                          BSC  L  RA760     BRANCH IF NAME BLANK        N0132270
                    *                                                   N0132280
                    LF240 LDX   2 2         POINT TO ERROR MESSAGE M 22 N0132290
                          BSI     LFERR     BRANCH TO PRINT THE MESSAGE N0132300
                    *                                                   N0132310
                    *     PRINT THE ERROR MESSAGE                       N0132320
                    *                                                   N0132330
                    LFERR DC      0         ENTRY                       N0132340
                          LD   L2 LF904-1   FETCH ADDR OF ERROR MESSAGE N0132350
                          BSI  L  RA850     BRANCH TO PRINT THE MESSAGE N0132360
                          LD      LF903     SET                         N0132370
                          STO  L  $NXEQ     *NON-EXECUTE SWITCH ON      N0132380
                          BSC  L  RA220     BRANCH TO READ NEXT RECORD  N0132390
                    *                                                   N0132400
                    *     CONSTANTS AND WORK AREA                       N0132410
                    *                                                   N0132420
                    LF900 DC      #LCNT     ADDRESS OF LOCAL INDICATOR  N0132430
                          DC      #NCNT     ADDRESS OF NOCAL INDICATOR  N0132440
                          DC      #FCNT     ADDRESS OF FILES INDICATOR  N0132450
                          DC      #GCNT     ADDRESS OF G2250 INDR   2G2 N0132460
                          DC      LF906     ADDRESS OF EQUAT INDR   2-4 N0132470
                    LF901 DC      /7001     PRINT FUNCTION CODE         N0132480
                    LF902 DC      LC000     LOCAL-NOCAL PROCESSING ADDR N0132490
                          DC      LC000     LOCAL-NOCAL PROCESSING ADDR N0132500
                          DC      FR000     FILES PROCESSING ADDRESS    N0132510
                          DC      GR000     G2250 PROCESSING ADDR   2G2 N0132520
                          DC      EQ000     EQUAT PROCESSING ADDR   2-4 N0132530
                    LF903 DC      1         CONSTANT ONE            2-4 N0132540
                          DC      2         CONSTANT TWO            2-4 N0132550
                    LF904 DC      LF910                                 N0132560
                          DC      LF920                                 N0132570
                          DC      LF930                                 N0132580
                          DC      LF940                                 N0132590
                          DC      LF950                                 N0132600
                          DC      LF960                                 N0132610
                          DC      LF970                                 N0132620
                          DC      LF980                                 N0132630
                          DC      LF990                             2G2 N0132640
                    LF905 DC      2*@SCTR   LOCAL BUFFER WORD COUNT 2-4 N0132650
                          DC      2*@SCTR   NOCAL BUFFER WORD COUNT 2-4 N0132660
                          DC      2*@SCTR   FILES BUFFER WORD COUNT 2-4 N0132670
                          DC      @SCTR     G2250 BUFFER WORD COUNT 2-4 N0132680
                          DC      @SCTR     EQUAT BUFFER WORD COUNT2-10 N0132690
                    LF906 DC      *-*       EQUAT INDICATOR         2-4 N0132700
                    *                                                   N0132710
                    X35   EQU     *         XR3 USED FOR SHORT INSTR2-4 N0132720
                    TYPE1 DC      *-*       TYPE CODE OF THIS RECORD    N0132730
                    TYPE2 DC      *-*       TYPE CODE OF LAST RECORD    N0132740
                    *                          0 = NONE                 N0132750
                    *                          1 = LOCAL                N0132760
                    *                          2 = NOCAL                N0132770
                    *                          3 = FILES                N0132780
                    *                          4 = G2250            2G2 N0132790
                    *                          5 = EQUAT            2-4 N0132800
                    ASCRA DC      *-*       SCTR ADDR OF LOCAL SCRA     N0132810
                          DC      *-*       SCTR ADDR OF NOCAL SCRA     N0132820
                          DC      *-*       SCTR ADDR OF FILES SCRA     N0132830
                          DC      *-*       SCTR ADDR OF G2250 SCTR 2G2 N0132840
                          DC      *-*       SCTR ADDR OF EQUAT SCRA 2-4 N0132850
                          BSS  E  0                                     N0132860
                    NAMEX DC      *-*       NAME IN NAME CODE           N0132870
                          DC      *-*       *OR BINARY NUMBER           N0132880
                    WDCNT DC      *-*       ADDRESS OF WORD COUNT       N0132890
                    COLSW DC      *-*       COLUMN SWITCH-              N0132900
                    *                          - = BLANK ENDED NAME     N0132910
                    *                          0 = FIRST COLUMN BLANK   N0132920
                    *                          1 = COMMA ENDED NAME     N0132930
                    *                          2 = RT PAREN ENDED NAME  N0132940
                    *                                                   N0132950
                    *     ERROR MESSAGES                                N0132960
                    *                                                   N0132970
                    LF910 DC      LF920-*   WORD COUNT                  N0132980
                          EBC     .M 21 ABOVE RECORD NOT A SUPERVISOR.  N0132990
                          EBC     . CONTROL RECORD.                     N0133000
                    LF920 DC      LF930-*   WORD COUNT                  N0133010
                          EBC     .M 22 SUPERVISOR CONTROL RECORDS IN.  N0133020
                          EBC     .CORRECTLY ORDERED.                   N0133030
                    LF930 DC      LF940-*   WORD COUNT                  N0133040
                          EBC     .M 23 INCORRECT CONTINUATION.         N0133050
                    LF940 DC      LF950-*   WORD COUNT                  N0133060
                          EBC     .M 24 ILLEGAL CHARACTER IN RECORD.    N0133070
                    LF950 DC      LF960-*   WORD COUNT                  N0133080
                          EBC     .M 25 ILLEGAL FILE NUMBER.            N0133090
                    LF960 DC      LF970-*   WORD COUNT                  N0133100
                          EBC     .M 26 ILLEGAL NAME.                   N0133110
                    LF970 DC      LF980-*   WORD COUNT                  N0133120
                          EBC     .M 27 ILLEGAL CARTRIDGE ID.           N0133130
                    LF980 DC      LF990-*   WORD COUNT                  N0133140
                          EBC     .M 28 SCRA BUFFER OVERFLOW.           N0133150
                    LF990 DC      LF995-*   WORD COUNT                  N0133160
                          EBC     .M 30 INVALID CHAR IN G2250 OPTION .  N0133170
                          EBC     .COLUMN.                              N0133180
                    LF995 BSS     0                                     N0133190
                          HDNG    SUPV PHASE 5 - SUPV CTRL RCD PROC     N0133200
                    *                                                   N0133210
                    *     PROCESS LOCAL AND NOCAL RECORDS               N0133220
                    *                                                   N0133230
                    LC000 LD      LC900     INITIALIZE THE WORD         N0133240
                          STO  I  WDCNT     *COUNT TO ONE               N0133250
                    *                                                   N0133260
                    *     INSPECT THE CONTENTS OF COLUMN 7              N0133270
                    *                                                   N0133280
                          LDX   1 -74       POINT XR1 TO COLUMN 7       N0133290
                          LD   L1 @SBFR+80  FETCH COLUMN 7              N0133300
                          S       FR902     TEST FOR AND                N0133310
                          BSC  L  LC040,Z   *BRANCH IF NOT A COMMA      N0133320
                    *                                                   N0133330
                    *     MAINLINE NAME NOT GIVEN                       N0133340
                    *                                                   N0133350
                          SLT     32        SET MAINLINE                N0133360
                          STD   3 NAMEX-X35 *NAME BLANK                 N0133370
                          LDD     LC900     SET EXT SW TO STORE 2 WORDS N0133380
                          BSI  L  FB000     BR TO STORE NAME TO BUFFER  N0133390
                          MDX   1 1         INCREMENT THE COLUMN COUNT  N0133400
                    *                                                   N0133410
                    *     MAINLINE NAME GIVEN                           N0133420
                    *                                                   N0133430
                    LC040 BSI  L  FN000     BRANCH TO FETCH THE NAME    N0133440
                          MDX  L  COLSW,0   SK IF 1ST COL OF NAME BLANK N0133450
                          MDX     LC080                                 N0133460
                    *                                                   N0133470
                    *     FIRST CHARACTER OF NAME BLANK                 N0133480
                    *                                                   N0133490
                    LC060 LDX   2 4         POINT TO ERROR MESSAGE M 24 N0133500
                          BSI  L  LFERR     BRANCH TO PRINT THE MESSAGE N0133510
                    *                                                   N0133520
                    *     STORE THE NAME TO THE SCRA I/O BUFFER         N0133530
                    *                                                   N0133540
                    LC080 LDD     LC900     SET EXT SW TO STORE 2 WORDS N0133550
                          BSI  L  FB000     BRANCH TO STORE THE NAME    N0133560
                    *                                                   N0133570
                          LD    3 COLSW-X35 FETCH THE COLUMN SWITCH     N0133580
                          BSC  L  LF140,+   BRANCH IF NEXT COLUMN BLANK N0133590
                          MDX   1 1         INCR COL CNT, SKIP IF ZERO  N0133600
                          MDX     LC160                                 N0133610
                    *                                                   N0133620
                    *     RECORD IS CONTINUED, READ CONTINUATION RECORD N0133630
                    *                                                   N0133640
                    LC120 BSI  L  RR000     BRANCH TO READ A RECORD     N0133650
                          BSI  L  DT000     BR TO DETERMINE TYPE OF RCD N0133660
                          LDX   1 -74       POINT XR1 TO COLUMN 7       N0133670
                          LD    3 TYPE1-X35 IF THIS RECORD OF SAME TYPE N0133680
                          S     3 TYPE2-X35 *AS LAST RECORD BRANCH      N0133690
                          BSC  L  LC160,+-  *TO PROCESS THE RECORD      N0133700
                    *                                                   N0133710
                    *     THE RECORD JUST READ WAS NOT A CONTINUATION   N0133720
                    *                                                   N0133730
                    LC140 LDX   2 3         POINT TO ERROR MESSAGE M 23 N0133740
                          BSI  L  LFERR     BRANCH TO PRINT THE MESSAGE N0133750
                    *                                                   N0133760
                    *     TEST FOR END OF RECORD                        N0133770
                    *                                                   N0133780
                    LC160 LD   L1 @SBFR+80  FETCH THE NEXT CHARACTER    N0133790
                          S       FR901     TEST FOR AND                N0133800
                          BSC  L  LC120,+-  *BRANCH IF BLANK            N0133810
                    *                                                   N0133820
                    *     FETCH A SUBROUTINE NAME                       N0133830
                    *                                                   N0133840
                    LC180 MDX     LC040      GO FETCH A MAME        2-8 N0133850
                    *                                                   N0133860
                    *     CONSTANTS AND WORK AREA                       N0133870
                    *                                                   N0133880
                    LC900 DC      1         CONSTANT ONE                N0133890
                          HDNG    SUPV PHASE 5 - SUPV CTRL RCD PROC     N0133920
                    *                                                   N0133930
                    *     PROCESS FILES RECORDS                         N0133940
                    *                                                   N0133950
                    FR000 LD      FR900     INITIALIZE THE WORD         N0133960
                          STO  I  WDCNT     *COUNT TO ONE               N0133970
                    FR010 LDX   1 -74       POINT XR1 TO COL 7      2-7 N0133980
                    FR012 LD   L1 @SBFR+80   FETCH CHAR            2-10 N0133990
                          S       FR903      TEST FOR LEFT BRACKET  2-7 N0134000
                          MDX   1 1          INCREMENT COL COUNT    2-7 N0134010
                          MDX     FR015      CONTINUE IF NOT ZERO   2-8 N0134020
                    FR069 LDX   2 3          POINT TO ERROR MSG M23 2-8 N0134030
                    FR070 BSI  L  LFERR      PRINT ERR MSG AND EXIT 2-8 N0134040
                    FR015 BSC  L  FR020,+-   BR IF LEFT BRACKET     2-7 N0134050
                          LDX   2 1          POINT TO ERROR MSG M21 2-7 N0134060
                          MDX     FR070      BR TO PRINT ERROR MSG  2-7 N0134070
                    *                                                   N0134080
                    *     FETCH AND STORE FILE NUMBER (DECIMAL)         N0134090
                    *                                                   N0134100
                    FR020 BSI  L  FR100     BR TO FETCH AND CONVERT NO. N0134110
                          SLT     32        SET EXT SW TO STORE 1 WORD  N0134120
                          BSI  L  FB000     BR TO STORE NO. TO I/O BUFR N0134130
                    *                                                   N0134140
                    *     FETCH AND STORE FILE NAME                     N0134150
                    *                                                   N0134160
                          LD   L1 @SBFR+80  FETCH THE NEXT CHARACTER    N0134170
                          S       FR902     TEST FOR AND                N0134180
                          BSC  L  FR030,Z   *BRANCH IF NOT A COMMA      N0134190
                          SLT     32        SET FILE NAME               N0134200
                          STD   3 NAMEX-X35 *BLANK                      N0134210
                          LDD     FR900     SET EXT SW TO STORE 2 WORDS N0134220
                          BSI  L  FB000     BRANCH TO STORE FILE NAME   N0134230
                          MDX     FR040     BRANCH TO FETCH CART ID     N0134240
                    *                                                   N0134250
                    FR030 BSI  L  FN000     BR TO FETCH & CONVERT NAME  N0134260
                          LD    3 COLSW-X35 FETCH THE COLUMN SWITCH     N0134270
                          BSC  L  LC060,+   BRANCH IF BLANK FORE OR AFT N0134280
                          SRT     16        SET EXT SW TO STORE 2 WORDS N0134290
                          BSI  L  FB000     BRANCH TO STORE FILE NAME   N0134300
                    *                                                   N0134310
                    *     TEST FOR THE PRESENCE OF CARTRIDGE ID         N0134320
                    *                                                   N0134330
                          LD    3 COLSW-X35 FETCH THE COLUMN SWITCH     N0134340
                          S       FR900     TEST FOR AND BRANCH         N0134350
                          BSC  L  FR040,+   *IF NOT A RIGHT PARENTHESIS N0134360
                          SLT     32        SET                         N0134370
                          STD   3 NAMEX-X35 *CARTRIDGE ID BLANK         N0134380
                          MDX     FR060     BRANCH TO STORE CART ID     N0134390
                    *                                                   N0134400
                    *     FETCH AND STORE CARTRIDGE ID (HEXADECIMAL)    N0134410
                    *                                                   N0134420
                    FR040 BSI  L  FR200     BRANCH TO FETCH CART ID     N0134430
                          SLT     32        SET EXT SW TO STORE 1 WORD  N0134440
                    FR060 BSI  L  FB000     BRANCH TO STORE CART ID     N0134450
                    *                                                   N0134460
                    *     TEST FOR END OF RECORD                        N0134470
                    *                                                   N0134480
                          MDX   1 1         INCR COL CNT, SKIP IF ZERO  N0134490
                          MDX     *+1                                   N0134500
                          MDX     FR080     BR TO READ NEXT RCD         N0134510
                          LD   L1 @SBFR+80  FETCH THE NEXT CHARACTER    N0134520
                          S       FR901     TEST FOR AND                N0134530
                          BSC  L  FR080,+-  *BRANCH IF BLANK            N0134540
                          MDX   1 1         INCR COL CNT, SKIP IF ZERO  N0134550
                          MDX     *+1                                   N0134560
                          MDX     FR080     BR TO READ CONTINUATION RCD N0134570
                          LD   L1 @SBFR+80  FETCH THE NEXT CHARACTER    N0134580
                          S       FR901     TEST FOR AND                N0134590
                          BSC  L  FR080,+-  *BRANCH IF BLANK            N0134600
                          MDX     FR012      BR TO GET NEXT FILE    2-8 N0134610
                    *                                                   N0134620
                    *     RECORD IS CONTINUED, READ CONTINUATION RECORD N0134630
                    *                                                   N0134640
                    FR080 BSI  L  RR000     BRANCH TO READ A RECORD     N0134650
                          BSI  L  DT000     BR TO DETERMINE TYPE OF RCD N0134660
                          LD    3 TYPE1-X35 IF THIS RECORD OF SAME TYPE N0134670
                          S     3 TYPE2-X35 *AS LAST RECORD BRANCH      N0134680
                          BSC  L  LF130,Z   BR TO PROCESS NEW RCD   2-7 N0134690
                          MDX     FR010     BR TO PROCESS CONT RCD  2-7 N0134700
                    *                                                   N0134710
                    *     CONSTANTS AND WORK AREA                       N0134720
                    *                                                   N0134730
                    FR900 DC      1         CONSTANT ONE                N0134740
                    FR901 DC      /0040     EBCDIC BLANK                N0134750
                    FR902 DC      /006B     EBCDIC COMMA                N0134760
                    FR903 DC      /004D     EBCDIC LEFT PARENTHESIS 2-7 N0134770
                          HDNG    SUPV PHASE 5 - SUPV CTRL RCD PROC     N0134780
                    *                                                   N0134790
                    *     FETCH AND CONVERT FILE NUMBER                 N0134800
                    *                                                   N0134810
                    FR100 DC      *-*       ENTRY/RETURN ADDRESS        N0134820
                    *                                                   N0134830
                          LD   L1 @SBFR+80  FETCH FIRST CHARACTER       N0134840
                          S       FR910     MASK AND                    N0134850
                          BSC  L  FR170,Z+  *BRANCH IF NOT NUMERIC      N0134860
                          STO   3 NAMEX-X35 INITIALIZE SUM              N0134870
                    *                                                   N0134880
                          LDX   2 -5        CHARACTER COUNT TO XR2      N0134890
                    *                                                   N0134900
                    FR120 MDX   1 1         INCR COL CNT, SKIP IF ZERO  N0134910
                          MDX     FR160                                 N0134920
                    *                                                   N0134930
                    FR140 MDX     FR069     BR TO PRINT ERROR MSG   2-7 N0134940
                    *                                                   N0134950
                    FR160 LD   L1 @SBFR+80  FETCH THE NEXT CHARACTER    N0134960
                          S       FR902     TEST FOR AND                N0134970
                          BSC  L  FR190,+-  *BRANCH IF A COMMA          N0134980
                    *                                                   N0134990
                          MDX   2 1         INCR CHAR CNT, SKIP IF ZERO N0135000
                          MDX     FR180     BRANCH TO FETCH NEXT CHAR   N0135010
                    *                                                   N0135020
                    FR170 LDX   2 5         POINT TO ERROR MESSAGE M 25 N0135030
                    FR171 MDX     FR070     BR TO PRINT ERROR MSG   2-7 N0135040
                    FR180 LD   L1 @SBFR+80  FETCH THE CHARACTER AGAIN   N0135050
                          S       FR910     MASK AND                    N0135060
                          BSC  L  FR170,Z+  *BRANCH IF NOT NUMERIC      N0135070
                          STO     FR913     SAVE THE NUMBER             N0135080
                          LD    3 NAMEX-X35 FETCH THE SUM               N0135090
                          M       FR912     MULTIPLY BY TEN             N0135100
                          SLT     16        SHIFT PRODUCT TO ACC        N0135110
                          A       FR913     ADD THE NUMBER              N0135120
                          STO   3 NAMEX-X35 SAVE THE NEW SUM            N0135130
                          MDX     FR120                                 N0135140
                    *                                                   N0135150
                    FR190 MDX   1 1         POINT TO COLUMN AFTER COMMA N0135160
                          MDX     *+1       SKIP                        N0135170
                          MDX     FR140     BRANCH IF RECORD OVER-RUN   N0135180
                    *                                                   N0135190
                          BSC  I  FR100     RETURN                      N0135200
                    *                                                   N0135210
                    *     CONSTANTS AND WORK AREA                       N0135220
                    *                                                   N0135230
                    FR910 DC      /00F0     NUMERIC MASK                N0135240
                    FR912 DC      10        CONSTANT TEN                N0135250
                    FR913 DC      *-*       TEMPORARY STORAGE           N0135260
                          HDNG    SUPV PHASE 5 - SUPV CTRL RCD PROC     N0135270
                    *                                                   N0135280
                    *     FETCH AND CONVERT CARTRIDGE ID                N0135290
                    *                                                   N0135300
                    FR200 DC      *-*       ENTRY/RETURN ADDRESS        N0135310
                    *                                                   N0135320
                          SLA     16        INITAILIZE                  N0135330
                          STO   3 NAMEX-X35 *THE CARTRIDGE ID           N0135340
                          LDX   2 -5        CHARACTER COUNT TO XR2      N0135350
                    *                                                   N0135360
                    FR210 MDX   1 1         INCR COL CNT, SKIP IF ZERO  N0135370
                          MDX     FR230                                 N0135380
                    *                                                   N0135390
                    FR220 MDX     FR140     BR TO PRINT ERROR MSG   2-7 N0135400
                    *                                                   N0135410
                    FR230 LD   L1 @SBFR+80  FETCH A CHARACTER           N0135420
                          S       FR920     TEST FOR AND BRANCH         N0135430
                          BSC  L  FR270,+-  *IF A RIGHT PARENTHESIS     N0135440
                    *                                                   N0135450
                          MDX   2 1         INCR CHAR CNT, SKIP IF ZERO N0135460
                          MDX     FR250                                 N0135470
                    *                                                   N0135480
                    FR240 LDX   2 7         POINT TO ERROR MESSAGE M 27 N0135490
                          MDX     FR171     BR TO PRINT ERROR MSG   2-7 N0135500
                    *                                                   N0135510
                    FR250 LD   L1 @SBFR+80  FETCH THE CHARACTER AGAIN   N0135520
                          S       FR910     TEST FOR AND                N0135530
                          BSC  L  FR260,-   *BRANCH IF NUMERIC          N0135540
                          SLA     12        CLEAR BIT                   N0135550
                          SRA     12        *POSITIONS 0-11             N0135560
                          A       FR922     CONVERT TO ALPHABETIC       N0135570
                          SRT     4         SAVE BITS 12-15             N0135580
                          LD   L1 @SBFR+80  FETCH CHARATER         2-10 N0135591
                          S       FR925     COMPARE TO EBC F       2-10 N0135592
                          BSC     -Z        SKIP IF LESS OR EQUAL  2-10 N0135593
                          MDX     FR240     BR TO PR ERR MSG       2-10 N0135594
                          A       FR926     ADD C6-C1 (EBC F AND A)2-10 N0135595
                          BSC     +Z        SKIP IF IN RANGE       2-10 N0135596
                          MDX     FR240     BR TO PR ERR MSG       2-10 N0135597
                          SLA     16        CLEAR ACC              2-10 N0135598
                          SLT     4         RETURN TO ACCUMULATOR       N0135600
                    FR260 STO     FR924     SAVE THE CHARACTER          N0135610
                          LD    3 NAMEX-X35 FETCH PREVIOUS SUM          N0135620
                          M       FR923     MULTIPLY BY SIXTEEN         N0135630
                          SLT     16        SHIFT PRODUCT TO ACC        N0135640
                          A       FR924     ADD THE CHARACTER           N0135650
                          STO   3 NAMEX-X35 SAVE NEW SUM                N0135660
                          MDX     FR210     BR TO FETCH NEXT CHARACTER  N0135670
                    *                                                   N0135680
                    FR270 LD    3 NAMEX-X35 FETCH THE CARTRIDGE ID      N0135690
                          BSC  L  FR240,Z+  BRANCH IF NEGATIVE          N0135700
                    *                                                   N0135710
                          BSC  I  FR200     RETURN                      N0135720
                    *                                                   N0135730
                    *     CONSTANTS AND WORK AREA                       N0135740
                    *                                                   N0135750
                    FR920 DC      /005D     EBCDIC RIGHT PARENTHESIS    N0135760
                    FR922 DC      /0009     ALPHABETIC MASK             N0135770
                    FR923 DC      16        CONSTANT SIXTEEN            N0135780
                    FR924 DC      *-*       TEMPORARY STORAGE           N0135790
                    FR925 DC      /C6       EBCDIC F               2-10 N0135792
                    FR926 DC      5         /C6-/C1                2-10 N0135794
                          HDNG    SUPV PHASE 5 - SUPV CTRL RCD PROC 2G2 N0135800
                    *                                               2G2 N0135810
                    *     PROCESS G2250 RECORD                      2G2 N0135820
                    *                                               2G2 N0135830
                    GR000 LD      GR900     INITIALIZE THE WORD     2G2 N0135840
                          STO  I  WDCNT     *COUNT TO ONE           2G2 N0135850
                    *                                               2G2 N0135860
                    *     INSPECT CONTENTS OF COLUMN 7              2G2 N0135870
                    *                                               2G2 N0135880
                          LDX   1 -74                               2G2 N0135890
                          LD   L1 @SBFR+80  FETCH COLUMN 7          2G2 N0135900
                          S       GR902     TEST FOR AND            2G2 N0135910
                          BSC  L  GR010,Z   *BRANCH IF NON-BLANK    2G2 N0135920
                    *                                               2G2 N0135930
                    *     MAINLINE NAME NOT GIVEN                   2G2 N0135940
                    *                                               2G2 N0135950
                          SLT     32        SET                     2G2 N0135960
                          STD   3 NAMEX-X35 *MAINLINE NAME BLANK    2G2 N0135970
                          MDX     GR020                             2G2 N0135980
                    *                                               2G2 N0135990
                    *     MAINLINE NAME GIVEN                       2G2 N0136000
                    *                                               2G2 N0136010
                    GR010 BSI  L  FN000     FETCH MAINLINE NAME     2G2 N0136020
                          MDX  L  COLSW,0   SKIP IF COLUMN 1 BLANK  2G2 N0136030
                          MDX     GR020     BRANCH TO STORE NAME    2G2 N0136040
                          LDX   2 4         POINT TO ERROR MSG 24   2G2 N0136050
                          BSI  L  LFERR     BRANCH TO PRINT THE MSG 2G2 N0136060
                    *                                               2G2 N0136070
                    *     CONSTANTS AND WORK AREAS                  2G2 N0136080
                    *                                               2G2 N0136090
                    GR900 DC      1         CONSTANT ONE            2G2 N0136100
                    GR902 DC      /0040     EBCDIC BLANK            2G2 N0136110
                          BSS  E  0         FORCE NEXT LOC EVEN     2G2 N0136120
                    GR905 DN      GCOM      GSP CONTROL ARRAY       2G2 N0136130
                    GR906 DN      GCHAR     ALL CHARACTERS          2G2 N0136140
                    GR907 DN      GUPER     UPPER CASE CHARS,NUM,SP 2G2 N0136150
                    GR908 DN      GSP06     SCISSOR SUBROUTINE      2G2 N0136160
                    GR909 DC      /0095     EBCDIC N - BLANK        2G2 N0136170
                    GR910 DC      /00E4     EBCDIC U                2G2 N0136180
                    GR911 DN      GSP05     EBBC PUSH UP SUBROUTINE 2G2 N0136190
                    GR912 DN      GSP12     LEVEL ENTITY SUPPORT    2G2 N0136200
                    GR913 DN      GSP11     INDEX ENTITY SEARCH     2G2 N0136210
                    *                                               2G2 N0136220
                    *     STORE SUBROUTINE NAME TO SCRA BUFFER      2G2 N0136230
                    *                                               2G2 N0136240
                    GR015 DC      0         ENTRY/RETURN ADDRESS    2G2 N0136250
                          STD   3 NAMEX-X35 STORE NAME              2G2 N0136260
                          BSI  L  FB000     BR TO ST TO SCRA BUFFER 2G2 N0136270
                          BSC  I  GR015     RETURN                  2G2 N0136280
                    *                                               2G2 N0136290
                    *     STORE MAINLINE NAME TO SCRA BUFFER        2G2 N0136300
                    *                                               2G2 N0136310
                    GR020 LDD     GR900     SET EXT TO STORE 2 WDS  2G2 N0136320
                          BSI  L  FB000     STORE MAINLINE NAME     2G2 N0136330
                          LD      GR900     SET                     2G2 N0136340
                          STO  L  $GCOM     *GSP INDICATOR          2G2 N0136350
                    *                                               2G2 N0136360
                    *     STORE GCOM (GSP COMMUNICATIONS SUBR)      2G2 N0136370
                    *     TO SCRA RECORD                            2G2 N0136380
                    *                                               2G2 N0136390
                          LDD     GR905     FETCH 'GCOM' AND        2G2 N0136400
                          BSI     GR015     *BR TO STORE TO SCRA    2G2 N0136410
                    *                                               2G2 N0136420
                    *     CHARACTER STROKE SUBROUTINE OPTION        2G2 N0136430
                    *                                               2G2 N0136440
                          LD   L  @SBFR+12  FETCH COLUMN 13         2G2 N0136450
                          S       GR910     TEST FOR AND            2G2 N0136460
                          BSC  L  GR040,+-  *BRANCH IF 'U' (GUPER)  2G2 N0136470
                    *                                               2G2 N0136480
                          LD   L  @SBFR+12  FETCH COLUMN 13         2G2 N0136490
                          BSI     GR050     BR TO CK FOR BLANK OR N 2G2 N0136500
                          LDD     GR906     FETCH 'GCHAR'           2G2 N0136510
                    GR025 BSI     GR015     BR TO ST NAME TO SCRA   2G2 N0136520
                    *                                               2G2 N0136530
                    *     LEVEL-CONTROLLED ENTITY DIRECT ENTRY      2G2 N0136540
                    *     SUBROUTINE OPTION                         2G2 N0136550
                    *                                               2G2 N0136560
                          LD   L  @SBFR+20  FETCH COLUMN 21         2G2 N0136570
                          BSI     GR050     BR TO CK FOR BLANK OR N 2G2 N0136580
                          LDD     GR912     FETCH 'GSP12'           2G2 N0136590
                          BSI     GR015     BR TO ST NAME TO SCRA   2G2 N0136600
                    *                                               2G2 N0136610
                    *     SCISSOR SUBROUTINE OPTION                 2G2 N0136620
                    *                                               2G2 N0136630
                          LD   L  @SBFR+14  FETCH COLUMN 15         2G2 N0136640
                          BSI     GR050     BR TO CK FOR BLANK OR N 2G2 N0136650
                          LDD     GR908     FETCH 'GSP06'           2G2 N0136660
                          BSI     GR015     BR TO ST NAME TO SCRA   2G2 N0136670
                    *                                               2G2 N0136680
                    *     EBBC PUSH UP SUBROUTINE OPTION            2G2 N0136690
                    *                                               2G2 N0136700
                          LD   L  @SBFR+16  FETCH COLUMN 17         2G2 N0136710
                          BSI     GR050     BR TO CK FOR BLANK OR N 2G2 N0136720
                          LDD     GR911     FETCH 'GSP05'           2G2 N0136730
                          BSI     GR015     BR TO ST NAME TO SCRA   2G2 N0136740
                    *                                               2G2 N0136750
                    *     INDEX-CONTROLLED ENTITY SEARCH            2G2 N0136760
                    *     SUBROUTINE OPTION                         2G2 N0136770
                    *                                               2G2 N0136780
                          LD   L  @SBFR+18  FETCH COLUMN 19         2G2 N0136790
                          BSI     GR050     BR TO CK FOR BLANK OR N 2G2 N0136800
                          LDD     GR913     FETCH 'GSP11'           2G2 N0136810
                          BSI     GR015     BR TO ST NAME TO SCRA   2G2 N0136820
                    *                                               2G2 N0136830
                          BSC  L  LF140     BR TO FETCH NEXT RECORD 2G2 N0136840
                    *                                               2G2 N0136850
                    *     UPPER CASE CHARACTERS, NUMERIC AND        2G2 N0136860
                    *     SPECIAL CHARACTERS SUBROUTINE OPTION      2G2 N0136870
                    *                                               2G2 N0136880
                    GR040 LDD     GR907     FETCH 'GUPER'           2G2 N0136890
                          MDX     GR025     BR TO STORE NAME        2G2 N0136900
                    *                                               2G2 N0136910
                    *     CHECK A COLUMN FOR BLANK OR 'N'           2G2 N0136920
                    *                                               2G2 N0136930
                    GR050 DC      0         ENTRY/RETURN ADDRESS    2G2 N0136940
                          S       GR902     TEST FOR AND            2G2 N0136950
                          BSC  I  GR050,+-  *BRANCH IF COLUMN BLANK 2G2 N0136960
                          S       GR909     TEST FOR AND            2G2 N0136970
                          BSC  L  GR060,Z   *BR IF COLUMN NOT 'N'   2G2 N0136980
                          MDX  L  GR050,2   INCREMENT RETURN ADDR   2G2 N0136990
                          BSC  I  GR050     *AND RETURN             2G2 N0137000
                    *                                               2G2 N0137010
                    *     INVALID CHARACTER DETECTED IN *G2250      2G2 N0137020
                    *     OPTION COLUMN                             2G2 N0137030
                    *                                               2G2 N0137040
                    GR060 LDX   2 9         POINT TO ERROR MSG M 30 2G2 N0137050
                          BSI  L  LFERR     BRANCH TO PRINT THE MSG 2G2 N0137060
                          HDNG    SUPV PHASE 5 - SUPV CTRL RCD PROC 2-4 N0137070
                    *                                               2-4 N0137080
                    *     PROCESS EQUAT RECORDS                     2-4 N0137090
                    *                                               2-4 N0137100
                    EQ000 LD      EQ900     INITIALIZE              2-4 N0137110
                          STO  I  WDCNT     *THE WORD COUNT TO ONE  2-4 N0137120
                    EQ010 LDX   1 -74       XR1 POINTS TO COLUMN 7  2-4 N0137130
                    *                                               2-4 N0137140
                    EQ020 LD   L1 @SBFR+80  FETCH THE COLUMN        2-4 N0137150
                          S       EQ902     TEST FOR AND            2-4 N0137160
                          BSC  L  EQ080,+-  BRANCH IF BLANK         2-6 N0137170
                          LD   L1 @SBFR+80  FETCH THE COLUMN AGAIN  2-4 N0137180
                          S       EQ903     TEST FOR AND BRANCH     2-4 N0137190
                          BSC  L  EQ080,Z   *IF NOT LEFT PAREN      2-4 N0137200
                          MDX   1 1         INCREMENT COL POINTER   2-4 N0137210
                          MDX     EQ030     BRANCH TO FETCH NAME    2-4 N0137220
                          MDX     EQ070     BR TO PRINT MSG M 23    2-4 N0137230
                    *                                               2-4 N0137240
                    EQ030 LD      EQ905     INCREMENT               2-4 N0137250
                          A       EQ900     *THE                    2-4 N0137260
                          STO     EQ905     *NUMBER OF PAIRS        2-4 N0137270
                          S       EQ906     TEST FOR AND BRANCH     2-4 N0137280
                          BSC  L  EQ090,Z-  *IF GREATER THAN TEN    2-4 N0137290
                          BSI  L  FN000     FETCH 1ST NAME OF PAIR  2-4 N0137300
                          LD    3 COLSW-X35 TEST FOR AND            2-4 N0137310
                          BSC  L  EQ070,+-  *BRANCH IF NO NAME      2-4 N0137320
                          LDD     EQ900     SET EXT SW TO ST 2 WDS  2-4 N0137330
                          BSI  L  FB000     BRANCH TO STORE NAME    2-4 N0137340
                          LD    3 COLSW-X35 TEST FOR                2-4 N0137350
                          S       EQ900     *AND BRANCH IF NAME     2-4 N0137360
                          BSC  L  EQ070,Z   *NOT FOLLOWED BY COMMA  2-4 N0137370
                          MDX   1 1         INCREMENT COL POINTER   2-4 N0137380
                          MDX     EQ040     BRANCH TO FETCH NAME    2-4 N0137390
                          MDX     EQ070     BR TO PRINT MSG M 23    2-4 N0137400
                    *                                               2-4 N0137410
                    EQ040 BSI  L  FN000     FETCH 2ND NAME OF PAIR  2-4 N0137420
                          LD    3 COLSW-X35 TEST FOR AND            2-4 N0137430
                          BSC  L  EQ070,+-  *BRANCH IF NO NAME      2-4 N0137440
                          LDD     EQ900     SET EXT SW TO ST 2 WDS  2-4 N0137450
                          BSI  L  FB000     BRANCH TO STORE NAME    2-4 N0137460
                          LD    3 COLSW-X35 TEST FOR                2-4 N0137470
                          S       EQ901     *AND BRANCH IF NAME NOT 2-4 N0137480
                          BSC  L  EQ080,Z   *FOLLOWED BY RT PAREN   2-4 N0137490
                          MDX   1 1         INCREMENT COL POINTER   2-4 N0137500
                          MDX     EQ050     BRANCH TO CONTINUE      2-4 N0137510
                          MDX     EQ060     BR TO FETCH NEXT RECORD 2-4 N0137520
                    *                                               2-4 N0137530
                    EQ050 LD   L1 @SBFR+80  FETCH THE COLUMN        2-4 N0137540
                          S       EQ902     TEST FOR AND            2-4 N0137550
                          BSC  L  EQ060,+-  *BRANCH IF BLANK        2-4 N0137560
                          LD   L1 @SBFR+80  FETCH THE COLUMN AGAIN  2-4 N0137570
                          S       EQ904     TEST FOR AND            2-4 N0137580
                          BSC  L  EQ080,Z   *BRANCH IF NOT COMMA    2-4 N0137590
                          MDX   1 1         INCREMENT COL POINTER   2-4 N0137600
                          MDX     EQ020     BR TO PROC NEXT PAIR    2-4 N0137610
                    *                                               2-4 N0137620
                    EQ060 BSI  L  RR000     BRANCH TO READ A RECORD 2-4 N0137630
                          BSI  L  DT000     BR TO DETERMINE TYPE    2-4 N0137640
                          LD    3 TYPE1-X35 IF THIS RECORD OF SAME  2-4 N0137650
                          S     3 TYPE1-X35 *TYPE AS LAST RECORD    2-4 N0137660
                          BSC  L  EQ010,+-  *BRANCH TO PROCESS      2-4 N0137670
                    *                                               2-4 N0137680
                    *     PRINT 'M 23 INCORRECT CONTINUATION'       2-4 N0137690
                    *                                               2-4 N0137700
                    EQ070 LDX   2 3         POINT TO ERROR MSG M 23 2-4 N0137710
                          MDX     EQ100     BRANCH TO PRINT THE MSG 2-4 N0137720
                    *                                               2-4 N0137730
                    *     PRINT 'M 24 ILLEGAL CHARACTER IN RECORD'  2-4 N0137740
                    *                                               2-4 N0137750
                    EQ080 LDX   2 4         POINT TO ERROR MSG M 24 2-4 N0137760
                          MDX     EQ100     BRANCH TO PRINT THE MSG 2-4 N0137770
                    *                                               2-4 N0137780
                    *     PRINT 'M 28 SCRA BUFFER OVERFLOW'         2-4 N0137790
                    *                                               2-4 N0137800
                    EQ090 LDX   2 8         POINT TO ERROR MSG M 28 2-4 N0137810
                    EQ100 BSI  L  LFERR     BRANCH TO PRINT THE MSG 2-4 N0137820
                    *                                               2-4 N0137830
                    *     CONSTANTS AND WORK AREAS                  2-4 N0137840
                    *                                               2-4 N0137850
                    EQ900 DC      1         CONSTANT ONE            2-4 N0137860
                    EQ901 DC      2         CONSTANT TWO            2-4 N0137870
                    EQ902 DC      /0040     EBCDIC BLANK            2-4 N0137880
                    EQ903 DC      /004D     EBCDIC LEFT PARENTHESIS 2-4 N0137890
                    EQ904 DC      /006B     EBCDIC COMMA            2-4 N0137900
                    EQ905 DC      *-*       NUMBER OF PAIRS         2-4 N0137910
                    EQ906 DC      25        MAXIMUM NUMBER OF PAIRS 2-8 N0137920
                          HDNG    SUPV PHASE 5 - SUPV CTRL RCD PROC     N0137930
                    *                                                   N0137940
                    *     DETERMINE TYPE OF SUPERVISOR CONTROL RECORD   N0137950
                    *                                                   N0137960
                    DT000 DC      *-*       ENTRY/RETURN ADDRESS        N0137970
                    *                                                   N0137980
                          LDX   1 1         TYPE COUNT TO XR1           N0137990
                          LDX   2 -10       WORD COUNT TO XR2       2-4 N0138000
                    *                                                   N0138010
                    DT020 LDD  L  PBUFR     FETCH NAME FROM BUFFER      N0138020
                          SD   L2 DT900+10  SUBTRACT A SCR NAME     2-4 N0138030
                          BSC  L  DT040,Z   BR IF FIRST HALF NOT EQUAL  N0138040
                          SLT     16        SHIFT 2ND HALF DIFF TO ACC  N0138050
                          BSC  L  DT060,+-  BR IF SECOND HALF EQUAL     N0138060
                    DT040 MDX   1 1         INCREMENT TYPE COUNT        N0138070
                          MDX   2 2         INCR WORD CNT, SKIP IF ZERO N0138080
                          MDX     DT020     BRANCH TO TEST NEXT NAME    N0138090
                    *                                                   N0138100
                          LDX   2 1         POINT TO ERROR MESSAGE M 21 N0138110
                    DT050 BSI  L  LFERR     BRANCH TO PRINT THE MESSAGE N0138120
                    *                                                   N0138130
                    DT060 STX  L1 TYPE1     SAVE THE RECORD TYPE CODE   N0138140
                          LD   L  JOBXQ     IS EQUAT ALLOWED        2-4 N0138150
                          BSC  L  DT080,Z   *BR IF NO               2-4 N0138160
                          MDX   1 -4        IF TYPE1 IS EQUAT       2-4 N0138170
                          MDX     DT100     *THEN BR TO RETURN      2-4 N0138180
                          MDX     DT200     *OTHERWISE PRINT ERR MSG2-4 N0138190
                    *                                               2-4 N0138200
                    DT080 MDX   1 -4        IF TYPE1 IS EQUAT       2-4 N0138210
                          MDX     DT200     *THEN PRINT ERR MSG     2-4 N0138220
                    *                                               2-4 N0138230
                    DT100 LDX  I1 TYPE1     SET TO TYPE             2-4 N0138240
                          BSC  I  DT000     RETURN                  2-4 N0138250
                    *                                               2-4 N0138260
                    DT200 LDX   2 2         POINT AT MESSAGE M22    2-4 N0138270
                          MDX     DT050                             2-4 N0138280
                    *                                                   N0138290
                    *     CONSTANTS AND WORK AREA                       N0138300
                    *                                                   N0138310
                          BSS  E  0                                     N0138320
                    DT900 EBC     .*LOC.                                N0138330
                          EBC     .*NOC.                                N0138340
                          EBC     .*FIL.                                N0138350
                          EBC     .*G22.                            2G2 N0138360
                          EBC     .*EQU.                            2-4 N0138370
                          HDNG    SUPV PHASE 5 - SUPV CTRL RCD PROC     N0138380
                    *                                                   N0138390
                    *     STORE ONE OR TWO WORDS TO THE SCRA I/O BUFFER N0138400
                    *                                                   N0138410
                    FB000 DC      *-*       ENTRY/RETURN ADDRESS        N0138420
                    *                                                   N0138430
                          LDX  L2 *-*       BUFFER COUNT TO XR2         N0138440
                    BFCNT EQU     *-1                                   N0138450
                          MDX   2 1         INCR BUFR CNT, SKIP IF ZERO N0138460
                          MDX     FB040     BRANCH TO STORE WORD        N0138470
                    *                                                   N0138480
                    *     SCRA BUFFER FILLED                            N0138490
                    *                                                   N0138500
                    FB020 LDX   2 8         POINT TO ERROR MESSAGE M 28 N0138510
                          BSI  L  LFERR     BRANCH TO PRINT THE MESSAGE N0138520
                    *                                                   N0138530
                    *     STORE A WORD                                  N0138540
                    *                                                   N0138550
                    FB040 LD    3 NAMEX-X35 STORE A WORD TO             N0138560
                          STO  L2 SCRAB+640 *THE SCRA I/O BUFFER        N0138570
                          LD   I  WDCNT     INCREMENT                   N0138580
                          A       FB900     THE                         N0138590
                          STO  I  WDCNT     WORD COUNT                  N0138600
                    *                                                   N0138610
                          SLT     16        SHIFT WORD SWITCH TO ACC    N0138620
                          BSC  L  FB060,+-  BRANCH IF ONLY ONE WORD     N0138630
                    *                                                   N0138640
                    *     STORE THE SECOND WORD                         N0138650
                    *                                                   N0138660
                          MDX   2 1         INCR BUFR CNT, SKIP IF ZERO N0138670
                          MDX     *+1       SKIP                        N0138680
                          MDX     FB020     BR TO FETCH ERROR MESSAGE   N0138690
                          LD    3 NAMEX-X35+1 STORE A WORD TO           N0138700
                          STO  L2 SCRAB+640 *THE SCRA I/O BUFFER        N0138710
                          LD   I  WDCNT     INCREMENT                   N0138720
                          A       FB900     THE                         N0138730
                          STO  I  WDCNT     WORD COUNT                  N0138740
                    *                                                   N0138750
                    FB060 STX   2 BFCNT     SAVE BUFFER COUNT           N0138760
                          BSC  I  FB000     RETURN                      N0138770
                    *                                                   N0138780
                    *     CONSTANTS AND WORK AREA                       N0138790
                    *                                                   N0138800
                    FB900 DC      1         CONSTANT ONE                N0138810
                          HDNG    SUPV PHASE 5 - SUPV CTRL RCD PROC     N0138820
                    *                                                   N0138830
                    *     FETCH A NAME AND CONVERT TO NAME CODE         N0138840
                    *                                                   N0138850
                    FN000 DC      *-*       ENTRY/RETURN ADDRESS        N0138860
                    *                                                   N0138870
                    *     CLEAR THE NAME AREA                           N0138880
                    *                                                   N0138890
                          LDX   2 -5        CHARACTER COUNT TO XR2      N0138900
                          LD      FN901     FETCH EBCDIC BLANK          N0138910
                    FN020 STO  L2 FN900+5   STORE TO NAME AREA          N0138920
                          MDX   2 1         INCR CHAR CNT, SKIP IF ZERO N0138930
                          MDX     FN020     BRANCH TO CLEAR NEXT WORD   N0138940
                    *                                                   N0138950
                    *     FETCH AND TEST THE FIRST CHARACTER            N0138960
                    *                                                   N0138970
                          LD   L1 @SBFR+80  FETCH FIRST CHARACTER       N0138980
                          S       FN901     TEST FOR AND                N0138990
                          BSC  L  FN040,Z   *BRANCH IF NOT BLANK        N0139000
                          SRA     16        ZERO INDICATES A            N0139010
                          STO   3 COLSW-X35 *BLANK FIRST COLUMN         N0139020
                          BSC  I  FN000     RETURN                      N0139030
                    *                                                   N0139040
                    *     STORE THE CHARACTERS                          N0139050
                    *                                                   N0139060
                    FN040 LDX   2 -5        CHARACTER COUNT TO XR2      N0139070
                          LD      FN903     SET UP EXTENSION            N0139080
                          SRT     7         *FOR COLUMN SWITCH          N0139090
                    *                                                   N0139100
                    FN060 LD   L1 @SBFR+80  FETCH FIRST CHARACTER       N0139110
                          STO  L2 FN900+5   STORE CHAR TO CONVERT AREA  N0139120
                          MDX   1 1         INCR COL CNT, SKIP IF ZERO  N0139130
                          MDX     *+1       SKIP                        N0139140
                          MDX     FN080     BRANCH IF END OF RECORD     N0139150
                    *                                                   N0139160
                          LD   L1 @SBFR+80  FETCH THE CHARACTER         N0139170
                          S       FN901     TEST FOR AND                N0139180
                          BSC  L  FN080,+-  *BRANCH IF A BLANK          N0139190
                    *                                                   N0139200
                          LD   L1 @SBFR+80  FETCH THE CHARACTER AGAIN   N0139210
                          S       FN902     TEST FOR AND                N0139220
                          BSC  L  FN100+1,+-  *BRANCH IF A COMMA        N0139230
                    *                                                   N0139240
                          LD   L1 @SBFR+80  FETCH THE CHARACTER AGAIN   N0139250
                          S       FN903     TEST FOR AND                N0139260
                          BSC  L  FN100,+-  *BRANCH IF A RIGHT PAREN    N0139270
                    *                                                   N0139280
                          MDX   2 1         INCR CHAR CNT, SKIP IF ZERO N0139290
                          MDX     FN060     BRANCH TO STORE THE CHAR    N0139300
                    *                                                   N0139310
                    *     NAME LONGER THAN FIVE CHARACTERS              N0139320
                    *                                                   N0139330
                    FN070 LDX   2 6         POINT TO ERROR MESSAGE M 26 N0139340
                          BSI  L  LFERR     BRANCH TO PRINT THE MESSAGE N0139350
                    *                                                   N0139360
                    *     SET SWITCH INDICATING CHARACTER ENDING NAME   N0139370
                    *                                                   N0139380
                    *                                                   N0139390
                    FN080 SLT     16        NEGATIVE INDICATES A BLANK  N0139400
                          MDX     FN120                                 N0139410
                    *                                                   N0139420
                    FN100 SLT     1         TWO INDICATES A LEFT PAREN  N0139430
                          SLT     1         ONE INDICATES A COMMA       N0139440
                    FN120 STO   3 COLSW-X35                             N0139450
                    *                                                   N0139460
                    *     CONVERT THE NAME TO NAME CODE                 N0139470
                    *                                                   N0139480
                          LDX  L2 FN900     ADDR OF CHAR BUFFER TO XR2  N0139490
                          BSI  L  LABCK     BRANCH TO CONVERSION SUBR   N0139500
                          MDX     *+1       SKIP ON NORMAL RETURN       N0139510
                          MDX     FN070     BR TO PRINT ERROR MESSAGE   N0139520
                          STD   3 NAMEX-X35 SAVE NAME                   N0139530
                          BSC  I  FN000     RETURN                      N0139540
                    *                                                   N0139550
                    *     CONSTANTS AND WORK AREA                       N0139560
                    *                                                   N0139570
                    FN900 BSS     5         CHARACTER BUFFER            N0139580
                    FN901 DC      /0040     EBCDIC BLANK                N0139590
                    FN902 DC      /006B     EBCDIC COMMA                N0139600
                    FN903 DC      /005D     EBCDIC RIGHT PARENTHESIS    N0139610
                          HDNG    SUPV PHASE 5 - SUPV CTRL RCD PROC     N0139620
                    *                                                   N0139630
                    *     READ AND PRINT A SUPERVISOR CONTROL RECORD    N0139640
                    *                                                   N0139650
                    RR000 DC      *-*       ENTRY/RETURN ADDRESS        N0139660
                    *                                                   N0139670
                          MDX  L  NORCD,0   SKIP IF RECORD COUNT ZERO   N0139680
                          MDX     RR020     BRANCH TO READ RECORD       N0139690
                    *                                                   N0139700
                    *     ALL SUPERVISOR CONTROL RECORDS HAVE BEEN READ N0139710
                    *                                                   N0139720
                          BSI  L  WR000     BR TO WRITE BUFFER TO SCRA  N0139730
                          LD   L  SCRAB-1   IF THE SECTOR JUST      2-4 N0139740
                          S    L  ASCRA+4   *WRITTEN WAS EQUAT      2-4 N0139750
                          BSC  L  $EXIT,+-  *BR TO FETCH THE MCRA   2-4 N0139760
                          BSC  L  LF200     RETURN - ALL RCDS PROCESSED N0139770
                    *                                                   N0139780
                    *     CLEAR THE SUPERVISOR BUFFER                   N0139790
                    *                                                   N0139800
                    RR020 LDX   2 80        SET THE                     N0139810
                          STX  L2 @SBFR-1   *WORD COUNT TO EIGHTY       N0139820
                          SRA     16        CLEAR THE ACCUMULATOR       N0139830
                    RR040 STO  L2 @SBFR-1   STORE TO SUPERVISOR BUFFER  N0139840
                          MDX   2 -1        DECR WORD CNT, SKIP IF ZERO N0139850
                          MDX     RR040     BRANCH TO CLEAR NEXT WORD   N0139860
                    *                                                   N0139870
                    *     READ A RECORD                                 N0139880
                    *                                                   N0139890
                    RR050 LD   L  SBADR     FETCH ADDR OF SUPV BUFFER   N0139900
                          SRT     16        SHIFT TO EXTENSION          N0139910
                          LD      RR901     FETCH READ FUNCTION CODE    N0139920
                          BSI  L  INPUT     BRANCH TO READ A RECORD     N0139930
                          MDX  L  $IBSY,0   SKIP NEXT IF READ COMPLETE  N0139940
                          MDX     *-3       BR TO TEST READ COMPLETE    N0139950
                    *                                                   N0139960
                    *     CONVERT THE RECORD TO EBCDIC CODE             N0139970
                    *                                                   N0139980
                          LD   L  SBADR     FETCH ADDR OF SUPV BUFFER   N0139990
                          BSI  I  CONVT     BR TO CONVERT THE RECORD    N0140000
                    *                                                   N0140010
                    *     PACK THE BUFFER TO TWO EBCDIC CHARACTERS/WORD N0140020
                    *                                                   N0140030
                          LDX   1 -80       UNPACKED WORD COUNT TO XR1  N0140040
                          LDX   2 0         PACKED WORD COUNT TO XR2    N0140050
                    RR060 LD   L1 @SBFR+80  FETCH A CHARACTER           N0140060
                          SLA     8         SHIFT TO LEFT HALF OF WORD  N0140070
                          OR   L1 @SBFR+81  MASK IN RIGHT HALF OF WD    N0140080
                          STO  L2 PBUFR     STORE TO PACKED BUFFER      N0140090
                          MDX   2 1         INCREMENT PACKED BUFFER CNT N0140100
                          MDX   1 2         INCR UPKD CNT, SKIP IF ZERO N0140110
                          MDX     RR060     BR TO PACK NEXT TWO CHAR    N0140120
                    *                                                   N0140130
                    * TEST IF RCD STARTS //                         2-8 N0140140
                    *                                               2-8 N0140150
                          LD      PBUFR     TEST IF RCD STARTS //   2-8 N0140160
                          S       RR903                             2-8 N0140170
                          BSC  L  RR070,Z   BRANCH IF NOT           2-8 N0140180
                          STX  L  $NXEQ     SET NON-XEQ SWITCH ON   2-8 N0140190
                          STX  L  $NDUP     SET NON-DUP SWITCH ON   2-8 N0140200
                          BSC  L  RA210     BRANCH TO MCRA          2-8 N0140210
                    *     PRINT THE RECORD                              N0140220
                    *                                                   N0140230
                    RR070 LD      PBADR     FETCH ADDRESS OF I/O AREA   N0140240
                          BSI  L  RA850     BRANCH TO PRINT THE RECORD  N0140250
                    *                                                   N0140260
                          MDX  L  NORCD,-1  DECREMENT THE NUMBER OF     N0140270
                          NOP               *SUPERVISOR CONTROL RECORDS N0140280
                          BSC  I  RR000     RETURN                      N0140290
                    *                                                   N0140300
                    *     CONSTANTS AND WORK AREA                       N0140310
                    *                                                   N0140320
                    RR900 DC      /7001     PRINT FUNCTION CODE         N0140330
                    RR901 DC      /7002     READ FUNCTION CODE          N0140340
                    LWDCT DC      *-*       ADDR OF LAST WORD COUNT     N0140360
                          BSS  E  0                                     N0140370
                    PBADR DC      PBUFR-1   ADDRESS OF PACKED BUFFER    N0140380
                          DC      @PBWC     WORD COUNT                  N0140390
                    PBUFR BSS     @PBWC     PACKED EBCDIC RECORD BUFFER N0140400
                    RR903 EBC     .//.                              2-8 N0140405
                          HDNG    SUPV PHASE 5 - SUPV CTRL RCD PROC     N0140410
                    *                                                   N0140420
                    *     WRITE THE SCRA I/O BUFFER TO THE DISK         N0140430
                    *                                                   N0140440
                    WR000 DC      *-*       ENTRY/RETURN ADDRESS        N0140450
                    *                                                   N0140460
                          LD    3 TYPE2-X35 IF LAST RECORD TYPE NOT SET N0140470
                          BSC  L  WR040,+-  *BRANCH TO CLEAR THE BUFFER N0140480
                          S       WR903     TEST FOR AND                N0140490
                          BSC  L  WR020,-   *BRANCH IF LAST WAS FILES   N0140500
                    *                                                   N0140510
                    *     WRITE THE BUFFER                              N0140520
                    *                                                   N0140530
                          LD   I  LWDCT     FETCH LAST WORD COUNT       N0140540
                          OR      WR902     -OR- IN NEGATIVE SIGN BIT   N0140550
                          STO  I  LWDCT     RESTORE LAST WORD COUNT     N0140560
                    WR020 LD      WR901     FETCH ADDR OF SCRA BUFFER   N0140570
                          SRT     16        SHIFT TO EXTENSION          N0140580
                          LD      WR900     FETCH WRITE FUNCTION CODE   N0140590
                          BSI  L  DZ000     BRANCH TO DISK WRITE        N0140600
                          MDX  L  $DBSY,0   SKIP NEXT IF WRITE COMPLETE N0140610
                          MDX     *-3       BR TO  TEST WRITE COMPLETE  N0140620
                    *                                                   N0140630
                    *     CLEAR THE SCRA BUFFER                         N0140640
                    *                                                   N0140650
                    WR040 LDX  L2 -640      WORD COUNT TO XR2           N0140660
                          SRA     16        CLEAR THE ACCUMULATOR       N0140670
                    WR060 STO  L2 SCRAB+640 STORE THE SCRA BUFFER       N0140680
                          MDX   2 1         INCR WORD CNT, SKIP IF ZERO N0140690
                          MDX     WR060     BRANCH TO CLEAR NEXT WORD   N0140700
                    *                                                   N0140710
                          LDX  L2 SCRAB     INITIALIZE THE ADDRESS OF   N0140720
                          STX  L2 WDCNT     *THE WD CNT OF THE BUFFER   N0140730
                          LD      WR040+1   INITIALIZE THE              N0140740
                          STO  L  BFCNT     *BUFFER COUNT               N0140750
                    WR080 BSC  I  WR000     RETURN                      N0140760
                    *                                                   N0140770
                    *     CONSTANTS AND WORK AREA                       N0140780
                    *                                                   N0140790
                          BSS  E  0                                     N0140800
                    WR900 DC      /0001     WRITE FUNCTION CODE         N0140810
                    WR901 DC      SCRAB-2   ADDRESS OF SCRA I/O BUFFER  N0140820
                    WR902 DC      /8000     NEGATIVE SIGN BIT           N0140830
                    WR903 DC      3         CONSTANT THREE              N0140840
                    SCRAB EQU     BUFFR-@SCTR  SUPV CONTROL RECORD BFR  N0140850
                    *                                                   N0140860
                    *                                                   N0140870
                          BSS     SCRAB-2-*-1  PATCH AREA           2-4 N0140880
                    *                                                   N0140890
                    *                                                   N0140900
                    LF999 DC      0         END OF PHASE 5 - SCRA PROC  N0140910
                          END     RA000                                 N0140920
